Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A7FB9891E
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Sep 2025 09:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63AD10E28F;
	Wed, 24 Sep 2025 07:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Do3QtPdL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5861710E28F
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Sep 2025 07:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=on6gnyTxya1a52pmy/ye6RGgTJnzd3kZAgdIfdOTVBX1GuB0jKdh+6I/8+8UPvEGZfmygd0bR2dPu5Xh3ytXx4Dm9n3yiqNKoJVwleI6ItfXBfj44gi8LlQawJuLN9P6mefTHQD5deDQE8Fnnolg5e8PwUtj+Nu6pqiw2KNQaTpZ9L4RmK1JK98ckcVSWPbBIzHQnAg2r6TCQEonOCiq2L+pHS3e0hjMu+XbgiRPL3nYS1rzd93ybGf1Z/z2bBlsLBc5R40f4MISdBwp0NGPbEg+hmAOY6WfBCJB//tnmLagi/kb+0LhFlybT1dUKGa83uGqX7DvPwj/Xpr3yLO7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nIv/W2NNJreUDK7xEwrXo4iWvUzU2ysiMCdv0Nw4Qo=;
 b=m6bggUfMRiWQDqNr//R99u0TcOOEjqvvG5m5Tg9B3TD5ltLSgVwEy8V/fwaAVnSnWn240XucLHVf2VpE84ptPK5Vd7WAmuN0qJqGg1qnRxxaL7nIOIh3IhHeKMyWmRHpMbPpjWz4EVLxUYaoTn2M1Vce/cFdC6kA64FyCat2Mr0XBJvGktAgS3vnz69BuVOha/ZUzUljkSk4STgQ9aRF5lHKLp/5A7JjVOlL+NxPlQ+7bBW4Lb5PLg1EomNmoNmtrNj1wx40ckJxk3m1SUKZ04Fu4zOgdE7eyw9iGmD+I55T0D0S+y9oy5S8Zot62G+KaYUOQMfxXqwNos8WVNKR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nIv/W2NNJreUDK7xEwrXo4iWvUzU2ysiMCdv0Nw4Qo=;
 b=Do3QtPdLDOqyKpYkXsU+NsEMH5w64a8uOMGL4Hg143nxGd9ThYhaSExfWGadZQJ4mJNQGPC/3R9Ug6OsnZWkZm1heKmqsSXZC7gX4RjbOE/85y51V6sFkbStIbli9pZGTZZ1JMMlbNW49dnm9iEjBDPPelkcOjZwDtaQqqkiNG4=
