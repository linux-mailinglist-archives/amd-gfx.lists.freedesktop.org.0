Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 691721AD369
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2020 01:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6916E34B;
	Thu, 16 Apr 2020 23:41:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA146E34B
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2020 23:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+YUQaZ33rjvjGQJX3S+OjZ2OgLvjA34TZ3xtakQCqXBVhb8RQWgAAICR8jPL7OKVKRe9q9hI/XhRkXNimQCFB/3QtF/ppgJOeb9AkUaaXs4akNwL0uEfbEZ2Y4JOq44J7zXWa6iYzWkgButqqIq3Y7NsGwLoVwNAyiz6tjueOGrXummabk8XC6RRRgA1SljNcamXHRsYg1DcClBmWrWaM4ONQHCVbvMZOWlXU1vBCihCFDBSgHMB7UVnl6RB5hhbu71z61IUrhp6RIZwZCPAoX7vTdIMjmaRwJbVCzbWSmMXFlnMeUIWjVRpr7uC4NvLip2U3E7wVB7CsmZEOpu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STHlB0pXkWm4wEgXV7zYrurtMXBzoOjo0Uu7IDm9Two=;
 b=Vu5N1dX0ExQ7FLiCVnyd8Dhs1ZqE7jImlaCUUvlICpZG7f/8s628ftYigjCq7CTtYHg89SJp00J7yhrqe8SztW4svVKXUcKVfUNB741xnD2cBLpvrZl4HJF6VJnNxKxnvGgIc//ijC7GeC+4TU7ONM/QedOdHNa15mZlseqztJzxfN+c81ip6tWJ89Zynhyhe6Y4v78JgaqzNXtOcP+rNrWyClRw69Tar8i/jnHeDovJGwFZeFZ9lcJyHvtcydNluabaG25w7Z1js1RTkwcH5sVtl7U/pwN/X2UfhEIynuRJUGZ+UpSSeCmpeTgCwqpR4/WCh8PToZ9fIc1M94JIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STHlB0pXkWm4wEgXV7zYrurtMXBzoOjo0Uu7IDm9Two=;
 b=e88yHZQb/9S2fT7IDmzMda1LrnbaIO8wFzFgxi/ecPcuziKQJy9rDwBmuNWipqd55qDbUnmyJ6gekrG+bn/0IK2F24MOHJQJr2Rwi7caBKzC6/c0Uu3t28WlV76ff/chjoowVSyrl2GOvR79vZvH6kgbu4Hl2LosmA1wQEl0CCE=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2459.namprd12.prod.outlook.com (2603:10b6:907:c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 16 Apr
 2020 23:41:43 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 23:41:43 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 24/35] drm/amd/display: move panel power seq to new panel
 struct
Date: Thu, 16 Apr 2020 19:40:33 -0400
Message-Id: <20200416234044.2082886-25-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416234044.2082886-1-Rodrigo.Siqueira@amd.com>
References: <20200416234044.2082886-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: BN8PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:408:60::25) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Thu, 16 Apr 2020 23:41:42 +0000
X-Mailer: git-send-email 2.26.0
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 20c96280-746e-4510-21fe-08d7e25fb7c9
X-MS-TrafficTypeDiagnostic: MW2PR12MB2459:|MW2PR12MB2459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2459C20F02B274BF2140B77998D80@MW2PR12MB2459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2524.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(316002)(2906002)(54906003)(36756003)(6916009)(6486002)(1076003)(478600001)(6666004)(86362001)(81156014)(8676002)(8936002)(30864003)(6512007)(66476007)(66556008)(66946007)(2616005)(5660300002)(16526019)(186003)(6506007)(4326008)(52116002)(579004);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8K+ClF4NZ2f7hsHOTkwkVcx0E5NUM07sQKpDO8NG1yFMrkuzb2ZVpLUr1SfnRgDWxpA1B6c4eoVGTll68Va9Wnv6Z/ofZbODwzh2LoM8fIXbfTZ3uhLASsPF9hEclGET47TnJFsRp//QCM+mnR/L6OEgoXzYX7Y+jV8du9aElrv/tCop04Ur/bsoCAmTx9GIBaeNQJcEKuczaVf1+BW3QxB11rRmNxzKio8+ZbzormezRYRlvIrz+jqa0E7dE6tPiOmWDTtMJhES9XkcxvLxB2CBaPp6sJRgBig1Xuz4fPcNl2wmnlJtF1Pd98l93G+tMcKM4eenOXpd+6jIbrjiJAEJKnLM1B5H0g+xMfAnx/Zk7uAQpfHc2p7ov3tZqflulwaZN3Tud6mYHukWfhaFfcEyUKzmQVewl3SlHbn/ObWZ6itwkSmdidGkpPO+sA2f
X-MS-Exchange-AntiSpam-MessageData: x9+hiJKTbKpRdkE3YV++hyuup4RfDHuJFEGsVkoo4VcG6pJ2ANdm5ooUJfhwlQZvGPAIwQhshCI1VGXL/x7PGOeCrFJlW7OxTEyQqlBXd5Q1u3wr6gDOhqohs8/PTWWTAuffbL9ZbCZwAbEqzL3TxoteyWb3+wtjRV7Uv+OTj64=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c96280-746e-4510-21fe-08d7e25fb7c9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 23:41:43.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8U7r1jo6MF8DrpdXMCMUZnVBjsdjzlmhwG8kdRxNF2fz0nTUc5aSnnRKGR3o3KJbzoBbxUzEwhiER3GQ+WLnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2459
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
Cc: Sunpeng.Li@amd.com, Tony Cheng <Tony.Cheng@amd.com>,
 Rodrigo.Siqueira@amd.com, Harry.Wentland@amd.com, Bhawanpreet.Lakha@amd.com,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Anthony Koo <Anthony.Koo@amd.com>

[Why]
panel power sequencer is currently just sitting in hwseq but it really
it tied to internal panels

