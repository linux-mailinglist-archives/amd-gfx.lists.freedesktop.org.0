Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62258F54C
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Aug 2022 02:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1560797A9A;
	Thu, 11 Aug 2022 00:40:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E3B18BC34
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Aug 2022 00:40:45 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id 125so16874616vsd.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Aug 2022 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0y8duN2KfVHQNfrxczn9HTmiC4X58Ok2ZJsLn1pAQcI=;
 b=K41SeZgZf/No7Kv0ndKuydZHQpHUpI5kj2xbCap+tExugLY8wN+okxyKAx/Q5bSGh0
 77Z5TKismye+/alwGBxoNFg5F3BlGD1Ihmt0PrWSFY/INpImPU9kTQAnJ4WR7C+ElPuQ
 4i2mz8aoal0OwR5Bz+1ckd/v2oKDHkW76Q6LLGliCdo9sV1CRH1ArQ8z4QFxcFYAAE/N
 DlniDp3t/bnfipRe/WoFD/3iYT0oouVnaFc+y5KQ+EDE03kcKEW09UIECIJgJy/5vH6t
 O9lQuHpxIMS0ha8+Smlsv5FxUS2dSr/EkSmks7LoOGWFLxwJFgn7GHLVKHfczSrFgq3K
 NmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0y8duN2KfVHQNfrxczn9HTmiC4X58Ok2ZJsLn1pAQcI=;
 b=gBi4meOVW+IGIvmgQN5YSFiIcRLLELhQX8eMQ0U9Le0gZTx8arAiIAkBdQAQqwbTgm
 CNds9vqZBlWYHZ8Pty5t+qlKb2AB9etlJ2OpGmQAch0JiiX6ngbegegvFafCvZZ6ISWh
 rEtpVIUSLYJ3AIjIDqH45PnGGXEkoY8FvVBU0jGrJlY9+PMOEwMOxVCTyDt2HHmrP9Eo
 Vjqrm8URnUT+YZxi0vlguKbTHXhg1JlmVnlWLSQttBpLfO1fjF79zYnb8mNXsDXsW4vs
 1Lo8OnYalqjK/frzNPS4WoCxLjSfgEVv6c5yBnjw4ZMvsp97bTg8iurof1+vylB/5grC
 0gWg==
X-Gm-Message-State: ACgBeo3qQ9FadcRwt1R+1qTzQ3OZj1/5Ki6JeHH7gC8ckp7aFXMbwyHC
 jEZKNOLDNKXeolnlNy7Ay0Q=
X-Google-Smtp-Source: AA6agR7SSImE7p/8BFVWqjZxdjPHZyeeTsvO9q0LA3fCgP7kA02MJRG5jNTgAF5YvkHgOjsc2mlQCQ==
X-Received: by 2002:a67:a602:0:b0:388:64af:e746 with SMTP id
 p2-20020a67a602000000b0038864afe746mr13100756vse.3.1660178444296; 
 Wed, 10 Aug 2022 17:40:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8202::1003])
 by smtp.gmail.com with ESMTPSA id
 z188-20020a1fc9c5000000b003791113188csm893072vkf.55.2022.08.10.17.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 17:40:43 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 4/8] drm/amd/display: Introduce KUnit tests to the
 display_mode_vba library
Date: Wed, 10 Aug 2022 21:40:06 -0300
Message-Id: <20220811004010.61299-5-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220811004010.61299-1-tales.aparecida@gmail.com>
References: <20220811004010.61299-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, kunit-dev@googlegroups.com,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Maíra Canal <mairacanal@riseup.net>

The display_mode_vba library deals with hundreds of display parameters
and sometimes does it in odd ways. The addition of unit tests intends to
assure the quality of the code delivered by HW engineers and, also make
it possible to refactor the code decreasing concerns about adding bugs
to the codebase.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 .../drm/amd/display/dc/dml/display_mode_vba.c |   3 +
 .../tests/dc/dml/display_mode_vba_test.c      | 741 ++++++++++++++++++
 2 files changed, 744 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c

diff --git a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
index 503e7d984ff0..71a3aa75ac56 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/display_mode_vba.c
@@ -1132,3 +1132,6 @@ double CalculateWriteBackDISPCLK(
 	return CalculateWriteBackDISPCLK;
 }
 
