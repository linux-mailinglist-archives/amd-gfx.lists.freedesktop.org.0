Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0574E613B33
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Oct 2022 17:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEF610E30A;
	Mon, 31 Oct 2022 16:25:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE61589349
 for <amd-gfx@lists.freedesktop.org>; Mon, 31 Oct 2022 16:24:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfuFiyFu2plb+zu5Q+sM3Oc9uij48IVOAmjfzYgz4d82dA9drwcoDsrA7YBcbWyyDo7WJaOxlomKWIx3Mgxcx2OSlVeajUNDQiHuLpeY7lamCnx6fg5YqJ8vYHX3nQNMC5oLQY1qjLQ777h3qEh1lxdWOShroONPWl3TPfiqUL5t12eh1FT6aoBTY9gZTh2nhwH7sxUHQACfjBu9hAfFGIGt8fx6VLGg1n0IxNcST+Fhy/Nm0vJpp8q9843JzpQvANZanWTpfnJymr08axULT4KQGAd5o/R+S4BqvE/oGn2SJ25LKxFeAMEy7IuFMdIoZVCkxausrkYrpGdlbxavUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFe53UM1A3XU2yi3oUsiknFjb+8gBVS5SYVIq8UQmNk=;
 b=dKiK+fsoURyjxi2a9srrCmWQGP2QaiU+nfx1XC+FxiooiPsMmC80/9IvEP0qzv8JcNPY/ZrS/xEFc5pbgnp+T/+OURTcABKQZzlqHKNYBpU2AI9ZmXkelIgIVkl3p7B5vqnHWtJ+3p86Qv6Q0GbBwJwH6LXshmlvzyxPDw1VOHvUEWJ+LsFSOQ0xrc9EEQO/0BW4TQaNR/SVr71juqbOyquLVAfQ9eXCCsritIaXQdiJXf6nXCOQR153i7vvNyRteEGcKKCQd96EapUMzEi+B7Nmovqq+fe2HdmZ/M0pORQxnh8K+QmMwPKGWtP1qgIWoQhLpo3opZS+DgF2+S5LxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFe53UM1A3XU2yi3oUsiknFjb+8gBVS5SYVIq8UQmNk=;
 b=3f9wtoW9xB8LnGePJI1xUciSf2i6IPuHBEcghMG6vIomm/hXXmVGi62wHw+MPxsWz2xOoou4WfX0Si8LovQwXlrrAm2uxmrAE7OqnRW+w/PucrSzZ8HtmLVDILXXPAIwLGGqQFtWFZI5Wx3njsxoNoqxEUVxe2FLROKlSizd8B0=
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by SN7PR12MB7202.namprd12.prod.outlook.com (2603:10b6:806:2a9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 16:24:27 +0000
Received: from CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::f) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16 via Frontend
 Transport; Mon, 31 Oct 2022 16:24:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT091.mail.protection.outlook.com (10.13.175.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 16:24:27 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 11:24:24 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/29] drm/amdgpu: add gfx9.4.1 hw debug mode enable and
 disable calls
