Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C760CEE
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 23:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5E6E532;
	Fri,  5 Jul 2019 21:06:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3285F6E532
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 21:06:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id n9so10383741wmi.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 14:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hHTZoz+uKoDK7aSOPzC29oqP1dD/U3ow39ErKmlGRBw=;
 b=IW1t70Le8WE57QOSpuoG58EnP26L1Z9bazcgj/3OXn7vfaKU56MdL/TrGoUCm3SHuJ
 BVqYTrvKMYGRMFWKZoadVk7HmM0TJc3+FKVzfowE/ezpQQXJCVs9W+PUa9mVUq9+SkKe
 K+hjz1aAAAzZDZ3f1pCEBYau+f0IM0WsftEWNFYEXSIZxqQIURQ8psuXRX5AI9IQp6bK
 ZwhMTsZ/O+mx9r2y3DiafR4wtbppNYpq45BPjZqLHoXuXO2J88doprxsG1SM+EIYbxFg
 kNFNtols8EmhjaTThg1lvUCQ064pSFkHmD3RdX2PZmoW4naI/5pS7URCvow9ekiJ1pLf
 wAwQ==
X-Gm-Message-State: APjAAAV55g+dA8cLs+hZcTvXViH+3yuf7qGBWx4HkoOGY2RZzPIprCbb
 7cMPu/FM0+yHznjjStlugSWcNb8wKucwWrAzw6w=
X-Google-Smtp-Source: APXvYqwHv1oj/WAHn9Dx46aMnEGJh1qUwcr7DcWG3S+r+O861YINnaY8HtexCaYTQYSQGqA+YAEO1VMkR+1Mi8uWWRI=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr4890159wmk.127.1562360776770; 
 Fri, 05 Jul 2019 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190704030151.6934-1-kevin1.wang@amd.com>
In-Reply-To: <20190704030151.6934-1-kevin1.wang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jul 2019 17:06:04 -0400
Message-ID: <CADnq5_PemR-+hFMou8DwFgSSx9mUR0cOwdP+jHkmpgnNcSo0Qg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: add temperature sensor support for
 navi10
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hHTZoz+uKoDK7aSOPzC29oqP1dD/U3ow39ErKmlGRBw=;
 b=KuB+p+wTdSVtftaaBLwhi0HfJh3P8J02MoEr9y4JP8AxkWQ/Odjme4vU2ISBAUVegN
 FQUd1fA01+EpK184n65Gmtcm5UlHR4GRCTZ+NnLjIcK3G0g4iH36f3W05os1/JTwrzC+
 sQQqO9O7wDKP8iQvcF8EZ+pMHg0QEbZHywNX5jI8R+ZPApNSZM69YyrC+tEzF/ej60m6
 O9LEDDZd8ETuZy1EbZceNdCAFGTwdmxd0MOZP0tmQ1IDPee/SKcx0+zsBefXQbrsngBQ
 6Wt/2bAuQGywjrFusq7UUDQpNpVncbE3IGnkkHuMnqkdKbJExJlmFJQAdg9/vfbqPGpa
 s4RQ==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "Kenenth.Feng@amd.com" <Kenenth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCAxMTowMiBQTSBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4x
LldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiB0aGUgaHdtb24gaW50ZXJmYWNlIG5lZWQgdGVtcGVy
YXR1cmUgc2Vuc29yIHR5cGUgc3VwcG9ydC4KPiAxLiBTRU5TT1JfSE9UU1BPVF9URU1QCj4gMi4g
U0VOU09SX0VER0VfVEVNUChTRU5TT1JfR1BVX1RFTVApCj4gMy4gU0VOU09SX01FTV9URU1QCj4K
PiBDaGFuZ2UtSWQ6IEkzZGI3NjJlNDAzMjA3MmZhZTY3Yzk1YjdiYTZkNjJlMjBhZTViZWFkCj4g
U2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIHwgNDIgKysrKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IGluZGV4IDc1NzRhMDIz
NTBjNi4uZDU4NzZjMjM5M2U3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYwo+IEBAIC0xMjU1LDYgKzEyNTUsNDIgQEAgc3RhdGljIGludCBuYXZpMTBf
c2V0X3dhdGVybWFya3NfdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICBy
ZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgbmF2aTEwX3RoZXJtYWxfZ2V0X3RlbXBlcmF0
dXJlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICp2YWx1ZSkKPiAr
ewo+ICsgICAgICAgU211TWV0cmljc190IG1ldHJpY3M7Cj4gKyAgICAgICBpbnQgcmV0ID0gMDsK
PiArCj4gKyAgICAgICBpZiAoIXZhbHVlKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiArCj4gKyAgICAgICByZXQgPSBzbXVfdXBkYXRlX3RhYmxlKHNtdSwgU01VX1RBQkxFX1NN
VV9NRVRSSUNTLCAodm9pZCAqKSZtZXRyaWNzLCBmYWxzZSk7Cj4gKyAgICAgICBpZiAocmV0KQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsKPiArICAgICAgIHN3aXRjaCAoc2Vuc29y
KSB7Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfSE9UU1BPVF9URU1QOgo+ICsgICAg
ICAgICAgICAgICAqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlSG90c3BvdCAqCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsK
PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1Jf
R1BVX1RFTVA6Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfRURHRV9URU1QOgo+ICsg
ICAgICAgICAgICAgICAqdmFsdWUgPSBtZXRyaWNzLlRlbXBlcmF0dXJlRWRnZSAqCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BFUl9DRU5USUdSQURFUzsK
PiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1Jf
TUVNX1RFTVA6Cj4gKyAgICAgICAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3MuVGVtcGVyYXR1cmVW
ck1lbTAgKgoKV2Ugc2hvdWxkIGNoZWNrIHdpdGggdGhlIFNNVSB0ZWFtLiAgdGhpcyBtaWdodCBi
ZSB0aGUgbWVtb3J5IHZvbHRhZ2UKcmVndWxhdG9yIHJhdGhlciB0aGFuIHRoZSBtZW1vcnkgaXRz
ZWxmLgoKQWxleAoKPiArICAgICAgICAgICAgICAgICAgICAgICBTTVVfVEVNUEVSQVRVUkVfVU5J
VFNfUEVSX0NFTlRJR1JBREVTOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGRl
ZmF1bHQ6Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiSW52YWxpZCBzZW5zb3IgZm9yIHJldHJp
ZXZpbmcgdGVtcFxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAg
ICAgfQo+ICsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IG5hdmkx
MF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBlbnVtIGFtZF9wcF9zZW5zb3JzIHNlbnNvciwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhLCB1aW50MzJfdCAqc2l6ZSkKPiBAQCAt
MTI3Niw2ICsxMzEyLDEyIEBAIHN0YXRpYyBpbnQgbmF2aTEwX3JlYWRfc2Vuc29yKHN0cnVjdCBz
bXVfY29udGV4dCAqc211LAo+ICAgICAgICAgICAgICAgICByZXQgPSBuYXZpMTBfZ2V0X2dwdV9w
b3dlcihzbXUsICh1aW50MzJfdCAqKWRhdGEpOwo+ICAgICAgICAgICAgICAgICAqc2l6ZSA9IDQ7
Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBBTURHUFVfUFBfU0VOU09S
X0hPVFNQT1RfVEVNUDoKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9FREdFX1RFTVA6
Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfTUVNX1RFTVA6Cj4gKyAgICAgICAgICAg
ICAgIHJldCA9IG5hdmkxMF90aGVybWFsX2dldF90ZW1wZXJhdHVyZShzbXUsIHNlbnNvciwgKHVp
bnQzMl90ICopZGF0YSk7Cj4gKyAgICAgICAgICAgICAgICpzaXplID0gNDsKPiArICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjIuMAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
