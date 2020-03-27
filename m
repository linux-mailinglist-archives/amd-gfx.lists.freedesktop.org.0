Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA376195ED3
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 20:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC46E0F2;
	Fri, 27 Mar 2020 19:32:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760079.outbound.protection.outlook.com [40.107.76.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78D6E0F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Mar 2020 19:32:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E083bfQYv9oOhq6zGMtuswLDuDsj7BLV5aoRZ8gML2uWj4DlTBUUUGBWoCqKrZVYoRPq4dwGgoqc6+QhwBJ4cist2GEmzZI/IJtPmpD1zJOLtHgm1dGE1tjhvYquPQqD8jUsKS8J1K3pZg1maqV8bDtSwYbGuShlFO0+waQUc8U0oNbyxy1lLnrl3s09m/2FQqEAyM3OZsF1j8/HJnzZxZP1rZbnAzmP9t6q6I0M1QJDoWOuynUc7EvP6dvzWebstnqd+6vM6du+sOQHfPc1lBChb/Aio3FdLSbu0NjV79Y/Kq+6XYubCN5E6Vg0pYWWcAj/PPNnkwgTKHwKnoIkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3ZuZnTU9qUlb1IJukm1Xe8jmvKZasX67+j+Oei6Q+M=;
 b=lMsVFgRVrs35f8O0eNbke5s7vPSLT9m/N845ENNkJV6MmKgwAANrDez2ZlIJyKn5PrMCMzSDw34/FnGluFBgb5dEAmPEqCrIfqZnZEL3Di2UX1b/NXfIKmFcd2ce3NPQB+15OHpxq7B/EdLcbXflbxjkBaPOmZjwS/B+Bjw1k7yoM8naBkf2DAN31mi+dH52OmxCXFtXGu7ZGFyJ1h5/ZqencVf3W+ui27ar+IbbDPwk09bRB3NwVkX1b8vjp4ucS22bsDelRnIlEDGzM79GfI4cKLB0KIAmRul5jBr1vmqnjfYc5T7iCXztRf2oSlTopcFfuNrFanrP1Z3fZdzg9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3ZuZnTU9qUlb1IJukm1Xe8jmvKZasX67+j+Oei6Q+M=;
 b=vFDFDKaKwJeptmXbamYnEtmRjxkqoxNb/yaMfH6y50FZmkDp5ubf1FppyqPBHsOQSjXUttMgwaTXZTqUZj2ZUDBmkEVHH2p7UzfSLGOrHWTViS+59OWyjdQKmFx1ttHs0touvKtW0B2b/FnT8Ud9smc2mBrNAu46m2FrZTu8Njg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alex.Sierra@amd.com; 
Received: from SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 by SA0PR12MB4560.namprd12.prod.outlook.com (2603:10b6:806:97::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 19:31:59 +0000
Received: from SA0PR12MB4576.namprd12.prod.outlook.com
 ([fe80::8d47:3ca5:5a7c:c047]) by SA0PR12MB4576.namprd12.prod.outlook.com
 ([fe80::8d47:3ca5:5a7c:c047%7]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 19:31:59 +0000
From: Alex Sierra <alex.sierra@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: infinite retries fix from UTLC1 RB SDMA
Date: Fri, 27 Mar 2020 14:31:37 -0500
Message-Id: <20200327193137.8099-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: DM6PR02CA0118.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::20) To SA0PR12MB4576.namprd12.prod.outlook.com
 (2603:10b6:806:93::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from alex-MS-7B09.amd.com (165.204.78.1) by
 DM6PR02CA0118.namprd02.prod.outlook.com (2603:10b6:5:1b4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.20 via Frontend Transport; Fri, 27 Mar 2020 19:31:58 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.78.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 221d1797-4ffe-4895-bd92-08d7d2858480
X-MS-TrafficTypeDiagnostic: SA0PR12MB4560:|SA0PR12MB4560:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4560377A979B56D64FDF16B8FDCC0@SA0PR12MB4560.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0355F3A3AE
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(1076003)(86362001)(6666004)(6916009)(186003)(36756003)(26005)(44832011)(8676002)(7696005)(66946007)(8936002)(4326008)(52116002)(956004)(81166006)(81156014)(16526019)(66556008)(2906002)(2616005)(6486002)(66476007)(5660300002)(316002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SA0PR12MB4560;
 H:SA0PR12MB4576.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yAUhR+j68KqJox1Rx9RtHKDJ74QZEEkJ3hXHzkGsEkd5i1zMXjenxzZisQZF92XFKxhkn32wlbtZ34FBFfvOUo7HUpZj0Ib7JdpSxbVmgFnhSwjLqAN5ZPK/MhgD1QxFUpHIzkn6mSjqthCSLTmAue3NP+P1rAG3dcnTkLC5x9yZABFWPzr570nNzLEEPH1O9rbXB115XhnaXhIMfKPqbf1tNl7DS62p64s5l9sUuuszHqh2E8jnQ9gf0cMJNLZpZDIqBrKRJHEV00jJk1fvfPW+Fz93AsWFr0SfiTHptOeGg1OlXqr/ARfuJymy6HhlZkg0JL8EmnT7SSVo5UYuDOI0Vj1Ief8rS6aY3DJ46+gskLi59a3AgEAX34FYrdKvmXwPt1F0a70syZ2AijJEW9NKxs+ZTq3Vg39SV50jLgV+eVo0i2tEUiNox8tagK2J
X-MS-Exchange-AntiSpam-MessageData: CiiUzAXrbyoH614TZEBx+a4dEgeBmpq91wf2eKA39seXJF7EVTU9/D9a4XAnqaYarK2/1wmv2aVqqXSVwYsmvipOdW3jnH/gmMFq5OTaL8oSJO5CprnUehtpxp77ZrZEfBxMCT67q1i/o+gnY65TUw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221d1797-4ffe-4895-bd92-08d7d2858480
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2020 19:31:59.3011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJO2+2zgnwbVo3NTbVzopYF4m6LL5VWMGLuEtJ6yNEAB8FShSo4ZyD6Jq4DKH+JpOAwoJLoBL5kgX0zOpNakFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4560
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
Previously these registers were set to 0. This was causing an
infinite retry on the UTCL1 RB, preventing higher priority RB such as paging RB.

[How]
Set to one the SDMAx_UTLC1_TIMEOUT registers for all SDMAs on Vega10, Vega12,
Vega20 and Arcturus.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index 646e43c205b8..55ae4e6c4939 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -115,17 +115,21 @@ static const struct soc15_reg_golden golden_settings_sdma_4[] = {
 static const struct soc15_reg_golden golden_settings_sdma_vg10[] = {
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG, 0x0018773f, 0x00104002),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104002),
+	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_CHICKEN_BITS, 0xfe931f07, 0x02831d07),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG, 0x0018773f, 0x00104002),
-	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104002)
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104002),
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 };
 
 static const struct soc15_reg_golden golden_settings_sdma_vg12[] = {
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG, 0x0018773f, 0x00104001),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104001),
+	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_CHICKEN_BITS, 0xfe931f07, 0x02831d07),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG, 0x0018773f, 0x00104001),
-	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104001)
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG_READ, 0x0018773f, 0x00104001),
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 };
 
 static const struct soc15_reg_golden golden_settings_sdma_4_1[] = {
@@ -174,6 +178,7 @@ static const struct soc15_reg_golden golden_settings_sdma0_4_2[] =
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_RLC7_RB_RPTR_ADDR_LO, 0xfffffffd, 0x00000001),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_RLC7_RB_WPTR_POLL_CNTL, 0xfffffff7, 0x00403000),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_UTCL1_PAGE, 0x000003ff, 0x000003c0),
+	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 };
 
 static const struct soc15_reg_golden golden_settings_sdma1_4_2[] = {
@@ -203,6 +208,7 @@ static const struct soc15_reg_golden golden_settings_sdma1_4_2[] = {
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_RLC7_RB_RPTR_ADDR_LO, 0xfffffffd, 0x00000001),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_RLC7_RB_WPTR_POLL_CNTL, 0xfffffff7, 0x00403000),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_UTCL1_PAGE, 0x000003ff, 0x000003c0),
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 };
 
 static const struct soc15_reg_golden golden_settings_sdma_rv1[] =
