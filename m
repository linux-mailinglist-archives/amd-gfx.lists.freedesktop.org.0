Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61209139AB3
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jan 2020 21:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB3F89AFF;
	Mon, 13 Jan 2020 20:26:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEBA389AFF
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jan 2020 20:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nY/geOS+OkYA/Ig6TgqNYFgfc0iFwdhK/uWESj8JPAhg+K6aYr0LhSeBjgtzezNt/hN+wRfzR5V5x0xxsd5Wsv3vPbx0U5B22N3I2q33IfzHpeVk8o7UwX1yQeIihUoENP+Mw8crcAfTK8CNa7Qc/wbyq9PNjgOpG3xPpPuGagL32jUxyi0nrCyEdknnvMWBq0R2ojihvLQM4O8R8Uf2vTgBkazWo2HclaXFF0+Kaxlase5lyIehfPAsMRJiWMPm/aflrd9j3ULG2YiE1m3IWIW5o1KQRYXc5BrUR1bzU1N/I49j/9tMkafjwAGxsgGimw8532yKQNmnaV67+n94qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRbHTzuffmtcz0R3WWdhNR6kkw3akwSlswqv2j0RSEA=;
 b=htlD01Ox5sfBHNtZggcKYfyjnooYy/XH4E13Q0jkLgCyX9UcWFEfz1ZHyMYMWAIbwY/qLlnSJngMIs2djZ+drmryPRGxSh+1mO++9uNDa7TMFEVrYzb7laARdjgl3+iqBB/VKSL2EytuE1rHxoRTbnzW5pkDuezgl8ztmWIA/1V7fWmrxMIyUdq9QBP+Re3skJwzJqA2bmq5d/HD/AoJUi06Nm350myPIBZGIzGf9Xx1gqAUu30ExTZvPLGqK2kj5icdgw/3sUPsG0f5SHEe3YHtxAJdFo+FuvymrKzuWtbr3Rl2N0vMYQMt0X5+aGmdyTKoHAhpX0dTOsswbOEzkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRbHTzuffmtcz0R3WWdhNR6kkw3akwSlswqv2j0RSEA=;
 b=yVOU+Uk2xD2f48NapfQjTeb8rHg8xkWTan13VLN4hQjHzK0vCNlVRmGd06WNY00e9gMc/vXup4glMe1Qn5h3dahV4X/brLY7OE5ovTxA6dtuU/hLVVRs+YIDs/HzBxfoOZTyAYl/9btO5QKPPDiACXEbqxifJ63Nup9FqOj1JhA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alex.Sierra@amd.com; 
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (52.135.105.15) by
 SN6PR12MB2702.namprd12.prod.outlook.com (52.135.101.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Mon, 13 Jan 2020 20:26:57 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 20:26:57 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 5/7] drm/amdgpu: export function to flush TLB via pasid
