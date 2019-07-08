Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5243362503
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 17:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9923989EBD;
	Mon,  8 Jul 2019 15:47:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5489EBD
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 15:47:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y4so9091275wrm.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 08:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TYLBJglmnFkQuL79w9LL+jduBLHNJm9IY3NQ8n4+2GY=;
 b=c2DHGbPOdplI7UTTJStQlfRuclgfnFEl0Fu6vBTZy29RPORhMkyDo6lKjDaUD2C76v
 jNxxoSwK0Sh5KM3Hmn3Rv7FrRuW59dSZT/njHT5yRIUpgX2rgafhhwvsUXyX0yh3JUrZ
 0Lb5qmBQou4jMUWxx5wcgSFaMU+ZWNiXJw9t5Y75LIl7ayhWTpbBjsF8GeWAn8RZ1bYv
 ec6r8nUsDkJU2i4p+dNwWrPGxZhjOQAbCV9STDHcyIpm3JMnF+XGksQ9eRwFQpkH3oEv
 nihx4yF5GW8BeFIBd45mJIo6x2kPlAib+0uQ7NWgg5Ggy0EqMQ+hoCiv//WrpELljwHN
 t0zA==
X-Gm-Message-State: APjAAAV6uyUQagmovW1srDwPKayxqJ9DuAYj2C7UcOStYFalrTfqCQ0q
 kLPrV4I48ObTBK023+8dvZUofOsEzLeDdzJw6GBUeg==
X-Google-Smtp-Source: APXvYqxJbmChbHjj5fVf1ZL30xuxbsbfxzTEYQjrFOjGHT0KN0vYBQFuSthHInPaE6DxZtAcrC+d6o4mT5UbN8ohVYQ=
X-Received: by 2002:adf:d847:: with SMTP id k7mr423155wrl.74.1562600868965;
 Mon, 08 Jul 2019 08:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190705204142.10231-1-alexander.deucher@amd.com>
 <c62c35e2-a920-081b-6dfc-7fdab8a8b1ba@daenzer.net>
 <25d7a737-534d-8200-2b24-60080218db64@amd.com>
In-Reply-To: <25d7a737-534d-8200-2b24-60080218db64@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 11:47:36 -0400
Message-ID: <CADnq5_Nv-8-jY4FPGWUrDPAUP4TBg_amaR4DGPqyUtkmrNcJzA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: properly guard DC support in navi code
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TYLBJglmnFkQuL79w9LL+jduBLHNJm9IY3NQ8n4+2GY=;
 b=A+TLg2IJ+yAx+j3l1ioHTm3tHCsJ223/ep2X86YnlT9jHBQbxAHZNNlrFuo3Ps3usL
 MqpuoYB3uPH8x6UOgbH/zUJGUQSzOTrnMs1B5hVfrstubtaJ2Y/INHyDW2PJRG8UwErO
 +MD5cmOnPfXAP+NZ3sAO9K9+YkUYrPxD3aimlCqO7a9G/5xT9ASgEvqK42dT84nvsceb
 EkJnsVM3ftPN8rX9iQ3uM2djefaiVNaiZb7L8JO03W8Yj+lnNofBhM4PvojWp2HYoAc5
 3K3FhzblirWchsZpHSeMWNWOHZMIT+Aqc/excrR5ecY188ZeaTIAeK/LymJdMtbJx4DZ
 7vwA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgOCwgMjAxOSBhdCA4OjU2IEFNIEthemxhdXNrYXMsIE5pY2hvbGFzCjxOaWNo