@@ -222,27 +228,35 @@ static const struct soc15_reg_golden golden_settings_sdma_arct[] =
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA0, 0, mmSDMA0_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA1, 0, mmSDMA1_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA2, 0, mmSDMA2_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA2, 0, mmSDMA2_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA2, 0, mmSDMA2_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA2, 0, mmSDMA2_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA3, 0, mmSDMA3_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA3, 0, mmSDMA3_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA3, 0, mmSDMA3_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA3, 0, mmSDMA3_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA4, 0, mmSDMA4_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA4, 0, mmSDMA4_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA4, 0, mmSDMA4_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA4, 0, mmSDMA4_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA5, 0, mmSDMA5_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA5, 0, mmSDMA5_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA5, 0, mmSDMA5_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA5, 0, mmSDMA5_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA6, 0, mmSDMA6_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA6, 0, mmSDMA6_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
 	SOC15_REG_GOLDEN_VALUE(SDMA6, 0, mmSDMA6_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA6, 0, mmSDMA6_UTCL1_TIMEOUT, 0xffffffff, 0x00010001),
 	SOC15_REG_GOLDEN_VALUE(SDMA7, 0, mmSDMA7_CHICKEN_BITS, 0xfe931f07, 0x02831f07),
 	SOC15_REG_GOLDEN_VALUE(SDMA7, 0, mmSDMA7_GB_ADDR_CONFIG, 0x0000773f, 0x00004002),
-	SOC15_REG_GOLDEN_VALUE(SDMA7, 0, mmSDMA7_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002)
+	SOC15_REG_GOLDEN_VALUE(SDMA7, 0, mmSDMA7_GB_ADDR_CONFIG_READ, 0x0000773f, 0x00004002),
+	SOC15_REG_GOLDEN_VALUE(SDMA7, 0, mmSDMA7_UTCL1_TIMEOUT, 0xffffffff, 0x00010001)
 };
 
 static const struct soc15_reg_golden golden_settings_sdma_4_3[] = {
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
