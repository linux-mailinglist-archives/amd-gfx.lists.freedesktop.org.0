Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E95513DB0
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Apr 2022 23:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339910EBA4;
	Thu, 28 Apr 2022 21:34:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167ED10EBA4
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Apr 2022 21:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFARIunadWg5uTAkg9yvRYhoAW3jywjOw60ip3O8STlsEpqhOtNQ4UO3bE0AFns9zQlCap+7AFjrUlCUKZOSogE6h/vqPX2OmL7CaHpdJETgKKiWil+SbfPTtDW2rs08x09ZZ4H0bOA96J36Vzi5BVnR5oaB9pHFL3Ayzm3OzzSWIEG5/jOoD666GiXxCxC5aZaCho78mv2Hp8ylhmefhFI8j2dn7xA0c8+bYHs3cQPs2ZDENk8l8qdGbBZ7olBWZu13PKoSm8dbWCP5yfFJJ06eoaDFDHLwAUbhpTeYvnP8e/GgUkeQ9kidpLfrkHasISDAYj2f6zKpE1dWChh8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DmcU2RYP1nNnH8qxE5TkRTiqUYMPJFQvXmFpLZ+F4A=;
 b=Tfot6IviJiOc6YBUpaazcJjGt3sgLRAyNjWrVAeaYQs8zkRyHpinEvs1r6gt9J/q0BcydyTN9qpp0bbsUK9xawUYtKE28l6X+YQ94gCRo8HD5hCdlt6wovg0DuQDHWi07dilJpDXksnmCVIoh5XU3+i2OVbrSqAJy7b65dZulXusx2WbWdF8tJG4N6wI8brSrDPkHl/y7J3VYgH1b9Ehi2vu5MlkeUFJevRjIQ4EgQ2iyCdQfYqc63TIaXV3qjtWRBVVKPL+KX8i7Cc6+pjgOJk+kJc1AUxmWy+yiYvUgZP5Y03mIBs3GKZydub3FRHwgsBOhYdzc4pkdSDg3kkLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DmcU2RYP1nNnH8qxE5TkRTiqUYMPJFQvXmFpLZ+F4A=;
 b=K4pYSgijmER3AteYkmmoR83P07we1tH6LLJ7gGmbkilypZbIUvnsEUijW4GKqaROPNWkNkbi1kdABm/+4MFtzZEjE5N6HP7mTbL/Uy4Nk0KkZnID5HPF/v5Qc/xRLDCPFXqqxeLT/0uyFCx0B/8uWxk0h95qGnm4uNPVxooAQi4=
Received: from MW4PR03CA0054.namprd03.prod.outlook.com (2603:10b6:303:8e::29)
 by CY4PR12MB1592.namprd12.prod.outlook.com (2603:10b6:910:d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 21:34:48 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8e:cafe::9) by MW4PR03CA0054.outlook.office365.com
 (2603:10b6:303:8e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Thu, 28 Apr 2022 21:34:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Thu, 28 Apr 2022 21:34:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 16:34:44 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/smu: Update SMU13 support for SMU 13.0.0
Date: Thu, 28 Apr 2022 17:34:25 -0400
Message-ID: <20220428213427.700543-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428213427.700543-1-alexander.deucher@amd.com>
References: <20220428213427.700543-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e25211-2142-4b75-7a43-08da295eebc3
X-MS-TrafficTypeDiagnostic: CY4PR12MB1592:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB15923E42B4A6CCC59DFC1C35F7FD9@CY4PR12MB1592.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1134CmHWXDU6nfq5ixQ6Kabl8CGxkMzD5XNhL21bo87kdp03E1tysu/tz/+qGgf1srTpB1kOaCg36/UxvSkN82xtzGa66FQpKz4yC3XLBC8nQFhFvqtAWc8fTwK3Rc1u1ZH44VfEQCvvM0B6WkLgt7QAKuXalK7+A5L3RGObq+s5SoHGCyUJ9gBAJYUL5ked5hagWziUA9zZhT1bxPzf9GltvbZrdp0a824oy6+/7+wpOiV0RnI1JUmBgCJgzXejdNXFC8pPobHz4W1O18MelKl+JipP0gWE/AITq8o+O8jkEUQvHPUbjlBuZtHNBtWlexSeBIQi/jXyof30+fSs2Tkt1plDoW10S2k7s2JMwxuZYi8syvse97B63NuuWClfblor45n4tC0sUzKLQpPbjXlgqzNHGp2uQ6XGOvuOrijMi8mfpkXMsCCvu/ZSi7dP9EXmdWZwCYGHgKrWPqi5MNNQuRcMfXgEzmVjZX7IczPi6Po+sGSZj1clnV4Jtx3ezyU0sWqJJrrfDK6q2bT6fQbnoOP5/aje/C8zxbMfWtX3LHdSc+BxbzE6dlNJ9qkhm+6cHdM8UIUIwHS2aU/7Ay0h6F9jTUEfo497zCZ5BldE6D6oGl4/7mlNxm8FDiXkubhKMJSkbZGD60S5QSvjXl6LaKggHhkrO6W5NqM4rCyChFYKrLksRmP7xQ8s1bofSM6vnLzS+RsA7PkdSx5emw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(86362001)(26005)(83380400001)(81166007)(5660300002)(36860700001)(8936002)(316002)(47076005)(426003)(336012)(6666004)(54906003)(16526019)(186003)(36756003)(2616005)(7696005)(1076003)(508600001)(82310400005)(2906002)(30864003)(15650500001)(6916009)(356005)(40460700003)(4326008)(70206006)(8676002)(70586007)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 21:34:48.3592 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e25211-2142-4b75-7a43-08da295eebc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1592
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

Modify the common smu13 code and add a new smu
13.0.0 ppt file to handle the smu 13.0.0 specific
configuration.

v2: squash in typo fix in profile name

Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c            |    1 +
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |    4 +
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |    6 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h  |    2 +
 drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |   29 +-
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile   |    2 +-
 .../drm/amd/pm/swsmu/smu13/aldebaran_ppt.h    |    8 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  321 +++-
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 1367 +++++++++++++++++
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h  |   28 +
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   11 +
 11 files changed, 1729 insertions(+), 50 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
 create mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index befc7a0f06b7..05f1ac355ba8 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -1994,6 +1994,7 @@ static int default_attr_update(struct amdgpu_device *adev, struct amdgpu_device_
 		case IP_VERSION(9, 4, 1):
 		case IP_VERSION(9, 4, 2):
 		case IP_VERSION(10, 3, 0):
+		case IP_VERSION(11, 0, 0):
 			*states = ATTR_STATE_SUPPORTED;
 			break;
 		default:
diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index 612d07762306..6c71106b12c3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -37,6 +37,7 @@
 #include "aldebaran_ppt.h"
 #include "yellow_carp_ppt.h"
 #include "cyan_skillfish_ppt.h"
+#include "smu_v13_0_0_ppt.h"
 #include "smu_v13_0_5_ppt.h"
 #include "amd_pcie.h"
 
@@ -565,6 +566,9 @@ static int smu_set_funcs(struct amdgpu_device *adev)
 		/* Enable pp_od_clk_voltage node */
 		smu->od_enabled = true;
 		break;
+	case IP_VERSION(13, 0, 0):
+		smu_v13_0_0_set_ppt_funcs(smu);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index 49d2c0eb014d..a6a7b6c33683 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@ -454,6 +454,7 @@ struct smu_umd_pstate_table {
 	struct pstates_clk_freq		uclk_pstate;
 	struct pstates_clk_freq		vclk_pstate;
 	struct pstates_clk_freq		dclk_pstate;
+	struct pstates_clk_freq		fclk_pstate;
 };
 
 struct cmn2asic_msg_mapping {
@@ -1327,6 +1328,8 @@ typedef enum {
 	METRICS_AVERAGE_UCLK,
 	METRICS_AVERAGE_VCLK,
 	METRICS_AVERAGE_DCLK,
+	METRICS_AVERAGE_VCLK1,
+	METRICS_AVERAGE_DCLK1,
 	METRICS_AVERAGE_GFXACTIVITY,
 	METRICS_AVERAGE_MEMACTIVITY,
 	METRICS_AVERAGE_VCNACTIVITY,
@@ -1345,6 +1348,9 @@ typedef enum {
 	METRICS_SS_DGPU_SHARE,
 	METRICS_UNIQUE_ID_UPPER32,
 	METRICS_UNIQUE_ID_LOWER32,
+	METRICS_PCIE_RATE,
+	METRICS_PCIE_WIDTH,
+	METRICS_CURR_FANPWM,
 } MetricsMember_t;
 
 enum smu_cmn2asic_mapping_type {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 9f6f306eeca0..3f40cd6e4165 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@ -366,6 +366,8 @@ enum smu_clk_type {
        __SMU_DUMMY_MAP(THM_CG),				\
        __SMU_DUMMY_MAP(CLK_CG),				\
        __SMU_DUMMY_MAP(DATA_CALCULATION),				\
+       __SMU_DUMMY_MAP(DPM_VCLK),			\
+       __SMU_DUMMY_MAP(DPM_DCLK),			\
 
 #undef __SMU_DUMMY_MAP
 #define __SMU_DUMMY_MAP(feature)	SMU_FEATURE_##feature##_BIT
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
index d0d5b9b2c65b..f55f701e4681 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
@@ -28,9 +28,10 @@
 #define SMU13_DRIVER_IF_VERSION_INV 0xFFFFFFFF
 #define SMU13_DRIVER_IF_VERSION_YELLOW_CARP 0x04
 #define SMU13_DRIVER_IF_VERSION_ALDE 0x08
+#define SMU13_DRIVER_IF_VERSION_SMU_V13_0_5 0x04
+#define SMU13_DRIVER_IF_VERSION_SMU_V13_0_0 0x27
 
 #define SMU13_MODE1_RESET_WAIT_TIME_IN_MS 500  //500ms
-#define SMU13_DRIVER_IF_VERSION_SMU_V13_0_5 0x04
 
 /* MP Apertures */
 #define MP0_Public			0x03800000
@@ -49,7 +50,7 @@
 #define SMU13_TOOL_SIZE			0x19000
 
 #define MAX_DPM_LEVELS 16
-#define MAX_PCIE_CONF 2
+#define MAX_PCIE_CONF 3
 
 #define CTF_OFFSET_EDGE			5
 #define CTF_OFFSET_HOTSPOT		5
@@ -73,12 +74,15 @@ struct smu_13_0_dpm_table {
 	uint32_t			min;        /* MHz */
 	uint32_t			max;        /* MHz */
 	uint32_t			count;
+	bool				is_fine_grained;
 	struct smu_13_0_dpm_clk_level	dpm_levels[MAX_DPM_LEVELS];
 };
 
 struct smu_13_0_pcie_table {
 	uint8_t  pcie_gen[MAX_PCIE_CONF];
 	uint8_t  pcie_lane[MAX_PCIE_CONF];
+	uint16_t clk_freq[MAX_PCIE_CONF];
+	uint32_t num_of_link_levels;
 };
 
 struct smu_13_0_dpm_tables {
@@ -192,8 +196,8 @@ int
 smu_v13_0_set_fan_control_mode(struct smu_context *smu,
 			       uint32_t mode);
 
-int
-smu_v13_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed);
+int smu_v13_0_set_fan_speed_pwm(struct smu_context *smu,
+				uint32_t speed);
 
 int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
 				uint32_t speed);
@@ -238,15 +242,6 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 int smu_v13_0_set_power_source(struct smu_context *smu,
 			       enum smu_power_src_type power_src);
 
-int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
-				    enum smu_clk_type clk_type,
-				    uint16_t level,
-				    uint32_t *value);
-
-int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *value);
-
 int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
 				   enum smu_clk_type clk_type,
 				   struct smu_13_0_dpm_table *single_dpm_table);
@@ -270,5 +265,13 @@ int smu_v13_0_gfx_ulv_control(struct smu_context *smu,
 int smu_v13_0_wait_for_event(struct smu_context *smu, enum smu_event_type event,
 			     uint64_t event_arg);
 
+int smu_v13_0_set_vcn_enable(struct smu_context *smu,
+			     bool enable);
+
+int smu_v13_0_set_jpeg_enable(struct smu_context *smu,
+			      bool enable);
+
+int smu_v13_0_init_pptable_microcode(struct smu_context *smu);
+
 #endif
 #endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 613cdd0d8e83..74e9614a26d3 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
-SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_5_ppt.o
+SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_5_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
index 33a85d57cf15..31e991bde3e5 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/aldebaran_ppt.h
@@ -28,7 +28,7 @@
 #define ALDEBARAN_UMD_PSTATE_MCLK_LEVEL           0x2
 
 #define MAX_DPM_NUMBER 16
-#define MAX_PCIE_CONF 2
+#define ALDEBARAN_MAX_PCIE_CONF 2
 
 struct aldebaran_dpm_level {
 	bool            enabled;
@@ -51,9 +51,9 @@ struct aldebaran_single_dpm_table {
 
 struct aldebaran_pcie_table {
 	uint16_t count;
-	uint8_t  pcie_gen[MAX_PCIE_CONF];
-	uint8_t  pcie_lane[MAX_PCIE_CONF];
-	uint32_t lclk[MAX_PCIE_CONF];
+	uint8_t  pcie_gen[ALDEBARAN_MAX_PCIE_CONF];
+	uint8_t  pcie_lane[ALDEBARAN_MAX_PCIE_CONF];
+	uint32_t lclk[ALDEBARAN_MAX_PCIE_CONF];
 };
 
 struct aldebaran_dpm_table {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 79541844ce5c..98c9fea836b9 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -57,6 +57,7 @@
 #undef pr_debug
 
 MODULE_FIRMWARE("amdgpu/aldebaran_smc.bin");
+MODULE_FIRMWARE("amdgpu/smu_13_0_0.bin");
 
 #define SMU13_VOLTAGE_SCALE 4
 
@@ -73,11 +74,15 @@ MODULE_FIRMWARE("amdgpu/aldebaran_smc.bin");
 static const int link_width[] = {0, 1, 2, 4, 8, 12, 16};
 static const int link_speed[] = {25, 50, 80, 160};
 
+static int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu, void **table, uint32_t *size,
+					       uint32_t pptable_id);
+
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
 	const char *chip_name;
 	char fw_name[30];
+	char ucode_prefix[30];
 	int err = 0;
 	const struct smc_firmware_header_v1_0 *hdr;
 	const struct common_firmware_header *header;
@@ -89,15 +94,14 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 
 	switch (adev->ip_versions[MP1_HWIP][0]) {
 	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran";
+		chip_name = "aldebaran_smc";
 		break;
 	default:
-		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
-			adev->ip_versions[MP1_HWIP][0]);
-		return -EINVAL;
+		amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
+		chip_name = ucode_prefix;
 	}
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
@@ -176,6 +180,62 @@ int smu_v13_0_load_microcode(struct smu_context *smu)
 	if (i == adev->usec_timeout)
 		return -ETIME;
 #endif
+
+	return 0;
+}
+
+int smu_v13_0_init_pptable_microcode(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	struct amdgpu_firmware_info *ucode = NULL;
+	uint32_t size = 0, pptable_id = 0;
+	int ret = 0;
+	void *table;
+
+	/* doesn't need to load smu firmware in IOV mode */
+	if (amdgpu_sriov_vf(adev))
+		return 0;
+
+	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
+		return 0;
+
+	if (!adev->scpm_enabled)
+		return 0;
+
+	/* override pptable_id from driver parameter */
+	if (amdgpu_smu_pptable_id >= 0) {
+		pptable_id = amdgpu_smu_pptable_id;
+		dev_info(adev->dev, "override pptable id %d\n", pptable_id);
+	} else {
+		pptable_id = smu->smu_table.boot_values.pp_table_id;
+
+		/*
+		 * Temporary solution for SMU V13.0.0:
+		 *   - use 99991 signed pptable when SCPM enabled
+		 * TODO: drop this when the pptable carried in vbios
+		 * is ready.
+		 */
+		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 0))
+			pptable_id = 99991;
+	}
+
+	/* "pptable_id == 0" means vbios carries the pptable. */
+	if (!pptable_id)
+		return 0;
+
+	ret = smu_v13_0_get_pptable_from_firmware(smu, &table, &size, pptable_id);
+	if (ret)
+		return ret;
+
+	smu->pptable_firmware.data = table;
+	smu->pptable_firmware.size = size;
+
+	ucode = &adev->firmware.ucode[AMDGPU_UCODE_ID_PPTABLE];
+	ucode->ucode_id = AMDGPU_UCODE_ID_PPTABLE;
+	ucode->fw = &smu->pptable_firmware;
+	adev->firmware.fw_size +=
+		ALIGN(smu->pptable_firmware.size, PAGE_SIZE);
+
 	return 0;
 }
 
@@ -216,6 +276,9 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
 	case IP_VERSION(13, 0, 2):
 		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_ALDE;
 		break;
+	case IP_VERSION(13, 0, 0):
+		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_SMU_V13_0_0;
+		break;
 	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
 	case IP_VERSION(13, 0, 8):
@@ -255,6 +318,21 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
 	return ret;
 }
 
