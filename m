Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A5E1AD351
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Apr 2020 01:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD84B6E0D4;
	Thu, 16 Apr 2020 23:41:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC376E0EC
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2020 23:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNpfFAdKdCZnq3CibNp705uKpFDcqTuig7DDLPuf0ScTUvjIUynDWy5gb5WaBNWZ3dwcDOOMa52/CljfPkpGChwbrFTuwItMUCS5jiT8pyxBe3w7iNrEbnutnCe/MIbaIuGm31N9rBU7HUQFxntGUMRxCoookWVOXvTeK09aIHExQvAf2bCtofnj8qHua5p5njmjCcUtzpzMZmAsC2i7SnjvHfYEJVfgwpK+7XkxDA2tMdLSqrzmft4dz7NyXoVkzDKKPu+6qc1saf8BxZrDf5D8M0OeUvgqrollGXdwVm9c6OxKr6NRYnCltEcQkzu/WPIOo295EQZgsr9s2dWbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HdjFn3PKFEyXwGkxeNi80dymCxToG2dSrtoDI3JKyI=;
 b=ZMUaztClM0u98WD4QF99Wo2ua2n06+NlfgMdrjarrXAGOrYXsENr8hPhb/p4xuqcZHI7wpj/7YYr7fgrRUzx+HqgMcJDs7OrEDoTTEhw3dJBuKuLt4yntcyF8IM5mTYeNa+bPXTTrXXachpSFvsO+3XxtSPOjX8Yhpr95KCTSZPzKNk6fkTgxs2botP6SNRxH52RH4wnmixOpnCJrnjBJNKSLK7UPcuu4py2GjgqputcPTEBAMoy1SAN+uOwMWK9kTX33U2PwEEj6SNUZhCBZp6c1DUXRn0w9dOFnrYTvmEoFUNuxL7cqrpNVPDIJia7mRSvg3m94J06UfKPBrk45Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HdjFn3PKFEyXwGkxeNi80dymCxToG2dSrtoDI3JKyI=;
 b=xcSJUlGbe7iBL9Ftt5e9A1IbqCm1j8ZeLvZ8FUSSu2I+qF47B66dRikPit5ow2vIc138SrvSNriEmlKdzQP1La68pFOwasd1CkHmK5I/JNRje1M74El6QaEHX9qOodiG7gKKH29CoJIJrCnlDLzmb7GWCw5ujFtrekSnZLEHmTU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2459.namprd12.prod.outlook.com (2603:10b6:907:c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Thu, 16 Apr
 2020 23:41:10 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2921.027; Thu, 16 Apr 2020
 23:41:09 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 01/35] drm/amd/display: Correct updating logic of dcn21's pipe
 VM flags
Date: Thu, 16 Apr 2020 19:40:10 -0400
Message-Id: <20200416234044.2082886-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416234044.2082886-1-Rodrigo.Siqueira@amd.com>
References: <20200416234044.2082886-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: BN8PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:408:60::25) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 BN8PR12CA0012.namprd12.prod.outlook.com (2603:10b6:408:60::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.25 via Frontend Transport; Thu, 16 Apr 2020 23:41:08 +0000
X-Mailer: git-send-email 2.26.0
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3841d4f6-d933-4e7d-17f5-08d7e25fa3aa
X-MS-TrafficTypeDiagnostic: MW2PR12MB2459:|MW2PR12MB2459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2459282A4E873C0ACFA3C85898D80@MW2PR12MB2459.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 0375972289
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2524.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(316002)(2906002)(54906003)(36756003)(6916009)(6486002)(1076003)(478600001)(6666004)(86362001)(81156014)(8676002)(8936002)(6512007)(66476007)(66556008)(66946007)(2616005)(5660300002)(16526019)(186003)(6506007)(4326008)(52116002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7URxSH4ojb0rg8WI7/8rfxQeODdzyHKpXIJvKZZ9LnOiFKvXuMyuwvBabtzJr8h4vVUYVYk3dU4DWvrM+kPKyYzUYpymTlNUiTLgJXy/9F19nE13QpIB5yLanjgohd2gJlvqtOfAUPkXdlYyCR4hDT7SL/nQ9X/gA+5JXPGvVw2UQDyiF3MyNhuwrmMT6fcBwTPFMTyhDgA7Kn3lmk1SXbbXDnnTt4L41Q6SKa2Xdb8RpyOU6ehfIBw29i8NASzKzP31leBHNWoMRXqImrnTNooSMIg8F7dMzhSHUmVWsUSM51ovKB6VVgu/zdr2fqjPkYSD7FXPmqLx4OEBBl6QNjPmX6wiYHF89Ia8mTTp4j8HUTYXE+y+8STQhkH/zoHmCYyu9nVfcFAgvhlTRHE5mNaVZtrSZ+iLZKzWvsPx7H8l6yyQZgS94t72CA6hkSc5
X-MS-Exchange-AntiSpam-MessageData: vrnEdkkSxbYPzvD4EVI7OOD9qR74u6Whp6nnQRcRePYIIqsI0CqNy9jUnxLO/0oDrKcsLQT/sWR/IYTZofyZ8szGEhGsWASMsORftxfKRMHaRruBIiBIJw35ienQzWxkk8g8QBvdhQkFrqIe5aaZqHbQYNpynKJUyGOqUT+SoL8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3841d4f6-d933-4e7d-17f5-08d7e25fa3aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2020 23:41:09.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWFbVNQp5MYjTIXHLzzgbz0PNWMTVR72RvxSY0GVS4vKcmbletZQe8I5p56sLgOWFm9DqmcEzt6lp0NQHszCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2459
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
Cc: Sung Lee <sung.lee@amd.com>, Sunpeng.Li@amd.com, Harry.Wentland@amd.com,
 Dale Zhao <dale.zhao@amd.com>, Rodrigo.Siqueira@amd.com,
 Yongqiang Sun <yongqiang.sun@amd.com>, Bhawanpreet.Lakha@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dale Zhao <dale.zhao@amd.com>

[Why]:
Renoir's pipe VM flags are not correctly updated if pipe strategy has
changed during some scenarios. It will result in watermarks mistakenly
calculation, thus underflow and garbage appear.

[How]:
Correctly update pipe VM flags to pipes which have been populated.

Signed-off-by: Dale Zhao <dale.zhao@amd.com>
Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Yongqiang Sun <yongqiang.sun@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 0e638a77b5ee..babc966cdabd 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1709,12 +1709,8 @@ static int dcn21_populate_dml_pipes_from_context(
 {
 	uint32_t pipe_cnt = dcn20_populate_dml_pipes_from_context(dc, context, pipes);
 	int i;
-	struct resource_context *res_ctx = &context->res_ctx;
 
-	for (i = 0; i < dc->res_pool->pipe_count; i++) {
-
-		if (!res_ctx->pipe_ctx[i].stream)
-			continue;
+	for (i = 0; i < pipe_cnt; i++) {
 
 		pipes[i].pipe.src.hostvm = 1;
 		pipes[i].pipe.src.gpuvm = 1;
-- 
2.26.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
