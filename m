Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE856B4C
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 15:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04AD46E43F;
	Wed, 26 Jun 2019 13:53:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B396891E7;
 Wed, 26 Jun 2019 13:24:31 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hg7uW-0008DR-43; Wed, 26 Jun 2019 13:24:28 +0000
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nikola Cornij <nikola.cornij@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][next[ drm/amd/display: fix a couple of spelling mistakes
Date: Wed, 26 Jun 2019 14:24:27 +0100
Message-Id: <20190626132427.12615-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 13:53:51 +0000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGFy
ZSBhIGNvdXBsZSBvZiBzcGVsbGluZyBtaXN0YWtlcyBpbiBkbV9lcnJvciBtZXNzYWdlcyBhbmQK
YSBjb21tZW50LiBGaXggdGhlc2UuCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29s
aW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24yMC9kY24yMF9kc2MuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kc2MvZGNfZHNjLmMgICAgICB8IDggKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kc2MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9kYy9kY24yMC9kY24yMF9kc2MuYwppbmRleCBiZTQ5ZmM3ZjRhYmUuLmZmZDAwMTRlYzNi
NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIw
X2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9k
c2MuYwpAQCAtMTI2LDcgKzEyNiw3IEBAIHN0YXRpYyB2b2lkIGRzYzJfZ2V0X2VuY19jYXBzKHN0
cnVjdCBkc2NfZW5jX2NhcHMgKmRzY19lbmNfY2FwcywgaW50IHBpeGVsX2Nsb2NrCiAKIAkvKiBN
YXhpbXVtIHRvdGFsIHRocm91Z2hwdXQgd2l0aCBhbGwgdGhlIHNsaWNlcyBjb21iaW5lZC4gVGhp
cyBpcyBkaWZmZXJlbnQgZnJvbSBob3cgRFAgc3BlYyBzcGVjaWZpZXMgaXQuCiAJICogT3VyIGRl
Y29kZXIncyB0b3RhbCB0aHJvdWdocHV0IGluIFBpeC9zIGlzIGVxdWFsIHRvIERJU1BDTEsuIFRo
aXMgaXMgdGhlbiBzaGFyZWQgYmV0d2VlbiBzbGljZXMuCi0JICogVGhlIHZhbHVlIGJlbG93IGlz
IHRoZSBhYnNvbHV0ZSBtYXhpbXVtIHZhbHVlLiBUaGUgYWN0dWFsIHRocm91Z3B1dCBtYXkgYmUg
bG93ZXIsIGJ1dCBpdCdsbCBhbHdheXMKKwkgKiBUaGUgdmFsdWUgYmVsb3cgaXMgdGhlIGFic29s
dXRlIG1heGltdW0gdmFsdWUuIFRoZSBhY3R1YWwgdGhyb3VnaHB1dCBtYXkgYmUgbG93ZXIsIGJ1
dCBpdCdsbCBhbHdheXMKIAkgKiBiZSBzdWZmaWNpZW50IHRvIHByb2Nlc3MgdGhlIGlucHV0IHBp
eGVsIHJhdGUgZmVkIGludG8gYSBzaW5nbGUgRFNDIGVuZ2luZS4KIAkgKi8KIAlkc2NfZW5jX2Nh
cHMtPm1heF90b3RhbF90aHJvdWdocHV0X21wcyA9IERDTjIwX01BWF9ESVNQTEFZX0NMT0NLX01o
ejsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kc2MvZGNfZHNj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCmluZGV4IDc3
ZTdhMGY4YTUyNy4uZWY1Zjg0YTE0NGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZHNjL2RjX2RzYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kc2MvZGNfZHNjLmMKQEAgLTQ3LDcgKzQ3LDcgQEAgc3RhdGljIGJvb2wgZHNjX2J1ZmZf
YmxvY2tfc2l6ZV9mcm9tX2RwY2QoaW50IGRwY2RfYnVmZl9ibG9ja19zaXplLCBpbnQgKmJ1ZmZf
YmwKIAkJKmJ1ZmZfYmxvY2tfc2l6ZSA9IDY0ICogMTAyNDsKIAkJYnJlYWs7CiAJZGVmYXVsdDog
ewotCQkJZG1fZXJyb3IoIiVzOiBEUENEIERTQyBidWZmZXIgc2l6ZSBub3QgcmVjb2dpbnplZC5c
biIsIF9fZnVuY19fKTsKKwkJCWRtX2Vycm9yKCIlczogRFBDRCBEU0MgYnVmZmVyIHNpemUgbm90
IHJlY29nbml6ZWQuXG4iLCBfX2Z1bmNfXyk7CiAJCQlyZXR1cm4gZmFsc2U7CiAJCX0KIAl9CkBA
IC02Myw3ICs2Myw3IEBAIHN0YXRpYyBib29sIGRzY19saW5lX2J1ZmZfZGVwdGhfZnJvbV9kcGNk
KGludCBkcGNkX2xpbmVfYnVmZl9iaXRfZGVwdGgsIGludCAqbGluCiAJZWxzZSBpZiAoZHBjZF9s
aW5lX2J1ZmZfYml0X2RlcHRoID09IDgpCiAJCSpsaW5lX2J1ZmZfYml0X2RlcHRoID0gODsKIAll
bHNlIHsKLQkJZG1fZXJyb3IoIiVzOiBEUENEIERTQyBidWZmZXIgZGVwdGggbm90IHJlY29naW56
ZWQuXG4iLCBfX2Z1bmNfXyk7CisJCWRtX2Vycm9yKCIlczogRFBDRCBEU0MgYnVmZmVyIGRlcHRo
IG5vdCByZWNvZ25pemVkLlxuIiwgX19mdW5jX18pOwogCQlyZXR1cm4gZmFsc2U7CiAJfQogCkBA
IC0xMjMsNyArMTIzLDcgQEAgc3RhdGljIGJvb2wgZHNjX3Rocm91Z2hwdXRfZnJvbV9kcGNkKGlu
dCBkcGNkX3Rocm91Z2hwdXQsIGludCAqdGhyb3VnaHB1dCkKIAkJKnRocm91Z2hwdXQgPSAxMDAw
OwogCQlicmVhazsKIAlkZWZhdWx0OiB7Ci0JCQlkbV9lcnJvcigiJXM6IERQQ0QgRFNDIHRocm91
Z3B1dCBtb2RlIG5vdCByZWNvZ2luemVkLlxuIiwgX19mdW5jX18pOworCQkJZG1fZXJyb3IoIiVz
OiBEUENEIERTQyB0aHJvdWdocHV0IG1vZGUgbm90IHJlY29nbml6ZWQuXG4iLCBfX2Z1bmNfXyk7
CiAJCQlyZXR1cm4gZmFsc2U7CiAJCX0KIAl9CkBAIC0xNTIsNyArMTUyLDcgQEAgc3RhdGljIGJv
b2wgZHNjX2JwcF9pbmNyZW1lbnRfZGl2X2Zyb21fZHBjZChpbnQgYnBwX2luY3JlbWVudF9kcGNk
LCB1aW50MzJfdCAqYnAKIAkJKmJwcF9pbmNyZW1lbnRfZGl2ID0gMTsKIAkJYnJlYWs7CiAJZGVm
YXVsdDogewotCQlkbV9lcnJvcigiJXM6IERQQ0QgRFNDIGJpdHMtcGVyLXBpeGVsIGluY3JlbWVu
dCBub3QgcmVjb2dpbnplZC5cbiIsIF9fZnVuY19fKTsKKwkJZG1fZXJyb3IoIiVzOiBEUENEIERT
QyBiaXRzLXBlci1waXhlbCBpbmNyZW1lbnQgbm90IHJlY29nbml6ZWQuXG4iLCBfX2Z1bmNfXyk7
CiAJCXJldHVybiBmYWxzZTsKIAl9CiAJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
