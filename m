Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF33EB068
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Aug 2021 08:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94B6E514;
	Fri, 13 Aug 2021 06:35:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE3A6E514
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Aug 2021 06:35:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQalOvElfz5i/Tj/77HATa1wS0rkhMnmx2pJcxAZQlWNO6BfXHpX1JmsI4Fdv1gwlS7eKE3X1I6uZwvZlX5IVgPMK/XAGG8OrgGNphrAY2v9LdCQVo1mXdGA+H5LmrHvPACI3wtbXhVEIrZxiZ6xaarBFS5PDzD8pTYSTU7FkucS+bF1PkYRIA91OLNRX8DQEtxduPMV2bVsdQNX9iZszL2UIjrjhT7s67yWSgJbjEvkAPwSpRmfEwxuJYIYbaYCy+bOp994gMdvjO1ItdeHHAKWKmWg9m/oXEiUw4kOuBWbedZNVQAS4ts15sd6Rj4sF7MLvRsHABhPQawSwiQbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXWwsq6hU1ivhjjwJWaZM3QFr3J0nItkyel+mizd32Q=;
 b=hpb36zYjxSDx3/SctTbZg1L0SKpHlfwQLkzgMjfBeXGSgPFnaiCF55AeAgzG5j5MQAiSjipmMz8j/cml6NWcLZHhVm3psUuBhpxjeUgBV5Q1NHDGSupqec0IfWyzm5gn9ATfK6uRRFRphCpcCn25VA3l1Zokq1EPTIJ8UGDLZwI0xbniALZo5nI27M8xO86haPByP9mT33q/6F+cYJdY80lhvSRMfxj6Qy2c2apwpYbgNgE9Qm3Rka1DH4ST/ezM+hw0afuHvVGw5adLUJtTE58mOFUaeRADPrtO87GlxpJEYqFACNK+ph05qtl1CUeWBrIFhkFk76clUYTGcsSR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXWwsq6hU1ivhjjwJWaZM3QFr3J0nItkyel+mizd32Q=;
 b=PhVNkQDN/TrwbbLA1ssNdw6vMnr2Ia3o5ueWCXGF3p4AO8ZYjUxzndFBhz/sk3nhuOSGe23fM7dQL/ZdrvpXXMlCFQojLbHEAsmO0Ofyo1KqxqiLRSa+/whZdS5cU5PAw6RkfmZfVwkYibhMRnJmnTVAI/WZ+JbUUjF44XzR/4Q=
