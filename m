Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28799B35134
	for <lists+amd-gfx@lfdr.de>; Tue, 26 Aug 2025 03:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADA210E5A9;
	Tue, 26 Aug 2025 01:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3gvNEOtP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B733A10E5AB
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 Aug 2025 01:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dso6JfyGDMxFMFhpdF2fsksPI7dYqEYX+/3s0yZBPcpOw4qRs4THQLCChthoxT8W+PBxiG7P66MgARccQytRHkEso6tBeiC5IEIw4Fps7CjR6h0fTWSSUFbAqTb7QQ2K1r8v9705kXAxBT4MyLNCiSX8ofje7Xxr1HheQNEaatxSp21qAwVyxAhCwEOFfweoRDt95nv1jLDk4xnDbjlZWwsZL6FN7PdwzvL0WJvGSXddJ7H/YmLWroP8j5sUSprjulBCir2Rwngf83csO1u2ul2XmvVBog34HJO6yrKWhHgClNH7EB3W31Z/OGt7ePbXJpmyesPM+UxFVndcVg53/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMofa1aJHgFM2cdWtiReGOyFJx2+k1Z5obOttyV0D24=;
 b=YP8UO7iu8cYy4c6St2XF7GoUMftGNrZugRFt94hEIHaRb3FtBMoapDQ+xQ6AqMnzIJ17tsiM2rqqAeheUNp6OnDLFq4NZxoI7gNVnU/cJuWXqa1epfpcx94N29XsE+qQ4QLB3QRWlS2w4dwWrcS3pJKtNJqi1afYVroSLyxOEvhOvBJuoOoKkZwqXVqYpz35ctpN1Mpw/2lhLTJ7dmLMeva6A6p9EWq0fwrrvx4ydjQblrlLhRfYpnC2RJGqhTSH84yEyHcq9JjiDPgDBy5tUhB6w3Qvsa8SHCqroOXbXZRBJcltUTxT4CrYX8VZvIgZKW2sIMSXv/hpCf0IZs/QIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMofa1aJHgFM2cdWtiReGOyFJx2+k1Z5obOttyV0D24=;
 b=3gvNEOtPlxVWrgP/FqdTIQOnI6sh8lr4mDjfIaCl/Fqnjl4XK4iD6fJuOwiE8Q7FG356dX4aq4iwKfCZJhCjVzbYUi2Bc6JXgGtwLxZAwqEpzTBBel4deypM3L8Ifdo9hV7VFvx34pTQcGwKhABz0cUz5x6NyFJ/kRnO1k+hpcE=
