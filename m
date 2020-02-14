Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBDB15E14A
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 17:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEE96FADE;
	Fri, 14 Feb 2020 16:18:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313DE6E837;
 Fri, 14 Feb 2020 16:18:19 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E33F24692;
 Fri, 14 Feb 2020 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697099;
 bh=FcvBkKpzEgcoIU2wYmSoYkgz1dx3PGPVxKSmKX7uaaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KOQTgiUAaHAsMep+qdvRdQMLDg6fECNbPgyCRDEe+0hj8pFN33StdoRv+b9+hJgfS
 wpjSVBa6eMMnyroanra2Vu9B7mtZlmU1i7/yN7o8qbYoH6TFt1s72CVsaBe60n6m6B
 /X9p/Gw+g72rMpALLoq5nIINCxoEsrjBryzTHUc8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 049/186] drm/amdgpu: remove always false
 comparison in 'amdgpu_atombios_i2c_process_i2c_ch'
Date: Fri, 14 Feb 2020 11:14:58 -0500
Message-Id: <20200214161715.18113-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161715.18113-1-sashal@kernel.org>
References: <20200214161715.18113-1-sashal@kernel.org>
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

RnJvbTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgMjIw
YWM4ZDE0NDQwNTRhZGUwN2NlMTQ0OThmY2RhMjY2NDEwZjkwZSBdCgpGaXhlcyBnY2MgJy1XdHlw
ZS1saW1pdHMnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19p
MmMuYzogSW4gZnVuY3Rpb24K4oCYYW1kZ3B1X2F0b21iaW9zX2kyY19wcm9jZXNzX2kyY19jaOKA
mToKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfaTJjLmM6Nzk6MTE6IHdhcm5p
bmc6IGNvbXBhcmlzb24gaXMKYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9mIGRh
dGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KCidudW0nIGlzICd1OCcsIHNvIGl0IHdpbGwgbmV2ZXIg
YmUgZ3JlYXRlciB0aGFuICdUT01fTUFYX0hXX0kyQ19SRUFEJywKd2hpY2ggaXMgZGVmaW5lZCBh
cyAyNTUuIFRoZXJlZm9yZSwgdGhlIGNvbXBhcmlzb24gY2FuIGJlIHJlbW92ZWQuCgpGaXhlczog
ZDM4Y2VhZjk5ZWQwICgiZHJtL2FtZGdwdTogYWRkIGNvcmUgZHJpdmVyICh2NCkiKQpTaWduZWQt
b2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2F0b21iaW9zX2kyYy5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfaTJjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19pMmMuYwppbmRleCBiMzc0NjUz
YmQ2Y2YzLi43NDFiZDFlNTI2OTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hdG9tYmlvc19pMmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9t
Ymlvc19pMmMuYwpAQCAtNjksMTEgKzY5LDYgQEAgc3RhdGljIGludCBhbWRncHVfYXRvbWJpb3Nf
aTJjX3Byb2Nlc3NfaTJjX2NoKHN0cnVjdCBhbWRncHVfaTJjX2NoYW4gKmNoYW4sCiAJCQltZW1j
cHkoJm91dCwgJmJ1ZlsxXSwgbnVtKTsKIAkJYXJncy5scEkyQ0RhdGFPdXQgPSBjcHVfdG9fbGUx
NihvdXQpOwogCX0gZWxzZSB7Ci0JCWlmIChudW0gPiBBVE9NX01BWF9IV19JMkNfUkVBRCkgewot
CQkJRFJNX0VSUk9SKCJodyBpMmM6IHRyaWVkIHRvIHJlYWQgdG9vIG1hbnkgYnl0ZXMgKCVkIHZz
IDI1NSlcbiIsIG51bSk7Ci0JCQlyID0gLUVJTlZBTDsKLQkJCWdvdG8gZG9uZTsKLQkJfQogCQlh
cmdzLnVjUmVnSW5kZXggPSAwOwogCQlhcmdzLmxwSTJDRGF0YU91dCA9IDA7CiAJfQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
