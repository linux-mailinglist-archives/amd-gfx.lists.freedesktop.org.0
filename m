Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49899F5046
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Dec 2024 17:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9A010EA0B;
	Tue, 17 Dec 2024 16:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="n0GDUQAX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF0A10EA0B;
 Tue, 17 Dec 2024 16:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734451641;
 bh=eTwYPTCgnv7BbHWY5Z9CkBPZ7b0O3ql0FQSXbGqS7/g=;
 h=From:To:Cc:Subject:Date:From;
 b=n0GDUQAXf3YAZVo8UYHxqAJP+On0gWPWKKmLexWgiSZTU5KyLHt3yitwvXv1ahjKl
 uN7zqX1JZP3flVjF8e592n/sXDFQ6sSeLK+mAZ31QVqX+8KkllSIjJPO8iKARwOXA0
 1wP7T7mQ7Q0kdQuSUGFn4XLe0IE6twzY87f9rXk5Q/BK01z7/lnv/yWtt5WJbaYhXQ
 e7qFiVhC1AX8+mDGoNOERyYUigFtpXmDz4qFaLQfz7eLLRVqUrxguhmJZPd8pviLcT
 gsz+5hxFZ1W+3Ro36tvXbDD4oXlZBhG8Ymrs4bPQMqZ/tIT6SmFWD+wap6cN2d9voG
 f8XCxx51xHUgg==
