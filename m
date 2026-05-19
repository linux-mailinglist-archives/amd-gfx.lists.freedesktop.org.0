Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHHCAG5iDGpXggUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 15:15:26 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5F57F660
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 15:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658BF10ECD5;
	Tue, 19 May 2026 13:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f8CyBNK1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E13E10ECD9
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2026 13:15:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUkDEMPZbifkmUiKb3Qe3F5Uvs4hVNDLJHiKdZZiojyqlPNfRGqP7TkC1qiDzdfA8+iafzjAxhbgUUpfR4QDea4eS3u+zBztbJ+0jsHSvyyD9XCFOYk/hO32dD7WiYXfXHYaccgf8wJHv22lJim5GUyF/CtPvSJPtezd9CyCttzCam51S7rZYVJ9gHe/NejDVv+j9pKQwXZjdVmvRUu3YHbuB0ZVrPdFvqh5ZIFlCnokCqbAZLzSD6sObMjFQnAFtF/cSsLxjetQhUVYZTsnoKUgVPx1Tms4DhSmxaGCSJowt+3CNjRWXg2EV12yu3mPJhW97chJxNvxolrJXsFpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHB2Xpxh++Jiq/oc7gW4ib5GifndWoa9ycgqBe33O7A=;
 b=N9T/NF/2641tRmKIOWKGHqwUffYteo7KIBui4ZeA2/sMAEGukWOXvJFkspgCKt0nX6CjNV2wLmdmHoJ9GdWoac75iqiOcGUl2p3Krq1++uF8jzIlDN/KSOKKS3aXrP94BZfboItPctmmFl9RAhOgbeYaPynJfUS0F6qbZjJ3O8gHantEEBUiocCtvTDx17fYX0I4aF5RcGnn89nVnDfOIobS+38Lz/Y/uGd38zjT46GRVTrmOzyj+DnsLrKmHEY+r/fBJacjyc4hqoJZswYIEoSWBLmH6PArvQqJ/lLvWfA5uIFQl2+19dJp4fqnPNcBIsgRAVUWb7fMFB4wDttQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHB2Xpxh++Jiq/oc7gW4ib5GifndWoa9ycgqBe33O7A=;
 b=f8CyBNK1yvCCjTfMI83aJx9BOSf+NdhiCQjQGcWF2ZNMR7rfE9gCLGf83LhYjcOEbhipgQ+uRMuiEP1L40JgjpRM4gksXvJ+rbZ+qieqyG8fakxEfj3VSoj6LU+jaY9TeIU0H7WcV9SMf2M5nQYzI1azKUCPou/ikqL8+0yk3WY=