[How]
make a new panel struct to contain power sequencer code

Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c |  22 ++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   1 +
 drivers/gpu/drm/amd/display/dc/dce/Makefile   |   2 +-
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |  65 +++-------
 .../gpu/drm/amd/display/dc/dce/dce_panel.c    | 105 ++++++++++++++++
 .../gpu/drm/amd/display/dc/dce/dce_panel.h    | 117 ++++++++++++++++++
 .../amd/display/dc/dce100/dce100_resource.c   |  31 +++++
 .../display/dc/dce110/dce110_hw_sequencer.c   |  37 +-----
 .../display/dc/dce110/dce110_hw_sequencer.h   |   4 -
 .../amd/display/dc/dce110/dce110_resource.c   |  31 +++++
 .../amd/display/dc/dce112/dce112_resource.c   |  31 +++++
 .../amd/display/dc/dce120/dce120_resource.c   |  31 +++++
 .../drm/amd/display/dc/dce80/dce80_resource.c |  31 +++++
 .../gpu/drm/amd/display/dc/dcn10/dcn10_init.c |   2 -
 .../drm/amd/display/dc/dcn10/dcn10_resource.c |  31 +++++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_init.c |   2 -
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  31 +++++
 .../gpu/drm/amd/display/dc/dcn21/dcn21_init.c |   2 -
 .../drm/amd/display/dc/dcn21/dcn21_resource.c |  32 +++++
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/panel.h |  53 ++++++++
 .../amd/display/dc/inc/hw_sequencer_private.h |   2 -
 22 files changed, 572 insertions(+), 94 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dce_panel.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dce/dce_panel.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/inc/hw/panel.h

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a784fd2078a8..2e5a97190ce3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -47,6 +47,7 @@
 #include "hw/clk_mgr.h"
 #include "dce/dmub_psr.h"
 #include "dmub/inc/dmub_cmd_dal.h"
+#include "inc/hw/panel.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -1355,6 +1356,7 @@ static bool dc_link_construct(struct dc_link *link,
 	struct ddc_service_init_data ddc_service_init_data = { { 0 } };
 	struct dc_context *dc_ctx = init_params->ctx;
 	struct encoder_init_data enc_init_data = { 0 };
+	struct panel_init_data panel_init_data = { 0 };
 	struct integrated_info info = {{{ 0 }}};
 	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
 	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
@@ -1425,6 +1427,7 @@ static bool dc_link_construct(struct dc_link *link,
 			link->irq_source_hpd_rx =
 					dal_irq_get_rx_source(link->hpd_gpio);
 		}
+
 		break;
 	case CONNECTOR_ID_LVDS:
 		link->connector_signal = SIGNAL_TYPE_LVDS;
@@ -1454,6 +1457,22 @@ static bool dc_link_construct(struct dc_link *link,
 	link->ddc_hw_inst =
 		dal_ddc_get_line(dal_ddc_service_get_ddc_pin(link->ddc));
 
+
+	if (link->dc->res_pool->funcs->panel_create &&
+		(link->link_id.id == CONNECTOR_ID_EDP ||
+			link->link_id.id == CONNECTOR_ID_LVDS)) {
+		panel_init_data.ctx = dc_ctx;
+		panel_init_data.inst = 0;
+		link->panel =
+			link->dc->res_pool->funcs->panel_create(
+								&panel_init_data);
+
+		if (link->panel == NULL) {
+			DC_ERROR("Failed to create link panel!\n");
+			goto panel_create_fail;
+		}
+	}
+
 	enc_init_data.ctx = dc_ctx;
 	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
 			      &enc_init_data.encoder);
