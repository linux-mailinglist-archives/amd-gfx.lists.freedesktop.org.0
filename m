Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927B2810A0C
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Dec 2023 07:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F48C10E6FA;
	Wed, 13 Dec 2023 06:14:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAA110E6F9
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Dec 2023 06:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DjRqEx9MLSRh+EOf1eteqSc+glqsY0XHQCOJEfw4wPHS8xE70kong2Ozs6dUiWrQI49bo3tROoyFGSe6sVmfk2S7KpFN+/RmyjHnsuz5BmwDYmtLexTOngCvKOM5HYreKfuSTG+J4B6/OUfB/gTT5OW8bhhW1r7Fzha50p4Zjq2W5a3DtgdUJfzUG4clgrMMOOGEswbXCwG9Vz8+vzRG7ELBJdFyIfGRdquWHQFg1jyERl0lYIbTUJZbl9HMB5wbj0BEfU8mMkxjONs1f60AG6Zv9Rcxt2a8heJSExE15eNgizS7Cj+xPqHHFqUm1ie821bX6ukiZCSM2xvEcNg3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGGgyczgISUIoh6/9pi5wYCph92ouAx0XlbziAm+JA8=;
 b=YCVQuJvOKhaSE0nPh5Av9kIxfow8DyG+ED1WE89wEYe2XK+bWI9s27L8qCIWMxLKk6s+BHJVj5WKoFGCOt+U2MmlZ9ow4/e8TP+JdYhWSg/kGDKNZw8YHWSguhqoPYBZMZlP6aBjMQrABCg/0ZMqn+jDsc0HLcUCte4i7B6chWcUVoskTxEmeEUAu4xdeCk4O2VIkSpEcYVFeshOdC125lkT6CUa0lpzdKWP/I4/HE+qFZc0gghNHpu+ClwoxdtI4oDcdigY0/n/vae74SV5CKacfwBzlsmnd86xEqnYil2pxAMyup+aALYz+Kc76YNdEk97YIGKp4Th/Mtot7M93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGGgyczgISUIoh6/9pi5wYCph92ouAx0XlbziAm+JA8=;
 b=DoutKv2RE3TRyhJCj4ADFD0f7dSwOxfuQZvfatwi1WuHGmsPWIw3MV/zohd7mzjbsA4psCTw4vaiu45s4yUOxktlgjgX5ijORxm6iKDyykBkMIPCLXDyUE3Qj4Jz7EA61WexGL1e3wsaqwVET0tMUgglHEqmsGue+wonpXlMyR0=