Received: from SA0PR11CA0134.namprd11.prod.outlook.com (2603:10b6:806:131::19)
 by CY1PR12MB9626.namprd12.prod.outlook.com (2603:10b6:930:106::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 07:37:30 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::78) by SA0PR11CA0134.outlook.office365.com
 (2603:10b6:806:131::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Wed,
 24 Sep 2025 07:37:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Wed, 24 Sep 2025 07:37:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 24 Sep
 2025 00:37:29 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Sep
 2025 02:37:29 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 24 Sep 2025 00:37:22 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [v6 2/2] drm/amdgpu: Implement user queue reset functionality
Date: Wed, 24 Sep 2025 15:34:47 +0800
Message-ID: <20250924073715.2335544-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250924073715.2335544-1-Jesse.Zhang@amd.com>
References: <20250924073715.2335544-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|CY1PR12MB9626:EE_
X-MS-Office365-Filtering-Correlation-Id: 35446d20-d1c9-4994-cda6-08ddfb3d37c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pv0P1eKaUDn/o6fZALPSw3qvM5KG08HXx1mDinC7QFRla5UbMeljZz6krFq4?=
 =?us-ascii?Q?oDNzYvtJ59DyIU5zqOdNYXuXfX2VnA3/AEQGvI+/IYyL5NVqRKrducCP9YfH?=
 =?us-ascii?Q?iJ+siFIYZUsP82ZqZ+HkXcwvMI790BQ/y06WDG8JMD6p/+ye5igUQxjyM0gB?=
 =?us-ascii?Q?CqB7lK+mE815xCcbYb1DQmjzzAPJvL3B32qYjx6yAFpkiT2wq3wc/vOz4FPL?=
 =?us-ascii?Q?/lm5mQc3cTTEmdBmDE7WA1THZA/FoK22+RuJ3uf6ilN0g2NP7M5BcU0rrZFo?=
 =?us-ascii?Q?xC8t2q5vrQ2yDTio70UUryMfG74p3+MW5fHWODcTbpWmk5F8FLBfC8K8Ym1c?=
 =?us-ascii?Q?AMsDXlrg+mjgeoFoNecA59xiA0Is7/PM9LBBFNr+zPXisU7NzvegYtPDFdaM?=
 =?us-ascii?Q?kAOZMxYBHDW0hw3BQnjrYQZqHzGNGndP8TCJNdsfrfsFvXXLDxS2yl6g4S7l?=
 =?us-ascii?Q?o/ybQndHDPAoyq98zbZXGlk3tJC8yYJDuUBfAhP6B3XnLlyWRgGYddTfVbOO?=
 =?us-ascii?Q?lL5QvT1TZ7DT9c6uz0fhfTz2MzcJDsjoNzyf+atKvNJnOSOuT4mmKgMVLUDB?=
 =?us-ascii?Q?OGHkL7K/2qJoEAsCGZnBwJNv2kXUw4TsCgccRhXETdKQKBxfrjqUc66EOzrp?=
 =?us-ascii?Q?gddye1DaDDLpLO2kLzH6cQ4loFn95d1/zZ+NjEe75Wo/oCWAfwoz5i7SkwwK?=
 =?us-ascii?Q?gQvNlYbmXlgjHDVoz9P/5LI3YIMSwuKchwhCTFyxaH53J/JM0ZG4hhofoynd?=
 =?us-ascii?Q?oOPE/8VsdGrc8lP0TZ9QGTTeR1Vgg9BA5ZyohhQ3y9opDIswaT99x9YT8qAl?=
 =?us-ascii?Q?Ok9sjealc9zgQtETbhZ5WlxkXHjh8IJnVl/8ckEPK3F/8TIRL4ILg8ypSa8/?=
 =?us-ascii?Q?1EYXjE3SNfmAF6QsQDxNgvpD/yuL9h7x/7UEeDzIwwFoXQ4rNNiQGq5NGyMK?=
 =?us-ascii?Q?0f6eJknuszkZSS36PDv2jREmHR1C9R3XEkpKjO3yzaV41qivHo3ZmhIuhhqb?=
 =?us-ascii?Q?rbpmn4rqPBQrsFaIRrIETHm2QnLe2t9NwmM22+UB0JrhJWVgv4neDXt73VFu?=
 =?us-ascii?Q?m5NAzS7OH8cBYtWvwRBRm7IVoGi07aNfJVLKZVb3fjq9xT6I1dDyDeb1/mtZ?=
 =?us-ascii?Q?181nCM0Y8loqQSrskXqR0P+3tQN2ajYGEWFL+pxuv04BrlYPrHX//gmnmG7o?=
 =?us-ascii?Q?xO0s17gdowjVM9bMGWWnC8fhzT2hpCYEDzAmis9ZB+/M3e0PIBAxrdR28LoZ?=
 =?us-ascii?Q?b2RRSYA10rXGUOu87o8GhS3EekDArlNcOsOPu+YyeBJrDKmlq23qQ3znRBSB?=
 =?us-ascii?Q?kwg1CwtNXKWLqIl+NeRcpfYspQKyET5CIVfmnG6A/j+Lv6YpuQELNstehgvL?=
 =?us-ascii?Q?X2zdUKOrnsOMcZ/orhOwEET5I+Vkd7cZgBj1DuSPuqouS1NQMWsrpmQJPLe9?=
 =?us-ascii?Q?EshoTBCEohxqLucC8UW93Zs1b2KzDM2XP+4Vy7tVIF5DEevJNqAD9eJn0DhC?=
 =?us-ascii?Q?U9I+SwcNzVpd9wJE29POniNnn0cN3rK1u8zU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 07:37:30.2805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35446d20-d1c9-4994-cda6-08ddfb3d37c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9626
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

The reset functionality works with both gfx/compute and sdma queues,
providing better resilience against queue failures while minimizing
disruption to unaffected queues.

v2: add detection and reset calls when preemption/unmaped fails.
    add a per device userq counter for each user queue type.(Alex)
v3: make sure we hold the adev->userq_mutex when we call amdgpu_userq_detect_and_reset_queues. (Alex)
   warn if the adev->userq_mutex is not held.
v4: make sure we have all of the uqm->userq_mutex held.
   warn if the uqm->userq_mutex is not held.

v5: Use array for user queue type counters.(Alex)
    all of the uqm->userq_mutex need to be held when calling detect and reset.  (Alex)

v6: fix lock dep warning in amdgpu_userq_fence_dence_driver_process

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   8 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c     | 186 ++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h     |   5 +
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  13 +-
 6 files changed, 198 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index ae10832a09f4..6f98428a6022 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1315,6 +1315,7 @@ struct amdgpu_device {
 	bool                            apu_prefer_gtt;
 
 	bool                            userq_halt_for_enforce_isolation;
+	struct work_struct              userq_reset_work;
 	struct amdgpu_uid *uid_info;
 
 	/* KFD
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index e066f7ff2a82..448decf07a24 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4533,6 +4533,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	}
 
 	INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
+	INIT_WORK(&adev->userq_reset_work, amdgpu_userq_reset_work);
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->gfx.gfx_off_residency = 0;
@@ -5954,6 +5955,10 @@ int amdgpu_device_reinit_after_reset(struct amdgpu_reset_context *reset_context)
 				if (r)
 					goto out;
 
+				r = amdgpu_userq_post_reset(tmp_adev, vram_lost);
+				if (r)
+					goto out;
+
 				drm_client_dev_resume(adev_to_drm(tmp_adev), false);
 
 				/*
@@ -6176,6 +6181,7 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
 	if (!amdgpu_sriov_vf(adev))
 		cancel_work(&adev->reset_work);
 #endif
+	cancel_work(&adev->userq_reset_work);
 
 	if (adev->kfd.dev)
 		cancel_work(&adev->kfd.reset_work);
@@ -6296,6 +6302,8 @@ static void amdgpu_device_halt_activities(struct amdgpu_device *adev,
 		    amdgpu_device_ip_need_full_reset(tmp_adev))
 			amdgpu_ras_suspend(tmp_adev);
 
+		amdgpu_userq_pre_reset(tmp_adev);
+
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index b6b649179776..aba76ccc60a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -83,6 +83,7 @@ enum amdgpu_ring_type {
 	AMDGPU_RING_TYPE_MES,
 	AMDGPU_RING_TYPE_UMSCH_MM,
 	AMDGPU_RING_TYPE_CPER,
+	AMDGPU_RING_TYPE_MAX,
 };
 
 enum amdgpu_ib_pool_type {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 0712b88782c8..a09e0b8bf96e 100644
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
@@ -44,6 +46,67 @@ u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
 	return userq_ip_mask;
 }
 
+static void amdgpu_userq_gpu_reset(struct amdgpu_device *adev)
+{
+	if (amdgpu_device_should_recover_gpu(adev)) {
+		amdgpu_reset_domain_schedule(adev->reset_domain,
+					     &adev->userq_reset_work);
+		/* Wait for the reset job to complete */
+		flush_work(&adev->userq_reset_work);
+	}
+}
+
+static int
+amdgpu_userq_detect_and_reset_queues(struct amdgpu_userq_mgr *uq_mgr)
+{
+	struct amdgpu_device *adev = uq_mgr->adev;
+	const struct amdgpu_userq_funcs *userq_gfx_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_GFX];
+	const struct amdgpu_userq_funcs *userq_compute_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_COMPUTE];
+	const struct amdgpu_userq_funcs *userq_sdma_funcs =
+			adev->userq_funcs[AMDGPU_RING_TYPE_SDMA];
+	bool gpu_reset = false;
+	int r = 0;
+
+	/* warning if current process mutex is not held */
+	WARN_ON(!mutex_is_locked(&uq_mgr->userq_mutex));
+
+	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
+		dev_err(adev->dev, "userq reset disabled by debug mask\n");
+	} else if (amdgpu_gpu_recovery) {
+		if ((atomic_read(&uq_mgr->userq_count[AMDGPU_RING_TYPE_COMPUTE]) > 0) && userq_compute_funcs->detect_and_reset) {
+			r = userq_compute_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_COMPUTE);
+			if (r) {
+				gpu_reset = true;
+				goto gpu_reset;
+			}
+		}
+
+		if ((atomic_read(&uq_mgr->userq_count[AMDGPU_RING_TYPE_GFX]) > 0) && userq_gfx_funcs->detect_and_reset) {
+			r = userq_gfx_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_GFX);
+			if (r) {
+				gpu_reset = true;
+				goto gpu_reset;
+			}
+		}
+
+		if ((atomic_read(&uq_mgr->userq_count[AMDGPU_RING_TYPE_SDMA]) > 0) && userq_sdma_funcs->detect_and_reset) {
+			r = userq_sdma_funcs->detect_and_reset(adev, AMDGPU_RING_TYPE_SDMA);
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
 int amdgpu_userq_input_va_validate(struct amdgpu_vm *vm, u64 addr,
 				   u64 expected_size)
 {
@@ -83,17 +146,22 @@ amdgpu_userq_preempt_helper(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 	const struct amdgpu_userq_funcs *userq_funcs =
 		adev->userq_funcs[queue->queue_type];
+	bool found_hung_queue = false;
 	int r = 0;
 
 	if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
 		r = userq_funcs->preempt(uq_mgr, queue);
 		if (r) {
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
+			found_hung_queue = true;
 		} else {
 			queue->state = AMDGPU_USERQ_STATE_PREEMPTED;
 		}
 	}
 
+	if (found_hung_queue)
+		amdgpu_userq_detect_and_reset_queues(uq_mgr);
+
 	return r;
 }
 
@@ -125,16 +193,23 @@ amdgpu_userq_unmap_helper(struct amdgpu_userq_mgr *uq_mgr,
 	struct amdgpu_device *adev = uq_mgr->adev;
 	const struct amdgpu_userq_funcs *userq_funcs =
 		adev->userq_funcs[queue->queue_type];
+	bool found_hung_queue = false;
 	int r = 0;
 
 	if ((queue->state == AMDGPU_USERQ_STATE_MAPPED) ||
 		(queue->state == AMDGPU_USERQ_STATE_PREEMPTED)) {
 		r = userq_funcs->unmap(uq_mgr, queue);
-		if (r)
+		if (r) {
 			queue->state = AMDGPU_USERQ_STATE_HUNG;
-		else
+			found_hung_queue = true;
+		} else {
 			queue->state = AMDGPU_USERQ_STATE_UNMAPPED;
+		}
 	}
+
+	if (found_hung_queue)
+		amdgpu_userq_detect_and_reset_queues(uq_mgr);
+
 	return r;
 }
 
@@ -145,16 +220,22 @@ amdgpu_userq_map_helper(struct amdgpu_userq_mgr *uq_mgr,
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
 
@@ -388,10 +469,11 @@ amdgpu_userq_destroy(struct drm_file *filp, int queue_id)
 		amdgpu_bo_unreserve(queue->db_obj.obj);
 	}
 	amdgpu_bo_unref(&queue->db_obj.obj);
-
+	atomic_dec(&uq_mgr->userq_count[queue->queue_type]);
 #if defined(CONFIG_DEBUG_FS)
 	debugfs_remove_recursive(queue->debugfs_queue);
 #endif
+	amdgpu_userq_detect_and_reset_queues(uq_mgr);
 	r = amdgpu_userq_unmap_helper(uq_mgr, queue);
 	/*TODO: It requires a reset for userq hw unmap error*/
 	if (unlikely(r != AMDGPU_USERQ_STATE_UNMAPPED)) {
@@ -609,6 +691,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	kfree(queue_name);
 
 	args->out.queue_id = qid;
+	atomic_inc(&uq_mgr->userq_count[queue->queue_type]);
 
 unlock:
 	mutex_unlock(&uq_mgr->userq_mutex);
@@ -869,6 +952,7 @@ amdgpu_userq_evict_all(struct amdgpu_userq_mgr *uq_mgr)
 	unsigned long queue_id;
 	int ret = 0, r;
 
+	amdgpu_userq_detect_and_reset_queues(uq_mgr);
 	/* Try to unmap all the queues in this process ctx */
 	xa_for_each(&uq_mgr->userq_mgr_xa, queue_id, queue) {
 		r = amdgpu_userq_preempt_helper(uq_mgr, queue);
@@ -881,6 +965,23 @@ amdgpu_userq_evict_all(struct amdgpu_userq_mgr *uq_mgr)
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
@@ -908,22 +1009,19 @@ void
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
@@ -940,11 +1038,18 @@ amdgpu_userq_evict(struct amdgpu_userq_mgr *uq_mgr,
 int amdgpu_userq_mgr_init(struct amdgpu_userq_mgr *userq_mgr, struct drm_file *file_priv,
 			  struct amdgpu_device *adev)
 {
+	int i;
+
 	mutex_init(&userq_mgr->userq_mutex);
 	xa_init_flags(&userq_mgr->userq_mgr_xa, XA_FLAGS_ALLOC);
 	userq_mgr->adev = adev;
 	userq_mgr->file = file_priv;
 
+	/* Initialize all queue type counters to zero */
+	for (i = 0; i < AMDGPU_RING_TYPE_MAX; i++) {
+		atomic_set(&userq_mgr->userq_count[i], 0);
+	}
+
 	INIT_DELAYED_WORK(&userq_mgr->resume_work, amdgpu_userq_restore_worker);
 	return 0;
 }
@@ -957,6 +1062,7 @@ void amdgpu_userq_mgr_fini(struct amdgpu_userq_mgr *userq_mgr)
 	cancel_delayed_work_sync(&userq_mgr->resume_work);
 
 	mutex_lock(&userq_mgr->userq_mutex);
+	amdgpu_userq_detect_and_reset_queues(userq_mgr);
 	xa_for_each(&userq_mgr->userq_mgr_xa, queue_id, queue) {
 		amdgpu_userq_wait_for_last_fence(userq_mgr, queue);
 		amdgpu_userq_unmap_helper(userq_mgr, queue);
@@ -983,6 +1089,7 @@ int amdgpu_userq_suspend(struct amdgpu_device *adev)
 		uqm = queue->userq_mgr;
 		cancel_delayed_work_sync(&uqm->resume_work);
 		mutex_lock(&uqm->userq_mutex);
+		amdgpu_userq_detect_and_reset_queues(uqm);
 		r = amdgpu_userq_unmap_helper(uqm, queue);
 		if (r)
 			ret = r;
@@ -1038,6 +1145,7 @@ int amdgpu_userq_stop_sched_for_enforce_isolation(struct amdgpu_device *adev,
 		if (((queue->queue_type == AMDGPU_HW_IP_GFX) ||
 		     (queue->queue_type == AMDGPU_HW_IP_COMPUTE)) &&
 		    (queue->xcp_id == idx)) {
+			amdgpu_userq_detect_and_reset_queues(uqm);
 			r = amdgpu_userq_preempt_helper(uqm, queue);
 			if (r)
 				ret = r;
@@ -1079,3 +1187,57 @@ int amdgpu_userq_start_sched_for_enforce_isolation(struct amdgpu_device *adev,
 
 	return ret;
 }
+
+
+void amdgpu_userq_pre_reset(struct amdgpu_device *adev)
+{
+	const struct amdgpu_userq_funcs *userq_funcs;
+	struct amdgpu_usermode_queue *queue;
+	struct amdgpu_userq_mgr *uqm;
+	unsigned long queue_id;
+
+	xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
+		uqm = queue->userq_mgr;
+		cancel_delayed_work_sync(&uqm->resume_work);
+		if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
+			amdgpu_userq_wait_for_last_fence(uqm, queue);
+			userq_funcs = adev->userq_funcs[queue->queue_type];
+			userq_funcs->unmap(uqm, queue);
+			/* just mark all queues as hung at this point.
+			 * if unmap succeeds, we could map again
+			 * in amdgpu_userq_post_reset() if vram is not lost
+			 */
+			queue->state = AMDGPU_USERQ_STATE_HUNG;
+			amdgpu_userq_fence_driver_force_completion(queue);
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
+	unsigned long queue_id;
+	int r = 0;
+
+	xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
+		uqm = queue->userq_mgr;
+		if (queue->state == AMDGPU_USERQ_STATE_HUNG && !vram_lost) {
+			userq_funcs = adev->userq_funcs[queue->queue_type];
+			/* Re-map queue */
+			r = userq_funcs->map(uqm, queue);
+			if (r) {
+				dev_err(adev->dev, "Failed to remap queue %ld\n", queue_id);
+				continue;
+			}
+			queue->state = AMDGPU_USERQ_STATE_MAPPED;
+		}
+	}
+
+	return r;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
index c562c8d2b53a..7bde7fb0a0a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
@@ -98,6 +98,7 @@ struct amdgpu_userq_mgr {
 	struct amdgpu_device		*adev;
 	struct delayed_work		resume_work;
 	struct drm_file			*file;
+	atomic_t                        userq_count[AMDGPU_RING_TYPE_MAX];
 };
 
 struct amdgpu_db_info {
@@ -141,6 +142,10 @@ int amdgpu_userq_stop_sched_for_enforce_isolation(struct amdgpu_device *adev,
 int amdgpu_userq_start_sched_for_enforce_isolation(struct amdgpu_device *adev,
 						   u32 idx);
 
+void amdgpu_userq_reset_work(struct work_struct *work);
+void amdgpu_userq_pre_reset(struct amdgpu_device *adev);
+int amdgpu_userq_post_reset(struct amdgpu_device *adev, bool vram_lost);
+
 int amdgpu_userq_input_va_validate(struct amdgpu_vm *vm, u64 addr,
 				   u64 expected_size);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index cc597fae8971..59d0abbdfc2f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -151,15 +151,20 @@ void amdgpu_userq_fence_driver_process(struct amdgpu_userq_fence_driver *fence_d
 {
 	struct amdgpu_userq_fence *userq_fence, *tmp;
 	struct dma_fence *fence;
+	unsigned long flags;
 	u64 rptr;
 	int i;
 
 	if (!fence_drv)
 		return;
-
+	/*
+	 * Use interrupt-safe spinlock since this function can be called from:
+	 * 1. Interrupt context (IRQ handlers like gfx_v11_0_eop_irq)
+	 * 2. Process context (workqueues like eviction suspend worker)
+	 * Using regular spin_lock() in interrupt context causes lockdep warnings.
+	 */
+	spin_lock_irqsave(&fence_drv->fence_list_lock, flags);
 	rptr = amdgpu_userq_fence_read(fence_drv);
-
-	spin_lock(&fence_drv->fence_list_lock);
 	list_for_each_entry_safe(userq_fence, tmp, &fence_drv->fences, link) {
 		fence = &userq_fence->base;
 
@@ -174,7 +179,7 @@ void amdgpu_userq_fence_driver_process(struct amdgpu_userq_fence_driver *fence_d
 		list_del(&userq_fence->link);
 		dma_fence_put(fence);
 	}
-	spin_unlock(&fence_drv->fence_list_lock);
+	spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
 }
 
 void amdgpu_userq_fence_driver_destroy(struct kref *ref)
-- 
2.49.0

