Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BB927D2B4
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Sep 2020 17:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5B06E4CF;
	Tue, 29 Sep 2020 15:28:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E526E4D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 15:28:03 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id o21so3854586qtp.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S8r9DQGDfqFJ7C05XvFk2wR6HzhhqQpOel7WUXxEm0Y=;
 b=NbKYT5fFnZqwpfn6Ag6PlcL0uPLVHLD+zJPquUHxjFtnARe7iDznUjtmZ95exEZ4Jm
 1lmenkT3dAenb082fmfpIxHE4jJfwkeycRHONf5FEbi432NVNxpfLQOg2DQwyRfvItBK
 YqFEca3BI/qRN39VJXxWw+o9jd5BAhU/euUyxzCK0F7x2i/mHn8COc85oTdLiGxY42MY
 mppPutD4hLCPNbaTl0a+/F0awcvbNzn4K8iUjQkONhN4hZJxG5XPpN9sO3gi0gR/2RA5
 ZtW3/BrEvYO7+/8g6/6b7EEoiGt0rtBtsIglGS1xIa1cBaG1G7vfTDjE10vCpnlcbYDh
 CSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S8r9DQGDfqFJ7C05XvFk2wR6HzhhqQpOel7WUXxEm0Y=;
 b=D47JcVWey/RHgatREVikpZxZrnzAgqX2hLBQyQg5aNPejcwv/aQzpFr0wCGWVaR1l9
 vWwahnLTaApoYkkkwUip3vCXtT4H/qJBHvo5XY8pXxdP5EXqcq0Ph7wvYMj7PLX/9FXt
 ecVB5GGox1Y+gpFEogk42ONqfiMz2z2InWTw+IQE0ffsCe4TGBe1XJKEcwtWOucFFeIe
 cioRJerT4VpWtpjLaXehIfzL97uUHXQgHGtay/cbX8Bm4G7USE94qEOSv247ltuttLON
 FWZvlfkoXgOy2Ce9yAGBw+jf8FtSsizAUXsGu0gmps/DqljJq9TyozpiVc1kDeCtjKCq
 F0hg==
X-Gm-Message-State: AOAM533qmX4Io5zCUKfigVWjoJA0ZLmA/+hLnT0Z591YXR9Gv4gwig5D
 2zg2EVRd99wDZ6JH+KtK9VJeuRuVGL8=
X-Google-Smtp-Source: ABdhPJypL45+HhifGiCjwA/Cmt5h0JHiGJBss7g5sscdvnoGbpwK4mJBevicFb5X+9kb6uTKGXU67g==
X-Received: by 2002:ac8:4658:: with SMTP id f24mr3840557qto.158.1601393282605; 
 Tue, 29 Sep 2020 08:28:02 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id r187sm4669007qkc.63.2020.09.29.08.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 08:28:01 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 36/45] drm/amdgpu: add TOC firmware support for apu (v3)
Date: Tue, 29 Sep 2020 11:27:49 -0400
Message-Id: <20200929152749.2442370-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200929152749.2442370-1-alexander.deucher@amd.com>
References: <20200929152749.2442370-1-alexander.deucher@amd.com>
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

APU needs load toc firmware for gfx10 series on psp front door loading.

v2: rebase against latest code
v3: clarify error message