+static int smu_v13_0_set_pptable_v2_0(struct smu_context *smu, void **table, uint32_t *size)
+{
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t ppt_offset_bytes;
+	const struct smc_firmware_header_v2_0 *v2;
+
+	v2 = (const struct smc_firmware_header_v2_0 *) adev->pm.fw->data;
+
+	ppt_offset_bytes = le32_to_cpu(v2->ppt_offset_bytes);
+	*size = le32_to_cpu(v2->ppt_size_bytes);
+	*table = (uint8_t *)v2 + ppt_offset_bytes;
+
+	return 0;
+}
+
 static int smu_v13_0_set_pptable_v2_1(struct smu_context *smu, void **table,
 				      uint32_t *size, uint32_t pptable_id)
 {
@@ -327,6 +405,9 @@ static int smu_v13_0_get_pptable_from_firmware(struct smu_context *smu, void **t
 	}
 
 	switch (version_minor) {
+	case 0:
+		ret = smu_v13_0_set_pptable_v2_0(smu, table, size);
+		break;
 	case 1:
 		ret = smu_v13_0_set_pptable_v2_1(smu, table, size, pptable_id);
 		break;
@@ -351,10 +432,19 @@ int smu_v13_0_setup_pptable(struct smu_context *smu)
 		dev_info(adev->dev, "override pptable id %d\n", pptable_id);
 	} else {
 		pptable_id = smu->smu_table.boot_values.pp_table_id;
+
+		/*
+		 * Temporary solution for SMU V13.0.0:
+		 *   - use 9999 unsigned pptable when SCPM disabled
+		 * TODO: drop this when the pptable carried in vbios
+		 * is ready.
+		 */
+		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 0))
+			pptable_id = 9999;
 	}
 
 	/* force using vbios pptable in sriov mode */
-	if (amdgpu_sriov_vf(adev) || !pptable_id)
+	if ((amdgpu_sriov_vf(adev) || !pptable_id) && (amdgpu_emu_mode != 1))
 		ret = smu_v13_0_get_pptable_from_vbios(smu, &table, &size);
 	else
 		ret = smu_v13_0_get_pptable_from_firmware(smu, &table, &size, pptable_id);
@@ -407,8 +497,17 @@ int smu_v13_0_init_smc_tables(struct smu_context *smu)
 		}
 	}
 
+	smu_table->combo_pptable =
+		kzalloc(tables[SMU_TABLE_COMBO_PPTABLE].size, GFP_KERNEL);
+	if (!smu_table->combo_pptable) {
+		ret = -ENOMEM;
+		goto err4_out;
+	}
+
 	return 0;
 
+err4_out:
+	kfree(smu_table->boot_overdrive_table);
 err3_out:
 	kfree(smu_table->overdrive_table);
 err2_out:
@@ -425,11 +524,13 @@ int smu_v13_0_fini_smc_tables(struct smu_context *smu)
 	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
 
 	kfree(smu_table->gpu_metrics_table);
+	kfree(smu_table->combo_pptable);
 	kfree(smu_table->boot_overdrive_table);
 	kfree(smu_table->overdrive_table);
 	kfree(smu_table->max_sustainable_clocks);
 	kfree(smu_table->driver_pptable);
 	smu_table->gpu_metrics_table = NULL;
+	smu_table->combo_pptable = NULL;
 	smu_table->boot_overdrive_table = NULL;
 	smu_table->overdrive_table = NULL;
 	smu_table->max_sustainable_clocks = NULL;
