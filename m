Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE8AB72B5
	for <lists+amd-gfx@lfdr.de>; Wed, 14 May 2025 19:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2CD10E6C6;
	Wed, 14 May 2025 17:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yA84YKeJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB7910E6C1
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 May 2025 17:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5XS06hupBX6yGKb48S7+4Uutt1IjAovxw/NH3LJOdQyWJpcML4VtalEVDmyK1Hn/WkBNJArmc9JnhJsduHScCKgKJLw+bnhgvP9ikzCgd+2kixV/7baOPFDgssBlGlQYJ48ge6n+N7GJdqzBdwdX2N/S2Ul2rQ83xhHZQxErBNF4jqV7L4XkhDyHKfFRte1mKeDcQMfF2ZmEeqIUrq1LZXFJX7AobpNEyq4hhfdoDf+vnxk6/pskATtTxOPKbeoJxcE5rNue3Kt/eDZXhjsaa7NzKBatxUSjJ2xlBvqkJ254TJ36v8R0zZClhg6YxURm3I3VfuQMoVeY3Wr+fPfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae9EKizHc82AqddxzVfkoIm2LVzPttIuRcNYbLU3p1Q=;
 b=go6V8SYnpjhLHMSrSAYC1iv4H3+d6R2Uj1O+Q5HmHrGori+DKw+ysqR1+HxmJ4givNO2VOPvnzGxwKCUSv6E8sfnmCJLqceRlFU6DkQ3VKzMBHmRWaPWRdaQ/D4LPHObwoOiDLesFu07oexyeb0tk/CiEtuwLNWaOWuf5QKDCIFF+23FPlvQRFycuPQEkPMpoxkA2YbblbKZj4ijh+aYtiUb6CFnZSD0ZjddsbJi1iHFE6VW7bC9HjHs26YddOqtuMxNwdR8DV8Uo2ZoMaZwiBGx4nGpJkK17o8fwBNfs5FGVYjcLKuDvqkUGAveQtRZlQDpTMNoG7T9FZAOzoMrSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae9EKizHc82AqddxzVfkoIm2LVzPttIuRcNYbLU3p1Q=;
 b=yA84YKeJiwW5LsOFNg5WLkxBXm2Y5Db6hVSFM04lbn1HmMAGdLC/vBDQJogvbouTAxCn2U1Scw8J5QiPHcdhbWC4ZlVB2usRpRGw1lQ5mrfkePc/xZuZgNYQGvPxKJ4ST+t+ggcZwHDz0jx8fAfvRIms8DhkgJpPGo1WBIv6DJU=
