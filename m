Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HutFa56xmnwKgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:14 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9062344543
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2026 13:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AB910EDD5;
	Fri, 27 Mar 2026 12:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YxVCSMAM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5F910EB50
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 23:47:50 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c648bc907ebso1077640a12.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774568870; x=1775173670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pCNIYnvbijot8BuXxZwdBSIjs5gTuAaUWfD7Zd1qpw=;
 b=YxVCSMAMa5WpEsxTFYENjZ6HjUu4wwKmjr8Z3h2S8sGC+mJUa3v0b82kgIXG0bEJHw
 HD/vAad5TLX2ZoFLZsf+SkGPvRZMcWzT2o7iO9GTvog9vFK9cUs1jJEmSjI+FDVNpGnK
 FNWMqIlcSidMY31aCpwAR+EC7PNuO2BvD7W1bnIVDh/hSUx4byw7uWlLSuZgGpCYv1t7
 TA0duyrHXngVaTMoXNf/wcpuc3INcyHaMkIixRokSUybtE1wUlvo9t0+FeAWxk029C9j
 cFNVQNeudehg/iVcgHUAI0nHx9Z3nfOIIq8Ntn9AFpJ/MI6AdhSPPkNk3Rx7XAId2w4A
 Awdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774568870; x=1775173670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9pCNIYnvbijot8BuXxZwdBSIjs5gTuAaUWfD7Zd1qpw=;
 b=Clhu4+ugCqsdcW910/00YgiPi48rLz8ilZ6J7Qt3yLwvGojcmkpexJ/haBM7WCNkut
 y3QwgWHOUZXwBKzx2IWyynDxhB/rjeh7wtzSE71fD3oVHBzxr2JhAAUVPW3uCX74xkjD
 h1GA68I3eKVtwXv63WKcX1sidQCKW778ME88X4frQU/ibYi3idIfFbgeGX4Ymo+sE4F0
 lVh9Urh1TN/gWFfO+us0xnMeMgcvxoCoZcMLsrTwaOi8fXNoyqJfgIXmgJNdTUX7fzr8
 dOIp0bpwjEVqTke/lqNdOdKPD4ShImEPwF5zcwtaEI/4eddTWcm5cjdSMxbvpZ+hwCSI
 m9ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO44xjleX1KQ5aymvftvWzkeK8NTQ74VFtwnSiFYXvF+NDkxj2rMWk6g4FQbZDWklc2Eiwl5hp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyiro6fES5e/iCN4ODg4N9aVn7hcF2fIZIOe6q1WCcZ6bJ43v2F
 EKXe3K4l0UrmrbHawBgPdh8drBOmR4RAlePztaTZvZ5ttjzmFBO8MzCz
X-Gm-Gg: ATEYQzzn88+ynnjyA9kDJJuTK+OdgRCWiY/GAWxsW4ZGEpeFfw75iT3odQ/bR0NS9rh
 BvvDn/LgdD7U25nwETbSI5YflE8BIQIH8SAwoZMECEU+LxcZsPFK9ey7m1wd1aMscPps9KG4Zjz
 RsestbD0a/WZa0IY5MP/cXI5JKYlPCCtaPacxpkN3D51nqX/ZhBZBazwud4h4dJ4tcNodkfHfSn
 eJlaFYUG0ljcuIjLfCjKid1HqX1QCeF0QBe6dUzgTtxW9h/5whcQAv53obj7u9w1QjEJPzjyfF9
 hT0PaDg4ZlkqEmAbzSzEsOzISfWoSZyahDd0TCifuiTy2Cs+9Esvp0NzwuPA73YjcpG84vctQWX
 OEoRUaiOa0My6r7B43H6ukZLQMx41jS3Lek4op3n0WKziVBD8rl2WN4uYA/EJPQo8VGVDMG3SId
 RCmK9QUCk/KNyZAW/kAGu+re0flWriXIy8C/cEnZPltROcnCTHLJROrEPuQSEweqES6w==
X-Received: by 2002:a05:6300:210e:b0:398:919a:ddf5 with SMTP id
 adf61e73a8af0-39c878d5394mr525263637.24.1774568870090; 
 Thu, 26 Mar 2026 16:47:50 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7673933816sm3201162a12.21.2026.03.26.16.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2026 16:47:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bin Lan <bin.lan.cn@windriver.com>, He Zhe <zhe.he@windriver.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Hung <alex.hung@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Mario Limonciello <Mario.Limonciello@amd.com>, Ray Wu <ray.wu@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Roman Li <Roman.Li@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH for 6.12 7/9] drm/amd/display: Adjust DCE 8-10 clock,
 don't overclock by 15%
