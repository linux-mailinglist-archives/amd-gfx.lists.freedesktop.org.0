Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BD13BCD31
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Jul 2021 13:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4B36E32A;
	Tue,  6 Jul 2021 11:20:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD596E32A;
 Tue,  6 Jul 2021 11:20:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E47B61D8D;
 Tue,  6 Jul 2021 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570425;
 bh=gUjBXyHgh1qeAFYc4TA5i+/1RBDq93iXS7C8BapeqiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UGW2ZTod8xnl614EEzSxgMYegXEizw2aTUvebf5S9tXWLx6bdTNJrjAVr16F21TEF
 dPjKZqgVYRsYGSzIyk+dOuzYMKfDIqfAUDvJLsWhoDSMyMGaXE/oJwKI/52rJMJsIX
 uQGjMpyg3kiluN3ExBhRAdHzfkrzQnE56euo3Tcex1FCejhbdpIWM4QaM/On35fvD0
 ku9htd+azSqklm2GVzBh+bhezr+EHk+03Vr6DAMNqGntiAoeWs3r3afEGSbOwibofN
 QekaB1tywJJQamClhdBYovGN0wsQHhRi/TuVNnU3h+M9iZQyJ1wlcU3WFpaWC/rzl3
 7XiVdv5m3sxzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 088/160] drm/amd/display: Verify Gamma & Degamma
 LUT sizes in amdgpu_dm_atomic_check
Date: Tue,  6 Jul 2021 07:17:14 -0400
Message-Id: <20210706111827.2060499-88-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111827.2060499-1-sashal@kernel.org>
References: <20210706111827.2060499-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Mark Yacoub <markyacoub@chromium.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@chromium.org>

[ Upstream commit 03fc4cf45d30533d54f0f4ebc02aacfa12f52ce2 ]

For each CRTC state, check the size of Gamma and Degamma LUTs  so
unexpected and larger sizes wouldn't slip through.

TEST: IGT:kms_color::pipe-invalid-gamma-lut-sizes

v2: fix assignments in if clauses, Mark's email.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 41 ++++++++++++++++---
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 217b5e50eebe..2efd31a9163c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -9484,6 +9484,10 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			dm_old_crtc_state->dsc_force_changed == false)
 			continue;
 
+		ret = amdgpu_dm_verify_lut_sizes(new_crtc_state);
+		if (ret)
+			goto fail;
+
 		if (!new_crtc_state->enable)
 			continue;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 52cc81705280..250adc92dfd0 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -529,6 +529,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 #define MAX_COLOR_LEGACY_LUT_ENTRIES 256
 
 void amdgpu_dm_init_color_mod(void);
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 157fe4efbb59..a022e5bb30a5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -284,6 +284,37 @@ static int __set_input_tf(struct dc_transfer_func *func,
 	return res ? 0 : -ENOMEM;
 }
 
+/**
+ * Verifies that the Degamma and Gamma LUTs attached to the |crtc_state| are of
+ * the expected size.
+ * Returns 0 on success.
+ */
+int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
+{
+	const struct drm_color_lut *lut = NULL;
+	uint32_t size = 0;
+
+	lut = __extract_blob_lut(crtc_state->degamma_lut, &size);
+	if (lut && size != MAX_COLOR_LUT_ENTRIES) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Degamma LUT size. Should be %u but got %u.\n",
+			MAX_COLOR_LUT_ENTRIES, size);
+		return -EINVAL;
+	}
+
+	lut = __extract_blob_lut(crtc_state->gamma_lut, &size);
+	if (lut && size != MAX_COLOR_LUT_ENTRIES &&
+	    size != MAX_COLOR_LEGACY_LUT_ENTRIES) {
+		DRM_DEBUG_DRIVER(
+			"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
+			MAX_COLOR_LUT_ENTRIES, MAX_COLOR_LEGACY_LUT_ENTRIES,
+			size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
@@ -317,14 +348,12 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
 	bool is_legacy;
 	int r;
 
-	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
-	if (degamma_lut && degamma_size != MAX_COLOR_LUT_ENTRIES)
-		return -EINVAL;
+	r = amdgpu_dm_verify_lut_sizes(&crtc->base);
+	if (r)
+		return r;
 
+	degamma_lut = __extract_blob_lut(crtc->base.degamma_lut, &degamma_size);
 	regamma_lut = __extract_blob_lut(crtc->base.gamma_lut, &regamma_size);
-	if (regamma_lut && regamma_size != MAX_COLOR_LUT_ENTRIES &&
-	    regamma_size != MAX_COLOR_LEGACY_LUT_ENTRIES)
-		return -EINVAL;
 
 	has_degamma =
 		degamma_lut && !__is_lut_linear(degamma_lut, degamma_size);
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
