Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8363792F0C
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Sep 2023 21:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F96710E492;
	Tue,  5 Sep 2023 19:36:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1513F10E492
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Sep 2023 19:36:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEwnp5n1y/m6uyK5W58m7xWNR5On8hXzy3qyC1hEonpMNK+8vbn1Bv8wDqSgQwRdPTnM1O9vi3s+GVCVyHB2ophmY2zLNyi2ZMBUKoyK7fVhd3oNkbqKfuEA/sxmSM/6Mdxitd/xF6It04ISk2ME70iM8CnUXqfOth1uXdv2zpFhAsBjXoo0tmAU9+OKFPY/HbYX4KigJost5UbtUfc6oTziaElIpz5FepaRWLmPXQYBVIyoECPqhN0kiYYUUMWS6oHgi36a45pbMjsj7Lwh0jbz15VCcZ7C6aqBXevZVeUxyKc8mx+TPOSkCNWNHePiQyN0VKQKEdD0SKJhqzsMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17qwiyahpTl8U+97Q+/9nuSNCIaGYOJLHK9FQJCqrV0=;
 b=b/eCtozRUGJoDTW+XFQCD+E3OMUUrObtqgdfWFfnJZlSIJMXhr1q3lNF3r1fqoCn8ub37zKHyrbKo3LIdcPEG5I8vVhRyjNaEf/lqRvN3JLMiUbTEoLo5mKhWARkEGBvbIiS48EfclJF3VPoLDIlvIBkH7pp3xZuTSH+KBPa5ZQgGdbEp0a68H56V1dce2yhzaRQw5M5GDxq4jIojK5GTVTGfuGTw62dTfq0GhebgRcL5OA+i3jWILYELzwPmVRZbVbz5KBplP8aK267Nf3/8BpazLncUpOLClbdatvXbLrBdjmbPMpxVXjQyZ291g/7LCOdsSH1YX0Rs1fRBfPsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17qwiyahpTl8U+97Q+/9nuSNCIaGYOJLHK9FQJCqrV0=;
 b=JE1rfMfLnPHBfmoRAkF1DThk8AGNYryZf1YiOxOQ5dLohktu/wbsyP3ytZlL6QUjHrK/UELOfCf3HLxNExAcaeiIh3x+YZmTz7cdwVCeTvoDCEGB8dISeoHCzpikoeGvuFgM6MsgeI+ZAPCBmMGgnqiuQbTmwxHlcevS24Bil48=
Received: from SN6PR2101CA0021.namprd21.prod.outlook.com
 (2603:10b6:805:106::31) by CY8PR12MB7218.namprd12.prod.outlook.com
 (2603:10b6:930:5a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32; Tue, 5 Sep
 2023 19:36:39 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:805:106:cafe::7b) by SN6PR2101CA0021.outlook.office365.com
 (2603:10b6:805:106::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.7 via Frontend
 Transport; Tue, 5 Sep 2023 19:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 19:36:38 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 14:36:37 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/amd: Drop special case for yellow carp without
 discovery
Date: Tue, 5 Sep 2023 14:25:57 -0500
Message-ID: <20230905192600.32449-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230905192600.32449-1-mario.limonciello@amd.com>
References: <20230905192600.32449-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|CY8PR12MB7218:EE_
X-MS-Office365-Filtering-Correlation-Id: cb837299-b8da-4f0f-ae0e-08dbae476c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqYa8iHJwA5I/7FDiGbhiQx1jNpNhFE7cJJg3l92B4qTWLLxkyJcIg2RLLSI/otBCpkMcyo8ABmJ6Afce4Ngp36NLxHMa5TKUirNXHg8WtYxBODPN+WHMUGR+mfrzEYAD3bx4kXNJsgbKsl8BSk0H/z3B/NLxueh5PFaj6ZEhh/5assBU8H2Mhm6CXR7/T5eibba5s5VT2J/AcpUmYOLNINevMiyi0X3FBLt9uVd7iV6f5+8iDnftGsvwQLlITo8g6GZvDuLVstw+T5GZu4MD6rOAKwbUMB/4YtvXjgbLxySR8/SoDfKABH5bf/zqrPRXwLA/zl04PUhRcd2cFhUzKV4jfhW7hJYhtcVcfSwKS5ghqAdimvtzcVGcw4QYWXeDnJ1ZKxsPOG478FhGbXOH19Ecuo1Yu5avhcsSnE1RrX6EIDYM3Kvrn4Dt4u1R8UP5/bUOx8jd6h4rTw/h8DKdWBTsXe/g2wnbsmU/w2VRaUjypKqfu5VWv7s/FjkuDFTIa+8v2TT079F0Siguq8sj0Glk8d08kZ5WOH2XFK1VuWFz2yT7YM48Xo/m7vL/+DE6eaOoXNA24qr18sfIxowYYaN12G++x+AWy9I5UFVbRfvlla9v/OyePQUG5anUshcypSgZvjdpUMlqrFCQnW8ApdMfpPGFHtnq8xQZ7eXiFgKFGaxZRJWE1Als5AInXYMdCJ3QO4C+zduTNle7vFuLkHGg4gliveO+c+8PXpXRdw5UgdQ/ln7pjhL39uWb5zuefQZIVIyy7I/TN4i8OYmgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(1800799009)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(41300700001)(36860700001)(356005)(478600001)(82740400003)(81166007)(6666004)(86362001)(83380400001)(2616005)(26005)(1076003)(7696005)(426003)(336012)(47076005)(40480700001)(16526019)(70586007)(70206006)(316002)(36756003)(6916009)(2906002)(5660300002)(8676002)(8936002)(44832011)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 19:36:38.8519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb837299-b8da-4f0f-ae0e-08dbae476c7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7218
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
Cc: Mario Limonciello <mario.limonciello@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

`amdgpu_gmc_get_vbios_allocations` has a special case for how to
bring up yellow carp when amdgpu discovery is turned off. As this ASIC
ships with discovery turned on, it's generally dead code and worse it
causes `adev->mman.keep_stolen_vga_memory` to not be initialized for
yellow carp.

Remove it.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 5f7641d9f346..27e534b0b8e5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -725,12 +725,6 @@ void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev)
 	case CHIP_RENOIR:
 		adev->mman.keep_stolen_vga_memory = true;
 		break;
-	case CHIP_YELLOW_CARP:
-		if (amdgpu_discovery == 0) {
-			adev->mman.stolen_reserved_offset = 0x1ffb0000;
-			adev->mman.stolen_reserved_size = 64 * PAGE_SIZE;
-		}
-		break;
 	default:
 		adev->mman.keep_stolen_vga_memory = false;
 		break;
-- 
2.34.1

