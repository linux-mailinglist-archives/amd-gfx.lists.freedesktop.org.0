Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73329DB5F
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Oct 2020 00:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB816E822;
	Wed, 28 Oct 2020 23:52:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 605C86E820
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 23:52:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g25so481633edm.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Oct 2020 16:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fAPyeiomRGtuS0qAwwE+5rEoAN0wdeQSIBW/YE5Eir0=;
 b=KG6CAPRp6pOQHgjzk9HxE+w2pGlogW4IsUJyzW3UD61Rpcf7urB60wgSzsoxvpvUUW
 ez13BLHZduZ6N6VpiCabjk9IZZPd2gZprCZ6UbavSVK/uwilZdD0/X1p3+46AMYJZNij
 bDEklTcatBj8SL19e4tiZbo51vpPDy7foCaTmxk/VNWfyn2qfT9Di5HBDXg5v1vcdmbe
 HEimwxF7Lf5D2cbOkRb/YxI4zvQ3euGnyfGWj6HGGxD7K5bEA+zbbi2xFNzxPynDRObN
 yVkzCMgaIe4fN09f0VJlgfTMalk1ugn7oaXeEHmfOt+1Ee5bxUatiwulwa1BZ9bC5SEX
 Iq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fAPyeiomRGtuS0qAwwE+5rEoAN0wdeQSIBW/YE5Eir0=;
 b=CfCS0qSNMgDS1cUZd6pYLCtK+XCsPUumh/JFulZcYojo920TkckqitLn6iZ9rSk3K5
 0jIW3oCI64cSjXaSDYt/94BNzA3h32FGwIiFzEiChbJLNKyfNPEq+Z6jWwDQc7bptIAI
 2pKQQ8/xpJF+zgqp27HbDn0+xrHCoPZXY6G81lH7AEOGKas4D/VUY5i64rKmKLoTV2rk
 jIeqSEIznh0djRKvZXM8Z/6GQInthFlcpwkHPG6P8BDLlCYmF5NTFrsyaAMekOqLYsgY
 Ng63S8VBufqO6OzHWJ+4IMG5Rl1GyoVb5ygTLlD/Au9sRTKAuiUeRGH+KMi8Q8dCzSvN
 l4hg==
X-Gm-Message-State: AOAM530nBrt4RHG2q9T1KVqND5x5ivyLxtgLsA3mpjj4H0hgEnhRVnlr
 6+7Qj0JfMldIgWb0Fd06QSSdux4p1iRdaw==
X-Google-Smtp-Source: ABdhPJzivFXgdDcyvqdDYZrmwIByg4qzEO29MrjTiKjQLF6IaIxq+7aSWvMexMpZHR3cczAacLToUg==
X-Received: by 2002:aa7:d394:: with SMTP id x20mr1445143edq.14.1603929164696; 
 Wed, 28 Oct 2020 16:52:44 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:aa12:a77f:2000:4cea:81e7:5fd4:93f7])
 by smtp.gmail.com with ESMTPSA id o13sm479174ejr.120.2020.10.28.16.52.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 16:52:44 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v4 05/11] drm/amd/display: Store tiling_flags in the
 framebuffer.
Date: Thu, 29 Oct 2020 00:52:35 +0100
Message-Id: <20201028235241.3299-6-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028235241.3299-1-bas@basnieuwenhuizen.nl>
References: <20201028235241.3299-1-bas@basnieuwenhuizen.nl>
MIME-Version: 1.0
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
Cc: alexdeucher@gmail.com, Alex Deucher <alexander.deucher@amd.com>,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This moves the tiling_flags to the framebuffer creation.
This way the time of the "tiling" decision is the same as it
would be with modifiers.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 48 +++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  3 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 73 +++----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 -
 4 files changed, 59 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 9e92d2a070ac..1a2664c3fc26 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -541,6 +541,39 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 	return domain;
 }
 
