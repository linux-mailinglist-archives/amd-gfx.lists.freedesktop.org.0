Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CC26ABB9
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Sep 2020 20:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3CD6E8DA;
	Tue, 15 Sep 2020 18:24:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B86C26E8D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Sep 2020 18:24:18 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id f142so5220242qke.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Sep 2020 11:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kj8JtTxnX5VS3ty1hEA5zyNbPkgBMTXEfkR5UtZfJ/Q=;
 b=aBSV0zuTuUd6nGuJZVfm+M1foFTl3q8l+WP7qH4NqASoDmEMCRrxusxZm7oMlfJAxU
 1TAFO0dYTSplgIGk44E4fvxefNgl8M2SQ4TjTzuNgPZwqKkONeLPj8o9BQ2TmNvVdxl3
 hkmbg/Ze+cdStUY4R6+FcTDY2rpjIjB1boG2oiguas67yK4wXGvpMHqLUI3btkUvHvk9
 mou5iWqkQp6eKBLFXL0fbyzY1EJOPhu/KJIVIUhiu842LC9TDmXZ0b2+pdskyq7aAU5F
 31IjLB4Hb9+Ow1VaF4JtCcv2c2pxrVhV8U5kfAEPMp8t1njIjVtDk+cd0/T96Dhe4n08
 9x3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kj8JtTxnX5VS3ty1hEA5zyNbPkgBMTXEfkR5UtZfJ/Q=;
 b=NcC4jWXRSAmzBm2WBwR2Ld1NyHzukT/K6HxzpKLSMnjMPmM4porRdrVplCurKRuMDZ
 uREkkn/AOtNQtW3b2fPHWYu58/IhBSurvLnKpRcsIO07rqLv8Rchz6lO0udYxhvObuiA
 MlxDivyxUceIGZPMW8ZmKwJolhKC8/VpDMtLvR9jpDs3A84GV2mVx5Jej4kvy6yA0K88
 rQaZH2zop7HcA45bw8abB8pwtd+iABimwu2wUgjsBvEdVPG6/yEHahCHsk/TK3gJA1LB
 b2jpyelQfihSX9Ty2YpaDzKDB0HfA0oGc62QQR0oHPY+H4gFhWsCxiyDC5U7wq2ld8eC
 g/1A==
X-Gm-Message-State: AOAM532bgLsyw1FPss37+rSMtCszNFPjpSl2brpVYdm4nK6eaTfvozUt
 gnXaH91gVetUTbwlDG8lLRAzA7Y0JSk=
X-Google-Smtp-Source: ABdhPJy+XI5EvpT7Hxe0Q+ky5Y0KG+lvh785AgJufS4sLXPEwViWveEjg0O1PB0MehBxWnbleX5E8A==
X-Received: by 2002:a05:620a:815:: with SMTP id
 s21mr18402150qks.0.1600194257282; 
 Tue, 15 Sep 2020 11:24:17 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id x126sm17318009qkb.101.2020.09.15.11.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 11:24:16 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/amdgpu: add the GC 10.3 VRS registers
Date: Tue, 15 Sep 2020 14:24:06 -0400
Message-Id: <20200915182409.68727-1-alexander.deucher@amd.com>
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

Add the VRS registers.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../include/asic_reg/gc/gc_10_3_0_default.h   |  2 +
 .../include/asic_reg/gc/gc_10_3_0_offset.h    |  4 ++
 .../include/asic_reg/gc/gc_10_3_0_sh_mask.h   | 50 +++++++++++++++++++
 3 files changed, 56 insertions(+)

diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_default.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_default.h
index 1116779252e6..e245e912535e 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_default.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_default.h
@@ -2727,6 +2727,7 @@
 #define mmDB_STENCIL_WRITE_BASE_DEFAULT                                          0x00000000
 #define mmDB_RESERVED_REG_1_DEFAULT                                              0x00000000
 #define mmDB_RESERVED_REG_3_DEFAULT                                              0x00000000
+#define mmDB_VRS_OVERRIDE_CNTL_DEFAULT                                           0x00000000
 #define mmDB_Z_READ_BASE_HI_DEFAULT                                              0x00000000
 #define mmDB_STENCIL_READ_BASE_HI_DEFAULT                                        0x00000000
 #define mmDB_Z_WRITE_BASE_HI_DEFAULT                                             0x00000000
