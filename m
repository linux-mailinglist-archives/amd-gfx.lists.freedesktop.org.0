Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DED80F465
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Dec 2023 18:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E11C10E63B;
	Tue, 12 Dec 2023 17:21:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D210E63B
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Dec 2023 17:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzMKSZ0Md9LhF0GXy1VYd3gSNfzL7w11RpefLUoVaAlaHQcXR2xnnQouIaJkedX3C36k9tKef14JUEkcU6oLwTLPn2KTAX8h+3O163vjnvWb4iZ/y2y1EBjqxSAqr+MYNdX2B4duoIaF073YFE/bC4LktWI4fJT/uUZGn/pbJXKUXQ3P64G6ImBh/rYW/39gUcan1wYTGZwj0JDuv1ZHY5yYpgY21nBpQAWMC8IEkQLQPCv4bduPMXvQ5EtBuz68yKI7LsJR3IJiMOV/EVihUnugx6dMTHcP3+OcUCQWN2Q120s99s2TK2GQ68vxqzDcmBubjdK5I6fhaKUpxe7T2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEfy3KooIK0Yct/CGwsOgEC14i41HNOppOT7Ay0Q/e8=;
 b=OvOHM/mq2GhGImL3vwYEqpXpbJLDCkre++njiwBFUIZdNcUi6RYNKtAipFdLc+gfzzI9roHn8+3nJzLSeUp4789Dqx+cz/EwolkZT2bVa0kTh6Ono32eL6vYwrFyDRgEPtc+apc+a2U4uje6GYuevA0tHmayw+eZB/SlaP31InezK0jV/uSJWJMPISqT907e8tj9o8zzW18nE9m2+MM3n3eoT+LyrjqsFNNpcIqDsOhnBLmKmtljatvC03ax8uMgB34H46y306RTp6n43G1hpMgzZIqwmcu2tUwWlufPcYMp11rhjB70qxQyWPstNKAOu63mifhki1J2a2ZL8K7Oog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEfy3KooIK0Yct/CGwsOgEC14i41HNOppOT7Ay0Q/e8=;
 b=qmFskwTeRKVn/TSWjWAUJ1/eWFwelVN2JMxO2ez21AzE+3e9ixb9h7pGrwXGcBOzMncHOH/xzc8EG5emFKMzDu5H/Vb935Z8oNTD48/DCmTs9CyKe9cSiW79QQzSK6HOxD9E+N+jCMpEwxIshPdfyhndlMSF9KroYw9QDXj3fkE=
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 17:21:40 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::6a) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Tue, 12 Dec 2023 17:21:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Tue, 12 Dec 2023 17:21:39 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 12 Dec
 2023 11:21:38 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd: Fix a probing order problem on SDMA 2.4
Date: Tue, 12 Dec 2023 01:09:16 -0600
Message-ID: <20231212070916.141121-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 027799dc-f830-4de0-2b53-08dbfb36cd72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdhLP74UM2zAwUQQQT0v9eenlyWszpcxseemFif2pTepOj451DbFjn3RinxcoGjIsKeeTW9OtGecsbtyFTVtHt/77PpmsI5aOK+zBqrRtwAD81Er63prJWywLiprJoGRoWWsyJeei4sAMzGlA46Ogv8IaTSQQ1bSii8dPSLblflfX/ES0tei7TSef8NkYHYdBd/oMBJKBiomSPmWOtDEHEjWJ9NC+dpRS3BNUzdT3JJj/ctcEHg+myRxFHiARcinAkVuO75FU9vwD4Wbo1fU8ND2qvopT2S335ZoIcU0wKcc9kCB1lE22ofeMErM9M8AYHC/zyjTnkRWEI0F9lPNpQl1c3ICSWGvGsEpUKjVK57BpqLrMTg3DTJ1N0GI3lJadEbma/qWovxuqxfEKvCqDXbrA2sIB9328/jd4BPKLF9A2qZzwnF5hYb01c80ZmMNZRqgwowh0oAoLWwahDaZoB7lrN5V89imDQHYlnb1POaARxaZaowwwH2S225bNXO3rOOXdPatAtek4L+N6PtXz7+IIWamf2/e1N678uTrsGPV1+wBK4hN+d4Fz+34U18HOUvzBKNinCxL2ZdxVzOhyUpdQ18vbq9jxXNSErc/LUXf+in5j4meHcBCPzZNvuGcAknuqEW5SCPCnE/dGTZvolwfTHb3/txRBjWtkX4wMjH9mEhRITGW0y19VgALo9TDTnNLc4rTjHGQR1ORU11xh0JLKjgjeZYmdGmYgeNVDEfZUwWbnA5THyK0/Cls1RgV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(41300700001)(2906002)(40480700001)(44832011)(4326008)(426003)(336012)(6666004)(7696005)(8676002)(8936002)(40460700003)(6916009)(5660300002)(316002)(966005)(36756003)(82740400003)(356005)(70206006)(1076003)(2616005)(26005)(16526019)(478600001)(70586007)(86362001)(47076005)(81166007)(36860700001)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 17:21:39.5111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027799dc-f830-4de0-2b53-08dbfb36cd72
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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

commit 751e293f2c99 ("drm/amd: Move microcode init from sw_init to
early_init for SDMA v2.4") made a fateful mistake in
`adev->sdma.num_instances` wasn't declared when sdma_v2_4_init_microcode()
was run. This caused probing to fail.

Move the declaration to right before sdma_v2_4_init_microcode().

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3043
Fixes: 751e293f2c99 ("drm/amd: Move microcode init from sw_init to early_init for SDMA v2.4")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 45377a175250..8d5d86675a7f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -813,12 +813,12 @@ static int sdma_v2_4_early_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int r;
 
+	adev->sdma.num_instances = SDMA_MAX_INSTANCE;
+
 	r = sdma_v2_4_init_microcode(adev);
 	if (r)
 		return r;
 
-	adev->sdma.num_instances = SDMA_MAX_INSTANCE;
-
 	sdma_v2_4_set_ring_funcs(adev);
 	sdma_v2_4_set_buffer_funcs(adev);
 	sdma_v2_4_set_vm_pte_funcs(adev);
-- 
2.34.1

