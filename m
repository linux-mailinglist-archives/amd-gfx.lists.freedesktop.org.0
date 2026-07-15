Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id elBhJGGPV2okXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 15:47:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D975EE6F
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 15:47:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="MF/8arK1";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22A510F08F;
	Wed, 15 Jul 2026 13:47:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9699010F08D
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 13:47:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3RldZpIDFLaGu2kH/F1BtbWfu3hfRZcmy9q/BGBXpf+U3hj0Yzbj+mIhZ5O99ePuf+wcZMcNOEYCs4uw9Fx/ZFFTWWByMMnukJLTUW++2y5UAwdc62it9p78Vv/bJs/PEs1M5fSVpBjrLOuaHHLnE75CD6XR3q+ePVC7brBNj6Kjt5z4Pw9tYyXKAtVcskzn6gy40eZa3dDmbFfIstYFdHNhWF0H9ptTrayyyV5+nqJ5GzMF0moFqY1uIXoWfGbGg0O4CRMdQ7bwi02yZDc12eeU1Jrk1NGpaP0LECIiT6/Ue6iVXm3M/VK7ENqQcOavbaHI9kvXcXWq8y/uVj6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSCbGtRIWzkqhvuuzkvuzDRjwPRGlOmpjf5w2cclWUE=;
 b=cM/zO5eWEvHRKPJjjKpN/Duf7l91T5flDcjwc0A1fKHtljY2YDw1yP2lJhwdbPYjiWfdRr997gTXzPDcUx0hh9Wn3mh/Pgc3q0Rp2di5M39WFbhKoDtp1dGxAmdPmkV0pMIwghwDoR4FepvB5czpZzoFbCrdDBOXeArwqpu7zx0TO8U6F4Q+pcy16HoZRAeF+SkbQB8VbdlDRT5CGUUG4vVBgBLXE/zcaazf9RrY4nKkZbFmvmsT494Y4LJL6Pa+aIH0p+VhlGFrJB7XOTu5ULfIpUUrWbr88G/lp+4hnlWbpJ4jSkqH23T7OTFUFM1waUt8qOTovouidFq6nMyFKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSCbGtRIWzkqhvuuzkvuzDRjwPRGlOmpjf5w2cclWUE=;
 b=MF/8arK1vxQ/s1VvZ6rp96E0jBopYBb/yT4Yf5cs/Zz1FSXuipoHoD+IST2toF1SXFH/gLlI+ZhGt04LUZ8lO/LbZgb5qsB1NbJZ8pRC+5nCZArBuTagt7Al5JcWV5qtAipzLaMALuLjD1EpAsvcrNz+0+oTsjVEyeFcTGpjz6c=
