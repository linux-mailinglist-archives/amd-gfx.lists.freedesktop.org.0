Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13A421FF9
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Oct 2021 09:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3736C6F53A;
	Tue,  5 Oct 2021 07:58:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D596F53A
 for <amd-gfx@lists.freedesktop.org>; Tue,  5 Oct 2021 07:58:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrfrYgUce0M7v5Dy+fSUAGhjXMrAXxc37wzdr966CVx6C9KKCL4sUbnQY/U/0kEeimwgky1VDTTUf6mnveOO1V5Uog1kPz3nM1epUizg5/aYxle+oB4ZuPXZTnheCG+04cujHTXut+oiWp2s9L7ukEhIt3MQElsD6TlHLXpciSRnxEBJ4WAtt91Z7ZZE/HbaippC3w8ToDuQ538qizsMXOTaP+B0R3gq6r/UumlMCg8QR054seZRTbukBbqdXRGTqitEKXSjbop7s32zIyScaW7uORxpX1eSPF11/76owA+wjQTNuFOMdZyjWV2nW5rSjn2A9ULrgsli6oh9zSF2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFccYn5otprhcT2/7XvMpftfOYRdoKxIz7oY9gzeQp0=;
 b=WIvvNHgFmv7Ohofq+zV2VVOeOV65drXe/jedln/rEhQbFTiz3xTNqFy7XkSt69PEprKfElojoqlcR0IhgB0vjbdvITd5lBbcoX369WUNM7O7iH0drt/t0zqY1XFpnn0qKEbOURpHxMc/YmF1fja/XXl0EWbM/FlRDmZfGWP6jNbMezhIrtyNEoprAMpBRfRO937XYRo/9JSkMMg0i5A1SqSqFRvKK1hPvHl/WpNdolI9+opRABk+Rpmrhs6lm+NluqIv6628mLCzqwvEX7cT8RzI2LcgEsuGVPCPwY2I+AvEIE7U4YVCP0TPK5MiwMSMCmj/bvQ9j8dAMef7dGv28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFccYn5otprhcT2/7XvMpftfOYRdoKxIz7oY9gzeQp0=;
 b=2blyMpwTlZqatkrtreo9BHiXDXSp6yPGBwxSjXVw2/tO4eXLAFAJ73vAtZi4WYfRZsgicLErqX2wddaIPmSqShEXWOO3skQAi4yNUGSdi/3DL8vaRbQeiai2M28QOKmu07BURZdgVpyCepwNX+mJ/D0NjCP7yFTi+A9YiW625YA=
