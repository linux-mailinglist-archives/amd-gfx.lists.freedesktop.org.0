Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5742884926D
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Feb 2024 03:35:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C46310E25A;
	Mon,  5 Feb 2024 02:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLUr4Ja7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63C610E25A
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Feb 2024 02:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JigKDaM0AlWOFWtVfeQpDc/mR3o8fR9CjZF4/6PPjynf9skIYi/qv9/eNMCREcFH90s8Q1xE1pgJN63rC7XfnWh3nKTdBNlcABVqOdG22E6CrwANarjEB8gBcseIengPhtXG3vJ77C7/0//FcRmH3I7tK6lKXqb00J68FsFCFNrz+mcw8Ibauzf//TCy/td3fa0JVhe+d9Thh2A6h1wAnviW5hESDyAiH8IaCAc2H18TNJEPtpV+4Gx4u9efXGrBp34Fl3AO/H1dToilZGwClPFvJVa8oTxLCzGV8ScSepurH9gd3T3+MzprvJXvCr5jnB5lMIeUTttHC+/5g/8sIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89u4wkPzhCQ+btqMVe1zzTkjGU8YdFvADzDh8QqNXeE=;
 b=bkMcyWu+EnkQ8P9aZIixmxEvQxlVsNzUr/qjaSA3Uf2tA9kH9T/ENF1NavEvEFgE9cMr4iK0iARKiswbuxFHt5L/2S7TIbtDNbigo2NfyIdSUGoK9LJQ/4SqZcfNHTqTASxKDj6S4hQ5OGJ4Y9ZEY6M+1uXMPPvpRbjGO4ODTJ4Xz50HVn/J7JAgyQZt+ULln8TmlhHaoJw5SINheTltjfhhKdIFBOr//nustPIckqEzdm98IgRdoffPbx0qpDxHpPDSQjz0Fpxe2wh6FoVGUVFkJILQJzExaNfFHWkDS9heM/nFGJ7CLB6bT5bm10tpgkT4zXK6um/tuu2g58CUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89u4wkPzhCQ+btqMVe1zzTkjGU8YdFvADzDh8QqNXeE=;
 b=VLUr4Ja7xeV1px6Zbl3X3apPSV28MSkBmThG7esUsde7cBfwWPF98whtkv9RZk/X+Sylrql41I/ovfX4ScRBSPZQMmpfsGvnLy9RD9LJBlnLiD4sa1/RzxC7fCB2rJjDKLPhQ+xfANLA+blo0AM/ZMzCiaS4h2hH207uOEfaucE=
Received: from CH0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:610:e5::22)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Mon, 5 Feb
 2024 02:35:09 +0000
Received: from CH3PEPF0000000B.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::6c) by CH0PR03CA0257.outlook.office365.com
 (2603:10b6:610:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34 via Frontend
 Transport; Mon, 5 Feb 2024 02:35:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000B.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 02:35:08 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 4 Feb 2024 20:35:02 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Roman Li <Roman.Li@amd.com>
Subject: [PATCH] drm/amd/display: Implement bounds check for stream encoder
 creation in DCN301
Date: Mon, 5 Feb 2024 08:04:49 +0530
Message-ID: <20240205023449.2542171-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000B:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 44172c0f-7465-4c67-c9b5-08dc25f311de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XcE11GjBTqqLmrKmcxzXZ/OZ1Vcnxn8MOIwuyv71CDJ66z72Lbb9Hb1pP2yrYGcFzF3PEQHb7x5uy9QlGMOfL++Zu6VxkR89slbrNlwlsgMcGz0OQ0bF8thtBfkeqg37c4yYrzcLZHE8SYaXUGr3W3CjDbsshigV1wma4biDjYzl15YJ80pmqMxuMGBiUyt3GcivCL/kxEr1Jd4zUDDISig3PwY5GCDKDV7se4od67pkQItgakwTp9jUpgRfBl3a/wpcJaqQ/K5B6kwkNxDnsxf4TFFRTE3+9AhGMhESn+KGwFv2eNDSgMO8hWK/zPtXvXgv5oJwAYGLu0QM97t2j2BHMnMIDoJCpTWY0o5ppCF/F1dfCa9DPo0P3nf9Boa2J94nvOU1i8eTW++tj/XwJRzHOXGN74NMIoJIXfB+XHhl6VLJnZo6QX6tt5ZSS5edyPmP5zhxGR+aPaGeveq0Lmx20LMCIFy8FagJXB9Wc4HageQfCtGX5EoXRi7dZU+GPTSGJoiGrku5MJvnPZMPqRp8xrPPkdB7k4SZCagnnti1ifrVKhjT5VMxz+serraaRp/RfB5mF0nCqMM78awtyh+PiAWEnd1PKtrFGWteQ8bK0YY0r4wgR/3BJrC0N3tXYjWxlbVvkMcdB9eR9e/FHLhD7BJC5LzGtPa60Ux0v4oqsB4r7MEKg+RnaAvQi7bN1orI48iC/ZeGY5/pcYZljoqQ1TiPKf+q7az5/LhxzFU8aK6OVmYsPUfLT7LxohnG9+BkogD/MYRtprrVvvmz9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(36756003)(86362001)(426003)(478600001)(81166007)(336012)(82740400003)(1076003)(356005)(2616005)(16526019)(47076005)(26005)(83380400001)(41300700001)(44832011)(316002)(7696005)(6636002)(54906003)(70206006)(70586007)(5660300002)(2906002)(6666004)(36860700001)(4326008)(110136005)(8676002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 02:35:08.6236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44172c0f-7465-4c67-c9b5-08dc25f311de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
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

'stream_enc_regs' array is an array of dcn10_stream_enc_registers
structures. The array is initialized with four elements, corresponding
to the four calls to stream_enc_regs() in the array initializer. This
means that valid indices for this array are 0, 1, 2, and 3.

The error message 'stream_enc_regs' 4 <= 5 below, is indicating that
there is an attempt to access this array with an index of 5, which is
out of bounds. This could lead to undefined behavior

Here, eng_id is used as an index to access the stream_enc_regs array. If
eng_id is 5, this would result in an out-of-bounds access.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../display/dc/resource/dcn301/dcn301_resource.c:1011 dcn301_stream_encoder_create() error: buffer overflow 'stream_enc_regs' 4 <= 5

Fixes: 3a83e4e64bb1 ("drm/amd/display: Add dcn3.01 support to DC (v2)")
Cc: Roman Li <Roman.Li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 .../display/dc/resource/dcn301/dcn301_resource.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
index 511ff6b5b985..f915d7c3980e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn301/dcn301_resource.c
@@ -1006,10 +1006,18 @@ static struct stream_encoder *dcn301_stream_encoder_create(enum engine_id eng_id
 		return NULL;
 	}
 
-	dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
-					eng_id, vpg, afmt,
-					&stream_enc_regs[eng_id],
-					&se_shift, &se_mask);
+	if (eng_id < ARRAY_SIZE(stream_enc_regs)) {
+		dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+						   eng_id, vpg, afmt,
+						   &stream_enc_regs[eng_id],
+						   &se_shift, &se_mask);
+	} else {
+		DRM_ERROR("Invalid engine id: %d\n", eng_id);
+		kfree(enc1);
+		kfree(vpg);
+		kfree(afmt);
+		return NULL;
+	}
 
 	return &enc1->base;
 }
-- 
2.34.1

