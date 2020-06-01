Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DF1EA9B8
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABA76E2CF;
	Mon,  1 Jun 2020 18:04:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2816E2CF
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:04:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n11so9940151qkn.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8t3sclXT++ggQuIbnhnhKYLH3QopTaJfkaRrHZStkM=;
 b=FeMucNouODgV2fGdfZypUr60jtJzwbCnPkkkZM8NDoI6dfvdLXEGBk3Fd6Z90JmEyD
 CkXcZScY7Wg5a6R0+TMxYVnENKna10GJt/uj3nvo7+K8zlrm87hI/NBWQSgptofOoC3K
 0U5F5P/RDgvWb2NPvMGLKkU80gNR1jVAMPYAoPCoEmRQg9kzAfgmEtg/IyH48iGj593Y
 sLIQGKHtGGl20f6Gke//tJZekLUg24f0NjioxBKayVzRTGTps+GDw8PHUwA/K8QjXj7P
 lIjfr8LR8jQDrVUBV3zylgkM5o2igculdc26eUrV6E5O3vztSYvN67fkNIky2tZHilOz
 yq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8t3sclXT++ggQuIbnhnhKYLH3QopTaJfkaRrHZStkM=;
 b=p9fjPGpSFQ6D6+x9uFDA+WItizAqevgZYduetUQrDSvAm+/Em7ELLxLmd2vRjybEGD
 R2ShCUDbm/ZTTkCene4qWMG8UFJW1VBOHt06AR6RkORi30caxjHMURgKli0J13sOHPoL
 cXHtMXLBwqCIoVBTg6JZLvDYB9LMi8KSR935ByNqVq/teWtV0rh+34uF2xrN8fjqmEzN
 o0EbMNlKLR6QDCeMuY1SdpQXweW6UK147nam1+HxpP9a7qDTOwSc/NPDw/88KUxQpim+
 BT8iADeMK7bNkyYDNiUZk1dZFt3I4qJtsgbRNenPyJB6E2n+EMYaDX9T3A3+xxEpQUnJ
 mGlg==
X-Gm-Message-State: AOAM530lfyF3aw0KRkcPABSqf/SrWPfScx1bHW9PgbmTYb/MXR8dcCND
 lHixXI/K5TGe9TtVBUXTfhydxO/j
X-Google-Smtp-Source: ABdhPJycIjTg0aGuWboCTy4+I+Rb4D3VEbKNZDPx9nedwuv9Ks5CCUACOT8d7b/qznMwAZE6Uq3TYA==
X-Received: by 2002:a37:650:: with SMTP id 77mr22153876qkg.369.1591034673702; 
 Mon, 01 Jun 2020 11:04:33 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:04:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 075/207] drm/amdgpu: upload mes firmware to gpu buffer
Date: Mon,  1 Jun 2020 14:00:27 -0400
Message-Id: <20200601180239.1267430-72-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jack Xiao <Jack.Xiao@amd.com>

Copy mes firmware to gpu buffer.

Signed-off-by: Jack Xiao <Jack.Xiao@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
index 74ac14466a78..cf3438696fce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
@@ -449,6 +449,7 @@ static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
 	const struct gfx_firmware_header_v1_0 *cp_hdr = NULL;
 	const struct dmcu_firmware_header_v1_0 *dmcu_hdr = NULL;
 	const struct dmcub_firmware_header_v1_0 *dmcub_hdr = NULL;
+	const struct mes_firmware_header_v1_0 *mes_hdr = NULL;
 
 	if (NULL == ucode->fw)
 		return 0;
@@ -463,12 +464,15 @@ static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
 	cp_hdr = (const struct gfx_firmware_header_v1_0 *)ucode->fw->data;
 	dmcu_hdr = (const struct dmcu_firmware_header_v1_0 *)ucode->fw->data;
 	dmcub_hdr = (const struct dmcub_firmware_header_v1_0 *)ucode->fw->data;
+	mes_hdr = (const struct mes_firmware_header_v1_0 *)ucode->fw->data;
 
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP ||
 	    (ucode->ucode_id != AMDGPU_UCODE_ID_CP_MEC1 &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_CP_MEC2 &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_CP_MEC1_JT &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_CP_MEC2_JT &&
+	     ucode->ucode_id != AMDGPU_UCODE_ID_CP_MES &&
+	     ucode->ucode_id != AMDGPU_UCODE_ID_CP_MES_DATA &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_RLC_RESTORE_LIST_CNTL &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_RLC_RESTORE_LIST_GPM_MEM &&
 	     ucode->ucode_id != AMDGPU_UCODE_ID_RLC_RESTORE_LIST_SRM_MEM &&
@@ -528,6 +532,16 @@ static int amdgpu_ucode_init_single_fw(struct amdgpu_device *adev,
 		ucode->ucode_size = adev->gfx.rlc.save_restore_list_srm_size_bytes;
 		memcpy(ucode->kaddr, adev->gfx.rlc.save_restore_list_srm,
 		       ucode->ucode_size);
+	} else if (ucode->ucode_id == AMDGPU_UCODE_ID_CP_MES) {
+		ucode->ucode_size = le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
+		memcpy(ucode->kaddr, (void *)((uint8_t *)adev->mes.fw->data +
+			      le32_to_cpu(mes_hdr->mes_ucode_offset_bytes)),
+		       ucode->ucode_size);
+	} else if (ucode->ucode_id == AMDGPU_UCODE_ID_CP_MES_DATA) {
+		ucode->ucode_size = le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
+		memcpy(ucode->kaddr, (void *)((uint8_t *)adev->mes.fw->data +
+			      le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes)),
+		       ucode->ucode_size);
 	}
 
 	return 0;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
