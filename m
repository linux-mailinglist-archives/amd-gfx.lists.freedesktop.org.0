Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FE7136420
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jan 2020 01:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2E86E072;
	Fri, 10 Jan 2020 00:04:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD286E072
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jan 2020 00:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BC4l/DKy+qv76Mi5jMfOjEBG/YzvH3ht/+LzLKfM0m1r3Nf0mGDuSc8obn6IrVnHqLfwh5BJOODnHyk/atDQxmeKnVbMuonTxmaIE7zw+vpuDvWum3AySofvHsmc2EjVKmupfZA6q6J5ZcUxhdzpGoLlkwp7PYAtx5WrxYJETlgNp5SlMZbtAOA3QQ+tJdXNbViPGt3voE0vodR83a2+TdMStgRSVTg2Pag5Dqa7K7VpeYRtFeP8TG2i3/jn4PEW0CRA+NuaeJSAMZ+TcgGafC2j1EODV6OzkE5IB5slvfZp+XvgXMAj+DNix03GLnBxBSUSOmsM6Wn1uCEB/5v45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhOPaHJLzlXUQsIeAtAk/05uanJNKT0B6lGVfpILQJE=;
 b=KxeMsWBK4vF9biKN2swLN8ywrAYeNB3uVh87xxXOoGN/ctU2x1IiE2QKphYZeUuWVKHhpbHfwp2Lyjqwp67F8ZSXRg/cz4mYyMugMzwAu+nHf2tSVcE0xIiEemjoiedFhfzIeoeluS4Dyy5QMUthN5wOE7pypp5DDZQUsX/siEvBmYin3R4nJNqvwviccyUiub78g/FG4hOdlBc6wMWDy5gNvuaBWNezySTJvEY0BLvrzOKth4k8sKq4aEi5JaPGgqEi4O06hKnI8+wHPN2Fksa/9wPjCxPhIeG8Yo2JV7mc0eIM7l6ND2/Kr0Ba57vjt86hMM8n7nrpmkKbZBSRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhOPaHJLzlXUQsIeAtAk/05uanJNKT0B6lGVfpILQJE=;
 b=s1dUQH57xl8Y10Vn8ziY611hyEhPUmFgdfCKjl2K9PHwGsrAUCe5CleMLPp+GSB+/8zWMN/mDaWyroEGJ2wv9WjCDDBHyq9ZHCeHWpDyL9TvO1H0KzABi81CTr0f9Uo0uvw8EgfNtQr6dxhwn5oYKFCXi3A3ywRt9EtyOy+FPlA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alex.Sierra@amd.com; 
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (52.135.105.15) by
 SN6PR12MB2720.namprd12.prod.outlook.com (52.135.103.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Fri, 10 Jan 2020 00:04:26 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8923:17de:add5:1490%6]) with mapi id 15.20.2623.008; Fri, 10 Jan 2020
 00:04:26 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/7] drm/amdgpu: GPU TLB flush API moved to amdgpu_amdkfd
Date: Thu,  9 Jan 2020 18:04:08 -0600
Message-Id: <20200110000412.66930-3-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110000412.66930-1-alex.sierra@amd.com>
References: <20200110000412.66930-1-alex.sierra@amd.com>
X-ClientProxiedBy: SN2PR01CA0005.prod.exchangelabs.com (2603:10b6:804:2::15)
 To SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
