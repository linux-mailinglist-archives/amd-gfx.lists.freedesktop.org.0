Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCZzEMImxWkU7QQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 13:29:54 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BE9335329
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Mar 2026 13:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2120C10E2B9;
	Thu, 26 Mar 2026 12:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dDziGk0g";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012005.outbound.protection.outlook.com [52.101.53.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9113A10E04F
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2026 12:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTUZYiokCZA4IYI+BzpHTCdt8skivDO6VHg8lhEHng+n21716oORiy9m23N9VVV/zr8A+P7ah66ZvlQSWaoLiDSYuSDITu3wKiZfY/eaYVBwNL/SXV4AP/sRNx/IW2THkRa8wb1ZYFSeRNFwNGbY59iQi9ysxbQ/lDyt2/e5iil8ilUbLrpd2NI4r95sPKnbaSvas3CtyMbINbd/su9+gGz9VlSq0pRvS3pl6tO4GfCoHQukkeB4DJ5yDTdPdynvTs3Tw946jLl2vLOhKspprFTDjDQZ2+FouaVK9NVQLJASRLI5da/KmIR35fBDYzBxHQFYWkuxBSx+O3zekyOq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS/V8+zDSl0A3DACaggz2WfN8zTnNFAGxCe4D7cd68U=;
 b=ff2VwXGaVx8YAcEjmiD5pU9sH1qgBR//H6Sxb92KUOEvGaOWll+EozwNp9JQ8iwA9WFyfHC5dkEaQFditsRZg9Jlkw6JfmCaWbV7G826vxO8pZxYs9rVEGtNe5wG3HqoYM8aylvZlW1dzp15tgQeezC7t886zZzQMRMucUYgi3nEhwhpym6HSs5IoA3bBlW773Uwp1VfvNAhfITZM7n//jJS2i/W6ESRyulHv4bCN1M2rCRaeTygoBkQe+0yElAfIAVPnAfYVxjZ6OWC+kjfhfUVDcp26aZvh+4vgRKDlSKYMq+aQEjs50D9uE+oeWEuxqC9y6QdIYcl4KQir3tMKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS/V8+zDSl0A3DACaggz2WfN8zTnNFAGxCe4D7cd68U=;
 b=dDziGk0g0coonOD5mKXwQcV7+OwcWXz+A2JMF0sV8YOdo57ulxLSOaspIfbzKJecVlG72KbDOZ7ATDOI2CHo5m6dk3sw/rpbASTSvlmEhlVjRnlaUbLjit3YgYZYYPbnC53NDlUbWkfWyEj5uzUkEHak5QXGCTMbjlhpsxBxg/Q=
