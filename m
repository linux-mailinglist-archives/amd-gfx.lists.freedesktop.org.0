Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838681C561
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Dec 2023 08:02:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC1C10E753;
	Fri, 22 Dec 2023 07:02:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3755710E751
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Dec 2023 07:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKwJgt5UNUwu5oz8rDUXr+xQxFH0j8txmIQt56X9wctNLOHfP7TP/qWp3NKk4BAIwhNftYbwRLIYFwoJJ6D3wE27NHG4k1wmydPYZy3sPIe862m0iMb72K25V3JP5PFEXZuoBn7HlXHq3zFG+y/T+ghcqnSC6AC73h0PYh2htEPIWLAzMXU9FLRrJOQN66OpYbeQw+jsI6ILNhu+xaeMlecCcqsLT8NWei/p7aw47QnqSFABl7dEX9z7DG/Pl5SCftZyMZ6tj8s2CHYLIAWqX712s7hJdCvxAyaXQBw9f43awXl0OJsmD1o0c3jSWejoFTYKR2AIcWWaVyejmHlp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY6Bz9+UELHXKoiS+tbFrlVgtui2ax/ohLOYRCJOXRc=;
 b=bej67aBBkPouBtiUMdK3VNxT257ubr2Gaq/DxYZM6X+V1qm0yNM5zfkTF06M/yvK8mtD9kikoAteJuJxFesro27vY+Xjo14kXY8kpIvnnnY+jJbcdpH04g/zvHbkm7uBgvCUJNP8R8xkZPqWb4/dXLTPlcXtkScN8beWPEyQH/UVZawmLse3ZQqQCFdx/Tge0QRFehjUhQkJi7BggrpwGn7pBMkuo6YN4mjYMTLckxqQcct6Uo0jZdcb5XAOGBpcqxpyyC2DgF4xozSopNfwR5Dbh5nviOEM1Q4p9v5Ay/0+Xev4iLeSQNdT+rW1YZfEVmnIc8U3Bx8ygvMB3nRuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vY6Bz9+UELHXKoiS+tbFrlVgtui2ax/ohLOYRCJOXRc=;
 b=Pq5CBnEoTKqABFSqq+UbUz1C/Jx04uoJK9TFUtA9yJVCEBKjconqBD5HKBWWxviGDqqSrUXiiTHT+8P5mhOaVNUU5U4LjIs4iVvj8xD5BEeHVzcg/j3dGgYzw/0+KtpErLFrLDew9lrr0L29fuGsaS5oE9QQadNkvQMffG4Sm1c=
Received: from MW4PR03CA0168.namprd03.prod.outlook.com (2603:10b6:303:8d::23)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 07:02:12 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::bd) by MW4PR03CA0168.outlook.office365.com
 (2603:10b6:303:8d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21 via Frontend
 Transport; Fri, 22 Dec 2023 07:02:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.18 via Frontend Transport; Fri, 22 Dec 2023 07:02:11 +0000
Received: from stanley-test.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 22 Dec
 2023 01:02:09 -0600
From: Stanley.Yang <Stanley.Yang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Hawking.Zhang@amd.com>
Subject: [PATCH Review 1/1] drm/amdgpu: Fix ineffective ras_mask settings
Date: Fri, 22 Dec 2023 15:01:46 +0800
Message-ID: <20231222070146.551584-1-Stanley.Yang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 00212224-2ce8-4a0c-9c5d-08dc02bbebfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UUaDqRpn0ZoU8XVsNDz5lsLwOBLTzr/XvevFv6OljT8fQzDTrb8SXxX5pNPSBzzl4a1K0LxU6AnzBkvRo4iK4BnyYCCrBPYMaI8ujYNMbsqZXVOFpby7OFfmXDRg+AtkdqoYlhAKuGYu5iomskZVEGhmSSe1/NweVe93MtCZOzXnqg3LaN/aEr6uFiPNMk6Ak7tnEvZqGw4oTQwLlZDrblYVt6JCUAaS1UYWcJjGOFWx6MW8NT6r/QPuccIxzm0MvXq7e+ADs0CbhUY1qkhSvGjWKkZuymLitEDK1O+fOg+9xSI2ezXxIBNjDf1b6ChDQFgC9boehTMi18owEGw4Ydp8NILgCD13k77qhWAz38NXAatVdRc47/SwzDIuk1fMarbUm4TkzS6TmGoDe7pI8XPmIg1Btnn51SHpT1oXScl9wUJBxQ7u/ug10kQ4cB9g6R6fXFBxBs4dBukHcyTFaYj4/Ar3nmidQZDrf9JUehtbbvMvWqEwPE4Wv2xfRPkZ66cDpbZ+Fmb6/NEQVlRtNXr/e27aASImB/VJ5b4/qVA4fq49D92/kQpTCDCr5ZGOBUiA4bBWkobZkiUZA8gm+q7SbhLaP29sS9gg/oSv9pqZ8LHOE1Fvpww2uDTVUSxpurk3tJHEdPZxAmAF3GdGYpSpaYOTMfJdaoVVmFlfMYvzu/s2FBKTcN15lBQ0ueA5qSnvbBl/sVLEkwLcizRSQL0JpFbh8dCRRJyWgNX8Ea3qCjptWIUVcwdseE1mzEjHcq4LS0NebRhtVTVzm5PVnA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(40470700004)(46966006)(8936002)(8676002)(4326008)(36860700001)(70206006)(6636002)(70586007)(110136005)(316002)(356005)(2906002)(41300700001)(86362001)(36756003)(81166007)(82740400003)(5660300002)(40480700001)(7696005)(6666004)(478600001)(47076005)(16526019)(426003)(336012)(26005)(1076003)(83380400001)(2616005)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 07:02:11.9677 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00212224-2ce8-4a0c-9c5d-08dc02bbebfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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
Cc: Stanley.Yang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

For the special asic with mem ecc enabled but sram ecc
not enabled, even if the ras block is not supported on
.ras_enabled, if the asic supports poison mode and the
ras block has ras configuration, it can be considered
that the ras block supports ras function only with sram
ecc is not enabled, otherwise the modprobe argument ras
feature mask is ineffective.

Signed-off-by: Stanley.Yang <Stanley.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 1d5c9d84f51d..8448e11d3e20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -3405,7 +3405,8 @@ int amdgpu_ras_is_supported(struct amdgpu_device *adev,
 	     block == AMDGPU_RAS_BLOCK__VCN ||
 	     block == AMDGPU_RAS_BLOCK__JPEG) &&
 	    amdgpu_ras_is_poison_mode_supported(adev) &&
-	    amdgpu_ras_get_ras_block(adev, block, 0))
+	    amdgpu_ras_get_ras_block(adev, block, 0) &&
+		!amdgpu_atomfirmware_sram_ecc_supported(adev))
 		ret = 1;
 
 	return ret;
-- 
2.25.1