Date: Mon, 13 Jan 2020 14:26:27 -0600
Message-Id: <20200113202629.94021-5-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113202629.94021-3-alex.sierra@amd.com>
References: <20200113202629.94021-3-alex.sierra@amd.com>
X-ClientProxiedBy: SN6PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:805:66::30) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.77.1) by
 SN6PR08CA0017.namprd08.prod.outlook.com (2603:10b6:805:66::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15 via Frontend Transport; Mon, 13 Jan 2020 20:26:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2848552-4e50-4093-ca12-08d79866efad
X-MS-TrafficTypeDiagnostic: SN6PR12MB2702:|SN6PR12MB2702:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2702C5E0C3C10BE22AE352CAFD350@SN6PR12MB2702.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(189003)(199004)(81156014)(1076003)(30864003)(8676002)(6486002)(6666004)(5660300002)(81166006)(8936002)(66476007)(66556008)(66946007)(316002)(36756003)(44832011)(86362001)(4326008)(186003)(26005)(7696005)(6916009)(52116002)(2616005)(16526019)(478600001)(956004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2702;
 H:SN6PR12MB2621.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2cvO7X3x2BQXMqyIpDRv/JZa5f2dHq6eDjUwOr5swZiLAARRJ/+w155h8tOlKQ9W0M75T1esQBCeWSkZl+i3/dNixrXlVhGTiVM2G+HX2yb9MKKqOLJInXgUN9D6AtrhO/cWjx9NSdPsvb+LnSuPBDlyxMuxnDWC6tTZYFlKP0pf/eP50G/E/d/VJeBFzIY+1e//vS1oQ8a2dm8Wa90Ax7m/SVwujtVhEDVkFAx64wesOFzgpKYWANnYuO++4um/GFqjcBIpg5oZwsP2YnkKvjzorXyQ09cRWvzI7rjiiNT5XC5kSeQeFJagZ9omg3jFD0+GL4UgZ5ZpdVk5qgFL/aRbmPryA1qzzem3UYyhXdBZsPUJERgtN7HBlGM5fTIjBh54fCxh2wRm+t8o/05roAFR+cZCy4789LtvxhuVe9BoPvRN0mtPIyrnZuwNnDq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2848552-4e50-4093-ca12-08d79866efad
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 20:26:57.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHoiIo0ouYnHy14YRkzEW+cJ2cyXqfy0Owup1RJr6VRKgNEFWhNffk4ZKtnB1ekY8d/O9dHn7sv0rFqdAomyNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This can be used directly from amdgpu and amdkfd to invalidate
TLB through pasid.
It supports gmc v7, v8, v9 and v10.

Change-Id: I6563a8eba2e42d1a67fa2547156c20da41d1e490
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  6 ++
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 74 ++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c   | 33 +++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 34 +++++++++++
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 76 +++++++++++++++++++++++++
 5 files changed, 223 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index c91dd602d5f1..d3c27a3c43f6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -92,6 +92,9 @@ struct amdgpu_gmc_funcs {
 	/* flush the vm tlb via mmio */
 	void (*flush_gpu_tlb)(struct amdgpu_device *adev, uint32_t vmid,
 				uint32_t vmhub, uint32_t flush_type);
+	/* flush the vm tlb via pasid */
+	int (*flush_gpu_tlb_pasid)(struct amdgpu_device *adev, uint16_t pasid,
+					uint32_t flush_type, bool all_hub);
 	/* flush the vm tlb via ring */
 	uint64_t (*emit_flush_gpu_tlb)(struct amdgpu_ring *ring, unsigned vmid,
 				       uint64_t pd_addr);
@@ -216,6 +219,9 @@ struct amdgpu_gmc {
 };
 
 #define amdgpu_gmc_flush_gpu_tlb(adev, vmid, vmhub, type) ((adev)->gmc.gmc_funcs->flush_gpu_tlb((adev), (vmid), (vmhub), (type)))
+#define amdgpu_gmc_flush_gpu_tlb_pasid(adev, pasid, type, allhub) \
+	((adev)->gmc.gmc_funcs->flush_gpu_tlb_pasid \
+	((adev), (pasid), (type), (allhub)))
 #define amdgpu_gmc_emit_flush_gpu_tlb(r, vmid, addr) (r)->adev->gmc.gmc_funcs->emit_flush_gpu_tlb((r), (vmid), (addr))
 #define amdgpu_gmc_emit_pasid_mapping(r, vmid, pasid) (r)->adev->gmc.gmc_funcs->emit_pasid_mapping((r), (vmid), (pasid))
 #define amdgpu_gmc_map_mtype(adev, flags) (adev)->gmc.gmc_funcs->map_mtype((adev),(flags))
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 5ad89bb6f3ba..8afd05834714 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -30,6 +30,8 @@
 #include "hdp/hdp_5_0_0_sh_mask.h"
 #include "gc/gc_10_1_0_sh_mask.h"
 #include "mmhub/mmhub_2_0_0_sh_mask.h"
+#include "athub/athub_2_0_0_sh_mask.h"
+#include "athub/athub_2_0_0_offset.h"
 #include "dcn/dcn_2_0_0_offset.h"
 #include "dcn/dcn_2_0_0_sh_mask.h"
 #include "oss/osssys_5_0_0_offset.h"
@@ -37,6 +39,7 @@
 #include "navi10_enum.h"
 
 #include "soc15.h"
+#include "soc15d.h"
 #include "soc15_common.h"
 
 #include "nbio_v2_3.h"
@@ -234,6 +237,19 @@ static bool gmc_v10_0_use_invalidate_semaphore(struct amdgpu_device *adev,
 		(!amdgpu_sriov_vf(adev)));
 }
 
+static bool gmc_v10_0_get_atc_vmid_pasid_mapping_info(
+					struct amdgpu_device *adev,
+					uint8_t vmid, uint16_t *p_pasid)
+{
+	uint32_t value;
+
+	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
+		     + vmid);
+	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
+
+	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
+}
+
 /*
  * GART
  * VMID 0 is the physical GPU addresses as used by the kernel.
@@ -380,6 +396,63 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	DRM_ERROR("Error flushing GPU TLB using the SDMA (%d)!\n", r);
 }
 
+/**
+ * gmc_v10_0_flush_gpu_tlb_pasid - tlb flush via pasid
+ *
+ * @adev: amdgpu_device pointer
+ * @pasid: pasid to be flush
+ *
+ * Flush the TLB for the requested pasid.
+ */
+static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
+					uint16_t pasid, uint32_t flush_type,
+					bool all_hub)
+{
+	int vmid, i;
+	signed long r;
+	uint32_t seq;
+	uint16_t queried_pasid;
+	bool ret;
+	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
+	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
+
+	if (amdgpu_emu_mode == 0 && ring->sched.ready) {
+		spin_lock(&adev->gfx.kiq.ring_lock);
+		amdgpu_ring_alloc(ring, kiq->pmf->invalidate_tlbs_size);
+		kiq->pmf->kiq_invalidate_tlbs(ring,
+					pasid, flush_type, all_hub);
+		amdgpu_fence_emit_polling(ring, &seq);
+		amdgpu_ring_commit(ring);
+		spin_unlock(&adev->gfx.kiq.ring_lock);
+		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
+		if (r < 1) {
+			DRM_ERROR("wait for kiq fence error: %ld.\n", r);
+			return -ETIME;
+		}
+
+		return 0;
+	}
+
+	for (vmid = 1; vmid < 16; vmid++) {
+
+		ret = gmc_v10_0_get_atc_vmid_pasid_mapping_info(adev, vmid,
+				&queried_pasid);
+		if (ret	&& queried_pasid == pasid) {
+			if (all_hub) {
+				for (i = 0; i < adev->num_vmhubs; i++)
+					gmc_v10_0_flush_gpu_tlb(adev, vmid,
+							i, 0);
+			} else {
+				gmc_v10_0_flush_gpu_tlb(adev, vmid,
+						AMDGPU_GFXHUB_0, 0);
+			}
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static uint64_t gmc_v10_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
 					     unsigned vmid, uint64_t pd_addr)
 {
@@ -531,6 +604,7 @@ static void gmc_v10_0_get_vm_pte(struct amdgpu_device *adev,
 
 static const struct amdgpu_gmc_funcs gmc_v10_0_gmc_funcs = {
 	.flush_gpu_tlb = gmc_v10_0_flush_gpu_tlb,
+	.flush_gpu_tlb_pasid = gmc_v10_0_flush_gpu_tlb_pasid,
 	.emit_flush_gpu_tlb = gmc_v10_0_emit_flush_gpu_tlb,
 	.emit_pasid_mapping = gmc_v10_0_emit_pasid_mapping,
 	.map_mtype = gmc_v10_0_map_mtype,
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index f08e5330642d..19d5b133e1d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -418,6 +418,38 @@ static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+/**
+ * gmc_v7_0_flush_gpu_tlb_pasid - tlb flush via pasid
+ *
+ * @adev: amdgpu_device pointer
+ * @pasid: pasid to be flush
+ *
+ * Flush the TLB for the requested pasid.
+ */
+static int gmc_v7_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
+					uint16_t pasid, uint32_t flush_type,
+					bool all_hub)
+{
+	int vmid;
+	unsigned int tmp;
+
+	if (adev->in_gpu_reset)
+		return -EIO;
+
+	for (vmid = 1; vmid < 16; vmid++) {
+
+		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
+		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
+			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
+			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
+			RREG32(mmVM_INVALIDATE_RESPONSE);
+			break;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * GART
  * VMID 0 is the physical GPU addresses as used by the kernel.
@@ -1333,6 +1365,7 @@ static const struct amd_ip_funcs gmc_v7_0_ip_funcs = {
 
 static const struct amdgpu_gmc_funcs gmc_v7_0_gmc_funcs = {
 	.flush_gpu_tlb = gmc_v7_0_flush_gpu_tlb,
+	.flush_gpu_tlb_pasid = gmc_v7_0_flush_gpu_tlb_pasid,
 	.emit_flush_gpu_tlb = gmc_v7_0_emit_flush_gpu_tlb,
 	.emit_pasid_mapping = gmc_v7_0_emit_pasid_mapping,
 	.set_prt = gmc_v7_0_set_prt,
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 6d96d40fbcb8..27d83204fa2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -620,6 +620,39 @@ static int gmc_v8_0_mc_init(struct amdgpu_device *adev)
 	return 0;
 }
 
+/**
+ * gmc_v8_0_flush_gpu_tlb_pasid - tlb flush via pasid
+ *
+ * @adev: amdgpu_device pointer
+ * @pasid: pasid to be flush
+ *
+ * Flush the TLB for the requested pasid.
+ */
+static int gmc_v8_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
+					uint16_t pasid, uint32_t flush_type,
+					bool all_hub)
+{
+	int vmid;
+	unsigned int tmp;
+
+	if (adev->in_gpu_reset)
+		return -EIO;
+
+	for (vmid = 1; vmid < 16; vmid++) {
+
+		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
+		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
+			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
+			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
+			RREG32(mmVM_INVALIDATE_RESPONSE);
+			break;
+		}
+	}
+
+	return 0;
+
+}
+
 /*
  * GART
  * VMID 0 is the physical GPU addresses as used by the kernel.
@@ -1700,6 +1733,7 @@ static const struct amd_ip_funcs gmc_v8_0_ip_funcs = {
 
 static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
 	.flush_gpu_tlb = gmc_v8_0_flush_gpu_tlb,
+	.flush_gpu_tlb_pasid = gmc_v8_0_flush_gpu_tlb_pasid,
 	.emit_flush_gpu_tlb = gmc_v8_0_emit_flush_gpu_tlb,
 	.emit_pasid_mapping = gmc_v8_0_emit_pasid_mapping,
 	.set_prt = gmc_v8_0_set_prt,
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index b83c8d745f42..40a496804356 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -38,10 +38,12 @@
 #include "dce/dce_12_0_sh_mask.h"
 #include "vega10_enum.h"
 #include "mmhub/mmhub_1_0_offset.h"
+#include "athub/athub_1_0_sh_mask.h"
 #include "athub/athub_1_0_offset.h"
 #include "oss/osssys_4_0_offset.h"
 
 #include "soc15.h"
+#include "soc15d.h"
 #include "soc15_common.h"
 #include "umc/umc_6_0_sh_mask.h"
 
@@ -441,6 +443,18 @@ static bool gmc_v9_0_use_invalidate_semaphore(struct amdgpu_device *adev,
 		   adev->pdev->device == 0x15d8)));
 }
 
+static bool gmc_v9_0_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
+					uint8_t vmid, uint16_t *p_pasid)
+{
+	uint32_t value;
+
+	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
+		     + vmid);
+	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
+
+	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
+}
+
 /*
  * GART
  * VMID 0 is the physical GPU addresses as used by the kernel.
@@ -539,6 +553,67 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	DRM_ERROR("Timeout waiting for VM flush ACK!\n");
 }
 
+/**
+ * gmc_v9_0_flush_gpu_tlb_pasid - tlb flush via pasid
+ *
+ * @adev: amdgpu_device pointer
+ * @pasid: pasid to be flush
+ *
+ * Flush the TLB for the requested pasid.
+ */
+static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
+					uint16_t pasid, uint32_t flush_type,
+					bool all_hub)
+{
+	int vmid, i;
+	signed long r;
+	uint32_t seq;
+	uint16_t queried_pasid;
+	bool ret;
+	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
+	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
+
+	if (adev->in_gpu_reset)
+		return -EIO;
+
+	if (ring->sched.ready) {
+		spin_lock(&adev->gfx.kiq.ring_lock);
+		amdgpu_ring_alloc(ring, kiq->pmf->invalidate_tlbs_size);
+		kiq->pmf->kiq_invalidate_tlbs(ring,
+					pasid, flush_type, all_hub);
+		amdgpu_fence_emit_polling(ring, &seq);
+		amdgpu_ring_commit(ring);
+		spin_unlock(&adev->gfx.kiq.ring_lock);
+		r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
+		if (r < 1) {
+			DRM_ERROR("wait for kiq fence error: %ld.\n", r);
+			return -ETIME;
+		}
+
+		return 0;
+	}
+
+	for (vmid = 1; vmid < 16; vmid++) {
+
+		ret = gmc_v9_0_get_atc_vmid_pasid_mapping_info(adev, vmid,
+				&queried_pasid);
+		if (ret && queried_pasid == pasid) {
+			if (all_hub) {
+				for (i = 0; i < adev->num_vmhubs; i++)
+					gmc_v9_0_flush_gpu_tlb(adev, vmid,
+							i, 0);
+			} else {
+				gmc_v9_0_flush_gpu_tlb(adev, vmid,
+						AMDGPU_GFXHUB_0, 0);
+			}
+			break;
+		}
+	}
+
+	return 0;
+
+}
+
 static uint64_t gmc_v9_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
 					    unsigned vmid, uint64_t pd_addr)
 {
@@ -700,6 +775,7 @@ static void gmc_v9_0_get_vm_pte(struct amdgpu_device *adev,
 
 static const struct amdgpu_gmc_funcs gmc_v9_0_gmc_funcs = {
 	.flush_gpu_tlb = gmc_v9_0_flush_gpu_tlb,
+	.flush_gpu_tlb_pasid = gmc_v9_0_flush_gpu_tlb_pasid,
 	.emit_flush_gpu_tlb = gmc_v9_0_emit_flush_gpu_tlb,
 	.emit_pasid_mapping = gmc_v9_0_emit_pasid_mapping,
 	.map_mtype = gmc_v9_0_map_mtype,
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
