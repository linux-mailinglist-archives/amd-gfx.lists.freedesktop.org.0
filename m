Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2117892EA3
	for <lists+amd-gfx@lfdr.de>; Sun, 31 Mar 2024 07:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DE210E522;
	Sun, 31 Mar 2024 05:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gITTis0Q";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAC210E522
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 Mar 2024 05:01:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D2zGBL56j+lCeOELdPIX8c41fxJBlxb8IF+E0qbSK6/dZnh9xq87OPxQN+Grdiqhie3KU32/V3td2T4ODvMwenaHEI0frNcwEoApH9x89L29VotPVO6UrWlmuNiT+l05qj2fH6utqhZ7kXVto7hJoBRo44ImGUoCK0DSMrq+s7n3dQHo5zQ7luvZLw/ThEEXQBFmzfIpXpQyu/7Q+GIqh5Y/eKEdv0qz8EbWlHlkvFulbTQn0NQPAB7C9CQFrOd+d9506Ic1RU98DZu28xsy7KRsZyl5XDF6+BQrxX5LXbV4CKoxkGuX1lluTcfl3xMGiFaDsZhm+lQ0pyJiX7Eqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOE/HzuYsFx80UF166wc2CZ12/6lCuB0tCOnd22X6vA=;
 b=fbejpd4K2qbEN9+9vsIBpNXYSH7+4ERJRpNTV1BqQQjiXW8frRdujLJLfojialEkSLpY+wkOFQCJU2wNi0FQdfFGqo9g4Un55fZe1x6doQVuwp/6R3zOMUeA7UaJkDrGSu21+/gNO7nSGCSb3qhyLlTqCFADsVl1TCTSbjJhw3RhFuH8SP+0xx3ztgUvEb8pube7tKKwAF/xXbMG0sSDeeKeuUI2DhbJ3PKllRpNB8cr/B1HdEPwxwZn5Vt+qotduwYtaNnV1S5uaBVwr37GDQrBIKTue2zMhY9pE7873I24moLzU+ZJWYLHrWjJmZtGSXFX5srQjabxUZ7dxyfIzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOE/HzuYsFx80UF166wc2CZ12/6lCuB0tCOnd22X6vA=;
 b=gITTis0QeLkSjYmDkxWTTQYif6PXlilHnC5g0GAedVGjGX6uGFvIKOYiJ9l0Mt4T2i6leUw0K0IFDV0KK6RFDOKRwmcTOTmBOk81UxFlwjB1eGzZHGPsH+ZBvhS+gx49wdo/i5hJqbItKcHJJ0HmTahPASXWm7kX6sJWiRx2xVg=
Received: from SA0PR11CA0112.namprd11.prod.outlook.com (2603:10b6:806:d1::27)
 by LV8PR12MB9208.namprd12.prod.outlook.com (2603:10b6:408:182::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Sun, 31 Mar
 2024 05:01:56 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:d1:cafe::59) by SA0PR11CA0112.outlook.office365.com
 (2603:10b6:806:d1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.43 via Frontend
 Transport; Sun, 31 Mar 2024 05:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Sun, 31 Mar 2024 05:01:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 31 Mar
 2024 00:01:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 31 Mar
 2024 00:01:55 -0500
Received: from hawzhang-System-Product-Next-Generation.amd.com
 (10.180.168.240) by SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP
 Server id 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 00:01:54
 -0500
From: Hawking Zhang <Hawking.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Kenneth Feng <kenneth.feng@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: Bypass asd if display hw is not available
Date: Sun, 31 Mar 2024 13:01:52 +0800
Message-ID: <20240331050152.32608-1-Hawking.Zhang@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV8PR12MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 01d83f40-6057-4c5c-47fa-08dc513fb052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fe0H0qDSnr9KuIqW84lcqO021ghMMkxkuzLd/IJzQ75L30WtPbKcoKfnDAcc251ddc+7CG0F8fINJiiY4+s69o17I0G4kiUQd4dt/e5JwlIcPAZ5f84OuZAtcIALt+S3fNCoGr6kobwqNto7XiRjfcRy0Tt4jyMbm++UlCtqBAJvf+ab+QX6x0jfVxsgz/amUQ4Q2rupj9ct8uxO8i/qnrTU65FGZBplDq0ZQRU5iCJJNG2mrnHri/iYnkxoSD4phPUrlC6GMO5+FznW5ManJCppiHc4U7w4+TsJR7FOAdbpAkfUNDPk4d3Ozdy2SZXjNDbO8LopuT9fiXD4kNYjcjaB2/5u9T6OhfIYSjIFeATEDEe5Yz1aDv4aSHSJAWKn5nDHH/qM6/J8JnwYvF/Oh8czwFV7n47Lz7MPWxR60Qwpkt2W7jvpcuSz4WfAcaHFUsva+ANFObBkmdHq3qlHLT50iKzwykUYRhWjES9CzFvqXaBpsaasjjx21Ndcl003MLz5SZI0z78ZuLh1/0ohLaYc3Om8NtRSzULNK5PEXILtgNvO0/P0Ws+isQXEEzKW9LEiYkzRKMgr289XjhJy0uJji79QmGsp+JULp262d1y9zUfl9loqmGOvJDeAWVV3fHjFi8GwkcfBBtEuSuiEkVeP7eC60rVkP7bavlBUCxtm5KwEgB4uy3RifAMnX+I+otPyhv6QNdeH6n4d4gcuWyPkK2ZdD9Nyq8MTVGbyZAnNYyKbwVCAEcFWT5TC0B2t
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2024 05:01:56.2114 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d83f40-6057-4c5c-47fa-08dc513fb052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9208
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ASD is not needed by headless GPU.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 94b310fdb719d..83bf86352267d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1053,6 +1053,11 @@ static int psp_asd_initialize(struct psp_context *psp)
 	if (amdgpu_sriov_vf(psp->adev) || !psp->asd_context.bin_desc.size_bytes)
 		return 0;
 
+	/* bypass asd if display hardware is not available */
+	if (!amdgpu_device_has_display_hardware(psp->adev) &&
+	    amdgpu_ip_version(psp->adev, MP0_HWIP, 0) >= IP_VERSION(13, 0, 10))
+		return 0;
+
 	psp->asd_context.mem_context.shared_mc_addr  = 0;
 	psp->asd_context.mem_context.shared_mem_size = PSP_ASD_SHARED_MEM_SIZE;
 	psp->asd_context.ta_load_type                = GFX_CMD_ID_LOAD_ASD;
-- 
2.17.1

