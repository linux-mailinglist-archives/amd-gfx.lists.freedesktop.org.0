Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7F3FA0D6
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Aug 2021 22:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672FC6E9D8;
	Fri, 27 Aug 2021 20:45:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB4A6E9D8
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Aug 2021 20:45:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOrdoNFW5b/vv6wlrMydz3m+6rzHid9FKWIsHjgS8hc3t4hdZNwW89xfjelD532W0cF5Z9bGuBN093H2ettzzV70yvj+GbohEvfuo31F7cq8tyksrEDLCxT1CnZdTUusAz27JWGcXtiHMU1BuDEHmkYXkG+e/1GbCgtSppRzWF+o6zVtWaWLV+LL7PGGrSCCdOGgnjdvlARMyeKb/cC6Zh66indgoUGqEMJ50pkzFVXNYG3h5blcCyBw2tq8P54RSGKdflX8BrPaYt8g4nT7OxBwy5TNIwhnMdoz+4Qwu09gvGEmtWfNyLgIgFkrYqUOhkzwSw0PGNBmN1EN6kUMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p821cRADtVFtT6o+Tsm00HMQPHDxvUvMShwFQk2+ocE=;
 b=nBmWDUCvP/VTqhoUEg1Q4AmJjTLNJwTiMee1pOnTeXxbkWvrbgnAMxXbXRb8UGVSJbnHj14sS2aTZfsv6r6UuQCkaWSXOrPCEFEb5iNUB6iduHunJRK1GkbxEqSdxrkLxAXsKcd7pTi2fE1U1q3GNFhHkdJ/o82ZtBxsaGMWZf8VfWddiSy2tplFnoQEpDZZc0COVv3DX5/cKapNvjsI67DBU8BpMMh2qQHzRgCaeAtzQM1eeIb/FgGf7MVi/xX90tEf/Qk7P5mrN8QuBIOt/uG4q+Xh6rtTqpXpWOn9mCrG+pzEKyOwJLuzr3LdZ/oGlWDKkhOSbPlbKgPnbELEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p821cRADtVFtT6o+Tsm00HMQPHDxvUvMShwFQk2+ocE=;
 b=uWRODdsrVYigAQTFAH5q0TTAF0zxtrSRVb2g66VzOesBCfmPwT63g4vU2/yPV2pbSX+uT9i5shfz4lkprCpmGPAU3ITtwFM9kKATrNQZAN/ieCI9LWhiKYMoTmbsCuXWaEiYXNvScM/rOtGZMYe4RsITRx4nfM7CRfCuEKNHQUc=
