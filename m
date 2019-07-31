Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611BB7B853
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 05:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F87F6E65F;
	Wed, 31 Jul 2019 03:48:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087B6E65F
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 03:48:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c2so64762266wrm.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 20:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiYgP/HD+HmD5raEcsSLDV8mLZnWdQ96ayLhG2pRBrQ=;
 b=K6dT8MCHgH7oGpMmkXT/azogoczDzSrY5F1590nyqumrkE7Lpws5tLA66h5Lo8bs8/
 UsMi8CYr4jg2+/ibXnj9dhl/R6Cg6bKDMaonCNezIUqb96jmLz9kt6xfDtjTIHnKbzd5
 DDTKbwkGAw2wIaNcNvFoJgiT0k+Jbws2QMsSvVOH/NwvjLf4n3zoBxmKu5a8uh+Potnk
 Qx8DYMqPNy8LNBQBTrqOlXAYifWGZzZak/7ntltArwcb2kt3wR5KMvjnG9zSCtr6EUmN
 Tmncob6v4tE7XuHv1RqwE2+hvCdMbl90W2LSiu4tWZ94HpVR4jq1IhedsBi23df2P4FR
 dEcg==
X-Gm-Message-State: APjAAAXAP4i+lbUILWc7cad7oJCvRfhzRjnf2Wt3yT0gFcvkbeu2im0E
 kHSBsis8dqmiZiHhqIm/9rhjkfKqCLVegUx8JEU0ZT7p
X-Google-Smtp-Source: APXvYqyq1WeHd5W9fFYS9EqfnKX1ImNNj09UQFHzghgjICF1wMogYLZiFFE6mAftJxnHH80kalyRcd6RxS4JkxY3qqY=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr53713437wrw.323.1564544928332; 
 Tue, 30 Jul 2019 20:48:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190729201508.16136-1-alexander.deucher@amd.com>
 <20190729201508.16136-19-alexander.deucher@amd.com>
 <9594f6ed-de3d-71ac-aefe-e20e4d4f83f4@amd.com>
In-Reply-To: <9594f6ed-de3d-71ac-aefe-e20e4d4f83f4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 30 Jul 2019 23:48:37 -0400
Message-ID: <CADnq5_PA1fYwcD62J=pkGjWpQ70MiC3dje0u2W71X1FFEwbT0w@mail.gmail.com>
Subject: Re: [PATCH 18/30] drm/amd/powerplay: init arcturus SMU metrics table
 on bootup
To: Kevin Wang <kevwa@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=RiYgP/HD+HmD5raEcsSLDV8mLZnWdQ96ayLhG2pRBrQ=;
 b=FFUcXLRmnipL3NajzxAyjvi11P6AOerhSkeTtR1LHhQ8OcdduZcqeuCdnIcJZucHn0
 7APbtXk12x19NHKM9eFqGOmkvKnedu+Plpb38lKZsVklJaM/6SN+A+kvUc5uF5pjYX3S
 yUWE90JzPSHpBVz2hHvflsYyMkA3SpXKb+NSu4t9Vrc1gU2TQArRvD81jez4b04nWvzc
 k/4aByMsCfeSq6BMDkf3A6srxRsBFmYsf19AjcdslivG02IFw7dLGg6zkiG5CSwBky02
 3mlFXq8NUm1FToK5Y9WUQaLwZtgDwMjjNd+JmBiZFXrFIE9FUHNz+jy6vlo/bparlnam
 kC5g==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTA6NDMgUE0gS2V2aW4gV2FuZyA8a2V2d2FAYW1kLmNv
bT4gd3JvdGU6Cj4KPgo+IE9uIDcvMzAvMTkgNDoxNCBBTSwgQWxleCBEZXVjaGVyIHdyb3RlOgo+
ID4gRnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KPiA+Cj4gPiBJbml0aWFsaXpl
IGFyY3R1cnVzIFNNVSBtZXRyaWNzIHRhYmxlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4g
UXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogS2V2aW4gV2FuZyA8a2V2
aW4xLndhbmdAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvYXJjdHVydXNfcHB0LmMgfCA3ICsrKysrKysKPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FyY3R1cnVzX3BwdC5jCj4gPiBpbmRleCBhMDY0NGVmMjY3YTkuLjVmOTExZjA5MjMxMSAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5j
Cj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwo+
ID4gQEAgLTI2Nyw2ICsyNjcsOCBAQCBzdGF0aWMgaW50IGFyY3R1cnVzX2dldF93b3JrbG9hZF90
eXBlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIFBQX1NNQ19QT1dFUgo+ID4KPiA+ICAg
c3RhdGljIGludCBhcmN0dXJ1c190YWJsZXNfaW5pdChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwg
c3RydWN0IHNtdV90YWJsZSAqdGFibGVzKQo+ID4gICB7Cj4gPiArICAgICBzdHJ1Y3Qgc211X3Rh
YmxlX2NvbnRleHQgKnNtdV90YWJsZSA9ICZzbXUtPnNtdV90YWJsZTsKPiA+ICsKPiA+ICAgICAg
IFNNVV9UQUJMRV9JTklUKHRhYmxlcywgU01VX1RBQkxFX1BQVEFCTEUsIHNpemVvZihQUFRhYmxl
X3QpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgUEFHRV9TSVpFLCBBTURHUFVfR0VNX0RPTUFJ
Tl9WUkFNKTsKPiA+Cj4gPiBAQCAtMjc2LDYgKzI3OCwxMSBAQCBzdGF0aWMgaW50IGFyY3R1cnVz
X3RhYmxlc19pbml0KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBzdHJ1Y3Qgc211X3RhYmxlICp0
YWJsZQo+ID4gICAgICAgU01VX1RBQkxFX0lOSVQodGFibGVzLCBTTVVfVEFCTEVfU01VX01FVFJJ
Q1MsIHNpemVvZihTbXVNZXRyaWNzX3QpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgUEFHRV9T
SVpFLCBBTURHUFVfR0VNX0RPTUFJTl9WUkFNKTsKPiA+Cj4gPiArICAgICBzbXVfdGFibGUtPm1l
dHJpY3NfdGFibGUgPSBremFsbG9jKHNpemVvZihTbXVNZXRyaWNzX3QpLCBHRlBfS0VSTkVMKTsK
PiA+IFtrZXZpbl06IHdoZXJlIGlzIGRvIGZyZWUgb3BlcmF0aW9uIGluIGRyaXZlciBjb2RlID8K
Ckl0J3MgZnJlZWQgaW4gc211X3YxMV8wX2Zpbmlfc21jX3RhYmxlcygpCgpBbGV4Cgo+ID4gKyAg
ICAgaWYgKCFzbXVfdGFibGUtPm1ldHJpY3NfdGFibGUpCj4gPiArICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ID4gKyAgICAgc211X3RhYmxlLT5tZXRyaWNzX3RpbWUgPSAwOwo+ID4gKwo+
ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgIH0KPiA+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
