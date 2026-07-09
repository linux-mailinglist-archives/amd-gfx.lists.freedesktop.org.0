Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4waMkAMUGrlsQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 23:01:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ADE735A22
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Jul 2026 23:01:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=II6dXyKM;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7C710F695;
	Thu,  9 Jul 2026 21:01:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5436B10F6A1
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2026 21:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEKT9PmDExPipI2Ch99kCnWFwqYp7QxKjZ4rxQmMrnGy6QFtTY/wHZ5Ggz9R/LvtgyTg+QgA1GJvIrcbmCmzjLQDVn0E35D62wjSfH4jOuzsk6gtalFgPPJShGe3AcUyi5cHh1dcV3qGGEjV0VbDmgxvpicKMo8akqNmxI9URwuwI976ljTZ40DHEtSWgs+NrAOwUKpDbxGCwi+/Zs9x4EZ0MxYDlRGb/w9pVyNDBILX07JNrYz4V+HzpAIehfM8Q2gV7KJ/9DefXT7fPBvjeD0xmkbpRA7c5Lpw2sz+iPRSNBCy8YadsP+M6D4WECb2aXr2x/vE5mRG+8zljNs8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9tO9ftMono+uoOePb4BDu4hGnCRZa1KgwO09Z2c1TQ=;
 b=Qm+qAyhvC6RCmLkzhr3601FTKS2ZcmW82Asox/wmjenQkbV3T1aTvprnHuFeAW1NNjnr8eKBuxDr/lCxypEyaCm/Z4ESFEwIcBCcDTHIYKSlFmb7NcJZjzPOtVn4BwGJEEKmjgJToYXqhK8BWDYwvH4wjziDV5A925SSF567KuHJEU6UMKP3h7brO66yL8nlhRhcrl+TwwKJHLoFQJP/ZpFtKK5Ub2vDD1CwQSzQyU+pa5+9Jk3rt5mbZjA78YleX22jCzZGKvPmBuF/IZpqFWG2Haf84YwDGyfpsqZhb0lYTmRiH6jCOQggr22yeELLEkRc5/IJgm1nSu4r6aYE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9tO9ftMono+uoOePb4BDu4hGnCRZa1KgwO09Z2c1TQ=;
 b=II6dXyKMiI2Re1TSmcUKDJ5r0f9GjfzoYaw5zvXC7mtKKd3ODBjeO3C95qyFGcJkSuz/HWL2uNMwMpceRWEeg/xlQjtOD5U0UBNG8jvimIzvUpQVyyeQOPhvUZCZ58MYkIqyKmZzODtgYoJyrCDFc+28Ec947IUFDqVJgAmzOh8=
