Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618ACB1D46A
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Aug 2025 10:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A6810E116;
	Thu,  7 Aug 2025 08:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hLXKmcqo";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060.outbound.protection.outlook.com [40.107.95.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C85510E116
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Aug 2025 08:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asi+8jl/nCHkvoPIL36VLV8DVpWjaTB3rQ+p1s4aDHtx9VyiSkhhiRxkNU3WBOGjSZA+3IDXRHN+D4p0IjG9LHC4yx71TwU2PGxnPTdxZDg0Cfkbo3W8FY5Qg61R9Xhf49xPYJPvvKNR1PsvaP8Ga499G8dIAH7J+ayjfCPTxMQros0A6Clfkbysoa75DBx6tKbYsuCRZUg8m4K3E/2mfrDt2h9xPztg8t3qmYhRela+vz2U4xPg8prXa4JqT6aTCKGunFY41XFy7FWWz97+AQloj6wJny7siCGE32xjh8+ZR21LyQR+aZ9WQuF7xJDHaS5qWFl7NzmZwKVI0MmyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFnwdCQjuOF1OnYIyphbbklUSNbz0px8suOih2OU/wE=;
 b=VwzpBAjXVkAOKOKbIzxDfqEReRXjsCciBYzN3ao6H3IHACg1mb/MtpjR8m3HGa95abHZfzaqUgSc9UxyfNpqzTLZKuIg3HjzamWQpgyUP8jzgvRt8MmvLjg4CuOJBXjboesYpPObaHnnsAY/mg6q45bwqmLdM4QXIql8ZD2hRWdAGcZ3EeU0kaY5/bdNV0zTuRr7Laig4yrregatsqnfOdi3ZC9QsW170DGEjqYwfr+qmzJWAbAzC8nC1CvNCJR35VfegFzkl7xylVwwLsWMrDzjWXIo2E4F9w5745AL4D/lGByAl4jVCrZRgoEncL8/nYpTSeuFiZ+9Ilccq++mGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFnwdCQjuOF1OnYIyphbbklUSNbz0px8suOih2OU/wE=;
 b=hLXKmcqocEkmqBt8TkpLz5SdmluaQqQNTsz1G7lms4baXJDxQPZfvqpNSpXK2np1XQmGanTCA+7JNXE0X+SJI6SFC146crxB75DjYwr4qTLmsOU5poITkECdz2d6N2z+KFxvwUFwrVweswzhlNSHl569fMGF4uMtozlwh8x3no8=
