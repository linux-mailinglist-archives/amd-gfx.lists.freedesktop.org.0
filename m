Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5cvaOeJrMGqXSwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939DB68A239
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 23:17:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=GWqjhAga;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D1B10E72C;
	Mon, 15 Jun 2026 21:17:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8510E722
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 21:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEzKyWsz428S+4/DvQ+vicEWckjp2IYCQfZbnK8omqNAXV+YCBM77E+nZj9OdAR6YhMfjqXyiTdKzalJUnYQTPJg+iEVjxvWKhs/wmiI78CsrCOo+iHv6kHzp05bXUVYL66OePcVY7sNG8B5XpPqgfoSuh4CQfQu+7wbdtcIwiAvQzUmZGRWMy+aAw9RbYo5ZpAKB7x/TolLSmrGrGOuLCF/bQaysOLrdWVGkHkW9DxjZuO0rEiZwrYvrXAPruaj7aMJ7un9UhoCaCB79J6ttZ873UNIOdBVeAfO0WMULaKhzZWDbz2Bmia5Va3pPsmfjV+22WJ9obXgFU9D6wP19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsEMWbA1BS9sJp8DR5ko/sDq0Pu9MRoKsNYkFKa6jPI=;
 b=kgPEN/26VgnzgxgcTCU7qIRt0/sg/AUU8GlMCyh+qQZIt5Uubvi3t4/dbVNnIL0VUQwEjmlhZ40r6fB80TlI024M8+llV6EVF+eLZYbnP4g4ujRu9JRD2cktZLyziB0HQ79TXQPXRsHHZluOu4x9JQNJj2gPWLf6v0Py9yjiXkuZzz2dAImZnCb+uicz6Tzb4C+vjoicPhLLbcosiEJ+UNcdQhLVQvrY9rM0Bvk3A20nuP7ixGS5z92uFG/mUJ/ayf+Kbb0xX9CVCJZXVjRNdmwzU5fWHHp9ccJd0KrldCDaPgtPQZAdwcKlhR/A3RJaMu0b3OydRVhZonb739QpIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsEMWbA1BS9sJp8DR5ko/sDq0Pu9MRoKsNYkFKa6jPI=;
 b=GWqjhAgaKFGUWtoZg5VV4zEcaVb8v++Wr20wGvQSNtd+JBGtIVSy6smaDqSRujSyFad6drmH/gduJ3xuEd4+TiKue0WSi0SAnXGo2WP1ng9yu2fWvmjxydIrPtNqjFhwyv2dlEYW1Nai4hsLHKYcjkJ8QeAle85xg8j6Ig23K7M=
Received: from SJ0PR03CA0103.namprd03.prod.outlook.com (2603:10b6:a03:333::18)
 by MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 21:17:12 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::30) by SJ0PR03CA0103.outlook.office365.com
 (2603:10b6:a03:333::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 21:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 21:17:12 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 15 Jun
 2026 16:17:09 -0500
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 15 Jun 2026 16:17:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <Kent.Russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/9] drm/amdgpu/vcn4.0.3: add support for disabling kernel
 queues
Date: Mon, 15 Jun 2026 17:16:50 -0400
Message-ID: <20260615211654.676386-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615211654.676386-1-alexander.deucher@amd.com>
References: <20260615211654.676386-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eacb740-2f5f-4a63-c0dd-08decb2377ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: OH5IWUNrHji8XZ/zJkiqtCyiMzoslJew1e/EJs/EjMUEx4mrA25LB8G7nvAFg7Ew8LPrwpIPBkpBq3b70q3+39kO2p43/AypR3dOAtkzh77R/m5f4nTA2fInDlfMdnMTMUOpNBqVKduatX/FbdIxnJA7yV9jbRaTVZA0jlyOIvX6PqjA/wTW3DhMwBqdVVRRIrT3Mhc46RDd1EWP3bHUQfSWl7QnnPWkcAz6VEKCybpP2r6m489oyEe02DVa8CXdnE2Kq7FLznxRHMYJ3pgHQ8c+FHRMPLlN3fNj5rU6moLjXK1J177HRaRsonlFfK278stIRlFg+IMz/hAZnHhz56k5NqjEhr4ek9OUyI8EYeZuPOVCQg36Qb6iaSg9pkV84sSv//fV1l30hwOwXxbGdgy+ZFgkVtNTczZOVKNfZrZQfk/3q9p5aCq/RT+tm7C4X85hUBY1vCnuSuwRT1I4DD+vkqITSHgb5TT4g2Zm5jDrJmF2ek/CSN1FqJ9dgjujwe+yY/RUVeZ3dGU1M8ZMf4pMsF6NokP3RF+B3R+syJ2KdCgVKAYf1SZ+KvxdX7mC3A5MSKuNV6/6k1DPnvNuxMYT0g+ItwEPjhOSytxXAxd1DfuLgeXw/va95O71J/rDmY1ldF9KWj1QePs87/2wB1PaKFdIH5x3PNhaSbOiNbVuJup//7ZSk1QKmZv8fiqyeMbEb0Gt/2Dfn9tKZNxWT4LMowILQC1CXp4Kr5dK8FU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GewXy/dpu2aTk827bry9kotkNlt2SDR1ncrsdgInlbz9oyOHM8bx56eD5ZqjUmd33gmqT3N6b8AmoJV6w3jI7oGpxOo1VCwAzEWv1ktRkfUzi6y3Ws42DiC28Hsou6UrIgRWfFP5ATedhF1KIF3BVgVxJvUddJtmR2w9mbqunBvkMVL2wTtOQWqBcRJzcixpoVaWDeDC30IKvM0SDYct43SPoHeScTHmlyZGNfJDqjAPi0a1DJ7K8MuRMK2gIus3xkvArYaEik8GiCXQqIOWdhdWCc5PaSLV9FUurxXKK9bFmNmPiqexSE0MkjOgt+b1NUxMWIKIjyCTIG5vJqLPNq3c6mQv4K6KvI+1jFOXHt662BTw8NeVPjOadTweaO7GjohPyOdriC34H9IqsslFJvGolwYuRyTdTHPCua49/fotoKuxX109MDvb+w1ZTWOO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 21:17:12.4021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eacb740-2f5f-4a63-c0dd-08decb2377ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 939DB68A239

Allow the user to disable kernel queues.  This can be used
to free up vmid resources if kernel queues are not needed.

Set amdgpu.user_queue=2 to disable kernel queues.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 7f001c32e9113..3c3f3d1a040d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -115,6 +115,19 @@ static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
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
@@ -217,6 +230,10 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
 
 		ring = &adev->vcn.inst[i].ring_enc[0];
 		ring->use_doorbell = true;
+		if (adev->vcn.disable_kq) {
+			ring->no_scheduler = true;
+			ring->no_user_submission = true;
+		}
 
 		if (!amdgpu_sriov_vf(adev))
 			ring->doorbell_index =
-- 
2.54.0

