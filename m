Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 610486027FA
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Oct 2022 11:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19A310E1F9;
	Tue, 18 Oct 2022 09:09:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD0210E1F9
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Oct 2022 09:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFAaKp+CC3GjKviq8k78pcc05X6zNyCtEZ6pRACGwoKz45Sb2C79rcum3rrs0NIdT6obkoXPjGpD8OR67UxkgI6ca5lKCmlrPrxERrVYouQipddDSG6JXYpPtzKnr+baZm4TaR41hJtI/OfTj6mfIUIE2tdRQRy3Q/PIDTh70EJRM+Xx6t7IrG5b3e/H23mrHWN6egHlsXKm3bdQlfo5+XAuQkCq8Ek9A1mbZVXYoduxsVd2ysDXaQsSwwqnIvWRiHjOk5zK3Irwkl0XqFKINfucTUQZ/edaVOZyhijBs5gXvyg0vEZs8FU4c1GTTSI7xLtdOemzQH8ROxqUIKLqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+MuTeT6SR14K40rlSbJHmRIcIfE2q81owuMA9gvDfA=;
 b=mlAAbK0wLGMS+lWZRDip3YbGQY4IEyQ5voB/aihuHeT8hv1+P0fQMp8kUOiBpZ0xTLvVWoBoJOwNy8lVn6h2sMLTOFn8UKE/r8+AQukRXQfuRNaHewvBmdYUdNSmQ/s3jVrPa8UW3YRtIGA9WAgoXceNWvt2Hk7/LS0PhcW0WdKFIeGWCa1wI98fjqyNywQ9PBRXT9uE+/vIJnKIHPb4uiEXf7sItboRqe1sCSBMZow7dbCHiNuJ2+b5TewgfxDufrHaat/y0DiOrzubaWfjUnc6iD2oPqa7i6NHwRwRS7zAqupDZnRLZKUDrBj2c8seaSZE3Btc7OFaXE3we9js4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+MuTeT6SR14K40rlSbJHmRIcIfE2q81owuMA9gvDfA=;
 b=w1lur2XbJ1rBiytzG+6vcWqo7rsSFm0cJl56XJM4L/YV+mz/gJBnhTLC3jYqcATA/6mILi1mEUc9sm1vziQAa4/AspnFt+mzYl/W79D90YQdk8TF+1GcxgpPD5cuE4kxKHo5qlsH6jZ1zOYLo3wenWVgTmRZlRweL4TvXEuWY3E=
