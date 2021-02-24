Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DF9323C45
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Feb 2021 13:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D926EAAD;
	Wed, 24 Feb 2021 12:53:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126456EAAB;
 Wed, 24 Feb 2021 12:53:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D19F464F0F;
 Wed, 24 Feb 2021 12:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171192;
 bh=95OhmrsHd187ZEFzLgEb3J9NBS5se0IR+XVuZpxLees=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uHEVxm2BAOVmmLtbXbFE8mYt3i9wVhMjoOQ4fKCuDt4yoPSOQKWbCGlrwZeg1h4Bn
 xU1ol5UMeDQ4x3DZ/6oaSjGTDaPxzcWuLKuJGCvjKaljCGQL7OIy2MIRTKFGNoFAbc
 /grFlzXKB4BHMR+PRLEEn/GDMWJUj0dofkkzZSeSs8Sw/Baqf+ZZk0ZNSNOxSbutgZ
 T0rGGSZB8VHz/5Lwe1Z2l9HT2QOPC8MxPJkFJxcHrbGJvjTVL8+wVOMbt9JymHtaIb
 2dRn4578D6Yj6amjFH8uEOr6DyAwUf2Mq48wM4TStDy1DU+xuJbjs5Dsapu4PQI/rV
 x6sthCD0ZpBbQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 45/56] drm/amdgpu: enable only one high prio
 compute queue
