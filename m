Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179318FF72D
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2024 23:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D736610EAD9;
	Thu,  6 Jun 2024 21:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KSOBL+d+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C330810EAD7
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2024 21:57:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWN1+8I6vk672Wc6LeVICXg0Pzz1GYKYeCnAVCxVTpq0FI2X5siDjYHEOI8Y6R9ETo/Y/OyygdK5kNht4cbj410OMv+bfZvjOqylMsaVg77dzfkGaN5vvaXFCN6zgdKUuWWB4DvPgKezOfPr6OScXWPjdMHuru+ieSTYf+I/PF1o7H85/D3OZBEd2BceRxmVuxmEbHjVwuaCMGovpv1ive2SF2rnFqvjjUijBqIFUT58vXUs2LTF24s4eQ1SVSFfGX+teBV64k8id1TRnOFOHFl8ps+L9Y9eOILtkjPrNNXlsk26kprp7X1twOMJ/9ig0nAsqnemX7T6AZ9WEX3vdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajAesSoQFC/OSnoimllLVsX+mMKiYMq0ZCF1nzSPBEo=;
 b=U0BAr0v2xziljUqyHQQXSm77ZQyUn+XzVaBZr9CtnIbZw85nZ2zzoGW+6jkSFTfJ2ScEdjK6d4XHf1v1j0KH5xnUygVDzPSILOj/assfo5E9CISUifJPeufk32744HIKBfolbnjOgEvY6RWv+HNBOLNuWtuGeO0N9QGyakKJolH59EuWyu4iWiuA38tS/BwHTQytAKevH3C9H8s1WGuGXOmXGbtTIPueJIq9+kTcgVo4ukkSCmzi3+YMCpcyUO9mzAMASA9/63VQb5YAnB5v9jG1DeQNeFxrioYJsrMXbqEj2zjOchH53iEBcgs7xA9T0Xg/5YmBEqPZo2oRsGe0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajAesSoQFC/OSnoimllLVsX+mMKiYMq0ZCF1nzSPBEo=;
 b=KSOBL+d+575n38zPYhRCG3p1cMZO8u5VRM1rWkrDN1S9SjveXa/zMSW6Di7tp+vdOWe2Yl8/tEavg28YMC2QIKAJwpAbL5QyodjSGWO1W2gveFPXMHx6CJqx+22e737UsVdWBLlSDAtwCl4pT5p1oG004M2N6rh6mSdRffRGbJY=