Received: from BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 09:09:30 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::4e) by BN0PR02CA0026.outlook.office365.com
 (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Tue, 18 Oct 2022 09:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Tue, 18 Oct 2022 09:09:30 +0000
Received: from jenkins-jiadong-1.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 04:08:48 -0500
From: <jiadong.zhu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/amdgpu: MCBP based on DRM scheduler (v8)
Date: Tue, 18 Oct 2022 17:08:14 +0800
Message-ID: <20221018090815.2662321-4-jiadong.zhu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221018090815.2662321-1-jiadong.zhu@amd.com>
References: <20221018090815.2662321-1-jiadong.zhu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3bf601-7b1c-4120-e8c1-08dab0e8770e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S5L3a4S6xod0aBCMpNeuSuVqZyuP1YYGCpt7JhQ1TdUEjbSXiLkZ8S+sW2SmwTcZIyu9fHmzoMfNOixFmR/k6kCHX41t29ehy6JZcR6P3YFg3wFnsbFbVohVWFoRkJRuwsHZR+rTIN5iJ+roi0GlQot/dFVgK5aS3oAtlt9H8K/Q9jfxpWHrmx5JrZIj99wdrw/uh3+n6Kq+1utJTVFUOWwbza0Umo378uO3/O+Np58tQTPR8dJswFHyn1YROMNfZDilHHaTzPvkj7CClFNRrxf/aDZplukc78J5hO9aLqSFP4Fz/nacCycu3m8VZoULxYeeiK8VJFQuHREM44tC6h0B5IB6XsXlTU/25FoJKjF9UBAMUjknLCCHANpmPyPlkwwlFNIhxYcMvjellrk8xXPCVHbFCee1gsBRhor/gfMBHnk4IT8XS6k6Bu1ldYme7rJ5Uyjq9kkQ10n6pFlr+Xzfhe6Gu+CPosQCvvApavrqcgRqgo/Jf9KVwI2dUsxsgcrOgN05MH34SoO0cCjsG8vdUFFhS66l5SrwSrtYnkOJumWGEmXf7ppw6QTDXQcvEzirI+Z7sg+yBGmQrnSHF0xNgchm4n3sx/ZZ2Ocr8FdoIAnc6iCvR9tvdtvLatWdp/cp7kNC/HLkHfZTVnNKBlzAIZWPLONI3sOOpSBVcsDAtrR4FNpIRYOKwCkAbaYn+KuqfkbHNgmjrqFwV4NcQrsnlG149HLU5phrYCBWM96IpDIEP+KP3OdIBblQ0HWBoTxvfyqiz9Jq/OyoAQF1IAUokR6fA1kf7a/hMR9udFph2EyM77pIajGqsefo5U8a
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(66574015)(426003)(47076005)(81166007)(83380400001)(82310400005)(82740400003)(356005)(36756003)(86362001)(40480700001)(40460700003)(36860700001)(6666004)(70586007)(70206006)(316002)(6916009)(54906003)(5660300002)(30864003)(2876002)(8936002)(186003)(336012)(16526019)(1076003)(2906002)(2616005)(478600001)(7696005)(26005)(41300700001)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 09:09:30.2401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3bf601-7b1c-4120-e8c1-08dab0e8770e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Huang Rui <ray.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 "Jiadong.Zhu" <Jiadong.Zhu@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Jiadong.Zhu" <Jiadong.Zhu@amd.com>

Trigger Mid-Command Buffer Preemption according to the priority of the software
rings and the hw fence signalling condition.

The muxer saves the locations of the indirect buffer frames from the software
ring together with the fence sequence number in its fifo queue, and pops out
those records when the fences are signalled. The locations are used to resubmit
packages in preemption scenarios by coping the chunks from the software ring.

v2: Update comment style.
v3: Fix conflict caused by previous modifications.
v4: Remove unnecessary prints.
v5: Fix corner cases for resubmission cases.
v6: Refactor functions for resubmission, calling fence_process in irq handler.
v7: Solve conflict for removing amdgpu_sw_ring.c.
v8: Add time threshold to judge if preemption request is needed.

Cc: Christian Koenig <Christian.Koenig@amd.com>
Cc: Luben Tuikov <Luben.Tuikov@amd.com>
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Cc: Michel Dänzer <michel@daenzer.net>
Signed-off-by: Jiadong.Zhu <Jiadong.Zhu@amd.com>
Acked-by: Luben Tuikov <luben.tuikov@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c    |  53 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c       |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c     |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h     |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c | 353 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h |  29 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |   2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        |   7 +-
 8 files changed, 420 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 790f7bfdc654..470448bc1ebb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -54,6 +54,7 @@ struct amdgpu_fence {
 
 	/* RB, DMA, etc. */
 	struct amdgpu_ring		*ring;
+	ktime_t				start_timestamp;
 };
 
 static struct kmem_cache *amdgpu_fence_slab;
@@ -199,6 +200,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amd
 	rcu_assign_pointer(*ptr, dma_fence_get(fence));
 
 	*f = fence;
+	to_amdgpu_fence(fence)->start_timestamp = ktime_get();
 
 	return 0;
 }
@@ -400,6 +402,57 @@ unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring)
 	return lower_32_bits(emitted);
 }
 
