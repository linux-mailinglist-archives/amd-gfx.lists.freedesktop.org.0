Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64D11A1A4
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 03:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5AB6E0BA;
	Wed, 11 Dec 2019 02:51:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E52DE6E0BA
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 02:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQ0Oa9+ZM0TmgaaJy9dNgYx0uq1vffXrmGC4VzfD53XL2VZm8lQ7CMvxUDIw1dtaUZYlR252YLNmiE7B/wVqKX7k7RjDLBzJSoIgFH/VQtuiLisKc2ayeeuI3+d9+bIJRZD9XEgbmB+1WyGeeY/fPOwcdKF7tUTtHdWXLb6tjT4MjpqiML4yeHCtjj0GUf9bEu97c7qOIITEJFVfc/+BbUavzv7UjiA0wn+U5uPtAfmVsqYes/ocCobduRJtt3b7mMRJ+q/qWcZ6GHDo2qm8EEj0TiuvCYImrvn0XBAiikowWWASkRRVdibxMhVNIgjMaApMVLAjHZgqMuM1oSIVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5jg7sLvV3/fZ0GsqEJCtycNpNmzsRv4xnwF4nQBiDo=;
 b=gd27Mscwh+lcFCNUoSjg0ILcUp7/kEp15kt4ie/vw3O7osccLrrENMQeakOhzLf7/X5TGMOBRIu+2RjazL6QxXqfH2p6AMa65Yo/2l2bMciXtcYgE4SWYPzrN0wU80swnjyhmZaxS41BjB05FbQKZWFIq3am9EoWwPUXEmJMmk3mt8EBWhRZe5hUwAsBb3NXJ8HhrW9BxA+IKjpSDJi4xvki1CnPTVi3awI95H7B2GtppDclgTBGvabMuRNqAqVuKGO2TCM61RrnWlN05p4xtH8FfckJAdlvY7HLg5EGC0zrtrP5Aq4MvtU0BzGNGsOrtGXhA2QLFj4aagHXF8TKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5jg7sLvV3/fZ0GsqEJCtycNpNmzsRv4xnwF4nQBiDo=;
 b=g0cV3glxKkQEx+fjpi50Q4JIHIKhyDMY9FRdOmbKhEQ1i5Fs+/tO7Pq5F36U/7f93akqxWDj4ZuvJOfjie15cuVBJzYVFwQ/o+jodThe264ISHuPqyYkN8xudNbqrFx1liPApRN/jqDUaYyuEdwveCyMMKHbH6uK07iWsNgt/kk=
Received: from CY4PR12CA0026.namprd12.prod.outlook.com (2603:10b6:903:129::12)
 by BN8PR12MB3476.namprd12.prod.outlook.com (2603:10b6:408:63::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Wed, 11 Dec
 2019 02:51:04 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::204) by CY4PR12CA0026.outlook.office365.com
 (2603:10b6:903:129::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via Frontend
 Transport; Wed, 11 Dec 2019 02:51:04 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Wed, 11 Dec 2019 02:51:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 10 Dec
 2019 20:51:03 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 10 Dec
 2019 20:51:03 -0600
Received: from yttao-code-machine.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 10 Dec 2019 20:51:01 -0600
From: Yintian Tao <yttao@amd.com>
To: <Alexander.Deucher@amd.com>, <kenneth.feng@amd.com>
Subject: [PATCH] drm/amd/powerplay: enable pp one vf mode for vega10
Date: Wed, 11 Dec 2019 10:50:58 +0800
Message-ID: <20191211025058.25310-1-yttao@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(136003)(376002)(428003)(189003)(199004)(5660300002)(8936002)(81156014)(36756003)(70206006)(8676002)(30864003)(1076003)(81166006)(6636002)(26005)(2906002)(4326008)(6666004)(70586007)(110136005)(478600001)(316002)(356004)(336012)(2616005)(54906003)(426003)(7696005)(186003)(579004)(559001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3476; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be40d4d3-a13f-4948-9c9f-08d77de4f6d3
X-MS-TrafficTypeDiagnostic: BN8PR12MB3476:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34766FDB3D6A4D028BC9E988E55A0@BN8PR12MB3476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-Forefront-PRVS: 024847EE92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHFXiy8yqIbfWocbE2MSJBV7D8qX0ABA/GDKTovCM1mDpEp0IgEIQTu/YDgp2m7utwdJaT7R05AlJJaowW93r7YN6ME1hSOgVMbDTjvHlGb2FnxoQzhytvRPub8DqMMg026ACkzHpFwTe1lOlm7r6oUVUSpNLsGmyYvwNvEhUdOVhxhKV3aBVzsO2Fqia6zyN/YXJEPCPW+1hI/2+6Zj8o8qAzas2J0BfJk2HESetmYufqWm225diUngl/8lnzIqrl27REHB7bABDfAi2+bN5MkSeUD0AeDNiZScefPJbVj6f/vcqBpbKnVwR6loWWnDxPAyW68ANY4GAg/ab6ktJ+/nY1huFxa6bmLpNFebTDVLTWXwzGY4/msAk6SyCcHvQRwzf/L2xDlB2A5iq5eOKqJ3TVALkrsezuWJzw73eVfGHl0WPTR+aROAuAXd/ve2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 02:51:04.2445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be40d4d3-a13f-4948-9c9f-08d77de4f6d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3476
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
Cc: amd-gfx@lists.freedesktop.org, Yintian Tao <yttao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Originally, due to the restriction from PSP and SMU, VF has
to send message to hypervisor driver to handle powerplay
change which is complicated and redundant. Currently, SMU
and PSP can support VF to directly handle powerplay
change by itself. Therefore, the old code about the handshake
between VF and PF to handle powerplay will be removed and VF
will use new the registers below to handshake with SMU.
mmMP1_SMN_C2PMSG_101: register to handle SMU message
mmMP1_SMN_C2PMSG_102: register to handle SMU parameter
mmMP1_SMN_C2PMSG_103: register to handle SMU response

v2: remove module parameter pp_one_vf
v3: fix the parens
v4: forbid vf to change smu feature
v5: use hwmon_attributes_visible to skip sepicified hwmon atrribute
v6: change skip condition at vega10_copy_table_to_smc

Signed-off-by: Yintian Tao <yttao@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  16 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c        | 182 ++++++++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |  51 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h      |  14 +-
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c         |  78 --------
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h         |   4 -
 drivers/gpu/drm/amd/amdgpu/soc15.c            |   8 +-
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c |   4 +-
 .../drm/amd/powerplay/hwmgr/hardwaremanager.c |  15 +-
 drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c   |  16 ++
 drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c  |  30 +--
 .../drm/amd/powerplay/hwmgr/vega10_hwmgr.c    | 156 ++++++++++-----
 .../amd/powerplay/hwmgr/vega10_powertune.c    |   3 +
 drivers/gpu/drm/amd/powerplay/inc/hwmgr.h     |   1 +
 .../drm/amd/powerplay/smumgr/smu9_smumgr.c    |  56 ++++--
 .../drm/amd/powerplay/smumgr/vega10_smumgr.c  |  14 ++
 17 files changed, 352 insertions(+), 300 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 7324a5fc5ccb..47b4f359f07c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -1880,6 +1880,9 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 		}
 	}
 
