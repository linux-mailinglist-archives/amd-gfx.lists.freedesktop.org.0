Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE476FE640
	for <lists+amd-gfx@lfdr.de>; Wed, 10 May 2023 23:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD3110E54D;
	Wed, 10 May 2023 21:26:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0451310E54D
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 May 2023 21:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhUp8g8KLoglUQ8fz+fTMHOvxn2w+jO+hwjQbyuIVP6Y3k4XIcUzqXn35XTwPCYKA1fHl9oGFFAZVCfvFUzaOlZwRv7sxlJQdLQlJu4pTkRK2IOn5+DaBL3VjO4vFqUt53yb+1yrW3fqB62cSQiRmhe2HDDeQLgShe4RckvTB79BRq6AqkTsT/ltaUwk3llA9Xdy1jCMLXvFZTTnH3Tmj/o2IpxpXyVUHg87BXrO2baS8B4Hq/yToQAYGLyLzYhB39+jW8cOmI6tW4ROmvoeBaW8hYPVZNCAnvx6URyrBOquKbopSHTrikhPWQWDZEygQlIlnlsX8YhzUltY2L4gzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXY/9QCM6yv/AR9xyhX0bb0RXgawstqNqBhfTQq8oPw=;
 b=ldnNeDM/gbrbWs4nfG1ceg7PzwiczprAx2zMBnyGg4f6kg7MUcYjA1iwG2FEkNzcwpDqKHmlQT2U9XqpS1bZMHG2HjfxF6I7xoxxYbSu3OMPoEA1+mHNdf1j3z4zlA2TqkD9Ibo1E9G0mUATO72t8UpfFq9prBHeqUts5TwbUn0LFodMnI2l4iaR6aLyv8d8XLzpsuaNmdOJjpQDQpo0ARYfi1XBLfxp/Ut7CRUg8SwmrtnC0vlOit4i01R6Qb1dOLusHwOvAXZ+veMSpml9oPX72L1X7Cjtlby46ALCAd61TT+h/1Tc22ilZ4JhXfkMmypsQ21DEkFnaLSVeSCqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXY/9QCM6yv/AR9xyhX0bb0RXgawstqNqBhfTQq8oPw=;
 b=5PTcFxsv+Bup65OQm01QiR7YbuAS0kUPorpkh9Dzv2VmhxrjX2GXEApCzUfpPg4bR73emrNmXdGQewUNXZGF3OTzLDnJI+S2LyMw9lylYA34B9/EZ+lBcrOOrDcTtNx34qSx4bdyFEjlx9VsL8xZ1fjRWjsUcRdOG8p8OG4G/bs=
Received: from SJ0PR03CA0161.namprd03.prod.outlook.com (2603:10b6:a03:338::16)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1ef::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 21:26:38 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:338:cafe::a4) by SJ0PR03CA0161.outlook.office365.com
 (2603:10b6:a03:338::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Wed, 10 May 2023 21:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.21 via Frontend Transport; Wed, 10 May 2023 21:26:37 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 10 May
 2023 16:26:36 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/5] drm/amdgpu: convert logical instance mask to physical one
Date: Wed, 10 May 2023 17:26:20 -0400
Message-ID: <20230510212624.2071771-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 0119b99d-046a-4fe1-d754-08db519d3d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NMDFDBsw+wiCygpOGyvf7crFiNBfnmfF/OKo4L/2g7iAqPC/A+KFu4MVsC5C3hfWCnkYm7Tei5GiNQFMk8jp7etBlu+wMuKX84XH9hdUbnsRVZJHEOTTNU4KTpmHYyRutf8mkm3j671zG6Nxmo7dOm1qtaN7jXczkkeAlI9XjgzS5owP0Acbls9AJbdLYFDGDU+Dv6R1X0opBAVNmyOlvqhGfqvpxZjXkNethIInl2FImMmvYJjVKQpMobHjTDbk80iSNKOYkA4gLj4T+GaF2Bwg3CVBG4UFrRWFve5JIGBsx3ZktB1m2oCrTIe3378w7xW9lZ/WkAzSSxCSPr7JsAiIyuWDnb02DjMrOyeszY5L8+BYX8fAD39AoXyp5wi7oi1rLpCw+bFvYndgy3EUR0xjF+Jn2HIiQ2MYQCH22cZJxD0MpHSg7fCAVKunJRQmNuCgI6J50zFAPiWczHhkneZ3EcCnyW6Gy/Ux6592L/e1fYwI7ecc3xRixHl1EhKG+J52y0h0weDbWBkj2lnK2aT1iS88HgG+2/5krJxc4O2knKtEYs3nWmP/0a8z8ycBtmFIMET1r3zkcivIMd4mTWZELZWs+kQrZT+2bjP4nhjQEC0+Gchudjcqn+1VP9gM7ssnWuhQWJnrkhySpenweYJCmvBloimNtQSh8m3pqrpxqbuVpTTuY9KF9j3wKVQqPUGw+56alhWP68wT7gkdFpGcxm0+L0bC/5OQhBOcwts=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(426003)(83380400001)(336012)(47076005)(2616005)(36860700001)(5660300002)(8676002)(36756003)(82740400003)(1076003)(26005)(186003)(16526019)(40480700001)(54906003)(478600001)(70586007)(86362001)(6666004)(2906002)(82310400005)(70206006)(4326008)(6916009)(8936002)(81166007)(41300700001)(356005)(40460700003)(316002)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 21:26:37.6871 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0119b99d-046a-4fe1-d754-08db519d3d03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 "Stanley . Yang" <Stanley.Yang@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

