Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +N7cMWVKPmrvCgkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 11:46:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356E6CBCE1
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 11:46:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=RmzxvsI0;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B87710F52B;
	Fri, 26 Jun 2026 09:46:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9883710E330
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 09:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSK6QiJkV5xHj9OoS6bAYxHh5b+kmVVO0mPr6vzSF3WPFxzD/S/oAw7db5EhX1dMld+5+ovwQKw6bNIIl4iAuX+GM8EMuqgFuxVJAo8F6UinevzYWzPiegFjvHyjDnxP5MrWuTIx5X1mwUpvUd5m6XAVt0B9ZfU0TeJY+DxyXiGXY7vjDdOMsOpXvfg7auJWHUVagvx/KD48NQVfslgL8xTGtXTk48tbgLbmIu5lGta4Exw6lsltFlSnS4S2RJfm1NcFI+rTIkgjRL4nRcKYVc+PTAMlIkN9lNq/bOrhshZIe+Iukdsxam7omvLOidoc8kB3VFzTYy13zOByavFs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AlqeAr7C1nFm7HF8XtEj8ttmV63txZ1WFVCBGVDp824=;
 b=rd/4258re4WBTTmExCg3kxMRbVPq9I/X4UPuX74kAr0XeD/1wmM8HaFfjB8yDFeXSJV8qjDsgBq8ED47/Lb9O0w1V9sEGdX9uJJkpjikGqOOYFRKspfxc1+ptM6kz6qjMbROtXJ+9jCAo/etQfj860eSLGCdob0JZEGahaKz8khg0dlvzy5JlcPRY3WD54GQ85PB7PyzKjNpNXv9bu6S2So/sDlhlYMXU1JA94a8JHBsplKt4gA02yhKjweBKmiOdnWj7dtwEMDqDDNibM1Kcbd6Pu5aMQeHpa8j5WlWBXxU1ldgIZPzaP4E8N1EzIU8wdbwsb7BNlkK3wYmqj9/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AlqeAr7C1nFm7HF8XtEj8ttmV63txZ1WFVCBGVDp824=;
 b=RmzxvsI00p7/11mIBIpAo5Gq1AUh8QUnh8Xg1nY/L7AHS4AwUCIQnvJcVnRJ7/PBmF+p4rKqAv7bZD/mS9/8ClUE9jEbzkp+DPv9cUb40mLeKDtiKZEDfkBnfcDQ3ToXBlHaJ7IJXSkSlfNyp9zGaLsyQmv2Y0H7U2LD3h3GLqc=