Received: from CH5P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::21)
 by DM4PR12MB5988.namprd12.prod.outlook.com (2603:10b6:8:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 08:47:11 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:1f2:cafe::f8) by CH5P221CA0011.outlook.office365.com
 (2603:10b6:610:1f2::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 08:47:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.0 via Frontend Transport; Thu, 7 Aug 2025 08:47:10 +0000
Received: from amd-SYS-esther.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 03:47:08 -0500
From: Liu01 Tong <Tong.Liu01@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <gang.ba@amd.com>, <zhenguo.yin@amd.com>, Liu01 Tong <Tong.Liu01@amd.com>
Subject: [PATCH] drm/amdgpu: Fix race condition in amdgpu_vm_wait_idle during
 process kill
Date: Thu, 7 Aug 2025 16:46:55 +0800
Message-ID: <20250807084655.1597669-1-Tong.Liu01@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM4PR12MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 68bb31d8-2f89-4dfc-48c0-08ddd58eff85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ijc4NXcDtwaJQjEhH5UipRTOmhHpWWUmjG6cKZw3Yu/M5gbvljKlNvshBLiD?=
 =?us-ascii?Q?Xd3F8Hhbh/5b3Ycc7ScWAaHs+omJ01O+9Oi37Y8nytGcTeL6Gnyoz3rhpRLL?=
 =?us-ascii?Q?KGLRWyWvFzitA59pX2SfYfPmqAxTaBMZzyFkd9pNEN1JmXs4MYGUVIRGd2ab?=
 =?us-ascii?Q?Ma7IwBH4ZUEo1N3UEk60NVxbxkGYjGhPRcul5GncGhLLGySU8LPJNtRvl6bE?=
 =?us-ascii?Q?0RXoI95UuOXytWlZi62W2tY9e+78JVS8QEvsGRLUJEOV45zJqjeqGBGZ12qp?=
 =?us-ascii?Q?SepRa+2GxT1w3EGOi6ojvs8pKxlknj7d9Yz1X2msK4iiCynwgtfP5KF7kxG0?=
 =?us-ascii?Q?BhQCCLiuA0nvZEUooYdtkrZoUDPPwXYmwmo1HLaT5rwkz0qNmN3Ahpi85Fvc?=
 =?us-ascii?Q?IWNtUt+4ckfaBJU0u+7/blA+/88o+24ZGQc2hWeLO+4BaSWkicgPGvhWb/Kw?=
 =?us-ascii?Q?z/g2+XANIJt4FKrLAUFGQ13GhyR18LG9V2ctW2ohBICk4vZl8FK0irLmpsC6?=
 =?us-ascii?Q?av+MciL+pT8/YbR0UgWX64sh+CSksGhp1diA4MSMNtGNK4lMvtzWWydOjCwo?=
 =?us-ascii?Q?lRWHlz5Va+gN02C+zuFv0rLYuH25Q4LrpMzWvPxxNe+Jr9sMMCoz1plT5/vy?=
 =?us-ascii?Q?9fmZeh5KJZaUa7JzbRvAMseBuu+KLTlaOgtq5+Sf/1DfEsLuFqwan66xGp76?=
 =?us-ascii?Q?dbED0vUi2naFdfnWgJumfqZuYsFerssG2uqBJVK5Eoc4tW9zVYpknsHQA0VS?=
 =?us-ascii?Q?EBPeYXUck2beYXJc7yTo4ZKFOdT3WLXRKGR3it+u59TNu1t92JNwUG8LB7BT?=
 =?us-ascii?Q?EPdldhiNe3ZyMk4aAnqTzsuzTLtOkhnmTBI9FGcecQcERMZFuDN8yGs1XkJN?=
 =?us-ascii?Q?gNLk7YFf6YL2fwcX8FyyzLtxP4leR2YaApXBlu8wjAPIJjcx/eQVSNkNCax0?=
 =?us-ascii?Q?M8uenILddBq6r+9g+bqK59qQW4+IRzjNFNnq/p92WXzp9tZe9QrC5N73n1Gg?=
 =?us-ascii?Q?ijvpR1erWQVfB9a++oB3fxigtWY808XxfF+oMme/FO/CZXvKF2rkW+hcJ9D6?=
 =?us-ascii?Q?BFKquUM/Z0wnNxqCOo6TowHPTCy/GZSFew09U4VcjFyDPhsv08aNH14dxPKt?=
 =?us-ascii?Q?VpoR2BuRubP3W87H4x/hgxgY5lAgWInYRhSo38EpRYA9KQX+ua99A0RP8kcJ?=
 =?us-ascii?Q?ITzV6TZN3rkSGWCnO5vbNzSigx+5EFM7vgVWr9kpnaQw5s5ZlifJRw+2VQbX?=
 =?us-ascii?Q?CaFpX/CKKOGn1XsodKnJttvjQRxfDqB0UEKfTZWbECvSnG21q7+zRFZtdL9U?=
 =?us-ascii?Q?ORkT0axyKIfZyPupcZkHBZIMsX0MQvzVwDmpF0EDAZvEeyHFk/VLplYvDa+9?=
 =?us-ascii?Q?EwiEWwDTW23Tp9XsN+tadpglR9sLrypu/GKvKearV0DBCshOpv/8Ipazi+PI?=
 =?us-ascii?Q?CoOm7NZM8weLY0hubxboAhWo2FWHU5rjokuRjDSJU+hKDpSBAmy1OpBCseyD?=
 =?us-ascii?Q?1APiw6Qd4EgfC7z9zkWQtjJdCGpG1GI00dYv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 08:47:10.4945 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68bb31d8-2f89-4dfc-48c0-08ddd58eff85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5988
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

The early commit b8adc31cc0ca ("drm/amdgpu: Avoid extra evict-restore
process.") changed amdgpu_vm_wait_idle to use drm_sched_entity_flush
instead of dma_resv_wait_timeout to avoid KFD eviction fence signaling.
But this introduce a race condition when processes are killed.

During process kill, drm_sched_entity_flush() will kill the vm entities.
Concurrent job submissions of this process will fail.

Fix by skipping vm entity flushing when the process is being killed.

Signed-off-by: Liu01 Tong <Tong.Liu01@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 283dd44f04b0..ae43a378f866 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2415,6 +2415,13 @@ void amdgpu_vm_adjust_size(struct amdgpu_device *adev, uint32_t min_vm_size,
  */
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout)
 {
+	/* If the process is being killed, skip flush VM entities
+	 * as entities of concurrent job submission of this process
+	 * might be in an inconsistent state
+	 */
+	if (current->flags & PF_EXITING)
+		return timeout;
+
 	timeout = drm_sched_entity_flush(&vm->immediate, timeout);
 	if (timeout <= 0)
 		return timeout;
-- 
2.34.1

