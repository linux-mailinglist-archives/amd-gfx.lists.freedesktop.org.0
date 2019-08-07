Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 010A884851
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 11:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D8C6E69A;
	Wed,  7 Aug 2019 09:01:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DD16E69A
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 09:01:00 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e8so865412wme.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 02:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=laTtLqff8yxtXKNUanR+XG+Wl/tk9w8lHnsqf+3DdFM=;
 b=ea8AWtq1TzZW71rpS+fQIflr4x7Guz0MUS7Id4jR7067mLD8NKBFYhxOHsAisGOCU+
 HyGgaq/toQqspBrczsCWfCTDQf4i7lZ3+yQeL8HeYmkWXJlmsWKpdNb98yUY5VDFK2PD
 71qZe2z9rL42ziThlKfgicZIFJrOvYRfxXGjs8+joQqDoYVO0XOlPs2AgfLiCigbvq2X
 5lbrcLJHAVUopovr2UipURpzcYDKgvZBRg8zcA8x8C/zFiK9KdKyS1yOEGH+eF61c9FI
 UIzi2J3aYcM/5WAvcrX+j46a1gx2QQmzAMnk0dfXmoZtFffeBiAEOQJtXKCX+0/RD6e4
 6hYA==
X-Gm-Message-State: APjAAAV2LKNVKFuglFI80Cm2UamrGcVdbSPYdY7bEe+zTvuo60WpZqHX
 3CKve5A5ckIJl6qtp+MnmPGvMTQ6
X-Google-Smtp-Source: APXvYqzzQ3Djxo3SbSrBZtpqbAkelnizLwEyXj54y9PciwMRqgI62f5wuseN6hbekGifSe9oCtYVvw==
X-Received: by 2002:a1c:7a02:: with SMTP id v2mr9370588wmc.159.1565168459222; 
 Wed, 07 Aug 2019 02:00:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 32sm83882264wrh.76.2019.08.07.02.00.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 02:00:58 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix gfx9 soft recovery
To: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190807074023.31659-1-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <96fa3ab8-5238-8b41-05fe-6da31cdfc32f@gmail.com>
Date: Wed, 7 Aug 2019 11:00:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807074023.31659-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=laTtLqff8yxtXKNUanR+XG+Wl/tk9w8lHnsqf+3DdFM=;
 b=bGvrUBzvy4NRvM0uNXOxv2iExWlOnzEHDGInhzwn1oOWQ6PT2bMIs56CSRHPnm9n1j
 Z5OyXRW7zy0XX/8qMET/EvkjEa2yuje55YMtaDmj3XCyjBz+JeMZ6WLTHyPLB38HLJGF
 LPDRRPmEWZohYvmYCz6l186h34/Dp11KSpcXZ4nb/su43fHRMJkp/Q7tzr17KSk+z+RR
 F6VJntVVt/GWlZlRprd9fs9vRetAgFzap++KZ9irAXBDnjFP96E6kqFzDX0YWehoFd1R
 MQVclw2BGf6h1rUkTJ6VMALAWxY1IlBlAgsRe+nNyyyW9gA3NITGOoTB2xUKzj6BnJUY
 /w0A==
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDguMTkgdW0gMDk6NDAgc2NocmllYiBQZWxsb3V4LXByYXllciwgUGllcnJlLWVyaWM6
Cj4gVGhlIFNPQzE1X1JFR19PRkZTRVQoKSBtYWNybyB3YXNuJ3QgdXNlZCwgbWFraW5nIHRoZSBz
b2Z0IHJlY292ZXJ5IGZhaWwuCj4KPiB2MjogdXNlIFdSRUczMl9TT0MxNSBpbnN0ZWFkIG9mIFdS
RUczMiArIFNPQzE1X1JFR19PRkZTRVQKPgo+IFNpZ25lZC1vZmYtYnk6IFBpZXJyZS1FcmljIFBl
bGxvdXgtUHJheWVyIDxwaWVycmUtZXJpYy5wZWxsb3V4LXByYXllckBhbWQuY29tPgo+IFJldmll
d2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAyICstCj4gICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IGluZGV4IGJjZDAzMDFlZWUxZS4uMWEyOTYzZTRiYzY4
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCj4gQEAgLTUzNzUsNyAr
NTM3NSw3IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX3Jpbmdfc29mdF9yZWNvdmVyeShzdHJ1Y3Qg
YW1kZ3B1X3JpbmcgKnJpbmcsIHVuc2lnbmVkIHZtaWQpCj4gICAJdmFsdWUgPSBSRUdfU0VUX0ZJ
RUxEKHZhbHVlLCBTUV9DTUQsIE1PREUsIDB4MDEpOwo+ICAgCXZhbHVlID0gUkVHX1NFVF9GSUVM
RCh2YWx1ZSwgU1FfQ01ELCBDSEVDS19WTUlELCAxKTsKPiAgIAl2YWx1ZSA9IFJFR19TRVRfRklF
TEQodmFsdWUsIFNRX0NNRCwgVk1fSUQsIHZtaWQpOwo+IC0JV1JFRzMyKG1tU1FfQ01ELCB2YWx1
ZSk7Cj4gKwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tU1FfQ01ELCB2YWx1ZSk7Cj4gICB9Cj4gICAK
PiAgIHN0YXRpYyB2b2lkIGdmeF92OV8wX3NldF9nZnhfZW9wX2ludGVycnVwdF9zdGF0ZShzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
