Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4552339C9
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jul 2020 22:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51766E96B;
	Thu, 30 Jul 2020 20:37:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4C96E0C8;
 Thu, 30 Jul 2020 20:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO/el5Z5UhIAr9XJqwy+qmkjkysOshxOZjJv7kB/5s+0ry8i3m3SQbLvs0e6bOpQOLVjalKTYz5doLunAkWMqBWl4fwsCDbQ4S6AvbfavgDJvLJDe9Z4zW9OGuHxMfTd41aKr/RNXbtF4DisQhGW9zLfFDu+6kVQMkctfSnxsfvKrj4Pg/4gVNi+BmfQ/DxpNfG9u+okC7RuPPCsL8j+A1Yz41L0UE3DeAGkghWW0QGqRfDaYdwt5MjEJX6ZcPeZ5/FwRYwNbzFbMWV1eJ8SbUEQQJXWxfWyuA5aWMF4wNjkDpGkygFPmIsVTeKZRuPGrFM/CborXet4Rs7KpRm/xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRcDpzrx1GdvXLid4GswdjbjTWC5q+QSK7RdGIU+gdA=;
 b=m5n7aZR+lTzaMBuGKmPUhPhKo5sVd0ExazbPo8VeH4YJrevJ1xvzRqN3yPNfCotC1ZoKd2k9GCpI/DJ52+SWUviM2vWS7DFN98Mhn70E5AKtnCidkQb0e7EwOmzrbeqrdv+a003d/uBRymf4BNFlUk9Cwf0BZwpmOmcyfdHgcKQDZstxIwYZPDJZzk6SXsBJcRxPyvXqdqRwAFe1gDyWZMCPbgTF+Iyj/aqVPwXQLd1+tL9msngha0zzTngOrgW6C61xFjU9goTLVC+p6b+a8FXDtSnf9lB2X3lC7m9T9c2DcJuucmVLfg/d8/vud/OZGztZQIMAKGnb8P+qfVUlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRcDpzrx1GdvXLid4GswdjbjTWC5q+QSK7RdGIU+gdA=;
 b=pu0bsD1a4jKBPxxgJhNDKmmpaSs2PgLpZbSmhRYubtcmWcZm5BQYi/U5gYyDqWJ4w2HDlmmCxBxgceoo9C/hGWI59uIYcQnMUa9EtLmZ9RDdyxP25fRPANph12rq4f1GpMa+wZXj1FkXcKiiXtA126+ZaDx90uLW5Cqjwi3LJnQ=
Received: from CO2PR04CA0126.namprd04.prod.outlook.com (2603:10b6:104:7::28)
 by CY4PR12MB1894.namprd12.prod.outlook.com (2603:10b6:903:128::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Thu, 30 Jul
 2020 20:37:35 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::62) by CO2PR04CA0126.outlook.office365.com
 (2603:10b6:104:7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.20 via Frontend Transport; Thu, 30 Jul 2020 20:37:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:33 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:33 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:33 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 7/7] drm/amd/display: Replace DRM private objects with
 subclassed DRM atomic state
