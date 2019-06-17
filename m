Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FFD48F27
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 21:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4E389306;
	Mon, 17 Jun 2019 19:31:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A2089306
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 19:31:14 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id s15so12210908qtk.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Jun 2019 12:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OI5BGlOMLYuk/5HLkPNDZkUpUj321H65zwaGB0SogUM=;
 b=blTJOpImNSw7X9lDU906xKzE+VxpxqX4K3TqCKtmWoKXytNnHLskRJEqZJa4W8N/nk
 LXrzgFgZrrCRBmLk5bf1r0XMRH28MigUeaA43z3HiJKWKgF9X2etnIfLgS5l6Ow9xtSb
 7QRnEf7kmoVR8BNXCrkva1+2jDz6kisXpvwo2uf05/g3anJa8gb5ZY/3Qvk4S/hMC+Ol
 wSVPmDEbO/TzU0dJLp4mg3CjeVMukBVsSu4lJbw49rVcHMXbgwUrjURJWTOnyWOvdUkG
 9VpdeJ2zmcUVUtmZM4t1IzsJ62MV9K8yN9irma1vsHceYqh81FQUIZ+noe5LhlTX/0fd
 T/xA==
X-Gm-Message-State: APjAAAWI8ZSwgTmqt7ixQg5b5HkRQ686iIJtucD9Y4m6jrii+SBJGCNw
 svutdCqNifU7jFRUrA5EfjLw/JDPvnI=
X-Google-Smtp-Source: APXvYqybpp4ZNqC69vqr3ECK0mqkhJDlHjCU/ydOxdqPicHO0r3bOQCsvwmluhJvbNpHK7d1wtCJZg==
X-Received: by 2002:a0c:89f3:: with SMTP id 48mr23303447qvs.68.1560799873831; 
 Mon, 17 Jun 2019 12:31:13 -0700 (PDT)
Received: from localhost.localdomain ([71.219.5.136])
 by smtp.gmail.com with ESMTPSA id u2sm7474875qtj.97.2019.06.17.12.31.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 12:31:13 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 200/459] drm/amdgpu/nv: set vcn pg flag
Date: Mon, 17 Jun 2019 14:29:27 -0500
Message-Id: <20190617193106.18231-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OI5BGlOMLYuk/5HLkPNDZkUpUj321H65zwaGB0SogUM=;
 b=DYEIVBQSE7QGJu1xQ0UfjTdc2oOc3PVi9bg0Tn7ILmFIrXWHCUdi3xI40PtdvZfmrL
 q4x1SDjY6Dbeu29+165D4JMH3vvHzPADMIh/Jd8jjSswMSjBjy+7fyWuW1f4G7Dja+zl
 ATxHDPpEj1rLfl8dsM91dUaopzXH6b36plW3mw66iGF6loLkQ74F6rtj7Aso+g9bJRV+
 hzrzLkUuZUyCdEznVyfmEIMLb4x6kAHntxilMBMe0gDx4EN+7Ybd4+RbNxzoUr+6r0UZ
 PYuHnBu3bBGQR/zhYlzVISh9NzGkadgvSPlkZF455s/0AhEXKvkmB0kH3dFH7CMUEmzm
 uTiw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSmFjayBYaWFvIDxKYWNrLlhpYW9AYW1kLmNvbT4KCkVuYWJsZSBWQ04gcG93ZXIgZ2F0
aW5nIGJ5IGRlZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBKYWNrIFhpYW8gPEphY2suWGlhb0BhbWQu
Y29tPgpSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9udi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbnYuYwppbmRleCA1ZjAw
ZWVmMWJlMmEuLmQxZjg3NTdhYmJlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvbnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9udi5jCkBAIC01MDUs
NyArNTA1LDcgQEAgc3RhdGljIGludCBudl9jb21tb25fZWFybHlfaW5pdCh2b2lkICpoYW5kbGUp
CiAJCQlBTURfQ0dfU1VQUE9SVF9WQ05fTUdDRyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9CSUZfTUdD
RyB8CiAJCQlBTURfQ0dfU1VQUE9SVF9CSUZfTFM7Ci0JCWFkZXYtPnBnX2ZsYWdzID0gMDsKKwkJ
YWRldi0+cGdfZmxhZ3MgPSBBTURfUEdfU1VQUE9SVF9WQ047CiAJCWFkZXYtPmV4dGVybmFsX3Jl
dl9pZCA9IGFkZXYtPnJldl9pZCArIDB4MTsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
