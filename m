Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A380C484E1
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F6589250;
	Mon, 17 Jun 2019 14:07:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 12:57:35 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81F689070;
 Mon, 17 Jun 2019 12:57:35 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MGQax-1hquxU2lVF-00GtQn; Mon, 17 Jun 2019 14:52:21 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: fix error handling in df_v3_6_pmc_start
Date: Mon, 17 Jun 2019 14:51:45 +0200
Message-Id: <20190617125216.1439481-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:4mjJ8DAUrqD7K3ik9JFh1A+imhzojGmM2U9nkMvmJroglwtNgbR
 uxEfBJoTHVzu13ZhwrwgrM6e38j8pBnDFOSIiI6NVnDb1AKXjj0XsHb5SZ/o7weXZmpJGRK
 b4RW1+baqU8jtxvfNE0f+7TvDXfTL6sFCl743HK4GE7P7xPMc6wEvBvoJ20HXf3fpOmJcaw
 UGpQSQaK/Das93ZAx0ETg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K9o8oUbrj80=:KVjf1d+To1N+ESBrsaWTas
 lPANsTk1ogkH+SUoe3yMQ/3rmU3trfSDWPT2li66fkaqk+rz2VaLU09xqjZvDi2WGhtK2RQRi
 XBaMKaNdD0pvGhqmk1YMMnOAjfusIEhlw+iY775Ph44YJw286kN5PGLa/1Fkhrsrm7NuV0z6A
 NDl5tsEI071b2sh8lzew3is0A0lCbEywEwD2KlSZuUtlqmltCY9TGZneUmbVyEnXUV9u5rIwD
 pJ0vv6/JX5G5n7hzSYUClrKNIemVZXOKXE05sCVA93QFfqQQHUzUKlTkXkXA0Y60mmay42YNZ
 Icbljq1BrJGxZ8xa2RLi5KlemvMIWltiRDT/CfmhscV3SIMFPjO+0YDs6A4VbWX3O6NoFVNye
 80d/3OFwaOC/ZF5xsv21dRey9hwLCRxjxLoVUL/yg74IXAva2MjDegW4FGvK2r5cTmZJ5zgOq
 PldhfSOJpF4y1gd/jxnZFY0u+uusG4rG1vnjUzQ5Gr05jZydwgR8JD2jHhaI4EnwW50nGQqNQ
 GVpTPehCfu8vBkzSFTUM7av5hEYwesSWSO+8s8igoh0uLE9B/R1wAphIRCOH8Ue69iy2xMH5o
 rlkvmRcK3rBNv2zyTqAjPRQhnLXJAFvMBfSb8QfByMNyfHg/UO0TiJv2FUdd8RTV+RiAnAUkj
 gWanXI6sXLXbYHDgxi7HjqPR+BZipdQMjR3ZcTnQHD5+6y30ZTv5Hk5SG2x5hiICGAxr7V3IL
 vfKJjSPVGF+TC5lEPQmQgBPsqLjr2dRoW/4heQ==
