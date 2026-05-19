Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCybLDmsDGrukgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 20:30:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A12583B17
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 20:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66F010EDFF;
	Tue, 19 May 2026 18:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TJRnc8SW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054C310EDFF
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 18:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4lB3vk1Vuzra96ngZ3q+d4TE1y5DpRZ2LP5olAYocvhb4m7YERSuvq9kA8vLXZvMWaQy1YbSDP+Xva8Og7AmnqYl01Zr1FrvLEdlU7T5F3CAt1x+XnuFCBxqZqjwbs8Q/Cx0qoHz0FwkUafWhJYJLan0a5ivcR9nY+0xHFljQ66o51Ilz/lTUKUlJ+EIrwE79YHavturNin4slDBb7YjUslH9vGp2YpMPbJSMOaz7Mxp17tqF5czLixls/OUBpUWOMQ+OE6A3hqCc3IKa8HpFeSJJHYxBTMgXJ0iInQvOOUMUrxtEn0XZ5FtqXv5JSxZ58Jz0goJI4sMJGqQiyj9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnD0dZ0bOevBL5G9iKlPpjKdbL4NAuaodIeTHDcTqL0=;
 b=PE2rbTJbFM3cI26JWCEz2d9YVRxq3P2olVbXy34RlIbHCp+8NHZKCaIroQD33SLxz1IKacTQG0SMhbN3EfnsxZRKjc1QpmawZThT9eiUVJ0dZsDGWRB3zaymSZ/MEojdQcgwEc96XkSAbz3oxK19g36swguhx+EQK1Ya/RYzE/FCIzMBaSS5GtQlHu7SkBJnuQZrH7Aa0IFFXi87hDdAJAZj7kEpijjlpsCBKFVgnk6pvbgteAfg8BntykLPJDk8E97ZZK+jbkds9DRW8DQ100mdXY2OQVrvi4/d5Z2HjjUFSfW9rKSEWFL24lnNbgHzQSC2GNDOC4EmEmOxImFMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnD0dZ0bOevBL5G9iKlPpjKdbL4NAuaodIeTHDcTqL0=;
 b=TJRnc8SWdn8t5NakEiCmv2YdXf30BDQ7ePIHfRYNxceXKdkDGmhnLvrljRrdB55VvV3Ws/lCqqI3nS3vgsBFsmtT+zPpHJ7VLlbpIRsZkZMoNzxl+5bNSlMS54Acg5hbqATiQmjKtUeAqcQmcVbVbNM3wWfgTUBw2wEV0fXMEp0=
Received: from SA0PR11CA0148.namprd11.prod.outlook.com (2603:10b6:806:131::33)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 18:30:03 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:806:131:cafe::2) by SA0PR11CA0148.outlook.office365.com
 (2603:10b6:806:131::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 18:30:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:30:03 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Tue, 19 May
 2026 13:30:00 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 May
 2026 13:30:00 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 13:30:00 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/6] drm/amdgpu/fence: add helper to extract the guilty fence
