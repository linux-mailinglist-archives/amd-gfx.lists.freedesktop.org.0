Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HYEtOh1S/mkIpQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 23:14:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F964FBD1C
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 23:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDAC10F5E3;
	Fri,  8 May 2026 21:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="izyQpUcy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CE310F5E3
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2026 21:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgSSHHRsj3jBfd2HhMySyE/1jqDNGwEslroMaA6tx8l0k4ky/X2XgPkKIR+K14t2h6vV12h5uurb/tNKt24r5QkbYr5arGCTRVOIpVv+0IKq7SB2zdLqVdu05FKLyxY2e1mfMCyqoI2nMMABsxJ3ZJ+LGwZEvRlXtYK6R3VAhY9TISpu8Yr2eMEHCHQzQdLre3QlrGTIM1PwF1sUFPEdZgX/Ri49h42l88t7CB1co7baOMcWOkmII98n1dzok3QlRFqKx7VqV5XtKgYwhB2TKsp3imnQ12gUWdkwTkXdhpzYjHbWD8zWGGJ0WTnRPcISbPmMifRu3WI5F+5r883RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MxjZ2/9EPBkf2ERrh0EekUhKZcWjniGhnwzYrQpt4E=;
 b=Nw5wRdbCKXphh1ShBO1+ksVo2unB2mez4np+aMK+xff7yxUZtWoXo1YqcOH2lB241Esa76sMSmptCreULgfJpQAyIOwMTVnKh7c94bTpSVBaVLDMgVFWjzy0TTc3YbyoiQVL4AUkfXKMkdfwZVSsEAwg9SLCZmMZobZd46YGVP9oNolU0WpCVshvQKmaQZ8zSuVApjMqh4zpvGZZG1K4yxDeuaLCc9fNtuefOXRpDY72uMI+6hcvBVyKdeh7Hft8h821DCuPn64WIGGsN5gxdrlw6EyDbv85+VfHLXnPfQDMu173yfRb+uQ9d/JPdkxiaVsPZV/x7BmpkYpftSHjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MxjZ2/9EPBkf2ERrh0EekUhKZcWjniGhnwzYrQpt4E=;
 b=izyQpUcyr3uvY19zv0ZNgRgecDj/m+iNYe1lhdv20rhFpBnVQkFajS+rvj3EgeBuU1PcPZjp1nwMfYmf6Sfept3VLsHD3PF7iin7027mL6KgojCYyGFnwxiU2huQ6zdmtwElSQxrPTpTn0JJH99KyYxpQpG/NAN4wcJORhwqEXM=
Received: from BLAPR03CA0126.namprd03.prod.outlook.com (2603:10b6:208:32e::11)
 by IA0PR12MB8277.namprd12.prod.outlook.com (2603:10b6:208:3de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 21:13:48 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::7) by BLAPR03CA0126.outlook.office365.com
 (2603:10b6:208:32e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.20 via Frontend Transport; Fri,
 8 May 2026 21:13:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 21:13:48 +0000
Received: from krussell.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 8 May
 2026 16:13:47 -0500
From: Kent Russell <kent.russell@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Kent Russell <kent.russell@amd.com>
Subject: [PATCH 3/3] drm/amdkfd: Extend MQDs in HBM to gfx944
Date: Fri, 8 May 2026 17:13:31 -0400
Message-ID: <20260508211331.38805-3-kent.russell@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508211331.38805-1-kent.russell@amd.com>
References: <20260508211331.38805-1-kent.russell@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA0PR12MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4cbc33-a8f5-4eee-7d69-08dead46b277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: f4t1BgGS7Ws4RhZqxq/G4kzFkHe9XefBGit8bObfDrj2AgJ7tHLTQHRpQpQDA5tAH75Il8ebI+Meb1oM39AfE+o8hv2lDphuZA516yUYz8eUVo6yBWGFsFHM4jWkt6DiTNM7cL4CueUi3A+lvvbD9sJ3GSpjNc739K16ICTKceTvAP5TIT7dD5tznpQA2ff8QqTJYPZ/mIU5xci+Me7SIwfo1OAlvnNgRYeV4d0pi+ip+Yt3xx3nJKeKtaL48gfdl+Y2daegfkBeWVUyyuLaLaGFeBLz3d6uqeF0PckfDjjl5OGwC6X4YbOpa8eOIrbBqetw+Z7GEzF1f4iqHcRXpvzQpQWYyl+myQo2ti4mJaDsUAaCi4VpuD1PiyWZ6+ayv+0X6YddRaf+RVm0YfUiytvGUUa0odCmfBAPs/5+H0muTRV5fXeJ3oOLpALA2HDZVrM6st51O1qs0AcebIsqdoDsyHo9rM2kZPf+W9v6Jmfam70m3hvsqikETL9ftwF3yvzIebYrFviIK2KwjtGL7p5idMPqQH++n4EdKEK8zPyRwGVpCZS6D6u/1iwQL2WhuZ8nPhJntzrEO1CYlcpOwtQ6pA48a+DCDVv8tK1Kwby/Ru0YH5aZnMQ7P9Ehb2bHpt674G7nOEy86QVQhpIMAz0jnoIa7ZZqK254IpfhtOmIwCLoXBN2y9Aae3x2L0RORzK/44/u/1E9h0vN9ildFc2JTxSBGVQ33MJVitcBVr4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ph0zdDvTXrvn2lHZWXbkjO7NqUTAJCjgXhCcwjLHJSOf3mHoYew3rFExoyKhMAAVd8AFOUbeWDWHKhNOgHFlv4lgQ0otUI4WSU3/TJT96hhZvoe/9gauxdZlciR6jNjnz0UAOhFJtVndRAgU6HKTFXAB5vPSuyJ+r3XZkQUdq6+/6HvbjTQWH2AzsepkOH8jlkagvyVlBh4UxxQI5PUCstvkk6Cjctt2AuckpKc2wWaTNv5VUv+NWp++wsNxXBw1WQrruqDWQRMQmYsVj13/IXxxpz9SYzhPnMeDo3s7x/WqMbFMYwqi3VatzWSGrjPYaULaVoe8MZGjzK+Ofasqocm8wHR2bwkef+qm+Rb3x6SVIl6hvn5tzYlLpBhWqMJ+jRaICSGauB/xZ2ZJTAvO+ebKgxICVCjoYxcz+mT56ibFk3pyTBtAmtp3HDMloCbO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 21:13:48.6243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4cbc33-a8f5-4eee-7d69-08dead46b277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8277
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
X-Rspamd-Queue-Id: 74F964FBD1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[kent.russell@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.994];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

This has proven stable and performant on gfx943 and gfx950, so extend
it to gfx944 as well

Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 5970a1694286..b0f83f63e010 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -324,6 +324,7 @@ bool mqd_on_vram(struct amdgpu_device *adev)
 	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
 	case IP_VERSION(9, 4, 2):
 	case IP_VERSION(9, 4, 3):
+	case IP_VERSION(9, 4, 4):
 	case IP_VERSION(9, 5, 0):
 		return true;
 	default:
-- 
2.43.0

