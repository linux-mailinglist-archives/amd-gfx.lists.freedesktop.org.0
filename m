Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA69787E6F
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Aug 2023 05:19:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C4210E4A7;
	Fri, 25 Aug 2023 03:19:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8FE10E4A7
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Aug 2023 03:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbL9+Yk3OlFjL2G058yYQOm/Na8afP/tfNz1hs0H0cgUgJdiUfICzBEWEqTqWvHRecJPxIiV/yDtPa0ap0+fvQEiHvnYB6Z2WYXVZs1AvwrdxnHfBGPCmPR6FCHisYstNQGsBMjAEaHbMCOZX3yrAnr06Lt0lZKgtDJEoiwluvCeRAUIbLpNvTe5M3fh3cqqbecg3o0XsFcH06aRwzMJGNc7OPUH/cWw2AZy6VY9LN4euctCyg2cuXR5rNP/jdoP9SWFwMzi6F7zxf66d2e6l23uY9gwsG46mACRrsq8BHY+TJss1XzvUgc2AVprELa6iw4Tz6FVwIHfpoRJxk5jxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szSP26RDGd01lm6vOecti2RtrttCooDAYY7tU43Wtw4=;
 b=eEYXaYCuLV+S8AcC5EfR9pYaSr5GUPz8EBVl2uVpqVsmMGnprAMz9Jbw6xtekrzPyLA0eIGQWQGs/OEqdhsQFggJUM8cHqYOyXwtDzNhXiAj/hnH1YNl5Z+A03CcDiocP9U92NoPlqJDklwlOi1WY3wK3XucZJx2JKMlFq4nlZilQmyRwNR8ZcU9MvoSp3WPSKrnQ70gmw20A6RRof7R07tpgF7TSswqehQJnIwLWgWjiwqubpsA6D1Lhb4NXcvPsD7bx1YKnz7r3q8DKsAc30+aKUOeGNOOn/OkYPjWq5guhJu4D0dMGGGV0a3dXsUR5v524Rh1/v+z3nkRiLEWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szSP26RDGd01lm6vOecti2RtrttCooDAYY7tU43Wtw4=;
 b=HgIRcH485GlXXV1oH13nhbrfZ1vNzSg92NXJxhjUru0rJ1aHrsFqayIjUzqsnfD/pVGxO1OE2UoIiPQNQvy2OiuVu0v+XkI0pl8NhGUxKP/Rb26pvcqa44kQbKaXRixA53l8RdZdN6wsPiUC+OjhP7yNe3KdiL2FsGZBnBhhFKo=
Received: from SN4PR0501CA0102.namprd05.prod.outlook.com
 (2603:10b6:803:42::19) by PH7PR12MB5901.namprd12.prod.outlook.com
 (2603:10b6:510:1d5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 03:19:31 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:803:42:cafe::ed) by SN4PR0501CA0102.outlook.office365.com
 (2603:10b6:803:42::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6723.17 via Frontend
 Transport; Fri, 25 Aug 2023 03:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 03:19:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 22:19:30 -0500
Received: from kenneth-mlse-vm.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Thu, 24 Aug 2023 22:19:29 -0500
From: Kenneth Feng <kenneth.feng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/pm: workaround for the wrong ac power detection on
 smu 13.0.0
Date: Fri, 25 Aug 2023 11:19:26 +0800
Message-ID: <20230825031926.1932471-1-kenneth.feng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f21770a-9d73-4232-1d1b-08dba51a18ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DmdZPkyQkemGRl4Ccaik688nubnJcZKo5lu21KFbBearNJGPCumung+kpwCgPGuCm7SsPG/IEbVG4gGI9J45pOqmyrf6tMji4mKIqvAAtmQY9c+AC1MGAdM3nTwTVAWiOfgVAq3WdapTZbp8Vm6/djsKohjFpQhrKyFiuvozb9cp3XmHLoiUnU/GYJH3jIq/FlOUTjkdaoFN6AP1kEsa7FSR0/RkdHeL80JFPq0qMBW8kx/yqwrJAaXAhneVjEPwX7Kd+CdcbTYwBcevRJomKvolrNEtplBelxnSE1AY0RMfhqPnNqlCf+b7Ckm2jYcxX2N5OPheDsSgpQLuKM59ucrf4/4pN6OTjtdJDhzLbeXpBgolV5DmW17aSjU/vkG5s4HGNZGahg1HkJqLCWAJxUox35Uleab1WYiybB0yqqk1sbnZTYOWp7L25GVEQ8kaZSaQfgWXHn+UOMnh3BkS9FombvdDhu+UDUVGn+H0jto+rwpPkCpju9LfUu9lYPvRA11zGVfRd3beiE0K4bMmHd2fD+TBWwtPOZDto7HIY1DFYcNbXShvDO59BFYYjsIsyFjUndqfAPBzwmJ6iwfg0x+KFPWCBrmSyEj7H/f7xI0RqhQEzsN0F6eTE9Fp7uBOMzJ4k6DHbChPgv6MIaEuTCitAf1plrpGgFMksTe32roA9Hz/SGzcgNZ/n5o15tPd/GTw2f8K6MRKryTtvQIo+JT2ORokGkSIvKNtCC3HLzw3M44odzgo9/x0kIqDElGtIYOhk5MzVabLfWNXGUHWNA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(1076003)(40460700003)(2616005)(5660300002)(4326008)(8676002)(8936002)(336012)(47076005)(426003)(36756003)(66574015)(83380400001)(7696005)(44832011)(36860700001)(26005)(40480700001)(82740400003)(356005)(6666004)(81166007)(70586007)(70206006)(54906003)(6916009)(316002)(478600001)(41300700001)(2906002)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 03:19:30.8488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f21770a-9d73-4232-1d1b-08dba51a18ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
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
Cc: evan.quan@amd.com, Kenneth Feng <kenneth.feng@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

workaround for the wrong ac power detection on smu 13.0.0

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c       | 3 +--
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 0232adb95df3..fd1798fd716e 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -1021,8 +1021,7 @@ static int smu_v13_0_process_pending_interrupt(struct smu_context *smu)
 {
 	int ret = 0;
 
-	if (smu->dc_controlled_by_gpio &&
-	    smu_cmn_feature_is_enabled(smu, SMU_FEATURE_ACDC_BIT))
+	if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_ACDC_BIT))
 		ret = smu_v13_0_allow_ih_interrupt(smu);
 
 	return ret;
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 3903a47669e4..128468355375 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2664,7 +2664,6 @@ static const struct pptable_funcs smu_v13_0_0_ppt_funcs = {
 	.enable_mgpu_fan_boost = smu_v13_0_0_enable_mgpu_fan_boost,
 	.get_power_limit = smu_v13_0_0_get_power_limit,
 	.set_power_limit = smu_v13_0_set_power_limit,
-	.set_power_source = smu_v13_0_set_power_source,
 	.get_power_profile_mode = smu_v13_0_0_get_power_profile_mode,
 	.set_power_profile_mode = smu_v13_0_0_set_power_profile_mode,
 	.run_btc = smu_v13_0_run_btc,
-- 
2.34.1

