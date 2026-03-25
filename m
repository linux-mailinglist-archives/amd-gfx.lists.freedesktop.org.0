Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCTLEtggxGmZwgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 18:52:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F224832A201
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 18:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D210E7DC;
	Wed, 25 Mar 2026 17:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nm96nCHJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012005.outbound.protection.outlook.com
 [40.93.195.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0854910E2A7
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Mar 2026 17:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeBOCCfb6EJ9ynglensa7aA5BCVHXutJdp0VCRdIZ1iGS9DfXog0DSi97fvytdPefkc2ft6w0R6tp16qjdWgTMKxoAYq2RfGeX4k55/lVK/OED21Eu2y/apKd43rC7wxpDrQw+a2VmSFRjK/H8zuhzAggeZJwD2PAGthcuFFLXtF+HZb5Xgau9YJtwk9dh3TIXW5nwCUSz9pH1e9TutJPqEua5qIri49EsF/5rPGz/WiPT4QPzw/xnhz2psKQsefVZF83ehZLoVkIrpINLuoIuvkJ29tBfY1VQNfzS3eBfLj/kZlhrA8cxvC7IOXKuD44z5ETUcNKHrbqy5RJPCcJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxGFhCvS6YEd99xlJyVqHG2E9uMPb0KVvHsDyv0fP5U=;
 b=VuxZZS78IJA+MCaEr+WdjynrTTevYeXkEG7fGSvYv+dNOLVwekuhZ8X301ow9NUStXdezX43Lu0uNYk9TJboaUk47bqcdGb/5x/ggSIYK59TrUSjtV8eGvIsdZyEZmtZpjdYm1IbU/8W65HC534KjCi9PxMtbbFzrW7SSn8D8fpAVfn/PwT+0G7KIqVhxH7esXp92afa/Yz//OMXQEgXe3qnRhuDBsdDy+4qkOa99Nnk+PyNo6c9ygsNtSw9Ml1lBjkvSxIkwJniBFRWKmCWbQ15XSldzoZxml3nYOchGNJzzIcU+XD5Y2iuAO06qvSpm26n60/dCOAcp9BIhuX8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxGFhCvS6YEd99xlJyVqHG2E9uMPb0KVvHsDyv0fP5U=;
 b=nm96nCHJkUrV/M9iRIzUr5JTW4+nvjbCont7oNgcuE0yv2g1a1ebpDGnTPffn6wK4XW1OauuWaFLAcq3kmzTtS0jO/7Nq/ZsI2NFNWvyfpO/51qYBTK7l3FnGR63fuDh0X/JvC2UTXmZeEBxHaNmWaphwnWdd7JaVFDuhRBnMd0=
Received: from CH2PR14CA0017.namprd14.prod.outlook.com (2603:10b6:610:60::27)
 by SA1PR12MB9245.namprd12.prod.outlook.com (2603:10b6:806:3a7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Wed, 25 Mar
 2026 17:52:16 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::da) by CH2PR14CA0017.outlook.office365.com
 (2603:10b6:610:60::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 17:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 17:52:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Mar
 2026 12:52:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Mar
 2026 12:52:13 -0500
Received: from bencheng-dev (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Mar 2026 12:52:13 -0500
From: Benjamin Cheng <benjamin.cheng@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <amd-gfx@lists.freedesktop.org>
CC: Leo Liu <leo.liu@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "David
 (Ming Qiang) Wu" <David.Wu3@amd.com>, Benjamin Cheng <benjamin.cheng@amd.com>
Subject: [PATCH 1/4] drm/amdgpu: Add bounds checking to ib_{get,set}_value
Date: Wed, 25 Mar 2026 13:51:32 -0400
Message-ID: <20260325175135.3326685-1-benjamin.cheng@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: benjamin.cheng@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|SA1PR12MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 100899a7-ad66-4753-3bc0-08de8a973fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 9M9gZiSlBWtuD0bykdt8WEktEFtRumxqIOYBEx7Mt0WZHKdN8E/4NfWas6pnjKa1JA50WA6SgR4MziXt1t+eWb4OPEzZl8pfwFJIxgGCxofJHTsZy0aq3hyQ2lS/WBEH50GXAJxpjKcUGRacjDFHILw5jTMAV3VE79xHAyi/GPX3M1QZvz542kx1TJBoS2P8TE7PK8+oToUAqH1OJkJ1dfRghHIuYulncn/cM5xUN3cPYO9JhFrUmh3vf6FVNlhNRVWBFCAepQD58LijgdsNWPdtRlLurTcLwZTz2atuBVMhi8YsGW3aNqksoXJtjkYRItMvBa2Xup+4LGr0VnkO9hxDf9L6vk3DgGgAWd8/SSxAP4tj1ap0FRHc/Qykg/pZJG6iMnWbhoXvqE9dr3+QMM/X9EZ82gk/q8YzkrthG4guBNXofCI4WX4gVNWfKsuGnpxfw4cLVFKEDEaNC0oCp5nUH0hXcWZ4auuxaY5mTG2I541DPq9B0+JPcjNIk8oP96YWOjcxEV67wjUIniNybIqiar94d7K4zx/9gjNWGISif5YYlxufJYe01fHwPr1/lcCdtHgNI5/l5IN+0+ckpN39IYyhPbo4Pl/bibzD2CLnuXjj4CHVseB5uapmQoxb5pqxvYX/55UVjzmabEyDft6v/1AsU7KrpGMuaIL/uh8b0RBrBhuY2Y7pF9maeunWc1idxbW9z6W8a/ZhUJXhtjMNgffJHr4wy4ahGLHyS+I5QCzvCxbJYg4IEmb0dSq6vp3gnaPK6f7FZ1rVh5kROg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tTWoNztD7qkgtXEzLRKJa4u36fc1kD/32MNP1kdN+9gLpUXV/ZRnFMrNOjA99Q6sQTrgkxt8V9COSOOZNUBWt0ri7Sw26Kun68J+1u9gdrsLWLW07e+Zqi1TmNKB+c+X7WO96RxLWtq7JImNut1Vvaf5hax9IOQCMTgelCh7tlKGeOR6zxf5oKcNLJjIxqWtdDQZmdLeHAI4u/+9gAxrrUki8PU4euzECYRqunPKYM8fX1CVU5FYkDH1eNGbo4JGiCWjQ+POyORR5lnZN/Mz4bffR3OqDcDL7BEOMTS/kgaGfM7WJ6CXH0rmGs1YcDs5/efx0Jwsh+YXG3UXebUn+uYIKowJrZCjE98tqAcFLbFuDKUilAOxbpq8ZV02ujBFPpVFn9QSdbpL+o+CZIjwsjcX1/zAGO/2bMTA8RDGa7ZmsQnpM1WqGUKF6vIa/2/c
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 17:52:14.7565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 100899a7-ad66-4753-3bc0-08de8a973fc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9245
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:leo.liu@amd.com,m:ruijing.dong@amd.com,m:David.Wu3@amd.com,m:benjamin.cheng@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid];
	FORGED_SENDER(0.00)[benjamin.cheng@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[benjamin.cheng@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F224832A201
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The uvd/vce/vcn code accesses the IB at predefined offsets without
checking that the IB is large enough. Check the bounds here. The caller
is responsible for making sure it can handle arbitrary return values.

Also make the idx a uint32_t to prevent overflows causing the condition
to fail.

Signed-off-by: Benjamin Cheng <benjamin.cheng@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index ce5af137ee40..715c9e43e13a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -559,15 +559,18 @@ void amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 
 int amdgpu_ring_init_mqd(struct amdgpu_ring *ring);
 
-static inline u32 amdgpu_ib_get_value(struct amdgpu_ib *ib, int idx)
+static inline u32 amdgpu_ib_get_value(struct amdgpu_ib *ib, uint32_t idx)
 {
-	return ib->ptr[idx];
+	if (idx < ib->length_dw)
+		return ib->ptr[idx];
+	return 0;
 }
 
-static inline void amdgpu_ib_set_value(struct amdgpu_ib *ib, int idx,
+static inline void amdgpu_ib_set_value(struct amdgpu_ib *ib, uint32_t idx,
 				       uint32_t value)
 {
-	ib->ptr[idx] = value;
+	if (idx < ib->length_dw)
+		ib->ptr[idx] = value;
 }
 
 int amdgpu_ib_get(struct amdgpu_device *adev, struct amdgpu_vm *vm,
-- 
2.53.0

