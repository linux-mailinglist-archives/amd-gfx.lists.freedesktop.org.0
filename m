Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41A413996
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Sep 2021 20:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686676EA67;
	Tue, 21 Sep 2021 18:07:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2791D6EA37
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Sep 2021 18:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ51BeJdIral+O7g4O119GSbBbLUgo7U0ii4jV/9cshfvK57dojrXHUtV0Wu87DQrMea4Yi4KjxjB/AH/cQEMv9Ksfk0tKC34EEnFD8I4m+SajJ1tH9wSh5BWGWBh9feMj8kDvbNnoeBiF5zQenSvl8K8fo/OPU1qo2ZLfvcbXQbADy7kUuOZKNg6Bn9U4yCSUmK3HOfL8ldLXxq0NvPCgjXpTburNgn5jGTyecBZ6dq9gZe/1FcD8GGN3OBVcxcyPLRigMBJKSkZEPI72KITPxIcAMLmDfsSl/jK4mKK1GR6hzDIlGaQMP431HHxT6LdqgLxaHsc9ZgQuekGEvSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1Ly1ZxX3as5W0ZCPyzj0HYbDwND2XWHvj0zgB0h0FjQ=;
 b=EUJ/jFLyE3nOj3Dzkg7A7iEYTEtEbVkZLAU3ZYiadisEXAdrN9h49C2Il35TelaSjhVxfdDA3UL+0hCKz4cxBxnceg3IAOQldVP+XDFZk5diuhw9WkK5MrkkF/2Gt3eGBIZd5+ec7JtMXrG4Q7CD5q2O8m17nOUN2RmrTzMHIfRTsUs/ujan+H6slHJ5TjehWIxiTvL1PdKG4Wk3ME++GWVEi/zZLqy+hzV5+bZY4AqZidwY++AhB4liKVrTXGRW0yuCvs5izv2H4AewurfjUDNHxbzwiewYcpzgNXkon7lnMZTtiiaZnEQZQ8WFlpMs71giAE+yghF3kk6QYhvqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Ly1ZxX3as5W0ZCPyzj0HYbDwND2XWHvj0zgB0h0FjQ=;
 b=XnJ1wRUMYEXiuVOitEtOncnJqsST+03LNCSFVjZgQdsZsXk3UpfG05HIV40d51A5eW3UEi0xVAB54uu78wrC3VvWMC3dpJK3rl6Rv4TVtEyROI815lMz5TyWFXQPf1w4vKtZ9wnpb3+Nf9FT97lasH5RIS4vQqTa/zyqmIDpFIo=
