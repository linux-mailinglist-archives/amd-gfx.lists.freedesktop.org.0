Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1174AC9EF
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Feb 2022 20:54:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE9110E829;
	Mon,  7 Feb 2022 19:54:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F3710E4BA
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Feb 2022 19:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlbTlqIn60XI6616TZo6Y0shYwAnetMsNXZhsQOPfktiPImamd1VonnfxwqNr7+7zIWqtcbCmO2M9SUg5xfs7WDokF3tEw+BJdHLyEZ7C0ermcAwqPkYK4qaYDeHtaQFd3Lj1Ux25strTr0engseigocmNQqan9KdRsB4peZx5lHu9V89BSf9OnddmEBGEb2NPx/9ISgLkfyQ31nOVVKT5vdwqtpDkd256OIcpK6qQHsq3/rqSPzat1zDKIsPrymhB5kiLkmbSta7MFvVM92GqB4UXzoov2anDYBZAG0VV3QGPt1cSODnCRv9NL0fLOp0tco2FARPwqk3I8WnGjSIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9vd7YRFtH764eGwDYQMJFjwdCtkH6eiAW1DMrTHYSE=;
 b=NHYolStqybQOeLm1FBcfItgkA8RXuzqel00IDpgqO120WkxTlSs3fripz2vqeadvk9dJUJH2/nre/wmgWO8kRcLV8Gvm/bmYES+sNITqg55pzn9MPG1NCK1ID3DE1GuuVlluspQ/AirkqSmQMGwijjiFNfPdB0U+uTzWoG94TRN0jHytyftfTX2rIEgG3YHSxdoW2xNT05tdiHri8h8LamyArn/qurWLXnvpW2ktFeqRlmxAVwjYmCgvuI+aMAU8EQEodHMBONz6KzF4Af8sYWvh8GrWfh98CVTcz/qVtPYSiEOo/Mju+wcHRSyO/I+AwzPZoKbLq7WhvrvywAq0Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9vd7YRFtH764eGwDYQMJFjwdCtkH6eiAW1DMrTHYSE=;
 b=O3ltn892obL1fkzghhx+eH7h0+Ch9HFc2dpxFUwtOZn9yZJczVsERYTbvwsr3KKP5xUcHSupRnIwvJX4owRdB5uiOVj5ltiX557e6yOhK8p4G7ne9EuPnvaLt89KRtbRqWmDeJUcCj2UtuUqKqbrkWh4egSshQgRfpSfY31MWZs=
Received: from DM3PR08CA0012.namprd08.prod.outlook.com (2603:10b6:0:52::22) by
 BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Mon, 7 Feb
 2022 19:54:18 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::e6) by DM3PR08CA0012.outlook.office365.com
 (2603:10b6:0:52::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Mon, 7 Feb 2022 19:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Mon, 7 Feb 2022 19:54:17 +0000
Received: from mukjoshi-dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Feb
 2022 13:54:16 -0600
From: Mukul Joshi <mukul.joshi@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCHv2 3/3] drm/amdkfd: Consolidate MQD manager functions
Date: Mon, 7 Feb 2022 14:53:51 -0500
Message-ID: <20220207195351.11640-1-mukul.joshi@amd.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce24f3a7-c5fe-4fc9-f0fa-08d9ea73a01e
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB55242444BE9D9B3063A2A0C2EE2C9@BL0PR12MB5524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /V6nahfqWHmAb6ZF8pS+YagpbkZTQ1nlD0Ikeew20zRBXq20Aay5RAPjoTFtuZXjUAiD/OSf37cuwSMtyy0LKC3w5yF9Yu6EZ5D/OUGjJtziIWDy/ktxevCdTRTOObOMVsv330tpgX01vz8eJg8R5Qb4QdUC3irSOfaQggoYYZW1z8/Bnz0//TJo8WC3b533bnBnoi4br4+Jo5UnNuWXLhS8Lb+9IIyjrmDWBRKslrwrgD4KnY7a1UnzqS6cU5Xz/Sbem3QpBkks/9Yw21NY2zzqKvcrwP6qEaj+kMvgt/hH8agJl3+/kXHaA5hJ5SyG2dWCu0mGecyH/aXCml8O09mFEnWMJHnuzn6KIStiiKreIoBOuI1jmTWxalfSU3aoAweo2x9azfKMQP7I3TibetzPZeUHNkDVHNPoBYQ2g/bOJUycwBuANCqM0xD911bwUshbhfQqhLuC8BYudWtVJFYQMdNO3jcjJw6GPcx6SS5njK59NNEdLfkXDxXT4LFKJiDO9wjLt+Y+aLWO8Fp5lm2Wvb/p6qeJDSsO+cgCf55mL5XejU9vI7Fbs6IYgegv1eME7MV/KO6NaUbYsm332HVcIKs4RjRnetwcG+hkQpllC2u3mlEBLUqr0CvWFNpXSHC7HS4Kmk9iPWzg5I/sSUfNTyuOLdNGTXUZC1M4axfi0z/knUSYQyL0rlq2nESc091j5iY8nu7xRUxXah7xXQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(426003)(336012)(16526019)(70586007)(1076003)(26005)(6666004)(2616005)(5660300002)(44832011)(30864003)(47076005)(82310400004)(83380400001)(316002)(2906002)(86362001)(6916009)(54906003)(4326008)(40460700003)(36756003)(8936002)(8676002)(186003)(70206006)(36860700001)(508600001)(7696005)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 19:54:17.7063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce24f3a7-c5fe-4fc9-f0fa-08d9ea73a01e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Felix.Kuehling@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

