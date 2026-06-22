Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ebyZMrYsOWq+nwcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:38:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD716AF7C3
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:38:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HBkqTNIE;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF59310E69B;
	Mon, 22 Jun 2026 12:38:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AC910E6A2;
 Mon, 22 Jun 2026 12:38:11 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id C3E7E42DF9;
 Mon, 22 Jun 2026 12:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B07B1F000E9;
 Mon, 22 Jun 2026 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782131891;
 bh=aLPqKAV7NdOOeAs34uEEPNQIcuUUtHD4+t3qpP0ZBqM=;
 h=From:To:Cc:Subject:Date;
 b=HBkqTNIEGjJS5hE5R8YGUecnvZvxQ7ddtBHMiP7EKEWMM9OzJhNrBEcpW8zpRoUab
 c9kjjbUfPmR7kEbS0sYhrxgxrCeYlVXC0nzksTNwVVbYchnMDLz+iwxZgD0eWXRbUU
 3RpXyhVdjIAFp0LdF4dW7Uo12KCtrfuk8OdywQnQ+Ip1xOSYyJWQNIeolZfnO2V05m
 s+wtx1P+CgGhESs+dWV0uD9LTM6u5eY7CAxEsAzScigQfpPLUCtIP/nuhhCHT5XNrE
 gzmF+W+pQv7aNUMCsWErqDeZxevQmQ4ZjK/1VYelrWxhL6F9eoVL+6yPn5opWxAtVV
 onz/U84y7K4BQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Hung <alex.hung@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <siqueira@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: kunit: move dc_link objects off stack
Date: Mon, 22 Jun 2026 14:36:42 +0200
Message-Id: <20260622123659.2221930-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2BD716AF7C3

From: Arnd Bergmann <arnd@arndb.de>

'struct dc_link' is too large to be on the kernel stack, with every instance
causing a build time warning in some configurations:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c: In function 'dm_test_subconnector_type_none':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_connector_test.c:36:1: error: the frame size of 1608 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
   36 | }
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c: In function 'dm_mst_test_needs_dsc_aux_workaround_zero_sink_count':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c:156:1: error: the frame size of 1584 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
  156 | }

Since the tests do not need to run concurrently, just make it a per-file
static object that gets reinitialized for each test case.

Fixes: a895eb57a55f drm/amd/display: Add KUnit tests for amdgpu_dm_connector
Fixes: 1c37d1b6c741 drm/amd/display: Add KUnit tests for amdgpu_dm_mst_types
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
The patches causing this seem to have appeared were not in linux-next
during the first half of the merge window, not sure why they are there,
but in case these are intended for 7.2, it still needs to get fixed.
---
 .../amdgpu_dm/tests/amdgpu_dm_connector_test.c  | 17 +++++++++--------
 .../amdgpu_dm/tests/amdgpu_dm_mst_types_test.c  | 14 ++++++++------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
index 34e40d2a9d2c..e2c0c2a934a6 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_connector_test.c
@@ -22,6 +22,7 @@
 #include "include/grph_object_id.h"
 
 /* Tests for get_subconnector_type() */
+static struct dc_link link;
 
 /**
  * dm_test_subconnector_type_none - Test Subconnector type none
@@ -29,7 +30,7 @@
  */
 static void dm_test_subconnector_type_none(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_NONE;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_Native);
@@ -41,7 +42,7 @@ static void dm_test_subconnector_type_none(struct kunit *test)
  */
 static void dm_test_subconnector_type_vga(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_VGA_CONVERTER;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_VGA);
@@ -53,7 +54,7 @@ static void dm_test_subconnector_type_vga(struct kunit *test)
  */
 static void dm_test_subconnector_type_dvi_converter(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_DVI_CONVERTER;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_DVID);
@@ -65,7 +66,7 @@ static void dm_test_subconnector_type_dvi_converter(struct kunit *test)
  */
 static void dm_test_subconnector_type_dvi_dongle(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_DVI_DONGLE;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_DVID);
@@ -77,7 +78,7 @@ static void dm_test_subconnector_type_dvi_dongle(struct kunit *test)
  */
 static void dm_test_subconnector_type_hdmi_converter(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_HDMI_CONVERTER;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_HDMIA);
@@ -89,7 +90,7 @@ static void dm_test_subconnector_type_hdmi_converter(struct kunit *test)
  */
 static void dm_test_subconnector_type_hdmi_dongle(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_HDMI_DONGLE;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_HDMIA);
@@ -101,7 +102,7 @@ static void dm_test_subconnector_type_hdmi_dongle(struct kunit *test)
  */
 static void dm_test_subconnector_type_mismatched(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_Unknown);
@@ -113,7 +114,7 @@ static void dm_test_subconnector_type_mismatched(struct kunit *test)
  */
 static void dm_test_subconnector_type_default_unknown(struct kunit *test)
 {
-	struct dc_link link = {};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.dongle_type = (typeof(link.dpcd_caps.dongle_type))0x7f;
 	KUNIT_EXPECT_EQ(test, (int)get_subconnector_type(&link), (int)DRM_MODE_SUBCONNECTOR_Unknown);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
index e3b171992be1..f1f728acd373 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_mst_types_test.c
@@ -45,6 +45,8 @@ static ssize_t dm_mst_test_aux_transfer(struct drm_dp_aux *aux,
 	}
 }
 
+static struct dc_link link;
+
 /* Tests for needs_dsc_aux_workaround */
 
 /**
@@ -56,7 +58,7 @@ static ssize_t dm_mst_test_aux_transfer(struct drm_dp_aux *aux,
  */
 static void dm_mst_test_needs_dsc_aux_workaround_match(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
 	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
@@ -74,7 +76,7 @@ static void dm_mst_test_needs_dsc_aux_workaround_match(struct kunit *test)
  */
 static void dm_mst_test_needs_dsc_aux_workaround_rev12(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
 	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_12;
@@ -92,7 +94,7 @@ static void dm_mst_test_needs_dsc_aux_workaround_rev12(struct kunit *test)
  */
 static void dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = 0x123456;
 	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
@@ -110,7 +112,7 @@ static void dm_mst_test_needs_dsc_aux_workaround_wrong_dev_id(struct kunit *test
  */
 static void dm_mst_test_needs_dsc_aux_workaround_wrong_rev(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
 	link.dpcd_caps.dpcd_rev.raw = 0x11; /* DPCD 1.1 */
@@ -128,7 +130,7 @@ static void dm_mst_test_needs_dsc_aux_workaround_wrong_rev(struct kunit *test)
  */
 static void dm_mst_test_needs_dsc_aux_workaround_low_sink_count(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
 	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
@@ -146,7 +148,7 @@ static void dm_mst_test_needs_dsc_aux_workaround_low_sink_count(struct kunit *te
  */
 static void dm_mst_test_needs_dsc_aux_workaround_zero_sink_count(struct kunit *test)
 {
-	struct dc_link link = {0};
+	memset(&link, 0, sizeof(link));
 
 	link.dpcd_caps.branch_dev_id = DP_BRANCH_DEVICE_ID_90CC24;
 	link.dpcd_caps.dpcd_rev.raw = DPCD_REV_14;
-- 
2.39.5

