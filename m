Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3DC9B513E
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Oct 2024 18:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371BC10E6BD;
	Tue, 29 Oct 2024 17:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e8Sy0woW";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F56B10E6DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Oct 2024 17:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VI0D/UhxEWvL9IGSnXv00xnlmnKX7Cq2ADraL78rfLINL8icQmrNyIr0/aCdiOItVTpOZ3dYpApKzonq40LOgIOgVtEdGjYTL+fxsaY6IvRtavLCCJasr9/kCCyDgH0Eef1g90F9td66RUWL80D0PAqO+a+/T50WAOf23rTrSdryNQY+PGcZihDkkXyCh8tqBih0AQpJNlioAeOz0zJ8IMgncFBWI0JKxecm3KDqEBm2uTMKQDJIlhS7zzZVZpns4+028T6kUbYa6GhB7HCp/zQEWHdDYwOpzKyrMJ/NQjRRvGv2sWHuHI9Qh4YCGM7iWes/6yOsqsd/1YFOyBNrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VSbOtmRgypk+McjEckJ/zZlWOe5eXLy8Y0bXXdeAbo=;
 b=yvrppnWscZ3QrGbzqcsubaqU3kpIcnlDRR3nOB5Rwa2j0dZOC6hjpjSD2/KiPKTaEdIXGkCPtXhcGTaIgnL2azEQE9PIJEgcpH7llVfpFBou2G0JKW3uhgf2VJXHbbniqdjxjPLPWgRUTGOZznWFdwERY5qL8t8xM7WXVvRb80IgyPffTnbrpTSRxn77oDpiMMSCaW+4SSU7kdg2gTdRvKB+5e8Ggc0Ovv2xmMg5k89tRAY6QYutjYGx5QzLepReplXgOdLzs1X9lXHHL52aG1+307hfCs9DA6+iXotlSErMwSGiXbFhMuyG//8bDc6ymG7BUEWhJkEjz7lr0kue/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VSbOtmRgypk+McjEckJ/zZlWOe5eXLy8Y0bXXdeAbo=;
 b=e8Sy0woWxjF0cY5huqK7ODdvpE5FHo9fbz5Iz8JeJC87Ajfy1XARW2ARvBE+CFX1oHja4LXYLTy9fB7PNYl5lfuB+J5wscg/2NEb522AnVbo/ibingVCMTp25LU2UJZpLDZD2rbNlYmtqJzV+yuJmRTI4l1A8jvgR3C3sjyqwUk=
