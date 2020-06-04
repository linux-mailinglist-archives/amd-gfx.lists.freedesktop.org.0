Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664261EDC7B
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 06:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CFE89FF9;
	Thu,  4 Jun 2020 04:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270989FF9
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 04:47:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiGxCvsDlwCxTRncGLvPpLp7eZNPVEFQzQTjLjPCcrA93rWffh5HHSnAbXsf9EG6UJlxVXcWQgzKzdwj0o5zf09N1nv8R+sjuTwGUJTXkp8yJqdHKEqg3/fJbtbbB12CtI9xNC7mbpr1Z2relS96SjtwpbppMOPENG3iXz0kGdOcBFmr+ASbrfuF5Y+N4yYhmBHVYBHEYKo+xHgx8V7lFSn445HxvNiGdgj6uLnkQUpKYkK0I/wGsGQiabFhlD7nPaUlYG7YE1jf1SBllSYN+FeObCORYZ3Z7tbP+TvAIDxlm8dHRXI9ObXcPb5TjDj06CoiUGBrh4NEQC3g32zwMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvJGHsXbkf9lieCdfhMZQ/62QTJSPAK3vCcFWIoJmRc=;
 b=c3xOLBg7YeoPH/uvxNK80eEK8SAXkMLYOABszyw8oG3ELEqiZ/JQ7u/wfVCAR39/9uFzgqhd6wmV30Dfp+jEkyB6p6qPnMo0YItyVueAzibHrZPiPjBeqgHm6bHrkbocIhaHpuZfiUOR+r1tIShNxOoEp4cfvYQexa0hF1Ax/xD+UbJxMSgSOJ1036ff6vRajDDzo+cxMFDtzydr2lsOiv2aJ78S06/M8tVtb92qjPClfYLiUXEIuK4ojYW+bUBKle+vr80dy0U/ECw5vOgKQcSrpwyJAaQu3g8ajVW03z+XGoaGfL27hLAD3PoLaoo6p8SRullOa26g6f4p6K4Bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EvJGHsXbkf9lieCdfhMZQ/62QTJSPAK3vCcFWIoJmRc=;
 b=N+Wxt0gk5ckO/BouLoaU2v3A+CDeYdpU7brhrPp/VrDZbvgF98LmQlIh0j00DO6eO7upKFqdrdXqmCzNQAtS+tKGWB8/CelPTSO9waDq/8ih2Fql4YJNSYH1WNwQxvC3MepiqYLG3GcspdYdBH7mjtmIWfPJvwuGmIankx8RiGY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB3002.namprd12.prod.outlook.com (2603:10b6:5:117::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3066.18; Thu, 4 Jun 2020 04:47:00 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::c157:8999:dcc3:536f%3]) with mapi id 15.20.3045.022; Thu, 4 Jun 2020
 04:47:00 +0000
From: Evan Quan <evan.quan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/16] drm/amd/powerplay: centralize all buffer allocation in
 sw_init phase
