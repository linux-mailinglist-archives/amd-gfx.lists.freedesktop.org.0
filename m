Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5490365F1AC
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Jan 2023 18:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7A810E76A;
	Thu,  5 Jan 2023 17:02:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8E910E768;
 Thu,  5 Jan 2023 17:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPIhBpgbI5HO+Wo9r1hium58X1WU9Y7b3e3aM0n8vAJGaEYxAWrNBsHgUgUxys2/7nChaLfr7jEt+QzHsQj6RBOOzm/e7UYMYHgF/iaLDsjS0SivBQywP4xt7Pj//C0Ga4hTzNq5wZTCSwOBM2JGeomEqVU4+Px8J2oagRtLzjiSCSX9/7UahrwTYUQf0pPvsmsns5JElMw2N4tfi5ECOQfl4MOkwKAsJR/svqmcFC0fyQNyujf6BoqCNcXmr6E9OfVsgL0Q8yYRg5f76gg9nwHcIQYUXTIHgiVgF0BiGzsNxl5GppyncOYNy/TWXZCTMXFe5xW8aypndfY2tHdScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVl5UPg0zyYuJL7fJjcYrfLpGIXCd8zRUXRNY13VG0k=;
 b=YQmEFRgban2OpPQhHdWKOpFKkH1j/5SSfHt+jfpYdPq2eC0adtE+ZcHR3fPRpORJskb6DxIBU57Pb4vaoCtqTbpJBwHGRxFfk/OROeClu8o2vAoW20SxKJ+xIv+F8MA0X2k4rbFq+huOpXB8QcQx0CCMdmEbsK22tSTorpfVJh4GesaCx/5LvYcQEfhsbje1hKMpsLxDquAxATMaHDnXyZvBISQILp9EuTJsPeHCP3FDBtH8yfbZiUFb1BthTCEAEzIkWcBFGf3IH+IlY/grugnLTMYM0Re9t1RI/RaU0ZBkYMMjTV68k4cgSkA5nF1IZ7oErueLrBZ1Gh3WC9Ypiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVl5UPg0zyYuJL7fJjcYrfLpGIXCd8zRUXRNY13VG0k=;
 b=FoghAdVjlyZgS3Kpt7pexbCNIPaErL6F3ViDRTfe5xX7T2QBiKjcaiGL9Z/uhCMLsNV7X7Jjmwk9pLjvo1gwd4QmGpxE3mxZGxJMUuMY3NAmZ80pPC8ZEP/ZuIxG8t1CfZ7U0cHSlOuhqkZ7X/uE0nudoK6wkhB7r2c3VQwF51s=
Received: from BN0PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:e4::23)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 17:02:02 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::d6) by BN0PR02CA0018.outlook.office365.com
 (2603:10b6:408:e4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Thu, 5 Jan 2023 17:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Thu, 5 Jan 2023 17:02:01 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 5 Jan
 2023 11:02:00 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 04/45] drm/amd: Convert SMUv13 microcode to use
 `amdgpu_ucode_ip_version_decode`
Date: Thu, 5 Jan 2023 11:00:50 -0600
Message-ID: <20230105170138.717-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105170138.717-1-mario.limonciello@amd.com>
References: <20230105170138.717-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: d1519901-e099-429c-127b-08daef3e9067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBRAi6zuVH+Z1nOslfbyMixT0JCVfaX5WzXaf3MleyggvBSi/1ERM559Hf/s68e8JIWA5679fjno+54cfNY45b9c/oWS9t1X1nlFfxNGd6VMWnpTRIPV9z2nHjBX7k5QNZBIdpBSNrTVXHBx7WHhJ9b3drmgF+VZzKjaIfApp4whU5+B7zl6Ojy3XpGa2rnNq/uxn75VhuvvI4Ht4k38yo8LVWBo8Zk9ln9h1PGY08rtl0S88B1NeI3GswdcV4vxjlTaruSoxVoZKoyWOQcAQKTQ15+mPOL4FImOEG6VkjXha9DZDjkqokj08eSwS8k7pasQLpj3KFhneY6k6Qx6qwlJut+fVAH9SSAq4OvH+YJV+lfiiP0JFgNQhhuRpWG0e+wDSLryGyYGGtNlLsoMiWIKNBnqRwXGeqoRZyROi/KtYV7egNkW1MjVOIR/xdN5Xr+2uRSl+Kzcinuv06l14+fHIpp/Rz1NgS78tIpHt42kz1s+ue5q4uzjwzTHDTfA1p3Qwad/tOX5sI/xyNSff/s6d21OA8kbvnceEW5aYCqSpVRbOwAQC4Y/6s+8k47BS5IST2qnqjEEYKxfdDiDiOIu7U1UhNxCq/U+m0N3Iu8PDAgXV1HiNp728qB+55qtqsZzQ13Az6LftQMPV//Q0e5mqoj10gL0tUVmaefOR+NphAy76zFTMOla59NAj8neOoM509X9oBox4NTUOBPCn6h6j7Bb1V9QyMl5zFRdPuh3gbuwmGNjRcRi4ntUwfM61kMc5o8aI3tGnSGhYuyM8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(36840700001)(40470700004)(46966006)(41300700001)(5660300002)(70586007)(70206006)(8676002)(44832011)(2906002)(54906003)(110136005)(4326008)(8936002)(7696005)(186003)(16526019)(478600001)(6666004)(26005)(426003)(40480700001)(336012)(47076005)(86362001)(36860700001)(2616005)(83380400001)(66574015)(82740400003)(81166007)(36756003)(356005)(1076003)(316002)(82310400005)(40460700003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 17:02:01.5562 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1519901-e099-429c-127b-08daef3e9067
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Lijo
 Lazar <lijo.lazar@amd.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Daniel
 Vetter <daniel@ffwll.ch>, Carlos Soriano Sanchez <csoriano@redhat.com>,
 Evan Quan <evan.quan@amd.com>, David Airlie <airlied@gmail.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The special case for the one dGPU has been moved into
`amdgpu_ucode_ip_version_decode`, so simplify this code.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0ac9cac805f9..506a49a4b425 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -88,7 +88,6 @@ static const int link_speed[] = {25, 50, 80, 160};
 int smu_v13_0_init_microcode(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
-	const char *chip_name;
 	char fw_name[30];
 	char ucode_prefix[30];
 	int err = 0;
@@ -100,16 +99,9 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
-	switch (adev->ip_versions[MP1_HWIP][0]) {
-	case IP_VERSION(13, 0, 2):
-		chip_name = "aldebaran_smc";
-		break;
-	default:
-		amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
-		chip_name = ucode_prefix;
-	}
+	amdgpu_ucode_ip_version_decode(adev, MP1_HWIP, ucode_prefix, sizeof(ucode_prefix));
 
-	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", chip_name);
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s.bin", ucode_prefix);
 
 	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
 	if (err)
-- 
2.34.1

