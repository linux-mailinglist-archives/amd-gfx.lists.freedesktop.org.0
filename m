Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CEFFB245
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Nov 2019 15:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976536ED35;
	Wed, 13 Nov 2019 14:12:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7F3898EE;
 Wed, 13 Nov 2019 12:37:26 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EC2AC50C19271275A005;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:11 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 3/7] drm/amdgpu: remove set but not used variable 'count'
Date: Wed, 13 Nov 2019 20:44:30 +0800
Message-ID: <1573649074-72589-4-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
References: <1573649074-72589-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 13 Nov 2019 14:12:08 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, zhengbin13@huawei.com,
 dri-devel@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jOiBJbiBmdW5jdGlvbgrigJhrZ2Qya2ZkX3Bv
c3RfcmVzZXTigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYzo3NDU6
MTE6IHdhcm5pbmc6CnZhcmlhYmxlIOKAmGNvdW504oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgonY291bnQnIGlzIG5ldmVyIHVzZWQsIHNvIGNhbiBiZSBy
ZW1vdmVkLiBUaHVzICdhdG9taWNfZGVjX3JldHVybicKY2FuIGJlIHJlcGxhY2VkIGFzICdhdG9t
aWNfZGVjJwoKRml4ZXM6IGU0MjA1MWQyMTMzYiAoImRybS9hbWRrZmQ6IEltcGxlbWVudCBHUFUg
cmVzZXQgaGFuZGxlcnMgaW4gS0ZEIikKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMKaW5kZXggNGZhODgzNC4uMjA5
YmZjOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtNzQyLDcg
Kzc0Miw3IEBAIGludCBrZ2Qya2ZkX3ByZV9yZXNldChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQogCiBp
bnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpCiB7Ci0JaW50IHJldCwg
Y291bnQ7CisJaW50IHJldDsKIAogCWlmICgha2ZkLT5pbml0X2NvbXBsZXRlKQogCQlyZXR1cm4g
MDsKQEAgLTc1MCw3ICs3NTAsNyBAQCBpbnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRf
ZGV2ICprZmQpCiAJcmV0ID0ga2ZkX3Jlc3VtZShrZmQpOwogCWlmIChyZXQpCiAJCXJldHVybiBy
ZXQ7Ci0JY291bnQgPSBhdG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7CisJYXRvbWljX2Rl
Yygma2ZkX2xvY2tlZCk7CiAKIAlhdG9taWNfc2V0KCZrZmQtPnNyYW1fZWNjX2ZsYWcsIDApOwog
Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
