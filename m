Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5115DC0B
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 16:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BBC6F9A4;
	Fri, 14 Feb 2020 15:52:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9844C6F9A1;
 Fri, 14 Feb 2020 15:52:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1F31222C4;
 Fri, 14 Feb 2020 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695527;
 bh=WKtH/RZTRwM7WT0NeLzaocPcyIhA+2QbGqT+MfxqYcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hwD2w8Q+1nZ0BK8KMggi8Iu9Z0mqZaTj6jnhlvCtla8lwZyjeqWC8zK4qPnZzV4Fm
 CeYVc4SZP5qDJu+EQ0ORltFNiI0HIqkSzUxOfchLBUFUSaNOEQKgToW5xxeRTzVPkA
 GfWy8lUlF0gzFjnpLZRwVf1RvOYpWj53dzYHiSjk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 148/542] drm/amdgpu: remove set but not used
 variable 'count'
Date: Fri, 14 Feb 2020 10:42:20 -0500
Message-Id: <20200214154854.6746-148-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, yu kuai <yukuai3@huawei.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgYTFi
ZDA3OWZjYTYyMTllMThiYjA4OTJmMGE3MjI4YTc2ZGQ2MjkyYyBdCgpGaXhlcyBnY2MgJy1XdW51
c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtm
ZC9rZmRfZGV2aWNlLmM6IEluIGZ1bmN0aW9uCuKAmGtnZDJrZmRfcG9zdF9yZXNldOKAmToKZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jOjc0NToxMTogd2FybmluZzoKdmFy
aWFibGUg4oCYY291bnTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KCidjb3VudCcgaXMgbmV2ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuIFRodXMgJ2F0
b21pY19kZWNfcmV0dXJuJwpjYW4gYmUgcmVwbGFjZWQgYXMgJ2F0b21pY19kZWMnCgpGaXhlczog
ZTQyMDUxZDIxMzNiICgiZHJtL2FtZGtmZDogSW1wbGVtZW50IEdQVSByZXNldCBoYW5kbGVycyBp
biBLRkQiKQpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfZGV2aWNlLmMKaW5kZXggNGZhODgzNGNlN2NiMC4uMjA5YmZjODQ5MzUyYiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYwpAQCAtNzQyLDcgKzc0Miw3IEBAIGludCBr
Z2Qya2ZkX3ByZV9yZXNldChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQogCiBpbnQga2dkMmtmZF9wb3N0
X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpCiB7Ci0JaW50IHJldCwgY291bnQ7CisJaW50IHJl
dDsKIAogCWlmICgha2ZkLT5pbml0X2NvbXBsZXRlKQogCQlyZXR1cm4gMDsKQEAgLTc1MCw3ICs3
NTAsNyBAQCBpbnQga2dkMmtmZF9wb3N0X3Jlc2V0KHN0cnVjdCBrZmRfZGV2ICprZmQpCiAJcmV0
ID0ga2ZkX3Jlc3VtZShrZmQpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0JY291bnQgPSBh
dG9taWNfZGVjX3JldHVybigma2ZkX2xvY2tlZCk7CisJYXRvbWljX2RlYygma2ZkX2xvY2tlZCk7
CiAKIAlhdG9taWNfc2V0KCZrZmQtPnNyYW1fZWNjX2ZsYWcsIDApOwogCi0tIAoyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
