Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58542A585E5
	for <lists+amd-gfx@lfdr.de>; Sun,  9 Mar 2025 17:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA4E10E278;
	Sun,  9 Mar 2025 16:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FigFILv6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA9910E1CD
 for <amd-gfx@lists.freedesktop.org>; Sun,  9 Mar 2025 16:49:16 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-7c3d3147b81so391414685a.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 09 Mar 2025 09:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741538951; x=1742143751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mRwHOrfDxyov+KW5yGvnAYZr745I/1HwH/aKXMogXik=;
 b=FigFILv6dwo/+cKAhQlRQriEHbdafUwavqwi0qQ11otBTK1PDDQXsNjjxIYot21uOD
 UYPTaTNX2Nd7+A6uWiQPw/elHHzPXjx+eW0y/uDcqWZwkqCJnAkXzEiRI3CXD1JcjxYA
 Zfu28JGUlbDKM+BC+fSZrkHfoyGLJEjFKZPEYHIkjlsDIhtGZEO8kjwLQ14IWVnXkdDD
 zHr3/kjrPHmYLO1BJXNAZz3VyoG9Gz2qOLY7DzIND04aLP3MApcL6DUXnnQtPoxNWWTz
 z9qxAVkDkKtshmmXoIu9EejopCPMl6LYIGmr/pA8js7/HdVzGSQgXClbocl0SG4sen4L
 6TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741538951; x=1742143751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mRwHOrfDxyov+KW5yGvnAYZr745I/1HwH/aKXMogXik=;
 b=QvnFLQl8UBKGyJdI1nGDeAy0BQcKa3VNQkwFzfouWYj/+2JkKJf0g21J7rUPcDiK4z
 shBhmAdfqaNKLgUHBiZ85IqCUIILhroRL2QkVCWUdesI2B9/vdHMHpYLsgilURyO8CC1
 9VLYUj/pJdhYz6PcrEKAPRxKpLLALyA0YOyq9w0/uID8zQcGSuUEB+G0+6Oo8Fhz3Y0H
 fhhljVvEAQwPDG0jJpmw4sZ128hqbh/JICrZ8h6iarcePkR2M3HyfcXro23Y70hAfECu
 FTrNRDF4jJFFuefP119Jw6sPYRy20Wt7xjCy+msIZlosakgkuIh7x/cGzP7vNeBubB6U
 ycGA==
X-Gm-Message-State: AOJu0YxQSjOvij/ZMvRuPoI1QKDfTk52gtxlNRhXYj1BLYRakihGeJgl
 98Vahbatk77efDgMkcbchNpl951YmtN6DGfKAyR7cXpp6Uj0x+U5Le4eWQ==
X-Gm-Gg: ASbGncuj3K5cmn9ip1sROXYtZdv1aZlYLbPqBtXvI0xJhDWbdwpBB9UR4qHNrURLjTj
 6rgD93AbVFYtGRBEs5Z3yM3hERva3CI3Mfh8/kIfacepGhuY2wmpGNVZ1qe2r8CenFN7T/Dalzc
 GDtTrfxewoJ0u8PvrfyhGqltlwaAaptuG+CiKulV+Mv3rnMNlVzvNWR8YTymTMh3oaR7+TKaLov
 sckAu1XIHKf4zwz1ASeC7/VNCPGEZfCFaK4FCAW/znQstFPv2J2flJRSxqRnLW3w7PTixRgYPzl
 KXYBzmauvWits5K0moBryR5knyx2gSnWkHlDD4vAut9v/SIWHPXKGrmdD9VcbRWzI+4=
X-Google-Smtp-Source: AGHT+IG9UTkoN97Vlxj3EXQZBx6yinODRCIIYDd8l6GVe5j0OdYjEb4ObXMcu77sshE+TDB9Bn4y0Q==
X-Received: by 2002:a05:620a:6186:b0:7c5:5003:81c5 with SMTP id
 af79cd13be357-7c550038357mr206981385a.52.1741538950612; 
 Sun, 09 Mar 2025 09:49:10 -0700 (PDT)
Received: from localhost.localdomain ([38.74.25.248])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c53e2ff59bsm236996385a.1.2025.03.09.09.49.09
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 09:49:10 -0700 (PDT)
From: Alexandre Demers <alexandre.f.demers@gmail.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/3] drm/amdgpu: prepare DCE6 uniformisation with DCE8 and
 DCE10
Date: Sun,  9 Mar 2025 12:48:50 -0400
Message-ID: <20250309164852.3936628-2-alexandre.f.demers@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309164852.3936628-1-alexandre.f.demers@gmail.com>
References: <20250309164852.3936628-1-alexandre.f.demers@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Let's begin the cleanup in sid.h to prevent warnings and errors when wiring
sid.h into dce_v6_0.c.

