Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F6C71122A
	for <lists+amd-gfx@lfdr.de>; Thu, 25 May 2023 19:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0810E6E3;
	Thu, 25 May 2023 17:28:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6209610E6DD;
 Thu, 25 May 2023 17:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXPbNrWreFwDx+kfIcjewLt29tR3A8oidZQK29OBqCAl6tbuqiU93tfIDcwJ604Jr9AQgEngBi+C6OLaF/enTB1Q8UlUiW0loGWp5nGR9wyke16d5BQtxRyPwBZ41vr9ED8IF5l++XQ35KcgNtvCbSv147doSHNKqXDILV3iAjP0GPXtKYbRM5ZEW5HOwQHwVJsp4UNGdcmkZA+L6vvudFE486zcdAaq3ZJ2r8cdgcLNYtKAnAIQKnlSaopNoNdLDps2uNNwuhCq0+U3lhomCqubQyxn8RbGDh+m0OOun8j8c463MPZcqKr9834RFyLG6TQm99qHrOgiEoQaHY/x8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9qsWTOAxVFfkWZwgAFaRK3Zzpe+hivWtQbu9cTbMak=;
 b=iu6q0RT0zvE7t4bB/q4V0JrlKZ7yxVbyvm74H5fL2ueJJJOL/ei2m7JnHeDt+j4y90sKNhyYEwpcIbi0AuVL7QN37RbOkN8MFOmhK0foynqm0eCrubGFUbInVgxPsWr15I18XK+dF48HuiBc9KhhYq8/DI0qmY2lq1BNpb6uewZiqOPKXC8w4glFDSWFW/W3HXGNGWxrCBu3dv0PZrGjI6IRSjmOZIZf+KeGp8wfyVKcQjjWwqZ4N3ZZZu+jttkXNVQH7FEiKS5dxRhI3YZydk6UCliSAcdzanqgkd3JLJ2p8Z/eDJebXVpYiyUPuMW61rylfHtBedk8y/Yx2HufRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9qsWTOAxVFfkWZwgAFaRK3Zzpe+hivWtQbu9cTbMak=;
 b=yZGZ5oA2uSTBJnrAZN+1RPmYPgc5cMYZcp+M0t/OBx1h3FcsRW+cGSztqxmHoV8CPpOac9bKepkLARQ4gFzTN8/iXyNXiLoVyZY3MKnLjM1YmtxicPf2o/6f7sPsXtZsfAARlcApi0DJPzrDZ8XcWg2iC6W8u8SVpPH0VBX6I78=
