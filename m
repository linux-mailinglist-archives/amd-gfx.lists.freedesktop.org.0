Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE7475304
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Dec 2021 07:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA1410E871;
	Wed, 15 Dec 2021 06:36:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337EC10E871;
 Wed, 15 Dec 2021 06:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gSBlVyS8mKTBIiDxM1LUo4kXyErIzes6bPaRRweE0AedpHjDi3VbJK+dCvvpBOHYaDLpnQ1TVELrX/DohPa6w5jupBYb1o/xZHcV4J1QW9hzHB4QPjmMoCoHKWM02Lb+mYyWOj1N4e1m5siVRrhes+v6y5vif6Cc8sQ/llthCbcgH8VyKCSTkqaANvMD3vdUyUSpDXQMorRO9tlind0ObIn8ossOsXSgMMxpMxuhxnfsopzxHbvZ8gvw2Zgiskyn3QMU5Ay0+hRlpTUoCtMSKyXWe15rhr7c5fJ9E0/BLjMkNDoNnvp5MjN7pcbQMYihUqQUVuY7j9P6e+DSM50Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkJpTDEOV/NhgHyFM+e4uQDJbN4TeUz8jCzJdL9i+S4=;
 b=CtpwVQEPKMoteIRrIdtf9OjJM431Z1bb1xPSKeZLxxgWo7y91yAcnkbjMf9d42pgpmdTGMDRp3QDqZ2FxqabcAjIlGjUqWhbjS8L13J3FT10C3K4gKQLtyv5eWrBkGr6q2ZhknKVxum+7k3ib6wTFPliyHjRXfLRnHkqii56tDtHPpb6boe3AYeQcupo2sAAMry0azdm+zipwKHqMYkqc5tnfUIwjX6vab9UQgN3jiXwSn54OX8fb6yuvYVSVjz0FxZ3NNH7BwDMFVe+yDCf2RPeg/JhbftMQsTb3dd2CARZr8A2+f8KHwr3lVYe6Xsoq8l8SzdwOaL5sP7AMdQHVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkJpTDEOV/NhgHyFM+e4uQDJbN4TeUz8jCzJdL9i+S4=;
 b=I+/duAwmcUfJkeZfcmifX6OczL7tSu6UPOQcdyXPNDHbP70kU+g5MsqsiXRmpnqo9fvR5VABzE1QqmyXFKvhRcVlt/IznOTxY1E0tQ8cMvVqCOultZSmsy1oOPdqFx7Nsd3uR4d3+2j8idvxLmYHwn6hZ1kzW2x3ELEMM+rluMY=