+	if (amdgpu_sriov_vf(adev))
+		amdgpu_virt_init_data_exchange(adev);
+
 	r = amdgpu_ib_pool_init(adev);
 	if (r) {
 		dev_err(adev->dev, "IB initialization failed (%d).\n", r);
@@ -1921,11 +1924,8 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	amdgpu_amdkfd_device_init(adev);
 
 init_failed:
-	if (amdgpu_sriov_vf(adev)) {
-		if (!r)
-			amdgpu_virt_init_data_exchange(adev);
+	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_release_full_gpu(adev, true);
-	}
 
 	return r;
 }
@@ -2825,7 +2825,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	mutex_init(&adev->virt.vf_errors.lock);
 	hash_init(adev->mn_hash);
 	mutex_init(&adev->lock_reset);
-	mutex_init(&adev->virt.dpm_mutex);
 	mutex_init(&adev->psp.mutex);
 
 	r = amdgpu_device_check_arguments(adev);
@@ -3044,9 +3043,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	amdgpu_fbdev_init(adev);
 
-	if (amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev))
-		amdgpu_pm_virt_sysfs_init(adev);
-
 	r = amdgpu_pm_sysfs_init(adev);
 	if (r) {
 		adev->pm_sysfs_en = false;
@@ -3191,8 +3187,6 @@ void amdgpu_device_fini(struct amdgpu_device *adev)
 	iounmap(adev->rmmio);
 	adev->rmmio = NULL;
 	amdgpu_device_doorbell_fini(adev);
-	if (amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev))
-		amdgpu_pm_virt_sysfs_fini(adev);
 
 	amdgpu_debugfs_regs_cleanup(adev);
 	device_remove_file(adev->dev, &dev_attr_pcie_replay_count);
@@ -3673,6 +3667,7 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	if (r)
 		goto error;
 
+	amdgpu_virt_init_data_exchange(adev);
 	/* we need recover gart prior to run SMC/CP/SDMA resume */
 	amdgpu_gtt_mgr_recover(&adev->mman.bdev.man[TTM_PL_TT]);
 
@@ -3690,7 +3685,6 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	amdgpu_amdkfd_post_reset(adev);
 
 error:
