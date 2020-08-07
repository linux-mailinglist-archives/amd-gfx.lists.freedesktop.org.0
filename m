Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA48623ED5D
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Aug 2020 14:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EB46E0F2;
	Fri,  7 Aug 2020 12:33:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6016E0F2
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 12:33:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 88so1532915wrh.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Aug 2020 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GW3bTgxHNXs7PCg/I7nNxUuDzV2z0najr4hsKUuC1Zc=;
 b=aG1SFYqMuisngBDWl6t6Q3zTTDVYEqvSE8eq/zyftNX8bbgwSxcULjP9ROzBjveHMh
 3HK8y25HwY4qCUykMdaRm6mYEv6Sv3oRsL56TUC2cxBXJyBcFXdHyRl5A8rfTPXASWra
 kIS7cXRo4dbvoCfp9aTE8eR+EXQT+C3PD5ZDM7s7r1Hnyh8EcLSiPoM3qr4aGHxga2EU
 Phg0B8xUC1OGOTrgKPXdGku3xoIX6f6mEu9ptUUXo+Htkc8h1LP1KaW6LWjJfB1oJOp3
 hqLxK5nMOG+ADqKvry4DYsfGPY8FlYrBSK8TOHAqbIimP+qTfRXOdlIsoL9n5kTkWy56
 ShZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GW3bTgxHNXs7PCg/I7nNxUuDzV2z0najr4hsKUuC1Zc=;
 b=psop8YalYSpfA/GL48iJhELOLWw/IAR9TkWGS4jz5VrDzzV9NRYGiPgubnzKFjX285
 Cu8QAOXIby8qBL5KOb5tmpLGRdC8zGx9XpuXSrKH8S3w7pHQ5rA7yaOVjhwyjCul0BJC
 WsTGN9K3080A9ELeSRvqbEK6f4WG0CnjvGc/9XHUPHH/Ldn9yFmeS5jvJLBnGuHjSKza
 9yjE7kJu0qRZEW2KY640au5OaI/v1jdWSGsRlEYgDPosV5t4lQKlAWM1Qg4r7xa6Tslc
 2cLE3xhnffgqLK8TLd5jEMcm+jdbLmKyFPHO+eY9NfnDZofcav8vEQIUNqJgki/4gCU1
 E2dA==
X-Gm-Message-State: AOAM533xW6NZHvblORgTVi+UUf5sTInoQcxOjNVfm0Yo5qbvR+rW0cgH
 tFVsFcFxedvEJzhjYD83iBn1G011
X-Google-Smtp-Source: ABdhPJxmDt2BPQrWFZQG+1rhAw0dE5uykFEXNjbFXlY2vmKJzE9V5QU56HYJlwBocnhC50Xx9I643w==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr11995529wrr.370.1596803584342; 
 Fri, 07 Aug 2020 05:33:04 -0700 (PDT)
Received: from laptop.fritz.box ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o2sm10226410wmh.5.2020.08.07.05.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 05:33:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: stop touching bo->tbo.ttm
Date: Fri,  7 Aug 2020 14:33:02 +0200
Message-Id: <20200807123302.139759-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: michel@daenzer.net, felix.kuehling@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3QgYWxsb2NhdGVkIGFueSBtb3JlIGZvciBTRyBCT3MuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgNCArLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCmluZGV4IDkwMTVjN2I3
NmQ2MC4uMjQ3MGI5MTMwMzhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9ncHV2bS5jCkBAIC0xMjMyLDEwICsxMjMyLDggQEAgaW50IGFtZGdwdV9h
bWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgKIAkJCQlkb21haW5fc3RyaW5nKGFsbG9j
X2RvbWFpbiksIHJldCk7CiAJCWdvdG8gZXJyX2JvX2NyZWF0ZTsKIAl9Ci0JaWYgKGJvX3R5cGUg
PT0gdHRtX2JvX3R5cGVfc2cpIHsKKwlpZiAoYm9fdHlwZSA9PSB0dG1fYm9fdHlwZV9zZykKIAkJ
Ym8tPnRiby5zZyA9IHNnOwotCQliby0+dGJvLnR0bS0+c2cgPSBzZzsKLQl9CiAJYm8tPmtmZF9i
byA9ICptZW07CiAJKCptZW0pLT5ibyA9IGJvOwogCWlmICh1c2VyX2FkZHIpCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
