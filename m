Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B1886B777
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Feb 2024 19:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E128C10E4E7;
	Wed, 28 Feb 2024 18:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="03rYk8zK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B6C10E4E7
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 18:44:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLN62mfpgmZ7fATFz65YLI/XQZOeTx/JYeO3+rRXuQC4x7xO4VxowDPPvyvtcif/QXxy/+zyfbxjQW4cVprWTj4bd/Vs5LUgqDO4vJXdLw2wDBsrj4xkjqusMzkBORhzhUu3uB36dgZ8o002l5f6UWoPRGs/9dARMANlreJ4Jy8JJfrAdN6ykk5ykqCuJGXxavcQFQQ6sTD0vOYTxRejVfznJET3rVOVkSUdYsQ/sbVO4J04ERHTVQEfefVjJnY5o+z+OQZhSxMKKUchF5K9UhrVa+YfxEPAsXBgEKICYQ7ZYgRd4FrlnMSr32Ypyun3rK0w+80Eu80vmYUf3UZsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=debASFi03wZ736S3yETPCDCMKBr9mA3BkjkkhEhaJYM=;
 b=AvtKOHy/GDKiKj1hyDR25ja5UY4hoEB1uK6vjtfsSjhvOkJnOBS9nJ8wysQqLU1qKKLCD5dYQ8F2/j745sFWP1lfZ59lXIJYp6K6/SMfpD2g1d3oGoANtiQVJiRqEDepQq/vtO51xMbP1cQYv16yWqXlOIB4WWCHKvHv7GrxXmtPROp9fMJQV7jpS+6Z5ZThbHI+lWMkwupxAiCLfDrlyekkJ7Znm70AVdmhh3OSkTTfY+eu2Njk3DY8TeCgRl9oI1JJwcNbc5mmfOxc1EuOQE3z3L4JfuvxTkw/PpPN725QLUE8n/1GnhH0XJwSDRNGG3v8g+u0U/XKmUQUH5mgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=debASFi03wZ736S3yETPCDCMKBr9mA3BkjkkhEhaJYM=;
 b=03rYk8zKnYt2j4TyImvRJQkJHdjxUEQuBxYr6pJuOJaFpqVg0SK6LpIc4zV4ias2QiqPdhSdmYp9rhouF2EUsvULq80D3oyY47BVjyzXOvzry84RQLIWC7RyR95vcZTXgZOcrLSopZJ10uayxhdP4TP0VVUN9xah3KHMp2A5P4U=
Received: from DS7PR07CA0024.namprd07.prod.outlook.com (2603:10b6:5:3af::6) by
 IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Wed, 28 Feb
 2024 18:44:50 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::be) by DS7PR07CA0024.outlook.office365.com
 (2603:10b6:5:3af::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.27 via Frontend
 Transport; Wed, 28 Feb 2024 18:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 18:44:50 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 12:44:47 -0600
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <hersenxs.wu@amd.com>, <jerry.zuo@amd.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Duncan Ma
 <duncan.ma@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 18/34] drm/amd/display: Fix idle check for shared firmware
 state
Date: Wed, 28 Feb 2024 11:39:24 -0700
Message-ID: <20240228183940.1883742-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228183940.1883742-1-alex.hung@amd.com>
References: <20240228183940.1883742-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceb44a9-d6b2-4192-db02-08dc388d586d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M6Nyc2I5iZG1NVxVjsjyD6VqeXfsA+LQBsXPCnCiGhBjDkNaiJczHu5Ow+s1zQUIZ3ewPvK48tYdBF/RPugMuqSfT7VS/i7NupCj6D8h7AKuQluRCiTql0r5a0Tr33WpFti2RFxlt/ljkGacy+D8HfwbFPULBRgezUf9q32bhSvxCPonptieMYVR9FljEiKvTYIQTe7e/KkQEW4mKTPTUC4dHHLUAko4+vaxQBs7EnaGUEXgU7Ie8abbCn3dnJiBKHQ40K3/W4djKXLWw4VzkkAr0VlYuzEQZ8P1+QMf8qlc2xg2eCcv2fTchTk2vH8HaEQKLHpm/8jaQuq9OV1A95TuCiGwc3GFpCDcC8KUJaY4zpjX4YdTku55kGqcBB8avRI4IZY0oy+0ZCPI6uIMCUGbB3bS+/fuvKLF7MMuMfGN8TzwoX9rAVG/GhJTzTPMxhIvb2FEpZIFzORB8LETq/9Bdn2KwtBDmys01W4GpC/ipWflfg9f697vzLXmrnZ5XIYLq2q4ouZ/i/2e8SFTd6tohfihvkvjh/dWNl8zU2j1c3zBcYJ75opCVvaPkc0aToAH9up/r5o59aPrzD++ltkU6V2d/hhnDvDGgFDy7McE8N8gVNs0GOwEcP2OQyNziOLdonCZYF82vdq29Gy4s214Ui6G9RCr6zFA9goBM+99eQ1GLW4S3hxKVemp7LogCIXpHzjquwY8a8fHtPR0HG35ruPPJWd6xP1nz+hlBwmw3KAeAanHE+aKHyrSRn7S
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:44:50.3969 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceb44a9-d6b2-4192-db02-08dc388d586d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[WHY]
We still had an instance of get_idle_state checking the PMFW scratch
register instead of the actual idle allow signal.

[HOW]
Replace it with the SW state check for whether we had allowed idle
through notify_idle.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Duncan Ma <duncan.ma@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index daf6c7fe0906..acd8f1257ade 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -4884,22 +4884,16 @@ void dc_exit_ips_for_hw_access_internal(struct dc *dc, const char *caller_name)
 
 bool dc_dmub_is_ips_idle_state(struct dc *dc)
 {
-	uint32_t idle_state = 0;
-
 	if (dc->debug.disable_idle_power_optimizations)
 		return false;
 
 	if (!dc->caps.ips_support || (dc->config.disable_ips == DMUB_IPS_DISABLE_ALL))
 		return false;
 
-	if (dc->hwss.get_idle_state)
-		idle_state = dc->hwss.get_idle_state(dc);
-
-	if (!(idle_state & DMUB_IPS1_ALLOW_MASK) ||
-		!(idle_state & DMUB_IPS2_ALLOW_MASK))
-		return true;
+	if (!dc->ctx->dmub_srv)
+		return false;
 
-	return false;
+	return dc->ctx->dmub_srv->idle_allowed;
 }
 
 /* set min and max memory clock to lowest and highest DPM level, respectively */
-- 
2.34.1