Received: from SN6PR16CA0047.namprd16.prod.outlook.com (2603:10b6:805:ca::24)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Tue, 29 Oct
 2024 17:43:09 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:805:ca:cafe::44) by SN6PR16CA0047.outlook.office365.com
 (2603:10b6:805:ca::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Tue, 29 Oct 2024 17:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 17:43:09 +0000
Received: from atitest-Rembrandt.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 29 Oct 2024 12:43:02 -0500
From: <boyuan.zhang@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <leo.liu@amd.com>,
 <christian.koenig@amd.com>, <alexander.deucher@amd.com>,
 <sunil.khatri@amd.com>
CC: Boyuan Zhang <boyuan.zhang@amd.com>
Subject: [PATCH 23/29] drm/amdgpu: hw_init for each vcn instance
Date: Tue, 29 Oct 2024 13:42:34 -0400
Message-ID: <20241029174240.682928-24-boyuan.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029174240.682928-1-boyuan.zhang@amd.com>
References: <20241029174240.682928-1-boyuan.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|SJ0PR12MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d20cef-0d05-4d3b-7171-08dcf8412714
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?scaS9l7O9dzykPJ1oGL9TiVzXtzuy588eCpQL1t8gjUejyDZWUoa486Js2Z+?=
 =?us-ascii?Q?oMvWw8b1KPcF06HnHggAAt+ahSeI4CYulLZmcQaAgD3BIGjPCgCOWUXvfZdc?=
 =?us-ascii?Q?7bCiWpcTztuHFyEUA/O9IH9sKI3kKeM3oMl9CW7vBFmyxnC8TyXrzWv+o/tx?=
 =?us-ascii?Q?xd6NuUtixn+XZcZqiHo4ulmNIcHwWGNx4H4vSqRA4RSznINcOXLr3uNZ3rlg?=
 =?us-ascii?Q?nhfQp8orVX6RvEs5LiKYDTMQQVuVE+3vJLafRDVzlpcGnLetsuGeMk9Uv573?=
 =?us-ascii?Q?1wCn0L2cK9HgHwwA99zCSiWv1PoAeEsJbGHi5efoTneHjr8BlrgkDB90L5/4?=
 =?us-ascii?Q?aCMjiF2e8dIcuMyQ+GosQapD2uG6j0NYssG/ZkzAu/QTyKQ0YUgE2U5pL25J?=
 =?us-ascii?Q?RFEu84TcvkaiSrN6nXx0uePH2myLuT8Bxf/94s7Vq4vH+55D55+p3nkHs9PB?=
 =?us-ascii?Q?9mu6fELpw86yU5DE7fBmmFDOr0GtseFb8d6CJV1cjJ4arAkaZOrNsexhksTo?=
 =?us-ascii?Q?tfNQRG/8LNh2qzjuJ7vYn7VWYS08CDtcxNzKnhteqIO+gwiiLPe4Ss5g/aYy?=
 =?us-ascii?Q?HRozqCk44rzrGB0fzKFaMSyyhMZcneuvhPtLEx9rZCLzO6gG0TSg6EUj+xpr?=
 =?us-ascii?Q?1UdkIoOkzlb0K9/SFMIyfjRRTRH+5dQ4vcoVtHKRByXLKFlcssinkCtDDcdQ?=
 =?us-ascii?Q?DXQoh5FNGd8RxyDs6c0KFl/qnSPWQ7CXD6QHZtk58YqKmVYd4Pvq6sWi9tPk?=
 =?us-ascii?Q?uWdcudXMbJERJAu9nAxfbTBXxsHeyhameYDgCe4/aHN8WAT0c9Hr16AU3WZV?=
 =?us-ascii?Q?IEGL+lJ4T6dIGj2UC52CzEZqZu7ByDNeu2LURnSmJkHUQ0qYnnvhV8G/fc0z?=
 =?us-ascii?Q?qreOabgMHZ9+VyIlqQpv3d3A29CLqzWeoffVEf2tqIyTsfmgDI7OuRa/T7EW?=
 =?us-ascii?Q?ZhBhhC9m/XIUiUQAS2RHfULJaRcD2z4dOO/1ALhV2YY8q19nZQZ0Uty2aR3Z?=
 =?us-ascii?Q?vg+VJfg626JiiFtUdt0MsJphEigT+x4xIG9hSVSl8StG0mJSeG62KuySfDa+?=
 =?us-ascii?Q?z5FHEU39e8oB6xMiUyjMVgDWNmj7L3QhGO98ySR+O8wG7MPKjtl7NMj0QGUo?=
 =?us-ascii?Q?O60L2/LNwVAqeNZXYoUDOeG5Bs5fhYukObWmuNETL4N/QzUbP7lIWwRw9x1v?=
 =?us-ascii?Q?bhf8u5ipVtUPXmLn1Ba5ZFCOAyB67W1pkCceamsx7AUTDZ/C9GmqqSHXx1+R?=
 =?us-ascii?Q?0h8ypzZvwBJ1TVbaTULXfjsJ1pNeYm902us+EWtNcUn4w2YBj7Ibn58LMvho?=
 =?us-ascii?Q?ubBqQieCW9rXFJp+RjnF46VwFXrMM+Pc3cxxGGOqB8ji3944FLr8IcgHUnGz?=
 =?us-ascii?Q?BpzhowTUVWQbQhDG5rGlH3dPuBN/eCCYHcLlPkPgXeWoFboAOQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:43:09.1200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d20cef-0d05-4d3b-7171-08dcf8412714
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965
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

From: Boyuan Zhang <boyuan.zhang@amd.com>

Pass instance parameter to amdgpu_vcn_hw_init(), and perform
hw init ONLY for the given vcn instance, instead of for all
vcn instances. Modify each vcn generation accordingly.

Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
Acked-by: Sunil Khatri <sunil.khatri@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   | 39 +++++++------
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   | 73 ++++++++++++-------------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   | 37 ++++++-------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c | 67 +++++++++++------------
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c | 21 ++++---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 21 ++++---
 6 files changed, 123 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index d135e63e7301..8ce3cea6cf44 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -338,37 +338,36 @@ static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
-	int i, j, r = 0;
+	int inst = ip_block->instance;
+	int i, r = 0;
 
 	if (amdgpu_sriov_vf(adev))
 		r = vcn_v2_5_sriov_start(adev);
 
-	for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
-		if (adev->vcn.harvest_config & (1 << j))
-			continue;
+	if (adev->vcn.harvest_config & (1 << inst))
+		return r;
 
-		if (amdgpu_sriov_vf(adev)) {
-			adev->vcn.inst[j].ring_enc[0].sched.ready = true;
-			adev->vcn.inst[j].ring_enc[1].sched.ready = false;
-			adev->vcn.inst[j].ring_enc[2].sched.ready = false;
-			adev->vcn.inst[j].ring_dec.sched.ready = true;
-		} else {
+	if (amdgpu_sriov_vf(adev)) {
+		adev->vcn.inst[inst].ring_enc[0].sched.ready = true;
+		adev->vcn.inst[inst].ring_enc[1].sched.ready = false;
+		adev->vcn.inst[inst].ring_enc[2].sched.ready = false;
+		adev->vcn.inst[inst].ring_dec.sched.ready = true;
+	} else {
+
+		ring = &adev->vcn.inst[inst].ring_dec;
 
-			ring = &adev->vcn.inst[j].ring_dec;
+		adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+						 ring->doorbell_index, inst);
 
-			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-						     ring->doorbell_index, j);
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			return r;
 
+		for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
+			ring = &adev->vcn.inst[inst].ring_enc[i];
 			r = amdgpu_ring_test_helper(ring);
 			if (r)
 				return r;
-
-			for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
-				ring = &adev->vcn.inst[j].ring_enc[i];
-				r = amdgpu_ring_test_helper(ring);
-				if (r)
-					return r;
-			}
 		}
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index d00b7a7cbdce..36100c2612d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -345,8 +345,9 @@ static int vcn_v3_0_sw_fini(struct amdgpu_ip_block *ip_block)
 static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
