Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBECD620D9
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 16:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D84D89956;
	Mon,  8 Jul 2019 14:49:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0C389C7F
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 14:49:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id w9so198608wmd.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 07:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9FVxUJkFc21Y+vyyBO81bIdjDD/X9Akl9iXZGp8HTk=;
 b=cJ3SalkdkKTmkO0uA6YPhc/I280CrMVQNuSoj2amERc6SRfGXmuXRY8IHmMCEsV2/z
 F8mWjxSF5rliCgPcC5e4JSiwaKGm/enXxJutnGcJCGxOtA36lcb5IZPvCtMTh8ngQmaq
 RAm4i6SOIARoMvdtCYBQuiGLnLcuJwlnh+CdkPBG+zF6k1xEa8sUO0z6DQq9/EYId15B
 N2i3SFZyJbe3UW9Sd0uMOX1EkY+7S+ZnjU+ykqm9dh8DfKzth2Xu6am11cY5N+FpF1rd
 qd6+yTjXccQm4sOMjK9rZ+eXaZ8r3E9dmWf0Lxb4VMdfCuMpwzC7JCMmity7CxXx7yJz
 ojjQ==
X-Gm-Message-State: APjAAAWb7k8vJoqlYex+4yz2Jl7SP5xZPAmztqBrSCFC8bxHrW4jcgDy
 6asNrKPSwAFGZgDJFoFOYnoQn8sAlPW7lTOOyQmnnw==
X-Google-Smtp-Source: APXvYqy+fHUlf6e3pSPkTC1+CHHRs6Q43ymroNd0w/20URVGrdrMWWIjfai32dUGvY9grw75PdgvtM10usuC8RBleBI=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr16266625wmc.34.1562597392076; 
 Mon, 08 Jul 2019 07:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190704025822.18970-1-alexander.deucher@amd.com>
 <20190704025822.18970-2-alexander.deucher@amd.com>
In-Reply-To: <20190704025822.18970-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 10:49:40 -0400
Message-ID: <CADnq5_O_OjHvR9-L-0DF2_Crqufdsw0B7NuWDNhawixsz9OjvA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu/navi10: add thermal sensor support for
 navi10
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=I9FVxUJkFc21Y+vyyBO81bIdjDD/X9Akl9iXZGp8HTk=;
 b=ra//CH+cJFTYwThyGbt8C9mz7q1oTIfjh8USKltIDxKe4hsqsg3NpIXQnAx0Q8RgET
 b8RSWUUDYWrY7jxyYo4/96WnHZ3H79eHKdGhdo+fAZbqdA8+iMPoSE8LNepL00HMlvPL
 zLG4UiegOlXxWljwYSz93LRPuOC8RpcOeep+CPGoUWN4RsxzwLWA9rv6x83EtdCA/1hp
 G8uuRgA3cL/uLkvxdsx4N4kGUTLsR29cmwHOviyGk7A55CzslmpdWhINXJ/cg5ueDbxw
 aUC2rUdpqnwJUbZbVgTQt2MEzD7rA6gf9s1nnljdeb5VVle6wa4m2NTiS2CWsRWqzKz0
 frBg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZyBvbiB0aGlzIHNlcmllcy4KCkFsZXgKCk9uIFdlZCwgSnVsIDMsIDIwMTkgYXQgMTA6NTgg
UE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhpcyB3
YXMgZHJvcHBlZCB3aGVuIHRoZSBjb2RlIHdhcyByZWZhY3RvcmVkLiAgUmUtYWRkIGl0Cj4gZm9y
IG5hdmkxMC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDIg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9w
cHQuYwo+IGluZGV4IDU3OTRmN2NlZjFjOC4uMzRmYmM0YmUyMjRjIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IEBAIC05MDAsNiArOTAwLDQyIEBA
IHN0YXRpYyBpbnQgbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNt
dV9jb250ZXh0ICpzbXUsCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQg
bmF2aTEwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0dXJlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gYW1kX3BwX3Nl
bnNvcnMgc2Vuc29yLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVpbnQzMl90ICp2YWx1ZSkKPiArewo+ICsgICAgICAgaW50IHJldCA9IDA7Cj4gKyAgICAgICBT
bXVNZXRyaWNzX3QgbWV0cmljczsKPiArCj4gKyAgICAgICBpZiAoIXZhbHVlKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAgICByZXQgPSBzbXVfdXBkYXRlX3Rh
YmxlKHNtdSwgU01VX1RBQkxFX1NNVV9NRVRSSUNTLCAodm9pZCAqKSZtZXRyaWNzLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmYWxzZSk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsKPiArICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7
Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfSE9UU1BPVF9URU1QOgo+ICsgICAgICAg
ICAgICAgICAqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlSG90c3BvdCAqCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsKPiAr
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfRURH
RV9URU1QOgo+ICsgICAgICAgICAgICAgICAqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlRWRn
ZSAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAgU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9D
RU5USUdSQURFUzsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEFNREdQ
VV9QUF9TRU5TT1JfTUVNX1RFTVA6Cj4gKyAgICAgICAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3Mu
VGVtcGVyYXR1cmVNZW0gKgo+ICsgICAgICAgICAgICAgICAgICAgICAgIFNNVV9URU1QRVJBVFVS
RV9VTklUU19QRVJfQ0VOVElHUkFERVM7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAg
ICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAgcHJfZXJyKCJJbnZhbGlkIHNlbnNvciBmb3Ig
cmV0cmlldmluZyB0ZW1wXG4iKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gIHN0YXRpYyBib29s
IG5hdmkxMF9pc19kcG1fcnVubmluZyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSkKPiAgewo+ICAg
ICAgICAgaW50IHJldCA9IDA7Cj4gQEAgLTEyODAsNiArMTMxNiwxMiBAQCBzdGF0aWMgaW50IG5h
dmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgICAgICAg
ICAgcmV0ID0gbmF2aTEwX2dldF9ncHVfcG93ZXIoc211LCAodWludDMyX3QgKilkYXRhKTsKPiAg
ICAgICAgICAgICAgICAgKnNpemUgPSA0Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAg
ICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9IT1RTUE9UX1RFTVA6Cj4gKyAgICAgICBjYXNlIEFN
REdQVV9QUF9TRU5TT1JfRURHRV9URU1QOgo+ICsgICAgICAgY2FzZSBBTURHUFVfUFBfU0VOU09S
X01FTV9URU1QOgo+ICsgICAgICAgICAgICAgICByZXQgPSBuYXZpMTBfdGhlcm1hbF9nZXRfdGVt
cGVyYXR1cmUoc211LCBzZW5zb3IsICh1aW50MzJfdCAqKWRhdGEpOwo+ICsgICAgICAgICAgICAg
ICAqc2l6ZSA9IDQ7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjIw
LjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