Date: Thu, 30 Jul 2020 16:36:42 -0400
Message-ID: <20200730203642.17553-8-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f59ba684-3471-40ba-d1cb-08d834c8641a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1894:
X-Microsoft-Antispam-PRVS: <CY4PR12MB189479F04DFD1DB76766BD45EC710@CY4PR12MB1894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VzsVFnJ3Z7wa+f1bC+o8fTfCxIBXCX7FaTCSvC7WLlXD2PQUjHud+g5zMnXm/CtoaKma76j9Hv9zQQbD9clk1Oqa4bNI1wVBVHtVPtu5AcAZS8cqZ971h1Bu+O1spWAC+aZ5oLAhQFx0nqXPfC2bTnxIdJc6LPSaKKINassl3aSAqtpZVoqy0S5ZMeROSWlcBER3P9daZZVMSbehZ/XEfhQTaSiP2xQtBZbJGc6vgBW5gczfaDeIerkUq4mmoVUHnrPloFr7R1O3QTunO9lHoxB0GrnpzAr85ih2i6h8GTM0V0/4PccGNkd/EQP24aX0dOqHnwKYjHwGMm1yXOcrKIoryfBh2WVIO/opGJ1XPUZvka+BhB2H4/qRJgpS6Zj30RGrV6kGXZ5RlIMj0PUYAQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(86362001)(70586007)(83380400001)(81166007)(54906003)(26005)(47076004)(316002)(70206006)(6666004)(110136005)(82740400003)(44832011)(8936002)(36756003)(1076003)(356005)(4326008)(186003)(82310400002)(2906002)(426003)(336012)(478600001)(5660300002)(2616005)(30864003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:34.8898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f59ba684-3471-40ba-d1cb-08d834c8641a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1894
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
DM atomic check was structured in a way that we required old DC state
in order to dynamically add and remove planes and streams from the
context to build the DC state context for validation.

DRM private objects were used to carry over the last DC state and
were added to the context on nearly every commit - regardless of fast
or full so we could check whether or not the new state could affect
bandwidth.

The problem with this model is that DRM private objects do not
implicitly stall out other commits.

So if you have two commits touching separate DRM objects they could
run concurrently and potentially execute out of order - leading to a
use-after-free.

If we want this to be safe we have two options:
1. Stall out concurrent commits since they touch the same private object
2. Refactor DM to not require old DC state and drop private object usage

[How]
This implements approach #2 since it still allows for judder free
updates in multi-display scenarios.

I'll list the big changes in order at a high level:

1. Subclass DRM atomic state instead of using DRM private objects.

DC relied on the old state to determine which changes cause bandwidth
updates but now we have DM perform similar checks based on DRM state
instead - dropping the requirement for old state to exist at all.

This means that we can now build a new DC context from scratch whenever
we have something that DM thinks could affect bandwidth.

Whenever we need to rebuild bandwidth we now add all CRTCs and planes
to the DRM state in order to get the absolute set of DC streams and
DC planes.

This introduces a stall on other commits, but this stall already
exists because of the lock_and_validation logic and it's necessary
since updates may move around pipes and require full reprogramming.

2. Drop workarounds to add planes to maintain z-order early in atomic
check. This is no longer needed because of the changes for (1).

This also involves fixing up should_plane_reset checks since we can just
avoid resetting streams and planes when they haven't actually changed.

3. Rework dm_update_crtc_state and dm_update_plane_state to be single
pass instead of two pass.

This is necessary since we no longer have the dc_state to add and
remove planes to the context in and we want to defer creation to the
end of commit_check.

It also makes the logic a lot simpler to follow since as an added bonus.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 720 +++++++-----------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  11 +-
 2 files changed, 280 insertions(+), 451 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 59829ec81694..97a7dfc620e8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1839,7 +1839,6 @@ static int dm_resume(void *handle)
 	struct drm_plane *plane;
 	struct drm_plane_state *new_plane_state;
 	struct dm_plane_state *dm_new_plane_state;
-	struct dm_atomic_state *dm_state = to_dm_atomic_state(dm->atomic_obj.state);
 	enum dc_connection_type new_connection_type = dc_connection_none;
 	struct dc_state *dc_state;
 	int i, r, j;
@@ -1879,11 +1878,6 @@ static int dm_resume(void *handle)
 
 		return 0;
 	}
-	/* Recreate dc_state - DC invalidates it when setting power state to S3. */
-	dc_release_state(dm_state->context);
-	dm_state->context = dc_create_state(dm->dc);
-	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
-	dc_resource_state_construct(dm->dc, dm_state->context);
 
 	/* Before powering on DC we need to re-initialize DMUB. */
 	r = dm_dmub_hw_init(adev);
@@ -2019,11 +2013,51 @@ const struct amdgpu_ip_block_version dm_ip_block =
  * *WIP*
  */
 
+struct drm_atomic_state *dm_atomic_state_alloc(struct drm_device *dev)
+{
+	struct dm_atomic_state *dm_state;
+
+	dm_state = kzalloc(sizeof(*dm_state), GFP_KERNEL);
+
+	if (!dm_state)
+		return NULL;
+
+	if (drm_atomic_state_init(dev, &dm_state->base) < 0) {
+		kfree(dm_state);
+		return NULL;
+	}
+
+	return &dm_state->base;
+}
+
+void dm_atomic_state_free(struct drm_atomic_state *state)
+{
+	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
+
+	if (dm_state->context) {
+		dc_release_state(dm_state->context);
+		dm_state->context = NULL;
+	}
+
+	drm_atomic_state_default_release(state);
+	kfree(state);
+}
+
+void dm_atomic_state_clear(struct drm_atomic_state *state)
+{
+	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
+
+	drm_atomic_state_default_clear(&dm_state->base);
+}
+
 static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 	.fb_create = amdgpu_display_user_framebuffer_create,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
 	.atomic_check = amdgpu_dm_atomic_check,
 	.atomic_commit = amdgpu_dm_atomic_commit,
+	.atomic_state_alloc = dm_atomic_state_alloc,
+	.atomic_state_free = dm_atomic_state_free,
+	.atomic_state_clear = dm_atomic_state_clear,
 };
 
 static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
@@ -2782,108 +2816,6 @@ static int dcn10_register_irq_handlers(struct amdgpu_device *adev)
 }
 #endif
 
