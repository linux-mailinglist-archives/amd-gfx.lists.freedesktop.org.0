Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJB9KhYbsGlAfwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 14:22:30 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1692500DD
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 14:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A5110E295;
	Tue, 10 Mar 2026 13:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qwiv/y/v";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011044.outbound.protection.outlook.com [52.101.57.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0EE510E286
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 13:22:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z6NI3bcGJ9TsYIHEj/83wfgyJgckoNDiuy8/HaYbpzxOTsDxLEP9Plc681LGGrYIm6brO0A2k8QXTk4Z3L7Zwse2of9vSJobUk+n06vyVlh3JgHYNe0K2YKO2v0V21+1Au6XpMNBfUMRJtqJ3rB7VpXH/MBLd0nKH9q7wMmq0LEFIPXiv1jPchLUB1RrvfecM2/73fZIm3K8r06ol8tYqD+M5rQTLPKkf8S7QLSvUJLn2eYMf6iFmo6YCrcd/itrrdZCJuaqpRjO5uOvsgY0pZbUd9nMBoQnaDCvpM1UzoR0Mx5moYPNyEbwnKEy0kZae7A2Actop12xszziMFGDmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rO1opaUagEBBUPVUnbjkD+rP5qjkQnSNBYcfqjkOvI=;
 b=L4bLbT4ZSCQD5uWn+RTq6RDVieoYgj43TxwclyK2y5QSWuOLYpPHtJpujelbz2K3Sk7wHykAv9wwwvP0ydX50VkIk+udSBusjw8yGdZJsa+z20T+TIme4dZ5ldp9b786Lu717mY2wADu1noxcXzGqIZWHMGZ5LRIurqNLerO/1zQq6ZdD1ao/VwNMGTbqdJzbnUsSWZKbQx3++vlvRJ+ElOSmCWcH3iNU3cq+OJiyp31B/Tjw0vngevsOdstkreBLWlVVFcigaR5fQtWvbcyWhAX/MYz7Q1jbPpsiF3lMYWBwUzqfOm3wJa6ND+Cq1GIDulrh0ahfkMLaOq+xZT6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rO1opaUagEBBUPVUnbjkD+rP5qjkQnSNBYcfqjkOvI=;
 b=qwiv/y/vucUZy9Suz/bHnxWgewU1w6RfbY/ad7OLcgA9Gq2MMQfwo2wKy/4mx/QIVfJ9djoQuQmzffaj5YrEmB8R1TWOZKyvEs6UsQ6aPB91Hy6Ed6egv3eEXjUp+yaCfMcRmipJlPPynAO1rURIJIf5fCGd5ZqDqA3SFnbSHtA=
Received: from BYAPR08CA0044.namprd08.prod.outlook.com (2603:10b6:a03:117::21)
 by CH8PR12MB9767.namprd12.prod.outlook.com (2603:10b6:610:275::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 13:22:23 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::15) by BYAPR08CA0044.outlook.office365.com
 (2603:10b6:a03:117::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Tue,
 10 Mar 2026 13:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 13:22:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Mar
 2026 08:22:21 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 10 Mar 2026 08:22:20 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: YiPeng Chai <YiPeng.Chai@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/4] drm/amd/ras: Add unified interface to handle ras
 interrupts
