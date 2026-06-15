Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FDhvEOFrMGqUSwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA65868A231
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=lLd48voD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D9310E72E;
	Mon, 15 Jun 2026 21:17:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761210E722
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 21:17:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaJE6v1B/iql5O2XU5jesLXiW4FLh6nt/R7nlEFfGxAa+aRC/5vTdPZBNJPWlxFxKfA2dqiYGFBggox1P5wthvWPKOvMKKJBVzxPgt/PTQE+jdBM0fMziCgp4b8c3FnmhslSaMX+FTKy+ZvKfGh0Pc7PZARS/XBCiifFQYYHiQvRtEVwoLs+q/1hqaDRMBRZGlPDGaNnp0tbLFQtQKgE8vtFX1JSTnMckOre2WVNImiCQTEHCYwOBrqrV0YX44vFhVFSn54fXT9yUQazYwUtSWNlr5dom67+HDNz5agXd9atCIZIlbvQeehsOs9nb0+BwKADt5WMjleREfb5hq6Z+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1cmGtqkbhDyAEqCR1dn48+JjVQiH7aMwg59aIhElfA=;
 b=Es4IkcqtNtHL9Ovr4MeUYnRhX4tVOdmbZSsZgt/TpX2WnJOF6BGxFs2GlSCw7YQr9qP0q2YipOsXe3uUAzkH2Uiubr5n6rZvWV8M1Pra51sPBF5A1chMapu/xe4T1lMgscVjt6/FYfnr0PB7fMo9qBzwyQjgwL5qyWsP5vaCWnVtK8PFeQqws/pIM7dycWs9IfqY7ZajmG85zjbTHYakhs4MFMJOaEVFBmpENSYGEH34PMcgwHes7Ckq5wnoGzXq+3CpFiHUoqwWExOMQhgIbOePU5UdXFA3tn9sonOjhakQ1xM0FjFjiH+hUdjP65MmbDB5O8BVrFi0dx5PWle+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1cmGtqkbhDyAEqCR1dn48+JjVQiH7aMwg59aIhElfA=;
 b=lLd48voD/jYemwokqOl52AgnWYyozTnkInIlAQt2TeYwnrqSg0pnRt0YvITNbz5y817t7RKDfhqah2CL5A/vDbeJekEt/SzRTJKtw7lJ0AVvKGAzCGr1luEh8j/RXjZBNBisuZYBta7/lJFEaYwEPxv8KZxmjNNi0cYdpnFMnPY=
Received: from CH0PR03CA0242.namprd03.prod.outlook.com (2603:10b6:610:e5::7)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 21:17:11 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::38) by CH0PR03CA0242.outlook.office365.com
 (2603:10b6:610:e5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 21:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 21:17:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:10 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 16:17:10 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Kent.Russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 6/9] drm/amdgpu/vcn5.0.1: add support for disabling kernel
 queues
Date: Mon, 15 Jun 2026 17:16:51 -0400
Message-ID: <20260615211654.676386-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615211654.676386-1-alexander.deucher@amd.com>
References: <20260615211654.676386-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 037fab77-311a-4ee3-c831-08decb2376f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: H8gxwZVHbWSZYbwm+F/N/gp+Y9acfBmkLYQ6XLczox8zi4t9EH2nkl2rgvxNvlSOyWfRFZnTLv60PJVSFVge8wQwvB4Q/h0Okg1Wo2JEnfJyyrWQOTze1q1XQTd45JHHp9LTVH74MmjAnDQEXM6oL3PoO2PccpptorplIGW4Pypaumn0FAkKZwUtwbiEKSKEGVWmVuqoEALMQnIDe4vtLJqIoOnevS7HJ+3hv7pbTl3bTj+loZVes85VWxMn0QEqb2Gvm31AwW/qIsFGnzf+Vy02r3s9KxyxaDp2YNlxb51hUGOhjD4pBVOzQQLMOSEx+eLjvuKFKaMJEv2FjHsfbUimzb26A47an1wCeZB9g/cLI3/bhpkiN2Y1fiJ5pYNNuqe56Is0q0abx6a1XLGDdt2oW/ucrIx53VkvVTMOw3uY5tJNLLx49+atQm+5AeU0Kj06U47SDU8hDMOrXTIDwXVoN+45yM31qIIyDUHJEmrUE2O2/dhyv8/R1NdeHM1noMnrmvHIVYmqPsFFzSR1TjWZWuEw5nRGT3dKF4lsoEHck0nk9plQIfcRpM/j1r06VGgrOTX4bHcD7XaOHsOdQiFtz/8oQP5jCbL44iQaYqbDZ9TIAfVgutyhQ1pLh15b88f12ECG8Iu/k1Gk/s5wtRhTKyIa8IXQCwU7NA9cUPvop49rEs3yresJhYYrAVhHVbuqX54QOL/0yGv/9Qx5osGipTnxlKsf/ewHFkDwVYA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hLtBGXxLROeR+Tis9ACUeHPRsYKdybmxxZbcPSugmwBdUGBux5UKkTk7uZWy14tpQyQtTLajh1svwLVMab7SUSnnCYHv9wxERe5O7QxQHRt2Nd17SNvD7eFqGoNZKySb56NauEN2LUSGz2hxuJUIa8PwvZRHdd8f/K0fcKFJzZ11ocC2U6ROydyfBIM3y6uS41FliAuqJao6WJH6neJKJotdTv4f9Ad4+aXLth/aaVd3Tg2lGnzyLOnV/H+S0SIr/dvlyrp+h1wDzqoEk1lCNrEibAuX4xSU+6s4QxyUKdC9bQoScSrz9zhd7lVg8mF5qDV7yrVxSxa/6smmb0nPgoNTucLLXPj3yjPDDxRMOzgbRU93+9UzDsso2cLaShUs2nbNO00NXoqO4+0WGAfXxEb2AisB24xNjOtjfXOJANrlHRauf0IIKBEdcuUAv3o2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 21:17:11.2539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037fab77-311a-4ee3-c831-08decb2376f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.deucher@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA65868A231

Allow the user to disable kernel queues.  This can be used
to free up vmid resources if kernel queues are not needed.

Set amdgpu.user_queue=2 to disable kernel queues.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index d3db0494341e3..95f55bab528ac 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -94,6 +94,19 @@ static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
 	struct amdgpu_device *adev = ip_block->adev;
 	int i, r;
 
+	switch (amdgpu_user_queue) {
+	case -1:
+	case 0:
+	default:
+		adev->vcn.disable_kq = false;
+		adev->vcn.disable_uq = true;
+		break;
+	case 2:
+		adev->vcn.disable_kq = true;
+		adev->vcn.disable_uq = true;
+		break;
+	}
+
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
 		/* re-use enc ring as unified ring */
 		adev->vcn.inst[i].num_enc_rings = 1;
@@ -188,6 +201,10 @@ static int vcn_v5_0_1_sw_init(struct amdgpu_ip_block *ip_block)
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
 		ring->use_doorbell = true;
+		if (adev->vcn.disable_kq) {
+			ring->no_scheduler = true;
+			ring->no_user_submission = true;
+		}
 		if (!amdgpu_sriov_vf(adev))
 			ring->doorbell_index =
 				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
-- 
2.54.0