A few MQD manager functions are duplicated for all versions of
MQD manager. Remove this duplication by moving the common
functions into kfd_mqd_manager.c file.

Signed-off-by: Mukul Joshi <mukul.joshi@amd.com>
---
v1->v2:
- Add "kfd_" prefix to functions moved to kfd_mqd_manager.c.
- Also, suffix "_cp" to function names shared by CP, HIQ and DIQ.

 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c  | 63 +++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h  | 27 ++++++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c  | 76 +++------------
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  | 85 +++--------------
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   | 92 +++----------------
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c   | 75 +++------------
 6 files changed, 136 insertions(+), 282 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index e2825ad4d699..dd99f23e24f1 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -173,3 +173,66 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 		}
 	}
 }
+
+int kfd_hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
+		     uint32_t pipe_id, uint32_t queue_id,
+		     struct queue_properties *p, struct mm_struct *mms)
+{
+	return mm->dev->kfd2kgd->hiq_mqd_load(mm->dev->adev, mqd, pipe_id,
+					      queue_id, p->doorbell_off);
+}
+
+int kfd_destroy_mqd_cp(struct mqd_manager *mm, void *mqd,
+		enum kfd_preempt_type type, unsigned int timeout,
+		uint32_t pipe_id,uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_destroy(mm->dev->adev, mqd, type, timeout,
+						pipe_id, queue_id);
+}
+
+void kfd_free_mqd_cp(struct mqd_manager *mm, void *mqd,
+	      struct kfd_mem_obj *mqd_mem_obj)
+{
+	if (mqd_mem_obj->gtt_mem) {
+		amdgpu_amdkfd_free_gtt_mem(mm->dev->adev, mqd_mem_obj->gtt_mem);
+		kfree(mqd_mem_obj);
+	} else {
+		kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
+	}
+}
+
+bool kfd_is_occupied_cp(struct mqd_manager *mm, void *mqd,
+		 uint64_t queue_address, uint32_t pipe_id,
+		 uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_is_occupied(mm->dev->adev, queue_address,
+						pipe_id, queue_id);
+}
+
+int kfd_load_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		  uint32_t pipe_id, uint32_t queue_id,
+		  struct queue_properties *p, struct mm_struct *mms)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
+						(uint32_t __user *)p->write_ptr,
+						mms);
+}
+
+/*
+ * preempt type here is ignored because there is only one way
+ * to preempt sdma queue
+ */
+int kfd_destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		     enum kfd_preempt_type type,
+		     unsigned int timeout, uint32_t pipe_id,
+		     uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
+}
+
+bool kfd_is_occupied_sdma(struct mqd_manager *mm, void *mqd,
+		      uint64_t queue_address, uint32_t pipe_id,
+		      uint32_t queue_id)
+{
+	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
+}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
index 23486a23df84..21851110f9eb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.h
@@ -136,4 +136,31 @@ void mqd_symmetrically_map_cu_mask(struct mqd_manager *mm,
 		const uint32_t *cu_mask, uint32_t cu_mask_count,
 		uint32_t *se_mask);
 
