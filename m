Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2D3990EB
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Jun 2021 18:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50366EDDF;
	Wed,  2 Jun 2021 16:51:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2716EDDE
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Jun 2021 16:51:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9ucG1xcAQQr2nk4mT1Anx9ExKzyW3eLOUWK84rUOYlr2vDlsEYm6yyzaVQruafK1RUKwCxySKF0BNjqp1kKteTXktVbQl09ffUO5w0kvdY0T+gVsBeRRsJkZEPrl3vU71nxcFFcIDi+h9gRfl8o7wQ+6VsvJcjjPAO13Y8bTqTU2XBEnK8INrdAnLT86iaL+6AFJXiQ1j7pWwL1gOztUGuXg+VDDhoPB8dAE5+xDthohhOs6tpNBSX5vlUaxlaPUWnyRCukde28tqu07B/4FQEQj7fCkCfcLKlPkNck8jaskeCZG7+PaVFwThDx0VzsvMC5Kp9++76aC+0L4ScKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsYp2xwAtPcViKW0wkhPHtHiNNz3r2GYjcPIVutxZ+M=;
 b=EyErAH7w3WU2SlDdSwhs2RbntC4scFOG5mprzjn9QsGZxYIvFEaN2aJWf1tdgBOV6OvBRJuv+p2qATdolK/6XjdVjbyy3nHa0i/2WtKXmW5msca46AWIjKmgfUzpr+yuyWUlWtcURxFvIdRHKfci0+LTgK0u4SManoqlC86QU3OiDYZIvROKyxAgjLmwaRyomOh4tyFa/dVM4gnXyMWuvjPufG4hLkpEVDE8iSLz1tVZZHYn2O1RdUhPEED6nM01mINmBxQl6FDXYtRJphL5C4HSSNw4YbHdkMh2I+X15ywUYjFUl6MIzi6fEY6J0aG34Zswt32uXyrVr16PBlro9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsYp2xwAtPcViKW0wkhPHtHiNNz3r2GYjcPIVutxZ+M=;
 b=hr/wipSKrXdwNiSXyIKs9nAExWtuXLSnq8cc0OK/d4O8iNoVmP1fun8fSTL40jXcrSh8w9tFgroVANIrE4urx8KqeQiJ5wDzsBjyajx4zmpXAsVI6D80s7ImKuP3mXkgJNDCVFkLOxHR+HXqHW7+L9Jrh2rlz1BP7xWb8oByGSA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2434.namprd12.prod.outlook.com (2603:10b6:207:4d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 16:51:23 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 16:51:23 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 83/89] drm/amd/display: Add DCN3.1 HWSEQ
