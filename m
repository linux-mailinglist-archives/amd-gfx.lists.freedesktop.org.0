Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189DB51787
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 17:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE6489B66;
	Mon, 24 Jun 2019 15:45:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C8F189C96
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 15:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id D28AC2A6045
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id w6hX0j9EEDAO for <amd-gfx@lists.freedesktop.org>;
 Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 576E12A6048
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 17:45:36 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>) id 1hfR9z-0002Ft-IH
 for amd-gfx@lists.freedesktop.org; Mon, 24 Jun 2019 17:45:35 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 1/2] amdgpu: Move union declaration to top of
 amdgpu_cs_ctx_override_priority
Date: Mon, 24 Jun 2019 17:45:34 +0200
Message-Id: <20190624154535.8619-2-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624154535.8619-1-michel@daenzer.net>
References: <20190624154535.8619-1-michel@daenzer.net>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpBdm9pZHMgY29t
cGlsZXIgd2FybmluZzoKCi4uLy4uL2FtZGdwdS9hbWRncHVfY3MuYzogSW4gZnVuY3Rpb24gJ2Ft
ZGdwdV9jc19jdHhfb3ZlcnJpZGVfcHJpb3JpdHknOgouLi8uLi9hbWRncHUvYW1kZ3B1X2NzLmM6
MTU1OjI6IHdhcm5pbmc6IElTTyBDOTAgZm9yYmlkcyBtaXhlZCBkZWNsYXJhdGlvbnMgYW5kIGNv
ZGUgWy1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50XQogIHVuaW9uIGRybV9hbWRncHVfc2No
ZWQgYXJnczsKICBefn5+fgoKU2lnbmVkLW9mZi1ieTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5k
YWVuemVyQGFtZC5jb20+Ci0tLQogYW1kZ3B1L2FtZGdwdV9jcy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYW1kZ3B1
L2FtZGdwdV9jcy5jIGIvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IDk3N2ZhM2NmLi4yMGQ1YWVm
MiAxMDA2NDQKLS0tIGEvYW1kZ3B1L2FtZGdwdV9jcy5jCisrKyBiL2FtZGdwdS9hbWRncHVfY3Mu
YwpAQCAtMTQ3LDEyICsxNDcsMTIgQEAgZHJtX3B1YmxpYyBpbnQgYW1kZ3B1X2NzX2N0eF9vdmVy
cmlkZV9wcmlvcml0eShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBtYXN0ZXJfZmQsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIHByaW9yaXR5KQog
eworCXVuaW9uIGRybV9hbWRncHVfc2NoZWQgYXJnczsKIAlpbnQgcjsKIAogCWlmICghZGV2IHx8
ICFjb250ZXh0IHx8IG1hc3Rlcl9mZCA8IDApCiAJCXJldHVybiAtRUlOVkFMOwogCi0JdW5pb24g
ZHJtX2FtZGdwdV9zY2hlZCBhcmdzOwogCW1lbXNldCgmYXJncywgMCwgc2l6ZW9mKGFyZ3MpKTsK
IAogCWFyZ3MuaW4ub3AgPSBBTURHUFVfU0NIRURfT1BfQ09OVEVYVF9QUklPUklUWV9PVkVSUklE
RTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
