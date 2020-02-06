Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E1415450C
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Feb 2020 14:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5B06EA81;
	Thu,  6 Feb 2020 13:37:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6182D89CF4
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Feb 2020 11:40:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x14so5713455ljd.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Feb 2020 03:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sph6Efqnm8pYMBxdeg7d4ruTcPmnqkNKvwpaxWSeSBY=;
 b=BVDpD6NXC794bxAMzPsqTl1boCD5PuG0Ot0WtCBWR7AAUxYlzB+3/LifRynGPhRwd9
 vEfO47B3GLLk5FFQE6uVVDj3lU7Uk7tEhYAWrjmlm5OqYu6GMpixjrMa12ahMkMCoh98
 WT9jxPoG8KY9iMuznnnS7ePqMkOI7UecqcQPv+LTHacbzgxFyCP4Dx850tw0fn+EgoRs
 R5hJxXM2gdvWmrWNUiVgM3JMsLW6cnC3rXHNXj5/KPkTxsEe7S9CEpTQ8ItYaJ7LROSv
 KiMqUghA26mEUap1dTx4FQ8eQrqUjq59Qhn7FfufcWE1HYrGztsMvjqMCc4V25Hvj6yr
 /Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sph6Efqnm8pYMBxdeg7d4ruTcPmnqkNKvwpaxWSeSBY=;
 b=DYw2UnE9lWRbnvtgb8wWCDeN4OqQvmsV20xdhmcWhdOoVLDOHnyMCSwE2K76npmq2r
 vH7GxBvQlt8IT+uccTPA2+UR2b6PsFBO+oR2i55ok4mt0tCxMa3593sAYC+39z9qoFNB
 0CD7ifc7iRVCykN876bCdM0h5l1TNjsW6LqFGwODDOQhCRSBaqRWjEh1C4261UECT5oL
 +u0519ldGWyIqnE4RQsDIR5tUhqI92M3SOMjWqK7sognjgh4+TAYskzKhwRiLw6j6/1I
 nrCq/xwUavwIybXeP8HJfnkGEWBJJHPfQLgIYrmLQAr2sCMDpR44uzBY9mGaEXY8iEqJ
 +Xhw==
X-Gm-Message-State: APjAAAXUZkbvi0LX5IFoo6LuWFKZsIUbz4Gcx+yBnK3aVjRKafxLyU2s
 AZT1v2vGVH8Pj08W/CbKMb6x+5gDJYVNmQ==
X-Google-Smtp-Source: APXvYqz8CHrjLSao0RKR41iwoLoL6T3o58Cd+7aczvBxhDfQ3feh518g7zLiriP7pm9OM+U/eHO8YQ==
X-Received: by 2002:a2e:860c:: with SMTP id a12mr1861934lji.146.1580989214509; 
 Thu, 06 Feb 2020 03:40:14 -0800 (PST)
Received: from x299.lan ([2a02:2698:542a:d07::500])
 by smtp.gmail.com with ESMTPSA id i1sm1236628lji.71.2020.02.06.03.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 03:40:13 -0800 (PST)
From: Aleksandr Mezin <mezin.alexander@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/smu11: fix
 SMU_11_0_ODFEATURE_ID/navi10_od_feature_is_supported()
Date: Thu,  6 Feb 2020 17:39:46 +0600
Message-Id: <20200206113946.114235-1-mezin.alexander@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 13:37:05 +0000
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
Cc: Aleksandr Mezin <mezin.alexander@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

navi10_od_feature_is_supported() function uses enum values as array index. But
the enum values are defined like bit flags.

Starting from SMU_11_0_ODFEATURE_FAN_SPEED_MIN the function would read past the
end of 'cap' array.

I've been unable to find any uses of this enum except in the aforementioned
function, so fixing the enum seems to be the correct solution.

Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>
---
 .../drm/amd/powerplay/inc/smu_v11_0_pptable.h | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_pptable.h b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_pptable.h
