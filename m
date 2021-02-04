Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A42130AD2C
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Feb 2021 17:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907896E84F;
	Mon,  1 Feb 2021 16:56:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B973C6E84E
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Feb 2021 16:56:16 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id k193so16884019qke.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Feb 2021 08:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XQRaESDjB1cZsn7fhU9n9TLLN24WJqMw1q9m06faaXU=;
 b=LltcgI0S6+pY8q9d8fowIeza0ncAfQ1fAX7z7rgAAlyfvcrMQOX6M9vhOn8ByKf4qs
 x8NhKaDoDYnKF+AHIG3eIvHeVMtN4xHkv5TXuW78onP1Y1lvmLUQ/hx9zJyuQAf7Rpe0
 cmrmWp8lOXO7wVaeas1M2LVclxEhgpXGeJfLzyERaEADajqpBWgyPSlm7ooMrA3ePjIx
 GCWIclPt204FNH2Mb3nK1296qqAvcnXRYnV0R1kHB8cbgw52AKtetmg2mQ55Naa3o20V
 Z+mlCBBR44I3Xw/n5Mbp5avbb2qINbyB5J7Xd2PgUJFz6p8EYIEqNEu+Yf0wUEReM7D8
 fhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XQRaESDjB1cZsn7fhU9n9TLLN24WJqMw1q9m06faaXU=;
 b=W6iiXJIh/VWegJT2x3gSGAesK8zqWCt/+4TGk+Jg2uNiORHsWF8x/hpqYC3vMWIeAD
 uQJkpXQHUsKglSnf0KhLcFMrJnyzSgT0hYqBeSY33sJXVjs0tR1HftoSsdP50vhTkD34
 C4RMAw21nZPyg/mMp9CMn5CV+SLM/CSjyaEmOKptj9e7nz66fN46U/l1l3KtPQyDbJ9M
 bFKqKtwWaHCXEJkIdfo7gqxMt5oPgzwrqGvuMRnghjPc+cxV6j9amsTpNrK/Q97k5450
 ycbT6Bdon1w7vzQBcsbvHq1gAMB/Az93TROmCmMKof04QccBKzz9K9lncs17k0kRmq9S
 WLKA==
X-Gm-Message-State: AOAM530qZg0+UpoH4Qn+QDCEzJX46st4vLVoNZNf79Vhp6q5eErT1+Ex
 ITjSLoPOHD9gSFD5a80OgEWZc7WxBRg=
X-Google-Smtp-Source: ABdhPJwKXdQNnzOHwm6MLa3kvobYcqYi0UnARlsgt5N/+iywQYb3GH837TlwXBTGT9532xCEkiZ8SA==
X-Received: by 2002:a37:9dcf:: with SMTP id
 g198mr17180350qke.486.1612198575366; 
 Mon, 01 Feb 2021 08:56:15 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.237])
 by smtp.gmail.com with ESMTPSA id v145sm15022479qka.27.2021.02.01.08.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 08:56:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: add video decode/encode cap tables and asic
 callbacks (v2)
Date: Mon,  1 Feb 2021 11:56:03 -0500
Message-Id: <20210201165605.465228-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201165605.465228-1-alexander.deucher@amd.com>
References: <20210201165605.465228-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

For each asic family.  Will be used to populate tables
for the new INFO ioctl query.

v2: add max_pixels_per_frame to handle the portrait case

Reviewed-by: Leo Liu <leo.liu@amd.com> (v1)
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/cik.c   |  75 ++++++++++
 drivers/gpu/drm/amd/amdgpu/nv.c    | 179 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/si.c    | 109 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/soc15.c | 230 +++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/vi.c    | 188 +++++++++++++++++++++++
 5 files changed, 781 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 13737b317f7c..12ed86deaa84 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -70,6 +70,80 @@
 #include "amdgpu_amdkfd.h"
 #include "dce_virtual.h"
 
