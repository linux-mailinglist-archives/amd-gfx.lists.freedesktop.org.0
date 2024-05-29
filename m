Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA5A8D2B06
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2024 04:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F0F112EB4;
	Wed, 29 May 2024 02:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="uxEEiFtM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25378112EAF;
 Wed, 29 May 2024 02:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716950526;
 bh=ENlYddWdu2YJxpqsSgGjiJ6VUB7kjNlU/paCz87mB4o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uxEEiFtMaMWaTpm2nMRIG2AoQgAiVklhfX0sckdvqCukuUcTP5zT7RMqk+IU3JAfy
 T94ON08NSWcoV89QsVjQnMzKxF0xZl05Zh3D3nTHKHY08TiUMg8KjT2L69bpGGUj1e
 M1UmITs/g2tqPtPNZ7xbUi9ARcHJ8U5vb5z9LFfPZNUMcR7eWKm8n5XguedMNxUiYs
 57v8rpAdgQdbKaI2ZAFvvl7sVipoEd/33Oey9+Tps2LPf0iY3Y9VPOQ/YsOIKtPuU8
 YpAzTeo3DNMiJgNMov9TTNG8bPGf8OEpnJhHb/WgB/jyRz5X9WLTdCbGqYe++OwU2L
 fty1LpQm2c9pQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A83683782162;
 Wed, 29 May 2024 02:42:01 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] drm/ci: update xfails for the new testlist
Date: Wed, 29 May 2024 08:10:49 +0530
Message-Id: <20240529024049.356327-7-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529024049.356327-1-vignesh.raman@collabora.com>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
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

Now the testlist is used from IGT build, so update
xfails with the new testlist.

Set the timeout of all i915 jobs to 1h30m since some jobs
takes more than 1 hour to complete.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Set the timeout of all i915 jobs to 1h30m and updated expectations file.

v3:
  - Add a link to the email reporting the flaky tests to the maintainers.

---
 drivers/gpu/drm/ci/test.yml                   |   6 +-
 .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  41 ++--
 .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |   7 +
 .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  18 ++
 drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  31 ++++
 .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |   9 +
 drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  11 ++
 drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  |  46 +++--
 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |  15 ++
 drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  38 ++++
 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |  14 ++
 drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  41 +++-
 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   7 +
 drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |  15 ++
 drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |  42 ++---
 drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   7 +-
 drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |  25 +++
 drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  77 ++++----
 drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |  17 ++
 drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  63 ++++---
 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   6 +
 drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |  11 ++
 .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  30 ++-
 .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  11 ++
 .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   4 +
 .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +--
 .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   4 +
 .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |  24 +--
 .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   4 +
 .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  12 +-
 .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   4 +
 .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |   7 +
 .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   6 +
 .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |  12 ++
 .../msm-sc7180-trogdor-kingoftown-fails.txt   | 175 +++++++++++++++++-
 .../msm-sc7180-trogdor-kingoftown-flakes.txt  |   8 +
 .../msm-sc7180-trogdor-kingoftown-skips.txt   |   7 +
 ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 175 +++++++++++++++++-
 ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |   6 +
 ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   4 +
 .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  38 +---
 .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   |  25 ++-
 .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   7 +
 .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  62 +------
 .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   4 +
 .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  83 +--------
 .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  13 +-
 .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   4 +
 drivers/gpu/drm/ci/xfails/update-xfails.py    |   4 +-
 .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  94 +++++++---
 .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   4 +
 53 files changed, 1023 insertions(+), 388 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
 create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 2615f67f6aa3..322cce714657 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -191,6 +191,7 @@ rockchip:rk3399:
   extends:
     - .lava-igt:x86_64
   stage: i915
+  timeout: "1h30m"
   variables:
     DRIVER_NAME: i915
     DTB: ""
@@ -201,7 +202,6 @@ i915:apl:
   extends:
     - .i915
   parallel: 3
-  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C523NA-A20057-coral
     GPU_VERSION: apl
@@ -211,7 +211,6 @@ i915:glk:
   extends:
     - .i915
   parallel: 2
-  timeout: "1h30m"
   variables:
     DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
     GPU_VERSION: glk
@@ -221,7 +220,6 @@ i915:amly:
   extends:
     - .i915
   parallel: 2
-  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -240,7 +238,6 @@ i915:whl:
   extends:
     - .i915
   parallel: 2
-  timeout: "1h30m"
   variables:
     DEVICE_TYPE: dell-latitude-5400-8665U-sarien
     GPU_VERSION: whl
@@ -250,7 +247,6 @@ i915:cml:
   extends:
     - .i915
   parallel: 2
-  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
index ea87dc46bc2b..e8c2f4044a92 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-fails.txt
@@ -1,27 +1,40 @@
+amdgpu/amd_abm@abm_enabled,Fail
+amdgpu/amd_abm@abm_gradual,Fail
+amdgpu/amd_abm@backlight_monotonic_abm,Fail
+amdgpu/amd_abm@backlight_monotonic_basic,Fail
+amdgpu/amd_assr@assr-links,Fail
+amdgpu/amd_assr@assr-links-dpms,Fail
+amdgpu/amd_mall@static-screen,Crash
+amdgpu/amd_mode_switch@mode-switch-first-last-pipe-2,Crash
+amdgpu/amd_plane@mpo-pan-nv12,Fail
+amdgpu/amd_plane@mpo-pan-p010,Fail
+amdgpu/amd_plane@mpo-pan-rgb,Crash
+amdgpu/amd_plane@mpo-scale-nv12,Fail
+amdgpu/amd_plane@mpo-scale-p010,Fail
+amdgpu/amd_plane@mpo-scale-rgb,Crash
+amdgpu/amd_plane@mpo-swizzle-toggle,Fail
+amdgpu/amd_uvd_dec@amdgpu_uvd_decode,Fail
+dumb_buffer@invalid-bpp,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@too-high,Fail
-kms_async_flips@async-flip-with-page-flip-events,Fail
-kms_async_flips@crc,Fail
-kms_async_flips@invalid-async-flip,Fail
 kms_atomic_transition@plane-all-modeset-transition-internal-panels,Fail
 kms_atomic_transition@plane-all-transition,Fail
 kms_atomic_transition@plane-all-transition-nonblocking,Fail
 kms_atomic_transition@plane-toggle-modeset-transition,Fail
 kms_atomic_transition@plane-use-after-nonblocking-unbind,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-1-displays-3840x2160p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_color@degamma,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
 kms_cursor_crc@cursor-size-change,Fail
-kms_cursor_crc@pipe-A-cursor-size-change,Fail
-kms_cursor_crc@pipe-B-cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
-kms_hdr@bpc-switch,Fail
-kms_hdr@bpc-switch-dpms,Fail
+kms_lease@lease-uevent,Fail
 kms_plane@pixel-format,Fail
-kms_plane_multiple@atomic-pipe-A-tiling-none,Fail
-kms_rmfb@close-fd,Fail
+kms_plane_cursor@primary,Fail
 kms_rotation_crc@primary-rotation-180,Fail
+perf@i915-ref-count,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
index 6faf75e667d3..ea512ff8c352 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-flakes.txt
@@ -1 +1,8 @@
+# Board Name: hp-11A-G6-EE-grunt
+# Bug Report: https://lore.kernel.org/amd-gfx/3542730f-b8d7-404d-a947-b7a5e95d661c@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
 kms_async_flips@async-flip-with-page-flip-events
+kms_async_flips@crc
+kms_plane@pixel-format-source-clamping
diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
index 21d26d5e67c2..3a2ce45d3cb9 100644
--- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
@@ -13,3 +13,21 @@ panfrost_.*
 gem_.*
 i915_.*
 xe_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+amdgpu/amd_module_load@reload
