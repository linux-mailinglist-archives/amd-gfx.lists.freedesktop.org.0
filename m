Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6981E10
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 15:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B42889E14;
	Mon,  5 Aug 2019 13:52:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B441B89CDB;
 Mon,  5 Aug 2019 10:29:43 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <colin.king@canonical.com>)
 id 1huaFI-0006WD-Vn; Mon, 05 Aug 2019 10:29:41 +0000
From: Colin King <colin.king@canonical.com>
To: Rex Zhu <rex.zhu@amd.com>, Evan Quan <evan.quan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH][drm-next] drm/amd/powerplay: remove redundant duplicated
 return check
Date: Mon,  5 Aug 2019 11:29:40 +0100
Message-Id: <20190805102940.26024-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2019 13:52:20 +0000
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

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZSBjaGVj
ayBvbiByZXQgaXMgZHVwbGljYXRlZCBpbiB0d28gcGxhY2VzLCBpdCBpcyByZWR1bmRhbnQgY29k
ZS4KUmVtb3ZlIGl0LgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkxvZ2ljYWxseSBkZWFkIGNvZGUi
KQpGaXhlczogYjk0YWZiNjFjZGFlICgiZHJtL2FtZC9wb3dlcnBsYXk6IGhvbm9yIGh3IGxpbWl0
IG9uIGZldGNoaW5nIG1ldHJpY3MgZGF0YSBmb3IgbmF2aTEwIikKU2lnbmVkLW9mZi1ieTogQ29s
aW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
YwppbmRleCBkNjJjMjc4NGIxMDIuLmIyNzJjOGRjOGY3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwpAQCAtOTQxLDggKzk0MSw2IEBAIHN0YXRpYyBpbnQg
bmF2aTEwX2dldF9ncHVfcG93ZXIoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVpbnQzMl90ICp2
YWx1ZSkKIAlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7CiAJ
aWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwogCiAJKnZh
bHVlID0gbWV0cmljcy5BdmVyYWdlU29ja2V0UG93ZXIgPDwgODsKIApAQCAtMTAwMSw4ICs5OTks
NiBAQCBzdGF0aWMgaW50IG5hdmkxMF9nZXRfZmFuX3NwZWVkX3JwbShzdHJ1Y3Qgc211X2NvbnRl
eHQgKnNtdSwKIAlyZXQgPSBuYXZpMTBfZ2V0X21ldHJpY3NfdGFibGUoc211LCAmbWV0cmljcyk7
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwogCiAJ
KnNwZWVkID0gbWV0cmljcy5DdXJyRmFuU3BlZWQ7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QK
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
