Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278BC534142
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 18:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5957010E70D;
	Wed, 25 May 2022 16:20:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7BB10E5F8
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 16:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RL+PVX6Mr++tA3cAFN2El2T641u6j9IxK3kRH7P5z5RcptO5KhMI3S23bMbhqEFSn+DKboPeBNI03x6zzBh9v4RiSTAmR4fDQ3Sg4wpC5Niky3WY8aOIiqXjaP3w2frFQViUZPftGOTHe7KcHsNmSpoeVIU5LstIpnP4PhA/nV4POYcHKdR+fBV3T9HeeK4TTkC7ZGol4krvnRX/KQ3s9EvPOKl5ynaeOPLHnNTsPlWmJWsKZmEegvAiWHlenMmgNCSJqwYBx25sgjKOn0tqaWmcr0/pKLyDldBWAsEBiTcJzx2yHbZIJlPOPxZ9gYkOISLOs20P4wr7gaUvEl+GAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFRgFm80lhMr7Tz5BO8igv7eF0RL5qDrwhFP/oglhpg=;
 b=jrQGd5UcuB3xYRYRWAdh3uUVF77WdgtaEtBKCUTLxwTkENGWl+mBPl/uhktiKWxXig9sWyYZWLxCoD0RF8qKvna8njm34/TrT7XlIM0HwRaMLazXI2idbRvC4au9bS2nxEHjUWxImrg8GustB9oSa8EExBWS1Mc99884N2/kv7W4R3jGkkte/BohMCOWzpxrpl1kFY3SfwnFND0Ij6Xcn3rueAxkWxoHy23xRMpa7BM12IMe3zwCz0ue1C/3O8zwQgqmFM6tzUMn6QOBntK81951RAH9RoUhf7GRi7xcZT1aRiDk2Gyut56NaY3Fb7NTqnZpW5qvnjJ+haDajWNblA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFRgFm80lhMr7Tz5BO8igv7eF0RL5qDrwhFP/oglhpg=;
 b=1bV+ZWx2R56fLXsnIvSV1J95nn4XLM+s2rmK4aQ+g9gsF4+YOxXn9tfIcqM8P3zLK91I1v4FP22o37/h+jU/I/IVnwLsi9VhXOADGG/RRvbcmWFFS3S5PrVIgqu4+LlB+rcG3qYXdCF2hQ7GokB/6P9zJ8ix64d4HwjAmlyeUG8=
Received: from DS7PR05CA0086.namprd05.prod.outlook.com (2603:10b6:8:56::7) by
 CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.13; Wed, 25 May 2022 16:20:08 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::5d) by DS7PR05CA0086.outlook.office365.com
 (2603:10b6:8:56::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.5 via Frontend
 Transport; Wed, 25 May 2022 16:20:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 16:20:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 11:20:06 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 11/43] drm/amd/display: Add dependant changes for DCN32/321
Date: Wed, 25 May 2022 12:19:09 -0400
Message-ID: <20220525161941.2544055-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525161941.2544055-1-alexander.deucher@amd.com>
References: <20220525161941.2544055-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a98cea9-a337-4d3d-f50b-08da3e6a6f3e
X-MS-TrafficTypeDiagnostic: CY5PR12MB6153:EE_
X-Microsoft-Antispam-PRVS: <CY5PR12MB61530CFE2CD774F3C3882392F7D69@CY5PR12MB6153.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLVpNaL9gcgyqs04nfQZx90joWhR7iLFnpSC/Ka5zlGIle06e475FpS+1Cwwrfx7P5BDqdvELfYkost3b4IdKcI9cvt8W4ufWz1F1XJrcPMXR5G6cotKMVnhGbYitqK/95hnx+jsKEb0nWFts1pIEnd585ifHbxnIuU18FN+Zb7UIzBxtJWD48b2jBookbdX8Z9Tx/98Tj5LD2oWG3PVVauN8Os4APDvLnnOY9Wi30i5XLLZ9yubfk5Fp99qAz0xlRfQ7l3CRkk/BtNpYhGBVjkghpTUE3uX4JcI47iY19/xmDimGWgq6n3pdVxnb+ErhiZFjS7/aJg8hB51Fla3BmgRERct3PR8ET3IZdW2CHskuXkM7qk1YlnT9w1DWX0EmtX86Sfwt/rhF9sC5aYKz/cHiTHrl7nURC5czcpGcQ4y3GZgiVmACmNEiBjzc4BMEnRnfnp5vrEYfbi+0E3bxo8BwPfDl60SdddDohTKxTmDNHWlVrxAqiEP31zVyx0QRGgUDn7Mf11VYdIA/7vxzh69OeZKIM29Ixc3dSUU6C/XNVsHdXf1gqB4xdxhzb7J+Qlck+AW7CqSf080Cqa16POAjsu35aqtWVf6fOvGeY0cwKCxi4WiB5u8J87lMVJX/hdgYVkSll70Xw0sk8i/ocLEikcjLibapcNKZbc385PZVXZSEADBb75VtBQX6JD9regfcTo8duMyBzAY1qPJxQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(5660300002)(70206006)(8676002)(26005)(70586007)(2906002)(2616005)(4326008)(81166007)(30864003)(86362001)(40460700003)(508600001)(356005)(36860700001)(7696005)(8936002)(54906003)(6916009)(186003)(316002)(36756003)(16526019)(336012)(1076003)(83380400001)(82310400005)(426003)(47076005)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:20:07.9105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a98cea9-a337-4d3d-f50b-08da3e6a6f3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[Why&How]
This patch adds necessary changes needed in DC files outside DCN32/321
specific tree

v2: squash in updates (Alex)

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |   2 +
 .../drm/amd/display/dc/bios/bios_parser2.c    | 949 ++++++++++++++----
 .../dc/bios/bios_parser_types_internal2.h     |   1 +
 .../display/dc/bios/command_table_helper2.c   |   2 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c |  20 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |  19 +
 .../gpu/drm/amd/display/dc/dc_bios_types.h    |   5 +
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |   1 +
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  21 +
 drivers/gpu/drm/amd/display/dc/dce/dce_abm.h  |  45 +
 .../drm/amd/display/dc/dce/dce_clock_source.h |  15 +
 .../drm/amd/display/dc/dcn10/dcn10_hubbub.h   |  33 +
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |   5 -
 .../gpu/drm/amd/display/dc/dcn10/dcn10_optc.h |   2 +
 .../display/dc/dcn10/dcn10_stream_encoder.h   |  28 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h |  34 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h |  25 +-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  32 +-
 .../dc/dcn30/dcn30_dio_stream_encoder.c       |  16 +-
 .../dc/dcn30/dcn30_dio_stream_encoder.h       |  35 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |   8 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h  |  16 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  14 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h  | 147 +++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_optc.h |   9 +
 .../gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c |  73 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h |  14 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_optc.c |  22 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_optc.h |   6 +-
 .../dc/dcn32/dcn32_dio_stream_encoder.c       |  36 +-
 .../dc/dcn32/dcn32_dio_stream_encoder.h       |  15 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |   4 +-
 .../gpu/drm/amd/display/dc/dcn32/dcn32_optc.c |  36 +-
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |   2 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |  59 +-
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  10 +
 drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h  |   9 +-
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   3 +
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |   7 +
 .../gpu/drm/amd/display/dc/inc/hw/mem_input.h |   2 +
 .../amd/display/dc/inc/hw/stream_encoder.h    |   4 +
 .../amd/display/dc/inc/hw/timing_generator.h  |  10 +-
 .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
 .../amd/display/dc/inc/hw_sequencer_private.h |   5 +
 drivers/gpu/drm/amd/display/dc/inc/resource.h |   7 +
 .../amd/display/include/bios_parser_types.h   |  10 +
 48 files changed, 1529 insertions(+), 307 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index b4eca0236435..4de8e1871711 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -38,6 +38,8 @@ DC_LIBS += dcn303
 DC_LIBS += dcn31
 DC_LIBS += dcn315
 DC_LIBS += dcn316
+DC_LIBS += dcn32
+DC_LIBS += dcn321
 endif
 
 DC_LIBS += dce120
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 23a3b640f0ee..bbc0a5769e88 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -165,9 +165,21 @@ static uint8_t bios_parser_get_connectors_number(struct dc_bios *dcb)
 	unsigned int count = 0;
 	unsigned int i;
 
-	for (i = 0; i < bp->object_info_tbl.v1_4->number_of_path; i++) {
-		if (bp->object_info_tbl.v1_4->display_path[i].encoderobjid != 0)
-			count++;
+	switch (bp->object_info_tbl.revision.minor) {
+	default:
+	case 4:
+		for (i = 0; i < bp->object_info_tbl.v1_4->number_of_path; i++)
+			if (bp->object_info_tbl.v1_4->display_path[i].encoderobjid != 0)
+				count++;
+
+		break;
+
+	case 5:
+		for (i = 0; i < bp->object_info_tbl.v1_5->number_of_path; i++)
+			if (bp->object_info_tbl.v1_5->display_path[i].encoderobjid != 0)
+				count++;
+
+		break;
 	}
 	return count;
 }
