Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B7A75051
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Mar 2025 19:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E73310EA9B;
	Fri, 28 Mar 2025 18:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z06neAeC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687CE10EA9B
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Mar 2025 18:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2c8UsyLtMvxg4wrUlOfcXbHtEp8GgFbCRppD43431J5rAD0MgnAMBku4IQ5ETpsTRv9eTNcCn8gKi7/CuSRJJs4gvV8VLjSn1g4DF1NAWg4ufWqM6Vuhvk4DexjosNSk2l0E7YOG4xQIW/jolk3xI2K0DCGbGYDTqgck8L0TK8SsmZ1zNE98I6zkqumRbGO63LI1SoHO/LMrS+j0ig9hQzZFXT+EFspjNr4jQWNiguUcgl+kEQ+ISHGClOIL1su/vn91QvFRZrupEcLUezHjRr3zNEay75IkBWLVh4w9SNyrM2rhTjl99hXeGUYcxiuG8KfrikytXiqfDJtojBKsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/Am0zhDWUiy7XmLgBxiA+lOsvR+viIiyUuTPEeEgrM=;
 b=twtkg0C8ojBLwPKfqRyzLxcbenFVK+SWY03fRvT2CWuntswhRndX5BXj4cAuOCXP9ur53d82SoZV8PgubSRvciMtIAa3HdAoU9vEzQqnBpWNsXrNalHd1gaFAfSwZXoz0iTNLo4OhNKdtT/n0a2+bCrZtQDbapv4luuU8dM4OXu0b99DbxKO7QHvoFhP9Gb8jLt4E/fGVfbdy0IhDUSwydnukr9WPbOV8KN/0d63aKuswVhe1v39l7haOXSUN2TXZfqM/0RaYfYUSClMvwC6wCEKb+YknLYtLgARwqDwstKswiLBdCxM9XyRX2MSOHAqy2k6WgOEK4IhnlVVqCYLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/Am0zhDWUiy7XmLgBxiA+lOsvR+viIiyUuTPEeEgrM=;
 b=z06neAeCq7ebOcpcRvcwpcxL7gd13VVk1sI3mZFVUC0dMrsZekwHu+2FYaoB83KcyAIG3hKsLR6EWH7pJRAOmfTPw5dIyZ3tasmUqSQi4415yRqq7JEOYXVxAU/EshG5xJO+DXNHUWAeIXV2q19Qd8LjJfU/ZF6RFO4JWWnNhpI=
Received: from SA1PR02CA0006.namprd02.prod.outlook.com (2603:10b6:806:2cf::15)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:23:58 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::33) by SA1PR02CA0006.outlook.office365.com
 (2603:10b6:806:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.45 via Frontend Transport; Fri,
 28 Mar 2025 18:23:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 28 Mar 2025 18:23:58 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 13:23:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/3] drm/amdgpu/pm/swsmu: implement pause workload profile
