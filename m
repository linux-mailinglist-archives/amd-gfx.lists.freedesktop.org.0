Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF01EAC02
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9606E93F;
	Mon,  1 Jun 2020 18:29:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327C26E93F
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:29:54 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n11so10026316qkn.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZTX3qPS3Ew+OI754gcszCGEnbDqejo+K2nDyzYE5GFc=;
 b=SG2ow+qs7NBVN8hR5TFfshlbWPz6V9PxlqAqvVy2FrKlmeIt8oTPRo0kqigeRa0j3F
 PrrrXGl6F/Ux1OHvN/iqNppI1Kynai/DYNweQLKP9Ti6vCQGRjcFcjBZoY9wLfdRuS8A
 9DdH99cuVGDa/lpHxY+QdYS3m3YZ8DoWitsc/pXeH3ZfoiM2zRiNsjPfFbreqT+jom60
 xiz4bMMkzwbj4WJF9xwF+7Av1Ki7hgjVdr7PGoSlMKifn5dNzl00U1OxXPoEA0Ki6KP4
 qsOAU2nmoqp6n7EezZfcTzDXYKiHbRtDcAj+N1vvxvfcYCwzbMJKAaVIcccSWeDSGtQg
 s1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZTX3qPS3Ew+OI754gcszCGEnbDqejo+K2nDyzYE5GFc=;
 b=LUeJvuz7PCeRnsiwDEr8RS9XU/7u7Al0xWVVrB8AxQ3p6MlaSm/Ezx6rUhFNKJnA0t
 3ioARbbMEwMIjeNC41A+gkXkG4KbVq382YUmlkeBnpvJakYStb4piIykpSTYxZhX35Yg
 ihSqxBRLRBwoJ4rDiSNSgNfrmmESFPEjmA9PyPwsikyMaiIHTKJwcI0NF86QHu4pdmqQ
 jC6HHFyIdAZ6fsuJBm2tHBHRSt0vA3yQDzhm2RUkEf53NokHwLyJx+FTUg3ldAN/SZEP
 EXfy7NgO7KmpaE0FEfgKPekq6ASpxf3ylzxrnDhglFlaf46u5FQagLvJNSdy7zbsqJn7
 jQXg==
X-Gm-Message-State: AOAM533807aT4j94afQPhLQSgOMkRiP40I09n8eEN4yip/WeBMGohZav
 cdFIiDhwo5lsL8tZRrSkqvyziFwZ
X-Google-Smtp-Source: ABdhPJzZXEYAGpMnHARLCMUjNuri85Jgw4TFTxDT4YkFlzVUjvJpJoLWS81kG6x//NWjsrZmk1ALCQ==
X-Received: by 2002:a37:70c5:: with SMTP id
 l188mr21794787qkc.396.1591036192514; 
 Mon, 01 Jun 2020 11:29:52 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:29:52 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 188/207] drm/amd/display: Add DCN3 HUBP
Date: Mon,  1 Jun 2020 14:29:07 -0400
Message-Id: <20200601182926.1267958-10-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182926.1267958-1-alexander.deucher@amd.com>
References: <20200601182926.1267958-1-alexander.deucher@amd.com>
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

Add support to program the DCN3 HUBP (Display to data fabric interface
pipe)

HW Blocks:

 +--------++------+
 | HUBBUB || HUBP |
 +--------++------+
        |
        v
    +--------+
    |  DPP   |
    +--------+
        |
        v
    +--------+
    |  MPC   |
    +--------+
        |
        v
    +-------+
    |  OPP  |
    +-------+
        |
        v
    +--------+
    |  OPTC  |
    +--------+
        |
        v
    +--------+       +--------+
    |  DIO   |       |  DCCG  |
    +--------+       +--------+

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_hw_types.h  |  35 ++
 .../gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c |  12 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c |  20 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h |  41 ++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c | 532 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h | 292 ++++++++++
 drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |   4 +
 7 files changed, 936 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h

diff --git a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
index a8dc3082e3e1..7bc0be839c9e 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_hw_types.h
@@ -62,6 +62,9 @@ enum dc_plane_addr_type {
 	PLN_ADDR_TYPE_GRAPHICS = 0,
 	PLN_ADDR_TYPE_GRPH_STEREO,
 	PLN_ADDR_TYPE_VIDEO_PROGRESSIVE,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	PLN_ADDR_TYPE_RGBEA
+#endif
 };
 
 struct dc_plane_address {
@@ -84,6 +87,16 @@ struct dc_plane_address {
 			PHYSICAL_ADDRESS_LOC right_meta_addr;
 			union large_integer right_dcc_const_color;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+			PHYSICAL_ADDRESS_LOC left_alpha_addr;
+			PHYSICAL_ADDRESS_LOC left_alpha_meta_addr;
+			union large_integer left_alpha_dcc_const_color;
+
+			PHYSICAL_ADDRESS_LOC right_alpha_addr;
+			PHYSICAL_ADDRESS_LOC right_alpha_meta_addr;
+			union large_integer right_alpha_dcc_const_color;
+#endif
+
 		} grph_stereo;
 
 		/*video  progressive*/
@@ -96,6 +109,18 @@ struct dc_plane_address {
 			PHYSICAL_ADDRESS_LOC chroma_meta_addr;
 			union large_integer chroma_dcc_const_color;
 		} video_progressive;
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+		struct {
+			PHYSICAL_ADDRESS_LOC addr;
+			PHYSICAL_ADDRESS_LOC meta_addr;
+			union large_integer dcc_const_color;
+
+			PHYSICAL_ADDRESS_LOC alpha_addr;
+			PHYSICAL_ADDRESS_LOC alpha_meta_addr;
+			union large_integer alpha_dcc_const_color;
+		} rgbea;
+#endif
 	};
 
 	union large_integer page_table_base;
