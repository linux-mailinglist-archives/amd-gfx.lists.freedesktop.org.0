Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C12ECDA85
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 05:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D8D6E446;
	Mon,  7 Oct 2019 03:05:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 758C56E22D
 for <amd-gfx@lists.freedesktop.org>; Sat,  5 Oct 2019 11:32:23 +0000 (UTC)
Received: from localhost.localdomain ([93.22.148.54]) by mwinf5d13 with ME
 id 9nYA2100U1AfE5H03nYBUv; Sat, 05 Oct 2019 13:32:21 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Oct 2019 13:32:21 +0200
X-ME-IP: 93.22.148.54
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: Fix typo in some comments
Date: Sat,  5 Oct 2019 13:32:05 +0200
Message-Id: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Oct 2019 03:05:44 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cCBhbmQgZyBhcmUgc3dpdGNoZWQgaW4gJ2FtZHBndV9kbScKClNpZ25lZC1vZmYtYnk6IENocmlz
dG9waGUgSkFJTExFVCA8Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKystLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCA5Mjkz
MmQ1MjFkN2YuLmI5YzJlMWE5MzBhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0xMDQzLDcgKzEwNDMsNyBAQCBzdGF0aWMg
dm9pZCBzM19oYW5kbGVfbXN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3VzcGVuZCkK
IAogLyoqCiAgKiBkbV9od19pbml0KCkgLSBJbml0aWFsaXplIERDIGRldmljZQotICogQGhhbmRs
ZTogVGhlIGJhc2UgZHJpdmVyIGRldmljZSBjb250YWluaW5nIHRoZSBhbWRwZ3VfZG0gZGV2aWNl
LgorICogQGhhbmRsZTogVGhlIGJhc2UgZHJpdmVyIGRldmljZSBjb250YWluaW5nIHRoZSBhbWRn
cHVfZG0gZGV2aWNlLgogICoKICAqIEluaXRpYWxpemUgdGhlICZzdHJ1Y3QgYW1kZ3B1X2Rpc3Bs
YXlfbWFuYWdlciBkZXZpY2UuIFRoaXMgaW52b2x2ZXMgY2FsbGluZwogICogdGhlIGluaXRpYWxp
emVycyBvZiBlYWNoIERNIGNvbXBvbmVudCwgdGhlbiBwb3B1bGF0aW5nIHRoZSBzdHJ1Y3Qgd2l0
aCB0aGVtLgpAQCAtMTA3Myw3ICsxMDczLDcgQEAgc3RhdGljIGludCBkbV9od19pbml0KHZvaWQg
KmhhbmRsZSkKIAogLyoqCiAgKiBkbV9od19maW5pKCkgLSBUZWFyZG93biBEQyBkZXZpY2UKLSAq
IEBoYW5kbGU6IFRoZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0aGUgYW1kcGd1X2Rt
IGRldmljZS4KKyAqIEBoYW5kbGU6IFRoZSBiYXNlIGRyaXZlciBkZXZpY2UgY29udGFpbmluZyB0
aGUgYW1kZ3B1X2RtIGRldmljZS4KICAqCiAgKiBUZWFyZG93biBjb21wb25lbnRzIHdpdGhpbiAm
c3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgdGhhdCByZXF1aXJlCiAgKiBjbGVhbnVwLiBU
aGlzIGludm9sdmVzIGNsZWFuaW5nIHVwIHRoZSBEUk0gZGV2aWNlLCBEQywgYW5kIGFueSBtb2R1
bGVzIHRoYXQKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