Received: from BYAPR02CA0038.namprd02.prod.outlook.com (2603:10b6:a03:54::15)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 12:29:46 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:54:cafe::33) by BYAPR02CA0038.outlook.office365.com
 (2603:10b6:a03:54::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 12:29:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 12:29:45 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 07:29:44 -0500
Received: from bencheng-dev (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 26 Mar 2026 07:29:43 -0500
From: Benjamin Cheng <benjamin.cheng@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <amd-gfx@lists.freedesktop.org>
CC: Leo Liu <leo.liu@amd.com>, Ruijing Dong <ruijing.dong@amd.com>, "David
 (Ming Qiang) Wu" <David.Wu3@amd.com>, Benjamin Cheng <benjamin.cheng@amd.com>
Subject: [PATCH v2 3/4] drm/amdgpu/vcn4: Prevent OOB reads when parsing dec msg
Date: Thu, 26 Mar 2026 08:29:19 -0400
Message-ID: <20260326122918.3486416-5-benjamin.cheng@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326122918.3486416-2-benjamin.cheng@amd.com>
References: <20260326122918.3486416-2-benjamin.cheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 16dd4a46-29be-4df2-eb49-08de8b335ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: XGQ44G08HY6ZMttEfjHSMAMJy5C92oq34NQ/eWev04Wk2k29agagufylw4wee1GmQRYf1ugMOeokJ+js1M0aIJcd3lfKZVnq6/eZZSO4J8SI5FN+J+MjSJbDl1K88GUsn8SOB2nC2PYbD5WQjx3FsNiMQRxigFTvLD1vbSXeXdgIds/gCCH58TX+EtryAsWOljW9fS7Ot7pKwxisDf7/BoT824F6Z0CZmyQ2kVH9m5JjMUmcMpJYjEfX1QRmfpHETeOA/eigRgXUZ0IJj2LC1dmD+kGvxgijRQQ9kpYxS9aq3A3qb8Gs4E4i2gFQ4Y9TQFuaLbQN+C6sqYirf2JmqmWSXYMGO126ivC2d8ROuhlHinPo/vIRr8uGMzAthNmSNvV8JuExGtLf+2NOJyYNEHa7RMX+IIKipHDVcDrrFtfywb+I2bXcvWw7TIgf24V55FwxguaAVm+jzakpVTgqd6RTH/GES7AG7+BddLYO76zLZgZmPtJIr5gGu+C0AqU/KgjnujNp9DRJ5LXBXbaMbW5rlbng2DKvBdwP0Z+W7A0ZI9KS/VSnvjNGuQ+J6Qe07eIGIfvQPrGcNk+vf8dmh4kccvIM3uoWDM407QZEw0tz+2ZF7d439j79T6R5ccar0/zSlS+ZmI1D3N8D6x6yKR2zLD5TYQf3xHd+2ioWsJdShDLtj2wHmyzrXr6xq4MvooorKqezjqh62ha+1uMSAgs0NPB0S0sW6s/G1/9qjjBADIH43+pbzJhVeXdy5TW/1CMBHHq230LM1tsVGDmoJQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 36jUJkqeZYgv7cnSuNleXwBxY1+cQ+XCnpV1ZHRcW8hEzpHuHvXboAirTUpVxaE4tLjdv4q86TMhjqERVm7GCCmRTxoFpQSni8zgbJd9AxIv0YzIWNyWYnopzNsgJGTP9lzPbY0ZT8RPe7C9fxybYwalwg1JWCX698yjzK1B0bT5939v05t5hMlxAdvNxtrAZvlVsqQ9ooyWiARzr6vTgQCjgm5RKXIEQ6TW5GTgabXwazra5LwO+SNyNp05R0iIjecuYtEabUzKjjbplRXLicAeTUZqzQ/i1K1VfB96Ls7kJjuwu15rxfQNeSx7/+W7EJ88e+iDPec1F4FGZhcDJkWr2D+d1RoKJv96qEZag1neBIBWSv93KSdVrNkGgodYEAFs7bDgpHpbOJIVIjOK4oL2VzCFCFxpi2403zVCnJr8TlEzAJBG8pLC6BJqjy4V
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 12:29:45.0834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16dd4a46-29be-4df2-eb49-08de8b335ce9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 96BE9335329
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Check bounds against the end of the BO whenever we access the msg.

Signed-off-by: Benjamin Cheng <benjamin.cheng@amd.com>
---
v2: Moved 4 DWORD check earlier and added more DRM_ERROR logs.

 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index d17219be50f3..1a1cdc14841a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1826,7 +1826,7 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_device *adev = p->adev;
 	struct amdgpu_bo_va_mapping *map;
-	uint32_t *msg, num_buffers;
+	uint32_t *msg, num_buffers, len_dw;
 	struct amdgpu_bo *bo;
 	uint64_t start, end;
 	unsigned int i;
@@ -1847,6 +1847,11 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 		return -EINVAL;
 	}
 
+	if (end - addr < 16) {
+		DRM_ERROR("VCN messages must be at least 4 DWORDs!\n");
+		return -EINVAL;
+	}
+
 	bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
 	amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
@@ -1863,8 +1868,8 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 
 	msg = ptr + addr - start;
 
-	/* Check length */
 	if (msg[1] > end - addr) {
+		DRM_ERROR("VCN message header does not fit in BO!\n");
 		r = -EINVAL;
 		goto out;
 	}
@@ -1872,7 +1877,16 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 	if (msg[3] != RDECODE_MSG_CREATE)
 		goto out;
 
+	len_dw = msg[1] / 4;
 	num_buffers = msg[2];
+
+	/* Verify that all indices fit within the claimed length. Each index is 4 DWORDs */
+	if (num_buffers > len_dw || 6 + num_buffers * 4 > len_dw) {
+		DRM_ERROR("VCN message has too many buffers!\n");
+		r = -EINVAL;
+		goto out;
+	}
+
 	for (i = 0, msg = &msg[6]; i < num_buffers; ++i, msg += 4) {
 		uint32_t offset, size, *create;
 
@@ -1882,7 +1896,8 @@ static int vcn_v4_0_dec_msg(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
 		offset = msg[1];
 		size = msg[2];
 
-		if (offset + size > end) {
+		if (size < 4 || offset + size > end - addr) {
+			DRM_ERROR("VCN message buffer exceeds BO bounds!\n");
 			r = -EINVAL;
 			goto out;
 		}
-- 
2.53.0

