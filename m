Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989E45622C4
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jun 2022 21:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36111B45E;
	Thu, 30 Jun 2022 19:14:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A382711AB70
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jun 2022 19:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTRhkoDnju85f5SewcXTmQiaRZW3dbfCiuPtPKxuT6mRsCmkeatarhkrJcN++2ofwE6YbPhu8MaLGdnXKckaOZzMyEY+2HM8IcHfrpkMFrmjEL0xAFH9hrlA8TbtUVKrvZaRHqqCgihgT1jCP+/lREQq4jf1ojXje0KZjji0uaHEjl/FrvbjyWiA5Lf8zcosLKUtqhgpaS5ugauV68ExElPdRKpzuIY7a8174odA+grceg58HxtWUrrB9gF4VC8q7f8E68O/OH3T24bXiIZpxk8OiMsMtws24n50QkBvzRzFvkW0kdm8BbcsW7m9C6Dij4CEcAjvgLMxFNVMt08JHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/D1A6tNM6gMu7KIOVeLeGdYoarG1OmZOw8a0NZh0k0=;
 b=HH8e8pqYebQdROwEmHe5m+FPeyGRm+j1QWWCekMe7N/J/Vz1SKBww3cPQiLHiIi86jqZQTkWNS56Xh9a74FvdJEjxqj7c3S77VnofFgkjURIGQRJk1QMjXLjxYrw8N2xtpZK/pwoXaFj9Q4JrqMk34NY2vcUoYYd/UxsCA3QsCPMMhOq7rvWTZEE+OcLLkcx6GS1R27+q77H8+CZ8tNeQ3hBptsInlzgpYTUNwr3K/1mXtzQYDNC4cw11RjStiFdM2+RZI5YtwcBMLd6Dro3CjOXG2a5sHax/4UvIrESw3PYbxPXUwtYXX+WmHZJjcrryiqReSvQBcJ1ruvxkI1Mrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/D1A6tNM6gMu7KIOVeLeGdYoarG1OmZOw8a0NZh0k0=;
 b=Xbp7JUthq8XJSAh06poKEFgoWWgCKxUAdc6AAb4T1OtqqxBzOUk4uNa2LHHPRYpBK/v0CjSId19wsUIw2ZNRwGpFcP7aImE5yV9SORjsl3TPuiyxDolZxmYZ4V5UyPD3db3O5Y/ZS2d557hZL1/Wft7VbZgiJPqHy0YJzmNGhHw=
Received: from BN9PR03CA0768.namprd03.prod.outlook.com (2603:10b6:408:13a::23)
 by BN6PR12MB1330.namprd12.prod.outlook.com (2603:10b6:404:1e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 19:14:03 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::ea) by BN9PR03CA0768.outlook.office365.com
 (2603:10b6:408:13a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 19:14:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Thu, 30 Jun 2022 19:14:03 +0000
Received: from atma2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 14:14:01 -0500
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 13/40] drm/amd/display: Add SubVP control lock
Date: Thu, 30 Jun 2022 15:12:55 -0400
Message-ID: <20220630191322.909650-14-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
References: <20220630191322.909650-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d21392fb-a659-47cc-9dbf-08da5accb1fe
X-MS-TrafficTypeDiagnostic: BN6PR12MB1330:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4Hz8CjbgA/PX5B6Ql9OxhITsVER4GEpoXcair+abJ8r1eUuRQWl7dJHwxrcHx5PptceBZdTGWRrRqAR7nYK6G8V9vTNylOWNHFZklBqoCF++jCxphDjAE3i5FzzFotxOnEYMDfBDhJVe1ib9BHQqsgRChBlIwXFKIt4CwXAHgE3f66SZu0lo3qz1HhZtluSCQOOuocFc6FaQnpOXlkrlY0fX4QA8NrP8Ga2U0xUJhjNAlMhMP36oS/eq3dki54ahqwzc9HcrKrOQjX1sQBoGlZqX3J4MXC8RAuIUzmH0ue4Xk5nQcZhSmIGn2gfX8ka5JHBjBeYjFcK0mxrUYZP2e6KO8oO9M+hSqdvoBU0gFvLsry+7yakxKMTgPO68Uq4ZyF8+L3W+H5vUdEoYitoYAxk8AyjTpHKLnoOIcaG1LJe0govMIIWi1rqCD6imFRThR8cd6SIK1c2Tnflbg9+OKKISEwcVxJ0iKqRUKyXKy85zU6J75IwlmSELbh81N3vYsnHE4kHURY0CAm46KGZyv2n0vaosZn/T2Q+mYeclQTBM1W2xZwvMPZQQ37TuvFb3a0KrcRNvaNUCwI77iCZWgmcjQCrBtwV+/i9lSOgqQxSXHQrYOynpjqCshQ2zYB43sHU/gZ2ZOqpoLn38OAPe28Ry3RmAo++dSeUyFoCv1DT4qpbpzdE6KEzGs7wuEsU5Zitxb5/huu4IgjroDX8zx69C57b2nF5bk2AwJ4vUTu8rGXpLesIFPvqnf1ZqFJHXOV0X4p/O5VNki29rR9fHtcNld6nKuNgHcKLStQagdj+SZi7EorBGc1xB69kPQezVdxE5C6iyd1jLdVo/tRejITGo7r6hET0bXXPzvxgPA8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(36840700001)(46966006)(40470700004)(336012)(1076003)(186003)(6666004)(16526019)(7696005)(47076005)(54906003)(6916009)(316002)(5660300002)(86362001)(70206006)(356005)(70586007)(2616005)(41300700001)(26005)(8676002)(4326008)(8936002)(2906002)(426003)(36860700001)(83380400001)(40480700001)(82310400005)(478600001)(36756003)(81166007)(82740400003)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 19:14:03.1647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21392fb-a659-47cc-9dbf-08da5accb1fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1330
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
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, jerry.zuo@amd.com, Aurabindo.Pillai@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com,
 agustin.gutierrez@amd.com, pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index db02f071c949..05c2e178ca99 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3201,15 +3201,19 @@ static void commit_planes_for_stream(struct dc *dc,
 
 	}
 
-#ifdef CONFIG_DRM_AMD_DC_DCN
 		if (update_type != UPDATE_TYPE_FAST)
 			if (dc->hwss.commit_subvp_config)
 				dc->hwss.commit_subvp_config(dc, context);
-#endif
-		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock)
+
+		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
 			dc->hwss.interdependent_update_lock(dc, context, false);
-		else
+			if (dc->hwss.subvp_pipe_control_lock)
+				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
+		} else {
 			dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
+			if (dc->hwss.subvp_pipe_control_lock)
+				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, top_pipe_to_program, subvp_prev_use);
+		}
 
 	if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
 		if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
-- 
2.25.1