-/*
- * Acquires the lock for the atomic state object and returns
- * the new atomic state.
- *
- * This should only be called during atomic check.
- */
-static int dm_atomic_get_state(struct drm_atomic_state *state,
-			       struct dm_atomic_state **dm_state)
-{
-	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
-	struct amdgpu_display_manager *dm = &adev->dm;
-	struct drm_private_state *priv_state;
-
-	if (*dm_state)
-		return 0;
-
-	priv_state = drm_atomic_get_private_obj_state(state, &dm->atomic_obj);
-	if (IS_ERR(priv_state))
-		return PTR_ERR(priv_state);
-
-	*dm_state = to_dm_atomic_state(priv_state);
-
-	return 0;
-}
-
-static struct dm_atomic_state *
-dm_atomic_get_new_state(struct drm_atomic_state *state)
-{
-	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
-	struct amdgpu_display_manager *dm = &adev->dm;
-	struct drm_private_obj *obj;
-	struct drm_private_state *new_obj_state;
-	int i;
-
-	for_each_new_private_obj_in_state(state, obj, new_obj_state, i) {
-		if (obj->funcs == dm->atomic_obj.funcs)
-			return to_dm_atomic_state(new_obj_state);
-	}
-
-	return NULL;
-}
-
-static struct dm_atomic_state *
-dm_atomic_get_old_state(struct drm_atomic_state *state)
-{
-	struct drm_device *dev = state->dev;
-	struct amdgpu_device *adev = dev->dev_private;
-	struct amdgpu_display_manager *dm = &adev->dm;
-	struct drm_private_obj *obj;
-	struct drm_private_state *old_obj_state;
-	int i;
-
-	for_each_old_private_obj_in_state(state, obj, old_obj_state, i) {
-		if (obj->funcs == dm->atomic_obj.funcs)
-			return to_dm_atomic_state(old_obj_state);
-	}
-
-	return NULL;
-}
-
-static struct drm_private_state *
-dm_atomic_duplicate_state(struct drm_private_obj *obj)
-{
-	struct dm_atomic_state *old_state, *new_state;
-
-	new_state = kzalloc(sizeof(*new_state), GFP_KERNEL);
-	if (!new_state)
-		return NULL;
-
-	__drm_atomic_helper_private_obj_duplicate_state(obj, &new_state->base);
-
-	old_state = to_dm_atomic_state(obj->state);
-
-	if (old_state && old_state->context)
-		new_state->context = dc_copy_state(old_state->context);
-
-	if (!new_state->context) {
-		kfree(new_state);
-		return NULL;
-	}
-
-	return &new_state->base;
-}
-
-static void dm_atomic_destroy_state(struct drm_private_obj *obj,
-				    struct drm_private_state *state)
-{
-	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
-
-	if (dm_state && dm_state->context)
-		dc_release_state(dm_state->context);
-
-	kfree(dm_state);
-}
-
-static struct drm_private_state_funcs dm_atomic_state_funcs = {
-	.atomic_duplicate_state = dm_atomic_duplicate_state,
-	.atomic_destroy_state = dm_atomic_destroy_state,
-};
-
 static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 {
 	struct dm_atomic_state *state;
@@ -2916,11 +2848,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 
 	dc_resource_state_copy_construct_current(adev->dm.dc, state->context);
 
-	drm_atomic_private_obj_init(adev->ddev,
-				    &adev->dm.atomic_obj,
-				    &state->base,
-				    &dm_atomic_state_funcs);
-
 	r = amdgpu_display_modeset_create_props(adev);
 	if (r)
 		return r;
@@ -3360,7 +3287,6 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 static void amdgpu_dm_destroy_drm_device(struct amdgpu_display_manager *dm)
 {
 	drm_mode_config_cleanup(dm->ddev);
-	drm_atomic_private_obj_fini(&dm->atomic_obj);
 	return;
 }
 
@@ -7533,7 +7459,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_device *dev = state->dev;
 	struct amdgpu_device *adev = dev->dev_private;
 	struct amdgpu_display_manager *dm = &adev->dm;
-	struct dm_atomic_state *dm_state;
+	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
 	struct dc_state *dc_state = NULL, *dc_state_temp = NULL;
 	uint32_t i, j;
 	struct drm_crtc *crtc;
@@ -7547,8 +7473,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 
-	dm_state = dm_atomic_get_new_state(state);
-	if (dm_state && dm_state->context) {
+	if (dm_state->context) {
 		dc_state = dm_state->context;
 	} else {
 		/* No state changes, retain current state. */
@@ -8052,10 +7977,8 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 				struct drm_crtc *crtc,
 				struct drm_crtc_state *old_crtc_state,
 				struct drm_crtc_state *new_crtc_state,
-				bool enable,
 				bool *lock_and_validation_needed)
 {
-	struct dm_atomic_state *dm_state = NULL;
 	struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
 	struct dc_stream_state *new_stream;
 	int ret = 0;
@@ -8077,7 +8000,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	aconnector = amdgpu_dm_find_first_crtc_matching_connector(state, crtc);
 
 	/* TODO This hack should go away */
-	if (aconnector && enable) {
+	if (aconnector) {
 		/* Make sure fake sink is created in plug-in scenario */
 		drm_new_conn_state = drm_atomic_get_new_connector_state(state,
 							    &aconnector->base);
@@ -8155,36 +8078,20 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		new_crtc_state->active_changed,
 		new_crtc_state->connectors_changed);
 
-	/* Remove stream for any changed/disabled CRTC */
-	if (!enable) {
-
-		if (!dm_old_crtc_state->stream)
-			goto skip_modeset;
-
-		ret = dm_atomic_get_state(state, &dm_state);
-		if (ret)
-			goto fail;
-
-		DRM_DEBUG_DRIVER("Disabling DRM crtc: %d\n",
-				crtc->base.id);
+	/* Remove stream for changed CRTC - can't reuse it for validation. */
+	if (dm_new_crtc_state->stream) {
+		DRM_DEBUG_DRIVER("Disabling DRM crtc: %d\n", crtc->base.id);
 
-		/* i.e. reset mode */
-		if (dc_remove_stream_from_ctx(
-				dm->dc,
-				dm_state->context,
-				dm_old_crtc_state->stream) != DC_OK) {
-			ret = -EINVAL;
-			goto fail;
-		}
-
-		dc_stream_release(dm_old_crtc_state->stream);
+		dc_stream_release(dm_new_crtc_state->stream);
 		dm_new_crtc_state->stream = NULL;
 
 		reset_freesync_config_for_crtc(dm_new_crtc_state);
 
 		*lock_and_validation_needed = true;
+	}
 
-	} else {/* Add stream for any updated/enabled CRTC */
+	/* Add stream for any updated/enabled CRTC - active implies enabled. */
+	if (new_crtc_state->active) {
 		/*
 		 * Quick fix to prevent NULL pointer on new_stream when
 		 * added MST connectors not found in existing crtc_state in the chained mode
@@ -8193,35 +8100,13 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 		if (!aconnector || (!aconnector->dc_sink && aconnector->mst_port))
 			goto skip_modeset;
 
-		if (modereset_required(new_crtc_state))
-			goto skip_modeset;
-
-		if (modeset_required(new_crtc_state, new_stream,
-				     dm_old_crtc_state->stream)) {
-
-			WARN_ON(dm_new_crtc_state->stream);
-
-			ret = dm_atomic_get_state(state, &dm_state);
-			if (ret)
-				goto fail;
-
-			dm_new_crtc_state->stream = new_stream;
+		WARN_ON(dm_new_crtc_state->stream);
+		dm_new_crtc_state->stream = new_stream;
+		dc_stream_retain(new_stream);
 
-			dc_stream_retain(new_stream);
+		DRM_DEBUG_DRIVER("Enabling DRM crtc: %d\n", crtc->base.id);
 
-			DRM_DEBUG_DRIVER("Enabling DRM crtc: %d\n",
-						crtc->base.id);
-
-			if (dc_add_stream_to_ctx(
-					dm->dc,
-					dm_state->context,
-					dm_new_crtc_state->stream) != DC_OK) {
-				ret = -EINVAL;
-				goto fail;
-			}
-
-			*lock_and_validation_needed = true;
-		}
+		*lock_and_validation_needed = true;
 	}
 
 skip_modeset:
@@ -8233,7 +8118,7 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 	 * We want to do dc stream updates that do not require a
 	 * full modeset below.
 	 */
-	if (!(enable && aconnector && new_crtc_state->active))
+	if (!(aconnector && new_crtc_state->enable && new_crtc_state->active))
 		return 0;
 	/*
 	 * Given above conditions, the dc state cannot be NULL because:
@@ -8281,10 +8166,12 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 			       struct drm_plane_state *old_plane_state,
 			       struct drm_plane_state *new_plane_state)
 {
-	struct drm_plane *other;
-	struct drm_plane_state *old_other_state, *new_other_state;
 	struct drm_crtc_state *new_crtc_state;
-	int i;
+	struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
+
+	/* Cursor planes don't affect bandwidth. */
+	if (plane->type == DRM_PLANE_TYPE_CURSOR)
+		return false;
 
 	/*
 	 * TODO: Remove this hack once the checks below are sufficient
@@ -8312,71 +8199,50 @@ static bool should_reset_plane(struct drm_atomic_state *state,
 	if (new_crtc_state->color_mgmt_changed)
 		return true;
 
+	/* Plane scaling can change with a modeset, so reset. */
 	if (drm_atomic_crtc_needs_modeset(new_crtc_state))
 		return true;
 
-	/*
-	 * If there are any new primary or overlay planes being added or
-	 * removed then the z-order can potentially change. To ensure
-	 * correct z-order and pipe acquisition the current DC architecture
-	 * requires us to remove and recreate all existing planes.
-	 *
-	 * TODO: Come up with a more elegant solution for this.
-	 */
-	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
-		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
-
-		if (other->type == DRM_PLANE_TYPE_CURSOR)
-			continue;
-
-		if (old_other_state->crtc != new_plane_state->crtc &&
-		    new_other_state->crtc != new_plane_state->crtc)
-			continue;
-
-		if (old_other_state->crtc != new_other_state->crtc)
-			return true;
-
-		/* Src/dst size and scaling updates. */
-		if (old_other_state->src_w != new_other_state->src_w ||
-		    old_other_state->src_h != new_other_state->src_h ||
-		    old_other_state->crtc_w != new_other_state->crtc_w ||
-		    old_other_state->crtc_h != new_other_state->crtc_h)
-			return true;
+	/* Src/dst size and scaling updates. */
+	if (old_plane_state->src_w != new_plane_state->src_w ||
+	    old_plane_state->src_h != new_plane_state->src_h ||
+	    old_plane_state->crtc_w != new_plane_state->crtc_w ||
+	    old_plane_state->crtc_h != new_plane_state->crtc_h)
+		return true;
 
-		/* Rotation / mirroring updates. */
-		if (old_other_state->rotation != new_other_state->rotation)
-			return true;
+	/* Rotation / mirroring updates. */
+	if (old_plane_state->rotation != new_plane_state->rotation)
+		return true;
 
-		/* Blending updates. */
-		if (old_other_state->pixel_blend_mode !=
-		    new_other_state->pixel_blend_mode)
-			return true;
+	/* Blending updates. */
+	if (old_plane_state->pixel_blend_mode !=
+	    new_plane_state->pixel_blend_mode)
+		return true;
 
-		/* Alpha updates. */
-		if (old_other_state->alpha != new_other_state->alpha)
-			return true;
+	/* Alpha updates. */
+	if (old_plane_state->alpha != new_plane_state->alpha)
+		return true;
 
-		/* Colorspace changes. */
-		if (old_other_state->color_range != new_other_state->color_range ||
-		    old_other_state->color_encoding != new_other_state->color_encoding)
-			return true;
+	/* Colorspace changes. */
+	if (old_plane_state->color_range != new_plane_state->color_range ||
+	    old_plane_state->color_encoding != new_plane_state->color_encoding)
+		return true;
 
-		/* Framebuffer checks fall at the end. */
-		if (!old_other_state->fb || !new_other_state->fb)
-			continue;
+	/* Framebuffer checks fall at the end. */
+	if (!old_plane_state->fb || !new_plane_state->fb)
+		return false;
 
-		/* Pixel format changes can require bandwidth updates. */
-		if (old_other_state->fb->format != new_other_state->fb->format)
-			return true;
+	/* Pixel format changes can require bandwidth updates. */
+	if (old_plane_state->fb->format != new_plane_state->fb->format)
+		return true;
 
-		old_dm_plane_state = to_dm_plane_state(old_other_state);
-		new_dm_plane_state = to_dm_plane_state(new_other_state);
+	old_dm_plane_state = to_dm_plane_state(old_plane_state);
+	new_dm_plane_state = to_dm_plane_state(new_plane_state);
 
-		/* Tiling and DCC changes also require bandwidth updates. */
-		if (old_dm_plane_state->tiling_flags !=
-		    new_dm_plane_state->tiling_flags)
-			return true;
-	}
+	/* Tiling and DCC changes also require bandwidth updates. */
+	if (old_dm_plane_state->tiling_flags !=
+	    new_dm_plane_state->tiling_flags)
+		return true;
 
 	return false;
 }
@@ -8386,15 +8252,12 @@ static int dm_update_plane_state(struct dc *dc,
 				 struct drm_plane *plane,
 				 struct drm_plane_state *old_plane_state,
 				 struct drm_plane_state *new_plane_state,
-				 bool enable,
 				 bool *lock_and_validation_needed)
 {
-
-	struct dm_atomic_state *dm_state = NULL;
 	struct drm_crtc *new_plane_crtc, *old_plane_crtc;
-	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
-	struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
-	struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
+	struct drm_crtc_state *new_crtc_state;
+	struct dm_crtc_state *dm_new_crtc_state;
+	struct dm_plane_state *dm_new_plane_state;
 	struct amdgpu_crtc *new_acrtc;
 	bool needs_reset;
 	int ret = 0;
@@ -8403,12 +8266,12 @@ static int dm_update_plane_state(struct dc *dc,
 	new_plane_crtc = new_plane_state->crtc;
 	old_plane_crtc = old_plane_state->crtc;
 	dm_new_plane_state = to_dm_plane_state(new_plane_state);
-	dm_old_plane_state = to_dm_plane_state(old_plane_state);
 
 	/*TODO Implement better atomic check for cursor plane */
 	if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-		if (!enable || !new_plane_crtc ||
-			drm_atomic_plane_disabling(plane->state, new_plane_state))
+		/* Cursor disabled is always OK. */
+		if (!new_plane_crtc ||
+		    drm_atomic_plane_disabling(plane->state, new_plane_state))
 			return 0;
 
 		new_acrtc = to_amdgpu_crtc(new_plane_crtc);
@@ -8423,123 +8286,72 @@ static int dm_update_plane_state(struct dc *dc,
 		return 0;
 	}
 
+	/* Check if the plane requires a reset for bandwidth validation. */
 	needs_reset = should_reset_plane(state, plane, old_plane_state,
 					 new_plane_state);
 
-	/* Remove any changed/removed planes */
-	if (!enable) {
-		if (!needs_reset)
-			return 0;
-
-		if (!old_plane_crtc)
-			return 0;
-
-		old_crtc_state = drm_atomic_get_old_crtc_state(
-				state, old_plane_crtc);
-		dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
-
-		if (!dm_old_crtc_state->stream)
-			return 0;
+	/* Exit early if the plane hasn't been trivially modified. */
+	if (!needs_reset)
+		return 0;
 
+	/**
+	 * Remove exisiting plane, if any - we can't reuse it for validation
+	 * because we'd be modifying the current state applied to HW.
+	 */
+	if (dm_new_plane_state->dc_state) {
 		DRM_DEBUG_ATOMIC("Disabling DRM plane: %d on DRM crtc %d\n",
-				plane->base.id, old_plane_crtc->base.id);
-
-		ret = dm_atomic_get_state(state, &dm_state);
-		if (ret)
-			return ret;
+				 plane->base.id, old_plane_crtc->base.id);
 
-		if (!dc_remove_plane_from_context(
-				dc,
-				dm_old_crtc_state->stream,
-				dm_old_plane_state->dc_state,
-				dm_state->context)) {
-
-			ret = EINVAL;
-			return ret;
-		}
-
-
-		dc_plane_state_release(dm_old_plane_state->dc_state);
+		dc_plane_state_release(dm_new_plane_state->dc_state);
 		dm_new_plane_state->dc_state = NULL;
 
 		*lock_and_validation_needed = true;
+	}
 
-	} else { /* Add new planes */
-		struct dc_plane_state *dc_new_plane_state;
-
-		if (drm_atomic_plane_disabling(plane->state, new_plane_state))
-			return 0;
-
-		if (!new_plane_crtc)
-			return 0;
-
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_crtc);
-		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
-
-		if (!dm_new_crtc_state->stream)
-			return 0;
-
-		if (!needs_reset)
-			return 0;
-
-		ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
-		if (ret)
-			return ret;
-
-		WARN_ON(dm_new_plane_state->dc_state);
-
-		dc_new_plane_state = dc_create_plane_state(dc);
-		if (!dc_new_plane_state)
-			return -ENOMEM;
-
-		DRM_DEBUG_DRIVER("Enabling DRM plane: %d on DRM crtc %d\n",
-				plane->base.id, new_plane_crtc->base.id);
+	/**
+	 * If the plane is disabling exit early. Also serves as a guarantee
+	 * that we have a framebuffer below if we do have a CRTC.
+	 */
+	if (drm_atomic_plane_disabling(plane->state, new_plane_state))
+		return 0;
 
-		ret = fill_dc_plane_attributes(
-			new_plane_crtc->dev->dev_private,
-			dc_new_plane_state,
-			new_plane_state,
-			new_crtc_state);
-		if (ret) {
-			dc_plane_state_release(dc_new_plane_state);
-			return ret;
-		}
+	/* If we don't have a CRTC then the plane is disabled. */
+	if (!new_plane_crtc)
+		return 0;
 
-		ret = dm_atomic_get_state(state, &dm_state);
-		if (ret) {
-			dc_plane_state_release(dc_new_plane_state);
-			return ret;
-		}
+	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_crtc);
+	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 
-		/*
-		 * Any atomic check errors that occur after this will
-		 * not need a release. The plane state will be attached
-		 * to the stream, and therefore part of the atomic
-		 * state. It'll be released when the atomic state is
-		 * cleaned.
-		 */
-		if (!dc_add_plane_to_context(
-				dc,
-				dm_new_crtc_state->stream,
-				dc_new_plane_state,
-				dm_state->context)) {
+	/* Don't enable the plane if there's no stream for output. */
+	if (!dm_new_crtc_state->stream)
+		return 0;
 
-			dc_plane_state_release(dc_new_plane_state);
-			return -EINVAL;
-		}
+	/**
+	 * Freeing the plane will take care of freeing the dc_state
+	 * on failure, so we don't need to explicitly release below.
+	 */
+	dm_new_plane_state->dc_state = dc_create_plane_state(dc);
+	if (!dm_new_plane_state->dc_state)
+		return -ENOMEM;
 
-		dm_new_plane_state->dc_state = dc_new_plane_state;
+	DRM_DEBUG_DRIVER("Enabling DRM plane: %d on DRM crtc %d\n",
+			 plane->base.id, new_plane_crtc->base.id);
 
-		/* Tell DC to do a full surface update every time there
-		 * is a plane change. Inefficient, but works for now.
-		 */
-		dm_new_plane_state->dc_state->update_flags.bits.full_update = 1;
+	ret = fill_dc_plane_attributes(new_plane_crtc->dev->dev_private,
+				       dm_new_plane_state->dc_state,
+				       new_plane_state, new_crtc_state);
+	if (ret)
+		return ret;
 
-		*lock_and_validation_needed = true;
-	}
+	/**
+	 * Tell DC to do a full surface update every time there
+	 * is a plane change. Inefficient, but works for now.
+	 */
+	dm_new_plane_state->dc_state->update_flags.bits.full_update = 1;
 
+	*lock_and_validation_needed = true;
 
-	return ret;
+	return 0;
 }
 
 #if defined(CONFIG_DRM_AMD_DC_DCN)
@@ -8567,6 +8379,113 @@ static int add_affected_mst_dsc_crtcs(struct drm_atomic_state *state, struct drm
 }
 #endif
 
+static int dm_atomic_state_init_context(struct drm_device *dev,
+					struct drm_atomic_state *state)
+{
+	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
+	struct amdgpu_device *adev = dev->dev_private;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *new_crtc_state;
+	struct dm_crtc_state *new_dm_crtc_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state, *old_plane_state;
+	struct dm_plane_state *new_dm_plane_state;
+	int ret, i;
+
+	dm_state->context = dc_create_state(adev->dm.dc);
+	if (!dm_state->context)
+		return -ENOMEM;
+
+	/**
+	 * DC validation requires an absolute set of streams and planes to work
+	 * with so add all planes and CRTCs to the state to make this work.
+	 * Pipe allocation can change so there's no easy way to work around
+	 * this constraint.
+	 *
+	 * Unfortunately this also means that whenever userspace requests a
+	 * change that only needs to modify one CRTC's planes we still have to
+	 * stall out fast updates affecting other CRTCs - introducing judder
+	 * in multi-monitor scenarios.
+	 *
+	 * Userspace should avoid frequent updates to properties that can
+	 * require bandwidth changes.
+	 */
+	drm_for_each_crtc(crtc, dev) {
+		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(new_crtc_state))
+			return PTR_ERR(new_crtc_state);
+
+		/**
+		 * Cursor planes may not strictly be necessary here
+		 * but it's probably safer to add them.
+		 */
+		ret = drm_atomic_add_affected_planes(state, crtc);
+		if (ret)
+			return ret;
+	}
+
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		if (!new_dm_crtc_state->stream)
+			continue;
+
+		if (dc_add_stream_to_ctx(adev->dm.dc, dm_state->context,
+					 new_dm_crtc_state->stream) != DC_OK)
+			return -EINVAL;
+	}
+
+	/**
+	 * Planes are added in reverse order to ensure correct blending order
+	 * in DC - planes with higher priority go first, and the cursor and
+	 * MPO planes are at the very end of the list.
+	 */
+	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
+		/* Cursors aren't real hardware planes. */
+		if (plane->type == DRM_PLANE_TYPE_CURSOR)
+			continue;
+
+		if (!new_plane_state->crtc)
+			continue;
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(
+			state, new_plane_state->crtc);
+
+		if (!new_crtc_state) {
+			DRM_WARN("No CRTC state found: plane=%d crtc=%d\n",
+				 plane->base.id,
+				 new_plane_state->crtc->base.id);
+			return -EINVAL;
+		}
+
+		new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
+
+		/* Skip planes for disabled streams. */
+		if (!new_dm_crtc_state->stream)
+			continue;
+
+		new_dm_plane_state = to_dm_plane_state(new_plane_state);
+
+		if (!new_dm_plane_state->dc_state) {
+			DRM_WARN("No DC state found: plane=%d crtc=%d\n",
+				 plane->base.id,
+				 new_plane_state->crtc->base.id);
+			return -EINVAL;
+		}
+
+		if (!dc_add_plane_to_context(
+			    adev->dm.dc, new_dm_crtc_state->stream,
+			    new_dm_plane_state->dc_state, dm_state->context)) {
+			DRM_DEBUG_KMS(
+				"Couldn't add plane to context: plane=%d\n",
+				plane->base.id);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu DM.
  * @dev: The DRM device
@@ -8595,7 +8514,7 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 				  struct drm_atomic_state *state)
 {
 	struct amdgpu_device *adev = dev->dev_private;
-	struct dm_atomic_state *dm_state = NULL;
+	struct dm_atomic_state *dm_state = to_dm_atomic_state(state);
 	struct dc *dc = adev->dm.dc;
 	struct drm_connector *connector;
 	struct drm_connector_state *old_con_state, *new_con_state;
@@ -8607,6 +8526,11 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	int ret, i;
 	bool lock_and_validation_needed = false;
 
+	/**
+	 * Check for modesets on CRTCs in the new state. DRM internally checks
+	 * that the mode has actually changed for us as well in here, so we can
+	 * avoid modesets.
+	 */
 	ret = drm_atomic_helper_check_modeset(dev, state);
 	if (ret)
 		goto fail;
@@ -8634,6 +8558,18 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			new_crtc_state->connectors_changed = true;
 	}
 
+	/**
+	 * Add all required objects for performing the commit and stalling out
+	 * other commits that may be touching the same resources.
+	 */
+
+	/**
+	 * Pass one: Add all affected CRTCs on a MST DSC topology that has a
+	 * CRTC undergoing a modeset and mark mode_changed = true for each one.
+	 *
+	 * Optimization: DSC can only be supported on DCN2 onwards, so we can
+	 * skip on earlier ASIC.
+	 */
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 	if (adev->asic_type >= CHIP_NAVI10) {
 		for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
@@ -8645,6 +8581,8 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 		}
 	}
 #endif
