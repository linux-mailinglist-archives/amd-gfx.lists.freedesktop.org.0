Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D32226B017
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Sep 2020 00:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159176E221;
	Tue, 15 Sep 2020 22:00:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80B76E221
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Sep 2020 22:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoHfP8XBSeqXWCeFRA65OcN0iYknRNc6s287Dh/IRf5tpKSl0e1gwL60B4/QLIXc26Iom2rk/ES7Wl15ySpLwsxjXL70sKfW8Bs/TFF5HMMrmTPblVHqNSBZa6j2LeF/BS3DgleXfbZRA/pY5s1/R8rHQP9rU8RPlCx6hMOlxMeqamLfet+EVNuYh9/j35AEblujQPUfciOSmZ8ZunshxYA4rvDVSd3gfzNUFKtahQw/0LASgDLzS38sxg1UEn69s8nMFkIGZ2sylm6p7rhYsE5QR6kZiBsOvwh6PaJeNg2jB837ia2YDlqdwEp9mq5Zv3NBwy+eXUZR4yd0jj/RiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUXNjOXneRa4LxJoLN83x5LQ+4PbzjiUYyH4gtZL3Y=;
 b=XbfjC7HwkTZs6yEd+n6P0d/7ZL+D3L+kkeWeYQoTy8DiL/GxmSBbZgOTLTrY+tBRftAeZXkFBWnof6CaCw6R2nUp6YzlovRP3UTYp3VY/KslpMmPJ2v5KpalF2dQqk78SGz1ytjuZPAZQo0EM4c9pPu6P6DQzsJ8lN9HO4BMKADG4sZcYPESuZu0sx7rR26/NoEnkCMzlZxhqXDKLcr6hCUpUY5zpIAfxED+VZ7rK67TX3YWPuuEyFJi/qtRMuBGiAvEEIlJxNLCApMtVuL5HTlz7kFaA8cEMQryFogUJTyQFYJYDMMlO30Qz+Z6kVzl910Gtn4lHSWioszjdAs/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExUXNjOXneRa4LxJoLN83x5LQ+4PbzjiUYyH4gtZL3Y=;
 b=1LEKfk+Zk/xGVmKtAvlS1qcMQfnNVEuAT6UX/r9McH0glNzA5nqQKtNgKNY7TTEIOoDcnqeJcNCfQCSQA2Uz7jUtR+vE3CGjtEmX3svTz7cGTvUbRkXBlLpqfAo1jw8YFR2/V/MG8z63B+nFZwi2wuwQTm2z4Mj7/jyboo6ZniU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0146.namprd12.prod.outlook.com
 (2603:10b6:405:59::18) by BN6PR12MB1188.namprd12.prod.outlook.com
 (2603:10b6:404:19::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 22:00:32 +0000
Received: from BN6PR1201MB0146.namprd12.prod.outlook.com
 ([fe80::615d:bea9:8838:92be]) by BN6PR1201MB0146.namprd12.prod.outlook.com
 ([fe80::615d:bea9:8838:92be%4]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 22:00:32 +0000
From: Jonathan Kim <jonathan.kim@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu: fix xgmi perfmon a-b-a problem
Date: Tue, 15 Sep 2020 18:00:13 -0400
Message-Id: <20200915220015.2646-1-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: CH2PR12CA0003.namprd12.prod.outlook.com
 (2603:10b6:610:57::13) To BN6PR1201MB0146.namprd12.prod.outlook.com
 (2603:10b6:405:59::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonathan-KFD.amd.com (165.204.55.251) by
 CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Tue, 15 Sep 2020 22:00:31 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.55.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1161239-2596-4342-37d8-08d859c2c3f1
X-MS-TrafficTypeDiagnostic: BN6PR12MB1188:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB11887E7016F755FAB062082A85200@BN6PR12MB1188.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5Ip6CBZkhbeSijw/q7OkcsjxuIgeLWyBOs4om+I+MJhf9Ti5ZPYd8GVYHRdtjQlZMRvvOYqXtQJJHfRrn86BxANZB2LOoTEpccxLhkTXMBOiitY/ez4eThzLQTfyADRKWG/VRd4QeZfrxEobMKKgsVHivaEhHy1JN6N+UIkMEkOkUrh1rcMjklEV/uc2aZz0KBAMuzlI04YPIH4X5FpZ5qZwf7dvofK0rNzbV882PUIPsx9vBTSVpx/eV3frLmFISpQEKZyelJBgJ9Mblj7MVCOQB+KHqBYaWN7iC16Hzq5gHyfqcWQguhuwhYriSYGoSdojND70eGhFT6JiF7jWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1201MB0146.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(54906003)(7696005)(316002)(66946007)(8936002)(66476007)(66556008)(478600001)(6666004)(86362001)(5660300002)(30864003)(36756003)(2906002)(83380400001)(8676002)(1076003)(956004)(4326008)(6486002)(2616005)(44832011)(52116002)(16526019)(186003)(26005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8W2vKhMYnAw8JXuHl2GZnzvbtrJnzAjSHzR3MdqhBTiu1pJ/znpl8YsypKrEsx9ubIhduAmMkdbY1sVzBLygrXSK6PjDp3hR5MEkdvX3TcKRN5XSRpIHLBzRLQswgNhWud9U4CISEvznH6CMKgCWNN9CmSkGuYlHmTAXjfEjnOKRVxlDVlimuDBUMb+SpU9Na/9XXTkj2dOcyutPF/VOXTYzlDUaqnRNQuxnGQcCzPAkBJGmJVlW90/cXVPEGPk94jRvt50j+lWQds+ESBVY6bN2O+U+3Z7cFZRohjggtxqmPxzjYMrq/9uH2qgjWp1P7h2p2AmbXQXsNa5/VvWOZZg11ciXzCb6y7wjSxVKczrLy3egpQQRnDPNUUYFS12wpusQsZ+dZy9GIFxd8bU4nyvcAHBfuONKgBH5y4XX9g+AEq0SSwK08yBgPZs9IFHjX1aac0Ngf46ofzndRS2Y/z6N/5xy15mYQv92JKNOiUnKdgFQt0UFScxAZ8voWUZ0bCCrKX8FP6XoMbMdp0YgI8cOgcxHuEJnxhkmWPWllhK5rhdN8E8NuH8SVDMZi8jKrHWnx/D6oz9f0nWfvA1YjQZ2FdeqebXcUB/MfrM1Ov69VhaWfhvwuPl1xUr2hWih+tepkznU8WlXc/Au0eR+9A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1161239-2596-4342-37d8-08d859c2c3f1
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0146.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 22:00:32.1657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRLzqIMdGyhzvyq1dtAmXl8M1mLCnzur/PRTGf5gsUjVaefPm2x1SmJoO2iyFRy8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1188
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
Cc: Jonathan Kim <Jonathan.Kim@amd.com>, Harish.Kasiviswanathan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Mapping hw counters per event config will cause ABA problems so map per
event instead.

v2: Discontinue starting perf counters if add fails.  Make it clear what's
happening with pmc_start.

Signed-off-by: Jonathan Kim <Jonathan.Kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_df.h  |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c |  42 ++++++----
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c    | 105 +++++++++++-------------
 3 files changed, 78 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h
index 373cdebe0e2f..52488bb45112 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_df.h
@@ -44,11 +44,11 @@ struct amdgpu_df_funcs {
 	void (*enable_ecc_force_par_wr_rmw)(struct amdgpu_device *adev,
 					    bool enable);
 	int (*pmc_start)(struct amdgpu_device *adev, uint64_t config,
-					 int is_add);
+					 int counter_idx, int is_add);
 	int (*pmc_stop)(struct amdgpu_device *adev, uint64_t config,
-					 int is_remove);
+					 int counter_idx, int is_remove);
 	void (*pmc_get_count)(struct amdgpu_device *adev, uint64_t config,
-					 uint64_t *count);
+					 int counter_idx, uint64_t *count);
 	uint64_t (*get_fica)(struct amdgpu_device *adev, uint32_t ficaa_val);
 	void (*set_fica)(struct amdgpu_device *adev, uint32_t ficaa_val,
 			 uint32_t ficadl_val, uint32_t ficadh_val);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 69af462db34d..1b0ec715c8ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -64,6 +64,7 @@ static void amdgpu_perf_start(struct perf_event *event, int flags)
 	struct amdgpu_pmu_entry *pe = container_of(event->pmu,
 						  struct amdgpu_pmu_entry,
 						  pmu);
+	int target_cntr = 0;
 
 	if (WARN_ON_ONCE(!(hwc->state & PERF_HES_STOPPED)))
 		return;
@@ -73,17 +74,24 @@ static void amdgpu_perf_start(struct perf_event *event, int flags)
 
 	switch (pe->pmu_perf_type) {
 	case PERF_TYPE_AMDGPU_DF:
-		if (!(flags & PERF_EF_RELOAD))
-			pe->adev->df.funcs->pmc_start(pe->adev, hwc->config, 1);
+		if (!(flags & PERF_EF_RELOAD)) {
+			target_cntr = pe->adev->df.funcs->pmc_start(pe->adev,
+						hwc->config, 0 /* unused */,
+						1 /* add counter */);
+			if (target_cntr < 0)
+				break;
+
+			hwc->idx = target_cntr;
+		}
 
-		pe->adev->df.funcs->pmc_start(pe->adev, hwc->config, 0);
+		pe->adev->df.funcs->pmc_start(pe->adev, hwc->config,
+								hwc->idx, 0);
 		break;
 	default:
 		break;
 	}
 
 	perf_event_update_userpage(event);
-
 }
 
 /* read perf counter */
@@ -101,8 +109,8 @@ static void amdgpu_perf_read(struct perf_event *event)
 
 		switch (pe->pmu_perf_type) {
 		case PERF_TYPE_AMDGPU_DF:
-			pe->adev->df.funcs->pmc_get_count(pe->adev, hwc->config,
-							  &count);
+			pe->adev->df.funcs->pmc_get_count(pe->adev,
+						hwc->config, hwc->idx, &count);
 			break;
 		default:
 			count = 0;
@@ -126,7 +134,8 @@ static void amdgpu_perf_stop(struct perf_event *event, int flags)
 
 	switch (pe->pmu_perf_type) {
 	case PERF_TYPE_AMDGPU_DF:
-		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, 0);
+		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, hwc->idx,
+									0);
 		break;
 	default:
 		break;
@@ -142,12 +151,11 @@ static void amdgpu_perf_stop(struct perf_event *event, int flags)
 	hwc->state |= PERF_HES_UPTODATE;
 }
 
