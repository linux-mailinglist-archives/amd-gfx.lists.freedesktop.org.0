Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E405BAC6C8
	for <lists+amd-gfx@lfdr.de>; Sat,  7 Sep 2019 15:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2402189E36;
	Sat,  7 Sep 2019 13:43:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 713F489E36
 for <amd-gfx@lists.freedesktop.org>; Sat,  7 Sep 2019 13:43:00 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id n10so9959220wmj.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 07 Sep 2019 06:43:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yKbl4tH1wde+fQgnHGFW1YjRddkcGhHz9/O6W7kteZk=;
 b=UsvvI5g1AymyCppR43gBkApuIHcKobZ6+lZLnfiIkDEipvvk7EqwoeZmUY31V95qJ4
 lPTYx5WEqbcoGuSmjlqvYj3xyaDCZF7uKVhu8eNfxDVViMyspEuZG6GK3iHN+ge+p2Lp
 Ddfia1ubV5go/i7kqkxQEyzjjUYzkO6aryX56UQFvbSAE1gnOownbCNYNQRRwp1JYQYX
 I088jNL1BjR8kSb8t3qIOpJHyrWPdcbPjbqD6OkINNWj4dyMvf+W7NMk7IINC0b1GBQH
 ALpmhiKB8003KuDN/l6LkoiLNEpPfnNe8Lh1jGrHRxqOTsqmP7hMRruBUaguj9w1l+qo
 XHAA==
X-Gm-Message-State: APjAAAVbKpc0WGvCiecLdJ0MMpxjGcxnrlvPXB2hk2x1mJSmZLpsKkc4
 p3o05UgHTZdztuQqAJtbNtDv42t9w9JCiGHno4I=
X-Google-Smtp-Source: APXvYqxMIzJTLb0ajQsuHIXwfqHWQT93GapB8di19t1IYiK0k22wteLkdW2/x3hUnT7pMV4iWfLn4LlmFomOqyPiMQI=
X-Received: by 2002:a1c:ca02:: with SMTP id a2mr12232859wmg.127.1567863778933; 
 Sat, 07 Sep 2019 06:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 7 Sep 2019 09:42:47 -0400