Received: from BN9PR03CA0419.namprd03.prod.outlook.com (2603:10b6:408:111::34)
 by BN6PR1201MB0131.namprd12.prod.outlook.com (2603:10b6:405:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 13 Aug
 2021 06:35:37 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::c0) by BN9PR03CA0419.outlook.office365.com
 (2603:10b6:408:111::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Fri, 13 Aug 2021 06:35:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 06:35:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 13 Aug
 2021 01:35:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 12 Aug
 2021 23:35:36 -0700
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12
 via Frontend Transport; Fri, 13 Aug 2021 01:35:33 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Bhawanpreet.Lakha@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <Aurabindo.Pillai@amd.com>, <Qingqing.Zhuo@amd.com>, <bindu.r@amd.com>,
 <Anson.Jacob@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Roman Li <Roman.Li@amd.com>, Wayne Lin <wayne.lin@amd.com>
Subject: [PATCH 3/7] drm/amd/display: Use vblank control events for PSR
 enable/disable
Date: Fri, 13 Aug 2021 14:34:58 +0800
Message-ID: <20210813063502.3106309-4-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210813063502.3106309-1-Wayne.Lin@amd.com>
References: <20210813063502.3106309-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e5eae49-cf95-42c0-c6fe-08d95e248f9f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0131:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB013144051D071DDCCD494570FCFA9@BN6PR1201MB0131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhc8jYP5+rqJmXbltNjij/5DkWOJFGo62XsFBBngNxXTNkk7RnMUMUFJGbcOSh45329BZP8WRQ/PCkXO7rOW5Lqauyc81hrOujJ+s9IWiLZRedof4tQzYOpgDDWEFqGWz7kEQMK4vaKmiJ9ojb4szNYAKN0IKQ2V0zcFJeTQZFTAj0ydqWjfjM9oLdrScumFTRBqu6D3ytngCi4lE35yrkLcGrCJQIR7X9HJdO0Ie8gcJvgTDKihB04M66ExCi7C35mAB0WtzE7s4s4VPDW0ycGtY5xYqq5aSw4QCVwHwTojPtQ34sfq3mau3dqDhUtz7gZ5bfyfMvHQtGYKkAvIg8AL78ElcUFovSbUXGetPTm0PH68SnKK3BPPJ9aNh7blt5kpJZ5wUdjvdtr2hyUDaPpA3buPK99uy/1dAkwFcWYUhtxQITIA3SD3nfeiPxRaaU7TZ4DHTPJcS0V0X9Dkjb9PoIczSKc3Akgkxj8tOU4isLVQ4Xo7OsxIUSupa5wyw8FZ87NaZH2gz57K0WsaIZMNpiq/F3fxs7gHcnK0B2c7fy38LzfsqJsuA0Pv4mre0alAkHjWszXF9kY43RNMSN2uEWw1DXxFzBwv5F6h25PZKvewuQvmX9NAifm2X4IqdX6bM6WsVylQH1mRmvTQ2kirNovZ4Av9PuIcYcUp+3Ptpfw1SPyMRLfXURuyYwgI0WfzjTDWO/PGaYA39tb9mFb1MJCflShOt/kQ5orZHJ3u31DjN2PCwi42U3V5d4JFPolFdP/Doparw7LiNFXe8A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(36840700001)(46966006)(4326008)(2616005)(83380400001)(478600001)(6666004)(26005)(2906002)(70206006)(70586007)(5660300002)(8676002)(316002)(8936002)(336012)(356005)(36756003)(81166007)(7696005)(6916009)(36860700001)(34020700004)(47076005)(54906003)(82310400003)(186003)(86362001)(426003)(82740400003)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 06:35:37.0662 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e5eae49-cf95-42c0-c6fe-08d95e248f9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0131
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

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

[Why]
PSR can disable the HUBP along with the OTG when PSR is active.

We'll hit a pageflip timeout when the OTG is disable because we're no
longer updating the CRTC vblank counter and the pflip high IRQ will
not fire on the flip.

In order to flip the page flip timeout occur we should modify the
enter/exit conditions to match DRM requirements.

[How]
Use our deferred handlers for DRM vblank control to notify DMCU(B)
when it can enable or disable PSR based on whether vblank is disabled or
enabled respectively.

We'll need to pass along the stream with the notification now because
we want to access the CRTC state while the CRTC is locked to get the
stream state prior to the commit.

Retain a reference to the stream so it remains safe to continue to
access and release that reference once we're done with it.

Enable/disable logic follows what we were previously doing in
update_planes.

The workqueue has to be flushed before programming streams or planes
to ensure that we exit out of idle optimizations and PSR before
these events occur if necessary.

To keep the skip count logic the same to avoid FBCON PSR enablement
requires copying the allow condition onto the DM IRQ parameters - a
field that we can actually access from the worker.

Reviewed-by: Roman Li <Roman.Li@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 48 +++++++++++++++----
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
 .../display/amdgpu_dm/amdgpu_dm_irq_params.h  |  1 +
 3 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f88b6c5b83cd..cebd663b6708 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1061,7 +1061,22 @@ static void vblank_control_worker(struct work_struct *work)
 
 	DRM_DEBUG_KMS("Allow idle optimizations (MALL): %d\n", dm->active_vblank_irq_count == 0);
 
+	/* Control PSR based on vblank requirements from OS */
+	if (vblank_work->stream && vblank_work->stream->link) {
+		if (vblank_work->enable) {
+			if (vblank_work->stream->link->psr_settings.psr_allow_active)
+				amdgpu_dm_psr_disable(vblank_work->stream);
+		} else if (vblank_work->stream->link->psr_settings.psr_feature_enabled &&
+			   !vblank_work->stream->link->psr_settings.psr_allow_active &&
+			   vblank_work->acrtc->dm_irq_params.allow_psr_entry) {
+			amdgpu_dm_psr_enable(vblank_work->stream);
+		}
+	}
+
 	mutex_unlock(&dm->dc_lock);
+
+	dc_stream_release(vblank_work->stream);
+
 	kfree(vblank_work);
 }
 