-/* add perf counter  */
+/* add perf counter */
 static int amdgpu_perf_add(struct perf_event *event, int flags)
 {
 	struct hw_perf_event *hwc = &event->hw;
-	int retval;
-
+	int retval = 0, target_cntr;
 	struct amdgpu_pmu_entry *pe = container_of(event->pmu,
 						  struct amdgpu_pmu_entry,
 						  pmu);
@@ -156,8 +164,14 @@ static int amdgpu_perf_add(struct perf_event *event, int flags)
 
 	switch (pe->pmu_perf_type) {
 	case PERF_TYPE_AMDGPU_DF:
-		retval = pe->adev->df.funcs->pmc_start(pe->adev,
-						       hwc->config, 1);
+		target_cntr = pe->adev->df.funcs->pmc_start(pe->adev,
+						hwc->config, 0 /* unused */,
+						1 /* add counter */);
+		if (target_cntr < 0)
+			retval = target_cntr;
+		else
+			hwc->idx = target_cntr;
+
 		break;
 	default:
 		return 0;
@@ -170,7 +184,6 @@ static int amdgpu_perf_add(struct perf_event *event, int flags)
 		amdgpu_perf_start(event, PERF_EF_RELOAD);
 
 	return retval;
-
 }
 
 /* delete perf counter  */
@@ -185,7 +198,8 @@ static void amdgpu_perf_del(struct perf_event *event, int flags)
 
 	switch (pe->pmu_perf_type) {
 	case PERF_TYPE_AMDGPU_DF:
-		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, 1);
+		pe->adev->df.funcs->pmc_stop(pe->adev, hwc->config, hwc->idx,
+									1);
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 7b89fd2aa44a..0ca6e176acb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -391,33 +391,28 @@ static void df_v3_6_get_clockgating_state(struct amdgpu_device *adev,
 }
 
 /* get assigned df perfmon ctr as int */
-static int df_v3_6_pmc_config_2_cntr(struct amdgpu_device *adev,
-				      uint64_t config)
+static bool df_v3_6_pmc_has_counter(struct amdgpu_device *adev,
+				      uint64_t config,
+				      int counter_idx)
 {
-	int i;
 
-	for (i = 0; i < DF_V3_6_MAX_COUNTERS; i++) {
-		if ((config & 0x0FFFFFFUL) ==
-					adev->df_perfmon_config_assign_mask[i])
-			return i;
-	}
+	return ((config & 0x0FFFFFFUL) ==
+			adev->df_perfmon_config_assign_mask[counter_idx]);
 
-	return -EINVAL;
 }
 
 /* get address based on counter assignment */
 static void df_v3_6_pmc_get_addr(struct amdgpu_device *adev,
 				 uint64_t config,
+				 int counter_idx,
 				 int is_ctrl,
 				 uint32_t *lo_base_addr,
 				 uint32_t *hi_base_addr)
 {
-	int target_cntr = df_v3_6_pmc_config_2_cntr(adev, config);
-
-	if (target_cntr < 0)
+	if (!df_v3_6_pmc_has_counter(adev, config, counter_idx))
 		return;
 
-	switch (target_cntr) {
+	switch (counter_idx) {
 
 	case 0:
 		*lo_base_addr = is_ctrl ? smnPerfMonCtlLo4 : smnPerfMonCtrLo4;
@@ -443,15 +438,18 @@ static void df_v3_6_pmc_get_addr(struct amdgpu_device *adev,
 /* get read counter address */
 static void df_v3_6_pmc_get_read_settings(struct amdgpu_device *adev,
 					  uint64_t config,
+					  int counter_idx,
 					  uint32_t *lo_base_addr,
 					  uint32_t *hi_base_addr)
 {
-	df_v3_6_pmc_get_addr(adev, config, 0, lo_base_addr, hi_base_addr);
+	df_v3_6_pmc_get_addr(adev, config, counter_idx, 0, lo_base_addr,
+								hi_base_addr);
 }
 
 /* get control counter settings i.e. address and values to set */
 static int df_v3_6_pmc_get_ctrl_settings(struct amdgpu_device *adev,
 					  uint64_t config,
+					  int counter_idx,
 					  uint32_t *lo_base_addr,
 					  uint32_t *hi_base_addr,
 					  uint32_t *lo_val,
@@ -462,7 +460,8 @@ static int df_v3_6_pmc_get_ctrl_settings(struct amdgpu_device *adev,
 	uint32_t eventsel, instance, unitmask;
 	uint32_t instance_10, instance_5432, instance_76;
 
-	df_v3_6_pmc_get_addr(adev, config, 1, lo_base_addr, hi_base_addr);
+	df_v3_6_pmc_get_addr(adev, config, counter_idx, 1, lo_base_addr,
+				hi_base_addr);
 
 	if ((*lo_base_addr == 0) || (*hi_base_addr == 0)) {
 		DRM_ERROR("[DF PMC] addressing not retrieved! Lo: %x, Hi: %x",
@@ -492,18 +491,13 @@ static int df_v3_6_pmc_get_ctrl_settings(struct amdgpu_device *adev,
 static int df_v3_6_pmc_add_cntr(struct amdgpu_device *adev,
 				   uint64_t config)
 {
-	int i, target_cntr;
-
-	target_cntr = df_v3_6_pmc_config_2_cntr(adev, config);
-
-	if (target_cntr >= 0)
-		return 0;
+	int i;
 
 	for (i = 0; i < DF_V3_6_MAX_COUNTERS; i++) {
 		if (adev->df_perfmon_config_assign_mask[i] == 0U) {
 			adev->df_perfmon_config_assign_mask[i] =
 							config & 0x0FFFFFFUL;
-			return 0;
+			return i;
 		}
 	}
 
@@ -512,59 +506,50 @@ static int df_v3_6_pmc_add_cntr(struct amdgpu_device *adev,
 
 #define DEFERRED_ARM_MASK	(1 << 31)
 static int df_v3_6_pmc_set_deferred(struct amdgpu_device *adev,
-				    uint64_t config, bool is_deferred)
+				    int counter_idx, uint64_t config,
+				    bool is_deferred)
 {
-	int target_cntr;
-
-	target_cntr = df_v3_6_pmc_config_2_cntr(adev, config);
 
-	if (target_cntr < 0)
+	if (!df_v3_6_pmc_has_counter(adev, config, counter_idx))
 		return -EINVAL;
 
 	if (is_deferred)
-		adev->df_perfmon_config_assign_mask[target_cntr] |=
+		adev->df_perfmon_config_assign_mask[counter_idx] |=
 							DEFERRED_ARM_MASK;
 	else
-		adev->df_perfmon_config_assign_mask[target_cntr] &=
+		adev->df_perfmon_config_assign_mask[counter_idx] &=
 							~DEFERRED_ARM_MASK;
 
 	return 0;
 }
 
 static bool df_v3_6_pmc_is_deferred(struct amdgpu_device *adev,
+				    int counter_idx,
 				    uint64_t config)
 {
-	int target_cntr;
-
-	target_cntr = df_v3_6_pmc_config_2_cntr(adev, config);
-
-	/*
-	 * we never get target_cntr < 0 since this funciton is only called in
-	 * pmc_count for now but we should check anyways.
-	 */
-	return (target_cntr >= 0 &&
-			(adev->df_perfmon_config_assign_mask[target_cntr]
-			& DEFERRED_ARM_MASK));
+	return	(df_v3_6_pmc_has_counter(adev, config, counter_idx) &&
+			(adev->df_perfmon_config_assign_mask[counter_idx]
+				& DEFERRED_ARM_MASK));
 
 }
 
 /* release performance counter */
 static void df_v3_6_pmc_release_cntr(struct amdgpu_device *adev,
-				     uint64_t config)
+				     uint64_t config,
+				     int counter_idx)
 {
-	int target_cntr = df_v3_6_pmc_config_2_cntr(adev, config);
-
-	if (target_cntr >= 0)
-		adev->df_perfmon_config_assign_mask[target_cntr] = 0ULL;
+	if (df_v3_6_pmc_has_counter(adev, config, counter_idx))
+		adev->df_perfmon_config_assign_mask[counter_idx] = 0ULL;
 }
 
 
 static void df_v3_6_reset_perfmon_cntr(struct amdgpu_device *adev,
-					 uint64_t config)
+					 uint64_t config,
+					 int counter_idx)
 {
 	uint32_t lo_base_addr = 0, hi_base_addr = 0;
 
-	df_v3_6_pmc_get_read_settings(adev, config, &lo_base_addr,
+	df_v3_6_pmc_get_read_settings(adev, config, counter_idx, &lo_base_addr,
 				      &hi_base_addr);
 
 	if ((lo_base_addr == 0) || (hi_base_addr == 0))
@@ -573,8 +558,9 @@ static void df_v3_6_reset_perfmon_cntr(struct amdgpu_device *adev,
 	df_v3_6_perfmon_wreg(adev, lo_base_addr, 0, hi_base_addr, 0);
 }
 
+/* return available counter if is_add == 1 otherwise return error status. */
 static int df_v3_6_pmc_start(struct amdgpu_device *adev, uint64_t config,
-			     int is_add)
+			     int counter_idx, int is_add)
 {
 	uint32_t lo_base_addr, hi_base_addr, lo_val, hi_val;
 	int err = 0, ret = 0;
@@ -584,10 +570,9 @@ static int df_v3_6_pmc_start(struct amdgpu_device *adev, uint64_t config,
 		if (is_add)
 			return df_v3_6_pmc_add_cntr(adev, config);
 
-		df_v3_6_reset_perfmon_cntr(adev, config);
-
 		ret = df_v3_6_pmc_get_ctrl_settings(adev,
 					config,
+					counter_idx,
 					&lo_base_addr,
 					&hi_base_addr,
 					&lo_val,
@@ -604,7 +589,8 @@ static int df_v3_6_pmc_start(struct amdgpu_device *adev, uint64_t config,
 						     hi_val);
 
 		if (err)
-			ret = df_v3_6_pmc_set_deferred(adev, config, true);
+			ret = df_v3_6_pmc_set_deferred(adev, config,
+							counter_idx, true);
 
 		break;
 	default:
@@ -615,7 +601,7 @@ static int df_v3_6_pmc_start(struct amdgpu_device *adev, uint64_t config,
 }
 
 static int df_v3_6_pmc_stop(struct amdgpu_device *adev, uint64_t config,
-			    int is_remove)
+			    int counter_idx, int is_remove)
 {
 	uint32_t lo_base_addr, hi_base_addr, lo_val, hi_val;
 	int ret = 0;
@@ -624,6 +610,7 @@ static int df_v3_6_pmc_stop(struct amdgpu_device *adev, uint64_t config,
 	case CHIP_VEGA20:
 		ret = df_v3_6_pmc_get_ctrl_settings(adev,
 			config,
+			counter_idx,
 			&lo_base_addr,
 			&hi_base_addr,
 			&lo_val,
@@ -635,8 +622,8 @@ static int df_v3_6_pmc_stop(struct amdgpu_device *adev, uint64_t config,
 
 
 		if (is_remove) {
-			df_v3_6_reset_perfmon_cntr(adev, config);
-			df_v3_6_pmc_release_cntr(adev, config);
+			df_v3_6_reset_perfmon_cntr(adev, config, counter_idx);
+			df_v3_6_pmc_release_cntr(adev, config, counter_idx);
 		}
 
 		break;
@@ -649,6 +636,7 @@ static int df_v3_6_pmc_stop(struct amdgpu_device *adev, uint64_t config,
 
 static void df_v3_6_pmc_get_count(struct amdgpu_device *adev,
 				  uint64_t config,
+				  int counter_idx,
 				  uint64_t *count)
 {
 	uint32_t lo_base_addr = 0, hi_base_addr = 0, lo_val = 0, hi_val = 0;
@@ -656,14 +644,14 @@ static void df_v3_6_pmc_get_count(struct amdgpu_device *adev,
 
 	switch (adev->asic_type) {
 	case CHIP_VEGA20:
-		df_v3_6_pmc_get_read_settings(adev, config, &lo_base_addr,
-				      &hi_base_addr);
+		df_v3_6_pmc_get_read_settings(adev, config, counter_idx,
+						&lo_base_addr, &hi_base_addr);
 
 		if ((lo_base_addr == 0) || (hi_base_addr == 0))
 			return;
 
 		/* rearm the counter or throw away count value on failure */
-		if (df_v3_6_pmc_is_deferred(adev, config)) {
+		if (df_v3_6_pmc_is_deferred(adev, config, counter_idx)) {
 			int rearm_err = df_v3_6_perfmon_arm_with_status(adev,
 							lo_base_addr, lo_val,
 							hi_base_addr, hi_val);
@@ -671,7 +659,8 @@ static void df_v3_6_pmc_get_count(struct amdgpu_device *adev,
 			if (rearm_err)
 				return;
 
-			df_v3_6_pmc_set_deferred(adev, config, false);
+			df_v3_6_pmc_set_deferred(adev, config, counter_idx,
+									false);
 		}
 
 		df_v3_6_perfmon_rreg(adev, lo_base_addr, &lo_val,
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