Message-ID: <CADnq5_Op_OnBdKrLpKD4_WZYd_+Jxd9NBcGfpmD8+4-qr6S8kw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Allow to reset to EERPOM table.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=yKbl4tH1wde+fQgnHGFW1YjRddkcGhHz9/O6W7kteZk=;
 b=Bm8brjggTD5jbjVIi3lLN2AOVTgJI2Y7iorQWEb7E39i2sTC2jjtpjAjlytBxk7dmn
 HFdURGlrZ1jRsTd27GmaP1zTynLbvfBFi/exTeddD8FysJ+l9UV5Xy3P10mdNWiH0g7n
 vsMvv/lsiZvztQpZvd5Gp4/TjP+/XLzdilxINyfrm5ihnZ/uJ8kTxK+4CmlVg0aY7KTf
 3P9YHg3UQSvJOfVUmmzFDSV7mjN548vgk7KDnRF2dyWl3GRy0JMq6I8/M3EYCb+bDgfY
 +9DHslKjhOFPsa49kUuwWjQINwZAsEYCRLyhd5crRX+0RXvPUm+rS4hQnawrAsQBaf6h
 j2lA==
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
Cc: Tao Zhou <Tao.Zhou1@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCAxMToxMyBBTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdGFibGUgZ3Jvd3MgcXVpY2tseSBk
dXJpbmcgZGVidWcvZGV2ZWxvcG1lbnQgZWZmb3J0IHdoZW4KPiBtdWx0aXBsZSBSQVMgZXJyb3Jz
IGFyZSBpbmplY3RlZC4gQWxsb3cgdG8gYXZvaWQgdGhpcyBieSBzZXR0aW5nCj4gdGFibGUgaGVh
ZGVyIGJhY2sgdG8gZW1wdHkgaWYgbmVlZGVkLgo+CgpQbGVhc2UgbWFrZSB0aGlzIGEgZGVidWdm
cyBmaWxlIHJhdGhlciB0aGFuIGEgbW9kdWxlIHBhcmFtZXRlciBzbyB0aGF0Cml0IGFuIGJlIHVw
ZGF0ZWQgYXQgcnVudGltZSBhbmQgbW9yZSBlYXNpbHkgaGFuZGxlZCBvbiBhIHBlciBjYXJkCmJh
c2lzLgoKQWxleAoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmggICAgICAgICAgICB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMgICAgICAgIHwgOCArKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfcmFzX2VlcHJvbS5jIHwgMyArKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aAo+IGluZGV4IDBkMTFhYTguLjQwNWM1NWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaAo+IEBAIC0xNjksNiArMTY5LDcgQEAgZXh0ZXJuIGludCBhbWRncHVfZGlzY292ZXJ5
Owo+ICBleHRlcm4gaW50IGFtZGdwdV9tZXM7Cj4gIGV4dGVybiBpbnQgYW1kZ3B1X25vcmV0cnk7
Cj4gIGV4dGVybiBpbnQgYW1kZ3B1X2ZvcmNlX2FzaWNfdHlwZTsKPiArZXh0ZXJuIGludCBhbWRn
cHVfcmFzX2VlcHJvbV9yZXNldDsKPgo+ICAjaWZkZWYgQ09ORklHX0RSTV9BTURHUFVfU0kKPiAg
ZXh0ZXJuIGludCBhbWRncHVfc2lfc3VwcG9ydDsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jCj4gaW5kZXggNWE3ZjkyOS4uNmUxMDFhNSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBAQCAtMTQ1LDYgKzE0NSw3IEBAIGludCBhbWRn
cHVfZGlzY292ZXJ5ID0gLTE7Cj4gIGludCBhbWRncHVfbWVzID0gMDsKPiAgaW50IGFtZGdwdV9u
b3JldHJ5ID0gMTsKPiAgaW50IGFtZGdwdV9mb3JjZV9hc2ljX3R5cGUgPSAtMTsKPiAraW50IGFt
ZGdwdV9yYXNfZWVwcm9tX3Jlc2V0ID0gLTE7Cj4KPiAgc3RydWN0IGFtZGdwdV9tZ3B1X2luZm8g
bWdwdV9pbmZvID0gewo+ICAgICAgICAgLm11dGV4ID0gX19NVVRFWF9JTklUSUFMSVpFUihtZ3B1
X2luZm8ubXV0ZXgpLAo+IEBAIC01MzAsNiArNTMxLDEzIEBAIE1PRFVMRV9QQVJNX0RFU0MocmFz
X21hc2ssICJNYXNrIG9mIFJBUyBmZWF0dXJlcyB0byBlbmFibGUgKGRlZmF1bHQgMHhmZmZmZmZm
ZiksCj4gIG1vZHVsZV9wYXJhbV9uYW1lZChyYXNfbWFzaywgYW1kZ3B1X3Jhc19tYXNrLCB1aW50
LCAwNDQ0KTsKPgo+ICAvKioKPiArICogRE9DOiByYXNfZWVwcm9tX3Jlc2V0IChpbnQpCj4gKyAq
IFJlc2V0IEVFUFJPTSB0YWJsZSB0byB6ZXJybyBlbnRyaWVzLgo+ICsgKi8KPiArTU9EVUxFX1BB
Uk1fREVTQyhyYXNfZWVwcm9tX3Jlc2V0LCAiUmVzZXQgUkFTIEVFUFJPTSB0YWJsZSB0byB6ZXJy
byBlbnRyaWVzICgxID0gcmVzZXQsIC0xID0gYXV0byAoZGVmYXVsdCAtIGRvbid0IHJlc2V0KSIp
Owo+ICttb2R1bGVfcGFyYW1fbmFtZWQocmFzX2VlcHJvbV9yZXNldCwgYW1kZ3B1X3Jhc19lZXBy
b21fcmVzZXQsIGludCwgMDQ0NCk7Cj4gKwo+ICsvKioKPiAgICogRE9DOiBzaV9zdXBwb3J0IChp
bnQpCj4gICAqIFNldCBTSSBzdXBwb3J0IGRyaXZlci4gVGhpcyBwYXJhbWV0ZXIgd29ya3MgYWZ0
ZXIgc2V0IGNvbmZpZyBDT05GSUdfRFJNX0FNREdQVV9TSS4gRm9yIFNJIGFzaWMsIHdoZW4gcmFk
ZW9uIGRyaXZlciBpcyBlbmFibGVkLAo+ICAgKiBzZXQgdmFsdWUgMCB0byB1c2UgcmFkZW9uIGRy
aXZlciwgd2hpbGUgc2V0IHZhbHVlIDEgdG8gdXNlIGFtZGdwdSBkcml2ZXIuIFRoZSBkZWZhdWx0
IGlzIHVzaW5nIHJhZGVvbiBkcml2ZXIgd2hlbiBpdCBhdmFpbGFibGUsCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXNfZWVwcm9tLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzX2VlcHJvbS5jCj4gaW5kZXggNDNkZDRhYi4u
NzVjNmZjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzX2VlcHJvbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
c19lZXByb20uYwo+IEBAIC0xNDAsNyArMTQwLDggQEAgaW50IGFtZGdwdV9yYXNfZWVwcm9tX2lu
aXQoc3RydWN0IGFtZGdwdV9yYXNfZWVwcm9tX2NvbnRyb2wgKmNvbnRyb2wpCj4KPiAgICAgICAg
IF9fZGVjb2RlX3RhYmxlX2hlYWRlcl9mcm9tX2J1ZmYoaGRyLCAmYnVmZlsyXSk7Cj4KPiAtICAg
ICAgIGlmIChoZHItPmhlYWRlciA9PSBFRVBST01fVEFCTEVfSERSX1ZBTCkgewo+ICsgICAgICAg
aWYgKGFtZGdwdV9yYXNfZWVwcm9tX3Jlc2V0ICE9IDEgJiYKPiArICAgICAgICAgICBoZHItPmhl
YWRlciA9PSBFRVBST01fVEFCTEVfSERSX1ZBTCkgewo+ICAgICAgICAgICAgICAgICBjb250cm9s
LT5udW1fcmVjcyA9IChoZHItPnRibF9zaXplIC0gRUVQUk9NX1RBQkxFX0hFQURFUl9TSVpFKSAv
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRUVQUk9NX1RBQkxFX1JFQ09S
RF9TSVpFOwo+ICAgICAgICAgICAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJGb3VuZCBleGlzdGlu
ZyBFRVBST00gdGFibGUgd2l0aCAlZCByZWNvcmRzIiwKPiAtLQo+IDIuNy40Cj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