+	int inst = ip_block->instance;
 	struct amdgpu_ring *ring;
-	int i, j, r;
+	int j, r;
 
 	if (amdgpu_sriov_vf(adev)) {
 		r = vcn_v3_0_start_sriov(adev);
@@ -354,57 +355,53 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
 			return r;
 
 		/* initialize VCN dec and enc ring buffers */
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
+		if (adev->vcn.harvest_config & (1 << inst))
+			return 0;
+
+		ring = &adev->vcn.inst[inst].ring_dec;
+		if (amdgpu_vcn_is_disabled_vcn(adev, VCN_DECODE_RING, inst)) {
+			ring->sched.ready = false;
+			ring->no_scheduler = true;
+			dev_info(adev->dev, "ring %s is disabled by hypervisor\n", ring->name);
+		} else {
+			ring->wptr = 0;
+			ring->wptr_old = 0;
+			vcn_v3_0_dec_ring_set_wptr(ring);
+			ring->sched.ready = true;
+		}
 
-			ring = &adev->vcn.inst[i].ring_dec;
-			if (amdgpu_vcn_is_disabled_vcn(adev, VCN_DECODE_RING, i)) {
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+			ring = &adev->vcn.inst[inst].ring_enc[j];
+			if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, inst)) {
 				ring->sched.ready = false;
 				ring->no_scheduler = true;
 				dev_info(adev->dev, "ring %s is disabled by hypervisor\n", ring->name);
 			} else {
 				ring->wptr = 0;
 				ring->wptr_old = 0;
-				vcn_v3_0_dec_ring_set_wptr(ring);
+				vcn_v3_0_enc_ring_set_wptr(ring);
 				ring->sched.ready = true;
 			}
