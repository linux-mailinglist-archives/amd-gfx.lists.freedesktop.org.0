Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CF3C3AE2
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 18:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6121B6E858;
	Tue,  1 Oct 2019 16:42:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008086E858;
 Tue,  1 Oct 2019 16:41:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 239F8205C9;
 Tue,  1 Oct 2019 16:41:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 19/63] drm/amdgpu: Check for valid number of
 registers to read
Date: Tue,  1 Oct 2019 12:40:41 -0400
Message-Id: <20191001164125.15398-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164125.15398-1-sashal@kernel.org>
References: <20191001164125.15398-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569948112;
 bh=BK92aw5ufPqlh3+4BPeXJI9ns5H3UaMHbU4iLLNA4FY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uUYtqKjJYfCIxpcvHGcIhzEhAgDP7TJYVV2/8U8fuqGMP3FMz5xey14wSuBzyybrd
 /+x8lOchatMaN1ygvS0dQPQWTJUHDkP/agRWiU9g4TYxkR/ys0ptFb/8YxQrGva8wu
 nTRTJ6dJ+St3d0lnfLzsERZLwoTpw2AS1J+V1+3o=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Trek <trek00@inbox.ru>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVHJlayA8dHJlazAwQGluYm94LnJ1PgoKWyBVcHN0cmVhbSBjb21taXQgNzNkOGU2Yzdi
ODQxZDliZjI5OGM4OTI4ZjIyOGZiNDMzNjc2NjM1YyBdCgpEbyBub3QgdHJ5IHRvIGFsbG9jYXRl
IGFueSBhbW91bnQgb2YgbWVtb3J5IHJlcXVlc3RlZCBieSB0aGUgdXNlci4KSW5zdGVhZCBsaW1p
dCBpdCB0byAxMjggcmVnaXN0ZXJzLiBBY3R1YWxseSB0aGUgbG9uZ2VzdCBzZXJpZXMgb2YKY29u
c2VjdXRpdmUgYWxsb3dlZCByZWdpc3RlcnMgYXJlIDQ4LCBtbUdCX1RJTEVfTU9ERTAtMzEgYW5k
Cm1tR0JfTUFDUk9USUxFX01PREUwLTE1ICgweDI2NDQtMHgyNjczKS4KCkJ1ZzogaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExMjczClNpZ25lZC1vZmYtYnk6
IFRyZWsgPHRyZWswMEBpbmJveC5ydT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5j
IHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfa21zLmMKaW5kZXggYjE3ZDA1NDU3MjhlZS4uYTEwMzk5OGY3MjEy
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ttcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYwpAQCAtNjYyLDYgKzY2
Miw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2luZm9faW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwgc3RydWN0IGRybV9maWxlCiAJCWlmIChzaF9udW0gPT0gQU1ER1BVX0lO
Rk9fTU1SX1NIX0lOREVYX01BU0spCiAJCQlzaF9udW0gPSAweGZmZmZmZmZmOwogCisJCWlmIChp
bmZvLT5yZWFkX21tcl9yZWcuY291bnQgPiAxMjgpCisJCQlyZXR1cm4gLUVJTlZBTDsKKwogCQly
ZWdzID0ga21hbGxvY19hcnJheShpbmZvLT5yZWFkX21tcl9yZWcuY291bnQsIHNpemVvZigqcmVn
cyksIEdGUF9LRVJORUwpOwogCQlpZiAoIXJlZ3MpCiAJCQlyZXR1cm4gLUVOT01FTTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
