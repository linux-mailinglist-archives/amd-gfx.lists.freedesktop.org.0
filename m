Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22JiI3keTWqpvQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394A571D6CD
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:42:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="q4H+XP1/";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D0210EE22;
	Tue,  7 Jul 2026 15:42:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C210EE20
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:42:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/PVsn1oyRFg2HnsBVKhrGw6Tn4FekQnsoliVzDKUcWT3FaIge+oJCpmcb+KNg2Y69Vn23siet1i6+m/LgmV3gI5QRR6LRxVa7QpyPZ/sMmjZFHqKQ/85g/4AekPviI0jjqncFpXimvfU2f9vQBorf6qVThlKYcEDNmaBs+oPC7LtK4USvsAmqSCR+lmikV0T7ln8qDc6G384g81EZkJSDNXFchSu56D0QVhj+zHRxivzG9PyPwKs1x/Jyv21I2eZdGD6ejZbYCf+rpo/Ka1WHXcKC6rbFG0b9RU+/uK/LcVHrteiK2/BYx7YKojpiI2n1fRV4TDD8hSPqp++3BeVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4bMV9Tk32o89hVenfpyo2eZfPxTUDnE/JxjSrpUE78=;
 b=ek1iNpNFCCDHQcfbiQg0qkMwpiKl45rLz/eyJl4kTlmfaJgv1kMWUkdjEz9u+bSm33M2YI1XIQibtXdh68pnzE4PrUPxTIIKVKEqdzOvQqwIeyUFo/XctfB9qADJtoNDZqTb6rFpY2Q9AEE0LnIenD0cjnkUfpFc+/kpWmFdPHLG74BOcGX0mzGSqb+WibXdoPn3VRhqW3oZ/tnhvV9jqjZZPMxTSBLHtTucV/a4LTHWlbuG6+V+Fs+7v7rCd4Vu7Wdhm7MIXCU9jdSc6wyn2XNggea6GJ7GuhEQXpRgY/0pBlTZjLNEvNu3HXg4Vwo+l+RAykXJPlaQym6L0bowTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4bMV9Tk32o89hVenfpyo2eZfPxTUDnE/JxjSrpUE78=;
 b=q4H+XP1/rAijs/VJ/FE3+rvRWtXPO2/TU/hZlPewIINYUHP8cFNsJ8kUjfS1ETMIqrpyp37wJkpuD/Sx05klFPuGC9fcGvHUM3SESoBiKKq7bRJV1wSDQ/TnI1S5edfewBaezsOmX1EWhsGpuElEohai2gxKWixPxSPlb1TJVz0=
Received: from PH7P220CA0033.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::33)
 by SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 15:42:37 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::96) by PH7P220CA0033.outlook.office365.com
 (2603:10b6:510:32b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 15:42:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 15:42:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 10:42:28 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 08:42:27 -0700
Received: from p8.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 10:42:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 21/30] drm/amdgpu/psp14: replace BUG() with an error
Date: Tue, 7 Jul 2026 11:41:54 -0400
Message-ID: <20260707154203.2603209-21-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260707154203.2603209-1-alexander.deucher@amd.com>
References: <20260707154203.2603209-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SA1PR12MB7272:EE_
X-MS-Office365-Filtering-Correlation-Id: 19b9210a-7c83-4d6e-a4ad-08dedc3e5dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: BaByljN8KMD/fcdXGlPefbOihv6CDQ71bc1rcHlg+/D9MC6Arx2K/bJ+L7PR6DPyd2WMTbQrl04T9gdbUztHmDkWeGbIUJa1rYy8vCwwHIUHmzNXPK1oNI5hQ6yDjerzcSkZBKJRCGbl7/qqGAE5bLh+2+peA0XmPHFOzap6BeDqmMrvv6aV+HPRY9D470Kbt8u0mT4MN2J8TC0rsKWGehflCbpZJPdQ4etZUbt0yQ2KFm5BEpRaRQlkCV/tAGxK1sUdhVk2TM12QZW76f6CPZVAg77J6bs41KuWbCctH7cq0Mo+DGY0AjHpcIDh6v91RrccoBbpa+gB6CEU+tnj8hQuQCEsM2AUdnxjiY/mqV+DkymlsNKT9TqzpAiMOxvjQ87x3vlKlYVNrP/cWyqrRZ9xqphVyxiuBDcCFI/5dJe0YXW61aLChZYBH7wQ8WcsueUDDKBo0AFtr3GXaRIhoiQ41ewOCR88w+B3XfosF3R6Tm8o/NUWHlfkyTEXfPpJXB15VP8pS4Y3TkTYn6lrd+e+jEXdfPWgQNc5CQzGhHdNOkdHzEduMoOqlYYoINVN7P3YegncJgxnYXuhBB4BA16K4kZoXPZBUWd9r/44Y4cMf+cjZHAcywVtdBtcgcOguePKUoJVbq27ezV0MfR0hzUQFH+Wz1LMZNup97Uy3ME/j83c86mZYYrgjecRG5m8j55K8DaaEJK4xBm04nK8bA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yY2tUYefR06qaR0qg1QLZK1GzJWGI5XQbREzkhdBqz36o4JVR02lMq2CSGU//pVjQLAoAyy61xKv4xkzLsL3ECJVyGqvX1tV9lI/+N6F2JPXBOyv1KC8K3UzGYft7a8zlGQDanvCXzbhBChZ8aRvxvTFiWg1F9OQAd1urMYeMbQkKWLpau2UE2VRay9Mk2ty9gT9D22mEgrtHwTP7dB8ytJHyzvVjspGulEf/IX02TZKKunO0GwjhiyvAObTPTgre2oq8oNRxSPkokSLeqi1i8ch2d25FFiGbjmQtsgXZs/AsUOyc4OIKLfMX2N3YAJx8G4xP6EWqRAg54MFfHJgMuqej4bcO9er9a1xhkmZjHGlJ0Q0cQTia0RRs0CIjhkLMkUWLGJWrvkZyKcoLLlg8+WR9QVgRvsls1Rdgj2P7xX9NgIUTXycwBI+eiNTb82o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:42:35.0963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19b9210a-7c83-4d6e-a4ad-08dedc3e5dba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7272
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 394A571D6CD

There's no need to crash the kernel for this case.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v14_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
index 040a61aefa866..7ed5f41969330 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v14_0.c
@@ -85,7 +85,7 @@ static int psp_v14_0_init_microcode(struct psp_context *psp)
 			return err;
 		break;
 	default:
-		BUG();
+		return -EINVAL;
 	}
 
 	return 0;
-- 
2.55.0