@@ -1536,6 +1555,9 @@ static bool dc_link_construct(struct dc_link *link,
 device_tag_fail:
 	link->link_enc->funcs->destroy(&link->link_enc);
 link_enc_create_fail:
+	if (link->panel != NULL)
+		link->panel->funcs->destroy(&link->panel);
+panel_create_fail:
 	dal_ddc_service_destroy(&link->ddc);
 ddc_create_fail:
 create_fail:
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 72b22dd50f0d..31c9706f1b0b 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -135,6 +135,7 @@ struct dc_link {
 
 	struct dc_context *ctx;
 
+	struct panel *panel;
 	struct link_encoder *link_enc;
 	struct graphics_object_id link_id;
 	union ddi_channel_mapping ddi_channel_mapping;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/Makefile b/drivers/gpu/drm/amd/display/dc/dce/Makefile
index b31a1b71dab0..144ade2e1007 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dce/Makefile
@@ -29,7 +29,7 @@
 DCE = dce_audio.o dce_stream_encoder.o dce_link_encoder.o dce_hwseq.o \
 dce_mem_input.o dce_clock_source.o dce_scl_filters.o dce_transform.o \
 dce_opp.o dce_dmcu.o dce_abm.o dce_ipp.o dce_aux.o \
-dce_i2c.o dce_i2c_hw.o dce_i2c_sw.o dmub_psr.o dmub_abm.o
+dce_i2c.o dce_i2c_hw.o dce_i2c_sw.o dmub_psr.o dmub_abm.o dce_panel.o
 
 AMD_DAL_DCE = $(addprefix $(AMDDALPATH)/dc/dce/,$(DCE))
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index c5aa1f48593a..5479d959ec62 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -27,10 +27,6 @@
 
 #include "dc_types.h"
 
-#define BL_REG_LIST()\
-	SR(LVTMA_PWRSEQ_CNTL), \
-	SR(LVTMA_PWRSEQ_STATE)
-
 #define HWSEQ_DCEF_REG_LIST_DCE8() \
 	.DCFE_CLOCK_CONTROL[0] = mmCRTC0_CRTC_DCFE_CLOCK_CONTROL, \
 	.DCFE_CLOCK_CONTROL[1] = mmCRTC1_CRTC_DCFE_CLOCK_CONTROL, \
@@ -94,20 +90,17 @@
 	SRII(BLND_CONTROL, BLND, 0),\
 	SRII(BLND_CONTROL, BLND, 1),\
 	SR(BLNDV_CONTROL),\
-	HWSEQ_PIXEL_RATE_REG_LIST(CRTC),\
-	BL_REG_LIST()
+	HWSEQ_PIXEL_RATE_REG_LIST(CRTC)
 
 #define HWSEQ_DCE8_REG_LIST() \
 	HWSEQ_DCEF_REG_LIST_DCE8(), \
 	HWSEQ_BLND_REG_LIST(), \
-	HWSEQ_PIXEL_RATE_REG_LIST(CRTC),\
-	BL_REG_LIST()
+	HWSEQ_PIXEL_RATE_REG_LIST(CRTC)
 
 #define HWSEQ_DCE10_REG_LIST() \
 	HWSEQ_DCEF_REG_LIST(), \
 	HWSEQ_BLND_REG_LIST(), \
-	HWSEQ_PIXEL_RATE_REG_LIST(CRTC), \
-	BL_REG_LIST()
+	HWSEQ_PIXEL_RATE_REG_LIST(CRTC)
 
 #define HWSEQ_ST_REG_LIST() \
 	HWSEQ_DCE11_REG_LIST_BASE(), \
@@ -134,8 +127,7 @@
 	SR(DCHUB_FB_LOCATION),\
 	SR(DCHUB_AGP_BASE),\
 	SR(DCHUB_AGP_BOT),\
-	SR(DCHUB_AGP_TOP), \
-	BL_REG_LIST()
+	SR(DCHUB_AGP_TOP)
 
 #define HWSEQ_VG20_REG_LIST() \
 	HWSEQ_DCE120_REG_LIST(),\
@@ -144,8 +136,7 @@
 #define HWSEQ_DCE112_REG_LIST() \
 	HWSEQ_DCE10_REG_LIST(), \
 	HWSEQ_PIXEL_RATE_REG_LIST(CRTC), \
-	HWSEQ_PHYPLL_REG_LIST(CRTC), \
-	BL_REG_LIST()
+	HWSEQ_PHYPLL_REG_LIST(CRTC)
 
 #define HWSEQ_DCN_REG_LIST()\
 	SR(REFCLK_CNTL), \
@@ -207,8 +198,7 @@
 	SR(D3VGA_CONTROL), \
 	SR(D4VGA_CONTROL), \
 	SR(VGA_TEST_CONTROL), \
-	SR(DC_IP_REQUEST_CNTL), \
-	BL_REG_LIST()
+	SR(DC_IP_REQUEST_CNTL)
 
 #define HWSEQ_DCN2_REG_LIST()\
 	HWSEQ_DCN_REG_LIST(), \
@@ -273,8 +263,7 @@
 	SR(D4VGA_CONTROL), \
 	SR(D5VGA_CONTROL), \
 	SR(D6VGA_CONTROL), \
-	SR(DC_IP_REQUEST_CNTL), \
-	BL_REG_LIST()
+	SR(DC_IP_REQUEST_CNTL)
 
 #define HWSEQ_DCN21_REG_LIST()\
 	HWSEQ_DCN_REG_LIST(), \
@@ -324,15 +313,9 @@
 	SR(D4VGA_CONTROL), \
 	SR(D5VGA_CONTROL), \
 	SR(D6VGA_CONTROL), \
-	SR(DC_IP_REQUEST_CNTL), \
-	BL_REG_LIST()
+	SR(DC_IP_REQUEST_CNTL)
 
 struct dce_hwseq_registers {
-
-		/* Backlight registers */
-	uint32_t LVTMA_PWRSEQ_CNTL;
-	uint32_t LVTMA_PWRSEQ_STATE;
-
 	uint32_t DCFE_CLOCK_CONTROL[6];
 	uint32_t DCFEV_CLOCK_CONTROL;
 	uint32_t DC_MEM_GLOBAL_PWR_REQ_CNTL;
@@ -465,26 +448,18 @@ struct dce_hwseq_registers {
 	HWS_SF1(blk, PHYPLL_PIXEL_RATE_CNTL, PHYPLL_PIXEL_RATE_SOURCE, mask_sh),\
 	HWS_SF1(blk, PHYPLL_PIXEL_RATE_CNTL, PIXEL_RATE_PLL_SOURCE, mask_sh)
 
-#define HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)\
-	HWS_SF(, LVTMA_PWRSEQ_CNTL, LVTMA_BLON, mask_sh),\
-	HWS_SF(, LVTMA_PWRSEQ_CNTL, LVTMA_DIGON, mask_sh),\
-	HWS_SF(, LVTMA_PWRSEQ_CNTL, LVTMA_DIGON_OVRD, mask_sh),\
-	HWS_SF(, LVTMA_PWRSEQ_STATE, LVTMA_PWRSEQ_TARGET_STATE_R, mask_sh)
-
 #define HWSEQ_DCE8_MASK_SH_LIST(mask_sh)\
 	.DCFE_CLOCK_ENABLE = CRTC_DCFE_CLOCK_CONTROL__CRTC_DCFE_CLOCK_ENABLE ## mask_sh, \
 	HWS_SF(BLND_, V_UPDATE_LOCK, BLND_DCP_GRPH_V_UPDATE_LOCK, mask_sh),\
 	HWS_SF(BLND_, V_UPDATE_LOCK, BLND_SCL_V_UPDATE_LOCK, mask_sh),\
 	HWS_SF(BLND_, V_UPDATE_LOCK, BLND_DCP_GRPH_SURF_V_UPDATE_LOCK, mask_sh),\
 	HWS_SF(BLND_, CONTROL, BLND_MODE, mask_sh),\
-	HWSEQ_PIXEL_RATE_MASK_SH_LIST(mask_sh, CRTC0_),\
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)
+	HWSEQ_PIXEL_RATE_MASK_SH_LIST(mask_sh, CRTC0_)
 
 #define HWSEQ_DCE10_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCEF_MASK_SH_LIST(mask_sh, DCFE_),\
 	HWSEQ_BLND_MASK_SH_LIST(mask_sh, BLND_),\
-	HWSEQ_PIXEL_RATE_MASK_SH_LIST(mask_sh, CRTC0_),\
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)
+	HWSEQ_PIXEL_RATE_MASK_SH_LIST(mask_sh, CRTC0_)
 
 #define HWSEQ_DCE11_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCE10_MASK_SH_LIST(mask_sh),\
@@ -507,8 +482,7 @@ struct dce_hwseq_registers {
 	HWSEQ_BLND_MASK_SH_LIST(mask_sh, BLND0_BLND_),\
 	HWSEQ_PIXEL_RATE_MASK_SH_LIST(mask_sh, CRTC0_),\
 	HWSEQ_PHYPLL_MASK_SH_LIST(mask_sh, CRTC0_),\
-	HWSEQ_GFX9_DCHUB_MASK_SH_LIST(mask_sh),\
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)
+	HWSEQ_GFX9_DCHUB_MASK_SH_LIST(mask_sh)
 
 #define HWSEQ_VG20_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCE12_MASK_SH_LIST(mask_sh),\
@@ -570,8 +544,7 @@ struct dce_hwseq_registers {
 	HWS_SF(, D3VGA_CONTROL, D3VGA_MODE_ENABLE, mask_sh),\
 	HWS_SF(, D4VGA_CONTROL, D4VGA_MODE_ENABLE, mask_sh),\
 	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_ENABLE, mask_sh),\
-	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_RENDER_START, mask_sh),\
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)
+	HWS_SF(, VGA_TEST_CONTROL, VGA_TEST_RENDER_START, mask_sh)
 
 #define HWSEQ_DCN2_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