Received: from BN9PR03CA0596.namprd03.prod.outlook.com (2603:10b6:408:10d::31)
 by BN8PR12MB3585.namprd12.prod.outlook.com (2603:10b6:408:49::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 07:58:16 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::6d) by BN9PR03CA0596.outlook.office365.com
 (2603:10b6:408:10d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 07:58:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 07:58:15 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 5 Oct 2021
 02:58:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 5 Oct 2021
 00:58:13 -0700
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8
 via Frontend Transport; Tue, 5 Oct 2021 02:58:01 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <Harry.Wentland@amd.com>,
 <nicholas.kazlauskas@amd.com>, <Rodrigo.Siqueira@amd.com>,
 <wayne.lin@amd.com>, <stylon.wang@amd.com>, <jude.shih@amd.com>,
 <jimmy.kizito@amd.com>, <meenakshikumar.somasundaram@amd.com>, Jimmy Kizito
 <Jimmy.Kizito@amd.com>, Jun Lei <Jun.Lei@amd.com>, Wayne Lin
 <Wayne.Lin@amd.com>
Subject: [PATCH v2 13/23] drm/amd/display: Implement end of training for hop
 in DPIA display path
Date: Tue, 5 Oct 2021 15:51:55 +0800
Message-ID: <20211005075205.3467938-14-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005075205.3467938-1-Wayne.Lin@amd.com>
References: <20211005075205.3467938-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ac16fd-ad18-4a8e-422d-08d987d5e331
X-MS-TrafficTypeDiagnostic: BN8PR12MB3585:
X-Microsoft-Antispam-PRVS: <BN8PR12MB35857998ADAE71B2E1A36867FCAF9@BN8PR12MB3585.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTtWV4S5dNwp6HTfG26xzvFWiaesl0f+Vb1wLXRWscKyppHOFQ3RFDtXO4+NBVNmX9JPRyAHviJtONQwxzhh22d7EVdmUq8lLoXNXg8W1/VnOov71OvClogyArxC0yRleLHUPB8KLi5h0LMHRHqVpNuN/cYOH10cdMW1Ml9u2DfR4gJdh9jLxWJ2pOOVOCkM1EeDp18wpjviAtGZPv35Pm5GwbnBYV3ZfihsKRTNNN1tUfIG2suxftVA+ufwXoPXYKkcy9MXIIMErjOhRkwTHCEfNWaBqXohgNKXFNJfhgFV8EYfXgXyg0xxhhLxeM1IrLQu3t7y7gZ0867dZdmPnjrvqwEbhd1gTt5pxaDHtc1XFNUvo7CPjLY9bJFFRqw1qmLzr85ezWdaroIBfX+XEmZ7y4c/1VRCpQEEK6LJZnsVty3tInL3Ai6joTmzufkkCK5xWAoVEzIRhuGahFM6k8kQV6FBT14GuoiIz+vc/Jq0vs44nVwts0ECjYLkQh+/FSU7Hn2LV9syoPRkij3eGQDnQ27HcXt5hkmIjd4+hp/TDc0OnQXLYKi8NyAD1QTLDMSCqGIuf5hGtZgiIeE9k1lMnugTLRfnsHVsUqNr0ZBww2M9FUV8NWakt5OKhY8kZA57ZrFS0aK+NB1y54163F/FZPrmM3xDtbNEFU+KX/2j6DB1atZxTzkDiNMYJB7FfOjhRSIWnhxxKxEsKxnjcs1KNo9UHHxfGUVfk/uHNSQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36860700001)(186003)(2616005)(81166007)(1076003)(426003)(47076005)(6666004)(54906003)(36756003)(5660300002)(8676002)(356005)(83380400001)(316002)(6916009)(26005)(508600001)(7696005)(2906002)(4326008)(70206006)(86362001)(82310400003)(70586007)(336012)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 07:58:15.8631 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ac16fd-ad18-4a8e-422d-08d987d5e331
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3585
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

From: Jimmy Kizito <Jimmy.Kizito@amd.com>

[Why & How]
Clear training pattern sequence for hop in display path once clock
recovery and equalization phases of DP tunnel link training completed.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Wayne Lin <Wayne.Lin@amd.com>
Acked-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Jimmy Kizito <Jimmy.Kizito@amd.com>
---
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 10 ++-
 .../drm/amd/display/dc/core/dc_link_dpia.c    | 77 ++++++++++++++++++-
 2 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 7f6fd0a3bf18..bfba1d2c6a18 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2391,14 +2391,20 @@ bool perform_link_training_with_retries(
 			dc_link_dp_perform_link_training_skip_aux(link, &current_setting);
 			return true;
 		} else {
-			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA)
+			/** @todo Consolidate USB4 DP and DPx.x training. */
+			if (link->ep_type == DISPLAY_ENDPOINT_USB4_DPIA) {
 				status = dc_link_dpia_perform_link_training(link,
 									    &current_setting,
 									    skip_video_pattern);
-			else
+
+				/* Transmit idle pattern once training successful. */
+				if (status == LINK_TRAINING_SUCCESS)
+					dp_set_hw_test_pattern(link, DP_TEST_PATTERN_VIDEO_MODE, NULL, 0);
+			} else {
 				status = dc_link_dp_perform_link_training(link,
 									  &current_setting,
 									  skip_video_pattern);
+			}
 
 			if (status == LINK_TRAINING_SUCCESS)
 				return true;
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
index fa7539916c77..4b1ad057bd1f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dpia.c
@@ -730,13 +730,84 @@ static enum link_training_result dpia_training_eq_phase(struct dc_link *link,
 }
 
 /* End training of specified hop in display path. */
