Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8CD24F397
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Aug 2020 10:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAD16E1CE;
	Mon, 24 Aug 2020 08:04:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE216E1BE
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Aug 2020 08:04:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dR2Y/pwBWyvG/FhVNtcWAHLHPXkFF28NtKDaC8W9TEbbt2FCuG8mLrT++QWbn3/WoVPUJDMiV/eTYxPjm2WAv1R0GPCCkLD5/PUFYqya/FqjcRQ2IN73O6d80rY6obg3PynkpP68T+XghLfnQCsk6hVCucsb85w8YAO2duvbWORRPhHZMHtwUuZVHxLav3zTYcrSCSjMUK8dFrd2Dra880hxwUac0W5FvIDMGBRrjC+FwyrutjxmA+akF45MLPvlK3kKEUtPGPGHis3ehzuvlSw8QhppFpCK7frQ8j1w24zy8/EauSPJ5CG6hU0UtYi7vIXxyl6mtRGy+WszXbXPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABfOVufcUQHFVffa4bHfRAiXC8/oMRryY0NqVLHjmaE=;
 b=ZamU663N1PW9rVFbOtLEKRgSI307tkMqYKtFIcJgRBGjs6np00CIRfI3exNHWqqr2mD481B+eXEoE5Suq8zdNuDWpK2fwGGfjQar2grbmAXbX7QV1WOGPfuYKKrHZMogjsa0M82RhOoadYK8jfsdaaPU5RXVeq/3itaQDwdHC+XZNgKJ77srVGDaKFB5HJMyzDcpTU4a1gtmv0lFntv5xwdhY6KblMV5cC0/RDipLG1DKJdPyXF8iCrEeJFkXgzJBpZOdbT8L9jPdVawzSrO5Qgp+r3UKrvanAgWwY6d/wxtB8O/Upy9HPFpNbjz9lGHQMF2x5WXt0mZfIPRDZenhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABfOVufcUQHFVffa4bHfRAiXC8/oMRryY0NqVLHjmaE=;
 b=1Su7HF+ekZ5HyRagg4pcU4RXTGxKHJPx1UYmjbOZ1AODU48I1+rnToqw0pGLo7SiR24KMNIqnvTxHw+vnA0aIb4hEtxJBFnwfo9B30XSl7QO3H8iImLt60RNDm4Zf73K8uhO3EfMn+sHwBCN6qGq3uAN8cZWcrMQKxRIN+KipZ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB2891.namprd12.prod.outlook.com (2603:10b6:5:188::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Mon, 24 Aug 2020 08:04:21 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::bcb1:de80:f60c:8118%5]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 08:04:21 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amd/pm: minor cleanups