Received: from DM5PR18CA0067.namprd18.prod.outlook.com (2603:10b6:3:22::29) by
 DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Wed, 15 Dec 2021 06:36:21 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:22:cafe::a3) by DM5PR18CA0067.outlook.office365.com
 (2603:10b6:3:22::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17 via Frontend
 Transport; Wed, 15 Dec 2021 06:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 06:36:21 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 00:36:17 -0600
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, "Sumit
 Semwal" <sumit.semwal@linaro.org>
Subject: [PATCH v3] drm/amdgpu: introduce new amdgpu_fence object to indicate
 the job embedded fence
Date: Wed, 15 Dec 2021 14:35:51 +0800
Message-ID: <20211215063551.2810601-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f0bdeb9-50c1-4037-3760-08d9bf953539
X-MS-TrafficTypeDiagnostic: DM4PR12MB5165:EE_
X-Microsoft-Antispam-PRVS: <DM4PR12MB51656D10661E3385D4BD8402EC769@DM4PR12MB5165.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MLpmukgoMXfinB+YEdS1CWX8Q6/15fRuyqv4ooO4rdwzuV9S7yOg6SPKdYDdaMPVsRofU8JlA7VJwpmeUYbDPiT0PXv0NuL8XIuQDievv2JIXyzpXeww9x6tcj04ZEbzDbTUGF0m0aFscZvuzL2aZKpFGp6NhiwIScTX2Sh5anSulitjsVFsdNAEVavuuQb0TH6UkGGrwVE5X1azb2k0+78BVXJenVG6JO0qD195offHAXFah49XvW66DJb7xR8v9GnBu4vG6xxTlRwzTg1W0wLvGrrAX5ifth8e0MCheGahnMSRW3YaoqRYWhLsHk3DmyKlBuDkvvIKxgHV7JkpY+8uJNDCTqjxFW1kg+YB+PvaiCFF/9rz1cY57xmuR9l3DaWJi0G14elBwOo46EdNi511HM0/6am60Yv4GkRdgjHprDuGhVOwUqvm2LbkLojJnncFwZ5hw1Vej8wfeJ/pE7EvGgyf8/1LtSRXQ2GbjpGJ9H0Aa9hAY80ca0xZdIQ/eP/oBAG3/9lLSxF0CbIxqt8utzMzuo5sr0+htOd+lIWrkBXj8luqsP7Rnq6DkFNjAfm3SyHC38N5XIovo3SDtG0UbClJKk9nPR1HFVhU9+108V7m1ymyZw/pKJobgUdH+sHtFzvSDYl3N/KUSM+DTP/wO3rW76VSd/RIwv3L1IWddHXvLiqcu7+qbqkyWlLeKFac6KRcpdtv/Q5oF6UXs0/kz+8S4VafHlGvQjAvAaPW9O1y5E+v0SamXXuA58hvW3V1WFM9ffxwwmAQZyd52Jrj+8Q9NkHmIqMzLaICn3g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(70586007)(36860700001)(2906002)(356005)(8676002)(83380400001)(81166007)(36756003)(7696005)(426003)(40460700001)(8936002)(47076005)(70206006)(508600001)(86362001)(316002)(2616005)(5660300002)(6666004)(26005)(186003)(16526019)(4326008)(1076003)(30864003)(82310400004)(54906003)(336012)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 06:36:21.2672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f0bdeb9-50c1-4037-3760-08d9bf953539
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5165
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
Cc: Andrey
 Grodzovsky <andrey.grodzovsky@amd.com>, amd-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The job embedded fence donesn't initialize the flags at
dma_fence_init(). Then we will go a wrong way in
amdgpu_fence_get_timeline_name callback and trigger a null pointer panic
once we enabled the trace event here. So introduce new amdgpu_fence
object to indicate the job embedded fence.

[  156.131790] BUG: kernel NULL pointer dereference, address: 00000000000002a0
[  156.131804] #PF: supervisor read access in kernel mode
[  156.131811] #PF: error_code(0x0000) - not-present page
[  156.131817] PGD 0 P4D 0
[  156.131824] Oops: 0000 [#1] PREEMPT SMP PTI
[  156.131832] CPU: 6 PID: 1404 Comm: sdma0 Tainted: G           OE     5.16.0-rc1-custom #1
[  156.131842] Hardware name: Gigabyte Technology Co., Ltd. Z170XP-SLI/Z170XP-SLI-CF, BIOS F20 11/04/2016
[  156.131848] RIP: 0010:strlen+0x0/0x20
[  156.131859] Code: 89 c0 c3 0f 1f 80 00 00 00 00 48 01 fe eb 0f 0f b6 07 38 d0 74 10 48 83 c7 01 84 c0 74 05 48 39 f7 75 ec 31 c0 c3 48 89 f8 c3 <80> 3f 00 74 10 48 89 f8 48 83 c0 01 80 38 00 75 f7 48 29 f8 c3 31
[  156.131872] RSP: 0018:ffff9bd0018dbcf8 EFLAGS: 00010206
[  156.131880] RAX: 00000000000002a0 RBX: ffff8d0305ef01b0 RCX: 000000000000000b
[  156.131888] RDX: ffff8d03772ab924 RSI: ffff8d0305ef01b0 RDI: 00000000000002a0
[  156.131895] RBP: ffff9bd0018dbd60 R08: ffff8d03002094d0 R09: 0000000000000000
[  156.131901] R10: 000000000000005e R11: 0000000000000065 R12: ffff8d03002094d0
[  156.131907] R13: 000000000000001f R14: 0000000000070018 R15: 0000000000000007
[  156.131914] FS:  0000000000000000(0000) GS:ffff8d062ed80000(0000) knlGS:0000000000000000
[  156.131923] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  156.131929] CR2: 00000000000002a0 CR3: 000000001120a005 CR4: 00000000003706e0
[  156.131937] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  156.131942] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  156.131949] Call Trace:
[  156.131953]  <TASK>
[  156.131957]  ? trace_event_raw_event_dma_fence+0xcc/0x200
[  156.131973]  ? ring_buffer_unlock_commit+0x23/0x130
[  156.131982]  dma_fence_init+0x92/0xb0
[  156.131993]  amdgpu_fence_emit+0x10d/0x2b0 [amdgpu]
[  156.132302]  amdgpu_ib_schedule+0x2f9/0x580 [amdgpu]
[  156.132586]  amdgpu_job_run+0xed/0x220 [amdgpu]

