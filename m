Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602F142752
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D8C8931D;
	Wed, 12 Jun 2019 13:18:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93ACD8931D
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 13:18:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u8so6514872wmm.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 06:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=MP+eSQvf7YbmxcBI8nFonhcbH0Xa5i6bcii/UDOZ5H4=;
 b=g2CtcSChWUFEgg01f/JbnexCBITlgQ5rQVd7N0lW/EStdHH6y+1L4xN0h59d48HNbH
 XCsmi0M3R/IhCWXpJapuenpc7gdSMiu6lIJblSOOOMVhjmN3zA6/SBwtNt7j35nJGwff
 UG9iuWFfcdJBafWcKESNEYt83aoYkWLfvvG908nTNkMAEM+mswLvpwzO1uySLNwl5TFY
 FVcVYq8K4eYiZjeXGsfrc0xtRyArFaSiTIzFNPLVHUWvJR+nrVlEhpU75r9FpNQMJeQi
 2fgMSmIgQZq3WUUJelfLtVu1VHUn8EfaFoRcE7BrT/IvvzfdRIOUDHc6uhkjG0qCAyIw
 AnFw==
X-Gm-Message-State: APjAAAUPiJYQfT5MpI2vnw239ik/yABzB61yhiuxA/foUtNL8qy12Aj3
 /1Nq0jRnl27+oXOJDSFeSA5Jvbii
X-Google-Smtp-Source: APXvYqydbHXhV3IVh4u1TNK4C4FFZWdcgWt4Gbnx7bWvsd+CMucKlRgZUp2hIm4o7OMnqX6uwRUXsw==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr395734wmg.159.1560345489340; 
 Wed, 12 Jun 2019 06:18:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h8sm5714496wmf.12.2019.06.12.06.18.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 06:18:08 -0700 (PDT)
Subject: Re: [PATCH v3] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
To: "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
 <1560345067-20838-1-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <99ecf05a-faa9-1c94-9043-f48001aa6337@gmail.com>