Date: Tue, 19 May 2026 14:29:50 -0400
Message-ID: <20260519182953.21967-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260519182953.21967-1-alexander.deucher@amd.com>
References: <20260519182953.21967-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: alexander.deucher@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 27019213-beb7-4e37-9d1d-08deb5d4a4d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|18002099003|11063799006|56012099003|3023799007;
X-Microsoft-Antispam-Message-Info: zMu16Xli3f7Hn5iJ4h1iWq7vtWvIm/cV942zF6dcMD20gF8ssWWXC9p/udXevvRqrTdtMSqVyJ+hIRRdXmXoIXZCeQHsyWF0yPFJ8TTu0PVccVnug13WG+BvtLf5E3TkUkXNyGjzUCKesLhu8flCmZPbTFPakDO3VGJ3918cUFOriIwLQyy533T2FblkvWuKxpEl5hVLBSTfPjDccQ/pvptjzsbAz569PsqsdJsKGKUIpvPakXVH6kJCsUq3Hh2ceEkOV68/A28K3jbbN3LGHSkH2J5AeAZML0ErS+S5RBEPMsqA4FboGZqEvccZn8LMWvBXd9TT2Ls/ZczmFSOUJmvhwxhXhPxDYFKfc/PJyXtjZXZLg8br/wc1ycfaxKcyXtAPNbcPkllKMLINplBaaHCvF43VLGZT34MkP8EtQDMEVbnLeKRFjMTyXUO0GfWeV7RYAq0jIgxdyLRHEP+wT66YJkE60ZjbVmF1dAgvg8/XRKYjdMV7UJ1xCruDkirugmf7zqv0+XkvwdkDrGk+pYFO4/B5brW6fpS3AYieHGcMpv2tkVft3mMo/STDA1pQAuftytwQFYEbOC2wLRY58KzfyzIrDVP42lOXX1Y4YGJkBx6dGpsK4DmEUdLemetbE3SK4Hb4tvVAH6H3zf/gePrjVWMjNHRbk/CkXqa9GgFi6CU+iscrWnDQySmeVlpdVHbIwuTP2qaTOuTRwB2CQX59JA0jhSaw3sc+tQB7ahE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YcdhS7UD5oqq0KAFpXh6yrRtM26crAYkDGKpDC62pOdFOYJA2FS0ungGuvNyCifSLUX3GwKc9QcGR/edX9qK1xDbykHTtzzQ2SZUIomxJiS9lXUw4hvcj301nsIr6x8nRTbrUgC+Yj1Ge8kD+o+fqGHwhpO36qk9gzQrq3fbzEWHKzvCjlNOBHROQfaKO7Kesqt9lPyKHhPtPyza9yUmMwW0VwK/HAdqsPBz4Dkd7H5MGvAZC4jMGJ6E0uCGsiPH0ONfLV6MzbbvQmK62lyQhljmR3RbFhl4oZSp04oeBkydWmw/65/mV9cvhgUwQ+ACXZwkHIMLgBJi814ubj5OtJbsnUSjkdECd3YaC3aboVYLM7NxTqecZ8Yx4xO7vJaXcltB+L7MSTZ1DQnKTvpQ90cH8sGlUZS1s2G/MMOkrdkhbKlx7az7j+GtV//86MMh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:30:03.5894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27019213-beb7-4e37-9d1d-08deb5d4a4d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	TAGGED_RCPT(0.00)[amd-gfx];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 63A12583B17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a helper to extract the first amdgpu_fence which has
not yet signalled and is thus guilty or at least collateral
damage.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 31 +++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index a7a6db0bc6940..733e9b668ed8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -831,6 +831,37 @@ void amdgpu_ring_backup_unprocessed_commands(struct amdgpu_ring *ring,
 	} while (last_seq != seq);
 }
 
+struct amdgpu_fence *
+amdgpu_ring_find_guilty_fence(struct amdgpu_ring *ring)
+{
+	struct dma_fence *unprocessed;
+	struct dma_fence __rcu **ptr;
+	struct amdgpu_fence *fence;
+	u32 seq, last_seq;
+
+	last_seq = amdgpu_fence_read(ring) & ring->fence_drv.num_fences_mask;
+	seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
+	ring->ring_backup_entries_to_copy = 0;
+
+	do {
+		last_seq++;
+		last_seq &= ring->fence_drv.num_fences_mask;
+
+		ptr = &ring->fence_drv.fences[last_seq];
+		rcu_read_lock();
+		unprocessed = rcu_dereference(*ptr);
+
+		if (unprocessed && !dma_fence_is_signaled(unprocessed)) {
+			fence = container_of(unprocessed, struct amdgpu_fence, base);
+			rcu_read_unlock();
+			return fence;
+		}
+		rcu_read_unlock();
+	} while (last_seq != seq);
+
+	return NULL;
+}
+
 /*
  * Common fence implementation
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 9276a3bb69de1..71cd9bb12f75b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -589,6 +589,8 @@ int amdgpu_ib_ring_tests(struct amdgpu_device *adev);
 bool amdgpu_ring_sched_ready(struct amdgpu_ring *ring);
 void amdgpu_ring_backup_unprocessed_commands(struct amdgpu_ring *ring,
 					     struct amdgpu_fence *guilty_fence);
+struct amdgpu_fence *
+amdgpu_ring_find_guilty_fence(struct amdgpu_ring *ring);
 void amdgpu_ring_reset_helper_begin(struct amdgpu_ring *ring,
 				    struct amdgpu_fence *guilty_fence);
 int amdgpu_ring_reset_helper_end(struct amdgpu_ring *ring,
-- 
2.54.0