-	amdgpu_virt_init_data_exchange(adev);
 	amdgpu_virt_release_full_gpu(adev, true);
 	if (!r && adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {
 		amdgpu_inc_vram_lost(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 5ec1415d1755..3a0ea9096498 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -703,10 +703,6 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
 		if (adev->pm.dpm_enabled) {
 			dev_info.max_engine_clock = amdgpu_dpm_get_sclk(adev, false) * 10;
 			dev_info.max_memory_clock = amdgpu_dpm_get_mclk(adev, false) * 10;
-		} else if (amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev) &&
-			   adev->virt.ops->get_pp_clk) {
-			dev_info.max_engine_clock = amdgpu_virt_get_sclk(adev, false) * 10;
-			dev_info.max_memory_clock = amdgpu_virt_get_mclk(adev, false) * 10;
 		} else {
 			dev_info.max_engine_clock = adev->clock.default_sclk * 10;
 			dev_info.max_memory_clock = adev->clock.default_mclk * 10;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index 0c7324bc31a7..b32adda70bbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -159,6 +159,9 @@ static ssize_t amdgpu_get_dpm_state(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	enum amd_pm_state_type pm;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev)) {
 		if (adev->smu.ppt_funcs->get_current_power_state)
 			pm = smu_get_current_power_state(&adev->smu);
@@ -184,6 +187,9 @@ static ssize_t amdgpu_set_dpm_state(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	enum amd_pm_state_type  state;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	if (strncmp("battery", buf, strlen("battery")) == 0)
 		state = POWER_STATE_TYPE_BATTERY;
 	else if (strncmp("balanced", buf, strlen("balanced")) == 0)
@@ -283,7 +289,7 @@ static ssize_t amdgpu_get_dpm_forced_performance_level(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	enum amd_dpm_forced_level level = 0xff;
 
-	if (amdgpu_sriov_vf(adev))
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
 		return 0;
 
 	if ((adev->flags & AMD_IS_PX) &&
@@ -320,6 +326,9 @@ static ssize_t amdgpu_set_dpm_forced_performance_level(struct device *dev,
 	enum amd_dpm_forced_level current_level = 0xff;
 	int ret = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	/* Can't force performance level when the card is off */
 	if  ((adev->flags & AMD_IS_PX) &&
 	     (ddev->switch_power_state != DRM_SWITCH_POWER_ON))
@@ -348,19 +357,6 @@ static ssize_t amdgpu_set_dpm_forced_performance_level(struct device *dev,
 		goto fail;
 	}
 
-	/* handle sriov case here */
-	if (amdgpu_sriov_vf(adev)) {
-		if (amdgim_is_hwperf(adev) &&
-		    adev->virt.ops->force_dpm_level) {
-			mutex_lock(&adev->pm.mutex);
-			adev->virt.ops->force_dpm_level(adev, level);
-			mutex_unlock(&adev->pm.mutex);
-			return count;
-		} else {
-			return -EINVAL;
-		}
-	}
-
 	if (is_support_sw_smu(adev))
 		current_level = smu_get_performance_level(&adev->smu);
 	else if (adev->powerplay.pp_funcs->get_performance_level)
@@ -440,6 +436,9 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
 	enum amd_pm_state_type pm = 0;
 	int i = 0, ret = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev)) {
 		pm = smu_get_current_power_state(smu);
 		ret = smu_get_power_num_states(smu, &data);
@@ -469,6 +468,9 @@ static ssize_t amdgpu_get_pp_force_state(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (adev->pp_force_state_enabled)
 		return amdgpu_get_pp_cur_state(dev, attr, buf);
 	else
@@ -486,6 +488,9 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
 	unsigned long idx;
 	int ret;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	if (strlen(buf) == 1)
 		adev->pp_force_state_enabled = false;
 	else if (is_support_sw_smu(adev))
@@ -535,6 +540,9 @@ static ssize_t amdgpu_get_pp_table(struct device *dev,
 	char *table = NULL;
 	int size;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev)) {
 		size = smu_sys_get_pp_table(&adev->smu, (void **)&table);
 		if (size < 0)
@@ -562,6 +570,9 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int ret = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	if (is_support_sw_smu(adev)) {
 		ret = smu_sys_set_pp_table(&adev->smu, (void *)buf, count);
 		if (ret)
@@ -654,6 +665,9 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
 	const char delimiter[3] = {' ', '\n', '\0'};
 	uint32_t type;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	if (count > 127)
 		return -EINVAL;
 
@@ -726,6 +740,9 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	uint32_t size = 0;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev)) {
 		size = smu_print_clk_levels(&adev->smu, SMU_OD_SCLK, buf);
 		size += smu_print_clk_levels(&adev->smu, SMU_OD_MCLK, buf+size);
@@ -770,6 +787,9 @@ static ssize_t amdgpu_set_pp_feature_status(struct device *dev,
 	uint64_t featuremask;
 	int ret;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	ret = kstrtou64(buf, 0, &featuremask);
 	if (ret)
 		return -EINVAL;
@@ -796,6 +816,9 @@ static ssize_t amdgpu_get_pp_feature_status(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev)) {
 		return smu_sys_get_pp_feature_mask(&adev->smu, buf);
 	} else if (adev->powerplay.pp_funcs->get_ppfeature_status)
@@ -841,9 +864,8 @@ static ssize_t amdgpu_get_pp_dpm_sclk(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
-	if (amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev) &&
-	    adev->virt.ops->get_pp_clk)
-		return adev->virt.ops->get_pp_clk(adev, PP_SCLK, buf);
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
 
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_SCLK, buf);
@@ -899,8 +921,8 @@ static ssize_t amdgpu_set_pp_dpm_sclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (amdgpu_sriov_vf(adev))
-		return 0;
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
@@ -924,9 +946,8 @@ static ssize_t amdgpu_get_pp_dpm_mclk(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
-	if (amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev) &&
-	    adev->virt.ops->get_pp_clk)
-		return adev->virt.ops->get_pp_clk(adev, PP_MCLK, buf);
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
 
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_MCLK, buf);
@@ -946,8 +967,8 @@ static ssize_t amdgpu_set_pp_dpm_mclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
-	if (amdgpu_sriov_vf(adev))
-		return 0;
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+			return -EINVAL;
 
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
@@ -971,6 +992,9 @@ static ssize_t amdgpu_get_pp_dpm_socclk(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_SOCCLK, buf);
 	else if (adev->powerplay.pp_funcs->print_clock_levels)
@@ -989,6 +1013,9 @@ static ssize_t amdgpu_set_pp_dpm_socclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
 		return ret;
@@ -1011,6 +1038,9 @@ static ssize_t amdgpu_get_pp_dpm_fclk(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_FCLK, buf);
 	else if (adev->powerplay.pp_funcs->print_clock_levels)
@@ -1029,6 +1059,9 @@ static ssize_t amdgpu_set_pp_dpm_fclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
 		return ret;
@@ -1051,6 +1084,9 @@ static ssize_t amdgpu_get_pp_dpm_dcefclk(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_DCEFCLK, buf);
 	else if (adev->powerplay.pp_funcs->print_clock_levels)
@@ -1069,6 +1105,9 @@ static ssize_t amdgpu_set_pp_dpm_dcefclk(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
 		return ret;
@@ -1091,6 +1130,9 @@ static ssize_t amdgpu_get_pp_dpm_pcie(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		return smu_print_clk_levels(&adev->smu, SMU_PCIE, buf);
 	else if (adev->powerplay.pp_funcs->print_clock_levels)
@@ -1109,6 +1151,9 @@ static ssize_t amdgpu_set_pp_dpm_pcie(struct device *dev,
 	int ret;
 	uint32_t mask = 0;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	ret = amdgpu_read_mask(buf, count, &mask);
 	if (ret)
 		return ret;
@@ -1132,6 +1177,9 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	uint32_t value = 0;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		value = smu_get_od_percentage(&(adev->smu), SMU_OD_SCLK);
 	else if (adev->powerplay.pp_funcs->get_sclk_od)
@@ -1150,6 +1198,9 @@ static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
 	int ret;
 	long int value;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	ret = kstrtol(buf, 0, &value);
 
 	if (ret) {
@@ -1183,6 +1234,9 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	uint32_t value = 0;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		value = smu_get_od_percentage(&(adev->smu), SMU_OD_MCLK);
 	else if (adev->powerplay.pp_funcs->get_mclk_od)
@@ -1201,6 +1255,9 @@ static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
 	int ret;
 	long int value;
 
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
 	ret = kstrtol(buf, 0, &value);
 
 	if (ret) {
@@ -1253,6 +1310,9 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (is_support_sw_smu(adev))
 		return smu_get_power_profile_mode(&adev->smu, buf);
 	else if (adev->powerplay.pp_funcs->get_power_profile_mode)
@@ -1285,6 +1345,9 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
 	if (ret)
 		goto fail;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return -EINVAL;
+
 	if (profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
 		if (count < 2 || count > 127)
 			return -EINVAL;
@@ -1331,6 +1394,9 @@ static ssize_t amdgpu_get_busy_percent(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int r, value, size = sizeof(value);
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	/* read the IP busy sensor */
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_GPU_LOAD,
 				   (void *)&value, &size);
@@ -1357,6 +1423,9 @@ static ssize_t amdgpu_get_memory_busy_percent(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	int r, value, size = sizeof(value);
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	/* read the IP busy sensor */
 	r = amdgpu_dpm_read_sensor(adev, AMDGPU_PP_SENSOR_MEM_LOAD,
 				   (void *)&value, &size);
@@ -1387,6 +1456,9 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
 	struct amdgpu_device *adev = ddev->dev_private;
 	uint64_t count0, count1;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	amdgpu_asic_get_pcie_usage(adev, &count0, &count1);
 	return snprintf(buf, PAGE_SIZE,	"%llu %llu %i\n",
 			count0, count1, pcie_get_mps(adev->pdev));
@@ -1409,6 +1481,9 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = ddev->dev_private;
 
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
 	if (adev->unique_id)
 		return snprintf(buf, PAGE_SIZE, "%016llx\n", adev->unique_id);
 
@@ -1603,6 +1678,7 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
 {
 	struct amdgpu_device *adev = dev_get_drvdata(dev);
 	u32 pwm_mode = 0;
+
 	if (is_support_sw_smu(adev)) {
 		pwm_mode = smu_get_fan_control_mode(&adev->smu);
 	} else {
@@ -2053,6 +2129,9 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
 	int err;
 	u32 value;
 
+	if (amdgpu_sriov_vf(adev))
+		return -EINVAL;
+
 	err = kstrtou32(buf, 10, &value);
 	if (err)
 		return err;
@@ -2299,6 +2378,23 @@ static umode_t hwmon_attributes_visible(struct kobject *kobj,
 	struct amdgpu_device *adev = dev_get_drvdata(dev);
 	umode_t effective_mode = attr->mode;
 
+	/* under multi-vf mode, the hwmon attributes are all not supported */
+	if (amdgpu_sriov_vf(adev) && !amdgpu_sriov_is_pp_one_vf(adev))
+		return 0;
+
+	/* there is no fan under pp one vf mode */
+	if (amdgpu_sriov_is_pp_one_vf(adev) &&
+	    (attr == &sensor_dev_attr_pwm1.dev_attr.attr ||
+	     attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
+	     attr == &sensor_dev_attr_pwm1_max.dev_attr.attr ||
+	     attr == &sensor_dev_attr_pwm1_min.dev_attr.attr ||
+	     attr == &sensor_dev_attr_fan1_input.dev_attr.attr ||
+	     attr == &sensor_dev_attr_fan1_min.dev_attr.attr ||
+	     attr == &sensor_dev_attr_fan1_max.dev_attr.attr ||
+	     attr == &sensor_dev_attr_fan1_target.dev_attr.attr ||
+	     attr == &sensor_dev_attr_fan1_enable.dev_attr.attr))
+		return 0;
+
 	/* Skip fan attributes if fan is not present */
 	if (adev->pm.no_fan && (attr == &sensor_dev_attr_pwm1.dev_attr.attr ||
 	    attr == &sensor_dev_attr_pwm1_enable.dev_attr.attr ||
@@ -2730,44 +2826,6 @@ void amdgpu_dpm_enable_jpeg(struct amdgpu_device *adev, bool enable)
 	}
 }
 
-int amdgpu_pm_virt_sysfs_init(struct amdgpu_device *adev)
-{
-	int ret = 0;
-
-	if (!(amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev)))
-		return ret;
-
-	ret = device_create_file(adev->dev, &dev_attr_pp_dpm_sclk);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_dpm_sclk\n");
-		return ret;
-	}
-
-	ret = device_create_file(adev->dev, &dev_attr_pp_dpm_mclk);
-	if (ret) {
-		DRM_ERROR("failed to create device file pp_dpm_mclk\n");
-		return ret;
-	}
-
-	ret = device_create_file(adev->dev, &dev_attr_power_dpm_force_performance_level);
-	if (ret) {
-		DRM_ERROR("failed to create device file for dpm state\n");
-		return ret;
-	}
-
-	return ret;
-}
-
-void amdgpu_pm_virt_sysfs_fini(struct amdgpu_device *adev)
-{
-	if (!(amdgpu_sriov_vf(adev) && amdgim_is_hwperf(adev)))
-		return;
-
-	device_remove_file(adev->dev, &dev_attr_power_dpm_force_performance_level);
-	device_remove_file(adev->dev, &dev_attr_pp_dpm_sclk);
-	device_remove_file(adev->dev, &dev_attr_pp_dpm_mclk);
-}
-
 int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev, uint32_t *smu_version)
 {
 	int r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index e32ae906d797..103033f96f13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -379,54 +379,3 @@ void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
 		}
 	}
 }
-
-static uint32_t parse_clk(char *buf, bool min)
-{
-        char *ptr = buf;
-        uint32_t clk = 0;
-
-        do {
-                ptr = strchr(ptr, ':');
-                if (!ptr)
-                        break;
-                ptr+=2;
-		if (kstrtou32(ptr, 10, &clk))
-			return 0;
-        } while (!min);
-
-        return clk * 100;
-}
-
-uint32_t amdgpu_virt_get_sclk(struct amdgpu_device *adev, bool lowest)
-{
-	char *buf = NULL;
-	uint32_t clk = 0;
-
-	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	adev->virt.ops->get_pp_clk(adev, PP_SCLK, buf);
-	clk = parse_clk(buf, lowest);
-
-	kfree(buf);
-
-	return clk;
-}
-
-uint32_t amdgpu_virt_get_mclk(struct amdgpu_device *adev, bool lowest)
-{
-	char *buf = NULL;
-	uint32_t clk = 0;
-
-	buf = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	adev->virt.ops->get_pp_clk(adev, PP_MCLK, buf);
-	clk = parse_clk(buf, lowest);
-
-	kfree(buf);
-
-	return clk;
-}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
index b0b2bdc750df..4d1ac7612967 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
@@ -57,8 +57,6 @@ struct amdgpu_virt_ops {
 	int (*reset_gpu)(struct amdgpu_device *adev);
 	int (*wait_reset)(struct amdgpu_device *adev);
 	void (*trans_msg)(struct amdgpu_device *adev, u32 req, u32 data1, u32 data2, u32 data3);
-	int (*get_pp_clk)(struct amdgpu_device *adev, u32 type, char *buf);
-	int (*force_dpm_level)(struct amdgpu_device *adev, u32 level);
 };
 
 /*
@@ -85,8 +83,8 @@ enum AMDGIM_FEATURE_FLAG {
 	AMDGIM_FEATURE_GIM_LOAD_UCODES   = 0x2,
 	/* VRAM LOST by GIM */
 	AMDGIM_FEATURE_GIM_FLR_VRAMLOST = 0x4,
-	/* HW PERF SIM in GIM */
-	AMDGIM_FEATURE_HW_PERF_SIMULATION = (1 << 3),
+	/* PP ONE VF MODE in GIM */
+	AMDGIM_FEATURE_PP_ONE_VF = (1 << 4),
 };
 
 struct amd_sriov_msg_pf2vf_info_header {
@@ -257,8 +255,6 @@ struct amdgpu_virt {
 	struct amdgpu_vf_error_buffer   vf_errors;
 	struct amdgpu_virt_fw_reserve	fw_reserve;
 	uint32_t gim_feature;
-	/* protect DPM events to GIM */
-	struct mutex                    dpm_mutex;
 	uint32_t reg_access_mode;
 };
 
@@ -286,8 +282,8 @@ static inline bool is_virtual_machine(void)
 #endif
 }
 
-#define amdgim_is_hwperf(adev) \
-	((adev)->virt.gim_feature & AMDGIM_FEATURE_HW_PERF_SIMULATION)
+#define amdgpu_sriov_is_pp_one_vf(adev) \
+	((adev)->virt.gim_feature & AMDGIM_FEATURE_PP_ONE_VF)
 
 bool amdgpu_virt_mmio_blocked(struct amdgpu_device *adev);
 void amdgpu_virt_init_setting(struct amdgpu_device *adev);
@@ -306,6 +302,4 @@ int amdgpu_virt_fw_reserve_get_checksum(void *obj, unsigned long obj_size,
 					unsigned int key,
 					unsigned int chksum);
 void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev);
-uint32_t amdgpu_virt_get_sclk(struct amdgpu_device *adev, bool lowest);
-uint32_t amdgpu_virt_get_mclk(struct amdgpu_device *adev, bool lowest);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
index cc5bf595f9b1..43305afa3d6f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
@@ -158,82 +158,6 @@ static void xgpu_ai_mailbox_trans_msg (struct amdgpu_device *adev,
 	xgpu_ai_mailbox_set_valid(adev, false);
 }
 
-static int xgpu_ai_get_pp_clk(struct amdgpu_device *adev, u32 type, char *buf)
-{
-        int r = 0;
-        u32 req, val, size;
-
-        if (!amdgim_is_hwperf(adev) || buf == NULL)
-                return -EBADRQC;
-
-        switch(type) {
-        case PP_SCLK:
-                req = IDH_IRQ_GET_PP_SCLK;
-                break;
-        case PP_MCLK:
-                req = IDH_IRQ_GET_PP_MCLK;
-                break;
-        default:
-                return -EBADRQC;
-        }
-
-        mutex_lock(&adev->virt.dpm_mutex);
-
-        xgpu_ai_mailbox_trans_msg(adev, req, 0, 0, 0);
-
-        r = xgpu_ai_poll_msg(adev, IDH_SUCCESS);
-        if (!r && adev->fw_vram_usage.va != NULL) {
-                val = RREG32_NO_KIQ(
-                        SOC15_REG_OFFSET(NBIO, 0,
-                                         mmBIF_BX_PF0_MAILBOX_MSGBUF_RCV_DW1));
-                size = strnlen((((char *)adev->virt.fw_reserve.p_pf2vf) +
-                                val), PAGE_SIZE);
-
-                if (size < PAGE_SIZE)
-                        strcpy(buf,((char *)adev->virt.fw_reserve.p_pf2vf + val));
-                else
-                        size = 0;
-
-                r = size;
-                goto out;
-        }
-
-        r = xgpu_ai_poll_msg(adev, IDH_FAIL);
-        if(r)
-                pr_info("%s DPM request failed",
-                        (type == PP_SCLK)? "SCLK" : "MCLK");
-
-out:
-        mutex_unlock(&adev->virt.dpm_mutex);
-        return r;
-}
-
-static int xgpu_ai_force_dpm_level(struct amdgpu_device *adev, u32 level)
-{
-        int r = 0;
-        u32 req = IDH_IRQ_FORCE_DPM_LEVEL;
-
-        if (!amdgim_is_hwperf(adev))
-                return -EBADRQC;
-
-        mutex_lock(&adev->virt.dpm_mutex);
-        xgpu_ai_mailbox_trans_msg(adev, req, level, 0, 0);
-
-        r = xgpu_ai_poll_msg(adev, IDH_SUCCESS);
-        if (!r)
-                goto out;
-
-        r = xgpu_ai_poll_msg(adev, IDH_FAIL);
-        if (!r)
-                pr_info("DPM request failed");
-        else
-                pr_info("Mailbox is broken");
-
-out:
-        mutex_unlock(&adev->virt.dpm_mutex);
-        return r;
-}
-
 static int xgpu_ai_send_access_requests(struct amdgpu_device *adev,
 					enum idh_request req)
 {
@@ -455,6 +379,4 @@ const struct amdgpu_virt_ops xgpu_ai_virt_ops = {
 	.reset_gpu = xgpu_ai_request_reset,
 	.wait_reset = NULL,
 	.trans_msg = xgpu_ai_mailbox_trans_msg,
-	.get_pp_clk = xgpu_ai_get_pp_clk,
-	.force_dpm_level = xgpu_ai_force_dpm_level,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h
index 077e91a33d62..37dbe0f2142f 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h
@@ -35,10 +35,6 @@ enum idh_request {
 	IDH_REL_GPU_FINI_ACCESS,
 	IDH_REQ_GPU_RESET_ACCESS,
 
-	IDH_IRQ_FORCE_DPM_LEVEL = 10,
-	IDH_IRQ_GET_PP_SCLK,
-	IDH_IRQ_GET_PP_MCLK,
-
 	IDH_LOG_VF_ERROR       = 200,
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 09dca499a880..5bd6ae7a52fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -775,11 +775,11 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
 		}
 		amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
-		if (!amdgpu_sriov_vf(adev)) {
-			if (is_support_sw_smu(adev))
+		if (is_support_sw_smu(adev)) {
+			if (!amdgpu_sriov_vf(adev))
 				amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
-			else
-				amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
+		} else {
+			amdgpu_device_ip_block_add(adev, &pp_smu_ip_block);
 		}
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
 			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index 7932eb163a00..5087d6bdba60 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -48,7 +48,6 @@ static int amd_powerplay_create(struct amdgpu_device *adev)
 
 	hwmgr->adev = adev;
 	hwmgr->not_vf = !amdgpu_sriov_vf(adev);
-	hwmgr->pm_en = (amdgpu_dpm && hwmgr->not_vf) ? true : false;
 	hwmgr->device = amdgpu_cgs_create_device(adev);
 	mutex_init(&hwmgr->smu_lock);
 	hwmgr->chip_family = adev->family;
@@ -276,6 +275,9 @@ static int pp_dpm_load_fw(void *handle)
 {
 	struct pp_hwmgr *hwmgr = handle;
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!hwmgr || !hwmgr->smumgr_funcs || !hwmgr->smumgr_funcs->start_smu)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c
index cc57fb953e62..253860d30b20 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hardwaremanager.c
@@ -81,8 +81,8 @@ int phm_enable_dynamic_state_management(struct pp_hwmgr *hwmgr)
 	adev = hwmgr->adev;
 
 	/* Skip for suspend/resume case */
-	if (smum_is_dpm_running(hwmgr) && !amdgpu_passthrough(adev)
-		&& adev->in_suspend) {
+	if (!hwmgr->pp_one_vf && smum_is_dpm_running(hwmgr)
+	    && !amdgpu_passthrough(adev) && adev->in_suspend) {
 		pr_info("dpm has been enabled\n");
 		return 0;
 	}
@@ -200,6 +200,9 @@ int phm_stop_thermal_controller(struct pp_hwmgr *hwmgr)
 {
 	PHM_FUNC_CHECK(hwmgr);
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (hwmgr->hwmgr_func->stop_thermal_controller == NULL)
 		return -EINVAL;
 
@@ -237,6 +240,9 @@ int phm_start_thermal_controller(struct pp_hwmgr *hwmgr)
 		TEMP_RANGE_MAX};
 	struct amdgpu_device *adev = hwmgr->adev;
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (hwmgr->hwmgr_func->get_thermal_temperature_range)
 		hwmgr->hwmgr_func->get_thermal_temperature_range(
 				hwmgr, &range);
@@ -263,6 +269,8 @@ int phm_start_thermal_controller(struct pp_hwmgr *hwmgr)
 bool phm_check_smc_update_required_for_display_configuration(struct pp_hwmgr *hwmgr)
 {
 	PHM_FUNC_CHECK(hwmgr);
+	if (hwmgr->pp_one_vf)
+		return false;
 
 	if (hwmgr->hwmgr_func->check_smc_update_required_for_display_configuration == NULL)
 		return false;
@@ -482,6 +490,9 @@ int phm_disable_smc_firmware_ctf(struct pp_hwmgr *hwmgr)
 {
 	PHM_FUNC_CHECK(hwmgr);
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (hwmgr->hwmgr_func->disable_smc_firmware_ctf == NULL)
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
index d2909c91d65b..e2b82c902948 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/hwmgr.c
@@ -221,6 +221,9 @@ int hwmgr_hw_init(struct pp_hwmgr *hwmgr)
 {
 	int ret = 0;
 
+	hwmgr->pp_one_vf = amdgpu_sriov_is_pp_one_vf((struct amdgpu_device *)hwmgr->adev);
+	hwmgr->pm_en = (amdgpu_dpm && (hwmgr->not_vf || hwmgr->pp_one_vf))
+			? true : false;
 	if (!hwmgr->pm_en)
 		return 0;
 
@@ -279,6 +282,9 @@ int hwmgr_hw_init(struct pp_hwmgr *hwmgr)
 
 int hwmgr_hw_fini(struct pp_hwmgr *hwmgr)
 {
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!hwmgr || !hwmgr->pm_en)
 		return 0;
 
@@ -299,6 +305,9 @@ int hwmgr_suspend(struct pp_hwmgr *hwmgr)
 {
 	int ret = 0;
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!hwmgr || !hwmgr->pm_en)
 		return 0;
 
@@ -318,6 +327,9 @@ int hwmgr_resume(struct pp_hwmgr *hwmgr)
 {
 	int ret = 0;
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!hwmgr)
 		return -EINVAL;
 
@@ -365,6 +377,8 @@ int hwmgr_handle_task(struct pp_hwmgr *hwmgr, enum amd_pp_task task_id,
 
 	switch (task_id) {
 	case AMD_PP_TASK_DISPLAY_CONFIG_CHANGE:
+		if (!hwmgr->not_vf)
+			return ret;
 		ret = phm_pre_display_configuration_changed(hwmgr);
 		if (ret)
 			return ret;
@@ -381,6 +395,8 @@ int hwmgr_handle_task(struct pp_hwmgr *hwmgr, enum amd_pp_task task_id,
 		enum PP_StateUILabel requested_ui_label;
 		struct pp_power_state *requested_ps = NULL;
 
+		if (!hwmgr->not_vf)
+			return ret;
 		if (user_state == NULL) {
 			ret = -EINVAL;
 			break;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c b/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
index 6bf48934fdc4..31a32a79cfc2 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/pp_psm.c
@@ -262,20 +262,22 @@ int psm_adjust_power_state_dynamic(struct pp_hwmgr *hwmgr, bool skip_display_set
 	uint32_t index;
 	long workload;
 
-	if (!skip_display_settings)
-		phm_display_configuration_changed(hwmgr);
-
-	if (hwmgr->ps)
-		power_state_management(hwmgr, new_ps);
-	else
-		/*
-		 * for vega12/vega20 which does not support power state manager
-		 * DAL clock limits should also be honoured
-		 */
-		phm_apply_clock_adjust_rules(hwmgr);
-
-	if (!skip_display_settings)
-		phm_notify_smc_display_config_after_ps_adjustment(hwmgr);
+	if (hwmgr->not_vf) {
+		if (!skip_display_settings)
+			phm_display_configuration_changed(hwmgr);
+
+		if (hwmgr->ps)
+			power_state_management(hwmgr, new_ps);
+		else
+			/*
+			 * for vega12/vega20 which does not support power state manager
+			 * DAL clock limits should also be honoured
+			 */
+			phm_apply_clock_adjust_rules(hwmgr);
+
+		if (!skip_display_settings)
+			phm_notify_smc_display_config_after_ps_adjustment(hwmgr);
+	}
 
 	if (!phm_force_dpm_levels(hwmgr, hwmgr->request_dpm_level))
 		hwmgr->dpm_level = hwmgr->request_dpm_level;
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
index 4685193eca87..148446570e21 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_hwmgr.c
@@ -912,6 +912,9 @@ static int vega10_hwmgr_backend_init(struct pp_hwmgr *hwmgr)
 	hwmgr->platform_descriptor.clockStep.memoryClock = 500;
 
 	data->total_active_cus = adev->gfx.cu_info.number;
+	if (!hwmgr->not_vf)
+		return result;
+
 	/* Setup default Overdrive Fan control settings */
 	data->odn_fan_table.target_fan_speed =
 			hwmgr->thermal_controller.advanceFanControlParameters.usMaxFanRPM;
@@ -979,6 +982,9 @@ static int vega10_setup_dpm_led_config(struct pp_hwmgr *hwmgr)
 
 static int vega10_setup_asic_task(struct pp_hwmgr *hwmgr)
 {
+	if (!hwmgr->not_vf)
+		return 0;
+
 	PP_ASSERT_WITH_CODE(!vega10_init_sclk_threshold(hwmgr),
 			"Failed to init sclk threshold!",
 			return -EINVAL);
@@ -2503,6 +2509,9 @@ static int vega10_init_smc_table(struct pp_hwmgr *hwmgr)
 			"Failed to setup default DPM tables!",
 			return result);
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	/* initialize ODN table */
 	if (hwmgr->od_enabled) {
 		if (odn_table->max_vddc) {
@@ -2826,6 +2835,8 @@ static int vega10_stop_dpm(struct pp_hwmgr *hwmgr, uint32_t bitmap)
 	struct vega10_hwmgr *data = hwmgr->backend;
 	uint32_t i, feature_mask = 0;
 
+	if (!hwmgr->not_vf)
+		return 0;
 
 	if(data->smu_features[GNLD_LED_DISPLAY].supported == true){
 		PP_ASSERT_WITH_CODE(!vega10_enable_smc_features(hwmgr,
@@ -2932,61 +2943,73 @@ static int vega10_enable_dpm_tasks(struct pp_hwmgr *hwmgr)
 	struct vega10_hwmgr *data = hwmgr->backend;
 	int tmp_result, result = 0;
 
-	vega10_enable_disable_PCC_limit_feature(hwmgr, true);
-
-	smum_send_msg_to_smc_with_parameter(hwmgr,
-		PPSMC_MSG_ConfigureTelemetry, data->config_telemetry);
+	if (hwmgr->not_vf) {
+		vega10_enable_disable_PCC_limit_feature(hwmgr, true);
 
-	tmp_result = vega10_construct_voltage_tables(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to construct voltage tables!",
-			result = tmp_result);
+		smum_send_msg_to_smc_with_parameter(hwmgr,
+			PPSMC_MSG_ConfigureTelemetry, data->config_telemetry);
 
-	tmp_result = vega10_init_smc_table(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to initialize SMC table!",
-			result = tmp_result);
+		tmp_result = vega10_construct_voltage_tables(hwmgr);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to construct voltage tables!",
+				    result = tmp_result);
+	}
 
-	if (PP_CAP(PHM_PlatformCaps_ThermalController)) {
-		tmp_result = vega10_enable_thermal_protection(hwmgr);
+	if (hwmgr->not_vf || hwmgr->pp_one_vf) {
+		tmp_result = vega10_init_smc_table(hwmgr);
 		PP_ASSERT_WITH_CODE(!tmp_result,
-				"Failed to enable thermal protection!",
-				result = tmp_result);
+				    "Failed to initialize SMC table!",
+				    result = tmp_result);
 	}
 
-	tmp_result = vega10_enable_vrhot_feature(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to enable VR hot feature!",
-			result = tmp_result);
+	if (hwmgr->not_vf) {
+		if (PP_CAP(PHM_PlatformCaps_ThermalController)) {
+			tmp_result = vega10_enable_thermal_protection(hwmgr);
+			PP_ASSERT_WITH_CODE(!tmp_result,
+					    "Failed to enable thermal protection!",
+					    result = tmp_result);
+		}
 
-	tmp_result = vega10_enable_deep_sleep_master_switch(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to enable deep sleep master switch!",
-			result = tmp_result);
+		tmp_result = vega10_enable_vrhot_feature(hwmgr);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to enable VR hot feature!",
+				    result = tmp_result);
 
-	tmp_result = vega10_start_dpm(hwmgr, SMC_DPM_FEATURES);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to start DPM!", result = tmp_result);
+		tmp_result = vega10_enable_deep_sleep_master_switch(hwmgr);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to enable deep sleep master switch!",
+				    result = tmp_result);
+	}
+
+	if (hwmgr->not_vf) {
+		tmp_result = vega10_start_dpm(hwmgr, SMC_DPM_FEATURES);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to start DPM!", result = tmp_result);
+	}
 
-	/* enable didt, do not abort if failed didt */
-	tmp_result = vega10_enable_didt_config(hwmgr);
-	PP_ASSERT(!tmp_result,
-			"Failed to enable didt config!");
+	if (hwmgr->not_vf) {
+		/* enable didt, do not abort if failed didt */
+		tmp_result = vega10_enable_didt_config(hwmgr);
+		PP_ASSERT(!tmp_result,
+			  "Failed to enable didt config!");
+	}
 
 	tmp_result = vega10_enable_power_containment(hwmgr);
 	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to enable power containment!",
-			result = tmp_result);
+			    "Failed to enable power containment!",
+			    result = tmp_result);
 
-	tmp_result = vega10_power_control_set_level(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to power control set level!",
-			result = tmp_result);
+	if (hwmgr->not_vf) {
+		tmp_result = vega10_power_control_set_level(hwmgr);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to power control set level!",
+				    result = tmp_result);
 
-	tmp_result = vega10_enable_ulv(hwmgr);
-	PP_ASSERT_WITH_CODE(!tmp_result,
-			"Failed to enable ULV!",
-			result = tmp_result);
+		tmp_result = vega10_enable_ulv(hwmgr);
+		PP_ASSERT_WITH_CODE(!tmp_result,
+				    "Failed to enable ULV!",
+				    result = tmp_result);
+	}
 
 	return result;
 }
@@ -3080,11 +3103,22 @@ static int vega10_get_pp_table_entry_callback_func(struct pp_hwmgr *hwmgr,
 	performance_level->soc_clock = socclk_dep_table->entries
 				[state_entry->ucSocClockIndexHigh].ulClk;
 	if (gfxclk_dep_table->ucRevId == 0) {
-		performance_level->gfx_clock = gfxclk_dep_table->entries
-			[state_entry->ucGfxClockIndexHigh].ulClk;
+		/* under vega10 pp one vf mode, the gfx clk dpm need be lower
+		 * to level-4 due to the limited 110w-power
+		 */
+		if (hwmgr->pp_one_vf && (state_entry->ucGfxClockIndexHigh > 0))
+			performance_level->gfx_clock =
+				gfxclk_dep_table->entries[4].ulClk;
+		else
+			performance_level->gfx_clock = gfxclk_dep_table->entries
+				[state_entry->ucGfxClockIndexHigh].ulClk;
 	} else if (gfxclk_dep_table->ucRevId == 1) {
 		patom_record_V2 = (ATOM_Vega10_GFXCLK_Dependency_Record_V2 *)gfxclk_dep_table->entries;
-		performance_level->gfx_clock = patom_record_V2[state_entry->ucGfxClockIndexHigh].ulClk;
+		if (hwmgr->pp_one_vf && (state_entry->ucGfxClockIndexHigh > 0))
+			performance_level->gfx_clock = patom_record_V2[4].ulClk;
+		else
+			performance_level->gfx_clock =
+				patom_record_V2[state_entry->ucGfxClockIndexHigh].ulClk;
 	}
 
 	performance_level->mem_clock = mclk_dep_table->entries
@@ -3495,6 +3529,7 @@ static int vega10_upload_dpm_bootup_level(struct pp_hwmgr *hwmgr)
 			smum_send_msg_to_smc_with_parameter(hwmgr,
 				PPSMC_MSG_SetSoftMinGfxclkByIndex,
 				data->smc_state_table.gfx_boot_level);
+
 			data->dpm_table.gfx_table.dpm_state.soft_min_level =
 					data->smc_state_table.gfx_boot_level;
 		}
@@ -3518,6 +3553,9 @@ static int vega10_upload_dpm_bootup_level(struct pp_hwmgr *hwmgr)
 		}
 	}
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!data->registry_data.socclk_dpm_key_disabled) {
 		if (data->smc_state_table.soc_boot_level !=
 				data->dpm_table.soc_table.dpm_state.soft_min_level) {
@@ -3560,6 +3598,9 @@ static int vega10_upload_dpm_max_level(struct pp_hwmgr *hwmgr)
 		}
 	}
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (!data->registry_data.socclk_dpm_key_disabled) {
 		if (data->smc_state_table.soc_max_level !=
 			data->dpm_table.soc_table.dpm_state.soft_max_level) {
@@ -4054,15 +4095,25 @@ static int vega10_get_profiling_clk_mask(struct pp_hwmgr *hwmgr, enum amd_dpm_fo
 	} else if (level == AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) {
 		*mclk_mask = 0;
 	} else if (level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) {
-		*sclk_mask = table_info->vdd_dep_on_sclk->count - 1;
+		/* under vega10  pp one vf mode, the gfx clk dpm need be lower
+		 * to level-4 due to the limited power
+		 */
+		if (hwmgr->pp_one_vf)
+			*sclk_mask = 4;
+		else
+			*sclk_mask = table_info->vdd_dep_on_sclk->count - 1;
 		*soc_mask = table_info->vdd_dep_on_socclk->count - 1;
 		*mclk_mask = table_info->vdd_dep_on_mclk->count - 1;
 	}
+
 	return 0;
 }
 
 static void vega10_set_fan_control_mode(struct pp_hwmgr *hwmgr, uint32_t mode)
 {
+	if (!hwmgr->not_vf)
+		return;
+
 	switch (mode) {
 	case AMD_FAN_CTRL_NONE:
 		vega10_fan_ctrl_set_fan_speed_percent(hwmgr, 100);
@@ -4176,6 +4227,9 @@ static int vega10_dpm_force_dpm_level(struct pp_hwmgr *hwmgr,
 		break;
 	}
 
+	if (!hwmgr->not_vf)
+		return ret;
+
 	if (!ret) {
 		if (level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK && hwmgr->dpm_level != AMD_DPM_FORCED_LEVEL_PROFILE_PEAK)
 			vega10_set_fan_control_mode(hwmgr, AMD_FAN_CTRL_NONE);
@@ -4479,7 +4533,7 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 	struct vega10_pcie_table *pcie_table = &(data->dpm_table.pcie_table);
 	struct vega10_odn_clock_voltage_dependency_table *podn_vdd_dep = NULL;
 
-	int i, now, size = 0;
+	int i, now, size = 0, count = 0;
 
 	switch (type) {
 	case PP_SCLK:
@@ -4489,7 +4543,12 @@ static int vega10_print_clock_levels(struct pp_hwmgr *hwmgr,
 		smum_send_msg_to_smc(hwmgr, PPSMC_MSG_GetCurrentGfxclkIndex);
 		now = smum_get_argument(hwmgr);
 
-		for (i = 0; i < sclk_table->count; i++)
+		if (hwmgr->pp_one_vf &&
+		    (hwmgr->dpm_level == AMD_DPM_FORCED_LEVEL_PROFILE_PEAK))
+			count = 5;
+		else
+			count = sclk_table->count;
+		for (i = 0; i < count; i++)
 			size += sprintf(buf + size, "%d: %uMhz %s\n",
 					i, sclk_table->dpm_levels[i].value / 100,
 					(i == now) ? "*" : "");
@@ -4700,6 +4759,9 @@ static int vega10_disable_dpm_tasks(struct pp_hwmgr *hwmgr)
 {
 	int tmp_result, result = 0;
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (PP_CAP(PHM_PlatformCaps_ThermalController))
 		vega10_disable_thermal_protection(hwmgr);
 
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
index 6f26cb241ecc..0a677d4bc87b 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega10_powertune.c
@@ -1343,6 +1343,9 @@ int vega10_enable_power_containment(struct pp_hwmgr *hwmgr)
 	hwmgr->default_power_limit = hwmgr->power_limit =
 			(uint32_t)(tdp_table->usMaximumPowerDeliveryLimit);
 
+	if (!hwmgr->not_vf)
+		return 0;
+
 	if (PP_CAP(PHM_PlatformCaps_PowerContainment)) {
 		if (data->smu_features[GNLD_PPT].supported)
 			PP_ASSERT_WITH_CODE(!vega10_enable_smc_features(hwmgr,
diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
index af977675fd33..2ffb666b97e6 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
@@ -741,6 +741,7 @@ struct pp_hwmgr {
 	uint32_t smu_version;
 	bool not_vf;
 	bool pm_en;
+	bool pp_one_vf;
 	struct mutex smu_lock;
 
 	uint32_t pp_table_version;
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/smu9_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/smu9_smumgr.c
index 742b3dc1f6cb..adfbcbe5d113 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/smu9_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/smu9_smumgr.c
@@ -61,15 +61,29 @@ static uint32_t smu9_wait_for_response(struct pp_hwmgr *hwmgr)
 	uint32_t reg;
 	uint32_t ret;
 
-	reg = SOC15_REG_OFFSET(MP1, 0, mmMP1_SMN_C2PMSG_90);
+	/* Due to the L1 policy problem under SRIOV, we have to use
+	 * mmMP1_SMN_C2PMSG_103 as the driver response register
+	 */
+	if (hwmgr->pp_one_vf) {
+		reg = SOC15_REG_OFFSET(MP1, 0, mmMP1_SMN_C2PMSG_103);
 
-	ret = phm_wait_for_register_unequal(hwmgr, reg,
-			0, MP1_C2PMSG_90__CONTENT_MASK);
+		ret = phm_wait_for_register_unequal(hwmgr, reg,
+				0, MP1_C2PMSG_103__CONTENT_MASK);
 
-	if (ret)
-		pr_err("No response from smu\n");
+		if (ret)
+			pr_err("No response from smu\n");
 
-	return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90);
+		return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_103);
+	} else {
+		reg = SOC15_REG_OFFSET(MP1, 0, mmMP1_SMN_C2PMSG_90);
+
+		ret = phm_wait_for_register_unequal(hwmgr, reg,
+				0, MP1_C2PMSG_90__CONTENT_MASK);
+
+		if (ret)
+			pr_err("No response from smu\n");
+		return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90);
+	}
 }
 
 /*
@@ -83,7 +97,11 @@ static int smu9_send_msg_to_smc_without_waiting(struct pp_hwmgr *hwmgr,
 {
 	struct amdgpu_device *adev = hwmgr->adev;
 
-	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66, msg);
+	if (hwmgr->pp_one_vf) {
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_101, msg);
+	} else {
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_66, msg);
+	}
 
 	return 0;
 }
@@ -101,7 +119,10 @@ int smu9_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
 
 	smu9_wait_for_response(hwmgr);
 
-	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);
+	if (hwmgr->pp_one_vf)
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_103, 0);
+	else
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);
 
 	smu9_send_msg_to_smc_without_waiting(hwmgr, msg);
 
@@ -127,9 +148,17 @@ int smu9_send_msg_to_smc_with_parameter(struct pp_hwmgr *hwmgr,
 
 	smu9_wait_for_response(hwmgr);
 
-	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);
-
-	WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82, parameter);
+	/* Due to the L1 policy problem under SRIOV, we have to use
+	 * mmMP1_SMN_C2PMSG_101 as the driver message register and
+	 * mmMP1_SMN_C2PMSG_102 as the driver parameter register.
+	 */
+	if (hwmgr->pp_one_vf) {
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_103, 0);
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_102, parameter);
+	} else {
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_90, 0);
+		WREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82, parameter);
+	}
 
 	smu9_send_msg_to_smc_without_waiting(hwmgr, msg);
 
@@ -144,5 +173,8 @@ uint32_t smu9_get_argument(struct pp_hwmgr *hwmgr)
 {
 	struct amdgpu_device *adev = hwmgr->adev;
 
-	return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
+	if (hwmgr->pp_one_vf)
+		return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_102);
+	else
+		return RREG32_SOC15(MP1, 0, mmMP1_SMN_C2PMSG_82);
 }
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
index 0f3836fd9666..39427ca32a15 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega10_smumgr.c
@@ -71,6 +71,12 @@ static int vega10_copy_table_to_smc(struct pp_hwmgr *hwmgr,
 {
 	struct vega10_smumgr *priv = hwmgr->smu_backend;
 
+	/* under sriov, vbios or hypervisor driver
+	 * has already copy table to smc so here only skip it
+	 */
+	if (!hwmgr->not_vf)
+		return 0;
+
 	PP_ASSERT_WITH_CODE(table_id < MAX_SMU_TABLE,
 			"Invalid SMU Table ID!", return -EINVAL);
 	PP_ASSERT_WITH_CODE(priv->smu_tables.entry[table_id].version != 0,
@@ -100,6 +106,14 @@ int vega10_enable_smc_features(struct pp_hwmgr *hwmgr,
 	int msg = enable ? PPSMC_MSG_EnableSmuFeatures :
 			PPSMC_MSG_DisableSmuFeatures;
 
+	/* VF has no permission to change smu feature due
+	 * to security concern even under pp one vf mode
+	 * it still can't do it. For vega10, the smu in
+	 * vbios will enable the appropriate features.
+	 * */
+	if (!hwmgr->not_vf)
+		return 0;
+
 	return smum_send_msg_to_smc_with_parameter(hwmgr,
 			msg, feature_mask);
 }
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
