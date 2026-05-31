Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AhqEkYgHGoRKAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 13:49:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D2615E42
	for <lists+amd-gfx@lfdr.de>; Sun, 31 May 2026 13:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7EE112AE8;
	Sun, 31 May 2026 11:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LQeuNW5E";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2DE112AEA;
 Sun, 31 May 2026 11:49:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A13B140C4D;
 Sun, 31 May 2026 11:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF221F00899;
 Sun, 31 May 2026 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780228159;
 bh=U2k+F91HwjQrpVP3BVgcbCSYpcxAxV57CRaPIrFsxM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LQeuNW5EHjGT/VvCYkNCvBXhrcBu4uDTVK/feGdJaTxwubjSbpfAAg6EcKjqhlrVm
 lf8I9SG4ey2w/SXopeNY/jWVyWKZHTTAlzBDTjVjFXvJs33g47kglV3Yv0evaxXWOP
 G6DC9MeEeOfGa09sTKOycXHNZCBoqbiRw2Z4MMhrMb1on/mz9S6OW0jiympVqm6ld6
 fqVQFrXgSzt+XQwt7oNgayJChC+vE1ws4lWNgGEGrxzWUGqbd9yWezPGDQvaDb3WMP
 dJLCsEaqUK01aHaJEJWMuJYIAvsaaTdsdhbTK080OJKvloVfrcnbwZBEjotayZIxio
 hEQcK5UxTAcBA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v5 06/11] drm/amd/display: Allow backlight registration to fail
Date: Sun, 31 May 2026 06:49:03 -0500
Message-ID: <20260531114908.1693426-7-superm1@kernel.org>
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
X-Rspamd-Queue-Id: F07D2615E42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Why]
If backlight registration fails then it's ignored. This could hide
a fatal problem to a user.

[How]
Pass error codes up from backlight registration failures.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 +++++++++++--------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index de9b29ad6cab..430b7d3d8930 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5478,7 +5478,7 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
 	.update_status	= amdgpu_dm_backlight_update_status,
 };
 
-static void
+static int
 amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 {
 	struct drm_device *drm = aconnector->base.dev;
@@ -5489,15 +5489,16 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 	int min, max;
 	int real_brightness;
 	int init_brightness;
+	int r;
 
 	if (aconnector->bl_idx == -1)
-		return;
+		return 0;
 
 	if (!acpi_video_backlight_use_native()) {
 		drm_info(drm, "Skipping amdgpu DM backlight registration\n");
 		/* Try registering an ACPI video backlight device instead. */
 		acpi_video_register_backlight();
-		return;
+		return 0;
 	}
 
 	caps = &dm->backlight_caps[aconnector->bl_idx];
@@ -5531,22 +5532,26 @@ amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 	dm->brightness[aconnector->bl_idx] = props.brightness;
 
 	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
-		drm_err(drm, "DM: Backlight registration failed!\n");
+		r = PTR_ERR(dm->backlight_dev[aconnector->bl_idx]);
+		drm_err(drm, "DM: Backlight registration failed: %d\n", r);
 		dm->backlight_dev[aconnector->bl_idx] = NULL;
-	} else {
-		/*
-		 * dm->brightness[x] can be inconsistent just after startup until
-		 * ops.get_brightness is called.
-		 */
-		real_brightness =
-			amdgpu_dm_backlight_ops.get_brightness(dm->backlight_dev[aconnector->bl_idx]);
+		return r;
+	}
 
-		if (real_brightness != init_brightness) {
-			dm->actual_brightness[aconnector->bl_idx] = real_brightness;
-			dm->brightness[aconnector->bl_idx] = real_brightness;
-		}
-		drm_dbg_driver(drm, "DM: Registered Backlight device: %s\n", bl_name);
+	/*
+	 * dm->brightness[x] can be inconsistent just after startup until
+	 * ops.get_brightness is called.
+	 */
+	real_brightness =
+		amdgpu_dm_backlight_ops.get_brightness(dm->backlight_dev[aconnector->bl_idx]);
+
+	if (real_brightness != init_brightness) {
+		dm->actual_brightness[aconnector->bl_idx] = real_brightness;
+		dm->brightness[aconnector->bl_idx] = real_brightness;
 	}
+	drm_dbg_driver(drm, "DM: Registered Backlight device: %s\n", bl_name);
+
+	return 0;
 }
 
 static int initialize_plane(struct amdgpu_display_manager *dm,
@@ -8078,7 +8083,9 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 			return r;
 	}
 
-	amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
+	r = amdgpu_dm_register_backlight_device(amdgpu_dm_connector);
+	if (r)
+		return r;
 
 	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
 	    (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
-- 
2.54.0