Received: from localhost.localdomain (unknown [171.76.86.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DAA917E1270;
 Tue, 17 Dec 2024 17:07:12 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, dmitry.baryshkov@linaro.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ci: uprev IGT
Date: Tue, 17 Dec 2024 21:36:52 +0530
Message-ID: <20241217160655.2371138-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
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

Uprev IGT to the latest version and update expectation files.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v1:
  - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
    Will update the flake bug report link after v1 is reviewed.

v2:
  - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
    Updated flake test bug report links.

---
 drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   8 +-
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  21 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   5 +
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  20 +-
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  14 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   1 +
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |   8 +-
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  22 +-
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   1 +
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  31 +-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 298 ++++++++++
 drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt  |  18 +-
 drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt |  15 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 112 ++++
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  55 +-
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  13 +
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  15 +-
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   7 +
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   7 +-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |   7 +
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   5 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  12 +-
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   5 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   3 +
 .../msm-sc7180-trogdor-kingoftown-fails.txt   |   1 -
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  14 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt |   1 -
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   5 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |   2 -
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   5 +
 .../drm/ci/xfails/msm-sm8350-hdk-fails.txt    |   5 -
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  26 +-
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  13 +-
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  56 ++
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   5 +
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   5 +
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   8 -
 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 543 +++++++++++++++++-
 42 files changed, 1202 insertions(+), 211 deletions(-)

diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
index 90bde9f00cc3..b7214718723c 100644
--- a/drivers/gpu/drm/ci/gitlab-ci.yml
+++ b/drivers/gpu/drm/ci/gitlab-ci.yml
@@ -5,7 +5,7 @@ variables:
   UPSTREAM_REPO: https://gitlab.freedesktop.org/drm/kernel.git
   TARGET_BRANCH: drm-next
 
-  IGT_VERSION: a73311079a5d8ac99eb25336a8369a2c3c6b519b
+  IGT_VERSION: 33adea9ebafd059ac88a5ccfec60536394f36c7c
 
   DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/mesa/deqp-runner.git
   DEQP_RUNNER_GIT_TAG: v0.20.0
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index f44dbce3151a..75374085f40f 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -14,10 +14,16 @@ amdgpu/amd_plane@mpo-scale-nv12,Fail
 amdgpu/amd_plane@mpo-scale-p010,Fail
 amdgpu/amd_plane@mpo-scale-rgb,Crash
 amdgpu/amd_plane@mpo-swizzle-toggle,Fail
-amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Crash
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
+kms_async_flips@alternate-sync-async-flip,Fail
+kms_async_flips@alternate-sync-async-flip-atomic,Fail
+kms_async_flips@test-cursor,Fail
+kms_async_flips@test-cursor-atomic,Fail
+kms_async_flips@test-time-stamp,Fail
+kms_async_flips@test-time-stamp-atomic,Fail
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index e70bd9d447ca..adffb011298a 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1,10 +1,3 @@
-# Board Name: hp-11A-G6-EE-grunt
-# Bug Report: https://lore.kernel.org/amd-gfx/3542730f-b8d7-404d-a947-b7a5e95d661c@collabora.com/T/#u
-# Failure Rate: 50
-# IGT Version: 1.28-g0df7b9b97
-# Linux Version: 6.9.0-rc7
-kms_async_flips@async-flip-with-page-flip-events
-
 # Board Name: hp-11A-G6-EE-grunt
 # Bug Report: https://lore.kernel.org/amd-gfx/3542730f-b8d7-404d-a947-b7a5e95d661c@collabora.com/T/#u
 # Failure Rate: 50
@@ -25,3 +18,17 @@ kms_plane@pixel-format-source-clamping
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_async_flips@async-flip-with-page-flip-events
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://gitlab.freedesktop.org/drm/amd/-/issues/3835
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_async_flips@async-flip-with-page-flip-events-atomic
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://gitlab.freedesktop.org/drm/amd/-/issues/3836
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_async_flips@crc-atomic
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index f41b3e112976..3879c4812a22 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -32,3 +32,8 @@ amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
 amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
 amdgpu/amd_vrr_range@freesync-parsing
 device_reset.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 0907cb0f6d9e..a29cea4f234c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,16 +1,14 @@
 core_setmaster@master-drop-set-shared-fd,Fail
-core_setmaster@master-drop-set-user,Fail
-core_setmaster_vs_auth,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout
-kms_fb_coherency@memset-crc,Crash
-kms_flip@busy-flip,Timeout
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail
+kms_async_flips@test-time-stamp,Timeout
+kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
+kms_flip@dpms-off-confusion-interruptible,Timeout
+kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -33,20 +31,12 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu,Timeout
 kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Timeout
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
-kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
-kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
-kms_prop_blob@invalid-set-prop,Fail
-kms_rotation_crc@primary-rotation-180,Timeout
-kms_vblank@query-forked-hang,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
index 0207c9807bee..fee246c25b9a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
@@ -53,3 +53,17 @@ kms_pm_rpm@modeset-lpsp-stress
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_pm_rpm@drm-resources-equal
+
+# Board Name: asus-C433TA-AJ0005-rammus
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13346
+# Failure Rate: 60
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+i915_hangman@gt-engine-error
+
+# Board Name: asus-C433TA-AJ0005-rammus
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13345
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+gen9_exec_parse@unaligned-access
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index 5186ba3dbbc6..2ef1dc35a7fa 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -20,6 +20,7 @@ i915_pm_rc6_residency.*
 i915_suspend.*
 kms_scaling_modes.*
 i915_pm_rpm.*
+i915_module_load@reload-with-fault-injection
 
 # Kernel panic
 drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 64772fedaed5..ee11999e3da1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,3 +1,4 @@
+core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -8,13 +9,13 @@ kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
@@ -29,13 +30,10 @@ kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
 kms_pm_backlight@basic-brightness,Fail
+kms_pm_backlight@brightness-with-dpms,Crash
 kms_pm_backlight@fade,Fail
 kms_pm_backlight@fade-with-dpms,Fail
-kms_pm_rpm@legacy-planes,Timeout
-kms_pm_rpm@legacy-planes-dpms,Timeout
 kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
 kms_sysfs_edid_timing,Fail
 perf@i915-ref-count,Fail
 perf@non-zero-reason,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index f352b719cf7d..47b3f1d42bb6 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,5 +1,4 @@
 core_setmaster@master-drop-set-shared-fd,Fail
-core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -9,9 +8,8 @@ i915_pipe_stress@stress-xrgb8888-ytiled,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-i915_pm_rps@engine-order,Fail
-kms_big_fb@linear-16bpp-rotate-180,Timeout
-kms_fb_coherency@memset-crc,Crash
+kms_async_flips@test-time-stamp,Timeout
+kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
 kms_flip@busy-flip,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
@@ -36,25 +34,29 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Timeout
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
-kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
 kms_psr2_sf@cursor-plane-update-sf,Fail
 kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
 kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@overlay-primary-update-sf-dmg-area,Fail
 kms_psr2_sf@plane-move-sf-dmg-area,Fail
+kms_psr2_sf@pr-cursor-plane-update-sf,Timeout
 kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
 kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
+kms_psr2_sf@psr2-cursor-plane-update-sf,Fail
+kms_psr2_sf@psr2-overlay-plane-update-continuous-sf,Fail
+kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area,Fail
+kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area,Fail
+kms_psr2_sf@psr2-plane-move-sf-dmg-area,Fail
+kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area,Fail
+kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb,Fail
 kms_psr2_su@page_flip-NV12,Fail
-kms_rotation_crc@primary-rotation-180,Timeout
+kms_psr2_su@page_flip-P010,Fail
 kms_setmode@basic,Fail
-kms_vblank@query-forked-hang,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
index d8401251e5f4..5343cc1c8696 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -25,3 +25,10 @@ kms_plane_alpha_blend@constant-alpha-min
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_async_flips@crc
+
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13347
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+gen9_exec_parse@unaligned-access
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 9d753d97c9ab..c87ff8b40e99 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -20,6 +20,7 @@ xe_module_load.*
 api_intel_allocator.*
 kms_cursor_legacy.*
 i915_pm_rpm.*
+kms_flip.*
 
 # Kernel panic
 drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 6eb64c672f7d..843c363b42f5 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,61 +1,35 @@
+core_setmaster@master-drop-set-shared-fd,Fail
 core_setmaster@master-drop-set-user,Fail
-core_setmaster_vs_auth,Fail
+gen9_exec_parse@unaligned-access,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout
 kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@drrs-dirtyfb-ioctl,Fail
 kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
-kms_flip@blocking-wf_vblank,Fail
-kms_flip@busy-flip,Timeout
-kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail
-kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-cpu,Timeout
-kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
 kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
-kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
-kms_pm_rpm@legacy-planes,Timeout
-kms_pm_rpm@legacy-planes-dpms,Timeout
-kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
-kms_prop_blob@invalid-set-prop,Fail
-kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
-kms_rotation_crc@primary-rotation-180,Timeout
-kms_vblank@query-forked-hang,Timeout
 perf@non-zero-reason,Timeout
 sysfs_heartbeat_interval@long,Timeout
-sysfs_heartbeat_interval@off,Timeout
 sysfs_preempt_timeout@off,Timeout
 sysfs_timeslice_duration@off,Timeout
 xe_module_load@force-load,Fail
@@ -63,4 +37,3 @@ xe_module_load@load,Fail
 xe_module_load@many-reload,Fail
 xe_module_load@reload,Fail
 xe_module_load@reload-no-display,Fail
-core_setmaster@master-drop-set-shared-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
index 077886b76093..2a909c657343 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
@@ -11,3 +11,10 @@ core_hotunplug@unplug-rescan
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 kms_fb_coherency@memset-crc
+
+# Board Name: hp-x360-12b-ca0010nr-n4020-octopus
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13348
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_flip@dpms-off-confusion-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 9c64146aed90..219ae839323a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -27,3 +27,301 @@ perf.*
 # Kernel panic
 drm_fdinfo.*
 kms_plane_alpha_blend.*
+
+kms_async_flips.*
+# [IGT] kms_async_flips: executing
+# ------------[ cut here ]------------
+# i915 0000:00:02.0: [drm] drm_WARN_ON(intel_dp->pps.vdd_wakeref)
+# WARNING: CPU: 0 PID: 1253 at drivers/gpu/drm/i915/display/intel_pps.c:760 intel_pps_vdd_on_unlocked+0x351/0x360
+# Modules linked in:
+# CPU: 0 UID: 0 PID: 1253 Comm: kms_async_flips Tainted: G        W          6.13.0-rc2-ge95c88d68ac3 #1
+# Tainted: [W]=WARN
+# Hardware name: HP Bloog/Bloog, BIOS  09/19/2019
+# RIP: 0010:intel_pps_vdd_on_unlocked+0x351/0x360
+# Code: 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 19 98 03 00 48 c7 c1 10 d3 61 84 4c 89 f2 48 c7 c7 67 56 69 84 48 89 c6 e8 a0 22 63 ff 90 <0f> 0b 90 90 e9 5f fd ff ff e8 81 94 69 00 90 90 90 90 90 90 90 90
+# RSP: 0018:ffff9573c0dcfad8 EFLAGS: 00010286
+# RAX: 0000000000000000 RBX: ffff93498148e238 RCX: 00000000ffffdfff
+# RDX: 0000000000000000 RSI: ffff9573c0dcf988 RDI: 0000000000000001
+# RBP: ffff934980d80000 R08: 0000000000009ffb R09: 00000000ffffdfff
+# R10: 00000000ffffdfff R11: ffffffff8488c8a0 R12: ffff934980d80d68
+# R13: 0000000000000000 R14: ffff93498093c9b0 R15: 0000000000000000
+# FS:  00007fbf1f4486c0(0000) GS:ffff9349fbc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000055f260419028 CR3: 0000000106594000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  intel_pps_vdd_on+0x78/0x150
+#  intel_dp_detect+0xb9/0x7c0
+#  drm_helper_probe_detect+0x47/0xb0
+#  drm_helper_probe_single_connector_modes+0x40b/0x660
+#  drm_mode_getconnector+0x369/0x490
+#  drm_ioctl_kernel+0xad/0x110
+#  drm_ioctl+0x235/0x4b0
+#  __x64_sys_ioctl+0x8f/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7fbf208e4cdb
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffe061f6c60 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fbf208e4cdb
+# RDX: 00007ffe061f6d00 RSI: 00000000c05064a7 RDI: 0000000000000003
+# RBP: 00007ffe061f6d00 R08: 0000000000000007 R09: 000055f260410cb0
+# R10: 650094cf40322201 R11: 0000000000000246 R12: 00000000c05064a7
+# R13: 0000000000000003 R14: 00000000c05064a7 R15: 00007ffe061f6d00
+#  </TASK>
+# irq event stamp: 0
+# hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# hardirqs last disabled at (0): [<ffffffff82d0a283>] copy_process+0xaf3/0x2eb0
+# softirqs last  enabled at (0): [<ffffffff82d0a283>] copy_process+0xaf3/0x2eb0
+# softirqs last disabled at (0): [<0000000000000000>] 0x0
+# ---[ end trace 0000000000000000 ]---
+# i915 0000:00:02.0: [drm] *ERROR* PPS state mismatch
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* Failed to read DPCD register 0x92
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# [IGT] kms_async_flips: starting subtest test-time-stamp
+# i915 0000:00:02.0: [drm] *ERROR* [CRTC:70:pipe A] flip_done timed out
+# i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# i915 0000:00:02.0: [drm] *ERROR* [CRTC:70:pipe A] commit wait timed out
+# INFO: task kms_async_flips:1253 blocked for more than 122 seconds.
+#       Tainted: G        W          6.13.0-rc2-ge95c88d68ac3 #1
+# "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# task:kms_async_flips state:D stack:12720 pid:1253  tgid:1253  ppid:164    flags:0x00004006
+# Call Trace:
+#  <TASK>
+#  __schedule+0x495/0xd20
+#  schedule+0x35/0x120
+#  drm_vblank_work_flush+0x91/0xf0
+#  intel_wait_for_vblank_workers+0x58/0x90
+#  intel_atomic_commit_tail+0xa86/0x15f0
+#  intel_atomic_commit+0x257/0x2a0
+#  drm_atomic_commit+0xac/0xe0
+#  set_property_atomic+0x91/0x160
+#  drm_mode_obj_set_property_ioctl+0xc1/0x110
+#  drm_ioctl_kernel+0xad/0x110
+#  drm_ioctl+0x235/0x4b0
+#  __x64_sys_ioctl+0x8f/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7fbf208e4cdb
+# RSP: 002b:00007ffe061f6c50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 000055f24e272330 RCX: 00007fbf208e4cdb
+# RDX: 00007ffe061f6ce0 RSI: 00000000c01864ba RDI: 0000000000000003
+# RBP: 00007ffe061f6ce0 R08: 0000000000000000 R09: 000055f2604184f0
+# R10: 00007fbf209ca310 R11: 0000000000000246 R12: 00000000c01864ba
+# R13: 0000000000000003 R14: 0000000000000000 R15: 000055f26040ab90
+#  </TASK>
+# INFO: lockdep is turned off.
+
+kms_lease.*
+# [IGT] kms_lease: executing
+# ------------[ cut here ]------------
+# i915 0000:00:02.0: [drm] drm_WARN_ON(intel_dp->pps.vdd_wakeref)
+# WARNING: CPU: 1 PID: 1271 at drivers/gpu/drm/i915/display/intel_pps.c:760 intel_pps_vdd_on_unlocked+0x351/0x360
+# Modules linked in:
+# CPU: 1 UID: 0 PID: 1271 Comm: kms_lease Tainted: G        W          6.13.0-rc2-gfb6fd142a8eb #1
+# Tainted: [W]=WARN
+# Hardware name: HP Bloog/Bloog, BIOS  09/19/2019
+# RIP: 0010:intel_pps_vdd_on_unlocked+0x351/0x360
+# Code: 8b 77 50 4d 85 f6 75 03 4c 8b 37 e8 19 98 03 00 48 c7 c1 10 d3 61 a1 4c 89 f2 48 c7 c7 67 56 69 a1 48 89 c6 e8 a0 22 63 ff 90 <0f> 0b 90 90 e9 5f fd ff ff e8 81 94 69 00 90 90 90 90 90 90 90 90
+# RSP: 0018:ffffb26500ddfad8 EFLAGS: 00010286
+# RAX: 0000000000000000 RBX: ffff988580dc6238 RCX: 00000000ffffdfff
+# RDX: 0000000000000000 RSI: ffffb26500ddf988 RDI: 0000000000000001
+# RBP: ffff988580d90000 R08: 0000000000009ffb R09: 00000000ffffdfff
+# R10: 00000000ffffdfff R11: ffffffffa188c8a0 R12: ffff988580d90d68
+# R13: 0000000000000000 R14: ffff98858093c9b0 R15: 0000000000000000
+# FS:  00007f6b0c60d6c0(0000) GS:ffff9885fbd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000055eea27460a8 CR3: 0000000105ac6000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  intel_pps_vdd_on+0x78/0x150
+#  intel_dp_detect+0xb9/0x7c0
+#  drm_helper_probe_detect+0x47/0xb0
+#  drm_helper_probe_single_connector_modes+0x40b/0x660
+#  drm_mode_getconnector+0x369/0x490
+#  drm_ioctl_kernel+0xad/0x110
+#  drm_ioctl+0x235/0x4b0
+#  __x64_sys_ioctl+0x8f/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f6b0d637c5b
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffc42b13670 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f6b0d637c5b
+# RDX: 00007ffc42b13710 RSI: 00000000c05064a7 RDI: 0000000000000003
+# RBP: 00007ffc42b13710 R08: 0000000000000007 R09: 000055eea2741720
+# R10: 9fb9be4e118bfa43 R11: 0000000000000246 R12: 00000000c05064a7
+# R13: 0000000000000003 R14: 00000000c05064a7 R15: 00007ffc42b13710
+#  </TASK>
+# irq event stamp: 0
+# hardirqs last  enabled at (0): [<0000000000000000>] 0x0
+# hardirqs last disabled at (0): [<ffffffff9fd0a283>] copy_process+0xaf3/0x2eb0
+# softirqs last  enabled at (0): [<ffffffff9fd0a283>] copy_process+0xaf3/0x2eb0
+# softirqs last disabled at (0): [<0000000000000000>] 0x0
+# ---[ end trace 0000000000000000 ]---
+# i915 0000:00:02.0: [drm] *ERROR* PPS state mismatch
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* Failed to read DPCD register 0x92
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# i915 0000:00:02.0: [drm] *ERROR* AUX A/DDI A/PHY A: not done (status 0x00000000)
+# [IGT] kms_lease: starting subtest page-flip-implicit-plane
+# [IGT] kms_lease: starting dynamic subtest pipe-A-eDP-1
+# i915 0000:00:02.0: [drm] *ERROR* [CRTC:70:pipe A] flip_done timed out
+# i915 0000:00:02.0: [drm] *ERROR* flip_done timed out
+# i915 0000:00:02.0: [drm] *ERROR* [CRTC:70:pipe A] commit wait timed out
+# INFO: task kms_lease:1271 blocked for more than 122 seconds.
+#       Tainted: G        W          6.13.0-rc2-gfb6fd142a8eb #1
+# "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+# task:kms_lease       state:D stack:12720 pid:1271  tgid:1271  ppid:184    flags:0x00004006
+# Call Trace:
+#  <TASK>
+#  __schedule+0x495/0xd20
+#  schedule+0x35/0x120
+#  drm_vblank_work_flush+0x91/0xf0
+#  intel_wait_for_vblank_workers+0x58/0x90
+#  intel_atomic_commit_tail+0xa86/0x15f0
+#  intel_atomic_commit+0x257/0x2a0
+#  drm_atomic_commit+0xac/0xe0
+#  set_property_atomic+0x91/0x160
+#  drm_mode_obj_set_property_ioctl+0xc1/0x110
+#  drm_ioctl_kernel+0xad/0x110
+#  drm_ioctl+0x235/0x4b0
+#  __x64_sys_ioctl+0x8f/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f6b0d637c5b
+# RSP: 002b:00007ffc42b13650 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 00007ffc42b14270 RCX: 00007f6b0d637c5b
+# RDX: 00007ffc42b136e0 RSI: 00000000c01864ba RDI: 0000000000000003
+# RBP: 00007ffc42b136e0 R08: 0000000000000000 R09: 000055eea2741750
+# R10: 00007f6b0d71d310 R11: 0000000000000246 R12: 00000000c01864ba
+# R13: 0000000000000003 R14: 0000000000000000 R15: 000055eea27378d0
+#  </TASK>
+# INFO: lockdep is turned off.
+
+# The test alternates between failing and timing out on reruns, causing the pipeline to fail
+gen9_exec_parse@unaligned-access
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
index ed9f7b576843..0e08fff741aa 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-fails.txt
@@ -1,15 +1,16 @@
-core_setmaster@master-drop-set-user,Fail
+drm_fdinfo@busy-check-all,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-i915_pm_rpm@gem-execbuf-stress,Timeout
-i915_pm_rpm@module-reload,Fail
-kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@dpms-off-confusion,Fail
+kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset,Fail
+kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
+kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
@@ -17,6 +18,7 @@ kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
+kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
@@ -26,19 +28,15 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_frontbuffer_tracking@fbc-rgb565-draw-blt,Timeout
 kms_lease@lease-uevent,Fail
-kms_pm_rpm@legacy-planes,Timeout
-kms_pm_rpm@legacy-planes-dpms,Timeout
 kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
+kms_rotation_crc@bad-pixel-format,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
 perf@i915-ref-count,Fail
-perf_pmu@busy-accuracy-50,Fail
 perf_pmu@module-unload,Fail
-perf_pmu@most-busy-idle-check-all,Fail
 perf_pmu@rc6,Crash
 sysfs_heartbeat_interval@long,Timeout
 sysfs_heartbeat_interval@off,Timeout
diff --git a/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
index 5c3ef4486b9d..8b2aefd1cc52 100644
--- a/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-jsl-flakes.txt
@@ -1,13 +1,6 @@
 # Board Name: acer-cb317-1h-c3z6-dedede
-# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12475
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13349
 # Failure Rate: 100
-# IGT Version: 1.28-ga73311079
-# Linux Version: 6.12.0-rc1
-kms_flip@flip-vs-panning-interruptible
-
-# Board Name: acer-cb317-1h-c3z6-dedede
-# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12476
-# Failure Rate: 100
-# IGT Version: 1.28-ga73311079
-# Linux Version: 6.12.0-rc1
-kms_universal_plane@cursor-fb-leak
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_flip@flip-vs-fences-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index 6ec2f83ffe13..dc722d6a774e 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -37,3 +37,115 @@ tools_test.*
 # GPU hang
 sysfs_timeslice_.*
 sysfs_heartbeat_.*
+
+device_reset@unbind-reset-rebind
+# [IGT] device_reset: starting subtest unbind-reset-rebind
+# i915 0000:00:02.0: [drm] Found kabylake (device ID 5917) display version 9.00 stepping C0
+# i915 0000:00:02.0: vgaarb: deactivate vga console
+# i915 0000:00:02.0: [drm] *ERROR* DPLL0 not locked
+# ------------[ cut here ]------------
+# i915 0000:00:02.0: [drm] drm_WARN_ON((val & (1 << 30)) == 0)
+# WARNING: CPU: 4 PID: 472 at drivers/gpu/drm/i915/display/intel_cdclk.c:944 skl_get_cdclk+0x1ca/0x360
+# Modules linked in:
+# CPU: 4 UID: 0 PID: 472 Comm: device_reset Not tainted 6.13.0-rc2-ge95c88d68ac3 #1
+# Hardware name: HP Nami/Nami, BIOS  09/19/2019
+# RIP: 0010:skl_get_cdclk+0x1ca/0x360
+# Code: 67 50 4d 85 e4 0f 84 89 01 00 00 e8 e0 16 13 00 48 c7 c1 a0 71 5f 9a 4c 89 e2 48 c7 c7 67 56 69 9a 48 89 c6 e8 67 a1 72 ff 90 <0f> 0b 90 90 8b 43 08 8b 53 04 89 43 0c 89 03 85 d2 0f 85 26 ff ff
+# RSP: 0018:ffffacba40f5fbd0 EFLAGS: 00010282
+# RAX: 0000000000000000 RBX: ffff953182571058 RCX: 00000000ffffdfff
+# RDX: 0000000000000000 RSI: ffffacba40f5fa80 RDI: 0000000000000001
+# RBP: ffff953182570d68 R08: 0000000000009ffb R09: 00000000ffffdfff
+# R10: 00000000ffffdfff R11: ffffffff9a88c8a0 R12: ffff953180d3f4a0
+# R13: 0000000000000000 R14: ffff953182570d68 R15: 0000000000000000
+# FS:  00007f74989c46c0(0000) GS:ffff9534eed00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f1df530eff8 CR3: 0000000102302002 CR4: 00000000003706f0
+# DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
+# DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
+# Call Trace:
+#  <TASK>
+#  intel_update_cdclk+0x1c/0x90
+#  intel_cdclk_init_hw+0x46e/0x4c0
+#  intel_power_domains_init_hw+0x3eb/0x770
+#  intel_display_driver_probe_noirq+0x85/0x230
+#  i915_driver_probe+0x66d/0xc60
+#  local_pci_probe+0x3a/0x90
+#  pci_device_probe+0xb5/0x180
+#  really_probe+0xc9/0x2b0
+#  __driver_probe_device+0x6e/0x110
+#  device_driver_attach+0x42/0xa0
+#  bind_store+0x71/0xc0
+#  kernfs_fop_write_iter+0x121/0x1c0
+#  vfs_write+0x2a8/0x530
+#  ksys_write+0x6f/0xf0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f7499e662c0
+# Code: 40 00 48 8b 15 41 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d 21 23 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
+# RSP: 002b:00007ffffaf36a68 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
+# RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7499e662c0
+# RDX: 000000000000000c RSI: 00007ffffaf36b50 RDI: 0000000000000003
+# RBP: 000000000000000c R08: 0000000000000007 R09: 000055b37d0964a0
+# R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffffaf36b50
+# R13: 0000000000000003 R14: 000055b3526a7220 R15: 00007f749a0dc020
+#  </TASK>
+# irq event stamp: 28591
+# hardirqs last  enabled at (28625): [<ffffffff98da3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (28658): [<ffffffff98da3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (28688): [<ffffffff98d17980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (28701): [<ffffffff98d17bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# ------------[ cut here ]------------
+# i915 0000:00:02.0: [drm] drm_WARN_ON((val & (1 << 30)) == 0)
+# WARNING: CPU: 1 PID: 472 at drivers/gpu/drm/i915/display/intel_cdclk.c:944 skl_get_cdclk+0x1ca/0x360
+# Modules linked in:
+# CPU: 1 UID: 0 PID: 472 Comm: device_reset Tainted: G        W          6.13.0-rc2-ge95c88d68ac3 #1
+# Tainted: [W]=WARN
+# Hardware name: HP Nami/Nami, BIOS  09/19/2019
+# RIP: 0010:skl_get_cdclk+0x1ca/0x360
+# Code: 67 50 4d 85 e4 0f 84 89 01 00 00 e8 e0 16 13 00 48 c7 c1 a0 71 5f 9a 4c 89 e2 48 c7 c7 67 56 69 9a 48 89 c6 e8 67 a1 72 ff 90 <0f> 0b 90 90 8b 43 08 8b 53 04 89 43 0c 89 03 85 d2 0f 85 26 ff ff
+# RSP: 0018:ffffacba40f5fb98 EFLAGS: 00010286
+# RAX: 0000000000000000 RBX: ffffacba40f5fbbc RCX: 00000000ffffdfff
+# RDX: 0000000000000000 RSI: ffffacba40f5fa48 RDI: 0000000000000001
+# RBP: ffff953182570d68 R08: 0000000000009ffb R09: 00000000ffffdfff
+# R10: 00000000ffffdfff R11: ffffffff9a88c8a0 R12: ffff953180d3f4a0
+# R13: ffff953182573208 R14: ffff953182570d68 R15: 0000000000000000
+# FS:  00007f74989c46c0(0000) GS:ffff9534eec40000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f2b6598ee00 CR3: 0000000102302001 CR4: 00000000003706f0
+# DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
+# DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
+# Call Trace:
+#  <TASK>
+#  gen9_disable_dc_states+0x86/0x300
+#  intel_power_well_enable+0x56/0x70
+#  __intel_display_power_get_domain.part.0+0x4d/0x70
+#  intel_power_domains_init_hw+0x95/0x770
+#  intel_display_driver_probe_noirq+0x85/0x230
+#  i915_driver_probe+0x66d/0xc60
+#  local_pci_probe+0x3a/0x90
+#  pci_device_probe+0xb5/0x180
+#  really_probe+0xc9/0x2b0
+#  __driver_probe_device+0x6e/0x110
+#  device_driver_attach+0x42/0xa0
+#  bind_store+0x71/0xc0
+#  kernfs_fop_write_iter+0x121/0x1c0
+#  vfs_write+0x2a8/0x530
+#  ksys_write+0x6f/0xf0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f7499e662c0
+# Code: 40 00 48 8b 15 41 9b 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 80 3d 21 23 0e 00 00 74 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 48 83 ec 28 48 89
+# RSP: 002b:00007ffffaf36a68 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
+# RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7499e662c0
+# RDX: 000000000000000c RSI: 00007ffffaf36b50 RDI: 0000000000000003
+# RBP: 000000000000000c R08: 0000000000000007 R09: 000055b37d0964a0
+# R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffffaf36b50
+# R13: 0000000000000003 R14: 000055b3526a7220 R15: 00007f749a0dc020
+#  </TASK>
+# irq event stamp: 29605
+# hardirqs last  enabled at (29617): [<ffffffff98da3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (29634): [<ffffffff98da3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (29630): [<ffffffff98d17980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (29625): [<ffffffff98d17bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 461ef69ef08a..93d42b146df9 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,64 +1,24 @@
-api_intel_allocator@fork-simple-stress-signal,Timeout
-api_intel_allocator@open-vm,Timeout
-api_intel_allocator@simple-allocator,Timeout
-api_intel_bb@lot-of-buffers,Timeout
-api_intel_bb@object-reloc-keep-cache,Timeout
-api_intel_bb@offset-control,Timeout
-api_intel_bb@render-ccs,Timeout
-api_intel_bb@reset-bb,Timeout
-core_auth@basic-auth,Timeout
-core_hotunplug@hotrebind,Timeout
-core_setmaster@master-drop-set-user,Fail
-debugfs_test@read_all_entries_display_on,Timeout
-drm_read@empty-block,Timeout
-dumb_buffer@create-clear,Timeout
-dumb_buffer@invalid-bpp,Timeout
-gen3_render_tiledx_blits,Timeout
-gen7_exec_parse@basic-allocation,Timeout
-gen9_exec_parse@batch-invalid-length,Timeout
-gen9_exec_parse@bb-secure,Timeout
-gen9_exec_parse@secure-batches,Timeout
-gen9_exec_parse@shadow-peek,Timeout
-gen9_exec_parse@unaligned-jump,Timeout
-i915_getparams_basic@basic-subslice-total,Timeout
-i915_hangman@gt-engine-hang,Timeout
+api_intel_allocator@reopen,Timeout
+api_intel_bb@destroy-bb,Timeout
+core_hotunplug@hotrebind-lateclose,Timeout
+drm_read@short-buffer-block,Timeout
+dumb_buffer@map-valid,Timeout
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
 i915_module_load@resize-bar,Fail
-i915_pciid,Timeout
-i915_pipe_stress@stress-xrgb8888-ytiled,Timeout
-i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rps@engine-order,Timeout
-i915_pm_rps@thresholds-idle-park,Timeout
-i915_query@engine-info,Timeout
-i915_query@query-topology-kernel-writes,Timeout
-i915_query@test-query-geometry-subslices,Timeout
 kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
 perf@i915-ref-count,Fail
 perf_pmu@busy,Timeout
 perf_pmu@enable-race,Timeout
-perf_pmu@event-wait,Timeout
-perf_pmu@faulting-read,Timeout
-perf_pmu@gt-awake,Timeout
-perf_pmu@interrupts,Timeout
 perf_pmu@module-unload,Fail
-perf_pmu@most-busy-idle-check-all,Timeout
 perf_pmu@rc6,Crash
-perf_pmu@render-node-busy-idle,Fail
 perf_pmu@semaphore-wait-idle,Timeout
-prime_busy@after,Timeout
-prime_mmap@test_aperture_limit,Timeout
-prime_mmap@test_map_unmap,Timeout
 prime_mmap@test_refcounting,Timeout
-prime_self_import@basic-with_one_bo,Timeout
-sriov_basic@enable-vfs-autoprobe-off,Timeout
-syncobj_basic@bad-destroy,Timeout
-syncobj_basic@bad-flags-fd-to-handle,Timeout
-syncobj_basic@create-signaled,Timeout
-syncobj_eventfd@invalid-bad-pad,Timeout
-syncobj_eventfd@timeline-wait-before-signal,Timeout
+sriov_basic@enable-vfs-bind-unbind-each-numvfs-all,Timeout
+syncobj_basic@illegal-fd-to-handle,Timeout
 syncobj_wait@invalid-multi-wait-unsubmitted-signaled,Timeout
 syncobj_wait@invalid-signal-illegal-handle,Timeout
 syncobj_wait@invalid-single-wait-all-unsubmitted,Timeout
@@ -66,7 +26,6 @@ syncobj_wait@multi-wait-all-submitted,Timeout
 syncobj_wait@multi-wait-for-submit-submitted-signaled,Timeout
 syncobj_wait@wait-any-complex,Timeout
 syncobj_wait@wait-delayed-signal,Timeout
-template@A,Timeout
 xe_module_load@force-load,Fail
 xe_module_load@load,Fail
 xe_module_load@many-reload,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index b47df5855e8d..938377896841 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -35,3 +35,16 @@ syncobj_wait.*
 
 # Kernel panic and test hangs with multiple kms tests
 kms_.*
+
+# The test alternates between failing and timing out on reruns, causing the pipeline to fail
+api_intel_allocator@reopen
+api_intel_bb@destroy-bb
+core_hotunplug@hotrebind-lateclose
+dumb_buffer@map-valid
+i915_pm_rps@engine-order
+perf_pmu@busy
+perf_pmu@enable-race
+perf_pmu@semaphore-wait-idle
+prime_mmap@test_refcounting
+sriov_basic@enable-vfs-bind-unbind-each-numvfs-all
+syncobj_basic@illegal-fd-to-handle
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 0ce240e3aa07..1cb6978c86dc 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -1,5 +1,4 @@
 core_setmaster@master-drop-set-shared-fd,Fail
-core_setmaster@master-drop-set-user,Fail
 i915_module_load@load,Fail
 i915_module_load@reload,Fail
 i915_module_load@reload-no-display,Fail
@@ -7,12 +6,10 @@ i915_module_load@resize-bar,Fail
 i915_pm_rpm@gem-execbuf-stress,Timeout
 i915_pm_rpm@module-reload,Fail
 i915_pm_rpm@system-suspend-execbuf,Timeout
-i915_pm_rps@engine-order,Fail
-kms_big_fb@linear-16bpp-rotate-180,Timeout
-kms_cursor_legacy@short-flip-before-cursor-atomic-transitions,Timeout
+kms_async_flips@test-time-stamp,Timeout
+kms_ccs@crc-sprite-planes-basic-y-tiled-ccs,Timeout
 kms_dirtyfb@default-dirtyfb-ioctl,Fail
 kms_dirtyfb@fbc-dirtyfb-ioctl,Fail
-kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -34,18 +31,12 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
-kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt,Timeout
 kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Timeout
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5,Timeout
-kms_pm_rpm@modeset-stress-extra-wait,Timeout
-kms_pm_rpm@universal-planes,Timeout
-kms_pm_rpm@universal-planes-dpms,Timeout
-kms_rotation_crc@primary-rotation-180,Timeout
-kms_vblank@query-forked-hang,Timeout
 perf@i915-ref-count,Fail
 perf_pmu@module-unload,Fail
 perf_pmu@rc6,Crash
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
index 60b8d1c64e70..19a289617080 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
@@ -4,3 +4,10 @@
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 kms_pm_rpm@modeset-lpsp-stress
+
+# Board Name: dell-latitude-5400-8665U-sarien
+# Bug Report: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13351
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+gen9_exec_parse@unaligned-access
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index 8e0efc80d510..4f176c04ec4e 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,8 +1,5 @@
-fbdev@eof,Fail
-fbdev@read,Fail
 kms_3d,Fail
 kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@connected-linear-tiling-2-displays-1920x1080p,Fail
@@ -22,6 +19,6 @@ kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_lease@lease-uevent,Fail
-kms_rmfb@close-fd,Fail
+kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
+kms_lease@lease-uevent,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
index 2e5bf6ae25f2..2956567c3048 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -39,3 +39,10 @@ kms_cursor_legacy@cursor-vs-flip-atomic-transitions
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 kms_prop_blob@invalid-set-prop
+
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/dri-devel/c0b4cded-0971-4abb-9965-2acf4602d7cd@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_bw@connected-linear-tiling-1-displays-2160x1440p
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
index 8198e06344a3..d0db51874aef 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -15,3 +15,8 @@ tools_test.*
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 845f852bb4a0..5a063361d7f2 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,16 +1,12 @@
-core_setmaster@master-drop-set-shared-fd,Fail
+core_setmaster@master-drop-set-user,Fail
 dumb_buffer@create-clear,Crash
-fbdev@eof,Fail
-fbdev@pan,Fail
-fbdev@read,Fail
-fbdev@unaligned-read,Fail
 kms_bw@connected-linear-tiling-1-displays-1920x1080p,Fail
-kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@connected-linear-tiling-1-displays-2560x1440p,Fail
+kms_bw@connected-linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
-kms_color@invalid-gamma-lut-sizes,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_lease@lease-uevent,Fail
-kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index 8198e06344a3..d0db51874aef 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -15,3 +15,8 @@ tools_test.*
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index 066d24ee3e08..7752adff05c1 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,4 +1,7 @@
 kms_3d,Fail
+kms_cursor_legacy@forked-bo,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@torture-bo,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 6dbc2080347d..e4a8f8352cd6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -15,4 +15,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
index d74e04405e65..8910afb6acf2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
@@ -18,3 +18,17 @@ msm/msm_shrink@copy-gpu-oom-32
 # IGT Version: 1.28-g0df7b9b97
 # Linux Version: 6.9.0-rc7
 msm/msm_shrink@copy-gpu-oom-8
+
+# Board Name: sc7180-trogdor-kingoftown
+# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/68
+# Failure Rate: 40
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_lease@page-flip-implicit-plane
+
+# Board Name: sc7180-trogdor-kingoftown
+# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/69
+# Failure Rate: 20
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_plane@plane-position-hole-dpms
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index c2833eee1c4b..478d7c161616 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -23,3 +23,8 @@ kms_flip@2x-wf_vblank-ts-check
 
 # Hangs the machine
 kms_cursor_crc@cursor-random-max-size
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 6dbc2080347d..e4a8f8352cd6 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -15,4 +15,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index 7c69c1f1d55b..ef9318afcd89 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -17,3 +17,8 @@ tools_test.*
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index fa8c7e663858..7a2ab58b706f 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -1,4 +1,3 @@
-drm_read@invalid-buffer,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -28,4 +27,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_plane_cursor@overlay,Fail
 kms_plane_cursor@viewport,Fail
-kms_rmfb@close-fd,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index 94783cafc21a..2ce7f7e23a01 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -30,3 +30,8 @@ kms_cursor_crc.*
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc2
 kms_content_protection@uevent
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
index 4892c0c70a6d..8d26b23133aa 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
@@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
 kms_cursor_legacy@torture-move,Fail
 kms_hdmi_inject@inject-4k,Fail
 kms_lease@lease-uevent,Fail
-kms_plane_alpha_blend@alpha-7efc,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
 msm/msm_recovery@gpu-fault-parallel,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 90282dfa19f4..ba9160d4d8eb 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -1,24 +1,10 @@
+core_setmaster@master-drop-set-root,Crash
+core_setmaster@master-drop-set-shared-fd,Crash
 core_setmaster@master-drop-set-user,Crash
+core_setmaster_vs_auth,Crash
 dumb_buffer@create-clear,Crash
 fbdev@pan,Crash
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_cursor_crc@cursor-onscreen-32x10,Crash
-kms_cursor_crc@cursor-onscreen-32x32,Crash
-kms_cursor_crc@cursor-onscreen-64x64,Crash
-kms_cursor_crc@cursor-random-32x10,Crash
-kms_cursor_crc@cursor-sliding-32x10,Crash
-kms_cursor_crc@cursor-sliding-32x32,Crash
-kms_cursor_crc@cursor-sliding-64x21,Crash
-kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
-kms_cursor_legacy@cursor-vs-flip-legacy,Fail
-kms_cursor_legacy@flip-vs-cursor-crc-atomic,Crash
-kms_flip@flip-vs-panning-vs-hang,Crash
-kms_invalid_mode@int-max-clock,Crash
-kms_lease@invalid-create-leases,Fail
-kms_pipe_crc_basic@read-crc-frame-sequence,Crash
-kms_plane@pixel-format,Crash
-kms_plane@pixel-format-source-clamping,Crash
+kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
+kms_flip@flip-vs-modeset-vs-hang,Crash
 kms_prop_blob@invalid-set-prop,Crash
-kms_properties@get_properties-sanity-atomic,Crash
-kms_properties@get_properties-sanity-non-atomic,Crash
-kms_rmfb@close-fd,Crash
+kms_prop_blob@invalid-set-prop-any,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index 83a38853b4af..2803d0d80192 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -2,6 +2,7 @@ dumb_buffer@create-clear,Crash
 kms_atomic_transition@modeset-transition,Fail
 kms_atomic_transition@modeset-transition-fencing,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
+kms_bw@connected-linear-tiling-1-displays-2160x1440p,Fail
 kms_color@gamma,Fail
 kms_color@legacy-gamma,Fail
 kms_cursor_crc@cursor-alpha-opaque,Fail
@@ -24,6 +25,7 @@ kms_cursor_crc@cursor-rapid-movement-32x32,Fail
 kms_cursor_crc@cursor-rapid-movement-64x21,Fail
 kms_cursor_crc@cursor-rapid-movement-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-size-hints,Fail
 kms_cursor_crc@cursor-sliding-32x10,Fail
 kms_cursor_crc@cursor-sliding-32x32,Fail
 kms_cursor_crc@cursor-sliding-64x21,Fail
@@ -32,6 +34,7 @@ kms_cursor_edge_walk@64x64-left-edge,Fail
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@flip-vs-cursor-atomic,Fail
@@ -41,14 +44,11 @@ kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
 kms_flip@blocking-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-blocking-wf-vblank,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning,Fail
 kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@modeset-vs-vblank-race,Fail
-kms_flip@modeset-vs-vblank-race-interruptible,Fail
 kms_flip@plain-flip-fb-recreate,Fail
 kms_flip@plain-flip-fb-recreate-interruptible,Fail
 kms_flip@plain-flip-ts-check,Fail
@@ -64,14 +64,11 @@ kms_pipe_crc_basic@nonblocking-crc,Fail
 kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
 kms_pipe_crc_basic@read-crc,Fail
 kms_pipe_crc_basic@read-crc-frame-sequence,Fail
-kms_plane@pixel-format,Crash
-kms_plane@pixel-format-source-clamping,Crash
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
 kms_plane@plane-panning-bottom-right,Fail
 kms_plane@plane-panning-top-left,Fail
 kms_plane@plane-position-covered,Fail
 kms_plane@plane-position-hole,Fail
-kms_plane@plane-position-hole-dpms,Fail
 kms_plane_cursor@primary,Fail
-kms_plane_multiple@tiling-none,Fail
-kms_rmfb@close-fd,Fail
 kms_universal_plane@universal-plane-functional,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index 56f7d4f1ed15..348b4ce7eb4b 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -74,3 +74,59 @@ kms_bw@linear-tiling-2-displays-2160x1440p
 # IGT Version: 1.28-ga73311079
 # Linux Version: 6.11.0-rc5
 kms_flip@flip-vs-expired-vblank
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/f944dd08-c88c-49ae-aff0-274374550a93@collabora.com/T/#u
+# Failure Rate: 40
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_bw@linear-tiling-1-displays-2160x1440p
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/afa2d3bf-29f2-488d-8cc9-f30d461444b0@collabora.com/T/#u
+# Failure Rate: 80
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_plane_multiple@tiling-none
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/6fdaa97f-c1a5-4216-831f-dbb7c5f90498@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_bw@linear-tiling-1-displays-1920x1080p
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/616aa015-9574-4527-9d07-d8d698bbcc3c@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_plane@plane-position-hole-dpms
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/7a1b888f-d7db-4ed7-96cd-3975ace837fb@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_flip@flip-vs-absolute-wf_vblank
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/f17fffb6-abc4-464e-8465-395311b01f6a@collabora.com/T/#u
+# Failure Rate: 100
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_flip@flip-vs-blocking-wf-vblank
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/9b590b26-1bf9-4951-b6a3-ef6c67e6a1c6@collabora.com/T/#u
+# Failure Rate: 60
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_bw@linear-tiling-2-displays-1920x1080p
+
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/dri-devel/059545fa-65b1-4f5c-a13e-4d2898679f51@collabora.com/T/#u
+# Failure Rate: 20
+# IGT Version: 1.29-g33adea9eb
+# Linux Version: 6.13.0-rc2
+kms_flip@modeset-vs-vblank-race-interruptible
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index eb16b29dee48..e8e994d92557 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -18,3 +18,8 @@ tools_test.*
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 9c9e048725f8..adbcdd0f28d2 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -23,3 +23,8 @@ tools_test.*
 # Currently fails and causes coverage loss for other tests
 # since core_getversion also fails.
 core_hotunplug.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
index 71c02104a683..85647eca4e55 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
@@ -1,12 +1,5 @@
-kms_cursor_crc@cursor-rapid-movement-128x128,Fail
-kms_cursor_crc@cursor-rapid-movement-128x42,Fail
-kms_cursor_crc@cursor-rapid-movement-256x256,Fail
 kms_cursor_crc@cursor-rapid-movement-256x85,Fail
 kms_cursor_crc@cursor-rapid-movement-32x10,Fail
-kms_cursor_crc@cursor-rapid-movement-32x32,Fail
-kms_cursor_crc@cursor-rapid-movement-512x170,Fail
-kms_cursor_crc@cursor-rapid-movement-512x512,Fail
-kms_cursor_crc@cursor-rapid-movement-64x21,Fail
 kms_cursor_crc@cursor-rapid-movement-64x64,Fail
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
@@ -21,7 +14,6 @@ kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_lease@lease-uevent,Fail
-kms_pipe_crc_basic@nonblocking-crc,Fail
 kms_writeback@writeback-check-output,Fail
 kms_writeback@writeback-check-output-XRGB2101010,Fail
 kms_writeback@writeback-fb-id,Fail
diff --git a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
index b3d16e82e9a2..319789806271 100644
--- a/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
@@ -1,8 +1,9 @@
 # keeps printing vkms_vblank_simulate: vblank timer overrun and never ends
 kms_invalid_mode@int-max-clock
 
-# Kernel panic
-kms_cursor_crc@cursor-rapid-movement-32x10
+# kernel panic seen with kms_cursor_crc tests
+kms_cursor_crc.*
+# kms_cursor_crc@cursor-rapid-movement-32x10
 # Oops: 0000 [#1] PREEMPT SMP NOPTI
 # CPU: 0 PID: 2635 Comm: kworker/u8:13 Not tainted 6.9.0-rc7-g40935263a1fd #1
 # Hardware name: ChromiumOS crosvm, BIOS 0
@@ -52,7 +53,7 @@ kms_cursor_crc@cursor-rapid-movement-32x10
 # FS:  0000000000000000(0000) GS:ffffa2ad2bc00000(0000) knlGS:0000000000000000
 # CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 
-kms_cursor_crc@cursor-rapid-movement-256x85
+#kms_cursor_crc@cursor-rapid-movement-256x85
 # [drm:drm_crtc_add_crc_entry] *ERROR* Overflow of CRC buffer, userspace reads too slow.
 # Oops: 0000 [#1] PREEMPT SMP NOPTI
 # CPU: 1 PID: 10 Comm: kworker/u8:0 Not tainted 6.9.0-rc7-g646381cde463 #1
@@ -104,7 +105,7 @@ kms_cursor_crc@cursor-rapid-movement-256x85
 # CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 # CR2: 0000000000000078 CR3: 0000000109b38000 CR4: 0000000000350ef0
 
-kms_cursor_crc@cursor-onscreen-256x256
+#kms_cursor_crc@cursor-onscreen-256x256
 # Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
 # CPU: 1 PID: 1913 Comm: kworker/u8:6 Not tainted 6.10.0-rc5-g8a28e73ebead #1
 # Hardware name: ChromiumOS crosvm, BIOS 0
@@ -258,6 +259,535 @@ kms_cursor_edge_walk@128x128-left-edge
 # CR2: 0000000000000018 CR3: 0000000101710000 CR4: 0000000000350ef0
 # vkms_vblank_simulate: vblank timer overrun
 
+# DEBUG - Begin test kms_cursor_crc@cursor-rapid-movement-64x64
+# ------------[ cut here ]------------
+# WARNING: CPU: 1 PID: 1250 at drivers/gpu/drm/vkms/vkms_crtc.c:139 vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Modules linked in: vkms
+# CPU: 1 UID: 0 PID: 1250 Comm: kms_cursor_crc Not tainted 6.13.0-rc2-ge95c88d68ac3 #1
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# RIP: 0010:vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Code: f7 48 89 f3 e8 d0 bf ee ec 48 8b 83 50 01 00 00 a8 01 75 15 48 8b bb a0 01 00 00 e8 59 05 95 ec 48 89 df 5b e9 50 05 95 ec 90 <0f> 0b 90 eb e5 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
+# RSP: 0018:ffff9fb640aafb08 EFLAGS: 00010202
+# RAX: ffff8e7240859e05 RBX: ffff8e7241cd6400 RCX: ffffffffae496b65
+# RDX: ffffffffad2d1f80 RSI: 0000000000000000 RDI: 0000000000000000
+# RBP: 0000000000000000 R08: 0000000000000034 R09: 0000000000000002
+# R10: 0000000047dd15a5 R11: 00000000547dd15a R12: ffff8e72590cc000
+# R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
+# FS:  00007f0942ad56c0(0000) GS:ffff8e726bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f0942ad0008 CR3: 0000000118d1e000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __warn+0x8c/0x190
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? report_bug+0x164/0x190
+#  ? handle_bug+0x54/0x90
+#  ? exc_invalid_op+0x17/0x70
+#  ? asm_exc_invalid_op+0x1a/0x20
+#  ? __pfx_drm_property_free_blob+0x10/0x10
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? vkms_atomic_crtc_destroy_state+0x10/0x40 [vkms]
+#  drm_atomic_state_default_clear+0x137/0x2f0
+#  __drm_atomic_state_free+0x6c/0xb0
+#  drm_atomic_helper_update_plane+0x100/0x150
+#  drm_mode_cursor_universal+0x10e/0x270
+#  drm_mode_cursor_common+0x115/0x240
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  drm_mode_cursor_ioctl+0x4a/0x70
+#  drm_ioctl_kernel+0xb0/0x110
+#  drm_ioctl+0x235/0x4b0
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  __x64_sys_ioctl+0x92/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f0943a84cdb
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007fff267d68d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 000000000000005a RCX: 00007f0943a84cdb
+# RDX: 00007fff267d6960 RSI: 00000000c01c64a3 RDI: 0000000000000005
+# RBP: 00007fff267d6960 R08: 0000000000000007 R09: 00005619a60f3450
+# R10: fe95a83851609dee R11: 0000000000000246 R12: 00000000c01c64a3
+# R13: 0000000000000005 R14: 00005619a3cd2c68 R15: 00005619a608c830
+#  </TASK>
+# irq event stamp: 57793
+# hardirqs last  enabled at (57799): [<ffffffffacba3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (57804): [<ffffffffacba3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (45586): [<ffffffffacb17980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (45569): [<ffffffffacb17bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
+# CPU: 0 UID: 0 PID: 119 Comm: kworker/u8:6 Tainted: G        W          6.13.0-rc2-ge95c88d68ac3 #1
+# Tainted: [W]=WARN
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# Workqueue: vkms_composer vkms_composer_worker [vkms]
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffff9fb640efbd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff8e7241926000 RSI: ffff8e7241927ffc RDI: 000000000b7fb767
+# RBP: ffff9fb640efbde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff8e7241b09a80 R11: 0000000000000000 R12: ffff8e7241cd6200
+# R13: 0000000000000013 R14: 0000000000000000 R15: ffff8e7241b09a80
+# FS:  0000000000000000(0000) GS:ffff8e726bc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000118d1e000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __die+0x1e/0x60
+#  ? page_fault_oops+0x17b/0x4a0
+#  ? srso_return_thunk+0x5/0x5f
+#  ? exc_page_fault+0x6d/0x230
+#  ? asm_exc_page_fault+0x26/0x30
+#  ? compose_active_planes+0x1a3/0x760 [vkms]
+#  vkms_composer_worker+0x205/0x240 [vkms]
+#  process_one_work+0x201/0x6c0
+#  ? lock_is_held_type+0x9e/0x110
+#  worker_thread+0x17e/0x320
+#  ? __pfx_worker_thread+0x10/0x10
+#  kthread+0xce/0x100
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork+0x2f/0x50
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork_asm+0x1a/0x30
+#  </TASK>
+# Modules linked in: vkms
+# CR2: 000000000000001c
+# ---[ end trace 0000000000000000 ]---
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffff9fb640efbd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff8e7241926000 RSI: ffff8e7241927ffc RDI: 000000000b7fb767
+# RBP: ffff9fb640efbde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff8e7241b09a80 R11: 0000000000000000 R12: ffff8e7241cd6200
+# R13: 0000000000000013 R14: 0000000000000000 R15: ffff8e7241b09a80
+# FS:  0000000000000000(0000) GS:ffff8e726bc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000118d1e000 CR4: 0000000000350ef0
+
+# DEBUG - Begin test kms_cursor_crc@cursor-rapid-movement-128x42
+# ------------[ cut here ]------------
+# WARNING: CPU: 0 PID: 2933 at drivers/gpu/drm/vkms/vkms_crtc.c:139 vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Modules linked in: vkms
+# CPU: 0 UID: 0 PID: 2933 Comm: kms_cursor_crc Not tainted 6.13.0-rc2-g5219242748c8 #1
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# RIP: 0010:vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Code: f7 48 89 f3 e8 d0 bf 6e d0 48 8b 83 50 01 00 00 a8 01 75 15 48 8b bb a0 01 00 00 e8 59 05 15 d0 48 89 df 5b e9 50 05 15 d0 90 <0f> 0b 90 eb e5 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
+# RSP: 0018:ffffa14cc08b3b08 EFLAGS: 00010202
+# RAX: ffff9b864084b605 RBX: ffff9b8641ba4600 RCX: ffffffff91c96b65
+# RDX: ffffffff90ad1f80 RSI: 0000000000000000 RDI: 0000000000000000
+# RBP: 0000000000000000 R08: 0000000000000034 R09: 0000000000000002
+# R10: 0000000047dd15a5 R11: 00000000547dd15a R12: ffff9b864099c000
+# R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
+# FS:  00007f4f437ab6c0(0000) GS:ffff9b866bc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f4f44c3cd40 CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __warn+0x8c/0x190
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? report_bug+0x164/0x190
+#  ? handle_bug+0x54/0x90
+#  ? exc_invalid_op+0x17/0x70
+#  ? asm_exc_invalid_op+0x1a/0x20
+#  ? __pfx_drm_property_free_blob+0x10/0x10
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? vkms_atomic_crtc_destroy_state+0x10/0x40 [vkms]
+#  drm_atomic_state_default_clear+0x137/0x2f0
+#  __drm_atomic_state_free+0x6c/0xb0
+#  drm_atomic_helper_update_plane+0x100/0x150
+#  drm_mode_cursor_universal+0x10e/0x270
+#  drm_mode_cursor_common+0x115/0x240
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  drm_mode_cursor_ioctl+0x4a/0x70
+#  drm_ioctl_kernel+0xb0/0x110
+#  drm_ioctl+0x235/0x4b0
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  __x64_sys_ioctl+0x92/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f4f44960c5b
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffcdfb0b560 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 0000000000000060 RCX: 00007f4f44960c5b
+# RDX: 00007ffcdfb0b5f0 RSI: 00000000c01c64a3 RDI: 0000000000000005
+# RBP: 00007ffcdfb0b5f0 R08: 0000000000000007 R09: 000055c3a5801a30
+# R10: 3107764f00e1f281 R11: 0000000000000246 R12: 00000000c01c64a3
+# R13: 0000000000000005 R14: 000055c38b7e42c8 R15: 000055c3a579aab0
+#  </TASK>
+# irq event stamp: 58747
+# hardirqs last  enabled at (58753): [<ffffffff903a3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (58758): [<ffffffff903a3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (47324): [<ffffffff90317980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (47307): [<ffffffff90317bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
+# CPU: 1 UID: 0 PID: 11 Comm: kworker/u8:0 Tainted: G        W          6.13.0-rc2-g5219242748c8 #1
+# Tainted: [W]=WARN
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# Workqueue: vkms_composer vkms_composer_worker [vkms]
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __die+0x1e/0x60
+#  ? page_fault_oops+0x17b/0x4a0
+#  ? __kvmalloc_node_noprof+0x3e/0xc0
+#  ? exc_page_fault+0x6d/0x230
+#  ? asm_exc_page_fault+0x26/0x30
+#  ? compose_active_planes+0x1a3/0x760 [vkms]
+#  vkms_composer_worker+0x205/0x240 [vkms]
+#  process_one_work+0x201/0x6c0
+#  ? lock_is_held_type+0x9e/0x110
+#  worker_thread+0x17e/0x320
+#  ? __pfx_worker_thread+0x10/0x10
+#  kthread+0xce/0x100
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork+0x2f/0x50
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork_asm+0x1a/0x30
+#  </TASK>
+# Modules linked in: vkms
+# CR2: 000000000000001c
+# ---[ end trace 0000000000000000 ]---
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+
+# DEBUG - Begin test kms_cursor_crc@cursor-rapid-movement-32x32
+# ------------[ cut here ]------------
+# WARNING: CPU: 0 PID: 2933 at drivers/gpu/drm/vkms/vkms_crtc.c:139 vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Modules linked in: vkms
+# CPU: 0 UID: 0 PID: 2933 Comm: kms_cursor_crc Not tainted 6.13.0-rc2-g5219242748c8 #1
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# RIP: 0010:vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Code: f7 48 89 f3 e8 d0 bf 6e d0 48 8b 83 50 01 00 00 a8 01 75 15 48 8b bb a0 01 00 00 e8 59 05 15 d0 48 89 df 5b e9 50 05 15 d0 90 <0f> 0b 90 eb e5 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
+# RSP: 0018:ffffa14cc08b3b08 EFLAGS: 00010202
+# RAX: ffff9b864084b605 RBX: ffff9b8641ba4600 RCX: ffffffff91c96b65
+# RDX: ffffffff90ad1f80 RSI: 0000000000000000 RDI: 0000000000000000
+# RBP: 0000000000000000 R08: 0000000000000034 R09: 0000000000000002
+# R10: 0000000047dd15a5 R11: 00000000547dd15a R12: ffff9b864099c000
+# R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
+# FS:  00007f4f437ab6c0(0000) GS:ffff9b866bc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f4f44c3cd40 CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __warn+0x8c/0x190
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? report_bug+0x164/0x190
+#  ? handle_bug+0x54/0x90
+#  ? exc_invalid_op+0x17/0x70
+#  ? asm_exc_invalid_op+0x1a/0x20
+#  ? __pfx_drm_property_free_blob+0x10/0x10
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? vkms_atomic_crtc_destroy_state+0x10/0x40 [vkms]
+#  drm_atomic_state_default_clear+0x137/0x2f0
+#  __drm_atomic_state_free+0x6c/0xb0
+#  drm_atomic_helper_update_plane+0x100/0x150
+#  drm_mode_cursor_universal+0x10e/0x270
+#  drm_mode_cursor_common+0x115/0x240
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  drm_mode_cursor_ioctl+0x4a/0x70
+#  drm_ioctl_kernel+0xb0/0x110
+#  drm_ioctl+0x235/0x4b0
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  __x64_sys_ioctl+0x92/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f4f44960c5b
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffcdfb0b560 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 0000000000000060 RCX: 00007f4f44960c5b
+# RDX: 00007ffcdfb0b5f0 RSI: 00000000c01c64a3 RDI: 0000000000000005
+# RBP: 00007ffcdfb0b5f0 R08: 0000000000000007 R09: 000055c3a5801a30
+# R10: 3107764f00e1f281 R11: 0000000000000246 R12: 00000000c01c64a3
+# R13: 0000000000000005 R14: 000055c38b7e42c8 R15: 000055c3a579aab0
+#  </TASK>
+# irq event stamp: 58747
+# hardirqs last  enabled at (58753): [<ffffffff903a3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (58758): [<ffffffff903a3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (47324): [<ffffffff90317980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (47307): [<ffffffff90317bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
+# CPU: 1 UID: 0 PID: 11 Comm: kworker/u8:0 Tainted: G        W          6.13.0-rc2-g5219242748c8 #1
+# Tainted: [W]=WARN
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# Workqueue: vkms_composer vkms_composer_worker [vkms]
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __die+0x1e/0x60
+#  ? page_fault_oops+0x17b/0x4a0
+#  ? __kvmalloc_node_noprof+0x3e/0xc0
+#  ? exc_page_fault+0x6d/0x230
+#  ? asm_exc_page_fault+0x26/0x30
+#  ? compose_active_planes+0x1a3/0x760 [vkms]
+#  vkms_composer_worker+0x205/0x240 [vkms]
+#  process_one_work+0x201/0x6c0
+#  ? lock_is_held_type+0x9e/0x110
+#  worker_thread+0x17e/0x320
+#  ? __pfx_worker_thread+0x10/0x10
+#  kthread+0xce/0x100
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork+0x2f/0x50
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork_asm+0x1a/0x30
+#  </TASK>
+# Modules linked in: vkms
+# CR2: 000000000000001c
+# ---[ end trace 0000000000000000 ]---
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+
+# DEBUG - Begin test kms_cursor_crc@cursor-rapid-movement-32x32
+# ------------[ cut here ]------------
+# WARNING: CPU: 0 PID: 2933 at drivers/gpu/drm/vkms/vkms_crtc.c:139 vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Modules linked in: vkms
+# CPU: 0 UID: 0 PID: 2933 Comm: kms_cursor_crc Not tainted 6.13.0-rc2-g5219242748c8 #1
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# RIP: 0010:vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Code: f7 48 89 f3 e8 d0 bf 6e d0 48 8b 83 50 01 00 00 a8 01 75 15 48 8b bb a0 01 00 00 e8 59 05 15 d0 48 89 df 5b e9 50 05 15 d0 90 <0f> 0b 90 eb e5 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
+# RSP: 0018:ffffa14cc08b3b08 EFLAGS: 00010202
+# RAX: ffff9b864084b605 RBX: ffff9b8641ba4600 RCX: ffffffff91c96b65
+# RDX: ffffffff90ad1f80 RSI: 0000000000000000 RDI: 0000000000000000
+# RBP: 0000000000000000 R08: 0000000000000034 R09: 0000000000000002
+# R10: 0000000047dd15a5 R11: 00000000547dd15a R12: ffff9b864099c000
+# R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
+# FS:  00007f4f437ab6c0(0000) GS:ffff9b866bc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 00007f4f44c3cd40 CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __warn+0x8c/0x190
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? report_bug+0x164/0x190
+#  ? handle_bug+0x54/0x90
+#  ? exc_invalid_op+0x17/0x70
+#  ? asm_exc_invalid_op+0x1a/0x20
+#  ? __pfx_drm_property_free_blob+0x10/0x10
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? vkms_atomic_crtc_destroy_state+0x10/0x40 [vkms]
+#  drm_atomic_state_default_clear+0x137/0x2f0
+#  __drm_atomic_state_free+0x6c/0xb0
+#  drm_atomic_helper_update_plane+0x100/0x150
+#  drm_mode_cursor_universal+0x10e/0x270
+#  drm_mode_cursor_common+0x115/0x240
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  drm_mode_cursor_ioctl+0x4a/0x70
+#  drm_ioctl_kernel+0xb0/0x110
+#  drm_ioctl+0x235/0x4b0
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  __x64_sys_ioctl+0x92/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f4f44960c5b
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffcdfb0b560 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 0000000000000060 RCX: 00007f4f44960c5b
+# RDX: 00007ffcdfb0b5f0 RSI: 00000000c01c64a3 RDI: 0000000000000005
+# RBP: 00007ffcdfb0b5f0 R08: 0000000000000007 R09: 000055c3a5801a30
+# R10: 3107764f00e1f281 R11: 0000000000000246 R12: 00000000c01c64a3
+# R13: 0000000000000005 R14: 000055c38b7e42c8 R15: 000055c3a579aab0
+#  </TASK>
+# irq event stamp: 58747
+# hardirqs last  enabled at (58753): [<ffffffff903a3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (58758): [<ffffffff903a3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (47324): [<ffffffff90317980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (47307): [<ffffffff90317bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
+# CPU: 1 UID: 0 PID: 11 Comm: kworker/u8:0 Tainted: G        W          6.13.0-rc2-g5219242748c8 #1
+# Tainted: [W]=WARN
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# Workqueue: vkms_composer vkms_composer_worker [vkms]
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __die+0x1e/0x60
+#  ? page_fault_oops+0x17b/0x4a0
+#  ? __kvmalloc_node_noprof+0x3e/0xc0
+#  ? exc_page_fault+0x6d/0x230
+#  ? asm_exc_page_fault+0x26/0x30
+#  ? compose_active_planes+0x1a3/0x760 [vkms]
+#  vkms_composer_worker+0x205/0x240 [vkms]
+#  process_one_work+0x201/0x6c0
+#  ? lock_is_held_type+0x9e/0x110
+#  worker_thread+0x17e/0x320
+#  ? __pfx_worker_thread+0x10/0x10
+#  kthread+0xce/0x100
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork+0x2f/0x50
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork_asm+0x1a/0x30
+#  </TASK>
+# Modules linked in: vkms
+# CR2: 000000000000001c
+# ---[ end trace 0000000000000000 ]---
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa14cc005fd20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff9b8669626000 RSI: ffff9b8669627ffc RDI: 00000000348d6c39
+# RBP: ffffa14cc005fde0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff9b8645650eb0 R11: 0000000000000000 R12: ffff9b8641ba5800
+# R13: 0000000000000028 R14: 0000000000000000 R15: ffff9b8645650eb0
+# FS:  0000000000000000(0000) GS:ffff9b866bd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000108c14000 CR4: 0000000000350ef0
+
+# DEBUG - Begin test kms_cursor_crc@cursor-rapid-movement-128x128
+# ------------[ cut here ]------------
+# WARNING: CPU: 0 PID: 2898 at drivers/gpu/drm/vkms/vkms_crtc.c:139 vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Modules linked in: vkms
+# CPU: 0 UID: 0 PID: 2898 Comm: kms_cursor_crc Not tainted 6.13.0-rc2-g1f006005ebf8 #1
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# RIP: 0010:vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+# Code: f7 48 89 f3 e8 d0 bf 6e e1 48 8b 83 50 01 00 00 a8 01 75 15 48 8b bb a0 01 00 00 e8 59 05 15 e1 48 89 df 5b e9 50 05 15 e1 90 <0f> 0b 90 eb e5 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90
+# RSP: 0018:ffffa35c4082fb08 EFLAGS: 00010202
+# RAX: ffff8b02c1c0f005 RBX: ffff8b02d4509600 RCX: ffffffffa2c96b65
+# RDX: ffffffffa1ad1f80 RSI: 0000000000000000 RDI: 0000000000000000
+# RBP: 0000000000000000 R08: 0000000000000034 R09: 0000000000000002
+# R10: 0000000030f11ddf R11: 00000000f30f11dd R12: ffff8b02d2528000
+# R13: 0000000000000000 R14: 00000000ffffffff R15: 0000000000000000
+# FS:  00007f4b071ab6c0(0000) GS:ffff8b02efc00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000055f7f8384b48 CR3: 0000000104ef0000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __warn+0x8c/0x190
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? report_bug+0x164/0x190
+#  ? handle_bug+0x54/0x90
+#  ? exc_invalid_op+0x17/0x70
+#  ? asm_exc_invalid_op+0x1a/0x20
+#  ? __pfx_drm_property_free_blob+0x10/0x10
+#  ? vkms_atomic_crtc_destroy_state+0x31/0x40 [vkms]
+#  ? vkms_atomic_crtc_destroy_state+0x10/0x40 [vkms]
+#  drm_atomic_state_default_clear+0x137/0x2f0
+#  __drm_atomic_state_free+0x6c/0xb0
+#  drm_atomic_helper_update_plane+0x100/0x150
+#  drm_mode_cursor_universal+0x10e/0x270
+#  drm_mode_cursor_common+0x115/0x240
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  drm_mode_cursor_ioctl+0x4a/0x70
+#  drm_ioctl_kernel+0xb0/0x110
+#  drm_ioctl+0x235/0x4b0
+#  ? __pfx_drm_mode_cursor_ioctl+0x10/0x10
+#  __x64_sys_ioctl+0x92/0xc0
+#  do_syscall_64+0xbb/0x1d0
+#  entry_SYSCALL_64_after_hwframe+0x77/0x7f
+# RIP: 0033:0x7f4b0815ac5b
+# Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
+# RSP: 002b:00007ffd726f75e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
+# RAX: ffffffffffffffda RBX: 000000000000005d RCX: 00007f4b0815ac5b
+# RDX: 00007ffd726f7670 RSI: 00000000c01c64a3 RDI: 0000000000000005
+# RBP: 00007ffd726f7670 R08: 0000000000000007 R09: 000055f7f83e30c0
+# R10: 2b16893c03bd381a R11: 0000000000000246 R12: 00000000c01c64a3
+# R13: 0000000000000005 R14: 000055f7dbee72c8 R15: 000055f7f837bab0
+#  </TASK>
+# irq event stamp: 58921
+# hardirqs last  enabled at (58927): [<ffffffffa13a3e4d>] __up_console_sem+0x4d/0x60
+# hardirqs last disabled at (58932): [<ffffffffa13a3e32>] __up_console_sem+0x32/0x60
+# softirqs last  enabled at (46140): [<ffffffffa1317980>] handle_softirqs+0x310/0x3f0
+# softirqs last disabled at (46135): [<ffffffffa1317bc1>] __irq_exit_rcu+0xa1/0xc0
+# ---[ end trace 0000000000000000 ]---
+# Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
+# CPU: 1 UID: 0 PID: 1657 Comm: kworker/u8:14 Tainted: G        W          6.13.0-rc2-g1f006005ebf8 #1
+# Tainted: [W]=WARN
+# Hardware name: ChromiumOS crosvm, BIOS 0
+# Workqueue: vkms_composer vkms_composer_worker [vkms]
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa35c40c43d20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff8b02c52c8000 RSI: ffff8b02c52c9ffc RDI: 00000000fa4761c9
+# RBP: ffffa35c40c43de0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff8b02c1c87840 R11: 0000000000000000 R12: ffff8b02d4508800
+# R13: 0000000000000021 R14: 0000000000000000 R15: ffff8b02c1c87840
+# FS:  0000000000000000(0000) GS:ffff8b02efd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+# CR2: 000000000000001c CR3: 0000000104ef0000 CR4: 0000000000350ef0
+# Call Trace:
+#  <TASK>
+#  ? __die+0x1e/0x60
+#  ? page_fault_oops+0x17b/0x4a0
+#  ? srso_return_thunk+0x5/0x5f
+#  ? exc_page_fault+0x6d/0x230
+#  ? asm_exc_page_fault+0x26/0x30
+#  ? compose_active_planes+0x1a3/0x760 [vkms]
+#  vkms_composer_worker+0x205/0x240 [vkms]
+#  process_one_work+0x201/0x6c0
+#  ? lock_is_held_type+0x9e/0x110
+#  worker_thread+0x17e/0x320
+#  ? __pfx_worker_thread+0x10/0x10
+#  kthread+0xce/0x100
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork+0x2f/0x50
+#  ? __pfx_kthread+0x10/0x10
+#  ret_from_fork_asm+0x1a/0x30
+#  </TASK>
+# Modules linked in: vkms
+# CR2: 000000000000001c
+# ---[ end trace 0000000000000000 ]---
+# RIP: 0010:compose_active_planes+0x1a3/0x760 [vkms]
+# Code: db 4d 89 fa 85 c9 0f 84 32 03 00 00 4d 8b 24 da 48 c7 44 24 60 00 00 00 00 48 c7 44 24 68 00 00 00 00 49 8b 84 24 48 01 00 00 <8b> 50 1c 44 39 ea 0f 8f f3 02 00 00 44 39 68 24 0f 8e e9 02 00 00
+# RSP: 0018:ffffa35c40c43d20 EFLAGS: 00010202
+# RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
+# RDX: ffff8b02c52c8000 RSI: ffff8b02c52c9ffc RDI: 00000000fa4761c9
+# RBP: ffffa35c40c43de0 R08: 0000000000000000 R09: 0000000000000000
+# R10: ffff8b02c1c87840 R11: 0000000000000000 R12: ffff8b02d4508800
+# R13: 0000000000000021 R14: 0000000000000000 R15: ffff8b02c1c87840
+# FS:  0000000000000000(0000) GS:ffff8b02efd00000(0000) knlGS:0000000000000000
+# CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+
 # Skip driver specific tests
 ^amdgpu.*
 ^msm.*
@@ -272,3 +802,8 @@ gem_.*
 i915_.*
 xe_.*
 tools_test.*
+
+# IGT issue. is_joiner_mode() should return false for non-Intel hardware.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/162
+kms_display_modes@extended-mode-basic
+kms_display_modes@mst-extended-mode-negative
-- 
2.43.0

