Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6206064F9
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Oct 2022 17:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805AF10E4F6;
	Thu, 20 Oct 2022 15:48:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AE010E160
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Oct 2022 15:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ms1QowTvkUYfiMElAwS5MnTSTZPnbKqCB+AJoScCCXmESaR30nJNf6n7q+u67x656f5Cfk7e1enm/XG+bUiTWYT+devZjlXQOFUSndY3P+Rh/hTF9KjGygJA+mEq0zvZFbKY1hSkUTXalASTPzToIhISRq+v8t6rXGnRUylDpCnu0nbehYTHECuXCR49ELQ/4O5RCOezAftKpTmvIIhfHA3HL8ac3WJyx8RCygAHo6Cj325SPOcwOI6qrUebv+tk3zR7WKDdbxT0rpCetUAfrNyWcEe4iPOZTMVO8QePOFocaKPMWnx0piQUSRdRSlHXowEuBFll1gzOD1OAJ0BSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxzC8Bs4Tll52YnIbifChGoIL2ISn0Ld4S7AtG7gwU4=;
 b=Dy2kfigvPWsBCv2FuviVJ+2XOYAO8GIPT1jrgyrkZG2RM+BvwQ/zhGvIehPt3sNlulAJ3qpw4mSjk8a8C1hSvqWPXd+BjurUirpSloorAkcDwJMnKVdfMkUnOiYOPxOIhvzSYVvQta4X6T+onkwsvvfA0T8VjSgP55JNMuBgsA6LLXcRE0/t13cTvE6KO/nBNvq8LO61Z4iqwXf51CpyvFzG5LKMCMXCJCkR/uKHr12K4L6lUb4cMnQT6wJgsuvqYQDr241utJit2Tt4D5CE8k+1tsXpB6wJWLXtvxC2Dv9uv1nWBeKFzBQp7eWRV/VyzDYjQpVADaVrLyFY8YqsEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxzC8Bs4Tll52YnIbifChGoIL2ISn0Ld4S7AtG7gwU4=;
 b=JzEBmhmYOw0c2sE6NFHNQTfdFajCjR663swWuEx6ugXn++JxP78FnrGR+nt2xhiRmeaue3LKRyMaAReFnX9OSF3rmQ7eNbiLQR7Ql5YheDO4rEczn5qtsRvRhUrZSmekZxvd3kKBaaKoXm9ZKtwFiubKQ0evVPzPU12oHHFErDw=
Received: from DM6PR11CA0063.namprd11.prod.outlook.com (2603:10b6:5:14c::40)
 by BL1PR12MB5379.namprd12.prod.outlook.com (2603:10b6:208:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 15:47:52 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::d8) by DM6PR11CA0063.outlook.office365.com
 (2603:10b6:5:14c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Thu, 20 Oct 2022 15:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Thu, 20 Oct 2022 15:47:52 +0000
Received: from atma3.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 20 Oct
 2022 10:47:50 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/33] drm/amd/display: Implement secure display on DCN21
