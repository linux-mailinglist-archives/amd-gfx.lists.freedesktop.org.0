Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nWKnIOxkKmq7ogMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:34:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABCA66F68B
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 09:34:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=JwPqyEe1;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D3E10ED2E;
	Thu, 11 Jun 2026 07:34:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C2F10ED2E
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 07:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4ZjbNvKa1aMbs6ZKiCGP53urblzLytKU15BuJ5Y/E8Vh93hSe+CcIrx2DIXKM3XFpv75Hz1Lp/HOAZvzF44xh64RJbT+v24WOBJKCxeqBAVB/cbDmfwfjG09jQpOBrj8716oIHYZB76s1AIWWWXGGS8bc9CMdt1klXKjw4CpBSFlq4ml+yV+gLQ2TGZeTaDysRTv9k0L/qZpl5XJe+iuEq7df2gkXwgmQETuAgpTMTyk1pvjLM3NoMP9dbcG6Y6DAjjqPJ7SwVUcoLOpn+b/WhYgLya+Oj47Sq/c5nPvSGVI2WCEIjgEk1H6NZbCjYGdwErQr1kMO2ha04NjxZT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qT4S+/Vuo3oEBp/tNSyjwTGZl7Nwa9AYkQe4b+fj8Q=;
 b=Yzq5vjRgM2ZiVwGX/ow5SRYTOlxQaZe2mWoCopUJS27w8RJ5rQkfXcscV6DG2lBOqlYPb1B5qf8j9NrE8HX/uEgaG9wCG6Mla8Jv7dk3phIYIgLnlXlLgDrugt+bFNVoPySfmXLzmd5rj97i2ut3NAx046D/7JOal/ScQ8BBClbHJ2S3P56InwzqCEPeqQriDmFgYOw7UC1566hqCaNPcOU6vrgC9oDCMSWGCS+ByiGRZpdBpbVODs8qbtwRVD9tu0q16z/VyzQjVHITZ3Jq8FHh3ytgYa9G7u4Zjg1diX5JhQyQPGL6xLiz5d02hHsU9mbuI32q3nt4/d0yNDRpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qT4S+/Vuo3oEBp/tNSyjwTGZl7Nwa9AYkQe4b+fj8Q=;
 b=JwPqyEe1KucHe82N2/x8DUg+czBp7WmKut/Y/AuACgxflKly0JyQ7lTBKuP2jv8tI9cGz+C8toS+JkeFoa9m4bqS3GGDXncDFLs80o0z2RK4J3mtCawrK+VgE9UNLqGpBYuWOCj12KcnrbvpI8ESZkyop3ta/rCbLOIc5oQqBlg=
Received: from CH0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:610:b0::6)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 07:33:57 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::40) by CH0PR03CA0001.outlook.office365.com
 (2603:10b6:610:b0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 07:33:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 07:33:56 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 02:33:56 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 00:33:56 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 02:33:50 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Alexander.Deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH v2] drm/amdgpu: report GUILTY/INNOCENT reset from
 amdgpu_ctx_query()