+int kfd_hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
+		uint32_t pipe_id, uint32_t queue_id,
+		struct queue_properties *p, struct mm_struct *mms);
+
+int kfd_destroy_mqd_cp(struct mqd_manager *mm, void *mqd,
+		enum kfd_preempt_type type, unsigned int timeout,
+		uint32_t pipe_id,uint32_t queue_id);
+
+void kfd_free_mqd_cp(struct mqd_manager *mm, void *mqd,
+		struct kfd_mem_obj *mqd_mem_obj);
+
+bool kfd_is_occupied_cp(struct mqd_manager *mm, void *mqd,
+		 uint64_t queue_address, uint32_t pipe_id,
+		 uint32_t queue_id);
+
+int kfd_load_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		uint32_t pipe_id, uint32_t queue_id,
+		struct queue_properties *p, struct mm_struct *mms);
+
+int kfd_destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
+		enum kfd_preempt_type type,unsigned int timeout,
+		uint32_t pipe_id, uint32_t queue_id);
+
+bool kfd_is_occupied_sdma(struct mqd_manager *mm, void *mqd,
+		uint64_t queue_address, uint32_t pipe_id,
+		uint32_t queue_id);
+
 #endif /* KFD_MQD_MANAGER_H_ */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
index 96e3303fa27c..06aae5df6a37 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_cik.c
@@ -156,13 +156,6 @@ static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
 	mm->update_mqd(mm, m, q, NULL);
 }
 
-static void free_mqd(struct mqd_manager *mm, void *mqd,
-			struct kfd_mem_obj *mqd_mem_obj)
-{
-	kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
-}
-
-
 static int load_mqd(struct mqd_manager *mm, void *mqd, uint32_t pipe_id,
 		    uint32_t queue_id, struct queue_properties *p,
 		    struct mm_struct *mms)
@@ -176,15 +169,6 @@ static int load_mqd(struct mqd_manager *mm, void *mqd, uint32_t pipe_id,
 					  wptr_shift, wptr_mask, mms);
 }
 
-static int load_mqd_sdma(struct mqd_manager *mm, void *mqd,
-			 uint32_t pipe_id, uint32_t queue_id,
-			 struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
-					       (uint32_t __user *)p->write_ptr,
-					       mms);
-}
-
 static void __update_mqd(struct mqd_manager *mm, void *mqd,
 			struct queue_properties *q, struct mqd_update_info *minfo,
 			unsigned int atc_bit)
@@ -271,15 +255,6 @@ static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
 	q->is_active = QUEUE_IS_ACTIVE(*q);
 }
 
