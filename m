Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9157B376
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Jul 2022 11:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E04310F938;
	Wed, 20 Jul 2022 09:07:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2448110E093
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Jul 2022 09:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/wJBS9CP6cdwyHlgZ24tDgbXiZkmz74UVeQFSZE9TQt9Yfv/uc34X/sO4xsWQh+uqvRQ/5GqqnFq8sNxbAd1PHdtbWZ+KbWgZQJm2EjBMvX56cTobJiDDf9B4qopNXuQt+tDnKdH8lU3ruABm+f6+4mqdVv1ZkNdksREye5UXBK+/6VMeycKqoNuCzBOmW0aslU6VvIGsGDZdbd+R7QTuiStemD7GP5uIoQAagF13YAVWvKjAghMWWOqWM0x4B0Ty3AGNbr8pL81knxp/zqmhCjLivB1B4GfEjZDL7/Ww5D9DnitjDEkFjZ3Uupnocd5L6cRnUP/XbvCUH5kLLcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuzJNI4mQTnZZaCCwOEbVsvl0BnO2N6MTWphzxajNRA=;
 b=KQ5AMB0zDMMB7r6EuVWYx4JJQyHHxqMUlpTMG9yjyqhxU7PTNaOGi1wwOZuAzgBvH9/rKpa2f/o9exeJSElrEyd64Ak03sNyZ8lxL4P634bac0r/Gl/Zr5lPsz7z5sJH+uXB3bhuYn8cheZDhgadmaLN1ViOLv0LynPfol3lp/2hXJuwuCn0VXHUe3CwTFWM5g0vuw21VonLxbgQYbFWftKOgmOYNoXtSnpZDp1Atex6UD3VnjzcJWM6D80uRTbkH1ft+gRNEqaqerrJG3rdjCIQgtxAMbf2rhHpKM73Q8qrdY0rcdLWwoeabhLNrZfYaZXnIWyi9X6wLJwvVNKIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuzJNI4mQTnZZaCCwOEbVsvl0BnO2N6MTWphzxajNRA=;
 b=1iSNmcwMfSKMNIESifvQJAwUyhMrtwCSbGuykMMBgaII901CwAtK0I0wEw5hN60r1xQmWd8zEbR2D7ZF+7NCJdtzYHRtcLaLGlD/EDlsHni+BL0Cjztui+bmMONJLFVFlE+mGAKHo1GHOAWv5/nQ9EF0pPSqBOa8oM99l4dEPQc=
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by DM4PR12MB5232.namprd12.prod.outlook.com (2603:10b6:5:39c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.17; Wed, 20 Jul
 2022 09:06:59 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::f4) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Wed, 20 Jul 2022 09:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 09:06:59 +0000
Received: from equan-buildpc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 20 Jul
 2022 04:06:56 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdgpu: drop non-necessary call trace dump
Date: Wed, 20 Jul 2022 17:06:39 +0800
Message-ID: <20220720090640.47497-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd12bc7-5b6c-4c3f-14ba-08da6a2f340a
X-MS-TrafficTypeDiagnostic: DM4PR12MB5232:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Se+4yf7sP9iWGNC4WpsEiHXAsscNjlijSIZUbdqUr97b0PVfdUSI7P9M5VZBcZvvXtkoo2plhDL+OMuXk1RhUNkJ7GvfU55MX4w9GQj+DVQLKFqTAkmyI6tmDEhKaYc9/Pi3Cz8PboaB/VkC1JbkjQc+RK5Dzv9cI7v+gCTWSiLE8UQKXyfRh5CQPbdwiYl9ALhR6QCm9O4eVG2hlSC82AJ9FU0o6GrWdZ3I9nD7PAYhN9v+A+vLOtbpJ97QAkgIRk6eO4dMV5hzUJEM6I6fxgzpF07xoXdqmakbX2PgZTHDxvKbeiADxGquRsN9n9R/tljZ3X2ZMIITojDwFo402Pt2VIjl0Cpgpjq2GkuqSQPpfb9LsZ4QRBeFhQfifc+gG3UkEnWPZSTTaNcvHVebw4e7o4p4DVbzJCpUyhg8BTEPA44yXrw2cFTtMrZQXejyt4T81JpPMQIxWqFy60sLhhwTvrJyRkOG3kMfSrtIDxEV9JUlpGui/v6A8WN6wy2OZS64rksGYbKLYOJVoDLdhA7gavOb5iA8txCmEIb7Wc4IqXRhB//x2scD+cX8kJIFArpa3xDfp2Fw9SzJSJN+sArK/S+yuGbHZ1eXSigUkD67cIh93bOji3+DZ45iqsUSIq9pZsBIjash5VhBanXsH0IrBirB2Hr2xbhhzKHVNxJCFFBe3u2iFvMWKTO4R3+GK2s3oirJNzUHd3z/bOlLV4R7bFqWGSNymMFBTuHlZaHyE8w3Phlp2SvNnfQwDinigXLfYQfJCycJRXTODNnqEKLn/OrMVuiUwV1GtUzojZbKfxUxer14jihDhS/CP/9rVAZ4bVBKvZx3j8ZmiCwzog==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(36840700001)(46966006)(40470700004)(82740400003)(41300700001)(478600001)(7696005)(6666004)(86362001)(356005)(1076003)(6916009)(426003)(16526019)(54906003)(26005)(47076005)(83380400001)(336012)(81166007)(316002)(186003)(40460700003)(8676002)(70206006)(36756003)(44832011)(4326008)(4744005)(8936002)(5660300002)(82310400005)(2906002)(2616005)(36860700001)(40480700001)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 09:06:59.0898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd12bc7-5b6c-4c3f-14ba-08da6a2f340a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5232
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
Cc: alexander.deucher@amd.com, Evan Quan <evan.quan@amd.com>,
 hawking.zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This extra call trace dump comes out in every gpu reset.
And it gives people a wrong impression that something
went wrong. Although actually there was not.

Signed-off-by: Evan Quan <evan.quan@amd.com>
Change-Id: I884af405b6b3cd52b9024408a21fd39811a01f4d
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b79ee4ffb879..1b1a70a6da18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4667,7 +4667,6 @@ static int amdgpu_reset_reg_dumps(struct amdgpu_device *adev)
 	int i;
 
 	lockdep_assert_held(&adev->reset_domain->sem);
-	dump_stack();
 
 	for (i = 0; i < adev->num_regs; i++) {
 		adev->reset_dump_reg_value[i] = RREG32(adev->reset_dump_reg_list[i]);
-- 
2.29.0

