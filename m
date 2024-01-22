Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 307E28366D9
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jan 2024 16:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473E710F343;
	Mon, 22 Jan 2024 15:08:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E33B10F321;
 Mon, 22 Jan 2024 15:08:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 926F9CE2B13;
 Mon, 22 Jan 2024 15:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AEAC43390;
 Mon, 22 Jan 2024 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936085;
 bh=Y37+vUsxtsEdK0orfO8l3mHK/MfBa2CTxfPAVV0kW2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tVARubyflquN6qsjj2ny7dqdcJZmKGP/T6CLclLKre+lrJB6RwLYInzb0faTsZkcy
 kRpIqJ1Awl5ZDiKmOdoJampNx0dtu3urllFydD+N69xPEAaCZvnY3pV+nxVeVSj72v
 opHVlKODf73wxdf7rxjIZFaHYbD5ux9FC/tiYaQ8nSgvn69Fxpvd1mUdCotQRiTkmy
 nG+N2n5cAeM6HRkPAbeEJ2iejY1Vb0WJZ472MVzXEiNoI707u7ZC1x/nvBQUThoTyC
 gHkqer1jFmsx/8ro06hNgo8RalbKkKt668BqZbhUHe1ZPtJXN/eds9uu9IeYyEk5Kk
 jW0xvAr1tnAHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 61/73] drm/amd/display: Fix minor issues in BW
 Allocation Phase2
Date: Mon, 22 Jan 2024 10:02:15 -0500
Message-ID: <20240122150432.992458-61-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122150432.992458-1-sashal@kernel.org>
References: <20240122150432.992458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.13
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
Cc: Sasha Levin <sashal@kernel.org>, aric.cyr@amd.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, airlied@gmail.com,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, wenjing.liu@amd.com,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, PeiChen Huang <peichen.huang@amd.com>,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 harry.wentland@amd.com, christian.koenig@amd.com, mghaddar@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>

[ Upstream commit aa5dc05340eb97486a631ce6bccb8d020bf6b56b ]

[Why]
Fix minor issues in BW Allocation Phase2.

[How]
- In set_usb4_req_bw_req(), link->dpia_bw_alloc_config.response_ready
  flag should be reset before writing DPCD REQUEST_BW.
- Fix the granularity for value of 2 in get_bw_granularity().
- Removed bandwidth allocation support display fw boot option as
  the fw would read feature enable status from bios.
- Clean up DPIA_EST_BW_CHANGED and DPIA_BW_REQ_SUCCESS cases in
  dpia_handle_bw_alloc_response().
- Removed allocate_usb4_bw and deallocate_usb4_bw.
- Optimized loop in get_lowest_dpia_index().
- Updated link_dp_dpia_allocate_usb4_bandwidth_for_stream() and
  set_usb4_req_bw_req() to always issue request bw.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: PeiChen Huang <peichen.huang@amd.com>
Acked-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../dc/link/protocols/link_dp_dpia_bw.c       | 221 ++++++++----------
 .../dc/link/protocols/link_dp_dpia_bw.h       |   4 +-
 2 files changed, 101 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
index 7581023daa47..d6e1f969bfd5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.c
@@ -50,6 +50,7 @@ static bool get_bw_alloc_proceed_flag(struct dc_link *tmp)
 			&& tmp->hpd_status
 			&& tmp->dpia_bw_alloc_config.bw_alloc_enabled);
 }
+
 static void reset_bw_alloc_struct(struct dc_link *link)
 {
 	link->dpia_bw_alloc_config.bw_alloc_enabled = false;
@@ -59,6 +60,11 @@ static void reset_bw_alloc_struct(struct dc_link *link)
 	link->dpia_bw_alloc_config.bw_granularity = 0;
 	link->dpia_bw_alloc_config.response_ready = false;
 }