+core_hotunplug.*
+
+# GPU reset seen and it hangs the machine
+amdgpu/amd_deadlock@amdgpu-deadlock-sdma
+amdgpu/amd_deadlock@amdgpu-gfx-illegal-reg-access
+amdgpu/amd_dispatch@amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE
+
+# Hangs the machine and timeout occurs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_simple
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_cs
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_bo
+amdgpu/amd_pci_unplug@amdgpu_hotunplug_with_exported_fence
+amdgpu/amd_vrr_range@freesync-parsing
+device_reset.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
index 59438e4df86e..6641520ac587 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-fails.txt
@@ -1,3 +1,16 @@
+core_setmaster@master-drop-set-user,Fail
+core_setmaster_vs_auth,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
+kms_async_flips@invalid-async-flip,Timeout
+kms_atomic_transition@modeset-transition-fencing,Timeout
+kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
+kms_fb_coherency@memset-crc,Crash
+kms_flip@flip-vs-dpms-off-vs-modeset,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -20,7 +33,25 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
+kms_pm_rpm@modeset-lpsp-stress,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
new file mode 100644
index 000000000000..0a76547a103d
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
@@ -0,0 +1,9 @@
+# Board Name: asus-C433TA-AJ0005-rammus
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+i915_hangman@engine-engine-error
+i915_hangman@gt-engine-hang
+kms_async_flips@crc
+kms_universal_plane@cursor-fb-leak
diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
index 1e80987cf584..5663ed0420a7 100644
--- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
@@ -11,3 +11,14 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+kms_scaling_modes.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
index 2e3b7c5dac3c..e612281149aa 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-fails.txt
@@ -1,13 +1,7 @@
-kms_3d,Timeout
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -30,18 +24,30 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_pm_backlight@basic-brightness,Fail
+kms_pm_backlight@fade,Fail
+kms_pm_backlight@fade-with-dpms,Fail
+kms_pm_rpm@legacy-planes,Timeout
+kms_pm_rpm@legacy-planes-dpms,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
 kms_sysfs_edid_timing,Fail
+perf@i915-ref-count,Fail
+perf@non-zero-reason,Timeout
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
new file mode 100644
index 000000000000..cb010c153a6a
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: asus-C523NA-A20057-coral
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+kms_fb_coherency@memset-crc
diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
index 0104f2ffa8ba..ab588e7a447c 100644
--- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
@@ -13,3 +13,18 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+i915_pm_rpm.*
+device_reset.*
+api_intel_allocator.*
+kms_frontbuffer_tracking.*
+kms_ccs.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
index 240ef8467c26..26cd62bbf30a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-fails.txt
@@ -1,3 +1,19 @@
+core_setmaster@master-drop-set-user,Fail
+core_setmaster_vs_auth,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pipe_stress@stress-xrgb8888-untiled,Fail
+i915_pipe_stress@stress-xrgb8888-ytiled,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
+i915_pm_rpm@system-suspend-execbuf,Timeout
+kms_async_flips@invalid-async-flip,Timeout
+kms_atomic_transition@modeset-transition-fencing,Timeout
+kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
+kms_fb_coherency@memset-crc,Crash
+kms_flip@flip-vs-dpms-off-vs-modeset,Timeout
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -20,11 +36,33 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
 kms_plane_alpha_blend@constant-alpha-min,Fail
+kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+kms_psr2_sf@fbc-plane-move-sf-dmg-area,Timeout
+kms_psr2_sf@overlay-plane-update-continuous-sf,Fail
+kms_psr2_sf@overlay-plane-update-sf-dmg-area,Fail
+kms_psr2_sf@primary-plane-update-sf-dmg-area,Fail
+kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb,Fail
 kms_psr2_su@page_flip-NV12,Fail
 kms_psr2_su@page_flip-P010,Fail
+kms_psr@psr-sprite-render,Timeout
 kms_setmode@basic,Fail
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+perf_pmu@rc6-suspend,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
new file mode 100644
index 000000000000..bb560ff1e2cd
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: asus-C436FA-Flip-hatch
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+kms_plane_alpha_blend@constant-alpha-min
diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
index 398ebe163ad0..93b7736fffbb 100644
--- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
@@ -9,3 +9,17 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+xe_module_load.*
+api_intel_allocator.*
+kms_cursor_legacy.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_frontbuffer_tracking.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
index 4596055d7e5e..fca15b487929 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-fails.txt
@@ -1,5 +1,20 @@
-kms_fbcon_fbt@fbc,Fail
-kms_flip@blocking-wf_vblank,Fail
+core_setmaster@master-drop-set-user,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+kms_async_flips@invalid-async-flip,Timeout
+kms_atomic_transition@modeset-transition-fencing,Timeout
+kms_big_fb@linear-16bpp-rotate-0,Fail
+kms_big_fb@linear-16bpp-rotate-180,Fail
+kms_big_fb@linear-32bpp-rotate-0,Fail
+kms_big_fb@linear-32bpp-rotate-180,Fail
+kms_big_fb@linear-8bpp-rotate-0,Fail
+kms_big_fb@linear-8bpp-rotate-180,Fail
+kms_big_fb@linear-max-hw-stride-32bpp-rotate-0,Fail
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_draw_crc@draw-method-render,Fail
+kms_flip@flip-vs-dpms-off-vs-modeset,Timeout
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
@@ -11,7 +26,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
@@ -26,11 +40,24 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
 kms_frontbuffer_tracking@fbcdrrs-tiling-linear,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
-kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
+kms_pm_rpm@legacy-planes,Timeout
+kms_pm_rpm@legacy-planes-dpms,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
 kms_rotation_crc@multiplane-rotation,Fail
 kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
 kms_rotation_crc@multiplane-rotation-cropping-top,Fail
-kms_setmode@basic,Fail
+perf@non-zero-reason,Timeout
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
new file mode 100644
index 000000000000..58fc424f8a42
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt
@@ -0,0 +1,7 @@
+# Board Name: hp-x360-12b-ca0010nr-n4020-octopus
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+core_hotunplug@unplug-rescan
+kms_fb_coherency@memset-crc
diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
index 4f5419d62170..b3226b2d9ba1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
@@ -12,3 +12,18 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+i915_pm_rpm.*
+kms_ccs.*
+kms_plane_multiple.*
+perf.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_plane_alpha_blend.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
index dab202716909..d4fba4f55ec1 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt
@@ -1,32 +1,28 @@
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_plane_alpha_blend@alpha-basic,Fail
-kms_plane_alpha_blend@alpha-opaque-fb,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
-kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+perf@i915-ref-count,Fail
+perf_pmu@busy-accuracy-50,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
index a12f888530dd..6cf1fed2e575 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt
@@ -1 +1,6 @@
-kms_async_flips@crc
+# Board Name: hp-x360-14-G1-sona
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+prime_busy@hang
diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
index 4f5419d62170..f0cf8a6dda25 100644
--- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
@@ -12,3 +12,28 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_.*
+api_intel_bb.*
+
+# Kernel panic
+drm_fdinfo.*
+kms_.*
+prime_mmap_coherency.*
+perf.*
+drm_read.*
+api_intel_allocator.*
+sysfs_preempt_timeout.*
+dumb_buffer.*
+gen9_exec_parse.*
+debugfs_test.*
+core_hotunplug.*
+tools_test.*
+
+# GPU hang
+sysfs_timeslice_.*
+sysfs_heartbeat_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
index 27bfca1c6f2c..9a50e894c3e7 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt
@@ -1,36 +1,43 @@
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_bw@linear-tiling-5-displays-1920x1080p,Fail
-kms_bw@linear-tiling-5-displays-2560x1440p,Fail
-kms_bw@linear-tiling-5-displays-3840x2160p,Fail
-kms_flip@flip-vs-panning-vs-hang,Timeout
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
-kms_rotation_crc@bad-pixel-format,Fail
+api_intel_bb@blit-noreloc-keep-cache,Timeout
+api_intel_bb@offset-control,Timeout
+api_intel_bb@render-ccs,Timeout
+core_getclient,Timeout
+core_hotunplug@hotreplug-lateclose,Timeout
+drm_read@short-buffer-block,Timeout
+drm_read@short-buffer-nonblock,Timeout
+dumb_buffer@map-uaf,Timeout
+gen3_render_tiledx_blits,Timeout
+gen7_exec_parse@basic-allocation,Timeout
+gen7_exec_parse@batch-without-end,Timeout
+gen9_exec_parse@batch-invalid-length,Timeout
+gen9_exec_parse@bb-secure,Timeout
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pciid,Timeout
+i915_query@engine-info,Timeout
+kms_lease@lease-uevent,Fail
 kms_rotation_crc@multiplane-rotation,Fail
