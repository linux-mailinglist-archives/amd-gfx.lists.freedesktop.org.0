Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA29D276
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Aug 2019 17:17:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2050689DC5;
	Mon, 26 Aug 2019 15:17:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25D89DC5
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 15:17:09 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r3so15718653wrt.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Aug 2019 08:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3OhNJIqCWkzD4aj6/1vV0aKfa5mah5B+lSn+3N0mtEc=;
 b=c3Ir93JDO8l9xW+o4SsoWpUy1jdhkQloOiHEr6NNWFn/yVGKpauGEYLL+bFjzGf/fl
 9FmedOU2oCAOtD+nk/+gZywNR67Mz3Wf8OUcxgMX9kDihlFtPFrzs/JYB+rfzX9jS2hl
 7Ip+YNDT32m0uWWeaWsU01dg6yo6RgrFT/62y64VwKk8axCZTstNL6756BdYSEScOcI4
 LvEZ0P++pKkVqqkaDlrvkbSvKFr1WvuSmBhhOijL8kjNX11bKJ/O3l+1xAzENrbJq2rs
 JlbbxUx2p6XTOa1S8jYP/+NYR/wl8Xt7Pz06923Tj0cUFqtDHnEhrC/9zhlQgR39VBqU
 BXAw==
X-Gm-Message-State: APjAAAUzump0+gqON4URC/9F/T3a8iPo15Ct1gp4FZed6YFFxZKCuqSh
 IZ2IjleN9P1c9SqRkTCerGSOXdjQOhyXAkPWCT4=
X-Google-Smtp-Source: APXvYqwu18NgSTZSGLc4mSMOMPegj7LnF3fT8AUKAC5AsFC3IwjtVYQCbU1apNw68rAgvTWINNfUrROfz2oa8RZWo6o=
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr22795931wru.74.1566832627935; 
 Mon, 26 Aug 2019 08:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190826132012.GB6840@mwanda>
In-Reply-To: <20190826132012.GB6840@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 26 Aug 2019 11:16:55 -0400
Message-ID: <CADnq5_PEFyHP7cOxZOYroGx+Hf1qSuSg+7DUiAakZMc1GcWbsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Fix an off by one in
 navi10_get_smu_msg_index()
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=3OhNJIqCWkzD4aj6/1vV0aKfa5mah5B+lSn+3N0mtEc=;
 b=XN8fZPAJwzZ2tOPrFDwaQgVLLZv8Hh04gHCnCm6uzqsmUtX2SdvirNciE6EaARm07N
 JbwlxbVgQpmO07WidCup5FAlEu6d2kZ1dQhW/sFuxHzJj9UB3IgE+m35NRevPgThK1nB
 LQlyoyKMt5jwIus7qrYOlO9skf+B+mJDoB8fJ22gdqqXn1CAw+sUUD4g1izvtmEdm3sh
 NCC2nzoHUezK+Ufm47IbjyNL2ZZ9eI4HEhoAcHnddHeVy9/TY+RMsOgjgymGjbS2zo3R
 +BxAGlvmFPaiqGyVQhvojHWVpCs6X3f4rzpZI826c31leEYKD8Q3WfNV/nBNV43fK/Rb
 CAyg==
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
 David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgOToyMCBBTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gVGhlIG5hdmkxMF9tZXNzYWdlX21hcFtdIGFycmF5
IGhhcyBTTVVfTVNHX01BWF9DT1VOVCBlbGVtZW50cyBzbyB0aGUgIj4iCj4gaGFzIHRvIGJlIGNo
YW5nZWQgdG8gIj49IiB0byBwcmV2ZW50IHJlYWRpbmcgb25lIGVsZW1lbnQgYmV5b25kIHRoZSBl
bmQKPiBvZiB0aGUgYXJyYXkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBpbmRleCBkN2UyNWY1MTEzZjEuLmZi
ZWNkMjVmMTUwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMKPiBAQCAtMjEzLDcgKzIxMyw3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dldF9zbXVfbXNn
X2luZGV4KHN0cnVjdCBzbXVfY29udGV4dCAqc21jLCB1aW50MzJfdCBpbmRleCkKPiAgewo+ICAg
ICAgICAgc3RydWN0IHNtdV8xMV8wX2NtbjJhaXNjX21hcHBpbmcgbWFwcGluZzsKPgo+IC0gICAg
ICAgaWYgKGluZGV4ID4gU01VX01TR19NQVhfQ09VTlQpCj4gKyAgICAgICBpZiAoaW5kZXggPj0g
U01VX01TR19NQVhfQ09VTlQpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4g
ICAgICAgICBtYXBwaW5nID0gbmF2aTEwX21lc3NhZ2VfbWFwW2luZGV4XTsKPiAtLQo+IDIuMjAu
MQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