-static int destroy_mqd(struct mqd_manager *mm, void *mqd,
-			enum kfd_preempt_type type,
-			unsigned int timeout, uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_destroy(mm->dev->adev, mqd, type, timeout,
-					pipe_id, queue_id);
-}
-
 static void checkpoint_mqd(struct mqd_manager *mm, void *mqd, void *mqd_dst, void *ctl_stack_dst)
 {
 	struct cik_mqd *m;
@@ -351,35 +326,6 @@ static void restore_mqd_sdma(struct mqd_manager *mm, void **mqd,
 	qp->is_active = 0;
 }
 
-/*
- * preempt type here is ignored because there is only one way
- * to preempt sdma queue
- */
-static int destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
-				enum kfd_preempt_type type,
-				unsigned int timeout, uint32_t pipe_id,
-				uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
-}
-
-static bool is_occupied(struct mqd_manager *mm, void *mqd,
-			uint64_t queue_address,	uint32_t pipe_id,
-			uint32_t queue_id)
-{
-
-	return mm->dev->kfd2kgd->hqd_is_occupied(mm->dev->adev, queue_address,
-					pipe_id, queue_id);
-
-}
-
-static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
-			uint64_t queue_address,	uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
-}
-
 /*
  * HIQ MQD Implementation, concrete implementation for HIQ MQD implementation.
  * The HIQ queue in Kaveri is using the same MQD structure as all the user mode
@@ -460,11 +406,11 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_CP:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->checkpoint_mqd = checkpoint_mqd;
 		mqd->restore_mqd = restore_mqd;
 		mqd->mqd_size = sizeof(struct cik_mqd);
@@ -478,8 +424,8 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->free_mqd = free_mqd_hiq_sdma;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd_hiq;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct cik_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -489,11 +435,11 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_DIQ:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd_hiq;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd_hiq;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct cik_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -503,10 +449,10 @@ struct mqd_manager *mqd_manager_init_cik(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_sdma_mqd;
 		mqd->init_mqd = init_mqd_sdma;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = load_mqd_sdma;
+		mqd->load_mqd = kfd_load_mqd_sdma;
 		mqd->update_mqd = update_mqd_sdma;
-		mqd->destroy_mqd = destroy_mqd_sdma;
-		mqd->is_occupied = is_occupied_sdma;
+		mqd->destroy_mqd = kfd_destroy_mqd_sdma;
+		mqd->is_occupied = kfd_is_occupied_sdma;
 		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
 		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct cik_sdma_rlc_registers);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 0cc8679c24fa..88228009ded4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -154,14 +154,6 @@ static int load_mqd(struct mqd_manager *mm, void *mqd,
 	return r;
 }
 
-static int hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
-			    uint32_t pipe_id, uint32_t queue_id,
-			    struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hiq_mqd_load(mm->dev->adev, mqd, pipe_id,
-					      queue_id, p->doorbell_off);
-}
-
 static void update_mqd(struct mqd_manager *mm, void *mqd,
 			struct queue_properties *q,
 			struct mqd_update_info *minfo)
@@ -233,31 +225,6 @@ static uint32_t read_doorbell_id(void *mqd)
 	return m->queue_doorbell_id0;
 }
 
-static int destroy_mqd(struct mqd_manager *mm, void *mqd,
-		       enum kfd_preempt_type type,
-		       unsigned int timeout, uint32_t pipe_id,
-		       uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_destroy
-		(mm->dev->adev, mqd, type, timeout,
-		 pipe_id, queue_id);
-}
-
-static void free_mqd(struct mqd_manager *mm, void *mqd,
-			struct kfd_mem_obj *mqd_mem_obj)
-{
-	kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
-}
-
-static bool is_occupied(struct mqd_manager *mm, void *mqd,
-			uint64_t queue_address,	uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_is_occupied(
-		mm->dev->adev, queue_address,
-		pipe_id, queue_id);
-}
-
 static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  void __user *ctl_stack,
 			  u32 *ctl_stack_used_size,
@@ -352,15 +319,6 @@ static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
 	mm->update_mqd(mm, m, q, NULL);
 }
 
-static int load_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		uint32_t pipe_id, uint32_t queue_id,
-		struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
-					       (uint32_t __user *)p->write_ptr,
-					       mms);
-}
-
 #define SDMA_RLC_DUMMY_DEFAULT 0xf
 
 static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
@@ -390,25 +348,6 @@ static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
 	q->is_active = QUEUE_IS_ACTIVE(*q);
 }
 
-/*
- *  * preempt type here is ignored because there is only one way
- *  * to preempt sdma queue
- */
-static int destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		enum kfd_preempt_type type,
-		unsigned int timeout, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
-}
-
-static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
-		uint64_t queue_address, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
-}
-
 static void checkpoint_mqd_sdma(struct mqd_manager *mm,
 				void *mqd,
 				void *mqd_dst,
@@ -483,11 +422,11 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		pr_debug("%s@%i\n", __func__, __LINE__);
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 		mqd->get_wave_state = get_wave_state;
 		mqd->checkpoint_mqd = checkpoint_mqd;
@@ -502,10 +441,10 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_hiq_mqd;
 		mqd->init_mqd = init_mqd_hiq;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = hiq_load_mqd_kiq;
+		mqd->load_mqd = kfd_hiq_load_mqd_kiq;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -516,11 +455,11 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_DIQ:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd_hiq;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct v10_compute_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -531,10 +470,10 @@ struct mqd_manager *mqd_manager_init_v10(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_sdma_mqd;
 		mqd->init_mqd = init_mqd_sdma;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = load_mqd_sdma;
+		mqd->load_mqd = kfd_load_mqd_sdma;
 		mqd->update_mqd = update_mqd_sdma;
-		mqd->destroy_mqd = destroy_mqd_sdma;
-		mqd->is_occupied = is_occupied_sdma;
+		mqd->destroy_mqd = kfd_destroy_mqd_sdma;
+		mqd->is_occupied = kfd_is_occupied_sdma;
 		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
 		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v10_sdma_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 87da4329dbf2..dff58ee53557 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -204,14 +204,6 @@ static int load_mqd(struct mqd_manager *mm, void *mqd,
 					  wptr_shift, 0, mms);
 }
 
-static int hiq_load_mqd_kiq(struct mqd_manager *mm, void *mqd,
-			    uint32_t pipe_id, uint32_t queue_id,
-			    struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hiq_mqd_load(mm->dev->adev, mqd, pipe_id,
-					      queue_id, p->doorbell_off);
-}
-
 static void update_mqd(struct mqd_manager *mm, void *mqd,
 			struct queue_properties *q,
 			struct mqd_update_info *minfo)
@@ -285,38 +277,6 @@ static uint32_t read_doorbell_id(void *mqd)
 	return m->queue_doorbell_id0;
 }
 
