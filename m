Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9391BE3D4
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2020 18:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8F66EAB1;
	Wed, 29 Apr 2020 16:28:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 94E9A6EAB1
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2020 16:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8C0822A6042;
 Wed, 29 Apr 2020 18:28:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id RWRP0gAXAW_v; Wed, 29 Apr 2020 18:28:02 +0200 (CEST)
Received: from kaveri (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 555AA2A6016;
 Wed, 29 Apr 2020 18:28:02 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jTpZ3-0004qj-EO; Wed, 29 Apr 2020 18:28:01 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: [PATCH] drm/amdgpu/dc: Use WARN_ON_ONCE for ASSERT
Date: Wed, 29 Apr 2020 18:28:01 +0200
Message-Id: <20200429162801.18598-1-michel@daenzer.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpPbmNlIHNob3VsZCBn
ZW5lcmFsbHkgYmUgZW5vdWdoIGZvciBkaWFnbm9zaW5nIHdoYXQgbGVhZCB1cCB0byBpdCwKcmVw
ZWF0aW5nIGl0IG92ZXIgYW5kIG92ZXIgY2FuIGJlIHByZXR0eSBhbm5veWluZy4KClNpZ25lZC1v
ZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFlbnplckByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9vc190eXBlcy5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL29zX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvZGMvb3NfdHlwZXMuaAppbmRleCBjMzRlYmExOTg2MGEzMi4uNmQ3YmNhNTYyZWVjMDAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9vc190eXBlcy5oCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9vc190eXBlcy5oCkBAIC0xMDgsNyArMTA4
LDcgQEAKICNkZWZpbmUgQVNTRVJUKGV4cHIpIEFTU0VSVF9DUklUSUNBTChleHByKQogCiAjZWxz
ZQotI2RlZmluZSBBU1NFUlQoZXhwcikgV0FSTl9PTighKGV4cHIpKQorI2RlZmluZSBBU1NFUlQo
ZXhwcikgV0FSTl9PTl9PTkNFKCEoZXhwcikpCiAjZW5kaWYKIAogI2RlZmluZSBCUkVBS19UT19E
RUJVR0dFUigpIEFTU0VSVCgwKQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