+#if IS_ENABLED(CONFIG_DML_KUNIT_TEST)
+#include "../../tests/dc/dml/display_mode_vba_test.c"
+#endif
diff --git a/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c b/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c
new file mode 100644
index 000000000000..d3e3a9f50c3d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c
@@ -0,0 +1,741 @@
+// SPDX-License-Identifier: MIT
+/*
+ * KUnit tests for dml/display_mode_vba.h
+ *
+ * Copyright (C) 2022, Maíra Canal <mairacanal@riseup.net>
+ */
+
+#include <kunit/test.h>
+#include "dml/display_mode_lib.h"
+
+struct pixel_clock_adjustment_for_progressive_to_interlace_unit_expected {
+	const double pixel_clock[DC__NUM_DPP__MAX];
+	const double pixel_clock_backend[DC__NUM_DPP__MAX];
+};
+
+struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case {
+	const char *desc;
+	const unsigned int number_of_active_planes;
+	const bool interlace[DC__NUM_DPP__MAX];
+	const bool progressive_to_interlace_unit_in_OPP;
+	const double pixel_clock[DC__NUM_DPP__MAX];
+	const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_expected expected;
+};
+
+struct calculate_256B_block_sizes_test_case {
+	const char *desc;
+	const enum source_format_class source_pixel_format;
+	const enum dm_swizzle_mode surface_tiling;
+	const unsigned int byte_per_pixel_Y;
+	const unsigned int byte_per_pixel_C;
+	const unsigned int block_height_256_bytes_Y;
+	const unsigned int block_height_256_bytes_C;
+	const unsigned int block_width_256_bytes_Y;
+	const unsigned int block_width_256_bytes_C;
+};
+
+struct calculate_write_back_DISPCLK_test_case {
+	const char *desc;
+	const enum source_format_class writeback_pixel_format;
+	const double pixel_clock;
+	const double writeback_HRatio;
+	const double writeback_VRatio;
+	const unsigned int writeback_luma_HTaps;
+	const unsigned int writeback_luma_VTaps;
+	const unsigned int writeback_chroma_HTaps;
+	const unsigned int writeback_chroma_VTaps;
+	const double writeback_destination_width;
+	const unsigned int HTotal;
+	const unsigned int writeback_chroma_line_buffer_width;
+	const double calculate_write_back_DISPCLK;
+};
+
+/**
+ * pclk_adjustment_for_progressive_to_interlace_unit_test - KUnit test
+ * for PixelClockAdjustmentForProgressiveToInterlaceUnit
+ * @test: represents a running instance of a test.
+ */
+static void pclk_adjustment_for_progressive_to_interlace_unit_test(struct kunit *test)
+{
+	const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case
+		*test_param = test->param_value;
+	struct display_mode_lib *mode_lib;
+	size_t pixel_clock_size = DC__NUM_DPP__MAX * sizeof(const double);
+	size_t interlace_size = DC__NUM_DPP__MAX * sizeof(const bool);
+
+	mode_lib = kunit_kzalloc(test, sizeof(struct display_mode_lib),
+				 GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode_lib);
+
+	mode_lib->vba.NumberOfActivePlanes = test_param->number_of_active_planes;
+	memcpy(mode_lib->vba.Interlace, test_param->interlace, interlace_size);
+	mode_lib->vba.ProgressiveToInterlaceUnitInOPP =
+		test_param->progressive_to_interlace_unit_in_OPP;
+	memcpy(mode_lib->vba.PixelClock, test_param->pixel_clock, pixel_clock_size);
+
+	PixelClockAdjustmentForProgressiveToInterlaceUnit(mode_lib);
+
+	KUNIT_EXPECT_TRUE(test, !memcmp(mode_lib->vba.PixelClock,
+					test_param->expected.pixel_clock,
+					pixel_clock_size));
+	KUNIT_EXPECT_TRUE(test, !memcmp(mode_lib->vba.PixelClockBackEnd,
+					test_param->expected.pixel_clock_backend,
+					pixel_clock_size));
+}
+
+/**
+ * calculate_256B_block_sizes_test - KUnit test for Calculate256BBlockSizes
+ * @test: represents a running instance of a test.
+ */
+static void calculate_256B_block_sizes_test(struct kunit *test)
+{
+	const struct calculate_256B_block_sizes_test_case *test_param =
+		test->param_value;
+	unsigned int *block_height_256_bytes_Y, *block_height_256_bytes_C;
+	unsigned int *block_width_256_bytes_Y, *block_width_256_bytes_C;
+
+	block_height_256_bytes_Y = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_height_256_bytes_Y);
+
+	block_height_256_bytes_C = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_height_256_bytes_C);
+
+	block_width_256_bytes_Y = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_width_256_bytes_Y);
+
+	block_width_256_bytes_C = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, block_width_256_bytes_C);
+
+	Calculate256BBlockSizes(test_param->source_pixel_format,
+				test_param->surface_tiling,
+				test_param->byte_per_pixel_Y,
+				test_param->byte_per_pixel_C,
+				block_height_256_bytes_Y,
+				block_height_256_bytes_C,
+				block_width_256_bytes_Y,
+				block_width_256_bytes_C);
+
+	KUNIT_EXPECT_EQ(test, *block_height_256_bytes_Y,
+			test_param->block_height_256_bytes_Y);
+	KUNIT_EXPECT_EQ(test, *block_height_256_bytes_C,
+			test_param->block_height_256_bytes_C);
+	KUNIT_EXPECT_EQ(test, *block_width_256_bytes_Y,
+			test_param->block_width_256_bytes_Y);
+	KUNIT_EXPECT_EQ(test, *block_width_256_bytes_C,
+			test_param->block_width_256_bytes_C);
+}
+
+/**
+ * calculate_min_and_max_prefetch_mode_test - KUnit test for CalculateMinAndMaxPrefetchMode
+ * @test: represents a running instance of a test.
+ */
+static void calculate_min_and_max_prefetch_mode_test(struct kunit *test)
+{
+	unsigned int *min_prefetch_mode, *max_prefetch_mode;
+
+	min_prefetch_mode = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, min_prefetch_mode);
+
+	max_prefetch_mode = kunit_kzalloc(test, sizeof(unsigned int), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, max_prefetch_mode);
+
+	/* Try to allow DRAM self-refresh and MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_try_to_allow_self_refresh_and_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+
+	/* Allow DRAM self-refresh and MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_allow_self_refresh_and_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 0);
+
+	/* Allow only DRAM self-refresh  */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_allow_self_refresh,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 1);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 1);
+
+	/* Allow neither DRAM self-refresh nor MCLK switch */
+	KUNIT_EXPECT_FALSE(test, CalculateMinAndMaxPrefetchMode
+			  (dm_neither_self_refresh_nor_mclk_switch,
+			   min_prefetch_mode, max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 2);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+
+	/* Invalid self-refresh affinity */
+	KUNIT_EXPECT_TRUE(test, CalculateMinAndMaxPrefetchMode(-1,
+							       min_prefetch_mode,
+							       max_prefetch_mode));
+	KUNIT_EXPECT_EQ(test, *min_prefetch_mode, 0);
+	KUNIT_EXPECT_EQ(test, *max_prefetch_mode, 2);
+}
+
+/**
+ * calculate_write_back_DISPCLK_test - KUnit test for CalculateWriteBackDISPCLK
+ * @test: represents a running instance of a test.
+ */
+static void calculate_write_back_DISPCLK_test(struct kunit *test)
+{
+	const struct calculate_write_back_DISPCLK_test_case *test_param = test->param_value;
+	double calculate_write_back_DISPCLK;
+
+	DC_FP_START();
+	calculate_write_back_DISPCLK = CalculateWriteBackDISPCLK
+		(test_param->writeback_pixel_format,
+		 test_param->pixel_clock, test_param->writeback_HRatio,
+		 test_param->writeback_VRatio, test_param->writeback_luma_HTaps,
+		 test_param->writeback_luma_VTaps, test_param->writeback_chroma_HTaps,
+		 test_param->writeback_chroma_VTaps,
+		 test_param->writeback_destination_width, test_param->HTotal,
+		 test_param->writeback_chroma_line_buffer_width);
+	DC_FP_END();
+
+	KUNIT_EXPECT_EQ(test, test_param->calculate_write_back_DISPCLK,
+			calculate_write_back_DISPCLK);
+}
+
+static const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case
+pixel_clock_adjustment_for_progressive_to_interlace_unit_cases[] = {
+	{
+		.desc = "No active planes",
+		.number_of_active_planes = 0,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Two active planes with no interlaced output",
+		.number_of_active_planes = 2,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 0.00, 0.00, 0.00, 0.00,
+				0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Three active planes with one interlaced plane",
+		.number_of_active_planes = 3,
+		.interlace = {false, true, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 0.00, 0.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 2720.00, 400.00, 0.00,
+				0.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 0.00,
+				0.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Five active planes with three interlaced planes",
+		.number_of_active_planes = 5,
+		.interlace = {false, true, false, true, true, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 0.00, 0.00, 0.00},
+		.expected = {
+			.pixel_clock = {3200.00, 2720.00, 400.00, 680.00,
+				1360.00, 0.00, 0.00, 0.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 0.00, 0.00, 0.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with five interlaced planes",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, false, true, true, false, true, false},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {6400.00, 2720.00, 400.00, 680.00,
+				1360.00, 1360.00, 5440.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.0},
+		},
+	},
+	{
+		.desc = "Eight active planes with all planes interlaced",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, true, true, true, true, true, true},
+		.progressive_to_interlace_unit_in_OPP = true,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {6400.00, 2720.00, 800.0, 680.00,
+				1360.00, 2720.00, 5440.0, 680.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with no interlaced plane",
+		.number_of_active_planes = 8,
+		.interlace = {false, false, false, false, false, false, false, false},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+	{
+		.desc = "Eight active planes with no progressive_to_interlace_unit_in_OPP",
+		.number_of_active_planes = 8,
+		.interlace = {true, true, true, true, true, true, true, true},
+		.progressive_to_interlace_unit_in_OPP = false,
+		.pixel_clock = {3200.00, 1360.00, 400.00, 340.00, 680.00, 1360.00, 2720.00, 340.00},
+		.expected = {
+			.pixel_clock = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+			.pixel_clock_backend = {3200.00, 1360.00, 400.00, 340.00,
+				680.00, 1360.00, 2720.00, 340.00},
+		},
+	},
+};
+
+static const struct calculate_256B_block_sizes_test_case calculate_256B_block_sizes_cases[] = {
+	/*
+	 * Here 16-bit specifies the number of bits in the horizontal 4-element region
+	 * used for subsampling
+	 */
+	{
+		.desc = "4:4:4 16-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_16,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 128,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 16-bit encoding with 256B standard swizzle",
+		.source_pixel_format = dm_444_16,
+		.surface_tiling = dm_sw_256b_s,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	/*
+	 * Here 32-bit specifies the number of bits in the horizontal
+	 * 4-element region used for subsampling
+	 */
+	{
+		.desc = "4:4:4 32-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_32,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 4,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 64,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 32-bit encoding with 256B display swizzle",
+		.source_pixel_format = dm_444_32,
+		.surface_tiling = dm_sw_256b_d,
+		.byte_per_pixel_Y = 4,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 8,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	/*
+	 * Here 64-bit specifies the number of bits in the horizontal 4-element region
+	 * used for subsampling
+	 */
+	{
+		.desc = "4:4:4 64-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_64,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 8,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 32,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 64-bit encoding with 4KB standard swizzle",
+		.source_pixel_format = dm_444_64,
+		.surface_tiling = dm_sw_4kb_s,
+		.byte_per_pixel_Y = 8,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 4,
+		.block_width_256_bytes_Y = 8,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 8-bit encoding with linear swizzle",
+		.source_pixel_format = dm_444_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "4:4:4 8-bit encoding with 4KB display swizzle",
+		.source_pixel_format = dm_444_8,
+		.surface_tiling = dm_sw_4kb_d,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit mono encoding with linear swizzle",
+		.source_pixel_format = dm_mono_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit mono encoding with 64KB standard swizzle",
+		.source_pixel_format = dm_mono_8,
+		.surface_tiling = dm_sw_64kb_s,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "16-bit mono encoding with linear swizzle",
+		.source_pixel_format = dm_mono_16,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 128,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "16-bit mono encoding with 64KB display swizzle",
+		.source_pixel_format = dm_mono_16,
+		.surface_tiling = dm_sw_64kb_d,
+		.byte_per_pixel_Y = 2,
+		.byte_per_pixel_C = 0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 0,
+		.block_width_256_bytes_C = 0,
+	},
+	{
+		.desc = "8-bit 4:2:0 encoding with linear swizzle",
+		.source_pixel_format = dm_420_8,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 2,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 1,
+		.block_width_256_bytes_C = 128,
+	},
+	{
+		.desc = "8-bit 4:2:0 encoding with VAR standard swizzle",
+		.source_pixel_format = dm_420_8,
+		.surface_tiling = dm_sw_var_s,
+		.byte_per_pixel_Y = 1,
+		.byte_per_pixel_C = 2,
+		.block_height_256_bytes_Y = 16,
+		.block_width_256_bytes_Y = 16,
+		.block_height_256_bytes_C = 8,
+		.block_width_256_bytes_C = 16,
+	},
+	{
+		.desc = "10-bit 4:2:0 encoding with linear swizzle",
+		.source_pixel_format = dm_420_10,
+		.surface_tiling = dm_sw_linear,
+		.byte_per_pixel_Y = 4.0 / 3.0,
+		.byte_per_pixel_C = 8.0 / 3.0,
+		.block_height_256_bytes_Y = 1,
+		.block_width_256_bytes_Y = 256,
+		.block_height_256_bytes_C = 1,
+		.block_width_256_bytes_C = 128,
+	},
+	{
+		.desc = "10-bit 4:2:0 encoding with VAR display swizzle",
+		.source_pixel_format = dm_420_10,
+		.surface_tiling = dm_sw_var_d,
+		.byte_per_pixel_Y = 4.0 / 3.0,
+		.byte_per_pixel_C = 8.0 / 3.0,
+		.block_height_256_bytes_Y = 8,
+		.block_width_256_bytes_Y = 32,
+		.block_height_256_bytes_C = 8,
+		.block_width_256_bytes_C = 16,
+	},
+};
+
+static const struct calculate_write_back_DISPCLK_test_case calculate_write_back_DISPCLK_cases[] = {
+	{
+		.desc = "Trivial test",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 0.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0,
+	},
+	{
+		.desc = "Simple Writeback Ratio",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1800.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.e7c6a11ep+11,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1360.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.5766666666666p+11,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 2720.72,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.ba5e02226985ep+12,
+	},
+	{
+		.desc = "No Writeback to Luma Taps",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 1800.66,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.85b6dabefdfd9p+11,
+	},
+	{
+		.desc = "Reduce numeric error by decreasing pixel clock",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 400.756,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.4bb8ddb60f598p+10,
+	},
+	{
+		.desc = "Increase numeric error by increasing pixel clock",
+		.writeback_pixel_format = dm_444_32,
+		.pixel_clock = 3200.8,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 2,
+		.writeback_chroma_VTaps = 2,
+		.writeback_destination_width = 1686.7,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.847ced698147bp+12,
+	},
+	{
+		.desc = "Simple Writeback Ratio for 4:4:4 8-bit encoding",
+		.writeback_pixel_format = dm_444_8,
+		.pixel_clock = 1800.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 4,
+		.writeback_luma_VTaps = 4,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.24aa62p+12,
+	},
+	{
+		.desc = "Non-integer WritebackVRatio with same number of Luma and Chroma taps for 4:4:4 64-bit encoding",
+		.writeback_pixel_format = dm_444_64,
+		.pixel_clock = 1360.00,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 7,
+		.writeback_luma_VTaps = 7,
+		.writeback_chroma_HTaps = 7,
+		.writeback_chroma_VTaps = 7,
+		.writeback_destination_width = 400.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.576666p+11,
+	},
+	{
+		.desc = "No Writeback to Chroma Taps for 4:2:0 8-bit encoding",
+		.writeback_pixel_format = dm_420_8,
+		.pixel_clock = 2720.72,
+		.writeback_HRatio = 1.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 8,
+		.writeback_luma_VTaps = 8,
+		.writeback_chroma_HTaps = 0,
+		.writeback_chroma_VTaps = 0,
+		.writeback_destination_width = 1333.56,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 5,
+		.calculate_write_back_DISPCLK = 0x1.717f8p+12,
+	},
+	{
+		.desc = "No Writeback to Luma Taps for 4:2:0 10-bit encoding",
+		.writeback_pixel_format = dm_420_10,
+		.pixel_clock = 1800.66,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.5,
+		.writeback_luma_HTaps = 0,
+		.writeback_luma_VTaps = 0,
+		.writeback_chroma_HTaps = 3,
+		.writeback_chroma_VTaps = 3,
+		.writeback_destination_width = 996.0,
+		.HTotal = 1400,
+		.writeback_chroma_line_buffer_width = 4,
+		.calculate_write_back_DISPCLK = 0x1.43767ep+10,
+	},
+	{
+		.desc = "Reduce numeric error by decreasing pixel clock for 4:4:4 16-bit encoding",
+		.writeback_pixel_format = dm_444_16,
+		.pixel_clock = 340.456,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 5,
+		.writeback_luma_VTaps = 5,
+		.writeback_chroma_HTaps = 5,
+		.writeback_chroma_VTaps = 5,
+		.writeback_destination_width = 2400.0,
+		.HTotal = 1181,
+		.writeback_chroma_line_buffer_width = 3,
+		.calculate_write_back_DISPCLK = 0x1.067b3p+10,
+	},
+	{
+		.desc = "Increase numeric error by increasing pixel clock for 4:4:4 16-bit encoding",
+		.writeback_pixel_format = dm_444_16,
+		.pixel_clock = 4000.92,
+		.writeback_HRatio = 2.0,
+		.writeback_VRatio = 1.0,
+		.writeback_luma_HTaps = 3,
+		.writeback_luma_VTaps = 3,
+		.writeback_chroma_HTaps = 2,
+		.writeback_chroma_VTaps = 2,
+		.writeback_destination_width = 1686.7,
+		.HTotal = 1100,
+		.writeback_chroma_line_buffer_width = 2,
+		.calculate_write_back_DISPCLK = 0x1.84b5b8p+12,
+	},
+};
+
+static void pixel_clock_adjustment_for_progressive_to_interlace_unit_test_to_desc
+(const struct pixel_clock_adjustment_for_progressive_to_interlace_unit_test_case *t,
+	char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(pixel_clock_adjustment_for_progressive_to_interlace_unit,
+		  pixel_clock_adjustment_for_progressive_to_interlace_unit_cases,
+		  pixel_clock_adjustment_for_progressive_to_interlace_unit_test_to_desc);
+
+static void calculate_256B_block_sizes_test_to_desc
+(const struct calculate_256B_block_sizes_test_case *t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_256B_block_sizes, calculate_256B_block_sizes_cases,
+		  calculate_256B_block_sizes_test_to_desc);
+
+static void calculate_write_back_DISPCLK_test_to_desc(const struct
+		calculate_write_back_DISPCLK_test_case * t, char *desc)
+{
+	strcpy(desc, t->desc);
+}
+
+KUNIT_ARRAY_PARAM(calculate_write_back_DISPCLK, calculate_write_back_DISPCLK_cases,
+		  calculate_write_back_DISPCLK_test_to_desc);
+
+static struct kunit_case display_mode_vba_test_cases[] = {
+	KUNIT_CASE_PARAM(pclk_adjustment_for_progressive_to_interlace_unit_test,
+			 pixel_clock_adjustment_for_progressive_to_interlace_unit_gen_params),
+	KUNIT_CASE_PARAM(calculate_256B_block_sizes_test,
+			 calculate_256B_block_sizes_gen_params),
+	KUNIT_CASE(calculate_min_and_max_prefetch_mode_test),
+	KUNIT_CASE_PARAM(calculate_write_back_DISPCLK_test,
+			 calculate_write_back_DISPCLK_gen_params),
+	{}
+};
+
+static struct kunit_suite display_mode_vba_test_suite = {
+	.name = "dml_display_mode_vba",
+	.test_cases = display_mode_vba_test_cases,
+};
+
+kunit_test_suite(display_mode_vba_test_suite);
-- 
2.37.0

