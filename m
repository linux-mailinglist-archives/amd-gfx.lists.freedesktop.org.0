Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJqLLpCNn2nYcgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 01:02:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F2219F403
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 01:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A652910E0AD;
	Thu, 26 Feb 2026 00:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rE95hla7";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989BB10E0AD
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Feb 2026 00:02:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCn7PRoCJZTRGqPGtDoKheo5Zvx6US06F8PZEQC+SKd+RCOSW0yYWYlnZYi9wOEPAc7x10KWieihRuWCwH278v+QxsIyePcM4vq3NsnoTkRB5JXBRkxda4MGGPcVUmjrK/jCK39iHWEjuE58ACaITj+K+Gg3kuAb9mNO5osFKmx/6jeaeWgsboYPAfrj+XAV76Mw56cpxpPkjPPxaMQnJ9IuOIOn4rg9V7Yrj5VYjRa2WO/cNkhduy9R5aa52bnO5f/q0QFDquRUvhaMINISZAqBOiY1A+wfMvuOFwnRISRJMbDIWVDw/fOlPwi43v9IBjxChx1rJScSXqNkOk9mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wNR2orlwh0gBgHjHx6eDbIgMZmxmEPe+9QBurqhDiM=;
 b=rZn7NXn2+Xn8aRZYfsRUppkYj3IXRRfGs4peKxCACMUq2FES+8krrQdJJMV3SZ73YPzl9CndWVYKNmxlMktkPqqL3p4/Z7mW6iWB+Q7a7jBJn/X/Lw+co8YE2+fhhE/Sc/z1TBNJsQ5b+zsKkkI6+RjEyFnvMjbSnTZC10uxMGpT7QtGi3MjCopbhGOZhko6/H3F1CACP8NShWNaKHd1rQ5Sd6rL/lzCHHgLhztsO7IX2lXJtIISywoF8ASXvXxdusSLndV37JlcC9mwZjuymhXRHPCjE/EXXtCcqkKFWA692zSPkLF+ck5mOlo1GvsMC43VdHSijGN3kY3S9E9HwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wNR2orlwh0gBgHjHx6eDbIgMZmxmEPe+9QBurqhDiM=;
 b=rE95hla7f1QltVp6DOixQ4ifTzJmQfozV+A+H7nvBoHmW49kYoTCXGyiBjZJr/djGb1C2rjwxU0R7BPHhbnimt3drVU/Y5P4vRIj/bDkEUuAZfre3pDjAyu1hglJOrjS5PONgi591GsPEEJcYnzoLL/V2ioTZmHwTdnSwkvS5Uk=
