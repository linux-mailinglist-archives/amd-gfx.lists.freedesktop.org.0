Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0BFB486C
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65D06EB24;
	Tue, 17 Sep 2019 07:42:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B872A6EAD3
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 03:42:40 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id d126so434586vkb.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 20:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
 b=Tdq5yHA7FobcQpJbpyAM7d2bs4wY0seWPCS7QW8vsc09/EfLruR4QO/ViWMtQRiM0c
 vi0tCOvsiJgceM1uGnRyu53UI66bhhxDl81xWFRgwiAB55EzH/r44EXfCzGZnHiCYang
 lGB2kr8bFtYgr8V/+V6IjLeEq3VZp5Q56HDpnx3YI6y+BXo0e/j/yoD9gsRBXxsLIE8C
 6QSj1zZfCiHhVLvNsL1JJ9n5ymRJSE62dBM3VPfS+opQkkEd0RquxTCLUHsOkpR494vv
 QEbxizI8cyIMceZ01vqayw8RiaqjjP/atu0M29R6kjqXXE1Y263d8ZFvD/S+HNLUIDzo
 jNZg==
X-Gm-Message-State: APjAAAWwJw2KdA/uoya9frnO+dAtpPPU610YajdxQzWVWvesceL1tIpz
 hLLDF2CUWbCTKOiyF/GYuk6EmN50Q9FVmS6VDeKk4Q==
X-Google-Smtp-Source: APXvYqylyJkjns/aN+8l0EI9DIfbxa4N2MWKAfj7VPQ17LXO9wcipYNM8IikzhhUzIM4gFvBiWj5HLVhWZUDnoz6tN0=
X-Received: by 2002:a1f:1897:: with SMTP id 145mr495407vky.53.1568691759340;
 Mon, 16 Sep 2019 20:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190904233443.3f73c46b@canb.auug.org.au>
 <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
In-Reply-To: <6b70fdfd-1f18-1e55-2574-7be5997cfb2a@infradead.org>
From: Kees Cook <keescook@google.com>
Date: Mon, 16 Sep 2019 20:42:27 -0700
Message-ID: <CAGXu5jJ-LzJx1Fr8b2b4xv9i9yG99CPc8SUoT3eF44kO0G7tYg@mail.gmail.com>
Subject: Re: linux-next: Tree for Sep 4 (amd/display/)
To: Randy Dunlap <rdunlap@infradead.org>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:41:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E7jFRh2n+jc8CB66SFHbbHRXtVEUNkro/yk+H2kFkL4=;
 b=FUcGfGtxkTlmSxmt5gQwEX7SA6xUHQX+bNPBzuYYzbxnau/esg+roqjPy12H12HyBR
 Zc8gHZ2vuWx3B14ue9hSTmXh7uTeYFFAinndbphpJ1tr39kAeihR/QQEuhgY3XRMvRY/
 1RoauBexXXia0w/m0sYWz9+GIXZxrbFb1BtQQiK/t6TjW8X7T4P4pRdxvomxNUBnxZAf
 4qstLG2jC3T0Gaj8ixNDXWhmW6qG4zpoimTr2cgIdksAirPMHKnisLEpFIEem9L5ikRR
 w0+lH6l71m+9WcIFlwhye0t8OP6AcQUUoEEcvK7PHMATLHnZcNC2jV2Nj2Aj5QCW23xa
 C/Sw==
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Leo Li <sunpeng.li@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgNCwgMjAxOSBhdCAxOjU4IFBNIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIDkvNC8xOSA2OjM0IEFNLCBTdGVwaGVuIFJvdGh3ZWxs
IHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4KPiA+IE5ld3M6IHRoaXMgd2lsbCBiZSB0aGUgbGFzdCBs
aW51eC1uZXh0IEkgd2lsbCByZWxlYXNlIHVudGlsIFNlcHQgMzAuCj4gPgo+ID4gQ2hhbmdlcyBz
aW5jZSAyMDE5MDkwMzoKPiA+Cj4KPiBvbiB4ODZfNjQ6Cj4KPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gLi4vZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGNuMjAv
ZGlzcGxheV9ycV9kbGdfY2FsY18yMHYyLmM6Nzc6MDoKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxfaW5saW5lX2RlZnMuaDogSW4g
ZnVuY3Rpb24g4oCYZG1sX21pbuKAmToKPiAuLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8u
Li9kaXNwbGF5L2RjL2RtbC9kY24yMC8uLi9kbWxfaW5saW5lX2RlZnMuaDozNDoxOiBlcnJvcjog
U1NFIHJlZ2lzdGVyIHJldHVybiB3aXRoIFNTRSBkaXNhYmxlZAoKSSdtIHN0aWxsIHRyaXBwaW5n
IG92ZXIgdGhpcyB0b28uIFdoYXQgY29tcGlsZXJzIGFyZSBwZW9wbGUgYnVpbGRpbmcKd2l0aCB3
aGVyZSB0aGlzIGlzIE5PVCBoYXBwZW5pbmcgZm9yIGFuIGFsbG1vZGNvbmZpZz8KCkknbSB1c2lu
ZzoKZ2NjIChVYnVudHUgNy40LjAtMXVidW50dTF+MTguMDQuMSkgNy40LjAKCkJ1dCBpdCBoYXBw
ZW5zIG9uIG5ld2VyIGNvbXBpbGVycyB0b28uCgotLSAKS2VlcyBDb29rCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
