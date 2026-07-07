Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xu8EAGgeTWqWvQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BCF71D67B
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=DsQ0M+Iw;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71A10EE09;
	Tue,  7 Jul 2026 15:42:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012026.outbound.protection.outlook.com
 [40.107.200.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C37010EE15
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:42:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqfaMs5udr2101kZF/cL4TRyWimLnzsvsFM8WblE5U0Wn58wb+B4Lez/vp4HG3yrmNhN0F1wOviR7e5KUEbVaYYdPz/KaTRgwR+NrXYA8TPuV3Jvw6/pCVA8ewOMztPkgpbpw6fZ+7xzdU+O/iP4fap59TDStPXqbSJ//jE1DZmvV1hovoWEhGE9OvLbFiyqNtHjDGW+XAJ+Pg+KYgUNBhBzMxPf9KQ86o34/pOVPN+/TEDjw8UvB3pZATFuDucBB9yAQ5oKtmIsFfPRk/moQCVrqwiOODFWOUZ6Vzb1ORwxYUWKS1fg3FQjkz9YdNcfOWTJpFwMUDpBD2AaKAPOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54XmM8Z6lYH/Fomn3xXqG2v3jMpKLFIGohRhxO9t9Is=;
 b=gPA1PPf9TQZIHZBBrx504rna5+44vKYC5vzNqmXR7K+6c2fbESA+eRJV2p318PaCPqxTiAllaT8MAzfPuA8e6F3DMDIsIRhhJj1PcsjaYR/2jrXC4R8ZPC+o1MnlFVjQTtwFfQkkoIyghhB53uSIMVwMxBhTlmMwrhDj5O7HWCmuma4wA9QpxN6AeEKU1zaztwMf2Trvsaz5OdCB2dy/gO4aBmgbWA50gAkYQNoZAW8yxJymvNVOK1iQw6kbFB+dSKK3aUxU5tCPqBZkcgxJaEkyVQaK8Bp4bD6UR92zyOb1jcBYxgPfed3RrUDo+E46/g34ZoFFRQF+4h0Sjgc+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54XmM8Z6lYH/Fomn3xXqG2v3jMpKLFIGohRhxO9t9Is=;
 b=DsQ0M+IwZcZ/PsENPYjv0mQMrRaYGpoibHpCvV5EVfwX45MGrwu9XQwPKIKeAroGUtof7IRMNu/hVnsSbkq+EGMOvHmxsfRw7pG/4E0fSjtcMMmG2Q9sx6lvPr5x2YDSuKhWO6TiqRGBKyTXMvPH3Xes8ALL3NM7NQC8Dz0OFoU=
Received: from PH7P220CA0059.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::23)
 by PH7PR12MB9254.namprd12.prod.outlook.com (2603:10b6:510:308::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 15:42:19 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::9f) by PH7P220CA0059.outlook.office365.com
 (2603:10b6:510:32b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 15:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 15:42:18 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 10:42:14 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 10:42:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 03/30] drm/amdgpu/gfx12: WARN() rather than BUG() for invalid
 SDMA engine
Date: Tue, 7 Jul 2026 11:41:36 -0400
Message-ID: <20260707154203.2603209-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707154203.2603209-1-alexander.deucher@amd.com>
References: <20260707154203.2603209-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|PH7PR12MB9254:EE_
X-MS-Office365-Filtering-Correlation-Id: c04562bc-570e-4d12-f6b8-08dedc3e53df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: C18/nwK0O4v0LNzdE/Kib4Pde/X2eqCYIcM16sTZAuvnfn/As9Nur0J4EzHCdTGfih8QkeUIssE3nK6IsPR4d/Y1c7SGDrELwVcMgap8uyDRrhpwim5TY9sfGGzy/01BdayomPCdDttjM121lG/f8mczoZ3YSsQNXKv4szJXYQjPcUulsgOSowsSbzOYXHpZQN2wN0yo3CFpqE0wron4U6Op964tzXWoZii64c2USaO247G5lU7kRhX4cHhZTnq0Jh2wy0/y1ne/f5DI03nhGw4U1fO1vZLIv0jJMyFRxMhJE+jRD8zyVkW7T/sZdo8YkKWbSq2qvlSevp0T18Z3HIX9Om39bsUUrBrZ32qGxpoeNoRuEUFVYiymCA+vlcvF3gOvVVYzGHhUzKdFPhWVGiu8jeiGFYLkU62jkGeUywXfWP4HUJIB58JGjzUGQfLx9nA7Lz3/oweFJRY3N1fVCEf6vjmfMxN/LFpxiC0t0/6AxoZ16niZW/KexCtMlyWkwAn5tsebnG4RchVrBswxqWHfHm2toA5fwCOJYqMogCk6C39BXVMlx/ukzpBZKIIODCLmx51YfyHPXcxXLs+TNWf4fjYdIQHDZ85liPg5xNsDQfBVMFLCOs+On8EexTMoUM11MGpgfPHho9nnD0u348E6KyDfPy2wWCPzOKsMdrnGjsDyjHoiEB8zXBPQAAxHWdclTWJIB2pwUXtXBeTpJg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yfWNMKBp5dF9lRMch76vIdJngtcXQHtwHB74/OYebKNNtjunZIvqc8yX01fV/xbVge/2jJYg3CMJwzsAQ43kXHongDdtDLE6ODy+ozo3clCzyHmJnSgi0enOPhq0M4WY4brlemrpbHgzjf/0D6DCF5aqp42J5z7QQz9AhyPyiyMT2ZKn7qzLElK3aU35HNR6OL4jli68nCgZ1I6vTFYWioXHvONodrfV3pD/KwBWOAZCWEzcow1fT5HRDXM1w52sS0g1XZVQxP7KQ6rIHlE/rQPQRAKrCGhoUTgLG/sS4OKxZi0eGq8Oiy3qyLSquZsClPYmJfUQ5zWpSNpOVskZmwXXVTLtEGNbQ4xrLWLo95Z/0WnuOfVzwttABVto0rJfkElY6JMF21PA0nyFhqURHCdomaWvbbIxY2UvG8aYi0/7sKErvyLGwqarPK99Hggj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:42:18.5622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04562bc-570e-4d12-f6b8-08dedc3e53df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9254
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
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91BCF71D67B

There's no need to crash the kernel for these cases.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
index e0ceab400b2da..f37d51ed9a6b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v12.c
@@ -90,7 +90,8 @@ static uint32_t get_sdma_rlc_reg_offset(struct amdgpu_device *adev,
 				regSDMA1_QUEUE0_RB_CNTL) - regSDMA0_QUEUE0_RB_CNTL;
 		break;
 	default:
-		BUG();
+		WARN(1, "Invalid SDMA engine id %d\n", engine_id);
+		break;
 	}
 
 	sdma_rlc_reg_offset = sdma_engine_reg_base
-- 
2.55.0