-kms_rotation_crc@multiplane-rotation-cropping-bottom,Fail
-kms_rotation_crc@multiplane-rotation-cropping-top,Fail
+perf@i915-ref-count,Fail
+perf_pmu@busy,Timeout
+perf_pmu@enable-race,Timeout
+perf_pmu@event-wait,Timeout
+perf_pmu@gt-awake,Timeout
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+prime_mmap@test_map_unmap,Timeout
+prime_self_import@basic-with_one_bo,Timeout
+syncobj_basic@bad-destroy,Timeout
+syncobj_eventfd@invalid-bad-pad,Timeout
+syncobj_wait@invalid-multi-wait-unsubmitted-signaled,Timeout
+syncobj_wait@invalid-signal-illegal-handle,Timeout
+syncobj_wait@invalid-single-wait-all-unsubmitted,Timeout
+syncobj_wait@multi-wait-all-submitted,Timeout
+syncobj_wait@multi-wait-for-submit-submitted-signaled,Timeout
+syncobj_wait@wait-any-complex,Timeout
+syncobj_wait@wait-delayed-signal,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
index b0372c239b93..e600782ef96a 100644
--- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
@@ -18,3 +18,20 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Kernel panic
+drm_fdinfo.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+sysfs_heartbeat_interval.*
+syncobj_timeline.*
+sysfs_timeslice_duration.*
+syncobj_wait.*
+
+# Kernel panic and test hangs with multiple kms tests
+kms_.*
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
index 967327ddc1ac..7582d313dd9b 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-fails.txt
@@ -1,14 +1,25 @@
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_bw@linear-tiling-4-displays-1920x1080p,Fail
-kms_bw@linear-tiling-4-displays-2560x1440p,Fail
-kms_bw@linear-tiling-4-displays-3840x2160p,Fail
-kms_fbcon_fbt@fbc,Fail
-kms_fbcon_fbt@fbc-suspend,Fail
+core_setmaster@master-drop-set-user,Fail
+core_setmaster_vs_auth,Fail
+i915_module_load@load,Fail
+i915_module_load@reload,Fail
+i915_module_load@reload-no-display,Fail
+i915_module_load@resize-bar,Fail
+i915_pm_rpm@gem-execbuf-stress,Timeout
+i915_pm_rpm@module-reload,Fail
+i915_pm_rpm@system-suspend-execbuf,Timeout
+kms_async_flips@invalid-async-flip,Timeout
+kms_atomic_transition@modeset-transition-fencing,Timeout
+kms_big_fb@linear-16bpp-rotate-0,Fail
+kms_big_fb@linear-16bpp-rotate-180,Fail
+kms_big_fb@linear-32bpp-rotate-0,Fail
+kms_big_fb@linear-32bpp-rotate-180,Fail
+kms_big_fb@linear-8bpp-rotate-0,Fail
+kms_big_fb@linear-8bpp-rotate-180,Fail
+kms_big_fb@linear-max-hw-stride-32bpp-rotate-0,Fail
+kms_ccs@crc-primary-rotation-180-yf-tiled-ccs,Timeout
+kms_dirtyfb@default-dirtyfb-ioctl,Fail
+kms_draw_crc@draw-method-render,Fail
+kms_fb_coherency@memset-crc,Crash
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling,Fail
@@ -18,8 +29,6 @@ kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling,Fail
@@ -31,18 +40,26 @@ kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling,Fail
 kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling,Fail
-kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling,Fail
 kms_frontbuffer_tracking@fbc-tiling-linear,Fail
+kms_lease@lease-uevent,Fail
 kms_plane_alpha_blend@alpha-basic,Fail
 kms_plane_alpha_blend@alpha-opaque-fb,Fail
 kms_plane_alpha_blend@alpha-transparent-fb,Fail
 kms_plane_alpha_blend@constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-A-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-A-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-A-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-B-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-B-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-B-constant-alpha-max,Fail
-kms_plane_alpha_blend@pipe-C-alpha-opaque-fb,Fail
-kms_plane_alpha_blend@pipe-C-alpha-transparent-fb,Fail
-kms_plane_alpha_blend@pipe-C-constant-alpha-max,Fail
+kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation,Timeout
+kms_pm_rpm@modeset-stress-extra-wait,Timeout
+kms_pm_rpm@universal-planes,Timeout
+kms_pm_rpm@universal-planes-dpms,Timeout
+perf@i915-ref-count,Fail
+perf_pmu@module-unload,Fail
+perf_pmu@rc6,Crash
+perf_pmu@rc6-suspend,Crash
+sysfs_heartbeat_interval@long,Timeout
+sysfs_heartbeat_interval@off,Timeout
+sysfs_preempt_timeout@off,Timeout
+sysfs_timeslice_duration@off,Timeout
+xe_module_load@force-load,Fail
+xe_module_load@load,Fail
+xe_module_load@many-reload,Fail
+xe_module_load@reload,Fail
+xe_module_load@reload-no-display,Fail
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
new file mode 100644
index 000000000000..1167a58c7dd1
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: dell-latitude-5400-8665U-sarien
+# Bug Report: https://lore.kernel.org/intel-gfx/af4ca4df-a3ef-4943-bdbf-4c3af2c333af@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+kms_pm_rpm@modeset-lpsp-stress
diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
index 398ebe163ad0..20bd91525f45 100644
--- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
@@ -9,3 +9,14 @@ panfrost_.*
 ^v3d.*
 ^vc4.*
 ^vmwgfx*
+
+# GEM tests takes ~1000 hours, so skip it
+gem_.*
+
+# Hangs the machine and timeout occurs
+i915_pm_rc6_residency.*
+i915_suspend.*
+kms_flip.*
+
+# Kernel panic
+drm_fdinfo.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
index ef0cb7c3698c..cc5e9c1c2d57 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
@@ -1,36 +1,30 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
+fbdev@eof,Fail
+fbdev@read,Fail
+fbdev@unaligned-write,Fail
 kms_3d,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_color@invalid-gamma-lut-sizes,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_color@pipe-B-invalid-gamma-lut-sizes,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
 kms_cursor_legacy@cursor-vs-flip-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
 kms_flip@flip-vs-suspend,Fail
 kms_flip@flip-vs-suspend-interruptible,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_force_connector_basic@force-load-detect,Fail
-kms_force_connector_basic@prune-stale-modes,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
+kms_lease@lease-uevent,Fail
 kms_properties@get_properties-sanity-atomic,Fail
 kms_properties@plane-properties-atomic,Fail
 kms_properties@plane-properties-legacy,Fail
 kms_rmfb@close-fd,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
new file mode 100644
index 000000000000..395ac0463404
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
@@ -0,0 +1,11 @@
+# Board Name: mt8173-elm-hana
+# Bug Report: https://lore.kernel.org/linux-mediatek/0b2a1899-15dd-42fa-8f63-ea0ca28dbb17@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+core_setmaster_vs_auth
+dumb_buffer@create-clear
+fbdev@unaligned-write
+fbdev@write
+kms_cursor_legacy@cursor-vs-flip-atomic-transitions
+kms_prop_blob@invalid-set-prop
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
index db0c9dbbeb61..0c6108392140 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
@@ -10,3 +10,7 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
index 67d690fc4037..9ef460646d76 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
@@ -1,13 +1,8 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
-kms_bw@linear-tiling-1-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_color@pipe-A-invalid-gamma-lut-sizes,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_rmfb@close-fd,Fail
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
index 7a1c8be89e5b..715b9a8f4997 100644
--- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
@@ -12,3 +12,7 @@ i915_.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
index 56a2ae7047b4..9ef460646d76 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
@@ -1,16 +1,8 @@
-kms_3d,Fail
-kms_cursor_legacy@forked-bo,Fail
-kms_cursor_legacy@forked-move,Fail
-kms_cursor_legacy@single-bo,Fail
-kms_cursor_legacy@single-move,Fail
-kms_cursor_legacy@torture-bo,Fail
-kms_cursor_legacy@torture-move,Fail
-kms_force_connector_basic@force-edid,Fail
-kms_hdmi_inject@inject-4k,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_properties@connector-properties-atomic,Fail
-kms_properties@connector-properties-legacy,Fail
-kms_properties@get_properties-sanity-atomic,Fail
-kms_properties@get_properties-sanity-non-atomic,Fail
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
index 7a1c8be89e5b..715b9a8f4997 100644
--- a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
@@ -12,3 +12,7 @@ i915_.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
index b14d4e884971..3dfbabdf905e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
@@ -1,8 +1,16 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_cursor_legacy@forked-move,Fail
+kms_cursor_legacy@single-bo,Fail
 kms_cursor_legacy@torture-bo,Fail
