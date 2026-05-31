Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMzxJ0ogHGoRKAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 13:49:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB4615E6F
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 13:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7976112AF3;
	Sun, 31 May 2026 11:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ToExa9UG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BD7112AE8;
 Sun, 31 May 2026 11:49:20 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7841160123;
 Sun, 31 May 2026 11:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84531F00893;
 Sun, 31 May 2026 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780228160;
 bh=5lzk+OTDldDG2SnGC+MYMfMJssDNEQ29EEsKCv9DX20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ToExa9UGH3B1LMTgiGuTwl3jtaSBnNLG5YMVYC8W+s4qGhljAILwOO+FfYoR5FMOv
 o8KIVOsPgzyQGavxCQPHNyFOXBQ3UtlqPkqO748zAHub+JJh4DcNH5rLW5BSk3wfJc
 uKOmzlplpVO0FjgcfEIt9iWYFE5CT1/MkB56YQp8yVeggfIsSxGKBCXVJuKZwuwB0F
 seZsmBUxOJE+50+Si8BO8M6zZeFazmGCShgXM7UcNFqdOkHLTYMMZSwpGZ/MWMJu/N
 2BY2rsHRuIG5nFGAnF0yZTAB9ya9W1Wazu1XnIX7v9+zGPS8elXzkp8PlBK+xxz95v
 nwAqtKoCwR9JQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v5 07/11] drm/amd/display: Move backlight tracing out of the
 dc lock
Date: Sun, 31 May 2026 06:49:04 -0500
Message-ID: <20260531114908.1693426-8-superm1@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531114908.1693426-1-superm1@kernel.org>
References: <20260531114908.1693426-1-superm1@kernel.org>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 72AB4615E6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The backlight tracing doesn't need to be done with DC lock held as
it's using information that is fed into the function.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 430b7d3d8930..f6610902eee4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5371,13 +5371,6 @@ static void amdgpu_dm_backlight_set_level(struct amdgpu_display_manager *dm,
 	if (caps->brightness_mask)
 		brightness |= caps->brightness_mask;
 
-	/* Change brightness based on AUX property */
-	mutex_lock(&dm->dc_lock);
-	if (dm->dc->caps.ips_support && dm->dc->ctx->dmub_srv->idle_allowed) {
-		dc_allow_idle_optimizations(dm->dc, false);
-		reallow_idle = true;
-	}
-
 	if (trace_amdgpu_dm_brightness_enabled()) {
 		trace_amdgpu_dm_brightness(__builtin_return_address(0),
 					   user_brightness,
@@ -5386,6 +5379,13 @@ static void amdgpu_dm_backlight_set_level(struct amdgpu_display_manager *dm,
 					   power_supply_is_system_supplied() > 0);
 	}
 
+	/* Change brightness based on AUX property */
+	mutex_lock(&dm->dc_lock);
+	if (dm->dc->caps.ips_support && dm->dc->ctx->dmub_srv->idle_allowed) {
+		dc_allow_idle_optimizations(dm->dc, false);
+		reallow_idle = true;
+	}
+
 	if (caps->aux_support) {
 		rc = dc_link_set_backlight_level_nits(link, true, brightness,
 						      AUX_BL_DEFAULT_TRANSITION_TIME_MS);
-- 
2.54.0

