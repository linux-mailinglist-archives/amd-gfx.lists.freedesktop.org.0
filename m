Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF849BEB4
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jan 2022 23:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615AE10E60B;
	Tue, 25 Jan 2022 22:38:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B58B10E5F7;
 Tue, 25 Jan 2022 22:38:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f87On7V2vW8mXEjj8vsz6XgQ1+ng6Cwkd0UxLxy65NMsH3neAZJ2uq1fFD56sjwsMh53Adua1/BXTRkBXelUEcDq+q3JHPyK8c3xD5/dNDLsiDOSi6B22I3RtNYRnaMVvURNXP/99hGopqV/asbPKnxdl7JS0D9tYtCnOxPmE/T3dl4zWf9Frz2DlCW+Rpk8O0v4vLbOfv0IJPznzulIicY1IdU4lOfJ3/AbN2cZsZfJg3YePwuhmesWOk30t+sMJa2tMCmYCszkdwkFRQFsM1SKUm/DceZbVofCMmSEomxTOcN/X/rXODVkx7XNbDJD0qu01Cofcy6H37Vla238Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VrOtf4AlwuVvJ7fN764PzPVSU91mOZX6pPUozlHxkB4=;
 b=BnBpLrtydnZd66iBOszPxYDhD0TV/ip0uV/idbparq7rxr8rK36Rg1/cqLs29LnzrsF2/SLdvF9Kk5CqlYkdVAlGY0xP+S/lVGBx3Krbvzm7h0I+6368nedVmgpoqvvUMq4X2oJBpphqBMFvWHBPP//BAw5HIbVYgXoGT9BHCJTb/cmxD1ZrWyvysiRXFDmAlmpnbo/w5IrhGptn1+JGUomXmTREvNOZStwxhErRcRf5uG8CHbsqdPCE8jYGqcHfycRWVfZvwZchU9SL/Tyu2R3x+ETPzSrSxwKESt+Zu5o39lFP04CIqkUM7n5p6y1sqzIdTVMieJ25uXcdXcUdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VrOtf4AlwuVvJ7fN764PzPVSU91mOZX6pPUozlHxkB4=;
 b=ZqZtlw8EQB2BSUyQvMJUZZniIer2fhVkkc918nsq8WLty/6171TWha1n3LK8o2+4z3Dt52CcZInoXNqUClxr1oqnUahJgNgeZaYzZwVgFjjZdDDXK6Mfk0Ssc2hBctuZ+j7Xt8qrYShlsZzaObt5dLEKgOGxQpWP2dUiuW8jGsE=
Received: from DM5PR21CA0027.namprd21.prod.outlook.com (2603:10b6:3:ed::13) by
 MW2PR12MB2346.namprd12.prod.outlook.com (2603:10b6:907:4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Tue, 25 Jan 2022 22:38:29 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ed:cafe::5e) by DM5PR21CA0027.outlook.office365.com
 (2603:10b6:3:ed::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.4 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 22:38:28 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:25 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 07/12] drm/amdgpu: Drop concurrent GPU reset protection for
 device
Date: Tue, 25 Jan 2022 17:37:47 -0500
Message-ID: <20220125223752.200211-8-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f64dbb8b-883c-401f-d7a3-08d9e053682e
X-MS-TrafficTypeDiagnostic: MW2PR12MB2346:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB234639A5BE4E8CE7A4F48AA4EA5F9@MW2PR12MB2346.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hv6Uxb/mLMPPp9Py+uj7NqSy60TrnUZ8Tsu3fLPSZPXd7qXAchCsphNinI+nkJcyh7cl3ZY7cYoqQ274pmpl40N272TOMwOpM1PPKEUPuoMQyNnR7AjnLrIgCO0L1DxB3RyNFqqzPkcrUOdEdAAOgY4QtQ6H1gVUUm8YZyafunEAlmTUcNXr0cmkZajJ5Umh4Y7WORjjVoH2M3LF0OyavQ/xpWy+uSFaF63QUgiSv2m9g1CZkl8gbdyKnuE8+1VUOY3O1MMcY5ZMd6oGx8/ylRoRmQPeVeq9WJqYRSnOAcjEFnTahTzuK4AY2ar+KwoXixox2BnfnXvdfZLXvzeeTamE9R7LQzRI4UtN7rxS/Vzyq5yZimcL440FFYTCZRVv0puiLg295zWjCPhNv63UhRG4ewlYBteunYBk6h7aZPla25M6YG2mI30wiXJZuohM7gcbxDo7+gRgj+LM4T1dQcatbB2kUaHq6WOjhcWL4NEzZ30iAWcbS6RtgfiGHjqEhaWYLmvJwUxRt3GfWbeYlnHGfM5z5XBM9T5B0CVR9RvWK8c3Rk8g91k6r/H7dP5Gd6iK0TOgERAvCWwfNAQ1obE3YqivNuwX3agd5zTvmI+6VvLe5CB9RvgvcQMrUaBAq33tqmdmOOLHpf+cLo1u/sg4ec+1iXLtCacBB4nnQUaJo1MEKY6UCeRzB8o4p0lsPUCnxxERyvAPY30ovujd9sOG5c9mnUyWJtXd4fOl5lt8yLCiM2RShVu/AceV7mTYHJh7gJSqwJCBp7gdiJLbEhVmPN90+VYgOEHhHblCXKY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(40470700004)(46966006)(36840700001)(36756003)(336012)(4326008)(16526019)(2616005)(426003)(6666004)(316002)(66574015)(5660300002)(70206006)(2906002)(508600001)(110136005)(8676002)(8936002)(26005)(81166007)(70586007)(1076003)(82310400004)(47076005)(40460700003)(44832011)(83380400001)(356005)(7696005)(86362001)(186003)(36860700001)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:28.3349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f64dbb8b-883c-401f-d7a3-08d9e053682e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2346
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
 Grodzovsky <andrey.grodzovsky@amd.com>, horace.chen@amd.com, lijo.lazar@amd.com,
 jingwech@amd.com, daniel@ffwll.ch, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Since now all GPU resets are serialzied there is no need for this.

