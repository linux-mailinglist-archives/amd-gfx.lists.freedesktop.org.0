Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A71297D458D
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Oct 2023 04:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA31810E08B;
	Tue, 24 Oct 2023 02:33:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D3610E2CF
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Oct 2023 02:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gs+11Bl8eUiNv7s09g/CXcsJ1JhaQNWwhiNn5h9Avdog0UU2Ua5Y+iC2LIy+sp7uf8/BcJhvZ/CqE+J4igc+iO91lgiVYpmquLn2khzMgxVMBUwkGmD1cyyO8R31ME86jm1bF4/ZEFTHz1ixD4vdKJr39ncan+LiR53M1KPI8i+b48GW3gvXYHlTFre61VqqS2pIKM8JuV4iaAr7F+876HKa4fgeSZTqMHL9Z4GwTagWJJDC3hSBhTpNtvlud5SJjCp+dwQY4sUDr2mI/7F8DSdZniF1Su1kJW3NP7RmasrtxRnoAXmLWmdOCyQAyMqmYUpZg2Xdaeg6BjLmIUi75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dl3cwa4/ve0sIHfXaDwNgJzTgCzwMVSVQxdNzy5Qh8w=;
 b=fZEzMK0pCzjTnIcZMjpCwLn3F/DrIeoB1ekDH9lqcU5Ug/oRmEn/9b+Ir/Kha5ZIyoTu5wVGJiZ0ayJ2KVbiy/clbr4STFGD3Jvix+Wz0DeyCayfFSqLTCgWfxx2WDUBgEdcl5M/wlpb79CbDztAdt8HLlP1yGHIhIB5drZ1vhthD0DWxDGLRlzFHT73fr5ENTkvR93ipn1IdRFxYNDbE2+iceN3ZH7E/inFxjSH3UCMxfhcejw9gOIvIbSPGPbkHY8MDdRDH/qqnVCFiDrmGV3AJes9Z8JiR2hGcwJXNUJ+tTMkcBKdXouAlpbMB8JtVI/sL4/7o3BoDLwJ0+uUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl3cwa4/ve0sIHfXaDwNgJzTgCzwMVSVQxdNzy5Qh8w=;
 b=y5SzaE/tn5V4PnI2z9UL98YJeURJnejfca0Oa8bSyauhXDHpDcd00xvem2oR7ZCgHUXZNlcdRcXqW3tgUVDg0MqJ735y+cAFhEIeHaNgzDreqxnwiMfFJKL1rdBJlsRpymzmP/e4pkHlfZDHwCWvug4xiLSldUS9dq39jgad+wc=
