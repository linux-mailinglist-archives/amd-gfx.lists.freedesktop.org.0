Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VIESIWIjIWpS/gAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5163D7E9
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 09:04:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=qB4JrXrC;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=linux.dev
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742B2113D01;
	Thu,  4 Jun 2026 07:04:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D1B1126DC
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 06:44:56 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1780555493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mTI2prm2clzWv1IFKwQSUxNjHp3GJWhjQ6YGZew1VGE=;
 b=qB4JrXrC/Jhnp3Q+ZWLXyuhI74JmgrnhViNwN6dZAcs1RKmFD1+S2EV6hNl7S1LHRtKjFw
 lm4uGvjqDH5z7GqzC/po/RcdmO3M7Ydubewk9hlI+IsLo8Gh2iWT7pPCxFFnlTdgX2yUb8
 kt9Goo3DbHszaYU5hi7hBO4Fcg5prgI=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] drm/amd/display: Fix mem_type change detection for async flips
Date: Wed,  3 Jun 2026 23:44:24 -0700
Message-ID: <20260604064424.3154796-1-matthew.schwartz@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Thu, 04 Jun 2026 07:03:56 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:daniel.wheeler@amd.com,m:chiahsuan.chung@amd.com,m:dri-devel@lists.freedesktop.org,m:matthew.schwartz@linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[matthew.schwartz@linux.dev,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.schwartz@linux.dev,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.dev:mid,linux.dev:dkim,linux.dev:from_mime,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D5163D7E9

[Why]
amdgpu_dm_crtc_mem_type_changed() fetches the "old" and "new" plane state
with two drm_atomic_get_plane_state() calls, which both return the new
state. It compares a state against itself, so it never detects a mem_type
change and never rejects the async flip.

On DCN 3.0.1, this shows up as intermittent corruption when a single DCC
plane is scanned out with immediate flips under gamescope and its buffer
moves between the VRAM carveout and GTT.

[How]
Use drm_atomic_get_old_plane_state() and drm_atomic_get_new_plane_state()
to compare the actual old and new states. These return NULL rather than
an error pointer for a plane that is not part of the commit, so the
IS_ERR() check becomes a NULL check that skips those planes, such as an
unmodified cursor still in the CRTC's plane_mask.

Fixes: 4caacd1671b7a ("drm/amd/display: Do not elevate mem_type change to full update")
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6c1e7e13f0399..711640739179e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -12934,13 +12934,11 @@ static bool amdgpu_dm_crtc_mem_type_changed(struct drm_device *dev,
 	struct drm_plane_state *new_plane_state, *old_plane_state;
 
 	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
-		new_plane_state = drm_atomic_get_plane_state(state, plane);
-		old_plane_state = drm_atomic_get_plane_state(state, plane);
+		new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+		old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 
-		if (IS_ERR(new_plane_state) || IS_ERR(old_plane_state)) {
-			drm_err(dev, "Failed to get plane state for plane %s\n", plane->name);
-			return false;
-		}
+		if (!old_plane_state || !new_plane_state)
+			continue;
 
 		if (old_plane_state->fb && new_plane_state->fb &&
 		    get_mem_type(old_plane_state->fb) != get_mem_type(new_plane_state->fb))
-- 
2.54.0

