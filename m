Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308F20B5C4
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2020 18:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036866ECDC;
	Fri, 26 Jun 2020 16:19:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2C96ECD4
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2020 16:19:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo/4noqa+tyLB/uK2J85P8AR22jpdbYNSSuTIlKCbsOOOtD7mTZIYyIp2JIe+d8Kbo60XbPP0R7Huv5eLNMZUIl9pVgi17Mv3iYSnKBb5Aw/a20qRXBOpywL98UDtL3iackbDoxtkPTbV24ePJPNJ4a39gqC52O3Q54ocD/xu4Vt0xd35tJ4PpgFv+D6Zzz0h0GMB5RyAhPElKbXfb0v7Jf0nkcN0nQtPehe1R+3rFq5SUEpRsQn5vDQf+xWGx2wuhElziv+R4t8vaC73R3Up8j3tgMm4setuqKKfMdmfG4kz5aku7iRHC46cVu9xS8Fhy/GGC0dPUAKNaCh9L7LTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OT2SNtAuCOVhWvxMfISnBQgvD90XhgS4QhYn7ERmns=;
 b=AIxRQBPUKpBBtZWf64h8dDvIsufssdC3nJJhgutuvrhFHBz86p1SwgmIl15eP4BcaT6f+/RwOOG8rMMV037HyuAFH1KQ0fRg5WCke7IliN4yZmmxi6PYilDcD3U9DYeQ9PFvG4dj8A99mbVoaAU9m6wBuDSOYRqL+Rr8zxqE2UpKjcOJudObNQIF0J0LP76/OEhqHGS0Bcx0AnagERUrFPkkouYb5xnJ79qHyvLaPiUMJB9k43RZjm1wOuUHUEqK0+gW72ZiukpEGkrpmhn2NRYGGW/ldCWJP1tUPhhyreqQz1b7CKed+ZPxfqyOhyKxRkuxausRDgLc0yS2sQH9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OT2SNtAuCOVhWvxMfISnBQgvD90XhgS4QhYn7ERmns=;
 b=TZloKwvahqX2EHsWmlgbi9KeJR335ESgMoW36gy21PdLX2RZra8DGvKXoa/LgZm69wgedWHIWfEWiPtAp7zV0mbToncSh30PNYEDEmJsPnUsBXtrub3kDx50S2CPDEpyM903YFtHq61qyxI93xxkxVj51Rey1xz3hHjK3P4HtE0=
Received: from DM5PR12CA0062.namprd12.prod.outlook.com (2603:10b6:3:103::24)
 by SN6PR12MB2623.namprd12.prod.outlook.com (2603:10b6:805:6f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Fri, 26 Jun
 2020 16:19:52 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::e4) by DM5PR12CA0062.outlook.office365.com
 (2603:10b6:3:103::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend
 Transport; Fri, 26 Jun 2020 16:19:52 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 16:19:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jun
 2020 11:19:51 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 26 Jun
 2020 11:19:51 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 26 Jun 2020 11:19:50 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 06/11] drm/amd/display: [FW Promotion] Release 1.0.21
Date: Fri, 26 Jun 2020 12:18:42 -0400
Message-ID: <20200626161847.16000-7-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626161847.16000-1-eryk.brol@amd.com>
References: <20200626161847.16000-1-eryk.brol@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(46966005)(4744005)(82310400002)(47076004)(8936002)(44832011)(316002)(82740400003)(70206006)(336012)(426003)(70586007)(2616005)(6916009)(5660300002)(54906003)(81166007)(83380400001)(36756003)(356005)(26005)(6666004)(4326008)(86362001)(2906002)(186003)(478600001)(8676002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8469734a-e0db-46fc-abb4-08d819ecc146
X-MS-TrafficTypeDiagnostic: SN6PR12MB2623:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2623434C1CE05A601A43F0CAE5930@SN6PR12MB2623.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4IgBw9VHKdi+QeIO8DvLgTBttzUGH8H7X68ZKTiesBDcvMMZBhbi5RecIYStpHQfGqoVV6w40BjvYemFpJKMpmGtgg7SmOtb3aaI+DYNqUt8U326Pvm10gHJU4MZLWYmy/sAD62CnvzRXStztNeoCJnEHRwHQWE6eWdKVJMJInjeH6sJMHoocuoWZp9Qqrz7K5SX1kPXIZVAu5f43Kt3oh4b+GGXSTZfQW+Osxxw9u35zyvVMFZGpbIJ4TOtZl5m3gQnDotB3lGY+BSbZe5P0vLI0lAcxGKykrf0/YFVreipjBVxmi2femXH3t2OkKZaxqb0sPaoL3oR92TO2qAHgjylt3kjqHrp2elon0yZQ1eo1TkS7L4b768ZvJKin+21BU68Fdey2bIOku2uvy3uQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 16:19:51.7716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8469734a-e0db-46fc-abb4-08d819ecc146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2623
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
Cc: eryk.brol@amd.com, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, Bhawanpreet.Lakha@amd.com,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Anthony Koo <Anthony.Koo@amd.com>

Signed-off-by: Anthony Koo <Anthony.Koo@amd.com>
Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Eryk Brol <eryk.brol@amd.com>
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 5f2dc62ff1ff..ed88d42cb16f 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -36,10 +36,10 @@
 
 /* Firmware versioning. */
 #ifdef DMUB_EXPOSE_VERSION
-#define DMUB_FW_VERSION_GIT_HASH 0xf88215ed8
+#define DMUB_FW_VERSION_GIT_HASH 0x6eb25fd7d
 #define DMUB_FW_VERSION_MAJOR 1
 #define DMUB_FW_VERSION_MINOR 0
-#define DMUB_FW_VERSION_REVISION 20
+#define DMUB_FW_VERSION_REVISION 21
 #define DMUB_FW_VERSION_UCODE ((DMUB_FW_VERSION_MAJOR << 24) | (DMUB_FW_VERSION_MINOR << 16) | DMUB_FW_VERSION_REVISION)
 #endif
 
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
