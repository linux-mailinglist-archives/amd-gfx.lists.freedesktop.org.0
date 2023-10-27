Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E177D9D36
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Oct 2023 17:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F6010E9EB;
	Fri, 27 Oct 2023 15:43:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECA410E9EA
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Oct 2023 15:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfGObGRvFFDfu20DB5Xi2bs//QycV5WMuqQ30XL8boArKa3N9i3orAZfUjeMfec/BrTi53HUS0fe4lMCgXz1IYh9o8quOAESMxCEJbvPm6YhG+lVIrlCyrtDpuGhdtY3mb1AMTerWTLlUyr4SR8r/uw9w8xJsn4q3uv6zW+lZ2HjqglQmJvEuGWvbvVNZlYdGM95XS2vmvqVX/miyqcK596GmhFBCmEqTRr91nFJYx1myaDfOyM6DX0eyYW/Y705MYH4umn9y9EaJ25w5M8veUhNwAtUw6XyeeXWhM2eIoKrGefQhcNK4wVZeMRVE8HjiQNqfZQpDImPVJvOxzxH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXQhTW8zMk00Zm5SU4t+xlJA3wblYru8uhKVCnrV7+E=;
 b=kbohBKV7ZsnDC4jKA6v2g86tQkw4W/Q+tT4XMgPYguLaJpob2lDu80mc4QDJAWSwWh2tt7/s6uO27Y+AfPB9qbJGSHG7wT5SWZK7UIFTL+rYdsqQPvQGMi6bLK9OVmr8aLUr+M0JKqbLT3TuXFpQ/9P3Ly0YUKrDXjyfVDRXUwMlquGrGLgLuIH0YDqU3mUxDxHnSSl6sFWnBBh02XTx2rxAJiGePTWJBRDCKXyYLLb+C7ML1dOBxGq6kX/eEkpfEO0v5ExqIv1kwdQD2O8Db/BZtpmYVlmjri5KVoiWNyDVphBOJtfV0uNqKhb36YftEnW3hIizMfhhtBBsBzpAPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXQhTW8zMk00Zm5SU4t+xlJA3wblYru8uhKVCnrV7+E=;
 b=136Q+Q800JwGxyCC5vJkqV6x7DMwLHloi2chB0FKWCeqflWaxnPHoYmVScMZXaCYNzhTK+2czvrBytFbCG2ZfEUs8tm536cRe2mQu4vTGF/spMdYBzbcxCsntW1DD0PhNoxTtZ0o8tHTLo+rhwyqB5D0v3LeliUIhKkqOnHIz1c=
Received: from BL1PR13CA0187.namprd13.prod.outlook.com (2603:10b6:208:2be::12)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 27 Oct
 2023 15:43:08 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::77) by BL1PR13CA0187.outlook.office365.com
 (2603:10b6:208:2be::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.11 via Frontend
 Transport; Fri, 27 Oct 2023 15:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Fri, 27 Oct 2023 15:43:08 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 10:43:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: don't use ATRM for external devices
Date: Fri, 27 Oct 2023 11:42:23 -0400
Message-ID: <20231027154225.1662448-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd5283e-ff18-4eaa-4071-08dbd7036ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9S7J1Qb8WbILxlYKKg/l9hqK+DnA/flA1AcOCtgfBkKqxamtGOfDAjsZ+KKyEWAOipDVrabnOmIGGGWf5Y7geLEdeHSiRz7tiT07hq9LYMWRp11938UDq+vtf6RRwiBWE0NwkMuzO5MtSeQ3e5YmBHK6whFPs6ItjJf6CcVI/F9v2/r+XAsJvEM47wynUKMELCV3CKchU6SAh5+BpbremSrDM/47GqjJgZehfAU8MZWzB/hzxr6HeAI5sw+FXJ3ELbAkeKoPy932AGzIKawWiUohNxMmezV8lEw4qxDAcEcXufZ+zbusUi8a8qMAFMjArSfzy7WDi9O8hNtVksI+H3Lb+qMydS2DJ3IhU4VZCKhCMC+t5ZBI2dJGxhN14e4MsFH/gnhSjHbts/ATHcCEqLji/3TyspKlh0sNyx5Gv9nG79Pbj3hk7/pbMM2FJUJclMCnIc2Mam+DOcdQ3BVhLCdb5pyi1cFCvBkgIBbro+eDbdFnzlrST17kuGImcBvKUzwDi9HcTxd0A7z2qwVB8azhaPM5uEfAJJkWgpb8b9Q0iVTfXuDJCVTnrZ36poTBXfL8hLTi2MmvUcxpxTU0tfZ5PXVSq/ShvgfmsMC187pcP+61eWMI3lwRRhU2OtGuArTccoGoxRTaCkkzJIaRwKM30uaLR5FviTZURz89ZkyMzok1JEhB5cRXOi/UoRM0Ug4CoKsf61lTK8p7K/5cSzNYiMsIegxijz+NMFzQd1nWbWDjiLMDQDm4KHg30acFg/MpDCXKi5ajlIx84wbuDGSYSXlZboA3EzAX/ubyke4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(86362001)(40460700003)(36860700001)(41300700001)(2906002)(5660300002)(70586007)(316002)(478600001)(81166007)(2616005)(7696005)(6916009)(6666004)(356005)(82740400003)(16526019)(40480700001)(336012)(426003)(966005)(70206006)(47076005)(36756003)(1076003)(8676002)(4326008)(8936002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 15:43:08.0740 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd5283e-ff18-4eaa-4071-08dbd7036ae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The ATRM ACPI method is for fetching the dGPU vbios rom
image on laptops and all-in-one systems.  It should not be
used for external add in cards.  If the dGPU is thunderbolt
connected, don't try ATRM.

v2: pci_is_thunderbolt_attached only works for Intel.  Use
    pdev->external_facing instead.
v3: dev_is_removable() seems to be what we want

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2925
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 38ccec913f00..f3a09ecb7699 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -29,6 +29,7 @@
 #include "amdgpu.h"
 #include "atom.h"
 
+#include <linux/device.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
@@ -287,6 +288,10 @@ static bool amdgpu_atrm_get_bios(struct amdgpu_device *adev)
 	if (adev->flags & AMD_IS_APU)
 		return false;
 
+	/* ATRM is for on-platform devices only */
+	if (dev_is_removable(&adev->pdev->dev))
+		return false;
+
 	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) != NULL) {
 		dhandle = ACPI_HANDLE(&pdev->dev);
 		if (!dhandle)
-- 
2.41.0

