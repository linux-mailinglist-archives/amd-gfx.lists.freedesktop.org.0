Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1B4868B
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 17:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04B189308;
	Mon, 17 Jun 2019 15:06:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A9E892FE;
 Mon, 17 Jun 2019 15:06:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g135so9645343wme.4;
 Mon, 17 Jun 2019 08:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oh4VL4iPNDaGaWS9B+IslavMbhg8v2O15rFQqtXr3DA=;
 b=OUTxT8HwHNYRv/jZ+NzzBCnsntHECVMTuaUMb1yEvaP3uk9ioaTP9j7lydUp+8SRfU
 HT72wqxYRQ/ek2GZg/zDI5gxVd1n28/cMOdXCuRb6l50hYfGMevXOrAzNt+QcgjFIgNk
 bg+zzIV1rZI1ddXF9GzGpL0ivWpugIWhYIRF8bHYEry9E7Lsjf3ZFQc7G7qBNFDYfM3F
 zbTNt3aNw13ps5wjBVyqJ71mitj04/ScpEF4JHb9Qdihd2+EjutqcLRJZ0SmedO5Tg+w
 vUDiGA1ArtZ+GxPwAIrsJ3/0XJ7ZzcfB9lnfMuooOcuuRb1imQBhuInwGjdmli9vR7WO
 oQMg==
X-Gm-Message-State: APjAAAVvdYhNptAOwJMqZo9gkwxd4ikOcGh9Y7wLu4V+Bok037ajeKON
 nqHZqVAvbcH+21VHPFtC92jPLEp+UwacVcbm3149aeDL
X-Google-Smtp-Source: APXvYqzwnLdmhx4erTT42qjFTICvOKBGEP2f7RWvXDepAPvjY+Gfzf/lBcnfGne43PNShj8tK4VXq9LKd4uItxBeWRE=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr18196950wmc.34.1560783986617; 
 Mon, 17 Jun 2019 08:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <de3f6a5e-8ac4-bc8e-0d0c-3a4a5db283e9@web.de>
In-Reply-To: <de3f6a5e-8ac4-bc8e-0d0c-3a4a5db283e9@web.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 Jun 2019 11:06:14 -0400
Message-ID: <CADnq5_MKRU6-iCJZWwpR8z+mmdkgVh_STJtVJCiSTec21e+oqA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: Delete a redundant memory setting in
 vega20_set_default_od8_setttings()
To: Markus Elfring <Markus.Elfring@web.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oh4VL4iPNDaGaWS9B+IslavMbhg8v2O15rFQqtXr3DA=;
 b=AhnkPzcZlgpKjDEw3+xRxeOFXIR4rBRfDc37XV2fRn72EJMb4qZ8fbe4wJKA+CuT+D
 OLPOGYXVQcZPKfdya2ZqCLSSALJAxqIDWYRoQ1W93f5ujh5ji5/VxPnw8sUtRrx5/OUE
 Z2OE9rk24ODOJTwUVfqhAMNtFPIJ8floCpl/JgraI+yw+lntSaVl/G6A5Np8mXKpr5Cs
 Yz86ZLrNQdAJ7auSv5dsL0Hg7w8ndlxykvHk+PAa+IfsoDxUvYQPG+GFStswDfgOhu1V
 7oB6x9fs4FWi7kkSTMQrtr4vEDy7f6L81XpLC0Knnd1fteIdwHyKAkxZ/rn5BITnmGzt
 yHWQ==
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
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QXBwbGllZCB0aGlzIGFuZCB0aGUgZGMgcGF0Y2guCgpUaGFua3MhCgpBbGV4CgpPbiBNb24sIEp1
biAxNywgMjAxOSBhdCAxMDowNyBBTSBNYXJrdXMgRWxmcmluZyA8TWFya3VzLkVsZnJpbmdAd2Vi
LmRlPiB3cm90ZToKPgo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNvdXJj
ZWZvcmdlLm5ldD4KPiBEYXRlOiBNb24sIDE3IEp1biAyMDE5IDE0OjI0OjE0ICswMjAwCj4KPiBU
aGUgbWVtb3J5IHdhcyBzZXQgdG8gemVybyBhbHJlYWR5IGJ5IGEgY2FsbCBvZiB0aGUgZnVuY3Rp
b24g4oCca3phbGxvY+KAnS4KPiBUaHVzIHJlbW92ZSBhbiBleHRyYSBjYWxsIG9mIHRoZSBmdW5j
dGlvbiDigJxtZW1zZXTigJ0gZm9yIHRoaXMgcHVycG9zZS4KPgo+IFRoaXMgaXNzdWUgd2FzIGRl
dGVjdGVkIGJ5IHVzaW5nIHRoZSBDb2NjaW5lbGxlIHNvZnR3YXJlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0Pgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgfCAxIC0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS92ZWdhMjBfcHB0LmMKPiBpbmRleCA0YWE4ZjVhNjljNGMuLjYyNDk3YWQ2NmEzOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS92ZWdhMjBfcHB0LmMKPiBAQCAtMTI5
NSw3ICsxMjk1LDYgQEAgc3RhdGljIGludCB2ZWdhMjBfc2V0X2RlZmF1bHRfb2Q4X3NldHR0aW5n
cyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgICAgICAgIGlmICghdGFibGVfY29udGV4dC0+
b2Q4X3NldHRpbmdzKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPgo+IC0gICAg
ICAgbWVtc2V0KHRhYmxlX2NvbnRleHQtPm9kOF9zZXR0aW5ncywgMCwgc2l6ZW9mKHN0cnVjdCB2
ZWdhMjBfb2Q4X3NldHRpbmdzKSk7Cj4gICAgICAgICBvZDhfc2V0dGluZ3MgPSAoc3RydWN0IHZl
Z2EyMF9vZDhfc2V0dGluZ3MgKil0YWJsZV9jb250ZXh0LT5vZDhfc2V0dGluZ3M7Cj4KPiAgICAg
ICAgIGlmIChzbXVfZmVhdHVyZV9pc19lbmFibGVkKHNtdSwgRkVBVFVSRV9EUE1fU09DQ0xLX0JJ
VCkpIHsKPiAtLQo+IDIuMjIuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
