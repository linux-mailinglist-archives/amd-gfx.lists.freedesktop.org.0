Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539F62F9E
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2019 06:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631A489DEA;
	Tue,  9 Jul 2019 04:28:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F115E89DEA
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2019 04:28:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f9so19357157wre.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 21:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwBGp7F4iZ3WS2GsBlnDUBF9EgEDZYCwAs4BoGP6yXI=;
 b=feHrz5AG50y1n3vO+ZmEgw0dAYweCLSTeGNEELodpU4afsVcZx8PhIDWzJVnjaqdLO
 sXVTQdZM0MbZvsyNVxNyZFWnJUew8G5ytzNPk5gGkNH7dYfTdMA8gUypKTwrb0qpE3ni
 nsb6yjMgF+PMnvClwBzjyxvEMuQ/0Lcgn3QjYi7CLacZZsmRMd2VCG6KxejPfyfL04+4
 IILpvyod75osiSxMC+uOaTaJNEYbTTn8ftPUM5oDe28+pT/1DmfRJFC6E4mQBxxsXHkN
 Duf5lO0V9oxE8KuXZdoCr75A+rlnpyAHb2BaKTqqdzY4ZJmpNy/odu5D5a/hcm1vyMD4
 D9tg==
X-Gm-Message-State: APjAAAVn0UbZ2vMmrqkmRDtHleBO70gCydiFKn0XQYX2azrMO0MVThWW
 +Q6KB+Ty0bnJvQ41MnJK3Ps0ez12Ms2cQmZmKC+ATg==
X-Google-Smtp-Source: APXvYqxbeoXOgOrKDD10v6yNzLXZEKg6Nk/GNdZT6+p3oWhmkSan/0BlJfIAuDV0v2FNVu8yhKQHLBlb/nATn2zsiqU=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr21562120wrw.323.1562646482442; 
 Mon, 08 Jul 2019 21:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190704025822.18970-1-alexander.deucher@amd.com>
In-Reply-To: <20190704025822.18970-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 9 Jul 2019 00:27:50 -0400
Message-ID: <CADnq5_OT9RAm8MZFLLnjXTDmFUwOSGVOHTf7BvvVAVrt1UUU-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/navi10: add uclk activity sensor
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kwBGp7F4iZ3WS2GsBlnDUBF9EgEDZYCwAs4BoGP6yXI=;
 b=aMUk1Qt6ih6aySk1JQCZzUsgH8bUO1mfDUrFm3V3x/WzLS99QRPSVcijbWrflH5+z/
 2lm4BHnkm1Dvy1/LbppgEcCI0dQNjzLiCGppfXfVzESPwb7CuWKDW0LBS1RDHCIIgg4Z
 7OMf65rUawku6cNb/eIOzdZokuWXeRfxfObkgdGe9My5+qQEHt5ChQeMPPbJeE9lj1lv
 W7lbncOVUHX+amMjzGYtAleRZJkJcPQhY3wuRBqPCEqOoAHTpVKjFdMrK55zitFr8A9s
 Ufd6aXPsRwdLV9BLvEud1TtzTMtSiHSuvrGyBhWdNoKzJRhGTYbDkh9/m2RUs/pYRmhC
 +/uA==
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

UGluZz8KCk9uIFdlZCwgSnVsIDMsIDIwMTkgYXQgMTA6NTggUE0gQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUXVlcnkgdGhlIG1ldHJpY3MgdGFibGUgZm9y
IHRoZSBjdXJyZW50IHVjbGsgYWN0aXZpdHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gaW5kZXggZTAwMzk3Zjg0YjJmLi41
Nzk0ZjdjZWYxYzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEw
X3BwdC5jCj4gQEAgLTg2OSw2ICs4NjksNyBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZ3B1X3Bv
d2VyKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCB1aW50MzJfdCAqdmFsdWUpCj4gIH0KPgo+ICBz
dGF0aWMgaW50IG5hdmkxMF9nZXRfY3VycmVudF9hY3Rpdml0eV9wZXJjZW50KHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqdmFsdWUpCj4gIHsKPiAgICAgICAg
IGludCByZXQgPSAwOwo+IEBAIC04ODQsNyArODg1LDE3IEBAIHN0YXRpYyBpbnQgbmF2aTEwX2dl
dF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAg
ICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+Cj4gLSAgICAgICAq
dmFsdWUgPSBtZXRyaWNzLkF2ZXJhZ2VHZnhBY3Rpdml0eTsKPiArICAgICAgIHN3aXRjaCAoc2Vu
c29yKSB7Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfR1BVX0xPQUQ6Cj4gKyAgICAg
ICAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3MuQXZlcmFnZUdmeEFjdGl2aXR5Owo+ICsgICAgICAg
ICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9NRU1fTE9BRDoK
PiArICAgICAgICAgICAgICAgKnZhbHVlID0gbWV0cmljcy5BdmVyYWdlVWNsa0FjdGl2aXR5Owo+
ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgICAg
ICAgIHByX2VycigiSW52YWxpZCBzZW5zb3IgZm9yIHJldHJpZXZpbmcgY2xvY2sgYWN0aXZpdHlc
biIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIH0KPgo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gIH0KPiBAQCAtMTI2MCw4ICsxMjcxLDkgQEAgc3RhdGljIGludCBu
YXZpMTBfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICAgICAg
ICAgICoodWludDMyX3QgKilkYXRhID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKPiAgICAgICAg
ICAgICAgICAgKnNpemUgPSA0Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNh
c2UgQU1ER1BVX1BQX1NFTlNPUl9NRU1fTE9BRDoKPiAgICAgICAgIGNhc2UgQU1ER1BVX1BQX1NF
TlNPUl9HUFVfTE9BRDoKPiAtICAgICAgICAgICAgICAgcmV0ID0gbmF2aTEwX2dldF9jdXJyZW50
X2FjdGl2aXR5X3BlcmNlbnQoc211LCAodWludDMyX3QgKilkYXRhKTsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gbmF2aTEwX2dldF9jdXJyZW50X2FjdGl2aXR5X3BlcmNlbnQoc211LCBzZW5zb3Is
ICh1aW50MzJfdCAqKWRhdGEpOwo+ICAgICAgICAgICAgICAgICAqc2l6ZSA9IDQ7Cj4gICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBBTURHUFVfUFBfU0VOU09SX0dQVV9QT1dF
UjoKPiAtLQo+IDIuMjAuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eA==
