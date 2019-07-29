Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B414279971
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146176E27F;
	Mon, 29 Jul 2019 20:15:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDD989DBC
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:27 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id v6so41904655vsq.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0aw3eyNrlNxzVgSKwejQ0Ropwr+YUCat/axa8FVUOKI=;
 b=DlfWzOYQz1MXmHHZTaQTqFTPPlDMaXPP3NyD3FLQ4a4G93khfrAad6CZypHq7uRqN7
 oYbI2pgdWrWxIpui4Sr2hEwK8LOtswfART41S3aB3XNWNzGNChaPuiolr3w1HPLUvZsw
 nTSEv0FRD1RF3jjSWb6gharqPGHhftY/nzUwGw2ZnwRguhnXa6r/VL7OUzeE0UzLJnDQ
 HI5VutDaxTmOGAoD1WeuTC8G6l+QpUB3vwePn032IMUE7HKvfrNslbTki+k3mCg7FqcD
 wSjLOtcISi1413sMOaLE5CcnWjW3eqP6sRljQXvoQ2e3i0aqpvHfUNWQg3N0qUdnIysO
 JFWA==
X-Gm-Message-State: APjAAAXnm/5hmenwEtP+o3vYIoryD3xeqXLOpsgXuheHVv3ewEDN2l9D
 xgZl0sbGdOTAmWowi1TWpVKPRSOy
X-Google-Smtp-Source: APXvYqwLR9UFgO2Wv7mSoBEHs5tlqE6cUEtIfDTexy5DA9zrL27L+KxBU0W7IOi4fMUPDd5bgjvmlA==
X-Received: by 2002:a67:d58a:: with SMTP id m10mr72679004vsj.15.1564431326361; 
 Mon, 29 Jul 2019 13:15:26 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/30] drm/amd/powerplay: initialize arcturus MP1 and THM base
 address
Date: Mon, 29 Jul 2019 15:14:45 -0500
Message-Id: <20190729201508.16136-8-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0aw3eyNrlNxzVgSKwejQ0Ropwr+YUCat/axa8FVUOKI=;
 b=dBzRbhezALsz40rPWvFFGgHzhPCi9OlXI1lkPhMUxegRn9bav0LAZ3w9hfMrtQP3z0
 L/IyeRXNQgqChr/+E2Pl5KzdDt3RAc5bWNH86CGysVQRqUTxmWkgm32ImwsKuzQJPtXM
 R+Gj9IhClDTmdc6Uez1zxtmxq27f4bqDmdoxGhFnzoPNx9i3zSL7Z92x6d+K+EoM0XsW
 eSEZOmqa1o6SFtlVo5qLJgLBLlBXddLg4IwNHucebFcAipSjWOnmS8D7ir5+J5NX0LsS
 NpgW2GY30hFZ7Bl+PSeqwrhQDEN44Ar84dgOZOH6lVLPSNDv2nuMkg/85rLqQy1KLasb
 QAGA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkluaXRpYWxpemUgYmFzZSBhZGRy
ZXNzIGZvciB0aG9zZSBJUHMgd2hpY2ggYXJlIHVzZWQgaW4gcG93ZXJwbGF5LgoKU2lnbmVkLW9m
Zi1ieTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtlbm5ldGgg
RmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hcmN0X3JlZ19pbml0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXJjdF9yZWdfaW5pdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXJjdF9yZWdfaW5pdC5jCmluZGV4IDUxYjhj
ZGZmYjE5Ni4uNDg1Mzg5OWIxODI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hcmN0X3JlZ19pbml0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXJj
dF9yZWdfaW5pdC5jCkBAIC0zOCw2ICszOCw3IEBAIGludCBhcmN0X3JlZ19iYXNlX2luaXQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCWFkZXYtPnJlZ19vZmZzZXRbQVRIVUJfSFdJUF1b
aV0gPSAodWludDMyX3QgKikoJihBVEhVQl9CQVNFLmluc3RhbmNlW2ldKSk7CiAJCWFkZXYtPnJl
Z19vZmZzZXRbTkJJT19IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKE5CSUYwX0JBU0UuaW5zdGFu
Y2VbaV0pKTsKIAkJYWRldi0+cmVnX29mZnNldFtNUDBfSFdJUF1baV0gPSAodWludDMyX3QgKiko
JihNUDBfQkFTRS5pbnN0YW5jZVtpXSkpOworCQlhZGV2LT5yZWdfb2Zmc2V0W01QMV9IV0lQXVtp
XSA9ICh1aW50MzJfdCAqKSgmKE1QMV9CQVNFLmluc3RhbmNlW2ldKSk7CiAJCWFkZXYtPnJlZ19v
ZmZzZXRbVVZEX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoVVZEX0JBU0UuaW5zdGFuY2VbaV0p
KTsKIAkJYWRldi0+cmVnX29mZnNldFtERl9IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKERGX0JB
U0UuaW5zdGFuY2VbaV0pKTsKIAkJYWRldi0+cmVnX29mZnNldFtPU1NTWVNfSFdJUF1baV0gPSAo
dWludDMyX3QgKikoJihPU1NTWVNfQkFTRS5pbnN0YW5jZVtpXSkpOwpAQCAtNTAsNiArNTEsNyBA
QCBpbnQgYXJjdF9yZWdfYmFzZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlh
ZGV2LT5yZWdfb2Zmc2V0W1NETUE2X0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoU0RNQTZfQkFT
RS5pbnN0YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0W1NETUE3X0hXSVBdW2ldID0gKHVp
bnQzMl90ICopKCYoU0RNQTdfQkFTRS5pbnN0YW5jZVtpXSkpOwogCQlhZGV2LT5yZWdfb2Zmc2V0
W1NNVUlPX0hXSVBdW2ldID0gKHVpbnQzMl90ICopKCYoU01VSU9fQkFTRS5pbnN0YW5jZVtpXSkp
OworCQlhZGV2LT5yZWdfb2Zmc2V0W1RITV9IV0lQXVtpXSA9ICh1aW50MzJfdCAqKSgmKFRITV9C
QVNFLmluc3RhbmNlW2ldKSk7CiAJfQogCXJldHVybiAwOwogfQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