@@ -630,8 +603,7 @@ struct dce_hwseq_registers {
 	HWS_SF(, DOMAIN19_PG_STATUS, DOMAIN19_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DOMAIN20_PG_STATUS, DOMAIN20_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DOMAIN21_PG_STATUS, DOMAIN21_PGFSM_PWR_STATUS, mask_sh), \
-	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh)
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh)
 
 #define HWSEQ_DCN21_MASK_SH_LIST(mask_sh)\
 	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
@@ -671,10 +643,7 @@ struct dce_hwseq_registers {
 	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN16_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN17_PGFSM_PWR_STATUS, mask_sh), \
 	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN18_PGFSM_PWR_STATUS, mask_sh), \
-	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
-	HWSEQ_LVTMA_MASK_SH_LIST(mask_sh), \
-	HWS_SF(, LVTMA_PWRSEQ_CNTL, LVTMA_BLON, mask_sh), \
-	HWS_SF(, LVTMA_PWRSEQ_STATE, LVTMA_PWRSEQ_TARGET_STATE_R, mask_sh)
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh)
 
 #define HWSEQ_REG_FIELD_LIST(type) \
 	type DCFE_CLOCK_ENABLE; \
@@ -706,11 +675,7 @@ struct dce_hwseq_registers {
 	type PF_LFB_REGION;\
 	type PF_MAX_REGION;\
 	type ENABLE_L1_TLB;\
-	type SYSTEM_ACCESS_MODE;\
-	type LVTMA_BLON;\
-	type LVTMA_DIGON;\
-	type LVTMA_DIGON_OVRD;\
-	type LVTMA_PWRSEQ_TARGET_STATE_R;
+	type SYSTEM_ACCESS_MODE;
 
 #define HWSEQ_DCN_REG_FIELD_LIST(type) \
 	type HUBP_VTG_SEL; \
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel.c b/drivers/gpu/drm/amd/display/dc/dce/dce_panel.c
new file mode 100644
index 000000000000..6f9849995456
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dc_dmub_srv.h"
+#include "panel.h"
+#include "dce_panel.h"
+
+#define TO_DCE_PANEL(panel)\
+	container_of(panel, struct dce_panel, base)
+
+#define CTX \
+	dce_panel->base.ctx
+
+#define DC_LOGGER \
+	dce_panel->base.ctx->logger
+
+#define REG(reg)\
+	dce_panel->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dce_panel->shift->field_name, dce_panel->mask->field_name
+
+void dce_panel_hw_init(struct panel *panel)
+{
+
+}
+
+bool dce_is_panel_backlight_on(struct panel *panel)
+{
+	struct dce_panel *dce_panel = TO_DCE_PANEL(panel);
+	uint32_t value;
+
+	REG_GET(PWRSEQ_CNTL, BLON, &value);
+
+	return value;
+}
+
+bool dce_is_panel_powered_on(struct panel *panel)
+{
+	struct dce_panel *dce_panel = TO_DCE_PANEL(panel);
+	uint32_t pwr_seq_state, dig_on, dig_on_ovrd;
+
+	REG_GET(PWRSEQ_STATE, PWRSEQ_TARGET_STATE_R, &pwr_seq_state);
+
+	REG_GET_2(PWRSEQ_CNTL, DIGON, &dig_on, DIGON_OVRD, &dig_on_ovrd);
+
+	return (pwr_seq_state == 1) || (dig_on == 1 && dig_on_ovrd == 1);
+}
+
+static void dce_panel_destroy(struct panel **panel)
+{
+	struct dce_panel *dce_panel = TO_DCE_PANEL(*panel);
+
+	kfree(dce_panel);
+	*panel = NULL;
+}
+
+static const struct panel_funcs dce_link_panel_funcs = {
+	.destroy = dce_panel_destroy,
+	.hw_init = dce_panel_hw_init,
+	.is_panel_backlight_on = dce_is_panel_backlight_on,
+	.is_panel_powered_on = dce_is_panel_powered_on,
+
+};
+
+void dce_panel_construct(
+	struct dce_panel *dce_panel,
+	const struct panel_init_data *init_data,
+	const struct dce_panel_registers *regs,
+	const struct dce_panel_shift *shift,
+	const struct dce_panel_mask *mask)
+{
+	dce_panel->regs = regs;
+	dce_panel->shift = shift;
+	dce_panel->mask = mask;
+
+	dce_panel->base.funcs = &dce_link_panel_funcs;
+	dce_panel->base.ctx = init_data->ctx;
+	dce_panel->base.inst = init_data->inst;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_panel.h b/drivers/gpu/drm/amd/display/dc/dce/dce_panel.h
new file mode 100644
index 000000000000..a09162440ac8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_panel.h
@@ -0,0 +1,117 @@
+/*
+ * Copyright 2012-15 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_PANEL__DCE_H__
+#define __DC_PANEL__DCE_H__
+
+#include "panel.h"
+
+/* set register offset with instance */
+#define DCE_PANEL_SR(reg_name, block)\
+	.reg_name = mm ## block ## _ ## reg_name
+
+#define DCE_PANEL_REG_LIST()\
+	DCE_PANEL_SR(PWRSEQ_CNTL, LVTMA), \
+	DCE_PANEL_SR(PWRSEQ_STATE, LVTMA), \
+	SR(BL_PWM_CNTL), \
+	SR(BL_PWM_CNTL2), \
+	SR(BL_PWM_PERIOD_CNTL), \
+	SR(BL_PWM_GRP1_REG_LOCK)
+
+#define DCN_PANEL_SR(reg_name, block)\
+	.reg_name = BASE(mm ## block ## _ ## reg_name ## _BASE_IDX) + \
+					mm ## block ## _ ## reg_name
+
+#define DCN_PANEL_REG_LIST()\
+	DCN_PANEL_SR(PWRSEQ_CNTL, LVTMA), \
+	DCN_PANEL_SR(PWRSEQ_STATE, LVTMA), \
+	SR(BL_PWM_CNTL), \
+	SR(BL_PWM_CNTL2), \
+	SR(BL_PWM_PERIOD_CNTL), \
+	SR(BL_PWM_GRP1_REG_LOCK)
+
+#define DCE_PANEL_SF(block, reg_name, field_name, post_fix)\
+	.field_name = block ## reg_name ## __ ## block ## field_name ## post_fix
+
+#define DCE_PANEL_MASK_SH_LIST(mask_sh) \
+	DCE_PANEL_SF(LVTMA_, PWRSEQ_CNTL, BLON, mask_sh),\
+	DCE_PANEL_SF(LVTMA_, PWRSEQ_CNTL, DIGON, mask_sh),\
+	DCE_PANEL_SF(LVTMA_, PWRSEQ_CNTL, DIGON_OVRD, mask_sh),\
+	DCE_PANEL_SF(LVTMA_, PWRSEQ_STATE, PWRSEQ_TARGET_STATE_R, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_PERIOD_CNTL, BL_PWM_PERIOD, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_PERIOD_CNTL, BL_PWM_PERIOD_BITCNT, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_CNTL, BL_ACTIVE_INT_FRAC_CNT, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_CNTL, BL_PWM_FRACTIONAL_EN, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_CNTL, BL_PWM_EN, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_GRP1_REG_LOCK, BL_PWM_GRP1_IGNORE_MASTER_LOCK_EN, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_GRP1_REG_LOCK, BL_PWM_GRP1_REG_LOCK, mask_sh), \
+	DCE_PANEL_SF(, BL_PWM_GRP1_REG_LOCK, BL_PWM_GRP1_REG_UPDATE_PENDING, mask_sh)
+
+#define DCE_PANEL_REG_FIELD_LIST(type) \
+	type BLON;\
+	type DIGON;\
+	type DIGON_OVRD;\
+	type PWRSEQ_TARGET_STATE_R; \
+	type BL_PWM_EN; \
+	type BL_ACTIVE_INT_FRAC_CNT; \
+	type BL_PWM_FRACTIONAL_EN; \
+	type BL_PWM_PERIOD; \
+	type BL_PWM_PERIOD_BITCNT; \
+	type BL_PWM_GRP1_IGNORE_MASTER_LOCK_EN; \
+	type BL_PWM_GRP1_REG_LOCK; \
+	type BL_PWM_GRP1_REG_UPDATE_PENDING
+
+struct dce_panel_shift {
+	DCE_PANEL_REG_FIELD_LIST(uint8_t);
+};
+
+struct dce_panel_mask {
+	DCE_PANEL_REG_FIELD_LIST(uint32_t);
+};
+
+struct dce_panel_registers {
+	uint32_t PWRSEQ_CNTL;
+	uint32_t PWRSEQ_STATE;
+	uint32_t BL_PWM_CNTL;
+	uint32_t BL_PWM_CNTL2;
+	uint32_t BL_PWM_PERIOD_CNTL;
+	uint32_t BL_PWM_GRP1_REG_LOCK;
+};
+
+struct dce_panel {
+	struct panel base;
+	const struct dce_panel_registers *regs;
+	const struct dce_panel_shift *shift;
+	const struct dce_panel_mask *mask;
+};
+
+void dce_panel_construct(
+	struct dce_panel *panel,
+	const struct panel_init_data *init_data,
+	const struct dce_panel_registers *regs,
+	const struct dce_panel_shift *shift,
+	const struct dce_panel_mask *mask);
+
+#endif /* __DC_PANEL__DCE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
index 8f78bf9abbca..6668cb81e858 100644
--- a/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce100/dce100_resource.c
@@ -46,6 +46,7 @@
 #include "dce/dce_audio.h"
 #include "dce/dce_hwseq.h"
 #include "dce100/dce100_hw_sequencer.h"
+#include "dce/dce_panel.h"
 
 #include "reg_helper.h"
 
@@ -249,6 +250,18 @@ static const struct dce_stream_encoder_mask se_mask = {
 		SE_COMMON_MASK_SH_LIST_DCE80_100(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCE_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 #define opp_regs(id)\
 [id] = {\
 	OPP_DCE_100_REG_LIST(id),\
@@ -627,6 +640,23 @@ struct link_encoder *dce100_link_encoder_create(
 	return &enc110->base;
 }
 
+static struct panel *dce100_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 struct output_pixel_processor *dce100_opp_create(
 	struct dc_context *ctx,
 	uint32_t inst)
@@ -943,6 +973,7 @@ struct stream_encoder *dce100_find_first_free_match_stream_enc_for_link(
 static const struct resource_funcs dce100_res_pool_funcs = {
 	.destroy = dce100_destroy_resource_pool,
 	.link_enc_create = dce100_link_encoder_create,
+	.panel_create = dce100_panel_create,
 	.validate_bandwidth = dce100_validate_bandwidth,
 	.validate_plane = dce100_validate_plane,
 	.add_stream_to_ctx = dce100_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 78240db90004..09891fb5239a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -53,6 +53,7 @@
 #include "abm.h"
 #include "audio.h"
 #include "reg_helper.h"
+#include "panel.h"
 
 /* include DCE11 register header files */
 #include "dce/dce_11_0_d.h"
@@ -695,31 +696,6 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx)
 
 
 
-}
-
-/*todo: cloned in stream enc, fix*/
-bool dce110_is_panel_backlight_on(struct dc_link *link)
-{
-	struct dc_context *ctx = link->ctx;
-	struct dce_hwseq *hws = ctx->dc->hwseq;
-	uint32_t value;
-
-	REG_GET(LVTMA_PWRSEQ_CNTL, LVTMA_BLON, &value);
-
-	return value;
-}
-
-bool dce110_is_panel_powered_on(struct dc_link *link)
-{
-	struct dc_context *ctx = link->ctx;
-	struct dce_hwseq *hws = ctx->dc->hwseq;
-	uint32_t pwr_seq_state, dig_on, dig_on_ovrd;
-
-	REG_GET(LVTMA_PWRSEQ_STATE, LVTMA_PWRSEQ_TARGET_STATE_R, &pwr_seq_state);
-
-	REG_GET_2(LVTMA_PWRSEQ_CNTL, LVTMA_DIGON, &dig_on, LVTMA_DIGON_OVRD, &dig_on_ovrd);
-
-	return (pwr_seq_state == 1) || (dig_on == 1 && dig_on_ovrd == 1);
 }
 
 static enum bp_result link_transmitter_control(
@@ -810,7 +786,6 @@ void dce110_edp_power_control(
 		bool power_up)
 {
 	struct dc_context *ctx = link->ctx;
-	struct dce_hwseq *hwseq = ctx->dc->hwseq;
 	struct bp_transmitter_control cntl = { 0 };
 	enum bp_result bp_result;
 
@@ -821,7 +796,10 @@ void dce110_edp_power_control(
 		return;
 	}
 
-	if (power_up != hwseq->funcs.is_panel_powered_on(link)) {
+	if (link->panel)
+		return;
+
+	if (power_up != link->panel->funcs->is_panel_powered_on(link->panel)) {
 		/* Send VBIOS command to prompt eDP panel power */
 		if (power_up) {
 			unsigned long long current_ts = dm_get_timestamp(ctx);
@@ -892,7 +870,6 @@ void dce110_edp_backlight_control(
 		bool enable)
 {
 	struct dc_context *ctx = link->ctx;
-	struct dce_hwseq *hws = ctx->dc->hwseq;
 	struct bp_transmitter_control cntl = { 0 };
 
 	if (dal_graphics_object_id_get_connector_id(link->link_enc->connector)
@@ -901,7 +878,7 @@ void dce110_edp_backlight_control(
 		return;
 	}
 
-	if (enable && hws->funcs.is_panel_backlight_on(link)) {
+	if (enable && link->panel && link->panel->funcs->is_panel_backlight_on(link->panel)) {
 		DC_LOG_HW_RESUME_S3(
 				"%s: panel already powered up. Do nothing.\n",
 				__func__);
@@ -2784,8 +2761,6 @@ static const struct hwseq_private_funcs dce110_private_funcs = {
 	.disable_stream_gating = NULL,
 	.enable_stream_gating = NULL,
 	.edp_backlight_control = dce110_edp_backlight_control,
-	.is_panel_backlight_on = dce110_is_panel_backlight_on,
-	.is_panel_powered_on = dce110_is_panel_powered_on,
 };
 
 void dce110_hw_sequencer_construct(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.h
index 34be166e8ff0..26a9c14a58b1 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.h
@@ -85,9 +85,5 @@ void dce110_edp_wait_for_hpd_ready(
 		struct dc_link *link,
 		bool power_up);
 
-bool dce110_is_panel_backlight_on(struct dc_link *link);
-
-bool dce110_is_panel_powered_on(struct dc_link *link);
-
 #endif /* __DC_HWSS_DCE110_H__ */
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
index bf14e9ab040c..9b4bf9410cb5 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
@@ -53,6 +53,7 @@
 #include "dce/dce_abm.h"
 #include "dce/dce_dmcu.h"
 #include "dce/dce_i2c.h"
+#include "dce/dce_panel.h"
 
 #define DC_LOGGER \
 		dc->ctx->logger
@@ -275,6 +276,18 @@ static const struct dce_stream_encoder_mask se_mask = {
 		SE_COMMON_MASK_SH_LIST_DCE110(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCE_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 static const struct dce110_aux_registers_shift aux_shift = {
 	DCE_AUX_MASK_SH_LIST(__SHIFT)
 };
@@ -673,6 +686,23 @@ static struct link_encoder *dce110_link_encoder_create(
 	return &enc110->base;
 }
 
+static struct panel *dce110_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 static struct output_pixel_processor *dce110_opp_create(
 	struct dc_context *ctx,
 	uint32_t inst)
@@ -1203,6 +1233,7 @@ struct stream_encoder *dce110_find_first_free_match_stream_enc_for_link(
 static const struct resource_funcs dce110_res_pool_funcs = {
 	.destroy = dce110_destroy_resource_pool,
 	.link_enc_create = dce110_link_encoder_create,
+	.panel_create = dce110_panel_create,
 	.validate_bandwidth = dce110_validate_bandwidth,
 	.validate_plane = dce110_validate_plane,
 	.acquire_idle_pipe_for_layer = dce110_acquire_underlay,
diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
index 700ad8b3e54b..2c25e6f9beb9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
@@ -51,6 +51,7 @@
 #include "dce/dce_dmcu.h"
 #include "dce/dce_aux.h"
 #include "dce/dce_i2c.h"
+#include "dce/dce_panel.h"
 
 #include "reg_helper.h"
 
@@ -238,6 +239,18 @@ static const struct dce110_link_enc_aux_registers link_enc_aux_regs[] = {
 		aux_regs(5)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCE_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 #define hpd_regs(id)\
 [id] = {\
 	HPD_REG_LIST(id)\
@@ -631,6 +644,23 @@ struct link_encoder *dce112_link_encoder_create(
 	return &enc110->base;
 }
 
+static struct panel *dce112_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 static struct input_pixel_processor *dce112_ipp_create(
 	struct dc_context *ctx, uint32_t inst)
 {
@@ -1021,6 +1051,7 @@ static void dce112_destroy_resource_pool(struct resource_pool **pool)
 static const struct resource_funcs dce112_res_pool_funcs = {
 	.destroy = dce112_destroy_resource_pool,
 	.link_enc_create = dce112_link_encoder_create,
+	.panel_create = dce112_panel_create,
 	.validate_bandwidth = dce112_validate_bandwidth,
 	.validate_plane = dce100_validate_plane,
 	.add_stream_to_ctx = dce112_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
index 53ab88ef71f5..71f8431d5ae6 100644
--- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
@@ -44,6 +44,7 @@
 #include "dce/dce_clock_source.h"
 #include "dce/dce_ipp.h"
 #include "dce/dce_mem_input.h"
+#include "dce/dce_panel.h"
 
 #include "dce110/dce110_hw_sequencer.h"
 #include "dce120/dce120_hw_sequencer.h"
@@ -293,6 +294,18 @@ static const struct dce_stream_encoder_mask se_mask = {
 		SE_COMMON_MASK_SH_LIST_DCE120(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCE_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 static const struct dce110_aux_registers_shift aux_shift = {
 	DCE12_AUX_MASK_SH_LIST(__SHIFT)
 };
@@ -715,6 +728,23 @@ static struct link_encoder *dce120_link_encoder_create(
 	return &enc110->base;
 }
 
+static struct panel *dce120_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 static struct input_pixel_processor *dce120_ipp_create(
 	struct dc_context *ctx, uint32_t inst)
 {
@@ -880,6 +910,7 @@ static void dce120_destroy_resource_pool(struct resource_pool **pool)
 static const struct resource_funcs dce120_res_pool_funcs = {
 	.destroy = dce120_destroy_resource_pool,
 	.link_enc_create = dce120_link_encoder_create,
+	.panel_create = dce120_panel_create,
 	.validate_bandwidth = dce112_validate_bandwidth,
 	.validate_plane = dce100_validate_plane,
 	.add_stream_to_ctx = dce112_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
index 2ad5c28c6e66..dca7f7c0b488 100644
--- a/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce80/dce80_resource.c
@@ -50,6 +50,7 @@
 #include "dce/dce_hwseq.h"
 #include "dce80/dce80_hw_sequencer.h"
 #include "dce100/dce100_resource.h"
+#include "dce/dce_panel.h"
 
 #include "reg_helper.h"
 
@@ -266,6 +267,18 @@ static const struct dce_stream_encoder_mask se_mask = {
 		SE_COMMON_MASK_SH_LIST_DCE80_100(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCE_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 #define opp_regs(id)\
 [id] = {\
 	OPP_DCE_80_REG_LIST(id),\
@@ -728,6 +741,23 @@ struct link_encoder *dce80_link_encoder_create(
 	return &enc110->base;
 }
 
+static struct panel *dce80_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 struct clock_source *dce80_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
@@ -909,6 +939,7 @@ static void dce80_destroy_resource_pool(struct resource_pool **pool)
 static const struct resource_funcs dce80_res_pool_funcs = {
 	.destroy = dce80_destroy_resource_pool,
 	.link_enc_create = dce80_link_encoder_create,
+	.panel_create = dce80_panel_create,
 	.validate_bandwidth = dce80_validate_bandwidth,
 	.validate_plane = dce100_validate_plane,
 	.add_stream_to_ctx = dce100_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
index dd02d3983695..b88ef9703b2b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_init.c
@@ -87,8 +87,6 @@ static const struct hwseq_private_funcs dcn10_private_funcs = {
 	.reset_hw_ctx_wrap = dcn10_reset_hw_ctx_wrap,
 	.enable_stream_timing = dcn10_enable_stream_timing,
 	.edp_backlight_control = dce110_edp_backlight_control,
-	.is_panel_backlight_on = dce110_is_panel_backlight_on,
-	.is_panel_powered_on = dce110_is_panel_powered_on,
 	.disable_stream_gating = NULL,
 	.enable_stream_gating = NULL,
 	.setup_vupdate_interrupt = dcn10_setup_vupdate_interrupt,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
index 07265ca7d28c..7dd0945ff5cf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_resource.c
@@ -51,6 +51,7 @@
 #include "dce112/dce112_resource.h"
 #include "dcn10_hubp.h"
 #include "dcn10_hubbub.h"
+#include "dce/dce_panel.h"
 
 #include "soc15_hw_ip.h"
 #include "vega10_ip_offset.h"
@@ -321,6 +322,18 @@ static const struct dcn10_link_enc_mask le_mask = {
 		LINK_ENCODER_MASK_SH_LIST_DCN10(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCN_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 static const struct dce110_aux_registers_shift aux_shift = {
 	DCN10_AUX_MASK_SH_LIST(__SHIFT)
 };
@@ -807,6 +820,23 @@ struct link_encoder *dcn10_link_encoder_create(
 	return &enc10->base;
 }
 
+static struct panel *dcn10_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 struct clock_source *dcn10_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
@@ -1291,6 +1321,7 @@ static const struct dc_cap_funcs cap_funcs = {
 static const struct resource_funcs dcn10_res_pool_funcs = {
 	.destroy = dcn10_destroy_resource_pool,
 	.link_enc_create = dcn10_link_encoder_create,
+	.panel_create = dcn10_panel_create,
 	.validate_bandwidth = dcn_validate_bandwidth,
 	.acquire_idle_pipe_for_layer = dcn10_acquire_idle_pipe_for_layer,
 	.validate_plane = dcn10_validate_plane,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
index 1e73357eda34..1642bf546ceb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_init.c
@@ -97,8 +97,6 @@ static const struct hwseq_private_funcs dcn20_private_funcs = {
 	.reset_hw_ctx_wrap = dcn20_reset_hw_ctx_wrap,
 	.enable_stream_timing = dcn20_enable_stream_timing,
 	.edp_backlight_control = dce110_edp_backlight_control,
-	.is_panel_backlight_on = dce110_is_panel_backlight_on,
-	.is_panel_powered_on = dce110_is_panel_powered_on,
 	.disable_stream_gating = dcn20_disable_stream_gating,
 	.enable_stream_gating = dcn20_enable_stream_gating,
 	.setup_vupdate_interrupt = dcn20_setup_vupdate_interrupt,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 9e1d2b2e58f9..219aaed6e06e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -61,6 +61,7 @@
 #include "dcn20_dccg.h"
 #include "dcn20_vmid.h"
 #include "dc_link_ddc.h"
+#include "dce/dce_panel.h"
 
 #include "navi10_ip_offset.h"
 
@@ -687,6 +688,18 @@ static const struct dcn10_link_enc_mask le_mask = {
 	DPCS_DCN2_MASK_SH_LIST(_MASK)
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCN_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 #define ipp_regs(id)\
 [id] = {\
 	IPP_REG_LIST_DCN20(id),\
@@ -1289,6 +1302,23 @@ struct link_encoder *dcn20_link_encoder_create(
 	return &enc20->enc10.base;
 }
 
+static struct panel *dcn20_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 struct clock_source *dcn20_clock_source_create(
 	struct dc_context *ctx,
 	struct dc_bios *bios,
@@ -3189,6 +3219,7 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
 static struct resource_funcs dcn20_res_pool_funcs = {
 	.destroy = dcn20_destroy_resource_pool,
 	.link_enc_create = dcn20_link_encoder_create,
+	.panel_create = dcn20_panel_create,
 	.validate_bandwidth = dcn20_validate_bandwidth,
 	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
 	.add_stream_to_ctx = dcn20_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
index a6ed70fcbc19..8410a6305a9a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_init.c
@@ -106,8 +106,6 @@ static const struct hwseq_private_funcs dcn21_private_funcs = {
 	.reset_hw_ctx_wrap = dcn20_reset_hw_ctx_wrap,
 	.enable_stream_timing = dcn20_enable_stream_timing,
 	.edp_backlight_control = dce110_edp_backlight_control,
-	.is_panel_backlight_on = dce110_is_panel_backlight_on,
-	.is_panel_powered_on = dce110_is_panel_powered_on,
 	.disable_stream_gating = dcn20_disable_stream_gating,
 	.enable_stream_gating = dcn20_enable_stream_gating,
 	.setup_vupdate_interrupt = dcn20_setup_vupdate_interrupt,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index babc966cdabd..1cc6da46a82a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -61,6 +61,7 @@
 #include "dcn21_hubbub.h"
 #include "dcn10/dcn10_resource.h"
 #include "dce110/dce110_resource.h"
+#include "dce/dce_panel.h"
 
 #include "dcn20/dcn20_dwb.h"
 #include "dcn20/dcn20_mmhubbub.h"
@@ -1606,6 +1607,18 @@ static const struct dcn10_link_enc_registers link_enc_regs[] = {
 	link_regs(4, E),
 };
 
+static const struct dce_panel_registers panel_regs[] = {
+	{ DCN_PANEL_REG_LIST() }
+};
+
+static const struct dce_panel_shift panel_shift = {
+	DCE_PANEL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_mask panel_mask = {
+	DCE_PANEL_MASK_SH_LIST(_MASK)
+};
+
 #define aux_regs(id)\
 [id] = {\
 	DCN2_AUX_REG_LIST(id)\
@@ -1691,6 +1704,24 @@ static struct link_encoder *dcn21_link_encoder_create(
 
 	return &enc21->enc10.base;
 }
+
+static struct panel *dcn21_panel_create(const struct panel_init_data *init_data)
+{
+	struct dce_panel *panel =
+		kzalloc(sizeof(struct dce_panel), GFP_KERNEL);
+
+	if (!panel)
+		return NULL;
+
+	dce_panel_construct(panel,
+			init_data,
+			&panel_regs[init_data->inst],
+			&panel_shift,
+			&panel_mask);
+
+	return &panel->base;
+}
+
 #define CTX ctx
 
 #define REG(reg_name) \
@@ -1735,6 +1766,7 @@ enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_stat
 static struct resource_funcs dcn21_res_pool_funcs = {
 	.destroy = dcn21_destroy_resource_pool,
 	.link_enc_create = dcn21_link_encoder_create,
+	.panel_create = dcn21_panel_create,
 	.validate_bandwidth = dcn21_validate_bandwidth,
 	.populate_dml_pipes = dcn21_populate_dml_pipes_from_context,
 	.add_stream_to_ctx = dcn20_add_stream_to_ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index d523fc9547e7..cb1952ea3170 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -38,6 +38,7 @@
 #endif
 #include "dwb.h"
 #include "mcif_wb.h"
+#include "panel.h"
 
 #define MAX_CLOCK_SOURCES 7
 
@@ -92,6 +93,8 @@ struct clk_bw_params;
 struct resource_funcs {
 	void (*destroy)(struct resource_pool **pool);
 	void (*link_init)(struct dc_link *link);
+	struct panel*(*panel_create)(
+		const struct panel_init_data *panel_init_data);
 	struct link_encoder *(*link_enc_create)(
 			const struct encoder_init_data *init);
 	bool (*validate_bandwidth)(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/panel.h b/drivers/gpu/drm/amd/display/dc/inc/hw/panel.h
new file mode 100644
index 000000000000..6a4f7f26f04c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/panel.h
@@ -0,0 +1,53 @@
+/*
+ * Copyright 2017 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+/*
+ * panel.h
+ *
+ *  Created on: Oct 6, 2015
+ *      Author: yonsun
+ */
+
+#ifndef DC_PANEL_H_
+#define DC_PANEL_H_
+
+#include "dc_types.h"
+
+struct panel_funcs {
+	void (*destroy)(struct panel **panel);
+	void (*hw_init)(struct panel *panel);
+	bool (*is_panel_backlight_on)(struct panel *panel);
+	bool (*is_panel_powered_on)(struct panel *panel);
+};
+
+struct panel_init_data {
+	struct dc_context *ctx;
+	uint32_t inst;
+};
+
+struct panel {
+	const struct panel_funcs *funcs;
+	struct dc_context *ctx;
+	uint32_t inst;
+};
+
+#endif /* DC_PANEL_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
index 52a26e6be066..36e906bb6bfc 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
@@ -100,8 +100,6 @@ struct hwseq_private_funcs {
 			struct dc *dc);
 	void (*edp_backlight_control)(struct dc_link *link,
 			bool enable);
-	bool (*is_panel_backlight_on)(struct dc_link *link);
-	bool (*is_panel_powered_on)(struct dc_link *link);
 	void (*setup_vupdate_interrupt)(struct dc *dc,
 			struct pipe_ctx *pipe_ctx);
 	bool (*did_underflow_occur)(struct dc *dc, struct pipe_ctx *pipe_ctx);
-- 
2.26.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
