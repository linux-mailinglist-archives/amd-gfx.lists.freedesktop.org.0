Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F953990E8
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Jun 2021 18:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B136EDD8;
	Wed,  2 Jun 2021 16:51:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9866EDD8
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Jun 2021 16:51:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPXxN0s6cy+9S8iKcpoM+TJH8ALKC5HfelifeuP//usdvKCbS/3wp/IEyQuBP4Fp3c/AoZAJBbEty/gFlK2Ja66yORgXwBV4B7q+5wohsJnlfOvqLYsrPWsuwE0NhGoxd//CwfOjQ1WZ+K7tpyN03o34bXTV+iu4EWdpbOVNgRtYBm+WjdcWkXdGCA/AEBkgktdjw4ik5gUm/r+JEcwaB56NHpBILJVYboqq1oMSR6nZ3YXo8zhT4s24xpXKT3rkWTR1U0nwmMPJC4m7GzzipVkgHS52mOGAf+bjvcPrK8yWs1hVnrfsuxgJJNcBdDsXnCGRMwYrJb+hpJylOSfkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nct8CUJoUpmH8Oz0fQYBlGLLG46YlX+01Mh0qKJOLvo=;
 b=iacnZ52duvMZ5ch4KZfMRD6+6HElL32Yi92Ih2QPOo/wLa20edf6HY723Q5tKKQTvyKkn9y0/LBsb2ubdFJ5iLo3gehe06mt1K9Thqj0/KorPidY8nVKitkDFzJ6HQ7j9I+lE9CurMnj+WR2DvGcDeux3fnyob5Ux2MteJ314B5QbMWHUr+gl8uiPw/2TXIp4X95WBHSkdsPEt6MZozGg5ywR6jAWgFXG8EYW0eWvGlZYA9tGnydJQzmcbB6VcpxmbT5hEPnxNSzPZhVgb13z98nSNh7KJczT0ViLfEM0e3NYIecqxsvbR/i4Ui4T2S0E8wjcMfaot0fBbPTCnlcWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nct8CUJoUpmH8Oz0fQYBlGLLG46YlX+01Mh0qKJOLvo=;
 b=4v8ileMAHHa6iTB+y7+aM0LwazfywY2G0hr74+vA9WNQiL5kkVBL6wV3ZTDxhhWV/wZIaZI7egrUGjZhJQIQMGzvHjztDQ5H5M5UWaNrTe+3AKb4ZS1R7nF5nO8sMFeIMSDYLOoutTOGcrePVzuoO0+sNla66ynfGwmRUVaQAPU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4534.namprd12.prod.outlook.com (2603:10b6:208:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 16:51:20 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 16:51:20 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 75/89] drm/amd/display: Add DCN3.1 DCHHUB
Date: Wed,  2 Jun 2021 12:48:54 -0400
Message-Id: <20210602164908.2848791-75-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602164908.2848791-1-alexander.deucher@amd.com>
References: <20210602164908.2848791-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Wed, 2 Jun 2021 16:50:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a56abd4e-962e-4c1b-494e-08d925e68191
X-MS-TrafficTypeDiagnostic: MN2PR12MB4534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4534F626C26C85865BB62B47F73D9@MN2PR12MB4534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nQsxX/wC3BasAdWmGakVRaql4aD3r8YvHVxtT3L7Rs3bO+/W/r5udExfLRDrLjJ1ZPPZNUw76lXBLgTZN6X4oWjMVJBhxxFt9QS3kz3DIJIut70KidHSQTpUy/MgY0SqPkiBhm0v4rJYkY0TWAgnCoMZYwPls92sce8/+17fD8UY07vJ1sQDhfqb8kb1vxiAZTGI4pXcGx7f7TRmynVjFqPuPStgwdyIblUmNuc9/TTMTjE7689Sv4oBwdboLRucRszdsJVM9JqvZcs/gND9sp8TNTQrBlSkpro5Xf8LxmPhL8zTRPt4Uj6XQ+SSDwY3m0PzpiA3OKLizJZ6IKzdOxE9ZzDSuOZynxxyNP5or015VTxjjTjc4zDhe5SBXqsKkT2S9v753PgmmqwfvhE4ICYXmHf5wF7aZncQ3H3dQfhpZYj3bq860YBzvC83lMwIlW+nCu4q/T4Av6U7D+QUuJAoXd3eIoTGl8YvrYhhJCr94tuqkBTUixzIZIGyljDOyEMI3dMLPoNEH7cpdCmd2fzFEVWi501GidY3NPa5sjf+9tfhsN+NddjaA/BfhtLtbvp1OKNDk6jO3HgCSZgxbjcfkNkBvpGSqDOjnufAnexli+eowqSIzXnZj9CnsfoGUydWiPf9Bie4jKzG+tiWJw0zF6YeicGemZUWD6jWRXNMTd6ZSV39o6l6svHJAgBUHjn6+DGK7PqKxgd6GK7CKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(30864003)(1076003)(8676002)(2906002)(8936002)(4326008)(2616005)(956004)(38350700002)(478600001)(38100700002)(83380400001)(66946007)(66476007)(66556008)(36756003)(54906003)(6486002)(52116002)(6916009)(316002)(6512007)(6506007)(16526019)(26005)(6666004)(5660300002)(186003)(86362001)(69590400013)(21314003)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ReE11D96sn96kiq59GoFcqor3/5LEaY5/RfJrSIk755nsVNAi8hnNMA0k5bt?=
 =?us-ascii?Q?EAumKH2jEKO1HQHzY7O96SuvrahuX27+1fH0q7u6LREp8Mc6JRN58Z7Q8WsZ?=
 =?us-ascii?Q?23lkGnlplrVioSMphsrKhvPN02FVPxk90G5BRys8RdvFfpBxXRFkYUdXrgTu?=
 =?us-ascii?Q?2OwjNcBCaczHRbx0PPQn9DaOOW79nl1dJ9LTH7bwJDbrK1ydWgu3jpZCmyyr?=
 =?us-ascii?Q?wLItuXI/7hRMXovEcIGKHlqYbEAr1NKQT9xPAIlTQxsRFOizpG+7rRyuR2rw?=
 =?us-ascii?Q?2nzh0NlQO1QqAwuHDndmGff0ZxN0xQf8TwnGN0UMixX4WNIcwtpFZfNvlJmq?=
 =?us-ascii?Q?gn/mJvGxju70POwwyEJCI21Q+bKEKCadzyQFbNuHeullSOTsMKqUsSVuNvXO?=
 =?us-ascii?Q?owXyJLkSsQuiRcV2J6zVqQTwkOGvlvb1HPniKa5CbgwP1xq+zdYwWj/Q098h?=
 =?us-ascii?Q?TPBK/yK4bRrbaeTV8TeH4F++hlSw5KBdJnGO+oJEODQO4EnGaAGPiY4ZFT15?=
 =?us-ascii?Q?JGSDm/sR3wQ8h8i/hRFVI8faPv9+zmKi+TV1EZ5zVo+ss5lJq5S0GnzULVEx?=
 =?us-ascii?Q?Qztb7ew7h+prSbrQoGF8NC3AZYGkdbBCba8b/UNvWo/R3BE1hr0pfX+HUdKY?=
 =?us-ascii?Q?1CobImpU0mcHlgYo/HsnS1K7L3dj2toWbmFKK4l4o80Tfu/JJIowKhYFytZX?=
 =?us-ascii?Q?ay7GJxQf0McG9EV/OSFXCoDRSUB/+jcVaad8geTPLStSqhUf+eFxBRjmUaWo?=
 =?us-ascii?Q?QCb5dVNl1vq3TrCz3ANTeGYS2lUVqkeMyVOT9KFBPqUFrJOrhnXjh85g1bzy?=
 =?us-ascii?Q?Zrl3uiOb6GZnpKFP7nMypOjPele1ftNnZsuC50myO0ek5oq36X5RsK7UkyLy?=
 =?us-ascii?Q?f1Mh2UZDlFP4gqPdkms6RpbgA3HQ+XZTTM572VTpANa9ekPHgWFDy36RvYQR?=
 =?us-ascii?Q?7wjekzAhIVYBFjQmNSvq19NTIBZy95qYj8PAH1eD/TeUTKXoBdyjpgwarr2d?=
 =?us-ascii?Q?THZYyvzKse/jE+NylPzp6ATFz1Ne86AWWtEppXaftAXgLHefg79p1qZDl9nD?=
 =?us-ascii?Q?54kCPBEqwWp2cWxZk0a2tNzxOkx1r+bIlrxcpzbsiCd5m2OW5TYYVm8j8YKi?=
 =?us-ascii?Q?2ddhYtZe8pUmCfEeKfWxqaYdMAz00NdIHrqlwlSzmNjIBtV+QUWmWSDOZ4xf?=
 =?us-ascii?Q?1bbyuZ0uL393grODeoA1HsT7Ub9zlbUqAMtVm3wTsT2+c7lmwv6QNnGT8rkf?=
 =?us-ascii?Q?TgBpq9MqPMzJxvLM5dfOjW2U2UXTeaRv542tjX2pnCHo9sTcPadfb/3MG87t?=
 =?us-ascii?Q?yY2UhLafJcNnyAB54tcXK/X6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56abd4e-962e-4c1b-494e-08d925e68191
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 16:50:19.9120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rz4nwgyBJR8uCSrFanvJLeptXDVigdwOv03cJ1EUdG6X+TvXURJPsE2ub7qraJuQLE57OnBw44hooFOV/SNFRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4534
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
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Adds DCN3.1 DCHHUB programming and modifies DCN20/DCN30 shared
hardware sequencer helpers to use these hooks.

HW Blocks:

 +--------++------+       +----------+
 |DCHUBBUB|| HUBP |  <--  | MMHUBBUB |
 +--------++------+       +----------+
        |                      ^
        v                      |
    +--------+             +--------+
    |  DPP   | <---------> |  DWB   |
    +--------+             +--------+
        |                      ^
        v                      |
    +--------+                 |
    |  MPC   |                 |
    +--------+                 |
        |                      |
        v                      |
    +-------+                  |
    |  OPP  |                  |
    +-------+                  |
        |                      |
        v                      |
    +--------+                /
    |  OPTC  |  --------------
    +--------+
        |
        v
    +--------+       +--------+
    |  DIO   |       |  DCCG  |
    +--------+       +--------+

No changes to MMHUBBUB or DWB programming, added to diagram for clarity.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../drm/amd/display/dc/dcn10/dcn10_hubbub.h   |  48 +
 .../drm/amd/display/dc/dcn20/dcn20_hubbub.h   |   9 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h |  16 +
 .../drm/amd/display/dc/dcn20/dcn20_hwseq.c    |  37 +
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |   5 +
 .../drm/amd/display/dc/dcn31/dcn31_hubbub.c   | 956 ++++++++++++++++++
 .../drm/amd/display/dc/dcn31/dcn31_hubbub.h   | 122 +++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c | 103 ++
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h | 246 +++++
 .../gpu/drm/amd/display/dc/inc/core_types.h   |  10 +
 .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   5 +
 .../gpu/drm/amd/display/dc/inc/hw/mem_input.h |   4 +
 12 files changed, 1561 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
index 343a537172c7..83c3f944e9ab 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubbub.h
@@ -139,6 +139,23 @@ struct dcn_hubbub_registers {
 	uint32_t DCHVM_CLK_CTRL;
 	uint32_t DCHVM_RIOMMU_CTRL0;
 	uint32_t DCHVM_RIOMMU_STAT0;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	uint32_t DCHUBBUB_DET0_CTRL;
+	uint32_t DCHUBBUB_DET1_CTRL;
+	uint32_t DCHUBBUB_DET2_CTRL;
+	uint32_t DCHUBBUB_DET3_CTRL;
+	uint32_t DCHUBBUB_COMPBUF_CTRL;
+	uint32_t COMPBUF_RESERVED_SPACE;
+	uint32_t DCHUBBUB_DEBUG_CTRL_0;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D;
+	uint32_t DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D;
+#endif
 };
 
 /* set field name */
