Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241D951925
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 18:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E209B89D2E;
	Mon, 24 Jun 2019 16:54:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 697AE89CDE;
 Mon, 24 Jun 2019 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id BD1DF2A604A;
 Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 5HERhpnKzLxX; Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 8802B2A604E;
 Mon, 24 Jun 2019 18:54:07 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfSEI-0003Zi-Mh; Mon, 24 Jun 2019 18:54:06 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 5/9] amdgpu: Add amdgpu_bo_handle_type_kms_user
Date: Mon, 24 Jun 2019 18:54:02 +0200
Message-Id: <20190624165406.13682-6-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624165406.13682-1-michel@daenzer.net>
References: <20190624165406.13682-1-michel@daenzer.net>
MIME-Version: 1.0
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgphbWRncHVfYm9f
aGFuZGxlX3R5cGVfa21zIHJldHVybnMgdGhlIGhhbmRsZSB2YWxpZCBmb3IgdGhlIERSTSBmaWxl
CmRlc2NyaXB0b3IgKGZkKSB1c2VkIGZvciBDUyBzdWJtaXNzaW9uIGV0Yy4gVGhpcyBpcyBhbHNv
IHZhbGlkIGZvciB0aGUKZmQgcGFzc2VkIHRvIGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZSB0aGUg
Zmlyc3QgdGltZSBmb3IgYSBzcGVjaWZpYwpHUFUsIGJ1dCBpbiBnZW5lcmFsIG5vdCBmb3IgZmRz
IHBhc3NlZCB0byBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUKbGF0ZXIgZm9yIHRoZSBzYW1lIEdQ
VS4KCkJlY2F1c2Ugc29tZSB1c2UtY2FzZXMgcmVxdWlyZSBhIGhhbmRsZSB2YWxpZCBmb3IgdGhl
IGZkIHBhc3NlZCB0bwphbWRncHVfZGV2aWNlX2luaXRpYWxpemUsIGFtZGdwdV9ib19oYW5kbGVf
dHlwZV9rbXNfdXNlciBpcyBhZGRlZCBmb3IKdGhpcyBwdXJwb3NlLgoKU2lnbmVkLW9mZi1ieTog
TWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+Ci0tLQogYW1kZ3B1L2FtZGdw
dS5oICAgICAgICAgIHwgMTQgKysrKysrKystCiBhbWRncHUvYW1kZ3B1X2JvLmMgICAgICAgfCA2
NSArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiBhbWRncHUvYW1kZ3B1
X2ludGVybmFsLmggfCAgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDIx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FtZGdwdS9hbWRncHUuaCBiL2FtZGdwdS9hbWRn
cHUuaAppbmRleCA2NmU0NWY3My4uZjk1YzBhMzYgMTAwNjQ0Ci0tLSBhL2FtZGdwdS9hbWRncHUu
aAorKysgYi9hbWRncHUvYW1kZ3B1LmgKQEAgLTgxLDcgKzgxLDE0IEBAIGVudW0gYW1kZ3B1X2Jv
X2hhbmRsZV90eXBlIHsKIAkvKiogR0VNIGZsaW5rIG5hbWUgKG5lZWRzIERSTSBhdXRoZW50aWNh
dGlvbiwgdXNlZCBieSBEUkkyKSAqLwogCWFtZGdwdV9ib19oYW5kbGVfdHlwZV9nZW1fZmxpbmtf
bmFtZSA9IDAsCiAKLQkvKiogS01TIGhhbmRsZSB3aGljaCBpcyB1c2VkIGJ5IGFsbCBkcml2ZXIg
aW9jdGxzICovCisJLyoqIEtNUyBoYW5kbGUgd2hpY2ggaXMgdXNlZCBieSBhbGwgZHJpdmVyIGlv
Y3RscworCSAqCisJICogTk9URTogVGhlIHJldHVybmVkIGhhbmRsZSBpcyB2YWxpZCBmb3IgdGhl
IERSTSBmaWxlIGRlc2NyaXB0aW9uCisJICogdXNlZCBmb3IgY29tbWFuZCBzdWJtaXNzaW9uLCB3
aGljaCBtYXkgYmUgZGlmZmVyZW50IGZyb20gdGhlIG9uZQorCSAqIHJlZmVyZW5jZWQgYnkgdGhl
IGZpbGUgZGVzY3JpcHRvciBwYXNzZWQgdG8KKwkgKiBhbWRncHVfZGV2aWNlX2luaXRpYWxpemUu
IFVzZSBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX3VzZXIgdG8KKwkgKiBnZXQgYSBoYW5kbGUg
dmFsaWQgZm9yIHRoZSBsYXR0ZXIuCisJICovCiAJYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttcyA9
IDEsCiAKIAkvKiogRE1BLWJ1ZiBmZCBoYW5kbGUgKi8KQEAgLTkxLDYgKzk4LDExIEBAIGVudW0g
YW1kZ3B1X2JvX2hhbmRsZV90eXBlIHsKIAkgKiBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zLCB1
c2UgdGhhdCBpbnN0ZWFkIG9mIHRoaXMKIAkgKi8KIAlhbWRncHVfYm9faGFuZGxlX3R5cGVfa21z
X25vaW1wb3J0ID0gMywKKworCS8qKiBLTVMgaGFuZGxlIHZhbGlkIGZvciB0aGUgRFJNIGZpbGUg
ZGVzY3JpcHRpb24gcmVmZXJlbmNlZCBieSB0aGUKKwkgKiBmaWxlIGRlc2NyaXB0b3IgcGFzc2Vk
IHRvIGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZS4KKwkgKi8KKwlhbWRncHVfYm9faGFuZGxlX3R5
cGVfa21zX3VzZXIgPSA0LAogfTsKIAogLyoqIERlZmluZSBrbm93biB0eXBlcyBvZiBHUFUgVk0g
VkEgcmFuZ2VzICovCmRpZmYgLS1naXQgYS9hbWRncHUvYW1kZ3B1X2JvLmMgYi9hbWRncHUvYW1k
Z3B1X2JvLmMKaW5kZXggN2ZlYzFmMTUuLjhkNDJkYjkwIDEwMDY0NAotLS0gYS9hbWRncHUvYW1k
Z3B1X2JvLmMKKysrIGIvYW1kZ3B1L2FtZGdwdV9iby5jCkBAIC0yMjksNDIgKzIyOSw1OCBAQCBk
cm1fcHVibGljIGludCBhbWRncHVfYm9fcXVlcnlfaW5mbyhhbWRncHVfYm9faGFuZGxlIHVzZXJf
Ym8sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgYW1kZ3B1X2JvX2dldF91c2VyX2hhbmRs
ZShzdHJ1Y3QgYW1kZ3B1X2JvICp1c2VyX2JvLAorCQkJCSAgICAgdWludDMyX3QgKnVzZXJfaGFu
ZGxlKQoreworCXN0cnVjdCBhbWRncHVfZGV2aWNlICp1c2VyX2RldiA9IHVzZXJfYm8tPmRldjsK
KwlzdHJ1Y3QgYW1kZ3B1X2NvcmVfZGV2aWNlICpkZXYgPSB1c2VyX2Rldi0+Y29yZTsKKwlzdHJ1
Y3QgYW1kZ3B1X2NvcmVfYm8gKmJvID0gdXNlcl9iby0+Y29yZTsKKwlpbnQgZG1hX2ZkOworCWlu
dCByOworCisJaWYgKHVzZXJfZGV2LT51c2VyX2ZkID09IGRldi0+ZmQpIHsKKwkJKnVzZXJfaGFu
ZGxlID0gYm8tPmhhbmRsZTsKKwkJcmV0dXJuIDA7CisJfQorCisJaWYgKHVzZXJfYm8tPnVzZXJf
aGFuZGxlKQorCQlnb3RvIG91dDsKKworCXIgPSBkcm1QcmltZUhhbmRsZVRvRkQoZGV2LT5mZCwg
Ym8tPmhhbmRsZSwgRFJNX0NMT0VYRUMsICZkbWFfZmQpOworCWlmIChyKQorCQlyZXR1cm4gcjsK
KworCXIgPSBkcm1QcmltZUZEVG9IYW5kbGUodXNlcl9kZXYtPnVzZXJfZmQsIGRtYV9mZCwgJnVz
ZXJfYm8tPnVzZXJfaGFuZGxlKTsKKwljbG9zZShkbWFfZmQpOworCWlmIChyKQorCQlyZXR1cm4g
cjsKKworb3V0OgorCSp1c2VyX2hhbmRsZSA9IHVzZXJfYm8tPnVzZXJfaGFuZGxlOworCXJldHVy
biAwOworfQorCiBzdGF0aWMgaW50IGFtZGdwdV9ib19leHBvcnRfZmxpbmsoYW1kZ3B1X2JvX2hh
bmRsZSB1c2VyX2JvKQogewogCXN0cnVjdCBhbWRncHVfY29yZV9kZXZpY2UgKmRldiA9IHVzZXJf
Ym8tPmRldi0+Y29yZTsKIAlzdHJ1Y3QgYW1kZ3B1X2NvcmVfYm8gKmJvID0gdXNlcl9iby0+Y29y
ZTsKLQlpbnQgdXNlcl9mZCA9IHVzZXJfYm8tPmRldi0+dXNlcl9mZDsKIAlzdHJ1Y3QgZHJtX2dl
bV9mbGluayBmbGluazsKLQlpbnQgZmQsIGRtYV9mZDsKLQl1aW50MzJfdCBoYW5kbGU7CiAJaW50
IHI7CiAKLQlmZCA9IGRldi0+ZmQ7Ci0JaGFuZGxlID0gYm8tPmhhbmRsZTsKIAlpZiAoYm8tPmZs
aW5rX25hbWUpCiAJCXJldHVybiAwOwogCi0JaWYgKHVzZXJfZmQgIT0gZmQpIHsKLQkJciA9IGRy
bVByaW1lSGFuZGxlVG9GRChmZCwgYm8tPmhhbmRsZSwgRFJNX0NMT0VYRUMsICZkbWFfZmQpOwot
CQlpZiAoIXIpIHsKLQkJCXIgPSBkcm1QcmltZUZEVG9IYW5kbGUodXNlcl9mZCwgZG1hX2ZkLCAm
aGFuZGxlKTsKLQkJCWNsb3NlKGRtYV9mZCk7Ci0JCX0KLQkJaWYgKHIpCi0JCQlyZXR1cm4gcjsK
LQkJZmQgPSB1c2VyX2ZkOwotCX0KIAltZW1zZXQoJmZsaW5rLCAwLCBzaXplb2YoZmxpbmspKTsK
LQlmbGluay5oYW5kbGUgPSBoYW5kbGU7CiAKLQlyID0gZHJtSW9jdGwoZmQsIERSTV9JT0NUTF9H
RU1fRkxJTkssICZmbGluayk7CisJciA9IGFtZGdwdV9ib19nZXRfdXNlcl9oYW5kbGUodXNlcl9i
bywgJmZsaW5rLmhhbmRsZSk7CiAJaWYgKHIpCiAJCXJldHVybiByOwogCi0JYm8tPmZsaW5rX25h
bWUgPSBmbGluay5uYW1lOworCXIgPSBkcm1Jb2N0bCh1c2VyX2JvLT5kZXYtPnVzZXJfZmQsIERS
TV9JT0NUTF9HRU1fRkxJTkssICZmbGluayk7CisJaWYgKHIpCisJCXJldHVybiByOwogCi0JaWYg
KHVzZXJfZmQgIT0gZGV2LT5mZCkKLQkJYW1kZ3B1X2Nsb3NlX2ttc19oYW5kbGUodXNlcl9mZCwg
aGFuZGxlKTsKKwliby0+ZmxpbmtfbmFtZSA9IGZsaW5rLm5hbWU7CiAKIAlwdGhyZWFkX211dGV4
X2xvY2soJmRldi0+Ym9fdGFibGVfbXV0ZXgpOwogCXIgPSBoYW5kbGVfdGFibGVfaW5zZXJ0KCZk
ZXYtPmJvX2ZsaW5rX25hbWVzLCBiby0+ZmxpbmtfbmFtZSwgYm8pOwpAQCAtMjk0LDYgKzMxMCw5
IEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9ib19leHBvcnQoYW1kZ3B1X2JvX2hhbmRsZSB1c2Vy
X2JvLAogCQkqc2hhcmVkX2hhbmRsZSA9IGJvLT5oYW5kbGU7CiAJCXJldHVybiAwOwogCisJY2Fz
ZSBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX3VzZXI6CisJCXJldHVybiBhbWRncHVfYm9fZ2V0
X3VzZXJfaGFuZGxlKHVzZXJfYm8sIHNoYXJlZF9oYW5kbGUpOworCiAJY2FzZSBhbWRncHVfYm9f
aGFuZGxlX3R5cGVfZG1hX2J1Zl9mZDoKIAkJcmV0dXJuIGRybVByaW1lSGFuZGxlVG9GRCh1c2Vy
X2JvLT5kZXYtPmNvcmUtPmZkLCBiby0+aGFuZGxlLAogCQkJCQkgIERSTV9DTE9FWEVDIHwgRFJN
X1JEV1IsCkBAIC0zNTUsNiArMzc0LDcgQEAgZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2JvX2ltcG9y
dChhbWRncHVfZGV2aWNlX2hhbmRsZSB1c2VyX2RldiwKIAogCWNhc2UgYW1kZ3B1X2JvX2hhbmRs
ZV90eXBlX2ttczoKIAljYXNlIGFtZGdwdV9ib19oYW5kbGVfdHlwZV9rbXNfbm9pbXBvcnQ6CisJ
Y2FzZSBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX3VzZXI6CiAJCS8qIEltcG9ydGluZyBhIEtN
UyBoYW5kbGUgaW4gbm90IGFsbG93ZWQuICovCiAJCXIgPSAtRVBFUk07CiAJCWdvdG8gdW5sb2Nr
OwpAQCAtNDA0LDYgKzQyNCw3IEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9ib19pbXBvcnQoYW1k
Z3B1X2RldmljZV9oYW5kbGUgdXNlcl9kZXYsCiAKIAljYXNlIGFtZGdwdV9ib19oYW5kbGVfdHlw
ZV9rbXM6CiAJY2FzZSBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zX25vaW1wb3J0OgorCWNhc2Ug
YW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttc191c2VyOgogCQlhc3NlcnQoMCk7IC8qIHVucmVhY2hh
YmxlICovCiAJfQogCkBAIC00ODksNiArNTEwLDEwIEBAIGRybV9wdWJsaWMgaW50IGFtZGdwdV9i
b19mcmVlKGFtZGdwdV9ib19oYW5kbGUgYnVmX2hhbmRsZSkKIAogCWlmICh1cGRhdGVfcmVmZXJl
bmNlcygmdXNlcl9iby0+cmVmY291bnQsIE5VTEwpKSB7CiAJCWFtZGdwdV9jb3JlX2JvX2ZyZWUo
dXNlcl9ibyk7CisJCWlmICh1c2VyX2JvLT51c2VyX2hhbmRsZSkgeworCQkJYW1kZ3B1X2Nsb3Nl
X2ttc19oYW5kbGUodXNlcl9iby0+ZGV2LT51c2VyX2ZkLAorCQkJCQkJdXNlcl9iby0+dXNlcl9o
YW5kbGUpOworCQl9CiAJCWZyZWUodXNlcl9ibyk7CiAJfQogCmRpZmYgLS1naXQgYS9hbWRncHUv
YW1kZ3B1X2ludGVybmFsLmggYi9hbWRncHUvYW1kZ3B1X2ludGVybmFsLmgKaW5kZXggM2EyYWI3
NGMuLmEwOGE0YWU4IDEwMDY0NAotLS0gYS9hbWRncHUvYW1kZ3B1X2ludGVybmFsLmgKKysrIGIv
YW1kZ3B1L2FtZGdwdV9pbnRlcm5hbC5oCkBAIC0xMTEsNiArMTExLDcgQEAgc3RydWN0IGFtZGdw
dV9jb3JlX2JvIHsKIAogc3RydWN0IGFtZGdwdV9ibyB7CiAJYXRvbWljX3QgcmVmY291bnQ7CisJ
dWludDMyX3QgdXNlcl9oYW5kbGU7CiAJc3RydWN0IGFtZGdwdV9ibyAqbmV4dDsKIAlzdHJ1Y3Qg
YW1kZ3B1X2NvcmVfYm8gKmNvcmU7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmRldjsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