@@ -3062,6 +3063,7 @@
 #define mmPA_SU_OVER_RASTERIZATION_CNTL_DEFAULT                                  0x00000000
 #define mmPA_STEREO_CNTL_DEFAULT                                                 0x00000000
 #define mmPA_STATE_STEREO_X_DEFAULT                                              0x00000000
+#define mmPA_CL_VRS_CNTL_DEFAULT                                                 0x00000000
 #define mmPA_SU_POINT_SIZE_DEFAULT                                               0x00000000
 #define mmPA_SU_POINT_MINMAX_DEFAULT                                             0x00000000
 #define mmPA_SU_LINE_CNTL_DEFAULT                                                0x00000000
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
index cbaad7d83194..66a4151fa676 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
@@ -5379,6 +5379,8 @@
 #define mmDB_RESERVED_REG_1_BASE_IDX                                                                   1
 #define mmDB_RESERVED_REG_3                                                                            0x0017
 #define mmDB_RESERVED_REG_3_BASE_IDX                                                                   1
+#define mmDB_VRS_OVERRIDE_CNTL                                                                         0x0019
+#define mmDB_VRS_OVERRIDE_CNTL_BASE_IDX                                                                1
 #define mmDB_Z_READ_BASE_HI                                                                            0x001a
 #define mmDB_Z_READ_BASE_HI_BASE_IDX                                                                   1
 #define mmDB_STENCIL_READ_BASE_HI                                                                      0x001b
@@ -6049,6 +6051,8 @@
 #define mmPA_STEREO_CNTL_BASE_IDX                                                                      1
 #define mmPA_STATE_STEREO_X                                                                            0x0211
 #define mmPA_STATE_STEREO_X_BASE_IDX                                                                   1
+#define mmPA_CL_VRS_CNTL                                                                               0x0212
+#define mmPA_CL_VRS_CNTL_BASE_IDX                                                                      1
 #define mmPA_SU_POINT_SIZE                                                                             0x0280
 #define mmPA_SU_POINT_SIZE_BASE_IDX                                                                    1
 #define mmPA_SU_POINT_MINMAX                                                                           0x0281
diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
index c2d035ef3e94..aed799d9a0e8 100644
--- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
+++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_sh_mask.h
@@ -9777,6 +9777,7 @@
 #define DB_EXCEPTION_CONTROL__AUTO_FLUSH_HTILE__SHIFT                                                         0x3
 #define DB_EXCEPTION_CONTROL__AUTO_FLUSH_QUAD__SHIFT                                                          0x4
 #define DB_EXCEPTION_CONTROL__FORCE_SUMMARIZE__SHIFT                                                          0x8
+#define DB_EXCEPTION_CONTROL__FORCE_VRS_RATE_FINE__SHIFT                                                      0x10
 #define DB_EXCEPTION_CONTROL__DTAG_WATERMARK__SHIFT                                                           0x18
 #define DB_EXCEPTION_CONTROL__EARLY_Z_PANIC_DISABLE_MASK                                                      0x00000001L
 #define DB_EXCEPTION_CONTROL__LATE_Z_PANIC_DISABLE_MASK                                                       0x00000002L
@@ -9784,6 +9785,7 @@
 #define DB_EXCEPTION_CONTROL__AUTO_FLUSH_HTILE_MASK                                                           0x00000008L
 #define DB_EXCEPTION_CONTROL__AUTO_FLUSH_QUAD_MASK                                                            0x00000010L
 #define DB_EXCEPTION_CONTROL__FORCE_SUMMARIZE_MASK                                                            0x00000F00L
+#define DB_EXCEPTION_CONTROL__FORCE_VRS_RATE_FINE_MASK                                                        0x00FF0000L
 #define DB_EXCEPTION_CONTROL__DTAG_WATERMARK_MASK                                                             0x7F000000L
 //DB_DFSM_CONFIG
 #define DB_DFSM_CONFIG__BYPASS_DFSM__SHIFT                                                                    0x0