Date: Mon, 31 Oct 2022 12:23:37 -0400
Message-ID: <20221031162359.445805-7-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031162359.445805-1-jonathan.kim@amd.com>
References: <20221031162359.445805-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT091:EE_|SN7PR12MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b891ccc-08e3-4039-e661-08dabb5c6198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vVTI6wm44rWsMqxDcd7qoHF0y3f6V3XfwbOMTRLwEpAxHRSvbviN+JKLbypjXSkQ5usbgyrNo57NZRMpqOMsCQXmOOhGyIRsTnoLFt243fpR4z30mP1SWgn1o/GtQWRhG2B1ON+pCw/0ajqxSoJ672pGgL32NFHSt+H0i0/i6fosiMcVc/5CPi8Sd8elOISswaglmxgXO2WLtbLyIvZ81m2Xs/w4mPlh69yNoJn52E04kRzwyyVYQJu7tVZ4VWyvtve1y47kFQ5LvvLluIH68zi5Sh2DG00IpNpVMh70rN12HVjgFZShNXFCvvHUzH8Ys3QDpSDJI+GsE/fATEVsO7oJcWYhXzE32bpzfcGaWM6xcbQyMGb8D9j0uGJxizUK3DCmS7UFgwmrdMD+f2slhR2sJ92qE/zOqlwNV+jbaBK9OGI60Yc5H64S/yzN7IbfOjjxTa1NKruqrDZe4ZlSG8zBpX/FjvDoNNYVHQaxAY2nmS+2Yxl5we7ebtH6JJhgyUshsk45TEoEGmJTFF2NwgIXMdZrXXhK/Ui0cBca2DQZ1/zgCqLIL2zQn9HPkwWZfC93jxnvwAWDUiAEBN3J9yrnc7ZjwVemakm5hC7zy+DR/QmN3t+2eoC2Tr+/FbqoIJ/xs7oESlmckbySiN5Q8OPG1W3g3wcd4XaIx7fMBxgmamP4TLnmRuL+rjwp44KnjB2rvQUD1gSIKoWqvwkJigR52Yq3OWwBGQ7MNH8iYplPZ+OVS7BaKLZkkAMllPmjIVwgTqPbsYh6geEiV1u0FwZKjMwhn7MoBqFh8CajfPcCDC4f9vDF9ib8TJ0X25ro
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(36840700001)(46966006)(40470700004)(426003)(47076005)(8936002)(82740400003)(83380400001)(4326008)(5660300002)(44832011)(40460700003)(316002)(2906002)(478600001)(36756003)(70586007)(6666004)(40480700001)(6916009)(82310400005)(2616005)(41300700001)(16526019)(1076003)(186003)(336012)(7696005)(356005)(26005)(81166007)(8676002)(36860700001)(70206006)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 16:24:27.3736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b891ccc-08e3-4039-e661-08dabb5c6198
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7202
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
Cc: Felix.Kuehling@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On GFX9.4.1, the implicit wait count instruction on s_barrier is
disabled by default in the driver during normal operation for
performance requirements.

There is a hardware bug in GFX9.4.1 where if the implicit wait count
instruction after an s_barrier instruction is disabled, any wave that
hits an exception may step over the s_barrier when returning from the
trap handler with the barrier logic having no ability to be
aware of this, thereby causing other waves to wait at the barrier
indefinitely resulting in a shader hang.  This bug has been corrected
for GFX9.4.2 and onward.

Since the debugger subscribes to hardware exceptions, in order to avoid
this bug, the debugger must enable implicit wait count on s_barrier
for a debug session and disable it on detach.

In order to change this setting in the in the device global SQ_CONFIG
register, the GFX pipeline must be idle.  GFX9.4.1 as a compute device
will either dispatch work through the compute ring buffers used for
image post processing or through the hardware scheduler by the KFD.