Received: from MW4PR03CA0134.namprd03.prod.outlook.com (2603:10b6:303:8c::19)
 by DM6PR12MB5005.namprd12.prod.outlook.com (2603:10b6:5:1be::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:27:59 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::97) by MW4PR03CA0134.outlook.office365.com
 (2603:10b6:303:8c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 17:27:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 17:27:59 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:27:55 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <Felix.Kuehling@amd.com>
Subject: [PATCH 05/33] drm/amdgpu: setup hw debug registers on driver
 initialization
Date: Thu, 25 May 2023 13:27:17 -0400
Message-ID: <20230525172745.702700-5-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230525172745.702700-1-jonathan.kim@amd.com>
References: <20230525172745.702700-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|DM6PR12MB5005:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8ad002-a0f0-4ab6-1468-08db5d4562da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wXKOUXUTJf7y+VUU/0nXLkdWD0rqYAW9ZN2U1E8Jl5jS5KViI2kp+pmGOHVpEnOomBt/Yhea0jo41fDPiBZZkq6t0oqQyZbOTVUD+CmDBiJPDpLbhQwYTSdtTATQ0sGNq/5hBdWCdxlwlPuvC1b64jwJ9T2l4Xwc4EE0mOi19a9u2UOf4PKoMx6V8sSze8OxKbsjzNgxp83LCRovle4UdYUThEFicNG+ahgF+Wu+kPmUQJgngmdnX2/30kDB+rlIuSXTSG/OoXSXHugAF2eBrZ5z7+3Sl8Ax5ySrHtGVIZFkKSjv+obIVIEm9gW5Y3tyzihmfN9jd8QuKQh/hVVXvpBBKn9pWep+qbDDGjmNEOxib+wm84zRNP6uSJ4/y8wcRD56XXnPTZ9ZmgTEWhP4jEEmoUAJIwOLovVwICEhPtUxx8MvgytyniIFTb0EaN3TlE2HhWgb/kRh+zAD+GwqgNMNUCcK8sWKTmPCfEOUV9NZPn8/om9tZFwRf7lEmNyiTMtXHtZdtAZmIxNLNHoV4ymlfNllAtRi57jJHg88dafoxQhFb2roVy8VEJ5IuONAehdwn/RoncxBPNLnnfP6AG3lqkLMAHHhoVXv16tefwbi4bwE2aCkEgh5pTgcbUmHfDNsrr3FDScDLOYp6WHET5gBh0zhe/4aci99HBGYkvedede5DsI1YsNbXRTV+bhXZ/ZwwxFbqBqhaJNDPbgYyuoqjw6jAYav4BAO59nyf6FM1fdmKvQ5ekzrhFzetXmlDIsFdv+g+r6pVUAb7k9Xag==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(6666004)(41300700001)(7696005)(83380400001)(47076005)(336012)(426003)(36860700001)(30864003)(2906002)(186003)(16526019)(82310400005)(26005)(2616005)(86362001)(1076003)(356005)(82740400003)(81166007)(40480700001)(5660300002)(44832011)(36756003)(8676002)(8936002)(450100002)(70206006)(4326008)(6636002)(110136005)(478600001)(70586007)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:27:59.4236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8ad002-a0f0-4ab6-1468-08db5d4562da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5005
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add missing debug trap registers references and initialize all debug
registers on boot by clearing the hardware exception overrides and the
wave allocation ID index.

The debugger requires that TTMPs 6 & 7 save the dispatch ID to map
waves onto dispatch during compute context inspection.
In order to correctly set this up, set the special reserved CP bit by
default whenever the MQD is initailized.

v2: add missing 0-init of SPI_GDBG_TRAP_DATA0/1

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 26 +++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         | 30 ++++++++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c       |  3 +
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c  |  5 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c  |  5 ++
 .../gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c   |  5 ++
 .../include/asic_reg/gc/gc_10_1_0_offset.h    | 14 ++++
 .../include/asic_reg/gc/gc_10_1_0_sh_mask.h   | 69 +++++++++++++++++++
 .../include/asic_reg/gc/gc_10_3_0_offset.h    | 10 +++
 .../include/asic_reg/gc/gc_10_3_0_sh_mask.h   |  4 ++
 .../include/asic_reg/gc/gc_11_0_0_sh_mask.h   |  4 ++
 12 files changed, 176 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index f7ad883a70fa..be984f8c71c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4825,6 +4825,29 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
 
 #define DEFAULT_SH_MEM_BASES	(0x6000)
 
+static void gfx_v10_0_debug_trap_config_init(struct amdgpu_device *adev,
+				uint32_t first_vmid,
+				uint32_t last_vmid)
+{
+	uint32_t data;
+	uint32_t trap_config_vmid_mask = 0;
+	int i;
+
+	/* Calculate trap config vmid mask */
+	for (i = first_vmid; i < last_vmid; i++)
+		trap_config_vmid_mask |= (1 << i);
+
+	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
+			VMID_SEL, trap_config_vmid_mask);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+			TRAP_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
+}
+
 static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
 {
 	int i;
@@ -4856,6 +4879,9 @@ static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
 		WREG32_SOC15_OFFSET(GC, 0, mmGDS_GWS_VMID0, i, 0);
 		WREG32_SOC15_OFFSET(GC, 0, mmGDS_OA_VMID0, i, 0);
 	}
+
+	gfx_v10_0_debug_trap_config_init(adev, adev->vm_manager.first_kfd_vmid,
+					AMDGPU_NUM_VMID);
 }
 
 static void gfx_v10_0_init_gds_vmid(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index da21bf868080..690e121d9dda 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1638,6 +1638,7 @@ static void gfx_v11_0_init_compute_vmid(struct amdgpu_device *adev)
 		/* Enable trap for each kfd vmid. */
 		data = RREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL);
 		data = REG_SET_FIELD(data, SPI_GDBG_PER_VMID_CNTL, TRAP_EN, 1);
+		WREG32_SOC15(GC, 0, regSPI_GDBG_PER_VMID_CNTL, data);
 	}
 	soc21_grbm_select(adev, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 0189e50bd89f..7f17e0061027 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2303,6 +2303,29 @@ static void gfx_v9_0_setup_rb(struct amdgpu_device *adev)
 	adev->gfx.config.num_rbs = hweight32(active_rbs);
 }
 
