Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D0D86B757
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Feb 2024 19:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57FC10E3A5;
	Wed, 28 Feb 2024 18:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eS+YrCPi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E3010E3A5
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Feb 2024 18:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYPQRnDHfdf+5HyONQZjeEnCtpUsOaeXaAcvSz/JmRxwIB5chw+z3caMewsyhH8r0PwL6ZURZCeUj/1e+rVtIFv+5KjvBG4RCvc7+Npt0LUg0mRK1H2usytWueqHQNiPB9Ad5dJLHj7UgyzNfcZzYqSW4JtStdQhD0KS8xz80yrNp+iWpq5KHtTnX0C4tWQtJr2B3Xhi+QwkV657P0t2M255bDO6GsZ9Y96ZXAi4Dw0Cd7a7Ff2BeWpvxYvymDpbpv7I4xahiLJ5vQyv2ug9XOgFtK3XiLoyhfGH9UALsdCc0bRhlN/uQZPuWTjTZqtVZ4lV9MNIjYAb2Nvmw1fymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erRJiaUSr+G8Apaj1bcgoiW8b1A4B1mPIukEu3Xmrl4=;
 b=Iyjv2kgHA8MmJ+eNq407Mn40yrWtDaUJaD/uAl9arbvEh2j8i+VoThJaV4QtsC6AMaWgHlq/4NCnP3rjWIl1yoFFkge855LcA4JthJdknEGWCzMPk3eTri3Aoc6BaJhwQ+iLHg7ulYF/CgLvvw6AQei4yBAzbYFOTz6T7NW+VVA/H4MyHgnvyd3cM8UGjyNwLkwX9zyHtKlF0tMn3xK3IP1oszNij4AkqG0lKirgy88yGrej6eoths5pffNYNfhGyBZ+wVV5fulWEZHQ7gqhN9YGXKIIjvHaKFFxbET43Gnu/rGWiUcqyByTaO3eblGPhLvvjtL9eATLpQk/B5R2JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=erRJiaUSr+G8Apaj1bcgoiW8b1A4B1mPIukEu3Xmrl4=;
 b=eS+YrCPijXKcZ0yARWtFPG99BiP2Yh4CgNBvEyKktSCvNC3ko/nh9V85BszOi5XmtrjoqK9Qu7ytJWTJ+1uk4YurVJ6Qqh33w3fk2SINPtZq+pFJWsCk0clP5QOi+kFZFTG3/3TNOe4q4/f1LGO7ztmjNcc6pG1eQXJWIM00rrc=
Received: from CY5PR15CA0106.namprd15.prod.outlook.com (2603:10b6:930:7::8) by
 BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Wed, 28 Feb
 2024 18:41:54 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::98) by CY5PR15CA0106.outlook.office365.com
 (2603:10b6:930:7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Wed, 28 Feb 2024 18:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 28 Feb 2024 18:41:54 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 28 Feb
 2024 12:41:51 -0600
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <hersenxs.wu@amd.com>, <jerry.zuo@amd.com>, Xi Liu <xi.liu@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, <stable@vger.kernel.org>, Jun Lei
 <jun.lei@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 05/34] drm/amd/display: Set DCN351 BB and IP the same as DCN35
Date: Wed, 28 Feb 2024 11:39:11 -0700
Message-ID: <20240228183940.1883742-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: d64e0b53-e1eb-435a-d043-08dc388cef92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6k/HdA11oL+x6n2gOKjrAkzv4MaNVYKCDzrVZb1hF0H5pj01SJotJdUcgffvTjTBadJepAohg4ay04xeeq93sEqlWQUF2BTgfUtOoKzuKCK8WXqODu5JUaQjicrEbrj/KPBUdcAyHizzqOysAw3j1O1vhdxmisRv83LaybraUeIUxZ1USBq1F8+SU1Ilj7puFeINaSjeL5gtKz8pIxQmnp+D2Ba+NBlWfmkB0EJwrEROgpkMx1295gpa48BpAGLVlf/3PK8bzifaPkSw1jVYbFFgp+WyPTLyY4nI1hyEBaJRLzCVBFBH83nxrZLl6kqApVDXORZT6GTNVJazS+/6rDo5wNMrAPowuMeqTRH4BjMWg9rFsS5M5VxM7nfrXAbplmoCuF85lqzTBHleZiOZSGYywNaq6K6TbcDP5CJdpm/hrMtnbgM60EFW8HN6OTKrOk+cub96tx/uSkkqdoHla3GbRAsrUMieGw9s2oBXWQtKlKVoXqbrO/67atBa3L5JltSfRm+SRpMXo3LCBDdqgsl4fgLefcnHhF6cz7np3TTd318oDJyjUf9e/nVp4iPlHnGeN84SNVmH8ZyUigy5NL24Py6Qxe6Mpm9ZrJYAt39raIFzTcriN2r1L3LUtePLeiwOiE6eIew2WAOwqNLDStU+qg1/gRJGBIxv+u06T4soVIzRLHVqClIeL3guVBwSilt3tkCUBBtfDm2Pd7oe4ix9DbKmgGe8l+vtl5uILN8UlH7UIM3mVHlXQSjEGBoC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:41:54.4783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d64e0b53-e1eb-435a-d043-08dc388cef92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
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

From: Xi Liu <xi.liu@amd.com>

[WHY & HOW]
DCN351 and DCN35 should use the same bounding box and IP settings.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Xi Liu <xi.liu@amd.com>
---
 .../gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c   | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 17a58f41fc6a..a20f28a5d2e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -228,17 +228,13 @@ void dml2_init_socbb_params(struct dml2_context *dml2, const struct dc *in_dc, s
 		break;
 
 	case dml_project_dcn35:
+	case dml_project_dcn351:
 		out->num_chans = 4;
 		out->round_trip_ping_latency_dcfclk_cycles = 106;
 		out->smn_latency_us = 2;
 		out->dispclk_dppclk_vco_speed_mhz = 3600;
 		break;
 
-	case dml_project_dcn351:
-		out->num_chans = 16;
-		out->round_trip_ping_latency_dcfclk_cycles = 1100;
-		out->smn_latency_us = 2;
-		break;
 	}
 	/* ---Overrides if available--- */
 	if (dml2->config.bbox_overrides.dram_num_chan)
-- 
2.34.1

