Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFB8A8C56
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Apr 2024 21:54:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DEA1137AE;
	Wed, 17 Apr 2024 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pBHJzbP+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 560851137AD
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Apr 2024 19:54:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqjhz41wxN6+lOKY2wKjI/ZG+WsMbDEezy+w+71i7lL0B4V6Xr4e0XyQFlVG3yLcOIxRsPbTRJtavWe+Mk3IX8W8ZkLX1Wyfz23Ydbcw7obRkwsDGbis5bLdevMI4qqqJ0JRHRGVJwsOaQIrsZFjpFpLlfRyYqD2VgyXmQjopJBIsAL9nmEImJfwhndp0kiQZR/dz8vQm8iYkb2otdAaIvBuNkkmgT4wDq25+aPCpUjl4yWu3OxPNbeYkDrE4lu/qosbqqVmvYyrNnJF2V8jWZCmceCIzkLrPDlZM78aqDptYRGEdmguaVDbcsHjYqOHwTMpiCdhNyw34Rqbzd+Geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pkp9Q7rNEpHABITvSHfNlQRug5SxFLyjwi2DbRXxPzU=;
 b=oP+yOHfMk9v3RBxq7a7peXxvY3oFQnlSSToJ8Bt17KZg7ekO/slkgtq/dVWVpddjcEkIR+8qPcZqH+4Czh1YlQMVQ1Hx2J2fwEXx4NUzoKmr9GoYWHbXz7Dn0hPiSxVc6YOJdz4uSVAvzStuXiQmvhC6f5ynsbIZGwv5IGl5XfGAB7VAYZoqCwd2c/Ov3Br3eTnKhhUIW8406NTsszRAC1KxUp+gSVJHiMYh4qIAKa5pI1hpCi98MP28/eYqKBDSaGEAWZ/8dvOl6U6sWBkAiImlQWAsCx7hIC/7C4QiLs8ISZONAjpvauWod2vWZ70U5d/ABvPd9y1lO5Fqoko1HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkp9Q7rNEpHABITvSHfNlQRug5SxFLyjwi2DbRXxPzU=;
 b=pBHJzbP+XGC/gyUFq6fpnbjaojnFnYIRMLFQtdPPK9/pey4RKGU7C8NdFCqXmLtlA8FFLdwb/0/0PmxbC7LbDqpZzXP9krJ6lZ+DHmOFr3tSPZdTj3M4CCHgd2DI6C9Wrbf8OgA92XqkLHs3YlvWa4ERfiH/6vDeAJDz9n8u9Qg=
Received: from CH2PR17CA0012.namprd17.prod.outlook.com (2603:10b6:610:53::22)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 19:54:32 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:53:cafe::42) by CH2PR17CA0012.outlook.office365.com
 (2603:10b6:610:53::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Wed, 17 Apr 2024 19:54:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 19:54:31 +0000
Received: from MKM-L1-ZHLUO987.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 14:54:30 -0500
From: Zhigang Luo <Zhigang.Luo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Sashank.Saye@amd.com>, <Jeffrey.Chan@amd.com>,
 Zhigang Luo <Zhigang.Luo@amd.com>
Subject: [PATCH] drm/amdgpu: remove virt_init_data_exchange from poison
 consumption handler
Date: Wed, 17 Apr 2024 15:54:16 -0400
Message-ID: <20240417195416.10997-1-Zhigang.Luo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: d032ed44-7efd-496f-e236-08dc5f1832ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLavmDxt6PJo+J/6ck3jwcE1fv4B9o3qfSzB1d8kAABY+Cx36fagTsq/9d1FIZUD5eyAT3kE2W/etC/doYXCYK7QngY3p9y0n9L6sGm5Mu+KqFUAPf4LxVhfnDD9E9Oe/u4IzP0NbUCOLQXq3HKOj69/MJNb6LgjOZ8sxJPDMnYdG8UQ57bLJm39H87Z3XfVHb3XApw/ya6Q+D0orPDlZ2v4x+RsGH6a59obFLrIFRUU8o2TfZG2KRko0VfZZFF47B8p0Z3PdxZy+TZH/mu116AYF8oqTdsnAOGC2XW8CK1gZF7x0eIBKxU5Uj4abLx3g4tWOeE30zGxio2s9z8CZdeu/xaTyd5hJV/BRUm7V+kKMX4Ts1EhbIaJbMSKrHP3g1bVaaRD4dWY1zjisEE7Rjcuya/zVN9RNk6sLZDSCsOuks7XAKqE0JVY+O5cZdiD1DnfvPK8MJqBi6zP9havEbi+vXrZnE4T2fB/wDRjGr9oMLnoCjnvcziwzS5c3BnlskJyopK4GXW4zonBDWcU3CaM8xMDez4lOR2kyFGsAbGrlMmf2b+eU3cuIY4bwcWst/qR6GNijW7/RcOQxZ6475fBthSPOHZV9yZp2NedEwhPLiWo1vJWKL5lwqejCLM769GTVjopukY1cF90zuxdUDRWyRttb1OFTvrDj74BdZtYTcOHboYHSmYbVVNsQGmxRZzGy4w7NfJ7cY5qgvm5toRd5SGLv0/3SG4UOKIRstHoONO9D4XI4Meoz4bLQENC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 19:54:31.7578 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d032ed44-7efd-496f-e236-08dc5f1832ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
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

Host will initiate an FLR for all poison consumption.
Guest should wait for FLR message to re-init data exchange.

Signed-off-by: Zhigang Luo <Zhigang.Luo@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
index 89992c1c9a62..aba00d961627 100644
--- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
@@ -446,8 +446,6 @@ static void xgpu_nv_ras_poison_handler(struct amdgpu_device *adev,
 		amdgpu_virt_fini_data_exchange(adev);
 		xgpu_nv_send_access_requests_with_param(adev,
 					IDH_RAS_POISON,	block, 0, 0);
-		if (block != AMDGPU_RAS_BLOCK__SDMA)
-			amdgpu_virt_init_data_exchange(adev);
 	}
 }
 
-- 
2.25.1

