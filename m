Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC0721D61
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Jun 2023 07:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C768610E11B;
	Mon,  5 Jun 2023 05:11:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BA910E11B
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Jun 2023 05:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FV+SxqL6U9dQ2BI2PTEoE7M43dlp2RkNMR0kjo4OZkAl1u5oi1o9LkQEnohloY86XKOK8OmWZ920Hhaxd/gAjj3lix66oFwAqUXJtGnnfpr/7ZWJgPgn8QdHELMxDxR0b1hCi4pGc65agk52S55kq5kK1f8wYJBsnFmYdz2yBCirVtAsnDZxtK7EiofHele/LKpizuo5bWF39txOy+/Qsetd6Q0+XuugdAKh3gPJ+Rd3dHpgyRgfMfNbd33jjfAVFZ6guctC0Z6AoaAcWn3FuUICc8qGpGnjrKQ3ITgyptcQuKUWeyyalJLZouHeuRvU/SloPTagtkMcliX2ookalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvWjveMGxAR4wHcZXpr1bat5DYo/yuO5Xdtf0OUs4us=;
 b=hKGebOw9raRxUDRsW5cdeKbIewAaqFbAwnG4flTs2fwYtYE3Ag4euRVEZgNwWnTWaHr3/ntcvmt1M6hRJr6aB1Q0Xglm7IuE5pLgNRPL+jjSfgV34h+3xkm2pta3ZBkhSmNnrBn7CHudFI9X41oYMLHtjNNKNM24xxWsSk4L5pvv+bXeq6WApKABFlEASHYUjKKHuFixqzs1PKwVTQyrs8DSQxvEsgtC3+R1X4KXpq8UqLFb1hDNL7+2FtONBF16/7LMdiFlDDlr3IRdQpJS6ZuEHlDCoG6+V8PeNAEOjNOM91G+S1gEdGcZwMKuyPcP+ovXVY9lYC0nbIS1QdsiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvWjveMGxAR4wHcZXpr1bat5DYo/yuO5Xdtf0OUs4us=;
 b=cyffJfWpz3+1LrZT9aNehOLrJLT73BUmLMheXoEwh1CMnS1xWV6/iisKnWAeq9hyMKDkOtV0iAH41r0+jAZszjbIlgH2tVKCurYTiGR3EDaw3qJegcMlBxhBVuRt45CnxLvl7ZI1rSrsPzjFKJBEeAYQ7Clg3Y0wCGn+za6FsV0=
