Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 214BA38CC57
	for <lists+amd-gfx@lfdr.de>; Fri, 21 May 2021 19:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534616E5A4;
	Fri, 21 May 2021 17:37:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B533F6E526
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 May 2021 17:37:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDvCH4A8XSmGhGY/oSYvFzZ2ezTAZyy7TO2HwUCSa4nq0hiotGJ+tLQz2rXU72u3ilEsBk1zkEqV1cauV1Kjl8+dCvAyf065EyskZM8PfoS1Cf08w1PJOO1YVcvhgJpRO17T/Og17qPW3fHRERlWHvstRVMD0rWwtOQcaafvkHNOooSoTvInToiz9aCOrdIgFrFISRBUJe+UXWeNmXly7IJ4RP7ZTBHgJJa+VIixSOQKy4SW07Y+MclcBt2QZ39SxgoO2aCBpUuIV+CnkYWkxwCzl6Z4OTxLUmlwXAxuIAaYRfb9E5F77B3RbqL8u/aM8aTtfh3Y/lCtVHI3ysB0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqreilSVfPq73ujpEP5+itxZ6ZezUh4KPjYdqVxhHEY=;
 b=BGpKAjEQEFezwr44wJgOXkNtgLsry9Ire4lr0Sh1NRiCpBOKFs69NTnYH8Aacd5oTpHdEE11Vb9GPgzZeYdUCFXX3ARe+dBGCN1eWotpP07rcKGeZ80R1xCDMnG6KtdhM+N3LlSvt4WPBJ+RGNr+h6At1JFesnukdthJZKCKbUTmAOi7fRR4iIHv67LlvRpFHZFkgyMXGhsJsymC10l6HKgYWtsZVwiAk5BNBFA7qqw/NO6wPH2Y6vH22eIWXeFJVTCy6/ykN7vOZvF/M1kUT/JHEZkNJNAeL6e5s9sviXyFxvhEbBsbtXLyFunWp50g6BWPnyWPDuQUabkOpnByxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqreilSVfPq73ujpEP5+itxZ6ZezUh4KPjYdqVxhHEY=;
 b=dPgD2FA7czWiP15ml43BTAmD5vABDKl+dRZFotNnjYMBmfHQZ9+w/n57PM0Z4+ao4wrzTDYQxT2yuOyA3+c7IiVS61S+i471tnA/IHEh8gXeABW7WGyPFcLFcI106c1zD9Fq8gCmvZM2WYdVQYZ8TErkS3CulHl2BFB2oaPVZ/E=
Received: from BN8PR15CA0069.namprd15.prod.outlook.com (2603:10b6:408:80::46)
 by CY4PR1201MB0181.namprd12.prod.outlook.com (2603:10b6:910:1f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 21 May
 2021 17:37:09 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::68) by BN8PR15CA0069.outlook.office365.com
 (2603:10b6:408:80::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend
 Transport; Fri, 21 May 2021 17:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 21 May 2021 17:37:09 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 21 May
 2021 12:37:07 -0500
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/15] drm/amd/display: fix odm scaling
Date: Fri, 21 May 2021 13:36:44 -0400
Message-ID: <20210521173646.1140586-14-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210521173646.1140586-1-qingqing.zhuo@amd.com>
References: <20210521173646.1140586-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac3145be-c053-44d7-d344-08d91c7f0f96
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0181:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0181437AFF904180F923B7E4FB299@CY4PR1201MB0181.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GwtaF3Wn3DcJXSHQEV6002Gyj9YeQcNtqg2HfphAtE7+/KqifZWBsddl8w2cPej/+iN37gaQN7l/d1dbbkPBwJHyDhMtoZq3zz/t6zJNNZ90rOGR9kKX5ibhtefQ8LmWeyWBJvo3H6uYIUuoRuNsjj2jbtbKv/1kZHhCbYoTXnjZEszlm/AgANDidHtMNxnqBTh/SBVM9uJIi7bTB7kqpk0zEiEIVwOrUFryPoqYJqquQjYlWr8zXGQIxSpUw2wjm6pfxJb7yh/fKlofINk6lYN0IpBMlfhIR4GIvKjfa1aR4eUjb+8psnywzkIz38oZ1YLRL18qiinDbCmcj34cg09+HFVyVwXnrB96tOiEr/NVxOT38ZvQW5NcjWmHHtQemj88Mb/rwXuH+NfVeiLTgDj5rI+oHfKYeoN8hV8WDMw612cKyAWh9dGx7AL5ZKcsNSi5vOH2RAQ9YNKUdtVxBHgpT4BpMYcoeHQo2yaqpcnAUfwC3/43sl3PXtlYZixKryb2hEgeA8G/vlmiz29jkADpLM5fdo3gUdMJiPIwmKNbCh3NnsltoH9c/K0NZczhPwpMCXlYcBJhQeZfBV0ovJ12f1zmCfpBofaao51vNBQ9xXCxqqd9XhCjmnEiZtZJHJff1Qz8Qo5puukeui00aiKPV7KtkYU3rkNOLr8W45BwFvAvAOYkIX2grm/+0qxu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(376002)(39850400004)(36840700001)(46966006)(26005)(47076005)(81166007)(82740400003)(2906002)(336012)(356005)(2616005)(8936002)(30864003)(82310400003)(86362001)(6666004)(36756003)(426003)(5660300002)(16526019)(186003)(478600001)(316002)(70586007)(54906003)(8676002)(44832011)(70206006)(4326008)(6916009)(36860700001)(1076003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:37:09.7173 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac3145be-c053-44d7-d344-08d91c7f0f96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0181
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
Cc: Dmytro
 Laktyushkin <Dmytro.Laktyushkin@amd.com>, Eryk.Brol@amd.com, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, Anson.Jacob@amd.com, Aurabindo.Pillai@amd.com,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet.Lakha@amd.com, bindu.r@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>

There are two issues with scaling calculations, odm recout
calculation and matching viewport to actual recout.

This change fixes both issues. Odm recout calculation via
special casing and viewport matching issue by reworking
the viewport calcualtion to use scaling ratios and recout
to derrive the required offset and size.

Signed-off-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 568 +++++++-----------
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   5 -
 .../drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c |  12 +-
 .../drm/amd/display/dc/dcn20/dcn20_resource.c |  14 +-
 .../amd/display/dc/dml/display_mode_structs.h |   2 +
 .../drm/amd/display/dc/dml/display_mode_vba.c |  13 +
 .../gpu/drm/amd/display/dc/inc/hw/transform.h |   4 -
 7 files changed, 232 insertions(+), 386 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 8a158a192ec0..aea7d4cbb62c 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -701,124 +701,23 @@ static void calculate_split_count_and_index(struct pipe_ctx *pipe_ctx, int *spli
 	}
 }
 
