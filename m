Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B78184AA56A
	for <lists+amd-gfx@lfdr.de>; Sat,  5 Feb 2022 02:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF7310E3F4;
	Sat,  5 Feb 2022 01:51:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2052.outbound.protection.outlook.com [40.107.102.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4810E3C0
 for <amd-gfx@lists.freedesktop.org>; Sat,  5 Feb 2022 01:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARrUzvE8ht/6jif3t8UnB4x6RYFEQzYwmK6qe0xhgeyZ/tvTDikvfVHrbC6ypm4G9ZCuAQ0OEsJ0EJU5bl4hqVFPt770kZNkyy/LURdtowcXPLdZ34eo9O/l/bGsH/xe6IrKEHvEKoqDOOr1dSSOW3hPCa8u7EXrHCqdI+gFYmz50eEBg3EjP23T8lZk7HDRK7rEooxz/qtmG3JpMQkRLIzPepCy/QwUi/Lgzfv23XQ2HfVvnHbUeIEjFWmjfNGpawPmfSqHhhBAo550EefW8n+3NJPMVktxVZZlyWf/jI85FDdaO1VlN/HOmeD+9cIchK40+ZO/PTiHglsn2m0qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82auPx94+JAPXH9r8ffzz/dHcaPR7PHcTP/4yrLk7Xo=;
 b=PAsqAG+UgdJGVwRglzssSJuNNgttlyzEeNkXRpfG3oAU+Vq0PuepxEz/6RViG45WqJS85Ks7ljCfBNubvJxxRwzyamJJ6HVuTI/lIlLDDjgqsBkSxDYLvn1glDiIfrQsHCZUO/EVNmX6jEz7ZsFKKHAKN4IP+/nFRBfUyUD5JQYsGPH5R2E0O4JiNhWRP8YnrAlmXHw0Ghm1tTM6/drnPBlpAYvdfWzX2vjLu3IULE01FWRayUSHgS4yqNC5ZO2X9/52i/+noJWLVTqlM7n2dGYTBWULRmEbn3HpdrYAS1AbSRH+56UjN9+Zd7hVdxTXC1Qm4BAnW9hitfeoOBU8ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82auPx94+JAPXH9r8ffzz/dHcaPR7PHcTP/4yrLk7Xo=;
 b=EMFtY8ukYx2k+R8tzmO1Me8k4/lp3/yItL9cvG2AZ+ql/8XlBJpVAu2tHTk3zSCuiSumvIy/lsom0wgcg+NlsNq7fHQ+ZdgCx04Er0H0eJl6eksSSuiTnPQfqhsdM5wuKwxat8yBG9kUiWwZcVcmFnJs3olpm8jpmIbPcDCxrMc=
Received: from MW4PR04CA0338.namprd04.prod.outlook.com (2603:10b6:303:8a::13)
 by BN6PR12MB1812.namprd12.prod.outlook.com (2603:10b6:404:108::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Sat, 5 Feb
 2022 01:50:58 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8a:cafe::db) by MW4PR04CA0338.outlook.office365.com
 (2603:10b6:303:8a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Sat, 5 Feb 2022 01:50:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Sat, 5 Feb 2022 01:50:57 +0000
Received: from jasdeep-System-Product-Name.hitronhub.home (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Fri, 4 Feb 2022 19:50:56 -0600
From: Jasdeep Dhillon <jdhillon@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/14] drm/amd/display: change fastboot timing validation
Date: Fri, 4 Feb 2022 20:50:23 -0500
Message-ID: <20220205015029.143768-9-jdhillon@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205015029.143768-1-jdhillon@amd.com>
References: <20220205015029.143768-1-jdhillon@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600b469a-7a9c-4d79-a96a-08d9e849f468
X-MS-TrafficTypeDiagnostic: BN6PR12MB1812:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1812CE8E0A8D9DBF7865B6A9FB2A9@BN6PR12MB1812.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5LqKHHJzotQSU26UHu+HIkJoa9FAnYZc0bgWv1M5N3HtP3HowoqwBvxkRm3tRJ+qT+b/cWdj5lgl58jQnMRKSR2zjOQ8FSPb8rP1+3Vp8Lwx0oNEvkS0Dpr4rIUgjHbVvewJLvoD82oJZvdcWUY1AY3Sb8NLjHXwp74tcGG6NsoaBrbWbbA5FhMfcg0fGGmjD3RexwsDcx/D6UIrgerp7iDUglilZ9xmL8KygcTy04OCTGPC2AgWtzaCEVkk+i2mvKxbDPK9tIsApBAHJdAaPdI54l+CscprLjd4EgQH5fj4X2jkI6aU8+7KjD/ySSoBqj8h7t5XSaDTJWW7i2AKxN4XYZbGi8TxlOJTxens9rp+F8K1L11OT8lvErfubTigp5vRktusKwiapWLGamcQBt/80e0kRSBibG+WoXOpTkFM2ncVXG8oLQJdlKGBWRRfZjiQ6KUIi7IB6XdVIo6CwNTlfLI7yOVMmWhX+pF1+nd5bYoMIYoqNI1mjXqkf3nASF/5tttDWje2L6L80AIImfctRWjtU89agW8BBZgKBPjJcDJe+esln5NPHjXfolgQ5Ns+Wx7CFN34E7ykHD8DmflY4QSpjQk+z2doIxJn5uo35l09Z5nLN1Wxn5QZGDADsBHaW5Hb9bUQ7IITge8e2zyUs8RlFfBCMR97AoElKuj/1lCYJRfNFzSNAI9wqNqKA1XKGbBUh1wq/VlVeL54cw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(5660300002)(2906002)(47076005)(6666004)(4326008)(36756003)(508600001)(36860700001)(336012)(426003)(81166007)(82310400004)(1076003)(186003)(26005)(16526019)(40460700003)(2616005)(316002)(6916009)(54906003)(356005)(70206006)(70586007)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 01:50:57.8517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b469a-7a9c-4d79-a96a-08d9e849f468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1812
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
Cc: stylon.wang@amd.com, Anthony Koo <Anthony.Koo@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com,
 Jasdeep Dhillon <jdhillon@amd.com>, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, wayne.lin@amd.com,
 Paul Hsieh <paul.hsieh@amd.com>, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Paul Hsieh <paul.hsieh@amd.com>

[Why]
VBIOS light up eDP with 6bpc but driver use 8bpc without
disable valid stream then re-enable valid stream. Some
panels can't runtime change color depth.

[How]
Change fastboot timing validation function. Not only check
LANE_COUNT, LINK_RATE...etc

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Paul Hsieh <paul.hsieh@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c                    | 2 +-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 +-
 drivers/gpu/drm/amd/display/dc/dc.h                         | 2 +-
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 3 ++-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 1d9404ff29ed..997eb7e2d2b3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1467,7 +1467,7 @@ static bool context_changed(
 	return false;
 }
 
-bool dc_validate_seamless_boot_timing(const struct dc *dc,
+bool dc_validate_boot_timing(const struct dc *dc,
 				const struct dc_sink *sink,
 				struct dc_crtc_timing *crtc_timing)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 8a199d661a66..318d381e2910 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2168,7 +2168,7 @@ static void mark_seamless_boot_stream(
 
 	if (dc->config.allow_seamless_boot_optimization &&
 			!dcb->funcs->is_accelerated_mode(dcb)) {
-		if (dc_validate_seamless_boot_timing(dc, stream->sink, &stream->timing))
+		if (dc_validate_boot_timing(dc, stream->sink, &stream->timing))
 			stream->apply_seamless_boot_optimization = true;
 	}
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 69d264dd69a7..8248d4b75066 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1125,7 +1125,7 @@ struct dc_validation_set {
 	uint8_t plane_count;
 };
 
-bool dc_validate_seamless_boot_timing(const struct dc *dc,
+bool dc_validate_boot_timing(const struct dc *dc,
 				const struct dc_sink *sink,
 				struct dc_crtc_timing *crtc_timing);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 8c32b9cb3b49..52b22a944f94 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1761,7 +1761,8 @@ void dce110_enable_accelerated_mode(struct dc *dc, struct dc_state *context)
 			    edp_link->link_status.link_active) {
 				struct dc_stream_state *edp_stream = edp_streams[0];
 
-				can_apply_edp_fast_boot = !is_edp_ilr_optimization_required(edp_stream->link, &edp_stream->timing);
+				can_apply_edp_fast_boot = dc_validate_boot_timing(dc,
+					edp_stream->sink, &edp_stream->timing);
 				edp_stream->apply_edp_fast_boot_optimization = can_apply_edp_fast_boot;
 				if (can_apply_edp_fast_boot)
 					DC_LOG_EVENT_LINK_TRAINING("eDP fast boot disabled to optimize link rate\n");
-- 
2.25.1