Received: from CY5PR22CA0065.namprd22.prod.outlook.com (2603:10b6:930:80::10)
 by SA3PR12MB9179.namprd12.prod.outlook.com (2603:10b6:806:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Fri, 26 Jun
 2026 09:46:07 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:930:80:cafe::4c) by CY5PR22CA0065.outlook.office365.com
 (2603:10b6:930:80::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Fri,
 26 Jun 2026 09:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 09:46:06 +0000
Received: from granthali.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 26 Jun
 2026 04:46:05 -0500
From: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>
To: <Alexander.Deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <Pratik.Vishwakarma@amd.com>
CC: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>,
 Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
Subject: [PATCH 3/4] drm/amdgpu: add support for PSP version 15.0.9
Date: Fri, 26 Jun 2026 15:15:42 +0530
Message-ID: <20260626094543.1195245-3-Granthali.VinodkumarDhandar@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626094543.1195245-1-Granthali.VinodkumarDhandar@amd.com>
References: <20260626094543.1195245-1-Granthali.VinodkumarDhandar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SA3PR12MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: f478729d-11a1-4be2-0f2d-08ded367bed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: pilXuVYBcdQAxVdrNvEubVAiYL2XrL/lmL2O07ZH9+Zr9q3LKkuArfzdpqI6LzYwynTHx8+6C0v76E50uDO/nrhNnpPHOGX0OOT7LbIVzMWcRBS+fP1K+wZpuPl7Dwrh6QQIpfN/6g1+GA2VVDmAdluuAQsA3z1HbLOJv0B97bXSicmBaMWVHR0Jw5NTJkozRSdY8IQQjl0dz8d/EMNaEW/88uiZA87/yVDqnYc6Qixndw6bIpSJ5se4y3zNyaJYZVtDNQ4uCzQGHl5kuQN9kOyIdcx5W+HxyMsodeV9Lfc2NYWSL9HAh+H6xW0fVMiKsdvdceKhK9rOI4oOXGpbiAs4XPwsiuxD4kCQAGjbzm9av9TQfEsnJGva9phkeF+ZiQ7MKojGDRNiH+TnwUMDG3A0QY8mQZb9i9qMWWIf+60KiJIctb86iV1hSA1L2R3w44IcaKjsqNr9IzyjG8UiH7ckcooDYBSM/v5aMdQJ9G3rprT9hJNbpgmWnY+2B1fNCLbgAZipNkQ3HIsRpQ4e58GamygHCaMipgM4uvp2458B0FApQir0OLiZfOtUqNDKR/3VqYtNPmQnvTwPV2kBVLaIez2kSkiYMossETS7EpnS8Fx0vuP3oKdWdZXNmP03tsNayLqB1KgREjXvXcy3086hELI6d8FdlWVYAHg6ofGphdGmk6W1unEA8kxz89euYz/LIT3NkH6BfadDkpiczA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JctrYB6QGUjiIWuSF8kj6sW9Xq1TGYMZkL3/NwzAVevjU0XrnkjhWMgxgV2mGn7q53yOe1KISb6eTTxtszLjEqP37zSGNqOcb8wvBZQK+01x/DYh4NQ+qXaGIVPXprSPPwgcatO40ZqSndM7DkqyJ9clA4NhN7cCTbN8ZcQ76OOPhSTpZWosMtlYybwLHmRX6etMIrCKFwh9UHQIs85IU0ui5y76nTIFh227nUBy1NZL67IUVP90GfyKmifprU9aQE+EYUDvH51tqiLgB8v9Fv8FH4wKCYonNFDX/uPABvBJRCyvnuoaYXWa8P8l/RVz3wDQpAiW87+t9iUc+xEGpSLQ6R2TSTPqBF5jOd7LQkIhhskZHUVxHQ5XqEVIcYCb2ld94w1VDzjMJFXyCyXnhVe/wvLPQGTuXBY4mpOtjgPJY3FMEeN8NJolS4aFXnFz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:46:06.9672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f478729d-11a1-4be2-0f2d-08ded367bed6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9179
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Pratik.Vishwakarma@amd.com,m:Kanala.RamalingeswaraReddy@amd.com,m:granthali.vinodkumardhandar@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Granthali.VinodkumarDhandar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Granthali.VinodkumarDhandar@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7356E6CBCE1

From: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>

Initialize PSP Version 15_0_9

Signed-off-by: Kanala Ramalingeswara Reddy <Kanala.RamalingeswaraReddy@amd.com>
Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index d345bea4f390..16606155a92e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -2521,6 +2521,7 @@ static int amdgpu_discovery_set_psp_ip_blocks(struct amdgpu_device *adev)
 		amdgpu_device_ip_block_add(adev, &psp_v14_0_ip_block);
 		break;
 	case IP_VERSION(15, 0, 0):
+	case IP_VERSION(15, 0, 9):
 		amdgpu_device_ip_block_add(adev, &psp_v15_0_ip_block);
 		break;
 	case IP_VERSION(15, 0, 8):
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 4b91a22701dc..a36cbfc1f6f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -275,6 +275,7 @@ static int psp_early_init(struct amdgpu_ip_block *ip_block)
 		psp->boot_time_tmr = false;
 		break;
 	case IP_VERSION(15, 0, 0):
+	case IP_VERSION(15, 0, 9):
 		psp_v15_0_0_set_psp_funcs(psp);
 		psp->boot_time_tmr = false;
 		break;
@@ -3475,7 +3476,9 @@ static int psp_load_non_psp_fw(struct psp_context *psp)
 		     amdgpu_ip_version(adev, MP0_HWIP, 0) ==
 			     IP_VERSION(15, 0, 0) ||
 		     amdgpu_ip_version(adev, MP0_HWIP, 0) ==
-			     IP_VERSION(15, 0, 8)) &&
+			     IP_VERSION(15, 0, 8) ||
+		     amdgpu_ip_version(adev, MP0_HWIP, 0) ==
+			     IP_VERSION(15, 0, 9)) &&
 		    (ucode->ucode_id == AMDGPU_UCODE_ID_SDMA1 ||
 		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA2 ||
 		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA3))
-- 
2.43.0

