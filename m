Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4323B34D
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Aug 2020 05:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC97A6E419;
	Tue,  4 Aug 2020 03:39:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C876E419
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Aug 2020 03:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lu+ZJO/bl1jVU1I016NY+mzRSnTXc8qtsbRXhg5jJEv+EhCBMhUmlu3cWgpVoeS9wiQRCt/gybx76X7dZ8SC0UpOWv1JhHQnlD1xtvJLoq3tR7pXcrprQlV9eliucTSR4FRrb3Io3s56BLFQT018JGzkE+IXgEuvn33rnpakZ/7om2HPDh2XfvQrsaNa6vuaQ71Y5ZtxfkuETILcrtdfG6chd8qqR24IlTS+pwCOi+h4NiMF8bcuNG6VnNu7QU2drmY3naFxuj6XLNCAMDXWxQwkidQ2ov22zgcK/JT65xnHwk7YkjOQWcZLZecA5GqRO5nLZJiebrkG+qyD6yKujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17PCS59Nk9txhTWIkqK9PtWeUMPCn0ENGTMnbqYBXV8=;
 b=Y5ntvj9tUfJk3cI5HtOcCRRmk80oPG0/0oXRHZbiWSXB1XZBayhoBVk8rgZtjvyJ4Mn6gRXvWZl/6snWowqgqBkxer6kgNvi3nC2tl4KGqstZhIFJUtftV9aMwH9qEB2TXL87bza3sXwEDUp7MKlaZe9crWqLj/QV56stxK2JCalnMv9BtgvJ5d0g6WVq4WOhoEjEFZgO8gwpD6vWiWqWi50SMzmmtShdtR/JlDM9pxvm76iaqFnGnkxeD5HsfJ/2s9RJW13uRRowQAYgcwkIKa+BfQKYTxjwk66qq70d70UxoTwDN9bj4d7c6F0zEfqolfpl6BEn8Oo/ZjRyTvR8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17PCS59Nk9txhTWIkqK9PtWeUMPCn0ENGTMnbqYBXV8=;
 b=obkEzQySsV++khlp63caeW9Yd0RHvhbGS1yn/PwTUpS2ubJPw72na3GH8urhslTbPjiYraETqM30z7DwkToh1wpjd33ppakir1X8goT/zcUwizAQ/WBqN5ai63h0EmoUOKVjOZK7LP7EVbmyAAWYbAjfOChoHa5bUeBPey3wWiw=
Received: from MWHPR21CA0060.namprd21.prod.outlook.com (2603:10b6:300:db::22)
 by MN2PR12MB3695.namprd12.prod.outlook.com (2603:10b6:208:15a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 4 Aug
 2020 03:39:03 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:db:cafe::16) by MWHPR21CA0060.outlook.office365.com
 (2603:10b6:300:db::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.1 via Frontend
 Transport; Tue, 4 Aug 2020 03:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 03:39:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Aug 2020
 22:39:01 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 3 Aug 2020
 22:39:00 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 3 Aug 2020 22:38:59 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/mst: clean DP main link status only when unplug mst
 1st link
Date: Tue, 4 Aug 2020 11:36:31 +0800
Message-ID: <20200804033631.32733-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb72c6a6-165f-4bda-9cd4-08d83827ee23
X-MS-TrafficTypeDiagnostic: MN2PR12MB3695:
X-Microsoft-Antispam-PRVS: <MN2PR12MB369502D676C42A1F5121360CFC4A0@MN2PR12MB3695.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dWQCDDQgtrrs4bvX0/f2mALRXzxtquYLkd88qb3NuyX73YZtq4tmg5UyustB8rP8UEsgNzTKA48rHWjyDyyklQNSEJ+WhX0RGdYW/RBQuitLBYJS0HRwVr+/sNlLV48g3PoPsoptfH2FEQ70VICYkJCSxHRrIf7+w5WOJtfRiS3I+lKIOx9/YiqBt0k1Io3CGHHJyiSWs0SODwQ32COjZv+gYOhyyTSK56DyS/vXxynehdgSqROBLKygtLidzE/YQUsJhCzkGx0IYn4hTC3wlIKoqjscC9+pRGBAtaBzFq/nCQNK9tBpJs2uAkeGVG7CNYehkaCitZ/gqtiJ0hRWPl3MYAJ2m0MP8gDJ8WSJ4Ek7BqL8tVTckpDiWnqrYPhH1Uh7zu413IheTVgZLLrDIQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966005)(5660300002)(54906003)(8676002)(36756003)(6666004)(1076003)(70206006)(2906002)(6916009)(83380400001)(426003)(2616005)(86362001)(7696005)(336012)(316002)(81166007)(356005)(82310400002)(478600001)(47076004)(4326008)(8936002)(26005)(186003)(82740400003)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 03:39:02.1537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb72c6a6-165f-4bda-9cd4-08d83827ee23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3695
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
Cc: Rodrigo.Siqueira@amd.com, jerry.zuo@amd.com, aurabindo.pillai@amd.com,
 hersenxs.wu@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
Under DP daisy chain scenario as below:

	Src - Monitor_1 - Monitor_2

If unplug 2nd Monitor_2 and plug in again, observe that Monitor_1
doesn't light up.

When unplug 2nd monitor, we clear the
dc_link->cur_link_settings.lane_count in dm_dp_destroy_mst_connector().
However this link status is a shared data structure by all connected mst
monitors. Although the 2nd monitor is gone, this link status should
still be retained for other connected mst monitors. Otherwise, when we
plug the 2nd monitor in again, we find out that main link is not trained
and do link training again. Payload ID Table for Monitor_1 is ruined and
we don't reallocate it.

[How]
In dm_dp_destroy_mst_connector(), only clean the cur_link_settings when
we no longer do mst mode.

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 2c10352fa514..526f29598403 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -415,7 +415,10 @@ static void dm_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
 					   aconnector->dc_sink);
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
-		aconnector->dc_link->cur_link_settings.lane_count = 0;
+		mutex_lock(&mgr->lock);
+		if (!mgr->mst_state)
+			aconnector->dc_link->cur_link_settings.lane_count = 0;
+		mutex_unlock(&mgr->lock);
 	}
 
 	drm_connector_unregister(connector);
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
