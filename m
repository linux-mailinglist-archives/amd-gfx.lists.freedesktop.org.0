Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A0AD9274
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1731710EA21;
	Fri, 13 Jun 2025 16:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="zA819zyX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F10610E312
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Jun 2025 21:22:07 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-23636167afeso15667065ad.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Jun 2025 14:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749590527; x=1750195327;
 darn=lists.freedesktop.org; 
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=ltRg+v/yp8EdLDcNG6KLLiNgJ14XsdfIIIkgnAoB4zk=;
 b=zA819zyXnBfLTb/X5JjopPaDFySFnXOlXUPS8ThTMYNVW9lefPCwM3SizArVc17G8c
 JrNTU/ZFxYhB0AIl7OCq5RI5/m3uDCtVk+AaMGk0ZnGcSkNKKTLT8f4zWdt5hhBZfoBG
 bOfEQHVWgI9aVah7+a74hdd6r/1MLAV4vQUkdYXC+Qsg/n2+hOuYgO+BFa9ZV64WYKXq
 9kco6VOtOBNRbIeZHe0Hbw51m8DXfl4xywK+8VW3Y+YbUXP6tWCRvEArwyLY4WmGHBa/
 xg1WcFkJJUJVHNulv6iXJ/KYL0XRHJP1UUMupldviN1LoQxZ6dmkKzyiOHVHITRfHhPA
 yDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749590527; x=1750195327;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ltRg+v/yp8EdLDcNG6KLLiNgJ14XsdfIIIkgnAoB4zk=;
 b=m4w86o4qwrMtFy4e72ZZBF+iGtFgRM6VytrEg82xQ20zaOZcy7/zdQ7ddGMAcJweTy
 arajGYBURLvMz3lpaOQVkgech5O8tRvW1Gxj/Gcd1pvwdoM8+UTJ75bLkjuNQpYW7oEZ
 Sfk0Fo1lHTNzsaKKKr2MoPtllplXx1SKL74arZWze7EaQiiFRDiGoCcbg113HJ9GrWp0
 hmKUWqUR5fgMohkvJvEFTLs2pr3IdXBakQrLb7Lnq/EsbIlN0rzE3ARakPHXEdRdXlvf
 MydgqMt75tPudBjljxr93KMZfXoFWdavID41LVdyhKS+tK60RAnvSDzzJUNisEO+Ke+k
 Nc8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdXQm7/uVDXaR+pF/fVFJd/OdSJGmAHUoEqQM2uh/8nzx+2S3xtWbdDlyTXOjntB+PV7vMoVoM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsTu46fImXcDaoYd3H64SPV45F0VjKnpkAmWalTFqMuOWyhHKX
 fTxvqkpVTLwrobkXgpU6Q68wLxhzrFiaFykBSPs90dQMF2CaxqluYCiLL8QgL0RVdxU=
X-Gm-Gg: ASbGncsjAgq//lB4haVHW6aFI32GrR4Xgt6tKJn1N8zCpQqHCUgoBtV8jjU4Be26JkC
 F+m1vV9X+0C25hNvPxy7zG08H1QaDkJWnY3TcEz52cYPIav+PSFtS7oSIBxgHe1qW1yP0WopzNv
 VfwpWpJbhtejQBj4LjiDFrpAqw990LBCHTAmlE84+h65XisqDmaTfPIsnbB46WtK3Iqc05iAR+k
 G4yuf2TSCroBxaYu7aIa63Jd6WHg+KnUrXRSrt23Df43pFHhZaAigpSg0c8PWxAej1HD0BODEYO
 SuLQ4dR45l8FnXUqCt20DB2sUBOM02NEiZA7mtuORM1yHw0nlgcwjXcKLzEJ
X-Google-Smtp-Source: AGHT+IFwY/pTpiIL3M0yGU8xm4GvMzafomO0b0H11xHhVJH6uvNlNsGipFpdPVAVO6VcJAOc5TJEzw==
X-Received: by 2002:a17:903:94c:b0:234:ba37:879e with SMTP id
 d9443c01a7336-23641b14d3dmr10940325ad.38.1749590527026; 
 Tue, 10 Jun 2025 14:22:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
 by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23603077f2csm75418715ad.36.2025.06.10.14.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 14:22:06 -0700 (PDT)
Subject: [PATCH] drm/amd/pm: Avoid more large frame warnings
Date: Tue, 10 Jun 2025 14:21:41 -0700
Message-Id: <20250610212141.19445-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, asad.kamal@amd.com, lijo.lazar@amd.com,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexander.deucher@amd.com
X-Mailman-Approved-At: Fri, 13 Jun 2025 16:05:52 +0000
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

From: Palmer Dabbelt <palmer@dabbelt.com>

9KiB frames seem pretty big, but without this I'm getting some warnings
as of 6.16-rc1

      CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
    drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
     2885 | }
          | ^
    cc1: all warnings being treated as errors

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 51f1fa9789ab..9824b7f4827f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,9 +23,19 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
+ifneq ($(CONFIG_FRAME_WARN),0)
+    frame_warn_limit := 9216
+    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
+        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
+    endif
+endif
+
 SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
 	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
 AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
+
+CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
+CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)
-- 
2.39.5 (Apple Git-154)

