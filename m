Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDPOIh1JFWq+UAcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:17:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E55D1A2D
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8287610E4FA;
	Tue, 26 May 2026 07:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xphcgYdM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013014.outbound.protection.outlook.com
 [40.93.201.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B210E4F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 07:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUyKNwkV+eGO+9lD5nYA/VnBXfEx/N5p1ahSC3XdSJp6oAq6wosgPQlNikI0qLlOrz1VIMqCMasEHqMmoQAg88aTcpGLueBp4qwL6juj4GIfAkh7yLORg/yJc16lKYP+lps/LgwE5Q5vu2PfPRbF0oGP8jtvI9wJqkEga6XFr/RuNLaOC5ZmZfIsReYLVOTrwOHMLQsAHgIn4K8ePdLoFsLoc3rcRa3NP2n2A0P/2L92wgwQ+UjlcCZX5A1m6R6gu5G7ruxVAR7nLKn+mFaamVsi4WT7B+0q7HH0oTfd3AjxpIbVHPWeHpwaTqhio0tpgNWBAm0HRLVGDk8hUlHDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVjBVB9YY1FerrB53jeH5df3OfF+P0EHAMnWLV8XUfY=;
 b=nyUxHBqdd7hknqyLUHkifWZpHDidOaLqD6Szd7h2liYiGuyyhWw4Q0meu2gkoj0QPeVO2OHlXLzAZMzr+zRINqLaZwHInA/aoftp7LLmxM8bv4BpwNLYsoHNqP/DZuQjgb5BqQFcu8gHp3dg54pZQxL6SHoqy5lp6x5bOkk+sD1njO0vC8Gw9s8JaMheoWqIDxHNhw8hovrSye82BmOsImVXELUK2LC7DiFwaXrNnTUQwOxjdvlyYifexR6x4EnH5p4bvL+t5hDoc+L0gi43mSRfXISJfo4ewieTPAiwqgwLon9LxIH3sazRU+JySyKLvDl6AfZfFUq70gJIJsuoOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVjBVB9YY1FerrB53jeH5df3OfF+P0EHAMnWLV8XUfY=;
 b=xphcgYdMOgvvb33O5Kb/f7PIJ441dJN6R6bURtrgro7Ids3MskOO6Yl//zTj5FiyIeEXPfQQOL/RJ5Pvq5kP2Ss7NFe1YmKt3ohm5ldy0ul2mNyObHFO5kuGetytoNT/odSlgv5hUkDay8+bAKti/++ORDl79jonijMXX8XprGY=
Received: from DS7P220CA0081.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:259::6) by
 DM6PR12MB4235.namprd12.prod.outlook.com (2603:10b6:5:220::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Tue, 26 May 2026 07:17:43 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:259:cafe::40) by DS7P220CA0081.outlook.office365.com
 (2603:10b6:8:259::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.21 via Frontend Transport; Tue, 26
 May 2026 07:17:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Tue, 26 May 2026 07:17:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 02:17:41 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 26 May
 2026 02:17:41 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 26 May 2026 02:17:33 -0500
From: Ray Wu <ray.wu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Ray Wu <ray.wu@amd.com>
Subject: [PATCH 23/41] drm/amd/display: Refactor
 amdgpu_dm_initialize_default_pipeline
Date: Tue, 26 May 2026 15:01:46 +0800
Message-ID: <20260526071413.2181251-24-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526071413.2181251-1-ray.wu@amd.com>
References: <20260526071413.2181251-1-ray.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DM6PR12MB4235:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a390f69-9714-4adb-fbe0-08debaf6e083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: O4R5Fa3DgcuksOe+GDUNPLqeWtYpH8TWTASkk1xk7MrGggm6Bwng78oa9U6viEueWT9PcnwCHZA3gjOJ03d58VCPrPMUz5mtXcacVTweEbFzGEnYUn4RdCy7+TbYu5bw13YoMrcNxfZNNpsNf7wd0xTckntLXujgoxI5i6kHFrO6HCvwpoDQ0ZYrksie9QBuElXeu4cveDOD/md/gQJQDCQJRQL4G9wXCOcXldPPbON75vRDYpEfoN8N2U0ZEfDL1Hag3XG9gPkSH/4XysVfj1uqBsqdF2CyY92yG8P0MQslaZpD2SWGCnjg/WEgZve+6mhSjkqIaMXpH4sh5P1GLwtZ42KOh+Y/8Lhx/+99G+hAbrsnFoQkFKeI6Khk/HL7LGz55JNNup1c8rUR2OuYgV1nky9aLU/FtJQiFjE9Y9rj23015HWAxUpAr6aNaZk0dEEp7vmDcczpMbfUil27AVikq0IhnzUbkfH4O0HkvE62tgpq/8VFVKrY8XENAO//TXnH90VMD51sUmoFHvmBHPZB5gQU19KG+GxyEyY8rD86Qtuaf9Tw00laW8CJ5CtEStG+9cEDpB2LJ5uTqEIozdfdnUym4+WBVaV4/cRYPYLEH2QVd3sZXUxjEGB/eXu1y7imVv/9YRyFcFyiBHe3Of4R944Oqp77UX5yS3aEzhp/VNF+Igd5RYcliAdM6NdqGpKtWPNCvt4ut7CA+pGn22WrnQdlFG48HGio8+oF3Bg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hOFRZjHIkRIQFy1J7OV4++Y9T6Gv7B2isj1InHT4qlSakBJo1X6VX+eNm7qX7p50ARCASF5GD6OyMfKtfneuycsTuCX5YEXZpVq+BYhGTmgNJfQIkFYyZw1ZfWZJQ9hZBUfbmLK2Tm9Mk+PKKeYr4XN+DVrafcumvwAdnHdPlFeLq4guShcwu3OAsHqJcxtpHcKINCk2DcyPuZuK+/X22mptgtYmyoc4r5n4yVZFo17zjmdP1+l4BKnUMsLeL1PIDIKNvBWDz+7tmkAYqmX8BkLMGr6aQixzvLv6csjEQfv2/vc90Lb2Hc9J6xw52ajxrJal/fDPaOfubfZIjmgZk59DiPl1FL/fssKulQRHtVJiKudNn0MJdQixP1DwfvhyIXFglOJQsj1nH4IpoeLZoh/yn3WnF9gBpFcXECuGogO1fRXdRUfPtnYg2ugHhX2f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 07:17:42.3781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a390f69-9714-4adb-fbe0-08debaf6e083
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4235
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
X-Spamd-Result: default: False [1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email,amd.com:mid,amd.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[ray.wu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 221E55D1A2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alex Hung <alex.hung@amd.com>

[Why & How]
Extract amdgpu_dm_initialize_default_pipeline() into a new
STATIC_IFN_KUNIT helper amdgpu_dm_build_default_pipeline().

This separation makes the pipeline-building logic testable via
KUnit without pulling in amdgpu_device and its dependencies
that are unavailable in the UML KUnit build environment.

Assisted-by: Copilot:Claude-Sonnet-4.6

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 22 ++++++++++++++-----
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  5 +++++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
index 7c83fe6df395..d3ae9b58024b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
@@ -59,12 +59,11 @@ EXPORT_IF_KUNIT(amdgpu_dm_supported_blnd_tfs);
 
 #define LUT3D_SIZE		17
 
-int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+STATIC_IFN_KUNIT int
+amdgpu_dm_build_default_pipeline(struct drm_device *dev, struct drm_plane *plane,
+				  bool hw_3d_lut, struct drm_prop_enum_list *list)
 {
 	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
-	struct drm_device *dev = plane->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	bool has_3dlut = adev->dm.dc->caps.color.dpp.hw_3d_lut || adev->dm.dc->caps.color.mpc.preblend;
 	int ret;
 	int i = 0;
 
@@ -117,7 +116,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 	i++;
 
-	if (has_3dlut) {
+	if (hw_3d_lut) {
 		/* 1D curve - SHAPER TF */
 		ops[i] = kzalloc(sizeof(*ops[0]), GFP_KERNEL);
 		if (!ops[i]) {
@@ -208,9 +207,20 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
 
 cleanup:
 	if (ret == -ENOMEM)
-		drm_err(plane->dev, "KMS: Failed to allocate colorop\n");
+		drm_err(dev, "KMS: Failed to allocate colorop\n");
 
 	drm_colorop_pipeline_destroy(dev);
 
 	return ret;
 }
+EXPORT_IF_KUNIT(amdgpu_dm_build_default_pipeline);
+
+int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
+{
+	struct drm_device *dev = plane->dev;
+	struct amdgpu_device *adev = drm_to_adev(dev);
+	bool hw_3d_lut = adev->dm.dc->caps.color.dpp.hw_3d_lut ||
+			 adev->dm.dc->caps.color.mpc.preblend;
+
+	return amdgpu_dm_build_default_pipeline(dev, plane, hw_3d_lut, list);
+}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
index 2e1617ffc8ee..77364d954d3b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
@@ -33,4 +33,9 @@ extern const u64 amdgpu_dm_supported_blnd_tfs;
 
 int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list);
 
+#if IS_ENABLED(CONFIG_DRM_AMD_DC_KUNIT_TEST)
+int amdgpu_dm_build_default_pipeline(struct drm_device *dev, struct drm_plane *plane,
+				      bool hw_3d_lut, struct drm_prop_enum_list *list);
+#endif
+
 #endif /* __AMDGPU_DM_COLOROP_H__*/
-- 
2.43.0

