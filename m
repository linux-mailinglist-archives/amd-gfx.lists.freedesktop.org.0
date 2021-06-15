Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DFD3A84C8
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Jun 2021 17:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597B86E3F0;
	Tue, 15 Jun 2021 15:50:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EAE6E3F0;
 Tue, 15 Jun 2021 15:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A6C661879;
 Tue, 15 Jun 2021 15:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772205;
 bh=Q+ztBa1LgiyBgJaK36fsAnH+BMlypUGENetaOljJfCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ITrEjH8hPdPvsG1TnkW5Bo/WmMdiYyya+6K0lhvJXvmjnmfIG+HSPxmWstAOF0ds0
 rNPmzpd+YMElVYFs6wQwm3YDLwnmHbzYQApTXdNBJr1Xg9N7IA+7w8DtuP/tUkRbR9
 /26GpJYBS5MAj9Yqw5adUnJgwpzV6rdnEV7JtZvTFinmZDIjl9UXbYSlczJv65+khk
 rWxr/WFFctiAgZ0HZhhpVltwC9+ubncL5493yjOzWIBM6NecRDl6YLumixMbjdn1wQ
 Ux7Smpyyv1fwyKrAmXwvBkzICcUallS/r42JNMbNecbxCtBEITznOWRaqXvmFlphqD
 YgKZIT9aZjvAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 12/15] radeon: use memcpy_to/fromio for UVD fw
 upload
Date: Tue, 15 Jun 2021 11:49:44 -0400
Message-Id: <20210615154948.62711-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154948.62711-1-sashal@kernel.org>
References: <20210615154948.62711-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chen Li <chenli@uniontech.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hlbiBMaSA8Y2hlbmxpQHVuaW9udGVjaC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBh
YjgzNjNkMzg3NWE4M2Y0OTAxZWIxY2MwMGNlOGFmZDI0ZGU2Yzg1IF0KCkkgbWV0IGEgZ3B1IGFk
ZHIgYnVnIHJlY2VudGx5IGFuZCB0aGUga2VybmVsIGxvZwp0ZWxscyBtZSB0aGUgcGMgaXMgbWVt
Y3B5L21lbXNldCBhbmQgbGluayByZWdpc3RlciBpcwpyYWRlb25fdXZkX3Jlc3VtZS4KCkFzIHdl
IGtub3csIGluIHNvbWUgYXJjaGl0ZWN0dXJlcywgb3B0aW1pemVkIG1lbWNweS9tZW1zZXQKbWF5
IG5vdCB3b3JrIHdlbGwgb24gZGV2aWNlIG1lbW9yeS4gVHJpdmFsIG1lbWNweV90b2lvL21lbXNl
dF9pbwpjYW4gZml4IHRoaXMgcHJvYmxlbS4KCkJUVywgYW1kZ3B1IGhhcyBhbHJlYWR5IGRvbmUg
aXQgaW46CmNvbW1pdCBiYTBiMjI3NWE2NzggKCJkcm0vYW1kZ3B1OiB1c2UgbWVtY3B5X3RvL2Zy
b21pbyBmb3IgVVZEIGZ3IHVwbG9hZCIpLAp0aGF0J3Mgd2h5IGl0IGhhcyBubyB0aGlzIGlzc3Vl
IG9uIHRoZSBzYW1lIGdwdSBhbmQgcGxhdGZvcm0uCgpTaWduZWQtb2ZmLWJ5OiBDaGVuIExpIDxj
aGVubGlAdW5pb250ZWNoLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdXZkLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdXZkLmMgYi9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl91dmQuYwppbmRleCAxYWQ1YzNiODZiNjQuLmExOGJmNzBhMjUx
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdXZkLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdXZkLmMKQEAgLTI4Niw3ICsyODYsNyBAQCBp
bnQgcmFkZW9uX3V2ZF9yZXN1bWUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJaWYgKHJk
ZXYtPnV2ZC52Y3B1X2JvID09IE5VTEwpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JbWVtY3B5KHJk
ZXYtPnV2ZC5jcHVfYWRkciwgcmRldi0+dXZkX2Z3LT5kYXRhLCByZGV2LT51dmRfZnctPnNpemUp
OworCW1lbWNweV90b2lvKCh2b2lkIF9faW9tZW0gKilyZGV2LT51dmQuY3B1X2FkZHIsIHJkZXYt
PnV2ZF9mdy0+ZGF0YSwgcmRldi0+dXZkX2Z3LT5zaXplKTsKIAogCXNpemUgPSByYWRlb25fYm9f
c2l6ZShyZGV2LT51dmQudmNwdV9ibyk7CiAJc2l6ZSAtPSByZGV2LT51dmRfZnctPnNpemU7CkBA
IC0yOTQsNyArMjk0LDcgQEAgaW50IHJhZGVvbl91dmRfcmVzdW1lKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogCXB0ciA9IHJkZXYtPnV2ZC5jcHVfYWRkcjsKIAlwdHIgKz0gcmRldi0+dXZk
X2Z3LT5zaXplOwogCi0JbWVtc2V0KHB0ciwgMCwgc2l6ZSk7CisJbWVtc2V0X2lvKCh2b2lkIF9f
aW9tZW0gKilwdHIsIDAsIHNpemUpOwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjMwLjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