Received: from DM5PR11CA0014.namprd11.prod.outlook.com (2603:10b6:3:115::24)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 18:07:45 +0000
Received: from DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::cd) by DM5PR11CA0014.outlook.office365.com
 (2603:10b6:3:115::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 18:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT005.mail.protection.outlook.com (10.13.172.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 18:07:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 21 Sep
 2021 13:07:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 10/66] drm/amdgpu/gfx10: convert to IP version checking
Date: Tue, 21 Sep 2021 14:06:29 -0400
Message-ID: <20210921180725.1985552-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210921180725.1985552-1-alexander.deucher@amd.com>
References: <20210921180725.1985552-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfb55f48-4503-453a-15e4-08d97d2ab69b
X-MS-TrafficTypeDiagnostic: DM4PR12MB5182:
X-Microsoft-Antispam-PRVS: <DM4PR12MB51829B63C736DEA4629468BBF7A19@DM4PR12MB5182.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:189;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LXDB1SDLPXit7WFYynDkdM1rPyolFNUrRbtKrznXcQupDRaw9hrT8xm0br+yQdQlqqMeP2v0xCS60i2gc/MJLOFuKihfTwQnNh/CVmY6iMjjkqLD0WxKjONK08GVugNd7/igac/GGo/h5LBeSQcO4uJvs6UeSD3EE8bfZqRbkqvf9niq9rv+QFRjhZNJvPv6A+iIkupt7P5MmGeRJPipufNJe59pHjNFV1Yugz+rJzulH3fVOmc86TKFpRwgK/8xeCqpKMDbdohUAjsSWswLXE4bCi2wm2hOaLnBzy+YyjWtbEfxEPdSt+59D5sU9r/xGSTCmsV2i5LAOTou4Bvn6Doylmim2NtE1ictO7sedWpe4mqJ6l2gJGQZKddzQJY2mDBd3rs2LxleZAaC2sMO331sECnqEVmuvfwg48mjMSvmaMQOpxFRsF/vguaww6v+ZIfRDq1/lbd7m8Qh5KgAuqOYaBS117O8BeFAGyhNyR8Bd3noedsaEQW6UFkjryoMoiY3Hb21NPs58ioiLGRzwvSe3Gl/iGa5Oh4ZJF3qn0eLehWz4EdH3pL627qOPSzfybVv6z0J+9qQcCiJS3n17G859oOjp4Pj/FB/pYue6iHrOhEZ8332YuIL0AsYBDCErhSpC9D/q24fJ5DJPWPoVLq9a+eVb49F+WoOFUbG8G/punZEGDXp5uAPzzdfthD64CXbeJX8U5CGhx/h6RHzwgjZB587pfLsgSGb0oObXXs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(316002)(83380400001)(6666004)(4326008)(2616005)(508600001)(356005)(426003)(47076005)(336012)(82310400003)(36860700001)(70206006)(8676002)(70586007)(26005)(16526019)(186003)(2906002)(8936002)(86362001)(7696005)(1076003)(5660300002)(36756003)(81166007)(30864003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 18:07:45.4561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb55f48-4503-453a-15e4-08d97d2ab69b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use IP versions rather than asic_type to differentiate
IP version specific features.

v2: rebase,  squash in navi10 fixes (Alex)

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 380 ++++++++++++-------------
 1 file changed, 190 insertions(+), 190 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 16dbe593cba2..4c632306ed70 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -1537,7 +1537,7 @@ static u32 gfx_v10_rlcg_rw(struct amdgpu_device *adev, u32 offset, u32 v, uint32
 	scratch_reg3 = adev->rmmio +
 		       (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG3) * 4;
 
-	if (adev->asic_type >= CHIP_SIENNA_CICHLID) {
+	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
 		spare_int = adev->rmmio +
 			    (adev->reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_0_Sienna_Cichlid_BASE_IDX]
 			     + mmRLC_SPARE_INT_0_Sienna_Cichlid) * 4;
@@ -3727,18 +3727,18 @@ static void gfx_v10_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
 
 static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_rlc_spm_10_0_nv10,
 						(const u32)ARRAY_SIZE(golden_settings_gc_rlc_spm_10_0_nv10));
 		break;
-	case CHIP_NAVI14:
+	case IP_VERSION(10, 1, 1):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_rlc_spm_10_1_nv14,
 						(const u32)ARRAY_SIZE(golden_settings_gc_rlc_spm_10_1_nv14));
 		break;
-	case CHIP_NAVI12:
+	case IP_VERSION(10, 1, 2):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_rlc_spm_10_1_2_nv12,
 						(const u32)ARRAY_SIZE(golden_settings_gc_rlc_spm_10_1_2_nv12));
@@ -3750,8 +3750,8 @@ static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
 
 static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 {
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_1,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_1));
@@ -3759,7 +3759,7 @@ static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 						golden_settings_gc_10_0_nv10,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_0_nv10));
 		break;
-	case CHIP_NAVI14:
+	case IP_VERSION(10, 1, 1):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_1_1,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_1_1));
@@ -3767,7 +3767,7 @@ static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 						golden_settings_gc_10_1_nv14,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_1_nv14));
 		break;
-	case CHIP_NAVI12:
+	case IP_VERSION(10, 1, 2):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_1_2,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_1_2));
@@ -3775,7 +3775,7 @@ static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 						golden_settings_gc_10_1_2_nv12,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_1_2_nv12));
 		break;
