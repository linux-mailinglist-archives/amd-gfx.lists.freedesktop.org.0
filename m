Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C10CA810A11
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Dec 2023 07:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C5910E6F9;
	Wed, 13 Dec 2023 06:14:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::624])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B1910E6F9
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Dec 2023 06:14:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4s3SC8f/AWMkdnv/w1RakA4yyoI1gi6QTa747hQfnfh1ofoSXwnzeq4IzSB2vOFYiFxIp4lqC0diG3dvRbw+AGUg4P9i6RPwY1e7nwvUE8NGDY49+u8v2AZSRqPl3j8N/5cziaxnAwkkjBHgxqi7lQeH3O+zDHLJxwIEw+bXdVV2JbidY8E19e41+1KUWteZOqNRJt7EiSd/8N+iWJRs0oadCnGVI1JdOX58H0KgJ3cGWd7ZJucalwMpyO50r0Bfass2f8h1tkkW3R2K2Y2aSO78H0GsT8bsb3pl6usoAx2o7P1YJSvhmQgr9nYALfeKdOruj/EGwLwDs8qCjezIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U+XA3u6tIpZ1/D3r+xIG8GXYChN1NRPhwTLYiI+cmI=;
 b=mDmCN2G2J5/Qb1btQU2xjCj/gRJa4IfUant7GOeY9bkOUo5r75XQnEUDdWDWjpjyOi+BPlTdHJyPBuCSQeNIi5nxDxjwYkvhezQp3kolRal/WQNN49zjPzIevaMZtjspXx81odjV/HFht2AzKlY630IqiQLnzp5INFg3aNanV44lldfvDQqkA2f8YSRhj7baKB/nao2e1BurMGt1bijMJZtp0BJv6zZkN693Iej4Uq0uuE/gyrQjh3sj5ta07z3mJsG6F2vescLj484WpNSQKZDt4QluAFmyzbRaWKrUgxyqPzyZMMQ8DmJqKkTj0ol7AfWGpJ6Z0tWUFdy1D2oocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/U+XA3u6tIpZ1/D3r+xIG8GXYChN1NRPhwTLYiI+cmI=;
 b=QDW/1PVdN04VLSx3bN3NOqd88gtj7cixvgppcreM/ctlASJDi4cvTk7WABGYe1Ltwn15YvyheZ9FAj50XPpeTLyNUFLpSN4mvjCtz1YbgWGVpoVWZUA3jyJQNqu7N5wr+Jhg32xUjH8K7hvPoiB/BXsP0NreK1JQvZpXNuSa/2o=
Received: from SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::7)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 06:14:46 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::1b) by SJ0P220CA0001.outlook.office365.com
 (2603:10b6:a03:41b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26 via Frontend
 Transport; Wed, 13 Dec 2023 06:14:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 06:14:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 13 Dec
 2023 00:14:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 12 Dec
 2023 22:14:43 -0800
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 13 Dec 2023 00:14:38 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 18/25] drm/amd/display: Refactor dc_state interface
Date: Wed, 13 Dec 2023 14:12:20 +0800
Message-ID: <20231213061227.1750663-19-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20231213061227.1750663-1-Wayne.Lin@amd.com>
References: <20231213061227.1750663-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|MN2PR12MB4127:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e36318d-0187-4470-fa06-08dbfba2ce00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4+xHMQq7myC7qagCZeieOxRyKThhZsJ2OgUZJitO1pD3G3gc2s09TwsVbiQlFbP0VlEAnTmzdIOQxuSNoz6M5Gf/SunX0EtLMx/pXYjrV69b8hLNsZd4hbpUat3Z6Xt5+1YpV06zBWmTr/RkST4NWBVstYSaMq+Katn//epXeljlqH9nTJpFIgMNtOZ+VqkaoPd1aT6C+KOdAmtUkDx9sHIIBipuIwr0YZ9yC/WXys+KUJqOjdb16Rt/BFrKjr5WKf1zh8zIqNkiHm9+N8ybM3UL3w/rKYUzKOZG9C21chaZ9ddKxZKzd3ACp5W/84iXK/VuPVXuLB5q+7uZkyzamGE0xZUixrPOG/AaAXvZKGI7kmW6jvGKPTT7hDUkObWS8VvVAoCYD7/4+MTDDLZgW9xqVoRrLyhtrdruqdqxPDX18z5j9/UBwFIazlZXUyvAUs1PndBZu+QZzIySHMeZoaUoK/x0i+t7lOF4qatwb/AQXRuUFw9B17sXK3ysLvvabW4tCHHBmCRb69/6Yp4tRGD3i0oLsyBtY6p7BRtGGNWls8Emvcsj5UVZvFPdK3pvG508phDflb565jufgb4q3jhWlSiEUryClI5B3kjwQyPpkg+erFYNeuMiUcm7rIo84hJrYmHDGodRc6JK4CXhupmSrBrVfzh5/DeD9Ie5p9LfC3pNT3v20iGwekOARfFBSwPrGYhbZLrC2jz+sh/T+unUjiQ/EWP+HgYqkVcYUsUho6QYN1RQp8XEBFAjyqItjJJZc+sEOk1HcpQ1QydnX5gc6MnoMN1zVMarKNZgCdYhz1X4d0svqjuJQU7R5Wv+5tyRfoExJ0GuvArPgqI+w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(230173577357003)(230273577357003)(186009)(82310400011)(451199024)(1800799012)(64100799003)(40470700004)(46966006)(36840700001)(40480700001)(66899024)(40460700003)(70586007)(70206006)(82740400003)(356005)(81166007)(36756003)(86362001)(36860700001)(47076005)(26005)(336012)(83380400001)(426003)(1076003)(7696005)(2616005)(2906002)(30864003)(54906003)(6916009)(316002)(478600001)(6666004)(5660300002)(8936002)(8676002)(4326008)(41300700001)(36900700001)(559001)(579004)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 06:14:46.0938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e36318d-0187-4470-fa06-08dbfba2ce00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
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
Cc: stylon.wang@amd.com, Dillon Varone <dillon.varone@amd.com>,
 chiahsuan.chung@amd.com, Sunpeng.Li@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hersenxs.wu@amd.com, wayne.lin@amd.com, Jun Lei <jun.lei@amd.com>,
 Harry.Wentland@amd.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 agustin.gutierrez@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dillon Varone <dillon.varone@amd.com>

[WHY?]
Part of the dc_state interface that deals with adding streams and planes should
remain public, while others that deal with internal status' and subvp should be
private to DC.

[HOW?]
Move and rename the public functions to dc_state.h and private functions to
dc_state_priv.h. Also add some additional functions for extracting subvp meta
data from the state.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Reviewed-by: Jun Lei <jun.lei@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  45 +-
 drivers/gpu/drm/amd/display/dc/Makefile       |   2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   3 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 171 ++----
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |   8 +-
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 294 +---------
 .../gpu/drm/amd/display/dc/core/dc_state.c    | 527 ++++++++++++++++++
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  33 +-
 .../gpu/drm/amd/display/dc/core/dc_surface.c  |   6 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |  16 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  31 +-
 drivers/gpu/drm/amd/display/dc/dc_plane.h     |  38 ++
 .../gpu/drm/amd/display/dc/dc_plane_priv.h    |  34 ++
 drivers/gpu/drm/amd/display/dc/dc_state.h     |  74 +++
 .../gpu/drm/amd/display/dc/dc_state_priv.h    |  97 ++++
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  44 --
 .../gpu/drm/amd/display/dc/dc_stream_priv.h   |  35 ++
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   5 +
 .../display/dc/dcn32/dcn32_resource_helpers.c |  28 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |   5 +-
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  |  45 +-
 .../drm/amd/display/dc/dml2/dml2_dc_types.h   |   1 +
 .../amd/display/dc/dml2/dml2_mall_phantom.c   |  73 +--
 .../display/dc/dml2/dml2_translation_helper.c |  10 +-
 .../gpu/drm/amd/display/dc/dml2/dml2_utils.c  |   6 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    |   2 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.h    |  32 +-
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c |   3 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  17 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  42 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |   4 +-
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   |  36 +-
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   |   3 +-
 drivers/gpu/drm/amd/display/dc/inc/resource.h |   1 -
 .../dc/resource/dcn32/dcn32_resource.c        |  83 ++-
 .../dc/resource/dcn321/dcn321_resource.c      |  21 +-
 .../dc/resource/dcn35/dcn35_resource.c        |   2 +
 37 files changed, 1171 insertions(+), 706 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/core/dc_state.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_plane_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_state_priv.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dc_stream_priv.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 34780bcde59c..186f3e3eb6c8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -37,6 +37,7 @@
 #include "dc/dc_dmub_srv.h"
 #include "dc/dc_edid_parser.h"
 #include "dc/dc_stat.h"
+#include "dc/dc_state.h"
 #include "amdgpu_dm_trace.h"
 #include "dpcd_defs.h"
 #include "link/protocols/link_dpcd.h"
@@ -2605,7 +2606,7 @@ static enum dc_status amdgpu_dm_commit_zero_streams(struct dc *dc)
 
 	memset(del_streams, 0, sizeof(del_streams));
 
-	context = dc_create_state(dc);
+	context = dc_state_create(dc);
 	if (context == NULL)
 		goto context_alloc_fail;
 
@@ -2620,12 +2621,12 @@ static enum dc_status amdgpu_dm_commit_zero_streams(struct dc *dc)
 
 	/* Remove all planes for removed streams and then remove the streams */
 	for (i = 0; i < del_streams_count; i++) {
-		if (!dc_rem_all_planes_for_stream(dc, del_streams[i], context)) {
+		if (!dc_state_rem_all_planes_for_stream(dc, del_streams[i], context)) {
 			res = DC_FAIL_DETACH_SURFACES;
 			goto fail;
 		}
 
-		res = dc_remove_stream_from_ctx(dc, context, del_streams[i]);
+		res = dc_state_remove_stream(dc, context, del_streams[i]);
 		if (res != DC_OK)
 			goto fail;
 	}
@@ -2633,7 +2634,7 @@ static enum dc_status amdgpu_dm_commit_zero_streams(struct dc *dc)
 	res = dc_commit_streams(dc, context->streams, context->stream_count);
 
 fail:
-	dc_release_state(context);
+	dc_state_release(context);
 
 context_alloc_fail:
 	return res;
@@ -2660,7 +2661,7 @@ static int dm_suspend(void *handle)
 
 		dc_allow_idle_optimizations(adev->dm.dc, false);
 
-		dm->cached_dc_state = dc_copy_state(dm->dc->current_state);
+		dm->cached_dc_state = dc_state_create_copy(dm->dc->current_state);
 
 		dm_gpureset_toggle_interrupts(adev, dm->cached_dc_state, false);
 
@@ -2907,7 +2908,7 @@ static int dm_resume(void *handle)
 
 		dm_gpureset_toggle_interrupts(adev, dm->cached_dc_state, true);
 
-		dc_release_state(dm->cached_dc_state);
+		dc_state_release(dm->cached_dc_state);
 		dm->cached_dc_state = NULL;
 
 		amdgpu_dm_irq_resume_late(adev);
@@ -2917,8 +2918,8 @@ static int dm_resume(void *handle)
 		return 0;
 	}
 	/* Recreate dc_state - DC invalidates it when setting power state to S3. */
-	dc_release_state(dm_state->context);
-	dm_state->context = dc_create_state(dm->dc);
+	dc_state_release(dm_state->context);
+	dm_state->context = dc_state_create(dm->dc);
 	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
 	dc_resource_state_construct(dm->dc, dm_state->context);
 
@@ -3996,7 +3997,7 @@ dm_atomic_duplicate_state(struct drm_private_obj *obj)
 	old_state = to_dm_atomic_state(obj->state);
 
 	if (old_state && old_state->context)