@@ -10076,6 +10078,7 @@
 #define CB_HW_CONTROL_3__DISABLE_NACK_PROCESSING_CM__SHIFT                                                    0x18
 #define CB_HW_CONTROL_3__DISABLE_NACK_COLOR_RD_WR_OPT__SHIFT                                                  0x19
 #define CB_HW_CONTROL_3__DISABLE_BLENDER_CLOCK_GATING__SHIFT                                                  0x1a
+#define CB_HW_CONTROL_3__DISABLE_DCC_VRS_OPT__SHIFT                                                           0x1c
 #define CB_HW_CONTROL_3__DISABLE_FMASK_NOFETCH_OPT__SHIFT                                                     0x1e
 #define CB_HW_CONTROL_3__DISABLE_FMASK_NOFETCH_OPT_BC__SHIFT                                                  0x1f
 #define CB_HW_CONTROL_3__DISABLE_SLOW_MODE_EMPTY_HALF_QUAD_KILL_MASK                                          0x00000001L
@@ -10103,12 +10106,15 @@
 #define CB_HW_CONTROL_3__DISABLE_NACK_PROCESSING_CM_MASK                                                      0x01000000L
 #define CB_HW_CONTROL_3__DISABLE_NACK_COLOR_RD_WR_OPT_MASK                                                    0x02000000L
 #define CB_HW_CONTROL_3__DISABLE_BLENDER_CLOCK_GATING_MASK                                                    0x04000000L
+#define CB_HW_CONTROL_3__DISABLE_DCC_VRS_OPT_MASK                                                             0x10000000L
 #define CB_HW_CONTROL_3__DISABLE_FMASK_NOFETCH_OPT_MASK                                                       0x40000000L
 #define CB_HW_CONTROL_3__DISABLE_FMASK_NOFETCH_OPT_BC_MASK                                                    0x80000000L
 //CB_HW_CONTROL
 #define CB_HW_CONTROL__ALLOW_MRT_WITH_DUAL_SOURCE__SHIFT                                                      0x0
+#define CB_HW_CONTROL__DISABLE_VRS_FILLRATE_OPTIMIZATION__SHIFT                                               0x1
 #define CB_HW_CONTROL__DISABLE_FILLRATE_OPT_FIX_WITH_CFC__SHIFT                                               0x3
 #define CB_HW_CONTROL__DISABLE_POST_DCC_WITH_CFC_FIX__SHIFT                                                   0x4
+#define CB_HW_CONTROL__DISABLE_COMPRESS_1FRAG_WHEN_VRS_RATE_HINT_EN__SHIFT                                    0x5
 #define CB_HW_CONTROL__RMI_CREDITS__SHIFT                                                                     0x6
 #define CB_HW_CONTROL__CHICKEN_BITS__SHIFT                                                                    0xc
 #define CB_HW_CONTROL__DISABLE_FMASK_MULTI_MGCG_DOMAINS__SHIFT                                                0xf
@@ -10129,8 +10135,10 @@
 #define CB_HW_CONTROL__DISABLE_CC_IB_SERIALIZER_STATE_OPT__SHIFT                                              0x1e
 #define CB_HW_CONTROL__DISABLE_PIXEL_IN_QUAD_FIX_FOR_LINEAR_SURFACE__SHIFT                                    0x1f
 #define CB_HW_CONTROL__ALLOW_MRT_WITH_DUAL_SOURCE_MASK                                                        0x00000001L
+#define CB_HW_CONTROL__DISABLE_VRS_FILLRATE_OPTIMIZATION_MASK                                                 0x00000002L
 #define CB_HW_CONTROL__DISABLE_FILLRATE_OPT_FIX_WITH_CFC_MASK                                                 0x00000008L
 #define CB_HW_CONTROL__DISABLE_POST_DCC_WITH_CFC_FIX_MASK                                                     0x00000010L
+#define CB_HW_CONTROL__DISABLE_COMPRESS_1FRAG_WHEN_VRS_RATE_HINT_EN_MASK                                      0x00000020L
 #define CB_HW_CONTROL__RMI_CREDITS_MASK                                                                       0x00000FC0L
 #define CB_HW_CONTROL__CHICKEN_BITS_MASK                                                                      0x00007000L
 #define CB_HW_CONTROL__DISABLE_FMASK_MULTI_MGCG_DOMAINS_MASK                                                  0x00008000L
