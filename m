Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620438B050A
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Apr 2024 10:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385D10FE2F;
	Wed, 24 Apr 2024 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F1CKz+Mp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275C10FE38
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Apr 2024 08:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIYzJS8YxqzZw57Wk/kJoTniKEbTUzPsUlwofJOEfuMUSA6IxALz8VoerJ8qCIXrxgp3csILBmsdY+T1jT22oNCcI7sbgZgB1vnW0X/bWEdBn1RQjlFcOAzbn/hWdzxyMFkrKXTby84JZr7OoVEO8w9HCPyaigoPXqeqRUqHE7WOyN5c1/I7YMPD3Ri2jOvXeRloST1la9oxCBZyxHshxQ8md4Tm3S6rNw7/zC8wH7wKGEiLAFVBkrdbDo9HFa+PpcF/4RoBPiYW4Hk2WDi1m0se4za4wUFg3QUAYrqCYly9lkYyZTQ3SGrKWW59ze/3PrZksaBIM7/Jd9gXeAiJIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nsu8DVj94s4lAr/8sVF1ep8C3D8YLgAKhao4OV41Qdw=;
 b=FEYZxfqcSumAR+yClc7jWdTA4zYIP7U86c82wZrw0erjP6SfN2mQKu6vKFWHtONJt6NROPAdWBRJbUB5OYJzxPVy7ZhRmqNam2qDS64uVu7bd/EtVyszHsWFumcusvmEyWj4YyaM+QDxeRJ7REMD2w8awK1aXmGKk0rQgFp2BIR5m4XQ5W4UbUbCVgponm6o2d9XqX4VOAh5tAqBs6vnf/FsWmyPy6H2XbCfTlEBwCAP4qbzOG/63HmZ4Qo3GqNssoT3h2fn1iIfKyYqI+G+ylWTQo2FQKZWuRBLoBTKqdKD+B1ytCg5mP8aMsxt/UjJgMINZWbb7fzN4v78uTwWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nsu8DVj94s4lAr/8sVF1ep8C3D8YLgAKhao4OV41Qdw=;
 b=F1CKz+MpBRve9sh1fFszdhncdqeGk1nwIQMiz5Zt27aFZWk+xVyrZu3yXNq0KGQ2j9JYpH86vZ1YtKE2955IaNPpUw2sPq8TCb0/hod/3X/48cpYWeZtuc5rdYx1ylS2iRcqub8D6j0ZJtaNzHX2OZwmad+mHlzzvFYCr7BPRH0=
