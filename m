Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAC69D70A9
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Nov 2024 14:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C895010E4EB;
	Sun, 24 Nov 2024 13:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F01qzbw8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E5610E4E7;
 Sun, 24 Nov 2024 13:37:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A90985C48E9;
 Sun, 24 Nov 2024 13:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2FDC4CECC;
 Sun, 24 Nov 2024 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455462;
 bh=8E0zxXlJhERkU6dY0p0wmypLqUVuTj51YrRPg2MOAk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F01qzbw87iPDfhi8q05DUCRO/LQTAzfqap6xryDsvb6V8wazV3TQ3DeLffW5Us+Q+
 +RgZrxL32ag2XjHfZJARHNU4AUu4aMddjgQUQuRTPZjZYLZ1bkTgaJgm5D5HCOwrLu
 4vxLEuMWqbCFFYOScPFDtBzM7XQDZKheOM5d4B4GgwvLtJ8HXTbzKVqE+7pkHdKrsD
 4lYSzdUMCxtDBHZ7zIg9YV0+vPIWrK3mUT00Emd+Bv3zbCHWbHV8KEnYjj27mQ1SQx
 AJ3nqS/akj8An09/faUGVoOowsJDre7hCgaeo7LL7yKBHIxmlgaitmoE9LClfsOOsj
 4PQGzhv4fUUSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ausef Yousof <Ausef.Yousof@amd.com>, Charlene Liu <charlene.liu@amd.com>,
 Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, wenjing.liu@amd.com, alex.hung@amd.com,
 michael.strauss@amd.com, george.shen@amd.com, daniel.sa@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 079/107] Revert "drm/amd/display: Block UHBR
 Based On USB-C PD Cable ID"
Date: Sun, 24 Nov 2024 08:29:39 -0500
Message-ID: <20241124133301.3341829-79-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
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

From: Ausef Yousof <Ausef.Yousof@amd.com>

[ Upstream commit d7b86a002cf7e1b55ec311c11264f70d079860b9 ]

This reverts commit 4f01a68751194d05280d659a65758c09e4af04d6.

[why & how]
The offending commit caused a lighting issue for Samsung Odyssey G9
monitors when connecting via USB-C. The commit was intended to block certain UHBR rates.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Ausef Yousof <Ausef.Yousof@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_capability.c    | 22 +++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index fe4aa2c158eae..d78c8ec4de79e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -1409,8 +1409,7 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 
 	if (!link->ctx->dmub_srv ||
 			link->ep_type != DISPLAY_ENDPOINT_PHY ||
-			link->link_enc->features.flags.bits.DP_IS_USB_C == 0 ||
-			link->link_enc->features.flags.bits.IS_DP2_CAPABLE == 0)
+			link->link_enc->features.flags.bits.DP_IS_USB_C == 0)
 		return false;
 
 	memset(&cmd, 0, sizeof(cmd));
@@ -1423,9 +1422,7 @@ static bool get_usbc_cable_id(struct dc_link *link, union dp_cable_id *cable_id)
 		cable_id->raw = cmd.cable_id.data.output_raw;
 		DC_LOG_DC("usbc_cable_id = %d.\n", cable_id->raw);
 	}
-
-	ASSERT(cmd.cable_id.header.ret_status);
-	return true;
+	return cmd.cable_id.header.ret_status == 1;
 }
 
 static void retrieve_cable_id(struct dc_link *link)
@@ -2106,8 +2103,6 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	/* get max link encoder capability */
 	if (link_enc)
 		link_enc->funcs->get_max_link_cap(link_enc, &max_link_cap);
-	else
-		return max_link_cap;
 
 	/* Lower link settings based on sink's link cap */
 	if (link->reported_link_cap.lane_count < max_link_cap.lane_count)
@@ -2141,15 +2136,10 @@ struct dc_link_settings dp_get_max_link_cap(struct dc_link *link)
 	 */
 	cable_max_link_rate = get_cable_max_link_rate(link);
 
-	if (!link->dc->debug.ignore_cable_id) {
-		if (cable_max_link_rate != LINK_RATE_UNKNOWN)
-			// cable max link rate known
-			max_link_cap.link_rate = MIN(max_link_cap.link_rate, cable_max_link_rate);
-		else if (link_enc->funcs->is_in_alt_mode && link_enc->funcs->is_in_alt_mode(link_enc))
-			// cable max link rate ambiguous, DP alt mode, limit to HBR3
-			max_link_cap.link_rate = MIN(max_link_cap.link_rate, LINK_RATE_HIGH3);
-		//else {}
-			// cable max link rate ambiguous, DP, do nothing
+	if (!link->dc->debug.ignore_cable_id &&
+			cable_max_link_rate != LINK_RATE_UNKNOWN) {
+		if (cable_max_link_rate < max_link_cap.link_rate)
+			max_link_cap.link_rate = cable_max_link_rate;
 
 		if (!link->dpcd_caps.cable_id.bits.UHBR13_5_CAPABILITY &&
 				link->dpcd_caps.cable_id.bits.CABLE_TYPE >= 2)
-- 
2.43.0

