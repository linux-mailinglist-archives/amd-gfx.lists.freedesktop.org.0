Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21C79976
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 22:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F966E290;
	Mon, 29 Jul 2019 20:15:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768656E28C
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 20:15:29 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id e83so12297458vke.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 13:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUdr+oHPoOGatG4uLs9MVDSe4FD4YRV4eelx0rZKi1A=;
 b=Tx4xwIt2mCUmriKIO1QhKGCEMdQOrVnGelXniiLc54Hd0NT7gBOQjhOw3jCYXZtoxh
 F4hCIvVhJTiRhxAWnspMXFzJW9ZYk6RzTh5UfMF6RJ7mYbt1geURyILT2vXs6Arb/AxF
 bpR/1Raw2S3D98kGH6Q7lsQ+IEOurdOsHv3s6jJFNG1zEReroJ2buoHAfXNS3P1yPRCM
 5vnwv6QZPrWQ3uGA1wq2mVc9Sl2EWvW53sLX6zGG319lVkxNQNrqXJuJtxbAnzCjtMY3
 24Gv7oMJeMxZSprTwz8Q7oAYJyZWgk9wYYVNuhsV0lRjGO9hZ3Tr+TfXS8qASMqbO6Te
 W8wA==
X-Gm-Message-State: APjAAAVkyevSkqKIluBPgvsiXysQ3dochZaL3W/oWFpba10MKWZZ5ahT
 wD6iytfGSyaoZ226q+1YA1c+8LRJ
X-Google-Smtp-Source: APXvYqzv2NaAhtpD5hvU7TH2LvcriQf+H5U3cvxT35Y5yW5HLtnAnX0i0dYFhJwsD2IUp6RJfTxbbA==
X-Received: by 2002:a1f:aeca:: with SMTP id x193mr42341669vke.20.1564431328169; 
 Mon, 29 Jul 2019 13:15:28 -0700 (PDT)
Received: from localhost.localdomain ([71.51.160.180])
 by smtp.gmail.com with ESMTPSA id e3sm11384263vsp.6.2019.07.29.13.15.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 13:15:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/30] drm/amdgpu: correct VCN powergate routine for acturus
Date: Mon, 29 Jul 2019 15:14:47 -0500
Message-Id: <20190729201508.16136-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729201508.16136-1-alexander.deucher@amd.com>
References: <20190729201508.16136-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUdr+oHPoOGatG4uLs9MVDSe4FD4YRV4eelx0rZKi1A=;
 b=ExcghaBwztXqHD48ZtkkC2OAEzrrwW3clwsV4j2AMUG1oSnD1n/eM7i8VM8kKm9GKS
 AJdNwk4UuqaDgiMYv48a9YDzflSUBVxdGzckh0IXrjlD5OgcbJsZ5h7JqkWCnTw0JEPq
 oJBDZWEvTjNyXSY04Sue88MHXFIzgb7FJs9LBxi0a4iv1216W+UE1MJaiQlkThpP6bSU
 6UbOXYTlaqNedm8o0hU7emM6VkvkqNSpBDj2hkeJ40Ygv2eUWfOtql2h6m2DJ+K7+K4W
 pq1Rs2FOK0RMpi4xeMlR6eRHkzAZDZzB5dBwuTmfPEOE2dzPSUNAQrb2tnItLnWkoBiw
 E4RQ==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Le Ma <Le.Ma@amd.com>,
 Evan Quan <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KCkFyY3R1cnVzIFZDTiBzaG91bGQg
cG93ZXJnYXRlIGluIHRoZSB3YXkgYXMgTmF2aS4KClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8
ZXZhbi5xdWFuQGFtZC5jb20+ClJldmlld2VkLWJ5OiBMZSBNYSA8TGUuTWFAYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEtlbm5ldGggRmVuZyA8a2VubmV0aC5mZW5nQGFtZC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Zjbi5jCmluZGV4IGJlMzRiZGM0NzE3NC4uMjFjYThlMGFiOGI2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCkBAIC0zMDQsNyArMzA0LDcgQEAgc3Rh
dGljIHZvaWQgYW1kZ3B1X3Zjbl9pZGxlX3dvcmtfaGFuZGxlcihzdHJ1Y3Qgd29ya19zdHJ1Y3Qg
KndvcmspCiAKIAlpZiAoZmVuY2VzID09IDApIHsKIAkJYW1kZ3B1X2dmeF9vZmZfY3RybChhZGV2
LCB0cnVlKTsKLQkJaWYgKGFkZXYtPmFzaWNfdHlwZSA8IENISVBfTkFWSTEwICYmIGFkZXYtPnBt
LmRwbV9lbmFibGVkKQorCQlpZiAoYWRldi0+YXNpY190eXBlIDwgQ0hJUF9BUkNUVVJVUyAmJiBh
ZGV2LT5wbS5kcG1fZW5hYmxlZCkKIAkJCWFtZGdwdV9kcG1fZW5hYmxlX3V2ZChhZGV2LCBmYWxz
ZSk7CiAJCWVsc2UKIAkJCWFtZGdwdV9kZXZpY2VfaXBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFk
ZXYsIEFNRF9JUF9CTE9DS19UWVBFX1ZDTiwKQEAgLTMyMSw3ICszMjEsNyBAQCB2b2lkIGFtZGdw
dV92Y25fcmluZ19iZWdpbl91c2Uoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKQogCiAJaWYgKHNl
dF9jbG9ja3MpIHsKIAkJYW1kZ3B1X2dmeF9vZmZfY3RybChhZGV2LCBmYWxzZSk7Ci0JCWlmIChh
ZGV2LT5hc2ljX3R5cGUgPCBDSElQX05BVkkxMCAmJiBhZGV2LT5wbS5kcG1fZW5hYmxlZCkKKwkJ
aWYgKGFkZXYtPmFzaWNfdHlwZSA8IENISVBfQVJDVFVSVVMgJiYgYWRldi0+cG0uZHBtX2VuYWJs
ZWQpCiAJCQlhbWRncHVfZHBtX2VuYWJsZV91dmQoYWRldiwgdHJ1ZSk7CiAJCWVsc2UKIAkJCWFt
ZGdwdV9kZXZpY2VfaXBfc2V0X3Bvd2VyZ2F0aW5nX3N0YXRlKGFkZXYsIEFNRF9JUF9CTE9DS19U
WVBFX1ZDTiwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
