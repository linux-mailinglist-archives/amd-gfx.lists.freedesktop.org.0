Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9041382F1
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jan 2020 19:40:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004F6E249;
	Sat, 11 Jan 2020 18:40:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145F36E243
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jan 2020 18:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbqU4f7FnnVotAxnx4Dxo7nmqsFYiNo8839bbe/U55UvytUw3pDhdTyVxXdFDkCzpOK/bkZhZvL8iSdQhh325XeQX5C/na35r/iZd0+yNhOpqctbXHiqYtsEg+yJQ8XHCLMmljTuTwgLnOwecJeimfXaYhpgr0OVubCYRJ6U55jFTl+zP4lh8+P84t4kVutkpoPIXTNiEIRPbntd9yBNl1YG+zKowI4+4PY0+NzbzcOi0lylzsoVurl9FC/5215T+C3MRmOS80FREMUdlv8vnb8zEejyArDbN40cP9qq4sP+KlGtzMqRBKvNxJ2ZGeSF3+lokar7NaPf1qWgubrOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EobzMx8WxYzEJxmhK00dZplnQzJq9UE236TfounMbbo=;
 b=aRUSR3AN12nO6ruSLdGlWFk8GTo8LVu9sWU09WiCb4K5pHE8nFDDExNWnqOoP7DrkIydCSBZfM6DiJNMoEgnXc6TcvSEWuEJ+kCe96uVn6SHVaBvR7bPw1AJ30TZLWWUlb1cexrmstCpQrgVPt0qZRjxHg+5AEM/S8lq9lqXCD5QVhHouzpre0SioeLQFF7DmIskZeu68I87+rPBX46gCHdI/RnrQzQBNVEOfYtPxszl1TTSIWtupkc22u9WlQbanPQed2mhN3GL9PHohx4Nbfq5pAcIhKdDgNIk8jAJMzV7Ef8/SWjykozti8o/P/3AiQXBaHDlV+chXw65/JRaqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EobzMx8WxYzEJxmhK00dZplnQzJq9UE236TfounMbbo=;
 b=rexxbVCor2LrpnNXV5oa83KfgwN5ot6Es9X4D9AhE25nRgWTgVSVN2I7Z0G8G8xVdiMaIYViI9fbvXqwz/ETuQr1MLPBNGwNLxWh9vAFpjMVFzd0cHjd+JdgzkMhhS3QvJG40g/szHzHuACLa1oJtrKcy7BqGu9zaghClOchMaU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alex.Sierra@amd.com; 
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (52.135.105.15) by
 SN6PR12MB2814.namprd12.prod.outlook.com (52.135.104.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Sat, 11 Jan 2020 18:39:58 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490%6]) with mapi id 15.20.2623.014; Sat, 11 Jan 2020
 18:39:58 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/amdgpu: flush TLB functions removal from kfd2kgd
 interface