Received: from CH2PR20CA0019.namprd20.prod.outlook.com (2603:10b6:610:58::29)
 by DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 01:48:11 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::7c) by CH2PR20CA0019.outlook.office365.com
 (2603:10b6:610:58::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 01:48:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 01:48:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 20:48:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 20:48:08 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 25 Aug 2025 20:48:01 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [v12 11/11] drm/amdgpu: Implement user queue reset functionality
Date: Tue, 26 Aug 2025 09:42:21 +0800
Message-ID: <20250826014648.1711926-11-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250826014648.1711926-1-Jesse.Zhang@amd.com>
References: <20250826014648.1711926-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8b8a07-a938-4cba-34c9-08dde4429d1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZDCphiwv7hHTkD/XITe4ZHJaBwhLdi50HyHOtYuxbv/Kw/uSUJXO0snUMajs?=
 =?us-ascii?Q?zHNix4T3TvGSu5C49dk8W9Y68XyUqJQ42Bh+uEui8YWDQ1r7msbT/oJU/Alp?=
 =?us-ascii?Q?iGQl37FCdU5A5tdQzqdu8dyP0xiIAZS5WnO5V4uvGUQbA8vQ3Rf+ZFFjwkyG?=
 =?us-ascii?Q?R1+37w73Dyjs+7cKpjwokisw5IBm1bRjg+rZkPvjDETXAiBmB29mmXNKfcmt?=
 =?us-ascii?Q?u0RRbcuLPu0DjlwIS3sACbUz1VuYlK+V2Q6T95JEMDWP7bxoJvI3ORGY/jeO?=
 =?us-ascii?Q?iPzeCk1W6bCly14w4QRZQ9sbquRGz/zoHJoPRv6Y7HxraUGA4h9ZLqdWX7As?=
 =?us-ascii?Q?HQwKFefrYKqwkp23w74+8LunLeidUULZLGhgxEFhG+OsSE0AvfxGTDoH07fI?=
 =?us-ascii?Q?c2ip7iYilJvztSgwyxDbkXJqvwsvAcrTN4vwUGgrVQALyQex09huo34GQbks?=
 =?us-ascii?Q?CWfaZ6B5ok1h5k68V+uc096kZ5uEPP4mhY/v1qzAJa3WnImb9a9mTsXiDaez?=
 =?us-ascii?Q?CaSKzkgRH0xvT+JH70PRIK8fPhOhf2s3FT1adoYyhTU5L6wVlsD8pUb22VjV?=
 =?us-ascii?Q?M5r7L2V0T+qvnmH7IfVErw7Vt/M+JNslVWMhfzes7lAoqnnuLpeOKIosXKFF?=
 =?us-ascii?Q?l4weudz6Hx42RARoYmz/3rAIJPmGS15kQ5lJUBSLyAxSLPovrkDxMvgatq1x?=
 =?us-ascii?Q?Z/in1dIVbi+faRowrdcsDVKrXQtQ2VGaCNgC8PSnVnnFhYllMOKijrdHkUbz?=
 =?us-ascii?Q?FMv95JCdVH2RymE25Mh2azUy7HM/GVTKSQDKsfKrwuS0WMOdHIIheOKEe7b5?=
 =?us-ascii?Q?Qd91G5KWvC+nad3FVUqQe7AXsXwfSalwdSTV7WKaNJLkMicrH/Roi4A32SLA?=
 =?us-ascii?Q?8HBTrPODTseqfjJceE2GWVyNMfaWcqlOmBd6ahZZ51j4uK1ucD6OvRpzyfR2?=
 =?us-ascii?Q?0wySkWFABiEeEzw+1ye/GCSnN44lDHMXJbALGfxP9I9+PJjtdj9lIdG5kMvr?=
 =?us-ascii?Q?hNVNL4iFEjKzp3ff3rfq4CWt4QF3b+5HLfle/Qkx+Nfjgygbh+CnfNlg9Dcp?=
 =?us-ascii?Q?aMw/JoVupROXfmG0MYRFwQfj7zHKuP050mlld4UkgsaYOp5+m1QDOxSvK0F7?=
 =?us-ascii?Q?hTCYa4vvvz1dEe+0CoGj40Nlh04yMCAC4DwaLf7DonLBQDFFtMmRYqc4kHM5?=
 =?us-ascii?Q?CZEsSy7QJvB0IqabYKpvIrdA9Qh/P/mw8ZrKBHUH2h3p0loC/gYNdZCsK0At?=
 =?us-ascii?Q?CiMODwCBovg0Jk0No8xibddtyTQCklVeFGHE2bu0lP83RTpwANpQEmA+cpI/?=
 =?us-ascii?Q?e27OXHK+M1ihsI6sYkZVj/vDeGMbWJUgVpKsUVyOeJxIWKrqqz4pBxJQoMJo?=
 =?us-ascii?Q?2tzK54oqL5BVftw/iXa4O4leyxpNpS/1VGPBYBy0DyT7ncvzIQxB0SlkpejX?=
 =?us-ascii?Q?dAaSH9s73BGLkBh0XhJ3wQOzCREGI4t14sKqesYg5vEsJ9RJF2Jp/A7g8w2K?=
 =?us-ascii?Q?Nwevi4QHLM2l4R54/zZ4JszSTyXzSxawciF2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 01:48:11.0893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8b8a07-a938-4cba-34c9-08dde4429d1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
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

From: Alex Deucher <alexander.deucher@amd.com>

This patch adds robust reset handling for user queues (userq) to improve
recovery from queue failures. The key components include:

1. Queue detection and reset logic:
   - amdgpu_userq_detect_and_reset_queues() identifies failed queues
   - Per-IP detect_and_reset callbacks for targeted recovery
   - Falls back to full GPU reset when needed

2. Reset infrastructure:
   - Adds userq_reset_work workqueue for async reset handling
   - Implements pre/post reset handlers for queue state management
   - Integrates with existing GPU reset framework

3. Error handling improvements:
   - Enhanced state tracking with HUNG state
   - Automatic reset triggering on critical failures
   - VRAM loss handling during recovery

4. Integration points:
   - Added to device init/reset paths
   - Called during queue destroy, suspend, and isolation events
   - Handles both individual queue and full GPU resets

The reset functionality works with both compute and graphics queues,
providing better resilience against queue failures while minimizing
disruption to unaffected queues.

v2: Separate SDMA and GFX/COMPUTE queue reset handling

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c  | 215 +++++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h  |   5 +
 4 files changed, 216 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index ef3af170dda4..9db05cdc7304 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1302,6 +1302,7 @@ struct amdgpu_device {
 	struct list_head		userq_mgr_list;
 	struct mutex                    userq_mutex;
 	bool                            userq_halt_for_enforce_isolation;
+	struct work_struct		userq_reset_work;
 };
 
 static inline uint32_t amdgpu_ip_version(const struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3757634613c3..1dc88b0055dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4475,6 +4475,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	}
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
+	INIT_WORK(&adev->userq_reset_work, amdgpu_userq_reset_work);
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->gfx.gfx_off_residency = 0;
@@ -5880,6 +5881,10 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
+				r = amdgpu_userq_post_reset(tmp_adev, vram_lost);
+				if (r)
+					goto out;
+
 				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
 
 				/*
@@ -6102,6 +6107,7 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
 	if (!amdgpu_sriov_vf(adev))
 		cancel_work(&adev->reset_work);
 #endif
+	cancel_work(&adev->userq_reset_work);
 
 	if (adev->kfd.dev)
 		cancel_work(&adev->kfd.reset_work);
@@ -6232,6 +6238,8 @@ static void amdgpu_device_halt_activities(struct amdgpu_device *adev,
 		      amdgpu_device_ip_need_full_reset(tmp_adev))
 			amdgpu_ras_suspend(tmp_adev);
 
+		amdgpu_userq_pre_reset(tmp_adev);
+
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index decedf8057ac..996c7397a57f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -25,8 +25,10 @@
 #include <drm/drm_auth.h>
 #include <drm/drm_exec.h>
 #include <linux/pm_runtime.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
+#include "amdgpu_reset.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_userq.h"
 #include "amdgpu_userq_fence.h"
@@ -44,6 +46,102 @@ u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
 	return userq_ip_mask;
 }
 
+static void amdgpu_userq_gpu_reset(struct amdgpu_device *adev)
+{
+
+	if (amdgpu_device_should_recover_gpu(adev)) {
+		amdgpu_reset_domain_schedule(adev->reset_domain,
+					     &adev->userq_reset_work);
+		/* Wait for the reset job to complete */
+		flush_work(&adev->userq_reset_work);
+	}
+}
+
+static int
+amdgpu_userq_detect_and_reset_sdma(struct amdgpu_userq_mgr *uq_mgr)
+{
+	struct amdgpu_device *adev = uq_mgr->adev;
+	const struct amdgpu_userq_funcs *userq_sdma_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_SDMA];
+	struct amdgpu_usermode_queue *userq;
+	bool has_sdma = false;
+	bool gpu_reset = false;
+	int id, r = 0;
+
+	/* Detect if SDMA queues are present */
+	idr_for_each_entry(&uq_mgr->userq_idr, userq, id) {
+		if (userq->queue_type == AMDGPU_RING_TYPE_SDMA) {
+			has_sdma = true;
+			break;
+		}
+	}
+
+	if (has_sdma && userq_sdma_funcs && userq_sdma_funcs->detect_and_reset) {
+		r = userq_sdma_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_SDMA);
+		if (r)
+			gpu_reset = true;
+	}
+
+	if (gpu_reset)
+		amdgpu_userq_gpu_reset(adev);
+
+	return r;
+}
+
+static int
+amdgpu_userq_detect_and_reset_gfx_compute(struct amdgpu_userq_mgr *uq_mgr)
+{
+	struct amdgpu_device *adev = uq_mgr->adev;
+	const struct amdgpu_userq_funcs *userq_gfx_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_GFX];
+	const struct amdgpu_userq_funcs *userq_compute_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_COMPUTE];
+	struct amdgpu_usermode_queue *userq;
+	bool has_gfx = false, has_compute = false;
+	bool gpu_reset = false;
+	int id, r = 0;
+
+	/* Detect which types of queues are present (excluding SDMA) */
+	idr_for_each_entry(&uq_mgr->userq_idr, userq, id) {
+		switch (userq->queue_type) {
+		case AMDGPU_RING_TYPE_GFX:
+			has_gfx = true;
+			break;
+		case AMDGPU_RING_TYPE_COMPUTE:
+			has_compute = true;
+			break;
+		default:
+			break;
+		}
+	}
+
+	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
+		dev_err(adev->dev, "userq reset disabled by debug mask\n");
+	} else if (amdgpu_gpu_recovery) {
+		if (has_compute && userq_compute_funcs->detect_and_reset) {
+			r = userq_compute_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_COMPUTE);
+			if (r) {
+				gpu_reset = true;
+				goto gpu_reset;
+			}
+		}
+
+		if (has_gfx && userq_gfx_funcs->detect_and_reset) {
+			r = userq_gfx_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_GFX);
+			if (r) {
+				gpu_reset = true;
+				goto gpu_reset;
+			}
+		}
+	}
+
+gpu_reset:
+	if (gpu_reset)
+		amdgpu_userq_gpu_reset(adev);
+
+	return r;
+}
+
 static int
 amdgpu_userqueue_preempt_helper(struct amdgpu_userq_mgr *uq_mgr,
 			  struct amdgpu_usermode_queue *queue)
