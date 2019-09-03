Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 659F5A6EBD
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7373F898A4;
	Tue,  3 Sep 2019 16:28:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640B7898A4;
 Tue,  3 Sep 2019 16:28:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62603215EA;
 Tue,  3 Sep 2019 16:28:39 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 117/167] drm/amdgpu/{uvd,
 vcn}: fetch ring's read_ptr after alloc
Date: Tue,  3 Sep 2019 12:24:29 -0400
Message-Id: <20190903162519.7136-117-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567528120;
 bh=LpJv25mrQFMkEnIS6c8cNfT3TaJ5OZwMwAlT3CcHnB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2c97q563+pQ9/HaZyqgipSYIajeVE8ogi986H2x1DAMQBbykhJikvvtgk3GozM+9u
 NQ1lIUlQVDMQm+lOc9TWFLKmbeTzaSy/m7ir0rTs9fwT6aSP4ZojuwtGyyjpzGRtt7
 ZFR+1HD+k3KKnQy24vLxCUCiKduBnRk9/MHFnq6Y=
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 Shirish S <shirish.s@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Louis Li <Ching-shih.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDUx
N2I5MWY0Y2RlMzA0M2Q3N2IyMTc4NTQ4NDczZTg1NDVlZjA3Y2IgXQoKW1doYXRdCnJlYWRwdHIg
cmVhZCBhbHdheXMgcmV0dXJucyB6ZXJvLCBzaW5jZSBtb3N0IGxpa2VseQp0aGVzZSBibG9ja3Mg
YXJlIGVpdGhlciBwb3dlciBvciBjbG9jayBnYXRlZC4KCltIb3ddCmZldGNoIHJwdHIgYWZ0ZXIg
YW1kZ3B1X3JpbmdfYWxsb2MoKSB3aGljaCBpbmZvcm1zCnRoZSBwb3dlciBtYW5hZ2VtZW50IGNv
ZGUgdGhhdCB0aGUgYmxvY2sgaXMgYWJvdXQgdG8gYmUKdXNlZCBhbmQgaGVuY2UgdGhlIGdhdGlu
ZyBpcyB0dXJuZWQgb2ZmLgoKU2lnbmVkLW9mZi1ieTogTG91aXMgTGkgPENoaW5nLXNoaWguTGlA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2hpcmlzaCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5j
IHwgNSArKysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyAgIHwgNSAr
KysrLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYyAgIHwgNSArKysrLQog
MyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwppbmRleCA0MDBmYzc0YmJhZTI3Li4yMDVl
NjgzZmI5MjA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dmNuLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBAIC00
MzEsNyArNDMxLDcgQEAgaW50IGFtZGdwdV92Y25fZGVjX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKIGludCBhbWRncHVfdmNuX2VuY19yaW5nX3Rl
c3RfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYgPSByaW5nLT5hZGV2OwotCXVpbnQzMl90IHJwdHIgPSBhbWRncHVfcmluZ19nZXRf
cnB0cihyaW5nKTsKKwl1aW50MzJfdCBycHRyOwogCXVuc2lnbmVkIGk7CiAJaW50IHI7CiAKQEAg
LTQ0MSw2ICs0NDEsOSBAQCBpbnQgYW1kZ3B1X3Zjbl9lbmNfcmluZ190ZXN0X3Jpbmcoc3RydWN0
IGFtZGdwdV9yaW5nICpyaW5nKQogCQkJICByaW5nLT5pZHgsIHIpOwogCQlyZXR1cm4gcjsKIAl9
CisKKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7CisKIAlhbWRncHVfcmluZ193
cml0ZShyaW5nLCBWQ05fRU5DX0NNRF9FTkQpOwogCWFtZGdwdV9yaW5nX2NvbW1pdChyaW5nKTsK
IApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKaW5kZXggZDQwNzA4MzlhYzgwOS4u
ODA2MTNhNzRkZjQyMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZk
X3Y2XzAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCkBAIC0x
NzAsNyArMTcwLDcgQEAgc3RhdGljIHZvaWQgdXZkX3Y2XzBfZW5jX3Jpbmdfc2V0X3dwdHIoc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nKQogc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0
X3Jpbmcoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogewogCXN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2ID0gcmluZy0+YWRldjsKLQl1aW50MzJfdCBycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3Jw
dHIocmluZyk7CisJdWludDMyX3QgcnB0cjsKIAl1bnNpZ25lZCBpOwogCWludCByOwogCkBAIC0x
ODAsNiArMTgwLDkgQEAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0X3Jpbmcoc3Ry
dWN0IGFtZGdwdV9yaW5nICpyaW5nKQogCQkJICByaW5nLT5pZHgsIHIpOwogCQlyZXR1cm4gcjsK
IAl9CisKKwlycHRyID0gYW1kZ3B1X3JpbmdfZ2V0X3JwdHIocmluZyk7CisKIAlhbWRncHVfcmlu
Z193cml0ZShyaW5nLCBIRVZDX0VOQ19DTURfRU5EKTsKIAlhbWRncHVfcmluZ19jb21taXQocmlu
Zyk7CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCmluZGV4IDA1NzE1MWIxN2I0
NTYuLmNlMTZiODMyOWFmMDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92N18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwpA
QCAtMTc1LDcgKzE3NSw3IEBAIHN0YXRpYyB2b2lkIHV2ZF92N18wX2VuY19yaW5nX3NldF93cHRy
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3Jpbmdf
dGVzdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IHJpbmctPmFkZXY7Ci0JdWludDMyX3QgcnB0ciA9IGFtZGdwdV9yaW5nX2dl
dF9ycHRyKHJpbmcpOworCXVpbnQzMl90IHJwdHI7CiAJdW5zaWduZWQgaTsKIAlpbnQgcjsKIApA
QCAtMTg4LDYgKzE4OCw5IEBAIHN0YXRpYyBpbnQgdXZkX3Y3XzBfZW5jX3JpbmdfdGVzdF9yaW5n
KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZykKIAkJCSAgcmluZy0+bWUsIHJpbmctPmlkeCwgcik7
CiAJCXJldHVybiByOwogCX0KKworCXJwdHIgPSBhbWRncHVfcmluZ19nZXRfcnB0cihyaW5nKTsK
KwogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIEhFVkNfRU5DX0NNRF9FTkQpOwogCWFtZGdwdV9y
aW5nX2NvbW1pdChyaW5nKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
