Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C176C690
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0984610E508;
	Wed,  2 Aug 2023 07:20:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-113.mail.aliyun.com (out28-113.mail.aliyun.com
 [115.124.28.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1610E4C1;
 Wed,  2 Aug 2023 07:00:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6415508|-1; BR=01201311R811b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_alarm|0.0463943-0.0031398-0.950466;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6aC1Jc_1690959599; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6aC1Jc_1690959599) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 15:00:02 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/jpeg: Clean up errors in jpeg_v2_0.c
Date: Wed,  2 Aug 2023 06:59:58 +0000
Message-Id: <20230802065958.12449-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:20:04 +0000
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index c25d4a07350b..1c8116d75f63 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -807,8 +807,7 @@ static void jpeg_v2_0_set_irq_funcs(struct amdgpu_device *adev)
 	adev->jpeg.inst->irq.funcs = &jpeg_v2_0_irq_funcs;
 }
 
-const struct amdgpu_ip_block_version jpeg_v2_0_ip_block =
-{
+const struct amdgpu_ip_block_version jpeg_v2_0_ip_block = {
 		.type = AMD_IP_BLOCK_TYPE_JPEG,
 		.major = 2,
 		.minor = 0,
-- 
2.17.1