+
+	/* Pass two: Add connectors and planes for CRTCs as needed.  */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state) &&
 		    !new_crtc_state->color_mgmt_changed &&
@@ -8663,42 +8601,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 	}
 
-	/*
-	 * Add all primary and overlay planes on the CRTC to the state
-	 * whenever a plane is enabled to maintain correct z-ordering
-	 * and to enable fast surface updates.
-	 */
-	drm_for_each_crtc(crtc, dev) {
-		bool modified = false;
-
-		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
-			if (plane->type == DRM_PLANE_TYPE_CURSOR)
-				continue;
-
-			if (new_plane_state->crtc == crtc ||
-			    old_plane_state->crtc == crtc) {
-				modified = true;
-				break;
-			}
-		}
-
-		if (!modified)
-			continue;
-
-		drm_for_each_plane_mask(plane, state->dev, crtc->state->plane_mask) {
-			if (plane->type == DRM_PLANE_TYPE_CURSOR)
-				continue;
-
-			new_plane_state =
-				drm_atomic_get_plane_state(state, plane);
-
-			if (IS_ERR(new_plane_state)) {
-				ret = PTR_ERR(new_plane_state);
-				goto fail;
-			}
-		}
-	}
-
 	/* Prepass for updating tiling flags on new planes. */
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		struct dm_plane_state *new_dm_plane_state = to_dm_plane_state(new_plane_state);
@@ -8710,45 +8612,21 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 	}
 
