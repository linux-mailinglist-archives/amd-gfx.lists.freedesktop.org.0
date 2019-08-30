Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF25A2EFB
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 07:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4092D6E231;
	Fri, 30 Aug 2019 05:35:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810083.outbound.protection.outlook.com [40.107.81.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4EE6E231
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 05:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/Bjdu+ZIGgdTXMg1KFrEnQBSHFK9vpO+fWBzwMz/MkvVtqOITmJ3wAT7x9xOUTqgpAR7tufH8ybMM/ZC7xKP5tWikQ7NLyfHsT+mWNLoi6gGwITi/xHHDOr3nnBaNAMWEDUsgDpGX0tgc2iWBRwTUng7EUBRwJodXUZbRlaUf1e4t6AlP8R/qJtZaoUQYU7qaRinEgXk5W+rv0tSEErCN6itNG5ZcNVR6PKMdQtIyPQBHTh+RgjunNYNDl5Sr4hTjmZFdwFvAbzJNwQO+58DYK6XpCluG4RlSXdq95QtZBGj8a1FMJNOxVrRqBBDt2dz6wN1/IWLRYFztD3HRKAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0Vy3RKwkd96Xho4ea0czLVTba+QhmCo0VRgSw3qQns=;
 b=EanyODs3cG2aPiydoOAE6l5XdWkqDm8hQC4FNpmbRgjxU53qayHwGSknSFQLao38W7xQmcoUeeWV2R7Pv0UsbXujs+TgG9t5Z8IfV0sUJmCYTEK2LhBwBaPCB2J5B/Yo5EKEGt6SiLlgIUUEqskfDdKVMZqlE6uQxcIoIQiW6QERbH5/QEQUGEID+OqJ//ga3SwNXF3kynhkpXaYIG7M37i4sOcxPEi8LEKS0u0VUrXA8Z+iRIV77JzNe16ZMZzU7PZounSEvMWAA+t8pm18gjgxpW9NUa5PSBqe1IEkpaE2dlPc2h/LQMbJXu2hQcnjzREHMMjb5DcUv7WnT9gqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN8PR12CA0017.namprd12.prod.outlook.com (2603:10b6:408:60::30)
 by DM5PR1201MB0122.namprd12.prod.outlook.com (2603:10b6:4:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21; Fri, 30 Aug
 2019 05:35:53 +0000
Received: from CO1NAM03FT036.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by BN8PR12CA0017.outlook.office365.com
 (2603:10b6:408:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 05:35:53 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT036.mail.protection.outlook.com (10.152.80.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 05:35:52 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 30 Aug 2019
 00:35:47 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amdgpu: fix no interrupt issue for renoir emu (v2)
Date: Fri, 30 Aug 2019 13:33:15 +0800
Message-ID: <1567143195-22090-2-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567143195-22090-1-git-send-email-aaron.liu@amd.com>
References: <1567143195-22090-1-git-send-email-aaron.liu@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.7.4"
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(376002)(346002)(2980300002)(428003)(199004)(189003)(5660300002)(186003)(568964002)(6666004)(356004)(2476003)(50226002)(476003)(2616005)(54906003)(126002)(16586007)(53936002)(426003)(486006)(8676002)(26005)(11346002)(336012)(86362001)(44832011)(8936002)(446003)(316002)(5000100001)(81166006)(6916009)(7696005)(2351001)(478600001)(33964004)(14444005)(53416004)(70206006)(66616009)(76176011)(5024004)(4326008)(70586007)(2906002)(81156014)(235185007)(305945005)(71190400001)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0122; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72e730e3-506a-47e3-11be-08d72d0bec6e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074);
 SRVR:DM5PR1201MB0122; 
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0122:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB01221C2A07C6793D3642669AF0BD0@DM5PR1201MB0122.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: b1X0R9ASl/+vpSsmMay4WRESzdFyfVJjlKda3RJXPVdOWhh3TQ/zdgCl2Yqi5T/5bQbWR3SQZoSeNd1M9Ou0vZXSJv64ISrDvsEsbT6lCQuungF91aIZmjES+eOf5V+h9Ti1e7Xl0+pnzirzvUznigwZ0YVOJPGbpGx5TTuoDjrSkP4Qd0yK7PBTrKMjjFk2CRDCzzB4zo6Fi7g4k+J1pSPJV67W5nJKXMV/jUsZl1N7349BdanowkddqZNOXYwZ9ov8Tg1DdTQzC/w3jvZ/8DqUViJw8Y1s31qpURhWTeeJm5QLIPr7B50LlcI1v1nMj9AxeRzRuHTGcKckHskHvmYcoo7wGMjGTfKOKwM4NW1+pV45xn1lEJ8GqGduPnIImedz8XNL0UiMGobDGSQPufCplmDhWwSa10/FO7TthpU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 05:35:52.8819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e730e3-506a-47e3-11be-08d72d0bec6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0Vy3RKwkd96Xho4ea0czLVTba+QhmCo0VRgSw3qQns=;
 b=uNoWI/SQzJD0Ly10OE1gYWriquCG2KnW8doYBHrDXuerywH+nAlEpzmhHyFf0h/25+JVqrHhXlQ5UEWi3dBjEoWTauQgj/DyK5abeDkHd4V7o9SjsQvrsHFdok+CfGN2gMl/4wQ5Nt3B4JMUmy4YVterxoeHu4tRnDd1zVkBOso=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ray.Huang@amd.com,
 Aaron Liu <aaron.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--------------2.7.4
Content-Type: text/plain; charset="UTF-8"; format=fixed
Content-Transfer-Encoding: 8bit


In renoir's vega10_ih model, there's a security change in mmIH_CHICKEN
register, that limits IH to use physical address (FBPA, GPA) directly.
Those chicken bits need to be programmed first.

Signed-off-by: Aaron Liu <aaron.liu@amd.com>
Reviewed-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)


--------------2.7.4
Content-Type: text/x-patch;
	name="0002-drm-amdgpu-fix-no-interrupt-issue-for-renoir-emu-v2.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
	filename="0002-drm-amdgpu-fix-no-interrupt-issue-for-renoir-emu-v2.patch"

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index f19268a..b273eb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -232,7 +232,13 @@ static int vega10_ih_irq_init(struct amdgpu_device *adev)
 	WREG32_SOC15(OSSSYS, 0, mmIH_RB_BASE_HI, (ih->gpu_addr >> 40) & 0xff);
 
 	ih_rb_cntl = RREG32_SOC15(OSSSYS, 0, mmIH_RB_CNTL);
+	ih_chicken = RREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN);
 	ih_rb_cntl = vega10_ih_rb_cntl(ih, ih_rb_cntl);
+	if (adev->irq.ih.use_bus_addr) {
+		ih_chicken = REG_SET_FIELD(ih_chicken, IH_CHICKEN, MC_SPACE_GPA_ENABLE, 1);
+	} else {
+		ih_chicken = REG_SET_FIELD(ih_chicken, IH_CHICKEN, MC_SPACE_FBPA_ENABLE, 1);
+	}
 	ih_rb_cntl = REG_SET_FIELD(ih_rb_cntl, IH_RB_CNTL, RPTR_REARM,
 				   !!adev->irq.msi_enabled);
 
@@ -245,14 +251,10 @@ static int vega10_ih_irq_init(struct amdgpu_device *adev)
 		WREG32_SOC15(OSSSYS, 0, mmIH_RB_CNTL, ih_rb_cntl);
 	}
 
-	if ((adev->asic_type == CHIP_ARCTURUS || adev->asic_type == CHIP_RENOIR) &&
-		adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
-		if (adev->irq.ih.use_bus_addr) {
-			ih_chicken = RREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN);
-			ih_chicken |= 0x00000010;
-			WREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN, ih_chicken);
-		}
-	}
+	if ((adev->asic_type == CHIP_ARCTURUS
+		&& adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT)
+		|| adev->asic_type == CHIP_RENOIR)
+		WREG32_SOC15(OSSSYS, 0, mmIH_CHICKEN, ih_chicken);
 
 	/* set the writeback address whether it's enabled or not */
 	WREG32_SOC15(OSSSYS, 0, mmIH_RB_WPTR_ADDR_LO,

--------------2.7.4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--------------2.7.4--
