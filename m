Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A8509329
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Apr 2022 00:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3F10F100;
	Wed, 20 Apr 2022 22:47:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A910F100
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Apr 2022 22:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZEqX1u+tsSe3LQAGAWwqgBiuz8OYVbtRPM1SSY2RkpK7oGUK8sHOUjkO694xbLuDPTFEazY0X4HZlxexCZ3bphsi066R7V6AocIU9Ab884Coo9eulSXg0pvRv8dkeYptDt58rduqiSnP1gzdFcAKokeASTCNtN9XDX/GvRWainiQcktn6FMakymqr83AYVLnk0p/432Ozxnyjf4y6wD/HuwdtMi2edW3EM6JiEeXyBhm8QH/MEeHSXriViBHnwHE1o/feAeQ8+3ruRol9AhQQnixCrR99/vCZF3p9F4Ms3C/EHiSY4RidlenZJzdbJj+PObGT4dKBYWPde6Fsp84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7rdBDfUSUdhU3X63W5pMcOTxz7FY1os4a4Bk3a0EYI=;
 b=eAdWZdofdHiR15LW2OuqwShEHDw56XtNWmViSea6eb4pQUOdGLPC591NCDXGDVWIoTHR78x8pR92727no1guEx9oW3MycTGqsYnlT4XnFAmude4QayB49xyiBho5+W9DkkPcveKfb9CSzZtbgcg0pSc/Y8XOKlrE6Qiy0lk9bhs3I9BgkjUvOuc/2tssx20POletTT8xKg0RC48pAe0xhBUeymTHaqWfKEwLZHLcHlPiZ/ABwRgehOpQHdeuZ2kdeZZvgM6QqTyR6q09tblGZt9EXzkKCibIFhj1IW2gyMs4A7buuo1fx401EerdSdu9szmTqhhsc52pWvAr0W1G5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7rdBDfUSUdhU3X63W5pMcOTxz7FY1os4a4Bk3a0EYI=;
 b=M8UR9w6OOIJ9OKtLJVcAqtoIpsvwf47Hsk+nOgnHneaYsQSigt75p3gNVaiT/A8bGzdRb+tYqdv7BkxK8D4bqpC06kpIw8odV61tdefmHvHEAYwv3qnLB/YRsxRivV2NRaV2DXeZ7HuhiWroxL4LABwtu55+fJ7Ux7exnWbMc6I=
Received: from MW4PR03CA0014.namprd03.prod.outlook.com (2603:10b6:303:8f::19)
 by CY4PR12MB1704.namprd12.prod.outlook.com (2603:10b6:903:11d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 22:47:49 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::ff) by MW4PR03CA0014.outlook.office365.com
 (2603:10b6:303:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14 via Frontend
 Transport; Wed, 20 Apr 2022 22:47:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 22:47:49 +0000
Received: from AWS-Host-01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Apr
 2022 17:47:48 -0500
From: Bokun Zhang <Bokun.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/3 v3] drm/amd/amdgpu: Properly indent PF2VF header
Date: Wed, 20 Apr 2022 18:47:24 -0400
Message-ID: <20220420224723.275053-1-Bokun.Zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 499c72a8-be7a-4a40-9087-08da231fcbba
X-MS-TrafficTypeDiagnostic: CY4PR12MB1704:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1704C27C2CEAACF298E9F8DEF4F59@CY4PR12MB1704.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YC33JWa9BThm5nB07FViFSU7U15YuJJd3Lr9BSXtaitTrabk6CWLrVsKzolQeuT0WbYRRTFUI2tdVBlB8J5eHy7YGVx2G8V4Ai1XIFtkjtg5QHYfIcgwpGDiNG5NiNaLzf6L/xp8lnLsUz8Sl/gMLTtkJhq64wxhxsFmJuV+39KMoA6HE9sbit6vbnezNq/iHFfkvgilVYwbhm13aqQbOFOXcDq113ELZAhBMlSGwkRbcwVd26Bf0qLpSmFsrqC5/Ejzcz4FNrHs1/ji75+fqQ4j4VT3WPBbOVqjy6StA0wsLNSQJs4bO8w/s8u5lGa0BkeW4Q7sAiR1J23XiElPppnqyV2XagCsg4G62nnT6lTR8fmHzUR8Qr7EjGORDtjh8ooMNnEd+iCxkx5oy45IeBXEsYnTEpYr9JzKtdNM34Pn4S7FdpAsAaVG922jztac/8eKtHc9mw+hIuQHZBCcAmwm/SXPQtPFQc+hebM4Ga3PU69VdiSnjKCRYHX9ZSqcjQaNx/aDkRJ8qih5ghNTYPYS0/JUmL0E2hlEfqp+CyXaE9d3NOua80HzapuwbEg6f0/rRW7TSBCfdHDgiOIPdLncACNVFbiXIRkjg9rtfd4MiLvF7GeAenGCVzoUlijT22R7I8Z+Wlfe70R0P8fniim7Oyl2/5UU2ahpkfnII4Nnv7thgvt7WY2o2KscpBSIMnjwtTBWbAnivk7ttRC4KA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(7696005)(6666004)(336012)(26005)(426003)(186003)(47076005)(2616005)(1076003)(16526019)(6916009)(83380400001)(316002)(4326008)(36860700001)(36756003)(508600001)(5660300002)(70586007)(81166007)(82310400005)(8936002)(86362001)(356005)(40460700003)(2906002)(70206006)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 22:47:49.3431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 499c72a8-be7a-4a40-9087-08da231fcbba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1704
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
Cc: Bokun Zhang <Bokun.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- Clean up the identation in the header file

