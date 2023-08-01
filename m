Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A376C66A
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227B10E4DD;
	Wed,  2 Aug 2023 07:20:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com
 [115.124.28.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771AB10E37A;
 Tue,  1 Aug 2023 09:37:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4581243|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00723545-0.000549839-0.992215;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.U5rVQNr_1690882617; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U5rVQNr_1690882617) by smtp.aliyun-inc.com;
 Tue, 01 Aug 2023 17:36:59 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm/powerplay/hwmgr/hwmgr: Clean up errors in hwmgr.c
Date: Tue,  1 Aug 2023 09:36:56 +0000
Message-Id: <20230801093656.7761-1-sunran001@208suo.com>
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

ERROR: space prohibited after that '~' (ctx:WxW)
ERROR: spaces required around that '||' (ctx:VxW)

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
index f2cef0930aa9..2b5ac21fee39 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/hwmgr.c
@@ -120,7 +120,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
 		case CHIP_TOPAZ:
 			hwmgr->smumgr_funcs = &iceland_smu_funcs;
 			topaz_set_asic_special_caps(hwmgr);
-			hwmgr->feature_mask &= ~ (PP_VBI_TIME_SUPPORT_MASK |
+			hwmgr->feature_mask &= ~(PP_VBI_TIME_SUPPORT_MASK |
 						PP_ENABLE_GFX_CG_THRU_SMU);
 			hwmgr->pp_table_version = PP_TABLE_V0;
 			hwmgr->od_enabled = false;
@@ -133,7 +133,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
 		case CHIP_FIJI:
 			hwmgr->smumgr_funcs = &fiji_smu_funcs;
 			fiji_set_asic_special_caps(hwmgr);
-			hwmgr->feature_mask &= ~ (PP_VBI_TIME_SUPPORT_MASK |
+			hwmgr->feature_mask &= ~(PP_VBI_TIME_SUPPORT_MASK |
 						PP_ENABLE_GFX_CG_THRU_SMU);
 			break;
 		case CHIP_POLARIS11:
@@ -195,7 +195,7 @@ int hwmgr_early_init(struct pp_hwmgr *hwmgr)
 
 int hwmgr_sw_init(struct pp_hwmgr *hwmgr)
 {
-	if (!hwmgr|| !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->smu_init)
+	if (!hwmgr || !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->smu_init)
 		return -EINVAL;
 
 	phm_register_irq_handlers(hwmgr);
-- 
2.17.1

