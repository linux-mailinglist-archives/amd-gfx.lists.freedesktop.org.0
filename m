Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5571D7E051
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 18:37:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C126E72B;
	Thu,  1 Aug 2019 16:37:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ABD6E726;
 Thu,  1 Aug 2019 16:37:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 4CE8328C6AC
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: Provide ddc symlink in connector sysfs directory
Date: Thu,  1 Aug 2019 18:36:38 +0200
Message-Id: <20190801163638.17957-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <7cacac43-737e-1ddb-2951-394fcf9ad0b2@baylibre.com>
References: <7cacac43-737e-1ddb-2951-394fcf9ad0b2@baylibre.com>
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>, narmstrong@baylibre.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, kernel@collabora.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KVGhpcyBpcyB0aGUgc2FtZSBwYXRjaCBhcyBpbiB0aGUgc2VyaWVzOgoKaHR0cHM6
Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZHJpLWRldmVsL21zZzIyMDEyOC5odG1sCgpidXQgdGhp
cyB0aW1lIHdpdGhvdXQgYSBidWcuCgpyYWRlb25fYWRkX2xlZ2FjeV9jb25uZWN0b3IoKSB1c2Vz
IGEgbG9jYWwgZGRjIHZhcmlhYmxlLCBidXQgaXQgaGFzCm5vdCBiZWVuIGRlY2xhcmVkIGluIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2guCgpDb21waWxlIHRlc3RlZC4KCiBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMgfCAxNDMgKysrKysrKysrKysr
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTA3IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3Rv
cnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYwppbmRleCBj
NjBkMWE0NGQyMmEuLjYyZDM3ZWRkZjk5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Nvbm5lY3RvcnMuYwpAQCAtMTg3MCw2ICsxODcwLDcgQEAgcmFkZW9uX2FkZF9hdG9tX2Nv
bm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCXN0cnVjdCByYWRlb25fY29ubmVjdG9y
X2F0b21fZGlnICpyYWRlb25fZGlnX2Nvbm5lY3RvcjsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXI7CiAJc3RydWN0IHJhZGVvbl9lbmNvZGVyICpyYWRlb25fZW5jb2RlcjsKKwlzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmRkYyA9IE5VTEw7CiAJdWludDMyX3Qgc3VicGl4ZWxfb3JkZXIgPSBTdWJQ
aXhlbE5vbmU7CiAJYm9vbCBzaGFyZWRfZGRjID0gZmFsc2U7CiAJYm9vbCBpc19kcF9icmlkZ2Ug
PSBmYWxzZTsKQEAgLTE5NDcsMTcgKzE5NDgsMjEgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3Rv
cihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdiA9
IHJhZGVvbl9kaWdfY29ubmVjdG9yOwogCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCXJhZGVv
bl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsK
LQkJCWlmIChyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQorCQkJaWYgKHJhZGVvbl9jb25uZWN0
b3ItPmRkY19idXMpIHsKIAkJCQloYXNfYXV4ID0gdHJ1ZTsKLQkJCWVsc2UKKwkJCQlkZGMgPSAm
cmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKKwkJCX0gZWxzZSB7CiAJCQkJRFJN
X0VSUk9SKCJEUDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJj
IGVycm9ycy5cbiIpOworCQkJfQogCQl9CiAJCXN3aXRjaCAoY29ubmVjdG9yX3R5cGUpIHsKIAkJ
Y2FzZSBEUk1fTU9ERV9DT05ORUNUT1JfVkdBOgogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9E
VklBOgogCQlkZWZhdWx0OgotCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25u
ZWN0b3ItPmJhc2UsCi0JCQkJCSAgICZyYWRlb25fZHBfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0
b3JfdHlwZSk7CisJCQlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoZGV2LCAmcmFkZW9uX2Nv
bm5lY3Rvci0+YmFzZSwKKwkJCQkJCSAgICAmcmFkZW9uX2RwX2Nvbm5lY3Rvcl9mdW5jcywKKwkJ
CQkJCSAgICBjb25uZWN0b3JfdHlwZSwKKwkJCQkJCSAgICBkZGMpOwogCQkJZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLAogCQkJCQkJICZyYWRlb25fZHBf
Y29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCQljb25uZWN0b3ItPmludGVybGFjZV9hbGxvd2Vk
ID0gdHJ1ZTsKQEAgLTE5NzksOCArMTk4NCwxMCBAQCByYWRlb25fYWRkX2F0b21fY29ubmVjdG9y
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0hETUlB
OgogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQjoKIAkJY2FzZSBEUk1fTU9ERV9DT05O
RUNUT1JfRGlzcGxheVBvcnQ6Ci0JCQlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmcmFkZW9uX2Nv
bm5lY3Rvci0+YmFzZSwKLQkJCQkJICAgJnJhZGVvbl9kcF9jb25uZWN0b3JfZnVuY3MsIGNvbm5l
Y3Rvcl90eXBlKTsKKwkJCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25f
Y29ubmVjdG9yLT5iYXNlLAorCQkJCQkJICAgICZyYWRlb25fZHBfY29ubmVjdG9yX2Z1bmNzLAor
CQkJCQkJICAgIGNvbm5lY3Rvcl90eXBlLAorCQkJCQkJICAgIGRkYyk7CiAJCQlkcm1fY29ubmVj
dG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsCiAJCQkJCQkgJnJhZGVvbl9k
cF9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5
KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCkBAIC0yMDI3LDggKzIwMzQsMTAgQEAgcmFk
ZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJYnJlYWs7
CiAJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0xWRFM6CiAJCWNhc2UgRFJNX01PREVfQ09OTkVD
VE9SX2VEUDoKLQkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5i
YXNlLAotCQkJCQkgICAmcmFkZW9uX2x2ZHNfYnJpZGdlX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVj
dG9yX3R5cGUpOworCQkJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsCisJCQkJCQkgICAgJnJhZGVvbl9sdmRzX2JyaWRnZV9jb25uZWN0b3Jf
ZnVuY3MsCisJCQkJCQkgICAgY29ubmVjdG9yX3R5cGUsCisJCQkJCQkgICAgZGRjKTsKIAkJCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwKIAkJCQkJCSAm
cmFkZW9uX2RwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJZHJtX29iamVjdF9hdHRhY2hf
cHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UuYmFzZSwKQEAgLTIwNDIsMTMgKzIwNTEs
MTggQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CX0gZWxzZSB7CiAJCXN3aXRjaCAoY29ubmVjdG9yX3R5cGUpIHsKIAkJY2FzZSBEUk1fTU9ERV9D
T05ORUNUT1JfVkdBOgotCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwot
CQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxpZCkg
ewogCQkJCXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2
LCBpMmNfYnVzKTsKIAkJCQlpZiAoIXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCiAJCQkJCURS
TV9FUlJPUigiVkdBOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBp
MmMgZXJyb3JzLlxuIik7CisJCQkJZWxzZQorCQkJCQlkZGMgPSAmcmFkZW9uX2Nvbm5lY3Rvci0+
ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0KKwkJCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhk
ZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLAorCQkJCQkJICAgICZyYWRlb25fdmdhX2Nvbm5l
Y3Rvcl9mdW5jcywKKwkJCQkJCSAgICBjb25uZWN0b3JfdHlwZSwKKwkJCQkJCSAgICBkZGMpOwor
CQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRh
Y19sb2FkX2RldGVjdCA9IHRydWU7CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFk
ZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkJICAgICAgcmRldi0+bW9kZV9pbmZvLmxv
YWRfZGV0ZWN0X3Byb3BlcnR5LApAQCAtMjA2NywxMyArMjA4MSwxOCBAQCByYWRlb25fYWRkX2F0
b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQljb25uZWN0b3ItPmRvdWJs
ZXNjYW5fYWxsb3dlZCA9IHRydWU7CiAJCQlicmVhazsKIAkJY2FzZSBEUk1fTU9ERV9DT05ORUNU
T1JfRFZJQToKLQkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5i
YXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKLQkJCWRy
bV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92
Z2FfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJ
CQlyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29rdXAocmRldiwgaTJj
X2J1cyk7CiAJCQkJaWYgKCFyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQogCQkJCQlEUk1fRVJS
T1IoIkRWSUE6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1lc2cgZm9yIGkyYyBl
cnJvcnMuXG4iKTsKKwkJCQllbHNlCisJCQkJCWRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNf
YnVzLT5hZGFwdGVyOwogCQkJfQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwg
JnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsCisJCQkJCQkgICAgJnJhZGVvbl92Z2FfY29ubmVjdG9y
X2Z1bmNzLAorCQkJCQkJICAgIGNvbm5lY3Rvcl90eXBlLAorCQkJCQkJICAgIGRkYyk7CisJCQlk
cm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25f
dmdhX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGFjX2xv
YWRfZGV0ZWN0ID0gdHJ1ZTsKIAkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZyYWRlb25f
Y29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJCQkgICAgICByZGV2LT5tb2RlX2luZm8ubG9hZF9k
ZXRlY3RfcHJvcGVydHksCkBAIC0yMDk4LDEzICsyMTE3LDE4IEBAIHJhZGVvbl9hZGRfYXRvbV9j
b25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJCQlnb3RvIGZhaWxlZDsKIAkJCXJh
ZGVvbl9kaWdfY29ubmVjdG9yLT5pZ3BfbGFuZV9pbmZvID0gaWdwX2xhbmVfaW5mbzsKIAkJCXJh
ZGVvbl9jb25uZWN0b3ItPmNvbl9wcml2ID0gcmFkZW9uX2RpZ19jb25uZWN0b3I7Ci0JCQlkcm1f
Y29ubmVjdG9yX2luaXQoZGV2LCAmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9kdmlf
Y29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Ci0JCQlkcm1fY29ubmVjdG9yX2hlbHBl
cl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rv
ci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwogCQkJCWlmICgh
cmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQkJRFJNX0VSUk9SKCJEVkk6IEZhaWxlZCB0
byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKKwkJCQll
bHNlCisJCQkJCWRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVyOwogCQkJ
fQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgJnJhZGVvbl9jb25uZWN0b3It
PmJhc2UsCisJCQkJCQkgICAgJnJhZGVvbl9kdmlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCQkJICAg
IGNvbm5lY3Rvcl90eXBlLAorCQkJCQkJICAgIGRkYyk7CisJCQlkcm1fY29ubmVjdG9yX2hlbHBl
cl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MpOwogCQkJc3VicGl4ZWxfb3JkZXIgPSBTdWJQaXhlbEhvcml6b250YWxSR0I7CiAJ
CQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNl
LAogCQkJCQkJICAgICAgcmRldi0+bW9kZV9pbmZvLmNvaGVyZW50X21vZGVfcHJvcGVydHksCkBA
IC0yMTU1LDEzICsyMTc5LDE4IEBAIHJhZGVvbl9hZGRfYXRvbV9jb25uZWN0b3Ioc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwKIAkJCQlnb3RvIGZhaWxlZDsKIAkJCXJhZGVvbl9kaWdfY29ubmVjdG9y
LT5pZ3BfbGFuZV9pbmZvID0gaWdwX2xhbmVfaW5mbzsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmNv
bl9wcml2ID0gcmFkZW9uX2RpZ19jb25uZWN0b3I7Ci0JCQlkcm1fY29ubmVjdG9yX2luaXQoZGV2
LCAmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9kdmlfY29ubmVjdG9yX2Z1bmNzLCBj
b25uZWN0b3JfdHlwZSk7Ci0JCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25u
ZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJaWYg
KGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVv
bl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwogCQkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+
ZGRjX2J1cykKIAkJCQkJRFJNX0VSUk9SKCJIRE1JOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMh
IENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQkJZWxzZQorCQkJCQlkZGMgPSAm
cmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0KKwkJCWRybV9jb25uZWN0
b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLAorCQkJCQkJICAg
ICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywKKwkJCQkJCSAgICBjb25uZWN0b3JfdHlwZSwK
KwkJCQkJCSAgICBkZGMpOworCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29u
bmVjdG9yLT5iYXNlLCAmcmFkZW9uX2R2aV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWRy
bV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJ
CQkJCQkgICAgICByZGV2LT5tb2RlX2luZm8uY29oZXJlbnRfbW9kZV9wcm9wZXJ0eSwKIAkJCQkJ
CSAgICAgIDEpOwpAQCAtMjIwNSwxNSArMjIzNCwyMCBAQCByYWRlb25fYWRkX2F0b21fY29ubmVj
dG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZ290byBmYWlsZWQ7CiAJCQlyYWRlb25f
ZGlnX2Nvbm5lY3Rvci0+aWdwX2xhbmVfaW5mbyA9IGlncF9sYW5lX2luZm87CiAJCQlyYWRlb25f
Y29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9yOwotCQkJZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHBfY29ubmVj
dG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Ci0JCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQo
JnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHBfY29ubmVjdG9yX2hlbHBlcl9mdW5j
cyk7CiAJCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCQlyYWRlb25fY29ubmVjdG9yLT5kZGNf
YnVzID0gcmFkZW9uX2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7Ci0JCQkJaWYgKHJhZGVvbl9j
b25uZWN0b3ItPmRkY19idXMpCisJCQkJaWYgKHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpIHsK
IAkJCQkJaGFzX2F1eCA9IHRydWU7Ci0JCQkJZWxzZQorCQkJCQlkZGMgPSAmcmFkZW9uX2Nvbm5l
Y3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKKwkJCQl9IGVsc2UgewogCQkJCQlEUk1fRVJST1IoIkRQ
OiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxu
Iik7CisJCQkJfQogCQkJfQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgJnJh
ZGVvbl9jb25uZWN0b3ItPmJhc2UsCisJCQkJCQkgICAgJnJhZGVvbl9kcF9jb25uZWN0b3JfZnVu
Y3MsCisJCQkJCQkgICAgY29ubmVjdG9yX3R5cGUsCisJCQkJCQkgICAgZGRjKTsKKwkJCWRybV9j
b25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9kcF9j
b25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCXN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxIb3Jp
em9udGFsUkdCOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UuYmFzZSwKIAkJCQkJCSAgICAgIHJkZXYtPm1vZGVfaW5mby5jb2hlcmVudF9tb2Rl
X3Byb3BlcnR5LApAQCAtMjI1NSwxNSArMjI4OSwyMCBAQCByYWRlb25fYWRkX2F0b21fY29ubmVj
dG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZ290byBmYWlsZWQ7CiAJCQlyYWRlb25f
ZGlnX2Nvbm5lY3Rvci0+aWdwX2xhbmVfaW5mbyA9IGlncF9sYW5lX2luZm87CiAJCQlyYWRlb25f
Y29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9yOwotCQkJZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZWRwX2Nvbm5l
Y3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRk
KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2RwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVu
Y3MpOwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRj
X2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwotCQkJCWlmIChyYWRlb25f
Y29ubmVjdG9yLT5kZGNfYnVzKQorCQkJCWlmIChyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKSB7
CiAJCQkJCWhhc19hdXggPSB0cnVlOwotCQkJCWVsc2UKKwkJCQkJZGRjID0gJnJhZGVvbl9jb25u
ZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7CisJCQkJfSBlbHNlIHsKIAkJCQkJRFJNX0VSUk9SKCJE
UDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5c
biIpOworCQkJCX0KIAkJCX0KKwkJCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZy
YWRlb25fY29ubmVjdG9yLT5iYXNlLAorCQkJCQkJICAgICZyYWRlb25fZWRwX2Nvbm5lY3Rvcl9m
dW5jcywKKwkJCQkJCSAgICBjb25uZWN0b3JfdHlwZSwKKwkJCQkJCSAgICBkZGMpOworCQkJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2Rw
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHko
JnJhZGVvbl9jb25uZWN0b3ItPmJhc2UuYmFzZSwKIAkJCQkJCSAgICAgIGRldi0+bW9kZV9jb25m
aWcuc2NhbGluZ19tb2RlX3Byb3BlcnR5LAogCQkJCQkJICAgICAgRFJNX01PREVfU0NBTEVfRlVM
TFNDUkVFTik7CkBAIC0yMjc0LDcgKzIzMTMsMTAgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3Rv
cihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9TVklE
RU86CiAJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0NvbXBvc2l0ZToKIAkJY2FzZSBEUk1fTU9E
RV9DT05ORUNUT1JfOVBpbkRJTjoKLQkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25f
Y29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3R2X2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5
cGUpOworCQkJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UsCisJCQkJCQkgICAgJnJhZGVvbl90dl9jb25uZWN0b3JfZnVuY3MsCisJCQkJCQkg
ICAgY29ubmVjdG9yX3R5cGUsCisJCQkJCQkgICAgZGRjKTsKIAkJCWRybV9jb25uZWN0b3JfaGVs
cGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl90dl9jb25uZWN0b3JfaGVs
cGVyX2Z1bmNzKTsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRhY19sb2FkX2RldGVjdCA9IHRydWU7
CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5i
YXNlLApAQCAtMjI5NCwxMyArMjMzNiwxOCBAQCByYWRlb25fYWRkX2F0b21fY29ubmVjdG9yKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZ290byBmYWlsZWQ7CiAJCQlyYWRlb25fZGlnX2Nv
bm5lY3Rvci0+aWdwX2xhbmVfaW5mbyA9IGlncF9sYW5lX2luZm87CiAJCQlyYWRlb25fY29ubmVj
dG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9yOwotCQkJZHJtX2Nvbm5lY3Rvcl9p
bml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3Jf
ZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKLQkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFk
ZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mp
OwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1
cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwogCQkJCWlmICghcmFkZW9uX2Nv
bm5lY3Rvci0+ZGRjX2J1cykKIAkJCQkJRFJNX0VSUk9SKCJMVkRTOiBGYWlsZWQgdG8gYXNzaWdu
IGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQkJZWxzZQorCQkJ
CQlkZGMgPSAmcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0KKwkJCWRy
bV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLAor
CQkJCQkJICAgICZyYWRlb25fbHZkc19jb25uZWN0b3JfZnVuY3MsCisJCQkJCQkgICAgY29ubmVj
dG9yX3R5cGUsCisJCQkJCQkgICAgZGRjKTsKKwkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgm
cmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVu
Y3MpOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3ItPmJh
c2UuYmFzZSwKIAkJCQkJCSAgICAgIGRldi0+bW9kZV9jb25maWcuc2NhbGluZ19tb2RlX3Byb3Bl
cnR5LAogCQkJCQkJICAgICAgRFJNX01PREVfU0NBTEVfRlVMTFNDUkVFTik7CkBAIC0yMzQ0LDYg
KzIzOTEsNyBAQCByYWRlb25fYWRkX2xlZ2FjeV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwKIAlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJ
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsKIAlzdHJ1Y3QgcmFkZW9uX2Nvbm5lY3Rv
ciAqcmFkZW9uX2Nvbm5lY3RvcjsKKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IE5VTEw7CiAJ
dWludDMyX3Qgc3VicGl4ZWxfb3JkZXIgPSBTdWJQaXhlbE5vbmU7CiAKIAlpZiAoY29ubmVjdG9y
X3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX1Vua25vd24pCkBAIC0yMzc4LDEzICsyNDI2LDE4
IEBAIHJhZGVvbl9hZGRfbGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CiAJc3dpdGNoIChjb25uZWN0b3JfdHlwZSkgewogCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX1ZH
QToKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZy
YWRlb25fdmdhX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQlkcm1fY29ubmVj
dG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5l
Y3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCXJhZGVvbl9j
b25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKIAkJ
CWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQlEUk1fRVJST1IoIlZHQTogRmFp
bGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOwor
CQkJZWxzZQorCQkJCWRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVyOwog
CQl9CisJCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25fY29ubmVjdG9y
LT5iYXNlLAorCQkJCQkgICAgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2Z1bmNzLAorCQkJCQkgICAg
Y29ubmVjdG9yX3R5cGUsCisJCQkJCSAgICBkZGMpOworCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9h
ZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MpOwogCQlyYWRlb25fY29ubmVjdG9yLT5kYWNfbG9hZF9kZXRlY3QgPSB0cnVlOwogCQlk
cm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAog
CQkJCQkgICAgICByZGV2LT5tb2RlX2luZm8ubG9hZF9kZXRlY3RfcHJvcGVydHksCkBAIC0yMzk1
LDEzICsyNDQ4LDE4IEBAIHJhZGVvbl9hZGRfbGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCQljb25uZWN0b3ItPmRvdWJsZXNjYW5fYWxsb3dlZCA9IHRydWU7CiAJCWJy
ZWFrOwogCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RWSUE6Ci0JCWRybV9jb25uZWN0b3JfaW5p
dChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfZnVu
Y3MsIGNvbm5lY3Rvcl90eXBlKTsKLQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25f
Y29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJ
aWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQlyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0gcmFk
ZW9uX2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7CiAJCQlpZiAoIXJhZGVvbl9jb25uZWN0b3It
PmRkY19idXMpCiAJCQkJRFJNX0VSUk9SKCJEVklBOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMh
IENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQllbHNlCisJCQkJZGRjID0gJnJh
ZGVvbl9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7CiAJCX0KKwkJZHJtX2Nvbm5lY3Rvcl9p
bml0X3dpdGhfZGRjKGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsCisJCQkJCSAgICAmcmFk
ZW9uX3ZnYV9jb25uZWN0b3JfZnVuY3MsCisJCQkJCSAgICBjb25uZWN0b3JfdHlwZSwKKwkJCQkJ
ICAgIGRkYyk7CisJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+
YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCXJhZGVvbl9jb25u
ZWN0b3ItPmRhY19sb2FkX2RldGVjdCA9IHRydWU7CiAJCWRybV9vYmplY3RfYXR0YWNoX3Byb3Bl
cnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJCSAgICAgIHJkZXYtPm1vZGVf
aW5mby5sb2FkX2RldGVjdF9wcm9wZXJ0eSwKQEAgLTI0MTMsMTMgKzI0NzEsMTggQEAgcmFkZW9u
X2FkZF9sZWdhY3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWJyZWFrOwog
CWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RWSUk6CiAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1Jf
RFZJRDoKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2Us
ICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQlkcm1fY29u
bmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nv
bm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCXJhZGVv
bl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsK
IAkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQlEUk1fRVJST1IoIkRWSTog
RmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIp
OworCQkJZWxzZQorCQkJCWRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVy
OwogCQl9CisJCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25fY29ubmVj
dG9yLT5iYXNlLAorCQkJCQkgICAgJnJhZGVvbl9kdmlfY29ubmVjdG9yX2Z1bmNzLAorCQkJCQkg
ICAgY29ubmVjdG9yX3R5cGUsCisJCQkJCSAgICBkZGMpOworCQlkcm1fY29ubmVjdG9yX2hlbHBl
cl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxw
ZXJfZnVuY3MpOwogCQlpZiAoY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0RW
SUkpIHsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRhY19sb2FkX2RldGVjdCA9IHRydWU7CiAJCQlk
cm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLApA
QCAtMjQzNiw3ICsyNDk5LDEwIEBAIHJhZGVvbl9hZGRfbGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LAogCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX1NWSURFTzoKIAljYXNl
IERSTV9NT0RFX0NPTk5FQ1RPUl9Db21wb3NpdGU6CiAJY2FzZSBEUk1fTU9ERV9DT05ORUNUT1Jf
OVBpbkRJTjoKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJh
c2UsICZyYWRlb25fdHZfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7CisJCWRybV9j
b25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLAorCQkJ
CQkgICAgJnJhZGVvbl90dl9jb25uZWN0b3JfZnVuY3MsCisJCQkJCSAgICBjb25uZWN0b3JfdHlw
ZSwKKwkJCQkJICAgIGRkYyk7CiAJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nv
bm5lY3Rvci0+YmFzZSwgJnJhZGVvbl90dl9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJcmFk
ZW9uX2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKIAkJLyogUlM0MDAsUkM0MTAs
UlM0ODAgY2hpcHNldCBzZWVtcyB0byByZXBvcnQgYSBsb3QKQEAgLTI0NTgsMTMgKzI1MjQsMTgg
QEAgcmFkZW9uX2FkZF9sZWdhY3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJ
CWNvbm5lY3Rvci0+ZG91Ymxlc2Nhbl9hbGxvd2VkID0gZmFsc2U7CiAJCWJyZWFrOwogCWNhc2Ug
RFJNX01PREVfQ09OTkVDVE9SX0xWRFM6Ci0JCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRl
b25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2x2ZHNfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0
b3JfdHlwZSk7Ci0JCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+
YmFzZSwgJnJhZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoaTJjX2J1
cy0+dmFsaWQpIHsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xv
b2t1cChyZGV2LCBpMmNfYnVzKTsKIAkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykK
IAkJCQlEUk1fRVJST1IoIkxWRFM6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1l
c2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsKKwkJCWVsc2UKKwkJCQlkZGMgPSAmcmFkZW9uX2Nvbm5l
Y3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJfQorCQlkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9k
ZGMoZGV2LCAmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwKKwkJCQkJICAgICZyYWRlb25fbHZkc19j
b25uZWN0b3JfZnVuY3MsCisJCQkJCSAgICBjb25uZWN0b3JfdHlwZSwKKwkJCQkJICAgIGRkYyk7
CisJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJh
ZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlkcm1fb2JqZWN0X2F0dGFjaF9w
cm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkgICAgICBkZXYtPm1v
ZGVfY29uZmlnLnNjYWxpbmdfbW9kZV9wcm9wZXJ0eSwKIAkJCQkJICAgICAgRFJNX01PREVfU0NB
TEVfRlVMTFNDUkVFTik7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
