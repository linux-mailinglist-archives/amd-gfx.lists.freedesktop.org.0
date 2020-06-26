Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD520B5C9
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2020 18:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8376ECE1;
	Fri, 26 Jun 2020 16:20:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324F06ECE0
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2020 16:20:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTxjWxYbYLcUAAc23OVdOxMv4WKx6P84+eCnVRZMnIsoW7TU7RRfX/gMVlkqZTKJSxuQJWxxmgClhuEFAWZ5MmYY46r/3fGIXx53EttID0Pk+KBDRYTbwep7o9g/WM9I1+Sitlb2Cq3cjj6VSC8h0/Gbw6iTYWm083NLixEBiwQZactv2ComPLeeAPH8lfEf4kYsQ87GX0/1cp5VnvCWetJ9sAc/WeDNd1y/nqMs6gX4mptFC+8+tU5tQgvTn08LLLyscuUo/kv3DzsLgJIu3WHmfw23qkiUnsVg0tEaV7VqzlQasYP8L8sXrqI01f5iLXOAvAwDMslCP0Jk+BM7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhTCoC6ivicdaqkv7EGujxECkdU/lGWI45uaY1SnXLM=;
 b=V0sPsYYDnJWBCPvX5vv0T0Z+0FDNAJgONHcIE9eWA57Cfa1mKm40zjVSXiqIAQbzuFAuE9PZQX2b5FcwmSKLO/+OeaatvllL9obugNtwDucMvK25mQiaIjxGZo2YfjhZzV3Laj8frJgPe2FxLOb6Wa6Qm4iGfVqUwidhfYm5oJ1c45jOEc7nkLuUilB/jGoZ+OeZVdvKcCDJGKS3oGPieVGOjZG48JypCDHe6aH7PkphUcePNtPlSoPtf4osmggtN/bQHbEmGLmiUcrjV/BrEHHSqY3OICmRHVKDzFI49mWRAKYMcRMnmASiFGpY2oTE6iQjaZHVQ367X1DuJ44/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhTCoC6ivicdaqkv7EGujxECkdU/lGWI45uaY1SnXLM=;
 b=b1s+4ocEvP4HEQxmcOSHgWZTwRF7lqqXCG0Sn7roQlUtfc9mv/IdYuMxqmgJvS7cFPbmxBlnt3HUJNdEy49lM+CQN3egWsdJkWPoZxot4B9aFPkTZS6fGBO8JFAWckK05CsZ0mSR6bMlowCN8tG4goCtk2HZQEn4SB0h0276thg=
Received: from MWHPR14CA0021.namprd14.prod.outlook.com (2603:10b6:300:ae::31)
 by DM6PR12MB3929.namprd12.prod.outlook.com (2603:10b6:5:148::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 16:20:00 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::73) by MWHPR14CA0021.outlook.office365.com
 (2603:10b6:300:ae::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21 via Frontend
 Transport; Fri, 26 Jun 2020 16:19:59 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 16:19:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jun
 2020 11:19:59 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jun
 2020 11:19:58 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 26 Jun 2020 11:19:53 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/11] drm/amd/display: 3.2.92
Date: Fri, 26 Jun 2020 12:18:46 -0400
Message-ID: <20200626161847.16000-11-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626161847.16000-1-eryk.brol@amd.com>
References: <20200626161847.16000-1-eryk.brol@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966005)(2906002)(426003)(478600001)(82740400003)(47076004)(81166007)(54906003)(1076003)(86362001)(8676002)(82310400002)(8936002)(4744005)(70206006)(316002)(26005)(36756003)(186003)(356005)(6916009)(336012)(83380400001)(6666004)(5660300002)(2616005)(70586007)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 726540b4-d1f4-4551-e716-08d819ecc600
X-MS-TrafficTypeDiagnostic: DM6PR12MB3929:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39293EF3F9E2268C23D1CF20E5930@DM6PR12MB3929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /+VCk+V78nn2iBM7wcjlM54kJm5F6ABQsmikjFAgO94ITSkmGz3FaO+0TG0O0GD8oRwWktua8P5xErp15HLQKlhQq9wuCHXFOyqw478rju99ZRZ/Tfp1X64gxMyRQIy6zX6Y00XmtWyEDbBe7GDt+4rC2JKwJ0u3j8iWHzgo53nPNEjKe2JxK6HINp5ZBC/o6oi/8pf3snONJELYPCmobnonlUlxG2ETmaN/q8m3O+xIxjf6kUsMAleFsUZ8sr7tOMbWMc29JOXur/ktQFR40mqWU59kS0um9l1sF8nE6CalZaI64sCFufGIae5/8yOgTUlAVoqKmoE1n48Ja/ltKVlNmT8KHGU+nYLe2Lbcy9YGL7A8dV2ZBdmYoOQKE804znpKrQLQDFxgv7N5ofXGWA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 16:19:59.6130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 726540b4-d1f4-4551-e716-08d819ecc600
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3929
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
Cc: Aric Cyr <Aric.Cyr@amd.com>, eryk.brol@amd.com, Sunpeng.Li@amd.com,
 Harry.Wentland@amd.com, qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com,
 Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aric Cyr <aric.cyr@amd.com>

Signed-off-by: Aric Cyr <aric.cyr@amd.com>
Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 01ef2a3c1f3c..90cc3abe26f2 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -42,7 +42,7 @@
 #include "inc/hw/dmcu.h"
 #include "dml/display_mode_lib.h"
 
-#define DC_VER "3.2.91"
+#define DC_VER "3.2.92"
 
 #define MAX_SURFACES 3
 #define MAX_PLANES 6
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