Received: from BN9PR03CA0262.namprd03.prod.outlook.com (2603:10b6:408:ff::27)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.46; Wed, 24 Apr
 2024 08:53:51 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::3f) by BN9PR03CA0262.outlook.office365.com
 (2603:10b6:408:ff::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 08:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 08:53:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 03:53:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 03:53:50 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 24 Apr 2024 03:53:46 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <hersenxs.wu@amd.com>, <jerry.zuo@amd.com>, Wenjing Liu
 <wenjing.liu@amd.com>, Dillon Varone <dillon.varone@amd.com>
Subject: [PATCH 39/46] drm/amd/display: use even ODM slice width for two
 pixels per container
Date: Wed, 24 Apr 2024 16:49:24 +0800
Message-ID: <20240424084931.2656128-40-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240424084931.2656128-1-Wayne.Lin@amd.com>
References: <20240424084931.2656128-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Wayne.Lin@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 343e46fc-0144-4ba7-ca1e-08dc643c1056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0HnZjpAuso87W/nzGsv3zAa8OpCSixSTnqSSwVdw9HMpxqsl9abcigqgnShP?=
 =?us-ascii?Q?+0xOfW8C8Lxhe/rfP168o4ul7JSoOMZbK2KV+GkLSBkBPS7rb6vGJfnHZnnB?=
 =?us-ascii?Q?pzfAN4UJEXC9S6NOVh44AWF5ae8z1Ww1lQglLk9cywYh+e/KN77Aorg5JxCq?=
 =?us-ascii?Q?/Z0wEcAHtPIaRKi5fhP1ybAkdzClqKdz0uAvzCSBa1VzWP1bd5WWgWAFomtP?=
 =?us-ascii?Q?9FrxGI6nnaB1FYhQo060PZiZBQpMMdqjNXBmdTcfpMXSYRKqT3Ekl3y1gAOu?=
 =?us-ascii?Q?3rkwxfzwKasa5Q+9xfkaSEsTkftkj0YV0gls7HdRB0rGmGVgQgTGPxQvRX8J?=
 =?us-ascii?Q?HoJlp9Pwu8wob/gHBgStPD+ZaTb6b9xMeUlEzkgTUvH6Mg1791S2FOvxIWiw?=
 =?us-ascii?Q?3uqmVBgJtiWv/v6YTOkrCizkL4DFPOhITbFx+RENaGiIsXSdIfInJTGGzXDn?=
 =?us-ascii?Q?Ld82k0NDhIcaBLFG/A/irKxDMjmqocZXkybdhuXnIGcWMTmz2ohOveN2sUDa?=
 =?us-ascii?Q?TD3s0/Pe2ED2tZWptmY5zM+06mEYzWmd3CI23E+62sWgcL98P/Gcq7VFiby7?=
 =?us-ascii?Q?pWCAbGznYQVpN3m6H8Wum3HVs/PYhyyx1yYTOHOqCn+bOZ+8SanJJolEiTFr?=
 =?us-ascii?Q?PbeqA5sSsHejWGwWfSPrj/fiVFjUqiHEl4mw7x1GmNyFDM3ZRcImAO2n93PX?=
 =?us-ascii?Q?aI8rVGDHV1FIs4tqgrw+y0LnVKJo3avjVY+PUmFSqpJk9q8Rm2J7ejs5aRHY?=
 =?us-ascii?Q?pAWCJZRmg7GSbAnDgsV4+Vd55cUCsSZ3Iq6dVu6s+vZvr6dDRHPnAQ8eyc5f?=
 =?us-ascii?Q?NrDkuFRnql9ZKCXvvuCLOtQbTxSTF7n415yhp9jkYVGOL+AAjDCSg9Hgwg7H?=
 =?us-ascii?Q?mhN+wrWAZO+DBUUcWWP3DADrScInKAbCodzR62pLzJ7CLortWsz4F/BHiEoC?=
 =?us-ascii?Q?hVfyhM//HXpQfYXUqBm6oL9i7iaYtvRjgDMnWjDn9oYLexb7YRwA16oS06aR?=
 =?us-ascii?Q?LcyUoyKa5ylwVaeXD+ObIZ3taOsgW/HMqFIIepufOLlen5C+6eKa9cmmJti7?=
 =?us-ascii?Q?ywwBggZgZF3Q8c3KV0b28+ucwk72Q0M7lkDhONc2ZVXPI0LIqKR4659d11kC?=
 =?us-ascii?Q?0eg/o6MgWNgQNX2TrbfpeITGp10Rrw2hT2eZOWoNLWaxOgC71EBmHulwNMb+?=
 =?us-ascii?Q?2iGftPxlmU+4ilcZc+0POETRRFJVaAsN5c3KrxLdQgPlHsb1epzwCC8koF5i?=
 =?us-ascii?Q?4YYSA7uON1Msl9P3Ody+uzWjq4MnilyEmJXp5ETTDtg8Rda5MKImkL9VSAep?=
 =?us-ascii?Q?kvUZt+oId5SdzQdHsohrLGm/kfGXvVcsKxSTMzDD2NgKdjwFJyNcHNoULeS1?=
 =?us-ascii?Q?3wlq09o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 08:53:51.4237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 343e46fc-0144-4ba7-ca1e-08dc643c1056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
When optc uses two pixel per container, each ODM slice width must be an
even number.

[how]
If ODM slice width is odd number increase it by 1.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  8 ++++
 .../dc/dce110/dce110_timing_generator.c       | 18 ++++++++
 .../dc/dce110/dce110_timing_generator.h       |  2 +
 .../dc/dce110/dce110_timing_generator_v.c     |  3 +-
 .../dc/dce120/dce120_timing_generator.c       |  1 +
 .../display/dc/dce80/dce80_timing_generator.c |  1 +
 .../display/dc/dml2/dml2_translation_helper.c |  2 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 19 ++++++--
 .../amd/display/dc/hwss/dcn201/dcn201_hwseq.c |  2 +-
 .../amd/display/dc/hwss/dcn314/dcn314_hwseq.c |  4 +-
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  6 +--
 drivers/gpu/drm/amd/display/dc/inc/hw/optc.h  |  4 +-
 .../amd/display/dc/inc/hw/timing_generator.h  |  1 +
 .../amd/display/dc/optc/dcn10/dcn10_optc.c    | 46 +++++++++----------
 .../amd/display/dc/optc/dcn20/dcn20_optc.c    | 10 +---
 .../amd/display/dc/optc/dcn20/dcn20_optc.h    |  1 -
 .../amd/display/dc/optc/dcn201/dcn201_optc.c  |  7 +--
 .../amd/display/dc/optc/dcn201/dcn201_optc.h  |  3 --
 .../amd/display/dc/optc/dcn30/dcn30_optc.c    |  3 +-
 .../amd/display/dc/optc/dcn301/dcn301_optc.c  |  1 +
 .../amd/display/dc/optc/dcn31/dcn31_optc.c    |  1 +
 .../amd/display/dc/optc/dcn314/dcn314_optc.c  |  3 +-
 .../amd/display/dc/optc/dcn32/dcn32_optc.c    |  3 +-
 .../amd/display/dc/optc/dcn35/dcn35_optc.c    |  1 +
 .../amd/display/dc/optc/dcn401/dcn401_optc.c  | 15 ++++--
 .../dc/resource/dcn20/dcn20_resource.c        |  2 +-
 26 files changed, 103 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index ebbeb37f36a6..8dcd7eac4b2b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -827,6 +827,11 @@ static struct rect calculate_odm_slice_in_timing_active(struct pipe_ctx *pipe_ct
 			stream->timing.h_border_right;
 	int odm_slice_width = h_active / odm_slice_count;
 	struct rect odm_rec;
+	bool is_two_pixels_per_container =
+			pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
+
+	if ((odm_slice_width % 2) && is_two_pixels_per_container)
+		odm_slice_width++;
 
 	odm_rec.x = odm_slice_width * odm_slice_idx;
 	odm_rec.width = is_last_odm_slice ?
@@ -1464,6 +1469,7 @@ void resource_build_test_pattern_params(struct resource_context *res_ctx,
 	int v_active = otg_master->stream->timing.v_addressable +
 		otg_master->stream->timing.v_border_bottom +
 		otg_master->stream->timing.v_border_top;
+	bool is_two_pixels_per_container = otg_master->stream_res.tg->funcs->is_two_pixels_per_container(&otg_master->stream->timing);
 	int i;
 
 	controller_test_pattern = convert_dp_to_controller_test_pattern(
@@ -1477,6 +1483,8 @@ void resource_build_test_pattern_params(struct resource_context *res_ctx,
 	odm_cnt = resource_get_opp_heads_for_otg_master(otg_master, res_ctx, opp_heads);
 
 	odm_slice_width = h_active / odm_cnt;
+	if ((odm_slice_width % 2) && is_two_pixels_per_container)
+		odm_slice_width++;
 	last_odm_slice_width = h_active - odm_slice_width * (odm_cnt - 1);
 
 	for (i = 0; i < odm_cnt; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
index 6424e7f279dc..49bcfe6ec999 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.c
@@ -2015,6 +2015,23 @@ bool dce110_tg_validate_timing(struct timing_generator *tg,
 	return dce110_timing_generator_validate_timing(tg, timing, SIGNAL_TYPE_NONE);
 }
 
+/* "Container" vs. "pixel" is a concept within HW blocks, mostly those closer to the back-end. It works like this:
+ *
+ * - In most of the formats (RGB or YCbCr 4:4:4, 4:2:2 uncompressed and DSC 4:2:2 Simple) pixel rate is the same as
+ *   container rate.
+ *
+ * - In 4:2:0 (DSC or uncompressed) there are two pixels per container, hence the target container rate has to be
+ *   halved to maintain the correct pixel rate.
+ *
+ * - Unlike 4:2:2 uncompressed, DSC 4:2:2 Native also has two pixels per container (this happens when DSC is applied
+ *   to it) and has to be treated the same as 4:2:0, i.e. target containter rate has to be halved in this case as well.
+ *
+ */
+bool dce110_is_two_pixels_per_container(const struct dc_crtc_timing *timing)
+{
+	return timing->pixel_encoding == PIXEL_ENCODING_YCBCR420;
+}
+
 void dce110_tg_wait_for_state(struct timing_generator *tg,
 	enum crtc_state state)
 {
@@ -2239,6 +2256,7 @@ static const struct timing_generator_funcs dce110_tg_funcs = {
 		.is_tg_enabled = dce110_is_tg_enabled,
 		.configure_crc = dce110_configure_crc,
 		.get_crc = dce110_get_crc,
+		.is_two_pixels_per_container = dce110_is_two_pixels_per_container,
 };
 
 void dce110_timing_generator_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.h b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.h
index d8a5ed7b485d..28c58f1dff2d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator.h
@@ -288,4 +288,6 @@ bool dce110_configure_crc(struct timing_generator *tg,
 bool dce110_get_crc(struct timing_generator *tg,
 		    uint32_t *r_cr, uint32_t *g_y, uint32_t *b_cb);
 
+bool dce110_is_two_pixels_per_container(const struct dc_crtc_timing *timing);
+
 #endif /* __DC_TIMING_GENERATOR_DCE110_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator_v.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator_v.c
index c509384fff54..bf35dc65ca29 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator_v.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_timing_generator_v.c
@@ -682,7 +682,8 @@ static const struct timing_generator_funcs dce110_tg_v_funcs = {
 		.tear_down_global_swap_lock =
 				dce110_timing_generator_v_tear_down_global_swap_lock,
 		.enable_advanced_request =
-				dce110_timing_generator_v_enable_advanced_request
+				dce110_timing_generator_v_enable_advanced_request,
+		.is_two_pixels_per_container = dce110_is_two_pixels_per_container,
 };
 
 void dce110_timing_generator_v_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_timing_generator.c
index 4af0c70098c4..eb3557965781 100644
--- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_timing_generator.c
@@ -1197,6 +1197,7 @@ static const struct timing_generator_funcs dce120_tg_funcs = {
 		.is_tg_enabled = dce120_is_tg_enabled,
 		.configure_crc = dce120_configure_crc,
 		.get_crc = dce120_get_crc,
+		.is_two_pixels_per_container = dce110_is_two_pixels_per_container,
 };
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
index b8fd43dc010b..2df4654858be 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_timing_generator.c
@@ -220,6 +220,7 @@ static const struct timing_generator_funcs dce80_tg_funcs = {
 				dce80_timing_generator_enable_advanced_request,
 		.configure_crc = dce110_configure_crc,
 		.get_crc = dce110_get_crc,
+		.is_two_pixels_per_container = dce110_is_two_pixels_per_container,
 };
 
 void dce80_timing_generator_construct(
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 90bb030bb523..f00526d04cb7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -941,7 +941,7 @@ static struct scaler_data get_scaler_data_for_plane(const struct dc_plane_state
 			temp_pipe->stream = pipe->stream;
 			temp_pipe->plane_state = pipe->plane_state;
 			temp_pipe->plane_res.scl_data.taps = pipe->plane_res.scl_data.taps;
-
+			temp_pipe->stream_res = pipe->stream_res;
 			resource_build_scaling_params(temp_pipe);
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 26b19de687cc..e0cc78e899bd 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -758,9 +758,9 @@ void dcn20_disable_pixel_data(struct dc *dc, struct pipe_ctx *pipe_ctx, bool bla
 }
 
 static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
-		int opp_cnt)
+		int opp_cnt, bool is_two_pixels_per_container)
 {
-	bool hblank_halved = optc2_is_two_pixels_per_containter(&stream->timing);
+	bool hblank_halved = is_two_pixels_per_container;
 	int flow_ctrl_cnt;
 
 	if (opp_cnt >= 2)
@@ -827,7 +827,9 @@ enum dc_status dcn20_enable_stream_timing(
 	int i;
 	struct mpc_dwb_flow_control flow_control;
 	struct mpc *mpc = dc->res_pool->mpc;
-	bool rate_control_2x_pclk = (interlace || optc2_is_two_pixels_per_containter(&stream->timing));
+	bool is_two_pixels_per_container =
+			pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
+	bool rate_control_2x_pclk = (interlace || is_two_pixels_per_container);
 	unsigned int k1_div = PIXEL_RATE_DIV_NA;
 	unsigned int k2_div = PIXEL_RATE_DIV_NA;
 
@@ -913,7 +915,8 @@ enum dc_status dcn20_enable_stream_timing(
 	rate_control_2x_pclk = rate_control_2x_pclk || opp_cnt > 1;
 	flow_control.flow_ctrl_mode = 0;
 	flow_control.flow_ctrl_cnt0 = 0x80;
-	flow_control.flow_ctrl_cnt1 = calc_mpc_flow_ctrl_cnt(stream, opp_cnt);
+	flow_control.flow_ctrl_cnt1 = calc_mpc_flow_ctrl_cnt(stream, opp_cnt,
+			is_two_pixels_per_container);
 	if (mpc->funcs->set_out_rate_control) {
 		for (i = 0; i < opp_cnt; ++i) {
 			mpc->funcs->set_out_rate_control(
@@ -1210,6 +1213,8 @@ void dcn20_blank_pixel_data(
 	int h_active = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
 	int v_active = stream->timing.v_addressable + stream->timing.v_border_bottom + stream->timing.v_border_top;
 	int odm_slice_width, last_odm_slice_width, offset = 0;
+	bool is_two_pixels_per_container =
+			pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
 
 	if (stream->link->test_pattern_enabled)
 		return;
@@ -1220,6 +1225,8 @@ void dcn20_blank_pixel_data(
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		odm_cnt++;
 	odm_slice_width = h_active / odm_cnt;
+	if ((odm_slice_width % 2) && is_two_pixels_per_container)
+		odm_slice_width++;
 	last_odm_slice_width = h_active - odm_slice_width * (odm_cnt - 1);
 
 	if (blank) {
@@ -2642,6 +2649,8 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 	struct dc_link *link = stream->link;
 	struct dce_hwseq *hws = link->dc->hwseq;
 	struct pipe_ctx *odm_pipe;
+	bool is_two_pixels_per_container =
+			pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
 
 	params.opp_cnt = 1;
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
@@ -2658,7 +2667,7 @@ void dcn20_unblank_stream(struct pipe_ctx *pipe_ctx,
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
 				pipe_ctx->stream_res.tg->inst);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
-		if (optc2_is_two_pixels_per_containter(&stream->timing) || params.opp_cnt > 1)
+		if (is_two_pixels_per_container || params.opp_cnt > 1)
 			params.timing.pix_clk_100hz /= 2;
 		pipe_ctx->stream_res.stream_enc->funcs->dp_set_odm_combine(
 				pipe_ctx->stream_res.stream_enc, params.opp_cnt > 1);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
index 59f46df01551..86d871cc74c7 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn201/dcn201_hwseq.c
@@ -604,7 +604,7 @@ void dcn201_unblank_stream(struct pipe_ctx *pipe_ctx,
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
 		/*check whether it is half the rate*/
-		if (optc201_is_two_pixels_per_containter(&stream->timing))
+		if (pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing))
 			params.timing.pix_clk_100hz /= 2;
 
 		pipe_ctx->stream_res.stream_enc->funcs->dp_unblank(link, pipe_ctx->stream_res.stream_enc, &params);
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
index 093f4387553c..06b70c360ff8 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c
@@ -302,7 +302,7 @@ unsigned int dcn314_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsig
 	unsigned int odm_combine_factor = 0;
 	bool two_pix_per_container = false;
 
-	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
+	two_pix_per_container = pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
 	if (stream->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
@@ -341,7 +341,7 @@ void dcn314_set_pixels_per_cycle(struct pipe_ctx *pipe_ctx)
 		return;
 
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
-	if (optc2_is_two_pixels_per_containter(&pipe_ctx->stream->timing) || odm_combine_factor > 1)
+	if (pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&pipe_ctx->stream->timing) || odm_combine_factor > 1)
 		pix_per_cycle = 2;
 
 	if (pipe_ctx->stream_res.stream_enc->funcs->set_input_mode)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 272c4cdfbfe3..5bc4d9b2cf79 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -1143,7 +1143,7 @@ unsigned int dcn32_calculate_dccg_k1_k2_values(struct pipe_ctx *pipe_ctx, unsign
 	unsigned int odm_combine_factor = 0;
 	bool two_pix_per_container = false;
 
-	two_pix_per_container = optc2_is_two_pixels_per_containter(&stream->timing);
+	two_pix_per_container = pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing);
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
 
 	if (stream->ctx->dc->link_srv->dp_is_128b_132b_signal(pipe_ctx)) {
@@ -1182,7 +1182,7 @@ void dcn32_set_pixels_per_cycle(struct pipe_ctx *pipe_ctx)
 		return;
 
 	odm_combine_factor = get_odm_config(pipe_ctx, NULL);
-	if (optc2_is_two_pixels_per_containter(&pipe_ctx->stream->timing) || odm_combine_factor > 1
+	if (pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&pipe_ctx->stream->timing) || odm_combine_factor > 1
 		|| dcn32_is_dp_dig_pixel_rate_div_policy(pipe_ctx))
 		pix_per_cycle = 2;
 
@@ -1246,7 +1246,7 @@ void dcn32_unblank_stream(struct pipe_ctx *pipe_ctx,
 				pipe_ctx->stream_res.hpo_dp_stream_enc,
 				pipe_ctx->stream_res.tg->inst);
 	} else if (dc_is_dp_signal(pipe_ctx->stream->signal)) {
-		if (optc2_is_two_pixels_per_containter(&stream->timing) || params.opp_cnt > 1
+		if (pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing) || params.opp_cnt > 1
 			|| dcn32_is_dp_dig_pixel_rate_div_policy(pipe_ctx)) {
 			params.timing.pix_clk_100hz /= 2;
 			pix_per_cycle = 2;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/optc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/optc.h
index 8d32e525f05a..287bf8a90ff6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/optc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/optc.h
@@ -212,10 +212,10 @@ bool optc1_get_crc(struct timing_generator *optc,
 		   uint32_t *g_y,
 		   uint32_t *b_cb);
 
-bool optc1_is_two_pixels_per_containter(const struct dc_crtc_timing *timing);
-
 void optc1_set_vtg_params(struct timing_generator *optc,
 			  const struct dc_crtc_timing *dc_crtc_timing,
 			  bool program_fp2);
 
+bool optc1_is_two_pixels_per_container(const struct dc_crtc_timing *timing);
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index cd68ecc242c1..a347425c1da2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -276,6 +276,7 @@ struct timing_generator_funcs {
 			uint32_t *num_of_input_segments,
 			uint32_t *seg0_src_sel,
 			uint32_t *seg1_src_sel);
+	bool (*is_two_pixels_per_container)(const struct dc_crtc_timing *timing);
 
 	/**
 	 * Configure CRCs for the given timing generator. Return false if TG is
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
index 5574bc628053..03140e7372d9 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c
@@ -297,7 +297,7 @@ void optc1_program_timing(
 	 * of stereo handled in explicit call
 	 */
 
-	if (optc1_is_two_pixels_per_containter(&patched_crtc_timing) || optc1->opp_count == 2)
+	if (optc->funcs->is_two_pixels_per_container(&patched_crtc_timing) || optc1->opp_count == 2)
 		h_div = H_TIMING_DIV_BY2;
 
 	if (REG(OPTC_DATA_FORMAT_CONTROL) && optc1->tg_mask->OPTC_DATA_FORMAT != 0) {
@@ -1548,6 +1548,27 @@ bool optc1_get_crc(struct timing_generator *optc,
 	return true;
 }
 
+/* "Container" vs. "pixel" is a concept within HW blocks, mostly those closer to the back-end. It works like this:
+ *
+ * - In most of the formats (RGB or YCbCr 4:4:4, 4:2:2 uncompressed and DSC 4:2:2 Simple) pixel rate is the same as
+ *   container rate.
+ *
+ * - In 4:2:0 (DSC or uncompressed) there are two pixels per container, hence the target container rate has to be
+ *   halved to maintain the correct pixel rate.
+ *
+ * - Unlike 4:2:2 uncompressed, DSC 4:2:2 Native also has two pixels per container (this happens when DSC is applied
+ *   to it) and has to be treated the same as 4:2:0, i.e. target containter rate has to be halved in this case as well.
+ *
+ */
+bool optc1_is_two_pixels_per_container(const struct dc_crtc_timing *timing)
+{
+	bool two_pix = timing->pixel_encoding == PIXEL_ENCODING_YCBCR420;
+
+	two_pix = two_pix || (timing->flags.DSC && timing->pixel_encoding == PIXEL_ENCODING_YCBCR422
+			&& !timing->dsc_cfg.ycbcr422_simple);
+	return two_pix;
+}
+
 static const struct timing_generator_funcs dcn10_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
@@ -1594,6 +1615,7 @@ static const struct timing_generator_funcs dcn10_tg_funcs = {
 		.program_manual_trigger = optc1_program_manual_trigger,
 		.setup_manual_trigger = optc1_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn10_timing_generator_init(struct optc *optc1)
@@ -1609,25 +1631,3 @@ void dcn10_timing_generator_init(struct optc *optc1)
 	optc1->min_h_sync_width = 4;
 	optc1->min_v_sync_width = 1;
 }
-
-/* "Containter" vs. "pixel" is a concept within HW blocks, mostly those closer to the back-end. It works like this:
- *
- * - In most of the formats (RGB or YCbCr 4:4:4, 4:2:2 uncompressed and DSC 4:2:2 Simple) pixel rate is the same as
- *   containter rate.
- *
- * - In 4:2:0 (DSC or uncompressed) there are two pixels per container, hence the target container rate has to be
- *   halved to maintain the correct pixel rate.
- *
- * - Unlike 4:2:2 uncompressed, DSC 4:2:2 Native also has two pixels per container (this happens when DSC is applied
- *   to it) and has to be treated the same as 4:2:0, i.e. target containter rate has to be halved in this case as well.
- *
- */
-bool optc1_is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
-{
-	bool two_pix = timing->pixel_encoding == PIXEL_ENCODING_YCBCR420;
-
-	two_pix = two_pix || (timing->flags.DSC && timing->pixel_encoding == PIXEL_ENCODING_YCBCR422
-			&& !timing->dsc_cfg.ycbcr422_simple);
-	return two_pix;
-}
-
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
index d6f095b4555d..314a0cee08ae 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
@@ -158,13 +158,6 @@ void optc2_get_dsc_status(struct timing_generator *optc,
 		OPTC_DSC_MODE, dsc_mode);
 }
 
-
-/*TEMP: Need to figure out inheritance model here.*/
-bool optc2_is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
-{
-	return optc1_is_two_pixels_per_containter(timing);
-}
-
 void optc2_set_odm_bypass(struct timing_generator *optc,
 		const struct dc_crtc_timing *dc_crtc_timing)
 {
@@ -177,7 +170,7 @@ void optc2_set_odm_bypass(struct timing_generator *optc,
 			OPTC_SEG1_SRC_SEL, 0xf);
 	REG_WRITE(OTG_H_TIMING_CNTL, 0);
 
-	h_div_2 = optc2_is_two_pixels_per_containter(dc_crtc_timing);
+	h_div_2 = optc->funcs->is_two_pixels_per_container(dc_crtc_timing);
 	REG_UPDATE(OTG_H_TIMING_CNTL,
 			OTG_H_TIMING_DIV_BY2, h_div_2);
 	REG_SET(OPTC_MEMORY_CONFIG, 0,
@@ -560,6 +553,7 @@ static struct timing_generator_funcs dcn20_tg_funcs = {
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
 		.align_vblanks = optc2_align_vblanks,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn20_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h
index c2e03ced392e..1f8bc7fce9fc 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.h
@@ -118,7 +118,6 @@ void optc2_lock_doublebuffer_disable(struct timing_generator *optc);
 void optc2_lock_doublebuffer_enable(struct timing_generator *optc);
 void optc2_setup_manual_trigger(struct timing_generator *optc);
 void optc2_program_manual_trigger(struct timing_generator *optc);
-bool optc2_is_two_pixels_per_containter(const struct dc_crtc_timing *timing);
 bool optc2_configure_crc(struct timing_generator *optc,
 			  const struct crc_params *params);
 #endif /* __DC_OPTC_DCN20_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
index 70fcbec03fb6..49c2efdfa403 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
@@ -38,12 +38,6 @@
 #define FN(reg_name, field_name) \
 	optc1->tg_shift->field_name, optc1->tg_mask->field_name
 
-/*TEMP: Need to figure out inheritance model here.*/
-bool optc201_is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
-{
-	return optc1_is_two_pixels_per_containter(timing);
-}
-
 static void optc201_triplebuffer_lock(struct timing_generator *optc)
 {
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
@@ -185,6 +179,7 @@ static struct timing_generator_funcs dcn201_tg_funcs = {
 		.program_manual_trigger = optc2_program_manual_trigger,
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn201_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.h b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.h
index e9545b73513a..a9b281abfd44 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.h
@@ -68,7 +68,4 @@
 	SF(DWB_SOURCE_SELECT, OPTC_DWB1_SOURCE_SELECT, mask_sh)
 
 void dcn201_timing_generator_init(struct optc *optc);
-
-bool optc201_is_two_pixels_per_containter(const struct dc_crtc_timing *timing);
-
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
index b97bdb868a0e..c805fd2a48a1 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
@@ -206,7 +206,7 @@ void optc3_set_odm_bypass(struct timing_generator *optc,
 			OPTC_SEG3_SRC_SEL, 0xf
 			);
 
-	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	h_div = optc->funcs->is_two_pixels_per_container(dc_crtc_timing);
 	REG_UPDATE(OTG_H_TIMING_CNTL,
 			OTG_H_TIMING_DIV_MODE, h_div);
 
@@ -376,6 +376,7 @@ static struct timing_generator_funcs dcn30_tg_funcs = {
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
 		.wait_drr_doublebuffer_pending_clear = optc3_wait_drr_doublebuffer_pending_clear,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn30_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
index b3cfcb887905..1a22ae89fb55 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
@@ -168,6 +168,7 @@ static struct timing_generator_funcs dcn30_tg_funcs = {
 		.setup_manual_trigger = optc301_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
 		.wait_drr_doublebuffer_pending_clear = optc3_wait_drr_doublebuffer_pending_clear,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn301_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
index 63a677c8ee27..84d2ba31e2ca 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
@@ -292,6 +292,7 @@ static struct timing_generator_funcs dcn31_tg_funcs = {
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
 		.init_odm = optc3_init_odm,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn31_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
index 0086cafb0f7a..9022fb2ffca4 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
@@ -175,7 +175,7 @@ static void optc314_set_odm_bypass(struct timing_generator *optc,
 			OPTC_SEG3_SRC_SEL, 0xf
 			);
 
-	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	h_div = optc->funcs->is_two_pixels_per_container(dc_crtc_timing);
 	REG_UPDATE(OTG_H_TIMING_CNTL,
 			OTG_H_TIMING_DIV_MODE, h_div);
 
@@ -255,6 +255,7 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
 		.set_odm_bypass = optc314_set_odm_bypass,
 		.set_odm_combine = optc314_set_odm_combine,
 		.set_h_timing_div_manual_mode = optc314_set_h_timing_div_manual_mode,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn314_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
index c4f0e1951427..296d658a2334 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
@@ -239,7 +239,7 @@ void optc32_set_odm_bypass(struct timing_generator *optc,
 			OPTC_SEG3_SRC_SEL, 0xf
 			);
 
-	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	h_div = optc->funcs->is_two_pixels_per_container(dc_crtc_timing);
 	REG_UPDATE(OTG_H_TIMING_CNTL,
 			OTG_H_TIMING_DIV_MODE, h_div);
 
@@ -368,6 +368,7 @@ static struct timing_generator_funcs dcn32_tg_funcs = {
 		.program_manual_trigger = optc2_program_manual_trigger,
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn32_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
index d393be30dff8..cf8da22492dc 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
@@ -438,6 +438,7 @@ static struct timing_generator_funcs dcn35_tg_funcs = {
 		.get_hw_timing = optc1_get_hw_timing,
 		.init_odm = optc3_init_odm,
 		.set_long_vtotal = optc35_set_long_vtotal,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn35_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
index 3c7b0624acea..a974382be6c5 100644
--- a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
@@ -107,11 +107,17 @@ static void optc401_set_odm_combine(struct timing_generator *optc, int *opp_id,
 	struct optc *optc1 = DCN10TG_FROM_TG(optc);
 	uint32_t h_active = timing->h_addressable +
 			timing->h_border_left + timing->h_border_right;
-	uint32_t odm_segment_width = h_active / opp_cnt;
-	uint32_t odm_segment_width_last =
-			h_active - odm_segment_width * (opp_cnt - 1);
 	uint32_t odm_mem_bit_map = decide_odm_mem_bit_map(
 			opp_id, opp_cnt, h_active);
+	uint32_t odm_segment_width;
+	uint32_t odm_segment_width_last;
+	bool is_two_pixels_per_container = optc->funcs->is_two_pixels_per_container(timing);
+
+	odm_segment_width = h_active / opp_cnt;
+	if ((odm_segment_width % 2) && is_two_pixels_per_container)
+		odm_segment_width++;
+	odm_segment_width_last =
+			h_active - odm_segment_width * (opp_cnt - 1);
 
 	REG_SET(OPTC_MEMORY_CONFIG, 0,
 		OPTC_MEM_SEL, odm_mem_bit_map);
@@ -273,7 +279,7 @@ static void optc401_set_odm_bypass(struct timing_generator *optc,
 			OPTC_SEG3_SRC_SEL, 0xf
 			);
 
-	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	h_div = optc->funcs->is_two_pixels_per_container(dc_crtc_timing);
 	REG_UPDATE(OTG_H_TIMING_CNTL,
 			OTG_H_TIMING_DIV_MODE, h_div);
 
@@ -457,6 +463,7 @@ static struct timing_generator_funcs dcn401_tg_funcs = {
 		.program_manual_trigger = optc2_program_manual_trigger,
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
+		.is_two_pixels_per_container = optc1_is_two_pixels_per_container,
 };
 
 void dcn401_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index fd5fdb7f4eea..cf0929b8bec0 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -1251,7 +1251,7 @@ static void get_pixel_clock_parameters(
 
 	if (opp_cnt == 4)
 		pixel_clk_params->requested_pix_clk_100hz /= 4;
-	else if (optc2_is_two_pixels_per_containter(&stream->timing) || opp_cnt == 2)
+	else if (pipe_ctx->stream_res.tg->funcs->is_two_pixels_per_container(&stream->timing) || opp_cnt == 2)
 		pixel_clk_params->requested_pix_clk_100hz /= 2;
 	else if (hws->funcs.is_dp_dig_pixel_rate_div_policy) {
 		if (hws->funcs.is_dp_dig_pixel_rate_div_policy(pipe_ctx))
-- 
2.37.3