Signed-off-by: Bokun Zhang <Bokun.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h | 70 ++++++++++-----------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
index 059be32638ac..65433cbb00c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h
@@ -24,10 +24,10 @@
 #define AMDGV_SRIOV_MSG__H_
 
 /* unit in kilobytes */
-#define AMD_SRIOV_MSG_VBIOS_OFFSET              0
-#define AMD_SRIOV_MSG_VBIOS_SIZE_KB             64
-#define AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB    AMD_SRIOV_MSG_VBIOS_SIZE_KB
-#define AMD_SRIOV_MSG_DATAEXCHANGE_SIZE_KB      4
+#define AMD_SRIOV_MSG_VBIOS_OFFSET	     0
+#define AMD_SRIOV_MSG_VBIOS_SIZE_KB	     64
+#define AMD_SRIOV_MSG_DATAEXCHANGE_OFFSET_KB AMD_SRIOV_MSG_VBIOS_SIZE_KB
+#define AMD_SRIOV_MSG_DATAEXCHANGE_SIZE_KB   4
 
 /*
  * layout
@@ -50,10 +50,10 @@
  * v2 defined in amdgim
  * v3 current
  */
-#define AMD_SRIOV_MSG_FW_VRAM_PF2VF_VER			2
-#define AMD_SRIOV_MSG_FW_VRAM_VF2PF_VER			3
+#define AMD_SRIOV_MSG_FW_VRAM_PF2VF_VER 2
+#define AMD_SRIOV_MSG_FW_VRAM_VF2PF_VER 3
 
-#define AMD_SRIOV_MSG_RESERVE_UCODE		24
+#define AMD_SRIOV_MSG_RESERVE_UCODE 24
 
 #define AMD_SRIOV_MSG_RESERVE_VCN_INST 4
 
@@ -82,19 +82,19 @@ enum amd_sriov_ucode_engine_id {
 	AMD_SRIOV_UCODE_ID__MAX
 };
 