-	case CHIP_SIENNA_CICHLID:
+	case IP_VERSION(10, 3, 0):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_3,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3));
@@ -3783,32 +3783,32 @@ static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
 						golden_settings_gc_10_3_sienna_cichlid,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_sienna_cichlid));
 		break;
-	case CHIP_NAVY_FLOUNDER:
+	case IP_VERSION(10, 3, 2):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_3_2,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_2));
 		break;
-	case CHIP_VANGOGH:
+	case IP_VERSION(10, 3, 1):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_3_vangogh,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_vangogh));
 		break;
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 3):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_3_3,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_3));
 		break;
-	case CHIP_DIMGREY_CAVEFISH:
+	case IP_VERSION(10, 3, 4):
 		soc15_program_register_sequence(adev,
                                                 golden_settings_gc_10_3_4,
                                                 (const u32)ARRAY_SIZE(golden_settings_gc_10_3_4));
 		break;
-	case CHIP_BEIGE_GOBY:
+	case IP_VERSION(10, 3, 5):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_3_5,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_3_5));
 		break;
-	case CHIP_CYAN_SKILLFISH:
+	case IP_VERSION(10, 1, 3):
 		soc15_program_register_sequence(adev,
 						golden_settings_gc_10_0,
 						(const u32)ARRAY_SIZE(golden_settings_gc_10_0));
@@ -3985,11 +3985,11 @@ static void gfx_v10_0_check_fw_write_wait(struct amdgpu_device *adev)
 {
 	adev->gfx.cp_fw_write_wait = false;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI12:
-	case CHIP_NAVI14:
-	case CHIP_CYAN_SKILLFISH:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 3):
 		if ((adev->gfx.me_fw_version >= 0x00000046) &&
 		    (adev->gfx.me_feature_version >= 27) &&
 		    (adev->gfx.pfp_fw_version >= 0x00000068) &&
@@ -3998,12 +3998,12 @@ static void gfx_v10_0_check_fw_write_wait(struct amdgpu_device *adev)
 		    (adev->gfx.mec_feature_version >= 27))
 			adev->gfx.cp_fw_write_wait = true;
 		break;
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		adev->gfx.cp_fw_write_wait = true;
 		break;
 	default:
@@ -4066,8 +4066,8 @@ static bool gfx_v10_0_navi10_gfxoff_should_enable(struct amdgpu_device *adev)
 
 static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
 {
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
 		if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
 			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
 		break;
@@ -4093,38 +4093,38 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
 
 	DRM_DEBUG("\n");
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
 		chip_name = "navi10";
 		break;
-	case CHIP_NAVI14:
+	case IP_VERSION(10, 1, 1):
 		chip_name = "navi14";
 		if (!(adev->pdev->device == 0x7340 &&
 		      adev->pdev->revision != 0x00))
 			wks = "_wks";
 		break;
-	case CHIP_NAVI12:
+	case IP_VERSION(10, 1, 2):
 		chip_name = "navi12";
 		break;
-	case CHIP_SIENNA_CICHLID:
+	case IP_VERSION(10, 3, 0):
 		chip_name = "sienna_cichlid";
 		break;
-	case CHIP_NAVY_FLOUNDER:
+	case IP_VERSION(10, 3, 2):
 		chip_name = "navy_flounder";
 		break;
-	case CHIP_VANGOGH:
+	case IP_VERSION(10, 3, 1):
 		chip_name = "vangogh";
 		break;
-	case CHIP_DIMGREY_CAVEFISH:
+	case IP_VERSION(10, 3, 4):
 		chip_name = "dimgrey_cavefish";
 		break;
-	case CHIP_BEIGE_GOBY:
+	case IP_VERSION(10, 3, 5):
 		chip_name = "beige_goby";
 		break;
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 3):
 		chip_name = "yellow_carp";
 		break;
-	case CHIP_CYAN_SKILLFISH:
+	case IP_VERSION(10, 1, 3):
 		if (adev->apu_flags & AMD_APU_IS_CYAN_SKILLFISH2)
 			chip_name = "cyan_skillfish2";
 		else