+static const struct amdgpu_video_codec_info cik_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs cik_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(cik_video_codecs_encode_array),
+	.codec_array = cik_video_codecs_encode_array,
+};
+
+static const struct amdgpu_video_codec_info cik_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 41,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 4,
+	},
+};
+
+static const struct amdgpu_video_codecs cik_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(cik_video_codecs_decode_array),
+	.codec_array = cik_video_codecs_decode_array,
+};
+
+static int cik_query_video_codecs(struct amdgpu_device *adev, bool encode,
+				  const struct amdgpu_video_codecs **codecs)
+{
+	switch (adev->asic_type) {
+	case CHIP_BONAIRE:
+	case CHIP_HAWAII:
+	case CHIP_KAVERI:
+	case CHIP_KABINI:
+	case CHIP_MULLINS:
+		if (encode)
+			*codecs = &cik_video_codecs_encode;
+		else
+			*codecs = &cik_video_codecs_decode;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * Indirect registers accessor
  */
@@ -1944,6 +2018,7 @@ static const struct amdgpu_asic_funcs cik_asic_funcs =
 	.get_pcie_replay_count = &cik_get_pcie_replay_count,
 	.supports_baco = &cik_asic_supports_baco,
 	.pre_asic_init = &cik_pre_asic_init,
+	.query_video_codecs = &cik_query_video_codecs,
 };
 
 static int cik_common_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 66279f0c6808..09341e85fbb0 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -64,6 +64,184 @@
 
 static const struct amd_ip_funcs nv_common_ip_funcs;
 
+/* Navi */
+static const struct amdgpu_video_codec_info nv_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs nv_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(nv_video_codecs_encode_array),
+	.codec_array = nv_video_codecs_encode_array,
+};
+
+/* Navi1x */
+static const struct amdgpu_video_codec_info nv_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VP9,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs nv_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(nv_video_codecs_decode_array),
+	.codec_array = nv_video_codecs_decode_array,
+};
+
+/* Sienna Cichlid */
+static const struct amdgpu_video_codec_info sc_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 8192 * 4352,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VP9,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 8192 * 4352,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_AV1,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 8192 * 4352,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs sc_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(sc_video_codecs_decode_array),
+	.codec_array = sc_video_codecs_decode_array,
+};
+
+static int nv_query_video_codecs(struct amdgpu_device *adev, bool encode,
+				 const struct amdgpu_video_codecs **codecs)
+{
+	switch (adev->asic_type) {
+	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
+	case CHIP_DIMGREY_CAVEFISH:
+	case CHIP_VANGOGH:
+		if (encode)
+			*codecs = &nv_video_codecs_encode;
+		else
+			*codecs = &sc_video_codecs_decode;
+		return 0;
+	case CHIP_NAVI10:
+	case CHIP_NAVI14:
+	case CHIP_NAVI12:
+		if (encode)
+			*codecs = &nv_video_codecs_encode;
+		else
+			*codecs = &nv_video_codecs_decode;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * Indirect registers accessor
  */
@@ -825,6 +1003,7 @@ static const struct amdgpu_asic_funcs nv_asic_funcs =
 	.supports_baco = &nv_asic_supports_baco,
 	.pre_asic_init = &nv_pre_asic_init,
 	.update_umd_stable_pstate = &nv_update_umd_stable_pstate,
+	.query_video_codecs = &nv_query_video_codecs,
 };
 
 static int nv_common_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 3cf0589bfea5..da258ff75042 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -905,6 +905,114 @@ static const u32 hainan_mgcg_cgcg_init[] =
 	0x3630, 0xfffffff0, 0x00000100,
 };
 
