Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9DC76C67E
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620E810E4EC;
	Wed,  2 Aug 2023 07:20:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com
 [115.124.28.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081DB10E4A4;
 Wed,  2 Aug 2023 06:43:46 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.5251083|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_alarm|0.0292899-0.00261234-0.968098; FP=0|0|0|0|0|-1|-1|-1;
 HT=ay29a033018047211; MF=sunran001@208suo.com; NM=1; PH=DS; RN=5; RT=5; SR=0;
 TI=SMTPD_---.U6YPSJs_1690958616; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6YPSJs_1690958616) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 14:43:38 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amdgpu: Clean up errors in ih_v6_0.c
Date: Wed,  2 Aug 2023 06:43:33 +0000
Message-Id: <20230802064333.11895-1-sunran001@208suo.com>
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

ERROR: trailing statements should be on next line
ERROR: that open brace { should be on the previous line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 980b24120080..ec0c8f8b465a 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -494,7 +494,8 @@ static int ih_v6_0_self_irq(struct amdgpu_device *adev,
 		*adev->irq.ih1.wptr_cpu = wptr;
 		schedule_work(&adev->irq.ih1_work);
 		break;
-	default: break;
+	default:
+		break;
 	}
 	return 0;
 }
@@ -759,8 +760,7 @@ static void ih_v6_0_set_interrupt_funcs(struct amdgpu_device *adev)
 	adev->irq.ih_funcs = &ih_v6_0_funcs;
 }
 
-const struct amdgpu_ip_block_version ih_v6_0_ip_block =
-{
+const struct amdgpu_ip_block_version ih_v6_0_ip_block = {
 	.type = AMD_IP_BLOCK_TYPE_IH,
 	.major = 6,
 	.minor = 0,
-- 
2.17.1

