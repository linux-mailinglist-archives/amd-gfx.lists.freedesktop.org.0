Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F6E5B3D52
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Sep 2022 18:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B610ECA2;
	Fri,  9 Sep 2022 16:48:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAEC10ECA5
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Sep 2022 16:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoHlwSBb1I6h62Q8QGb0E99huahFB2Y2S+5rVYGU73CjPEAwJtLugE9KLb+v/lZWwcr60HMuirgUJAfQF7Ee+7Z+Zqa5kCnQLxTj7IaIsB4vlqTl1Holy2aXKmp0F6WECDeiE0Ah8sbqCFJD+Ojg6+UDzh1ZX5Bvxw1Q0+XZy9omcF2F71VQQYlIh1cW5s0JJHU/Wr9asBSJi7OBClaVYshJUY/OyDT7LdNU+/nY9TEQ+bHV30uKAZYy+jPH1EHeMhKHkBmpnAxUn2Di4Bwd3cnO3Z5RwzR23pNMc0ORBUzCT5gtlhDSp2psAc4nQcb+ULA+GPWS1xfow/Ud1RUodQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9MROM+jFGtrxwKcs1t2JJYaW/WBhBeIUg3GzmpOP+4=;
 b=gLg46heGR8u1ZmfGO1qlwU+wcCNByj87bU1ERd0RyaJabL6GqQtZD2FHB+mDZP1mbLrBpeWM20GxfKeoLwHaUDoeyBaU0lRc7xLzJEy1og/hUlHBaKZDYmZJfzYoGBDdupVYrnz1pNjo7+y+wkpsYqHG/4yrqc/nWuKqDSat3Xuzst01Wx0TWRXot7X8Xv8dJ5zpYvLlWhc/HVfMxNVvYG4OKNzZxBYIozDQCHFLlTzWEWj7bQBFlY2c4zLr4LEgPb5dWAv8nx1OFTfetasHac3yMPGMNKZDfa7R8ONaiM3YpTEVYKT+s+H7tdwQ464Bg05bPR6jkJHNM40wJp8VGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9MROM+jFGtrxwKcs1t2JJYaW/WBhBeIUg3GzmpOP+4=;
 b=ufNxxmw04LbI4ti4fIuifpcYyyEV9xirfO4lIpW3/jjJ9nmy8g/vJNKaHMHcCQwVCvEszswWiMg66FkQt2T1KNMJgVNiS4+1h6igBpxFbmOXrkCyAJXOAVqDrZBAbjDS9eN9N3+7aYCjPDnxTTzzWPECLjvny2aw2aqxZ8SQZAw=
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by BL1PR12MB5208.namprd12.prod.outlook.com (2603:10b6:208:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Fri, 9 Sep
 2022 16:48:13 +0000
Received: from BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fd:cafe::33) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Fri, 9 Sep 2022 16:48:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT081.mail.protection.outlook.com (10.13.177.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 16:48:13 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 11:48:11 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <helgaas@kernel.org>
Subject: [PATCH 1/7] drm/amdgpu: move nbio remap_hdp_registers() to gmc9 code
Date: Fri, 9 Sep 2022 12:47:52 -0400
Message-ID: <20220909164758.5632-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909164758.5632-1-alexander.deucher@amd.com>
References: <20220909164758.5632-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT081:EE_|BL1PR12MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1496de-05d7-4a12-789c-08da928315e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atsj5afmMlVcpOYvBTQ2pqXfR6XILoxSsqB6IDsasrx8bqh3bOWIYW3PaXeg/sOO34XFHRItD1WXIjWMwYCBYYJzePQhQ31A4osTwGzFPrjrhLwtj4bL/0MQyDBrZGshEF9ya9QPIjcMdiMoM2uuydovO4YGhzNSEDzWZXS3RcIGg824J7V8MsAGBJMREVdIUDmYdS+RK07o0gd5p87m+6BQxWDYBBRj3W0wQq3gnT5tlznY8pJ2YFE8+rf0beVLuI5VeZdWJLLjrm/kwLh76LWqT86ZpS21Yjk+JFHOXfmTetbBMgmn/LqdY/yDGxjTu/4kbCbAD6sOeH5p42V/kjN7DL52UdUnElGPNuX7AeAPS5kRaJBrHZ7qDZxenXvWGL41l30Fcc5SPhbTi4AqHkaHrrOxgKUlUYqsgCZ7HcoxXqtP/ZRwJTR4Q08VyGwqM8hX4UvxdspMgxnjK0B5OD7dDaTbiwkgK3B1A3Kjr9OoFivOtzUqwbx+S16eBsZNOcSV0qyspv0IRDHRjXUnGwdoYwj/PxxJXP7B2XmAelaUjUg+R4CJEZY9qx4kRZLLMEs5jBCifie5zxICxn0Qjp9GQQZ6mznOHpFqBIb8xv6NDSMpCooVDtTRLL+riD1UIigfTLRKHqOyw25wvdoYMr00kXdvdBD26d284VCpzJmsF0FAQb9dGfhrxgqXatP0tRa8UuuuLBXzTq5XnlpDBNipVNKv62qCLAYI4c1CalbyqvJTMNwZat/QHCwf1WyWmNPihcoVLIBRRvT8/ozqukR97qdyzstsOSZySUZJkjLHe516E1SmttAqM+ie7b6AR3fNQOSFhw74gvLz4nbyyg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966006)(36840700001)(40470700004)(82740400003)(81166007)(356005)(40460700003)(4326008)(36860700001)(70586007)(70206006)(82310400005)(316002)(54906003)(110136005)(8676002)(2906002)(40480700001)(7416002)(5660300002)(16526019)(8936002)(186003)(336012)(1076003)(2616005)(83380400001)(426003)(966005)(6666004)(478600001)(47076005)(26005)(41300700001)(86362001)(7696005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 16:48:13.1649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1496de-05d7-4a12-789c-08da928315e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5208
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
Cc: regressions@lists.linux.dev, airlied@linux.ie, linux-pci@vger.kernel.org,
 m.seyfarth@gmail.com, tseewald@gmail.com, kai.heng.feng@canonical.com,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, sr@denx.de
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is where it is used, so move it into gmc init so
that it will always be initialized in the right order.
We already do this for other nbio and hdp callbacks so
it's consistent with what we do on other IPs.

This fixes the Unsupported Request error reported through
AER during driver load. The error happens as a write happens
to the remap offset before real remapping is done.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216373

The error was unnoticed before and got visible because of the commit
referenced below. This doesn't fix anything in the commit below, rather
fixes the issue in amdgpu exposed by the commit. The reference is only
to associate this commit with below one so that both go together.

Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_port_device_capability()")

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/soc15.c    | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 4603653916f5..3a4b0a475672 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1819,6 +1819,13 @@ static int gmc_v9_0_hw_init(void *handle)
 	bool value;
 	int i, r;
 
+	/* remap HDP registers to a hole in mmio space,
+	 * for the purpose of expose those registers
+	 * to process space
+	 */
+	if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
+		adev->nbio.funcs->remap_hdp_registers(adev);
+
 	/* The sequence of these two function calls matters.*/
 	gmc_v9_0_init_golden_registers(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 5188da87428d..39c3c6d65aef 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1240,13 +1240,6 @@ static int soc15_common_hw_init(void *handle)
 	soc15_program_aspm(adev);
 	/* setup nbio registers */
 	adev->nbio.funcs->init_registers(adev);
-	/* remap HDP registers to a hole in mmio space,
-	 * for the purpose of expose those registers
-	 * to process space
-	 */
-	if (adev->nbio.funcs->remap_hdp_registers && !amdgpu_sriov_vf(adev))
-		adev->nbio.funcs->remap_hdp_registers(adev);
-
 	/* enable the doorbell aperture */
 	soc15_enable_doorbell_aperture(adev, true);
 	/* HW doorbell routing policy: doorbell writing not
-- 
2.37.2