+kms_cursor_legacy@torture-move,Fail
 kms_force_connector_basic@force-edid,Fail
 kms_hdmi_inject@inject-4k,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
+kms_lease@lease-uevent,Fail
 msm_mapping@ring,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
index 7fea49ec6b8f..ff12202abb6e 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
@@ -9,3 +9,7 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
index 88a1fc0a3b0d..23a5f6f9097f 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
@@ -1,2 +1,9 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
 kms_3d,Fail
 kms_addfb_basic@addfb25-bad-modifier,Fail
+kms_lease@lease-uevent,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
new file mode 100644
index 000000000000..a275584c8bbb
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: apq8096-db820c
+# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+dumb_buffer@create-clear
diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
index 9ab2177df1ab..1c45fc6c512d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
@@ -12,3 +12,15 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
+
+# gpu fault
+# [IGT] msm_mapping: executing
+# [IGT] msm_mapping: starting subtest shadow
+# *** gpu fault: ttbr0=00000001030ea000 iova=0000000001074000 dir=WRITE type=PERMISSION source=1f030000 (0,0,0,0)
+# msm_mdp 901000.display-controller: RBBM | ME master split | status=0x701000B0
+# watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [kworker/u16:3:46]
+msm_mapping@shadow
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index f0576aa629e8..eb7a3886d397 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -1,18 +1,191 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
+kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
 kms_color@ctm-blue-to-red,Fail
 kms_color@ctm-green-to-red,Fail
+kms_color@ctm-max,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_content_protection@atomic,Crash
+kms_content_protection@atomic-dpms,Crash
+kms_content_protection@content-type-change,Crash
+kms_content_protection@lic-type-0,Crash
+kms_content_protection@lic-type-1,Crash
+kms_content_protection@srm,Crash
+kms_content_protection@type1,Crash
+kms_content_protection@uevent,Crash
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-128x128,Fail
+kms_cursor_crc@cursor-offscreen-128x42,Fail
+kms_cursor_crc@cursor-offscreen-256x256,Fail
+kms_cursor_crc@cursor-offscreen-256x85,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-512x170,Fail
+kms_cursor_crc@cursor-offscreen-512x512,Fail
+kms_cursor_crc@cursor-offscreen-64x21,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-128x128,Fail
+kms_cursor_crc@cursor-onscreen-128x42,Fail
+kms_cursor_crc@cursor-onscreen-256x256,Fail
+kms_cursor_crc@cursor-onscreen-256x85,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-512x170,Fail
+kms_cursor_crc@cursor-onscreen-512x512,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-128x128,Fail
+kms_cursor_crc@cursor-random-128x42,Fail
+kms_cursor_crc@cursor-random-256x256,Fail
+kms_cursor_crc@cursor-random-256x85,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-512x170,Fail
+kms_cursor_crc@cursor-random-512x512,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-128x128,Fail
+kms_cursor_crc@cursor-rapid-movement-128x42,Fail
+kms_cursor_crc@cursor-rapid-movement-256x256,Fail
+kms_cursor_crc@cursor-rapid-movement-256x85,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-512x170,Fail
+kms_cursor_crc@cursor-rapid-movement-512x512,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-128x128,Fail
+kms_cursor_crc@cursor-sliding-128x42,Fail
+kms_cursor_crc@cursor-sliding-256x256,Fail
+kms_cursor_crc@cursor-sliding-256x85,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-512x170,Fail
+kms_cursor_crc@cursor-sliding-512x512,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_edge_walk@128x128-left-edge,Fail
+kms_cursor_edge_walk@128x128-right-edge,Fail
+kms_cursor_edge_walk@128x128-top-bottom,Fail
+kms_cursor_edge_walk@128x128-top-edge,Fail
+kms_cursor_edge_walk@256x256-left-edge,Fail
+kms_cursor_edge_walk@256x256-right-edge,Fail
+kms_cursor_edge_walk@256x256-top-bottom,Fail
+kms_cursor_edge_walk@256x256-top-edge,Fail
+kms_cursor_edge_walk@64x64-left-edge,Fail
+kms_cursor_edge_walk@64x64-right-edge,Fail
+kms_cursor_edge_walk@64x64-top-bottom,Fail
+kms_cursor_edge_walk@64x64-top-edge,Fail
+kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail
+kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_display_modes@extended-mode-basic,Fail
+kms_flip@2x-flip-vs-modeset-vs-hang,Fail
+kms_flip@2x-flip-vs-panning-vs-hang,Fail
+kms_flip@absolute-wf_vblank,Fail
+kms_flip@absolute-wf_vblank-interruptible,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@basic-plain-flip,Fail
+kms_flip@blocking-absolute-wf_vblank,Fail
+kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@busy-flip,Fail
+kms_flip@dpms-off-confusion,Fail
+kms_flip@dpms-off-confusion-interruptible,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@dpms-vs-vblank-race-interruptible,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-expired-vblank,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-rmfb,Fail
+kms_flip@flip-vs-rmfb-interruptible,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
+kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@modeset-vs-vblank-race-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_lease@cursor-implicit-plane,Fail
+kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Fail
+kms_lease@setcrtc-implicit-plane,Fail
+kms_lease@simple-lease,Fail
+kms_multipipe_modeset@basic-max-pipe-crc-check,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@disable-crc-after-crtc,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@alpha-basic,Fail
+kms_plane_alpha_blend@alpha-opaque-fb,Fail
+kms_plane_alpha_blend@alpha-transparent-fb,Fail
+kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_plane_alpha_blend@constant-alpha-mid,Fail
+kms_plane_alpha_blend@constant-alpha-min,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_lowres@tiling-none,Fail
+kms_plane_multiple@tiling-none,Fail
 kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-sanity,Fail
+kms_rotation_crc@cursor-rotation-180,Fail
+kms_rotation_crc@primary-rotation-180,Fail
+kms_sequence@get-busy,Fail
+kms_sequence@get-forked,Fail
+kms_sequence@get-forked-busy,Fail
+kms_sequence@get-idle,Fail
+kms_sequence@queue-busy,Fail
+kms_sequence@queue-idle,Fail
+kms_vblank@accuracy-idle,Fail
+kms_vblank@crtc-id,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
new file mode 100644
index 000000000000..6dec63d48cfb
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
@@ -0,0 +1,8 @@
+# Board Name: sc7180-trogdor-kingoftown
+# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+msm_mapping@shadow
+msm_shrink@copy-gpu-oom-32
+msm_shrink@copy-gpu-oom-8
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
index edf64057f866..68c96005ba54 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
@@ -12,3 +12,10 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
+
+# Timeout occurs
+kms_flip@2x-wf_vblank-ts-check
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index f0576aa629e8..eb7a3886d397 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -1,18 +1,191 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
+kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
 kms_color@ctm-blue-to-red,Fail
 kms_color@ctm-green-to-red,Fail
