Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016507E4028
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Nov 2023 14:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47D510E5F2;
	Tue,  7 Nov 2023 13:40:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from 8.mo560.mail-out.ovh.net (8.mo560.mail-out.ovh.net
 [188.165.52.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22D110E4CE
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Nov 2023 08:37:01 +0000 (UTC)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.156.29])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 3538529A28
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Nov 2023 08:28:50 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-s8vqx (unknown [10.110.208.218])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A83E51FDFD;
 Tue,  7 Nov 2023 08:28:48 +0000 (UTC)
Received: from foxhound.fi ([37.59.142.95])
 by ghost-submission-6684bf9d7b-s8vqx with ESMTPSA
 id jQj6KkD1SWWnLwAA4IXPKg
 (envelope-from <jose.pekkarinen@foxhound.fi>); Tue, 07 Nov 2023 08:28:48 +0000
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001000307f4-4e36-45cc-84f3-1e15167bd51f,
 990ED9DB402E285008FC912DE57946D84A8BC800)
 smtp.auth=jose.pekkarinen@foxhound.fi
X-OVh-ClientIp: 213.216.211.70
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 skhan@linuxfoundation.org
Subject: [PATCH] drm/amd/display: clean up redundant conversions to bool
Date: Tue,  7 Nov 2023 10:28:38 +0200
Message-Id: <20231107082839.92061-1-jose.pekkarinen@foxhound.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17672687891539732161
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvkedrudduhedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeflohhsrocurfgvkhhkrghrihhnvghnuceojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqnecuggftrfgrthhtvghrnhepfedtleeuteeitedvtedtteeuieevudejfeffvdetfeekleehhfelleefteetjeejnecukfhppeduvdejrddtrddtrddupddvudefrddvudeirddvuddurdejtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeojhhoshgvrdhpvghkkhgrrhhinhgvnhesfhhogihhohhunhgurdhfiheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghmugdqghhfgieslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht
X-Mailman-Approved-At: Tue, 07 Nov 2023 13:40:19 +0000
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
Cc: airlied@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@foxhound.fi>,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com,
 linux-kernel-mentees@lists.linux.dev
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This patch will address the following couple of warnings retrieved by
using coccinelle, where there is an explicit conversion to bool that
are redundant.

drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:94:102-107: WARNING: conversion to bool not needed here
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c:102:72-77: WARNING: conversion to bool not needed here

Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
index 32d3086c4cb7..5ce542b1f860 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
@@ -91,7 +91,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
 	pr_config.replay_supported = true;
 	pr_config.replay_power_opt_supported = 0;
 	pr_config.replay_enable_option |= pr_enable_option_static_screen;
-	pr_config.replay_timing_sync_supported = aconnector->max_vfreq >= 2 * aconnector->min_vfreq ? true : false;
+	pr_config.replay_timing_sync_supported = aconnector->max_vfreq >= 2 * aconnector->min_vfreq;
 
 	if (!pr_config.replay_timing_sync_supported)
 		pr_config.replay_enable_option &= ~pr_enable_option_general_ui;
@@ -99,7 +99,7 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struct amdgpu_dm_connector *ac
 	debug_flags = (union replay_debug_flags *)&pr_config.debug_flags;
 	debug_flags->u32All = 0;
 	debug_flags->bitfields.visual_confirm =
-		link->ctx->dc->debug.visual_confirm == VISUAL_CONFIRM_REPLAY ? true : false;
+		link->ctx->dc->debug.visual_confirm == VISUAL_CONFIRM_REPLAY;
 
 	link->replay_settings.replay_feature_enabled = true;
 
-- 
2.39.2

