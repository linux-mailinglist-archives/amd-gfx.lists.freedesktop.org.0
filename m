Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F59488D
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 17:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5DD6E1D8;
	Mon, 19 Aug 2019 15:33:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED496E1D8
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 15:33:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c3so9193866wrd.7
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WxwAFNAjGY1ppFi1ev6m7GapO6bSTdYK28ftu2RBP1w=;
 b=mW8gQVlwIvnqY0NfHh7s0C39EyXhRhts7YP+JX0dz5dblFM7b7aIuvVAK8BEjzttZ+
 M51hsT8F8vcXp7VTKZ3yI4KubdZ3d+O/FnVu67ii2/8qcsmNCDVHx0MQl/ZfkfpUe81S
 yifjGi1NeBwKYicU7xq8co7+0WMZ4kz8cpAiFTLvg6ofiKdpgA9hoBXIIvsHsEsKKESA
 PsvveX4cOFrDmqnkinIYIx1E4WLNre4d+e7j7SaPxmPrWgZGR2mUNbcQd5P5hBs2k/SI
 mf5tFuXtMNdG/1so/8Pr65pGVmpqqgBNoGSv0UfBDTDEpiRMSFUWk2od1GO/ypF7nMiH
 Ws6Q==
X-Gm-Message-State: APjAAAV0cEr1MnETfjI6g0FLyVkmSuE9DKEHGE3LrX3wubsreyBKwnq1
 Q+pFNxrIbkuA6yYEMACgnQwZVv5HTxYeqRjdppj4Rylt
X-Google-Smtp-Source: APXvYqzuC4u/7bSE1mzwooIjMcUiAslqjKy9dCuhFOa3jz7z6fyotWq0gnRUlNZmhtZlJfDVhzMyEP+W4CjaYyf84aw=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr2103774wrv.323.1566228826471; 
 Mon, 19 Aug 2019 08:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190816072200.21833-1-kevin1.wang@amd.com>
In-Reply-To: <20190816072200.21833-1-kevin1.wang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 19 Aug 2019 11:33:35 -0400
Message-ID: <CADnq5_OF7RKb8DdqjGLBfgk+xF2t3S=rAmERP_zh2QSx7-Ww=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: add smu_smc_read_sensor support for
 arcturus
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WxwAFNAjGY1ppFi1ev6m7GapO6bSTdYK28ftu2RBP1w=;
 b=oI7dNOc7mMrP5vTp23d4ByJfvbq7D/VDRtvXUNBCCM1/UOtgWdTIt9Ylmc7M+g672L
 /yMKWwJQlTleKV+kDMsegMsYiqgvEbp4PJl39Zua5iyjsyVuwiG43/al270can8tF4Jk
 gcXaApA0fpKJKz3X9lcMpEpmzKlAjmm279/Extd3lNRibNf95t/tcASRkbR0abaI4MNI
 6IS6UfIRjO+b9EkObpK4b1lhtQwKL0XZPD7NnpRbyo1VWOW0PcpShXANBsYRgLdwsfsd
 XQzWcKCMOXNjKlaFzu6O2rilgtVp/WWZvM79k4+gdpC8mtgzj7tFUHn6IthtWglri4nz
 axgg==
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMzoyMiBBTSBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4x
LldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiB0aGUgYmVsbG93IHBhdGNoIHJlZmluZSB0aGUgc2Vu
c29yIHJlYWQgc2VxdWVuY2UsCj4gYnV0IG1pc3NlZCB0byBhZGQgYXJjdXR1cnMgc3VwcG9ydC4g
KGFyY3V0dXJzX3BwdC5jKQo+Cj4gZHJtL2FtZC9wb3dlcnBsYXk6IGNoYW5nZSBzbXVfcmVhZF9z
ZW5zb3Igc2VxdWVuY2UgaW4gc211Cj4KPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXYW5nIDxrZXZp
bjEud2FuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9h
cmN0dXJ1c19wcHQuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJj
dHVydXNfcHB0LmMKPiBpbmRleCBmY2Y2MjNjZjVkMmMuLjg1MGIyYTFlZjMyOSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hcmN0dXJ1c19wcHQuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jCj4gQEAgLTEwMTIs
NiArMTAxMiw5IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9j
b250ZXh0ICpzbXUsCj4gICAgICAgICBQUFRhYmxlX3QgKnBwdGFibGUgPSB0YWJsZV9jb250ZXh0
LT5kcml2ZXJfcHB0YWJsZTsKPiAgICAgICAgIGludCByZXQgPSAwOwo+Cj4gKyAgICAgICBpZigh
ZGF0YSB8fCAhc2l6ZSkKClBsZWFzZSBhZGQgYSBzcGFjZSBiZXR3ZWVuIGlmIHRoZSBpZiBhbmQg
dGhlICguICBFLmcuLAppZiAoIWRhdGEgfHwgIXNpemUpCgpBbGV4Cgo+ICsgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiArCj4gICAgICAgICBzd2l0Y2ggKHNlbnNvcikgewo+ICAgICAg
ICAgY2FzZSBBTURHUFVfUFBfU0VOU09SX01BWF9GQU5fUlBNOgo+ICAgICAgICAgICAgICAgICAq
KHVpbnQzMl90ICopZGF0YSA9IHBwdGFibGUtPkZhbk1heGltdW1ScG07Cj4gQEAgLTEwMzYsNyAr
MTAzOSw3IEBAIHN0YXRpYyBpbnQgYXJjdHVydXNfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUsCj4gICAgICAgICAgICAgICAgICpzaXplID0gNDsKPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArICAgICAgICAgICAgICAgcmV0ID0gc211X3NtY19yZWFkX3NlbnNvcihzbXUsIHNlbnNv
ciwgZGF0YSwgc2l6ZSk7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4gLS0K
PiAyLjIyLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
