Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNXSLT5p12myNggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:54:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CAF3C8062
	for <lists+amd-gfx@lfdr.de>; Thu, 09 Apr 2026 10:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4BD10E7A9;
	Thu,  9 Apr 2026 08:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ad/8ZIKJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D710E656;
 Wed,  8 Apr 2026 13:08:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D6F9340295;
 Wed,  8 Apr 2026 13:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F8AC19421;
 Wed,  8 Apr 2026 13:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1775653683;
 bh=tboaPTB7rSn2D7fzsYWWM7ybxzEObwYovXT4VessUvI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Ad/8ZIKJbmZxoEWdEuVm20Z7xe6ZILwRvv5neEUVaJ31H+MH0uetIxCzpW+arsRP0
 rwfB6kWewrpfkaQS2uG04buc2jFgOvlfoR5nQ3L8m9iPhHKMMpnqQp4rYKExn0vnB2
 jvJ2MWbDFe3mariXviyCzsCT0felHAXtfXBXOcXg=
Subject: Patch "drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming." has
 been added to the 6.12-stable tree
To: Eric.Yang2@amd.com, Mario.Limonciello@amd.com, Rodrigo.Siqueira@amd.com,
 Roman.Li@amd.com, Tony.Cheng@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 alex.hung@amd.com, alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com, issor.oruam@gmail.com,
 ray.wu@amd.com, rosenp@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com, timur.kristof@gmail.com, wayne.lin@amd.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 08 Apr 2026 15:07:40 +0200
In-Reply-To: <20260401003908.3438-7-rosenp@gmail.com>
Message-ID: <2026040840-handgrip-prayer-9b0f@gregkh>
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
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.freedesktop.org,linuxfoundation.org,ffwll.ch,igalia.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-0.862];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 32CAF3C8062
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes


This is a note to let you know that I've just added the patch titled

    drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-fix-dce-6.0-and-6.4-pll-programming.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-232625-greg=kroah.com@vger.kernel.org Wed Apr  1 02:44:20 2026
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 31 Mar 2026 17:39:04 -0700
Subject: drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
To: stable@vger.kernel.org
Cc: "Alex Deucher" <alexander.deucher@amd.com>, "Christian König" <christian.koenig@amd.com>, "Xinhui Pan" <Xinhui.Pan@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Harry Wentland" <harry.wentland@amd.com>, "Leo Li" <sunpeng.li@amd.com>, "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>, "Ray Wu" <ray.wu@amd.com>, "Wayne Lin" <wayne.lin@amd.com>, "Mario Limonciello" <Mario.Limonciello@amd.com>, "Roman Li" <Roman.Li@amd.com>, "Eric Yang" <Eric.Yang2@amd.com>, "Tony Cheng" <Tony.Cheng@amd.com>, "Mauro Rossi" <issor.oruam@gmail.com>, "Timur Kristóf" <timur.kristof@gmail.com>, "Alex Hung" <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS), linux-kernel@vger.kernel.org (open list)
Message-ID: <20260401003908.3438-7-rosenp@gmail.com>

From: Timur KristÃ³f <timur.kristof@gmail.com>

[ Upstream commit 35222b5934ec8d762473592ece98659baf6bc48e ]

Apparently, both DCE 6.0 and 6.4 have 3 PLLs, but PLL0 can only
be used for DP. Make sure to initialize the correct amount of PLLs
in DC for these DCE versions and use PLL0 only for DP.

Also, on DCE 6.0 and 6.4, the PLL0 needs to be powered on at
initialization as opposed to DCE 6.1 and 7.x which use a different
clock source for DFS.

The following functions were used as reference from the	old
radeon driver implementation of	DCE 6.x:
- radeon_atom_pick_pll
- atombios_crtc_set_disp_eng_pll

Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Timur KristÃ³f <timur.kristof@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c |    5 +
 drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c       |   34 +++++++-----
 2 files changed, 25 insertions(+), 14 deletions(-)

--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -245,6 +245,11 @@ int dce_set_clock(
 	pxl_clk_params.target_pixel_clock_100hz = requested_clk_khz * 10;
 	pxl_clk_params.pll_id = CLOCK_SOURCE_ID_DFS;
 
+	/* DCE 6.0, DCE 6.4: engine clock is the same as PLL0 */
+	if (clk_mgr_base->ctx->dce_version == DCE_VERSION_6_0 ||
+	    clk_mgr_base->ctx->dce_version == DCE_VERSION_6_4)
+		pxl_clk_params.pll_id = CLOCK_SOURCE_ID_PLL0;
+
 	if (clk_mgr_dce->dfs_bypass_active)
 		pxl_clk_params.flags.SET_DISPCLK_DFS_BYPASS = true;
 
--- a/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce60/dce60_resource.c
@@ -374,7 +374,7 @@ static const struct resource_caps res_ca
 		.num_timing_generator = 6,
 		.num_audio = 6,
 		.num_stream_encoder = 6,
-		.num_pll = 2,
+		.num_pll = 3,
 		.num_ddc = 6,
 };
 
@@ -390,7 +390,7 @@ static const struct resource_caps res_ca
 		.num_timing_generator = 2,
 		.num_audio = 2,
 		.num_stream_encoder = 2,
-		.num_pll = 2,
+		.num_pll = 3,
 		.num_ddc = 2,
 };
 
@@ -990,21 +990,24 @@ static bool dce60_construct(
 
 	if (bp->fw_info_valid && bp->fw_info.external_clock_source_frequency_for_dp != 0) {
 		pool->base.dp_clock_source =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
 
+		/* DCE 6.0 and 6.4: PLL0 can only be used with DP. Don't initialize it here. */
 		pool->base.clock_sources[0] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], false);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
 		pool->base.clock_sources[1] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
 		pool->base.clk_src_count = 2;
 
 	} else {
 		pool->base.dp_clock_source =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], true);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], true);
 
 		pool->base.clock_sources[0] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
-		pool->base.clk_src_count = 1;
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[1] =
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 2;
 	}
 
 	if (pool->base.dp_clock_source == NULL) {
@@ -1382,21 +1385,24 @@ static bool dce64_construct(
 
 	if (bp->fw_info_valid && bp->fw_info.external_clock_source_frequency_for_dp != 0) {
 		pool->base.dp_clock_source =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_EXTERNAL, NULL, true);
 
+		/* DCE 6.0 and 6.4: PLL0 can only be used with DP. Don't initialize it here. */
 		pool->base.clock_sources[0] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[0], false);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
 		pool->base.clock_sources[1] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[1], false);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
 		pool->base.clk_src_count = 2;
 
 	} else {
 		pool->base.dp_clock_source =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[0], true);
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL0, &clk_src_regs[0], true);
 
 		pool->base.clock_sources[0] =
-				dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[1], false);
-		pool->base.clk_src_count = 1;
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL1, &clk_src_regs[1], false);
+		pool->base.clock_sources[1] =
+			dce60_clock_source_create(ctx, bp, CLOCK_SOURCE_ID_PLL2, &clk_src_regs[2], false);
+		pool->base.clk_src_count = 2;
 	}
 
 	if (pool->base.dp_clock_source == NULL) {


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