This is a bigger cleanup.
Many defines found under sid.h have already been properly moved
into the different "_d.h" and "_sh_mask.h", so they should have been
already removed from sid.h and properly linked in where needed.

Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c |  10 +-
 drivers/gpu/drm/amd/amdgpu/si.c       |  68 +++---
 drivers/gpu/drm/amd/amdgpu/sid.h      | 336 +-------------------------
 3 files changed, 43 insertions(+), 371 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index a72fd7220081..47b0e4848a56 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -40,18 +40,24 @@
 #include "amdgpu_connectors.h"
 #include "amdgpu_display.h"
 
+#include "dce_v6_0.h"
+
 #include "bif/bif_3_0_d.h"
 #include "bif/bif_3_0_sh_mask.h"
+
 #include "oss/oss_1_0_d.h"
 #include "oss/oss_1_0_sh_mask.h"
+
 #include "gca/gfx_6_0_d.h"
 #include "gca/gfx_6_0_sh_mask.h"
+#include "gca/gfx_7_2_enum.h"
+
 #include "gmc/gmc_6_0_d.h"
 #include "gmc/gmc_6_0_sh_mask.h"
+
 #include "dce/dce_6_0_d.h"
 #include "dce/dce_6_0_sh_mask.h"
-#include "gca/gfx_7_2_enum.h"
-#include "dce_v6_0.h"
+
 #include "si_enums.h"
 
 static void dce_v6_0_set_display_funcs(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 79307ae3e477..a18b3ece635b 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -1124,41 +1124,41 @@ static struct amdgpu_allowed_register_entry si_allowed_read_registers[] = {
 	{mmCP_STALLED_STAT3},
 	{GB_ADDR_CONFIG},
 	{MC_ARB_RAMCFG},
-	{GB_TILE_MODE0},
-	{GB_TILE_MODE1},
-	{GB_TILE_MODE2},
-	{GB_TILE_MODE3},
-	{GB_TILE_MODE4},
-	{GB_TILE_MODE5},
-	{GB_TILE_MODE6},
-	{GB_TILE_MODE7},
-	{GB_TILE_MODE8},
-	{GB_TILE_MODE9},
-	{GB_TILE_MODE10},
-	{GB_TILE_MODE11},
-	{GB_TILE_MODE12},
-	{GB_TILE_MODE13},
-	{GB_TILE_MODE14},
-	{GB_TILE_MODE15},
-	{GB_TILE_MODE16},
-	{GB_TILE_MODE17},
-	{GB_TILE_MODE18},
-	{GB_TILE_MODE19},
-	{GB_TILE_MODE20},
-	{GB_TILE_MODE21},
-	{GB_TILE_MODE22},
-	{GB_TILE_MODE23},
-	{GB_TILE_MODE24},
-	{GB_TILE_MODE25},
-	{GB_TILE_MODE26},
-	{GB_TILE_MODE27},
-	{GB_TILE_MODE28},
-	{GB_TILE_MODE29},
-	{GB_TILE_MODE30},
-	{GB_TILE_MODE31},
+	{mmGB_TILE_MODE0},
+	{mmGB_TILE_MODE1},
+	{mmGB_TILE_MODE2},
+	{mmGB_TILE_MODE3},
+	{mmGB_TILE_MODE4},
+	{mmGB_TILE_MODE5},
+	{mmGB_TILE_MODE6},
+	{mmGB_TILE_MODE7},
+	{mmGB_TILE_MODE8},
+	{mmGB_TILE_MODE9},
+	{mmGB_TILE_MODE10},
+	{mmGB_TILE_MODE11},
+	{mmGB_TILE_MODE12},
+	{mmGB_TILE_MODE13},
+	{mmGB_TILE_MODE14},
+	{mmGB_TILE_MODE15},
+	{mmGB_TILE_MODE16},
+	{mmGB_TILE_MODE17},
+	{mmGB_TILE_MODE18},
+	{mmGB_TILE_MODE19},
+	{mmGB_TILE_MODE20},
+	{mmGB_TILE_MODE21},
+	{mmGB_TILE_MODE22},
+	{mmGB_TILE_MODE23},
+	{mmGB_TILE_MODE24},
+	{mmGB_TILE_MODE25},
+	{mmGB_TILE_MODE26},
+	{mmGB_TILE_MODE27},
+	{mmGB_TILE_MODE28},
+	{mmGB_TILE_MODE29},
+	{mmGB_TILE_MODE30},
+	{mmGB_TILE_MODE31},
 	{CC_RB_BACKEND_DISABLE, true},
-	{GC_USER_RB_BACKEND_DISABLE, true},
-	{PA_SC_RASTER_CONFIG, true},
+	{mmGC_USER_RB_BACKEND_DISABLE, true},
+	{mmPA_SC_RASTER_CONFIG, true},
 };
 
 static uint32_t si_get_register_value(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/sid.h b/drivers/gpu/drm/amd/amdgpu/sid.h
index 9a39cbfe6db9..2218fd99ee83 100644
--- a/drivers/gpu/drm/amd/amdgpu/sid.h
+++ b/drivers/gpu/drm/amd/amdgpu/sid.h
@@ -696,18 +696,6 @@
 #define HDP_REG_COHERENCY_FLUSH_CNTL			0x1528
 
 /* DCE6 ELD audio interface */
-#define AZ_F0_CODEC_ENDPOINT_INDEX                       0x1780
-#       define AZ_ENDPOINT_REG_INDEX(x)                  (((x) & 0xff) << 0)
-#       define AZ_ENDPOINT_REG_WRITE_EN                  (1 << 8)
-#define AZ_F0_CODEC_ENDPOINT_DATA                        0x1781
-
-#define AZ_F0_CODEC_PIN_CONTROL_CHANNEL_SPEAKER          0x25
-#define		SPEAKER_ALLOCATION(x)			(((x) & 0x7f) << 0)
-#define		SPEAKER_ALLOCATION_MASK			(0x7f << 0)
-#define		SPEAKER_ALLOCATION_SHIFT		0
-#define		HDMI_CONNECTION				(1 << 16)
-#define		DP_CONNECTION				(1 << 17)
-
 #define AZ_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR0        0x28 /* LPCM */
 #define AZ_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR1        0x29 /* AC3 */
 #define AZ_F0_CODEC_PIN_CONTROL_AUDIO_DESCRIPTOR2        0x2A /* MPEG1 */
@@ -909,26 +897,11 @@
 #define CRTC_STATUS_FRAME_COUNT                         0x1BA6
 
 /* Audio clocks */
-#define DCCG_AUDIO_DTO_SOURCE                           0x05ac
-#       define DCCG_AUDIO_DTO0_SOURCE_SEL(x) ((x) << 0) /* crtc0 - crtc5 */
-#       define DCCG_AUDIO_DTO_SEL            (1 << 4)   /* 0=dto0 1=dto1 */
-
 #define DCCG_AUDIO_DTO0_PHASE                           0x05b0
 #define DCCG_AUDIO_DTO0_MODULE                          0x05b4
 #define DCCG_AUDIO_DTO1_PHASE                           0x05c0
 #define DCCG_AUDIO_DTO1_MODULE                          0x05c4
 
-#define AFMT_AUDIO_SRC_CONTROL                          0x1c4f
-#define		AFMT_AUDIO_SRC_SELECT(x)		(((x) & 7) << 0)
-/* AFMT_AUDIO_SRC_SELECT
- * 0 = stream0
- * 1 = stream1
- * 2 = stream2
- * 3 = stream3
- * 4 = stream4
- * 5 = stream5
- */
-
 #define	GRBM_CNTL					0x2000
 #define		GRBM_READ_TIMEOUT(x)				((x) << 0)
 
@@ -977,30 +950,6 @@
 #define		SE_DB_BUSY					(1 << 30)
 #define		SE_CB_BUSY					(1 << 31)
 
-#define	GRBM_SOFT_RESET					0x2008
-#define		SOFT_RESET_CP					(1 << 0)
-#define		SOFT_RESET_CB					(1 << 1)
-#define		SOFT_RESET_RLC					(1 << 2)
-#define		SOFT_RESET_DB					(1 << 3)
-#define		SOFT_RESET_GDS					(1 << 4)
-#define		SOFT_RESET_PA					(1 << 5)
-#define		SOFT_RESET_SC					(1 << 6)
-#define		SOFT_RESET_BCI					(1 << 7)
-#define		SOFT_RESET_SPI					(1 << 8)
-#define		SOFT_RESET_SX					(1 << 10)
-#define		SOFT_RESET_TC					(1 << 11)
-#define		SOFT_RESET_TA					(1 << 12)
-#define		SOFT_RESET_VGT					(1 << 14)
-#define		SOFT_RESET_IA					(1 << 15)
-
-#define GRBM_GFX_INDEX          			0x200B
-#define		INSTANCE_INDEX(x)			((x) << 0)
-#define		SH_INDEX(x)     			((x) << 8)
-#define		SE_INDEX(x)     			((x) << 16)
-#define		SH_BROADCAST_WRITES      		(1 << 29)
-#define		INSTANCE_BROADCAST_WRITES      		(1 << 30)
-#define		SE_BROADCAST_WRITES      		(1 << 31)
-
 #define GRBM_INT_CNTL                                   0x2018
 #       define RDERR_INT_ENABLE                         (1 << 0)
 #       define GUI_IDLE_INT_ENABLE                      (1 << 19)
@@ -1045,16 +994,6 @@
 
 #define	VGT_VTX_VECT_EJECT_REG				0x222C
 
-#define	VGT_CACHE_INVALIDATION				0x2231
-#define		CACHE_INVALIDATION(x)				((x) << 0)
-#define			VC_ONLY						0
-#define			TC_ONLY						1
-#define			VC_AND_TC					2
-#define		AUTO_INVLD_EN(x)				((x) << 6)
-#define			NO_AUTO						0
-#define			ES_AUTO						1
-#define			GS_AUTO						2
-#define			ES_AND_GS_AUTO					3
 #define	VGT_ESGS_RING_SIZE				0x2232
 #define	VGT_GSVS_RING_SIZE				0x2233
 
@@ -1072,11 +1011,6 @@
 
 #define	VGT_TF_MEMORY_BASE				0x226E
 
-#define CC_GC_SHADER_ARRAY_CONFIG			0x226F
-#define		INACTIVE_CUS_MASK			0xFFFF0000
-#define		INACTIVE_CUS_SHIFT			16
-#define GC_USER_SHADER_ARRAY_CONFIG			0x2270
-
 #define	PA_CL_ENHANCE					0x2285
 #define		CLIP_VTX_REORDER_ENA				(1 << 0)
 #define		NUM_CLIP_SEQ(x)					((x) << 1)
@@ -1169,89 +1103,6 @@
 #define		ROW_SIZE_MASK				0x30000000
 #define		ROW_SIZE_SHIFT				28
 
-#define	GB_TILE_MODE0					0x2644
-#       define MICRO_TILE_MODE(x)				((x) << 0)
-#              define	ADDR_SURF_DISPLAY_MICRO_TILING		0
-#              define	ADDR_SURF_THIN_MICRO_TILING		1
-#              define	ADDR_SURF_DEPTH_MICRO_TILING		2
-#       define ARRAY_MODE(x)					((x) << 2)
-#              define	ARRAY_LINEAR_GENERAL			0
-#              define	ARRAY_LINEAR_ALIGNED			1
-#              define	ARRAY_1D_TILED_THIN1			2
-#              define	ARRAY_2D_TILED_THIN1			4
-#       define PIPE_CONFIG(x)					((x) << 6)
-#              define	ADDR_SURF_P2				0
-#              define	ADDR_SURF_P4_8x16			4
-#              define	ADDR_SURF_P4_16x16			5
-#              define	ADDR_SURF_P4_16x32			6
-#              define	ADDR_SURF_P4_32x32			7
-#              define	ADDR_SURF_P8_16x16_8x16			8
-#              define	ADDR_SURF_P8_16x32_8x16			9
-#              define	ADDR_SURF_P8_32x32_8x16			10
-#              define	ADDR_SURF_P8_16x32_16x16		11
-#              define	ADDR_SURF_P8_32x32_16x16		12
-#              define	ADDR_SURF_P8_32x32_16x32		13
-#              define	ADDR_SURF_P8_32x64_32x32		14
-#       define TILE_SPLIT(x)					((x) << 11)
-#              define	ADDR_SURF_TILE_SPLIT_64B		0
-#              define	ADDR_SURF_TILE_SPLIT_128B		1
-#              define	ADDR_SURF_TILE_SPLIT_256B		2
-#              define	ADDR_SURF_TILE_SPLIT_512B		3
-#              define	ADDR_SURF_TILE_SPLIT_1KB		4
-#              define	ADDR_SURF_TILE_SPLIT_2KB		5
-#              define	ADDR_SURF_TILE_SPLIT_4KB		6
-#       define BANK_WIDTH(x)					((x) << 14)
-#              define	ADDR_SURF_BANK_WIDTH_1			0
-#              define	ADDR_SURF_BANK_WIDTH_2			1
-#              define	ADDR_SURF_BANK_WIDTH_4			2
-#              define	ADDR_SURF_BANK_WIDTH_8			3
-#       define BANK_HEIGHT(x)					((x) << 16)
-#              define	ADDR_SURF_BANK_HEIGHT_1			0
-#              define	ADDR_SURF_BANK_HEIGHT_2			1
-#              define	ADDR_SURF_BANK_HEIGHT_4			2
-#              define	ADDR_SURF_BANK_HEIGHT_8			3
-#       define MACRO_TILE_ASPECT(x)				((x) << 18)
-#              define	ADDR_SURF_MACRO_ASPECT_1		0
-#              define	ADDR_SURF_MACRO_ASPECT_2		1
-#              define	ADDR_SURF_MACRO_ASPECT_4		2
-#              define	ADDR_SURF_MACRO_ASPECT_8		3
-#       define NUM_BANKS(x)					((x) << 20)
-#              define	ADDR_SURF_2_BANK			0
-#              define	ADDR_SURF_4_BANK			1
-#              define	ADDR_SURF_8_BANK			2
-#              define	ADDR_SURF_16_BANK			3
-#define	GB_TILE_MODE1					0x2645
-#define	GB_TILE_MODE2					0x2646
-#define	GB_TILE_MODE3					0x2647
-#define	GB_TILE_MODE4					0x2648
-#define	GB_TILE_MODE5					0x2649
-#define	GB_TILE_MODE6					0x264a
-#define	GB_TILE_MODE7					0x264b
-#define	GB_TILE_MODE8					0x264c
-#define	GB_TILE_MODE9					0x264d
-#define	GB_TILE_MODE10					0x264e
-#define	GB_TILE_MODE11					0x264f
-#define	GB_TILE_MODE12					0x2650
-#define	GB_TILE_MODE13					0x2651
-#define	GB_TILE_MODE14					0x2652
-#define	GB_TILE_MODE15					0x2653
-#define	GB_TILE_MODE16					0x2654
-#define	GB_TILE_MODE17					0x2655
-#define	GB_TILE_MODE18					0x2656
-#define	GB_TILE_MODE19					0x2657
-#define	GB_TILE_MODE20					0x2658
-#define	GB_TILE_MODE21					0x2659
-#define	GB_TILE_MODE22					0x265a
-#define	GB_TILE_MODE23					0x265b
-#define	GB_TILE_MODE24					0x265c
-#define	GB_TILE_MODE25					0x265d
-#define	GB_TILE_MODE26					0x265e
-#define	GB_TILE_MODE27					0x265f
-#define	GB_TILE_MODE28					0x2660
-#define	GB_TILE_MODE29					0x2661
-#define	GB_TILE_MODE30					0x2662
-#define	GB_TILE_MODE31					0x2663
-
 #define	CB_PERFCOUNTER0_SELECT0				0x2688
 #define	CB_PERFCOUNTER0_SELECT1				0x2689
 #define	CB_PERFCOUNTER1_SELECT0				0x268A
@@ -1263,10 +1114,6 @@
 
 #define	CB_CGTT_SCLK_CTRL				0x2698
 
-#define	GC_USER_RB_BACKEND_DISABLE			0x26DF
-#define		BACKEND_DISABLE_MASK			0x00FF0000
-#define		BACKEND_DISABLE_SHIFT			16
-
 #define	TCP_CHAN_STEER_LO				0x2B03
 #define	TCP_CHAN_STEER_HI				0x2B94
 
@@ -1320,101 +1167,12 @@
 #       define CP_RINGID1_INT_STAT                      (1 << 30)
 #       define CP_RINGID0_INT_STAT                      (1 << 31)
 
-#define	CP_MEM_SLP_CNTL					0x3079
-#       define CP_MEM_LS_EN                             (1 << 0)
-
-#define	CP_DEBUG					0x307F
-
-#define RLC_CNTL                                          0x30C0
-#       define RLC_ENABLE                                 (1 << 0)
-#define RLC_RL_BASE                                       0x30C1
-#define RLC_RL_SIZE                                       0x30C2
-#define RLC_LB_CNTL                                       0x30C3
-#       define LOAD_BALANCE_ENABLE                        (1 << 0)
-#define RLC_SAVE_AND_RESTORE_BASE                         0x30C4
-#define RLC_LB_CNTR_MAX                                   0x30C5
-#define RLC_LB_CNTR_INIT                                  0x30C6
-
-#define RLC_CLEAR_STATE_RESTORE_BASE                      0x30C8
-
-#define RLC_UCODE_ADDR                                    0x30CB
-#define RLC_UCODE_DATA                                    0x30CC
-
-#define RLC_GPU_CLOCK_COUNT_LSB                           0x30CE
-#define RLC_GPU_CLOCK_COUNT_MSB                           0x30CF
-#define RLC_CAPTURE_GPU_CLOCK_COUNT                       0x30D0
-#define RLC_MC_CNTL                                       0x30D1
-#define RLC_UCODE_CNTL                                    0x30D2
-#define RLC_STAT                                          0x30D3
-#       define RLC_BUSY_STATUS                            (1 << 0)
-#       define GFX_POWER_STATUS                           (1 << 1)
-#       define GFX_CLOCK_STATUS                           (1 << 2)
-#       define GFX_LS_STATUS                              (1 << 3)
-
-#define	RLC_PG_CNTL					0x30D7
-#	define GFX_PG_ENABLE				(1 << 0)
-#	define GFX_PG_SRC				(1 << 1)
-
-#define	RLC_CGTT_MGCG_OVERRIDE				0x3100
-#define	RLC_CGCG_CGLS_CTRL				0x3101
-#	define CGCG_EN					(1 << 0)
-#	define CGLS_EN					(1 << 1)
-
-#define	RLC_TTOP_D					0x3105
-#	define RLC_PUD(x)				((x) << 0)
-#	define RLC_PUD_MASK				(0xff << 0)
-#	define RLC_PDD(x)				((x) << 8)
-#	define RLC_PDD_MASK				(0xff << 8)
-#	define RLC_TTPD(x)				((x) << 16)
-#	define RLC_TTPD_MASK				(0xff << 16)
-#	define RLC_MSD(x)				((x) << 24)
-#	define RLC_MSD_MASK				(0xff << 24)
-
-#define RLC_LB_INIT_CU_MASK                               0x3107
-
-#define	RLC_PG_AO_CU_MASK				0x310B
-#define	RLC_MAX_PG_CU					0x310C
-#	define MAX_PU_CU(x)				((x) << 0)
-#	define MAX_PU_CU_MASK				(0xff << 0)
-#define	RLC_AUTO_PG_CTRL				0x310C
-#	define AUTO_PG_EN				(1 << 0)
-#	define GRBM_REG_SGIT(x)				((x) << 3)
-#	define GRBM_REG_SGIT_MASK			(0xffff << 3)
-#	define PG_AFTER_GRBM_REG_ST(x)			((x) << 19)
-#	define PG_AFTER_GRBM_REG_ST_MASK		(0x1fff << 19)
-
-#define RLC_SERDES_WR_MASTER_MASK_0                       0x3115
-#define RLC_SERDES_WR_MASTER_MASK_1                       0x3116
-#define RLC_SERDES_WR_CTRL                                0x3117
-
-#define RLC_SERDES_MASTER_BUSY_0                          0x3119
-#define RLC_SERDES_MASTER_BUSY_1                          0x311A
-
-#define RLC_GCPM_GENERAL_3                                0x311E
-
-#define	DB_RENDER_CONTROL				0xA000
-
-#define DB_DEPTH_INFO                                   0xA00F
-
-#define PA_SC_RASTER_CONFIG                             0xA0D4
-#	define RB_MAP_PKR0(x)				((x) << 0)
-#	define RB_MAP_PKR0_MASK				(0x3 << 0)
-#	define RB_MAP_PKR1(x)				((x) << 2)
-#	define RB_MAP_PKR1_MASK				(0x3 << 2)
-#       define RASTER_CONFIG_RB_MAP_0                   0
-#       define RASTER_CONFIG_RB_MAP_1                   1
-#       define RASTER_CONFIG_RB_MAP_2                   2
-#       define RASTER_CONFIG_RB_MAP_3                   3
+// #define PA_SC_RASTER_CONFIG                             0xA0D4
 #	define RB_XSEL2(x)				((x) << 4)
 #	define RB_XSEL2_MASK				(0x3 << 4)
 #	define RB_XSEL					(1 << 6)
 #	define RB_YSEL					(1 << 7)
 #	define PKR_MAP(x)				((x) << 8)
-#	define PKR_MAP_MASK				(0x3 << 8)
-#       define RASTER_CONFIG_PKR_MAP_0			0
-#       define RASTER_CONFIG_PKR_MAP_1			1
-#       define RASTER_CONFIG_PKR_MAP_2			2
-#       define RASTER_CONFIG_PKR_MAP_3			3
 #	define PKR_XSEL(x)				((x) << 10)
 #	define PKR_XSEL_MASK				(0x3 << 10)
 #	define PKR_YSEL(x)				((x) << 12)
@@ -1426,56 +1184,11 @@
 #	define SC_YSEL(x)				((x) << 20)
 #	define SC_YSEL_MASK				(0x3 << 20)
 #	define SE_MAP(x)				((x) << 24)
-#	define SE_MAP_MASK				(0x3 << 24)
-#       define RASTER_CONFIG_SE_MAP_0			0
-#       define RASTER_CONFIG_SE_MAP_1			1
-#       define RASTER_CONFIG_SE_MAP_2			2
-#       define RASTER_CONFIG_SE_MAP_3			3
 #	define SE_XSEL(x)				((x) << 26)
 #	define SE_XSEL_MASK				(0x3 << 26)
 #	define SE_YSEL(x)				((x) << 28)
 #	define SE_YSEL_MASK				(0x3 << 28)
 
-
-#define VGT_EVENT_INITIATOR                             0xA2A4
-#       define SAMPLE_STREAMOUTSTATS1                   (1 << 0)
-#       define SAMPLE_STREAMOUTSTATS2                   (2 << 0)
-#       define SAMPLE_STREAMOUTSTATS3                   (3 << 0)
-#       define CACHE_FLUSH_TS                           (4 << 0)
-#       define CACHE_FLUSH                              (6 << 0)
-#       define CS_PARTIAL_FLUSH                         (7 << 0)
-#       define VGT_STREAMOUT_RESET                      (10 << 0)
-#       define END_OF_PIPE_INCR_DE                      (11 << 0)
-#       define END_OF_PIPE_IB_END                       (12 << 0)
-#       define RST_PIX_CNT                              (13 << 0)
-#       define VS_PARTIAL_FLUSH                         (15 << 0)
-#       define PS_PARTIAL_FLUSH                         (16 << 0)
-#       define CACHE_FLUSH_AND_INV_TS_EVENT             (20 << 0)
-#       define ZPASS_DONE                               (21 << 0)
-#       define CACHE_FLUSH_AND_INV_EVENT                (22 << 0)
-#       define PERFCOUNTER_START                        (23 << 0)
-#       define PERFCOUNTER_STOP                         (24 << 0)
-#       define PIPELINESTAT_START                       (25 << 0)
-#       define PIPELINESTAT_STOP                        (26 << 0)
-#       define PERFCOUNTER_SAMPLE                       (27 << 0)
-#       define SAMPLE_PIPELINESTAT                      (30 << 0)
-#       define SAMPLE_STREAMOUTSTATS                    (32 << 0)
-#       define RESET_VTX_CNT                            (33 << 0)
-#       define VGT_FLUSH                                (36 << 0)
-#       define BOTTOM_OF_PIPE_TS                        (40 << 0)
-#       define DB_CACHE_FLUSH_AND_INV                   (42 << 0)
-#       define FLUSH_AND_INV_DB_DATA_TS                 (43 << 0)
-#       define FLUSH_AND_INV_DB_META                    (44 << 0)
-#       define FLUSH_AND_INV_CB_DATA_TS                 (45 << 0)
-#       define FLUSH_AND_INV_CB_META                    (46 << 0)
-#       define CS_DONE                                  (47 << 0)
-#       define PS_DONE                                  (48 << 0)
-#       define FLUSH_AND_INV_CB_PIXEL_DATA              (49 << 0)
-#       define THREAD_TRACE_START                       (51 << 0)
-#       define THREAD_TRACE_STOP                        (52 << 0)
-#       define THREAD_TRACE_FLUSH                       (54 << 0)
-#       define THREAD_TRACE_FINISH                      (55 << 0)
-
 /* PIF PHY0 registers idx/data 0x8/0xc */
 #define PB0_PIF_CNTL                                      0x10
 #       define LS2_EXIT_TIME(x)                           ((x) << 17)
@@ -2036,9 +1749,6 @@
 #define EVERGREEN_DATA_FORMAT                           0x1ac0
 #       define EVERGREEN_INTERLEAVE_EN                  (1 << 0)
 
-#define MC_SHARED_CHMAP__NOOFCHAN_MASK 0xf000
-#define MC_SHARED_CHMAP__NOOFCHAN__SHIFT 0xc
-
 #define R600_D1GRPH_ARRAY_MODE_LINEAR_GENERAL            (0 << 20)
 #define R600_D1GRPH_ARRAY_MODE_LINEAR_ALIGNED            (1 << 20)
 #define R600_D1GRPH_ARRAY_MODE_1D_TILED_THIN1            (2 << 20)
@@ -2050,32 +1760,6 @@
 #define R700_D2GRPH_SECONDARY_SURFACE_ADDRESS_HIGH              0x1847
 #define R700_D1GRPH_SECONDARY_SURFACE_ADDRESS_HIGH              0x1a47
 
-#define DISP_INTERRUPT_STATUS__LB_D1_VBLANK_INTERRUPT_MASK 0x8
-#define DISP_INTERRUPT_STATUS_CONTINUE__LB_D2_VBLANK_INTERRUPT_MASK 0x8
-#define DISP_INTERRUPT_STATUS_CONTINUE2__LB_D3_VBLANK_INTERRUPT_MASK 0x8
-#define DISP_INTERRUPT_STATUS_CONTINUE3__LB_D4_VBLANK_INTERRUPT_MASK 0x8
-#define DISP_INTERRUPT_STATUS_CONTINUE4__LB_D5_VBLANK_INTERRUPT_MASK 0x8
-#define DISP_INTERRUPT_STATUS_CONTINUE5__LB_D6_VBLANK_INTERRUPT_MASK 0x8
-
-#define DISP_INTERRUPT_STATUS__LB_D1_VLINE_INTERRUPT_MASK 0x4
-#define DISP_INTERRUPT_STATUS_CONTINUE__LB_D2_VLINE_INTERRUPT_MASK 0x4
-#define DISP_INTERRUPT_STATUS_CONTINUE2__LB_D3_VLINE_INTERRUPT_MASK 0x4
-#define DISP_INTERRUPT_STATUS_CONTINUE3__LB_D4_VLINE_INTERRUPT_MASK 0x4
-#define DISP_INTERRUPT_STATUS_CONTINUE4__LB_D5_VLINE_INTERRUPT_MASK 0x4
-#define DISP_INTERRUPT_STATUS_CONTINUE5__LB_D6_VLINE_INTERRUPT_MASK 0x4
-
-#define DISP_INTERRUPT_STATUS__DC_HPD1_INTERRUPT_MASK 0x20000
-#define DISP_INTERRUPT_STATUS_CONTINUE__DC_HPD2_INTERRUPT_MASK 0x20000
-#define DISP_INTERRUPT_STATUS_CONTINUE2__DC_HPD3_INTERRUPT_MASK 0x20000
-#define DISP_INTERRUPT_STATUS_CONTINUE3__DC_HPD4_INTERRUPT_MASK 0x20000
-#define DISP_INTERRUPT_STATUS_CONTINUE4__DC_HPD5_INTERRUPT_MASK 0x20000
-#define DISP_INTERRUPT_STATUS_CONTINUE5__DC_HPD6_INTERRUPT_MASK 0x20000
-
-#define GRPH_INTERRUPT_STATUS__GRPH_PFLIP_INT_OCCURRED_MASK 0x1
-#define GRPH_INTERRUPT_STATUS__GRPH_PFLIP_INT_CLEAR_MASK 0x100
-
-#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK 0x1
-
 #define R600_D1GRPH_SWAP_CONTROL                               0x1843
 #define R600_D1GRPH_SWAP_ENDIAN_NONE                    (0 << 0)
 #define R600_D1GRPH_SWAP_ENDIAN_16BIT                   (1 << 0)
@@ -2099,8 +1783,6 @@
 #       define R600_SCK_PRESCALE_CRYSTAL_CLK_SHIFT 28
 #       define R600_SCK_PRESCALE_CRYSTAL_CLK_MASK  (0xf << 28)
 
-#define GRPH_INTERRUPT_CONTROL__GRPH_PFLIP_INT_MASK_MASK 0x1
-
 #define FMT_BIT_DEPTH_CONTROL                0x1bf2
 #define FMT_TRUNCATE_EN               (1 << 0)
 #define FMT_TRUNCATE_DEPTH            (1 << 4)
@@ -2404,19 +2086,6 @@
 #define mmSRBM_SOFT_RESET__xxSOFT_RESET_MC_MASK 0x800
 #define mmSRBM_SOFT_RESET__xxSOFT_RESET_MC__SHIFT 0xb
 
-#define VM_CONTEXT1_CNTL__RANGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x8
-#define VM_CONTEXT1_CNTL__RANGE_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0x3
-#define VM_CONTEXT1_CNTL__DUMMY_PAGE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x40
-#define VM_CONTEXT1_CNTL__DUMMY_PAGE_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0x6
-#define VM_CONTEXT1_CNTL__PDE0_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x200
-#define VM_CONTEXT1_CNTL__PDE0_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0x9
-#define VM_CONTEXT1_CNTL__VALID_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x1000
-#define VM_CONTEXT1_CNTL__VALID_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0xc
-#define VM_CONTEXT1_CNTL__READ_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x8000
-#define VM_CONTEXT1_CNTL__READ_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0xf
-#define VM_CONTEXT1_CNTL__WRITE_PROTECTION_FAULT_ENABLE_INTERRUPT_MASK 0x40000
-#define VM_CONTEXT1_CNTL__WRITE_PROTECTION_FAULT_ENABLE_INTERRUPT__SHIFT 0x12
-
 #define MC_SEQ_MISC0__MT__MASK	0xf0000000
 #define MC_SEQ_MISC0__MT__GDDR1  0x10000000
 #define MC_SEQ_MISC0__MT__DDR2   0x20000000
@@ -2426,10 +2095,7 @@
 #define MC_SEQ_MISC0__MT__HBM    0x60000000
 #define MC_SEQ_MISC0__MT__DDR3   0xB0000000
 
-#define GRBM_STATUS__GUI_ACTIVE_MASK 0x80000000
 #define CP_INT_CNTL_RING__TIME_STAMP_INT_ENABLE_MASK 0x4000000
-#define CP_INT_CNTL_RING0__PRIV_REG_INT_ENABLE_MASK 0x800000
-#define CP_INT_CNTL_RING0__PRIV_INSTR_INT_ENABLE_MASK 0x400000
 #define PACKET3_SEM_WAIT_ON_SIGNAL    (0x1 << 12)
 #define PACKET3_SEM_SEL_SIGNAL	    (0x6 << 29)
 #define PACKET3_SEM_SEL_WAIT	    (0x7 << 29)
-- 
2.48.1