+kms_color@ctm-max,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
+kms_content_protection@atomic,Crash
+kms_content_protection@atomic-dpms,Crash
+kms_content_protection@content-type-change,Crash
+kms_content_protection@lic-type-0,Crash
+kms_content_protection@lic-type-1,Crash
+kms_content_protection@srm,Crash
+kms_content_protection@type1,Crash
+kms_content_protection@uevent,Crash
+kms_cursor_crc@cursor-alpha-opaque,Fail
+kms_cursor_crc@cursor-alpha-transparent,Fail
+kms_cursor_crc@cursor-dpms,Fail
+kms_cursor_crc@cursor-offscreen-128x128,Fail
+kms_cursor_crc@cursor-offscreen-128x42,Fail
+kms_cursor_crc@cursor-offscreen-256x256,Fail
+kms_cursor_crc@cursor-offscreen-256x85,Fail
+kms_cursor_crc@cursor-offscreen-32x10,Fail
+kms_cursor_crc@cursor-offscreen-32x32,Fail
+kms_cursor_crc@cursor-offscreen-512x170,Fail
+kms_cursor_crc@cursor-offscreen-512x512,Fail
+kms_cursor_crc@cursor-offscreen-64x21,Fail
+kms_cursor_crc@cursor-offscreen-64x64,Fail
+kms_cursor_crc@cursor-onscreen-128x128,Fail
+kms_cursor_crc@cursor-onscreen-128x42,Fail
+kms_cursor_crc@cursor-onscreen-256x256,Fail
+kms_cursor_crc@cursor-onscreen-256x85,Fail
+kms_cursor_crc@cursor-onscreen-32x10,Fail
+kms_cursor_crc@cursor-onscreen-32x32,Fail
+kms_cursor_crc@cursor-onscreen-512x170,Fail
+kms_cursor_crc@cursor-onscreen-512x512,Fail
+kms_cursor_crc@cursor-onscreen-64x21,Fail
+kms_cursor_crc@cursor-onscreen-64x64,Fail
+kms_cursor_crc@cursor-random-128x128,Fail
+kms_cursor_crc@cursor-random-128x42,Fail
+kms_cursor_crc@cursor-random-256x256,Fail
+kms_cursor_crc@cursor-random-256x85,Fail
+kms_cursor_crc@cursor-random-32x10,Fail
+kms_cursor_crc@cursor-random-32x32,Fail
+kms_cursor_crc@cursor-random-512x170,Fail
+kms_cursor_crc@cursor-random-512x512,Fail
+kms_cursor_crc@cursor-random-64x21,Fail
+kms_cursor_crc@cursor-random-64x64,Fail
+kms_cursor_crc@cursor-rapid-movement-128x128,Fail
+kms_cursor_crc@cursor-rapid-movement-128x42,Fail
+kms_cursor_crc@cursor-rapid-movement-256x256,Fail
+kms_cursor_crc@cursor-rapid-movement-256x85,Fail
+kms_cursor_crc@cursor-rapid-movement-32x10,Fail
+kms_cursor_crc@cursor-rapid-movement-32x32,Fail
+kms_cursor_crc@cursor-rapid-movement-512x170,Fail
+kms_cursor_crc@cursor-rapid-movement-512x512,Fail
+kms_cursor_crc@cursor-rapid-movement-64x21,Fail
+kms_cursor_crc@cursor-rapid-movement-64x64,Fail
+kms_cursor_crc@cursor-size-change,Fail
+kms_cursor_crc@cursor-sliding-128x128,Fail
+kms_cursor_crc@cursor-sliding-128x42,Fail
+kms_cursor_crc@cursor-sliding-256x256,Fail
+kms_cursor_crc@cursor-sliding-256x85,Fail
+kms_cursor_crc@cursor-sliding-32x10,Fail
+kms_cursor_crc@cursor-sliding-32x32,Fail
+kms_cursor_crc@cursor-sliding-512x170,Fail
+kms_cursor_crc@cursor-sliding-512x512,Fail
+kms_cursor_crc@cursor-sliding-64x21,Fail
+kms_cursor_crc@cursor-sliding-64x64,Fail
+kms_cursor_edge_walk@128x128-left-edge,Fail
+kms_cursor_edge_walk@128x128-right-edge,Fail
+kms_cursor_edge_walk@128x128-top-bottom,Fail
+kms_cursor_edge_walk@128x128-top-edge,Fail
+kms_cursor_edge_walk@256x256-left-edge,Fail
+kms_cursor_edge_walk@256x256-right-edge,Fail
+kms_cursor_edge_walk@256x256-top-bottom,Fail
+kms_cursor_edge_walk@256x256-top-edge,Fail
+kms_cursor_edge_walk@64x64-left-edge,Fail
+kms_cursor_edge_walk@64x64-right-edge,Fail
+kms_cursor_edge_walk@64x64-top-bottom,Fail
+kms_cursor_edge_walk@64x64-top-edge,Fail
+kms_cursor_legacy@2x-cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@2x-cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@2x-flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@2x-flip-vs-cursor-legacy,Fail
+kms_cursor_legacy@2x-long-cursor-vs-flip-atomic,Fail
+kms_cursor_legacy@2x-long-cursor-vs-flip-legacy,Fail
+kms_cursor_legacy@2x-long-flip-vs-cursor-atomic,Fail
+kms_cursor_legacy@2x-long-flip-vs-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-toggle,Fail
 kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
+kms_display_modes@extended-mode-basic,Fail
+kms_flip@2x-flip-vs-modeset-vs-hang,Fail
+kms_flip@2x-flip-vs-panning-vs-hang,Fail
+kms_flip@absolute-wf_vblank,Fail
+kms_flip@absolute-wf_vblank-interruptible,Fail
+kms_flip@basic-flip-vs-wf_vblank,Fail
+kms_flip@basic-plain-flip,Fail
+kms_flip@blocking-absolute-wf_vblank,Fail
+kms_flip@blocking-absolute-wf_vblank-interruptible,Fail
+kms_flip@blocking-wf_vblank,Fail
+kms_flip@busy-flip,Fail
+kms_flip@dpms-off-confusion,Fail
+kms_flip@dpms-off-confusion-interruptible,Fail
+kms_flip@dpms-vs-vblank-race,Fail
+kms_flip@dpms-vs-vblank-race-interruptible,Fail
+kms_flip@flip-vs-absolute-wf_vblank,Fail
+kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
+kms_flip@flip-vs-blocking-wf-vblank,Fail
+kms_flip@flip-vs-expired-vblank,Fail
+kms_flip@flip-vs-expired-vblank-interruptible,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
+kms_flip@flip-vs-panning,Fail
+kms_flip@flip-vs-panning-interruptible,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_flip@flip-vs-rmfb,Fail
+kms_flip@flip-vs-rmfb-interruptible,Fail
+kms_flip@flip-vs-wf_vblank-interruptible,Fail
+kms_flip@modeset-vs-vblank-race,Fail
+kms_flip@modeset-vs-vblank-race-interruptible,Fail
+kms_flip@plain-flip-fb-recreate,Fail
+kms_flip@plain-flip-fb-recreate-interruptible,Fail
+kms_flip@plain-flip-interruptible,Fail
+kms_flip@plain-flip-ts-check,Fail
+kms_flip@plain-flip-ts-check-interruptible,Fail
+kms_flip@wf_vblank-ts-check,Fail
+kms_flip@wf_vblank-ts-check-interruptible,Fail
+kms_lease@cursor-implicit-plane,Fail
+kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Fail
+kms_lease@setcrtc-implicit-plane,Fail
+kms_lease@simple-lease,Fail
+kms_multipipe_modeset@basic-max-pipe-crc-check,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
+kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
+kms_pipe_crc_basic@disable-crc-after-crtc,Fail
+kms_pipe_crc_basic@nonblocking-crc,Fail
+kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
+kms_pipe_crc_basic@read-crc,Fail
+kms_pipe_crc_basic@read-crc-frame-sequence,Fail
+kms_plane@pixel-format,Fail
+kms_plane@pixel-format-source-clamping,Fail
+kms_plane@plane-panning-bottom-right,Fail
+kms_plane@plane-panning-top-left,Fail
+kms_plane@plane-position-covered,Fail
+kms_plane@plane-position-hole,Fail
+kms_plane@plane-position-hole-dpms,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
+kms_plane_alpha_blend@alpha-basic,Fail
+kms_plane_alpha_blend@alpha-opaque-fb,Fail
+kms_plane_alpha_blend@alpha-transparent-fb,Fail
+kms_plane_alpha_blend@constant-alpha-max,Fail
+kms_plane_alpha_blend@constant-alpha-mid,Fail
+kms_plane_alpha_blend@constant-alpha-min,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
+kms_plane_cursor@primary,Fail
+kms_plane_lowres@tiling-none,Fail
+kms_plane_multiple@tiling-none,Fail
 kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-sanity,Fail
