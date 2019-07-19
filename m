Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F8E6DAA5
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 06:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F76E50B;
	Fri, 19 Jul 2019 04:03:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CCC6E507;
 Fri, 19 Jul 2019 04:03:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BB4B21852;
 Fri, 19 Jul 2019 04:03:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 019/141] drm/amdkfd: Fix a potential memory leak
Date: Fri, 19 Jul 2019 00:00:44 -0400
Message-Id: <20190719040246.15945-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509012;
 bh=teggvQp7PWhRrkJMsK/tso+6YAghi15Fw5s2In74K+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0kDrebqX3o31eAbSFzi/0rWzFtGsJGwNUcLmBD10XQEay1S7BrJL9JzXMAvPUUED
 /teiGHDe6VqZtDqtyy1tU1rlYfJ+RjnuSBBpzT1KULwLM820qum1E2eCwdMGDFToQb
 SSedl4V2ezzk5h0zP8sLEldc12F3T9MgNuOICpf8=
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Oak Zeng <ozeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBlNzMzOTBk
MTgxMTAzYTE5ZTExMTFlYzJmMjU1NTlhMDU3MGU5ZmUwIF0KCkZyZWUgbXFkX21lbV9vYmogaXQg
R1RUIGJ1ZmZlciBhbGxvY2F0aW9uIGZvciBNUUQrY29udHJvbCBzdGFjayBmYWlscy4KClNpZ25l
ZC1vZmYtYnk6IE9hayBaZW5nIDxvemVuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhs
aW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxz
YXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFk
X21hbmFnZXJfdjkuYyB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbXFkX21hbmFnZXJfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRf
bWFuYWdlcl92OS5jCmluZGV4IDlkYmJhNjA5NDUwZS4uOGZlNzRiODIxYjMyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjkuYwpAQCAtNzYsNiAr
NzYsNyBAQCBzdGF0aWMgaW50IGluaXRfbXFkKHN0cnVjdCBtcWRfbWFuYWdlciAqbW0sIHZvaWQg
KiptcWQsCiAJc3RydWN0IHY5X21xZCAqbTsKIAlzdHJ1Y3Qga2ZkX2RldiAqa2ZkID0gbW0tPmRl
djsKIAorCSptcWRfbWVtX29iaiA9IE5VTEw7CiAJLyogRnJvbSBWOSwgIGZvciBDV1NSLCB0aGUg
Y29udHJvbCBzdGFjayBpcyBsb2NhdGVkIG9uIHRoZSBuZXh0IHBhZ2UKIAkgKiBib3VuZGFyeSBh
ZnRlciB0aGUgbXFkLCB3ZSB3aWxsIHVzZSB0aGUgZ3R0IGFsbG9jYXRpb24gZnVuY3Rpb24KIAkg
KiBpbnN0ZWFkIG9mIHN1Yi1hbGxvY2F0aW9uIGZ1bmN0aW9uLgpAQCAtOTMsOCArOTQsMTAgQEAg
c3RhdGljIGludCBpbml0X21xZChzdHJ1Y3QgbXFkX21hbmFnZXIgKm1tLCB2b2lkICoqbXFkLAog
CX0gZWxzZQogCQlyZXR2YWwgPSBrZmRfZ3R0X3NhX2FsbG9jYXRlKG1tLT5kZXYsIHNpemVvZihz
dHJ1Y3QgdjlfbXFkKSwKIAkJCQltcWRfbWVtX29iaik7Ci0JaWYgKHJldHZhbCAhPSAwKQorCWlm
IChyZXR2YWwpIHsKKwkJa2ZyZWUoKm1xZF9tZW1fb2JqKTsKIAkJcmV0dXJuIC1FTk9NRU07CisJ
fQogCiAJbSA9IChzdHJ1Y3QgdjlfbXFkICopICgqbXFkX21lbV9vYmopLT5jcHVfcHRyOwogCWFk
ZHIgPSAoKm1xZF9tZW1fb2JqKS0+Z3B1X2FkZHI7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
