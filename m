Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6197A37CFAD
	for <lists+amd-gfx@lfdr.de>; Wed, 12 May 2021 19:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2866EC89;
	Wed, 12 May 2021 17:32:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EE56EC84
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 May 2021 17:32:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pturj3q9+c6mBzuLu06TDE+pn8pmlfQP59Nefs+lkS2LfCs82TmMa7h7kPqBV2acrayXDIfvBuqBoPbl9ftRLoIEyglvBq7kk9RRipKWQhn41FrtJL9WhhEe4+z5hCh5RXQX8AYWKVboqnN0/wlGNk8ijYfUk2py9jYkT5pjajlvd2iUAYoH/nxMZh640TSUciyTjOW9/2moQvrJCNEk35Y9ZwIXub8+qAfOjUIaASajJzjU1P/6XhYmt6jHjuwZTg3gSkORkcskEjQKDCbMbXyusEXc/anpjvdL/ds2hBG4FWP2wN6CIXF2xjTwEM9vGqCfVPtd+0a+zJt1giqs8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb5QxeB4odjO/uljwP4scDyCfrkwSnH7D+DxURz3PvM=;
 b=oLcuboQHsVYPxqSue4KLrKQwJXpVQ3m934rvUOxclroC/1yCOxvViRsSeKdi+ZSwASmENMoz7zEiT2y751X0+RgDv/9vVOJfEjl0NCpPt/1URvCfaJBznkmErhXJCRj4E+FdBr5UMznvzudMTtl9MvHfHbJmNJBK9ZcDeDXXWlGAwFViPrKlG9AWatOp3d3H0DZ5rQqrx30G+5I8A7Ai2p7+8yl4zT7utsAUNWx3TSXYAiM8HPM9c7aGBt9cT1uoBz+hm77374HBLyn3dW06gDTmKvbhqf3QbQFNNutrzqpLnJ7QHj41biUQhREMmabYJqZy7dd+qiks2t0HbWjWHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sb5QxeB4odjO/uljwP4scDyCfrkwSnH7D+DxURz3PvM=;
 b=B48DpDoeIkKAVXDXITV9AIL0lDmKvXzblREEBatAZvWnY1WRPrRoy48J9/BPZ8FcGw+bJ11wz3JemOolAYRq3z0VsbpUF2Nwy+LtQWF7PPg8Sbrjq16Ii7mtNy2SvJaOoq2oQJbxSOTKGUUtJWchiOPs+Uz07Mtmbj958/3Juzc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2564.namprd12.prod.outlook.com (2603:10b6:207:49::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 17:32:10 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::3d98:cefb:476c:c36e%8]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 17:32:10 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 42/49] drm/amd/display: Initial DC support for Beige Goby
Date: Wed, 12 May 2021 13:30:46 -0400
Message-Id: <20210512173053.2347842-42-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512173053.2347842-1-alexander.deucher@amd.com>
References: <20210512173053.2347842-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.245]
X-ClientProxiedBy: BL1PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::14) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.245) by
 BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.11 via Frontend
 Transport; Wed, 12 May 2021 17:31:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6551a911-6ba1-4694-bd38-08d9156bccf9
X-MS-TrafficTypeDiagnostic: BL0PR12MB2564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2564B69A23653FA02140FA68F7529@BL0PR12MB2564.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 08FHnbgrLjECXmr/xiSWKf9r1f5nPYnnWoFaoJK/dUiyGJ2z3rto88P/h4XaEONTu4aO9v/N5xjKM2pQmXwXeFt5toejrylQ4kgLiwm5ZyRrBYJf4EfrxnJwwFLPPyNvMeRqn9etQ1mGHQekLKP3zmGJ1MxCFJswBgW1NvxTtjmKbFY3IvrWKWG6cJnNfQpPF/lzd1Z+IqM5/eriY5FYP0SjLZGGv8fceb9+2S8S+yHtGlb7uJ8pU2dbJ7k9XTBaZ8osw4X/P0uTT2nesoFzfzo2fhsDE+BMz1SJR9GYe3C2U+sIiJ9sqVZzrlNHKFfzoaWGDiut3FFdqby0CmWPoE5jxQ2HDqSsXSfh3dC4WXOIZh5Dh2yA5hJ3c1gXdU4fczwndtQvP2F/GySjh6ZYqDFtzvxt6a3uwqoFs5BEU18h5V7ULSGgzqVKU0VdbG8Z5oO+a5JxiiHmuYqeYRd75atUsapRaFDaTpc2NrP/Vit4L/qyx4Ye7gsbh3aooKatm2HGafxzrHkQm4BHLEtlbfFqm31tw8611O4ABM5+DOD+Z69peq5NghUaaHIeRQfjaJmCTpgkP19cRRyQSnelGKXfooiedAIqyfECoQKXJwVWvwpUpv+eUtsAp39QYwIPdZob5b48IpOggMeDcdcBMLpm3qS1ju+DgXP8dx7EARXwG83QyTBesgJ/qZMjO5cu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(5660300002)(2906002)(6486002)(1076003)(6666004)(66556008)(30864003)(54906003)(83380400001)(186003)(316002)(38350700002)(38100700002)(52116002)(66476007)(2616005)(66946007)(16526019)(6506007)(26005)(956004)(86362001)(8936002)(8676002)(478600001)(6512007)(36756003)(4326008)(6916009)(69590400013)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+WrPhEMWhFpM2XeeInmvCJVhDNTYVTVNdhtn8l1VsTTXlcEeZx3jyjVoSwkc?=
 =?us-ascii?Q?w7HdHPDJ5EIy9Ka52N0jxhVNz8m2CgQaJtOi1m3jQRhUk7LGgENJpMlTQGWY?=
 =?us-ascii?Q?9u2dFtQsSLo86A/SXlb8S+j5wu3gHH2cxe5SaQJ6MyW7zKM+3mOTDDsUMJ8y?=
 =?us-ascii?Q?/Q3xGd2IBN4iktjD9/aHhag/5XqcJPEJs2a1kORcn3CQchScBKHgcUvd3fpR?=
 =?us-ascii?Q?Dzn2J1bt21JZxqU2CdLru8xVO1G4N9VlMVgRJn7DH3s1+CySiobPpe7heopx?=
 =?us-ascii?Q?hzEZft/pgpKJSijxqGtHE1UYgYFicGUla8/fHrYMCNasBY5nBIaBbVhcJ7at?=
 =?us-ascii?Q?kBiKkgnh8FlskTDdtwkF51kgFt7dbA1dtbYZZmighmsOIh5KMgLEWVKArc5Q?=
 =?us-ascii?Q?cSz6oZdb9QjYslmqu0jcqK/Zm1NDoUJ82FJAP2yZymkSHWxjs+pvO6hZCOsB?=
 =?us-ascii?Q?jbDAfUBXGAwZL/4duJHsiowc3aVJXqV12B0UH9Hh171e1oqMIqDFhutKxGl2?=
 =?us-ascii?Q?vsNWmSmmPJzQcQtCPvt3I5M1Q9OblyVfiKnRf7ytPWezgXz9APlvIZshOJZ7?=
 =?us-ascii?Q?vupSkSnmiEiqB2COn90nLbUnzoyDtJUj+V+Qu3WmzPFVIGRrMKhwKlQwx50B?=
 =?us-ascii?Q?3yiayh3mWN/KsvNsWNPlSdSqrhU4GmJkuKmhP/X4HreUTPKNosdYw9e/44vl?=
 =?us-ascii?Q?1SfiNg7+v4NmzPRBokSynpi8iA0aGiAcOKk5UtJA6rJp01Ixjs7Ej3aVmxih?=
 =?us-ascii?Q?gGqV4rZ3ptnczfFHSGFWoL9U6iwT9CeYtkaDqixSVy5CjukT2G0rFVDGp3af?=
 =?us-ascii?Q?Ynubxr8IbhEP4vrAjjDoHLIHpzzkQxOJ80YCLIa/rxwPJuedMOIuPMFINeS4?=
 =?us-ascii?Q?6Blb+FYu+6mWjvhjnZ11TTZPWtm9QntVfOUwm3AMrfRzzAHoewcx4K+KbBmc?=
 =?us-ascii?Q?b7l9+7yH4eV8aTWVJnW7ckKU69IRxAkAfKg7JDrZ9vKz7Bg3CDiUfQMmDpBh?=
 =?us-ascii?Q?2uAe+vPhdcu1p7rRE0lconYxKlzcztafdRZqCPwEtuoYkEjiw532bq/uXZM/?=
 =?us-ascii?Q?etcHoPOFxFhvN+RTM+C3+9PCWXLmqSpL3oZHffT9LMAf4xBEejQpZAfNLKZW?=
 =?us-ascii?Q?lJlZqV0/dXVJtDgPkxH9AuxQjQWwumcv7d9ob/8+mINC8L/KTI+wViEcgzDQ?=
 =?us-ascii?Q?NLh5dMMVCuSRnRqLEwWVm7kYCQjgqyDVzQ+AuAcbvv9+A5hvU+25sp8/6hpq?=
 =?us-ascii?Q?pSL0ECa7Z42gJjBihTVXEZ30bQ8VcsAZApV0XdPbqGEmHTo2M93YhE6fOx6E?=
 =?us-ascii?Q?a7wtyLjBAxv5zIl+14el8vuc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6551a911-6ba1-4694-bd38-08d9156bccf9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 17:31:39.8211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2phGTSQozQE5cJ0ykD6AhL25vmG8UXxs7HHPmjyG3ManR8DqvkYcYuYFK8L0qbWLId/ZqV6/sqb0EdFNL6/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2564
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Chris Park <Chris.Park@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[Why&How]
Add Beige Goby (DCN303) resource, irq service, & dmub loader.

v2: fix nbio include (Alex)

Signed-off-by: Chris Park <Chris.Park@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |    1 +
 .../display/dc/bios/command_table_helper2.c   |    1 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |    7 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |    6 +
 .../drm/amd/display/dc/dce/dce_clock_source.h |    9 +
 .../gpu/drm/amd/display/dc/dce/dce_hwseq.h    |   43 +
 .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h  |  175 ++
 .../gpu/drm/amd/display/dc/dcn303/Makefile    |   43 +
 .../drm/amd/display/dc/dcn303/dcn303_dccg.h   |   48 +
 .../drm/amd/display/dc/dcn303/dcn303_hwseq.c  |   58 +
 .../drm/amd/display/dc/dcn303/dcn303_hwseq.h  |   35 +
 .../drm/amd/display/dc/dcn303/dcn303_init.c   |   37 +
 .../drm/amd/display/dc/dcn303/dcn303_init.h   |   33 +
 .../amd/display/dc/dcn303/dcn303_resource.c   | 1691 +++++++++++++++++
 .../amd/display/dc/dcn303/dcn303_resource.h   |   35 +
 .../gpu/drm/amd/display/dc/gpio/hw_factory.c  |    1 +
 .../drm/amd/display/dc/gpio/hw_translate.c    |    1 +
 drivers/gpu/drm/amd/display/dc/irq/Makefile   |    8 +
 .../dc/irq/dcn303/irq_service_dcn303.c        |  280 +++
 .../dc/irq/dcn303/irq_service_dcn303.h        |   33 +
 drivers/gpu/drm/amd/display/dmub/dmub_srv.h   |    1 +
 drivers/gpu/drm/amd/display/dmub/src/Makefile |    1 +
 .../drm/amd/display/dmub/src/dmub_dcn303.c    |   55 +
 .../drm/amd/display/dmub/src/dmub_dcn303.h    |   37 +
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |    8 +
 .../gpu/drm/amd/display/include/dal_asic_id.h |    4 +-
 .../gpu/drm/amd/display/include/dal_types.h   |    1 +
 27 files changed, 2651 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c
 create mode 100644 drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index f33847299bca..197bb8cf7fc7 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -33,6 +33,7 @@ DC_LIBS += dcn21
 DC_LIBS += dcn30
 DC_LIBS += dcn301
 DC_LIBS += dcn302
+DC_LIBS += dcn303
 endif
 
 DC_LIBS += dce120
diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
index 455ee2be15a3..00706b072b5f 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table_helper2.c
@@ -73,6 +73,7 @@ bool dal_bios_parser_init_cmd_tbl_helper2(
 	case DCN_VERSION_3_0:
 	case DCN_VERSION_3_01:
 	case DCN_VERSION_3_02:
+	case DCN_VERSION_3_03:
 		*h = dal_cmd_tbl_helper_dce112_get_table2();
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 7d6c68c5dea9..dd52ebf56d62 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -241,6 +241,10 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 			return &clk_mgr->base;
 		}
+		if (ASICREV_IS_BEIGE_GOBY_P(asic_id.hw_internal_rev)) {
+			dcn3_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			return &clk_mgr->base;
+		}
 		dcn20_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		return &clk_mgr->base;
 	}
@@ -278,6 +282,9 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		if (ASICREV_IS_DIMGREY_CAVEFISH_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
 			dcn3_clk_mgr_destroy(clk_mgr);
 		}
+		if (ASICREV_IS_BEIGE_GOBY_P(clk_mgr_base->ctx->asic_id.hw_internal_rev)) {
+			dcn3_clk_mgr_destroy(clk_mgr);
+		}
 		break;
 
 	case FAMILY_VGH:
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 8cb937c046aa..75555f0ad3df 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -57,6 +57,7 @@
 #include "dcn30/dcn30_resource.h"
 #include "dcn301/dcn301_resource.h"
 #include "dcn302/dcn302_resource.h"
+#include "dcn303/dcn303_resource.h"
 #endif
 
 #define DC_LOGGER_INIT(logger)
@@ -130,6 +131,8 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 			dc_version = DCN_VERSION_3_0;
 		if (ASICREV_IS_DIMGREY_CAVEFISH_P(asic_id.hw_internal_rev))
 			dc_version = DCN_VERSION_3_02;
+		if (ASICREV_IS_BEIGE_GOBY_P(asic_id.hw_internal_rev))
+			dc_version = DCN_VERSION_3_03;
 		break;
 
 	case FAMILY_VGH:
@@ -216,6 +219,9 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_3_02:
 		res_pool = dcn302_create_resource_pool(init_data, dc);
 		break;
+	case DCN_VERSION_3_03:
+		res_pool = dcn303_create_resource_pool(init_data, dc);
+		break;
 #endif
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
index 7fe5a07e2233..3139285bd403 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clock_source.h
@@ -142,6 +142,15 @@
 		SRII(PIXEL_RATE_CNTL, OTG, 3),\
 		SRII(PIXEL_RATE_CNTL, OTG, 4)
 
+#define CS_COMMON_REG_LIST_DCN3_03(index, pllid) \
+		SRI(PIXCLK_RESYNC_CNTL, PHYPLL, pllid),\
+		SRII(PHASE, DP_DTO, 0),\
+		SRII(PHASE, DP_DTO, 1),\
+		SRII(MODULO, DP_DTO, 0),\
+		SRII(MODULO, DP_DTO, 1),\
+		SRII(PIXEL_RATE_CNTL, OTG, 0),\
+		SRII(PIXEL_RATE_CNTL, OTG, 1)
+
 #endif
 #define CS_COMMON_MASK_SH_LIST_DCN2_0(mask_sh)\
 	CS_SF(DP_DTO0_PHASE, DP_DTO0_PHASE, mask_sh),\
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
index fe31abfa6c85..0db1bad7a93c 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_hwseq.h
@@ -480,6 +480,35 @@
 	SR(AZALIA_AUDIO_DTO), \
 	SR(AZALIA_CONTROLLER_CLOCK_GATING)
 
+#define HWSEQ_DCN303_REG_LIST() \
+	HWSEQ_DCN_REG_LIST(), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 0), \
+	HSWEQ_DCN_PIXEL_RATE_REG_LIST(OTG, 1), \
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(D1VGA_CONTROL), \
+	SR(D2VGA_CONTROL), \
+	SR(D3VGA_CONTROL), \
+	SR(D4VGA_CONTROL), \
+	SR(D5VGA_CONTROL), \
+	SR(D6VGA_CONTROL), \
+	HWSEQ_PIXEL_RATE_REG_LIST_303(OTG), \
+	HWSEQ_PHYPLL_REG_LIST_303(OTG), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING), \
+	SR(HPO_TOP_CLOCK_CONTROL)
+
 #define HWSEQ_PIXEL_RATE_REG_LIST_302(blk) \
 	SRII(PIXEL_RATE_CNTL, blk, 0), \
 	SRII(PIXEL_RATE_CNTL, blk, 1),\
@@ -494,6 +523,14 @@
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 3), \
 	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 4)
 
