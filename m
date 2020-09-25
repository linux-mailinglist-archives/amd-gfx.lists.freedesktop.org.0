Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD92793E5
	for <lists+amd-gfx@lfdr.de>; Sat, 26 Sep 2020 00:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24C46ED6A;
	Fri, 25 Sep 2020 22:03:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC266ED6A
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 22:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOnsbFwELB2EPKPLqqv+UVRRIG0fRwr3V/N3OZIS0JgkhJZkrMi9j/jsY17p4/mOIKeyF4am8Kqhrf1psyPbuPA40m7OryMTvYY7wIUGRGPmDylWFiA7Poq6pPG0DbDUNg7/I4TGzUHc5g5luaK6wNzRb/WlDj3LEnszmFQ6rV6ktnAiBvZgQy03+vduz3JUVPmmOEBt//gBVJp//ipufu2Ij4XCTe+3GeXMykDI8LJyGXQjKWfXXiL1t2llezoM2RixeAwZcgRoDuu3GUsY2gkW45uSmCALpNH9RoNPl5ygH3XceRXbtsJEvid1MaZBH9DWetslFyxlx3vJZWm+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD5UZ2PqnQPRMWNjdZ1z+xvMz1olx6/C0EnOquPKFlU=;
 b=N8iRILRekO5bzDUzM44W2ukLHtDpPiZse6lr1YElNFdk9xhvgKe0GjVq+/EFmUJk3d6KDZWICvAHh1DylIc/tCInTkRvc1HcspBpboE3msUF6fa3AyzDugpvHCBqLL/C10131GGOIe94kRCqeNZ5B66MNXp4+MZLPHYM7J0hGAk9ltWDJeo45/KNepvReeyXWkZu+hjTYyzObvU76zUAhLvEciKPd9S+gJvmGpxJfxf98AZdHiu6xh5WI6xfwEov8xiXDAGbzqEdNUkiufLONiiZQtArcWBshT9liFftWsqSi9LYpP1reL9GntJ9wLK/nKYBMuMexTvGjATenvBzqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QD5UZ2PqnQPRMWNjdZ1z+xvMz1olx6/C0EnOquPKFlU=;
 b=Ha5wXZQLePjO0/+b7Z6zlk9/p3yHo7RqeN3JoagZuQ9fwBlzQWTlIFWVU9WM0C6QVq8WYyBkIbzUBBUAQLHQjG1+z0/JqGGM9oB/lHowXVwE31AXNJSNq5JJw3KOTMQTSmYH7VAcAimU5vBUHa39K50jHZQJf9GmCE2fTTSUnm0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SN1PR12MB2431.namprd12.prod.outlook.com (2603:10b6:802:27::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.23; Fri, 25 Sep
 2020 22:03:20 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::3d17:21ac:a0ed:9a82]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::3d17:21ac:a0ed:9a82%5]) with mapi id 15.20.3412.021; Fri, 25 Sep 2020
 22:03:20 +0000
From: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amd/amdgpu: Define and implement a function that
 collects number of waves that are in flight.
