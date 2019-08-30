Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08896A2C86
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 03:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3308C6E0EF;
	Fri, 30 Aug 2019 01:58:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720083.outbound.protection.outlook.com [40.107.72.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 401F06E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 01:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkJxLw/2UaN0MO9YsCnzBI9zhPPPYsgKdnxSIRYCIv6zHq6rkw/Ob7dkSKjBiRAFR/ejjxEJiua1xB8HCLgs0dEKTMofi8MxLHJ7R9SjY7aZRU5evw6demSFq4pKFwpoJwQTLnFekb0GW/rs5cZH5u13xzjesu4cs/Ea5uz5voejqMnNpffyXBC9EMks2r70aOVpz97hctkOpQFKQuzySHlosya2y6DYdckEpgxuY7eoqIiS/aVyRA0pOsjDUHSdNX/kxxUm2j3uO/l/Is+cUigkAkst0FZcRygSFQfdGK4F0XB535AmbBQnh18k+JONFQm/NJqb6MjT9xEe0QbXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nKC3iMRpYrfENESv3G++g+80Mwl6+F5UEUvBrDQF/s=;
 b=QFyK7tgTbP1qfYOE2HT5yy/SIw7uY7c/lO25DR7N+qmIX95FaHZu37A3MrPigERCR7Ru+HJkcrFFsZ20Z0ecd4xLEm5SYNUH6Cw9vv6gKPtB0FeuAqIGqysi6fto5ZFFy4a3YBmI+NmxOKCfhBae9JmrzUUqarhtWGLO0addxFGKu0zCRGNs+H1hKA6vtI0QuaDzI/77k5Nn09LMLpAPZgY+CJJ7QOr9aKw8r6b2MDTr2OHCIPqc79BfN+4TFpMfUtZq12RuVzJ23qEZmPrwvTkLxsoyNbK6iRGWVK0YD9CTq2Vai5soAM733XAsj3BKklf4NRZZBVm2FqeNZBkoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:208:a8::14)
 by DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c9::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19; Fri, 30 Aug
 2019 01:58:17 +0000
Received: from BY2NAM03FT045.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by MN2PR12CA0001.outlook.office365.com
 (2603:10b6:208:a8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.19 via Frontend
 Transport; Fri, 30 Aug 2019 01:58:17 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT045.mail.protection.outlook.com (10.152.85.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2220.16 via Frontend Transport; Fri, 30 Aug 2019 01:58:16 +0000
Received: from lnx-aaliu.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 29 Aug 2019
 20:58:14 -0500
From: Aaron Liu <aaron.liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: SMU_MSG_OverridePcieParameters is
 unsupport for APU
Date: Fri, 30 Aug 2019 09:58:10 +0800
Message-ID: <1567130290-7756-1-git-send-email-aaron.liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------2.7.4"
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(428003)(189003)(199004)(5024004)(336012)(568964002)(7696005)(53936002)(305945005)(5000100001)(426003)(8676002)(478600001)(2476003)(2906002)(50226002)(8936002)(36756003)(86362001)(476003)(71190400001)(2351001)(16586007)(53416004)(54906003)(564344004)(81166006)(81156014)(5660300002)(126002)(235185007)(4326008)(70206006)(33964004)(66616009)(70586007)(186003)(26005)(316002)(6666004)(2616005)(356004)(6916009)(486006)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3898; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aadafa23-c233-46e9-0edb-08d72ced867b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074);
 SRVR:DM6PR12MB3898; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3898:
X-Microsoft-Antispam-PRVS: <DM6PR12MB389817F9946DEAE2880A9C5EF0BD0@DM6PR12MB3898.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:279;
X-Forefront-PRVS: 0145758B1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: f9HVEzbzITBtsQYxrqJ4V0fhHMV7yV2apOHZTdUq6J3szi3SQuuxeGeUq/LYm7BserP+gPbDwTzC2KkofZBbzFJEL/W5yd1G7Ee7VLKyzRd/ohBerjfSaZhuECoBQxC8tBCebBggy/f5Yqdwxm2RwUd8HgcMFTkNAAeZAxCUOLIDh2mhvxlpd6x9ZGh2BqGdFHo5/XKxP9hpSPaqBnV6ZNhNLBrOYVCUOcCme0l/wVxLng+T65jNbXfDd1uXAIk1SYoBlHbZS6wMvKspMhXrNkF/UBYFopm8jjF1PdpBpTuMIf9BqrVG1QdrJZnK+y/Gsw+6yh5Mf8av0mbnQ/5FreBBC5qs04I8CXfeuXriuHneJaqnPvmnFZ2JomV6erZc8hY/mQ793XZMt+aX73P3lEhBLqaxhQK+cL40Pyywhf0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2019 01:58:16.8972 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aadafa23-c233-46e9-0edb-08d72ced867b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3898
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nKC3iMRpYrfENESv3G++g+80Mwl6+F5UEUvBrDQF/s=;
 b=rVdEQr1kPYqje3pc92ZwdfLtk/jz10en138ZrtkYru4sdsYuqATMCHVch295EvdxkCb2gDU7ZFcnGWh5sWMTrMF6nWfiqVDfhoxYwQ/K2MW96ZVfVywd2YxJ9h2nxNFOK5a5h0rTOACXt1AchoLsb0jFiDotZgkhvJQrV5ZKkno=
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
Cc: Alexander.Deucher@amd.com, Ray.Huang@amd.com, Aaron Liu <aaron.liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--------------2.7.4
Content-Type: text/plain; charset="UTF-8"; format=fixed
Content-Transfer-Encoding: 8bit


For apu, SMU_MSG_OverridePcieParameters is unsupport.
So return directly in smu_override_pcie_parameters function.

Signed-off-by: Aaron Liu <aaron.liu@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 3 +++
 1 file changed, 3 insertions(+)


--------------2.7.4
Content-Type: text/x-patch;
	name="0001-drm-amd-powerplay-SMU_MSG_OverridePcieParameters-is-.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
	filename="0001-drm-amd-powerplay-SMU_MSG_OverridePcieParameters-is-.patch"

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 8c61778..b726565 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1001,6 +1001,9 @@ static int smu_override_pcie_parameters(struct smu_context *smu)
 	uint32_t pcie_gen = 0, pcie_width = 0, smu_pcie_arg;
 	int ret;
 
+	if (adev->flags & AMD_IS_APU)
+		return 0;
+
 	if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN4)
 		pcie_gen = 3;
 	else if (adev->pm.pcie_gen_mask & CAIL_PCIE_LINK_SPEED_SUPPORT_GEN3)

--------------2.7.4
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--------------2.7.4--