Date: Fri, 28 Mar 2025 14:23:41 -0400
Message-ID: <20250328182342.17110-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328182342.17110-1-alexander.deucher@amd.com>
References: <20250328182342.17110-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 991d79bf-9544-464f-040f-08dd6e25b51b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jyRtZoxmNFTYcDDHqT6Q2n6mrPznKFUwtSoEBorPOCykT8+LhjbQMf28xtlc?=
 =?us-ascii?Q?iPuuzHQnvRdWCcsYKZzviEXd7bSZmJ/MQCjlt507UStG/Gnw8nRtuPRzD/83?=
 =?us-ascii?Q?YAr9mhJfydoI4RhvG4KFWMkLzwzQha46MQI2+6DQ+HIz9uzuaY3/qP/+46mY?=
 =?us-ascii?Q?Jrf91ZhUk4VPscVsdR1uUpQRvzYF86877AnjveFOD/2p0OiYG2v4iqu32sBc?=
 =?us-ascii?Q?LsI0B+Qbgz3q8PhyUTiA9dQBb3GP0KZBt1Y3RT24EGfESFtq65OF9nejaPb4?=
 =?us-ascii?Q?LJjDvioRzecT3WUxojTL/dbpBr2SYHXBUWHwdjaCjKoc67z4J7b8Smphk19c?=
 =?us-ascii?Q?gD8hxvd3ao79yRyrZWYi5oyZTnGZAV8yxUGpuXYHxnuU0iG88vh5zwNQhDk9?=
 =?us-ascii?Q?M0Xrsdh3XRNldGr2sDxuR5vrfoGurMyWX1Av7rWCxJrMmSVm8SmLpVeYAr6P?=
 =?us-ascii?Q?O2+2Tp9y5s8jkmiffXGof1aV4KMQ3+YWbCg2dYiGWou92tPJhyB4fDAG0+f+?=
 =?us-ascii?Q?UiEGfJtHz7qHGbCO75INXWzQvcYGoc7749b/i7GZ0TOdN+B0iPg3X7fLGDLi?=
 =?us-ascii?Q?0CjA0E1VBeacERIyHsGafhyGG6iAZmnZ+4aeksJJZBBG1prL4mzxM7RS+9kJ?=
 =?us-ascii?Q?WpDhgUt36W8voAcHXEte249vKn6Fo3fFZFlc6rJ2di+qu2oHxFoUruDh8+Q/?=
 =?us-ascii?Q?lL53woj4rIKZsxqz21wyh1NQkK+JWX0iEp0WVgEGTrfaC7gQ99G+tD3JoR5e?=
 =?us-ascii?Q?lBY6l8Qlz0e+pN6/JPJeGKmlN+27wMcKb/F3wwxWO2U15TiD7+KplKkF0fe1?=
 =?us-ascii?Q?cfpztxAB7U/TPuIVwRcVmxHNuBLLcXcXlTU4zgrxD8eX13QTFRrvxEzwAmkv?=
 =?us-ascii?Q?spuUssGPRSb/387zmFK020rgHZD9TBA5HF69Ra7Pgf1Yp5+m2tHpgXtYx1k1?=
 =?us-ascii?Q?m8pEhZL3Fv1FiqJ+HJXrPX5GOsbN8L5FVWxwjOULkUTF1e121hOMwbxz6Pc9?=
 =?us-ascii?Q?0KK2sD4sAJ858CFoSUIZvKMXVSrwex2bEMeaHIo4seaV453g+6BZambroP7N?=
 =?us-ascii?Q?Tg2cJw5KqVUrVHEdMuzVS0/2LuJSaILk1ZMs6JF7pLNyxT8GJ9kgTabyvMkQ?=
 =?us-ascii?Q?teJ51hR7ORV6G4Ea5GjSY+ee0NHdsQ+0fDQpa6wqrizXuJyBk4Eo7kbugdN1?=
 =?us-ascii?Q?uXDnA2FwCR0sbpKvGVEHVVP8xl+D09Wsu0iRka99wtxbxa00RdWvk5fjGokg?=
 =?us-ascii?Q?y3O4i9pCZI9NVoZgvEuUl99peZYUu1X3gTjxntwlRnyGxdjl68J9l8K+QBBZ?=
 =?us-ascii?Q?FSCnrTtbpAhNEy7jmpKsJ63esILbo07P/Aml8VeY58Q5bD+9HuzxFPD7sGfH?=
 =?us-ascii?Q?EBLxt9gimgePjXQ0teX9OEjjSEAzadgTUgklfxwfD0c4FTtvx4HX17VEYKN3?=
 =?us-ascii?Q?n2dglw3eeqhfUtUzxO/DVU6A1bE9vkA52WTGG4XiSwwFKp+1VU+65HeLj8mW?=
 =?us-ascii?Q?/0tRBvr+hQn3buo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(34020700016)(36860700013)(1800799024)(376014)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 18:23:58.6989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991d79bf-9544-464f-040f-08dd6e25b51b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938
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

Add the callback for implementation for swsmu.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 36 ++++++++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index a01b6244d99cd..d23cfd5ba8dc7 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -2398,7 +2398,11 @@ static int smu_switch_power_profile(void *handle,
 			smu_power_profile_mode_get(smu, type);
 		else
 			smu_power_profile_mode_put(smu, type);
-		ret = smu_bump_power_profile_mode(smu, NULL, 0);
+		/* don't switch the active workload when paused */
+		if (smu->pause_workload)
+			ret = 0;
+		else
+			ret = smu_bump_power_profile_mode(smu, NULL, 0);
 		if (ret) {
 			if (enable)
 				smu_power_profile_mode_put(smu, type);
@@ -2411,6 +2415,35 @@ static int smu_switch_power_profile(void *handle,
 	return 0;
 }
 
+static int smu_pause_power_profile(void *handle,
+				   bool pause)
+{
+	struct smu_context *smu = handle;
+	struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
+	u32 workload_mask = 1 << PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
+	int ret;
+
+	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
+		return -EOPNOTSUPP;
+
+	if (smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL &&
+	    smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM) {
+		smu->pause_workload = pause;
+
+		/* force to bootup default profile */
+		if (smu->pause_workload && smu->ppt_funcs->set_power_profile_mode)
+			ret = smu->ppt_funcs->set_power_profile_mode(smu,
+								     workload_mask,
+								     NULL,
+								     0);
+		else
+			ret = smu_bump_power_profile_mode(smu, NULL, 0);
+		return ret;
+	}
+
+	return 0;
+}
+
 static enum amd_dpm_forced_level smu_get_performance_level(void *handle)
 {
 	struct smu_context *smu = handle;
@@ -3759,6 +3792,7 @@ static const struct amd_pm_funcs swsmu_pm_funcs = {
 	.get_pp_table            = smu_sys_get_pp_table,
 	.set_pp_table            = smu_sys_set_pp_table,
 	.switch_power_profile    = smu_switch_power_profile,
+	.pause_power_profile     = smu_pause_power_profile,
 	/* export to amdgpu */
 	.dispatch_tasks          = smu_handle_dpm_task,
 	.load_firmware           = smu_load_microcode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 27cecf9688ccb..a855ae249c739 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -560,6 +560,7 @@ struct smu_context {
 
 	/* asic agnostic workload mask */
 	uint32_t workload_mask;
+	bool pause_workload;
 	/* default/user workload preference */
 	uint32_t power_profile_mode;
 	uint32_t workload_refcount[PP_SMC_POWER_PROFILE_COUNT];
-- 
2.49.0