Date: Thu,  4 Jun 2020 12:46:07 +0800
Message-Id: <20200604044619.18658-4-evan.quan@amd.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200604044619.18658-1-evan.quan@amd.com>
References: <20200604044619.18658-1-evan.quan@amd.com>
X-ClientProxiedBy: HK0PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::35) To DM6PR12MB2619.namprd12.prod.outlook.com
 (2603:10b6:5:45::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from equan-buildpc.amd.com (58.247.170.242) by
 HK0PR01CA0071.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend
 Transport; Thu, 4 Jun 2020 04:46:59 +0000
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [58.247.170.242]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e74b3ef-2d09-4960-18af-08d8084251ab
X-MS-TrafficTypeDiagnostic: DM6PR12MB3002:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3002F8BBE95C9C18126F73D6E4890@DM6PR12MB3002.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /72RNTB04Gz8+lutd4Wl/yFAgBp9aImeDIzPrJZPOGckJoawvXVbBT62/oLfsK7mhjkBDbYwIiPaEUZopMMCX9WY4Z6Pn/wDB4gw8nEAwC8N9fntgq6X1Tzi4xM3eyOvpEt/b3s4kTAbsYVekdg8lWo+yULnSQUbwD6+hCSNiGQHU918FvlkQuJtV7RhUtYSRkG6RBRf1wql2/N0VxDRyoj1vhUw2kjqj9BMvmcSr/OiKZtTNpcqF3tPWkoAqWqO4TPL9kar0/1vppsdnENaOf+iAqt97osw3GDsMLQg45OibLEe//B10fwGzjMOM9PYnPPGQU80kD/jBN/pjII/Vg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(7696005)(1076003)(52116002)(36756003)(2616005)(30864003)(26005)(316002)(16526019)(83380400001)(6666004)(6486002)(86362001)(5660300002)(186003)(956004)(6916009)(4326008)(66946007)(2906002)(44832011)(8936002)(66476007)(66556008)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Vnxa7X7CoavLQymSkQeHfDA/CmLfaovz7z51N42TCn37ixIBcT9ParvkBrNfOffNZ02vXqFlH5RhmolQHBfP7+YdqpZkUAud1CdhdUTc0wZxY3AeD9CDeE4hjhEY8KE6ng6rVN/CFgxduuJBeU6fFcEoGt2cDu+9hNNTYfPrQ86u/5jsLPsZ1ygM+nsJvLDQKSBBqlEU+d6/pvxnQBNCO2DQlT/Y5WYxQEf+lLDADVgtcblrzi5lW069Ri4jw0Dvf2kwc7PSltxvfkB1jEmufwqaBugQF26DcUPNEY39g6NMjK0x/AeRItALFJiC6xB0wgEjTWGnzH6xutyy82pKB1KAKFS1Kr9L+9dYUQ+2kcuiC6Q3qgSaAQ77Iy1AIabJ6Sgb87WKFpUNm2y6vj1pjMtvfbXTSfGivrghK+8WJ5oHUBrWWSkIYz+WgAer52iw5xbrFsGPJ0LjRi82wTw8O4ry7tHFahzbcYfcX4H4rxyNSCZ7PoqrxpuAtDsGCb4Q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e74b3ef-2d09-4960-18af-08d8084251ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 04:47:00.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWsr5mJEExYmDkMyTr+MvQIz14p2kXDQghe8K88lpBwTBEBXL3Wkm/z6qToOjb0k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3002
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

To fit common design. And this can simplify the buffer deallocation.

Change-Id: Iee682e76aadb5f34861d69d5794ced44f0a78789
Signed-off-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 342 ++++++++++-----------
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c  | 105 ++++---
 2 files changed, 229 insertions(+), 218 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
index 87205abb1e8b..0e459186a2bf 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -799,6 +799,147 @@ int smu_get_atom_data_table(struct smu_context *smu, uint32_t table,
 	return 0;
 }
 
+static int smu_init_fb_allocations(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+	struct smu_table *driver_table = &(smu_table->driver_table);
+	uint32_t max_table_size = 0;
+	int ret, i;
+
+	/* VRAM allocation for tool table */
+	if (tables[SMU_TABLE_PMSTATUSLOG].size) {
+		ret = amdgpu_bo_create_kernel(adev,
+					      tables[SMU_TABLE_PMSTATUSLOG].size,
+					      tables[SMU_TABLE_PMSTATUSLOG].align,
+					      tables[SMU_TABLE_PMSTATUSLOG].domain,
+					      &tables[SMU_TABLE_PMSTATUSLOG].bo,
+					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
+					      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
+		if (ret) {
+			pr_err("VRAM allocation for tool table failed!\n");
+			return ret;
+		}
+	}
+
+	/* VRAM allocation for driver table */
+	for (i = 0; i < SMU_TABLE_COUNT; i++) {
+		if (tables[i].size == 0)
+			continue;
+
+		if (i == SMU_TABLE_PMSTATUSLOG)
+			continue;
+
+		if (max_table_size < tables[i].size)
+			max_table_size = tables[i].size;
+	}
+
+	driver_table->size = max_table_size;
+	driver_table->align = PAGE_SIZE;
+	driver_table->domain = AMDGPU_GEM_DOMAIN_VRAM;
+
+	ret = amdgpu_bo_create_kernel(adev,
+				      driver_table->size,
+				      driver_table->align,
+				      driver_table->domain,
+				      &driver_table->bo,
+				      &driver_table->mc_address,
+				      &driver_table->cpu_addr);
+	if (ret) {
+		pr_err("VRAM allocation for driver table failed!\n");
+		if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
+			amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
+					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
+					      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
+	}
+
+	return ret;
+}
+
+static int smu_fini_fb_allocations(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *tables = smu_table->tables;
+	struct smu_table *driver_table = &(smu_table->driver_table);
+
+	if (!tables)
+		return 0;
+
+	if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
+		amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
+				      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
+				      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
+
+	amdgpu_bo_free_kernel(&driver_table->bo,
+			      &driver_table->mc_address,
+			      &driver_table->cpu_addr);
+
+	return 0;
+}
+
+/**
+ * smu_alloc_memory_pool - allocate memory pool in the system memory
+ *
+ * @smu: amdgpu_device pointer
+ *
+ * This memory pool will be used for SMC use and msg SetSystemVirtualDramAddr
+ * and DramLogSetDramAddr can notify it changed.
+ *
+ * Returns 0 on success, error on failure.
+ */
+static int smu_alloc_memory_pool(struct smu_context *smu)
+{
+	struct amdgpu_device *adev = smu->adev;
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *memory_pool = &smu_table->memory_pool;
+	uint64_t pool_size = smu->pool_size;
+	int ret = 0;
+
+	if (pool_size == SMU_MEMORY_POOL_SIZE_ZERO)
+		return ret;
+
+	memory_pool->size = pool_size;
+	memory_pool->align = PAGE_SIZE;
+	memory_pool->domain = AMDGPU_GEM_DOMAIN_GTT;
+
+	switch (pool_size) {
+	case SMU_MEMORY_POOL_SIZE_256_MB:
+	case SMU_MEMORY_POOL_SIZE_512_MB:
+	case SMU_MEMORY_POOL_SIZE_1_GB:
+	case SMU_MEMORY_POOL_SIZE_2_GB:
+		ret = amdgpu_bo_create_kernel(adev,
+					      memory_pool->size,
+					      memory_pool->align,
+					      memory_pool->domain,
+					      &memory_pool->bo,
+					      &memory_pool->mc_address,
+					      &memory_pool->cpu_addr);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static int smu_free_memory_pool(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+	struct smu_table *memory_pool = &smu_table->memory_pool;
+
+	if (memory_pool->size == SMU_MEMORY_POOL_SIZE_ZERO)
+		return 0;
+
+	amdgpu_bo_free_kernel(&memory_pool->bo,
+			      &memory_pool->mc_address,
+			      &memory_pool->cpu_addr);
+
+	memset(memory_pool, 0, sizeof(struct smu_table));
+
+	return 0;
+}
+
 static int smu_smc_table_sw_init(struct smu_context *smu)
 {
 	int ret;
@@ -823,6 +964,17 @@ static int smu_smc_table_sw_init(struct smu_context *smu)
 		return ret;
 	}
 
+	/*
+	 * allocate vram bos to store smc table contents.
+	 */
+	ret = smu_init_fb_allocations(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_alloc_memory_pool(smu);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -830,6 +982,20 @@ static int smu_smc_table_sw_fini(struct smu_context *smu)
 {
 	int ret;
 
+	ret = smu_free_memory_pool(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_fini_fb_allocations(smu);
+	if (ret)
+		return ret;
+
+	ret = smu_fini_power(smu);
+	if (ret) {
+		pr_err("Failed to init smu_fini_power!\n");
+		return ret;
+	}
+
 	ret = smu_fini_smc_tables(smu);
 	if (ret) {
 		pr_err("Failed to smu_fini_smc_tables!\n");
@@ -920,91 +1086,6 @@ static int smu_sw_fini(void *handle)
 		return ret;
 	}
 
-	ret = smu_fini_power(smu);
-	if (ret) {
-		pr_err("Failed to init smu_fini_power!\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int smu_init_fb_allocations(struct smu_context *smu)
-{
-	struct amdgpu_device *adev = smu->adev;
-	struct smu_table_context *smu_table = &smu->smu_table;
-	struct smu_table *tables = smu_table->tables;
-	struct smu_table *driver_table = &(smu_table->driver_table);
-	uint32_t max_table_size = 0;
-	int ret, i;
-
-	/* VRAM allocation for tool table */
-	if (tables[SMU_TABLE_PMSTATUSLOG].size) {
-		ret = amdgpu_bo_create_kernel(adev,
-					      tables[SMU_TABLE_PMSTATUSLOG].size,
-					      tables[SMU_TABLE_PMSTATUSLOG].align,
-					      tables[SMU_TABLE_PMSTATUSLOG].domain,
-					      &tables[SMU_TABLE_PMSTATUSLOG].bo,
-					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
-					      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
-		if (ret) {
-			pr_err("VRAM allocation for tool table failed!\n");
-			return ret;
-		}
-	}
-
-	/* VRAM allocation for driver table */
-	for (i = 0; i < SMU_TABLE_COUNT; i++) {
-		if (tables[i].size == 0)
-			continue;
-
-		if (i == SMU_TABLE_PMSTATUSLOG)
-			continue;
-
-		if (max_table_size < tables[i].size)
-			max_table_size = tables[i].size;
-	}
-
-	driver_table->size = max_table_size;
-	driver_table->align = PAGE_SIZE;
-	driver_table->domain = AMDGPU_GEM_DOMAIN_VRAM;
-
-	ret = amdgpu_bo_create_kernel(adev,
-				      driver_table->size,
-				      driver_table->align,
-				      driver_table->domain,
-				      &driver_table->bo,
-				      &driver_table->mc_address,
-				      &driver_table->cpu_addr);
-	if (ret) {
-		pr_err("VRAM allocation for driver table failed!\n");
-		if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
-			amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
-					      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
-					      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
-	}
-
-	return ret;
-}
-
-static int smu_fini_fb_allocations(struct smu_context *smu)
-{
-	struct smu_table_context *smu_table = &smu->smu_table;
-	struct smu_table *tables = smu_table->tables;
-	struct smu_table *driver_table = &(smu_table->driver_table);
-
-	if (!tables)
-		return 0;
-
-	if (tables[SMU_TABLE_PMSTATUSLOG].mc_address)
-		amdgpu_bo_free_kernel(&tables[SMU_TABLE_PMSTATUSLOG].bo,
-				      &tables[SMU_TABLE_PMSTATUSLOG].mc_address,
-				      &tables[SMU_TABLE_PMSTATUSLOG].cpu_addr);
-
-	amdgpu_bo_free_kernel(&driver_table->bo,
-			      &driver_table->mc_address,
-			      &driver_table->cpu_addr);
-
 	return 0;
 }
 
@@ -1045,13 +1126,6 @@ static int smu_smc_table_hw_init(struct smu_context *smu,
 		if (ret)
 			return ret;
 
-		/*
-		 * allocate vram bos to store smc table contents.
-		 */
-		ret = smu_init_fb_allocations(smu);
-		if (ret)
-			return ret;
-
 		/*
 		 * Parse pptable format and fill PPTable_t smc_pptable to
 		 * smu_table_context structure. And read the smc_dpm_table from vbios,
@@ -1169,68 +1243,6 @@ static int smu_smc_table_hw_init(struct smu_context *smu,
 	return ret;
 }
 
-/**
- * smu_alloc_memory_pool - allocate memory pool in the system memory
- *
- * @smu: amdgpu_device pointer
- *
- * This memory pool will be used for SMC use and msg SetSystemVirtualDramAddr
- * and DramLogSetDramAddr can notify it changed.
- *
- * Returns 0 on success, error on failure.
- */
-static int smu_alloc_memory_pool(struct smu_context *smu)
-{
-	struct amdgpu_device *adev = smu->adev;
-	struct smu_table_context *smu_table = &smu->smu_table;
-	struct smu_table *memory_pool = &smu_table->memory_pool;
-	uint64_t pool_size = smu->pool_size;
-	int ret = 0;
-
-	if (pool_size == SMU_MEMORY_POOL_SIZE_ZERO)
-		return ret;
-
-	memory_pool->size = pool_size;
-	memory_pool->align = PAGE_SIZE;
-	memory_pool->domain = AMDGPU_GEM_DOMAIN_GTT;
-
-	switch (pool_size) {
-	case SMU_MEMORY_POOL_SIZE_256_MB:
-	case SMU_MEMORY_POOL_SIZE_512_MB:
-	case SMU_MEMORY_POOL_SIZE_1_GB:
-	case SMU_MEMORY_POOL_SIZE_2_GB:
-		ret = amdgpu_bo_create_kernel(adev,
-					      memory_pool->size,
-					      memory_pool->align,
-					      memory_pool->domain,
-					      &memory_pool->bo,
-					      &memory_pool->mc_address,
-					      &memory_pool->cpu_addr);
-		break;
-	default:
-		break;
-	}
-
-	return ret;
-}
-
-static int smu_free_memory_pool(struct smu_context *smu)
-{
-	struct smu_table_context *smu_table = &smu->smu_table;
-	struct smu_table *memory_pool = &smu_table->memory_pool;
-
-	if (memory_pool->size == SMU_MEMORY_POOL_SIZE_ZERO)
-		return 0;
-
-	amdgpu_bo_free_kernel(&memory_pool->bo,
-			      &memory_pool->mc_address,
-			      &memory_pool->cpu_addr);
-
-	memset(memory_pool, 0, sizeof(struct smu_table));
-
-	return 0;
-}
-
 static int smu_start_smc_engine(struct smu_context *smu)
 {
 	struct amdgpu_device *adev = smu->adev;
@@ -1288,10 +1300,6 @@ static int smu_hw_init(void *handle)
 	if (ret)
 		goto failed;
 
-	ret = smu_alloc_memory_pool(smu);
-	if (ret)
-		goto failed;
-
 	/*
 	 * Use msg SetSystemVirtualDramAddr and DramLogSetDramAddr can notify
 	 * pool location.
@@ -1395,7 +1403,6 @@ static int smu_hw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	struct smu_context *smu = &adev->smu;
-	struct smu_table_context *table_context = &smu->smu_table;
 	int ret = 0;
 
 	if (amdgpu_sriov_vf(adev)&& !amdgpu_sriov_is_pp_one_vf(adev))
@@ -1426,23 +1433,6 @@ static int smu_hw_fini(void *handle)
 		return ret;
 	}
 
-	kfree(table_context->driver_pptable);
-	table_context->driver_pptable = NULL;
-
-	kfree(table_context->max_sustainable_clocks);
-	table_context->max_sustainable_clocks = NULL;
-
-	kfree(table_context->overdrive_table);
-	table_context->overdrive_table = NULL;
-
-	ret = smu_fini_fb_allocations(smu);
-	if (ret)
-		return ret;
-
-	ret = smu_free_memory_pool(smu);
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
index d4509ceb7854..45d4fd2526eb 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -439,25 +439,67 @@ int smu_v11_0_init_smc_tables(struct smu_context *smu)
 	struct smu_table *tables = NULL;
 	int ret = 0;
 
-	if (smu_table->tables)
-		return -EINVAL;
-
 	tables = kcalloc(SMU_TABLE_COUNT, sizeof(struct smu_table),
 			 GFP_KERNEL);
-	if (!tables)
-		return -ENOMEM;
-
+	if (!tables) {
+		ret = -ENOMEM;
+		goto err0_out;
+	}
 	smu_table->tables = tables;
 
 	ret = smu_tables_init(smu, tables);
 	if (ret)
-		return ret;
+		goto err1_out;
 
 	ret = smu_v11_0_init_dpm_context(smu);
 	if (ret)
-		return ret;
+		goto err1_out;
+
+	smu_table->driver_pptable =
+		kzalloc(tables[SMU_TABLE_PPTABLE].size, GFP_KERNEL);
+	if (!smu_table->driver_pptable) {
+		ret = -ENOMEM;
+		goto err2_out;
+	}
+
+	smu_table->max_sustainable_clocks =
+		kzalloc(sizeof(struct smu_11_0_max_sustainable_clocks), GFP_KERNEL);
+	if (!smu_table->max_sustainable_clocks) {
+		ret = -ENOMEM;
+		goto err3_out;
+	}
+
+	/* Arcturus does not support OVERDRIVE */
+	if (tables[SMU_TABLE_OVERDRIVE].size) {
+		smu_table->overdrive_table =
+			kzalloc(tables[SMU_TABLE_OVERDRIVE].size, GFP_KERNEL);
+		if (!smu_table->overdrive_table) {
+			ret = -ENOMEM;
+			goto err4_out;
+		}
+
+		smu_table->boot_overdrive_table =
+			kzalloc(tables[SMU_TABLE_OVERDRIVE].size, GFP_KERNEL);
+		if (!smu_table->boot_overdrive_table) {
+			ret = -ENOMEM;
+			goto err5_out;
+		}
+	}
 
 	return 0;
+
+err5_out:
+	kfree(smu_table->overdrive_table);
+err4_out:
+	kfree(smu_table->max_sustainable_clocks);
+err3_out:
+	kfree(smu_table->driver_pptable);
+err2_out:
+	smu_v11_0_fini_dpm_context(smu);
+err1_out:
+	kfree(tables);
+err0_out:
+	return ret;
 }
 
 int smu_v11_0_fini_smc_tables(struct smu_context *smu)
@@ -468,6 +510,17 @@ int smu_v11_0_fini_smc_tables(struct smu_context *smu)
 	if (!smu_table->tables)
 		return -EINVAL;
 
+	kfree(smu_table->boot_overdrive_table);
+	kfree(smu_table->overdrive_table);
+	kfree(smu_table->max_sustainable_clocks);
+	kfree(smu_table->driver_pptable);
+	smu_table->boot_overdrive_table = NULL;
+	smu_table->overdrive_table = NULL;
+	smu_table->max_sustainable_clocks = NULL;
+	smu_table->driver_pptable = NULL;
+	kfree(smu_table->hardcode_pptable);
+	smu_table->hardcode_pptable = NULL;
+
 	kfree(smu_table->tables);
 	kfree(smu_table->metrics_table);
 	kfree(smu_table->watermarks_table);
@@ -730,18 +783,6 @@ int smu_v11_0_parse_pptable(struct smu_context *smu)
 {
 	int ret;
 
-	struct smu_table_context *table_context = &smu->smu_table;
-	struct smu_table *table = &table_context->tables[SMU_TABLE_PPTABLE];
-
-	/* during TDR we need to free and alloc the pptable */
-	if (table_context->driver_pptable)
-		kfree(table_context->driver_pptable);
-
-	table_context->driver_pptable = kzalloc(table->size, GFP_KERNEL);
-
-	if (!table_context->driver_pptable)
-		return -ENOMEM;
-
 	ret = smu_store_powerplay_table(smu);
 	if (ret)
 		return -EINVAL;
@@ -982,17 +1023,10 @@ smu_v11_0_get_max_sustainable_clock(struct smu_context *smu, uint32_t *clock,
 
 int smu_v11_0_init_max_sustainable_clocks(struct smu_context *smu)
 {
-	struct smu_11_0_max_sustainable_clocks *max_sustainable_clocks;
+	struct smu_11_0_max_sustainable_clocks *max_sustainable_clocks =
+			smu->smu_table.max_sustainable_clocks;
 	int ret = 0;
 
-	if (!smu->smu_table.max_sustainable_clocks)
-		max_sustainable_clocks = kzalloc(sizeof(struct smu_11_0_max_sustainable_clocks),
-					 GFP_KERNEL);
-	else
-		max_sustainable_clocks = smu->smu_table.max_sustainable_clocks;
-
-	smu->smu_table.max_sustainable_clocks = (void *)max_sustainable_clocks;
-
 	max_sustainable_clocks->uclock = smu->smu_table.boot_values.uclk / 100;
 	max_sustainable_clocks->soc_clock = smu->smu_table.boot_values.socclk / 100;
 	max_sustainable_clocks->dcef_clock = smu->smu_table.boot_values.dcefclk / 100;
@@ -1938,24 +1972,11 @@ int smu_v11_0_set_default_od_settings(struct smu_context *smu, bool initialize,
 	int ret = 0;
 
 	if (initialize) {
-		if (table_context->overdrive_table) {
-			return -EINVAL;
-		}
-		table_context->overdrive_table = kzalloc(overdrive_table_size, GFP_KERNEL);
-		if (!table_context->overdrive_table) {
-			return -ENOMEM;
-		}
 		ret = smu_update_table(smu, SMU_TABLE_OVERDRIVE, 0, table_context->overdrive_table, false);
 		if (ret) {
 			pr_err("Failed to export overdrive table!\n");
 			return ret;
 		}
-		if (!table_context->boot_overdrive_table) {
-			table_context->boot_overdrive_table = kmemdup(table_context->overdrive_table, overdrive_table_size, GFP_KERNEL);
-			if (!table_context->boot_overdrive_table) {
-				return -ENOMEM;
-			}
-		}
 	}
 	ret = smu_update_table(smu, SMU_TABLE_OVERDRIVE, 0, table_context->overdrive_table, true);
 	if (ret) {
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