+#define HWSEQ_PIXEL_RATE_REG_LIST_303(blk) \
+	SRII(PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PIXEL_RATE_CNTL, blk, 1)
+
+#define HWSEQ_PHYPLL_REG_LIST_303(blk) \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 0), \
+	SRII(PHYPLL_PIXEL_RATE_CNTL, blk, 1)
+
 struct dce_hwseq_registers {
 	uint32_t DCFE_CLOCK_CONTROL[6];
 	uint32_t DCFEV_CLOCK_CONTROL;
@@ -934,6 +971,12 @@ struct dce_hwseq_registers {
 	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
 	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh)
 
+#define HWSEQ_DCN303_MASK_SH_LIST(mask_sh) \
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
+	HWS_SF(, HPO_TOP_CLOCK_CONTROL, HPO_HDMISTREAMCLK_GATE_DIS, mask_sh)
+
 #define HWSEQ_REG_FIELD_LIST(type) \
 	type DCFE_CLOCK_ENABLE; \
 	type DCFEV_CLOCK_ENABLE; \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
index d1fd0b9aa0f9..b7dc78624963 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.h
@@ -585,6 +585,181 @@
 	type MPC_RMU_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS;\
 	type MPC_RMU_SHAPER_MODE_CURRENT
 
+#define MPC_COMMON_MASK_SH_LIST_DCN303(mask_sh) \
+	MPC_COMMON_MASK_SH_LIST_DCN1_0(mask_sh),\
+	SF(MPCC0_MPCC_CONTROL, MPCC_BG_BPC, mask_sh),\
+	SF(MPCC0_MPCC_CONTROL, MPCC_BOT_GAIN_MODE, mask_sh),\
+	SF(MPCC0_MPCC_TOP_GAIN, MPCC_TOP_GAIN, mask_sh),\
+	SF(MPCC0_MPCC_BOT_GAIN_INSIDE, MPCC_BOT_GAIN_INSIDE, mask_sh),\
+	SF(MPCC0_MPCC_BOT_GAIN_OUTSIDE, MPCC_BOT_GAIN_OUTSIDE, mask_sh),\
+	SF(MPC_OUT0_CSC_MODE, MPC_OCSC_MODE, mask_sh),\
+	SF(MPC_OUT0_CSC_C11_C12_A, MPC_OCSC_C11_A, mask_sh),\
+	SF(MPC_OUT0_CSC_C11_C12_A, MPC_OCSC_C12_A, mask_sh),\
+	SF(MPCC0_MPCC_STATUS, MPCC_DISABLED, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_FORCE, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_DIS, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_STATE, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_MODE, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_CLAMP_MAX_R_CR, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_CLAMP_MIN_R_CR, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_G_Y, MPC_OUT_DENORM_CLAMP_MAX_G_Y, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_G_Y, MPC_OUT_DENORM_CLAMP_MIN_G_Y, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_B_CB, MPC_OUT_DENORM_CLAMP_MAX_B_CB, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_B_CB, MPC_OUT_DENORM_CLAMP_MIN_B_CB, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_MODE, MPCC_GAMUT_REMAP_MODE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_MODE, MPCC_GAMUT_REMAP_MODE_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_COEF_FORMAT, MPCC_GAMUT_REMAP_COEF_FORMAT, mask_sh),\
+	SF(MPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A, MPCC_GAMUT_REMAP_C11_A, mask_sh),\
+	SF(MPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A, MPCC_GAMUT_REMAP_C12_A, mask_sh),\
+	SF(MPC_DWB0_MUX, MPC_DWB0_MUX, mask_sh),\
+	SF(MPC_DWB0_MUX, MPC_DWB0_MUX_STATUS, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_RATE_CONTROL, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_RATE_CONTROL_DISABLE, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_FLOW_CONTROL_MODE, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_FLOW_CONTROL_COUNT, mask_sh), \
+	SF(MPC_RMU_CONTROL, MPC_RMU0_MUX, mask_sh), \
+	SF(MPC_RMU_CONTROL, MPC_RMU0_MUX_STATUS, mask_sh), \
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL2_B, MPCC_OGAM_RAMA_EXP_REGION_END_SLOPE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL2_B, MPCC_OGAM_RAMA_EXP_REGION_END_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL1_B, MPCC_OGAM_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_SLOPE_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_SLOPE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_BASE_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_BASE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_B, MPCC_OGAM_RAMA_OFFSET_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_G, MPCC_OGAM_RAMA_OFFSET_G, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_R, MPCC_OGAM_RAMA_OFFSET_R, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_INDEX, MPCC_OGAM_LUT_INDEX, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_MODE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_SELECT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_PWL_DISABLE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_MODE_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_SELECT_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_WRITE_COLOR_MASK, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_READ_COLOR_SEL, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_READ_DBG, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_HOST_SEL, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_CONFIG_MODE, mask_sh),\
+	/*SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_STATUS, mask_sh),*/\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_DATA, MPCC_OGAM_LUT_DATA, mask_sh),\
+	SF(MPC_RMU0_3DLUT_MODE, MPC_RMU_3DLUT_MODE, mask_sh),\
+	SF(MPC_RMU0_3DLUT_MODE, MPC_RMU_3DLUT_SIZE, mask_sh),\
+	/*SF(MPC_RMU0_3DLUT_MODE, MPC_RMU_3DLUT_MODE_CURRENT, mask_sh),*/\
+	SF(MPC_RMU0_3DLUT_READ_WRITE_CONTROL, MPC_RMU_3DLUT_WRITE_EN_MASK, mask_sh),\
+	SF(MPC_RMU0_3DLUT_READ_WRITE_CONTROL, MPC_RMU_3DLUT_RAM_SEL, mask_sh),\
+	SF(MPC_RMU0_3DLUT_READ_WRITE_CONTROL, MPC_RMU_3DLUT_30BIT_EN, mask_sh),\
+	/*SF(MPC_RMU0_3DLUT_READ_WRITE_CONTROL, MPC_RMU_3DLUT_CONFIG_STATUS, mask_sh),*/\
+	SF(MPC_RMU0_3DLUT_READ_WRITE_CONTROL, MPC_RMU_3DLUT_READ_SEL, mask_sh),\
+	SF(MPC_RMU0_3DLUT_INDEX, MPC_RMU_3DLUT_INDEX, mask_sh),\
+	SF(MPC_RMU0_3DLUT_DATA, MPC_RMU_3DLUT_DATA0, mask_sh),\
+	SF(MPC_RMU0_3DLUT_DATA, MPC_RMU_3DLUT_DATA1, mask_sh),\
+	SF(MPC_RMU0_3DLUT_DATA_30BIT, MPC_RMU_3DLUT_DATA_30BIT, mask_sh),\
+	SF(MPC_RMU0_SHAPER_CONTROL, MPC_RMU_SHAPER_LUT_MODE, mask_sh),\
+	/*SF(MPC_RMU0_SHAPER_CONTROL, MPC_RMU_SHAPER_LUT_MODE_CURRENT, mask_sh),*/\
+	SF(MPC_RMU0_SHAPER_OFFSET_R, MPC_RMU_SHAPER_OFFSET_R, mask_sh),\
+	SF(MPC_RMU0_SHAPER_OFFSET_G, MPC_RMU_SHAPER_OFFSET_G, mask_sh),\
+	SF(MPC_RMU0_SHAPER_OFFSET_B, MPC_RMU_SHAPER_OFFSET_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_SCALE_R, MPC_RMU_SHAPER_SCALE_R, mask_sh),\
+	SF(MPC_RMU0_SHAPER_SCALE_G_B, MPC_RMU_SHAPER_SCALE_G, mask_sh),\
+	SF(MPC_RMU0_SHAPER_SCALE_G_B, MPC_RMU_SHAPER_SCALE_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_LUT_INDEX, MPC_RMU_SHAPER_LUT_INDEX, mask_sh),\
+	SF(MPC_RMU0_SHAPER_LUT_DATA, MPC_RMU_SHAPER_LUT_DATA, mask_sh),\
+	SF(MPC_RMU0_SHAPER_LUT_WRITE_EN_MASK, MPC_RMU_SHAPER_LUT_WRITE_EN_MASK, mask_sh),\
+	SF(MPC_RMU0_SHAPER_LUT_WRITE_EN_MASK, MPC_RMU_SHAPER_LUT_WRITE_SEL, mask_sh),\
+	/*SF(MPC_RMU0_SHAPER_LUT_WRITE_EN_MASK, MPC_RMU_SHAPER_CONFIG_STATUS, mask_sh),*/\
+	SF(MPC_RMU0_SHAPER_RAMA_START_CNTL_B, MPC_RMU_SHAPER_RAMA_EXP_REGION_START_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_START_CNTL_B, MPC_RMU_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_END_CNTL_B, MPC_RMU_SHAPER_RAMA_EXP_REGION_END_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_END_CNTL_B, MPC_RMU_SHAPER_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_REGION_0_1, MPC_RMU_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_REGION_0_1, MPC_RMU_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_REGION_0_1, MPC_RMU_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF(MPC_RMU0_SHAPER_RAMA_REGION_0_1, MPC_RMU_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF(MPC_RMU_MEM_PWR_CTRL, MPC_RMU0_MEM_PWR_FORCE, mask_sh),\
+	SF(MPC_RMU_MEM_PWR_CTRL, MPC_RMU0_MEM_PWR_DIS, mask_sh),\
+	SF(MPC_RMU_MEM_PWR_CTRL, MPC_RMU0_SHAPER_MEM_PWR_STATE, mask_sh),\
+	SF(MPC_RMU_MEM_PWR_CTRL, MPC_RMU0_3DLUT_MEM_PWR_STATE, mask_sh),\
+	SF(MPC_RMU_MEM_PWR_CTRL, MPC_RMU0_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPC_RMU0_SHAPER_CONTROL, MPC_RMU_SHAPER_MODE_CURRENT, mask_sh),\
+	SF(CUR_VUPDATE_LOCK_SET0, CUR_VUPDATE_LOCK_SET, mask_sh)
+
+#define MPC_REG_FIELD_LIST_DCN3_03(type) \
+	MPC_REG_FIELD_LIST_DCN2_0(type) \
+	type MPC_DWB0_MUX;\
+	type MPC_DWB0_MUX_STATUS;\
+	type MPC_OUT_RATE_CONTROL;\
+	type MPC_OUT_RATE_CONTROL_DISABLE;\
+	type MPC_OUT_FLOW_CONTROL_MODE;\
+	type MPC_OUT_FLOW_CONTROL_COUNT; \
+	type MPCC_GAMUT_REMAP_MODE; \
+	type MPCC_GAMUT_REMAP_MODE_CURRENT;\
+	type MPCC_GAMUT_REMAP_COEF_FORMAT; \
+	type MPCC_GAMUT_REMAP_C11_A; \
+	type MPCC_GAMUT_REMAP_C12_A; \
+	type MPC_RMU0_MUX; \
+	type MPC_RMU0_MUX_STATUS; \
+	type MPC_RMU0_MEM_PWR_FORCE;\
+	type MPC_RMU0_MEM_PWR_DIS;\
+	type MPC_RMU0_MEM_LOW_PWR_MODE;\
+	type MPC_RMU0_SHAPER_MEM_PWR_STATE;\
+	type MPC_RMU0_3DLUT_MEM_PWR_STATE;\
+	type MPCC_OGAM_RAMA_EXP_REGION_START_SLOPE_B; \
+	type MPCC_OGAM_RAMA_EXP_REGION_START_BASE_B;\
+	type MPCC_OGAM_RAMA_OFFSET_B;\
+	type MPCC_OGAM_RAMA_OFFSET_G;\
+	type MPCC_OGAM_RAMA_OFFSET_R;\
+	type MPCC_OGAM_SELECT; \
+	type MPCC_OGAM_PWL_DISABLE; \
+	type MPCC_OGAM_MODE_CURRENT; \
+	type MPCC_OGAM_SELECT_CURRENT; \
+	type MPCC_OGAM_LUT_WRITE_COLOR_MASK; \
+	type MPCC_OGAM_LUT_READ_COLOR_SEL; \
+	type MPCC_OGAM_LUT_READ_DBG; \
+	type MPCC_OGAM_LUT_HOST_SEL; \
+	type MPCC_OGAM_LUT_CONFIG_MODE; \
+	type MPCC_OGAM_LUT_STATUS; \
+	type MPCC_OGAM_RAMA_START_BASE_CNTL_B;\
+	type MPCC_OGAM_MEM_LOW_PWR_MODE;\
+	type MPCC_OGAM_MEM_PWR_STATE;\
+	type MPC_RMU_3DLUT_MODE; \
+	type MPC_RMU_3DLUT_SIZE; \
+	type MPC_RMU_3DLUT_MODE_CURRENT; \
+	type MPC_RMU_3DLUT_WRITE_EN_MASK;\
+	type MPC_RMU_3DLUT_RAM_SEL;\
+	type MPC_RMU_3DLUT_30BIT_EN;\
+	type MPC_RMU_3DLUT_CONFIG_STATUS;\
+	type MPC_RMU_3DLUT_READ_SEL;\
+	type MPC_RMU_3DLUT_INDEX;\
+	type MPC_RMU_3DLUT_DATA0;\
+	type MPC_RMU_3DLUT_DATA1;\
+	type MPC_RMU_3DLUT_DATA_30BIT;\
+	type MPC_RMU_SHAPER_LUT_MODE;\
+	type MPC_RMU_SHAPER_LUT_MODE_CURRENT;\
+	type MPC_RMU_SHAPER_OFFSET_R;\
+	type MPC_RMU_SHAPER_OFFSET_G;\
+	type MPC_RMU_SHAPER_OFFSET_B;\
+	type MPC_RMU_SHAPER_SCALE_R;\
+	type MPC_RMU_SHAPER_SCALE_G;\
+	type MPC_RMU_SHAPER_SCALE_B;\
+	type MPC_RMU_SHAPER_LUT_INDEX;\
+	type MPC_RMU_SHAPER_LUT_DATA;\
+	type MPC_RMU_SHAPER_LUT_WRITE_EN_MASK;\
+	type MPC_RMU_SHAPER_LUT_WRITE_SEL;\
+	type MPC_RMU_SHAPER_CONFIG_STATUS;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION_START_B;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION_END_B;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION_END_BASE_B;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET;\
+	type MPC_RMU_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS;\
+	type MPC_RMU_SHAPER_MODE_CURRENT
 
 struct dcn30_mpc_registers {
 	MPC_REG_VARIABLE_LIST_DCN3_0;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/Makefile b/drivers/gpu/drm/amd/display/dc/dcn303/Makefile
new file mode 100644
index 000000000000..14729424231a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/Makefile
@@ -0,0 +1,43 @@
+#
+# (c) Copyright 2021 Advanced Micro Devices, Inc. All the rights reserved
+#
+#  All rights reserved.  This notice is intended as a precaution against
+#  inadvertent publication and does not imply publication or any waiver
+#  of confidentiality.  The year included in the foregoing notice is the
+#  year of creation of the work.
+#
+#  Authors: AMD
+#
+# Makefile for dcn303.
+
+DCN3_03 = dcn303_init.o dcn303_hwseq.o dcn303_resource.o
+
+ifdef CONFIG_X86
+CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o := -msse
+endif
+
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -mhard-float
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn303/dcn303_resource.o += -msse2
+endif
+endif
+
+AMD_DAL_DCN3_03 = $(addprefix $(AMDDALPATH)/dc/dcn303/,$(DCN3_03))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN3_03)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h
new file mode 100644
index 000000000000..bce3be1ae380
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_dccg.h
@@ -0,0 +1,48 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN303_DCCG_H__
+#define __DCN303_DCCG_H__
+
+#include "dcn30/dcn30_dccg.h"
+
+
+#define DCCG_REG_LIST_DCN3_03() \
+	SR(DPPCLK_DTO_CTRL),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 0),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 1),\
+	SR(REFCLK_CNTL)
+
+#define DCCG_MASK_SH_LIST_DCN3_03(mask_sh) \
+		DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 0, mask_sh),\
+		DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 0, mask_sh),\
+		DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 1, mask_sh),\
+		DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 1, mask_sh),\
+		DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_PHASE, mask_sh),\
+		DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_MODULO, mask_sh),\
+		DCCG_SF(REFCLK_CNTL, REFCLK_CLOCK_EN, mask_sh),\
+		DCCG_SF(REFCLK_CNTL, REFCLK_SRC_SEL, mask_sh)
+
+#endif //__DCN303_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
new file mode 100644
index 000000000000..36a953624a09
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.c
@@ -0,0 +1,58 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dcn303_hwseq.h"
+
+#include "dce/dce_hwseq.h"
+
+#include "reg_helper.h"
+#include "dc.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define CTX \
+	hws->ctx
+#define REG(reg)\
+	hws->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hws->shifts->field_name, hws->masks->field_name
+
+
+void dcn303_dpp_pg_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool power_on)
+{
+	/*DCN303 removes PG registers*/
+}
+
+void dcn303_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
+{
+	/*DCN303 removes PG registers*/
+}
+
+void dcn303_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool power_on)
+{
+	/*DCN303 removes PG registers*/
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
new file mode 100644
index 000000000000..b25342cc30f3
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_hwseq.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_HWSS_DCN303_H__
+#define __DC_HWSS_DCN303_H__
+
+#include "hw_sequencer_private.h"
+
+void dcn303_dpp_pg_control(struct dce_hwseq *hws, unsigned int dpp_inst, bool power_on);
+void dcn303_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on);
+void dcn303_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool power_on);
+
+#endif /* __DC_HWSS_DCN303_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c
new file mode 100644
index 000000000000..792515f853ca
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.c
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dcn303_hwseq.h"
+#include "dcn30/dcn30_init.h"
+#include "dc.h"
+
+void dcn303_hw_sequencer_construct(struct dc *dc)
+{
+	dcn30_hw_sequencer_construct(dc);
+
+	dc->hwseq->funcs.dpp_pg_control = dcn303_dpp_pg_control;
+	dc->hwseq->funcs.hubp_pg_control = dcn303_hubp_pg_control;
+	dc->hwseq->funcs.dsc_pg_control = dcn303_dsc_pg_control;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h
new file mode 100644
index 000000000000..62014267380d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_init.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DC_DCN303_INIT_H__
+#define __DC_DCN303_INIT_H__
+
+struct dc;
+
+void dcn303_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_DCN303_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
new file mode 100644
index 000000000000..c2528f0e0804
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.c
@@ -0,0 +1,1691 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dcn303_init.h"
+#include "dcn303_resource.h"
+#include "dcn303_dccg.h"
+#include "irq/dcn303/irq_service_dcn303.h"
+
+#include "dcn30/dcn30_dio_link_encoder.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn30/dcn30_dpp.h"
+#include "dcn30/dcn30_dwb.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn30/dcn30_hubp.h"
+#include "dcn30/dcn30_mmhubbub.h"
+#include "dcn30/dcn30_mpc.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn30/dcn30_optc.h"
+#include "dcn30/dcn30_resource.h"
+
+#include "dcn20/dcn20_dsc.h"
+#include "dcn20/dcn20_resource.h"
+
+#include "dcn10/dcn10_resource.h"
+
+#include "dc_link_ddc.h"
+
+#include "dce/dce_abm.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_hwseq.h"
+#include "dce/dce_i2c_hw.h"
+#include "dce/dce_panel_cntl.h"
+#include "dce/dmub_abm.h"
+#include "dce/dmub_psr.h"
+#include "clk_mgr.h"
+
+#include "hw_sequencer_private.h"
+#include "reg_helper.h"
+#include "resource.h"
+#include "vm_helper.h"
+
+#include "sienna_cichlid_ip_offset.h"
+#include "dcn/dcn_3_0_3_offset.h"
+#include "dcn/dcn_3_0_3_sh_mask.h"
+#include "dcn/dpcs_3_0_3_offset.h"
+#include "dcn/dpcs_3_0_3_sh_mask.h"
+#include "nbio/nbio_2_3_offset.h"
+
+#define DC_LOGGER_INIT(logger)
+
+struct _vcs_dpi_ip_params_st dcn3_03_ip = {
+		.use_min_dcfclk = 0,
+		.clamp_min_dcfclk = 0,
+		.odm_capable = 1,
+		.gpuvm_enable = 1,
+		.hostvm_enable = 0,
+		.gpuvm_max_page_table_levels = 4,
+		.hostvm_max_page_table_levels = 4,
+		.hostvm_cached_page_table_levels = 0,
+		.pte_group_size_bytes = 2048,
+		.num_dsc = 2,
+		.rob_buffer_size_kbytes = 184,
+		.det_buffer_size_kbytes = 184,
+		.dpte_buffer_size_in_pte_reqs_luma = 64,
+		.dpte_buffer_size_in_pte_reqs_chroma = 34,
+		.pde_proc_buffer_size_64k_reqs = 48,
+		.dpp_output_buffer_pixels = 2560,
+		.opp_output_buffer_lines = 1,
+		.pixel_chunk_size_kbytes = 8,
+		.pte_enable = 1,
+		.max_page_table_levels = 2,
+		.pte_chunk_size_kbytes = 2,  // ?
+		.meta_chunk_size_kbytes = 2,
+		.writeback_chunk_size_kbytes = 8,
+		.line_buffer_size_bits = 789504,
+		.is_line_buffer_bpp_fixed = 0,  // ?
+		.line_buffer_fixed_bpp = 0,     // ?
+		.dcc_supported = true,
+		.writeback_interface_buffer_size_kbytes = 90,
+		.writeback_line_buffer_buffer_size = 0,
+		.max_line_buffer_lines = 12,
+		.writeback_luma_buffer_size_kbytes = 12,  // writeback_line_buffer_buffer_size = 656640
+		.writeback_chroma_buffer_size_kbytes = 8,
+		.writeback_chroma_line_buffer_width_pixels = 4,
+		.writeback_max_hscl_ratio = 1,
+		.writeback_max_vscl_ratio = 1,
+		.writeback_min_hscl_ratio = 1,
+		.writeback_min_vscl_ratio = 1,
+		.writeback_max_hscl_taps = 1,
+		.writeback_max_vscl_taps = 1,
+		.writeback_line_buffer_luma_buffer_size = 0,
+		.writeback_line_buffer_chroma_buffer_size = 14643,
+		.cursor_buffer_size = 8,
+		.cursor_chunk_size = 2,
+		.max_num_otg = 2,
+		.max_num_dpp = 2,
+		.max_num_wb = 1,
+		.max_dchub_pscl_bw_pix_per_clk = 4,
+		.max_pscl_lb_bw_pix_per_clk = 2,
+		.max_lb_vscl_bw_pix_per_clk = 4,
+		.max_vscl_hscl_bw_pix_per_clk = 4,
+		.max_hscl_ratio = 6,
+		.max_vscl_ratio = 6,
+		.hscl_mults = 4,
+		.vscl_mults = 4,
+		.max_hscl_taps = 8,
+		.max_vscl_taps = 8,
+		.dispclk_ramp_margin_percent = 1,
+		.underscan_factor = 1.11,
+		.min_vblank_lines = 32,
+		.dppclk_delay_subtotal = 46,
+		.dynamic_metadata_vm_enabled = true,
+		.dppclk_delay_scl_lb_only = 16,
+		.dppclk_delay_scl = 50,
+		.dppclk_delay_cnvc_formatter = 27,
+		.dppclk_delay_cnvc_cursor = 6,
+		.dispclk_delay_subtotal = 119,
+		.dcfclk_cstate_latency = 5.2, // SRExitTime
+		.max_inter_dcn_tile_repeaters = 8,
+		.max_num_hdmi_frl_outputs = 1,
+		.odm_combine_4to1_supported = false,
+		.xfc_supported = false,
+		.xfc_fill_bw_overhead_percent = 10.0,
+		.xfc_fill_constant_bytes = 0,
+		.gfx7_compat_tiling_supported = 0,
+		.number_of_cursors = 1,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_03_soc = {
+		.clock_limits = {
+				{
+						.state = 0,
+						.dispclk_mhz = 1217.0,
+						.dppclk_mhz = 1217.0,
+						.phyclk_mhz = 810.0,
+						.phyclk_d18_mhz = 667.0,
+						.dscclk_mhz = 405.6,
+				},
+		},
+
+		.min_dcfclk = 500.0, /* TODO: set this to actual min DCFCLK */
+		.num_states = 1,
+		.sr_exit_time_us = 12,
+		.sr_enter_plus_exit_time_us = 20,
+		.urgent_latency_us = 4.0,
+		.urgent_latency_pixel_data_only_us = 4.0,
+		.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+		.urgent_latency_vm_data_only_us = 4.0,
+		.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+		.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+		.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+		.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 80.0,
+		.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+		.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 40.0,
+		.max_avg_sdp_bw_use_normal_percent = 60.0,
+		.max_avg_dram_bw_use_normal_percent = 40.0,
+		.writeback_latency_us = 12.0,
+		.max_request_size_bytes = 256,
+		.fabric_datapath_to_dcn_data_return_bytes = 64,
+		.dcn_downspread_percent = 0.5,
+		.downspread_percent = 0.38,
+		.dram_page_open_time_ns = 50.0,
+		.dram_rw_turnaround_time_ns = 17.5,
+		.dram_return_buffer_per_channel_bytes = 8192,
+		.round_trip_ping_latency_dcfclk_cycles = 156,
+		.urgent_out_of_order_return_per_channel_bytes = 4096,
+		.channel_interleave_bytes = 256,
+		.num_banks = 8,
+		.gpuvm_min_page_size_bytes = 4096,
+		.hostvm_min_page_size_bytes = 4096,
+		.dram_clock_change_latency_us = 404,
+		.dummy_pstate_latency_us = 5,
+		.writeback_dram_clock_change_latency_us = 23.0,
+		.return_bus_width_bytes = 64,
+		.dispclk_dppclk_vco_speed_mhz = 3650,
+		.xfc_bus_transport_time_us = 20,      // ?
+		.xfc_xbuf_latency_tolerance_us = 4,  // ?
+		.use_urgent_burst_bw = 1,            // ?
+		.do_urgent_latency_adjustment = true,
+		.urgent_latency_adjustment_fabric_clock_component_us = 1.0,
+		.urgent_latency_adjustment_fabric_clock_reference_mhz = 1000,
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+		.disable_dmcu = true,
+		.force_abm_enable = false,
+		.timing_trace = false,
+		.clock_trace = true,
+		.disable_pplib_clock_request = true,
+		.pipe_split_policy = MPC_SPLIT_DYNAMIC,
+		.force_single_disp_pipe_split = false,
+		.disable_dcc = DCC_ENABLE,
+		.vsr_support = true,
+		.performance_trace = false,
+		.max_downscale_src_width = 7680,/*upto 8K*/
+		.disable_pplib_wm_range = false,
+		.scl_reset_length10 = true,
+		.sanity_checks = false,
+		.underflow_assert_delay_us = 0xFFFFFFFF,
+		.dwb_fi_phase = -1, // -1 = disable,
+		.dmub_command_table = true,
+};
+
+static const struct dc_debug_options debug_defaults_diags = {
+		.disable_dmcu = true,
+		.force_abm_enable = false,
+		.timing_trace = true,
+		.clock_trace = true,
+		.disable_dpp_power_gate = true,
+		.disable_hubp_power_gate = true,
+		.disable_clock_gate = true,
+		.disable_pplib_clock_request = true,
+		.disable_pplib_wm_range = true,
+		.disable_stutter = false,
+		.scl_reset_length10 = true,
+		.dwb_fi_phase = -1, // -1 = disable
+		.dmub_command_table = true,
+		.enable_tri_buf = true,
+		.disable_psr = true,
+};
+
+enum dcn303_clk_src_array_id {
+	DCN303_CLK_SRC_PLL0,
+	DCN303_CLK_SRC_PLL1,
+	DCN303_CLK_SRC_TOTAL
+};
+
+static const struct resource_caps res_cap_dcn303 = {
+		.num_timing_generator = 2,
+		.num_opp = 2,
+		.num_video_plane = 2,
+		.num_audio = 2,
+		.num_stream_encoder = 2,
+		.num_dwb = 1,
+		.num_ddc = 2,
+		.num_vmid = 16,
+		.num_mpc_3dlut = 1,
+		.num_dsc = 2,
+};
+
+static const struct dc_plane_cap plane_cap = {
+		.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+		.blends_with_above = true,
+		.blends_with_below = true,
+		.per_pixel_alpha = true,
+		.pixel_format_support = {
+				.argb8888 = true,
+				.nv12 = true,
+				.fp16 = true,
+				.p010 = false,
+				.ayuv = false,
+		},
+		.max_upscale_factor = {
+				.argb8888 = 16000,
+				.nv12 = 16000,
+				.fp16 = 16000
+		},
+		.max_downscale_factor = {
+				.argb8888 = 600,
+				.nv12 = 600,
+				.fp16 = 600
+		},
+		16,
+		16
+};
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) \
+		NBIO_BASE__INST0_SEG ## seg
+
+#define NBIO_BASE(seg) \
+		NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+		.reg_name = NBIO_BASE(mm ## reg_name ## _BASE_IDX) + \
+		mm ## reg_name
+
+/* DCN */
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) + mm ## reg_name
+
+#define SF(reg_name, field_name, post_fix)\
+		.field_name = reg_name ## __ ## field_name ## post_fix
+
+#define SRI(reg_name, block, id)\
+		.reg_name = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + mm ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+		.reg_name = BASE(mm ## reg_name ## _BASE_IDX) + mm ## reg_name
+
+#define SRII(reg_name, block, id)\
+		.reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+#define DCCG_SRII(reg_name, block, id)\
+		.block ## _ ## reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+		.reg_name[id] = BASE(mm ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+		mm ## reg_name ## _ ## block ## id
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+		.reg_name[id] = BASE(mm ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## temp_name
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+		.RMU##_##reg_name[id] = BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+static const struct dcn_hubbub_registers hubbub_reg = {
+		HUBBUB_REG_LIST_DCN30(0)
+};
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define vmid_regs(id)\
+		[id] = { DCN20_VMID_REG_LIST(id) }
+
+static const struct dcn_vmid_registers vmid_regs[] = {
+		vmid_regs(0),
+		vmid_regs(1),
+		vmid_regs(2),
+		vmid_regs(3),
+		vmid_regs(4),
+		vmid_regs(5),
+		vmid_regs(6),
+		vmid_regs(7),
+		vmid_regs(8),
+		vmid_regs(9),
+		vmid_regs(10),
+		vmid_regs(11),
+		vmid_regs(12),
+		vmid_regs(13),
+		vmid_regs(14),
+		vmid_regs(15)
+};
+
+static const struct dcn20_vmid_shift vmid_shifts = {
+		DCN20_VMID_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn20_vmid_mask vmid_masks = {
+		DCN20_VMID_MASK_SH_LIST(_MASK)
+};
+
+static struct hubbub *dcn303_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub), GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+	hubbub3_construct(hubbub3, ctx, &hubbub_reg, &hubbub_shift, &hubbub_mask);
+
+	for (i = 0; i < res_cap_dcn303.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub3->base;
+}
+
+#define vpg_regs(id)\
+		[id] = { VPG_DCN3_REG_LIST(id) }
+
+static const struct dcn30_vpg_registers vpg_regs[] = {
+		vpg_regs(0),
+		vpg_regs(1),
+		vpg_regs(2)
+};
+
+static const struct dcn30_vpg_shift vpg_shift = {
+		DCN3_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_vpg_mask vpg_mask = {
+		DCN3_VPG_MASK_SH_LIST(_MASK)
+};
+
+static struct vpg *dcn303_vpg_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn30_vpg *vpg3 = kzalloc(sizeof(struct dcn30_vpg), GFP_KERNEL);
+
+	if (!vpg3)
+		return NULL;
+
+	vpg3_construct(vpg3, ctx, inst, &vpg_regs[inst], &vpg_shift, &vpg_mask);
+
+	return &vpg3->base;
+}
+
+#define afmt_regs(id)\
+		[id] = { AFMT_DCN3_REG_LIST(id) }
+
+static const struct dcn30_afmt_registers afmt_regs[] = {
+		afmt_regs(0),
+		afmt_regs(1),
+		afmt_regs(2)
+};
+
+static const struct dcn30_afmt_shift afmt_shift = {
+		DCN3_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_afmt_mask afmt_mask = {
+		DCN3_AFMT_MASK_SH_LIST(_MASK)
+};
+
+static struct afmt *dcn303_afmt_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn30_afmt *afmt3 = kzalloc(sizeof(struct dcn30_afmt), GFP_KERNEL);
+
+	if (!afmt3)
+		return NULL;
+
+	afmt3_construct(afmt3, ctx, inst, &afmt_regs[inst], &afmt_shift, &afmt_mask);
+
+	return &afmt3->base;
+}
+
+#define audio_regs(id)\
+		[id] = { AUD_COMMON_REG_LIST(id) }
+
+static const struct dce_audio_registers audio_regs[] = {
+		audio_regs(0),
+		audio_regs(1),
+		audio_regs(2),
+		audio_regs(3),
+		audio_regs(4),
+		audio_regs(5),
+		audio_regs(6)
+};
+
+#define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA, AZALIA_ENDPOINT_REG_DATA, mask_sh),\
+		AUD_COMMON_MASK_SH_LIST_BASE(mask_sh)
+
+static const struct dce_audio_shift audio_shift = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+static struct audio *dcn303_create_audio(struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst, &audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+#define stream_enc_regs(id)\
+		[id] = { SE_DCN3_REG_LIST(id) }
+
+static const struct dcn10_stream_enc_registers stream_enc_regs[] = {
+		stream_enc_regs(0),
+		stream_enc_regs(1)
+};
+
+static const struct dcn10_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct stream_encoder *dcn303_stream_encoder_create(enum engine_id eng_id, struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGE) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn303_vpg_create(ctx, vpg_inst);
+	afmt = dcn303_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt)
+		return NULL;
+
+	dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios, eng_id, vpg, afmt, &stream_enc_regs[eng_id],
+			&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+#define clk_src_regs(index, pllid)\
+		[index] = { CS_COMMON_REG_LIST_DCN3_03(index, pllid) }
+
+static const struct dce110_clk_src_regs clk_src_regs[] = {
+		clk_src_regs(0, A),
+		clk_src_regs(1, B)
+};
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
+};
+
+static struct clock_source *dcn303_clock_source_create(struct dc_context *ctx, struct dc_bios *bios,
+		enum clock_source_id id, const struct dce110_clk_src_regs *regs, bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src = kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn3_clk_src_construct(clk_src, ctx, bios, id, regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCN303_REG_LIST()
+};
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN303_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN303_MASK_SH_LIST(_MASK)
+};
+
+static struct dce_hwseq *dcn303_hwseq_create(struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+
+#define hubp_regs(id)\
+		[id] = { HUBP_REG_LIST_DCN30(id) }
+
+static const struct dcn_hubp2_registers hubp_regs[] = {
+		hubp_regs(0),
+		hubp_regs(1)
+};
+
+static const struct dcn_hubp2_shift hubp_shift = {
+		HUBP_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct hubp *dcn303_hubp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 = kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+	if (hubp3_construct(hubp2, ctx, inst, &hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+#define dpp_regs(id)\
+		[id] = { DPP_REG_LIST_DCN30(id) }
+
+static const struct dcn3_dpp_registers dpp_regs[] = {
+		dpp_regs(0),
+		dpp_regs(1)
+};
+
+static const struct dcn3_dpp_shift tf_shift = {
+		DPP_REG_LIST_SH_MASK_DCN30(__SHIFT)
+};
+
+static const struct dcn3_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN30(_MASK)
+};
+
+static struct dpp *dcn303_dpp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn3_dpp *dpp = kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+
+	if (!dpp)
+		return NULL;
+
+	if (dpp3_construct(dpp, ctx, inst, &dpp_regs[inst], &tf_shift, &tf_mask))
+		return &dpp->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+
+#define opp_regs(id)\
+		[id] = { OPP_REG_LIST_DCN30(id) }
+
+static const struct dcn20_opp_registers opp_regs[] = {
+		opp_regs(0),
+		opp_regs(1)
+};
+
+static const struct dcn20_opp_shift opp_shift = {
+		OPP_MASK_SH_LIST_DCN20(__SHIFT)
+};
+
+static const struct dcn20_opp_mask opp_mask = {
+		OPP_MASK_SH_LIST_DCN20(_MASK)
+};
+
+static struct output_pixel_processor *dcn303_opp_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp = kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dcn20_opp_construct(opp, ctx, inst, &opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp->base;
+}
+
+#define optc_regs(id)\
+		[id] = { OPTC_COMMON_REG_LIST_DCN3_0(id) }
+
+static const struct dcn_optc_registers optc_regs[] = {
+		optc_regs(0),
+		optc_regs(1)
+};
+
+static const struct dcn_optc_shift optc_shift = {
+		OPTC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+		OPTC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct timing_generator *dcn303_timing_generator_create(struct dc_context *ctx, uint32_t instance)
+{
+	struct optc *tgn10 = kzalloc(sizeof(struct optc), GFP_KERNEL);
+
+	if (!tgn10)
+		return NULL;
+
+	tgn10->base.inst = instance;
+	tgn10->base.ctx = ctx;
+
+	tgn10->tg_regs = &optc_regs[instance];
+	tgn10->tg_shift = &optc_shift;
+	tgn10->tg_mask = &optc_mask;
+
+	dcn30_timing_generator_init(tgn10);
+
+	return &tgn10->base;
+}
+
+static const struct dcn30_mpc_registers mpc_regs = {
+		MPC_REG_LIST_DCN3_0(0),
+		MPC_REG_LIST_DCN3_0(1),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(0),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(1),
+		MPC_RMU_GLOBAL_REG_LIST_DCN3AG,
+		MPC_RMU_REG_LIST_DCN3AG(0),
+		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
+};
+
+static const struct dcn30_mpc_shift mpc_shift = {
+		MPC_COMMON_MASK_SH_LIST_DCN303(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+		MPC_COMMON_MASK_SH_LIST_DCN303(_MASK)
+};
+
+static struct mpc *dcn303_mpc_create(struct dc_context *ctx, int num_mpcc, int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc), GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+	dcn30_mpc_construct(mpc30, ctx, &mpc_regs, &mpc_shift, &mpc_mask, num_mpcc, num_rmu);
+
+	return &mpc30->base;
+}
+
+#define dsc_regsDCN20(id)\
+[id] = { DSC_REG_LIST_DCN20(id) }
+
+static const struct dcn20_dsc_registers dsc_regs[] = {
+		dsc_regsDCN20(0),
+		dsc_regsDCN20(1)
+};
+
+static const struct dcn20_dsc_shift dsc_shift = {
+		DSC_REG_LIST_SH_MASK_DCN20(__SHIFT)
+};
+
+static const struct dcn20_dsc_mask dsc_mask = {
+		DSC_REG_LIST_SH_MASK_DCN20(_MASK)
+};
+
+static struct display_stream_compressor *dcn303_dsc_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc = kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
+
+	if (!dsc) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dsc2_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
+	return &dsc->base;
+}
+
+#define dwbc_regs_dcn3(id)\
+[id] = { DWBC_COMMON_REG_LIST_DCN30(id) }
+
+static const struct dcn30_dwbc_registers dwbc30_regs[] = {
+		dwbc_regs_dcn3(0)
+};
+
+static const struct dcn30_dwbc_shift dwbc30_shift = {
+		DWBC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_dwbc_mask dwbc30_mask = {
+		DWBC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static bool dcn303_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc), GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+		dcn30_dwbc_construct(dwbc30, ctx, &dwbc30_regs[i], &dwbc30_shift, &dwbc30_mask, i);
+
+		pool->dwbc[i] = &dwbc30->base;
+	}
+	return true;
+}
+
+#define mcif_wb_regs_dcn3(id)\
+[id] = { MCIF_WB_COMMON_REG_LIST_DCN30(id) }
+
+static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
+		mcif_wb_regs_dcn3(0)
+};
+
+static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
+		MCIF_WB_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
+		MCIF_WB_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static bool dcn303_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub), GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+		dcn30_mmhubbub_construct(mcif_wb30, ctx, &mcif_wb30_regs[i], &mcif_wb30_shift, &mcif_wb30_mask, i);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+#define aux_engine_regs(id)\
+[id] = {\
+		AUX_COMMON_REG_LIST0(id), \
+		.AUXN_IMPCAL = 0, \
+		.AUXP_IMPCAL = 0, \
+		.AUX_RESET_MASK = DP_AUX0_AUX_CONTROL__AUX_RESET_MASK, \
+}
+
+static const struct dce110_aux_registers aux_engine_regs[] = {
+		aux_engine_regs(0),
+		aux_engine_regs(1)
+};
+
+static const struct dce110_aux_registers_shift aux_shift = {
+		DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+		DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+static struct dce_aux *dcn303_aux_engine_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine = kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst, SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+			&aux_engine_regs[inst], &aux_mask, &aux_shift, ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+
+#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST(id) }
+
+static const struct dce_i2c_registers i2c_hw_regs[] = {
+		i2c_inst_regs(1),
+		i2c_inst_regs(2)
+};
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCN2(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCN2(_MASK)
+};
+
+static struct dce_i2c_hw *dcn303_i2c_hw_create(struct dc_context *ctx, uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw = kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst, &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 600000,
+		.hdmi_ycbcr420_supported = true,
+		.dp_ycbcr420_supported = true,
+		.fec_supported = true,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_HBR3_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true,
+		.flags.bits.IS_TPS4_CAPABLE = true
+};
+
+#define link_regs(id, phyid)\
+		[id] = {\
+				LE_DCN3_REG_LIST(id), \
+				UNIPHY_DCN2_REG_LIST(phyid), \
+				SRI(DP_DPHY_INTERNAL_CTRL, DP, id) \
+		}
+
+static const struct dcn10_link_enc_registers link_enc_regs[] = {
+		link_regs(0, A),
+		link_regs(1, B)
+};
+
+static const struct dcn10_link_enc_shift le_shift = {
+		LINK_ENCODER_MASK_SH_LIST_DCN30(__SHIFT),
+		DPCS_DCN2_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+		LINK_ENCODER_MASK_SH_LIST_DCN30(_MASK),
+		DPCS_DCN2_MASK_SH_LIST(_MASK)
+};
+
+#define aux_regs(id)\
+		[id] = { DCN2_AUX_REG_LIST(id) }
+
+static const struct dcn10_link_enc_aux_registers link_enc_aux_regs[] = {
+		aux_regs(0),
+		aux_regs(1)
+};
+
+#define hpd_regs(id)\
+		[id] = { HPD_REG_LIST(id) }
+
+static const struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[] = {
+		hpd_regs(0),
+		hpd_regs(1)
+};
+
+static struct link_encoder *dcn303_link_encoder_create(const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 = kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+	dcn30_link_encoder_construct(enc20, enc_init_data, &link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter], &link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source], &le_shift, &le_mask);
+
+	return &enc20->enc10.base;
+}
+
+static const struct dce_panel_cntl_registers panel_cntl_regs[] = {
+		{ DCN_PANEL_CNTL_REG_LIST() }
+};
+
+static const struct dce_panel_cntl_shift panel_cntl_shift = {
+		DCE_PANEL_CNTL_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_panel_cntl_mask panel_cntl_mask = {
+		DCE_PANEL_CNTL_MASK_SH_LIST(_MASK)
+};
+
+static struct panel_cntl *dcn303_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dce_panel_cntl *panel_cntl = kzalloc(sizeof(struct dce_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dce_panel_cntl_construct(panel_cntl, init_data, &panel_cntl_regs[init_data->inst],
+			&panel_cntl_shift, &panel_cntl_mask);
+
+	return &panel_cntl->base;
+}
+
+static void read_dce_straps(struct dc_context *ctx, struct resource_straps *straps)
+{
+	generic_reg_get(ctx, mmDC_PINSTRAPS + BASE(mmDC_PINSTRAPS_BASE_IDX),
+			FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+}
+
+static const struct resource_create_funcs res_create_funcs = {
+		.read_dce_straps = read_dce_straps,
+		.create_audio = dcn303_create_audio,
+		.create_stream_encoder = dcn303_stream_encoder_create,
+		.create_hwseq = dcn303_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+		.read_dce_straps = NULL,
+		.create_audio = NULL,
+		.create_stream_encoder = NULL,
+		.create_hwseq = dcn303_hwseq_create,
+};
+
+static bool is_soc_bounding_box_valid(struct dc *dc)
+{
+	uint32_t hw_internal_rev = dc->ctx->asic_id.hw_internal_rev;
+
+	if (ASICREV_IS_BEIGE_GOBY_P(hw_internal_rev))
+		return true;
+
+	return false;
+}
+
+static bool init_soc_bounding_box(struct dc *dc,  struct resource_pool *pool)
+{
+	struct _vcs_dpi_soc_bounding_box_st *loaded_bb = &dcn3_03_soc;
+	struct _vcs_dpi_ip_params_st *loaded_ip = &dcn3_03_ip;
+
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	if (!is_soc_bounding_box_valid(dc)) {
+		DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
+		return false;
+	}
+
+	loaded_ip->max_num_otg = pool->pipe_count;
+	loaded_ip->max_num_dpp = pool->pipe_count;
+	loaded_ip->clamp_min_dcfclk = dc->config.clamp_min_dcfclk;
+	dcn20_patch_bounding_box(dc, loaded_bb);
+	return true;
+}
+
+static void dcn303_resource_destruct(struct resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->stream_enc_count; i++) {
+		if (pool->stream_enc[i] != NULL) {
+			if (pool->stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->stream_enc[i]->vpg));
+				pool->stream_enc[i]->vpg = NULL;
+			}
+			if (pool->stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->stream_enc[i]->afmt));
+				pool->stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->stream_enc[i]));
+			pool->stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_dsc; i++) {
+		if (pool->dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->dscs[i]);
+	}
+
+	if (pool->mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->mpc));
+		pool->mpc = NULL;
+	}
+
+	if (pool->hubbub != NULL) {
+		kfree(pool->hubbub);
+		pool->hubbub = NULL;
+	}
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		if (pool->dpps[i] != NULL) {
+			kfree(TO_DCN20_DPP(pool->dpps[i]));
+			pool->dpps[i] = NULL;
+		}
+
+		if (pool->hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->hubps[i]));
+			pool->hubps[i] = NULL;
+		}
+
+		if (pool->irqs != NULL)
+			dal_irq_service_destroy(&pool->irqs);
+	}
+
+	for (i = 0; i < pool->res_cap->num_ddc; i++) {
+		if (pool->engines[i] != NULL)
+			dce110_engine_destroy(&pool->engines[i]);
+		if (pool->hw_i2cs[i] != NULL) {
+			kfree(pool->hw_i2cs[i]);
+			pool->hw_i2cs[i] = NULL;
+		}
+		if (pool->sw_i2cs[i] != NULL) {
+			kfree(pool->sw_i2cs[i]);
+			pool->sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_opp; i++) {
+		if (pool->opps[i] != NULL)
+			pool->opps[i]->funcs->opp_destroy(&pool->opps[i]);
+	}
+
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		if (pool->timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->timing_generators[i]));
+			pool->timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_dwb; i++) {
+		if (pool->dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->dwbc[i]));
+			pool->dwbc[i] = NULL;
+		}
+		if (pool->mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->mcif_wb[i]));
+			pool->mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->audio_count; i++) {
+		if (pool->audios[i])
+			dce_aud_destroy(&pool->audios[i]);
+	}
+
+	for (i = 0; i < pool->clk_src_count; i++) {
+		if (pool->clock_sources[i] != NULL)
+			dcn20_clock_source_destroy(&pool->clock_sources[i]);
+	}
+
+	if (pool->dp_clock_source != NULL)
+		dcn20_clock_source_destroy(&pool->dp_clock_source);
+
+	for (i = 0; i < pool->res_cap->num_mpc_3dlut; i++) {
+		if (pool->mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->mpc_lut[i]);
+			pool->mpc_lut[i] = NULL;
+		}
+		if (pool->mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->mpc_shaper[i]);
+			pool->mpc_shaper[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->pipe_count; i++) {
+		if (pool->multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->multiple_abms[i]);
+	}
+
+	if (pool->psr != NULL)
+		dmub_psr_destroy(&pool->psr);
+
+	if (pool->dccg != NULL)
+		dcn_dccg_destroy(&pool->dccg);
+
+	if (pool->oem_device != NULL)
+		dal_ddc_service_destroy(&pool->oem_device);
+}
+
+static void dcn303_destroy_resource_pool(struct resource_pool **pool)
+{
+	dcn303_resource_destruct(*pool);
+	kfree(*pool);
+	*pool = NULL;
+}
+
+static void dcn303_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+		unsigned int *optimal_dcfclk,
+		unsigned int *optimal_fclk)
+{
+	double bw_from_dram, bw_from_dram1, bw_from_dram2;
+
+	bw_from_dram1 = uclk_mts * dcn3_03_soc.num_chans *
+		dcn3_03_soc.dram_channel_width_bytes * (dcn3_03_soc.max_avg_dram_bw_use_normal_percent / 100);
+	bw_from_dram2 = uclk_mts * dcn3_03_soc.num_chans *
+		dcn3_03_soc.dram_channel_width_bytes * (dcn3_03_soc.max_avg_sdp_bw_use_normal_percent / 100);
+
+	bw_from_dram = (bw_from_dram1 < bw_from_dram2) ? bw_from_dram1 : bw_from_dram2;
+
+	if (optimal_fclk)
+		*optimal_fclk = bw_from_dram /
+		(dcn3_03_soc.fabric_datapath_to_dcn_data_return_bytes *
+				(dcn3_03_soc.max_avg_sdp_bw_use_normal_percent / 100));
+
+	if (optimal_dcfclk)
+		*optimal_dcfclk =  bw_from_dram /
+		(dcn3_03_soc.return_bus_width_bytes * (dcn3_03_soc.max_avg_sdp_bw_use_normal_percent / 100));
+}
+
+void dcn303_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	unsigned int i, j;
+	unsigned int num_states = 0;
+
+	unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
+	unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
+	unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
+	unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
+
+	unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {694, 875, 1000, 1200};
+	unsigned int num_dcfclk_sta_targets = 4;
+	unsigned int num_uclk_states;
+
+
+	if (dc->ctx->dc_bios->vram_info.num_chans)
+		dcn3_03_soc.num_chans = dc->ctx->dc_bios->vram_info.num_chans;
+
+	if (dc->ctx->dc_bios->vram_info.dram_channel_width_bytes)
+		dcn3_03_soc.dram_channel_width_bytes = dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
+
+	dcn3_03_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+
+	if (bw_params->clk_table.entries[0].memclk_mhz) {
+		int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
+
+		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+		}
+		if (!max_dcfclk_mhz)
+			max_dcfclk_mhz = dcn3_03_soc.clock_limits[0].dcfclk_mhz;
+		if (!max_dispclk_mhz)
+			max_dispclk_mhz = dcn3_03_soc.clock_limits[0].dispclk_mhz;
+		if (!max_dppclk_mhz)
+			max_dppclk_mhz = dcn3_03_soc.clock_limits[0].dppclk_mhz;
+		if (!max_phyclk_mhz)
+			max_phyclk_mhz = dcn3_03_soc.clock_limits[0].phyclk_mhz;
+
+		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+			num_dcfclk_sta_targets++;
+		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			for (i = 0; i < num_dcfclk_sta_targets; i++) {
+				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
+					dcfclk_sta_targets[i] = max_dcfclk_mhz;
+					break;
+				}
+			}
+			/* Update size of array since we "removed" duplicates */
+			num_dcfclk_sta_targets = i + 1;
+		}
+
+		num_uclk_states = bw_params->clk_table.num_entries;
+
+		/* Calculate optimal dcfclk for each uclk */
+		for (i = 0; i < num_uclk_states; i++) {
+			dcn303_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+					&optimal_dcfclk_for_uclk[i], NULL);
+			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz)
+				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+		}
+
+		/* Calculate optimal uclk for each dcfclk sta target */
+		for (i = 0; i < num_dcfclk_sta_targets; i++) {
+			for (j = 0; j < num_uclk_states; j++) {
+				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
+					optimal_uclk_for_dcfclk_sta_targets[i] =
+							bw_params->clk_table.entries[j].memclk_mhz * 16;
+					break;
+				}
+			}
+		}
+
+		i = 0;
+		j = 0;
+		/* create the final dcfclk and uclk table */
+		while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
+			if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
+				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+			} else {
+				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+					dram_speed_mts[num_states++] =
+							bw_params->clk_table.entries[j++].memclk_mhz * 16;
+				} else {
+					j = num_uclk_states;
+				}
+			}
+		}
+
+		while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
+			dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+			dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+		}
+
+		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
+				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+		}
+
+		dcn3_03_soc.num_states = num_states;
+		for (i = 0; i < dcn3_03_soc.num_states; i++) {
+			dcn3_03_soc.clock_limits[i].state = i;
+			dcn3_03_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+			dcn3_03_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+			dcn3_03_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+
+			/* Fill all states with max values of all other clocks */
+			dcn3_03_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+			dcn3_03_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+			dcn3_03_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+			dcn3_03_soc.clock_limits[i].dtbclk_mhz = dcn3_03_soc.clock_limits[0].dtbclk_mhz;
+			/* These clocks cannot come from bw_params, always fill from dcn3_03_soc[1] */
+			/* FCLK, PHYCLK_D18, SOCCLK, DSCCLK */
+			dcn3_03_soc.clock_limits[i].phyclk_d18_mhz = dcn3_03_soc.clock_limits[0].phyclk_d18_mhz;
+			dcn3_03_soc.clock_limits[i].socclk_mhz = dcn3_03_soc.clock_limits[0].socclk_mhz;
+			dcn3_03_soc.clock_limits[i].dscclk_mhz = dcn3_03_soc.clock_limits[0].dscclk_mhz;
+		}
+		/* re-init DML with updated bb */
+		dml_init_instance(&dc->dml, &dcn3_03_soc, &dcn3_03_ip, DML_PROJECT_DCN30);
+		if (dc->current_state)
+			dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_03_soc, &dcn3_03_ip, DML_PROJECT_DCN30);
+	}
+}
+
+static struct resource_funcs dcn303_res_pool_funcs = {
+		.destroy = dcn303_destroy_resource_pool,
+		.link_enc_create = dcn303_link_encoder_create,
+		.panel_cntl_create = dcn303_panel_cntl_create,
+		.validate_bandwidth = dcn30_validate_bandwidth,
+		.calculate_wm_and_dlg = dcn30_calculate_wm_and_dlg,
+		.populate_dml_pipes = dcn30_populate_dml_pipes_from_context,
+		.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+		.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+		.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+		.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+		.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+		.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+		.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+		.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+		.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+		.update_bw_bounding_box = dcn303_update_bw_bounding_box,
+		.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+};
+
+static struct dc_cap_funcs cap_funcs = {
+		.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+static const struct bios_registers bios_regs = {
+		NBIO_SR(BIOS_SCRATCH_3),
+		NBIO_SR(BIOS_SCRATCH_6)
+};
+
+static const struct dccg_registers dccg_regs = {
+		DCCG_REG_LIST_DCN3_03()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN3_03(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN3_03(_MASK)
+};
+
+#define abm_regs(id)\
+		[id] = { ABM_DCN301_REG_LIST(id) }
+
+static const struct dce_abm_registers abm_regs[] = {
+		abm_regs(0),
+		abm_regs(1)
+};
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static bool dcn303_resource_construct(
+		uint8_t num_virtual_links,
+		struct dc *dc,
+		struct resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+	struct ddc_service_init_data ddc_init_data;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->res_cap = &res_cap_dcn303;
+
+	pool->funcs = &dcn303_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->pipe_count = pool->res_cap->num_timing_generator;
+	pool->mpcc_count = pool->res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 5; /*1.4 w/a applied by derfault*/
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
+#if defined(CONFIG_DRM_AMD_DC_DCN)
+	dc->caps.mall_size_per_mem_channel = 4;
+	/* total size = mall per channel * num channels * 1024 * 1024 */
+	dc->caps.mall_size_total = dc->caps.mall_size_per_mem_channel *
+				   dc->ctx->dc_bios->vram_info.num_chans *
+				   1024 * 1024;
+	dc->caps.cursor_cache_size =
+		dc->caps.max_cursor_size * dc->caps.max_cursor_size * 8;
+#endif
+	dc->caps.max_slave_planes = 1;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
+
+	/* Color pipeline capabilities */
+	dc->caps.color.dpp.dcn_arch = 1;
+	dc->caps.color.dpp.input_lut_shared = 0;
+	dc->caps.color.dpp.icsc = 1;
+	dc->caps.color.dpp.dgam_ram = 0; // must use gamma_corr
+	dc->caps.color.dpp.dgam_rom_caps.srgb = 1;
+	dc->caps.color.dpp.dgam_rom_caps.bt2020 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.gamma2_2 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.pq = 1;
+	dc->caps.color.dpp.dgam_rom_caps.hlg = 1;
+	dc->caps.color.dpp.post_csc = 1;
+	dc->caps.color.dpp.gamma_corr = 1;
+	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
+
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 1;
+	// no OGAM ROM on DCN3
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->res_cap->num_mpc_3dlut; //3
+	dc->caps.color.mpc.ogam_ram = 1;
+	dc->caps.color.mpc.ogam_rom_caps.srgb = 0;
+	dc->caps.color.mpc.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.pq = 0;
+	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
+	dc->caps.color.mpc.ocsc = 1;
+
+	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
+		dc->debug = debug_defaults_drv;
+	else
+		dc->debug = debug_defaults_diags;
+
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->clock_sources[DCN303_CLK_SRC_PLL0] =
+			dcn303_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL0,
+					&clk_src_regs[0], false);
+	pool->clock_sources[DCN303_CLK_SRC_PLL1] =
+			dcn303_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_COMBO_PHY_PLL1,
+					&clk_src_regs[1], false);
+
+	pool->clk_src_count = DCN303_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->dp_clock_source =
+			dcn303_clock_source_create(ctx, ctx->dc_bios,
+					CLOCK_SOURCE_ID_DP_DTO,
+					&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->clk_src_count; i++) {
+		if (pool->clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* DCCG */
+	pool->dccg = dccg30_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* PP Lib and SMU interfaces */
+	init_soc_bounding_box(dc, pool);
+
+	/* DML */
+	dml_init_instance(&dc->dml, &dcn3_03_soc, &dcn3_03_ip, DML_PROJECT_DCN30);
+
+	/* IRQ */
+	init_data.ctx = dc->ctx;
+	pool->irqs = dal_irq_service_dcn303_create(&init_data);
+	if (!pool->irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->hubbub = dcn303_hubbub_create(ctx);
+	if (pool->hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->pipe_count; i++) {
+		pool->hubps[i] = dcn303_hubp_create(ctx, i);
+		if (pool->hubps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->dpps[i] = dcn303_dpp_create(ctx, i);
+		if (pool->dpps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_opp; i++) {
+		pool->opps[i] = dcn303_opp_create(ctx, i);
+		if (pool->opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		pool->timing_generators[i] = dcn303_timing_generator_create(ctx, i);
+		if (pool->timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+	}
+	pool->timing_generator_count = i;
+
+	/* PSR */
+	pool->psr = dmub_psr_create(ctx);
+	if (pool->psr == NULL) {
+		dm_error("DC: failed to create psr!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* ABM */
+	for (i = 0; i < pool->res_cap->num_timing_generator; i++) {
+		pool->multiple_abms[i] = dmub_abm_create(ctx, &abm_regs[i], &abm_shift, &abm_mask);
+		if (pool->multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->mpc = dcn303_mpc_create(ctx, pool->mpcc_count, pool->res_cap->num_mpc_3dlut);
+	if (pool->mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->res_cap->num_dsc; i++) {
+		pool->dscs[i] = dcn303_dsc_create(ctx, i);
+		if (pool->dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn303_dwbc_create(ctx, pool)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn303_mmhubbub_create(ctx, pool)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->res_cap->num_ddc; i++) {
+		pool->engines[i] = dcn303_aux_engine_create(ctx, i);
+		if (pool->engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->hw_i2cs[i] = dcn303_i2c_hw_create(ctx, i);
+		if (pool->hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->sw_i2cs[i] = NULL;
+	}
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, pool,
+			(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+					&res_create_funcs : &res_create_maximus_funcs)))
+		goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn303_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+	if (dc->ctx->dc_bios->fw_info.oem_i2c_present) {
+		ddc_init_data.ctx = dc->ctx;
+		ddc_init_data.link = NULL;
+		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
+		ddc_init_data.id.enum_id = 0;
+		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
+		pool->oem_device = dal_ddc_service_create(&ddc_init_data);
+	} else {
+		pool->oem_device = NULL;
+	}
+
+	return true;
+
+create_fail:
+
+	dcn303_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn303_create_resource_pool(const struct dc_init_data *init_data, struct dc *dc)
+{
+	struct resource_pool *pool = kzalloc(sizeof(struct resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn303_resource_construct(init_data->num_virtual_links, dc, pool))
+		return pool;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h
new file mode 100644
index 000000000000..44a3166f86c8
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn303/dcn303_resource.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DCN303_RESOURCE_H_
+#define _DCN303_RESOURCE_H_
+
+#include "core_types.h"
+
+struct resource_pool *dcn303_create_resource_pool(const struct dc_init_data *init_data, struct dc *dc);
+
+void dcn303_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params);
+
+#endif /* _DCN303_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
index 92c65d2fa7d7..5aa714e831dd 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_factory.c
@@ -111,6 +111,7 @@ bool dal_hw_factory_init(
 	case DCN_VERSION_3_0:
 	case DCN_VERSION_3_01:
 	case DCN_VERSION_3_02:
+	case DCN_VERSION_3_03:
 		dal_hw_factory_dcn30_init(factory);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
index da9499c09a11..199a9dd0e0e3 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -106,6 +106,7 @@ bool dal_hw_translate_init(
 	case DCN_VERSION_3_0:
 	case DCN_VERSION_3_01:
 	case DCN_VERSION_3_02:
+	case DCN_VERSION_3_03:
 		dal_hw_translate_dcn30_init(translate);
 		return true;
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/irq/Makefile b/drivers/gpu/drm/amd/display/dc/irq/Makefile
index ca8168726324..e9fabb85741f 100644
--- a/drivers/gpu/drm/amd/display/dc/irq/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/irq/Makefile
@@ -109,4 +109,12 @@ IRQ_DCN3_02 = irq_service_dcn302.o
 AMD_DAL_IRQ_DCN3_02 = $(addprefix $(AMDDALPATH)/dc/irq/dcn302/,$(IRQ_DCN3_02))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3_02)
+###############################################################################
+# DCN 3_03
+###############################################################################
+IRQ_DCN3_03 = irq_service_dcn303.o
+
+AMD_DAL_IRQ_DCN3_03 = $(addprefix $(AMDDALPATH)/dc/irq/dcn303/,$(IRQ_DCN3_03))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_IRQ_DCN3_03)
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
new file mode 100644
index 000000000000..68d3f61f0656
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
@@ -0,0 +1,280 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "dm_services.h"
+#include "irq_service_dcn303.h"
+#include "../dce110/irq_service_dce110.h"
+
+#include "sienna_cichlid_ip_offset.h"
+#include "dcn/dcn_3_0_3_offset.h"
+#include "dcn/dcn_3_0_3_sh_mask.h"
+
+#include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
+
+static enum dc_irq_source to_dal_irq_source_dcn303(struct irq_service *irq_service,
+						   uint32_t src_id,
+						   uint32_t ext_id)
+{
+	switch (src_id) {
+	case DCN_1_0__SRCID__DC_D1_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK1;
+	case DCN_1_0__SRCID__DC_D2_OTG_VSTARTUP:
+		return DC_IRQ_SOURCE_VBLANK2;
+	case DCN_1_0__SRCID__HUBP0_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP1;
+	case DCN_1_0__SRCID__HUBP1_FLIP_INTERRUPT:
+		return DC_IRQ_SOURCE_PFLIP2;
+	case DCN_1_0__SRCID__OTG0_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE1;
+	case DCN_1_0__SRCID__OTG1_IHC_V_UPDATE_NO_LOCK_INTERRUPT:
+		return DC_IRQ_SOURCE_VUPDATE2;
+
+	case DCN_1_0__SRCID__DC_HPD1_INT:
+		/* generic src_id for all HPD and HPDRX interrupts */
+		switch (ext_id) {
+		case DCN_1_0__CTXID__DC_HPD1_INT:
+			return DC_IRQ_SOURCE_HPD1;
+		case DCN_1_0__CTXID__DC_HPD2_INT:
+			return DC_IRQ_SOURCE_HPD2;
+		case DCN_1_0__CTXID__DC_HPD1_RX_INT:
+			return DC_IRQ_SOURCE_HPD1RX;
+		case DCN_1_0__CTXID__DC_HPD2_RX_INT:
+			return DC_IRQ_SOURCE_HPD2RX;
+		default:
+			return DC_IRQ_SOURCE_INVALID;
+		}
+		break;
+
+	default:
+		return DC_IRQ_SOURCE_INVALID;
+	}
+}
+
+static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
+{
+	uint32_t addr = info->status_reg;
+	uint32_t value = dm_read_reg(irq_service->ctx, addr);
+	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
+
+	dal_irq_service_ack_generic(irq_service, info);
+
+	value = dm_read_reg(irq_service->ctx, info->enable_reg);
+
+	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
+
+	dm_write_reg(irq_service->ctx, info->enable_reg, value);
+
+	return true;
+}
+
+static const struct irq_source_info_funcs hpd_irq_info_funcs = {
+		.set = NULL,
+		.ack = hpd_ack
+};
+
+static const struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+static const struct irq_source_info_funcs pflip_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+static const struct irq_source_info_funcs vupdate_no_lock_irq_info_funcs = {
+	.set = NULL,
+	.ack = NULL
+};
+
+static const struct irq_source_info_funcs vblank_irq_info_funcs = {
+		.set = NULL,
+		.ack = NULL
+};
+
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+/* compile time expand base address. */
+#define BASE(seg) BASE_INNER(seg)
+
+#define SRI(reg_name, block, id)\
+		BASE(mm ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+		mm ## block ## id ## _ ## reg_name
+
+
+#define IRQ_REG_ENTRY(block, reg_num, reg1, mask1, reg2, mask2)\
+		.enable_reg = SRI(reg1, block, reg_num),\
+		.enable_mask = block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK,\
+		.enable_value = {\
+				block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK,\
+				~block ## reg_num ## _ ## reg1 ## __ ## mask1 ## _MASK \
+		},\
+		.ack_reg = SRI(reg2, block, reg_num),\
+		.ack_mask = block ## reg_num ## _ ## reg2 ## __ ## mask2 ## _MASK,\
+		.ack_value = block ## reg_num ## _ ## reg2 ## __ ## mask2 ## _MASK \
+
+
+
+#define hpd_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_HPD1 + reg_num] = {\
+				IRQ_REG_ENTRY(HPD, reg_num,\
+						DC_HPD_INT_CONTROL, DC_HPD_INT_EN,\
+						DC_HPD_INT_CONTROL, DC_HPD_INT_ACK),\
+						.status_reg = SRI(DC_HPD_INT_STATUS, HPD, reg_num),\
+						.funcs = &hpd_irq_info_funcs\
+}
+
+#define hpd_rx_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_HPD1RX + reg_num] = {\
+				IRQ_REG_ENTRY(HPD, reg_num,\
+						DC_HPD_INT_CONTROL, DC_HPD_RX_INT_EN,\
+						DC_HPD_INT_CONTROL, DC_HPD_RX_INT_ACK),\
+						.status_reg = SRI(DC_HPD_INT_STATUS, HPD, reg_num),\
+						.funcs = &hpd_rx_irq_info_funcs\
+}
+#define pflip_int_entry(reg_num)\
+		[DC_IRQ_SOURCE_PFLIP1 + reg_num] = {\
+				IRQ_REG_ENTRY(HUBPREQ, reg_num,\
+						DCSURF_SURFACE_FLIP_INTERRUPT, SURFACE_FLIP_INT_MASK,\
+						DCSURF_SURFACE_FLIP_INTERRUPT, SURFACE_FLIP_CLEAR),\
+						.funcs = &pflip_irq_info_funcs\
+}
+
+/* vupdate_no_lock_int_entry maps to DC_IRQ_SOURCE_VUPDATEx, to match semantic
+ * of DCE's DC_IRQ_SOURCE_VUPDATEx.
+ */
+#define vupdate_no_lock_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VUPDATE1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VUPDATE_NO_LOCK_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VUPDATE_NO_LOCK_EVENT_CLEAR),\
+		.funcs = &vupdate_no_lock_irq_info_funcs\
+	}
+
+#define vblank_int_entry(reg_num)\
+	[DC_IRQ_SOURCE_VBLANK1 + reg_num] = {\
+		IRQ_REG_ENTRY(OTG, reg_num,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_INT_EN,\
+			OTG_GLOBAL_SYNC_STATUS, VSTARTUP_EVENT_CLEAR),\
+		.funcs = &vblank_irq_info_funcs\
+	}
+
+#define dummy_irq_entry() { .funcs = &dummy_irq_info_funcs }
+
+#define i2c_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_I2C_DDC ## reg_num] = dummy_irq_entry()
+
+#define dp_sink_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_DPSINK ## reg_num] = dummy_irq_entry()
+
+#define gpio_pad_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_GPIOPAD ## reg_num] = dummy_irq_entry()
+
+#define dc_underflow_int_entry(reg_num) \
+		[DC_IRQ_SOURCE_DC ## reg_num ## UNDERFLOW] = dummy_irq_entry()
+
+static const struct irq_source_info_funcs dummy_irq_info_funcs = {
+		.set = dal_irq_service_dummy_set,
+		.ack = dal_irq_service_dummy_ack
+};
+
+static const struct irq_source_info irq_source_info_dcn303[DAL_IRQ_SOURCES_NUMBER] = {
+		[DC_IRQ_SOURCE_INVALID] = dummy_irq_entry(),
+		hpd_int_entry(0),
+		hpd_int_entry(1),
+		hpd_rx_int_entry(0),
+		hpd_rx_int_entry(1),
+		i2c_int_entry(1),
+		i2c_int_entry(2),
+		dp_sink_int_entry(1),
+		dp_sink_int_entry(2),
+		[DC_IRQ_SOURCE_TIMER] = dummy_irq_entry(),
+		pflip_int_entry(0),
+		pflip_int_entry(1),
+		[DC_IRQ_SOURCE_PFLIP_UNDERLAY0] = dummy_irq_entry(),
+		gpio_pad_int_entry(0),
+		gpio_pad_int_entry(1),
+		gpio_pad_int_entry(2),
+		gpio_pad_int_entry(3),
+		gpio_pad_int_entry(4),
+		gpio_pad_int_entry(5),
+		gpio_pad_int_entry(6),
+		gpio_pad_int_entry(7),
+		gpio_pad_int_entry(8),
+		gpio_pad_int_entry(9),
+		gpio_pad_int_entry(10),
+		gpio_pad_int_entry(11),
+		gpio_pad_int_entry(12),
+		gpio_pad_int_entry(13),
+		gpio_pad_int_entry(14),
+		gpio_pad_int_entry(15),
+		gpio_pad_int_entry(16),
+		gpio_pad_int_entry(17),
+		gpio_pad_int_entry(18),
+		gpio_pad_int_entry(19),
+		gpio_pad_int_entry(20),
+		gpio_pad_int_entry(21),
+		gpio_pad_int_entry(22),
+		gpio_pad_int_entry(23),
+		gpio_pad_int_entry(24),
+		gpio_pad_int_entry(25),
+		gpio_pad_int_entry(26),
+		gpio_pad_int_entry(27),
+		gpio_pad_int_entry(28),
+		gpio_pad_int_entry(29),
+		gpio_pad_int_entry(30),
+		dc_underflow_int_entry(1),
+		dc_underflow_int_entry(2),
+		[DC_IRQ_SOURCE_DMCU_SCP] = dummy_irq_entry(),
+		[DC_IRQ_SOURCE_VBIOS_SW] = dummy_irq_entry(),
+		vupdate_no_lock_int_entry(0),
+		vupdate_no_lock_int_entry(1),
+		vblank_int_entry(0),
+		vblank_int_entry(1),
+};
+
+static const struct irq_service_funcs irq_service_funcs_dcn303 = {
+		.to_dal_irq_source = to_dal_irq_source_dcn303
+};
+
+static void dcn303_irq_construct(struct irq_service *irq_service, struct irq_service_init_data *init_data)
+{
+	dal_irq_service_construct(irq_service, init_data);
+
+	irq_service->info = irq_source_info_dcn303;
+	irq_service->funcs = &irq_service_funcs_dcn303;
+}
+
+struct irq_service *dal_irq_service_dcn303_create(struct irq_service_init_data *init_data)
+{
+	struct irq_service *irq_service = kzalloc(sizeof(*irq_service), GFP_KERNEL);
+
+	if (!irq_service)
+		return NULL;
+
+	dcn303_irq_construct(irq_service, init_data);
+	return irq_service;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h
new file mode 100644
index 000000000000..76c7d9bcbc67
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DAL_IRQ_SERVICE_DCN303_H__
+#define __DAL_IRQ_SERVICE_DCN303_H__
+
+#include "../irq_service.h"
+
+struct irq_service *dal_irq_service_dcn303_create(struct irq_service_init_data *init_data);
+
+#endif /* __DAL_IRQ_SERVICE_DCN303_H__ */
diff --git a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
index b4e14960b164..2e533f6506f5 100644
--- a/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
+++ b/drivers/gpu/drm/amd/display/dmub/dmub_srv.h
@@ -93,6 +93,7 @@ enum dmub_asic {
 	DMUB_ASIC_DCN30,
 	DMUB_ASIC_DCN301,
 	DMUB_ASIC_DCN302,
+	DMUB_ASIC_DCN303,
 	DMUB_ASIC_MAX,
 };
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/Makefile b/drivers/gpu/drm/amd/display/dmub/src/Makefile
index 7495c23c73a9..4d9387f53c77 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/Makefile
+++ b/drivers/gpu/drm/amd/display/dmub/src/Makefile
@@ -23,6 +23,7 @@
 DMUB = dmub_srv.o dmub_srv_stat.o dmub_reg.o dmub_dcn20.o dmub_dcn21.o
 DMUB += dmub_dcn30.o dmub_dcn301.o
 DMUB += dmub_dcn302.o
+DMUB += dmub_dcn303.o
 
 AMD_DAL_DMUB = $(addprefix $(AMDDALPATH)/dmub/src/,$(DMUB))
 
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c
new file mode 100644
index 000000000000..bd7a4adf0ed4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.c
@@ -0,0 +1,55 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include "../dmub_srv.h"
+#include "dmub_reg.h"
+#include "dmub_dcn303.h"
+
+#include "sienna_cichlid_ip_offset.h"
+#include "dcn/dcn_3_0_3_offset.h"
+#include "dcn/dcn_3_0_3_sh_mask.h"
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG##seg
+#define CTX dmub
+#define REGS dmub->regs
+
+/* Registers. */
+
+const struct dmub_srv_common_regs dmub_srv_dcn303_regs = {
+#define DMUB_SR(reg) REG_OFFSET(reg),
+	{ DMUB_COMMON_REGS() },
+#undef DMUB_SR
+
+#define DMUB_SF(reg, field) FD_MASK(reg, field),
+	{ DMUB_COMMON_FIELDS() },
+#undef DMUB_SF
+
+#define DMUB_SF(reg, field) FD_SHIFT(reg, field),
+	{ DMUB_COMMON_FIELDS() },
+#undef DMUB_SF
+};
+
+/* Shared functions. */
+
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h
new file mode 100644
index 000000000000..719b0959c494
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn303.h
@@ -0,0 +1,37 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef _DMUB_DCN303_H_
+#define _DMUB_DCN303_H_
+
+#include "dmub_dcn20.h"
+
+/* Registers. */
+
+extern const struct dmub_srv_common_regs dmub_srv_dcn303_regs;
+
+/* Hardware functions. */
+
+#endif /* _DMUB_DCN303_H_ */
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 1cbb125b4063..ec1a35daad78 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -30,6 +30,7 @@
 #include "dmub_dcn30.h"
 #include "dmub_dcn301.h"
 #include "dmub_dcn302.h"
+#include "dmub_dcn303.h"
 #include "os_types.h"
 /*
  * Note: the DMUB service is standalone. No additional headers should be
@@ -142,6 +143,7 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 	case DMUB_ASIC_DCN30:
 	case DMUB_ASIC_DCN301:
 	case DMUB_ASIC_DCN302:
+	case DMUB_ASIC_DCN303:
 		dmub->regs = &dmub_srv_dcn20_regs;
 
 		funcs->reset = dmub_dcn20_reset;
@@ -193,6 +195,12 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 			funcs->backdoor_load = dmub_dcn30_backdoor_load;
 			funcs->setup_windows = dmub_dcn30_setup_windows;
 		}
+		if (asic == DMUB_ASIC_DCN303) {
+			dmub->regs = &dmub_srv_dcn303_regs;
+
+			funcs->backdoor_load = dmub_dcn30_backdoor_load;
+			funcs->setup_windows = dmub_dcn30_setup_windows;
+		}
 		break;
 
 	default:
diff --git a/drivers/gpu/drm/amd/display/include/dal_asic_id.h b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
index 24346f1d7dd0..cb35eae29ca0 100644
--- a/drivers/gpu/drm/amd/display/include/dal_asic_id.h
+++ b/drivers/gpu/drm/amd/display/include/dal_asic_id.h
@@ -196,6 +196,7 @@ enum {
 	NV_NAVI14_M_A0      = 20,
 	NV_SIENNA_CICHLID_P_A0      = 40,
 	NV_DIMGREY_CAVEFISH_P_A0      = 60,
+	NV_BEIGE_GOBY_P_A0  = 70,
 	NV_UNKNOWN          = 0xFF
 };
 
@@ -204,7 +205,8 @@ enum {
 #define ASICREV_IS_NAVI14_M(eChipRev)        ((eChipRev >= NV_NAVI14_M_A0) && (eChipRev < NV_UNKNOWN))
 #define ASICREV_IS_RENOIR(eChipRev) ((eChipRev >= RENOIR_A0) && (eChipRev < RAVEN1_F0))
 #define ASICREV_IS_SIENNA_CICHLID_P(eChipRev)        ((eChipRev >= NV_SIENNA_CICHLID_P_A0) && (eChipRev < NV_DIMGREY_CAVEFISH_P_A0))
-#define ASICREV_IS_DIMGREY_CAVEFISH_P(eChipRev)        ((eChipRev >= NV_DIMGREY_CAVEFISH_P_A0) && (eChipRev < NV_UNKNOWN))
+#define ASICREV_IS_DIMGREY_CAVEFISH_P(eChipRev)        ((eChipRev >= NV_DIMGREY_CAVEFISH_P_A0) && (eChipRev < NV_BEIGE_GOBY_P_A0))
+#define ASICREV_IS_BEIGE_GOBY_P(eChipRev)        ((eChipRev >= NV_BEIGE_GOBY_P_A0) && (eChipRev < NV_UNKNOWN))
 #define GREEN_SARDINE_A0 0xA1
 #ifndef ASICREV_IS_GREEN_SARDINE
 #define ASICREV_IS_GREEN_SARDINE(eChipRev) ((eChipRev >= GREEN_SARDINE_A0) && (eChipRev < 0xFF))
diff --git a/drivers/gpu/drm/amd/display/include/dal_types.h b/drivers/gpu/drm/amd/display/include/dal_types.h
index 0d485802a2d0..85aed509c01f 100644
--- a/drivers/gpu/drm/amd/display/include/dal_types.h
+++ b/drivers/gpu/drm/amd/display/include/dal_types.h
@@ -54,6 +54,7 @@ enum dce_version {
 	DCN_VERSION_3_0,
 	DCN_VERSION_3_01,
 	DCN_VERSION_3_02,
+	DCN_VERSION_3_03,
 	DCN_VERSION_MAX
 };
 
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