@@ -56,6 +154,7 @@ amdgpu_userqueue_preempt_helper(struct amdgpu_userq_mgr *uq_mgr,
 	if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
 		r = userq_funcs->preempt(uq_mgr, queue);
 		if (r) {
+			amdgpu_userq_detect_and_reset_gfx_compute(uq_mgr);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
 		} else {
 			queue->state = AMDGPU_USERQ_STATE_PREEMPTED;
@@ -72,17 +171,21 @@ amdgpu_userqueue_restore_helper(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 	const struct amdgpu_userq_funcs *userq_funcs =
 		adev->userq_funcs[queue->queue_type];
+	bool gpu_reset = false;
 	int r = 0;
 
 	if (queue->state == AMDGPU_USERQ_STATE_PREEMPTED) {
 		r = userq_funcs->restore(uq_mgr, queue);
 		if (r) {
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
+			gpu_reset = true;
 		} else {
 			queue->state = AMDGPU_USERQ_STATE_MAPPED;
 		}
 	}
 
+	if (gpu_reset)
+		amdgpu_userq_gpu_reset(adev);
 	return r;
 }
 
@@ -98,11 +201,14 @@ amdgpu_userq_unmap_helper(struct amdgpu_userq_mgr *uq_mgr,
 	if ((queue->state == AMDGPU_USERQ_STATE_MAPPED) ||
 		(queue->state == AMDGPU_USERQ_STATE_PREEMPTED)) {
 		r = userq_funcs->unmap(uq_mgr, queue);
-		if (r)
+		if (r) {
+			amdgpu_userq_detect_and_reset_gfx_compute(uq_mgr);
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
-		else
+		} else {
 			queue->state = AMDGPU_USERQ_STATE_UNMAPPED;
+		}
 	}
+
 	return r;
 }
 
@@ -113,16 +219,22 @@ amdgpu_userq_map_helper(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 	const struct amdgpu_userq_funcs *userq_funcs =
 		adev->userq_funcs[queue->queue_type];
+	bool gpu_reset = false;
 	int r = 0;
 
 	if (queue->state == AMDGPU_USERQ_STATE_UNMAPPED) {
 		r = userq_funcs->map(uq_mgr, queue);
 		if (r) {
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
+			gpu_reset = true;
 		} else {
 			queue->state = AMDGPU_USERQ_STATE_MAPPED;
 		}
 	}
+
+	if (gpu_reset)
+		amdgpu_userq_gpu_reset(adev);
+
 	return r;
 }
 
@@ -361,6 +473,7 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 		amdgpu_bo_unreserve(queue->db_obj.obj);
 	}
 	amdgpu_bo_unref(&queue->db_obj.obj);
+	amdgpu_userq_detect_and_reset_sdma(uq_mgr);
 	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
 	amdgpu_userq_cleanup(uq_mgr, queue, queue_id);
 	mutex_unlock(&uq_mgr->userq_mutex);
@@ -734,6 +847,7 @@ amdgpu_userq_evict_all(struct amdgpu_userq_mgr *uq_mgr)
 	int queue_id;
 	int ret = 0, r;
 
+	amdgpu_userq_detect_and_reset_sdma (uq_mgr);
 	/* Try to unmap all the queues in this process ctx */
 	idr_for_each_entry(&uq_mgr->userq_idr, queue, queue_id) {
 		r = amdgpu_userqueue_preempt_helper(uq_mgr, queue);
@@ -746,6 +860,23 @@ amdgpu_userq_evict_all(struct amdgpu_userq_mgr *uq_mgr)
 	return ret;
 }
 
+void amdgpu_userq_reset_work(struct work_struct *work)
+{
+	struct amdgpu_device *adev = container_of(work, struct amdgpu_device,
+						  userq_reset_work);
+	struct amdgpu_reset_context reset_context;
+
+	memset(&reset_context, 0, sizeof(reset_context));
+
+	reset_context.method = AMD_RESET_METHOD_NONE;
+	reset_context.reset_req_dev = adev;
+	reset_context.src = AMDGPU_RESET_SRC_USERQ;
+	set_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
+	/*set_bit(AMDGPU_SKIP_COREDUMP, &reset_context.flags);*/
+
+	amdgpu_device_gpu_recover(adev, NULL, &reset_context);
+}
+
 static int
 amdgpu_userq_wait_for_signal(struct amdgpu_userq_mgr *uq_mgr)
 {
@@ -772,22 +903,19 @@ void
 amdgpu_userq_evict(struct amdgpu_userq_mgr *uq_mgr,
 		   struct amdgpu_eviction_fence *ev_fence)
 {
-	int ret;
 	struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
 	struct amdgpu_eviction_fence_mgr *evf_mgr = &fpriv->evf_mgr;
+	struct amdgpu_device *adev = uq_mgr->adev;
+	int ret;
 
 	/* Wait for any pending userqueue fence work to finish */
 	ret = amdgpu_userq_wait_for_signal(uq_mgr);
-	if (ret) {
-		drm_file_err(uq_mgr->file, "Not evicting userqueue, timeout waiting for work\n");
-		return;
-	}
+	if (ret)
+		dev_err(adev->dev, "Not evicting userqueue, timeout waiting for work\n");
 
 	ret = amdgpu_userq_evict_all(uq_mgr);
-	if (ret) {
-		drm_file_err(uq_mgr->file, "Failed to evict userqueue\n");
-		return;
-	}
+	if (ret)
+		dev_err(adev->dev, "Failed to evict userqueue\n");
 
 	/* Signal current eviction fence */
 	amdgpu_eviction_fence_signal(evf_mgr, ev_fence);
@@ -828,6 +956,7 @@ void amdgpu_userq_mgr_fini(struct amdgpu_userq_mgr *userq_mgr)
 
 	mutex_lock(&adev->userq_mutex);
 	mutex_lock(&userq_mgr->userq_mutex);
+	amdgpu_userq_detect_and_reset_sdma(userq_mgr);
 	idr_for_each_entry(&userq_mgr->userq_idr, queue, queue_id) {
 		amdgpu_userq_wait_for_last_fence(userq_mgr, queue);
 		amdgpu_userq_unmap_helper(userq_mgr, queue);
@@ -861,10 +990,13 @@ int amdgpu_userq_suspend(struct amdgpu_device *adev)
 	list_for_each_entry_safe(uqm, tmp, &adev->userq_mgr_list, list) {
 		cancel_delayed_work_sync(&uqm->resume_work);
 		mutex_lock(&uqm->userq_mutex);
+		amdgpu_userq_detect_and_reset_sdma(uqm);
 		idr_for_each_entry(&uqm->userq_idr, queue, queue_id) {
 			r = amdgpu_userq_unmap_helper(uqm, queue);
-			if (r)
+			if (r) {
+				amdgpu_userq_detect_and_reset_gfx_compute(uqm);
 				ret = r;
+			}
 		}
 		mutex_unlock(&uqm->userq_mutex);
 	}
@@ -917,13 +1049,16 @@ int amdgpu_userq_stop_sched_for_enforce_isolation(struct amdgpu_device *adev,
 	list_for_each_entry_safe(uqm, tmp, &adev->userq_mgr_list, list) {
 		cancel_delayed_work_sync(&uqm->resume_work);
 		mutex_lock(&uqm->userq_mutex);
+		amdgpu_userq_detect_and_reset_sdma(uqm);
 		idr_for_each_entry(&uqm->userq_idr, queue, queue_id) {
 			if (((queue->queue_type == AMDGPU_HW_IP_GFX) ||
 			     (queue->queue_type == AMDGPU_HW_IP_COMPUTE)) &&
 			    (queue->xcp_id == idx)) {
 				r = amdgpu_userq_unmap_helper(uqm, queue);
-				if (r)
+				if (r) {
+					amdgpu_userq_detect_and_reset_gfx_compute(uqm);
 					ret = r;
+				}
 			}
 		}
 		mutex_unlock(&uqm->userq_mutex);
@@ -965,3 +1100,57 @@ int amdgpu_userq_start_sched_for_enforce_isolation(struct amdgpu_device *adev,
 	mutex_unlock(&adev->userq_mutex);
 	return ret;
 }
+
+void amdgpu_userq_pre_reset(struct amdgpu_device *adev)
+{
+	const struct amdgpu_userq_funcs *userq_funcs;
+	struct amdgpu_usermode_queue *queue;
+	struct amdgpu_userq_mgr *uqm, *tmp;
+	int queue_id;
+
+	list_for_each_entry_safe(uqm, tmp, &adev->userq_mgr_list, list) {
+		cancel_delayed_work_sync(&uqm->resume_work);
+		idr_for_each_entry(&uqm->userq_idr, queue, queue_id) {
+			if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
+				amdgpu_userq_wait_for_last_fence(uqm, queue);
+				userq_funcs = adev->userq_funcs[queue->queue_type];
+				userq_funcs->unmap(uqm, queue);
+				/* just mark all queues as hung at this point.
+				 * if unmap succeeds, we could map again
+				 * in amdgpu_userq_post_reset() if vram is not lost
+				 */
+				queue->state = AMDGPU_USERQ_STATE_HUNG;
+				amdgpu_userq_fence_driver_force_completion(queue);
+			}
+		}
+	}
+}
+
+int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost)
+{
+	/* if any queue state is AMDGPU_USERQ_STATE_UNMAPPED
+	 * at this point, we should be able to map it again
+	 * and continue if vram is not lost.
+	 */
+	struct amdgpu_userq_mgr *uqm;
+	struct amdgpu_usermode_queue *queue;
+	const struct amdgpu_userq_funcs *userq_funcs;
+	int queue_id, r = 0;
+
+	list_for_each_entry(uqm, &adev->userq_mgr_list, list) {
+		idr_for_each_entry(&uqm->userq_idr, queue, queue_id) {
+			if (queue->state == AMDGPU_USERQ_STATE_HUNG && !vram_lost) {
+				userq_funcs = adev->userq_funcs[queue->queue_type];
+				/* re-map queue */
+				r = userq_funcs->map(uqm, queue);
+				if (r) {
+					dev_err(adev->dev, "Failed to remap queue %d\n", queue_id);
+					continue;
+				}
+				queue->state = AMDGPU_USERQ_STATE_MAPPED;
+			}
+		}
+	}
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index 9fa0d1a88d71..e68bb144b26f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -138,4 +138,9 @@ int amdgpu_userq_stop_sched_for_enforce_isolation(struct amdgpu_device *adev,
 int amdgpu_userq_start_sched_for_enforce_isolation(struct amdgpu_device *adev,
 						   u32 idx);
 
+void amdgpu_userq_reset_work(struct work_struct *work);
+
+void amdgpu_userq_pre_reset(struct amdgpu_device *adev);
+int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost);
+
 #endif
-- 
2.49.0