Received: from SJ0PR03CA0279.namprd03.prod.outlook.com (2603:10b6:a03:39e::14)
 by IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Wed, 14 May
 2025 17:23:11 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::c) by SJ0PR03CA0279.outlook.office365.com
 (2603:10b6:a03:39e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Wed,
 14 May 2025 17:23:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 17:23:11 +0000
Received: from david-B650-PG-Lightning.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 May 2025 12:23:06 -0500
From: "David (Ming Qiang) Wu" <David.Wu3@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>
CC: <Christian.Koenig@amd.com>, <leo.liu@amd.com>, <sonny.jiang@amd.com>,
 <ruijing.dong@amd.com>
Subject: [PATCH v1 7/8] drm/amdgpu: read back register after written
Date: Wed, 14 May 2025 13:22:50 -0400
Message-ID: <20250514172251.726484-8-David.Wu3@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514172251.726484-1-David.Wu3@amd.com>
References: <20250514172251.726484-1-David.Wu3@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f40c078-1f90-4b5f-9a2a-08dd930c007f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?scf+zAnBkcTWGydZZIDf0NSn2FWd7O16AekaccUpbECi++cu1rJYL4/2PjJX?=
 =?us-ascii?Q?qLf1oQ5vsHIJeIw3sg3cZF2NQodoY6QHD1vrlitaBMIfDAazRI51RGKUGMkj?=
 =?us-ascii?Q?AG+80p5dsGqMcpZwsJtOtvlL/bOCE3XsboUg0Mxc+DHB8CsOqK5evfDn6Nku?=
 =?us-ascii?Q?qFcc9TWo9PzJuFDtfhawo3KPCLpmbkiuWYb5G1ztQOEi9uCiQ7b5PgwPdZum?=
 =?us-ascii?Q?2KwzoebuMU5euSv8U4c2VLWrjCfbKrtIEAKLBajAbtpPkSvujNFYHpzC6+cr?=
 =?us-ascii?Q?7xcVugYOK2QY8qx4VXOMBnmSkDmSdkDI3Tkk4qqIM1Qv2FSFghFoJIkg9xJ8?=
 =?us-ascii?Q?+WcoBXGOUwvVh1J+vzpxahdYUFOui+OsIkENNT2oQwcostyKllZq6dCQZTkG?=
 =?us-ascii?Q?bi4/Sl8dXAiPJdul2AycvD4cKTypTvUo5jvwqJ4IcWYzVCSWkNitZvDquRBc?=
 =?us-ascii?Q?cnZYlzS62VKoU/nnw+WUItZozHBLKCskhZk2+CsPCSlWqLSZ/ZKe5pAZKCRh?=
 =?us-ascii?Q?T8SJlCFY3e4gI6DpMGMPm6wrbyOSwvPZ68rzMBBYoFEgHLdZ0y2SL+bvtqiv?=
 =?us-ascii?Q?ZwkLY56GW/DauAoVNPMuYOmAwU633sKm0MlVdO/vUcKkbc6AZrWtvedUM4h4?=
 =?us-ascii?Q?HMMP+BSGgf2cAFwEZZduj5LmV3G1Nwl4ziilYwbVGexjFwzMNr2RWVuX3fYb?=
 =?us-ascii?Q?sviKQ8Trq1716gDG1xbu4Us+ULOySUsEr0QlXmaPLmL3n0GIt1ZlHGkPM/Gs?=
 =?us-ascii?Q?yN+NMy77qVY+I3PePNGGV/ZkUTAnFgaZWdn4O1Jx/+ZAWgc2Ztrj+5gyWoEa?=
 =?us-ascii?Q?68VVKw3vr9miEjADA01iFYNW9DgT4VF7PewDiNXydF8PIDevUybQ24US3rwf?=
 =?us-ascii?Q?Kjnim2Ae45vZ+7zO+eiY2phJiHFk6pceryG8Ok9TKYNVT9FbxfXYNO2YOCae?=
 =?us-ascii?Q?AxLfLuIZhczwYyOtuBRmCB/IyUdozFgvKaLmsVNRIJzeLTcgB+98+pXx4TRD?=
 =?us-ascii?Q?Cc8IQZ0Q32IpqiuGb1hYpgi/yQVyg33bRywDOj6WjQM2r3DZdKfEjJBwNf2J?=
 =?us-ascii?Q?mL6HCXwsVFDH0lqNKvmtJcApoKSwbHkK1yRBr+O+0YA4nZ7a64arodw3PYW5?=
 =?us-ascii?Q?RMATUqQlL71GDjYVVf5Ie5RHmwG5ZcGTUrJdMlHkiLe5E10XhgbhQkZepXw/?=
 =?us-ascii?Q?ZL7RjBa25YLawi/xyBvrNLhlzbAp/4cB3XL2yd8OhJdp+ldMMwDfQnwwRwAw?=
 =?us-ascii?Q?6oaU+2vvOPytZr12aDgl4xoE8PD8Wmv10xZ7AoTLXZyE18EzQCy7iPr+Y0Tz?=
 =?us-ascii?Q?P2GwjFxMa6SZ+P2GagOuXTnJ4odrzTPwXgHtsVGPQS3vYBVsBSAnwwP18bX8?=
 =?us-ascii?Q?heIsKJz3Jo3ALT+CsQr9nVpnI7bsmJ4sZBglL6OPEKgTyrzmwmdooBQFN0Ce?=
 =?us-ascii?Q?BITtkr7vsB5wAzCFh3vcTqh1gzHImhRaQVI0J+tc1Bs5kEpD6JpbKVJqYdMW?=
 =?us-ascii?Q?mLD0yJTdJiKKJIQ2j5R6bphmD5Y7mjOG4uxu?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 17:23:11.2439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f40c078-1f90-4b5f-9a2a-08dd930c007f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616
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

The addition of register read-back in VCN v5.0.0 is intended to prevent
potential race conditions.

Signed-off-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 27dcc6f37a73..bf2bd60415f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -794,6 +794,11 @@ static int vcn_v5_0_0_start_dpg_mode(struct amdgpu_vcn_inst *vinst,
 		ring->doorbell_index << VCN_RB1_DB_CTRL__OFFSET__SHIFT |
 		VCN_RB1_DB_CTRL__EN_MASK);
 
+	/* Keeping one read-back to ensure all register writes are done, otherwise
+	 * it may introduce race conditions.
+	 */
+	RREG32_SOC15(VCN, inst_idx, regUVD_RB_WPTR);
+
 	return 0;
 }
 
@@ -946,6 +951,11 @@ static int vcn_v5_0_0_start(struct amdgpu_vcn_inst *vinst)
 	WREG32_SOC15(VCN, i, regVCN_RB_ENABLE, tmp);
 	fw_shared->sq.queue_mode &= ~(FW_QUEUE_RING_RESET | FW_QUEUE_DPG_HOLD_OFF);
 
+	/* Keeping one read-back to ensure all register writes are done, otherwise
+	 * it may introduce race conditions.
+	 */
+	RREG32_SOC15(VCN, i, regUVD_RB_WPTR);
+
 	return 0;
 }
 
-- 
2.49.0