+/**
+ * amdgpu_fence_last_unsignaled_time_us - the time fence emited till now
+ * @ring: ring the fence is associated with
+ *
+ * Find the earlist fence unsignaled till now, calculate the time delta
+ * between the time fence emitted and now.
+ */
+u64 amdgpu_fence_last_unsignaled_time_us(struct amdgpu_ring *ring)
+{
+	struct amdgpu_fence_driver *drv = &ring->fence_drv;
+	struct dma_fence *fence;
+	uint32_t last_seq, sync_seq;
+
+	last_seq = atomic_read(&ring->fence_drv.last_seq);
+	sync_seq = READ_ONCE(ring->fence_drv.sync_seq);
+	if (last_seq == sync_seq)
+		return 0;
+
+	++last_seq;
+	last_seq &= drv->num_fences_mask;
+	fence = drv->fences[last_seq];
+	if (!fence)
+		return 0;
+
+	return ktime_us_delta(ktime_get(),
+		to_amdgpu_fence(fence)->start_timestamp);
+}
+
+/**
+ * amdgpu_fence_update_start_timestamp - update the timestamp of the fence
+ * @ring: ring the fence is associated with
+ * @seq: the fence seq number to update.
+ * @timestamp: the start timestamp to update.
+ *
+ * The function called at the time the fence and related ib is about to
+ * resubmit to gpu in MCBP scenario. Thus we do not consider race condition
+ * with amdgpu_fence_process to modify the same fence.
+ */
+void amdgpu_fence_update_start_timestamp(struct amdgpu_ring *ring, uint32_t seq, ktime_t timestamp)
+{
+	struct amdgpu_fence_driver *drv = &ring->fence_drv;
+	struct dma_fence *fence;
+
+	seq &= drv->num_fences_mask;
+	fence = drv->fences[seq];
+	if (!fence)
+		return;
+
+	to_amdgpu_fence(fence)->start_timestamp = timestamp;
+}
+
 /**
  * amdgpu_fence_driver_start_ring - make the fence driver
  * ready for use on the requested ring.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 258cffe3c06a..af86d87e2f3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -211,6 +211,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 		}
 	}
 
+	amdgpu_ring_ib_begin(ring);
 	if (job && ring->funcs->init_cond_exec)
 		patch_offset = amdgpu_ring_init_cond_exec(ring);
 
@@ -285,6 +286,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 	    ring->hw_prio == AMDGPU_GFX_PIPE_PRIO_HIGH)
 		ring->funcs->emit_wave_limit(ring, false);
 
+	amdgpu_ring_ib_end(ring);
 	amdgpu_ring_commit(ring);
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 13db99d653bd..1f15f9242e99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -569,3 +569,15 @@ int amdgpu_ring_init_mqd(struct amdgpu_ring *ring)
 
 	return mqd_mgr->init_mqd(adev, ring->mqd_ptr, &prop);
 }
+
+void amdgpu_ring_ib_begin(struct amdgpu_ring *ring)
+{
+	if (ring->is_sw_ring)
+		amdgpu_sw_ring_ib_begin(ring);
+}
+
+void amdgpu_ring_ib_end(struct amdgpu_ring *ring)
+{
+	if (ring->is_sw_ring)
+		amdgpu_sw_ring_ib_end(ring);
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index e90d327a589e..8f82fd0d47c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -145,6 +145,9 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
 				      uint32_t wait_seq,
 				      signed long timeout);
 unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
+u64 amdgpu_fence_last_unsignaled_time_us(struct amdgpu_ring *ring);
+void amdgpu_fence_update_start_timestamp(struct amdgpu_ring *ring, uint32_t seq,
+					 ktime_t timestamp);
 
 /*
  * Rings.
@@ -312,6 +315,9 @@ struct amdgpu_ring {
 #define amdgpu_ring_preempt_ib(r) (r)->funcs->preempt_ib(r)
 
 int amdgpu_ring_alloc(struct amdgpu_ring *ring, unsigned ndw);
+void amdgpu_ring_ib_begin(struct amdgpu_ring *ring);
+void amdgpu_ring_ib_end(struct amdgpu_ring *ring);
+
 void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count);
 void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib);
 void amdgpu_ring_commit(struct amdgpu_ring *ring);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
index 2e64ffccc030..41b057b9358e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
@@ -28,6 +28,7 @@
 #include "amdgpu.h"
 
 #define AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT (HZ / 2)
+#define AMDGPU_MAX_LAST_UNSIGNALED_THRESHOLD_US 10000
 
 static const struct ring_info {
 	unsigned int hw_pio;
@@ -37,23 +38,145 @@ static const struct ring_info {
 	{ AMDGPU_RING_PRIO_2, "gfx_high"},
 };
 
+static struct kmem_cache *amdgpu_mux_chunk_slab;
+
+static inline struct amdgpu_mux_entry *amdgpu_ring_mux_sw_entry(struct amdgpu_ring_mux *mux,
+								struct amdgpu_ring *ring)
+{
+	return ring->entry_index < mux->ring_entry_size ?
+			&mux->ring_entry[ring->entry_index] : NULL;
+}
+
+/* copy packages on sw ring range[begin, end) */
+static void amdgpu_ring_mux_copy_pkt_from_sw_ring(struct amdgpu_ring_mux *mux,
+						  struct amdgpu_ring *ring,
+						  u64 s_start, u64 s_end)
+{
+	u64 start, end;
+	struct amdgpu_ring *real_ring = mux->real_ring;
+
+	start = s_start & ring->buf_mask;
+	end = s_end & ring->buf_mask;
+
+	if (start == end) {
+		DRM_ERROR("no more data copied from sw ring\n");
+		return;
+	}
+	if (start > end) {
+		amdgpu_ring_alloc(real_ring, (ring->ring_size >> 2) + end - start);
+		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start],
+					   (ring->ring_size >> 2) - start);
+		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[0], end);
+	} else {
+		amdgpu_ring_alloc(real_ring, end - start);
+		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start], end - start);
+	}
+}
+
+static void amdgpu_mux_resubmit_chunks(struct amdgpu_ring_mux *mux)
+{
+	struct amdgpu_mux_entry *e = NULL;
+	struct amdgpu_mux_chunk *chunk;
+	uint32_t seq, last_seq;
+	int i;
+
+	/*find low priority entries:*/
+	if (!mux->s_resubmit)
+		return;
+
+	for (i = 0; i < mux->num_ring_entries; i++) {
+		if (mux->ring_entry[i].ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT) {
+			e = &mux->ring_entry[i];
+			break;
+		}
+	}
+
+	if (!e) {
+		DRM_ERROR("%s no low priority ring found\n", __func__);
+		return;
+	}
+
+	last_seq = atomic_read(&e->ring->fence_drv.last_seq);
+	seq = mux->seqno_to_resubmit;
+	if (last_seq < seq) {
+		/*resubmit all the fences between (last_seq, seq]*/
+		list_for_each_entry(chunk, &e->list, entry) {
+			if (chunk->sync_seq > last_seq && chunk->sync_seq <= seq) {
+				amdgpu_fence_update_start_timestamp(e->ring,
+								    chunk->sync_seq,
+								    ktime_get());
+				amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, e->ring,
+								      chunk->start,
+								      chunk->end);
+				mux->wptr_resubmit = chunk->end;
+				amdgpu_ring_commit(mux->real_ring);
+			}
+		}
+	}
+
+	del_timer(&mux->resubmit_timer);
+	mux->s_resubmit = false;
+}
+
+static void amdgpu_ring_mux_schedule_resubmit(struct amdgpu_ring_mux *mux)
+{
+	mod_timer(&mux->resubmit_timer, jiffies + AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT);
+}
+
+static void amdgpu_mux_resubmit_fallback(struct timer_list *t)
+{
+	struct amdgpu_ring_mux *mux = from_timer(mux, t, resubmit_timer);
+
+	if (!spin_trylock(&mux->lock)) {
+		amdgpu_ring_mux_schedule_resubmit(mux);
+		DRM_ERROR("reschedule resubmit\n");
+		return;
+	}
+	amdgpu_mux_resubmit_chunks(mux);
+	spin_unlock(&mux->lock);
+}
+
 int amdgpu_ring_mux_init(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring,
 			 unsigned int entry_size)
 {
 	mux->real_ring = ring;
 	mux->num_ring_entries = 0;
+
 	mux->ring_entry = kcalloc(entry_size, sizeof(struct amdgpu_mux_entry), GFP_KERNEL);
 	if (!mux->ring_entry)
 		return -ENOMEM;
 
 	mux->ring_entry_size = entry_size;
+	mux->s_resubmit = false;
+
+	amdgpu_mux_chunk_slab = kmem_cache_create("amdgpu_mux_chunk",
+						  sizeof(struct amdgpu_mux_chunk), 0,
+						  SLAB_HWCACHE_ALIGN, NULL);
+	if (!amdgpu_mux_chunk_slab) {
+		DRM_ERROR("create amdgpu_mux_chunk cache failed\n");
+		return -ENOMEM;
+	}
+
 	spin_lock_init(&mux->lock);
+	timer_setup(&mux->resubmit_timer, amdgpu_mux_resubmit_fallback, 0);
 
 	return 0;
 }
 
 void amdgpu_ring_mux_fini(struct amdgpu_ring_mux *mux)
 {
+	struct amdgpu_mux_entry *e;
+	struct amdgpu_mux_chunk *chunk, *chunk2;
+	int i;
+
+	for (i = 0; i < mux->num_ring_entries; i++) {
+		e = &mux->ring_entry[i];
+		list_for_each_entry_safe(chunk, chunk2, &e->list, entry) {
+			list_del(&chunk->entry);
+			kmem_cache_free(amdgpu_mux_chunk_slab, chunk);
+		}
+	}
+	kmem_cache_destroy(amdgpu_mux_chunk_slab);
 	kfree(mux->ring_entry);
 	mux->ring_entry = NULL;
 	mux->num_ring_entries = 0;
@@ -73,62 +196,48 @@ int amdgpu_ring_mux_add_sw_ring(struct amdgpu_ring_mux *mux, struct amdgpu_ring
 	ring->entry_index = mux->num_ring_entries;
 	e->ring = ring;
 
+	INIT_LIST_HEAD(&e->list);
 	mux->num_ring_entries += 1;
 	return 0;
 }
 
-static inline struct amdgpu_mux_entry *amdgpu_ring_mux_sw_entry(struct amdgpu_ring_mux *mux,
-								struct amdgpu_ring *ring)
-{
-	return ring->entry_index < mux->ring_entry_size ?
-			&mux->ring_entry[ring->entry_index] : NULL;
-}
-
-/* copy packages on sw ring range[begin, end) */
-static void amdgpu_ring_mux_copy_pkt_from_sw_ring(struct amdgpu_ring_mux *mux,
-						  struct amdgpu_ring *ring,
-						  u64 s_start, u64 s_end)
-{
-	u64 start, end;
-	struct amdgpu_ring *real_ring = mux->real_ring;
-
-	start = s_start & ring->buf_mask;
-	end = s_end & ring->buf_mask;
-
-	if (start == end) {
-		DRM_ERROR("no more data copied from sw ring\n");
-		return;
-	}
-	if (start > end) {
-		amdgpu_ring_alloc(real_ring, (ring->ring_size >> 2) + end - start);
-		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start],
-					   (ring->ring_size >> 2) - start);
-		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[0], end);
-	} else {
-		amdgpu_ring_alloc(real_ring, end - start);
-		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start], end - start);
-	}
-}
-
 void amdgpu_ring_mux_set_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring, u64 wptr)
 {
 	struct amdgpu_mux_entry *e;
 
+	spin_lock(&mux->lock);
+
+	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT)
+		amdgpu_mux_resubmit_chunks(mux);
+
 	e = amdgpu_ring_mux_sw_entry(mux, ring);
 	if (!e) {
 		DRM_ERROR("cannot find entry for sw ring\n");
+		spin_unlock(&mux->lock);
+		return;
+	}
+
+	/* We could skip this set wptr as preemption in process. */
+	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT && mux->pending_trailing_fence_signaled) {
+		spin_unlock(&mux->lock);
 		return;
 	}
 
