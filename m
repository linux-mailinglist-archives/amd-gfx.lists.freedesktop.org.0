Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLkHCOuxqGkzwgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Mar 2026 23:27:55 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5620888D
	for <lists+amd-gfx@lfdr.de>; Wed, 04 Mar 2026 23:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79410EACD;
	Wed,  4 Mar 2026 22:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cFFQwgOK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012038.outbound.protection.outlook.com
 [40.93.195.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B7C10EAC9
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Mar 2026 22:27:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGf1PjrCkSBM0OxZ0CH+d9MtULw2iJ11cIkumT7nuSdcBTnJzDaCOaFzDtQny1K4Nq0JYvfj+kkHkR+WhspedMqqB3umJHUDPP1NCCiG1yA9XkeB594/H1A1WAnIhRYF5bK8G0lpHS9yUwzuzXVP18A/Ajh+1PypRW+R+8ylPvS0FTWmE5s+k3Tb59X27V5QVhzy4p5AQYm5U1Fs2F0pxxEOXOFwio7aKnjZu3buAq68N+KYtAKMCjUvshuXRLf8AyZ2lGrj0duc+AmxXQiVUHeyKcLLA6HrXQsZhHKYxOIIBK4kPwwd7OvHzyaZ5ZjMx2OgEUkxXT4mY3UVc7XIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0j0nQxu2f+LSkGcvDq6OAAq89db72+mqwfjFQwzHWM=;
 b=b7AtkSsvgCfwzxUMHtC6X85s4ZBQvYyvRaajD8nqlYtjBGNrs3UKr10cnH65GApPBkBxmxDnEPTU1E3LPN2/19tLSPXHqKJToyfuPVUgtbZG7b7uTOhsKgdo18E1tL7vuaWjW3q3CT9W9cnlOrIKkmzNjS9EKZynAPn8/HgOKBLfoy7+A9C7akKx1wthhTkii7bIa0LLZE88NusyShd8MkWbthX4+O5eHrAvXjXLY2Pjmd2Hd0GYo4YI2OLFLbNCEtYeUO6fZcYFMSh5ewk91Fd5KKDgexygoFJ5KaM4Ddfb0erpZ+sPAn8Tak1PpX2KZSCaj8632GKBUx288Sbtdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0j0nQxu2f+LSkGcvDq6OAAq89db72+mqwfjFQwzHWM=;
 b=cFFQwgOKAB0DjWgrKRgpQhyB6OIlczAwd6Me9WvDW81gD0NpNha0NbCzXm2+DsKRjrqEuwRmKdUfgmHbQ2tqeRr0YO1onfymXjzOACtrbpD9oFzExK22aldWMzbFGKbU8nZj1MzB80c2XuSXnaXXvq7chdhQ/AFmQHKin3iTXQ4=
Received: from CH0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:610:11a::20)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 22:27:46 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::6d) by CH0PR03CA0358.outlook.office365.com
 (2603:10b6:610:11a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 22:27:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 22:27:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 16:27:45 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 14:27:44 -0800
Received: from p8.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 16:27:44 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 5/7] drm/amdgpu/mmhub3.0: add bounds checking for cid
Date: Wed, 4 Mar 2026 17:27:30 -0500
Message-ID: <20260304222732.2403409-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304222732.2403409-1-alexander.deucher@amd.com>
References: <20260304222732.2403409-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d28bdd9-4566-426c-2c70-08de7a3d4228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016; 
X-Microsoft-Antispam-Message-Info: qMPrSl8YXwAX+1lTNJRpzR6yJTL0mvMOmh3r/DHLRef2HmCrVkqhXL86yGh2kCapd/BokYqzbImEkdkX+U47UEw5pNlXRQElg2mHo16gK9dr9hhx+f/oc63V9LmUKuBkZuCJlyHRtSLZde2TjxppCyJh19PQMALHDr/kd7G4kgknyD7kXqoOPaVFgq0VYGylCLv2aZoFaXnS/QPAWisc4m4SexOreMuqPrwSofJFu9Yj0E7LfepCs9pG8+PdNHbuUM0h6Wwl/PD3OrPM/RK+31ndrjMUvS4TSTGdxb6isJX5PkkBMfG2DmUPnK+U+QVyRu9GG1Y9pHv7JypNRyGbd4VpUGgMQLdmUdi1U37PPNfHX72iVRhnfL/FJod5/IyzPwW8QkxGGdc1d11n5tpNuwbYAYdlF+V2XQwZ16F/BzPwbiekrIaL6UC+vv5LVZTblMHbQCIWulrhRSczJeHQuY/xd6iGIqGThFqNGzZxVSCYaTsjEoTYZAz/rPOVvgHrepmUk3b4hJM8Gn0LkB6+vhIJ7VYVZ0lIIeIq2n/XFNGihGw5jqIklyjUM17wiLz6bFFcQ6TZ4zQ222jRbMU64CRot+EHjusui2ce6/CmFk94ZGZubDLBe1VRTtX6AvXmgaPzXNV8NUhwFMjLVTbGqKbO804ARfQw/442OCTfGVig7hOHdC9PiIr14SIxw47C2fL+Qof/p7uBw9OArmB1AGvgWuSAuG2Bi7RhjAvC/dVVsFghbid4qG0fVM2SeAo+Qc2kTnPD8Ky0S6VIIiKHXg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sJpwSk1PT6z+qwdtmLJbTAo9n00PaH1XRMlZeqL/Ubu/9U5PPoY+YXEpHo22a03JdvecsWLr5OCqQOaTdO36JT1LB0teqmNFyoyl2NDqDltaYvnTcNkcx4LnSavhD53XdH4N85ppKuDrlTdS+nlTDhmNahHaLcuMezLH6MXY7Cw4aqJPZvJlrfh08BSIEdiQL9nAU5TiLy+x+StijyVnubx4GQhE7U43DiK1HVEC8ELL7nyUEDG1mD92ghz5BlLhNQkhkJ1VPEJMo+xz0QWhMF7WwFu5CXFlaJpwDNWh9ONfnOhjOkEWyyjG+9Qjcnhu8shBuRDqSd8MiL5gYNzO0K+pMNlKrOyXB2LR6HQqcrgHhtoFPMw13uM3EwEnfeV1OicsvghYODgyZCWhwdZ6nSeE0afigIOeXZzprWt23U8MkR0KXfV/zVTiQzqoR2ML
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 22:27:45.4439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d28bdd9-4566-426c-2c70-08de7a3d4228
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
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
X-Rspamd-Queue-Id: C3F5620888D
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The value should never exceed the array size as those
are the only values the hardware is expected to return,
but add checks anyway.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
index 7d5242df58a51..ab966e69a342a 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v3_0.c
@@ -110,7 +110,8 @@ mmhub_v3_0_print_l2_protection_fault_status(struct amdgpu_device *adev,
 	switch (amdgpu_ip_version(adev, MMHUB_HWIP, 0)) {
 	case IP_VERSION(3, 0, 0):
 	case IP_VERSION(3, 0, 1):
-		mmhub_cid = mmhub_client_ids_v3_0_0[cid][rw];
+		mmhub_cid = cid < ARRAY_SIZE(mmhub_client_ids_v3_0_0) ?
+			mmhub_client_ids_v3_0_0[cid][rw] : NULL;
 		break;
 	default:
 		mmhub_cid = NULL;
-- 
2.53.0

