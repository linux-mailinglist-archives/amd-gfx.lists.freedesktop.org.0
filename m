Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C912F672
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Jan 2020 10:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEB36E1B1;
	Fri,  3 Jan 2020 09:58:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04356E1B1
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Jan 2020 09:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTEDEhZU13t3zD7QPdgaedFQ2UYPQxk4EUXCmTnmh6oN8v1wguwe1OqsWvHwSldzVkkUYEaRwEE2OgKK8TMuWQdw3IT+4UiGbgMo43GAJPBh5wdLIeeD9V+wTpoMKUa6/YpUiwSsUjAbegL8KVeuH7j5Uw+hTF6dwDbgZyLUkpo9eWRlpQT777Ifxy1iLp4smAOib1BXzvGrBXJa1zfAhheOQksCFzqHexKFj7XMiGA1hwR/3wEuly0iThKzJ08u5tr4WXUFJGzr/4hSO2C+N+Wkl6JHRDY7MAHrcd0F6CQqaIRXXHYq+Je88IaRp4uWvFnLpP65PyivN+ROaoMkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRtPyGCzMXuzgoP4v6OgjPPnzKECJ7L1cvSNHQOh1RQ=;
 b=igL5mUznRiDpQLE8N4lJ8PSSNr/aOmkE34vJarbj7Hfxx81GiKc3hqfrIlIAtVmb62uvrGMkVsLLD2j/m5YrLGqwyxv+nrYmewFcSStiL/CVJoDIAtp89HtT2gP6QdsQrsBxwNhrbAtoTgZWiL2iQvJncXQzS54PWPO5uJZ36qf+hRAIMZY8MILSJv0pJXdnx69V+IriFGu9A9dYAcGQOVKEuMJFT8bBZ5LvxYdivaGyx5UqibLkaKYRAXwMa99LbpWI5C8pnXjFsZVTOu6Y1KtnOZtTLcqS/7M00YHmUpsBpDYrWzlZoSLulXK+ZhVnXgVYQzoTiAeMLa9M7Tg4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRtPyGCzMXuzgoP4v6OgjPPnzKECJ7L1cvSNHQOh1RQ=;
 b=yhIdTuHqBS8miryF2phqrZ7Xpml6nV8wryqqLGQlEGE4ZOfiKSXdONIbNFpahSfcAoST5SpQ42A68zENrCRpGDI38aNZzy05S3qlOybamCZ6osZTytpydS3PdlswzDD2m3tQZ4P3Igsmyn5p2H8TvheJcjs6i130gp7Azn+VBs8=
Received: from DM5PR12CA0005.namprd12.prod.outlook.com (2603:10b6:4:1::15) by
 DM6PR12MB3468.namprd12.prod.outlook.com (2603:10b6:5:38::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Fri, 3 Jan 2020 09:58:26 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by DM5PR12CA0005.outlook.office365.com
 (2603:10b6:4:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Fri, 3 Jan 2020 09:58:26 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2602.11 via Frontend Transport; Fri, 3 Jan 2020 09:58:26 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 3 Jan 2020
 03:58:26 -0600
Received: from guest.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 3 Jan 2020 03:58:19 -0600
From: Jane Jian <Jane.Jian@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Emily.Deng@amd.com>, <Leo.Liu@amd.com>
Subject: [PATCH 3/5] drm/amd/amdgpu: L1 Policy(3/5) - removed ECC interrupt
 from VF
Date: Fri, 3 Jan 2020 17:56:47 +0800
Message-ID: <20200103095649.5068-3-Jane.Jian@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103095649.5068-1-Jane.Jian@amd.com>
References: <20200103095649.5068-1-Jane.Jian@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(428003)(199004)(189003)(336012)(110136005)(7696005)(426003)(26005)(2616005)(356004)(6666004)(86362001)(186003)(1076003)(4326008)(316002)(54906003)(70586007)(70206006)(36756003)(6636002)(81166006)(81156014)(8936002)(478600001)(8676002)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3468; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e199889c-c517-4d62-71ef-08d790337a45
X-MS-TrafficTypeDiagnostic: DM6PR12MB3468:
X-Microsoft-Antispam-PRVS: <DM6PR12MB34682E5F59AAC0E520131D07FF230@DM6PR12MB3468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0271483E06
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yO/Mz1feSGZn/GeyWFPL2YqNOcDhIgY2DVcMuu9S11lz4boTUhir+FzvqnMnMzTY1t3cy94J/YAJAwOtvuvrnroD4ogjb0Ws+cgFn8bcieBq6SV2PPvkbH9/VRPThMm8DaG1Sst7dS5BzdOeQFUqUkTfRuRiyBU/+UNoXBJZikrDaQUaYEigvfCUalSGadFc9LA20++REhJ4c3LAQ9qlzIcaogaRT9JES5MDCXaoGxWodF23b0QpQw5QFZ8IXxTOG4hhWM56tBXERXFBcXcnE2/CAW1bp0ivT24xMtlAp7kiuukyXh6AHG0OxfQ1eQqwcgq/RHiYGu3zuANc2EWmRaBPIUO+vlOS+ogQ4JZo+B4KFpF+bZpyePnNF7CZkaIxK1TnrNEL1Ys+du3ds8LcuUw3uTg2xe0xhzxjK+8YpsH8Csq9Cw9DwNUkVUVr5Zam
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2020 09:58:26.4877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e199889c-c517-4d62-71ef-08d790337a45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3468
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
Cc: Zhigang Luo <zhigang.luo@amd.com>, Jane Jian <jane.jian@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Zhigang Luo <zhigang.luo@amd.com>

Signed-off-by: Zhigang Luo <zhigang.luo@amd.com>
Signed-off-by: Jane Jian <jane.jian@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 2f4a013b3344..e91e2604c277 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -398,8 +398,10 @@ static void gmc_v9_0_set_irq_funcs(struct amdgpu_device *adev)
 	adev->gmc.vm_fault.num_types = 1;
 	adev->gmc.vm_fault.funcs = &gmc_v9_0_irq_funcs;
 
-	adev->gmc.ecc_irq.num_types = 1;
-	adev->gmc.ecc_irq.funcs = &gmc_v9_0_ecc_funcs;
+	if (!amdgpu_sriov_vf(adev)) {
+		adev->gmc.ecc_irq.num_types = 1;
+		adev->gmc.ecc_irq.funcs = &gmc_v9_0_ecc_funcs;
+	}
 }
 
 static uint32_t gmc_v9_0_get_invalidate_req(unsigned int vmid,
@@ -1117,11 +1119,13 @@ static int gmc_v9_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	/* interrupt sent to DF. */
-	r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_DF, 0,
-			&adev->gmc.ecc_irq);
-	if (r)
-		return r;
+	if (!amdgpu_sriov_vf(adev)) {
+		/* interrupt sent to DF. */
+		r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_DF, 0,
+				      &adev->gmc.ecc_irq);
+		if (r)
+			return r;
+	}
 
 	/* Set the internal MC address mask
 	 * This is the max address of the GPU's
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