Date: Tue, 10 Mar 2026 09:22:08 -0400
Message-ID: <20260310132211.2867415-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|CH8PR12MB9767:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f16f42-f170-411e-930a-08de7ea80ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014; 
X-Microsoft-Antispam-Message-Info: on4ia6FQXcUP8VqnmoAHA8CN6EHNzmsScQeSg0ojJ2JTiOWG/PKzHXvkAU29ZoHHCXCQ5SgtqKUkdX4JyXbZIcMIsAsPtq/4XKSf1vl1Cb5xqdi5Kf7ppiSOFTamzbjQ80ov0P1rvGrNvyAsRB2PdD8RP4uFU9lbIFC1E4TkSSFG8IfJxOONI77z4XjhMJkpEtRXGMXN8gFkteae847wZrahGHQo38oQKsNs/SHpzG4TkHTYtb3ty2moy12e34JEeGi66dj9KxurOw7JWq06wEKhM+RcRI10GBoMLU81sdnpZxVyUgIfJU6XFluM0GZaP8/aDqvmwlpdVQy/3pUOkABLphB/r0waxLn6yS4knHaF6lL5qvXCWg5q64MTGFPdesJX3PKwe6uJ+etgOG0JBPctnvL3zYBn/6tRs12XnTRmQboxouKfvDncl5yee/j7RfOjhlnGBTS0YS932Byqwlj/Yaso7RGX+I4bD8bCq/JxLSQYcoRJmDf7aasLTMdkSbSsT5pZUW0rP9IEL5OxKtNWUl6DSsCeQE2nCfebrIioEzt4Nt12v2TTsdgq45kLJ06g9/+rW7yhLV1QU8BNPw8jjvOwTKb9Bp/Zkq4ZLftg9w++FZk1v+L8ozhrR5di6vzbabtfOZujN7hz+2UpFwLvasUPX4YZGsbuDHrmOhU8uRSgDI0eV/hU4/s63Iu7Zhlbr1q07aMf8Axr2wEicZGFcnl48b84652HTkygap1RYxH9Ux9SwNp9UlWUAMPx1oVkr8nSX8G8ADauN+Mn8Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nOhClWa3u5rzp6MUKxllqew6SMH/pIV70e+J9VVhgr96g7vBL4KPX+9h5i0FqWCoGKDFf5ccukRTgHs2GqPyMyfeynRStmRsjQKUemebCCLzfUPLQHTdBJoKuulcdHdHShs+IObIn2NUqSb3YrZ0GB/CW3kc2LYe6qcvQT04K8qiORps+BodFmR4IJ6Ht7tBsLoy25vkgMbW9MpU9Sw4g3IR0D4dJDcfDf4BImfs1bFsGUKwWBcs/QbdGpqOaUWLN9BviqcDSUj735yabk5LO2OOd8bmulyP0uNalOnHmEEQZB25iuSGCVA6acK91dNh5gM7N30ShSkmIiMyCIW3b6H3M3GxRYcGKa16zgBZgl61qr+omIE4Xkj+6BFU7PFW1Y2VmDf8WF4aQTNMyUs+igiI8fTPQnkKECeFGakQfIceIzm9tyn8mpnkrqS/m2ga
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 13:22:21.9794 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f16f42-f170-411e-930a-08de7ea80ffe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9767
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
X-Rspamd-Queue-Id: 5F1692500DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: YiPeng Chai <YiPeng.Chai@amd.com>

Add unified interface to handle ras interrupts, some redundant
interrupt function interfaces will be removed later.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c  | 31 +++++++++++++++++++
 .../gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h  |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
index 4fc29e548ecbe..861b1f2904754 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.c
@@ -535,6 +535,37 @@ int amdgpu_ras_mgr_handle_controller_interrupt(struct amdgpu_device *adev, void
 	return ret;
 }
 
+int amdgpu_ras_mgr_dispatch_interrupt(struct amdgpu_device *adev, struct ras_ih_info *ih_info)
+{
+	struct amdgpu_ras_mgr *ras_mgr = amdgpu_ras_mgr_get_context(adev);
+	uint64_t seq_no = 0;
+	int ret = 0;
+
+	if (!amdgpu_ras_mgr_is_ready(adev))
+		return -EPERM;
+
+	if (!ih_info)
+		return 0;
+
+	if (ih_info->block == RAS_BLOCK_ID__UMC) {
+		if (ras_mgr->ras_core->poison_supported) {
+			seq_no = amdgpu_ras_mgr_gen_ras_event_seqno(adev, RAS_SEQNO_TYPE_DE);
+			RAS_DEV_INFO(adev,
+				"{%llu} RAS poison is created, no user action is needed.\n",
+				seq_no);
+		}
+
+		ret = amdgpu_ras_process_handle_umc_interrupt(adev, ih_info);
+	} else if (ras_mgr->ras_core->poison_supported) {
+		ret = amdgpu_ras_process_handle_consumption_interrupt(adev, ih_info);
+	} else {
+		RAS_DEV_WARN(adev,
+			"No RAS interrupt handler for non-UMC block with poison disabled.\n");
+	}
+
+	return ret;
+}
+
 int amdgpu_ras_mgr_handle_consumer_interrupt(struct amdgpu_device *adev, void *data)
 {
 	if (!amdgpu_ras_mgr_is_ready(adev))
diff --git a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
index 23c411c982319..4f44a917d48be 100644
--- a/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
+++ b/drivers/gpu/drm/amd/ras/ras_mgr/amdgpu_ras_mgr.h
@@ -67,6 +67,7 @@ bool amdgpu_uniras_enabled(struct amdgpu_device *adev);
 int amdgpu_ras_mgr_handle_fatal_interrupt(struct amdgpu_device *adev, void *data);
 int amdgpu_ras_mgr_handle_controller_interrupt(struct amdgpu_device *adev, void *data);
 int amdgpu_ras_mgr_handle_consumer_interrupt(struct amdgpu_device *adev, void *data);
+int amdgpu_ras_mgr_dispatch_interrupt(struct amdgpu_device *adev, struct ras_ih_info *ih_info);
 int amdgpu_ras_mgr_update_ras_ecc(struct amdgpu_device *adev);
 int amdgpu_ras_mgr_reset_gpu(struct amdgpu_device *adev, uint32_t flags);
 uint64_t amdgpu_ras_mgr_gen_ras_event_seqno(struct amdgpu_device *adev,
-- 
2.53.0