Have the KGD suspend and drain the compute ring buffer, then suspend the
hardware scheduler and block any future KFD process job requests before
changing the implicit wait count setting.  Once set, resume all work.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   | 105 +++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   2 +-
 4 files changed, 110 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0e6ddf05c23c..9f2499f52d2c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1034,6 +1034,9 @@ struct amdgpu_device {
 	struct pci_saved_state          *pci_state;
 	pci_channel_state_t		pci_channel_state;
 
+	/* Track auto wait count on s_barrier settings */
+	bool				barrier_has_auto_waitcnt;
+
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[MAX_HWIP][HWIP_MAX_INSTANCE];
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index 4191af5a3f13..13f02a0aa828 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -26,6 +26,7 @@
 #include "amdgpu.h"
 #include "amdgpu_amdkfd.h"
 #include "amdgpu_amdkfd_arcturus.h"
+#include "amdgpu_reset.h"
 #include "sdma0/sdma0_4_2_2_offset.h"
 #include "sdma0/sdma0_4_2_2_sh_mask.h"
 #include "sdma1/sdma1_4_2_2_offset.h"
@@ -48,6 +49,8 @@
 #include "amdgpu_amdkfd_gfx_v9.h"
 #include "gfxhub_v1_0.h"
 #include "mmhub_v9_4.h"
+#include "gc/gc_9_0_offset.h"
+#include "gc/gc_9_0_sh_mask.h"
 
 #define HQD_N_REGS 56
 #define DUMP_REG(addr) do {				\
@@ -276,6 +279,104 @@ int kgd_arcturus_hqd_sdma_destroy(struct amdgpu_device *adev, void *mqd,
 	return 0;
 }
 
+/*
+ * Helper used to suspend/resume gfx pipe for image post process work to set
+ * barrier behaviour.
+ */
+static int suspend_resume_compute_scheduler(struct amdgpu_device *adev, bool suspend)
+{
+	int i, r = 0;
+
+	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+		struct amdgpu_ring *ring = &adev->gfx.compute_ring[i];
+
+		if (!(ring && ring->sched.thread))
+			continue;
+
+		/* stop secheduler and drain ring. */
+		if (suspend) {
+			drm_sched_stop(&ring->sched, NULL);
+			r = amdgpu_fence_wait_empty(ring);
+			if (r)
+				goto out;
+		} else {
+			drm_sched_start(&ring->sched, false);
+		}
+	}
+
+out:
+	/* return on resume or failure to drain rings. */
+	if (!suspend || r)
+		return r;
+
+	return amdgpu_device_ip_wait_for_idle(adev, GC_HWIP);
+}
+
+static void set_barrier_auto_waitcnt(struct amdgpu_device *adev, bool enable_waitcnt)
+{
+	uint32_t data;
+
+	WRITE_ONCE(adev->barrier_has_auto_waitcnt, enable_waitcnt);
+
+	if (!down_read_trylock(&adev->reset_domain->sem))
+		return;
+
+	amdgpu_amdkfd_suspend(adev, false);
+
+	if (suspend_resume_compute_scheduler(adev, true))
+		goto out;
+
+	data = RREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG));
+	data = REG_SET_FIELD(data, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
+						enable_waitcnt ? 0 : 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSQ_CONFIG), data);
+
+out:
+	suspend_resume_compute_scheduler(adev, false);
+
+	amdgpu_amdkfd_resume(adev, false);
+
+	up_read(&adev->reset_domain->sem);
+}
+
+static uint32_t kgd_arcturus_enable_debug_trap(struct amdgpu_device *adev,
+				bool restore_dbg_registers,
+				uint32_t vmid)
+{
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	set_barrier_auto_waitcnt(adev, true);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
+
+static uint32_t kgd_arcturus_disable_debug_trap(struct amdgpu_device *adev,
+					bool keep_trap_enabled,
+					uint32_t vmid)
+{
+
+	mutex_lock(&adev->grbm_idx_mutex);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, true);
+
+	set_barrier_auto_waitcnt(adev, false);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	kgd_gfx_v9_set_wave_launch_stall(adev, vmid, false);
+
+	mutex_unlock(&adev->grbm_idx_mutex);
+
+	return 0;
+}
 const struct kfd2kgd_calls arcturus_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -294,6 +395,8 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 				kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base =
 				kgd_gfx_v9_set_vm_context_page_table_base,
+	.enable_debug_trap = kgd_arcturus_enable_debug_trap,
+	.disable_debug_trap = kgd_arcturus_disable_debug_trap,
 	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
-	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings
+	.program_trap_handler_settings = kgd_gfx_v9_program_trap_handler_settings,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index a0e5ad342f13..8ed1b5d255f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2424,8 +2424,8 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
 	switch (adev->ip_versions[GC_HWIP][0]) {
 	case IP_VERSION(9, 4, 1):
 		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
-		tmp = REG_SET_FIELD(tmp, SQ_CONFIG,
-					DISABLE_BARRIER_WAITCNT, 1);
+		tmp = REG_SET_FIELD(tmp, SQ_CONFIG, DISABLE_BARRIER_WAITCNT,
+				READ_ONCE(adev->barrier_has_auto_waitcnt) ? 0 : 1);
 		WREG32_SOC15(GC, 0, mmSQ_CONFIG, tmp);
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 56ad38fcd26e..efb81ccef8f5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1946,7 +1946,7 @@ void kfd_suspend_all_processes(void)
 	WARN(debug_evictions, "Evicting all processes");
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
 		cancel_delayed_work_sync(&p->eviction_work);
-		cancel_delayed_work_sync(&p->restore_work);
+		flush_delayed_work(&p->restore_work);
 
 		if (kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_TRIGGER_SUSPEND))
 			pr_err("Failed to suspend process 0x%x\n", p->pasid);
-- 
2.25.1

