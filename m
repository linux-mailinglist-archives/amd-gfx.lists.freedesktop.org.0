Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEF0AD5E6B
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Jun 2025 20:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566E10E357;
	Wed, 11 Jun 2025 18:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UMmMCFRj";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582D010E156
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Jun 2025 18:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7Cb8GbPVSbGXYrzzZk6aO0RaaK832wDfF9CndvLgHNEBqiMCh5mUVZTpAc7j5jyrCAWJ2WMS8iiDTY3r/pPlRJguM0Zvmb+SS/AFal2I+SeZsgZPLpRQWzauLd7V6hQv6R+nbrQFXOdEVq/Aey+Lg7ukTCZiL9fgXEIXGIs18dmCKURijsly1MwfiQvMqQQnXTcqzb4WqSdgbng8fyghtrKqydKVYYiFp8vhHCMVXY9V/9TH1ZjJSzSkrQYqmjJ1sgrIAQvn6ooCoDZzhQFk7VKgLBe0f348bkqcQQ/J7p71h3Tb+ukjrVmi/u1MwMlzbk44AVZUZVxQBDrbShy5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xv+xO0k0tM8wJh6In7a3ref/HZ2fEBuGCSCfk/vFMGQ=;
 b=JW2cxkCLNNI8JOwyeE+jZ+mRpA/bvWewXVmXJlK1nWMC19N6xOfqOXiNNNZVHAJfduS2QEoO6IZ6mXln1MNuEBXIi8DmhA6se/LWNBTs7+iJUfP88V2GPjyM7xPS6sDChHsj7eS9ql4QLZHLzx9AzUO6n7yA8fLASdL6bTsnMvgo9Ikk2KqrDWKaE6z2uhNd2QI+kj06ekRYoFUvLe+ALkIoUX42ol4uiIvwP7okVM3k9IHu6je/zmXrFaZXEe5qezx2eecZBQEMdltQqXhtaVDY7TKkgxnETc2BfVfFkqZz/afkYxKCZ3hBpQokvLXEB+AUdkMrTE/rAoHTJz41Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xv+xO0k0tM8wJh6In7a3ref/HZ2fEBuGCSCfk/vFMGQ=;
 b=UMmMCFRj4A/m29jKY+xdHPk/GDxmCc2tLjgZIip1kUzQH5tUqXW9bXxG8QPnARc4ZSCBe5GY5dMsc9aRUSga2G62P6yA3LprrWt+BSduhbQ6iABK3tj4MiXpoHhhQH/lH+OodNj8nt94WiL5SjbATEe3lm6moTu2bIVGofaSxS0=
