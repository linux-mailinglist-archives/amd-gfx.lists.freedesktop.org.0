Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99657E881
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Jul 2022 22:41:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7FA11A1E3;
	Fri, 22 Jul 2022 20:41:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E662C11A5CE
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Jul 2022 20:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+wNZwztfzJas+BTy4u+46gq9Ps3DXz4241g9rZCs09iEe+QNrJUKI+fUhEryJ2KpMG50eLUAVUXjExzf+7zA2pRqA8YVEG7o+4ginaPuIYuNRKXiVtzpDzDgoKcAQl+JQYk4hxpxI2vz8Xzq2N40oon9qYTm1hx4HgTwJYvVV+gLGWEn4VI9Ed5nsN+JQsUhspJOJfN1kyCm/pOK+G2i77luFuxxKGVRzDn9TK/AD6RMRTl3SEaoVz4CqMuNQSkN1NLbpmUxNHjPPNVb1kr4SvrkErPaTcIRRm2idWxzIxJRXyTK7DBpSp9C6BqZeckGtDByZJtZdVez5OvtlcJPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8gUp1K65FkKlNvc0jMDZyipwvOZWmDb9Fp5+UU1H0Q=;
 b=VO/pAxn9BjaENXS1tvkUU0dDzpc0SQ3JIAdTmi9FSzrRm3isLzYQMVeH0GwkmFLuFB7FziworhwlQynTIEz2GxFoWMKbhfJcJGaEKYVzUnwqiAoAo6yDU2QD/MBybvBVdsFcbWSwZk6AsbKvttITabkvmuR7s1HofmmUrg3Bokl4lUm93QhU25ikCejG1ljDAvqF8oV4VHbgdu0GDEZiI1cpWzEh2NEH56AcT7Y9HEVNr8KnFMTqT5LhRhFuX+qNZVTbbzkJENFE/QZmWrPFjGPuAhOIqb4s0U7V03mqcQ7yiA5DP7+JoTcFB2ULFCQtXfGpkJXAZSTYElM6TPjaxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8gUp1K65FkKlNvc0jMDZyipwvOZWmDb9Fp5+UU1H0Q=;
 b=CWi+upkatzmiGYEByzSxOsMQgCKx51xR1GW+Bxn4qlU5VDyvguNMaFuvtm5o72+5KrUxJAY82QIpXpfXE2VOSHm8v2fI5orUbOOW1EZPUjPqo7leI+F6HqeA2PHKMsMxY4WZ1mKxYFFZ6r0MsH+dCY3D9JE5B34TyIPVdxiXTJA=
