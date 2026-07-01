Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XtrLNYzMRGpn1AoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 10:15:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CB6EB00C
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 10:15:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=S5lwMpjW;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBBBA10E25B;
	Wed,  1 Jul 2026 08:15:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55CB610E25B
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 08:15:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM8Zxc5ShkQkQCE5tfrC6amq26BvQk3yEJNZ0OO2tXrCDsKdlvs0V6oHnSMiEnSGdsc6x1fb0Jw94pVeoXAapzCz143ftd4ZmKyDCsCwX5+WOJm6jlvf6waOLgfjBHJyow3UkTz7tXyWotQAWoy9p98itu+JvewZidzpt8uOI1PzTnt0AVyU2iBnjwyd1NAtP3a8O0dd3Fnr/NxuURa+MxLN6O+7Ken20X7cdxj8gOvWTMxc/pCms1y0PoT9qVF5or2Fp8VxS4EQ8F+Yxi280WjPrvCQP6JtCeObxlrMj5QXYJ7YKph7kAb/Zt5cXkF0KchiR2QAnEMeSoJC94cJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qevnIeAYDj0+S/sE8Gl+WQbkSJV4pG2iY/rW7tZx/Jg=;
 b=BPJlVSuZltnIl/ueSxnygkYPe7a1xZHTjVmP2HAaP0X5wx/ECJs4cjDBDldouD0055kWbhvzG1C3ETQJE4ATDinUtI9hUFjDBcdjrT0EusjLIC0tc1IuXIsmsFc0Cm0YSrhtQMpoMlm7PKbNkhmwhCeT9qlcOz+cWDFAO4lJ9i7yOlYrYdvfkJnGrDdZbS8rNtLTN7v9NLuVG8Cd/iQTCKhNlBKhTl7y/cka9NqDEcIEP4ITvucS3wJ8lfWw7zmtNmg33vTq0Mc6ANYead/5clGM3i1Rg2jQIzxO5m0YZIsKTJXm/5huMAyMKkcy9OYbdtRo3UEQOCJpDInoiWxfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qevnIeAYDj0+S/sE8Gl+WQbkSJV4pG2iY/rW7tZx/Jg=;
 b=S5lwMpjWFRIIWEX5HTxlaDLlzalkaoNfKnrN8q4cLxaL6swqgBhmFSd6LDiRlrPxZPIRPQfoBhX4n/xYqTMca5rP8z/hqj9gYJnsqyqKS/yOWeBxWdYjDDUQdb/6934XwLaOBo85DFp52sv6g6/CeDQxNNPOkGXI3PeR4KWTQpE=
Received: from SA1PR05CA0010.namprd05.prod.outlook.com (2603:10b6:806:2d2::12)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 08:14:59 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::d) by SA1PR05CA0010.outlook.office365.com
 (2603:10b6:806:2d2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.3 via Frontend Transport; Wed, 1
 Jul 2026 08:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 08:14:58 +0000
Received: from ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 1 Jul
 2026 03:14:56 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <Alexander.Deucher@amd.com>, <Christian.Koenig@amd.com>,
 <Felix.Kuehling@amd.com>
CC: <Ray.Huang@amd.com>, <amd-gfx@lists.freedesktop.org>, Zhu Lingshan
 <lingshan.zhu@amd.com>
Subject: [PATCH] amdkfd: properly free secondary context id
Date: Wed, 1 Jul 2026 16:14:33 +0800
Message-ID: <20260701081433.11134-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: b54e793a-b386-4499-b35d-08ded748d768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: XHJ0JuT74tZNV/x7mkaKbGayqwNE735DyadxrEN/vyQfd0zyxswDFoS4QSh5Qu4Hoqis7lWe3nJd3SX+OkZ++XoHJ6fho45ClYpAA8e+0+F1v/Hiukz+AGp/L2R5XnH/xwp38ToQAaRY8kSdunInqYXZcGQzRSLxVSn5iNQoIVZBOrFIyMxR+rTDIa7YEDEbOVEeIJoYhK53PYkerRLnuEBIClh9h7puxqgXXa+BfoLWU617kRiFsnR5Mk+h/P/r8WE3Lh0IunyUVlNBrJJ+cFcWrZkBYQsSfnjS8QwS5Kb8+m790IP5Rk8vRmQnUVLxxHj8EnnPthh1g8O3FG9q1L1nvnK0f+QOLTF/GZPjW07W64Cwl9fHq3PplSbkZF7EoBp1jrOHpPjv7JJU5UlUL+WwXl/sNRSUDqN/80I/15a31qswbbGz5CzLlYvItpdhbJV/SCO3HDvoRv0EdEz53n9K3w+1hrdPH7s8+6zAX2FOynLTkAEPhDrDcsWwOs1HBoAioD2LdQo8cLNdzqGElUUPJYoYNWYwQpdX2GCC8ToG8mowfFLy9koLCO5MyqfLNr/oISbQTUi/M7qWPrslaYl+OpIRs1jGVrcAcsrHUyNHySgMnQEfZEKlMEV2bsMUVGWPtQdbRDZVcONMLAqYQHmgH09/WlqTJaRRXEIYtTyfLpGKsbnmDAmHv1aKjlf/XXjq4b9lTWLrOea0St+zLw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: znoSpaJ09ZpNuVBW0qtylWtMD4jBkOG6slbvYtHrICccXkeThgMDuioef+RE3hSPNCvw8AlYZyTmBUWpvbLbrw/b73sDRysRy23fsmK8KET3SLkn+dsy0ix0RO4Mp4FwWAJRHQLGu4yiPFVipz6mKH0CA3t3Zh9minRBwmmNn2MbsztaivF4gAPvNkAx4b9FPKb887yYIYjAFL0MRZI/TODeU+RxEi/H0UWNxMU56bzk4OLhOJbuaF8UltM6jjPS5pKJg9XWBdPW8Ecj6dc3ee5Ejb8m0nzwCqjYyj/KeXONw0b4Dq0sb/xupBmvFQfwhFZZxfiIF46Rbw8lPjbLmammCPGNXZvYbtRk8BVqDE3MTnQTdpCtNqy0V4z31NJpvj9ov4OvAvDNtAg2+vj9kToAKYt59+Y7tNcz9CfoKPgbNI1rb9hoUAsFUO7x0cJu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:14:58.4151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54e793a-b386-4499-b35d-08ded748d768
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:Felix.Kuehling@amd.com,m:Ray.Huang@amd.com,m:lingshan.zhu@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lingshan.zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[lingshan.zhu@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 649CB6EB00C

Function kfd_process_free_id() should skip over
the primary kfd process because its context id
is fixed assigned, not allocated through the ida table.
This function should only work on secondary contexts.

Fixes: fac682a1d1af ("amdkfd: identify a secondary kfd process by its id")
Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 8e701dcda8ec..d0c083e018b2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -931,7 +931,7 @@ static void kfd_process_free_id(struct kfd_process *process)
 {
 	struct kfd_process *primary_process;
 
-	if (process->context_id != KFD_CONTEXT_ID_PRIMARY)
+	if (process->context_id == KFD_CONTEXT_ID_PRIMARY)
 		return;
 
 	primary_process = kfd_lookup_process_by_mm(process->lead_thread->mm);
-- 
2.53.0