@@ -568,6 +669,7 @@ int smu_v13_0_get_vbios_bootup_values(struct smu_context *smu)
 					    smu_info);
 	if (!amdgpu_atombios_get_data_table(smu->adev, index, &size, &frev, &crev,
 					    (uint8_t **)&header)) {
+
 		if ((frev == 3) && (crev == 6)) {
 			smu_info_v3_6 = (struct atom_smu_info_v3_6 *)header;
 
@@ -688,7 +790,6 @@ int smu_v13_0_init_display_count(struct smu_context *smu, uint32_t count)
 	return ret;
 }
 
-
 int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 {
 	struct smu_feature *feature = &smu->smu_feature;
@@ -718,6 +819,7 @@ int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable)
 	struct amdgpu_device *adev = smu->adev;
 
 	switch (adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(13, 0, 0):
 	case IP_VERSION(13, 0, 1):
 	case IP_VERSION(13, 0, 3):
 	case IP_VERSION(13, 0, 5):
@@ -1050,15 +1152,14 @@ smu_v13_0_set_fan_static_mode(struct smu_context *smu, uint32_t mode)
 	return 0;
 }
 
-	int
-smu_v13_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
+int smu_v13_0_set_fan_speed_pwm(struct smu_context *smu,
+				uint32_t speed)
 {
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t duty100, duty;
 	uint64_t tmp64;
 
-	if (speed > 100)
-		speed = 100;
+	speed = MIN(speed, 255);
 
 	if (smu_v13_0_auto_fan_control(smu, 0))
 		return -EINVAL;
@@ -1069,7 +1170,7 @@ smu_v13_0_set_fan_speed_percent(struct smu_context *smu, uint32_t speed)
 		return -EINVAL;
 
 	tmp64 = (uint64_t)speed * duty100;
-	do_div(tmp64, 100);
+	do_div(tmp64, 255);
 	duty = (uint32_t)tmp64;
 
 	WREG32_SOC15(THM, 0, regCG_FDO_CTRL0,
@@ -1087,7 +1188,7 @@ smu_v13_0_set_fan_control_mode(struct smu_context *smu,
 
 	switch (mode) {
 	case AMD_FAN_CTRL_NONE:
-		ret = smu_v13_0_set_fan_speed_percent(smu, 100);
+		ret = smu_v13_0_set_fan_speed_pwm(smu, 255);
 		break;
 	case AMD_FAN_CTRL_MANUAL:
 		ret = smu_v13_0_auto_fan_control(smu, 0);
@@ -1111,8 +1212,8 @@ int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
 				uint32_t speed)
 {
 	struct amdgpu_device *adev = smu->adev;
-	int ret;
 	uint32_t tach_period, crystal_clock_freq;
+	int ret;
 
 	if (!speed)
 		return -EINVAL;
@@ -1128,9 +1229,7 @@ int smu_v13_0_set_fan_speed_rpm(struct smu_context *smu,
 				   CG_TACH_CTRL, TARGET_PERIOD,
 				   tach_period));
 
-	ret = smu_v13_0_set_fan_static_mode(smu, FDO_PWM_MODE_STATIC_RPM);
-
-	return ret;
+	return smu_v13_0_set_fan_static_mode(smu, FDO_PWM_MODE_STATIC_RPM);
 }
 
 int smu_v13_0_set_xgmi_pstate(struct smu_context *smu,
@@ -1462,7 +1561,16 @@ int smu_v13_0_get_dpm_ultimate_freq(struct smu_context *smu, enum smu_clk_type c
 	param = (clk_id & 0xffff) << 16;
 
 	if (max) {
-		ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_GetMaxDpmFreq, param, max);
+		if (smu->adev->pm.ac_power)
+			ret = smu_cmn_send_smc_msg_with_param(smu,
+							      SMU_MSG_GetMaxDpmFreq,
+							      param,
+							      max);
+		else
+			ret = smu_cmn_send_smc_msg_with_param(smu,
+							      SMU_MSG_GetDcModeMaxDpmFreq,
+							      param,
+							      max);
 		if (ret)
 			goto failed;
 	}
@@ -1564,24 +1672,39 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 		&dpm_context->dpm_tables.uclk_table;
 	struct smu_13_0_dpm_table *soc_table =
 		&dpm_context->dpm_tables.soc_table;
+	struct smu_13_0_dpm_table *vclk_table =
+		&dpm_context->dpm_tables.vclk_table;
+	struct smu_13_0_dpm_table *dclk_table =
+		&dpm_context->dpm_tables.dclk_table;
+	struct smu_13_0_dpm_table *fclk_table =
+		&dpm_context->dpm_tables.fclk_table;
 	struct smu_umd_pstate_table *pstate_table =
 		&smu->pstate_table;
 	struct amdgpu_device *adev = smu->adev;
 	uint32_t sclk_min = 0, sclk_max = 0;
 	uint32_t mclk_min = 0, mclk_max = 0;
 	uint32_t socclk_min = 0, socclk_max = 0;
-	int ret = 0;
+	uint32_t vclk_min = 0, vclk_max = 0;
+	uint32_t dclk_min = 0, dclk_max = 0;
+	uint32_t fclk_min = 0, fclk_max = 0;
+	int ret = 0, i;
 
 	switch (level) {
 	case AMD_DPM_FORCED_LEVEL_HIGH:
 		sclk_min = sclk_max = gfx_table->max;
 		mclk_min = mclk_max = mem_table->max;
 		socclk_min = socclk_max = soc_table->max;
+		vclk_min = vclk_max = vclk_table->max;
+		dclk_min = dclk_max = dclk_table->max;
+		fclk_min = fclk_max = fclk_table->max;
 		break;
 	case AMD_DPM_FORCED_LEVEL_LOW:
 		sclk_min = sclk_max = gfx_table->min;
 		mclk_min = mclk_max = mem_table->min;
 		socclk_min = socclk_max = soc_table->min;
+		vclk_min = vclk_max = vclk_table->min;
+		dclk_min = dclk_max = dclk_table->min;
+		fclk_min = fclk_max = fclk_table->min;
 		break;
 	case AMD_DPM_FORCED_LEVEL_AUTO:
 		sclk_min = gfx_table->min;
@@ -1590,11 +1713,20 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 		mclk_max = mem_table->max;
 		socclk_min = soc_table->min;
 		socclk_max = soc_table->max;
+		vclk_min = vclk_table->min;
+		vclk_max = vclk_table->max;
+		dclk_min = dclk_table->min;
+		dclk_max = dclk_table->max;
+		fclk_min = fclk_table->min;
+		fclk_max = fclk_table->max;
 		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
 		sclk_min = sclk_max = pstate_table->gfxclk_pstate.standard;
 		mclk_min = mclk_max = pstate_table->uclk_pstate.standard;
 		socclk_min = socclk_max = pstate_table->socclk_pstate.standard;
+		vclk_min = vclk_max = pstate_table->vclk_pstate.standard;
+		dclk_min = dclk_max = pstate_table->dclk_pstate.standard;
+		fclk_min = fclk_max = pstate_table->fclk_pstate.standard;
 		break;
 	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
 		sclk_min = sclk_max = pstate_table->gfxclk_pstate.min;
@@ -1606,6 +1738,9 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 		sclk_min = sclk_max = pstate_table->gfxclk_pstate.peak;
 		mclk_min = mclk_max = pstate_table->uclk_pstate.peak;
 		socclk_min = socclk_max = pstate_table->socclk_pstate.peak;
+		vclk_min = vclk_max = pstate_table->vclk_pstate.peak;
+		dclk_min = dclk_max = pstate_table->dclk_pstate.peak;
+		fclk_min = fclk_max = pstate_table->fclk_pstate.peak;
 		break;
 	case AMD_DPM_FORCED_LEVEL_MANUAL:
 	case AMD_DPM_FORCED_LEVEL_PROFILE_EXIT:
@@ -1615,8 +1750,17 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 		return -EINVAL;
 	}
 
-	mclk_min = mclk_max = 0;
-	socclk_min = socclk_max = 0;
+	/*
+	 * Unset those settings for SMU 13.0.2. As soft limits settings
+	 * for those clock domains are not supported.
+	 */
+	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2)) {
+		mclk_min = mclk_max = 0;
+		socclk_min = socclk_max = 0;
+		vclk_min = vclk_max = 0;
+		dclk_min = dclk_max = 0;
+		fclk_min = fclk_max = 0;
+	}
 
 	if (sclk_min && sclk_max) {
 		ret = smu_v13_0_set_soft_freq_limited_range(smu,
@@ -1654,6 +1798,48 @@ int smu_v13_0_set_performance_level(struct smu_context *smu,
 		pstate_table->socclk_pstate.curr.max = socclk_max;
 	}
 
+	if (vclk_min && vclk_max) {
+		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+			if (adev->vcn.harvest_config & (1 << i))
+				continue;
+			ret = smu_v13_0_set_soft_freq_limited_range(smu,
+								    i ? SMU_VCLK1 : SMU_VCLK,
+								    vclk_min,
+								    vclk_max);
+			if (ret)
+				return ret;
+		}
+		pstate_table->vclk_pstate.curr.min = vclk_min;
+		pstate_table->vclk_pstate.curr.max = vclk_max;
+	}
+
+	if (dclk_min && dclk_max) {
+		for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+			if (adev->vcn.harvest_config & (1 << i))
+				continue;
+			ret = smu_v13_0_set_soft_freq_limited_range(smu,
+								    i ? SMU_DCLK1 : SMU_DCLK,
+								    dclk_min,
+								    dclk_max);
+			if (ret)
+				return ret;
+		}
+		pstate_table->dclk_pstate.curr.min = dclk_min;
+		pstate_table->dclk_pstate.curr.max = dclk_max;
+	}
+
+	if (fclk_min && fclk_max) {
+		ret = smu_v13_0_set_soft_freq_limited_range(smu,
+							    SMU_FCLK,
+							    fclk_min,
+							    fclk_max);
+		if (ret)
+			return ret;
+
+		pstate_table->fclk_pstate.curr.min = fclk_min;
+		pstate_table->fclk_pstate.curr.max = fclk_max;
+	}
+
 	return ret;
 }
 
@@ -1674,10 +1860,10 @@ int smu_v13_0_set_power_source(struct smu_context *smu,
 					       NULL);
 }
 
-int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
-				    enum smu_clk_type clk_type,
-				    uint16_t level,
-				    uint32_t *value)
+static int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
+					   enum smu_clk_type clk_type,
+					   uint16_t level,
+					   uint32_t *value)
 {
 	int ret = 0, clk_id = 0;
 	uint32_t param;
@@ -1703,18 +1889,14 @@ int smu_v13_0_get_dpm_freq_by_index(struct smu_context *smu,
 	if (ret)
 		return ret;
 
-	/*
-	 * BIT31:  0 - Fine grained DPM, 1 - Dicrete DPM
-	 * now, we un-support it
-	 */
 	*value = *value & 0x7fffffff;
 
 	return ret;
 }
 
-int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
-				  enum smu_clk_type clk_type,
-				  uint32_t *value)
+static int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
+					 enum smu_clk_type clk_type,
+					 uint32_t *value)
 {
 	int ret;
 
@@ -1726,6 +1908,44 @@ int smu_v13_0_get_dpm_level_count(struct smu_context *smu,
 	return ret;
 }
 
+static int smu_v13_0_get_fine_grained_status(struct smu_context *smu,
+					     enum smu_clk_type clk_type,
+					     bool *is_fine_grained_dpm)
+{
+	int ret = 0, clk_id = 0;
+	uint32_t param;
+	uint32_t value;
+
+	if (!is_fine_grained_dpm)
+		return -EINVAL;
+
+	if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
+		return 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return clk_id;
+
+	param = (uint32_t)(((clk_id & 0xffff) << 16) | 0xff);
+
+	ret = smu_cmn_send_smc_msg_with_param(smu,
+					      SMU_MSG_GetDpmFreqByIndex,
+					      param,
+					      &value);
+	if (ret)
+		return ret;
+
+	/*
+	 * BIT31:  1 - Fine grained DPM, 0 - Dicrete DPM
+	 * now, we un-support it
+	 */
+	*is_fine_grained_dpm = value & 0x80000000;
+
+	return 0;
+}
+
 int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
 				   enum smu_clk_type clk_type,
 				   struct smu_13_0_dpm_table *single_dpm_table)
@@ -1742,6 +1962,16 @@ int smu_v13_0_set_single_dpm_table(struct smu_context *smu,
 		return ret;
 	}
 
