Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E871EAC10
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8C6E9D7;
	Mon,  1 Jun 2020 18:30:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64EC6E9DA
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:30:13 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id er17so492287qvb.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvR5nMDKsDkgNe1DkblfCbjvsxm5G0gJyon/iZHJdSo=;
 b=kp5A6woXJnTqrptSvYBnYERn4TRW2zMe0ordkud7e37NuAQdrtF7lPLML4fEOLPsaI
 UnNldpehy8Xe7jTlYppGTiHrLu60sJ1lHg9BBdo6ei9++1r6cKz2r7Emniv3rpE1zeLQ
 6KYsWOG9/2EmU7DwsjfZO2Vn22AH9AkkbonXwAt6omE7ghcRkNcgDWip3aggYZ2mx9Du
 b1YhVftbJPzG98AXctJoRef4CqP4qZSJ+OhLPVmtGU1BM14fg6o4tj5nbbCiv7tkh/0l
 8L9k2kzsGaid/MNKGXFrCtJbOW2/e0ziAqns4vy/3c5rau6f2ef6mitjyzE08Z/S3Y9R
 e0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvR5nMDKsDkgNe1DkblfCbjvsxm5G0gJyon/iZHJdSo=;
 b=bE4/lSViVTOeNd4JSG7zpmyck4nhPDzdblS/FPd5CvuUkvQb/Bqiqf5RpsdEe3w+yu
 XE8gHLLpVxHWkbzZw8MAJovC9TZDykfmiJcDovUHqEnqhqIMJGWxHw66LqQEPlki8/Bf
 sMmSk/iLft3/766Bl+i5zNlbC6QY6HGbRM85Q2zh9FbXo+wTodH/K4QCUZ4dy48nvVmh
 I2CsM9+ktBTd4NuEi2QGorvsLAo7hk5dfYf9+iDZ7HjYazeGQEFIz4Ean6tk3JJ/Piih
 3LywrOgr8j4pnzwIlOuh1cSDehfuUgwCYtNs3TQBnQZl2Wdz/WRI2Ako6HrJR4KuwAqg
 cwhA==
X-Gm-Message-State: AOAM533gh1P6BRGg5bD+ybPe4ZESNeCWEG2cO8Xzx/Vb+Jp4Nq+Y3NYO
 NbfjbiVwUs/zdeIQSQGOvRhAduDR
X-Google-Smtp-Source: ABdhPJyxN4ueYHvBYzjz6eq2zDORgyOrCjBB9LBf77mFXd0yN5OJtTvd9t9s+/3UO2VNMtAm+9eQSQ==
X-Received: by 2002:a0c:a3a6:: with SMTP id v35mr21967028qvv.206.1591036212263; 
 Mon, 01 Jun 2020 11:30:12 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id z194sm8592qkb.73.2020.06.01.11.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:30:11 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 199/207] drm/amd/display: Add DCN3 AFMT
Date: Mon,  1 Jun 2020 14:29:18 -0400
Message-Id: <20200601182926.1267958-21-alexander.deucher@amd.com>
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

Audio formating

Audio related code for setup/control

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c | 206 ++++++++++++++++
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h | 230 ++++++++++++++++++
 2 files changed, 436 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