Date: Thu, 11 Jun 2026 15:33:38 +0800
Message-ID: <20260611073344.927931-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b16b8d3-b096-416a-8409-08dec78bcbf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: LPltGVVwuJ3blbf95O4rm5slduOiUenFOf4vqbaRYzGtvuvLdH3JzE8nYitdA9pShCxRwvxdJH4ZcPLD+58r4qv1gGWzsRhBBtr5lQ/57eZozi/MzgBJRBVkLmNB6QolNtxmSIvA4NPjeNvjxr7jPVYyRfuS7vRwY0bDE2yeibfc4iCtLY0yfd4DhzaQ0blCSX62xkcJeywrEjXOQAbyPx6sngOGACJG0JJFldjcIFYhX38iiYrIVAsM/DQE2qZwFRhQVLzxwHYxaxFSaxseqKFLzl981jBRgP2mvqbCreQj1SeGJpqw1TUb1Mrz//OvMiM7BuOJ3BkKnLCUZKPzgBjjKDQF4UprLvbXH7nV/rAUAysErpHYSbtgikC8k3a48VpXH90kllUcx+a2QNo/M9i2HI4qje2DqWNmM3VAUIUEepFA8Q5BUVFgVe/wSLwHTvxhPpufsB6ifEmezsHP91PoMq/2ZMMHIserUqtzfqf2S5TKEX76BGppI4L9ad5Y8czw4S5U1UElayAdEDqmZ5+SkLeYuFx3IdCwma3ko3DGveD42j8HX7JKp49o9KLumov6ZVSOeph3mB82f++UxC8GjQsJXin10HEYiVpL7XRw85C0B0XyepKfCpHbp+wv/wdk5Tn8GjGwhslmfFMI55YyBTBEHuvZEqhSG/q6momeb2z32HOEzYIUxJGg458BD7xQjSoequbEGbVIrvs33u2YuFOI/PG5soeNXPvd1jY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P1x0TmITAun4bhf4GDr77UeYDU7hhW3DZyVhGVGvLKCCDYdAvYvhc5bdrKsd+Yy8Mkv45iHxiw0PGc5UI/tuhNGDj5YOiFFj9NAWDIfzSxDkX53rGmBC8+Qt1WCtw8wHtMr4zSEP42oE0ma6oXzhwQQy8H4DWs2qDPEq1KvznCnkX9pdiBikfGDp2LvFMrXYBHwaVXLAXSpDGCTj0CF5hxUX1+jTXsOD4OaPAbqk/h+FOYnmXqOCfI/a1zTDW2kMJRrTlwHqzTXQDQZHgESOCtNY7kH48Zhqi2B/c9Jz7LSuluMJrkY2KA9PRsO9Phd0/vU2sYX66h0/jElesqUGaEJpnojnWib53Sl2UgXKbKiYYX9NNyhU8tJ1AJKqn3VDTnTMoirM75yy7+WQwg8onYyefh7nKz/KClzNDKokPeHr6HCu6rNlKSkMO+vZMScQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 07:33:56.9312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b16b8d3-b096-416a-8409-08dec78bcbf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[Jesse.Zhang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DABCA66F68B

drm/amdgpu: report guilty/innocent context reset status in ctx query

amdgpu_ctx_query() currently reports AMDGPU_CTX_UNKNOWN_RESET whenever
the device reset counter changes, even if the context can be identified
as guilty or unaffected.

Use amdgpu_ctx_guilty() in the ctx query path and return:
- AMDGPU_CTX_GUILTY_RESET for guilty contexts,
- AMDGPU_CTX_INNOCENT_RESET for non-guilty contexts after a reset,
- AMDGPU_CTX_NO_RESET only when no reset occurred and context is not guilty.

This provides accurate per-context reset attribution to userspace instead
of collapsing all reset cases into UNKNOWN.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index d54cec3e4a53..a88443e0254c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -542,6 +542,8 @@ static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
 	return ctx ? 0 : -EINVAL;
 }
 
+static bool amdgpu_ctx_guilty(struct amdgpu_ctx *ctx);
+
 static int amdgpu_ctx_query(struct amdgpu_device *adev,
 			    struct amdgpu_fpriv *fpriv, uint32_t id,
 			    union drm_amdgpu_ctx_out *out)
@@ -549,6 +551,7 @@ static int amdgpu_ctx_query(struct amdgpu_device *adev,
 	struct amdgpu_ctx *ctx;
 	struct amdgpu_ctx_mgr *mgr;
 	unsigned reset_counter;
+	bool guilty;
 
 	if (!fpriv)
 		return -EINVAL;
@@ -567,11 +570,13 @@ static int amdgpu_ctx_query(struct amdgpu_device *adev,
 
 	/* determine if a GPU reset has occured since the last call */
 	reset_counter = atomic_read(&adev->gpu_reset_counter);
-	/* TODO: this should ideally return NO, GUILTY, or INNOCENT. */
-	if (ctx->reset_counter_query == reset_counter)
+	guilty = amdgpu_ctx_guilty(ctx);
+	if (ctx->reset_counter_query == reset_counter && !guilty)
 		out->state.reset_status = AMDGPU_CTX_NO_RESET;
+	else if (guilty)
+		out->state.reset_status = AMDGPU_CTX_GUILTY_RESET;
 	else
-		out->state.reset_status = AMDGPU_CTX_UNKNOWN_RESET;
+		out->state.reset_status = AMDGPU_CTX_INNOCENT_RESET;
 	ctx->reset_counter_query = reset_counter;
 
 	mutex_unlock(&mgr->lock);
-- 
2.49.0

