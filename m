Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B891B22D041
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Jul 2020 23:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268686EA09;
	Fri, 24 Jul 2020 21:08:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF236EA09
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Jul 2020 21:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4OzRUKLXHw00ADWLEBdh4UfrxX0UD+MytC5o8njGxe82Fc5iFdQPtLElFVqpvJLPkYMixsvU6aqrkeA7ft/V03UI2kUi0bW8gjxPYZJJxX1qnzdF1ghmwMKFpCk46hOJT7B++mG0HYWzvuULFEaZlz5naJGVosWRX8QSFK0bBOlGVRERMfuz55+4ouMAvrRDpdQRUlUOyrISSrYuZb4t7y/FAY4FStY2ayyODMeHkCwpCRIhRQ28RRCfG3+CkrlmSQQO6iCo8NSZmoGMMtha78nMLz4A5CV49cPPgWvgMKshXQ5snO7W5FLt65RS/RR0hSjSYKaaeSppKTEfNumsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmJh9IASl7YXYUsM0keoHS75rbf7rQF76Ta6rA+dA80=;
 b=LXhWwGLYa563hR/nX8P3yQ0RHb180wqZ7a+QfHnIXAQZ7x5Q9PDl56TVUihGH6wvjXl3kXp1bDPCCY7HGJ9y2FWrUiM3z0Q8F2FjfOd3dnKRLMdW8ZDtgLK7gaiptKofFXEVS7fX7W9JFLWTM9Y4mBgXXc3517Qn8LxoO9jdu7qRufjNqaFh+5EkTocHc4BYnEXJCIFUUOGdQkcw4olXMqSQFNo8U2rnyZclIH5ZvnGKH0ZfMwTvgI2s9wR0OP3hdiMJixrEPqlZaolyzHetGvAfdmpX/SeCTdhBihL64veC/Dg1/FL5OXQtJDWbxcjtKlU5Nts95Xjhq3o4XJucjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmJh9IASl7YXYUsM0keoHS75rbf7rQF76Ta6rA+dA80=;
 b=u2yMputkFtQTc8EFLD+zPQ21lPW7YVmPDn+h5wVPY2s9NL7nYPemIdqVKoYLYgJUsmFwh1TJlW5gEi7JoTmF6HF1w0mC21xaemNb6pczzo57NQfJSKrJ5LCu8gMAFrxbCHWLxD6tYDkJ6a94+D++YwY6RcRNdswfxzVTM8OUkrg=
Received: from CO1PR15CA0073.namprd15.prod.outlook.com (2603:10b6:101:20::17)
 by MWHPR12MB1614.namprd12.prod.outlook.com (2603:10b6:301:f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Fri, 24 Jul
 2020 21:08:07 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::3d) by CO1PR15CA0073.outlook.office365.com
 (2603:10b6:101:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend
 Transport; Fri, 24 Jul 2020 21:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3216.10 via Frontend Transport; Fri, 24 Jul 2020 21:08:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 24 Jul
 2020 16:08:06 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 24 Jul
 2020 16:08:06 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 24 Jul 2020 16:08:00 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 12/15] drm/amd/display: Use hw lock mgr
Date: Fri, 24 Jul 2020 17:06:15 -0400
Message-ID: <20200724210618.2709738-13-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724210618.2709738-1-eryk.brol@amd.com>
References: <20200724210618.2709738-1-eryk.brol@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb29f1f3-1d0d-492e-1770-08d83015a9f0
X-MS-TrafficTypeDiagnostic: MWHPR12MB1614:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1614ED9EB1D2EC3F522E3E83E5770@MWHPR12MB1614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:459;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCI7yqaf8xZwxVTDsC3hpdrqlTh7ugfSgscQZW8FW3Orgo/d2kJ1PfQdlJXCco451ONWVOItN/qoHYHJzJBoPr1CgWMlJHcUDFw2PV9UOF4hIgvsfjGcboHeyQ1a0WEZw+DRISVxJuvheOIxNXgNG/koXZVRDvoGNnSlxL0fjgKXJvp/DbdL1rGwoepW8gjzJ+OZqDnTpUBIOEdD3X8c1DcANk5DN2kYYjllmG64KmS5WEAPM2pDERxtOBsvwYS0I4vH+IUeaBMy0AgRTE/2Itvj4erTMPwVtKT0wC15oecR269D76fBC9BUhSzLruPwqMpYCdlMmEkeRWO1f/DI+7DCtv7x3dUWdQGxsBuGkkvTkTcK5mWjiQYpCFxa3thh0EnIKtm569j2XT61KpuYuw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(46966005)(83380400001)(1076003)(356005)(82310400002)(36756003)(186003)(26005)(5660300002)(82740400003)(81166007)(47076004)(2616005)(8936002)(44832011)(478600001)(70206006)(70586007)(4326008)(8676002)(2906002)(6666004)(316002)(54906003)(6916009)(336012)(426003)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 21:08:07.4566 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb29f1f3-1d0d-492e-1770-08d83015a9f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1614
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
Cc: Eryk Brol <eryk.brol@amd.com>, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 Qingqing.Zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 Wyatt Wood <wyatt.wood@amd.com>, Bhawanpreet.Lakha@amd.com,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Wyatt Wood <wyatt.wood@amd.com>

[Why]
Feature requires synchronization of dig, pipe, and cursor locking
between driver and fw.

[How]
Set flag to force psr to use hw lock mgr.

Signed-off-by: Wyatt Wood <wyatt.wood@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
index 82e67bd81f2d..5167d6b8a48d 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c
@@ -233,8 +233,8 @@ static bool dmub_psr_copy_settings(struct dmub_psr *dmub,
 	copy_settings_data->frame_cap_ind			= psr_context->psrFrameCaptureIndicationReq;
 	copy_settings_data->debug.bitfields.visual_confirm	= dc->dc->debug.visual_confirm == VISUAL_CONFIRM_PSR ?
 									true : false;
+	copy_settings_data->debug.bitfields.use_hw_lock_mgr	= 1;
 	copy_settings_data->init_sdp_deadline			= psr_context->sdpTransmitLineNumDeadline;
-	copy_settings_data->debug.bitfields.use_hw_lock_mgr	= 0;
 
 	dc_dmub_srv_cmd_queue(dc->dmub_srv, &cmd);
 	dc_dmub_srv_cmd_execute(dc->dmub_srv);
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