Date: Thu, 26 Mar 2026 16:47:14 -0700
Message-ID: <20260326234716.16723-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326234716.16723-1-rosenp@gmail.com>
References: <20260326234716.16723-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 12:40:01 +0000
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:Xinhui.Pan@amd.com,m:airlied@linux.ie,m:daniel@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:gregkh@linuxfoundation.org,m:bin.lan.cn@windriver.com,m:zhe.he@windriver.com,m:vitaly.prosyak@amd.com,m:alex.hung@amd.com,m:siqueira@igalia.com,m:timur.kristof@gmail.com,m:Mario.Limonciello@amd.com,m:ray.wu@amd.com,m:wayne.lin@amd.com,m:Roman.Li@amd.com,m:Eric.Yang2@amd.com,m:Tony.Cheng@amd.com,m:issor.oruam@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:timurkristof@gmail.com,m:issororuam@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,linux.ie,ffwll.ch,linuxfoundation.org,windriver.com,igalia.com,gmail.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,igalia.com:email]
X-Rspamd-Queue-Id: D9062344543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Timur Kristóf <timur.kristof@gmail.com>

[ Upstream commit 1ae45b5d4f371af8ae51a3827d0ec9fe27eeb867 ]

Adjust the nominal (and performance) clocks for DCE 8-10,
and set them to 625 MHz, which is the value used by the legacy
display code in amdgpu_atombios_get_clock_info.

This was tested with Hawaii, Tonga and Fiji.
These GPUs can output 4K 60Hz (10-bit depth) at 625 MHz.

The extra 15% clock was added as a workaround for a Polaris issue
which uses DCE 11, and should not have been used on DCE 8-10 which
are already hardcoded to the highest possible display clock.
Unfortunately, the extra 15% was mistakenly copied and kept
even on code paths which don't affect Polaris.

This commit fixes that and also	adds a check to	make sure
not to exceed the maximum DCE 8-10 display clock.

Fixes: 8cd61c313d8b ("drm/amd/display: Raise dispclk value for Polaris")
Fixes: dc88b4a684d2 ("drm/amd/display: make clk mgr soc specific")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Rodrigo Siqueira <siqueira@igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c  | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
index 5dbe89d9b72d..6131ede2db7a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c
@@ -72,9 +72,9 @@ static const struct state_dependent_clocks dce80_max_clks_by_state[] = {
 /* ClocksStateLow */
 { .display_clk_khz = 352000, .pixel_clk_khz = 330000},
 /* ClocksStateNominal */
-{ .display_clk_khz = 600000, .pixel_clk_khz = 400000 },
+{ .display_clk_khz = 625000, .pixel_clk_khz = 400000 },
 /* ClocksStatePerformance */
-{ .display_clk_khz = 600000, .pixel_clk_khz = 400000 } };
+{ .display_clk_khz = 625000, .pixel_clk_khz = 400000 } };
 
 int dentist_get_divider_from_did(int did)
 {
@@ -403,11 +403,9 @@ static void dce_update_clocks(struct clk_mgr *clk_mgr_base,
 {
 	struct clk_mgr_internal *clk_mgr_dce = TO_CLK_MGR_INTERNAL(clk_mgr_base);
 	struct dm_pp_power_level_change_request level_change_req;
-	int patched_disp_clk = context->bw_ctx.bw.dce.dispclk_khz;
-
-	/*TODO: W/A for dal3 linux, investigate why this works */
-	if (!clk_mgr_dce->dfs_bypass_active)
-		patched_disp_clk = patched_disp_clk * 115 / 100;
+	const int max_disp_clk =
+		clk_mgr_dce->max_clks_by_state[DM_PP_CLOCKS_STATE_PERFORMANCE].display_clk_khz;
+	int patched_disp_clk = MIN(max_disp_clk, context->bw_ctx.bw.dce.dispclk_khz);
 
 	level_change_req.power_level = dce_get_required_clocks_state(clk_mgr_base, context);
 	/* get max clock state from PPLIB */
-- 
2.53.0