@@ -6018,6 +6033,11 @@ static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
 	work->acrtc = acrtc;
 	work->enable = enable;
 
+	if (acrtc_state->stream) {
+		dc_stream_retain(acrtc_state->stream);
+		work->stream = acrtc_state->stream;
+	}
+
 	queue_work(dm->vblank_control_workqueue, &work->work);
 #endif
 
@@ -8623,6 +8643,12 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 	/* Update the planes if changed or disable if we don't have any. */
 	if ((planes_count || acrtc_state->active_planes == 0) &&
 		acrtc_state->stream) {
+		/*
+		 * If PSR or idle optimizations are enabled then flush out
+		 * any pending work before hardware programming.
+		 */
+		flush_workqueue(dm->vblank_control_workqueue);
+
 		bundle->stream_update.stream = acrtc_state->stream;
 		if (new_pcrtc_state->mode_changed) {
 			bundle->stream_update.src = acrtc_state->stream->src;
@@ -8691,16 +8717,20 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 				acrtc_state->stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED &&
 				!acrtc_state->stream->link->psr_settings.psr_feature_enabled)
 			amdgpu_dm_link_setup_psr(acrtc_state->stream);
-		else if ((acrtc_state->update_type == UPDATE_TYPE_FAST) &&
-				acrtc_state->stream->link->psr_settings.psr_feature_enabled &&
-				!acrtc_state->stream->link->psr_settings.psr_allow_active) {
-			struct amdgpu_dm_connector *aconn = (struct amdgpu_dm_connector *)
-					acrtc_state->stream->dm_stream_context;
+
+		/* Decrement skip count when PSR is enabled and we're doing fast updates. */
+		if (acrtc_state->update_type == UPDATE_TYPE_FAST &&
+		    acrtc_state->stream->link->psr_settings.psr_feature_enabled) {
+			struct amdgpu_dm_connector *aconn =
+				(struct amdgpu_dm_connector *)acrtc_state->stream->dm_stream_context;
 
 			if (aconn->psr_skip_count > 0)
 				aconn->psr_skip_count--;
-			else
-				amdgpu_dm_psr_enable(acrtc_state->stream);
+
+			/* Allow PSR when skip count is 0. */
+			acrtc_attach->dm_irq_params.allow_psr_entry = !aconn->psr_skip_count;
+		} else {
+			acrtc_attach->dm_irq_params.allow_psr_entry = false;
 		}
 
 		mutex_unlock(&dm->dc_lock);
@@ -8949,8 +8979,10 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 
 	if (dc_state) {
 		/* if there mode set or reset, disable eDP PSR */
-		if (mode_set_reset_required)
+		if (mode_set_reset_required) {
+			flush_workqueue(dm->vblank_control_workqueue);
 			amdgpu_dm_psr_disable_all(dm);
+		}
 
 		dm_enable_per_frame_crtc_master_sync(dc_state);
 		mutex_lock(&dm->dc_lock);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index c6b8b835b08a..d1d353a7c77d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -91,12 +91,14 @@ struct dm_compressor_info {
  * @work: Kernel work data for the work event
  * @dm: amdgpu display manager device
  * @acrtc: amdgpu CRTC instance for which the event has occurred
+ * @stream: DC stream for which the event has occurred
  * @enable: true if enabling vblank
  */
 struct vblank_control_work {
 	struct work_struct work;
 	struct amdgpu_display_manager *dm;
 	struct amdgpu_crtc *acrtc;
+	struct dc_stream_state *stream;
 	bool enable;
 };
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
index f3b93ba69a27..79b5f9999fec 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
@@ -33,6 +33,7 @@ struct dm_irq_params {
 	struct mod_vrr_params vrr_params;
 	struct dc_stream_state *stream;
 	int active_planes;
+	bool allow_psr_entry;
 	struct mod_freesync_config freesync_config;
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.25.1