@@ -19881,6 +19889,7 @@
 #define DB_RENDER_OVERRIDE2__PRESERVE_SRESULTS__SHIFT                                                         0x16
 #define DB_RENDER_OVERRIDE2__DISABLE_FAST_PASS__SHIFT                                                         0x17
 #define DB_RENDER_OVERRIDE2__ALLOW_PARTIAL_RES_HIER_KILL__SHIFT                                               0x19
+#define DB_RENDER_OVERRIDE2__FORCE_VRS_RATE_FINE__SHIFT                                                       0x1a
 #define DB_RENDER_OVERRIDE2__CENTROID_COMPUTATION_MODE__SHIFT                                                 0x1b
 #define DB_RENDER_OVERRIDE2__PARTIAL_SQUAD_LAUNCH_CONTROL_MASK                                                0x00000003L
 #define DB_RENDER_OVERRIDE2__PARTIAL_SQUAD_LAUNCH_COUNTDOWN_MASK                                              0x0000001CL
@@ -19898,6 +19907,7 @@
 #define DB_RENDER_OVERRIDE2__PRESERVE_SRESULTS_MASK                                                           0x00400000L
 #define DB_RENDER_OVERRIDE2__DISABLE_FAST_PASS_MASK                                                           0x00800000L
 #define DB_RENDER_OVERRIDE2__ALLOW_PARTIAL_RES_HIER_KILL_MASK                                                 0x02000000L
+#define DB_RENDER_OVERRIDE2__FORCE_VRS_RATE_FINE_MASK                                                         0x04000000L
 #define DB_RENDER_OVERRIDE2__CENTROID_COMPUTATION_MODE_MASK                                                   0x18000000L
 //DB_HTILE_DATA_BASE
 #define DB_HTILE_DATA_BASE__BASE_256B__SHIFT                                                                  0x0
@@ -20021,6 +20031,13 @@
 //DB_RESERVED_REG_3
 #define DB_RESERVED_REG_3__FIELD_1__SHIFT                                                                     0x0
 #define DB_RESERVED_REG_3__FIELD_1_MASK                                                                       0x003FFFFFL
+//DB_VRS_OVERRIDE_CNTL
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_COMBINER_MODE__SHIFT                                          0x0
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_X__SHIFT                                                      0x4
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_Y__SHIFT                                                      0x6
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_COMBINER_MODE_MASK                                            0x00000007L
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_X_MASK                                                        0x00000030L
+#define DB_VRS_OVERRIDE_CNTL__VRS_OVERRIDE_RATE_Y_MASK                                                        0x000000C0L
 //DB_Z_READ_BASE_HI
 #define DB_Z_READ_BASE_HI__BASE_HI__SHIFT                                                                     0x0
 #define DB_Z_READ_BASE_HI__BASE_HI_MASK                                                                       0x000000FFL
@@ -22598,6 +22615,7 @@
 #define PA_CL_VS_OUT_CNTL__VS_OUT_MISC_SIDE_BUS_ENA__SHIFT                                                    0x18
 #define PA_CL_VS_OUT_CNTL__USE_VTX_GS_CUT_FLAG__SHIFT                                                         0x19
 #define PA_CL_VS_OUT_CNTL__USE_VTX_LINE_WIDTH__SHIFT                                                          0x1b
+#define PA_CL_VS_OUT_CNTL__USE_VTX_VRS_RATE__SHIFT                                                            0x1c
 #define PA_CL_VS_OUT_CNTL__BYPASS_VTX_RATE_COMBINER__SHIFT                                                    0x1d
 #define PA_CL_VS_OUT_CNTL__BYPASS_PRIM_RATE_COMBINER__SHIFT                                                   0x1e
 #define PA_CL_VS_OUT_CNTL__CLIP_DIST_ENA_0_MASK                                                               0x00000001L
