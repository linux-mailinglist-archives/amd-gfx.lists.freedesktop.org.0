Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 132177A8CFE
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Sep 2023 21:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2257C10E547;
	Wed, 20 Sep 2023 19:39:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AFF10E559
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Sep 2023 19:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCoPV/WKfSCNMzSEBBFlsqeFTGW9pbmAvKFzItFdYybN0/jHwePOPumwfniBWszVUFYcVXlW/+y+w83Mv6vs04foLUPV+0IUdwDT8ZvGJdk0eGSOhMEBmpGce3HAZewOZHOtRdBe+bJNVypqVDqpD8YzS0u/P0WTBXodQHLc+F3SE7xzIUPcZ+RfMZO+5EWgif8SCwOEyutsgBcRSYdcFEAyIeNMNm0nYXg3tAmGmoo6hj/RGJLOoLKevnOD2zY12QsNviUfoPbq7LP3fYQIa86cTynjro86V4E5mUlXJ+pfRtm0Dwt2yJa8bQcYYeCPPUJQ6BIAYBi/YK2zX6jY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAt7SZdO11lvty2I46WLy4/twjhkuQ+HAZNrYKRg1LA=;
 b=Z0L5L30h4v8ndSlIdCr+LMYj5dM6vdpO6BTsys+eLUfVNarjBOG6gHofuWr7R1ydRVfF7ng52JDUVXcH5XAVzDiWkSUw01aygIAmhEjJ2gs8EfPBUi1YZ0anreGSNticDQ+Q7svz5gB3l2xE5f6eAVVBYKADyNOZSoxuszwf/XB9x0gmIjQ1fBrHAMAOo0YGTlcrInUn8r9mV9+7EXn8piq3+nY43y/bSY2NNiqVhizVibFCqgSuhZahtaCFsgij8hctINElbU2aZAE+oBmWsJ7a8UrwPmdB9/nv7YhsoaxkOXSj/I4ejOrBVnm11klIkSQQAOYgDeEbSlv9Wb3E/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAt7SZdO11lvty2I46WLy4/twjhkuQ+HAZNrYKRg1LA=;
 b=iB2GUF5CSM0Rgw4mdrSFooJlD2BhR8rfGgdxLhZeaCjwhjnEtNHMSg6Jr5HsxcJ2cuGxIu5/cHA8YvLWDgFA359JWHasiuEpX2OdDL/0rRYG5fEs4Id+h8OOfQ2wYyp5n8K1I+HCsGnyEdmiisRVrF7RnNH3Asgx+BAMer+wE/s=
Received: from BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26) by
 LV8PR12MB9181.namprd12.prod.outlook.com (2603:10b6:408:18d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Wed, 20 Sep
 2023 19:39:12 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::7f) by BL0PR01CA0013.outlook.office365.com
 (2603:10b6:208:71::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.30 via Frontend
 Transport; Wed, 20 Sep 2023 19:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Wed, 20 Sep 2023 19:39:11 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 20 Sep
 2023 14:39:09 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: switch DC over to the new DRM logging macros
Date: Wed, 20 Sep 2023 15:38:26 -0400
Message-ID: <20230920193826.414884-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|LV8PR12MB9181:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d1ee11-c011-4542-ecaa-08dbba1143f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JHOv1w3RF+g3ls4vlAWEy8Vi0nylyn4lsZKrP9ttncU6Viu6jFEOtFEKCyPkaLoKez5aA0/ZGDlbA7zKGy3oA6roVtPuzyycVwGvctFw3j2uA0TZxPU7YhzRhscm6Ynoex5QwWz2tGmRS169dziZLPsm4Li5C9cWnDFSfDxUflfRYXVHGbZpSRWldstpq89/lFViQyomYxGvSjCETu/q/+4hGJGTitXyEmTJhxDkpcuJt0sJUuDWv3GPS95rYQGrJjFZBvEok1Xom5rVUskiTAC1uegeeqZs26GEumpPNyGqz3ukLpZkoJlpMMCowcwWJ/tfnUiMx7Np4Cv9OzP5sXJnSE6pR9Uf39In6KklR+/o7ehrjQR3fIHSXFp38VGtBaNbA5W6nYqr5lN+Da4YuijM0gIzd56jqcULBqm6gNMTMVjZ8EPyulGn1Fdi42f083bQdLGSp+uyPxihF3vYVekAAEuYQEc11Kj4yKj9N5Zc7AyPWW6EBjcoLc3RDLNsQJGH6uCt9pR0xPZl8WPCj7ZeVngKHbr1X2qCf0CcJiZnK36NLRWY1nOu1OCfOauCRahqWL/f0TPRP6DRSsBNCnvs/Y806+kNGR0NJzPYhERIf9Cqxzx3TbTS9EXRbcBr6wBZVKp+zo1IsjE1lBfHRi0ntLwdrldInpGSv+DUSG/1Gd5zdTl2HjU7fC8zi1dXkqJ8jBT0vGbkQZycpZj1KgpuX2hBu2+JX/5IK29sSN5Cd9aqExgeFD/0T5t+eYWVJLAxd17DYIScbnBEbYcsJW19pzg53J70Xbaru8oJ/pRsUKtLZAONUdl9QD0ww9KB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(1800799009)(451199024)(186009)(82310400011)(40470700004)(46966006)(36840700001)(40480700001)(82740400003)(86362001)(36756003)(81166007)(356005)(6916009)(40460700003)(70586007)(2616005)(1076003)(54906003)(316002)(4326008)(8936002)(41300700001)(8676002)(70206006)(26005)(16526019)(426003)(83380400001)(47076005)(336012)(6666004)(478600001)(30864003)(44832011)(5660300002)(36860700001)(2906002)(16060500005)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:39:11.9858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d1ee11-c011-4542-ecaa-08dbba1143f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9181
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
Cc: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

For multi-GPU systems it is difficult to tell which GPU a particular
message is being printed for and that is undesirable because it
complicates debugging efforts. Also, the new macros allow us to enable
logging for particular parts of the codebase more selectively (since we
no longer need to throw everything at DRM_DEBUG_KMS()). So, for the
reasons outlined above we should switch to the new macros.

We can accomplish this by using the existing DC_LOGGER code to pass
around the relevant `struct drm_device` which will be fed to the new
macros in logger_types.h. Also, we must get rid of all instances of the
DC_LOG_.*() functions that are currently in amdgpu_dm since we don't use
the DC logger there and we can simply refer to the macros directly
there instead.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  66 ++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  69 +++++----
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |   8 +-
 .../gpu/drm/amd/display/dc/bios/bios_parser.c |   3 +
 .../dc/clk_mgr/dcn201/dcn201_clk_mgr.c        |   2 -
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  12 ++
 .../gpu/drm/amd/display/dc/core/dc_debug.c    |   2 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |   2 +
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  26 ++--
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |   3 +
 drivers/gpu/drm/amd/display/dc/dc_types.h     |   1 +
 .../drm/amd/display/dc/dce/dce_clock_source.c |   6 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |   9 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  18 ++-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c |   2 +
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |   7 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c |   3 +
 .../gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c |   2 +
 .../drm/amd/display/dc/dcn30/dcn30_resource.c |   2 +
 .../amd/display/dc/dcn301/dcn301_resource.c   |   2 +
 .../amd/display/dc/dcn302/dcn302_resource.c   |   2 +
 .../amd/display/dc/dcn303/dcn303_resource.c   |   2 +
 .../drm/amd/display/dc/dcn31/dcn31_resource.c |   2 +
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  |   2 +-
 .../amd/display/dc/dcn314/dcn314_resource.c   |   2 +
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |   2 +-
 .../drm/amd/display/dc/dcn35/dcn35_hwseq.c    |   7 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  |   2 +
 .../amd/display/dc/inc/hw/clk_mgr_internal.h  |   2 +-
 .../amd/display/dc/link/hwss/link_hwss_dpia.c |   2 +
 .../drm/amd/display/dc/link/link_detection.c  |   3 +
 .../gpu/drm/amd/display/dc/link/link_dpms.c   |  13 +-
 .../drm/amd/display/dc/link/link_factory.c    |   2 +
 .../amd/display/dc/link/protocols/link_ddc.c  |   2 +
 .../dc/link/protocols/link_dp_irq_handler.c   |   2 +
 .../link/protocols/link_edp_panel_control.c   |   2 +
 drivers/gpu/drm/amd/display/dc/os_types.h     |   1 +
 .../drm/amd/display/include/logger_types.h    | 144 +++---------------
 39 files changed, 232 insertions(+), 222 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 373884ca38b9..5d6397b41abc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -413,6 +413,7 @@ static void dm_pflip_high_irq(void *interrupt_params)
 	struct amdgpu_crtc *amdgpu_crtc;
 	struct common_irq_params *irq_params = interrupt_params;
 	struct amdgpu_device *adev = irq_params->adev;
+	struct drm_device *dev = adev_to_drm(adev);
 	unsigned long flags;
 	struct drm_pending_vblank_event *e;
 	u32 vpos, hpos, v_blank_start, v_blank_end;
@@ -423,18 +424,17 @@ static void dm_pflip_high_irq(void *interrupt_params)
 	/* IRQ could occur when in initial stage */
 	/* TODO work and BO cleanup */
 	if (amdgpu_crtc == NULL) {
-		DC_LOG_PFLIP("CRTC is null, returning.\n");
+		drm_dbg_state(dev, "CRTC is null, returning.\n");
 		return;
 	}
 
 	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
 
 	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
-		DC_LOG_PFLIP("amdgpu_crtc->pflip_status = %d !=AMDGPU_FLIP_SUBMITTED(%d) on crtc:%d[%p]\n",
-			     amdgpu_crtc->pflip_status,
-			     AMDGPU_FLIP_SUBMITTED,
-			     amdgpu_crtc->crtc_id,
-			     amdgpu_crtc);
+		drm_dbg_state(dev,
+			      "amdgpu_crtc->pflip_status = %d != AMDGPU_FLIP_SUBMITTED(%d) on crtc:%d[%p]\n",
+			      amdgpu_crtc->pflip_status, AMDGPU_FLIP_SUBMITTED,
+			      amdgpu_crtc->crtc_id, amdgpu_crtc);
 		spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 		return;
 	}
