Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD69EE1A5
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Nov 2019 14:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEB06E453;
	Mon,  4 Nov 2019 13:54:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF056E430;
 Mon,  4 Nov 2019 13:20:19 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 96CA5EC37000DD477241;
 Mon,  4 Nov 2019 21:20:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:04 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 6/7] drm/amdgpu: remove always false comparison in
 'amdgpu_atombios_i2c_process_i2c_ch'
Date: Mon, 4 Nov 2019 21:27:25 +0800
Message-ID: <1572874046-30996-7-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
References: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 13:54:47 +0000
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
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3R5cGUtbGltaXRzJyB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYXRvbWJpb3NfaTJjLmM6IEluIGZ1bmN0aW9uCuKAmGFtZGdwdV9hdG9tYmlvc19pMmNf
cHJvY2Vzc19pMmNfY2jigJk6CmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2ky
Yy5jOjc5OjExOiB3YXJuaW5nOiBjb21wYXJpc29uIGlzCmFsd2F5cyBmYWxzZSBkdWUgdG8gbGlt
aXRlZCByYW5nZSBvZiBkYXRhIHR5cGUgWy1XdHlwZS1saW1pdHNdCgonbnVtJyBpcyAndTgnLCBz
byBpdCB3aWxsIG5ldmVyIGJlIGdyZWF0ZXIgdGhhbiAnVE9NX01BWF9IV19JMkNfUkVBRCcsCndo
aWNoIGlzIGRlZmluZWQgYXMgMjU1LiBUaGVyZWZvcmUsIHRoZSBjb21wYXJpc29uIGNhbiBiZSBy
ZW1vdmVkLgoKRml4ZXM6IGQzOGNlYWY5OWVkMCAoImRybS9hbWRncHU6IGFkZCBjb3JlIGRyaXZl
ciAodjQpIikKU2lnbmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2kyYy5jIHwgNSAtLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYXRvbWJpb3NfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dG9tYmlvc19pMmMuYwppbmRleCA5ODBjMzYzLi5iNGNjN2M1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19pMmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hdG9tYmlvc19pMmMuYwpAQCAtNzYsMTEgKzc2LDYgQEAgc3RhdGljIGludCBh
bWRncHVfYXRvbWJpb3NfaTJjX3Byb2Nlc3NfaTJjX2NoKHN0cnVjdCBhbWRncHVfaTJjX2NoYW4g
KmNoYW4sCiAJCX0KIAkJYXJncy5scEkyQ0RhdGFPdXQgPSBjcHVfdG9fbGUxNihvdXQpOwogCX0g
ZWxzZSB7Ci0JCWlmIChudW0gPiBBVE9NX01BWF9IV19JMkNfUkVBRCkgewotCQkJRFJNX0VSUk9S
KCJodyBpMmM6IHRyaWVkIHRvIHJlYWQgdG9vIG1hbnkgYnl0ZXMgKCVkIHZzIDI1NSlcbiIsIG51
bSk7Ci0JCQlyID0gLUVJTlZBTDsKLQkJCWdvdG8gZG9uZTsKLQkJfQogCQlhcmdzLnVjUmVnSW5k
ZXggPSAwOwogCQlhcmdzLmxwSTJDRGF0YU91dCA9IDA7CiAJfQotLSAKMi43LjQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