@@ -275,17 +292,48 @@ struct dcn_hubbub_registers {
 		type HOSTVM_POWERSTATUS; \
 		type RIOMMU_ACTIVE; \
 		type HOSTVM_PREFETCH_DONE
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+#define HUBBUB_RET_REG_FIELD_LIST(type) \
+		type DET_DEPTH;\
+		type DET0_SIZE;\
+		type DET1_SIZE;\
+		type DET2_SIZE;\
+		type DET3_SIZE;\
+		type DET0_SIZE_CURRENT;\
+		type DET1_SIZE_CURRENT;\
+		type DET2_SIZE_CURRENT;\
+		type DET3_SIZE_CURRENT;\
+		type COMPBUF_SIZE;\
+		type COMPBUF_SIZE_CURRENT;\
+		type COMPBUF_RESERVED_SPACE_64B;\
+		type COMPBUF_RESERVED_SPACE_ZS;\
+		type DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A;\
+		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A;\
+		type DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B;\
+		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B;\
+		type DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C;\
+		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C;\
+		type DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D;\
+		type DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D
+#endif
+
 
 struct dcn_hubbub_shift {
 	DCN_HUBBUB_REG_FIELD_LIST(uint8_t);
 	HUBBUB_STUTTER_REG_FIELD_LIST(uint8_t);
 	HUBBUB_HVM_REG_FIELD_LIST(uint8_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	HUBBUB_RET_REG_FIELD_LIST(uint8_t);
+#endif
 };
 
 struct dcn_hubbub_mask {
 	DCN_HUBBUB_REG_FIELD_LIST(uint32_t);
 	HUBBUB_STUTTER_REG_FIELD_LIST(uint32_t);
 	HUBBUB_HVM_REG_FIELD_LIST(uint32_t);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	HUBBUB_RET_REG_FIELD_LIST(uint32_t);
+#endif
 };
 
 struct dc;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
index c478213ba7ad..a4fc70fa0957 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubbub.h
@@ -83,6 +83,15 @@ struct dcn20_hubbub {
 	int num_vmid;
 	struct dcn20_vmid vmid[16];
 	unsigned int detile_buf_size;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	unsigned int crb_size_segs;
+	unsigned int compbuf_size_segments;
+	unsigned int pixel_chunk_size;
+	unsigned int det0_size;
+	unsigned int det1_size;
+	unsigned int det2_size;
+	unsigned int det3_size;
+#endif
 };
 
 void hubbub2_construct(struct dcn20_hubbub *hubbub,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
index f501c02c244b..2652d6abe9e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.h
@@ -216,16 +216,32 @@
 	type ROW_TTU_MODE; \
 	type NUM_PKRS
 
+#ifdef CONFIG_DRM_AMD_DC_DCN3_1
+#define DCN31_HUBP_REG_FIELD_VARIABLE_LIST(type) \
+	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(type);\
+	type HUBP_UNBOUNDED_REQ_MODE;\
+	type CURSOR_REQ_MODE;\
+	type HUBP_SOFT_RESET
+#endif
+
 struct dcn_hubp2_registers {
 	DCN30_HUBP_REG_COMMON_VARIABLE_LIST;
 };
 
 struct dcn_hubp2_shift {
+#if   defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
+#else
 	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint8_t);
+#endif
 };
 
 struct dcn_hubp2_mask {
+#if   defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	DCN31_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
+#else
 	DCN30_HUBP_REG_FIELD_VARIABLE_LIST(uint32_t);
+#endif
 };
 
 struct dcn20_hubp {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 14e322761645..a90f54236b93 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -1269,6 +1269,9 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 		new_pipe->update_flags.bits.gamut_remap = 1;
 		new_pipe->update_flags.bits.scaler = 1;
 		new_pipe->update_flags.bits.viewport = 1;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+		new_pipe->update_flags.bits.det_size = 1;
+#endif
 		if (!new_pipe->top_pipe && !new_pipe->prev_odm_pipe) {
 			new_pipe->update_flags.bits.odm = 1;
 			new_pipe->update_flags.bits.global_sync = 1;
@@ -1303,6 +1306,10 @@ static void dcn20_detect_pipe_changes(struct pipe_ctx *old_pipe, struct pipe_ctx
 			new_pipe->update_flags.bits.global_sync = 1;
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	if (old_pipe->det_buffer_size_kb != new_pipe->det_buffer_size_kb)
+		new_pipe->update_flags.bits.det_size = 1;
+#endif
 	/*
 	 * Detect opp / tg change, only set on change, not on enable
 	 * Assume mpcc inst = pipe index, if not this code needs to be updated
@@ -1418,6 +1425,10 @@ static void dcn20_update_dchubp_dpp(
 			&pipe_ctx->ttu_regs,
 			&pipe_ctx->rq_regs,
 			&pipe_ctx->pipe_dlg_param);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+		if (hubp->funcs->set_unbounded_requesting)
+			hubp->funcs->set_unbounded_requesting(hubp, pipe_ctx->unbounded_req);
+#endif
 	}
 	if (pipe_ctx->update_flags.bits.hubp_interdependent)
 		hubp->funcs->hubp_setup_interdependent(
@@ -1597,6 +1608,12 @@ static void dcn20_program_pipe(
 			dc->res_pool->hubbub->funcs->force_wm_propagate_to_pipes(dc->res_pool->hubbub);
 	}
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	if (dc->res_pool->hubbub->funcs->program_det_size && pipe_ctx->update_flags.bits.det_size)
+		dc->res_pool->hubbub->funcs->program_det_size(
+			dc->res_pool->hubbub, pipe_ctx->plane_res.hubp->inst, pipe_ctx->det_buffer_size_kb);
+#endif
+
 	if (pipe_ctx->update_flags.raw || pipe_ctx->plane_state->update_flags.raw || pipe_ctx->stream->update_flags.raw)
 		dcn20_update_dchubp_dpp(dc, pipe_ctx, context);
 
@@ -1687,6 +1704,12 @@ void dcn20_program_front_end_for_ctx(
 	for (i = 0; i < dc->res_pool->pipe_count; i++)
 		if (context->res_ctx.pipe_ctx[i].update_flags.bits.disable
 				|| context->res_ctx.pipe_ctx[i].update_flags.bits.opp_changed) {
+		#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+			struct hubbub *hubbub = dc->res_pool->hubbub;
+
+			if (hubbub->funcs->program_det_size && context->res_ctx.pipe_ctx[i].update_flags.bits.disable)
+				hubbub->funcs->program_det_size(hubbub, dc->current_state->res_ctx.pipe_ctx[i].plane_res.hubp->inst, 0);
+		#endif
 			hws->funcs.plane_atomic_disconnect(dc, &dc->current_state->res_ctx.pipe_ctx[i]);
 			DC_LOG_DC("Reset mpcc for pipe %d\n", dc->current_state->res_ctx.pipe_ctx[i].pipe_idx);
 		}
@@ -1804,6 +1827,11 @@ void dcn20_prepare_bandwidth(
 					&context->bw_ctx.bw.dcn.watermarks,
 					dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000,
 					false);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	/* decrease compbuf size */
+	if (hubbub->funcs->program_compbuf_size)
+		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, false);
+#endif
 }
 
 void dcn20_optimize_bandwidth(
@@ -1822,6 +1850,11 @@ void dcn20_optimize_bandwidth(
 			dc->clk_mgr,
 			context,
 			true);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	/* increase compbuf size */
+	if (hubbub->funcs->program_compbuf_size)
+		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, true);
+#endif
 }
 
 bool dcn20_update_bandwidth(
@@ -2539,6 +2572,10 @@ void dcn20_fpga_init_hw(struct dc *dc)
 
 		tg->funcs->tg_init(tg);
 	}
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	if (dc->res_pool->hubbub->funcs->init_crb)
+		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
+#endif
 }
 #ifndef TRIM_FSFT
 bool dcn20_optimize_timing_for_fsft(struct dc *dc,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 83685310a391..ef5d0b778a72 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -651,6 +651,11 @@ void dcn30_init_hw(struct dc *dc)
 	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
 		dc->res_pool->hubbub->funcs->force_pstate_change_control(
 				dc->res_pool->hubbub, false, false);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	if (dc->res_pool->hubbub->funcs->init_crb)
+		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
+#endif
+
 }
 
 void dcn30_set_avmute(struct pipe_ctx *pipe_ctx, bool enable)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
new file mode 100644
index 000000000000..bb9648488900
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.c
@@ -0,0 +1,956 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
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
+
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31_hubbub.h"
+#include "dm_services.h"
+#include "reg_helper.h"
+
+
+#define CTX \
+	hubbub2->base.ctx
+#define DC_LOGGER \
+	hubbub2->base.ctx->logger
+#define REG(reg)\
+	hubbub2->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubbub2->shifts->field_name, hubbub2->masks->field_name
+
+#ifdef NUM_VMID
+#undef NUM_VMID
+#endif
+#define NUM_VMID 16
+
+#define DCN31_CRB_SEGMENT_SIZE_KB 64
+
+static void dcn31_init_crb(struct hubbub *hubbub)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	REG_GET(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT,
+		&hubbub2->det0_size);
+
+	REG_GET(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT,
+		&hubbub2->det1_size);
+
+	REG_GET(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT,
+		&hubbub2->det2_size);
+
+	REG_GET(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT,
+		&hubbub2->det3_size);
+
+	REG_GET(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT,
+		&hubbub2->compbuf_size_segments);
+
+	REG_SET_2(COMPBUF_RESERVED_SPACE, 0,
+			COMPBUF_RESERVED_SPACE_64B, hubbub2->pixel_chunk_size / 32,
+			COMPBUF_RESERVED_SPACE_ZS, hubbub2->pixel_chunk_size / 128);
+	REG_UPDATE(DCHUBBUB_DEBUG_CTRL_0, DET_DEPTH, 0x17F);
+}
+
+static void dcn31_program_det_size(struct hubbub *hubbub, int hubp_inst, unsigned int det_buffer_size_in_kbyte)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	unsigned int det_size_segments = (det_buffer_size_in_kbyte + DCN31_CRB_SEGMENT_SIZE_KB - 1) / DCN31_CRB_SEGMENT_SIZE_KB;
+
+	switch (hubp_inst) {
+	case 0:
+		REG_UPDATE(DCHUBBUB_DET0_CTRL,
+					DET0_SIZE, det_size_segments);
+		hubbub2->det0_size = det_size_segments;
+		break;
+	case 1:
+		REG_UPDATE(DCHUBBUB_DET1_CTRL,
+					DET1_SIZE, det_size_segments);
+		hubbub2->det1_size = det_size_segments;
+		break;
+	case 2:
+		REG_UPDATE(DCHUBBUB_DET2_CTRL,
+					DET2_SIZE, det_size_segments);
+		hubbub2->det2_size = det_size_segments;
+		break;
+	case 3:
+		REG_UPDATE(DCHUBBUB_DET3_CTRL,
+					DET3_SIZE, det_size_segments);
+		hubbub2->det3_size = det_size_segments;
+		break;
+	default:
+		break;
+	}
+	/* Should never be hit, if it is we have an erroneous hw config*/
+	ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+			+ hubbub2->det3_size + hubbub2->compbuf_size_segments <= hubbub2->crb_size_segs);
+}
+
+static void dcn31_program_compbuf_size(struct hubbub *hubbub, unsigned int compbuf_size_kb, bool safe_to_increase)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	unsigned int compbuf_size_segments = (compbuf_size_kb + DCN31_CRB_SEGMENT_SIZE_KB - 1) / DCN31_CRB_SEGMENT_SIZE_KB;
+
+	if (safe_to_increase || compbuf_size_segments <= hubbub2->compbuf_size_segments) {
+		if (compbuf_size_segments > hubbub2->compbuf_size_segments) {
+			REG_WAIT(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT, hubbub2->det0_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT, hubbub2->det1_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT, hubbub2->det2_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
+		}
+		/* Should never be hit, if it is we have an erroneous hw config*/
+		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+				+ hubbub2->det3_size + compbuf_size_segments <= hubbub2->crb_size_segs);
+		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_segments);
+		REG_WAIT(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT, compbuf_size_segments, 1, 100);
+		hubbub2->compbuf_size_segments = compbuf_size_segments;
+	}
+}
+
+static uint32_t convert_and_clamp(
+	uint32_t wm_ns,
+	uint32_t refclk_mhz,
+	uint32_t clamp_value)
+{
+	uint32_t ret_val = 0;
+	ret_val = wm_ns * refclk_mhz;
+	ret_val /= 1000;
+
+	if (ret_val > clamp_value)
+		ret_val = clamp_value;
+
+	return ret_val;
+}
+
+static bool hubbub31_program_urgent_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+	bool wm_pending = false;
+
+	/* Repeat for water mark set A, B, C and D. */
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.urgent_ns > hubbub2->watermarks.a.urgent_ns) {
+		hubbub2->watermarks.a.urgent_ns = watermarks->a.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->a.urgent_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.urgent_ns, prog_wm_value);
+	} else if (watermarks->a.urgent_ns < hubbub2->watermarks.a.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->a.frac_urg_bw_flip
+			> hubbub2->watermarks.a.frac_urg_bw_flip) {
+		hubbub2->watermarks.a.frac_urg_bw_flip = watermarks->a.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, watermarks->a.frac_urg_bw_flip);
+	} else if (watermarks->a.frac_urg_bw_flip
+			< hubbub2->watermarks.a.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.frac_urg_bw_nom
+			> hubbub2->watermarks.a.frac_urg_bw_nom) {
+		hubbub2->watermarks.a.frac_urg_bw_nom = watermarks->a.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, watermarks->a.frac_urg_bw_nom);
+	} else if (watermarks->a.frac_urg_bw_nom
+			< hubbub2->watermarks.a.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.urgent_latency_ns > hubbub2->watermarks.a.urgent_latency_ns) {
+		hubbub2->watermarks.a.urgent_latency_ns = watermarks->a.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->a.urgent_latency_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, prog_wm_value);
+	} else if (watermarks->a.urgent_latency_ns < hubbub2->watermarks.a.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.urgent_ns > hubbub2->watermarks.b.urgent_ns) {
+		hubbub2->watermarks.b.urgent_ns = watermarks->b.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->b.urgent_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.urgent_ns, prog_wm_value);
+	} else if (watermarks->b.urgent_ns < hubbub2->watermarks.b.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->b.frac_urg_bw_flip
+			> hubbub2->watermarks.b.frac_urg_bw_flip) {
+		hubbub2->watermarks.b.frac_urg_bw_flip = watermarks->b.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, watermarks->b.frac_urg_bw_flip);
+	} else if (watermarks->b.frac_urg_bw_flip
+			< hubbub2->watermarks.b.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.frac_urg_bw_nom
+			> hubbub2->watermarks.b.frac_urg_bw_nom) {
+		hubbub2->watermarks.b.frac_urg_bw_nom = watermarks->b.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, watermarks->b.frac_urg_bw_nom);
+	} else if (watermarks->b.frac_urg_bw_nom
+			< hubbub2->watermarks.b.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.urgent_latency_ns > hubbub2->watermarks.b.urgent_latency_ns) {
+		hubbub2->watermarks.b.urgent_latency_ns = watermarks->b.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->b.urgent_latency_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, prog_wm_value);
+	} else if (watermarks->b.urgent_latency_ns < hubbub2->watermarks.b.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.urgent_ns > hubbub2->watermarks.c.urgent_ns) {
+		hubbub2->watermarks.c.urgent_ns = watermarks->c.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->c.urgent_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.urgent_ns, prog_wm_value);
+	} else if (watermarks->c.urgent_ns < hubbub2->watermarks.c.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->c.frac_urg_bw_flip
+			> hubbub2->watermarks.c.frac_urg_bw_flip) {
+		hubbub2->watermarks.c.frac_urg_bw_flip = watermarks->c.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, watermarks->c.frac_urg_bw_flip);
+	} else if (watermarks->c.frac_urg_bw_flip
+			< hubbub2->watermarks.c.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.frac_urg_bw_nom
+			> hubbub2->watermarks.c.frac_urg_bw_nom) {
+		hubbub2->watermarks.c.frac_urg_bw_nom = watermarks->c.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, watermarks->c.frac_urg_bw_nom);
+	} else if (watermarks->c.frac_urg_bw_nom
+			< hubbub2->watermarks.c.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.urgent_latency_ns > hubbub2->watermarks.c.urgent_latency_ns) {
+		hubbub2->watermarks.c.urgent_latency_ns = watermarks->c.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->c.urgent_latency_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, prog_wm_value);
+	} else if (watermarks->c.urgent_latency_ns < hubbub2->watermarks.c.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.urgent_ns > hubbub2->watermarks.d.urgent_ns) {
+		hubbub2->watermarks.d.urgent_ns = watermarks->d.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->d.urgent_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.urgent_ns, prog_wm_value);
+	} else if (watermarks->d.urgent_ns < hubbub2->watermarks.d.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->d.frac_urg_bw_flip
+			> hubbub2->watermarks.d.frac_urg_bw_flip) {
+		hubbub2->watermarks.d.frac_urg_bw_flip = watermarks->d.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, watermarks->d.frac_urg_bw_flip);
+	} else if (watermarks->d.frac_urg_bw_flip
+			< hubbub2->watermarks.d.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.frac_urg_bw_nom
+			> hubbub2->watermarks.d.frac_urg_bw_nom) {
+		hubbub2->watermarks.d.frac_urg_bw_nom = watermarks->d.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, watermarks->d.frac_urg_bw_nom);
+	} else if (watermarks->d.frac_urg_bw_nom
+			< hubbub2->watermarks.d.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.urgent_latency_ns > hubbub2->watermarks.d.urgent_latency_ns) {
+		hubbub2->watermarks.d.urgent_latency_ns = watermarks->d.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->d.urgent_latency_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, prog_wm_value);
+	} else if (watermarks->d.urgent_latency_ns < hubbub2->watermarks.d.urgent_latency_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+static bool hubbub31_program_stutter_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+	bool wm_pending = false;
+
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns =
+				watermarks->a.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_z8_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_z8_ns =
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_z8_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_exit_z8_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_exit_z8_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_exit_z8_ns =
+				watermarks->a.cstate_pstate.cstate_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_exit_z8_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_exit_z8_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns =
+				watermarks->b.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_z8_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_z8_ns =
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_z8_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_exit_z8_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_exit_z8_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_exit_z8_ns =
+				watermarks->b.cstate_pstate.cstate_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_exit_z8_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_exit_z8_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns =
+				watermarks->c.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_z8_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_z8_ns =
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_z8_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_exit_z8_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_exit_z8_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_exit_z8_ns =
+				watermarks->c.cstate_pstate.cstate_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_exit_z8_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_exit_z8_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns =
+				watermarks->d.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_z8_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_z8_ns =
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_WATERMARK_Z8_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_enter_plus_exit_z8_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_z8_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_exit_z8_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_exit_z8_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_exit_z8_ns =
+				watermarks->d.cstate_pstate.cstate_exit_z8_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_exit_z8_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_Z8_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_exit_z8_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_exit_z8_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_exit_z8_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+static bool hubbub31_program_pstate_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+
+	bool wm_pending = false;
+
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.a.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.a.cstate_pstate.pstate_change_ns =
+				watermarks->a.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, 0,
+				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->a.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.a.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.b.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.b.cstate_pstate.pstate_change_ns =
+				watermarks->b.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, 0,
+				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->b.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.b.cstate_pstate.pstate_change_ns)
+		wm_pending = false;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.c.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.c.cstate_pstate.pstate_change_ns =
+				watermarks->c.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, 0,
+				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->c.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.c.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.d.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.d.cstate_pstate.pstate_change_ns =
+				watermarks->d.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0x1fffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, 0,
+				DCHUBBUB_ARB_ALLOW_DRAM_CLK_CHANGE_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->d.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.d.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+static bool hubbub31_program_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	bool wm_pending = false;
+
+	if (hubbub31_program_urgent_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	if (hubbub31_program_stutter_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	if (hubbub31_program_pstate_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	/*
+	 * The DCHub arbiter has a mechanism to dynamically rate limit the DCHub request stream to the fabric.
+	 * If the memory controller is fully utilized and the DCHub requestors are
+	 * well ahead of their amortized schedule, then it is safe to prevent the next winner
+	 * from being committed and sent to the fabric.
+	 * The utilization of the memory controller is approximated by ensuring that
+	 * the number of outstanding requests is greater than a threshold specified
+	 * by the ARB_MIN_REQ_OUTSTANDING. To determine that the DCHub requestors are well ahead of the amortized schedule,
+	 * the slack of the next winner is compared with the ARB_SAT_LEVEL in DLG RefClk cycles.
+	 *
+	 * TODO: Revisit request limit after figure out right number. request limit for RM isn't decided yet, set maximum value (0x1FF)
+	 * to turn off it for now.
+	 */
+	/*REG_SET(DCHUBBUB_ARB_SAT_LEVEL, 0,
+			DCHUBBUB_ARB_SAT_LEVEL, 60 * refclk_mhz);
+	REG_UPDATE(DCHUBBUB_ARB_DF_REQ_OUTSTAND,
+			DCHUBBUB_ARB_MIN_REQ_OUTSTAND, 0x1FF);*/
+
+	hubbub1_allow_self_refresh_control(hubbub, !hubbub->ctx->dc->debug.disable_stutter);
+	return wm_pending;
+}
+
+static void hubbub3_get_blk256_size(unsigned int *blk256_width, unsigned int *blk256_height,
+		unsigned int bytes_per_element)
+{
+	/* copied from DML.  might want to refactor DML to leverage from DML */
+	/* DML : get_blk256_size */
+	if (bytes_per_element == 1) {
+		*blk256_width = 16;
+		*blk256_height = 16;
+	} else if (bytes_per_element == 2) {
+		*blk256_width = 16;
+		*blk256_height = 8;
+	} else if (bytes_per_element == 4) {
+		*blk256_width = 8;
+		*blk256_height = 8;
+	} else if (bytes_per_element == 8) {
+		*blk256_width = 8;
+		*blk256_height = 4;
+	}
+}
+
+static void hubbub31_det_request_size(
+		unsigned int detile_buf_size,
+		unsigned int height,
+		unsigned int width,
+		unsigned int bpe,
+		bool *req128_horz_wc,
+		bool *req128_vert_wc)
+{
+	unsigned int blk256_height = 0;
+	unsigned int blk256_width = 0;
+	unsigned int swath_bytes_horz_wc, swath_bytes_vert_wc;
+
+	hubbub3_get_blk256_size(&blk256_width, &blk256_height, bpe);
+
+	swath_bytes_horz_wc = width * blk256_height * bpe;
+	swath_bytes_vert_wc = height * blk256_width * bpe;
+
+	*req128_horz_wc = (2 * swath_bytes_horz_wc <= detile_buf_size) ?
+			false : /* full 256B request */
+			true; /* half 128b request */
+
+	*req128_vert_wc = (2 * swath_bytes_vert_wc <= detile_buf_size) ?
+			false : /* full 256B request */
+			true; /* half 128b request */
+}
+
+static bool hubbub31_get_dcc_compression_cap(struct hubbub *hubbub,
+		const struct dc_dcc_surface_param *input,
+		struct dc_surface_dcc_cap *output)
+{
+	struct dc *dc = hubbub->ctx->dc;
+	enum dcc_control dcc_control;
+	unsigned int bpe;
+	enum segment_order segment_order_horz, segment_order_vert;
+	bool req128_horz_wc, req128_vert_wc;
+
+	memset(output, 0, sizeof(*output));
+
+	if (dc->debug.disable_dcc == DCC_DISABLE)
+		return false;
+
+	if (!hubbub->funcs->dcc_support_pixel_format(input->format,
+			&bpe))
+		return false;
+
+	if (!hubbub->funcs->dcc_support_swizzle(input->swizzle_mode, bpe,
+			&segment_order_horz, &segment_order_vert))
+		return false;
+
+	hubbub31_det_request_size(TO_DCN20_HUBBUB(hubbub)->detile_buf_size,
+			input->surface_size.height,  input->surface_size.width,
+			bpe, &req128_horz_wc, &req128_vert_wc);
+
+	if (!req128_horz_wc && !req128_vert_wc) {
+		dcc_control = dcc_control__256_256_xxx;
+	} else if (input->scan == SCAN_DIRECTION_HORIZONTAL) {
+		if (!req128_horz_wc)
+			dcc_control = dcc_control__256_256_xxx;
+		else if (segment_order_horz == segment_order__contiguous)
+			dcc_control = dcc_control__128_128_xxx;
+		else
+			dcc_control = dcc_control__256_64_64;
+	} else if (input->scan == SCAN_DIRECTION_VERTICAL) {
+		if (!req128_vert_wc)
+			dcc_control = dcc_control__256_256_xxx;
+		else if (segment_order_vert == segment_order__contiguous)
+			dcc_control = dcc_control__128_128_xxx;
+		else
+			dcc_control = dcc_control__256_64_64;
+	} else {
+		if ((req128_horz_wc &&
+			segment_order_horz == segment_order__non_contiguous) ||
+			(req128_vert_wc &&
+			segment_order_vert == segment_order__non_contiguous))
+			/* access_dir not known, must use most constraining */
+			dcc_control = dcc_control__256_64_64;
+		else
+			/* reg128 is true for either horz and vert
+			 * but segment_order is contiguous
+			 */
+			dcc_control = dcc_control__128_128_xxx;
+	}
+
+	/* Exception for 64KB_R_X */
+	if ((bpe == 2) && (input->swizzle_mode == DC_SW_64KB_R_X))
+		dcc_control = dcc_control__128_128_xxx;
+
+	if (dc->debug.disable_dcc == DCC_HALF_REQ_DISALBE &&
+		dcc_control != dcc_control__256_256_xxx)
+		return false;
+
+	switch (dcc_control) {
+	case dcc_control__256_256_xxx:
+		output->grph.rgb.max_uncompressed_blk_size = 256;
+		output->grph.rgb.max_compressed_blk_size = 256;
+		output->grph.rgb.independent_64b_blks = false;
+		output->grph.rgb.dcc_controls.dcc_256_256_unconstrained = 1;
+		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
+		break;
+	case dcc_control__128_128_xxx:
+		output->grph.rgb.max_uncompressed_blk_size = 128;
+		output->grph.rgb.max_compressed_blk_size = 128;
+		output->grph.rgb.independent_64b_blks = false;
+		output->grph.rgb.dcc_controls.dcc_128_128_uncontrained = 1;
+		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
+		break;
+	case dcc_control__256_64_64:
+		output->grph.rgb.max_uncompressed_blk_size = 256;
+		output->grph.rgb.max_compressed_blk_size = 64;
+		output->grph.rgb.independent_64b_blks = true;
+		output->grph.rgb.dcc_controls.dcc_256_64_64 = 1;
+		break;
+	case dcc_control__256_128_128:
+		output->grph.rgb.max_uncompressed_blk_size = 256;
+		output->grph.rgb.max_compressed_blk_size = 128;
+		output->grph.rgb.independent_64b_blks = false;
+		output->grph.rgb.dcc_controls.dcc_256_128_128 = 1;
+		break;
+	}
+	output->capable = true;
+	output->const_color_support = true;
+
+	return true;
+}
+
+static int hubbub31_init_dchub_sys_ctx(struct hubbub *hubbub,
+		struct dcn_hubbub_phys_addr_config *pa_config)
+{
+	hubbub3_init_dchub_sys_ctx(hubbub, pa_config);
+
+	dcn21_dchvm_init(hubbub);
+
+	return NUM_VMID;
+}
+
+static void hubbub31_get_dchub_ref_freq(struct hubbub *hubbub,
+		unsigned int dccg_ref_freq_inKhz,
+		unsigned int *dchub_ref_freq_inKhz)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t ref_div = 0;
+	uint32_t ref_en = 0;
+	unsigned int dc_refclk_khz = 24000;
+
+	REG_GET_2(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, &ref_div,
+			DCHUBBUB_GLOBAL_TIMER_ENABLE, &ref_en);
+
+	if (ref_en) {
+		if (ref_div == 2)
+			*dchub_ref_freq_inKhz = dc_refclk_khz / 2;
+		else
+			*dchub_ref_freq_inKhz = dc_refclk_khz;
+
+		/*
+		 * The external Reference Clock may change based on the board or
+		 * platform requirements and the programmable integer divide must
+		 * be programmed to provide a suitable DLG RefClk frequency between
+		 * a minimum of 20MHz and maximum of 50MHz
+		 */
+		if (*dchub_ref_freq_inKhz < 20000 || *dchub_ref_freq_inKhz > 50000)
+			ASSERT_CRITICAL(false);
+
+		return;
+	} else {
+		*dchub_ref_freq_inKhz = dc_refclk_khz;
+
+		// HUBBUB global timer must be enabled.
+		ASSERT_CRITICAL(false);
+		return;
+	}
+}
+
+static const struct hubbub_funcs hubbub31_funcs = {
+	.update_dchub = hubbub2_update_dchub,
+	.init_dchub_sys_ctx = hubbub31_init_dchub_sys_ctx,
+	.init_vm_ctx = hubbub2_init_vm_ctx,
+	.dcc_support_swizzle = hubbub3_dcc_support_swizzle,
+	.dcc_support_pixel_format = hubbub2_dcc_support_pixel_format,
+	.get_dcc_compression_cap = hubbub31_get_dcc_compression_cap,
+	.wm_read_state = hubbub21_wm_read_state,
+	.get_dchub_ref_freq = hubbub31_get_dchub_ref_freq,
+	.program_watermarks = hubbub31_program_watermarks,
+	.allow_self_refresh_control = hubbub1_allow_self_refresh_control,
+	.is_allow_self_refresh_enabled = hubbub1_is_allow_self_refresh_enabled,
+	.program_det_size = dcn31_program_det_size,
+	.program_compbuf_size = dcn31_program_compbuf_size,
+	.init_crb = dcn31_init_crb
+};
+
+void hubbub31_construct(struct dcn20_hubbub *hubbub31,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask,
+	int det_size_kb,
+	int pixel_chunk_size_kb,
+	int config_return_buffer_size_kb)
+{
+
+	hubbub3_construct(hubbub31, ctx, hubbub_regs, hubbub_shift, hubbub_mask);
+	hubbub31->base.funcs = &hubbub31_funcs;
+	hubbub31->detile_buf_size = det_size_kb * 1024;
+	hubbub31->pixel_chunk_size = pixel_chunk_size_kb * 1024;
+	hubbub31->crb_size_segs = config_return_buffer_size_kb / DCN31_CRB_SEGMENT_SIZE_KB;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
new file mode 100644
index 000000000000..8ec98cbcbd47
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
@@ -0,0 +1,122 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
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
+#ifndef __DC_HUBBUB_DCN31_H__
+#define __DC_HUBBUB_DCN31_H__
+
+#include "dcn21/dcn21_hubbub.h"
+
+#define HUBBUB_REG_LIST_DCN31(id)\
+	HUBBUB_REG_LIST_DCN30(id),\
+	SR(DCHVM_CTRL0),\
+	SR(DCHVM_MEM_CTRL),\
+	SR(DCHVM_CLK_CTRL),\
+	SR(DCHVM_RIOMMU_CTRL0),\
+	SR(DCHVM_RIOMMU_STAT0),\
+	SR(DCHUBBUB_DET0_CTRL),\
+	SR(DCHUBBUB_DET1_CTRL),\
+	SR(DCHUBBUB_DET2_CTRL),\
+	SR(DCHUBBUB_DET3_CTRL),\
+	SR(DCHUBBUB_COMPBUF_CTRL),\
+	SR(COMPBUF_RESERVED_SPACE),\
+	SR(DCHUBBUB_DEBUG_CTRL_0),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D),\
+	SR(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D)
+
+#define HUBBUB_MASK_SH_LIST_DCN31(mask_sh)\
+	HUBBUB_MASK_SH_LIST_DCN_COMMON(mask_sh), \
+	HUBBUB_MASK_SH_LIST_STUTTER(mask_sh), \
+	HUBBUB_SF(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_LOCATION_BASE, FB_BASE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_LOCATION_TOP, FB_TOP, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_OFFSET, FB_OFFSET, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_BOT, AGP_BOT, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_TOP, AGP_TOP, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_BASE, AGP_BASE, mask_sh), \
+	HUBBUB_SF(DCHVM_CTRL0, HOSTVM_INIT_REQ, mask_sh),\
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_PWR_REQ_DIS, mask_sh),\
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_FORCE_REQ, mask_sh),\
+	HUBBUB_SF(DCHVM_MEM_CTRL, HVM_GPUVMRET_POWER_STATUS, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DISPCLK_R_GATE_DIS, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DISPCLK_G_GATE_DIS, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DCFCLK_R_GATE_DIS, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, HVM_DCFCLK_G_GATE_DIS, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, TR_REQ_REQCLKREQ_MODE, mask_sh),\
+	HUBBUB_SF(DCHVM_CLK_CTRL, TW_RSP_COMPCLKREQ_MODE, mask_sh),\
+	HUBBUB_SF(DCHVM_RIOMMU_CTRL0, HOSTVM_PREFETCH_REQ, mask_sh),\
+	HUBBUB_SF(DCHVM_RIOMMU_CTRL0, HOSTVM_POWERSTATUS, mask_sh),\
+	HUBBUB_SF(DCHVM_RIOMMU_STAT0, RIOMMU_ACTIVE, mask_sh),\
+	HUBBUB_SF(DCHVM_RIOMMU_STAT0, HOSTVM_PREFETCH_DONE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DEBUG_CTRL_0, DET_DEPTH, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET0_CTRL, DET0_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET1_CTRL, DET1_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET2_CTRL, DET2_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET3_CTRL, DET3_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(COMPBUF_RESERVED_SPACE, COMPBUF_RESERVED_SPACE_64B, mask_sh),\
+	HUBBUB_SF(COMPBUF_RESERVED_SPACE, COMPBUF_RESERVED_SPACE_ZS, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_Z8_D, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_Z8_D, mask_sh)
+
+
+void hubbub31_construct(struct dcn20_hubbub *hubbub3,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask,
+	int det_size_kb,
+	int pixel_chunk_size_kb,
+	int config_return_buffer_size_kb);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c
new file mode 100644
index 000000000000..53b792b997b7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.c
@@ -0,0 +1,103 @@
+/*
+ * Copyright 2012-20 Advanced Micro Devices, Inc.
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
+#include "dm_services.h"
+#include "dce_calcs.h"
+#include "reg_helper.h"
+#include "basics/conversion.h"
+#include "dcn31_hubp.h"
+
+#define REG(reg)\
+	hubp2->hubp_regs->reg
+
+#define CTX \
+	hubp2->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
+
+void hubp31_set_unbounded_requesting(struct hubp *hubp, bool enable)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_UPDATE(DCHUBP_CNTL, HUBP_UNBOUNDED_REQ_MODE, enable);
+	REG_UPDATE(CURSOR_CONTROL, CURSOR_REQ_MODE, enable);
+}
+
+void hubp31_soft_reset(struct hubp *hubp, bool reset)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_UPDATE(DCHUBP_CNTL, HUBP_SOFT_RESET, reset);
+}
+
+static struct hubp_funcs dcn31_hubp_funcs = {
+	.hubp_enable_tripleBuffer = hubp2_enable_triplebuffer,
+	.hubp_is_triplebuffer_enabled = hubp2_is_triplebuffer_enabled,
+	.hubp_program_surface_flip_and_addr = hubp3_program_surface_flip_and_addr,
+	.hubp_program_surface_config = hubp3_program_surface_config,
+	.hubp_is_flip_pending = hubp2_is_flip_pending,
+	.hubp_setup = hubp3_setup,
+	.hubp_setup_interdependent = hubp2_setup_interdependent,
+	.hubp_set_vm_system_aperture_settings = hubp3_set_vm_system_aperture_settings,
+	.set_blank = hubp2_set_blank,
+	.dcc_control = hubp3_dcc_control,
+	.mem_program_viewport = min_set_viewport,
+	.set_cursor_attributes	= hubp2_cursor_set_attributes,
+	.set_cursor_position	= hubp2_cursor_set_position,
+	.hubp_clk_cntl = hubp2_clk_cntl,
+	.hubp_vtg_sel = hubp2_vtg_sel,
+	.dmdata_set_attributes = hubp3_dmdata_set_attributes,
+	.dmdata_load = hubp2_dmdata_load,
+	.dmdata_status_done = hubp2_dmdata_status_done,
+	.hubp_read_state = hubp3_read_state,
+	.hubp_clear_underflow = hubp2_clear_underflow,
+	.hubp_set_flip_control_surface_gsl = hubp2_set_flip_control_surface_gsl,
+	.hubp_init = hubp3_init,
+	.set_unbounded_requesting = hubp31_set_unbounded_requesting,
+	.hubp_soft_reset = hubp31_soft_reset,
+	.hubp_in_blank = hubp1_in_blank,
+};
+
+bool hubp31_construct(
+	struct dcn20_hubp *hubp2,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn_hubp2_registers *hubp_regs,
+	const struct dcn_hubp2_shift *hubp_shift,
+	const struct dcn_hubp2_mask *hubp_mask)
+{
+	hubp2->base.funcs = &dcn31_hubp_funcs;
+	hubp2->base.ctx = ctx;
+	hubp2->hubp_regs = hubp_regs;
+	hubp2->hubp_shift = hubp_shift;
+	hubp2->hubp_mask = hubp_mask;
+	hubp2->base.inst = inst;
+	hubp2->base.opp_id = OPP_ID_INVALID;
+	hubp2->base.mpcc_id = 0xf;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h
new file mode 100644
index 000000000000..c31a7b8f81ee
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubp.h
@@ -0,0 +1,246 @@
+/*
+ * Copyright 2012-20 Advanced Micro Devices, Inc.
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
+#ifndef __DC_HUBP_DCN31_H__
+#define __DC_HUBP_DCN31_H__
+
+#include "dcn20/dcn20_hubp.h"
+#include "dcn21/dcn21_hubp.h"
+#include "dcn30/dcn30_hubp.h"
+
+#define HUBP_MASK_SH_LIST_DCN31(mask_sh)\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, REFCYC_PER_VM_DMDATA, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_FAULT_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_LATE_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_UNDERFLOW_STATUS_CLEAR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_DMDATA_VM_CNTL, DMDATA_VM_DONE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_BLANK_EN, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_TTU_DISABLE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_UNDERFLOW_STATUS, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_UNDERFLOW_CLEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_NO_OUTSTANDING_REQ, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_VTG_SEL, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_UNBOUNDED_REQ_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_IN_BLANK, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_SOFT_RESET, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, NUM_PIPES, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, PIPE_INTERLEAVE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, MAX_COMPRESSED_FRAGS, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_ADDR_CONFIG, NUM_PKRS, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, SW_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, META_LINEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_TILING_CONFIG, PIPE_ALIGNED, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH, PITCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH, META_PITCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH_C, PITCH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_PITCH_C, META_PITCH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, SURFACE_PIXEL_FORMAT, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_TYPE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_MODE_FOR_STEREOSYNC, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_IN_STEREOSYNC, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_FLIP_PENDING, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, SURFACE_UPDATE_LOCK, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_WIDTH, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START, PRI_VIEWPORT_X_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START, PRI_VIEWPORT_Y_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION, SEC_VIEWPORT_WIDTH, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION, SEC_VIEWPORT_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START, SEC_VIEWPORT_X_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START, SEC_VIEWPORT_Y_START, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_C, PRI_VIEWPORT_WIDTH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION_C, PRI_VIEWPORT_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START_C, PRI_VIEWPORT_X_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_PRI_VIEWPORT_START_C, PRI_VIEWPORT_Y_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION_C, SEC_VIEWPORT_WIDTH_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_DIMENSION_C, SEC_VIEWPORT_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START_C, SEC_VIEWPORT_X_START_C, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SEC_VIEWPORT_START_C, SEC_VIEWPORT_Y_START_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH, PRIMARY_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS, PRIMARY_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH, SECONDARY_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS, SECONDARY_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH, PRIMARY_META_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS, PRIMARY_META_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH, SECONDARY_META_SURFACE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS, SECONDARY_META_SURFACE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_HIGH_C, PRIMARY_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_SURFACE_ADDRESS_C, PRIMARY_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_HIGH_C, SECONDARY_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_SURFACE_ADDRESS_C, SECONDARY_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_HIGH_C, PRIMARY_META_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_PRIMARY_META_SURFACE_ADDRESS_C, PRIMARY_META_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_HIGH_C, SECONDARY_META_SURFACE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SECONDARY_META_SURFACE_ADDRESS_C, SECONDARY_META_SURFACE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE, SURFACE_INUSE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_HIGH, SURFACE_INUSE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_C, SURFACE_INUSE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_INUSE_HIGH_C, SURFACE_INUSE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE, SURFACE_EARLIEST_INUSE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_HIGH, SURFACE_EARLIEST_INUSE_ADDRESS_HIGH, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_C, SURFACE_EARLIEST_INUSE_ADDRESS_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_EARLIEST_INUSE_HIGH_C, SURFACE_EARLIEST_INUSE_ADDRESS_HIGH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_META_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_META_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_IND_BLK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, PRIMARY_SURFACE_DCC_IND_BLK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_META_SURFACE_TMZ, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_META_SURFACE_TMZ_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_IND_BLK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_CONTROL, SECONDARY_SURFACE_DCC_IND_BLK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_SURFACE_FLIP_INTERRUPT, SURFACE_FLIP_INT_MASK, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, DET_BUF_PLANE1_BASE_ADDRESS, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_CB_B, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_CR_R, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_Y_G, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, CROSSBAR_SRC_ALPHA, mask_sh),\
+	HUBP_SF(HUBPRET0_HUBPRET_CONTROL, PACK_3TO2_ELEMENT_DISABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, DRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, PRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, MRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_EXPANSION_MODE, CRQ_EXPANSION_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, MIN_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, META_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, MIN_META_CHUNK_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, DPTE_GROUP_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, SWATH_HEIGHT, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, PTE_ROW_HEIGHT_LINEAR, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, MIN_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, META_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, MIN_META_CHUNK_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, DPTE_GROUP_SIZE_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, SWATH_HEIGHT_C, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG_C, PTE_ROW_HEIGHT_LINEAR_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_0, REFCYC_H_BLANK_END, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_0, DLG_V_BLANK_END, mask_sh),\
+	HUBP_SF(HUBPREQ0_BLANK_OFFSET_1, MIN_DST_Y_NEXT_START, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_DIMENSIONS, REFCYC_PER_HTOTAL, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_AFTER_SCALER, REFCYC_X_AFTER_SCALER, mask_sh),\
+	HUBP_SF(HUBPREQ0_DST_AFTER_SCALER, DST_Y_AFTER_SCALER, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_0, DST_Y_PER_VM_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_0, DST_Y_PER_ROW_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_REF_FREQ_TO_PIX_FREQ, REF_FREQ_TO_PIX_FREQ, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_1, REFCYC_PER_PTE_GROUP_VBLANK_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_3, REFCYC_PER_META_CHUNK_VBLANK_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_4, DST_Y_PER_META_ROW_NOM_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_5, REFCYC_PER_META_CHUNK_NOM_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY_PRE, REFCYC_PER_LINE_DELIVERY_PRE_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY_PRE, REFCYC_PER_LINE_DELIVERY_PRE_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY, REFCYC_PER_LINE_DELIVERY_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_PER_LINE_DELIVERY, REFCYC_PER_LINE_DELIVERY_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_2, REFCYC_PER_PTE_GROUP_VBLANK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_4, REFCYC_PER_META_CHUNK_VBLANK_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_6, DST_Y_PER_META_ROW_NOM_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_NOM_PARAMETERS_7, REFCYC_PER_META_CHUNK_NOM_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_TTU_QOS_WM, QoS_LEVEL_LOW_WM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_TTU_QOS_WM, QoS_LEVEL_HIGH_WM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, MIN_TTU_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, QoS_LEVEL_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_GLOBAL_TTU_CNTL, ROW_TTU_MODE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, REFCYC_PER_REQ_DELIVERY, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, QoS_LEVEL_FIXED, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL0, QoS_RAMP_DISABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_SURF0_TTU_CNTL1, REFCYC_PER_REQ_DELIVERY_PRE, mask_sh),\
+	HUBP_SF(HUBP0_HUBP_CLK_CNTL, HUBP_CLOCK_ENABLE, mask_sh),\
+	HUBP_MASK_SH_LIST_DCN_VM(mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ROTATION_ANGLE, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, H_MIRROR_EN, mask_sh),\
+	HUBP_SF(HUBP0_DCSURF_SURFACE_CONFIG, ALPHA_PLANE_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, DST_Y_PREFETCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS, VRATIO_PREFETCH, mask_sh),\
+	HUBP_SF(HUBPREQ0_PREFETCH_SETTINGS_C, VRATIO_PREFETCH_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_LOW_ADDR, MC_VM_SYSTEM_APERTURE_LOW_ADDR, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCN_VM_SYSTEM_APERTURE_HIGH_ADDR, MC_VM_SYSTEM_APERTURE_HIGH_ADDR, mask_sh),\
+	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_DST_Y_OFFSET, mask_sh), \
+	HUBP_SF(HUBPREQ0_CURSOR_SETTINGS, CURSOR0_CHUNK_HDL_ADJUST, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS_HIGH, CURSOR_SURFACE_ADDRESS_HIGH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SURFACE_ADDRESS, CURSOR_SURFACE_ADDRESS, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_WIDTH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_SIZE, CURSOR_HEIGHT, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_REQ_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_2X_MAGNIFY, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_PITCH, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_LINES_PER_CHUNK, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_CONTROL, CURSOR_ENABLE, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_X_POSITION, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_POSITION, CURSOR_Y_POSITION, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_X, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_HOT_SPOT, CURSOR_HOT_SPOT_Y, mask_sh), \
+	HUBP_SF(CURSOR0_0_CURSOR_DST_OFFSET, CURSOR_DST_X_OFFSET, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_ADDRESS_HIGH, DMDATA_ADDRESS_HIGH, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_UPDATED, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_REPEAT, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_CNTL, DMDATA_SIZE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_UPDATED, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_REPEAT, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_SW_CNTL, DMDATA_SW_SIZE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_MODE, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_QOS_LEVEL, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_QOS_CNTL, DMDATA_DL_DELTA, mask_sh), \
+	HUBP_SF(CURSOR0_0_DMDATA_STATUS, DMDATA_DONE, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_VM_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_0, DST_Y_PER_ROW_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_1, REFCYC_PER_PTE_GROUP_FLIP_L, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_2, REFCYC_PER_META_CHUNK_FLIP_L, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_CNTL, HUBP_DISABLE_STOP_DATA_DURING_VM, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL, HUBPREQ_MASTER_UPDATE_LOCK_STATUS, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_GSL_ENABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_DCSURF_FLIP_CONTROL2, SURFACE_TRIPLE_BUFFER_ENABLE, mask_sh),\
+	HUBP_SF(HUBPREQ0_VMID_SETTINGS_0, VMID, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_3, REFCYC_PER_VM_GROUP_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_4, REFCYC_PER_VM_REQ_FLIP, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_5, REFCYC_PER_PTE_GROUP_FLIP_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_FLIP_PARAMETERS_6, REFCYC_PER_META_CHUNK_FLIP_C, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_5, REFCYC_PER_VM_GROUP_VBLANK, mask_sh),\
+	HUBP_SF(HUBPREQ0_VBLANK_PARAMETERS_6, REFCYC_PER_VM_REQ_VBLANK, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_REQ_SIZE_CONFIG, VM_GROUP_SIZE, mask_sh)
+
+
+bool hubp31_construct(
+		struct dcn20_hubp *hubp2,
+		struct dc_context *ctx,
+		uint32_t inst,
+		const struct dcn_hubp2_registers *hubp_regs,
+		const struct dcn_hubp2_shift *hubp_shift,
+		const struct dcn_hubp2_mask *hubp_mask);
+
+void hubp31_soft_reset(struct hubp *hubp, bool reset);
+
+void hubp31_set_unbounded_requesting(struct hubp *hubp, bool enable);
+
+#endif /* __DC_HUBP_DCN31_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/inc/core_types.h b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
index 81b92f20d5b6..0d1c3260b68e 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/core_types.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/core_types.h
@@ -338,6 +338,9 @@ union pipe_update_flags {
 		uint32_t scaler : 1;
 		uint32_t viewport : 1;
 		uint32_t plane_changed : 1;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+		uint32_t det_size : 1;
+#endif
 	} bits;
 	uint32_t raw;
 };
@@ -365,6 +368,10 @@ struct pipe_ctx {
 	struct _vcs_dpi_display_ttu_regs_st ttu_regs;
 	struct _vcs_dpi_display_rq_regs_st rq_regs;
 	struct _vcs_dpi_display_pipe_dest_params_st pipe_dlg_param;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	int det_buffer_size_kb;
+	bool unbounded_req;
+#endif
 #endif
 	union pipe_update_flags update_flags;
 	struct dwbc *dwbc;
@@ -415,6 +422,9 @@ struct dcn_bw_output {
 	struct dc_clocks clk;
 	struct dcn_watermark_set watermarks;
 	struct dcn_bw_writeback bw_writeback;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	int compbuf_size_kb;
+#endif
 };
 
 union bw_output {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
index d9fd28b34f2a..d2611b865695 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h
@@ -152,6 +152,11 @@ struct hubbub_funcs {
 	void (*force_pstate_change_control)(struct hubbub *hubbub, bool force, bool allow);
 
 	void (*init_watermarks)(struct hubbub *hubbub);
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	void (*program_det_size)(struct hubbub *hubbub, int hubp_inst, unsigned det_buffer_size_in_kbyte);
+	void (*program_compbuf_size)(struct hubbub *hubbub, unsigned compbuf_size_kb, bool safe_to_increase);
+	void (*init_crb)(struct hubbub *hubbub);
+#endif
 };
 
 struct hubbub {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
index 2e2310f1901a..dd562dcd03b2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h
@@ -33,6 +33,10 @@
 struct dchub_init_data;
 struct cstate_pstate_watermarks_st {
 	uint32_t cstate_exit_ns;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_1
+	uint32_t cstate_exit_z8_ns;
+	uint32_t cstate_enter_plus_exit_z8_ns;
+#endif
 	uint32_t cstate_enter_plus_exit_ns;
 	uint32_t pstate_change_ns;
 };
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