@@ -131,9 +156,15 @@ struct dc_plane_dcc_param {
 
 	int meta_pitch;
 	bool independent_64b_blks;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint8_t dcc_ind_blk;
+#endif
 
 	int meta_pitch_c;
 	bool independent_64b_blks_c;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	uint8_t dcc_ind_blk_c;
+#endif
 };
 
 /*Displayable pixel format in fb*/
@@ -169,6 +200,10 @@ enum surface_pixel_format {
 	SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FIX,
 	SURFACE_PIXEL_FORMAT_GRPH_RGB111110_FLOAT,
 	SURFACE_PIXEL_FORMAT_GRPH_BGR101111_FLOAT,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	SURFACE_PIXEL_FORMAT_GRPH_RGBE,
+	SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA,
+#endif
 	SURFACE_PIXEL_FORMAT_VIDEO_BEGIN,
 	SURFACE_PIXEL_FORMAT_VIDEO_420_YCbCr =
 		SURFACE_PIXEL_FORMAT_VIDEO_BEGIN,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
index 319366ebb44f..cedf359a00f5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
@@ -326,6 +326,18 @@ void hubp1_program_pixel_format(
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 119);
 		break;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
+		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
+				SURFACE_PIXEL_FORMAT, 116,
+				ALPHA_PLANE_EN, 0);
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
+		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
+				SURFACE_PIXEL_FORMAT, 116,
+				ALPHA_PLANE_EN, 1);
+		break;
+#endif
 	default:
 		BREAK_TO_DEBUGGER();
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 84d7ac5dd206..bb920d0e0b89 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -336,6 +336,10 @@ void hubp2_program_size(
 	 */
 	use_pitch_c = format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN
 		&& format < SURFACE_PIXEL_FORMAT_SUBSAMPLE_END;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	use_pitch_c = use_pitch_c
+		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
+#endif
 	if (use_pitch_c) {
 		ASSERT(plane_size->chroma_pitch != 0);
 		/* Chroma pitch zero can cause system hang! */
@@ -360,6 +364,10 @@ void hubp2_program_size(
 			PITCH, pitch, META_PITCH, meta_pitch);
 
 	use_pitch_c = format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	use_pitch_c = use_pitch_c
+		|| (format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA);
+#endif
 	if (use_pitch_c)
 		REG_UPDATE_2(DCSURF_SURFACE_PITCH_C,
 			PITCH_C, pitch_c, META_PITCH_C, meta_pitch_c);
@@ -505,6 +513,18 @@ void hubp2_program_pixel_format(
 		REG_UPDATE(DCSURF_SURFACE_CONFIG,
 				SURFACE_PIXEL_FORMAT, 119);
 		break;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE:
+		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
+				SURFACE_PIXEL_FORMAT, 116,
+				ALPHA_PLANE_EN, 0);
+		break;
+	case SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA:
+		REG_UPDATE_2(DCSURF_SURFACE_CONFIG,
+				SURFACE_PIXEL_FORMAT, 116,
+				ALPHA_PLANE_EN, 1);
+		break;
+#endif
 	default:
 		BREAK_TO_DEBUGGER();
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
index 8c04a3606a54..4a2c93087459 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
@@ -157,6 +157,12 @@
 	uint32_t VBLANK_PARAMETERS_5;\
 	uint32_t VBLANK_PARAMETERS_6
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define DCN30_HUBP_REG_COMMON_VARIABLE_LIST \
+	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;\
+	uint32_t DCN_DMDATA_VM_CNTL
+#endif
+
 #define DCN2_HUBP_REG_FIELD_VARIABLE_LIST(type) \
 	DCN_HUBP_REG_FIELD_BASE_LIST(type); \
 	type DMDATA_ADDRESS_HIGH;\
@@ -192,17 +198,52 @@
 	type REFCYC_PER_META_CHUNK_FLIP_C; \
 	type VM_GROUP_SIZE
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+#define DCN30_HUBP_REG_FIELD_VARIABLE_LIST(type) \
+	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(type);\
+	type PRIMARY_SURFACE_DCC_IND_BLK;\
+	type SECONDARY_SURFACE_DCC_IND_BLK;\
+	type PRIMARY_SURFACE_DCC_IND_BLK_C;\
+	type SECONDARY_SURFACE_DCC_IND_BLK_C;\
+	type ALPHA_PLANE_EN;\
+	type REFCYC_PER_VM_DMDATA;\
+	type DMDATA_VM_FAULT_STATUS;\
+	type DMDATA_VM_FAULT_STATUS_CLEAR; \
+	type DMDATA_VM_UNDERFLOW_STATUS;\
+	type DMDATA_VM_LATE_STATUS;\
+	type DMDATA_VM_UNDERFLOW_STATUS_CLEAR; \
+	type DMDATA_VM_DONE; \
+	type CROSSBAR_SRC_Y_G; \
+	type CROSSBAR_SRC_ALPHA; \
+	type PACK_3TO2_ELEMENT_DISABLE; \
+	type ROW_TTU_MODE; \
+	type NUM_PKRS
+#endif
 
 struct dcn_hubp2_registers {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
+#else
 	DCN21_HUBP_REG_COMMON_VARIABLE_LIST;
+#endif
 };
 
 struct dcn_hubp2_shift {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
+#else
 	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
+#endif
+
 };
 
 struct dcn_hubp2_mask {
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
+#else
 	DCN21_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
+#endif
+
 };
 
 struct dcn20_hubp {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
new file mode 100644
index 000000000000..af462fe4260d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
@@ -0,0 +1,532 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dcn30_hubp.h"
+
+#include "dm_services.h"
+#include "dce_calcs.h"
+#include "reg_helper.h"
+#include "basics/conversion.h"
+#include "dcn20/dcn20_hubp.h"
+#include "dcn21/dcn21_hubp.h"
+
+#define REG(reg)\
+	hubp2->hubp_regs->reg
+
+#define CTX \
+	hubp2->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
+
+void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
+		struct vm_system_aperture_param *apt)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	PHYSICAL_ADDRESS_LOC mc_vm_apt_default;
+	PHYSICAL_ADDRESS_LOC mc_vm_apt_low;
+	PHYSICAL_ADDRESS_LOC mc_vm_apt_high;
+
+	// The format of default addr is 48:12 of the 48 bit addr
+	mc_vm_apt_default.quad_part = apt->sys_default.quad_part >> 12;
+
+	// The format of high/low are 48:18 of the 48 bit addr
+	mc_vm_apt_low.quad_part = apt->sys_low.quad_part >> 18;
+	mc_vm_apt_high.quad_part = apt->sys_high.quad_part >> 18;
+
+	REG_SET(DCN_VM_SYSTEM_APERTURE_LOW_ADDR, 0,
+			MC_VM_SYSTEM_APERTURE_LOW_ADDR, mc_vm_apt_low.quad_part);
+
+	REG_SET(DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, 0,
+			MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mc_vm_apt_high.quad_part);
+
+	REG_SET_2(DCN_VM_MX_L1_TLB_CNTL, 0,
+			ENABLE_L1_TLB, 1,
+			SYSTEM_ACCESS_MODE, 0x3);
+}
+
+bool hubp3_program_surface_flip_and_addr(
+	struct hubp *hubp,
+	const struct dc_plane_address *address,
+	bool flip_immediate)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	//program flip type
+	REG_UPDATE(DCSURF_FLIP_CONTROL,
+			SURFACE_FLIP_TYPE, flip_immediate);
+
+	// Program VMID reg
+	if (flip_immediate == 0)
+		REG_UPDATE(VMID_SETTINGS_0,
+			VMID, address->vmid);
+
+	if (address->type == PLN_ADDR_TYPE_GRPH_STEREO) {
+		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, 0x1);
+		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_IN_STEREOSYNC, 0x1);
+
+	} else {
+		// turn off stereo if not in stereo
+		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, 0x0);
+		REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_FLIP_IN_STEREOSYNC, 0x0);
+	}
+
+	/* HW automatically latch rest of address register on write to
+	 * DCSURF_PRIMARY_SURFACE_ADDRESS if SURFACE_UPDATE_LOCK is not used
+	 *
+	 * program high first and then the low addr, order matters!
+	 */
+	switch (address->type) {
+	case PLN_ADDR_TYPE_GRAPHICS:
+		/* DCN1.0 does not support const color
+		 * TODO: program DCHUBBUB_RET_PATH_DCC_CFGx_0/1
+		 * base on address->grph.dcc_const_color
+		 * x = 0, 2, 4, 6 for pipe 0, 1, 2, 3 for rgb and luma
+		 * x = 1, 3, 5, 7 for pipe 0, 1, 2, 3 for chroma
+		 */
+
+		if (address->grph.addr.quad_part == 0)
+			break;
+
+		REG_UPDATE_2(DCSURF_SURFACE_CONTROL,
+				PRIMARY_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ, address->tmz_surface);
+
+		if (address->grph.meta_addr.quad_part != 0) {
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH,
+					address->grph.meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS, 0,
+					PRIMARY_META_SURFACE_ADDRESS,
+					address->grph.meta_addr.low_part);
+		}
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH,
+				address->grph.addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS, 0,
+				PRIMARY_SURFACE_ADDRESS,
+				address->grph.addr.low_part);
+		break;
+	case PLN_ADDR_TYPE_VIDEO_PROGRESSIVE:
+		if (address->video_progressive.luma_addr.quad_part == 0
+				|| address->video_progressive.chroma_addr.quad_part == 0)
+			break;
+
+		REG_UPDATE_4(DCSURF_SURFACE_CONTROL,
+				PRIMARY_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_SURFACE_TMZ_C, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ_C, address->tmz_surface);
+
+		if (address->video_progressive.luma_meta_addr.quad_part != 0) {
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH_C,
+					address->video_progressive.chroma_meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, 0,
+					PRIMARY_META_SURFACE_ADDRESS_C,
+					address->video_progressive.chroma_meta_addr.low_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH,
+					address->video_progressive.luma_meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS, 0,
+					PRIMARY_META_SURFACE_ADDRESS,
+					address->video_progressive.luma_meta_addr.low_part);
+		}
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH_C,
+				address->video_progressive.chroma_addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_C, 0,
+				PRIMARY_SURFACE_ADDRESS_C,
+				address->video_progressive.chroma_addr.low_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH,
+				address->video_progressive.luma_addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS, 0,
+				PRIMARY_SURFACE_ADDRESS,
+				address->video_progressive.luma_addr.low_part);
+		break;
+	case PLN_ADDR_TYPE_GRPH_STEREO:
+		if (address->grph_stereo.left_addr.quad_part == 0)
+			break;
+		if (address->grph_stereo.right_addr.quad_part == 0)
+			break;
+
+		REG_UPDATE_8(DCSURF_SURFACE_CONTROL,
+				PRIMARY_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_SURFACE_TMZ_C, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ_C, address->tmz_surface,
+				SECONDARY_SURFACE_TMZ, address->tmz_surface,
+				SECONDARY_SURFACE_TMZ_C, address->tmz_surface,
+				SECONDARY_META_SURFACE_TMZ, address->tmz_surface,
+				SECONDARY_META_SURFACE_TMZ_C, address->tmz_surface);
+
+		if (address->grph_stereo.right_meta_addr.quad_part != 0) {
+
+			REG_SET(DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH_C, 0,
+				SECONDARY_META_SURFACE_ADDRESS_HIGH_C,
+				address->grph_stereo.right_alpha_meta_addr.high_part);
+
+			REG_SET(DCSURF_SECONDARY_META_SURFACE_ADDRESS_C, 0,
+				SECONDARY_META_SURFACE_ADDRESS_C,
+				address->grph_stereo.right_alpha_meta_addr.low_part);
+
+			REG_SET(DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH, 0,
+					SECONDARY_META_SURFACE_ADDRESS_HIGH,
+					address->grph_stereo.right_meta_addr.high_part);
+
+			REG_SET(DCSURF_SECONDARY_META_SURFACE_ADDRESS, 0,
+					SECONDARY_META_SURFACE_ADDRESS,
+					address->grph_stereo.right_meta_addr.low_part);
+		}
+		if (address->grph_stereo.left_meta_addr.quad_part != 0) {
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, 0,
+				PRIMARY_META_SURFACE_ADDRESS_HIGH_C,
+				address->grph_stereo.left_alpha_meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, 0,
+				PRIMARY_META_SURFACE_ADDRESS_C,
+				address->grph_stereo.left_alpha_meta_addr.low_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH,
+					address->grph_stereo.left_meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS, 0,
+					PRIMARY_META_SURFACE_ADDRESS,
+					address->grph_stereo.left_meta_addr.low_part);
+		}
+
+		REG_SET(DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH_C, 0,
+				SECONDARY_SURFACE_ADDRESS_HIGH_C,
+				address->grph_stereo.right_alpha_addr.high_part);
+
+		REG_SET(DCSURF_SECONDARY_SURFACE_ADDRESS_C, 0,
+				SECONDARY_SURFACE_ADDRESS_C,
+				address->grph_stereo.right_alpha_addr.low_part);
+
+		REG_SET(DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH, 0,
+				SECONDARY_SURFACE_ADDRESS_HIGH,
+				address->grph_stereo.right_addr.high_part);
+
+		REG_SET(DCSURF_SECONDARY_SURFACE_ADDRESS, 0,
+				SECONDARY_SURFACE_ADDRESS,
+				address->grph_stereo.right_addr.low_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH_C,
+				address->grph_stereo.left_alpha_addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_C, 0,
+				PRIMARY_SURFACE_ADDRESS_C,
+				address->grph_stereo.left_alpha_addr.low_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH,
+				address->grph_stereo.left_addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS, 0,
+				PRIMARY_SURFACE_ADDRESS,
+				address->grph_stereo.left_addr.low_part);
+		break;
+	case PLN_ADDR_TYPE_RGBEA:
+		if (address->rgbea.addr.quad_part == 0
+				|| address->rgbea.alpha_addr.quad_part == 0)
+			break;
+
+		REG_UPDATE_4(DCSURF_SURFACE_CONTROL,
+				PRIMARY_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_SURFACE_TMZ_C, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ, address->tmz_surface,
+				PRIMARY_META_SURFACE_TMZ_C, address->tmz_surface);
+
+		if (address->rgbea.meta_addr.quad_part != 0) {
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH_C,
+					address->rgbea.alpha_meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, 0,
+					PRIMARY_META_SURFACE_ADDRESS_C,
+					address->rgbea.alpha_meta_addr.low_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, 0,
+					PRIMARY_META_SURFACE_ADDRESS_HIGH,
+					address->rgbea.meta_addr.high_part);
+
+			REG_SET(DCSURF_PRIMARY_META_SURFACE_ADDRESS, 0,
+					PRIMARY_META_SURFACE_ADDRESS,
+					address->rgbea.meta_addr.low_part);
+		}
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH_C,
+				address->rgbea.alpha_addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_C, 0,
+				PRIMARY_SURFACE_ADDRESS_C,
+				address->rgbea.alpha_addr.low_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, 0,
+				PRIMARY_SURFACE_ADDRESS_HIGH,
+				address->rgbea.addr.high_part);
+
+		REG_SET(DCSURF_PRIMARY_SURFACE_ADDRESS, 0,
+				PRIMARY_SURFACE_ADDRESS,
+				address->rgbea.addr.low_part);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+
+	hubp->request_address = *address;
+
+	return true;
+}
+
+static void hubp3_program_tiling(
+	struct dcn20_hubp *hubp2,
+	const union dc_tiling_info *info,
+	const enum surface_pixel_format pixel_format)
+{
+	REG_UPDATE_4(DCSURF_ADDR_CONFIG,
+		NUM_PIPES, log_2(info->gfx9.num_pipes),
+		PIPE_INTERLEAVE, info->gfx9.pipe_interleave,
+		MAX_COMPRESSED_FRAGS, log_2(info->gfx9.max_compressed_frags),
+		NUM_PKRS, log_2(info->gfx9.num_pkrs));
+
+	REG_UPDATE_3(DCSURF_TILING_CONFIG,
+			SW_MODE, info->gfx9.swizzle,
+			META_LINEAR, info->gfx9.meta_linear,
+			PIPE_ALIGNED, info->gfx9.pipe_aligned);
+
+}
+
+void hubp3_dcc_control(struct hubp *hubp, bool enable,
+		enum hubp_ind_block_size blk_size)
+{
+	uint32_t dcc_en = enable ? 1 : 0;
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_UPDATE_4(DCSURF_SURFACE_CONTROL,
+			PRIMARY_SURFACE_DCC_EN, dcc_en,
+			PRIMARY_SURFACE_DCC_IND_BLK, blk_size,
+			SECONDARY_SURFACE_DCC_EN, dcc_en,
+			SECONDARY_SURFACE_DCC_IND_BLK, blk_size);
+}
+
+void hubp3_dcc_control_sienna_cichlid(struct hubp *hubp,
+		struct dc_plane_dcc_param *dcc)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	/*Workaround until UMD fix the new dcc_ind_blk interface */
+	if (dcc->independent_64b_blks && dcc->dcc_ind_blk == 0)
+		dcc->dcc_ind_blk = 1;
+	if (dcc->independent_64b_blks_c && dcc->dcc_ind_blk_c == 0)
+		dcc->dcc_ind_blk_c = 1;
+
+	REG_UPDATE_6(DCSURF_SURFACE_CONTROL,
+		PRIMARY_SURFACE_DCC_EN, dcc->enable,
+		PRIMARY_SURFACE_DCC_IND_BLK, dcc->dcc_ind_blk,
+		PRIMARY_SURFACE_DCC_IND_BLK_C, dcc->dcc_ind_blk_c,
+		SECONDARY_SURFACE_DCC_EN, dcc->enable,
+		SECONDARY_SURFACE_DCC_IND_BLK, dcc->dcc_ind_blk,
+		SECONDARY_SURFACE_DCC_IND_BLK_C, dcc->dcc_ind_blk_c);
+}
+
+void hubp3_dmdata_set_attributes(
+		struct hubp *hubp,
+		const struct dc_dmdata_attributes *attr)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	/*always HW mode */
+	REG_UPDATE(DMDATA_CNTL,
+			DMDATA_MODE, 1);
+
+	/* for DMDATA flip, need to use SURFACE_UPDATE_LOCK */
+	REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_UPDATE_LOCK, 1);
+
+	/* toggle DMDATA_UPDATED and set repeat and size */
+	REG_UPDATE(DMDATA_CNTL,
+			DMDATA_UPDATED, 0);
+	REG_UPDATE_3(DMDATA_CNTL,
+			DMDATA_UPDATED, 1,
+			DMDATA_REPEAT, attr->dmdata_repeat,
+			DMDATA_SIZE, attr->dmdata_size);
+
+	/* set DMDATA address */
+	REG_WRITE(DMDATA_ADDRESS_LOW, attr->address.low_part);
+	REG_UPDATE(DMDATA_ADDRESS_HIGH,
+			DMDATA_ADDRESS_HIGH, attr->address.high_part);
+
+	REG_UPDATE(DCSURF_FLIP_CONTROL, SURFACE_UPDATE_LOCK, 0);
+
+}
+
+
+void hubp3_program_surface_config(
+	struct hubp *hubp,
+	enum surface_pixel_format format,
+	union dc_tiling_info *tiling_info,
+	struct plane_size *plane_size,
+	enum dc_rotation_angle rotation,
+	struct dc_plane_dcc_param *dcc,
+	bool horizontal_mirror,
+	unsigned int compat_level)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	hubp3_dcc_control_sienna_cichlid(hubp, dcc);
+	hubp3_program_tiling(hubp2, tiling_info, format);
+	hubp2_program_size(hubp, format, plane_size, dcc);
+	hubp2_program_rotation(hubp, rotation, horizontal_mirror);
+	hubp2_program_pixel_format(hubp, format);
+}
+
+static void hubp3_program_deadline(
+		struct hubp *hubp,
+		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
+		struct _vcs_dpi_display_ttu_regs_st *ttu_attr)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	hubp2_program_deadline(hubp, dlg_attr, ttu_attr);
+	REG_UPDATE(DCN_DMDATA_VM_CNTL,
+			REFCYC_PER_VM_DMDATA, dlg_attr->refcyc_per_vm_dmdata);
+}
+
+void hubp3_read_state(struct hubp *hubp)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+	struct dcn_hubp_state *s = &hubp2->state;
+	struct _vcs_dpi_display_rq_regs_st *rq_regs = &s->rq_regs;
+
+	hubp2_read_state_common(hubp);
+
+	REG_GET_7(DCHUBP_REQ_SIZE_CONFIG,
+		CHUNK_SIZE, &rq_regs->rq_regs_l.chunk_size,
+		MIN_CHUNK_SIZE, &rq_regs->rq_regs_l.min_chunk_size,
+		META_CHUNK_SIZE, &rq_regs->rq_regs_l.meta_chunk_size,
+		MIN_META_CHUNK_SIZE, &rq_regs->rq_regs_l.min_meta_chunk_size,
+		DPTE_GROUP_SIZE, &rq_regs->rq_regs_l.dpte_group_size,
+		SWATH_HEIGHT, &rq_regs->rq_regs_l.swath_height,
+		PTE_ROW_HEIGHT_LINEAR, &rq_regs->rq_regs_l.pte_row_height_linear);
+
+	REG_GET_7(DCHUBP_REQ_SIZE_CONFIG_C,
+		CHUNK_SIZE_C, &rq_regs->rq_regs_c.chunk_size,
+		MIN_CHUNK_SIZE_C, &rq_regs->rq_regs_c.min_chunk_size,
+		META_CHUNK_SIZE_C, &rq_regs->rq_regs_c.meta_chunk_size,
+		MIN_META_CHUNK_SIZE_C, &rq_regs->rq_regs_c.min_meta_chunk_size,
+		DPTE_GROUP_SIZE_C, &rq_regs->rq_regs_c.dpte_group_size,
+		SWATH_HEIGHT_C, &rq_regs->rq_regs_c.swath_height,
+		PTE_ROW_HEIGHT_LINEAR_C, &rq_regs->rq_regs_c.pte_row_height_linear);
+
+}
+
+void hubp3_setup(
+		struct hubp *hubp,
+		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
+		struct _vcs_dpi_display_ttu_regs_st *ttu_attr,
+		struct _vcs_dpi_display_rq_regs_st *rq_regs,
+		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest)
+{
+	/* otg is locked when this func is called. Register are double buffered.
+	 * disable the requestors is not needed
+	 */
+	hubp2_vready_at_or_After_vsync(hubp, pipe_dest);
+	hubp21_program_requestor(hubp, rq_regs);
+	hubp3_program_deadline(hubp, dlg_attr, ttu_attr);
+}
+
+void hubp3_init(struct hubp *hubp)
+{
+	// DEDCN21-133: Inconsistent row starting line for flip between DPTE and Meta
+	// This is a chicken bit to enable the ECO fix.
+
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+	//hubp[i].HUBPREQ_DEBUG.HUBPREQ_DEBUG[26] = 1;
+	REG_WRITE(HUBPREQ_DEBUG, 1 << 26);
+}
+
+static struct hubp_funcs dcn30_hubp_funcs = {
+	.hubp_enable_tripleBuffer = hubp2_enable_triplebuffer,
+	.hubp_is_triplebuffer_enabled = hubp2_is_triplebuffer_enabled,
+	.hubp_program_surface_flip_and_addr = hubp3_program_surface_flip_and_addr,
+	.hubp_program_surface_config = hubp3_program_surface_config,
+	.hubp_is_flip_pending = hubp2_is_flip_pending,
+	.hubp_setup = hubp3_setup,
+	.hubp_setup_interdependent = hubp2_setup_interdependent,
+	.hubp_set_vm_system_aperture_settings = hubp3_set_vm_system_aperture_settings,
+	.set_blank = hubp2_set_blank,
+	.dcc_control = hubp3_dcc_control,
+	.mem_program_viewport = min_set_viewport,
+	.set_cursor_attributes	= hubp2_cursor_set_attributes,
+	.set_cursor_position	= hubp2_cursor_set_position,
+	.hubp_clk_cntl = hubp2_clk_cntl,
+	.hubp_vtg_sel = hubp2_vtg_sel,
+	.dmdata_set_attributes = hubp3_dmdata_set_attributes,
+	.dmdata_load = hubp2_dmdata_load,
+	.dmdata_status_done = hubp2_dmdata_status_done,
+	.hubp_read_state = hubp3_read_state,
+	.hubp_clear_underflow = hubp2_clear_underflow,
+	.hubp_set_flip_control_surface_gsl = hubp2_set_flip_control_surface_gsl,
+	.hubp_init = hubp3_init,
+};
+
+bool hubp3_construct(
+	struct dcn20_hubp *hubp2,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn_hubp2_registers *hubp_regs,
+	const struct dcn_hubp2_shift *hubp_shift,
+	const struct dcn_hubp2_mask *hubp_mask)
+{
+	hubp2->base.funcs = &dcn30_hubp_funcs;
+	hubp2->base.ctx = ctx;
+	hubp2->hubp_regs = hubp_regs;
+	hubp2->hubp_shift = hubp_shift;
+	hubp2->hubp_mask = hubp_mask;
+	hubp2->base.inst = inst;
+	hubp2->base.opp_id = OPP_ID_INVALID;
+	hubp2->base.mpcc_id = 0xf;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
new file mode 100644
index 000000000000..fd1fb3c531d1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.h
@@ -0,0 +1,292 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HUBP_DCN30_H__
+#define __DC_HUBP_DCN30_H__
+
+#include "dcn20/dcn20_hubp.h"
+#include "dcn21/dcn21_hubp.h"
+
+#define HUBP_REG_LIST_DCN30(id)\
+	HUBP_REG_LIST_DCN21(id),\
+	SRI(DCN_DMDATA_VM_CNTL, HUBPREQ, id)
+
+
+#define HUBP_MASK_SH_LIST_DCN30_BASE(mask_sh)\
+	HUBP_MASK_SH_LIST_DCN21_COMMON(mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ALPHA_PLANE_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, REFCYC_PER_VM_DMDATA, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_LATE_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_DONE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, NUM_PKRS, mask_sh)
+
+
+#define HUBP_MASK_SH_LIST_DCN30(mask_sh)\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, REFCYC_PER_VM_DMDATA, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_LATE_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_DONE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_BLANK_EN, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_TTU_DISABLE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_UNDERFLOW_STATUS, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_UNDERFLOW_CLEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_NO_OUTSTANDING_REQ, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_VTG_SEL, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_DISABLE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, NUM_PIPES, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, PIPE_INTERLEAVE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, MAX_COMPRESSED_FRAGS, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, NUM_PKRS, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, SW_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, META_LINEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, PIPE_ALIGNED, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH, PITCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH, META_PITCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH_C, PITCH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH_C, META_PITCH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, SURFACE_PIXEL_FORMAT, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_TYPE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_IN_STEREOSYNC, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_PENDING, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_UPDATE_LOCK, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_WIDTH, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START, PRI_VIEWPORT_X_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START, PRI_VIEWPORT_Y_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION, SEC_VIEWPORT_WIDTH, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION, SEC_VIEWPORT_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START, SEC_VIEWPORT_X_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START, SEC_VIEWPORT_Y_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_C, PRI_VIEWPORT_WIDTH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_C, PRI_VIEWPORT_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START_C, PRI_VIEWPORT_X_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START_C, PRI_VIEWPORT_Y_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION_C, SEC_VIEWPORT_WIDTH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION_C, SEC_VIEWPORT_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START_C, SEC_VIEWPORT_X_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START_C, SEC_VIEWPORT_Y_START_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, PRIMARY_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS, PRIMARY_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH, SECONDARY_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS, SECONDARY_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, PRIMARY_META_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS, PRIMARY_META_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH, SECONDARY_META_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS, SECONDARY_META_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, PRIMARY_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_C, PRIMARY_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH_C, SECONDARY_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_C, SECONDARY_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, PRIMARY_META_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, PRIMARY_META_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH_C, SECONDARY_META_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_C, SECONDARY_META_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE, SURFACE_INUSE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_HIGH, SURFACE_INUSE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_C, SURFACE_INUSE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_HIGH_C, SURFACE_INUSE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE, SURFACE_EARLIEST_INUSE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_HIGH, SURFACE_EARLIEST_INUSE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_C, SURFACE_EARLIEST_INUSE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_HIGH_C, SURFACE_EARLIEST_INUSE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_META_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_META_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_IND_BLK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_IND_BLK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_META_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_META_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_IND_BLK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_IND_BLK_C, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, DET_BUF_PLANE1_BASE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_CB_B, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_CR_R, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_Y_G, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_ALPHA, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, PACK_3TO2_ELEMENT_DISABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, DRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, PRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, MRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, CRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, MIN_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, META_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, MIN_META_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, DPTE_GROUP_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, SWATH_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, PTE_ROW_HEIGHT_LINEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, MIN_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, META_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, MIN_META_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, DPTE_GROUP_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, SWATH_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, PTE_ROW_HEIGHT_LINEAR_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_0, REFCYC_H_BLANK_END, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_0, DLG_V_BLANK_END, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_1, MIN_DST_Y_NEXT_START, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_DIMENSIONS, REFCYC_PER_HTOTAL, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_AFTER_SCALER, REFCYC_X_AFTER_SCALER, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_AFTER_SCALER, DST_Y_AFTER_SCALER, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_0, DST_Y_PER_VM_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_0, DST_Y_PER_ROW_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_REF_FREQ_TO_PIX_FREQ, REF_FREQ_TO_PIX_FREQ, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_1, REFCYC_PER_PTE_GROUP_VBLANK_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_3, REFCYC_PER_META_CHUNK_VBLANK_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_4, DST_Y_PER_META_ROW_NOM_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_5, REFCYC_PER_META_CHUNK_NOM_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY_PRE, REFCYC_PER_LINE_DELIVERY_PRE_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY_PRE, REFCYC_PER_LINE_DELIVERY_PRE_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY, REFCYC_PER_LINE_DELIVERY_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY, REFCYC_PER_LINE_DELIVERY_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_2, REFCYC_PER_PTE_GROUP_VBLANK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_4, REFCYC_PER_META_CHUNK_VBLANK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_6, DST_Y_PER_META_ROW_NOM_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_7, REFCYC_PER_META_CHUNK_NOM_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_TTU_QOS_WM, QoS_LEVEL_LOW_WM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_TTU_QOS_WM, QoS_LEVEL_HIGH_WM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, MIN_TTU_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, QoS_LEVEL_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, ROW_TTU_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, REFCYC_PER_REQ_DELIVERY, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, QoS_LEVEL_FIXED, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, QoS_RAMP_DISABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL1, REFCYC_PER_REQ_DELIVERY_PRE, mask_sh),\
+	HUBP_SF(HUBP0_HUBP_CLK_CNTL, HUBP_CLOCK_ENABLE, mask_sh),\
+	HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ROTATION_ANGLE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, H_MIRROR_EN, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ALPHA_PLANE_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, DST_Y_PREFETCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, VRATIO_PREFETCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS_C, VRATIO_PREFETCH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_LOW_ADDR, MC_VM_SYSTEM_APERTURE_LOW_ADDR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mask_sh),\
+	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_DST_Y_OFFSET, mask_sh), \
+	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_CHUNK_HDL_ADJUST, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS_HIGH, CURSOR_SURFACE_ADDRESS_HIGH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS, CURSOR_SURFACE_ADDRESS, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_WIDTH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_HEIGHT, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_2X_MAGNIFY, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_PITCH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_LINES_PER_CHUNK, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_ENABLE, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_X_POSITION, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_Y_POSITION, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_X, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_Y, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_DST_OFFSET, CURSOR_DST_X_OFFSET, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_ADDRESS_HIGH, DMDATA_ADDRESS_HIGH, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_UPDATED, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_REPEAT, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_SIZE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_UPDATED, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_REPEAT, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_SIZE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_LEVEL, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_DL_DELTA, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_STATUS, DMDATA_DONE, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_VM_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_ROW_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_1, REFCYC_PER_PTE_GROUP_FLIP_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_2, REFCYC_PER_META_CHUNK_FLIP_L, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_DISABLE_STOP_DATA_DURING_VM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, HUBPREQ_MASTER_UPDATE_LOCK_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_GSL_ENABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_TRIPLE_BUFFER_ENABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_VMID_SETTINGS_0, VMID, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_3, REFCYC_PER_VM_GROUP_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_4, REFCYC_PER_VM_REQ_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_5, REFCYC_PER_PTE_GROUP_FLIP_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_6, REFCYC_PER_META_CHUNK_FLIP_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_5, REFCYC_PER_VM_GROUP_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_6, REFCYC_PER_VM_REQ_VBLANK, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, VM_GROUP_SIZE, mask_sh)
+
+bool hubp3_construct(
+		struct dcn20_hubp *hubp2,
+		struct dc_context *ctx,
+		uint32_t inst,
+		const struct dcn_hubp2_registers *hubp_regs,
+		const struct dcn_hubp2_shift *hubp_shift,
+		const struct dcn_hubp2_mask *hubp_mask);
+
+bool hubp3_program_surface_flip_and_addr(
+	struct hubp *hubp,
+	const struct dc_plane_address *address,
+	bool flip_immediate);
+
+void hubp3_program_surface_config(
+	struct hubp *hubp,
+	enum surface_pixel_format format,
+	union dc_tiling_info *tiling_info,
+	struct plane_size *plane_size,
+	enum dc_rotation_angle rotation,
+	struct dc_plane_dcc_param *dcc,
+	bool horizontal_mirror,
+	unsigned int compat_level);
+
+void hubp3_setup(
+		struct hubp *hubp,
+		struct _vcs_dpi_display_dlg_regs_st *dlg_attr,
+		struct _vcs_dpi_display_ttu_regs_st *ttu_attr,
+		struct _vcs_dpi_display_rq_regs_st *rq_regs,
+		struct _vcs_dpi_display_pipe_dest_params_st *pipe_dest);
+
+void hubp3_dcc_control(struct hubp *hubp, bool enable,
+		enum hubp_ind_block_size blk_size);
+
+void hubp3_dcc_control_sienna_cichlid(struct hubp *hubp,
+		struct dc_plane_dcc_param *dcc);
+
+void hubp3_dmdata_set_attributes(
+		struct hubp *hubp,
+		const struct dc_dmdata_attributes *attr);
+
+void hubp3_read_state(struct hubp *hubp);
+
+void hubp3_init(struct hubp *hubp);
+
+#endif /* __DC_HUBP_DCN30_H__ */
+
+
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
index efce08e4c0ca..286cceeb9c24 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h
@@ -48,6 +48,10 @@ enum cursor_lines_per_chunk {
 enum hubp_ind_block_size {
 	hubp_ind_block_unconstrained = 0,
 	hubp_ind_block_64b,
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	hubp_ind_block_128b,
+	hubp_ind_block_64b_no_128bcl,
+#endif
 };
 
 struct hubp {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