Convert instance mask for the convenience of RAS TA.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Stanley.Yang <Stanley.Yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h            |  6 ++++--
 .../drm/amd/amdgpu/aqua_vanjaram_reg_init.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc15_common.h      |  7 ++++++-
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 4fb43baddf96..22f1e197cc09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -698,12 +698,14 @@ enum amd_hw_ip_block_type {
 #define IP_VERSION_REV(ver) ((ver) & 0xFF)
 
 struct amdgpu_ip_map_info {
-	/* Map of logical to actual dev instances */
+	/* Map of logical to actual dev instances/mask */
 	uint32_t 		dev_inst[MAX_HWIP][HWIP_MAX_INSTANCE];
 	int8_t (*logical_to_dev_inst)(struct amdgpu_device *adev,
 				      enum amd_hw_ip_block_type block,
 				      int8_t inst);
-
+	uint32_t (*logical_to_dev_mask)(struct amdgpu_device *adev,
+					enum amd_hw_ip_block_type block,
+					uint32_t mask);
 };
 
 struct amd_powerplay {
diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
index 93e9f947a85d..68d1a0fc5f5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
+++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram_reg_init.c
@@ -229,6 +229,23 @@ static int8_t aqua_vanjaram_logical_to_dev_inst(struct amdgpu_device *adev,
 	return dev_inst;
 }
 
+static uint32_t aqua_vanjaram_logical_to_dev_mask(struct amdgpu_device *adev,
+					 enum amd_hw_ip_block_type block,
+					 uint32_t mask)
+{
+	uint32_t dev_mask = 0;
+	int8_t log_inst, dev_inst;
+
+	while (mask) {
+		log_inst = ffs(mask) - 1;
+		dev_inst = aqua_vanjaram_logical_to_dev_inst(adev, block, log_inst);
+		dev_mask |= (1 << dev_inst);
+		mask &= ~(1 << log_inst);
+	}
+
+	return dev_mask;
+}
+
 static void aqua_vanjaram_populate_ip_map(struct amdgpu_device *adev,
 					  enum amd_hw_ip_block_type ip_block,
 					  uint32_t inst_mask)
@@ -257,6 +274,7 @@ void aqua_vanjaram_ip_map_init(struct amdgpu_device *adev)
 		aqua_vanjaram_populate_ip_map(adev, ip_map[i][0], ip_map[i][1]);
 
 	adev->ip_map.logical_to_dev_inst = aqua_vanjaram_logical_to_dev_inst;
+	adev->ip_map.logical_to_dev_mask = aqua_vanjaram_logical_to_dev_mask;
 }
 
 /* Fixed pattern for smn addressing on different AIDs:
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15_common.h b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
index 3730c5ec202f..96948a59f8dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15_common.h
+++ b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
@@ -25,7 +25,12 @@
 #define __SOC15_COMMON_H__
 
 /* GET_INST returns the physical instance corresponding to a logical instance */
-#define GET_INST(ip, inst) (adev->ip_map.logical_to_dev_inst? adev->ip_map.logical_to_dev_inst(adev, ip##_HWIP, inst): inst)
+#define GET_INST(ip, inst) \
+	(adev->ip_map.logical_to_dev_inst ? \
+	adev->ip_map.logical_to_dev_inst(adev, ip##_HWIP, inst) : inst)
+#define GET_MASK(ip, mask) \
+	(adev->ip_map.logical_to_dev_mask ? \
+	adev->ip_map.logical_to_dev_mask(adev, ip##_HWIP, mask) : mask)
 
 /* Register Access Macros */
 #define SOC15_REG_OFFSET(ip, inst, reg)	(adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg)
-- 
2.40.1