+static int amdgpu_display_get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
+				      uint64_t *tiling_flags, bool *tmz_surface)
+{
+	struct amdgpu_bo *rbo;
+	int r;
+
+	if (!amdgpu_fb) {
+		*tiling_flags = 0;
+		*tmz_surface = false;
+		return 0;
+	}
+
+	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
+	r = amdgpu_bo_reserve(rbo, false);
+
+	if (unlikely(r)) {
+		/* Don't show error message when returning -ERESTARTSYS */
+		if (r != -ERESTARTSYS)
+			DRM_ERROR("Unable to reserve buffer: %d\n", r);
+		return r;
+	}
+
+	if (tiling_flags)
+		amdgpu_bo_get_tiling_flags(rbo, tiling_flags);
+
+	if (tmz_surface)
+		*tmz_surface = amdgpu_bo_encrypted(rbo);
+
+	amdgpu_bo_unreserve(rbo);
+
+	return r;
+}
+
 int amdgpu_display_framebuffer_init(struct drm_device *dev,
 				    struct amdgpu_framebuffer *rfb,
 				    const struct drm_mode_fb_cmd2 *mode_cmd,
@@ -550,11 +583,18 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	rfb->base.obj[0] = obj;
 	drm_helper_mode_fill_fb_struct(dev, &rfb->base, mode_cmd);
 	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
-	if (ret) {
-		rfb->base.obj[0] = NULL;
-		return ret;
-	}
+	if (ret)
+		goto fail;
+
+	ret = amdgpu_display_get_fb_info(rfb, &rfb->tiling_flags, &rfb->tmz_surface);
+	if (ret)
+		goto fail;
+
 	return 0;
+
+fail:
+	rfb->base.obj[0] = NULL;
+	return ret;
 }
 
 struct drm_framebuffer *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 345cb0464370..39866ed81c16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -304,6 +304,9 @@ struct amdgpu_display_funcs {
 struct amdgpu_framebuffer {
 	struct drm_framebuffer base;
 
+	uint64_t tiling_flags;
+	bool tmz_surface;
+
 	/* caching for later use */
 	uint64_t address;
 };
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 833887b9b0ad..5a0efaefbd7f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3839,39 +3839,6 @@ static int fill_dc_scaling_info(const struct drm_plane_state *state,
 	return 0;
 }
 
-static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
-		       uint64_t *tiling_flags, bool *tmz_surface)
-{
-	struct amdgpu_bo *rbo;
-	int r;
-
-	if (!amdgpu_fb) {
-		*tiling_flags = 0;
-		*tmz_surface = false;
-		return 0;
-	}
-
-	rbo = gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
-	r = amdgpu_bo_reserve(rbo, false);
-
-	if (unlikely(r)) {
-		/* Don't show error message when returning -ERESTARTSYS */
-		if (r != -ERESTARTSYS)
-			DRM_ERROR("Unable to reserve buffer: %d\n", r);
-		return r;
-	}
-
-	if (tiling_flags)
-		amdgpu_bo_get_tiling_flags(rbo, tiling_flags);
-
-	if (tmz_surface)
-		*tmz_surface = amdgpu_bo_encrypted(rbo);
-
-	amdgpu_bo_unreserve(rbo);
-
-	return r;
-}
-
 static inline uint64_t get_dcc_address(uint64_t address, uint64_t tiling_flags)
 {
 	uint32_t offset = AMDGPU_TILING_GET(tiling_flags, DCC_OFFSET_256B);
@@ -4287,7 +4254,7 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 				    struct drm_crtc_state *crtc_state)
 {
 	struct dm_crtc_state *dm_crtc_state = to_dm_crtc_state(crtc_state);
-	struct dm_plane_state *dm_plane_state = to_dm_plane_state(plane_state);
+	struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)plane_state->fb;
 	struct dc_scaling_info scaling_info;
 	struct dc_plane_info plane_info;
 	int ret;
@@ -4304,10 +4271,10 @@ static int fill_dc_plane_attributes(struct amdgpu_device *adev,
 
 	force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
 	ret = fill_dc_plane_info_and_addr(adev, plane_state,
-					  dm_plane_state->tiling_flags,
+					  afb->tiling_flags,
 					  &plane_info,
 					  &dc_plane_state->address,
-					  dm_plane_state->tmz_surface,
+					  afb->tmz_surface,
 					  force_disable_dcc);
 	if (ret)
 		return ret;
@@ -5913,10 +5880,6 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
 		dc_plane_state_retain(dm_plane_state->dc_state);
 	}
 