@@ -500,9 +500,9 @@ static void dm_pflip_high_irq(void *interrupt_params)
 	amdgpu_crtc->pflip_status = AMDGPU_FLIP_NONE;
 	spin_unlock_irqrestore(&adev_to_drm(adev)->event_lock, flags);
 
-	DC_LOG_PFLIP("crtc:%d[%p], pflip_stat:AMDGPU_FLIP_NONE, vrr[%d]-fp %d\n",
-		     amdgpu_crtc->crtc_id, amdgpu_crtc,
-		     vrr_active, (int) !e);
+	drm_dbg_state(dev,
+		      "crtc:%d[%p], pflip_stat:AMDGPU_FLIP_NONE, vrr[%d]-fp %d\n",
+		      amdgpu_crtc->crtc_id, amdgpu_crtc, vrr_active, (int)!e);
 }
 
 static void dm_vupdate_high_irq(void *interrupt_params)
@@ -532,9 +532,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
 			atomic64_set(&irq_params->previous_timestamp, vblank->time);
 		}
 
-		DC_LOG_VBLANK("crtc:%d, vupdate-vrr:%d\n",
-			      acrtc->crtc_id,
-			      vrr_active);
+		drm_dbg_vbl(drm_dev,
+			    "crtc:%d, vupdate-vrr:%d\n", acrtc->crtc_id,
+			    vrr_active);
 
 		/* Core vblank handling is done here after end of front-porch in
 		 * vrr mode, as vblank timestamping will give valid results
@@ -585,8 +585,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
 
 	vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
 
-	DC_LOG_VBLANK("crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
-		      vrr_active, acrtc->dm_irq_params.active_planes);
+	drm_dbg_vbl(adev_to_drm(adev),
+		    "crtc:%d, vupdate-vrr:%d, planes:%d\n", acrtc->crtc_id,
+		    vrr_active, acrtc->dm_irq_params.active_planes);
 
 	/**
 	 * Core vblank handling at start of front-porch is only possible
@@ -2700,6 +2701,7 @@ static void emulated_link_detect(struct dc_link *link)
 	struct display_sink_capability sink_caps = { 0 };
 	enum dc_edid_status edid_status;
 	struct dc_context *dc_ctx = link->ctx;
+	struct drm_device *dev = adev_to_drm(dc_ctx->driver_context);
 	struct dc_sink *sink = NULL;
 	struct dc_sink *prev_sink = NULL;
 
@@ -2749,7 +2751,7 @@ static void emulated_link_detect(struct dc_link *link)
 	}
 
 	default:
-		DC_ERROR("Invalid connector type! signal:%d\n",
+		drm_err(dev, "Invalid connector type! signal:%d\n",
 			link->connector_signal);
 		return;
 	}
@@ -2759,7 +2761,7 @@ static void emulated_link_detect(struct dc_link *link)
 
 	sink = dc_sink_create(&sink_init_data);
 	if (!sink) {
-		DC_ERROR("Failed to create sink!\n");
+		drm_err(dev, "Failed to create sink!\n");
 		return;
 	}
 
@@ -2772,7 +2774,7 @@ static void emulated_link_detect(struct dc_link *link)
 			sink);
 
 	if (edid_status != EDID_OK)
-		DC_ERROR("Failed to read EDID");
+		drm_err(dev, "Failed to read EDID\n");
 
 }
 
@@ -2791,7 +2793,7 @@ static void dm_gpureset_commit_state(struct dc_state *dc_state,
 	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
 
 	if (!bundle) {
-		dm_error("Failed to allocate update bundle\n");
+		drm_err(dm->ddev, "Failed to allocate update bundle\n");
 		goto cleanup;
 	}
 
@@ -3243,7 +3245,8 @@ void amdgpu_dm_update_connector_after_detect(
 			aconnector->timing_requested =
 				kzalloc(sizeof(struct dc_crtc_timing), GFP_KERNEL);
 			if (!aconnector->timing_requested)
-				dm_error("failed to create aconnector->requested_timing\n");
+				drm_err(dev,
+					"failed to create aconnector->requested_timing\n");
 		}
 
 		drm_connector_update_edid_property(connector, aconnector->edid);
@@ -6163,10 +6166,10 @@ create_stream_for_sink(struct amdgpu_dm_connector *aconnector,
 			requested_bpc);
 
 	if (aconnector->timing_changed) {
-		DC_LOG_DEBUG("%s: overriding timing for automated test, bpc %d, changing to %d\n",
-				__func__,
-				stream->timing.display_color_depth,
-				aconnector->timing_requested->display_color_depth);
+		drm_dbg(aconnector->base.dev,
+			"overriding timing for automated test, bpc %d, changing to %d\n",
+			stream->timing.display_color_depth,
+			aconnector->timing_requested->display_color_depth);
 		stream->timing = *aconnector->timing_requested;
 	}
 
@@ -7886,8 +7889,9 @@ static void prepare_flip_isr(struct amdgpu_crtc *acrtc)
 	/* Mark this event as consumed */
 	acrtc->base.state->event = NULL;
 