Signed-off-by: Huang Rui <ray.huang@amd.com>
---

V1 -> V2: add another amdgpu_fence_ops which is for job-embedded fence.
V2 -> V3: use amdgpu_fence_driver_clear_job_fences abstract the job fence
clearing operation.

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  11 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 126 ++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   4 +-
 3 files changed, 90 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5625f7736e37..fecf7a09e5a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4456,7 +4456,7 @@ int amdgpu_device_mode1_reset(struct amdgpu_device *adev)
 int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 				 struct amdgpu_reset_context *reset_context)
 {
-	int i, j, r = 0;
+	int i, r = 0;
 	struct amdgpu_job *job = NULL;
 	bool need_full_reset =
 		test_bit(AMDGPU_NEED_FULL_RESET, &reset_context->flags);
@@ -4478,15 +4478,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 
 		/*clear job fence from fence drv to avoid force_completion
 		 *leave NULL and vm flush fence in fence drv */
-		for (j = 0; j <= ring->fence_drv.num_fences_mask; j++) {
-			struct dma_fence *old, **ptr;
+		amdgpu_fence_driver_clear_job_fences(ring);
 
-			ptr = &ring->fence_drv.fences[j];
-			old = rcu_dereference_protected(*ptr, 1);
-			if (old && test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &old->flags)) {
-				RCU_INIT_POINTER(*ptr, NULL);
-			}
-		}
 		/* after all hw jobs are reset, hw fence is meaningless, so force_completion */
 		amdgpu_fence_driver_force_completion(ring);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 3b7e86ea7167..db41d16838b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -77,11 +77,13 @@ void amdgpu_fence_slab_fini(void)
  * Cast helper
  */
 static const struct dma_fence_ops amdgpu_fence_ops;
+static const struct dma_fence_ops amdgpu_job_fence_ops;
 static inline struct amdgpu_fence *to_amdgpu_fence(struct dma_fence *f)
 {
 	struct amdgpu_fence *__f = container_of(f, struct amdgpu_fence, base);
 
-	if (__f->base.ops == &amdgpu_fence_ops)
+	if (__f->base.ops == &amdgpu_fence_ops ||
+	    __f->base.ops == &amdgpu_job_fence_ops)
 		return __f;
 
 	return NULL;
@@ -158,19 +160,18 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 	}
 
 	seq = ++ring->fence_drv.sync_seq;
-	if (job != NULL && job->job_run_counter) {
+	if (job && job->job_run_counter) {
 		/* reinit seq for resubmitted jobs */
 		fence->seqno = seq;
 	} else {
-		dma_fence_init(fence, &amdgpu_fence_ops,
-				&ring->fence_drv.lock,
-				adev->fence_context + ring->idx,
-				seq);
-	}
-
-	if (job != NULL) {
-		/* mark this fence has a parent job */
-		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
+		if (job)
+			dma_fence_init(fence, &amdgpu_job_fence_ops,
+				       &ring->fence_drv.lock,
+				       adev->fence_context + ring->idx, seq);
+		else
+			dma_fence_init(fence, &amdgpu_fence_ops,
+				       &ring->fence_drv.lock,
+				       adev->fence_context + ring->idx, seq);
 	}
 
 	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
@@ -620,6 +621,25 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev)
 	}
 }
 
+/**
+ * amdgpu_fence_clear_job_fences - clear job embedded fences of ring
+ *
+ * @ring: fence of the ring to be cleared
+ *
+ */
+void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring)
+{
+	int i;
+	struct dma_fence *old, **ptr;
+
+	for (i = 0; i <= ring->fence_drv.num_fences_mask; i++) {
+		ptr = &ring->fence_drv.fences[i];
+		old = rcu_dereference_protected(*ptr, 1);
+		if (old && old->ops == &amdgpu_job_fence_ops)
+			RCU_INIT_POINTER(*ptr, NULL);
+	}
+}
+
 /**
  * amdgpu_fence_driver_force_completion - force signal latest fence of ring
  *
@@ -643,16 +663,14 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
 
 static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct amdgpu_ring *ring;
+	return (const char *)to_amdgpu_fence(f)->ring->name;
+}
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
+static const char *amdgpu_job_fence_get_timeline_name(struct dma_fence *f)
+{
+	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
 
-		ring = to_amdgpu_ring(job->base.sched);
-	} else {
-		ring = to_amdgpu_fence(f)->ring;
-	}
-	return (const char *)ring->name;
+	return (const char *)to_amdgpu_ring(job->base.sched)->name;
 }
 
 /**
@@ -665,18 +683,25 @@ static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
  */
 static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
 {
-	struct amdgpu_ring *ring;
+	if (!timer_pending(&to_amdgpu_fence(f)->ring->fence_drv.fallback_timer))
+		amdgpu_fence_schedule_fallback(to_amdgpu_fence(f)->ring);
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
+	return true;
+}
 
