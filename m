Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C1524AC40
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Aug 2020 02:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE636E889;
	Thu, 20 Aug 2020 00:34:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700056.outbound.protection.outlook.com [40.107.70.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F310C6E889
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Aug 2020 00:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOR8wIgfnPDn/PYDF35by7GAX9T4MA+TeSs+9KTB26Ph1vAl6cYN37jTHTkzsorMeAQIwYvIwYJ5w4EC9F4s4Ik5lIBSkdfdxk2NWU5uOXk2+faZnSimhkW7IjtN/KtStzPmkZrdRdP/lcTSbLBkrFq71C1cHjmVIHu2UTgPp+OELnrDBKEU19L1IXTLKrdFq8q2NdA/B/GLe1nlmNNu+bq0Dx16CkiBcHUpiKYVIXsyaB5g3UeE4zWkORk7xJQPw69JZgI1sHa/AVLi4BwvjQK4kA17Ci5FTA7WCdWZx/DYmw8CDzqQNXBRQMQ7fsooof8VL/LEyAP90lV44FehSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp+A0ipzDw9i+TK0aUMESy1nXBmEWLQ1Z9Z8I3lzelE=;
 b=XRz4nh9DnY3LK/ghf/fBwaNJmNyzoBa/GwvnsGBCRoEnBYH5lauwFz9KrwpFsKvFYUI9BLPJtDxgrBIQYDfNpoR+6i9Q43Og5w/mEaKO7EGCQkOECFI12rZOp+OfGZhvTRx83VbjXqBpjAt5Gj7j4/CvT9p15LUlmlRMpyfDvG0IYTBO2zGPEgqnRdTskNq2M2d4a7OflSd6NylFdeVWYJbHAsLQ2YHQ5JuE9rtBadIECujqKXbxAnGSQZHxA4O4X+X5YF5UgfCI5dQHCL553uxefoa9JJnv1XgTvEVAAq3+Z+nv0kz5JWksQpPcUKRFWhbMHlvRb9+N5ftVzduNEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kp+A0ipzDw9i+TK0aUMESy1nXBmEWLQ1Z9Z8I3lzelE=;
 b=aFb7CTi0CvzOmzExsFFOVNq7mLs0aLumNOtUi+IjLKO2cKSyQyX6FwscjC08xKFrVGnJi4oKipD2EkZiicfHo2cUYHQsjCUCt07VbbWaGH6wEVUNi6wc9jn8QbkthH1rPuVLIvNbH6EFwwFM7zq6YpGtqfgWZNS1ytqVXAoSLgk=
Received: from MW2PR2101CA0020.namprd21.prod.outlook.com (2603:10b6:302:1::33)
 by BYAPR12MB3637.namprd12.prod.outlook.com (2603:10b6:a03:da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 20 Aug
 2020 00:33:56 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::25) by MW2PR2101CA0020.outlook.office365.com
 (2603:10b6:302:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.0 via Frontend
 Transport; Thu, 20 Aug 2020 00:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3283.16 via Frontend Transport; Thu, 20 Aug 2020 00:33:56 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 19:33:54 -0500
Received: from yajunl-gv.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 19 Aug 2020 19:33:52 -0500
From: Dennis Li <Dennis.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Alexander.Deucher@amd.com>,
 <felix.kuehling@amd.com>, <Hawking.Zhang@amd.com>, <christian.koenig@amd.com>
Subject: [PATCH v2] drm/amdgpu: refine codes to avoid reentering GPU recovery
Date: Thu, 20 Aug 2020 08:33:29 +0800
Message-ID: <20200820003329.14930-1-Dennis.Li@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b40249d-2122-4f14-f1cb-08d844a0b90e
X-MS-TrafficTypeDiagnostic: BYAPR12MB3637:
X-Microsoft-Antispam-PRVS: <BYAPR12MB36376F43DDA9C9D17BFBB6E3ED5A0@BYAPR12MB3637.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5ykeMCuCfgNIRZtGZ1W9FhGuEqy2yVRTEK7ypAREWzdhYLhKdqIe9loFrZWdd5PiPB7HoHhD4rnuM86zyvnyx38t7a+A8YIwlx6UTa4ap+PEbvqorWAuQONEbtUp0VJBR0dBbTIKDzc4BTRVOfiyCe4PanY8MhXIL8TUDM5AyClMuGt+/sGxlG3YP0E93DIrw9yryR3UtY5alzoD68nv/vvZXH/Hl4SAtHYd1f1ALDsX9WqeTN2UvWgG9ywJ0O4A5mnl5moAhB8P8PDqiL5cpVKlc0cwu2YyqsMtX0aKUjYSYDhu1ZWXIk+y/5NwOTnK9UuqHL/frjUlX9pygfXfH3N/o5z+2uZCnEULK1YzZsx9i7rPUKFZmT4mr3ZZTs8629fh1n6WRVebdRn6DZp4/Iu5r8aszUq1c25ttMbzoI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(136003)(39860400002)(46966005)(70586007)(186003)(356005)(336012)(2906002)(478600001)(47076004)(81166007)(1076003)(426003)(5660300002)(82740400003)(7696005)(36756003)(70206006)(4326008)(26005)(2616005)(6636002)(83380400001)(8676002)(8936002)(6666004)(316002)(30864003)(86362001)(82310400002)(110136005)(2101003)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 00:33:56.1576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b40249d-2122-4f14-f1cb-08d844a0b90e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3637
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
Cc: Dennis Li <Dennis.Li@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

if other threads have holden the reset lock, recovery will
fail to try_lock. Therefore we introduce atomic hive->in_reset
and adev->in_gpu_reset, to avoid reentering GPU recovery.

v2:
drop "? true : false" in the definition of amdgpu_in_reset

Signed-off-by: Dennis Li <Dennis.Li@amd.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8ba389780001..c8aec832b244 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -952,7 +952,7 @@ struct amdgpu_device {
 	bool                            in_suspend;
 	bool				in_hibernate;
 
-	bool                            in_gpu_reset;
+	atomic_t 			in_gpu_reset;
 	enum pp_mp1_state               mp1_state;
 	struct mutex  lock_reset;
 	struct amdgpu_doorbell_index doorbell_index;
@@ -1270,4 +1270,8 @@ static inline bool amdgpu_is_tmz(struct amdgpu_device *adev)
        return adev->gmc.tmz_enabled;
 }
 
+static inline int amdgpu_in_reset(struct amdgpu_device *adev)
+{
+	return atomic_read(&adev->in_gpu_reset);
+}
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
index 691c89705bcd..b872cdb0b705 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c
@@ -543,7 +543,7 @@ static int kgd_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	uint32_t temp;
 	struct v10_compute_mqd *m = get_mqd(mqd);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 #if 0
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
index 0b7e78748540..832a200bb62f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c
@@ -425,7 +425,7 @@ static int kgd_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	unsigned long flags, end_jiffies;
 	int retry;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	acquire_queue(kgd, pipe_id, queue_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
index ccd635b812b5..d0940121a6a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c
@@ -421,7 +421,7 @@ static int kgd_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	int retry;
 	struct vi_mqd *m = get_mqd(mqd);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	acquire_queue(kgd, pipe_id, queue_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
index 4cd851fc5c82..64fdb6a81c47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
@@ -554,7 +554,7 @@ int kgd_gfx_v9_hqd_destroy(struct kgd_dev *kgd, void *mqd,
 	uint32_t temp;
 	struct v9_mqd *m = get_mqd(mqd);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	acquire_queue(kgd, pipe_id, queue_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 35fed75a4397..79b397800cbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -127,7 +127,7 @@ static unsigned int amdgpu_debugfs_autodump_poll(struct file *file, struct poll_
 
 	poll_wait(file, &adev->autodump.gpu_hang, poll_table);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return POLLIN | POLLRDNORM | POLLWRNORM;
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 6573e1112462..78fd2c9a7b7d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1940,7 +1940,7 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 			if (adev->ip_blocks[i].status.hw == true)
 				break;
 
-			if (adev->in_gpu_reset || adev->in_suspend) {
+			if (amdgpu_in_reset(adev) || adev->in_suspend) {
 				r = adev->ip_blocks[i].version->funcs->resume(adev);
 				if (r) {
 					DRM_ERROR("resume of IP block <%s> failed %d\n",
@@ -2117,7 +2117,7 @@ static bool amdgpu_device_check_vram_lost(struct amdgpu_device *adev)
 			AMDGPU_RESET_MAGIC_NUM))
 		return true;
 
-	if (!adev->in_gpu_reset)
+	if (!amdgpu_in_reset(adev))
 		return false;
 
 	/*
@@ -3053,6 +3053,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->mn_lock);
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
+	atomic_set(&adev->in_gpu_reset, 0);
 	mutex_init(&adev->lock_reset);
 	mutex_init(&adev->psp.mutex);
 	mutex_init(&adev->notifier_lock);
@@ -4200,16 +4201,14 @@ static int amdgpu_do_asic_reset(struct amdgpu_hive_info *hive,
 	return r;
 }
 
-static bool amdgpu_device_lock_adev(struct amdgpu_device *adev, bool trylock)
+static bool amdgpu_device_lock_adev(struct amdgpu_device *adev)
 {
-	if (trylock) {
-		if (!mutex_trylock(&adev->lock_reset))
-			return false;
-	} else
-		mutex_lock(&adev->lock_reset);
+	if (atomic_cmpxchg(&adev->in_gpu_reset, 0, 1) != 0)
+		return false;
+
+	mutex_lock(&adev->lock_reset);
 
 	atomic_inc(&adev->gpu_reset_counter);
-	adev->in_gpu_reset = true;
 	switch (amdgpu_asic_reset_method(adev)) {
 	case AMD_RESET_METHOD_MODE1:
 		adev->mp1_state = PP_MP1_STATE_SHUTDOWN;
@@ -4229,7 +4228,7 @@ static void amdgpu_device_unlock_adev(struct amdgpu_device *adev)
 {
 	amdgpu_vf_error_trans_all(adev);
 	adev->mp1_state = PP_MP1_STATE_NONE;
-	adev->in_gpu_reset = false;
+	atomic_set(&adev->in_gpu_reset, 0);
 	mutex_unlock(&adev->lock_reset);
 }
 
@@ -4340,12 +4339,14 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	 * We always reset all schedulers for device and all devices for XGMI
 	 * hive so that should take care of them too.
 	 */
-	hive = amdgpu_get_xgmi_hive(adev, true);
-	if (hive && !mutex_trylock(&hive->reset_lock)) {
-		DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
-			  job ? job->base.id : -1, hive->hive_id);
-		mutex_unlock(&hive->hive_lock);
-		return 0;
+	hive = amdgpu_get_xgmi_hive(adev, false);
+	if (hive) {
+		if (atomic_cmpxchg(&hive->in_reset, 0, 1) != 0) {
+			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
+				job ? job->base.id : -1, hive->hive_id);
+			return 0;
+		}
+		mutex_lock(&hive->hive_lock);
 	}
 
 	/*
@@ -4367,7 +4368,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, gmc.xgmi.head) {
-		if (!amdgpu_device_lock_adev(tmp_adev, !hive)) {
+		if (!amdgpu_device_lock_adev(tmp_adev)) {
 			DRM_INFO("Bailing on TDR for s_job:%llx, as another already in progress",
 				  job ? job->base.id : -1);
 			mutex_unlock(&hive->hive_lock);
@@ -4505,7 +4506,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 	}
 
 	if (hive) {
-		mutex_unlock(&hive->reset_lock);
+		atomic_set(&hive->in_reset, 0);
 		mutex_unlock(&hive->hive_lock);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a819360a4b6a..ebea3f655826 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -719,7 +719,7 @@ uint32_t amdgpu_kiq_rreg(struct amdgpu_device *adev, uint32_t reg)
 	 *
 	 * also don't wait anymore for IRQ context
 	 * */
-	if (r < 1 && (adev->in_gpu_reset || in_interrupt()))
+	if (r < 1 && (amdgpu_in_reset(adev) || in_interrupt()))
 		goto failed_kiq_read;
 
 	might_sleep();
@@ -777,7 +777,7 @@ void amdgpu_kiq_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t v)
 	 *
 	 * also don't wait anymore for IRQ context
 	 * */
-	if (r < 1 && (adev->in_gpu_reset || in_interrupt()))
+	if (r < 1 && (amdgpu_in_reset(adev) || in_interrupt()))
 		goto failed_kiq_write;
 
 	might_sleep();
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index aa1e77c60c0a..116a89990f39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1869,7 +1869,7 @@ static int psp_load_smu_fw(struct psp_context *psp)
 		return 0;
 
 
-	if (adev->in_gpu_reset && ras && ras->supported) {
+	if (amdgpu_in_reset(adev) && ras && ras->supported) {
 		ret = amdgpu_dpm_set_mp1_state(adev, PP_MP1_STATE_UNLOAD);
 		if (ret) {
 			DRM_WARN("Failed to set MP1 state prepare for reload\n");
@@ -1984,7 +1984,7 @@ static int psp_load_fw(struct amdgpu_device *adev)
 	int ret;
 	struct psp_context *psp = &adev->psp;
 
-	if (amdgpu_sriov_vf(adev) && adev->in_gpu_reset) {
+	if (amdgpu_sriov_vf(adev) && amdgpu_in_reset(adev)) {
 		psp_ring_stop(psp, PSP_RING_TYPE__KM); /* should not destroy ring, only stop */
 		goto skip_memalloc;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 866373c95cae..fa2c28ae9785 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2081,7 +2081,7 @@ int amdgpu_ras_late_init(struct amdgpu_device *adev,
 			amdgpu_ras_request_reset_on_boot(adev,
 					ras_block->block);
 			return 0;
-		} else if (adev->in_suspend || adev->in_gpu_reset) {
+		} else if (adev->in_suspend || amdgpu_in_reset(adev)) {
 			/* in resume phase, if fail to enable ras,
 			 * clean up all ras fs nodes, and disable ras */
 			goto cleanup;
@@ -2090,7 +2090,7 @@ int amdgpu_ras_late_init(struct amdgpu_device *adev,
 	}
 
 	/* in resume phase, no need to create ras fs node */
-	if (adev->in_suspend || adev->in_gpu_reset)
+	if (adev->in_suspend || amdgpu_in_reset(adev))
 		return 0;
 
 	if (ih_info->cb) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 0b3c813bf8b8..60e2d3267ae5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2103,7 +2103,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	uint64_t size;
 	int r;
 
-	if (!adev->mman.initialized || adev->in_gpu_reset ||
+	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
 	    adev->mman.buffer_funcs_enabled == enable)
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 183743c5fb7b..5f851d17eef4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -628,7 +628,7 @@ int amdgpu_ucode_init_bo(struct amdgpu_device *adev)
 	struct amdgpu_firmware_info *ucode = NULL;
 
  /* for baremetal, the ucode is allocated in gtt, so don't need to fill the bo when reset/suspend */
-	if (!amdgpu_sriov_vf(adev) && (adev->in_gpu_reset || adev->in_suspend))
+	if (!amdgpu_sriov_vf(adev) && (amdgpu_in_reset(adev) || adev->in_suspend))
 		return 0;
 	/*
 	 * if SMU loaded firmware, it needn't add SMC, UVD, and VCE
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index f826945989c7..b2046c3a404d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -325,9 +325,9 @@ static inline bool is_virtual_machine(void)
 #define amdgpu_sriov_is_pp_one_vf(adev) \
 	((adev)->virt.gim_feature & AMDGIM_FEATURE_PP_ONE_VF)
 #define amdgpu_sriov_is_debug(adev) \
-	((!adev->in_gpu_reset) && adev->virt.tdr_debug)
+	((!amdgpu_in_reset(adev)) && adev->virt.tdr_debug)
 #define amdgpu_sriov_is_normal(adev) \
-	((!adev->in_gpu_reset) && (!adev->virt.tdr_debug))
+	((!amdgpu_in_reset(adev)) && (!adev->virt.tdr_debug))
 
 bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev);
 void amdgpu_virt_init_setting(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index cd6e6eb7d966..7a61dc6738eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -372,7 +372,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev, int lo
 	tmp->hive_id = adev->gmc.xgmi.hive_id;
 	INIT_LIST_HEAD(&tmp->device_list);
 	mutex_init(&tmp->hive_lock);
-	mutex_init(&tmp->reset_lock);
+	atomic_set(&tmp->in_reset, 0);
 	task_barrier_init(&tmp->tb);
 
 	if (lock)
@@ -594,7 +594,6 @@ int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
 	if(!(--hive->number_devices)){
 		amdgpu_xgmi_sysfs_destroy(adev, hive);
 		mutex_destroy(&hive->hive_lock);
-		mutex_destroy(&hive->reset_lock);
 	}
 
 	return psp_xgmi_terminate(&adev->psp);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index 6999eab16a72..453336ca9675 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -30,10 +30,11 @@ struct amdgpu_hive_info {
 	uint64_t		hive_id;
 	struct list_head	device_list;
 	int number_devices;
-	struct mutex hive_lock, reset_lock;
+	struct mutex hive_lock;
 	struct kobject *kobj;
 	struct device_attribute dev_attr;
 	struct amdgpu_device *adev;
+	atomic_t in_reset;
 	int hi_req_count;
 	struct amdgpu_device *hi_req_gpu;
 	struct task_barrier tb;
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index e527be22a3d5..d851fe80eaf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -6198,7 +6198,7 @@ static int gfx_v10_0_gfx_init_queue(struct amdgpu_ring *ring)
 	struct v10_gfx_mqd *mqd = ring->mqd_ptr;
 	int mqd_idx = ring - &adev->gfx.gfx_ring[0];
 
-	if (!adev->in_gpu_reset && !adev->in_suspend) {
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
 		memset((void *)mqd, 0, sizeof(*mqd));
 		mutex_lock(&adev->srbm_mutex);
 		nv_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
@@ -6210,7 +6210,7 @@ static int gfx_v10_0_gfx_init_queue(struct amdgpu_ring *ring)
 		mutex_unlock(&adev->srbm_mutex);
 		if (adev->gfx.me.mqd_backup[mqd_idx])
 			memcpy(adev->gfx.me.mqd_backup[mqd_idx], mqd, sizeof(*mqd));
-	} else if (adev->in_gpu_reset) {
+	} else if (amdgpu_in_reset(adev)) {
 		/* reset mqd with the backup copy */
 		if (adev->gfx.me.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.me.mqd_backup[mqd_idx], sizeof(*mqd));
@@ -6563,7 +6563,7 @@ static int gfx_v10_0_kiq_init_queue(struct amdgpu_ring *ring)
 
 	gfx_v10_0_kiq_setting(ring);
 
-	if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(*mqd));
@@ -6599,7 +6599,7 @@ static int gfx_v10_0_kcq_init_queue(struct amdgpu_ring *ring)
 	struct v10_compute_mqd *mqd = ring->mqd_ptr;
 	int mqd_idx = ring - &adev->gfx.compute_ring[0];
 
-	if (!adev->in_gpu_reset && !adev->in_suspend) {
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
 		memset((void *)mqd, 0, sizeof(*mqd));
 		mutex_lock(&adev->srbm_mutex);
 		nv_grbm_select(adev, ring->me, ring->pipe, ring->queue, 0);
@@ -6609,7 +6609,7 @@ static int gfx_v10_0_kcq_init_queue(struct amdgpu_ring *ring)
 
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(*mqd));
-	} else if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	} else if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(*mqd));
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 3b7127202420..d5843e8a6e17 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4633,7 +4633,7 @@ static int gfx_v8_0_kiq_init_queue(struct amdgpu_ring *ring)
 
 	gfx_v8_0_kiq_setting(ring);
 
-	if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(struct vi_mqd_allocation));
@@ -4670,7 +4670,7 @@ static int gfx_v8_0_kcq_init_queue(struct amdgpu_ring *ring)
 	struct vi_mqd *mqd = ring->mqd_ptr;
 	int mqd_idx = ring - &adev->gfx.compute_ring[0];
 
-	if (!adev->in_gpu_reset && !adev->in_suspend) {
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
 		memset((void *)mqd, 0, sizeof(struct vi_mqd_allocation));
 		((struct vi_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
 		((struct vi_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
@@ -4682,7 +4682,7 @@ static int gfx_v8_0_kcq_init_queue(struct amdgpu_ring *ring)
 
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(struct vi_mqd_allocation));
-	} else if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	} else if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(struct vi_mqd_allocation));
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 2c5bb282cc01..93c63ff3b35e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3686,7 +3686,7 @@ static int gfx_v9_0_kiq_init_queue(struct amdgpu_ring *ring)
 
 	gfx_v9_0_kiq_setting(ring);
 
-	if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(struct v9_mqd_allocation));
@@ -3724,7 +3724,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ring *ring)
 	struct v9_mqd *mqd = ring->mqd_ptr;
 	int mqd_idx = ring - &adev->gfx.compute_ring[0];
 
-	if (!adev->in_gpu_reset && !adev->in_suspend) {
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
 		memset((void *)mqd, 0, sizeof(struct v9_mqd_allocation));
 		((struct v9_mqd_allocation *)mqd)->dynamic_cu_mask = 0xFFFFFFFF;
 		((struct v9_mqd_allocation *)mqd)->dynamic_rb_mask = 0xFFFFFFFF;
@@ -3736,7 +3736,7 @@ static int gfx_v9_0_kcq_init_queue(struct amdgpu_ring *ring)
 
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(adev->gfx.mec.mqd_backup[mqd_idx], mqd, sizeof(struct v9_mqd_allocation));
-	} else if (adev->in_gpu_reset) { /* for GPU_RESET case */
+	} else if (amdgpu_in_reset(adev)) { /* for GPU_RESET case */
 		/* reset MQD to a clean status */
 		if (adev->gfx.mec.mqd_backup[mqd_idx])
 			memcpy(mqd, adev->gfx.mec.mqd_backup[mqd_idx], sizeof(struct v9_mqd_allocation));
@@ -3930,7 +3930,7 @@ static int gfx_v9_0_hw_fini(void *handle)
 	/* Use deinitialize sequence from CAIL when unbinding device from driver,
 	 * otherwise KIQ is hanging when binding back
 	 */
-	if (!adev->in_gpu_reset && !adev->in_suspend) {
+	if (!amdgpu_in_reset(adev) && !adev->in_suspend) {
 		mutex_lock(&adev->srbm_mutex);
 		soc15_grbm_select(adev, adev->gfx.kiq.ring.me,
 				adev->gfx.kiq.ring.pipe,
@@ -4088,7 +4088,7 @@ static uint64_t gfx_v9_0_kiq_read_clock(struct amdgpu_device *adev)
 	 *
 	 * also don't wait anymore for IRQ context
 	 * */
-	if (r < 1 && (adev->in_gpu_reset || in_interrupt()))
+	if (r < 1 && (amdgpu_in_reset(adev) || in_interrupt()))
 		goto failed_kiq_read;
 
 	might_sleep();
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index ec8c0af39553..9d3b1245a339 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -287,7 +287,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 */
 	if (adev->gfx.kiq.ring.sched.ready &&
 	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
-	    !adev->in_gpu_reset) {
+	    !amdgpu_in_reset(adev)) {
 
 		struct amdgpu_vmhub *hub = &adev->vmhub[vmhub];
 		const unsigned eng = 17;
@@ -312,7 +312,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 
 	if (!adev->mman.buffer_funcs_enabled ||
 	    !adev->ib_pool_ready ||
-	    adev->in_gpu_reset ||
+	    amdgpu_in_reset(adev) ||
 	    ring->sched.ready == false) {
 		gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);
 		mutex_unlock(&adev->mman.gtt_window_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 3ce5c1d2fdf2..80c146df338a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -434,7 +434,7 @@ static int gmc_v7_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	int vmid;
 	unsigned int tmp;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	for (vmid = 1; vmid < 16; vmid++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 3e6615f9d39c..9ab65ca7df77 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -635,7 +635,7 @@ static int gmc_v8_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	int vmid;
 	unsigned int tmp;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	for (vmid = 1; vmid < 16; vmid++) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 6a780b674018..86f20426c4af 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -501,7 +501,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
 	 */
 	if (adev->gfx.kiq.ring.sched.ready &&
 			(amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev)) &&
-			!adev->in_gpu_reset) {
+			!amdgpu_in_reset(adev)) {
 		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
 		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
 
@@ -596,7 +596,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
 	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EIO;
 
 	if (ring->sched.ready) {
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index 475ff5df8c87..f27d83f2de78 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -250,7 +250,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 	 */
 	locked = mutex_trylock(&adev->lock_reset);
 	if (locked)
-		adev->in_gpu_reset = true;
+		atomic_set(&adev->in_gpu_reset, 1);
 
 	do {
 		if (xgpu_ai_mailbox_peek_msg(adev) == IDH_FLR_NOTIFICATION_CMPL)
@@ -262,7 +262,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	if (locked) {
-		adev->in_gpu_reset = false;
+		atomic_set(&adev->in_gpu_reset, 0);
 		mutex_unlock(&adev->lock_reset);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 9cf695c05db3..3cb10ab943a6 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -271,7 +271,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 	 */
 	locked = mutex_trylock(&adev->lock_reset);
 	if (locked)
-		adev->in_gpu_reset = true;
+		atomic_set(&adev->in_gpu_reset, 1);
 
 	do {
 		if (xgpu_nv_mailbox_peek_msg(adev) == IDH_FLR_NOTIFICATION_CMPL)
@@ -283,7 +283,7 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
 
 flr_done:
 	if (locked) {
-		adev->in_gpu_reset = false;
+		atomic_set(&adev->in_gpu_reset, 0);
 		mutex_unlock(&adev->lock_reset);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2ec245c0287b..cee3d73db14b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1658,7 +1658,7 @@ static int dm_suspend(void *handle)
 	struct amdgpu_display_manager *dm = &adev->dm;
 	int ret = 0;
 
-	if (adev->in_gpu_reset) {
+	if (amdgpu_in_reset(adev)) {
 		mutex_lock(&dm->dc_lock);
 		dm->cached_dc_state = dc_copy_state(dm->dc->current_state);
 
@@ -1844,7 +1844,7 @@ static int dm_resume(void *handle)
 	struct dc_state *dc_state;
 	int i, r, j;
 
-	if (adev->in_gpu_reset) {
+	if (amdgpu_in_reset(adev)) {
 		dc_state = dm->cached_dc_state;
 
 		r = dm_dmub_hw_init(adev);
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index a77f7347fdfc..e469de005451 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -121,7 +121,7 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
 	enum amd_pm_state_type pm;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -159,7 +159,7 @@ static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
 	enum amd_pm_state_type  state;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (strncmp("battery", buf, strlen("battery")) == 0)
@@ -265,7 +265,7 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
 	enum amd_dpm_forced_level level = 0xff;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -307,7 +307,7 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
 	enum amd_dpm_forced_level current_level = 0xff;
 	int ret = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (strncmp("low", buf, strlen("low")) == 0) {
@@ -411,7 +411,7 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
 	struct pp_states_info data;
 	int i, buf_len, ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -455,7 +455,7 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 	enum amd_pm_state_type pm = 0;
 	int i = 0, ret = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -496,7 +496,7 @@ static ssize_t amdgpu_get_pp_force_state(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (adev->pp_force_state_enabled)
@@ -516,7 +516,7 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
 	unsigned long idx;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (strlen(buf) == 1)
@@ -576,7 +576,7 @@ static ssize_t amdgpu_get_pp_table(struct device *dev,
 	char *table = NULL;
 	int size, ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -620,7 +620,7 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int ret = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -773,7 +773,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 	const char delimiter[3] = {' ', '\n', '\0'};
 	uint32_t type;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (count > 127)
@@ -867,7 +867,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -921,7 +921,7 @@ static ssize_t amdgpu_set_pp_features(struct device *dev,
 	uint64_t featuremask;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = kstrtou64(buf, 0, &featuremask);
@@ -966,7 +966,7 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1027,7 +1027,7 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1095,7 +1095,7 @@ static ssize_t amdgpu_set_pp_dpm_sclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1131,7 +1131,7 @@ static ssize_t amdgpu_get_pp_dpm_mclk(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1163,7 +1163,7 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev,
 	uint32_t mask = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1199,7 +1199,7 @@ static ssize_t amdgpu_get_pp_dpm_socclk(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1231,7 +1231,7 @@ static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1269,7 +1269,7 @@ static ssize_t amdgpu_get_pp_dpm_fclk(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1301,7 +1301,7 @@ static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1339,7 +1339,7 @@ static ssize_t amdgpu_get_pp_dpm_dcefclk(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1371,7 +1371,7 @@ static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1409,7 +1409,7 @@ static ssize_t amdgpu_get_pp_dpm_pcie(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1441,7 +1441,7 @@ static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
@@ -1479,7 +1479,7 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
 	uint32_t value = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1509,7 +1509,7 @@ static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
 	int ret;
 	long int value;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = kstrtol(buf, 0, &value);
@@ -1552,7 +1552,7 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
 	uint32_t value = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1582,7 +1582,7 @@ static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
 	int ret;
 	long int value;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = kstrtol(buf, 0, &value);
@@ -1645,7 +1645,7 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
 	ssize_t size;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -1685,7 +1685,7 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
 	long int profile_mode = 0;
 	const char delimiter[3] = {' ', '\n', '\0'};
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	tmp[0] = *(buf);
@@ -1749,7 +1749,7 @@ static ssize_t amdgpu_get_gpu_busy_percent(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int r, value, size = sizeof(value);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(ddev->dev);
@@ -1787,7 +1787,7 @@ static ssize_t amdgpu_get_mem_busy_percent(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int r, value, size = sizeof(value);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(ddev->dev);
@@ -1830,7 +1830,7 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 	uint64_t count0 = 0, count1 = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (adev->flags & AMD_IS_APU)
@@ -1871,7 +1871,7 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (adev->unique_id)
@@ -1969,7 +1969,7 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
 	ssize_t size = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(ddev->dev);
@@ -2193,7 +2193,7 @@ static ssize_t amdgpu_hwmon_show_temp(struct device *dev,
 	int channel = to_sensor_dev_attr(attr)->index;
 	int r, temp = 0, size = sizeof(temp);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (channel >= PP_TEMP_MAX)
@@ -2329,7 +2329,7 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
 	u32 pwm_mode = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(adev->ddev->dev);
@@ -2365,7 +2365,7 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
 	int err, ret;
 	int value;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = kstrtoint(buf, 10, &value);
@@ -2419,7 +2419,7 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
 	u32 value;
 	u32 pwm_mode;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = pm_runtime_get_sync(adev->ddev->dev);
@@ -2473,7 +2473,7 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct device *dev,
 	int err;
 	u32 speed = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = pm_runtime_get_sync(adev->ddev->dev);
@@ -2508,7 +2508,7 @@ static ssize_t amdgpu_hwmon_get_fan1_input(struct device *dev,
 	int err;
 	u32 speed = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = pm_runtime_get_sync(adev->ddev->dev);
@@ -2542,7 +2542,7 @@ static ssize_t amdgpu_hwmon_get_fan1_min(struct device *dev,
 	u32 size = sizeof(min_rpm);
 	int r;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2572,7 +2572,7 @@ static ssize_t amdgpu_hwmon_get_fan1_max(struct device *dev,
 	u32 size = sizeof(max_rpm);
 	int r;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2601,7 +2601,7 @@ static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
 	int err;
 	u32 rpm = 0;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = pm_runtime_get_sync(adev->ddev->dev);
@@ -2635,7 +2635,7 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
 	u32 value;
 	u32 pwm_mode;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = pm_runtime_get_sync(adev->ddev->dev);
@@ -2686,7 +2686,7 @@ static ssize_t amdgpu_hwmon_get_fan1_enable(struct device *dev,
 	u32 pwm_mode = 0;
 	int ret;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	ret = pm_runtime_get_sync(adev->ddev->dev);
@@ -2723,7 +2723,7 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
 	int value;
 	u32 pwm_mode;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	err = kstrtoint(buf, 10, &value);
@@ -2768,7 +2768,7 @@ static ssize_t amdgpu_hwmon_show_vddgfx(struct device *dev,
 	u32 vddgfx;
 	int r, size = sizeof(vddgfx);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2805,7 +2805,7 @@ static ssize_t amdgpu_hwmon_show_vddnb(struct device *dev,
 	u32 vddnb;
 	int r, size = sizeof(vddnb);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	/* only APUs have vddnb */
@@ -2847,7 +2847,7 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct device *dev,
 	int r, size = sizeof(u32);
 	unsigned uw;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2888,7 +2888,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_max(struct device *dev,
 	ssize_t size;
 	int r;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2922,7 +2922,7 @@ static ssize_t amdgpu_hwmon_show_power_cap(struct device *dev,
 	ssize_t size;
 	int r;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -2957,7 +2957,7 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
 	int err;
 	u32 value;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	if (amdgpu_sriov_vf(adev))
@@ -3000,7 +3000,7 @@ static ssize_t amdgpu_hwmon_show_sclk(struct device *dev,
 	uint32_t sclk;
 	int r, size = sizeof(sclk);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -3037,7 +3037,7 @@ static ssize_t amdgpu_hwmon_show_mclk(struct device *dev,
 	uint32_t mclk;
 	int r, size = sizeof(mclk);
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(adev->ddev->dev);
@@ -3558,7 +3558,7 @@ static int amdgpu_debugfs_pm_info(struct seq_file *m, void *data)
 	u32 flags = 0;
 	int r;
 
-	if (adev->in_gpu_reset)
+	if (amdgpu_in_reset(adev))
 		return -EPERM;
 
 	r = pm_runtime_get_sync(dev->dev);
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
index c7216362b68d..da84012b7fd5 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c
@@ -489,7 +489,7 @@ static int vega20_setup_asic_task(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)(hwmgr->adev);
 	int ret = 0;
-	bool use_baco = (adev->in_gpu_reset &&
+	bool use_baco = (amdgpu_in_reset(adev) &&
 			 (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)) ||
 		(adev->in_runpm && amdgpu_asic_supports_baco(adev));
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 8eb5b92903cd..8462b30f4fe3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1110,7 +1110,7 @@ static int smu_disable_dpms(struct smu_context *smu)
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 	bool use_baco = !smu->is_apu &&
-		((adev->in_gpu_reset &&
+		((amdgpu_in_reset(adev) &&
 		  (amdgpu_asic_reset_method(adev) == AMD_RESET_METHOD_BACO)) ||
 		 ((adev->in_runpm || adev->in_hibernate) && amdgpu_asic_supports_baco(adev)));
 
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
