Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8EC6E27B8
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Apr 2023 17:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B15110EE09;
	Fri, 14 Apr 2023 15:55:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6610EDF7
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Apr 2023 15:55:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/IU6s0xQIfIUs/mj3vlX7catJJX5SfjpT9p9PkieQX0c/U97gJUJH2krBl4voKXy+stQXZO55DNgYD8F/1RN/TnJZQnRiIdBumSfAvevrbxba6aO7CCYTFKczC9JshJpUu6CZe5UNHwuhRGDunqSZu4GfxRkEEB2abSTmugaOnt8BVrrFHDQHQfXWUXRZjRXGHaL67pODMWwcthE6IxrulLoZEw9WqeBJLdggArfdsrBKM0/TbAFEzCsR+s36WEw2sQEPuQ2T84kgtFyyANsF3ywNk2zawlVQLITH5Zuh2lNlMtuMoet5BeQBEZ+D+b9JwQB5EeoVk/CSQIcGBkvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mpbcuwEruN6z/x+Ibw8Wl/q2d5cbNf4DYx4HBAFJfgc=;
 b=k0lGAod4nhcp+NFqhY9X/wLCBn3r4c+nzwPuuZ9k+I+gYGPdl3Kqqx22NMv4r2CTujnWi1xhVlj4FyerTdIz6Z3F0JXvB0rr5Bv+ss8ST/pYm+mIEA+L+bZfSucSmqmTXl/rrTkUzCSx0V8pXZK0aAUDcDyqOTBPmmlmvgnce4x+zm3OEN7wZEQ3HET2EZcwyjJ95b0BzLexHKd2Lv44uKQxScipUtpkT4BXwb4T14aQdEa1UZDqyXaV3Tot22k/ZpJpGeqTA5jM3Sx8ah3dQ3c23nzqoRfS+GClIHc2L3tWZO2qAdR6T8tLJ1Ct/WR3osbfqsiL+d66Nf6B0lD85A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpbcuwEruN6z/x+Ibw8Wl/q2d5cbNf4DYx4HBAFJfgc=;
 b=Z4rJuXTmZiDAo5q/4/EuTmPhouaSJPnK/Uy37N+zruOHGDYa1Yoat9q5ApmGT90VhLrnmpFKttJ5/RlytNe9v8nEKPZ79xIDoVJNnsZgG0rw/U/QndIyTI5z9+zZoIL0pPRblm0vEsu7TNlKFZibCInpdt1zgjCyLcQZJW+TsfU=
Received: from BN0PR10CA0004.namprd10.prod.outlook.com (2603:10b6:408:143::18)
 by IA0PR12MB9046.namprd12.prod.outlook.com (2603:10b6:208:405::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 15:55:23 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::c2) by BN0PR10CA0004.outlook.office365.com
 (2603:10b6:408:143::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 15:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.39 via Frontend Transport; Fri, 14 Apr 2023 15:55:23 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 10:55:21 -0500
From: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 64/66] drm/amd/display: Add FAMS related definitions and
 documenation for enum fields