+
+#define BW_GRANULARITY_0 4 // 0.25 Gbps
+#define BW_GRANULARITY_1 2 // 0.5 Gbps
+#define BW_GRANULARITY_2 1 // 1 Gbps
+
 static uint8_t get_bw_granularity(struct dc_link *link)
 {
 	uint8_t bw_granularity = 0;
@@ -71,16 +77,20 @@ static uint8_t get_bw_granularity(struct dc_link *link)
 
 	switch (bw_granularity & 0x3) {
 	case 0:
-		bw_granularity = 4;
+		bw_granularity = BW_GRANULARITY_0;
 		break;
 	case 1:
+		bw_granularity = BW_GRANULARITY_1;
+		break;
+	case 2:
 	default:
-		bw_granularity = 2;
+		bw_granularity = BW_GRANULARITY_2;
 		break;
 	}
 
 	return bw_granularity;
 }
+
 static int get_estimated_bw(struct dc_link *link)
 {
 	uint8_t bw_estimated_bw = 0;
@@ -93,31 +103,7 @@ static int get_estimated_bw(struct dc_link *link)
 
 	return bw_estimated_bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
 }
-static bool allocate_usb4_bw(int *stream_allocated_bw, int bw_needed, struct dc_link *link)
-{
-	if (bw_needed > 0)
-		*stream_allocated_bw += bw_needed;
-
-	return true;
-}
-static bool deallocate_usb4_bw(int *stream_allocated_bw, int bw_to_dealloc, struct dc_link *link)
-{
-	bool ret = false;
-
-	if (*stream_allocated_bw > 0) {
-		*stream_allocated_bw -= bw_to_dealloc;
-		ret = true;
-	} else {
-		//Do nothing for now
-		ret = true;
-	}
 
-	// Unplug so reset values
-	if (!link->hpd_status)
-		reset_bw_alloc_struct(link);
-
-	return ret;
-}
 /*
  * Read all New BW alloc configuration ex: estimated_bw, allocated_bw,
  * granuality, Driver_ID, CM_Group, & populate the BW allocation structs
@@ -128,7 +114,12 @@ static void init_usb4_bw_struct(struct dc_link *link)
 	// Init the known values
 	link->dpia_bw_alloc_config.bw_granularity = get_bw_granularity(link);
 	link->dpia_bw_alloc_config.estimated_bw = get_estimated_bw(link);
+
+	DC_LOG_DEBUG("%s: bw_granularity(%d), estimated_bw(%d)\n",
+		__func__, link->dpia_bw_alloc_config.bw_granularity,
+		link->dpia_bw_alloc_config.estimated_bw);
 }
+
 static uint8_t get_lowest_dpia_index(struct dc_link *link)
 {
 	const struct dc *dc_struct = link->dc;
@@ -141,12 +132,15 @@ static uint8_t get_lowest_dpia_index(struct dc_link *link)
 				dc_struct->links[i]->ep_type != DISPLAY_ENDPOINT_USB4_DPIA)
 			continue;
 
-		if (idx > dc_struct->links[i]->link_index)
+		if (idx > dc_struct->links[i]->link_index) {
 			idx = dc_struct->links[i]->link_index;
+			break;
+		}
 	}
 
 	return idx;
 }
+
 /*
  * Get the Max Available BW or Max Estimated BW for each Host Router
  *
@@ -186,6 +180,7 @@ static int get_host_router_total_bw(struct dc_link *link, uint8_t type)
 
 	return total_bw;
 }
+
 /*
  * Cleanup function for when the dpia is unplugged to reset struct
  * and perform any required clean up
@@ -194,42 +189,50 @@ static int get_host_router_total_bw(struct dc_link *link, uint8_t type)
  *
  * return: none
  */
-static bool dpia_bw_alloc_unplug(struct dc_link *link)
+static void dpia_bw_alloc_unplug(struct dc_link *link)
 {
-	if (!link)
-		return true;
-
-	return deallocate_usb4_bw(&link->dpia_bw_alloc_config.sink_allocated_bw,
-			link->dpia_bw_alloc_config.sink_allocated_bw, link);
+	if (link) {
+		DC_LOG_DEBUG("%s: resetting bw alloc config for link(%d)\n",
+			__func__, link->link_index);
+		link->dpia_bw_alloc_config.sink_allocated_bw = 0;
+		reset_bw_alloc_struct(link);
+	}
 }