@@ -22627,6 +22645,7 @@
 #define PA_CL_VS_OUT_CNTL__VS_OUT_MISC_SIDE_BUS_ENA_MASK                                                      0x01000000L
 #define PA_CL_VS_OUT_CNTL__USE_VTX_GS_CUT_FLAG_MASK                                                           0x02000000L
 #define PA_CL_VS_OUT_CNTL__USE_VTX_LINE_WIDTH_MASK                                                            0x08000000L
+#define PA_CL_VS_OUT_CNTL__USE_VTX_VRS_RATE_MASK                                                              0x10000000L
 #define PA_CL_VS_OUT_CNTL__BYPASS_VTX_RATE_COMBINER_MASK                                                      0x20000000L
 #define PA_CL_VS_OUT_CNTL__BYPASS_PRIM_RATE_COMBINER_MASK                                                     0x40000000L
 //PA_CL_NANINF_CNTL
@@ -22740,6 +22759,19 @@
 //PA_STATE_STEREO_X
 #define PA_STATE_STEREO_X__STEREO_X_OFFSET__SHIFT                                                             0x0
 #define PA_STATE_STEREO_X__STEREO_X_OFFSET_MASK                                                               0xFFFFFFFFL
+//PA_CL_VRS_CNTL
+#define PA_CL_VRS_CNTL__VERTEX_RATE_COMBINER_MODE__SHIFT                                                      0x0
+#define PA_CL_VRS_CNTL__PRIMITIVE_RATE_COMBINER_MODE__SHIFT                                                   0x3
+#define PA_CL_VRS_CNTL__HTILE_RATE_COMBINER_MODE__SHIFT                                                       0x6
+#define PA_CL_VRS_CNTL__SAMPLE_ITER_COMBINER_MODE__SHIFT                                                      0x9
+#define PA_CL_VRS_CNTL__EXPOSE_VRS_PIXELS_MASK__SHIFT                                                         0xd
+#define PA_CL_VRS_CNTL__CMASK_RATE_HINT_FORCE_ZERO__SHIFT                                                     0xe
+#define PA_CL_VRS_CNTL__VERTEX_RATE_COMBINER_MODE_MASK                                                        0x00000007L
+#define PA_CL_VRS_CNTL__PRIMITIVE_RATE_COMBINER_MODE_MASK                                                     0x00000038L
+#define PA_CL_VRS_CNTL__HTILE_RATE_COMBINER_MODE_MASK                                                         0x000001C0L
+#define PA_CL_VRS_CNTL__SAMPLE_ITER_COMBINER_MODE_MASK                                                        0x00000E00L
+#define PA_CL_VRS_CNTL__EXPOSE_VRS_PIXELS_MASK_MASK                                                           0x00002000L
+#define PA_CL_VRS_CNTL__CMASK_RATE_HINT_FORCE_ZERO_MASK                                                       0x00004000L
 //PA_SU_POINT_SIZE
 #define PA_SU_POINT_SIZE__HEIGHT__SHIFT                                                                       0x0
 #define PA_SU_POINT_SIZE__WIDTH__SHIFT                                                                        0x10
@@ -23088,6 +23120,7 @@
 #define DB_HTILE_SURFACE__DST_OUTSIDE_ZERO_TO_ONE__SHIFT                                                      0x10
 #define DB_HTILE_SURFACE__RESERVED_FIELD_6__SHIFT                                                             0x11
 #define DB_HTILE_SURFACE__PIPE_ALIGNED__SHIFT                                                                 0x12
+#define DB_HTILE_SURFACE__VRS_HTILE_ENCODING__SHIFT                                                           0x13
 #define DB_HTILE_SURFACE__RESERVED_FIELD_1_MASK                                                               0x00000001L
 #define DB_HTILE_SURFACE__FULL_CACHE_MASK                                                                     0x00000002L
 #define DB_HTILE_SURFACE__RESERVED_FIELD_2_MASK                                                               0x00000004L
@@ -23097,6 +23130,7 @@
 #define DB_HTILE_SURFACE__DST_OUTSIDE_ZERO_TO_ONE_MASK                                                        0x00010000L
 #define DB_HTILE_SURFACE__RESERVED_FIELD_6_MASK                                                               0x00020000L
 #define DB_HTILE_SURFACE__PIPE_ALIGNED_MASK                                                                   0x00040000L