-	/* Remove exiting planes if they are modified */
-	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
-		ret = dm_update_plane_state(dc, state, plane,
-					    old_plane_state,
-					    new_plane_state,
-					    false,
-					    &lock_and_validation_needed);
-		if (ret)
-			goto fail;
-	}
-
-	/* Disable all crtcs which require disable */
+	/* Update modified CRTCs. */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		ret = dm_update_crtc_state(&adev->dm, state, crtc,
 					   old_crtc_state,
 					   new_crtc_state,
-					   false,
 					   &lock_and_validation_needed);
 		if (ret)
 			goto fail;
 	}
 
-	/* Enable all crtcs which require enable */
-	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
-		ret = dm_update_crtc_state(&adev->dm, state, crtc,
-					   old_crtc_state,
-					   new_crtc_state,
-					   true,
-					   &lock_and_validation_needed);
-		if (ret)
-			goto fail;
-	}
-
-	/* Add new/modified planes */
+	/* Update modified planes. */
 	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
 		ret = dm_update_plane_state(dc, state, plane,
 					    old_plane_state,
 					    new_plane_state,
-					    true,
 					    &lock_and_validation_needed);
 		if (ret)
 			goto fail;
@@ -8812,10 +8690,11 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 	 * DRM state directly - we can end up disabling interrupts too early
 	 * if we don't.
 	 *