This patch also reverts 'drm/amdgpu: race issue when jobs on 2 ring timeout'

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 89 ++--------------------
 1 file changed, 7 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 107a393ebbfd..fef952ca8db5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4763,11 +4763,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
+static void amdgpu_device_lock_adev(struct amdgpu_device *adev,
 				struct amdgpu_hive_info *hive)
 {
-	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
-		return false;
+	atomic_set(&adev->in_gpu_reset, 1);
 
 	if (hive) {
 		down_write_nest_lock(&adev->reset_sem, &hive->hive_lock);
@@ -4786,8 +4785,6 @@ static bool amdgpu_device_lock_adev(struct amdgpu_device *adev,
 		adev->mp1_state = PP_MP1_STATE_NONE;
 		break;
 	}
-
-	return true;
 }
 
 static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
@@ -4798,46 +4795,6 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 	up_write(&adev->reset_sem);
 }
 
-/*
- * to lockup a list of amdgpu devices in a hive safely, if not a hive
- * with multiple nodes, it will be similar as amdgpu_device_lock_adev.
- *
- * unlock won't require roll back.
- */
-static int amdgpu_device_lock_hive_adev(struct amdgpu_device *adev, struct amdgpu_hive_info *hive)
-{
-	struct amdgpu_device *tmp_adev = NULL;
-
-	if (adev->gmc.xgmi.num_physical_nodes > 1) {
-		if (!hive) {
-			dev_err(adev->dev, "Hive is NULL while device has multiple xgmi nodes");
-			return -ENODEV;
-		}
-		list_for_each_entry(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			if (!amdgpu_device_lock_adev(tmp_adev, hive))
-				goto roll_back;
-		}
-	} else if (!amdgpu_device_lock_adev(adev, hive))
-		return -EAGAIN;
-
-	return 0;
-roll_back:
-	if (!list_is_first(&tmp_adev->gmc.xgmi.head, &hive->device_list)) {
-		/*
-		 * if the lockup iteration break in the middle of a hive,
-		 * it may means there may has a race issue,
-		 * or a hive device locked up independently.
-		 * we may be in trouble and may not, so will try to roll back
-		 * the lock and give out a warnning.
-		 */
-		dev_warn(tmp_adev->dev, "Hive lock iteration broke in the middle. Rolling back to unlock");
-		list_for_each_entry_continue_reverse(tmp_adev, &hive->device_list, gmc.xgmi.head) {
-			amdgpu_device_unlock_adev(tmp_adev);
-		}
-	}
-	return -EAGAIN;
-}
-
 static void amdgpu_device_resume_display_audio(struct amdgpu_device *adev)
 {
 	struct pci_dev *p = NULL;
@@ -5023,22 +4980,6 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	reset_context.hive = hive;
 	clear_bit(AMDGPU_NEED_FULL_RESET, &reset_context.flags);
 
-	/*
-	 * lock the device before we try to operate the linked list
-	 * if didn't get the device lock, don't touch the linked list since
-	 * others may iterating it.
-	 */
-	r = amdgpu_device_lock_hive_adev(adev, hive);
-	if (r) {
-		dev_info(adev->dev, "Bailing on TDR for s_job:%llx, as another already in progress",
-					job ? job->base.id : -1);
-
-		/* even we skipped this reset, still need to set the job to guilty */
-		if (job && job->vm)
-			drm_sched_increase_karma(&job->base);
-		goto skip_recovery;
-	}
-
 	/*
 	 * Build list of devices to reset.
 	 * In case we are in XGMI hive mode, resort the device list
@@ -5058,6 +4999,9 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
+
+		amdgpu_device_lock_adev(tmp_adev, hive);
+
 		/*
 		 * Try to put the audio codec into suspend state
 		 * before gpu reset started.
@@ -5209,13 +5153,12 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 		amdgpu_device_unlock_adev(tmp_adev);
 	}
 
-skip_recovery:
 	if (hive) {
 		mutex_unlock(&hive->hive_lock);
 		amdgpu_put_xgmi_hive(hive);
 	}
 
-	if (r && r != -EAGAIN)
+	if (r)
 		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
 	return r;
 }
@@ -5438,20 +5381,6 @@ int amdgpu_device_baco_exit(struct drm_device *dev)
 	return 0;
 }
 
-static void amdgpu_cancel_all_tdr(struct amdgpu_device *adev)
-{
-	int i;
-
-	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
-		struct amdgpu_ring *ring = adev->rings[i];
-
-		if (!ring || !ring->sched.thread)
-			continue;
-
-		cancel_delayed_work_sync(&ring->sched.work_tdr);
-	}
-}
-
 /**
  * amdgpu_pci_error_detected - Called when a PCI error is detected.
  * @pdev: PCI device struct
@@ -5482,14 +5411,10 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 	/* Fatal error, prepare for slot reset */
 	case pci_channel_io_frozen:
 		/*
-		 * Cancel and wait for all TDRs in progress if failing to
-		 * set  adev->in_gpu_reset in amdgpu_device_lock_adev
-		 *
 		 * Locking adev->reset_sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		while (!amdgpu_device_lock_adev(adev, NULL))
-			amdgpu_cancel_all_tdr(adev);
+		amdgpu_device_lock_adev(adev, NULL);
 
 		/*
 		 * Block any work scheduling as we do for regular GPU reset
-- 
2.25.1