-static int destroy_mqd(struct mqd_manager *mm, void *mqd,
-			enum kfd_preempt_type type,
-			unsigned int timeout, uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_destroy
-		(mm->dev->adev, mqd, type, timeout,
-		pipe_id, queue_id);
-}
-
-static void free_mqd(struct mqd_manager *mm, void *mqd,
-			struct kfd_mem_obj *mqd_mem_obj)
-{
-	struct kfd_dev *kfd = mm->dev;
-
-	if (mqd_mem_obj->gtt_mem) {
-		amdgpu_amdkfd_free_gtt_mem(kfd->adev, mqd_mem_obj->gtt_mem);
-		kfree(mqd_mem_obj);
-	} else {
-		kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
-	}
-}
-
-static bool is_occupied(struct mqd_manager *mm, void *mqd,
-			uint64_t queue_address,	uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_is_occupied(
-		mm->dev->adev, queue_address,
-		pipe_id, queue_id);
-}
-
 static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  void __user *ctl_stack,
 			  u32 *ctl_stack_used_size,
@@ -422,15 +382,6 @@ static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
 	mm->update_mqd(mm, m, q, NULL);
 }
 
-static int load_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		uint32_t pipe_id, uint32_t queue_id,
-		struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
-					       (uint32_t __user *)p->write_ptr,
-					       mms);
-}
-
 #define SDMA_RLC_DUMMY_DEFAULT 0xf
 
 static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
@@ -460,25 +411,6 @@ static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
 	q->is_active = QUEUE_IS_ACTIVE(*q);
 }
 
-/*
- *  * preempt type here is ignored because there is only one way
- *  * to preempt sdma queue
- */
-static int destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		enum kfd_preempt_type type,
-		unsigned int timeout, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
-}
-
-static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
-		uint64_t queue_address, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
-}
-
 static void checkpoint_mqd_sdma(struct mqd_manager *mm,
 				void *mqd,
 				void *mqd_dst,
@@ -551,11 +483,11 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_CP:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->get_wave_state = get_wave_state;
 		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
@@ -569,10 +501,10 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_hiq_mqd;
 		mqd->init_mqd = init_mqd_hiq;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = hiq_load_mqd_kiq;
+		mqd->load_mqd = kfd_hiq_load_mqd_kiq;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct v9_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -582,11 +514,11 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_DIQ:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd_hiq;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct v9_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -596,10 +528,10 @@ struct mqd_manager *mqd_manager_init_v9(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_sdma_mqd;
 		mqd->init_mqd = init_mqd_sdma;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = load_mqd_sdma;
+		mqd->load_mqd = kfd_load_mqd_sdma;
 		mqd->update_mqd = update_mqd_sdma;
-		mqd->destroy_mqd = destroy_mqd_sdma;
-		mqd->is_occupied = is_occupied_sdma;
+		mqd->destroy_mqd = kfd_destroy_mqd_sdma;
+		mqd->is_occupied = kfd_is_occupied_sdma;
 		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
 		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct v9_sdma_mqd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
index 137b208135a0..86fc5decacf0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
@@ -259,31 +259,6 @@ static void update_mqd_tonga(struct mqd_manager *mm, void *mqd,
 	__update_mqd(mm, mqd, q, minfo, MTYPE_UC, 0);
 }
 
-static int destroy_mqd(struct mqd_manager *mm, void *mqd,
-			enum kfd_preempt_type type,
-			unsigned int timeout, uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_destroy
-		(mm->dev->adev, mqd, type, timeout,
-		pipe_id, queue_id);
-}
-
-static void free_mqd(struct mqd_manager *mm, void *mqd,
-			struct kfd_mem_obj *mqd_mem_obj)
-{
-	kfd_gtt_sa_free(mm->dev, mqd_mem_obj);
-}
-
-static bool is_occupied(struct mqd_manager *mm, void *mqd,
-			uint64_t queue_address,	uint32_t pipe_id,
-			uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_is_occupied(
-		mm->dev->adev, queue_address,
-		pipe_id, queue_id);
-}
-
 static int get_wave_state(struct mqd_manager *mm, void *mqd,
 			  void __user *ctl_stack,
 			  u32 *ctl_stack_used_size,
@@ -385,15 +360,6 @@ static void init_mqd_sdma(struct mqd_manager *mm, void **mqd,
 	mm->update_mqd(mm, m, q, NULL);
 }
 
-static int load_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		uint32_t pipe_id, uint32_t queue_id,
-		struct queue_properties *p, struct mm_struct *mms)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_load(mm->dev->adev, mqd,
-					       (uint32_t __user *)p->write_ptr,
-					       mms);
-}
-
 static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
 			struct queue_properties *q,
 			struct mqd_update_info *minfo)