@@ -4684,10 +4684,10 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 
 	adev->gfx.funcs = &gfx_v10_0_gfx_funcs;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVI12:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 2):
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
 		adev->gfx.config.sc_prim_fifo_size_backend = 0x100;
@@ -4695,12 +4695,12 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 		adev->gfx.config.sc_earlyz_tile_fifo_size = 0x4C0;
 		gb_addr_config = RREG32_SOC15(GC, 0, mmGB_ADDR_CONFIG);
 		break;
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
 		adev->gfx.config.sc_prim_fifo_size_backend = 0x100;
@@ -4710,7 +4710,7 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
 		adev->gfx.config.gb_addr_config_fields.num_pkrs =
 			1 << REG_GET_FIELD(gb_addr_config, GB_ADDR_CONFIG, NUM_PKRS);
 		break;
-	case CHIP_CYAN_SKILLFISH:
+	case IP_VERSION(10, 1, 3):
 		adev->gfx.config.max_hw_contexts = 8;
 		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
 		adev->gfx.config.sc_prim_fifo_size_backend = 0x100;
@@ -4818,11 +4818,11 @@ static int gfx_v10_0_sw_init(void *handle)
 	struct amdgpu_kiq *kiq;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVI12:
-	case CHIP_CYAN_SKILLFISH:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 1, 3):
 		adev->gfx.me.num_me = 1;
 		adev->gfx.me.num_pipe_per_me = 1;
 		adev->gfx.me.num_queue_per_pipe = 1;
@@ -4830,12 +4830,12 @@ static int gfx_v10_0_sw_init(void *handle)
 		adev->gfx.mec.num_pipe_per_mec = 4;
 		adev->gfx.mec.num_queue_per_pipe = 8;
 		break;
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		adev->gfx.me.num_me = 1;
 		adev->gfx.me.num_pipe_per_me = 1;
 		adev->gfx.me.num_queue_per_pipe = 1;
@@ -5068,8 +5068,8 @@ static void gfx_v10_0_setup_rb(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
 		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
 			bitmap = i * adev->gfx.config.max_sh_per_se + j;
-			if (((adev->asic_type == CHIP_SIENNA_CICHLID) ||
-				(adev->asic_type == CHIP_YELLOW_CARP)) &&
+			if (((adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0)) ||
+				(adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 3))) &&
 			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
 				continue;
 			gfx_v10_0_select_se_sh(adev, i, j, 0xffffffff);
@@ -5096,7 +5096,7 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
 
 	/* for ASICs that integrates GFX v10.3
 	 * pa_sc_tile_steering_override should be set to 0 */
-	if (adev->asic_type >= CHIP_SIENNA_CICHLID)
+	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
 		return 0;
 
 	/* init num_sc */
@@ -5249,7 +5249,7 @@ static void gfx_v10_0_get_tcc_info(struct amdgpu_device *adev)
 	/* TCCs are global (not instanced). */
 	uint32_t tcc_disable;
 
-	if (adev->asic_type >= CHIP_SIENNA_CICHLID) {
+	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
 		tcc_disable = RREG32_SOC15(GC, 0, mmCGTS_TCC_DISABLE_gc_10_3) |
 			      RREG32_SOC15(GC, 0, mmCGTS_USER_TCC_DISABLE_gc_10_3);
 	} else {
@@ -5326,7 +5326,7 @@ static int gfx_v10_0_init_csb(struct amdgpu_device *adev)
 	adev->gfx.rlc.funcs->get_csb_buffer(adev, adev->gfx.rlc.cs_ptr);
 
 	/* csib */
-	if (adev->asic_type == CHIP_NAVI12) {
+	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
 		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_HI,
 				adev->gfx.rlc.clear_state_gpu_addr >> 32);
 		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_LO,
@@ -5948,7 +5948,7 @@ static int gfx_v10_0_cp_gfx_enable(struct amdgpu_device *adev, bool enable)
 	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, PFP_HALT, enable ? 0 : 1);
 	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, CE_HALT, enable ? 0 : 1);
 