Received: from BN9PR03CA0037.namprd03.prod.outlook.com (2603:10b6:408:fb::12)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 13:15:16 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::79) by BN9PR03CA0037.outlook.office365.com
 (2603:10b6:408:fb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 13:15:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 13:15:16 +0000
Received: from jeevana-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.41; Tue, 19 May 2026 08:15:10 -0500
From: Jeevana Muthyala <jmuthyal@amd.com>
To: <Alexander.Deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Jeevana Muthyala <Jeevana.Muthyala2@amd.com>, Jeevana Muthyala
 <jmuthyal@amd.com>
Subject: [PATCH] drm/amdgpu/vcn5.0.0: enable secure submission on unified ring
Date: Tue, 19 May 2026 18:45:01 +0530
Message-ID: <20260519131501.1077205-1-jmuthyal@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fdc5fd-8538-4ad4-885b-08deb5a8ab04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: /rjilPCfCyTvUV8WfFYeXPUec3tO0xZvMcIESMGon9+CR6oljLhL8tCPDQ/cZEqhg0t3UhA7UY5DYTJNLatCQZJoUJ+1KJdOHKRhCpA1NstC4Wus/pEFthw09eRCr8vRBGR/JfhE+/fnhsq5HlfFTTtDgTyQWK0sQvVQo/P0eOPNKTUo4hQdy0TVGk8tH9+qCTxe4i2A3SJciTH+Ba8YlwWUA/4pq6y9mn3GSwpf9q62nxZH6eI1T7U8xSSc1yNL5VRRFnUytdgUdnFRBf4t2Z+oH/CdnAVtJuh8peSbIvIaI27UESDrjIPbwTgJnHDl9bY86tsGDUw2qQetg/trSR3BDdu7RodgmWftUVMt2izReEFVF7O6ezArNSdehn5J5zgA4Yo0/NNpE02oa6d5e1a1R46ZPLcyxDRtrCVSoNl6pbXBguFJgIZUsVmP8Q/32pVTljOWdSEe7O74UkywLAgQljQGIvGkPXabmoffRQAGNVOskKTVHV8lFVFxmpqVO36/JOqEo7huDHojAf6bXnXhe5yglEh6UaReuoxJOH4qr9gC8zJ3TSXdbay2KLmZQN7Ib/V0LW8CF94fGoMNF5x490dVHUAonieGS1rEoCgm5hdFQA8KdW1tOWB1pUxCyYC1xV7gheRVQ4bE30EX8Z9ozh86VuuXZGSfnylAj+Dd9Z0bVzbQAd17U95qTHZru10rRSuluA/W24gP6HqAn0i2WOk74ifXbK0xlRPcJ1I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TX21zsXNnmcKL6/gt87YNLnqcxLZwuQMNH6/iEl9aOu+sef+glpCOMeeEIcdks3zXDzdatS9DyUUbZ0wqWZfECvR20h7Tvf30Eh1iu8XfQxLBOrowxOuN5uGndbuuQHvR3elP+XMA2DpVr/VHMIg/LgkwDV5fZH6xv69saUPGWgWcyeq6npludI9jPxLBNK/qga2zY5FwgEhYbEhE0M2z1h/qCCMCyJomqL5/ONpG/FKGjzLhZOuS+Zq83LX3ebtHpBZBbsSIZ7aKIpnjoE7nHdVAfj970vEjGV4/l0Umv2YWRT2QNNL9KmtcpWFiKSlwqF4MQKjph51cX+Sdmbns0rV0BbYU5M81TyBk/FnTA/Y9JuTMU/xb2UR7z8PVwvntOS1nssc+snp+Sxf5pZgWEXGCDGED1x4/LLzfAGYUfzQ3tPHbTXTJvhcHJ3WHD8S
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 13:15:16.1095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fdc5fd-8538-4ad4-885b-08deb5a8ab04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Jeevana.Muthyala2@amd.com,m:jmuthyal@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[jmuthyal@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[jmuthyal@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 72F5F57F660
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jeevana Muthyala <Jeevana.Muthyala2@amd.com>

Signed-off-by: Jeevana Muthyala <jmuthyal@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index d5f49fa33bee..cef15d6a4704 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1203,7 +1203,7 @@ static int vcn_v5_0_0_ring_reset(struct amdgpu_ring *ring,
 	return amdgpu_ring_reset_helper_end(ring, timedout_fence);
 }
 
-static const struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
+static struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
 	.nop = VCN_ENC_CMD_NO_OP,
@@ -1244,12 +1244,15 @@ static const struct amdgpu_ring_funcs vcn_v5_0_0_unified_ring_vm_funcs = {
 static void vcn_v5_0_0_set_unified_ring_funcs(struct amdgpu_device *adev)
 {
 	int i;
+    
+	if (amdgpu_ip_version(adev, VCN_HWIP, 0) == IP_VERSION(5, 3, 0))
+		vcn_v5_0_0_unified_ring_vm_funcs.secure_submission_supported = true;
 
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
 
-		adev->vcn.inst[i].ring_enc[0].funcs = &vcn_v5_0_0_unified_ring_vm_funcs;
+		adev->vcn.inst[i].ring_enc[0].funcs = (const struct amdgpu_ring_funcs *)&vcn_v5_0_0_unified_ring_vm_funcs;
 		adev->vcn.inst[i].ring_enc[0].me = i;
 	}
 }
-- 
2.43.0