+static enum dc_status dpcd_clear_lt_pattern(struct dc_link *link, uint32_t hop)
+{
+	union dpcd_training_pattern dpcd_pattern = { {0} };
+	uint32_t dpcd_tps_offset = DP_TRAINING_PATTERN_SET;
+	enum dc_status status;
+
+	if (hop != DPRX)
+		dpcd_tps_offset = DP_TRAINING_PATTERN_SET_PHY_REPEATER1 +
+			((DP_REPEATER_CONFIGURATION_AND_STATUS_SIZE) * (hop - 1));
+
+	status = core_link_write_dpcd(link,
+			DP_TRAINING_PATTERN_SET,
+			&dpcd_pattern.raw,
+			sizeof(dpcd_pattern.raw));
+
+	return status;
+}
+
+/* End training of specified hop in display path.
+ *
+ * In transparent LTTPR mode:
+ * - driver clears training pattern for the specified hop in DPCD.
+ * In non-transparent LTTPR mode:
+ * - in addition to clearing training pattern, driver issues USB4 tunneling
+ * (SET_CONFIG) messages to notify DPOA when training is done for first hop
+ * (DPTX-to-DPIA) and last hop (DPRX).
+ *
+ * @param link DPIA link being trained.
+ * @param hop Hop in display path. DPRX = 0.
+ */
 static enum link_training_result dpia_training_end(struct dc_link *link,
 		uint32_t hop)
 {
-	enum link_training_result result;
+	enum link_training_result result = LINK_TRAINING_SUCCESS;
+	uint8_t repeater_cnt = 0; /* Number of hops/repeaters in display path. */
+	enum dc_status status;
 
-	/** @todo Fail until implemented. */
-	result = LINK_TRAINING_ABORT;
+	if (link->lttpr_mode == LTTPR_MODE_NON_TRANSPARENT) {
+		repeater_cnt = dp_convert_to_count(link->dpcd_caps.lttpr_caps.phy_repeater_cnt);
+
+		if (hop == repeater_cnt) { /* DPTX-to-DPIA */
+			/* Send SET_CONFIG(SET_TRAINING:0xff) to notify DPOA that
+			 * DPTX-to-DPIA hop trained. No DPCD write needed for first hop.
+			 */
+			status = core_link_send_set_config(link,
+					DPIA_SET_CFG_SET_TRAINING,
+					DPIA_TS_UFP_DONE);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		} else { /* DPOA-to-x */
+			/* Write 0x0 to TRAINING_PATTERN_SET */
+			status = dpcd_clear_lt_pattern(link, hop);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		}
+
+		/* Notify DPOA that non-transparent link training of DPRX done. */
+		if (hop == DPRX && result != LINK_TRAINING_ABORT) {
+			status = core_link_send_set_config(link,
+					DPIA_SET_CFG_SET_TRAINING,
+					DPIA_TS_DPRX_DONE);
+			if (status != DC_OK)
+				result = LINK_TRAINING_ABORT;
+		}
+
+	} else { /* non-LTTPR or transparent LTTPR. */
+		/* Write 0x0 to TRAINING_PATTERN_SET */
+		status = dpcd_clear_lt_pattern(link, hop);
+		if (status != DC_OK)
+			result = LINK_TRAINING_ABORT;
+	}
+
+	DC_LOG_HW_LINK_TRAINING("%s\n DPIA(%d) end\n - hop(%d)\n - result(%d)\n - LTTPR mode(%d)\n",
+				__func__,
+				link->link_id.enum_id - ENUM_ID_1,
+				hop,
+				result,
+				link->lttpr_mode);
 
 	return result;
 }
-- 
2.25.1