Received: from PH0P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::33)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Wed, 15 Jul
 2026 13:47:00 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:d3:cafe::80) by PH0P220CA0018.outlook.office365.com
 (2603:10b6:510:d3::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 13:47:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 13:47:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 15 Jul
 2026 08:46:57 -0500
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 15 Jul 2026 08:46:54 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, James Lin <PingLei.Lin@amd.com>, Chenyu Chen
 <Chen-Yu.Chen@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Subject: [PATCH 33/70] drm/amd/display: add KUnit tests for DM stream scaling
Date: Wed, 15 Jul 2026 21:37:43 +0800
Message-ID: <20260715134432.1975118-34-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715134432.1975118-1-Wayne.Lin@amd.com>
References: <20260715134432.1975118-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 0135b5ad-df8f-4e41-9bcc-08dee2778b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|13003099007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sZBOaUFwEMYU1Jels5l7+dvMFyXXjm0J0/SbluCbcJk/p3gvQPS6ytLmV5EQG9pM5GgA1yweQ+T3QkMHEIu8W9vgSwk1ofhdsm62S4B0Itehv+uuky9Jh6IX1mODiQNRuGY76urA378/EL+0R+VMfmEPiAATWVEAgCvhkunHnHwUZ6+YoJYJpcbXGM5jrPjCeyFHITLAs/yEES9p3GquyML+OrLz9NF0vqo/HsGdMeXcCh4w3/6OFqDMnxv49bgOjrsYuxy7X2hfPa+Wf3yO/BOD8b+x3P3nrheXNUV7xWhvjp26Bv0S1oEzP87/Ne+b5qHaSFcxnLPEDujfSU5rmuYbrchkvVci+KHKIJDrwgduZ3BYPtKByZDfrkbmXUfsJS+7TPdO40+FEhlSKo5KOrPszAkpjqTSdrkvtZhlpQFvfGZ+6OID0ZzQZONXip94zR4KdqbQtG/aDiGzQdlEAh3IFgYx+LXWWPakmwzBP02i126SYdBNsRVRg06cjU/4cWzSt+X3rS/2v5JAdZEaV6s0CMzK7NJQ/cSRmGPlb51xLXmQJMV2VtlUKsaznQqibqbnXLsApDjA3xCffhjn7TFyOZ29j6Mfh4WxWW/NmiRf/m/FxkspQw//U1osQ/g/9M4RyuwQYp5EA/LJ8rDH3Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(13003099007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OqWjmS3xc3Xb7PNrd+wsfrkpnAENdCM07ntXLvJ4wnqqtwqMhlhhZX1ZY2Ey74wxZpQeunCV46dOMH0qgDa0vN3GOysPt3OQNsOCEboLFHPcC51dDuCc2ZF2qhFbcEaV222cG8exajQsbmC6Axq01KJKLnmajpD4QjZ0WeneArsHzT2M439WS8UScL0budUSOR3sqnhI+zoL4BJJ28287l1BkyEpyQvk/NjU8TgOToBkcT8qJ+roWRNDN5dSnC3+Lno+A4BR8Vvz6XP30DrgZPbUmGuryZJS83FCq4tFKUyQ8TVKcyKVvAjUnuxLCaMMGNflE2SKfglfrpH5PFQrDVsq4/bjsbwzrJmvuQMX4JnwwmRQckOWJC4KMXpq9zRI8OMtxQ/4vDZ4XwDBTcCTmW8gh8FzOjL2H8T5w3QTYPZPNz1/wiXqjhLdzK/UZ79i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:47:00.2288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0135b5ad-df8f-4e41-9bcc-08dee2778b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Wayne.Lin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D7D975EE6F
X-Rspamd-Action: no action

From: Alex Hung <alex.hung@amd.com>

[WHAT]
Add KUnit tests for the stream scaling path: a disable-underscan case
for is_scaling_state_different, and coverage of
amdgpu_dm_update_stream_scaling_settings across the full-screen
default, RMX_FULL, RMX_ASPECT pillarbox/letterbox, RMX_CENTER and
underscan paths.

Assisted-by: Copilot:Claude-Opus-4.8
Reviewed-by: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Wayne Lin <wayne.lin@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 .../display/amdgpu_dm/tests/amdgpu_dm_test.c  | 231 ++++++++++++++++++
 2 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7806b3405c3d..fc1a73435203 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3456,6 +3456,7 @@ void amdgpu_dm_update_stream_scaling_settings(struct drm_device *dev,
 		    dst.x, dst.y, dst.width, dst.height);
 
 }
+EXPORT_IF_KUNIT(amdgpu_dm_update_stream_scaling_settings);
 
 static int dm_update_mst_vcpi_slots_for_dsc(struct drm_atomic_state *state,
 					    struct dc_state *dc_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
index 92056f4147d3..724d03db2736 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_test.c
@@ -830,6 +830,28 @@ static void dm_test_scaling_state_underscan_enabled(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, is_scaling_state_different(new_state, old_state));
 }
 
