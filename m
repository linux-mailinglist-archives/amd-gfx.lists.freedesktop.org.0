Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986B95B5DC3
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Sep 2022 18:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD64710E5CA;
	Mon, 12 Sep 2022 16:00:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2AC10E5CB;
 Mon, 12 Sep 2022 16:00:12 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MRBBg165szDqbL;
 Mon, 12 Sep 2022 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662998411; bh=DolYnUGD6+jEz5+n6r+diViRH0OZJ8MUGIDbSXvprNA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RHAzRKC8cffLF2rPIXcoXb1LjG7OBON+dmpgFivPeomAubw9aT/CEbQWNXx5Su4Qx
 KCzIz6rr9rhK8zln+Uf9+6SEadz5uoDJ9bSoP93afCVAZW+gH8P8cvhNVP2eH5EMQG
 Vb8PXkTJKTUL+McxsVJgwxn0ggAz4p0O4ZW3DJQs=
X-Riseup-User-ID: 4E6EFA140C77430D348C821A2644D6A488465E45880684DF6D55A0C314A75DC2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MRBBX0H6Fz5vgp;
 Mon, 12 Sep 2022 16:00:03 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: [PATCH v3 1/8] drm/amd/display: Introduce KUnit tests for fixed31_32
 library
Date: Mon, 12 Sep 2022 12:59:12 -0300
Message-Id: <20220912155919.39877-2-mairacanal@riseup.net>
In-Reply-To: <20220912155919.39877-1-mairacanal@riseup.net>
References: <20220912155919.39877-1-mairacanal@riseup.net>
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
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tales Aparecida <tales.aparecida@gmail.com>

The fixed31_32 library performs a lot of the mathematical operations
involving fixed-point arithmetic and the conversion of integers to
fixed-point representation.

This unit tests intend to assure the proper functioning of the basic
mathematical operations of fixed-point arithmetic, such as
multiplication, conversion from fractional to fixed-point number,
and more. Use kunit_tool to run:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
	--kunitconfig=drivers/gpu/drm/amd/display/tests/

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 drivers/gpu/drm/amd/display/Kconfig           |  13 +
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 .../gpu/drm/amd/display/tests/.kunitconfig    |   6 +
 drivers/gpu/drm/amd/display/tests/Makefile    |  12 +
 .../display/tests/dc/basics/fixpt31_32_test.c | 232 ++++++++++++++++++
 5 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 96cbc87f7b6b..cc44cfe88607 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -55,4 +55,17 @@ config DRM_AMD_SECURE_DISPLAY
             Cooperate with specific DMCU FW.
 
 
+config AMD_DC_BASICS_KUNIT_TEST
+	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
+	depends on DRM_AMD_DC && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+		Enables unit tests for the Display Core. Only useful for kernel
+		devs running KUnit.
+
+		For more information on KUnit and unit tests in general please refer to
+		the KUnit documentation in Documentation/dev-tools/kunit/.
+
+		If unsure, say N.
+
 endmenu
diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
index 2633de77de5e..0f329aab13f0 100644
--- a/drivers/gpu/drm/amd/display/Makefile
+++ b/drivers/gpu/drm/amd/display/Makefile
@@ -43,7 +43,7 @@ endif
 #TODO: remove when Timing Sync feature is complete
 subdir-ccflags-y += -DBUILD_FEATURE_TIMING_SYNC=0
 
-DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src
+DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src tests
 
 ifdef CONFIG_DRM_AMD_DC_HDCP
 DAL_LIBS += modules/hdcp
diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/gpu/drm/amd/display/tests/.kunitconfig
new file mode 100644
index 000000000000..60f2ff8158f5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
@@ -0,0 +1,6 @@
+CONFIG_KUNIT=y
+CONFIG_PCI=y
+CONFIG_DRM=y
+CONFIG_DRM_AMDGPU=y
+CONFIG_DRM_AMD_DC=y
+CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
new file mode 100644
index 000000000000..ef16497318e8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/Makefile
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: MIT
+#
+# Makefile for the KUnit Tests for DC
+#
+
+ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
+	DC_TESTS += dc/basics/fixpt31_32_test.o
+endif
+
+AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DC_TESTS)
diff --git a/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
new file mode 100644
index 000000000000..2fc489203499
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: MIT
+/* Unit tests for display/include/fixed31_32.h and dc/basics/fixpt31_32.c
+ *
+ * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
+ */
+
+#include <kunit/test.h>
+#include "os_types.h"
+#include "fixed31_32.h"
+
+static const struct fixed31_32 dc_fixpt_minus_one = { -0x100000000LL };
+
+/**
+ * dc_fixpt_from_int_test - KUnit test for dc_fixpt_from_int
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_int_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	res = dc_fixpt_from_int(0);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_zero.value);
+
+	res = dc_fixpt_from_int(1);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(-1);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_int(INT_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0x7FFFFFFF00000000LL);
+
+	res = dc_fixpt_from_int(INT_MIN);
+	KUNIT_EXPECT_EQ(test, res.value,
+			0x8000000000000000LL); /* implicit negative signal */
+}
+
+/**
+ * dc_fixpt_from_fraction_test - KUnit test for dc_fixpt_from_fraction
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_from_fraction_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_from_fraction(1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, 1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-1LL, -1LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	res = dc_fixpt_from_fraction(LLONG_MAX, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(LLONG_MIN, LLONG_MIN);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Edge case using the smallest fraction possible without LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Edge case using the smallest fraction possible with LSB rounding */
+	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART + 1));
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
+
+	/* Assert an nil numerator is a valid input */
+	res = dc_fixpt_from_fraction(0LL, LLONG_MAX);
+	KUNIT_EXPECT_EQ(test, res.value, 0LL);
+
+	/* Edge case using every bit of the decimal part without rounding */
+	res = dc_fixpt_from_fraction(8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0FFFFFFFFLL);
+
+	res = dc_fixpt_from_fraction(-8589934590LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0FFFFFFFFLL);
+
+	/* Edge case using every bit of the decimal part then rounding LSB */
+	res = dc_fixpt_from_fraction(8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_from_fraction(-8589934591LL, 8589934592LL);
+	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
+	/*  A repeating decimal in binary representation that doesn't round up the LSB */
+	res = dc_fixpt_from_fraction(4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000155555555LL);
+
+	res = dc_fixpt_from_fraction(-4, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x0000000155555555LL);
+
+	/* A repeating decimal in binary representation that rounds up the LSB */
+	res = dc_fixpt_from_fraction(5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, 0x00000001AAAAAAABLL);
+
+	res = dc_fixpt_from_fraction(-5, 3);
+	KUNIT_EXPECT_EQ(test, res.value, -0x00000001AAAAAAABLL);
+}
+
+/**
+ * dc_fixpt_mul_test - KUnit test for dc_fixpt_mul
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_mul_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert signal works as expected */
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
+
+	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_minus_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert that the greatest parameter values works as expected */
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(arg, dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MAX;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	arg.value = LONG_MIN;
+	res = dc_fixpt_mul(dc_fixpt_one, arg);
+	KUNIT_EXPECT_EQ(test, res.value, arg.value);
+
+	/* Assert it doesn't round LSB as expected */
+	arg.value = 0x7FFFFFFF7fffffffLL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x000000007FFFFFFF);
+
+	/* Assert it rounds LSB as expected */
+	arg.value = 0x7FFFFFFF80000000LL;
+	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
+	KUNIT_EXPECT_EQ(test, res.value, 0x0000000080000000);
+}
+
+/**
+ * dc_fixpt_sqr_test - KUnit test for dc_fixpt_sqr
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_sqr_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	arg.value = dc_fixpt_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = dc_fixpt_minus_one.value;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	arg.value = 0;
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0);
+
+	/* Test some recognizable values */
+	arg = dc_fixpt_from_int(100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_from_int(10000).value);
+
+	arg = dc_fixpt_from_fraction(1, 100);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(1, 10000).value);
+
+	/* LSB rounding */
+	arg = dc_fixpt_from_fraction(3, 2);
+	res = dc_fixpt_sqr(arg);
+	KUNIT_EXPECT_EQ(test, res.value,
+			dc_fixpt_from_fraction(9, 4).value + 1LL);
+}
+
+/**
+ * dc_fixpt_recip_test - KUnit test for dc_fixpt_recip
+ * @test: represents a running instance of a test.
+ */
+static void dc_fixpt_recip_test(struct kunit *test)
+{
+	struct fixed31_32 res;
+	struct fixed31_32 arg;
+
+	/* Assert 1/1 works as expected */
+	res = dc_fixpt_recip(dc_fixpt_one);
+	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
+
+	/* Assert smallest parameters work as expected. */
+	arg.value = 3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, 0x5555555555555555LL);
+
+	arg.value = -3LL;
+	res = dc_fixpt_recip(arg);
+	KUNIT_EXPECT_EQ(test, res.value, -0x5555555555555555LL);
+}
+
+static struct kunit_case dc_basics_fixpt31_32_test_cases[] = {
+	KUNIT_CASE(dc_fixpt_from_int_test),
+	KUNIT_CASE(dc_fixpt_from_fraction_test),
+	KUNIT_CASE(dc_fixpt_mul_test),
+	KUNIT_CASE(dc_fixpt_sqr_test),
+	KUNIT_CASE(dc_fixpt_recip_test),
+	{}
+};
+
+static struct kunit_suite dc_basics_fixpt31_32_test_suite = {
+	.name = "dc_basics_fixpt31_32",
+	.test_cases = dc_basics_fixpt31_32_test_cases,
+};
+
+kunit_test_suites(&dc_basics_fixpt31_32_test_suite);
+
-- 
2.37.3

