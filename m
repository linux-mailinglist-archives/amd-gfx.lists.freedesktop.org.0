Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 597297188BD
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 19:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF54110E4FE;
	Wed, 31 May 2023 17:46:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694F810E4FE
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 17:46:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsAXkdLtjpqNL4YKc7oyhTcuYyLk4NoXjo7iMOjbC0LYffdbHrfOSI5QzovVEwpQFqZ0mv/K6v7w4QBbcYq9SfWg5Kz/EXwYZrVbj5XgBHRa5sa7wWb3xKe8FyZS3hCyJTp9V9Rf8HfihD8X6hFl41rx2y3vFdvWleBonMyrByDOXCWyKppbuYb8L/a9Xy6bx5GngyuCLg5UtGjMAVnz52GYDEisdJzpGL39+fx9Yj4NUT/4PBNsHy0vCGsoKI+ilBQNby379RxvIxtBp5ue48pg82gAO0aq3DNaj+vQAtiZX2JmGqbAkb0KRi5uh8KcTz4enEUvLWk/GVxmUM4/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8v4K8xY0CtXy5/ry4ZQ0yhWSKyP6mEu7Plk2xauehQ=;
 b=A5wPZ6VJnAOcK8e8g5i6eA6z/69OeLMXbwZ7RLafo/0qxxGOrh9tJvznTirFpjZVdbwE8eFqArEKQW94TTwB02Nkegiu1npMl7ihpQ645Ne+T7PlP0s6sf+mT2p/Ta9EofFSV6znW3WbndCMCCu7EukBXTOVpYI6zkpWqq80TBtw5gsH4fkxftx0Ms9cO0Acqo4eGDfcBDMFPXqDuktV3fQLcfW0ybyqDwkRyv+9R8JrCGSSIqHnIlP8bjW53OtZ/IxIbgJNgjr+LN1s0WReknhuqnGAtzFhsafqrFXiD65liUSU0LYlxz5HLqXcNmFeECdnpR/2+UMaflfWjaySZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8v4K8xY0CtXy5/ry4ZQ0yhWSKyP6mEu7Plk2xauehQ=;
 b=GHYoc0O87EaPthuIiWfBKl+wKUfrvTHMue383GzRzRcC/sSCWbR81M+1fBKoBrZhAEvkxBt3L3BznovfRY45CsOCXatqrg6Kb1RsPNsva5Nb47lY7MJpbiMbuL2PjnHw5yD4/CHhiwMCCVxeMsA6OykfG42RydP4r0vAyLoFATo=
Received: from MN2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:208:23b::31)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 17:46:47 +0000
Received: from BL02EPF000145B8.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::3f) by MN2PR11CA0026.outlook.office365.com
 (2603:10b6:208:23b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22 via Frontend
 Transport; Wed, 31 May 2023 17:46:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145B8.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.18 via Frontend Transport; Wed, 31 May 2023 17:46:46 +0000
Received: from TRX40-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 12:46:41 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, Hamza Mahfooz
 <hamza.mahfooz@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Harry
 Wentland" <harry.wentland@amd.com>, Roman Li <Roman.Li@amd.com>
Subject: [PATCH v2] drm/amd/display: Drop unused DCN_BASE variable in
 dcn314_resource.c
Date: Wed, 31 May 2023 23:16:24 +0530
Message-ID: <20230531174624.3526968-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B8:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: dc15f3f4-f09d-4481-3e33-08db61ff014e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zohobSgGwK1dAn1SWN/GTCqFngCqOF6IhaM/iZykB3+x3dG7jK0rVOxNPdpO38A5KmGejw48gJEoW7HAmMpVnDEFoqHzGgWsxF5K7XU9fwkvXZTDwv3OsV1ig3thSJpB2QNhLfhtKoPN5Jv7LxHpEBSAPVYq0reiIUnMKRZRo0sosjru3c7V8ENAa6PuLWtwT7rkLtZJGwioVLXsLqsOqe9Gjcj/KRAa36+Hg6IZxPvN+gjh8Lc5Etd+bBudX/QbqVDec9PDQqGQxhwOLlfO8bph7ELPAIHDrwIolhOYM5dFSf2jffv4X2aKGy8Pze5OKC20dF9Rj4J2zuHg6KVjCjfRwb3TEJXWqjhb/2iI2oM23UoCqQJJi+tAqji/tHmlZQmOodw/rJhG64WobSYrJc6U26qCi1eZXoEOTVJxq54MJsbF8pUey673ys/VsxaNXc1SnBH9ZkLTNAgJI50K5g9oNNpf9WSl9eTflYDDJG5J14ZDsdNxkAcPEYQ57zREPmMtB05GP+8NGhXCyLHr1PtZJdSJ9rZh7rNRYM6I2+pIjn244B7HyecQiv+XUKFanC0QZU9rcTnYuvrjiFGoHYpsEEZ2Ni45cZWqqtW4CX6whFYpLSZYfHlpeS7VAl4ioUAlWshVwQEu8CIYPtJroNpfL8m55NhLLELBEsADnvSTJ9rObvwRSdNNefbp+Llx817dIVM7YD4b+bvGXigl/zjB7DWYJRr/zTqzBbx3Vw/O/Uho89r7sJQm9mnWFoCpiSywsDLcUMKbRB7sgMi2jQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(7696005)(6666004)(426003)(83380400001)(36756003)(336012)(36860700001)(47076005)(2616005)(82310400005)(86362001)(356005)(82740400003)(1076003)(81166007)(40480700001)(26005)(16526019)(186003)(2906002)(6636002)(70206006)(4326008)(70586007)(110136005)(54906003)(5660300002)(8676002)(8936002)(44832011)(41300700001)(478600001)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 17:46:46.9048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc15f3f4-f09d-4481-3e33-08db61ff014e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn314/dcn314_resource.c:128:29: warning: ‘DCN_BASE’ defined but not used [-Wunused-const-variable=]
  128 | static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0, 0, 0 } },
      |                             ^~~~~~~~

Suggested-by: Roman Li <Roman.Li@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---

v2:
 - Remove even unused IP_BASE_INSTANCE and IP_BASE struct definitions
   altogether (Roman)

 .../drm/amd/display/dc/dcn314/dcn314_resource.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
index 3592efcc7fae..837884c4f03a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -117,23 +117,6 @@
 #define regBIF_BX2_BIOS_SCRATCH_6			0x003e
 #define regBIF_BX2_BIOS_SCRATCH_6_BASE_IDX		1
 
-struct IP_BASE_INSTANCE {
-	unsigned int segment[MAX_SEGMENT];
-};
-
-struct IP_BASE {
-	struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
-};
-
-static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
-					{ { 0, 0, 0, 0, 0, 0, 0, 0 } } } };
-
-
 #define DC_LOGGER_INIT(logger)
 
 enum dcn31_clk_src_array_id {
-- 
2.25.1

