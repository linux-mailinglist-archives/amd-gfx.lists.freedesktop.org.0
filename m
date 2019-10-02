Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002CC9367
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 23:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7366E170;
	Wed,  2 Oct 2019 21:19:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEB96E0E8
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 21:06:45 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id q15so395669pll.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 14:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnuWp9o1RpgvITnmL7LTsPFljnPiknKKHQUHm98mrZ4=;
 b=LmqwttrxlZeJRQLVYQglcsiZElly+r8VQYR7IeDRRnUyPi8xSCEXE2UvpxR6uZUmos
 dLcmVdjg9QrGfiLoLcSTGWwNddqvLNu44rLIDhpvkW7BmIYtScb50OrjoT1svZTwXg+5
 aEzuVB/M8JnoMkETdLyXQk4vdd58wndT/cujWf6ftJ0sDz86DsSM0CH9EfovWS8zaujJ
 lMbqjE8UfarbFfxFMpx7hvfegP7oGBVAKhH7VMJ1WkhJ17Kpd57WTjpfGKN8BNraZmkV
 hoPnzZ+kiW7qa0bokKbFQAsLkoG3s9wrkGDDhlTJ9/6XV5Ggs4xsXoEQsuK09PR4KyHB
 iqVA==
X-Gm-Message-State: APjAAAUfEdW7Cm0/jSGDZ/jIgkOuRaoi+4Y7yL8OPC7QDYAXm07zlbyx
 kxWGiIYc9aFDtaA8vZpzAMW637uKTlecP1I0RLNNHg==
X-Google-Smtp-Source: APXvYqyU8Fl0l+rqi6339fDMhqJwPCU1m7omZfuV2qQaEQI4L5k50rkX+z9V7oon9o4K/aE/KPg7wYE2ofuxHA943P4=
X-Received: by 2002:a17:902:820e:: with SMTP id
 x14mr5819917pln.223.1570050404239; 
 Wed, 02 Oct 2019 14:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-7-arnd@arndb.de>
 <20191002165137.15726-1-ndesaulniers@google.com>
 <20191002170733.GB1076951@archlinux-threadripper>
In-Reply-To: <20191002170733.GB1076951@archlinux-threadripper>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Oct 2019 14:06:33 -0700
Message-ID: <CAKwvOdmfD-vYNw=YZKBhZhaK04BSMD9xjPJ4seqDe+keHb42_w@mail.gmail.com>
Subject: Re: [PATCH 6/6] [RESEND] drm/amdgpu: work around llvm bug #42576
To: Nathan Chancellor <natechancellor@gmail.com>
X-Mailman-Approved-At: Wed, 02 Oct 2019 21:19:49 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=nnuWp9o1RpgvITnmL7LTsPFljnPiknKKHQUHm98mrZ4=;
 b=T4cObNtQ9BzuXk1AzgmY3Sc75aW7mav2CcAKcsDLC6tJGSGN1Im2tyak5dQuBl6ooh
 rmucnO+yufqGKap3U20y1tKRMZk55Z4Fw+0X7NcpiKq7r8oElQt41NMSlgm5hQaoUOcn
 TI20pIZB5NLrwuZZ8s/oQQtaxMUSX1mbmXzZyoQITNYCDeyWL1T1RVrU5/01TcSOjB0k
 H87wCZj3EvU/uec0eHPlVmc+Y2Bv/0rzHKLpqB2/GgJUCZkyNx1xoOR4GVomTqOIMqis
 +Bd9tSeFBAsy36uaeeclC1Vd4eI3i7I4YHt44jyjQDrfw6rPA4VI0rPWsb02ik9U9ISP
 0hyw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, le.ma@amd.com, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 clang-built-linux <clang-built-linux@googlegroups.com>, ray.huang@amd.com,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 "Deucher, Alexander" <alexander.deucher@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAxMDowNyBBTSBOYXRoYW4gQ2hhbmNlbGxvcgo8bmF0ZWNo
YW5jZWxsb3JAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDAyLCAyMDE5IGF0IDA5
OjUxOjM3QU0gLTA3MDAsICdOaWNrIERlc2F1bG5pZXJzJyB2aWEgQ2xhbmcgQnVpbHQgTGludXgg
d3JvdGU6Cj4gPiA+IEFwcGFyZW50bHkgdGhpcyBidWcgaXMgc3RpbGwgcHJlc2VudCBpbiBib3Ro
IHRoZSByZWxlYXNlZCBjbGFuZy05Cj4gPiA+IGFuZCB0aGUgY3VycmVudCBkZXZlbG9wbWVudCB2
ZXJzaW9uIG9mIGNsYW5nLTEwLgo+ID4gPiBJIHdhcyBob3Bpbmcgd2Ugd291bGQgbm90IG5lZWQg
YSB3b3JrYXJvdW5kIGluIGNsYW5nLTkrLCBidXQKPiA+ID4gaXQgc2VlbXMgdGhhdCB3ZSBkby4K
CkhlcmUncyBhIGZpeDogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Q2ODM1NgpDYW4ndCBwb3Nz
aWJseSBsYW5kIHVudGlsIGNsYW5nLTEwIHRob3VnaC4KCj4gPgo+ID4gSSB0aGluayBJJ2QgcmF0
aGVyOgo+ID4gMS4gbWFyayBBTURHUFUgQlJPS0VOIGlmIENDX0lTX0NMQU5HLiBUaGVyZSBhcmUg
bnVtZXJvdXMgb3RoZXIgaXNzdWVzIGJ1aWxkaW5nCj4gPiAgICBhIHdvcmtpbmcgZHJpdmVyIGhl
cmUuCj4KPiBUaGUgb25seSByZWFzb24gSSBhbSBub3QgdGhyaWxsZWQgYWJvdXQgdGhpcyBpcyB3
ZSB3aWxsIGxvc2Ugb3V0IG9uCj4gd2FybmluZyBjb3ZlcmFnZSB3aGlsZSB0aGUgY29tcGlsZXIg
YnVnIGdldHMgZml4ZWQuIEkgdGhpbmsgdGhlIEFNREdQVQo+IGRyaXZlcnMgaGF2ZSBiZWVuIHRo
ZSBzaW5nbGUgYmlnZ2VzdCBzb3VyY2Ugb2YgY2xhbmcgd2FybmluZ3MuCj4KPiBJIHRoaW5rIHNv
bWV0aGluZyBsaWtlOgo+Cj4gZGVwZW5kcyBvbiBDQ19JU19HQ0MgfHwgKENDX0lTX0NMQU5HICYm
IENPTVBJTEVfVEVTVCkKPgo+IHdvdWxkIGVuZCB1cCBhdm9pZGluZyB0aGUgcnVudGltZSBpc3N1
ZXMgYW5kIGdpdmUgdXMgd2FybmluZyBjb3ZlcmFnZS4KPiBUaGUgb25seSBpc3N1ZSBpcyB0aGF0
IHdlIHdvdWxkIHN0aWxsIG5lZWQgdGhpcyBwYXRjaC4uLgo+Cj4gQ2hlZXJzLAo+IE5hdGhhbgoK
CgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