-	if (adev->asic_type == CHIP_NAVI12) {
+	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
 		WREG32_SOC15_RLC(GC, 0, mmCP_ME_CNTL, tmp);
 	} else {
 		WREG32_SOC15(GC, 0, mmCP_ME_CNTL, tmp);
@@ -6337,13 +6337,13 @@ static void gfx_v10_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
 		}
 		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_CONTROL, tmp);
 	}
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		tmp = REG_SET_FIELD(0, CP_RB_DOORBELL_RANGE_LOWER,
 				    DOORBELL_RANGE_LOWER_Sienna_Cichlid, ring->doorbell_index);
 		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_RANGE_LOWER, tmp);
@@ -6474,13 +6474,13 @@ static int gfx_v10_0_cp_gfx_resume(struct amdgpu_device *adev)
 static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 {
 	if (enable) {
-		switch (adev->asic_type) {
-		case CHIP_SIENNA_CICHLID:
-		case CHIP_NAVY_FLOUNDER:
-		case CHIP_VANGOGH:
-		case CHIP_DIMGREY_CAVEFISH:
-		case CHIP_BEIGE_GOBY:
-		case CHIP_YELLOW_CARP:
+		switch (adev->ip_versions[GC_HWIP]) {
+		case IP_VERSION(10, 3, 0):
+		case IP_VERSION(10, 3, 2):
+		case IP_VERSION(10, 3, 1):
+		case IP_VERSION(10, 3, 4):
+		case IP_VERSION(10, 3, 5):
+		case IP_VERSION(10, 3, 3):
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid, 0);
 			break;
 		default:
@@ -6488,13 +6488,13 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 			break;
 		}
 	} else {
-		switch (adev->asic_type) {
-		case CHIP_SIENNA_CICHLID:
-		case CHIP_NAVY_FLOUNDER:
-		case CHIP_VANGOGH:
-		case CHIP_DIMGREY_CAVEFISH:
-		case CHIP_BEIGE_GOBY:
-		case CHIP_YELLOW_CARP:
+		switch (adev->ip_versions[GC_HWIP]) {
+		case IP_VERSION(10, 3, 0):
+		case IP_VERSION(10, 3, 2):
+		case IP_VERSION(10, 3, 1):
+		case IP_VERSION(10, 3, 4):
+		case IP_VERSION(10, 3, 5):
+		case IP_VERSION(10, 3, 3):
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid,
 				     (CP_MEC_CNTL__MEC_ME1_HALT_MASK |
 				      CP_MEC_CNTL__MEC_ME2_HALT_MASK));
@@ -6586,13 +6586,13 @@ static void gfx_v10_0_kiq_setting(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 
 	/* tell RLC which is KIQ queue */
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
 		tmp &= 0xffffff00;
 		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
@@ -7303,11 +7303,11 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
 
 	/* check if mmVGT_ESGS_RING_SIZE_UMD
 	 * has been remapped to mmVGT_ESGS_RING_SIZE */
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
 		data = RREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_Sienna_Cichlid);
 		WREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_Sienna_Cichlid, 0);
 		WREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_UMD, pattern);
@@ -7320,8 +7320,8 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
 			return false;
 		}
 		break;
-	case CHIP_VANGOGH:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 3):
 		return true;
 	default:
 		data = RREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE);
@@ -7350,13 +7350,13 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
 	 * index will auto-inc after each data writting */
 	WREG32_SOC15(GC, 0, mmGRBM_CAM_INDEX, 0);
 
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		/* mmVGT_TF_RING_SIZE_UMD -> mmVGT_TF_RING_SIZE */
 		data = (SOC15_REG_OFFSET(GC, 0, mmVGT_TF_RING_SIZE_UMD) <<
 			GRBM_CAM_DATA__CAM_ADDR__SHIFT) |
