Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A885C119614
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2019 22:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229AB6E979;
	Tue, 10 Dec 2019 21:25:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DA56E979;
 Tue, 10 Dec 2019 21:25:25 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B22921556;
 Tue, 10 Dec 2019 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013125;
 bh=pfweuhzheRT+MBCmUjZdFceQheS50mACzk1KJkOnWKY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fj5PVfx7Brg76qVs9O6h6NNhNwU0N+QFbp4+Cke2SHSs670PE2s9rC5XxSjaLJwmR
 mDa9LoB5Gp+R5viLZPB80/2NniCNiil2Z7H9SeuwWCU3j0cQApS7LM836dhnFV3HRs
 cxgWff7TQXQ3VIujwbaQzAPNFKHsk0Lu2/14wR5Y=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 011/292] drm/amdgpu: grab the id mgr lock while
 accessing passid_mapping
Date: Tue, 10 Dec 2019 16:20:30 -0500
Message-Id: <20191210212511.11392-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210212511.11392-1-sashal@kernel.org>
References: <20191210212511.11392-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Chunming Zhou <david1.zhou@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgNjgxN2JmMjgzYjJiODUxMDk1ODI1ZWM3ZjBlOWYxMDM5OGUwOTEyNSBdCgpO
ZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHdlIGFjdHVhbGx5IGRyb3BwaW5nIHRoZSByaWdodCBmZW5j
ZS4KQ291bGQgYmUgZG9uZSB3aXRoIFJDVSBhcyB3ZWxsLCBidXQgdG8gY29tcGxpY2F0ZWQgZm9y
IGEgZml4LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNv
bT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAxMiArKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwppbmRleCAyNGMzYzA1ZTJmYjdkLi40YTdiMmZmZDNi
ZmUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwpAQCAtMTAzNiwxMCAr
MTAzNiw4IEBAIGludCBhbWRncHVfdm1fZmx1c2goc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBz
dHJ1Y3QgYW1kZ3B1X2pvYiAqam9iLCBib29sIG5lZWRfCiAJCWlkLT5vYV9iYXNlICE9IGpvYi0+
b2FfYmFzZSB8fAogCQlpZC0+b2Ffc2l6ZSAhPSBqb2ItPm9hX3NpemUpOwogCWJvb2wgdm1fZmx1
c2hfbmVlZGVkID0gam9iLT52bV9uZWVkc19mbHVzaDsKLQlib29sIHBhc2lkX21hcHBpbmdfbmVl
ZGVkID0gaWQtPnBhc2lkICE9IGpvYi0+cGFzaWQgfHwKLQkJIWlkLT5wYXNpZF9tYXBwaW5nIHx8
Ci0JCSFkbWFfZmVuY2VfaXNfc2lnbmFsZWQoaWQtPnBhc2lkX21hcHBpbmcpOwogCXN0cnVjdCBk
bWFfZmVuY2UgKmZlbmNlID0gTlVMTDsKKwlib29sIHBhc2lkX21hcHBpbmdfbmVlZGVkOwogCXVu
c2lnbmVkIHBhdGNoX29mZnNldCA9IDA7CiAJaW50IHI7CiAKQEAgLTEwNDksNiArMTA0NywxMiBA
QCBpbnQgYW1kZ3B1X3ZtX2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFt
ZGdwdV9qb2IgKmpvYiwgYm9vbCBuZWVkXwogCQlwYXNpZF9tYXBwaW5nX25lZWRlZCA9IHRydWU7
CiAJfQogCisJbXV0ZXhfbG9jaygmaWRfbWdyLT5sb2NrKTsKKwlpZiAoaWQtPnBhc2lkICE9IGpv
Yi0+cGFzaWQgfHwgIWlkLT5wYXNpZF9tYXBwaW5nIHx8CisJICAgICFkbWFfZmVuY2VfaXNfc2ln
bmFsZWQoaWQtPnBhc2lkX21hcHBpbmcpKQorCQlwYXNpZF9tYXBwaW5nX25lZWRlZCA9IHRydWU7
CisJbXV0ZXhfdW5sb2NrKCZpZF9tZ3ItPmxvY2spOworCiAJZ2RzX3N3aXRjaF9uZWVkZWQgJj0g
ISFyaW5nLT5mdW5jcy0+ZW1pdF9nZHNfc3dpdGNoOwogCXZtX2ZsdXNoX25lZWRlZCAmPSAhIXJp
bmctPmZ1bmNzLT5lbWl0X3ZtX2ZsdXNoICAmJgogCQkJam9iLT52bV9wZF9hZGRyICE9IEFNREdQ
VV9CT19JTlZBTElEX09GRlNFVDsKQEAgLTEwODgsOSArMTA5MiwxMSBAQCBpbnQgYW1kZ3B1X3Zt
X2ZsdXNoKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFtZGdwdV9qb2IgKmpvYiwg
Ym9vbCBuZWVkXwogCX0KIAogCWlmIChwYXNpZF9tYXBwaW5nX25lZWRlZCkgeworCQltdXRleF9s
b2NrKCZpZF9tZ3ItPmxvY2spOwogCQlpZC0+cGFzaWQgPSBqb2ItPnBhc2lkOwogCQlkbWFfZmVu
Y2VfcHV0KGlkLT5wYXNpZF9tYXBwaW5nKTsKIAkJaWQtPnBhc2lkX21hcHBpbmcgPSBkbWFfZmVu
Y2VfZ2V0KGZlbmNlKTsKKwkJbXV0ZXhfdW5sb2NrKCZpZF9tZ3ItPmxvY2spOwogCX0KIAlkbWFf
ZmVuY2VfcHV0KGZlbmNlKTsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngK
