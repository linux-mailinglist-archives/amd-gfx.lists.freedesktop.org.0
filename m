Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B053DFE5
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jun 2022 05:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C3F10ED4C;
	Mon,  6 Jun 2022 03:11:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A9110ED4C
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jun 2022 03:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvbCKnDJD1AU9DMa08VhmSWKPmL579wN/knnW9fAZ+UsLmhANuh338z9prPF89FRjwkC9/zbQJ87GOQKwyO7c5m9V9vQQUwQ0RSibmSabzNOGn9XlX3aEeIs1FvzeNW7KjVoqrqGxiaxq6veXnXaGrhinF8VIHNHaxPnWEUOrzy3U+GNZJ3LggzzZ482wJxZuyRWLT0BhWgUedxHrJ/+EOl4kxyoUDm5p0t9jik1oRHqGhJjdKCrJE1XMEz35QiAEkKvNm8C7q0+Z5H99P8TAR39OIp0/9fYmmd8JemiA4jQa7PnS3pPeDZmTh+4GwK5Pz1K3RILHhxlCkqNf0gaqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buK5sfPNbs3UVCJpoKThVH+LFy/sAiAGw9WslDJ2qNU=;
 b=k4kzULlbVpspg/bT9czrS+shO/x4xD4uc3NwlFvTxa0W02J3R8uweRzH/tP8QyFNm7bf9FLoJKkQ9X74B3MWblIU5m6H+O2du+bG/mDjXVxr4c5t4zywr7cgrZ7nB9einC3ckwEBeTHCmMrHtVk2jhnIz1TlBwWUE29GQg8OEM7suQnElIKZKYHwz2ejhtOdsIrI/7lHvbpuBD3zXf4vGuh9y6L1kXgYH8pye33nAr6w4BsCFSaAXKQYJu6gOyUx7i8ld6lBAfe20MS3S8kG9D0UlmURpExHdlbb4ISJZf9KL4iS4Ra8NYgKQdaeUoG0K4Qw5br3dtpLxutz3oUrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buK5sfPNbs3UVCJpoKThVH+LFy/sAiAGw9WslDJ2qNU=;
 b=egMnZNE21uII3529CR+M8riCuE66c7A/vFi5u8pEa2WUv34lO1P+JUV6oi0OpoAKiGqy+hojpmloVlwI1py2aKwvReanYDlWs+ukX4LhxHQuKWQtag2PjCOCuXhoAeSmHDXHKJm56J7Yw78qaFg1ff/LuG2gIPws/MvnBkK0iVE=
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by CY5PR12MB6250.namprd12.prod.outlook.com (2603:10b6:930:22::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 6 Jun
 2022 03:11:42 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::63) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Mon, 6 Jun 2022 03:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Mon, 6 Jun 2022 03:11:41 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sun, 5 Jun
 2022 22:11:39 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 1/6] drm/amdgpu: enable ASPM support for PCIE 7.4.0/7.6.0
Date: Mon, 6 Jun 2022 11:11:19 +0800
Message-ID: <20220606031124.1818265-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f7f6df-7601-4c82-0759-08da476a479e
X-MS-TrafficTypeDiagnostic: CY5PR12MB6250:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB6250F1048102F0C92D0ABCC2E4A29@CY5PR12MB6250.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyxbN58U3a4QeCHV4l7LJ28eM+Ge0rR+8RRhitAq7L4KiveZQJJHNs97ZK+rVtXXsRsQuvOmVyuzVn+3LOXHxEnMIP2i7qNqzc7v8WK200HGiSwhA576wghpKWAgTN5oY0l9YGM/oco+Lzo/iZudvT7YLt0h9D1/ESOMY/YdTR/TRDBUjBEimjSdnGvledw11wvY0lNx+9lkEXWsc/Vehl1D/DyXDi6j7kHDbtGuKbjsKYXs4FLZifDkFfbGHcot5RaxNtztzClC291gMgpJljK8cPX3DheMdXsVhZDLRVH0U0/JCvMYjur4AzOLRXIEkzQ5u+OHt6b+0bRu4+i2DPXvR05HvnfX2UfJSadAnzF2ZmMiPsAGhQNOSZuBoJGxBGsCevua7gbAEwERbESmqlZ3BC7H9fH7fZKEa0R3AOOrSzTR2RqE7QqR/qXmeLT7sQzlO7EhP0BEeRuog024aoxC9xXYq4Y3q2qzwjabir/x9DlJe83BGtyTmq0ryB8hJNN9Mv6sfSM8yNA/8KfRo2h1jlPcyLjx1ri/K+Q8s1h5zOS1V4rRacxBZWOXasigDLi6NKKappnHdKbL+dTiZaqSY3UAUG8pfd6cbKycWG5P1LsCdXZAovINTzcf0ZBZcJWD6on0d2i+oWTa02T+roHRt/SXtj/dlWklhY6QrRol0O4JZrWJvbshT6pqlW0DndCEhOZDQS8UHfHJbV9B9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(508600001)(83380400001)(336012)(426003)(36756003)(47076005)(81166007)(70586007)(8676002)(4326008)(6666004)(2906002)(5660300002)(70206006)(44832011)(2616005)(82310400005)(8936002)(16526019)(186003)(40460700003)(7696005)(86362001)(6916009)(316002)(54906003)(1076003)(26005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 03:11:41.8116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f7f6df-7601-4c82-0759-08da476a479e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6250
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
Cc: Alexander.Deucher@amd.com, Likun.Gao@amd.com, Lijo.Lazar@amd.com,
 Evan Quan <evan.quan@amd.com>, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Enable ASPM support for PCIE 7.4.0 and 7.6.0.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: Ib3b0e106ff43ad49f0f815e6eeb5c756b6bf4550
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   1 +
 drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c        | 109 ++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc21.c            |   7 +-
 .../include/asic_reg/nbio/nbio_4_3_0_offset.h |   2 +
 .../asic_reg/nbio/nbio_4_3_0_sh_mask.h        |   1 +
 6 files changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index dc938d4d8616..3eabca826c75 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -689,6 +689,7 @@ enum amd_hw_ip_block_type {
 	RSMU_HWIP,
 	XGMI_HWIP,
 	DCI_HWIP,
+	PCIE_HWIP,
 	MAX_HWIP
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 3996da88e1fa..44cea9649810 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -193,6 +193,7 @@ static int hw_id_map[MAX_HWIP] = {
 	[UMC_HWIP]	= UMC_HWID,
 	[XGMI_HWIP]	= XGMI_HWID,
 	[DCI_HWIP]	= DCI_HWID,
+	[PCIE_HWIP]	= PCIE_HWID,
 };
 
 static int amdgpu_discovery_read_binary_from_vram(struct amdgpu_device *adev, uint8_t *binary)
diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
index ed31d133f07a..add093b9aa79 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v4_3.c
@@ -344,6 +344,114 @@ static u32 nbio_v4_3_get_rom_offset(struct amdgpu_device *adev)
 	return rom_offset;
 }
 
+static void nbio_v4_3_program_ltr(struct amdgpu_device *adev)
+{
+	uint32_t def, data;
+
+	def = RREG32_SOC15(NBIO, 0, regRCC_EP_DEV0_0_EP_PCIE_TX_LTR_CNTL);
+	data = 0x35EB;
+	data &= ~EP_PCIE_TX_LTR_CNTL__LTR_PRIV_MSG_DIS_IN_PM_NON_D0_MASK;
+	data &= ~EP_PCIE_TX_LTR_CNTL__LTR_PRIV_RST_LTR_IN_DL_DOWN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_EP_DEV0_0_EP_PCIE_TX_LTR_CNTL, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP2);
+	data &= ~RCC_BIF_STRAP2__STRAP_LTR_IN_ASPML1_DIS_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP2, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regBIF_CFG_DEV0_EPF0_DEVICE_CNTL2);
+	data |= BIF_CFG_DEV0_EPF0_DEVICE_CNTL2__LTR_EN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
+}
+
+static void nbio_v4_3_program_aspm(struct amdgpu_device *adev)
+{
+	uint32_t def, data;
+
+	if (!(adev->ip_versions[PCIE_HWIP][0] == IP_VERSION(7, 4, 0)) &&
+	      !(adev->ip_versions[PCIE_HWIP][0] == IP_VERSION(7, 6, 0)))
+		return;
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL);
+	data &= ~PCIE_LC_CNTL__LC_L1_INACTIVITY_MASK;
+	data &= ~PCIE_LC_CNTL__LC_L0S_INACTIVITY_MASK;
+	data |= PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL7);
+	data |= PCIE_LC_CNTL7__LC_NBIF_ASPM_INPUT_EN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL7, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL3);
+	data |= PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL3, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3);
+	data &= ~RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER_MASK;
+	data &= ~RCC_BIF_STRAP3__STRAP_VLINK_PM_L1_ENTRY_TIMER_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP5);
+	data &= ~RCC_BIF_STRAP5__STRAP_VLINK_LDN_ENTRY_TIMER_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP5, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regBIF_CFG_DEV0_EPF0_DEVICE_CNTL2);
+	data &= ~BIF_CFG_DEV0_EPF0_DEVICE_CNTL2__LTR_EN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
+
+	WREG32_SOC15(NBIO, 0, regBIF_CFG_DEV0_EPF0_PCIE_LTR_CAP, 0x10011001);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPSWUSP0_PCIE_LC_CNTL2);
+	data |= PSWUSP0_PCIE_LC_CNTL2__LC_ALLOW_PDWN_IN_L1_MASK |
+		PSWUSP0_PCIE_LC_CNTL2__LC_ALLOW_PDWN_IN_L23_MASK;
+	data &= ~PSWUSP0_PCIE_LC_CNTL2__LC_RCV_L0_TO_RCV_L0S_DIS_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPSWUSP0_PCIE_LC_CNTL2, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL4);
+	data |= PCIE_LC_CNTL4__LC_L1_POWERDOWN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL4, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_RXRECOVER_RXSTANDBY_CNTL);
+	data |= PCIE_LC_RXRECOVER_RXSTANDBY_CNTL__LC_RX_L0S_STANDBY_EN_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_RXRECOVER_RXSTANDBY_CNTL, data);
+
+	nbio_v4_3_program_ltr(adev);
+
+	def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3);
+	data |= 0x5DE0 << RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
+	data |= 0x0010 << RCC_BIF_STRAP3__STRAP_VLINK_PM_L1_ENTRY_TIMER__SHIFT;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP3, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP5);
+	data |= 0x0010 << RCC_BIF_STRAP5__STRAP_VLINK_LDN_ENTRY_TIMER__SHIFT;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_BIF_STRAP5, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL);
+	data |= 0x0 << PCIE_LC_CNTL__LC_L0S_INACTIVITY__SHIFT;
+	data |= 0x9 << PCIE_LC_CNTL__LC_L1_INACTIVITY__SHIFT;
+	data &= ~PCIE_LC_CNTL__LC_PMI_TO_L1_DIS_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL, data);
+
+	def = data = RREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL3);
+	data &= ~PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
+	if (def != data)
+		WREG32_SOC15(NBIO, 0, regPCIE_LC_CNTL3, data);
+}
+
 const struct amdgpu_nbio_funcs nbio_v4_3_funcs = {
 	.get_hdp_flush_req_offset = nbio_v4_3_get_hdp_flush_req_offset,
 	.get_hdp_flush_done_offset = nbio_v4_3_get_hdp_flush_done_offset,
@@ -365,4 +473,5 @@ const struct amdgpu_nbio_funcs nbio_v4_3_funcs = {
 	.init_registers = nbio_v4_3_init_registers,
 	.remap_hdp_registers = nbio_v4_3_remap_hdp_registers,
 	.get_rom_offset = nbio_v4_3_get_rom_offset,
+	.program_aspm = nbio_v4_3_program_aspm,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 31caae7c2495..d8a954bd4c50 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -380,11 +380,12 @@ static void soc21_pcie_gen3_enable(struct amdgpu_device *adev)
 
 static void soc21_program_aspm(struct amdgpu_device *adev)
 {
-
-	if (amdgpu_aspm == 0)
+	if (!amdgpu_device_should_use_aspm(adev))
 		return;
 
-	/* todo */
+	if (!(adev->flags & AMD_IS_APU) &&
+	    (adev->nbio.funcs->program_aspm))
+		adev->nbio.funcs->program_aspm(adev);
 }
 
 static void soc21_enable_doorbell_aperture(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h
index 53802d674e13..4b489d64deaa 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_offset.h
@@ -6918,6 +6918,8 @@
 #define regPSWUSCFG0_SSID_CAP                                                                           0x2880031
 #define regPSWUSCFG0_SSID_CAP_BASE_IDX                                                                  5
 
+#define regPCIE_LC_RXRECOVER_RXSTANDBY_CNTL                                                             0x2890102
+#define regPCIE_LC_RXRECOVER_RXSTANDBY_CNTL_BASE_IDX                                                    5
 
 // addressBlock: nbio_nbif0_bif_cfg_dev0_rc_bifcfgdecp
 // base address: 0x10100000
diff --git a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
index f3cda48bfaeb..d038fd915351 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/nbio/nbio_4_3_0_sh_mask.h
@@ -82045,5 +82045,6 @@
 #define BIF_CFG_DEV0_EPF3_1_RTR_DATA2__FLR_TIME_MASK                                                          0x00000FFFL
 #define BIF_CFG_DEV0_EPF3_1_RTR_DATA2__D3HOTD0_TIME_MASK                                                      0x00FFF000L
 
+#define PCIE_LC_RXRECOVER_RXSTANDBY_CNTL__LC_RX_L0S_STANDBY_EN_MASK                                           0x00010000L
 
 #endif
-- 
2.29.0