Received: from PH8P221CA0050.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::11)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 00:02:17 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::cc) by PH8P221CA0050.outlook.office365.com
 (2603:10b6:510:346::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 00:02:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 00:02:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 18:02:15 -0600
From: Alex Hung <alex.hung@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Ray Wu
 <Ray.Wu@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, Alex Hung
 <alex.hung@amd.com>, Clay King <clayking@amd.com>, Austin Zheng
 <austin.zheng@amd.com>
Subject: [PATCH 4/8] drm/amd/display: Silence unused variable warning
Date: Wed, 25 Feb 2026 16:57:43 -0700
Message-ID: <20260226000048.68030-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226000048.68030-1-alex.hung@amd.com>
References: <20260226000048.68030-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 30c0a1a7-1bb2-48a0-7346-08de74ca4dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: wgnzfcK4dTbpKQOUAgNMcCTpBtT4urSbIi5w5/gOE/qDQreCp+zparX6wHXFwPWKo4SDMZiUVTDTotZspdBP8U/gVM3BW9oa/POzCaQXhqRyO/piaM6SRvn4PbSRodfKJNgxDlMuSI+RMI+U7U48C5hol59/CYyC7U/1Bg/3nMBL0bTKnVs9eJeDTPcrLzW0NkPjVJgKByIlKrnWbqDnOAwCuNaFORh9HLtuFPEjbVrGcmcnZJ+/Pm8gu0NZVfBAeeqrPGSsB648ZfHi7RDZ8KyWm0HgSHhwdOiDI29g98h214rcHspCUN5vvVFrNxYHYHhmfS6mA/yM69c01/SbkhsKkjZUnsvt/ka8AZp0/DyR6+xzh46rcWWfDttqOuzyDXUqwlr9JA+Y2WMoj/7a1BNe4nOqYP4GVbZ68tIawXctx6J2GywbCQPqrTcRCyDgngDtfFAkTbyagBT6VvCxbpjuL0EaSKXqR/9MF8P+yOJ1pgl/ujZ3VLbSc0ff7InO5fVM9NbhQxDkRkyadBpbCIhHMFoqOjw4u+H5JqfWMpxd1qNq5BUyezJt4bAROu+oyZAWk1TBPim9GLuhuoAE19SFVJuro/LcWaXuMwYOyMce/8w5hDKdetB4L5eC/ftzSt/ogTeayM8/Yi/GxCa7d0eIaqlgifjh3q11BR3Ijgjk4xHUqeqD5bPT2KcZ1DPfjAfcRylZRVcr76fPl3uGTiqaJBpJdOkMj9OimRrGrhSpyjsFDW1A09k7LilNnUVGrB5S2EzF2TbejcVmP6WI8hbIZcx26fgMXLoVt1mo6khXupNAeN1IjxhzoeTGAAQZY+cNQjJ2uBSmoA/ZIcNCTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ft9n23bW8hkJQfJMSPgiPRPQPLPwr0R3fUIrEExxcTCcxMRhOTgsq30mQJNSsm3nVeiez1yEmoD3SgVAIFeGocEMwloDzy3mXnkTZXyl4Cx4qqlQCvdL4cOC+S/gVN9QLT/PjQmd98tYKnmCaMKzWmTOEL6UgkjgipknJVFvzPwxxRkS2b4Tet9vEb6OzF0CHuhgEt6eT9OD2FuLdQN+hWZ2Z7xxy/eR9kiWl5Ln738ET5JdXhxqqayujcT0qdXh7JCoS3JZ/HJSWMGBrXLE1d2kw/PgGUBjCEvMPSlRwiHweqtiIZE1mPoqf0jyptFR4pJu4OVGq8Xs+x4YrLhAexSeOyPK022e5Fxb+sfOEiNm3DJbjnLn3hlXlxb34u2gKcwI35nbFqj5HRAgfctDyjZJWGhA3cwyucEeQvtRbaOZw+tdOHdorrE6SkKENfmo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 00:02:17.2086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c0a1a7-1bb2-48a0-7346-08de74ca4dec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 38F2219F403
X-Rspamd-Action: no action

From: Clay King <clayking@amd.com>

[WHY & HOW]
Remove unused dpp_pipe_count variable.

Reviewed-by: Austin Zheng <austin.zheng@amd.com>
Signed-off-by: Clay King <clayking@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c
index 4cfe64aa8492..74812a7d5e28 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml2_dc_resource_mgmt.c
@@ -909,10 +909,10 @@ static unsigned int get_source_mpc_factor(const struct dml2_context *ctx,
 		const struct dc_plane_state *plane)
 {
 	struct pipe_ctx *dpp_pipes[MAX_PIPES] = {0};
-	int dpp_pipe_count = ctx->config.callbacks.get_dpp_pipes_for_plane(plane,
-			&state->res_ctx, dpp_pipes);
 
-	ASSERT(dpp_pipe_count > 0);
+	if (ctx->config.callbacks.get_dpp_pipes_for_plane(plane, &state->res_ctx, dpp_pipes) <= 0)
+		ASSERT(false);
+
 	return ctx->config.callbacks.get_mpc_slice_count(dpp_pipes[0]);
 }
 
-- 
2.43.0