+kms_rotation_crc@cursor-rotation-180,Fail
+kms_rotation_crc@primary-rotation-180,Fail
+kms_sequence@get-busy,Fail
+kms_sequence@get-forked,Fail
+kms_sequence@get-forked-busy,Fail
+kms_sequence@get-idle,Fail
+kms_sequence@queue-busy,Fail
+kms_sequence@queue-idle,Fail
+kms_vblank@accuracy-idle,Fail
+kms_vblank@crtc-id,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
new file mode 100644
index 000000000000..dcb24b835dc3
--- /dev/null
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
@@ -0,0 +1,6 @@
+# Board Name: sc7180-trogdor-lazor-limozeen-nots-r5
+# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+msm_mapping@shadow
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
index edf64057f866..1168c53acd2d 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
@@ -12,3 +12,7 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
index e9043a00383e..8f010c8a9c4f 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
@@ -1,3 +1,8 @@
+device_reset@cold-reset-bound,Fail
+device_reset@reset-bound,Fail
+device_reset@unbind-cold-reset-rebind,Fail
+device_reset@unbind-reset-rebind,Fail
+dumb_buffer@invalid-bpp,Fail
 kms_color@ctm-0-25,Fail
 kms_color@ctm-0-50,Fail
 kms_color@ctm-0-75,Fail
@@ -6,17 +11,6 @@ kms_color@ctm-green-to-red,Fail
 kms_color@ctm-negative,Fail
 kms_color@ctm-red-to-blue,Fail
 kms_color@ctm-signed,Fail
-kms_color@pipe-A-ctm-0-25,Fail
-kms_color@pipe-A-ctm-0-5,Fail
-kms_color@pipe-A-ctm-0-75,Fail
-kms_color@pipe-A-ctm-blue-to-red,Fail
-kms_color@pipe-A-ctm-green-to-red,Fail
-kms_color@pipe-A-ctm-max,Fail
-kms_color@pipe-A-ctm-negative,Fail
-kms_color@pipe-A-ctm-red-to-blue,Fail
-kms_color@pipe-A-legacy-gamma,Fail
-kms_cursor_legacy@basic-flip-after-cursor-atomic,Fail
-kms_cursor_legacy@basic-flip-after-cursor-varying-size,Fail
 kms_cursor_legacy@basic-flip-before-cursor-atomic,Fail
 kms_cursor_legacy@basic-flip-before-cursor-legacy,Fail
 kms_cursor_legacy@cursor-vs-flip-atomic,Fail
@@ -31,30 +25,12 @@ kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
 kms_cursor_legacy@flip-vs-cursor-legacy,Fail
 kms_flip@flip-vs-modeset-vs-hang,Fail
 kms_flip@flip-vs-panning-vs-hang,Fail
+kms_lease@lease-uevent,Fail
 kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
 kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
-kms_plane_alpha_blend@pipe-A-alpha-7efc,Fail
-kms_plane_alpha_blend@pipe-A-coverage-7efc,Fail
-kms_plane_alpha_blend@pipe-A-coverage-vs-premult-vs-constant,Fail
 kms_plane_cursor@overlay,Fail
-kms_plane_cursor@pipe-A-overlay-size-128,Fail
-kms_plane_cursor@pipe-A-overlay-size-256,Fail
-kms_plane_cursor@pipe-A-overlay-size-64,Fail
-kms_plane_cursor@pipe-A-viewport-size-128,Fail
-kms_plane_cursor@pipe-A-viewport-size-256,Fail
-kms_plane_cursor@pipe-A-viewport-size-64,Fail
 kms_plane_cursor@viewport,Fail
-kms_plane_scaling@downscale-with-pixel-format-factor-0-25,Timeout
-kms_plane_scaling@downscale-with-pixel-format-factor-0-5,Timeout
-kms_plane_scaling@downscale-with-pixel-format-factor-0-75,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-5,Timeout
-kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-75,Timeout
-kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats,Timeout
-kms_plane_scaling@plane-scaler-with-pixel-format-unity-scaling,Timeout
-kms_plane_scaling@planes-downscale-factor-0-25,Fail
-kms_plane_scaling@scaler-with-clipping-clamping,Timeout
-kms_plane_scaling@scaler-with-pixel-format-unity-scaling,Timeout
 kms_rmfb@close-fd,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
index 8a492f01eaa4..2c5f62b07632 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
@@ -1,22 +1,19 @@
-# Board Name: msm:sdm845
-# Bug Report: https://lore.kernel.org/dri-devel/46287831-edfa-78e8-6055-d7a08831c445@collabora.com/T/#u
+# Board Name: sdm845-cheza-r3
+# Bug Report: https://lore.kernel.org/linux-arm-msm/661483c8-ad82-400d-bcd8-e94986d20d7d@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
 # Failure Rate: 50
-# IGT Version: 1.28-gd2af13d9f
-# Linux Version: 6.7.0-rc3
-
-# Reported by deqp-runner
+kms_cursor_legacy@basic-flip-after-cursor-atomic
 kms_cursor_legacy@basic-flip-after-cursor-legacy
-kms_cursor_legacy@flip-vs-cursor-toggle
+kms_cursor_legacy@basic-flip-after-cursor-varying-size
+kms_cursor_legacy@basic-flip-before-cursor-varying-size
+kms_cursor_legacy@flip-vs-cursor-atomic-transitions
+kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size
 kms_cursor_legacy@flip-vs-cursor-varying-size
+kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
+kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
 kms_cursor_legacy@short-flip-after-cursor-toggle
 kms_cursor_legacy@short-flip-before-cursor-atomic-transitions
 kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size
 msm_shrink@copy-gpu-32
 msm_shrink@copy-gpu-oom-32
-
-# The below test shows inconsistency across multiple runs, giving
-# results of Pass and Fail alternately.
-kms_cursor_legacy@basic-flip-before-cursor-varying-size
-kms_cursor_legacy@flip-vs-cursor-atomic-transitions
-kms_cursor_legacy@short-flip-after-cursor-atomic-transitions
-kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size
diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
index dd24dc190db0..5185212c8fb2 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
@@ -17,3 +17,10 @@ panfrost_.*
 # Skip intel specific tests
 gem_.*
 i915_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