+static void gfx_v9_0_debug_trap_config_init(struct amdgpu_device *adev,
+				uint32_t first_vmid,
+				uint32_t last_vmid)
+{
+	uint32_t data;
+	uint32_t trap_config_vmid_mask = 0;
+	int i;
+
+	/* Calculate trap config vmid mask */
+	for (i = first_vmid; i < last_vmid; i++)
+		trap_config_vmid_mask |= (1 << i);
+
+	data = REG_SET_FIELD(0, SPI_GDBG_TRAP_CONFIG,
+			VMID_SEL, trap_config_vmid_mask);
+	data = REG_SET_FIELD(data, SPI_GDBG_TRAP_CONFIG,
+			TRAP_EN, 1);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_CONFIG), data);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_MASK), 0);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA0), 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, mmSPI_GDBG_TRAP_DATA1), 0);
+}
+
 #define DEFAULT_SH_MEM_BASES	(0x6000)
 static void gfx_v9_0_init_compute_vmid(struct amdgpu_device *adev)
 {
@@ -4602,6 +4625,13 @@ static int gfx_v9_0_late_init(void *handle)
 	if (r)
 		return r;
 
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
+		gfx_v9_4_2_debug_trap_config_init(adev,
+			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
+	else
+		gfx_v9_0_debug_trap_config_init(adev,
+			adev->vm_manager.first_kfd_vmid, AMDGPU_NUM_VMID);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
index 2cc3a7cb1f54..63f6843a069e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
@@ -771,6 +771,9 @@ void gfx_v9_4_2_debug_trap_config_init(struct amdgpu_device *adev,
 
 	soc15_grbm_select(adev, 0, 0, 0, 0, 0);
 	mutex_unlock(&adev->srbm_mutex);
+
+	WREG32(SOC15_REG_OFFSET(GC, 0, regSPI_GDBG_TRAP_DATA0), 0);
+	WREG32(SOC15_REG_OFFSET(GC, 0, regSPI_GDBG_TRAP_DATA1), 0);
 }
 
 void gfx_v9_4_2_set_power_brake_sequence(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
index 772c09b5821b..eaaa4f4ddaaa 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
@@ -117,6 +117,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_scheduler0 = 1 << 14;
+
 	if (q->format == KFD_QUEUE_FORMAT_AQL) {
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
index 632344b95d90..3a48bbc589fe 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
@@ -143,6 +143,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_status0 = 1 << 14;
+
 	/*
 	 * GFX11 RS64 CPFW version >= 509 supports PCIe atomics support
 	 * acknowledgment.
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
index 226132ec3714..b7c95158d4a0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c
@@ -182,6 +182,11 @@ static void init_mqd(struct mqd_manager *mm, void **mqd,
 			1 << CP_HQD_QUANTUM__QUANTUM_SCALE__SHIFT |
 			1 << CP_HQD_QUANTUM__QUANTUM_DURATION__SHIFT;
 
+	/* Set cp_hqd_hq_scheduler0 bit 14 to 1 to have the CP set up the
+	 * DISPATCH_PTR.  This is required for the kfd debugger
+	 */
+	m->cp_hqd_hq_status0 = 1 << 14;
+
 	if (q->format == KFD_QUEUE_FORMAT_AQL)
 		m->cp_hqd_aql_control =
 			1 << CP_HQD_AQL_CONTROL__CONTROL0__SHIFT;
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
index 79c41004c0b6..4908044f7409 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
@@ -5194,6 +5194,20 @@
 #define mmSPI_WCL_PIPE_PERCENT_CS6_BASE_IDX                                                            0
 #define mmSPI_WCL_PIPE_PERCENT_CS7                                                                     0x1f70
 #define mmSPI_WCL_PIPE_PERCENT_CS7_BASE_IDX                                                            0
+#define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
+#define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
+#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
+#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
+#define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
+#define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
+#define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
+#define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
+#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
+#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
+#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
+#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
 #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
 #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
 #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
index 52043e143067..9b7d219e7954 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_sh_mask.h
@@ -19700,6 +19700,75 @@
 //SPI_WCL_PIPE_PERCENT_CS7
 #define SPI_WCL_PIPE_PERCENT_CS7__VALUE__SHIFT                                                                0x0
 #define SPI_WCL_PIPE_PERCENT_CS7__VALUE_MASK                                                                  0x7FL
+//SPI_GDBG_WAVE_CNTL
+#define SPI_GDBG_WAVE_CNTL__STALL_RA__SHIFT                                                                   0x0
+#define SPI_GDBG_WAVE_CNTL__STALL_VMID__SHIFT                                                                 0x1
+#define SPI_GDBG_WAVE_CNTL__STALL_RA_MASK                                                                     0x00000001L
+#define SPI_GDBG_WAVE_CNTL__STALL_VMID_MASK                                                                   0x0001FFFEL
+//SPI_GDBG_TRAP_CONFIG
+#define SPI_GDBG_TRAP_CONFIG__ME_SEL__SHIFT                                                                   0x0
+#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL__SHIFT                                                                 0x2
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL__SHIFT                                                                0x4
+#define SPI_GDBG_TRAP_CONFIG__ME_MATCH__SHIFT                                                                 0x7
+#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH__SHIFT                                                               0x8
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH__SHIFT                                                              0x9
+#define SPI_GDBG_TRAP_CONFIG__TRAP_EN__SHIFT                                                                  0xf
+#define SPI_GDBG_TRAP_CONFIG__VMID_SEL__SHIFT                                                                 0x10
+#define SPI_GDBG_TRAP_CONFIG__ME_SEL_MASK                                                                     0x00000003L
+#define SPI_GDBG_TRAP_CONFIG__PIPE_SEL_MASK                                                                   0x0000000CL
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_SEL_MASK                                                                  0x00000070L
+#define SPI_GDBG_TRAP_CONFIG__ME_MATCH_MASK                                                                   0x00000080L
+#define SPI_GDBG_TRAP_CONFIG__PIPE_MATCH_MASK                                                                 0x00000100L
+#define SPI_GDBG_TRAP_CONFIG__QUEUE_MATCH_MASK                                                                0x00000200L
+#define SPI_GDBG_TRAP_CONFIG__TRAP_EN_MASK                                                                    0x00008000L
+#define SPI_GDBG_TRAP_CONFIG__VMID_SEL_MASK                                                                   0xFFFF0000L
+//SPI_GDBG_TRAP_MASK
+#define SPI_GDBG_TRAP_MASK__EXCP_EN__SHIFT                                                                    0x0
+#define SPI_GDBG_TRAP_MASK__REPLACE__SHIFT                                                                    0x9
+#define SPI_GDBG_TRAP_MASK__EXCP_EN_MASK                                                                      0x01FFL
+#define SPI_GDBG_TRAP_MASK__REPLACE_MASK                                                                      0x0200L
+//SPI_GDBG_WAVE_CNTL2
+#define SPI_GDBG_WAVE_CNTL2__VMID_MASK__SHIFT                                                                 0x0
+#define SPI_GDBG_WAVE_CNTL2__MODE__SHIFT                                                                      0x10
+#define SPI_GDBG_WAVE_CNTL2__VMID_MASK_MASK                                                                   0x0000FFFFL
+#define SPI_GDBG_WAVE_CNTL2__MODE_MASK                                                                        0x00030000L
+//SPI_GDBG_WAVE_CNTL3
+#define SPI_GDBG_WAVE_CNTL3__STALL_PS__SHIFT                                                                  0x0
+#define SPI_GDBG_WAVE_CNTL3__STALL_VS__SHIFT                                                                  0x1
+#define SPI_GDBG_WAVE_CNTL3__STALL_GS__SHIFT                                                                  0x2
+#define SPI_GDBG_WAVE_CNTL3__STALL_HS__SHIFT                                                                  0x3
+#define SPI_GDBG_WAVE_CNTL3__STALL_CSG__SHIFT                                                                 0x4
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS0__SHIFT                                                                 0x5
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS1__SHIFT                                                                 0x6
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS2__SHIFT                                                                 0x7
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS3__SHIFT                                                                 0x8
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS4__SHIFT                                                                 0x9
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS5__SHIFT                                                                 0xa
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS6__SHIFT                                                                 0xb
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS7__SHIFT                                                                 0xc
+#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION__SHIFT                                                            0xd
+#define SPI_GDBG_WAVE_CNTL3__STALL_MULT__SHIFT                                                                0x1c
+#define SPI_GDBG_WAVE_CNTL3__STALL_PS_MASK                                                                    0x00000001L
+#define SPI_GDBG_WAVE_CNTL3__STALL_VS_MASK                                                                    0x00000002L
+#define SPI_GDBG_WAVE_CNTL3__STALL_GS_MASK                                                                    0x00000004L
+#define SPI_GDBG_WAVE_CNTL3__STALL_HS_MASK                                                                    0x00000008L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CSG_MASK                                                                   0x00000010L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS0_MASK                                                                   0x00000020L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS1_MASK                                                                   0x00000040L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS2_MASK                                                                   0x00000080L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS3_MASK                                                                   0x00000100L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS4_MASK                                                                   0x00000200L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS5_MASK                                                                   0x00000400L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS6_MASK                                                                   0x00000800L
+#define SPI_GDBG_WAVE_CNTL3__STALL_CS7_MASK                                                                   0x00001000L
+#define SPI_GDBG_WAVE_CNTL3__STALL_DURATION_MASK                                                              0x0FFFE000L
+#define SPI_GDBG_WAVE_CNTL3__STALL_MULT_MASK                                                                  0x10000000L
+//SPI_GDBG_TRAP_DATA0
+#define SPI_GDBG_TRAP_DATA0__DATA__SHIFT                                                                      0x0
+#define SPI_GDBG_TRAP_DATA0__DATA_MASK                                                                        0xFFFFFFFFL
+//SPI_GDBG_TRAP_DATA1
+#define SPI_GDBG_TRAP_DATA1__DATA__SHIFT                                                                      0x0
+#define SPI_GDBG_TRAP_DATA1__DATA_MASK                                                                        0xFFFFFFFFL
 //SPI_COMPUTE_QUEUE_RESET
 #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
 #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
index a734abaa91a5..5e15ac14b63c 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
@@ -26,6 +26,8 @@
 #define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
 #define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x10B0
 #define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
+#define mmSQ_DEBUG                                                                                     0x10B1
+#define mmSQ_DEBUG_BASE_IDX                                                                            0
 
 // addressBlock: gc_sdma0_sdma0dec
 // base address: 0x4980
@@ -4853,10 +4855,18 @@
 #define mmSPI_WCL_PIPE_PERCENT_CS3_BASE_IDX                                                            0
 #define mmSPI_GDBG_WAVE_CNTL                                                                           0x1f71
 #define mmSPI_GDBG_WAVE_CNTL_BASE_IDX                                                                  0
+#define mmSPI_GDBG_TRAP_CONFIG                                                                         0x1f72
+#define mmSPI_GDBG_TRAP_CONFIG_BASE_IDX                                                                0
 #define mmSPI_GDBG_TRAP_MASK                                                                           0x1f73
 #define mmSPI_GDBG_TRAP_MASK_BASE_IDX                                                                  0
 #define mmSPI_GDBG_WAVE_CNTL2                                                                          0x1f74
 #define mmSPI_GDBG_WAVE_CNTL2_BASE_IDX                                                                 0
+#define mmSPI_GDBG_WAVE_CNTL3                                                                          0x1f75
+#define mmSPI_GDBG_WAVE_CNTL3_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA0                                                                          0x1f78
+#define mmSPI_GDBG_TRAP_DATA0_BASE_IDX                                                                 0
+#define mmSPI_GDBG_TRAP_DATA1                                                                          0x1f79
+#define mmSPI_GDBG_TRAP_DATA1_BASE_IDX                                                                 0
 #define mmSPI_COMPUTE_QUEUE_RESET                                                                      0x1f7b
 #define mmSPI_COMPUTE_QUEUE_RESET_BASE_IDX                                                             0
 #define mmSPI_RESOURCE_RESERVE_CU_0                                                                    0x1f7c
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
index d7a17bae2584..e4ecd6c2d20e 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
@@ -47907,6 +47907,10 @@
 
 
 // addressBlock: sqind
+//SQ_DEBUG
+#define SQ_DEBUG__SINGLE_MEMOP_MASK 0x00000001L
+#define SQ_DEBUG__SINGLE_MEMOP__SHIFT 0x00000000
+
 //SQ_DEBUG_STS_GLOBAL
 #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0_MASK 0x000000ffL
 #define SQ_DEBUG_STS_GLOBAL2__FIFO_LEVEL_GFX0__SHIFT 0x00000000
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
index 4f08f90856fc..3088a4a13cb5 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_11_0_0_sh_mask.h
@@ -17216,11 +17216,15 @@
 #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN__SHIFT                                                                0x3
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN__SHIFT                                                                0x4
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE__SHIFT                                                           0xd
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START__SHIFT                                                          0xe
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END__SHIFT                                                            0xf
 #define SPI_GDBG_PER_VMID_CNTL__STALL_VMID_MASK                                                               0x00000001L
 #define SPI_GDBG_PER_VMID_CNTL__LAUNCH_MODE_MASK                                                              0x00000006L
 #define SPI_GDBG_PER_VMID_CNTL__TRAP_EN_MASK                                                                  0x00000008L
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_EN_MASK                                                                  0x00001FF0L
 #define SPI_GDBG_PER_VMID_CNTL__EXCP_REPLACE_MASK                                                             0x00002000L
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_START_MASK                                                            0x00004000L
+#define SPI_GDBG_PER_VMID_CNTL__TRAP_ON_END_MASK                                                              0x00008000L
 //SPI_COMPUTE_QUEUE_RESET
 #define SPI_COMPUTE_QUEUE_RESET__RESET__SHIFT                                                                 0x0
 #define SPI_COMPUTE_QUEUE_RESET__RESET_MASK                                                                   0x01L
-- 
2.25.1

