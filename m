Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52968ADFB3
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Apr 2024 10:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1A31131E9;
	Tue, 23 Apr 2024 08:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="brhm/1Ui";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8FC1131E7
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Apr 2024 08:26:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co3PNlyRaqf1cOAlLnt7/AlEOLpAB32rUaUcHZg1JEMqV10+ADjOQuDnVijH+CFu0Pr5XvEhNoFe9/zFZ/2aYqo+pIdVxEeDRPUO1kcm/W+XFDQsSIpXYoNosY1F1eqG8idbKHbddGIPzGd93rPDBFRHVvckVGbSY1VejI7MjSu9wO2PbnuOa/mEPwzYCDso+PFiRLl2TgnRtdGqN/w59TntjoIxRIOBQWIcCpTLGXGX5uncFouK/dioU0oEZy2cl8dkVrMyDnI6ER3wSZrporyOpdpWOD2wskaygmbH7Rt0DunBq2Gcer+pqR1c9Aper0mZcf1s5OPN9fx1jsl4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7K4aaAYRGI12TcYngZezjoCfKNxwNYiWcUXAUI+wMFQ=;
 b=cxl8GNopPnDedaSGZIaFk4nf6liRNoIGCJM1sE+3wGFjt1QRfig9VbNC2R2rMSmz1uR2qnlMkKYNq5Xg0iNis5UXbTSZpS3bsVZX+Ct/YVOD9qcnEYMYFxXaBUl9NHBodoYTrWOOT1sOU2MNEB5UsFctnT8ePe9jOa6NCr231eilCTrYAAX3ZWqUM3LPu0xgbrKGm0hjRvGFaf9te2uEBTvEwOYzlv0HvxfZiWW2+v4kGUtzlj4mIZI9JrsbiuGu5XRSCs1AwL6820BvyGe8aR7v6YzvhzqI7ahpykMzveTBHDOdwoRDI28Ep8ATnU3OeErfp0aty4lT9lK351tDnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7K4aaAYRGI12TcYngZezjoCfKNxwNYiWcUXAUI+wMFQ=;
 b=brhm/1UiC9uNpoqY82Qq+4f0g28L0G1aUyjR/EQIOFiwf0Lvr6imagQkRUWHVy8uQo8c1lMS4wK7yFKApwZKdkSvdT3L7IhwqrQfBUaASMZr1AdKP81yh0nm39x3RzakCHdEqQ75KUeR78pinAKkFJwsw/CcCHZuLTSsQnfmi+k=