Date: Thu, 20 Oct 2022 11:46:42 -0400
Message-ID: <20221020154702.503934-14-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221020154702.503934-1-Rodrigo.Siqueira@amd.com>
References: <20221020154702.503934-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|BL1PR12MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: d4301db1-ebea-4828-ab86-08dab2b272a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8L3Z58aKVKbUmFdFEkfRgHvIiBA82qWRCVA/AoxMEGZoS3zAJjqjOcBJcjA6AQ/lFb1M8VwEYOpCIX/45gFePrDEzhi8int8qNLkyKnWfrlfToz8vlMcW3/JKjdxws4b6jAJPRv8h9J+C/8iJdft9vZnXn+xzaUdtvMyqF+pQ3rfW3JUxR4BFRm2qDOR8RpM099eJsp4u5K520bRdItyLKUbZq7N38vV6jxr2UhRqeUrtk1TM3gG8/WIQ2SlGURNpLNk6vdW7Xj/4NTXMYaM+ahcyr87CZvwWxN61r1PTR5FwM03ENQwY7lszmv1eByE9ZgYwhpXNvA3BX/90O/uuLKY56d7aLNqLW9m7hb1l3AKpo0Yl2gcK9F4NUYopeVNoid/g6+zj5LvAeprfvnR2vAaJ8+NmR3/pOdiKao8QqAos+ig9uQbaovoGhQvyEQY3mSk4UpXOZ5atyiS6310XbIzBRh4cok+XvxTCgozIPEyUsD8tLUVchO04LB18fqQRGldzwnDclBI7MruJcHUQEjJNXRNp1DxzqTymmPrfKrotjOR9v94rBY/kf5cUR47oxyYOU6icxD6mY3jjPPGEmkF0l0QHwQ9mzessq5RJkXcNJyvFRoF08/nqGXimy4MOhULkvkSBRFvPuO+BJSG0rHzvIy13NxrjXfYxEmjhJbDsLHnV9NNtvfrbpVS5vhiuAkf54FPeDocsWppTi6ltKA5xOlxN45RtF7Z9fGi2mMur+7lv/Cbmx5eYUTCfwrh/f1v/VhnWvztL2XuOvZA20+9o2afpZf+CR8v6RpwIQu5fYq0Yg6eazoF/WKQCOiF
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(2906002)(2616005)(82740400003)(81166007)(478600001)(16526019)(1076003)(186003)(82310400005)(40460700003)(30864003)(6916009)(54906003)(4326008)(8676002)(7696005)(70586007)(70206006)(47076005)(336012)(6666004)(40480700001)(426003)(8936002)(36860700001)(316002)(356005)(26005)(83380400001)(41300700001)(36756003)(86362001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 15:47:52.3300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4301db1-ebea-4828-ab86-08dab2b272a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5379
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
Cc: stylon.wang@amd.com, Alan Liu <HaoPing.Liu@amd.com>, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, solomon.chiu@amd.com, Aurabindo.Pillai@amd.com,
 Wayne Lin <Wayne.Lin@amd.com>, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alan Liu <HaoPing.Liu@amd.com>

[Why]
Porting secure display feature from DCN10 to DCN21. Support single
display for now and will extend to multiple displays.

[How]
- use workqueue to offload works for dmub or dmcu firmware
- after receiving ROI update from userspace, set skip_frame_cnt to 1
- refactor amdgpu_dm_crtc_handle_crc_window_irq()
- disable PSR before activating secure_display on a crtc
- check if secure_display is activated before enabling psr
- only work for single display for now.

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   7 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c | 151 ++++++++----------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |  17 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   3 +
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  55 ++++---
 .../display/amdgpu_dm/amdgpu_dm_irq_params.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 115 +++++++------
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |   8 +-
 drivers/gpu/drm/amd/display/dc/dc_types.h     |  14 ++
 drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h  |  14 --
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h   |  26 +++
 11 files changed, 223 insertions(+), 189 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0b5e9fb0012d..1e67366b3536 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7861,6 +7861,9 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
 			 */
 			if (acrtc_state->stream->link->psr_settings.psr_version >= DC_PSR_VERSION_SU_1 &&
 			    acrtc_attach->dm_irq_params.allow_psr_entry &&
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+			    !amdgpu_dm_crc_window_is_activated(acrtc_state->base.crtc) &&
+#endif
 			    !acrtc_state->stream->link->psr_settings.psr_allow_active)
 				amdgpu_dm_psr_enable(acrtc_state->stream);
 		} else {
@@ -8317,8 +8320,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 				if (amdgpu_dm_crc_window_is_activated(crtc)) {
 					spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
-					acrtc->dm_irq_params.crc_window.update_win = true;
-					acrtc->dm_irq_params.crc_window.skip_frame_cnt = 2;
+					acrtc->dm_irq_params.window_param.update_win = true;
+					acrtc->dm_irq_params.window_param.skip_frame_cnt = 2;
 					spin_lock_irq(&crc_rd_wrk->crc_rd_work_lock);
 					crc_rd_wrk->crtc = crtc;
 					spin_unlock_irq(&crc_rd_wrk->crc_rd_work_lock);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 8a441a22c46e..a857f6454753 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -89,13 +89,13 @@ static void amdgpu_dm_set_crc_window_default(struct drm_crtc *crtc)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	acrtc->dm_irq_params.crc_window.x_start = 0;
-	acrtc->dm_irq_params.crc_window.y_start = 0;
-	acrtc->dm_irq_params.crc_window.x_end = 0;
-	acrtc->dm_irq_params.crc_window.y_end = 0;
-	acrtc->dm_irq_params.crc_window.activated = false;
-	acrtc->dm_irq_params.crc_window.update_win = false;
-	acrtc->dm_irq_params.crc_window.skip_frame_cnt = 0;
+	acrtc->dm_irq_params.window_param.roi.x_start = 0;
+	acrtc->dm_irq_params.window_param.roi.y_start = 0;
+	acrtc->dm_irq_params.window_param.roi.x_end = 0;
+	acrtc->dm_irq_params.window_param.roi.y_end = 0;
+	acrtc->dm_irq_params.window_param.activated = false;
+	acrtc->dm_irq_params.window_param.update_win = false;
+	acrtc->dm_irq_params.window_param.skip_frame_cnt = 0;
 	spin_unlock_irq(&drm_dev->event_lock);
 }
 
@@ -135,6 +135,22 @@ static void amdgpu_dm_crtc_notify_ta_to_read(struct work_struct *work)
 	}
 }
 
