Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C037777E8F6
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Aug 2023 20:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE110E395;
	Wed, 16 Aug 2023 18:45:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B74010E395
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Aug 2023 18:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bxs4IFe2sQqdphw0Qy3bVBqlh5wO2rNOeKziIPdwCcP1SmTvS4TUPgG3Tb0nRS/m3sKeGDbdBL44UVc9C/vdc5Vqyb/t15VB8vvGW6wAYFdeVIFT1xmqx/L2r8lnDpQrpq5m2mCYVMfhh446TWqGQgmJuf/AKsPYyyI5k721zdLQosKaIh5nrnmKK0UzPIO7PsTgfG7iuI+k1OEyLLD/50fe4Vtl7iQ2gaNcAcNP7lXoNOa54eqH2iHeXeF/br3ot9GWPB69Yl7r1E8bqjTawCFCCeYSxAVGLxPTC3Yzjd+RjvBIizvCDRCgHLeoQT2r0o9bRfAii8/hLKP/2HxWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lEULcly/HGDKBdtlTgREAkQI68MMBKQQvGB4St4hAU=;
 b=j+66i6EEcI1RrqpA4z/SGK9z/OlwYu7OubGhJfuOZBRxNeVUfrUxWy58De2BNyXDzA1XqvHzzEqrplfXK/yqFN8oel0yciZ05a+R7LPlTsi9NFpPY2BoC4vSuUwuUFnmAGpi0T75qA9saewHZmBWIUq4et9YR98NUECPFSiGXvV2ufDw14iNR6RPs/xHadzqSWfKumsjqgXz0UjITSgWr/OwO/cIlx/aMEuxXT6v/43KpcuwuKUgGCp0CPNULyB33GCgdzbjVYRNYozcwKDuTMxqqb9Ckobkg0MsAXpSFmHgB1vknujsRgp++3bG0h4zwpTciCHI5dT2BKWQ4VMD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9lEULcly/HGDKBdtlTgREAkQI68MMBKQQvGB4St4hAU=;
 b=psZDo3vRIGwNO035lq8sAvHMcIQO8+xVJNyg6rQbPUQSfpX9BkHzQgBZnYvCrbZ7/JydP6om5vt9EhelMOLVJNLiqzq0boBg2zVZDRl6xxNAX2r2dMoI8NTzMb6ClYFr9XUBbBKKM38OYIn9EJiKvjzDL/CGNq1ph6FA+OPKWZo=
Received: from PH0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::23)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 18:45:02 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::2f) by PH0P220CA0023.outlook.office365.com
 (2603:10b6:510:d3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Wed, 16 Aug 2023 18:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Wed, 16 Aug 2023 18:45:02 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 13:45:01 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Felix.Kuehling@amd.com>
Subject: [PATCH] drm/amdkfd: retry after EBUSY is returned from
 hmm_ranges_get_pages
Date: Wed, 16 Aug 2023 13:44:50 -0500
Message-ID: <20230816184450.11165-1-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f4dace-d377-4061-eaf6-08db9e88e669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xW9VNKYb2SzWHd0AHF3jS3dp/IFOr6TFu/4QvhcY0saSFp+4FTT4ZJAdQLsH4XdxQka2OjOOnOf1WYKpRIDMmhQNi/ljc4ditF0Y1gXaSg556O/3a8G/INnrdibzBaFG0H81IH9sXixzwXJCIUTtEOSzk8P/gekOla4M+Y1qQoITXxtEuLfJmUC+Gc6cHoN6qLp1SbjCbauxeLp0r+FM3dg2WEXq5ikpm7s0qf9XO+3aSWMhI0eP8NIMIFKzLCrQfPQfu0QsnPHln05MCXFcGXvYgNGXWylJCJ0D/g9R9k45hs0vXlphZkq1/PrpJdkbHw3x1PmKsk2Gl68xmlC4SVi4hm+SDXU9j4S5D6H+Q4wmR+UkeQBgYtgzz/svEoQ+AB8f36juKVzKq0pCPOUR4M5JDdCaLeUL9CkXne+K/dLMExXc/+cdMJMV/g0iLhamO7DvPsXnDPneYWlcLCljxxA9bL94igD3TI9X5ur01j9kkpkYkCMsPZcMHye7Xb8cKT1JdyhpDjAwdLUY9i5ShNIni89lY/K3idahvZ7/KKqpRJ3k5ut03mzUezWekxwteVKuQpmFI30hqBnUUrqcIiftGzLNgAP+EF9R7FBDNGXJ1MzWvLyyfpMNYtT2kXyZvxmLJyqted0KV+cYJu3LFfNhbCWW4Pl1hqSblnltsk/dMcUgTE79Ruc5/CZiSd4shWsCFbEdIFAKS6l+DYQACrg3puSe23LO4dZ8abpAdjSMqf4OziP2QeVBuzL8dgQB4PzSJ5aH1HuKEOC62xe9UA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(70206006)(54906003)(6636002)(70586007)(110136005)(316002)(478600001)(82740400003)(356005)(81166007)(4744005)(2906002)(41300700001)(8936002)(4326008)(8676002)(83380400001)(5660300002)(47076005)(336012)(36860700001)(6666004)(7696005)(1076003)(26005)(16526019)(44832011)(426003)(2616005)(86362001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:45:02.0874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f4dace-d377-4061-eaf6-08db9e88e669
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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
Cc: Alex Sierra <alex.sierra@amd.com>, aristotelis.kollias@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

if hmm_range_get_pages returns EBUSY error during
svm_range_validate_and_map, within the context of a page fault
interrupt. This should retry through svm_range_restore_pages
callback. Therefore we treat this as EAGAIN error instead, and defer
it to restore pages fallback.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 93609ea42163..3ebd5d99f39e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1685,6 +1685,8 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
 		WRITE_ONCE(p->svms.faulting_task, NULL);
 		if (r) {
 			pr_debug("failed %d to get svm range pages\n", r);
+			if (r == -EBUSY)
+				r = -EAGAIN;
 			goto unreserve_out;
 		}
 
-- 
2.32.0