-static void calculate_viewport(struct pipe_ctx *pipe_ctx)
+/*
+ * This is a preliminary vp size calculation to allow us to check taps support.
+ * The result is completely overridden afterwards.
+ */
+static void calculate_viewport_size(struct pipe_ctx *pipe_ctx)
 {
-	const struct dc_plane_state *plane_state = pipe_ctx->plane_state;
-	const struct dc_stream_state *stream = pipe_ctx->stream;
 	struct scaler_data *data = &pipe_ctx->plane_res.scl_data;
-	struct rect surf_src = plane_state->src_rect;
-	struct rect clip, dest;
-	int vpc_div = (data->format == PIXEL_FORMAT_420BPP8
-			|| data->format == PIXEL_FORMAT_420BPP10) ? 2 : 1;
-	int split_count = 0;
-	int split_idx = 0;
-	bool orthogonal_rotation, flip_y_start, flip_x_start;
-
-	calculate_split_count_and_index(pipe_ctx, &split_count, &split_idx);
 
-	if (stream->view_format == VIEW_3D_FORMAT_SIDE_BY_SIDE ||
-		stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM) {
-		split_count = 0;
-		split_idx = 0;
-	}
-
-	/* The actual clip is an intersection between stream
-	 * source and surface clip
-	 */
-	dest = plane_state->dst_rect;
-	clip.x = stream->src.x > plane_state->clip_rect.x ?
-			stream->src.x : plane_state->clip_rect.x;
-
-	clip.width = stream->src.x + stream->src.width <
-			plane_state->clip_rect.x + plane_state->clip_rect.width ?
-			stream->src.x + stream->src.width - clip.x :
-			plane_state->clip_rect.x + plane_state->clip_rect.width - clip.x ;
-
-	clip.y = stream->src.y > plane_state->clip_rect.y ?
-			stream->src.y : plane_state->clip_rect.y;
-
-	clip.height = stream->src.y + stream->src.height <
-			plane_state->clip_rect.y + plane_state->clip_rect.height ?
-			stream->src.y + stream->src.height - clip.y :
-			plane_state->clip_rect.y + plane_state->clip_rect.height - clip.y ;
-
-	/*
-	 * Need to calculate how scan origin is shifted in vp space
-	 * to correctly rotate clip and dst
-	 */
-	get_vp_scan_direction(
-			plane_state->rotation,
-			plane_state->horizontal_mirror,
-			&orthogonal_rotation,
-			&flip_y_start,
-			&flip_x_start);
-
-	if (orthogonal_rotation) {
-		swap(clip.x, clip.y);
-		swap(clip.width, clip.height);
-		swap(dest.x, dest.y);
-		swap(dest.width, dest.height);
-	}
-	if (flip_x_start) {
-		clip.x = dest.x + dest.width - clip.x - clip.width;
-		dest.x = 0;
-	}
-	if (flip_y_start) {
-		clip.y = dest.y + dest.height - clip.y - clip.height;
-		dest.y = 0;
-	}
-
-	/* offset = surf_src.ofs + (clip.ofs - surface->dst_rect.ofs) * scl_ratio
-	 * num_pixels = clip.num_pix * scl_ratio
-	 */
-	data->viewport.x = surf_src.x + (clip.x - dest.x) * surf_src.width / dest.width;
-	data->viewport.width = clip.width * surf_src.width / dest.width;
-
-	data->viewport.y = surf_src.y + (clip.y - dest.y) * surf_src.height / dest.height;
-	data->viewport.height = clip.height * surf_src.height / dest.height;
-
-	/* Handle split */
-	if (split_count) {
-		/* extra pixels in the division remainder need to go to pipes after
-		 * the extra pixel index minus one(epimo) defined here as:
-		 */
-		int epimo = 0;
-
-		if (orthogonal_rotation) {
-			if (flip_y_start)
-				split_idx = split_count - split_idx;
-
-			epimo = split_count - data->viewport.height % (split_count + 1);
-
-			data->viewport.y += (data->viewport.height / (split_count + 1)) * split_idx;
-			if (split_idx > epimo)
-				data->viewport.y += split_idx - epimo - 1;
-			data->viewport.height = data->viewport.height / (split_count + 1) + (split_idx > epimo ? 1 : 0);
-		} else {
-			if (flip_x_start)
-				split_idx = split_count - split_idx;
-
-			epimo = split_count - data->viewport.width % (split_count + 1);
-
-			data->viewport.x += (data->viewport.width / (split_count + 1)) * split_idx;
-			if (split_idx > epimo)
-				data->viewport.x += split_idx - epimo - 1;
-			data->viewport.width = data->viewport.width / (split_count + 1) + (split_idx > epimo ? 1 : 0);
-		}
+	data->viewport.width = dc_fixpt_ceil(dc_fixpt_mul_int(data->ratios.horz, data->recout.width));
+	data->viewport.height = dc_fixpt_ceil(dc_fixpt_mul_int(data->ratios.vert, data->recout.height));
+	data->viewport_c.width = dc_fixpt_ceil(dc_fixpt_mul_int(data->ratios.horz_c, data->recout.width));
+	data->viewport_c.height = dc_fixpt_ceil(dc_fixpt_mul_int(data->ratios.vert_c, data->recout.height));
+	if (pipe_ctx->plane_state->rotation == ROTATION_ANGLE_90 ||
+			pipe_ctx->plane_state->rotation == ROTATION_ANGLE_270) {
+		swap(data->viewport.width, data->viewport.height);
+		swap(data->viewport_c.width, data->viewport_c.height);
 	}
-
-	/* Round down, compensate in init */
-	data->viewport_c.x = data->viewport.x / vpc_div;
-	data->viewport_c.y = data->viewport.y / vpc_div;
-	data->inits.h_c = (data->viewport.x % vpc_div) != 0 ? dc_fixpt_half : dc_fixpt_zero;
-	data->inits.v_c = (data->viewport.y % vpc_div) != 0 ? dc_fixpt_half : dc_fixpt_zero;
-
-	/* Round up, assume original video size always even dimensions */
-	data->viewport_c.width = (data->viewport.width + vpc_div - 1) / vpc_div;
-	data->viewport_c.height = (data->viewport.height + vpc_div - 1) / vpc_div;
-
-	data->viewport_unadjusted = data->viewport;
-	data->viewport_c_unadjusted = data->viewport_c;
 }
 
 static void calculate_recout(struct pipe_ctx *pipe_ctx)
@@ -827,26 +726,21 @@ static void calculate_recout(struct pipe_ctx *pipe_ctx)
 	const struct dc_stream_state *stream = pipe_ctx->stream;
 	struct scaler_data *data = &pipe_ctx->plane_res.scl_data;
 	struct rect surf_clip = plane_state->clip_rect;
-	bool pri_split_tb = pipe_ctx->bottom_pipe &&
-			pipe_ctx->bottom_pipe->plane_state == pipe_ctx->plane_state &&
-			stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM;
-	bool sec_split_tb = pipe_ctx->top_pipe &&
-			pipe_ctx->top_pipe->plane_state == pipe_ctx->plane_state &&
-			stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM;
-	int split_count = 0;
-	int split_idx = 0;
+	bool split_tb = stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM;
+	int split_count, split_idx;
 
 	calculate_split_count_and_index(pipe_ctx, &split_count, &split_idx);
+	if (stream->view_format == VIEW_3D_FORMAT_SIDE_BY_SIDE)
+		split_idx = 0;
 
 	/*
 	 * Only the leftmost ODM pipe should be offset by a nonzero distance
 	 */
-	if (!pipe_ctx->prev_odm_pipe) {
+	if (!pipe_ctx->prev_odm_pipe || split_idx == split_count) {
 		data->recout.x = stream->dst.x;
 		if (stream->src.x < surf_clip.x)
 			data->recout.x += (surf_clip.x - stream->src.x) * stream->dst.width
 						/ stream->src.width;
-
 	} else
 		data->recout.x = 0;
 
@@ -867,26 +761,31 @@ static void calculate_recout(struct pipe_ctx *pipe_ctx)
 	if (data->recout.height + data->recout.y > stream->dst.y + stream->dst.height)
 		data->recout.height = stream->dst.y + stream->dst.height - data->recout.y;
 
-	/* Handle h & v split, handle rotation using viewport */
-	if (sec_split_tb) {
-		data->recout.y += data->recout.height / 2;
-		/* Floor primary pipe, ceil 2ndary pipe */
-		data->recout.height = (data->recout.height + 1) / 2;
-	} else if (pri_split_tb)
+	/* Handle h & v split */
+	if (split_tb) {
+		ASSERT(data->recout.height % 2 == 0);
 		data->recout.height /= 2;
-	else if (split_count) {
-		/* extra pixels in the division remainder need to go to pipes after
-		 * the extra pixel index minus one(epimo) defined here as:
-		 */
-		int epimo = split_count - data->recout.width % (split_count + 1);
-
-		/*no recout offset due to odm */
+	} else if (split_count) {
 		if (!pipe_ctx->next_odm_pipe && !pipe_ctx->prev_odm_pipe) {
+			/* extra pixels in the division remainder need to go to pipes after
+			 * the extra pixel index minus one(epimo) defined here as:
+			 */
+			int epimo = split_count - data->recout.width % (split_count + 1);
+
 			data->recout.x += (data->recout.width / (split_count + 1)) * split_idx;
 			if (split_idx > epimo)
 				data->recout.x += split_idx - epimo - 1;
+			ASSERT(stream->view_format != VIEW_3D_FORMAT_SIDE_BY_SIDE || data->recout.width % 2 == 0);
+			data->recout.width = data->recout.width / (split_count + 1) + (split_idx > epimo ? 1 : 0);
+		} else {
+			/* odm */
+			if (split_idx == split_count) {
+				/* rightmost pipe is the remainder recout */
+				data->recout.width -= data->h_active * split_count - data->recout.x;
+				data->recout.x = 0;
+			} else
+				data->recout.width = data->h_active - data->recout.x;
 		}
-		data->recout.width = data->recout.width / (split_count + 1) + (split_idx > epimo ? 1 : 0);
 	}
 }
 
@@ -940,9 +839,15 @@ static void calculate_scaling_ratios(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->plane_res.scl_data.ratios.vert_c, 19);
 }
 
-static inline void adjust_vp_and_init_for_seamless_clip(
+
+/*
+ * We completely calculate vp offset, size and inits here based entirely on scaling
+ * ratios and recout for pixel perfect pipe combine.
+ */
+static void calculate_init_and_vp(
 		bool flip_scan_dir,
-		int recout_skip,
+		int recout_offset_within_recout_full,
+		int recout_size,
 		int src_size,
 		int taps,
 		struct fixed31_32 ratio,
@@ -950,91 +855,87 @@ static inline void adjust_vp_and_init_for_seamless_clip(
 		int *vp_offset,
 		int *vp_size)
 {
-	if (!flip_scan_dir) {
-		/* Adjust for viewport end clip-off */
-		if ((*vp_offset + *vp_size) < src_size) {
-			int vp_clip = src_size - *vp_size - *vp_offset;
-			int int_part = dc_fixpt_floor(dc_fixpt_sub(*init, ratio));
-
-			int_part = int_part > 0 ? int_part : 0;
-			*vp_size += int_part < vp_clip ? int_part : vp_clip;
-		}
-
-		/* Adjust for non-0 viewport offset */
-		if (*vp_offset) {
-			int int_part;
-
-			*init = dc_fixpt_add(*init, dc_fixpt_mul_int(ratio, recout_skip));
-			int_part = dc_fixpt_floor(*init) - *vp_offset;
-			if (int_part < taps) {
-				int int_adj = *vp_offset >= (taps - int_part) ?
-							(taps - int_part) : *vp_offset;
-				*vp_offset -= int_adj;
-				*vp_size += int_adj;
-				int_part += int_adj;
-			} else if (int_part > taps) {
-				*vp_offset += int_part - taps;
-				*vp_size -= int_part - taps;
-				int_part = taps;
-			}
-			init->value &= 0xffffffff;
-			*init = dc_fixpt_add_int(*init, int_part);
-		}
-	} else {
-		/* Adjust for non-0 viewport offset */
-		if (*vp_offset) {
-			int int_part = dc_fixpt_floor(dc_fixpt_sub(*init, ratio));
-
-			int_part = int_part > 0 ? int_part : 0;
-			*vp_size += int_part < *vp_offset ? int_part : *vp_offset;
-			*vp_offset -= int_part < *vp_offset ? int_part : *vp_offset;
-		}
+	struct fixed31_32 temp;
+	int int_part;
 
-		/* Adjust for viewport end clip-off */
-		if ((*vp_offset + *vp_size) < src_size) {
-			int int_part;
-			int end_offset = src_size - *vp_offset - *vp_size;
-
-			/*
-			 * this is init if vp had no offset, keep in mind this is from the
-			 * right side of vp due to scan direction
-			 */
-			*init = dc_fixpt_add(*init, dc_fixpt_mul_int(ratio, recout_skip));
-			/*
-			 * this is the difference between first pixel of viewport available to read
-			 * and init position, takning into account scan direction
-			 */
-			int_part = dc_fixpt_floor(*init) - end_offset;
-			if (int_part < taps) {
-				int int_adj = end_offset >= (taps - int_part) ?
-							(taps - int_part) : end_offset;
-				*vp_size += int_adj;
-				int_part += int_adj;
-			} else if (int_part > taps) {
-				*vp_size += int_part - taps;
-				int_part = taps;
-			}
-			init->value &= 0xffffffff;
-			*init = dc_fixpt_add_int(*init, int_part);
-		}
+	/*
+	 * First of the taps starts sampling pixel number <init_int_part> corresponding to recout
+	 * pixel 1. Next recout pixel samples int part of <init + scaling ratio> and so on.
+	 * All following calculations are based on this logic.
+	 *
+	 * Init calculated according to formula:
+	 * 	init = (scaling_ratio + number_of_taps + 1) / 2
+	 * 	init_bot = init + scaling_ratio
+	 * 	to get pixel perfect combine add the fraction from calculating vp offset
+	 */
+	temp = dc_fixpt_mul_int(ratio, recout_offset_within_recout_full);
+	*vp_offset = dc_fixpt_floor(temp);
+	temp.value &= 0xffffffff;
+	*init = dc_fixpt_truncate(dc_fixpt_add(dc_fixpt_div_int(
+			dc_fixpt_add_int(ratio, taps + 1), 2), temp), 19);
+	/*
+	 * If viewport has non 0 offset and there are more taps than covered by init then
+	 * we should decrease the offset and increase init so we are never sampling
+	 * outside of viewport.
+	 */
+	int_part = dc_fixpt_floor(*init);
+	if (int_part < taps) {
+		int_part = taps - int_part;
+		if (int_part > *vp_offset)
+			int_part = *vp_offset;
+		*vp_offset -= int_part;
+		*init = dc_fixpt_add_int(*init, int_part);
 	}
+	/*
+	 * If taps are sampling outside of viewport at end of recout and there are more pixels
+	 * available in the surface we should increase the viewport size, regardless set vp to
+	 * only what is used.
+	 */
+	temp = dc_fixpt_add(*init, dc_fixpt_mul_int(ratio, recout_size - 1));
+	*vp_size = dc_fixpt_floor(temp);
+	if (*vp_size + *vp_offset > src_size)
+		*vp_size = src_size - *vp_offset;
+
+	/* We did all the math assuming we are scanning same direction as display does,
+	 * however mirror/rotation changes how vp scans vs how it is offset. If scan direction
+	 * is flipped we simply need to calculate offset from the other side of plane.
+	 * Note that outside of viewport all scaling hardware works in recout space.
+	 */
+	if (flip_scan_dir)
+		*vp_offset = src_size - *vp_offset - *vp_size;
 }
 
-static void calculate_inits_and_adj_vp(struct pipe_ctx *pipe_ctx)
+static void calculate_inits_and_viewports(struct pipe_ctx *pipe_ctx)
 {
 	const struct dc_plane_state *plane_state = pipe_ctx->plane_state;
 	const struct dc_stream_state *stream = pipe_ctx->stream;
-	struct pipe_ctx *odm_pipe = pipe_ctx;
 	struct scaler_data *data = &pipe_ctx->plane_res.scl_data;
-	struct rect src = pipe_ctx->plane_state->src_rect;
-	int recout_skip_h, recout_skip_v, surf_size_h, surf_size_v;
+	struct rect src = plane_state->src_rect;
 	int vpc_div = (data->format == PIXEL_FORMAT_420BPP8
-			|| data->format == PIXEL_FORMAT_420BPP10) ? 2 : 1;
+				|| data->format == PIXEL_FORMAT_420BPP10) ? 2 : 1;
+	int split_count, split_idx, ro_lb, ro_tb, recout_full_x, recout_full_y;
 	bool orthogonal_rotation, flip_vert_scan_dir, flip_horz_scan_dir;
-	int odm_idx = 0;
 
+	calculate_split_count_and_index(pipe_ctx, &split_count, &split_idx);
 	/*
-	 * Need to calculate the scan direction for viewport to make adjustments
+	 * recout full is what the recout would have been if we didnt clip
+	 * the source plane at all. We only care about left(ro_lb) and top(ro_tb)
+	 * offsets of recout within recout full because those are the directions
+	 * we scan from and therefore the only ones that affect inits.
+	 */
+	recout_full_x = stream->dst.x + (plane_state->dst_rect.x - stream->src.x)
+			* stream->dst.width / stream->src.width;
+	recout_full_y = stream->dst.y + (plane_state->dst_rect.y - stream->src.y)
+			* stream->dst.height / stream->src.height;
+	if (pipe_ctx->prev_odm_pipe && split_idx)
+		ro_lb = data->h_active * split_idx - recout_full_x;
+	else
+		ro_lb = data->recout.x - recout_full_x;
+	ro_tb = data->recout.y - recout_full_y;
+	ASSERT(ro_lb >= 0 && ro_tb >= 0);
+
+	/*
+	 * Work in recout rotation since that requires less transformations
 	 */
 	get_vp_scan_direction(
 			plane_state->rotation,
@@ -1043,145 +944,62 @@ static void calculate_inits_and_adj_vp(struct pipe_ctx *pipe_ctx)
 			&flip_vert_scan_dir,
 			&flip_horz_scan_dir);
 
-	/* Calculate src rect rotation adjusted to recout space */
-	surf_size_h = src.x + src.width;
-	surf_size_v = src.y + src.height;
-	if (flip_horz_scan_dir)
-		src.x = 0;
-	if (flip_vert_scan_dir)
-		src.y = 0;
 	if (orthogonal_rotation) {
-		swap(src.x, src.y);
 		swap(src.width, src.height);
+		swap(flip_vert_scan_dir, flip_horz_scan_dir);
 	}
 
-	/*modified recout_skip_h calculation due to odm having no recout offset*/
-	while (odm_pipe->prev_odm_pipe) {
-		odm_idx++;
-		odm_pipe = odm_pipe->prev_odm_pipe;
-	}
-	/*odm_pipe is the leftmost pipe in the ODM group*/
-	recout_skip_h = odm_idx * data->recout.width;
-
-	/* Recout matching initial vp offset = recout_offset - (stream dst offset +
-	 *			((surf dst offset - stream src offset) * 1/ stream scaling ratio)
-	 *			- (surf surf_src offset * 1/ full scl ratio))
-	 */
-	recout_skip_h += odm_pipe->plane_res.scl_data.recout.x
-				- (stream->dst.x + (plane_state->dst_rect.x - stream->src.x)
-					* stream->dst.width / stream->src.width -
-					src.x * plane_state->dst_rect.width / src.width
-					* stream->dst.width / stream->src.width);
-
-
-	recout_skip_v = data->recout.y - (stream->dst.y + (plane_state->dst_rect.y - stream->src.y)
-					* stream->dst.height / stream->src.height -
-					src.y * plane_state->dst_rect.height / src.height
-					* stream->dst.height / stream->src.height);
-	if (orthogonal_rotation)
-		swap(recout_skip_h, recout_skip_v);
-	/*
-	 * Init calculated according to formula:
-	 * 	init = (scaling_ratio + number_of_taps + 1) / 2
-	 * 	init_bot = init + scaling_ratio
-	 * 	init_c = init + truncated_vp_c_offset(from calculate viewport)
-	 */
-	data->inits.h = dc_fixpt_truncate(dc_fixpt_div_int(
-			dc_fixpt_add_int(data->ratios.horz, data->taps.h_taps + 1), 2), 19);
-
-	data->inits.h_c = dc_fixpt_truncate(dc_fixpt_add(data->inits.h_c, dc_fixpt_div_int(
-			dc_fixpt_add_int(data->ratios.horz_c, data->taps.h_taps_c + 1), 2)), 19);
-
-	data->inits.v = dc_fixpt_truncate(dc_fixpt_div_int(
-			dc_fixpt_add_int(data->ratios.vert, data->taps.v_taps + 1), 2), 19);
-
-	data->inits.v_c = dc_fixpt_truncate(dc_fixpt_add(data->inits.v_c, dc_fixpt_div_int(
-			dc_fixpt_add_int(data->ratios.vert_c, data->taps.v_taps_c + 1), 2)), 19);
-
-	/*
-	 * Taps, inits and scaling ratios are in recout space need to rotate
-	 * to viewport rotation before adjustment
-	 */
-	adjust_vp_and_init_for_seamless_clip(
+	calculate_init_and_vp(
 			flip_horz_scan_dir,
-			recout_skip_h,
-			surf_size_h,
-			orthogonal_rotation ? data->taps.v_taps : data->taps.h_taps,
-			orthogonal_rotation ? data->ratios.vert : data->ratios.horz,
-			orthogonal_rotation ? &data->inits.v : &data->inits.h,
+			ro_lb,
+			data->recout.width,
+			src.width,
+			data->taps.h_taps,
+			data->ratios.horz,
+			&data->inits.h,
 			&data->viewport.x,
 			&data->viewport.width);
-	adjust_vp_and_init_for_seamless_clip(
+	calculate_init_and_vp(
 			flip_horz_scan_dir,
-			recout_skip_h,
-			surf_size_h / vpc_div,
-			orthogonal_rotation ? data->taps.v_taps_c : data->taps.h_taps_c,
-			orthogonal_rotation ? data->ratios.vert_c : data->ratios.horz_c,
-			orthogonal_rotation ? &data->inits.v_c : &data->inits.h_c,
+			ro_lb,
+			data->recout.width,
+			src.width / vpc_div,
+			data->taps.h_taps_c,
+			data->ratios.horz_c,
+			&data->inits.h_c,
 			&data->viewport_c.x,
 			&data->viewport_c.width);
-	adjust_vp_and_init_for_seamless_clip(
+	calculate_init_and_vp(
 			flip_vert_scan_dir,
-			recout_skip_v,
-			surf_size_v,
-			orthogonal_rotation ? data->taps.h_taps : data->taps.v_taps,
-			orthogonal_rotation ? data->ratios.horz : data->ratios.vert,
-			orthogonal_rotation ? &data->inits.h : &data->inits.v,
+			ro_tb,
+			data->recout.height,
+			src.height,
+			data->taps.v_taps,
+			data->ratios.vert,
+			&data->inits.v,
 			&data->viewport.y,
 			&data->viewport.height);
-	adjust_vp_and_init_for_seamless_clip(
+	calculate_init_and_vp(
 			flip_vert_scan_dir,
-			recout_skip_v,
-			surf_size_v / vpc_div,
-			orthogonal_rotation ? data->taps.h_taps_c : data->taps.v_taps_c,
-			orthogonal_rotation ? data->ratios.horz_c : data->ratios.vert_c,
-			orthogonal_rotation ? &data->inits.h_c : &data->inits.v_c,
+			ro_tb,
+			data->recout.height,
+			src.height / vpc_div,
+			data->taps.v_taps_c,
+			data->ratios.vert_c,
+			&data->inits.v_c,
 			&data->viewport_c.y,
 			&data->viewport_c.height);
-
-	/* Interlaced inits based on final vert inits */
-	data->inits.v_bot = dc_fixpt_add(data->inits.v, data->ratios.vert);
-	data->inits.v_c_bot = dc_fixpt_add(data->inits.v_c, data->ratios.vert_c);
-
-}
-
-/*
- * When handling 270 rotation in mixed SLS mode, we have
- * stream->timing.h_border_left that is non zero.  If we are doing
- * pipe-splitting, this h_border_left value gets added to recout.x and when it
- * calls calculate_inits_and_adj_vp() and
- * adjust_vp_and_init_for_seamless_clip(), it can cause viewport.height for a
- * pipe to be incorrect.
- *
- * To fix this, instead of using stream->timing.h_border_left, we can use
- * stream->dst.x to represent the border instead.  So we will set h_border_left
- * to 0 and shift the appropriate amount in stream->dst.x.  We will then
- * perform all calculations in resource_build_scaling_params() based on this
- * and then restore the h_border_left and stream->dst.x to their original
- * values.
- *
- * shift_border_left_to_dst() will shift the amount of h_border_left to
- * stream->dst.x and set h_border_left to 0.  restore_border_left_from_dst()
- * will restore h_border_left and stream->dst.x back to their original values
- * We also need to make sure pipe_ctx->plane_res.scl_data.h_active uses the
- * original h_border_left value in its calculation.
- */
-static int shift_border_left_to_dst(struct pipe_ctx *pipe_ctx)
-{
-	int store_h_border_left = pipe_ctx->stream->timing.h_border_left;
-
-	if (store_h_border_left) {
-		pipe_ctx->stream->timing.h_border_left = 0;
-		pipe_ctx->stream->dst.x += store_h_border_left;
+	if (orthogonal_rotation) {
+		swap(data->viewport.x, data->viewport.y);
+		swap(data->viewport.width, data->viewport.height);
+		swap(data->viewport_c.x, data->viewport_c.y);
+		swap(data->viewport_c.width, data->viewport_c.height);
 	}
-	return store_h_border_left;
-}
-
-static void restore_border_left_from_dst(struct pipe_ctx *pipe_ctx,
-					 int store_h_border_left)
-{
-	pipe_ctx->stream->dst.x -= store_h_border_left;
-	pipe_ctx->stream->timing.h_border_left = store_h_border_left;
+	data->viewport.x += src.x;
+	data->viewport.y += src.y;
+	ASSERT(src.x % vpc_div == 0 && src.y % vpc_div == 0);
+	data->viewport_c.x += src.x / vpc_div;
+	data->viewport_c.y += src.y / vpc_div;
 }
 
 bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
@@ -1189,48 +1007,42 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 	const struct dc_plane_state *plane_state = pipe_ctx->plane_state;
 	struct dc_crtc_timing *timing = &pipe_ctx->stream->timing;
 	bool res = false;
-	int store_h_border_left = shift_border_left_to_dst(pipe_ctx);
 	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-	/* Important: scaling ratio calculation requires pixel format,
-	 * lb depth calculation requires recout and taps require scaling ratios.
-	 * Inits require viewport, taps, ratios and recout of split pipe
-	 */
+
 	pipe_ctx->plane_res.scl_data.format = convert_pixel_format_to_dalsurface(
 			pipe_ctx->plane_state->format);
 
-	calculate_scaling_ratios(pipe_ctx);
-
-	calculate_viewport(pipe_ctx);
+	/* Timing borders are part of vactive that we are also supposed to skip in addition
+	 * to any stream dst offset. Since dm logic assumes dst is in addressable
+	 * space we need to add the the left and top borders to dst offsets temporarily.
+	 * TODO: fix in DM, stream dst is supposed to be in vactive
+	 */
+	pipe_ctx->stream->dst.x += timing->h_border_left;
+	pipe_ctx->stream->dst.y += timing->v_border_top;
 
-	if (pipe_ctx->plane_res.scl_data.viewport.height < MIN_VIEWPORT_SIZE ||
-		pipe_ctx->plane_res.scl_data.viewport.width < MIN_VIEWPORT_SIZE) {
-		if (store_h_border_left) {
-			restore_border_left_from_dst(pipe_ctx,
-				store_h_border_left);
-		}
-		return false;
-	}
+	/* Calculate H and V active size */
+	pipe_ctx->plane_res.scl_data.h_active = timing->h_addressable +
+			timing->h_border_left + timing->h_border_right;
+	pipe_ctx->plane_res.scl_data.v_active = timing->v_addressable +
+		timing->v_border_top + timing->v_border_bottom;
+	if (pipe_ctx->next_odm_pipe || pipe_ctx->prev_odm_pipe)
+		pipe_ctx->plane_res.scl_data.h_active /= get_num_odm_splits(pipe_ctx) + 1;
 
+	/* depends on h_active */
 	calculate_recout(pipe_ctx);
+	/* depends on pixel format */
+	calculate_scaling_ratios(pipe_ctx);
+	/* depends on scaling ratios and recout, does not calculate offset yet */
+	calculate_viewport_size(pipe_ctx);
 
-	/**
+	/*
+	 * LB calculations depend on vp size, h/v_active and scaling ratios
 	 * Setting line buffer pixel depth to 24bpp yields banding
 	 * on certain displays, such as the Sharp 4k
 	 */
 	pipe_ctx->plane_res.scl_data.lb_params.depth = LB_PIXEL_DEPTH_30BPP;
 	pipe_ctx->plane_res.scl_data.lb_params.alpha_en = plane_state->per_pixel_alpha;
 
-	pipe_ctx->plane_res.scl_data.recout.x += timing->h_border_left;
-	pipe_ctx->plane_res.scl_data.recout.y += timing->v_border_top;
-
-	pipe_ctx->plane_res.scl_data.h_active = timing->h_addressable +
-		store_h_border_left + timing->h_border_right;
-	pipe_ctx->plane_res.scl_data.v_active = timing->v_addressable +
-		timing->v_border_top + timing->v_border_bottom;
-	if (pipe_ctx->next_odm_pipe || pipe_ctx->prev_odm_pipe)
-		pipe_ctx->plane_res.scl_data.h_active /= get_num_odm_splits(pipe_ctx) + 1;
-
-	/* Taps calculations */
 	if (pipe_ctx->plane_res.xfm != NULL)
 		res = pipe_ctx->plane_res.xfm->funcs->transform_get_optimal_number_of_taps(
 				pipe_ctx->plane_res.xfm, &pipe_ctx->plane_res.scl_data, &plane_state->scaling_quality);
@@ -1257,9 +1069,31 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 					&plane_state->scaling_quality);
 	}
 
+	/*
+	 * Depends on recout, scaling ratios, h_active and taps
+	 * May need to re-check lb size after this in some obscure scenario
+	 */
 	if (res)
-		/* May need to re-check lb size after this in some obscure scenario */
-		calculate_inits_and_adj_vp(pipe_ctx);
+		calculate_inits_and_viewports(pipe_ctx);
+
+	/*
+	 * Handle side by side and top bottom 3d recout offsets after vp calculation
+	 * since 3d is special and needs to calculate vp as if there is no recout offset
+	 * This may break with rotation, good thing we aren't mixing hw rotation and 3d
+	 */
+	if (pipe_ctx->top_pipe && pipe_ctx->top_pipe->plane_state == plane_state) {
+		ASSERT(plane_state->rotation == ROTATION_ANGLE_0 ||
+			(pipe_ctx->stream->view_format != VIEW_3D_FORMAT_TOP_AND_BOTTOM &&
+				pipe_ctx->stream->view_format != VIEW_3D_FORMAT_SIDE_BY_SIDE));
+		if (pipe_ctx->stream->view_format == VIEW_3D_FORMAT_TOP_AND_BOTTOM)
+			pipe_ctx->plane_res.scl_data.recout.y += pipe_ctx->plane_res.scl_data.recout.height;
+		else if (pipe_ctx->stream->view_format == VIEW_3D_FORMAT_SIDE_BY_SIDE)
+			pipe_ctx->plane_res.scl_data.recout.x += pipe_ctx->plane_res.scl_data.recout.width;
+	}
+
+	if (pipe_ctx->plane_res.scl_data.viewport.height < MIN_VIEWPORT_SIZE ||
+			pipe_ctx->plane_res.scl_data.viewport.width < MIN_VIEWPORT_SIZE)
+		res = false;
 
 	DC_LOG_SCALER("%s pipe %d:\nViewport: height:%d width:%d x:%d y:%d  Recout: height:%d width:%d x:%d y:%d  HACTIVE:%d VACTIVE:%d\n"
 			"src_rect: height:%d width:%d x:%d y:%d  dst_rect: height:%d width:%d x:%d y:%d  clip_rect: height:%d width:%d x:%d y:%d\n",
@@ -1288,8 +1122,8 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
 			plane_state->clip_rect.x,
 			plane_state->clip_rect.y);
 
-	if (store_h_border_left)
-		restore_border_left_from_dst(pipe_ctx, store_h_border_left);
+	pipe_ctx->stream->dst.x -= timing->h_border_left;
+	pipe_ctx->stream->dst.y -= timing->v_border_top;
 
 	return res;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 535da8db70b6..8016e22114ce 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -271,11 +271,6 @@ struct dc_edid_caps {
 	struct dc_panel_patch panel_patch;
 };
 
-struct view {
-	uint32_t width;
-	uint32_t height;
-};
-
 struct dc_mode_flags {
 	/* note: part of refresh rate flag*/
 	uint32_t INTERLACE :1;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
index 0bd8de4c73a9..673b93f4fea5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c
@@ -631,8 +631,10 @@ static void dpp1_dscl_set_manual_ratio_init(
 		SCL_V_INIT_INT, init_int);
 
 	if (REG(SCL_VERT_FILTER_INIT_BOT)) {
-		init_frac = dc_fixpt_u0d19(data->inits.v_bot) << 5;
-		init_int = dc_fixpt_floor(data->inits.v_bot);
+		struct fixed31_32 bot = dc_fixpt_add(data->inits.v, data->ratios.vert);
+
+		init_frac = dc_fixpt_u0d19(bot) << 5;
+		init_int = dc_fixpt_floor(bot);
 		REG_SET_2(SCL_VERT_FILTER_INIT_BOT, 0,
 			SCL_V_INIT_FRAC_BOT, init_frac,
 			SCL_V_INIT_INT_BOT, init_int);
@@ -645,8 +647,10 @@ static void dpp1_dscl_set_manual_ratio_init(
 		SCL_V_INIT_INT_C, init_int);
 
 	if (REG(SCL_VERT_FILTER_INIT_BOT_C)) {
-		init_frac = dc_fixpt_u0d19(data->inits.v_c_bot) << 5;
-		init_int = dc_fixpt_floor(data->inits.v_c_bot);
+		struct fixed31_32 bot = dc_fixpt_add(data->inits.v_c, data->ratios.vert_c);
+
+		init_frac = dc_fixpt_u0d19(bot) << 5;
+		init_int = dc_fixpt_floor(bot);
 		REG_SET_2(SCL_VERT_FILTER_INIT_BOT_C, 0,
 			SCL_V_INIT_FRAC_BOT_C, init_frac,
 			SCL_V_INIT_INT_BOT_C, init_int);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 6a56a03cfba3..56e0c4b0f034 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2289,12 +2289,14 @@ int dcn20_populate_dml_pipes_from_context(
 
 			pipes[pipe_cnt].pipe.src.source_scan = pln->rotation == ROTATION_ANGLE_90
 					|| pln->rotation == ROTATION_ANGLE_270 ? dm_vert : dm_horz;
-			pipes[pipe_cnt].pipe.src.viewport_y_y = scl->viewport_unadjusted.y;
-			pipes[pipe_cnt].pipe.src.viewport_y_c = scl->viewport_c_unadjusted.y;
-			pipes[pipe_cnt].pipe.src.viewport_width = scl->viewport_unadjusted.width;
-			pipes[pipe_cnt].pipe.src.viewport_width_c = scl->viewport_c_unadjusted.width;
-			pipes[pipe_cnt].pipe.src.viewport_height = scl->viewport_unadjusted.height;
-			pipes[pipe_cnt].pipe.src.viewport_height_c = scl->viewport_c_unadjusted.height;
+			pipes[pipe_cnt].pipe.src.viewport_y_y = scl->viewport.y;
+			pipes[pipe_cnt].pipe.src.viewport_y_c = scl->viewport_c.y;
+			pipes[pipe_cnt].pipe.src.viewport_width = scl->viewport.width;
+			pipes[pipe_cnt].pipe.src.viewport_width_c = scl->viewport_c.width;
+			pipes[pipe_cnt].pipe.src.viewport_height = scl->viewport.height;
+			pipes[pipe_cnt].pipe.src.viewport_height_c = scl->viewport_c.height;
+			pipes[pipe_cnt].pipe.src.viewport_width_max = pln->src_rect.width;
+			pipes[pipe_cnt].pipe.src.viewport_height_max = pln->src_rect.height;
 			pipes[pipe_cnt].pipe.src.surface_width_y = pln->plane_size.surface_size.width;
 			pipes[pipe_cnt].pipe.src.surface_height_y = pln->plane_size.surface_size.height;
 			pipes[pipe_cnt].pipe.src.surface_width_c = pln->plane_size.chroma_size.width;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
index 2ece3690bfa3..a0f0c54c863b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_structs.h
@@ -253,6 +253,8 @@ struct _vcs_dpi_display_pipe_source_params_st {
 	unsigned int viewport_y_c;
 	unsigned int viewport_width_c;
 	unsigned int viewport_height_c;
+	unsigned int viewport_width_max;
+	unsigned int viewport_height_max;
 	unsigned int data_pitch;
 	unsigned int data_pitch_c;
 	unsigned int meta_pitch;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index d764d784e279..a4a1b96967c0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -630,6 +630,19 @@ static void fetch_pipe_params(struct display_mode_lib *mode_lib)
 				}
 			}
 		}
+		if (src->viewport_width_max) {
+			int hdiv_c = src->source_format >= dm_420_8 && src->source_format <= dm_422_10 ? 2 : 1;
+			int vdiv_c = src->source_format >= dm_420_8 && src->source_format <= dm_420_12 ? 2 : 1;
+
+			if (mode_lib->vba.ViewportWidth[mode_lib->vba.NumberOfActivePlanes] > src->viewport_width_max)
+				mode_lib->vba.ViewportWidth[mode_lib->vba.NumberOfActivePlanes] = src->viewport_width_max;
+			if (mode_lib->vba.ViewportHeight[mode_lib->vba.NumberOfActivePlanes] > src->viewport_height_max)
+				mode_lib->vba.ViewportHeight[mode_lib->vba.NumberOfActivePlanes] = src->viewport_height_max;
+			if (mode_lib->vba.ViewportWidthChroma[mode_lib->vba.NumberOfActivePlanes] > src->viewport_width_max / hdiv_c)
+				mode_lib->vba.ViewportWidthChroma[mode_lib->vba.NumberOfActivePlanes] = src->viewport_width_max / hdiv_c;
+			if (mode_lib->vba.ViewportHeightChroma[mode_lib->vba.NumberOfActivePlanes] > src->viewport_height_max / vdiv_c)
+				mode_lib->vba.ViewportHeightChroma[mode_lib->vba.NumberOfActivePlanes] = src->viewport_height_max / vdiv_c;
+		}
 
 		if (pipes[k].pipe.src.immediate_flip) {
 			mode_lib->vba.ImmediateFlipSupport = true;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h b/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h
index 2947d1b15512..2a0db2b03047 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/transform.h
@@ -162,9 +162,7 @@ struct scl_inits {
 	struct fixed31_32 h;
 	struct fixed31_32 h_c;
 	struct fixed31_32 v;
-	struct fixed31_32 v_bot;
 	struct fixed31_32 v_c;
-	struct fixed31_32 v_c_bot;
 };
 
 struct scaler_data {
@@ -173,8 +171,6 @@ struct scaler_data {
 	struct scaling_taps taps;
 	struct rect viewport;
 	struct rect viewport_c;
-	struct rect viewport_unadjusted;
-	struct rect viewport_c_unadjusted;
 	struct rect recout;
 	struct scaling_ratios ratios;
 	struct scl_inits inits;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