+static void
+amdgpu_dm_forward_crc_window(struct work_struct *work)
+{
+	struct crc_fw_work *crc_fw_wrk;
+	struct amdgpu_display_manager *dm;
+
+	crc_fw_wrk = container_of(work, struct crc_fw_work, forward_roi_work);
+	dm = crc_fw_wrk->dm;
+
+	mutex_lock(&dm->dc_lock);
+	dc_stream_forward_crc_window(dm->dc, &crc_fw_wrk->roi, crc_fw_wrk->stream, crc_fw_wrk->is_stop_cmd);
+	mutex_unlock(&dm->dc_lock);
+
+	kfree(crc_fw_wrk);
+}
+
 bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc)
 {
 	struct drm_device *drm_dev = crtc->dev;
@@ -142,7 +158,7 @@ bool amdgpu_dm_crc_window_is_activated(struct drm_crtc *crtc)
 	bool ret = false;
 
 	spin_lock_irq(&drm_dev->event_lock);
-	ret = acrtc->dm_irq_params.crc_window.activated;
+	ret = acrtc->dm_irq_params.window_param.activated;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return ret;
@@ -187,9 +203,11 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 			if (adev->dm.crc_rd_wrk) {
 				flush_work(&adev->dm.crc_rd_wrk->notify_ta_work);
 				spin_lock_irq(&adev->dm.crc_rd_wrk->crc_rd_work_lock);
+
 				if (adev->dm.crc_rd_wrk->crtc == crtc) {
-					dc_stream_stop_dmcu_crc_win_update(stream_state->ctx->dc,
-									dm_crtc_state->stream);
+					/* stop ROI update on this crtc */
+					dc_stream_forward_crc_window(stream_state->ctx->dc,
+							NULL, stream_state, true);
 					adev->dm.crc_rd_wrk->crtc = NULL;
 				}
 				spin_unlock_irq(&adev->dm.crc_rd_wrk->crc_rd_work_lock);
@@ -439,14 +457,9 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 	enum amdgpu_dm_pipe_crc_source cur_crc_src;
 	struct amdgpu_crtc *acrtc = NULL;
 	struct amdgpu_device *adev = NULL;
-	struct crc_rd_work *crc_rd_wrk = NULL;
-	struct crc_params *crc_window = NULL, tmp_window;
+	struct crc_rd_work *crc_rd_wrk;
+	struct crc_fw_work *crc_fw_wrk;
 	unsigned long flags1, flags2;
-	struct crtc_position position;
-	uint32_t v_blank;
-	uint32_t v_back_porch;
-	uint32_t crc_window_latch_up_line;
-	struct dc_crtc_timing *timing_out;
 
 	if (crtc == NULL)
 		return;
@@ -458,74 +471,52 @@ void amdgpu_dm_crtc_handle_crc_window_irq(struct drm_crtc *crtc)
 	spin_lock_irqsave(&drm_dev->event_lock, flags1);
 	stream_state = acrtc->dm_irq_params.stream;
 	cur_crc_src = acrtc->dm_irq_params.crc_src;
-	timing_out = &stream_state->timing;
 
 	/* Early return if CRC capture is not enabled. */
 	if (!amdgpu_dm_is_valid_crc_source(cur_crc_src))
 		goto cleanup;
 
-	if (dm_is_crc_source_crtc(cur_crc_src)) {
-		if (acrtc->dm_irq_params.crc_window.activated) {
-			if (acrtc->dm_irq_params.crc_window.update_win) {
-				if (acrtc->dm_irq_params.crc_window.skip_frame_cnt) {
-					acrtc->dm_irq_params.crc_window.skip_frame_cnt -= 1;
-					goto cleanup;
-				}
-				crc_window = &tmp_window;
-
-				tmp_window.windowa_x_start =
-							acrtc->dm_irq_params.crc_window.x_start;
-				tmp_window.windowa_y_start =
-							acrtc->dm_irq_params.crc_window.y_start;
-				tmp_window.windowa_x_end =
-							acrtc->dm_irq_params.crc_window.x_end;
-				tmp_window.windowa_y_end =
-							acrtc->dm_irq_params.crc_window.y_end;
-				tmp_window.windowb_x_start =
-							acrtc->dm_irq_params.crc_window.x_start;
-				tmp_window.windowb_y_start =
-							acrtc->dm_irq_params.crc_window.y_start;
-				tmp_window.windowb_x_end =
-							acrtc->dm_irq_params.crc_window.x_end;
-				tmp_window.windowb_y_end =
-							acrtc->dm_irq_params.crc_window.y_end;
-
-				dc_stream_forward_dmcu_crc_window(stream_state->ctx->dc,
-									stream_state, crc_window);
-
-				acrtc->dm_irq_params.crc_window.update_win = false;
-
-				dc_stream_get_crtc_position(stream_state->ctx->dc, &stream_state, 1,
-					&position.vertical_count,
-					&position.nominal_vcount);
-
-				v_blank = timing_out->v_total - timing_out->v_border_top -
-					timing_out->v_addressable - timing_out->v_border_bottom;
-
-				v_back_porch = v_blank - timing_out->v_front_porch -
-					timing_out->v_sync_width;
-
-				crc_window_latch_up_line = v_back_porch + timing_out->v_sync_width;
-
-				/* take 3 lines margin*/
-				if ((position.vertical_count + 3) >= crc_window_latch_up_line)
-					acrtc->dm_irq_params.crc_window.skip_frame_cnt = 1;
-				else
-					acrtc->dm_irq_params.crc_window.skip_frame_cnt = 0;
-			} else {
-				if (acrtc->dm_irq_params.crc_window.skip_frame_cnt == 0) {
-					if (adev->dm.crc_rd_wrk) {
-						crc_rd_wrk = adev->dm.crc_rd_wrk;
-						spin_lock_irqsave(&crc_rd_wrk->crc_rd_work_lock, flags2);
-						crc_rd_wrk->phy_inst =
-							stream_state->link->link_enc_hw_inst;
-						spin_unlock_irqrestore(&crc_rd_wrk->crc_rd_work_lock, flags2);
-						schedule_work(&crc_rd_wrk->notify_ta_work);
-					}
-				} else {
-					acrtc->dm_irq_params.crc_window.skip_frame_cnt -= 1;
-				}
-			}
+	if (!dm_is_crc_source_crtc(cur_crc_src))
+		goto cleanup;
+
+	if (!acrtc->dm_irq_params.window_param.activated)
+		goto cleanup;
+
+	if (acrtc->dm_irq_params.window_param.update_win) {
+		if (acrtc->dm_irq_params.window_param.skip_frame_cnt) {
+			acrtc->dm_irq_params.window_param.skip_frame_cnt -= 1;
+			goto cleanup;
+		}
+
+		/* prepare work for dmub to update ROI */
+		crc_fw_wrk = kzalloc(sizeof(*crc_fw_wrk), GFP_ATOMIC);
+		if (!crc_fw_wrk)
+			goto cleanup;
+
+		INIT_WORK(&crc_fw_wrk->forward_roi_work, amdgpu_dm_forward_crc_window);
+		crc_fw_wrk->dm = &adev->dm;
+		crc_fw_wrk->stream = stream_state;
+		crc_fw_wrk->roi.x_start = acrtc->dm_irq_params.window_param.roi.x_start;
+		crc_fw_wrk->roi.y_start = acrtc->dm_irq_params.window_param.roi.y_start;
+		crc_fw_wrk->roi.x_end = acrtc->dm_irq_params.window_param.roi.x_end;
+		crc_fw_wrk->roi.y_end = acrtc->dm_irq_params.window_param.roi.y_end;
+		schedule_work(&crc_fw_wrk->forward_roi_work);
+
+		acrtc->dm_irq_params.window_param.update_win = false;
+		acrtc->dm_irq_params.window_param.skip_frame_cnt = 1;
+
+	} else {
+		if (acrtc->dm_irq_params.window_param.skip_frame_cnt) {
+			acrtc->dm_irq_params.window_param.skip_frame_cnt -= 1;
+			goto cleanup;
+		}
+
+		if (adev->dm.crc_rd_wrk) {
+			crc_rd_wrk = adev->dm.crc_rd_wrk;
+			spin_lock_irqsave(&crc_rd_wrk->crc_rd_work_lock, flags2);
+			crc_rd_wrk->phy_inst = stream_state->link->link_enc_hw_inst;
+			spin_unlock_irqrestore(&crc_rd_wrk->crc_rd_work_lock, flags2);
+			schedule_work(&crc_rd_wrk->notify_ta_work);
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index f07850db60a6..16bfc2dc35ab 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -40,11 +40,8 @@ enum amdgpu_dm_pipe_crc_source {
 };
 
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
-struct crc_window_parm {
-	uint16_t x_start;
-	uint16_t y_start;
-	uint16_t x_end;
-	uint16_t y_end;
+struct crc_window_param {
+	struct crc_region roi;
 	/* CRC windwo is activated or not*/
 	bool activated;
 	/* Update crc window during vertical blank or not */
@@ -53,6 +50,7 @@ struct crc_window_parm {
 	int skip_frame_cnt;
 };
 
+/* read_work for driver to call PSP to read */
 struct crc_rd_work {
 	struct work_struct notify_ta_work;
 	/* To protect crc_rd_work carried fields*/
@@ -60,6 +58,15 @@ struct crc_rd_work {
 	struct drm_crtc *crtc;
 	uint8_t phy_inst;
 };
+
+/* forward_work for driver to forward ROI to dmu */
+struct crc_fw_work {
+	struct work_struct forward_roi_work;
+	struct amdgpu_display_manager *dm;
+	struct dc_stream_state *stream;
+	struct crc_region roi;
+	bool is_stop_cmd;
+};
 #endif
 
 static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source source)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index c89594f3a5cb..9ac2805c5d63 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -127,6 +127,9 @@ static void vblank_control_worker(struct work_struct *work)
 				amdgpu_dm_psr_disable(vblank_work->stream);
 		} else if (vblank_work->stream->link->psr_settings.psr_feature_enabled &&
 			   !vblank_work->stream->link->psr_settings.psr_allow_active &&
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+			   !amdgpu_dm_crc_window_is_activated(&vblank_work->acrtc->base) &&
+#endif
 			   vblank_work->acrtc->dm_irq_params.allow_psr_entry) {
 			amdgpu_dm_psr_enable(vblank_work->stream);
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 007d283fef46..dcd47dd86303 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -38,6 +38,10 @@
 #include "link_hwss.h"
 #include "dc/dc_dmub_srv.h"
 
+#ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
+#include "amdgpu_dm_psr.h"
+#endif
+
 struct dmub_debugfs_trace_header {
 	uint32_t entry_count;
 	uint32_t reserved[3];
@@ -3096,8 +3100,8 @@ static int crc_win_x_start_set(void *data, u64 val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	acrtc->dm_irq_params.crc_window.x_start = (uint16_t) val;
-	acrtc->dm_irq_params.crc_window.update_win = false;
+	acrtc->dm_irq_params.window_param.roi.x_start = (uint16_t) val;
+	acrtc->dm_irq_params.window_param.update_win = false;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3113,7 +3117,7 @@ static int crc_win_x_start_get(void *data, u64 *val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	*val = acrtc->dm_irq_params.crc_window.x_start;
+	*val = acrtc->dm_irq_params.window_param.roi.x_start;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3133,8 +3137,8 @@ static int crc_win_y_start_set(void *data, u64 val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	acrtc->dm_irq_params.crc_window.y_start = (uint16_t) val;
-	acrtc->dm_irq_params.crc_window.update_win = false;
+	acrtc->dm_irq_params.window_param.roi.y_start = (uint16_t) val;
+	acrtc->dm_irq_params.window_param.update_win = false;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3150,7 +3154,7 @@ static int crc_win_y_start_get(void *data, u64 *val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	*val = acrtc->dm_irq_params.crc_window.y_start;
+	*val = acrtc->dm_irq_params.window_param.roi.y_start;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3169,8 +3173,8 @@ static int crc_win_x_end_set(void *data, u64 val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	acrtc->dm_irq_params.crc_window.x_end = (uint16_t) val;
-	acrtc->dm_irq_params.crc_window.update_win = false;
+	acrtc->dm_irq_params.window_param.roi.x_end = (uint16_t) val;
+	acrtc->dm_irq_params.window_param.update_win = false;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3186,7 +3190,7 @@ static int crc_win_x_end_get(void *data, u64 *val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	*val = acrtc->dm_irq_params.crc_window.x_end;
+	*val = acrtc->dm_irq_params.window_param.roi.x_end;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3205,8 +3209,8 @@ static int crc_win_y_end_set(void *data, u64 val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	acrtc->dm_irq_params.crc_window.y_end = (uint16_t) val;
-	acrtc->dm_irq_params.crc_window.update_win = false;
+	acrtc->dm_irq_params.window_param.roi.y_end = (uint16_t) val;
+	acrtc->dm_irq_params.window_param.update_win = false;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3222,7 +3226,7 @@ static int crc_win_y_end_get(void *data, u64 *val)
 	struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
 
 	spin_lock_irq(&drm_dev->event_lock);
-	*val = acrtc->dm_irq_params.crc_window.y_end;
+	*val = acrtc->dm_irq_params.window_param.roi.y_end;
 	spin_unlock_irq(&drm_dev->event_lock);
 
 	return 0;
@@ -3245,31 +3249,38 @@ static int crc_win_update_set(void *data, u64 val)
 		return 0;
 
 	if (val) {
+		new_acrtc = to_amdgpu_crtc(new_crtc);
+		mutex_lock(&adev->dm.dc_lock);
+		/* PSR may write to OTG CRC window control register,
+		 * so close it before starting secure_display.
+		 */
+		amdgpu_dm_psr_disable(new_acrtc->dm_irq_params.stream);
+
 		spin_lock_irq(&adev_to_drm(adev)->event_lock);
 		spin_lock_irq(&crc_rd_wrk->crc_rd_work_lock);
 		if (crc_rd_wrk->crtc) {
 			old_crtc = crc_rd_wrk->crtc;
 			old_acrtc = to_amdgpu_crtc(old_crtc);
 		}
-		new_acrtc = to_amdgpu_crtc(new_crtc);
 
 		if (old_crtc && old_crtc != new_crtc) {
-			old_acrtc->dm_irq_params.crc_window.activated = false;
-			old_acrtc->dm_irq_params.crc_window.update_win = false;
-			old_acrtc->dm_irq_params.crc_window.skip_frame_cnt = 0;
+			old_acrtc->dm_irq_params.window_param.activated = false;
+			old_acrtc->dm_irq_params.window_param.update_win = false;
+			old_acrtc->dm_irq_params.window_param.skip_frame_cnt = 0;
 
-			new_acrtc->dm_irq_params.crc_window.activated = true;
-			new_acrtc->dm_irq_params.crc_window.update_win = true;
-			new_acrtc->dm_irq_params.crc_window.skip_frame_cnt = 0;
+			new_acrtc->dm_irq_params.window_param.activated = true;
+			new_acrtc->dm_irq_params.window_param.update_win = true;
+			new_acrtc->dm_irq_params.window_param.skip_frame_cnt = 0;
 			crc_rd_wrk->crtc = new_crtc;
 		} else {
-			new_acrtc->dm_irq_params.crc_window.activated = true;
-			new_acrtc->dm_irq_params.crc_window.update_win = true;
-			new_acrtc->dm_irq_params.crc_window.skip_frame_cnt = 0;
+			new_acrtc->dm_irq_params.window_param.activated = true;
+			new_acrtc->dm_irq_params.window_param.update_win = true;
+			new_acrtc->dm_irq_params.window_param.skip_frame_cnt = 0;
 			crc_rd_wrk->crtc = new_crtc;
 		}
 		spin_unlock_irq(&crc_rd_wrk->crc_rd_work_lock);
 		spin_unlock_irq(&adev_to_drm(adev)->event_lock);
+		mutex_unlock(&adev->dm.dc_lock);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
index 79b5f9999fec..5c9303241aeb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq_params.h
@@ -39,7 +39,7 @@ struct dm_irq_params {
 #ifdef CONFIG_DEBUG_FS
 	enum amdgpu_dm_pipe_crc_source crc_src;
 #ifdef CONFIG_DRM_AMD_SECURE_DISPLAY
-	struct crc_window_parm crc_window;
+	struct crc_window_param window_param;
 #endif
 #endif
 };
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56629197a6a1..58352de24061 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -491,86 +491,79 @@ bool dc_stream_get_crtc_position(struct dc *dc,
 }
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
-bool dc_stream_forward_dmcu_crc_window(struct dc *dc, struct dc_stream_state *stream,
-			     struct crc_params *crc_window)
+static inline void
+dc_stream_forward_dmub_crc_window(struct dc_dmub_srv *dmub_srv,
+		struct crc_region *roi, struct otg_phy_mux *mux_mapping, bool is_stop)
 {
-	int i;
-	struct dmcu *dmcu = dc->res_pool->dmcu;
-	struct pipe_ctx *pipe;
-	struct crc_region tmp_win, *crc_win;
-	struct otg_phy_mux mapping_tmp, *mux_mapping;
-
-	/*crc window can't be null*/
-	if (!crc_window)
-		return false;
-
-	if ((dmcu != NULL && dmcu->funcs->is_dmcu_initialized(dmcu))) {
-		crc_win = &tmp_win;
-		mux_mapping = &mapping_tmp;
-		/*set crc window*/
-		tmp_win.x_start = crc_window->windowa_x_start;
-		tmp_win.y_start = crc_window->windowa_y_start;
-		tmp_win.x_end = crc_window->windowa_x_end;
-		tmp_win.y_end = crc_window->windowa_y_end;
-
-		for (i = 0; i < MAX_PIPES; i++) {
-			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe->stream == stream && !pipe->top_pipe && !pipe->prev_odm_pipe)
-				break;
-		}
-
-		/* Stream not found */
-		if (i == MAX_PIPES)
-			return false;
-
+	union dmub_rb_cmd cmd = {0};
 
-		/*set mux routing info*/
-		mapping_tmp.phy_output_num = stream->link->link_enc_hw_inst;
-		mapping_tmp.otg_output_num = pipe->stream_res.tg->inst;
+	cmd.secure_display.roi_info.phy_id = mux_mapping->phy_output_num;
+	cmd.secure_display.roi_info.otg_id = mux_mapping->otg_output_num;
 
-		dmcu->funcs->forward_crc_window(dmcu, crc_win, mux_mapping);
+	if (is_stop) {
+		cmd.secure_display.header.type = DMUB_CMD__SECURE_DISPLAY;
+		cmd.secure_display.header.sub_type = DMUB_CMD__SECURE_DISPLAY_CRC_STOP_UPDATE;
 	} else {
-		DC_LOG_DC("dmcu is not initialized");
-		return false;
+		cmd.secure_display.header.type = DMUB_CMD__SECURE_DISPLAY;
+		cmd.secure_display.header.sub_type = DMUB_CMD__SECURE_DISPLAY_CRC_WIN_NOTIFY;
+		cmd.secure_display.roi_info.x_start = roi->x_start;
+		cmd.secure_display.roi_info.y_start = roi->y_start;
+		cmd.secure_display.roi_info.x_end = roi->x_end;
+		cmd.secure_display.roi_info.y_end = roi->y_end;
 	}
 
-	return true;
+	dc_dmub_srv_cmd_queue(dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dmub_srv);
 }
 
-bool dc_stream_stop_dmcu_crc_win_update(struct dc *dc, struct dc_stream_state *stream)
+static inline void
+dc_stream_forward_dmcu_crc_window(struct dmcu *dmcu,
+		struct crc_region *roi, struct otg_phy_mux *mux_mapping, bool is_stop)
 {
-	int i;
-	struct dmcu *dmcu = dc->res_pool->dmcu;
-	struct pipe_ctx *pipe;
-	struct otg_phy_mux mapping_tmp, *mux_mapping;
+	if (is_stop)
+		dmcu->funcs->stop_crc_win_update(dmcu, mux_mapping);
+	else
+		dmcu->funcs->forward_crc_window(dmcu, roi, mux_mapping);
+}
 
-	if ((dmcu != NULL && dmcu->funcs->is_dmcu_initialized(dmcu))) {
-		mux_mapping = &mapping_tmp;
+bool
+dc_stream_forward_crc_window(struct dc *dc,
+		struct crc_region *roi, struct dc_stream_state *stream, bool is_stop)
+{
+	struct dmcu *dmcu;
+	struct dc_dmub_srv *dmub_srv;
+	struct otg_phy_mux mux_mapping;
+	struct pipe_ctx *pipe;
+	int i;
 
-		for (i = 0; i < MAX_PIPES; i++) {
-			pipe = &dc->current_state->res_ctx.pipe_ctx[i];
-			if (pipe->stream == stream && !pipe->top_pipe && !pipe->prev_odm_pipe)
-				break;
-		}
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe->stream == stream && !pipe->top_pipe && !pipe->prev_odm_pipe)
+			break;
+	}
 
-		/* Stream not found */
-		if (i == MAX_PIPES)
-			return false;
+	/* Stream not found */
+	if (i == MAX_PIPES)
+		return false;
 
+	mux_mapping.phy_output_num = stream->link->link_enc_hw_inst;
+	mux_mapping.otg_output_num = pipe->stream_res.tg->inst;
 
-		/*set mux routing info*/
-		mapping_tmp.phy_output_num = stream->link->link_enc_hw_inst;
-		mapping_tmp.otg_output_num = pipe->stream_res.tg->inst;
+	dmcu = dc->res_pool->dmcu;
+	dmub_srv = dc->ctx->dmub_srv;
 
-		dmcu->funcs->stop_crc_win_update(dmcu, mux_mapping);
-	} else {
-		DC_LOG_DC("dmcu is not initialized");
+	/* forward to dmub */
+	if (dmub_srv)
+		dc_stream_forward_dmub_crc_window(dmub_srv, roi, &mux_mapping, is_stop);
+	/* forward to dmcu */
+	else if (dmcu && dmcu->funcs->is_dmcu_initialized(dmcu))
+		dc_stream_forward_dmcu_crc_window(dmcu, roi, &mux_mapping, is_stop);
+	else
 		return false;
-	}
 
 	return true;
 }
-#endif
+#endif /* CONFIG_DRM_AMD_SECURE_DISPLAY */
 
 /**
  * dc_stream_configure_crc() - Configure CRC capture for the given stream.
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 73dccd485895..26f8f18e675c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -521,10 +521,10 @@ bool dc_stream_get_crtc_position(struct dc *dc,
 				 unsigned int *nom_v_pos);
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
-bool dc_stream_forward_dmcu_crc_window(struct dc *dc, struct dc_stream_state *stream,
-			     struct crc_params *crc_window);
-bool dc_stream_stop_dmcu_crc_win_update(struct dc *dc,
-				 struct dc_stream_state *stream);
+bool dc_stream_forward_crc_window(struct dc *dc,
+		struct crc_region *roi,
+		struct dc_stream_state *stream,
+		bool is_stop);
 #endif
 
 bool dc_stream_configure_crc(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index ad9041472cca..27dd4304ce69 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -993,4 +993,18 @@ struct display_endpoint_id {
 	enum display_endpoint_type ep_type;
 };
 
+#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
+struct crc_region {
+	uint16_t x_start;
+	uint16_t y_start;
+	uint16_t x_end;
+	uint16_t y_end;
+};
+
+struct otg_phy_mux {
+	uint8_t phy_output_num;
+	uint8_t otg_output_num;
+};
+#endif
+
 #endif /* DC_TYPES_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
index 8df2765cce78..9a2432608ddf 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dmcu.h
@@ -56,20 +56,6 @@ struct dmcu {
 	bool auto_load_dmcu;
 };
 
-#if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
-struct crc_region {
-	uint16_t x_start;
-	uint16_t y_start;
-	uint16_t x_end;
-	uint16_t y_end;
-};
-
-struct otg_phy_mux {
-	uint8_t phy_output_num;
-	uint8_t otg_output_num;
-};
-#endif
-
 struct dmcu_funcs {
 	bool (*dmcu_init)(struct dmcu *dmcu);
 	bool (*load_iram)(struct dmcu *dmcu,
diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 7a8f61517424..dc7c4d74cb5d 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -729,6 +729,10 @@ enum dmub_cmd_type {
 	/**
 	 * Command type used for all VBIOS interface commands.
 	 */
+	/**
+	 * Command type used for all SECURE_DISPLAY commands.
+	 */
+	DMUB_CMD__SECURE_DISPLAY = 85,
 
 	/**
 	 * Command type used to set DPIA HPD interrupt state
@@ -3143,6 +3147,24 @@ struct dmub_rb_cmd_get_usbc_cable_id {
 	} data;
 };
 
+enum dmub_cmd_secure_display_type {
+	DMUB_CMD__SECURE_DISPLAY_TEST_CMD = 0,
+	DMUB_CMD__SECURE_DISPLAY_CRC_STOP_UPDATE,
+	DMUB_CMD__SECURE_DISPLAY_CRC_WIN_NOTIFY
+};
+
+struct dmub_rb_cmd_secure_display {
+	struct dmub_cmd_header header;
+	struct dmub_cmd_roi_info {
+		uint16_t x_start;
+		uint16_t x_end;
+		uint16_t y_start;
+		uint16_t y_end;
+		uint8_t otg_id;
+		uint8_t phy_id;
+	} roi_info;
+};
+
 /**
  * union dmub_rb_cmd - DMUB inbox command.
  */
@@ -3347,6 +3369,10 @@ union dmub_rb_cmd {
 	 * Definition of a DMUB_CMD__QUERY_HPD_STATE command.
 	 */
 	struct dmub_rb_cmd_query_hpd_state query_hpd;
+	/**
+	 * Definition of a DMUB_CMD__SECURE_DISPLAY command.
+	 */
+	struct dmub_rb_cmd_secure_display secure_display;
 	/**
 	 * Definition of a DMUB_CMD__DPIA_HPD_INT_ENABLE command.
 	 */
-- 
2.35.1

