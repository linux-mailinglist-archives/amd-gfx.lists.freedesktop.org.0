Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1B252CF77
	for <lists+amd-gfx@lfdr.de>; Thu, 19 May 2022 11:32:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8A11B251;
	Thu, 19 May 2022 09:32:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB43E11B250
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 May 2022 09:32:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/aL27+cSF8PlEcySYy/SLpf6YOhUaf75AQsFNs0pDQ0H0D0EI/sWpBRytsEfNWGW1dCa7i2O2kzrvURQ6cd7zbC212ad5IaV/95gIrHvdSfCdzLuCiLTWlRZst7EjYDJsj0Wi9JODeKtbmbqSgn4VOatTrfLmSu1Zf7idPq+ir4zbRXung02kWMy1n9ro0jV/R86c+anqYwkTkfaCjtNBRDjVg2VQbzBDO0VHpsf7iAAuBitcuHAMsjEjJiw6va491JyEeND64pnhM9730d/uuRZAiPL8JevceQOdEymx2RPwR5JOgnkYVUjer2dV8LiT8PIj9df9sdtJkvgvzF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfODawHg80ix91Kfr5Wpj7vvMGmFIEWQzg6vbvbZcSQ=;
 b=hhVZhSzshVKmxxkcEPcI+7xPdZ6rYWGLe2FcVG0Uhnvpj6grXLiFCBTEGnO4e66Y8wOxlj8PAyPXNtt+6CeUe/cXjckzUuPKnLqzsTKtyPGxqD3LPIet9urRDt1nKtYLxOFOzKWIPvN2M9Tv4z09AHyfvGzTzDa5iHVwiupr1zTwfhm/J1B/B9ASjpVLuHd+Du0NxhWyNWP6TxR5rcyi9EPnw8d3WA/VuAZ+lNjzzxQUWvC9i+D5N2HulNdrLTuFJ7QxhEQxsN0keNAT0wllck573bkA0finSGJflALROzGe428jzem82AcvqiH/BzUU3GGby+CzDYWnIrL/UMDgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NfODawHg80ix91Kfr5Wpj7vvMGmFIEWQzg6vbvbZcSQ=;
 b=mkzWtqZa/ZnmIv/bbUtVLOOTiSQNgtpkj/nB6a9qtm9YAOi2V2jSnVCslAUpgoR0L/e9mK1i7BCbn3eabqTAMaJGWsRl6qZuaAg9HrHi+4Lf8zxmuJipXyw7/eqo3MoqtoLuQLPquG2F6rjFXe/h0N46e6DfNsR2IE769Sdq9xk=
Received: from DS7PR05CA0096.namprd05.prod.outlook.com (2603:10b6:8:56::28) by
 MN2PR12MB4128.namprd12.prod.outlook.com (2603:10b6:208:1dd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 09:32:15 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::e0) by DS7PR05CA0096.outlook.office365.com
 (2603:10b6:8:56::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.7 via Frontend
 Transport; Thu, 19 May 2022 09:32:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 09:32:15 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 04:32:13 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: suppress some compile warnings
Date: Thu, 19 May 2022 17:31:50 +0800
Message-ID: <20220519093150.1244888-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bce847dc-a1bc-4f41-f153-08da397a762b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4128:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB412858D986331E617D8C4CAEE4D09@MN2PR12MB4128.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MwySKvrHhJCZcTQR04jbnnT/yDfNEtTMdxWJiJ1DG/fKcylwKQDYqS1pKRn4t1DgyjhORvG2HkVgvnbNfxyqBLJ3Uj5jFgzQ4zlR4hO+STT1dRVUlBvAvW88Blj0rkc5/koyPUW9wSnCBG0AfFdOZNZwZDpaeOYQQw9Kdsso0Mn9gcaA21oQ2CWeURKTQ35VubzAkv+xVhNA5tYehEpQMXnxx3S4HMcrR7WAAWyzjFucQZ3GYLpZ45DZrNtq3PxmZPSHk6gNh4xAQ7q+tuwQMNcUE7mWXSC9A6QCqr8wN2qEYE85ufY+kMO71t/Y2PnIrDbHoXUmAB6653668MBTpt7GwMXgpVRRchCweVsjmPL3QlJsoPYOwb931IAV53jNHt+Mivsn+RE0VwgJFG7iMOgECm0nz2lqrR6Wi90wU+V/PvaxFI+DfuSS0igVM64SGb7j9w095oybc/lP9EAi7oeWvWi+FRuM5eVHPOqyawE/qpGAyX6xJ7Fczw2tC+c1MT15nWxzTf4Xlx7/OPZb2MPEv466O3xB691iITFqQpjmNQGOB313aOcQPXAx8WgJgLHt/66HdCcO1a87APosZ6lfa+X3ITf9e6kIq9f4qaW61003/1mu37z+HnEXoyF/jMDj/uv9kvrKVvZG/TRPnkbQ7xjJX6Gz7QSvbuBgDwFUxMjAOArz1Crdm9wOUkA0fQTWNAweQyWKhkC70b8d4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(82310400005)(8936002)(36860700001)(70206006)(70586007)(54906003)(6916009)(316002)(8676002)(356005)(6666004)(2906002)(2616005)(1076003)(86362001)(81166007)(44832011)(186003)(26005)(7696005)(36756003)(5660300002)(16526019)(4326008)(336012)(47076005)(426003)(40460700003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 09:32:15.6012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce847dc-a1bc-4f41-f153-08da397a762b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4128
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
Cc: Alexander.Deucher@amd.com, Evan Quan <evan.quan@amd.com>, kernel test
 robot <lkp@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Suppress two compile warnings about "no previous prototype".

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: I74d029c6ebd8bf6bc08edada7a992d04786330d8
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/soc21.c            | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 881570dced41..16cdfb30b013 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1361,7 +1361,7 @@ union mall_info {
 	struct mall_info_v1_0 v1;
 };
 
-int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
+static int amdgpu_discovery_get_mall_info(struct amdgpu_device *adev)
 {
 	struct binary_header *bhdr;
 	union mall_info *mall_info;
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index c6a8520053bb..9e18a2b22607 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -42,6 +42,7 @@
 
 #include "soc15.h"
 #include "soc15_common.h"
+#include "soc21.h"
 
 static const struct amd_ip_funcs soc21_common_ip_funcs;
 
-- 
2.29.0

