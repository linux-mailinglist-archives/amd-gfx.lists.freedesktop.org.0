Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DD482FFC1
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jan 2024 06:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 829A910E063;
	Wed, 17 Jan 2024 05:19:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9B610E063
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jan 2024 05:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSHvJZxHF5mXetKBr5LJyGZ/EMM51oRq6NXO/aNXoYUKLzvVts1ijBxy2HWbFFh/pDsANsWvI363tC2qPk/6SMCUaP0gvMD91b0rhXQ+DeRy+kg3ImESW43xR32BJx4OO1OHohVKGl2WnvLjsLxFUs9zU5Mb0dlFIPZyLGPXJ+V3b3mySgooKXPN7JKUk54N1DFoO6CYYuvTXc+EzJCil0bQjyHHLEmCPbj84AeTf10xaFYI7sWDkgJkWRPc8pnHOTIKcw5dgo8KCiPOj1tgJ3d2uS4954Zxxj8+4jXJqPj8RlUN/4FpkN+t5xThEDKShfY1lx/FF1kR72yw6j8noQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux1IHWljssVy56aQh2fuS6zye+vpqg1ND81VmQ653Kg=;
 b=do3RlGVDfzpublPQNZdG0V106+yMgJvMbKNhxW6Aj4kTEYsUPDZxldsTtdR05r6D5JZ2CtnL6vTFZdGDAtq31uHCqKpxmRPKQlt63DgEjz8p+QYCMNSGKWnEnR2iOZUhsIwXa6Hz6PNh0r3veb6J9iYjaLZRXliPTE/R6WefuHSAdzVlYdfOB7NVVAap79BKK/2V6mgBpmMca9fAK98b+DcaNlenzPqSbQetmj60TK0qTlE4p8NX/NzuPeD1vJHGK/me+AfGpPKhv6DHXr4G4bImFoRGe2WYGkJlSPOu0MJBoGKGz7im5rmFFXz+70H52mswUwUYO9p4sdOKFfkGqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux1IHWljssVy56aQh2fuS6zye+vpqg1ND81VmQ653Kg=;
 b=WXV3wu/9+CtXi4aRWw7ma64JCyknfuG/tXAVLN0reKaAL/0cgLnIp/pceuJkH/bwhJ9XJQnm/U6wuqcNns+ZMKrdZY9tx292HGA1ujdAn5o45oVyj43LUErnF38S/Mc1hEl1vyeomFj3/UIpXsURXgKvyXzBZKFlj94D0Re27Wk=
Received: from CH0PR03CA0072.namprd03.prod.outlook.com (2603:10b6:610:cc::17)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 05:18:46 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::8a) by CH0PR03CA0072.outlook.office365.com
 (2603:10b6:610:cc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29 via Frontend
 Transport; Wed, 17 Jan 2024 05:18:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 05:18:46 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 16 Jan 2024 23:18:43 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>
Subject: [PATCH v2] drm/amd/display: Fix uninitialized variable usage in
 core_link_ 'read_dpcd() & write_dpcd()' functions
Date: Wed, 17 Jan 2024 10:48:28 +0530
Message-ID: <20240117051828.50839-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117032354.20794-1-srinivasan.shanmugam@amd.com>
References: <20240117032354.20794-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4acb87-43db-47c2-68bb-08dc171bc7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Eq9xjC08SFfJbO++ixp6rIArpForS85KScHoATEuo8yafWcIZkxJDL4ex4Zbq/ZMDf/Pr/wRfYpjrGZNirkZO3FdwDIJ5zwJKTqLWgXEl3efwW+OhsLK5c2nlp2LalWgO522wULprlh9asgRQxHldabhVYHoPS1iPAEjDezbhQoiBxfiXltHA+ZE6V/UBFgvUl9a93P8uoJG3ow9+uUIHkXZRjoUH/y0BfLptR054f9Dbxjgi/jMI70YDV0zvhRVViJf8b1e2egau+pJmuje9XUmIGH5HA+ltq0Wf9yiM+XxVvG5VkhE6iJIExK+jrA4cpTmQkaaqyzMcEjjySygSnIBC+58IVHSlrmesuRT+6oEMSOVP/Di+uuv8d1RPO6r/Y3hyawMV7E7vMgcVB8xuIF+zYvPZVopSNb24STXq9EUkuh+QeSRPUUkjTmeCrt294rDpDKxBJWDE8P/1+jCLYBatfOmf5nyiAi/+UI/4lvKetwsSUX8wHBlCxaSpCknuDEALNQAKrEYASgd0PIsIEwRHLtBEJfgQRHut7xNQ/rhsLAaEg5N8za+kVL9Th/E1qdu1l2DNg9xlQF+BGp8qYWd+DEg2W++JxVLcM4KB6O9oBsAGYxplt72Y2/x34YRtfB6wUOeprUP+xjF2kxFXCttqwnsu8m30iScpxgUuinK3CjPxyKNBUmBh/qB/dl76fxfqQlO9PhOMC2nw7cbtD+u2wkImn/+tsr6OFWrfbdrotRUd6MqCBuI/jxOGZuO/NDb5AT/XauBUOq052A3w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(64100799003)(1800799012)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(2906002)(5660300002)(44832011)(4326008)(7696005)(316002)(70206006)(110136005)(54906003)(82740400003)(6666004)(41300700001)(36860700001)(70586007)(6636002)(8936002)(8676002)(81166007)(36756003)(356005)(86362001)(478600001)(47076005)(16526019)(426003)(1076003)(26005)(2616005)(336012)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 05:18:46.4545 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4acb87-43db-47c2-68bb-08dc171bc7ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, stable@vger.kernel.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Jun Lei <Jun.Lei@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The 'status' variable in 'core_link_read_dpcd()' &
'core_link_write_dpcd()' was uninitialized.

Thus, initializing 'status' variable to 'DC_ERROR_UNEXPECTED' by default.

Fixes the below:
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dpcd.c:226 core_link_read_dpcd() error: uninitialized symbol 'status'.
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dpcd.c:248 core_link_write_dpcd() error: uninitialized symbol 'status'.

Cc: stable@vger.kernel.org
Cc: Jun Lei <Jun.Lei@amd.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
v2:
 - Initialized status variable to 'DC_ERROR_UNEXPECTED' default.

 drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
index 5c9a30211c10..fc50931c2aec 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dpcd.c
@@ -205,7 +205,7 @@ enum dc_status core_link_read_dpcd(
 	uint32_t extended_size;
 	/* size of the remaining partitioned address space */
 	uint32_t size_left_to_read;
-	enum dc_status status;
+	enum dc_status status = DC_ERROR_UNEXPECTED;
 	/* size of the next partition to be read from */
 	uint32_t partition_size;
 	uint32_t data_index = 0;
@@ -234,7 +234,7 @@ enum dc_status core_link_write_dpcd(
 {
 	uint32_t partition_size;
 	uint32_t data_index = 0;
-	enum dc_status status;
+	enum dc_status status = DC_ERROR_UNEXPECTED;
 
 	while (size) {
 		partition_size = dpcd_get_next_partition_size(address, size);
-- 
2.34.1

