Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QI5NOQ9JFWq+UAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:17:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D805D1A10
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92C710E509;
	Tue, 26 May 2026 07:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4sIgMXyj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013050.outbound.protection.outlook.com
 [40.93.196.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3D10E4F8
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 07:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miFsWFAlZgr/tVPTgnlT8lyNyB/jvj1u1dm2WDr7csdQlkYxBSVgv+QbyQyTvLPnadL9c/pxwrqEVbnXZ8x6s1JVepiGLr/edx+jWaABfZd6DQ/BTlJ80DbFZEKYjGQ8zxzjdAF0TWAKKR7Lae5R1e8yETMqYyaOqe0zcgpeFBgiY9fe/hFb7wC7cJD+6zABBoS70hMbDHMQCEw0jSGdjNh7J3UyKYN5tUUNOgnUw8jSehjXPSoGc5tV5MKcrcYHe+rw1WPXsKJH3ilYYqqWavK0Jm2y8f6T4AIvnXA4y/HY5pA8ebvg4wsD7XZID46UHPaS03XGp5lIL8bDgJZoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddkFugZqLP0dN1NVLXwLekgha2xXs+mhCKCXd1/67iU=;
 b=AlkAczi+sv4GixvPhEgczhc4nXmIk2ryOhGxQa/1hYX4RAC3uGdBhszapzxRTmrzOGvhQSFqu7QQsO91yYaJjDQDAEevnMb247uEDn5tkNshceZdCTioSsOKEJPtmHpNYBQyg6IwLILsMvh2RAtzamuFt0lN7NVodxn+uV7BYDiIedxZGYxeGs4+IyMpeclyL2bx1BY0Cp0fdXo1tMnHkM8o1vWGZUKuwcIpWo9rzDZTITcrsYWsLcSQ9+JbW8KKKKf3vjf5rOOs1Ag79cEycuJgFtPlv064+mA34daIyX98oTuke9wkJhaCfrhcsYObEXzx71/3gOmh5W2JmKwnbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddkFugZqLP0dN1NVLXwLekgha2xXs+mhCKCXd1/67iU=;
 b=4sIgMXyj4ibOsQLpKv1Xq6PgD3iGZj8sgpEiIh47pco5D6gtLwhvLZX0reqsjd6agywiVb7S6pfxP0DMF1muitVoBzO/B6dmw6DVdPjkY5umNhY8dH6Qy0J6eYLrXcLq43/UETe2GE2mwmnIWRLrDDIxqBcz/f2lnATmPf9o/cQ=
Received: from PH8P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::24)
 by LVUPR12MB999184.namprd12.prod.outlook.com (2603:10b6:408:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 26 May
 2026 07:17:25 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:510:2db:cafe::17) by PH8P223CA0019.outlook.office365.com
 (2603:10b6:510:2db::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.11 via Frontend Transport; Tue, 26
 May 2026 07:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 07:17:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 26 May
 2026 02:17:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 May
 2026 02:17:24 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 02:17:15 -0500
From: Ray Wu <ray.wu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [PATCH 21/41] drm/amd/display: Extract transfer function helpers
Date: Tue, 26 May 2026 15:01:44 +0800
Message-ID: <20260526071413.2181251-22-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526071413.2181251-1-ray.wu@amd.com>
References: <20260526071413.2181251-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|LVUPR12MB999184:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e467ab8-be3e-4649-60dc-08debaf6d62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|6133799003|3023799007|11063799006|5023799004|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gibwCYLJ3dgxD4mjkMAk9xOGU/b5uLIvWnKGYzD54bd8kBIbAgQ6decB8rpPdGDgBrNb2mZBwP8PfBO2Y/Sq5MvUToSbQIsKNI9SyoavT844jcTC6Gp4AywhFDA/TJP1SkEtf/VPa4K1E/iF1ZQ8piK+C9xH5Klk1Xv2hY+qELhBdhZIKfK+b5q4g910L6f5P3iPCaBZZ/js0QxwlBUVs7PbzjFK3JANzf/+SpOacDeCR3xcrMxB+0sYlJ6LGB2mdd1JvLDAn9a6UHwZJ1sCJCkq2YNx/F2EaI0H/UkgWvWMA131VOq0l2QzxIeLWbRkb4XDx4l+MhobCWZysZA1IODUF9mF70F2o3x9imLkJLtlOFTNyDDYbSBzyodjEca0GJRKPYtCHIFtVnrqz2j9WwXQY4jZPGRBMoaZqG0obU6/U6ao8dbH8CER4CfGuo5bDV/al9RK1fBS/lkvrHGCDlbshBgV9jlDVuvKAbTGSQGMnhvFyWRGt3pp4JZY+S8TZnulxnzTQYEhdAcrdmA5KQaVDEsz/khHtonI20hs3dA+63i+kQUDUvGK2dMXFiFLyF0a+Nj48m7lXWIes9UZy2GumJDofZpcjBjO4akswmEdPaGcMTzGvtXI/p9mQzM8wrtuKMTXSab7sQn1mfvInhfGIXL/zG4eJfrCOPRxc/WLlV8AMq51c7XdvirN4fpMhq7Oeh8Xp+UDJJ8+OQ6ug1ZZxoQA4rp9mwHOyI4Lgic=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(3023799007)(11063799006)(5023799004)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YxyfLaDDKQe/wcJLarelVShiylxPsUxyYZPTmFE8JByGuxcZDTX2+19FhdL3st1dPcQ3Dj4rB1paJXMl6y4JzfKFJ9vuJ2MOSoinR2Z8nNTGZfFm0Kch5YEKsI7G6Se6TdJ+hjnxfugcAPfVkamWzMkKSAK/KcgAV1Xs8XmlCiv3LUgmcySqcgr1kCd+lNPcuiz7gXlZOWBh70y4GOy9s9iwIwlULb+DI7cCk22X9Z7RrIsWSK/NwDD2KXfhWll0s5BRDZZ6ZJwsR+QCFR76vCGh3HO3vYRCwo25HJH9Z9bvsqE1ugsug0AswhUDPXUof3yZRlAYPg7Vyi/0hSftvvI3laL/k74DJanIotfuiUkIcPqwkRBe+BxYWJC1177GdIDGq5ckBx+65aqxysMVBRCXhaiANQOzwBmDq7+X1xUGx9BL0GpD3SNBf6dMgXVt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:17:25.0249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e467ab8-be3e-4649-60dc-08debaf6d62c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999184
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ray.wu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 60D805D1A10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alex Hung <alex.hung@amd.com>

[Why]
Extract repeated inline dc_transfer_func setup patterns into two
small helper functions in amdgpu_dm_color.c.

Three functions (amdgpu_dm_set_atomic_regamma,
amdgpu_dm_atomic_shaper_lut, amdgpu_dm_atomic_blend_lut) each
contained identical two-line bypass setup and identical three-line
distributed-points setup. __set_colorop_in_tf_1d_curve contained
the same two-line bypass pattern as well.

[How]
Extract to __set_tf_bypass() and __set_tf_distributed_points().
Replace all four bypass sites with __set_tf_bypass(), and all three
distributed-points sites with __set_tf_distributed_points().

Assisted-by: Copilot:Claude-Sonnet-4.6

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index bb4f85c7033e..ab0ed80c0e0e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -759,6 +759,19 @@ static int __set_output_tf_32(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+static void __set_tf_bypass(struct dc_transfer_func *tf)
+{
+	tf->type = TF_TYPE_BYPASS;
+	tf->tf = TRANSFER_FUNCTION_LINEAR;
+}
+
+static void __set_tf_distributed_points(struct dc_transfer_func *tf,
+					enum dc_transfer_func_predefined predefined_tf)
+{
+	tf->type = TF_TYPE_DISTRIBUTED_POINTS;
+	tf->tf = predefined_tf;
+	tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
+}
 
 static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
 					const struct drm_color_lut *regamma_lut,
@@ -779,18 +792,14 @@ static int amdgpu_dm_set_atomic_regamma(struct dc_transfer_func *out_tf,
 		 * pre-defined TF and the custom LUT values into the LUT that's
 		 * actually programmed.
 		 */
-		out_tf->type = TF_TYPE_DISTRIBUTED_POINTS;
-		out_tf->tf = tf;
-		out_tf->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-
+		__set_tf_distributed_points(out_tf, tf);
 		ret = __set_output_tf(out_tf, regamma_lut, regamma_size, has_rom);
 	} else {
 		/*
 		 * No CRTC RGM means we can just put the block into bypass
 		 * since we don't have any plane level adjustments using it.
 		 */
-		out_tf->type = TF_TYPE_BYPASS;
-		out_tf->tf = TRANSFER_FUNCTION_LINEAR;
+		__set_tf_bypass(out_tf);
 	}
 
 	return ret;
@@ -1077,14 +1086,10 @@ static int amdgpu_dm_atomic_shaper_lut(const struct drm_color_lut *shaper_lut,
 		 * If user shaper LUT is set, we assume a linear color space
 		 * (linearized by degamma 1D LUT or not).
 		 */
-		func_shaper->type = TF_TYPE_DISTRIBUTED_POINTS;
-		func_shaper->tf = tf;
-		func_shaper->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-
+		__set_tf_distributed_points(func_shaper, tf);
 		ret = __set_output_tf(func_shaper, shaper_lut, shaper_size, has_rom);
 	} else {
-		func_shaper->type = TF_TYPE_BYPASS;
-		func_shaper->tf = TRANSFER_FUNCTION_LINEAR;
+		__set_tf_bypass(func_shaper);
 	}
 
 	return ret;
@@ -1106,14 +1111,10 @@ static int amdgpu_dm_atomic_blend_lut(const struct drm_color_lut *blend_lut,
 		 * module to fill the parameters that will be translated to HW
 		 * points.
 		 */
-		func_blend->type = TF_TYPE_DISTRIBUTED_POINTS;
-		func_blend->tf = tf;
-		func_blend->sdr_ref_white_level = SDR_WHITE_LEVEL_INIT_VALUE;
-
+		__set_tf_distributed_points(func_blend, tf);
 		ret = __set_input_tf(NULL, func_blend, blend_lut, blend_size);
 	} else {
-		func_blend->type = TF_TYPE_BYPASS;
-		func_blend->tf = TRANSFER_FUNCTION_LINEAR;
+		__set_tf_bypass(func_blend);
 	}
 
 	return ret;
@@ -1510,8 +1511,7 @@ __set_colorop_in_tf_1d_curve(struct dc_plane_state *dc_plane_state,
 		return -EINVAL;
 
 	if (colorop_state->bypass) {
-		tf->type = TF_TYPE_BYPASS;
-		tf->tf = TRANSFER_FUNCTION_LINEAR;
+		__set_tf_bypass(tf);
 		return 0;
 	}
 
-- 
2.43.0

