Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D254241DC2
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Aug 2020 18:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B8236E5B6;
	Tue, 11 Aug 2020 16:05:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15996E5B6
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 16:05:07 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w9so9785717qts.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Aug 2020 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwUhasSdtXh1mJRt/UyMgfMvNuKGgDHLuMu1+9giF/Y=;
 b=E1HbtwEI3iqS4Ja+EXoQZwk4ujhzmS21kSb/nAdWJTA2V+6Dw1LB9u9BD8QpioIXZR
 uD9HsOAm0DE0VMubrXUmtES4ATTUNVEi+rc7sXe5PLjoerekeKTy4XX4pmBsxyg5+RsK
 zG5DHQ43Dnj0hTLbyABNWFQhbSb0AoTcPNbfPSEOD0HfhqJAd13SYeec3U0utCe2Y9va
 kaT3oCTmVjpW+cFa2bUg7zXnBjEm4TaHUtz7OuFon84ePckR2SgaH4iWA55ozs3M9lWx
 6EzoFKBMGAjD4Gl8Niaq/T9yQ0PrHY4prlul6BFgMIPruuv1WXXQPnI8fudMquMJVjDL
 R8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SwUhasSdtXh1mJRt/UyMgfMvNuKGgDHLuMu1+9giF/Y=;
 b=JRTpxiTvqCRue9CUvQ4IyeB7zQvJM3xieJDr/L41SwmQPOhiQbmmmnIqbHXFpkRSoo
 lNJ94BUQtBxOhpdYxEFXmSBJncxMNP2jTcuNUfpr3U4DPzN2zGWzelgtEreyJTxuW7mk
 tWbrS/kK8lFjKnS7k7jneKelfIGp/0H1Qcd+afISe8ExiUMLau9xoFjRjytlJOFKNYA5
 H4vK72B4eXASa9H1EqKJj2VD/iKPeywMotEnjEZNWujPsjnDEqfMMaQ0KEKjoaO2VoX5
 L1FIvO715/GUuY7EzCtE3fPUFhm9/CzzAyg8W9+9EBwUnofKROLu0PsxcDSvNB1MlxFT
 ysog==
X-Gm-Message-State: AOAM533wPgsbFQn1dYwsun5NdvG3aF08ED+qqARy1xiqJ2kY2dPZ5E53
 X1PfwULz0iD9+XxQqYjUtxL+1oF+
X-Google-Smtp-Source: ABdhPJyxgUUBDNSeIGkJPFyO/0at/ZvU2XhyCKMhpZNp4EtlGUnf1zyDmJU01ay5FJh0gpBPplODvw==
X-Received: by 2002:ac8:1e95:: with SMTP id c21mr1819009qtm.306.1597161906337; 
 Tue, 11 Aug 2020 09:05:06 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id e23sm18971868qto.15.2020.08.11.09.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 09:05:05 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: print where we get the vbios image from
Date: Tue, 11 Aug 2020 12:04:56 -0400
Message-Id: <20200811160457.1073325-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ACPI, ROM, PCI BAR, etc.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 28 ++++++++++++++++++------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index b1172d93c99c..6333cada1e09 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -417,26 +417,40 @@ static inline bool amdgpu_acpi_vfct_bios(struct amdgpu_device *adev)
 
 bool amdgpu_get_bios(struct amdgpu_device *adev)
 {
-	if (amdgpu_atrm_get_bios(adev))
+	if (amdgpu_atrm_get_bios(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from ATRM\n");
 		goto success;
+	}
 
-	if (amdgpu_acpi_vfct_bios(adev))
+	if (amdgpu_acpi_vfct_bios(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from VFCT\n");
 		goto success;
+	}
 
-	if (igp_read_bios_from_vram(adev))
+	if (igp_read_bios_from_vram(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from VRAM BAR\n");
 		goto success;
+	}
 
-	if (amdgpu_read_bios(adev))
+	if (amdgpu_read_bios(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from ROM BAR\n");
 		goto success;
+	}
 
-	if (amdgpu_read_bios_from_rom(adev))
+	if (amdgpu_read_bios_from_rom(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from ROM\n");
 		goto success;
+	}
 
-	if (amdgpu_read_disabled_bios(adev))
+	if (amdgpu_read_disabled_bios(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from disabled ROM BAR\n");
 		goto success;
+	}
 
-	if (amdgpu_read_platform_bios(adev))
+	if (amdgpu_read_platform_bios(adev)) {
+		dev_info(adev->dev, "Fetched VBIOS from platform\n");
 		goto success;
+	}
 
 	DRM_ERROR("Unable to locate a BIOS ROM\n");
 	return false;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
