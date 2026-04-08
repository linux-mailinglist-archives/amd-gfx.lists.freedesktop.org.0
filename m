Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCYtNT5p12mVNwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:54:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F843C8063
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B9610E7AB;
	Thu,  9 Apr 2026 08:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lblk+wQq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE42410E654;
 Wed,  8 Apr 2026 13:08:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31A5660133;
 Wed,  8 Apr 2026 13:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0E6C19421;
 Wed,  8 Apr 2026 13:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1775653706;
 bh=Nkbl4OlcdSN8dS3CZhiOwiRGcyOHxj/GcD7jW18qbp4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=lblk+wQqt0d56CIfUSGjaAAZxhy/R86y9s0UJ9OHVcKK9S2CvJ5k93GslRxfYOIHI
 6vYfyYyYzPX4kQJGXHIBFWN1QCqQVaHxYTV33y0xPhWio4DhhKq9foobYeM1XZqvvh
 vgcZPA/S/bkBf+yffWFuRG8g8PJnBORPST1HPbiM=
Subject: Patch "drm/amd/display: Reject modes with too high pixel clock on
 DCE6-10" has been added to the 6.12-stable tree
To: Eric.Yang2@amd.com, Mario.Limonciello@amd.com, Rodrigo.Siqueira@amd.com,
 Roman.Li@amd.com, Tony.Cheng@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alex.hung@amd.com, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com, issor.oruam@gmail.com,
 mario.limonciello@amd.com, ray.wu@amd.com, rosenp@gmail.com, simona@ffwll.ch,
 sunpeng.li@amd.com, timur.kristof@gmail.com, wayne.lin@amd.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 08 Apr 2026 15:07:41 +0200
In-Reply-To: <20260401003908.3438-5-rosenp@gmail.com>
Message-ID: <2026040840-chastity-deuce-0bf1@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Thu, 09 Apr 2026 08:45:39 +0000
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
X-Spamd-Result: default: False [6.49 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.freedesktop.org,linuxfoundation.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-0.844];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 33F843C8063
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes


This is a note to let you know that I've just added the patch titled

    drm/amd/display: Reject modes with too high pixel clock on DCE6-10

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-reject-modes-with-too-high-pixel-clock-on-dce6-10.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-232623-greg=kroah.com@vger.kernel.org Wed Apr  1 02:43:45 2026
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 31 Mar 2026 17:39:02 -0700
Subject: drm/amd/display: Reject modes with too high pixel clock on DCE6-10
To: stable@vger.kernel.org
Cc: "Alex Deucher" <alexander.deucher@amd.com>, "Christian König" <christian.koenig@amd.com>, "Xinhui Pan" <Xinhui.Pan@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, "Ray Wu" <ray.wu@amd.com>, "Wayne Lin" <wayne.lin@amd.com>, "Mario Limonciello" <Mario.Limonciello@amd.com>, "Roman Li" <Roman.Li@amd.com>, "Eric Yang" <Eric.Yang2@amd.com>, "Tony Cheng" <Tony.Cheng@amd.com>, "Mauro Rossi" <issor.oruam@gmail.com>, "Timur Kristóf" <timur.kristof@gmail.com>, "Alex Hung" <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS), linux-kernel@vger.kernel.org (open list)
Message-ID: <20260401003908.3438-5-rosenp@gmail.com>

From: Timur KristÃ³f <timur.kristof@gmail.com>

[ Upstream commit 118800b0797a046adaa2a8e9dee9b971b78802a7 ]

Reject modes with a pixel clock higher than the maximum display
clock. Use 400 MHz as a fallback value when the maximum display
clock is not known. Pixel clocks that are higher than the display
clock just won't work and are not supported.

With the addition of the YUV422	fallback, DC can now accidentally
select a mode requiring higher pixel clock than actually supported
when the DP version supports the required bandwidth but the clock
is otherwise too high for the display engine. DCE 6-10 don't
support these modes but they don't have a bandwidth calculation
to reject them properly.