Received: from MWHPR11CA0014.namprd11.prod.outlook.com (2603:10b6:301:1::24)
 by BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Fri, 27 Aug
 2021 20:29:28 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::8) by MWHPR11CA0014.outlook.office365.com
 (2603:10b6:301:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 27 Aug 2021 20:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 20:29:27 +0000
Received: from DESKTOP-9DR2N9S.localdomain (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 27 Aug 2021 15:29:26 -0500
From: Mikita Lipski <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Bhawanpreet.Lakha@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <Aurabindo.Pillai@amd.com>, <Qingqing.Zhuo@amd.com>, <mikita.lipski@amd.com>, 
 <Anson.Jacob@amd.com>, "Leo (Hanghong) Ma" <hanghong.ma@amd.com>, Aric Cyr
 <aric.cyr@amd.com>
Subject: [PATCH 04/19] drm/amd/display: Fix system hang at boot
Date: Fri, 27 Aug 2021 16:28:55 -0400
Message-ID: <20210827202910.20864-5-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827202910.20864-1-mikita.lipski@amd.com>
References: <20210827202910.20864-1-mikita.lipski@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 447a8615-ddeb-4f65-506f-08d969995e03
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:
X-Microsoft-Antispam-PRVS: <BN9PR12MB52422D93CD39D0C88E5AC778E4C89@BN9PR12MB5242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xYz3996jiddIX6EWaJrhZGFU9jv34Wwfv4iBBsMlsV3SiubRK9b3HPhtt6bpYYWtrtSnd6dIvNgku17tqjl+f5sI4qN0i4EabAy3QyBMXOKRlA71288YGisRkugLrSGtZg0hNFnVPhukPgeLolsjInAozNjMdipcXSrpmt2inRNMSSc5YpwhWCplt++xDFo5YPYoWgv2HsJVdHf0GVucwrftRfuXHdkBK6q3frz8QjDoYYbj6GAzM8pOZhV+lXJQ4V/1jJNHj52xdynHS6Q3rNjx18Y+pNys/q9wMRID08/esHP8BnlWrLEsdEh8kOsncEw+/w+I6Hx79+qsY+Si39eJAxAbflb8/Je2JepLrd9jxnZbBEz0LLAvuRX/X18J41hqmid+HP7+LjwIFpyUmuqzAr37Kf/vVtAhJOVZOptnLLvZBzJk4Qu7+Yrzpdmt9JCbEhNx4dDYBgqDnX0NuJIOOV28sLrWd+Zu6wsUVC9Yk8cxn5kRnKKbXFpJ2k5Tx+088mO8Ly3kf9nj5gvnvg+73y6oL62XOjlTH5TxavDUcxgRS6AQMuQ3HHhVe9FdnRET00gLgJC3bussbduboxXbIyPnhgGFPZjgj4FRh6GAW3cnQTAP9zTiba1qUXbxR9ycD3GV5N0BQJ7eysZgu7TEIuAdje80TMIppf86JcpxC1sJG9pKh/xVItlEJoLlf+keaR26gy/NLGPEbbBdkG/z/8839nl49ljQ4TL/Iw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6916009)(44832011)(70586007)(2906002)(83380400001)(316002)(336012)(36860700001)(2616005)(8936002)(82310400003)(426003)(356005)(508600001)(5660300002)(36756003)(70206006)(54906003)(6666004)(1076003)(16526019)(47076005)(4326008)(81166007)(8676002)(86362001)(26005)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 20:29:27.6265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447a8615-ddeb-4f65-506f-08d969995e03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
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

From: "Leo (Hanghong) Ma" <hanghong.ma@amd.com>

[Why]
During DQE's promotion test, system hang issue is found on linux
system;

[How]
1. Add NULL pointor check for the link in the sequence trace
   function;
2. Get the right link for the stream encoder before blank DP
   stream;

Reviewed-by: Aric Cyr <aric.cyr@amd.com>
Acked-by: Mikita Lipski <mikita.lipski@amd.com>
Signed-off-by: Leo (Hanghong) Ma <hanghong.ma@amd.com>
---
 .../drm/amd/display/dc/core/dc_link_hwss.c    |  2 +-
 .../display/dc/dce110/dce110_hw_sequencer.c   | 27 ++++++++++++-------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
index 2a064f7b669e..b1dd791c6f87 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_hwss.c
@@ -63,7 +63,7 @@ void dp_receiver_power_ctrl(struct dc_link *link, bool on)
 
 void dp_source_sequence_trace(struct dc_link *link, uint8_t dp_test_mode)
 {
-	if (link->dc->debug.enable_driver_sequence_debug)
+	if (link != NULL && link->dc->debug.enable_driver_sequence_debug)
 		core_link_write_dpcd(link, DP_SOURCE_SEQUENCE,
 					&dp_test_mode, sizeof(dp_test_mode));
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 98549e397db9..3870f3d482a1 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -1552,23 +1552,30 @@ static enum dc_status apply_single_controller_ctx_to_hw(
 
 static void power_down_encoders(struct dc *dc)
 {
-	int i;
-
-	/* do not know BIOS back-front mapping, simply blank all. It will not
-	 * hurt for non-DP
-	 */
-	for (i = 0; i < dc->res_pool->stream_enc_count; i++) {
-		dc->res_pool->stream_enc[i]->funcs->dp_blank(dc->links[i],
-					dc->res_pool->stream_enc[i]);
-	}
+	int i, j;
 
 	for (i = 0; i < dc->link_count; i++) {
 		enum signal_type signal = dc->links[i]->connector_signal;
 
 		if ((signal == SIGNAL_TYPE_EDP) ||
-			(signal == SIGNAL_TYPE_DISPLAY_PORT))
+			(signal == SIGNAL_TYPE_DISPLAY_PORT)) {
+			if (dc->links[i]->link_enc->funcs->get_dig_frontend &&
+				dc->links[i]->link_enc->funcs->is_dig_enabled(dc->links[i]->link_enc)) {
+				unsigned int fe = dc->links[i]->link_enc->funcs->get_dig_frontend(
+									dc->links[i]->link_enc);
+
+				for (j = 0; j < dc->res_pool->stream_enc_count; j++) {
+					if (fe == dc->res_pool->stream_enc[j]->id) {
+						dc->res_pool->stream_enc[j]->funcs->dp_blank(dc->links[i],
+									dc->res_pool->stream_enc[j]);
+						break;
+					}
+				}
+			}
+
 			if (!dc->links[i]->wa_flags.dp_keep_receiver_powered)
 				dp_receiver_power_ctrl(dc->links[i], false);
+		}
 
 		if (signal != SIGNAL_TYPE_EDP)
 			signal = SIGNAL_TYPE_NONE;
-- 
2.25.1

