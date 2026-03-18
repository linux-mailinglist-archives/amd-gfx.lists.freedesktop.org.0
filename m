Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBEeCxKyumlGawIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 15:09:22 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D044F2BCB52
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Mar 2026 15:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCD210E838;
	Wed, 18 Mar 2026 14:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NrTQSnaP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013036.outbound.protection.outlook.com
 [40.93.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075510E834
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Mar 2026 14:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rvV2IaILZnCX274nnXwR++2hQCxYVFOPw9LiIXysrz0eshk+a/OnpmHvHD3PatxGO8JbOGaJROnFRbzCjZ3lVbt809oMjcjP+lp5p/Lpnv9rw3BV+TNo+1B01MGJM/M4n44M3R+b4sRLcUzxv9fvoZWaFRNnPHRsT7eXjTxkeSxkj2vQnA9Xx1oFwhXfJHq9HTFrrg3j+19bYj6PQ6GwwO8CxDWNaDg5v1MiyvZ4Wm1JFUq/Pfmv9epnSMTNmhWzURCMxyyCyyJt9MEtbT0eWcVykbKy1NnCu3bEexJVL2IwPkwqlmehtPkvJEpIsKbQ0+esh4l6PYD1uP69me47Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5zWizMeUWmjZFMrXEn4jQMb6luAR0bCxSbylwHPDgE=;
 b=nFARrssiuQsrnCCh4E1sAtqnCTgcdPtcR2yGjJlv4Wh1S1iEyI/goeXsJZYJ/6ABPsU/m5Fdej6OhvZQ5Vr4k9puqSEMxoaIugtEXqzLjGkgbMZ4oa7A8XZa18j/W2XbDF0GpT7trXwNp2gcPk1MsHI4D0d3vgAdZMX5veTv8fbUj0Z4aGYRdqoyRPniW/8/g9wNn+LflrpDYWFaR8LXRcz9pUZSI+D/6OlMGQWTV4O6duNNyZXRW/TPWUYfgYBm/Lq71Cjkl3n0lmYrMDEbS62E93sTTA85GL/7IJd2uaN9FkZQ5FTUmtLK+MvH6UVoZ1pPFrzyE9PHUXcMBw8zsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5zWizMeUWmjZFMrXEn4jQMb6luAR0bCxSbylwHPDgE=;
 b=NrTQSnaPamopUhIqJBiJyHGasgRd9YvRejXdWhae+3Gj5kmlu7jYTqz3T6UWx+/q8ifFUx+lRMBQ7dSjPayMy5ekElmSAeTiUoSbpr8GP8faPgPIxArSEP+7AvyGQaiXpD7HPDqsuua7nqEbgKrp416CAE6JLrbeZlfDGermpB4=
Received: from BN0PR04CA0130.namprd04.prod.outlook.com (2603:10b6:408:ed::15)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Wed, 18 Mar
 2026 14:09:00 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::e6) by BN0PR04CA0130.outlook.office365.com
 (2603:10b6:408:ed::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 14:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Wed, 18 Mar 2026 14:08:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 18 Mar
 2026 09:08:58 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Mar
 2026 09:08:57 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Mar 2026 09:08:57 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 04/16] drm/amdgpu/gfx9.4.3: align mqd settings with KFD
