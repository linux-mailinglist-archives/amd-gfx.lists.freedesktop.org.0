Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F8240D76
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Aug 2020 21:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5AB89951;
	Mon, 10 Aug 2020 19:09:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B4A89951;
 Mon, 10 Aug 2020 19:09:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FFD921775;
 Mon, 10 Aug 2020 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597086552;
 bh=OZgnXvx23vXflLx+ujm4Ke0HulmPUTb8NcBv6f2uvVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dAw12+GEBxNDTF/DjVVvpwdTtxhgo4ja1As1Dc0sjtoC+4v5zKzL/1UvjO0w6K55M
 kqeZMU+JP0gaajTtIRXE8lMBrvGNavhC87j6Qah606Rtap1JWXRufQvdR4u/L/iWf0
 roHG8CT6UVqR7/0fr+WY5X1tzKmro26/yiuvGyc8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 09/64] drm/amdgpu: avoid dereferencing a NULL
 pointer
Date: Mon, 10 Aug 2020 15:08:04 -0400
Message-Id: <20200810190859.3793319-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810190859.3793319-1-sashal@kernel.org>
References: <20200810190859.3793319-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Jack Xiao <Jack.Xiao@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDU1
NjExYjUwN2ZkNjQ1M2QyNjAzMGMwYzA2MTlmZGYwYzI2Mjc2NmQgXQoKQ2hlY2sgaWYgaXJxX3Ny
YyBpcyBOVUxMIHRvIGF2b2lkIGRlcmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIsCmZvciBNRVMg
cmluZyBpcyB1bmVjY2Vzc2FyeSB0byByZWNpZXZlIGFuIGludGVycnVwdCBub3RpZmljYXRpb24u
CgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQuY29tPgpBY2tlZC1ieTog
QWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpSZXZpZXdlZC1ieTogSGF3
a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExl
dmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZmVuY2UuYyB8IDE5ICsrKysrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ZlbmNlLmMKaW5kZXggZDg3OGZlN2ZlZTUxYy4uMzQxNGUxMTlmMGNiZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKQEAgLTQxNiw3ICs0MTYs
OSBAQCBpbnQgYW1kZ3B1X2ZlbmNlX2RyaXZlcl9zdGFydF9yaW5nKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywKIAkJcmluZy0+ZmVuY2VfZHJ2LmdwdV9hZGRyID0gYWRldi0+dXZkLmluc3Rbcmlu
Zy0+bWVdLmdwdV9hZGRyICsgaW5kZXg7CiAJfQogCWFtZGdwdV9mZW5jZV93cml0ZShyaW5nLCBh
dG9taWNfcmVhZCgmcmluZy0+ZmVuY2VfZHJ2Lmxhc3Rfc2VxKSk7Ci0JYW1kZ3B1X2lycV9nZXQo
YWRldiwgaXJxX3NyYywgaXJxX3R5cGUpOworCisJaWYgKGlycV9zcmMpCisJCWFtZGdwdV9pcnFf
Z2V0KGFkZXYsIGlycV9zcmMsIGlycV90eXBlKTsKIAogCXJpbmctPmZlbmNlX2Rydi5pcnFfc3Jj
ID0gaXJxX3NyYzsKIAlyaW5nLT5mZW5jZV9kcnYuaXJxX3R5cGUgPSBpcnFfdHlwZTsKQEAgLTUz
Nyw4ICs1MzksOSBAQCB2b2lkIGFtZGdwdV9mZW5jZV9kcml2ZXJfZmluaShzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJCS8qIG5vIG5lZWQgdG8gdHJpZ2dlciBHUFUgcmVzZXQgYXMgd2Ug
YXJlIHVubG9hZGluZyAqLwogCQkJYW1kZ3B1X2ZlbmNlX2RyaXZlcl9mb3JjZV9jb21wbGV0aW9u
KHJpbmcpOwogCQl9Ci0JCWFtZGdwdV9pcnFfcHV0KGFkZXYsIHJpbmctPmZlbmNlX2Rydi5pcnFf
c3JjLAotCQkJICAgICAgIHJpbmctPmZlbmNlX2Rydi5pcnFfdHlwZSk7CisJCWlmIChyaW5nLT5m
ZW5jZV9kcnYuaXJxX3NyYykKKwkJCWFtZGdwdV9pcnFfcHV0KGFkZXYsIHJpbmctPmZlbmNlX2Ry
di5pcnFfc3JjLAorCQkJCSAgICAgICByaW5nLT5mZW5jZV9kcnYuaXJxX3R5cGUpOwogCQlkcm1f
c2NoZWRfZmluaSgmcmluZy0+c2NoZWQpOwogCQlkZWxfdGltZXJfc3luYygmcmluZy0+ZmVuY2Vf
ZHJ2LmZhbGxiYWNrX3RpbWVyKTsKIAkJZm9yIChqID0gMDsgaiA8PSByaW5nLT5mZW5jZV9kcnYu
bnVtX2ZlbmNlc19tYXNrOyArK2opCkBAIC01NzQsOCArNTc3LDkgQEAgdm9pZCBhbWRncHVfZmVu
Y2VfZHJpdmVyX3N1c3BlbmQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCX0KIAogCQkv
KiBkaXNhYmxlIHRoZSBpbnRlcnJ1cHQgKi8KLQkJYW1kZ3B1X2lycV9wdXQoYWRldiwgcmluZy0+
ZmVuY2VfZHJ2LmlycV9zcmMsCi0JCQkgICAgICAgcmluZy0+ZmVuY2VfZHJ2LmlycV90eXBlKTsK
KwkJaWYgKHJpbmctPmZlbmNlX2Rydi5pcnFfc3JjKQorCQkJYW1kZ3B1X2lycV9wdXQoYWRldiwg
cmluZy0+ZmVuY2VfZHJ2LmlycV9zcmMsCisJCQkJICAgICAgIHJpbmctPmZlbmNlX2Rydi5pcnFf
dHlwZSk7CiAJfQogfQogCkBAIC02MDEsOCArNjA1LDkgQEAgdm9pZCBhbWRncHVfZmVuY2VfZHJp
dmVyX3Jlc3VtZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWNvbnRpbnVlOwogCiAJ
CS8qIGVuYWJsZSB0aGUgaW50ZXJydXB0ICovCi0JCWFtZGdwdV9pcnFfZ2V0KGFkZXYsIHJpbmct
PmZlbmNlX2Rydi5pcnFfc3JjLAotCQkJICAgICAgIHJpbmctPmZlbmNlX2Rydi5pcnFfdHlwZSk7
CisJCWlmIChyaW5nLT5mZW5jZV9kcnYuaXJxX3NyYykKKwkJCWFtZGdwdV9pcnFfZ2V0KGFkZXYs
IHJpbmctPmZlbmNlX2Rydi5pcnFfc3JjLAorCQkJCSAgICAgICByaW5nLT5mZW5jZV9kcnYuaXJx
X3R5cGUpOwogCX0KIH0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