-	 * TODO: Remove this stall and drop DM state private objects.
+	 * TODO: Remove this stall.
 	 */
 	if (lock_and_validation_needed) {
-		ret = dm_atomic_get_state(state, &dm_state);
+		/* Create a new DC context to validate. */
+		ret = dm_atomic_state_init_context(dev, state);
 		if (ret)
 			goto fail;
 
@@ -8848,47 +8727,6 @@ static int amdgpu_dm_atomic_check(struct drm_device *dev,
 			ret = -EINVAL;
 			goto fail;
 		}
-	} else {
-		/*
-		 * The commit is a fast update. Fast updates shouldn't change
-		 * the DC context, affect global validation, and can have their
-		 * commit work done in parallel with other commits not touching
-		 * the same resource. If we have a new DC context as part of
-		 * the DM atomic state from validation we need to free it and
-		 * retain the existing one instead.
-		 *
-		 * Furthermore, since the DM atomic state only contains the DC
-		 * context and can safely be annulled, we can free the state
-		 * and clear the associated private object now to free
-		 * some memory and avoid a possible use-after-free later.
-		 */
-
-		for (i = 0; i < state->num_private_objs; i++) {
-			struct drm_private_obj *obj = state->private_objs[i].ptr;
-
-			if (obj->funcs == adev->dm.atomic_obj.funcs) {
-				int j = state->num_private_objs-1;
-
-				dm_atomic_destroy_state(obj,
-						state->private_objs[i].state);
-
-				/* If i is not at the end of the array then the
-				 * last element needs to be moved to where i was
-				 * before the array can safely be truncated.
-				 */
-				if (i != j)
-					state->private_objs[i] =
-						state->private_objs[j];
-
-				state->private_objs[j].ptr = NULL;
-				state->private_objs[j].state = NULL;
-				state->private_objs[j].old_state = NULL;
-				state->private_objs[j].new_state = NULL;
-
-				state->num_private_objs = j;
-				break;
-			}
-		}
 	}
 
 	/* Store the overall update type for use later in atomic check. */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ad025f5cfd3e..1c3aa7cb83b9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -217,15 +217,6 @@ struct amdgpu_display_manager {
 	struct drm_device *ddev;
 	u16 display_indexes_num;
 
-	/**
-	 * @atomic_obj:
-	 *
-	 * In combination with &dm_atomic_state it helps manage
-	 * global atomic state that doesn't map cleanly into existing
-	 * drm resources, like &dc_context.
-	 */
-	struct drm_private_obj atomic_obj;
-
 	/**
 	 * @dc_lock:
 	 *
@@ -440,7 +431,7 @@ struct dm_crtc_state {
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
 
 struct dm_atomic_state {
-	struct drm_private_state base;
+	struct drm_atomic_state base;
 
 	struct dc_state *context;
 };
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