+
+# Whole machine hangs
+kms_cursor_crc.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
index 90c63f519e9e..f9b99bf27105 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
@@ -1,54 +1,8 @@
-kms_3d,Crash
-kms_bw@linear-tiling-2-displays-1920x1080p,Fail
-kms_bw@linear-tiling-2-displays-2560x1440p,Fail
-kms_bw@linear-tiling-2-displays-3840x2160p,Fail
-kms_bw@linear-tiling-3-displays-1920x1080p,Fail
-kms_bw@linear-tiling-3-displays-2560x1440p,Fail
-kms_bw@linear-tiling-3-displays-3840x2160p,Fail
-kms_flip@flip-vs-modeset-vs-hang,Crash
-kms_flip@flip-vs-panning-vs-hang,Crash
-kms_force_connector_basic@force-load-detect,Fail
-kms_invalid_mode@int-max-clock,Crash
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Crash
-kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Crash
-kms_pipe_crc_basic@read-crc-frame-sequence,Crash
-kms_plane@pixel-format,Crash
-kms_plane@pixel-format-source-clamping,Crash
-kms_plane@plane-position-hole,Crash
-kms_plane@plane-position-hole-dpms,Crash
-kms_plane_cursor@overlay,Crash
-kms_plane_cursor@pipe-A-overlay-size-128,Fail
-kms_plane_cursor@pipe-A-overlay-size-256,Fail
-kms_plane_cursor@pipe-A-overlay-size-64,Fail
-kms_plane_cursor@pipe-A-primary-size-128,Fail
-kms_plane_cursor@pipe-A-primary-size-256,Fail
-kms_plane_cursor@pipe-A-primary-size-64,Fail
-kms_plane_cursor@pipe-A-viewport-size-128,Fail
-kms_plane_cursor@pipe-A-viewport-size-256,Fail
-kms_plane_cursor@pipe-A-viewport-size-64,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
-kms_plane_cursor@primary,Crash
-kms_plane_cursor@viewport,Crash
-kms_plane_lowres@tiling-none,Fail
-kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_prime@basic-crc,Fail
-kms_properties@connector-properties-atomic,Crash
-kms_properties@connector-properties-legacy,Crash
-kms_properties@get_properties-sanity-atomic,Crash
-kms_properties@get_properties-sanity-non-atomic,Crash
-kms_rmfb@close-fd,Crash
-kms_setmode@invalid-clone-single-crtc,Crash
+dumb_buffer@create-clear,Crash
+dumb_buffer@create-valid-dumb,Crash
+dumb_buffer@invalid-bpp,Crash
+dumb_buffer@map-invalid-size,Crash
+dumb_buffer@map-uaf,Crash
+dumb_buffer@map-valid,Crash
+panfrost_prime@gem-prime-import,Crash
+tools_test@tools_test,Crash
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
index c33dc95b7fc1..6d3757dca83b 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
@@ -65,3 +65,7 @@ i915_.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
index d516d9c1d546..9ef460646d76 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
@@ -1,75 +1,8 @@
-kms_color@gamma,Fail
-kms_color@legacy-gamma,Fail
-kms_color@pipe-A-legacy-gamma,Fail
-kms_color@pipe-B-legacy-gamma,Fail
-kms_cursor_crc@cursor-alpha-opaque,Fail
-kms_cursor_crc@cursor-alpha-transparent,Fail
-kms_cursor_crc@cursor-dpms,Fail
-kms_cursor_crc@cursor-offscreen-32x10,Fail
-kms_cursor_crc@cursor-offscreen-32x32,Fail
-kms_cursor_crc@cursor-offscreen-64x64,Fail
-kms_cursor_crc@cursor-onscreen-32x10,Fail
-kms_cursor_crc@cursor-onscreen-32x32,Fail
-kms_cursor_crc@cursor-onscreen-64x21,Fail
-kms_cursor_crc@cursor-onscreen-64x64,Fail
-kms_cursor_crc@cursor-random-32x10,Fail
-kms_cursor_crc@cursor-random-32x32,Fail
-kms_cursor_crc@cursor-random-64x21,Fail
-kms_cursor_crc@cursor-random-64x64,Fail
-kms_cursor_crc@cursor-rapid-movement-32x32,Fail
-kms_cursor_crc@cursor-rapid-movement-64x21,Fail
-kms_cursor_crc@cursor-rapid-movement-64x64,Fail
-kms_cursor_crc@cursor-size-change,Fail
-kms_cursor_crc@cursor-sliding-32x10,Fail
-kms_cursor_crc@cursor-sliding-32x32,Fail
-kms_cursor_crc@cursor-sliding-64x21,Fail
-kms_cursor_crc@cursor-sliding-64x64,Fail
-kms_flip@basic-flip-vs-wf_vblank,Fail
-kms_flip@blocking-wf_vblank,Fail
-kms_flip@dpms-vs-vblank-race,Fail
-kms_flip@flip-vs-absolute-wf_vblank,Fail
-kms_flip@flip-vs-absolute-wf_vblank-interruptible,Fail
-kms_flip@flip-vs-blocking-wf-vblank,Fail
-kms_flip@flip-vs-modeset-vs-hang,Fail
-kms_flip@flip-vs-panning,Fail
-kms_flip@flip-vs-panning-interruptible,Fail
-kms_flip@flip-vs-panning-vs-hang,Fail
-kms_flip@modeset-vs-vblank-race,Fail
-kms_flip@plain-flip-fb-recreate,Fail
-kms_flip@plain-flip-fb-recreate-interruptible,Fail
-kms_flip@plain-flip-ts-check,Fail
-kms_flip@plain-flip-ts-check-interruptible,Fail
-kms_flip@wf_vblank-ts-check,Fail
-kms_flip@wf_vblank-ts-check-interruptible,Fail
-kms_invalid_mode@int-max-clock,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
-kms_pipe_crc_basic@compare-crc-sanitycheck-xr24,Fail
-kms_pipe_crc_basic@disable-crc-after-crtc,Fail
-kms_pipe_crc_basic@nonblocking-crc,Fail
-kms_pipe_crc_basic@nonblocking-crc-frame-sequence,Fail
-kms_pipe_crc_basic@read-crc,Fail
-kms_pipe_crc_basic@read-crc-frame-sequence,Fail
-kms_plane@pixel-format,Fail
-kms_plane@pixel-format-source-clamping,Fail
-kms_plane@plane-panning-bottom-right,Fail
-kms_plane@plane-panning-top-left,Fail
-kms_plane@plane-position-covered,Fail
-kms_plane@plane-position-hole,Fail
-kms_plane@plane-position-hole-dpms,Fail
-kms_plane_cursor@overlay,Fail
-kms_plane_cursor@pipe-B-overlay-size-128,Fail
-kms_plane_cursor@pipe-B-overlay-size-256,Fail
-kms_plane_cursor@pipe-B-overlay-size-64,Fail
-kms_plane_cursor@pipe-B-primary-size-128,Fail
-kms_plane_cursor@pipe-B-primary-size-256,Fail
-kms_plane_cursor@pipe-B-primary-size-64,Fail
-kms_plane_cursor@pipe-B-viewport-size-128,Fail
-kms_plane_cursor@pipe-B-viewport-size-256,Fail
-kms_plane_cursor@pipe-B-viewport-size-64,Fail
-kms_plane_cursor@primary,Fail
-kms_plane_cursor@viewport,Fail
-kms_plane_multiple@atomic-pipe-B-tiling-none,Fail
-kms_plane_multiple@tiling-none,Fail
-kms_prime@basic-crc,Fail
-kms_rmfb@close-fd,Fail
-kms_universal_plane@universal-plane-pipe-B-functional,Fail
+dumb_buffer@create-clear,Fail
+dumb_buffer@create-valid-dumb,Fail
+dumb_buffer@invalid-bpp,Fail
+dumb_buffer@map-invalid-size,Fail
+dumb_buffer@map-uaf,Fail
+dumb_buffer@map-valid,Fail
+panfrost_prime@gem-prime-import,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
index c9fdc623ab91..742c27d9a598 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
@@ -1,7 +1,6 @@
-kms_bw@linear-tiling-2-displays-1920x1080p
-kms_cursor_crc@cursor-offscreen-64x21
-kms_flip@dpms-vs-vblank-race-interruptible
-kms_flip@flip-vs-wf_vblank-interruptible
-kms_plane_cursor@overlay
-kms_plane_cursor@primary
-kms_plane_cursor@viewport
+# Board Name: rk3399-gru-kevin
+# Bug Report: https://lore.kernel.org/dri-devel/5cc34a8b-c1fa-4744-9031-2d33ecf41011@collabora.com/T/#u
+# IGT Version: 1.28-g0df7b9b97
+# Linux Version: 6.9.0-rc7
+# Failure Rate: 50
+panfrost_submit@pan-unhandled-pagefault
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
index 8a7c9464b30d..5c52b25b4213 100644
--- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
@@ -18,3 +18,7 @@ i915_.*
 
 # Panfrost is not a KMS driver, so skip the KMS tests
 kms_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
