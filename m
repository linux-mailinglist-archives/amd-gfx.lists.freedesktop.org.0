Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D51451B4FE6
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2020 00:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCFB6E129;
	Wed, 22 Apr 2020 22:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D0F89FCA
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2020 22:08:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNalz1cYO8epCjinuwjOqWioi8niDG1f0CBezCXYX7q2xtUcqOCBVmN7v4HgB15J77LYZLhanCR8D7SQWUg5cZZjIxEr7VE95/sIxy+yyOOf3vDd3A0LWqNnk4GLLKtLgDiVs8mhfTUzu8EMRSepSCDczFtF6KNBZ5QM1HmAWetD7L8/sT3XNNfz7CqRkCbp+eGx6wsg+G3TZ4R+vq2jLqQ2yr2mQFZrctX9KTsASozdtDhg/jWSU9LBZ5QmPBx/4gtEXdyk+AkDf8ojwTw0zfU1jq8laKc+DbOc8kee0R3iWJWADHG6R4ObepfAjVvommIASlFdgnhX+NnXh3YIUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5oWIKCq7pS7AdSpUp4dY7cTHfRWShA2ZWstDuaeWGA=;
 b=Obn1iPBSNnwmvto6Uv2GzdNRmDBhfTyiZ9lteQKb+vj3vIdzmmp1mQrflx9EdTpVZMvL/phqc14DIuV0VjOC3gh0YNc0V77x3GRFpOoZNbAe/kJULSRJlbCgOrDt4lOuUwN1U1fKUkHYj+aLWoaRDjnZKyzCNzzU0JVe5YnPFgb8AoVJfQtgP+ttf64SVZiZS9wrDSza1wdNTpgVW0iCMtZSQyzto7jiqKbHiXZqEDikQepbNA2S+nQMjYzSBk4yrUVnpZYp4OZ/PgoT/LH0mWvCd8b4yzXWONwPh6zcyPqXWoLOCprntRy9UhCVWKvk37sj/6RCNTTzGmyDVbK2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5oWIKCq7pS7AdSpUp4dY7cTHfRWShA2ZWstDuaeWGA=;
 b=3oZdv1nwPTpDeBGRXx4L8rSH4sJPhnWtO4edDQDw45iw+nIMS6yniyHZvWygFxVmW9o70JVwa0lxr29PKxhYXYFqbXfoIQOyjFqIYjyZYc/rVdpR7RuSQm8TJOWBp8j5jX2EXryfPqurqpj8meQ3Q1M6pssmME17VO9LpyrIBsw=
Received: from CO1PR15CA0114.namprd15.prod.outlook.com (2603:10b6:101:21::34)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Wed, 22 Apr
 2020 22:08:25 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:21:cafe::ba) by CO1PR15CA0114.outlook.office365.com
 (2603:10b6:101:21::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend
 Transport; Wed, 22 Apr 2020 22:08:25 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2937.15 via Frontend Transport; Wed, 22 Apr 2020 22:08:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Apr
 2020 17:08:23 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 22 Apr
 2020 17:08:23 -0500
Received: from aes.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 22 Apr 2020 17:08:22 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/19] drm/amd/display: Pass command instead of header into
 DMUB service