Received: from BN7PR06CA0037.namprd06.prod.outlook.com (2603:10b6:408:34::14)
 by PH8PR12MB7160.namprd12.prod.outlook.com (2603:10b6:510:228::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 08:26:54 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:34:cafe::1) by BN7PR06CA0037.outlook.office365.com
 (2603:10b6:408:34::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 08:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.0 via Frontend Transport; Tue, 23 Apr 2024 08:26:53 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 03:26:52 -0500
From: Yang Wang <kevinyang.wang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <hawking.zhang@amd.com>, <tao.zhou1@amd.com>, <Candice.Li@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: remove unused MCA driver codes
Date: Tue, 23 Apr 2024 16:26:37 +0800
Message-ID: <20240423082640.3273762-1-kevinyang.wang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|PH8PR12MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: d3459863-800b-46a4-440f-08dc636f21c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C1zvDbsyzmCxpoh3MmtRcQtwFcJslWzGQZlj6iY8UZZW0JJAgU4j7z3ng0ff?=
 =?us-ascii?Q?eTaCwZVM+VNOwjxGjAF8/+NbBEPv4CV+KsYAkDR+5p7zgGJlJU/3V874+oe6?=
 =?us-ascii?Q?lL9o1dfXMKph2mdUja+Spxv2EHJrhm+HkKHhHRsYuuj0MOtP4EX/2QSBP86i?=
 =?us-ascii?Q?Mb0+qJT2WCTHadYGZuCDN5t017wt6bCZYoBFLUTX1iQyoQdZEaCzM9gPJMG4?=
 =?us-ascii?Q?IyRBrG5v8U3oWhgs1v0EcpmW3eZ305RpI8751zl3fd5yNKd7N//3xueu/flC?=
 =?us-ascii?Q?VkiEef9X9sFjWiSzKdfAOJgxHdmqPZXLIL3Kfr3H6VHSoNQLpx6LY0bL3QY5?=
 =?us-ascii?Q?yE7uPLlFbmzp/cLSsp5KjUUUADRNIZ1hGEngfJ8T3Ll9LknKnUzkiOPD7X/Y?=
 =?us-ascii?Q?2vsNuQfp5tI5p4H8BbNiXuNJj3efHl3nINE93nvSi1nerXoi7+EqSVjKpkIz?=
 =?us-ascii?Q?15yJpBRUgVNdbf6lcbaNzI/KadA/iztxGG+aYqra4BL9n8NJYGZfjDr38/vT?=
 =?us-ascii?Q?wsx8JWmjjLjd0iCq2aDYi+t0y5C3WG+UpOIKnm0hANzzs791/cayiR6oCv7g?=
 =?us-ascii?Q?LzJPyzgc9SLDxSsxy90+Dei69kLZlyeidAS3sHGVlA8vKUV9gKrPHfQv9W/b?=
 =?us-ascii?Q?OlAjMnwCGgedUYI5hE28lGR9BpjGND+EBlx27AiykLAkFD1QBZbAWAqvhNV/?=
 =?us-ascii?Q?Nwxf2n3qHCBN5sy7QeuobXWcqsznKloLupe0tTDYIN4IU7NTzxQfmw3jWM0c?=
 =?us-ascii?Q?m0ABrnp8rDhqPSAYGQbkOzQdhGpCuigRI5cEMp7pVyXSVmkZoxzf+SeqppJu?=
 =?us-ascii?Q?LgaGQrmnfMtUoVjy6xd3b+4NHdE4Q59WdWFTjdN1wvd+HiisecbS4Vi/rjMk?=
 =?us-ascii?Q?tOU1tiWhXY8eDrR6rgyMyuL7EQf+oNGGQkHM45XFxiEuilSi9x4X40Cbcjkm?=
 =?us-ascii?Q?OJl7Ni8K/Tqf1yUBjPtiE6eL+oeZJs36PFUpvGk0h1NZChqVgEdhVeA9heXc?=
 =?us-ascii?Q?6N9UtScCOUlTGya3+xFE8sUKw2UFSxPIe77PPX1oDz7qsEbPFoIFvQ1cuzCm?=
 =?us-ascii?Q?csr+NZJFF2NktuOkQo2LYN6+8rKL6B6TDH5vexcI5YNPqv8YBX9hYwi2gCsC?=
 =?us-ascii?Q?bVk/Xfo0C8oJ2bd3ccd7XFCm1IqdHXvtS/4lkJvi/mFwet5nxRS3THnQ5coM?=
 =?us-ascii?Q?WfpOKbAfO8WHU5G+5jfmMXDIzr8ZsWde1NnIJ8ZME9rdHckLA7MedSxvDC9q?=
 =?us-ascii?Q?+2xlRkHFtkDJEkzYIMF9rKAkt4A9ZAnfwcF4k5vzEfDwps4GZP8sy/3F/r9J?=
 =?us-ascii?Q?cuOveYifeI1CqGnwBDXzF5bDVQJPcgAe2k12JW+n4zHq7021NnrzXGUj2pO7?=
 =?us-ascii?Q?HkiziEg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 08:26:53.8289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3459863-800b-46a4-440f-08dc636f21c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7160
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- remove unused callback functions.
- make part of mca functions static and refine the function order.

Signed-off-by: Yang Wang <kevinyang.wang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c       | 199 ++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h       |  16 --
 .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  |  50 -----
 3 files changed, 82 insertions(+), 183 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
index 0734490347db..67c208861994 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
@@ -153,7 +153,7 @@ int amdgpu_mca_mpio_ras_sw_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-void amdgpu_mca_bank_set_init(struct mca_bank_set *mca_set)
+static void amdgpu_mca_bank_set_init(struct mca_bank_set *mca_set)
 {
 	if (!mca_set)
 		return;
@@ -162,7 +162,7 @@ void amdgpu_mca_bank_set_init(struct mca_bank_set *mca_set)
 	INIT_LIST_HEAD(&mca_set->list);
 }
 
-int amdgpu_mca_bank_set_add_entry(struct mca_bank_set *mca_set, struct mca_bank_entry *entry)
+static int amdgpu_mca_bank_set_add_entry(struct mca_bank_set *mca_set, struct mca_bank_entry *entry)
 {
 	struct mca_bank_node *node;
 
@@ -183,7 +183,7 @@ int amdgpu_mca_bank_set_add_entry(struct mca_bank_set *mca_set, struct mca_bank_
 	return 0;
 }
 
-void amdgpu_mca_bank_set_release(struct mca_bank_set *mca_set)
+static void amdgpu_mca_bank_set_release(struct mca_bank_set *mca_set)
 {
 	struct mca_bank_node *node, *tmp;
 
@@ -228,6 +228,84 @@ static void amdgpu_mca_smu_mca_bank_dump(struct amdgpu_device *adev, int idx, st
 		      idx, entry->regs[MCA_REG_IDX_SYND]);
 }
 
+static int amdgpu_mca_smu_get_valid_mca_count(struct amdgpu_device *adev, enum amdgpu_mca_error_type type, uint32_t *count)
+{
+	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
+
+	if (!count)
+		return -EINVAL;
+
+	if (mca_funcs && mca_funcs->mca_get_valid_mca_count)
+		return mca_funcs->mca_get_valid_mca_count(adev, type, count);
+
+	return -EOPNOTSUPP;
+}
+
+static int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_error_type type,
+					int idx, struct mca_bank_entry *entry)
+{
+	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
+	int count;
+
+	if (!mca_funcs || !mca_funcs->mca_get_mca_entry)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case AMDGPU_MCA_ERROR_TYPE_UE:
+		count = mca_funcs->max_ue_count;
+		break;
+	case AMDGPU_MCA_ERROR_TYPE_CE:
+		count = mca_funcs->max_ce_count;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (idx >= count)
+		return -EINVAL;
+
+	return mca_funcs->mca_get_mca_entry(adev, type, idx, entry);
+}
+
+static int amdgpu_mca_smu_get_mca_set(struct amdgpu_device *adev, enum amdgpu_mca_error_type type, struct mca_bank_set *mca_set)
+{
+	struct mca_bank_entry entry;
+	uint32_t count = 0, i;
+	int ret;
+
+	if (!mca_set)
+		return -EINVAL;
+
+	ret = amdgpu_mca_smu_get_valid_mca_count(adev, type, &count);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < count; i++) {
+		memset(&entry, 0, sizeof(entry));
+		ret = amdgpu_mca_smu_get_mca_entry(adev, type, i, &entry);
+		if (ret)
+			return ret;
+
+		amdgpu_mca_bank_set_add_entry(mca_set, &entry);
+	}
+
+	return 0;
+}
+
+static int amdgpu_mca_smu_parse_mca_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
+						enum amdgpu_mca_error_type type, struct mca_bank_entry *entry, uint32_t *count)
+{
+	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
+
+	if (!count || !entry)
+		return -EINVAL;
+
+	if (!mca_funcs || !mca_funcs->mca_parse_mca_error_count)
+		return -EOPNOTSUPP;
+
+	return mca_funcs->mca_parse_mca_error_count(adev, blk, type, entry, count);
+}
+
 int amdgpu_mca_smu_log_ras_error(struct amdgpu_device *adev, enum amdgpu_ras_block blk, enum amdgpu_mca_error_type type,
 				 struct ras_err_data *err_data, struct ras_query_context *qctx)
 {
@@ -241,7 +319,7 @@ int amdgpu_mca_smu_log_ras_error(struct amdgpu_device *adev, enum amdgpu_ras_blo
 
 	amdgpu_mca_bank_set_init(&mca_set);
 
-	ret = amdgpu_mca_smu_get_mca_set(adev, blk, type, &mca_set);
+	ret = amdgpu_mca_smu_get_mca_set(adev, type, &mca_set);
 	if (ret)
 		goto out_mca_release;
 
@@ -286,119 +364,6 @@ int amdgpu_mca_smu_log_ras_error(struct amdgpu_device *adev, enum amdgpu_ras_blo
 	return ret;
 }
 
-
-int amdgpu_mca_smu_get_valid_mca_count(struct amdgpu_device *adev, enum amdgpu_mca_error_type type, uint32_t *count)
-{
-	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
-
-	if (!count)
-		return -EINVAL;
-
-	if (mca_funcs && mca_funcs->mca_get_valid_mca_count)
-		return mca_funcs->mca_get_valid_mca_count(adev, type, count);
-
-	return -EOPNOTSUPP;
-}
-
-int amdgpu_mca_smu_get_mca_set_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-					    enum amdgpu_mca_error_type type, uint32_t *total)
-{
-	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
-	struct mca_bank_set mca_set;
-	struct mca_bank_node *node;
-	struct mca_bank_entry *entry;
-	uint32_t count;
-	int ret;
-
-	if (!total)
-		return -EINVAL;
-
-	if (!mca_funcs)
-		return -EOPNOTSUPP;
-
-	if (!mca_funcs->mca_get_ras_mca_set || !mca_funcs->mca_get_valid_mca_count)
-		return -EOPNOTSUPP;
-
-	amdgpu_mca_bank_set_init(&mca_set);
-
-	ret = mca_funcs->mca_get_ras_mca_set(adev, blk, type, &mca_set);
-	if (ret)
-		goto err_mca_set_release;
-
-	*total = 0;
-	list_for_each_entry(node, &mca_set.list, node) {
-		entry = &node->entry;
-
-		count = 0;
-		ret = mca_funcs->mca_parse_mca_error_count(adev, blk, type, entry, &count);
-		if (ret)
-			goto err_mca_set_release;
-
-		*total += count;
-	}
-
-err_mca_set_release:
-	amdgpu_mca_bank_set_release(&mca_set);
-
-	return ret;
-}
-
-int amdgpu_mca_smu_parse_mca_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-					 enum amdgpu_mca_error_type type, struct mca_bank_entry *entry, uint32_t *count)
-{
-	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
-	if (!count || !entry)
-		return -EINVAL;
-
-	if (!mca_funcs || !mca_funcs->mca_parse_mca_error_count)
-		return -EOPNOTSUPP;
-
-
-	return mca_funcs->mca_parse_mca_error_count(adev, blk, type, entry, count);
-}
-
-int amdgpu_mca_smu_get_mca_set(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-			       enum amdgpu_mca_error_type type, struct mca_bank_set *mca_set)
-{
-	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
-
-	if (!mca_set)
-		return -EINVAL;
-
-	if (!mca_funcs || !mca_funcs->mca_get_ras_mca_set)
-		return -EOPNOTSUPP;
-
-	WARN_ON(!list_empty(&mca_set->list));
-
-	return mca_funcs->mca_get_ras_mca_set(adev, blk, type, mca_set);
-}
-
-int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_error_type type,
-				 int idx, struct mca_bank_entry *entry)
-{
-	const struct amdgpu_mca_smu_funcs *mca_funcs = adev->mca.mca_funcs;
-	int count;
-
-	if (!mca_funcs || !mca_funcs->mca_get_mca_entry)
-		return -EOPNOTSUPP;
-
-	switch (type) {
-	case AMDGPU_MCA_ERROR_TYPE_UE:
-		count = mca_funcs->max_ue_count;
-		break;
-	case AMDGPU_MCA_ERROR_TYPE_CE:
-		count = mca_funcs->max_ce_count;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (idx >= count)
-		return -EINVAL;
-
-	return mca_funcs->mca_get_mca_entry(adev, type, idx, entry);
-}
-
 #if defined(CONFIG_DEBUG_FS)
 static int amdgpu_mca_smu_debug_mode_set(void *data, u64 val)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
index e5bf07ce3451..4d0a0f91c375 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.h
@@ -122,8 +122,6 @@ struct amdgpu_mca_smu_funcs {
 	int max_ue_count;
 	int max_ce_count;
 	int (*mca_set_debug_mode)(struct amdgpu_device *adev, bool enable);
-	int (*mca_get_ras_mca_set)(struct amdgpu_device *adev, enum amdgpu_ras_block blk, enum amdgpu_mca_error_type type,
-				   struct mca_bank_set *mca_set);
 	int (*mca_parse_mca_error_count)(struct amdgpu_device *adev, enum amdgpu_ras_block blk, enum amdgpu_mca_error_type type,
 					 struct mca_bank_entry *entry, uint32_t *count);
 	int (*mca_get_valid_mca_count)(struct amdgpu_device *adev, enum amdgpu_mca_error_type type,
@@ -152,23 +150,9 @@ int amdgpu_mca_mpio_ras_sw_init(struct amdgpu_device *adev);
 
 void amdgpu_mca_smu_init_funcs(struct amdgpu_device *adev, const struct amdgpu_mca_smu_funcs *mca_funcs);
 int amdgpu_mca_smu_set_debug_mode(struct amdgpu_device *adev, bool enable);
-int amdgpu_mca_smu_get_valid_mca_count(struct amdgpu_device *adev, enum amdgpu_mca_error_type type, uint32_t *count);
 int amdgpu_mca_smu_get_mca_set_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
 					   enum amdgpu_mca_error_type type, uint32_t *total);
-int amdgpu_mca_smu_get_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-				   enum amdgpu_mca_error_type type, uint32_t *count);
-int amdgpu_mca_smu_parse_mca_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-					 enum amdgpu_mca_error_type type, struct mca_bank_entry *entry, uint32_t *count);
-int amdgpu_mca_smu_get_mca_set(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-			       enum amdgpu_mca_error_type type, struct mca_bank_set *mca_set);
-int amdgpu_mca_smu_get_mca_entry(struct amdgpu_device *adev, enum amdgpu_mca_error_type type,
-				 int idx, struct mca_bank_entry *entry);
-
 void amdgpu_mca_smu_debugfs_init(struct amdgpu_device *adev, struct dentry *root);
