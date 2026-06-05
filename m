Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GlguFylOI2pvogEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 06 Jun 2026 00:31:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF17764BA50
	for <lists+amd-gfx@lfdr.de>; Sat, 06 Jun 2026 00:31:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Q2oxXfLN;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E33112C39;
	Fri,  5 Jun 2026 22:31:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8698410E560
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 22:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+70LS1+AqqNRPbGWejFQyOW6dr7YxezzFUONBliWDQHO2FWwQF1IURbB9PxM4lS06mhWHWAqKa6bpFel0ZzgupDqofx4Z+seRVDFidxic8X20cVDJViFlSdydo+xjiiat6d6LZv8yOfplqclZhfMRePGW+pKgMWfWeeet1/W4qPa+jXmBT5GNI7DnuQy8M+gR522c7Sg9st8yhwwpECbl6KqMqi8a3igf30go2R1m3P/aol4WjVPsKl//D/QXaK8BqdWzyq3KFSTvLj28BEKmtJih06aOIVBpG88B9RcrOzeT6cOEK8LH8aJ2/jBXrYKeyr0IYzHjVkrtXNfkwgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRHUZ1wPFzWJKu8FDfyMb9IGJGdsOxKe/EK4LqmaVDQ=;
 b=AeVNSkOWXisiKACGO4Rmq7oZUHLt8/KW3i75uHfPIS20Pfb8pO7bvIPBjMtV7zfCY5uQjZ2gOxS1iwyaehh1TpTJvlRajecrYzu8wZq+qLEpOLWZO9r/Ry9Qusdfh80tn9OPZ2/PysoKWUeT3oVrISI2H0wGQwFgzrFdQsAbGkT4i03+PJO/eNmmBQwjTeDRORem1Rz+MBT9SFqFgVVbfVWxZ3Dk9Ek2kIwAeJiTy2EFll6AqDq9esH5TatUY1KneAObc6ojWqTkASpyzqkLyzqTI8LIxpZ6238KC1aO7mNDwEQ/MWwq3xUSskEzpCiih3Di4v34Xk8q+hl2L4cR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRHUZ1wPFzWJKu8FDfyMb9IGJGdsOxKe/EK4LqmaVDQ=;
 b=Q2oxXfLNHbUQd1V/pq+DJ6xe4e5RFalS2K5hPitBFF3co+A0+Rfonp//KfJpNWxkkIeNEDy3FkhA+R6I6/G0TOzvyURpcxv01i1m+h8kfDJBiirjHONDQadl7bIuDUgN691zIEFwB5LXcSM+suOmLiIMvzltYjgRcNR3PRj6N98=