diff --git a/drivers/gpu/drm/ci/xfails/update-xfails.py b/drivers/gpu/drm/ci/xfails/update-xfails.py
index e9f0ec7fed8d..a446e98d72a1 100755
--- a/drivers/gpu/drm/ci/xfails/update-xfails.py
+++ b/drivers/gpu/drm/ci/xfails/update-xfails.py
@@ -93,10 +93,10 @@ def add_unit_test_or_update_result_to_fails_if_present(fails_txt, unit_test, fai
 def split_unit_test_from_collate(xfails):
     for job_name in xfails.keys():
         for job_id in xfails[job_name].copy().keys():
-            if "not found" in xfails[job_name][job_id]:
+            if "not found" in xfails[job_name][job_id].content_as_str:
                 del xfails[job_name][job_id]
                 continue
-            xfails[job_name][job_id] = xfails[job_name][job_id].strip().split("\n")
+            xfails[job_name][job_id] = xfails[job_name][job_id].content_as_str.splitlines()
 
 
 def get_xfails_from_pipeline_url(pipeline_url):
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
index 007f21e56d89..fdf09fe11566 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-fails.txt
@@ -1,33 +1,72 @@
-kms_addfb_basic@addfb25-bad-modifier,Fail
 kms_addfb_basic@bad-pitch-65536,Fail
 kms_addfb_basic@bo-too-small,Fail
 kms_addfb_basic@size-max,Fail
 kms_addfb_basic@too-high,Fail
 kms_atomic_transition@plane-primary-toggle-with-vblank-wait,Fail
 kms_bw@linear-tiling-1-displays-1920x1080p,Fail
+kms_bw@linear-tiling-1-displays-2160x1440p,Fail
 kms_bw@linear-tiling-1-displays-2560x1440p,Fail
 kms_bw@linear-tiling-1-displays-3840x2160p,Fail
+kms_bw@linear-tiling-10-displays-1920x1080p,Fail
+kms_bw@linear-tiling-10-displays-2160x1440p,Fail
+kms_bw@linear-tiling-10-displays-2560x1440p,Fail
+kms_bw@linear-tiling-10-displays-3840x2160p,Fail
+kms_bw@linear-tiling-11-displays-1920x1080p,Fail
+kms_bw@linear-tiling-11-displays-2160x1440p,Fail
+kms_bw@linear-tiling-11-displays-2560x1440p,Fail
+kms_bw@linear-tiling-11-displays-3840x2160p,Fail
+kms_bw@linear-tiling-12-displays-1920x1080p,Fail
+kms_bw@linear-tiling-12-displays-2160x1440p,Fail
+kms_bw@linear-tiling-12-displays-2560x1440p,Fail
+kms_bw@linear-tiling-12-displays-3840x2160p,Fail
+kms_bw@linear-tiling-13-displays-1920x1080p,Fail
+kms_bw@linear-tiling-13-displays-2160x1440p,Fail
+kms_bw@linear-tiling-13-displays-2560x1440p,Fail
+kms_bw@linear-tiling-13-displays-3840x2160p,Fail
+kms_bw@linear-tiling-14-displays-1920x1080p,Fail
+kms_bw@linear-tiling-14-displays-2160x1440p,Fail
+kms_bw@linear-tiling-14-displays-2560x1440p,Fail
+kms_bw@linear-tiling-14-displays-3840x2160p,Fail
+kms_bw@linear-tiling-15-displays-1920x1080p,Fail
+kms_bw@linear-tiling-15-displays-2160x1440p,Fail
+kms_bw@linear-tiling-15-displays-2560x1440p,Fail
+kms_bw@linear-tiling-15-displays-3840x2160p,Fail
+kms_bw@linear-tiling-16-displays-1920x1080p,Fail
+kms_bw@linear-tiling-16-displays-2160x1440p,Fail
+kms_bw@linear-tiling-16-displays-2560x1440p,Fail
+kms_bw@linear-tiling-16-displays-3840x2160p,Fail
 kms_bw@linear-tiling-2-displays-1920x1080p,Fail
+kms_bw@linear-tiling-2-displays-2160x1440p,Fail
 kms_bw@linear-tiling-2-displays-2560x1440p,Fail
 kms_bw@linear-tiling-2-displays-3840x2160p,Fail
 kms_bw@linear-tiling-3-displays-1920x1080p,Fail
+kms_bw@linear-tiling-3-displays-2160x1440p,Fail
 kms_bw@linear-tiling-3-displays-2560x1440p,Fail
 kms_bw@linear-tiling-3-displays-3840x2160p,Fail
 kms_bw@linear-tiling-4-displays-1920x1080p,Fail
+kms_bw@linear-tiling-4-displays-2160x1440p,Fail
 kms_bw@linear-tiling-4-displays-2560x1440p,Fail
 kms_bw@linear-tiling-4-displays-3840x2160p,Fail
 kms_bw@linear-tiling-5-displays-1920x1080p,Fail
+kms_bw@linear-tiling-5-displays-2160x1440p,Fail
 kms_bw@linear-tiling-5-displays-2560x1440p,Fail
 kms_bw@linear-tiling-5-displays-3840x2160p,Fail
 kms_bw@linear-tiling-6-displays-1920x1080p,Fail
+kms_bw@linear-tiling-6-displays-2160x1440p,Fail
 kms_bw@linear-tiling-6-displays-2560x1440p,Fail
 kms_bw@linear-tiling-6-displays-3840x2160p,Fail
 kms_bw@linear-tiling-7-displays-1920x1080p,Fail
+kms_bw@linear-tiling-7-displays-2160x1440p,Fail
 kms_bw@linear-tiling-7-displays-2560x1440p,Fail
 kms_bw@linear-tiling-7-displays-3840x2160p,Fail
 kms_bw@linear-tiling-8-displays-1920x1080p,Fail
+kms_bw@linear-tiling-8-displays-2160x1440p,Fail
 kms_bw@linear-tiling-8-displays-2560x1440p,Fail
 kms_bw@linear-tiling-8-displays-3840x2160p,Fail
+kms_bw@linear-tiling-9-displays-1920x1080p,Fail
+kms_bw@linear-tiling-9-displays-2160x1440p,Fail
+kms_bw@linear-tiling-9-displays-2560x1440p,Fail
+kms_bw@linear-tiling-9-displays-3840x2160p,Fail
 kms_flip@absolute-wf_vblank,Fail
 kms_flip@absolute-wf_vblank-interruptible,Fail
 kms_flip@basic-flip-vs-wf_vblank,Fail
@@ -54,31 +93,34 @@ kms_flip@plain-flip-ts-check-interruptible,Fail
 kms_flip@wf_vblank-ts-check,Fail
 kms_flip@wf_vblank-ts-check-interruptible,Fail
 kms_invalid_mode@int-max-clock,Fail
-kms_plane_scaling@downscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@downscale-with-rotation-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5,Fail
-kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75,Fail
-kms_plane_scaling@upscale-with-modifier-20x20,Fail
-kms_plane_scaling@upscale-with-modifier-factor-0-25,Fail
-kms_plane_scaling@upscale-with-pixel-format-20x20,Fail
-kms_plane_scaling@upscale-with-pixel-format-factor-0-25,Fail
-kms_plane_scaling@upscale-with-rotation-20x20,Fail
-kms_selftest@drm_format,Timeout
-kms_selftest@drm_format_helper,Timeout
+kms_lease@cursor-implicit-plane,Fail
+kms_lease@lease-uevent,Fail
+kms_lease@page-flip-implicit-plane,Fail
+kms_lease@setcrtc-implicit-plane,Fail
+kms_lease@simple-lease,Fail
+kms_sequence@get-busy,Fail
+kms_sequence@get-forked,Fail
+kms_sequence@get-forked-busy,Fail
+kms_sequence@get-idle,Fail
+kms_sequence@queue-busy,Fail
+kms_sequence@queue-idle,Fail
 kms_setmode@basic,Fail
+kms_vblank@accuracy-idle,Fail
 kms_vblank@crtc-id,Fail
 kms_vblank@invalid,Fail
-kms_vblank@pipe-A-accuracy-idle,Fail
-kms_vblank@pipe-A-query-busy,Fail
-kms_vblank@pipe-A-query-forked,Fail
-kms_vblank@pipe-A-query-forked-busy,Fail
-kms_vblank@pipe-A-query-idle,Fail
-kms_vblank@pipe-A-ts-continuation-idle,Fail
-kms_vblank@pipe-A-ts-continuation-modeset,Fail
-kms_vblank@pipe-A-ts-continuation-suspend,Fail
-kms_vblank@pipe-A-wait-busy,Fail
-kms_vblank@pipe-A-wait-forked,Fail
-kms_vblank@pipe-A-wait-forked-busy,Fail
-kms_vblank@pipe-A-wait-idle,Fail
+kms_vblank@query-busy,Fail
+kms_vblank@query-forked,Fail
+kms_vblank@query-forked-busy,Fail
+kms_vblank@query-idle,Fail
+kms_vblank@ts-continuation-dpms-rpm,Fail
+kms_vblank@ts-continuation-dpms-suspend,Fail
+kms_vblank@ts-continuation-idle,Fail
+kms_vblank@ts-continuation-modeset,Fail
+kms_vblank@ts-continuation-modeset-rpm,Fail
+kms_vblank@ts-continuation-suspend,Fail
+kms_vblank@wait-busy,Fail
+kms_vblank@wait-forked,Fail
+kms_vblank@wait-forked-busy,Fail
+kms_vblank@wait-idle,Fail
+perf@i915-ref-count,Fail
+tools_test@tools_test,Fail
diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
index 59d390d6856f..e0ca4fadb84f 100644
--- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
+++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
@@ -18,3 +18,7 @@ panfrost_.*
 gem_.*
 i915_.*
 xe_.*
+
+# Currently fails and causes coverage loss for other tests
+# since core_getversion also fails.
+core_hotunplug.*
-- 
2.40.1

