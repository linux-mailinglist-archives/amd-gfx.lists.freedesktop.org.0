Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C9125A5A
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Dec 2019 05:52:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12D86E072;
	Thu, 19 Dec 2019 04:52:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2EF6E072
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Dec 2019 04:52:27 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id p2so1723002qvo.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Dec 2019 20:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKOCD0LDZRAyQowWKNRbJUz3IA9RLPvkeXVUNTEqzXs=;
 b=KC9difHRtOwdfaVH5ax7A4pg/IkHCkTtD6Ur+e2NPh9omMGyglqzWE57FkMESzjwDZ
 rKZlZzZbXzAPMwWv8xDTyETjK8DhA5icjoTmN2oveczLNUgBy7KUGoRu4/pxfA5g3qMR
 hKpEaqfZGkok5JWaVTb7kqSvV7YKWm/rnQzDRj2rdkQRcwbh+Fo4nA0P7JIu8LPbmZYx
 l6gS2TyTNVj42em4Tinp9Eyhat2lExXddjzT1qNOX+eninvPPhGJRKkmwgbx30srG6yn
 7mdZhR4bMoEZHPyd6Atn0R32O0I0AYt6pme7yu5ehp2k1zu76FrqQ138ZpOKXkWh1upu
 DVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKOCD0LDZRAyQowWKNRbJUz3IA9RLPvkeXVUNTEqzXs=;
 b=Zrg9QQpEQQpLM8tm2MIR8vXC7xDnO6ARjNsaLaKL76Ifx6RTSUjL1QHBs10a/l2jCV
 EpGE1u9sGE3mTT6ta0KfkbDcUIg03v66iMjL5qHa6LTnsuVVxev1clcgwzqMgM4IvKXO
 Ez7SS1mTlS8VL22ycosi85jqBFuRgU1LJC/IlHVMzFdQ01UgkIdGzTw1ur/v1SDEfCJT
 OqLCRAPbFCJJ9AVMEPs0zd4fvtiQg4VGUd9VRCTBHJ77CukjJ/LcTftc1NyCxS9T/JZP
 ALhVSMUBSlHkIpv/UHWMyLBokQ1ieCiKoAihUmjOYVKSar6STQHpqOvBgBdOHlite2Pk
 Z/gQ==
X-Gm-Message-State: APjAAAUvQSajmWCAVz2sFXWulbUprWBDTN46ICjyEuShlicWd7pvcDcF
 LeaF2NsOZ8msqRWItyCK3sELhDp9
X-Google-Smtp-Source: APXvYqwG+7EnWG/meEi6jNc92MJoZ8rn+dpFrnBPD49Fc1lJrvnMPmaadC0CI/nei1iSSQfuIf5Vpw==
X-Received: by 2002:ad4:4182:: with SMTP id e2mr5937319qvp.187.1576731146860; 
 Wed, 18 Dec 2019 20:52:26 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id r10sm1387481qkm.23.2019.12.18.20.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 20:52:26 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/vcn2.5: Silence a compiler warning
Date: Wed, 18 Dec 2019 23:52:17 -0500
Message-Id: <20191219045217.266476-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Set r to 0 as a default value.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 3271de38cb08..4ea8e20ed15d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -250,7 +250,7 @@ static int vcn_v2_5_hw_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct amdgpu_ring *ring;
-	int i, j, r;
+	int i, j, r = 0;
 
 	if (amdgpu_sriov_vf(adev))
 		r = vcn_v2_5_sriov_start(adev);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