Received: from BN9PR03CA0622.namprd03.prod.outlook.com (2603:10b6:408:106::27)
 by DS5PPF8002542C7.namprd12.prod.outlook.com (2603:10b6:f:fc00::657)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 11 Jun
 2025 18:41:19 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::e2) by BN9PR03CA0622.outlook.office365.com
 (2603:10b6:408:106::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Wed,
 11 Jun 2025 18:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 18:41:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 13:41:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 13:41:15 -0500
Received: from aaurabin-z5-cachy.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 11 Jun 2025 13:41:15 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Alex Hung
 <alex.hung@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, <stable@vger.kernel.org>
Subject: [PATCH 05/10] drm/amd/display: Check dce_hwseq before dereferencing it
Date: Wed, 11 Jun 2025 14:39:55 -0400
Message-ID: <20250611184111.517494-6-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611184111.517494-1-aurabindo.pillai@amd.com>
References: <20250611184111.517494-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DS5PPF8002542C7:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d21a43f-6d76-4a3f-046f-08dda9178e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c3vSxaqS8q1qJQR7oBAYvTr3Rlk+DEliCra4zoawFfZYNoHzQNxpKamsb13/?=
 =?us-ascii?Q?VeuhF3jicIYxtVmHzR8aJ4yXepUoBlczXdUgHaB5IZ20OVIyNFb/uqjJr2lY?=
 =?us-ascii?Q?NanXBHv2g3yTkJ6bQG6xqjCI1PDh7av6DVvNQ8RCIaL6V9cqkJAPR1QH39kL?=
 =?us-ascii?Q?QhdMiLx7tt9J3Mq/A+XVxFgGjvVcDiMYpp4Kvz2qs8/vN/GjlX924uLjkak8?=
 =?us-ascii?Q?uKa1CMy+laI0Dus1KL/1ZuIIg3cnnHk8LHVETjjqA0dZgc4Pqd4jOzXmxeVt?=
 =?us-ascii?Q?o/8PzZwYzrPPk2Y7MoxvzjfkKFRZveAypPOMrGTtPQNbjfv3qcaMWucDnvEY?=
 =?us-ascii?Q?AhU68vST4SLgCI8WoFFL+Rj6cqPDjt4r2YEPDPZ586QhrHI2u2YqeAVz42Bi?=
 =?us-ascii?Q?wqqGRCdrzBKgfG8DvPbdCQEfwfgN3NVZHNRdKfPeTmsX2xF4V4VvBT1QcqKt?=
 =?us-ascii?Q?dA4V/wDjLh6hfq8kcTWjvgZhpItASHyjAla3BdcFduARC7axaYafX9iBjz90?=
 =?us-ascii?Q?A6bEzMav773s17/b13rZZ/a3N5107y+eJGo6BLA/l0/yYLXlodIx2VGxowVB?=
 =?us-ascii?Q?fPsespPruQ70NdMZlzX1VW/L3WFrXogd62+5t/LPhCX7NhSEyVTCiTaJw+FA?=
 =?us-ascii?Q?LE3rq8Ln8VUg2BX952g/dhlR2/Qg/lnoV7pKyKra6j/IoHbjJDOCBdHD/dLH?=
 =?us-ascii?Q?wK+CX2F7R1kEhosxvQRYKZCh4wJntrCx0SS54+12yoa1ezdS7SukgTX89LPU?=
 =?us-ascii?Q?bzmsH8Yul1AjgBgSDEAYoMzjabs7yZ17G7xgDy4Adat+IFEzK2lzb8Gi9ShL?=
 =?us-ascii?Q?Ijb/YeV2d1g9TfZTHKKkxAk1a7KnajaW9Ecpg/h84TAGk+L/GD4f2uTFZ5rD?=
 =?us-ascii?Q?P22trId2aoeC76WODz8Lkx7HZD8PxB3LmFKYnWzu3RzlFD4uYqUkQgcPSRlb?=
 =?us-ascii?Q?k/085m5jxxSVe4eGMux83j5/Rp4GeyswtR+0MAxa/kQzVrbTHX6Ln3POeDsL?=
 =?us-ascii?Q?Ke24uRUbYP0q6l3OLh1ydPiDISjZwQWSNHywJr171s61zoNMKJU5A30BSTqC?=
 =?us-ascii?Q?6uFfCSfGomIlj5M3moEbFkYNcbXLjUtqKgVDf9NL+DKsa4x0Xgm4GeLHj3As?=
 =?us-ascii?Q?Kf8S+HD87lY/fsXlDR3UMvhoBpM64OR4eGmMOdyANz6CuOJlYBrAFaKb8j2Q?=
 =?us-ascii?Q?iCcbGafJKC+m9vyjvZ2/hjAWDuSbFM3RCjPDrwYCD/raoQpisnovZzPwHcwj?=
 =?us-ascii?Q?54ETWG0NjHV9kAJtO+LGvONkDWRdIClY4vN5awv5clmuJ93qLTfKUjoGx9U3?=
 =?us-ascii?Q?0rsx2DrNro2MMRD2v42G4hietEGd1N5RTI9vnLdaCalhQ/wMEuCld+tbHC5p?=
 =?us-ascii?Q?hxBcohX1Rg4SIynP4+TRhwWuWkAAhXXF+CeWHDDypuNcwL5omSk6iGg8veeW?=
 =?us-ascii?Q?wWZMd4QBREpHCV+57W4Xx6LBkmeTZb7gTTsJemndTxV7P4+2qsVGaFFNuco8?=
 =?us-ascii?Q?iJjbdh794bx7C3GNL3WtTqwy7x1Zku0McoZE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 18:41:19.0446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d21a43f-6d76-4a3f-046f-08dda9178e29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF8002542C7
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

From: Alex Hung <alex.hung@amd.com>

[WHAT]

hws was checked for null earlier in dce110_blank_stream, indicating hws
can be null, and should be checked whenever it is used.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index c717cc1eca6d..542468224789 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -1227,7 +1227,7 @@ void dce110_blank_stream(struct pipe_ctx *pipe_ctx)
 		return;
 
 	if (link->local_sink && link->local_sink->sink_signal == SIGNAL_TYPE_EDP) {
-		if (!link->skip_implict_edp_power_control)
+		if (!link->skip_implict_edp_power_control && hws)
 			hws->funcs.edp_backlight_control(link, false);
 		link->dc->hwss.set_abm_immediate_disable(pipe_ctx);
 	}
-- 
2.49.0