-		new_state->context = dc_copy_state(old_state->context);
+		new_state->context = dc_state_create_copy(old_state->context);
 
 	if (!new_state->context) {
 		kfree(new_state);
@@ -4012,7 +4013,7 @@ static void dm_atomic_destroy_state(struct drm_private_obj *obj,
 	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
 
 	if (dm_state && dm_state->context)
-		dc_release_state(dm_state->context);
+		dc_state_release(dm_state->context);
 
 	kfree(dm_state);
 }
@@ -4048,7 +4049,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 	if (!state)
 		return -ENOMEM;
 
-	state->context = dc_create_state(adev->dm.dc);
+	state->context = dc_state_create(adev->dm.dc);
 	if (!state->context) {
 		kfree(state);
 		return -ENOMEM;
@@ -4063,7 +4064,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r) {
-		dc_release_state(state->context);
+		dc_state_release(state->context);
 		kfree(state);
 		return r;
 	}
@@ -4075,7 +4076,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 
 	r = amdgpu_dm_audio_init(adev);
 	if (r) {
-		dc_release_state(state->context);
+		dc_state_release(state->context);
 		kfree(state);
 		return r;
 	}
@@ -6633,7 +6634,7 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 	if (!dc_plane_state)
 		goto cleanup;
 
-	dc_state = dc_create_state(dc);
+	dc_state = dc_state_create(dc);
 	if (!dc_state)
 		goto cleanup;
 
@@ -6660,9 +6661,9 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 		dc_result = dc_validate_plane(dc, dc_plane_state);
 
 	if (dc_result == DC_OK)
-		dc_result = dc_add_stream_to_ctx(dc, dc_state, stream);
+		dc_result = dc_state_add_stream(dc, dc_state, stream);
 
-	if (dc_result == DC_OK && !dc_add_plane_to_context(
+	if (dc_result == DC_OK && !dc_state_add_plane(
 						dc,
 						stream,
 						dc_plane_state,
@@ -6674,7 +6675,7 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
 
 cleanup:
 	if (dc_state)
-		dc_release_state(dc_state);
+		dc_state_release(dc_state);
 
 	if (dc_plane_state)
 		dc_plane_state_release(dc_plane_state);
@@ -8825,7 +8826,7 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 					dc_stream_get_status(dm_new_crtc_state->stream);
 
 			if (!status)
-				status = dc_stream_get_status_from_state(dc_state,
+				status = dc_state_get_stream_status(dc_state,
 									 dm_new_crtc_state->stream);
 			if (!status)
 				drm_err(dev,
@@ -9750,7 +9751,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 				crtc->base.id);
 
 		/* i.e. reset mode */
-		if (dc_remove_stream_from_ctx(
+		if (dc_state_remove_stream(
 				dm->dc,
 				dm_state->context,
 				dm_old_crtc_state->stream) != DC_OK) {
@@ -9793,7 +9794,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 			DRM_DEBUG_ATOMIC("Enabling DRM crtc: %d\n",
 					 crtc->base.id);
 
-			if (dc_add_stream_to_ctx(
+			if (dc_state_add_stream(
 					dm->dc,
 					dm_state->context,
 					dm_new_crtc_state->stream) != DC_OK) {
@@ -10098,7 +10099,7 @@ static int dm_update_plane_state(struct dc *dc,
 		if (ret)
 			return ret;
 
-		if (!dc_remove_plane_from_context(
+		if (!dc_state_remove_plane(
 				dc,
 				dm_old_crtc_state->stream,
 				dm_old_plane_state->dc_state,
@@ -10176,7 +10177,7 @@ static int dm_update_plane_state(struct dc *dc,
 		 * state. It'll be released when the atomic state is
 		 * cleaned.
 		 */
-		if (!dc_add_plane_to_context(
+		if (!dc_state_add_plane(
 				dc,
 				dm_new_crtc_state->stream,
 				dc_new_plane_state,
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 390e7a99be54..bae4fdddbf97 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -62,7 +62,7 @@ AMD_DC = $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/dc/,$(DC_LI
 include $(AMD_DC)
 
 DISPLAY_CORE = dc.o dc_stat.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
-dc_surface.o dc_debug.o dc_stream.o dc_link_enc_cfg.o dc_link_exports.o
+dc_surface.o dc_debug.o dc_stream.o dc_link_enc_cfg.o dc_link_exports.o dc_state.o
 
 DISPLAY_CORE += dc_vm_helper.o
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 7dacb0f82d29..28a2a837d2f0 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -29,6 +29,7 @@
 #include "dc_types.h"
 #include "dccg.h"
 #include "clk_mgr_internal.h"
+#include "dc_state_priv.h"
 #include "link.h"
 
 #include "dce100/dce_clk_mgr.h"
@@ -63,7 +64,7 @@ int clk_mgr_helper_get_active_display_cnt(
 		/* Don't count SubVP phantom pipes as part of active
 		 * display count
 		 */
-		if (stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (dc_state_get_stream_subvp_type(context, stream) == SUBVP_PHANTOM)
 			continue;
 
 		/*
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f2fc7df68b58..f5250022b98e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -34,6 +34,8 @@
 #include "dce/dce_hwseq.h"
 
 #include "resource.h"
+#include "dc_state.h"
+#include "dc_state_priv.h"
 
 #include "gpio_service_interface.h"
 #include "clk_mgr.h"
@@ -811,7 +813,7 @@ static void dc_destruct(struct dc *dc)
 		link_enc_cfg_init(dc, dc->current_state);
 
 	if (dc->current_state) {
-		dc_release_state(dc->current_state);
+		dc_state_release(dc->current_state);
 		dc->current_state = NULL;
 	}
 
@@ -1028,7 +1030,7 @@ static bool dc_construct(struct dc *dc,
 	 * on creation it copies the contents of dc->dml
 	 */
 
-	dc->current_state = dc_create_state(dc);
+	dc->current_state = dc_state_create(dc);
 
 	if (!dc->current_state) {
 		dm_error("%s: failed to create validate ctx\n", __func__);
@@ -1118,7 +1120,7 @@ static void dc_update_viusal_confirm_color(struct dc *dc, struct dc_state *conte
 static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 {
 	int i, j;
-	struct dc_state *dangling_context = dc_create_state(dc);
+	struct dc_state *dangling_context = dc_state_create(dc);
 	struct dc_state *current_ctx;
 	struct pipe_ctx *pipe;
 	struct timing_generator *tg;
@@ -1164,6 +1166,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 		}
 
 		if (should_disable && old_stream) {
+			bool is_phantom = dc_state_get_stream_subvp_type(dc->current_state, old_stream) == SUBVP_PHANTOM;
 			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 			tg = pipe->stream_res.tg;
 			/* When disabling plane for a phantom pipe, we must turn on the
@@ -1172,18 +1175,19 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 			 * state that can result in underflow or hang when enabling it
 			 * again for different use.
 			 */
-			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			if (is_phantom) {
 				if (tg->funcs->enable_crtc) {
 					int main_pipe_width, main_pipe_height;
+					struct dc_stream_state *old_paired_stream = dc_state_get_paired_subvp_stream(dc->current_state, old_stream);
 
-					main_pipe_width = old_stream->mall_stream_config.paired_stream->dst.width;
-					main_pipe_height = old_stream->mall_stream_config.paired_stream->dst.height;
+					main_pipe_width = old_paired_stream->dst.width;
+					main_pipe_height = old_paired_stream->dst.height;
 					if (dc->hwss.blank_phantom)
 						dc->hwss.blank_phantom(dc, tg, main_pipe_width, main_pipe_height);
 					tg->funcs->enable_crtc(tg);
 				}
 			}
-			dc_rem_all_planes_for_stream(dc, old_stream, dangling_context);
+			dc_state_rem_all_planes_for_stream(dc, old_stream, dangling_context);
 			disable_all_writeback_pipes_for_stream(dc, old_stream, dangling_context);
 
 			if (pipe->stream && pipe->plane_state)
@@ -1206,7 +1210,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 			 * The OTG is set to disable on falling edge of VUPDATE so the plane disable
 			 * will still get it's double buffer update.
 			 */
-			if (old_stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			if (is_phantom) {
 				if (tg->funcs->disable_phantom_crtc)
 					tg->funcs->disable_phantom_crtc(tg);
 			}
@@ -1215,7 +1219,7 @@ static void disable_dangling_plane(struct dc *dc, struct dc_state *context)
 
 	current_ctx = dc->current_state;
 	dc->current_state = dangling_context;
-	dc_release_state(current_ctx);
+	dc_state_release(current_ctx);
 }
 
 static void disable_vbios_mode_if_required(
@@ -1287,7 +1291,7 @@ static void wait_for_no_pipes_pending(struct dc *dc, struct dc_state *context)
 		int count = 0;
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (!pipe->plane_state || pipe->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (!pipe->plane_state || dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM)
 			continue;
 
 		/* Timeout 100 ms */
@@ -1513,7 +1517,7 @@ static void program_timing_sync(
 		}
 
 		for (k = 0; k < group_size; k++) {
-			struct dc_stream_status *status = dc_stream_get_status_from_state(ctx, pipe_set[k]->stream);
+			struct dc_stream_status *status = dc_state_get_stream_status(ctx, pipe_set[k]->stream);
 
 			status->timing_sync_info.group_id = num_group;
 			status->timing_sync_info.group_size = group_size;
@@ -1840,7 +1844,7 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
 		/* Check old context for SubVP */
-		subvp_prev_use |= (old_pipe->stream && old_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM);
+		subvp_prev_use |= (dc_state_get_pipe_subvp_type(dc->current_state, old_pipe) == SUBVP_PHANTOM);
 		if (subvp_prev_use)
 			break;
 	}
@@ -1998,9 +2002,9 @@ static enum dc_status dc_commit_state_no_check(struct dc *dc, struct dc_state *c
 	old_state = dc->current_state;
 	dc->current_state = context;
 
-	dc_release_state(old_state);
+	dc_state_release(old_state);
 
-	dc_retain_state(dc->current_state);
+	dc_state_retain(dc->current_state);
 
 	return result;
 }
@@ -2071,7 +2075,7 @@ enum dc_status dc_commit_streams(struct dc *dc,
 	if (handle_exit_odm2to1)
 		res = commit_minimal_transition_state(dc, dc->current_state);
 
-	context = dc_create_state(dc);
+	context = dc_state_create(dc);
 	if (!context)
 		goto context_alloc_fail;
 
@@ -2091,7 +2095,7 @@ enum dc_status dc_commit_streams(struct dc *dc,
 				streams[i]->out.otg_offset = context->stream_status[j].primary_otg_inst;
 
 			if (dc_is_embedded_signal(streams[i]->signal)) {
-				struct dc_stream_status *status = dc_stream_get_status_from_state(context, streams[i]);
+				struct dc_stream_status *status = dc_state_get_stream_status(context, streams[i]);
 
 				if (dc->hwss.is_abm_supported)
 					status->is_abm_supported = dc->hwss.is_abm_supported(dc, context, streams[i]);
@@ -2102,7 +2106,7 @@ enum dc_status dc_commit_streams(struct dc *dc,
 	}
 
 fail:
-	dc_release_state(context);
+	dc_state_release(context);
 
 context_alloc_fail:
 
@@ -2156,7 +2160,7 @@ static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
 		pipe = &context->res_ctx.pipe_ctx[i];
 
 		// Don't check flip pending on phantom pipes
-		if (!pipe->plane_state || (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM))
+		if (!pipe->plane_state || (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM))
 			continue;
 
 		/* Must set to false to start with, due to OR in update function */
@@ -2228,103 +2232,6 @@ void dc_post_update_surfaces_to_stream(struct dc *dc)
 	dc->optimized_required = false;
 }
 
-static void init_state(struct dc *dc, struct dc_state *context)
-{
-	/* Each context must have their own instance of VBA and in order to
-	 * initialize and obtain IP and SOC the base DML instance from DC is
-	 * initially copied into every context
-	 */
-	memcpy(&context->bw_ctx.dml, &dc->dml, sizeof(struct display_mode_lib));
-}
-
-struct dc_state *dc_create_state(struct dc *dc)
-{
-	struct dc_state *context = kvzalloc(sizeof(struct dc_state),
-					    GFP_KERNEL);
-
-	if (!context)
-		return NULL;
-
-	init_state(dc, context);
-
-#ifdef CONFIG_DRM_AMD_DC_FP
-	if (dc->debug.using_dml2) {
-		dml2_create(dc, &dc->dml2_options, &context->bw_ctx.dml2);
-	}
-#endif
-	kref_init(&context->refcount);
-
-	return context;
-}
-
-struct dc_state *dc_copy_state(struct dc_state *src_ctx)
-{
-	int i, j;
-	struct dc_state *new_ctx = kvmalloc(sizeof(struct dc_state), GFP_KERNEL);
-
-	if (!new_ctx)
-		return NULL;
-	memcpy(new_ctx, src_ctx, sizeof(struct dc_state));
-
-#ifdef CONFIG_DRM_AMD_DC_FP
-	if (new_ctx->bw_ctx.dml2 && !dml2_create_copy(&new_ctx->bw_ctx.dml2, src_ctx->bw_ctx.dml2)) {
-		dc_release_state(new_ctx);
-		return NULL;
- 	}
-#endif
-
-	for (i = 0; i < MAX_PIPES; i++) {
-			struct pipe_ctx *cur_pipe = &new_ctx->res_ctx.pipe_ctx[i];
-
-			if (cur_pipe->top_pipe)
-				cur_pipe->top_pipe =  &new_ctx->res_ctx.pipe_ctx[cur_pipe->top_pipe->pipe_idx];
-
-			if (cur_pipe->bottom_pipe)
-				cur_pipe->bottom_pipe = &new_ctx->res_ctx.pipe_ctx[cur_pipe->bottom_pipe->pipe_idx];
-
-			if (cur_pipe->prev_odm_pipe)
-				cur_pipe->prev_odm_pipe =  &new_ctx->res_ctx.pipe_ctx[cur_pipe->prev_odm_pipe->pipe_idx];
-
-			if (cur_pipe->next_odm_pipe)
-				cur_pipe->next_odm_pipe = &new_ctx->res_ctx.pipe_ctx[cur_pipe->next_odm_pipe->pipe_idx];
-
-	}
-
-	for (i = 0; i < new_ctx->stream_count; i++) {
-			dc_stream_retain(new_ctx->streams[i]);
-			for (j = 0; j < new_ctx->stream_status[i].plane_count; j++)
-				dc_plane_state_retain(
-					new_ctx->stream_status[i].plane_states[j]);
-	}
-
-	kref_init(&new_ctx->refcount);
-
-	return new_ctx;
-}
-
-void dc_retain_state(struct dc_state *context)
-{
-	kref_get(&context->refcount);
-}
-
-static void dc_state_free(struct kref *kref)
-{
-	struct dc_state *context = container_of(kref, struct dc_state, refcount);
-	dc_resource_state_destruct(context);
-
-#ifdef CONFIG_DRM_AMD_DC_FP
-	dml2_destroy(context->bw_ctx.dml2);
-	context->bw_ctx.dml2 = 0;
-#endif
-
-	kvfree(context);
-}
-
-void dc_release_state(struct dc_state *context)
-{
-	kref_put(&context->refcount, dc_state_free);
-}
-
 bool dc_set_generic_gpio_for_stereo(bool enable,
 		struct gpio_service *gpio_service)
 {
@@ -2992,7 +2899,7 @@ static void copy_stream_update_to_stream(struct dc *dc,
 				       update->dsc_config->num_slices_v != 0);
 
 		/* Use temporarry context for validating new DSC config */
-		struct dc_state *dsc_validate_context = dc_create_state(dc);
+		struct dc_state *dsc_validate_context = dc_state_create(dc);
 
 		if (dsc_validate_context) {
 			dc_resource_state_copy_construct(dc->current_state, dsc_validate_context);
@@ -3005,7 +2912,7 @@ static void copy_stream_update_to_stream(struct dc *dc,
 				update->dsc_config = NULL;
 			}
 
-			dc_release_state(dsc_validate_context);
+			dc_state_release(dsc_validate_context);
 		} else {
 			DC_ERROR("Failed to allocate new validate context for DSC change\n");
 			update->dsc_config = NULL;
@@ -3104,7 +3011,7 @@ static bool update_planes_and_stream_state(struct dc *dc,
 			new_planes[i] = srf_updates[i].surface;
 
 		/* initialize scratch memory for building context */
-		context = dc_create_state(dc);
+		context = dc_state_create(dc);
 		if (context == NULL) {
 			DC_ERROR("Failed to allocate new validate context!\n");
 			return false;
@@ -3120,14 +3027,14 @@ static bool update_planes_and_stream_state(struct dc *dc,
 			dc->res_pool->funcs->remove_phantom_pipes(dc, context, false);
 
 		/*remove old surfaces from context */
-		if (!dc_rem_all_planes_for_stream(dc, stream, context)) {
+		if (!dc_state_rem_all_planes_for_stream(dc, stream, context)) {
 
 			BREAK_TO_DEBUGGER();
 			goto fail;
 		}
 
 		/* add surface to context */
-		if (!dc_add_all_planes_for_stream(dc, stream, new_planes, surface_count, context)) {
+		if (!dc_state_add_all_planes_for_stream(dc, stream, new_planes, surface_count, context)) {
 
 			BREAK_TO_DEBUGGER();
 			goto fail;
@@ -3185,7 +3092,7 @@ static bool update_planes_and_stream_state(struct dc *dc,
 	return true;
 
 fail:
-	dc_release_state(context);
+	dc_state_release(context);
 
 	return false;
 
@@ -3626,7 +3533,7 @@ static void commit_planes_for_stream(struct dc *dc,
 		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
 		// Check old context for SubVP
-		subvp_prev_use |= (old_pipe->stream && old_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM);
+		subvp_prev_use |= (dc_state_get_pipe_subvp_type(dc->current_state, old_pipe) == SUBVP_PHANTOM);
 		if (subvp_prev_use)
 			break;
 	}
@@ -3634,7 +3541,7 @@ static void commit_planes_for_stream(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			subvp_curr_use = true;
 			break;
 		}
@@ -4019,7 +3926,7 @@ static bool could_mpcc_tree_change_for_active_pipes(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
+		if (dc_state_get_pipe_subvp_type(dc->current_state, pipe) != SUBVP_NONE) {
 			subvp_active = true;
 			break;
 		}
@@ -4056,7 +3963,7 @@ struct pipe_split_policy_backup {
 static void release_minimal_transition_state(struct dc *dc,
 		struct dc_state *context, struct pipe_split_policy_backup *policy)
 {
-	dc_release_state(context);
+	dc_state_release(context);
 	/* restore previous pipe split and odm policy */
 	if (!dc->config.is_vmin_only_asic)
 		dc->debug.pipe_split_policy = policy->mpc_policy;
@@ -4067,7 +3974,7 @@ static void release_minimal_transition_state(struct dc *dc,
 static struct dc_state *create_minimal_transition_state(struct dc *dc,
 		struct dc_state *base_context, struct pipe_split_policy_backup *policy)
 {
-	struct dc_state *minimal_transition_context = dc_create_state(dc);
+	struct dc_state *minimal_transition_context = dc_state_create(dc);
 	unsigned int i, j;
 
 	if (!dc->config.is_vmin_only_asic) {
@@ -4211,7 +4118,7 @@ static bool commit_minimal_transition_state(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (pipe->stream && dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_PHANTOM) {
 			subvp_in_use = true;
 			break;
 		}
@@ -4523,7 +4430,7 @@ bool dc_update_planes_and_stream(struct dc *dc,
 		if (dc->res_pool->funcs->save_mall_state)
 			dc->res_pool->funcs->save_mall_state(dc, context, &mall_temp_config);
 		if (!commit_minimal_transition_state(dc, context)) {
-			dc_release_state(context);
+			dc_state_release(context);
 			return false;
 		}
 		if (dc->res_pool->funcs->restore_mall_state)
@@ -4593,7 +4500,7 @@ bool dc_update_planes_and_stream(struct dc *dc,
 		struct dc_state *old = dc->current_state;
 
 		dc->current_state = context;
-		dc_release_state(old);
+		dc_state_release(old);
 
 		// clear any forced full updates
 		for (i = 0; i < dc->res_pool->pipe_count; i++) {
@@ -4652,7 +4559,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
 	if (update_type >= UPDATE_TYPE_FULL) {
 
 		/* initialize scratch memory for building context */
-		context = dc_create_state(dc);
+		context = dc_state_create(dc);
 		if (context == NULL) {
 			DC_ERROR("Failed to allocate new validate context!\n");
 			return;
@@ -4698,7 +4605,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
 	if (update_type >= UPDATE_TYPE_FULL) {
 		if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false)) {
 			DC_ERROR("Mode validation failed for stream update!\n");
-			dc_release_state(context);
+			dc_state_release(context);
 			return;
 		}
 	}
@@ -4731,7 +4638,7 @@ void dc_commit_updates_for_stream(struct dc *dc,
 		struct dc_state *old = dc->current_state;
 
 		dc->current_state = context;
-		dc_release_state(old);
+		dc_state_release(old);
 
 		for (i = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
index fc18b9dc946f..170bad6f33c7 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
@@ -31,6 +31,7 @@
 #include "basics/dc_common.h"
 #include "resource.h"
 #include "dc_dmub_srv.h"
+#include "dc_state_priv.h"
 
 #define NUM_ELEMENTS(a) (sizeof(a) / sizeof((a)[0]))
 
@@ -440,8 +441,7 @@ void get_subvp_visual_confirm_color(
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.paired_stream &&
-		    pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+		if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN) {
 			/* SubVP enable - red */
 			color->color_g_y = 0;
 			color->color_b_cb = 0;
@@ -454,7 +454,7 @@ void get_subvp_visual_confirm_color(
 		}
 	}
 
-	if (enable_subvp && pipe_ctx->stream->mall_stream_config.type == SUBVP_NONE) {
+	if (enable_subvp && dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_NONE) {
 		color->color_r_cr = 0;
 		if (pipe_ctx->stream->allow_freesync == 1) {
 			/* SubVP enable and DRR on - green */
@@ -529,7 +529,7 @@ void hwss_build_fast_sequence(struct dc *dc,
 			}
 			if (dc->hwss.update_plane_addr && current_mpc_pipe->plane_state->update_flags.bits.addr_update) {
 				if (resource_is_pipe_type(current_mpc_pipe, OTG_MASTER) &&
-						current_mpc_pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+						dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_MAIN) {
 					block_sequence[*num_steps].params.subvp_save_surf_addr.dc_dmub_srv = dc->ctx->dmub_srv;
 					block_sequence[*num_steps].params.subvp_save_surf_addr.addr = &current_mpc_pipe->plane_state->address;
 					block_sequence[*num_steps].params.subvp_save_surf_addr.subvp_index = current_mpc_pipe->subvp_index;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4382d9ae4292..4a6a7d7557e0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -2993,189 +2993,6 @@ bool resource_update_pipes_for_plane_with_slice_count(
 	return result;
 }
 
-bool dc_add_plane_to_context(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state *plane_state,
-		struct dc_state *context)
-{
-	struct resource_pool *pool = dc->res_pool;
-	struct pipe_ctx *otg_master_pipe;
-	struct dc_stream_status *stream_status = NULL;
-	bool added = false;
-
-	stream_status = dc_stream_get_status_from_state(context, stream);
-	if (stream_status == NULL) {
-		dm_error("Existing stream not found; failed to attach surface!\n");
-		goto out;
-	} else if (stream_status->plane_count == MAX_SURFACE_NUM) {
-		dm_error("Surface: can not attach plane_state %p! Maximum is: %d\n",
-				plane_state, MAX_SURFACE_NUM);
-		goto out;
-	}
-
-	otg_master_pipe = resource_get_otg_master_for_stream(
-			&context->res_ctx, stream);
-	added = resource_append_dpp_pipes_for_plane_composition(context,
-			dc->current_state, pool, otg_master_pipe, plane_state);
-
-	if (added) {
-		stream_status->plane_states[stream_status->plane_count] =
-				plane_state;
-		stream_status->plane_count++;
-		dc_plane_state_retain(plane_state);
-	}
-
-out:
-	return added;
-}
-
-bool dc_remove_plane_from_context(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state *plane_state,
-		struct dc_state *context)
-{
-	int i;
-	struct dc_stream_status *stream_status = NULL;
-	struct resource_pool *pool = dc->res_pool;
-
-	if (!plane_state)
-		return true;
-
-	for (i = 0; i < context->stream_count; i++)
-		if (context->streams[i] == stream) {
-			stream_status = &context->stream_status[i];
-			break;
-		}
-
-	if (stream_status == NULL) {
-		dm_error("Existing stream not found; failed to remove plane.\n");
-		return false;
-	}
-
-	resource_remove_dpp_pipes_for_plane_composition(
-			context, pool, plane_state);
-
-	for (i = 0; i < stream_status->plane_count; i++) {
-		if (stream_status->plane_states[i] == plane_state) {
-			dc_plane_state_release(stream_status->plane_states[i]);
-			break;
-		}
-	}
-
-	if (i == stream_status->plane_count) {
-		dm_error("Existing plane_state not found; failed to detach it!\n");
-		return false;
-	}
-
-	stream_status->plane_count--;
-
-	/* Start at the plane we've just released, and move all the planes one index forward to "trim" the array */
-	for (; i < stream_status->plane_count; i++)
-		stream_status->plane_states[i] = stream_status->plane_states[i + 1];
-
-	stream_status->plane_states[stream_status->plane_count] = NULL;
-
-	if (stream_status->plane_count == 0 && dc->config.enable_windowed_mpo_odm)
-		/* ODM combine could prevent us from supporting more planes
-		 * we will reset ODM slice count back to 1 when all planes have
-		 * been removed to maximize the amount of planes supported when
-		 * new planes are added.
-		 */
-		resource_update_pipes_for_stream_with_slice_count(
-				context, dc->current_state, dc->res_pool, stream, 1);
-
-	return true;
-}
-
-/**
- * dc_rem_all_planes_for_stream - Remove planes attached to the target stream.
- *
- * @dc: Current dc state.
- * @stream: Target stream, which we want to remove the attached plans.
- * @context: New context.
- *
- * Return:
- * Return true if DC was able to remove all planes from the target
- * stream, otherwise, return false.
- */
-bool dc_rem_all_planes_for_stream(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_state *context)
-{
-	int i, old_plane_count;
-	struct dc_stream_status *stream_status = NULL;
-	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
-
-	for (i = 0; i < context->stream_count; i++)
-			if (context->streams[i] == stream) {
-				stream_status = &context->stream_status[i];
-				break;
-			}
-
-	if (stream_status == NULL) {
-		dm_error("Existing stream %p not found!\n", stream);
-		return false;
-	}
-
-	old_plane_count = stream_status->plane_count;
-
-	for (i = 0; i < old_plane_count; i++)
-		del_planes[i] = stream_status->plane_states[i];
-
-	for (i = 0; i < old_plane_count; i++)
-		if (!dc_remove_plane_from_context(dc, stream, del_planes[i], context))
-			return false;
-
-	return true;
-}
-
-static bool add_all_planes_for_stream(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		const struct dc_validation_set set[],
-		int set_count,
-		struct dc_state *context)
-{
-	int i, j;
-
-	for (i = 0; i < set_count; i++)
-		if (set[i].stream == stream)
-			break;
-
-	if (i == set_count) {
-		dm_error("Stream %p not found in set!\n", stream);
-		return false;
-	}
-
-	for (j = 0; j < set[i].plane_count; j++)
-		if (!dc_add_plane_to_context(dc, stream, set[i].plane_states[j], context))
-			return false;
-
-	return true;
-}
-
-bool dc_add_all_planes_for_stream(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state * const *plane_states,
-		int plane_count,
-		struct dc_state *context)
-{
-	struct dc_validation_set set;
-	int i;
-
-	set.stream = stream;
-	set.plane_count = plane_count;
-
-	for (i = 0; i < plane_count; i++)
-		set.plane_states[i] = plane_states[i];
-
-	return add_all_planes_for_stream(dc, stream, &set, 1, context);
-}
-
 bool dc_is_timing_changed(struct dc_stream_state *cur_stream,
 		       struct dc_stream_state *new_stream)
 {
@@ -3327,84 +3144,6 @@ static struct audio *find_first_free_audio(
 	return NULL;
 }
 
-/*
- * dc_add_stream_to_ctx() - Add a new dc_stream_state to a dc_state.
- */
-enum dc_status dc_add_stream_to_ctx(
-		struct dc *dc,
-		struct dc_state *new_ctx,
-		struct dc_stream_state *stream)
-{
-	enum dc_status res;
-	DC_LOGGER_INIT(dc->ctx->logger);
-
-	if (new_ctx->stream_count >= dc->res_pool->timing_generator_count) {
-		DC_LOG_WARNING("Max streams reached, can't add stream %p !\n", stream);
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	new_ctx->streams[new_ctx->stream_count] = stream;
-	dc_stream_retain(stream);
-	new_ctx->stream_count++;
-
-	res = resource_add_otg_master_for_stream_output(
-			new_ctx, dc->res_pool, stream);
-	if (res != DC_OK)
-		DC_LOG_WARNING("Adding stream %p to context failed with err %d!\n", stream, res);
-
-	return res;
-}
-
-/*
- * dc_remove_stream_from_ctx() - Remove a stream from a dc_state.
- */
-enum dc_status dc_remove_stream_from_ctx(
-			struct dc *dc,
-			struct dc_state *new_ctx,
-			struct dc_stream_state *stream)
-{
-	int i;
-	struct dc_context *dc_ctx = dc->ctx;
-	struct pipe_ctx *del_pipe = resource_get_otg_master_for_stream(
-			&new_ctx->res_ctx, stream);
-
-	if (!del_pipe) {
-		DC_ERROR("Pipe not found for stream %p !\n", stream);
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	resource_update_pipes_for_stream_with_slice_count(new_ctx,
-			dc->current_state, dc->res_pool, stream, 1);
-	resource_remove_otg_master_for_stream_output(
-			new_ctx, dc->res_pool, stream);
-
-	for (i = 0; i < new_ctx->stream_count; i++)
-		if (new_ctx->streams[i] == stream)
-			break;
-
-	if (new_ctx->streams[i] != stream) {
-		DC_ERROR("Context doesn't have stream %p !\n", stream);
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	dc_stream_release(new_ctx->streams[i]);
-	new_ctx->stream_count--;
-
-	/* Trim back arrays */
-	for (; i < new_ctx->stream_count; i++) {
-		new_ctx->streams[i] = new_ctx->streams[i + 1];
-		new_ctx->stream_status[i] = new_ctx->stream_status[i + 1];
-	}
-
-	new_ctx->streams[new_ctx->stream_count] = NULL;
-	memset(
-			&new_ctx->stream_status[new_ctx->stream_count],
-			0,
-			sizeof(new_ctx->stream_status[0]));
-
-	return DC_OK;
-}
-
 static struct dc_stream_state *find_pll_sharable_stream(
 		struct dc_stream_state *stream_needs_pll,
 		struct dc_state *context)
@@ -3855,6 +3594,31 @@ static bool planes_changed_for_existing_stream(struct dc_state *context,
 	return false;
 }
 
+static bool add_all_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		const struct dc_validation_set set[],
+		int set_count,
+		struct dc_state *state)
+{
+	int i, j;
+
+	for (i = 0; i < set_count; i++)
+		if (set[i].stream == stream)
+			break;
+
+	if (i == set_count) {
+		dm_error("Stream %p not found in set!\n", stream);
+		return false;
+	}
+
+	for (j = 0; j < set[i].plane_count; j++)
+		if (!dc_state_add_plane(dc, stream, set[i].plane_states[j], state))
+			return false;
+
+	return true;
+}
+
 /**
  * dc_validate_with_context - Validate and update the potential new stream in the context object
  *
@@ -3960,7 +3724,7 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 						       unchanged_streams[i],
 						       set,
 						       set_count)) {
-			if (!dc_rem_all_planes_for_stream(dc,
+			if (!dc_state_rem_all_planes_for_stream(dc,
 							  unchanged_streams[i],
 							  context)) {
 				res = DC_FAIL_DETACH_SURFACES;
@@ -3982,12 +3746,12 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 			}
 		}
 
-		if (!dc_rem_all_planes_for_stream(dc, del_streams[i], context)) {
+		if (!dc_state_rem_all_planes_for_stream(dc, del_streams[i], context)) {
 			res = DC_FAIL_DETACH_SURFACES;
 			goto fail;
 		}
 
-		res = dc_remove_stream_from_ctx(dc, context, del_streams[i]);
+		res = dc_state_remove_stream(dc, context, del_streams[i]);
 		if (res != DC_OK)
 			goto fail;
 	}
@@ -4010,7 +3774,7 @@ enum dc_status dc_validate_with_context(struct dc *dc,
 	/* Add new streams and then add all planes for the new stream */
 	for (i = 0; i < add_streams_count; i++) {
 		calculate_phy_pix_clks(add_streams[i]);
-		res = dc_add_stream_to_ctx(dc, context, add_streams[i]);
+		res = dc_state_add_stream(dc, context, add_streams[i]);
 		if (res != DC_OK)
 			goto fail;
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
new file mode 100644
index 000000000000..ec5b0d114c7c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -0,0 +1,527 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#include "core_types.h"
+#include "core_status.h"
+#include "dc_state.h"
+#include "dc_state_priv.h"
+#include "dc_stream_priv.h"
+#include "dc_plane_priv.h"
+
+#include "dm_services.h"
+#include "resource.h"
+
+#include "dml2/dml2_wrapper.h"
+#include "dml2/dml2_internal_types.h"
+
+#define DC_LOGGER \
+	dc->ctx->logger
+#define DC_LOGGER_INIT(logger)
+
+/* Public dc_state functions */
+static void init_state(struct dc *dc, struct dc_state *state)
+{
+	/* Each context must have their own instance of VBA and in order to
+	 * initialize and obtain IP and SOC the base DML instance from DC is
+	 * initially copied into every context
+	 */
+	memcpy(&state->bw_ctx.dml, &dc->dml, sizeof(struct display_mode_lib));
+}
+
+struct dc_state *dc_state_create(struct dc *dc)
+{
+	struct dc_state *state = kvzalloc(sizeof(struct dc_state),
+			GFP_KERNEL);
+
+	if (!state)
+		return NULL;
+
+	init_state(dc, state);
+
+#ifdef CONFIG_DRM_AMD_DC_FP
+	if (dc->debug.using_dml2)
+		dml2_create(dc, &dc->dml2_options, &state->bw_ctx.dml2);
+#endif
+
+	kref_init(&state->refcount);
+
+	return state;
+}
+
+struct dc_state *dc_state_create_copy(struct dc_state *src_state)
+{
+	int i, j;
+	struct dc_state *new_state = kvmalloc(sizeof(struct dc_state), GFP_KERNEL);
+
+	if (!new_state)
+		return NULL;
+
+	memcpy(new_state, src_state, sizeof(struct dc_state));
+
+#ifdef CONFIG_DRM_AMD_DC_FP
+	if (new_state->bw_ctx.dml2 && !dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
+		dc_state_release(new_state);
+		return NULL;
+	}
+#endif
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		struct pipe_ctx *cur_pipe = &new_state->res_ctx.pipe_ctx[i];
+
+		if (cur_pipe->top_pipe)
+			cur_pipe->top_pipe =  &new_state->res_ctx.pipe_ctx[cur_pipe->top_pipe->pipe_idx];
+
+		if (cur_pipe->bottom_pipe)
+			cur_pipe->bottom_pipe = &new_state->res_ctx.pipe_ctx[cur_pipe->bottom_pipe->pipe_idx];
+
+		if (cur_pipe->prev_odm_pipe)
+			cur_pipe->prev_odm_pipe =  &new_state->res_ctx.pipe_ctx[cur_pipe->prev_odm_pipe->pipe_idx];
+
+		if (cur_pipe->next_odm_pipe)
+			cur_pipe->next_odm_pipe = &new_state->res_ctx.pipe_ctx[cur_pipe->next_odm_pipe->pipe_idx];
+	}
+
+	for (i = 0; i < new_state->stream_count; i++) {
+		dc_stream_retain(new_state->streams[i]);
+		for (j = 0; j < new_state->stream_status[i].plane_count; j++)
+			dc_plane_state_retain(
+					new_state->stream_status[i].plane_states[j]);
+	}
+
+	kref_init(&new_state->refcount);
+
+	return new_state;
+}
+
+void dc_state_retain(struct dc_state *context)
+{
+	kref_get(&context->refcount);
+}
+
+static void dc_state_free(struct kref *kref)
+{
+	struct dc_state *state = container_of(kref, struct dc_state, refcount);
+
+	dc_resource_state_destruct(state);
+
+#ifdef CONFIG_DRM_AMD_DC_FP
+	dml2_destroy(state->bw_ctx.dml2);
+	state->bw_ctx.dml2 = 0;
+#endif
+
+	kvfree(state);
+}
+
+void dc_state_release(struct dc_state *state)
+{
+	kref_put(&state->refcount, dc_state_free);
+}
+/*
+ * dc_state_add_stream() - Add a new dc_stream_state to a dc_state.
+ */
+enum dc_status dc_state_add_stream(
+		struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *stream)
+{
+	enum dc_status res;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (state->stream_count >= dc->res_pool->timing_generator_count) {
+		DC_LOG_WARNING("Max streams reached, can't add stream %p !\n", stream);
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	state->streams[state->stream_count] = stream;
+	dc_stream_retain(stream);
+	state->stream_count++;
+
+	res = resource_add_otg_master_for_stream_output(
+			state, dc->res_pool, stream);
+	if (res != DC_OK)
+		DC_LOG_WARNING("Adding stream %p to context failed with err %d!\n", stream, res);
+
+	return res;
+}
+
+/*
+ * dc_state_remove_stream() - Remove a stream from a dc_state.
+ */
+enum dc_status dc_state_remove_stream(
+		struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *stream)
+{
+	int i;
+	struct pipe_ctx *del_pipe = resource_get_otg_master_for_stream(
+			&state->res_ctx, stream);
+
+	if (!del_pipe) {
+		dm_error("Pipe not found for stream %p !\n", stream);
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	resource_update_pipes_for_stream_with_slice_count(state,
+			dc->current_state, dc->res_pool, stream, 1);
+	resource_remove_otg_master_for_stream_output(
+			state, dc->res_pool, stream);
+
+	for (i = 0; i < state->stream_count; i++)
+		if (state->streams[i] == stream)
+			break;
+
+	if (state->streams[i] != stream) {
+		dm_error("Context doesn't have stream %p !\n", stream);
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	dc_stream_release(state->streams[i]);
+	state->stream_count--;
+
+	/* Trim back arrays */
+	for (; i < state->stream_count; i++) {
+		state->streams[i] = state->streams[i + 1];
+		state->stream_status[i] = state->stream_status[i + 1];
+	}
+
+	state->streams[state->stream_count] = NULL;
+	memset(
+			&state->stream_status[state->stream_count],
+			0,
+			sizeof(state->stream_status[0]));
+
+	return DC_OK;
+}
+
+bool dc_state_add_plane(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state *plane_state,
+		struct dc_state *state)
+{
+	struct resource_pool *pool = dc->res_pool;
+	struct pipe_ctx *otg_master_pipe;
+	struct dc_stream_status *stream_status = NULL;
+	bool added = false;
+
+	stream_status = dc_state_get_stream_status(state, stream);
+	if (stream_status == NULL) {
+		dm_error("Existing stream not found; failed to attach surface!\n");
+		goto out;
+	} else if (stream_status->plane_count == MAX_SURFACE_NUM) {
+		dm_error("Surface: can not attach plane_state %p! Maximum is: %d\n",
+				plane_state, MAX_SURFACE_NUM);
+		goto out;
+	}
+
+	otg_master_pipe = resource_get_otg_master_for_stream(
+			&state->res_ctx, stream);
+	added = resource_append_dpp_pipes_for_plane_composition(state,
+			dc->current_state, pool, otg_master_pipe, plane_state);
+
+	if (added) {
+		stream_status->plane_states[stream_status->plane_count] =
+				plane_state;
+		stream_status->plane_count++;
+		dc_plane_state_retain(plane_state);
+	}
+
+out:
+	return added;
+}
+
+bool dc_state_remove_plane(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state *plane_state,
+		struct dc_state *state)
+{
+	int i;
+	struct dc_stream_status *stream_status = NULL;
+	struct resource_pool *pool = dc->res_pool;
+
+	if (!plane_state)
+		return true;
+
+	for (i = 0; i < state->stream_count; i++)
+		if (state->streams[i] == stream) {
+			stream_status = &state->stream_status[i];
+			break;
+		}
+
+	if (stream_status == NULL) {
+		dm_error("Existing stream not found; failed to remove plane.\n");
+		return false;
+	}
+
+	resource_remove_dpp_pipes_for_plane_composition(
+			state, pool, plane_state);
+
+	for (i = 0; i < stream_status->plane_count; i++) {
+		if (stream_status->plane_states[i] == plane_state) {
+			dc_plane_state_release(stream_status->plane_states[i]);
+			break;
+		}
+	}
+
+	if (i == stream_status->plane_count) {
+		dm_error("Existing plane_state not found; failed to detach it!\n");
+		return false;
+	}
+
+	stream_status->plane_count--;
+
+	/* Start at the plane we've just released, and move all the planes one index forward to "trim" the array */
+	for (; i < stream_status->plane_count; i++)
+		stream_status->plane_states[i] = stream_status->plane_states[i + 1];
+
+	stream_status->plane_states[stream_status->plane_count] = NULL;
+
+	if (stream_status->plane_count == 0 && dc->config.enable_windowed_mpo_odm)
+		/* ODM combine could prevent us from supporting more planes
+		 * we will reset ODM slice count back to 1 when all planes have
+		 * been removed to maximize the amount of planes supported when
+		 * new planes are added.
+		 */
+		resource_update_pipes_for_stream_with_slice_count(
+				state, dc->current_state, dc->res_pool, stream, 1);
+
+	return true;
+}
+
+/**
+ * dc_state_rem_all_planes_for_stream - Remove planes attached to the target stream.
+ *
+ * @dc: Current dc state.
+ * @stream: Target stream, which we want to remove the attached plans.
+ * @context: New context.
+ *
+ * Return:
+ * Return true if DC was able to remove all planes from the target
+ * stream, otherwise, return false.
+ */
+bool dc_state_rem_all_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_state *state)
+{
+	int i, old_plane_count;
+	struct dc_stream_status *stream_status = NULL;
+	struct dc_plane_state *del_planes[MAX_SURFACE_NUM] = { 0 };
+
+	for (i = 0; i < state->stream_count; i++)
+		if (state->streams[i] == stream) {
+			stream_status = &state->stream_status[i];
+			break;
+		}
+
+	if (stream_status == NULL) {
+		dm_error("Existing stream %p not found!\n", stream);
+		return false;
+	}
+
+	old_plane_count = stream_status->plane_count;
+
+	for (i = 0; i < old_plane_count; i++)
+		del_planes[i] = stream_status->plane_states[i];
+
+	for (i = 0; i < old_plane_count; i++)
+		if (!dc_state_remove_plane(dc, stream, del_planes[i], state))
+			return false;
+
+	return true;
+}
+
+bool dc_state_add_all_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state * const *plane_states,
+		int plane_count,
+		struct dc_state *state)
+{
+	int i;
+	bool result = true;
+
+	for (i = 0; i < plane_count; i++)
+		if (!dc_state_add_plane(dc, stream, plane_states[i], state)) {
+			result = false;
+			break;
+		}
+
+	return result;
+}
+
+/* Private dc_state functions */
+
+/**
+ * dc_state_get_stream_status - Get stream status from given dc state
+ * @state: DC state to find the stream status in
+ * @stream: The stream to get the stream status for
+ *
+ * The given stream is expected to exist in the given dc state. Otherwise, NULL
+ * will be returned.
+ */
+struct dc_stream_status *dc_state_get_stream_status(
+		struct dc_state *state,
+		struct dc_stream_state *stream)
+{
+	uint8_t i;
+
+	if (state == NULL)
+		return NULL;
+
+	for (i = 0; i < state->stream_count; i++) {
+		if (stream == state->streams[i])
+			return &state->stream_status[i];
+	}
+
+	return NULL;
+}
+
+enum mall_stream_type dc_state_get_pipe_subvp_type(const struct dc_state *state,
+		const struct pipe_ctx *pipe_ctx)
+{
+	if (pipe_ctx->stream == NULL)
+		return SUBVP_NONE;
+
+	return pipe_ctx->stream->mall_stream_config.type;
+}
+
+enum mall_stream_type dc_state_get_stream_subvp_type(const struct dc_state *state,
+		const struct dc_stream_state *stream)
+{
+	return stream->mall_stream_config.type;
+}
+
+struct dc_stream_state *dc_state_get_paired_subvp_stream(const struct dc_state *state,
+		const struct dc_stream_state *stream)
+{
+	return stream->mall_stream_config.paired_stream;
+}
+
+struct dc_stream_state *dc_state_create_phantom_stream(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *main_stream)
+{
+	struct dc_stream_state *phantom_stream = dc_create_stream_for_sink(main_stream->sink);
+
+	if (phantom_stream != NULL) {
+		phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
+		phantom_stream->dpms_off = true;
+	}
+
+	return phantom_stream;
+}
+
+void dc_state_release_phantom_stream(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream)
+{
+	dc_stream_release(phantom_stream);
+}
+
+struct dc_plane_state *dc_state_create_phantom_plane(struct dc *dc,
+		struct dc_state *state,
+		struct dc_plane_state *main_plane)
+{
+	struct dc_plane_state *phantom_plane = dc_create_plane_state(dc);
+
+	if (phantom_plane != NULL)
+		phantom_plane->is_phantom = true;
+
+	return phantom_plane;
+}
+
+void dc_state_release_phantom_plane(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_plane_state *phantom_plane)
+{
+	dc_plane_state_release(phantom_plane);
+}
+
+/* add phantom streams to context and generate correct meta inside dc_state */
+enum dc_status dc_state_add_phantom_stream(struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream,
+		struct dc_stream_state *main_stream)
+{
+	enum dc_status res = dc_state_add_stream(dc, state, phantom_stream);
+
+	/* setup subvp meta */
+	phantom_stream->mall_stream_config.type = SUBVP_PHANTOM;
+	phantom_stream->mall_stream_config.paired_stream = main_stream;
+	main_stream->mall_stream_config.type = SUBVP_MAIN;
+	main_stream->mall_stream_config.paired_stream = phantom_stream;
+
+	return res;
+}
+
+enum dc_status dc_state_remove_phantom_stream(struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream)
+{
+	/* reset subvp meta */
+	phantom_stream->mall_stream_config.paired_stream->mall_stream_config.type = SUBVP_NONE;
+	phantom_stream->mall_stream_config.paired_stream->mall_stream_config.paired_stream = NULL;
+
+	/* remove stream from state */
+	return dc_state_remove_stream(dc, state, phantom_stream);
+}
+
+bool dc_state_add_phantom_plane(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state *phantom_plane,
+		struct dc_state *state)
+{
+	return dc_state_add_plane(dc, phantom_stream, phantom_plane, state);
+}
+
+bool dc_state_remove_phantom_plane(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state *phantom_plane,
+		struct dc_state *state)
+{
+	return dc_state_remove_plane(dc, phantom_stream, phantom_plane, state);
+}
+
+bool dc_state_rem_all_phantom_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_state *state)
+{
+	return dc_state_rem_all_planes_for_stream(dc, phantom_stream, state);
+}
+
+bool dc_state_add_all_phantom_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state * const *phantom_planes,
+		int plane_count,
+		struct dc_state *state)
+{
+	return dc_state_add_all_planes_for_stream(dc, phantom_stream, phantom_planes, plane_count, state);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 38cd29b210c0..86de4bf2ce13 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -31,6 +31,8 @@
 #include "ipp.h"
 #include "timing_generator.h"
 #include "dc_dmub_srv.h"
+#include "dc_state_priv.h"
+#include "dc_stream_priv.h"
 
 #define DC_LOGGER dc->ctx->logger
 
@@ -54,7 +56,7 @@ void update_stream_signal(struct dc_stream_state *stream, struct dc_sink *sink)
 	}
 }
 
-static bool dc_stream_construct(struct dc_stream_state *stream,
+bool dc_stream_construct(struct dc_stream_state *stream,
 	struct dc_sink *dc_sink_data)
 {
 	uint32_t i = 0;
@@ -127,7 +129,7 @@ static bool dc_stream_construct(struct dc_stream_state *stream,
 	return true;
 }
 
-static void dc_stream_destruct(struct dc_stream_state *stream)
+void dc_stream_destruct(struct dc_stream_state *stream)
 {
 	dc_sink_release(stream->sink);
 	if (stream->out_transfer_func != NULL) {
@@ -208,31 +210,6 @@ struct dc_stream_state *dc_copy_stream(const struct dc_stream_state *stream)
 	return new_stream;
 }
 
-/**
- * dc_stream_get_status_from_state - Get stream status from given dc state
- * @state: DC state to find the stream status in
- * @stream: The stream to get the stream status for
- *
- * The given stream is expected to exist in the given dc state. Otherwise, NULL
- * will be returned.
- */
-struct dc_stream_status *dc_stream_get_status_from_state(
-	struct dc_state *state,
-	struct dc_stream_state *stream)
-{
-	uint8_t i;
-
-	if (state == NULL)
-		return NULL;
-
-	for (i = 0; i < state->stream_count; i++) {
-		if (stream == state->streams[i])
-			return &state->stream_status[i];
-	}
-
-	return NULL;
-}
-
 /**
  * dc_stream_get_status() - Get current stream status of the given stream state
  * @stream: The stream to get the stream status for.
@@ -244,7 +221,7 @@ struct dc_stream_status *dc_stream_get_status(
 	struct dc_stream_state *stream)
 {
 	struct dc *dc = stream->ctx->dc;
-	return dc_stream_get_status_from_state(dc->current_state, stream);
+	return dc_state_get_stream_status(dc->current_state, stream);
 }
 
 static void program_cursor_attributes(
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
index a80e45300783..19a2c7140ae8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_surface.c
@@ -32,10 +32,12 @@
 #include "transform.h"
 #include "dpp.h"
 
+#include "dc_plane_priv.h"
+
 /*******************************************************************************
  * Private functions
  ******************************************************************************/
-static void dc_plane_construct(struct dc_context *ctx, struct dc_plane_state *plane_state)
+void dc_plane_construct(struct dc_context *ctx, struct dc_plane_state *plane_state)
 {
 	plane_state->ctx = ctx;
 
@@ -63,7 +65,7 @@ static void dc_plane_construct(struct dc_context *ctx, struct dc_plane_state *pl
 
 }
 
-static void dc_plane_destruct(struct dc_plane_state *plane_state)
+void dc_plane_destruct(struct dc_plane_state *plane_state)
 {
 	if (plane_state->gamma_correction != NULL) {
 		dc_gamma_release(&plane_state->gamma_correction);
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index ce00a6eeb164..d638679cf31a 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -27,6 +27,8 @@
 #define DC_INTERFACE_H_
 
 #include "dc_types.h"
+#include "dc_state.h"
+#include "dc_plane.h"
 #include "grph_object_defs.h"
 #include "logger_types.h"
 #include "hdcp_msg_types.h"
@@ -1386,16 +1388,6 @@ struct dc_surface_update {
 	const struct colorspace_transform *gamut_remap_matrix;
 };
 
-/*
- * Create a new surface with default parameters;
- */
-struct dc_plane_state *dc_create_plane_state(struct dc *dc);
-const struct dc_plane_status *dc_plane_get_status(
-		const struct dc_plane_state *plane_state);
-
-void dc_plane_state_retain(struct dc_plane_state *plane_state);
-void dc_plane_state_release(struct dc_plane_state *plane_state);
-
 void dc_gamma_retain(struct dc_gamma *dc_gamma);
 void dc_gamma_release(struct dc_gamma **dc_gamma);
 struct dc_gamma *dc_create_gamma(void);
@@ -1486,10 +1478,6 @@ enum dc_status dc_commit_streams(struct dc *dc,
 				 struct dc_stream_state *streams[],
 				 uint8_t stream_count);
 
-struct dc_state *dc_create_state(struct dc *dc);
-struct dc_state *dc_copy_state(struct dc_state *src_ctx);
-void dc_retain_state(struct dc_state *context);
-void dc_release_state(struct dc_state *context);
 
 struct dc_plane_state *dc_get_surface_for_mpcc(struct dc *dc,
 		struct dc_stream_state *stream,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 4b93e7a529d5..704d4ff722f0 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -33,6 +33,7 @@
 #include "cursor_reg_cache.h"
 #include "resource.h"
 #include "clk_mgr.h"
+#include "dc_state_priv.h"
 
 #define CTX dc_dmub_srv->ctx
 #define DC_LOGGER CTX->logger
@@ -532,12 +533,14 @@ void dc_dmub_srv_get_visual_confirm_color_cmd(struct dc *dc, struct pipe_ctx *pi
  * 3. Populate the drr_info with the min and max supported vtotal values
  */
 static void populate_subvp_cmd_drr_info(struct dc *dc,
+		struct dc_state *context,
 		struct pipe_ctx *subvp_pipe,
 		struct pipe_ctx *vblank_pipe,
 		struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data)
 {
+	struct dc_stream_state *phantom_stream = dc_state_get_paired_subvp_stream(context, subvp_pipe->stream);
 	struct dc_crtc_timing *main_timing = &subvp_pipe->stream->timing;
-	struct dc_crtc_timing *phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+	struct dc_crtc_timing *phantom_timing = &phantom_stream->timing;
 	struct dc_crtc_timing *drr_timing = &vblank_pipe->stream->timing;
 	uint16_t drr_frame_us = 0;
 	uint16_t min_drr_supported_us = 0;
@@ -625,7 +628,7 @@ static void populate_subvp_cmd_vblank_pipe_info(struct dc *dc,
 			continue;
 
 		// Find the SubVP pipe
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
 			break;
 	}
 
@@ -642,7 +645,7 @@ static void populate_subvp_cmd_vblank_pipe_info(struct dc *dc,
 
 	if (vblank_pipe->stream->ignore_msa_timing_param &&
 		(vblank_pipe->stream->allow_freesync || vblank_pipe->stream->vrr_active_variable || vblank_pipe->stream->vrr_active_fixed))
-		populate_subvp_cmd_drr_info(dc, pipe, vblank_pipe, pipe_data);
+		populate_subvp_cmd_drr_info(dc, context, pipe, vblank_pipe, pipe_data);
 }
 
 /**
@@ -667,10 +670,15 @@ static void update_subvp_prefetch_end_to_mall_start(struct dc *dc,
 	uint32_t subvp0_prefetch_us = 0;
 	uint32_t subvp1_prefetch_us = 0;
 	uint32_t prefetch_delta_us = 0;
-	struct dc_crtc_timing *phantom_timing0 = &subvp_pipes[0]->stream->mall_stream_config.paired_stream->timing;
-	struct dc_crtc_timing *phantom_timing1 = &subvp_pipes[1]->stream->mall_stream_config.paired_stream->timing;
+	struct dc_stream_state *phantom_stream0 = NULL;
+	struct dc_stream_state *phantom_stream1 = NULL;
+	struct dc_crtc_timing *phantom_timing0 = &phantom_stream0->timing;
+	struct dc_crtc_timing *phantom_timing1 = &phantom_stream1->timing;
 	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data = NULL;
 
+	phantom_stream0 = dc_state_get_paired_subvp_stream(context, subvp_pipes[0]->stream);
+	phantom_stream1 = dc_state_get_paired_subvp_stream(context, subvp_pipes[1]->stream);
+
 	subvp0_prefetch_us = div64_u64(((uint64_t)(phantom_timing0->v_total - phantom_timing0->v_front_porch) *
 			(uint64_t)phantom_timing0->h_total * 1000000),
 			(((uint64_t)phantom_timing0->pix_clk_100hz * 100) + dc->caps.subvp_prefetch_end_to_mall_start_us));
@@ -720,8 +728,9 @@ static void populate_subvp_cmd_pipe_info(struct dc *dc,
 	uint32_t j;
 	struct dmub_cmd_fw_assisted_mclk_switch_pipe_data_v2 *pipe_data =
 			&cmd->fw_assisted_mclk_switch_v2.config_data.pipe_data[cmd_pipe_index];
+	struct dc_stream_state *phantom_stream = dc_state_get_paired_subvp_stream(context, subvp_pipe->stream);
 	struct dc_crtc_timing *main_timing = &subvp_pipe->stream->timing;
-	struct dc_crtc_timing *phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+	struct dc_crtc_timing *phantom_timing = &phantom_stream->timing;
 	uint32_t out_num_stream, out_den_stream, out_num_plane, out_den_plane, out_num, out_den;
 
 	pipe_data->mode = SUBVP;
@@ -775,7 +784,7 @@ static void populate_subvp_cmd_pipe_info(struct dc *dc,
 	for (j = 0; j < dc->res_pool->pipe_count; j++) {
 		struct pipe_ctx *phantom_pipe = &context->res_ctx.pipe_ctx[j];
 
-		if (phantom_pipe->stream == subvp_pipe->stream->mall_stream_config.paired_stream) {
+		if (phantom_pipe->stream == dc_state_get_paired_subvp_stream(context, subvp_pipe->stream)) {
 			pipe_data->pipe_config.subvp_data.phantom_pipe_index = phantom_pipe->stream_res.tg->inst;
 			if (phantom_pipe->bottom_pipe) {
 				pipe_data->pipe_config.subvp_data.phantom_split_pipe_index = phantom_pipe->bottom_pipe->plane_res.hubp->inst;
@@ -809,6 +818,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 	union dmub_rb_cmd cmd;
 	struct pipe_ctx *subvp_pipes[2];
 	uint32_t wm_val_refclk = 0;
+	enum mall_stream_type pipe_mall_type;
 
 	memset(&cmd, 0, sizeof(cmd));
 	// FW command for SUBVP
@@ -824,7 +834,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 		 */
 		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
 				resource_is_pipe_type(pipe, DPP_PIPE) &&
-				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
 			subvp_pipes[subvp_count++] = pipe;
 	}
 
@@ -832,6 +842,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 		// For each pipe that is a "main" SUBVP pipe, fill in pipe data for DMUB SUBVP cmd
 		for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+			pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
 			if (!pipe->stream)
 				continue;
@@ -843,11 +854,11 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 			if (resource_is_pipe_type(pipe, OTG_MASTER) &&
 					resource_is_pipe_type(pipe, DPP_PIPE) &&
 					pipe->stream->mall_stream_config.paired_stream &&
-					pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+					pipe_mall_type == SUBVP_MAIN) {
 				populate_subvp_cmd_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
 			} else if (resource_is_pipe_type(pipe, OTG_MASTER) &&
 					resource_is_pipe_type(pipe, DPP_PIPE) &&
-					pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+					pipe_mall_type == SUBVP_NONE) {
 				// Don't need to check for ActiveDRAMClockChangeMargin < 0, not valid in cases where
 				// we run through DML without calculating "natural" P-state support
 				populate_subvp_cmd_vblank_pipe_info(dc, context, &cmd, pipe, cmd_pipe_index++);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_plane.h b/drivers/gpu/drm/amd/display/dc/dc_plane.h
new file mode 100644
index 000000000000..ef380cae816a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_plane.h
@@ -0,0 +1,38 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DC_PLANE_H_
+#define _DC_PLANE_H_
+
+#include "dc.h"
+#include "dc_hw_types.h"
+
+struct dc_plane_state *dc_create_plane_state(struct dc *dc);
+const struct dc_plane_status *dc_plane_get_status(
+		const struct dc_plane_state *plane_state);
+void dc_plane_state_retain(struct dc_plane_state *plane_state);
+void dc_plane_state_release(struct dc_plane_state *plane_state);
+
+#endif /* _DC_PLANE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_plane_priv.h b/drivers/gpu/drm/amd/display/dc/dc_plane_priv.h
new file mode 100644
index 000000000000..9ee184c1df00
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_plane_priv.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DC_PLANE_PRIV_H_
+#define _DC_PLANE_PRIV_H_
+
+#include "dc_plane.h"
+
+void dc_plane_construct(struct dc_context *ctx, struct dc_plane_state *plane_state);
+void dc_plane_destruct(struct dc_plane_state *plane_state);
+
+#endif /* _DC_PLANE_PRIV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_state.h b/drivers/gpu/drm/amd/display/dc/dc_state.h
new file mode 100644
index 000000000000..df1a8b85a652
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_state.h
@@ -0,0 +1,74 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DC_STATE_H_
+#define _DC_STATE_H_
+
+#include "dc.h"
+#include "inc/core_status.h"
+
+
+struct dc_state *dc_state_create(struct dc *dc);
+struct dc_state *dc_state_create_copy(struct dc_state *src_state);
+void dc_state_retain(struct dc_state *state);
+void dc_state_release(struct dc_state *state);
+
+enum dc_status dc_state_add_stream(struct dc *dc,
+				    struct dc_state *state,
+				    struct dc_stream_state *stream);
+
+enum dc_status dc_state_remove_stream(
+		struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *stream);
+
+bool dc_state_add_plane(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state *plane_state,
+		struct dc_state *state);
+
+bool dc_state_remove_plane(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state *plane_state,
+		struct dc_state *state);
+
+bool dc_state_rem_all_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_state *state);
+
+bool dc_state_add_all_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *stream,
+		struct dc_plane_state * const *plane_states,
+		int plane_count,
+		struct dc_state *state);
+
+struct dc_stream_status *dc_state_get_stream_status(
+	struct dc_state *state,
+	struct dc_stream_state *stream);
+#endif /* _DC_STATE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_state_priv.h b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
new file mode 100644
index 000000000000..16c09caa1317
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_state_priv.h
@@ -0,0 +1,97 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DC_STATE_PRIV_H_
+#define _DC_STATE_PRIV_H_
+
+#include "dc_state.h"
+#include "dc_stream.h"
+
+struct dc_stream_status *dc_state_get_stream_status(
+	struct dc_state *state,
+	struct dc_stream_state *stream);
+
+/* Get the type of the provided resource (none, phantom, main) based on the provided
+ * context. If the context is unavailable, determine only if phantom or not.
+ */
+enum mall_stream_type dc_state_get_pipe_subvp_type(const struct dc_state *state,
+		const struct pipe_ctx *pipe_ctx);
+enum mall_stream_type dc_state_get_stream_subvp_type(const struct dc_state *state,
+		const struct dc_stream_state *stream);
+
+/* Gets the phantom stream if main is provided, gets the main if phantom is provided.*/
+struct dc_stream_state *dc_state_get_paired_subvp_stream(const struct dc_state *state,
+		const struct dc_stream_state *stream);
+
+/* allocate's phantom stream or plane and returns pointer to the object */
+struct dc_stream_state *dc_state_create_phantom_stream(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *main_stream);
+struct dc_plane_state *dc_state_create_phantom_plane(struct dc *dc,
+		struct dc_state *state,
+		struct dc_plane_state *main_plane);
+
+/* deallocate's phantom stream or plane */
+void dc_state_release_phantom_stream(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream);
+void dc_state_release_phantom_plane(const struct dc *dc,
+		struct dc_state *state,
+		struct dc_plane_state *phantom_plane);
+
+/* add/remove phantom stream to context and generate subvp meta data */
+enum dc_status dc_state_add_phantom_stream(struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream,
+		struct dc_stream_state *main_stream);
+enum dc_status dc_state_remove_phantom_stream(struct dc *dc,
+		struct dc_state *state,
+		struct dc_stream_state *phantom_stream);
+
+bool dc_state_add_phantom_plane(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state *phantom_plane,
+		struct dc_state *state);
+
+bool dc_state_remove_phantom_plane(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state *phantom_plane,
+		struct dc_state *state);
+
+bool dc_state_rem_all_phantom_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_state *state);
+
+bool dc_state_add_all_phantom_planes_for_stream(
+		const struct dc *dc,
+		struct dc_stream_state *phantom_stream,
+		struct dc_plane_state * const *phantom_planes,
+		int plane_count,
+		struct dc_state *state);
+
+#endif /* _DC_STATE_PRIV_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 27118e672754..f617428c6a57 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -146,12 +146,6 @@ struct test_pattern {
 
 #define SUBVP_DRR_MARGIN_US 100 // 100us for DRR margin (SubVP + DRR)
 
-enum mall_stream_type {
-	SUBVP_NONE, // subvp not in use
-	SUBVP_MAIN, // subvp in use, this stream is main stream
-	SUBVP_PHANTOM, // subvp in use, this stream is a phantom stream
-};
-
 struct mall_stream_config {
 	/* MALL stream config to indicate if the stream is phantom or not.
 	 * We will use a phantom stream to indicate that the pipe is phantom.
@@ -413,41 +407,6 @@ bool dc_stream_get_scanoutpos(const struct dc_stream_state *stream,
 				  uint32_t *h_position,
 				  uint32_t *v_position);
 
-enum dc_status dc_add_stream_to_ctx(
-			struct dc *dc,
-		struct dc_state *new_ctx,
-		struct dc_stream_state *stream);
-
-enum dc_status dc_remove_stream_from_ctx(
-		struct dc *dc,
-			struct dc_state *new_ctx,
-			struct dc_stream_state *stream);
-
-
-bool dc_add_plane_to_context(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state *plane_state,
-		struct dc_state *context);
-
-bool dc_remove_plane_from_context(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state *plane_state,
-		struct dc_state *context);
-
-bool dc_rem_all_planes_for_stream(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_state *context);
-
-bool dc_add_all_planes_for_stream(
-		const struct dc *dc,
-		struct dc_stream_state *stream,
-		struct dc_plane_state * const *plane_states,
-		int plane_count,
-		struct dc_state *context);
-
 bool dc_stream_add_writeback(struct dc *dc,
 		struct dc_stream_state *stream,
 		struct dc_writeback_info *wb_info);
@@ -516,9 +475,6 @@ void update_stream_signal(struct dc_stream_state *stream, struct dc_sink *sink);
 void dc_stream_retain(struct dc_stream_state *dc_stream);
 void dc_stream_release(struct dc_stream_state *dc_stream);
 
-struct dc_stream_status *dc_stream_get_status_from_state(
-	struct dc_state *state,
-	struct dc_stream_state *stream);
 struct dc_stream_status *dc_stream_get_status(
 	struct dc_stream_state *dc_stream);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h b/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
new file mode 100644
index 000000000000..710d3b04c7e8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream_priv.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _DC_STREAM_PRIV_H_
+#define _DC_STREAM_PRIV_H_
+
+#include "dc_stream.h"
+
+bool dc_stream_construct(struct dc_stream_state *stream,
+	struct dc_sink *dc_sink_data);
+void dc_stream_destruct(struct dc_stream_state *stream);
+
+#endif // _DC_STREAM_PRIV_H_
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index 7313cfe69498..870cd3932015 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -1161,4 +1161,9 @@ enum dc_hpd_enable_select {
 	HPD_EN_FOR_SECONDARY_EDP_ONLY,
 };
 
+enum mall_stream_type {
+	SUBVP_NONE, // subvp not in use
+	SUBVP_MAIN, // subvp in use, this stream is main stream
+	SUBVP_PHANTOM, // subvp in use, this stream is a phantom stream
+};
 #endif /* DC_TYPES_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index e8159a459bce..b3d360741175 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -28,6 +28,7 @@
 #include "dcn20/dcn20_resource.h"
 #include "dml/dcn32/display_mode_vba_util_32.h"
 #include "dml/dcn32/dcn32_fpu.h"
+#include "dc_state_priv.h"
 
 static bool is_dual_plane(enum surface_pixel_format format)
 {
@@ -190,7 +191,7 @@ bool dcn32_subvp_in_use(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE)
+		if (dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_NONE)
 			return true;
 	}
 	return false;
@@ -264,18 +265,17 @@ static void override_det_for_subvp(struct dc *dc, struct dc_state *context, uint
 
 	// Do not override if a stream has multiple planes
 	for (i = 0; i < context->stream_count; i++) {
-		if (context->stream_status[i].plane_count > 1) {
+		if (context->stream_status[i].plane_count > 1)
 			return;
-		}
-		if (context->streams[i]->mall_stream_config.type != SUBVP_PHANTOM) {
+
+		if (dc_state_get_stream_subvp_type(context, context->streams[i]) != SUBVP_PHANTOM)
 			stream_count++;
-		}
 	}
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe_ctx->stream && pipe_ctx->plane_state && pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+		if (pipe_ctx->stream && pipe_ctx->plane_state && dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM) {
 			if (dcn32_allow_subvp_high_refresh_rate(dc, context, pipe_ctx)) {
 
 				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920) {
@@ -290,7 +290,7 @@ static void override_det_for_subvp(struct dc *dc, struct dc_state *context, uint
 		for (i = 0; i < dc->res_pool->pipe_count; i++) {
 			struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
-			if (pipe_ctx->stream && pipe_ctx->plane_state && pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			if (pipe_ctx->stream && pipe_ctx->plane_state && dc_state_get_pipe_subvp_type(context, pipe_ctx)) {
 				if (pipe_ctx->stream->timing.v_addressable == 1080 && pipe_ctx->stream->timing.h_addressable == 1920) {
 					if (pipe_segments[i] > 4)
 						pipe_segments[i] = 4;
@@ -337,14 +337,14 @@ void dcn32_determine_det_override(struct dc *dc,
 
 	for (i = 0; i < context->stream_count; i++) {
 		/* Don't count SubVP streams for DET allocation */
-		if (context->streams[i]->mall_stream_config.type != SUBVP_PHANTOM)
+		if (dc_state_get_stream_subvp_type(context, context->streams[i]) != SUBVP_PHANTOM)
 			stream_count++;
 	}
 
 	if (stream_count > 0) {
 		stream_segments = 18 / stream_count;
 		for (i = 0; i < context->stream_count; i++) {
-			if (context->streams[i]->mall_stream_config.type == SUBVP_PHANTOM)
+			if (dc_state_get_stream_subvp_type(context, context->streams[i]) == SUBVP_PHANTOM)
 				continue;
 
 			if (context->stream_status[i].plane_count > 0)
@@ -716,10 +716,11 @@ bool dcn32_subvp_drr_admissable(struct dc *dc, struct dc_state *context)
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		enum mall_stream_type pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
 		if (resource_is_pipe_type(pipe, OPP_HEAD) &&
 				resource_is_pipe_type(pipe, DPP_PIPE)) {
-			if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			if (pipe_mall_type == SUBVP_MAIN) {
 				subvp_count++;
 
 				subvp_disallow |= disallow_subvp_in_active_plus_blank(pipe);
@@ -728,7 +729,7 @@ bool dcn32_subvp_drr_admissable(struct dc *dc, struct dc_state *context)
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.v_total);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.h_total);
 			}
-			if (pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			if (pipe_mall_type == SUBVP_NONE) {
 				non_subvp_pipes++;
 				drr_psr_capable = (drr_psr_capable || dcn32_is_psr_capable(pipe));
 				if (pipe->stream->ignore_msa_timing_param &&
@@ -776,10 +777,11 @@ bool dcn32_subvp_vblank_admissable(struct dc *dc, struct dc_state *context, int
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		enum mall_stream_type pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
 		if (resource_is_pipe_type(pipe, OPP_HEAD) &&
 				resource_is_pipe_type(pipe, DPP_PIPE)) {
-			if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			if (pipe_mall_type == SUBVP_MAIN) {
 				subvp_count++;
 
 				subvp_disallow |= disallow_subvp_in_active_plus_blank(pipe);
@@ -788,7 +790,7 @@ bool dcn32_subvp_vblank_admissable(struct dc *dc, struct dc_state *context, int
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.v_total);
 				refresh_rate = div_u64(refresh_rate, pipe->stream->timing.h_total);
 			}
-			if (pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			if (pipe_mall_type == SUBVP_NONE) {
 				non_subvp_pipes++;
 				vblank_psr_capable = (vblank_psr_capable || dcn32_is_psr_capable(pipe));
 				if (pipe->stream->ignore_msa_timing_param &&
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index ec77b2b41ba3..1ec8ca1fdb4f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -33,6 +33,7 @@
 
 #include "link.h"
 #include "dcn20_fpu.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER \
 	dc->ctx->logger
@@ -1074,7 +1075,7 @@ void dcn20_calculate_dlg_params(struct dc *dc,
 		pipes[pipe_idx].pipe.dest.vupdate_width = get_vupdate_width(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
 		pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
 
-		if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM) {
 			// Phantom pipe requires that DET_SIZE = 0 and no unbounded requests
 			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = 0;
 			context->res_ctx.pipe_ctx[i].unbounded_req = false;
@@ -1424,7 +1425,7 @@ int dcn20_populate_dml_pipes_from_context(struct dc *dc,
 		 */
 		if (res_ctx->pipe_ctx[i].plane_state &&
 				(res_ctx->pipe_ctx[i].plane_state->address.type == PLN_ADDR_TYPE_VIDEO_PROGRESSIVE ||
-				 res_ctx->pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM))
+				dc_state_get_pipe_subvp_type(context, &res_ctx->pipe_ctx[i]) == SUBVP_PHANTOM))
 			pipes[pipe_cnt].pipe.src.num_cursors = 0;
 		else
 			pipes[pipe_cnt].pipe.src.num_cursors = dc->dml.ip.number_of_cursors;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index de209ca0cf8c..50d223fa1e49 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -32,6 +32,7 @@
 #include "clk_mgr/dcn32/dcn32_smu13_driver_if.h"
 #include "dcn30/dcn30_resource.h"
 #include "link.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -341,7 +342,7 @@ void dcn32_helper_populate_phantom_dlg_params(struct dc *dc,
 		if (!pipe->stream)
 			continue;
 
-		if (pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (pipe->plane_state && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			pipes[pipe_idx].pipe.dest.vstartup_start =
 				get_vstartup(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
 			pipes[pipe_idx].pipe.dest.vupdate_offset =
@@ -624,7 +625,7 @@ static bool dcn32_assign_subvp_pipe(struct dc *dc,
 		if (pipe->plane_state && !pipe->top_pipe && !dcn32_is_center_timing(pipe) &&
 				!(pipe->stream->timing.pix_clk_100hz / 10000 > DCN3_2_MAX_SUBVP_PIXEL_RATE_MHZ) &&
 				(!dcn32_is_psr_capable(pipe) || (context->stream_count == 1 && dc->caps.dmub_caps.subvp_psr)) &&
-				pipe->stream->mall_stream_config.type == SUBVP_NONE &&
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE &&
 				(refresh_rate < 120 || dcn32_allow_subvp_high_refresh_rate(dc, context, pipe)) &&
 				!pipe->plane_state->address.tmz_surface &&
 				(vba->ActiveDRAMClockChangeLatencyMarginPerState[vba->VoltageLevel][vba->maxMpcComb][vba->pipe_plane[pipe_idx]] <= 0 ||
@@ -682,7 +683,7 @@ static bool dcn32_enough_pipes_for_subvp(struct dc *dc, struct dc_state *context
 
 		// Find the minimum pipe split count for non SubVP pipes
 		if (resource_is_pipe_type(pipe, OPP_HEAD) &&
-		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_NONE) {
 			split_cnt = 0;
 			while (pipe) {
 				split_cnt++;
@@ -735,8 +736,8 @@ static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
 		 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
 		 */
 		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
-		    pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
-			phantom = pipe->stream->mall_stream_config.paired_stream;
+			dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN) {
+			phantom = dc_state_get_paired_subvp_stream(context, pipe->stream);
 			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
 					phantom->timing.v_addressable;
 
@@ -804,6 +805,7 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context)
 	int16_t stretched_drr_us = 0;
 	int16_t drr_stretched_vblank_us = 0;
 	int16_t max_vblank_mallregion = 0;
+	struct dc_stream_state *phantom_stream;
 
 	// Find SubVP pipe
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
@@ -816,7 +818,7 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context)
 			continue;
 
 		// Find the SubVP pipe
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
 			break;
 	}
 
@@ -829,13 +831,14 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context)
 				!resource_is_pipe_type(pipe, DPP_PIPE))
 			continue;
 
-		if (drr_pipe->stream->mall_stream_config.type == SUBVP_NONE && drr_pipe->stream->ignore_msa_timing_param &&
+		if (dc_state_get_pipe_subvp_type(context, drr_pipe) == SUBVP_NONE && drr_pipe->stream->ignore_msa_timing_param &&
 				(drr_pipe->stream->allow_freesync || drr_pipe->stream->vrr_active_variable || drr_pipe->stream->vrr_active_fixed))
 			break;
 	}
 
+	phantom_stream = dc_state_get_paired_subvp_stream(context, pipe->stream);
 	main_timing = &pipe->stream->timing;
-	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
+	phantom_timing = &phantom_stream->timing;
 	drr_timing = &drr_pipe->stream->timing;
 	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
 			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
@@ -895,6 +898,8 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 	struct dc_crtc_timing *main_timing = NULL;
 	struct dc_crtc_timing *phantom_timing = NULL;
 	struct dc_crtc_timing *vblank_timing = NULL;
+	struct dc_stream_state *phantom_stream;
+	enum mall_stream_type pipe_mall_type;
 
 	/* For SubVP + VBLANK/DRR cases, we assume there can only be
 	 * a single VBLANK/DRR display. If DML outputs SubVP + VBLANK
@@ -904,6 +909,7 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 	 */
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		pipe = &context->res_ctx.pipe_ctx[i];
+		pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
 		// We check for master pipe, but it shouldn't matter since we only need
 		// the pipe for timing info (stream should be same for any pipe splits)
@@ -911,18 +917,19 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 				!resource_is_pipe_type(pipe, DPP_PIPE))
 			continue;
 
-		if (!found && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+		if (!found && pipe_mall_type == SUBVP_NONE) {
 			// Found pipe which is not SubVP or Phantom (i.e. the VBLANK pipe).
 			vblank_index = i;
 			found = true;
 		}
 
-		if (!subvp_pipe && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (!subvp_pipe && pipe_mall_type == SUBVP_MAIN)
 			subvp_pipe = pipe;
 	}
 	if (found) {
+		phantom_stream = dc_state_get_paired_subvp_stream(context, subvp_pipe->stream);
 		main_timing = &subvp_pipe->stream->timing;
-		phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+		phantom_timing = &phantom_stream->timing;
 		vblank_timing = &context->res_ctx.pipe_ctx[vblank_index].stream->timing;
 		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
 		// Also include the prefetch end to mallstart delay time
@@ -977,7 +984,7 @@ static bool subvp_subvp_admissable(struct dc *dc,
 			continue;
 
 		if (pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN) {
 			refresh_rate = (pipe->stream->timing.pix_clk_100hz * (uint64_t)100 +
 				pipe->stream->timing.v_total * pipe->stream->timing.h_total - (uint64_t)1);
 			refresh_rate = div_u64(refresh_rate, pipe->stream->timing.v_total);
@@ -1026,23 +1033,23 @@ static bool subvp_validate_static_schedulability(struct dc *dc,
 
 	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		enum mall_stream_type pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
 		if (!pipe->stream)
 			continue;
 
 		if (pipe->plane_state && !pipe->top_pipe) {
-			if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			if (pipe_mall_type == SUBVP_MAIN)
 				subvp_count++;
-			if (pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			if (pipe_mall_type == SUBVP_NONE)
 				non_subvp_pipes++;
-			}
 		}
 
 		// Count how many planes that aren't SubVP/phantom are capable of VACTIVE
 		// switching (SubVP + VACTIVE unsupported). In situations where we force
 		// SubVP for a VACTIVE plane, we don't want to increment the vactive_count.
 		if (vba->ActiveDRAMClockChangeLatencyMarginPerState[vlevel][vba->maxMpcComb][vba->pipe_plane[pipe_idx]] > 0 &&
-		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+				pipe_mall_type == SUBVP_NONE) {
 			vactive_count++;
 		}
 		pipe_idx++;
@@ -1078,7 +1085,7 @@ static void assign_subvp_index(struct dc *dc, struct dc_state *context)
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
 		if (resource_is_pipe_type(pipe_ctx, OTG_MASTER) &&
-				pipe_ctx->stream->mall_stream_config.type == SUBVP_MAIN) {
+				dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_MAIN) {
 			pipe_ctx->subvp_index = index++;
 		} else {
 			pipe_ctx->subvp_index = 0;
@@ -1684,7 +1691,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
 		pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt,
 				pipe_idx);
 
-		if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM) {
 			// Phantom pipe requires that DET_SIZE = 0 and no unbounded requests
 			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = 0;
 			context->res_ctx.pipe_ctx[i].unbounded_req = false;
@@ -1716,7 +1723,7 @@ static void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context,
 				context->res_ctx.pipe_ctx[i].plane_state != context->res_ctx.pipe_ctx[i].top_pipe->plane_state) &&
 				context->res_ctx.pipe_ctx[i].prev_odm_pipe == NULL) {
 			/* SS: all active surfaces stored in MALL */
-			if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			if (dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) != SUBVP_PHANTOM) {
 				context->bw_ctx.bw.dcn.mall_ss_size_bytes += context->res_ctx.pipe_ctx[i].surface_size_in_mall_bytes;
 
 				if (context->res_ctx.pipe_ctx[i].stream->link->psr_settings.psr_version == DC_PSR_VERSION_UNSUPPORTED) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h
index e85866db80ff..7ca7f2a743c2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_types.h
@@ -38,5 +38,6 @@
 #include "core_types.h"
 #include "dsc.h"
 #include "clk_mgr.h"
+#include "dc_state_priv.h"
 
 #endif //__DML2_DC_TYPES_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
index 32f8a43af3d6..0c146af34d82 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c
@@ -51,7 +51,7 @@ unsigned int dml2_helper_calculate_num_ways_for_subvp(struct dml2_context *ctx,
 
 		// Find the phantom pipes
 		if (pipe->stream && pipe->plane_state && !pipe->top_pipe && !pipe->prev_odm_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			bytes_per_pixel = pipe->plane_state->format >= SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 ? 8 : 4;
 			mblk_width = ctx->config.mall_cfg.mblk_width_pixels;
 			mblk_height = bytes_per_pixel == 4 ? mblk_width = ctx->config.mall_cfg.mblk_height_4bpe_pixels : ctx->config.mall_cfg.mblk_height_8bpe_pixels;
@@ -253,7 +253,7 @@ static bool assign_subvp_pipe(struct dml2_context *ctx, struct dc_state *context
 		 *   to combine this with SubVP can cause issues with the scheduling).
 		 */
 		if (pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_NONE && refresh_rate < 120 &&
+				ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe) == SUBVP_NONE && refresh_rate < 120 &&
 				vba->ActiveDRAMClockChangeLatencyMarginPerState[vba->VoltageLevel][vba->maxMpcComb][vba->pipe_plane[pipe_idx]] <= 0) {
 			while (pipe) {
 				num_pipes++;
@@ -317,7 +317,7 @@ static bool enough_pipes_for_subvp(struct dml2_context *ctx, struct dc_state *st
 
 		// Find the minimum pipe split count for non SubVP pipes
 		if (pipe->stream && !pipe->top_pipe &&
-		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+				ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(state, pipe) == SUBVP_NONE) {
 			split_cnt = 0;
 			while (pipe) {
 				split_cnt++;
@@ -372,8 +372,8 @@ static bool subvp_subvp_schedulable(struct dml2_context *ctx, struct dc_state *c
 		 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
 		 */
 		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
-		    pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
-			phantom = pipe->stream->mall_stream_config.paired_stream;
+				ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe) == SUBVP_MAIN) {
+			phantom = ctx->config.svp_pstate.callbacks.get_paired_subvp_stream(context, pipe->stream);
 			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
 					phantom->timing.v_addressable;
 
@@ -435,6 +435,7 @@ bool dml2_svp_drr_schedulable(struct dml2_context *ctx, struct dc_state *context
 	struct pipe_ctx *pipe = NULL;
 	struct dc_crtc_timing *main_timing = NULL;
 	struct dc_crtc_timing *phantom_timing = NULL;
+	struct dc_stream_state *phantom_stream;
 	int16_t prefetch_us = 0;
 	int16_t mall_region_us = 0;
 	int16_t drr_frame_us = 0;	// nominal frame time
@@ -453,12 +454,13 @@ bool dml2_svp_drr_schedulable(struct dml2_context *ctx, struct dc_state *context
 			continue;
 
 		// Find the SubVP pipe
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
 			break;
 	}
 
+	phantom_stream = ctx->config.svp_pstate.callbacks.get_paired_subvp_stream(context, pipe->stream);
 	main_timing = &pipe->stream->timing;
-	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
+	phantom_timing = &phantom_stream->timing;
 	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
 			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
 			ctx->config.svp_pstate.subvp_prefetch_end_to_mall_start_us;
@@ -519,6 +521,8 @@ static bool subvp_vblank_schedulable(struct dml2_context *ctx, struct dc_state *
 	struct dc_crtc_timing *main_timing = NULL;
 	struct dc_crtc_timing *phantom_timing = NULL;
 	struct dc_crtc_timing *vblank_timing = NULL;
+	struct dc_stream_state *phantom_stream;
+	enum mall_stream_type pipe_mall_type;
 
 	/* For SubVP + VBLANK/DRR cases, we assume there can only be
 	 * a single VBLANK/DRR display. If DML outputs SubVP + VBLANK
@@ -528,19 +532,20 @@ static bool subvp_vblank_schedulable(struct dml2_context *ctx, struct dc_state *
 	 */
 	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
 		pipe = &context->res_ctx.pipe_ctx[i];
+		pipe_mall_type = ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe);
 
 		// We check for master pipe, but it shouldn't matter since we only need
 		// the pipe for timing info (stream should be same for any pipe splits)
 		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
 			continue;
 
-		if (!found && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+		if (!found && pipe_mall_type == SUBVP_NONE) {
 			// Found pipe which is not SubVP or Phantom (i.e. the VBLANK pipe).
 			vblank_index = i;
 			found = true;
 		}
 
-		if (!subvp_pipe && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+		if (!subvp_pipe && pipe_mall_type == SUBVP_MAIN)
 			subvp_pipe = pipe;
 	}
 	// Use ignore_msa_timing_param flag to identify as DRR
@@ -548,8 +553,9 @@ static bool subvp_vblank_schedulable(struct dml2_context *ctx, struct dc_state *
 		// SUBVP + DRR case
 		schedulable = dml2_svp_drr_schedulable(ctx, context, &context->res_ctx.pipe_ctx[vblank_index].stream->timing);
 	} else if (found) {
+		phantom_stream = ctx->config.svp_pstate.callbacks.get_paired_subvp_stream(context, subvp_pipe->stream);
 		main_timing = &subvp_pipe->stream->timing;
-		phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+		phantom_timing = &phantom_stream->timing;
 		vblank_timing = &context->res_ctx.pipe_ctx[vblank_index].stream->timing;
 		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
 		// Also include the prefetch end to mallstart delay time
@@ -602,19 +608,20 @@ bool dml2_svp_validate_static_schedulability(struct dml2_context *ctx, struct dc
 
 	for (i = 0, pipe_idx = 0; i < ctx->config.dcn_pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		enum mall_stream_type pipe_mall_type = ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(context, pipe);
 
 		if (!pipe->stream)
 			continue;
 
 		if (pipe->plane_state && !pipe->top_pipe &&
-				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+				pipe_mall_type == SUBVP_MAIN)
 			subvp_count++;
 
 		// Count how many planes that aren't SubVP/phantom are capable of VACTIVE
 		// switching (SubVP + VACTIVE unsupported). In situations where we force
 		// SubVP for a VACTIVE plane, we don't want to increment the vactive_count.
 		if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0 &&
-		    pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+		    pipe_mall_type == SUBVP_NONE) {
 			vactive_count++;
 		}
 		pipe_idx++;
@@ -708,14 +715,10 @@ static void set_phantom_stream_timing(struct dml2_context *ctx, struct dc_state
 static struct dc_stream_state *enable_phantom_stream(struct dml2_context *ctx, struct dc_state *state, unsigned int dc_pipe_idx, unsigned int svp_height, unsigned int vstartup)
 {
 	struct pipe_ctx *ref_pipe = &state->res_ctx.pipe_ctx[dc_pipe_idx];
-	struct dc_stream_state *phantom_stream = ctx->config.svp_pstate.callbacks.create_stream_for_sink(ref_pipe->stream->sink);
-
-	phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
-	phantom_stream->dpms_off = true;
-	phantom_stream->mall_stream_config.type = SUBVP_PHANTOM;
-	phantom_stream->mall_stream_config.paired_stream = ref_pipe->stream;
-	ref_pipe->stream->mall_stream_config.type = SUBVP_MAIN;
-	ref_pipe->stream->mall_stream_config.paired_stream = phantom_stream;
+	struct dc_stream_state *phantom_stream = ctx->config.svp_pstate.callbacks.create_phantom_stream(
+			ctx->config.svp_pstate.callbacks.dc,
+			state,
+			ref_pipe->stream);
 
 	/* stream has limited viewport and small timing */
 	memcpy(&phantom_stream->timing, &ref_pipe->stream->timing, sizeof(phantom_stream->timing));
@@ -723,7 +726,10 @@ static struct dc_stream_state *enable_phantom_stream(struct dml2_context *ctx, s
 	memcpy(&phantom_stream->dst, &ref_pipe->stream->dst, sizeof(phantom_stream->dst));
 	set_phantom_stream_timing(ctx, state, ref_pipe, phantom_stream, dc_pipe_idx, svp_height, vstartup);
 
-	ctx->config.svp_pstate.callbacks.add_stream_to_ctx(ctx->config.svp_pstate.callbacks.dc, state, phantom_stream);
+	ctx->config.svp_pstate.callbacks.add_phantom_stream(ctx->config.svp_pstate.callbacks.dc,
+			state,
+			phantom_stream,
+			ref_pipe->stream);
 	return phantom_stream;
 }
 
@@ -740,7 +746,10 @@ static void enable_phantom_plane(struct dml2_context *ctx,
 		if (curr_pipe->top_pipe && curr_pipe->top_pipe->plane_state == curr_pipe->plane_state) {
 			phantom_plane = prev_phantom_plane;
 		} else {
-			phantom_plane = ctx->config.svp_pstate.callbacks.create_plane(ctx->config.svp_pstate.callbacks.dc);
+			phantom_plane = ctx->config.svp_pstate.callbacks.create_phantom_plane(
+					ctx->config.svp_pstate.callbacks.dc,
+					state,
+					curr_pipe->plane_state);
 		}
 
 		memcpy(&phantom_plane->address, &curr_pipe->plane_state->address, sizeof(phantom_plane->address));
@@ -763,9 +772,7 @@ static void enable_phantom_plane(struct dml2_context *ctx,
 		phantom_plane->clip_rect.y = 0;
 		phantom_plane->clip_rect.height = phantom_stream->timing.v_addressable;
 
-		phantom_plane->is_phantom = true;
-
-		ctx->config.svp_pstate.callbacks.add_plane_to_context(ctx->config.svp_pstate.callbacks.dc, phantom_stream, phantom_plane, state);
+		ctx->config.svp_pstate.callbacks.add_phantom_plane(ctx->config.svp_pstate.callbacks.dc, phantom_stream, phantom_plane, state);
 
 		curr_pipe = curr_pipe->bottom_pipe;
 		prev_phantom_plane = phantom_plane;
@@ -790,7 +797,7 @@ static void add_phantom_pipes_for_main_pipe(struct dml2_context *ctx, struct dc_
 		// We determine which phantom pipes were added by comparing with
 		// the phantom stream.
 		if (pipe->plane_state && pipe->stream && pipe->stream == phantom_stream &&
-				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(state, pipe) == SUBVP_PHANTOM) {
 			pipe->stream->use_dynamic_meta = false;
 			pipe->plane_state->flip_immediate = false;
 			if (!ctx->config.svp_pstate.callbacks.build_scaling_params(pipe)) {
@@ -822,7 +829,7 @@ static bool remove_all_planes_for_stream(struct dml2_context *ctx, struct dc_str
 		del_planes[i] = stream_status->plane_states[i];
 
 	for (i = 0; i < old_plane_count; i++)
-		if (!ctx->config.svp_pstate.callbacks.remove_plane_from_context(ctx->config.svp_pstate.callbacks.dc, stream, del_planes[i], context))
+		if (!ctx->config.svp_pstate.callbacks.remove_phantom_plane(ctx->config.svp_pstate.callbacks.dc, stream, del_planes[i], context))
 			return false;
 
 	return true;
@@ -838,19 +845,23 @@ bool dml2_svp_remove_all_phantom_pipes(struct dml2_context *ctx, struct dc_state
 	for (i = 0; i < ctx->config.dcn_pipe_count; i++) {
 		struct pipe_ctx *pipe = &state->res_ctx.pipe_ctx[i];
 		// build scaling params for phantom pipes
-		if (pipe->plane_state && pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (pipe->plane_state && pipe->stream && ctx->config.svp_pstate.callbacks.get_pipe_subvp_type(state, pipe) == SUBVP_PHANTOM) {
 			phantom_plane = pipe->plane_state;
 			phantom_stream = pipe->stream;
 
 			remove_all_planes_for_stream(ctx, pipe->stream, state);
-			ctx->config.svp_pstate.callbacks.remove_stream_from_ctx(ctx->config.svp_pstate.callbacks.dc, state, pipe->stream);
+			ctx->config.svp_pstate.callbacks.remove_phantom_stream(ctx->config.svp_pstate.callbacks.dc, state, pipe->stream);
 
 			/* Ref count is incremented on allocation and also when added to the context.
 			 * Therefore we must call release for the the phantom plane and stream once
 			 * they are removed from the ctx to finally decrement the refcount to 0 to free.
 			 */
-			ctx->config.svp_pstate.callbacks.plane_state_release(phantom_plane);
-			ctx->config.svp_pstate.callbacks.stream_release(phantom_stream);
+			ctx->config.svp_pstate.callbacks.release_phantom_plane(ctx->config.svp_pstate.callbacks.dc,
+					state,
+					phantom_plane);
+			ctx->config.svp_pstate.callbacks.release_phantom_stream(ctx->config.svp_pstate.callbacks.dc,
+					state,
+					phantom_stream);
 
 			removed_pipe = true;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index 279e7605a0a2..bc2959fda5be 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -1051,6 +1051,7 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 {
 	int i = 0, j = 0;
 	int disp_cfg_stream_location, disp_cfg_plane_location;
+	enum mall_stream_type stream_mall_type;
 
 	for (i = 0; i < __DML2_WRAPPER_MAX_STREAMS_PLANES__; i++) {
 		dml2->v20.scratch.dml_to_dc_pipe_mapping.disp_cfg_to_stream_id_valid[i] = false;
@@ -1071,6 +1072,7 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 
 	for (i = 0; i < context->stream_count; i++) {
 		disp_cfg_stream_location = map_stream_to_dml_display_cfg(dml2, context->streams[i], dml_dispcfg);
+		stream_mall_type = dc_state_get_stream_subvp_type(context, context->streams[i]);
 
 		if (disp_cfg_stream_location < 0)
 			disp_cfg_stream_location = dml_dispcfg->num_timings++;
@@ -1115,10 +1117,10 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 				populate_dml_surface_cfg_from_plane_state(dml2->v20.dml_core_ctx.project, &dml_dispcfg->surface, disp_cfg_plane_location, context->stream_status[i].plane_states[j]);
 				populate_dml_plane_cfg_from_plane_state(&dml_dispcfg->plane, disp_cfg_plane_location, context->stream_status[i].plane_states[j], context);
 
-				if (context->streams[i]->mall_stream_config.type == SUBVP_MAIN) {
+				if (stream_mall_type == SUBVP_MAIN) {
 					dml_dispcfg->plane.UseMALLForPStateChange[disp_cfg_plane_location] = dml_use_mall_pstate_change_sub_viewport;
 					dml_dispcfg->plane.UseMALLForStaticScreen[disp_cfg_plane_location] = dml_use_mall_static_screen_optimize;
-				} else if (context->streams[i]->mall_stream_config.type == SUBVP_PHANTOM) {
+				} else if (stream_mall_type == SUBVP_PHANTOM) {
 					dml_dispcfg->plane.UseMALLForPStateChange[disp_cfg_plane_location] = dml_use_mall_pstate_change_phantom_pipe;
 					dml_dispcfg->plane.UseMALLForStaticScreen[disp_cfg_plane_location] = dml_use_mall_static_screen_disable;
 					dml2->v20.dml_core_ctx.policy.ImmediateFlipRequirement[disp_cfg_plane_location] = dml_immediate_flip_not_required;
@@ -1147,9 +1149,9 @@ void map_dc_state_into_dml_display_cfg(struct dml2_context *dml2, struct dc_stat
 						break;
 					}
 
-					if (context->streams[i]->mall_stream_config.type == SUBVP_MAIN)
+					if (stream_mall_type == SUBVP_MAIN)
 						dml_dispcfg->plane.UseMALLForPStateChange[disp_cfg_plane_location] = dml_use_mall_pstate_change_sub_viewport;
-					else if (context->streams[i]->mall_stream_config.type == SUBVP_PHANTOM)
+					else if (stream_mall_type == SUBVP_PHANTOM)
 						dml_dispcfg->plane.UseMALLForPStateChange[disp_cfg_plane_location] = dml_use_mall_pstate_change_phantom_pipe;
 
 					dml2->v20.scratch.dml_to_dc_pipe_mapping.disp_cfg_to_stream_id[disp_cfg_plane_location] = context->streams[i]->stream_id;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
index 814dbdcf9a78..9156e2ea55f5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c
@@ -279,6 +279,7 @@ static void populate_pipe_ctx_dlg_params_from_dml(struct pipe_ctx *pipe_ctx, str
 void dml2_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_state *context, struct resource_context *out_new_hw_state, struct dml2_context *in_ctx, unsigned int pipe_cnt)
 {
 	unsigned int dc_pipe_ctx_index, dml_pipe_idx, plane_id;
+	enum mall_stream_type pipe_mall_type;
 	bool unbounded_req_enabled = false;
 	struct dml2_calculate_rq_and_dlg_params_scratch *s = &in_ctx->v20.scratch.calculate_rq_and_dlg_params_scratch;
 
@@ -326,7 +327,8 @@ void dml2_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_state *cont
 		 */
 		populate_pipe_ctx_dlg_params_from_dml(&context->res_ctx.pipe_ctx[dc_pipe_ctx_index], &context->bw_ctx.dml2->v20.dml_core_ctx, dml_pipe_idx);
 
-		if (context->res_ctx.pipe_ctx[dc_pipe_ctx_index].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		pipe_mall_type = dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[dc_pipe_ctx_index]);
+		if (pipe_mall_type == SUBVP_PHANTOM) {
 			// Phantom pipe requires that DET_SIZE = 0 and no unbounded requests
 			context->res_ctx.pipe_ctx[dc_pipe_ctx_index].det_buffer_size_kb = 0;
 			context->res_ctx.pipe_ctx[dc_pipe_ctx_index].unbounded_req = false;
@@ -353,7 +355,7 @@ void dml2_calculate_rq_and_dlg_params(const struct dc *dc, struct dc_state *cont
 			context->res_ctx.pipe_ctx[dc_pipe_ctx_index].plane_state != context->res_ctx.pipe_ctx[dc_pipe_ctx_index].top_pipe->plane_state) &&
 			context->res_ctx.pipe_ctx[dc_pipe_ctx_index].prev_odm_pipe == NULL) {
 			/* SS: all active surfaces stored in MALL */
-			if (context->res_ctx.pipe_ctx[dc_pipe_ctx_index].stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			if (pipe_mall_type != SUBVP_PHANTOM) {
 				context->bw_ctx.bw.dcn.mall_ss_size_bytes += context->res_ctx.pipe_ctx[dc_pipe_ctx_index].surface_size_in_mall_bytes;
 			} else {
 				/* SUBVP: phantom surfaces only stored in MALL */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 9d354fde6908..638591ed057d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -418,7 +418,7 @@ static int find_drr_eligible_stream(struct dc_state *display_state)
 	int i;
 
 	for (i = 0; i < display_state->stream_count; i++) {
-		if (display_state->streams[i]->mall_stream_config.type == SUBVP_NONE
+		if (dc_state_get_stream_subvp_type(display_state, display_state->streams[i]) == SUBVP_NONE
 			&& display_state->streams[i]->ignore_msa_timing_param) {
 			// Use ignore_msa_timing_param flag to identify as DRR
 			return i;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
index 0de6886969c6..505a5d7ae20d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h
@@ -93,15 +93,31 @@ struct dml2_dc_callbacks {
 struct dml2_dc_svp_callbacks {
 	struct dc *dc;
 	bool (*build_scaling_params)(struct pipe_ctx *pipe_ctx);
-	struct dc_stream_state* (*create_stream_for_sink)(struct dc_sink *dc_sink_data);
-	struct dc_plane_state* (*create_plane)(struct dc *dc);
-	enum dc_status (*add_stream_to_ctx)(struct dc *dc, struct dc_state *new_ctx, struct dc_stream_state *dc_stream);
-	bool (*add_plane_to_context)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
-	bool (*remove_plane_from_context)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
-	enum dc_status (*remove_stream_from_ctx)(struct dc *dc, struct dc_state *new_ctx, struct dc_stream_state *stream);
-	void (*plane_state_release)(struct dc_plane_state *plane_state);
-	void (*stream_release)(struct dc_stream_state *stream);
+	struct dc_stream_state* (*create_phantom_stream)(const struct dc *dc,
+			struct dc_state *state,
+			struct dc_stream_state *main_stream);
+	struct dc_plane_state* (*create_phantom_plane)(struct dc *dc,
+			struct dc_state *state,
+			struct dc_plane_state *main_plane);
+	enum dc_status (*add_phantom_stream)(struct dc *dc,
+			struct dc_state *state,
+			struct dc_stream_state *phantom_stream,
+			struct dc_stream_state *main_stream);
+	bool (*add_phantom_plane)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
+	bool (*remove_phantom_plane)(const struct dc *dc, struct dc_stream_state *stream, struct dc_plane_state *plane_state, struct dc_state *context);
+	enum dc_status (*remove_phantom_stream)(struct dc *dc,
+			struct dc_state *state,
+			struct dc_stream_state *stream);
+	void (*release_phantom_plane)(const struct dc *dc,
+			struct dc_state *state,
+			struct dc_plane_state *plane);
+	void (*release_phantom_stream)(const struct dc *dc,
+			struct dc_state *state,
+			struct dc_stream_state *stream);
 	void (*release_dsc)(struct resource_context *res_ctx, const struct resource_pool *pool, struct display_stream_compressor **dsc);
+	enum mall_stream_type (*get_pipe_subvp_type)(const struct dc_state *state, const struct pipe_ctx *pipe_ctx);
+	enum mall_stream_type (*get_stream_subvp_type)(const struct dc_state *state, const struct dc_stream_state *stream);
+	struct dc_stream_state *(*get_paired_subvp_stream)(const struct dc_state *state, const struct dc_stream_state *stream);
 };
 
 struct dml2_clks_table_entry {
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
index abd780d92b6d..b0906105529b 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c
@@ -55,6 +55,7 @@
 #include "audio.h"
 #include "reg_helper.h"
 #include "panel_cntl.h"
+#include "dc_state_priv.h"
 #include "dpcd_defs.h"
 /* include DCE11 register header files */
 #include "dce/dce_11_0_d.h"
@@ -1595,7 +1596,7 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 	 * is constructed with the same sink). Make sure not to override
 	 * and link programming on the main.
 	 */
-	if (pipe_ctx->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+	if (dc_state_get_pipe_subvp_type(context, pipe_ctx) != SUBVP_PHANTOM) {
 		pipe_ctx->stream->link->psr_settings.psr_feature_enabled = false;
 		pipe_ctx->stream->link->replay_settings.replay_feature_enabled = false;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
index 0d9e41315f84..7ed5b5d714e1 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c
@@ -56,6 +56,7 @@
 #include "dc_trace.h"
 #include "dce/dmub_outbox.h"
 #include "link.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER \
 	dc_logger
@@ -115,7 +116,7 @@ void dcn10_lock_all_pipes(struct dc *dc,
 		    !pipe_ctx->stream ||
 		    (!pipe_ctx->plane_state && !old_pipe_ctx->plane_state) ||
 		    !tg->funcs->is_tg_enabled(tg) ||
-			pipe_ctx->stream->mall_stream_config.type == SUBVP_PHANTOM)
+			dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_PHANTOM)
 			continue;
 
 		if (lock)
@@ -1200,7 +1201,7 @@ void dcn10_plane_atomic_disconnect(struct dc *dc, struct pipe_ctx *pipe_ctx)
 	mpc->funcs->remove_mpcc(mpc, mpc_tree_params, mpcc_to_remove);
 	// Phantom pipes have OTG disabled by default, so MPCC_STATUS will never assert idle,
 	// so don't wait for MPCC_IDLE in the programming sequence
-	if (opp != NULL && !pipe_ctx->plane_state->is_phantom)
+	if (opp != NULL && dc_state_get_pipe_subvp_type(NULL, pipe_ctx) != SUBVP_PHANTOM)
 		opp->mpcc_disconnect_pending[pipe_ctx->plane_res.mpcc_inst] = true;
 
 	dc->optimized_required = true;
@@ -2276,7 +2277,7 @@ void dcn10_enable_timing_synchronization(
 	DC_SYNC_INFO("Setting up OTG reset trigger\n");
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && grouped_pipes[i]->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		opp = grouped_pipes[i]->stream_res.opp;
@@ -2296,14 +2297,14 @@ void dcn10_enable_timing_synchronization(
 		if (grouped_pipes[i]->stream == NULL)
 			continue;
 
-		if (grouped_pipes[i]->stream && grouped_pipes[i]->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream->vblank_synchronized = false;
 	}
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && grouped_pipes[i]->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream_res.tg->funcs->enable_reset_trigger(
@@ -2317,11 +2318,11 @@ void dcn10_enable_timing_synchronization(
 	 * synchronized. Look at last pipe programmed to reset.
 	 */
 
-	if (grouped_pipes[1]->stream && grouped_pipes[1]->stream->mall_stream_config.type != SUBVP_PHANTOM)
+	if (grouped_pipes[1]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[1]) != SUBVP_PHANTOM)
 		wait_for_reset_trigger_to_occur(dc_ctx, grouped_pipes[1]->stream_res.tg);
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && grouped_pipes[i]->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (grouped_pipes[i]->stream && dc_state_get_pipe_subvp_type(NULL, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		grouped_pipes[i]->stream_res.tg->funcs->disable_reset_trigger(
@@ -2329,7 +2330,7 @@ void dcn10_enable_timing_synchronization(
 	}
 
 	for (i = 1; i < group_size; i++) {
-		if (grouped_pipes[i]->stream && grouped_pipes[i]->stream->mall_stream_config.type == SUBVP_PHANTOM)
+		if (dc_state_get_pipe_subvp_type(state, grouped_pipes[i]) == SUBVP_PHANTOM)
 			continue;
 
 		opp = grouped_pipes[i]->stream_res.opp;
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
index 72c580ec650c..0c9f4ea109cb 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c
@@ -55,6 +55,7 @@
 #include "inc/link_enc_cfg.h"
 #include "link_hwss.h"
 #include "link.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER \
 	dc_logger
@@ -625,7 +626,7 @@ void dcn20_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx)
 
 void dcn20_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
 {
-	bool is_phantom = pipe_ctx->plane_state && pipe_ctx->plane_state->is_phantom;
+	bool is_phantom = dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_PHANTOM;
 	struct timing_generator *tg = is_phantom ? pipe_ctx->stream_res.tg : NULL;
 
 	DC_LOGGER_INIT(dc->ctx->logger);
@@ -847,7 +848,7 @@ enum dc_status dcn20_enable_stream_timing(
 	/* TODO enable stream if timing changed */
 	/* TODO unblank stream if DP */
 
-	if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+	if (pipe_ctx->stream && dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_PHANTOM) {
 		if (pipe_ctx->stream_res.tg && pipe_ctx->stream_res.tg->funcs->phantom_crtc_post_enable)
 			pipe_ctx->stream_res.tg->funcs->phantom_crtc_post_enable(pipe_ctx->stream_res.tg);
 	}
@@ -1370,6 +1371,9 @@ void dcn20_pipe_control_lock(
 
 static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx *new_pipe)
 {
+	bool old_is_phantom = dc_state_get_pipe_subvp_type(NULL, old_pipe) == SUBVP_PHANTOM;
+	bool new_is_phantom = dc_state_get_pipe_subvp_type(NULL, new_pipe) == SUBVP_PHANTOM;
+
 	new_pipe->update_flags.raw = 0;
 
 	/* If non-phantom pipe is being transitioned to a phantom pipe,
@@ -1379,8 +1383,8 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 	 * be different). The post_unlock sequence will set the correct
 	 * update flags to enable the phantom pipe.
 	 */
-	if (old_pipe->plane_state && !old_pipe->plane_state->is_phantom &&
-			new_pipe->plane_state && new_pipe->plane_state->is_phantom) {
+	if (old_pipe->plane_state && !old_is_phantom &&
+			new_pipe->plane_state && new_is_phantom) {
 		new_pipe->update_flags.bits.disable = 1;
 		return;
 	}
@@ -1416,14 +1420,14 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 	 * The remove-add sequence of the phantom pipe always results in the pipe
 	 * being blanked in enable_stream_timing (DPG).
 	 */
-	if (new_pipe->stream && new_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM)
+	if (new_pipe->stream && dc_state_get_pipe_subvp_type(NULL, new_pipe) == SUBVP_PHANTOM)
 		new_pipe->update_flags.bits.enable = 1;
 
 	/* Phantom pipes are effectively disabled, if the pipe was previously phantom
 	 * we have to enable
 	 */
-	if (old_pipe->plane_state && old_pipe->plane_state->is_phantom &&
-			new_pipe->plane_state && !new_pipe->plane_state->is_phantom)
+	if (old_pipe->plane_state && old_is_phantom &&
+			new_pipe->plane_state && !new_is_phantom)
 		new_pipe->update_flags.bits.enable = 1;
 
 	if (old_pipe->plane_state && !new_pipe->plane_state) {
@@ -1560,6 +1564,7 @@ static void dcn20_update_dchubp_dpp(
 	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
 	struct dccg *dccg = dc->res_pool->dccg;
 	bool viewport_changed = false;
+	enum mall_stream_type pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe_ctx);
 
 	if (pipe_ctx->update_flags.bits.dppclk)
 		dpp->funcs->dpp_dppclk_control(dpp, false, true);
@@ -1705,7 +1710,7 @@ static void dcn20_update_dchubp_dpp(
 		pipe_ctx->update_flags.bits.plane_changed ||
 		plane_state->update_flags.bits.addr_update) {
 		if (resource_is_pipe_type(pipe_ctx, OTG_MASTER) &&
-				pipe_ctx->stream->mall_stream_config.type == SUBVP_MAIN) {
+				pipe_mall_type == SUBVP_MAIN) {
 			union block_sequence_params params;
 
 			params.subvp_save_surf_addr.dc_dmub_srv = dc->ctx->dmub_srv;
@@ -1719,7 +1724,7 @@ static void dcn20_update_dchubp_dpp(
 	if (pipe_ctx->update_flags.bits.enable)
 		hubp->funcs->set_blank(hubp, false);
 	/* If the stream paired with this plane is phantom, the plane is also phantom */
-	if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.type == SUBVP_PHANTOM
+	if (pipe_ctx->stream && pipe_mall_type == SUBVP_PHANTOM
 			&& hubp->funcs->phantom_hubp_post_enable)
 		hubp->funcs->phantom_hubp_post_enable(hubp);
 }
@@ -1926,15 +1931,16 @@ void dcn20_program_front_end_for_ctx(
 		struct dc_stream_state *stream = dc->current_state->res_ctx.pipe_ctx[i].stream;
 
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable && stream &&
-			dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				dc_state_get_pipe_subvp_type(dc->current_state, &dc->current_state->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM) {
 			struct timing_generator *tg = dc->current_state->res_ctx.pipe_ctx[i].stream_res.tg;
 
 			if (tg->funcs->enable_crtc) {
 				if (dc->hwss.blank_phantom) {
 					int main_pipe_width, main_pipe_height;
+					struct dc_stream_state *phantom_stream = dc_state_get_paired_subvp_stream(dc->current_state, dc->current_state->res_ctx.pipe_ctx[i].stream);
 
-					main_pipe_width = dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.paired_stream->dst.width;
-					main_pipe_height = dc->current_state->res_ctx.pipe_ctx[i].stream->mall_stream_config.paired_stream->dst.height;
+					main_pipe_width = phantom_stream->dst.width;
+					main_pipe_height = phantom_stream->dst.height;
 					dc->hwss.blank_phantom(dc, tg, main_pipe_width, main_pipe_height);
 				}
 				tg->funcs->enable_crtc(tg);
@@ -1963,7 +1969,7 @@ void dcn20_program_front_end_for_ctx(
 			 * DET allocation.
 			 */
 			if (hubbub->funcs->program_det_size && (context->res_ctx.pipe_ctx[i].update_flags.bits.disable ||
-					(context->res_ctx.pipe_ctx[i].plane_state && context->res_ctx.pipe_ctx[i].plane_state->is_phantom)))
+					(context->res_ctx.pipe_ctx[i].plane_state && dc_state_get_pipe_subvp_type(context, &context->res_ctx.pipe_ctx[i]) == SUBVP_PHANTOM)))
 				hubbub->funcs->program_det_size(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
 			hws->funcs.plane_atomic_disconnect(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
 			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
@@ -1988,7 +1994,7 @@ void dcn20_program_front_end_for_ctx(
 					 * but the MPO still exists until the double buffered update of the main pipe so we
 					 * will get a frame of underflow if the phantom pipe is programmed here.
 					 */
-					if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_PHANTOM)
+					if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM)
 						dcn20_program_pipe(dc, pipe, context);
 				}
 
@@ -2050,7 +2056,7 @@ void dcn20_post_unlock_program_front_end(
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		// Don't check flip pending on phantom pipes
 		if (pipe->plane_state && !pipe->top_pipe && pipe->update_flags.bits.enable &&
-				pipe->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+				dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_PHANTOM) {
 			struct hubp *hubp = pipe->plane_res.hubp;
 			int j = 0;
 			for (j = 0; j < TIMEOUT_FOR_PIPE_ENABLE_US / polling_interval_us
@@ -2073,7 +2079,7 @@ void dcn20_post_unlock_program_front_end(
 			 * programming sequence).
 			 */
 			while (pipe) {
-				if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 					/* When turning on the phantom pipe we want to run through the
 					 * entire enable sequence, so apply all the "enable" flags.
 					 */
@@ -2143,7 +2149,7 @@ void dcn20_prepare_bandwidth(
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		// At optimize don't restore the original watermark value
-		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
+		if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_NONE) {
 			context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 4U * 1000U * 1000U * 1000U;
 			break;
 		}
@@ -2187,7 +2193,7 @@ void dcn20_optimize_bandwidth(
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		// At optimize don't need  to restore the original watermark value
-		if (pipe->stream && pipe->stream->mall_stream_config.type != SUBVP_NONE) {
+		if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) != SUBVP_NONE) {
 			context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 4U * 1000U * 1000U * 1000U;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
index d337578d7e73..327c227a10ea 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c
@@ -51,7 +51,7 @@
 #include "dcn20/dcn20_hwseq.h"
 #include "dcn30/dcn30_resource.h"
 #include "link.h"
-
+#include "dc_state_priv.h"
 
 
 
@@ -966,7 +966,7 @@ void dcn30_hardware_release(struct dc *dc)
 		if (!pipe->stream)
 			continue;
 
-		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+		if (dc_state_get_pipe_subvp_type(dc->current_state, pipe) == SUBVP_MAIN) {
 			subvp_in_use = true;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 92fe06870e3a..a6214b5b6d63 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@ -51,6 +51,7 @@
 #include "dcn32/dcn32_resource.h"
 #include "link.h"
 #include "../dcn20/dcn20_hwseq.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -349,7 +350,7 @@ void dcn32_commit_subvp_config(struct dc *dc, struct dc_state *context)
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
 		if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.paired_stream &&
-				pipe_ctx->stream->mall_stream_config.type == SUBVP_MAIN) {
+				dc_state_get_pipe_subvp_type(context, pipe_ctx) == SUBVP_MAIN) {
 			// There is at least 1 SubVP pipe, so enable SubVP
 			enable_subvp = true;
 			break;
@@ -375,18 +376,20 @@ void dcn32_subvp_pipe_control_lock(struct dc *dc,
 	bool subvp_immediate_flip = false;
 	bool subvp_in_use = false;
 	struct pipe_ctx *pipe;
+	enum mall_stream_type pipe_mall_type = SUBVP_NONE;
 
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		pipe = &context->res_ctx.pipe_ctx[i];
+		pipe_mall_type = dc_state_get_pipe_subvp_type(context, pipe);
 
-		if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+		if (pipe->stream && pipe->plane_state && pipe_mall_type == SUBVP_MAIN) {
 			subvp_in_use = true;
 			break;
 		}
 	}
 
 	if (top_pipe_to_program && top_pipe_to_program->stream && top_pipe_to_program->plane_state) {
-		if (top_pipe_to_program->stream->mall_stream_config.type == SUBVP_MAIN &&
+		if (dc_state_get_pipe_subvp_type(context, top_pipe_to_program) == SUBVP_MAIN &&
 				top_pipe_to_program->plane_state->flip_immediate)
 			subvp_immediate_flip = true;
 	}
@@ -398,7 +401,7 @@ void dcn32_subvp_pipe_control_lock(struct dc *dc,
 		if (!lock) {
 			for (i = 0; i < dc->res_pool->pipe_count; i++) {
 				pipe = &context->res_ctx.pipe_ctx[i];
-				if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN &&
+				if (pipe->stream && pipe->plane_state && pipe_mall_type == SUBVP_MAIN &&
 						should_lock_all_pipes)
 					pipe->stream_res.tg->funcs->wait_for_state(pipe->stream_res.tg, CRTC_STATE_VBLANK);
 			}
@@ -420,7 +423,7 @@ void dcn32_subvp_pipe_control_lock_fast(union block_sequence_params *params)
 	bool subvp_immediate_flip = false;
 
 	if (pipe_ctx && pipe_ctx->stream && pipe_ctx->plane_state) {
-		if (pipe_ctx->stream->mall_stream_config.type == SUBVP_MAIN &&
+		if (dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_MAIN &&
 				pipe_ctx->plane_state->flip_immediate)
 			subvp_immediate_flip = true;
 	}
@@ -609,7 +612,7 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		struct hubp *hubp = pipe->plane_res.hubp;
 
-		if (!pipe->stream || !(pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
+		if (!pipe->stream || !(dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN ||
 		    pipe->stream->fpo_in_use)) {
 			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
 				hubp->funcs->hubp_update_force_pstate_disallow(hubp, false);
@@ -624,7 +627,7 @@ void dcn32_update_force_pstate(struct dc *dc, struct dc_state *context)
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		struct hubp *hubp = pipe->plane_res.hubp;
 
-		if (pipe->stream && (pipe->stream->mall_stream_config.type == SUBVP_MAIN ||
+		if (pipe->stream && (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN ||
 				pipe->stream->fpo_in_use)) {
 			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
 				hubp->funcs->hubp_update_force_pstate_disallow(hubp, true);
@@ -671,8 +674,8 @@ void dcn32_update_mall_sel(struct dc *dc, struct dc_state *context)
 			if (cursor_size > 16384)
 				cache_cursor = true;
 
-			if (pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
-					hubp->funcs->hubp_update_mall_sel(hubp, 1, false);
+			if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
+				hubp->funcs->hubp_update_mall_sel(hubp, 1, false);
 			} else {
 				// MALL not supported with Stereo3D
 				hubp->funcs->hubp_update_mall_sel(hubp,
@@ -714,9 +717,8 @@ void dcn32_program_mall_pipe_config(struct dc *dc, struct dc_state *context)
 			 *        see if CURSOR_REQ_MODE will be back to 1 for SubVP
 			 *        when it should be 0 for MPO
 			 */
-			if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			if (dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN)
 				hubp->funcs->hubp_prepare_subvp_buffering(hubp, true);
-			}
 		}
 	}
 }
@@ -1222,7 +1224,7 @@ void dcn32_resync_fifo_dccg_dio(struct dce_hwseq *hws, struct dc *dc, struct dc_
 			continue;
 
 		if ((pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))
-			&& pipe->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+			&& dc_state_get_pipe_subvp_type(dc->current_state, pipe) != SUBVP_PHANTOM) {
 			pipe->stream_res.tg->funcs->disable_crtc(pipe->stream_res.tg);
 			reset_sync_context_for_pipe(dc, context, i);
 			otg_disabled[i] = true;
@@ -1373,7 +1375,7 @@ void dcn32_update_phantom_vp_position(struct dc *dc,
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_MAIN &&
+		if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_MAIN &&
 				pipe->stream->mall_stream_config.paired_stream == phantom_pipe->stream) {
 			if (pipe->plane_state && pipe->plane_state->update_flags.bits.position_change) {
 
@@ -1399,7 +1401,7 @@ void dcn32_update_phantom_vp_position(struct dc *dc,
 void dcn32_apply_update_flags_for_phantom(struct pipe_ctx *phantom_pipe)
 {
 	phantom_pipe->update_flags.raw = 0;
-	if (phantom_pipe->stream && phantom_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+	if (dc_state_get_pipe_subvp_type(NULL, phantom_pipe) == SUBVP_PHANTOM) {
 		if (resource_is_pipe_type(phantom_pipe, DPP_PIPE)) {
 			phantom_pipe->update_flags.bits.enable = 1;
 			phantom_pipe->update_flags.bits.mpcc = 1;
@@ -1485,8 +1487,8 @@ void dcn32_enable_phantom_streams(struct dc *dc, struct dc_state *context)
 		 * pipe, wait for the double buffer update to complete first before we do
 		 * ANY phantom pipe programming.
 		 */
-		if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM &&
-				old_pipe->stream && old_pipe->stream->mall_stream_config.type != SUBVP_PHANTOM) {
+		if (pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM &&
+				old_pipe->stream && dc_state_get_pipe_subvp_type(dc->current_state, old_pipe) != SUBVP_PHANTOM) {
 			old_pipe->stream_res.tg->funcs->wait_for_state(
 					old_pipe->stream_res.tg,
 					CRTC_STATE_VBLANK);
@@ -1498,7 +1500,7 @@ void dcn32_enable_phantom_streams(struct dc *dc, struct dc_state *context)
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *new_pipe = &context->res_ctx.pipe_ctx[i];
 
-		if (new_pipe->stream && new_pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (new_pipe->stream && dc_state_get_pipe_subvp_type(context, new_pipe) == SUBVP_PHANTOM) {
 			// If old context or new context has phantom pipes, apply
 			// the phantom timings now. We can't change the phantom
 			// pipe configuration safely without driver acquiring
diff --git a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
index f48001317fab..56a4bc476684 100644
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c
@@ -56,6 +56,7 @@
 #include "dcn30/dcn30_cm_common.h"
 #include "dcn31/dcn31_hwseq.h"
 #include "dcn20/dcn20_hwseq.h"
+#include "dc_state_priv.h"
 
 #define DC_LOGGER_INIT(logger) \
 	struct dal_logger *dc_logger = logger
@@ -948,7 +949,7 @@ void dcn35_plane_atomic_disable(struct dc *dc, struct pipe_ctx *pipe_ctx)
 void dcn35_disable_plane(struct dc *dc, struct pipe_ctx *pipe_ctx)
 {
 	struct dce_hwseq *hws = dc->hwseq;
-	bool is_phantom = pipe_ctx->plane_state && pipe_ctx->plane_state->is_phantom;
+	bool is_phantom = dc_state_get_pipe_subvp_type(NULL, pipe_ctx) == SUBVP_PHANTOM;
 	struct timing_generator *tg = is_phantom ? pipe_ctx->stream_res.tg : NULL;
 
 	DC_LOGGER_INIT(dc->ctx->logger);
diff --git a/drivers/gpu/drm/amd/display/dc/inc/resource.h b/drivers/gpu/drm/amd/display/dc/inc/resource.h
index 0458d2d749f4..c7a00a28c3b0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/resource.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/resource.h
@@ -622,5 +622,4 @@ enum dc_status update_dp_encoder_resources_for_test_harness(const struct dc *dc,
 		struct pipe_ctx *pipe_ctx);
 
 bool check_subvp_sw_cursor_fallback_req(const struct dc *dc, struct dc_stream_state *stream);
-
 #endif /* DRIVERS_GPU_DRM_AMD_DC_DEV_DC_INC_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index f6cbcc9b4006..dbcb9c5ea9af 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -89,6 +89,8 @@
 #include "dcn20/dcn20_vmid.h"
 #include "dml/dcn32/dcn32_fpu.h"
 
+#include "dc_state_priv.h"
+
 #include "dml2/dml2_wrapper.h"
 
 #define DC_LOGGER_INIT(logger)
@@ -1644,7 +1646,7 @@ static void dcn32_enable_phantom_plane(struct dc *dc,
 		if (curr_pipe->top_pipe && curr_pipe->top_pipe->plane_state == curr_pipe->plane_state)
 			phantom_plane = prev_phantom_plane;
 		else
-			phantom_plane = dc_create_plane_state(dc);
+			phantom_plane = dc_state_create_phantom_plane(dc, context, curr_pipe->plane_state);
 
 		memcpy(&phantom_plane->address, &curr_pipe->plane_state->address, sizeof(phantom_plane->address));
 		memcpy(&phantom_plane->scaling_quality, &curr_pipe->plane_state->scaling_quality,
@@ -1665,9 +1667,7 @@ static void dcn32_enable_phantom_plane(struct dc *dc,
 		phantom_plane->clip_rect.y = 0;
 		phantom_plane->clip_rect.height = phantom_stream->src.height;
 
-		phantom_plane->is_phantom = true;
-
-		dc_add_plane_to_context(dc, phantom_stream, phantom_plane, context);
+		dc_state_add_phantom_plane(dc, phantom_stream, phantom_plane, context);
 
 		curr_pipe = curr_pipe->bottom_pipe;
 		prev_phantom_plane = phantom_plane;
@@ -1683,13 +1683,7 @@ static struct dc_stream_state *dcn32_enable_phantom_stream(struct dc *dc,
 	struct dc_stream_state *phantom_stream = NULL;
 	struct pipe_ctx *ref_pipe = &context->res_ctx.pipe_ctx[dc_pipe_idx];
 
-	phantom_stream = dc_create_stream_for_sink(ref_pipe->stream->sink);
-	phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
-	phantom_stream->dpms_off = true;
-	phantom_stream->mall_stream_config.type = SUBVP_PHANTOM;
-	phantom_stream->mall_stream_config.paired_stream = ref_pipe->stream;
-	ref_pipe->stream->mall_stream_config.type = SUBVP_MAIN;
-	ref_pipe->stream->mall_stream_config.paired_stream = phantom_stream;
+	phantom_stream = dc_state_create_phantom_stream(dc, context, ref_pipe->stream);
 
 	/* stream has limited viewport and small timing */
 	memcpy(&phantom_stream->timing, &ref_pipe->stream->timing, sizeof(phantom_stream->timing));
@@ -1699,7 +1693,7 @@ static struct dc_stream_state *dcn32_enable_phantom_stream(struct dc *dc,
 	dcn32_set_phantom_stream_timing(dc, context, ref_pipe, phantom_stream, pipes, pipe_cnt, dc_pipe_idx);
 	DC_FP_END();
 
-	dc_add_stream_to_ctx(dc, context, phantom_stream);
+	dc_state_add_phantom_stream(dc, context, phantom_stream, ref_pipe->stream);
 	return phantom_stream;
 }
 
@@ -1714,7 +1708,7 @@ void dcn32_retain_phantom_pipes(struct dc *dc, struct dc_state *context)
 
 		if (resource_is_pipe_type(pipe, OTG_MASTER) &&
 				resource_is_pipe_type(pipe, DPP_PIPE) &&
-				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			phantom_plane = pipe->plane_state;
 			phantom_stream = pipe->stream;
 
@@ -1735,41 +1729,33 @@ bool dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context, bool fa
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 		// build scaling params for phantom pipes
-		if (pipe->plane_state && pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+		if (pipe->plane_state && pipe->stream && dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			phantom_plane = pipe->plane_state;
 			phantom_stream = pipe->stream;
 
-			dc_rem_all_planes_for_stream(dc, pipe->stream, context);
-			dc_remove_stream_from_ctx(dc, context, pipe->stream);
+			dc_state_rem_all_planes_for_stream(dc, pipe->stream, context);
+
+			/* For non-full updates, a shallow copy of the current state
+			 * is created. In this case we don't want to erase the current
+			 * state (there can be 2 HIRQL threads, one in flip, and one in
+			 * checkMPO) that can cause a race condition.
+			 *
+			 * This is just a workaround, needs a proper fix.
+			 */
+			if (!fast_update)
+				dc_state_remove_phantom_stream(dc, context, pipe->stream);
+			else
+				dc_state_remove_stream(dc, context, pipe->stream);
 
 			/* Ref count is incremented on allocation and also when added to the context.
 			 * Therefore we must call release for the the phantom plane and stream once
 			 * they are removed from the ctx to finally decrement the refcount to 0 to free.
 			 */
-			dc_plane_state_release(phantom_plane);
-			dc_stream_release(phantom_stream);
+			dc_state_release_phantom_plane(dc, context, phantom_plane);
+			dc_state_release_phantom_stream(dc, context, phantom_stream);
 
 			removed_pipe = true;
 		}
-
-		/* For non-full updates, a shallow copy of the current state
-		 * is created. In this case we don't want to erase the current
-		 * state (there can be 2 HIRQL threads, one in flip, and one in
-		 * checkMPO) that can cause a race condition.
-		 *
-		 * This is just a workaround, needs a proper fix.
-		 */
-		if (!fast_update) {
-			// Clear all phantom stream info
-			if (pipe->stream) {
-				pipe->stream->mall_stream_config.type = SUBVP_NONE;
-				pipe->stream->mall_stream_config.paired_stream = NULL;
-			}
-
-			if (pipe->plane_state) {
-				pipe->plane_state->is_phantom = false;
-			}
-		}
 	}
 	return removed_pipe;
 }
@@ -1798,7 +1784,7 @@ void dcn32_add_phantom_pipes(struct dc *dc, struct dc_state *context,
 		// We determine which phantom pipes were added by comparing with
 		// the phantom stream.
 		if (pipe->plane_state && pipe->stream && pipe->stream == phantom_stream &&
-				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+				dc_state_get_pipe_subvp_type(context, pipe) == SUBVP_PHANTOM) {
 			pipe->stream->use_dynamic_meta = false;
 			pipe->plane_state->flip_immediate = false;
 			if (!resource_build_scaling_params(pipe)) {
@@ -1933,7 +1919,7 @@ int dcn32_populate_dml_pipes_from_context(
 		 * This is just a workaround -- needs a proper fix.
 		 */
 		if (!fast_validate) {
-			switch (pipe->stream->mall_stream_config.type) {
+			switch (dc_state_get_pipe_subvp_type(context, pipe)) {
 			case SUBVP_MAIN:
 				pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_sub_viewport;
 				subvp_in_use = true;
@@ -2454,16 +2440,19 @@ static bool dcn32_resource_construct(
 	dc->dml2_options.callbacks.get_opp_head = &resource_get_opp_head;
 
 	dc->dml2_options.svp_pstate.callbacks.dc = dc;
-	dc->dml2_options.svp_pstate.callbacks.add_plane_to_context = &dc_add_plane_to_context;
-	dc->dml2_options.svp_pstate.callbacks.add_stream_to_ctx = &dc_add_stream_to_ctx;
+	dc->dml2_options.svp_pstate.callbacks.add_phantom_plane = &dc_state_add_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.add_phantom_stream = &dc_state_add_phantom_stream;
 	dc->dml2_options.svp_pstate.callbacks.build_scaling_params = &resource_build_scaling_params;
-	dc->dml2_options.svp_pstate.callbacks.create_plane = &dc_create_plane_state;
-	dc->dml2_options.svp_pstate.callbacks.remove_plane_from_context = &dc_remove_plane_from_context;
-	dc->dml2_options.svp_pstate.callbacks.remove_stream_from_ctx = &dc_remove_stream_from_ctx;
-	dc->dml2_options.svp_pstate.callbacks.create_stream_for_sink = &dc_create_stream_for_sink;
-	dc->dml2_options.svp_pstate.callbacks.plane_state_release = &dc_plane_state_release;
-	dc->dml2_options.svp_pstate.callbacks.stream_release = &dc_stream_release;
+	dc->dml2_options.svp_pstate.callbacks.create_phantom_plane = &dc_state_create_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.remove_phantom_plane = &dc_state_remove_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.remove_phantom_stream = &dc_state_remove_phantom_stream;
+	dc->dml2_options.svp_pstate.callbacks.create_phantom_stream = &dc_state_create_phantom_stream;
+	dc->dml2_options.svp_pstate.callbacks.release_phantom_plane = &dc_state_release_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.release_phantom_stream = &dc_state_release_phantom_stream;
 	dc->dml2_options.svp_pstate.callbacks.release_dsc = &dcn20_release_dsc;
+	dc->dml2_options.svp_pstate.callbacks.get_pipe_subvp_type = &dc_state_get_pipe_subvp_type;
+	dc->dml2_options.svp_pstate.callbacks.get_stream_subvp_type = &dc_state_get_stream_subvp_type;
+	dc->dml2_options.svp_pstate.callbacks.get_paired_subvp_stream = &dc_state_get_paired_subvp_stream;
 
 	dc->dml2_options.svp_pstate.subvp_fw_processing_delay_us = dc->caps.subvp_fw_processing_delay_us;
 	dc->dml2_options.svp_pstate.subvp_prefetch_end_to_mall_start_us = dc->caps.subvp_prefetch_end_to_mall_start_us;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
index 12986fe0b289..8c278c2fd287 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn321/dcn321_resource.c
@@ -92,6 +92,8 @@
 #include "vm_helper.h"
 #include "dcn20/dcn20_vmid.h"
 
+#include "dc_state_priv.h"
+
 #define DC_LOGGER_INIT(logger)
 
 enum dcn321_clk_src_array_id {
@@ -2008,16 +2010,19 @@ static bool dcn321_resource_construct(
 	dc->dml2_options.callbacks.get_opp_head = &resource_get_opp_head;
 
 	dc->dml2_options.svp_pstate.callbacks.dc = dc;
-	dc->dml2_options.svp_pstate.callbacks.add_plane_to_context = &dc_add_plane_to_context;
-	dc->dml2_options.svp_pstate.callbacks.add_stream_to_ctx = &dc_add_stream_to_ctx;
+	dc->dml2_options.svp_pstate.callbacks.add_phantom_plane = &dc_state_add_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.add_phantom_stream = &dc_state_add_phantom_stream;
 	dc->dml2_options.svp_pstate.callbacks.build_scaling_params = &resource_build_scaling_params;
-	dc->dml2_options.svp_pstate.callbacks.create_plane = &dc_create_plane_state;
-	dc->dml2_options.svp_pstate.callbacks.remove_plane_from_context = &dc_remove_plane_from_context;
-	dc->dml2_options.svp_pstate.callbacks.remove_stream_from_ctx = &dc_remove_stream_from_ctx;
-	dc->dml2_options.svp_pstate.callbacks.create_stream_for_sink = &dc_create_stream_for_sink;
-	dc->dml2_options.svp_pstate.callbacks.plane_state_release = &dc_plane_state_release;
-	dc->dml2_options.svp_pstate.callbacks.stream_release = &dc_stream_release;
+	dc->dml2_options.svp_pstate.callbacks.create_phantom_plane = &dc_state_create_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.remove_phantom_plane = &dc_state_remove_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.remove_phantom_stream = &dc_state_remove_phantom_stream;
+	dc->dml2_options.svp_pstate.callbacks.create_phantom_stream = &dc_state_create_phantom_stream;
+	dc->dml2_options.svp_pstate.callbacks.release_phantom_plane = &dc_state_release_phantom_plane;
+	dc->dml2_options.svp_pstate.callbacks.release_phantom_stream = &dc_state_release_phantom_stream;
 	dc->dml2_options.svp_pstate.callbacks.release_dsc = &dcn20_release_dsc;
+	dc->dml2_options.svp_pstate.callbacks.get_pipe_subvp_type = &dc_state_get_pipe_subvp_type;
+	dc->dml2_options.svp_pstate.callbacks.get_stream_subvp_type = &dc_state_get_stream_subvp_type;
+	dc->dml2_options.svp_pstate.callbacks.get_paired_subvp_stream = &dc_state_get_paired_subvp_stream;
 
 	dc->dml2_options.svp_pstate.subvp_fw_processing_delay_us = dc->caps.subvp_fw_processing_delay_us;
 	dc->dml2_options.svp_pstate.subvp_prefetch_end_to_mall_start_us = dc->caps.subvp_prefetch_end_to_mall_start_us;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 04225cdc1904..1aa4649fdc35 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -102,6 +102,8 @@
 #include "vm_helper.h"
 #include "dcn20/dcn20_vmid.h"
 
+#include "dc_state_priv.h"
+
 #include "link_enc_cfg.h"
 #define DC_LOGGER_INIT(logger)
 
-- 
2.37.3