@@ -422,25 +388,6 @@ static void update_mqd_sdma(struct mqd_manager *mm, void *mqd,
 	q->is_active = QUEUE_IS_ACTIVE(*q);
 }
 
-/*
- *  * preempt type here is ignored because there is only one way
- *  * to preempt sdma queue
- */
-static int destroy_mqd_sdma(struct mqd_manager *mm, void *mqd,
-		enum kfd_preempt_type type,
-		unsigned int timeout, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_destroy(mm->dev->adev, mqd, timeout);
-}
-
-static bool is_occupied_sdma(struct mqd_manager *mm, void *mqd,
-		uint64_t queue_address, uint32_t pipe_id,
-		uint32_t queue_id)
-{
-	return mm->dev->kfd2kgd->hqd_sdma_is_occupied(mm->dev->adev, mqd);
-}
-
 static void checkpoint_mqd_sdma(struct mqd_manager *mm,
 				void *mqd,
 				void *mqd_dst,
@@ -514,11 +461,11 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_CP:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->get_wave_state = get_wave_state;
 		mqd->get_checkpoint_info = get_checkpoint_info;
 		mqd->checkpoint_mqd = checkpoint_mqd;
@@ -534,8 +481,8 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->free_mqd = free_mqd_hiq_sdma;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd_hiq;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct vi_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -545,11 +492,11 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 	case KFD_MQD_TYPE_DIQ:
 		mqd->allocate_mqd = allocate_mqd;
 		mqd->init_mqd = init_mqd_hiq;
-		mqd->free_mqd = free_mqd;
+		mqd->free_mqd = kfd_free_mqd_cp;
 		mqd->load_mqd = load_mqd;
 		mqd->update_mqd = update_mqd_hiq;
-		mqd->destroy_mqd = destroy_mqd;
-		mqd->is_occupied = is_occupied;
+		mqd->destroy_mqd = kfd_destroy_mqd_cp;
+		mqd->is_occupied = kfd_is_occupied_cp;
 		mqd->mqd_size = sizeof(struct vi_mqd);
 #if defined(CONFIG_DEBUG_FS)
 		mqd->debugfs_show_mqd = debugfs_show_mqd;
@@ -559,10 +506,10 @@ struct mqd_manager *mqd_manager_init_vi(enum KFD_MQD_TYPE type,
 		mqd->allocate_mqd = allocate_sdma_mqd;
 		mqd->init_mqd = init_mqd_sdma;
 		mqd->free_mqd = free_mqd_hiq_sdma;
-		mqd->load_mqd = load_mqd_sdma;
+		mqd->load_mqd = kfd_load_mqd_sdma;
 		mqd->update_mqd = update_mqd_sdma;
-		mqd->destroy_mqd = destroy_mqd_sdma;
-		mqd->is_occupied = is_occupied_sdma;
+		mqd->destroy_mqd = kfd_destroy_mqd_sdma;
+		mqd->is_occupied = kfd_is_occupied_sdma;
 		mqd->checkpoint_mqd = checkpoint_mqd_sdma;
 		mqd->restore_mqd = restore_mqd_sdma;
 		mqd->mqd_size = sizeof(struct vi_sdma_mqd);
-- 
2.33.1