-	spin_lock(&mux->lock);
 	e->sw_cptr = e->sw_wptr;
+	/* Update cptr if the package already copied in resubmit functions */
+	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT && e->sw_cptr < mux->wptr_resubmit)
+		e->sw_cptr = mux->wptr_resubmit;
 	e->sw_wptr = wptr;
 	e->start_ptr_in_hw_ring = mux->real_ring->wptr;
 
-	amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, ring, e->sw_cptr, wptr);
-	e->end_ptr_in_hw_ring = mux->real_ring->wptr;
-	amdgpu_ring_commit(mux->real_ring);
-
+	/* Skip copying for the packages already resubmitted.*/
+	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT || mux->wptr_resubmit < wptr) {
+		amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, ring, e->sw_cptr, wptr);
+		e->end_ptr_in_hw_ring = mux->real_ring->wptr;
+		amdgpu_ring_commit(mux->real_ring);
+	} else {
+		e->end_ptr_in_hw_ring = mux->real_ring->wptr;
+	}
 	spin_unlock(&mux->lock);
 }
 
@@ -145,7 +254,7 @@ u64 amdgpu_ring_mux_get_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ri
 	return e->sw_wptr;
 }
 
-/*
+/**
  * The return value of the readptr is not precise while the other rings could
  * write data onto the real ring buffer.After overwriting on the real ring, we
  * can not decide if our packages have been excuted or not read yet. However,
@@ -235,3 +344,169 @@ unsigned int amdgpu_sw_ring_priority(int idx)
 	return idx < ARRAY_SIZE(sw_ring_info) ?
 		sw_ring_info[idx].hw_pio : AMDGPU_RING_PRIO_DEFAULT;
 }
+
+/*Scan on low prio rings to have unsignaled fence and high ring has no fence.*/
+int amdgpu_mcbp_scan(struct amdgpu_ring_mux *mux)
+{
+	struct amdgpu_ring *ring;
+	int i, need_preempt;
+
+	need_preempt = 0;
+	for (i = 0; i < mux->num_ring_entries; i++) {
+		ring = mux->ring_entry[i].ring;
+		if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT &&
+		    amdgpu_fence_count_emitted(ring) > 0)
+			return 0;
+		if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT &&
+		    amdgpu_fence_last_unsignaled_time_us(ring) >
+		    AMDGPU_MAX_LAST_UNSIGNALED_THRESHOLD_US)
+			need_preempt = 1;
+	}
+	return need_preempt && !mux->s_resubmit;
+}
+
+/* Trigger Mid-Command Buffer Preemption (MCBP) and find if we need to resubmit. */
+int amdgpu_mcbp_trigger_preempt(struct amdgpu_ring_mux *mux)
+{
+	int r;
+
+	spin_lock(&mux->lock);
+	mux->pending_trailing_fence_signaled = true;
+	r = amdgpu_ring_preempt_ib(mux->real_ring);
+	spin_unlock(&mux->lock);
+	return r;
+}
+
+void amdgpu_sw_ring_ib_begin(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_ring_mux *mux = &adev->gfx.muxer;
+
+	WARN_ON(!ring->is_sw_ring);
+	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT) {
+		if (amdgpu_mcbp_scan(mux) > 0)
+			amdgpu_mcbp_trigger_preempt(mux);
+		return;
+	}
+
+	amdgpu_ring_mux_start_ib(mux, ring);
+}
+
+void amdgpu_sw_ring_ib_end(struct amdgpu_ring *ring)
+{
+	struct amdgpu_device *adev = ring->adev;
+	struct amdgpu_ring_mux *mux = &adev->gfx.muxer;
+
+	WARN_ON(!ring->is_sw_ring);
+	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT)
+		return;
+	amdgpu_ring_mux_end_ib(mux, ring);
+}
+
+void amdgpu_ring_mux_start_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
+{
+	struct amdgpu_mux_entry *e;
+	struct amdgpu_mux_chunk *chunk;
+
+	spin_lock(&mux->lock);
+	amdgpu_mux_resubmit_chunks(mux);
+	spin_unlock(&mux->lock);
+
+	e = amdgpu_ring_mux_sw_entry(mux, ring);
+	if (!e) {
+		DRM_ERROR("cannot find entry!\n");
+		return;
+	}
+
+	chunk = kmem_cache_alloc(amdgpu_mux_chunk_slab, GFP_KERNEL);
+	if (!chunk) {
+		DRM_ERROR("alloc amdgpu_mux_chunk_slab failed\n");
+		return;
+	}
+
+	chunk->start = ring->wptr;
+	list_add_tail(&chunk->entry, &e->list);
+}
+
+static void scan_and_remove_signaled_chunk(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
+{
+	uint32_t last_seq, size = 0;
+	struct amdgpu_mux_entry *e;
+	struct amdgpu_mux_chunk *chunk, *tmp;
+
+	e = amdgpu_ring_mux_sw_entry(mux, ring);
+	if (!e) {
+		DRM_ERROR("cannot find entry!\n");
+		return;
+	}
+
+	last_seq = atomic_read(&ring->fence_drv.last_seq);
+
+	list_for_each_entry_safe(chunk, tmp, &e->list, entry) {
+		if (chunk->sync_seq <= last_seq) {
+			list_del(&chunk->entry);
+			kmem_cache_free(amdgpu_mux_chunk_slab, chunk);
+		} else {
+			size++;
+		}
+	}
+}
+
+void amdgpu_ring_mux_end_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
+{
+	struct amdgpu_mux_entry *e;
+	struct amdgpu_mux_chunk *chunk;
+
+	e = amdgpu_ring_mux_sw_entry(mux, ring);
+	if (!e) {
+		DRM_ERROR("cannot find entry!\n");
+		return;
+	}
+
+	chunk = list_last_entry(&e->list, struct amdgpu_mux_chunk, entry);
+	if (!chunk) {
+		DRM_ERROR("cannot find chunk!\n");
+		return;
+	}
+
+	chunk->end = ring->wptr;
+	chunk->sync_seq = READ_ONCE(ring->fence_drv.sync_seq);
+
+	scan_and_remove_signaled_chunk(mux, ring);
+}
+
+bool amdgpu_mcbp_handle_trailing_fence_irq(struct amdgpu_ring_mux *mux)
+{
+	struct amdgpu_mux_entry *e;
+	struct amdgpu_ring *ring = NULL;
+	int i;
+
+	if (!mux->pending_trailing_fence_signaled)
+		return false;
+
+	if (mux->real_ring->trail_seq != le32_to_cpu(*mux->real_ring->trail_fence_cpu_addr))
+		return false;
+
+	for (i = 0; i < mux->num_ring_entries; i++) {
+		e = &mux->ring_entry[i];
+		if (e->ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT) {
+			ring = e->ring;
+			break;
+		}
+	}
+
+	if (!ring) {
+		DRM_ERROR("cannot find low priority ring\n");
+		return false;
+	}
+
+	amdgpu_fence_process(ring);
+	if (amdgpu_fence_count_emitted(ring) > 0) {
+		mux->s_resubmit = true;
+		mux->seqno_to_resubmit = ring->fence_drv.sync_seq;
+		amdgpu_ring_mux_schedule_resubmit(mux);
+	}
+
+	mux->pending_trailing_fence_signaled = false;
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
index 28399f4b0e5c..aa758ebc86ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
@@ -29,6 +29,7 @@
 #include "amdgpu_ring.h"
 
 struct amdgpu_ring;
+
 /**
  * struct amdgpu_mux_entry - the entry recording software rings copying information.
  * @ring: the pointer to the software ring.
@@ -37,6 +38,7 @@ struct amdgpu_ring;
  * @sw_cptr: the position of the copy pointer in the sw ring.
  * @sw_rptr: the read pointer in software ring.
  * @sw_wptr: the write pointer in software ring.
+ * @list: list head for amdgpu_mux_chunk
  */
 struct amdgpu_mux_entry {
 	struct                  amdgpu_ring *ring;
@@ -45,6 +47,7 @@ struct amdgpu_mux_entry {
 	u64                     sw_cptr;
 	u64                     sw_rptr;
 	u64                     sw_wptr;
+	struct list_head        list;
 };
 
 struct amdgpu_ring_mux {
@@ -55,6 +58,26 @@ struct amdgpu_ring_mux {
 	unsigned int            ring_entry_size;
 	/*the lock for copy data from different software rings*/
 	spinlock_t              lock;
+	bool                    s_resubmit;
+	uint32_t                seqno_to_resubmit;
+	u64                     wptr_resubmit;
+	struct timer_list       resubmit_timer;
+
+	bool                    pending_trailing_fence_signaled;
+};
+
+/**
+ * struct amdgpu_mux_chunk - save the location of indirect buffer's package on softare rings.
+ * @entry: the list entry.
+ * @sync_seq: the fence seqno related with the saved IB.
+ * @start:- start location on the software ring.
+ * @end:- end location on the software ring.
+ */
+struct amdgpu_mux_chunk {
+	struct list_head        entry;
+	uint32_t                sync_seq;
+	u64                     start;
+	u64                     end;
 };
 
 int amdgpu_ring_mux_init(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring,
@@ -64,15 +87,17 @@ int amdgpu_ring_mux_add_sw_ring(struct amdgpu_ring_mux *mux, struct amdgpu_ring
 void amdgpu_ring_mux_set_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring, u64 wptr);
 u64 amdgpu_ring_mux_get_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
 u64 amdgpu_ring_mux_get_rptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
+void amdgpu_ring_mux_start_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
+void amdgpu_ring_mux_end_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
+bool amdgpu_mcbp_handle_trailing_fence_irq(struct amdgpu_ring_mux *mux);
 
 u64 amdgpu_sw_ring_get_rptr_gfx(struct amdgpu_ring *ring);
 u64 amdgpu_sw_ring_get_wptr_gfx(struct amdgpu_ring *ring);
 void amdgpu_sw_ring_set_wptr_gfx(struct amdgpu_ring *ring);
-
 void amdgpu_sw_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count);
 void amdgpu_sw_ring_ib_begin(struct amdgpu_ring *ring);
 void amdgpu_sw_ring_ib_end(struct amdgpu_ring *ring);
-
 const char *amdgpu_sw_ring_name(int idx);
 unsigned int amdgpu_sw_ring_priority(int idx);
+
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9596c22fded6..b7e94553f4fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -601,6 +601,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 	if (!vm_flush_needed && !gds_switch_needed && !need_pipe_sync)
 		return 0;
 
+	amdgpu_ring_ib_begin(ring);
 	if (ring->funcs->init_cond_exec)
 		patch_offset = amdgpu_ring_init_cond_exec(ring);
 
@@ -661,6 +662,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
 		amdgpu_ring_emit_switch_buffer(ring);
 		amdgpu_ring_emit_switch_buffer(ring);
 	}
+	amdgpu_ring_ib_end(ring);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 01ec0551d26a..42bda7766e11 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5620,7 +5620,7 @@ static int gfx_v9_0_ring_preempt_ib(struct amdgpu_ring *ring)
 	ring->trail_seq += 1;
 	amdgpu_ring_alloc(ring, 13);
 	gfx_v9_0_ring_emit_fence(ring, ring->trail_fence_gpu_addr,
-				 ring->trail_seq, AMDGPU_FENCE_FLAG_EXEC);
+				 ring->trail_seq, AMDGPU_FENCE_FLAG_EXEC | AMDGPU_FENCE_FLAG_INT);
 	/*reset the CP_VMID_PREEMPT after trailing fence*/
 	amdgpu_ring_emit_wreg(ring,
 			      SOC15_REG_OFFSET(GC, 0, mmCP_VMID_PREEMPT),
@@ -6046,8 +6046,9 @@ static int gfx_v9_0_eop_irq(struct amdgpu_device *adev,
 
 	switch (me_id) {
 	case 0:
-		/* Fence signals are handled on the software rings*/
-		if (adev->gfx.num_gfx_rings) {
+		if (adev->gfx.num_gfx_rings &&
+		    !amdgpu_mcbp_handle_trailing_fence_irq(&adev->gfx.muxer)) {
+			/* Fence signals are handled on the software rings*/
 			for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++)
 				amdgpu_fence_process(&adev->gfx.sw_gfx_ring[i]);
 		}
-- 
2.25.1