Signed-off-by: Huang Rui <ray.huang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 11 ++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h |  7 +++++
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c  | 33 ++++++++++++++++-------
 4 files changed, 77 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index bd0d14419841..26caa8d43483 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -325,6 +325,10 @@ static int amdgpu_firmware_info(struct drm_amdgpu_info_firmware *fw_info,
 		fw_info->ver = adev->dm.dmcub_fw_version;
 		fw_info->feature = 0;
 		break;
+	case AMDGPU_INFO_FW_TOC:
+		fw_info->ver = adev->psp.toc_fw_version;
+		fw_info->feature = adev->psp.toc_feature_version;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1464,6 +1468,13 @@ static int amdgpu_debugfs_firmware_info(struct seq_file *m, void *data)
 	seq_printf(m, "DMCUB feature version: %u, firmware version: 0x%08x\n",
 		   fw_info.feature, fw_info.ver);
 
+	/* TOC */
+	query_fw.fw_type = AMDGPU_INFO_FW_TOC;
+	ret = amdgpu_firmware_info(&fw_info, &query_fw, adev);
+	if (ret)
+		return ret;
+	seq_printf(m, "TOC feature version: %u, firmware version: 0x%08x\n",
+		   fw_info.feature, fw_info.ver);
 
 	seq_printf(m, "VBIOS version: %s\n", ctx->vbios_version);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 18be544d8c1e..62ae7b4ff275 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -2415,6 +2415,42 @@ int psp_init_asd_microcode(struct psp_context *psp,
 	return err;
 }
 
+int psp_init_toc_microcode(struct psp_context *psp,
+			   const char *chip_name)
+{
+	struct amdgpu_device *adev = psp->adev;
+	char fw_name[30];
+	const struct psp_firmware_header_v1_0 *toc_hdr;
+	int err = 0;
+
+	if (!chip_name) {
+		dev_err(adev->dev, "invalid chip name for toc microcode\n");
+		return -EINVAL;
+	}
+
+	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_toc.bin", chip_name);
+	err = request_firmware(&adev->psp.toc_fw, fw_name, adev->dev);
+	if (err)
+		goto out;
+
+	err = amdgpu_ucode_validate(adev->psp.toc_fw);
+	if (err)
+		goto out;
+
+	toc_hdr = (const struct psp_firmware_header_v1_0 *)adev->psp.toc_fw->data;
+	adev->psp.toc_fw_version = le32_to_cpu(toc_hdr->header.ucode_version);
+	adev->psp.toc_feature_version = le32_to_cpu(toc_hdr->ucode_feature_version);
+	adev->psp.toc_bin_size = le32_to_cpu(toc_hdr->header.ucode_size_bytes);
+	adev->psp.toc_start_addr = (uint8_t *)toc_hdr +
+				le32_to_cpu(toc_hdr->header.ucode_array_offset_bytes);
+	return 0;
+out:
+	dev_err(adev->dev, "fail to request/validate toc microcode\n");
+	release_firmware(adev->psp.toc_fw);
+	adev->psp.toc_fw = NULL;
+	return err;
+}
+
 int psp_init_sos_microcode(struct psp_context *psp,
 			   const char *chip_name)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
index 919d2fb7427b..13f56618660a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
@@ -253,6 +253,11 @@ struct psp_context
 	uint32_t			asd_ucode_size;
 	uint8_t				*asd_start_addr;
 
+	/* toc firmware */
+	const struct firmware		*toc_fw;
+	uint32_t			toc_fw_version;
+	uint32_t			toc_feature_version;
+
 	/* fence buffer */
 	struct amdgpu_bo		*fence_buf_bo;
 	uint64_t			fence_buf_mc_addr;
@@ -386,6 +391,8 @@ int psp_ring_cmd_submit(struct psp_context *psp,
 			int index);
 int psp_init_asd_microcode(struct psp_context *psp,
 			   const char *chip_name);
+int psp_init_toc_microcode(struct psp_context *psp,
+			   const char *chip_name);
 int psp_init_sos_microcode(struct psp_context *psp,
 			   const char *chip_name);
 int psp_init_ta_microcode(struct psp_context *psp,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
index 6c5d9612abcb..f2d6b2518eee 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -109,20 +109,16 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		BUG();
 	}
 
-	err = psp_init_sos_microcode(psp, chip_name);
-	if (err)
-		return err;
-
-	if (adev->asic_type != CHIP_SIENNA_CICHLID &&
-	    adev->asic_type != CHIP_NAVY_FLOUNDER) {
-		err = psp_init_asd_microcode(psp, chip_name);
-		if (err)
-			return err;
-	}
 
 	switch (adev->asic_type) {
 	case CHIP_VEGA20:
 	case CHIP_ARCTURUS:
+		err = psp_init_sos_microcode(psp, chip_name);
+		if (err)
+			return err;
+		err = psp_init_asd_microcode(psp, chip_name);
+		if (err)
+			return err;
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
 		err = request_firmware(&adev->psp.ta_fw, fw_name, adev->dev);
 		if (err) {
@@ -150,6 +146,12 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 	case CHIP_NAVI10:
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
+		err = psp_init_sos_microcode(psp, chip_name);
+		if (err)
+			return err;
+		err = psp_init_asd_microcode(psp, chip_name);
+		if (err)
+			return err;
 		if (amdgpu_sriov_vf(adev))
 			break;
 		snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ta.bin", chip_name);
@@ -180,10 +182,21 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
 		break;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
+		err = psp_init_sos_microcode(psp, chip_name);
+		if (err)
+			return err;
 		err = psp_init_ta_microcode(&adev->psp, chip_name);
 		if (err)
 			return err;
 		break;
+	case CHIP_VANGOGH:
+		err = psp_init_asd_microcode(psp, chip_name);
+		if (err)
+			return err;
+		err = psp_init_toc_microcode(psp, chip_name);
+		if (err)
+			return err;
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
