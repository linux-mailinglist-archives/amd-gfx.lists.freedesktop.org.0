Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FF2315B5
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 00:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30266E431;
	Tue, 28 Jul 2020 22:46:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BB46E42F
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 22:46:40 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id b14so18725529qkn.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 15:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Mm/1KNErCFnHCSM/hXOP1QjCRDdl5wr5h4cZzIotLg=;
 b=GdBSyDK98op7cRkZACXk4oKdlN4wEs9S6mJjqeXpq/BxVh/FDJ92XLUsxOp5PU/VTF
 JQsk19V1S5etbp/vn9ag1IjtlqsaygbvLn19wKX/bjaxMlDodi8P1YyeOfrlSSMUKvkg
 Qaavdo0tcDUehuNGasW1uyEZIVsx4Xi6ntDQWNdCTs7cpqGmfsFqPKNRIo1H2FNpipBG
 BKbousTsqS2FWEW2Dr85K7McdWJhoWzY742SdOv8kdqZ6eE912Fhh6gamRGr2usg18f8
 PIqosdLx/UHqCGwxrcqIidsYWhaSd+5HqYL0bRLD5oWyXoHN4M2ez5eaUuAGoFuvYKu7
 AAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Mm/1KNErCFnHCSM/hXOP1QjCRDdl5wr5h4cZzIotLg=;
 b=b/ZtCGTTeFLWl8tAsFhLTagOl5lKAbjKQrGOErFHIs6H1VhstNv4IgsqxpVde2rdoq
 PGG2Lob1cX01Ze4ocF2Ld77YzZoJ6Xncsyh90ms5S3fSESef2QEe7Kg2SIHSRtbMq9DB
 DF/VsHBwRykUQgXod26HQTrXg6KUG+qHgLClXZw81hzckHFzxs7vbQ99ibDszF39Xvu+
 f5V0vL4O+1QmpmaKRrmI8lFTf7m2Gc925L8fToeDFJU/CtqA3JTBfiTdoZxFAgQUemBc
 rmmKX8cFx4kaNCj6g1oiUIovhJVM6MfgfjfCDa+LpK98WiXDF3eNmLUag4mBtVma8sM2
 nJuw==
X-Gm-Message-State: AOAM530W4LVcODixRdIL1VFrjymyJRD8ppF0bOO+MT77wS9zIVIjb54u
 6trEfK8bhP2JzjGwBmQMISqaiWPZ
X-Google-Smtp-Source: ABdhPJzxtjWGL4Og+1FqHHST+7/zaisSsJmJEdYvUnuaW/WZEZFqF21x33oODHk0+8xiOLcaMdb8IQ==
X-Received: by 2002:a37:6d46:: with SMTP id i67mr28636467qkc.404.1595976399098; 
 Tue, 28 Jul 2020 15:46:39 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id o17sm189233qtr.13.2020.07.28.15.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:46:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/14] drm/amdgpu/gmc6: switch to using
 amdgpu_gmc_get_vbios_allocations
Date: Tue, 28 Jul 2020 18:45:59 -0400
Message-Id: <20200728224605.3919-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200728224605.3919-1-alexander.deucher@amd.com>
References: <20200728224605.3919-1-alexander.deucher@amd.com>
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

The new helper centralizes the logic in one place.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 28ddb41a78c8..95a9117e9564 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -812,9 +812,6 @@ static unsigned gmc_v6_0_get_vbios_fb_size(struct amdgpu_device *adev)
 			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
 			4);
 	}
-	/* return 0 if the pre-OS buffer uses up most of vram */
-	if ((adev->gmc.real_vram_size - size) < (8 * 1024 * 1024))
-		return 0;
 	return size;
 }
 
@@ -862,7 +859,7 @@ static int gmc_v6_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->gmc.stolen_vga_size = gmc_v6_0_get_vbios_fb_size(adev);
+	amdgpu_gmc_get_vbios_allocations(adev);
 
 	r = amdgpu_bo_init(adev);
 	if (r)
@@ -1136,6 +1133,7 @@ static const struct amdgpu_gmc_funcs gmc_v6_0_gmc_funcs = {
 	.set_prt = gmc_v6_0_set_prt,
 	.get_vm_pde = gmc_v6_0_get_vm_pde,
 	.get_vm_pte = gmc_v6_0_get_vm_pte,
+	.get_vbios_fb_size = gmc_v6_0_get_vbios_fb_size,
 };
 
 static const struct amdgpu_irq_src_funcs gmc_v6_0_irq_funcs = {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