Received: from BL1PR13CA0163.namprd13.prod.outlook.com (2603:10b6:208:2bd::18)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.29; Tue, 24 Oct 2023 02:33:38 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::df) by BL1PR13CA0163.outlook.office365.com
 (2603:10b6:208:2bd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16 via Frontend
 Transport; Tue, 24 Oct 2023 02:33:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 02:33:38 +0000
Received: from pyuan-Chachani-VN.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 23 Oct 2023 21:33:35 -0500
From: Perry Yuan <perry.yuan@amd.com>
To: <yifan1.zhang@amd.com>, <kenneth.feng@amd.com>, <Mario.Limonciello@amd.com>
Subject: [PATCH 3/3] drm/amdgpu: optimize RLC powerdown notification on Vangogh
Date: Tue, 24 Oct 2023 10:33:18 +0800
Message-ID: <8f3de9be5172fd0af917c0e434292e57bc13d527.1698114574.git.perry.yuan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9d71cec3a900bedfc4a9f2409a606405deb60985.1698114574.git.perry.yuan@amd.com>
References: <9d71cec3a900bedfc4a9f2409a606405deb60985.1698114574.git.perry.yuan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS7PR12MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9be562-1526-4e89-23d9-08dbd439a0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CxSOn2h7LTyB2DlhmSRueL0y2RajboNFoUgYtg6PZEiAAfq0xZr5Jm0IWpalDVnlozN5UnqzpX2l4iHHHG0zEqeXnqnB1FaVykB7byCIoQksy8KulcnlMqA2N+jo5fAXZsn2fTwjFRVRpwYIC0U+HTTSiDbz5UzBp4l/rBpaVkJQGFKirY5jR2AwjPldbAofOJDQNm7dNVsEe/Piqpk00ltO2+xwWiritlBKdlL38qFJwyn9cRIudQ2qC2hWsWwZknUG+LvDPDy+sj+OhHvTniooPd8OyWwODESICWth1yfLccNgbH8NUnh24/ecNc2q+b1yjbsJLqY+A8/XYhJwnb+vo4yCCmDzR0f9xSrlw724VXhvJv8jJ3ih38Vy0EIy6wWI5nBPBGj7o7GbZPK9bTkDIKdAws57utqhQ7zbzefyv3YWHyCwRewI2hWlAQbr7Tcm6iaTJlwd2yaNfAgzF+9ni0LF5QHnmFdGOzWsYyAp3h5f/LxUk991cOjdvd0rBVs1kegELwf8qku2ZTecoY+exz1vplC434ffgC2Zr1RU2xSSvk0BZ0PuYQx48Yba/8mgVqUAPdHGqtKZHkCx+8C0Bq+AfrWysGd4E9u/kCjmjI6IG5xd0UNqY+KXGepyoRtzd4DsksUdFdyQq65CyYmFPJhO/rQjFNTVf24UFyFwpcGJsuEU0QP59Se5OXzhE2qazR+kP+9D0mBJ7iyibqFILrjrFuL4etQ9eWB76AW797rlbWocbJ4ChME/ZPstd309Ng6jB4xJHBpiCqZ/bQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(2906002)(41300700001)(356005)(2616005)(54906003)(110136005)(70586007)(6636002)(316002)(81166007)(82740400003)(70206006)(7696005)(478600001)(6666004)(426003)(40480700001)(47076005)(83380400001)(336012)(4326008)(40460700003)(44832011)(5660300002)(86362001)(15650500001)(36756003)(8936002)(8676002)(36860700001)(26005)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 02:33:38.0118 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9be562-1526-4e89-23d9-08dbd439a0e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323
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
Cc: Alexander.Deucher@amd.com, amd-gfx@lists.freedesktop.org,
 kevinyang.wang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The smu needs to get the rlc power down message to sync the rlc state
with smu, the rlc state updating message need to be sent at while smu
begin suspend sequence , otherwise SMU will crash while RLC state is not
notified by driver, and rlc state probally changed after that
notification, so it needs to notify rlc state to smu at the end of the
suspend sequence in amdgpu_device_suspend() that can make sure the rlc
state  is correctly set to SMU.

[  101.000590] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x0000001E SMN_C2PMSG_82:0x00000000
[  101.000598] amdgpu 0000:03:00.0: amdgpu: Failed to disable gfxoff!
[  110.838026] amdgpu 0000:03:00.0: amdgpu: SMU: I'm not done with your previous command: SMN_C2PMSG_66:0x0000001E SMN_C2PMSG_82:0x00000000
[  110.838035] amdgpu 0000:03:00.0: amdgpu: Failed to disable smu features.
[  110.838039] amdgpu 0000:03:00.0: amdgpu: Fail to disable dpm features!
[  110.838040] [drm:amdgpu_device_ip_suspend_phase2 [amdgpu]] *ERROR* suspend of IP block <smu> failed -62
[  110.884394] PM: suspend of devices aborted after 21213.620 msecs
[  110.884402] PM: start suspend of devices aborted after 21213.882 msecs
[  110.884405] PM: Some devices failed to suspend, or early wake event detected

Signed-off-by: Perry Yuan <perry.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c     |  4 ++++
 drivers/gpu/drm/amd/include/kgd_pp_interface.h |  1 +
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c            | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h        |  2 ++
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c      | 10 ++++++++++
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h  |  5 +++++
 .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c   |  5 ++---
 drivers/gpu/drm/amd/pm/swsmu/smu_internal.h    |  1 +
 8 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index cc047fe0b7ee..be08ffc69231 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4428,6 +4428,10 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
 	if (amdgpu_sriov_vf(adev))
 		amdgpu_virt_release_full_gpu(adev, false);
 
+	r = amdgpu_dpm_notify_rlc_state(adev, false);
+	if (r)
+		return r;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
index 3201808c2dd8..4eacfdfcfd4b 100644
--- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
+++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
@@ -444,6 +444,7 @@ struct amd_pm_funcs {
 				   struct dpm_clocks *clock_table);
 	int (*get_smu_prv_buf_details)(void *handle, void **addr, size_t *size);
 	void (*pm_compute_clocks)(void *handle);
+	int (*notify_rlc_state)(void *handle, bool en);
 };
 
 struct metrics_table_header {
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index acf3527fff2d..ed7237bb64c8 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -181,6 +181,24 @@ int amdgpu_dpm_set_mp1_state(struct amdgpu_device *adev,
 	return ret;
 }
 
+int amdgpu_dpm_notify_rlc_state(struct amdgpu_device *adev, bool en)
+{
+	int ret = 0;
+	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
+
+	if (pp_funcs && pp_funcs->notify_rlc_state) {
+		mutex_lock(&adev->pm.mutex);
+
+		ret = pp_funcs->notify_rlc_state(
+				adev->powerplay.pp_handle,
+				en);
+
+		mutex_unlock(&adev->pm.mutex);
+	}
+
+	return ret;
+}
+
 bool amdgpu_dpm_is_baco_supported(struct amdgpu_device *adev)
 {
 	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
index feccd2a7120d..482ea30147ab 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
@@ -415,6 +415,8 @@ int amdgpu_dpm_mode1_reset(struct amdgpu_device *adev);
 int amdgpu_dpm_set_mp1_state(struct amdgpu_device *adev,
 			     enum pp_mp1_state mp1_state);
 
+int amdgpu_dpm_notify_rlc_state(struct amdgpu_device *adev, bool en);
+
 int amdgpu_dpm_set_gfx_power_up_by_imu(struct amdgpu_device *adev);
 
 int amdgpu_dpm_baco_exit(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index a0b8d5d78beb..a8fb914f746b 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1710,6 +1710,16 @@ static int smu_disable_dpms(struct smu_context *smu)
 		}
 	}
 
+	/* Notify SMU RLC is going to be off, stop RLC and SMU interaction.
+	 * otherwise SMU will hang while interacting with RLC if RLC is halted
+	 * this is a WA for Vangogh asic which fix the SMU hang issue.
+	 */
+	ret = smu_notify_rlc_state(smu, false);
+	if (ret) {
+		dev_err(adev->dev, "Fail to notify rlc status!\n");
+		return ret;
+	}
+
 	if (amdgpu_ip_version(adev, GC_HWIP, 0) >= IP_VERSION(9, 4, 2) &&
 	    !amdgpu_sriov_vf(adev) && adev->gfx.rlc.funcs->stop)
 		adev->gfx.rlc.funcs->stop(adev);
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 839553a86aa2..7778a98f192c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -1359,6 +1359,11 @@ struct pptable_funcs {
 	 *                       management.
 	 */
 	int (*dpm_set_umsch_mm_enable)(struct smu_context *smu, bool enable);
+
+	/**
+	 * @notify_rlc_state: Notify RLC power state to SMU.
+	 */
+	int (*notify_rlc_state)(struct smu_context *smu, bool en);
 };
 
 typedef enum {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
index 3efc6aed28f1..b42771471416 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
@@ -2202,8 +2202,7 @@ static int vangogh_get_dpm_clock_table(struct smu_context *smu, struct dpm_clock
 	return 0;
 }
 
-
-static int vangogh_system_features_control(struct smu_context *smu, bool en)
+static int vangogh_notify_rlc_state(struct smu_context *smu, bool en)
 {
 	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
@@ -2532,7 +2531,7 @@ static const struct pptable_funcs vangogh_ppt_funcs = {
 	.print_clk_levels = vangogh_common_print_clk_levels,
 	.set_default_dpm_table = vangogh_set_default_dpm_tables,
 	.set_fine_grain_gfx_freq_parameters = vangogh_set_fine_grain_gfx_freq_parameters,
-	.system_features_control = vangogh_system_features_control,
+	.notify_rlc_state = vangogh_notify_rlc_state,
 	.feature_is_enabled = smu_cmn_feature_is_enabled,
 	.set_power_profile_mode = vangogh_set_power_profile_mode,
 	.get_power_profile_mode = vangogh_get_power_profile_mode,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
index 80b3c3efc006..64766ac69c53 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
@@ -97,6 +97,7 @@
 #define smu_get_default_config_table_settings(smu, config_table)	smu_ppt_funcs(get_default_config_table_settings, -EOPNOTSUPP, smu, config_table)
 #define smu_set_config_table(smu, config_table)				smu_ppt_funcs(set_config_table, -EOPNOTSUPP, smu, config_table)
 #define smu_init_pptable_microcode(smu)					smu_ppt_funcs(init_pptable_microcode, 0, smu)
+#define smu_notify_rlc_state(smu, en)					smu_ppt_funcs(notify_rlc_state, 0, smu, en)
 
 #endif
 #endif
-- 
2.34.1

