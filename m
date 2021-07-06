Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F33BCE64
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Jul 2021 13:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761606E43C;
	Tue,  6 Jul 2021 11:25:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6976E43A;
 Tue,  6 Jul 2021 11:25:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0643E61CC9;
 Tue,  6 Jul 2021 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570750;
 bh=tKe0WjwfrqkTRhHvUnJlJ9TzYW9tbVFV1HzVRyI03eE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uTS8wMCzUmoN9HTKDYjUbrwCXDI9cIn0J0k5LS6oTpPAahfP47PIJKWwwt3wBCRZS
 8UenukyeVPcETw0ebFKScYDTasVxv88eFBzJ9c1+QRW8ms+jgOaHl+U9HgGRhd7CgG
 e7/ZjJZnvifAecFwxFrEvt8+rUrZZL7dmB6AmS2/aGNGqARYnEL59iv8td4NwaMT5C
 AHPjHoTIe1PljIX//c2l1yUDu4gszKqkEknGZoYfCR0iphh0XJ8Ofs7cjZjd4KXDci
 uFmzH+D+xtE5FR2jk6RwEwSc8kSwcGSVkNkdLnzY/sSkxCKfOvWivFQqZbfmWJCrxr
 UhLkhf8VyUyHA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 38/74] drm/amdkfd: use allowed domain for vmbo
 validation
Date: Tue,  6 Jul 2021 07:24:26 -0400
Message-Id: <20210706112502.2064236-38-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706112502.2064236-1-sashal@kernel.org>
References: <20210706112502.2064236-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 amd-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
YmMwNTcxNmQ0ZmRkMDY1MDEzNjMzNjAyYzU5NjBhMmJmMTUxMWI5YyBdCgpGaXhlcyBoYW5kbGlu
ZyB3aGVuIHBhZ2UgdGFibGVzIGFyZSBpbiBzeXN0ZW0gbWVtb3J5LgoKdjM6IHJlbW92ZSBzdHJ1
Y3QgYW1kZ3B1X3ZtX3BhcnNlci4KdjI6IHJlbW92ZSB1bndhbnRlZCB2YXJpYWJsZS4KICAgIGNo
YW5nZSBhbWRncHVfYW1ka2ZkX3ZhbGlkYXRlIGluc3RlYWQgb2YgYW1kZ3B1X2FtZGtmZF9ib192
YWxpZGF0ZS4KClNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
UmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiAuLi4vZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyAgfCAyMSArKysrLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKaW5k
ZXggZjNmYTI3MWUzMzk0Li4yNWFmNDVhZGMwM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKQEAgLTU1LDEyICs1NSw2IEBAIHN0YXRp
YyBzdHJ1Y3QgewogCXNwaW5sb2NrX3QgbWVtX2xpbWl0X2xvY2s7CiB9IGtmZF9tZW1fbGltaXQ7
CiAKLS8qIFN0cnVjdCB1c2VkIGZvciBhbWRncHVfYW1ka2ZkX2JvX3ZhbGlkYXRlICovCi1zdHJ1
Y3QgYW1kZ3B1X3ZtX3BhcnNlciB7Ci0JdWludDMyX3QgICAgICAgIGRvbWFpbjsKLQlib29sICAg
ICAgICAgICAgd2FpdDsKLX07Ci0KIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgZG9tYWluX2Jp
dF90b19zdHJpbmdbXSA9IHsKIAkJIkNQVSIsCiAJCSJHVFQiLApAQCAtMjkzLDExICsyODcsOSBA
QCBzdGF0aWMgaW50IGFtZGdwdV9hbWRrZmRfYm9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9ibyAq
Ym8sIHVpbnQzMl90IGRvbWFpbiwKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGFtZGdw
dV9hbWRrZmRfdmFsaWRhdGUodm9pZCAqcGFyYW0sIHN0cnVjdCBhbWRncHVfYm8gKmJvKQorc3Rh
dGljIGludCBhbWRncHVfYW1ka2ZkX3ZhbGlkYXRlX3ZtX2JvKHZvaWQgKl91bnVzZWQsIHN0cnVj
dCBhbWRncHVfYm8gKmJvKQogewotCXN0cnVjdCBhbWRncHVfdm1fcGFyc2VyICpwID0gcGFyYW07
Ci0KLQlyZXR1cm4gYW1kZ3B1X2FtZGtmZF9ib192YWxpZGF0ZShibywgcC0+ZG9tYWluLCBwLT53
YWl0KTsKKwlyZXR1cm4gYW1kZ3B1X2FtZGtmZF9ib192YWxpZGF0ZShibywgYm8tPmFsbG93ZWRf
ZG9tYWlucywgZmFsc2UpOwogfQogCiAvKiB2bV92YWxpZGF0ZV9wdF9wZF9ib3MgLSBWYWxpZGF0
ZSBwYWdlIHRhYmxlIGFuZCBkaXJlY3RvcnkgQk9zCkBAIC0zMTEsMjAgKzMwMywxNSBAQCBzdGF0
aWMgaW50IHZtX3ZhbGlkYXRlX3B0X3BkX2JvcyhzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKIHsKIAlz
dHJ1Y3QgYW1kZ3B1X2JvICpwZCA9IHZtLT5yb290LmJhc2UuYm87CiAJc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYocGQtPnRiby5iZGV2KTsKLQlzdHJ1Y3QgYW1k
Z3B1X3ZtX3BhcnNlciBwYXJhbTsKIAlpbnQgcmV0OwogCi0JcGFyYW0uZG9tYWluID0gQU1ER1BV
X0dFTV9ET01BSU5fVlJBTTsKLQlwYXJhbS53YWl0ID0gZmFsc2U7Ci0KLQlyZXQgPSBhbWRncHVf
dm1fdmFsaWRhdGVfcHRfYm9zKGFkZXYsIHZtLCBhbWRncHVfYW1ka2ZkX3ZhbGlkYXRlLAotCQkJ
CQkmcGFyYW0pOworCXJldCA9IGFtZGdwdV92bV92YWxpZGF0ZV9wdF9ib3MoYWRldiwgdm0sIGFt
ZGdwdV9hbWRrZmRfdmFsaWRhdGVfdm1fYm8sIE5VTEwpOwogCWlmIChyZXQpIHsKIAkJcHJfZXJy
KCJhbWRncHU6IGZhaWxlZCB0byB2YWxpZGF0ZSBQVCBCT3NcbiIpOwogCQlyZXR1cm4gcmV0Owog
CX0KIAotCXJldCA9IGFtZGdwdV9hbWRrZmRfdmFsaWRhdGUoJnBhcmFtLCBwZCk7CisJcmV0ID0g
YW1kZ3B1X2FtZGtmZF92YWxpZGF0ZV92bV9ibyhOVUxMLCBwZCk7CiAJaWYgKHJldCkgewogCQlw
cl9lcnIoImFtZGdwdTogZmFpbGVkIHRvIHZhbGlkYXRlIFBEXG4iKTsKIAkJcmV0dXJuIHJldDsK
LS0gCjIuMzAuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