Date: Mon, 24 Aug 2020 16:03:50 +0800
Message-Id: <20200824080350.32504-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200824080350.32504-1-evan.quan@amd.com>
References: <20200824080350.32504-1-evan.quan@amd.com>
X-ClientProxiedBy: HK0PR03CA0103.apcprd03.prod.outlook.com
 (2603:1096:203:b0::19) To DM6PR12MB2619.namprd12.prod.outlook.com
 (2603:10b6:5:45::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 HK0PR03CA0103.apcprd03.prod.outlook.com (2603:1096:203:b0::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 08:04:19 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b3ded605-777d-4bb3-30fa-08d848044e99
X-MS-TrafficTypeDiagnostic: DM6PR12MB2891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB289108741AF1C111D7DA1867E4560@DM6PR12MB2891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZyGsA1eZAosPVo0HAPIVClIad4ABn+8ojY/hsq6I54sKR+OZuIqEQVhgAv/ICTNueKQA6J7YZRoYAOHWFBuWrwGBTZ1gFT7zCR3u5wmhXoj6S+kQXfc+haAJeFvES8bq89XU4RQ9Rr2qaBMlFCormLUPoIHEZo1Rxi2Nu6O718KDnuItgwwkvpUJwEeFStHh+T3rWIXYZBcNDezMTnBUZoMaKxyHWSW6WH3aeZVofdIs3LROxLxCdnZNWDKic99nVTQalq5VSbAnmk9z85xSNpg5vtCE+sQjVa9+scyLQezBXzNaDVrlEhrpl20GQIKz0pkyZeVMI+eQEwWlUTzTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(52116002)(1076003)(5660300002)(44832011)(26005)(8936002)(186003)(36756003)(8676002)(66556008)(66476007)(956004)(86362001)(6486002)(478600001)(2906002)(83380400001)(4326008)(2616005)(316002)(16576012)(66946007)(6916009)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gZr2EipX+GkOlV3VsSXcUGPatyKF4O0sj9PKuzVLFYAwGy2rp2fT32fUG96ofgRpvbBbUwgFWMX1NuQ7GSQL+F+UpesXlv8PkgmtPIkXmRdaidEQo+VWHDc855jqlcsIbgb79TZKH1U/QFAqUSjRiGXUrU7oaBFBAV2vs1mSEw010sraeP9TXNIOqC6XwcJdZNLn33bV0ow+rbKHhs3EpSe0oZ3/keoeybOE7Vq2vPeLbBYEPITNltPUfuQuu7YmDTAqjFP/U6V2hDO74f60yrRkUEo2Q/efHpd8QOD+NL2DzZx0JSeohiC1Js5eNeCC1uJ0MvzWKQ9IM1P0JhauHrgcdAuGTXBzvD3SlOEjjoYJcieC0hYoyjvecCWB5DVfGrFTkhEuPIQ+WAIBcSOLGhsfYyqXbCj8XjOqyrtKnyv2VxFyjm576bEGWpWC8rkZQpX6zFy9QsNECoTY7tGeB7IAWK2QY5QHTS0K50ClCgJfGEhg0CbvizfKCoskCuVuN0wQtMlfndXcVJzmNgfWmoB1gI0K8cVePswYAFbFEn27CUo/PgtKLGHdhoo0hikEwvecVpu3yXD/GnD6jlvfiltPAsWlFDnnUiOskULYNCDvAGSKLfYjj7DUGX0YVeMyn6ha9NfqbYBCGCkvxjnoKA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ded605-777d-4bb3-30fa-08d848044e99
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 08:04:21.2114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qw/v1KkJlNOmQ7dE0B0Iq2TsiLbY4X4FxO3bWTbm8tpzJZMlHsEb1hX+H3K4v9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2891
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
Cc: alexander.deucher@amd.com, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Drop unneeded "ret".

Change-Id: If5eabb1e96153133a833d0e5b1dca9c0f0928891
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
index a83b3635df40..e4d333d1b9ca 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
@@ -1172,12 +1172,10 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_context *smu,
 int smu_v11_0_set_xgmi_pstate(struct smu_context *smu,
 				     uint32_t pstate)
 {
-	int ret = 0;
-	ret = smu_cmn_send_smc_msg_with_param(smu,
-					  SMU_MSG_SetXgmiMode,
-					  pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3,
+	return smu_cmn_send_smc_msg_with_param(smu,
+					       SMU_MSG_SetXgmiMode,
+					       pstate ? XGMI_MODE_PSTATE_D0 : XGMI_MODE_PSTATE_D3,
 					  NULL);
-	return ret;
 }
 
 static int smu_v11_0_set_irq_state(struct amdgpu_device *adev,
@@ -1408,11 +1406,7 @@ int smu_v11_0_get_max_sustainable_clocks_by_dc(struct smu_context *smu,
 
 int smu_v11_0_set_azalia_d3_pme(struct smu_context *smu)
 {
-	int ret = 0;
-
-	ret = smu_cmn_send_smc_msg(smu, SMU_MSG_BacoAudioD3PME, NULL);
-
-	return ret;
+	return smu_cmn_send_smc_msg(smu, SMU_MSG_BacoAudioD3PME, NULL);
 }
 
 static int smu_v11_0_baco_set_armd3_sequence(struct smu_context *smu, enum smu_v11_0_baco_seq baco_seq)
@@ -1511,13 +1505,7 @@ int smu_v11_0_baco_enter(struct smu_context *smu)
 
 int smu_v11_0_baco_exit(struct smu_context *smu)
 {
-	int ret = 0;
-
-	ret = smu_v11_0_baco_set_state(smu, SMU_BACO_STATE_EXIT);
-	if (ret)
-		return ret;
-
-	return ret;
+	return smu_v11_0_baco_set_state(smu, SMU_BACO_STATE_EXIT);
 }
 
 int smu_v11_0_mode1_reset(struct smu_context *smu)
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