Received: from SJ0PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:33b::12)
 by BN9PR12MB5353.namprd12.prod.outlook.com (2603:10b6:408:102::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:14:32 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::7f) by SJ0PR05CA0007.outlook.office365.com
 (2603:10b6:a03:33b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 06:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 06:14:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 13 Dec
 2023 00:14:29 -0600
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 13 Dec 2023 00:14:24 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/25] drm/amd/display: Wake DMCUB before sending a command
Date: Wed, 13 Dec 2023 14:12:18 +0800
Message-ID: <20231213061227.1750663-17-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213061227.1750663-1-Wayne.Lin@amd.com>
References: <20231213061227.1750663-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|BN9PR12MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: d1cfea3d-8db3-43e5-395a-08dbfba2c54f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7seoXp6et7eK8clEkB4/NaL64aew4jyo7mu8r5GHLlWFsrTJoQjx6lotPrwvtVEh78qRNuX8SMhsTf79kEJ2VBjxwKaDxaMqFC40Q2ILnH55fNu+LRTDfZb377MEC47iN+eWoSIZ2yywvXS28oaeF/p7pCixyQpqaeFRpwOE27zsdnM5vq4Z0Q5A1RCLx5uu75+nNWBRTGjEFQCEgv7R6gTje/yQqBuLokam+20nBoTH/ZsyrovKXQf0OLUtAUrlUO58hctYRG8cwjNLp0V15S49T2N3Qkjl6tHZr0kDjtJnhJaw7t6pt9f21ejHza9luGREAa96tt3tNmbfY8SR0mJBiQQbQ+pDygB/IQQY39W2l2usKZGKNuZqMUjuJANKNgEraHYKjyApmtbVzDygfrZOxR48sRYrpCguoXk1HhkD1jXthNqV1iwwj4j3NsLxXUHBzuGFP6mDuVU5eGLr8bfn88CFLM9zUxp8uakjMJnbFlzW4TcZ2qcfkYYGxU8Iukoh01mbqLoCK66W64YqSMx+JLkuqlbKpJfs1JsnllqYggqAhrEhmfN68BSefc0sAYpagTliE8ZDLIB3lIcCPHRdVS5TEvFrvlqIgiZ/g24ahHstXPtv5fkW3qPdJI94VHop+HuQvI5wuDPmOuqQQbzIdfw2QnVk0J1FaMFH++5CJHRrlkTMeS07MwkXg4XpO+vvRO/xAHqHgOTtwwxXEv86hVYDgaD+AHrerxTFpUKqu8hmO67eMeV2U3a++EXb3U2ky4+KK3LXw/qWuxn1Fg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(40470700004)(36840700001)(46966006)(40480700001)(1076003)(2616005)(426003)(336012)(26005)(7696005)(6666004)(40460700003)(86362001)(82740400003)(81166007)(356005)(36756003)(30864003)(5660300002)(8676002)(8936002)(4326008)(36860700001)(83380400001)(47076005)(54906003)(6916009)(70206006)(70586007)(41300700001)(2906002)(316002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 06:14:31.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cfea3d-8db3-43e5-395a-08dbfba2c54f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5353
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
Cc: stylon.wang@amd.com, Hansen Dsouza <hansen.dsouza@amd.com>,
 chiahsuan.chung@amd.com, Sunpeng.Li@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, stable@vger.kernel.org, jerry.zuo@amd.com,
 Aurabindo.Pillai@amd.com, hersenxs.wu@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, wayne.lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Harry.Wentland@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, agustin.gutierrez@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[Why]
We can hang in place trying to send commands when the DMCUB isn't
powered on.

[How]
For functions that execute within a DC context or DC lock we can
wrap the direct calls to dm_execute_dmub_cmd/list with code that
exits idle power optimizations and reallows once we're done with
the command submission on success.

For DM direct submissions the DM will need to manage the enter/exit
sequencing manually.

We cannot invoke a DMCUB command directly within the DM execution
helper or we can deadlock.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Hansen Dsouza <hansen.dsouza@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../drm/amd/display/dc/bios/command_table2.c  | 12 ++---
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  |  2 +-
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        |  2 +-
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        |  2 +-
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        |  2 +-
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 12 ++---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  | 53 ++++++++++++++++---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  | 40 ++++++++++++++
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  6 +--
 .../gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c | 14 ++---
 .../drm/amd/display/dc/dce/dmub_hw_lock_mgr.c |  2 +-
 .../gpu/drm/amd/display/dc/dce/dmub_outbox.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 14 ++---
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c |  2 +-
 .../display/dc/dcn31/dcn31_dio_link_encoder.c |  4 +-
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   |  4 +-
 .../amd/display/dc/hwss/dcn21/dcn21_hwseq.c   |  4 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  8 +--
 .../amd/display/dc/hwss/dcn31/dcn31_hwseq.c   |  4 +-
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  6 +--
 .../dc/link/protocols/link_dp_capability.c    |  2 +-
 .../display/dc/link/protocols/link_dp_dpia.c  |  3 +-
 25 files changed, 143 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0954d7057a9b..34780bcde59c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10860,7 +10860,7 @@ static bool dm_edid_parser_send_cea(struct amdgpu_display_manager *dm,
 	input->cea_total_length = total_length;
 	memcpy(input->payload, data, length);
 
-	res = dm_execute_dmub_cmd(dm->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
+	res = dc_wake_and_execute_dmub_cmd(dm->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
 	if (!res) {
 		DRM_ERROR("EDID CEA parser failed\n");
 		return false;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index ab0adabf9dd4..293a919d605d 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -123,7 +123,7 @@ static void encoder_control_dmcub(
 		sizeof(cmd.digx_encoder_control.header);
 	cmd.digx_encoder_control.encoder_control.dig.stream_param = *dig;
 
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result encoder_control_digx_v1_5(
@@ -259,7 +259,7 @@ static void transmitter_control_dmcub(
 		sizeof(cmd.dig1_transmitter_control.header);
 	cmd.dig1_transmitter_control.transmitter_control.dig = *dig;
 
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result transmitter_control_v1_6(
@@ -321,7 +321,7 @@ static void transmitter_control_dmcub_v1_7(
 		sizeof(cmd.dig1_transmitter_control.header);
 	cmd.dig1_transmitter_control.transmitter_control.dig_v1_7 = *dig;
 
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result transmitter_control_v1_7(
@@ -429,7 +429,7 @@ static void set_pixel_clock_dmcub(
 		sizeof(cmd.set_pixel_clock.header);
 	cmd.set_pixel_clock.pixel_clock.clk = *clk;
 
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result set_pixel_clock_v7(
@@ -796,7 +796,7 @@ static void enable_disp_power_gating_dmcub(
 		sizeof(cmd.enable_disp_power_gating.header);
 	cmd.enable_disp_power_gating.power_gating.pwr = *pwr;
 
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result enable_disp_power_gating_v2_1(
@@ -1006,7 +1006,7 @@ static void enable_lvtma_control_dmcub(
 			pwrseq_instance;
 	cmd.lvtma_control.data.bypass_panel_control_wait =
 			bypass_panel_control_wait;
-	dm_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmcub->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static enum bp_result enable_lvtma_control(
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
index 3db4ef564b99..ce1386e22576 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
@@ -253,7 +253,7 @@ void dcn31_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
index 7326b7565846..757528256326 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn314/dcn314_clk_mgr.c
@@ -284,7 +284,7 @@ void dcn314_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index 8776055bbeaa..644da4637320 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -232,7 +232,7 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static void dcn315_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 09151cc56ce4..12f3e8aa46d8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -239,7 +239,7 @@ static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static void dcn316_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
index 789091f3bdc8..9c660d1facc7 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
@@ -343,7 +343,7 @@ void dcn35_update_clocks(struct clk_mgr *clk_mgr_base,
 	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
 	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 445f87fa0eac..f2fc7df68b58 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -522,7 +522,7 @@ dc_stream_forward_dmub_crc_window(struct dc_dmub_srv *dmub_srv,
 		cmd.secure_display.roi_info.y_end = rect->y + rect->height;
 	}
 
-	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 }
 
 static inline void
@@ -3381,7 +3381,7 @@ void dc_dmub_update_dirty_rect(struct dc *dc,
 
 			update_dirty_rect->panel_inst = panel_inst;
 			update_dirty_rect->pipe_idx = j;
-			dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+			dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 		}
 	}
 }
@@ -5207,7 +5207,7 @@ bool dc_process_dmub_aux_transfer_async(struct dc *dc,
 			);
 	}
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -5261,7 +5261,7 @@ bool dc_process_dmub_set_config_async(struct dc *dc,
 	cmd.set_config_access.set_config_control.cmd_pkt.msg_type = payload->msg_type;
 	cmd.set_config_access.set_config_control.cmd_pkt.msg_data = payload->msg_data;
 
-	if (!dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)) {
+	if (!dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY)) {
 		/* command is not processed by dmub */
 		notify->sc_status = SET_CONFIG_UNKNOWN_ERROR;
 		return is_cmd_complete;
@@ -5304,7 +5304,7 @@ enum dc_status dc_process_dmub_set_mst_slots(const struct dc *dc,
 	cmd.set_mst_alloc_slots.mst_slots_control.instance = dc->links[link_index]->ddc_hw_inst;
 	cmd.set_mst_alloc_slots.mst_slots_control.mst_alloc_slots = mst_alloc_slots;
 
-	if (!dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
+	if (!dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		/* command is not processed by dmub */
 		return DC_ERROR_UNEXPECTED;
 
@@ -5342,7 +5342,7 @@ void dc_process_dmub_dpia_hpd_int_enable(const struct dc *dc,
 	cmd.dpia_hpd_int_enable.header.type = DMUB_CMD__DPIA_HPD_INT_ENABLE;
 	cmd.dpia_hpd_int_enable.enable = hpd_int_enable;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	DC_LOG_DEBUG("%s: hpd_int_enable(%d)\n", __func__, hpd_int_enable);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index fe07160932d6..fc18b9dc946f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -724,7 +724,7 @@ void hwss_send_dmcub_cmd(union block_sequence_params *params)
 	union dmub_rb_cmd *cmd = params->send_dmcub_cmd_params.cmd;
 	enum dm_dmub_wait_type wait_type = params->send_dmcub_cmd_params.wait_type;
 
-	dm_execute_dmub_cmd(ctx, cmd, wait_type);
+	dc_wake_and_execute_dmub_cmd(ctx, cmd, wait_type);
 }
 
 void hwss_program_manual_trigger(union block_sequence_params *params)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index ccfe2b6046fd..fea13bcd4dc7 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -360,7 +360,7 @@ void dc_dmub_srv_drr_update_cmd(struct dc *dc, uint32_t tg_inst, uint32_t vtotal
 	cmd.drr_update.header.payload_bytes = sizeof(cmd.drr_update) - sizeof(cmd.drr_update.header);
 
 	// Send the command to the DMCUB.
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dc_dmub_srv_set_drr_manual_trigger_cmd(struct dc *dc, uint32_t tg_inst)
@@ -374,7 +374,7 @@ void dc_dmub_srv_set_drr_manual_trigger_cmd(struct dc *dc, uint32_t tg_inst)
 	cmd.drr_update.header.payload_bytes = sizeof(cmd.drr_update) - sizeof(cmd.drr_update.header);
 
 	// Send the command to the DMCUB.
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 static uint8_t dc_dmub_srv_get_pipes_for_stream(struct dc *dc, struct dc_stream_state *stream)
@@ -467,7 +467,7 @@ bool dc_dmub_srv_p_state_delegate(struct dc *dc, bool should_manage_pstate, stru
 		sizeof(cmd.fw_assisted_mclk_switch) - sizeof(cmd.fw_assisted_mclk_switch.header);
 
 	// Send the command to the DMCUB.
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -488,7 +488,7 @@ void dc_dmub_srv_query_caps_cmd(struct dc_dmub_srv *dc_dmub_srv)
 	cmd.query_feature_caps.header.payload_bytes = sizeof(struct dmub_cmd_query_feature_caps_data);
 
 	/* If command was processed, copy feature caps to dmub srv */
-	if (dm_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
+	if (dc_wake_and_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 	    cmd.query_feature_caps.header.ret_status == 0) {
 		memcpy(&dc_dmub_srv->dmub->feature_caps,
 		       &cmd.query_feature_caps.query_feature_caps_data,
@@ -513,7 +513,7 @@ void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pi
 	cmd.visual_confirm_color.visual_confirm_color_data.visual_confirm_color.panel_inst = panel_inst;
 
 	// If command was processed, copy feature caps to dmub srv
-	if (dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
+	if (dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 		cmd.visual_confirm_color.header.ret_status == 0) {
 		memcpy(&dc->ctx->dmub_srv->dmub->visual_confirm_color,
 			&cmd.visual_confirm_color.visual_confirm_color_data,
@@ -875,7 +875,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
 	}
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 bool dc_dmub_srv_get_diagnostic_data(struct dc_dmub_srv *dc_dmub_srv, struct dmub_diagnostic_data *diag_data)
@@ -1112,7 +1112,7 @@ void dc_send_update_cursor_info_to_dmu(
 				pipe_idx, pCtx->plane_res.hubp, pCtx->plane_res.dpp);
 
 		/* Combine 2nd cmds update_curosr_info to DMU */
-		dm_execute_dmub_cmd_list(pCtx->stream->ctx, 2, cmd, DM_DMUB_WAIT_TYPE_WAIT);
+		dc_wake_and_execute_dmub_cmd_list(pCtx->stream->ctx, 2, cmd, DM_DMUB_WAIT_TYPE_WAIT);
 	}
 }
 
@@ -1207,6 +1207,7 @@ static void dc_dmub_srv_notify_idle(const struct dc *dc, bool allow_idle)
 			dc->hwss.set_idle_state(dc, true);
 	}
 
+	/* NOTE: This does not use the "wake" interface since this is part of the wake path. */
 	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
@@ -1329,3 +1330,41 @@ void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_
 	else
 		dc_dmub_srv_notify_idle(dc, allow_idle);
 }
+
+bool dc_wake_and_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
+				  enum dm_dmub_wait_type wait_type)
+{
+	return dc_wake_and_execute_dmub_cmd_list(ctx, 1, cmd, wait_type);
+}
+
+bool dc_wake_and_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count,
+				       union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type)
+{
+	struct dc_dmub_srv *dc_dmub_srv = ctx->dmub_srv;
+	bool result = false, reallow_idle = false;
+
+	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
+		return false;
+
+	if (count == 0)
+		return true;
+
+	if (dc_dmub_srv->idle_allowed) {
+		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, false);
+		reallow_idle = true;
+	}
+
+	/*
+	 * These may have different implementations in DM, so ensure
+	 * that we guide it to the expected helper.
+	 */
+	if (count > 1)
+		result = dm_execute_dmub_cmd_list(ctx, count, cmd, wait_type);
+	else
+		result = dm_execute_dmub_cmd(ctx, cmd, wait_type);
+
+	if (result && reallow_idle)
+		dc_dmub_srv_apply_idle_power_optimizations(ctx->dc, true);
+
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index b63cba6235fc..784ca3e44414 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -106,4 +106,44 @@ bool dc_dmub_srv_is_hw_pwr_up(struct dc_dmub_srv *dc_dmub_srv, bool wait);
 void dc_dmub_srv_apply_idle_power_optimizations(const struct dc *dc, bool allow_idle);
 
 void dc_dmub_srv_set_power_state(struct dc_dmub_srv *dc_dmub_srv, enum dc_acpi_cm_power_state powerState);
+
+/**
+ * dc_wake_and_execute_dmub_cmd() - Wrapper for DMUB command execution.
+ *
+ * Refer to dc_wake_and_execute_dmub_cmd_list() for usage and limitations,
+ * This function is a convenience wrapper for a single command execution.
+ *
+ * @ctx: DC context
+ * @cmd: The command to send/receive
+ * @wait_type: The wait behavior for the execution
+ *
+ * Return: true on command submission success, false otherwise
+ */
+bool dc_wake_and_execute_dmub_cmd(const struct dc_context *ctx, union dmub_rb_cmd *cmd,
+				  enum dm_dmub_wait_type wait_type);
+
+/**
+ * dc_wake_and_execute_dmub_cmd_list() - Wrapper for DMUB command list execution.
+ *
+ * If the DMCUB hardware was asleep then it wakes the DMUB before
+ * executing the command and attempts to re-enter if the command
+ * submission was successful.
+ *
+ * This should be the preferred command submission interface provided
+ * the DC lock is acquired.
+ *
+ * Entry/exit out of idle power optimizations would need to be
+ * manually performed otherwise through dc_allow_idle_optimizations().
+ *
+ * @ctx: DC context
+ * @count: Number of commands to send/receive
+ * @cmd: Array of commands to send
+ * @wait_type: The wait behavior for the execution
+ *
+ * Return: true on command submission success, false otherwise
+ */
+bool dc_wake_and_execute_dmub_cmd_list(const struct dc_context *ctx, unsigned int count,
+				       union dmub_rb_cmd *cmd, enum dm_dmub_wait_type wait_type);
+
+
 #endif /* _DMUB_DC_SRV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index cb6eaddab720..8f9a67825615 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -50,7 +50,7 @@ static inline void submit_dmub_read_modify_write(
 	cmd_buf->header.payload_bytes =
 			sizeof(struct dmub_cmd_read_modify_write_sequence) * offload->reg_seq_count;
 
-	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
+	dc_wake_and_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 
@@ -67,7 +67,7 @@ static inline void submit_dmub_burst_write(
 	cmd_buf->header.payload_bytes =
 			sizeof(uint32_t) * offload->reg_seq_count;
 
-	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
+	dc_wake_and_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 
@@ -80,7 +80,7 @@ static inline void submit_dmub_reg_wait(
 {
 	struct dmub_rb_cmd_reg_wait *cmd_buf = &offload->cmd_data.reg_wait;
 
-	dm_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
+	dc_wake_and_execute_dmub_cmd(ctx, &offload->cmd_data, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 	offload->reg_seq_count = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
index 42c802afc468..4cff36351f40 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
@@ -76,7 +76,7 @@ static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
 	cmd.abm_set_pwm_frac.abm_set_pwm_frac_data.panel_mask = panel_mask;
 	cmd.abm_set_pwm_frac.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pwm_frac_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dmub_abm_init(struct abm *abm, uint32_t backlight)
@@ -155,7 +155,7 @@ bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
 	cmd.abm_set_level.abm_set_level_data.panel_mask = panel_mask;
 	cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_level_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -186,7 +186,7 @@ void dmub_abm_init_config(struct abm *abm,
 
 	cmd.abm_init_config.header.payload_bytes = sizeof(struct dmub_cmd_abm_init_config_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 }
 
@@ -203,7 +203,7 @@ bool dmub_abm_set_pause(struct abm *abm, bool pause, unsigned int panel_inst, un
 	cmd.abm_pause.abm_pause_data.panel_mask = panel_mask;
 	cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_pause_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -246,7 +246,7 @@ bool dmub_abm_save_restore(
 
 	cmd.abm_save_restore.header.payload_bytes = sizeof(struct dmub_rb_cmd_abm_save_restore);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	// Copy iramtable data into local structure
 	memcpy((void *)pData, dc->dmub_srv->dmub->scratch_mem_fb.cpu_addr, bytes);
@@ -274,7 +274,7 @@ bool dmub_abm_set_pipe(struct abm *abm,
 	cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
 	cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -296,7 +296,7 @@ bool dmub_abm_set_backlight_level(struct abm *abm,
 	cmd.abm_set_backlight.abm_set_backlight_data.panel_mask = (0x01 << panel_inst);
 	cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
index 2aa0e01a6891..ba1fec3016d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_hw_lock_mgr.c
@@ -47,7 +47,7 @@ void dmub_hw_lock_mgr_cmd(struct dc_dmub_srv *dmub_srv,
 	if (!lock)
 		cmd.lock_hw.lock_hw_data.should_release = 1;
 
-	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dmub_hw_lock_mgr_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
index d8009b2dc56a..98a778996e1a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_outbox.c
@@ -48,5 +48,5 @@ void dmub_enable_outbox_notification(struct dc_dmub_srv *dmub_srv)
 		sizeof(cmd.outbox1_enable.header);
 	cmd.outbox1_enable.enable = true;
 
-	dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 9d4170a356a2..3d7cef17f881 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -171,7 +171,7 @@ static bool dmub_psr_set_version(struct dmub_psr *dmub, struct dc_stream_state *
 	cmd.psr_set_version.psr_set_version_data.panel_inst = panel_inst;
 	cmd.psr_set_version.header.payload_bytes = sizeof(struct dmub_cmd_psr_set_version_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -199,7 +199,7 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable, bool wait, uint8
 
 	cmd.psr_enable.header.payload_bytes = 0; // Send header only
 
-	dm_execute_dmub_cmd(dc->dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	/* Below loops 1000 x 500us = 500 ms.
 	 *  Exit PSR may need to wait 1-2 frames to power up. Timeout after at
@@ -248,7 +248,7 @@ static void dmub_psr_set_level(struct dmub_psr *dmub, uint16_t psr_level, uint8_
 	cmd.psr_set_level.psr_set_level_data.psr_level = psr_level;
 	cmd.psr_set_level.psr_set_level_data.cmd_version = DMUB_CMD_PSR_CONTROL_VERSION_1;
 	cmd.psr_set_level.psr_set_level_data.panel_inst = panel_inst;
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -267,7 +267,7 @@ static void dmub_psr_set_sink_vtotal_in_psr_active(struct dmub_psr *dmub,
 	cmd.psr_set_vtotal.psr_set_vtotal_data.psr_vtotal_idle = psr_vtotal_idle;
 	cmd.psr_set_vtotal.psr_set_vtotal_data.psr_vtotal_su = psr_vtotal_su;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -286,7 +286,7 @@ static void dmub_psr_set_power_opt(struct dmub_psr *dmub, unsigned int power_opt
 	cmd.psr_set_power_opt.psr_set_power_opt_data.power_opt = power_opt;
 	cmd.psr_set_power_opt.psr_set_power_opt_data.panel_inst = panel_inst;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
@@ -423,7 +423,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 		copy_settings_data->relock_delay_frame_cnt = 2;
 	copy_settings_data->dsc_slice_height = psr_context->dsc_slice_height;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -444,7 +444,7 @@ static void dmub_psr_force_static(struct dmub_psr *dmub, uint8_t panel_inst)
 	cmd.psr_force_static.header.sub_type = DMUB_CMD__PSR_FORCE_STATIC;
 	cmd.psr_enable.header.payload_bytes = 0;
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 /*
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index 68cad55c72ab..e13d69a22c1c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -691,7 +691,7 @@ static void dmcub_PLAT_54186_wa(struct hubp *hubp,
 	cmd.PLAT_54186_wa.flip.flip_params.vmid = flip_regs->vmid;
 
 	PERF_TRACE();  // TODO: remove after performance is stable.
-	dm_execute_dmub_cmd(hubp->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(hubp->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 	PERF_TRACE();  // TODO: remove after performance is stable.
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
index 4596f3bac1b4..26be5fee7411 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dio_link_encoder.c
@@ -125,7 +125,7 @@ static bool query_dp_alt_from_dmub(struct link_encoder *enc,
 	cmd->query_dp_alt.header.payload_bytes = sizeof(cmd->query_dp_alt.data);
 	cmd->query_dp_alt.data.phy_id = phy_id_from_transmitter(enc10->base.transmitter);
 
-	if (!dm_execute_dmub_cmd(enc->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
+	if (!dc_wake_and_execute_dmub_cmd(enc->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		return false;
 
 	return true;
@@ -436,7 +436,7 @@ static bool link_dpia_control(struct dc_context *dc_ctx,
 
 	cmd.dig1_dpia_control.dpia_control = *dpia_control;
 
-	dm_execute_dmub_cmd(dc_ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc_ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
index d849b1eaa4a5..03248422d6ff 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_panel_cntl.c
@@ -52,7 +52,7 @@ static bool dcn31_query_backlight_info(struct panel_cntl *panel_cntl, union dmub
 	cmd->panel_cntl.header.payload_bytes = sizeof(cmd->panel_cntl.data);
 	cmd->panel_cntl.data.pwrseq_inst = dcn31_panel_cntl->base.pwrseq_inst;
 
-	return dm_execute_dmub_cmd(dc_dmub_srv->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
+	return dc_wake_and_execute_dmub_cmd(dc_dmub_srv->ctx, cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY);
 }
 
 static uint32_t dcn31_get_16_bit_backlight_from_pwm(struct panel_cntl *panel_cntl)
@@ -85,7 +85,7 @@ static uint32_t dcn31_panel_cntl_hw_init(struct panel_cntl *panel_cntl)
 		panel_cntl->stored_backlight_registers.LVTMA_PWRSEQ_REF_DIV_BL_PWM_REF_DIV;
 	cmd.panel_cntl.data.bl_pwm_ref_div2 =
 		panel_cntl->stored_backlight_registers.PANEL_PWRSEQ_REF_DIV2;
-	if (!dm_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
+	if (!dc_wake_and_execute_dmub_cmd(dc_dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY))
 		return 0;
 
 	panel_cntl->stored_backlight_registers.BL_PWM_CNTL = cmd.panel_cntl.data.bl_pwm_cntl;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
index 08783ad097d2..8e88dcaf88f5 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c
@@ -154,7 +154,7 @@ static bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst,
 	cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
 	cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
@@ -173,7 +173,7 @@ static void dmub_abm_set_backlight(struct dc_context *dc, uint32_t backlight_pwm
 	cmd.abm_set_backlight.abm_set_backlight_data.panel_mask = (0x01 << panel_inst);
 	cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
 
-	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn21_set_abm_immediate_disable(struct pipe_ctx *pipe_ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index fd8a8c10a201..d337578d7e73 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -754,7 +754,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.mall.header.sub_type = DMUB_CMD__MALL_ACTION_NO_DF_REQ;
 				cmd.mall.header.payload_bytes = sizeof(cmd.mall) - sizeof(cmd.mall.header);
 
-				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+				dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -876,7 +876,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 					cmd.mall.cursor_height = cursor_attr.height;
 					cmd.mall.cursor_pitch = cursor_attr.pitch;
 
-					dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+					dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 					/* Use copied cursor, and it's okay to not switch back */
 					cursor_attr.address.quad_part = cmd.mall.cursor_copy_dst.quad_part;
@@ -892,7 +892,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.mall.tmr_scale = tmr_scale;
 				cmd.mall.debug_bits = dc->debug.mall_error_as_fatal;
 
-				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+				dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -909,7 +909,7 @@ bool dcn30_apply_idle_power_optimizations(struct dc *dc, bool enable)
 	cmd.mall.header.payload_bytes =
 		sizeof(cmd.mall) - sizeof(cmd.mall.header);
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
index 5d62805f3bdf..994250b6f2ef 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c
@@ -416,7 +416,7 @@ void dcn31_z10_save_init(struct dc *dc)
 	cmd.dcn_restore.header.type = DMUB_CMD__IDLE_OPT;
 	cmd.dcn_restore.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_SAVE_INIT;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn31_z10_restore(const struct dc *dc)
@@ -434,7 +434,7 @@ void dcn31_z10_restore(const struct dc *dc)
 	cmd.dcn_restore.header.type = DMUB_CMD__IDLE_OPT;
 	cmd.dcn_restore.header.sub_type = DMUB_CMD__IDLE_OPT_DCN_RESTORE;
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
 void dcn31_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 5c323718ec90..92fe06870e3a 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -277,7 +277,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.cab.header.sub_type = DMUB_CMD__CAB_NO_DCN_REQ;
 				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
 
-				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+				dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -311,7 +311,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
 				cmd.cab.cab_alloc_ways = (uint8_t)ways;
 
-				dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
+				dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_NO_WAIT);
 
 				return true;
 			}
@@ -327,7 +327,7 @@ bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
 	cmd.cab.header.payload_bytes =
 			sizeof(cmd.cab) - sizeof(cmd.cab.header);
 
-	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
+	dc_wake_and_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 
 	return true;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 3c5334cdb3fb..289f5d133342 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1398,7 +1398,7 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 	cmd.cable_id.header.payload_bytes = sizeof(cmd.cable_id.data);
 	cmd.cable_id.data.input.phy_inst = resource_transmitter_to_phy_idx(
 			link->dc, link->link_enc->transmitter);
-	if (dm_execute_dmub_cmd(link->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
+	if (dc_wake_and_execute_dmub_cmd(link->dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
 			cmd.cable_id.header.ret_status == 1) {
 		cable_id->raw = cmd.cable_id.data.output_raw;
 		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
index 0bb749133909..982eda3c46f5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
@@ -90,7 +90,8 @@ bool dpia_query_hpd_status(struct dc_link *link)
 	cmd.query_hpd.data.ch_type = AUX_CHANNEL_DPIA;
 
 	/* Return HPD status reported by DMUB if query successfully executed. */
-	if (dm_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) && cmd.query_hpd.data.status == AUX_RET_SUCCESS)
+	if (dc_wake_and_execute_dmub_cmd(dmub_srv->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT_WITH_REPLY) &&
+	    cmd.query_hpd.data.status == AUX_RET_SUCCESS)
 		is_hpd_high = cmd.query_hpd.data.result;
 
 	DC_LOG_DEBUG("%s: link(%d) dpia(%d) cmd_status(%d) result(%d)\n",
-- 
2.37.3

