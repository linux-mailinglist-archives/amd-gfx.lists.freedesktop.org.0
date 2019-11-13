Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507B1FB241
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Nov 2019 15:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230816ED26;
	Wed, 13 Nov 2019 14:12:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181A8891C0;
 Wed, 13 Nov 2019 12:37:24 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BF5C8BCE6318978C209D;
 Wed, 13 Nov 2019 20:37:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 13 Nov 2019
 20:37:12 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <christian.koenig@amd.com>, <David1.Zhou@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <Rex.Zhu@amd.com>, <evan.quan@amd.com>
Subject: [PATCH 6/7] drm/amd/powerplay: remove set but not used variable
 'state'
Date: Wed, 13 Nov 2019 20:44:33 +0800
Message-ID: <1573649074-72589-7-git-send-email-yukuai3@huawei.com>
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
cHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmM6IEluCmZ1bmN0aW9uIOKA
mGZpamlfcG9wdWxhdGVfbWVtb3J5X3RpbWluZ19wYXJhbWV0ZXJz4oCZOgpkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYzoxNTA0Ojg6Cndhcm5pbmc6IHZh
cmlhYmxlIOKAmHN0YXRl4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFy
aWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBzbyBjYW4gYmUgcmVtb3ZlZC4KCkZpeGVzOiAyZTEx
MmI0YWUzYmEgKCJkcm0vYW1kL3BwOiByZW1vdmUgZmlqaV9zbWMvc211bWdyIHNwbGl0LiIpClNp
Z25lZC1vZmYtYnk6IHl1IGt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVtZ3IvZmlqaV9zbXVtZ3IuYwppbmRleCBjM2RmM2Ez
Li4zMmViYjM4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvZmlqaV9zbXVtZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVt
Z3IvZmlqaV9zbXVtZ3IuYwpAQCAtMTQ5OSw3ICsxNDk5LDcgQEAgc3RhdGljIGludCBmaWppX3Bv
cHVsYXRlX21lbW9yeV90aW1pbmdfcGFyYW1ldGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAog
CXVpbnQzMl90IGRyYW1fdGltaW5nOwogCXVpbnQzMl90IGRyYW1fdGltaW5nMjsKIAl1aW50MzJf
dCBidXJzdFRpbWU7Ci0JVUxPTkcgc3RhdGUsIHRycmRzLCB0cnJkbDsKKwlVTE9ORyB0cnJkcywg
dHJyZGw7CiAJaW50IHJlc3VsdDsKIAogCXJlc3VsdCA9IGF0b21jdHJsX3NldF9lbmdpbmVfZHJh
bV90aW1pbmdzX3J2NzcwKGh3bWdyLApAQCAtMTUxMSw3ICsxNTExLDYgQEAgc3RhdGljIGludCBm
aWppX3BvcHVsYXRlX21lbW9yeV90aW1pbmdfcGFyYW1ldGVycyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3
bWdyLAogCWRyYW1fdGltaW5nMiA9IGNnc19yZWFkX3JlZ2lzdGVyKGh3bWdyLT5kZXZpY2UsIG1t
TUNfQVJCX0RSQU1fVElNSU5HMik7CiAJYnVyc3RUaW1lID0gY2dzX3JlYWRfcmVnaXN0ZXIoaHdt
Z3ItPmRldmljZSwgbW1NQ19BUkJfQlVSU1RfVElNRSk7CiAKLQlzdGF0ZSA9IFBITV9HRVRfRklF
TEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgU1RBVEUwKTsKIAl0cnJkcyA9IFBITV9H
RVRfRklFTEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgVFJSRFMwKTsKIAl0cnJkbCA9
IFBITV9HRVRfRklFTEQoYnVyc3RUaW1lLCBNQ19BUkJfQlVSU1RfVElNRSwgVFJSREwwKTsKIAot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