Date: Wed,  2 Jun 2021 12:49:02 -0400
Message-Id: <20210602164908.2848791-83-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602164908.2848791-1-alexander.deucher@amd.com>
References: <20210602164908.2848791-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Wed, 2 Jun 2021 16:50:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bdc8f66-47c7-4f4e-8953-08d925e68498
X-MS-TrafficTypeDiagnostic: BL0PR12MB2434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2434BF51877D644ECA960931F73D9@BL0PR12MB2434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcWMoXjR3kq13aSkUAqoQPibRI6JWYvpATrWrmVZMgKC2ynDbKbLXqGhxzcDdlCCuiwETGBc6MuFDbBvW46JB0cX9KTSb/lwTrta0cTUsToPhAjMY/ZKR5oGjOqLTjlMQwFh+PdTev7Smcu+bR6jr3HFcJQh0BiIFfvHGSa2Mk5gDo9R1gE8EKk50PiqNeaduK0ZARe5BxiW7m6iXP8TID4SHMenQYdSPet9E5Qk1EHAq4shew1U4dRot3EKyNM94ARUx5VMMKM30BGUTCFkKqlUrEVd01dlbEb8zo3N95ync5xbRCSynRhUzgBJh5xMQYmue+9JbxiaiiorFYZ4ssrZtMdYOFvlWKo8eOLz0VfWHOTHKLPIlS5dVtkDhYwhrdybx9M5goD+hxEQXx06ZDy2zuCg0uVsBELuBM2DdBGwk9Wwun+lD4uYA45B9rC+dGqko33nSnexPmzaleQ8LtWZ+T+M6A6kb1U6WDUBBVNtKVfVznsIyQRpauAmk5Y4POiEmxYopE9vVXp5q/vUUeNhk3PcN7DxHWQvhXYlSa/NtikxZ2GoBOq0UnP32QX6wZvDjlk/BCV5cyMPmlJIXYAyArUHP94UfYBG+1d9gxCuDhyVKuskp8SKe5ABhCgPNNlMD6uMT+DDVkUHBONhUWD8ANLgphrCwKJ17MNoRxny9vQuvbBDNk4dP6yE9Qqh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(52116002)(6486002)(6916009)(66476007)(66556008)(316002)(66946007)(36756003)(54906003)(86362001)(5660300002)(16526019)(186003)(6506007)(6512007)(26005)(6666004)(83380400001)(1076003)(8676002)(30864003)(956004)(4326008)(2616005)(478600001)(38350700002)(38100700002)(2906002)(8936002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JIzdS7cswbWKpxSkYQY/w9SX67uff2R8fV1dpS5jE1x5ZIZXxhiEhPWtIMKy?=
 =?us-ascii?Q?YmTSB++uShP1jAUnfyyHMFO8JzTqwOPOOXFd8hV01QcamG3bKPo/iyU0mrI8?=
 =?us-ascii?Q?sSvDxxouZX3stAkoQ8LHfsEicNV1E4z5E7SrdreGtai9zr8HR0TQ41YVMu6x?=
 =?us-ascii?Q?qLJx2F43TdDaDxaeZlyuWmBu4k/7jdZIUq0GlUgt3CkVBjzWyzOrM3HmoeeW?=
 =?us-ascii?Q?uCTaI0mn2LrVl9Hjsi1Fh2BPyGJocfgv1kwsjog8RtNF6h/44QXQS75uCc5t?=
 =?us-ascii?Q?Y6dDUl4/bSX27FSxeNAbiQRiJNCzwSUsIwCfxe0axT6w++4pMwTqH7NBYU3w?=
 =?us-ascii?Q?K/1m3tzMssPqZ//TRKNBkVpqBCYdkflCOUj2f6DDkxGaoMDs8sJopt354HdJ?=
 =?us-ascii?Q?bW5OnUBCjatpJ1cL6Pn0+0dYp7Lmsnov4KKRCwxUoUCqls+xBZ0udEoEYJ33?=
 =?us-ascii?Q?tPGDz/iuug8bbepWgE8K+ufGo5JKQamgq54skVgAXdXTmArdRu495KOFSybg?=
 =?us-ascii?Q?3MC31yW3vCYLLFUhwcaHLsHeEJaR9fxu4I9c2Mk8IrjZG2sSiYtO4P4gF8bK?=
 =?us-ascii?Q?NRATd3YkT/Mc2xnKMmTFXy02HawaRzFOBxQIihBxkkJ3aSlhssLEaLbsRYL8?=
 =?us-ascii?Q?K1+h0Kij/QRBcRvQ+TUY7nvcSG7e9/mB9DEbuVKubQGGVrJgS6gtj+bnDHXS?=
 =?us-ascii?Q?Nvhca+lp+pmlSL4hG3yFlBLojW3TXCODulJsuwv2ZQJm8RiHKk8+lcJU71dU?=
 =?us-ascii?Q?jvobdLtEDsYescs3sZSDqlwS+TbRdCe9VquDpytEeWDJsXkR5+KhIW30znkD?=
 =?us-ascii?Q?ITjfYo9TcRfC8UF3zujFL078ZpQpXjuIySIx6Jpro0Rvu9/mI66Zxjr67XnF?=
 =?us-ascii?Q?iknr0N9K1Ys7DiVJEtQBqkuPBPxiQzJ0Hy0Q15clwAOj8PcVuMxfCd85XS4V?=
 =?us-ascii?Q?09qWSeQWKxTV3vWvl9SnC1W1E93VY9RTgooQ28kl6bNNgxkAIPOcxCATPcxt?=
 =?us-ascii?Q?noKwTqKk1Pf9iE0w0CeXmEQpurAcmGlZhp0NChex+rxeDXuHRbdBecHj7k4Z?=
 =?us-ascii?Q?RuQqBUkDPb2Y1x3ojH0BbxusietT2giREj70qpgkwrAf2vLfuciLgHX1nYMQ?=
 =?us-ascii?Q?JAC9eh8cXEt0WWXDKyD6HxsxTbYs5LJ8N2SvOSV7OOxIcDkljMJLJ45nGoZ6?=
 =?us-ascii?Q?28DSee7TnUB7rEKyE7dmmPqdY9+mTTKDBx1d8AxoZEN/4MPtWlU/GRLIPXrq?=
 =?us-ascii?Q?nAQ+rZwvvJF85L3EnXvT5/LcBJNP6VRNkZio5dcoH3PuewJZOnDHli06TO5l?=
 =?us-ascii?Q?+4UcoH48wnnP2yjYGWV0O3bO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdc8f66-47c7-4f4e-8953-08d925e68498
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 16:50:24.9330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeLnuT2eZDWNxpN5XmL9QI0mNJulDSrULLRo5l7Ey+4yEbNAuIGRHWTNhp7Ny2PMc7TjRXIW0IdxAehRZGNmVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Add DCN3.1 specific hardware sequence programming - extending off of
our existing DCN3/DCN2 support.

Extend stream hardware sequencing to include new DCCG programming.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h           |   4 +
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  21 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |  23 +
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    | 598 ++++++++++++++++++
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.h    |  56 ++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 151 +++++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_init.h |  33 +
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   4 +
 8 files changed, 888 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 699160f9d3e7..ba47979c9cb0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -444,6 +444,7 @@ struct dc_bw_validation_profile {
 
 union mem_low_power_enable_options {
 	struct {
+		bool vga: 1;
 		bool i2c: 1;
 		bool dmcu: 1;
 		bool dscl: 1;
@@ -585,6 +586,9 @@ struct dc_phy_addr_space_config {
 		uint64_t page_table_start_addr;
 		uint64_t page_table_end_addr;
 		uint64_t page_table_base_addr;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+		bool base_addr_is_mc_addr;
+#endif
 	} gart_config;
 
 	bool valid;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index 0db1bad7a93c..8817a834383a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -635,6 +635,7 @@ struct dce_hwseq_registers {
 	uint32_t HPO_TOP_CLOCK_CONTROL;
 	uint32_t ODM_MEM_PWR_CTRL3;
 	uint32_t DMU_MEM_PWR_CNTL;
+	uint32_t MMHUBBUB_MEM_PWR_CNTL;
 };
  /* set field name */
 #define HWS_SF(blk_name, reg_name, field_name, post_fix)\
@@ -875,7 +876,8 @@ struct dce_hwseq_registers {
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
 	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_UNASSIGNED_PWR_MODE, mask_sh), \
 	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_VBLANK_PWR_MODE, mask_sh), \
-	HWS_SF(, DMU_MEM_PWR_CNTL, DMCU_ERAM_MEM_PWR_FORCE, mask_sh)
+	HWS_SF(, DMU_MEM_PWR_CNTL, DMCU_ERAM_MEM_PWR_FORCE, mask_sh), \
+	HWS_SF(, MMHUBBUB_MEM_PWR_CNTL, VGA_MEM_PWR_FORCE, mask_sh)
 
 #define HWSEQ_DCN301_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
@@ -1092,7 +1094,8 @@ struct dce_hwseq_registers {
 	type AZALIA_AUDIO_DTO_MODULE; \
 	type ODM_MEM_UNASSIGNED_PWR_MODE; \
 	type ODM_MEM_VBLANK_PWR_MODE; \
-	type DMCU_ERAM_MEM_PWR_FORCE;
+	type DMCU_ERAM_MEM_PWR_FORCE; \
+	type VGA_MEM_PWR_FORCE;
 
 #define HWSEQ_DCN3_REG_FIELD_LIST(type) \
 	type HPO_HDMISTREAMCLK_GATE_DIS;
@@ -1103,11 +1106,22 @@ struct dce_hwseq_registers {
 	type PANEL_DIGON_OVRD;\
 	type PANEL_PWRSEQ_TARGET_STATE_R;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+#define HWSEQ_DCN31_REG_FIELD_LIST(type) \
+	type DOMAIN_POWER_FORCEON;\
+	type DOMAIN_POWER_GATE;\
+	type DOMAIN_PGFSM_PWR_STATUS;\
+	type HPO_HDMISTREAMCLK_G_GATE_DIS;
+
+#endif
 struct dce_hwseq_shift {
 	HWSEQ_REG_FIELD_LIST(uint8_t)
 	HWSEQ_DCN_REG_FIELD_LIST(uint8_t)
 	HWSEQ_DCN3_REG_FIELD_LIST(uint8_t)
 	HWSEQ_DCN301_REG_FIELD_LIST(uint8_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	HWSEQ_DCN31_REG_FIELD_LIST(uint8_t)
+#endif
 };
 
 struct dce_hwseq_mask {
@@ -1115,6 +1129,9 @@ struct dce_hwseq_mask {
 	HWSEQ_DCN_REG_FIELD_LIST(uint32_t)
 	HWSEQ_DCN3_REG_FIELD_LIST(uint32_t)
 	HWSEQ_DCN301_REG_FIELD_LIST(uint32_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	HWSEQ_DCN31_REG_FIELD_LIST(uint32_t)
+#endif
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index e73198738fd8..a08cd52f6ba8 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -49,6 +49,9 @@
 #include "link_encoder.h"
 #include "link_hwss.h"
 #include "dc_link_dp.h"
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+#include "dccg.h"
+#endif
 #include "clock_source.h"
 #include "clk_mgr.h"
 #include "abm.h"
@@ -2124,11 +2127,31 @@ static void dce110_setup_audio_dto(
 
 			build_audio_output(context, pipe_ctx, &audio_output);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+			/* For DCN3.1, audio to HPO FRL encoder is using audio DTBCLK DTO */
+			if (dc->res_pool->dccg && dc->res_pool->dccg->funcs->set_audio_dtbclk_dto) {
+				/* disable audio DTBCLK DTO */
+				dc->res_pool->dccg->funcs->set_audio_dtbclk_dto(
+					dc->res_pool->dccg, 0);
+
+				pipe_ctx->stream_res.audio->funcs->wall_dto_setup(
+						pipe_ctx->stream_res.audio,
+						pipe_ctx->stream->signal,
+						&audio_output.crtc_info,
+						&audio_output.pll_info);
+			} else
+				pipe_ctx->stream_res.audio->funcs->wall_dto_setup(
+					pipe_ctx->stream_res.audio,
+					pipe_ctx->stream->signal,
+					&audio_output.crtc_info,
+					&audio_output.pll_info);
+#else
 			pipe_ctx->stream_res.audio->funcs->wall_dto_setup(
 				pipe_ctx->stream_res.audio,
 				pipe_ctx->stream->signal,
 				&audio_output.crtc_info,
 				&audio_output.pll_info);
+#endif
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
new file mode 100644
index 000000000000..c0e544d7556f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -0,0 +1,598 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+
+#include "dm_services.h"
+#include "dm_helpers.h"
+#include "core_types.h"
+#include "resource.h"
+#include "dccg.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "reg_helper.h"
+#include "abm.h"
+#include "clk_mgr.h"
+#include "hubp.h"
+#include "dchubbub.h"
+#include "timing_generator.h"
+#include "opp.h"
+#include "ipp.h"
+#include "mpc.h"
+#include "mcif_wb.h"
+#include "dc_dmub_srv.h"
+#include "dcn31_hwseq.h"
+#include "link_hwss.h"
+#include "dpcd_defs.h"
+#include "dce/dmub_outbox.h"
+#include "dc_link_dp.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define CTX \
+	hws->ctx
+#define REG(reg)\
+	hws->regs->reg
+#define DC_LOGGER \
+		dc->ctx->logger
+
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hws->shifts->field_name, hws->masks->field_name
+
+void dcn31_init_hw(struct dc *dc)
+{
+	struct abm **abms = dc->res_pool->multiple_abms;
+	struct dce_hwseq *hws = dc->hwseq;
+	struct dc_bios *dcb = dc->ctx->dc_bios;
+	struct resource_pool *res_pool = dc->res_pool;
+	uint32_t backlight = MAX_BACKLIGHT_LEVEL;
+	int i, j;
+	int edp_num;
+
+	if (dc->clk_mgr && dc->clk_mgr->funcs->init_clocks)
+		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
+
+	// Initialize the dccg
+	if (res_pool->dccg->funcs->dccg_init)
+		res_pool->dccg->funcs->dccg_init(res_pool->dccg);
+
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+
+		REG_WRITE(REFCLK_CNTL, 0);
+		REG_UPDATE(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_ENABLE, 1);
+		REG_WRITE(DIO_MEM_PWR_CTRL, 0);
+
+		if (!dc->debug.disable_clock_gate) {
+			/* enable all DCN clock gating */
+			REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
+
+			REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
+
+			REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
+		}
+
+		//Enable ability to power gate / don't force power on permanently
+		if (hws->funcs.enable_power_gating_plane)
+			hws->funcs.enable_power_gating_plane(hws, true);
+
+		return;
+	}
+
+	if (!dcb->funcs->is_accelerated_mode(dcb)) {
+		hws->funcs.bios_golden_init(dc);
+		hws->funcs.disable_vga(dc->hwseq);
+	}
+
+	if (dc->debug.enable_mem_low_power.bits.dmcu) {
+		// Force ERAM to shutdown if DMCU is not enabled
+		if (dc->debug.disable_dmcu || dc->config.disable_dmcu) {
+			REG_UPDATE(DMU_MEM_PWR_CNTL, DMCU_ERAM_MEM_PWR_FORCE, 3);
+		}
+	}
+
+	// Set default OPTC memory power states
+	if (dc->debug.enable_mem_low_power.bits.optc) {
+		// Shutdown when unassigned and light sleep in VBLANK
+		REG_SET_2(ODM_MEM_PWR_CTRL3, 0, ODM_MEM_UNASSIGNED_PWR_MODE, 3, ODM_MEM_VBLANK_PWR_MODE, 1);
+	}
+
+	if (dc->debug.enable_mem_low_power.bits.vga) {
+		// Power down VGA memory
+		REG_UPDATE(MMHUBBUB_MEM_PWR_CNTL, VGA_MEM_PWR_FORCE, 1);
+	}
+
+	if (dc->ctx->dc_bios->fw_info_valid) {
+		res_pool->ref_clocks.xtalin_clock_inKhz =
+				dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency;
+
+		if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+			if (res_pool->dccg && res_pool->hubbub) {
+
+				(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
+						dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
+						&res_pool->ref_clocks.dccg_ref_clock_inKhz);
+
+				(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
+						res_pool->ref_clocks.dccg_ref_clock_inKhz,
+						&res_pool->ref_clocks.dchub_ref_clock_inKhz);
+			} else {
+				// Not all ASICs have DCCG sw component
+				res_pool->ref_clocks.dccg_ref_clock_inKhz =
+						res_pool->ref_clocks.xtalin_clock_inKhz;
+				res_pool->ref_clocks.dchub_ref_clock_inKhz =
+						res_pool->ref_clocks.xtalin_clock_inKhz;
+			}
+		}
+	} else
+		ASSERT_CRITICAL(false);
+
+	for (i = 0; i < dc->link_count; i++) {
+		/* Power up AND update implementation according to the
+		 * required signal (which may be different from the
+		 * default signal on connector).
+		 */
+		struct dc_link *link = dc->links[i];
+
+		link->link_enc->funcs->hw_init(link->link_enc);
+
+		/* Check for enabled DIG to identify enabled display */
+		if (link->link_enc->funcs->is_dig_enabled &&
+			link->link_enc->funcs->is_dig_enabled(link->link_enc))
+			link->link_status.link_active = true;
+	}
+
+	/* Power gate DSCs */
+	for (i = 0; i < res_pool->res_cap->num_dsc; i++)
+		if (hws->funcs.dsc_pg_control != NULL)
+			hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
+
+	/* we want to turn off all dp displays before doing detection */
+	if (dc->config.power_down_display_on_boot) {
+		uint8_t dpcd_power_state = '\0';
+		enum dc_status status = DC_ERROR_UNEXPECTED;
+
+		for (i = 0; i < dc->link_count; i++) {
+			if (dc->links[i]->connector_signal != SIGNAL_TYPE_DISPLAY_PORT)
+				continue;
+
+			/* if any of the displays are lit up turn them off */
+			status = core_link_read_dpcd(dc->links[i], DP_SET_POWER,
+						     &dpcd_power_state, sizeof(dpcd_power_state));
+			if (status == DC_OK && dpcd_power_state == DP_POWER_STATE_D0) {
+				/* blank dp stream before power off receiver*/
+				if (dc->links[i]->link_enc->funcs->get_dig_frontend) {
+					unsigned int fe;
+
+					fe = dc->links[i]->link_enc->funcs->get_dig_frontend(
+										dc->links[i]->link_enc);
+					if (fe == ENGINE_ID_UNKNOWN)
+						continue;
+
+					for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
+						if (fe == dc->res_pool->stream_enc[j]->id) {
+							dc->res_pool->stream_enc[j]->funcs->dp_blank(
+										dc->res_pool->stream_enc[j]);
+							break;
+						}
+					}
+				}
+				dp_receiver_power_ctrl(dc->links[i], false);
+			}
+		}
+	}
+
+	/* If taking control over from VBIOS, we may want to optimize our first
+	 * mode set, so we need to skip powering down pipes until we know which
+	 * pipes we want to use.
+	 * Otherwise, if taking control is not possible, we need to power
+	 * everything down.
+	 */
+	if (dcb->funcs->is_accelerated_mode(dcb) || dc->config.power_down_display_on_boot) {
+		hws->funcs.init_pipes(dc, dc->current_state);
+		if (dc->res_pool->hubbub->funcs->allow_self_refresh_control)
+			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub,
+					!dc->res_pool->hubbub->ctx->dc->debug.disable_stutter);
+	}
+
+	/* In headless boot cases, DIG may be turned
+	 * on which causes HW/SW discrepancies.
+	 * To avoid this, power down hardware on boot
+	 * if DIG is turned on and seamless boot not enabled
+	 */
+	if (dc->config.power_down_display_on_boot) {
+		struct dc_link *edp_links[MAX_NUM_EDP];
+		struct dc_link *edp_link;
+
+		get_edp_links(dc, edp_links, &edp_num);
+		if (edp_num) {
+			for (i = 0; i < edp_num; i++) {
+				edp_link = edp_links[i];
+				if (edp_link->link_enc->funcs->is_dig_enabled &&
+						edp_link->link_enc->funcs->is_dig_enabled(edp_link->link_enc) &&
+						dc->hwss.edp_backlight_control &&
+						dc->hwss.power_down &&
+						dc->hwss.edp_power_control) {
+					dc->hwss.edp_backlight_control(edp_link, false);
+					dc->hwss.power_down(dc);
+					dc->hwss.edp_power_control(edp_link, false);
+				}
+			}
+		} else {
+			for (i = 0; i < dc->link_count; i++) {
+				struct dc_link *link = dc->links[i];
+
+				if (link->link_enc->funcs->is_dig_enabled &&
+						link->link_enc->funcs->is_dig_enabled(link->link_enc) &&
+						dc->hwss.power_down) {
+					dc->hwss.power_down(dc);
+					break;
+				}
+
+			}
+		}
+	}
+
+	for (i = 0; i < res_pool->audio_count; i++) {
+		struct audio *audio = res_pool->audios[i];
+
+		audio->funcs->hw_init(audio);
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		struct dc_link *link = dc->links[i];
+
+		if (link->panel_cntl)
+			backlight = link->panel_cntl->funcs->hw_init(link->panel_cntl);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (abms[i] != NULL)
+			abms[i]->funcs->abm_init(abms[i], backlight);
+	}
+
+	/* power AFMT HDMI memory TODO: may move to dis/en output save power*/
+	REG_WRITE(DIO_MEM_PWR_CTRL, 0);
+
+	if (!dc->debug.disable_clock_gate) {
+		/* enable all DCN clock gating */
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
+
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
+
+		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
+	}
+	if (hws->funcs.enable_power_gating_plane)
+		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
+	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
+		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
+
+	if (dc->clk_mgr->funcs->notify_wm_ranges)
+		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
+
+	if (dc->clk_mgr->funcs->set_hard_max_memclk)
+		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+
+	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+		dc->res_pool->hubbub->funcs->force_pstate_change_control(
+				dc->res_pool->hubbub, false, false);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	if (dc->res_pool->hubbub->funcs->init_crb)
+		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
+#endif
+}
+
+void dcn31_dsc_pg_control(
+		struct dce_hwseq *hws,
+		unsigned int dsc_inst,
+		bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+	uint32_t org_ip_request_cntl = 0;
+
+	if (hws->ctx->dc->debug.disable_dsc_power_gate)
+		return;
+
+	REG_GET(DC_IP_REQUEST_CNTL, IP_REQUEST_EN, &org_ip_request_cntl);
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 1);
+
+	switch (dsc_inst) {
+	case 0: /* DSC0 */
+		REG_UPDATE(DOMAIN16_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN16_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 1: /* DSC1 */
+		REG_UPDATE(DOMAIN17_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN17_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 2: /* DSC2 */
+		REG_UPDATE(DOMAIN18_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN18_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 0);
+}
+
+
+void dcn31_enable_power_gating_plane(
+	struct dce_hwseq *hws,
+	bool enable)
+{
+	bool force_on = true; /* disable power gating */
+
+	if (enable)
+		force_on = false;
+
+	/* DCHUBP0/1/2/3/4/5 */
+	REG_UPDATE(DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+
+	/* DPP0/1/2/3/4/5 */
+	REG_UPDATE(DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+
+	/* DCS0/1/2/3/4/5 */
+	REG_UPDATE(DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+}
+
+void dcn31_update_info_frame(struct pipe_ctx *pipe_ctx)
+{
+	bool is_hdmi_tmds;
+	bool is_dp;
+
+	ASSERT(pipe_ctx->stream);
+
+	if (pipe_ctx->stream_res.stream_enc == NULL)
+		return;  /* this is not root pipe */
+
+	is_hdmi_tmds = dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal);
+	is_dp = dc_is_dp_signal(pipe_ctx->stream->signal);
+
+	if (!is_hdmi_tmds)
+		return;
+
+	if (is_hdmi_tmds)
+		pipe_ctx->stream_res.stream_enc->funcs->update_hdmi_info_packets(
+			pipe_ctx->stream_res.stream_enc,
+			&pipe_ctx->stream_res.encoder_info_frame);
+	else {
+		pipe_ctx->stream_res.stream_enc->funcs->update_dp_info_packets(
+			pipe_ctx->stream_res.stream_enc,
+			&pipe_ctx->stream_res.encoder_info_frame);
+	}
+}
+
+void dcn31_z10_restore(struct dc *dc)
+{
+	union dmub_rb_cmd cmd;
+
+	/*
+	 * DMUB notifies whether restore is required.
+	 * Optimization to avoid sending commands when not required.
+	 */
+	if (!dc_dmub_srv_is_restore_required(dc->ctx->dmub_srv))
+		return;
+
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.dcn_restore.header.type = DMUB_CMD__IDLE_OPT;
+	cmd.dcn_restore.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_RESTORE;
+
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+}
+
+void dcn31_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+
+	if (hws->ctx->dc->debug.disable_hubp_power_gate)
+		return;
+
+	if (REG(DOMAIN0_PG_CONFIG) == 0)
+		return;
+
+	switch (hubp_inst) {
+	case 0:
+		REG_SET(DOMAIN0_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 1:
+		REG_SET(DOMAIN1_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 2:
+		REG_SET(DOMAIN2_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 3:
+		REG_SET(DOMAIN3_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+}
+
+int dcn31_init_sys_ctx(struct dce_hwseq *hws, struct dc *dc, struct dc_phy_addr_space_config *pa_config)
+{
+	struct dcn_hubbub_phys_addr_config config;
+
+	config.system_aperture.fb_top = pa_config->system_aperture.fb_top;
+	config.system_aperture.fb_offset = pa_config->system_aperture.fb_offset;
+	config.system_aperture.fb_base = pa_config->system_aperture.fb_base;
+	config.system_aperture.agp_top = pa_config->system_aperture.agp_top;
+	config.system_aperture.agp_bot = pa_config->system_aperture.agp_bot;
+	config.system_aperture.agp_base = pa_config->system_aperture.agp_base;
+	config.gart_config.page_table_start_addr = pa_config->gart_config.page_table_start_addr;
+	config.gart_config.page_table_end_addr = pa_config->gart_config.page_table_end_addr;
+
+	if (pa_config->gart_config.base_addr_is_mc_addr) {
+		/* Convert from MC address to offset into FB */
+		config.gart_config.page_table_base_addr = pa_config->gart_config.page_table_base_addr -
+				pa_config->system_aperture.fb_base +
+				pa_config->system_aperture.fb_offset;
+	} else
+		config.gart_config.page_table_base_addr = pa_config->gart_config.page_table_base_addr;
+
+	return dc->res_pool->hubbub->funcs->init_dchub_sys_ctx(dc->res_pool->hubbub, &config);
+}
+
+static void dcn31_reset_back_end_for_pipe(
+		struct dc *dc,
+		struct pipe_ctx *pipe_ctx,
+		struct dc_state *context)
+{
+	struct dc_link *link;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+	if (pipe_ctx->stream_res.stream_enc == NULL) {
+		pipe_ctx->stream = NULL;
+		return;
+	}
+	ASSERT(!pipe_ctx->top_pipe);
+
+	dc->hwss.set_abm_immediate_disable(pipe_ctx);
+
+	pipe_ctx->stream_res.tg->funcs->set_dsc_config(
+			pipe_ctx->stream_res.tg,
+			OPTC_DSC_DISABLED, 0, 0);
+	pipe_ctx->stream_res.tg->funcs->disable_crtc(pipe_ctx->stream_res.tg);
+
+	pipe_ctx->stream_res.tg->funcs->enable_optc_clock(pipe_ctx->stream_res.tg, false);
+	if (pipe_ctx->stream_res.tg->funcs->set_odm_bypass)
+		pipe_ctx->stream_res.tg->funcs->set_odm_bypass(
+				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing);
+
+	if (pipe_ctx->stream_res.tg->funcs->set_drr)
+		pipe_ctx->stream_res.tg->funcs->set_drr(
+				pipe_ctx->stream_res.tg, NULL);
+
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		link = pipe_ctx->stream->link;
+		/* DPMS may already disable or */
+		/* dpms_off status is incorrect due to fastboot
+		 * feature. When system resume from S4 with second
+		 * screen only, the dpms_off would be true but
+		 * VBIOS lit up eDP, so check link status too.
+		 */
+		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
+			core_link_disable_stream(pipe_ctx);
+		else if (pipe_ctx->stream_res.audio)
+			dc->hwss.disable_audio_stream(pipe_ctx);
+
+		/* free acquired resources */
+		if (pipe_ctx->stream_res.audio) {
+			/*disable az_endpoint*/
+			pipe_ctx->stream_res.audio->funcs->az_disable(pipe_ctx->stream_res.audio);
+
+			/*free audio*/
+			if (dc->caps.dynamic_audio == true) {
+				/*we have to dynamic arbitrate the audio endpoints*/
+				/*we free the resource, need reset is_audio_acquired*/
+				update_audio_usage(&dc->current_state->res_ctx, dc->res_pool,
+						pipe_ctx->stream_res.audio, false);
+				pipe_ctx->stream_res.audio = NULL;
+			}
+		}
+	} else if (pipe_ctx->stream_res.dsc) {
+			dp_set_dsc_enable(pipe_ctx, false);
+	}
+
+	pipe_ctx->stream = NULL;
+	DC_LOG_DEBUG("Reset back end for pipe %d, tg:%d\n",
+					pipe_ctx->pipe_idx, pipe_ctx->stream_res.tg->inst);
+}
+
+void dcn31_reset_hw_ctx_wrap(
+		struct dc *dc,
+		struct dc_state *context)
+{
+	int i;
+	struct dce_hwseq *hws = dc->hwseq;
+
+	/* Reset Back End*/
+	for (i = dc->res_pool->pipe_count - 1; i >= 0 ; i--) {
+		struct pipe_ctx *pipe_ctx_old =
+			&dc->current_state->res_ctx.pipe_ctx[i];
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe_ctx_old->stream)
+			continue;
+
+		if (pipe_ctx_old->top_pipe || pipe_ctx_old->prev_odm_pipe)
+			continue;
+
+		if (!pipe_ctx->stream ||
+				pipe_need_reprogram(pipe_ctx_old, pipe_ctx)) {
+			struct clock_source *old_clk = pipe_ctx_old->clock_source;
+
+			dcn31_reset_back_end_for_pipe(dc, pipe_ctx_old, dc->current_state);
+			if (hws->funcs.enable_stream_gating)
+				hws->funcs.enable_stream_gating(dc, pipe_ctx);
+			if (old_clk)
+				old_clk->funcs->cs_power_down(old_clk);
+		}
+	}
+}
+
+bool dcn31_is_abm_supported(struct dc *dc,
+		struct dc_state *context, struct dc_stream_state *stream)
+{
+	int i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe_ctx->stream == stream &&
+				(pipe_ctx->prev_odm_pipe == NULL && pipe_ctx->next_odm_pipe == NULL))
+			return true;
+	}
+	return false;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h
new file mode 100644
index 000000000000..ff72f0fdd5be
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.h
@@ -0,0 +1,56 @@
+/*
+* Copyright 2016 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HWSS_DCN31_H__
+#define __DC_HWSS_DCN31_H__
+
+#include "hw_sequencer_private.h"
+
+struct dc;
+
+void dcn31_init_hw(struct dc *dc);
+
+void dcn31_dsc_pg_control(
+		struct dce_hwseq *hws,
+		unsigned int dsc_inst,
+		bool power_on);
+
+void dcn31_enable_power_gating_plane(
+	struct dce_hwseq *hws,
+	bool enable);
+
+void dcn31_update_info_frame(struct pipe_ctx *pipe_ctx);
+
+void dcn31_z10_restore(struct dc *dc);
+
+void dcn31_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on);
+int dcn31_init_sys_ctx(struct dce_hwseq *hws, struct dc *dc, struct dc_phy_addr_space_config *pa_config);
+void dcn31_reset_hw_ctx_wrap(
+		struct dc *dc,
+		struct dc_state *context);
+bool dcn31_is_abm_supported(struct dc *dc,
+		struct dc_state *context, struct dc_stream_state *stream);
+
+#endif /* __DC_HWSS_DCN31_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
new file mode 100644
index 000000000000..69da1493b277
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
@@ -0,0 +1,151 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn10/dcn10_hw_sequencer.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn21/dcn21_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dcn301/dcn301_hwseq.h"
+#include "dcn31/dcn31_hwseq.h"
+
+static const struct hw_sequencer_funcs dcn31_funcs = {
+	.program_gamut_remap = dcn10_program_gamut_remap,
+	.init_hw = dcn31_init_hw,
+	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
+	.apply_ctx_for_surface = NULL,
+	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
+	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
+	.post_unlock_program_front_end = dcn20_post_unlock_program_front_end,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.update_dchub = dcn10_update_dchub,
+	.update_pending_status = dcn10_update_pending_status,
+	.program_output_csc = dcn20_program_output_csc,
+	.enable_accelerated_mode = dce110_enable_accelerated_mode,
+	.enable_timing_synchronization = dcn10_enable_timing_synchronization,
+	.enable_per_frame_crtc_position_reset = dcn10_enable_per_frame_crtc_position_reset,
+	.update_info_frame = dcn31_update_info_frame,
+	.send_immediate_sdp_message = dcn10_send_immediate_sdp_message,
+	.enable_stream = dcn20_enable_stream,
+	.disable_stream = dce110_disable_stream,
+	.unblank_stream = dcn20_unblank_stream,
+	.blank_stream = dce110_blank_stream,
+	.enable_audio_stream = dce110_enable_audio_stream,
+	.disable_audio_stream = dce110_disable_audio_stream,
+	.disable_plane = dcn20_disable_plane,
+	.pipe_control_lock = dcn20_pipe_control_lock,
+	.interdependent_update_lock = dcn10_lock_all_pipes,
+	.cursor_lock = dcn10_cursor_lock,
+	.prepare_bandwidth = dcn20_prepare_bandwidth,
+	.optimize_bandwidth = dcn20_optimize_bandwidth,
+	.update_bandwidth = dcn20_update_bandwidth,
+	.set_drr = dcn10_set_drr,
+	.get_position = dcn10_get_position,
+	.set_static_screen_control = dcn10_set_static_screen_control,
+	.setup_stereo = dcn10_setup_stereo,
+	.set_avmute = dcn30_set_avmute,
+	.log_hw_state = dcn10_log_hw_state,
+	.get_hw_state = dcn10_get_hw_state,
+	.clear_status_bits = dcn10_clear_status_bits,
+	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
+	.edp_backlight_control = dce110_edp_backlight_control,
+	.edp_power_control = dce110_edp_power_control,
+	.edp_wait_for_T12 = dce110_edp_wait_for_T12,
+	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
+	.set_cursor_position = dcn10_set_cursor_position,
+	.set_cursor_attribute = dcn10_set_cursor_attribute,
+	.set_cursor_sdr_white_level = dcn10_set_cursor_sdr_white_level,
+	.setup_periodic_interrupt = dcn10_setup_periodic_interrupt,
+	.set_clock = dcn10_set_clock,
+	.get_clock = dcn10_get_clock,
+	.program_triplebuffer = dcn20_program_triple_buffer,
+	.enable_writeback = dcn30_enable_writeback,
+	.disable_writeback = dcn30_disable_writeback,
+	.update_writeback = dcn30_update_writeback,
+	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
+	.dmdata_status_done = dcn20_dmdata_status_done,
+	.program_dmdata_engine = dcn30_program_dmdata_engine,
+	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
+	.init_sys_ctx = dcn31_init_sys_ctx,
+	.init_vm_ctx = dcn20_init_vm_ctx,
+	.set_flip_control_gsl = dcn20_set_flip_control_gsl,
+	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
+	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.apply_idle_power_optimizations = dcn30_apply_idle_power_optimizations,
+	.set_backlight_level = dcn21_set_backlight_level,
+	.set_abm_immediate_disable = dcn21_set_abm_immediate_disable,
+	.set_pipe = dcn21_set_pipe,
+	.z10_restore = dcn31_z10_restore,
+	.is_abm_supported = dcn31_is_abm_supported,
+	.set_disp_pattern_generator = dcn30_set_disp_pattern_generator,
+};
+
+static const struct hwseq_private_funcs dcn31_private_funcs = {
+	.init_pipes = dcn10_init_pipes,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.plane_atomic_disconnect = dcn10_plane_atomic_disconnect,
+	.update_mpcc = dcn20_update_mpcc,
+	.set_input_transfer_func = dcn30_set_input_transfer_func,
+	.set_output_transfer_func = dcn30_set_output_transfer_func,
+	.power_down = dce110_power_down,
+	.enable_display_power_gating = dcn10_dummy_display_power_gating,
+	.blank_pixel_data = dcn20_blank_pixel_data,
+	.reset_hw_ctx_wrap = dcn31_reset_hw_ctx_wrap,
+	.enable_stream_timing = dcn20_enable_stream_timing,
+	.edp_backlight_control = dce110_edp_backlight_control,
+	.disable_stream_gating = dcn20_disable_stream_gating,
+	.enable_stream_gating = dcn20_enable_stream_gating,
+	.setup_vupdate_interrupt = dcn20_setup_vupdate_interrupt,
+	.did_underflow_occur = dcn10_did_underflow_occur,
+	.init_blank = dcn20_init_blank,
+	.disable_vga = dcn20_disable_vga,
+	.bios_golden_init = dcn10_bios_golden_init,
+	.plane_atomic_disable = dcn20_plane_atomic_disable,
+	.plane_atomic_power_down = dcn10_plane_atomic_power_down,
+	.enable_power_gating_plane = dcn31_enable_power_gating_plane,
+	.hubp_pg_control = dcn31_hubp_pg_control,
+	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
+	.update_odm = dcn20_update_odm,
+	.dsc_pg_control = dcn31_dsc_pg_control,
+	.get_surface_visual_confirm_color = dcn10_get_surface_visual_confirm_color,
+	.get_hdr_visual_confirm_color = dcn10_get_hdr_visual_confirm_color,
+	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
+	.verify_allow_pstate_change_high = dcn10_verify_allow_pstate_change_high,
+	.wait_for_blank_complete = dcn20_wait_for_blank_complete,
+	.dccg_init = dcn20_dccg_init,
+	.set_blend_lut = dcn30_set_blend_lut,
+	.set_shaper_3dlut = dcn20_set_shaper_3dlut,
+};
+
+void dcn31_hw_sequencer_construct(struct dc *dc)
+{
+	dc->hwss = dcn31_funcs;
+	dc->hwseq->funcs = dcn31_private_funcs;
+
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		dc->hwss.init_hw = dcn20_fpga_init_hw;
+		dc->hwseq->funcs.init_pipes = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h
new file mode 100644
index 000000000000..a3db08c8bd35
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_DCN31_INIT_H__
+#define __DC_DCN31_INIT_H__
+
+struct dc;
+
+void dcn31_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_DCN31_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 1d5853c95448..bb03502d8f6b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -235,6 +235,10 @@ struct hw_sequencer_funcs {
 			enum dc_color_depth color_depth,
 			const struct tg_color *solid_color,
 			int width, int height, int offset);
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	void (*z10_restore)(struct dc *dc);
+#endif
 };
 
 void color_space_to_black_color(
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
