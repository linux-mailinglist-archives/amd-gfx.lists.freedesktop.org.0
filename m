Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859ABC3AB4
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 18:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EDA891B3;
	Tue,  1 Oct 2019 16:39:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED3D891B3;
 Tue,  1 Oct 2019 16:39:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2681321920;
 Tue,  1 Oct 2019 16:39:49 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 19/71] drm/amdgpu: Fix KFD-related kernel oops on
 Hawaii
Date: Tue,  1 Oct 2019 12:38:29 -0400
Message-Id: <20191001163922.14735-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001163922.14735-1-sashal@kernel.org>
References: <20191001163922.14735-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569947990;
 bh=WtMBOunqzYjl4jozG6r1PE63VrycBMI8XpYf9CAn4oA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zvjOxzlwCFZb8zWwrEKXl6qX/pdNv0YFBqc+whfan7GG7ZKf8MsOiDdtMZ/+D0uGo
 UPqhZ1EoGCT531ockbNEhlTyV2UPAHZzA6lkToiMnsMGDk3uCrAyE5eu8a2YTmn6RJ
 nHiXBNwxmC0/b3HpMM2e1varC4AzyX8VH179nKiY=
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
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCBkY2FmYmQ1MGYyZTRkNWNjOTY0YWFlNDA5ZmI1NjkxYjc0M2ZiYTIzIF0KCkhhd2Fp
aSBuZWVkcyB0byBmbHVzaCBjYWNoZXMgZXhwbGljaXRseSwgc3VibWl0dGluZyBhbiBJQiBpbiBh
IHVzZXIKVk1JRCBmcm9tIGtlcm5lbCBtb2RlLiBUaGVyZSBpcyBubyBzX2ZlbmNlIGluIHRoaXMg
Y2FzZS4KCkZpeGVzOiBlYjM5NjFhNTc0MjQgKCJkcm0vYW1kZ3B1OiByZW1vdmUgZmVuY2UgY29u
dGV4dCBmcm9tIHRoZSBqb2IiKQpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKaW5kZXggNzg1MDA4NGEwNWUzYS4uNjA2NTU4
MzRkNjQ5OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2li
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMKQEAgLTE0Myw3
ICsxNDMsOCBAQCBpbnQgYW1kZ3B1X2liX3NjaGVkdWxlKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywgdW5zaWduZWQgbnVtX2licywKIAkvKiByaW5nIHRlc3RzIGRvbid0IHVzZSBhIGpvYiAqLwog
CWlmIChqb2IpIHsKIAkJdm0gPSBqb2ItPnZtOwotCQlmZW5jZV9jdHggPSBqb2ItPmJhc2Uuc19m
ZW5jZS0+c2NoZWR1bGVkLmNvbnRleHQ7CisJCWZlbmNlX2N0eCA9IGpvYi0+YmFzZS5zX2ZlbmNl
ID8KKwkJCWpvYi0+YmFzZS5zX2ZlbmNlLT5zY2hlZHVsZWQuY29udGV4dCA6IDA7CiAJfSBlbHNl
IHsKIAkJdm0gPSBOVUxMOwogCQlmZW5jZV9jdHggPSAwOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
