Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MNBZBPCeKmpKtwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 13:41:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC167178F
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 13:41:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=kmUd5wdN;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A22C10EEA4;
	Thu, 11 Jun 2026 11:41:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012053.outbound.protection.outlook.com [52.101.43.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D4710EE9F
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jun 2026 11:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOGc0pPMzEYPyld6fuf7aj4jdn4JTbKCYdw4UTHONxy1ERcwTzeKDlAYaJ9uhIK6/21lqyILPRWTXfbHjqQfLjgKe8YEoR/o2heBzCV176mPIm7ydDMfE0doD5RAaYB9AzjgWQg/ulFxIYC0GwNnNYgfX+OSR4GprrC2GdYknRFAAnFvG88wJv4RudKDu28ANe5FPnUKInhxO2OHNq2l9bttp7cKsTdGGh/VjIqzJIegc3IkLu8KORca+ZDgYWfaA99wya4y+XpBrgsnFPyJWJ50jbfhZUHwL/flAgpmE+IpyUlVtYMoW0sOdwpl+jbaN18Gjp+OPBxQV8Do/HNRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUJ9bPgkvG7mUTmtAxNUvi6rWXigZg6pWSjd0Gyg+r4=;
 b=XRJasVMb2dRZI+CZVObNuuhtUlOrtAtVQkAjq9BYQz3ngcTvon8TEZAPxXqUWxP4Q3IkWUZSxiCST8Cj8NTsrElWYs1WKHzIZ6nJetR1MvKYNaeDGEr9oYGKGso0n1exvyIu9BUt3dFEB7XqXFbrJfBhfiWrxnAo2bWKd5y39xxGPSl8iWcRQuY493fugpASPyjwgMoonojkc4O9ILHlH7veTfMgx1EgBPpjEx4OYv+4s0Omiwy2Ax+AqqJQIGiVu+DnyVwuvrZXKcts4elyVd35dy6P+avBtdF7W+QeeVJdew5Hzsb6awdyl7jPZyMU3xslboimQ7AIWj9DBMvtPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUJ9bPgkvG7mUTmtAxNUvi6rWXigZg6pWSjd0Gyg+r4=;
 b=kmUd5wdNJUidhUXBsKfJxyYH+jpr8R4LRod+RMWmIu0UAj+ZG3SXDxHhGaEr6mfgxwkp+yxWLeL4jKigYh6Cc2BEv3eqNYVuGIF8LoQHUNF/1BGWz09AU03iMCauJ/NugBcw/YDIU4lBcJjg4lncNq2O/iYCQg/QnKEgzNufb4A=
Received: from PH7P220CA0077.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::12)
 by IA0PR12MB8837.namprd12.prod.outlook.com (2603:10b6:208:491::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 11:41:28 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:32c:cafe::35) by PH7P220CA0077.outlook.office365.com
 (2603:10b6:510:32c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.14 via Frontend Transport; Thu,
 11 Jun 2026 11:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 11:41:26 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 06:41:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 06:36:39 -0500
Received: from rtg-MAPLE.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 06:36:36 -0500
From: Priya Hosur <Priya.Hosur@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Lijo.Lazar@amd.com>,
 <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Mario.Limonciello@amd.com>, <Kenneth.Feng@amd.com>
CC: <Pratik.Vishwakarma@amd.com>, <Veerabadhran.Gopalakrishnan@amd.com>,
 <Priya.Hosur@amd.com>
Subject: [PATCH v3 1/4] drm/amd/pm: smu_v14_0_0: add DCLK metric handler via
 VCLK fall-through
Date: Thu, 11 Jun 2026 17:06:12 +0530
Message-ID: <20260611113628.3217-2-Priya.Hosur@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611113628.3217-1-Priya.Hosur@amd.com>
References: <20260611113628.3217-1-Priya.Hosur@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|IA0PR12MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: a20d33ef-456d-42ad-afa2-08dec7ae5f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 4/LrGRv/PFH0h7v1su+YtniATa3uccO9HHTHx8YZJzj0xrn/jVxGbvZr1/oq9upx+6+UCIEQAUnY50+F0qR+gHinvp+/etSUCROaTbnRFV6kFYAfRv3LsNk/xsS//HNFbmGGkM3n7+VjVq7KUo+50MtE43U5izj4RgWW4DFpWkJtXQccXR+bogVABY8cBIFEivOwXQx1MPOJdONDmcb4+Q2ZfHtxQCO2LYtRSIOR/ExSqR83kMwCar2h0Sv1kUaoKTNAGK00nq6DkNzx/IvmwndhFzzFTehlUh37PNpwf8gtgC77kGiVziz9on3FimS7OtaXV+TzQHrmNH7v/InmD0S11NIg+5MCobjJBujX0CIurqsdvfMmmAqOdmFLn2mPTmHbTnxdiUCVm9a7/8IH75mcl+wgyBBFHVG3vKBM9ih/ULKUVfitgMxeBFmTkFQ+t9pXBN80YHWzHL/0go6dXl+BYCuI3hhgVYZqeGdIqemAHK5w4qNevzV6QVQdoX/HGYV18lD4xLA78JU8t8hzGAoVXONlTiRVzRagm6HpK0YnAT+tOOl8uqy2TIWPDuEwU5aqDiHaVXwNe/XIFhPOOOfR4iZGSqiG4IXI2q/ttspPdroFSHKkNVbDWW7Td9MNCNRrupp6Fu2vDp/K34eZuaqhVOGHq4uHW6ggas1zQ5xM12kOpkk83mXV5zdnbwaMGdgbR8PxZiomH0xOR7WDUnoHW9GmMSPh/mZOBWMRw0Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9bBYpi4uUNLgo0DbU2BkAFxC+jIJPIZK3O4d9iu5RWhAqfTtsG19oMmDg56c8aw5xL2/2BHd5KlolyQn12M4hWE9nAwzbmDmm//MRvxSuIoZVVVpoGFMXYM5+NHjhC1BEmNY+1wOQaTsGFSLgEj1DVEKJI8vbSySfNkaFl+gzOuBz1VmSbN2ATCUCvPxv3KkOhyXP/fRBxrKZ4DoAShooQ6Y4HEedf/k4szpe2J/fh+74x+VKOukN49XXJpP05p5JKJgu4BrLzA93Anknx1bwOeWhkx2nHlM8+rdWakUo552zBCOUThjrrDheOlQ5AjHoOIKx4r/UAcs2ZfJvTnj1+zQAmmz1O1d05e5UiNuhe/APO6yCiJ+DTtqSSLbN+akpxl/84STnlhWP//hfqNZ5rF6lAY0X+yKfH6otNM7LXOLgZAlt0wE2Q2BH4o8hofg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 11:41:26.8220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20d33ef-456d-42ad-afa2-08dec7ae5f3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8837
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[Priya.Hosur@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AEEC167178F

Merge METRICS_AVERAGE_VCLK and METRICS_AVERAGE_DCLK into a single
fall-through case mapping both to VclkFrequency. DCLK and VCLK have
separate DPM clock tables but SmuMetrics_t has no DclkFrequency field,
so report VclkFrequency for both.

Signed-off-by: Priya Hosur <Priya.Hosur@amd.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
index 2fe006de927a..eeb508336349 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c
@@ -281,10 +281,13 @@ static int smu_v14_0_0_get_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->SocclkFrequency;
 		break;
 	case METRICS_AVERAGE_VCLK:
-		*value = metrics->VclkFrequency;
-		break;
 	case METRICS_AVERAGE_DCLK:
-		*value = 0;
+		/*
+		 * DCLK and VCLK have separate DPM clock tables but
+		 * SmuMetrics_t has no DclkFrequency field; report
+		 * VclkFrequency for both.
+		 */
+		*value = metrics->VclkFrequency;
 		break;
 	case METRICS_AVERAGE_UCLK:
 		*value = metrics->MemclkFrequency;
-- 
2.43.0