MIME-Version: 1.0
Received: from alex-MS-7B09.amd.com (165.204.77.1) by
 SN2PR01CA0005.prod.exchangelabs.com (2603:10b6:804:2::15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.8 via Frontend Transport; Fri, 10 Jan 2020 00:04:26 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8ea2b249-043b-4f3d-8adf-08d79560a7ee
X-MS-TrafficTypeDiagnostic: SN6PR12MB2720:|SN6PR12MB2720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB272022E2CB50CB70509A6400FD380@SN6PR12MB2720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 02788FF38E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(376002)(39850400004)(189003)(199004)(26005)(316002)(36756003)(52116002)(16526019)(186003)(956004)(86362001)(1076003)(44832011)(5660300002)(6666004)(7696005)(6916009)(2616005)(81166006)(66476007)(66946007)(6486002)(8936002)(66556008)(4326008)(2906002)(81156014)(8676002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2720;
 H:SN6PR12MB2621.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CgQmxfarB5fkc/UFtXMIljPTGd4p1gA1XjZkrkXs74RCAhOS/a+9w40dI4yupE3hRHFGRyNLFbKu4GA77Fry8aTX4kmN9WujRmwrofjV6s2oLwSt7JBnE4GuM9vwxj59rxShpg/9eShnpsz2Hythv26Usmj24CQtxB6JR0paEouDYWIsVRbIjvNLHuSFn9/kAkTxPoxDWgCu3TD5MxN3apyah/gJwwZszcGaRaClJtLG5cpqAzrKY/Q+jKtrz+IdhEv1yaLtmkJ0X3wvAkRtuqbtE9NyiTggzL7UXb0V+dgoC2RGDDIWBi5Wk/2qkbb6DKfvleeQcQr6jJc1Txrf72lg0rcxrbYBHK3gfxRTW7Fo0wopGFo3Ro2prWfT9+4NVj4w0ez9GIn6w8YoxIqB82I79b2R8qDy1d2/GEPJsK5CNBCSm3vVVKRDMnLDbZTM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea2b249-043b-4f3d-8adf-08d79560a7ee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2020 00:04:26.5910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pkclIODZaM9bi1boU64tOVYH22Uh1Tvhwh2QqbI4lnQA8HMnDfSOkUs38W1Eq6RX9AnXzvU90YxKq6DvChL2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2720
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
TLB flush method has been deprecated using kfd2kgd interface.
This implementation is now on the amdgpu_amdkfd API.

[How]
TLB flush functions now implemented in amdgpu_amdkfd.

Change-Id: Ic51cccdfe6e71288d78da772b6e1b6ced72f8ef7
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 32 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c   |  8 ++++--
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 88e10b956413..8609287620ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -628,6 +628,38 @@ bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid)
 	return false;
 }
 
+int amdgpu_amdkfd_flush_gpu_tlb_vmid(struct kgd_dev *kgd, uint16_t vmid)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+
+	if (adev->family == AMDGPU_FAMILY_AI) {
+		int i;
+
+		for (i = 0; i < adev->num_vmhubs; i++)
+			amdgpu_gmc_flush_gpu_tlb(adev, vmid, i, 0);
+	} else {
+		amdgpu_gmc_flush_gpu_tlb(adev, vmid, AMDGPU_GFXHUB_0, 0);
+	}
+
+	return 0;
+}
+
+int amdgpu_amdkfd_flush_gpu_tlb_pasid(struct kgd_dev *kgd, uint16_t pasid)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	uint32_t flush_type = 0;
+	bool all_hub = false;
+
+	if (adev->gmc.xgmi.num_physical_nodes &&
+		adev->asic_type == CHIP_VEGA20)
+		flush_type = 2;
+
+	if (adev->family == AMDGPU_FAMILY_AI)
+		all_hub = true;
+
+	return amdgpu_gmc_flush_gpu_tlb_pasid(adev, pasid, flush_type, all_hub);
+}
+
 bool amdgpu_amdkfd_have_atomics_support(struct kgd_dev *kgd)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 069d5d230810..47b0f2957d1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -136,6 +136,8 @@ int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 				uint32_t *ib_cmd, uint32_t ib_len);
 void amdgpu_amdkfd_set_compute_idle(struct kgd_dev *kgd, bool idle);
 bool amdgpu_amdkfd_have_atomics_support(struct kgd_dev *kgd);
+int amdgpu_amdkfd_flush_gpu_tlb_vmid(struct kgd_dev *kgd, uint16_t vmid);
+int amdgpu_amdkfd_flush_gpu_tlb_pasid(struct kgd_dev *kgd, uint16_t pasid);
 
 bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 536a153ac9a4..25b90f70aecd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -32,6 +32,7 @@
 #include <linux/mman.h>
 #include <linux/file.h>
 #include "amdgpu_amdkfd.h"
+#include "amdgpu.h"
 
 struct mm_struct;
 
@@ -1152,16 +1153,17 @@ int kfd_reserved_mem_mmap(struct kfd_dev *dev, struct kfd_process *process,
 void kfd_flush_tlb(struct kfd_process_device *pdd)
 {
 	struct kfd_dev *dev = pdd->dev;
-	const struct kfd2kgd_calls *f2g = dev->kfd2kgd;
 
 	if (dev->dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
 		/* Nothing to flush until a VMID is assigned, which
 		 * only happens when the first queue is created.
 		 */
 		if (pdd->qpd.vmid)
-			f2g->invalidate_tlbs_vmid(dev->kgd, pdd->qpd.vmid);
+			amdgpu_amdkfd_flush_gpu_tlb_vmid(dev->kgd,
+							pdd->qpd.vmid);
 	} else {
-		f2g->invalidate_tlbs(dev->kgd, pdd->process->pasid);
+		amdgpu_amdkfd_flush_gpu_tlb_pasid(dev->kgd,
+						pdd->process->pasid);
 	}
 }
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
