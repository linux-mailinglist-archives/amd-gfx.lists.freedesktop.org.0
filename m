Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8308D34F8D0
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Mar 2021 08:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5D6E18F;
	Wed, 31 Mar 2021 06:34:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1CD6E18F
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Mar 2021 06:34:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdUFgPZAg1UD2+pvTSwodU0GoCfB5j1K9/7YX4rh73y2KkmjvzPW2riBU86LTG9cmFY34Qws0fORdX3i84p4zIT8RWFUoL/bmZ2yX9W2I3EYYz59MeH3ZrG5w1WYe1F2Odyqwiri+wVll/aFqMNvE7PIl30m9LxVJF89BNRHBYmWF8JjQmPKBaCqidYiRMRkVQBOum0svu5woP4+rPprd+iWmefuZxZW/iFEBKiggFobIT9dmjam3Asn61sxB8m8xpRA1UimM+uZ5GJ9eIzgoJpW7XCV4+xetJjC2HhkB8ECty0LwupSuArDCHvvhtboLiKFzdGTj/3CMvx6wStbDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvANaICux6hZbsVL4Iqn5LmOgrS5jW9B1eJvIf5eU/I=;
 b=ffxF9eF/ahuRmdSjeQ5YHYW2/rw3zPxJDabqzzGNGnbvfYDYQNJr2o+VMp3XpuR3kqP6m5Px8MTyaZKnP0/JsbTTaJ6q/YwGWPHYSP9Xbj/gVMdESOjHWuCl6Mjxqx9WnTdBHWQHKw5cClOkayAZG+Zhn7j0QVKkETyxps/pYsNQcVN9JQXB6ZNjuut/7tKGp2PME67wRqNw99LO4MosiYWt/84+KaxQ9UIllukQqIxC0cxY0VGRKjpZtiKOpzl1By/7FdN/qamUP2cvkePh6e+YmAeeoFwNc25uT2xEYY1UvWU0kbZjz46hExEx+DniSXezjpbQQ6yRH5hnByqTIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvANaICux6hZbsVL4Iqn5LmOgrS5jW9B1eJvIf5eU/I=;
 b=2Lb0MNtAzIihJVmltHzGgsoiK9p65kju2W+VtSgiW6v1ydwNzGpYtrvX08wO6Uyr03EY/If6d8YG0kySONxT5EZUZdVNBhGFHMcm/ColDJc1htY7f9Dk2dMhDtnIyFLJcJpFo6aLpomGX8RtS8MWhSDTJjWcVQaX91Z+VzbLB4o=
Received: from DM6PR12CA0013.namprd12.prod.outlook.com (2603:10b6:5:1c0::26)
 by DM4PR12MB5152.namprd12.prod.outlook.com (2603:10b6:5:393::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 31 Mar
 2021 06:34:24 +0000
Received: from DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::29) by DM6PR12CA0013.outlook.office365.com
 (2603:10b6:5:1c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Wed, 31 Mar 2021 06:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT041.mail.protection.outlook.com (10.13.172.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 06:34:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 01:34:23 -0500
Received: from emiy-Z10PA-U8-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2106.2
 via Frontend Transport; Wed, 31 Mar 2021 01:34:22 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: Revert "SWDEV-238407 drm/amdgpu/sriov: Need
 to clear kiq position"
Date: Wed, 31 Mar 2021 14:34:06 +0800
Message-ID: <20210331063407.9065-1-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ba8585c-b4f7-4333-3083-08d8f40f0694
X-MS-TrafficTypeDiagnostic: DM4PR12MB5152:
X-Microsoft-Antispam-PRVS: <DM4PR12MB51525A343C0F200714B96B838F7C9@DM4PR12MB5152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aOVIkoTGJj7Si9FZjVg27j5dp1HTuBHBJXJBzbD+bO3nM3L+SD+8RlIV9LTx1ZfIhqj4G3oAQ3n6ZYwVE/v1sL4VNV006PEPV4f4R/zvtqkMIFaLkJWYOWJXazg2FBwkoq92AkiUv36wrkWec9R/lcuEKPKst4+WzjrzXmEGtmjy3v+qj33tjLVdwGOqxBVoEQqus0Om7OrWsbLw/drdaqCrgtW2Bc/0EECCpstoqqBRrbuxxPjFitYEIYuwutIivrEVIo6SQlZfjojQsFobQ5D0R19OS0egGjYUiCkNBdvn7JtapVJBG89QcgsVGEURx9W8v83IQduzUuwut8dhpSNcoRgR2gptj1vHmCrNjfHPdHqyzxY5s74cdEfjnYuqPxnl6OHaF+PEJrUEmgHCNGtwgONo7GPYscfD4X2pb+GbdCOmJPiqz5HctW7+JmV+VPLNTG5VKrFjSaDbB5BEDlkeqZPXFyZFRllLbzE4lQ8571W67r8k1pQeS4jOxCbgQZpBipy+OHUxs3qnzUZsHw2baWud3ybEBbh5hzpIf41VTQVoD23wYb/JoUcL3Yo/GrqLi7DdhiGmZg8qza+JlAkSOuvHwkLqensTf8tPInuIXKNcXKv1bwqZ1x5B6k45tqB/SosYub6XSOFrGqvqOi1+98rt4NYRRe8GS9j2xZVEXg8O4cvB9ME7EGyVlyYV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(6666004)(70206006)(8936002)(36860700001)(86362001)(316002)(8676002)(82310400003)(70586007)(7696005)(478600001)(1076003)(83380400001)(81166007)(336012)(186003)(2906002)(5660300002)(426003)(47076005)(2616005)(356005)(6916009)(4326008)(36756003)(26005)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 06:34:24.4107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba8585c-b4f7-4333-3083-08d8f40f0694
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5152
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

As already moved the implementation to host driver, so remove this from
guest driver.
This reverts commit 96f7d59858ada4a6372fcb249b04805d14482c49.

Signed-off-by: Emily Deng <Emily.Deng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index b4fd0394cd08..7e012fa1a3f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -7237,7 +7237,6 @@ static int gfx_v10_0_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int r;
-	uint32_t tmp;
 
 	amdgpu_irq_put(adev, &adev->gfx.priv_reg_irq, 0);
 	amdgpu_irq_put(adev, &adev->gfx.priv_inst_irq, 0);
@@ -7256,11 +7255,6 @@ static int gfx_v10_0_hw_fini(void *handle)
 
 	if (amdgpu_sriov_vf(adev)) {
 		gfx_v10_0_cp_gfx_enable(adev, false);
-		/* Program KIQ position of RLC_CP_SCHEDULERS during destroy */
-		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS);
-		tmp &= 0xffffff00;
-		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
-
 		return 0;
 	}
 	gfx_v10_0_cp_enable(adev, false);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
