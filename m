Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4FB407C
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Sep 2019 20:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234726EA32;
	Mon, 16 Sep 2019 18:43:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA196EA32
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 18:43:23 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id u186so1046312qkc.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 11:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2P8zjtMw/gCIdYS0avrnwaQteIfI9xNuKZ/UW3zR+v8=;
 b=Q6hUZB4ZZ12bvWWM+NF8y2pnDce3Br0T/3LCvE9AsftkluaHaHhZdIjWfpfk/Pvo0T
 HveLLN33GN/nEzbBjK3feiDTjpXAwX9OJ9NYc85jHHCodlBTIe+U3QkOCZRlpel0yiQ6
 WPVw1cQxqq1gWXrQEzkQSzxjTXXWTqV+NHRgrQj4usShQSKvgpg/BkimXYJezsK6J8HB
 nSB0mqEihgqP1FcodYSGnn17O0HvUQvjiCdtHFQpG0QHv3xhmg80eTkX3VGn4q1l3PFk
 ZTZoSooO4xoJiO9qrVrbcfxq6+2Uh9R+E5ai1QcPRYExLbAJw8PKMY/1XsHw8YraH/fM
 kHEA==
X-Gm-Message-State: APjAAAXOYjDJTxtwIisP8ziffX7Uua10pVacK3GUSztSRpKQlm3Rhsa6
 GPFLjv7XOsmlCi3sObm2PCYeAm0Z
X-Google-Smtp-Source: APXvYqxC+1WSU2PxDvG+zE+OxLf30Q8xufLdV2z5obQynlteuY9WsEXaYKbzEv1O0z5QmATZUAc1lg==
X-Received: by 2002:a37:b8f:: with SMTP id 137mr1416906qkl.466.1568659401778; 
 Mon, 16 Sep 2019 11:43:21 -0700 (PDT)
Received: from localhost.localdomain ([71.219.73.178])
 by smtp.gmail.com with ESMTPSA id n17sm20125714qke.103.2019.09.16.11.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 11:43:21 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: use PAGE_SHIFT rather than PAGE_SIZE to get
 the shift
Date: Mon, 16 Sep 2019 13:43:12 -0500
Message-Id: <20190916184313.20567-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2P8zjtMw/gCIdYS0avrnwaQteIfI9xNuKZ/UW3zR+v8=;
 b=CUCH+/czjgycq6ybILHQCR+Db0IKNpNy6b4hMcG3pb2fG7FmeFNxwnDvJi9jn7tw4w
 o/elvV8c+nNIj6oWKwlJVV7ZoPAxlXFhuGRdMZUl1xiURqajE6vZb6aYimF64diCGRY2
 jr/B8PNOd5hzKXJGq7buTKea/bnLm5pjV/cmC1wH8wiGs9maiwogkJMTwblgZhZKIp4X
 M1z7RP8Gc1hSoSY2tChKxXLVi+n44chyhuUXPb8x64i/ick1XaAps0A57g/y3nHPkU5P
 jF2BlVpsvrj3/0d1O+I3FZhdI/ChBUn4qsZ63A4US9+PDae1ripe6/CFDQ7fPw3RmCCu
 Anrg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TG9va3MgbGlrZSBhIGNvcHkgYW5kIHBhc3RlIHR5cG8uCgpGaXhlczogMGQ5YTgwMjEzODI5ICgi
ZHJtL2FtZGdwdTogY2xlYW51cCBjcmVhdGluZyBCT3MgYXQgZml4ZWQgbG9jYXRpb24iKQpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3Jhcy5jCmluZGV4IGJlNDk0MTk3NzhkYi4uZmYxZmMwODRmZmUxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xNDA5LDcgKzE0MDksNyBA
QCBpbnQgYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldikKIAlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkr
KykgewogCQlicCA9IGRhdGEtPmJwc1tpXS5yZXRpcmVkX3BhZ2U7CiAKLQkJaWYgKGFtZGdwdV9i
b19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBBR0VfU0laRSwgUEFHRV9TSVpFLAorCQlp
ZiAoYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWxfYXQoYWRldiwgYnAgPDwgUEFHRV9TSElGVCwgUEFH
RV9TSVpFLAogCQkJCQkgICAgICAgQU1ER1BVX0dFTV9ET01BSU5fVlJBTSwKIAkJCQkJICAgICAg
ICZibywgTlVMTCkpCiAJCQlEUk1fRVJST1IoIlJBUyBFUlJPUjogcmVzZXJ2ZSB2cmFtICVsbHgg
ZmFpbFxuIiwgYnApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