-
-void amdgpu_mca_bank_set_init(struct mca_bank_set *mca_set);
-int amdgpu_mca_bank_set_add_entry(struct mca_bank_set *mca_set, struct mca_bank_entry *entry);
-void amdgpu_mca_bank_set_release(struct mca_bank_set *mca_set);
 int amdgpu_mca_smu_log_ras_error(struct amdgpu_device *adev, enum amdgpu_ras_block blk, enum amdgpu_mca_error_type type,
 				 struct ras_err_data *err_data, struct ras_query_context *qctx);
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
index ef17c8c1bf39..ff010cc2f25a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
@@ -2924,55 +2924,6 @@ static bool mca_bank_is_valid(struct amdgpu_device *adev, const struct mca_ras_i
 	return true;
 }
 
-static int __mca_smu_get_ras_mca_set(struct amdgpu_device *adev, const struct mca_ras_info *mca_ras,
-				     enum amdgpu_mca_error_type type, struct mca_bank_set *mca_set)
-{
-	struct mca_bank_entry entry;
-	uint32_t mca_cnt;
-	int i, ret;
-
-	ret = mca_get_valid_mca_count(adev, type, &mca_cnt);
-	if (ret)
-		return ret;
-
-	/* if valid mca bank count is 0, the driver can return 0 directly */
-	if (!mca_cnt)
-		return 0;
-
-	for (i = 0; i < mca_cnt; i++) {
-		memset(&entry, 0, sizeof(entry));
-		ret = mca_get_mca_entry(adev, type, i, &entry);
-		if (ret)
-			return ret;
-
-		if (mca_ras && !mca_bank_is_valid(adev, mca_ras, type, &entry))
-			continue;
-
-		ret = amdgpu_mca_bank_set_add_entry(mca_set, &entry);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int mca_smu_get_ras_mca_set(struct amdgpu_device *adev, enum amdgpu_ras_block blk,
-				   enum amdgpu_mca_error_type type, struct mca_bank_set *mca_set)
-{
-	const struct mca_ras_info *mca_ras = NULL;
-
-	if (!mca_set)
-		return -EINVAL;
-
-	if (blk != AMDGPU_RAS_BLOCK_COUNT) {
-		mca_ras = mca_get_mca_ras_info(adev, blk);
-		if (!mca_ras)
-			return -EOPNOTSUPP;
-	}
-
-	return __mca_smu_get_ras_mca_set(adev, mca_ras, type, mca_set);
-}
-
 static int mca_smu_parse_mca_error_count(struct amdgpu_device *adev, enum amdgpu_ras_block blk, enum amdgpu_mca_error_type type,
 					 struct mca_bank_entry *entry, uint32_t *count)
 {
@@ -3009,7 +2960,6 @@ static const struct amdgpu_mca_smu_funcs smu_v13_0_6_mca_smu_funcs = {
 	.max_ue_count = 12,
 	.max_ce_count = 12,
 	.mca_set_debug_mode = mca_smu_set_debug_mode,
-	.mca_get_ras_mca_set = mca_smu_get_ras_mca_set,
 	.mca_parse_mca_error_count = mca_smu_parse_mca_error_count,
 	.mca_get_mca_entry = mca_smu_get_mca_entry,
 	.mca_get_valid_mca_count = mca_smu_get_valid_mca_count,
-- 
2.34.1