-		ring = to_amdgpu_ring(job->base.sched);
-	} else {
-		ring = to_amdgpu_fence(f)->ring;
-	}
+/**
+ * amdgpu_job_fence_enable_signaling - enable signalling on job fence
+ * @f: fence
+ *
+ * This is the simliar function with amdgpu_fence_enable_signaling above, it
+ * only handles the job embedded fence.
+ */
+static bool amdgpu_job_fence_enable_signaling(struct dma_fence *f)
+{
+	struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
 
-	if (!timer_pending(&ring->fence_drv.fallback_timer))
-		amdgpu_fence_schedule_fallback(ring);
+	if (!timer_pending(&to_amdgpu_ring(job->base.sched)->fence_drv.fallback_timer))
+		amdgpu_fence_schedule_fallback(to_amdgpu_ring(job->base.sched));
 
 	return true;
 }
@@ -692,19 +717,23 @@ static void amdgpu_fence_free(struct rcu_head *rcu)
 {
 	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
 
-	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
-	/* free job if fence has a parent job */
-		struct amdgpu_job *job;
-
-		job = container_of(f, struct amdgpu_job, hw_fence);
-		kfree(job);
-	} else {
 	/* free fence_slab if it's separated fence*/
-		struct amdgpu_fence *fence;
+	kmem_cache_free(amdgpu_fence_slab, to_amdgpu_fence(f));
+}
 
-		fence = to_amdgpu_fence(f);
-		kmem_cache_free(amdgpu_fence_slab, fence);
-	}
+/**
+ * amdgpu_job_fence_free - free up the job with embedded fence
+ *
+ * @rcu: RCU callback head
+ *
+ * Free up the job with embedded fence after the RCU grace period.
+ */
+static void amdgpu_job_fence_free(struct rcu_head *rcu)
+{
+	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
+
+	/* free job if fence has a parent job */
+	kfree(container_of(f, struct amdgpu_job, hw_fence));
 }
 
 /**
@@ -720,6 +749,19 @@ static void amdgpu_fence_release(struct dma_fence *f)
 	call_rcu(&f->rcu, amdgpu_fence_free);
 }
 
+/**
+ * amdgpu_job_fence_release - callback that job embedded fence can be freed
+ *
+ * @f: fence
+ *
+ * This is the simliar function with amdgpu_fence_release above, it
+ * only handles the job embedded fence.
+ */
+static void amdgpu_job_fence_release(struct dma_fence *f)
+{
+	call_rcu(&f->rcu, amdgpu_job_fence_free);
+}
+
 static const struct dma_fence_ops amdgpu_fence_ops = {
 	.get_driver_name = amdgpu_fence_get_driver_name,
 	.get_timeline_name = amdgpu_fence_get_timeline_name,
@@ -727,6 +769,12 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
 	.release = amdgpu_fence_release,
 };
 
+static const struct dma_fence_ops amdgpu_job_fence_ops = {
+	.get_driver_name = amdgpu_fence_get_driver_name,
+	.get_timeline_name = amdgpu_job_fence_get_timeline_name,
+	.enable_signaling = amdgpu_job_fence_enable_signaling,
+	.release = amdgpu_job_fence_release,
+};
 
 /*
  * Fence debugfs
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 4d380e79752c..fae7d185ad0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -53,9 +53,6 @@ enum amdgpu_ring_priority_level {
 #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
 #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
 
-/* fence flag bit to indicate the face is embedded in job*/
-#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
-
 #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
 
 #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
@@ -114,6 +111,7 @@ struct amdgpu_fence_driver {
 	struct dma_fence		**fences;
 };
 
+void amdgpu_fence_driver_clear_job_fences(struct amdgpu_ring *ring);
 void amdgpu_fence_driver_force_completion(struct amdgpu_ring *ring);
 
 int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
-- 
2.25.1

