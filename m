Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8F4C9016
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 19:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A17D6E0E6;
	Wed,  2 Oct 2019 17:41:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2282D6E12D
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 16:51:40 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id o32so13721028pgm.18
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 09:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4INGfYLGyLALjI2XEapvgZEklVw6KiRSbjc8hD/raH0=;
 b=La6QPuLVQ2gv8jNPjQ8twrFZpxMeavoNKr9TGHJ0ZyTKIkbIHDhoeKe38beNzwI5ZX
 yjg+p8PhLbubnzCybHv/qDpH6smec9tPemNcXCdUKeOtUC0q3mx2n1PHmyaWgJCRFaFh
 DqIKYxu3dE/3p2enH9/8cN+MvxyorTfoJItuijZxB0+7a30OXweGDeG97/3vm4cBTMja
 Z/VBeekk4uqW4YPSAkFW41yoXz7asN2sCF9Fuu+/F1kUQ+z8GcIgtDD3Zn5FCHW/Z+Z0
 1mYDKjNCiSlG+Ek2rK/E7vaeWI2eMY4NrHTSYahaTPmbus1rA0XRdk6ymRLaPCJK59fC
 8cSA==
X-Gm-Message-State: APjAAAUHAvKdolUhhufPztzbCEsAugjZtl660QKevLak3ZfIk4N1yueq
 1pBsVueNxuU2gde9PzBu0vihKcGUjg7fd9LKvBs=
X-Google-Smtp-Source: APXvYqzqokz2U9Wh/jeAoe5hFd5+Jm6Iq6mS+TfQ3qt8KuD3T5573f6jW+N2W7bdqA+tpZGrZLlRlVZZvHAt9/vymno=
X-Received: by 2002:a63:dd0c:: with SMTP id t12mr4611244pgg.82.1570035099268; 
 Wed, 02 Oct 2019 09:51:39 -0700 (PDT)
Date: Wed,  2 Oct 2019 09:51:37 -0700
In-Reply-To: <20191002120136.1777161-7-arnd@arndb.de>
Message-Id: <20191002165137.15726-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20191002120136.1777161-7-arnd@arndb.de>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
Subject: Re: [PATCH 6/6] [RESEND] drm/amdgpu: work around llvm bug #42576
From: Nick Desaulniers <ndesaulniers@google.com>
To: arnd@arndb.de
X-Mailman-Approved-At: Wed, 02 Oct 2019 17:41:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=4INGfYLGyLALjI2XEapvgZEklVw6KiRSbjc8hD/raH0=;
 b=rmQ/UWjpQ9gSzRQMAE9Z2Xm1qYUhMcoVPefDNgkutcuhAi3dYBTO5gO3X0gTikcFBt
 A8aFY6lBh4YRc3ZV78aFfn9mcnZk7KNABwAsbR4rBLPsjkz7FkAd4W8JABWZtgwBuDRS
 qLf+e3Do4U0t5RzrMax6zl4/qxX2a2ca9jKJoTV9YMXCqsefR/zm+i6MoA40bIgWs0ef
 idGAQnt76kWKxc+sp4VlCpn/uEpphTcefYNTFu78VhpGeQerpQMrMGWrw4FOiaEEgZL+
 V6lhDzqU96Aa4+a1Wl2AY5D/AwQK7X6SwZaeXfsW6M/84YBqf1QCSC9wCDOjcD5nWs4w
 VBVw==
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
Cc: David1.Zhou@amd.com, le.ma@amd.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 clang-built-linux@googlegroups.com, ray.huang@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBBcHBhcmVudGx5IHRoaXMgYnVnIGlzIHN0aWxsIHByZXNlbnQgaW4gYm90aCB0aGUgcmVsZWFz
ZWQgY2xhbmctOQo+IGFuZCB0aGUgY3VycmVudCBkZXZlbG9wbWVudCB2ZXJzaW9uIG9mIGNsYW5n
LTEwLgo+IEkgd2FzIGhvcGluZyB3ZSB3b3VsZCBub3QgbmVlZCBhIHdvcmthcm91bmQgaW4gY2xh
bmctOSssIGJ1dAo+IGl0IHNlZW1zIHRoYXQgd2UgZG8uCgpJIHRoaW5rIEknZCByYXRoZXI6CjEu
IG1hcmsgQU1ER1BVIEJST0tFTiBpZiBDQ19JU19DTEFORy4gVGhlcmUgYXJlIG51bWVyb3VzIG90
aGVyIGlzc3VlcyBidWlsZGluZwogICBhIHdvcmtpbmcgZHJpdmVyIGhlcmUuCjIuIEZpeCB0aGUg
Y29tcGlsZXIgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