Date: Wed, 22 Apr 2020 18:07:58 -0400
Message-ID: <20200422220805.15759-13-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422220805.15759-1-aurabindo.pillai@amd.com>
References: <20200422220805.15759-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(428003)(46966005)(1076003)(26005)(70206006)(44832011)(70586007)(30864003)(7696005)(4326008)(336012)(81166007)(2616005)(426003)(81156014)(6666004)(86362001)(8936002)(2906002)(186003)(356005)(8676002)(82310400002)(6916009)(54906003)(82740400003)(47076004)(478600001)(36756003)(5660300002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c250182c-e97d-4688-4933-08d7e709ad7c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4330:
X-Microsoft-Antispam-PRVS: <DM6PR12MB433050988994A403964B457B8BD20@DM6PR12MB4330.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-Forefront-PRVS: 03818C953D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFqbOoY1XCiaax0RwgikrSkA5SHqlYQM//SuG0/YlP5VwSCevvTyugkBE08urkrxAVA3SXV+eQTV0wVqwStQntF2xmF7xXoNxRRPnCDIN+/a9SPBN0nf08gfsbmQ/LIXO9I0fKUs7KLq78GDFzUHkr/Qgto1Gwl1TBOHgPqtRhfITz/VDgTiDwvlgxR6sYgdbYdzDExrmOH4NBBk5voy0T0scpG48+37WdzLjKKz0s/qS1zyDE8JLJVr4TG2Xl5PPE8Q2nJPC5novMzuninQ0UutuX5cfuTE7vbfOuY/bN2aDLHtPy53yhTot2sv2xL7FmLuyOz6ZLL+502JlUNFB3rwkYqwIWnc7yVQwlS7u0Mt8Rj2FOYECt1GcMTCi3uLSBkHZwGERw9iV/xlv74PgED7jIZ9nV1/OrWGoOrbcvUXTGCf0wUrmw1KRu5CkTtbrxk1CS/O0p6y3rPmlOOtRWYjrzIPGg18RV5ToPIhusCwz46yaIxRHuiq1Sdr+r/oNHubnlsrs5G14quw22d9Uw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 22:08:24.5930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c250182c-e97d-4688-4933-08d7e709ad7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com, Rodrigo.Siqueira@amd.com,
 Harry.Wentland@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[Why]
We read memory that we shouldn't be touching if the struct isn't
a full union dmub_rb_cmd.

[How]
Fix up all the callers and functions that take in the dmub_cmd_header
to use the dmub_rb_cmd instead.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 .../drm/amd/display/dc/bios/command_table2.c  | 62 +++++++++++++------
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h  |  3 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  6 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 10 +--
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  8 +--
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c | 33 ++++++----
 .../gpu/drm/amd/display/dmub/inc/dmub_rb.h    |  6 +-
 .../gpu/drm/amd/display/dmub/inc/dmub_srv.h   |  3 +-
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  2 +-
 10 files changed, 80 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
index 8edc2506d49e..bed91572f82a 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table2.c
@@ -113,13 +113,19 @@ static void encoder_control_dmcub(
 		struct dc_dmub_srv *dmcub,
 		struct dig_encoder_stream_setup_parameters_v1_5 *dig)
 {
-	struct dmub_rb_cmd_digx_encoder_control encoder_control = { 0 };
+	union dmub_rb_cmd cmd;
 
-	encoder_control.header.type = DMUB_CMD__VBIOS;
-	encoder_control.header.sub_type = DMUB_CMD__VBIOS_DIGX_ENCODER_CONTROL;
-	encoder_control.encoder_control.dig.stream_param = *dig;
+	memset(&cmd, 0, sizeof(cmd));
 
-	dc_dmub_srv_cmd_queue(dmcub, &encoder_control.header);
+	cmd.digx_encoder_control.header.type = DMUB_CMD__VBIOS;
+	cmd.digx_encoder_control.header.sub_type =
+		DMUB_CMD__VBIOS_DIGX_ENCODER_CONTROL;
+	cmd.digx_encoder_control.header.payload_bytes =
+		sizeof(cmd.digx_encoder_control) -
+		sizeof(cmd.digx_encoder_control.header);
+	cmd.digx_encoder_control.encoder_control.dig.stream_param = *dig;
+
+	dc_dmub_srv_cmd_queue(dmcub, &cmd);
 	dc_dmub_srv_cmd_execute(dmcub);
 	dc_dmub_srv_wait_idle(dmcub);
 }
@@ -238,14 +244,19 @@ static void transmitter_control_dmcub(
 		struct dc_dmub_srv *dmcub,
 		struct dig_transmitter_control_parameters_v1_6 *dig)
 {
-	struct dmub_rb_cmd_dig1_transmitter_control transmitter_control;
+	union dmub_rb_cmd cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
 
-	transmitter_control.header.type = DMUB_CMD__VBIOS;
-	transmitter_control.header.sub_type =
+	cmd.dig1_transmitter_control.header.type = DMUB_CMD__VBIOS;
+	cmd.dig1_transmitter_control.header.sub_type =
 		DMUB_CMD__VBIOS_DIG1_TRANSMITTER_CONTROL;
-	transmitter_control.transmitter_control.dig = *dig;
+	cmd.dig1_transmitter_control.header.payload_bytes =
+		sizeof(cmd.dig1_transmitter_control) -
+		sizeof(cmd.dig1_transmitter_control.header);
+	cmd.dig1_transmitter_control.transmitter_control.dig = *dig;
 
-	dc_dmub_srv_cmd_queue(dmcub, &transmitter_control.header);
+	dc_dmub_srv_cmd_queue(dmcub, &cmd);
 	dc_dmub_srv_cmd_execute(dmcub);
 	dc_dmub_srv_wait_idle(dmcub);
 }
@@ -339,13 +350,18 @@ static void set_pixel_clock_dmcub(
 		struct dc_dmub_srv *dmcub,
 		struct set_pixel_clock_parameter_v1_7 *clk)
 {
-	struct dmub_rb_cmd_set_pixel_clock pixel_clock = { 0 };
+	union dmub_rb_cmd cmd;
 
-	pixel_clock.header.type = DMUB_CMD__VBIOS;
-	pixel_clock.header.sub_type = DMUB_CMD__VBIOS_SET_PIXEL_CLOCK;
-	pixel_clock.pixel_clock.clk = *clk;
+	memset(&cmd, 0, sizeof(cmd));
 
-	dc_dmub_srv_cmd_queue(dmcub, &pixel_clock.header);
+	cmd.set_pixel_clock.header.type = DMUB_CMD__VBIOS;
+	cmd.set_pixel_clock.header.sub_type = DMUB_CMD__VBIOS_SET_PIXEL_CLOCK;
+	cmd.set_pixel_clock.header.payload_bytes =
+		sizeof(cmd.set_pixel_clock) -
+		sizeof(cmd.set_pixel_clock.header);
+	cmd.set_pixel_clock.pixel_clock.clk = *clk;
+
+	dc_dmub_srv_cmd_queue(dmcub, &cmd);
 	dc_dmub_srv_cmd_execute(dmcub);
 	dc_dmub_srv_wait_idle(dmcub);
 }
@@ -705,13 +721,19 @@ static void enable_disp_power_gating_dmcub(
 	struct dc_dmub_srv *dmcub,
 	struct enable_disp_power_gating_parameters_v2_1 *pwr)
 {
-	struct dmub_rb_cmd_enable_disp_power_gating power_gating;
+	union dmub_rb_cmd cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
 
-	power_gating.header.type = DMUB_CMD__VBIOS;
-	power_gating.header.sub_type = DMUB_CMD__VBIOS_ENABLE_DISP_POWER_GATING;
-	power_gating.power_gating.pwr = *pwr;
+	cmd.enable_disp_power_gating.header.type = DMUB_CMD__VBIOS;
+	cmd.enable_disp_power_gating.header.sub_type =
+		DMUB_CMD__VBIOS_ENABLE_DISP_POWER_GATING;
+	cmd.enable_disp_power_gating.header.payload_bytes =
+		sizeof(cmd.enable_disp_power_gating) -
+		sizeof(cmd.enable_disp_power_gating.header);
+	cmd.enable_disp_power_gating.power_gating.pwr = *pwr;
 
-	dc_dmub_srv_cmd_queue(dmcub, &power_gating.header);
+	dc_dmub_srv_cmd_queue(dmcub, &cmd);
 	dc_dmub_srv_cmd_execute(dmcub);
 	dc_dmub_srv_wait_idle(dmcub);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 59c298a6484f..907e0c5374bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -58,7 +58,7 @@ void dc_dmub_srv_destroy(struct dc_dmub_srv **dmub_srv)
 }
 
 void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
-			   struct dmub_cmd_header *cmd)
+			   union dmub_rb_cmd *cmd)
 {
 	struct dmub_srv *dmub = dc_dmub_srv->dmub;
 	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
index 855431483699..6689ae33dee8 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.h
@@ -30,7 +30,6 @@
 #include "dmub/inc/dmub_cmd.h"
 
 struct dmub_srv;
-struct dmub_cmd_header;
 
 struct dc_reg_helper_state {
 	bool gather_in_progress;
@@ -49,7 +48,7 @@ struct dc_dmub_srv {
 };
 
 void dc_dmub_srv_cmd_queue(struct dc_dmub_srv *dc_dmub_srv,
-			   struct dmub_cmd_header *cmd);
+			   union dmub_rb_cmd *cmd);
 
 void dc_dmub_srv_cmd_execute(struct dc_dmub_srv *dc_dmub_srv);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index 737048d8a96c..85a0170be544 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -50,7 +50,7 @@ static inline void submit_dmub_read_modify_write(
 	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
 	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
 
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd_buf->header);
+	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
 
 	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
 
@@ -73,7 +73,7 @@ static inline void submit_dmub_burst_write(
 	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
 	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
 
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd_buf->header);
+	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
 
 	ctx->dmub_srv->reg_helper_offload.gather_in_progress = gather;
 
@@ -92,7 +92,7 @@ static inline void submit_dmub_reg_wait(
 	gather = ctx->dmub_srv->reg_helper_offload.gather_in_progress;
 	ctx->dmub_srv->reg_helper_offload.gather_in_progress = false;
 
-	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &cmd_buf->header);
+	dc_dmub_srv_cmd_queue(ctx->dmub_srv, &offload->cmd_data);
 
 	memset(cmd_buf, 0, sizeof(*cmd_buf));
 	offload->reg_seq_count = 0;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
index 992d869188c5..09e19e3332e2 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -62,7 +62,7 @@ static bool dmub_abm_set_pipe(struct abm *abm, uint32_t otg_inst)
 	cmd.abm_set_pipe.abm_set_pipe_data.ramping_boundary = ramping_boundary;
 	cmd.abm_set_pipe.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pipe_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.abm_set_pipe.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
@@ -146,7 +146,7 @@ static void dmcub_set_backlight_level(
 	cmd.abm_set_backlight.abm_set_backlight_data.frame_ramp = frame_ramp;
 	cmd.abm_set_backlight.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_backlight_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.abm_set_backlight.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
@@ -171,7 +171,7 @@ static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
 	cmd.abm_set_pwm_frac.abm_set_pwm_frac_data.fractional_pwm = fractional_pwm;
 	cmd.abm_set_pwm_frac.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_pwm_frac_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.abm_set_pwm_frac.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 }
@@ -250,7 +250,7 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 	cmd.abm_set_level.abm_set_level_data.level = level;
 	cmd.abm_set_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_level_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.abm_set_level.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
@@ -370,7 +370,7 @@ static bool dmub_abm_init_config(struct abm *abm,
 	cmd.abm_init_config.abm_init_config_data.bytes = bytes;
 	cmd.abm_init_config.header.payload_bytes = sizeof(struct dmub_cmd_abm_init_config_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.abm_init_config.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 7b32e5d60ed6..9f12c76f21ab 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -102,7 +102,7 @@ static bool dmub_psr_set_version(struct dmub_psr *dmub, struct dc_stream_state *
 	cmd.psr_set_version.psr_set_version_data.version = stream->link->psr_settings.psr_version;
 	cmd.psr_set_version.header.payload_bytes = sizeof(struct dmub_cmd_psr_set_version_data);
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.psr_set_version.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
@@ -126,7 +126,7 @@ static void dmub_psr_enable(struct dmub_psr *dmub, bool enable)
 
 	cmd.psr_enable.header.payload_bytes = 0; // Send header only
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.psr_enable.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 }
@@ -150,7 +150,7 @@ static void dmub_psr_set_level(struct dmub_psr *dmub, uint16_t psr_level)
 	cmd.psr_set_level.header.payload_bytes = sizeof(struct dmub_cmd_psr_set_level_data);
 	cmd.psr_set_level.psr_set_level_data.psr_level = psr_level;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.psr_set_level.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 }
@@ -227,7 +227,7 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	copy_settings_data->debug.visual_confirm		= dc->dc->debug.visual_confirm == VISUAL_CONFIRM_PSR ?
 									true : false;
 
-	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd.psr_copy_settings.header);
+	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
 	dc_dmub_srv_wait_idle(dc->dmub_srv);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index d285ba622d61..960a0716dde5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -778,21 +778,28 @@ void dmcub_PLAT_54186_wa(struct hubp *hubp, struct surface_flip_registers *flip_
 {
 	struct dc_dmub_srv *dmcub = hubp->ctx->dmub_srv;
 	struct dcn21_hubp *hubp21 = TO_DCN21_HUBP(hubp);
-	struct dmub_rb_cmd_PLAT_54186_wa PLAT_54186_wa = { 0 };
-
-	PLAT_54186_wa.header.type = DMUB_CMD__PLAT_54186_WA;
-	PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS = flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS;
-	PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_C = flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_C;
-	PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH = flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH;
-	PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C = flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C;
-	PLAT_54186_wa.flip.flip_params.grph_stereo = flip_regs->grph_stereo;
-	PLAT_54186_wa.flip.flip_params.hubp_inst = hubp->inst;
-	PLAT_54186_wa.flip.flip_params.immediate = flip_regs->immediate;
-	PLAT_54186_wa.flip.flip_params.tmz_surface = flip_regs->tmz_surface;
-	PLAT_54186_wa.flip.flip_params.vmid = flip_regs->vmid;
+	union dmub_rb_cmd cmd;
+
+	memset(&cmd, 0, sizeof(cmd));
+
+	cmd.PLAT_54186_wa.header.type = DMUB_CMD__PLAT_54186_WA;
+	cmd.PLAT_54186_wa.header.payload_bytes = sizeof(cmd.PLAT_54186_wa.flip);
+	cmd.PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS =
+		flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS;
+	cmd.PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_C =
+		flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_C;
+	cmd.PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH =
+		flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH;
+	cmd.PLAT_54186_wa.flip.DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C =
+		flip_regs->DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C;
+	cmd.PLAT_54186_wa.flip.flip_params.grph_stereo = flip_regs->grph_stereo;
+	cmd.PLAT_54186_wa.flip.flip_params.hubp_inst = hubp->inst;
+	cmd.PLAT_54186_wa.flip.flip_params.immediate = flip_regs->immediate;
+	cmd.PLAT_54186_wa.flip.flip_params.tmz_surface = flip_regs->tmz_surface;
+	cmd.PLAT_54186_wa.flip.flip_params.vmid = flip_regs->vmid;
 
 	PERF_TRACE();  // TODO: remove after performance is stable.
-	dc_dmub_srv_cmd_queue(dmcub, &PLAT_54186_wa.header);
+	dc_dmub_srv_cmd_queue(dmcub, &cmd);
 	PERF_TRACE();  // TODO: remove after performance is stable.
 	dc_dmub_srv_cmd_execute(dmcub);
 	PERF_TRACE();  // TODO: remove after performance is stable.
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h
index df875fdd2ab0..2ae48c18bb5b 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_rb.h
@@ -33,8 +33,6 @@
 extern "C" {
 #endif
 
-struct dmub_cmd_header;
-
 struct dmub_rb_init_params {
 	void *ctx;
 	void *base_address;
@@ -71,7 +69,7 @@ static inline bool dmub_rb_full(struct dmub_rb *rb)
 }
 
 static inline bool dmub_rb_push_front(struct dmub_rb *rb,
-				      const struct dmub_cmd_header *cmd)
+				      const union dmub_rb_cmd *cmd)
 {
 	uint64_t volatile *dst = (uint64_t volatile *)(rb->base_address) + rb->wrpt / sizeof(uint64_t);
 	const uint64_t *src = (const uint64_t *)cmd;
@@ -93,7 +91,7 @@ static inline bool dmub_rb_push_front(struct dmub_rb *rb,
 }
 
 static inline bool dmub_rb_front(struct dmub_rb *rb,
-				 struct dmub_cmd_header *cmd)
+				 union dmub_rb_cmd  *cmd)
 {
 	uint8_t *rd_ptr = (uint8_t *)rb->base_address + rb->rptr;
 
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
index e40d1cdbcfaa..9f10bfe3d2df 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_srv.h
@@ -75,7 +75,6 @@ extern "C" {
 
 /* Forward declarations */
 struct dmub_srv;
-struct dmub_cmd_header;
 struct dmub_srv_common_regs;
 
 /* enum dmub_status - return code for dmcub functions */
@@ -458,7 +457,7 @@ enum dmub_status dmub_srv_hw_reset(struct dmub_srv *dmub);
  *   DMUB_STATUS_INVALID - unspecified error
  */
 enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
-				    const struct dmub_cmd_header *cmd);
+				    const union dmub_rb_cmd *cmd);
 
 /**
  * dmub_srv_cmd_execute() - Executes a queued sequence to the dmub
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index a6e403227872..66ba0b2d80d2 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -462,7 +462,7 @@ enum dmub_status dmub_srv_hw_reset(struct dmub_srv *dmub)
 }
 
 enum dmub_status dmub_srv_cmd_queue(struct dmub_srv *dmub,
-				    const struct dmub_cmd_header *cmd)
+				    const union dmub_rb_cmd *cmd)
 {
 	if (!dmub->hw_init)
 		return DMUB_STATUS_INVALID;
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