-	DC_LOG_PFLIP("crtc:%d, pflip_stat:AMDGPU_FLIP_SUBMITTED\n",
-		     acrtc->crtc_id);
+	drm_dbg_state(acrtc->base.dev,
+		      "crtc:%d, pflip_stat:AMDGPU_FLIP_SUBMITTED\n",
+		      acrtc->crtc_id);
 }
 
 static void update_freesync_state_on_stream(
@@ -8130,7 +8134,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	bundle = kzalloc(sizeof(*bundle), GFP_KERNEL);
 
 	if (!bundle) {
-		dm_error("Failed to allocate update bundle\n");
+		drm_err(dev, "Failed to allocate update bundle\n");
 		goto cleanup;
 	}
 
@@ -8718,7 +8722,9 @@ static void amdgpu_dm_commit_streams(struct drm_atomic_state *state,
 				status = dc_stream_get_status_from_state(dc_state,
 									 dm_new_crtc_state->stream);
 			if (!status)
-				DC_ERR("got no status for stream %p on acrtc%p\n", dm_new_crtc_state->stream, acrtc);
+				drm_err(dev,
+					"got no status for stream %p on acrtc%p\n",
+					dm_new_crtc_state->stream, acrtc);
 			else
 				acrtc->otg_inst = status->primary_otg_inst;
 		}
@@ -10906,7 +10912,8 @@ void dm_write_reg_func(const struct dc_context *ctx, uint32_t address,
 {
 #ifdef DM_CHECK_ADDR_0
 	if (address == 0) {
-		DC_ERR("invalid register write. address = 0");
+		drm_err(adev_to_drm(ctx->driver_context),
+			"invalid register write. address = 0");
 		return;
 	}
 #endif
@@ -10920,7 +10927,8 @@ uint32_t dm_read_reg_func(const struct dc_context *ctx, uint32_t address,
 	u32 value;
 #ifdef DM_CHECK_ADDR_0
 	if (address == 0) {
-		DC_ERR("invalid register read; address = 0\n");
+		drm_err(adev_to_drm(ctx->driver_context),
+			"invalid register read; address = 0\n");
 		return 0;
 	}
 #endif
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index baf7e5254fb3..b15ee51d49a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -539,7 +539,8 @@ bool dm_helpers_dp_read_dpcd(
 	struct amdgpu_dm_connector *aconnector = link->priv;
 
 	if (!aconnector) {
-		DC_LOG_DC("Failed to find connector for link!\n");
+		drm_dbg(aconnector->base.dev,
+			"Failed to find connector for link!\n");
 		return false;
 	}
 
@@ -661,7 +662,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
 		drm_dp_dpcd_read(aux, SYNAPTICS_RC_DATA, data, length);
 	}
 
-	DC_LOG_DC("%s: success = %d\n", __func__, success);
+	drm_dbg(aux->drm_dev, "success = %d\n", success);
 
 	return success;
 }
@@ -670,7 +671,7 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
 {
 	unsigned char data[16] = {0};
 
-	DC_LOG_DC("Start %s\n", __func__);
+	drm_dbg(aux->drm_dev, "Start\n");
 
 	// Step 2
 	data[0] = 'P';
@@ -728,7 +729,7 @@ static void apply_synaptics_fifo_reset_wa(struct drm_dp_aux *aux)
 	if (!execute_synaptics_rc_command(aux, true, 0x02, 0, 0, NULL))
 		return;
 
-	DC_LOG_DC("Done %s\n", __func__);
+	drm_dbg(aux->drm_dev, "Done\n");
 }
 
 /* MST Dock */
@@ -741,7 +742,8 @@ static uint8_t write_dsc_enable_synaptics_non_virtual_dpcd_mst(
 {
 	uint8_t ret = 0;
 
-	DC_LOG_DC("Configure DSC to non-virtual dpcd synaptics\n");
+	drm_info(aux->drm_dev,
+		 "Configure DSC to non-virtual dpcd synaptics\n");
 
 	if (enable) {
 		/* When DSC is enabled on previous boot and reboot with the hub,
@@ -779,7 +781,9 @@ bool dm_helpers_dp_write_dsc_enable(
 	static const uint8_t DSC_DECODING = 0x01;
 	static const uint8_t DSC_PASSTHROUGH = 0x02;
 
-	struct amdgpu_dm_connector *aconnector;
+	struct amdgpu_dm_connector *aconnector =
+		(struct amdgpu_dm_connector *)stream->dm_stream_context;
+	struct drm_device *dev = aconnector->base.dev;
 	struct drm_dp_mst_port *port;
 	uint8_t enable_dsc = enable ? DSC_DECODING : DSC_DISABLE;
 	uint8_t enable_passthrough = enable ? DSC_PASSTHROUGH : DSC_DISABLE;
@@ -789,8 +793,6 @@ bool dm_helpers_dp_write_dsc_enable(
 		return false;
 
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
-
 		if (!aconnector->dsc_aux)
 			return false;
 
@@ -807,30 +809,34 @@ bool dm_helpers_dp_write_dsc_enable(
 				ret = drm_dp_dpcd_write(port->passthrough_aux,
 							DP_DSC_ENABLE,
 							&enable_passthrough, 1);
-				DC_LOG_DC("Sent DSC pass-through enable to virtual dpcd port, ret = %u\n",
-					  ret);
+				drm_dbg(dev,
+					"Sent DSC pass-through enable to virtual dpcd port, ret = %u\n",
+					ret);
 			}
 
 			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
 						DP_DSC_ENABLE, &enable_dsc, 1);
-			DC_LOG_DC("Sent DSC decoding enable to %s port, ret = %u\n",
-				  (port->passthrough_aux) ? "remote RX" :
-				  "virtual dpcd",
-				  ret);
+			drm_dbg(dev,
+				"Sent DSC decoding enable to %s port, ret = %u\n",
+				(port->passthrough_aux) ? "remote RX" :
+				"virtual dpcd",
+				ret);
 		} else {
 			ret = drm_dp_dpcd_write(aconnector->dsc_aux,
 						DP_DSC_ENABLE, &enable_dsc, 1);
-			DC_LOG_DC("Sent DSC decoding disable to %s port, ret = %u\n",
-				  (port->passthrough_aux) ? "remote RX" :
-				  "virtual dpcd",
-				  ret);
+			drm_dbg(dev,
+				"Sent DSC decoding disable to %s port, ret = %u\n",
+				(port->passthrough_aux) ? "remote RX" :
+				"virtual dpcd",
+				ret);
 
 			if (port->passthrough_aux) {
 				ret = drm_dp_dpcd_write(port->passthrough_aux,
 							DP_DSC_ENABLE,
 							&enable_passthrough, 1);
-				DC_LOG_DC("Sent DSC pass-through disable to virtual dpcd port, ret = %u\n",
-					  ret);
+				drm_dbg(dev,
+					"Sent DSC pass-through disable to virtual dpcd port, ret = %u\n",
+					ret);
 			}
 		}
 	}
@@ -838,10 +844,14 @@ bool dm_helpers_dp_write_dsc_enable(
 	if (stream->signal == SIGNAL_TYPE_DISPLAY_PORT || stream->signal == SIGNAL_TYPE_EDP) {
 		if (stream->sink->link->dpcd_caps.dongle_type == DISPLAY_DONGLE_NONE) {
 			ret = dm_helpers_dp_write_dpcd(ctx, stream->link, DP_DSC_ENABLE, &enable_dsc, 1);
-			DC_LOG_DC("Send DSC %s to SST RX\n", enable_dsc ? "enable" : "disable");
+			drm_dbg(dev,
+				"Send DSC %s to SST RX\n",
+				enable_dsc ? "enable" : "disable");
 		} else if (stream->sink->link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER) {
 			ret = dm_helpers_dp_write_dpcd(ctx, stream->link, DP_DSC_ENABLE, &enable_dsc, 1);
-			DC_LOG_DC("Send DSC %s to DP-HDMI PCON\n", enable_dsc ? "enable" : "disable");
+			drm_dbg(dev,
+				"Send DSC %s to DP-HDMI PCON\n",
+				enable_dsc ? "enable" : "disable");
 		}
 	}
 
@@ -1110,6 +1120,7 @@ bool dm_helpers_dp_handle_test_pattern_request(
 	struct pipe_ctx *pipes = link->dc->current_state->res_ctx.pipe_ctx;
 	struct pipe_ctx *pipe_ctx = NULL;
 	struct amdgpu_dm_connector *aconnector = link->priv;
+	struct drm_device *dev = aconnector->base.dev;
 	int i;
 
 	for (i = 0; i < MAX_PIPES; i++) {
@@ -1187,12 +1198,12 @@ bool dm_helpers_dp_handle_test_pattern_request(
 		&& pipe_ctx->stream->timing.display_color_depth != requestColorDepth)
 		|| (requestPixelEncoding != PIXEL_ENCODING_UNDEFINED
 		&& pipe_ctx->stream->timing.pixel_encoding != requestPixelEncoding)) {
-		DC_LOG_DEBUG("%s: original bpc %d pix encoding %d, changing to %d  %d\n",
-				__func__,
-				pipe_ctx->stream->timing.display_color_depth,
-				pipe_ctx->stream->timing.pixel_encoding,
-				requestColorDepth,
-				requestPixelEncoding);
+		drm_dbg(dev,
+			"original bpc %d pix encoding %d, changing to %d  %d\n",
+			pipe_ctx->stream->timing.display_color_depth,
+			pipe_ctx->stream->timing.pixel_encoding,
+			requestColorDepth,
+			requestPixelEncoding);
 		pipe_ctx->stream->timing.display_color_depth = requestColorDepth;
 		pipe_ctx->stream->timing.pixel_encoding = requestPixelEncoding;
 
@@ -1203,7 +1214,7 @@ bool dm_helpers_dp_handle_test_pattern_request(
 		if (aconnector->timing_requested)
 			*aconnector->timing_requested = pipe_ctx->stream->timing;
 		else
-			DC_LOG_ERROR("%s: timing storage failed\n", __func__);
+			drm_err(dev, "timing storage failed\n");
 
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 57230661132b..e4c1b96f7eda 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -173,7 +173,8 @@ amdgpu_dm_mst_connector_early_unregister(struct drm_connector *connector)
 		if (dc_link->sink_count)
 			dc_link_remove_remote_sink(dc_link, dc_sink);
 
-		DC_LOG_MST("DM_MST: remove remote sink 0x%p, %d remaining\n",
+		drm_dbg(connector->dev,
+			"DM_MST: remove remote sink 0x%p, %d remaining\n",
 			dc_sink, dc_link->sink_count);
 
 		dc_sink_release(dc_sink);
@@ -325,8 +326,10 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 					return 0;
 				}
 
-				DC_LOG_MST("DM_MST: add remote sink 0x%p, %d remaining\n",
-					dc_sink, aconnector->dc_link->sink_count);
+				drm_dbg(connector->dev,
+					"DM_MST: add remote sink 0x%p, %d remaining\n",
+					dc_sink,
+					aconnector->dc_link->sink_count);
 
 				dc_sink->priv = aconnector;
 				aconnector->dc_sink = dc_sink;
@@ -361,7 +364,8 @@ static int dm_dp_mst_get_modes(struct drm_connector *connector)
 			return 0;
 		}
 
-		DC_LOG_MST("DM_MST: add remote sink 0x%p, %d remaining\n",
+		drm_dbg(connector->dev,
+			"DM_MST: add remote sink 0x%p, %d remaining\n",
 			dc_sink, aconnector->dc_link->sink_count);
 
 		dc_sink->priv = aconnector;
@@ -481,7 +485,8 @@ dm_dp_mst_detect(struct drm_connector *connector,
 		if (aconnector->dc_link->sink_count)
 			dc_link_remove_remote_sink(aconnector->dc_link, aconnector->dc_sink);
 
-		DC_LOG_MST("DM_MST: remove remote sink 0x%p, %d remaining\n",
+		drm_dbg(connector->dev,
+			"DM_MST: remove remote sink 0x%p, %d remaining\n",
 			aconnector->dc_link, aconnector->dc_link->sink_count);
 
 		dc_sink_release(aconnector->dc_sink);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 8038fe3d193e..03df26bd8e83 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1237,11 +1237,9 @@ void amdgpu_dm_plane_handle_cursor_update(struct drm_plane *plane,
 	if (!plane->state->fb && !old_plane_state->fb)
 		return;
 
-	DC_LOG_CURSOR("%s: crtc_id=%d with size %d to %d\n",
-		      __func__,
-		      amdgpu_crtc->crtc_id,
-		      plane->state->crtc_w,
-		      plane->state->crtc_h);
+	drm_dbg_atomic(plane->dev, "crtc_id=%d with size %d to %d\n",
+		       amdgpu_crtc->crtc_id, plane->state->crtc_w,
+		       plane->state->crtc_h);
 
 	ret = get_cursor_position(plane, crtc, &position);
 	if (ret)
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 6b3190447581..6450853fea94 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -2746,6 +2746,7 @@ static enum bp_result bios_get_board_layout_info(
 	struct board_layout_info *board_layout_info)
 {
 	unsigned int i;
+	struct bios_parser *bp;
 	enum bp_result record_result;
 
 	const unsigned int slot_index_to_vbios_id[MAX_BOARD_SLOTS] = {
@@ -2754,6 +2755,8 @@ static enum bp_result bios_get_board_layout_info(
 		0, 0
 	};
 
+	bp = BP_FROM_DCB(dcb);
+
 	if (board_layout_info == NULL) {
 		DC_LOG_DETECTION_EDID_PARSER("Invalid board_layout_info\n");
 		return BP_RESULT_BADINPUT;
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
index 694fe4271b4d..9c90090e7351 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c
@@ -59,8 +59,6 @@
 
 #define CTX \
 	clk_mgr->base.ctx
-#define DC_LOGGER \
-	clk_mgr->base.ctx->logger
 
 static const struct clk_mgr_registers clk_mgr_regs = {
 		CLK_COMMON_REG_LIST_DCN_201()
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index f91d0f6b0d7d..977f3e9917be 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -24,6 +24,8 @@
 
 #include "dm_services.h"
 
+#include "amdgpu.h"
+
 #include "dc.h"
 
 #include "core_status.h"
@@ -828,6 +830,7 @@ static void dc_destruct(struct dc *dc)
 	if (dc->ctx->created_bios)
 		dal_bios_parser_destroy(&dc->ctx->dc_bios);
 
+	kfree(dc->ctx->logger);
 	dc_perf_trace_destroy(&dc->ctx->perf_trace);
 
 	kfree(dc->ctx);
@@ -871,6 +874,15 @@ static bool dc_construct_ctx(struct dc *dc,
 	dc_ctx->clk_reg_offsets = init_params->clk_reg_offsets;
 
 	/* Create logger */
+	dc_ctx->logger = kmalloc(sizeof(*dc_ctx->logger), GFP_KERNEL);
+
+	if (!dc_ctx->logger) {
+		kfree(dc_ctx);
+		return false;
+	}
+
+	dc_ctx->logger->dev = adev_to_drm(init_params->driver);
+	dc->dml.logger = dc_ctx->logger;
 
 	dc_ctx->dce_version = resource_parse_asic_id(init_params->asic_id);
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
index 69f1c2b89a57..801cdbc8117d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_debug.c
@@ -36,6 +36,8 @@
 
 #include "resource.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 5810cf78cf29..21fed590f672 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -82,6 +82,8 @@
  */
 #define VISUAL_CONFIRM_DPP_OFFSET_DENO 240
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define UNABLE_TO_SPLIT -1
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index 91b3a4610957..a388f34c6d04 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -80,43 +80,43 @@ void dc_dmub_srv_wait_idle(struct dc_dmub_srv *dc_dmub_srv)
 	}
 }
 
-void dc_dmub_srv_clear_inbox0_ack(struct dc_dmub_srv *dmub_srv)
+void dc_dmub_srv_clear_inbox0_ack(struct dc_dmub_srv *dc_dmub_srv)
 {
-	struct dmub_srv *dmub = dmub_srv->dmub;
-	struct dc_context *dc_ctx = dmub_srv->ctx;
+	struct dmub_srv *dmub = dc_dmub_srv->dmub;
+	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
 	enum dmub_status status = DMUB_STATUS_OK;
 
 	status = dmub_srv_clear_inbox0_ack(dmub);
 	if (status != DMUB_STATUS_OK) {
 		DC_ERROR("Error clearing INBOX0 ack: status=%d\n", status);
-		dc_dmub_srv_log_diagnostic_data(dmub_srv);
+		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
 	}
 }
 
-void dc_dmub_srv_wait_for_inbox0_ack(struct dc_dmub_srv *dmub_srv)
+void dc_dmub_srv_wait_for_inbox0_ack(struct dc_dmub_srv *dc_dmub_srv)
 {
-	struct dmub_srv *dmub = dmub_srv->dmub;
-	struct dc_context *dc_ctx = dmub_srv->ctx;
+	struct dmub_srv *dmub = dc_dmub_srv->dmub;
+	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
 	enum dmub_status status = DMUB_STATUS_OK;
 
 	status = dmub_srv_wait_for_inbox0_ack(dmub, 100000);
 	if (status != DMUB_STATUS_OK) {
 		DC_ERROR("Error waiting for INBOX0 HW Lock Ack\n");
-		dc_dmub_srv_log_diagnostic_data(dmub_srv);
+		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
 	}
 }
 
-void dc_dmub_srv_send_inbox0_cmd(struct dc_dmub_srv *dmub_srv,
-		union dmub_inbox0_data_register data)
+void dc_dmub_srv_send_inbox0_cmd(struct dc_dmub_srv *dc_dmub_srv,
+				 union dmub_inbox0_data_register data)
 {
-	struct dmub_srv *dmub = dmub_srv->dmub;
-	struct dc_context *dc_ctx = dmub_srv->ctx;
+	struct dmub_srv *dmub = dc_dmub_srv->dmub;
+	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
 	enum dmub_status status = DMUB_STATUS_OK;
 
 	status = dmub_srv_send_inbox0_cmd(dmub, data);
 	if (status != DMUB_STATUS_OK) {
 		DC_ERROR("Error sending INBOX0 cmd\n");
-		dc_dmub_srv_log_diagnostic_data(dmub_srv);
+		dc_dmub_srv_log_diagnostic_data(dc_dmub_srv);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_helper.c b/drivers/gpu/drm/amd/display/dc/dc_helper.c
index c8505273421b..cb6eaddab720 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_helper.c
@@ -36,6 +36,9 @@
 #include "dc_dmub_srv.h"
 #include "reg_helper.h"
 
+#define DC_LOGGER \
+	ctx->logger
+
 static inline void submit_dmub_read_modify_write(
 	struct dc_reg_helper_state *offload,
 	const struct dc_context *ctx)
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index e531ad3acefc..40dc51853d62 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -773,6 +773,7 @@ struct dc_context {
 	struct dc *dc;
 
 	void *driver_context; /* e.g. amdgpu_device */
+	struct dal_logger *logger;
 	struct dc_perf_trace *perf_trace;
 	void *cgs_device;
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
index 75cf4ab8ae3c..5d3f6fa1011e 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.c
@@ -44,7 +44,10 @@
 #define CTX \
 	clk_src->base.ctx
 
-#define DC_LOGGER_INIT()
+#define DC_LOGGER \
+	calc_pll_cs->ctx->logger
+#define DC_LOGGER_INIT() \
+	struct calc_pll_clock_source *calc_pll_cs = &clk_src->calc_pll
 
 #undef FN
 #define FN(reg_name, field_name) \
@@ -1255,6 +1258,7 @@ static uint32_t dcn3_get_pix_clk_dividers(
 		struct pll_settings *pll_settings)
 {
 	unsigned long long actual_pix_clk_100Hz = pix_clk_params ? pix_clk_params->requested_pix_clk_100hz : 0;
+	struct dce110_clk_src *clk_src = TO_DCE110_CLK_SRC(cs);
 
 	DC_LOGGER_INIT();
 
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index baecaaf96968..44e93c20b207 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -82,7 +82,10 @@
 #define CTX \
 	hws->ctx
 
-#define DC_LOGGER_INIT()
+#define DC_LOGGER \
+	ctx->logger
+#define DC_LOGGER_INIT() \
+	struct dc_context *ctx = dc->ctx
 
 #define REG(reg)\
 	hws->regs->reg
@@ -2458,6 +2461,7 @@ static bool wait_for_reset_trigger_to_occur(
 	struct dc_context *dc_ctx,
 	struct timing_generator *tg)
 {
+	struct dc_context *ctx = dc_ctx;
 	bool rc = false;
 
 	/* To avoid endless loop we wait at most
@@ -2501,6 +2505,7 @@ static void dce110_enable_timing_synchronization(
 	struct dc_context *dc_ctx = dc->ctx;
 	struct dcp_gsl_params gsl_params = { 0 };
 	int i;
+	DC_LOGGER_INIT();
 
 	DC_SYNC_INFO("GSL: Setting-up...\n");
 
@@ -2546,6 +2551,7 @@ static void dce110_enable_per_frame_crtc_position_reset(
 	struct dc_context *dc_ctx = dc->ctx;
 	struct dcp_gsl_params gsl_params = { 0 };
 	int i;
+	DC_LOGGER_INIT();
 
 	gsl_params.gsl_group = 0;
 	gsl_params.gsl_master = 0;
@@ -2691,7 +2697,6 @@ static void dce110_program_front_end_for_pipe(
 	unsigned int i;
 	struct dce_hwseq *hws = dc->hwseq;
 
-	DC_LOGGER_INIT();
 	memset(&tbl_entry, 0, sizeof(tbl_entry));
 
 	memset(&adjust, 0, sizeof(adjust));
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index 79befa17bb03..817827fa0a0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -57,7 +57,10 @@
 #include "dce/dmub_outbox.h"
 #include "link.h"
 
-#define DC_LOGGER_INIT(logger)
+#define DC_LOGGER \
+	dc_logger
+#define DC_LOGGER_INIT(logger) \
+	struct dal_logger *dc_logger = logger
 
 #define CTX \
 	hws->ctx
@@ -1808,7 +1811,6 @@ static void log_tf(struct dc_context *ctx,
 	// DC_LOG_ALL_TF_POINTS logs all channels of the tf
 	int i = 0;
 
-	DC_LOGGER_INIT(ctx->logger);
 	DC_LOG_GAMMA("Gamma Correction TF");
 	DC_LOG_ALL_GAMMA("Logging all tf points...");
 	DC_LOG_ALL_TF_CHANNELS("Logging all channels...");
@@ -1990,6 +1992,8 @@ static bool wait_for_reset_trigger_to_occur(
 {
 	bool rc = false;
 
+	DC_LOGGER_INIT(dc_ctx->logger);
+
 	/* To avoid endless loop we wait at most
 	 * frames_to_wait_on_triggered_reset frames for the reset to occur. */
 	const uint32_t frames_to_wait_on_triggered_reset = 10;
@@ -2117,6 +2121,8 @@ static int dcn10_align_pixel_clocks(struct dc *dc, int group_size,
 	uint32_t dp_ref_clk_100hz =
 		dc->res_pool->dp_clock_source->ctx->dc->clk_mgr->dprefclk_khz*10;
 
+	DC_LOGGER_INIT(dc_ctx->logger);
+
 	hw_crtc_timing = kcalloc(MAX_PIPES, sizeof(*hw_crtc_timing), GFP_KERNEL);
 	if (!hw_crtc_timing)
 		return master;
@@ -2200,6 +2206,8 @@ void dcn10_enable_vblanks_synchronization(
 	struct timing_generator *tg;
 	int i, width, height, master;
 
+	DC_LOGGER_INIT(dc_ctx->logger);
+
 	for (i = 1; i < group_size; i++) {
 		opp = grouped_pipes[i]->stream_res.opp;
 		tg = grouped_pipes[i]->stream_res.tg;
@@ -2263,6 +2271,8 @@ void dcn10_enable_timing_synchronization(
 	struct timing_generator *tg;
 	int i, width, height;
 
+	DC_LOGGER_INIT(dc_ctx->logger);
+
 	DC_SYNC_INFO("Setting up OTG reset trigger\n");
 
 	for (i = 1; i < group_size; i++) {
@@ -2340,6 +2350,8 @@ void dcn10_enable_per_frame_crtc_position_reset(
 	struct dc_context *dc_ctx = dc->ctx;
 	int i;
 
+	DC_LOGGER_INIT(dc_ctx->logger);
+
 	DC_SYNC_INFO("Setting up\n");
 	for (i = 0; i < group_size; i++)
 		if (grouped_pipes[i]->stream_res.tg->funcs->enable_crtc_reset)
@@ -2994,8 +3006,6 @@ void dcn10_post_unlock_program_front_end(
 {
 	int i;
 
-	DC_LOGGER_INIT(dc->ctx->logger);
-
 	for (i = 0; i < dc->res_pool->pipe_count; i++) {
 		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 4566bc7abf17..139cf31d2e45 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -30,6 +30,8 @@
 #include "reg_helper.h"
 #include "basics/conversion.h"
 
+#define DC_LOGGER \
+	ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define REG(reg)\
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 19ab08f5122e..2e4f0c2dfb50 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -56,7 +56,10 @@
 #include "link_hwss.h"
 #include "link.h"
 
-#define DC_LOGGER_INIT(logger)
+#define DC_LOGGER \
+	dc_logger
+#define DC_LOGGER_INIT(logger) \
+	struct dal_logger *dc_logger = logger
 
 #define CTX \
 	hws->ctx
@@ -1947,8 +1950,6 @@ void dcn20_post_unlock_program_front_end(
 	unsigned int polling_interval_us = 1;
 	struct dce_hwseq *hwseq = dc->hwseq;
 
-	DC_LOGGER_INIT(dc->ctx->logger);
-
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
 			dc->hwss.disable_plane(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
index 96c263223315..5bc3bc60a2ac 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c
@@ -38,6 +38,9 @@
 #define FN(reg_name, field_name) \
 	vmid->shifts->field_name, vmid->masks->field_name
 
+#define DC_LOGGER \
+	CTX->logger
+
 static void dcn20_wait_for_vmid_ready(struct dcn20_vmid *vmid)
 {
 	/* According the hardware spec, we need to poll for the lowest
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
index f976fac8dc3f..68cad55c72ab 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hubp.c
@@ -31,6 +31,8 @@
 
 #include "dc_dmub_srv.h"
 
+#define DC_LOGGER \
+	ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define REG(reg)\
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
index da56962227fd..9f3c8626c0b2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
@@ -91,6 +91,8 @@
 #include "amdgpu_socbb.h"
 #include "dc_dmub_srv.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 enum dcn30_clk_src_array_id {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
index c489ad043b87..6d2f99c1fcd5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
@@ -92,6 +92,8 @@
 #define TO_DCN301_RES_POOL(pool)\
 	container_of(pool, struct dcn301_resource_pool, base)
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 enum dcn301_clk_src_array_id {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
index f5b8b92a84f2..06332bd4e625 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
@@ -74,6 +74,8 @@
 #include "nbio/nbio_7_4_offset.h"
 #include "amdgpu_socbb.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 static const struct dc_debug_options debug_defaults_drv = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
index d59561605c17..0d91291a54a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -56,6 +56,8 @@
 
 #include "dml/dcn303/dcn303_fpu.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
index 994289b3d5a3..239d7ce8e533 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
@@ -104,6 +104,8 @@
 
 #include "link_enc_cfg.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 enum dcn31_clk_src_array_id {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
index 33a8626bda73..5b197807080e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -62,7 +62,7 @@
 #define REG(reg)\
 	hws->regs->reg
 #define DC_LOGGER \
-		dc->ctx->logger
+	stream->ctx->logger
 
 
 #undef FN
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 4d0052ca742f..c637d8b6095a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -118,6 +118,8 @@
 #define regBIF_BX2_BIOS_SCRATCH_6			0x003e
 #define regBIF_BX2_BIOS_SCRATCH_6_BASE_IDX		1
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 enum dcn31_clk_src_array_id {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index e8a989a50afa..76fd7a41bdbf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -58,7 +58,7 @@
 #define REG(reg)\
 	hws->regs->reg
 #define DC_LOGGER \
-		dc->ctx->logger
+	stream->ctx->logger
 
 
 #undef FN
diff --git a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
index 06960fada059..e5a8a341bd0e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn35/dcn35_hwseq.c
@@ -55,14 +55,15 @@
 #include "dcn31/dcn31_hwseq.h"
 #include "dcn20/dcn20_hwseq.h"
 
-#define DC_LOGGER_INIT(logger)
+#define DC_LOGGER_INIT(logger) \
+	struct dal_logger *dc_logger = logger
 
 #define CTX \
 	hws->ctx
 #define REG(reg)\
 	hws->regs->reg
 #define DC_LOGGER \
-		dc->ctx->logger
+	dc_logger
 
 
 #undef FN
@@ -341,6 +342,8 @@ static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
 	struct pipe_ctx *odm_pipe;
 	int opp_cnt = 1;
 
+	DC_LOGGER_INIT(stream->ctx->logger);
+
 	ASSERT(dsc);
 	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
 		opp_cnt++;
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
index a68fb45ed487..abd8169daf30 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c
@@ -34,6 +34,8 @@
 #include "link.h"
 #include "dcn20_fpu.h"
 
+#define DC_LOGGER \
+	dc->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #ifndef MAX
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
index 9a595246824d..6f4c97543c14 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
@@ -73,7 +73,7 @@ enum dentist_divider_range {
 	clk_mgr->base.ctx
 
 #define DC_LOGGER \
-	clk_mgr->base.ctx->logger
+	dc->ctx->logger
 
 
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
index 861f3cd5b356..46fb3649bc86 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c
@@ -27,6 +27,8 @@
 #include "link_hwss_dio.h"
 #include "link_enc_cfg.h"
 
+#define DC_LOGGER \
+	link->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 static void update_dpia_stream_allocation_table(struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index c9b6676eaf53..aef8ef2f8d88 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -47,6 +47,8 @@
 #include "dm_helpers.h"
 #include "clk_mgr.h"
 
+#define DC_LOGGER \
+	link->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define LINK_INFO(...) \
@@ -322,6 +324,7 @@ static void query_dp_dual_mode_adaptor(
 	bool is_type2_dongle = false;
 	int retry_count = 2;
 	struct dp_hdmi_dongle_signature_data *dongle_signature;
+	struct dc_link *link = ddc->link;
 
 	/* Assume we have no valid DP passive dongle connected */
 	*dongle = DISPLAY_DONGLE_NONE;
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
index e5129580369a..4538451945b4 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -55,7 +55,10 @@
 #include "dccg.h"
 #include "clk_mgr.h"
 #include "atomfirmware.h"
-#define DC_LOGGER_INIT(logger)
+#define DC_LOGGER \
+	dc_logger
+#define DC_LOGGER_INIT(logger) \
+	struct dal_logger *dc_logger = logger
 
 #define LINK_INFO(...) \
 	DC_LOG_HW_HOTPLUG(  \
@@ -2264,6 +2267,8 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 	struct dc_link *link = stream->sink->link;
 	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
 
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
 	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
 
 	if (dp_is_128b_132b_signal(pipe_ctx))
@@ -2271,8 +2276,6 @@ void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
 	if (dc_is_virtual_signal(pipe_ctx->stream->signal))
 		return;
 
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
 	if (pipe_ctx->stream->sink) {
 		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
 			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
@@ -2376,6 +2379,8 @@ void link_set_dpms_on(
 	bool apply_edp_fast_boot_optimization =
 		pipe_ctx->stream->apply_edp_fast_boot_optimization;
 
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
 	ASSERT(is_master_pipe_for_link(link, pipe_ctx));
 
 	if (dp_is_128b_132b_signal(pipe_ctx))
@@ -2383,8 +2388,6 @@ void link_set_dpms_on(
 	if (dc_is_virtual_signal(pipe_ctx->stream->signal))
 		return;
 
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
 	if (pipe_ctx->stream->sink) {
 		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
 			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 754aab662489..7abfc67d10a6 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -45,6 +45,8 @@
 #include "gpio_service_interface.h"
 #include "atomfirmware.h"
 
+#define DC_LOGGER \
+	dc_ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define LINK_INFO(...) \
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
index ecfd83299e75..c2d40979203e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
@@ -38,6 +38,8 @@
 #include "dm_helpers.h"
 #include "atomfirmware.h"
 
+#define DC_LOGGER \
+	ddc_service->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 static const uint8_t DP_VGA_DONGLE_BRANCH_DEV_NAME[] = "DpVga";
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index e047bbeaa49a..34bf8a9ef738 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -38,6 +38,8 @@
 #include "link/link_dpms.h"
 #include "dm_helpers.h"
 
+#define DC_LOGGER \
+	link->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 bool dp_parse_link_loss_status(
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index 24b47fa82f93..dad43e6d0a0d 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -38,6 +38,8 @@
 #include "dc/dc_dmub_srv.h"
 #include "dce/dmub_replay.h"
 #include "abm.h"
+#define DC_LOGGER \
+	link->ctx->logger
 #define DC_LOGGER_INIT(logger)
 
 #define DP_SINK_PR_ENABLE_AND_CONFIGURATION		0x37B
diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index aad8095660c9..6c4578d347af 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -37,6 +37,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 
 #include "cgs_common.h"
diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
index fb657f7408a7..f39e2785e618 100644
--- a/drivers/gpu/drm/amd/display/include/logger_types.h
+++ b/drivers/gpu/drm/amd/display/include/logger_types.h
@@ -28,145 +28,51 @@
 
 #include "os_types.h"
 
-#define MAX_NAME_LEN 32
-
-#define DC_LOG_ERROR(...) DRM_ERROR(__VA_ARGS__)
-#define DC_LOG_WARNING(...) DRM_WARN(__VA_ARGS__)
-#define DC_LOG_DEBUG(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DC(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DTN(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_ERROR(...) drm_err((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_WARNING(...) drm_warn((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_DEBUG(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_DC(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_SURFACE(...) pr_debug("[SURFACE]:"__VA_ARGS__)
-#define DC_LOG_CURSOR(...) pr_debug("[CURSOR]:"__VA_ARGS__)
-#define DC_LOG_PFLIP(...) pr_debug("[PFLIP]:"__VA_ARGS__)
-#define DC_LOG_VBLANK(...) pr_debug("[VBLANK]:"__VA_ARGS__)
-#define DC_LOG_HW_HOTPLUG(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_HW_HOTPLUG(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_HW_LINK_TRAINING(...) pr_debug("[HW_LINK_TRAINING]:"__VA_ARGS__)
-#define DC_LOG_HW_SET_MODE(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_HW_RESUME_S3(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_HW_RESUME_S3(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_HW_AUDIO(...) pr_debug("[HW_AUDIO]:"__VA_ARGS__)
-#define DC_LOG_HW_HPD_IRQ(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_MST(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_HW_HPD_IRQ(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_MST(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_SCALER(...) pr_debug("[SCALER]:"__VA_ARGS__)
 #define DC_LOG_BIOS(...) pr_debug("[BIOS]:"__VA_ARGS__)
 #define DC_LOG_BANDWIDTH_CALCS(...) pr_debug("[BANDWIDTH_CALCS]:"__VA_ARGS__)
-#define DC_LOG_BANDWIDTH_VALIDATION(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_I2C_AUX(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_SYNC(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_BACKLIGHT(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_FEATURE_OVERRIDE(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DETECTION_EDID_PARSER(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DETECTION_DP_CAPS(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_RESOURCE(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_BANDWIDTH_VALIDATION(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_SYNC(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_BACKLIGHT(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_DETECTION_EDID_PARSER(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_DETECTION_DP_CAPS(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_DML(...) pr_debug("[DML]:"__VA_ARGS__)
-#define DC_LOG_EVENT_MODE_SET(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_EVENT_DETECTION(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_EVENT_LINK_TRAINING(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_EVENT_LINK_LOSS(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_EVENT_UNDERFLOW(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_EVENT_MODE_SET(...) drm_dbg_kms((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_EVENT_DETECTION(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_EVENT_LINK_TRAINING(...) \
+	drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_EVENT_LINK_LOSS(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_IF_TRACE(...) pr_debug("[IF_TRACE]:"__VA_ARGS__)
-#define DC_LOG_PERF_TRACE(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_RETIMER_REDRIVER(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_PERF_TRACE(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_RETIMER_REDRIVER(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_GAMMA(...) pr_debug("[GAMMA]:"__VA_ARGS__)
 #define DC_LOG_ALL_GAMMA(...) pr_debug("[GAMMA]:"__VA_ARGS__)
 #define DC_LOG_ALL_TF_CHANNELS(...) pr_debug("[GAMMA]:"__VA_ARGS__)
-#define DC_LOG_DSC(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_DSC(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_SMU(...) pr_debug("[SMU_MSG]:"__VA_ARGS__)
-#define DC_LOG_DWB(...) DRM_DEBUG_KMS(__VA_ARGS__)
-#define DC_LOG_DP2(...) DRM_DEBUG_KMS(__VA_ARGS__)
+#define DC_LOG_DWB(...) drm_dbg((DC_LOGGER)->dev, __VA_ARGS__)
+#define DC_LOG_DP2(...) drm_dbg_dp((DC_LOGGER)->dev, __VA_ARGS__)
 #define DC_LOG_AUTO_DPM_TEST(...) pr_debug("[AutoDPMTest]: "__VA_ARGS__)
 
-struct dal_logger;
-
 struct dc_log_buffer_ctx {
 	char *buf;
 	size_t pos;
 	size_t size;
 };
 
-enum dc_log_type {
-	LOG_ERROR = 0,
-	LOG_WARNING,
-	LOG_DEBUG,
-	LOG_DC,
-	LOG_DTN,
-	LOG_SURFACE,
-	LOG_HW_HOTPLUG,
-	LOG_HW_LINK_TRAINING,
-	LOG_HW_SET_MODE,
-	LOG_HW_RESUME_S3,
-	LOG_HW_AUDIO,
-	LOG_HW_HPD_IRQ,
-	LOG_MST,
-	LOG_SCALER,
-	LOG_BIOS,
-	LOG_BANDWIDTH_CALCS,
-	LOG_BANDWIDTH_VALIDATION,
-	LOG_I2C_AUX,
-	LOG_SYNC,
-	LOG_BACKLIGHT,
-	LOG_FEATURE_OVERRIDE,
-	LOG_DETECTION_EDID_PARSER,
-	LOG_DETECTION_DP_CAPS,
-	LOG_RESOURCE,
-	LOG_DML,
-	LOG_EVENT_MODE_SET,
-	LOG_EVENT_DETECTION,
-	LOG_EVENT_LINK_TRAINING,
-	LOG_EVENT_LINK_LOSS,
-	LOG_EVENT_UNDERFLOW,
-	LOG_IF_TRACE,
-	LOG_PERF_TRACE,
-	LOG_DISPLAYSTATS,
-	LOG_HDMI_RETIMER_REDRIVER,
-	LOG_DSC,
-	LOG_SMU_MSG,
-	LOG_DC2RESERVED4,
-	LOG_DC2RESERVED5,
-	LOG_DWB,
-	LOG_GAMMA_DEBUG,
-	LOG_MAX_HW_POINTS,
-	LOG_ALL_TF_CHANNELS,
-	LOG_SAMPLE_1DLUT,
-	LOG_DP2,
-	LOG_DC2RESERVED12,
-	LOG_AUTO_DPM_TEST,
+struct dal_logger {
+	struct drm_device *dev;
 };
 
-#define DC_MIN_LOG_MASK ((1 << LOG_ERROR) | \
-		(1 << LOG_DETECTION_EDID_PARSER))
-
-#define DC_DEFAULT_LOG_MASK ((1ULL << LOG_ERROR) | \
-		(1ULL << LOG_WARNING) | \
-		(1ULL << LOG_EVENT_MODE_SET) | \
-		(1ULL << LOG_EVENT_DETECTION) | \
-		(1ULL << LOG_EVENT_LINK_TRAINING) | \
-		(1ULL << LOG_EVENT_LINK_LOSS) | \
-		(1ULL << LOG_EVENT_UNDERFLOW) | \
-		(1ULL << LOG_RESOURCE) | \
-		(1ULL << LOG_FEATURE_OVERRIDE) | \
-		(1ULL << LOG_DETECTION_EDID_PARSER) | \
-		(1ULL << LOG_DC) | \
-		(1ULL << LOG_HW_HOTPLUG) | \
-		(1ULL << LOG_HW_SET_MODE) | \
-		(1ULL << LOG_HW_RESUME_S3) | \
-		(1ULL << LOG_HW_HPD_IRQ) | \
-		(1ULL << LOG_SYNC) | \
-		(1ULL << LOG_BANDWIDTH_VALIDATION) | \
-		(1ULL << LOG_MST) | \
-		(1ULL << LOG_DETECTION_DP_CAPS) | \
-		(1ULL << LOG_BACKLIGHT)) | \
-		(1ULL << LOG_I2C_AUX) | \
-		(1ULL << LOG_IF_TRACE) | \
-		(1ULL << LOG_HDMI_FRL) | \
-		(1ULL << LOG_SCALER) | \
-		(1ULL << LOG_DTN) | \
-		(1ULL << LOG_AUTO_DPM_TEST)/* | \
-		(1ULL << LOG_DEBUG) | \
-		(1ULL << LOG_BIOS) | \
-		(1ULL << LOG_SURFACE) | \
-		(1ULL << LOG_DML) | \
-		(1ULL << LOG_HW_LINK_TRAINING) | \
-		(1ULL << LOG_HW_AUDIO)| \
-		(1ULL << LOG_BANDWIDTH_CALCS)*/
-
 #endif /* __DAL_LOGGER_TYPES_H__ */
-- 
2.42.0

