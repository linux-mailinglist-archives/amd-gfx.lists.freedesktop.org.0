Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F57952233A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 May 2022 20:01:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC26010E751;
	Tue, 10 May 2022 18:01:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CAFC10E751
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 May 2022 18:01:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA8kYLM4ahY/A6e6MK1+laAC06NAxADBgnDVPGiPLVRcpVIwnYxyPrxmKH88sO6EHqxslYc5aWUI2Dsbu8Rwo2qd91JvoNCC5zaCfV5mAarv4tMo50WEWCT5MmPq762YWuQZH7HT7RLqeuKMPb6cNfHWwKwXLyVV+xHINq/GvdWlEZ7h825QJsyIBlLZFyJcPyMvTZBv1yc6e7BsKkyYfqTGjZea3AZRpI8xG9ok6uE7lckB0qb3ad30hHypPojhqIEj83zye6NiTKvtQi/7B6twQG6l4TfElxhakC2503TyLaBP163G3a5T8l/tx9pC/D3ZFOmcC/TAebsqwU5UoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zfb7B1tnJWfNDgY+lQqP8BGPyApfMuMpEUT7JRPG5tg=;
 b=CWeWvETRuouBBgkbRvhrtN6ANCLcrgQKhtFpfjJE9zdBYtBvaScXzh5/fvqfyF5DVZ4u4cGBJh7lgSJDNDHz06ra/vUUM32924JKH/iRB3PIZSbWUTq1QIGIYFE8QFaNJajlOaV6EWL7ixYKN2ZGcLORtDxahntsflvhq4UH/Crjw8TOasXLTLEIYG+yMx7CBCWRTX6StLQjShLzBiYODet3MUnEAGfaxCY5bI4/2YRPF1qArc8NGZSIlW6gEwm7tQdsvyqlSryHh6JUxyTU5DtKz04yvHyXxR6r3ZZufP+PDhhMjgd0eRRVMRAdIkmIKXsRTaasvXSa/2draPEqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zfb7B1tnJWfNDgY+lQqP8BGPyApfMuMpEUT7JRPG5tg=;
 b=uPXqmUbsrS5EQeG5cuh6/s/SNq26iLS0lo+sLyEg60eR2sudw+p1gw0QEBzdd7XOAQh4+fLMQmubY2UsG1RDt72o5mycnms62MyZpO1UmL/V3BhB4IlKr/japzo/aw9i8mAkOjByIzyp+LDYFqTjBRRxKFfp8NEjYnU3JAZSbIk=
Received: from BN9P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::10)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 18:01:13 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::dd) by BN9P222CA0005.outlook.office365.com
 (2603:10b6:408:10c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Tue, 10 May 2022 18:01:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 18:01:13 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 13:01:11 -0500
From: Yang Wang <KevinYang.Wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/pm: add smu pp_feature_mask callback for smu_v13_0_7
Date: Wed, 11 May 2022 02:00:09 +0800
Message-ID: <20220510180009.461734-1-KevinYang.Wang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be676a82-fa6d-4616-8e9f-08da32af1267
X-MS-TrafficTypeDiagnostic: PH7PR12MB5926:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5926E228D29B71DE3C06AC0682C99@PH7PR12MB5926.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsJY0Cj0FqRTtMj7g523+uorKsldWnza7dVKWp+TyVwFKPOZB8AlxYq32UkQYNu9nS6gc2Fyt7JsV92+xDp6GYkPOlyuoTj10z7NMJe3/QaVhRyEXGOccb7dOQ+ZFjZoCunPr7BYPdnA3fzdCL0LUJ1xd0mINYchzhbO7dERdB4uIRyH0RIUiYYoV8WJ5lO5OWUaLORii5iL6BHfhKygvL/UsXHBZHnekTKNlFbFeTFcjFvap+r3AkSWIyevgDiXxqzIL3jUJrhoZ5ak25A62F24Gv0mySfC6qN2C7C91ydrlR/aZFYWcEVExuGhdI6X9a9RVdR39mq8L825M1Nxseme55NCb/vEZfJWJ/H/t1bYLE0pV2rJRWTapYonxpkOTJKeGqY6Y7mdZrQtPCI6v22qC9rBEeT/rCkLl9Cxt7yMToS6hqOHwZh/DFJtjvJlImoCHSWw4vtJh3IgVrHcy/+6/UK7uSXUzZd853z7qfjrab7GIUGq+mkZo3FRrLlSt1LKFyS0bDlzdsK7BsIyVhHnfE9PhyuaNJTohnsEtCsG7UV/m3XhSPyfnxLwfsxBGLAp3G0W0j/VZKS6E/wOW0MHe0Us+rIsXzVcgqYRtxGoxczPHjnPNIXUyvOL/1Ym2Jlqj0/Mu7+9yEKHzJJ+/q7CIhulk947tG5BhKPwzZwbCtFuO3m7QrgWHhdnz3haZy01rdTd7Gbb77siK/KXAg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(8676002)(70206006)(4326008)(70586007)(7696005)(356005)(40460700003)(36860700001)(6916009)(26005)(81166007)(508600001)(316002)(82310400005)(1076003)(4744005)(36756003)(2616005)(5660300002)(8936002)(426003)(2906002)(47076005)(186003)(16526019)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 18:01:13.5163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be676a82-fa6d-4616-8e9f-08da32af1267
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
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
Cc: Yang Wang <KevinYang.Wang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- set_pp_feature_mask
- get_pp_feature_mask

the pp_feature device node isn't working when
above callback functions aren't provided.

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
index 583a96784558..00964b3728fe 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
@@ -1500,6 +1500,8 @@ static const struct pptable_funcs smu_v13_0_7_ppt_funcs = {
 	.get_power_profile_mode = smu_v13_0_7_get_power_profile_mode,
 	.set_power_profile_mode = smu_v13_0_7_set_power_profile_mode,
 	.set_tool_table_location = smu_v13_0_set_tool_table_location,
+	.get_pp_feature_mask = smu_cmn_get_pp_feature_mask,
+	.set_pp_feature_mask = smu_cmn_set_pp_feature_mask,
 };
 
 void smu_v13_0_7_set_ppt_funcs(struct smu_context *smu)
-- 
2.25.1

