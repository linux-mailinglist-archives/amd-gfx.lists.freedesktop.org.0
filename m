Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70D719EE0A
	for <lists+amd-gfx@lfdr.de>; Sun,  5 Apr 2020 22:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4796E2B1;
	Sun,  5 Apr 2020 20:42:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0E89FED
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 Apr 2020 20:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ai9Wz9MnFVmceryNAJwD4AkOagiElmmOE+UVz142L6q/1Y2iOD7migFNUfZnqfA+DurGXIfXay1Vk/6lgp0gBcgpnMLasBF06/yodKM5NMKZY1lsE7+N4SMRMZ5/O8ghKQbm6XetREFxjhqWG/FpipiF1800LKA+zrYmi41E59CBozvuD6d27CEOk6uJwPwrLhljXa2v93XYfujv4G0DVXP/+yaq3UwkN5scYxzwi+01R34tAcf41QylTAl96uEFfm+3EmLef8MNe/TDhyeb69DLcUtDA3UkHTowyhh+ugSM+lS3vKhQrTerS8Ke0Vc0Z8houZIeUMjH2q5SPynEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQGEBZRTabWgULya4muKbaG1WW02ZkPPMTkqF7xIYiE=;
 b=dxaKr1SnetmWh0WSaXGIM+H3guRDxFPx6z4/7bRlZfXgh6N5c492RhPGePKqAIKHqcV6Qb+y9Ev+I5z9b4bDyq69bNCqdtEIBf6J9xHzjNpr+R5Im99VaX6E8HFJZ5U7AIQrhA5xGBPuJBVAIrw94PkLD5EgrMFCt1c/ruRI97oWZELAFRfcbNG/0u8Z6AOlkYAE6AgvAYajKvuaJ5CPhrDuROsMbyayD5pDQLJGolFd3n9rz+gpa3wQudOCon7KUP1d1xxnJ6437QJ8gWgjAGRBTkxPmBS3nQT4fljw/tf3sxlJ3R1J/YWtLXSVrmS0Z5qDuWk2RCr1U+abeaSx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQGEBZRTabWgULya4muKbaG1WW02ZkPPMTkqF7xIYiE=;
 b=Y8myNa9vbMt85EofL0HH5t7jq7jMOUqLnJ2cAk66GYqQL8NbdkVudpF/qLpadjDDoxp/yatOopUzMAtRWqHPJJVFWk9mrkerdPnBL31j4weJR6QwHroa7+kh1eugCIjwLtdeI4TexF0iHQAbHWPlD4AIHuJoBMex+/i5HJRgVgo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2555.namprd12.prod.outlook.com (2603:10b6:907:b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 20:41:58 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::91a7:e6f7:b17a:bfa5%6]) with mapi id 15.20.2878.018; Sun, 5 Apr 2020
 20:41:57 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 19/36] drm/amd/display: Properly map audio to engine on NV14
Date: Sun,  5 Apr 2020 16:40:58 -0400
Message-Id: <20200405204115.683559-20-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200405204115.683559-1-Rodrigo.Siqueira@amd.com>
References: <20200405204115.683559-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::26) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::4) by
 YTXPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Sun, 5 Apr 2020 20:41:57 +0000
X-Mailer: git-send-email 2.26.0
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e6be37fe-42b1-434f-c3d1-08d7d9a1c8a2
X-MS-TrafficTypeDiagnostic: MW2PR12MB2555:|MW2PR12MB2555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25556C3650FDB972D4AE772498C50@MW2PR12MB2555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 03648EFF89
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2524.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(1076003)(8676002)(6916009)(8936002)(6486002)(81156014)(81166006)(16526019)(52116002)(36756003)(2906002)(6512007)(186003)(86362001)(316002)(54906003)(6506007)(66556008)(66476007)(2616005)(66946007)(478600001)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6or4dh2vqoy/8D+UZw2HHTwbCuTzPc+eJgo39HOnEllKfTC0GMwcwgRUijBaw1tTWKMpDp1a2SaG47o4r1ZF6qsclNVBI7FjzI2Ws099ZINh2imkHqXuNCcUrQGVEfSZuY99Atds39iyhyXeYYuEuwrU8amhsk7CFMhFurr2ITqO0RCNu+H39cWQqZD0GoNqhjq0J2pnUUDj2eY8V/dJGs27QuTbepsKznNTnsqUDjDPVEB96z+SoANoFohSGBsduGxcb8dZApqCJV9z1/OyjS1ppOyn0g8+iD5rgomORZLggdwHENCteaLmScVQqkrVGc5/GOv670FWkCWt5WBRfc6+SX0jPrX6gfckChj233mdhAqlpJzBtMlBupLulOBvmOixEigWizx3x9TnzYDhuEsc8dzdfdb//D6Nj0m+e81Z35DGoyu1tujjnA2Jlzlk
X-MS-Exchange-AntiSpam-MessageData: 4S4gRCRUXWuv/I9cHbz+teyIm0DpYxpVopFjAIzj5Vq4MGZoG+Tb5B1O+x97nWYS/W1Vu6+0OYgqzP8SEITIdxvzBAzPRs/s312DS5ydHbPNQeVLgUta5+cDMFnbfhj1opqrvOs9NbemPVCxhiKI6ZtfcKT0JViDVdglzmIe2Tw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6be37fe-42b1-434f-c3d1-08d7d9a1c8a2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2020 20:41:57.7805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuyZOCQeWoWfeQGSzn6s9JHF8Boxef9G7c74vSeNTObFojRVVIRCnY4Si65SbQZWw/en88HO3ZeBBYNPsR878A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2555
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
Cc: Sunpeng.Li@amd.com, Bhawanpreet.Lakha@amd.com,
 Josip Pavic <Josip.Pavic@amd.com>, Harry.Wentland@amd.com,
 Martin Leung <martin.leung@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Martin Leung <martin.leung@amd.com>

[why]
nv14 has no DIG_D, so when audio mapped to DIG_D is assigned, it
doesn't work (audio missing on a port)

[how]
offset audio inst by 1 when greater than DIG_D, like is done in
stream_encoder_create

Signed-off-by: Martin Leung <martin.leung@amd.com>
Reviewed-by: Josip Pavic <Josip.Pavic@amd.com>
Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index 5cdbba0cd873..44f056fae3ea 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -1324,6 +1324,13 @@ static void read_dce_straps(
 static struct audio *dcn20_create_audio(
 		struct dc_context *ctx, unsigned int inst)
 {
+	/* Navi 14 has no DIGD */
+	if (ASICREV_IS_NAVI14_M(ctx->asic_id.hw_internal_rev)) {
+		if (inst >= ENGINE_ID_DIGD) {
+			inst++;
+		}
+	}
+
 	return dce_audio_create(ctx, inst,
 			&audio_regs[inst], &audio_shift, &audio_mask);
 }
-- 
2.26.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