Date: Sat, 11 Jan 2020 12:39:38 -0600
Message-Id: <20200111183938.126310-7-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200111183938.126310-1-alex.sierra@amd.com>
References: <20200111183938.126310-1-alex.sierra@amd.com>
X-ClientProxiedBy: SN6PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:805:ca::31) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.77.1) by
 SN6PR16CA0054.namprd16.prod.outlook.com (2603:10b6:805:ca::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13 via Frontend Transport; Sat, 11 Jan 2020 18:39:57 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24d605e8-43a8-4886-7441-08d796c5a88a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2814:|SN6PR12MB2814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2814C42B3D777FBCAD1D915CFD3B0@SN6PR12MB2814.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-Forefront-PRVS: 0279B3DD0D
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(199004)(189003)(66476007)(26005)(66556008)(66946007)(16526019)(186003)(7696005)(52116002)(6916009)(86362001)(478600001)(4326008)(36756003)(5660300002)(6486002)(30864003)(8676002)(316002)(6666004)(956004)(8936002)(2906002)(81166006)(81156014)(1076003)(44832011)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2814;
 H:SN6PR12MB2621.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SgPVn0aZLyNkS8gM/Fo8vKf3Nm/Yct/qbyHnGQqIiKx6hJdeVj2N87sACVsVvChbi2KWcHuF2YMZ0f1MF97tN/KTnQjpIKE3hfMtinqHRzDBtU4XQkWHrqhXi7HNd4hapcPFKFdUZDNqO1FK3xvdienRurEhFxefS2+oo+QE+w6NmkSSGwpxeIKt0Tn3jgOvcb/BVdHbiOHkxoKlHpWoZlbY58e2qQCLC5ic6SYYFATjjHB65IJ/EWz1WsFgwg3RNXEAwNvjIYCbr+ous/4q/8SssmfU4MiQSPcvUPVUZqVWsh0+UT4T/tHbMc1mumau1syXmS0mxx5i1cOXOwdjgMy6GOOyOQduMYB49E/0GAYhlFMn1UIcWt1H60qkwXzRB9rQw5Acips2/y046nNN2mSMw+Q4f8pust1vmVZWs13m1Lfb+imA4ghAUiTbC54a
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d605e8-43a8-4886-7441-08d796c5a88a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2020 18:39:57.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aNlACyfe/lbjzJMpHhSRkqG6OM967QB8ooRPtCb75k7dflfbCDBFA+OiJI0NTuQ86+lA22VoG1QHXW82Jqtupg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2814
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

[Why]
kfd2kgd interface will be deprecated. This removal only covers TLB
invalidation for now. They have been replaced in amdgpu_amdkfd API.

[How]
TLB invalidate functions removed from the different amdkfd_gfx_v*
versions.

Change-Id: Ic2c7d4a0d19fe1e884dee1ff10a520d31252afee
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c   |  2 -
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    | 67 -------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c | 41 --------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c | 41 --------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 96 -------------------
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |  2 -
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |  2 -
 7 files changed, 251 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
index f9011a07cb90..562e7a7f51a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c
@@ -317,7 +317,5 @@ const struct kfd2kgd_calls arcturus_kfd2kgd = {
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.get_tile_config = kgd_gfx_v9_get_tile_config,
 	.set_vm_context_page_table_base = kgd_set_vm_context_page_table_base,
-	.invalidate_tlbs = kgd_gfx_v9_invalidate_tlbs,
-	.invalidate_tlbs_vmid = kgd_gfx_v9_invalidate_tlbs_vmid,
 	.get_hive_id = amdgpu_amdkfd_get_hive_id,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 61cd707158e4..6132b4874498 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -686,71 +686,6 @@ static bool get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int invalidate_tlbs_with_kiq(struct amdgpu_device *adev, uint16_t pasid)
-{
-	signed long r;
-	uint32_t seq;
-	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
-
-	spin_lock(&adev->gfx.kiq.ring_lock);
-	amdgpu_ring_alloc(ring, 12); /* fence + invalidate_tlbs package*/
-	amdgpu_ring_write(ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
-	amdgpu_ring_write(ring,
-			PACKET3_INVALIDATE_TLBS_DST_SEL(1) |
-			PACKET3_INVALIDATE_TLBS_PASID(pasid));
-	amdgpu_fence_emit_polling(ring, &seq);
-	amdgpu_ring_commit(ring);
-	spin_unlock(&adev->gfx.kiq.ring_lock);
-
-	r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
-	if (r < 1) {
-		DRM_ERROR("wait for kiq fence error: %ld.\n", r);
-		return -ETIME;
-	}
-
-	return 0;
-}
-
-static int invalidate_tlbs(struct kgd_dev *kgd, uint16_t pasid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-	int vmid;
-	uint16_t queried_pasid;
-	bool ret;
-	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
-
-	if (amdgpu_emu_mode == 0 && ring->sched.ready)
-		return invalidate_tlbs_with_kiq(adev, pasid);
-
-	for (vmid = 0; vmid < 16; vmid++) {
-		if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid))
-			continue;
-
-		ret = get_atc_vmid_pasid_mapping_info(kgd, vmid,
-				&queried_pasid);
-		if (ret	&& queried_pasid == pasid) {
-			amdgpu_gmc_flush_gpu_tlb(adev, vmid,
-					AMDGPU_GFXHUB_0, 0);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int invalidate_tlbs_vmid(struct kgd_dev *kgd, uint16_t vmid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-
-	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
-		pr_err("non kfd vmid %d\n", vmid);
-		return 0;
-	}
-
-	amdgpu_gmc_flush_gpu_tlb(adev, vmid, AMDGPU_GFXHUB_0, 0);
-	return 0;
-}
-
 static int kgd_address_watch_disable(struct kgd_dev *kgd)
 {
 	return 0;
@@ -832,7 +767,5 @@ const struct kfd2kgd_calls gfx_v10_kfd2kgd = {
 			get_atc_vmid_pasid_mapping_info,
 	.get_tile_config = amdgpu_amdkfd_get_tile_config,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
-	.invalidate_tlbs = invalidate_tlbs,
-	.invalidate_tlbs_vmid = invalidate_tlbs_vmid,
 	.get_hive_id = amdgpu_amdkfd_get_hive_id,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index 6e6f0a99ec06..8f052e98a3c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -696,45 +696,6 @@ static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
 		lower_32_bits(page_table_base));
 }
 
-static int invalidate_tlbs(struct kgd_dev *kgd, uint16_t pasid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-	int vmid;
-	unsigned int tmp;
-
-	if (adev->in_gpu_reset)
-		return -EIO;
-
-	for (vmid = 0; vmid < 16; vmid++) {
-		if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid))
-			continue;
-
-		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
-		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
-			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
-			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
-			RREG32(mmVM_INVALIDATE_RESPONSE);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int invalidate_tlbs_vmid(struct kgd_dev *kgd, uint16_t vmid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-
-	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
-		pr_err("non kfd vmid\n");
-		return 0;
-	}
-
-	WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
-	RREG32(mmVM_INVALIDATE_RESPONSE);
-	return 0;
-}
-
  /**
   * read_vmid_from_vmfault_reg - read vmid from register
   *
@@ -771,7 +732,5 @@ const struct kfd2kgd_calls gfx_v7_kfd2kgd = {
 	.set_scratch_backing_va = set_scratch_backing_va,
 	.get_tile_config = get_tile_config,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
-	.invalidate_tlbs = invalidate_tlbs,
-	.invalidate_tlbs_vmid = invalidate_tlbs_vmid,
 	.read_vmid_from_vmfault_reg = read_vmid_from_vmfault_reg,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index bfbddedb2380..19a10db93d68 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -657,45 +657,6 @@ static void set_vm_context_page_table_base(struct kgd_dev *kgd, uint32_t vmid,
 			lower_32_bits(page_table_base));
 }
 
-static int invalidate_tlbs(struct kgd_dev *kgd, uint16_t pasid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-	int vmid;
-	unsigned int tmp;
-
-	if (adev->in_gpu_reset)
-		return -EIO;
-
-	for (vmid = 0; vmid < 16; vmid++) {
-		if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid))
-			continue;
-
-		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
-		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
-			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
-			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
-			RREG32(mmVM_INVALIDATE_RESPONSE);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-static int invalidate_tlbs_vmid(struct kgd_dev *kgd, uint16_t vmid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-
-	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
-		pr_err("non kfd vmid %d\n", vmid);
-		return -EINVAL;
-	}
-
-	WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
-	RREG32(mmVM_INVALIDATE_RESPONSE);
-	return 0;
-}
-
 const struct kfd2kgd_calls gfx_v8_kfd2kgd = {
 	.program_sh_mem_settings = kgd_program_sh_mem_settings,
 	.set_pasid_vmid_mapping = kgd_set_pasid_vmid_mapping,
@@ -717,6 +678,4 @@ const struct kfd2kgd_calls gfx_v8_kfd2kgd = {
 	.set_scratch_backing_va = set_scratch_backing_va,
 	.get_tile_config = get_tile_config,
 	.set_vm_context_page_table_base = set_vm_context_page_table_base,
-	.invalidate_tlbs = invalidate_tlbs,
-	.invalidate_tlbs_vmid = invalidate_tlbs_vmid,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index e7861f0ef415..932ae85d97e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -617,100 +617,6 @@ bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
 }
 
-static int invalidate_tlbs_with_kiq(struct amdgpu_device *adev, uint16_t pasid,
-			uint32_t flush_type)
-{
-	signed long r;
-	uint32_t seq;
-	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
-
-	spin_lock(&adev->gfx.kiq.ring_lock);
-	amdgpu_ring_alloc(ring, 12); /* fence + invalidate_tlbs package*/
-	amdgpu_ring_write(ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
-	amdgpu_ring_write(ring,
-			PACKET3_INVALIDATE_TLBS_DST_SEL(1) |
-			PACKET3_INVALIDATE_TLBS_ALL_HUB(1) |
-			PACKET3_INVALIDATE_TLBS_PASID(pasid) |
-			PACKET3_INVALIDATE_TLBS_FLUSH_TYPE(flush_type));
-	amdgpu_fence_emit_polling(ring, &seq);
-	amdgpu_ring_commit(ring);
-	spin_unlock(&adev->gfx.kiq.ring_lock);
-
-	r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
-	if (r < 1) {
-		DRM_ERROR("wait for kiq fence error: %ld.\n", r);
-		return -ETIME;
-	}
-
-	return 0;
-}
-
-int kgd_gfx_v9_invalidate_tlbs(struct kgd_dev *kgd, uint16_t pasid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-	int vmid, i;
-	uint16_t queried_pasid;
-	bool ret;
-	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
-	uint32_t flush_type = 0;
-
-	if (adev->in_gpu_reset)
-		return -EIO;
-	if (adev->gmc.xgmi.num_physical_nodes &&
-		adev->asic_type == CHIP_VEGA20)
-		flush_type = 2;
-
-	if (ring->sched.ready)
-		return invalidate_tlbs_with_kiq(adev, pasid, flush_type);
-
-	for (vmid = 0; vmid < 16; vmid++) {
-		if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid))
-			continue;
-
-		ret = kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(kgd, vmid,
-				&queried_pasid);
-		if (ret && queried_pasid == pasid) {
-			for (i = 0; i < adev->num_vmhubs; i++)
-				amdgpu_gmc_flush_gpu_tlb(adev, vmid,
-							i, flush_type);
-			break;
-		}
-	}
-
-	return 0;
-}
-
-int kgd_gfx_v9_invalidate_tlbs_vmid(struct kgd_dev *kgd, uint16_t vmid)
-{
-	struct amdgpu_device *adev = (struct amdgpu_device *) kgd;
-	int i;
-
-	if (!amdgpu_amdkfd_is_kfd_vmid(adev, vmid)) {
-		pr_err("non kfd vmid %d\n", vmid);
-		return 0;
-	}
-
-	/* Use legacy mode tlb invalidation.
-	 *
-	 * Currently on Raven the code below is broken for anything but
-	 * legacy mode due to a MMHUB power gating problem. A workaround
-	 * is for MMHUB to wait until the condition PER_VMID_INVALIDATE_REQ
-	 * == PER_VMID_INVALIDATE_ACK instead of simply waiting for the ack
-	 * bit.
-	 *
-	 * TODO 1: agree on the right set of invalidation registers for
-	 * KFD use. Use the last one for now. Invalidate both GC and
-	 * MMHUB.
-	 *
-	 * TODO 2: support range-based invalidation, requires kfg2kgd
-	 * interface change
-	 */
-	for (i = 0; i < adev->num_vmhubs; i++)
-		amdgpu_gmc_flush_gpu_tlb(adev, vmid, i, 0);
-
-	return 0;
-}
-
 int kgd_gfx_v9_address_watch_disable(struct kgd_dev *kgd)
 {
 	return 0;
@@ -793,7 +699,5 @@ const struct kfd2kgd_calls gfx_v9_kfd2kgd = {
 			kgd_gfx_v9_get_atc_vmid_pasid_mapping_info,
 	.get_tile_config = kgd_gfx_v9_get_tile_config,
 	.set_vm_context_page_table_base = kgd_gfx_v9_set_vm_context_page_table_base,
-	.invalidate_tlbs = kgd_gfx_v9_invalidate_tlbs,
-	.invalidate_tlbs_vmid = kgd_gfx_v9_invalidate_tlbs_vmid,
 	.get_hive_id = amdgpu_amdkfd_get_hive_id,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
index 02b1426d17d1..dfafa28b7559 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h
@@ -57,7 +57,5 @@ uint32_t kgd_gfx_v9_address_watch_get_offset(struct kgd_dev *kgd,
 
 bool kgd_gfx_v9_get_atc_vmid_pasid_mapping_info(struct kgd_dev *kgd,
 					uint8_t vmid, uint16_t *p_pasid);
-int kgd_gfx_v9_invalidate_tlbs(struct kgd_dev *kgd, uint16_t pasid);
-int kgd_gfx_v9_invalidate_tlbs_vmid(struct kgd_dev *kgd, uint16_t vmid);
 int kgd_gfx_v9_get_tile_config(struct kgd_dev *kgd,
 		struct tile_config *config);
diff --git a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
index 2cd217e60125..a01ef836ad58 100644
--- a/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_kfd_interface.h
@@ -307,8 +307,6 @@ struct kfd2kgd_calls {
 
 	void (*set_vm_context_page_table_base)(struct kgd_dev *kgd,
 			uint32_t vmid, uint64_t page_table_base);
-	int (*invalidate_tlbs)(struct kgd_dev *kgd, uint16_t pasid);
-	int (*invalidate_tlbs_vmid)(struct kgd_dev *kgd, uint16_t vmid);
 	uint32_t (*read_vmid_from_vmfault_reg)(struct kgd_dev *kgd);
 	uint64_t (*get_hive_id)(struct kgd_dev *kgd);
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