Received: from DS7PR03CA0313.namprd03.prod.outlook.com (2603:10b6:8:2b::18) by
 BN6PR12MB1539.namprd12.prod.outlook.com (2603:10b6:405:6::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Fri, 22 Jul 2022 20:41:44 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2b:cafe::2e) by DS7PR03CA0313.outlook.office365.com
 (2603:10b6:8:2b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 20:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 20:41:44 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 22 Jul
 2022 15:41:39 -0500
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 19/31] drm/amd/display: Add OTG/ODM functions
Date: Fri, 22 Jul 2022 14:31:25 -0600
Message-ID: <20220722203137.4043516-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722203137.4043516-1-alex.hung@amd.com>
References: <20220722203137.4043516-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d1e5bc9-02bb-4d38-1061-08da6c2296f2
X-MS-TrafficTypeDiagnostic: BN6PR12MB1539:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uiW6mor3/Pw27rO8uCrLKiEt9o4e1ZlvdMz4lCEyq02WiecugMd9ZtzjW/ge24XNRrgwwBYjvOgqiT+JkPrSplZMmcE+AwGjsMTOOiqdXwGo3u9ZzAP4VdxOdVh1XxrgO68tD/zP7Wp/NIRuHc9IeNX6PbZMv8jlLO7HDI66LAHZzlR4im0nnpDPSHPAD/t7iTvWvMlP8f0cioR1Z407fk7lInyi1fon494JM6lAQWEKG5w0DGxtKsc8NsdyQrJlxF0OCCuvtHqjWkynHqMNItNno7chGxPP8Uid6jF0rFTiz7LxC+1Nh3PJljFJeYJLM6obweqTIDGJaqbqhj4SxWkYT7Jm5X+oQa1erKayEk9Z7fOkd5WAdvQ4Pbr3/oXrj6xE3eXTO4LH0ZvK//nJAGFjgfkDo676vzQVwNBgfXKiklpCG5a/a/lh+o0BR0OfskcgBmwlPn2W3juJq6FSrqzWVq8AumnHirmqbRxJLSufcqRTI+JnmOXg9oRkypCRObYPyE3yloM2wG4OKdCs10TntysEMGn3kbr+xQxAn6idu/TYDu75ivCx56XsqEzJnkJa+yYTlfLSiwz3UQfGPPS45uFzY368GwTvD7FoolR/mCg0ioaEqEOy2zEq+Po8E6fwm3MDq6yBNtziiXJTmgwvzeBxKstzi1lfoPMbm11uBLBAPZnZNsRGx7Bf4W+/HOERseh7pDcCnEGegaPP0yA3UA3LyAa83wOp4OvEcVC5rX/tQjPcqzAFwTMKeRl6RTILYTUFtSGg8p1dKZZLT7OmHnnQQ7+mEBJSthGsAu0+FSfsDf3UhQKNk//M4QqJJJGeK3r8lnxrJsvLZZMBVg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(478600001)(6666004)(2906002)(83380400001)(81166007)(7696005)(82740400003)(8936002)(26005)(36860700001)(8676002)(44832011)(41300700001)(5660300002)(40460700003)(336012)(47076005)(82310400005)(186003)(2616005)(1076003)(36756003)(426003)(16526019)(86362001)(40480700001)(356005)(316002)(54906003)(70586007)(6916009)(4326008)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 20:41:44.2543 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d1e5bc9-02bb-4d38-1061-08da6c2296f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1539
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
Cc: stylon.wang@amd.com, mark.broadworth@amd.com, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 roman.li@amd.com, solomon.chiu@amd.com, daniel.wheeler@amd.com,
 Aurabindo.Pillai@amd.com, Michael Strauss <michael.strauss@amd.com>,
 wayne.lin@amd.com, Alex Hung <alex.hung@amd.com>, Bhawanpreet.Lakha@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michael Strauss <michael.strauss@amd.com>

[WHY]
Required for correct OTG_H_TIMING_CNTL programming

Reviewed-by: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Michael Strauss <michael.strauss@amd.com>
---
 .../drm/amd/display/dc/dcn314/dcn314_optc.c   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
index 3011f9e2f35c..0c7980266b85 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
@@ -160,6 +160,37 @@ void optc314_phantom_crtc_post_enable(struct timing_generator *optc)
 	REG_WAIT(OTG_CLOCK_CONTROL, OTG_BUSY, 0, 1, 100000);
 }
 
+static void optc314_set_odm_bypass(struct timing_generator *optc,
+		const struct dc_crtc_timing *dc_crtc_timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	enum h_timing_div_mode h_div = H_TIMING_NO_DIV;
+
+	REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
+			OPTC_NUM_OF_INPUT_SEGMENT, 0,
+			OPTC_SEG0_SRC_SEL, optc->inst,
+			OPTC_SEG1_SRC_SEL, 0xf,
+			OPTC_SEG2_SRC_SEL, 0xf,
+			OPTC_SEG3_SRC_SEL, 0xf
+			);
+
+	h_div = optc1_is_two_pixels_per_containter(dc_crtc_timing);
+	REG_UPDATE(OTG_H_TIMING_CNTL,
+			OTG_H_TIMING_DIV_MODE, h_div);
+
+	REG_SET(OPTC_MEMORY_CONFIG, 0,
+			OPTC_MEM_SEL, 0);
+	optc1->opp_count = 1;
+}
+
+static void optc314_set_h_timing_div_manual_mode(struct timing_generator *optc, bool manual_mode)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	REG_UPDATE(OTG_H_TIMING_CNTL,
+			OTG_H_TIMING_DIV_MODE_MANUAL, manual_mode ? 1 : 0);
+}
+
 
 static struct timing_generator_funcs dcn314_tg_funcs = {
 		.validate_timing = optc1_validate_timing,
@@ -222,6 +253,9 @@ static struct timing_generator_funcs dcn314_tg_funcs = {
 		.setup_manual_trigger = optc2_setup_manual_trigger,
 		.get_hw_timing = optc1_get_hw_timing,
 		.init_odm = optc3_init_odm,
+		.set_odm_bypass = optc314_set_odm_bypass,
+		.set_odm_combine = optc314_set_odm_combine,
+		.set_h_timing_div_manual_mode = optc314_set_h_timing_div_manual_mode,
 };
 
 void dcn314_timing_generator_init(struct optc *optc1)
-- 
2.37.1