Date: Fri, 14 Apr 2023 11:53:28 -0400
Message-ID: <20230414155330.5215-65-Qingqing.Zhuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230414155330.5215-1-Qingqing.Zhuo@amd.com>
References: <20230414155330.5215-1-Qingqing.Zhuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|IA0PR12MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c975e0-a9e9-47ca-95c0-08db3d00a854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G8gX610l/C9nAB/OC/pOWO4LO03u0BRbCyLIJFQwtNOidNF/yyfYNgBUDtWzk9Q5U7qBx5eFNAWqg7OzeEmIk46teOJF5EVeGASPR3fQiw5wyt8nESfqBRrZcXxNCFPCyX30tzzcpdOHsaaVIHT5CYflTtLRGKOtJ1GP4LgePDjN/DN93/GqtC2CaQO9r89WCY7DVW7fhYEP25qz8yCkcM49jZT9nY4rz/dwcKmv4gWGV0NBm3HYzY7XUY1hhWnFhiX+LbWW+AZl6cUQA7qZJvEW9+GcgY2l4V/f1V9U+6iiOyLaccGYg4l2wFwGSFfB77LwYJDs0Jo47+xRWUvQ04aUK51J+I+mjvIJ99kXnOd4NOM76hCecgncHZhEM76GIqRgiKIX8EEV0lit6h9XysOPQaPJBBBQ+656qKbKiET9XQFD3XK9iEXOrp7kZ8jSXR6Iczo+U7vQJHemfrORNYz835ie4q4+WDV1X6yRkUXcbfXSfjsPhH0hJd3P7LUv/EegOiOctkIclqEFyNqcILmbLcjF8tYzFpChS/TJPnZkQ9rL9PV/BOVk/Fo4jVLCFo/crBboElTEG4URXWeIr1s1WbSBg3KZk+ETEldudB5d7CMGTMyDF47KEZVN+bxQ23cbIJlzVon/dTv+FzhLs7Gvkcq54n8X7ujgvETIRoe2VaDxQ3peeUAy6ILQcM93Iag6PUgyVWwRbO8ueCGuOElQVNHaGAlj+FNrxniPW0s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(316002)(41300700001)(1076003)(81166007)(26005)(186003)(86362001)(47076005)(2616005)(16526019)(356005)(82310400005)(36860700001)(426003)(36756003)(82740400003)(83380400001)(40480700001)(6916009)(4326008)(336012)(54906003)(70586007)(478600001)(8676002)(70206006)(8936002)(5660300002)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 15:55:23.5998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c975e0-a9e9-47ca-95c0-08db3d00a854
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9046
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
Cc: stylon.wang@amd.com, Leo Li <sunpeng.li@amd.com>, Harry.Wentland@amd.com,
 qingqing.zhuo@amd.com, Rodrigo.Siqueira@amd.com, roman.li@amd.com,
 solomon.chiu@amd.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 wayne.lin@amd.com, Bhawanpreet.Lakha@amd.com, agustin.gutierrez@amd.com,
 pavle.kotarac@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[Why&How]
Add Enum and documenation related to FAMS (Firmware Assisted Memclk
Switching) and CAB (Cache As Buffer)

Reviewed-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
index 54b7786f5681..b32a5c977d17 100644
--- a/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
+++ b/drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h
@@ -376,6 +376,7 @@ enum dmub_fw_boot_status_bit {
 	DMUB_FW_BOOT_STATUS_BIT_OPTIMIZED_INIT_DONE = (1 << 2), /**< 1 if init done */
 	DMUB_FW_BOOT_STATUS_BIT_RESTORE_REQUIRED = (1 << 3), /**< 1 if driver should call restore */
 	DMUB_FW_BOOT_STATUS_BIT_DEFERRED_LOADED = (1 << 4), /**< 1 if VBIOS data is deferred programmed */
+	DMUB_FW_BOOT_STATUS_BIT_FAMS_ENABLED = (1 << 5), /**< 1 if FAMS is enabled*/
 	DMUB_FW_BOOT_STATUS_BIT_DETECTION_REQUIRED = (1 << 6), /**< 1 if detection need to be triggered by driver*/
 	DMUB_FW_BOOT_STATUS_BIT_HW_POWER_INIT_DONE = (1 << 7), /**< 1 if hw power init is completed */
 };
@@ -989,16 +990,25 @@ struct dmub_rb_cmd_mall {
 };
 
 /**
- * enum dmub_cmd_cab_type - TODO:
+ * enum dmub_cmd_cab_type - CAB command data.
  */
 enum dmub_cmd_cab_type {
+	/**
+	 * No idle optimizations (i.e. no CAB)
+	 */
 	DMUB_CMD__CAB_NO_IDLE_OPTIMIZATION = 0,
+	/**
+	 * No DCN requests for memory
+	 */
 	DMUB_CMD__CAB_NO_DCN_REQ = 1,
+	/**
+	 * Fit surfaces in CAB (i.e. CAB enable)
+	 */
 	DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB = 2,
 };
 
 /**
- * struct dmub_rb_cmd_cab_for_ss - TODO:
+ * struct dmub_rb_cmd_cab - CAB command data.
  */
 struct dmub_rb_cmd_cab_for_ss {
 	struct dmub_cmd_header header;
@@ -1006,6 +1016,9 @@ struct dmub_rb_cmd_cab_for_ss {
 	uint8_t debug_bits;     /* debug bits */
 };
 
+/**
+ * Enum for indicating which MCLK switch mode per pipe
+ */
 enum mclk_switch_mode {
 	NONE = 0,
 	FPO = 1,
-- 
2.34.1

