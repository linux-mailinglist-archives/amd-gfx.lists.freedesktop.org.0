Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD11457730
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Nov 2021 20:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5413F6E0D0;
	Fri, 19 Nov 2021 19:43:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D636E34B
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Nov 2021 19:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzQDkIrgGIM8c3Ff6P/sqG0807grx8nWwCeBRXuh+ufenGPic9BO+mkL31Nuur2Ea/4hhkwWnzZrDRfQ3ZwKJxhLAS+RxnFj2am95CoDCWa4JyimyV8T0Sep+dO9c1Lwf86TBr+X/1sj80TypJ8nksHWyrtePMFvQhp69aH66Lu7GikA82uYB8DqriUnYkticfpiXHLAsTlUtwnnyvv38faKWRcWlLB82mJcFL3vwRy/oxJY/eK0/0hTjpspH3RfsSU75ZNFZk4mJ+Ihzh0BaAEPSqfyAMj8oC8k4iwT8NUHqdc4fpHcIPOAnLBeWPVkMd4V/VqFgdRjBtWDH18rsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbuwNklXa1ehlVfzb8K+IIXpMy5R0xcnhLsCehg5qBQ=;
 b=HxaVJ+Kysxl0dY2alrE+muegFpcGVr/+MG++IXfUlWCOtYTIOOZJ5aZf5EmAs8oLUwBD/NdGUO6Szl5Zq603WXpOBYaOJT4n3SwlJNk+oFsBb6JpYhKXeENk26H7SXWxyrx6MxODas6ISp0rDj1ffAK5LY0FIY+ZyXrQ8olB9Q0OWAP73wveRI9mHe/b12ieN/gtEn24/jsjq8IZ13TL246wPCr4MDNStfqb1WK2DD5f+2BVrRGfyt1LuN4SDmH5L7qYx+vGMKOa0PgH3J64qKPkAHFOg7LrZbe5UqcpS5FWBVwKCA1IpZ+y1nFO2oxkN6eJZ/K2FvhCZV+xuCMWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbuwNklXa1ehlVfzb8K+IIXpMy5R0xcnhLsCehg5qBQ=;
 b=n57c970DviQexmLj6amffLXrgKmtfBUDc+611tr7oNRopDUioS42HWYzFsPSo/1o1j0yKz9eLpqbEhBCtYl0ICYnVIO2WENdgw1BWHk9hGgaWvXNfUCG/SzS3VyWpDdQalJIcs+ctgy0eVvJr353yJ4biBvRTBvcj5qcf2Z999A=
Received: from CO2PR04CA0086.namprd04.prod.outlook.com (2603:10b6:104:6::12)
 by PH7PR12MB5576.namprd12.prod.outlook.com (2603:10b6:510:131::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Fri, 19 Nov
 2021 19:43:52 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::b5) by CO2PR04CA0086.outlook.office365.com
 (2603:10b6:104:6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Fri, 19 Nov 2021 19:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 19:43:51 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 19 Nov
 2021 13:43:50 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/16] drm/amd/display: based on flag reset z10 function
 pointer
Date: Fri, 19 Nov 2021 14:43:25 -0500
Message-ID: <20211119194339.97573-3-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119194339.97573-1-qingqing.zhuo@amd.com>
References: <20211119194339.97573-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62a302ba-7ffb-4199-8f4a-08d9ab94ea1b
X-MS-TrafficTypeDiagnostic: PH7PR12MB5576:
X-Microsoft-Antispam-PRVS: <PH7PR12MB55765D27DD07AC00B39B3C5CFB9C9@PH7PR12MB5576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1gRrq0AnQFZIYi07y7i2KDb0qQn87ujvkpb8jA9gk5Ba5GjYjeL4kPcHH4LIR44TuKkXHF0gFx00q1C7W3bGP2kzmr3BlKBGLuv0NFhMfRvgJ9TmYgx0zfMcX9vqw7lhXpNWCnZOufee+02HGDJuxHTKHFUts+pjHtBtq3AHbKeNwq0bGkNnGiFaxcbN4AhQJWZ64Yp4Kn3VENmXSG9jUsZBVcmul3nEbbsN9cEZqWWTBIv47eLDIuybkrPI7i3PpIsliGKLtKvevPxvncIyggajx7TbVV/zYmVxF6oUK8ceaC/1t1Lp3/fIMvJAJrKq1yO1QPcGuYUbkbeG5PfG+busQAR+GLhgYBpjuXe1d6F/0QdPoDuVHXY+IPATx/koT8bF8K/uNDoqygEtTr2ySG7xNrcaPcdUKiYoYFKaaHk1jGpHMXA5HiQY5IXBZAWrc6waJYRBMpeGkr6lVx/Zvjv38f0vJVvWUfXTq1a5hxrvAbjlYPILZEpijuV8o0YihExfjaVk1bUrmQ3P12/g2qhTClz17w5ShLWHE8/fUkrs0AMuxltTAepA9PJutb3//rzYNsAUabUU1exG5UJVNgEyspY1Qmovm4gKis2VvR+/APthBidMFi8EbZeAZFLtyH9Xn1zAhhXosMOnwnT1xO30eN27j2YpBdmk0tblYobeN6FsBTZ/09+vQ6L+o0xKxVE73m50f5PX8yZO+zal/ZKsmbE8bn8LVEmirc4gB10=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(2906002)(16526019)(6916009)(5660300002)(1076003)(86362001)(8676002)(356005)(4744005)(316002)(81166007)(26005)(36860700001)(8936002)(70206006)(4326008)(70586007)(6666004)(47076005)(54906003)(186003)(2616005)(508600001)(336012)(44832011)(36756003)(82310400003)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:43:51.9260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a302ba-7ffb-4199-8f4a-08d9ab94ea1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5576
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
Cc: stylon.wang@amd.com, Charlene Liu <Charlene.Liu@amd.com>,
 solomon.chiu@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 Anson.Jacob@amd.com, Aurabindo.Pillai@amd.com, wayne.lin@amd.com, Sung joon
 Kim <Sungjoon.Kim@amd.com>, mikita.lipski@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Charlene Liu <Charlene.Liu@amd.com>

[Why & How]
Per hardware requirements, add a flag to control
z10 enable/disable.

Reviewed-by: Sung joon Kim <Sungjoon.Kim@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Charlene Liu <Charlene.Liu@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
index 05335a8c3c2d..e175b6cc0125 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_init.c
@@ -149,4 +149,9 @@ void dcn31_hw_sequencer_construct(struct dc *dc)
 		dc->hwss.init_hw = dcn20_fpga_init_hw;
 		dc->hwseq->funcs.init_pipes = NULL;
 	}
+	if (dc->debug.disable_z10) {
+		/*hw not support z10 or sw disable it*/
+		dc->hwss.z10_restore = NULL;
+		dc->hwss.z10_save_init = NULL;
+	}
 }
-- 
2.25.1