Date: Wed, 24 Feb 2021 07:52:01 -0500
Message-Id: <20210224125212.482485-45-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
OGMwMjI1ZDc5MjczOTY4YTY1ZTczYTQyMDRmYmEwMjNhZTAyNzE0ZCBdCgpGb3IgaGlnaCBwcmlv
cml0eSBjb21wdXRlIHRvIHdvcmsgcHJvcGVybHkgd2UgbmVlZCB0byBlbmFibGUKd2F2ZSBsaW1p
dGluZyBvbiBnZnggcGlwZS4gV2F2ZSBsaW1pdGluZyBpcyBkb25lIHRocm91Z2ggd3JpdGluZwpp
bnRvIG1tU1BJX1dDTF9QSVBFX1BFUkNFTlRfR0ZYIHJlZ2lzdGVyLiBFbmFibGUgb25seSBvbmUg
aGlnaApwcmlvcml0eSBjb21wdXRlIHF1ZXVlIHRvIGF2b2lkIHJhY2UgY29uZGl0aW9uIGJldHdl
ZW4gbXVsdGlwbGUKaGlnaCBwcmlvcml0eSBjb21wdXRlIHF1ZXVlcyB3cml0aW5nIHRoYXQgcmVn
aXN0ZXIgc2ltdWx0YW5lb3VzbHkuCgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3ku
ZGFzQGFtZC5jb20+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFt
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1k
LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyB8IDE1ICsrKysrKysrLS0t
LS0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIHwgIDIgKy0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jICB8ICA2ICsrLS0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyAgIHwgIDYgKystLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jICAgfCAgNyArKy0tLS0tCiA1IGZpbGVzIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZnguYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZnguYwppbmRleCBjNDg1ZWM4NjgwNGU1Li4wMzRhMGYzYjRjNjYwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5jCkBAIC0xOTMsMTUgKzE5Mywx
NiBAQCBzdGF0aWMgYm9vbCBhbWRncHVfZ2Z4X2lzX211bHRpcGlwZV9jYXBhYmxlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQogfQogCiBib29sIGFtZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0
eV9jb21wdXRlX3F1ZXVlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAotCQkJCQkgICAgICAg
aW50IHBpcGUsIGludCBxdWV1ZSkKKwkJCQkJICAgICAgIHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZykKIHsKLQlib29sIG11bHRpcGlwZV9wb2xpY3kgPSBhbWRncHVfZ2Z4X2lzX211bHRpcGlwZV9j
YXBhYmxlKGFkZXYpOwotCWludCBjb25kOwotCS8qIFBvbGljeTogYWx0ZXJuYXRlIGJldHdlZW4g
bm9ybWFsIGFuZCBoaWdoIHByaW9yaXR5ICovCi0JY29uZCA9IG11bHRpcGlwZV9wb2xpY3kgPyBw
aXBlIDogcXVldWU7Ci0KLQlyZXR1cm4gKChjb25kICUgMikgIT0gMCk7CisJLyogUG9saWN5OiB1
c2UgMXN0IHF1ZXVlIGFzIGhpZ2ggcHJpb3JpdHkgY29tcHV0ZSBxdWV1ZSBpZiB3ZQorCSAqIGhh
dmUgbW9yZSB0aGFuIG9uZSBjb21wdXRlIHF1ZXVlLgorCSAqLworCWlmIChhZGV2LT5nZngubnVt
X2NvbXB1dGVfcmluZ3MgPiAxICYmCisJICAgIHJpbmcgPT0gJmFkZXYtPmdmeC5jb21wdXRlX3Jp
bmdbMF0pCisJCXJldHVybiB0cnVlOwogCisJcmV0dXJuIGZhbHNlOwogfQogCiB2b2lkIGFtZGdw
dV9nZnhfY29tcHV0ZV9xdWV1ZV9hY3F1aXJlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dmeC5oCmluZGV4IGYzNTNhNWI3MTgwNGUu
LjZlMGNiYTZmNGJkY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZnguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2Z4LmgK
QEAgLTM3Myw3ICszNzMsNyBAQCB2b2lkIGFtZGdwdV9xdWV1ZV9tYXNrX2JpdF90b19tZWNfcXVl
dWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBiaXQsCiBib29sIGFtZGdwdV9nZnhf
aXNfbWVjX3F1ZXVlX2VuYWJsZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBtZWMs
CiAJCQkJICAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsKIGJvb2wgYW1kZ3B1X2dmeF9pc19oaWdo
X3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0JCQkJ
CSAgICAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsKKwkJCQkJICAgICAgIHN0cnVjdCBhbWRncHVf
cmluZyAqcmluZyk7CiBpbnQgYW1kZ3B1X2dmeF9tZV9xdWV1ZV90b19iaXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsIGludCBtZSwKIAkJCSAgICAgICBpbnQgcGlwZSwgaW50IHF1ZXVlKTsK
IHZvaWQgYW1kZ3B1X2dmeF9iaXRfdG9fbWVfcXVldWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIGludCBiaXQsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCmluZGV4IDRl
YmI0M2UwOTA5OTkuLjRjYzgzYjM5OWI2NmIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2dmeF92MTBfMC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dm
eF92MTBfMC5jCkBAIC00MzM0LDggKzQzMzQsNyBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9jb21w
dXRlX3JpbmdfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHJpbmdfaWQsCiAJ
aXJxX3R5cGUgPSBBTURHUFVfQ1BfSVJRX0NPTVBVVEVfTUVDMV9QSVBFMF9FT1AKIAkJKyAoKHJp
bmctPm1lIC0gMSkgKiBhZGV2LT5nZngubWVjLm51bV9waXBlX3Blcl9tZWMpCiAJCSsgcmluZy0+
cGlwZTsKLQlod19wcmlvID0gYW1kZ3B1X2dmeF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVl
dWUoYWRldiwgcmluZy0+cGlwZSwKLQkJCQkJCQkgICAgcmluZy0+cXVldWUpID8KKwlod19wcmlv
ID0gYW1kZ3B1X2dmeF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmluZykg
PwogCQkJQU1ER1BVX0dGWF9QSVBFX1BSSU9fSElHSCA6IEFNREdQVV9HRlhfUElQRV9QUklPX05P
Uk1BTDsKIAkvKiB0eXBlLTIgcGFja2V0cyBhcmUgZGVwcmVjYXRlZCBvbiBNRUMsIHVzZSB0eXBl
LTMgaW5zdGVhZCAqLwogCXIgPSBhbWRncHVfcmluZ19pbml0KGFkZXYsIHJpbmcsIDEwMjQsCkBA
IC02MzYxLDggKzYzNjAsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjEwXzBfY29tcHV0ZV9tcWRfc2V0
X3ByaW9yaXR5KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0CiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSByaW5nLT5hZGV2OwogCiAJaWYgKHJpbmctPmZ1bmNzLT50eXBlID09
IEFNREdQVV9SSU5HX1RZUEVfQ09NUFVURSkgewotCQlpZiAoYW1kZ3B1X2dmeF9pc19oaWdoX3By
aW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmluZy0+cGlwZSwKLQkJCQkJCQkgICAgICByaW5n
LT5xdWV1ZSkpIHsKKwkJaWYgKGFtZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0eV9jb21wdXRlX3F1
ZXVlKGFkZXYsIHJpbmcpKSB7CiAJCQltcWQtPmNwX2hxZF9waXBlX3ByaW9yaXR5ID0gQU1ER1BV
X0dGWF9QSVBFX1BSSU9fSElHSDsKIAkJCW1xZC0+Y3BfaHFkX3F1ZXVlX3ByaW9yaXR5ID0KIAkJ
CQlBTURHUFVfR0ZYX1FVRVVFX1BSSU9SSVRZX01BWElNVU07CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y4XzAuYwppbmRleCBjMzYyNThkNTZiNDQ1Li5mMmY2MDNmYTAyODhkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMKQEAgLTE5MTUsOCArMTkxNSw3IEBAIHN0YXRp
YyBpbnQgZ2Z4X3Y4XzBfY29tcHV0ZV9yaW5nX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsIGludCByaW5nX2lkLAogCQkrICgocmluZy0+bWUgLSAxKSAqIGFkZXYtPmdmeC5tZWMubnVt
X3BpcGVfcGVyX21lYykKIAkJKyByaW5nLT5waXBlOwogCi0JaHdfcHJpbyA9IGFtZGdwdV9nZnhf
aXNfaGlnaF9wcmlvcml0eV9jb21wdXRlX3F1ZXVlKGFkZXYsIHJpbmctPnBpcGUsCi0JCQkJCQkJ
ICAgIHJpbmctPnF1ZXVlKSA/CisJaHdfcHJpbyA9IGFtZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0
eV9jb21wdXRlX3F1ZXVlKGFkZXYsIHJpbmcpID8KIAkJCUFNREdQVV9HRlhfUElQRV9QUklPX0hJ
R0ggOiBBTURHUFVfUklOR19QUklPX0RFRkFVTFQ7CiAJLyogdHlwZS0yIHBhY2tldHMgYXJlIGRl
cHJlY2F0ZWQgb24gTUVDLCB1c2UgdHlwZS0zIGluc3RlYWQgKi8KIAlyID0gYW1kZ3B1X3Jpbmdf
aW5pdChhZGV2LCByaW5nLCAxMDI0LApAQCAtNDQzNCw4ICs0NDMzLDcgQEAgc3RhdGljIHZvaWQg
Z2Z4X3Y4XzBfbXFkX3NldF9wcmlvcml0eShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHN0cnVj
dCB2aV9tcWQgKm0KIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7CiAK
IAlpZiAocmluZy0+ZnVuY3MtPnR5cGUgPT0gQU1ER1BVX1JJTkdfVFlQRV9DT01QVVRFKSB7Ci0J
CWlmIChhbWRncHVfZ2Z4X2lzX2hpZ2hfcHJpb3JpdHlfY29tcHV0ZV9xdWV1ZShhZGV2LCByaW5n
LT5waXBlLAotCQkJCQkJCSAgICAgIHJpbmctPnF1ZXVlKSkgeworCQlpZiAoYW1kZ3B1X2dmeF9p
c19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmluZykpIHsKIAkJCW1xZC0+Y3Bf
aHFkX3BpcGVfcHJpb3JpdHkgPSBBTURHUFVfR0ZYX1BJUEVfUFJJT19ISUdIOwogCQkJbXFkLT5j
cF9ocWRfcXVldWVfcHJpb3JpdHkgPQogCQkJCUFNREdQVV9HRlhfUVVFVUVfUFJJT1JJVFlfTUFY
SU1VTTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCmluZGV4IDk1N2MxMmI3Mjc2
NzYuLmZhODQzYmRhNzBiYTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpA
QCAtMjIyOCw4ICsyMjI4LDcgQEAgc3RhdGljIGludCBnZnhfdjlfMF9jb21wdXRlX3JpbmdfaW5p
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IHJpbmdfaWQsCiAJaXJxX3R5cGUgPSBB
TURHUFVfQ1BfSVJRX0NPTVBVVEVfTUVDMV9QSVBFMF9FT1AKIAkJKyAoKHJpbmctPm1lIC0gMSkg
KiBhZGV2LT5nZngubWVjLm51bV9waXBlX3Blcl9tZWMpCiAJCSsgcmluZy0+cGlwZTsKLQlod19w
cmlvID0gYW1kZ3B1X2dmeF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmlu
Zy0+cGlwZSwKLQkJCQkJCQkgICAgcmluZy0+cXVldWUpID8KKwlod19wcmlvID0gYW1kZ3B1X2dm
eF9pc19oaWdoX3ByaW9yaXR5X2NvbXB1dGVfcXVldWUoYWRldiwgcmluZykgPwogCQkJQU1ER1BV
X0dGWF9QSVBFX1BSSU9fSElHSCA6IEFNREdQVV9HRlhfUElQRV9QUklPX05PUk1BTDsKIAkvKiB0
eXBlLTIgcGFja2V0cyBhcmUgZGVwcmVjYXRlZCBvbiBNRUMsIHVzZSB0eXBlLTMgaW5zdGVhZCAq
LwogCXJldHVybiBhbWRncHVfcmluZ19pbml0KGFkZXYsIHJpbmcsIDEwMjQsCkBAIC0zMzg0LDkg
KzMzODMsNyBAQCBzdGF0aWMgdm9pZCBnZnhfdjlfMF9tcWRfc2V0X3ByaW9yaXR5KHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywgc3RydWN0IHY5X21xZCAqbQogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gcmluZy0+YWRldjsKIAogCWlmIChyaW5nLT5mdW5jcy0+dHlwZSA9PSBBTURHUFVf
UklOR19UWVBFX0NPTVBVVEUpIHsKLQkJaWYgKGFtZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0eV9j
b21wdXRlX3F1ZXVlKGFkZXYsCi0JCQkJCQkJICAgICAgcmluZy0+cGlwZSwKLQkJCQkJCQkgICAg
ICByaW5nLT5xdWV1ZSkpIHsKKwkJaWYgKGFtZGdwdV9nZnhfaXNfaGlnaF9wcmlvcml0eV9jb21w
dXRlX3F1ZXVlKGFkZXYsIHJpbmcpKSB7CiAJCQltcWQtPmNwX2hxZF9waXBlX3ByaW9yaXR5ID0g
QU1ER1BVX0dGWF9QSVBFX1BSSU9fSElHSDsKIAkJCW1xZC0+Y3BfaHFkX3F1ZXVlX3ByaW9yaXR5
ID0KIAkJCQlBTURHUFVfR0ZYX1FVRVVFX1BSSU9SSVRZX01BWElNVU07Ci0tIAoyLjI3LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