Received: from PH8P221CA0052.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::16)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 5 Jun 2026
 22:30:56 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::16) by PH8P221CA0052.outlook.office365.com
 (2603:10b6:510:346::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 22:30:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 22:30:55 +0000
Received: from amberlin-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 17:30:54 -0500
From: Amber Lin <Amber.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <jesse.zhang@amd.com>
CC: Amber Lin <Amber.Lin@amd.com>
Subject: [PATCH] drm/amdkfd: Add gfx11 queue/pipe reset support to topology
Date: Fri, 5 Jun 2026 18:30:37 -0400
Message-ID: <20260605223037.3767958-1-Amber.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf1f6a1-289c-4d71-deef-08dec3521c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 72n3mLO9UvNV875G4/jzmnPT1XgPoRlApNaKLTx6y3nvtdclTSpWGFOVWYRlyl7U85YicGy/vjttvi55NXfpZlYykhaTiPlvis7nIRfNm/pMt+6XBSvM5RqUpNXS/V1F8Jpk+BRPsEdhAdpk7h1vR8vslJo5oObMEqqAFDZyxJfVOB6rdEkNe7EMl9I+ZS+6mnRKY0NVQguEcmEqzDQrPLU0BhwGmrg8O4RnViR/+ZD3MjYC26dECYh6kRKL2S8oJQSwVNmdq7lJ5hors6w+WRscp9qJTy924rsGRemlhmLzRUKNns8VaMcd2yabjiVBkuWnjTK/nGCAf4RoknzdVUm5rcNSHutHjrbTiW9WljleEz1amhDIRRwrp1D+fDOc4s3xDPyIZ7xDRS/m+YqBp3CuqN04VrVKl04ucE8L6WnRdayh5Taj8WTVJaSMZWW3+3c0ymGOVK364LlE9gbSk/jrXPtKJqrhLG4g6MQlcjSo4yD4xKlRYhafhFOJ3GcOLfCFemMDk6lYUwR8UMZ4iarHN1VL4WeoR/IHNcIdv4IFrZ275/0ch8TSIbX3gb+oNghNaSkw5QXgYGSw/Sfd2bICh7bsRSeyb8l2dLcWhe9FluwON3eqSIDWsMoPa7hF0Le70Wt6FVAjEhumfmVWsEPQcLYANiCG3cOSG/XD2gITtQozaGhwfsZkIIVCMV26o0jbThiZ3b8AOI5AZn+h+vvw8mno1wV27rJxcU30p/8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(6133799003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NgK8nxE+TLlAzsNNltCwGIBdIOrvQvECJS3YCZ5tE1/xDK2L/eXsv3R/mgmLMcViZ/5LF+ph9zVCA8UyxYYLHaA511ZXVXvldaO7LZISqH+fK2K6x43stssW4A52QIOaLn5GkCV2IRsite+1NokXmIifXkGDU+M2VK1b+3uI8POJFfoH8tXqUypa2Qei/O7HeWeu20z3BJm/FjyYLBdgFHp5ivmJxYl6Tw7FpaqN62uILy19jKqJEQcxm2ERVCjNogsk5RqIhgZjf72nWGPc5+MnC6yrdqzRRhYWf2tzxQSsFcc2y0yVZW0JhxM28txKNGRgWpFYShfF7No/aE7WksRAL71F6AhqdYJeVwFsFOJI0EOX4vXdCa82HNo7cNuxo4pH49r0iw9QafoHrVIJE0OxAJHiGS4ybgw2EdIE47h71DYFVQpjdbaAj61DLgHC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 22:30:55.7005 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf1f6a1-289c-4d71-deef-08dec3521c02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Amber.Lin@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF17764BA50

Add gfx11 queue/pipe reset support to KFD topology

Signed-off-by: Amber Lin <Amber.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h     | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 9adc852e5c2d..3a8bd3eaf12b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -210,6 +210,7 @@ enum cache_policy {
 };
 
 #define KFD_GC_VERSION(dev) (amdgpu_ip_version((dev)->adev, GC_HWIP, 0))
+#define KFD_GC_VERSION_MAJ(dev) ((KFD_GC_VERSION(dev) >> 24))
 #define KFD_IS_SOC15(dev)   ((KFD_GC_VERSION(dev)) >= (IP_VERSION(9, 0, 1)))
 #define KFD_SUPPORT_XNACK_PER_PROCESS(dev)\
 	((KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2)) ||	\
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
index 0ff793a17857..6c3734db38ea 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
@@ -2024,6 +2024,9 @@ static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
 			dev->node_props.capability |=
 				HSA_CAP_TRAP_DEBUG_PRECISE_ALU_OPERATIONS_SUPPORTED;
 
+		if (KFD_GC_VERSION_MAJ(dev->gpu) == 11)
+			dev->node_props.capability |= HSA_CAP_PER_QUEUE_RESET_SUPPORTED;
+
 		if (KFD_GC_VERSION(dev->gpu) >= IP_VERSION(12, 1, 0)) {
 			dev->node_props.capability |=
 				HSA_CAP_TRAP_DEBUG_PRECISE_MEMORY_OPERATIONS_SUPPORTED;
-- 
2.43.0