X-Mailman-Approved-At: Mon, 17 Jun 2019 14:07:03 +0000
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Colin Ian King <colin.king@canonical.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hlbiBkZl92M182X3BtY19nZXRfY3RybF9zZXR0aW5ncygpIGZhaWxzIGZvciBzb21lIHJlYXNv
biwgd2UKc3RvcmUgdW5pbml0aWFsaXplZCBkYXRhIGluIGEgcmVnaXN0ZXIsIGFzIGdjYyBwb2lu
dHMgb3V0OgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jOiBJbiBmdW5jdGlv
biAnZGZfdjNfNl9wbWNfc3RhcnQnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aDoxMDEyOjI5OiBlcnJvcjogJ2xvX3ZhbCcgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBpbiB0
aGlzIGZ1bmN0aW9uIFstV2Vycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWRdCiAjZGVmaW5lIFdSRUcz
Ml9QQ0lFKHJlZywgdikgYWRldi0+cGNpZV93cmVnKGFkZXYsIChyZWcpLCAodikpCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92
M182LmM6MzM0OjM5OiBub3RlOiAnbG9fdmFsJyB3YXMgZGVjbGFyZWQgaGVyZQogIHVpbnQzMl90
IGxvX2Jhc2VfYWRkciwgaGlfYmFzZV9hZGRyLCBsb192YWwsIGhpX3ZhbDsKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+CgpNYWtlIGl0IHJldHVybiBhIHByb3Bl
ciBlcnJvciBjb2RlIHRoYXQgd2UgY2FuIGNhdGNoIGluIHRoZSBjYWxsZXIuCgpGaXhlczogOTky
YWY5NDJhNmNmICgiZHJtL2FtZGdwdTogYWRkIGRmIHBlcmZtb24gcmVncyBhbmQgZnVuY3MgZm9y
IHhnbWkiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3YzXzYuYyB8IDEzICsrKysrKysrKy0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCmluZGV4IDhjMDliZjk5NGFjZC4uZTA3OWVlMDY2ZDg3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kZl92M182LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjNfNi5jCkBAIC0xNzcsNyArMTc3LDcgQEAg
c3RhdGljIHZvaWQgZGZfdjNfNl9wbWNfZ2V0X3JlYWRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiB9CiAKIC8qIGdldCBjb250cm9sIGNvdW50ZXIgc2V0dGluZ3MgaS5lLiBh
ZGRyZXNzIGFuZCB2YWx1ZXMgdG8gc2V0ICovCi1zdGF0aWMgdm9pZCBkZl92M182X3BtY19nZXRf
Y3RybF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKK3N0YXRpYyBpbnQgZGZf
djNfNl9wbWNfZ2V0X2N0cmxfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
CQkJCSAgdWludDY0X3QgY29uZmlnLAogCQkJCQkgIHVpbnQzMl90ICpsb19iYXNlX2FkZHIsCiAJ
CQkJCSAgdWludDMyX3QgKmhpX2Jhc2VfYWRkciwKQEAgLTE5MSwxMiArMTkxLDEyIEBAIHN0YXRp
YyB2b2lkIGRmX3YzXzZfcG1jX2dldF9jdHJsX3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogCWRmX3YzXzZfcG1jX2dldF9hZGRyKGFkZXYsIGNvbmZpZywgMSwgbG9fYmFzZV9h
ZGRyLCBoaV9iYXNlX2FkZHIpOwogCiAJaWYgKGxvX3ZhbCA9PSBOVUxMIHx8IGhpX3ZhbCA9PSBO
VUxMKQotCQlyZXR1cm47CisJCXJldHVybiAtRUlOVkFMOwogCiAJaWYgKCgqbG9fYmFzZV9hZGRy
ID09IDApIHx8ICgqaGlfYmFzZV9hZGRyID09IDApKSB7CiAJCURSTV9FUlJPUigiREYgUE1DIGFk
ZHJlc3Npbmcgbm90IHJldHJpZXZlZCEgTG86ICV4LCBIaTogJXgiLAogCQkJCSpsb19iYXNlX2Fk
ZHIsICpoaV9iYXNlX2FkZHIpOwotCQlyZXR1cm47CisJCXJldHVybiAtRU5YSU87CiAJfQogCiAJ
ZXZlbnRzZWwgPSBHRVRfRVZFTlQoY29uZmlnKTsKQEAgLTIxMSw2ICsyMTEsOCBAQCBzdGF0aWMg
dm9pZCBkZl92M182X3BtY19nZXRfY3RybF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAllc183XzAgPSBlc18xM18wICYgMHgwRkZVTDsKIAkqbG9fdmFsID0gKGVzXzdfMCAm
IDB4RkZVTCkgfCAoKHVuaXRtYXNrICYgMHgwRlVMKSA8PCA4KTsKIAkqaGlfdmFsID0gKGVzXzEx
XzggfCAoKGVzXzEzXzEyKTw8KDI5KSkpOworCisJcmV0dXJuIDA7CiB9CiAKIC8qIGFzc2lnbiBk
ZiBwZXJmb3JtYW5jZSBjb3VudGVycyBmb3IgcmVhZCAqLwpAQCAtMzQ1LDEzICszNDcsMTYgQEAg
c3RhdGljIGludCBkZl92M182X2FkZF94Z21pX2xpbmtfY250cihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKIAlpZiAocmV0IHx8IGlzX2Fzc2lnbmVkKQogCQlyZXR1cm4gcmV0OwogCi0JZGZf
djNfNl9wbWNfZ2V0X2N0cmxfc2V0dGluZ3MoYWRldiwKKwlyZXQgPSBkZl92M182X3BtY19nZXRf
Y3RybF9zZXR0aW5ncyhhZGV2LAogCQkJY29uZmlnLAogCQkJJmxvX2Jhc2VfYWRkciwKIAkJCSZo
aV9iYXNlX2FkZHIsCiAJCQkmbG9fdmFsLAogCQkJJmhpX3ZhbCk7CiAKKwlpZiAocmV0KQorCQly
ZXR1cm4gcmV0OworCiAJV1JFRzMyX1BDSUUobG9fYmFzZV9hZGRyLCBsb192YWwpOwogCVdSRUcz
Ml9QQ0lFKGhpX2Jhc2VfYWRkciwgaGlfdmFsKTsKIAotLSAKMi4yMC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
