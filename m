Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBLrNK3wumkBdQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 19:36:29 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE372C1671
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 19:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8881910E71D;
	Wed, 18 Mar 2026 18:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="db7HtVxy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA2410E43D
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 18:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7Luny/6l8OW29yjnZlxtu1lL3LwQccg5cnmFBQ0ytMI0xFICFnhIRMISxpR1PLbysUbd438TnLlJBO702YLAbgxOn+HqvFdqPGaN8baE8jcNakz8HSDi/AE3Z0kdOw94++fPvrdut37hkdrSlr/zvcq445vLV87/3gU6aFcQWEI4e7OQHgHp8CcHTZModlqpGXZ8fFgwVKv4ll2kQ0v91h/Ns4ejc2DTE/IWWTPFLhl9qpE2ndui8K5V9qZ6z+RjiYys8V0HjtiLrdfSVzGJyZfGKf2B8SXaAqQeRnrnNvW8SOZMaDoIp8sPe3QV9u0u8+Tsm2IGh6szHlLonRhCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/U2hAl6pNYHEZxeNraVWrpHejzV/P7BrJFtZ5JLQAfE=;
 b=dk3bRH1N5Z6ovu//34CNS38LCwPWBs5pbcP614ZlUdmDe/D0j6zYKPQSC3yh7RYHPqQ8DUGnnHWsLi2augsT29utFmByTIjLlm0Ttdm86S22Alt4SSOFsCCwklqZEIjTDSbEM+EHfIHiK6NZXLNcUk06Ktbj7X8zz8sntn4y0T6lrL0VdrtYiX3q65s9mSlQErw0NMsL8wtEBF0sQfATl117j7A+QjPf817wzizoIta1ODvdU7jNC43vXk7Ryx/BMAGtbK/yDRMK0x1hf6x5wXEkTOmVXhwKxPNw3lRPM/9AylEioFQ1YquukPSKVi3RxVSZGXI4QEOxnSZULD1tVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/U2hAl6pNYHEZxeNraVWrpHejzV/P7BrJFtZ5JLQAfE=;
 b=db7HtVxy2+VZzc/ECymVmkZID5E9PwckzLvCCg8on/kT2jw3RC6SksRbjR3c9Dn21d8ZSxeCbcYRDxRb/jIdJyyRDTkK4VIMMj+ctQ7DjHzQK58dJYaCdtifhhQWT1auKFvOUJ5QvAVV80SaMi4umJ90jS5byOZ1AyOIRG04NbY=
Received: from BN1PR13CA0024.namprd13.prod.outlook.com (2603:10b6:408:e2::29)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 18:36:19 +0000
Received: from MN1PEPF0000F0E2.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::f4) by BN1PR13CA0024.outlook.office365.com
 (2603:10b6:408:e2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Wed,
 18 Mar 2026 18:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E2.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 18:36:19 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Mar
 2026 13:36:14 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Mar 2026 13:36:14 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/7] drm/amdgpu/cs: drop early return for guilty contexts
Date: Wed, 18 Mar 2026 14:36:03 -0400
Message-ID: <20260318183604.16505-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318183604.16505-1-alexander.deucher@amd.com>
References: <20260318183604.16505-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E2:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c0cd65-5cd1-4158-2893-08de851d3f16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: bTEbc8CE4Ho50BsnGzPDTLFmKZOJOT5jIYjgj+h8qRJSQxfNTbKQ0rWBk6IxBoGfjZNHH9XUYdL7znREfNRKKjyyr++qwSWYscnakLjeBKZaoX0/xwd8uh4lmoFCiYW16Ovgm7jUIr9hnFV8Dt0pFdiJIijRUol7FLUR08WkWVhJS5RkoFCBLCIfTxKQkD2jochPaxfjN8dKyJzYMgLuRjYId7joc259X3vZg4R9kL7ns9+x12d0Wsb39YqsA9S29hIUWmKRm9bwnT5kKgbRGuW8eGpuo8Rz1Dj9DSjLcF/zq4qQWEDvEvY6p6gpaOLZd8I6VaXq5c5yGE54kB/qNr8xy+lwSXdlJ2PyyyqqYxI+GYtfqEw0qOWfRnblqP1o4a5rMj8zy7CgJX+MdelxpfbTp/urlcGNAKrDMXVwdGbn6caP4Y7roC8I4nwLjrW0zTep0ZPo+y4eDOc5DMjg+guEXaRyCGG81iqTAVXAIJynVy6CCodIB80ibBRP/SIYmlhryrROiXwx6pCcjvHtqBu3Xy8IipW4OIph7YcTZn3OQ54CC66FBMFQFRtTvZM9O5mUl/xDIDSqJoEQrot5BgkCBzu8+RH22keZRsC/2M5cbTL89Qfqq6VCNqjMdJpTCesOVMqfiHW0lvhqlBrgYdbsD4JxuYRR5ceHdTj2sRAwc7A1ne8LWgz8WxXTbl/qRji5K1BdErXUeaZ6QJAs6R7mk4kCxQyJfSr0/YsbkPGuDlIH+1wy6gtExAGAVO5t07+3N0jiZ2OJ8FEIEN84xg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nJKeEIOxgDTTMniIk66/ecV7rVbh2DjCtjzDmsT/gGN74iQ9gKPcQ1RBqqMmipX5OhYI7+crjwrW3ovUpI0haRqh5A6LOTyYNLu5+gT9D3t/XvQRk2f0KXByDeCKhGC77UcwUmUSam+m/yGLdNFjV30dP9FAKro6y9/sCfqEwMQkPsT1pmmYCIi9KVY/omCEa+Z1wmADzZLMUyxKfcQoGxOkGk7LK7cfu7tgHjPOWgE53u1IkwCagOxXwZpF2Q8IWLK0/Qyo2hpJ+jfv3IBaJvnxbjjXgl0uPcCJD4WwDn04coK4i+C3tPHZkOTWfd+ci5foAQgTzM13wDPv7WCNiRYyP2dvHjOL46FrMQu4Ox7O7ICaKhaHL6XLPxZVjB8LCaFehpI2gYeSWvcYDIGE+huJOI6Om/JqnePG71cTIn7XT2y5dYdJKtPWmMDWOlLh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:36:19.1714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c0cd65-5cd1-4158-2893-08de851d3f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4AE372C1671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The fences are already marked with an error and the
scheduling entities will reflect that.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index f75f5079be80f..31200332312a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -60,11 +60,6 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p,
 	if (!p->ctx)
 		return -EINVAL;
 
-	if (atomic_read(&p->ctx->guilty)) {
-		amdgpu_ctx_put(p->ctx);
-		return -ECANCELED;
-	}
-
 	amdgpu_sync_create(&p->sync);
 	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
 		      DRM_EXEC_IGNORE_DUPLICATES, 0);
-- 
2.53.0

