Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB1F689E2F
	for <lists+amd-gfx@lfdr.de>; Fri,  3 Feb 2023 16:25:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E0210E7E2;
	Fri,  3 Feb 2023 15:25:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1356210E7FC
 for <amd-gfx@lists.freedesktop.org>; Fri,  3 Feb 2023 15:25:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDIV9dDLRP9V6p4iKVJ5uUv4YkPF4H3zalB3v8Strn7zeo7a77y5tgyFQ3ix42bPtk++mdSt+04eRhRGG+JPsgwoh6BMT483h3kc201Sqo9xkvJK9CkhBgBnlz/d9M3ieJolyvPDfUEIImSDBjFRSH6vA+dGgsPek244B/jjXjVx2qDpJC77bfaOndTFwuBLhNiCOwi2cDP64cgDZ3In5ReP2+FZ1a9VtqLBzQqH+Wqhgw/VfE9RioVg42jLZSd3QS8pgDSH0tdRKEZZIS9red7T6D9v+pbk1+TnBfb3r2GrQTzQJMnRrx3sWiGWw4cTlzqPG/7arG1XWiHudG3RJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TnuQpbmm3lEIB87NDgFxZL09iFGrngFnj/JTarz4bM=;
 b=E4TyLzfea2bsZI3DjyHpo9VuJ+FP1HLE2HSeKqubCCbG8k3q8gO+DG4gchg2celUKm+7jMr2aQayYF4PqieNfZcARZajjZ4nG2V4uMAE8QMATzspdPIMGTGnOEZnoMrmNhbO/E+AyJijhNA1a0FnV8F5ZUDfFGInqQoPRbozBWfciNW1/m5Dma+ejVeDRUmbHVmfEpU8EEI92/yHyuhdAD8MChETqCOQoaUXnw+fJl5mKiEY+wsH9ykSTFSQia28Rv0d8Sn5qTZ3nK+j1owfJv4l+m1fQ0hOr+uL9gfsOsZRLp7obyyECSZvzrkZw+KKKiVM2N5nj7gcd1lrhUw5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/TnuQpbmm3lEIB87NDgFxZL09iFGrngFnj/JTarz4bM=;
 b=CHG6FDpFPWlxZQrLu14SQQWFdoIBbDG5yWyUx66wlXWHzJTv4S4BANaVx0iNFEKivRglUZjEexSdkChSRcM0fzH3w8QGIlXWvXNVMZG4/f3l2SHwof3VjpKlO+yOlzjOaHvTndRrL9NPbZQ2jbzVUSRaYiQALeaUFL1KFPT9Al8=
Received: from MN2PR03CA0021.namprd03.prod.outlook.com (2603:10b6:208:23a::26)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Fri, 3 Feb
 2023 15:25:35 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::f) by MN2PR03CA0021.outlook.office365.com
 (2603:10b6:208:23a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29 via Frontend
 Transport; Fri, 3 Feb 2023 15:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.17 via Frontend Transport; Fri, 3 Feb 2023 15:25:34 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Feb
 2023 09:25:29 -0600
From: Qingqing Zhuo <qingqing.zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 07/12] drm/amd/display: break down dc_link.c
Date: Fri, 3 Feb 2023 10:24:47 -0500
Message-ID: <20230203152452.1441747-8-qingqing.zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230203152452.1441747-1-qingqing.zhuo@amd.com>
References: <20230203152452.1441747-1-qingqing.zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: beb63d2d-a11a-4679-1375-08db05fae50e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQ2pKi727GHvlP29hTX8WQSua62RWJX7sYLuLlVq3sq53Qt1OelR089wKNW2Re3RT8tM02dwUbAZqJ4bS/roI+7qTR3kJh5ogtk7needozDN91KAP+wGlZa1sW6C/3Fu/ymOWMo0r3OtvQz/wuH0HAFOtwzLv6YrmyoBpMVsHRgZKVmcBK9dBB3OZkN1EBEU1sSvRR6O8037tbJRUJPq7Z6ZMsw6cnjbvwzbSpI6CQoCBopzIzbePGkVbjF31vMTVT2iBLTeunoqbI6F/ofku5TQjkc3lbVsrrKaDEN/U9DxdffdKebrDoL3D/PV4LpcMbcdmrGEqg+sBrfRZKgWyiicNa6BxxCvSrLGvdzLVFMTl1XM5Q9TSC0L4e3nSHcjvWkI48Gl1+U0Xd79Fy9OXSIbPvcWQRBRpltptTZPOO8DazGBZ4bFWu+EjXfSpX6GyFB1rL3z2SppoIwxzokfLGOkEMZvYMQgoKUdqWAf3ih0wC3KIGq34vIh2g0t4RrXuaHd69NwPaAcdXWfILKabZB1DUbSBhF2m0NZjfR/LUEvc2WsOayF1Zu4Weiuemuq2ZFTaYcHIXfwFxTvjixY1lWx94DDQIOOMpxZSk9hE4bfEC1GITAuLFi4fvmqildpc7oVdDUF0rvKGVvg95MnFMNLDlAW0ctJDJ1m7n8rfi25MzfcOeybxaJ4Uf3AU2YTwLYV2VDLT1TP/7zf4junvH1RqEt10VTNmTcaEC649Mc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199018)(40470700004)(46966006)(36840700001)(36860700001)(1076003)(30864003)(16526019)(44832011)(426003)(47076005)(8936002)(26005)(186003)(6666004)(86362001)(41300700001)(5660300002)(66899018)(81166007)(82740400003)(82310400005)(45080400002)(4326008)(6916009)(8676002)(2616005)(36756003)(19627235002)(336012)(2906002)(316002)(356005)(40460700003)(478600001)(70206006)(70586007)(83380400001)(54906003)(40480700001)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 15:25:34.4987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beb63d2d-a11a-4679-1375-08db05fae50e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323
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
Cc: stylon.wang@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, George Shen <George.Shen@amd.com>,
 Rodrigo.Siqueira@amd.com, roman.li@amd.com, Wenjing Liu <wenjing.liu@amd.com>,
 solomon.chiu@amd.com, Aurabindo.Pillai@amd.com, wayne.lin@amd.com,
 Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wenjing Liu <wenjing.liu@amd.com>

[why]
dc_link contains over 30k line of code, the decision is to break it
down to files residing in link folder based on functionality. This
change is the last break down change which will remove dc_link.c
file after everything is broken down.

[how]
Move remaining dc_link.c functions into link_detection, link_dpms,
link_validation, link_resource, and link_fpga and remove dc_link.

Reviewed-by: George Shen <George.Shen@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Wenjing Liu <wenjing.liu@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   12 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |    4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |    2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |    2 +-
 drivers/gpu/drm/amd/display/dc/Makefile       |    2 +-
 drivers/gpu/drm/amd/display/dc/core/dc.c      |   22 +-
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4890 +----------------
 .../gpu/drm/amd/display/dc/core/dc_resource.c |    2 +-
 drivers/gpu/drm/amd/display/dc/dc_link.h      |   69 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   |   12 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |    4 +-
 .../display/dc/dcn10/dcn10_stream_encoder.c   |    6 +-
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |    6 +-
 .../display/dc/dcn20/dcn20_stream_encoder.c   |    2 +-
 .../drm/amd/display/dc/dcn21/dcn21_hwseq.c    |    6 +-
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |    2 +-
 .../drm/amd/display/dc/dcn31/dcn31_hwseq.c    |    8 +-
 .../dc/dcn314/dcn314_dio_stream_encoder.c     |    2 +-
 .../dc/dcn32/dcn32_dio_stream_encoder.c       |    2 +-
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |    4 +-
 .../gpu/drm/amd/display/dc/inc/core_types.h   |   27 -
 drivers/gpu/drm/amd/display/dc/inc/link.h     |   32 +-
 drivers/gpu/drm/amd/display/dc/link/Makefile  |    9 +-
 .../display/dc/link/accessories/link_dp_cts.c |    4 +-
 .../dc/link/accessories/link_dp_trace.c       |    9 +-
 .../dc/link/accessories/link_dp_trace.h       |    1 +
 .../display/dc/link/accessories/link_fpga.c   |   95 +
 .../display/dc/link/accessories/link_fpga.h   |   30 +
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |   16 +-
 .../display/dc/link/hwss/link_hwss_hpo_dp.c   |    4 +-
 .../drm/amd/display/dc/link/link_detection.c  | 1356 +++++
 .../drm/amd/display/dc/link/link_detection.h  |   30 +
 .../gpu/drm/amd/display/dc/link/link_dpms.c   | 2395 ++++++++
 .../gpu/drm/amd/display/dc/link/link_dpms.h   |   35 +
 .../drm/amd/display/dc/link/link_factory.c    |  577 ++
 .../drm/amd/display/dc/link/link_factory.h    |   29 +
 .../drm/amd/display/dc/link/link_resource.c   |  149 +
 .../drm/amd/display/dc/link/link_resource.h   |   29 +
 .../drm/amd/display/dc/link/link_validation.c |  396 ++
 .../drm/amd/display/dc/link/link_validation.h |   28 +
 .../dc/link/protocols/link_dp_capability.c    |   68 +-
 .../display/dc/link/protocols/link_dp_dpia.c  |    1 +
 .../dc/link/protocols/link_dp_irq_handler.c   |   12 +-
 .../dc/link/protocols/link_dp_irq_handler.h   |    4 -
 .../display/dc/link/protocols/link_dp_phy.c   |   83 +-
 .../display/dc/link/protocols/link_dp_phy.h   |    4 +
 .../dc/link/protocols/link_dp_training.c      |    3 +-
 .../dc/link/protocols/link_dp_training_dpia.c |    3 +
 48 files changed, 5430 insertions(+), 5058 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_detection.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_dpms.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_factory.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/link/link_validation.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6b8be17608b6..143dfa899a39 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1269,7 +1269,7 @@ static void dm_handle_hpd_rx_offload_work(struct work_struct *work)
 	dc_link = aconnector->dc_link;
 
 	mutex_lock(&aconnector->hpd_lock);
-	if (!dc_link_detect_sink(dc_link, &new_connection_type))
+	if (!dc_link_detect_connection_type(dc_link, &new_connection_type))
 		DRM_ERROR("KMS: Failed to detect connector\n");
 	mutex_unlock(&aconnector->hpd_lock);
 
@@ -1320,7 +1320,7 @@ static void dm_handle_hpd_rx_offload_work(struct work_struct *work)
 		offload_work->offload_wq->is_handling_link_loss = false;
 		spin_unlock_irqrestore(&offload_work->offload_wq->offload_lock, flags);
 
-		if ((dp_read_hpd_rx_irq_data(dc_link, &irq_data) == DC_OK) &&
+		if ((dc_link_dp_read_hpd_rx_irq_data(dc_link, &irq_data) == DC_OK) &&
 			dc_link_check_link_loss_status(dc_link, &irq_data))
 			dc_link_dp_handle_link_loss(dc_link);
 	}
@@ -2765,7 +2765,7 @@ static int dm_resume(void *handle)
 			continue;
 
 		mutex_lock(&aconnector->hpd_lock);
-		if (!dc_link_detect_sink(aconnector->dc_link, &new_connection_type))
+		if (!dc_link_detect_connection_type(aconnector->dc_link, &new_connection_type))
 			DRM_ERROR("KMS: Failed to detect connector\n");
 
 		if (aconnector->base.force && new_connection_type == dc_connection_none) {
@@ -3107,7 +3107,7 @@ static void handle_hpd_irq_helper(struct amdgpu_dm_connector *aconnector)
 
 	aconnector->timing_changed = false;
 
-	if (!dc_link_detect_sink(aconnector->dc_link, &new_connection_type))
+	if (!dc_link_detect_connection_type(aconnector->dc_link, &new_connection_type))
 		DRM_ERROR("KMS: Failed to detect connector\n");
 
 	if (aconnector->base.force && new_connection_type == dc_connection_none) {
@@ -3310,7 +3310,7 @@ static void handle_hpd_rx_irq(void *param)
 out:
 	if (result && !is_mst_root_connector) {
 		/* Downstream Port status changed. */
-		if (!dc_link_detect_sink(dc_link, &new_connection_type))
+		if (!dc_link_detect_connection_type(dc_link, &new_connection_type))
 			DRM_ERROR("KMS: Failed to detect connector\n");
 
 		if (aconnector->base.force && new_connection_type == dc_connection_none) {
@@ -4361,7 +4361,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
 
 		link = dc_get_link_at_index(dm->dc, i);
 
-		if (!dc_link_detect_sink(link, &new_connection_type))
+		if (!dc_link_detect_connection_type(link, &new_connection_type))
 			DRM_ERROR("KMS: Failed to detect connector\n");
 
 		if (aconnector->base.force && new_connection_type == dc_connection_none) {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index e783082a4eef..882e5efcea1b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -1285,7 +1285,7 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
 	if (param[0] == 1) {
 
-		if (!dc_link_detect_sink(aconnector->dc_link, &new_connection_type) &&
+		if (!dc_link_detect_connection_type(aconnector->dc_link, &new_connection_type) &&
 			new_connection_type != dc_connection_none)
 			goto unlock;
 
@@ -1322,7 +1322,7 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
 
 		/* If the aconnector is the root node in mst topology */
 		if (aconnector->mst_mgr.mst_state == true)
-			reset_cur_dp_mst_topology(link);
+			dc_link_reset_cur_dp_mst_topology(link);
 
 		drm_modeset_lock_all(dev);
 		dm_restore_drm_connector_state(dev, connector);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index c6794196a11d..1e55a01f5f48 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -1104,7 +1104,7 @@ bool dm_helpers_dp_handle_test_pattern_request(
 		pipe_ctx->stream->timing.display_color_depth = requestColorDepth;
 		pipe_ctx->stream->timing.pixel_encoding = requestPixelEncoding;
 
-		dp_update_dsc_config(pipe_ctx);
+		dc_link_update_dsc_config(pipe_ctx);
 
 		aconnector->timing_changed = true;
 		/* store current timing */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 33f53cae939d..e25e1b2bf194 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -50,7 +50,7 @@
 #include "dc/dcn20/dcn20_resource.h"
 bool is_timing_changed(struct dc_stream_state *cur_stream,
 		       struct dc_stream_state *new_stream);
-
+#define PEAK_FACTOR_X1000 1006
 
 static ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 				  struct drm_dp_aux_msg *msg)
diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index fec32e20f854..29579e1baa93 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -64,7 +64,7 @@ AMD_DC = $(addsuffix /Makefile, $(addprefix $(FULL_AMD_DISPLAY_PATH)/dc/,$(DC_LI
 
 include $(AMD_DC)
 
-DISPLAY_CORE = dc.o dc_stat.o dc_link.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
+DISPLAY_CORE = dc.o dc_stat.o dc_resource.o dc_hw_sequencer.o dc_sink.o \
 dc_surface.o dc_debug.o dc_stream.o dc_link_enc_cfg.o
 
 DISPLAY_CORE += dc_vm_helper.o
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 35f674ac21dd..1c218c526650 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1199,7 +1199,7 @@ static void disable_vbios_mode_if_required(
 						pipe->stream_res.pix_clk_params.requested_pix_clk_100hz;
 
 					if (pix_clk_100hz != requested_pix_clk_100hz) {
-						core_link_disable_stream(pipe);
+						link_set_dpms_off(pipe);
 						pipe->stream->dpms_off = false;
 					}
 				}
@@ -1307,7 +1307,7 @@ static void detect_edp_presence(struct dc *dc)
 		if (dc->config.edp_not_connected) {
 			edp_link->edp_sink_present = false;
 		} else {
-			dc_link_detect_sink(edp_link, &type);
+			dc_link_detect_connection_type(edp_link, &type);
 			edp_link->edp_sink_present = (type != dc_connection_none);
 		}
 	}
@@ -3173,7 +3173,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				dc->hwss.update_info_frame(pipe_ctx);
 
 				if (dc_is_dp_signal(pipe_ctx->stream->signal))
-					dp_source_sequence_trace(pipe_ctx->stream->link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+					link_dp_source_sequence_trace(pipe_ctx->stream->link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
 			}
 
 			if (stream_update->hdr_static_metadata &&
@@ -3209,14 +3209,14 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				continue;
 
 			if (stream_update->dsc_config)
-				dp_update_dsc_config(pipe_ctx);
+				link_update_dsc_config(pipe_ctx);
 
 			if (stream_update->mst_bw_update) {
 				if (stream_update->mst_bw_update->is_increase)
-					dc_link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
-				else
-					dc_link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
-			}
+					link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+ 				else
+					link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
+ 			}
 
 			if (stream_update->pending_test_pattern) {
 				dc_link_dp_set_test_pattern(stream->link,
@@ -3229,7 +3229,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 
 			if (stream_update->dpms_off) {
 				if (*stream_update->dpms_off) {
-					core_link_disable_stream(pipe_ctx);
+					link_set_dpms_off(pipe_ctx);
 					/* for dpms, keep acquired resources*/
 					if (pipe_ctx->stream_res.audio && !dc->debug.az_endpoint_mute_only)
 						pipe_ctx->stream_res.audio->funcs->az_disable(pipe_ctx->stream_res.audio);
@@ -3239,7 +3239,7 @@ static void commit_planes_do_stream_update(struct dc *dc,
 				} else {
 					if (get_seamless_boot_stream_count(context) == 0)
 						dc->hwss.prepare_bandwidth(dc, dc->current_state);
-					core_link_enable_stream(dc->current_state, pipe_ctx);
+					link_set_dpms_on(dc->current_state, pipe_ctx);
 				}
 			}
 
@@ -4305,7 +4305,7 @@ void dc_resume(struct dc *dc)
 	uint32_t i;
 
 	for (i = 0; i < dc->link_count; i++)
-		core_link_resume(dc->links[i]);
+		link_resume(dc->links[i]);
 }
 
 bool dc_is_dmcu_initialized(struct dc *dc)
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index ce1b6cbb1817..0552dc75a7c8 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -22,4891 +22,5 @@
  * Authors: AMD
  *
  */
-
-#include <linux/slab.h>
-
-#include "dm_services.h"
-#include "atomfirmware.h"
-#include "dm_helpers.h"
-#include "dc.h"
-#include "grph_object_id.h"
-#include "gpio_service_interface.h"
-#include "core_status.h"
-#include "link/protocols/link_dp_dpia.h"
-#include "link/protocols/link_ddc.h"
-#include "link_hwss.h"
-#include "link.h"
-#include "opp.h"
-
-#include "link_encoder.h"
-#include "hw_sequencer.h"
-#include "resource.h"
-#include "abm.h"
-#include "fixed31_32.h"
-#include "dpcd_defs.h"
-#include "dmcu.h"
-#include "dsc.h"
-#include "opp.h"
-#include "hw/clk_mgr.h"
-#include "dce/dmub_psr.h"
-#include "dmub/dmub_srv.h"
-#include "inc/hw/panel_cntl.h"
-#include "inc/link_enc_cfg.h"
-#include "link/protocols/link_dpcd.h"
-#include "link/accessories/link_dp_trace.h"
-#include "link/protocols/link_hpd.h"
-#include "link/protocols/link_dp_training.h"
-#include "link/protocols/link_dp_phy.h"
-#include "link/protocols/link_dp_capability.h"
-#include "link/protocols/link_edp_panel_control.h"
-
-#include "dc/dcn30/dcn30_vpg.h"
-
-#define DC_LOGGER_INIT(logger)
-
-#define LINK_INFO(...) \
-	DC_LOG_HW_HOTPLUG(  \
-		__VA_ARGS__)
-
-#define RETIMER_REDRIVER_INFO(...) \
-	DC_LOG_RETIMER_REDRIVER(  \
-		__VA_ARGS__)
-
-/*******************************************************************************
- * Private functions
- ******************************************************************************/
-static void dc_link_destruct(struct dc_link *link)
-{
-	int i;
-
-	if (link->hpd_gpio) {
-		dal_gpio_destroy_irq(&link->hpd_gpio);
-		link->hpd_gpio = NULL;
-	}
-
-	if (link->ddc)
-		link_destroy_ddc_service(&link->ddc);
-
-	if (link->panel_cntl)
-		link->panel_cntl->funcs->destroy(&link->panel_cntl);
-
-	if (link->link_enc) {
-		/* Update link encoder resource tracking variables. These are used for
-		 * the dynamic assignment of link encoders to streams. Virtual links
-		 * are not assigned encoder resources on creation.
-		 */
-		if (link->link_id.id != CONNECTOR_ID_VIRTUAL) {
-			link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = NULL;
-			link->dc->res_pool->dig_link_enc_count--;
-		}
-		link->link_enc->funcs->destroy(&link->link_enc);
-	}
-
-	if (link->local_sink)
-		dc_sink_release(link->local_sink);
-
-	for (i = 0; i < link->sink_count; ++i)
-		dc_sink_release(link->remote_sinks[i]);
-}
-
-/**
- * dc_link_detect_sink() - Determine if there is a sink connected
- *
- * @link: pointer to the dc link
- * @type: Returned connection type
- * Does not detect downstream devices, such as MST sinks
- * or display connected through active dongles
- */
-bool dc_link_detect_sink(struct dc_link *link, enum dc_connection_type *type)
-{
-	uint32_t is_hpd_high = 0;
-
-	if (link->connector_signal == SIGNAL_TYPE_LVDS) {
-		*type = dc_connection_single;
-		return true;
-	}
-
-	if (link->connector_signal == SIGNAL_TYPE_EDP) {
-		/*in case it is not on*/
-		if (!link->dc->config.edp_no_power_sequencing)
-			link->dc->hwss.edp_power_control(link, true);
-		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
-	}
-
-	/* Link may not have physical HPD pin. */
-	if (link->ep_type != DISPLAY_ENDPOINT_PHY) {
-		if (link->is_hpd_pending || !dc_link_dpia_query_hpd_status(link))
-			*type = dc_connection_none;
-		else
-			*type = dc_connection_single;
-
-		return true;
-	}
-
-	if (!query_hpd_status(link, &is_hpd_high))
-		goto hpd_gpio_failure;
-
-	if (is_hpd_high) {
-		*type = dc_connection_single;
-		/* TODO: need to do the actual detection */
-	} else {
-		*type = dc_connection_none;
-	}
-
-	return true;
-
-hpd_gpio_failure:
-	return false;
-}
-
-static enum ddc_transaction_type get_ddc_transaction_type(enum signal_type sink_signal)
-{
-	enum ddc_transaction_type transaction_type = DDC_TRANSACTION_TYPE_NONE;
-
-	switch (sink_signal) {
-	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-	case SIGNAL_TYPE_DVI_DUAL_LINK:
-	case SIGNAL_TYPE_HDMI_TYPE_A:
-	case SIGNAL_TYPE_LVDS:
-	case SIGNAL_TYPE_RGB:
-		transaction_type = DDC_TRANSACTION_TYPE_I2C;
-		break;
-
-	case SIGNAL_TYPE_DISPLAY_PORT:
-	case SIGNAL_TYPE_EDP:
-		transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
-		break;
-
-	case SIGNAL_TYPE_DISPLAY_PORT_MST:
-		/* MST does not use I2COverAux, but there is the
-		 * SPECIAL use case for "immediate dwnstrm device
-		 * access" (EPR#370830).
-		 */
-		transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
-		break;
-
-	default:
-		break;
-	}
-
-	return transaction_type;
-}
-
-static enum signal_type get_basic_signal_type(struct graphics_object_id encoder,
-					      struct graphics_object_id downstream)
-{
-	if (downstream.type == OBJECT_TYPE_CONNECTOR) {
-		switch (downstream.id) {
-		case CONNECTOR_ID_SINGLE_LINK_DVII:
-			switch (encoder.id) {
-			case ENCODER_ID_INTERNAL_DAC1:
-			case ENCODER_ID_INTERNAL_KLDSCP_DAC1:
-			case ENCODER_ID_INTERNAL_DAC2:
-			case ENCODER_ID_INTERNAL_KLDSCP_DAC2:
-				return SIGNAL_TYPE_RGB;
-			default:
-				return SIGNAL_TYPE_DVI_SINGLE_LINK;
-			}
-		break;
-		case CONNECTOR_ID_DUAL_LINK_DVII:
-		{
-			switch (encoder.id) {
-			case ENCODER_ID_INTERNAL_DAC1:
-			case ENCODER_ID_INTERNAL_KLDSCP_DAC1:
-			case ENCODER_ID_INTERNAL_DAC2:
-			case ENCODER_ID_INTERNAL_KLDSCP_DAC2:
-				return SIGNAL_TYPE_RGB;
-			default:
-				return SIGNAL_TYPE_DVI_DUAL_LINK;
-			}
-		}
-		break;
-		case CONNECTOR_ID_SINGLE_LINK_DVID:
-			return SIGNAL_TYPE_DVI_SINGLE_LINK;
-		case CONNECTOR_ID_DUAL_LINK_DVID:
-			return SIGNAL_TYPE_DVI_DUAL_LINK;
-		case CONNECTOR_ID_VGA:
-			return SIGNAL_TYPE_RGB;
-		case CONNECTOR_ID_HDMI_TYPE_A:
-			return SIGNAL_TYPE_HDMI_TYPE_A;
-		case CONNECTOR_ID_LVDS:
-			return SIGNAL_TYPE_LVDS;
-		case CONNECTOR_ID_DISPLAY_PORT:
-		case CONNECTOR_ID_USBC:
-			return SIGNAL_TYPE_DISPLAY_PORT;
-		case CONNECTOR_ID_EDP:
-			return SIGNAL_TYPE_EDP;
-		default:
-			return SIGNAL_TYPE_NONE;
-		}
-	} else if (downstream.type == OBJECT_TYPE_ENCODER) {
-		switch (downstream.id) {
-		case ENCODER_ID_EXTERNAL_NUTMEG:
-		case ENCODER_ID_EXTERNAL_TRAVIS:
-			return SIGNAL_TYPE_DISPLAY_PORT;
-		default:
-			return SIGNAL_TYPE_NONE;
-		}
-	}
-
-	return SIGNAL_TYPE_NONE;
-}
-
-/*
- * dc_link_is_dp_sink_present() - Check if there is a native DP
- * or passive DP-HDMI dongle connected
- */
-bool dc_link_is_dp_sink_present(struct dc_link *link)
-{
-	enum gpio_result gpio_result;
-	uint32_t clock_pin = 0;
-	uint8_t retry = 0;
-	struct ddc *ddc;
-
-	enum connector_id connector_id =
-		dal_graphics_object_id_get_connector_id(link->link_id);
-
-	bool present =
-		((connector_id == CONNECTOR_ID_DISPLAY_PORT) ||
-		(connector_id == CONNECTOR_ID_EDP) ||
-		(connector_id == CONNECTOR_ID_USBC));
-
-	ddc = get_ddc_pin(link->ddc);
-
-	if (!ddc) {
-		BREAK_TO_DEBUGGER();
-		return present;
-	}
-
-	/* Open GPIO and set it to I2C mode */
-	/* Note: this GpioMode_Input will be converted
-	 * to GpioConfigType_I2cAuxDualMode in GPIO component,
-	 * which indicates we need additional delay
-	 */
-
-	if (dal_ddc_open(ddc, GPIO_MODE_INPUT,
-			 GPIO_DDC_CONFIG_TYPE_MODE_I2C) != GPIO_RESULT_OK) {
-		dal_ddc_close(ddc);
-
-		return present;
-	}
-
-	/*
-	 * Read GPIO: DP sink is present if both clock and data pins are zero
-	 *
-	 * [W/A] plug-unplug DP cable, sometimes customer board has
-	 * one short pulse on clk_pin(1V, < 1ms). DP will be config to HDMI/DVI
-	 * then monitor can't br light up. Add retry 3 times
-	 * But in real passive dongle, it need additional 3ms to detect
-	 */
-	do {
-		gpio_result = dal_gpio_get_value(ddc->pin_clock, &clock_pin);
-		ASSERT(gpio_result == GPIO_RESULT_OK);
-		if (clock_pin)
-			udelay(1000);
-		else
-			break;
-	} while (retry++ < 3);
-
-	present = (gpio_result == GPIO_RESULT_OK) && !clock_pin;
-
-	dal_ddc_close(ddc);
-
-	return present;
-}
-
-/*
- * @brief
- * Detect output sink type
- */
-static enum signal_type link_detect_sink(struct dc_link *link,
-					 enum dc_detect_reason reason)
-{
-	enum signal_type result;
-	struct graphics_object_id enc_id;
-
-	if (link->is_dig_mapping_flexible)
-		enc_id = (struct graphics_object_id){.id = ENCODER_ID_UNKNOWN};
-	else
-		enc_id = link->link_enc->id;
-	result = get_basic_signal_type(enc_id, link->link_id);
-
-	/* Use basic signal type for link without physical connector. */
-	if (link->ep_type != DISPLAY_ENDPOINT_PHY)
-		return result;
-
-	/* Internal digital encoder will detect only dongles
-	 * that require digital signal
-	 */
-
-	/* Detection mechanism is different
-	 * for different native connectors.
-	 * LVDS connector supports only LVDS signal;
-	 * PCIE is a bus slot, the actual connector needs to be detected first;
-	 * eDP connector supports only eDP signal;
-	 * HDMI should check straps for audio
-	 */
-
-	/* PCIE detects the actual connector on add-on board */
-	if (link->link_id.id == CONNECTOR_ID_PCIE) {
-		/* ZAZTODO implement PCIE add-on card detection */
-	}
-
-	switch (link->link_id.id) {
-	case CONNECTOR_ID_HDMI_TYPE_A: {
-		/* check audio support:
-		 * if native HDMI is not supported, switch to DVI
-		 */
-		struct audio_support *aud_support =
-					&link->dc->res_pool->audio_support;
-
-		if (!aud_support->hdmi_audio_native)
-			if (link->link_id.id == CONNECTOR_ID_HDMI_TYPE_A)
-				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
-	}
-	break;
-	case CONNECTOR_ID_DISPLAY_PORT:
-	case CONNECTOR_ID_USBC: {
-		/* DP HPD short pulse. Passive DP dongle will not
-		 * have short pulse
-		 */
-		if (reason != DETECT_REASON_HPDRX) {
-			/* Check whether DP signal detected: if not -
-			 * we assume signal is DVI; it could be corrected
-			 * to HDMI after dongle detection
-			 */
-			if (!dm_helpers_is_dp_sink_present(link))
-				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
-		}
-	}
-	break;
-	default:
-	break;
-	}
-
-	return result;
-}
-
-static enum signal_type decide_signal_from_strap_and_dongle_type(enum display_dongle_type dongle_type,
-								 struct audio_support *audio_support)
-{
-	enum signal_type signal = SIGNAL_TYPE_NONE;
-
-	switch (dongle_type) {
-	case DISPLAY_DONGLE_DP_HDMI_DONGLE:
-		if (audio_support->hdmi_audio_on_dongle)
-			signal = SIGNAL_TYPE_HDMI_TYPE_A;
-		else
-			signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-		break;
-	case DISPLAY_DONGLE_DP_DVI_DONGLE:
-		signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-		break;
-	case DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE:
-		if (audio_support->hdmi_audio_native)
-			signal =  SIGNAL_TYPE_HDMI_TYPE_A;
-		else
-			signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-		break;
-	default:
-		signal = SIGNAL_TYPE_NONE;
-		break;
-	}
-
-	return signal;
-}
-
-static bool i2c_read(
-	struct ddc_service *ddc,
-	uint32_t address,
-	uint8_t *buffer,
-	uint32_t len)
-{
-	uint8_t offs_data = 0;
-	struct i2c_payload payloads[2] = {
-		{
-		.write = true,
-		.address = address,
-		.length = 1,
-		.data = &offs_data },
-		{
-		.write = false,
-		.address = address,
-		.length = len,
-		.data = buffer } };
-
-	struct i2c_command command = {
-		.payloads = payloads,
-		.number_of_payloads = 2,
-		.engine = DDC_I2C_COMMAND_ENGINE,
-		.speed = ddc->ctx->dc->caps.i2c_speed_in_khz };
-
-	return dm_helpers_submit_i2c(
-			ddc->ctx,
-			ddc->link,
-			&command);
-}
-
-enum {
-	DP_SINK_CAP_SIZE =
-		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV + 1
-};
-
-static void query_dp_dual_mode_adaptor(
-	struct ddc_service *ddc,
-	struct display_sink_capability *sink_cap)
-{
-	uint8_t i;
-	bool is_valid_hdmi_signature;
-	enum display_dongle_type *dongle = &sink_cap->dongle_type;
-	uint8_t type2_dongle_buf[DP_ADAPTOR_TYPE2_SIZE];
-	bool is_type2_dongle = false;
-	int retry_count = 2;
-	struct dp_hdmi_dongle_signature_data *dongle_signature;
-
-	/* Assume we have no valid DP passive dongle connected */
-	*dongle = DISPLAY_DONGLE_NONE;
-	sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK;
-
-	/* Read DP-HDMI dongle I2c (no response interpreted as DP-DVI dongle)*/
-	if (!i2c_read(
-		ddc,
-		DP_HDMI_DONGLE_ADDRESS,
-		type2_dongle_buf,
-		sizeof(type2_dongle_buf))) {
-		/* Passive HDMI dongles can sometimes fail here without retrying*/
-		while (retry_count > 0) {
-			if (i2c_read(ddc,
-				DP_HDMI_DONGLE_ADDRESS,
-				type2_dongle_buf,
-				sizeof(type2_dongle_buf)))
-				break;
-			retry_count--;
-		}
-		if (retry_count == 0) {
-			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
-			sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_DVI_MAX_TMDS_CLK;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf, sizeof(type2_dongle_buf),
-					"DP-DVI passive dongle %dMhz: ",
-					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
-			return;
-		}
-	}
-
-	/* Check if Type 2 dongle.*/
-	if (type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_ID] == DP_ADAPTOR_TYPE2_ID)
-		is_type2_dongle = true;
-
-	dongle_signature =
-		(struct dp_hdmi_dongle_signature_data *)type2_dongle_buf;
-
-	is_valid_hdmi_signature = true;
-
-	/* Check EOT */
-	if (dongle_signature->eot != DP_HDMI_DONGLE_SIGNATURE_EOT) {
-		is_valid_hdmi_signature = false;
-	}
-
-	/* Check signature */
-	for (i = 0; i < sizeof(dongle_signature->id); ++i) {
-		/* If its not the right signature,
-		 * skip mismatch in subversion byte.*/
-		if (dongle_signature->id[i] !=
-			dp_hdmi_dongle_signature_str[i] && i != 3) {
-
-			if (is_type2_dongle) {
-				is_valid_hdmi_signature = false;
-				break;
-			}
-
-		}
-	}
-
-	if (is_type2_dongle) {
-		uint32_t max_tmds_clk =
-			type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK];
-
-		max_tmds_clk = max_tmds_clk * 2 + max_tmds_clk / 2;
-
-		if (0 == max_tmds_clk ||
-				max_tmds_clk < DP_ADAPTOR_TYPE2_MIN_TMDS_CLK ||
-				max_tmds_clk > DP_ADAPTOR_TYPE2_MAX_TMDS_CLK) {
-			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"DP-DVI passive dongle %dMhz: ",
-					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
-		} else {
-			if (is_valid_hdmi_signature == true) {
-				*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
-
-				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-						sizeof(type2_dongle_buf),
-						"Type 2 DP-HDMI passive dongle %dMhz: ",
-						max_tmds_clk);
-			} else {
-				*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
-
-				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-						sizeof(type2_dongle_buf),
-						"Type 2 DP-HDMI passive dongle (no signature) %dMhz: ",
-						max_tmds_clk);
-
-			}
-
-			/* Multiply by 1000 to convert to kHz. */
-			sink_cap->max_hdmi_pixel_clock =
-				max_tmds_clk * 1000;
-		}
-		sink_cap->is_dongle_type_one = false;
-
-	} else {
-		if (is_valid_hdmi_signature == true) {
-			*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"Type 1 DP-HDMI passive dongle %dMhz: ",
-					sink_cap->max_hdmi_pixel_clock / 1000);
-		} else {
-			*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
-
-			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
-					sizeof(type2_dongle_buf),
-					"Type 1 DP-HDMI passive dongle (no signature) %dMhz: ",
-					sink_cap->max_hdmi_pixel_clock / 1000);
-		}
-		sink_cap->is_dongle_type_one = true;
-	}
-
-	return;
-}
-
-static enum signal_type dp_passive_dongle_detection(struct ddc_service *ddc,
-						    struct display_sink_capability *sink_cap,
-						    struct audio_support *audio_support)
-{
-	query_dp_dual_mode_adaptor(ddc, sink_cap);
-
-	return decide_signal_from_strap_and_dongle_type(sink_cap->dongle_type,
-							audio_support);
-}
-
-static void link_disconnect_sink(struct dc_link *link)
-{
-	if (link->local_sink) {
-		dc_sink_release(link->local_sink);
-		link->local_sink = NULL;
-	}
-
-	link->dpcd_sink_count = 0;
-	//link->dpcd_caps.dpcd_rev.raw = 0;
-}
-
-static void link_disconnect_remap(struct dc_sink *prev_sink, struct dc_link *link)
-{
-	dc_sink_release(link->local_sink);
-	link->local_sink = prev_sink;
-}
-
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-bool dc_link_is_hdcp14(struct dc_link *link, enum signal_type signal)
-{
-	bool ret = false;
-
-	switch (signal)	{
-	case SIGNAL_TYPE_DISPLAY_PORT:
-	case SIGNAL_TYPE_DISPLAY_PORT_MST:
-		ret = link->hdcp_caps.bcaps.bits.HDCP_CAPABLE;
-		break;
-	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-	case SIGNAL_TYPE_DVI_DUAL_LINK:
-	case SIGNAL_TYPE_HDMI_TYPE_A:
-	/* HDMI doesn't tell us its HDCP(1.4) capability, so assume to always be capable,
-	 * we can poll for bksv but some displays have an issue with this. Since its so rare
-	 * for a display to not be 1.4 capable, this assumtion is ok
-	 */
-		ret = true;
-		break;
-	default:
-		break;
-	}
-	return ret;
-}
-
-bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal)
-{
-	bool ret = false;
-
-	switch (signal)	{
-	case SIGNAL_TYPE_DISPLAY_PORT:
-	case SIGNAL_TYPE_DISPLAY_PORT_MST:
-		ret = (link->hdcp_caps.bcaps.bits.HDCP_CAPABLE &&
-				link->hdcp_caps.rx_caps.fields.byte0.hdcp_capable &&
-				(link->hdcp_caps.rx_caps.fields.version == 0x2)) ? 1 : 0;
-		break;
-	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-	case SIGNAL_TYPE_DVI_DUAL_LINK:
-	case SIGNAL_TYPE_HDMI_TYPE_A:
-		ret = (link->hdcp_caps.rx_caps.fields.version == 0x4) ? 1:0;
-		break;
-	default:
-		break;
-	}
-
-	return ret;
-}
-
-static void query_hdcp_capability(enum signal_type signal, struct dc_link *link)
-{
-	struct hdcp_protection_message msg22;
-	struct hdcp_protection_message msg14;
-
-	memset(&msg22, 0, sizeof(struct hdcp_protection_message));
-	memset(&msg14, 0, sizeof(struct hdcp_protection_message));
-	memset(link->hdcp_caps.rx_caps.raw, 0,
-		sizeof(link->hdcp_caps.rx_caps.raw));
-
-	if ((link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			link->ddc->transaction_type ==
-			DDC_TRANSACTION_TYPE_I2C_OVER_AUX) ||
-			link->connector_signal == SIGNAL_TYPE_EDP) {
-		msg22.data = link->hdcp_caps.rx_caps.raw;
-		msg22.length = sizeof(link->hdcp_caps.rx_caps.raw);
-		msg22.msg_id = HDCP_MESSAGE_ID_RX_CAPS;
-	} else {
-		msg22.data = &link->hdcp_caps.rx_caps.fields.version;
-		msg22.length = sizeof(link->hdcp_caps.rx_caps.fields.version);
-		msg22.msg_id = HDCP_MESSAGE_ID_HDCP2VERSION;
-	}
-	msg22.version = HDCP_VERSION_22;
-	msg22.link = HDCP_LINK_PRIMARY;
-	msg22.max_retries = 5;
-	dc_process_hdcp_msg(signal, link, &msg22);
-
-	if (signal == SIGNAL_TYPE_DISPLAY_PORT || signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		msg14.data = &link->hdcp_caps.bcaps.raw;
-		msg14.length = sizeof(link->hdcp_caps.bcaps.raw);
-		msg14.msg_id = HDCP_MESSAGE_ID_READ_BCAPS;
-		msg14.version = HDCP_VERSION_14;
-		msg14.link = HDCP_LINK_PRIMARY;
-		msg14.max_retries = 5;
-
-		dc_process_hdcp_msg(signal, link, &msg14);
-	}
-
-}
-#endif
-
-static void read_current_link_settings_on_detect(struct dc_link *link)
-{
-	union lane_count_set lane_count_set = {0};
-	uint8_t link_bw_set;
-	uint8_t link_rate_set;
-	uint32_t read_dpcd_retry_cnt = 10;
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	int i;
-	union max_down_spread max_down_spread = {0};
-
-	// Read DPCD 00101h to find out the number of lanes currently set
-	for (i = 0; i < read_dpcd_retry_cnt; i++) {
-		status = core_link_read_dpcd(link,
-					     DP_LANE_COUNT_SET,
-					     &lane_count_set.raw,
-					     sizeof(lane_count_set));
-		/* First DPCD read after VDD ON can fail if the particular board
-		 * does not have HPD pin wired correctly. So if DPCD read fails,
-		 * which it should never happen, retry a few times. Target worst
-		 * case scenario of 80 ms.
-		 */
-		if (status == DC_OK) {
-			link->cur_link_settings.lane_count =
-					lane_count_set.bits.LANE_COUNT_SET;
-			break;
-		}
-
-		msleep(8);
-	}
-
-	// Read DPCD 00100h to find if standard link rates are set
-	core_link_read_dpcd(link, DP_LINK_BW_SET,
-			    &link_bw_set, sizeof(link_bw_set));
-
-	if (link_bw_set == 0) {
-		if (link->connector_signal == SIGNAL_TYPE_EDP) {
-			/* If standard link rates are not being used,
-			 * Read DPCD 00115h to find the edp link rate set used
-			 */
-			core_link_read_dpcd(link, DP_LINK_RATE_SET,
-					    &link_rate_set, sizeof(link_rate_set));
-
-			// edp_supported_link_rates_count = 0 for DP
-			if (link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
-				link->cur_link_settings.link_rate =
-					link->dpcd_caps.edp_supported_link_rates[link_rate_set];
-				link->cur_link_settings.link_rate_set = link_rate_set;
-				link->cur_link_settings.use_link_rate_set = true;
-			}
-		} else {
-			// Link Rate not found. Seamless boot may not work.
-			ASSERT(false);
-		}
-	} else {
-		link->cur_link_settings.link_rate = link_bw_set;
-		link->cur_link_settings.use_link_rate_set = false;
-	}
-	// Read DPCD 00003h to find the max down spread.
-	core_link_read_dpcd(link, DP_MAX_DOWNSPREAD,
-			    &max_down_spread.raw, sizeof(max_down_spread));
-	link->cur_link_settings.link_spread =
-		max_down_spread.bits.MAX_DOWN_SPREAD ?
-		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
-}
-
-static bool detect_dp(struct dc_link *link,
-		      struct display_sink_capability *sink_caps,
-		      enum dc_detect_reason reason)
-{
-	struct audio_support *audio_support = &link->dc->res_pool->audio_support;
-
-	sink_caps->signal = link_detect_sink(link, reason);
-	sink_caps->transaction_type =
-		get_ddc_transaction_type(sink_caps->signal);
-
-	if (sink_caps->transaction_type == DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
-		sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT;
-		if (!detect_dp_sink_caps(link))
-			return false;
-
-		if (is_dp_branch_device(link))
-			/* DP SST branch */
-			link->type = dc_connection_sst_branch;
-	} else {
-		/* DP passive dongles */
-		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
-								sink_caps,
-								audio_support);
-		link->dpcd_caps.dongle_type = sink_caps->dongle_type;
-		link->dpcd_caps.is_dongle_type_one = sink_caps->is_dongle_type_one;
-		link->dpcd_caps.dpcd_rev.raw = 0;
-	}
-
-	return true;
-}
-
-static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
-{
-	if (old_edid->length != new_edid->length)
-		return false;
-
-	if (new_edid->length == 0)
-		return false;
-
-	return (memcmp(old_edid->raw_edid,
-		       new_edid->raw_edid, new_edid->length) == 0);
-}
-
-static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
-{
-	/**
-	 * something is terribly wrong if time out is > 200ms. (5Hz)
-	 * 500 microseconds * 400 tries us 200 ms
-	 **/
-	unsigned int sleep_time_in_microseconds = 500;
-	unsigned int tries_allowed = 400;
-	bool is_in_alt_mode;
-	unsigned long long enter_timestamp;
-	unsigned long long finish_timestamp;
-	unsigned long long time_taken_in_ns;
-	int tries_taken;
-
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	if (!link->link_enc->funcs->is_in_alt_mode)
-		return true;
-
-	is_in_alt_mode = link->link_enc->funcs->is_in_alt_mode(link->link_enc);
-	DC_LOG_DC("DP Alt mode state on HPD: %d\n", is_in_alt_mode);
-
-	if (is_in_alt_mode)
-		return true;
-
-	enter_timestamp = dm_get_timestamp(link->ctx);
-
-	for (tries_taken = 0; tries_taken < tries_allowed; tries_taken++) {
-		udelay(sleep_time_in_microseconds);
-		/* ask the link if alt mode is enabled, if so return ok */
-		if (link->link_enc->funcs->is_in_alt_mode(link->link_enc)) {
-			finish_timestamp = dm_get_timestamp(link->ctx);
-			time_taken_in_ns =
-				dm_get_elapse_time_in_ns(link->ctx,
-							 finish_timestamp,
-							 enter_timestamp);
-			DC_LOG_WARNING("Alt mode entered finished after %llu ms\n",
-				       div_u64(time_taken_in_ns, 1000000));
-			return true;
-		}
-	}
-	finish_timestamp = dm_get_timestamp(link->ctx);
-	time_taken_in_ns = dm_get_elapse_time_in_ns(link->ctx, finish_timestamp,
-						    enter_timestamp);
-	DC_LOG_WARNING("Alt mode has timed out after %llu ms\n",
-		       div_u64(time_taken_in_ns, 1000000));
-	return false;
-}
-
-static void apply_dpia_mst_dsc_always_on_wa(struct dc_link *link)
-{
-	/* Apply work around for tunneled MST on certain USB4 docks. Always use DSC if dock
-	 * reports DSC support.
-	 */
-	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
-			link->type == dc_connection_mst_branch &&
-			link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
-			link->dpcd_caps.branch_hw_revision == DP_BRANCH_HW_REV_20 &&
-			link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT &&
-			!link->dc->debug.dpia_debug.bits.disable_mst_dsc_work_around)
-		link->wa_flags.dpia_mst_dsc_always_on = true;
-}
-
-static void revert_dpia_mst_dsc_always_on_wa(struct dc_link *link)
-{
-	/* Disable work around which keeps DSC on for tunneled MST on certain USB4 docks. */
-	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-		link->wa_flags.dpia_mst_dsc_always_on = false;
-}
-
-static bool discover_dp_mst_topology(struct dc_link *link, enum dc_detect_reason reason)
-{
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	LINK_INFO("link=%d, mst branch is now Connected\n",
-		  link->link_index);
-
-	link->type = dc_connection_mst_branch;
-	apply_dpia_mst_dsc_always_on_wa(link);
-
-	dm_helpers_dp_update_branch_info(link->ctx, link);
-	if (dm_helpers_dp_mst_start_top_mgr(link->ctx,
-			link, (reason == DETECT_REASON_BOOT || reason == DETECT_REASON_RESUMEFROMS3S4))) {
-		link_disconnect_sink(link);
-	} else {
-		link->type = dc_connection_sst_branch;
-	}
-
-	return link->type == dc_connection_mst_branch;
-}
-
-bool reset_cur_dp_mst_topology(struct dc_link *link)
-{
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	LINK_INFO("link=%d, mst branch is now Disconnected\n",
-		  link->link_index);
-
-	revert_dpia_mst_dsc_always_on_wa(link);
-	return dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
-}
-
-static bool should_prepare_phy_clocks_for_link_verification(const struct dc *dc,
-		enum dc_detect_reason reason)
-{
-	int i;
-	bool can_apply_seamless_boot = false;
-
-	for (i = 0; i < dc->current_state->stream_count; i++) {
-		if (dc->current_state->streams[i]->apply_seamless_boot_optimization) {
-			can_apply_seamless_boot = true;
-			break;
-		}
-	}
-
-	return !can_apply_seamless_boot && reason != DETECT_REASON_BOOT;
-}
-
-static void prepare_phy_clocks_for_destructive_link_verification(const struct dc *dc)
-{
-	dc_z10_restore(dc);
-	clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
-}
-
-static void restore_phy_clocks_for_destructive_link_verification(const struct dc *dc)
-{
-	clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
-}
-
-static void set_all_streams_dpms_off_for_link(struct dc_link *link)
-{
-	int i;
-	struct pipe_ctx *pipe_ctx;
-	struct dc_stream_update stream_update;
-	bool dpms_off = true;
-	struct link_resource link_res = {0};
-
-	memset(&stream_update, 0, sizeof(stream_update));
-	stream_update.dpms_off = &dpms_off;
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
-		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
-				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe) {
-			stream_update.stream = pipe_ctx->stream;
-			dc_commit_updates_for_stream(link->ctx->dc, NULL, 0,
-					pipe_ctx->stream, &stream_update,
-					link->ctx->dc->current_state);
-		}
-	}
-
-	/* link can be also enabled by vbios. In this case it is not recorded
-	 * in pipe_ctx. Disable link phy here to make sure it is completely off
-	 */
-	dp_disable_link_phy(link, &link_res, link->connector_signal);
-}
-
-static void verify_link_capability_destructive(struct dc_link *link,
-		struct dc_sink *sink,
-		enum dc_detect_reason reason)
-{
-	bool should_prepare_phy_clocks =
-			should_prepare_phy_clocks_for_link_verification(link->dc, reason);
-
-	if (should_prepare_phy_clocks)
-		prepare_phy_clocks_for_destructive_link_verification(link->dc);
-
-	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
-		struct dc_link_settings known_limit_link_setting =
-				dp_get_max_link_cap(link);
-		set_all_streams_dpms_off_for_link(link);
-		dp_verify_link_cap_with_retries(
-				link, &known_limit_link_setting,
-				LINK_TRAINING_MAX_VERIFY_RETRY);
-	} else {
-		ASSERT(0);
-	}
-
-	if (should_prepare_phy_clocks)
-		restore_phy_clocks_for_destructive_link_verification(link->dc);
-}
-
-static void verify_link_capability_non_destructive(struct dc_link *link)
-{
-	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
-		if (dc_is_embedded_signal(link->local_sink->sink_signal) ||
-				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-			/* TODO - should we check link encoder's max link caps here?
-			 * How do we know which link encoder to check from?
-			 */
-			link->verified_link_cap = link->reported_link_cap;
-		else
-			link->verified_link_cap = dp_get_max_link_cap(link);
-	}
-}
-
-static bool should_verify_link_capability_destructively(struct dc_link *link,
-		enum dc_detect_reason reason)
-{
-	bool destrictive = false;
-	struct dc_link_settings max_link_cap;
-	bool is_link_enc_unavailable = link->link_enc &&
-			link->dc->res_pool->funcs->link_encs_assign &&
-			!link_enc_cfg_is_link_enc_avail(
-					link->ctx->dc,
-					link->link_enc->preferred_engine,
-					link);
-
-	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
-		max_link_cap = dp_get_max_link_cap(link);
-		destrictive = true;
-
-		if (link->dc->debug.skip_detection_link_training ||
-				dc_is_embedded_signal(link->local_sink->sink_signal) ||
-				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
-			destrictive = false;
-		} else if (link_dp_get_encoding_format(&max_link_cap) ==
-				DP_8b_10b_ENCODING) {
-			if (link->dpcd_caps.is_mst_capable ||
-					is_link_enc_unavailable) {
-				destrictive = false;
-			}
-		}
-	}
-
-	return destrictive;
-}
-
-static void verify_link_capability(struct dc_link *link, struct dc_sink *sink,
-		enum dc_detect_reason reason)
-{
-	if (should_verify_link_capability_destructively(link, reason))
-		verify_link_capability_destructive(link, sink, reason);
-	else
-		verify_link_capability_non_destructive(link);
-}
-
-static void read_scdc_caps(struct ddc_service *ddc_service, struct dc_sink *sink)
-{
-	uint8_t slave_address = HDMI_SCDC_ADDRESS;
-	uint8_t offset = HDMI_SCDC_MANUFACTURER_OUI;
-
-	link_query_ddc_data(ddc_service, slave_address, &offset,
-			sizeof(offset), sink->scdc_caps.manufacturer_OUI.byte,
-			sizeof(sink->scdc_caps.manufacturer_OUI.byte));
-
-	offset = HDMI_SCDC_DEVICE_ID;
-
-	link_query_ddc_data(ddc_service, slave_address, &offset,
-			sizeof(offset), &(sink->scdc_caps.device_id.byte), sizeof(sink->scdc_caps.device_id.byte));
-}
-
-/**
- * detect_link_and_local_sink() - Detect if a sink is attached to a given link
- *
- * link->local_sink is created or destroyed as needed.
- *
- * This does not create remote sinks.
- */
-static bool detect_link_and_local_sink(struct dc_link *link,
-				  enum dc_detect_reason reason)
-{
-	struct dc_sink_init_data sink_init_data = { 0 };
-	struct display_sink_capability sink_caps = { 0 };
-	uint32_t i;
-	bool converter_disable_audio = false;
-	struct audio_support *aud_support = &link->dc->res_pool->audio_support;
-	bool same_edid = false;
-	enum dc_edid_status edid_status;
-	struct dc_context *dc_ctx = link->ctx;
-	struct dc *dc = dc_ctx->dc;
-	struct dc_sink *sink = NULL;
-	struct dc_sink *prev_sink = NULL;
-	struct dpcd_caps prev_dpcd_caps;
-	enum dc_connection_type new_connection_type = dc_connection_none;
-	const uint32_t post_oui_delay = 30; // 30ms
-
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	if (dc_is_virtual_signal(link->connector_signal))
-		return false;
-
-	if (((link->connector_signal == SIGNAL_TYPE_LVDS ||
-		link->connector_signal == SIGNAL_TYPE_EDP) &&
-		(!link->dc->config.allow_edp_hotplug_detection)) &&
-		link->local_sink) {
-		// need to re-write OUI and brightness in resume case
-		if (link->connector_signal == SIGNAL_TYPE_EDP &&
-			(link->dpcd_sink_ext_caps.bits.oled == 1)) {
-			dpcd_set_source_specific_data(link);
-			msleep(post_oui_delay);
-			set_default_brightness_aux(link);
-			//TODO: use cached
-		}
-
-		return true;
-	}
-
-	if (!dc_link_detect_sink(link, &new_connection_type)) {
-		BREAK_TO_DEBUGGER();
-		return false;
-	}
-
-	prev_sink = link->local_sink;
-	if (prev_sink) {
-		dc_sink_retain(prev_sink);
-		memcpy(&prev_dpcd_caps, &link->dpcd_caps, sizeof(struct dpcd_caps));
-	}
-
-	link_disconnect_sink(link);
-	if (new_connection_type != dc_connection_none) {
-		link->type = new_connection_type;
-		link->link_state_valid = false;
-
-		/* From Disconnected-to-Connected. */
-		switch (link->connector_signal) {
-		case SIGNAL_TYPE_HDMI_TYPE_A: {
-			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
-			if (aud_support->hdmi_audio_native)
-				sink_caps.signal = SIGNAL_TYPE_HDMI_TYPE_A;
-			else
-				sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-			break;
-		}
-
-		case SIGNAL_TYPE_DVI_SINGLE_LINK: {
-			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
-			sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-			break;
-		}
-
-		case SIGNAL_TYPE_DVI_DUAL_LINK: {
-			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
-			sink_caps.signal = SIGNAL_TYPE_DVI_DUAL_LINK;
-			break;
-		}
-
-		case SIGNAL_TYPE_LVDS: {
-			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
-			sink_caps.signal = SIGNAL_TYPE_LVDS;
-			break;
-		}
-
-		case SIGNAL_TYPE_EDP: {
-			read_current_link_settings_on_detect(link);
-
-			detect_edp_sink_caps(link);
-			read_current_link_settings_on_detect(link);
-
-			/* Disable power sequence on MIPI panel + converter
-			 */
-			if (dc->config.enable_mipi_converter_optimization &&
-				dc_ctx->dce_version == DCN_VERSION_3_01 &&
-				link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_0022B9 &&
-				memcmp(&link->dpcd_caps.branch_dev_name, DP_SINK_BRANCH_DEV_NAME_7580,
-					sizeof(link->dpcd_caps.branch_dev_name)) == 0) {
-				dc->config.edp_no_power_sequencing = true;
-
-				if (!link->dpcd_caps.set_power_state_capable_edp)
-					link->wa_flags.dp_keep_receiver_powered = true;
-			}
-
-			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
-			sink_caps.signal = SIGNAL_TYPE_EDP;
-			break;
-		}
-
-		case SIGNAL_TYPE_DISPLAY_PORT: {
-			/* wa HPD high coming too early*/
-			if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
-			    link->link_enc->features.flags.bits.DP_IS_USB_C == 1) {
-				/* if alt mode times out, return false */
-				if (!wait_for_entering_dp_alt_mode(link))
-					return false;
-			}
-
-			if (!detect_dp(link, &sink_caps, reason)) {
-				if (prev_sink)
-					dc_sink_release(prev_sink);
-				return false;
-			}
-
-			/* Active SST downstream branch device unplug*/
-			if (link->type == dc_connection_sst_branch &&
-			    link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
-				if (prev_sink)
-					/* Downstream unplug */
-					dc_sink_release(prev_sink);
-				return true;
-			}
-
-			/* disable audio for non DP to HDMI active sst converter */
-			if (link->type == dc_connection_sst_branch &&
-					is_dp_active_dongle(link) &&
-					(link->dpcd_caps.dongle_type !=
-							DISPLAY_DONGLE_DP_HDMI_CONVERTER))
-				converter_disable_audio = true;
-			break;
-		}
-
-		default:
-			DC_ERROR("Invalid connector type! signal:%d\n",
-				 link->connector_signal);
-			if (prev_sink)
-				dc_sink_release(prev_sink);
-			return false;
-		} /* switch() */
-
-		if (link->dpcd_caps.sink_count.bits.SINK_COUNT)
-			link->dpcd_sink_count =
-				link->dpcd_caps.sink_count.bits.SINK_COUNT;
-		else
-			link->dpcd_sink_count = 1;
-
-		set_ddc_transaction_type(link->ddc,
-						     sink_caps.transaction_type);
-
-		link->aux_mode =
-			link_is_in_aux_transaction_mode(link->ddc);
-
-		sink_init_data.link = link;
-		sink_init_data.sink_signal = sink_caps.signal;
-
-		sink = dc_sink_create(&sink_init_data);
-		if (!sink) {
-			DC_ERROR("Failed to create sink!\n");
-			if (prev_sink)
-				dc_sink_release(prev_sink);
-			return false;
-		}
-
-		sink->link->dongle_max_pix_clk = sink_caps.max_hdmi_pixel_clock;
-		sink->converter_disable_audio = converter_disable_audio;
-
-		/* dc_sink_create returns a new reference */
-		link->local_sink = sink;
-
-		edid_status = dm_helpers_read_local_edid(link->ctx,
-							 link, sink);
-
-		switch (edid_status) {
-		case EDID_BAD_CHECKSUM:
-			DC_LOG_ERROR("EDID checksum invalid.\n");
-			break;
-		case EDID_PARTIAL_VALID:
-			DC_LOG_ERROR("Partial EDID valid, abandon invalid blocks.\n");
-			break;
-		case EDID_NO_RESPONSE:
-			DC_LOG_ERROR("No EDID read.\n");
-			/*
-			 * Abort detection for non-DP connectors if we have
-			 * no EDID
-			 *
-			 * DP needs to report as connected if HDP is high
-			 * even if we have no EDID in order to go to
-			 * fail-safe mode
-			 */
-			if (dc_is_hdmi_signal(link->connector_signal) ||
-			    dc_is_dvi_signal(link->connector_signal)) {
-				if (prev_sink)
-					dc_sink_release(prev_sink);
-
-				return false;
-			}
-
-			if (link->type == dc_connection_sst_branch &&
-					link->dpcd_caps.dongle_type ==
-						DISPLAY_DONGLE_DP_VGA_CONVERTER &&
-					reason == DETECT_REASON_HPDRX) {
-				/* Abort detection for DP-VGA adapters when EDID
-				 * can't be read and detection reason is VGA-side
-				 * hotplug
-				 */
-				if (prev_sink)
-					dc_sink_release(prev_sink);
-				link_disconnect_sink(link);
-
-				return true;
-			}
-
-			break;
-		default:
-			break;
-		}
-
-		// Check if edid is the same
-		if ((prev_sink) &&
-		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
-			same_edid = is_same_edid(&prev_sink->dc_edid,
-						 &sink->dc_edid);
-
-		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
-			link->ctx->dc->debug.hdmi20_disable = true;
-
-		if (dc_is_hdmi_signal(link->connector_signal))
-			read_scdc_caps(link->ddc, link->local_sink);
-
-		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
-		    sink_caps.transaction_type ==
-		    DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
-			/*
-			 * TODO debug why Dell 2413 doesn't like
-			 *  two link trainings
-			 */
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-			query_hdcp_capability(sink->sink_signal, link);
-#endif
-		} else {
-			// If edid is the same, then discard new sink and revert back to original sink
-			if (same_edid) {
-				link_disconnect_remap(prev_sink, link);
-				sink = prev_sink;
-				prev_sink = NULL;
-			}
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-			query_hdcp_capability(sink->sink_signal, link);
-#endif
-		}
-
-		/* HDMI-DVI Dongle */
-		if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
-		    !sink->edid_caps.edid_hdmi)
-			sink->sink_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-
-		if (link->local_sink && dc_is_dp_signal(sink_caps.signal))
-			dp_trace_init(link);
-
-		/* Connectivity log: detection */
-		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
-			CONN_DATA_DETECT(link,
-					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
-					 DC_EDID_BLOCK_SIZE,
-					 "%s: [Block %d] ", sink->edid_caps.display_name, i);
-		}
-
-		DC_LOG_DETECTION_EDID_PARSER("%s: "
-			"manufacturer_id = %X, "
-			"product_id = %X, "
-			"serial_number = %X, "
-			"manufacture_week = %d, "
-			"manufacture_year = %d, "
-			"display_name = %s, "
-			"speaker_flag = %d, "
-			"audio_mode_count = %d\n",
-			__func__,
-			sink->edid_caps.manufacturer_id,
-			sink->edid_caps.product_id,
-			sink->edid_caps.serial_number,
-			sink->edid_caps.manufacture_week,
-			sink->edid_caps.manufacture_year,
-			sink->edid_caps.display_name,
-			sink->edid_caps.speaker_flags,
-			sink->edid_caps.audio_mode_count);
-
-		for (i = 0; i < sink->edid_caps.audio_mode_count; i++) {
-			DC_LOG_DETECTION_EDID_PARSER("%s: mode number = %d, "
-				"format_code = %d, "
-				"channel_count = %d, "
-				"sample_rate = %d, "
-				"sample_size = %d\n",
-				__func__,
-				i,
-				sink->edid_caps.audio_modes[i].format_code,
-				sink->edid_caps.audio_modes[i].channel_count,
-				sink->edid_caps.audio_modes[i].sample_rate,
-				sink->edid_caps.audio_modes[i].sample_size);
-		}
-
-		if (link->connector_signal == SIGNAL_TYPE_EDP) {
-			/* Init dc_panel_config by HW config */
-			if (dc_ctx->dc->res_pool->funcs->get_panel_config_defaults)
-				dc_ctx->dc->res_pool->funcs->get_panel_config_defaults(&link->panel_config);
-			/* Pickup base DM settings */
-			dm_helpers_init_panel_settings(dc_ctx, &link->panel_config, sink);
-			// Override dc_panel_config if system has specific settings
-			dm_helpers_override_panel_settings(dc_ctx, &link->panel_config);
-		}
-
-	} else {
-		/* From Connected-to-Disconnected. */
-		link->type = dc_connection_none;
-		sink_caps.signal = SIGNAL_TYPE_NONE;
-		/* When we unplug a passive DP-HDMI dongle connection, dongle_max_pix_clk
-		 *  is not cleared. If we emulate a DP signal on this connection, it thinks
-		 *  the dongle is still there and limits the number of modes we can emulate.
-		 *  Clear dongle_max_pix_clk on disconnect to fix this
-		 */
-		link->dongle_max_pix_clk = 0;
-
-		dc_link_clear_dprx_states(link);
-		dp_trace_reset(link);
-	}
-
-	LINK_INFO("link=%d, dc_sink_in=%p is now %s prev_sink=%p edid same=%d\n",
-		  link->link_index, sink,
-		  (sink_caps.signal ==
-		   SIGNAL_TYPE_NONE ? "Disconnected" : "Connected"),
-		  prev_sink, same_edid);
-
-	if (prev_sink)
-		dc_sink_release(prev_sink);
-
-	return true;
-}
-
-bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
-{
-	bool is_local_sink_detect_success;
-	bool is_delegated_to_mst_top_mgr = false;
-	enum dc_connection_type pre_link_type = link->type;
-
-	is_local_sink_detect_success = detect_link_and_local_sink(link, reason);
-
-	if (is_local_sink_detect_success && link->local_sink)
-		verify_link_capability(link, link->local_sink, reason);
-
-	if (is_local_sink_detect_success && link->local_sink &&
-			dc_is_dp_signal(link->local_sink->sink_signal) &&
-			link->dpcd_caps.is_mst_capable)
-		is_delegated_to_mst_top_mgr = discover_dp_mst_topology(link, reason);
-
-	if (is_local_sink_detect_success &&
-			pre_link_type == dc_connection_mst_branch &&
-			link->type != dc_connection_mst_branch)
-		is_delegated_to_mst_top_mgr = reset_cur_dp_mst_topology(link);
-
-	return is_local_sink_detect_success && !is_delegated_to_mst_top_mgr;
-}
-
-static enum channel_id get_ddc_line(struct dc_link *link)
-{
-	struct ddc *ddc;
-	enum channel_id channel;
-
-	channel = CHANNEL_ID_UNKNOWN;
-
-	ddc = get_ddc_pin(link->ddc);
-
-	if (ddc) {
-		switch (dal_ddc_get_line(ddc)) {
-		case GPIO_DDC_LINE_DDC1:
-			channel = CHANNEL_ID_DDC1;
-			break;
-		case GPIO_DDC_LINE_DDC2:
-			channel = CHANNEL_ID_DDC2;
-			break;
-		case GPIO_DDC_LINE_DDC3:
-			channel = CHANNEL_ID_DDC3;
-			break;
-		case GPIO_DDC_LINE_DDC4:
-			channel = CHANNEL_ID_DDC4;
-			break;
-		case GPIO_DDC_LINE_DDC5:
-			channel = CHANNEL_ID_DDC5;
-			break;
-		case GPIO_DDC_LINE_DDC6:
-			channel = CHANNEL_ID_DDC6;
-			break;
-		case GPIO_DDC_LINE_DDC_VGA:
-			channel = CHANNEL_ID_DDC_VGA;
-			break;
-		case GPIO_DDC_LINE_I2C_PAD:
-			channel = CHANNEL_ID_I2C_PAD;
-			break;
-		default:
-			BREAK_TO_DEBUGGER();
-			break;
-		}
-	}
-
-	return channel;
-}
-
-static enum transmitter translate_encoder_to_transmitter(struct graphics_object_id encoder)
-{
-	switch (encoder.id) {
-	case ENCODER_ID_INTERNAL_UNIPHY:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_UNIPHY_A;
-		case ENUM_ID_2:
-			return TRANSMITTER_UNIPHY_B;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	case ENCODER_ID_INTERNAL_UNIPHY1:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_UNIPHY_C;
-		case ENUM_ID_2:
-			return TRANSMITTER_UNIPHY_D;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	case ENCODER_ID_INTERNAL_UNIPHY2:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_UNIPHY_E;
-		case ENUM_ID_2:
-			return TRANSMITTER_UNIPHY_F;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	case ENCODER_ID_INTERNAL_UNIPHY3:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_UNIPHY_G;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	case ENCODER_ID_EXTERNAL_NUTMEG:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_NUTMEG_CRT;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	case ENCODER_ID_EXTERNAL_TRAVIS:
-		switch (encoder.enum_id) {
-		case ENUM_ID_1:
-			return TRANSMITTER_TRAVIS_CRT;
-		case ENUM_ID_2:
-			return TRANSMITTER_TRAVIS_LCD;
-		default:
-			return TRANSMITTER_UNKNOWN;
-		}
-	break;
-	default:
-		return TRANSMITTER_UNKNOWN;
-	}
-}
-
-static bool dc_link_construct_legacy(struct dc_link *link,
-				     const struct link_init_data *init_params)
-{
-	uint8_t i;
-	struct ddc_service_init_data ddc_service_init_data = { 0 };
-	struct dc_context *dc_ctx = init_params->ctx;
-	struct encoder_init_data enc_init_data = { 0 };
-	struct panel_cntl_init_data panel_cntl_init_data = { 0 };
-	struct integrated_info *info;
-	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
-	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
-	struct bp_disp_connector_caps_info disp_connect_caps_info = { 0 };
-
-	DC_LOGGER_INIT(dc_ctx->logger);
-
-	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info)
-		goto create_fail;
-
-	link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
-	link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
-
-	link->link_status.dpcd_caps = &link->dpcd_caps;
-
-	link->dc = init_params->dc;
-	link->ctx = dc_ctx;
-	link->link_index = init_params->link_index;
-
-	memset(&link->preferred_training_settings, 0,
-	       sizeof(struct dc_link_training_overrides));
-	memset(&link->preferred_link_setting, 0,
-	       sizeof(struct dc_link_settings));
-
-	link->link_id =
-		bios->funcs->get_connector_id(bios, init_params->connector_index);
-
-	link->ep_type = DISPLAY_ENDPOINT_PHY;
-
-	DC_LOG_DC("BIOS object table - link_id: %d", link->link_id.id);
-
-	if (bios->funcs->get_disp_connector_caps_info) {
-		bios->funcs->get_disp_connector_caps_info(bios, link->link_id, &disp_connect_caps_info);
-		link->is_internal_display = disp_connect_caps_info.INTERNAL_DISPLAY;
-		DC_LOG_DC("BIOS object table - is_internal_display: %d", link->is_internal_display);
-	}
-
-	if (link->link_id.type != OBJECT_TYPE_CONNECTOR) {
-		dm_output_to_console("%s: Invalid Connector ObjectID from Adapter Service for connector index:%d! type %d expected %d\n",
-				     __func__, init_params->connector_index,
-				     link->link_id.type, OBJECT_TYPE_CONNECTOR);
-		goto create_fail;
-	}
-
-	if (link->dc->res_pool->funcs->link_init)
-		link->dc->res_pool->funcs->link_init(link);
-
-	link->hpd_gpio = link_get_hpd_gpio(link->ctx->dc_bios, link->link_id,
-				      link->ctx->gpio_service);
-
-	if (link->hpd_gpio) {
-		dal_gpio_open(link->hpd_gpio, GPIO_MODE_INTERRUPT);
-		dal_gpio_unlock_pin(link->hpd_gpio);
-		link->irq_source_hpd = dal_irq_get_source(link->hpd_gpio);
-
-		DC_LOG_DC("BIOS object table - hpd_gpio id: %d", link->hpd_gpio->id);
-		DC_LOG_DC("BIOS object table - hpd_gpio en: %d", link->hpd_gpio->en);
-	}
-
-	switch (link->link_id.id) {
-	case CONNECTOR_ID_HDMI_TYPE_A:
-		link->connector_signal = SIGNAL_TYPE_HDMI_TYPE_A;
-
-		break;
-	case CONNECTOR_ID_SINGLE_LINK_DVID:
-	case CONNECTOR_ID_SINGLE_LINK_DVII:
-		link->connector_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
-		break;
-	case CONNECTOR_ID_DUAL_LINK_DVID:
-	case CONNECTOR_ID_DUAL_LINK_DVII:
-		link->connector_signal = SIGNAL_TYPE_DVI_DUAL_LINK;
-		break;
-	case CONNECTOR_ID_DISPLAY_PORT:
-	case CONNECTOR_ID_USBC:
-		link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
-
-		if (link->hpd_gpio)
-			link->irq_source_hpd_rx =
-					dal_irq_get_rx_source(link->hpd_gpio);
-
-		break;
-	case CONNECTOR_ID_EDP:
-		link->connector_signal = SIGNAL_TYPE_EDP;
-
-		if (link->hpd_gpio) {
-			if (!link->dc->config.allow_edp_hotplug_detection)
-				link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
-
-			switch (link->dc->config.allow_edp_hotplug_detection) {
-			case 1: // only the 1st eDP handles hotplug
-				if (link->link_index == 0)
-					link->irq_source_hpd_rx =
-						dal_irq_get_rx_source(link->hpd_gpio);
-				else
-					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
-				break;
-			case 2: // only the 2nd eDP handles hotplug
-				if (link->link_index == 1)
-					link->irq_source_hpd_rx =
-						dal_irq_get_rx_source(link->hpd_gpio);
-				else
-					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
-				break;
-			default:
-				break;
-			}
-		}
-
-		break;
-	case CONNECTOR_ID_LVDS:
-		link->connector_signal = SIGNAL_TYPE_LVDS;
-		break;
-	default:
-		DC_LOG_WARNING("Unsupported Connector type:%d!\n",
-			       link->link_id.id);
-		goto create_fail;
-	}
-
-	/* TODO: #DAL3 Implement id to str function.*/
-	LINK_INFO("Connector[%d] description:"
-		  "signal %d\n",
-		  init_params->connector_index,
-		  link->connector_signal);
-
-	ddc_service_init_data.ctx = link->ctx;
-	ddc_service_init_data.id = link->link_id;
-	ddc_service_init_data.link = link;
-	link->ddc = link_create_ddc_service(&ddc_service_init_data);
-
-	if (!link->ddc) {
-		DC_ERROR("Failed to create ddc_service!\n");
-		goto ddc_create_fail;
-	}
-
-	if (!link->ddc->ddc_pin) {
-		DC_ERROR("Failed to get I2C info for connector!\n");
-		goto ddc_create_fail;
-	}
-
-	link->ddc_hw_inst =
-		dal_ddc_get_line(get_ddc_pin(link->ddc));
-
-
-	if (link->dc->res_pool->funcs->panel_cntl_create &&
-		(link->link_id.id == CONNECTOR_ID_EDP ||
-			link->link_id.id == CONNECTOR_ID_LVDS)) {
-		panel_cntl_init_data.ctx = dc_ctx;
-		panel_cntl_init_data.inst =
-			panel_cntl_init_data.ctx->dc_edp_id_count;
-		link->panel_cntl =
-			link->dc->res_pool->funcs->panel_cntl_create(
-								&panel_cntl_init_data);
-		panel_cntl_init_data.ctx->dc_edp_id_count++;
-
-		if (link->panel_cntl == NULL) {
-			DC_ERROR("Failed to create link panel_cntl!\n");
-			goto panel_cntl_create_fail;
-		}
-	}
-
-	enc_init_data.ctx = dc_ctx;
-	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
-			      &enc_init_data.encoder);
-	enc_init_data.connector = link->link_id;
-	enc_init_data.channel = get_ddc_line(link);
-	enc_init_data.hpd_source = get_hpd_line(link);
-
-	link->hpd_src = enc_init_data.hpd_source;
-
-	enc_init_data.transmitter =
-		translate_encoder_to_transmitter(enc_init_data.encoder);
-	link->link_enc =
-		link->dc->res_pool->funcs->link_enc_create(dc_ctx, &enc_init_data);
-
-	if (!link->link_enc) {
-		DC_ERROR("Failed to create link encoder!\n");
-		goto link_enc_create_fail;
-	}
-
-	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
-	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
-
-	/* Update link encoder tracking variables. These are used for the dynamic
-	 * assignment of link encoders to streams.
-	 */
-	link->eng_id = link->link_enc->preferred_engine;
-	link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = link->link_enc;
-	link->dc->res_pool->dig_link_enc_count++;
-
-	link->link_enc_hw_inst = link->link_enc->transmitter;
-
-	for (i = 0; i < 4; i++) {
-		if (bp_funcs->get_device_tag(dc_ctx->dc_bios,
-					     link->link_id, i,
-					     &link->device_tag) != BP_RESULT_OK) {
-			DC_ERROR("Failed to find device tag!\n");
-			goto device_tag_fail;
-		}
-
-		/* Look for device tag that matches connector signal,
-		 * CRT for rgb, LCD for other supported signal tyes
-		 */
-		if (!bp_funcs->is_device_id_supported(dc_ctx->dc_bios,
-						      link->device_tag.dev_id))
-			continue;
-		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_CRT &&
-		    link->connector_signal != SIGNAL_TYPE_RGB)
-			continue;
-		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_LCD &&
-		    link->connector_signal == SIGNAL_TYPE_RGB)
-			continue;
-
-		DC_LOG_DC("BIOS object table - device_tag.acpi_device: %d", link->device_tag.acpi_device);
-		DC_LOG_DC("BIOS object table - device_tag.dev_id.device_type: %d", link->device_tag.dev_id.device_type);
-		DC_LOG_DC("BIOS object table - device_tag.dev_id.enum_id: %d", link->device_tag.dev_id.enum_id);
-		break;
-	}
-
-	if (bios->integrated_info)
-		memcpy(info, bios->integrated_info, sizeof(*info));
-
-	/* Look for channel mapping corresponding to connector and device tag */
-	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {
-		struct external_display_path *path =
-			&info->ext_disp_conn_info.path[i];
-
-		if (path->device_connector_id.enum_id == link->link_id.enum_id &&
-		    path->device_connector_id.id == link->link_id.id &&
-		    path->device_connector_id.type == link->link_id.type) {
-			if (link->device_tag.acpi_device != 0 &&
-			    path->device_acpi_enum == link->device_tag.acpi_device) {
-				link->ddi_channel_mapping = path->channel_mapping;
-				link->chip_caps = path->caps;
-				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
-				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
-			} else if (path->device_tag ==
-				   link->device_tag.dev_id.raw_device_tag) {
-				link->ddi_channel_mapping = path->channel_mapping;
-				link->chip_caps = path->caps;
-				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
-				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
-			}
-
-			if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) {
-				link->bios_forced_drive_settings.VOLTAGE_SWING =
-						(info->ext_disp_conn_info.fixdpvoltageswing & 0x3);
-				link->bios_forced_drive_settings.PRE_EMPHASIS =
-						((info->ext_disp_conn_info.fixdpvoltageswing >> 2) & 0x3);
-			}
-
-			break;
-		}
-	}
-
-	if (bios->funcs->get_atom_dc_golden_table)
-		bios->funcs->get_atom_dc_golden_table(bios);
-
-	/*
-	 * TODO check if GPIO programmed correctly
-	 *
-	 * If GPIO isn't programmed correctly HPD might not rise or drain
-	 * fast enough, leading to bounces.
-	 */
-	program_hpd_filter(link);
-
-	link->psr_settings.psr_vtotal_control_support = false;
-	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
-
-	DC_LOG_DC("BIOS object table - %s finished successfully.\n", __func__);
-	kfree(info);
-	return true;
-device_tag_fail:
-	link->link_enc->funcs->destroy(&link->link_enc);
-link_enc_create_fail:
-	if (link->panel_cntl != NULL)
-		link->panel_cntl->funcs->destroy(&link->panel_cntl);
-panel_cntl_create_fail:
-	link_destroy_ddc_service(&link->ddc);
-ddc_create_fail:
-create_fail:
-
-	if (link->hpd_gpio) {
-		dal_gpio_destroy_irq(&link->hpd_gpio);
-		link->hpd_gpio = NULL;
-	}
-
-	DC_LOG_DC("BIOS object table - %s failed.\n", __func__);
-	kfree(info);
-
-	return false;
-}
-
-static bool dc_link_construct_dpia(struct dc_link *link,
-				   const struct link_init_data *init_params)
-{
-	struct ddc_service_init_data ddc_service_init_data = { 0 };
-	struct dc_context *dc_ctx = init_params->ctx;
-
-	DC_LOGGER_INIT(dc_ctx->logger);
-
-	/* Initialized irq source for hpd and hpd rx */
-	link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
-	link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
-	link->link_status.dpcd_caps = &link->dpcd_caps;
-
-	link->dc = init_params->dc;
-	link->ctx = dc_ctx;
-	link->link_index = init_params->link_index;
-
-	memset(&link->preferred_training_settings, 0,
-	       sizeof(struct dc_link_training_overrides));
-	memset(&link->preferred_link_setting, 0,
-	       sizeof(struct dc_link_settings));
-
-	/* Dummy Init for linkid */
-	link->link_id.type = OBJECT_TYPE_CONNECTOR;
-	link->link_id.id = CONNECTOR_ID_DISPLAY_PORT;
-	link->link_id.enum_id = ENUM_ID_1 + init_params->connector_index;
-	link->is_internal_display = false;
-	link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
-	LINK_INFO("Connector[%d] description:signal %d\n",
-		  init_params->connector_index,
-		  link->connector_signal);
-
-	link->ep_type = DISPLAY_ENDPOINT_USB4_DPIA;
-	link->is_dig_mapping_flexible = true;
-
-	/* TODO: Initialize link : funcs->link_init */
-
-	ddc_service_init_data.ctx = link->ctx;
-	ddc_service_init_data.id = link->link_id;
-	ddc_service_init_data.link = link;
-	/* Set indicator for dpia link so that ddc won't be created */
-	ddc_service_init_data.is_dpia_link = true;
-
-	link->ddc = link_create_ddc_service(&ddc_service_init_data);
-	if (!link->ddc) {
-		DC_ERROR("Failed to create ddc_service!\n");
-		goto ddc_create_fail;
-	}
-
-	/* Set dpia port index : 0 to number of dpia ports */
-	link->ddc_hw_inst = init_params->connector_index;
-
-	/* TODO: Create link encoder */
-
-	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
-
-	/* Some docks seem to NAK I2C writes to segment pointer with mot=0. */
-	link->wa_flags.dp_mot_reset_segment = true;
-
-	return true;
-
-ddc_create_fail:
-	return false;
-}
-
-static bool dc_link_construct(struct dc_link *link,
-			      const struct link_init_data *init_params)
-{
-	/* Handle dpia case */
-	if (init_params->is_dpia_link)
-		return dc_link_construct_dpia(link, init_params);
-	else
-		return dc_link_construct_legacy(link, init_params);
-}
-/*******************************************************************************
- * Public functions
- ******************************************************************************/
-struct dc_link *link_create(const struct link_init_data *init_params)
-{
-	struct dc_link *link =
-			kzalloc(sizeof(*link), GFP_KERNEL);
-
-	if (NULL == link)
-		goto alloc_fail;
-
-	if (false == dc_link_construct(link, init_params))
-		goto construct_fail;
-
-	return link;
-
-construct_fail:
-	kfree(link);
-
-alloc_fail:
-	return NULL;
-}
-
-void link_destroy(struct dc_link **link)
-{
-	dc_link_destruct(*link);
-	kfree(*link);
-	*link = NULL;
-}
-
-static void enable_stream_features(struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-
-	if (pipe_ctx->stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		struct dc_link *link = stream->link;
-		union down_spread_ctrl old_downspread;
-		union down_spread_ctrl new_downspread;
-
-		memset(&old_downspread, 0, sizeof(old_downspread));
-
-		core_link_read_dpcd(link, DP_DOWNSPREAD_CTRL,
-				&old_downspread.raw, sizeof(old_downspread));
-
-		new_downspread.raw = old_downspread.raw;
-
-		new_downspread.bits.IGNORE_MSA_TIMING_PARAM =
-				(stream->ignore_msa_timing_param) ? 1 : 0;
-
-		if (new_downspread.raw != old_downspread.raw) {
-			core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
-				&new_downspread.raw, sizeof(new_downspread));
-		}
-
-	} else {
-		dm_helpers_mst_enable_stream_features(stream);
-	}
-}
-
-static enum dc_status enable_link_dp(struct dc_state *state,
-				     struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	enum dc_status status;
-	bool skip_video_pattern;
-	struct dc_link *link = stream->link;
-	const struct dc_link_settings *link_settings =
-			&pipe_ctx->link_config.dp_link_settings;
-	bool fec_enable;
-	int i;
-	bool apply_seamless_boot_optimization = false;
-	uint32_t bl_oled_enable_delay = 50; // in ms
-	uint32_t post_oui_delay = 30; // 30ms
-	/* Reduce link bandwidth between failed link training attempts. */
-	bool do_fallback = false;
-
-	// check for seamless boot
-	for (i = 0; i < state->stream_count; i++) {
-		if (state->streams[i]->apply_seamless_boot_optimization) {
-			apply_seamless_boot_optimization = true;
-			break;
-		}
-	}
-
-	/* Train with fallback when enabling DPIA link. Conventional links are
-	 * trained with fallback during sink detection.
-	 */
-	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-		do_fallback = true;
-
-	/*
-	 * Temporary w/a to get DP2.0 link rates to work with SST.
-	 * TODO DP2.0 - Workaround: Remove w/a if and when the issue is resolved.
-	 */
-	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING &&
-			pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			link->dc->debug.set_mst_en_for_sst) {
-		dp_enable_mst_on_sink(link, true);
-	}
-
-	if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP) {
-		/*in case it is not on*/
-		if (!link->dc->config.edp_no_power_sequencing)
-			link->dc->hwss.edp_power_control(link, true);
-		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
-	}
-
-	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
-		/* TODO - DP2.0 HW: calculate 32 symbol clock for HPO encoder */
-	} else {
-		pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
-				link_settings->link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
-		if (state->clk_mgr && !apply_seamless_boot_optimization)
-			state->clk_mgr->funcs->update_clocks(state->clk_mgr,
-					state, false);
-	}
-
-	// during mode switch we do DP_SET_POWER off then on, and OUI is lost
-	dpcd_set_source_specific_data(link);
-	if (link->dpcd_sink_ext_caps.raw != 0) {
-		post_oui_delay += link->panel_config.pps.extra_post_OUI_ms;
-		msleep(post_oui_delay);
-	}
-
-	// similarly, mode switch can cause loss of cable ID
-	dpcd_write_cable_id_to_dprx(link);
-
-	skip_video_pattern = true;
-
-	if (link_settings->link_rate == LINK_RATE_LOW)
-		skip_video_pattern = false;
-
-	if (perform_link_training_with_retries(link_settings,
-					       skip_video_pattern,
-					       LINK_TRAINING_ATTEMPTS,
-					       pipe_ctx,
-					       pipe_ctx->stream->signal,
-					       do_fallback)) {
-		status = DC_OK;
-	} else {
-		status = DC_FAIL_DP_LINK_TRAINING;
-	}
-
-	if (link->preferred_training_settings.fec_enable)
-		fec_enable = *link->preferred_training_settings.fec_enable;
-	else
-		fec_enable = true;
-
-	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING)
-		dp_set_fec_enable(link, fec_enable);
-
-	// during mode set we do DP_SET_POWER off then on, aux writes are lost
-	if (link->dpcd_sink_ext_caps.bits.oled == 1 ||
-		link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1 ||
-		link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1) {
-		set_default_brightness_aux(link); // TODO: use cached if known
-		if (link->dpcd_sink_ext_caps.bits.oled == 1)
-			msleep(bl_oled_enable_delay);
-		link_backlight_enable_aux(link, true);
-	}
-
-	return status;
-}
-
-static enum dc_status enable_link_edp(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx)
-{
-	return enable_link_dp(state, pipe_ctx);
-}
-
-static enum dc_status enable_link_dp_mst(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx)
-{
-	struct dc_link *link = pipe_ctx->stream->link;
-
-	/* sink signal type after MST branch is MST. Multiple MST sinks
-	 * share one link. Link DP PHY is enable or training only once.
-	 */
-	if (link->link_status.link_active)
-		return DC_OK;
-
-	/* clear payload table */
-	dm_helpers_dp_mst_clear_payload_allocation_table(link->ctx, link);
-
-	/* to make sure the pending down rep can be processed
-	 * before enabling the link
-	 */
-	dm_helpers_dp_mst_poll_pending_down_reply(link->ctx, link);
-
-	/* set the sink to MST mode before enabling the link */
-	dp_enable_mst_on_sink(link, true);
-
-	return enable_link_dp(state, pipe_ctx);
-}
-
-void dc_link_blank_all_dp_displays(struct dc *dc)
-{
-	unsigned int i;
-	uint8_t dpcd_power_state = '\0';
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-
-	for (i = 0; i < dc->link_count; i++) {
-		if ((dc->links[i]->connector_signal != SIGNAL_TYPE_DISPLAY_PORT) ||
-			(dc->links[i]->priv == NULL) || (dc->links[i]->local_sink == NULL))
-			continue;
-
-		/* DP 2.0 spec requires that we read LTTPR caps first */
-		dp_retrieve_lttpr_cap(dc->links[i]);
-		/* if any of the displays are lit up turn them off */
-		status = core_link_read_dpcd(dc->links[i], DP_SET_POWER,
-							&dpcd_power_state, sizeof(dpcd_power_state));
-
-		if (status == DC_OK && dpcd_power_state == DP_POWER_STATE_D0)
-			dc_link_blank_dp_stream(dc->links[i], true);
-	}
-
-}
-
-void dc_link_blank_all_edp_displays(struct dc *dc)
-{
-	unsigned int i;
-	uint8_t dpcd_power_state = '\0';
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-
-	for (i = 0; i < dc->link_count; i++) {
-		if ((dc->links[i]->connector_signal != SIGNAL_TYPE_EDP) ||
-			(!dc->links[i]->edp_sink_present))
-			continue;
-
-		/* if any of the displays are lit up turn them off */
-		status = core_link_read_dpcd(dc->links[i], DP_SET_POWER,
-							&dpcd_power_state, sizeof(dpcd_power_state));
-
-		if (status == DC_OK && dpcd_power_state == DP_POWER_STATE_D0)
-			dc_link_blank_dp_stream(dc->links[i], true);
-	}
-}
-
-void dc_link_blank_dp_stream(struct dc_link *link, bool hw_init)
-{
-	unsigned int j;
-	struct dc  *dc = link->ctx->dc;
-	enum signal_type signal = link->connector_signal;
-
-	if ((signal == SIGNAL_TYPE_EDP) ||
-		(signal == SIGNAL_TYPE_DISPLAY_PORT)) {
-		if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
-			link->link_enc->funcs->get_dig_frontend &&
-			link->link_enc->funcs->is_dig_enabled(link->link_enc)) {
-			unsigned int fe = link->link_enc->funcs->get_dig_frontend(link->link_enc);
-
-			if (fe != ENGINE_ID_UNKNOWN)
-				for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
-					if (fe == dc->res_pool->stream_enc[j]->id) {
-						dc->res_pool->stream_enc[j]->funcs->dp_blank(link,
-									dc->res_pool->stream_enc[j]);
-						break;
-					}
-				}
-		}
-
-		if ((!link->wa_flags.dp_keep_receiver_powered) || hw_init)
-			dc_link_dp_receiver_power_ctrl(link, false);
-	}
-}
-
-static bool get_ext_hdmi_settings(struct pipe_ctx *pipe_ctx,
-		enum engine_id eng_id,
-		struct ext_hdmi_settings *settings)
-{
-	bool result = false;
-	int i = 0;
-	struct integrated_info *integrated_info =
-			pipe_ctx->stream->ctx->dc_bios->integrated_info;
-
-	if (integrated_info == NULL)
-		return false;
-
-	/*
-	 * Get retimer settings from sbios for passing SI eye test for DCE11
-	 * The setting values are varied based on board revision and port id
-	 * Therefore the setting values of each ports is passed by sbios.
-	 */
-
-	// Check if current bios contains ext Hdmi settings
-	if (integrated_info->gpu_cap_info & 0x20) {
-		switch (eng_id) {
-		case ENGINE_ID_DIGA:
-			settings->slv_addr = integrated_info->dp0_ext_hdmi_slv_addr;
-			settings->reg_num = integrated_info->dp0_ext_hdmi_6g_reg_num;
-			settings->reg_num_6g = integrated_info->dp0_ext_hdmi_6g_reg_num;
-			memmove(settings->reg_settings,
-					integrated_info->dp0_ext_hdmi_reg_settings,
-					sizeof(integrated_info->dp0_ext_hdmi_reg_settings));
-			memmove(settings->reg_settings_6g,
-					integrated_info->dp0_ext_hdmi_6g_reg_settings,
-					sizeof(integrated_info->dp0_ext_hdmi_6g_reg_settings));
-			result = true;
-			break;
-		case ENGINE_ID_DIGB:
-			settings->slv_addr = integrated_info->dp1_ext_hdmi_slv_addr;
-			settings->reg_num = integrated_info->dp1_ext_hdmi_6g_reg_num;
-			settings->reg_num_6g = integrated_info->dp1_ext_hdmi_6g_reg_num;
-			memmove(settings->reg_settings,
-					integrated_info->dp1_ext_hdmi_reg_settings,
-					sizeof(integrated_info->dp1_ext_hdmi_reg_settings));
-			memmove(settings->reg_settings_6g,
-					integrated_info->dp1_ext_hdmi_6g_reg_settings,
-					sizeof(integrated_info->dp1_ext_hdmi_6g_reg_settings));
-			result = true;
-			break;
-		case ENGINE_ID_DIGC:
-			settings->slv_addr = integrated_info->dp2_ext_hdmi_slv_addr;
-			settings->reg_num = integrated_info->dp2_ext_hdmi_6g_reg_num;
-			settings->reg_num_6g = integrated_info->dp2_ext_hdmi_6g_reg_num;
-			memmove(settings->reg_settings,
-					integrated_info->dp2_ext_hdmi_reg_settings,
-					sizeof(integrated_info->dp2_ext_hdmi_reg_settings));
-			memmove(settings->reg_settings_6g,
-					integrated_info->dp2_ext_hdmi_6g_reg_settings,
-					sizeof(integrated_info->dp2_ext_hdmi_6g_reg_settings));
-			result = true;
-			break;
-		case ENGINE_ID_DIGD:
-			settings->slv_addr = integrated_info->dp3_ext_hdmi_slv_addr;
-			settings->reg_num = integrated_info->dp3_ext_hdmi_6g_reg_num;
-			settings->reg_num_6g = integrated_info->dp3_ext_hdmi_6g_reg_num;
-			memmove(settings->reg_settings,
-					integrated_info->dp3_ext_hdmi_reg_settings,
-					sizeof(integrated_info->dp3_ext_hdmi_reg_settings));
-			memmove(settings->reg_settings_6g,
-					integrated_info->dp3_ext_hdmi_6g_reg_settings,
-					sizeof(integrated_info->dp3_ext_hdmi_6g_reg_settings));
-			result = true;
-			break;
-		default:
-			break;
-		}
-
-		if (result == true) {
-			// Validate settings from bios integrated info table
-			if (settings->slv_addr == 0)
-				return false;
-			if (settings->reg_num > 9)
-				return false;
-			if (settings->reg_num_6g > 3)
-				return false;
-
-			for (i = 0; i < settings->reg_num; i++) {
-				if (settings->reg_settings[i].i2c_reg_index > 0x20)
-					return false;
-			}
-
-			for (i = 0; i < settings->reg_num_6g; i++) {
-				if (settings->reg_settings_6g[i].i2c_reg_index > 0x20)
-					return false;
-			}
-		}
-	}
-
-	return result;
-}
-
-static bool i2c_write(struct pipe_ctx *pipe_ctx,
-		uint8_t address, uint8_t *buffer, uint32_t length)
-{
-	struct i2c_command cmd = {0};
-	struct i2c_payload payload = {0};
-
-	memset(&payload, 0, sizeof(payload));
-	memset(&cmd, 0, sizeof(cmd));
-
-	cmd.number_of_payloads = 1;
-	cmd.engine = I2C_COMMAND_ENGINE_DEFAULT;
-	cmd.speed = pipe_ctx->stream->ctx->dc->caps.i2c_speed_in_khz;
-
-	payload.address = address;
-	payload.data = buffer;
-	payload.length = length;
-	payload.write = true;
-	cmd.payloads = &payload;
-
-	if (dm_helpers_submit_i2c(pipe_ctx->stream->ctx,
-			pipe_ctx->stream->link, &cmd))
-		return true;
-
-	return false;
-}
-
-static void write_i2c_retimer_setting(
-		struct pipe_ctx *pipe_ctx,
-		bool is_vga_mode,
-		bool is_over_340mhz,
-		struct ext_hdmi_settings *settings)
-{
-	uint8_t slave_address = (settings->slv_addr >> 1);
-	uint8_t buffer[2];
-	const uint8_t apply_rx_tx_change = 0x4;
-	uint8_t offset = 0xA;
-	uint8_t value = 0;
-	int i = 0;
-	bool i2c_success = false;
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	memset(&buffer, 0, sizeof(buffer));
-
-	/* Start Ext-Hdmi programming*/
-
-	for (i = 0; i < settings->reg_num; i++) {
-		/* Apply 3G settings */
-		if (settings->reg_settings[i].i2c_reg_index <= 0x20) {
-
-			buffer[0] = settings->reg_settings[i].i2c_reg_index;
-			buffer[1] = settings->reg_settings[i].i2c_reg_val;
-			i2c_success = i2c_write(pipe_ctx, slave_address,
-						buffer, sizeof(buffer));
-			RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-				offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
-				slave_address, buffer[0], buffer[1], i2c_success?1:0);
-
-			if (!i2c_success)
-				goto i2c_write_fail;
-
-			/* Based on DP159 specs, APPLY_RX_TX_CHANGE bit in 0x0A
-			 * needs to be set to 1 on every 0xA-0xC write.
-			 */
-			if (settings->reg_settings[i].i2c_reg_index == 0xA ||
-				settings->reg_settings[i].i2c_reg_index == 0xB ||
-				settings->reg_settings[i].i2c_reg_index == 0xC) {
-
-				/* Query current value from offset 0xA */
-				if (settings->reg_settings[i].i2c_reg_index == 0xA)
-					value = settings->reg_settings[i].i2c_reg_val;
-				else {
-					i2c_success =
-						link_query_ddc_data(
-						pipe_ctx->stream->link->ddc,
-						slave_address, &offset, 1, &value, 1);
-					if (!i2c_success)
-						goto i2c_write_fail;
-				}
-
-				buffer[0] = offset;
-				/* Set APPLY_RX_TX_CHANGE bit to 1 */
-				buffer[1] = value | apply_rx_tx_change;
-				i2c_success = i2c_write(pipe_ctx, slave_address,
-						buffer, sizeof(buffer));
-				RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-					offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-					slave_address, buffer[0], buffer[1], i2c_success?1:0);
-				if (!i2c_success)
-					goto i2c_write_fail;
-			}
-		}
-	}
-
-	/* Apply 3G settings */
-	if (is_over_340mhz) {
-		for (i = 0; i < settings->reg_num_6g; i++) {
-			/* Apply 3G settings */
-			if (settings->reg_settings[i].i2c_reg_index <= 0x20) {
-
-				buffer[0] = settings->reg_settings_6g[i].i2c_reg_index;
-				buffer[1] = settings->reg_settings_6g[i].i2c_reg_val;
-				i2c_success = i2c_write(pipe_ctx, slave_address,
-							buffer, sizeof(buffer));
-				RETIMER_REDRIVER_INFO("above 340Mhz: retimer write to slave_address = 0x%x,\
-					offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-					slave_address, buffer[0], buffer[1], i2c_success?1:0);
-
-				if (!i2c_success)
-					goto i2c_write_fail;
-
-				/* Based on DP159 specs, APPLY_RX_TX_CHANGE bit in 0x0A
-				 * needs to be set to 1 on every 0xA-0xC write.
-				 */
-				if (settings->reg_settings_6g[i].i2c_reg_index == 0xA ||
-					settings->reg_settings_6g[i].i2c_reg_index == 0xB ||
-					settings->reg_settings_6g[i].i2c_reg_index == 0xC) {
-
-					/* Query current value from offset 0xA */
-					if (settings->reg_settings_6g[i].i2c_reg_index == 0xA)
-						value = settings->reg_settings_6g[i].i2c_reg_val;
-					else {
-						i2c_success =
-								link_query_ddc_data(
-								pipe_ctx->stream->link->ddc,
-								slave_address, &offset, 1, &value, 1);
-						if (!i2c_success)
-							goto i2c_write_fail;
-					}
-
-					buffer[0] = offset;
-					/* Set APPLY_RX_TX_CHANGE bit to 1 */
-					buffer[1] = value | apply_rx_tx_change;
-					i2c_success = i2c_write(pipe_ctx, slave_address,
-							buffer, sizeof(buffer));
-					RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-						offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-						slave_address, buffer[0], buffer[1], i2c_success?1:0);
-					if (!i2c_success)
-						goto i2c_write_fail;
-				}
-			}
-		}
-	}
-
-	if (is_vga_mode) {
-		/* Program additional settings if using 640x480 resolution */
-
-		/* Write offset 0xFF to 0x01 */
-		buffer[0] = 0xff;
-		buffer[1] = 0x01;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-				offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-				slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-
-		/* Write offset 0x00 to 0x23 */
-		buffer[0] = 0x00;
-		buffer[1] = 0x23;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-			slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-
-		/* Write offset 0xff to 0x00 */
-		buffer[0] = 0xff;
-		buffer[1] = 0x00;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
-			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-			slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-
-	}
-
-	return;
-
-i2c_write_fail:
-	DC_LOG_DEBUG("Set retimer failed");
-}
-
-static void write_i2c_default_retimer_setting(
-		struct pipe_ctx *pipe_ctx,
-		bool is_vga_mode,
-		bool is_over_340mhz)
-{
-	uint8_t slave_address = (0xBA >> 1);
-	uint8_t buffer[2];
-	bool i2c_success = false;
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	memset(&buffer, 0, sizeof(buffer));
-
-	/* Program Slave Address for tuning single integrity */
-	/* Write offset 0x0A to 0x13 */
-	buffer[0] = 0x0A;
-	buffer[1] = 0x13;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer writes default setting to slave_address = 0x%x,\
-		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-	/* Write offset 0x0A to 0x17 */
-	buffer[0] = 0x0A;
-	buffer[1] = 0x17;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-	/* Write offset 0x0B to 0xDA or 0xD8 */
-	buffer[0] = 0x0B;
-	buffer[1] = is_over_340mhz ? 0xDA : 0xD8;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-	/* Write offset 0x0A to 0x17 */
-	buffer[0] = 0x0A;
-	buffer[1] = 0x17;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-		offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-	/* Write offset 0x0C to 0x1D or 0x91 */
-	buffer[0] = 0x0C;
-	buffer[1] = is_over_340mhz ? 0x1D : 0x91;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-	/* Write offset 0x0A to 0x17 */
-	buffer[0] = 0x0A;
-	buffer[1] = 0x17;
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-			buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-		slave_address, buffer[0], buffer[1], i2c_success?1:0);
-	if (!i2c_success)
-		goto i2c_write_fail;
-
-
-	if (is_vga_mode) {
-		/* Program additional settings if using 640x480 resolution */
-
-		/* Write offset 0xFF to 0x01 */
-		buffer[0] = 0xff;
-		buffer[1] = 0x01;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
-			slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-
-		/* Write offset 0x00 to 0x23 */
-		buffer[0] = 0x00;
-		buffer[1] = 0x23;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
-			offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
-			slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-
-		/* Write offset 0xff to 0x00 */
-		buffer[0] = 0xff;
-		buffer[1] = 0x00;
-		i2c_success = i2c_write(pipe_ctx, slave_address,
-				buffer, sizeof(buffer));
-		RETIMER_REDRIVER_INFO("retimer write default setting to slave_addr = 0x%x,\
-			offset = 0x%x, reg_val= 0x%x, i2c_success = %d end here\n",
-			slave_address, buffer[0], buffer[1], i2c_success?1:0);
-		if (!i2c_success)
-			goto i2c_write_fail;
-	}
-
-	return;
-
-i2c_write_fail:
-	DC_LOG_DEBUG("Set default retimer failed");
-}
-
-static void write_i2c_redriver_setting(
-		struct pipe_ctx *pipe_ctx,
-		bool is_over_340mhz)
-{
-	uint8_t slave_address = (0xF0 >> 1);
-	uint8_t buffer[16];
-	bool i2c_success = false;
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	memset(&buffer, 0, sizeof(buffer));
-
-	// Program Slave Address for tuning single integrity
-	buffer[3] = 0x4E;
-	buffer[4] = 0x4E;
-	buffer[5] = 0x4E;
-	buffer[6] = is_over_340mhz ? 0x4E : 0x4A;
-
-	i2c_success = i2c_write(pipe_ctx, slave_address,
-					buffer, sizeof(buffer));
-	RETIMER_REDRIVER_INFO("redriver write 0 to all 16 reg offset expect following:\n\
-		\t slave_addr = 0x%x, offset[3] = 0x%x, offset[4] = 0x%x,\
-		offset[5] = 0x%x,offset[6] is_over_340mhz = 0x%x,\
-		i2c_success = %d\n",
-		slave_address, buffer[3], buffer[4], buffer[5], buffer[6], i2c_success?1:0);
-
-	if (!i2c_success)
-		DC_LOG_DEBUG("Set redriver failed");
-}
-
-static void disable_link(struct dc_link *link, const struct link_resource *link_res,
-		enum signal_type signal)
-{
-	/*
-	 * TODO: implement call for dp_set_hw_test_pattern
-	 * it is needed for compliance testing
-	 */
-
-	/* Here we need to specify that encoder output settings
-	 * need to be calculated as for the set mode,
-	 * it will lead to querying dynamic link capabilities
-	 * which should be done before enable output
-	 */
-
-	if (dc_is_dp_signal(signal)) {
-		/* SST DP, eDP */
-		struct dc_link_settings link_settings = link->cur_link_settings;
-		if (dc_is_dp_sst_signal(signal))
-			dp_disable_link_phy(link, link_res, signal);
-		else
-			dp_disable_link_phy_mst(link, link_res, signal);
-
-		if (dc_is_dp_sst_signal(signal) ||
-				link->mst_stream_alloc_table.stream_count == 0) {
-			if (link_dp_get_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
-				dp_set_fec_enable(link, false);
-				dp_set_fec_ready(link, link_res, false);
-			}
-		}
-	} else if (signal != SIGNAL_TYPE_VIRTUAL) {
-		link->dc->hwss.disable_link_output(link, link_res, signal);
-	}
-
-	if (signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		/* MST disable link only when no stream use the link */
-		if (link->mst_stream_alloc_table.stream_count <= 0)
-			link->link_status.link_active = false;
-	} else {
-		link->link_status.link_active = false;
-	}
-}
-
-static void enable_link_hdmi(struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	enum dc_color_depth display_color_depth;
-	enum engine_id eng_id;
-	struct ext_hdmi_settings settings = {0};
-	bool is_over_340mhz = false;
-	bool is_vga_mode = (stream->timing.h_addressable == 640)
-			&& (stream->timing.v_addressable == 480);
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-
-	if (stream->phy_pix_clk == 0)
-		stream->phy_pix_clk = stream->timing.pix_clk_100hz / 10;
-	if (stream->phy_pix_clk > 340000)
-		is_over_340mhz = true;
-
-	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
-		unsigned short masked_chip_caps = pipe_ctx->stream->link->chip_caps &
-				EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK;
-		if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_TISN65DP159RSBT) {
-			/* DP159, Retimer settings */
-			eng_id = pipe_ctx->stream_res.stream_enc->id;
-
-			if (get_ext_hdmi_settings(pipe_ctx, eng_id, &settings)) {
-				write_i2c_retimer_setting(pipe_ctx,
-						is_vga_mode, is_over_340mhz, &settings);
-			} else {
-				write_i2c_default_retimer_setting(pipe_ctx,
-						is_vga_mode, is_over_340mhz);
-			}
-		} else if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_PI3EQX1204) {
-			/* PI3EQX1204, Redriver settings */
-			write_i2c_redriver_setting(pipe_ctx, is_over_340mhz);
-		}
-	}
-
-	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
-		write_scdc_data(
-			stream->link->ddc,
-			stream->phy_pix_clk,
-			stream->timing.flags.LTE_340MCSC_SCRAMBLE);
-
-	memset(&stream->link->cur_link_settings, 0,
-			sizeof(struct dc_link_settings));
-
-	display_color_depth = stream->timing.display_color_depth;
-	if (stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR422)
-		display_color_depth = COLOR_DEPTH_888;
-
-	dc->hwss.enable_tmds_link_output(
-			link,
-			&pipe_ctx->link_res,
-			pipe_ctx->stream->signal,
-			pipe_ctx->clock_source->id,
-			display_color_depth,
-			stream->phy_pix_clk);
-
-	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
-		read_scdc_data(link->ddc);
-}
-
-static void enable_link_lvds(struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct dc *dc = stream->ctx->dc;
-
-	if (stream->phy_pix_clk == 0)
-		stream->phy_pix_clk = stream->timing.pix_clk_100hz / 10;
-
-	memset(&stream->link->cur_link_settings, 0,
-			sizeof(struct dc_link_settings));
-	dc->hwss.enable_lvds_link_output(
-			link,
-			&pipe_ctx->link_res,
-			pipe_ctx->clock_source->id,
-			stream->phy_pix_clk);
-
-}
-
-/****************************enable_link***********************************/
-static enum dc_status enable_link(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx)
-{
-	enum dc_status status = DC_ERROR_UNEXPECTED;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-
-	/* There's some scenarios where driver is unloaded with display
-	 * still enabled. When driver is reloaded, it may cause a display
-	 * to not light up if there is a mismatch between old and new
-	 * link settings. Need to call disable first before enabling at
-	 * new link settings.
-	 */
-	if (link->link_status.link_active) {
-		disable_link(link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
-	}
-
-	switch (pipe_ctx->stream->signal) {
-	case SIGNAL_TYPE_DISPLAY_PORT:
-		status = enable_link_dp(state, pipe_ctx);
-		break;
-	case SIGNAL_TYPE_EDP:
-		status = enable_link_edp(state, pipe_ctx);
-		break;
-	case SIGNAL_TYPE_DISPLAY_PORT_MST:
-		status = enable_link_dp_mst(state, pipe_ctx);
-		msleep(200);
-		break;
-	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-	case SIGNAL_TYPE_DVI_DUAL_LINK:
-	case SIGNAL_TYPE_HDMI_TYPE_A:
-		enable_link_hdmi(pipe_ctx);
-		status = DC_OK;
-		break;
-	case SIGNAL_TYPE_LVDS:
-		enable_link_lvds(pipe_ctx);
-		status = DC_OK;
-		break;
-	case SIGNAL_TYPE_VIRTUAL:
-		status = DC_OK;
-		break;
-	default:
-		break;
-	}
-
-	if (status == DC_OK)
-		pipe_ctx->stream->link->link_status.link_active = true;
-
-	return status;
-}
-
-static uint32_t get_timing_pixel_clock_100hz(const struct dc_crtc_timing *timing)
-{
-
-	uint32_t pxl_clk = timing->pix_clk_100hz;
-
-	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
-		pxl_clk /= 2;
-	else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
-		pxl_clk = pxl_clk * 2 / 3;
-
-	if (timing->display_color_depth == COLOR_DEPTH_101010)
-		pxl_clk = pxl_clk * 10 / 8;
-	else if (timing->display_color_depth == COLOR_DEPTH_121212)
-		pxl_clk = pxl_clk * 12 / 8;
-
-	return pxl_clk;
-}
-
-static bool dp_active_dongle_validate_timing(
-		const struct dc_crtc_timing *timing,
-		const struct dpcd_caps *dpcd_caps)
-{
-	const struct dc_dongle_caps *dongle_caps = &dpcd_caps->dongle_caps;
-
-	switch (dpcd_caps->dongle_type) {
-	case DISPLAY_DONGLE_DP_VGA_CONVERTER:
-	case DISPLAY_DONGLE_DP_DVI_CONVERTER:
-	case DISPLAY_DONGLE_DP_DVI_DONGLE:
-		if (timing->pixel_encoding == PIXEL_ENCODING_RGB)
-			return true;
-		else
-			return false;
-	default:
-		break;
-	}
-
-	if (dpcd_caps->dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER &&
-			dongle_caps->extendedCapValid == true) {
-		/* Check Pixel Encoding */
-		switch (timing->pixel_encoding) {
-		case PIXEL_ENCODING_RGB:
-		case PIXEL_ENCODING_YCBCR444:
-			break;
-		case PIXEL_ENCODING_YCBCR422:
-			if (!dongle_caps->is_dp_hdmi_ycbcr422_pass_through)
-				return false;
-			break;
-		case PIXEL_ENCODING_YCBCR420:
-			if (!dongle_caps->is_dp_hdmi_ycbcr420_pass_through)
-				return false;
-			break;
-		default:
-			/* Invalid Pixel Encoding*/
-			return false;
-		}
-
-		switch (timing->display_color_depth) {
-		case COLOR_DEPTH_666:
-		case COLOR_DEPTH_888:
-			/*888 and 666 should always be supported*/
-			break;
-		case COLOR_DEPTH_101010:
-			if (dongle_caps->dp_hdmi_max_bpc < 10)
-				return false;
-			break;
-		case COLOR_DEPTH_121212:
-			if (dongle_caps->dp_hdmi_max_bpc < 12)
-				return false;
-			break;
-		case COLOR_DEPTH_141414:
-		case COLOR_DEPTH_161616:
-		default:
-			/* These color depths are currently not supported */
-			return false;
-		}
-
-		/* Check 3D format */
-		switch (timing->timing_3d_format) {
-		case TIMING_3D_FORMAT_NONE:
-		case TIMING_3D_FORMAT_FRAME_ALTERNATE:
-			/*Only frame alternate 3D is supported on active dongle*/
-			break;
-		default:
-			/*other 3D formats are not supported due to bad infoframe translation */
-			return false;
-		}
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-		if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
-			struct dc_crtc_timing outputTiming = *timing;
-
-			if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
-				/* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
-				outputTiming.flags.DSC = 0;
-			if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
-				return false;
-		} else { // DP to HDMI TMDS converter
-			if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
-				return false;
-		}
-#else
-		if (get_timing_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
-			return false;
-#endif
-	}
-
-	if (dpcd_caps->channel_coding_cap.bits.DP_128b_132b_SUPPORTED == 0 &&
-			dpcd_caps->dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_PASSTHROUGH_SUPPORT == 0 &&
-			dongle_caps->dfp_cap_ext.supported) {
-
-		if (dongle_caps->dfp_cap_ext.max_pixel_rate_in_mps < (timing->pix_clk_100hz / 10000))
-			return false;
-
-		if (dongle_caps->dfp_cap_ext.max_video_h_active_width < timing->h_addressable)
-			return false;
-
-		if (dongle_caps->dfp_cap_ext.max_video_v_active_height < timing->v_addressable)
-			return false;
-
-		if (timing->pixel_encoding == PIXEL_ENCODING_RGB) {
-			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
-				return false;
-			if (timing->display_color_depth == COLOR_DEPTH_666 &&
-					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_6bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_888 &&
-					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_8bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
-					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_10bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
-					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_12bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
-					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_16bpc)
-				return false;
-		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR444) {
-			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
-				return false;
-			if (timing->display_color_depth == COLOR_DEPTH_888 &&
-					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_8bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
-					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_10bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
-					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_12bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
-					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_16bpc)
-				return false;
-		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
-			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
-				return false;
-			if (timing->display_color_depth == COLOR_DEPTH_888 &&
-					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_8bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
-					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_10bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
-					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_12bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
-					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_16bpc)
-				return false;
-		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420) {
-			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
-				return false;
-			if (timing->display_color_depth == COLOR_DEPTH_888 &&
-					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_8bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
-					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_10bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
-					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_12bpc)
-				return false;
-			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
-					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_16bpc)
-				return false;
-		}
-	}
-
-	return true;
-}
-
-enum dc_status dc_link_validate_mode_timing(
-		const struct dc_stream_state *stream,
-		struct dc_link *link,
-		const struct dc_crtc_timing *timing)
-{
-	uint32_t max_pix_clk = stream->link->dongle_max_pix_clk * 10;
-	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
-
-	/* A hack to avoid failing any modes for EDID override feature on
-	 * topology change such as lower quality cable for DP or different dongle
-	 */
-	if (link->remote_sinks[0] && link->remote_sinks[0]->sink_signal == SIGNAL_TYPE_VIRTUAL)
-		return DC_OK;
-
-	/* Passive Dongle */
-	if (max_pix_clk != 0 && get_timing_pixel_clock_100hz(timing) > max_pix_clk)
-		return DC_EXCEED_DONGLE_CAP;
-
-	/* Active Dongle*/
-	if (!dp_active_dongle_validate_timing(timing, dpcd_caps))
-		return DC_EXCEED_DONGLE_CAP;
-
-	switch (stream->signal) {
-	case SIGNAL_TYPE_EDP:
-	case SIGNAL_TYPE_DISPLAY_PORT:
-		if (!dp_validate_mode_timing(
-				link,
-				timing))
-			return DC_NO_DP_LINK_BANDWIDTH;
-		break;
-
-	default:
-		break;
-	}
-
-	return DC_OK;
-}
-
-const struct dc_link_status *dc_link_get_status(const struct dc_link *link)
-{
-	return &link->link_status;
-}
-
-void core_link_resume(struct dc_link *link)
-{
-	if (link->connector_signal != SIGNAL_TYPE_VIRTUAL)
-		program_hpd_filter(link);
-}
-
-static struct fixed31_32 get_pbn_per_slot(struct dc_stream_state *stream)
-{
-	struct fixed31_32 mbytes_per_sec;
-	uint32_t link_rate_in_mbytes_per_sec = dc_link_bandwidth_kbps(stream->link,
-			&stream->link->cur_link_settings);
-	link_rate_in_mbytes_per_sec /= 8000; /* Kbits to MBytes */
-
-	mbytes_per_sec = dc_fixpt_from_int(link_rate_in_mbytes_per_sec);
-
-	return dc_fixpt_div_int(mbytes_per_sec, 54);
-}
-
-static struct fixed31_32 get_pbn_from_bw_in_kbps(uint64_t kbps)
-{
-	struct fixed31_32 peak_kbps;
-	uint32_t numerator = 0;
-	uint32_t denominator = 1;
-
-	/*
-	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
-	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
-	 * common multiplier to render an integer PBN for all link rate/lane
-	 * counts combinations
-	 * calculate
-	 * peak_kbps *= (1006/1000)
-	 * peak_kbps *= (64/54)
-	 * peak_kbps *= 8    convert to bytes
-	 */
-
-	numerator = 64 * PEAK_FACTOR_X1000;
-	denominator = 54 * 8 * 1000 * 1000;
-	kbps *= numerator;
-	peak_kbps = dc_fixpt_from_fraction(kbps, denominator);
-
-	return peak_kbps;
-}
-
-static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
-{
-	uint64_t kbps;
-
-	kbps = dc_bandwidth_in_kbps_from_timing(&pipe_ctx->stream->timing);
-	return get_pbn_from_bw_in_kbps(kbps);
-}
-
-static void update_mst_stream_alloc_table(
-	struct dc_link *link,
-	struct stream_encoder *stream_enc,
-	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
-	const struct dc_dp_mst_stream_allocation_table *proposed_table)
-{
-	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
-	struct link_mst_stream_allocation *dc_alloc;
-
-	int i;
-	int j;
-
-	/* if DRM proposed_table has more than one new payload */
-	ASSERT(proposed_table->stream_count -
-			link->mst_stream_alloc_table.stream_count < 2);
-
-	/* copy proposed_table to link, add stream encoder */
-	for (i = 0; i < proposed_table->stream_count; i++) {
-
-		for (j = 0; j < link->mst_stream_alloc_table.stream_count; j++) {
-			dc_alloc =
-			&link->mst_stream_alloc_table.stream_allocations[j];
-
-			if (dc_alloc->vcp_id ==
-				proposed_table->stream_allocations[i].vcp_id) {
-
-				work_table[i] = *dc_alloc;
-				work_table[i].slot_count = proposed_table->stream_allocations[i].slot_count;
-				break; /* exit j loop */
-			}
-		}
-
-		/* new vcp_id */
-		if (j == link->mst_stream_alloc_table.stream_count) {
-			work_table[i].vcp_id =
-				proposed_table->stream_allocations[i].vcp_id;
-			work_table[i].slot_count =
-				proposed_table->stream_allocations[i].slot_count;
-			work_table[i].stream_enc = stream_enc;
-			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
-		}
-	}
-
-	/* update link->mst_stream_alloc_table with work_table */
-	link->mst_stream_alloc_table.stream_count =
-			proposed_table->stream_count;
-	for (i = 0; i < MAX_CONTROLLER_NUM; i++)
-		link->mst_stream_alloc_table.stream_allocations[i] =
-				work_table[i];
-}
-
-static void remove_stream_from_alloc_table(
-		struct dc_link *link,
-		struct stream_encoder *dio_stream_enc,
-		struct hpo_dp_stream_encoder *hpo_dp_stream_enc)
-{
-	int i = 0;
-	struct link_mst_stream_allocation_table *table =
-			&link->mst_stream_alloc_table;
-
-	if (hpo_dp_stream_enc) {
-		for (; i < table->stream_count; i++)
-			if (hpo_dp_stream_enc == table->stream_allocations[i].hpo_dp_stream_enc)
-				break;
-	} else {
-		for (; i < table->stream_count; i++)
-			if (dio_stream_enc == table->stream_allocations[i].stream_enc)
-				break;
-	}
-
-	if (i < table->stream_count) {
-		i++;
-		for (; i < table->stream_count; i++)
-			table->stream_allocations[i-1] = table->stream_allocations[i];
-		memset(&table->stream_allocations[table->stream_count-1], 0,
-				sizeof(struct link_mst_stream_allocation));
-		table->stream_count--;
-	}
-}
-
-static void dc_log_vcp_x_y(const struct dc_link *link, struct fixed31_32 avg_time_slots_per_mtp)
-{
-	const uint32_t VCP_Y_PRECISION = 1000;
-	uint64_t vcp_x, vcp_y;
-
-	// Add 0.5*(1/VCP_Y_PRECISION) to round up to decimal precision
-	avg_time_slots_per_mtp = dc_fixpt_add(
-			avg_time_slots_per_mtp, dc_fixpt_from_fraction(1, 2 * VCP_Y_PRECISION));
-
-	vcp_x = dc_fixpt_floor(avg_time_slots_per_mtp);
-	vcp_y = dc_fixpt_floor(
-			dc_fixpt_mul_int(
-				dc_fixpt_sub_int(avg_time_slots_per_mtp, dc_fixpt_floor(avg_time_slots_per_mtp)),
-				VCP_Y_PRECISION));
-
-	if (link->type == dc_connection_mst_branch)
-		DC_LOG_DP2("MST Update Payload: set_throttled_vcp_size slot X.Y for MST stream "
-				"X: %lld Y: %lld/%d", vcp_x, vcp_y, VCP_Y_PRECISION);
-	else
-		DC_LOG_DP2("SST Update Payload: set_throttled_vcp_size slot X.Y for SST stream "
-				"X: %lld Y: %lld/%d", vcp_x, vcp_y, VCP_Y_PRECISION);
-}
-
-/*
- * Payload allocation/deallocation for SST introduced in DP2.0
- */
-static enum dc_status dc_link_update_sst_payload(struct pipe_ctx *pipe_ctx,
-						 bool allocate)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct link_mst_stream_allocation_table proposed_table = {0};
-	struct fixed31_32 avg_time_slots_per_mtp;
-	const struct dc_link_settings empty_link_settings = {0};
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	/* slot X.Y for SST payload deallocate */
-	if (!allocate) {
-		avg_time_slots_per_mtp = dc_fixpt_from_int(0);
-
-		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
-
-		if (link_hwss->ext.set_throttled_vcp_size)
-			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
-					avg_time_slots_per_mtp);
-		if (link_hwss->ext.set_hblank_min_symbol_width)
-			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-					&empty_link_settings,
-					avg_time_slots_per_mtp);
-	}
-
-	/* calculate VC payload and update branch with new payload allocation table*/
-	if (!dpcd_write_128b_132b_sst_payload_allocation_table(
-			stream,
-			link,
-			&proposed_table,
-			allocate)) {
-		DC_LOG_ERROR("SST Update Payload: Failed to update "
-						"allocation table for "
-						"pipe idx: %d\n",
-						pipe_ctx->pipe_idx);
-		return DC_FAIL_DP_PAYLOAD_ALLOCATION;
-	}
-
-	proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
-
-	ASSERT(proposed_table.stream_count == 1);
-
-	//TODO - DP2.0 Logging: Instead of hpo_dp_stream_enc pointer, log instance id
-	DC_LOG_DP2("SST Update Payload: hpo_dp_stream_enc: %p      "
-		"vcp_id: %d      "
-		"slot_count: %d\n",
-		(void *) proposed_table.stream_allocations[0].hpo_dp_stream_enc,
-		proposed_table.stream_allocations[0].vcp_id,
-		proposed_table.stream_allocations[0].slot_count);
-
-	/* program DP source TX for payload */
-	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
-			&proposed_table);
-
-	/* poll for ACT handled */
-	if (!dpcd_poll_for_allocation_change_trigger(link)) {
-		// Failures will result in blackscreen and errors logged
-		BREAK_TO_DEBUGGER();
-	}
-
-	/* slot X.Y for SST payload allocate */
-	if (allocate && link_dp_get_encoding_format(&link->cur_link_settings) ==
-			DP_128b_132b_ENCODING) {
-		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, link);
-
-		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
-
-		if (link_hwss->ext.set_throttled_vcp_size)
-			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
-					avg_time_slots_per_mtp);
-		if (link_hwss->ext.set_hblank_min_symbol_width)
-			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-					&link->cur_link_settings,
-					avg_time_slots_per_mtp);
-	}
-
-	/* Always return DC_OK.
-	 * If part of sequence fails, log failure(s) and show blackscreen
-	 */
-	return DC_OK;
-}
-
-/* convert link_mst_stream_alloc_table to dm dp_mst_stream_alloc_table
- * because stream_encoder is not exposed to dm
- */
-enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
-	struct fixed31_32 avg_time_slots_per_mtp;
-	struct fixed31_32 pbn;
-	struct fixed31_32 pbn_per_slot;
-	int i;
-	enum act_return_status ret;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	/* enable_link_dp_mst already check link->enabled_stream_count
-	 * and stream is in link->stream[]. This is called during set mode,
-	 * stream_enc is available.
-	 */
-
-	/* get calculate VC payload for stream: stream_alloc */
-	if (dm_helpers_dp_mst_write_payload_allocation_table(
-		stream->ctx,
-		stream,
-		&proposed_table,
-		true))
-		update_mst_stream_alloc_table(
-					link,
-					pipe_ctx->stream_res.stream_enc,
-					pipe_ctx->stream_res.hpo_dp_stream_enc,
-					&proposed_table);
-	else
-		DC_LOG_WARNING("Failed to update"
-				"MST allocation table for"
-				"pipe idx:%d\n",
-				pipe_ctx->pipe_idx);
-
-	DC_LOG_MST("%s  "
-			"stream_count: %d: \n ",
-			__func__,
-			link->mst_stream_alloc_table.stream_count);
-
-	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-		DC_LOG_MST("stream_enc[%d]: %p      "
-		"stream[%d].hpo_dp_stream_enc: %p      "
-		"stream[%d].vcp_id: %d      "
-		"stream[%d].slot_count: %d\n",
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-	}
-
-	ASSERT(proposed_table.stream_count > 0);
-
-	/* program DP source TX for payload */
-	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
-		DC_LOG_ERROR("Failure: unknown encoding format\n");
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	link_hwss->ext.update_stream_allocation_table(link,
-			&pipe_ctx->link_res,
-			&link->mst_stream_alloc_table);
-
-	/* send down message */
-	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
-			stream->ctx,
-			stream);
-
-	if (ret != ACT_LINK_LOST) {
-		dm_helpers_dp_mst_send_payload_allocation(
-				stream->ctx,
-				stream,
-				true);
-	}
-
-	/* slot X.Y for only current stream */
-	pbn_per_slot = get_pbn_per_slot(stream);
-	if (pbn_per_slot.value == 0) {
-		DC_LOG_ERROR("Failure: pbn_per_slot==0 not allowed. Cannot continue, returning DC_UNSUPPORTED_VALUE.\n");
-		return DC_UNSUPPORTED_VALUE;
-	}
-	pbn = get_pbn_from_timing(pipe_ctx);
-	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
-
-	dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
-
-	if (link_hwss->ext.set_throttled_vcp_size)
-		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->ext.set_hblank_min_symbol_width)
-		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-				&link->cur_link_settings,
-				avg_time_slots_per_mtp);
-
-	return DC_OK;
-
-}
-
-enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct fixed31_32 avg_time_slots_per_mtp;
-	struct fixed31_32 pbn;
-	struct fixed31_32 pbn_per_slot;
-	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
-	uint8_t i;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	/* decrease throttled vcp size */
-	pbn_per_slot = get_pbn_per_slot(stream);
-	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
-	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
-
-	if (link_hwss->ext.set_throttled_vcp_size)
-		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->ext.set_hblank_min_symbol_width)
-		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-				&link->cur_link_settings,
-				avg_time_slots_per_mtp);
-
-	/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
-	dm_helpers_dp_mst_send_payload_allocation(
-			stream->ctx,
-			stream,
-			true);
-
-	/* notify immediate branch device table update */
-	if (dm_helpers_dp_mst_write_payload_allocation_table(
-			stream->ctx,
-			stream,
-			&proposed_table,
-			true)) {
-		/* update mst stream allocation table software state */
-		update_mst_stream_alloc_table(
-				link,
-				pipe_ctx->stream_res.stream_enc,
-				pipe_ctx->stream_res.hpo_dp_stream_enc,
-				&proposed_table);
-	} else {
-		DC_LOG_WARNING("Failed to update"
-				"MST allocation table for"
-				"pipe idx:%d\n",
-				pipe_ctx->pipe_idx);
-	}
-
-	DC_LOG_MST("%s  "
-			"stream_count: %d: \n ",
-			__func__,
-			link->mst_stream_alloc_table.stream_count);
-
-	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-		DC_LOG_MST("stream_enc[%d]: %p      "
-				"stream[%d].hpo_dp_stream_enc: %p      "
-				"stream[%d].vcp_id: %d      "
-				"stream[%d].slot_count: %d\n",
-				i,
-				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-				i,
-				(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
-				i,
-				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-				i,
-				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-	}
-
-	ASSERT(proposed_table.stream_count > 0);
-
-	/* update mst stream allocation table hardware state */
-	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
-		DC_LOG_ERROR("Failure: unknown encoding format\n");
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
-			&link->mst_stream_alloc_table);
-
-	/* poll for immediate branch device ACT handled */
-	dm_helpers_dp_mst_poll_for_allocation_change_trigger(
-			stream->ctx,
-			stream);
-
-	return DC_OK;
-}
-
-enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct fixed31_32 avg_time_slots_per_mtp;
-	struct fixed31_32 pbn;
-	struct fixed31_32 pbn_per_slot;
-	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
-	uint8_t i;
-	enum act_return_status ret;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	/* notify immediate branch device table update */
-	if (dm_helpers_dp_mst_write_payload_allocation_table(
-				stream->ctx,
-				stream,
-				&proposed_table,
-				true)) {
-		/* update mst stream allocation table software state */
-		update_mst_stream_alloc_table(
-				link,
-				pipe_ctx->stream_res.stream_enc,
-				pipe_ctx->stream_res.hpo_dp_stream_enc,
-				&proposed_table);
-	}
-
-	DC_LOG_MST("%s  "
-			"stream_count: %d: \n ",
-			__func__,
-			link->mst_stream_alloc_table.stream_count);
-
-	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-		DC_LOG_MST("stream_enc[%d]: %p      "
-				"stream[%d].hpo_dp_stream_enc: %p      "
-				"stream[%d].vcp_id: %d      "
-				"stream[%d].slot_count: %d\n",
-				i,
-				(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-				i,
-				(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
-				i,
-				link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-				i,
-				link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-	}
-
-	ASSERT(proposed_table.stream_count > 0);
-
-	/* update mst stream allocation table hardware state */
-	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
-		DC_LOG_ERROR("Failure: unknown encoding format\n");
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
-			&link->mst_stream_alloc_table);
-
-	/* poll for immediate branch device ACT handled */
-	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
-			stream->ctx,
-			stream);
-
-	if (ret != ACT_LINK_LOST) {
-		/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
-		dm_helpers_dp_mst_send_payload_allocation(
-				stream->ctx,
-				stream,
-				true);
-	}
-
-	/* increase throttled vcp size */
-	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
-	pbn_per_slot = get_pbn_per_slot(stream);
-	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
-
-	if (link_hwss->ext.set_throttled_vcp_size)
-		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->ext.set_hblank_min_symbol_width)
-		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-				&link->cur_link_settings,
-				avg_time_slots_per_mtp);
-
-	return DC_OK;
-}
-
-static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
-{
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->link;
-	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
-	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
-	int i;
-	bool mst_mode = (link->type == dc_connection_mst_branch);
-	/* adjust for drm changes*/
-	bool update_drm_mst_state = true;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-	const struct dc_link_settings empty_link_settings = {0};
-	DC_LOGGER_INIT(link->ctx->logger);
-
-
-	/* deallocate_mst_payload is called before disable link. When mode or
-	 * disable/enable monitor, new stream is created which is not in link
-	 * stream[] yet. For this, payload is not allocated yet, so de-alloc
-	 * should not done. For new mode set, map_resources will get engine
-	 * for new stream, so stream_enc->id should be validated until here.
-	 */
-
-	/* slot X.Y */
-	if (link_hwss->ext.set_throttled_vcp_size)
-		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-	if (link_hwss->ext.set_hblank_min_symbol_width)
-		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
-				&empty_link_settings,
-				avg_time_slots_per_mtp);
-
-	if (mst_mode || update_drm_mst_state) {
-		/* when link is in mst mode, reply on mst manager to remove
-		 * payload
-		 */
-		if (dm_helpers_dp_mst_write_payload_allocation_table(
-				stream->ctx,
-				stream,
-				&proposed_table,
-				false))
-
-			update_mst_stream_alloc_table(
-					link,
-					pipe_ctx->stream_res.stream_enc,
-					pipe_ctx->stream_res.hpo_dp_stream_enc,
-					&proposed_table);
-		else
-			DC_LOG_WARNING("Failed to update"
-					"MST allocation table for"
-					"pipe idx:%d\n",
-					pipe_ctx->pipe_idx);
-	} else {
-		/* when link is no longer in mst mode (mst hub unplugged),
-		 * remove payload with default dc logic
-		 */
-		remove_stream_from_alloc_table(link, pipe_ctx->stream_res.stream_enc,
-				pipe_ctx->stream_res.hpo_dp_stream_enc);
-	}
-
-	DC_LOG_MST("%s"
-			"stream_count: %d: ",
-			__func__,
-			link->mst_stream_alloc_table.stream_count);
-
-	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
-		DC_LOG_MST("stream_enc[%d]: %p      "
-		"stream[%d].hpo_dp_stream_enc: %p      "
-		"stream[%d].vcp_id: %d      "
-		"stream[%d].slot_count: %d\n",
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
-		i,
-		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
-		i,
-		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
-	}
-
-	/* update mst stream allocation table hardware state */
-	if (link_hwss->ext.update_stream_allocation_table == NULL ||
-			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
-		DC_LOG_DEBUG("Unknown encoding format\n");
-		return DC_ERROR_UNEXPECTED;
-	}
-
-	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
-			&link->mst_stream_alloc_table);
-
-	if (mst_mode) {
-		dm_helpers_dp_mst_poll_for_allocation_change_trigger(
-			stream->ctx,
-			stream);
-
-		if (!update_drm_mst_state)
-			dm_helpers_dp_mst_send_payload_allocation(
-				stream->ctx,
-				stream,
-				false);
-	}
-
-	if (update_drm_mst_state)
-		dm_helpers_dp_mst_send_payload_allocation(
-			stream->ctx,
-			stream,
-			false);
-
-	return DC_OK;
-}
-
-
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
-{
-	struct cp_psp *cp_psp = &pipe_ctx->stream->ctx->cp_psp;
-	struct link_encoder *link_enc = NULL;
-	struct cp_psp_stream_config config = {0};
-	enum dp_panel_mode panel_mode =
-			dp_get_panel_mode(pipe_ctx->stream->link);
-
-	if (cp_psp == NULL || cp_psp->funcs.update_stream_config == NULL)
-		return;
-
-	link_enc = link_enc_cfg_get_link_enc(pipe_ctx->stream->link);
-	ASSERT(link_enc);
-	if (link_enc == NULL)
-		return;
-
-	/* otg instance */
-	config.otg_inst = (uint8_t) pipe_ctx->stream_res.tg->inst;
-
-	/* dig front end */
-	config.dig_fe = (uint8_t) pipe_ctx->stream_res.stream_enc->stream_enc_inst;
-
-	/* stream encoder index */
-	config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
-		config.stream_enc_idx =
-				pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
-
-	/* dig back end */
-	config.dig_be = pipe_ctx->stream->link->link_enc_hw_inst;
-
-	/* link encoder index */
-	config.link_enc_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
-		config.link_enc_idx = pipe_ctx->link_res.hpo_dp_link_enc->inst;
-
-	/* dio output index is dpia index for DPIA endpoint & dcio index by default */
-	if (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-		config.dio_output_idx = pipe_ctx->stream->link->link_id.enum_id - ENUM_ID_1;
-	else
-		config.dio_output_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
-
-
-	/* phy index */
-	config.phy_idx = resource_transmitter_to_phy_idx(
-			pipe_ctx->stream->link->dc, link_enc->transmitter);
-	if (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
-		/* USB4 DPIA doesn't use PHY in our soc, initialize it to 0 */
-		config.phy_idx = 0;
-
-	/* stream properties */
-	config.assr_enabled = (panel_mode == DP_PANEL_MODE_EDP) ? 1 : 0;
-	config.mst_enabled = (pipe_ctx->stream->signal ==
-			SIGNAL_TYPE_DISPLAY_PORT_MST) ? 1 : 0;
-	config.dp2_enabled = link_is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
-	config.usb4_enabled = (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) ?
-			1 : 0;
-	config.dpms_off = dpms_off;
-
-	/* dm stream context */
-	config.dm_stream_ctx = pipe_ctx->stream->dm_stream_context;
-
-	cp_psp->funcs.update_stream_config(cp_psp->handle, &config);
-}
-#endif
-
-static void fpga_dp_hpo_enable_link_and_stream(struct dc_state *state, struct pipe_ctx *pipe_ctx)
-{
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct link_mst_stream_allocation_table proposed_table = {0};
-	struct fixed31_32 avg_time_slots_per_mtp;
-	uint8_t req_slot_count = 0;
-	uint8_t vc_id = 1; /// VC ID always 1 for SST
-	struct dc_link_settings link_settings = pipe_ctx->link_config.dp_link_settings;
-	const struct link_hwss *link_hwss = get_link_hwss(stream->link, &pipe_ctx->link_res);
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	stream->link->cur_link_settings = link_settings;
-
-	if (link_hwss->ext.enable_dp_link_output)
-		link_hwss->ext.enable_dp_link_output(stream->link, &pipe_ctx->link_res,
-				stream->signal, pipe_ctx->clock_source->id,
-				&link_settings);
-
-#ifdef DIAGS_BUILD
-	/* Workaround for FPGA HPO capture DP link data:
-	 * HPO capture will set link to active mode
-	 * This workaround is required to get a capture from start of frame
-	 */
-	if (!dc->debug.fpga_hpo_capture_en) {
-		struct encoder_set_dp_phy_pattern_param params = {0};
-		params.dp_phy_pattern = DP_TEST_PATTERN_VIDEO_MODE;
-
-		/* Set link active */
-		stream->link->hpo_dp_link_enc->funcs->set_link_test_pattern(
-				stream->link->hpo_dp_link_enc,
-				&params);
-	}
-#endif
-
-	/* Enable DP_STREAM_ENC */
-	dc->hwss.enable_stream(pipe_ctx);
-
-	/* Set DPS PPS SDP (AKA "info frames") */
-	if (pipe_ctx->stream->timing.flags.DSC) {
-		dp_set_dsc_pps_sdp(pipe_ctx, true, true);
-	}
-
-	/* Allocate Payload */
-	if ((stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) && (state->stream_count > 1)) {
-		// MST case
-		uint8_t i;
-
-		proposed_table.stream_count = state->stream_count;
-		for (i = 0; i < state->stream_count; i++) {
-			avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(state->streams[i], state->streams[i]->link);
-			req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
-			proposed_table.stream_allocations[i].slot_count = req_slot_count;
-			proposed_table.stream_allocations[i].vcp_id = i+1;
-			/* NOTE: This makes assumption that pipe_ctx index is same as stream index */
-			proposed_table.stream_allocations[i].hpo_dp_stream_enc = state->res_ctx.pipe_ctx[i].stream_res.hpo_dp_stream_enc;
-		}
-	} else {
-		// SST case
-		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, stream->link);
-		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
-		proposed_table.stream_count = 1; /// Always 1 stream for SST
-		proposed_table.stream_allocations[0].slot_count = req_slot_count;
-		proposed_table.stream_allocations[0].vcp_id = vc_id;
-		proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
-	}
-
-	link_hwss->ext.update_stream_allocation_table(stream->link,
-			&pipe_ctx->link_res,
-			&proposed_table);
-
-	if (link_hwss->ext.set_throttled_vcp_size)
-		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
-
-	dc->hwss.unblank_stream(pipe_ctx, &stream->link->cur_link_settings);
-	dc->hwss.enable_audio_stream(pipe_ctx);
-}
-
-void core_link_enable_stream(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx)
-{
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->sink->link;
-	enum dc_status status;
-	struct link_encoder *link_enc;
-	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
-	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
-	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
-
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
-		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
-
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	if (pipe_ctx->stream->sink) {
-		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
-			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
-			DC_LOG_DC("%s pipe_ctx dispname=%s signal=%x\n", __func__,
-			pipe_ctx->stream->sink->edid_caps.display_name,
-			pipe_ctx->stream->signal);
-		}
-	}
-
-	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
-			dc_is_virtual_signal(pipe_ctx->stream->signal))
-		return;
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
-			&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
-		if (link_enc)
-			link_enc->funcs->setup(
-				link_enc,
-				pipe_ctx->stream->signal);
-	}
-
-	pipe_ctx->stream->link->link_state_valid = true;
-
-	if (pipe_ctx->stream_res.tg->funcs->set_out_mux) {
-		if (link_is_dp_128b_132b_signal(pipe_ctx))
-			otg_out_dest = OUT_MUX_HPO_DP;
-		else
-			otg_out_dest = OUT_MUX_DIO;
-		pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, otg_out_dest);
-	}
-
-	link_hwss->setup_stream_attribute(pipe_ctx);
-
-	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
-		bool apply_edp_fast_boot_optimization =
-			pipe_ctx->stream->apply_edp_fast_boot_optimization;
-
-		pipe_ctx->stream->apply_edp_fast_boot_optimization = false;
-
-		// Enable VPG before building infoframe
-		if (vpg && vpg->funcs->vpg_poweron)
-			vpg->funcs->vpg_poweron(vpg);
-
-		resource_build_info_frame(pipe_ctx);
-		dc->hwss.update_info_frame(pipe_ctx);
-
-		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-			dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
-
-		/* Do not touch link on seamless boot optimization. */
-		if (pipe_ctx->stream->apply_seamless_boot_optimization) {
-			pipe_ctx->stream->dpms_off = false;
-
-			/* Still enable stream features & audio on seamless boot for DP external displays */
-			if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT) {
-				enable_stream_features(pipe_ctx);
-				dc->hwss.enable_audio_stream(pipe_ctx);
-			}
-
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-			update_psp_stream_config(pipe_ctx, false);
-#endif
-			return;
-		}
-
-		/* eDP lit up by bios already, no need to enable again. */
-		if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP &&
-					apply_edp_fast_boot_optimization &&
-					!pipe_ctx->stream->timing.flags.DSC &&
-					!pipe_ctx->next_odm_pipe) {
-			pipe_ctx->stream->dpms_off = false;
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-			update_psp_stream_config(pipe_ctx, false);
-#endif
-			return;
-		}
-
-		if (pipe_ctx->stream->dpms_off)
-			return;
-
-		/* Have to setup DSC before DIG FE and BE are connected (which happens before the
-		 * link training). This is to make sure the bandwidth sent to DIG BE won't be
-		 * bigger than what the link and/or DIG BE can handle. VBID[6]/CompressedStream_flag
-		 * will be automatically set at a later time when the video is enabled
-		 * (DP_VID_STREAM_EN = 1).
-		 */
-		if (pipe_ctx->stream->timing.flags.DSC) {
-			if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
-				dc_is_virtual_signal(pipe_ctx->stream->signal))
-			dp_set_dsc_enable(pipe_ctx, true);
-
-		}
-
-		status = enable_link(state, pipe_ctx);
-
-		if (status != DC_OK) {
-			DC_LOG_WARNING("enabling link %u failed: %d\n",
-			pipe_ctx->stream->link->link_index,
-			status);
-
-			/* Abort stream enable *unless* the failure was due to
-			 * DP link training - some DP monitors will recover and
-			 * show the stream anyway. But MST displays can't proceed
-			 * without link training.
-			 */
-			if (status != DC_FAIL_DP_LINK_TRAINING ||
-					pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-				if (false == stream->link->link_status.link_active)
-					disable_link(stream->link, &pipe_ctx->link_res,
-							pipe_ctx->stream->signal);
-				BREAK_TO_DEBUGGER();
-				return;
-			}
-		}
-
-		/* turn off otg test pattern if enable */
-		if (pipe_ctx->stream_res.tg->funcs->set_test_pattern)
-			pipe_ctx->stream_res.tg->funcs->set_test_pattern(pipe_ctx->stream_res.tg,
-					CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,
-					COLOR_DEPTH_UNDEFINED);
-
-		/* This second call is needed to reconfigure the DIG
-		 * as a workaround for the incorrect value being applied
-		 * from transmitter control.
-		 */
-		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
-				link_is_dp_128b_132b_signal(pipe_ctx)))
-			if (link_enc)
-				link_enc->funcs->setup(
-					link_enc,
-					pipe_ctx->stream->signal);
-
-		dc->hwss.enable_stream(pipe_ctx);
-
-		/* Set DPS PPS SDP (AKA "info frames") */
-		if (pipe_ctx->stream->timing.flags.DSC) {
-			if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
-					dc_is_virtual_signal(pipe_ctx->stream->signal)) {
-				dp_set_dsc_on_rx(pipe_ctx, true);
-				dp_set_dsc_pps_sdp(pipe_ctx, true, true);
-			}
-		}
-
-		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
-			dc_link_allocate_mst_payload(pipe_ctx);
-		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-				link_is_dp_128b_132b_signal(pipe_ctx))
-			dc_link_update_sst_payload(pipe_ctx, true);
-
-		dc->hwss.unblank_stream(pipe_ctx,
-			&pipe_ctx->stream->link->cur_link_settings);
-
-		if (stream->sink_patches.delay_ignore_msa > 0)
-			msleep(stream->sink_patches.delay_ignore_msa);
-
-		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-			enable_stream_features(pipe_ctx);
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-		update_psp_stream_config(pipe_ctx, false);
-#endif
-
-		dc->hwss.enable_audio_stream(pipe_ctx);
-
-	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-		if (link_is_dp_128b_132b_signal(pipe_ctx))
-			fpga_dp_hpo_enable_link_and_stream(state, pipe_ctx);
-		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
-				dc_is_virtual_signal(pipe_ctx->stream->signal))
-			dp_set_dsc_enable(pipe_ctx, true);
-	}
-
-	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
-		core_link_set_avmute(pipe_ctx, false);
-	}
-}
-
-void core_link_disable_stream(struct pipe_ctx *pipe_ctx)
-{
-	struct dc  *dc = pipe_ctx->stream->ctx->dc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct dc_link *link = stream->sink->link;
-	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
-
-	if (link_is_dp_128b_132b_signal(pipe_ctx))
-		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
-
-	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
-
-	if (pipe_ctx->stream->sink) {
-		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
-			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
-			DC_LOG_DC("%s pipe_ctx dispname=%s signal=%x\n", __func__,
-			pipe_ctx->stream->sink->edid_caps.display_name,
-			pipe_ctx->stream->signal);
-		}
-	}
-
-	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
-			dc_is_virtual_signal(pipe_ctx->stream->signal))
-		return;
-
-	if (!pipe_ctx->stream->sink->edid_caps.panel_patch.skip_avmute) {
-		if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
-			core_link_set_avmute(pipe_ctx, true);
-	}
-
-	dc->hwss.disable_audio_stream(pipe_ctx);
-
-#if defined(CONFIG_DRM_AMD_DC_HDCP)
-	update_psp_stream_config(pipe_ctx, true);
-#endif
-	dc->hwss.blank_stream(pipe_ctx);
-
-	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
-		deallocate_mst_payload(pipe_ctx);
-	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			link_is_dp_128b_132b_signal(pipe_ctx))
-		dc_link_update_sst_payload(pipe_ctx, false);
-
-	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
-		struct ext_hdmi_settings settings = {0};
-		enum engine_id eng_id = pipe_ctx->stream_res.stream_enc->id;
-
-		unsigned short masked_chip_caps = link->chip_caps &
-				EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK;
-		//Need to inform that sink is going to use legacy HDMI mode.
-		write_scdc_data(
-			link->ddc,
-			165000,//vbios only handles 165Mhz.
-			false);
-		if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_TISN65DP159RSBT) {
-			/* DP159, Retimer settings */
-			if (get_ext_hdmi_settings(pipe_ctx, eng_id, &settings))
-				write_i2c_retimer_setting(pipe_ctx,
-						false, false, &settings);
-			else
-				write_i2c_default_retimer_setting(pipe_ctx,
-						false, false);
-		} else if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_PI3EQX1204) {
-			/* PI3EQX1204, Redriver settings */
-			write_i2c_redriver_setting(pipe_ctx, false);
-		}
-	}
-
-	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
-			!link_is_dp_128b_132b_signal(pipe_ctx)) {
-
-		/* In DP1.x SST mode, our encoder will go to TPS1
-		 * when link is on but stream is off.
-		 * Disabling link before stream will avoid exposing TPS1 pattern
-		 * during the disable sequence as it will confuse some receivers
-		 * state machine.
-		 * In DP2 or MST mode, our encoder will stay video active
-		 */
-		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
-		dc->hwss.disable_stream(pipe_ctx);
-	} else {
-		dc->hwss.disable_stream(pipe_ctx);
-		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
-	}
-
-	if (pipe_ctx->stream->timing.flags.DSC) {
-		if (dc_is_dp_signal(pipe_ctx->stream->signal))
-			dp_set_dsc_enable(pipe_ctx, false);
-	}
-	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
-		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
-			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
-	}
-
-	if (vpg && vpg->funcs->vpg_powerdown)
-		vpg->funcs->vpg_powerdown(vpg);
-}
-
-void core_link_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
-{
-	struct dc  *dc = pipe_ctx->stream->ctx->dc;
-
-	if (!dc_is_hdmi_signal(pipe_ctx->stream->signal))
-		return;
-
-	dc->hwss.set_avmute(pipe_ctx, enable);
-}
-
-uint32_t dc_link_bandwidth_kbps(
-	const struct dc_link *link,
-	const struct dc_link_settings *link_setting)
-{
-	uint32_t total_data_bw_efficiency_x10000 = 0;
-	uint32_t link_rate_per_lane_kbps = 0;
-
-	switch (link_dp_get_encoding_format(link_setting)) {
-	case DP_8b_10b_ENCODING:
-		/* For 8b/10b encoding:
-		 * link rate is defined in the unit of LINK_RATE_REF_FREQ_IN_KHZ per DP byte per lane.
-		 * data bandwidth efficiency is 80% with additional 3% overhead if FEC is supported.
-		 */
-		link_rate_per_lane_kbps = link_setting->link_rate * LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
-		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_8b_10b_x10000;
-		if (dc_link_should_enable_fec(link)) {
-			total_data_bw_efficiency_x10000 /= 100;
-			total_data_bw_efficiency_x10000 *= DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
-		}
-		break;
-	case DP_128b_132b_ENCODING:
-		/* For 128b/132b encoding:
-		 * link rate is defined in the unit of 10mbps per lane.
-		 * total data bandwidth efficiency is always 96.71%.
-		 */
-		link_rate_per_lane_kbps = link_setting->link_rate * 10000;
-		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_128b_132b_x10000;
-		break;
-	default:
-		break;
-	}
-
-	/* overall effective link bandwidth = link rate per lane * lane count * total data bandwidth efficiency */
-	return link_rate_per_lane_kbps * link_setting->lane_count / 10000 * total_data_bw_efficiency_x10000;
-}
-
-uint32_t dc_bandwidth_in_kbps_from_timing(
-		const struct dc_crtc_timing *timing)
-{
-	uint32_t bits_per_channel = 0;
-	uint32_t kbps;
-
-#if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (timing->flags.DSC)
-		return dc_dsc_stream_bandwidth_in_kbps(timing,
-				timing->dsc_cfg.bits_per_pixel,
-				timing->dsc_cfg.num_slices_h,
-				timing->dsc_cfg.is_dp);
-#endif /* CONFIG_DRM_AMD_DC_DCN */
-
-	switch (timing->display_color_depth) {
-	case COLOR_DEPTH_666:
-		bits_per_channel = 6;
-		break;
-	case COLOR_DEPTH_888:
-		bits_per_channel = 8;
-		break;
-	case COLOR_DEPTH_101010:
-		bits_per_channel = 10;
-		break;
-	case COLOR_DEPTH_121212:
-		bits_per_channel = 12;
-		break;
-	case COLOR_DEPTH_141414:
-		bits_per_channel = 14;
-		break;
-	case COLOR_DEPTH_161616:
-		bits_per_channel = 16;
-		break;
-	default:
-		ASSERT(bits_per_channel != 0);
-		bits_per_channel = 8;
-		break;
-	}
-
-	kbps = timing->pix_clk_100hz / 10;
-	kbps *= bits_per_channel;
-
-	if (timing->flags.Y_ONLY != 1) {
-		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
-		kbps *= 3;
-		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
-			kbps /= 2;
-		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
-			kbps = kbps * 2 / 3;
-	}
-
-	return kbps;
-
-}
-
-void dc_link_get_cur_link_res(const struct dc_link *link,
-		struct link_resource *link_res)
-{
-	int i;
-	struct pipe_ctx *pipe = NULL;
-
-	memset(link_res, 0, sizeof(*link_res));
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		pipe = &link->dc->current_state->res_ctx.pipe_ctx[i];
-		if (pipe->stream && pipe->stream->link && pipe->top_pipe == NULL) {
-			if (pipe->stream->link == link) {
-				*link_res = pipe->link_res;
-				break;
-			}
-		}
-	}
-
-}
-
-/**
- * dc_get_cur_link_res_map() - take a snapshot of current link resource allocation state
- * @dc: pointer to dc of the dm calling this
- * @map: a dc link resource snapshot defined internally to dc.
- *
- * DM needs to capture a snapshot of current link resource allocation mapping
- * and store it in its persistent storage.
- *
- * Some of the link resource is using first come first serve policy.
- * The allocation mapping depends on original hotplug order. This information
- * is lost after driver is loaded next time. The snapshot is used in order to
- * restore link resource to its previous state so user will get consistent
- * link capability allocation across reboot.
- *
- * Return: none (void function)
- *
- */
-void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
-{
-	struct dc_link *link;
-	uint32_t i;
-	uint32_t hpo_dp_recycle_map = 0;
-
-	*map = 0;
-
-	if (dc->caps.dp_hpo) {
-		for (i = 0; i < dc->caps.max_links; i++) {
-			link = dc->links[i];
-			if (link->link_status.link_active &&
-					link_dp_get_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING &&
-					link_dp_get_encoding_format(&link->cur_link_settings) != DP_128b_132b_ENCODING)
-				/* hpo dp link encoder is considered as recycled, when RX reports 128b/132b encoding capability
-				 * but current link doesn't use it.
-				 */
-				hpo_dp_recycle_map |= (1 << i);
-		}
-		*map |= (hpo_dp_recycle_map << LINK_RES_HPO_DP_REC_MAP__SHIFT);
-	}
-}
-
-/**
- * dc_restore_link_res_map() - restore link resource allocation state from a snapshot
- * @dc: pointer to dc of the dm calling this
- * @map: a dc link resource snapshot defined internally to dc.
- *
- * DM needs to call this function after initial link detection on boot and
- * before first commit streams to restore link resource allocation state
- * from previous boot session.
- *
- * Some of the link resource is using first come first serve policy.
- * The allocation mapping depends on original hotplug order. This information
- * is lost after driver is loaded next time. The snapshot is used in order to
- * restore link resource to its previous state so user will get consistent
- * link capability allocation across reboot.
- *
- * Return: none (void function)
- *
- */
-void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
-{
-	struct dc_link *link;
-	uint32_t i;
-	unsigned int available_hpo_dp_count;
-	uint32_t hpo_dp_recycle_map = (*map & LINK_RES_HPO_DP_REC_MAP__MASK)
-			>> LINK_RES_HPO_DP_REC_MAP__SHIFT;
-
-	if (dc->caps.dp_hpo) {
-		available_hpo_dp_count = dc->res_pool->hpo_dp_link_enc_count;
-		/* remove excess 128b/132b encoding support for not recycled links */
-		for (i = 0; i < dc->caps.max_links; i++) {
-			if ((hpo_dp_recycle_map & (1 << i)) == 0) {
-				link = dc->links[i];
-				if (link->type != dc_connection_none &&
-						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
-					if (available_hpo_dp_count > 0)
-						available_hpo_dp_count--;
-					else
-						/* remove 128b/132b encoding capability by limiting verified link rate to HBR3 */
-						link->verified_link_cap.link_rate = LINK_RATE_HIGH3;
-				}
-			}
-		}
-		/* remove excess 128b/132b encoding support for recycled links */
-		for (i = 0; i < dc->caps.max_links; i++) {
-			if ((hpo_dp_recycle_map & (1 << i)) != 0) {
-				link = dc->links[i];
-				if (link->type != dc_connection_none &&
-						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
-					if (available_hpo_dp_count > 0)
-						available_hpo_dp_count--;
-					else
-						/* remove 128b/132b encoding capability by limiting verified link rate to HBR3 */
-						link->verified_link_cap.link_rate = LINK_RATE_HIGH3;
-				}
-			}
-		}
-	}
-}
-
-bool dp_validate_mode_timing(
-	struct dc_link *link,
-	const struct dc_crtc_timing *timing)
-{
-	uint32_t req_bw;
-	uint32_t max_bw;
-
-	const struct dc_link_settings *link_setting;
-
-	/* According to spec, VSC SDP should be used if pixel format is YCbCr420 */
-	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420 &&
-			!link->dpcd_caps.dprx_feature.bits.VSC_SDP_COLORIMETRY_SUPPORTED &&
-			dal_graphics_object_id_get_connector_id(link->link_id) != CONNECTOR_ID_VIRTUAL)
-		return false;
-
-	/*always DP fail safe mode*/
-	if ((timing->pix_clk_100hz / 10) == (uint32_t) 25175 &&
-		timing->h_addressable == (uint32_t) 640 &&
-		timing->v_addressable == (uint32_t) 480)
-		return true;
-
-	link_setting = dc_link_get_link_cap(link);
-
-	/* TODO: DYNAMIC_VALIDATION needs to be implemented */
-	/*if (flags.DYNAMIC_VALIDATION == 1 &&
-		link->verified_link_cap.lane_count != LANE_COUNT_UNKNOWN)
-		link_setting = &link->verified_link_cap;
-	*/
-
-	req_bw = dc_bandwidth_in_kbps_from_timing(timing);
-	max_bw = dc_link_bandwidth_kbps(link, link_setting);
-
-	if (req_bw <= max_bw) {
-		/* remember the biggest mode here, during
-		 * initial link training (to get
-		 * verified_link_cap), LS sends event about
-		 * cannot train at reported cap to upper
-		 * layer and upper layer will re-enumerate modes.
-		 * this is not necessary if the lower
-		 * verified_link_cap is enough to drive
-		 * all the modes */
-
-		/* TODO: DYNAMIC_VALIDATION needs to be implemented */
-		/* if (flags.DYNAMIC_VALIDATION == 1)
-			dpsst->max_req_bw_for_verified_linkcap = dal_max(
-				dpsst->max_req_bw_for_verified_linkcap, req_bw); */
-		return true;
-	} else
-		return false;
-}
-
-void dp_enable_mst_on_sink(struct dc_link *link, bool enable)
-{
-	unsigned char mstmCntl;
-
-	core_link_read_dpcd(link, DP_MSTM_CTRL, &mstmCntl, 1);
-	if (enable)
-		mstmCntl |= DP_MST_EN;
-	else
-		mstmCntl &= (~DP_MST_EN);
-
-	core_link_write_dpcd(link, DP_MSTM_CTRL, &mstmCntl, 1);
-}
-
-enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready)
-{
-	/* FEC has to be "set ready" before the link training.
-	 * The policy is to always train with FEC
-	 * if the sink supports it and leave it enabled on link.
-	 * If FEC is not supported, disable it.
-	 */
-	struct link_encoder *link_enc = NULL;
-	enum dc_status status = DC_OK;
-	uint8_t fec_config = 0;
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	if (!dc_link_should_enable_fec(link))
-		return status;
-
-	if (link_enc->funcs->fec_set_ready &&
-			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE) {
-		if (ready) {
-			fec_config = 1;
-			status = core_link_write_dpcd(link,
-					DP_FEC_CONFIGURATION,
-					&fec_config,
-					sizeof(fec_config));
-			if (status == DC_OK) {
-				link_enc->funcs->fec_set_ready(link_enc, true);
-				link->fec_state = dc_link_fec_ready;
-			} else {
-				link_enc->funcs->fec_set_ready(link_enc, false);
-				link->fec_state = dc_link_fec_not_ready;
-				dm_error("dpcd write failed to set fec_ready");
-			}
-		} else if (link->fec_state == dc_link_fec_ready) {
-			fec_config = 0;
-			status = core_link_write_dpcd(link,
-					DP_FEC_CONFIGURATION,
-					&fec_config,
-					sizeof(fec_config));
-			link_enc->funcs->fec_set_ready(link_enc, false);
-			link->fec_state = dc_link_fec_not_ready;
-		}
-	}
-
-	return status;
-}
-
-void dp_set_fec_enable(struct dc_link *link, bool enable)
-{
-	struct link_encoder *link_enc = NULL;
-
-	link_enc = link_enc_cfg_get_link_enc(link);
-	ASSERT(link_enc);
-
-	if (!dc_link_should_enable_fec(link))
-		return;
-
-	if (link_enc->funcs->fec_set_enable &&
-			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE) {
-		if (link->fec_state == dc_link_fec_ready && enable) {
-			/* Accord to DP spec, FEC enable sequence can first
-			 * be transmitted anytime after 1000 LL codes have
-			 * been transmitted on the link after link training
-			 * completion. Using 1 lane RBR should have the maximum
-			 * time for transmitting 1000 LL codes which is 6.173 us.
-			 * So use 7 microseconds delay instead.
-			 */
-			udelay(7);
-			link_enc->funcs->fec_set_enable(link_enc, true);
-			link->fec_state = dc_link_fec_enabled;
-		} else if (link->fec_state == dc_link_fec_enabled && !enable) {
-			link_enc->funcs->fec_set_enable(link_enc, false);
-			link->fec_state = dc_link_fec_ready;
-		}
-	}
-}
-
-// TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
-static void get_lane_status(
-	struct dc_link *link,
-	uint32_t lane_count,
-	union lane_status *status,
-	union lane_align_status_updated *status_updated)
-{
-	unsigned int lane;
-	uint8_t dpcd_buf[3] = {0};
-
-	if (status == NULL || status_updated == NULL) {
-		return;
-	}
-
-	core_link_read_dpcd(
-			link,
-			DP_LANE0_1_STATUS,
-			dpcd_buf,
-			sizeof(dpcd_buf));
-
-	for (lane = 0; lane < lane_count; lane++) {
-		status[lane].raw = dp_get_nibble_at_index(&dpcd_buf[0], lane);
-	}
-
-	status_updated->raw = dpcd_buf[2];
-}
-
-bool dpcd_write_128b_132b_sst_payload_allocation_table(
-		const struct dc_stream_state *stream,
-		struct dc_link *link,
-		struct link_mst_stream_allocation_table *proposed_table,
-		bool allocate)
-{
-	const uint8_t vc_id = 1; /// VC ID always 1 for SST
-	const uint8_t start_time_slot = 0; /// Always start at time slot 0 for SST
-	bool result = false;
-	uint8_t req_slot_count = 0;
-	struct fixed31_32 avg_time_slots_per_mtp = { 0 };
-	union payload_table_update_status update_status = { 0 };
-	const uint32_t max_retries = 30;
-	uint32_t retries = 0;
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	if (allocate)	{
-		avg_time_slots_per_mtp = calculate_sst_avg_time_slots_per_mtp(stream, link);
-		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
-		/// Validation should filter out modes that exceed link BW
-		ASSERT(req_slot_count <= MAX_MTP_SLOT_COUNT);
-		if (req_slot_count > MAX_MTP_SLOT_COUNT)
-			return false;
-	} else {
-		/// Leave req_slot_count = 0 if allocate is false.
-	}
-
-	proposed_table->stream_count = 1; /// Always 1 stream for SST
-	proposed_table->stream_allocations[0].slot_count = req_slot_count;
-	proposed_table->stream_allocations[0].vcp_id = vc_id;
-
-	if (link->aux_access_disabled)
-		return true;
-
-	/// Write DPCD 2C0 = 1 to start updating
-	update_status.bits.VC_PAYLOAD_TABLE_UPDATED = 1;
-	core_link_write_dpcd(
-			link,
-			DP_PAYLOAD_TABLE_UPDATE_STATUS,
-			&update_status.raw,
-			1);
-
-	/// Program the changes in DPCD 1C0 - 1C2
-	ASSERT(vc_id == 1);
-	core_link_write_dpcd(
-			link,
-			DP_PAYLOAD_ALLOCATE_SET,
-			&vc_id,
-			1);
-
-	ASSERT(start_time_slot == 0);
-	core_link_write_dpcd(
-			link,
-			DP_PAYLOAD_ALLOCATE_START_TIME_SLOT,
-			&start_time_slot,
-			1);
-
-	core_link_write_dpcd(
-			link,
-			DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT,
-			&req_slot_count,
-			1);
-
-	/// Poll till DPCD 2C0 read 1
-	/// Try for at least 150ms (30 retries, with 5ms delay after each attempt)
-
-	while (retries < max_retries) {
-		if (core_link_read_dpcd(
-				link,
-				DP_PAYLOAD_TABLE_UPDATE_STATUS,
-				&update_status.raw,
-				1) == DC_OK) {
-			if (update_status.bits.VC_PAYLOAD_TABLE_UPDATED == 1) {
-				DC_LOG_DP2("SST Update Payload: downstream payload table updated.");
-				result = true;
-				break;
-			}
-		} else {
-			union dpcd_rev dpcdRev;
-
-			if (core_link_read_dpcd(
-					link,
-					DP_DPCD_REV,
-					&dpcdRev.raw,
-					1) != DC_OK) {
-				DC_LOG_ERROR("SST Update Payload: Unable to read DPCD revision "
-						"of sink while polling payload table "
-						"updated status bit.");
-				break;
-			}
-		}
-		retries++;
-		msleep(5);
-	}
-
-	if (!result && retries == max_retries) {
-		DC_LOG_ERROR("SST Update Payload: Payload table not updated after retries, "
-				"continue on. Something is wrong with the branch.");
-		// TODO - DP2.0 Payload: Read and log the payload table from downstream branch
-	}
-
-	return result;
-}
-
-bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link)
-{
-	/*
-	 * wait for ACT handled
-	 */
-	int i;
-	const int act_retries = 30;
-	enum act_return_status result = ACT_FAILED;
-	union payload_table_update_status update_status = {0};
-	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
-	union lane_align_status_updated lane_status_updated;
-	DC_LOGGER_INIT(link->ctx->logger);
-
-	if (link->aux_access_disabled)
-		return true;
-	for (i = 0; i < act_retries; i++) {
-		get_lane_status(link, link->cur_link_settings.lane_count, dpcd_lane_status, &lane_status_updated);
-
-		if (!dp_is_cr_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
-				!dp_is_ch_eq_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
-				!dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status) ||
-				!dp_is_interlane_aligned(lane_status_updated)) {
-			DC_LOG_ERROR("SST Update Payload: Link loss occurred while "
-					"polling for ACT handled.");
-			result = ACT_LINK_LOST;
-			break;
-		}
-		core_link_read_dpcd(
-				link,
-				DP_PAYLOAD_TABLE_UPDATE_STATUS,
-				&update_status.raw,
-				1);
-
-		if (update_status.bits.ACT_HANDLED == 1) {
-			DC_LOG_DP2("SST Update Payload: ACT handled by downstream.");
-			result = ACT_SUCCESS;
-			break;
-		}
-
-		msleep(5);
-	}
-
-	if (result == ACT_FAILED) {
-		DC_LOG_ERROR("SST Update Payload: ACT still not handled after retries, "
-				"continue on. Something is wrong with the branch.");
-	}
-
-	return (result == ACT_SUCCESS);
-}
-
-struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
-		const struct dc_stream_state *stream,
-		const struct dc_link *link)
-{
-	struct fixed31_32 link_bw_effective =
-			dc_fixpt_from_int(
-					dc_link_bandwidth_kbps(link, &link->cur_link_settings));
-	struct fixed31_32 timeslot_bw_effective =
-			dc_fixpt_div_int(link_bw_effective, MAX_MTP_SLOT_COUNT);
-	struct fixed31_32 timing_bw =
-			dc_fixpt_from_int(
-					dc_bandwidth_in_kbps_from_timing(&stream->timing));
-	struct fixed31_32 avg_time_slots_per_mtp =
-			dc_fixpt_div(timing_bw, timeslot_bw_effective);
-
-	return avg_time_slots_per_mtp;
-}
-
-void dc_link_clear_dprx_states(struct dc_link *link)
-{
-	memset(&link->dprx_states, 0, sizeof(link->dprx_states));
-}
-
-void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
-{
-	if (link != NULL && link->dc->debug.enable_driver_sequence_debug)
-		core_link_write_dpcd(link, DP_SOURCE_SEQUENCE,
-					&dp_test_mode, sizeof(dp_test_mode));
-}
-
-static void dsc_optc_config_log(struct display_stream_compressor *dsc,
-		struct dsc_optc_config *config)
-{
-	uint32_t precision = 1 << 28;
-	uint32_t bytes_per_pixel_int = config->bytes_per_pixel / precision;
-	uint32_t bytes_per_pixel_mod = config->bytes_per_pixel % precision;
-	uint64_t ll_bytes_per_pix_fraq = bytes_per_pixel_mod;
-	DC_LOGGER_INIT(dsc->ctx->logger);
-
-	/* 7 fractional digits decimal precision for bytes per pixel is enough because DSC
-	 * bits per pixel precision is 1/16th of a pixel, which means bytes per pixel precision is
-	 * 1/16/8 = 1/128 of a byte, or 0.0078125 decimal
-	 */
-	ll_bytes_per_pix_fraq *= 10000000;
-	ll_bytes_per_pix_fraq /= precision;
-
-	DC_LOG_DSC("\tbytes_per_pixel 0x%08x (%d.%07d)",
-			config->bytes_per_pixel, bytes_per_pixel_int, (uint32_t)ll_bytes_per_pix_fraq);
-	DC_LOG_DSC("\tis_pixel_format_444 %d", config->is_pixel_format_444);
-	DC_LOG_DSC("\tslice_width %d", config->slice_width);
-}
-
-bool dp_set_dsc_on_rx(struct pipe_ctx *pipe_ctx, bool enable)
-{
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	bool result = false;
-
-	if (dc_is_virtual_signal(stream->signal) || IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
-		result = true;
-	else
-		result = dm_helpers_dp_write_dsc_enable(dc->ctx, stream, enable);
-	return result;
-}
-
-/* The stream with these settings can be sent (unblanked) only after DSC was enabled on RX first,
- * i.e. after dp_enable_dsc_on_rx() had been called
- */
-void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
-{
-	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
-	struct dc *dc = pipe_ctx->stream->ctx->dc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	struct pipe_ctx *odm_pipe;
-	int opp_cnt = 1;
-	DC_LOGGER_INIT(dsc->ctx->logger);
-
-	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
-		opp_cnt++;
-
-	if (enable) {
-		struct dsc_config dsc_cfg;
-		struct dsc_optc_config dsc_optc_cfg;
-		enum optc_dsc_mode optc_dsc_mode;
-
-		/* Enable DSC hw block */
-		dsc_cfg.pic_width = (stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right) / opp_cnt;
-		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
-		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
-		dsc_cfg.color_depth = stream->timing.display_color_depth;
-		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
-		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
-		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
-
-		dsc->funcs->dsc_set_config(dsc, &dsc_cfg, &dsc_optc_cfg);
-		dsc->funcs->dsc_enable(dsc, pipe_ctx->stream_res.opp->inst);
-		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
-			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
-
-			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
-			odm_dsc->funcs->dsc_enable(odm_dsc, odm_pipe->stream_res.opp->inst);
-		}
-		dsc_cfg.dc_dsc_cfg.num_slices_h *= opp_cnt;
-		dsc_cfg.pic_width *= opp_cnt;
-
-		optc_dsc_mode = dsc_optc_cfg.is_pixel_format_444 ? OPTC_DSC_ENABLED_444 : OPTC_DSC_ENABLED_NATIVE_SUBSAMPLED;
-
-		/* Enable DSC in encoder */
-		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
-				&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
-			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
-			dsc_optc_config_log(dsc, &dsc_optc_cfg);
-			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
-									optc_dsc_mode,
-									dsc_optc_cfg.bytes_per_pixel,
-									dsc_optc_cfg.slice_width);
-
-			/* PPS SDP is set elsewhere because it has to be done after DIG FE is connected to DIG BE */
-		}
-
-		/* Enable DSC in OPTC */
-		DC_LOG_DSC("Setting optc DSC config for tg instance %d:", pipe_ctx->stream_res.tg->inst);
-		dsc_optc_config_log(dsc, &dsc_optc_cfg);
-		pipe_ctx->stream_res.tg->funcs->set_dsc_config(pipe_ctx->stream_res.tg,
-							optc_dsc_mode,
-							dsc_optc_cfg.bytes_per_pixel,
-							dsc_optc_cfg.slice_width);
-	} else {
-		/* disable DSC in OPTC */
-		pipe_ctx->stream_res.tg->funcs->set_dsc_config(
-				pipe_ctx->stream_res.tg,
-				OPTC_DSC_DISABLED, 0, 0);
-
-		/* disable DSC in stream encoder */
-		if (dc_is_dp_signal(stream->signal)) {
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
-				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
-										pipe_ctx->stream_res.hpo_dp_stream_enc,
-										false,
-										NULL,
-										true);
-			else if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
-				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(
-						pipe_ctx->stream_res.stream_enc,
-						OPTC_DSC_DISABLED, 0, 0);
-				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
-							pipe_ctx->stream_res.stream_enc, false, NULL, true);
-			}
-		}
-
-		/* disable DSC block */
-		pipe_ctx->stream_res.dsc->funcs->dsc_disable(pipe_ctx->stream_res.dsc);
-		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
-			odm_pipe->stream_res.dsc->funcs->dsc_disable(odm_pipe->stream_res.dsc);
-	}
-}
-
-bool dp_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable)
-{
-	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
-	bool result = false;
-
-	if (!pipe_ctx->stream->timing.flags.DSC)
-		goto out;
-	if (!dsc)
-		goto out;
-
-	if (enable) {
-		{
-			dp_set_dsc_on_stream(pipe_ctx, true);
-			result = true;
-		}
-	} else {
-		dp_set_dsc_on_rx(pipe_ctx, false);
-		dp_set_dsc_on_stream(pipe_ctx, false);
-		result = true;
-	}
-out:
-	return result;
-}
-
-/*
- * For dynamic bpp change case, dsc is programmed with MASTER_UPDATE_LOCK enabled;
- * hence PPS info packet update need to use frame update instead of immediate update.
- * Added parameter immediate_update for this purpose.
- * The decision to use frame update is hard-coded in function dp_update_dsc_config(),
- * which is the only place where a "false" would be passed in for param immediate_update.
- *
- * immediate_update is only applicable when DSC is enabled.
- */
-bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_update)
-{
-	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
-	struct dc_stream_state *stream = pipe_ctx->stream;
-	DC_LOGGER_INIT(dsc->ctx->logger);
-
-	if (!pipe_ctx->stream->timing.flags.DSC || !dsc)
-		return false;
-
-	if (enable) {
-		struct dsc_config dsc_cfg;
-		uint8_t dsc_packed_pps[128];
-
-		memset(&dsc_cfg, 0, sizeof(dsc_cfg));
-		memset(dsc_packed_pps, 0, 128);
-
-		/* Enable DSC hw block */
-		dsc_cfg.pic_width = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
-		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
-		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
-		dsc_cfg.color_depth = stream->timing.display_color_depth;
-		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
-		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
-
-		dsc->funcs->dsc_get_packed_pps(dsc, &dsc_cfg, &dsc_packed_pps[0]);
-		memcpy(&stream->dsc_packed_pps[0], &dsc_packed_pps[0], sizeof(stream->dsc_packed_pps));
-		if (dc_is_dp_signal(stream->signal)) {
-			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
-				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
-										pipe_ctx->stream_res.hpo_dp_stream_enc,
-										true,
-										&dsc_packed_pps[0],
-										immediate_update);
-			else
-				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
-						pipe_ctx->stream_res.stream_enc,
-						true,
-						&dsc_packed_pps[0],
-						immediate_update);
-		}
-	} else {
-		/* disable DSC PPS in stream encoder */
-		memset(&stream->dsc_packed_pps[0], 0, sizeof(stream->dsc_packed_pps));
-		if (dc_is_dp_signal(stream->signal)) {
-			if (link_is_dp_128b_132b_signal(pipe_ctx))
-				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
-										pipe_ctx->stream_res.hpo_dp_stream_enc,
-										false,
-										NULL,
-										true);
-			else
-				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
-						pipe_ctx->stream_res.stream_enc, false, NULL, true);
-		}
-	}
-
-	return true;
-}
-
-
-bool dp_update_dsc_config(struct pipe_ctx *pipe_ctx)
-{
-	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
-
-	if (!pipe_ctx->stream->timing.flags.DSC)
-		return false;
-	if (!dsc)
-		return false;
-
-	dp_set_dsc_on_stream(pipe_ctx, true);
-	dp_set_dsc_pps_sdp(pipe_ctx, true, false);
-	return true;
-}
+// TODO - remove this file after external build dependencies is resolved.
+/* NOTE: This file is pending to be removed, do not add new code to this file */
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index e41bbcbc7146..d9f2ef242b0f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3685,7 +3685,7 @@ enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
 	/* TODO: validate audio ASIC caps, encoder */
 
 	if (res == DC_OK)
-		res = dc_link_validate_mode_timing(stream,
+		res = link_validate_mode_timing(stream,
 		      link,
 		      &stream->timing);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 64d5d9b28ca6..99cfe6c9858c 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -384,11 +384,6 @@ bool dc_link_setup_psr(struct dc_link *dc_link,
 		const struct dc_stream_state *stream, struct psr_config *psr_config,
 		struct psr_context *psr_context);
 
-void dc_link_blank_all_dp_displays(struct dc *dc);
-void dc_link_blank_all_edp_displays(struct dc *dc);
-
-void dc_link_blank_dp_stream(struct dc_link *link, bool hw_init);
-
 /* Request DC to detect if there is a Panel connected.
  * boot - If this call is during initial boot.
  * Return false for any type of detection failure or MST detection
@@ -407,9 +402,6 @@ enum dc_detect_reason {
 
 bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
 bool dc_link_get_hpd_state(struct dc_link *dc_link);
-enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx);
-enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
-enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
 
 /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
  * Return:
@@ -432,8 +424,8 @@ void dc_link_dp_handle_automated_test(struct dc_link *link);
 void dc_link_dp_handle_link_loss(struct dc_link *link);
 bool dc_link_dp_allow_hpd_rx_irq(const struct dc_link *link);
 bool dc_link_check_link_loss_status(struct dc_link *link,
-				       union hpd_irq_data *hpd_irq_dpcd_data);
-enum dc_status dp_read_hpd_rx_irq_data(
+		union hpd_irq_data *hpd_irq_dpcd_data);
+enum dc_status dc_link_dp_read_hpd_rx_irq_data(
 	struct dc_link *link,
 	union hpd_irq_data *irq_data);
 struct dc_sink_init_data;
@@ -479,7 +471,7 @@ void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
 
 bool dc_link_is_dp_sink_present(struct dc_link *link);
 
-bool dc_link_detect_sink(struct dc_link *link, enum dc_connection_type *type);
+bool dc_link_detect_connection_type(struct dc_link *link, enum dc_connection_type *type);
 /*
  * DPCD access interfaces
  */
@@ -561,7 +553,7 @@ struct dp_trace_lt_counts *dc_dp_trace_get_lt_counts(struct dc_link *link,
 unsigned int dc_dp_trace_get_link_loss_count(struct dc_link *link);
 
 /* Destruct the mst topology of the link and reset the allocated payload table */
-bool reset_cur_dp_mst_topology(struct dc_link *link);
+bool dc_link_reset_cur_dp_mst_topology(struct dc_link *link);
 
 /* Attempt to transfer the given aux payload. This function does not perform
  * retries or handle error states. The reply is returned in the payload->reply
@@ -581,55 +573,6 @@ bool dc_link_decide_edp_link_settings(struct dc_link *link,
 void dc_link_edp_panel_backlight_power_on(struct dc_link *link,
 		bool wait_for_hpd);
 
-#define LINK_TRAINING_ATTEMPTS 4
-#define LINK_TRAINING_RETRY_DELAY 50 /* ms */
-#define MAX_MTP_SLOT_COUNT 64
-#define TRAINING_AUX_RD_INTERVAL 100 //us
-#define LINK_AUX_WAKE_TIMEOUT_MS 1500 // Timeout when trying to wake unresponsive DPRX.
-
-struct dc_link;
-struct dc_stream_state;
-struct dc_link_settings;
-
-enum {
-	/*
-	 * Some receivers fail to train on first try and are good
-	 * on subsequent tries. 2 retries should be plenty. If we
-	 * don't have a successful training then we don't expect to
-	 * ever get one.
-	 */
-	LINK_TRAINING_MAX_VERIFY_RETRY = 2,
-	PEAK_FACTOR_X1000 = 1006,
-};
-
-bool dp_validate_mode_timing(
-	struct dc_link *link,
-	const struct dc_crtc_timing *timing);
-
-void dp_enable_mst_on_sink(struct dc_link *link, bool enable);
-
-enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready);
-void dp_set_fec_enable(struct dc_link *link, bool enable);
-bool dp_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
-bool dp_set_dsc_pps_sdp(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_update);
-void dp_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable);
-bool dp_update_dsc_config(struct pipe_ctx *pipe_ctx);
-bool dp_set_dsc_on_rx(struct pipe_ctx *pipe_ctx, bool enable);
-
-bool dpcd_write_128b_132b_sst_payload_allocation_table(
-		const struct dc_stream_state *stream,
-		struct dc_link *link,
-		struct link_mst_stream_allocation_table *proposed_table,
-		bool allocate);
-
-bool dpcd_poll_for_allocation_change_trigger(struct dc_link *link);
-
-struct fixed31_32 calculate_sst_avg_time_slots_per_mtp(
-		const struct dc_stream_state *stream,
-		const struct dc_link *link);
-void setup_dp_hpo_stream(struct pipe_ctx *pipe_ctx, bool enable);
-void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode);
-
 /*
  *  USB4 DPIA BW ALLOCATION PUBLIC FUNCTIONS
  */
@@ -657,4 +600,8 @@ void dc_link_set_usb4_req_bw_req(struct dc_link *link, int req_bw);
  */
 void dc_link_get_usb4_req_bw_resp(struct dc_link *link, uint8_t bw, uint8_t result);
 
+/* TODO: this is not meant to be exposed to DM. Should switch to stream update
+ * interface i.e stream_update->dsc_config
+ */
+bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx);
 #endif /* DC_LINK_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index adb36be8190e..fb3fd5b7c78b 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1566,10 +1566,10 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 			pipe_ctx->stream_res.tg->inst);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG);
+		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_OTG);
 
 	if (!stream->dpms_off)
-		core_link_enable_stream(context, pipe_ctx);
+		link_set_dpms_on(context, pipe_ctx);
 
 	/* DCN3.1 FPGA Workaround
 	 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
@@ -1602,7 +1602,7 @@ static void power_down_encoders(struct dc *dc)
 	for (i = 0; i < dc->link_count; i++) {
 		enum signal_type signal = dc->links[i]->connector_signal;
 
-		dc_link_blank_dp_stream(dc->links[i], false);
+		link_blank_dp_stream(dc->links[i], false);
 
 		if (signal != SIGNAL_TYPE_EDP)
 			signal = SIGNAL_TYPE_NONE;
@@ -2085,7 +2085,7 @@ static void dce110_reset_hw_ctx_wrap(
 			 * disabled already, no need to disable again.
 			 */
 			if (!pipe_ctx->stream || !pipe_ctx->stream->dpms_off) {
-				core_link_disable_stream(pipe_ctx_old);
+				link_set_dpms_off(pipe_ctx_old);
 
 				/* free acquired resources*/
 				if (pipe_ctx_old->stream_res.audio) {
@@ -3079,7 +3079,7 @@ void dce110_enable_dp_link_output(
 	if (dmcu != NULL && dmcu->funcs->unlock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
 }
 
 void dce110_disable_link_output(struct dc_link *link,
@@ -3104,7 +3104,7 @@ void dce110_disable_link_output(struct dc_link *link,
 		link->dc->hwss.edp_power_control(link, false);
 	else if (dmcu != NULL && dmcu->funcs->lock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 }
 
 static const struct hw_sequencer_funcs dce110_funcs = {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index bb155734ac93..0bd38508a70d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -1017,7 +1017,7 @@ static void dcn10_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			core_link_disable_stream(pipe_ctx);
+			link_set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -1564,7 +1564,7 @@ void dcn10_init_hw(struct dc *dc)
 	}
 
 	/* we want to turn off all dp displays before doing detection */
-	dc_link_blank_all_dp_displays(dc);
+	link_blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
index a1e32b938050..3c451ab5d3ca 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_stream_encoder.c
@@ -933,7 +933,7 @@ void enc1_stream_encoder_dp_blank(
 	/* disable DP stream */
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, 0);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_DP_VID_STREAM);
 
 	/* the encoder stops sending the video stream
 	 * at the start of the vertical blanking.
@@ -952,7 +952,7 @@ void enc1_stream_encoder_dp_blank(
 
 	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, true);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_FIFO_STEER_RESET);
 }
 
 /* output video stream to link encoder */
@@ -1025,7 +1025,7 @@ void enc1_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 void enc1_stream_encoder_set_avmute(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index da6d776e2f44..4ebe440772df 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2472,7 +2472,7 @@ static void dcn20_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			core_link_disable_stream(pipe_ctx);
+			link_set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -2492,7 +2492,7 @@ static void dcn20_reset_back_end_for_pipe(
 		}
 	}
 	else if (pipe_ctx->stream_res.dsc) {
-		dp_set_dsc_enable(pipe_ctx, false);
+		link_set_dsc_enable(pipe_ctx, false);
 	}
 
 	/* by upper caller loop, parent pipe: pipe0, will be reset last.
@@ -2766,7 +2766,7 @@ void dcn20_enable_stream(struct pipe_ctx *pipe_ctx)
 	dc->hwss.update_info_frame(pipe_ctx);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
 
 	/* enable early control to avoid corruption on DP monitor*/
 	active_total_with_borders =
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
index 48f662b031eb..42865d6c0cdd 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_stream_encoder.c
@@ -546,7 +546,7 @@ void enc2_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 static void enc2_dp_set_odm_combine(
diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
index 69cc192a7e71..15475c7e2cf9 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_hwseq.c
@@ -35,7 +35,7 @@
 #include "hw/clk_mgr.h"
 #include "dc_dmub_srv.h"
 #include "abm.h"
-
+#include "link.h"
 
 #define DC_LOGGER_INIT(logger)
 
@@ -132,8 +132,8 @@ void dcn21_PLAT_58856_wa(struct dc_state *context, struct pipe_ctx *pipe_ctx)
 		return;
 
 	pipe_ctx->stream->dpms_off = false;
-	core_link_enable_stream(context, pipe_ctx);
-	core_link_disable_stream(pipe_ctx);
+	link_set_dpms_on(context, pipe_ctx);
+	link_set_dpms_off(pipe_ctx);
 	pipe_ctx->stream->dpms_off = true;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 40b6de19a013..9ce86f288130 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -539,7 +539,7 @@ void dcn30_init_hw(struct dc *dc)
 			hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
 
 	/* we want to turn off all dp displays before doing detection */
-	dc_link_blank_all_dp_displays(dc);
+	link_blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
index 9871f9e189d3..d13e46eeee3c 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hwseq.c
@@ -202,7 +202,7 @@ void dcn31_init_hw(struct dc *dc)
 		dmub_enable_outbox_notification(dc->ctx->dmub_srv);
 
 	/* we want to turn off all dp displays before doing detection */
-	dc_link_blank_all_dp_displays(dc);
+	link_blank_all_dp_displays(dc);
 
 	if (hws->funcs.enable_power_gating_plane)
 		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
@@ -230,7 +230,7 @@ void dcn31_init_hw(struct dc *dc)
 				}
 
 				if (num_opps > 1) {
-					dc_link_blank_all_edp_displays(dc);
+					link_blank_all_edp_displays(dc);
 					break;
 				}
 			}
@@ -565,7 +565,7 @@ static void dcn31_reset_back_end_for_pipe(
 		 * VBIOS lit up eDP, so check link status too.
 		 */
 		if (!pipe_ctx->stream->dpms_off || link->link_status.link_active)
-			core_link_disable_stream(pipe_ctx);
+			link_set_dpms_off(pipe_ctx);
 		else if (pipe_ctx->stream_res.audio)
 			dc->hwss.disable_audio_stream(pipe_ctx);
 
@@ -584,7 +584,7 @@ static void dcn31_reset_back_end_for_pipe(
 			}
 		}
 	} else if (pipe_ctx->stream_res.dsc) {
-			dp_set_dsc_enable(pipe_ctx, false);
+			link_set_dsc_enable(pipe_ctx, false);
 	}
 
 	pipe_ctx->stream = NULL;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
index b818ebe7d06d..962a2c02b422 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
@@ -366,7 +366,7 @@ static void enc314_stream_encoder_dp_unblank(
 	 */
 	enc314_enable_fifo(enc);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 /* Set DSC-related configuration.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
index 3c0ce9404699..36e6f5657942 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
@@ -373,7 +373,7 @@ static void enc32_stream_encoder_dp_unblank(
 
 	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
 }
 
 /* Set DSC-related configuration.
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
index 7e730eaf1ad3..f803827b8d40 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -792,7 +792,7 @@ void dcn32_init_hw(struct dc *dc)
 			hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
 
 	/* we want to turn off all dp displays before doing detection */
-	dc_link_blank_all_dp_displays(dc);
+	link_blank_all_dp_displays(dc);
 
 	/* If taking control over from VBIOS, we may want to optimize our first
 	 * mode set, so we need to skip powering down pipes until we know which
@@ -1252,7 +1252,7 @@ void dcn32_disable_link_output(struct dc_link *link,
 	else if (dmcu != NULL && dmcu->funcs->lock_phy)
 		dmcu->funcs->unlock_phy(dmcu);
 
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 
 	apply_symclk_on_tx_off_wa(link);
 }
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index bebfcf8737b3..ed3c03108da6 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -56,33 +56,6 @@ void enable_surface_flip_reporting(struct dc_plane_state *plane_state,
 #endif
 #include "link_hwss.h"
 
-/************ link *****************/
-struct link_init_data {
-	const struct dc *dc;
-	struct dc_context *ctx; /* TODO: remove 'dal' when DC is complete. */
-	uint32_t connector_index; /* this will be mapped to the HPD pins */
-	uint32_t link_index; /* this is mapped to DAL display_index
-				TODO: remove it when DC is complete. */
-	bool is_dpia_link;
-};
-
-struct dc_link *link_create(const struct link_init_data *init_params);
-void link_destroy(struct dc_link **link);
-
-enum dc_status dc_link_validate_mode_timing(
-		const struct dc_stream_state *stream,
-		struct dc_link *link,
-		const struct dc_crtc_timing *timing);
-
-void core_link_resume(struct dc_link *link);
-
-void core_link_enable_stream(
-		struct dc_state *state,
-		struct pipe_ctx *pipe_ctx);
-
-void core_link_disable_stream(struct pipe_ctx *pipe_ctx);
-
-void core_link_set_avmute(struct pipe_ctx *pipe_ctx, bool enable);
 /********** DAL Core*********************/
 #include "transform.h"
 #include "dpp.h"
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link.h b/drivers/gpu/drm/amd/display/dc/inc/link.h
index d4cebf49e5d4..5e8eb367eede 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link.h
@@ -40,6 +40,19 @@
 #include "core_types.h"
 #include "dc_link.h"
 
+struct link_init_data {
+	const struct dc *dc;
+	struct dc_context *ctx; /* TODO: remove 'dal' when DC is complete. */
+	uint32_t connector_index; /* this will be mapped to the HPD pins */
+	uint32_t link_index; /* this is mapped to DAL display_index
+				TODO: remove it when DC is complete. */
+	bool is_dpia_link;
+};
+
+struct dc_link *link_create(const struct link_init_data *init_params);
+void link_destroy(struct dc_link **link);
+
+// TODO - convert any function declarations below to function pointers
 struct gpio *link_get_hpd_gpio(struct dc_bios *dcb,
 		struct graphics_object_id link_id,
 		struct gpio_service *gpio_service);
@@ -105,5 +118,22 @@ bool link_power_alpm_dpcd_enable(struct dc_link *link, bool enable);
 bool link_set_sink_vtotal_in_psr_active(const struct dc_link *link,
 		uint16_t psr_vtotal_idle, uint16_t psr_vtotal_su);
 void link_get_psr_residency(const struct dc_link *link, uint32_t *residency);
-
+enum dc_status link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+enum dc_status link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
+void link_blank_all_dp_displays(struct dc *dc);
+void link_blank_all_edp_displays(struct dc *dc);
+void link_blank_dp_stream(struct dc_link *link, bool hw_init);
+void link_resume(struct dc_link *link);
+void link_set_dpms_on(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx);
+void link_set_dpms_off(struct pipe_ctx *pipe_ctx);
+void link_dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode);
+void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable);
+bool link_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable);
+bool link_update_dsc_config(struct pipe_ctx *pipe_ctx);
+enum dc_status link_validate_mode_timing(
+		const struct dc_stream_state *stream,
+		struct dc_link *link,
+		const struct dc_crtc_timing *timing);
 #endif /* __DC_LINK_HPD_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/Makefile b/drivers/gpu/drm/amd/display/dc/link/Makefile
index 0f642cbac3d5..40352d8d7648 100644
--- a/drivers/gpu/drm/amd/display/dc/link/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/link/Makefile
@@ -23,10 +23,17 @@
 # It abstracts the control and status of back end pipe such as DIO, HPO, DPIA,
 # PHY, HPD, DDC and etc).
 
+LINK = link_detection.o link_dpms.o link_factory.o link_resource.o \
+link_validation.o
+
+AMD_DAL_LINK = $(addprefix $(AMDDALPATH)/dc/link/, \
+$(LINK))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_LINK)
 ###############################################################################
 # accessories
 ###############################################################################
-LINK_ACCESSORIES = link_dp_trace.o link_dp_cts.o
+LINK_ACCESSORIES = link_dp_trace.o link_dp_cts.o link_fpga.o
 
 AMD_DAL_LINK_ACCESSORIES = $(addprefix $(AMDDALPATH)/dc/link/accessories/, \
 $(LINK_ACCESSORIES))
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
index 7fb2c0b4c4bb..769b782a9b84 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_cts.c
@@ -88,7 +88,7 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 				pipe->stream->link == link &&
 				!pipe->stream->dpms_off &&
 				!pipe->top_pipe && !pipe->prev_odm_pipe) {
-			core_link_disable_stream(pipe);
+			link_set_dpms_off(pipe);
 			pipe->link_config.dp_link_settings = *link_setting;
 			update_dp_encoder_resources_for_test_harness(
 					link->dc,
@@ -103,7 +103,7 @@ void dp_retrain_link_dp_test(struct dc_link *link,
 				pipe->stream->link == link &&
 				!pipe->stream->dpms_off &&
 				!pipe->top_pipe && !pipe->prev_odm_pipe) {
-			core_link_enable_stream(
+			link_set_dpms_on(
 					pipe->stream->ctx->dc->current_state,
 					pipe);
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
index 04838a31e513..f89435a0d8e9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
@@ -22,8 +22,8 @@
  * Authors: AMD
  *
  */
-#include "dc_link.h"
 #include "link_dp_trace.h"
+#include "link/protocols/link_dpcd.h"
 
 void dp_trace_init(struct dc_link *link)
 {
@@ -164,3 +164,10 @@ uint64_t link_dp_trace_get_edp_poweroff_timestamp(struct dc_link *link)
 {
 	return link->dp_trace.edp_trace_power_timestamps.poweroff;
 }
+
+void link_dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
+{
+	if (link != NULL && link->dc->debug.enable_driver_sequence_debug)
+		core_link_write_dpcd(link, DP_SOURCE_SEQUENCE,
+					&dp_test_mode, sizeof(dp_test_mode));
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
index 702f97c6ead0..89feea1b2692 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.h
@@ -24,6 +24,7 @@
  */
 #ifndef __LINK_DP_TRACE_H__
 #define __LINK_DP_TRACE_H__
+#include "link.h"
 
 void dp_trace_init(struct dc_link *link);
 void dp_trace_reset(struct dc_link *link);
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c
new file mode 100644
index 000000000000..d3cc604eed67
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.c
@@ -0,0 +1,95 @@
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
+#include "link_fpga.h"
+#include "link/link_dpms.h"
+#include "dm_helpers.h"
+#include "link_hwss.h"
+#include "dccg.h"
+#include "resource.h"
+
+#define DC_LOGGER_INIT(logger)
+
+void dp_fpga_hpo_enable_link_and_stream(struct dc_state *state, struct pipe_ctx *pipe_ctx)
+{
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct link_mst_stream_allocation_table proposed_table = {0};
+	struct fixed31_32 avg_time_slots_per_mtp;
+	uint8_t req_slot_count = 0;
+	uint8_t vc_id = 1; /// VC ID always 1 for SST
+	struct dc_link_settings link_settings = pipe_ctx->link_config.dp_link_settings;
+	const struct link_hwss *link_hwss = get_link_hwss(stream->link, &pipe_ctx->link_res);
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	stream->link->cur_link_settings = link_settings;
+
+	if (link_hwss->ext.enable_dp_link_output)
+		link_hwss->ext.enable_dp_link_output(stream->link, &pipe_ctx->link_res,
+				stream->signal, pipe_ctx->clock_source->id,
+				&link_settings);
+
+	/* Enable DP_STREAM_ENC */
+	dc->hwss.enable_stream(pipe_ctx);
+
+	/* Set DPS PPS SDP (AKA "info frames") */
+	if (pipe_ctx->stream->timing.flags.DSC) {
+		link_set_dsc_pps_packet(pipe_ctx, true, true);
+	}
+
+	/* Allocate Payload */
+	if ((stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) && (state->stream_count > 1)) {
+		// MST case
+		uint8_t i;
+
+		proposed_table.stream_count = state->stream_count;
+		for (i = 0; i < state->stream_count; i++) {
+			avg_time_slots_per_mtp = link_calculate_sst_avg_time_slots_per_mtp(state->streams[i], state->streams[i]->link);
+			req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
+			proposed_table.stream_allocations[i].slot_count = req_slot_count;
+			proposed_table.stream_allocations[i].vcp_id = i+1;
+			/* NOTE: This makes assumption that pipe_ctx index is same as stream index */
+			proposed_table.stream_allocations[i].hpo_dp_stream_enc = state->res_ctx.pipe_ctx[i].stream_res.hpo_dp_stream_enc;
+		}
+	} else {
+		// SST case
+		avg_time_slots_per_mtp = link_calculate_sst_avg_time_slots_per_mtp(stream, stream->link);
+		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
+		proposed_table.stream_count = 1; /// Always 1 stream for SST
+		proposed_table.stream_allocations[0].slot_count = req_slot_count;
+		proposed_table.stream_allocations[0].vcp_id = vc_id;
+		proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
+	}
+
+	link_hwss->ext.update_stream_allocation_table(stream->link,
+			&pipe_ctx->link_res,
+			&proposed_table);
+
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+
+	dc->hwss.unblank_stream(pipe_ctx, &stream->link->cur_link_settings);
+	dc->hwss.enable_audio_stream(pipe_ctx);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.h b/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.h
new file mode 100644
index 000000000000..3a80f5595943
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_fpga.h
@@ -0,0 +1,30 @@
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
+#ifndef __LINK_FPGA_H__
+#define __LINK_FPGA_H__
+#include "link.h"
+void dp_fpga_hpo_enable_link_and_stream(struct dc_state *state,
+		struct pipe_ctx *pipe_ctx);
+#endif /* __LINK_FPGA_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
index 841a23da5dd3..b092b00b3599 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.c
@@ -44,7 +44,7 @@ void setup_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
 	link_enc->funcs->connect_dig_be_to_fe(link_enc,
 			pipe_ctx->stream_res.stream_enc->id, true);
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(pipe_ctx->stream->link,
+		link_dp_source_sequence_trace(pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_CONNECT_DIG_FE_BE);
 	if (stream_enc->funcs->enable_fifo)
 		stream_enc->funcs->enable_fifo(stream_enc);
@@ -63,7 +63,7 @@ void reset_dio_stream_encoder(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc->id,
 			false);
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(pipe_ctx->stream->link,
+		link_dp_source_sequence_trace(pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_DISCONNECT_DIG_FE_BE);
 
 }
@@ -105,7 +105,7 @@ void setup_dio_stream_attribute(struct pipe_ctx *pipe_ctx)
 				&stream->timing);
 
 	if (dc_is_dp_signal(stream->signal))
-		dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
+		link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
 }
 
 void enable_dio_dp_link_output(struct dc_link *link,
@@ -126,7 +126,7 @@ void enable_dio_dp_link_output(struct dc_link *link,
 				link_enc,
 				link_settings,
 				clock_source);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_LINK_PHY);
 }
 
 void disable_dio_link_output(struct dc_link *link,
@@ -136,7 +136,7 @@ void disable_dio_link_output(struct dc_link *link,
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
 
 	link_enc->funcs->disable_output(link_enc, signal);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DISABLE_LINK_PHY);
 }
 
 void set_dio_dp_link_test_pattern(struct dc_link *link,
@@ -146,7 +146,7 @@ void set_dio_dp_link_test_pattern(struct dc_link *link,
 	struct link_encoder *link_enc = link_enc_cfg_get_link_enc(link);
 
 	link_enc->funcs->dp_set_phy_pattern(link_enc, tp_params);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
 
 void set_dio_dp_lane_settings(struct dc_link *link,
@@ -195,7 +195,7 @@ void enable_dio_audio_packet(struct pipe_ctx *pipe_ctx)
 			pipe_ctx->stream_res.stream_enc, false);
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(pipe_ctx->stream->link,
+		link_dp_source_sequence_trace(pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_ENABLE_AUDIO_STREAM);
 }
 
@@ -214,7 +214,7 @@ void disable_dio_audio_packet(struct pipe_ctx *pipe_ctx)
 	}
 
 	if (dc_is_dp_signal(pipe_ctx->stream->signal))
-		dp_source_sequence_trace(pipe_ctx->stream->link,
+		link_dp_source_sequence_trace(pipe_ctx->stream->link,
 				DPCD_SOURCE_SEQ_AFTER_DISABLE_AUDIO_STREAM);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
index d8947f3233f3..aa1c5e253b43 100644
--- a/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_hpo_dp.c
@@ -115,7 +115,7 @@ static void setup_hpo_dp_stream_attribute(struct pipe_ctx *pipe_ctx)
 			stream->use_vsc_sdp_for_colorimetry,
 			stream->timing.flags.DSC,
 			false);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_DP_STREAM_ATTR);
 }
 
 static void enable_hpo_dp_fpga_link_output(struct dc_link *link,
@@ -201,7 +201,7 @@ static void set_hpo_dp_link_test_pattern(struct dc_link *link,
 {
 	link_res->hpo_dp_link_enc->funcs->set_link_test_pattern(
 			link_res->hpo_dp_link_enc, tp_params);
-	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
+	link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_SET_SOURCE_PATTERN);
 }
 
 static void set_hpo_dp_lane_settings(struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
new file mode 100644
index 000000000000..63e75c392031
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -0,0 +1,1356 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file manages link detection states and receiver states by using various
+ * link protocols. It also provides helper functions to interpret certain
+ * capabilities or status based on the states it manages or retrieve them
+ * directly from connected receivers.
+ */
+
+#include "link_detection.h"
+#include "link_hwss.h"
+#include "protocols/link_edp_panel_control.h"
+#include "protocols/link_ddc.h"
+#include "protocols/link_hpd.h"
+#include "protocols/link_dpcd.h"
+#include "protocols/link_dp_capability.h"
+#include "protocols/link_dp_dpia.h"
+#include "protocols/link_dp_phy.h"
+#include "protocols/link_dp_training.h"
+#include "accessories/link_dp_trace.h"
+
+#include "link_enc_cfg.h"
+#include "dm_helpers.h"
+#include "clk_mgr.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define LINK_INFO(...) \
+	DC_LOG_HW_HOTPLUG(  \
+		__VA_ARGS__)
+/*
+ * Some receivers fail to train on first try and are good
+ * on subsequent tries. 2 retries should be plenty. If we
+ * don't have a successful training then we don't expect to
+ * ever get one.
+ */
+#define LINK_TRAINING_MAX_VERIFY_RETRY 2
+
+static enum ddc_transaction_type get_ddc_transaction_type(enum signal_type sink_signal)
+{
+	enum ddc_transaction_type transaction_type = DDC_TRANSACTION_TYPE_NONE;
+
+	switch (sink_signal) {
+	case SIGNAL_TYPE_DVI_SINGLE_LINK:
+	case SIGNAL_TYPE_DVI_DUAL_LINK:
+	case SIGNAL_TYPE_HDMI_TYPE_A:
+	case SIGNAL_TYPE_LVDS:
+	case SIGNAL_TYPE_RGB:
+		transaction_type = DDC_TRANSACTION_TYPE_I2C;
+		break;
+
+	case SIGNAL_TYPE_DISPLAY_PORT:
+	case SIGNAL_TYPE_EDP:
+		transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
+		break;
+
+	case SIGNAL_TYPE_DISPLAY_PORT_MST:
+		/* MST does not use I2COverAux, but there is the
+		 * SPECIAL use case for "immediate dwnstrm device
+		 * access" (EPR#370830).
+		 */
+		transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
+		break;
+
+	default:
+		break;
+	}
+
+	return transaction_type;
+}
+
+static enum signal_type get_basic_signal_type(struct graphics_object_id encoder,
+					      struct graphics_object_id downstream)
+{
+	if (downstream.type == OBJECT_TYPE_CONNECTOR) {
+		switch (downstream.id) {
+		case CONNECTOR_ID_SINGLE_LINK_DVII:
+			switch (encoder.id) {
+			case ENCODER_ID_INTERNAL_DAC1:
+			case ENCODER_ID_INTERNAL_KLDSCP_DAC1:
+			case ENCODER_ID_INTERNAL_DAC2:
+			case ENCODER_ID_INTERNAL_KLDSCP_DAC2:
+				return SIGNAL_TYPE_RGB;
+			default:
+				return SIGNAL_TYPE_DVI_SINGLE_LINK;
+			}
+		break;
+		case CONNECTOR_ID_DUAL_LINK_DVII:
+		{
+			switch (encoder.id) {
+			case ENCODER_ID_INTERNAL_DAC1:
+			case ENCODER_ID_INTERNAL_KLDSCP_DAC1:
+			case ENCODER_ID_INTERNAL_DAC2:
+			case ENCODER_ID_INTERNAL_KLDSCP_DAC2:
+				return SIGNAL_TYPE_RGB;
+			default:
+				return SIGNAL_TYPE_DVI_DUAL_LINK;
+			}
+		}
+		break;
+		case CONNECTOR_ID_SINGLE_LINK_DVID:
+			return SIGNAL_TYPE_DVI_SINGLE_LINK;
+		case CONNECTOR_ID_DUAL_LINK_DVID:
+			return SIGNAL_TYPE_DVI_DUAL_LINK;
+		case CONNECTOR_ID_VGA:
+			return SIGNAL_TYPE_RGB;
+		case CONNECTOR_ID_HDMI_TYPE_A:
+			return SIGNAL_TYPE_HDMI_TYPE_A;
+		case CONNECTOR_ID_LVDS:
+			return SIGNAL_TYPE_LVDS;
+		case CONNECTOR_ID_DISPLAY_PORT:
+		case CONNECTOR_ID_USBC:
+			return SIGNAL_TYPE_DISPLAY_PORT;
+		case CONNECTOR_ID_EDP:
+			return SIGNAL_TYPE_EDP;
+		default:
+			return SIGNAL_TYPE_NONE;
+		}
+	} else if (downstream.type == OBJECT_TYPE_ENCODER) {
+		switch (downstream.id) {
+		case ENCODER_ID_EXTERNAL_NUTMEG:
+		case ENCODER_ID_EXTERNAL_TRAVIS:
+			return SIGNAL_TYPE_DISPLAY_PORT;
+		default:
+			return SIGNAL_TYPE_NONE;
+		}
+	}
+
+	return SIGNAL_TYPE_NONE;
+}
+
+/*
+ * @brief
+ * Detect output sink type
+ */
+static enum signal_type link_detect_sink_signal_type(struct dc_link *link,
+					 enum dc_detect_reason reason)
+{
+	enum signal_type result;
+	struct graphics_object_id enc_id;
+
+	if (link->is_dig_mapping_flexible)
+		enc_id = (struct graphics_object_id){.id = ENCODER_ID_UNKNOWN};
+	else
+		enc_id = link->link_enc->id;
+	result = get_basic_signal_type(enc_id, link->link_id);
+
+	/* Use basic signal type for link without physical connector. */
+	if (link->ep_type != DISPLAY_ENDPOINT_PHY)
+		return result;
+
+	/* Internal digital encoder will detect only dongles
+	 * that require digital signal
+	 */
+
+	/* Detection mechanism is different
+	 * for different native connectors.
+	 * LVDS connector supports only LVDS signal;
+	 * PCIE is a bus slot, the actual connector needs to be detected first;
+	 * eDP connector supports only eDP signal;
+	 * HDMI should check straps for audio
+	 */
+
+	/* PCIE detects the actual connector on add-on board */
+	if (link->link_id.id == CONNECTOR_ID_PCIE) {
+		/* ZAZTODO implement PCIE add-on card detection */
+	}
+
+	switch (link->link_id.id) {
+	case CONNECTOR_ID_HDMI_TYPE_A: {
+		/* check audio support:
+		 * if native HDMI is not supported, switch to DVI
+		 */
+		struct audio_support *aud_support =
+					&link->dc->res_pool->audio_support;
+
+		if (!aud_support->hdmi_audio_native)
+			if (link->link_id.id == CONNECTOR_ID_HDMI_TYPE_A)
+				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
+	}
+	break;
+	case CONNECTOR_ID_DISPLAY_PORT:
+	case CONNECTOR_ID_USBC: {
+		/* DP HPD short pulse. Passive DP dongle will not
+		 * have short pulse
+		 */
+		if (reason != DETECT_REASON_HPDRX) {
+			/* Check whether DP signal detected: if not -
+			 * we assume signal is DVI; it could be corrected
+			 * to HDMI after dongle detection
+			 */
+			if (!dm_helpers_is_dp_sink_present(link))
+				result = SIGNAL_TYPE_DVI_SINGLE_LINK;
+		}
+	}
+	break;
+	default:
+	break;
+	}
+
+	return result;
+}
+
+static enum signal_type decide_signal_from_strap_and_dongle_type(enum display_dongle_type dongle_type,
+								 struct audio_support *audio_support)
+{
+	enum signal_type signal = SIGNAL_TYPE_NONE;
+
+	switch (dongle_type) {
+	case DISPLAY_DONGLE_DP_HDMI_DONGLE:
+		if (audio_support->hdmi_audio_on_dongle)
+			signal = SIGNAL_TYPE_HDMI_TYPE_A;
+		else
+			signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+		break;
+	case DISPLAY_DONGLE_DP_DVI_DONGLE:
+		signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+		break;
+	case DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE:
+		if (audio_support->hdmi_audio_native)
+			signal =  SIGNAL_TYPE_HDMI_TYPE_A;
+		else
+			signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+		break;
+	default:
+		signal = SIGNAL_TYPE_NONE;
+		break;
+	}
+
+	return signal;
+}
+
+static void read_scdc_caps(struct ddc_service *ddc_service,
+		struct dc_sink *sink)
+{
+	uint8_t slave_address = HDMI_SCDC_ADDRESS;
+	uint8_t offset = HDMI_SCDC_MANUFACTURER_OUI;
+
+	link_query_ddc_data(ddc_service, slave_address, &offset,
+			sizeof(offset), sink->scdc_caps.manufacturer_OUI.byte,
+			sizeof(sink->scdc_caps.manufacturer_OUI.byte));
+
+	offset = HDMI_SCDC_DEVICE_ID;
+
+	link_query_ddc_data(ddc_service, slave_address, &offset,
+			sizeof(offset), &(sink->scdc_caps.device_id.byte),
+			sizeof(sink->scdc_caps.device_id.byte));
+}
+
+static bool i2c_read(
+	struct ddc_service *ddc,
+	uint32_t address,
+	uint8_t *buffer,
+	uint32_t len)
+{
+	uint8_t offs_data = 0;
+	struct i2c_payload payloads[2] = {
+		{
+		.write = true,
+		.address = address,
+		.length = 1,
+		.data = &offs_data },
+		{
+		.write = false,
+		.address = address,
+		.length = len,
+		.data = buffer } };
+
+	struct i2c_command command = {
+		.payloads = payloads,
+		.number_of_payloads = 2,
+		.engine = DDC_I2C_COMMAND_ENGINE,
+		.speed = ddc->ctx->dc->caps.i2c_speed_in_khz };
+
+	return dm_helpers_submit_i2c(
+			ddc->ctx,
+			ddc->link,
+			&command);
+}
+
+enum {
+	DP_SINK_CAP_SIZE =
+		DP_EDP_CONFIGURATION_CAP - DP_DPCD_REV + 1
+};
+
+static void query_dp_dual_mode_adaptor(
+	struct ddc_service *ddc,
+	struct display_sink_capability *sink_cap)
+{
+	uint8_t i;
+	bool is_valid_hdmi_signature;
+	enum display_dongle_type *dongle = &sink_cap->dongle_type;
+	uint8_t type2_dongle_buf[DP_ADAPTOR_TYPE2_SIZE];
+	bool is_type2_dongle = false;
+	int retry_count = 2;
+	struct dp_hdmi_dongle_signature_data *dongle_signature;
+
+	/* Assume we have no valid DP passive dongle connected */
+	*dongle = DISPLAY_DONGLE_NONE;
+	sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_HDMI_SAFE_MAX_TMDS_CLK;
+
+	/* Read DP-HDMI dongle I2c (no response interpreted as DP-DVI dongle)*/
+	if (!i2c_read(
+		ddc,
+		DP_HDMI_DONGLE_ADDRESS,
+		type2_dongle_buf,
+		sizeof(type2_dongle_buf))) {
+		/* Passive HDMI dongles can sometimes fail here without retrying*/
+		while (retry_count > 0) {
+			if (i2c_read(ddc,
+				DP_HDMI_DONGLE_ADDRESS,
+				type2_dongle_buf,
+				sizeof(type2_dongle_buf)))
+				break;
+			retry_count--;
+		}
+		if (retry_count == 0) {
+			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
+			sink_cap->max_hdmi_pixel_clock = DP_ADAPTOR_DVI_MAX_TMDS_CLK;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf, sizeof(type2_dongle_buf),
+					"DP-DVI passive dongle %dMhz: ",
+					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
+			return;
+		}
+	}
+
+	/* Check if Type 2 dongle.*/
+	if (type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_ID] == DP_ADAPTOR_TYPE2_ID)
+		is_type2_dongle = true;
+
+	dongle_signature =
+		(struct dp_hdmi_dongle_signature_data *)type2_dongle_buf;
+
+	is_valid_hdmi_signature = true;
+
+	/* Check EOT */
+	if (dongle_signature->eot != DP_HDMI_DONGLE_SIGNATURE_EOT) {
+		is_valid_hdmi_signature = false;
+	}
+
+	/* Check signature */
+	for (i = 0; i < sizeof(dongle_signature->id); ++i) {
+		/* If its not the right signature,
+		 * skip mismatch in subversion byte.*/
+		if (dongle_signature->id[i] !=
+			dp_hdmi_dongle_signature_str[i] && i != 3) {
+
+			if (is_type2_dongle) {
+				is_valid_hdmi_signature = false;
+				break;
+			}
+
+		}
+	}
+
+	if (is_type2_dongle) {
+		uint32_t max_tmds_clk =
+			type2_dongle_buf[DP_ADAPTOR_TYPE2_REG_MAX_TMDS_CLK];
+
+		max_tmds_clk = max_tmds_clk * 2 + max_tmds_clk / 2;
+
+		if (0 == max_tmds_clk ||
+				max_tmds_clk < DP_ADAPTOR_TYPE2_MIN_TMDS_CLK ||
+				max_tmds_clk > DP_ADAPTOR_TYPE2_MAX_TMDS_CLK) {
+			*dongle = DISPLAY_DONGLE_DP_DVI_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"DP-DVI passive dongle %dMhz: ",
+					DP_ADAPTOR_DVI_MAX_TMDS_CLK / 1000);
+		} else {
+			if (is_valid_hdmi_signature == true) {
+				*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
+
+				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+						sizeof(type2_dongle_buf),
+						"Type 2 DP-HDMI passive dongle %dMhz: ",
+						max_tmds_clk);
+			} else {
+				*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
+
+				CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+						sizeof(type2_dongle_buf),
+						"Type 2 DP-HDMI passive dongle (no signature) %dMhz: ",
+						max_tmds_clk);
+
+			}
+
+			/* Multiply by 1000 to convert to kHz. */
+			sink_cap->max_hdmi_pixel_clock =
+				max_tmds_clk * 1000;
+		}
+		sink_cap->is_dongle_type_one = false;
+
+	} else {
+		if (is_valid_hdmi_signature == true) {
+			*dongle = DISPLAY_DONGLE_DP_HDMI_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"Type 1 DP-HDMI passive dongle %dMhz: ",
+					sink_cap->max_hdmi_pixel_clock / 1000);
+		} else {
+			*dongle = DISPLAY_DONGLE_DP_HDMI_MISMATCHED_DONGLE;
+
+			CONN_DATA_DETECT(ddc->link, type2_dongle_buf,
+					sizeof(type2_dongle_buf),
+					"Type 1 DP-HDMI passive dongle (no signature) %dMhz: ",
+					sink_cap->max_hdmi_pixel_clock / 1000);
+		}
+		sink_cap->is_dongle_type_one = true;
+	}
+
+	return;
+}
+
+static enum signal_type dp_passive_dongle_detection(struct ddc_service *ddc,
+						    struct display_sink_capability *sink_cap,
+						    struct audio_support *audio_support)
+{
+	query_dp_dual_mode_adaptor(ddc, sink_cap);
+
+	return decide_signal_from_strap_and_dongle_type(sink_cap->dongle_type,
+							audio_support);
+}
+
+static void link_disconnect_sink(struct dc_link *link)
+{
+	if (link->local_sink) {
+		dc_sink_release(link->local_sink);
+		link->local_sink = NULL;
+	}
+
+	link->dpcd_sink_count = 0;
+	//link->dpcd_caps.dpcd_rev.raw = 0;
+}
+
+static void link_disconnect_remap(struct dc_sink *prev_sink, struct dc_link *link)
+{
+	dc_sink_release(link->local_sink);
+	link->local_sink = prev_sink;
+}
+
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+static void query_hdcp_capability(enum signal_type signal, struct dc_link *link)
+{
+	struct hdcp_protection_message msg22;
+	struct hdcp_protection_message msg14;
+
+	memset(&msg22, 0, sizeof(struct hdcp_protection_message));
+	memset(&msg14, 0, sizeof(struct hdcp_protection_message));
+	memset(link->hdcp_caps.rx_caps.raw, 0,
+		sizeof(link->hdcp_caps.rx_caps.raw));
+
+	if ((link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
+			link->ddc->transaction_type ==
+			DDC_TRANSACTION_TYPE_I2C_OVER_AUX) ||
+			link->connector_signal == SIGNAL_TYPE_EDP) {
+		msg22.data = link->hdcp_caps.rx_caps.raw;
+		msg22.length = sizeof(link->hdcp_caps.rx_caps.raw);
+		msg22.msg_id = HDCP_MESSAGE_ID_RX_CAPS;
+	} else {
+		msg22.data = &link->hdcp_caps.rx_caps.fields.version;
+		msg22.length = sizeof(link->hdcp_caps.rx_caps.fields.version);
+		msg22.msg_id = HDCP_MESSAGE_ID_HDCP2VERSION;
+	}
+	msg22.version = HDCP_VERSION_22;
+	msg22.link = HDCP_LINK_PRIMARY;
+	msg22.max_retries = 5;
+	dc_process_hdcp_msg(signal, link, &msg22);
+
+	if (signal == SIGNAL_TYPE_DISPLAY_PORT || signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		enum hdcp_message_status status = HDCP_MESSAGE_UNSUPPORTED;
+
+		msg14.data = &link->hdcp_caps.bcaps.raw;
+		msg14.length = sizeof(link->hdcp_caps.bcaps.raw);
+		msg14.msg_id = HDCP_MESSAGE_ID_READ_BCAPS;
+		msg14.version = HDCP_VERSION_14;
+		msg14.link = HDCP_LINK_PRIMARY;
+		msg14.max_retries = 5;
+
+		status = dc_process_hdcp_msg(signal, link, &msg14);
+	}
+
+}
+#endif // CONFIG_DRM_AMD_DC_HDCP
+static void read_current_link_settings_on_detect(struct dc_link *link)
+{
+	union lane_count_set lane_count_set = {0};
+	uint8_t link_bw_set;
+	uint8_t link_rate_set;
+	uint32_t read_dpcd_retry_cnt = 10;
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	int i;
+	union max_down_spread max_down_spread = {0};
+
+	// Read DPCD 00101h to find out the number of lanes currently set
+	for (i = 0; i < read_dpcd_retry_cnt; i++) {
+		status = core_link_read_dpcd(link,
+					     DP_LANE_COUNT_SET,
+					     &lane_count_set.raw,
+					     sizeof(lane_count_set));
+		/* First DPCD read after VDD ON can fail if the particular board
+		 * does not have HPD pin wired correctly. So if DPCD read fails,
+		 * which it should never happen, retry a few times. Target worst
+		 * case scenario of 80 ms.
+		 */
+		if (status == DC_OK) {
+			link->cur_link_settings.lane_count =
+					lane_count_set.bits.LANE_COUNT_SET;
+			break;
+		}
+
+		msleep(8);
+	}
+
+	// Read DPCD 00100h to find if standard link rates are set
+	core_link_read_dpcd(link, DP_LINK_BW_SET,
+			    &link_bw_set, sizeof(link_bw_set));
+
+	if (link_bw_set == 0) {
+		if (link->connector_signal == SIGNAL_TYPE_EDP) {
+			/* If standard link rates are not being used,
+			 * Read DPCD 00115h to find the edp link rate set used
+			 */
+			core_link_read_dpcd(link, DP_LINK_RATE_SET,
+					    &link_rate_set, sizeof(link_rate_set));
+
+			// edp_supported_link_rates_count = 0 for DP
+			if (link_rate_set < link->dpcd_caps.edp_supported_link_rates_count) {
+				link->cur_link_settings.link_rate =
+					link->dpcd_caps.edp_supported_link_rates[link_rate_set];
+				link->cur_link_settings.link_rate_set = link_rate_set;
+				link->cur_link_settings.use_link_rate_set = true;
+			}
+		} else {
+			// Link Rate not found. Seamless boot may not work.
+			ASSERT(false);
+		}
+	} else {
+		link->cur_link_settings.link_rate = link_bw_set;
+		link->cur_link_settings.use_link_rate_set = false;
+	}
+	// Read DPCD 00003h to find the max down spread.
+	core_link_read_dpcd(link, DP_MAX_DOWNSPREAD,
+			    &max_down_spread.raw, sizeof(max_down_spread));
+	link->cur_link_settings.link_spread =
+		max_down_spread.bits.MAX_DOWN_SPREAD ?
+		LINK_SPREAD_05_DOWNSPREAD_30KHZ : LINK_SPREAD_DISABLED;
+}
+
+static bool detect_dp(struct dc_link *link,
+		      struct display_sink_capability *sink_caps,
+		      enum dc_detect_reason reason)
+{
+	struct audio_support *audio_support = &link->dc->res_pool->audio_support;
+
+	sink_caps->signal = link_detect_sink_signal_type(link, reason);
+	sink_caps->transaction_type =
+		get_ddc_transaction_type(sink_caps->signal);
+
+	if (sink_caps->transaction_type == DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
+		sink_caps->signal = SIGNAL_TYPE_DISPLAY_PORT;
+		if (!detect_dp_sink_caps(link))
+			return false;
+
+		if (is_dp_branch_device(link))
+			/* DP SST branch */
+			link->type = dc_connection_sst_branch;
+	} else {
+		/* DP passive dongles */
+		sink_caps->signal = dp_passive_dongle_detection(link->ddc,
+								sink_caps,
+								audio_support);
+		link->dpcd_caps.dongle_type = sink_caps->dongle_type;
+		link->dpcd_caps.is_dongle_type_one = sink_caps->is_dongle_type_one;
+		link->dpcd_caps.dpcd_rev.raw = 0;
+	}
+
+	return true;
+}
+
+static bool is_same_edid(struct dc_edid *old_edid, struct dc_edid *new_edid)
+{
+	if (old_edid->length != new_edid->length)
+		return false;
+
+	if (new_edid->length == 0)
+		return false;
+
+	return (memcmp(old_edid->raw_edid,
+		       new_edid->raw_edid, new_edid->length) == 0);
+}
+
+static bool wait_for_entering_dp_alt_mode(struct dc_link *link)
+{
+
+	/**
+	 * something is terribly wrong if time out is > 200ms. (5Hz)
+	 * 500 microseconds * 400 tries us 200 ms
+	 **/
+	unsigned int sleep_time_in_microseconds = 500;
+	unsigned int tries_allowed = 400;
+	bool is_in_alt_mode;
+	unsigned long long enter_timestamp;
+	unsigned long long finish_timestamp;
+	unsigned long long time_taken_in_ns;
+	int tries_taken;
+
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/**
+	 * this function will only exist if we are on dcn21 (is_in_alt_mode is a
+	 *  function pointer, so checking to see if it is equal to 0 is the same
+	 *  as checking to see if it is null
+	 **/
+	if (!link->link_enc->funcs->is_in_alt_mode)
+		return true;
+
+	is_in_alt_mode = link->link_enc->funcs->is_in_alt_mode(link->link_enc);
+	DC_LOG_DC("DP Alt mode state on HPD: %d\n", is_in_alt_mode);
+
+	if (is_in_alt_mode)
+		return true;
+
+	enter_timestamp = dm_get_timestamp(link->ctx);
+
+	for (tries_taken = 0; tries_taken < tries_allowed; tries_taken++) {
+		udelay(sleep_time_in_microseconds);
+		/* ask the link if alt mode is enabled, if so return ok */
+		if (link->link_enc->funcs->is_in_alt_mode(link->link_enc)) {
+			finish_timestamp = dm_get_timestamp(link->ctx);
+			time_taken_in_ns =
+				dm_get_elapse_time_in_ns(link->ctx,
+							 finish_timestamp,
+							 enter_timestamp);
+			DC_LOG_WARNING("Alt mode entered finished after %llu ms\n",
+				       div_u64(time_taken_in_ns, 1000000));
+			return true;
+		}
+	}
+	finish_timestamp = dm_get_timestamp(link->ctx);
+	time_taken_in_ns = dm_get_elapse_time_in_ns(link->ctx, finish_timestamp,
+						    enter_timestamp);
+	DC_LOG_WARNING("Alt mode has timed out after %llu ms\n",
+			div_u64(time_taken_in_ns, 1000000));
+	return false;
+}
+
+static void apply_dpia_mst_dsc_always_on_wa(struct dc_link *link)
+{
+	/* Apply work around for tunneled MST on certain USB4 docks. Always use DSC if dock
+	 * reports DSC support.
+	 */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA &&
+			link->type == dc_connection_mst_branch &&
+			link->dpcd_caps.branch_dev_id == DP_BRANCH_DEVICE_ID_90CC24 &&
+			link->dpcd_caps.branch_hw_revision == DP_BRANCH_HW_REV_20 &&
+			link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT &&
+			!link->dc->debug.dpia_debug.bits.disable_mst_dsc_work_around)
+		link->wa_flags.dpia_mst_dsc_always_on = true;
+}
+
+static void revert_dpia_mst_dsc_always_on_wa(struct dc_link *link)
+{
+	/* Disable work around which keeps DSC on for tunneled MST on certain USB4 docks. */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+		link->wa_flags.dpia_mst_dsc_always_on = false;
+}
+
+static bool discover_dp_mst_topology(struct dc_link *link, enum dc_detect_reason reason)
+{
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	LINK_INFO("link=%d, mst branch is now Connected\n",
+		  link->link_index);
+
+	link->type = dc_connection_mst_branch;
+	apply_dpia_mst_dsc_always_on_wa(link);
+
+	dm_helpers_dp_update_branch_info(link->ctx, link);
+	if (dm_helpers_dp_mst_start_top_mgr(link->ctx,
+			link, (reason == DETECT_REASON_BOOT || reason == DETECT_REASON_RESUMEFROMS3S4))) {
+		link_disconnect_sink(link);
+	} else {
+		link->type = dc_connection_sst_branch;
+	}
+
+	return link->type == dc_connection_mst_branch;
+}
+
+static bool reset_cur_dp_mst_topology(struct dc_link *link)
+{
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	LINK_INFO("link=%d, mst branch is now Disconnected\n",
+		  link->link_index);
+
+	revert_dpia_mst_dsc_always_on_wa(link);
+	return dm_helpers_dp_mst_stop_top_mgr(link->ctx, link);
+}
+
+bool dc_link_reset_cur_dp_mst_topology(struct dc_link *link)
+{
+	return reset_cur_dp_mst_topology(link);
+}
+static bool should_prepare_phy_clocks_for_link_verification(const struct dc *dc,
+		enum dc_detect_reason reason)
+{
+	int i;
+	bool can_apply_seamless_boot = false;
+
+	for (i = 0; i < dc->current_state->stream_count; i++) {
+		if (dc->current_state->streams[i]->apply_seamless_boot_optimization) {
+			can_apply_seamless_boot = true;
+			break;
+		}
+	}
+
+	return !can_apply_seamless_boot && reason != DETECT_REASON_BOOT;
+}
+
+static void prepare_phy_clocks_for_destructive_link_verification(const struct dc *dc)
+{
+	dc_z10_restore(dc);
+	clk_mgr_exit_optimized_pwr_state(dc, dc->clk_mgr);
+}
+
+static void restore_phy_clocks_for_destructive_link_verification(const struct dc *dc)
+{
+	clk_mgr_optimize_pwr_state(dc, dc->clk_mgr);
+}
+
+static void set_all_streams_dpms_off_for_link(struct dc_link *link)
+{
+	int i;
+	struct pipe_ctx *pipe_ctx;
+	struct dc_stream_update stream_update;
+	bool dpms_off = true;
+	struct link_resource link_res = {0};
+
+	memset(&stream_update, 0, sizeof(stream_update));
+	stream_update.dpms_off = &dpms_off;
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
+				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe) {
+			stream_update.stream = pipe_ctx->stream;
+			dc_commit_updates_for_stream(link->ctx->dc, NULL, 0,
+					pipe_ctx->stream, &stream_update,
+					link->ctx->dc->current_state);
+		}
+	}
+
+	/* link can be also enabled by vbios. In this case it is not recorded
+	 * in pipe_ctx. Disable link phy here to make sure it is completely off
+	 */
+	dp_disable_link_phy(link, &link_res, link->connector_signal);
+}
+
+static void verify_link_capability_destructive(struct dc_link *link,
+		struct dc_sink *sink,
+		enum dc_detect_reason reason)
+{
+	bool should_prepare_phy_clocks =
+			should_prepare_phy_clocks_for_link_verification(link->dc, reason);
+
+	if (should_prepare_phy_clocks)
+		prepare_phy_clocks_for_destructive_link_verification(link->dc);
+
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		struct dc_link_settings known_limit_link_setting =
+				dp_get_max_link_cap(link);
+		set_all_streams_dpms_off_for_link(link);
+		dp_verify_link_cap_with_retries(
+				link, &known_limit_link_setting,
+				LINK_TRAINING_MAX_VERIFY_RETRY);
+	} else {
+		ASSERT(0);
+	}
+
+	if (should_prepare_phy_clocks)
+		restore_phy_clocks_for_destructive_link_verification(link->dc);
+}
+
+static void verify_link_capability_non_destructive(struct dc_link *link)
+{
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		if (dc_is_embedded_signal(link->local_sink->sink_signal) ||
+				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+			/* TODO - should we check link encoder's max link caps here?
+			 * How do we know which link encoder to check from?
+			 */
+			link->verified_link_cap = link->reported_link_cap;
+		else
+			link->verified_link_cap = dp_get_max_link_cap(link);
+	}
+}
+
+static bool should_verify_link_capability_destructively(struct dc_link *link,
+		enum dc_detect_reason reason)
+{
+	bool destrictive = false;
+	struct dc_link_settings max_link_cap;
+	bool is_link_enc_unavailable = link->link_enc &&
+			link->dc->res_pool->funcs->link_encs_assign &&
+			!link_enc_cfg_is_link_enc_avail(
+					link->ctx->dc,
+					link->link_enc->preferred_engine,
+					link);
+
+	if (dc_is_dp_signal(link->local_sink->sink_signal)) {
+		max_link_cap = dp_get_max_link_cap(link);
+		destrictive = true;
+
+		if (link->dc->debug.skip_detection_link_training ||
+				dc_is_embedded_signal(link->local_sink->sink_signal) ||
+				link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
+			destrictive = false;
+		} else if (link_dp_get_encoding_format(&max_link_cap) ==
+				DP_8b_10b_ENCODING) {
+			if (link->dpcd_caps.is_mst_capable ||
+					is_link_enc_unavailable) {
+				destrictive = false;
+			}
+		}
+	}
+
+	return destrictive;
+}
+
+static void verify_link_capability(struct dc_link *link, struct dc_sink *sink,
+		enum dc_detect_reason reason)
+{
+	if (should_verify_link_capability_destructively(link, reason))
+		verify_link_capability_destructive(link, sink, reason);
+	else
+		verify_link_capability_non_destructive(link);
+}
+
+/**
+ * detect_link_and_local_sink() - Detect if a sink is attached to a given link
+ *
+ * link->local_sink is created or destroyed as needed.
+ *
+ * This does not create remote sinks.
+ */
+static bool detect_link_and_local_sink(struct dc_link *link,
+				  enum dc_detect_reason reason)
+{
+	struct dc_sink_init_data sink_init_data = { 0 };
+	struct display_sink_capability sink_caps = { 0 };
+	uint32_t i;
+	bool converter_disable_audio = false;
+	struct audio_support *aud_support = &link->dc->res_pool->audio_support;
+	bool same_edid = false;
+	enum dc_edid_status edid_status;
+	struct dc_context *dc_ctx = link->ctx;
+	struct dc *dc = dc_ctx->dc;
+	struct dc_sink *sink = NULL;
+	struct dc_sink *prev_sink = NULL;
+	struct dpcd_caps prev_dpcd_caps;
+	enum dc_connection_type new_connection_type = dc_connection_none;
+	enum dc_connection_type pre_connection_type = dc_connection_none;
+	const uint32_t post_oui_delay = 30; // 30ms
+
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	if (dc_is_virtual_signal(link->connector_signal))
+		return false;
+
+	if (((link->connector_signal == SIGNAL_TYPE_LVDS ||
+		link->connector_signal == SIGNAL_TYPE_EDP) &&
+		(!link->dc->config.allow_edp_hotplug_detection)) &&
+		link->local_sink) {
+		// need to re-write OUI and brightness in resume case
+		if (link->connector_signal == SIGNAL_TYPE_EDP &&
+			(link->dpcd_sink_ext_caps.bits.oled == 1)) {
+			dpcd_set_source_specific_data(link);
+			msleep(post_oui_delay);
+			set_default_brightness_aux(link);
+			//TODO: use cached
+		}
+
+		return true;
+	}
+
+	if (!dc_link_detect_connection_type(link, &new_connection_type)) {
+		BREAK_TO_DEBUGGER();
+		return false;
+	}
+
+	prev_sink = link->local_sink;
+	if (prev_sink) {
+		dc_sink_retain(prev_sink);
+		memcpy(&prev_dpcd_caps, &link->dpcd_caps, sizeof(struct dpcd_caps));
+	}
+
+	link_disconnect_sink(link);
+	if (new_connection_type != dc_connection_none) {
+		pre_connection_type = link->type;
+		link->type = new_connection_type;
+		link->link_state_valid = false;
+
+		/* From Disconnected-to-Connected. */
+		switch (link->connector_signal) {
+		case SIGNAL_TYPE_HDMI_TYPE_A: {
+			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
+			if (aud_support->hdmi_audio_native)
+				sink_caps.signal = SIGNAL_TYPE_HDMI_TYPE_A;
+			else
+				sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+			break;
+		}
+
+		case SIGNAL_TYPE_DVI_SINGLE_LINK: {
+			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
+			sink_caps.signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+			break;
+		}
+
+		case SIGNAL_TYPE_DVI_DUAL_LINK: {
+			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
+			sink_caps.signal = SIGNAL_TYPE_DVI_DUAL_LINK;
+			break;
+		}
+
+		case SIGNAL_TYPE_LVDS: {
+			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C;
+			sink_caps.signal = SIGNAL_TYPE_LVDS;
+			break;
+		}
+
+		case SIGNAL_TYPE_EDP: {
+			detect_edp_sink_caps(link);
+			read_current_link_settings_on_detect(link);
+
+			/* Disable power sequence on MIPI panel + converter
+			 */
+			if (dc->config.enable_mipi_converter_optimization &&
+				dc_ctx->dce_version == DCN_VERSION_3_01 &&
+				link->dpcd_caps.sink_dev_id == DP_BRANCH_DEVICE_ID_0022B9 &&
+				memcmp(&link->dpcd_caps.branch_dev_name, DP_SINK_BRANCH_DEV_NAME_7580,
+					sizeof(link->dpcd_caps.branch_dev_name)) == 0) {
+				dc->config.edp_no_power_sequencing = true;
+
+				if (!link->dpcd_caps.set_power_state_capable_edp)
+					link->wa_flags.dp_keep_receiver_powered = true;
+			}
+
+			sink_caps.transaction_type = DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
+			sink_caps.signal = SIGNAL_TYPE_EDP;
+			break;
+		}
+
+		case SIGNAL_TYPE_DISPLAY_PORT: {
+
+			/* wa HPD high coming too early*/
+			if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
+			    link->link_enc->features.flags.bits.DP_IS_USB_C == 1) {
+
+				/* if alt mode times out, return false */
+				if (!wait_for_entering_dp_alt_mode(link))
+					return false;
+			}
+
+			if (!detect_dp(link, &sink_caps, reason)) {
+				if (prev_sink)
+					dc_sink_release(prev_sink);
+				return false;
+			}
+
+			/* Active SST downstream branch device unplug*/
+			if (link->type == dc_connection_sst_branch &&
+			    link->dpcd_caps.sink_count.bits.SINK_COUNT == 0) {
+				if (prev_sink)
+					/* Downstream unplug */
+					dc_sink_release(prev_sink);
+				return true;
+			}
+
+			/* disable audio for non DP to HDMI active sst converter */
+			if (link->type == dc_connection_sst_branch &&
+					is_dp_active_dongle(link) &&
+					(link->dpcd_caps.dongle_type !=
+							DISPLAY_DONGLE_DP_HDMI_CONVERTER))
+				converter_disable_audio = true;
+			break;
+		}
+
+		default:
+			DC_ERROR("Invalid connector type! signal:%d\n",
+				 link->connector_signal);
+			if (prev_sink)
+				dc_sink_release(prev_sink);
+			return false;
+		} /* switch() */
+
+		if (link->dpcd_caps.sink_count.bits.SINK_COUNT)
+			link->dpcd_sink_count =
+				link->dpcd_caps.sink_count.bits.SINK_COUNT;
+		else
+			link->dpcd_sink_count = 1;
+
+		set_ddc_transaction_type(link->ddc,
+						     sink_caps.transaction_type);
+
+		link->aux_mode =
+			link_is_in_aux_transaction_mode(link->ddc);
+
+		sink_init_data.link = link;
+		sink_init_data.sink_signal = sink_caps.signal;
+
+		sink = dc_sink_create(&sink_init_data);
+		if (!sink) {
+			DC_ERROR("Failed to create sink!\n");
+			if (prev_sink)
+				dc_sink_release(prev_sink);
+			return false;
+		}
+
+		sink->link->dongle_max_pix_clk = sink_caps.max_hdmi_pixel_clock;
+		sink->converter_disable_audio = converter_disable_audio;
+
+		/* dc_sink_create returns a new reference */
+		link->local_sink = sink;
+
+		edid_status = dm_helpers_read_local_edid(link->ctx,
+							 link, sink);
+
+		switch (edid_status) {
+		case EDID_BAD_CHECKSUM:
+			DC_LOG_ERROR("EDID checksum invalid.\n");
+			break;
+		case EDID_PARTIAL_VALID:
+			DC_LOG_ERROR("Partial EDID valid, abandon invalid blocks.\n");
+			break;
+		case EDID_NO_RESPONSE:
+			DC_LOG_ERROR("No EDID read.\n");
+			/*
+			 * Abort detection for non-DP connectors if we have
+			 * no EDID
+			 *
+			 * DP needs to report as connected if HDP is high
+			 * even if we have no EDID in order to go to
+			 * fail-safe mode
+			 */
+			if (dc_is_hdmi_signal(link->connector_signal) ||
+			    dc_is_dvi_signal(link->connector_signal)) {
+				if (prev_sink)
+					dc_sink_release(prev_sink);
+
+				return false;
+			}
+
+			if (link->type == dc_connection_sst_branch &&
+					link->dpcd_caps.dongle_type ==
+						DISPLAY_DONGLE_DP_VGA_CONVERTER &&
+					reason == DETECT_REASON_HPDRX) {
+				/* Abort detection for DP-VGA adapters when EDID
+				 * can't be read and detection reason is VGA-side
+				 * hotplug
+				 */
+				if (prev_sink)
+					dc_sink_release(prev_sink);
+				link_disconnect_sink(link);
+
+				return true;
+			}
+
+			break;
+		default:
+			break;
+		}
+
+		// Check if edid is the same
+		if ((prev_sink) &&
+		    (edid_status == EDID_THE_SAME || edid_status == EDID_OK))
+			same_edid = is_same_edid(&prev_sink->dc_edid,
+						 &sink->dc_edid);
+
+		if (sink->edid_caps.panel_patch.skip_scdc_overwrite)
+			link->ctx->dc->debug.hdmi20_disable = true;
+
+		if (dc_is_hdmi_signal(link->connector_signal))
+			read_scdc_caps(link->ddc, link->local_sink);
+
+		if (link->connector_signal == SIGNAL_TYPE_DISPLAY_PORT &&
+		    sink_caps.transaction_type ==
+		    DDC_TRANSACTION_TYPE_I2C_OVER_AUX) {
+			/*
+			 * TODO debug why certain monitors don't like
+			 *  two link trainings
+			 */
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+			query_hdcp_capability(sink->sink_signal, link);
+#endif
+		} else {
+			// If edid is the same, then discard new sink and revert back to original sink
+			if (same_edid) {
+				link_disconnect_remap(prev_sink, link);
+				sink = prev_sink;
+				prev_sink = NULL;
+			}
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+			query_hdcp_capability(sink->sink_signal, link);
+#endif
+		}
+
+		/* HDMI-DVI Dongle */
+		if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A &&
+		    !sink->edid_caps.edid_hdmi)
+			sink->sink_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+
+		if (link->local_sink && dc_is_dp_signal(sink_caps.signal))
+			dp_trace_init(link);
+
+		/* Connectivity log: detection */
+		for (i = 0; i < sink->dc_edid.length / DC_EDID_BLOCK_SIZE; i++) {
+			CONN_DATA_DETECT(link,
+					 &sink->dc_edid.raw_edid[i * DC_EDID_BLOCK_SIZE],
+					 DC_EDID_BLOCK_SIZE,
+					 "%s: [Block %d] ", sink->edid_caps.display_name, i);
+		}
+
+		DC_LOG_DETECTION_EDID_PARSER("%s: "
+			"manufacturer_id = %X, "
+			"product_id = %X, "
+			"serial_number = %X, "
+			"manufacture_week = %d, "
+			"manufacture_year = %d, "
+			"display_name = %s, "
+			"speaker_flag = %d, "
+			"audio_mode_count = %d\n",
+			__func__,
+			sink->edid_caps.manufacturer_id,
+			sink->edid_caps.product_id,
+			sink->edid_caps.serial_number,
+			sink->edid_caps.manufacture_week,
+			sink->edid_caps.manufacture_year,
+			sink->edid_caps.display_name,
+			sink->edid_caps.speaker_flags,
+			sink->edid_caps.audio_mode_count);
+
+		for (i = 0; i < sink->edid_caps.audio_mode_count; i++) {
+			DC_LOG_DETECTION_EDID_PARSER("%s: mode number = %d, "
+				"format_code = %d, "
+				"channel_count = %d, "
+				"sample_rate = %d, "
+				"sample_size = %d\n",
+				__func__,
+				i,
+				sink->edid_caps.audio_modes[i].format_code,
+				sink->edid_caps.audio_modes[i].channel_count,
+				sink->edid_caps.audio_modes[i].sample_rate,
+				sink->edid_caps.audio_modes[i].sample_size);
+		}
+
+		if (link->connector_signal == SIGNAL_TYPE_EDP) {
+			// Init dc_panel_config by HW config
+			if (dc_ctx->dc->res_pool->funcs->get_panel_config_defaults)
+				dc_ctx->dc->res_pool->funcs->get_panel_config_defaults(&link->panel_config);
+			// Pickup base DM settings
+			dm_helpers_init_panel_settings(dc_ctx, &link->panel_config, sink);
+			// Override dc_panel_config if system has specific settings
+			dm_helpers_override_panel_settings(dc_ctx, &link->panel_config);
+		}
+
+	} else {
+		/* From Connected-to-Disconnected. */
+		link->type = dc_connection_none;
+		sink_caps.signal = SIGNAL_TYPE_NONE;
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+		memset(&link->hdcp_caps, 0, sizeof(struct hdcp_caps));
+#endif
+		/* When we unplug a passive DP-HDMI dongle connection, dongle_max_pix_clk
+		 *  is not cleared. If we emulate a DP signal on this connection, it thinks
+		 *  the dongle is still there and limits the number of modes we can emulate.
+		 *  Clear dongle_max_pix_clk on disconnect to fix this
+		 */
+		link->dongle_max_pix_clk = 0;
+
+		dc_link_clear_dprx_states(link);
+		dp_trace_reset(link);
+	}
+
+	LINK_INFO("link=%d, dc_sink_in=%p is now %s prev_sink=%p edid same=%d\n",
+		  link->link_index, sink,
+		  (sink_caps.signal ==
+		   SIGNAL_TYPE_NONE ? "Disconnected" : "Connected"),
+		  prev_sink, same_edid);
+
+	if (prev_sink)
+		dc_sink_release(prev_sink);
+
+	return true;
+}
+
+/**
+ * dc_link_detect_connection_type() - Determine if there is a sink connected
+ *
+ * @type: Returned connection type
+ * Does not detect downstream devices, such as MST sinks
+ * or display connected through active dongles
+ */
+bool dc_link_detect_connection_type(struct dc_link *link, enum dc_connection_type *type)
+{
+	uint32_t is_hpd_high = 0;
+
+	if (link->connector_signal == SIGNAL_TYPE_LVDS) {
+		*type = dc_connection_single;
+		return true;
+	}
+
+	if (link->connector_signal == SIGNAL_TYPE_EDP) {
+		/*in case it is not on*/
+		if (!link->dc->config.edp_no_power_sequencing)
+			link->dc->hwss.edp_power_control(link, true);
+		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
+	}
+
+	/* Link may not have physical HPD pin. */
+	if (link->ep_type != DISPLAY_ENDPOINT_PHY) {
+		if (link->is_hpd_pending || !dc_link_dpia_query_hpd_status(link))
+			*type = dc_connection_none;
+		else
+			*type = dc_connection_single;
+
+		return true;
+	}
+
+
+	if (!query_hpd_status(link, &is_hpd_high))
+		goto hpd_gpio_failure;
+
+	if (is_hpd_high) {
+		*type = dc_connection_single;
+		/* TODO: need to do the actual detection */
+	} else {
+		*type = dc_connection_none;
+	}
+
+	return true;
+
+hpd_gpio_failure:
+	return false;
+}
+
+bool dc_link_detect(struct dc_link *link, enum dc_detect_reason reason)
+{
+	bool is_local_sink_detect_success;
+	bool is_delegated_to_mst_top_mgr = false;
+	enum dc_connection_type pre_link_type = link->type;
+
+	is_local_sink_detect_success = detect_link_and_local_sink(link, reason);
+
+	if (is_local_sink_detect_success && link->local_sink)
+		verify_link_capability(link, link->local_sink, reason);
+
+	if (is_local_sink_detect_success && link->local_sink &&
+			dc_is_dp_signal(link->local_sink->sink_signal) &&
+			link->dpcd_caps.is_mst_capable)
+		is_delegated_to_mst_top_mgr = discover_dp_mst_topology(link, reason);
+
+	if (is_local_sink_detect_success &&
+			pre_link_type == dc_connection_mst_branch &&
+			link->type != dc_connection_mst_branch)
+		is_delegated_to_mst_top_mgr = reset_cur_dp_mst_topology(link);
+
+	return is_local_sink_detect_success && !is_delegated_to_mst_top_mgr;
+}
+
+void dc_link_clear_dprx_states(struct dc_link *link)
+{
+	memset(&link->dprx_states, 0, sizeof(link->dprx_states));
+}
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+
+bool dc_link_is_hdcp14(struct dc_link *link, enum signal_type signal)
+{
+	bool ret = false;
+
+	switch (signal)	{
+	case SIGNAL_TYPE_DISPLAY_PORT:
+	case SIGNAL_TYPE_DISPLAY_PORT_MST:
+		ret = link->hdcp_caps.bcaps.bits.HDCP_CAPABLE;
+		break;
+	case SIGNAL_TYPE_DVI_SINGLE_LINK:
+	case SIGNAL_TYPE_DVI_DUAL_LINK:
+	case SIGNAL_TYPE_HDMI_TYPE_A:
+	/* HDMI doesn't tell us its HDCP(1.4) capability, so assume to always be capable,
+	 * we can poll for bksv but some displays have an issue with this. Since its so rare
+	 * for a display to not be 1.4 capable, this assumtion is ok
+	 */
+		ret = true;
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+
+bool dc_link_is_hdcp22(struct dc_link *link, enum signal_type signal)
+{
+	bool ret = false;
+
+	switch (signal)	{
+	case SIGNAL_TYPE_DISPLAY_PORT:
+	case SIGNAL_TYPE_DISPLAY_PORT_MST:
+		ret = (link->hdcp_caps.bcaps.bits.HDCP_CAPABLE &&
+				link->hdcp_caps.rx_caps.fields.byte0.hdcp_capable &&
+				(link->hdcp_caps.rx_caps.fields.version == 0x2)) ? 1 : 0;
+		break;
+	case SIGNAL_TYPE_DVI_SINGLE_LINK:
+	case SIGNAL_TYPE_DVI_DUAL_LINK:
+	case SIGNAL_TYPE_HDMI_TYPE_A:
+		ret = (link->hdcp_caps.rx_caps.fields.version == 0x4) ? 1:0;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+#endif // CONFIG_DRM_AMD_DC_HDCP
+
+const struct dc_link_status *dc_link_get_status(const struct dc_link *link)
+{
+	return &link->link_status;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.h b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
new file mode 100644
index 000000000000..1831636516fb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.h
@@ -0,0 +1,30 @@
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
+#ifndef __DC_LINK_DETECTION_H__
+#define __DC_LINK_DETECTION_H__
+#include "link.h"
+
+#endif /* __DC_LINK_DETECTION_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.c b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
new file mode 100644
index 000000000000..9cdfa7f7dc77
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.c
@@ -0,0 +1,2395 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file owns the programming sequence of stream's dpms state associated
+ * with the link and link's enable/disable sequences as result of the stream's
+ * dpms state change.
+ *
+ * TODO - The reason link owns stream's dpms programming sequence is
+ * because dpms programming sequence is highly dependent on underlying signal
+ * specific link protocols. This unfortunately causes link to own a portion of
+ * stream state programming sequence. This creates a gray area where the
+ * boundary between link and stream is not clearly defined.
+ */
+
+#include "link_dpms.h"
+#include "link_hwss.h"
+#include "accessories/link_fpga.h"
+#include "accessories/link_dp_trace.h"
+#include "protocols/link_dpcd.h"
+#include "protocols/link_ddc.h"
+#include "protocols/link_hpd.h"
+#include "protocols/link_dp_phy.h"
+#include "protocols/link_dp_capability.h"
+#include "protocols/link_dp_training.h"
+#include "protocols/link_edp_panel_control.h"
+
+#include "dm_helpers.h"
+#include "link_enc_cfg.h"
+#include "resource.h"
+#include "dsc.h"
+#include "link_hwss.h"
+#include "dccg.h"
+#include "clk_mgr.h"
+#include "atomfirmware.h"
+#define DC_LOGGER_INIT(logger)
+
+#define LINK_INFO(...) \
+	DC_LOG_HW_HOTPLUG(  \
+		__VA_ARGS__)
+
+#define RETIMER_REDRIVER_INFO(...) \
+	DC_LOG_RETIMER_REDRIVER(  \
+		__VA_ARGS__)
+#include "dc/dcn30/dcn30_vpg.h"
+
+#define MAX_MTP_SLOT_COUNT 64
+#define LINK_TRAINING_ATTEMPTS 4
+#define PEAK_FACTOR_X1000 1006
+
+void link_blank_all_dp_displays(struct dc *dc)
+{
+	unsigned int i;
+	uint8_t dpcd_power_state = '\0';
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+
+	for (i = 0; i < dc->link_count; i++) {
+		if ((dc->links[i]->connector_signal != SIGNAL_TYPE_DISPLAY_PORT) ||
+			(dc->links[i]->priv == NULL) || (dc->links[i]->local_sink == NULL))
+			continue;
+
+		/* DP 2.0 spec requires that we read LTTPR caps first */
+		dp_retrieve_lttpr_cap(dc->links[i]);
+		/* if any of the displays are lit up turn them off */
+		status = core_link_read_dpcd(dc->links[i], DP_SET_POWER,
+							&dpcd_power_state, sizeof(dpcd_power_state));
+
+		if (status == DC_OK && dpcd_power_state == DP_POWER_STATE_D0)
+			link_blank_dp_stream(dc->links[i], true);
+	}
+
+}
+
+void link_blank_all_edp_displays(struct dc *dc)
+{
+	unsigned int i;
+	uint8_t dpcd_power_state = '\0';
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+
+	for (i = 0; i < dc->link_count; i++) {
+		if ((dc->links[i]->connector_signal != SIGNAL_TYPE_EDP) ||
+			(!dc->links[i]->edp_sink_present))
+			continue;
+
+		/* if any of the displays are lit up turn them off */
+		status = core_link_read_dpcd(dc->links[i], DP_SET_POWER,
+							&dpcd_power_state, sizeof(dpcd_power_state));
+
+		if (status == DC_OK && dpcd_power_state == DP_POWER_STATE_D0)
+			link_blank_dp_stream(dc->links[i], true);
+	}
+}
+
+void link_blank_dp_stream(struct dc_link *link, bool hw_init)
+{
+	unsigned int j;
+	struct dc  *dc = link->ctx->dc;
+	enum signal_type signal = link->connector_signal;
+
+	if ((signal == SIGNAL_TYPE_EDP) ||
+		(signal == SIGNAL_TYPE_DISPLAY_PORT)) {
+		if (link->ep_type == DISPLAY_ENDPOINT_PHY &&
+			link->link_enc->funcs->get_dig_frontend &&
+			link->link_enc->funcs->is_dig_enabled(link->link_enc)) {
+			unsigned int fe = link->link_enc->funcs->get_dig_frontend(link->link_enc);
+
+			if (fe != ENGINE_ID_UNKNOWN)
+				for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
+					if (fe == dc->res_pool->stream_enc[j]->id) {
+						dc->res_pool->stream_enc[j]->funcs->dp_blank(link,
+									dc->res_pool->stream_enc[j]);
+						break;
+					}
+				}
+		}
+
+		if ((!link->wa_flags.dp_keep_receiver_powered) || hw_init)
+			dc_link_dp_receiver_power_ctrl(link, false);
+	}
+}
+
+void link_resume(struct dc_link *link)
+{
+	if (link->connector_signal != SIGNAL_TYPE_VIRTUAL)
+		program_hpd_filter(link);
+}
+
+static bool get_ext_hdmi_settings(struct pipe_ctx *pipe_ctx,
+		enum engine_id eng_id,
+		struct ext_hdmi_settings *settings)
+{
+	bool result = false;
+	int i = 0;
+	struct integrated_info *integrated_info =
+			pipe_ctx->stream->ctx->dc_bios->integrated_info;
+
+	if (integrated_info == NULL)
+		return false;
+
+	/*
+	 * Get retimer settings from sbios for passing SI eye test for DCE11
+	 * The setting values are varied based on board revision and port id
+	 * Therefore the setting values of each ports is passed by sbios.
+	 */
+
+	// Check if current bios contains ext Hdmi settings
+	if (integrated_info->gpu_cap_info & 0x20) {
+		switch (eng_id) {
+		case ENGINE_ID_DIGA:
+			settings->slv_addr = integrated_info->dp0_ext_hdmi_slv_addr;
+			settings->reg_num = integrated_info->dp0_ext_hdmi_6g_reg_num;
+			settings->reg_num_6g = integrated_info->dp0_ext_hdmi_6g_reg_num;
+			memmove(settings->reg_settings,
+					integrated_info->dp0_ext_hdmi_reg_settings,
+					sizeof(integrated_info->dp0_ext_hdmi_reg_settings));
+			memmove(settings->reg_settings_6g,
+					integrated_info->dp0_ext_hdmi_6g_reg_settings,
+					sizeof(integrated_info->dp0_ext_hdmi_6g_reg_settings));
+			result = true;
+			break;
+		case ENGINE_ID_DIGB:
+			settings->slv_addr = integrated_info->dp1_ext_hdmi_slv_addr;
+			settings->reg_num = integrated_info->dp1_ext_hdmi_6g_reg_num;
+			settings->reg_num_6g = integrated_info->dp1_ext_hdmi_6g_reg_num;
+			memmove(settings->reg_settings,
+					integrated_info->dp1_ext_hdmi_reg_settings,
+					sizeof(integrated_info->dp1_ext_hdmi_reg_settings));
+			memmove(settings->reg_settings_6g,
+					integrated_info->dp1_ext_hdmi_6g_reg_settings,
+					sizeof(integrated_info->dp1_ext_hdmi_6g_reg_settings));
+			result = true;
+			break;
+		case ENGINE_ID_DIGC:
+			settings->slv_addr = integrated_info->dp2_ext_hdmi_slv_addr;
+			settings->reg_num = integrated_info->dp2_ext_hdmi_6g_reg_num;
+			settings->reg_num_6g = integrated_info->dp2_ext_hdmi_6g_reg_num;
+			memmove(settings->reg_settings,
+					integrated_info->dp2_ext_hdmi_reg_settings,
+					sizeof(integrated_info->dp2_ext_hdmi_reg_settings));
+			memmove(settings->reg_settings_6g,
+					integrated_info->dp2_ext_hdmi_6g_reg_settings,
+					sizeof(integrated_info->dp2_ext_hdmi_6g_reg_settings));
+			result = true;
+			break;
+		case ENGINE_ID_DIGD:
+			settings->slv_addr = integrated_info->dp3_ext_hdmi_slv_addr;
+			settings->reg_num = integrated_info->dp3_ext_hdmi_6g_reg_num;
+			settings->reg_num_6g = integrated_info->dp3_ext_hdmi_6g_reg_num;
+			memmove(settings->reg_settings,
+					integrated_info->dp3_ext_hdmi_reg_settings,
+					sizeof(integrated_info->dp3_ext_hdmi_reg_settings));
+			memmove(settings->reg_settings_6g,
+					integrated_info->dp3_ext_hdmi_6g_reg_settings,
+					sizeof(integrated_info->dp3_ext_hdmi_6g_reg_settings));
+			result = true;
+			break;
+		default:
+			break;
+		}
+
+		if (result == true) {
+			// Validate settings from bios integrated info table
+			if (settings->slv_addr == 0)
+				return false;
+			if (settings->reg_num > 9)
+				return false;
+			if (settings->reg_num_6g > 3)
+				return false;
+
+			for (i = 0; i < settings->reg_num; i++) {
+				if (settings->reg_settings[i].i2c_reg_index > 0x20)
+					return false;
+			}
+
+			for (i = 0; i < settings->reg_num_6g; i++) {
+				if (settings->reg_settings_6g[i].i2c_reg_index > 0x20)
+					return false;
+			}
+		}
+	}
+
+	return result;
+}
+
+static bool write_i2c(struct pipe_ctx *pipe_ctx,
+		uint8_t address, uint8_t *buffer, uint32_t length)
+{
+	struct i2c_command cmd = {0};
+	struct i2c_payload payload = {0};
+
+	memset(&payload, 0, sizeof(payload));
+	memset(&cmd, 0, sizeof(cmd));
+
+	cmd.number_of_payloads = 1;
+	cmd.engine = I2C_COMMAND_ENGINE_DEFAULT;
+	cmd.speed = pipe_ctx->stream->ctx->dc->caps.i2c_speed_in_khz;
+
+	payload.address = address;
+	payload.data = buffer;
+	payload.length = length;
+	payload.write = true;
+	cmd.payloads = &payload;
+
+	if (dm_helpers_submit_i2c(pipe_ctx->stream->ctx,
+			pipe_ctx->stream->link, &cmd))
+		return true;
+
+	return false;
+}
+
+static void write_i2c_retimer_setting(
+		struct pipe_ctx *pipe_ctx,
+		bool is_vga_mode,
+		bool is_over_340mhz,
+		struct ext_hdmi_settings *settings)
+{
+	uint8_t slave_address = (settings->slv_addr >> 1);
+	uint8_t buffer[2];
+	const uint8_t apply_rx_tx_change = 0x4;
+	uint8_t offset = 0xA;
+	uint8_t value = 0;
+	int i = 0;
+	bool i2c_success = false;
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	memset(&buffer, 0, sizeof(buffer));
+
+	/* Start Ext-Hdmi programming*/
+
+	for (i = 0; i < settings->reg_num; i++) {
+		/* Apply 3G settings */
+		if (settings->reg_settings[i].i2c_reg_index <= 0x20) {
+
+			buffer[0] = settings->reg_settings[i].i2c_reg_index;
+			buffer[1] = settings->reg_settings[i].i2c_reg_val;
+			i2c_success = write_i2c(pipe_ctx, slave_address,
+						buffer, sizeof(buffer));
+			RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+				offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
+				slave_address, buffer[0], buffer[1], i2c_success?1:0);
+
+			if (!i2c_success)
+				goto i2c_write_fail;
+
+			/* Based on DP159 specs, APPLY_RX_TX_CHANGE bit in 0x0A
+			 * needs to be set to 1 on every 0xA-0xC write.
+			 */
+			if (settings->reg_settings[i].i2c_reg_index == 0xA ||
+				settings->reg_settings[i].i2c_reg_index == 0xB ||
+				settings->reg_settings[i].i2c_reg_index == 0xC) {
+
+				/* Query current value from offset 0xA */
+				if (settings->reg_settings[i].i2c_reg_index == 0xA)
+					value = settings->reg_settings[i].i2c_reg_val;
+				else {
+					i2c_success =
+						link_query_ddc_data(
+						pipe_ctx->stream->link->ddc,
+						slave_address, &offset, 1, &value, 1);
+					if (!i2c_success)
+						goto i2c_write_fail;
+				}
+
+				buffer[0] = offset;
+				/* Set APPLY_RX_TX_CHANGE bit to 1 */
+				buffer[1] = value | apply_rx_tx_change;
+				i2c_success = write_i2c(pipe_ctx, slave_address,
+						buffer, sizeof(buffer));
+				RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+					offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+					slave_address, buffer[0], buffer[1], i2c_success?1:0);
+				if (!i2c_success)
+					goto i2c_write_fail;
+			}
+		}
+	}
+
+	/* Apply 3G settings */
+	if (is_over_340mhz) {
+		for (i = 0; i < settings->reg_num_6g; i++) {
+			/* Apply 3G settings */
+			if (settings->reg_settings[i].i2c_reg_index <= 0x20) {
+
+				buffer[0] = settings->reg_settings_6g[i].i2c_reg_index;
+				buffer[1] = settings->reg_settings_6g[i].i2c_reg_val;
+				i2c_success = write_i2c(pipe_ctx, slave_address,
+							buffer, sizeof(buffer));
+				RETIMER_REDRIVER_INFO("above 340Mhz: retimer write to slave_address = 0x%x,\
+					offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+					slave_address, buffer[0], buffer[1], i2c_success?1:0);
+
+				if (!i2c_success)
+					goto i2c_write_fail;
+
+				/* Based on DP159 specs, APPLY_RX_TX_CHANGE bit in 0x0A
+				 * needs to be set to 1 on every 0xA-0xC write.
+				 */
+				if (settings->reg_settings_6g[i].i2c_reg_index == 0xA ||
+					settings->reg_settings_6g[i].i2c_reg_index == 0xB ||
+					settings->reg_settings_6g[i].i2c_reg_index == 0xC) {
+
+					/* Query current value from offset 0xA */
+					if (settings->reg_settings_6g[i].i2c_reg_index == 0xA)
+						value = settings->reg_settings_6g[i].i2c_reg_val;
+					else {
+						i2c_success =
+								link_query_ddc_data(
+								pipe_ctx->stream->link->ddc,
+								slave_address, &offset, 1, &value, 1);
+						if (!i2c_success)
+							goto i2c_write_fail;
+					}
+
+					buffer[0] = offset;
+					/* Set APPLY_RX_TX_CHANGE bit to 1 */
+					buffer[1] = value | apply_rx_tx_change;
+					i2c_success = write_i2c(pipe_ctx, slave_address,
+							buffer, sizeof(buffer));
+					RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+						offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+						slave_address, buffer[0], buffer[1], i2c_success?1:0);
+					if (!i2c_success)
+						goto i2c_write_fail;
+				}
+			}
+		}
+	}
+
+	if (is_vga_mode) {
+		/* Program additional settings if using 640x480 resolution */
+
+		/* Write offset 0xFF to 0x01 */
+		buffer[0] = 0xff;
+		buffer[1] = 0x01;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+				offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+				slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+
+		/* Write offset 0x00 to 0x23 */
+		buffer[0] = 0x00;
+		buffer[1] = 0x23;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+			slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+
+		/* Write offset 0xff to 0x00 */
+		buffer[0] = 0xff;
+		buffer[1] = 0x00;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write to slave_address = 0x%x,\
+			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+			slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+
+	}
+
+	return;
+
+i2c_write_fail:
+	DC_LOG_DEBUG("Set retimer failed");
+}
+
+static void write_i2c_default_retimer_setting(
+		struct pipe_ctx *pipe_ctx,
+		bool is_vga_mode,
+		bool is_over_340mhz)
+{
+	uint8_t slave_address = (0xBA >> 1);
+	uint8_t buffer[2];
+	bool i2c_success = false;
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	memset(&buffer, 0, sizeof(buffer));
+
+	/* Program Slave Address for tuning single integrity */
+	/* Write offset 0x0A to 0x13 */
+	buffer[0] = 0x0A;
+	buffer[1] = 0x13;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer writes default setting to slave_address = 0x%x,\
+		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+	/* Write offset 0x0A to 0x17 */
+	buffer[0] = 0x0A;
+	buffer[1] = 0x17;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+	/* Write offset 0x0B to 0xDA or 0xD8 */
+	buffer[0] = 0x0B;
+	buffer[1] = is_over_340mhz ? 0xDA : 0xD8;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+	/* Write offset 0x0A to 0x17 */
+	buffer[0] = 0x0A;
+	buffer[1] = 0x17;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+		offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+	/* Write offset 0x0C to 0x1D or 0x91 */
+	buffer[0] = 0x0C;
+	buffer[1] = is_over_340mhz ? 0x1D : 0x91;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+	/* Write offset 0x0A to 0x17 */
+	buffer[0] = 0x0A;
+	buffer[1] = 0x17;
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+			buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+		offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+		slave_address, buffer[0], buffer[1], i2c_success?1:0);
+	if (!i2c_success)
+		goto i2c_write_fail;
+
+
+	if (is_vga_mode) {
+		/* Program additional settings if using 640x480 resolution */
+
+		/* Write offset 0xFF to 0x01 */
+		buffer[0] = 0xff;
+		buffer[1] = 0x01;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+			offset = 0x%x, reg_val = 0x%x, i2c_success = %d\n",
+			slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+
+		/* Write offset 0x00 to 0x23 */
+		buffer[0] = 0x00;
+		buffer[1] = 0x23;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write to slave_addr = 0x%x,\
+			offset = 0x%x, reg_val= 0x%x, i2c_success = %d\n",
+			slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+
+		/* Write offset 0xff to 0x00 */
+		buffer[0] = 0xff;
+		buffer[1] = 0x00;
+		i2c_success = write_i2c(pipe_ctx, slave_address,
+				buffer, sizeof(buffer));
+		RETIMER_REDRIVER_INFO("retimer write default setting to slave_addr = 0x%x,\
+			offset = 0x%x, reg_val= 0x%x, i2c_success = %d end here\n",
+			slave_address, buffer[0], buffer[1], i2c_success?1:0);
+		if (!i2c_success)
+			goto i2c_write_fail;
+	}
+
+	return;
+
+i2c_write_fail:
+	DC_LOG_DEBUG("Set default retimer failed");
+}
+
+static void write_i2c_redriver_setting(
+		struct pipe_ctx *pipe_ctx,
+		bool is_over_340mhz)
+{
+	uint8_t slave_address = (0xF0 >> 1);
+	uint8_t buffer[16];
+	bool i2c_success = false;
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	memset(&buffer, 0, sizeof(buffer));
+
+	// Program Slave Address for tuning single integrity
+	buffer[3] = 0x4E;
+	buffer[4] = 0x4E;
+	buffer[5] = 0x4E;
+	buffer[6] = is_over_340mhz ? 0x4E : 0x4A;
+
+	i2c_success = write_i2c(pipe_ctx, slave_address,
+					buffer, sizeof(buffer));
+	RETIMER_REDRIVER_INFO("redriver write 0 to all 16 reg offset expect following:\n\
+		\t slave_addr = 0x%x, offset[3] = 0x%x, offset[4] = 0x%x,\
+		offset[5] = 0x%x,offset[6] is_over_340mhz = 0x%x,\
+		i2c_success = %d\n",
+		slave_address, buffer[3], buffer[4], buffer[5], buffer[6], i2c_success?1:0);
+
+	if (!i2c_success)
+		DC_LOG_DEBUG("Set redriver failed");
+}
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+
+static void update_psp_stream_config(struct pipe_ctx *pipe_ctx, bool dpms_off)
+{
+	struct cp_psp *cp_psp = &pipe_ctx->stream->ctx->cp_psp;
+	struct link_encoder *link_enc = NULL;
+	struct cp_psp_stream_config config = {0};
+	enum dp_panel_mode panel_mode =
+			dp_get_panel_mode(pipe_ctx->stream->link);
+
+	if (cp_psp == NULL || cp_psp->funcs.update_stream_config == NULL)
+		return;
+
+	link_enc = link_enc_cfg_get_link_enc(pipe_ctx->stream->link);
+	ASSERT(link_enc);
+	if (link_enc == NULL)
+		return;
+
+	/* otg instance */
+	config.otg_inst = (uint8_t) pipe_ctx->stream_res.tg->inst;
+
+	/* dig front end */
+	config.dig_fe = (uint8_t) pipe_ctx->stream_res.stream_enc->stream_enc_inst;
+
+	/* stream encoder index */
+	config.stream_enc_idx = pipe_ctx->stream_res.stream_enc->id - ENGINE_ID_DIGA;
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
+		config.stream_enc_idx =
+				pipe_ctx->stream_res.hpo_dp_stream_enc->id - ENGINE_ID_HPO_DP_0;
+
+	/* dig back end */
+	config.dig_be = pipe_ctx->stream->link->link_enc_hw_inst;
+
+	/* link encoder index */
+	config.link_enc_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
+		config.link_enc_idx = pipe_ctx->link_res.hpo_dp_link_enc->inst;
+
+	/* dio output index is dpia index for DPIA endpoint & dcio index by default */
+	if (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+		config.dio_output_idx = pipe_ctx->stream->link->link_id.enum_id - ENUM_ID_1;
+	else
+		config.dio_output_idx = link_enc->transmitter - TRANSMITTER_UNIPHY_A;
+
+
+	/* phy index */
+	config.phy_idx = resource_transmitter_to_phy_idx(
+			pipe_ctx->stream->link->dc, link_enc->transmitter);
+	if (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+		/* USB4 DPIA doesn't use PHY in our soc, initialize it to 0 */
+		config.phy_idx = 0;
+
+	/* stream properties */
+	config.assr_enabled = (panel_mode == DP_PANEL_MODE_EDP) ? 1 : 0;
+	config.mst_enabled = (pipe_ctx->stream->signal ==
+			SIGNAL_TYPE_DISPLAY_PORT_MST) ? 1 : 0;
+	config.dp2_enabled = link_is_dp_128b_132b_signal(pipe_ctx) ? 1 : 0;
+	config.usb4_enabled = (pipe_ctx->stream->link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) ?
+			1 : 0;
+	config.dpms_off = dpms_off;
+
+	/* dm stream context */
+	config.dm_stream_ctx = pipe_ctx->stream->dm_stream_context;
+
+	cp_psp->funcs.update_stream_config(cp_psp->handle, &config);
+}
+#endif
+
+static void set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	struct dc  *dc = pipe_ctx->stream->ctx->dc;
+
+	if (!dc_is_hdmi_signal(pipe_ctx->stream->signal))
+		return;
+
+	dc->hwss.set_avmute(pipe_ctx, enable);
+}
+
+static void enable_mst_on_sink(struct dc_link *link, bool enable)
+{
+	unsigned char mstmCntl;
+
+	core_link_read_dpcd(link, DP_MSTM_CTRL, &mstmCntl, 1);
+	if (enable)
+		mstmCntl |= DP_MST_EN;
+	else
+		mstmCntl &= (~DP_MST_EN);
+
+	core_link_write_dpcd(link, DP_MSTM_CTRL, &mstmCntl, 1);
+}
+
+static void dsc_optc_config_log(struct display_stream_compressor *dsc,
+		struct dsc_optc_config *config)
+{
+	uint32_t precision = 1 << 28;
+	uint32_t bytes_per_pixel_int = config->bytes_per_pixel / precision;
+	uint32_t bytes_per_pixel_mod = config->bytes_per_pixel % precision;
+	uint64_t ll_bytes_per_pix_fraq = bytes_per_pixel_mod;
+	DC_LOGGER_INIT(dsc->ctx->logger);
+
+	/* 7 fractional digits decimal precision for bytes per pixel is enough because DSC
+	 * bits per pixel precision is 1/16th of a pixel, which means bytes per pixel precision is
+	 * 1/16/8 = 1/128 of a byte, or 0.0078125 decimal
+	 */
+	ll_bytes_per_pix_fraq *= 10000000;
+	ll_bytes_per_pix_fraq /= precision;
+
+	DC_LOG_DSC("\tbytes_per_pixel 0x%08x (%d.%07d)",
+			config->bytes_per_pixel, bytes_per_pixel_int, (uint32_t)ll_bytes_per_pix_fraq);
+	DC_LOG_DSC("\tis_pixel_format_444 %d", config->is_pixel_format_444);
+	DC_LOG_DSC("\tslice_width %d", config->slice_width);
+}
+
+static bool dp_set_dsc_on_rx(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	bool result = false;
+
+	if (dc_is_virtual_signal(stream->signal) || IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		result = true;
+	else
+		result = dm_helpers_dp_write_dsc_enable(dc->ctx, stream, enable);
+	return result;
+}
+
+/* The stream with these settings can be sent (unblanked) only after DSC was enabled on RX first,
+ * i.e. after dp_enable_dsc_on_rx() had been called
+ */
+void link_set_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct pipe_ctx *odm_pipe;
+	int opp_cnt = 1;
+	DC_LOGGER_INIT(dsc->ctx->logger);
+
+	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
+		opp_cnt++;
+
+	if (enable) {
+		struct dsc_config dsc_cfg;
+		struct dsc_optc_config dsc_optc_cfg;
+		enum optc_dsc_mode optc_dsc_mode;
+
+		/* Enable DSC hw block */
+		dsc_cfg.pic_width = (stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right) / opp_cnt;
+		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
+		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
+		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
+		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
+		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
+
+		dsc->funcs->dsc_set_config(dsc, &dsc_cfg, &dsc_optc_cfg);
+		dsc->funcs->dsc_enable(dsc, pipe_ctx->stream_res.opp->inst);
+		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
+
+			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
+			odm_dsc->funcs->dsc_enable(odm_dsc, odm_pipe->stream_res.opp->inst);
+		}
+		dsc_cfg.dc_dsc_cfg.num_slices_h *= opp_cnt;
+		dsc_cfg.pic_width *= opp_cnt;
+
+		optc_dsc_mode = dsc_optc_cfg.is_pixel_format_444 ? OPTC_DSC_ENABLED_444 : OPTC_DSC_ENABLED_NATIVE_SUBSAMPLED;
+
+		/* Enable DSC in encoder */
+		if (dc_is_dp_signal(stream->signal) && !IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)
+				&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
+			DC_LOG_DSC("Setting stream encoder DSC config for engine %d:", (int)pipe_ctx->stream_res.stream_enc->id);
+			dsc_optc_config_log(dsc, &dsc_optc_cfg);
+			pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(pipe_ctx->stream_res.stream_enc,
+									optc_dsc_mode,
+									dsc_optc_cfg.bytes_per_pixel,
+									dsc_optc_cfg.slice_width);
+
+			/* PPS SDP is set elsewhere because it has to be done after DIG FE is connected to DIG BE */
+		}
+
+		/* Enable DSC in OPTC */
+		DC_LOG_DSC("Setting optc DSC config for tg instance %d:", pipe_ctx->stream_res.tg->inst);
+		dsc_optc_config_log(dsc, &dsc_optc_cfg);
+		pipe_ctx->stream_res.tg->funcs->set_dsc_config(pipe_ctx->stream_res.tg,
+							optc_dsc_mode,
+							dsc_optc_cfg.bytes_per_pixel,
+							dsc_optc_cfg.slice_width);
+	} else {
+		/* disable DSC in OPTC */
+		pipe_ctx->stream_res.tg->funcs->set_dsc_config(
+				pipe_ctx->stream_res.tg,
+				OPTC_DSC_DISABLED, 0, 0);
+
+		/* disable DSC in stream encoder */
+		if (dc_is_dp_signal(stream->signal)) {
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
+				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
+										pipe_ctx->stream_res.hpo_dp_stream_enc,
+										false,
+										NULL,
+										true);
+			else if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_config(
+						pipe_ctx->stream_res.stream_enc,
+						OPTC_DSC_DISABLED, 0, 0);
+				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
+							pipe_ctx->stream_res.stream_enc, false, NULL, true);
+			}
+		}
+
+		/* disable DSC block */
+		pipe_ctx->stream_res.dsc->funcs->dsc_disable(pipe_ctx->stream_res.dsc);
+		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
+			odm_pipe->stream_res.dsc->funcs->dsc_disable(odm_pipe->stream_res.dsc);
+	}
+}
+
+/*
+ * For dynamic bpp change case, dsc is programmed with MASTER_UPDATE_LOCK enabled;
+ * hence PPS info packet update need to use frame update instead of immediate update.
+ * Added parameter immediate_update for this purpose.
+ * The decision to use frame update is hard-coded in function dp_update_dsc_config(),
+ * which is the only place where a "false" would be passed in for param immediate_update.
+ *
+ * immediate_update is only applicable when DSC is enabled.
+ */
+bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx, bool enable, bool immediate_update)
+{
+	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	DC_LOGGER_INIT(dsc->ctx->logger);
+
+	if (!pipe_ctx->stream->timing.flags.DSC || !dsc)
+		return false;
+
+	if (enable) {
+		struct dsc_config dsc_cfg;
+		uint8_t dsc_packed_pps[128];
+
+		memset(&dsc_cfg, 0, sizeof(dsc_cfg));
+		memset(dsc_packed_pps, 0, 128);
+
+		/* Enable DSC hw block */
+		dsc_cfg.pic_width = stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right;
+		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
+		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
+		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
+		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
+
+		dsc->funcs->dsc_get_packed_pps(dsc, &dsc_cfg, &dsc_packed_pps[0]);
+		memcpy(&stream->dsc_packed_pps[0], &dsc_packed_pps[0], sizeof(stream->dsc_packed_pps));
+		if (dc_is_dp_signal(stream->signal)) {
+			DC_LOG_DSC("Setting stream encoder DSC PPS SDP for engine %d\n", (int)pipe_ctx->stream_res.stream_enc->id);
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
+				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
+										pipe_ctx->stream_res.hpo_dp_stream_enc,
+										true,
+										&dsc_packed_pps[0],
+										immediate_update);
+			else
+				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
+						pipe_ctx->stream_res.stream_enc,
+						true,
+						&dsc_packed_pps[0],
+						immediate_update);
+		}
+	} else {
+		/* disable DSC PPS in stream encoder */
+		memset(&stream->dsc_packed_pps[0], 0, sizeof(stream->dsc_packed_pps));
+		if (dc_is_dp_signal(stream->signal)) {
+			if (link_is_dp_128b_132b_signal(pipe_ctx))
+				pipe_ctx->stream_res.hpo_dp_stream_enc->funcs->dp_set_dsc_pps_info_packet(
+										pipe_ctx->stream_res.hpo_dp_stream_enc,
+										false,
+										NULL,
+										true);
+			else
+				pipe_ctx->stream_res.stream_enc->funcs->dp_set_dsc_pps_info_packet(
+						pipe_ctx->stream_res.stream_enc, false, NULL, true);
+		}
+	}
+
+	return true;
+}
+
+bool link_set_dsc_enable(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
+	bool result = false;
+
+	if (!pipe_ctx->stream->timing.flags.DSC)
+		goto out;
+	if (!dsc)
+		goto out;
+
+	if (enable) {
+		{
+			link_set_dsc_on_stream(pipe_ctx, true);
+			result = true;
+		}
+	} else {
+		dp_set_dsc_on_rx(pipe_ctx, false);
+		link_set_dsc_on_stream(pipe_ctx, false);
+		result = true;
+	}
+out:
+	return result;
+}
+
+bool dc_link_update_dsc_config(struct pipe_ctx *pipe_ctx)
+{
+	return link_update_dsc_config(pipe_ctx);
+}
+
+bool link_update_dsc_config(struct pipe_ctx *pipe_ctx)
+{
+	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
+
+	if (!pipe_ctx->stream->timing.flags.DSC)
+		return false;
+	if (!dsc)
+		return false;
+
+	link_set_dsc_on_stream(pipe_ctx, true);
+	link_set_dsc_pps_packet(pipe_ctx, true, false);
+	return true;
+}
+
+static void enable_stream_features(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+
+	if (pipe_ctx->stream->signal != SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		struct dc_link *link = stream->link;
+		union down_spread_ctrl old_downspread;
+		union down_spread_ctrl new_downspread;
+
+		memset(&old_downspread, 0, sizeof(old_downspread));
+
+		core_link_read_dpcd(link, DP_DOWNSPREAD_CTRL,
+				&old_downspread.raw, sizeof(old_downspread));
+
+		new_downspread.raw = old_downspread.raw;
+
+		new_downspread.bits.IGNORE_MSA_TIMING_PARAM =
+				(stream->ignore_msa_timing_param) ? 1 : 0;
+
+		if (new_downspread.raw != old_downspread.raw) {
+			core_link_write_dpcd(link, DP_DOWNSPREAD_CTRL,
+				&new_downspread.raw, sizeof(new_downspread));
+		}
+
+	} else {
+		dm_helpers_mst_enable_stream_features(stream);
+	}
+}
+
+static void dc_log_vcp_x_y(const struct dc_link *link, struct fixed31_32 avg_time_slots_per_mtp)
+{
+	const uint32_t VCP_Y_PRECISION = 1000;
+	uint64_t vcp_x, vcp_y;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	// Add 0.5*(1/VCP_Y_PRECISION) to round up to decimal precision
+	avg_time_slots_per_mtp = dc_fixpt_add(
+			avg_time_slots_per_mtp,
+			dc_fixpt_from_fraction(
+				1,
+				2*VCP_Y_PRECISION));
+
+	vcp_x = dc_fixpt_floor(
+			avg_time_slots_per_mtp);
+	vcp_y = dc_fixpt_floor(
+			dc_fixpt_mul_int(
+				dc_fixpt_sub_int(
+					avg_time_slots_per_mtp,
+					dc_fixpt_floor(
+							avg_time_slots_per_mtp)),
+				VCP_Y_PRECISION));
+
+
+	if (link->type == dc_connection_mst_branch)
+		DC_LOG_DP2("MST Update Payload: set_throttled_vcp_size slot X.Y for MST stream "
+				"X: %llu "
+				"Y: %llu/%d",
+				vcp_x,
+				vcp_y,
+				VCP_Y_PRECISION);
+	else
+		DC_LOG_DP2("SST Update Payload: set_throttled_vcp_size slot X.Y for SST stream "
+				"X: %llu "
+				"Y: %llu/%d",
+				vcp_x,
+				vcp_y,
+				VCP_Y_PRECISION);
+}
+
+static struct fixed31_32 get_pbn_per_slot(struct dc_stream_state *stream)
+{
+	struct fixed31_32 mbytes_per_sec;
+	uint32_t link_rate_in_mbytes_per_sec = dc_link_bandwidth_kbps(stream->link,
+			&stream->link->cur_link_settings);
+	link_rate_in_mbytes_per_sec /= 8000; /* Kbits to MBytes */
+
+	mbytes_per_sec = dc_fixpt_from_int(link_rate_in_mbytes_per_sec);
+
+	return dc_fixpt_div_int(mbytes_per_sec, 54);
+}
+
+static struct fixed31_32 get_pbn_from_bw_in_kbps(uint64_t kbps)
+{
+	struct fixed31_32 peak_kbps;
+	uint32_t numerator = 0;
+	uint32_t denominator = 1;
+
+	/*
+	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
+	 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
+	 * common multiplier to render an integer PBN for all link rate/lane
+	 * counts combinations
+	 * calculate
+	 * peak_kbps *= (1006/1000)
+	 * peak_kbps *= (64/54)
+	 * peak_kbps *= 8    convert to bytes
+	 */
+
+	numerator = 64 * PEAK_FACTOR_X1000;
+	denominator = 54 * 8 * 1000 * 1000;
+	kbps *= numerator;
+	peak_kbps = dc_fixpt_from_fraction(kbps, denominator);
+
+	return peak_kbps;
+}
+
+static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
+{
+	uint64_t kbps;
+
+	kbps = dc_bandwidth_in_kbps_from_timing(&pipe_ctx->stream->timing);
+	return get_pbn_from_bw_in_kbps(kbps);
+}
+
+
+// TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
+static void get_lane_status(
+	struct dc_link *link,
+	uint32_t lane_count,
+	union lane_status *status,
+	union lane_align_status_updated *status_updated)
+{
+	unsigned int lane;
+	uint8_t dpcd_buf[3] = {0};
+
+	if (status == NULL || status_updated == NULL) {
+		return;
+	}
+
+	core_link_read_dpcd(
+			link,
+			DP_LANE0_1_STATUS,
+			dpcd_buf,
+			sizeof(dpcd_buf));
+
+	for (lane = 0; lane < lane_count; lane++) {
+		status[lane].raw = dp_get_nibble_at_index(&dpcd_buf[0], lane);
+	}
+
+	status_updated->raw = dpcd_buf[2];
+}
+
+static bool poll_for_allocation_change_trigger(struct dc_link *link)
+{
+	/*
+	 * wait for ACT handled
+	 */
+	int i;
+	const int act_retries = 30;
+	enum act_return_status result = ACT_FAILED;
+	union payload_table_update_status update_status = {0};
+	union lane_status dpcd_lane_status[LANE_COUNT_DP_MAX];
+	union lane_align_status_updated lane_status_updated;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	if (link->aux_access_disabled)
+		return true;
+	for (i = 0; i < act_retries; i++) {
+		get_lane_status(link, link->cur_link_settings.lane_count, dpcd_lane_status, &lane_status_updated);
+
+		if (!dp_is_cr_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
+				!dp_is_ch_eq_done(link->cur_link_settings.lane_count, dpcd_lane_status) ||
+				!dp_is_symbol_locked(link->cur_link_settings.lane_count, dpcd_lane_status) ||
+				!dp_is_interlane_aligned(lane_status_updated)) {
+			DC_LOG_ERROR("SST Update Payload: Link loss occurred while "
+					"polling for ACT handled.");
+			result = ACT_LINK_LOST;
+			break;
+		}
+		core_link_read_dpcd(
+				link,
+				DP_PAYLOAD_TABLE_UPDATE_STATUS,
+				&update_status.raw,
+				1);
+
+		if (update_status.bits.ACT_HANDLED == 1) {
+			DC_LOG_DP2("SST Update Payload: ACT handled by downstream.");
+			result = ACT_SUCCESS;
+			break;
+		}
+
+		msleep(5);
+	}
+
+	if (result == ACT_FAILED) {
+		DC_LOG_ERROR("SST Update Payload: ACT still not handled after retries, "
+				"continue on. Something is wrong with the branch.");
+	}
+
+	return (result == ACT_SUCCESS);
+}
+
+static void update_mst_stream_alloc_table(
+	struct dc_link *link,
+	struct stream_encoder *stream_enc,
+	struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
+	const struct dc_dp_mst_stream_allocation_table *proposed_table)
+{
+	struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
+	struct link_mst_stream_allocation *dc_alloc;
+
+	int i;
+	int j;
+
+	/* if DRM proposed_table has more than one new payload */
+	ASSERT(proposed_table->stream_count -
+			link->mst_stream_alloc_table.stream_count < 2);
+
+	/* copy proposed_table to link, add stream encoder */
+	for (i = 0; i < proposed_table->stream_count; i++) {
+
+		for (j = 0; j < link->mst_stream_alloc_table.stream_count; j++) {
+			dc_alloc =
+			&link->mst_stream_alloc_table.stream_allocations[j];
+
+			if (dc_alloc->vcp_id ==
+				proposed_table->stream_allocations[i].vcp_id) {
+
+				work_table[i] = *dc_alloc;
+				work_table[i].slot_count = proposed_table->stream_allocations[i].slot_count;
+				break; /* exit j loop */
+			}
+		}
+
+		/* new vcp_id */
+		if (j == link->mst_stream_alloc_table.stream_count) {
+			work_table[i].vcp_id =
+				proposed_table->stream_allocations[i].vcp_id;
+			work_table[i].slot_count =
+				proposed_table->stream_allocations[i].slot_count;
+			work_table[i].stream_enc = stream_enc;
+			work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
+		}
+	}
+
+	/* update link->mst_stream_alloc_table with work_table */
+	link->mst_stream_alloc_table.stream_count =
+			proposed_table->stream_count;
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++)
+		link->mst_stream_alloc_table.stream_allocations[i] =
+				work_table[i];
+}
+
+static void remove_stream_from_alloc_table(
+		struct dc_link *link,
+		struct stream_encoder *dio_stream_enc,
+		struct hpo_dp_stream_encoder *hpo_dp_stream_enc)
+{
+	int i = 0;
+	struct link_mst_stream_allocation_table *table =
+			&link->mst_stream_alloc_table;
+
+	if (hpo_dp_stream_enc) {
+		for (; i < table->stream_count; i++)
+			if (hpo_dp_stream_enc == table->stream_allocations[i].hpo_dp_stream_enc)
+				break;
+	} else {
+		for (; i < table->stream_count; i++)
+			if (dio_stream_enc == table->stream_allocations[i].stream_enc)
+				break;
+	}
+
+	if (i < table->stream_count) {
+		i++;
+		for (; i < table->stream_count; i++)
+			table->stream_allocations[i-1] = table->stream_allocations[i];
+		memset(&table->stream_allocations[table->stream_count-1], 0,
+				sizeof(struct link_mst_stream_allocation));
+		table->stream_count--;
+	}
+}
+
+static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
+	struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
+	int i;
+	bool mst_mode = (link->type == dc_connection_mst_branch);
+	/* adjust for drm changes*/
+	bool update_drm_mst_state = true;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	const struct dc_link_settings empty_link_settings = {0};
+	DC_LOGGER_INIT(link->ctx->logger);
+
+
+	/* deallocate_mst_payload is called before disable link. When mode or
+	 * disable/enable monitor, new stream is created which is not in link
+	 * stream[] yet. For this, payload is not allocated yet, so de-alloc
+	 * should not done. For new mode set, map_resources will get engine
+	 * for new stream, so stream_enc->id should be validated until here.
+	 */
+
+	/* slot X.Y */
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+				&empty_link_settings,
+				avg_time_slots_per_mtp);
+
+	if (mst_mode || update_drm_mst_state) {
+		/* when link is in mst mode, reply on mst manager to remove
+		 * payload
+		 */
+		if (dm_helpers_dp_mst_write_payload_allocation_table(
+				stream->ctx,
+				stream,
+				&proposed_table,
+				false))
+			update_mst_stream_alloc_table(
+					link,
+					pipe_ctx->stream_res.stream_enc,
+					pipe_ctx->stream_res.hpo_dp_stream_enc,
+					&proposed_table);
+		else
+			DC_LOG_WARNING("Failed to update"
+					"MST allocation table for"
+					"pipe idx:%d\n",
+					pipe_ctx->pipe_idx);
+	} else {
+		/* when link is no longer in mst mode (mst hub unplugged),
+		 * remove payload with default dc logic
+		 */
+		remove_stream_from_alloc_table(link, pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc);
+	}
+
+	DC_LOG_MST("%s"
+			"stream_count: %d: ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	/* update mst stream allocation table hardware state */
+	if (link_hwss->ext.update_stream_allocation_table == NULL ||
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+		DC_LOG_DEBUG("Unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
+			&link->mst_stream_alloc_table);
+
+	if (mst_mode) {
+		dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+		if (!update_drm_mst_state)
+			dm_helpers_dp_mst_send_payload_allocation(
+				stream->ctx,
+				stream,
+				false);
+	}
+
+	if (update_drm_mst_state)
+		dm_helpers_dp_mst_send_payload_allocation(
+			stream->ctx,
+			stream,
+			false);
+
+	return DC_OK;
+}
+
+/* convert link_mst_stream_alloc_table to dm dp_mst_stream_alloc_table
+ * because stream_encoder is not exposed to dm
+ */
+static enum dc_status allocate_mst_payload(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	int i;
+	enum act_return_status ret;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* enable_link_dp_mst already check link->enabled_stream_count
+	 * and stream is in link->stream[]. This is called during set mode,
+	 * stream_enc is available.
+	 */
+
+	/* get calculate VC payload for stream: stream_alloc */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+		stream->ctx,
+		stream,
+		&proposed_table,
+		true))
+		update_mst_stream_alloc_table(
+					link,
+					pipe_ctx->stream_res.stream_enc,
+					pipe_ctx->stream_res.hpo_dp_stream_enc,
+					&proposed_table);
+	else
+		DC_LOG_WARNING("Failed to update"
+				"MST allocation table for"
+				"pipe idx:%d\n",
+				pipe_ctx->pipe_idx);
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* program DP source TX for payload */
+	if (link_hwss->ext.update_stream_allocation_table == NULL ||
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	link_hwss->ext.update_stream_allocation_table(link,
+			&pipe_ctx->link_res,
+			&link->mst_stream_alloc_table);
+
+	/* send down message */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+	if (ret != ACT_LINK_LOST) {
+		dm_helpers_dp_mst_send_payload_allocation(
+				stream->ctx,
+				stream,
+				true);
+	}
+
+	/* slot X.Y for only current stream */
+	pbn_per_slot = get_pbn_per_slot(stream);
+	if (pbn_per_slot.value == 0) {
+		DC_LOG_ERROR("Failure: pbn_per_slot==0 not allowed. Cannot continue, returning DC_UNSUPPORTED_VALUE.\n");
+		return DC_UNSUPPORTED_VALUE;
+	}
+	pbn = get_pbn_from_timing(pipe_ctx);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
+
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+				&link->cur_link_settings,
+				avg_time_slots_per_mtp);
+
+	return DC_OK;
+}
+
+struct fixed31_32 link_calculate_sst_avg_time_slots_per_mtp(
+		const struct dc_stream_state *stream,
+		const struct dc_link *link)
+{
+	struct fixed31_32 link_bw_effective =
+			dc_fixpt_from_int(
+					dc_link_bandwidth_kbps(link, &link->cur_link_settings));
+	struct fixed31_32 timeslot_bw_effective =
+			dc_fixpt_div_int(link_bw_effective, MAX_MTP_SLOT_COUNT);
+	struct fixed31_32 timing_bw =
+			dc_fixpt_from_int(
+					dc_bandwidth_in_kbps_from_timing(&stream->timing));
+	struct fixed31_32 avg_time_slots_per_mtp =
+			dc_fixpt_div(timing_bw, timeslot_bw_effective);
+
+	return avg_time_slots_per_mtp;
+}
+
+
+static bool write_128b_132b_sst_payload_allocation_table(
+		const struct dc_stream_state *stream,
+		struct dc_link *link,
+		struct link_mst_stream_allocation_table *proposed_table,
+		bool allocate)
+{
+	const uint8_t vc_id = 1; /// VC ID always 1 for SST
+	const uint8_t start_time_slot = 0; /// Always start at time slot 0 for SST
+	bool result = false;
+	uint8_t req_slot_count = 0;
+	struct fixed31_32 avg_time_slots_per_mtp = { 0 };
+	union payload_table_update_status update_status = { 0 };
+	const uint32_t max_retries = 30;
+	uint32_t retries = 0;
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	if (allocate)	{
+		avg_time_slots_per_mtp = link_calculate_sst_avg_time_slots_per_mtp(stream, link);
+		req_slot_count = dc_fixpt_ceil(avg_time_slots_per_mtp);
+		/// Validation should filter out modes that exceed link BW
+		ASSERT(req_slot_count <= MAX_MTP_SLOT_COUNT);
+		if (req_slot_count > MAX_MTP_SLOT_COUNT)
+			return false;
+	} else {
+		/// Leave req_slot_count = 0 if allocate is false.
+	}
+
+	proposed_table->stream_count = 1; /// Always 1 stream for SST
+	proposed_table->stream_allocations[0].slot_count = req_slot_count;
+	proposed_table->stream_allocations[0].vcp_id = vc_id;
+
+	if (link->aux_access_disabled)
+		return true;
+
+	/// Write DPCD 2C0 = 1 to start updating
+	update_status.bits.VC_PAYLOAD_TABLE_UPDATED = 1;
+	core_link_write_dpcd(
+			link,
+			DP_PAYLOAD_TABLE_UPDATE_STATUS,
+			&update_status.raw,
+			1);
+
+	/// Program the changes in DPCD 1C0 - 1C2
+	ASSERT(vc_id == 1);
+	core_link_write_dpcd(
+			link,
+			DP_PAYLOAD_ALLOCATE_SET,
+			&vc_id,
+			1);
+
+	ASSERT(start_time_slot == 0);
+	core_link_write_dpcd(
+			link,
+			DP_PAYLOAD_ALLOCATE_START_TIME_SLOT,
+			&start_time_slot,
+			1);
+
+	core_link_write_dpcd(
+			link,
+			DP_PAYLOAD_ALLOCATE_TIME_SLOT_COUNT,
+			&req_slot_count,
+			1);
+
+	/// Poll till DPCD 2C0 read 1
+	/// Try for at least 150ms (30 retries, with 5ms delay after each attempt)
+
+	while (retries < max_retries) {
+		if (core_link_read_dpcd(
+				link,
+				DP_PAYLOAD_TABLE_UPDATE_STATUS,
+				&update_status.raw,
+				1) == DC_OK) {
+			if (update_status.bits.VC_PAYLOAD_TABLE_UPDATED == 1) {
+				DC_LOG_DP2("SST Update Payload: downstream payload table updated.");
+				result = true;
+				break;
+			}
+		} else {
+			union dpcd_rev dpcdRev;
+
+			if (core_link_read_dpcd(
+					link,
+					DP_DPCD_REV,
+					&dpcdRev.raw,
+					1) != DC_OK) {
+				DC_LOG_ERROR("SST Update Payload: Unable to read DPCD revision "
+						"of sink while polling payload table "
+						"updated status bit.");
+				break;
+			}
+		}
+		retries++;
+		msleep(5);
+	}
+
+	if (!result && retries == max_retries) {
+		DC_LOG_ERROR("SST Update Payload: Payload table not updated after retries, "
+				"continue on. Something is wrong with the branch.");
+		// TODO - DP2.0 Payload: Read and log the payload table from downstream branch
+	}
+
+	return result;
+}
+
+/*
+ * Payload allocation/deallocation for SST introduced in DP2.0
+ */
+static enum dc_status update_sst_payload(struct pipe_ctx *pipe_ctx,
+						 bool allocate)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct link_mst_stream_allocation_table proposed_table = {0};
+	struct fixed31_32 avg_time_slots_per_mtp;
+	const struct dc_link_settings empty_link_settings = {0};
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* slot X.Y for SST payload deallocate */
+	if (!allocate) {
+		avg_time_slots_per_mtp = dc_fixpt_from_int(0);
+
+		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
+
+		if (link_hwss->ext.set_throttled_vcp_size)
+			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
+					avg_time_slots_per_mtp);
+		if (link_hwss->ext.set_hblank_min_symbol_width)
+			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+					&empty_link_settings,
+					avg_time_slots_per_mtp);
+	}
+
+	/* calculate VC payload and update branch with new payload allocation table*/
+	if (!write_128b_132b_sst_payload_allocation_table(
+			stream,
+			link,
+			&proposed_table,
+			allocate)) {
+		DC_LOG_ERROR("SST Update Payload: Failed to update "
+						"allocation table for "
+						"pipe idx: %d\n",
+						pipe_ctx->pipe_idx);
+		return DC_FAIL_DP_PAYLOAD_ALLOCATION;
+	}
+
+	proposed_table.stream_allocations[0].hpo_dp_stream_enc = pipe_ctx->stream_res.hpo_dp_stream_enc;
+
+	ASSERT(proposed_table.stream_count == 1);
+
+	//TODO - DP2.0 Logging: Instead of hpo_dp_stream_enc pointer, log instance id
+	DC_LOG_DP2("SST Update Payload: hpo_dp_stream_enc: %p      "
+		"vcp_id: %d      "
+		"slot_count: %d\n",
+		(void *) proposed_table.stream_allocations[0].hpo_dp_stream_enc,
+		proposed_table.stream_allocations[0].vcp_id,
+		proposed_table.stream_allocations[0].slot_count);
+
+	/* program DP source TX for payload */
+	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
+			&proposed_table);
+
+	/* poll for ACT handled */
+	if (!poll_for_allocation_change_trigger(link)) {
+		// Failures will result in blackscreen and errors logged
+		BREAK_TO_DEBUGGER();
+	}
+
+	/* slot X.Y for SST payload allocate */
+	if (allocate && link_dp_get_encoding_format(&link->cur_link_settings) ==
+			DP_128b_132b_ENCODING) {
+		avg_time_slots_per_mtp = link_calculate_sst_avg_time_slots_per_mtp(stream, link);
+
+		dc_log_vcp_x_y(link, avg_time_slots_per_mtp);
+
+		if (link_hwss->ext.set_throttled_vcp_size)
+			link_hwss->ext.set_throttled_vcp_size(pipe_ctx,
+					avg_time_slots_per_mtp);
+		if (link_hwss->ext.set_hblank_min_symbol_width)
+			link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+					&link->cur_link_settings,
+					avg_time_slots_per_mtp);
+	}
+
+	/* Always return DC_OK.
+	 * If part of sequence fails, log failure(s) and show blackscreen
+	 */
+	return DC_OK;
+}
+
+enum dc_status link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* decrease throttled vcp size */
+	pbn_per_slot = get_pbn_per_slot(stream);
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+				&link->cur_link_settings,
+				avg_time_slots_per_mtp);
+
+	/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+	dm_helpers_dp_mst_send_payload_allocation(
+			stream->ctx,
+			stream,
+			true);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+			stream->ctx,
+			stream,
+			&proposed_table,
+			true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	} else {
+		DC_LOG_WARNING("Failed to update"
+				"MST allocation table for"
+				"pipe idx:%d\n",
+				pipe_ctx->pipe_idx);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	if (link_hwss->ext.update_stream_allocation_table == NULL ||
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+	return DC_OK;
+}
+
+enum dc_status link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct fixed31_32 avg_time_slots_per_mtp;
+	struct fixed31_32 pbn;
+	struct fixed31_32 pbn_per_slot;
+	struct dc_dp_mst_stream_allocation_table proposed_table = {0};
+	uint8_t i;
+	enum act_return_status ret;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+	DC_LOGGER_INIT(link->ctx->logger);
+
+	/* notify immediate branch device table update */
+	if (dm_helpers_dp_mst_write_payload_allocation_table(
+				stream->ctx,
+				stream,
+				&proposed_table,
+				true)) {
+		/* update mst stream allocation table software state */
+		update_mst_stream_alloc_table(
+				link,
+				pipe_ctx->stream_res.stream_enc,
+				pipe_ctx->stream_res.hpo_dp_stream_enc,
+				&proposed_table);
+	}
+
+	DC_LOG_MST("%s  "
+			"stream_count: %d: \n ",
+			__func__,
+			link->mst_stream_alloc_table.stream_count);
+
+	for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
+		DC_LOG_MST("stream_enc[%d]: %p      "
+		"stream[%d].hpo_dp_stream_enc: %p      "
+		"stream[%d].vcp_id: %d      "
+		"stream[%d].slot_count: %d\n",
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
+		i,
+		(void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
+		i,
+		link->mst_stream_alloc_table.stream_allocations[i].slot_count);
+	}
+
+	ASSERT(proposed_table.stream_count > 0);
+
+	/* update mst stream allocation table hardware state */
+	if (link_hwss->ext.update_stream_allocation_table == NULL ||
+			link_dp_get_encoding_format(&link->cur_link_settings) == DP_UNKNOWN_ENCODING) {
+		DC_LOG_ERROR("Failure: unknown encoding format\n");
+		return DC_ERROR_UNEXPECTED;
+	}
+
+	link_hwss->ext.update_stream_allocation_table(link, &pipe_ctx->link_res,
+			&link->mst_stream_alloc_table);
+
+	/* poll for immediate branch device ACT handled */
+	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+			stream->ctx,
+			stream);
+
+	if (ret != ACT_LINK_LOST) {
+		/* send ALLOCATE_PAYLOAD sideband message with updated pbn */
+		dm_helpers_dp_mst_send_payload_allocation(
+				stream->ctx,
+				stream,
+				true);
+	}
+
+	/* increase throttled vcp size */
+	pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
+	pbn_per_slot = get_pbn_per_slot(stream);
+	avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
+
+	if (link_hwss->ext.set_throttled_vcp_size)
+		link_hwss->ext.set_throttled_vcp_size(pipe_ctx, avg_time_slots_per_mtp);
+	if (link_hwss->ext.set_hblank_min_symbol_width)
+		link_hwss->ext.set_hblank_min_symbol_width(pipe_ctx,
+				&link->cur_link_settings,
+				avg_time_slots_per_mtp);
+
+	return DC_OK;
+}
+
+static void disable_link(struct dc_link *link, const struct link_resource *link_res,
+		enum signal_type signal)
+{
+	/*
+	 * TODO: implement call for dp_set_hw_test_pattern
+	 * it is needed for compliance testing
+	 */
+
+	/* Here we need to specify that encoder output settings
+	 * need to be calculated as for the set mode,
+	 * it will lead to querying dynamic link capabilities
+	 * which should be done before enable output
+	 */
+
+	if (dc_is_dp_signal(signal)) {
+		/* SST DP, eDP */
+		struct dc_link_settings link_settings = link->cur_link_settings;
+		if (dc_is_dp_sst_signal(signal)) {
+			dp_disable_link_phy(link, link_res, signal);
+		} else {
+			dp_disable_link_phy_mst(link, link_res, signal);
+			/* set the sink to SST mode after disabling the link */
+			enable_mst_on_sink(link, false);
+		}
+		if (dc_is_dp_sst_signal(signal) ||
+				link->mst_stream_alloc_table.stream_count == 0) {
+			if (link_dp_get_encoding_format(&link_settings) == DP_8b_10b_ENCODING) {
+				dp_set_fec_enable(link, false);
+				dp_set_fec_ready(link, link_res, false);
+			}
+		}
+	} else if (signal != SIGNAL_TYPE_VIRTUAL) {
+		link->dc->hwss.disable_link_output(link, link_res, signal);
+	}
+
+	if (signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+		/* MST disable link only when no stream use the link */
+		if (link->mst_stream_alloc_table.stream_count <= 0)
+			link->link_status.link_active = false;
+	} else {
+		link->link_status.link_active = false;
+	}
+}
+
+static void enable_link_hdmi(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	enum dc_color_depth display_color_depth;
+	enum engine_id eng_id;
+	struct ext_hdmi_settings settings = {0};
+	bool is_over_340mhz = false;
+	bool is_vga_mode = (stream->timing.h_addressable == 640)
+			&& (stream->timing.v_addressable == 480);
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+
+	if (stream->phy_pix_clk == 0)
+		stream->phy_pix_clk = stream->timing.pix_clk_100hz / 10;
+	if (stream->phy_pix_clk > 340000)
+		is_over_340mhz = true;
+
+	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
+		unsigned short masked_chip_caps = pipe_ctx->stream->link->chip_caps &
+				EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK;
+		if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_TISN65DP159RSBT) {
+			/* DP159, Retimer settings */
+			eng_id = pipe_ctx->stream_res.stream_enc->id;
+
+			if (get_ext_hdmi_settings(pipe_ctx, eng_id, &settings)) {
+				write_i2c_retimer_setting(pipe_ctx,
+						is_vga_mode, is_over_340mhz, &settings);
+			} else {
+				write_i2c_default_retimer_setting(pipe_ctx,
+						is_vga_mode, is_over_340mhz);
+			}
+		} else if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_PI3EQX1204) {
+			/* PI3EQX1204, Redriver settings */
+			write_i2c_redriver_setting(pipe_ctx, is_over_340mhz);
+		}
+	}
+
+	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
+		write_scdc_data(
+			stream->link->ddc,
+			stream->phy_pix_clk,
+			stream->timing.flags.LTE_340MCSC_SCRAMBLE);
+
+	memset(&stream->link->cur_link_settings, 0,
+			sizeof(struct dc_link_settings));
+
+	display_color_depth = stream->timing.display_color_depth;
+	if (stream->timing.pixel_encoding == PIXEL_ENCODING_YCBCR422)
+		display_color_depth = COLOR_DEPTH_888;
+
+	dc->hwss.enable_tmds_link_output(
+			link,
+			&pipe_ctx->link_res,
+			pipe_ctx->stream->signal,
+			pipe_ctx->clock_source->id,
+			display_color_depth,
+			stream->phy_pix_clk);
+
+	if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
+		read_scdc_data(link->ddc);
+}
+
+static enum dc_status enable_link_dp(struct dc_state *state,
+				     struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	enum dc_status status;
+	bool skip_video_pattern;
+	struct dc_link *link = stream->link;
+	const struct dc_link_settings *link_settings =
+			&pipe_ctx->link_config.dp_link_settings;
+	bool fec_enable;
+	int i;
+	bool apply_seamless_boot_optimization = false;
+	uint32_t bl_oled_enable_delay = 50; // in ms
+	uint32_t post_oui_delay = 30; // 30ms
+	/* Reduce link bandwidth between failed link training attempts. */
+	bool do_fallback = false;
+
+	// check for seamless boot
+	for (i = 0; i < state->stream_count; i++) {
+		if (state->streams[i]->apply_seamless_boot_optimization) {
+			apply_seamless_boot_optimization = true;
+			break;
+		}
+	}
+
+	/* Train with fallback when enabling DPIA link. Conventional links are
+	 * trained with fallback during sink detection.
+	 */
+	if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+		do_fallback = true;
+
+	/*
+	 * Temporary w/a to get DP2.0 link rates to work with SST.
+	 * TODO DP2.0 - Workaround: Remove w/a if and when the issue is resolved.
+	 */
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING &&
+			pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
+			link->dc->debug.set_mst_en_for_sst) {
+		enable_mst_on_sink(link, true);
+	}
+	if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP) {
+		/*in case it is not on*/
+		if (!link->dc->config.edp_no_power_sequencing)
+			link->dc->hwss.edp_power_control(link, true);
+		link->dc->hwss.edp_wait_for_hpd_ready(link, true);
+	}
+
+	if (link_dp_get_encoding_format(link_settings) == DP_128b_132b_ENCODING) {
+		/* TODO - DP2.0 HW: calculate 32 symbol clock for HPO encoder */
+	} else {
+		pipe_ctx->stream_res.pix_clk_params.requested_sym_clk =
+				link_settings->link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
+		if (state->clk_mgr && !apply_seamless_boot_optimization)
+			state->clk_mgr->funcs->update_clocks(state->clk_mgr,
+					state, false);
+	}
+
+	// during mode switch we do DP_SET_POWER off then on, and OUI is lost
+	dpcd_set_source_specific_data(link);
+	if (link->dpcd_sink_ext_caps.raw != 0) {
+		post_oui_delay += link->panel_config.pps.extra_post_OUI_ms;
+		msleep(post_oui_delay);
+	}
+
+	// similarly, mode switch can cause loss of cable ID
+	dpcd_write_cable_id_to_dprx(link);
+
+	skip_video_pattern = true;
+
+	if (link_settings->link_rate == LINK_RATE_LOW)
+		skip_video_pattern = false;
+
+	if (perform_link_training_with_retries(link_settings,
+					       skip_video_pattern,
+					       LINK_TRAINING_ATTEMPTS,
+					       pipe_ctx,
+					       pipe_ctx->stream->signal,
+					       do_fallback)) {
+		status = DC_OK;
+	} else {
+		status = DC_FAIL_DP_LINK_TRAINING;
+	}
+
+	if (link->preferred_training_settings.fec_enable)
+		fec_enable = *link->preferred_training_settings.fec_enable;
+	else
+		fec_enable = true;
+
+	if (link_dp_get_encoding_format(link_settings) == DP_8b_10b_ENCODING)
+		dp_set_fec_enable(link, fec_enable);
+
+	// during mode set we do DP_SET_POWER off then on, aux writes are lost
+	if (link->dpcd_sink_ext_caps.bits.oled == 1 ||
+		link->dpcd_sink_ext_caps.bits.sdr_aux_backlight_control == 1 ||
+		link->dpcd_sink_ext_caps.bits.hdr_aux_backlight_control == 1) {
+		set_default_brightness_aux(link); // TODO: use cached if known
+		if (link->dpcd_sink_ext_caps.bits.oled == 1)
+			msleep(bl_oled_enable_delay);
+		link_backlight_enable_aux(link, true);
+	}
+
+	return status;
+}
+
+static enum dc_status enable_link_edp(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
+{
+	return enable_link_dp(state, pipe_ctx);
+}
+
+static void enable_link_lvds(struct pipe_ctx *pipe_ctx)
+{
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+	struct dc *dc = stream->ctx->dc;
+
+	if (stream->phy_pix_clk == 0)
+		stream->phy_pix_clk = stream->timing.pix_clk_100hz / 10;
+
+	memset(&stream->link->cur_link_settings, 0,
+			sizeof(struct dc_link_settings));
+	dc->hwss.enable_lvds_link_output(
+			link,
+			&pipe_ctx->link_res,
+			pipe_ctx->clock_source->id,
+			stream->phy_pix_clk);
+
+}
+
+static enum dc_status enable_link_dp_mst(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
+{
+	struct dc_link *link = pipe_ctx->stream->link;
+
+	/* sink signal type after MST branch is MST. Multiple MST sinks
+	 * share one link. Link DP PHY is enable or training only once.
+	 */
+	if (link->link_status.link_active)
+		return DC_OK;
+
+	/* clear payload table */
+	dm_helpers_dp_mst_clear_payload_allocation_table(link->ctx, link);
+
+	/* to make sure the pending down rep can be processed
+	 * before enabling the link
+	 */
+	dm_helpers_dp_mst_poll_pending_down_reply(link->ctx, link);
+
+	/* set the sink to MST mode before enabling the link */
+	enable_mst_on_sink(link, true);
+
+	return enable_link_dp(state, pipe_ctx);
+}
+
+static enum dc_status enable_link(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
+{
+	enum dc_status status = DC_ERROR_UNEXPECTED;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->link;
+
+	/* There's some scenarios where driver is unloaded with display
+	 * still enabled. When driver is reloaded, it may cause a display
+	 * to not light up if there is a mismatch between old and new
+	 * link settings. Need to call disable first before enabling at
+	 * new link settings.
+	 */
+	if (link->link_status.link_active) {
+		disable_link(link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
+	}
+
+	switch (pipe_ctx->stream->signal) {
+	case SIGNAL_TYPE_DISPLAY_PORT:
+		status = enable_link_dp(state, pipe_ctx);
+		break;
+	case SIGNAL_TYPE_EDP:
+		status = enable_link_edp(state, pipe_ctx);
+		break;
+	case SIGNAL_TYPE_DISPLAY_PORT_MST:
+		status = enable_link_dp_mst(state, pipe_ctx);
+		msleep(200);
+		break;
+	case SIGNAL_TYPE_DVI_SINGLE_LINK:
+	case SIGNAL_TYPE_DVI_DUAL_LINK:
+	case SIGNAL_TYPE_HDMI_TYPE_A:
+		enable_link_hdmi(pipe_ctx);
+		status = DC_OK;
+		break;
+	case SIGNAL_TYPE_LVDS:
+		enable_link_lvds(pipe_ctx);
+		status = DC_OK;
+		break;
+	case SIGNAL_TYPE_VIRTUAL:
+		status = DC_OK;
+		break;
+	default:
+		break;
+	}
+
+	if (status == DC_OK) {
+		pipe_ctx->stream->link->link_status.link_active = true;
+	}
+
+	return status;
+}
+
+void link_set_dpms_off(struct pipe_ctx *pipe_ctx)
+{
+	struct dc  *dc = pipe_ctx->stream->ctx->dc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->sink->link;
+	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
+
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
+		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
+
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	if (pipe_ctx->stream->sink) {
+		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
+			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
+			DC_LOG_DC("%s pipe_ctx dispname=%s signal=%x\n", __func__,
+			pipe_ctx->stream->sink->edid_caps.display_name,
+			pipe_ctx->stream->signal);
+		}
+	}
+
+	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
+			dc_is_virtual_signal(pipe_ctx->stream->signal))
+		return;
+
+	if (!pipe_ctx->stream->sink->edid_caps.panel_patch.skip_avmute) {
+		if (dc_is_hdmi_signal(pipe_ctx->stream->signal))
+			set_avmute(pipe_ctx, true);
+	}
+
+	dc->hwss.disable_audio_stream(pipe_ctx);
+
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+	update_psp_stream_config(pipe_ctx, true);
+#endif
+	dc->hwss.blank_stream(pipe_ctx);
+
+	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
+		deallocate_mst_payload(pipe_ctx);
+	else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
+			link_is_dp_128b_132b_signal(pipe_ctx))
+		update_sst_payload(pipe_ctx, false);
+
+	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
+		struct ext_hdmi_settings settings = {0};
+		enum engine_id eng_id = pipe_ctx->stream_res.stream_enc->id;
+
+		unsigned short masked_chip_caps = link->chip_caps &
+				EXT_DISPLAY_PATH_CAPS__EXT_CHIP_MASK;
+		//Need to inform that sink is going to use legacy HDMI mode.
+		write_scdc_data(
+			link->ddc,
+			165000,//vbios only handles 165Mhz.
+			false);
+		if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_TISN65DP159RSBT) {
+			/* DP159, Retimer settings */
+			if (get_ext_hdmi_settings(pipe_ctx, eng_id, &settings))
+				write_i2c_retimer_setting(pipe_ctx,
+						false, false, &settings);
+			else
+				write_i2c_default_retimer_setting(pipe_ctx,
+						false, false);
+		} else if (masked_chip_caps == EXT_DISPLAY_PATH_CAPS__HDMI20_PI3EQX1204) {
+			/* PI3EQX1204, Redriver settings */
+			write_i2c_redriver_setting(pipe_ctx, false);
+		}
+	}
+
+	if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
+			!link_is_dp_128b_132b_signal(pipe_ctx)) {
+
+		/* In DP1.x SST mode, our encoder will go to TPS1
+		 * when link is on but stream is off.
+		 * Disabling link before stream will avoid exposing TPS1 pattern
+		 * during the disable sequence as it will confuse some receivers
+		 * state machine.
+		 * In DP2 or MST mode, our encoder will stay video active
+		 */
+		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
+		dc->hwss.disable_stream(pipe_ctx);
+	} else {
+		dc->hwss.disable_stream(pipe_ctx);
+		disable_link(pipe_ctx->stream->link, &pipe_ctx->link_res, pipe_ctx->stream->signal);
+	}
+
+	if (pipe_ctx->stream->timing.flags.DSC) {
+		if (dc_is_dp_signal(pipe_ctx->stream->signal))
+			link_set_dsc_enable(pipe_ctx, false);
+	}
+	if (link_is_dp_128b_132b_signal(pipe_ctx)) {
+		if (pipe_ctx->stream_res.tg->funcs->set_out_mux)
+			pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, OUT_MUX_DIO);
+	}
+
+	if (vpg && vpg->funcs->vpg_powerdown)
+		vpg->funcs->vpg_powerdown(vpg);
+}
+
+void link_set_dpms_on(
+		struct dc_state *state,
+		struct pipe_ctx *pipe_ctx)
+{
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct dc_link *link = stream->sink->link;
+	enum dc_status status;
+	struct link_encoder *link_enc;
+	enum otg_out_mux_dest otg_out_dest = OUT_MUX_DIO;
+	struct vpg *vpg = pipe_ctx->stream_res.stream_enc->vpg;
+	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
+
+	if (link_is_dp_128b_132b_signal(pipe_ctx))
+		vpg = pipe_ctx->stream_res.hpo_dp_stream_enc->vpg;
+
+	DC_LOGGER_INIT(pipe_ctx->stream->ctx->logger);
+
+	if (pipe_ctx->stream->sink) {
+		if (pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_VIRTUAL &&
+			pipe_ctx->stream->sink->sink_signal != SIGNAL_TYPE_NONE) {
+			DC_LOG_DC("%s pipe_ctx dispname=%s signal=%x\n", __func__,
+			pipe_ctx->stream->sink->edid_caps.display_name,
+			pipe_ctx->stream->signal);
+		}
+	}
+
+	if (!IS_DIAG_DC(dc->ctx->dce_environment) &&
+			dc_is_virtual_signal(pipe_ctx->stream->signal))
+		return;
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	if (!dc_is_virtual_signal(pipe_ctx->stream->signal)
+			&& !link_is_dp_128b_132b_signal(pipe_ctx)) {
+		if (link_enc)
+			link_enc->funcs->setup(
+				link_enc,
+				pipe_ctx->stream->signal);
+	}
+
+	pipe_ctx->stream->link->link_state_valid = true;
+
+	if (pipe_ctx->stream_res.tg->funcs->set_out_mux) {
+		if (link_is_dp_128b_132b_signal(pipe_ctx))
+			otg_out_dest = OUT_MUX_HPO_DP;
+		else
+			otg_out_dest = OUT_MUX_DIO;
+		pipe_ctx->stream_res.tg->funcs->set_out_mux(pipe_ctx->stream_res.tg, otg_out_dest);
+	}
+
+	link_hwss->setup_stream_attribute(pipe_ctx);
+
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		bool apply_edp_fast_boot_optimization =
+			pipe_ctx->stream->apply_edp_fast_boot_optimization;
+
+		pipe_ctx->stream->apply_edp_fast_boot_optimization = false;
+
+		// Enable VPG before building infoframe
+		if (vpg && vpg->funcs->vpg_poweron)
+			vpg->funcs->vpg_poweron(vpg);
+
+		resource_build_info_frame(pipe_ctx);
+		dc->hwss.update_info_frame(pipe_ctx);
+
+		if (dc_is_dp_signal(pipe_ctx->stream->signal))
+			link_dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_UPDATE_INFO_FRAME);
+
+		/* Do not touch link on seamless boot optimization. */
+		if (pipe_ctx->stream->apply_seamless_boot_optimization) {
+			pipe_ctx->stream->dpms_off = false;
+
+			/* Still enable stream features & audio on seamless boot for DP external displays */
+			if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT) {
+				enable_stream_features(pipe_ctx);
+				dc->hwss.enable_audio_stream(pipe_ctx);
+			}
+
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+			update_psp_stream_config(pipe_ctx, false);
+#endif
+			return;
+		}
+
+		/* eDP lit up by bios already, no need to enable again. */
+		if (pipe_ctx->stream->signal == SIGNAL_TYPE_EDP &&
+					apply_edp_fast_boot_optimization &&
+					!pipe_ctx->stream->timing.flags.DSC &&
+					!pipe_ctx->next_odm_pipe) {
+			pipe_ctx->stream->dpms_off = false;
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+			update_psp_stream_config(pipe_ctx, false);
+#endif
+			return;
+		}
+
+		if (pipe_ctx->stream->dpms_off)
+			return;
+
+		/* Have to setup DSC before DIG FE and BE are connected (which happens before the
+		 * link training). This is to make sure the bandwidth sent to DIG BE won't be
+		 * bigger than what the link and/or DIG BE can handle. VBID[6]/CompressedStream_flag
+		 * will be automatically set at a later time when the video is enabled
+		 * (DP_VID_STREAM_EN = 1).
+		 */
+		if (pipe_ctx->stream->timing.flags.DSC) {
+			if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
+				dc_is_virtual_signal(pipe_ctx->stream->signal))
+			link_set_dsc_enable(pipe_ctx, true);
+
+		}
+
+		status = enable_link(state, pipe_ctx);
+
+		if (status != DC_OK) {
+			DC_LOG_WARNING("enabling link %u failed: %d\n",
+			pipe_ctx->stream->link->link_index,
+			status);
+
+			/* Abort stream enable *unless* the failure was due to
+			 * DP link training - some DP monitors will recover and
+			 * show the stream anyway. But MST displays can't proceed
+			 * without link training.
+			 */
+			if (status != DC_FAIL_DP_LINK_TRAINING ||
+					pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
+				if (false == stream->link->link_status.link_active)
+					disable_link(stream->link, &pipe_ctx->link_res,
+							pipe_ctx->stream->signal);
+				BREAK_TO_DEBUGGER();
+				return;
+			}
+		}
+
+		/* turn off otg test pattern if enable */
+		if (pipe_ctx->stream_res.tg->funcs->set_test_pattern)
+			pipe_ctx->stream_res.tg->funcs->set_test_pattern(pipe_ctx->stream_res.tg,
+					CONTROLLER_DP_TEST_PATTERN_VIDEOMODE,
+					COLOR_DEPTH_UNDEFINED);
+
+		/* This second call is needed to reconfigure the DIG
+		 * as a workaround for the incorrect value being applied
+		 * from transmitter control.
+		 */
+		if (!(dc_is_virtual_signal(pipe_ctx->stream->signal) ||
+				link_is_dp_128b_132b_signal(pipe_ctx)))
+			if (link_enc)
+				link_enc->funcs->setup(
+					link_enc,
+					pipe_ctx->stream->signal);
+
+		dc->hwss.enable_stream(pipe_ctx);
+
+		/* Set DPS PPS SDP (AKA "info frames") */
+		if (pipe_ctx->stream->timing.flags.DSC) {
+			if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
+					dc_is_virtual_signal(pipe_ctx->stream->signal)) {
+				dp_set_dsc_on_rx(pipe_ctx, true);
+				link_set_dsc_pps_packet(pipe_ctx, true, true);
+			}
+		}
+
+		if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT_MST)
+			allocate_mst_payload(pipe_ctx);
+		else if (pipe_ctx->stream->signal == SIGNAL_TYPE_DISPLAY_PORT &&
+				link_is_dp_128b_132b_signal(pipe_ctx))
+			update_sst_payload(pipe_ctx, true);
+
+		dc->hwss.unblank_stream(pipe_ctx,
+			&pipe_ctx->stream->link->cur_link_settings);
+
+		if (stream->sink_patches.delay_ignore_msa > 0)
+			msleep(stream->sink_patches.delay_ignore_msa);
+
+		if (dc_is_dp_signal(pipe_ctx->stream->signal))
+			enable_stream_features(pipe_ctx);
+#if defined(CONFIG_DRM_AMD_DC_HDCP)
+		update_psp_stream_config(pipe_ctx, false);
+#endif
+
+		dc->hwss.enable_audio_stream(pipe_ctx);
+
+	} else { // if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		if (link_is_dp_128b_132b_signal(pipe_ctx))
+			dp_fpga_hpo_enable_link_and_stream(state, pipe_ctx);
+		if (dc_is_dp_signal(pipe_ctx->stream->signal) ||
+				dc_is_virtual_signal(pipe_ctx->stream->signal))
+			link_set_dsc_enable(pipe_ctx, true);
+	}
+
+	if (dc_is_hdmi_signal(pipe_ctx->stream->signal)) {
+		set_avmute(pipe_ctx, false);
+	}
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_dpms.h b/drivers/gpu/drm/amd/display/dc/link/link_dpms.h
new file mode 100644
index 000000000000..7ce0124ed7d1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_dpms.h
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
+#ifndef __DC_LINK_DPMS_H__
+#define __DC_LINK_DPMS_H__
+
+#include "link.h"
+bool link_set_dsc_pps_packet(struct pipe_ctx *pipe_ctx,
+		bool enable, bool immediate_update);
+struct fixed31_32 link_calculate_sst_avg_time_slots_per_mtp(
+		const struct dc_stream_state *stream,
+		const struct dc_link *link);
+#endif /* __DC_LINK_DPMS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
new file mode 100644
index 000000000000..13a766273755
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -0,0 +1,577 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file owns the creation/destruction of link structure.
+ */
+#include "link_factory.h"
+#include "protocols/link_ddc.h"
+#include "protocols/link_edp_panel_control.h"
+#include "protocols/link_hpd.h"
+#include "gpio_service_interface.h"
+#include "atomfirmware.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define LINK_INFO(...) \
+	DC_LOG_HW_HOTPLUG(  \
+		__VA_ARGS__)
+
+static enum transmitter translate_encoder_to_transmitter(struct graphics_object_id encoder)
+{
+	switch (encoder.id) {
+	case ENCODER_ID_INTERNAL_UNIPHY:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_UNIPHY_A;
+		case ENUM_ID_2:
+			return TRANSMITTER_UNIPHY_B;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	case ENCODER_ID_INTERNAL_UNIPHY1:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_UNIPHY_C;
+		case ENUM_ID_2:
+			return TRANSMITTER_UNIPHY_D;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	case ENCODER_ID_INTERNAL_UNIPHY2:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_UNIPHY_E;
+		case ENUM_ID_2:
+			return TRANSMITTER_UNIPHY_F;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	case ENCODER_ID_INTERNAL_UNIPHY3:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_UNIPHY_G;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	case ENCODER_ID_EXTERNAL_NUTMEG:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_NUTMEG_CRT;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	case ENCODER_ID_EXTERNAL_TRAVIS:
+		switch (encoder.enum_id) {
+		case ENUM_ID_1:
+			return TRANSMITTER_TRAVIS_CRT;
+		case ENUM_ID_2:
+			return TRANSMITTER_TRAVIS_LCD;
+		default:
+			return TRANSMITTER_UNKNOWN;
+		}
+	break;
+	default:
+		return TRANSMITTER_UNKNOWN;
+	}
+}
+
+static void link_destruct(struct dc_link *link)
+{
+	int i;
+
+	if (link->hpd_gpio) {
+		dal_gpio_destroy_irq(&link->hpd_gpio);
+		link->hpd_gpio = NULL;
+	}
+
+	if (link->ddc)
+		link_destroy_ddc_service(&link->ddc);
+
+	if (link->panel_cntl)
+		link->panel_cntl->funcs->destroy(&link->panel_cntl);
+
+	if (link->link_enc) {
+		/* Update link encoder resource tracking variables. These are used for
+		 * the dynamic assignment of link encoders to streams. Virtual links
+		 * are not assigned encoder resources on creation.
+		 */
+		if (link->link_id.id != CONNECTOR_ID_VIRTUAL) {
+			link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = NULL;
+			link->dc->res_pool->dig_link_enc_count--;
+		}
+		link->link_enc->funcs->destroy(&link->link_enc);
+	}
+
+	if (link->local_sink)
+		dc_sink_release(link->local_sink);
+
+	for (i = 0; i < link->sink_count; ++i)
+		dc_sink_release(link->remote_sinks[i]);
+}
+
+static enum channel_id get_ddc_line(struct dc_link *link)
+{
+	struct ddc *ddc;
+	enum channel_id channel;
+
+		channel = CHANNEL_ID_UNKNOWN;
+
+	ddc = get_ddc_pin(link->ddc);
+
+	if (ddc) {
+		switch (dal_ddc_get_line(ddc)) {
+		case GPIO_DDC_LINE_DDC1:
+			channel = CHANNEL_ID_DDC1;
+			break;
+		case GPIO_DDC_LINE_DDC2:
+			channel = CHANNEL_ID_DDC2;
+			break;
+		case GPIO_DDC_LINE_DDC3:
+			channel = CHANNEL_ID_DDC3;
+			break;
+		case GPIO_DDC_LINE_DDC4:
+			channel = CHANNEL_ID_DDC4;
+			break;
+		case GPIO_DDC_LINE_DDC5:
+			channel = CHANNEL_ID_DDC5;
+			break;
+		case GPIO_DDC_LINE_DDC6:
+			channel = CHANNEL_ID_DDC6;
+			break;
+		case GPIO_DDC_LINE_DDC_VGA:
+			channel = CHANNEL_ID_DDC_VGA;
+			break;
+		case GPIO_DDC_LINE_I2C_PAD:
+			channel = CHANNEL_ID_I2C_PAD;
+			break;
+		default:
+			BREAK_TO_DEBUGGER();
+			break;
+		}
+	}
+
+	return channel;
+}
+
+static bool dc_link_construct_phy(struct dc_link *link,
+			      const struct link_init_data *init_params)
+{
+	uint8_t i;
+	struct ddc_service_init_data ddc_service_init_data = { 0 };
+	struct dc_context *dc_ctx = init_params->ctx;
+	struct encoder_init_data enc_init_data = { 0 };
+	struct panel_cntl_init_data panel_cntl_init_data = { 0 };
+	struct integrated_info info = { 0 };
+	struct dc_bios *bios = init_params->dc->ctx->dc_bios;
+	const struct dc_vbios_funcs *bp_funcs = bios->funcs;
+	struct bp_disp_connector_caps_info disp_connect_caps_info = { 0 };
+
+	DC_LOGGER_INIT(dc_ctx->logger);
+
+		link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
+		link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
+	link->link_status.dpcd_caps = &link->dpcd_caps;
+
+	link->dc = init_params->dc;
+	link->ctx = dc_ctx;
+	link->link_index = init_params->link_index;
+
+	memset(&link->preferred_training_settings, 0,
+	       sizeof(struct dc_link_training_overrides));
+	memset(&link->preferred_link_setting, 0,
+	       sizeof(struct dc_link_settings));
+
+	link->link_id =
+		bios->funcs->get_connector_id(bios, init_params->connector_index);
+
+	link->ep_type = DISPLAY_ENDPOINT_PHY;
+
+	DC_LOG_DC("BIOS object table - link_id: %d", link->link_id.id);
+
+	if (bios->funcs->get_disp_connector_caps_info) {
+		bios->funcs->get_disp_connector_caps_info(bios, link->link_id, &disp_connect_caps_info);
+		link->is_internal_display = disp_connect_caps_info.INTERNAL_DISPLAY;
+		DC_LOG_DC("BIOS object table - is_internal_display: %d", link->is_internal_display);
+	}
+
+	if (link->link_id.type != OBJECT_TYPE_CONNECTOR) {
+		dm_output_to_console("%s: Invalid Connector ObjectID from Adapter Service for connector index:%d! type %d expected %d\n",
+				     __func__, init_params->connector_index,
+				     link->link_id.type, OBJECT_TYPE_CONNECTOR);
+		goto create_fail;
+	}
+
+	if (link->dc->res_pool->funcs->link_init)
+		link->dc->res_pool->funcs->link_init(link);
+
+	link->hpd_gpio = link_get_hpd_gpio(link->ctx->dc_bios, link->link_id,
+				      link->ctx->gpio_service);
+
+	if (link->hpd_gpio) {
+		dal_gpio_open(link->hpd_gpio, GPIO_MODE_INTERRUPT);
+		dal_gpio_unlock_pin(link->hpd_gpio);
+		link->irq_source_hpd = dal_irq_get_source(link->hpd_gpio);
+
+		DC_LOG_DC("BIOS object table - hpd_gpio id: %d", link->hpd_gpio->id);
+		DC_LOG_DC("BIOS object table - hpd_gpio en: %d", link->hpd_gpio->en);
+	}
+
+	switch (link->link_id.id) {
+	case CONNECTOR_ID_HDMI_TYPE_A:
+		link->connector_signal = SIGNAL_TYPE_HDMI_TYPE_A;
+
+		break;
+	case CONNECTOR_ID_SINGLE_LINK_DVID:
+	case CONNECTOR_ID_SINGLE_LINK_DVII:
+		link->connector_signal = SIGNAL_TYPE_DVI_SINGLE_LINK;
+		break;
+	case CONNECTOR_ID_DUAL_LINK_DVID:
+	case CONNECTOR_ID_DUAL_LINK_DVII:
+		link->connector_signal = SIGNAL_TYPE_DVI_DUAL_LINK;
+		break;
+	case CONNECTOR_ID_DISPLAY_PORT:
+	case CONNECTOR_ID_USBC:
+		link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
+
+		if (link->hpd_gpio)
+			link->irq_source_hpd_rx =
+					dal_irq_get_rx_source(link->hpd_gpio);
+
+		break;
+	case CONNECTOR_ID_EDP:
+		link->connector_signal = SIGNAL_TYPE_EDP;
+
+		if (link->hpd_gpio) {
+			if (!link->dc->config.allow_edp_hotplug_detection)
+				link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
+
+			switch (link->dc->config.allow_edp_hotplug_detection) {
+			case 1: // only the 1st eDP handles hotplug
+				if (link->link_index == 0)
+					link->irq_source_hpd_rx =
+						dal_irq_get_rx_source(link->hpd_gpio);
+				else
+					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
+				break;
+			case 2: // only the 2nd eDP handles hotplug
+				if (link->link_index == 1)
+					link->irq_source_hpd_rx =
+						dal_irq_get_rx_source(link->hpd_gpio);
+				else
+					link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
+				break;
+			default:
+				break;
+			}
+		}
+
+		break;
+	case CONNECTOR_ID_LVDS:
+		link->connector_signal = SIGNAL_TYPE_LVDS;
+		break;
+	default:
+		DC_LOG_WARNING("Unsupported Connector type:%d!\n",
+			       link->link_id.id);
+		goto create_fail;
+	}
+
+	/* TODO: #DAL3 Implement id to str function.*/
+	LINK_INFO("Connector[%d] description:"
+		  "signal %d\n",
+		  init_params->connector_index,
+		  link->connector_signal);
+
+	ddc_service_init_data.ctx = link->ctx;
+	ddc_service_init_data.id = link->link_id;
+	ddc_service_init_data.link = link;
+	link->ddc = link_create_ddc_service(&ddc_service_init_data);
+
+	if (!link->ddc) {
+		DC_ERROR("Failed to create ddc_service!\n");
+		goto ddc_create_fail;
+	}
+
+	if (!link->ddc->ddc_pin) {
+		DC_ERROR("Failed to get I2C info for connector!\n");
+		goto ddc_create_fail;
+	}
+
+	link->ddc_hw_inst =
+		dal_ddc_get_line(get_ddc_pin(link->ddc));
+
+
+	if (link->dc->res_pool->funcs->panel_cntl_create &&
+		(link->link_id.id == CONNECTOR_ID_EDP ||
+			link->link_id.id == CONNECTOR_ID_LVDS)) {
+		panel_cntl_init_data.ctx = dc_ctx;
+		panel_cntl_init_data.inst =
+			panel_cntl_init_data.ctx->dc_edp_id_count;
+		link->panel_cntl =
+			link->dc->res_pool->funcs->panel_cntl_create(
+								&panel_cntl_init_data);
+		panel_cntl_init_data.ctx->dc_edp_id_count++;
+
+		if (link->panel_cntl == NULL) {
+			DC_ERROR("Failed to create link panel_cntl!\n");
+			goto panel_cntl_create_fail;
+		}
+	}
+
+	enc_init_data.ctx = dc_ctx;
+	bp_funcs->get_src_obj(dc_ctx->dc_bios, link->link_id, 0,
+			      &enc_init_data.encoder);
+	enc_init_data.connector = link->link_id;
+	enc_init_data.channel = get_ddc_line(link);
+	enc_init_data.hpd_source = get_hpd_line(link);
+
+	link->hpd_src = enc_init_data.hpd_source;
+
+	enc_init_data.transmitter =
+		translate_encoder_to_transmitter(enc_init_data.encoder);
+	link->link_enc =
+		link->dc->res_pool->funcs->link_enc_create(dc_ctx, &enc_init_data);
+
+	DC_LOG_DC("BIOS object table - DP_IS_USB_C: %d", link->link_enc->features.flags.bits.DP_IS_USB_C);
+	DC_LOG_DC("BIOS object table - IS_DP2_CAPABLE: %d", link->link_enc->features.flags.bits.IS_DP2_CAPABLE);
+
+	if (!link->link_enc) {
+		DC_ERROR("Failed to create link encoder!\n");
+		goto link_enc_create_fail;
+	}
+
+	/* Update link encoder tracking variables. These are used for the dynamic
+	 * assignment of link encoders to streams.
+	 */
+	link->eng_id = link->link_enc->preferred_engine;
+	link->dc->res_pool->link_encoders[link->eng_id - ENGINE_ID_DIGA] = link->link_enc;
+	link->dc->res_pool->dig_link_enc_count++;
+
+	link->link_enc_hw_inst = link->link_enc->transmitter;
+	for (i = 0; i < 4; i++) {
+		if (bp_funcs->get_device_tag(dc_ctx->dc_bios,
+					     link->link_id, i,
+					     &link->device_tag) != BP_RESULT_OK) {
+			DC_ERROR("Failed to find device tag!\n");
+			goto device_tag_fail;
+		}
+
+		/* Look for device tag that matches connector signal,
+		 * CRT for rgb, LCD for other supported signal tyes
+		 */
+		if (!bp_funcs->is_device_id_supported(dc_ctx->dc_bios,
+						      link->device_tag.dev_id))
+			continue;
+		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_CRT &&
+		    link->connector_signal != SIGNAL_TYPE_RGB)
+			continue;
+		if (link->device_tag.dev_id.device_type == DEVICE_TYPE_LCD &&
+		    link->connector_signal == SIGNAL_TYPE_RGB)
+			continue;
+
+		DC_LOG_DC("BIOS object table - device_tag.acpi_device: %d", link->device_tag.acpi_device);
+		DC_LOG_DC("BIOS object table - device_tag.dev_id.device_type: %d", link->device_tag.dev_id.device_type);
+		DC_LOG_DC("BIOS object table - device_tag.dev_id.enum_id: %d", link->device_tag.dev_id.enum_id);
+		break;
+	}
+
+	if (bios->integrated_info)
+		info = *bios->integrated_info;
+
+	/* Look for channel mapping corresponding to connector and device tag */
+	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {
+		struct external_display_path *path =
+			&info.ext_disp_conn_info.path[i];
+
+		if (path->device_connector_id.enum_id == link->link_id.enum_id &&
+		    path->device_connector_id.id == link->link_id.id &&
+		    path->device_connector_id.type == link->link_id.type) {
+			if (link->device_tag.acpi_device != 0 &&
+			    path->device_acpi_enum == link->device_tag.acpi_device) {
+				link->ddi_channel_mapping = path->channel_mapping;
+				link->chip_caps = path->caps;
+				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
+				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
+			} else if (path->device_tag ==
+				   link->device_tag.dev_id.raw_device_tag) {
+				link->ddi_channel_mapping = path->channel_mapping;
+				link->chip_caps = path->caps;
+				DC_LOG_DC("BIOS object table - ddi_channel_mapping: 0x%04X", link->ddi_channel_mapping.raw);
+				DC_LOG_DC("BIOS object table - chip_caps: %d", link->chip_caps);
+			}
+
+			if (link->chip_caps & EXT_DISPLAY_PATH_CAPS__DP_FIXED_VS_EN) {
+				link->bios_forced_drive_settings.VOLTAGE_SWING =
+						(info.ext_disp_conn_info.fixdpvoltageswing & 0x3);
+				link->bios_forced_drive_settings.PRE_EMPHASIS =
+						((info.ext_disp_conn_info.fixdpvoltageswing >> 2) & 0x3);
+			}
+
+			break;
+		}
+	}
+
+	if (bios->funcs->get_atom_dc_golden_table)
+		bios->funcs->get_atom_dc_golden_table(bios);
+
+	/*
+	 * TODO check if GPIO programmed correctly
+	 *
+	 * If GPIO isn't programmed correctly HPD might not rise or drain
+	 * fast enough, leading to bounces.
+	 */
+	program_hpd_filter(link);
+
+	link->psr_settings.psr_vtotal_control_support = false;
+	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
+
+	DC_LOG_DC("BIOS object table - dc_link_contruct finished successfully.\n");
+	return true;
+device_tag_fail:
+	link->link_enc->funcs->destroy(&link->link_enc);
+link_enc_create_fail:
+	if (link->panel_cntl != NULL)
+		link->panel_cntl->funcs->destroy(&link->panel_cntl);
+panel_cntl_create_fail:
+	link_destroy_ddc_service(&link->ddc);
+ddc_create_fail:
+create_fail:
+
+	if (link->hpd_gpio) {
+		dal_gpio_destroy_irq(&link->hpd_gpio);
+		link->hpd_gpio = NULL;
+	}
+
+	DC_LOG_DC("BIOS object table - dc_link_contruct failed.\n");
+	return false;
+}
+
+static bool dc_link_construct_dpia(struct dc_link *link,
+			      const struct link_init_data *init_params)
+{
+	struct ddc_service_init_data ddc_service_init_data = { 0 };
+	struct dc_context *dc_ctx = init_params->ctx;
+
+	DC_LOGGER_INIT(dc_ctx->logger);
+
+	/* Initialized irq source for hpd and hpd rx */
+	link->irq_source_hpd = DC_IRQ_SOURCE_INVALID;
+	link->irq_source_hpd_rx = DC_IRQ_SOURCE_INVALID;
+	link->link_status.dpcd_caps = &link->dpcd_caps;
+
+	link->dc = init_params->dc;
+	link->ctx = dc_ctx;
+	link->link_index = init_params->link_index;
+
+	memset(&link->preferred_training_settings, 0,
+	       sizeof(struct dc_link_training_overrides));
+	memset(&link->preferred_link_setting, 0,
+	       sizeof(struct dc_link_settings));
+
+	/* Dummy Init for linkid */
+	link->link_id.type = OBJECT_TYPE_CONNECTOR;
+	link->link_id.id = CONNECTOR_ID_DISPLAY_PORT;
+	link->link_id.enum_id = ENUM_ID_1 + init_params->connector_index;
+	link->is_internal_display = false;
+	link->connector_signal = SIGNAL_TYPE_DISPLAY_PORT;
+	LINK_INFO("Connector[%d] description:signal %d\n",
+		  init_params->connector_index,
+		  link->connector_signal);
+
+	link->ep_type = DISPLAY_ENDPOINT_USB4_DPIA;
+	link->is_dig_mapping_flexible = true;
+
+	/* TODO: Initialize link : funcs->link_init */
+
+	ddc_service_init_data.ctx = link->ctx;
+	ddc_service_init_data.id = link->link_id;
+	ddc_service_init_data.link = link;
+	/* Set indicator for dpia link so that ddc wont be created */
+	ddc_service_init_data.is_dpia_link = true;
+
+	link->ddc = link_create_ddc_service(&ddc_service_init_data);
+	if (!link->ddc) {
+		DC_ERROR("Failed to create ddc_service!\n");
+		goto ddc_create_fail;
+	}
+
+	/* Set dpia port index : 0 to number of dpia ports */
+	link->ddc_hw_inst = init_params->connector_index;
+
+	/* TODO: Create link encoder */
+
+	link->psr_settings.psr_version = DC_PSR_VERSION_UNSUPPORTED;
+
+	/* Some docks seem to NAK I2C writes to segment pointer with mot=0. */
+	link->wa_flags.dp_mot_reset_segment = true;
+
+	return true;
+
+ddc_create_fail:
+	return false;
+}
+
+static bool link_construct(struct dc_link *link,
+			      const struct link_init_data *init_params)
+{
+	/* Handle dpia case */
+	if (init_params->is_dpia_link == true)
+		return dc_link_construct_dpia(link, init_params);
+	else
+		return dc_link_construct_phy(link, init_params);
+}
+
+struct dc_link *link_create(const struct link_init_data *init_params)
+{
+	struct dc_link *link =
+			kzalloc(sizeof(*link), GFP_KERNEL);
+
+	if (NULL == link)
+		goto alloc_fail;
+
+	if (false == link_construct(link, init_params))
+		goto construct_fail;
+
+	return link;
+
+construct_fail:
+	kfree(link);
+
+alloc_fail:
+	return NULL;
+}
+
+void link_destroy(struct dc_link **link)
+{
+	link_destruct(*link);
+	kfree(*link);
+	*link = NULL;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.h b/drivers/gpu/drm/amd/display/dc/link/link_factory.h
new file mode 100644
index 000000000000..5b846147c4a6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.h
@@ -0,0 +1,29 @@
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
+#ifndef __LINK_FACTORY_H__
+#define __LINK_FACTORY_H__
+#include "link.h"
+
+#endif /* __LINK_FACTORY_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_resource.c b/drivers/gpu/drm/amd/display/dc/link/link_resource.c
new file mode 100644
index 000000000000..0027a7206073
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_resource.c
@@ -0,0 +1,149 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file implements accessors to link resource.
+ */
+
+#include "link_resource.h"
+#include "protocols/link_dp_capability.h"
+
+void dc_link_get_cur_link_res(const struct dc_link *link,
+		struct link_resource *link_res)
+{
+	int i;
+	struct pipe_ctx *pipe = NULL;
+
+	memset(link_res, 0, sizeof(*link_res));
+
+	for (i = 0; i < MAX_PIPES; i++) {
+		pipe = &link->dc->current_state->res_ctx.pipe_ctx[i];
+		if (pipe->stream && pipe->stream->link && pipe->top_pipe == NULL) {
+			if (pipe->stream->link == link) {
+				*link_res = pipe->link_res;
+				break;
+			}
+		}
+	}
+
+}
+
+/**
+ * dc_get_cur_link_res_map() - take a snapshot of current link resource allocation state
+ * @dc: pointer to dc of the dm calling this
+ * @map: a dc link resource snapshot defined internally to dc.
+ *
+ * DM needs to capture a snapshot of current link resource allocation mapping
+ * and store it in its persistent storage.
+ *
+ * Some of the link resource is using first come first serve policy.
+ * The allocation mapping depends on original hotplug order. This information
+ * is lost after driver is loaded next time. The snapshot is used in order to
+ * restore link resource to its previous state so user will get consistent
+ * link capability allocation across reboot.
+ *
+ * Return: none (void function)
+ *
+ */
+void dc_get_cur_link_res_map(const struct dc *dc, uint32_t *map)
+{
+	struct dc_link *link;
+	uint32_t i;
+	uint32_t hpo_dp_recycle_map = 0;
+
+	*map = 0;
+
+	if (dc->caps.dp_hpo) {
+		for (i = 0; i < dc->caps.max_links; i++) {
+			link = dc->links[i];
+			if (link->link_status.link_active &&
+					link_dp_get_encoding_format(&link->reported_link_cap) == DP_128b_132b_ENCODING &&
+					link_dp_get_encoding_format(&link->cur_link_settings) != DP_128b_132b_ENCODING)
+				/* hpo dp link encoder is considered as recycled, when RX reports 128b/132b encoding capability
+				 * but current link doesn't use it.
+				 */
+				hpo_dp_recycle_map |= (1 << i);
+		}
+		*map |= (hpo_dp_recycle_map << LINK_RES_HPO_DP_REC_MAP__SHIFT);
+	}
+}
+
+/**
+ * dc_restore_link_res_map() - restore link resource allocation state from a snapshot
+ * @dc: pointer to dc of the dm calling this
+ * @map: a dc link resource snapshot defined internally to dc.
+ *
+ * DM needs to call this function after initial link detection on boot and
+ * before first commit streams to restore link resource allocation state
+ * from previous boot session.
+ *
+ * Some of the link resource is using first come first serve policy.
+ * The allocation mapping depends on original hotplug order. This information
+ * is lost after driver is loaded next time. The snapshot is used in order to
+ * restore link resource to its previous state so user will get consistent
+ * link capability allocation across reboot.
+ *
+ * Return: none (void function)
+ *
+ */
+void dc_restore_link_res_map(const struct dc *dc, uint32_t *map)
+{
+	struct dc_link *link;
+	uint32_t i;
+	unsigned int available_hpo_dp_count;
+	uint32_t hpo_dp_recycle_map = (*map & LINK_RES_HPO_DP_REC_MAP__MASK)
+			>> LINK_RES_HPO_DP_REC_MAP__SHIFT;
+
+	if (dc->caps.dp_hpo) {
+		available_hpo_dp_count = dc->res_pool->hpo_dp_link_enc_count;
+		/* remove excess 128b/132b encoding support for not recycled links */
+		for (i = 0; i < dc->caps.max_links; i++) {
+			if ((hpo_dp_recycle_map & (1 << i)) == 0) {
+				link = dc->links[i];
+				if (link->type != dc_connection_none &&
+						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
+					if (available_hpo_dp_count > 0)
+						available_hpo_dp_count--;
+					else
+						/* remove 128b/132b encoding capability by limiting verified link rate to HBR3 */
+						link->verified_link_cap.link_rate = LINK_RATE_HIGH3;
+				}
+			}
+		}
+		/* remove excess 128b/132b encoding support for recycled links */
+		for (i = 0; i < dc->caps.max_links; i++) {
+			if ((hpo_dp_recycle_map & (1 << i)) != 0) {
+				link = dc->links[i];
+				if (link->type != dc_connection_none &&
+						link_dp_get_encoding_format(&link->verified_link_cap) == DP_128b_132b_ENCODING) {
+					if (available_hpo_dp_count > 0)
+						available_hpo_dp_count--;
+					else
+						/* remove 128b/132b encoding capability by limiting verified link rate to HBR3 */
+						link->verified_link_cap.link_rate = LINK_RATE_HIGH3;
+				}
+			}
+		}
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_resource.h b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
new file mode 100644
index 000000000000..fb01b3caf5a4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_resource.h
@@ -0,0 +1,29 @@
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
+#ifndef __LINK_RESOURCE_H__
+#define __LINK_RESOURCE_H__
+#include "link.h"
+
+#endif /* __LINK_RESOURCE_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.c b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
new file mode 100644
index 000000000000..cd821d077d73
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.c
@@ -0,0 +1,396 @@
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
+/* FILE POLICY AND INTENDED USAGE:
+ * This file owns timing validation against various link limitations. (ex.
+ * link bandwidth, receiver capability or our hardware capability) It also
+ * provides helper functions exposing bandwidth formulas used in validation.
+ */
+#include "link_validation.h"
+#include "resource.h"
+
+#define DC_LOGGER_INIT(logger)
+
+static uint32_t get_tmds_output_pixel_clock_100hz(const struct dc_crtc_timing *timing)
+{
+
+	uint32_t pxl_clk = timing->pix_clk_100hz;
+
+	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
+		pxl_clk /= 2;
+	else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
+		pxl_clk = pxl_clk * 2 / 3;
+
+	if (timing->display_color_depth == COLOR_DEPTH_101010)
+		pxl_clk = pxl_clk * 10 / 8;
+	else if (timing->display_color_depth == COLOR_DEPTH_121212)
+		pxl_clk = pxl_clk * 12 / 8;
+
+	return pxl_clk;
+}
+
+static bool dp_active_dongle_validate_timing(
+		const struct dc_crtc_timing *timing,
+		const struct dpcd_caps *dpcd_caps)
+{
+	const struct dc_dongle_caps *dongle_caps = &dpcd_caps->dongle_caps;
+
+	switch (dpcd_caps->dongle_type) {
+	case DISPLAY_DONGLE_DP_VGA_CONVERTER:
+	case DISPLAY_DONGLE_DP_DVI_CONVERTER:
+	case DISPLAY_DONGLE_DP_DVI_DONGLE:
+		if (timing->pixel_encoding == PIXEL_ENCODING_RGB)
+			return true;
+		else
+			return false;
+	default:
+		break;
+	}
+
+	if (dpcd_caps->dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER &&
+			dongle_caps->extendedCapValid == true) {
+		/* Check Pixel Encoding */
+		switch (timing->pixel_encoding) {
+		case PIXEL_ENCODING_RGB:
+		case PIXEL_ENCODING_YCBCR444:
+			break;
+		case PIXEL_ENCODING_YCBCR422:
+			if (!dongle_caps->is_dp_hdmi_ycbcr422_pass_through)
+				return false;
+			break;
+		case PIXEL_ENCODING_YCBCR420:
+			if (!dongle_caps->is_dp_hdmi_ycbcr420_pass_through)
+				return false;
+			break;
+		default:
+			/* Invalid Pixel Encoding*/
+			return false;
+		}
+
+		switch (timing->display_color_depth) {
+		case COLOR_DEPTH_666:
+		case COLOR_DEPTH_888:
+			/*888 and 666 should always be supported*/
+			break;
+		case COLOR_DEPTH_101010:
+			if (dongle_caps->dp_hdmi_max_bpc < 10)
+				return false;
+			break;
+		case COLOR_DEPTH_121212:
+			if (dongle_caps->dp_hdmi_max_bpc < 12)
+				return false;
+			break;
+		case COLOR_DEPTH_141414:
+		case COLOR_DEPTH_161616:
+		default:
+			/* These color depths are currently not supported */
+			return false;
+		}
+
+		/* Check 3D format */
+		switch (timing->timing_3d_format) {
+		case TIMING_3D_FORMAT_NONE:
+		case TIMING_3D_FORMAT_FRAME_ALTERNATE:
+			/*Only frame alternate 3D is supported on active dongle*/
+			break;
+		default:
+			/*other 3D formats are not supported due to bad infoframe translation */
+			return false;
+		}
+
+		if (dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps > 0) { // DP to HDMI FRL converter
+			struct dc_crtc_timing outputTiming = *timing;
+
+			if (timing->flags.DSC && !timing->dsc_cfg.is_frl)
+				/* DP input has DSC, HDMI FRL output doesn't have DSC, remove DSC from output timing */
+				outputTiming.flags.DSC = 0;
+			if (dc_bandwidth_in_kbps_from_timing(&outputTiming) > dongle_caps->dp_hdmi_frl_max_link_bw_in_kbps)
+				return false;
+		} else { // DP to HDMI TMDS converter
+			if (get_tmds_output_pixel_clock_100hz(timing) > (dongle_caps->dp_hdmi_max_pixel_clk_in_khz * 10))
+				return false;
+		}
+	}
+
+	if (dpcd_caps->channel_coding_cap.bits.DP_128b_132b_SUPPORTED == 0 &&
+			dpcd_caps->dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_PASSTHROUGH_SUPPORT == 0 &&
+			dongle_caps->dfp_cap_ext.supported) {
+
+		if (dongle_caps->dfp_cap_ext.max_pixel_rate_in_mps < (timing->pix_clk_100hz / 10000))
+			return false;
+
+		if (dongle_caps->dfp_cap_ext.max_video_h_active_width < timing->h_addressable)
+			return false;
+
+		if (dongle_caps->dfp_cap_ext.max_video_v_active_height < timing->v_addressable)
+			return false;
+
+		if (timing->pixel_encoding == PIXEL_ENCODING_RGB) {
+			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
+				return false;
+			if (timing->display_color_depth == COLOR_DEPTH_666 &&
+					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_6bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_888 &&
+					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_8bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
+					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_10bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
+					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_12bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
+					!dongle_caps->dfp_cap_ext.rgb_color_depth_caps.support_16bpc)
+				return false;
+		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR444) {
+			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
+				return false;
+			if (timing->display_color_depth == COLOR_DEPTH_888 &&
+					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_8bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
+					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_10bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
+					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_12bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
+					!dongle_caps->dfp_cap_ext.ycbcr444_color_depth_caps.support_16bpc)
+				return false;
+		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
+			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
+				return false;
+			if (timing->display_color_depth == COLOR_DEPTH_888 &&
+					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_8bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
+					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_10bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
+					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_12bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
+					!dongle_caps->dfp_cap_ext.ycbcr422_color_depth_caps.support_16bpc)
+				return false;
+		} else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420) {
+			if (!dongle_caps->dfp_cap_ext.encoding_format_caps.support_rgb)
+				return false;
+			if (timing->display_color_depth == COLOR_DEPTH_888 &&
+					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_8bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_101010 &&
+					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_10bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_121212 &&
+					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_12bpc)
+				return false;
+			else if (timing->display_color_depth == COLOR_DEPTH_161616 &&
+					!dongle_caps->dfp_cap_ext.ycbcr420_color_depth_caps.support_16bpc)
+				return false;
+		}
+	}
+
+	return true;
+}
+
+uint32_t dc_link_bandwidth_kbps(
+	const struct dc_link *link,
+	const struct dc_link_settings *link_setting)
+{
+	uint32_t total_data_bw_efficiency_x10000 = 0;
+	uint32_t link_rate_per_lane_kbps = 0;
+
+	switch (link_dp_get_encoding_format(link_setting)) {
+	case DP_8b_10b_ENCODING:
+		/* For 8b/10b encoding:
+		 * link rate is defined in the unit of LINK_RATE_REF_FREQ_IN_KHZ per DP byte per lane.
+		 * data bandwidth efficiency is 80% with additional 3% overhead if FEC is supported.
+		 */
+		link_rate_per_lane_kbps = link_setting->link_rate * LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
+		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_8b_10b_x10000;
+		if (dc_link_should_enable_fec(link)) {
+			total_data_bw_efficiency_x10000 /= 100;
+			total_data_bw_efficiency_x10000 *= DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
+		}
+		break;
+	case DP_128b_132b_ENCODING:
+		/* For 128b/132b encoding:
+		 * link rate is defined in the unit of 10mbps per lane.
+		 * total data bandwidth efficiency is always 96.71%.
+		 */
+		link_rate_per_lane_kbps = link_setting->link_rate * 10000;
+		total_data_bw_efficiency_x10000 = DATA_EFFICIENCY_128b_132b_x10000;
+		break;
+	default:
+		break;
+	}
+
+	/* overall effective link bandwidth = link rate per lane * lane count * total data bandwidth efficiency */
+	return link_rate_per_lane_kbps * link_setting->lane_count / 10000 * total_data_bw_efficiency_x10000;
+}
+
+uint32_t dc_bandwidth_in_kbps_from_timing(
+	const struct dc_crtc_timing *timing)
+{
+	uint32_t bits_per_channel = 0;
+	uint32_t kbps;
+
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	if (timing->flags.DSC)
+		return dc_dsc_stream_bandwidth_in_kbps(timing,
+				timing->dsc_cfg.bits_per_pixel,
+				timing->dsc_cfg.num_slices_h,
+				timing->dsc_cfg.is_dp);
+#endif /* CONFIG_DRM_AMD_DC_DCN */
+
+	switch (timing->display_color_depth) {
+	case COLOR_DEPTH_666:
+		bits_per_channel = 6;
+		break;
+	case COLOR_DEPTH_888:
+		bits_per_channel = 8;
+		break;
+	case COLOR_DEPTH_101010:
+		bits_per_channel = 10;
+		break;
+	case COLOR_DEPTH_121212:
+		bits_per_channel = 12;
+		break;
+	case COLOR_DEPTH_141414:
+		bits_per_channel = 14;
+		break;
+	case COLOR_DEPTH_161616:
+		bits_per_channel = 16;
+		break;
+	default:
+		ASSERT(bits_per_channel != 0);
+		bits_per_channel = 8;
+		break;
+	}
+
+	kbps = timing->pix_clk_100hz / 10;
+	kbps *= bits_per_channel;
+
+	if (timing->flags.Y_ONLY != 1) {
+		/*Only YOnly make reduce bandwidth by 1/3 compares to RGB*/
+		kbps *= 3;
+		if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420)
+			kbps /= 2;
+		else if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR422)
+			kbps = kbps * 2 / 3;
+	}
+
+	return kbps;
+}
+
+static bool dp_validate_mode_timing(
+	struct dc_link *link,
+	const struct dc_crtc_timing *timing)
+{
+	uint32_t req_bw;
+	uint32_t max_bw;
+
+	const struct dc_link_settings *link_setting;
+
+	/* According to spec, VSC SDP should be used if pixel format is YCbCr420 */
+	if (timing->pixel_encoding == PIXEL_ENCODING_YCBCR420 &&
+			!link->dpcd_caps.dprx_feature.bits.VSC_SDP_COLORIMETRY_SUPPORTED &&
+			dal_graphics_object_id_get_connector_id(link->link_id) != CONNECTOR_ID_VIRTUAL)
+		return false;
+
+	/*always DP fail safe mode*/
+	if ((timing->pix_clk_100hz / 10) == (uint32_t) 25175 &&
+		timing->h_addressable == (uint32_t) 640 &&
+		timing->v_addressable == (uint32_t) 480)
+		return true;
+
+	link_setting = dc_link_get_link_cap(link);
+
+	/* TODO: DYNAMIC_VALIDATION needs to be implemented */
+	/*if (flags.DYNAMIC_VALIDATION == 1 &&
+		link->verified_link_cap.lane_count != LANE_COUNT_UNKNOWN)
+		link_setting = &link->verified_link_cap;
+	*/
+
+	req_bw = dc_bandwidth_in_kbps_from_timing(timing);
+	max_bw = dc_link_bandwidth_kbps(link, link_setting);
+
+	if (req_bw <= max_bw) {
+		/* remember the biggest mode here, during
+		 * initial link training (to get
+		 * verified_link_cap), LS sends event about
+		 * cannot train at reported cap to upper
+		 * layer and upper layer will re-enumerate modes.
+		 * this is not necessary if the lower
+		 * verified_link_cap is enough to drive
+		 * all the modes */
+
+		/* TODO: DYNAMIC_VALIDATION needs to be implemented */
+		/* if (flags.DYNAMIC_VALIDATION == 1)
+			dpsst->max_req_bw_for_verified_linkcap = dal_max(
+				dpsst->max_req_bw_for_verified_linkcap, req_bw); */
+		return true;
+	} else
+		return false;
+}
+
+enum dc_status link_validate_mode_timing(
+		const struct dc_stream_state *stream,
+		struct dc_link *link,
+		const struct dc_crtc_timing *timing)
+{
+	uint32_t max_pix_clk = stream->link->dongle_max_pix_clk * 10;
+	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
+
+	/* A hack to avoid failing any modes for EDID override feature on
+	 * topology change such as lower quality cable for DP or different dongle
+	 */
+	if (link->remote_sinks[0] && link->remote_sinks[0]->sink_signal == SIGNAL_TYPE_VIRTUAL)
+		return DC_OK;
+
+	/* Passive Dongle */
+	if (max_pix_clk != 0 && get_tmds_output_pixel_clock_100hz(timing) > max_pix_clk)
+		return DC_EXCEED_DONGLE_CAP;
+
+	/* Active Dongle*/
+	if (!dp_active_dongle_validate_timing(timing, dpcd_caps))
+		return DC_EXCEED_DONGLE_CAP;
+
+	switch (stream->signal) {
+	case SIGNAL_TYPE_EDP:
+	case SIGNAL_TYPE_DISPLAY_PORT:
+		if (!dp_validate_mode_timing(
+				link,
+				timing))
+			return DC_NO_DP_LINK_BANDWIDTH;
+		break;
+
+	default:
+		break;
+	}
+
+	return DC_OK;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/link_validation.h b/drivers/gpu/drm/amd/display/dc/link/link_validation.h
new file mode 100644
index 000000000000..ab6a44f50032
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/link/link_validation.h
@@ -0,0 +1,28 @@
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
+#ifndef __LINK_VALIDATION_H__
+#define __LINK_VALIDATION_H__
+#include "link.h"
+#endif /* __LINK_VALIDATION_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
index 138e5684c7fd..24d356ebd7a9 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
@@ -47,6 +47,7 @@
 #include "resource.h"
 #include "link_enc_cfg.h"
 #include "dc_dmub_srv.h"
+#include "gpio_service_interface.h"
 
 #define DC_LOGGER \
 	link->ctx->logger
@@ -2127,7 +2128,7 @@ static bool dp_verify_link_cap(
 		if (status == LINK_TRAINING_SUCCESS) {
 			success = true;
 			udelay(1000);
-			if (dp_read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
+			if (dc_link_dp_read_hpd_rx_irq_data(link, &irq_data) == DC_OK &&
 					dc_link_check_link_loss_status(
 							link,
 							&irq_data))
@@ -2168,7 +2169,7 @@ bool dp_verify_link_cap_with_retries(
 
 		memset(&link->verified_link_cap, 0,
 				sizeof(struct dc_link_settings));
-		if (!dc_link_detect_sink(link, &type) || type == dc_connection_none) {
+		if (!dc_link_detect_connection_type(link, &type) || type == dc_connection_none) {
 			link->verified_link_cap = fail_safe_link_settings;
 			break;
 		} else if (dp_verify_link_cap(link, known_limit_link_setting,
@@ -2184,3 +2185,66 @@ bool dp_verify_link_cap_with_retries(
 
 	return success;
 }
+
+/**
+ * dc_link_is_dp_sink_present() - Check if there is a native DP
+ * or passive DP-HDMI dongle connected
+ */
+bool dc_link_is_dp_sink_present(struct dc_link *link)
+{
+	enum gpio_result gpio_result;
+	uint32_t clock_pin = 0;
+	uint8_t retry = 0;
+	struct ddc *ddc;
+
+	enum connector_id connector_id =
+		dal_graphics_object_id_get_connector_id(link->link_id);
+
+	bool present =
+		((connector_id == CONNECTOR_ID_DISPLAY_PORT) ||
+		(connector_id == CONNECTOR_ID_EDP) ||
+		(connector_id == CONNECTOR_ID_USBC));
+
+	ddc = get_ddc_pin(link->ddc);
+
+	if (!ddc) {
+		BREAK_TO_DEBUGGER();
+		return present;
+	}
+
+	/* Open GPIO and set it to I2C mode */
+	/* Note: this GpioMode_Input will be converted
+	 * to GpioConfigType_I2cAuxDualMode in GPIO component,
+	 * which indicates we need additional delay
+	 */
+
+	if (dal_ddc_open(ddc, GPIO_MODE_INPUT,
+			 GPIO_DDC_CONFIG_TYPE_MODE_I2C) != GPIO_RESULT_OK) {
+		dal_ddc_close(ddc);
+
+		return present;
+	}
+
+	/*
+	 * Read GPIO: DP sink is present if both clock and data pins are zero
+	 *
+	 * [W/A] plug-unplug DP cable, sometimes customer board has
+	 * one short pulse on clk_pin(1V, < 1ms). DP will be config to HDMI/DVI
+	 * then monitor can't br light up. Add retry 3 times
+	 * But in real passive dongle, it need additional 3ms to detect
+	 */
+	do {
+		gpio_result = dal_gpio_get_value(ddc->pin_clock, &clock_pin);
+		ASSERT(gpio_result == GPIO_RESULT_OK);
+		if (clock_pin)
+			udelay(1000);
+		else
+			break;
+	} while (retry++ < 3);
+
+	present = (gpio_result == GPIO_RESULT_OK) && !clock_pin;
+
+	dal_ddc_close(ddc);
+
+	return present;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
index a57a2be2eba0..32f48a48e9dd 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_dpia.c
@@ -103,3 +103,4 @@ bool dc_link_dpia_query_hpd_status(struct dc_link *link)
 
 	return is_hpd_high;
 }
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
index 9a832a9ea42d..eff23b7b324a 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.c
@@ -24,7 +24,8 @@
  */
 
 /* FILE POLICY AND INTENDED USAGE:
- *
+ * This file implements DP HPD short pulse handling sequence according to DP
+ * specifications
  *
  */
 
@@ -190,7 +191,7 @@ void dc_link_dp_handle_link_loss(struct dc_link *link)
 		pipe_ctx = &link->dc->current_state->res_ctx.pipe_ctx[i];
 		if (pipe_ctx && pipe_ctx->stream && !pipe_ctx->stream->dpms_off &&
 				pipe_ctx->stream->link == link && !pipe_ctx->prev_odm_pipe)
-			core_link_disable_stream(pipe_ctx);
+			link_set_dpms_off(pipe_ctx);
 	}
 
 	for (i = 0; i < MAX_PIPES; i++) {
@@ -206,12 +207,12 @@ void dc_link_dp_handle_link_loss(struct dc_link *link)
 				pipe_ctx->link_config.dp_link_settings.link_spread =
 						link->verified_link_cap.link_spread;
 			}
-			core_link_enable_stream(link->dc->current_state, pipe_ctx);
+			link_set_dpms_on(link->dc->current_state, pipe_ctx);
 		}
 	}
 }
 
-enum dc_status dp_read_hpd_rx_irq_data(
+enum dc_status dc_link_dp_read_hpd_rx_irq_data(
 	struct dc_link *link,
 	union hpd_irq_data *irq_data)
 {
@@ -299,7 +300,7 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 		 * dal_dpsst_ls_read_hpd_irq_data
 		 * Order of calls is important too
 		 */
-	result = dp_read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
+	result = dc_link_dp_read_hpd_rx_irq_data(link, &hpd_irq_dpcd_data);
 	if (out_hpd_irq_dpcd_data)
 		*out_hpd_irq_dpcd_data = hpd_irq_dpcd_data;
 
@@ -398,4 +399,3 @@ bool dc_link_handle_hpd_rx_irq(struct dc_link *link, union hpd_irq_data *out_hpd
 	 */
 	return status;
 }
-
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.h
index cac7acd33511..39b2e51ea79d 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_irq_handler.h
@@ -28,8 +28,4 @@
 
 #include "link.h"
 
-enum dc_status dp_read_hpd_rx_irq_data(
-	struct dc_link *link,
-	union hpd_irq_data *irq_data);
-
 #endif /* __DC_LINK_DP_IRQ_HANDLER_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
index 5e531620926f..ea3873dae3ad 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.c
@@ -36,7 +36,7 @@
 #include "link_dp_capability.h"
 #include "clk_mgr.h"
 #include "resource.h"
-
+#include "link_enc_cfg.h"
 #define DC_LOGGER \
 	link->ctx->logger
 
@@ -94,9 +94,6 @@ void dp_disable_link_phy_mst(struct dc_link *link,
 		return;
 
 	dp_disable_link_phy(link, link_res, signal);
-
-	/* set the sink to SST mode after disabling the link */
-	dp_enable_mst_on_sink(link, false);
 }
 
 static inline bool is_immediate_downstream(struct dc_link *link, uint32_t offset)
@@ -142,3 +139,81 @@ void dp_set_drive_settings(
 	/* Notify DP sink the PHY settings from source */
 	dpcd_set_lane_settings(link, lt_settings, DPRX);
 }
+
+enum dc_status dp_set_fec_ready(struct dc_link *link, const struct link_resource *link_res, bool ready)
+{
+	/* FEC has to be "set ready" before the link training.
+	 * The policy is to always train with FEC
+	 * if the sink supports it and leave it enabled on link.
+	 * If FEC is not supported, disable it.
+	 */
+	struct link_encoder *link_enc = NULL;
+	enum dc_status status = DC_OK;
+	uint8_t fec_config = 0;
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	if (!dc_link_should_enable_fec(link))
+		return status;
+
+	if (link_enc->funcs->fec_set_ready &&
+			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE) {
+		if (ready) {
+			fec_config = 1;
+			status = core_link_write_dpcd(link,
+					DP_FEC_CONFIGURATION,
+					&fec_config,
+					sizeof(fec_config));
+			if (status == DC_OK) {
+				link_enc->funcs->fec_set_ready(link_enc, true);
+				link->fec_state = dc_link_fec_ready;
+			} else {
+				link_enc->funcs->fec_set_ready(link_enc, false);
+				link->fec_state = dc_link_fec_not_ready;
+				dm_error("dpcd write failed to set fec_ready");
+			}
+		} else if (link->fec_state == dc_link_fec_ready) {
+			fec_config = 0;
+			status = core_link_write_dpcd(link,
+					DP_FEC_CONFIGURATION,
+					&fec_config,
+					sizeof(fec_config));
+			link_enc->funcs->fec_set_ready(link_enc, false);
+			link->fec_state = dc_link_fec_not_ready;
+		}
+	}
+
+	return status;
+}
+
+void dp_set_fec_enable(struct dc_link *link, bool enable)
+{
+	struct link_encoder *link_enc = NULL;
+
+	link_enc = link_enc_cfg_get_link_enc(link);
+	ASSERT(link_enc);
+
+	if (!dc_link_should_enable_fec(link))
+		return;
+
+	if (link_enc->funcs->fec_set_enable &&
+			link->dpcd_caps.fec_cap.bits.FEC_CAPABLE) {
+		if (link->fec_state == dc_link_fec_ready && enable) {
+			/* Accord to DP spec, FEC enable sequence can first
+			 * be transmitted anytime after 1000 LL codes have
+			 * been transmitted on the link after link training
+			 * completion. Using 1 lane RBR should have the maximum
+			 * time for transmitting 1000 LL codes which is 6.173 us.
+			 * So use 7 microseconds delay instead.
+			 */
+			udelay(7);
+			link_enc->funcs->fec_set_enable(link_enc, true);
+			link->fec_state = dc_link_fec_enabled;
+		} else if (link->fec_state == dc_link_fec_enabled && !enable) {
+			link_enc->funcs->fec_set_enable(link_enc, false);
+			link->fec_state = dc_link_fec_ready;
+		}
+	}
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
index 850da64c9005..6ce0b7958d51 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_phy.h
@@ -53,4 +53,8 @@ void dp_set_drive_settings(
 	const struct link_resource *link_res,
 	struct link_training_settings *lt_settings);
 
+enum dc_status dp_set_fec_ready(struct dc_link *link,
+		const struct link_resource *link_res, bool ready);
+void dp_set_fec_enable(struct dc_link *link, bool enable);
+
 #endif /* __DC_LINK_DP_PHY_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
index 18ec09b5a8ba..b48d4d822991 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training.c
@@ -51,6 +51,7 @@
 
 #define POST_LT_ADJ_REQ_LIMIT 6
 #define POST_LT_ADJ_REQ_TIMEOUT 200
+#define LINK_TRAINING_RETRY_DELAY 50 /* ms */
 
 void dp_log_training_result(
 	struct dc_link *link,
@@ -1648,7 +1649,7 @@ bool perform_link_training_with_retries(
 		if (status == LINK_TRAINING_ABORT) {
 			enum dc_connection_type type = dc_connection_none;
 
-			dc_link_detect_sink(link, &type);
+			dc_link_detect_connection_type(link, &type);
 			if (type == dc_connection_none) {
 				DC_LOG_HW_LINK_TRAINING("%s: Aborting training because sink unplugged\n", __func__);
 				break;
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
index 05657627ae45..e60da0532c53 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_training_dpia.c
@@ -37,6 +37,7 @@
 #include "dm_helpers.h"
 #include "dmub/inc/dmub_cmd.h"
 #include "link_dpcd.h"
+#include "link_dp_phy.h"
 #include "link_dp_training_8b_10b.h"
 #include "link_dp_capability.h"
 #include "dc_dmub_srv.h"
@@ -49,6 +50,8 @@
 /* Extend interval between training status checks for manual testing. */
 #define DPIA_DEBUG_EXTENDED_AUX_RD_INTERVAL_US 60000000
 
+#define TRAINING_AUX_RD_INTERVAL 100 //us
+
 /* SET_CONFIG message types sent by driver. */
 enum dpia_set_config_type {
 	DPIA_SET_CFG_SET_LINK = 0x01,
-- 
2.25.1