-	/* Framebuffer hasn't been updated yet, so retain old flags. */
-	dm_plane_state->tiling_flags = old_dm_plane_state->tiling_flags;
-	dm_plane_state->tmz_surface = old_dm_plane_state->tmz_surface;
-
 	return &dm_plane_state->base;
 }
 
@@ -6021,10 +5984,10 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 
 		fill_plane_buffer_attributes(
 			adev, afb, plane_state->format, plane_state->rotation,
-			dm_plane_state_new->tiling_flags,
+			afb->tiling_flags,
 			&plane_state->tiling_info, &plane_state->plane_size,
 			&plane_state->dcc, &plane_state->address,
-			dm_plane_state_new->tmz_surface, force_disable_dcc);
+			afb->tmz_surface, force_disable_dcc);
 	}
 
 	return 0;
@@ -7287,6 +7250,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 		struct drm_crtc *crtc = new_plane_state->crtc;
 		struct drm_crtc_state *new_crtc_state;
 		struct drm_framebuffer *fb = new_plane_state->fb;
+		struct amdgpu_framebuffer *afb = (struct amdgpu_framebuffer *)fb;
 		bool plane_needs_flip;
 		struct dc_plane_state *dc_plane;
 		struct dm_plane_state *dm_new_plane_state = to_dm_plane_state(new_plane_state);
@@ -7341,10 +7305,10 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 
 		fill_dc_plane_info_and_addr(
 			dm->adev, new_plane_state,
-			dm_new_plane_state->tiling_flags,
+			afb->tiling_flags,
 			&bundle->plane_infos[planes_count],
 			&bundle->flip_addrs[planes_count].address,
-			dm_new_plane_state->tmz_surface, false);
+			afb->tmz_surface, false);
 
 		DRM_DEBUG_DRIVER("plane: id=%d dcc_en=%d\n",
 				 new_plane_state->plane->index,
@@ -8483,8 +8447,7 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	 * TODO: Come up with a more elegant solution for this.
 	 */
 	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
-		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
-
+		struct amdgpu_framebuffer *old_afb, *new_afb;
 		if (other->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -8528,12 +8491,11 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 		if (old_other_state->fb->format != new_other_state->fb->format)
 			return true;
 
-		old_dm_plane_state = to_dm_plane_state(old_other_state);
-		new_dm_plane_state = to_dm_plane_state(new_other_state);
+		old_afb = (struct amdgpu_framebuffer *)old_other_state->fb;
+		new_afb = (struct amdgpu_framebuffer *)new_other_state->fb;
 
 		/* Tiling and DCC changes also require bandwidth updates. */
-		if (old_dm_plane_state->tiling_flags !=
-		    new_dm_plane_state->tiling_flags)
+		if (old_afb->tiling_flags != new_afb->tiling_flags)
 			return true;
 	}
 
@@ -8859,17 +8821,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 
-	/* Prepass for updating tiling flags on new planes. */
-	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
-		struct dm_plane_state *new_dm_plane_state = to_dm_plane_state(new_plane_state);
-		struct amdgpu_framebuffer *new_afb = to_amdgpu_framebuffer(new_plane_state->fb);
-
-		ret = get_fb_info(new_afb, &new_dm_plane_state->tiling_flags,
-				  &new_dm_plane_state->tmz_surface);
-		if (ret)
-			goto fail;
-	}
-
 	/* Remove exiting planes if they are modified */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		ret = dm_update_plane_state(dc, state, plane,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index a46338410ddd..9308bed3c4fe 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -420,8 +420,6 @@ struct dc_plane_state;
 struct dm_plane_state {
 	struct drm_plane_state base;
 	struct dc_plane_state *dc_state;
-	uint64_t tiling_flags;
-	bool tmz_surface;
 };
 
 struct dm_crtc_state {
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