Received: from MN2PR15CA0059.namprd15.prod.outlook.com (2603:10b6:208:237::28)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 6 Jun
 2024 21:57:15 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::c9) by MN2PR15CA0059.outlook.office365.com
 (2603:10b6:208:237::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 21:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 21:57:15 +0000
Received: from mkmmarleung05.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 16:57:13 -0500
From: Zaeem Mohamed <zaeem.mohamed@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Michael Strauss <michael.strauss@amd.com>, Wenjing Liu
 <wenjing.liu@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>
Subject: [PATCH 17/67] drm/amd/display: Update FIXED_VS retimer training
 pattern delay
Date: Thu, 6 Jun 2024 17:55:42 -0400
Message-ID: <20240606215632.4061204-18-zaeem.mohamed@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606215632.4061204-1-zaeem.mohamed@amd.com>
References: <20240606215632.4061204-1-zaeem.mohamed@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 2776e2af-f6ce-45b1-da8d-08dc8673a0b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0XQpNnlrQcngOA9CNxWTrYG5aJdjZEAv2tFbiYFPUb3OTXsMF/Aqz+Ni/fxN?=
 =?us-ascii?Q?qn4vAzn7rj2cYcWuaOJbe5XaEFO+iX5mRYxmwvG9OF2sqUFzl6Y4CarPdouh?=
 =?us-ascii?Q?I8p6881expQvdVh4hsHiTrbo0q1raXJOOnEmz8e8H+oKYVqVVdM9w5O1PDhN?=
 =?us-ascii?Q?7EW+7Lhp5RRGHkZ/vCJr6rG9qqyxQoODlm2aN+xxogpFqYeF0LLkePzB5lfH?=
 =?us-ascii?Q?zAbqRWkRmucX0p6Tewdx6gzPlvd2cBR+SPqNi7pMaFbd6Lwlc9GuP2HZHPic?=
 =?us-ascii?Q?2Ek2qCwJcUcF6y4bLXQDwesBEbBBBJ3MIE7yddm4Yb3ebLBFHSPh2U2gfOck?=
 =?us-ascii?Q?K0lKsLmcEACVMr0S6eJJ00S1hOjfm0JpARyTzA+1xvy74NWZKTESbiSgcwOF?=
 =?us-ascii?Q?TaNENHd+6UJ/g4pNfUhSIUWAExocHBNTIjOXUyYzLT7xU9RLmisltfzNWYSv?=
 =?us-ascii?Q?oivgwrQMbNGYhPtDW5D/x5VLZvQwuR05lmfjPcjo6tHukjqQ9Ar/ZgJde3fx?=
 =?us-ascii?Q?Qv1YvqWAysrhItwM72gNuEaPGMEkH3FqBpBqS6b9b00lIHwiBR76dMES0k8V?=
 =?us-ascii?Q?X1oa4NYKM8YdLw47UBfUmBFDcMs8+iOvRrAcR4ER61NSclyMpN6ivk5j3aYc?=
 =?us-ascii?Q?ehT7gpvaBDvo1tkKMICniDvekRap9UvC6LmvMQRpK8MW+V8GcMD0vig54x1+?=
 =?us-ascii?Q?I2iDQ2MLmAlw4UWMWIrsZ8m/mCWu0Zu67eHN0Dt0uNMZ04VVXdXD6uQ9WCY7?=
 =?us-ascii?Q?meY+IKFVnRKn5r8O/MQdbpxo4c93UyILZTsk8hCK3X4jxDvtPHY0QspVLzqQ?=
 =?us-ascii?Q?kRKWQjz0ioWV5OGc8XQP5gpKpGxivxojuuORHswkqzca12/XJS4hIowGT+/u?=
 =?us-ascii?Q?x+TCjSeg3mYsOcb/HnWuuNMIRTzg2fSBy4odFlFKJeEva3Rj5XE+tZ/3ljRG?=
 =?us-ascii?Q?9Vss+YhSS/I9nTGvWlT4dWOsBkknTuNSFzsRnUiETce+zIkXPbUciTIGwR/F?=
 =?us-ascii?Q?8Ykpiu4Rw0nSSis9j0WzrToES5B4ck7KZeX6EjcjmajbDAqrZ4R4/npkgdLz?=
 =?us-ascii?Q?c7mqRAbCY0ycf05lGXZZ6TPa3e2MlsxPw2fvQHStE4qOt/0RR7dT5FEkU2++?=
 =?us-ascii?Q?79ZpgJChvf2qd+KxjVzebAD2NFBaARwrGyvZ5cNB4tDns+U29G3HJX+uNyzC?=
 =?us-ascii?Q?PqYrlcymq4uyIldKN1KJhfBPc7tcAnhqMMnxasRtHETKKv0TpVGxgRgyvc+d?=
 =?us-ascii?Q?68bB/B2eLPYLu/lyhJfUkSiBKw7Ck1iHpMwdDrXzPmrOIsekqoD0TaZ0C21i?=
 =?us-ascii?Q?6GLlguX8tS0nGUi/w9hY1zB8iAkeOiIDzLKRn7yyGa+/I2GcJniXwiITxBvX?=
 =?us-ascii?Q?KzUnZNM9efBeMaGS/vGI2n5xOTnEbbh3ZPWOxSeGRfXFpSUJVg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:57:15.4907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2776e2af-f6ce-45b1-da8d-08dc8673a0b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
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

From: Michael Strauss <michael.strauss@amd.com>

[WHY]
Needed for PHY patterns as well to perform electrical compliance.
Also need to increase wait time from 30ms to 50ms to resolve very
intermittent UHBR20 link training failures.

Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
---
 .../dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
index 5302d2c9c760..116ff37126e7 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_fixed_vs_pe_retimer_dp.c
@@ -168,9 +168,9 @@ static void set_hpo_fixed_vs_pe_retimer_dp_link_test_pattern(struct dc_link *lin
 
 	link->dc->link_srv->dp_trace_source_sequence(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 
-	// Give retimer extra time to lock before updating DP_TRAINING_PATTERN_SET to TPS1
-	if (tp_params->dp_phy_pattern == DP_TEST_PATTERN_128b_132b_TPS1_TRAINING_MODE)
-		msleep(30);
+	// Give retimer extra time to lock before updating DP_TRAINING_PATTERN_SET to TPS1 or phy pattern
+	if (tp_params->dp_phy_pattern != DP_TEST_PATTERN_128b_132b_TPS2_TRAINING_MODE)
+		msleep(50);
 }
 
 static void set_hpo_fixed_vs_pe_retimer_dp_lane_settings(struct dc_link *link,
-- 
2.34.1