+/**
+ * dm_test_scaling_state_underscan_disabled - Test disabling underscan with borders differs
+ * @test: The KUnit test context
+ */
+static void dm_test_scaling_state_underscan_disabled(struct kunit *test)
+{
+	struct dm_connector_state *old_state;
+	struct dm_connector_state *new_state;
+
+	old_state = kunit_kzalloc(test, sizeof(*old_state), GFP_KERNEL);
+	new_state = kunit_kzalloc(test, sizeof(*new_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, old_state);
+	KUNIT_ASSERT_NOT_NULL(test, new_state);
+
+	old_state->underscan_enable = true;
+	old_state->underscan_hborder = 16;
+	old_state->underscan_vborder = 16;
+	new_state->underscan_enable = false;
+
+	KUNIT_EXPECT_TRUE(test, is_scaling_state_different(new_state, old_state));
+}
+
 /**
  * dm_test_scaling_state_underscan_border_changed - Test changed underscan borders differ
  * @test: The KUnit test context
@@ -1203,6 +1225,206 @@ static void dm_test_master_stream_defaults_to_first(struct kunit *test)
 			    stream0);
 }
 
+/* Tests for amdgpu_dm_update_stream_scaling_settings() */
+
+/**
+ * dm_test_update_scaling_null_mode - Test NULL mode leaves the stream rects untouched
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_null_mode(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+
+	stream->timing.h_addressable = 1920;
+	stream->timing.v_addressable = 1080;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, NULL, NULL, stream);
+
+	/* NULL mode: early return before touching src/dst */
+	KUNIT_EXPECT_EQ(test, stream->src.width, 0);
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 0);
+}
+
+/**
+ * dm_test_update_scaling_fullscreen_default - Test full-screen default with no dm_state
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_fullscreen_default(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct drm_display_mode mode = { 0 };
+
+	mode.hdisplay = 1920;
+	mode.vdisplay = 1080;
+	stream->timing.h_addressable = 2560;
+	stream->timing.v_addressable = 1440;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, NULL, stream);
+
+	/* src = mode, dst = timing addressable, no centering without dm_state */
+	KUNIT_EXPECT_EQ(test, stream->src.width, 1920);
+	KUNIT_EXPECT_EQ(test, stream->src.height, 1080);
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 2560);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 1440);
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 0);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 0);
+}
+
+/**
+ * dm_test_update_scaling_rmx_full - Test RMX_FULL keeps a full-size, centered dst
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_rmx_full(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct dm_connector_state *dm_state;
+	struct drm_display_mode mode = { 0 };
+
+	dm_state = kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dm_state);
+
+	mode.hdisplay = 1280;
+	mode.vdisplay = 720;
+	stream->timing.h_addressable = 1920;
+	stream->timing.v_addressable = 1080;
+	dm_state->scaling = RMX_FULL;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, dm_state, stream);
+
+	/* RMX_FULL: dst stays full addressable, offset 0 */
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 1920);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 1080);
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 0);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 0);
+}
+
+/**
+ * dm_test_update_scaling_rmx_aspect_pillarbox - Test RMX_ASPECT preserves aspect ratio
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_rmx_aspect_pillarbox(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct dm_connector_state *dm_state;
+	struct drm_display_mode mode = { 0 };
+
+	dm_state = kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dm_state);
+
+	/* 4:3 source on a 16:9 panel -> pillarboxed */
+	mode.hdisplay = 1024;
+	mode.vdisplay = 768;
+	stream->timing.h_addressable = 1920;
+	stream->timing.v_addressable = 1080;
+	dm_state->scaling = RMX_ASPECT;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, dm_state, stream);
+
+	/*
+	 * src.width*dst.height (1024*1080) < src.height*dst.width (768*1920):
+	 * width scaled to src.width*dst.height/src.height = 1440, height stays
+	 * 1080, centered horizontally at (1920-1440)/2 = 240.
+	 */
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 1440);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 1080);
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 240);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 0);
+}
+
+/**
+ * dm_test_update_scaling_rmx_aspect_letterbox - Test RMX_ASPECT letterboxes wide sources
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_rmx_aspect_letterbox(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct dm_connector_state *dm_state;
+	struct drm_display_mode mode = { 0 };
+
+	dm_state = kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dm_state);
+
+	/* 16:9 source on a 4:3 panel -> letterboxed */
+	mode.hdisplay = 1920;
+	mode.vdisplay = 1080;
+	stream->timing.h_addressable = 1024;
+	stream->timing.v_addressable = 768;
+	dm_state->scaling = RMX_ASPECT;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, dm_state, stream);
+
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 1024);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 576);
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 0);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 96);
+}
+
+/**
+ * dm_test_update_scaling_rmx_center - Test RMX_CENTER centers a 1:1 dst
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_rmx_center(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct dm_connector_state *dm_state;
+	struct drm_display_mode mode = { 0 };
+
+	dm_state = kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dm_state);
+
+	mode.hdisplay = 1280;
+	mode.vdisplay = 720;
+	stream->timing.h_addressable = 1920;
+	stream->timing.v_addressable = 1080;
+	dm_state->scaling = RMX_CENTER;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, dm_state, stream);
+
+	/* RMX_CENTER: dst = src, centered on the addressable area */
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 1280);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 720);
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 320);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 180);
+}
+
+/**
+ * dm_test_update_scaling_underscan - Test underscan borders shrink and offset dst
+ * @test: The KUnit test context
+ */
+static void dm_test_update_scaling_underscan(struct kunit *test)
+{
+	struct amdgpu_device *adev = dm_kunit_alloc_adev(test);
+	struct dc_stream_state *stream = dm_kunit_alloc_stream(test, NULL);
+	struct dm_connector_state *dm_state;
+	struct drm_display_mode mode = { 0 };
+
+	dm_state = kunit_kzalloc(test, sizeof(*dm_state), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, dm_state);
+
+	mode.hdisplay = 1920;
+	mode.vdisplay = 1080;
+	stream->timing.h_addressable = 1920;
+	stream->timing.v_addressable = 1080;
+	dm_state->scaling = RMX_FULL;
+	dm_state->underscan_enable = true;
+	dm_state->underscan_hborder = 64;
+	dm_state->underscan_vborder = 32;
+
+	amdgpu_dm_update_stream_scaling_settings(&adev->ddev, &mode, dm_state, stream);
+
+	/* Full dst, then underscan: x/y += border/2, width/height -= border */
+	KUNIT_EXPECT_EQ(test, stream->dst.x, 32);
+	KUNIT_EXPECT_EQ(test, stream->dst.y, 16);
+	KUNIT_EXPECT_EQ(test, stream->dst.width, 1856);
+	KUNIT_EXPECT_EQ(test, stream->dst.height, 1048);
+}
+
 static struct kunit_case amdgpu_dm_tests[] = {
 	/* Simple DM callbacks */
 	KUNIT_CASE(dm_test_is_idle),
@@ -1254,6 +1476,7 @@ static struct kunit_case amdgpu_dm_tests[] = {
 	KUNIT_CASE(dm_test_scaling_state_same),
 	KUNIT_CASE(dm_test_scaling_state_scaling_changed),
 	KUNIT_CASE(dm_test_scaling_state_underscan_enabled),
+	KUNIT_CASE(dm_test_scaling_state_underscan_disabled),
 	KUNIT_CASE(dm_test_scaling_state_underscan_border_changed),
 	/* is_timing_unchanged_for_freesync */
 	KUNIT_CASE(dm_test_timing_unchanged_null_args),
@@ -1274,6 +1497,14 @@ static struct kunit_case amdgpu_dm_tests[] = {
 	/* set_master_stream */
 	KUNIT_CASE(dm_test_master_stream_highest_refresh),
 	KUNIT_CASE(dm_test_master_stream_defaults_to_first),
+	/* amdgpu_dm_update_stream_scaling_settings */
+	KUNIT_CASE(dm_test_update_scaling_null_mode),
+	KUNIT_CASE(dm_test_update_scaling_fullscreen_default),
+	KUNIT_CASE(dm_test_update_scaling_rmx_full),
+	KUNIT_CASE(dm_test_update_scaling_rmx_aspect_pillarbox),
+	KUNIT_CASE(dm_test_update_scaling_rmx_aspect_letterbox),
+	KUNIT_CASE(dm_test_update_scaling_rmx_center),
+	KUNIT_CASE(dm_test_update_scaling_underscan),
 	{}
 };
 
-- 
2.43.0

