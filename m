Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A31E91+smkcNAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 09:52:45 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB826F2A8
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 09:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0473E10EA38;
	Thu, 12 Mar 2026 08:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EMTe22vQ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012068.outbound.protection.outlook.com
 [40.93.195.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B0310EA38
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 08:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClQZQUGZM73tzIyFRfLq1IIcZO1GxyTA7NUANAfq5obGCwWdc3u4f4xX0LHdAkE0lBEtImsNJfX7sBYcGX2JDeIVUFq6qOPMh7h2qGz9JaRixBGefSlWI1Ir/z3z/ItaC//K08dfTDXGZ5QT12lJWvm5IdgXtR2IKYHvPWG0vvPZW1v8Kk0pI3AhpPytYTDOUvOaRMRwixg7ICwb6lQPd68efMQmRsOK2SXAPGLfcYllj/d9RYUWrbj49iR5q8tZrxT8SlcQlcy9gD3za4Xyvdvfvvy+EXB20Udy692mFasqcQQSA89zsm1YTwiOCIJ3hDmVtUMfEz2aVPavm/Fxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQzZnJGUVHLXiT1/vk50PSA0VETFMeuQ+FCtu2dJmL4=;
 b=JWKPZ1GLc7ettwLnM608tuxplMgcE0XGf5EVZAhqIcgr4iOhGN0ARSlRUM6Scbz7GjMHdXp0Kf9He36y9wYP1JFbYsDzPor4zCLaQ0yJMLR0AnKCBYdxoAXgnx0B0tA75x3i9kLHHC3IKRle1cEcwgSgWvUtMdbM/GfmeIfg0n9R3XkA9vdrKNCyJwyoMeVY3IRUAP+8RYspN3hO00PYvKTn+ib+0iZkPR/d4cId5TeldCARzoWWd9zIkgACXwbjf1XmahsgSYJkvSRinUS6iT4J0c8fFLGp6I8p8SNJWe1xevBeytvgzF9P7Ea/tgP5TbawUgHmMEUV/oqUXSo6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQzZnJGUVHLXiT1/vk50PSA0VETFMeuQ+FCtu2dJmL4=;
 b=EMTe22vQMzS9H0q5uxPHGq1Iy5L4UlSK62tKHOVFoaBLvTtzmt5fDRK2LJkfroNdV2A0RE7byPfSH/6k7OyqXQyJBrF2teze8EKequkOQD4eyAx9zi4kAt2q+xXvs+oVnIGfm1S17R3zPklDKfNMv2iKBk+O5pcV6WK2lcutRs0=
Received: from SJ0PR13CA0240.namprd13.prod.outlook.com (2603:10b6:a03:2c1::35)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Thu, 12 Mar
 2026 08:52:38 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::b1) by SJ0PR13CA0240.outlook.office365.com
 (2603:10b6:a03:2c1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.8 via Frontend Transport; Thu,
 12 Mar 2026 08:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 08:52:37 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 12 Mar 2026 03:52:35 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: Drop unreachable return in
 amdgpu_reg_get_smn_base64()
Date: Thu, 12 Mar 2026 14:22:22 +0530
Message-ID: <20260312085222.1834845-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f20cc9-2925-482c-c243-08de8014b65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: t/aXvGvig8/OYq+IOR7f3j/rhFFNMmm9A89LLXFage31qIRNcRJ7DkIaOyFUqqG6wjdKWtMSFrd3hcH7NzBzHx3ZpmvzagkPiJskukXfuQSsVzSkPH/0h9MczMVPwbK69WBqBPE9VoiTYsFPLWjprpIKXb4cPBI6pv8kIvAuN4l5LiT1S6qtQfWFQxamyFAmiJuVV6XtQcfE8/eNJ/d//VFktU24cBIGvoUt9MxK9RNlA/sr+NrODb88Cu6EgivSSK3gVh/SnjYlkrjykTEZl9LoDVVaPuNBIxPtbeU3J37tDIZgk4qVUUl2V2r7kfYy80X9UxpllhGKgW86S+aFqOH7ND0GLQ1t8lqG+p8ayUdNtx22Hs1/ROnOcYxeZXOrM1AN1wT2r/ru59E6ZWibZ+iJROrkhSh4jmsHhi34EOc4BOzm5dTSl4yvQnRmIGGxQZFzi90zMDoMy7MzacDgy330bSA/IopacHs/xG8Z1Ou4qOPKUA5GNw0OpiMCUy2XS3o2+UvJQ2W+LSH2QlS7JJiYqZuO1caYhBBYIOz5v4QaJcCLtyGsFq3GIHvztRFEo9UBi7iOOb7yPTzesn1UZEqXvHXWCGjycz3BKbL6kj18ZvsCy0Qsz1klfAYT7ufVY6sXUlb+wGkOxYmDNar24gLk36sP45nXEEoXaFHgTBObltO2fGadIQCQwzp1UmrgxfFOfZQmdMKmMJn2aB6flxiaSjSpItMZL+KEwi4siSPftDxksPortY1FrICYAWBBAWbS8h5nJ8kVTOOlDNhrcA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nnAjyH1dxthBExdeJx1biAsBs/KFuTEwVC/Wide5YJ5FBIAkiIBWuCfTVFzjOuIQ11wNF0IFtlyG2dDOzOlKYmU4YN2vWB8xA9cp8DsGca/7xQz/vM3Tg7WldTDmRwQq7KGt3DV6r2QsrPjFeuRtY1/yfdmj5jSIOiYzQ5m5zCV4C1kNDv2UqU9dXzk4+P75ZrHEjTOUM8aJ23wtjl6BWlozjtOBcZN5k+CNJFc8NTVHkmqEwVbxMSsYbxgN9UzhMqAkjqC9AKNM0JNLY7+A9XawQcc0WOf7L6eZzpyVeATxP+bxMq7UjzziBbOcqKjTTu+V2grMM/j67wfUIAMP/KxeKnTsxUs2swPxuzorm9Kqg5VzH/9dgDgK7HwUbWCKyC35AOrJISt2720DYoSFfUVtGi2IMX4m1GTqBI1aqIyzQKYfWEC5vrIrFVSWvLoh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:52:37.9130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f20cc9-2925-482c-c243-08de8014b65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:srinivasan.shanmugam@amd.com,m:dan.carpenter@linaro.org,m:lijo.lazar@amd.com,m:Hawking.Zhang@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivasan.shanmugam@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:email,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 5CCB826F2A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

amdgpu_reg_get_smn_base64() returns from all control-flow paths inside
the !adev->reg.smn.get_smn_base fallback path.

For version == 1, the function returns the base address from
amdgpu_reg_smn_v1_0_get_base(). For all other versions, the default
switch branch emits a dev_err_once() and returns 0.

The trailing return 0 after the switch is therefore unreachable and is
reported by Smatch as dead code:

  drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c:317
  amdgpu_reg_get_smn_base64() warn: ignoring unreachable code

Remove the redundant return statement.

Cc: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
index bf8645390bdc..540040c76058 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
@@ -314,7 +314,6 @@ uint64_t amdgpu_reg_get_smn_base64(struct amdgpu_device *adev,
 				"SMN base address query not supported for this device\n");
 			return 0;
 		}
-		return 0;
 	}
 	return adev->reg.smn.get_smn_base(adev, block, die_inst);
 }
-- 
2.34.1