Fixes: db291ed1732e ("drm/amd/display: Add fallback path for YCBCR422")
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Timur KristÃ³f <timur.kristof@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c      |    3 +++
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c     |    5 +++++
 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c            |   10 +++++++++-
 drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c |   10 +++++++++-
 drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c   |   10 +++++++++-
 5 files changed, 35 insertions(+), 3 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -460,6 +460,9 @@ void dce_clk_mgr_construct(
 		clk_mgr->max_clks_state = DM_PP_CLOCKS_STATE_NOMINAL;
 	clk_mgr->cur_min_clks_state = DM_PP_CLOCKS_STATE_INVALID;
 
+	base->clks.max_supported_dispclk_khz =
+		clk_mgr->max_clks_by_state[DM_PP_CLOCKS_STATE_PERFORMANCE].display_clk_khz;
+
 	dce_clock_read_integrated_info(clk_mgr);
 	dce_clock_read_ss_info(clk_mgr);
 }
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce60/dce60_clk_mgr.c
@@ -147,6 +147,8 @@ void dce60_clk_mgr_construct(
 		struct dc_context *ctx,
 		struct clk_mgr_internal *clk_mgr)
 {
+	struct clk_mgr *base = &clk_mgr->base;
+
 	dce_clk_mgr_construct(ctx, clk_mgr);
 
 	memcpy(clk_mgr->max_clks_by_state,
@@ -157,5 +159,8 @@ void dce60_clk_mgr_construct(
 	clk_mgr->clk_mgr_shift = &disp_clk_shift;
 	clk_mgr->clk_mgr_mask = &disp_clk_mask;
 	clk_mgr->base.funcs = &dce60_funcs;
+
+	base->clks.max_supported_dispclk_khz =
+		clk_mgr->max_clks_by_state[DM_PP_CLOCKS_STATE_PERFORMANCE].display_clk_khz;
 }
 
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -34,6 +34,7 @@
 #include "stream_encoder.h"
 
 #include "resource.h"
+#include "clk_mgr.h"
 #include "include/irq_service_interface.h"
 #include "irq/dce60/irq_service_dce60.h"
 #include "dce110/dce110_timing_generator.h"
@@ -870,10 +871,17 @@ static bool dce60_validate_bandwidth(
 {
 	int i;
 	bool at_least_one_pipe = false;
+	struct dc_stream_state *stream = NULL;
+	const uint32_t max_pix_clk_khz = max(dc->clk_mgr->clks.max_supported_dispclk_khz, 400000);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (context->res_ctx.pipe_ctx[i].stream)
+		stream = context->res_ctx.pipe_ctx[i].stream;
+		if (stream) {
 			at_least_one_pipe = true;
+
+			if (stream->timing.pix_clk_100hz >= max_pix_clk_khz * 10)
+				return DC_FAIL_BANDWIDTH_VALIDATE;
+		}
 	}
 
 	if (at_least_one_pipe) {
--- a/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce100/dce100_resource.c
@@ -29,6 +29,7 @@
 #include "stream_encoder.h"
 
 #include "resource.h"
+#include "clk_mgr.h"
 #include "include/irq_service_interface.h"
 #include "virtual/virtual_stream_encoder.h"
 #include "dce110/dce110_resource.h"
@@ -843,10 +844,17 @@ static bool dce100_validate_bandwidth(
 {
 	int i;
 	bool at_least_one_pipe = false;
+	struct dc_stream_state *stream = NULL;
+	const uint32_t max_pix_clk_khz = max(dc->clk_mgr->clks.max_supported_dispclk_khz, 400000);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (context->res_ctx.pipe_ctx[i].stream)
+		stream = context->res_ctx.pipe_ctx[i].stream;
+		if (stream) {
 			at_least_one_pipe = true;
+
+			if (stream->timing.pix_clk_100hz >= max_pix_clk_khz * 10)
+				return DC_FAIL_BANDWIDTH_VALIDATE;
+		}
 	}
 
 	if (at_least_one_pipe) {
--- a/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dce80/dce80_resource.c
@@ -32,6 +32,7 @@
 #include "stream_encoder.h"
 
 #include "resource.h"
+#include "clk_mgr.h"
 #include "include/irq_service_interface.h"
 #include "irq/dce80/irq_service_dce80.h"
 #include "dce110/dce110_timing_generator.h"
@@ -876,10 +877,17 @@ static bool dce80_validate_bandwidth(
 {
 	int i;
 	bool at_least_one_pipe = false;
+	struct dc_stream_state *stream = NULL;
+	const uint32_t max_pix_clk_khz = max(dc->clk_mgr->clks.max_supported_dispclk_khz, 400000);
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-		if (context->res_ctx.pipe_ctx[i].stream)
+		stream = context->res_ctx.pipe_ctx[i].stream;
+		if (stream) {
 			at_least_one_pipe = true;
+
+			if (stream->timing.pix_clk_100hz >= max_pix_clk_khz * 10)
+				return DC_FAIL_BANDWIDTH_VALIDATE;
+		}
 	}
 
 	if (at_least_one_pipe) {


Patches currently in stable-queue which might be from rosenp@gmail.com are

queue-6.12/drm-amd-amdgpu-decouple-aspm-with-pcie-dpm.patch
queue-6.12/drm-amd-display-reject-modes-with-too-high-pixel-clock-on-dce6-10.patch
queue-6.12/drm-amd-display-fix-dce-6.0-and-6.4-pll-programming.patch
queue-6.12/drm-amd-display-disable-scaling-on-dce6-for-now.patch
queue-6.12/drm-amd-display-disable-fastboot-on-dce-6-too.patch
queue-6.12/drm-amd-display-correct-logic-check-error-for-fastboot.patch
queue-6.12/drm-amd-amdgpu-disable-aspm-in-some-situations.patch
queue-6.12/drm-amd-display-keep-pll0-running-on-dce-6.0-and-6.4.patch
queue-6.12/drm-amd-display-adjust-dce-8-10-clock-don-t-overclock-by-15.patch
queue-6.12/drm-amd-disable-aspm-on-si.patch
