Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC59282BEB
	for <lists+amd-gfx@lfdr.de>; Sun,  4 Oct 2020 19:18:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BED89E05;
	Sun,  4 Oct 2020 17:18:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8865B89E05
 for <amd-gfx@lists.freedesktop.org>; Sun,  4 Oct 2020 17:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEYJ5DlPrskpiSGzNSjxHhZWe5Gd1o6WNV7RcFiYVZS2wADXzUXoXtCAWiahMdu1I9MT8NN4zgQSLWp7TsedcYUxFeudpZRMRtzBsTGzaWFmwIURr7rVDmTD8xcqkPvBrju5NuI0V35IwDK2VhZZtqQLCGeaCcgwCVW+lDKOV/8ePATfBfhuEo7Up+KK9x9nUAJyOPkn6Ltv1rhQRbxAh09q/vfSIwgx2P2iXqmt2OXPqwxcThBCvoiChTyXkmVMZh+GoDbi8OpzK+DIpx1nlpyQT0n8oEhc4kr7Ijbgs3rjMaB93j/ZiMwp55kzaN9O7WMjTXh6SanYEubrzaLG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFQ8QKkg/qHGRZhpxXg27IBosSIz49WXyGwdR7hE56I=;
 b=SdexOYFEgVOf5ejwiqhTaIhwSilEmIQz/BoYN4U3/Op8sJQFeaDHDoxUZx1/0rt4Wr57IMB0zMs10xTBypHCGyYy/TK3C5HMmPfiuCipxZ01zh4Gy+e9ZKd6QMnG330afFzP+YLg97hWxncl6OZ3SI91Fh0H4EtSx2t/0Z3QweOOF63557jltIcMzxcj1EzJV5xEcd0kQcS7PK3Qp1q8RpsBfzMp+biHu8znU7IcDG2hvPvGJ0vCj2gkXjvwUrASGaux9e14JTc5VC7P2/lG9xVouT8mok0PpMfgFoCUFEQwrDRagVJl4tEXZ2HuASk5CR+l/0QtEtuivsKfbJklpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFQ8QKkg/qHGRZhpxXg27IBosSIz49WXyGwdR7hE56I=;
 b=DqWJQKmArTGhGP35HnIyD14ljDK4yAFpssxHItR4ZInOXvZxUrxeWwxSKf1DgQrxRK3LcXtTajm2VDe7QZCQ4pE7UcTJinbMC/pC7BIyDFCFyZ9h/YNWRW3HPDclzHZXDj/NlIuvAVG1crBmGl3fEdkSCveO5wdYerAZC55Vg1M=
Received: from DM5PR19CA0071.namprd19.prod.outlook.com (2603:10b6:3:116::33)
 by BN6PR1201MB2514.namprd12.prod.outlook.com (2603:10b6:404:b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Sun, 4 Oct
 2020 17:18:49 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:116:cafe::9d) by DM5PR19CA0071.outlook.office365.com
 (2603:10b6:3:116::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.37 via Frontend
 Transport; Sun, 4 Oct 2020 17:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3433.35 via Frontend Transport; Sun, 4 Oct 2020 17:18:49 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Sun, 4 Oct 2020
 12:18:48 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Sun, 4 Oct 2020 12:18:37 -0500
From: Eryk Brol <eryk.brol@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 01/18] drm/amd/display: 3.2.105
Date: Sun, 4 Oct 2020 13:17:56 -0400
Message-ID: <20201004171813.7819-2-eryk.brol@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201004171813.7819-1-eryk.brol@amd.com>
References: <20201004171813.7819-1-eryk.brol@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e88b06-bb3e-4d34-d386-08d868898f1a
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2514:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB251496D2C3B1DB678F0DAA43E50F0@BN6PR1201MB2514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /nGXzY19d0ITQmZ/chI7vkCZGDxcssElzRHJnf0QZneVJbPRvAuGPgV7YqRHvX8ATyzPpCe7BCbaPtxY33krn6kN9HZhMEF4VV16v1Xsisxtpp2hUrkU9srndNMMVQ1NHQmuJ6nyJHPNkPfdCyHRbJfwOXfX4/lSDlKjtoicZMS9n/ljw/6LuqbKnQU0H5+XzLw8sHpyuZnNJEgL3YU1JSbFnXk4jnXsEx1Aawo/WgT+4gaxqkfY5VIJVYWyJvTOmcP2R+sABuyQjtMWbPMC8NMwUfNx75Qtsxzgcw8CeDyzjoCVSgwdt75NZh0YN4KspabU1qoXYzUFXyrBCy7Rgh8rw1fWySFUdTtnt5uKXzUImFjp/pPEgYw2Pkbmr6t103A3PJqEr1wcxEilylmwBA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(46966005)(316002)(8676002)(36756003)(70206006)(8936002)(70586007)(54906003)(44832011)(86362001)(1076003)(478600001)(426003)(6916009)(4326008)(26005)(336012)(4744005)(5660300002)(186003)(6666004)(82310400003)(2906002)(2616005)(47076004)(82740400003)(83380400001)(356005)(81166007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2020 17:18:49.2663 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e88b06-bb3e-4d34-d386-08d868898f1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2514
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
Cc: Aric Cyr <Aric.Cyr@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Sunpeng.Li@amd.com, Harry.Wentland@amd.com, Qingqing.Zhuo@amd.com,
 Rodrigo.Siqueira@amd.com, Aurabindo.Pillai@amd.com, Bhawanpreet.Lakha@amd.com
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
index 82fe0ab56e3a..3ea4be40050d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -42,7 +42,7 @@
 #include "inc/hw/dmcu.h"
 #include "dml/display_mode_lib.h"
 
-#define DC_VER "3.2.104"
+#define DC_VER "3.2.105"
 
 #define MAX_SURFACES 3
 #define MAX_PLANES 6
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