index b2f96a101124..ba720630cc4b 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_pptable.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0_pptable.h
@@ -40,20 +40,20 @@
 #define SMU_11_0_PP_POWERSAVINGCLOCK_VERSION            0x0100
 
 enum SMU_11_0_ODFEATURE_ID {
-    SMU_11_0_ODFEATURE_GFXCLK_LIMITS        = 1 << 0,         //GFXCLK Limit feature
-    SMU_11_0_ODFEATURE_GFXCLK_CURVE         = 1 << 1,         //GFXCLK Curve feature
-    SMU_11_0_ODFEATURE_UCLK_MAX             = 1 << 2,         //UCLK Limit feature
-    SMU_11_0_ODFEATURE_POWER_LIMIT          = 1 << 3,         //Power Limit feature
-    SMU_11_0_ODFEATURE_FAN_ACOUSTIC_LIMIT   = 1 << 4,         //Fan Acoustic RPM feature
-    SMU_11_0_ODFEATURE_FAN_SPEED_MIN        = 1 << 5,         //Minimum Fan Speed feature
-    SMU_11_0_ODFEATURE_TEMPERATURE_FAN      = 1 << 6,         //Fan Target Temperature Limit feature
-    SMU_11_0_ODFEATURE_TEMPERATURE_SYSTEM   = 1 << 7,         //Operating Temperature Limit feature
-    SMU_11_0_ODFEATURE_MEMORY_TIMING_TUNE   = 1 << 8,         //AC Timing Tuning feature
-    SMU_11_0_ODFEATURE_FAN_ZERO_RPM_CONTROL = 1 << 9,         //Zero RPM feature
-    SMU_11_0_ODFEATURE_AUTO_UV_ENGINE       = 1 << 10,        //Auto Under Volt GFXCLK feature
-    SMU_11_0_ODFEATURE_AUTO_OC_ENGINE       = 1 << 11,        //Auto Over Clock GFXCLK feature
-    SMU_11_0_ODFEATURE_AUTO_OC_MEMORY       = 1 << 12,        //Auto Over Clock MCLK feature
-    SMU_11_0_ODFEATURE_FAN_CURVE            = 1 << 13,        //VICTOR TODO
+    SMU_11_0_ODFEATURE_GFXCLK_LIMITS        = 0,         //GFXCLK Limit feature
+    SMU_11_0_ODFEATURE_GFXCLK_CURVE         = 1,         //GFXCLK Curve feature
+    SMU_11_0_ODFEATURE_UCLK_MAX             = 2,         //UCLK Limit feature
+    SMU_11_0_ODFEATURE_POWER_LIMIT          = 3,         //Power Limit feature
+    SMU_11_0_ODFEATURE_FAN_ACOUSTIC_LIMIT   = 4,         //Fan Acoustic RPM feature
+    SMU_11_0_ODFEATURE_FAN_SPEED_MIN        = 5,         //Minimum Fan Speed feature
+    SMU_11_0_ODFEATURE_TEMPERATURE_FAN      = 6,         //Fan Target Temperature Limit feature
+    SMU_11_0_ODFEATURE_TEMPERATURE_SYSTEM   = 7,         //Operating Temperature Limit feature
+    SMU_11_0_ODFEATURE_MEMORY_TIMING_TUNE   = 8,         //AC Timing Tuning feature
+    SMU_11_0_ODFEATURE_FAN_ZERO_RPM_CONTROL = 9,         //Zero RPM feature
+    SMU_11_0_ODFEATURE_AUTO_UV_ENGINE       = 10,        //Auto Under Volt GFXCLK feature
+    SMU_11_0_ODFEATURE_AUTO_OC_ENGINE       = 11,        //Auto Over Clock GFXCLK feature
+    SMU_11_0_ODFEATURE_AUTO_OC_MEMORY       = 12,        //Auto Over Clock MCLK feature
+    SMU_11_0_ODFEATURE_FAN_CURVE            = 13,        //VICTOR TODO
     SMU_11_0_ODFEATURE_COUNT                = 14,
 };
 #define SMU_11_0_MAX_ODFEATURE    32          //Maximum Number of OD Features
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
