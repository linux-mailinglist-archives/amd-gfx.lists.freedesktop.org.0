Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00305C9FF5
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 16:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CAE6E9E6;
	Thu,  3 Oct 2019 14:00:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BD589235
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 21:27:49 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id q1so402731pgb.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ff5/X8LijthYfBkRMosRh8V5DWdVMBmSJpWGhDefc4M=;
 b=t70DFhykoBcVMNDOnyGKNv99GvHE8im7vpuECvclUdzio+FPOV7hv2fuS66FB2IK6T
 8TDvlIYRS+OEA5ETOaF6qAFeufB7xWpSm8yOGl63HujQL4LwmSYbHc/ADUUm6QaCAf+t
 Bym5g4g7pnU70/mr6d06Id6eFh3EY86Rsxzeq6HYvCFuRmlv778jaHzPHEWBU7sLibrN
 soFqNb7xe4K0rCDzK7ae3vcUzzUgz1QAvBq+6Enmmu7GwmyXN3lUHo9hkCRDEngD25r5
 oTL62pVWilXFVryTM5KWGGFxM5Vo7fSbbvjVMN3pbB02sh62ObizNbTSzjsPpD+gu4LM
 9Wgg==
X-Gm-Message-State: APjAAAXEwJ/U6wodP7AgWm9YO9Mr/Qx4sWjXEsU55MFHBx9NrFKkhfMO
 UQNNJnqNUJWnEB9nEXEPJEJ5QLnSwJvfOaZ9EFEMqW78
X-Google-Smtp-Source: APXvYqxNdOGB2WGWCnghLz9uwjolnJyOa8vlr+WnUyO0zmr1/ot3q/S+YF1u1IXNHz8osGDRHnZWrd80t7vHOCyQN88=
X-Received: by 2002:a17:90a:154f:: with SMTP id y15mr77517pja.73.1570051668780; 
 Wed, 02 Oct 2019 14:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120136.1777161-1-arnd@arndb.de>
 <20191002120136.1777161-5-arnd@arndb.de>
 <CAKwvOdmjM80XP7VH83iLn=8mz6W1+SbXST2FChEnH0LSRRm4pA@mail.gmail.com>
 <CADnq5_MyUp9OkqM+MUHZ8BpLEe5afBpAqOwQxDwAWgvVvqbpoQ@mail.gmail.com>
In-Reply-To: <CADnq5_MyUp9OkqM+MUHZ8BpLEe5afBpAqOwQxDwAWgvVvqbpoQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Oct 2019 14:27:37 -0700
Message-ID: <CAKwvOd=+VeD4xchCAyKeBtTD8+qwS6BTVgM=4ZDY1kBQJq3wMQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/amd/display: fix dcn21 Makefile for clang
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Thu, 03 Oct 2019 14:00:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Ff5/X8LijthYfBkRMosRh8V5DWdVMBmSJpWGhDefc4M=;
 b=Vb5V5wS0B2+OZP1hBBvp/X0BN8J2HU5kfLxwxgDecAUheVPlHvun2OYXtJRwp3FY64
 B/rNa+xoUubebYIt9wU6UtQvz74/wh9aaLvwc1qLfrA4CcdAcvlG/WnwhXR6tVf3o9Pq
 6+kyVsT0p3gDAYf45MjahfyuIfSGJTw8yfHpocnjbuDtgx5ctlNxMGLoYG0NXQm/HPkH
 bgEL6k2l8Alsn0ErHQURhPrnycDhI7j24owjoOxuvFkricWBTQuucujCDaRWvcogBUiu
 J1w4QRQDUslmdgTvSO+cKA2COYYX84VW86bw6Ncpr4pIp3Fyn+urmRyNQX4v3S1OSWf4
 QmxA==
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAyOjI0IFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDIsIDIwMTkgYXQgNToxOSBQTSBOaWNr
IERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQWxl
eCwgZG8geW91IGtub3cgd2h5IHRoZSBBTURHUFUgZHJpdmVyIHVzZXMgYSBkaWZmZXJlbnQgc3Rh
Y2sKPiA+IGFsaWdubWVudCAoMTZCKSB0aGFuIHRoZSByZXN0IG9mIHRoZSB4ODYga2VybmVsPyAg
KHNlZQo+ID4gYXJjaC94ODYvTWFrZWZpbGUgd2hpY2ggdXNlcyA4QiBzdGFjayBhbGlnbm1lbnQp
Lgo+Cj4gTm90IHN1cmUuICBNYXliZSBIYXJyeSBjYW4gY29tbWVudC4gIEkgdGhpbmsgaXQgd2Fz
IGFkZGVkIGZvciB0aGUKPiBmbG9hdGluZyBwb2ludCBzdHVmZi4gIE5vdCBzdXJlIGlmIGl0J3Mg
c3RyaWN0bHkgcmVxdWlyZWQgb3Igbm90LgoKQ2FuIHlvdSBmaW5kIG91dCBmb3IgbWUgcGxlYXNl
IHdobyBrbm93cyBtb3JlIGFib3V0IHRoaXMgYW5kIHNldHVwIGEKY2hhdCB3aXRoIGFsbCBvZiB1
cz8gKEkgZG9uJ3Qgd2FudCB0byBkZXJpZGUgdGhpcyBwYXRjaCdzIHJldmlldwp0aHJlYWQsIHNv
IGxldCdzIHN0YXJ0IGEgbmV3IHRocmVhZCBvbmNlIHdlIGtub3cgbW9yZSkgV2UncmUgZmFjaW5n
CnNvbWUgaW50ZXJlc3RpbmcgcnVudGltZSBpc3N1ZXMgd2hlbiBidWlsdCB3aXRoIENsYW5nLgoK
LS0gClRoYW5rcywKfk5pY2sgRGVzYXVsbmllcnMKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