@@ -7520,19 +7520,19 @@ static int gfx_v10_0_hw_init(void *handle)
 	 * init golden registers and rlc resume may override some registers,
 	 * reconfig them here
 	 */
-	if (adev->asic_type == CHIP_NAVI10 ||
-	    adev->asic_type == CHIP_NAVI14 ||
-	    adev->asic_type == CHIP_NAVI12)
+	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 10) ||
+	    adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 1) ||
+	    adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2))
 		gfx_v10_0_tcp_harvest(adev);
 
 	r = gfx_v10_0_cp_resume(adev);
 	if (r)
 		return r;
 
-	if (adev->asic_type == CHIP_SIENNA_CICHLID)
+	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0))
 		gfx_v10_3_program_pbb_mode(adev);
 
-	if (adev->asic_type >= CHIP_SIENNA_CICHLID)
+	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
 		gfx_v10_3_set_power_brake_sequence(adev);
 
 	return r;
@@ -7584,7 +7584,7 @@ static int gfx_v10_0_hw_fini(void *handle)
 	if (amdgpu_sriov_vf(adev)) {
 		gfx_v10_0_cp_gfx_enable(adev, false);
 		/* Program KIQ position of RLC_CP_SCHEDULERS during destroy */
-		if (adev->asic_type >= CHIP_SIENNA_CICHLID) {
+		if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
 			tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
 			tmp &= 0xffffff00;
 			WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
@@ -7670,13 +7670,13 @@ static int gfx_v10_0_soft_reset(void *handle)
 
 	/* GRBM_STATUS2 */
 	tmp = RREG32_SOC15(GC, 0, mmGRBM_STATUS2);
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		if (REG_GET_FIELD(tmp, GRBM_STATUS2, RLC_BUSY_Sienna_Cichlid))
 			grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
 							GRBM_SOFT_RESET,
@@ -7726,9 +7726,9 @@ static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock, clock_lo, clock_hi, hi_check;
 
-	switch (adev->asic_type) {
-	case CHIP_VANGOGH:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 3):
 		clock = (uint64_t)RREG32_SOC15(SMUIO, 0, mmGOLDEN_TSC_COUNT_LOWER_Vangogh) |
 			((uint64_t)RREG32_SOC15(SMUIO, 0, mmGOLDEN_TSC_COUNT_UPPER_Vangogh) << 32ULL);
 		break;
@@ -7784,19 +7784,19 @@ static int gfx_v10_0_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVI12:
-	case CHIP_CYAN_SKILLFISH:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 1, 3):
 		adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_NV1X;
 		break;
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_Sienna_Cichlid;
 		break;
 	default:
@@ -7848,13 +7848,13 @@ static void gfx_v10_0_set_safe_mode(struct amdgpu_device *adev)
 	data = RLC_SAFE_MODE__CMD_MASK;
 	data |= (1 << RLC_SAFE_MODE__MESSAGE__SHIFT);
 
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 
 		/* wait for RLC_SAFE_MODE */
@@ -7884,13 +7884,13 @@ static void gfx_v10_0_unset_safe_mode(struct amdgpu_device *adev)
 	uint32_t data;
 
 	data = RLC_SAFE_MODE__CMD_MASK;
-	switch (adev->asic_type) {
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 		break;
 	default:
@@ -8193,7 +8193,7 @@ static void gfx_v10_0_apply_medium_grain_clock_gating_workaround(struct amdgpu_d
 		mmCGTS_SA1_QUAD1_SM_CTRL_REG
 	};
 
-	if (adev->asic_type == CHIP_NAVI12) {
+	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
 		for (i = 0; i < ARRAY_SIZE(tcp_ctrl_regs_nv12); i++) {
 			reg_idx = adev->reg_offset[GC_HWIP][0][mmCGTS_SA0_WGP00_CU0_TCP_CTRL_REG_BASE_IDX] +
 				  tcp_ctrl_regs_nv12[i];
@@ -8238,8 +8238,8 @@ static int gfx_v10_0_update_gfx_clock_gating(struct amdgpu_device *adev,
 		/* ===  CGCG + CGLS === */
 		gfx_v10_0_update_coarse_grain_clock_gating(adev, enable);
 
-		if ((adev->asic_type >= CHIP_NAVI10) &&
-		     (adev->asic_type <= CHIP_NAVI12))
+		if ((adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 1, 10)) &&
+		     (adev->ip_versions[GC_HWIP] <= IP_VERSION(10, 1, 2)))
 			gfx_v10_0_apply_medium_grain_clock_gating_workaround(adev);
 	} else {
 		/* CGCG/CGLS should be disabled before MGCG/MGLS
@@ -8335,12 +8335,12 @@ static void gfx_v10_cntl_power_gating(struct amdgpu_device *adev, bool enable)
 	 * Power/performance team will optimize it and might give a new value later.
 	 */
 	if (enable && (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
-		switch (adev->asic_type) {
-		case CHIP_VANGOGH:
+		switch (adev->ip_versions[GC_HWIP]) {
+		case IP_VERSION(10, 3, 1):
 			data = 0x4E20 & RLC_PG_DELAY_3__CGCG_ACTIVE_BEFORE_CGPG_MASK_Vangogh;
 			WREG32_SOC15(GC, 0, mmRLC_PG_DELAY_3, data);
 			break;
-		case CHIP_YELLOW_CARP:
+		case IP_VERSION(10, 3, 3):
 			data = 0x1388 & RLC_PG_DELAY_3__CGCG_ACTIVE_BEFORE_CGPG_MASK_Vangogh;
 			WREG32_SOC15(GC, 0, mmRLC_PG_DELAY_3, data);
 			break;
@@ -8399,18 +8399,18 @@ static int gfx_v10_0_set_powergating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVI12:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
 		amdgpu_gfx_off_ctrl(adev, enable);
 		break;
-	case CHIP_VANGOGH:
-	case CHIP_YELLOW_CARP:
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 3):
 		gfx_v10_cntl_pg(adev, enable);
 		amdgpu_gfx_off_ctrl(adev, enable);
 		break;
@@ -8428,16 +8428,16 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVI12:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 3, 0):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		gfx_v10_0_update_gfx_clock_gating(adev,
 						 state == AMD_CG_STATE_GATE);
 		break;
@@ -9541,19 +9541,19 @@ static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev)
 
 static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev)
 {
-	switch (adev->asic_type) {
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_VANGOGH:
-	case CHIP_DIMGREY_CAVEFISH:
-	case CHIP_BEIGE_GOBY:
-	case CHIP_YELLOW_CARP:
-	case CHIP_CYAN_SKILLFISH:
+	switch (adev->ip_versions[GC_HWIP]) {
+	case IP_VERSION(10, 1, 10):
+	case IP_VERSION(10, 1, 1):
+	case IP_VERSION(10, 1, 3):
+	case IP_VERSION(10, 3, 2):
+	case IP_VERSION(10, 3, 1):
+	case IP_VERSION(10, 3, 4):
+	case IP_VERSION(10, 3, 5):
+	case IP_VERSION(10, 3, 3):
 		adev->gfx.rlc.funcs = &gfx_v10_0_rlc_funcs;
 		break;
-	case CHIP_NAVI12:
-	case CHIP_SIENNA_CICHLID:
+	case IP_VERSION(10, 1, 2):
+	case IP_VERSION(10, 3, 0):
 		adev->gfx.rlc.funcs = &gfx_v10_0_rlc_funcs_sriov;
 		break;
 	default:
@@ -9641,8 +9641,8 @@ static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,
 	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
 		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
 			bitmap = i * adev->gfx.config.max_sh_per_se + j;
-			if (((adev->asic_type == CHIP_SIENNA_CICHLID) ||
-				(adev->asic_type == CHIP_YELLOW_CARP)) &&
+			if (((adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0)) ||
+				(adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 3))) &&
 			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
 				continue;
 			mask = 1;
-- 
2.31.1