-#pragma pack(push, 1) 	// PF2VF / VF2PF data areas are byte packed
+#pragma pack(push, 1) // PF2VF / VF2PF data areas are byte packed
 
 union amd_sriov_msg_feature_flags {
 	struct {
-		uint32_t  error_log_collect  : 1;
-		uint32_t  host_load_ucodes   : 1;
-		uint32_t  host_flr_vramlost  : 1;
-		uint32_t  mm_bw_management   : 1;
-		uint32_t  pp_one_vf_mode     : 1;
-		uint32_t  reg_indirect_acc   : 1;
-		uint32_t  reserved           : 26;
+		uint32_t error_log_collect : 1;
+		uint32_t host_load_ucodes  : 1;
+		uint32_t host_flr_vramlost : 1;
+		uint32_t mm_bw_management  : 1;
+		uint32_t pp_one_vf_mode	   : 1;
+		uint32_t reg_indirect_acc  : 1;
+		uint32_t reserved	   : 26;
 	} flags;
-	uint32_t      all;
+	uint32_t all;
 };
 
 union amd_sriov_reg_access_flags {
@@ -109,10 +109,10 @@ union amd_sriov_reg_access_flags {
 
 union amd_sriov_msg_os_info {
 	struct {
-		uint32_t  windows            : 1;
-		uint32_t  reserved           : 31;
+		uint32_t windows  : 1;
+		uint32_t reserved : 31;
 	} info;
-	uint32_t      all;
+	uint32_t all;
 };
 
 struct amd_sriov_msg_uuid_info {
@@ -203,7 +203,7 @@ struct amd_sriov_msg_pf2vf_info {
 	} mm_bw_management[AMD_SRIOV_MSG_RESERVE_VCN_INST];
 	/* UUID info */
 	struct amd_sriov_msg_uuid_info uuid_info;
-	/* pcie atomic Ops info */
+	/* PCIE atomic ops support flag */
 	uint32_t pcie_atomic_ops_enabled_flags;
 	/* reserved */
 	uint32_t reserved[256 - 48];
@@ -223,7 +223,7 @@ struct amd_sriov_msg_vf2pf_info {
 	struct amd_sriov_msg_vf2pf_info_header header;
 	uint32_t checksum;
 	/* driver version */
-	uint8_t  driver_version[64];
+	uint8_t driver_version[64];
 	/* driver certification, 1=WHQL, 0=None */
 	uint32_t driver_cert;
 	/* guest OS type and version */
@@ -257,13 +257,14 @@ struct amd_sriov_msg_vf2pf_info {
 	uint32_t fb_size;
 	/* guest ucode data, each one is 1.25 Dword */
 	struct {
-		uint8_t  id;
+		uint8_t id;
 		uint32_t version;
 	} ucode_info[AMD_SRIOV_MSG_RESERVE_UCODE];
+	/* dummy page addr */
 	uint64_t dummy_page_addr;
 
 	/* reserved */
-	uint32_t reserved[256-70];
+	uint32_t reserved[256 - 70];
 };
 
 /* mailbox message send from guest to host  */
@@ -275,7 +276,8 @@ enum amd_sriov_mailbox_request_message {
 	MB_REQ_MSG_REQ_GPU_RESET_ACCESS,
 	MB_REQ_MSG_REQ_GPU_INIT_DATA,
 
-	MB_REQ_MSG_LOG_VF_ERROR       = 200,
+	MB_REQ_MSG_LOG_VF_ERROR = 200,
+	MB_REQ_MSG_READY_TO_RESET = 201,
 };
 
 /* mailbox message send from host to guest  */
@@ -297,17 +299,15 @@ enum amd_sriov_gpu_init_data_version {
 	GPU_INIT_DATA_READY_V1 = 1,
 };
 
-#pragma pack(pop)	// Restore previous packing option
+#pragma pack(pop) // Restore previous packing option
 
 /* checksum function between host and guest */
-unsigned int amd_sriov_msg_checksum(void *obj,
-				unsigned long obj_size,
-				unsigned int key,
-				unsigned int checksum);
+unsigned int amd_sriov_msg_checksum(void *obj, unsigned long obj_size, unsigned int key,
+				    unsigned int checksum);
 
 /* assertion at compile time */
 #ifdef __linux__
-#define stringification(s) _stringification(s)
+#define stringification(s)  _stringification(s)
 #define _stringification(s) #s
 
 _Static_assert(
@@ -318,13 +318,11 @@ _Static_assert(
 	sizeof(struct amd_sriov_msg_pf2vf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
 	"amd_sriov_msg_pf2vf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
 
-_Static_assert(
-	AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
-	"AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
+_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
+	       "AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
 
-_Static_assert(
-	AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
-	"AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than AMD_SRIOV_UCODE_ID__MAX");
+_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
+	       "AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than AMD_SRIOV_UCODE_ID__MAX");
 
 #undef _stringification
 #undef stringification
-- 
2.25.1