+
 static void set_usb4_req_bw_req(struct dc_link *link, int req_bw)
 {
 	uint8_t requested_bw;
 	uint32_t temp;
 
-	// 1. Add check for this corner case #1
-	if (req_bw > link->dpia_bw_alloc_config.estimated_bw)
+	/* Error check whether request bw greater than allocated */
+	if (req_bw > link->dpia_bw_alloc_config.estimated_bw) {
+		DC_LOG_ERROR("%s: Request bw greater than estimated bw for link(%d)\n",
+			__func__, link->link_index);
 		req_bw = link->dpia_bw_alloc_config.estimated_bw;
+	}
 
 	temp = req_bw * link->dpia_bw_alloc_config.bw_granularity;
 	requested_bw = temp / Kbps_TO_Gbps;
 
-	// Always make sure to add more to account for floating points
+	/* Always make sure to add more to account for floating points */
 	if (temp % Kbps_TO_Gbps)
 		++requested_bw;
 
-	// 2. Add check for this corner case #2
+	/* Error check whether requested and allocated are equal */
 	req_bw = requested_bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
-	if (req_bw == link->dpia_bw_alloc_config.sink_allocated_bw)
-		return;
+	if (req_bw == link->dpia_bw_alloc_config.sink_allocated_bw) {
+		DC_LOG_ERROR("%s: Request bw equals to allocated bw for link(%d)\n",
+			__func__, link->link_index);
+	}
 
-	if (core_link_write_dpcd(
+	link->dpia_bw_alloc_config.response_ready = false; // Reset flag
+	core_link_write_dpcd(
 		link,
 		REQUESTED_BW,
 		&requested_bw,
-		sizeof(uint8_t)) == DC_OK)
-		link->dpia_bw_alloc_config.response_ready = false; // Reset flag
+		sizeof(uint8_t));
 }
+
 /*
  * Return the response_ready flag from dc_link struct
  *
@@ -241,6 +244,7 @@ static bool get_cm_response_ready_flag(struct dc_link *link)
 {
 	return link->dpia_bw_alloc_config.response_ready;
 }
+
 // ------------------------------------------------------------------
 //					PUBLIC FUNCTIONS
 // ------------------------------------------------------------------
@@ -277,27 +281,27 @@ bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(struct dc_link *link)
 				DPTX_BW_ALLOCATION_MODE_CONTROL,
 				&response,
 				sizeof(uint8_t)) != DC_OK) {
-			DC_LOG_DEBUG("%s: **** FAILURE Enabling DPtx BW Allocation Mode Support ***\n",
-					__func__);
+			DC_LOG_DEBUG("%s: FAILURE Enabling DPtx BW Allocation Mode Support for link(%d)\n",
+				__func__, link->link_index);
 		} else {
 			// SUCCESS Enabled DPtx BW Allocation Mode Support
-			link->dpia_bw_alloc_config.bw_alloc_enabled = true;
-			DC_LOG_DEBUG("%s: **** SUCCESS Enabling DPtx BW Allocation Mode Support ***\n",
-					__func__);
+			DC_LOG_DEBUG("%s: SUCCESS Enabling DPtx BW Allocation Mode Support for link(%d)\n",
+				__func__, link->link_index);
 
 			ret = true;
 			init_usb4_bw_struct(link);
+			link->dpia_bw_alloc_config.bw_alloc_enabled = true;
 		}
 	}
 
 out:
 	return ret;
 }
+
 void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t result)
 {
 	int bw_needed = 0;
 	int estimated = 0;
-	int host_router_total_estimated_bw = 0;
 
 	if (!get_bw_alloc_proceed_flag((link)))
 		return;
@@ -306,14 +310,22 @@ void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t res
 
 	case DPIA_BW_REQ_FAILED:
 
-		DC_LOG_DEBUG("%s: *** *** BW REQ FAILURE for DP-TX Request *** ***\n", __func__);
+		/*
+		 * Ideally, we shouldn't run into this case as we always validate available
+		 * bandwidth and request within that limit
+		 */
+		estimated = bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
 
-		// Update the new Estimated BW value updated by CM
-		link->dpia_bw_alloc_config.estimated_bw =
-				bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
+		DC_LOG_ERROR("%s: BW REQ FAILURE for DP-TX Request for link(%d)\n",
+			__func__, link->link_index);
+		DC_LOG_ERROR("%s: current estimated_bw(%d), new estimated_bw(%d)\n",
+			__func__, link->dpia_bw_alloc_config.estimated_bw, estimated);
 
