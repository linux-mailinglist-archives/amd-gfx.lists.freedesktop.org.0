Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7C8264746
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Sep 2020 15:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244B26E949;
	Thu, 10 Sep 2020 13:47:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DABB6E941
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Sep 2020 13:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/Z5z2ZsIsSxC61ANmyq7IpKmUHnlpRGGQk1d66NWbqNA/CKmJU3ZL1qxUQ2s85jQNrJCFpZWrCdnJTFFw/0KOZRpyWQ75GopHNNIXEmf3u/Z3ZJ8McMd9lTasUOByy2LS8vGLxjOCCxOTbRdL0G+VNdRt7lfbN+GGE25Yj9SdLhLbVGEBhBettjHiDigTzVYNitXp5hUlQosNC20+NqUMzl1ZBWkBb/FVhjmS8qAqDqlVe0dgmdrWIVMsywr1tbOd4xPgLwiDzKoVmb6esrN8kskjjbqg0IIld6QoWnY2bFLEDeJZo60/JlSryai2jcXoZddKpukMNxpBbVxjY6KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jymRjskVKw8u/0PrJ1tWNqskfK0vGnR3TWfYOjGu16w=;
 b=NCbXkl0iW5BPhdiirkyt5jM4fHDCw5ks63ggJFmUzHmHovSGAl3nS0ePwB+D4CnXF1xFRyuhSUPLyWg16P6CuDEMpgJuzUA/XKSpFurkbiOx4r6xzNGQwS8vVJQv8dFP7TnLM7hVN0fpDBGAi8upOT2jkpOX35tIrv7EkoLxEeNiZ7LaSwPSZBQ48mZMpkmYRmNoQtrv+r6IId1WX7RIq3c+fRJgy6/6alcgbAqSONXzF10ebieUopP5PtcIpU8hropLK8qS+mcapqyv9WNb27gcgV9M5ryT1EMlc3bdrXdTFGGkEryms+GS7BI/S34zfxarsw0qSteX6Ib2C1rbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jymRjskVKw8u/0PrJ1tWNqskfK0vGnR3TWfYOjGu16w=;
 b=Z0tk0+DsLypWkzJSD5DL6tk81fkREjFVmsXZxkq2LtH5U8GPAc3eID/hNhvxyw4Lwn3LCivQAbkrDRlwTVq5JlWiSUZZOc7++W9rRTvnzBD/iF5XxCgjV++cSQzAJZj9dQNQ8fwJzTG8xAYtmNoFiw5te++sFk939gyJ8Foq5ew=
Received: from BN6PR2001CA0045.namprd20.prod.outlook.com
 (2603:10b6:405:16::31) by DM5PR12MB2438.namprd12.prod.outlook.com
 (2603:10b6:4:b5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 10 Sep
 2020 13:47:35 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:16:cafe::5c) by BN6PR2001CA0045.outlook.office365.com
 (2603:10b6:405:16::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Thu, 10 Sep 2020 13:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3370.16 via Frontend Transport; Thu, 10 Sep 2020 13:47:35 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 10 Sep
 2020 08:47:34 -0500
Received: from aj-EliteDesk.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 10 Sep 2020 08:47:34 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 16/42] drm/amd/display: Increase Max EDID Size Constant
Date: Thu, 10 Sep 2020 09:46:57 -0400
Message-ID: <20200910134723.27410-17-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134723.27410-1-aurabindo.pillai@amd.com>
References: <20200910134723.27410-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c3b0953-5ba1-4d89-afe7-08d855901316
X-MS-TrafficTypeDiagnostic: DM5PR12MB2438:
X-Microsoft-Antispam-PRVS: <DM5PR12MB24380F04FF10A35C350AE8148B270@DM5PR12MB2438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:321;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wrLCvtCZsmymUcnlFNR9MbHLQ3ZAX8rvB5ZdhbM9nVdFwZIF7/KKFpDE76uTDgrH+9vpsOLQ4dOI39OdfJDK4kporvaptAcbHPuOEjTWSD1m7eWjz9JnQ80HTeT5y1fP0Hzep45T+tMdSkOn5nqOSzWLgS7S9gsBXTib401JFXQ0+eFGFctBX0UEwjsq6IBvvkw2hnlWzmOZZCYZ/vCDjiFDdQbnXBfrPvJOrH64u4UVlMGpFcriA1NXsMDkhK9tqpoj9v5xjGd36UsHfb958GPCiZNqFht1yxs9utc8XTa2N6rhpGL4cKpqGySjrn2sqit5/W9c1w9CuGAgz4jGkXvys2uhH8AZOOB1YTQnbo93NgsFiS2AfOCCFyPt3MpPF1+oH0SQR068XHux+M/B4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966005)(70586007)(83380400001)(81166007)(478600001)(6916009)(36756003)(82310400003)(316002)(4326008)(336012)(47076004)(8936002)(186003)(70206006)(54906003)(8676002)(44832011)(426003)(82740400003)(26005)(1076003)(6666004)(5660300002)(2616005)(4744005)(86362001)(7696005)(356005)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2020 13:47:35.6390 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3b0953-5ba1-4d89-afe7-08d855901316
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2438
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
Cc: Eryk.Brol@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 Qingqing.Zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 Aidan Gratton <Aidan.Gratton@amd.com>, Aurabindo.Pillai@amd.com,
 Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aidan Gratton <Aidan.Gratton@amd.com>

[HOW & WHY]
Change max EDID size constant to 1280 to support
10-block EDIDs.

Signed-off-by: Aidan Gratton <Aidan.Gratton@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc_types.h b/drivers/gpu/drm/amd/display/dc/dc_types.h
index aa8e0955db48..c47a19719de2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_types.h
@@ -122,7 +122,7 @@ struct dc_context {
 };
 
 
-#define DC_MAX_EDID_BUFFER_SIZE 1024
+#define DC_MAX_EDID_BUFFER_SIZE 1280
 #define DC_EDID_BLOCK_SIZE 128
 #define MAX_SURFACE_NUM 4
 #define NUM_PIXEL_FORMATS 10
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