Date: Fri, 25 Sep 2020 17:03:06 -0500
Message-Id: <20200925220306.31013-1-Ramesh.Errabolu@amd.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR06CA0083.namprd06.prod.outlook.com (2603:10b6:3:4::21)
 To SN6PR12MB2672.namprd12.prod.outlook.com
 (2603:10b6:805:6f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hsacqe51.amd.com (165.204.77.1) by
 DM5PR06CA0083.namprd06.prod.outlook.com (2603:10b6:3:4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3412.20 via Frontend Transport; Fri, 25 Sep 2020 22:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9e948e2-6f97-4700-c205-08d8619ed049
X-MS-TrafficTypeDiagnostic: SN1PR12MB2431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24312FD5A7730C7B75FE31E0E3360@SN1PR12MB2431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXUAfBYYFeiTWR6iQjR6VbOglPBoe2oUKG1uIVkoq5Sv3hYXPkMEv544Dy/q2aHgc+sg5wzVnHgJymGBNVCd5rO8tLed9Lbg/ON37BXSHT1SnQJv/IgGC5yCNdzFnl5oeIwGSf69FcAG20Q2/iKVIG2qBdZiam5BLQbs+75COp4zpNvAKD8w89gnlU6xzAbpIO7wBoFt2FLTSd3PZIPWoxKpSAqcoNQ0qa1Mp+JKc/ZiNyIkS3J6wzcnpkbuQNpadQIcnYzY9Y/Oee1EDjRxEsByTYYfBKXclLlKOGJtQrGlWz8N8kF/t6wfcR7/5CNd9wH7SoOb9gB7oZ60D0tHJwmvbvZIhNYbfJlv9Guap24oTsj3+C+7komg2pZ8rjxj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(66946007)(66476007)(478600001)(66556008)(956004)(5660300002)(83380400001)(1076003)(6916009)(2616005)(8936002)(186003)(16526019)(316002)(52116002)(7696005)(6666004)(6486002)(2906002)(36756003)(86362001)(4326008)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: U3hA3+zzC3VclIgsPa9DyTKS/sFxNzo4C/1Qs3IVRPtG8U114wrYmU0vAfHEB8YV0h0nX6qhsHYJYjU1jDBa1cCeFNIUwn70Ts9E4BDvdPyBqNmpa+l166FI7rOr8jsDTXrzwr6sf1+zoengdfcH3gRwTeQYTRU5rl3BAu4s2un2ixhzR/dOrpjVNdf8CYoa0y1QD6ti7zFYCOroFGBV/w30dklcm/Z7O/yjAr7GXHXjHsXGnyyYAOrNweFS3/Zu1a6nZw7LcAqSaDOoCSivw9lVkpjEO58wpqLlaAa3hkeVcywO60tN6qk5E6QiZv8BEzk72IgIpeZs5WNmLZ/BkbUc25BY7dHIz32U8I98/gR6gXHLLNsAbAd6sbfxwj+WwjEvBpBzdtLd+MezQMiTzm3/cfVmIqQLPfE40iC0zr0U31zmKsiJbDnNCQCrC7hrSUsU0IO/WsLq32Xml74Hw7Z6p3///rm2rxAWZySka7rZIJjuIcNdc9iZoKiwdQpQj5l2pL4UVQbXyo6iGUbpEqVDk8288UOh56ma3Z/sKFrx1vBfFb8Zcw2IMUfEE6FrMPdoch6wbfKFl3JyLh6fDnArlIeGh5U+5fAJjcORJ6IFl09ASk8wzc3V2ujFZo5nmz5LC4R3R+00QYvsI59beg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e948e2-6f97-4700-c205-08d8619ed049
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 22:03:20.1975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m7uwu6jY2Zu+aEjWhaJecxkLtP8w4X5WNfMcadqCIRMvs13L/sdlhiF13Cn28M8+Jrux6qHDrHq4VEVSoRDLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2431
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
Cc: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
Allow user to know how many compute units (CU) are in use at any given
moment.

[How]
Read registers of SQ that give number of waves that are in flight
of various queues. Use this information to determine number of CU's
in use.

Signed-off-by: Ramesh Errabolu <Ramesh.Errabolu@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 176 +++++++++++++++++-
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |  12 ++
 2 files changed, 187 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e6aede725197..87d4c8855805 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -38,7 +38,7 @@
 #include "soc15d.h"
 #include "mmhub_v1_0.h"
 #include "gfxhub_v1_0.h"
-
+#include "gfx_v9_0.h"
 
 enum hqd_dequeue_request_type {
 	NO_ACTION = 0,
@@ -706,6 +706,179 @@ void kgd_gfx_v9_set_vm_context_page_table_base(struct kgd_dev *kgd,
 	gfxhub_v1_0_setup_vm_pt_regs(adev, vmid, page_table_base);
 }
 
+static void lock_spi_csq_mutexes(struct amdgpu_device *adev)
+{
+	mutex_lock(&adev->srbm_mutex);
+	mutex_lock(&adev->grbm_idx_mutex);
+
+}
+
+static void unlock_spi_csq_mutexes(struct amdgpu_device *adev)
+{
+	mutex_unlock(&adev->grbm_idx_mutex);
+	mutex_unlock(&adev->srbm_mutex);
+}
+
+/**
+ * @get_wave_count: Read device registers to get number of waves in flight for
+ * a particulare queue. The method also returns the VMID associated with the
+ * queue.
+ *
+ * @adev: Handle of device whose registers are to be read
+ * @queue_idx: Index of queue in the queue-map bit-field
+ * @wave_cnt: Output parameter updated with number of waves in flight
+ * @vmid: Output parameter updated with VMID of queue whose wave count
+ * is being collected
+ */
+static void get_wave_count(struct amdgpu_device *adev, int queue_idx,
+		int *wave_cnt, int *vmid)
+{
+	int pipe_idx;
+	int queue_slot;
+	unsigned int reg_val;
+
+	/*
+	 * Program GRBM with appropriate MEID, PIPEID, QUEUEID and VMID
+	 * parameters to read out waves in flight. Get VMID if there are
+	 * non-zero waves in flight.
+	 */
+	*vmid = 0xFF;
+	*wave_cnt = 0;
+	pipe_idx = queue_idx / adev->gfx.mec.num_queue_per_pipe;
+	queue_slot = queue_idx % adev->gfx.mec.num_queue_per_pipe;
+	soc15_grbm_select(adev, 1, pipe_idx, queue_slot, 0);
+	reg_val = RREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_CSQ_WF_ACTIVE_COUNT_0) +
+			 queue_slot);
+	*wave_cnt = reg_val & SPI_CSQ_WF_ACTIVE_COUNT_0__COUNT_MASK;
+	if (*wave_cnt != 0)
+		*vmid = (RREG32_SOC15(GC, 0, mmCP_HQD_VMID) &
+			 CP_HQD_VMID__VMID_MASK) >> CP_HQD_VMID__VMID__SHIFT;
+}
+
+/**
+ * @kgd_gfx_v9_get_cu_occupancy: Reads relevant registers associated with each
+ * shader engine and aggregates the number of waves that are in fight for the
+ * process whose pasid is provided as a parameter. The process could have ZERO
+ * or more queues running and submitting waves to compute units.
+ *
+ * @kgd: Handle of device from which to get number of waves in flight
+ * @pasid: Identifies the process for which this query call is invoked
+ * @wave_cnt: Output parameter updated with number of waves in flight that
+ * belong to process with given pasid
+ * @max_waves_per_cu: Output parameter updated with maximum number of waves
+ * possible per Compute Unit
+ *
+ * @note: It's possible that the device has too many queues (oversubscription)
+ * in which case a VMID could be remapped to a different PASID. This could lead
+ * to in accurate wave count. Following is a high-level sequence:
+ *    Time T1: vmid = getVmid(); vmid is associated with Pasid P1
+ *    Time T2: passId = getPasId(vmid); vmid is associated with Pasid P2
+ * In the sequence above wave count obtained from time T1 will be incorrectly
+ * lost or added to total wave count.
+ *
+ * The registers that provide the waves in flight are:
+ *
+ *  SPI_CSQ_WF_ACTIVE_STATUS - bit-map of queues per pipe. The bit is ON if a
+ *  queue is slotted, OFF if there is no queue. A process could have ZERO or
+ *  more queues slotted and submitting waves to be run on compute units. Even
+ *  when there is a queue it is possible there could be zero wave fronts, this
+ *  can happen when queue is waiting on top-of-pipe events - e.g. waitRegMem
+ *  command
+ *
+ *  For each bit that is ON from above:
+ *
+ *    Read (SPI_CSQ_WF_ACTIVE_COUNT_0 + queue_idx) register. It provides the
+ *    number of waves that are in flight for the queue at specified index. The
+ *    index ranges from 0 to 7.
+ *
+ *    If non-zero waves are in fligth, read CP_HQD_VMID register to obtain VMID
+ *    of the wave(s).
+ *
+ *    Determine if VMID from above step maps to pasid provided as parameter. If
+ *    it matches agrregate the wave count. That the VMID will not match pasid is
+ *    a normal condition i.e. a device is expected to support multiple queues
+ *    from multiple proceses.
+ *
+ *  Reading registers referenced above involves programming GRBM appropriately
+ */
+static void kgd_gfx_v9_get_cu_occupancy(struct kgd_dev *kgd, int pasid,
+		int *pasid_wave_cnt, int *max_waves_per_cu)
+{
+	int qidx;
+	int vmid;
+	int se_idx;
+	int sh_idx;
+	int se_cnt;
+	int sh_cnt;
+	int wave_cnt;
+	int queue_map;
+	int pasid_tmp;
+	int max_queue_cnt;
+	int vmid_wave_cnt = 0;
+	struct amdgpu_device *adev;
+	DECLARE_BITMAP(cp_queue_bitmap, KGD_MAX_QUEUES);
+
+	adev = get_amdgpu_device(kgd);
+	lock_spi_csq_mutexes(adev);
+	soc15_grbm_select(adev, 1, 0, 0, 0);
+
+	/*
+	 * Iterate through the shader engines and arrays of the device
+	 * to get number of waves in flight
+	 */
+	bitmap_complement(cp_queue_bitmap, adev->gfx.mec.queue_bitmap,
+			  KGD_MAX_QUEUES);
+	max_queue_cnt = adev->gfx.mec.num_pipe_per_mec *
+			adev->gfx.mec.num_queue_per_pipe;
+	sh_cnt = adev->gfx.config.max_sh_per_se;
+	se_cnt = adev->gfx.config.max_shader_engines;
+	for (se_idx = 0; se_idx < se_cnt; se_idx++) {
+		for (sh_idx = 0; sh_idx < sh_cnt; sh_idx++) {
+
+			gfx_v9_0_select_se_sh(adev, se_idx, sh_idx, 0xffffffff);
+			queue_map = RREG32(SOC15_REG_OFFSET(GC, 0,
+					   mmSPI_CSQ_WF_ACTIVE_STATUS));
+
+			/*
+			 * Assumption: queue map encodes following schema: four
+			 * pipes per each micro-engine, with each pipe mapping
+			 * eight queues. This schema is true for GFX9 devices
+			 * and must be verified for newer device families
+			 */
+			for (qidx = 0; qidx < max_queue_cnt; qidx++) {
+
+				/* Skip qeueus that are not associated with
+				 * compute functions
+				 */
+				if (!test_bit(qidx, cp_queue_bitmap))
+					continue;
+
+				if (!(queue_map & (1 << qidx)))
+					continue;
+
+				/* Get number of waves in flight and aggregate them */
+				get_wave_count(adev, qidx, &wave_cnt, &vmid);
+				if (wave_cnt != 0) {
+					pasid_tmp =
+					  RREG32(SOC15_REG_OFFSET(OSSSYS, 0,
+						 mmIH_VMID_0_LUT) + vmid);
+					if (pasid_tmp == pasid)
+						vmid_wave_cnt += wave_cnt;
+				}
+			}
+		}
+	}
+
+	gfx_v9_0_select_se_sh(adev, 0xffffffff, 0xffffffff, 0xffffffff);
+	soc15_grbm_select(adev, 0, 0, 0, 0);
+	unlock_spi_csq_mutexes(adev);
+
+	/* Update the output parameters and return */
+	*pasid_wave_cnt = vmid_wave_cnt;
+	*max_waves_per_cu = adev->gfx.cu_info.simd_per_cu *
+				adev->gfx.cu_info.max_waves_per_simd;
+}
+
 const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.program_sh_mem_settings = kgd_gfx_v9_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_gfx_v9_set_pasid_vmid_mapping,
@@ -726,4 +899,5 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 	.get_atc_vmid_pasid_mapping_info =
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
+	.get_cu_occupancy = kgd_gfx_v9_get_cu_occupancy,
 };
diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index fc592f60e6a0..e37b4b9f626d 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -212,6 +212,15 @@ struct tile_config {
  * IH ring entry. This function allows the KFD ISR to get the VMID
  * from the fault status register as early as possible.
  *
+ * @get_cu_occupancy: Function pointer that returns to caller the number
+ * of wave fronts that are in flight for all of the queues of a process
+ * as identified by its pasid. It is important to note that the value
+ * returned by this function is a snapshot of current moment and cannot
+ * guarantee any minimum for the number of waves in-flight. This function
+ * is defined for devices that belong to GFX9 and later GFX families. Care
+ * must be taken in calling this function as it is not defined for devices
+ * that belong to GFX8 and below GFX families.
+ *
  * This structure contains function pointers to services that the kgd driver
  * provides to amdkfd driver.
  *
@@ -286,6 +295,9 @@ struct kfd2kgd_calls {
 	void (*set_vm_context_page_table_base)(struct kgd_dev *kgd,
 			uint32_t vmid, uint64_t page_table_base);
 	uint32_t (*read_vmid_from_vmfault_reg)(struct kgd_dev *kgd);
+
+	void (*get_cu_occupancy)(struct kgd_dev *kgd, int pasid, int *wave_cnt,
+			int *max_waves_per_cu);
 };
 
 #endif	/* KGD_KFD_INTERFACE_H_INCLUDED */
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