new file mode 100644
index 000000000000..2b08b1d72177
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -0,0 +1,206 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+
+#include "dc_bios_types.h"
+#include "dcn30_afmt.h"
+#include "reg_helper.h"
+
+#define DC_LOGGER \
+		afmt3->base.ctx->logger
+
+#define REG(reg)\
+	(afmt3->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	afmt3->afmt_shift->field_name, afmt3->afmt_mask->field_name
+
+
+#define CTX \
+	afmt3->base.ctx
+
+
+static void afmt3_setup_hdmi_audio(
+	struct afmt *afmt)
+{
+	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
+
+	/* AFMT_AUDIO_PACKET_CONTROL */
+	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, 1);
+
+	/* AFMT_AUDIO_PACKET_CONTROL2 */
+	REG_UPDATE_2(AFMT_AUDIO_PACKET_CONTROL2,
+			AFMT_AUDIO_LAYOUT_OVRD, 0,
+			AFMT_60958_OSF_OVRD, 0);
+
+	/* AFMT_60958_0__AFMT_60958_CS_CHANNEL_NUMBER_L_MASK &
+	 * AFMT_60958_0__AFMT_60958_CS_CLOCK_ACCURACY_MASK
+	 */
+	REG_UPDATE_2(AFMT_60958_0,
+			AFMT_60958_CS_CHANNEL_NUMBER_L, 1,
+			AFMT_60958_CS_CLOCK_ACCURACY, 0);
+
+	/* AFMT_60958_1 AFMT_60958_CS_CHALNNEL_NUMBER_R */
+	REG_UPDATE(AFMT_60958_1, AFMT_60958_CS_CHANNEL_NUMBER_R, 2);
+
+	/* AFMT_60958_2 now keep this settings until
+	 * Programming guide comes out
+	 */
+	REG_UPDATE_6(AFMT_60958_2,
+			AFMT_60958_CS_CHANNEL_NUMBER_2, 3,
+			AFMT_60958_CS_CHANNEL_NUMBER_3, 4,
+			AFMT_60958_CS_CHANNEL_NUMBER_4, 5,
+			AFMT_60958_CS_CHANNEL_NUMBER_5, 6,
+			AFMT_60958_CS_CHANNEL_NUMBER_6, 7,
+			AFMT_60958_CS_CHANNEL_NUMBER_7, 8);
+}
+
+static union audio_cea_channels speakers_to_channels(
+	struct audio_speaker_flags speaker_flags)
+{
+	union audio_cea_channels cea_channels = {0};
+
+	/* these are one to one */
+	cea_channels.channels.FL = speaker_flags.FL_FR;
+	cea_channels.channels.FR = speaker_flags.FL_FR;
+	cea_channels.channels.LFE = speaker_flags.LFE;
+	cea_channels.channels.FC = speaker_flags.FC;
+
+	/* if Rear Left and Right exist move RC speaker to channel 7
+	 * otherwise to channel 5
+	 */
+	if (speaker_flags.RL_RR) {
+		cea_channels.channels.RL_RC = speaker_flags.RL_RR;
+		cea_channels.channels.RR = speaker_flags.RL_RR;
+		cea_channels.channels.RC_RLC_FLC = speaker_flags.RC;
+	} else {
+		cea_channels.channels.RL_RC = speaker_flags.RC;
+	}
+
+	/* FRONT Left Right Center and REAR Left Right Center are exclusive */
+	if (speaker_flags.FLC_FRC) {
+		cea_channels.channels.RC_RLC_FLC = speaker_flags.FLC_FRC;
+		cea_channels.channels.RRC_FRC = speaker_flags.FLC_FRC;
+	} else {
+		cea_channels.channels.RC_RLC_FLC = speaker_flags.RLC_RRC;
+		cea_channels.channels.RRC_FRC = speaker_flags.RLC_RRC;
+	}
+
+	return cea_channels;
+}
+
+static void afmt3_se_audio_setup(
+	struct afmt *afmt,
+	unsigned int az_inst,
+	struct audio_info *audio_info)
+{
+	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
+
+	uint32_t speakers = 0;
+	uint32_t channels = 0;
+
+	ASSERT(audio_info);
+	/* This should not happen.it does so we don't get BSOD*/
+	if (audio_info == NULL)
+		return;
+
+	speakers = audio_info->flags.info.ALLSPEAKERS;
+	channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
+
+	/* setup the audio stream source select (audio -> dig mapping) */
+	REG_SET(AFMT_AUDIO_SRC_CONTROL, 0, AFMT_AUDIO_SRC_SELECT, az_inst);
+
+	/* Channel allocation */
+	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_CHANNEL_ENABLE, channels);
+
+	/* Disable forced mem power off */
+	REG_UPDATE(AFMT_MEM_PWR, AFMT_MEM_PWR_FORCE, 0);
+}
+
+static void afmt3_audio_mute_control(
+	struct afmt *afmt,
+	bool mute)
+{
+	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
+
+	/* enable/disable transmission of audio packets */
+	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_AUDIO_SAMPLE_SEND, !mute);
+}
+
+static void afmt3_audio_info_immediate_update(
+	struct afmt *afmt)
+{
+	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
+
+	/* update double-buffered AUDIO_INFO registers immediately */
+	REG_UPDATE(AFMT_INFOFRAME_CONTROL0, AFMT_AUDIO_INFO_UPDATE, 1);
+}
+
+static void afmt3_setup_dp_audio(
+		struct afmt *afmt)
+{
+	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
+
+	/* AFMT_AUDIO_PACKET_CONTROL */
+	REG_UPDATE(AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, 1);
+
+	/* AFMT_AUDIO_PACKET_CONTROL2 */
+	/* Program the ATP and AIP next */
+	REG_UPDATE_2(AFMT_AUDIO_PACKET_CONTROL2,
+			AFMT_AUDIO_LAYOUT_OVRD, 0,
+			AFMT_60958_OSF_OVRD, 0);
+
+	/* AFMT_INFOFRAME_CONTROL0 */
+	REG_UPDATE(AFMT_INFOFRAME_CONTROL0, AFMT_AUDIO_INFO_UPDATE, 1);
+
+	/* AFMT_60958_0__AFMT_60958_CS_CLOCK_ACCURACY_MASK */
+	REG_UPDATE(AFMT_60958_0, AFMT_60958_CS_CLOCK_ACCURACY, 0);
+}
+
+static struct afmt_funcs dcn30_afmt_funcs = {
+	.setup_hdmi_audio		= afmt3_setup_hdmi_audio,
+	.se_audio_setup			= afmt3_se_audio_setup,
+	.audio_mute_control		= afmt3_audio_mute_control,
+	.audio_info_immediate_update	= afmt3_audio_info_immediate_update,
+	.setup_dp_audio			= afmt3_setup_dp_audio,
+};
+
+void afmt3_construct(struct dcn30_afmt *afmt3,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn30_afmt_registers *afmt_regs,
+	const struct dcn30_afmt_shift *afmt_shift,
+	const struct dcn30_afmt_mask *afmt_mask)
+{
+	afmt3->base.ctx = ctx;
+
+	afmt3->base.inst = inst;
+	afmt3->base.funcs = &dcn30_afmt_funcs;
+
+	afmt3->regs = afmt_regs;
+	afmt3->afmt_shift = afmt_shift;
+	afmt3->afmt_mask = afmt_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
new file mode 100644
index 000000000000..08b2d8a8170c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.h
@@ -0,0 +1,230 @@
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
+#ifndef __DAL_DCN30_AFMT_H__
+#define __DAL_DCN30_AFMT_H__
+
+
+#define DCN30_AFMT_FROM_AFMT(afmt)\
+	container_of(afmt, struct dcn30_afmt, base)
+
+#define AFMT_DCN3_REG_LIST(id) \
+	SRI(AFMT_INFOFRAME_CONTROL0, AFMT, id), \
+	SRI(AFMT_VBI_PACKET_CONTROL, AFMT, id), \
+	SRI(AFMT_AUDIO_PACKET_CONTROL, AFMT, id), \
+	SRI(AFMT_AUDIO_PACKET_CONTROL2, AFMT, id), \
+	SRI(AFMT_AUDIO_SRC_CONTROL, AFMT, id), \
+	SRI(AFMT_60958_0, AFMT, id), \
+	SRI(AFMT_60958_1, AFMT, id), \
+	SRI(AFMT_60958_2, AFMT, id), \
+	SRI(AFMT_MEM_PWR, AFMT, id)
+
+struct dcn30_afmt_registers {
+	uint32_t AFMT_INFOFRAME_CONTROL0;
+	uint32_t AFMT_VBI_PACKET_CONTROL;
+	uint32_t AFMT_AUDIO_PACKET_CONTROL;
+	uint32_t AFMT_AUDIO_PACKET_CONTROL2;
+	uint32_t AFMT_AUDIO_SRC_CONTROL;
+	uint32_t AFMT_60958_0;
+	uint32_t AFMT_60958_1;
+	uint32_t AFMT_60958_2;
+	uint32_t AFMT_MEM_PWR;
+};
+
+#define DCN3_AFMT_MASK_SH_LIST(mask_sh)\
+	SE_SF(AFMT0_AFMT_INFOFRAME_CONTROL0, AFMT_AUDIO_INFO_UPDATE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_SRC_CONTROL, AFMT_AUDIO_SRC_SELECT, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_CHANNEL_ENABLE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL, AFMT_60958_CS_UPDATE, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_AUDIO_LAYOUT_OVRD, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL2, AFMT_60958_OSF_OVRD, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_0, AFMT_60958_CS_CHANNEL_NUMBER_L, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_0, AFMT_60958_CS_CLOCK_ACCURACY, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_1, AFMT_60958_CS_CHANNEL_NUMBER_R, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_2, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_3, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_4, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_5, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_6, mask_sh),\
+	SE_SF(AFMT0_AFMT_60958_2, AFMT_60958_CS_CHANNEL_NUMBER_7, mask_sh),\
+	SE_SF(AFMT0_AFMT_AUDIO_PACKET_CONTROL, AFMT_AUDIO_SAMPLE_SEND, mask_sh),\
+	SE_SF(AFMT0_AFMT_MEM_PWR, AFMT_MEM_PWR_FORCE, mask_sh)
+
+#define AFMT_DCN3_REG_FIELD_LIST(type) \
+		type AFMT_AUDIO_INFO_UPDATE;\
+		type AFMT_AUDIO_SRC_SELECT;\
+		type AFMT_AUDIO_CHANNEL_ENABLE;\
+		type AFMT_60958_CS_UPDATE;\
+		type AFMT_AUDIO_LAYOUT_OVRD;\
+		type AFMT_60958_OSF_OVRD;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_L;\
+		type AFMT_60958_CS_CLOCK_ACCURACY;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_R;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_2;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_3;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_4;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_5;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_6;\
+		type AFMT_60958_CS_CHANNEL_NUMBER_7;\
+		type AFMT_AUDIO_SAMPLE_SEND;\
+		type AFMT_MEM_PWR_FORCE
+
+struct dcn30_afmt_shift {
+	AFMT_DCN3_REG_FIELD_LIST(uint8_t);
+};
+
+struct dcn30_afmt_mask {
+	AFMT_DCN3_REG_FIELD_LIST(uint32_t);
+};
+
+
+/**
+* speakersToChannels
+*
+* @brief
+*  translate speakers to channels
+*
+*  FL  - Front Left
+*  FR  - Front Right
+*  RL  - Rear Left
+*  RR  - Rear Right
+*  RC  - Rear Center
+*  FC  - Front Center
+*  FLC - Front Left Center
+*  FRC - Front Right Center
+*  RLC - Rear Left Center
+*  RRC - Rear Right Center
+*  LFE - Low Freq Effect
+*
+*               FC
+*          FLC      FRC
+*    FL                    FR
+*
+*                    LFE
+*              ()
+*
+*
+*    RL                    RR
+*          RLC      RRC
+*               RC
+*
+*             ch  8   7   6   5   4   3   2   1
+* 0b00000011      -   -   -   -   -   -   FR  FL
+* 0b00000111      -   -   -   -   -   LFE FR  FL
+* 0b00001011      -   -   -   -   FC  -   FR  FL
+* 0b00001111      -   -   -   -   FC  LFE FR  FL
+* 0b00010011      -   -   -   RC  -   -   FR  FL
+* 0b00010111      -   -   -   RC  -   LFE FR  FL
+* 0b00011011      -   -   -   RC  FC  -   FR  FL
+* 0b00011111      -   -   -   RC  FC  LFE FR  FL
+* 0b00110011      -   -   RR  RL  -   -   FR  FL
+* 0b00110111      -   -   RR  RL  -   LFE FR  FL
+* 0b00111011      -   -   RR  RL  FC  -   FR  FL
+* 0b00111111      -   -   RR  RL  FC  LFE FR  FL
+* 0b01110011      -   RC  RR  RL  -   -   FR  FL
+* 0b01110111      -   RC  RR  RL  -   LFE FR  FL
+* 0b01111011      -   RC  RR  RL  FC  -   FR  FL
+* 0b01111111      -   RC  RR  RL  FC  LFE FR  FL
+* 0b11110011      RRC RLC RR  RL  -   -   FR  FL
+* 0b11110111      RRC RLC RR  RL  -   LFE FR  FL
+* 0b11111011      RRC RLC RR  RL  FC  -   FR  FL
+* 0b11111111      RRC RLC RR  RL  FC  LFE FR  FL
+* 0b11000011      FRC FLC -   -   -   -   FR  FL
+* 0b11000111      FRC FLC -   -   -   LFE FR  FL
+* 0b11001011      FRC FLC -   -   FC  -   FR  FL
+* 0b11001111      FRC FLC -   -   FC  LFE FR  FL
+* 0b11010011      FRC FLC -   RC  -   -   FR  FL
+* 0b11010111      FRC FLC -   RC  -   LFE FR  FL
+* 0b11011011      FRC FLC -   RC  FC  -   FR  FL
+* 0b11011111      FRC FLC -   RC  FC  LFE FR  FL
+* 0b11110011      FRC FLC RR  RL  -   -   FR  FL
+* 0b11110111      FRC FLC RR  RL  -   LFE FR  FL
+* 0b11111011      FRC FLC RR  RL  FC  -   FR  FL
+* 0b11111111      FRC FLC RR  RL  FC  LFE FR  FL
+*
+* @param
+*  speakers - speaker information as it comes from CEA audio block
+*/
+/* translate speakers to channels */
+
+union audio_cea_channels {
+	uint8_t all;
+	struct audio_cea_channels_bits {
+		uint32_t FL:1;
+		uint32_t FR:1;
+		uint32_t LFE:1;
+		uint32_t FC:1;
+		uint32_t RL_RC:1;
+		uint32_t RR:1;
+		uint32_t RC_RLC_FLC:1;
+		uint32_t RRC_FRC:1;
+	} channels;
+};
+
+struct afmt;
+
+struct afmt_funcs {
+
+	void (*setup_hdmi_audio)(
+		struct afmt *afmt);
+
+	void (*se_audio_setup)(
+		struct afmt *afmt,
+		unsigned int az_inst,
+		struct audio_info *audio_info);
+
+	void (*audio_mute_control)(
+		struct afmt *afmt,
+		bool mute);
+
+	void (*audio_info_immediate_update)(
+		struct afmt *afmt);
+
+	void (*setup_dp_audio)(
+		struct afmt *afmt);
+};
+
+struct afmt {
+	const struct afmt_funcs *funcs;
+	struct dc_context *ctx;
+	int inst;
+};
+
+struct dcn30_afmt {
+	struct afmt base;
+	const struct dcn30_afmt_registers *regs;
+	const struct dcn30_afmt_shift *afmt_shift;
+	const struct dcn30_afmt_mask *afmt_mask;
+};
+
+void afmt3_construct(struct dcn30_afmt *afmt3,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn30_afmt_registers *afmt_regs,
+	const struct dcn30_afmt_shift *afmt_shift,
+	const struct dcn30_afmt_mask *afmt_mask);
+
+
+#endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
