Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058582791A1
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Sep 2020 22:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823A36ED5E;
	Fri, 25 Sep 2020 20:11:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D706ED58
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 20:11:11 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id c18so3087474qtw.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Sep 2020 13:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IJYQC5AJ5ldzBQjY2T6xvUqKYb6IBj47enz5jAUbYj4=;
 b=d6q1aHMKXaDyrng71lRvgimHLjtde3FBDKdqqzGV8Ay6sckR5hyQ71ga+I/ePe9eIm
 fJN3KBFG+ZrLyhvF3L4+ogKFMm2Xsp21UAlSw4s1n8Hjz6fTDy/9yFfJEA6XdioGBvUu
 3L24R5EdMr4jcEecT0qALKivoz0tKXlIwK3aC7H3mbOD/B1wmcVjiIcv2ThfKUzslbQ1
 tGf8QTFvLAPwoFJ1/G/frnQ7R04Q7IGfyhB5NyzBlqPfi2G/IwQORx8T5tC8B0E5v5YS
 kt1d/Qaz/ZGn1cYPi6B2Sll8mrR7GnJOt+hrKBtonLGpUfrg9MbFK45GjEI10QiIKema
 pHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IJYQC5AJ5ldzBQjY2T6xvUqKYb6IBj47enz5jAUbYj4=;
 b=bS8bicoTZsbgVoZBVCdWVeB/kznX8ywdVLIbfzJMXHc18rAE2XgbPCVFGKtAiZvreG
 gp9Fz3NE760NmVu87DwuFmMTTjogk+nIVA5yeyu7D0+WaVsSMp5zDAvEi8HVoZ64qCGJ
 SD/6BfK5rQX1Lt+5JzqnmKJOhMg0Q19LHTFBbIN8xMmwXEKeymp0Odh5AC9EZqT0wzFB
 5DBakdZ1l4hYtlYCjCnXyPlhgaxUSEQPhyS2BtSC14XPgpCozt276yxkUdRjkLOOWmO5
 B6HB5gLxSjJLCdssVAEohNmTRCeVasLOBsKW8VDfLAUcL+df0AuJyRn9o8WuzJH862E5
 7ufg==
X-Gm-Message-State: AOAM530AvxC6PMmRRo1tiTKzz7goRH6peBX0UF73QI/0kNidxyHX2wY/
 btq7il5FDAAzPiVhtPPzPIkLi7E6bKQ=
X-Google-Smtp-Source: ABdhPJwmrLimoOiFjoVESH2L3mAFDTnsFFKUZ397DuwXwU+XsUlBGJ4UibgQqXJnoRGxFPFtjmLoRg==
X-Received: by 2002:aed:2c61:: with SMTP id f88mr1460319qtd.388.1601064670448; 
 Fri, 25 Sep 2020 13:11:10 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id m67sm2301237qkf.98.2020.09.25.13.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 13:11:09 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/45] drm/amdgpu: update new memory types in atomfirmware
 header
Date: Fri, 25 Sep 2020 16:09:55 -0400
Message-Id: <20200925201029.1738724-11-alexander.deucher@amd.com>
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

Add new nemory types in atomfirmware header.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/include/atomfirmware.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 3e526c394f6c..0799a9ca0440 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -1367,6 +1367,11 @@ enum atom_dmi_t17_mem_type_def{
   LpDdr2MemType,                                        ///< Assign 28 to LPDDR2
   LpDdr3MemType,                                        ///< Assign 29 to LPDDR3
   LpDdr4MemType,                                        ///< Assign 30 to LPDDR4
+  GDdr6MemType,                                         ///< Assign 31 to GDDR6
+  HbmMemType,                                           ///< Assign 32 to HBM
+  Hbm2MemType,                                          ///< Assign 33 to HBM2
+  Ddr5MemType,                                          ///< Assign 34 to DDR5
+  LpDdr5MemType,                                        ///< Assign 35 to LPDDR5
 };
 
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
