Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOUMCSf4ymmlBwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 00:24:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF8F361E4F
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 00:24:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5F810E468;
	Mon, 30 Mar 2026 22:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="n/Eq576n";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010067.outbound.protection.outlook.com [52.101.56.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE3D10E468
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2026 22:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bocJw0s9u2bZuN8VzT/jS5GEMRxYrttFhw/G26LzbhRZuSR7a1oTYO/Jz2A4X9y5etvZd7djea3h1kljyIsBNKSmoIt1qvBBQf0dyeE/dOYNwwETjrDu7+lOHxlkdRk+8IVp9m31UPwyw5WxTmHVyXYyMie9tsDzetMRZ+h9xmiteLZNhICsH8VkZDUls8bCv/R/S1muBjqqTiNaUObXlJofaS84tbGixS10TzQUWcbzPBf04fJLOsmoGYiL7Q+VBXysDeGKUxCwVpAzdaDbcNAmEy5PuQiGbrslorxzxGnD7Wrx2FhWq3/dckZz5eOs1lauHo6JBWDQnd4roCxlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/9SE8HmtubFsB08tbqZZFEIHwbkyfI/qAT7JTei0lE=;
 b=OYWD8UOtBkc06KdIpnTKGSasQHNX8ba+novFQZBK7A8cbNaN/XQTCJ0YwGKMHrURoyJ+w4OevVclXTHuro1LMYfJ4K/EJqgcSeeIFoGPguaavxHFSKBk4k0qBRNgUrHIpKoGjh6nDObwnpIWqLLBgLnMuHofTQlInEaJmooArN6B4JHKorOyXQStbjj4qrgaX3kWEO/pw0XIl6p2g10t1ZvMcURNOtoTlE7uNVt85U8o88UNEQ0LMN9SOZgm8ApU7AWwrC3vJ4wH3t8rKt9GV8OP8pTA7apDOg6zOZchQUrxJVRwip+bdU8zq4TdVbGmKVm2zFDcfmrf4QooT5/TPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/9SE8HmtubFsB08tbqZZFEIHwbkyfI/qAT7JTei0lE=;
 b=n/Eq576n4ju1H45Z62TB4/FQOqSTnwV+qMjzeSkZgahTBdNlJ2LHy56KDjITgj0u5AcO7fxz0fOV1HYb1SavEY/P6DT9wRWA+vYG/3SO4qjKZudXQ2rAEduhlxnjaWIm/eB3RRz+4frccywG2qfzyeo5lKJLsFCvqbs/2X9vNYo=
Received: from BL1PR13CA0109.namprd13.prod.outlook.com (2603:10b6:208:2b9::24)
 by LV8PR12MB9689.namprd12.prod.outlook.com (2603:10b6:408:296::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 22:24:31 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::37) by BL1PR13CA0109.outlook.office365.com
 (2603:10b6:208:2b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 22:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 22:24:30 +0000
Received: from david-B650-PG-Lightning.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 30 Mar 2026 17:24:29 -0500
From: "David (Ming Qiang) Wu" <David.Wu3@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>
CC: <leo.liu@amd.com>
Subject: [PATCH] amdgpu/jpeg: fix deepsleep register for jpeg 5_0_0 and 5_0_2
Date: Mon, 30 Mar 2026 18:24:14 -0400
Message-ID: <20260330222414.219436-1-David.Wu3@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|LV8PR12MB9689:EE_
X-MS-Office365-Filtering-Correlation-Id: 80fa1570-106f-4981-1039-08de8eab1ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: KfAE4kGqHMFfDvJlIMCGWy9NaiQZkH5geqE0Xmh383P1sTObWJSsV4o7PIspY6XtxAkA6uxSVBoKQ1XNsaOZaeDy/rPSvMsmJ1dvP2cE2FDQGSXE1vVfWISLeSAr9wUrwrQ7Xgs8pt+0l3PHQh4yzA0BeEKAbkER2vdLto8bFeZ2f8ZwHL+A2h5NqIpsq8obmmvNnHl8MkVi+ScHGELZo4uK9Pdx8PCooko5JNX2G+esZjeqNCooJa7odyCVps7wDPf3oZv5VngFCzFEPB0Tp5q39Se3wIpoovtaWRqXmjPmGB14533+nMbl8RkQ1SybfqYkOv0asSaAssGSMitW+0eMo+kSj8F7ONFMNVK1owshCnwL5uSFVmo8u1HGlAmVHlS3iTXY+x+ihi6Dv1e8pgRWkhP7ZVQ1Tk9fToBk+q1HrilIKl83DA1olgn64A5ChRHUmcZzqQIVejugppXzm4vKyBJPJToJuk3SAcv18biV6c5QXJmLq+50TsA2farQ+4dW8EPJ658xg92z5325pHZ3ViW0EzMcu0KxyOJNOy+Y/xxklBiFCRpRrZv56VkOObbzsKMfyQq0oIN0t/1kW/9uRHrUHe+fHqRZbjTEzxCWNzY+xmbBv7Wr58cOXA3AZ9c+rRsz2sttfbstCzJrAcBr6Bu/ra0qHKn+FHxBS7nTogDYNs3msMlpdz7rEoE3yZ2JAwPJEVSc/1WiarzbrtwlcXwAYIRUZxd/xaFbl1liYBhS19xiygM4f3YwMuoS5DQot5wSFOmaeaPb8Q3vTA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ymA6EMSysQm7LWUdkHuN3zDoDeEa+5nsqHh5JIOKxyl0kuctoXsVsN01/DA2N0VjbxiiANgrxvaKMuHTFX32484GhwHKGJo2QBqu/Mb2wB5twkkZagD5jjZhopnF4jBRJ1yanaGXHd2inEMJMCYGnHWKWBzbY5Ru55NxemwkmDMLJLrsjt253cpkHfx5W9Nn7kCe6Rhc2U9yNxu4zYLKKAdgVULEgZAhNpHFpSd+CGztkajpoiC/o5bkEn1QzMbYc+78nm5u0iW+5DL2bPBvSQVhPyMsgurYPrALm3yhIdvXNsDgfLIDPNdJYP3+hSlEpxk6TGqXE/7zgbM1Yt+bzRxouBTGhFYUqIVjfJnDlbBfA0LoWFAAG+ImpLHTtdjfXP2vtKoQ/YDfR4yLv/MoJ7q3As8bdUPKbrNP8HYxCWllWJr/axXwCRYa9J4VBtbh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 22:24:30.4067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fa1570-106f-4981-1039-08de8eab1ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9689
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[David.Wu3@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 6AF8F361E4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

PCTL0__MMHUB_DEEPSLEEP_IB is 0x69004 on MMHUB 4,1,0 and
and 0x60804 on MMHUB 4,2,0. 0x62a04 is on MMHUB 1,8,0/1.

If deepsleep is working then the MMHUB clock will run slower
while idle but speed up once anything happens, so some operations
might take a little longer to get started.

Based on the logic above and tested on RX9070.
1 with 0x69004 set 0x80004000 at start, 0x4000 at end
2 with 0x69004 set 0x4000 always at start and end
3 with 0x62a04 in case 1

results:
 - case 1 shows the best startup performance. speed=9.8x
 - case 2 shows the worst startup performance. speed=7.5x
 - case 3 is a little bit better than case 2 at startup. speed=7.7x
This clearly indicates the case 1 is correct.

Signed-off-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c | 28 ++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index 4b4aa9553624..03883b3b5670 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -739,7 +739,19 @@ void jpeg_v4_0_3_dec_ring_insert_start(struct amdgpu_ring *ring)
 	if (!amdgpu_sriov_vf(ring->adev)) {
 		amdgpu_ring_write(ring, PACKETJ(regUVD_JRBC_EXTERNAL_REG_INTERNAL_OFFSET,
 			0, 0, PACKETJ_TYPE0));
-		amdgpu_ring_write(ring, 0x62a04); /* PCTL0_MMHUB_DEEPSLEEP_IB */
+
+		/* PCTL0__MMHUB_DEEPSLEEP_IB could be different on different mmhub version */
+		switch (amdgpu_ip_version(ring->adev, MMHUB_HWIP, 0)) {
+		case IP_VERSION(4, 1, 0):
+			amdgpu_ring_write(ring, 0x69004);
+			break;
+		case IP_VERSION(4, 2, 0):
+			amdgpu_ring_write(ring, 0x60804);
+			break;
+		default:
+			amdgpu_ring_write(ring, 0x62a04);
+			break;
+		}
 
 		amdgpu_ring_write(ring,
 				  PACKETJ(JRBC_DEC_EXTERNAL_REG_WRITE_ADDR, 0,
@@ -760,7 +772,19 @@ void jpeg_v4_0_3_dec_ring_insert_end(struct amdgpu_ring *ring)
 	if (!amdgpu_sriov_vf(ring->adev)) {
 		amdgpu_ring_write(ring, PACKETJ(regUVD_JRBC_EXTERNAL_REG_INTERNAL_OFFSET,
 			0, 0, PACKETJ_TYPE0));
-		amdgpu_ring_write(ring, 0x62a04);
+
+		/* PCTL0__MMHUB_DEEPSLEEP_IB could be different on different mmhub version */
+		switch (amdgpu_ip_version(ring->adev, MMHUB_HWIP, 0)) {
+		case IP_VERSION(4, 1, 0):
+			amdgpu_ring_write(ring, 0x69004);
+			break;
+		case IP_VERSION(4, 2, 0):
+			amdgpu_ring_write(ring, 0x60804);
+			break;
+		default:
+			amdgpu_ring_write(ring, 0x62a04);
+			break;
+		}
 
 		amdgpu_ring_write(ring,
 				  PACKETJ(JRBC_DEC_EXTERNAL_REG_WRITE_ADDR, 0,
-- 
2.43.0