b2xhcy5LYXpsYXVza2FzQGFtZC5jb20+IHdyb3RlOgo+Cj4gT24gNy84LzE5IDU6MTUgQU0sIE1p
Y2hlbCBEw6RuemVyIHdyb3RlOgo+ID4gT24gMjAxOS0wNy0wNSAxMDo0MSBwLm0uLCBBbGV4IERl
dWNoZXIgd3JvdGU6Cj4gPj4gTmVlZCB0byBhZGQgYXBwcm9wcmlhdGUgaWZkZWYuCj4gPj4KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jIHwgNCArKysr
Cj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L252LmMKPiA+PiBpbmRleCBhMDkwZTNmZGM3NjIuLmVlMzljYjc0MGQ0MSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCj4gPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwo+ID4+IEBAIC0zNTIsOCArMzUyLDEyIEBA
IGludCBudl9zZXRfaXBfYmxvY2tzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFkZXYsICZzbXVf
djExXzBfaXBfYmxvY2spOwo+ID4+ICAgICAgICAgICAgICBpZiAoYWRldi0+ZW5hYmxlX3ZpcnR1
YWxfZGlzcGxheSB8fCBhbWRncHVfc3Jpb3ZfdmYoYWRldikpCj4gPj4gICAgICAgICAgICAgICAg
ICAgICAgYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRjZV92aXJ0dWFsX2lwX2Js
b2NrKTsKPiA+PiArI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMpCj4gPj4gICAgICAgICAg
ICAgIGVsc2UgaWYgKGFtZGdwdV9kZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpCj4gPj4gICAg
ICAgICAgICAgICAgICAgICAgYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmRtX2lw
X2Jsb2NrKTsKPiA+PiArI2Vsc2UKPiA+PiArIyAgIHdhcm5pbmcgIkVuYWJsZSBDT05GSUdfRFJN
X0FNRF9EQyBmb3IgZGlzcGxheSBzdXBwb3J0IG9uIG5hdmkuIgo+ID4+ICsjZW5kaWYKPiA+PiAg
ICAgICAgICAgICAgYW1kZ3B1X2RldmljZV9pcF9ibG9ja19hZGQoYWRldiwgJmdmeF92MTBfMF9p
cF9ibG9jayk7Cj4gPj4gICAgICAgICAgICAgIGFtZGdwdV9kZXZpY2VfaXBfYmxvY2tfYWRkKGFk
ZXYsICZzZG1hX3Y1XzBfaXBfYmxvY2spOwo+ID4+ICAgICAgICAgICAgICBpZiAoYWRldi0+Zmly
bXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX0RJUkVDVCAmJgo+ID4+Cj4gPgo+ID4g
SXMgQ09ORklHX0RSTV9BTURfREMgc3RpbGwgbmVlZGVkPyBXaGF0IGZvcj8gKE90aGVyIHRoYW4g
YWNjaWRlbnRhbGx5Cj4gPiBkaXNhYmxpbmcgZGlzcGxheSB3aXRoIGN1cnJlbnQgaGFyZHdhcmUg
OykKPiA+Cj4gPgo+Cj4gSXQgd291bGQgc2xpbSBkb3duIG1vZHVsZSBzaXplIGFuZCBjb21waWxl
IHRpbWVzIGlmIHlvdSBqdXN0IG5lZWRlZAo+IFJhZGVvbiBhbmQgbm90aGluZyBlbHNlLCBidXQg
aXQncyBraW5kIG9mIGEgbmljaGUgdXNlIGNhc2UuCj4KPiBJIHRoaW5rIHRoZSBvbmx5IHRoaW5n
IGl0IGRvZXMgcmlnaHQgbm93IGlzIGF1dG9zZWxlY3QgRENOIGJhc2VkIG9uCj4gd2hldGhlciB3
ZSB0aGluayB3ZSBoYXZlIEZQIHN1cHBvcnQgb3Igbm90LCBidXQgdGhhdCBjb3VsZCBwcm9iYWJs
eSBiZQo+IG1vdmVkIGVsc2V3aGVyZS4KCkNhbiBJIGdldCBhbiBhY2sgb3IgUkIgb24gdGhpcz8g
IFdlIGNhbiBkZWNpZGUgd2hhdCB0byBkbyBhYm91dCB0aGUKb3B0aW9uIGxhdGVyLgoKQWxleAoK
Pgo+IE5pY2hvbGFzIEthemxhdXNrYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
