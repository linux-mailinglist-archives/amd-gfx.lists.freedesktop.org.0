Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M3sMmpxDGpKhgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 16:19:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E058068A
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 16:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E2510E28D;
	Tue, 19 May 2026 14:19:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hDTe7jem";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011037.outbound.protection.outlook.com [52.101.57.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC6610E28D
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 14:19:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQKchXIT3nBAKqMoG/M2B+5PuPakKcSSkSsPxMm0FXRaJRLtIz7TG67Bj0MItEwvbaZPMfgRvaxRQKOsYtwic4XBvR/NfubZqvfrJoUkowwR7EllTT/bncKzqrVz2Re0uRrx5Y4WG4OJZlWNMWRhPZAI8pXHohWOLPTYwycC+8+eG68kvpxb57mlcaegtaynIDCvspjmi2JzrNlXkrEH9JWNqZYQVHSKoF1U3R7YdCnoJwriScM79XQX5Ln9DiZeeoX1gNZ+nQIM73oJhlkv2SBZOUdQrxrkYbg88+KDZiyPCeSebJQdPWSKU8uAn8SOhAp0tpwauF1btgRhFqHUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lu3x+Oe6eFirQHnfzmJxk1NjF+BqL1PUSn80IaNgSdg=;
 b=V5kjwp2qUTRlfiOAD89gegYtgdkIBPUqtHVv35jSsqf7LuUN73l+D2HKYJ/lS0Wme0PiHbpPpjCke0Asrl3s0i7TEjHe0+XXghHujalWYAWKU/TOGVInMuxQu6Y/+GfclTdr0KcINu1PI/gz90CqmWFZuBHotKVV6UNTZWGwv1HfHA/090/UtpcVzyMJyheLn4uG5yligxaJk8GFctFovrd1UZQXsPlVjVukOjU0MMyOge/ojrNm5vOgu73qxLSp2XoEoA70EwVtXwoQm7CXtA8zBBhbzlAPK1RuGxO1+w91RlwjIftyYlCMeuEK2cdu/D96yDVFOGiSt7zwzHSAUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lu3x+Oe6eFirQHnfzmJxk1NjF+BqL1PUSn80IaNgSdg=;
 b=hDTe7jemMWF7+rOpwhNDZZirsKoXQy+Lz2RIjDQxYgWC6pxqhtI7YjAqsk7vxoBwKpqQoOsW/4Cyxg7lW3u0QtiSNRGJIu58grffigdDD6XIL/oWGOzFWo6by/bBiZL4npTMZ6HUh6oye5vgecI+mJ4EAO2KEwCiQMHOvawE83c=
Received: from CY8PR10CA0009.namprd10.prod.outlook.com (2603:10b6:930:4f::20)
 by PH7PR12MB6978.namprd12.prod.outlook.com (2603:10b6:510:1b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 14:19:12 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:930:4f:cafe::ca) by CY8PR10CA0009.outlook.office365.com
 (2603:10b6:930:4f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 14:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 14:19:11 +0000
Received: from sclement-ThinkStation-P8.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 19 May 2026 09:19:10 -0500
From: Sunday Clement <Sunday.Clement@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <Harish.Kasiviswanathan@amd.com>, "Sunday
 Clement" <Sunday.Clement@amd.com>
Subject: [PATCH]  drm/amdkfd: Add bounds check for AMDKFD_IOC_WAIT_EVENTS
Date: Tue, 19 May 2026 10:18:08 -0400
Message-ID: <20260519141808.2746913-1-Sunday.Clement@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH7PR12MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: e91537f3-b1fc-4111-cafb-08deb5b1993d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|11063799006|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: CEEyPAj/EOSyWa5FjG5JN3+vJTknxDdcZnIdsEAdacs27aE51QuwTfQBe4yNGx+f9XksvbWawwu0eVx6iAKq7+ef/Q5Arzxoh6hc1EMNeiiENVTaEMY7tuFhhjZ4Dw8B8Yalee0+YhW7/xPkJNd7g7g54XVedBGhjhKf8Jvk5bxHxFdBFoDloB1hUjkj7yxDPyVe1QreYfpwrdGoYrgJQir3Ml2n0ssSLVxcilnZ0SfAGNr859l4ZRLmEO1S1XU4ud3lBmFB5lMs2R3Zq+MPWZZTKkVrACfv9YgPM8t3OSKQ4kgi9uU+DsV0L+7u5BQD771MSmLhRk/IP3BZrY0FSRLl9Ewfr6EZYjH2EcgE6fhfY2lyv2/2bLcMXf3INaUnfWP0OFtNTIkbjfthcMNg3fvVMgP80cbMcBiuZ8y34RliIMOAOvLX95xkNEb5pVoeHDwC27ESF2TE3xiNPl5ntUlRg8+NTj+jOtApycrvqiwcFTMj7pqYI9jnbeNkplQkM0wQQau6EL82PElchKFFa16kQjRbXRt/5gAOVxuRzbWNkFE22gcUACStxb9N5JNmen/iRXpgYnvUr9EYNuNIGPJe6wEfQkj4AzDkMKWDqRRHLMuDATaW/J9WOZEkSHsxynlezFJKTFfq45U0Po1qPeegOFNJ9o54Kso9DjVQNdgWKy2vThojkino6snjTzJZQu80zzwJ/Gy7sICOQK5+CjuSD8/0KdCult85EnAwRQo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: am5+v8QkqDgQYPIrpR6ubAONSVNDZSliyYBXziUnjI661wkX76zOsB8tjRNlAgTm/5pSOouD7xi+eANFJIGxE7aXTzuP2xh7iQA0IHK7aIEFxk4uLXQNuee+MuJ2EyM9T4MNGqWBxrlB60SNhf/yN4ggL+zZ3MRtJcXGAbABIdvM50E6rvK+zgKf0BRwEmacGOyQOKRDRxfz8UPrqZiSrGiPBsB19w6zBxLCi9w+VcxwaVSeqzurwUHfVlKpTbfZwoSdfRZhoC2aqHVEKoFJMvMDoc1bTk1HNKu62ascX8u0RdHgBpcOzuGXSgYGJCZ+lJmQwtAz4pGuon2rw9jerlcpG6TO6BRyNuW/2SoPJC1TYmhtdHZuWRj5uuAVPuPqBRv2ZUHpx9zPDaotE2UXEHe8XWoD4mvwxINrglXfEGJyucVgJ9Cc6f4BYlIsEeOl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:19:11.7002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91537f3-b1fc-4111-cafb-08deb5b1993d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6978
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
X-Spamd-Result: default: False [1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Sunday.Clement@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 289E058068A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kfd_wait_on_events ioctl passes a user-supplied num_events parameter
directly to alloc_event_waiters() which calls kcalloc() without validation.
This allows unprivileged users with /dev/kfd access to trigger large kernel
memory allocations, potentially causing memory exhaustion and denial of
service via the OOM killer.

Add a check to reject num_events values exceeding KFD_SIGNAL_EVENT_LIMIT
(4096), which is the maximum number of events a single process can create.

Signed-off-by: Sunday Clement <Sunday.Clement@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_events.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index e9be798c0a2b..83edc4af77b5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -799,7 +799,8 @@ static struct kfd_event_waiter *alloc_event_waiters(uint32_t num_events)
 {
 	struct kfd_event_waiter *event_waiters;
 	uint32_t i;
-
+	if (num_events > KFD_SIGNAL_EVENT_LIMIT)
+		return NULL;
 	event_waiters = kcalloc(num_events, sizeof(struct kfd_event_waiter),
 				GFP_KERNEL);
 	if (!event_waiters)
-- 
2.43.0