+	if (smu->adev->ip_versions[MP1_HWIP][0] != IP_VERSION(13, 0, 2)) {
+		ret = smu_v13_0_get_fine_grained_status(smu,
+							clk_type,
+							&single_dpm_table->is_fine_grained);
+		if (ret) {
+			dev_err(smu->adev->dev, "[%s] failed to get fine grained status!\n", __func__);
+			return ret;
+		}
+	}
+
 	for (i = 0; i < single_dpm_table->count; i++) {
 		ret = smu_v13_0_get_dpm_freq_by_index(smu,
 						      clk_type,
@@ -1843,3 +2073,30 @@ int smu_v13_0_get_current_pcie_link_speed(struct smu_context *smu)
 	return link_speed[speed_level];
 }
 
+int smu_v13_0_set_vcn_enable(struct smu_context *smu,
+			     bool enable)
+{
+	struct amdgpu_device *adev = smu->adev;
+	int i, ret = 0;
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+
+		ret = smu_cmn_send_smc_msg_with_param(smu, enable ?
+						      SMU_MSG_PowerUpVcn : SMU_MSG_PowerDownVcn,
+						      i << 16U, NULL);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+int smu_v13_0_set_jpeg_enable(struct smu_context *smu,
+			      bool enable)
+{
+	return smu_cmn_send_smc_msg_with_param(smu, enable ?
+					       SMU_MSG_PowerUpJpeg : SMU_MSG_PowerDownJpeg,
+					       0, NULL);
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
new file mode 100644
index 000000000000..e9f52b1a92e7
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -0,0 +1,1367 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#define SWSMU_CODE_LAYER_L2
+
+#include <linux/firmware.h>
+#include <linux/pci.h>
+#include <linux/i2c.h>
+#include "amdgpu.h"
+#include "amdgpu_smu.h"
+#include "atomfirmware.h"
+#include "amdgpu_atomfirmware.h"
+#include "amdgpu_atombios.h"
+#include "smu_v13_0.h"
+#include "smu13_driver_if_v13_0_0.h"
+#include "soc15_common.h"
+#include "atom.h"
+#include "smu_v13_0_0_ppt.h"
+#include "smu_v13_0_0_pptable.h"
+#include "smu_v13_0_0_ppsmc.h"
+#include "nbio/nbio_4_3_0_offset.h"
+#include "nbio/nbio_4_3_0_sh_mask.h"
+#include "mp/mp_13_0_0_offset.h"
+#include "mp/mp_13_0_0_sh_mask.h"
+
+#include "asic_reg/mp/mp_13_0_0_sh_mask.h"
+#include "smu_cmn.h"
+#include "amdgpu_ras.h"
+
+/*
+ * DO NOT use these for err/warn/info/debug messages.
+ * Use dev_err, dev_warn, dev_info and dev_dbg instead.
+ * They are more MGPU friendly.
+ */
+#undef pr_err
+#undef pr_warn
+#undef pr_info
+#undef pr_debug
+
+#define to_amdgpu_device(x) (container_of(x, struct amdgpu_device, pm.smu_i2c))
+
+#define FEATURE_MASK(feature) (1ULL << feature)
+#define SMC_DPM_FEATURE ( \
+	FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT)     | \
+	FEATURE_MASK(FEATURE_DPM_UCLK_BIT)	 | \
+	FEATURE_MASK(FEATURE_DPM_LINK_BIT)       | \
+	FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT)     | \
+	FEATURE_MASK(FEATURE_DPM_FCLK_BIT)	 | \
+	FEATURE_MASK(FEATURE_DPM_MP0CLK_BIT))
+
+#define MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE	0x4000
+
+static struct cmn2asic_msg_mapping smu_v13_0_0_message_map[SMU_MSG_MAX_COUNT] = {
+	MSG_MAP(TestMessage,			PPSMC_MSG_TestMessage,                 1),
+	MSG_MAP(GetSmuVersion,			PPSMC_MSG_GetSmuVersion,               1),
+	MSG_MAP(GetDriverIfVersion,		PPSMC_MSG_GetDriverIfVersion,          1),
+	MSG_MAP(SetAllowedFeaturesMaskLow,	PPSMC_MSG_SetAllowedFeaturesMaskLow,   0),
+	MSG_MAP(SetAllowedFeaturesMaskHigh,	PPSMC_MSG_SetAllowedFeaturesMaskHigh,  0),
+	MSG_MAP(EnableAllSmuFeatures,		PPSMC_MSG_EnableAllSmuFeatures,        0),
+	MSG_MAP(DisableAllSmuFeatures,		PPSMC_MSG_DisableAllSmuFeatures,       0),
+	MSG_MAP(EnableSmuFeaturesLow,		PPSMC_MSG_EnableSmuFeaturesLow,        1),
+	MSG_MAP(EnableSmuFeaturesHigh,		PPSMC_MSG_EnableSmuFeaturesHigh,       1),
+	MSG_MAP(DisableSmuFeaturesLow,		PPSMC_MSG_DisableSmuFeaturesLow,       1),
+	MSG_MAP(DisableSmuFeaturesHigh,		PPSMC_MSG_DisableSmuFeaturesHigh,      1),
+	MSG_MAP(GetEnabledSmuFeaturesLow,       PPSMC_MSG_GetRunningSmuFeaturesLow,    1),
+	MSG_MAP(GetEnabledSmuFeaturesHigh,	PPSMC_MSG_GetRunningSmuFeaturesHigh,   1),
+	MSG_MAP(SetWorkloadMask,		PPSMC_MSG_SetWorkloadMask,             1),
+	MSG_MAP(SetPptLimit,			PPSMC_MSG_SetPptLimit,                 0),
+	MSG_MAP(SetDriverDramAddrHigh,		PPSMC_MSG_SetDriverDramAddrHigh,       1),
+	MSG_MAP(SetDriverDramAddrLow,		PPSMC_MSG_SetDriverDramAddrLow,        1),
+	MSG_MAP(SetToolsDramAddrHigh,		PPSMC_MSG_SetToolsDramAddrHigh,        0),
+	MSG_MAP(SetToolsDramAddrLow,		PPSMC_MSG_SetToolsDramAddrLow,         0),
+	MSG_MAP(TransferTableSmu2Dram,		PPSMC_MSG_TransferTableSmu2Dram,       1),
+	MSG_MAP(TransferTableDram2Smu,		PPSMC_MSG_TransferTableDram2Smu,       0),
+	MSG_MAP(UseDefaultPPTable,		PPSMC_MSG_UseDefaultPPTable,           0),
+	MSG_MAP(RunDcBtc,			PPSMC_MSG_RunDcBtc,                    0),
+	MSG_MAP(EnterBaco,			PPSMC_MSG_EnterBaco,                   0),
+	MSG_MAP(SetSoftMinByFreq,		PPSMC_MSG_SetSoftMinByFreq,            1),
+	MSG_MAP(SetSoftMaxByFreq,		PPSMC_MSG_SetSoftMaxByFreq,            1),
+	MSG_MAP(SetHardMinByFreq,		PPSMC_MSG_SetHardMinByFreq,            1),
+	MSG_MAP(SetHardMaxByFreq,		PPSMC_MSG_SetHardMaxByFreq,            0),
+	MSG_MAP(GetMinDpmFreq,			PPSMC_MSG_GetMinDpmFreq,               1),
+	MSG_MAP(GetMaxDpmFreq,			PPSMC_MSG_GetMaxDpmFreq,               1),
+	MSG_MAP(GetDpmFreqByIndex,		PPSMC_MSG_GetDpmFreqByIndex,           1),
+	MSG_MAP(PowerUpVcn,			PPSMC_MSG_PowerUpVcn,                  0),
+	MSG_MAP(PowerDownVcn,			PPSMC_MSG_PowerDownVcn,                0),
+	MSG_MAP(PowerUpJpeg,			PPSMC_MSG_PowerUpJpeg,                 0),
+	MSG_MAP(PowerDownJpeg,			PPSMC_MSG_PowerDownJpeg,               0),
+	MSG_MAP(GetDcModeMaxDpmFreq,		PPSMC_MSG_GetDcModeMaxDpmFreq,         1),
+	MSG_MAP(OverridePcieParameters,		PPSMC_MSG_OverridePcieParameters,      0),
+	MSG_MAP(DramLogSetDramAddrHigh,		PPSMC_MSG_DramLogSetDramAddrHigh,      0),
+	MSG_MAP(DramLogSetDramAddrLow,		PPSMC_MSG_DramLogSetDramAddrLow,       0),
+	MSG_MAP(DramLogSetDramSize,		PPSMC_MSG_DramLogSetDramSize,          0),
+	MSG_MAP(AllowGfxOff,			PPSMC_MSG_AllowGfxOff,                 0),
+	MSG_MAP(DisallowGfxOff,			PPSMC_MSG_DisallowGfxOff,              0),
+	MSG_MAP(SetMGpuFanBoostLimitRpm,	PPSMC_MSG_SetMGpuFanBoostLimitRpm,     0),
+};
+
+static struct cmn2asic_mapping smu_v13_0_0_clk_map[SMU_CLK_COUNT] = {
+	CLK_MAP(GFXCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SCLK,		PPCLK_GFXCLK),
+	CLK_MAP(SOCCLK,		PPCLK_SOCCLK),
+	CLK_MAP(FCLK,		PPCLK_FCLK),
+	CLK_MAP(UCLK,		PPCLK_UCLK),
+	CLK_MAP(MCLK,		PPCLK_UCLK),
+	CLK_MAP(VCLK,		PPCLK_VCLK_0),
+	CLK_MAP(VCLK1,		PPCLK_VCLK_1),
+	CLK_MAP(DCLK,		PPCLK_DCLK_0),
+	CLK_MAP(DCLK1,		PPCLK_DCLK_1),
+};
+
+static struct cmn2asic_mapping smu_v13_0_0_feature_mask_map[SMU_FEATURE_COUNT] = {
+	[SMU_FEATURE_DPM_GFXCLK_BIT] = {1, FEATURE_DPM_GFXCLK_BIT},
+	[SMU_FEATURE_DPM_UCLK_BIT] = {1, FEATURE_DPM_UCLK_BIT},
+	[SMU_FEATURE_DPM_FCLK_BIT] = {1, FEATURE_DPM_FCLK_BIT},
+	[SMU_FEATURE_DPM_SOCCLK_BIT] = {1, FEATURE_DPM_SOCCLK_BIT},
+	[SMU_FEATURE_DPM_LINK_BIT] = {1, FEATURE_DPM_LINK_BIT},
+	[SMU_FEATURE_DPM_VCLK_BIT] = {1, FEATURE_MM_DPM_BIT},
+	[SMU_FEATURE_DPM_DCLK_BIT] = {1, FEATURE_MM_DPM_BIT},
+	[SMU_FEATURE_FAN_CONTROL_BIT] = {1, FEATURE_FAN_CONTROL_BIT},
+};
+
+static struct cmn2asic_mapping smu_v13_0_0_table_map[SMU_TABLE_COUNT] = {
+	TAB_MAP(PPTABLE),
+	TAB_MAP(WATERMARKS),
+	TAB_MAP(AVFS_PSM_DEBUG),
+	TAB_MAP(PMSTATUSLOG),
+	TAB_MAP(SMU_METRICS),
+	TAB_MAP(DRIVER_SMU_CONFIG),
+	TAB_MAP(ACTIVITY_MONITOR_COEFF),
+	[SMU_TABLE_COMBO_PPTABLE] = {1, TABLE_COMBO_PPTABLE},
+};
+
+static struct cmn2asic_mapping smu_v13_0_0_pwr_src_map[SMU_POWER_SOURCE_COUNT] = {
+	PWR_MAP(AC),
+	PWR_MAP(DC),
+};
+
+static struct cmn2asic_mapping smu_v13_0_0_workload_map[PP_SMC_POWER_PROFILE_COUNT] = {
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT,	WORKLOAD_PPLIB_DEFAULT_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_FULLSCREEN3D,		WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_POWERSAVING,		WORKLOAD_PPLIB_POWER_SAVING_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VIDEO,		WORKLOAD_PPLIB_VIDEO_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VR,			WORKLOAD_PPLIB_VR_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,		WORKLOAD_PPLIB_COMPUTE_BIT),
+	WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,		WORKLOAD_PPLIB_CUSTOM_BIT),
+};
+
+static const uint8_t smu_v13_0_0_throttler_map[] = {
+	[THROTTLER_PPT0_BIT]		= (SMU_THROTTLER_PPT0_BIT),
+	[THROTTLER_PPT1_BIT]		= (SMU_THROTTLER_PPT1_BIT),
+	[THROTTLER_PPT2_BIT]		= (SMU_THROTTLER_PPT2_BIT),
+	[THROTTLER_PPT3_BIT]		= (SMU_THROTTLER_PPT3_BIT),
+	[THROTTLER_TDC_GFX_BIT]		= (SMU_THROTTLER_TDC_GFX_BIT),
+	[THROTTLER_TDC_SOC_BIT]		= (SMU_THROTTLER_TDC_SOC_BIT),
+	[THROTTLER_TEMP_EDGE_BIT]	= (SMU_THROTTLER_TEMP_EDGE_BIT),
+	[THROTTLER_TEMP_HOTSPOT_BIT]	= (SMU_THROTTLER_TEMP_HOTSPOT_BIT),
+	[THROTTLER_TEMP_MEM_BIT]	= (SMU_THROTTLER_TEMP_MEM_BIT),
+	[THROTTLER_TEMP_VR_GFX_BIT]	= (SMU_THROTTLER_TEMP_VR_GFX_BIT),
+	[THROTTLER_TEMP_VR_SOC_BIT]	= (SMU_THROTTLER_TEMP_VR_SOC_BIT),
+	[THROTTLER_TEMP_VR_MEM0_BIT]	= (SMU_THROTTLER_TEMP_VR_MEM0_BIT),
+	[THROTTLER_TEMP_VR_MEM1_BIT]	= (SMU_THROTTLER_TEMP_VR_MEM1_BIT),
+	[THROTTLER_TEMP_LIQUID0_BIT]	= (SMU_THROTTLER_TEMP_LIQUID0_BIT),
+	[THROTTLER_TEMP_LIQUID1_BIT]	= (SMU_THROTTLER_TEMP_LIQUID1_BIT),
+	[THROTTLER_GFX_APCC_PLUS_BIT]	= (SMU_THROTTLER_APCC_BIT),
+	[THROTTLER_FIT_BIT]		= (SMU_THROTTLER_FIT_BIT),
+};
+
+static int
+smu_v13_0_0_get_allowed_feature_mask(struct smu_context *smu,
+				  uint32_t *feature_mask, uint32_t num)
+{
+	struct amdgpu_device *adev = smu->adev;
+
+	if (num > 2)
+		return -EINVAL;
+
+	memset(feature_mask, 0, sizeof(uint32_t) * num);
+
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_FW_DATA_READ_BIT);
+
+	if (adev->pm.pp_feature & PP_SCLK_DPM_MASK) {
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_GFX_IMU_BIT);
+	}
+
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_MM_DPM_BIT);
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DS_VCN_BIT);
+
+	if ((adev->pg_flags & AMD_PG_SUPPORT_ATHUB) &&
+	    (adev->pg_flags & AMD_PG_SUPPORT_MMHUB))
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_ATHUB_MMHUB_PG_BIT);
+
+	if (adev->pm.pp_feature & PP_SOCCLK_DPM_MASK)
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT);
+
+	if (adev->pm.pp_feature & PP_GFXOFF_MASK)
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_GFXOFF_BIT);
+
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_THROTTLERS_BIT);
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_FAN_CONTROL_BIT);
+
+	return 0;
+}
+
+static int smu_v13_0_0_check_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	struct smu_baco_context *smu_baco = &smu->smu_baco;
+
+	if (powerplay_table->platform_caps & SMU_13_0_0_PP_PLATFORM_CAP_HARDWAREDC)
+		smu->dc_controlled_by_gpio = true;
+
+	if (powerplay_table->platform_caps & SMU_13_0_0_PP_PLATFORM_CAP_BACO ||
+	    powerplay_table->platform_caps & SMU_13_0_0_PP_PLATFORM_CAP_MACO)
+		smu_baco->platform_support = true;
+
+	table_context->thermal_controller_type =
+		powerplay_table->thermal_controller_type;
+
+	/*
+	 * Instead of having its own buffer space and get overdrive_table copied,
+	 * smu->od_settings just points to the actual overdrive_table
+	 */
+	smu->od_settings = &powerplay_table->overdrive_table;
+
+	return 0;
+}
+
+static int smu_v13_0_0_store_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+
+	memcpy(table_context->driver_pptable, &powerplay_table->smc_pptable,
+	       sizeof(PPTable_t));
+
+	return 0;
+}
+
+#ifndef atom_smc_dpm_info_table_13_0_0
+struct atom_smc_dpm_info_table_13_0_0
+{
+	struct atom_common_table_header table_header;
+	BoardTable_t BoardTable;
+};
+#endif
+
+static int smu_v13_0_0_append_powerplay_table(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *smc_pptable = table_context->driver_pptable;
+	struct atom_smc_dpm_info_table_13_0_0 *smc_dpm_table;
+	BoardTable_t *BoardTable = &smc_pptable->BoardTable;
+	int index, ret;
+
+	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
+					    smc_dpm_info);
+
+	ret = amdgpu_atombios_get_data_table(smu->adev, index, NULL, NULL, NULL,
+					     (uint8_t **)&smc_dpm_table);
+	if (ret)
+		return ret;
+
+	memcpy(BoardTable, &smc_dpm_table->BoardTable, sizeof(BoardTable_t));
+
+	return 0;
+}
+
+static int smu_v13_0_0_setup_pptable(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	void *combo_pptable = smu_table->combo_pptable;
+	struct amdgpu_device *adev = smu->adev;
+	int ret = 0;
+
+	/*
+	 * With SCPM enabled, the pptable used will be signed. It cannot
+	 * be used directly by driver. To get the raw pptable, we need to
+	 * rely on the combo pptable(and its revelant SMU message).
+	 */
+	if (adev->scpm_enabled) {
+		ret = smu_cmn_get_combo_pptable(smu);
+		if (ret)
+			return ret;
+
+		smu->smu_table.power_play_table = combo_pptable;
+		smu->smu_table.power_play_table_size = sizeof(struct smu_13_0_0_powerplay_table);
+	} else {
+		ret = smu_v13_0_setup_pptable(smu);
+		if (ret)
+			return ret;
+	}
+
+	ret = smu_v13_0_0_store_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	/*
+	 * With SCPM enabled, the operation below will be handled
+	 * by PSP. Driver involvment is unnecessary and useless.
+	 */
+	if (!adev->scpm_enabled) {
+		ret = smu_v13_0_0_append_powerplay_table(smu);
+		if (ret)
+			return ret;
+	}
+
+	ret = smu_v13_0_0_check_powerplay_table(smu);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int smu_v13_0_0_tables_init(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+
+	SMU_TABLE_INIT(tables, SMU_TABLE_PPTABLE, sizeof(PPTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_WATERMARKS, sizeof(Watermarks_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS, sizeof(SmuMetricsExternal_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_I2C_COMMANDS, sizeof(SwI2cRequest_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_OVERDRIVE, sizeof(OverDriveTable_t),
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_PMSTATUSLOG, SMU13_TOOL_SIZE,
+		       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_ACTIVITY_MONITOR_COEFF,
+		       sizeof(DpmActivityMonitorCoeffIntExternal_t), PAGE_SIZE,
+	               AMDGPU_GEM_DOMAIN_VRAM);
+	SMU_TABLE_INIT(tables, SMU_TABLE_COMBO_PPTABLE, MP0_MP1_DATA_REGION_SIZE_COMBOPPTABLE,
+			PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
+
+	smu_table->metrics_table = kzalloc(sizeof(SmuMetricsExternal_t), GFP_KERNEL);
+	if (!smu_table->metrics_table)
+		goto err0_out;
+	smu_table->metrics_time = 0;
+
+	smu_table->gpu_metrics_table_size = sizeof(struct gpu_metrics_v1_3);
+	smu_table->gpu_metrics_table = kzalloc(smu_table->gpu_metrics_table_size, GFP_KERNEL);
+	if (!smu_table->gpu_metrics_table)
+		goto err1_out;
+
+	smu_table->watermarks_table = kzalloc(sizeof(Watermarks_t), GFP_KERNEL);
+	if (!smu_table->watermarks_table)
+		goto err2_out;
+
+	return 0;
+
+err2_out:
+	kfree(smu_table->gpu_metrics_table);
+err1_out:
+	kfree(smu_table->metrics_table);
+err0_out:
+	return -ENOMEM;
+}
+
+static int smu_v13_0_0_allocate_dpm_context(struct smu_context *smu)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+
+	smu_dpm->dpm_context = kzalloc(sizeof(struct smu_13_0_dpm_context),
+				       GFP_KERNEL);
+	if (!smu_dpm->dpm_context)
+		return -ENOMEM;
+
+	smu_dpm->dpm_context_size = sizeof(struct smu_13_0_dpm_context);
+
+	return 0;
+}
+
+static int smu_v13_0_0_init_smc_tables(struct smu_context *smu)
+{
+	int ret = 0;
+
+	ret = smu_v13_0_0_tables_init(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_v13_0_0_allocate_dpm_context(smu);
+	if (ret)
+		return ret;
+
+	return smu_v13_0_init_smc_tables(smu);
+}
+
+static int smu_v13_0_0_set_default_dpm_table(struct smu_context *smu)
+{
+	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *pptable = table_context->driver_pptable;
+	SkuTable_t *skutable = &pptable->SkuTable;
+	struct smu_13_0_dpm_table *dpm_table;
+	struct smu_13_0_pcie_table *pcie_table;
+	uint32_t link_level;
+	int ret = 0;
+
+	/* socclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.soc_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_SOCCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_SOCCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.socclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* gfxclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.gfx_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_GFXCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.gfxclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* uclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.uclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_UCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.uclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* fclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.fclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_FCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_FCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.fclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* vclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.vclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_VCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_VCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.vclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* dclk dpm table setup */
+	dpm_table = &dpm_context->dpm_tables.dclk_table;
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCLK_BIT)) {
+		ret = smu_v13_0_set_single_dpm_table(smu,
+						     SMU_DCLK,
+						     dpm_table);
+		if (ret)
+			return ret;
+	} else {
+		dpm_table->count = 1;
+		dpm_table->dpm_levels[0].value = smu->smu_table.boot_values.dclk / 100;
+		dpm_table->dpm_levels[0].enabled = true;
+		dpm_table->min = dpm_table->dpm_levels[0].value;
+		dpm_table->max = dpm_table->dpm_levels[0].value;
+	}
+
+	/* lclk dpm table setup */
+	pcie_table = &dpm_context->dpm_tables.pcie_table;
+	pcie_table->num_of_link_levels = 0;
+	for (link_level = 0; link_level < NUM_LINK_LEVELS; link_level++) {
+		if (!skutable->PcieGenSpeed[link_level] &&
+		    !skutable->PcieLaneCount[link_level] &&
+		    !skutable->LclkFreq[link_level])
+			continue;
+
+		pcie_table->pcie_gen[pcie_table->num_of_link_levels] =
+					skutable->PcieGenSpeed[link_level];
+		pcie_table->pcie_lane[pcie_table->num_of_link_levels] =
+					skutable->PcieLaneCount[link_level];
+		pcie_table->clk_freq[pcie_table->num_of_link_levels] =
+					skutable->LclkFreq[link_level];
+		pcie_table->num_of_link_levels++;
+	}
+
+	return 0;
+}
+
+static bool smu_v13_0_0_is_dpm_running(struct smu_context *smu)
+{
+	int ret = 0;
+	uint64_t feature_enabled;
+
+	ret = smu_cmn_get_enabled_mask(smu, &feature_enabled);
+	if (ret)
+		return false;
+
+	return !!(feature_enabled & SMC_DPM_FEATURE);
+}
+
+static void smu_v13_0_0_dump_pptable(struct smu_context *smu)
+{
+       struct smu_table_context *table_context = &smu->smu_table;
+       PPTable_t *pptable = table_context->driver_pptable;
+       SkuTable_t *skutable = &pptable->SkuTable;
+
+       dev_info(smu->adev->dev, "Dumped PPTable:\n");
+
+       dev_info(smu->adev->dev, "Version = 0x%08x\n", skutable->Version);
+       dev_info(smu->adev->dev, "FeaturesToRun[0] = 0x%08x\n", skutable->FeaturesToRun[0]);
+       dev_info(smu->adev->dev, "FeaturesToRun[1] = 0x%08x\n", skutable->FeaturesToRun[1]);
+}
+
+static int smu_v13_0_0_system_features_control(struct smu_context *smu,
+						  bool en)
+{
+	return smu_v13_0_system_features_control(smu, en);
+}
+
+static uint32_t smu_v13_0_get_throttler_status(SmuMetrics_t *metrics)
+{
+	uint32_t throttler_status = 0;
+	int i;
+
+	for (i = 0; i < THROTTLER_COUNT; i++)
+		throttler_status |=
+			(metrics->ThrottlingPercentage[i] ? 1U << i : 0);
+
+	return throttler_status;
+}
+
+#define SMU_13_0_0_BUSY_THRESHOLD	15
+static int smu_v13_0_0_get_smu_metrics_data(struct smu_context *smu,
+					    MetricsMember_t member,
+					    uint32_t *value)
+{
+	struct smu_table_context *smu_table= &smu->smu_table;
+	SmuMetrics_t *metrics =
+		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics);
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu,
+					NULL,
+					false);
+	if (ret)
+		return ret;
+
+	switch (member) {
+	case METRICS_CURR_GFXCLK:
+		*value = metrics->CurrClock[PPCLK_GFXCLK];
+		break;
+	case METRICS_CURR_SOCCLK:
+		*value = metrics->CurrClock[PPCLK_SOCCLK];
+		break;
+	case METRICS_CURR_UCLK:
+		*value = metrics->CurrClock[PPCLK_UCLK];
+		break;
+	case METRICS_CURR_VCLK:
+		*value = metrics->CurrClock[PPCLK_VCLK_0];
+		break;
+	case METRICS_CURR_VCLK1:
+		*value = metrics->CurrClock[PPCLK_VCLK_1];
+		break;
+	case METRICS_CURR_DCLK:
+		*value = metrics->CurrClock[PPCLK_DCLK_0];
+		break;
+	case METRICS_CURR_DCLK1:
+		*value = metrics->CurrClock[PPCLK_DCLK_1];
+		break;
+	case METRICS_CURR_FCLK:
+		*value = metrics->CurrClock[PPCLK_FCLK];
+		break;
+	case METRICS_AVERAGE_GFXCLK:
+		if (metrics->AverageGfxActivity <= SMU_13_0_0_BUSY_THRESHOLD)
+			*value = metrics->AverageGfxclkFrequencyPostDs;
+		else
+			*value = metrics->AverageGfxclkFrequencyPreDs;
+		break;
+	case METRICS_AVERAGE_FCLK:
+		if (metrics->AverageUclkActivity <= SMU_13_0_0_BUSY_THRESHOLD)
+			*value = metrics->AverageFclkFrequencyPostDs;
+		else
+			*value = metrics->AverageFclkFrequencyPreDs;
+		break;
+	case METRICS_AVERAGE_UCLK:
+		if (metrics->AverageUclkActivity <= SMU_13_0_0_BUSY_THRESHOLD)
+			*value = metrics->AverageMemclkFrequencyPostDs;
+		else
+			*value = metrics->AverageMemclkFrequencyPreDs;
+		break;
+	case METRICS_AVERAGE_VCLK:
+		*value = metrics->AverageVclk0Frequency;
+		break;
+	case METRICS_AVERAGE_DCLK:
+		*value = metrics->AverageDclk0Frequency;
+		break;
+	case METRICS_AVERAGE_VCLK1:
+		*value = metrics->AverageVclk1Frequency;
+		break;
+	case METRICS_AVERAGE_DCLK1:
+		*value = metrics->AverageDclk1Frequency;
+		break;
+	case METRICS_AVERAGE_GFXACTIVITY:
+		*value = metrics->AverageGfxActivity;
+		break;
+	case METRICS_AVERAGE_MEMACTIVITY:
+		*value = metrics->AverageUclkActivity;
+		break;
+	case METRICS_AVERAGE_SOCKETPOWER:
+		*value = metrics->AverageSocketPower << 8;
+		break;
+	case METRICS_TEMPERATURE_EDGE:
+		*value = metrics->AvgTemperature[TEMP_EDGE] *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_HOTSPOT:
+		*value = metrics->AvgTemperature[TEMP_HOTSPOT] *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_MEM:
+		*value = metrics->AvgTemperature[TEMP_MEM] *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_VRGFX:
+		*value = metrics->AvgTemperature[TEMP_VR_GFX] *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_TEMPERATURE_VRSOC:
+		*value = metrics->AvgTemperature[TEMP_VR_SOC] *
+			SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+		break;
+	case METRICS_THROTTLER_STATUS:
+		*value = smu_v13_0_get_throttler_status(metrics);
+		break;
+	case METRICS_CURR_FANSPEED:
+		*value = metrics->AvgFanRpm;
+		break;
+	case METRICS_CURR_FANPWM:
+		*value = metrics->AvgFanPwm;
+		break;
+	case METRICS_VOLTAGE_VDDGFX:
+		*value = metrics->AvgVoltage[SVI_PLANE_GFX];
+		break;
+	case METRICS_PCIE_RATE:
+		*value = metrics->PcieRate;
+		break;
+	case METRICS_PCIE_WIDTH:
+		*value = metrics->PcieWidth;
+		break;
+	default:
+		*value = UINT_MAX;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_0_read_sensor(struct smu_context *smu,
+				   enum amd_pp_sensors sensor,
+				   void *data,
+				   uint32_t *size)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *smc_pptable = table_context->driver_pptable;
+	int ret = 0;
+
+	switch (sensor) {
+	case AMDGPU_PP_SENSOR_MAX_FAN_RPM:
+		*(uint16_t *)data = smc_pptable->SkuTable.FanMaximumRpm;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_MEM_LOAD:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_MEMACTIVITY,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GPU_LOAD:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_GFXACTIVITY,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GPU_POWER:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_SOCKETPOWER,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_HOTSPOT_TEMP:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_TEMPERATURE_HOTSPOT,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_EDGE_TEMP:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_TEMPERATURE_EDGE,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_MEM_TEMP:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_TEMPERATURE_MEM,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_MCLK:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_UCLK,
+						       (uint32_t *)data);
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_GFX_SCLK:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_AVERAGE_GFXCLK,
+						       (uint32_t *)data);
+		*(uint32_t *)data *= 100;
+		*size = 4;
+		break;
+	case AMDGPU_PP_SENSOR_VDDGFX:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_VOLTAGE_VDDGFX,
+						       (uint32_t *)data);
+		*size = 4;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_0_get_current_clk_freq_by_table(struct smu_context *smu,
+						     enum smu_clk_type clk_type,
+						     uint32_t *value)
+{
+	MetricsMember_t member_type;
+	int clk_id = 0;
+
+	clk_id = smu_cmn_to_asic_specific_index(smu,
+						CMN2ASIC_MAPPING_CLK,
+						clk_type);
+	if (clk_id < 0)
+		return -EINVAL;
+
+	switch (clk_id) {
+	case PPCLK_GFXCLK:
+		member_type = METRICS_AVERAGE_GFXCLK;
+		break;
+	case PPCLK_UCLK:
+		member_type = METRICS_AVERAGE_UCLK;
+		break;
+	case PPCLK_FCLK:
+		member_type = METRICS_AVERAGE_FCLK;
+		break;
+	case PPCLK_SOCCLK:
+		member_type = METRICS_CURR_SOCCLK;
+		break;
+	case PPCLK_VCLK_0:
+		member_type = METRICS_AVERAGE_VCLK;
+		break;
+	case PPCLK_DCLK_0:
+		member_type = METRICS_AVERAGE_DCLK;
+		break;
+	case PPCLK_VCLK_1:
+		member_type = METRICS_AVERAGE_VCLK1;
+		break;
+	case PPCLK_DCLK_1:
+		member_type = METRICS_AVERAGE_DCLK1;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return smu_v13_0_0_get_smu_metrics_data(smu,
+						member_type,
+						value);
+}
+
+static int smu_v13_0_0_print_clk_levels(struct smu_context *smu,
+					enum smu_clk_type clk_type,
+					char *buf)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+	struct smu_13_0_dpm_context *dpm_context = smu_dpm->dpm_context;
+	struct smu_13_0_dpm_table *single_dpm_table;
+	struct smu_13_0_pcie_table *pcie_table;
+	uint32_t gen_speed, lane_width;
+	int i, curr_freq, size = 0;
+	int ret = 0;
+
+	smu_cmn_get_sysfs_buf(&buf, &size);
+
+	if (amdgpu_ras_intr_triggered()) {
+		size += sysfs_emit_at(buf, size, "unavailable\n");
+		return size;
+	}
+
+	switch (clk_type) {
+	case SMU_SCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
+		break;
+	case SMU_MCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.uclk_table);
+		break;
+	case SMU_SOCCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.soc_table);
+		break;
+	case SMU_FCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.fclk_table);
+		break;
+	case SMU_VCLK:
+	case SMU_VCLK1:
+		single_dpm_table = &(dpm_context->dpm_tables.vclk_table);
+		break;
+	case SMU_DCLK:
+	case SMU_DCLK1:
+		single_dpm_table = &(dpm_context->dpm_tables.dclk_table);
+		break;
+	default:
+		break;
+	}
+
+	switch (clk_type) {
+	case SMU_SCLK:
+	case SMU_MCLK:
+	case SMU_SOCCLK:
+	case SMU_FCLK:
+	case SMU_VCLK:
+	case SMU_VCLK1:
+	case SMU_DCLK:
+	case SMU_DCLK1:
+		ret = smu_v13_0_0_get_current_clk_freq_by_table(smu, clk_type, &curr_freq);
+		if (ret) {
+			dev_err(smu->adev->dev, "Failed to get current clock freq!");
+			return ret;
+		}
+
+		if (single_dpm_table->is_fine_grained) {
+			/*
+			 * For fine grained dpms, there are only two dpm levels:
+			 *   - level 0 -> min clock freq
+			 *   - level 1 -> max clock freq
+			 * And the current clock frequency can be any value between them.
+			 * So, if the current clock frequency is not at level 0 or level 1,
+			 * we will fake it as three dpm levels:
+			 *   - level 0 -> min clock freq
+			 *   - level 1 -> current actual clock freq
+			 *   - level 2 -> max clock freq
+			 */
+			if ((single_dpm_table->dpm_levels[0].value != curr_freq) &&
+			     (single_dpm_table->dpm_levels[1].value != curr_freq)) {
+				size += sysfs_emit_at(buf, size, "0: %uMhz\n",
+						single_dpm_table->dpm_levels[0].value);
+				size += sysfs_emit_at(buf, size, "1: %uMhz *\n",
+						curr_freq);
+				size += sysfs_emit_at(buf, size, "2: %uMhz\n",
+						single_dpm_table->dpm_levels[1].value);
+			} else {
+				size += sysfs_emit_at(buf, size, "0: %uMhz %s\n",
+						single_dpm_table->dpm_levels[0].value,
+						single_dpm_table->dpm_levels[0].value == curr_freq ? "*" : "");
+				size += sysfs_emit_at(buf, size, "1: %uMhz %s\n",
+						single_dpm_table->dpm_levels[1].value,
+						single_dpm_table->dpm_levels[1].value == curr_freq ? "*" : "");
+			}
+		} else {
+			for (i = 0; i < single_dpm_table->count; i++)
+				size += sysfs_emit_at(buf, size, "%d: %uMhz %s\n",
+						i, single_dpm_table->dpm_levels[i].value,
+						single_dpm_table->dpm_levels[i].value == curr_freq ? "*" : "");
+		}
+		break;
+	case SMU_PCIE:
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_PCIE_RATE,
+						       &gen_speed);
+		if (ret)
+			return ret;
+
+		ret = smu_v13_0_0_get_smu_metrics_data(smu,
+						       METRICS_PCIE_WIDTH,
+						       &lane_width);
+		if (ret)
+			return ret;
+
+		pcie_table = &(dpm_context->dpm_tables.pcie_table);
+		for (i = 0; i < pcie_table->num_of_link_levels; i++)
+			size += sysfs_emit_at(buf, size, "%d: %s %s %dMhz %s\n", i,
+					(pcie_table->pcie_gen[i] == 0) ? "2.5GT/s," :
+					(pcie_table->pcie_gen[i] == 1) ? "5.0GT/s," :
+					(pcie_table->pcie_gen[i] == 2) ? "8.0GT/s," :
+					(pcie_table->pcie_gen[i] == 3) ? "16.0GT/s," : "",
+					(pcie_table->pcie_lane[i] == 1) ? "x1" :
+					(pcie_table->pcie_lane[i] == 2) ? "x2" :
+					(pcie_table->pcie_lane[i] == 3) ? "x4" :
+					(pcie_table->pcie_lane[i] == 4) ? "x8" :
+					(pcie_table->pcie_lane[i] == 5) ? "x12" :
+					(pcie_table->pcie_lane[i] == 6) ? "x16" : "",
+					pcie_table->clk_freq[i],
+					(gen_speed == pcie_table->pcie_gen[i]) &&
+					(lane_width == pcie_table->pcie_lane[i]) ?
+					"*" : "");
+		break;
+
+	default:
+		break;
+	}
+
+	return size;
+}
+
+static int smu_v13_0_0_force_clk_levels(struct smu_context *smu,
+					enum smu_clk_type clk_type,
+					uint32_t mask)
+{
+	struct smu_dpm_context *smu_dpm = &smu->smu_dpm;
+	struct smu_13_0_dpm_context *dpm_context = smu_dpm->dpm_context;
+	struct smu_13_0_dpm_table *single_dpm_table;
+	uint32_t soft_min_level, soft_max_level;
+	uint32_t min_freq, max_freq;
+	int ret = 0;
+
+	soft_min_level = mask ? (ffs(mask) - 1) : 0;
+	soft_max_level = mask ? (fls(mask) - 1) : 0;
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.gfx_table);
+		break;
+	case SMU_MCLK:
+	case SMU_UCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.uclk_table);
+		break;
+	case SMU_SOCCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.soc_table);
+		break;
+	case SMU_FCLK:
+		single_dpm_table = &(dpm_context->dpm_tables.fclk_table);
+		break;
+	case SMU_VCLK:
+	case SMU_VCLK1:
+		single_dpm_table = &(dpm_context->dpm_tables.vclk_table);
+		break;
+	case SMU_DCLK:
+	case SMU_DCLK1:
+		single_dpm_table = &(dpm_context->dpm_tables.dclk_table);
+		break;
+	default:
+		break;
+	}
+
+	switch (clk_type) {
+	case SMU_GFXCLK:
+	case SMU_SCLK:
+	case SMU_MCLK:
+	case SMU_UCLK:
+	case SMU_SOCCLK:
+	case SMU_FCLK:
+	case SMU_VCLK:
+	case SMU_VCLK1:
+	case SMU_DCLK:
+	case SMU_DCLK1:
+		if (single_dpm_table->is_fine_grained) {
+			/* There is only 2 levels for fine grained DPM */
+			soft_max_level = (soft_max_level >= 1 ? 1 : 0);
+			soft_min_level = (soft_min_level >= 1 ? 1 : 0);
+		} else {
+			if ((soft_max_level >= single_dpm_table->count) ||
+			    (soft_min_level >= single_dpm_table->count))
+				return -EINVAL;
+		}
+
+		min_freq = single_dpm_table->dpm_levels[soft_min_level].value;
+		max_freq = single_dpm_table->dpm_levels[soft_max_level].value;
+
+		ret = smu_v13_0_set_soft_freq_limited_range(smu,
+							    clk_type,
+							    min_freq,
+							    max_freq);
+		break;
+	case SMU_DCEFCLK:
+	case SMU_PCIE:
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_v13_0_0_update_pcie_parameters(struct smu_context *smu,
+					      uint32_t pcie_gen_cap,
+					      uint32_t pcie_width_cap)
+{
+	struct smu_13_0_dpm_context *dpm_context = smu->smu_dpm.dpm_context;
+	struct smu_13_0_pcie_table *pcie_table =
+				&dpm_context->dpm_tables.pcie_table;
+	uint32_t smu_pcie_arg;
+	int ret, i;
+
+	for (i = 0; i < pcie_table->num_of_link_levels; i++) {
+		if (pcie_table->pcie_gen[i] > pcie_gen_cap)
+			pcie_table->pcie_gen[i] = pcie_gen_cap;
+		if (pcie_table->pcie_lane[i] > pcie_width_cap)
+			pcie_table->pcie_lane[i] = pcie_width_cap;
+
+		smu_pcie_arg = i << 16;
+		smu_pcie_arg |= pcie_table->pcie_gen[i] << 8;
+		smu_pcie_arg |= pcie_table->pcie_lane[i];
+
+		ret = smu_cmn_send_smc_msg_with_param(smu,
+						      SMU_MSG_OverridePcieParameters,
+						      smu_pcie_arg,
+						      NULL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct smu_temperature_range smu13_thermal_policy[] =
+{
+	{-273150,  99000, 99000, -273150, 99000, 99000, -273150, 99000, 99000},
+	{ 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000, 120000},
+};
+
+static int smu_v13_0_0_get_thermal_temperature_range(struct smu_context *smu,
+						     struct smu_temperature_range *range)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	struct smu_13_0_0_powerplay_table *powerplay_table =
+		table_context->power_play_table;
+	PPTable_t *pptable = smu->smu_table.driver_pptable;
+
+	if (!range)
+		return -EINVAL;
+
+	memcpy(range, &smu13_thermal_policy[0], sizeof(struct smu_temperature_range));
+
+	range->max = pptable->SkuTable.TemperatureLimit[TEMP_EDGE] *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->edge_emergency_max = (pptable->SkuTable.TemperatureLimit[TEMP_EDGE] + CTF_OFFSET_EDGE) *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->hotspot_crit_max = pptable->SkuTable.TemperatureLimit[TEMP_HOTSPOT] *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->hotspot_emergency_max = (pptable->SkuTable.TemperatureLimit[TEMP_HOTSPOT] + CTF_OFFSET_HOTSPOT) *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->mem_crit_max = pptable->SkuTable.TemperatureLimit[TEMP_MEM] *
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->mem_emergency_max = (pptable->SkuTable.TemperatureLimit[TEMP_MEM] + CTF_OFFSET_MEM)*
+		SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
+	range->software_shutdown_temp = powerplay_table->software_shutdown_temp;
+
+	return 0;
+}
+
+#define MAX(a, b)	((a) > (b) ? (a) : (b))
+static ssize_t smu_v13_0_0_get_gpu_metrics(struct smu_context *smu,
+					   void **table)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct gpu_metrics_v1_3 *gpu_metrics =
+		(struct gpu_metrics_v1_3 *)smu_table->gpu_metrics_table;
+	SmuMetricsExternal_t metrics_ext;
+	SmuMetrics_t *metrics = &metrics_ext.SmuMetrics;
+	int ret = 0;
+
+	ret = smu_cmn_get_metrics_table(smu,
+					&metrics_ext,
+					true);
+	if (ret)
+		return ret;
+
+	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 3);
+
+	gpu_metrics->temperature_edge = metrics->AvgTemperature[TEMP_EDGE];
+	gpu_metrics->temperature_hotspot = metrics->AvgTemperature[TEMP_HOTSPOT];
+	gpu_metrics->temperature_mem = metrics->AvgTemperature[TEMP_MEM];
+	gpu_metrics->temperature_vrgfx = metrics->AvgTemperature[TEMP_VR_GFX];
+	gpu_metrics->temperature_vrsoc = metrics->AvgTemperature[TEMP_VR_SOC];
+	gpu_metrics->temperature_vrmem = MAX(metrics->AvgTemperature[TEMP_VR_MEM0],
+					     metrics->AvgTemperature[TEMP_VR_MEM1]);
+
+	gpu_metrics->average_gfx_activity = metrics->AverageGfxActivity;
+	gpu_metrics->average_umc_activity = metrics->AverageUclkActivity;
+	gpu_metrics->average_mm_activity = MAX(metrics->Vcn0ActivityPercentage,
+					       metrics->Vcn1ActivityPercentage);
+
+	gpu_metrics->average_socket_power = metrics->AverageSocketPower;
+	gpu_metrics->energy_accumulator = metrics->EnergyAccumulator;
+
+	if (metrics->AverageGfxActivity <= SMU_13_0_0_BUSY_THRESHOLD)
+		gpu_metrics->average_gfxclk_frequency = metrics->AverageGfxclkFrequencyPostDs;
+	else
+		gpu_metrics->average_gfxclk_frequency = metrics->AverageGfxclkFrequencyPreDs;
+
+	if (metrics->AverageUclkActivity <= SMU_13_0_0_BUSY_THRESHOLD)
+		gpu_metrics->average_uclk_frequency = metrics->AverageMemclkFrequencyPostDs;
+	else
+		gpu_metrics->average_uclk_frequency = metrics->AverageMemclkFrequencyPreDs;
+
+	gpu_metrics->average_vclk0_frequency = metrics->AverageVclk0Frequency;
+	gpu_metrics->average_dclk0_frequency = metrics->AverageDclk0Frequency;
+	gpu_metrics->average_vclk1_frequency = metrics->AverageVclk1Frequency;
+	gpu_metrics->average_dclk1_frequency = metrics->AverageDclk1Frequency;
+
+	gpu_metrics->current_gfxclk = metrics->CurrClock[PPCLK_GFXCLK];
+	gpu_metrics->current_socclk = metrics->CurrClock[PPCLK_SOCCLK];
+	gpu_metrics->current_uclk = metrics->CurrClock[PPCLK_UCLK];
+	gpu_metrics->current_vclk0 = metrics->CurrClock[PPCLK_VCLK_0];
+	gpu_metrics->current_dclk0 = metrics->CurrClock[PPCLK_DCLK_0];
+	gpu_metrics->current_vclk1 = metrics->CurrClock[PPCLK_VCLK_1];
+	gpu_metrics->current_dclk1 = metrics->CurrClock[PPCLK_DCLK_1];
+
+	gpu_metrics->throttle_status =
+			smu_v13_0_get_throttler_status(metrics);
+	gpu_metrics->indep_throttle_status =
+			smu_cmn_get_indep_throttler_status(gpu_metrics->throttle_status,
+							   smu_v13_0_0_throttler_map);
+
+	gpu_metrics->current_fan_speed = metrics->AvgFanRpm;
+
+	gpu_metrics->pcie_link_width = metrics->PcieWidth;
+	gpu_metrics->pcie_link_speed = metrics->PcieRate;
+
+	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
+
+	gpu_metrics->voltage_gfx = metrics->AvgVoltage[SVI_PLANE_GFX];
+	gpu_metrics->voltage_soc = metrics->AvgVoltage[SVI_PLANE_SOC];
+	gpu_metrics->voltage_mem = metrics->AvgVoltage[SVI_PLANE_VMEMP];
+
+	*table = (void *)gpu_metrics;
+
+	return sizeof(struct gpu_metrics_v1_3);
+}
+
+static int smu_v13_0_0_populate_umd_state_clk(struct smu_context *smu)
+{
+	struct smu_13_0_dpm_context *dpm_context =
+				smu->smu_dpm.dpm_context;
+	struct smu_13_0_dpm_table *gfx_table =
+				&dpm_context->dpm_tables.gfx_table;
+	struct smu_13_0_dpm_table *mem_table =
+				&dpm_context->dpm_tables.uclk_table;
+	struct smu_13_0_dpm_table *soc_table =
+				&dpm_context->dpm_tables.soc_table;
+	struct smu_13_0_dpm_table *vclk_table =
+				&dpm_context->dpm_tables.vclk_table;
+	struct smu_13_0_dpm_table *dclk_table =
+				&dpm_context->dpm_tables.dclk_table;
+	struct smu_13_0_dpm_table *fclk_table =
+				&dpm_context->dpm_tables.fclk_table;
+	struct smu_umd_pstate_table *pstate_table =
+				&smu->pstate_table;
+
+	pstate_table->gfxclk_pstate.min = gfx_table->min;
+	pstate_table->gfxclk_pstate.peak = gfx_table->max;
+
+	pstate_table->uclk_pstate.min = mem_table->min;
+	pstate_table->uclk_pstate.peak = mem_table->max;
+
+	pstate_table->socclk_pstate.min = soc_table->min;
+	pstate_table->socclk_pstate.peak = soc_table->max;
+
+	pstate_table->vclk_pstate.min = vclk_table->min;
+	pstate_table->vclk_pstate.peak = vclk_table->max;
+
+	pstate_table->dclk_pstate.min = dclk_table->min;
+	pstate_table->dclk_pstate.peak = dclk_table->max;
+
+	pstate_table->fclk_pstate.min = fclk_table->min;
+	pstate_table->fclk_pstate.peak = fclk_table->max;
+
+	/*
+	 * For now, just use the mininum clock frequency.
+	 * TODO: update them when the real pstate settings available
+	 */
+	pstate_table->gfxclk_pstate.standard = gfx_table->min;
+	pstate_table->uclk_pstate.standard = mem_table->min;
+	pstate_table->socclk_pstate.standard = soc_table->min;
+	pstate_table->vclk_pstate.standard = vclk_table->min;
+	pstate_table->dclk_pstate.standard = dclk_table->min;
+	pstate_table->fclk_pstate.standard = fclk_table->min;
+
+	return 0;
+}
+
+static void smu_v13_0_0_get_unique_id(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	SmuMetrics_t *metrics =
+		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics);
+	struct amdgpu_device *adev = smu->adev;
+	uint32_t upper32 = 0, lower32 = 0;
+	int ret;
+
+	ret = smu_cmn_get_metrics_table(smu, NULL, false);
+	if (ret)
+		goto out;
+
+	upper32 = metrics->PublicSerialNumberUpper;
+	lower32 = metrics->PublicSerialNumberLower;
+
+out:
+	adev->unique_id = ((uint64_t)upper32 << 32) | lower32;
+	if (adev->serial[0] == '\0')
+		sprintf(adev->serial, "%016llx", adev->unique_id);
+}
+
+static int smu_v13_0_0_get_fan_speed_pwm(struct smu_context *smu,
+					 uint32_t *speed)
+{
+	if (!speed)
+		return -EINVAL;
+
+	return smu_v13_0_0_get_smu_metrics_data(smu,
+						METRICS_CURR_FANPWM,
+						speed);
+}
+
+static int smu_v13_0_0_get_fan_speed_rpm(struct smu_context *smu,
+					 uint32_t *speed)
+{
+	if (!speed)
+		return -EINVAL;
+
+	return smu_v13_0_0_get_smu_metrics_data(smu,
+						METRICS_CURR_FANSPEED,
+						speed);
+}
+
+static int smu_v13_0_0_enable_mgpu_fan_boost(struct smu_context *smu)
+{
+	struct smu_table_context *table_context = &smu->smu_table;
+	PPTable_t *pptable = table_context->driver_pptable;
+	SkuTable_t *skutable = &pptable->SkuTable;
+
+	/*
+	 * Skip the MGpuFanBoost setting for those ASICs
+	 * which do not support it
+	 */
+	if (skutable->MGpuAcousticLimitRpmThreshold == 0)
+		return 0;
+
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_SetMGpuFanBoostLimitRpm,
+					       0,
+					       NULL);
+}
+
+static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
+	.get_allowed_feature_mask = smu_v13_0_0_get_allowed_feature_mask,
+	.set_default_dpm_table = smu_v13_0_0_set_default_dpm_table,
+	.is_dpm_running = smu_v13_0_0_is_dpm_running,
+	.dump_pptable = smu_v13_0_0_dump_pptable,
+	.init_microcode = smu_v13_0_init_microcode,
+	.load_microcode = smu_v13_0_load_microcode,
+	.init_smc_tables = smu_v13_0_0_init_smc_tables,
+	.init_power = smu_v13_0_init_power,
+	.fini_power = smu_v13_0_fini_power,
+	.check_fw_status = smu_v13_0_check_fw_status,
+	.setup_pptable = smu_v13_0_0_setup_pptable,
+	.check_fw_version = smu_v13_0_check_fw_version,
+	.write_pptable = smu_cmn_write_pptable,
+	.set_driver_table_location = smu_v13_0_set_driver_table_location,
+	.system_features_control = smu_v13_0_0_system_features_control,
+	.set_allowed_mask = smu_v13_0_set_allowed_mask,
+	.get_enabled_mask = smu_cmn_get_enabled_mask,
+	.dpm_set_vcn_enable = smu_v13_0_set_vcn_enable,
+	.dpm_set_jpeg_enable = smu_v13_0_set_jpeg_enable,
+	.get_dpm_ultimate_freq = smu_v13_0_get_dpm_ultimate_freq,
+	.get_vbios_bootup_values = smu_v13_0_get_vbios_bootup_values,
+	.read_sensor = smu_v13_0_0_read_sensor,
+	.feature_is_enabled = smu_cmn_feature_is_enabled,
+	.print_clk_levels = smu_v13_0_0_print_clk_levels,
+	.force_clk_levels = smu_v13_0_0_force_clk_levels,
+	.update_pcie_parameters = smu_v13_0_0_update_pcie_parameters,
+	.get_thermal_temperature_range = smu_v13_0_0_get_thermal_temperature_range,
+	.register_irq_handler = smu_v13_0_register_irq_handler,
+	.enable_thermal_alert = smu_v13_0_enable_thermal_alert,
+	.disable_thermal_alert = smu_v13_0_disable_thermal_alert,
+	.notify_memory_pool_location = smu_v13_0_notify_memory_pool_location,
+	.get_gpu_metrics = smu_v13_0_0_get_gpu_metrics,
+	.set_soft_freq_limited_range = smu_v13_0_set_soft_freq_limited_range,
+	.init_pptable_microcode = smu_v13_0_init_pptable_microcode,
+	.populate_umd_state_clk = smu_v13_0_0_populate_umd_state_clk,
+	.set_performance_level = smu_v13_0_set_performance_level,
+	.gfx_off_control = smu_v13_0_gfx_off_control,
+	.get_unique_id = smu_v13_0_0_get_unique_id,
+	.get_fan_speed_pwm = smu_v13_0_0_get_fan_speed_pwm,
+	.get_fan_speed_rpm = smu_v13_0_0_get_fan_speed_rpm,
+	.set_fan_speed_pwm = smu_v13_0_set_fan_speed_pwm,
+	.set_fan_speed_rpm = smu_v13_0_set_fan_speed_rpm,
+	.get_fan_control_mode = smu_v13_0_get_fan_control_mode,
+	.set_fan_control_mode = smu_v13_0_set_fan_control_mode,
+	.enable_mgpu_fan_boost = smu_v13_0_0_enable_mgpu_fan_boost,
+};
+
+void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu)
+{
+	smu->ppt_funcs = &smu_v13_0_0_ppt_funcs;
+	smu->message_map = smu_v13_0_0_message_map;
+	smu->clock_map = smu_v13_0_0_clk_map;
+	smu->feature_map = smu_v13_0_0_feature_mask_map;
+	smu->table_map = smu_v13_0_0_table_map;
+	smu->pwr_src_map = smu_v13_0_0_pwr_src_map;
+	smu->workload_map = smu_v13_0_0_workload_map;
+}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h
new file mode 100644
index 000000000000..ede494856dbd
--- /dev/null
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.h
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+#ifndef __SMU_V13_0_0_PPT_H__
+#define __SMU_V13_0_0_PPT_H__
+
+extern void smu_v13_0_0_set_ppt_funcs(struct smu_context *smu);
+
+#endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
index 622881ab34c7..1274c794a776 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -581,6 +581,17 @@ bool smu_cmn_clk_dpm_is_enabled(struct smu_context *smu,
 	case SMU_SOCCLK:
 		feature_id = SMU_FEATURE_DPM_SOCCLK_BIT;
 		break;
+	case SMU_VCLK:
+	case SMU_VCLK1:
+		feature_id = SMU_FEATURE_DPM_VCLK_BIT;
+		break;
+	case SMU_DCLK:
+	case SMU_DCLK1:
+		feature_id = SMU_FEATURE_DPM_DCLK_BIT;
+		break;
+	case SMU_FCLK:
+		feature_id = SMU_FEATURE_DPM_FCLK_BIT;
+		break;
 	default:
 		return true;
 	}
-- 
2.35.1