+/* XXX: update when we support VCE */
+#if 0
+/* tahiti, pitcarin, verde */
+static const struct amdgpu_video_codec_info tahiti_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs tahiti_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(tahiti_video_codecs_encode_array),
+	.codec_array = tahiti_video_codecs_encode_array,
+};
+#else
+static const struct amdgpu_video_codecs tahiti_video_codecs_encode =
+{
+	.codec_count = 0,
+	.codec_array = NULL,
+};
+#endif
+/* oland and hainan don't support encode */
+static const struct amdgpu_video_codecs hainan_video_codecs_encode =
+{
+	.codec_count = 0,
+	.codec_array = NULL,
+};
+
+/* tahiti, pitcarin, verde, oland */
+static const struct amdgpu_video_codec_info tahiti_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 41,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 2048,
+		.max_height = 1152,
+		.max_pixels_per_frame = 2048 * 1152,
+		.max_level = 4,
+	},
+};
+
+static const struct amdgpu_video_codecs tahiti_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(tahiti_video_codecs_decode_array),
+	.codec_array = tahiti_video_codecs_decode_array,
+};
+
+/* hainan doesn't support decode */
+static const struct amdgpu_video_codecs hainan_video_codecs_decode =
+{
+	.codec_count = 0,
+	.codec_array = NULL,
+};
+
+static int si_query_video_codecs(struct amdgpu_device *adev, bool encode,
+				 const struct amdgpu_video_codecs **codecs)
+{
+	switch (adev->asic_type) {
+	case CHIP_VERDE:
+	case CHIP_TAHITI:
+	case CHIP_PITCAIRN:
+		if (encode)
+			*codecs = &tahiti_video_codecs_encode;
+		else
+			*codecs = &tahiti_video_codecs_decode;
+		return 0;
+	case CHIP_OLAND:
+		if (encode)
+			*codecs = &hainan_video_codecs_encode;
+		else
+			*codecs = &tahiti_video_codecs_decode;
+		return 0;
+	case CHIP_HAINAN:
+		if (encode)
+			*codecs = &hainan_video_codecs_encode;
+		else
+			*codecs = &hainan_video_codecs_decode;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static u32 si_pcie_rreg(struct amdgpu_device *adev, u32 reg)
 {
 	unsigned long flags;
@@ -1897,6 +2005,7 @@ static const struct amdgpu_asic_funcs si_asic_funcs =
 	.get_pcie_replay_count = &si_get_pcie_replay_count,
 	.supports_baco = &si_asic_supports_baco,
 	.pre_asic_init = &si_pre_asic_init,
+	.query_video_codecs = &si_query_video_codecs,
 };
 
 static uint32_t si_get_rev_id(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 2396be16c28e..a81fd7de72b7 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -83,6 +83,234 @@
 #define mmMP0_MISC_LIGHT_SLEEP_CTRL                                                             0x01ba
 #define mmMP0_MISC_LIGHT_SLEEP_CTRL_BASE_IDX                                                    0
 
+/* Vega, Raven, Arcturus */
+static const struct amdgpu_video_codec_info vega_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs vega_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(vega_video_codecs_encode_array),
+	.codec_array = vega_video_codecs_encode_array,
+};
+
+/* Vega */
+static const struct amdgpu_video_codec_info vega_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs vega_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(vega_video_codecs_decode_array),
+	.codec_array = vega_video_codecs_decode_array,
+};
+
+/* Raven */
+static const struct amdgpu_video_codec_info rv_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VP9,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs rv_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(rv_video_codecs_decode_array),
+	.codec_array = rv_video_codecs_decode_array,
+};
+
+/* Renoir, Arcturus */
+static const struct amdgpu_video_codec_info rn_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VP9,
+		.max_width = 8192,
+		.max_height = 4352,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs rn_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(rn_video_codecs_decode_array),
+	.codec_array = rn_video_codecs_decode_array,
+};
+
+static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
+				    const struct amdgpu_video_codecs **codecs)
+{
+	switch (adev->asic_type) {
+	case CHIP_VEGA20:
+	case CHIP_VEGA10:
+	case CHIP_VEGA12:
+		if (encode)
+			*codecs = &vega_video_codecs_encode;
+		else
+			*codecs = &vega_video_codecs_decode;
+		return 0;
+	case CHIP_RAVEN:
+		if (encode)
+			*codecs = &vega_video_codecs_encode;
+		else
+			*codecs = &rv_video_codecs_decode;
+		return 0;
+	case CHIP_ARCTURUS:
+	case CHIP_RENOIR:
+		if (encode)
+			*codecs = &vega_video_codecs_encode;
+		else
+			*codecs = &rn_video_codecs_decode;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * Indirect registers accessor
  */
@@ -988,6 +1216,7 @@ static const struct amdgpu_asic_funcs soc15_asic_funcs =
 	.get_pcie_replay_count = &soc15_get_pcie_replay_count,
 	.supports_baco = &soc15_supports_baco,
 	.pre_asic_init = &soc15_pre_asic_init,
+	.query_video_codecs = &soc15_query_video_codecs,
 };
 
 static const struct amdgpu_asic_funcs vega20_asic_funcs =
@@ -1009,6 +1238,7 @@ static const struct amdgpu_asic_funcs vega20_asic_funcs =
 	.get_pcie_replay_count = &soc15_get_pcie_replay_count,
 	.supports_baco = &soc15_supports_baco,
 	.pre_asic_init = &soc15_pre_asic_init,
+	.query_video_codecs = &soc15_query_video_codecs,
 };
 
 static int soc15_common_early_init(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index d56b474b3a21..462368d2804b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -79,6 +79,193 @@
 #include "mxgpu_vi.h"
 #include "amdgpu_dm.h"
 
+/* Topaz */
+static const struct amdgpu_video_codecs topaz_video_codecs_encode =
+{
+	.codec_count = 0,
+	.codec_array = NULL,
+};
+
+/* Tonga, CZ, ST, Fiji */
+static const struct amdgpu_video_codec_info tonga_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs tonga_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(tonga_video_codecs_encode_array),
+	.codec_array = tonga_video_codecs_encode_array,
+};
+
+/* Polaris */
+static const struct amdgpu_video_codec_info polaris_video_codecs_encode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 2304,
+		.max_pixels_per_frame = 4096 * 2304,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs polaris_video_codecs_encode =
+{
+	.codec_count = ARRAY_SIZE(polaris_video_codecs_encode_array),
+	.codec_array = polaris_video_codecs_encode_array,
+};
+
+/* Topaz */
+static const struct amdgpu_video_codecs topaz_video_codecs_decode =
+{
+	.codec_count = 0,
+	.codec_array = NULL,
+};
+
+/* Tonga */
+static const struct amdgpu_video_codec_info tonga_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+};
+
+static const struct amdgpu_video_codecs tonga_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(tonga_video_codecs_decode_array),
+	.codec_array = tonga_video_codecs_decode_array,
+};
+
+/* CZ, ST, Fiji, Polaris */
+static const struct amdgpu_video_codec_info cz_video_codecs_decode_array[] =
+{
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG2,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 3,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 5,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_MPEG4_AVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 52,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_VC1,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 4,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_HEVC,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 186,
+	},
+	{
+		.codec_type = AMDGPU_VIDEO_CODEC_TYPE_JPEG,
+		.max_width = 4096,
+		.max_height = 4096,
+		.max_pixels_per_frame = 4096 * 4096,
+		.max_level = 0,
+	},
+};
+
+static const struct amdgpu_video_codecs cz_video_codecs_decode =
+{
+	.codec_count = ARRAY_SIZE(cz_video_codecs_decode_array),
+	.codec_array = cz_video_codecs_decode_array,
+};
+
+static int vi_query_video_codecs(struct amdgpu_device *adev, bool encode,
+				 const struct amdgpu_video_codecs **codecs)
+{
+	switch (adev->asic_type) {
+	case CHIP_TOPAZ:
+		if (encode)
+			*codecs = &topaz_video_codecs_encode;
+		else
+			*codecs = &topaz_video_codecs_decode;
+		return 0;
+	case CHIP_TONGA:
+		if (encode)
+			*codecs = &tonga_video_codecs_encode;
+		else
+			*codecs = &tonga_video_codecs_decode;
+		return 0;
+	case CHIP_POLARIS10:
+	case CHIP_POLARIS11:
+	case CHIP_POLARIS12:
+	case CHIP_VEGAM:
+		if (encode)
+			*codecs = &polaris_video_codecs_encode;
+		else
+			*codecs = &cz_video_codecs_decode;
+		return 0;
+	case CHIP_FIJI:
+	case CHIP_CARRIZO:
+	case CHIP_STONEY:
+		if (encode)
+			*codecs = &tonga_video_codecs_encode;
+		else
+			*codecs = &cz_video_codecs_decode;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 /*
  * Indirect registers accessor
  */
@@ -1093,6 +1280,7 @@ static const struct amdgpu_asic_funcs vi_asic_funcs =
 	.get_pcie_replay_count = &vi_get_pcie_replay_count,
 	.supports_baco = &vi_asic_supports_baco,
 	.pre_asic_init = &vi_pre_asic_init,
+	.query_video_codecs = &vi_query_video_codecs,
 };
 
 #define CZ_REV_BRISTOL(rev)	 \
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
