Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC92791BB
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600526ED1E;
	Fri, 25 Sep 2020 20:11:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9A06ED1E
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:48 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id d20so4118524qka.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9Kpr8TtFjClwiKIf/cQix4szyxbJmV37ifSyDM5sTo=;
 b=n2RC7ycZ/ron8HtPe39WJY31dnDrgdaD72Xtcd0B7vSW9WBeed9+zWrB44rq+YA2EG
 8bO9Lj2aBqiPs5k50JX4/kN4pe9eXteCI/zXcruF+2eo5rMT2xD+vYQtT6MLOI7I2okL
 7ZSmP8n7H5BhzinyIcnlebvTRMpXUhGEGiFw5kRU4BKKKdjqXSpBEcQjPaBVT+dbTQK5
 D/3QhuqLWQqMmB9D2olRP2lKr+52ZcKJ+JZsFKKKTD36EzjxsCdVSwhclYJN4DGMgaK6
 EaWtC3sL4Ylf+Z+IiJmGNOtc7cD3ueuJ8Tnc8dsIetYE6ypDn30LlRLF+jjqjSQpWV+A
 uNiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C9Kpr8TtFjClwiKIf/cQix4szyxbJmV37ifSyDM5sTo=;
 b=T8YzXc70+s3VrJ3NyxeWIiUMkA9N0rm65HEkr6DoaWbLI8tBwj3fNxRvCO33K5Io9X
 x+4Ocwnus9yzHm3dMZRHyl3ldywHdiusktHvnsZX/FfXbvydbtplbhzLw0MhdncmOEkc
 Y6bJ4db21XxQzet01ayBKsswWQwsg74aFOWrYFDQlc0coaMs8XK6dq+reengK3asWmCw
 fMKm7aeo3A5pb14FORYDLOCLwehi4jBVlQeqVQPmAmIOjtnBswYvlMAyv+C0CUsFgcWZ
 LtGopUARVVtWj77DmL9f5BL4Y5Ghr2LxpJigUtTk9EMGnIrGLxuyhmC2jZztIxlq0+8S
 wDEw==
X-Gm-Message-State: AOAM531CY6tN76/IFSe0Kb63JVguT57MnF9tS9zwXd39V/fM6j/Hmk79
 4wjM2z9pHWbEbXXaeakSbXzlN/04DA4=
X-Google-Smtp-Source: ABdhPJyrwK2fTcsAL1IZP/q7fLeK0qfBZbboxNwlgBo4ZgdyG2ijRXhk9W7nZHTE4bVTUhO6N7zlEQ==
X-Received: by 2002:a37:44c7:: with SMTP id r190mr1612145qka.253.1601064705465; 
 Fri, 25 Sep 2020 13:11:45 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:44 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/45] drm/amdgpu: enable psp support for vangogh
Date: Fri, 25 Sep 2020 16:10:21 -0400
Message-Id: <20200925201029.1738724-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200925201029.1738724-1-alexander.deucher@amd.com>
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Huang Rui <ray.huang@amd.com>

This patch is to enable psp support for vangogh

Signed-off-by: Huang Rui <ray.huang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c   | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 3 +--
 drivers/gpu/drm/amd/amdgpu/nv.c           | 2 ++
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c    | 5 +++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index c8cec7ab499d..574392fcd503 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -100,6 +100,7 @@ static int psp_early_init(void *handle)
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		psp_v11_0_set_psp_funcs(psp);
 		psp->autoload_supported = true;
 		break;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 3f791ca73ff7..676405171a4c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -391,12 +391,11 @@ amdgpu_ucode_get_load_type(struct amdgpu_device *adev, int load_type)
 	case CHIP_NAVI12:
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+	case CHIP_VANGOGH:
 		if (!load_type)
 			return AMDGPU_FW_LOAD_DIRECT;
 		else
 			return AMDGPU_FW_LOAD_PSP;
-	case CHIP_VANGOGH:
-		return AMDGPU_FW_LOAD_DIRECT;
 	default:
 		DRM_ERROR("Unknown firmware load type\n");
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 4fbf3f6640e6..568e33b7fda8 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -644,6 +644,8 @@ int nv_set_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &nv_common_ip_block);
 		amdgpu_device_ip_block_add(adev, &gmc_v10_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &navi10_ih_ip_block);
+		if (likely(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP))
+			amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_block);
 		amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
 		if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
 			amdgpu_device_ip_block_add(adev, &dce_virtual_ip_block);
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index f2d6b2518eee..d6ba6ea9a8fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -59,6 +59,8 @@ MODULE_FIRMWARE("amdgpu/sienna_cichlid_sos.bin");
 MODULE_FIRMWARE("amdgpu/sienna_cichlid_ta.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_sos.bin");
 MODULE_FIRMWARE("amdgpu/navy_flounder_ta.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_asd.bin");
+MODULE_FIRMWARE("amdgpu/vangogh_toc.bin");
 
 /* address block */
 #define smnMP1_FIRMWARE_FLAGS		0x3010024
@@ -105,6 +107,9 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	case CHIP_NAVY_FLOUNDER:
 		chip_name = "navy_flounder";
 		break;
+	case CHIP_VANGOGH:
+		chip_name = "vangogh";
+		break;
 	default:
 		BUG();
 	}
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