-
-			for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
-				ring = &adev->vcn.inst[i].ring_enc[j];
-				if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, i)) {
-					ring->sched.ready = false;
-					ring->no_scheduler = true;
-					dev_info(adev->dev, "ring %s is disabled by hypervisor\n", ring->name);
-				} else {
-					ring->wptr = 0;
-					ring->wptr_old = 0;
-					vcn_v3_0_enc_ring_set_wptr(ring);
-					ring->sched.ready = true;
-				}
-			}
 		}
-	} else {
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
+	}
 
-			ring = &adev->vcn.inst[i].ring_dec;
+	if (adev->vcn.harvest_config & (1 << inst))
+		return 0;
 
-			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-						     ring->doorbell_index, i);
+	ring = &adev->vcn.inst[inst].ring_dec;
 
-			r = amdgpu_ring_test_helper(ring);
-			if (r)
-				return r;
+	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+					 ring->doorbell_index, inst);
 
-			for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
-				ring = &adev->vcn.inst[i].ring_enc[j];
-				r = amdgpu_ring_test_helper(ring);
-				if (r)
-					return r;
-			}
-		}
+	r = amdgpu_ring_test_helper(ring);
+	if (r)
+		return r;
+
+	for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
+		ring = &adev->vcn.inst[inst].ring_enc[j];
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			return r;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index 7c3a62f84707..00ff7affc647 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -299,37 +299,34 @@ static int vcn_v4_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
-	int i, r;
+	int inst = ip_block->instance;
+	int r;
 
 	if (amdgpu_sriov_vf(adev)) {
 		r = vcn_v4_0_start_sriov(adev);
 		if (r)
 			return r;
 
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
+		if (adev->vcn.harvest_config & (1 << inst))
+			return 0;
 
-			ring = &adev->vcn.inst[i].ring_enc[0];
-			ring->wptr = 0;
-			ring->wptr_old = 0;
-			vcn_v4_0_unified_ring_set_wptr(ring);
-			ring->sched.ready = true;
-		}
+		ring = &adev->vcn.inst[inst].ring_enc[0];
+		ring->wptr = 0;
+		ring->wptr_old = 0;
+		vcn_v4_0_unified_ring_set_wptr(ring);
+		ring->sched.ready = true;
 	} else {
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			if (adev->vcn.harvest_config & (1 << i))
-				continue;
+		if (adev->vcn.harvest_config & (1 << inst))
+			return 0;
 
-			ring = &adev->vcn.inst[i].ring_enc[0];
+		ring = &adev->vcn.inst[inst].ring_enc[0];
 
-			adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-					((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i), i);
+		adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+				((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * inst), inst);
 
-			r = amdgpu_ring_test_helper(ring);
-			if (r)
-				return r;
-		}
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			return r;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 5a3de3dbc3c9..feb373a96cfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -257,49 +257,46 @@ static int vcn_v4_0_3_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
-	int i, r, vcn_inst;
+	int inst = ip_block->instance;
+	int r = 0, vcn_inst;
 
 	if (amdgpu_sriov_vf(adev)) {
 		r = vcn_v4_0_3_start_sriov(adev);
 		if (r)
 			return r;
 
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			ring = &adev->vcn.inst[i].ring_enc[0];
-			ring->wptr = 0;
-			ring->wptr_old = 0;
-			vcn_v4_0_3_unified_ring_set_wptr(ring);
-			ring->sched.ready = true;
-		}
+		ring = &adev->vcn.inst[inst].ring_enc[0];
+		ring->wptr = 0;
+		ring->wptr_old = 0;
+		vcn_v4_0_3_unified_ring_set_wptr(ring);
+		ring->sched.ready = true;
 	} else {
-		for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-			vcn_inst = GET_INST(VCN, i);
-			ring = &adev->vcn.inst[i].ring_enc[0];
-
-			if (ring->use_doorbell) {
-				adev->nbio.funcs->vcn_doorbell_range(
-					adev, ring->use_doorbell,
-					(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
-						9 * vcn_inst,
-					adev->vcn.inst[i].aid_id);
-
-				WREG32_SOC15(
-					VCN, GET_INST(VCN, ring->me),
-					regVCN_RB1_DB_CTRL,
-					ring->doorbell_index
-							<< VCN_RB1_DB_CTRL__OFFSET__SHIFT |
-						VCN_RB1_DB_CTRL__EN_MASK);
-
-				/* Read DB_CTRL to flush the write DB_CTRL command. */
-				RREG32_SOC15(
-					VCN, GET_INST(VCN, ring->me),
-					regVCN_RB1_DB_CTRL);
-			}
-
-			r = amdgpu_ring_test_helper(ring);
-			if (r)
-				return r;
+		vcn_inst = GET_INST(VCN, inst);
+		ring = &adev->vcn.inst[inst].ring_enc[0];
+
+		if (ring->use_doorbell) {
+			adev->nbio.funcs->vcn_doorbell_range(
+				adev, ring->use_doorbell,
+				(adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
+					9 * vcn_inst,
+				adev->vcn.inst[inst].aid_id);
+
+			WREG32_SOC15(
+				VCN, GET_INST(VCN, ring->me),
+				regVCN_RB1_DB_CTRL,
+				ring->doorbell_index
+						<< VCN_RB1_DB_CTRL__OFFSET__SHIFT |
+					VCN_RB1_DB_CTRL__EN_MASK);
+
+			/* Read DB_CTRL to flush the write DB_CTRL command. */
+			RREG32_SOC15(
+				VCN, GET_INST(VCN, ring->me),
+				regVCN_RB1_DB_CTRL);
 		}
+
+		r = amdgpu_ring_test_helper(ring);
+		if (r)
+			return r;
 	}
 
 	return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index 2c9f863c40b1..fb1e1d5bcdbe 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -268,21 +268,20 @@ static int vcn_v4_0_5_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
-	int i, r;
+	int inst = ip_block->instance;
+	int r;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+	if (adev->vcn.harvest_config & (1 << inst))
+		return 0;
 
-		ring = &adev->vcn.inst[i].ring_enc[0];
+	ring = &adev->vcn.inst[inst].ring_enc[0];
 
-		adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-				((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i), i);
+	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+			((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * inst), inst);
 
-		r = amdgpu_ring_test_helper(ring);
-		if (r)
-			return r;
-	}
+	r = amdgpu_ring_test_helper(ring);
+	if (r)
+		return r;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 9d67e884952a..137c3b452433 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -232,21 +232,20 @@ static int vcn_v5_0_0_hw_init(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
 	struct amdgpu_ring *ring;
-	int i, r;
+	int inst = ip_block->instance;
+	int r;
 
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
+	if (adev->vcn.harvest_config & (1 << inst))
+		return 0;
 
-		ring = &adev->vcn.inst[i].ring_enc[0];
+	ring = &adev->vcn.inst[inst].ring_enc[0];
 
-		adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
-			((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i), i);
+	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
+		((adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * inst), inst);
 
-		r = amdgpu_ring_test_helper(ring);
-		if (r)
-			return r;
-	}
+	r = amdgpu_ring_test_helper(ring);
+	if (r)
+		return r;
 
 	return 0;
 }
-- 
2.34.1