Date: Wed, 18 Mar 2026 10:08:25 -0400
Message-ID: <20260318140837.582776-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318140837.582776-1-alexander.deucher@amd.com>
References: <20260318140837.582776-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|CH1PPF946CC24FA:EE_
X-MS-Office365-Filtering-Correlation-Id: 533e394a-5609-43ca-9f0b-08de84f7e6f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: lXkM1q5dXvgVnkp6gYtqPYqcVvyDrRHgoRRaqCeWuhQxXaSmpzlalYNH2LYbQtZrp8LSX+qQzZqp1x6NqguXrZZ5oXXy/7AgF+u0Su5zDXheJfPfUnCLcOQaln7drBBl9mBpbM+tYp7p8fSSvX/TR0cz4AbY5lfb5UeexcsU2XfSnvxYBSps6BiSw9p+gEkln+Ny5cHLn4afcEBiLItgMxxsax4lmq+rN3zQJaON8A/dOTN99cAfqf4im1Kb0N9qIcVnaDg6jWYkSJZkbKpmTe5pmPd/ZKBRK5g9NjfL3KZuq/JJeMBzqxButj05QpNauJDKXJkJIzCOcG6WNyRV+G+4UcFXG6DbXcxHpjzAk6fl11P6cMBzhJJpOzM2ZN8nOrfuorR+Yf1T5J88FPnh1Rucy4Mrhr3JKhwJxgrsQNAvbg4O9D4wwh77mZOsMADyCiWGfLK1nqZYWPud/Vb4ucm7MS5Fo9b2gGdBH0g8joY4sLFbGmgBimlGdqkQGj8urd0QkFnYTjZED6pG8NEdlqfXtRqelM9GPuc7bp6Av5da08uasJEm2OR/wZXqIpulndiFDgqh/Sa0XYMKB4zVBuJk7Pb3ojnso5x0gLxxVmulxSBmI7csPh8W/maTipe4UJMUi0sj8uNCpue89GQvlaXNRCTlHi8NHjqyzZOyiPGmj9uNvmcYo379l0P1qHfJK+k5RJs9bn3WFOboztWA7ZQq0/yEqjDhsu3eZZwfkPX0iTX+AgDDyhXKNDDZQWcUwHXODOL7tNx33hRyZctpwQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oxZQuRmgVDK+3gRhVeEtJyy6K6mujqnJCHcOPxCz+awJtb8Qo/PhH12Nmr/tg/OLXLiyxaUcagGjfedq9J3V9ug86TF3KpavCU3ABNeB3195nlTq0Ep5Cjjec34Ga2Lcw96PifLR/cHfepHxcGQIA/bihfhU11E+JzcvlELV5/xY69P1ESGnZwqjCpDfjCUQ5gZgA9JK875UyJ8V5urSDMp+MqwrMQ4hj/xu+Cf4P0zK9Ubs7jhOEJ9UF7qv+flIeNthtK4gdFAn2UVaAKL7pThZ0Ia1bHm+/E+7OFn/Kpmv3rvBQgiKUEoU4zbrTmazR1rj5yUNswtnJdbcOdXmaOGO+d0NY4u4/YFwMzFcugVpOG06xxfcUB0knofMYLHdBa49NK0wsNIuhPNhkfQd4Ww3IwQJP8iLeWJsJWgAezY+ayRWAnIj/QEkARR4Pw37
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:08:59.9252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 533e394a-5609-43ca-9f0b-08de84f7e6f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D044F2BCB52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make sure to set the quantum bits in the compute MQD
for better fairness across queues of the same priority.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index ad4d442e7345e..d0b8fb9317201 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -1943,7 +1943,11 @@ static int gfx_v9_4_3_xcc_mqd_init(struct amdgpu_ring *ring, int xcc_id)
 
 	/* set static priority for a queue/ring */
 	gfx_v9_4_3_mqd_set_priority(ring, mqd);
-	mqd->cp_hqd_quantum = RREG32_SOC15(GC, GET_INST(GC, xcc_id), regCP_HQD_QUANTUM);
+	tmp = RREG32_SOC15(GC, GET_INST(GC, xcc_id), regCP_HQD_QUANTUM);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_QUANTUM, QUANTUM_EN, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_QUANTUM, QUANTUM_SCALE, 1);
+	tmp = REG_SET_FIELD(tmp, CP_HQD_QUANTUM, QUANTUM_DURATION, 1);
+	mqd->cp_hqd_quantum = tmp;
 
 	/* map_queues packet doesn't need activate the queue,
 	 * so only kiq need set this field.
-- 
2.53.0