+		/* Update the new Estimated BW value updated by CM */
+		link->dpia_bw_alloc_config.estimated_bw = estimated;
+
+		/* Allocate the previously requested bandwidth */
 		set_usb4_req_bw_req(link, link->dpia_bw_alloc_config.estimated_bw);
-		link->dpia_bw_alloc_config.response_ready = false;
 
 		/*
 		 * If FAIL then it is either:
@@ -326,68 +338,34 @@ void dpia_handle_bw_alloc_response(struct dc_link *link, uint8_t bw, uint8_t res
 
 	case DPIA_BW_REQ_SUCCESS:
 
-		DC_LOG_DEBUG("%s: *** BW REQ SUCCESS for DP-TX Request ***\n", __func__);
-
-		// 1. SUCCESS 1st time before any Pruning is done
-		// 2. SUCCESS after prev. FAIL before any Pruning is done
-		// 3. SUCCESS after Pruning is done but before enabling link
-
 		bw_needed = bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
 
-		// 1.
-		if (!link->dpia_bw_alloc_config.sink_allocated_bw) {
-
-			allocate_usb4_bw(&link->dpia_bw_alloc_config.sink_allocated_bw, bw_needed, link);
-			link->dpia_bw_alloc_config.sink_verified_bw =
-					link->dpia_bw_alloc_config.sink_allocated_bw;
+		DC_LOG_DEBUG("%s: BW REQ SUCCESS for DP-TX Request for link(%d)\n",
+			__func__, link->link_index);
+		DC_LOG_DEBUG("%s: current allocated_bw(%d), new allocated_bw(%d)\n",
+			__func__, link->dpia_bw_alloc_config.sink_allocated_bw, bw_needed);
 
-			// SUCCESS from first attempt
-			if (link->dpia_bw_alloc_config.sink_allocated_bw >
-			link->dpia_bw_alloc_config.sink_max_bw)
-				link->dpia_bw_alloc_config.sink_verified_bw =
-						link->dpia_bw_alloc_config.sink_max_bw;
-		}
-		// 3.
-		else if (link->dpia_bw_alloc_config.sink_allocated_bw) {
-
-			// Find out how much do we need to de-alloc
-			if (link->dpia_bw_alloc_config.sink_allocated_bw > bw_needed)
-				deallocate_usb4_bw(&link->dpia_bw_alloc_config.sink_allocated_bw,
-						link->dpia_bw_alloc_config.sink_allocated_bw - bw_needed, link);
-			else
-				allocate_usb4_bw(&link->dpia_bw_alloc_config.sink_allocated_bw,
-						bw_needed - link->dpia_bw_alloc_config.sink_allocated_bw, link);
-		}
-
-		// 4. If this is the 2nd sink then any unused bw will be reallocated to master DPIA
-		// => check if estimated_bw changed
+		link->dpia_bw_alloc_config.sink_allocated_bw = bw_needed;
 
 		link->dpia_bw_alloc_config.response_ready = true;
 		break;
 
 	case DPIA_EST_BW_CHANGED:
 
-		DC_LOG_DEBUG("%s: *** ESTIMATED BW CHANGED for DP-TX Request ***\n", __func__);
-
 		estimated = bw * (Kbps_TO_Gbps / link->dpia_bw_alloc_config.bw_granularity);
-		host_router_total_estimated_bw = get_host_router_total_bw(link, HOST_ROUTER_BW_ESTIMATED);
 
-		// 1. If due to unplug of other sink
-		if (estimated == host_router_total_estimated_bw) {
-			// First update the estimated & max_bw fields
-			if (link->dpia_bw_alloc_config.estimated_bw < estimated)
-				link->dpia_bw_alloc_config.estimated_bw = estimated;
-		}
-		// 2. If due to realloc bw btw 2 dpia due to plug OR realloc unused Bw
-		else {
-			// We lost estimated bw usually due to plug event of other dpia
-			link->dpia_bw_alloc_config.estimated_bw = estimated;
-		}
+		DC_LOG_DEBUG("%s: ESTIMATED BW CHANGED for link(%d)\n",
+			__func__, link->link_index);
+		DC_LOG_DEBUG("%s: current estimated_bw(%d), new estimated_bw(%d)\n",
+			__func__, link->dpia_bw_alloc_config.estimated_bw, estimated);
+
+		link->dpia_bw_alloc_config.estimated_bw = estimated;
 		break;
 
 	case DPIA_BW_ALLOC_CAPS_CHANGED:
 
-		DC_LOG_DEBUG("%s: *** BW ALLOC CAPABILITY CHANGED for DP-TX Request ***\n", __func__);
+		DC_LOG_ERROR("%s: BW ALLOC CAPABILITY CHANGED to Disabled for link(%d)\n",
+			__func__, link->link_index);
 		link->dpia_bw_alloc_config.bw_alloc_enabled = false;
 		break;
 	}
@@ -409,11 +387,11 @@ int dpia_handle_usb4_bandwidth_allocation_for_link(struct dc_link *link, int pea
 		set_usb4_req_bw_req(link, link->dpia_bw_alloc_config.sink_max_bw);
 
 		do {
-			if (!(timeout > 0))
+			if (timeout > 0)
 				timeout--;
 			else
 				break;
-			fsleep(10 * 1000);
+			msleep(10);
 		} while (!get_cm_response_ready_flag(link));
 
 		if (!timeout)
@@ -428,37 +406,36 @@ int dpia_handle_usb4_bandwidth_allocation_for_link(struct dc_link *link, int pea
 out:
 	return ret;
 }
-int link_dp_dpia_allocate_usb4_bandwidth_for_stream(struct dc_link *link, int req_bw)
+
+bool link_dp_dpia_allocate_usb4_bandwidth_for_stream(struct dc_link *link, int req_bw)
 {
-	int ret = 0;
+	bool ret = false;
 	uint8_t timeout = 10;
 
+	DC_LOG_DEBUG("%s: ENTER: link(%d), hpd_status(%d), current allocated_bw(%d), req_bw(%d)\n",
+		__func__, link->link_index, link->hpd_status,
+		link->dpia_bw_alloc_config.sink_allocated_bw, req_bw);
+
 	if (!get_bw_alloc_proceed_flag(link))
 		goto out;
 
-	/*
-	 * Sometimes stream uses same timing parameters as the already
-	 * allocated max sink bw so no need to re-alloc
-	 */
-	if (req_bw != link->dpia_bw_alloc_config.sink_allocated_bw) {
-		set_usb4_req_bw_req(link, req_bw);
-		do {
-			if (!(timeout > 0))
-				timeout--;
-			else
-				break;
-			udelay(10 * 1000);
-		} while (!get_cm_response_ready_flag(link));
+	set_usb4_req_bw_req(link, req_bw);
+	do {
+		if (timeout > 0)
+			timeout--;
+		else
+			break;
+		msleep(10);
+	} while (!get_cm_response_ready_flag(link));
 
-		if (!timeout)
-			ret = 0;// ERROR TIMEOUT waiting for response for allocating bw
-		else if (link->dpia_bw_alloc_config.sink_allocated_bw > 0)
-			ret = get_host_router_total_bw(link, HOST_ROUTER_BW_ALLOCATED);
-	}
+	if (timeout)
+		ret = true;
 
 out:
+	DC_LOG_DEBUG("%s: EXIT: timeout(%d), ret(%d)\n", __func__, timeout, ret);
 	return ret;
 }
+
 bool dpia_validate_usb4_bw(struct dc_link **link, int *bw_needed_per_dpia, const unsigned int num_dpias)
 {
 	bool ret = true;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.h
index 7292690383ae..981bc4eb6120 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia_bw.h
@@ -59,9 +59,9 @@ bool link_dp_dpia_set_dptx_usb4_bw_alloc_support(struct dc_link *link);
  * @link: pointer to the dc_link struct instance
  * @req_bw: Bw requested by the stream
  *
- * return: allocated bw else return 0
+ * return: true if allocated successfully
  */
-int link_dp_dpia_allocate_usb4_bandwidth_for_stream(struct dc_link *link, int req_bw);
+bool link_dp_dpia_allocate_usb4_bandwidth_for_stream(struct dc_link *link, int req_bw);
 
 /*
  * Handle the USB4 BW Allocation related functionality here:
-- 
2.43.0

