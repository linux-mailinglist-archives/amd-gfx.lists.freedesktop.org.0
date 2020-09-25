Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 268B72791A7
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CE36ED67;
	Fri, 25 Sep 2020 20:11:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B237E6ED65
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:20 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id db4so2043607qvb.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qv1ZfNeQLklo/JcGqCvBKCPM4qN+zqkLC7KpxPhxGu8=;
 b=Fwhu5RuyKA4nRzTRnKRmwAiKJ8Esfa8c1//XD8vKvi2B74gjJGa5YE7OsOKDRKdLay
 4aHb0rEEbeBud6cYaig1hZDW2OxGrYGQITe25YYmkyt/EHpJuLTRpMZNWYGXk+KDmq3e
 yAFHrfHAu6x4H4mQNvlAyMuQnzw2ta0HOS3jTEjTtaQ1himh8jq66Zw1Uep4/2dEkp/8
 V2dWHv9hoom3F6roGLay8dO/RmbVC15JSrF13k0nhKmZ0wLI9MZIYPuzGbg2MJNRYkgj
 gCDiyObtA5Bdp/DhCbyqOubHB06cOOilKxSo5US0rw+1IvDULofDhQcOkDGdyNGIDMkd
 rufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qv1ZfNeQLklo/JcGqCvBKCPM4qN+zqkLC7KpxPhxGu8=;
 b=ZfSzLvQvckrPTEZ6gK7bJvH6csPfENo3jLMPUt6tkCGlGf8yhbKjRblsvuDgsLvPIC
 xrPD6uoEas0Fdq6hhgIcFPzFjJ3QoRVEfao5k1Y7E68syDy/7wJ32ijfOqVybOsVrDOx
 MxYAKo6xGmFRAaTSPxlb3iUMmjeUwSI6RAQV+014QC0Ie3sM2V1MfEINXRoY5VA1ITg8
 dz72HB+Go6+B/gU5yPy02V56o10lXwUM7sH86GRxKEz3HoZaUt37laJfE9V/9ZHi0pfL
 ZRlrz1WOzj5f2PTSGaP518Fxn9r7G9cyMGXKipDzJPcWtH/trOHieehjCnEpWzlIrLYg
 YMEQ==
X-Gm-Message-State: AOAM532noc+nsF6wddBAJz9dDTk8c9rKLJIkZa8o137alP6+LJ8V9Spm
 04xb+6FQbl5VsurnS4xJyI+/MFSQjOc=
X-Google-Smtp-Source: ABdhPJzuAFAOl3KLbjDfBBVeUF+8GwnRzRUXc/qHvumUru20xgWUrLcZT0+9P3LL+hzoeGuyPr18CA==
X-Received: by 2002:a0c:80c3:: with SMTP id 61mr331536qvb.13.1601064678746;
 Fri, 25 Sep 2020 13:11:18 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/45] drm/amdgpu/gfx10: add updated register offsets for VGH
Date: Fri, 25 Sep 2020 16:10:02 -0400
Message-Id: <20200925201029.1738724-18-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 6999228cd6c0..83183541865f 100755
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -99,8 +99,22 @@
 #define mmGCR_GENERAL_CNTL_Sienna_Cichlid			0x1580
 #define mmGCR_GENERAL_CNTL_Sienna_Cichlid_BASE_IDX	0
 
-#define mmSPI_CONFIG_CNTL_1_Vangogh		0x2441
-#define mmSPI_CONFIG_CNTL_1_Vangogh_BASE_IDX	1
+#define mmSPI_CONFIG_CNTL_1_Vangogh		 0x2441
+#define mmSPI_CONFIG_CNTL_1_Vangogh_BASE_IDX	 1
+#define mmVGT_TF_MEMORY_BASE_HI_Vangogh          0x2261
+#define mmVGT_TF_MEMORY_BASE_HI_Vangogh_BASE_IDX 1
+#define mmVGT_HS_OFFCHIP_PARAM_Vangogh           0x224f
+#define mmVGT_HS_OFFCHIP_PARAM_Vangogh_BASE_IDX  1
+#define mmVGT_TF_RING_SIZE_Vangogh               0x224e
+#define mmVGT_TF_RING_SIZE_Vangogh_BASE_IDX      1
+#define mmVGT_GSVS_RING_SIZE_Vangogh             0x2241
+#define mmVGT_GSVS_RING_SIZE_Vangogh_BASE_IDX    1
+#define mmVGT_TF_MEMORY_BASE_Vangogh             0x2250
+#define mmVGT_TF_MEMORY_BASE_Vangogh_BASE_IDX    1
+#define mmVGT_ESGS_RING_SIZE_Vangogh             0x2240
+#define mmVGT_ESGS_RING_SIZE_Vangogh_BASE_IDX    1
+#define mmSPI_CONFIG_CNTL_Vangogh                0x2440
+#define mmSPI_CONFIG_CNTL_Vangogh_BASE_IDX       1
 
 #define mmCP_HYP_PFP_UCODE_ADDR			0x5814
 #define mmCP_HYP_PFP_UCODE_ADDR_BASE_IDX	1
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