Date: Wed, 12 Jun 2019 15:18:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560345067-20838-1-git-send-email-James.Zhu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MP+eSQvf7YbmxcBI8nFonhcbH0Xa5i6bcii/UDOZ5H4=;
 b=V2ogf0SUtS6F7UrorphDqeslpRj2nrFBE+DpkrvcPgC3DBa9eyKDiGK1XrU4OWvuwG
 gcLkc2RASbz7zUT9jHDhPU6xCqi8P4IosvvmUyTaI2snMUzRjLJm9VpqgTqwDkhNuiqU
 19mtwFEkK0KAw2prgXHWHWJEGvLsy82QKgUo8rU8W62a6VRsL8ryZ+RBBwbAdxuaozOT
 W/9igF8qrgkl8O6J389i3EzRDU8IWuwJOiXBSTc0v+ZE2iVKHnoCMXxF0p81js3xN/TG
 zn/QQC3ckZpaYkKESGoST/OGWapmn9/78nKTriTTzOv3jxJDQHF8LF5mlib5lV+JuQT+
 s9+g==
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
Cc: "Shamis, Leonid" <Leonid.Shamis@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTIuMDYuMTkgdW0gMTU6MTEgc2NocmllYiBaaHUsIEphbWVzOgo+IEV4cGxpY2l0bHkgc2V0
IG1tR0RTX1ZNSUQwX0JBU0UgdG8gMC4gQWxzbyB1cGRhdGUKPiBHRFNfVk1JRDBfQkFTRS9fU0la
RSB3aXRoIGRpcmVjdCByZWdpc3RlciB3cml0ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBa
aHUgPEphbWVzLlpodUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9nZnhfdjlfMC5jIHwgMzUgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+IGluZGV4IGJhMzZhMjguLjIxNWE0
YTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKPiBAQCAtMzA1LDYg
KzMwNSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZ2V0X2N1X2luZm8oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gICBzdGF0aWMgdWludDY0X3QgZ2Z4X3Y5XzBfZ2V0X2dwdV9jbG9ja19j
b3VudGVyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKPiAgIHN0YXRpYyB2b2lkIGdmeF92
OV8wX3NlbGVjdF9zZV9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHNlX251bSwg
dTMyIHNoX251bSwgdTMyIGluc3RhbmNlKTsKPiAgIHN0YXRpYyB2b2lkIGdmeF92OV8wX3Jpbmdf
ZW1pdF9kZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7Cj4gK3N0YXRpYyB1NjQgZ2Z4
X3Y5XzBfcmluZ19nZXRfcnB0cl9jb21wdXRlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7Cj4g
ICAKPiAgIHN0YXRpYyB2b2lkIGdmeF92OV8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKPiBAQCAtMzYzMCwyNSArMzYzMSwyMCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNvYzE1X3JlZ19lbnRyeSBzZWNfZGVkX2NvdW50ZXJfcmVnaXN0ZXJz
W10gPSB7Cj4gICAgICB7IFNPQzE1X1JFR19FTlRSWShHQywgMCwgbW1TUUNfRURDX0NOVDMpLCAw
LCA0LCA2fSwKPiAgIH07Cj4gICAKPiAtCj4gICBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19n
ZHNfd29ya2Fyb3VuZHMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICB7Cj4gICAJc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFkZXYtPmdmeC5jb21wdXRlX3JpbmdbMF07Cj4gLQlp
bnQgcjsKPiArCWludCBpLCByOwo+ICAgCj4gLQlyID0gYW1kZ3B1X3JpbmdfYWxsb2MocmluZywg
MTcpOwo+ICsJciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDcpOwo+ICAgCWlmIChyKSB7Cj4g
ICAJCURSTV9FUlJPUigiYW1kZ3B1OiBHRFMgd29ya2Fyb3VuZHMgZmFpbGVkIHRvIGxvY2sgcmlu
ZyAlcyAoJWQpLlxuIiwKPiAgIAkJCXJpbmctPm5hbWUsIHIpOwo+ICAgCQlyZXR1cm4gcjsKPiAg
IAl9Cj4gICAKPiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklU
RV9EQVRBLCAzKSk7Cj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBXUklURV9EQVRBX0VOR0lO
RV9TRUwoMCkgfAo+IC0JCQkJV1JJVEVfREFUQV9EU1RfU0VMKDApKTsKPiAtCWFtZGdwdV9yaW5n
X3dyaXRlKHJpbmcsIFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUpKTsK
PiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDApOwo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgYWRldi0+Z2RzLmdkc19zaXplKTsKPiArCVdSRUczMl9TT0MxNShHQywgMCwgbW1HRFNfVk1J
RDBfQkFTRSwgMHgwMDAwMDAwMCk7Cj4gKwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tR0RTX1ZNSUQw
X1NJWkUsIGFkZXYtPmdkcy5nZHNfc2l6ZSk7Cj4gICAKPiAgIAlhbWRncHVfcmluZ193cml0ZShy
aW5nLCBQQUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEsIDUpKTsKPiAgIAlhbWRncHVfcmluZ193cml0
ZShyaW5nLCAoUEFDS0VUM19ETUFfREFUQV9DUF9TWU5DIHwKPiBAQCAtMzY2MiwxOCArMzY1OCwy
MSBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fyb3VuZHMoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAJYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUM19E
TUFfREFUQV9DTURfUkFXX1dBSVQgfAo+ICAgCQkJCWFkZXYtPmdkcy5nZHNfc2l6ZSk7Cj4gICAK
PiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklURV9EQVRBLCAz
KSk7Cj4gLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCBXUklURV9EQVRBX0VOR0lORV9TRUwoMCkg
fAo+IC0JCQkJV1JJVEVfREFUQV9EU1RfU0VMKDApKTsKPiAtCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUpKTsKPiAtCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIDApOwo+IC0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHgwKTsK
PiAtCj4gICAJYW1kZ3B1X3JpbmdfY29tbWl0KHJpbmcpOwo+ICAgCj4gLQlyZXR1cm4gMDsKPiAt
fQo+ICsJZm9yIChpID0gMDsgaSA8IGFkZXYtPnVzZWNfdGltZW91dDsgaSsrKSB7Cj4gKwkJaWYg
KHJpbmctPndwdHIgPT0gZ2Z4X3Y5XzBfcmluZ19nZXRfcnB0cl9jb21wdXRlKHJpbmcpKQo+ICsJ
CQlicmVhazsKPiArCQl1ZGVsYXkoMSk7Cj4gKwl9Cj4gKwo+ICsJaWYgKGkgPj0gYWRldi0+dXNl
Y190aW1lb3V0KQo+ICsJCXIgPSAtRVRJTUVET1VUOwo+ICsKPiArCVdSRUczMl9TT0MxNShHQywg
MCwgbW1HRFNfVk1JRDBfU0laRSwgMHgwMDAwMDAwMCk7Cj4gICAKPiArCXJldHVybiByOwo+ICt9
Cj4gICAKPiAgIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
