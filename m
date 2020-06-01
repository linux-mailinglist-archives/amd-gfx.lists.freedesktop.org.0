Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6871EABF9
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D9B6E197;
	Mon,  1 Jun 2020 18:29:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F786E197
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:37 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id g28so9303984qkl.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vx5PpTcmFTMIp9NmzSu709Y00HdDZc6fKuZZtZ/vebs=;
 b=PQLnKUpF7U9ffrZ30Yk9IQ1FnVge40u3lpBDhGJKAzoxbQi5+WXgNS3nbGGdM8SfcL
 0T+CPQAHJR1DIctfbRrQxZdR8iwvXvsfT5qy5TAGNbABEaW0oFvYLFvAUyMF/6LtQRwO
 rfpfQtF8xdJ2nQ2BgnX2Lgh9Z0/sFERc83uc3eVKFxkOowEm79FIFkdhGyCBeM2HNuiU
 tu2E3rUA7sxjaB1sn9oOBRbSMOOsoZHNfTB5s7hUD9UJl/g1rF7s0pJKmcvLddoYJAtJ
 NdIX1GkJQwd6ZKeuXiIuzeL+JnIDEtBMNsDpo3DN5/WBPq4+w4y9i+ine/wy8oZzGsWG
 Dxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vx5PpTcmFTMIp9NmzSu709Y00HdDZc6fKuZZtZ/vebs=;
 b=JgoVTcyvPn6aWv6GMHgFiU4zVrvswgUXqp2HYpz5m6ziV390h3MWx38oMPz7UBt4J8
 OQ9yrT99u9axKvl0A+M8dQ2WPC7VCugyd7fZVVcVLLcX9buhI5mUdA+or+AvqI9L82+r
 ZNAiU4Q/K39R383KHD9aHn9a4VocJjnlLEdrZAYY21wuByfqDRGUI6Hdnc/a2lcU+fm2
 7yH/5fLSREq8xNbmZLEckWL+5MBWwwoQobuxf7dK9YA2U89NuSI99cx8z0SYF0Ka2iI/
 vs0damCK262GMp0euD9KIPhfKMojrmylRX8XLwJI+G5tMVvw+SJoJEw8hE7Wuvq4HRiX
 L6Cg==
X-Gm-Message-State: AOAM532Lq6V1U0I2zsNMGA9jq566XD0WVmMr4Q0RkBLfK4Pk/KsLR5Ng
 uKs8QXl2gOIizD9YgrhqHW5XThHk
X-Google-Smtp-Source: ABdhPJyEAmkmE1e5O2Ai7+PG34NDoCYfBwmTkJXJzpjFu53t/kB4zVj070vyT3LKvWYoAJb9nyiTww==
X-Received: by 2002:a37:be05:: with SMTP id o5mr6486840qkf.309.1591036175180; 
 Mon, 01 Jun 2020 11:29:35 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 179/207] drm/amd/display: Add DCN3 chip ids
Date: Mon,  1 Jun 2020 14:28:58 -0400
Message-Id: <20200601182926.1267958-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/include/dal_asic_id.h | 4 ++++
 drivers/gpu/drm/amd/display/include/dal_types.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index 2359e88d6029..abeb58d544b1 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -166,6 +166,7 @@ enum {
 	NV_NAVI10_P_A0      = 1,
 	NV_NAVI12_P_A0      = 10,
 	NV_NAVI14_M_A0      = 20,
+	NV_SIENNA_CICHLID_P_A0      = 40,
 	NV_UNKNOWN          = 0xFF
 };
 
@@ -173,6 +174,9 @@ enum {
 #define ASICREV_IS_NAVI12_P(eChipRev)        ((eChipRev >= NV_NAVI12_P_A0) && (eChipRev < NV_NAVI14_M_A0))
 #define ASICREV_IS_NAVI14_M(eChipRev)        ((eChipRev >= NV_NAVI14_M_A0) && (eChipRev < NV_UNKNOWN))
 #define ASICREV_IS_RENOIR(eChipRev) ((eChipRev >= RENOIR_A0) && (eChipRev < RAVEN1_F0))
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0))
+#endif
 
 /*
  * ASIC chip ID
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 0b6859189ca7..b67c9fa6b9cd 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -48,6 +48,7 @@ enum dce_version {
 	DCN_VERSION_1_01,
 	DCN_VERSION_2_0,
 	DCN_VERSION_2_1,
+	DCN_VERSION_3_0,
 	DCN_VERSION_MAX
 };
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
