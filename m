Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE754847C6
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 10:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269A08970E;
	Wed,  7 Aug 2019 08:41:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E448970E
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 08:41:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f17so79087541wme.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jltZz2FOD7GqoSMto4/gjojkN2Nprol2riDyo6k0Shk=;
 b=KyG2Q5SpOas2vGB8DF8rtkdZenuGl0s4losYM+h/nz5Cwc8OJizfbjQSy9cbGQwx3O
 Spi/nH/8W7y3AaBzdsQv7thEwlnlwWPMJ/1mM00WLFnTTm+OQqy3yTi78JViKmSY8Xb5
 zEef25Xkk76RNb+87oUSrSap9nndzjsArl1zFn0VWnFiRggrbXoQw/cz2Qk4HT2HH/E8
 C/eRko2+eHicNTu/IeiJUisV6fAF4aFtZZLvhO0pUM5Z4BuVir3+vHNNnukGBi7j6kjM
 fL/elxyhvXEhtnZO2Q1aX+jyWI4CrHweLfYAmbmFcCLFHSvFFaaG32F5ITBRG3bM4EgY
 sDJw==
X-Gm-Message-State: APjAAAV5PKFJKnbYbRVIFetkyTPdtNyxO+ioP8lC4aFi/aGtFyKE9YPK
 NsB5mwcVCPkAcT7QNU16TNQhsn/7
X-Google-Smtp-Source: APXvYqyermXbZz71HPxvDabBsz1q3zfrWeSHP6DUiNWWAY1bSKUmpQeADT7kDUjfkja+9tujY4Hsmg==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr9650251wme.81.1565167296555; 
 Wed, 07 Aug 2019 01:41:36 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f17sm87722188wmf.27.2019.08.07.01.41.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 01:41:35 -0700 (PDT)
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
To: "Zeng, Oak" <Oak.Zeng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3e4f2f68-8840-d85c-052e-fc54dbf45fd4@gmail.com>
Date: Wed, 7 Aug 2019 10:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jltZz2FOD7GqoSMto4/gjojkN2Nprol2riDyo6k0Shk=;
 b=C4wDHCyRXL+UyUTqkvZLuty4xVor6sIyFHowJ0I6nfA2aQ/fHlg9TPKU6hMEDS2EvV
 wUf70bLoM2FjmP27vrRtq+xU/Us1sL8oGRJf5/nDlbVbVL2lgJf/4zdcPc+VyhKhYyWy
 b2r1HdX8uqMbgWhQxOse3EIcOdWzmyQIr9ggDRCC9XxHVGT0UuZ6fjwNwPAY5xe6rkZp
 3sljbGHncUkq2wuopdbH4YOc03kilMqTw5K8zb+CaKXuto7cywllA8dfuzHJdAUXr22+
 YYH/pVhLcKWk120e5dSZfKygFNaeBdg6YYlUPiX26o7hH7W2vAmfRv+GzS6ummdgZwOo
 A1ew==
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Keely, Sean" <Sean.Keely@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDguMTkgdW0gMDQ6MzEgc2NocmllYiBaZW5nLCBPYWs6Cj4gQWRkIGRlZmluaXRpb24g
b2YgYWxsIHN1cHBvcnRlZCBtdHlwZXMuIFRoZSBSVyBtdHlwZQo+IGlzIHJlY2VudGx5IGludHJv
ZHVjZWQgZm9yIGFyY3R1cnVzLiBBbHNvIGFkZCBkZWZpbml0aW9uCj4gZm9yIHRoZSBjYWNoYWJs
ZS9zbm9vcGFibGUgYml0LCB3aGljaCB3aWxsIGJlIHVzZWQgbGF0ZXIKPiBpbiB0aGlzIHNlcmll
cy4KPgo+IENoYW5nZS1JZDogSTk2ZmM5YmI0YjZiMWU2MmJkYzEwYjYwMGQ4YWFhNmE4MDIxMjhk
NmQKPiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KPiAtLS0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5oIHwgOSArKysrKysrLS0KPiAg
IGluY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oICAgICAgICAgIHwgNCArKysrCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmggYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAo+IGluZGV4IDJlZGEzYTguLjdhNzc0NzcgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmgKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uaAo+IEBAIC04MCw4ICs4MCwx
MyBAQCBzdHJ1Y3QgYW1kZ3B1X2JvX2xpc3RfZW50cnk7Cj4gICAjZGVmaW5lIEFNREdQVV9QVEVf
TVRZUEVfVkcxMChhKQkoKHVpbnQ2NF90KShhKSA8PCA1NykKPiAgICNkZWZpbmUgQU1ER1BVX1BU
RV9NVFlQRV9WRzEwX01BU0sJQU1ER1BVX1BURV9NVFlQRV9WRzEwKDNVTEwpCj4gICAKPiAtI2Rl
ZmluZSBBTURHUFVfTVRZUEVfTkMgMAo+IC0jZGVmaW5lIEFNREdQVV9NVFlQRV9DQyAyCj4gK2Vu
dW0gYW1kZ3B1X210eXBlIHsKPiArCUFNREdQVV9NVFlQRV9OQyA9IDAsCj4gKwlBTURHUFVfTVRZ
UEVfV0MgPSAxLAo+ICsJQU1ER1BVX01UWVBFX0NDID0gMiwKPiArCUFNREdQVV9NVFlQRV9VQyA9
IDMsCj4gKwlBTURHUFVfTVRZUEVfUlcgPSA0LAo+ICt9Owo+ICAgCj4gICAjZGVmaW5lIEFNREdQ
VV9QVEVfREVGQVVMVF9BVEMgIChBTURHUFVfUFRFX1NZU1RFTSAgICAgIFwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBBTURHUFVfUFRFX1NOT09QRUQgICAgXAo+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0v
YW1kZ3B1X2RybS5oCj4gaW5kZXggY2E5N2I2OC4uMjg4OTY2MyAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1
X2RybS5oCj4gQEAgLTUwMyw2ICs1MDMsMTAgQEAgc3RydWN0IGRybV9hbWRncHVfZ2VtX29wIHsK
PiAgICNkZWZpbmUgQU1ER1BVX1ZNX01UWVBFX0NDCQkoMyA8PCA1KQo+ICAgLyogVXNlIFVDIE1U
WVBFIGluc3RlYWQgb2YgZGVmYXVsdCBNVFlQRSAqLwo+ICAgI2RlZmluZSBBTURHUFVfVk1fTVRZ
UEVfVUMJCSg0IDw8IDUpCj4gKy8qIFVzZSBSVyBNVFlQRSBpbnN0ZWFkIG9mIGRlZmF1bHQgTVRZ
UEUgKi8KPiArI2RlZmluZSBBTURHUFVfVk1fTVRZUEVfUlcJCSg1IDw8IDUpCgo+ICsvKiBDYWNo
ZWFibGUvc25vb3BhYmxlICovCj4gKyNkZWZpbmUgQU1ER1BVX1ZNX1BBR0VfU05PT1BFRAkJKDEg
PDwgOSkKClRoYXQncyBhIHJhdGhlciBiaWcgTkFLLiBDYWNoZSBzbm9vcGluZyBpcyBub3Qgc29t
ZXRoaW5nIHVzZXJzcGFjZSBpcyAKYWxsb3dlZCB0byBiZSBhd2FyZSBvZi4KCkNocmlzdGlhbi4K
Cj4gICAKPiAgIHN0cnVjdCBkcm1fYW1kZ3B1X2dlbV92YSB7Cj4gICAJLyoqIEdFTSBvYmplY3Qg
aGFuZGxlICovCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