+#define DB_HTILE_SURFACE__VRS_HTILE_ENCODING_MASK                                                             0x00180000L
 //DB_SRESULTS_COMPARE_STATE0
 #define DB_SRESULTS_COMPARE_STATE0__COMPAREFUNC0__SHIFT                                                       0x0
 #define DB_SRESULTS_COMPARE_STATE0__COMPAREVALUE0__SHIFT                                                      0x4
@@ -24954,6 +24988,7 @@
 #define CB_COLOR0_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR0_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR0_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR0_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR0_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR0_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR0_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -24962,6 +24997,7 @@
 #define CB_COLOR0_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR0_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR0_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR0_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR1_ATTRIB3
 #define CB_COLOR1_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR1_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -24971,6 +25007,7 @@
 #define CB_COLOR1_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR1_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR1_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR1_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR1_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR1_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR1_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -24979,6 +25016,7 @@
 #define CB_COLOR1_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR1_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR1_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR1_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR2_ATTRIB3
 #define CB_COLOR2_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR2_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -24988,6 +25026,7 @@
 #define CB_COLOR2_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR2_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR2_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR2_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR2_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR2_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR2_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -24996,6 +25035,7 @@
 #define CB_COLOR2_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR2_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR2_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR2_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR3_ATTRIB3
 #define CB_COLOR3_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR3_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -25005,6 +25045,7 @@
 #define CB_COLOR3_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR3_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR3_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR3_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR3_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR3_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR3_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -25013,6 +25054,7 @@
 #define CB_COLOR3_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR3_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR3_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR3_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR4_ATTRIB3
 #define CB_COLOR4_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR4_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -25022,6 +25064,7 @@
 #define CB_COLOR4_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR4_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR4_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR4_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR4_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR4_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR4_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -25030,6 +25073,7 @@
 #define CB_COLOR4_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR4_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR4_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR4_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR5_ATTRIB3
 #define CB_COLOR5_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR5_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -25039,6 +25083,7 @@
 #define CB_COLOR5_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR5_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR5_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR5_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR5_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR5_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR5_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -25047,6 +25092,7 @@
 #define CB_COLOR5_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR5_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR5_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR5_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR6_ATTRIB3
 #define CB_COLOR6_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR6_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -25056,6 +25102,7 @@
 #define CB_COLOR6_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR6_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR6_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR6_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR6_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR6_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR6_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -25064,6 +25111,7 @@
 #define CB_COLOR6_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR6_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR6_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR6_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 //CB_COLOR7_ATTRIB3
 #define CB_COLOR7_ATTRIB3__MIP0_DEPTH__SHIFT                                                                  0x0
 #define CB_COLOR7_ATTRIB3__META_LINEAR__SHIFT                                                                 0xd
@@ -25073,6 +25121,7 @@
 #define CB_COLOR7_ATTRIB3__CMASK_PIPE_ALIGNED__SHIFT                                                          0x1a
 #define CB_COLOR7_ATTRIB3__RESOURCE_LEVEL__SHIFT                                                              0x1b
 #define CB_COLOR7_ATTRIB3__DCC_PIPE_ALIGNED__SHIFT                                                            0x1e
+#define CB_COLOR7_ATTRIB3__VRS_RATE_HINT_ENABLE__SHIFT                                                        0x1f
 #define CB_COLOR7_ATTRIB3__MIP0_DEPTH_MASK                                                                    0x00001FFFL
 #define CB_COLOR7_ATTRIB3__META_LINEAR_MASK                                                                   0x00002000L
 #define CB_COLOR7_ATTRIB3__COLOR_SW_MODE_MASK                                                                 0x0007C000L
@@ -25081,6 +25130,7 @@
 #define CB_COLOR7_ATTRIB3__CMASK_PIPE_ALIGNED_MASK                                                            0x04000000L
 #define CB_COLOR7_ATTRIB3__RESOURCE_LEVEL_MASK                                                                0x38000000L
 #define CB_COLOR7_ATTRIB3__DCC_PIPE_ALIGNED_MASK                                                              0x40000000L
+#define CB_COLOR7_ATTRIB3__VRS_RATE_HINT_ENABLE_MASK                                                          0x80000000L
 
 
 // addressBlock: gc_gfxudec
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
