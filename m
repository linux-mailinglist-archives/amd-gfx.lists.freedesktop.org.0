Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BD74867E
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 17:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDA3892EE;
	Mon, 17 Jun 2019 15:03:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF9892EE;
 Mon, 17 Jun 2019 15:03:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a15so9650416wmj.5;
 Mon, 17 Jun 2019 08:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OzFdi5FA53sk7r/J78O4Hf8Scc6tKC9H8PAY8JmuySc=;
 b=uUvmkEkQNOLjrEpo/38g1SzHgRXoMBtF69R4CJ8sa91U+T0QDy2fqCv/KVw9nUpXNM
 s6zjLI4Yn5sZZ80FZJT4Moby2YZJsB0rQXzKEOXcen8T4XWNZwOarZqfmnSxCri58jq5
 WOtef50fza9tVmX0yeaUqCMRLpZh17vDx3WM2JztAqclJ/U9BbYK+mih4Cv6A4F06QXs
 C62qPKy6pB3QpNt7/qfK2bi1lDdrAAGG8IgdcUyFW1IsMCzijg6qYCDDJS+nhY7/DKg7
 HQ4H1MQw4hsOqH2QxLMHENG0coSrD8a0ScgD1kAkpzazY8jCRc6BWVoYZbpUAZoxFrgV
 KBdQ==
X-Gm-Message-State: APjAAAVbL1VlW9qMhp/6z1M72rciVAG9Lvpcm1FYFO1yVgLeLY9FxSQ3
 8ZhmtKMmXObUq4cnrHgJhWKsDNth61zC96trmW4=
X-Google-Smtp-Source: APXvYqwkQD3IHYB235QRVnPLSDc0R5AJFY+mAE0Y4N+QbgGWm4paBPug7aCAkNhEoTeVtrcHmrV718BAPonSYrdKKzo=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr20353364wmk.127.1560783806243; 
 Mon, 17 Jun 2019 08:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190617143728.4949-1-geert+renesas@glider.be>
In-Reply-To: <20190617143728.4949-1-geert+renesas@glider.be>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Jun 2019 11:03:14 -0400
Message-ID: <CADnq5_PaTnL-_kzbGquQbomy+31ArFcvBke+R_yZyXn39cCQyQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add missing newline at end of file
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OzFdi5FA53sk7r/J78O4Hf8Scc6tKC9H8PAY8JmuySc=;
 b=o2gr9d3FYl6FromvO4dGq2q7MDqhh1JM36ApiWaU6Qz6TJk8IfWXhLnmmzeCZvjdZl
 oFa9mbDnKPJ7ggAFEDejpk6IfR/7+cyXn1TyKAgAq0U6WTyT2zi1YWHsVDRyokCRjebR
 nVpIw3+4qV+gojidQYF4VY9CUIZquD1BgnnITrIHOEThgex+csiGylIgXdNeJ2CrI0r8
 sqiUd/XFV6HCPtSWOOOyk/5Ivsod1rqPDI3kAokoZhpNXa9GiABfSxpno+JrbMrRM4Z1
 CfLaYPa4r6twmoPvIgiCXO1g9mmjXcob9AU6Ogtkf0GcMMooJjMuVDGD40nAOh54RxKM
 PUkw==
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
Cc: David Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NDUgQU0gR2VlcnQgVXl0dGVyaG9ldmVuCjxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4gd3JvdGU6Cj4KPiAiZ2l0IGRpZmYiIHNheXM6Cj4KPiAgICAg
XCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlCj4KPiBhZnRlciBtb2RpZnlpbmcgdGhlIGZpbGUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPgoKQXBwbGllZC4gIHRoYW5rcyEKCkFsZXgKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL01ha2VmaWxlIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9NYWtlZmlsZSBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL01ha2VmaWxlCj4gaW5kZXggODc4NTFm
ODkyYTUyZDM3Mi4uOWQxYjIyZDM1ZWNlOTEzNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9wb3dlci9NYWtlZmlsZQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL3Bvd2VyL01ha2VmaWxlCj4gQEAgLTI4LDQgKzI4LDQg
QEAgTU9EX1BPV0VSID0gcG93ZXJfaGVscGVycy5vCj4gIEFNRF9EQUxfTU9EX1BPV0VSID0gJChh
ZGRwcmVmaXggJChBTUREQUxQQVRIKS9tb2R1bGVzL3Bvd2VyLywkKE1PRF9QT1dFUikpCj4gICMk
KGluZm8gKioqKioqKioqKioqICBEQUwgUE9XRVIgTU9EVUxFIE1BS0VGSUxFICoqKioqKioqKioq
KikKPgo+IC1BTURfRElTUExBWV9GSUxFUyArPSAkKEFNRF9EQUxfTU9EX1BPV0VSKQo+IFwgTm8g
bmV3bGluZSBhdCBlbmQgb2YgZmlsZQo+ICtBTURfRElTUExBWV9GSUxFUyArPSAkKEFNRF9EQUxf
TU9EX1BPV0VSKQo+IC0tCj4gMi4xNy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