@@ -182,16 +194,34 @@ static struct graphics_object_id bios_parser_get_connector_id(
 	struct object_info_table *tbl = &bp->object_info_tbl;
 	struct display_object_info_table_v1_4 *v1_4 = tbl->v1_4;
 
-	if (v1_4->number_of_path > i) {
-		/* If display_objid is generic object id,  the encoderObj
-		 * /extencoderobjId should be 0
-		 */
-		if (v1_4->display_path[i].encoderobjid != 0 &&
-				v1_4->display_path[i].display_objid != 0)
-			object_id = object_id_from_bios_object_id(
+	struct display_object_info_table_v1_5 *v1_5 = tbl->v1_5;
+
+	switch (bp->object_info_tbl.revision.minor) {
+	default:
+	case 4:
+		if (v1_4->number_of_path > i) {
+			/* If display_objid is generic object id,  the encoderObj
+			 * /extencoderobjId should be 0
+			 */
+			if (v1_4->display_path[i].encoderobjid != 0 &&
+			    v1_4->display_path[i].display_objid != 0)
+				object_id = object_id_from_bios_object_id(
 					v1_4->display_path[i].display_objid);
-	}
+		}
+		break;
 
+	case 5:
+		if (v1_5->number_of_path > i) {
+			/* If display_objid is generic object id,  the encoderObjId
+		 * should be 0
+		 */
+			if (v1_5->display_path[i].encoderobjid != 0 &&
+			    v1_5->display_path[i].display_objid != 0)
+				object_id = object_id_from_bios_object_id(
+					v1_5->display_path[i].display_objid);
+		}
+		break;
+	}
 	return object_id;
 }
 
@@ -201,8 +231,8 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 	unsigned int i;
-	enum bp_result  bp_result = BP_RESULT_BADINPUT;
-	struct graphics_object_id obj_id = {0};
+	enum bp_result bp_result = BP_RESULT_BADINPUT;
+	struct graphics_object_id obj_id = { 0 };
 	struct object_info_table *tbl = &bp->object_info_tbl;
 
 	if (!src_object_id)
@@ -217,37 +247,84 @@ static enum bp_result bios_parser_get_src_obj(struct dc_bios *dcb,
 		 * If found in for loop, should break.
 		 * DAL2 implementation may be changed too
 		 */
-		for (i = 0; i < tbl->v1_4->number_of_path; i++) {
-			obj_id = object_id_from_bios_object_id(
-			tbl->v1_4->display_path[i].encoderobjid);
-			if (object_id.type == obj_id.type &&
-					object_id.id == obj_id.id &&
-						object_id.enum_id ==
-							obj_id.enum_id) {
-				*src_object_id =
-				object_id_from_bios_object_id(0x1100);
-				/* break; */
+		switch (bp->object_info_tbl.revision.minor) {
+		default:
+		case 4:
+			for (i = 0; i < tbl->v1_4->number_of_path; i++) {
+				obj_id = object_id_from_bios_object_id(
+					tbl->v1_4->display_path[i].encoderobjid);
+				if (object_id.type == obj_id.type &&
+				    object_id.id == obj_id.id &&
+				    object_id.enum_id == obj_id.enum_id) {
+					*src_object_id =
+						object_id_from_bios_object_id(
+							0x1100);
+					/* break; */
+				}
+			}
+			bp_result = BP_RESULT_OK;
+			break;
+
+		case 5:
+			for (i = 0; i < tbl->v1_5->number_of_path; i++) {
+				obj_id = object_id_from_bios_object_id(
+					tbl->v1_5->display_path[i].encoderobjid);
+				if (object_id.type == obj_id.type &&
+				    object_id.id == obj_id.id &&
+				    object_id.enum_id == obj_id.enum_id) {
+					*src_object_id =
+						object_id_from_bios_object_id(
+							0x1100);
+					/* break; */
+				}
 			}
+			bp_result = BP_RESULT_OK;
+			break;
 		}
-		bp_result = BP_RESULT_OK;
 		break;
 	case OBJECT_TYPE_CONNECTOR:
-		for (i = 0; i < tbl->v1_4->number_of_path; i++) {
-			obj_id = object_id_from_bios_object_id(
-				tbl->v1_4->display_path[i].display_objid);
-
-			if (object_id.type == obj_id.type &&
-				object_id.id == obj_id.id &&
-					object_id.enum_id == obj_id.enum_id) {
-				*src_object_id =
-				object_id_from_bios_object_id(
-				tbl->v1_4->display_path[i].encoderobjid);
-				/* break; */
+		switch (bp->object_info_tbl.revision.minor) {
+		default:
+		case 4:
+			for (i = 0; i < tbl->v1_4->number_of_path; i++) {
+				obj_id = object_id_from_bios_object_id(
+					tbl->v1_4->display_path[i]
+						.display_objid);
+
+				if (object_id.type == obj_id.type &&
+				    object_id.id == obj_id.id &&
+				    object_id.enum_id == obj_id.enum_id) {
+					*src_object_id =
+						object_id_from_bios_object_id(
+							tbl->v1_4
+								->display_path[i]
+								.encoderobjid);
+					/* break; */
+				}
 			}
+			bp_result = BP_RESULT_OK;
+			break;
 		}
 		bp_result = BP_RESULT_OK;
 		break;
+		case 5:
+			for (i = 0; i < tbl->v1_5->number_of_path; i++) {
+				obj_id = object_id_from_bios_object_id(
+								       tbl->v1_5->display_path[i].display_objid);
+
+				if (object_id.type == obj_id.type &&
+				    object_id.id == obj_id.id &&
+				    object_id.enum_id == obj_id.enum_id) {
+					*src_object_id = object_id_from_bios_object_id(
+										       tbl->v1_5->display_path[i].encoderobjid);
+					/* break; */
+				}
+			}
+		bp_result = BP_RESULT_OK;
+		break;
+
 	default:
+		bp_result = BP_RESULT_OK;
 		break;
 	}
 
@@ -290,12 +367,55 @@ static struct atom_display_object_path_v2 *get_bios_object(
 	}
 }
 
+/* from graphics_object_id, find display path which includes the object_id */
+static struct atom_display_object_path_v3 *get_bios_object_from_path_v3(
+	struct bios_parser *bp,
+	struct graphics_object_id id)
+{
+	unsigned int i;
+	struct graphics_object_id obj_id = {0};
+
+	switch (id.type) {
+	case OBJECT_TYPE_ENCODER:
+		for (i = 0; i < bp->object_info_tbl.v1_5->number_of_path; i++) {
+			obj_id = object_id_from_bios_object_id(
+					bp->object_info_tbl.v1_5->display_path[i].encoderobjid);
+			if (id.type == obj_id.type && id.id == obj_id.id
+					&& id.enum_id == obj_id.enum_id)
+				return &bp->object_info_tbl.v1_5->display_path[i];
+		}
+        break;
+
+	case OBJECT_TYPE_CONNECTOR:
+	case OBJECT_TYPE_GENERIC:
+		/* Both Generic and Connector Object ID
+		 * will be stored on display_objid
+		 */
+		for (i = 0; i < bp->object_info_tbl.v1_5->number_of_path; i++) {
+			obj_id = object_id_from_bios_object_id(
+					bp->object_info_tbl.v1_5->display_path[i].display_objid);
+			if (id.type == obj_id.type && id.id == obj_id.id
+					&& id.enum_id == obj_id.enum_id)
+				return &bp->object_info_tbl.v1_5->display_path[i];
+		}
+        break;
+
+	default:
+		return NULL;
+	}
+
+    return NULL;
+}
+
 static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
 	struct graphics_object_id id,
 	struct graphics_object_i2c_info *info)
 {
 	uint32_t offset;
 	struct atom_display_object_path_v2 *object;
+
+	struct atom_display_object_path_v3 *object_path_v3;
+
 	struct atom_common_record_header *header;
 	struct atom_i2c_record *record;
 	struct atom_i2c_record dummy_record = {0};
@@ -313,12 +433,25 @@ static enum bp_result bios_parser_get_i2c_info(struct dc_bios *dcb,
 			return BP_RESULT_NORECORD;
 	}
 
-	object = get_bios_object(bp, id);
+	switch (bp->object_info_tbl.revision.minor) {
+	    case 4:
+	    default:
+	        object = get_bios_object(bp, id);
 
-	if (!object)
-		return BP_RESULT_BADINPUT;
+	        if (!object)
+				return BP_RESULT_BADINPUT;
 
-	offset = object->disp_recordoffset + bp->object_info_tbl_offset;
+	        offset = object->disp_recordoffset + bp->object_info_tbl_offset;
+	        break;
+	    case 5:
+		object_path_v3 = get_bios_object_from_path_v3(bp, id);
+
+		if (!object_path_v3)
+			return BP_RESULT_BADINPUT;
+
+		offset = object_path_v3->disp_recordoffset + bp->object_info_tbl_offset;
+		break;
+	}
 
 	for (;;) {
 		header = GET_IMAGE(struct atom_common_record_header, offset);
@@ -421,6 +554,41 @@ static enum bp_result get_gpio_i2c_info(
 	return BP_RESULT_OK;
 }
 
+static struct atom_hpd_int_record *get_hpd_record_for_path_v3(
+	struct bios_parser *bp,
+	struct atom_display_object_path_v3 *object)
+{
+	struct atom_common_record_header *header;
+	uint32_t offset;
+
+	if (!object) {
+		BREAK_TO_DEBUGGER(); /* Invalid object */
+		return NULL;
+	}
+
+	offset = object->disp_recordoffset + bp->object_info_tbl_offset;
+
+	for (;;) {
+		header = GET_IMAGE(struct atom_common_record_header, offset);
+
+		if (!header)
+			return NULL;
+
+		if (header->record_type == ATOM_RECORD_END_TYPE ||
+			!header->record_size)
+			break;
+
+		if (header->record_type == ATOM_HPD_INT_RECORD_TYPE
+			&& sizeof(struct atom_hpd_int_record) <=
+							header->record_size)
+			return (struct atom_hpd_int_record *) header;
+
+		offset += header->record_size;
+	}
+
+	return NULL;
+}
+
 static enum bp_result bios_parser_get_hpd_info(
 	struct dc_bios *dcb,
 	struct graphics_object_id id,
@@ -428,17 +596,32 @@ static enum bp_result bios_parser_get_hpd_info(
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 	struct atom_display_object_path_v2 *object;
+	struct atom_display_object_path_v3 *object_path_v3;
 	struct atom_hpd_int_record *record = NULL;
 
 	if (!info)
 		return BP_RESULT_BADINPUT;
 
-	object = get_bios_object(bp, id);
+	switch (bp->object_info_tbl.revision.minor) {
+	    case 4:
+	    default:
+	        object = get_bios_object(bp, id);
 
-	if (!object)
-		return BP_RESULT_BADINPUT;
+			if (!object)
+				return BP_RESULT_BADINPUT;
+
+	        record = get_hpd_record(bp, object);
+
+	        break;
+	    case 5:
+		object_path_v3 = get_bios_object_from_path_v3(bp, id);
 
-	record = get_hpd_record(bp, object);
+		if (!object_path_v3)
+			return BP_RESULT_BADINPUT;
+
+		record = get_hpd_record_for_path_v3(bp, object_path_v3);
+		break;
+	}
 
 	if (record != NULL) {
 		info->hpd_int_gpio_uid = record->pin_id;
@@ -526,25 +709,9 @@ static enum bp_result bios_parser_get_gpio_pin_info(
 		return BP_RESULT_UNSUPPORTED;
 
 	/* Temporary hard code gpio pin info */
-#if defined(FOR_SIMNOW_BOOT)
-	{
-		struct  atom_gpio_pin_assignment  gpio_pin[8] = {
-				{0x5db5, 0, 0, 1, 0},
-				{0x5db5, 8, 8, 2, 0},
-				{0x5db5, 0x10, 0x10, 3, 0},
-				{0x5db5, 0x18, 0x14, 4, 0},
-				{0x5db5, 0x1A, 0x18, 5, 0},
-				{0x5db5, 0x1C, 0x1C, 6, 0},
-		};
-
-		count = 6;
-		memmove(header->gpio_pin, gpio_pin, sizeof(gpio_pin));
-	}
-#else
 	count = (le16_to_cpu(header->table_header.structuresize)
 			- sizeof(struct atom_common_table_header))
 				/ sizeof(struct atom_gpio_pin_assignment);
-#endif
 	for (i = 0; i < count; ++i) {
 		if (header->gpio_pin[i].gpio_id != gpio_id)
 			continue;
@@ -633,19 +800,37 @@ static enum bp_result bios_parser_get_device_tag(
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 	struct atom_display_object_path_v2 *object;
 
+	struct atom_display_object_path_v3 *object_path_v3;
+
+
 	if (!info)
 		return BP_RESULT_BADINPUT;
 
-	/* getBiosObject will return MXM object */
-	object = get_bios_object(bp, connector_object_id);
+	switch (bp->object_info_tbl.revision.minor) {
+	    case 4:
+	    default:
+	        /* getBiosObject will return MXM object */
+	        object = get_bios_object(bp, connector_object_id);
 
-	if (!object) {
-		BREAK_TO_DEBUGGER(); /* Invalid object id */
-		return BP_RESULT_BADINPUT;
-	}
+			if (!object) {
+				BREAK_TO_DEBUGGER(); /* Invalid object id */
+				return BP_RESULT_BADINPUT;
+			}
 
-	info->acpi_device = 0; /* BIOS no longer provides this */
-	info->dev_id = device_type_from_device_id(object->device_tag);
+	        info->acpi_device = 0; /* BIOS no longer provides this */
+	        info->dev_id = device_type_from_device_id(object->device_tag);
+	        break;
+	    case 5:
+		object_path_v3 = get_bios_object_from_path_v3(bp, connector_object_id);
+
+		if (!object_path_v3) {
+			BREAK_TO_DEBUGGER(); /* Invalid object id */
+			return BP_RESULT_BADINPUT;
+		}
+		info->acpi_device = 0; /* BIOS no longer provides this */
+		info->dev_id = device_type_from_device_id(object_path_v3->device_tag);
+		break;
+	}
 
 	return BP_RESULT_OK;
 }
@@ -803,6 +988,71 @@ static enum bp_result get_ss_info_v4_2(
 	return result;
 }
 
+static enum bp_result get_ss_info_v4_5(
+	struct bios_parser *bp,
+	uint32_t id,
+	uint32_t index,
+	struct spread_spectrum_info *ss_info)
+{
+	enum bp_result result = BP_RESULT_OK;
+	struct atom_display_controller_info_v4_5 *disp_cntl_tbl = NULL;
+
+	if (!ss_info)
+		return BP_RESULT_BADINPUT;
+
+	if (!DATA_TABLES(dce_info))
+		return BP_RESULT_BADBIOSTABLE;
+
+	disp_cntl_tbl =  GET_IMAGE(struct atom_display_controller_info_v4_5,
+							DATA_TABLES(dce_info));
+	if (!disp_cntl_tbl)
+		return BP_RESULT_BADBIOSTABLE;
+
+	ss_info->type.STEP_AND_DELAY_INFO = false;
+	ss_info->spread_percentage_divider = 1000;
+	/* BIOS no longer uses target clock.  Always enable for now */
+	ss_info->target_clock_range = 0xffffffff;
+
+	switch (id) {
+	case AS_SIGNAL_TYPE_DVI:
+		ss_info->spread_spectrum_percentage =
+				disp_cntl_tbl->dvi_ss_percentage;
+		ss_info->spread_spectrum_range =
+				disp_cntl_tbl->dvi_ss_rate_10hz * 10;
+		if (disp_cntl_tbl->dvi_ss_mode & ATOM_SS_CENTRE_SPREAD_MODE)
+			ss_info->type.CENTER_MODE = true;
+		break;
+	case AS_SIGNAL_TYPE_HDMI:
+		ss_info->spread_spectrum_percentage =
+				disp_cntl_tbl->hdmi_ss_percentage;
+		ss_info->spread_spectrum_range =
+				disp_cntl_tbl->hdmi_ss_rate_10hz * 10;
+		if (disp_cntl_tbl->hdmi_ss_mode & ATOM_SS_CENTRE_SPREAD_MODE)
+			ss_info->type.CENTER_MODE = true;
+		break;
+	case AS_SIGNAL_TYPE_DISPLAY_PORT:
+		ss_info->spread_spectrum_percentage =
+				disp_cntl_tbl->dp_ss_percentage;
+		ss_info->spread_spectrum_range =
+				disp_cntl_tbl->dp_ss_rate_10hz * 10;
+		if (disp_cntl_tbl->dp_ss_mode & ATOM_SS_CENTRE_SPREAD_MODE)
+			ss_info->type.CENTER_MODE = true;
+		break;
+	case AS_SIGNAL_TYPE_GPU_PLL:
+		/* atom_smu_info_v4_0 does not have fields for SS for SMU Display PLL anymore.
+		 * SMU Display PLL supposed to be without spread.
+		 * Better place for it would be in atom_display_controller_info_v4_5 table.
+		 */
+		result = BP_RESULT_UNSUPPORTED;
+		break;
+	default:
+		result = BP_RESULT_UNSUPPORTED;
+		break;
+	}
+
+	return result;
+}
+
 /**
  * bios_parser_get_spread_spectrum_info
  * Get spread spectrum information from the ASIC_InternalSS_Info(ver 2.1 or
@@ -847,6 +1097,9 @@ static enum bp_result bios_parser_get_spread_spectrum_info(
 		case 3:
 		case 4:
 			return get_ss_info_v4_2(bp, signal, index, ss_info);
+		case 5:
+			return get_ss_info_v4_5(bp, signal, index, ss_info);
+
 		default:
 			ASSERT(0);
 			break;
@@ -887,6 +1140,31 @@ static enum bp_result get_soc_bb_info_v4_4(
 	return result;
 }
 
+static enum bp_result get_soc_bb_info_v4_5(
+	struct bios_parser *bp,
+	struct bp_soc_bb_info *soc_bb_info)
+{
+	enum bp_result result = BP_RESULT_OK;
+	struct atom_display_controller_info_v4_5 *disp_cntl_tbl = NULL;
+
+	if (!soc_bb_info)
+		return BP_RESULT_BADINPUT;
+
+	if (!DATA_TABLES(dce_info))
+		return BP_RESULT_BADBIOSTABLE;
+
+	disp_cntl_tbl =  GET_IMAGE(struct atom_display_controller_info_v4_5,
+							DATA_TABLES(dce_info));
+	if (!disp_cntl_tbl)
+		return BP_RESULT_BADBIOSTABLE;
+
+	soc_bb_info->dram_clock_change_latency_100ns = disp_cntl_tbl->max_mclk_chg_lat;
+	soc_bb_info->dram_sr_enter_exit_latency_100ns = disp_cntl_tbl->max_sr_enter_exit_lat;
+	soc_bb_info->dram_sr_exit_latency_100ns = disp_cntl_tbl->max_sr_exit_lat;
+
+	return result;
+}
+
 static enum bp_result bios_parser_get_soc_bb_info(
 	struct dc_bios *dcb,
 	struct bp_soc_bb_info *soc_bb_info)
@@ -916,6 +1194,9 @@ static enum bp_result bios_parser_get_soc_bb_info(
 		case 4:
 			result = get_soc_bb_info_v4_4(bp, soc_bb_info);
 			break;
+		case 5:
+			result = get_soc_bb_info_v4_5(bp, soc_bb_info);
+			break;
 		default:
 			break;
 		}
@@ -1023,6 +1304,30 @@ static enum bp_result get_disp_caps_v4_4(
 	return result;
 }
 
+static enum bp_result get_disp_caps_v4_5(
+	struct bios_parser *bp,
+	uint8_t *dce_caps)
+{
+	enum bp_result result = BP_RESULT_OK;
+	struct atom_display_controller_info_v4_5 *disp_cntl_tbl = NULL;
+
+	if (!dce_caps)
+		return BP_RESULT_BADINPUT;
+
+	if (!DATA_TABLES(dce_info))
+		return BP_RESULT_BADBIOSTABLE;
+
+	disp_cntl_tbl = GET_IMAGE(struct atom_display_controller_info_v4_5,
+							DATA_TABLES(dce_info));
+
+	if (!disp_cntl_tbl)
+		return BP_RESULT_BADBIOSTABLE;
+
+	*dce_caps = disp_cntl_tbl->display_caps;
+
+	return result;
+}
+
 static enum bp_result bios_parser_get_lttpr_interop(
 	struct dc_bios *dcb,
 	uint8_t *dce_caps)
@@ -1057,6 +1362,11 @@ static enum bp_result bios_parser_get_lttpr_interop(
 			result = get_disp_caps_v4_4(bp, dce_caps);
 			*dce_caps = !!(*dce_caps & DCE_INFO_CAPS_VBIOS_LTTPR_TRANSPARENT_ENABLE);
 			break;
+		case 5:
+			result = get_disp_caps_v4_5(bp, dce_caps);
+			*dce_caps = !!(*dce_caps & DCE_INFO_CAPS_VBIOS_LTTPR_TRANSPARENT_ENABLE);
+			break;
+
 		default:
 			break;
 		}
@@ -1102,6 +1412,10 @@ static enum bp_result bios_parser_get_lttpr_caps(
 			result = get_disp_caps_v4_4(bp, dce_caps);
 			*dce_caps = !!(*dce_caps & DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE);
 			break;
+		case 5:
+			result = get_disp_caps_v4_5(bp, dce_caps);
+			*dce_caps = !!(*dce_caps & DCE_INFO_CAPS_LTTPR_SUPPORT_ENABLE);
+
 		default:
 			break;
 		}
@@ -1218,7 +1532,6 @@ static enum bp_result bios_parser_get_embedded_panel_info(
 		default:
 			break;
 		}
-		break;
 	default:
 		break;
 	}
@@ -1274,8 +1587,17 @@ static bool bios_parser_is_device_id_supported(
 
 	uint32_t mask = get_support_mask_for_device_id(id);
 
-	return (le16_to_cpu(bp->object_info_tbl.v1_4->supporteddevices) &
-								mask) != 0;
+	switch (bp->object_info_tbl.revision.minor) {
+	    case 4:
+	    default:
+	        return (le16_to_cpu(bp->object_info_tbl.v1_4->supporteddevices) & mask) != 0;
+			break;
+	    case 5:
+			return (le16_to_cpu(bp->object_info_tbl.v1_5->supporteddevices) & mask) != 0;
+			break;
+	}
+
+    return false;
 }
 
 static uint32_t bios_parser_get_ss_entry_number(
@@ -1408,12 +1730,21 @@ static void bios_parser_set_scratch_critical_state(
 	bios_set_scratch_critical_state(dcb, state);
 }
 
+struct atom_dig_transmitter_info_header_v5_3 {
+    struct atom_common_table_header table_header;
+    uint16_t dpphy_hdmi_settings_offset;
+    uint16_t dpphy_dvi_settings_offset;
+    uint16_t dpphy_dp_setting_table_offset;
+    uint16_t uniphy_xbar_settings_v2_table_offset;
+    uint16_t dpphy_internal_reg_overide_offset;
+};
+
 static enum bp_result bios_parser_get_firmware_info(
 	struct dc_bios *dcb,
 	struct dc_firmware_info *info)
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	enum bp_result result = BP_RESULT_BADBIOSTABLE;
+	static enum bp_result result = BP_RESULT_BADBIOSTABLE;
 	struct atom_common_table_header *header;
 
 	struct atom_data_revision revision;
@@ -1590,6 +1921,11 @@ static enum bp_result get_firmware_info_v3_4(
 	struct atom_data_revision revision;
 	struct atom_display_controller_info_v4_1 *dce_info_v4_1 = NULL;
 	struct atom_display_controller_info_v4_4 *dce_info_v4_4 = NULL;
+
+	struct atom_smu_info_v3_5 *smu_info_v3_5 = NULL;
+	struct atom_display_controller_info_v4_5 *dce_info_v4_5 = NULL;
+	struct atom_smu_info_v4_0 *smu_info_v4_0 = NULL;
+
 	if (!info)
 		return BP_RESULT_BADINPUT;
 
@@ -1609,6 +1945,22 @@ static enum bp_result get_firmware_info_v3_4(
 	switch (revision.major) {
 	case 4:
 		switch (revision.minor) {
+		case 5:
+			dce_info_v4_5 = GET_IMAGE(struct atom_display_controller_info_v4_5,
+							DATA_TABLES(dce_info));
+
+			if (!dce_info_v4_5)
+				return BP_RESULT_BADBIOSTABLE;
+
+			 /* 100MHz expected */
+			info->pll_info.crystal_frequency = dce_info_v4_5->dce_refclk_10khz * 10;
+			info->dp_phy_ref_clk             = dce_info_v4_5->dpphy_refclk_10khz * 10;
+			 /* 50MHz expected */
+			info->i2c_engine_ref_clk         = dce_info_v4_5->i2c_engine_refclk_10khz * 10;
+
+			/* For DCN32/321 Display PLL VCO Frequency from dce_info_v4_5 may not be reliable */
+			break;
+
 		case 4:
 			dce_info_v4_4 = GET_IMAGE(struct atom_display_controller_info_v4_4,
 							DATA_TABLES(dce_info));
@@ -1650,6 +2002,45 @@ static enum bp_result get_firmware_info_v3_4(
 					DATA_TABLES(smu_info));
 	get_atom_data_table_revision(header, &revision);
 
+	switch (revision.major) {
+	case 3:
+		switch (revision.minor) {
+		case 5:
+			smu_info_v3_5 = GET_IMAGE(struct atom_smu_info_v3_5,
+							DATA_TABLES(smu_info));
+
+			if (!smu_info_v3_5)
+				return BP_RESULT_BADBIOSTABLE;
+
+			info->default_engine_clk = smu_info_v3_5->bootup_dcefclk_10khz * 10;
+			break;
+
+		default:
+			break;
+		}
+		break;
+
+	case 4:
+		switch (revision.minor) {
+		case 0:
+			smu_info_v4_0 = GET_IMAGE(struct atom_smu_info_v4_0,
+							DATA_TABLES(smu_info));
+
+			if (!smu_info_v4_0)
+				return BP_RESULT_BADBIOSTABLE;
+
+			/* For DCN32/321 bootup DCFCLK from smu_info_v4_0 may not be reliable */
+			break;
+
+		default:
+			break;
+		}
+		break;
+
+	default:
+		break;
+	}
+
 	 // We need to convert from 10KHz units into KHz units.
 	info->default_memory_clk = firmware_info->bootup_mclk_in10khz * 10;
 
@@ -1675,6 +2066,12 @@ static enum bp_result bios_parser_get_encoder_cap_info(
 	if (!info)
 		return BP_RESULT_BADINPUT;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	/* encoder cap record not available in v1_5 */
+	if (bp->object_info_tbl.revision.minor == 5)
+		return BP_RESULT_NORECORD;
+#endif
+
 	object = get_bios_object(bp, object_id);
 
 	if (!object)
@@ -1781,6 +2178,42 @@ static struct atom_disp_connector_caps_record *get_disp_connector_caps_record(
 	return NULL;
 }
 
+static struct atom_connector_caps_record *get_connector_caps_record(
+	struct bios_parser *bp,
+	struct atom_display_object_path_v3 *object)
+{
+	struct atom_common_record_header *header;
+	uint32_t offset;
+
+	if (!object) {
+		BREAK_TO_DEBUGGER(); /* Invalid object */
+		return NULL;
+	}
+
+	offset = object->disp_recordoffset + bp->object_info_tbl_offset;
+
+	for (;;) {
+		header = GET_IMAGE(struct atom_common_record_header, offset);
+
+		if (!header)
+			return NULL;
+
+		offset += header->record_size;
+
+		if (header->record_type == ATOM_RECORD_END_TYPE ||
+				!header->record_size)
+			break;
+
+		if (header->record_type != ATOM_CONNECTOR_CAP_RECORD_TYPE)
+			continue;
+
+		if (sizeof(struct atom_connector_caps_record) <= header->record_size)
+			return (struct atom_connector_caps_record *)header;
+	}
+
+	return NULL;
+}
+
 static enum bp_result bios_parser_get_disp_connector_caps_info(
 	struct dc_bios *dcb,
 	struct graphics_object_id object_id,
@@ -1788,25 +2221,116 @@ static enum bp_result bios_parser_get_disp_connector_caps_info(
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
 	struct atom_display_object_path_v2 *object;
+
+	struct atom_display_object_path_v3 *object_path_v3;
+	struct atom_connector_caps_record *record_path_v3;
+
 	struct atom_disp_connector_caps_record *record = NULL;
 
 	if (!info)
 		return BP_RESULT_BADINPUT;
 
-	object = get_bios_object(bp, object_id);
+	switch (bp->object_info_tbl.revision.minor) {
+	    case 4:
+	    default:
+		    object = get_bios_object(bp, object_id);
 
-	if (!object)
+		    if (!object)
+			    return BP_RESULT_BADINPUT;
+
+		    record = get_disp_connector_caps_record(bp, object);
+		    if (!record)
+			    return BP_RESULT_NORECORD;
+
+		    info->INTERNAL_DISPLAY =
+			    (record->connectcaps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY) ? 1 : 0;
+		    info->INTERNAL_DISPLAY_BL =
+			    (record->connectcaps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY_BL) ? 1 : 0;
+		    break;
+	    case 5:
+		object_path_v3 = get_bios_object_from_path_v3(bp, object_id);
+
+		if (!object_path_v3)
+			return BP_RESULT_BADINPUT;
+
+		record_path_v3 = get_connector_caps_record(bp, object_path_v3);
+		if (!record_path_v3)
+			return BP_RESULT_NORECORD;
+
+		info->INTERNAL_DISPLAY = (record_path_v3->connector_caps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY)
+									? 1 : 0;
+		info->INTERNAL_DISPLAY_BL = (record_path_v3->connector_caps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY_BL)
+										? 1 : 0;
+		break;
+	}
+
+	return BP_RESULT_OK;
+}
+
+static struct atom_connector_speed_record *get_connector_speed_cap_record(
+	struct bios_parser *bp,
+	struct atom_display_object_path_v3 *object)
+{
+	struct atom_common_record_header *header;
+	uint32_t offset;
+
+	if (!object) {
+		BREAK_TO_DEBUGGER(); /* Invalid object */
+		return NULL;
+	}
+
+	offset = object->disp_recordoffset + bp->object_info_tbl_offset;
+
+	for (;;) {
+		header = GET_IMAGE(struct atom_common_record_header, offset);
+
+		if (!header)
+			return NULL;
+
+		offset += header->record_size;
+
+		if (header->record_type == ATOM_RECORD_END_TYPE ||
+				!header->record_size)
+			break;
+
+		if (header->record_type != ATOM_CONNECTOR_SPEED_UPTO)
+			continue;
+
+		if (sizeof(struct atom_connector_speed_record) <= header->record_size)
+			return (struct atom_connector_speed_record *)header;
+	}
+
+	return NULL;
+}
+
+static enum bp_result bios_parser_get_connector_speed_cap_info(
+	struct dc_bios *dcb,
+	struct graphics_object_id object_id,
+	struct bp_connector_speed_cap_info *info)
+{
+	struct bios_parser *bp = BP_FROM_DCB(dcb);
+	struct atom_display_object_path_v3 *object_path_v3;
+	//struct atom_connector_speed_record *record = NULL;
+	struct atom_connector_speed_record *record;
+
+	if (!info)
+		return BP_RESULT_BADINPUT;
+
+	object_path_v3 = get_bios_object_from_path_v3(bp, object_id);
+
+	if (!object_path_v3)
 		return BP_RESULT_BADINPUT;
 
-	record = get_disp_connector_caps_record(bp, object);
+	record = get_connector_speed_cap_record(bp, object_path_v3);
 	if (!record)
 		return BP_RESULT_NORECORD;
 
-	info->INTERNAL_DISPLAY = (record->connectcaps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY)
-									? 1 : 0;
-	info->INTERNAL_DISPLAY_BL = (record->connectcaps & ATOM_CONNECTOR_CAP_INTERNAL_DISPLAY_BL)
-											? 1 : 0;
-
+	info->DP_HBR2_EN = (record->connector_max_speed >= 5400) ? 1 : 0;
+	info->DP_HBR3_EN = (record->connector_max_speed >= 8100) ? 1 : 0;
+	info->HDMI_6GB_EN = (record->connector_max_speed >= 5940) ? 1 : 0;
+	info->DP_UHBR10_EN = (record->connector_max_speed >= 10000) ? 1 : 0;
+	info->DP_UHBR13_5_EN = (record->connector_max_speed >= 13500) ? 1 : 0;
+	info->DP_UHBR20_EN = (record->connector_max_speed >= 20000) ? 1 : 0;
 	return BP_RESULT_OK;
 }
 
@@ -1815,7 +2339,7 @@ static enum bp_result get_vram_info_v23(
 	struct dc_vram_info *info)
 {
 	struct atom_vram_info_header_v2_3 *info_v23;
-	enum bp_result result = BP_RESULT_OK;
+	static enum bp_result result = BP_RESULT_OK;
 
 	info_v23 = GET_IMAGE(struct atom_vram_info_header_v2_3,
 						DATA_TABLES(vram_info));
@@ -1834,7 +2358,7 @@ static enum bp_result get_vram_info_v24(
 	struct dc_vram_info *info)
 {
 	struct atom_vram_info_header_v2_4 *info_v24;
-	enum bp_result result = BP_RESULT_OK;
+	static enum bp_result result = BP_RESULT_OK;
 
 	info_v24 = GET_IMAGE(struct atom_vram_info_header_v2_4,
 						DATA_TABLES(vram_info));
@@ -1853,7 +2377,7 @@ static enum bp_result get_vram_info_v25(
 	struct dc_vram_info *info)
 {
 	struct atom_vram_info_header_v2_5 *info_v25;
-	enum bp_result result = BP_RESULT_OK;
+	static enum bp_result result = BP_RESULT_OK;
 
 	info_v25 = GET_IMAGE(struct atom_vram_info_header_v2_5,
 						DATA_TABLES(vram_info));
@@ -1878,7 +2402,7 @@ static enum bp_result get_vram_info_v25(
  * integrated_info *info - [out] store and output integrated info
  *
  * @return
- * enum bp_result - BP_RESULT_OK if information is available,
+ * static enum bp_result - BP_RESULT_OK if information is available,
  *                  BP_RESULT_BADBIOSTABLE otherwise.
  */
 static enum bp_result get_integrated_info_v11(
@@ -2369,17 +2893,19 @@ static enum bp_result get_integrated_info_v2_2(
  * integrated_info *info - [out] store and output integrated info
  *
  * @return
- * enum bp_result - BP_RESULT_OK if information is available,
+ * static enum bp_result - BP_RESULT_OK if information is available,
  *                  BP_RESULT_BADBIOSTABLE otherwise.
  */
 static enum bp_result construct_integrated_info(
 	struct bios_parser *bp,
 	struct integrated_info *info)
 {
-	enum bp_result result = BP_RESULT_BADBIOSTABLE;
+	static enum bp_result result = BP_RESULT_BADBIOSTABLE;
 
 	struct atom_common_table_header *header;
 	struct atom_data_revision revision;
+
+	struct clock_voltage_caps temp = {0, 0};
 	uint32_t i;
 	uint32_t j;
 
@@ -2427,8 +2953,10 @@ static enum bp_result construct_integrated_info(
 				info->disp_clk_voltage[j-1].max_supported_clk
 				) {
 				/* swap j and j - 1*/
-				swap(info->disp_clk_voltage[j - 1],
-				     info->disp_clk_voltage[j]);
+				temp = info->disp_clk_voltage[j-1];
+				info->disp_clk_voltage[j-1] =
+					info->disp_clk_voltage[j];
+				info->disp_clk_voltage[j] = temp;
 			}
 		}
 	}
@@ -2441,7 +2969,7 @@ static enum bp_result bios_parser_get_vram_info(
 		struct dc_vram_info *info)
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	enum bp_result result = BP_RESULT_BADBIOSTABLE;
+	static enum bp_result result = BP_RESULT_BADBIOSTABLE;
 	struct atom_common_table_header *header;
 	struct atom_data_revision revision;
 
@@ -2507,7 +3035,7 @@ static enum bp_result update_slot_layout_info(
 	struct atom_display_object_path_v2 *object;
 	struct atom_bracket_layout_record *record;
 	struct atom_common_record_header *record_header;
-	enum bp_result result;
+	static enum bp_result result;
 	struct bios_parser *bp;
 	struct object_info_table *tbl;
 	struct display_object_info_table_v1_4 *v1_4;
@@ -2613,6 +3141,104 @@ static enum bp_result update_slot_layout_info(
 	return result;
 }
 
+static enum bp_result update_slot_layout_info_v2(
+	struct dc_bios *dcb,
+	unsigned int i,
+	struct slot_layout_info *slot_layout_info)
+{
+	unsigned int record_offset;
+	struct atom_display_object_path_v3 *object;
+	struct atom_bracket_layout_record_v2 *record;
+	struct atom_common_record_header *record_header;
+	static enum bp_result result;
+	struct bios_parser *bp;
+	struct object_info_table *tbl;
+	struct display_object_info_table_v1_5 *v1_5;
+	struct graphics_object_id connector_id;
+
+	record = NULL;
+	record_header = NULL;
+	result = BP_RESULT_NORECORD;
+
+	bp = BP_FROM_DCB(dcb);
+	tbl = &bp->object_info_tbl;
+	v1_5 = tbl->v1_5;
+
+	object = &v1_5->display_path[i];
+	record_offset = (unsigned int)
+		(object->disp_recordoffset) +
+		(unsigned int)(bp->object_info_tbl_offset);
+
+	for (;;) {
+
+		record_header = (struct atom_common_record_header *)
+			GET_IMAGE(struct atom_common_record_header,
+			record_offset);
+		if (record_header == NULL) {
+			result = BP_RESULT_BADBIOSTABLE;
+			break;
+		}
+
+		/* the end of the list */
+		if (record_header->record_type == ATOM_RECORD_END_TYPE ||
+			record_header->record_size == 0)	{
+			break;
+		}
+
+		if (record_header->record_type ==
+			ATOM_BRACKET_LAYOUT_V2_RECORD_TYPE &&
+			sizeof(struct atom_bracket_layout_record_v2)
+			<= record_header->record_size) {
+			record = (struct atom_bracket_layout_record_v2 *)
+				(record_header);
+			result = BP_RESULT_OK;
+			break;
+		}
+
+		record_offset += record_header->record_size;
+	}
+
+	/* return if the record not found */
+	if (result != BP_RESULT_OK)
+		return result;
+
+	/* get slot sizes */
+	connector_id = object_id_from_bios_object_id(object->display_objid);
+
+	slot_layout_info->length = record->bracketlen;
+	slot_layout_info->width = record->bracketwidth;
+	slot_layout_info->num_of_connectors = v1_5->number_of_path;
+	slot_layout_info->connectors[i].position = record->conn_num;
+	slot_layout_info->connectors[i].connector_id = connector_id;
+
+	switch (connector_id.id) {
+	case CONNECTOR_ID_SINGLE_LINK_DVID:
+	case CONNECTOR_ID_DUAL_LINK_DVID:
+		slot_layout_info->connectors[i].connector_type = CONNECTOR_LAYOUT_TYPE_DVI_D;
+		slot_layout_info->connectors[i].length = CONNECTOR_SIZE_DVI;
+		break;
+
+	case CONNECTOR_ID_HDMI_TYPE_A:
+		slot_layout_info->connectors[i].connector_type = CONNECTOR_LAYOUT_TYPE_HDMI;
+		slot_layout_info->connectors[i].length = CONNECTOR_SIZE_HDMI;
+		break;
+
+	case CONNECTOR_ID_DISPLAY_PORT:
+		if (record->mini_type == MINI_TYPE_NORMAL) {
+			slot_layout_info->connectors[i].connector_type = CONNECTOR_LAYOUT_TYPE_DP;
+			slot_layout_info->connectors[i].length = CONNECTOR_SIZE_DP;
+		} else {
+			slot_layout_info->connectors[i].connector_type = CONNECTOR_LAYOUT_TYPE_MINI_DP;
+			slot_layout_info->connectors[i].length = CONNECTOR_SIZE_MINI_DP;
+		}
+		break;
+
+	default:
+		slot_layout_info->connectors[i].connector_type = CONNECTOR_LAYOUT_TYPE_UNKNOWN;
+		slot_layout_info->connectors[i].length = CONNECTOR_SIZE_UNKNOWN;
+	}
+	return result;
+}
 
 static enum bp_result get_bracket_layout_record(
 	struct dc_bios *dcb,
@@ -2621,9 +3247,10 @@ static enum bp_result get_bracket_layout_record(
 {
 	unsigned int i;
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	enum bp_result result;
+	static enum bp_result result;
 	struct object_info_table *tbl;
 	struct display_object_info_table_v1_4 *v1_4;
+    struct display_object_info_table_v1_5 *v1_5;
 
 	if (slot_layout_info == NULL) {
 		DC_LOG_DETECTION_EDID_PARSER("Invalid slot_layout_info\n");
@@ -2633,14 +3260,21 @@ static enum bp_result get_bracket_layout_record(
 	v1_4 = tbl->v1_4;
 
 	result = BP_RESULT_NORECORD;
-	for (i = 0; i < v1_4->number_of_path; ++i)	{
-
-		if (bracket_layout_id ==
-			v1_4->display_path[i].display_objid) {
-			result = update_slot_layout_info(dcb, i,
-				slot_layout_info);
+	switch (bp->object_info_tbl.revision.minor) {
+		case 4:
+		default:
+			for (i = 0; i < v1_4->number_of_path; ++i)	{
+				if (bracket_layout_id ==
+					v1_4->display_path[i].display_objid) {
+					result = update_slot_layout_info(dcb, i, slot_layout_info);
+					break;
+				}
+			}
+		    break;
+		case 5:
+			for (i = 0; i < v1_5->number_of_path; ++i)
+				result = update_slot_layout_info_v2(dcb, i, slot_layout_info);
 			break;
-		}
 	}
 	return result;
 }
@@ -2650,7 +3284,10 @@ static enum bp_result bios_get_board_layout_info(
 	struct board_layout_info *board_layout_info)
 {
 	unsigned int i;
-	enum bp_result record_result;
+
+	struct bios_parser *bp;
+
+	static enum bp_result record_result;
 
 	const unsigned int slot_index_to_vbios_id[MAX_BOARD_SLOTS] = {
 		GENERICOBJECT_BRACKET_LAYOUT_ENUM_ID1,
@@ -2658,6 +3295,9 @@ static enum bp_result bios_get_board_layout_info(
 		0, 0
 	};
 
+
+	bp = BP_FROM_DCB(dcb);
+
 	if (board_layout_info == NULL) {
 		DC_LOG_DETECTION_EDID_PARSER("Invalid board_layout_info\n");
 		return BP_RESULT_BADINPUT;
@@ -2692,99 +3332,6 @@ static uint16_t bios_parser_pack_data_tables(
 	struct dc_bios *dcb,
 	void *dst)
 {
-#ifdef PACK_BIOS_DATA
-	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	struct atom_rom_header_v2_2 *rom_header = NULL;
-	struct atom_rom_header_v2_2 *packed_rom_header = NULL;
-	struct atom_common_table_header *data_tbl_header = NULL;
-	struct atom_master_list_of_data_tables_v2_1 *data_tbl_list = NULL;
-	struct atom_master_data_table_v2_1 *packed_master_data_tbl = NULL;
-	struct atom_data_revision tbl_rev = {0};
-	uint16_t *rom_header_offset = NULL;
-	const uint8_t *bios = bp->base.bios;
-	uint8_t *bios_dst = (uint8_t *)dst;
-	uint16_t packed_rom_header_offset;
-	uint16_t packed_masterdatatable_offset;
-	uint16_t packed_data_tbl_offset;
-	uint16_t data_tbl_offset;
-	unsigned int i;
-
-	rom_header_offset =
-		GET_IMAGE(uint16_t, OFFSET_TO_ATOM_ROM_HEADER_POINTER);
-
-	if (!rom_header_offset)
-		return 0;
-
-	rom_header = GET_IMAGE(struct atom_rom_header_v2_2, *rom_header_offset);
-
-	if (!rom_header)
-		return 0;
-
-	get_atom_data_table_revision(&rom_header->table_header, &tbl_rev);
-	if (!(tbl_rev.major >= 2 && tbl_rev.minor >= 2))
-		return 0;
-
-	get_atom_data_table_revision(&bp->master_data_tbl->table_header, &tbl_rev);
-	if (!(tbl_rev.major >= 2 && tbl_rev.minor >= 1))
-		return 0;
-
-	packed_rom_header_offset =
-		OFFSET_TO_ATOM_ROM_HEADER_POINTER + sizeof(*rom_header_offset);
-
-	packed_masterdatatable_offset =
-		packed_rom_header_offset + rom_header->table_header.structuresize;
-
-	packed_data_tbl_offset =
-		packed_masterdatatable_offset +
-		bp->master_data_tbl->table_header.structuresize;
-
-	packed_rom_header =
-		(struct atom_rom_header_v2_2 *)(bios_dst + packed_rom_header_offset);
-
-	packed_master_data_tbl =
-		(struct atom_master_data_table_v2_1 *)(bios_dst +
-		packed_masterdatatable_offset);
-
-	memcpy(bios_dst, bios, OFFSET_TO_ATOM_ROM_HEADER_POINTER);
-
-	*((uint16_t *)(bios_dst + OFFSET_TO_ATOM_ROM_HEADER_POINTER)) =
-		packed_rom_header_offset;
-
-	memcpy(bios_dst + packed_rom_header_offset, rom_header,
-		rom_header->table_header.structuresize);
-
-	packed_rom_header->masterdatatable_offset = packed_masterdatatable_offset;
-
-	memcpy(&packed_master_data_tbl->table_header,
-		&bp->master_data_tbl->table_header,
-		sizeof(bp->master_data_tbl->table_header));
-
-	data_tbl_list = &bp->master_data_tbl->listOfdatatables;
-
-	/* Each data table offset in data table list is 2 bytes,
-	 * we can use that to iterate through listOfdatatables
-	 * without knowing the name of each member.
-	 */
-	for (i = 0; i < sizeof(*data_tbl_list)/sizeof(uint16_t); i++) {
-		data_tbl_offset = *((uint16_t *)data_tbl_list + i);
-
-		if (data_tbl_offset) {
-			data_tbl_header =
-				(struct atom_common_table_header *)(bios + data_tbl_offset);
-
-			memcpy(bios_dst + packed_data_tbl_offset, data_tbl_header,
-				data_tbl_header->structuresize);
-
-			*((uint16_t *)&packed_master_data_tbl->listOfdatatables + i) =
-				packed_data_tbl_offset;
-
-			packed_data_tbl_offset += data_tbl_header->structuresize;
-		} else {
-			*((uint16_t *)&packed_master_data_tbl->listOfdatatables + i) = 0;
-		}
-	}
-	return packed_data_tbl_offset;
-#endif
 	// TODO: There is data bytes alignment issue, disable it for now.
 	return 0;
 }
@@ -2814,6 +3361,13 @@ static struct atom_dc_golden_table_v1 *bios_get_golden_table(
 			dc_golden_offset = DATA_TABLES(dce_info) + disp_cntl_tbl_4_4->dc_golden_table_offset;
 			*dc_golden_table_ver = disp_cntl_tbl_4_4->dc_golden_table_ver;
 			break;
+		case 5:
+		default:
+			/* For atom_display_controller_info_v4_5 there is no need to get golden table from
+			 * dc_golden_table_offset as all these fields previously in golden table used for AUX
+			 * pre-charge settings are now available directly in atom_display_controller_info_v4_5.
+			 */
+			break;
 		}
 		break;
 	}
@@ -2916,6 +3470,7 @@ static const struct dc_vbios_funcs vbios_funcs = {
 	.bios_parser_destroy = firmware_parser_destroy,
 
 	.get_board_layout_info = bios_get_board_layout_info,
+	/* TODO: use this fn in hw init?*/
 	.pack_data_tables = bios_parser_pack_data_tables,
 
 	.get_atom_dc_golden_table = bios_get_atom_dc_golden_table,
@@ -2929,6 +3484,8 @@ static const struct dc_vbios_funcs vbios_funcs = {
 	.get_lttpr_caps = bios_parser_get_lttpr_caps,
 
 	.get_lttpr_interop = bios_parser_get_lttpr_interop,
+
+	.get_connector_speed_cap_info = bios_parser_get_connector_speed_cap_info,
 };
 
 static bool bios_parser2_construct(
@@ -3002,6 +3559,16 @@ static bool bios_parser2_construct(
 			return false;
 
 		bp->object_info_tbl.v1_4 = tbl_v1_4;
+	} else if (bp->object_info_tbl.revision.major == 1
+		&& bp->object_info_tbl.revision.minor == 5) {
+		struct display_object_info_table_v1_5 *tbl_v1_5;
+
+		tbl_v1_5 = GET_IMAGE(struct display_object_info_table_v1_5,
+			bp->object_info_tbl_offset);
+		if (!tbl_v1_5)
+			return false;
+
+		bp->object_info_tbl.v1_5 = tbl_v1_5;
 	} else {
 		ASSERT(0);
 		return false;
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_types_internal2.h b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_types_internal2.h
index bf1f5c86e65c..41d02d473082 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_types_internal2.h
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_types_internal2.h
@@ -40,6 +40,7 @@ struct object_info_table {
 	struct atom_data_revision revision;
 	union {
 		struct display_object_info_table_v1_4 *v1_4;
+		struct display_object_info_table_v1_5 *v1_5;
 	};
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index f3792286f571..f22593bcb862 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -77,6 +77,8 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 	case DCN_VERSION_3_1:
 	case DCN_VERSION_3_15:
 	case DCN_VERSION_3_16:
+	case DCN_VERSION_3_2:
+	case DCN_VERSION_3_21:
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index e803e59abd56..d145dcbca778 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -328,8 +328,8 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 	    dcn32_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 	    return &clk_mgr->base;
 	    break;
-#endif
 	}
+#endif
 	default:
 		ASSERT(0); /* Unknown Asic */
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f14449401188..e3e3b2791632 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3054,11 +3054,15 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	}
 
-	if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
-		dc->hwss.interdependent_update_lock(dc, context, false);
-	} else {
-		dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
-	}
+#ifdef CONFIG_DRM_AMD_DC_DCN
+		if (update_type != UPDATE_TYPE_FAST)
+			if (dc->hwss.commit_subvp_config)
+				dc->hwss.commit_subvp_config(dc, context);
+#endif
+		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock)
+			dc->hwss.interdependent_update_lock(dc, context, false);
+		else
+			dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
 
 	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
 		if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 6774dd8bb53e..b087452e4590 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -67,6 +67,8 @@
 #include "dcn31/dcn31_resource.h"
 #include "dcn315/dcn315_resource.h"
 #include "dcn316/dcn316_resource.h"
+#include "../dcn32/dcn32_resource.h"
+#include "../dcn321/dcn321_resource.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -162,7 +164,11 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 		if (ASICREV_IS_GC_10_3_7(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_3_16;
 		break;
-
+	case AMDGPU_FAMILY_GC_11_0_0:
+		dc_version = DCN_VERSION_3_2;
+		if (ASICREV_IS_GC_11_0_2(asic_id.hw_internal_rev))
+			dc_version = DCN_VERSION_3_21;
+		break;
 	default:
 		dc_version = DCE_VERSION_UNKNOWN;
 		break;
@@ -258,6 +264,12 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_3_16:
 		res_pool = dcn316_create_resource_pool(init_data, dc);
 		break;
+	case DCN_VERSION_3_2:
+		res_pool = dcn32_create_resource_pool(init_data, dc);
+		break;
+	case DCN_VERSION_3_21:
+		res_pool = dcn321_create_resource_pool(init_data, dc);
+		break;
 #endif
 	default:
 		break;
@@ -1982,6 +1994,11 @@ enum dc_status dc_remove_stream_from_ctx(
 				dc->res_pool,
 			del_pipe->stream_res.stream_enc,
 			false);
+	/* Release link encoder from stream in new dc_state. */
+	if (dc->res_pool->funcs->link_enc_unassign)
+		dc->res_pool->funcs->link_enc_unassign(new_ctx, del_pipe->stream);
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (is_dp_128b_132b_signal(del_pipe)) {
 		update_hpo_dp_stream_engine_usage(
 			&new_ctx->res_ctx, dc->res_pool,
@@ -1989,6 +2006,7 @@ enum dc_status dc_remove_stream_from_ctx(
 			false);
 		remove_hpo_dp_link_enc_from_ctx(&new_ctx->res_ctx, del_pipe, del_pipe->stream);
 	}
+#endif
 
 	if (del_pipe->stream_res.audio)
 		update_audio_usage(
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 2eabcdef8903..b6decdf820fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -162,6 +162,10 @@ struct dc_color_caps {
 	struct mpc_color_caps mpc;
 };
 
+struct dc_dmub_caps {
+    bool psr;
+};
+
 struct dc_caps {
 	uint32_t max_streams;
 	uint32_t max_links;
@@ -196,12 +200,22 @@ struct dc_caps {
 	unsigned int cursor_cache_size;
 	struct dc_plane_cap planes[MAX_PLANES];
 	struct dc_color_caps color;
+	struct dc_dmub_caps dmub_caps;
 	bool dp_hpo;
 	bool hdmi_frl_pcon_support;
 	bool edp_dsc_support;
 	bool vbios_lttpr_aware;
 	bool vbios_lttpr_enable;
 	uint32_t max_otg_num;
+#ifdef CONFIG_DRM_AMD_DC_DCN
+	uint32_t max_cab_allocation_bytes;
+	uint32_t cache_line_size;
+	uint32_t cache_num_ways;
+	uint16_t subvp_fw_processing_delay_us;
+	uint16_t subvp_prefetch_end_to_mall_start_us;
+	uint16_t subvp_pstate_allow_width_us;
+	uint16_t subvp_vertical_int_margin_us;
+#endif
 };
 
 struct dc_bug_wa {
@@ -425,6 +439,8 @@ struct dc_clocks {
 	 */
 	bool prev_p_state_change_support;
 	bool fclk_prev_p_state_change_support;
+	int num_ways;
+	int prev_num_ways;
 	enum dtm_pstate dtm_level;
 	int max_supported_dppclk_khz;
 	int max_supported_dispclk_khz;
@@ -719,6 +735,9 @@ struct dc_debug_options {
 	bool enable_z9_disable_interface;
 	bool enable_sw_cntl_psr;
 	union dpia_debug_options dpia_debug;
+	bool force_disable_subvp;
+	bool force_subvp_mclk_switch;
+	bool force_usr_allow;
 	bool apply_vendor_specific_lttpr_wa;
 	bool extended_blank_optimization;
 	union aux_wake_wa_options aux_wake_wa;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_bios_types.h b/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
index 67abda44eb1f..260ac4458870 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_bios_types.h
@@ -156,6 +156,11 @@ struct dc_vbios_funcs {
 	enum bp_result (*get_lttpr_interop)(
 			struct dc_bios *dcb,
 			uint8_t *dce_caps);
+
+	enum bp_result (*get_connector_speed_cap_info)(
+		struct dc_bios *bios,
+		struct graphics_object_id object_id,
+		struct bp_connector_speed_cap_info *info);
 };
 
 struct bios_registers {
diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index aa7e3a07191d..d75416dc9fae 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -780,6 +780,7 @@ struct dc_crtc_timing {
 	uint32_t v_sync_width;
 
 	uint32_t pix_clk_100hz;
+	uint32_t min_refresh_in_uhz;
 
 	uint32_t vic;
 	uint32_t hdmi_vic;
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 58941f4defb3..772b4a61f166 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -145,6 +145,24 @@ struct test_pattern {
 	unsigned int cust_pattern_size;
 };
 
+#ifdef CONFIG_DRM_AMD_DC_DCN
+#define SUBVP_DRR_MARGIN_US 500 // 500us for DRR margin (SubVP + DRR)
+
+enum mall_stream_type {
+	SUBVP_NONE, // subvp not in use
+	SUBVP_MAIN, // subvp in use, this stream is main stream
+	SUBVP_PHANTOM, // subvp in use, this stream is a phantom stream
+};
+
+struct mall_stream_config {
+	/* MALL stream config to indicate if the stream is phantom or not.
+	 * We will use a phantom stream to indicate that the pipe is phantom.
+	 */
+	enum mall_stream_type type;
+	struct dc_stream_state *paired_stream;	// master / slave stream
+};
+#endif
+
 struct dc_stream_state {
 	// sink is deprecated, new code should not reference
 	// this pointer
@@ -255,6 +273,9 @@ struct dc_stream_state {
 
 	bool has_non_synchronizable_pclk;
 	bool vblank_synchronized;
+#ifdef CONFIG_DRM_AMD_DC_DCN
+	struct mall_stream_config mall_stream_config;
+#endif
 };
 
 #define ABM_LEVEL_IMMEDIATE_DISABLE 255
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
index b699d1b2ba83..e6c06325742a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.h
@@ -128,6 +128,21 @@
 	SRI(DC_ABM1_ACE_THRES_12, ABM, id), \
 	NBIO_SR(BIOS_SCRATCH_2)
 
+#define ABM_DCN32_REG_LIST(id)\
+	SRI(DC_ABM1_HG_SAMPLE_RATE, ABM, id), \
+	SRI(DC_ABM1_LS_SAMPLE_RATE, ABM, id), \
+	SRI(BL1_PWM_BL_UPDATE_SAMPLE_RATE, ABM, id), \
+	SRI(DC_ABM1_HG_MISC_CTRL, ABM, id), \
+	SRI(DC_ABM1_IPCSC_COEFF_SEL, ABM, id), \
+	SRI(BL1_PWM_CURRENT_ABM_LEVEL, ABM, id), \
+	SRI(BL1_PWM_TARGET_ABM_LEVEL, ABM, id), \
+	SRI(BL1_PWM_USER_LEVEL, ABM, id), \
+	SRI(DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, ABM, id), \
+	SRI(DC_ABM1_HGLS_REG_READ_PROGRESS, ABM, id), \
+	SRI(DC_ABM1_ACE_OFFSET_SLOPE_0, ABM, id), \
+	SRI(DC_ABM1_ACE_THRES_12, ABM, id), \
+	NBIO_SR(BIOS_SCRATCH_2)
+
 #define ABM_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
 
@@ -203,6 +218,36 @@
 
 #define ABM_MASK_SH_LIST_DCN30(mask_sh) ABM_MASK_SH_LIST_DCN10(mask_sh)
 
+#define ABM_MASK_SH_LIST_DCN32(mask_sh) \
+	ABM_SF(ABM0_DC_ABM1_HG_MISC_CTRL, \
+			ABM1_HG_NUM_OF_BINS_SEL, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_HG_MISC_CTRL, \
+			ABM1_HG_VMAX_SEL, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_HG_MISC_CTRL, \
+			ABM1_HG_BIN_BITWIDTH_SIZE_SEL, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_IPCSC_COEFF_SEL, \
+			ABM1_IPCSC_COEFF_SEL_R, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_IPCSC_COEFF_SEL, \
+			ABM1_IPCSC_COEFF_SEL_G, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_IPCSC_COEFF_SEL, \
+			ABM1_IPCSC_COEFF_SEL_B, mask_sh), \
+	ABM_SF(ABM0_BL1_PWM_CURRENT_ABM_LEVEL, \
+			BL1_PWM_CURRENT_ABM_LEVEL, mask_sh), \
+	ABM_SF(ABM0_BL1_PWM_TARGET_ABM_LEVEL, \
+			BL1_PWM_TARGET_ABM_LEVEL, mask_sh), \
+	ABM_SF(ABM0_BL1_PWM_USER_LEVEL, \
+			BL1_PWM_USER_LEVEL, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, \
+			ABM1_LS_MIN_PIXEL_VALUE_THRES, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_LS_MIN_MAX_PIXEL_VALUE_THRES, \
+			ABM1_LS_MAX_PIXEL_VALUE_THRES, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_HGLS_REG_READ_PROGRESS, \
+			ABM1_HG_REG_READ_MISSED_FRAME_CLEAR, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_HGLS_REG_READ_PROGRESS, \
+			ABM1_LS_REG_READ_MISSED_FRAME_CLEAR, mask_sh), \
+	ABM_SF(ABM0_DC_ABM1_HGLS_REG_READ_PROGRESS, \
+			ABM1_BL_REG_READ_MISSED_FRAME_CLEAR, mask_sh)
+
 #define ABM_REG_FIELD_LIST(type) \
 	type ABM1_HG_NUM_OF_BINS_SEL; \
 	type ABM1_HG_VMAX_SEL; \
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
index 9eec3524335f..e0c390fcc12c 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -164,6 +164,10 @@
 	CS_SF(PHYPLLA_PIXCLK_RESYNC_CNTL, PHYPLLA_DCCG_DEEP_COLOR_CNTL, mask_sh),\
 	CS_SF(OTG0_PIXEL_RATE_CNTL, DP_DTO0_ENABLE, mask_sh)
 
+#define CS_COMMON_MASK_SH_LIST_DCN3_2(mask_sh)\
+	CS_COMMON_MASK_SH_LIST_DCN2_0(mask_sh),\
+	CS_SF(OTG0_PIXEL_RATE_CNTL, PIPE0_DTO_SRC_SEL, mask_sh)
+
 #define CS_COMMON_REG_LIST_DCN1_0(index, pllid) \
 		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
 		SRII(PHASE, DP_DTO, 0),\
@@ -197,12 +201,23 @@
 	type DP_DTO0_MODULO; \
 	type DP_DTO0_ENABLE;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+#define CS_REG_FIELD_LIST_DCN32(type) \
+	type PIPE0_DTO_SRC_SEL;
+#endif
+
 struct dce110_clk_src_shift {
 	CS_REG_FIELD_LIST(uint8_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	CS_REG_FIELD_LIST_DCN32(uint8_t)
+#endif
 };
 
 struct dce110_clk_src_mask{
 	CS_REG_FIELD_LIST(uint32_t)
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	CS_REG_FIELD_LIST_DCN32(uint32_t)
+#endif
 };
 
 struct dce110_clk_src_regs {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
index 39485bdeb90e..e48fd044f572 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
@@ -158,8 +158,39 @@ struct dcn_hubbub_registers {
 	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C;
 	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D;
 	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D;
+	uint32_t DCHUBBUB_ARB_USR_RETRAINING_CNTL;
+	uint32_t DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A;
+	uint32_t DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B;
+	uint32_t DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C;
+	uint32_t DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D;
+	uint32_t DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A;
+	uint32_t DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B;
+	uint32_t DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C;
+	uint32_t DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D;
+	uint32_t DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A;
+	uint32_t DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B;
+	uint32_t DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C;
+	uint32_t DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D;
 };
 
+#define HUBBUB_REG_FIELD_LIST_DCN32(type) \
+		type DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_VALUE;\
+		type DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_ENABLE;\
+		type DCHUBBUB_ARB_DO_NOT_FORCE_ALLOW_USR_RETRAINING_DURING_PSTATE_CHANGE_REQUEST;\
+		type DCHUBBUB_ARB_DO_NOT_FORCE_ALLOW_USR_RETRAINING_DURING_PRE_CSTATE;\
+		type DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A;\
+		type DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B;\
+		type DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C;\
+		type DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D;\
+		type DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A;\
+		type DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B;\
+		type DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C;\
+		type DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D;\
+		type DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A;\
+		type DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B;\
+		type DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C;\
+		type DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D
+
 /* set field name */
 #define HUBBUB_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
@@ -337,6 +368,7 @@ struct dcn_hubbub_shift {
 	HUBBUB_STUTTER_REG_FIELD_LIST(uint8_t);
 	HUBBUB_HVM_REG_FIELD_LIST(uint8_t);
 	HUBBUB_RET_REG_FIELD_LIST(uint8_t);
+	HUBBUB_REG_FIELD_LIST_DCN32(uint8_t);
 };
 
 struct dcn_hubbub_mask {
@@ -344,6 +376,7 @@ struct dcn_hubbub_mask {
 	HUBBUB_STUTTER_REG_FIELD_LIST(uint32_t);
 	HUBBUB_HVM_REG_FIELD_LIST(uint32_t);
 	HUBBUB_RET_REG_FIELD_LIST(uint32_t);
+	HUBBUB_REG_FIELD_LIST_DCN32(uint32_t);
 };
 
 struct dc;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index e3a62873c0e7..1cb206dc8352 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1375,11 +1375,6 @@ void dcn10_init_pipes(struct dc *dc, struct dc_state *context)
 		pipe_ctx->stream_res.tg = NULL;
 		pipe_ctx->plane_res.hubp = NULL;
 
-		if (tg->funcs->is_tg_enabled(tg)) {
-			if (tg->funcs->init_odm)
-				tg->funcs->init_odm(tg);
-		}
-
 		tg->funcs->tg_init(tg);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
index c50c29984d51..df155cc2bfea 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.h
@@ -514,6 +514,7 @@ struct dcn_optc_registers {
 	type DIG_UPDATE_POSITION_X;\
 	type DIG_UPDATE_POSITION_Y;\
 	type OTG_H_TIMING_DIV_MODE;\
+	type OTG_H_TIMING_DIV_MODE_MANUAL;\
 	type OTG_DRR_TIMING_DBUF_UPDATE_MODE;\
 	type OTG_CRC_DSC_MODE;\
 	type OTG_CRC_DATA_STREAM_COMBINE_MODE;\
@@ -553,6 +554,7 @@ struct optc {
 	int vupdate_offset;
 	int vupdate_width;
 	int vready_offset;
+	struct dc_crtc_timing orginal_patched_timing;
 	enum signal_type signal;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
index 293595a33982..fa6ff540e8f2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.h
@@ -73,6 +73,7 @@
 	SRI(HDMI_ACR_48_1, DIG, id),\
 	SRI(DP_DB_CNTL, DP, id), \
 	SRI(DP_MSA_MISC, DP, id), \
+	SRI(DP_MSA_VBID_MISC, DP, id), \
 	SRI(DP_MSA_COLORIMETRY, DP, id), \
 	SRI(DP_MSA_TIMING_PARAM1, DP, id), \
 	SRI(DP_MSA_TIMING_PARAM2, DP, id), \
@@ -186,6 +187,7 @@ struct dcn10_stream_enc_registers {
 	uint32_t HDMI_GENERIC_PACKET_CONTROL9;
 	uint32_t HDMI_GENERIC_PACKET_CONTROL10;
 	uint32_t DIG_CLOCK_PATTERN;
+	uint32_t DIG_FIFO_CTRL0;
 };
 
 
@@ -338,7 +340,8 @@ struct dcn10_stream_enc_registers {
 	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh)
 
 #define SE_COMMON_MASK_SH_LIST_SOC(mask_sh)\
-	SE_COMMON_MASK_SH_LIST_SOC_BASE(mask_sh)
+	SE_COMMON_MASK_SH_LIST_SOC_BASE(mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, mask_sh)
 
 #define SE_COMMON_MASK_SH_LIST_DCN10(mask_sh)\
 	SE_COMMON_MASK_SH_LIST_SOC(mask_sh),\
@@ -567,16 +570,39 @@ struct dcn10_stream_enc_registers {
 	type DP_SEC_GSP11_ENABLE;\
 	type DP_SEC_GSP11_LINE_NUM
 
+#define SE_REG_FIELD_LIST_DCN3_2(type) \
+	type DIG_SYMCLK_FE_ON;\
+	type DIG_FIFO_READ_START_LEVEL;\
+	type DIG_FIFO_ENABLE;\
+	type DIG_FIFO_RESET;\
+	type DIG_FIFO_RESET_DONE
+
+/* TODO: fix this */
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+#define DIG0_HDMI_VBI_PACKET_CONTROL__HDMI_ACP_SEND__SHIFT 0xc
+#define DIG0_HDMI_VBI_PACKET_CONTROL__HDMI_ACP_SEND_MASK 0x00001000L
+#endif
+
 struct dcn10_stream_encoder_shift {
 	SE_REG_FIELD_LIST_DCN1_0(uint8_t);
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+	uint8_t HDMI_ACP_SEND;
+#endif
 	SE_REG_FIELD_LIST_DCN2_0(uint8_t);
 	SE_REG_FIELD_LIST_DCN3_0(uint8_t);
+	SE_REG_FIELD_LIST_DCN3_2(uint8_t);
+
 };
 
 struct dcn10_stream_encoder_mask {
 	SE_REG_FIELD_LIST_DCN1_0(uint32_t);
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+	uint32_t HDMI_ACP_SEND;
+#endif
 	SE_REG_FIELD_LIST_DCN2_0(uint32_t);
 	SE_REG_FIELD_LIST_DCN3_0(uint32_t);
+	SE_REG_FIELD_LIST_DCN3_2(uint32_t);
+
 };
 
 struct dcn10_stream_encoder {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
index b3c9a9724efd..2b9d3e63191b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dccg.h
@@ -133,6 +133,8 @@
 	type OTG_DROP_PIXEL[MAX_PIPES];
 
 #define DCCG3_REG_FIELD_LIST(type) \
+	type HDMICHARCLK0_EN;\
+	type HDMICHARCLK0_SRC_SEL;\
 	type PHYASYMCLK_FORCE_EN;\
 	type PHYASYMCLK_FORCE_SRC_SEL;\
 	type PHYBSYMCLK_FORCE_EN;\
@@ -203,16 +205,45 @@
 	type PHYDSYMCLK_GATE_DISABLE; \
 	type PHYESYMCLK_GATE_DISABLE;
 
+#define DCCG32_REG_FIELD_LIST(type) \
+	type DPSTREAMCLK0_EN;\
+	type DPSTREAMCLK1_EN;\
+	type DPSTREAMCLK2_EN;\
+	type DPSTREAMCLK3_EN;\
+	type DPSTREAMCLK0_SRC_SEL;\
+	type DPSTREAMCLK1_SRC_SEL;\
+	type DPSTREAMCLK2_SRC_SEL;\
+	type DPSTREAMCLK3_SRC_SEL;\
+	type HDMISTREAMCLK0_EN;\
+	type OTG0_PIXEL_RATE_DIVK1;\
+	type OTG0_PIXEL_RATE_DIVK2;\
+	type OTG1_PIXEL_RATE_DIVK1;\
+	type OTG1_PIXEL_RATE_DIVK2;\
+	type OTG2_PIXEL_RATE_DIVK1;\
+	type OTG2_PIXEL_RATE_DIVK2;\
+	type OTG3_PIXEL_RATE_DIVK1;\
+	type OTG3_PIXEL_RATE_DIVK2;\
+	type DTBCLK_P0_SRC_SEL;\
+	type DTBCLK_P0_EN;\
+	type DTBCLK_P1_SRC_SEL;\
+	type DTBCLK_P1_EN;\
+	type DTBCLK_P2_SRC_SEL;\
+	type DTBCLK_P2_EN;\
+	type DTBCLK_P3_SRC_SEL;\
+	type DTBCLK_P3_EN;
+
 struct dccg_shift {
 	DCCG_REG_FIELD_LIST(uint8_t)
 	DCCG3_REG_FIELD_LIST(uint8_t)
 	DCCG31_REG_FIELD_LIST(uint8_t)
+	DCCG32_REG_FIELD_LIST(uint8_t)
 };
 
 struct dccg_mask {
 	DCCG_REG_FIELD_LIST(uint32_t)
 	DCCG3_REG_FIELD_LIST(uint32_t)
 	DCCG31_REG_FIELD_LIST(uint32_t)
+	DCCG32_REG_FIELD_LIST(uint32_t)
 };
 
 struct dccg_registers {
@@ -247,7 +278,8 @@ struct dccg_registers {
 	uint32_t DCCG_GATE_DISABLE_CNTL3;
 	uint32_t HDMISTREAMCLK0_DTO_PARAM;
 	uint32_t DCCG_GATE_DISABLE_CNTL4;
-
+	uint32_t OTG_PIXEL_RATE_DIV;
+	uint32_t DTBCLK_P_CNTL;
 };
 
 struct dcn_dccg {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
index 9204c3ef323b..efa2adf4f83d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
@@ -161,6 +161,12 @@
 	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
 	uint32_t DCN_DMDATA_VM_CNTL
 
+#define DCN32_HUBP_REG_COMMON_VARIABLE_LIST \
+	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;\
+	uint32_t DCHUBP_MALL_CONFIG;\
+	uint32_t DCHUBP_VMPG_CONFIG;\
+	uint32_t UCLK_PSTATE_FORCE
+
 #define DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type) \
 	DCN_HUBP_REG_FIELD_BASE_LIST(type); \
 	type DMDATA_ADDRESS_HIGH;\
@@ -222,16 +228,29 @@
 	type CURSOR_REQ_MODE;\
 	type HUBP_SOFT_RESET
 
+#define DCN32_HUBP_REG_FIELD_VARIABLE_LIST(type) \
+	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(type);\
+	type USE_MALL_SEL; \
+	type USE_MALL_FOR_CURSOR;\
+	type VMPG_SIZE; \
+	type PTE_BUFFER_MODE; \
+	type BIGK_FRAGMENT_SIZE; \
+	type FORCE_ONE_ROW_FOR_FRAME; \
+	type DATA_UCLK_PSTATE_FORCE_EN; \
+	type DATA_UCLK_PSTATE_FORCE_VALUE; \
+	type CURSOR_UCLK_PSTATE_FORCE_EN; \
+	type CURSOR_UCLK_PSTATE_FORCE_VALUE
+
 struct dcn_hubp2_registers {
-	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
+	DCN32_HUBP_REG_COMMON_VARIABLE_LIST;
 };
 
 struct dcn_hubp2_shift {
-	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
+	DCN32_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
 };
 
 struct dcn_hubp2_mask {
-	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
+	DCN32_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
 };
 
 struct dcn20_hubp {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index ec6aa8d8b251..d00a27893ab0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -768,6 +768,10 @@ enum dc_status dcn20_enable_stream_timing(
 	/* TODO enable stream if timing changed */
 	/* TODO unblank stream if DP */
 
+	if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (pipe_ctx->stream_res.tg && pipe_ctx->stream_res.tg->funcs->phantom_crtc_post_enable)
+			pipe_ctx->stream_res.tg->funcs->phantom_crtc_post_enable(pipe_ctx->stream_res.tg);
+	}
 	return DC_OK;
 }
 
@@ -1247,6 +1251,16 @@ void dcn20_pipe_control_lock(
 					lock,
 					&hw_locks,
 					&inst_flags);
+	} else if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+		union dmub_inbox0_cmd_lock_hw hw_lock_cmd = { 0 };
+		hw_lock_cmd.bits.command_code = DMUB_INBOX0_CMD__HW_LOCK;
+		hw_lock_cmd.bits.hw_lock_client = HW_LOCK_CLIENT_DRIVER;
+		hw_lock_cmd.bits.lock_pipe = 1;
+		hw_lock_cmd.bits.otg_inst = pipe->stream_res.tg->inst;
+		hw_lock_cmd.bits.lock = lock;
+		if (!lock)
+			hw_lock_cmd.bits.should_release = 1;
+		dmub_hw_lock_mgr_inbox0_cmd(dc->ctx->dmub_srv, hw_lock_cmd);
 	} else if (pipe->plane_state != NULL && pipe->plane_state->triplebuffer_flips) {
 		if (lock)
 			pipe->stream_res.tg->funcs->triplebuffer_lock(pipe->stream_res.tg);
@@ -1564,10 +1578,12 @@ static void dcn20_update_dchubp_dpp(
 		plane_state->update_flags.bits.addr_update)
 		hws->funcs.update_plane_addr(dc, pipe_ctx);
 
-
-
 	if (pipe_ctx->update_flags.bits.enable)
 		hubp->funcs->set_blank(hubp, false);
+	/* If the stream paired with this plane is phantom, the plane is also phantom */
+	if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.type == SUBVP_PHANTOM
+			&& hubp->funcs->phantom_hubp_post_enable)
+		hubp->funcs->phantom_hubp_post_enable(hubp);
 }
 
 
@@ -1578,6 +1594,7 @@ static void dcn20_program_pipe(
 {
 	struct dce_hwseq *hws = dc->hwseq;
 	/* Only need to unblank on top pipe */
+
 	if ((pipe_ctx->update_flags.bits.enable || pipe_ctx->stream->update_flags.bits.abm_level)
 			&& !pipe_ctx->top_pipe && !pipe_ctx->prev_odm_pipe)
 		hws->funcs.blank_pixel_data(dc, pipe_ctx, !pipe_ctx->plane_state->visible);
@@ -1585,7 +1602,6 @@ static void dcn20_program_pipe(
 	/* Only update TG on top pipe */
 	if (pipe_ctx->update_flags.bits.global_sync && !pipe_ctx->top_pipe
 			&& !pipe_ctx->prev_odm_pipe) {
-
 		pipe_ctx->stream_res.tg->funcs->program_global_sync(
 				pipe_ctx->stream_res.tg,
 				pipe_ctx->pipe_dlg_param.vready_offset,
@@ -1593,7 +1609,12 @@ static void dcn20_program_pipe(
 				pipe_ctx->pipe_dlg_param.vupdate_offset,
 				pipe_ctx->pipe_dlg_param.vupdate_width);
 
-		pipe_ctx->stream_res.tg->funcs->wait_for_state(pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
+		if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			pipe_ctx->stream_res.tg->funcs->wait_for_state(
+				pipe_ctx->stream_res.tg, CRTC_STATE_VBLANK);
+			pipe_ctx->stream_res.tg->funcs->wait_for_state(
+				pipe_ctx->stream_res.tg, CRTC_STATE_VACTIVE);
+		}
 
 		pipe_ctx->stream_res.tg->funcs->set_vtg_params(
 				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing, true);
@@ -1749,6 +1770,8 @@ void dcn20_program_front_end_for_ctx(
 			pipe->plane_res.hubp->funcs->hubp_wait_pipe_read_start(pipe->plane_res.hubp);
 		}
 	}
+	if (hws->funcs.program_mall_pipe_config)
+		hws->funcs.program_mall_pipe_config(dc, context);
 }
 
 void dcn20_post_unlock_program_front_end(
@@ -2409,6 +2432,7 @@ void dcn20_update_mpcc(struct dc *dc, struct pipe_ctx *pipe_ctx)
 			NULL,
 			hubp->inst,
 			mpcc_id);
+
 	dc->hwss.update_visual_confirm_color(dc, pipe_ctx, &blnd_cfg.black_color, mpcc_id);
 
 	ASSERT(new_mpcc != NULL);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
index a04ca4a98392..b683ad817106 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.c
@@ -195,7 +195,7 @@ static void enc3_update_hdmi_info_packet(
 	}
 }
 
-static void enc3_stream_encoder_update_hdmi_info_packets(
+void enc3_stream_encoder_update_hdmi_info_packets(
 	struct stream_encoder *enc,
 	const struct encoder_info_frame *info_frame)
 {
@@ -214,7 +214,7 @@ static void enc3_stream_encoder_update_hdmi_info_packets(
 	enc3_update_hdmi_info_packet(enc1, 4, &info_frame->hdrsmd);
 }
 
-static void enc3_stream_encoder_stop_hdmi_info_packets(
+void enc3_stream_encoder_stop_hdmi_info_packets(
 	struct stream_encoder *enc)
 {
 	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
@@ -318,7 +318,7 @@ static void enc3_dp_set_dsc_config(struct stream_encoder *enc,
 }
 
 
-static void enc3_dp_set_dsc_pps_info_packet(struct stream_encoder *enc,
+void enc3_dp_set_dsc_pps_info_packet(struct stream_encoder *enc,
 					bool enable,
 					uint8_t *dsc_packed_pps,
 					bool immediate_update)
@@ -404,7 +404,7 @@ static void enc3_read_state(struct stream_encoder *enc, struct enc_state *s)
 	}
 }
 
-static void enc3_stream_encoder_update_dp_info_packets(
+void enc3_stream_encoder_update_dp_info_packets(
 	struct stream_encoder *enc,
 	const struct encoder_info_frame *info_frame)
 {
@@ -652,7 +652,7 @@ static void enc3_stream_encoder_hdmi_set_stream_attribute(
 	REG_UPDATE(HDMI_GC, HDMI_GC_AVMUTE, 0);
 }
 
-static void enc3_audio_mute_control(
+void enc3_audio_mute_control(
 	struct stream_encoder *enc,
 	bool mute)
 {
@@ -660,7 +660,7 @@ static void enc3_audio_mute_control(
 	enc->afmt->funcs->audio_mute_control(enc->afmt, mute);
 }
 
-static void enc3_se_dp_audio_setup(
+void enc3_se_dp_audio_setup(
 	struct stream_encoder *enc,
 	unsigned int az_inst,
 	struct audio_info *info)
@@ -691,7 +691,7 @@ static void enc3_se_setup_dp_audio(
 	enc->afmt->funcs->setup_dp_audio(enc->afmt);
 }
 
-static void enc3_se_dp_audio_enable(
+void enc3_se_dp_audio_enable(
 	struct stream_encoder *enc)
 {
 	enc1_se_enable_audio_clock(enc, true);
@@ -757,7 +757,7 @@ static void enc3_se_setup_hdmi_audio(
 	 */
 }
 
-static void enc3_se_hdmi_audio_setup(
+void enc3_se_hdmi_audio_setup(
 	struct stream_encoder *enc,
 	unsigned int az_inst,
 	struct audio_info *info,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
index 42140e73c3b2..d2207b35f15f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dio_stream_encoder.h
@@ -287,4 +287,39 @@ void dcn30_dio_stream_encoder_construct(
 	const struct dcn10_stream_encoder_shift *se_shift,
 	const struct dcn10_stream_encoder_mask *se_mask);
 
+void enc3_stream_encoder_update_hdmi_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame);
+
+void enc3_stream_encoder_stop_hdmi_info_packets(
+	struct stream_encoder *enc);
+
+void enc3_stream_encoder_update_dp_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame);
+
+void enc3_audio_mute_control(
+	struct stream_encoder *enc,
+	bool mute);
+
+void enc3_se_dp_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info);
+
+void enc3_se_dp_audio_enable(
+	struct stream_encoder *enc);
+
+void enc3_se_hdmi_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info,
+	struct audio_crtc_info *audio_crtc_info);
+
+void enc3_dp_set_dsc_pps_info_packet(
+	struct stream_encoder *enc,
+	bool enable,
+	uint8_t *dsc_packed_pps,
+    bool immediate_update);
+
 #endif /* __DC_DIO_STREAM_ENCODER_DCN30_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
index ab3918c0a15b..9cca59bf2ae0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
@@ -41,9 +41,9 @@
 	dpp->tf_shift->field_name, dpp->tf_mask->field_name
 
 
-static void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
+void dpp30_read_state(struct dpp *dpp_base, struct dcn_dpp_state *s)
 {
-	struct dcn20_dpp *dpp = TO_DCN20_DPP(dpp_base);
+	struct dcn3_dpp *dpp = TO_DCN30_DPP(dpp_base);
 
 	REG_GET(DPP_CONTROL,
 			DPP_CLOCK_ENABLE, &s->is_enabled);
@@ -167,7 +167,7 @@ void dpp3_set_pre_degam(struct dpp *dpp_base, enum dc_transfer_func_predefined t
 			PRE_DEGAM_SELECT, degamma_lut_selection);
 }
 
-static void dpp3_cnv_setup (
+void dpp3_cnv_setup (
 		struct dpp *dpp_base,
 		enum surface_pixel_format format,
 		enum expansion_mode mode,
@@ -372,7 +372,7 @@ void dpp3_set_cursor_attributes(
 }
 
 
-static bool dpp3_get_optimal_number_of_taps(
+bool dpp3_get_optimal_number_of_taps(
 		struct dpp *dpp,
 		struct scaler_data *scl_data,
 		const struct scaling_taps *in_taps)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
index ac644ae6b9f2..6263408d71fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.h
@@ -588,6 +588,22 @@ void dpp3_program_CM_dealpha(
 		struct dpp *dpp_base,
 		uint32_t enable, uint32_t additive_blending);
 
+void dpp30_read_state(struct dpp *dpp_base,
+		struct dcn_dpp_state *s);
+
+bool dpp3_get_optimal_number_of_taps(
+		struct dpp *dpp,
+		struct scaler_data *scl_data,
+		const struct scaling_taps *in_taps);
+
+void dpp3_cnv_setup (
+		struct dpp *dpp_base,
+		enum surface_pixel_format format,
+		enum expansion_mode mode,
+		struct dc_csc_transform input_csc_color_matrix,
+		enum dc_color_space input_color_space,
+		struct cnv_alpha_2bit_lut *alpha_2bit_lut);
+
 void dpp3_program_CM_bias(
 		struct dpp *dpp_base,
 		struct CM_bias_params *bias_params);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
index 0ce0d6165f43..1981a71b961b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
@@ -44,7 +44,7 @@
 #define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
 
 
-static bool mpc3_is_dwb_idle(
+bool mpc3_is_dwb_idle(
 	struct mpc *mpc,
 	int dwb_id)
 {
@@ -59,7 +59,7 @@ static bool mpc3_is_dwb_idle(
 		return false;
 }
 
-static void mpc3_set_dwb_mux(
+void mpc3_set_dwb_mux(
 	struct mpc *mpc,
 	int dwb_id,
 	int mpcc_id)
@@ -70,7 +70,7 @@ static void mpc3_set_dwb_mux(
 		MPC_DWB0_MUX, mpcc_id);
 }
 
-static void mpc3_disable_dwb_mux(
+void mpc3_disable_dwb_mux(
 	struct mpc *mpc,
 	int dwb_id)
 {
@@ -80,7 +80,7 @@ static void mpc3_disable_dwb_mux(
 		MPC_DWB0_MUX, 0xf);
 }
 
-static void mpc3_set_out_rate_control(
+void mpc3_set_out_rate_control(
 	struct mpc *mpc,
 	int opp_id,
 	bool enable,
@@ -99,7 +99,7 @@ static void mpc3_set_out_rate_control(
 			MPC_OUT_FLOW_CONTROL_COUNT, flow_control->flow_ctrl_cnt1);
 }
 
-static enum dc_lut_mode mpc3_get_ogam_current(struct mpc *mpc, int mpcc_id)
+enum dc_lut_mode mpc3_get_ogam_current(struct mpc *mpc, int mpcc_id)
 {
 	/*Contrary to DCN2 and DCN1 wherein a single status register field holds this info;
 	 *in DCN3/3AG, we need to read two separate fields to retrieve the same info
@@ -137,7 +137,7 @@ static enum dc_lut_mode mpc3_get_ogam_current(struct mpc *mpc, int mpcc_id)
 		return mode;
 }
 
-static void mpc3_power_on_ogam_lut(
+void mpc3_power_on_ogam_lut(
 		struct mpc *mpc, int mpcc_id,
 		bool power_on)
 {
@@ -1035,7 +1035,7 @@ static void mpc3_set3dlut_ram10(
 }
 
 
-static void mpc3_init_mpcc(struct mpcc *mpcc, int mpcc_inst)
+void mpc3_init_mpcc(struct mpcc *mpcc, int mpcc_inst)
 {
 	mpcc->mpcc_id = mpcc_inst;
 	mpcc->dpp_id = 0xf;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
index 34b9cedbd012..a4d8f77d43bc 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
@@ -282,6 +282,73 @@
 	uint32_t MPCC_OGAM_RAMB_START_BASE_CNTL_R[MAX_MPCC]; \
 	uint32_t MPC_OUT_CSC_COEF_FORMAT
 
+#define MPC_REG_VARIABLE_LIST_DCN32 \
+	uint32_t MPCC_MCM_SHAPER_CONTROL[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_OFFSET_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_OFFSET_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_OFFSET_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_SCALE_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_SCALE_G_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_LUT_INDEX[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_LUT_DATA[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_START_CNTL_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_START_CNTL_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_START_CNTL_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_END_CNTL_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_END_CNTL_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_END_CNTL_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_0_1[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_2_3[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_4_5[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_6_7[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_8_9[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_10_11[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_12_13[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_14_15[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_16_17[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_18_19[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_20_21[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_22_23[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_24_25[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_26_27[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_28_29[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_30_31[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMA_REGION_32_33[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_START_CNTL_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_START_CNTL_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_START_CNTL_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_END_CNTL_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_END_CNTL_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_END_CNTL_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_0_1[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_2_3[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_4_5[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_6_7[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_8_9[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_10_11[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_12_13[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_14_15[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_16_17[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_18_19[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_20_21[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_22_23[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_24_25[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_26_27[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_28_29[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_30_31[MAX_MPCC]; \
+	uint32_t MPCC_MCM_SHAPER_RAMB_REGION_32_33[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_MODE[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_INDEX[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_DATA[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_DATA_30BIT[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_READ_WRITE_CONTROL[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_OUT_NORM_FACTOR[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_OUT_OFFSET_R[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_OUT_OFFSET_G[MAX_MPCC]; \
+	uint32_t MPCC_MCM_3DLUT_OUT_OFFSET_B[MAX_MPCC]; \
+	uint32_t MPCC_MCM_MEM_PWR_CTRL[MAX_MPCC]
+
 #define MPC_COMMON_MASK_SH_LIST_DCN3_0(mask_sh) \
 	MPC_COMMON_MASK_SH_LIST_DCN1_0(mask_sh),\
 	SF(MPCC0_MPCC_CONTROL, MPCC_BG_BPC, mask_sh),\
@@ -580,6 +647,53 @@
 	type MPC_RMU_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS;\
 	type MPC_RMU_SHAPER_MODE_CURRENT
 
+#define MPC_REG_FIELD_LIST_DCN32(type) \
+	type MPCC_MCM_SHAPER_MEM_PWR_FORCE;\
+	type MPCC_MCM_SHAPER_MEM_PWR_DIS;\
+	type MPCC_MCM_SHAPER_MEM_LOW_PWR_MODE;\
+	type MPCC_MCM_3DLUT_MEM_PWR_FORCE;\
+	type MPCC_MCM_3DLUT_MEM_PWR_DIS;\
+	type MPCC_MCM_3DLUT_MEM_LOW_PWR_MODE;\
+	type MPCC_MCM_1DLUT_MEM_PWR_FORCE;\
+	type MPCC_MCM_1DLUT_MEM_PWR_DIS;\
+	type MPCC_MCM_1DLUT_MEM_LOW_PWR_MODE;\
+	type MPCC_MCM_SHAPER_MEM_PWR_STATE;\
+	type MPCC_MCM_3DLUT_MEM_PWR_STATE;\
+	type MPCC_MCM_1DLUT_MEM_PWR_STATE;\
+	type MPCC_MCM_3DLUT_MODE; \
+	type MPCC_MCM_3DLUT_SIZE; \
+	type MPCC_MCM_3DLUT_MODE_CURRENT; \
+	type MPCC_MCM_3DLUT_WRITE_EN_MASK;\
+	type MPCC_MCM_3DLUT_RAM_SEL;\
+	type MPCC_MCM_3DLUT_30BIT_EN;\
+	type MPCC_MCM_3DLUT_CONFIG_STATUS;\
+	type MPCC_MCM_3DLUT_READ_SEL;\
+	type MPCC_MCM_3DLUT_INDEX;\
+	type MPCC_MCM_3DLUT_DATA0;\
+	type MPCC_MCM_3DLUT_DATA1;\
+	type MPCC_MCM_3DLUT_DATA_30BIT;\
+	type MPCC_MCM_SHAPER_LUT_MODE;\
+	type MPCC_MCM_SHAPER_MODE_CURRENT;\
+	type MPCC_MCM_SHAPER_OFFSET_R;\
+	type MPCC_MCM_SHAPER_OFFSET_G;\
+	type MPCC_MCM_SHAPER_OFFSET_B;\
+	type MPCC_MCM_SHAPER_SCALE_R;\
+	type MPCC_MCM_SHAPER_SCALE_G;\
+	type MPCC_MCM_SHAPER_SCALE_B;\
+	type MPCC_MCM_SHAPER_LUT_INDEX;\
+	type MPCC_MCM_SHAPER_LUT_DATA;\
+	type MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK;\
+	type MPCC_MCM_SHAPER_LUT_WRITE_SEL;\
+	type MPCC_MCM_SHAPER_CONFIG_STATUS;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET;\
+	type MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS
+
 #define MPC_COMMON_MASK_SH_LIST_DCN303(mask_sh) \
 	MPC_COMMON_MASK_SH_LIST_DCN1_0(mask_sh),\
 	SF(MPCC0_MPCC_CONTROL, MPCC_BG_BPC, mask_sh),\
@@ -758,14 +872,17 @@
 
 struct dcn30_mpc_registers {
 	MPC_REG_VARIABLE_LIST_DCN3_0;
+	MPC_REG_VARIABLE_LIST_DCN32;
 };
 
 struct dcn30_mpc_shift {
 	MPC_REG_FIELD_LIST_DCN3_0(uint8_t);
+	MPC_REG_FIELD_LIST_DCN32(uint8_t);
 };
 
 struct dcn30_mpc_mask {
 	MPC_REG_FIELD_LIST_DCN3_0(uint32_t);
+	MPC_REG_FIELD_LIST_DCN32(uint32_t);
 };
 
 struct dcn30_mpc {
@@ -841,4 +958,34 @@ void mpc3_set_rmu_mux(
 	int rmu_idx,
 	int value);
 
+void mpc3_set_dwb_mux(
+	struct mpc *mpc,
+	int dwb_id,
+	int mpcc_id);
+
+void mpc3_disable_dwb_mux(
+	struct mpc *mpc,
+	int dwb_id);
+
+bool mpc3_is_dwb_idle(
+	struct mpc *mpc,
+	int dwb_id);
+
+void mpc3_set_out_rate_control(
+	struct mpc *mpc,
+	int opp_id,
+	bool enable,
+	bool rate_2x_mode,
+	struct mpc_dwb_flow_control *flow_control);
+
+void mpc3_power_on_ogam_lut(
+	struct mpc *mpc, int mpcc_id,
+	bool power_on);
+
+void mpc3_init_mpcc(struct mpcc *mpcc, int mpcc_inst);
+
+enum dc_lut_mode mpc3_get_ogam_current(
+	struct mpc *mpc,
+	int mpcc_id);
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
index 97f11ef6e9f0..33bd12f5dc17 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_optc.h
@@ -28,6 +28,7 @@
 
 #include "dcn20/dcn20_optc.h"
 
+#define V_TOTAL_REGS_DCN30_SRI(inst)
 
 #define OPTC_COMMON_REG_LIST_DCN3_BASE(inst) \
 	SRI(OTG_VSTARTUP_PARAM, OTG, inst),\
@@ -55,6 +56,7 @@
 	SRI(OTG_V_TOTAL_MAX, OTG, inst),\
 	SRI(OTG_V_TOTAL_MIN, OTG, inst),\
 	SRI(OTG_V_TOTAL_CONTROL, OTG, inst),\
+	V_TOTAL_REGS_DCN30_SRI(inst)\
 	SRI(OTG_TRIGA_CNTL, OTG, inst),\
 	SRI(OTG_FORCE_COUNT_NOW_CNTL, OTG, inst),\
 	SRI(OTG_STATIC_SCREEN_CONTROL, OTG, inst),\
@@ -80,6 +82,7 @@
 	SRI(OTG_VERT_SYNC_CONTROL, OTG, inst),\
 	SRI(OTG_GSL_CONTROL, OTG, inst),\
 	SRI(OTG_CRC_CNTL, OTG, inst),\
+	SRI(OTG_CRC_CNTL2, OTG, inst),\
 	SRI(OTG_CRC0_DATA_RG, OTG, inst),\
 	SRI(OTG_CRC0_DATA_B, OTG, inst),\
 	SRI(OTG_CRC0_WINDOWA_X_CONTROL, OTG, inst),\
@@ -108,6 +111,7 @@
 	SRI(OPTC_MEMORY_CONFIG, ODM, inst),\
 	SR(DWB_SOURCE_SELECT)
 
+#define DCN30_VTOTAL_REGS_SF(mask_sh)
 
 #define OPTC_COMMON_MASK_SH_LIST_DCN3_BASE(mask_sh)\
 	SF(OTG0_OTG_VSTARTUP_PARAM, VSTARTUP_START, mask_sh),\
@@ -161,6 +165,7 @@
 	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_SET_V_TOTAL_MIN_MASK, mask_sh),\
 	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MIN_EN, mask_sh),\
 	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MAX_EN, mask_sh),\
+	DCN30_VTOTAL_REGS_SF(mask_sh)\
 	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_CLEAR, mask_sh),\
 	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_MODE, mask_sh),\
 	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_OCCURRED, mask_sh),\
@@ -219,6 +224,10 @@
 	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_CONT_EN, mask_sh),\
 	SF(OTG0_OTG_CRC_CNTL, OTG_CRC0_SELECT, mask_sh),\
 	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_EN, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DSC_MODE, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_STREAM_COMBINE_MODE, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_STREAM_SPLIT_MODE, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_FORMAT, mask_sh),\
 	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_R_CR, mask_sh),\
 	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_G_Y, mask_sh),\
 	SF(OTG0_OTG_CRC0_DATA_B, CRC0_B_CB, mask_sh),\
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
index 287a1066b547..20f11fb8f5a6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.c
@@ -158,10 +158,9 @@ static void dccg31_disable_dpstreamclk(struct dccg *dccg, int otg_inst)
 	}
 }
 
-void dccg31_set_dpstreamclk(
-		struct dccg *dccg,
-		enum hdmistreamclk_source src,
-		int otg_inst)
+void dccg31_set_dpstreamclk(struct dccg *dccg,
+			    enum streamclk_source src,
+			    int otg_inst)
 {
 	if (src == REFCLK)
 		dccg31_disable_dpstreamclk(dccg, otg_inst);
@@ -513,12 +512,13 @@ void dccg31_set_physymclk(
 /* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
 static void dccg31_set_dtbclk_dto(
 		struct dccg *dccg,
-		int dtbclk_inst,
-		int req_dtbclk_khz,
+		int otg_inst,
+		int pixclk_khz,
 		int num_odm_segments,
 		const struct dc_crtc_timing *timing)
 {
 	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+	int req_dtbclk_khz = pixclk_khz;
 	uint32_t dtbdto_div;
 
 	/* Mode	                DTBDTO Rate       DTBCLK_DTO<x>_DIV Register
@@ -531,13 +531,13 @@ static void dccg31_set_dtbclk_dto(
 	 */
 	if (num_odm_segments == 4) {
 		dtbdto_div = 2;
-		req_dtbclk_khz = req_dtbclk_khz / 4;
+		req_dtbclk_khz = pixclk_khz / 4;
 	} else if ((num_odm_segments == 2) ||
 			(timing->pixel_encoding == PIXEL_ENCODING_YCBCR420) ||
 			(timing->flags.DSC && timing->pixel_encoding == PIXEL_ENCODING_YCBCR422
 					&& !timing->dsc_cfg.ycbcr422_simple)) {
 		dtbdto_div = 4;
-		req_dtbclk_khz = req_dtbclk_khz / 2;
+		req_dtbclk_khz = pixclk_khz / 2;
 	} else
 		dtbdto_div = 8;
 
@@ -549,37 +549,37 @@ static void dccg31_set_dtbclk_dto(
 		phase = div_u64((((unsigned long long)modulo * req_dtbclk_khz) + dccg->ref_dtbclk_khz - 1),
 			dccg->ref_dtbclk_khz);
 
-		REG_UPDATE(OTG_PIXEL_RATE_CNTL[dtbclk_inst],
-				DTBCLK_DTO_DIV[dtbclk_inst], dtbdto_div);
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLK_DTO_DIV[otg_inst], dtbdto_div);
 
-		REG_WRITE(DTBCLK_DTO_MODULO[dtbclk_inst], modulo);
-		REG_WRITE(DTBCLK_DTO_PHASE[dtbclk_inst], phase);
+		REG_WRITE(DTBCLK_DTO_MODULO[otg_inst], modulo);
+		REG_WRITE(DTBCLK_DTO_PHASE[otg_inst], phase);
 
-		REG_UPDATE(OTG_PIXEL_RATE_CNTL[dtbclk_inst],
-				DTBCLK_DTO_ENABLE[dtbclk_inst], 1);
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLK_DTO_ENABLE[otg_inst], 1);
 
-		REG_WAIT(OTG_PIXEL_RATE_CNTL[dtbclk_inst],
-				DTBCLKDTO_ENABLE_STATUS[dtbclk_inst], 1,
+		REG_WAIT(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLKDTO_ENABLE_STATUS[otg_inst], 1,
 				1, 100);
 
 		/* The recommended programming sequence to enable DTBCLK DTO to generate
 		 * valid pixel HPO DPSTREAM ENCODER, specifies that DTO source select should
 		 * be set only after DTO is enabled
 		 */
-		REG_UPDATE(OTG_PIXEL_RATE_CNTL[dtbclk_inst],
-				PIPE_DTO_SRC_SEL[dtbclk_inst], 1);
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+				PIPE_DTO_SRC_SEL[otg_inst], 1);
 
-		dccg->dtbclk_khz[dtbclk_inst] = req_dtbclk_khz;
+		dccg->dtbclk_khz[otg_inst] = req_dtbclk_khz;
 	} else {
-		REG_UPDATE_3(OTG_PIXEL_RATE_CNTL[dtbclk_inst],
-				DTBCLK_DTO_ENABLE[dtbclk_inst], 0,
-				PIPE_DTO_SRC_SEL[dtbclk_inst], 0,
-				DTBCLK_DTO_DIV[dtbclk_inst], dtbdto_div);
+		REG_UPDATE_3(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLK_DTO_ENABLE[otg_inst], 0,
+				PIPE_DTO_SRC_SEL[otg_inst], 0,
+				DTBCLK_DTO_DIV[otg_inst], dtbdto_div);
 
-		REG_WRITE(DTBCLK_DTO_MODULO[dtbclk_inst], 0);
-		REG_WRITE(DTBCLK_DTO_PHASE[dtbclk_inst], 0);
+		REG_WRITE(DTBCLK_DTO_MODULO[otg_inst], 0);
+		REG_WRITE(DTBCLK_DTO_PHASE[otg_inst], 0);
 
-		dccg->dtbclk_khz[dtbclk_inst] = 0;
+		dccg->dtbclk_khz[otg_inst] = 0;
 	}
 }
 
@@ -673,6 +673,24 @@ void dccg31_init(struct dccg *dccg)
 	}
 }
 
+void dccg31_otg_add_pixel(struct dccg *dccg,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+			OTG_ADD_PIXEL[otg_inst], 1);
+}
+
+void dccg31_otg_drop_pixel(struct dccg *dccg,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+			OTG_DROP_PIXEL[otg_inst], 1);
+}
+
 static const struct dccg_funcs dccg31_funcs = {
 	.update_dpp_dto = dccg31_update_dpp_dto,
 	.get_dccg_ref_freq = dccg31_get_dccg_ref_freq,
@@ -685,6 +703,9 @@ static const struct dccg_funcs dccg31_funcs = {
 	.set_physymclk = dccg31_set_physymclk,
 	.set_dtbclk_dto = dccg31_set_dtbclk_dto,
 	.set_audio_dtbclk_dto = dccg31_set_audio_dtbclk_dto,
+	.set_fifo_errdet_ovr_en = dccg2_set_fifo_errdet_ovr_en,
+	.otg_add_pixel = dccg31_otg_add_pixel,
+	.otg_drop_pixel = dccg31_otg_drop_pixel,
 	.set_dispclk_change_mode = dccg31_set_dispclk_change_mode,
 	.disable_dsc = dccg31_disable_dscclk,
 	.enable_dsc = dccg31_enable_dscclk,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h
index 269cabbea72a..f31cced5f441 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_dccg.h
@@ -28,10 +28,6 @@
 
 #include "dcn30/dcn30_dccg.h"
 
-#define DCCG_SFII(block, reg_name, field_prefix, field_name, inst, post_fix)\
-	.field_prefix ## _ ## field_name[inst] = block ## inst ## _ ## reg_name ## __ ## field_prefix ## inst ## _ ## field_name ## post_fix
-
-
 #define DCCG_REG_LIST_DCN31() \
 	SR(DPPCLK_DTO_CTRL),\
 	DCCG_SRII(DTO_PARAM, DPPCLK, 0),\
@@ -124,6 +120,10 @@
 	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, DIV, 1, mask_sh),\
 	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, DIV, 2, mask_sh),\
 	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, DIV, 3, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 0, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 1, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 2, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 3, mask_sh),\
 	DCCG_SF(DCCG_AUDIO_DTO_SOURCE, DCCG_AUDIO_DTO_SEL, mask_sh),\
 	DCCG_SF(DCCG_AUDIO_DTO_SOURCE, DCCG_AUDIO_DTO0_SOURCE_SEL, mask_sh),\
 	DCCG_SF(DENTIST_DISPCLK_CNTL, DENTIST_DISPCLK_CHG_MODE, mask_sh), \
@@ -163,7 +163,7 @@ void dccg31_init(struct dccg *dccg);
 
 void dccg31_set_dpstreamclk(
 		struct dccg *dccg,
-		enum hdmistreamclk_source src,
+		enum streamclk_source src,
 		int otg_inst);
 
 void dccg31_enable_symclk32_se(
@@ -194,8 +194,4 @@ void dccg31_set_audio_dtbclk_dto(
 		struct dccg *dccg,
 		uint32_t req_audio_dtbclk_khz);
 
-void dccg31_set_hdmistreamclk(
-		struct dccg *dccg,
-		enum hdmistreamclk_source src);
-
 #endif //__DCN31_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
index c51f7dca94f8..96fac715a77b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
@@ -213,26 +213,6 @@ void optc31_set_drr(
 	}
 }
 
-void optc3_init_odm(struct timing_generator *optc)
-{
-	struct optc *optc1 = DCN10TG_FROM_TG(optc);
-
-	REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
-			OPTC_NUM_OF_INPUT_SEGMENT, 0,
-			OPTC_SEG0_SRC_SEL, optc->inst,
-			OPTC_SEG1_SRC_SEL, 0xf,
-			OPTC_SEG2_SRC_SEL, 0xf,
-			OPTC_SEG3_SRC_SEL, 0xf
-			);
-
-	REG_SET(OTG_H_TIMING_CNTL, 0,
-			OTG_H_TIMING_DIV_MODE, 0);
-
-	REG_SET(OPTC_MEMORY_CONFIG, 0,
-			OPTC_MEM_SEL, 0);
-	optc1->opp_count = 1;
-}
-
 static struct timing_generator_funcs dcn31_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
 		.program_timing = optc1_program_timing,
@@ -266,6 +246,7 @@ static struct timing_generator_funcs dcn31_tg_funcs = {
 		.lock_doublebuffer_disable = optc3_lock_doublebuffer_disable,
 		.enable_optc_clock = optc1_enable_optc_clock,
 		.set_drr = optc31_set_drr,
+		.get_last_used_drr_vtotal = optc2_get_last_used_drr_vtotal,
 		.set_vtotal_min_max = optc1_set_vtotal_min_max,
 		.set_static_screen_control = optc1_set_static_screen_control,
 		.program_stereo = optc1_program_stereo,
@@ -292,7 +273,6 @@ static struct timing_generator_funcs dcn31_tg_funcs = {
 		.program_manual_trigger = optc2_program_manual_trigger,
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
-		.init_odm = optc3_init_odm,
 };
 
 void dcn31_timing_generator_init(struct optc *optc1)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h
index 9e881f2ce74b..3706e6f7880e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.h
@@ -98,7 +98,8 @@
 	SRI(OPTC_WIDTH_CONTROL, ODM, inst),\
 	SRI(OPTC_MEMORY_CONFIG, ODM, inst),\
 	SRI(OTG_CRC_CNTL2, OTG, inst),\
-	SR(DWB_SOURCE_SELECT)
+	SR(DWB_SOURCE_SELECT),\
+	SRI(OTG_DRR_CONTROL, OTG, inst)
 
 #define OPTC_COMMON_MASK_SH_LIST_DCN3_1(mask_sh)\
 	SF(OTG0_OTG_VSTARTUP_PARAM, VSTARTUP_START, mask_sh),\
@@ -252,7 +253,8 @@
 	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DSC_MODE, mask_sh),\
 	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_STREAM_COMBINE_MODE, mask_sh),\
 	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_STREAM_SPLIT_MODE, mask_sh),\
-	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_FORMAT, mask_sh)
+	SF(OTG0_OTG_CRC_CNTL2, OTG_CRC_DATA_FORMAT, mask_sh),\
+	SF(OTG0_OTG_DRR_CONTROL, OTG_V_TOTAL_LAST_USED_BY_DRR, mask_sh)
 
 void dcn31_timing_generator_init(struct optc *optc1);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
index 62532da94913..4d7588f2ee79 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
@@ -211,8 +211,10 @@ static void enc32_stream_encoder_hdmi_set_stream_attribute(
 		HDMI_GC_SEND, 1,
 		HDMI_NULL_SEND, 1);
 
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
 	/* Disable Audio Content Protection packet transmission */
 	REG_UPDATE(HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, 0);
+#endif
 
 	/* following belongs to audio */
 	/* Enable Audio InfoFrame packet transmission. */
@@ -301,6 +303,21 @@ static void enc32_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 0);
 
+	/* DIG Resync FIFO now needs to be explicitly enabled
+	 */
+	// TODO: Confirm if we need to wait for DIG_SYMCLK_FE_ON
+	REG_WAIT(DIG_FE_CNTL, DIG_SYMCLK_FE_ON, 1, 10, 5000);
+
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 1);
+
+	REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 1, 10, 5000);
+
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 0);
+
+	REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 0, 10, 5000);
+
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, 1);
+
 	/* wait 100us for DIG/DP logic to prime
 	 * (i.e. a few video lines)
 	 */
@@ -354,6 +371,23 @@ static void enc32_read_state(struct stream_encoder *enc, struct enc_state *s)
 	}
 }
 
+static void enc32_stream_encoder_reset_fifo(struct stream_encoder *enc)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+	uint32_t fifo_enabled;
+
+	REG_GET(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, &fifo_enabled);
+
+	if (fifo_enabled == 0) {
+		/* reset DIG resync FIFO */
+		REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 1);
+		/* TODO: fix timeout when wait for DIG_FIFO_RESET_DONE */
+		//REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 1, 1, 100);
+		udelay(1);
+		REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 0);
+		REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 0, 1, 100);
+	}
+}
 
 static const struct stream_encoder_funcs dcn32_str_enc_funcs = {
 	.dp_set_odm_combine =
@@ -375,7 +409,7 @@ static const struct stream_encoder_funcs dcn32_str_enc_funcs = {
 	.stop_dp_info_packets =
 		enc1_stream_encoder_stop_dp_info_packets,
 	.reset_fifo =
-		enc1_stream_encoder_reset_fifo,
+		enc32_stream_encoder_reset_fifo,
 	.dp_blank =
 		enc1_stream_encoder_dp_blank,
 	.dp_unblank =
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
index 7241080b1553..77da0a13525b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
@@ -89,7 +89,8 @@
 	SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
 	SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
 	SRI(DIG_FE_CNTL, DIG, id), \
-	SRI(DIG_CLOCK_PATTERN, DIG, id)
+	SRI(DIG_CLOCK_PATTERN, DIG, id), \
+	SRI(DIG_FIFO_CTRL0, DIG, id)
 
 
 #define SE_COMMON_MASK_SH_LIST_DCN32_BASE(mask_sh)\
@@ -233,12 +234,22 @@
 	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE_REFERENCE, mask_sh),\
 	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE, mask_sh),\
 	SE_SF(DIG0_DIG_FE_CNTL, DOLBY_VISION_EN, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_SYMCLK_FE_ON, mask_sh),\
 	SE_SF(DP0_DP_SEC_FRAMING4, DP_SST_SDP_SPLITTING, mask_sh),\
-	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh)
+	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_READ_START_LEVEL, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_RESET, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, mask_sh)
 
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
 #define SE_COMMON_MASK_SH_LIST_DCN32(mask_sh)\
 	SE_COMMON_MASK_SH_LIST_DCN32_BASE(mask_sh),\
 	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, mask_sh)
+#else
+#define SE_COMMON_MASK_SH_LIST_DCN32(mask_sh)\
+	SE_COMMON_MASK_SH_LIST_DCN32_BASE(mask_sh)
+#endif
 
 void dcn32_dio_stream_encoder_construct(
 	struct dcn10_stream_encoder *enc1,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index d0a222f1a09c..40afd33ffec6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -649,7 +649,7 @@ void dcn32_init_hw(struct dc *dc)
 	 * Otherwise, if taking control is not possible, we need to power
 	 * everything down.
 	 */
-	if (dcb->funcs->is_accelerated_mode(dcb) || dc->config.power_down_display_on_boot) {
+	if (dcb->funcs->is_accelerated_mode(dcb) || dc->config.seamless_boot_edp_requested) {
 		hws->funcs.init_pipes(dc, dc->current_state);
 		if (dc->res_pool->hubbub->funcs->allow_self_refresh_control)
 			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub,
@@ -661,7 +661,7 @@ void dcn32_init_hw(struct dc *dc)
 	 * To avoid this, power down hardware on boot
 	 * if DIG is turned on and seamless boot not enabled
 	 */
-	if (dc->config.power_down_display_on_boot) {
+	if (dc->config.seamless_boot_edp_requested) {
 		struct dc_link *edp_links[MAX_NUM_EDP];
 		struct dc_link *edp_link;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
index f1ed25e972f2..88275ea4193c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
@@ -91,10 +91,18 @@ static void optc32_set_odm_combine(struct timing_generator *optc, int *opp_id, i
 	REG_UPDATE(OPTC_WIDTH_CONTROL,
 			OPTC_SEGMENT_WIDTH, mpcc_hactive);
 
-	REG_SET(OTG_H_TIMING_CNTL, 0, OTG_H_TIMING_DIV_MODE, opp_cnt - 1);
+	REG_UPDATE(OTG_H_TIMING_CNTL,
+			OTG_H_TIMING_DIV_MODE, opp_cnt - 1);
 	optc1->opp_count = opp_cnt;
 }
 
+static void optc32_set_h_timing_div_manual_mode(struct timing_generator *optc, bool manual_mode)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_H_TIMING_CNTL,
+			OTG_H_TIMING_DIV_MODE_MANUAL, manual_mode ? 1 : 0);
+}
 /**
  * Enable CRTC
  * Enable CRTC - call ASIC Control Object to enable Timing generator.
@@ -157,6 +165,29 @@ void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
 	REG_WAIT(OTG_CLOCK_CONTROL, OTG_BUSY, 0, 1, 100000);
 }
 
+static void optc32_set_odm_bypass(struct timing_generator *optc,
+		const struct dc_crtc_timing *dc_crtc_timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	enum h_timing_div_mode h_div = H_TIMING_NO_DIV;
+
+	REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
+			OPTC_NUM_OF_INPUT_SEGMENT, 0,
+			OPTC_SEG0_SRC_SEL, optc->inst,
+			OPTC_SEG1_SRC_SEL, 0xf,
+			OPTC_SEG2_SRC_SEL, 0xf,
+			OPTC_SEG3_SRC_SEL, 0xf
+			);
+
+	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	REG_UPDATE(OTG_H_TIMING_CNTL,
+			OTG_H_TIMING_DIV_MODE, h_div);
+
+	REG_SET(OPTC_MEMORY_CONFIG, 0,
+			OPTC_MEM_SEL, 0);
+	optc1->opp_count = 1;
+}
+
 
 static struct timing_generator_funcs dcn32_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
@@ -206,8 +237,9 @@ static struct timing_generator_funcs dcn32_tg_funcs = {
 		.set_dsc_config = optc3_set_dsc_config,
 		.get_dsc_status = optc2_get_dsc_status,
 		.set_dwb_source = NULL,
-		.set_odm_bypass = optc3_set_odm_bypass,
+		.set_odm_bypass = optc32_set_odm_bypass,
 		.set_odm_combine = optc32_set_odm_combine,
+		.set_h_timing_div_manual_mode = optc32_set_h_timing_div_manual_mode,
 		.get_optc_source = optc2_get_optc_source,
 		.set_out_mux = optc3_set_out_mux,
 		.set_drr_trigger_window = optc3_set_drr_trigger_window,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 17a287bc89ce..7ac6428aae52 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -77,7 +77,7 @@
 
 #include "dcn/dcn_3_2_0_offset.h"
 #include "dcn/dcn_3_2_0_sh_mask.h"
-#include "dcn/nbio_4_3_0_offset.h"
+#include "nbio/nbio_4_3_0_offset.h"
 
 #include "reg_helper.h"
 #include "dce/dmub_abm.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index f79dd40f8d81..8d4c74b0fc90 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -811,9 +811,14 @@ void dcn20_calculate_dlg_params(
 		pipes[pipe_idx].pipe.dest.vupdate_offset = get_vupdate_offset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
 		pipes[pipe_idx].pipe.dest.vupdate_width = get_vupdate_width(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
 		pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
-		context->res_ctx.pipe_ctx[i].det_buffer_size_kb = context->bw_ctx.dml.ip.det_buffer_size_kbytes;
-		context->res_ctx.pipe_ctx[i].unbounded_req = pipes[pipe_idx].pipe.src.unbounded_req_mode;
-
+		if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			// Phantom pipe requires that DET_SIZE = 0 and no unbounded requests
+			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = 0;
+			context->res_ctx.pipe_ctx[i].unbounded_req = false;
+		} else {
+			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = context->bw_ctx.dml.ip.det_buffer_size_kbytes;
+			context->res_ctx.pipe_ctx[i].unbounded_req = pipes[pipe_idx].pipe.src.unbounded_req_mode;
+		}
 		if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
 			context->bw_ctx.bw.dcn.clk.dppclk_khz = pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
 		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz =
@@ -1013,6 +1018,31 @@ int dcn20_populate_dml_pipes_from_context(
 			pipes[pipe_cnt].pipe.dest.pixel_rate_mhz *= 2;
 		pipes[pipe_cnt].pipe.dest.otg_inst = res_ctx->pipe_ctx[i].stream_res.tg->inst;
 		pipes[pipe_cnt].dout.dp_lanes = 4;
+		if (res_ctx->pipe_ctx[i].stream->link) {
+			switch (res_ctx->pipe_ctx[i].stream->link->cur_link_settings.link_rate) {
+			case LINK_RATE_HIGH:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_hbr;
+				break;
+			case LINK_RATE_HIGH2:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_hbr2;
+				break;
+			case LINK_RATE_HIGH3:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_hbr3;
+				break;
+			case LINK_RATE_UHBR10:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_uhbr10;
+				break;
+			case LINK_RATE_UHBR13_5:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_uhbr13p5;
+				break;
+			case LINK_RATE_UHBR20:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_uhbr20;
+				break;
+			default:
+				pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_na;
+				break;
+			}
+		}
 		pipes[pipe_cnt].dout.is_virtual = 0;
 		pipes[pipe_cnt].pipe.dest.vtotal_min = res_ctx->pipe_ctx[i].stream->adjust.v_total_min;
 		pipes[pipe_cnt].pipe.dest.vtotal_max = res_ctx->pipe_ctx[i].stream->adjust.v_total_max;
@@ -1070,6 +1100,7 @@ int dcn20_populate_dml_pipes_from_context(
 			pipes[pipe_cnt].dout.is_virtual = 1;
 			pipes[pipe_cnt].dout.output_type = dm_dp;
 			pipes[pipe_cnt].dout.dp_lanes = 4;
+			pipes[pipe_cnt].dout.dp_rate = dm_dp_rate_hbr2;
 		}
 
 		switch (res_ctx->pipe_ctx[i].stream->timing.display_color_depth) {
@@ -1138,7 +1169,8 @@ int dcn20_populate_dml_pipes_from_context(
 		 * bw calculations due to cursor on/off
 		 */
 		if (res_ctx->pipe_ctx[i].plane_state &&
-				res_ctx->pipe_ctx[i].plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
+				(res_ctx->pipe_ctx[i].plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE ||
+				 res_ctx->pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM))
 			pipes[pipe_cnt].pipe.src.num_cursors = 0;
 		else
 			pipes[pipe_cnt].pipe.src.num_cursors = dc->dml.ip.number_of_cursors;
@@ -1149,6 +1181,7 @@ int dcn20_populate_dml_pipes_from_context(
 		if (!res_ctx->pipe_ctx[i].plane_state) {
 			pipes[pipe_cnt].pipe.src.is_hsplit = pipes[pipe_cnt].pipe.dest.odm_combine != dm_odm_combine_mode_disabled;
 			pipes[pipe_cnt].pipe.src.source_scan = dm_horz;
+			pipes[pipe_cnt].pipe.src.source_rotation = dm_rotation_0;
 			pipes[pipe_cnt].pipe.src.sw_mode = dm_sw_4kb_s;
 			pipes[pipe_cnt].pipe.src.macro_tile_size = dm_64k_tile;
 			pipes[pipe_cnt].pipe.src.viewport_width = timing->h_addressable;
@@ -1201,8 +1234,26 @@ int dcn20_populate_dml_pipes_from_context(
 
 			pipes[pipe_cnt].pipe.src.source_scan = pln->rotation == ROTATION_ANGLE_90
 					|| pln->rotation == ROTATION_ANGLE_270 ? dm_vert : dm_horz;
+			switch (pln->rotation) {
+			case ROTATION_ANGLE_0:
+				pipes[pipe_cnt].pipe.src.source_rotation = dm_rotation_0;
+				break;
+			case ROTATION_ANGLE_90:
+				pipes[pipe_cnt].pipe.src.source_rotation = dm_rotation_90;
+				break;
+			case ROTATION_ANGLE_180:
+				pipes[pipe_cnt].pipe.src.source_rotation = dm_rotation_180;
+				break;
+			case ROTATION_ANGLE_270:
+				pipes[pipe_cnt].pipe.src.source_rotation = dm_rotation_270;
+				break;
+			default:
+				break;
+			}
 			pipes[pipe_cnt].pipe.src.viewport_y_y = scl->viewport.y;
 			pipes[pipe_cnt].pipe.src.viewport_y_c = scl->viewport_c.y;
+			pipes[pipe_cnt].pipe.src.viewport_x_y = scl->viewport.x;
+			pipes[pipe_cnt].pipe.src.viewport_x_c = scl->viewport_c.x;
 			pipes[pipe_cnt].pipe.src.viewport_width = scl->viewport.width;
 			pipes[pipe_cnt].pipe.src.viewport_width_c = scl->viewport_c.width;
 			pipes[pipe_cnt].pipe.src.viewport_height = scl->viewport.height;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 555d4d9e1454..0317af5bb8ca 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -195,6 +195,16 @@ struct resource_funcs {
 	enum dc_status (*add_dsc_to_stream_resource)(
 			struct dc *dc, struct dc_state *state,
 			struct dc_stream_state *stream);
+
+	void (*add_phantom_pipes)(
+            struct dc *dc,
+            struct dc_state *context,
+            display_e2e_pipe_params_st *pipes,
+			unsigned int pipe_cnt,
+            unsigned int index);
+	void (*remove_phantom_pipes)(
+            struct dc *dc,
+            struct dc_state *context);
 };
 
 struct audio_support{
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
index b2fa4de47734..5cc6d1fb887d 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h
@@ -45,9 +45,10 @@ enum physymclk_clock_source {
 	PHYSYMCLK_FORCE_SRC_PHYD32CLK, // Select phyd32clk as the source of clock which is output to PHY through DCIO.
 };
 
-enum hdmistreamclk_source {
+enum streamclk_source {
 	REFCLK,                   // Selects REFCLK as source for hdmistreamclk.
 	DTBCLK0,                  // Selects DTBCLK0 as source for hdmistreamclk.
+	DPREFCLK,                 // Selects DPREFCLK as source for hdmistreamclk
 };
 
 enum dentist_dispclk_change_mode {
@@ -82,7 +83,7 @@ struct dccg_funcs {
 
 	void (*set_dpstreamclk)(
 			struct dccg *dccg,
-			enum hdmistreamclk_source src,
+			enum streamclk_source src,
 			int otg_inst);
 
 	void (*enable_symclk32_se)(
@@ -111,8 +112,8 @@ struct dccg_funcs {
 
 	void (*set_dtbclk_dto)(
 			struct dccg *dccg,
-			int dtbclk_inst,
-			int req_dtbclk_khz,
+			int otg_inst,
+			int pixclk_khz,
 			int num_odm_segments,
 			const struct dc_crtc_timing *timing);
 
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index 9195dec294c2..e7571c6f5ead 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -47,6 +47,8 @@ struct dcn_hubbub_wm_set {
 	uint32_t sr_enter;
 	uint32_t sr_exit;
 	uint32_t dram_clk_chanage;
+	uint32_t usr_retrain;
+	uint32_t fclk_pstate_change;
 };
 
 struct dcn_hubbub_wm {
@@ -168,6 +170,7 @@ struct hubbub_funcs {
 	void (*program_det_size)(struct hubbub *hubbub, int hubp_inst, unsigned det_buffer_size_in_kbyte);
 	void (*program_compbuf_size)(struct hubbub *hubbub, unsigned compbuf_size_kb, bool safe_to_increase);
 	void (*init_crb)(struct hubbub *hubbub);
+	void (*force_usr_retraining_allow)(struct hubbub *hubbub, bool allow);
 };
 
 struct hubbub {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index ad69d78c4ac3..b2cdb6bfc9b8 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -140,6 +140,9 @@ struct hubp_funcs {
 
 	void (*set_blank)(struct hubp *hubp, bool blank);
 	void (*set_blank_regs)(struct hubp *hubp, bool blank);
+#ifdef CONFIG_DRM_AMD_DC_DCN
+	void (*phantom_hubp_post_enable)(struct hubp *hubp);
+#endif
 	void (*set_hubp_blank_en)(struct hubp *hubp, bool blank);
 
 	void (*set_cursor_attributes)(
@@ -193,6 +196,10 @@ struct hubp_funcs {
 	bool (*hubp_in_blank)(struct hubp *hubp);
 	void (*hubp_soft_reset)(struct hubp *hubp, bool reset);
 
+	void (*hubp_update_force_pstate_disallow)(struct hubp *hubp, bool allow);
+	void (*hubp_update_mall_sel)(struct hubp *hubp, uint32_t mall_sel);
+	void (*hubp_prepare_subvp_buffering)(struct hubp *hubp, bool enable);
+
 	void (*hubp_set_flip_int)(struct hubp *hubp);
 
 	void (*program_extended_blank)(struct hubp *hubp,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
index 8798cfa11a4d..b72fb314d804 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
@@ -37,6 +37,7 @@ struct cstate_pstate_watermarks_st {
 	uint32_t cstate_enter_plus_exit_z8_ns;
 	uint32_t cstate_enter_plus_exit_ns;
 	uint32_t pstate_change_ns;
+	uint32_t fclk_pstate_change_ns;
 };
 
 struct dcn_watermarks {
@@ -46,6 +47,7 @@ struct dcn_watermarks {
 	uint32_t frac_urg_bw_flip;
 	int32_t urgent_latency_ns;
 	struct cstate_pstate_watermarks_st cstate_pstate;
+	uint32_t usr_retraining_ns;
 };
 
 struct dcn_watermark_set {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
index 678c2065e5e8..36ec56524afd 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/stream_encoder.h
@@ -164,6 +164,10 @@ struct stream_encoder_funcs {
 	void (*stop_dp_info_packets)(
 		struct stream_encoder *enc);
 
+	void (*reset_fifo)(
+		struct stream_encoder *enc
+	);
+
 	void (*dp_blank)(
 		struct dc_link *link,
 		struct stream_encoder *enc);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
index 554d2e33bd7f..a89b2230cd2c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/timing_generator.h
@@ -174,6 +174,9 @@ struct timing_generator_funcs {
 
 	bool (*enable_crtc)(struct timing_generator *tg);
 	bool (*disable_crtc)(struct timing_generator *tg);
+#ifdef CONFIG_DRM_AMD_DC_DCN
+	void (*phantom_crtc_post_enable)(struct timing_generator *tg);
+#endif
 	bool (*immediate_disable_crtc)(struct timing_generator *tg);
 	bool (*is_counter_moving)(struct timing_generator *tg);
 	void (*get_position)(struct timing_generator *tg,
@@ -293,6 +296,7 @@ struct timing_generator_funcs {
 	void (*set_odm_bypass)(struct timing_generator *optc, const struct dc_crtc_timing *dc_crtc_timing);
 	void (*set_odm_combine)(struct timing_generator *optc, int *opp_id, int opp_cnt,
 			struct dc_crtc_timing *timing);
+	void (*set_h_timing_div_manual_mode)(struct timing_generator *optc, bool manual_mode);
 	void (*set_gsl)(struct timing_generator *optc, const struct gsl_params *params);
 	void (*set_gsl_source_select)(struct timing_generator *optc,
 			int group_idx,
@@ -310,8 +314,10 @@ struct timing_generator_funcs {
 			uint32_t slave_pixel_clock_100Hz,
 			uint8_t master_clock_divider,
 			uint8_t slave_clock_divider);
-
-	void (*init_odm)(struct timing_generator *tg);
+	bool (*validate_vmin_vmax)(struct timing_generator *optc,
+			int vmin, int vmax);
+	bool (*validate_vtotal_change_limit)(struct timing_generator *optc,
+			uint32_t vtotal_change_limit);
 };
 
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
index 05053f3b4ab7..eb616a4ed508 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer.h
@@ -244,6 +244,8 @@ struct hw_sequencer_funcs {
 			struct pipe_ctx *pipe_ctx,
 			struct tg_color *color,
 			int mpcc_id);
+
+	void (*commit_subvp_config)(struct dc *dc, struct dc_state *context);
 };
 
 void color_space_to_black_color(
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
index 8c2f190c4712..5a0648784872 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw_sequencer_private.h
@@ -143,6 +143,11 @@ struct hwseq_private_funcs {
 	void (*PLAT_58856_wa)(struct dc_state *context,
 			struct pipe_ctx *pipe_ctx);
 	void (*setup_hpo_hw_control)(const struct dce_hwseq *hws, bool enable);
+#ifdef CONFIG_DRM_AMD_DC_DCN
+	void (*program_mall_pipe_config)(struct dc *dc, struct dc_state *context);
+	void (*subvp_update_force_pstate)(struct dc *dc, struct dc_state *context);
+	void (*update_mall_sel)(struct dc *dc, struct dc_state *context);
+#endif
 };
 
 struct dce_hwseq {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 2369f38ed06f..58158764adc0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -205,6 +205,13 @@ bool get_temp_dp_link_res(struct dc_link *link,
 		struct link_resource *link_res,
 		struct dc_link_settings *link_settings);
 
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+struct hpo_dp_link_encoder *resource_get_hpo_dp_link_enc_for_det_lt(
+		const struct resource_context *res_ctx,
+		const struct resource_pool *pool,
+		const struct dc_link *link);
+#endif
+
 void reset_syncd_pipes_from_disabled_pipes(struct dc *dc,
 	struct dc_state *context);
 
diff --git a/drivers/gpu/drm/amd/display/include/bios_parser_types.h b/drivers/gpu/drm/amd/display/include/bios_parser_types.h
index cf4027cc3f4c..83058bcbb2e8 100644
--- a/drivers/gpu/drm/amd/display/include/bios_parser_types.h
+++ b/drivers/gpu/drm/amd/display/include/bios_parser_types.h
@@ -335,4 +335,14 @@ struct bp_soc_bb_info {
 	uint32_t dram_sr_enter_exit_latency_100ns;
 };
 
+struct bp_connector_speed_cap_info {
+	uint32_t DP_HBR2_EN:1;
+	uint32_t DP_HBR3_EN:1;
+	uint32_t HDMI_6GB_EN:1;
+	uint32_t DP_UHBR10_EN:1;
+	uint32_t DP_UHBR13_5_EN:1;
+	uint32_t DP_UHBR20_EN:1;
+	uint32_t RESERVED:29;
+};
+
 #endif /*__DAL_BIOS_PARSER_TYPES_H__ */
-- 
2.35.3