Received: from PH8P223CA0008.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::7)
 by DS7PR12MB8322.namprd12.prod.outlook.com (2603:10b6:8:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 21:01:47 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:510:2db:cafe::1b) by PH8P223CA0008.outlook.office365.com
 (2603:10b6:510:2db::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:01:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:01:46 +0000
Received: from georzhanmkm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 16:01:38 -0500
From: George Zhang <george.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Gabe Teeger <gabe.teeger@amd.com>, "Ovidiu (Ovi)
 Bunea" <ovidiu.bunea@amd.com>, Matthew Stewart <matthew.stewart2@amd.com>,
 George Zhang <george.zhang@amd.com>
Subject: [PATCH 07/80] drm/amd/display: Enable zstate support and fix seamless
 boot
Date: Thu, 9 Jul 2026 16:47:35 -0400
Message-ID: <20260709205936.5719-8-george.zhang@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709205936.5719-1-george.zhang@amd.com>
References: <20260709205936.5719-1-george.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DS7PR12MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d55b62-e313-4d5d-e671-08deddfd49a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: v2tBMa83VujEq9kC4dxwO7xY28svPXRbbmr6X9haFfsUFucXnpvbMftzn2Er/njM+zmB33iTxWxKdl7Fr7TVniHHd6Pvs4pAIs4Z0ug7xYixW83A67SArpbSxUWa91DpxzXWksrS2I9wPP9CEyeN4cxiWvY7WizGjPNdSGtfNfwADh/qKQswGjf6QDrz+Dfuc2j2RESJucocpblgdjPvvKb3V+ZncNY5lWKJsm/XLdLhLw21uKj3i4w6OGQoHSCH7rodM1unuKca+y792Lo44ccx1j0dGrjQrPWA19A7AuPfGQzindVz5ZRkyjQRKCnRSvSrrQc9m7d/UqseqwsWbYhjVD+3POrTB46aYAMMX4UuyK8U6Dfr9JNmEhTicljbnY63v+E5YZ7NSDptOwTHrHyVVqQb5dJLsgz3qGH1n6KXLwzO4eCzm3GbDz1TU4fJCZRFc7jGhGpDGPa2fBnP64wuhZU95LM5TlOa0PK21y0DyhYPCNREwt4DPxVx4bMlzm6CftPUza/cNidUXF2QNHAQkWnJuCPs5RbXpu5EzwwGlm602W91gynSuJgK1sspdQoiv3vVXpgZSO165lN2lJ2yHlkm6iI4Rgb/Uxxbkmnpa6tFuQgbEc3YDhTpW/BeJiJzoMjRCBf4T5mESn2ataYmnhFShkG4CUBkuSWjVG7xSoCLzxeFZwHVRWPZVAT+jySz+gs5AKS7uIxjFXdWdw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yINnCzIul6yuqukY8BuPHuY6BHUQBqHVd9APgoPO4zLo8VdjuVObA27aPWJG0byPkxW1tF5ESyIUMY0+2Im3KT67TP6l1U3n6blbKF5XGvCMgIAC0MYDlzD7wXtuZHb1jXAgfSjEKS1xbM9jVekeJ+riLbmCFechMRWwVgDD2VtTahrGpwjL0KlDlzOi31/GR8E8+kHGm34wDxJzINygoklxxmxldK0U896W0p+COCzpfB3NQtY1HcvMWeYDt37Z65TYNJfbDnxgvwOQMCjy7XF/TKJQfHENI/bwpQXtgqiekTo1ars0eFYxJdTaBQ0AdCNY5uia3rBolRDSMZys42VNvwRS0ayabxCvmQumLKDkJtwRNsbxOBFaDWmjBr+C6Bcv7fSxtTorH4TUIJZ3cNqv2/fc4B96U8f/kyYKWgKsfS2NqyyxRIJG/mNyJ6cX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:01:46.4577 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d55b62-e313-4d5d-e671-08deddfd49a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8322
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[george.zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61ADE735A22

From: Gabe Teeger <gabe.teeger@amd.com>

[Why & How]
Port seamless boot fix from DCN42 to DCN42B and enable zstate
support for DCN42B.

Reviewed-by: Ovidiu (Ovi) Bunea <ovidiu.bunea@amd.com>
Signed-off-by: Gabe Teeger <gabe.teeger@amd.com>
Signed-off-by: Matthew Stewart <matthew.stewart2@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 .../drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c  | 8 ++++----
 .../drm/amd/display/dc/resource/dcn42b/dcn42b_resource.h  | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c
index 18a7fd9136af..172836dfd679 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.c
@@ -253,10 +253,10 @@ static struct bios_registers bios_regs;
 static struct dce110_clk_src_regs clk_src_regs[5];

 static const struct dce110_clk_src_shift cs_shift = {
-	CS_COMMON_MASK_SH_LIST_DCN3_2(__SHIFT)
+	CS_COMMON_MASK_SH_LIST_DCN4_0_1(__SHIFT)
 };
 static const struct dce110_clk_src_mask cs_mask = {
-	CS_COMMON_MASK_SH_LIST_DCN3_2(_MASK)
+	CS_COMMON_MASK_SH_LIST_DCN4_0_1(_MASK)
 };
 #define abm_regs_init(id) \
 	ABM_DCN42B_REG_LIST_RI(id)
@@ -801,7 +801,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 		}
 	},
 	.seamless_boot_odm_combine = DML_FAIL_SOURCE_PIXEL_FORMAT,
-	.enable_z9_disable_interface = false, /* Allow support for the PMFW interface for disable Z9*/
+	.enable_z9_disable_interface = true, /* Allow support for the PMFW interface for disable Z9*/
 	.minimum_z8_residency_time = 1, /* Always allow when other conditions are met */
 	.support_eDP1_5 = true,
 	.use_max_lb = true,
@@ -823,7 +823,7 @@ static const struct dc_debug_options debug_defaults_drv = {
 	.disable_timeout = true,
 	.min_disp_clk_khz = 50000,
 	.static_screen_wait_frames = 2,
-	.disable_z10 = true,
+	.disable_z10 = false,
 	.ignore_pg = true,
 	.disable_stutter_for_wm_program = true,
 	.min_deep_sleep_dcfclk_khz = 8000,
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.h b/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.h
index 2824a0e1acc9..1a6e0e7be0fa 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn42b/dcn42b_resource.h
@@ -518,7 +518,8 @@
 		SRII_ARR_2(MODULO, DP_DTO, 2, index),                   \
 		SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 0, index),             \
 		SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 1, index),             \
-		SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 2, index)
+		SRII_ARR_2(PIXEL_RATE_CNTL, OTG, 2, index),				\
+		SR_ARR(OTG_PIXEL_RATE_DIV, index)

 /* ABM */
 #define ABM_DCN42B_REG_LIST_RI(id)                               \
--
2.55.0