Received: from BN8PR15CA0062.namprd15.prod.outlook.com (2603:10b6:408:80::39)
 by SN7PR12MB7420.namprd12.prod.outlook.com (2603:10b6:806:2a7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 05:11:23 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::f5) by BN8PR15CA0062.outlook.office365.com
 (2603:10b6:408:80::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 05:11:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 05:11:22 +0000
Received: from TRX40-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 00:11:20 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Harry Wentland <harry.wentland@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: Correct kdoc formats in dcn10_opp.c
Date: Mon, 5 Jun 2023 10:40:59 +0530
Message-ID: <20230605051059.2101230-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|SN7PR12MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: c02a400c-d9ed-4c19-8566-08db65834dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3THwFDb4X87rIYxM9L1+CqdYALKX5iAzUg8qY7kD0sUYoPmPbbm4fdN2TKb3AJbkLpovsmkYTKNcH4Tl4r4/yv8vxLtkJWRt6EyiSw65q1eYzzbFgClqhJRSVZHhholR29pTQJUFa6IvJvea7ZlD5Ujw4EWsbrpjioeveslwrzYNGPy9JvP/1tb6mHIBLKWDWPG1O41st18yjzZmXCbbX3SlqRneeWlLCLbdm8N17pAzd9cCuBT3STlIemhdJ+CKbuwTjDLn5kyU2CMltmJNfoVst2SN2cY4mUnBd+zW5D2R/k9qPvMNarcZM3ZM7c1VDnihNj0cQjpw/YvULTfeB2pjqG2qMMHqNSZopXj5g7JfprgxrymZ1hcHFCImwGTbmtKhXi4n3cdP54p/bcwV/8OlpJp0v6+hYhq1bWuchTBRdF3Y1YZZjAr9hu5tl3fqVIoDSQkPHIwrBmJoz+bi8MhxixLXfqRP6m4/2BW714JqUZWx+KCl6vYkZEzmVcLzwXM5/QO5sO66lES+nq7UbPPcv5v0Lel0MIFHIvkGLAaeeGZ3B7z1wprt4k78ZQ/7e6K2JOFfXrnDpx2MJDbiEFafXUdtDbmeFmfdbTmBiFE/duVi/4kl1bsM4XPmzqDSFR/7XgjJj87/s/gnHfsbmbUX6k+J5JKf0VLBtuR+VhEVO1HjCKoXVFFRiuIwK/lidaUNLueeMEN6WSfd+EYPn743oWmrO2I5O6O4KGaB3LQhX1diLKuZ71XURkoI0yOQToy+mjf2w3nMF1gry7g9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(1076003)(26005)(40460700003)(36860700001)(36756003)(47076005)(83380400001)(426003)(336012)(86362001)(82310400005)(81166007)(356005)(82740400003)(16526019)(186003)(2616005)(40480700001)(41300700001)(44832011)(54906003)(110136005)(2906002)(478600001)(70586007)(70206006)(6636002)(4326008)(8936002)(8676002)(316002)(5660300002)(7696005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 05:11:22.6104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02a400c-d9ed-4c19-8566-08db65834dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7420
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning:

display/dc/dcn10/dcn10_opp.c:52: warning: Function parameter or member 'oppn10' not described in 'opp1_set_truncation'
display/dc/dcn10/dcn10_opp.c:52: warning: Function parameter or member 'params' not described in 'opp1_set_truncation'
display/dc/dcn10/dcn10_opp.c:52: warning: expecting prototype for set_truncation(). Prototype was for opp1_set_truncation() instead
display/dc/dcn10/dcn10_opp.c:161: warning: Function parameter or member 'oppn10' not described in 'opp1_set_pixel_encoding'
display/dc/dcn10/dcn10_opp.c:161: warning: Function parameter or member 'params' not described in 'opp1_set_pixel_encoding'
display/dc/dcn10/dcn10_opp.c:161: warning: expecting prototype for set_pixel_encoding(). Prototype was for opp1_set_pixel_encoding() instead
display/dc/dcn10/dcn10_opp.c:183: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 *      Set Clamping

Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn10/dcn10_opp.c  | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
index 41cec7acf51f..0dec57679269 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_opp.c
@@ -37,14 +37,14 @@
 #define CTX \
 	oppn10->base.ctx
 
-
-/************* FORMATTER ************/
-
 /**
- *	set_truncation
+ * opp1_set_truncation():
  *	1) set truncation depth: 0 for 18 bpp or 1 for 24 bpp
  *	2) enable truncation
  *	3) HW remove 12bit FMT support for DCE11 power saving reason.
+ *
+ * @oppn10: output_pixel_processor struct instance for dcn10.
+ * @params: pointer to bit_depth_reduction_params.
  */
 static void opp1_set_truncation(
 		struct dcn10_opp *oppn10,
@@ -149,11 +149,12 @@ void opp1_program_bit_depth_reduction(
 }
 
 /**
- *	set_pixel_encoding
- *
- *	Set Pixel Encoding
+ * opp1_set_pixel_encoding():
  *		0: RGB 4:4:4 or YCbCr 4:4:4 or YOnly
  *		1: YCbCr 4:2:2
+ *
+ * @oppn10: output_pixel_processor struct instance for dcn10.
+ * @params: pointer to clamping_and_pixel_encoding_params.
  */
 static void opp1_set_pixel_encoding(
 	struct dcn10_opp *oppn10,
@@ -180,13 +181,16 @@ static void opp1_set_pixel_encoding(
 }
 
 /**
- *	Set Clamping
+ * opp1_set_clamping():
  *	1) Set clamping format based on bpc - 0 for 6bpc (No clamping)
  *		1 for 8 bpc
  *		2 for 10 bpc
  *		3 for 12 bpc
  *		7 for programable
  *	2) Enable clamp if Limited range requested
+ *
+ * @oppn10: output_pixel_processor struct instance for dcn10.
+ * @params: pointer to clamping_and_pixel_encoding_params.
  */
 static void opp1_set_clamping(
 	struct dcn10_opp *oppn10,
-- 
2.25.1

