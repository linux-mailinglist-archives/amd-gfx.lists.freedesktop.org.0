Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C621F951
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CE96E863;
	Tue, 14 Jul 2020 18:24:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982DF6E863
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:58 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id 80so16517116qko.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nwK8jExXi0UyB+eD/oLcV2mqSF5+EU2nZABfL9btRRw=;
 b=dpwLx4fngL2JVgGCvCGKIr3zGBWBXNwwfGzH4Y9lAhyxvXtXbWySXQR22vXHUbKmGB
 8klB9mxHv2nKOxv3NUPnb4tylD4zSCcNySBuBnDlb9DuSEIYpIAn+JD4QwcX+jB4rTmr
 B9Y79+zL8YBbvdOD4iN+tXX+A6vZ6pAH/KYr9wa9uuA6x7sKPHUoYWMcaFksIvsrTVOJ
 Q91fgkdKbDip+qKx1TrV6zdVWZBAYwOV+RPyfPzyFrzx7hb5LVVCE2CRsw6nwsaUm3bi
 yjaUENjtfa5U5Rv4JJGeQk62aG9DKfnAWN/kZ1D2svcQYvnLkjzXL7mT9NVH/6hm9XaE
 xWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nwK8jExXi0UyB+eD/oLcV2mqSF5+EU2nZABfL9btRRw=;
 b=oFmUxjZC6dWEOojtgf/fm932LwS7uLLXRjdNBrdHiyKnozXYMUAiw/3RP0mvV9Vmxe
 ymIhr3vqx2/j9fAyJ7leoFuO0+IbekhODdcKpLwGg32ZOmm8Rq67A7r+AsB0lz693fFb
 BAAe64FLtoVEyoN4HzG9A64moW9iY7AI1Wru6jGFkd8bXEW0mKKlgODgLqKXPnu/L0Yd
 H7a9LEjHM7S/q+qNQ62NpkcpfhNTA2VBylINgvQ1Oa9lmgLLpY9WQiLq+imBnxHNmh6H
 yqDr/OZE8TO+34lN9YjF/nrye+LciqKtFX0pEQYn8XvlH8vLcKAvBj+3ERQ/tnGstqv3
 EaLw==
X-Gm-Message-State: AOAM531IDUAR16GJ1jzR4iwSCk97GGIHHJQTkjAWXXteKoO80U8mm6YA
 M90bSiHcg1lzy0/dxp7QNHEHKAIo
X-Google-Smtp-Source: ABdhPJzJ/SYec6Iae8N2D+/nXA4QFHHxfCyx0fmTuZbh1Aw3U1yol5JtjZKZNuzLFuGoeiCw++aO8A==
X-Received: by 2002:a37:4050:: with SMTP id n77mr5778111qka.431.1594751097567; 
 Tue, 14 Jul 2020 11:24:57 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:57 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/42] drm/amd/display: add DC support for navy flounder
Date: Tue, 14 Jul 2020 14:23:48 -0400
Message-Id: <20200714182353.2164930-38-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Plumb DC support for navy flounder through.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                   | 4 ++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++++++--
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3efca05e5d69..84c8fbd3d030 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2808,6 +2808,7 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 #endif
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 #endif
 		return amdgpu_dc != 0;
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 0fa1e561c2cc..31e4036b110c 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -519,6 +519,10 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 			amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
 			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
+#if defined(CONFIG_DRM_AMD_DC)
+		else if (amdgpu_device_has_dc_support(adev))
+			amdgpu_device_ip_block_add(adev, &dm_ip_block);
+#endif
 		amdgpu_device_ip_block_add(adev, &gfx_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &sdma_v5_2_ip_block);
 		amdgpu_device_ip_block_add(adev, &vcn_v3_0_ip_block);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 4c033952eb01..0bc333798cd6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1085,6 +1085,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
 	case CHIP_RENOIR:
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 #endif
 		return 0;
 	case CHIP_NAVI12:
@@ -1184,6 +1185,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
 		break;
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		dmub_asic = DMUB_ASIC_DCN30;
 		fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
 		break;
@@ -3230,6 +3232,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 	case CHIP_RENOIR:
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 #endif
 		if (dcn10_register_irq_handlers(dm->adev)) {
 			DRM_ERROR("DM: Failed to initialize IRQ\n");
@@ -3460,6 +3463,7 @@ static int dm_early_init(void *handle)
 	case CHIP_NAVI12:
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 #endif
 		adev->mode_info.num_crtc = 6;
 		adev->mode_info.num_hpd = 6;
@@ -3783,6 +3787,7 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 	    adev->asic_type == CHIP_NAVI12 ||
 #if defined(CONFIG_DRM_AMD_DC_DCN3_0)
 		adev->asic_type == CHIP_SIENNA_CICHLID ||
+		adev->asic_type == CHIP_NAVY_FLOUNDER ||
 #endif
 	    adev->asic_type == CHIP_RENOIR ||
 	    adev->asic_type == CHIP_RAVEN) {
@@ -3804,9 +3809,9 @@ fill_plane_buffer_attributes(struct amdgpu_device *adev,
 		tiling_info->gfx9.shaderEnable = 1;
 
 #ifdef CONFIG_DRM_AMD_DC_DCN3_0
-		if (adev->asic_type == CHIP_SIENNA_CICHLID)
+		if (adev->asic_type == CHIP_SIENNA_CICHLID ||
+		    adev->asic_type == CHIP_NAVY_FLOUNDER)
 			tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
-
 #endif
 		ret = fill_plane_dcc_attributes(adev, afb, format, rotation,
 						plane_size, tiling_info,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
