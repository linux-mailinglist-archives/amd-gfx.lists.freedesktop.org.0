Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABF59E46
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 16:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01D96E93A;
	Fri, 28 Jun 2019 14:55:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A47A6E931;
 Fri, 28 Jun 2019 14:45:20 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1hgs7p-0000jp-HK; Fri, 28 Jun 2019 14:45:17 +0000
From: Colin King <colin.king@canonical.com>
To: Kevin Wang <kevin1.wang@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/powerplay: fix incorrect assignments to mclk_mask and
 soc_mask
Date: Fri, 28 Jun 2019 15:45:17 +0100
Message-Id: <20190628144517.7747-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 14:55:57 +0000
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
ZSBudWxsIHBvaW50ZXIgY2hlY2tzIG9uIG1sY2tfbWFzayBhbmQgc29jX21hc2sgaG93ZXZlciB0
aGUKc2Nsa19tYXNrIGlzIGJlaW5nIHVzZWQgaW4gYXNzaWdubWVudHMgaW4gd2hhdCBsb29rcyB0
byBiZSBhIGN1dC1uLXBhc3RlCmNvZGluZyBlcnJvci4gRml4IHRoaXMgYnkgdXNpbmcgdGhlIGNv
cnJlY3QgcG9pbnRlcnMgaW4gdGhlIGFzc2lnbm1lbnRzLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAo
IkRlcmVmZXJlbmNlIGFmdGVyIG51bGwgY2hlY2siKQpGaXhlczogMmQ5ZmI5YjA2NjQzICgiZHJt
L2FtZC9wb3dlcnBsYXk6IGFkZCBmdW5jdGlvbiBnZXRfcHJvZmlsaW5nX2Nsa19tYXNrIGZvciBu
YXZpMTAiKQpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKaW5kZXggMjdlNWM4
MC4uYWMxNTFkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2
aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YwpAQCAtMTEzNCwxNCArMTEzNCwxNCBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfcHJvZmlsaW5n
X2Nsa19tYXNrKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAogCQkJcmV0ID0gc211X2dldF9kcG1f
bGV2ZWxfY291bnQoc211LCBTTVVfTUNMSywgJmxldmVsX2NvdW50KTsKIAkJCWlmIChyZXQpCiAJ
CQkJcmV0dXJuIHJldDsKLQkJCSpzY2xrX21hc2sgPSBsZXZlbF9jb3VudCAtIDE7CisJCQkqbWNs
a19tYXNrID0gbGV2ZWxfY291bnQgLSAxOwogCQl9CiAKIAkJaWYoc29jX21hc2spIHsKIAkJCXJl
dCA9IHNtdV9nZXRfZHBtX2xldmVsX2NvdW50KHNtdSwgU01VX1NPQ0NMSywgJmxldmVsX2NvdW50
KTsKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKLQkJCSpzY2xrX21hc2sgPSBsZXZlbF9j
b3VudCAtIDE7CisJCQkqc29jX21hc2sgPSBsZXZlbF9jb3VudCAtIDE7CiAJCX0KIAl9CiAKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
