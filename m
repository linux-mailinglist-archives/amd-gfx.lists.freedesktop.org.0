Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF528A9164
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Apr 2024 05:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEF610F9FA;
	Thu, 18 Apr 2024 03:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y8FAUWyb";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25FF10F9F6
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Apr 2024 03:02:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSHzXYojTdDcVeSgBAKVnqIhcqksGc6gL9ahWd0LFIKmgIfAsIUi8uDTJhKKGD1LmZo1pZa6QRS55OjEC7JMbMBsWNU6d979W786xQ0cIvgyj6NeQBwqHilzJJ9vTy25i0qCcO3EvjQsf4HikZLX5V1MrPHmAnZlw4wC/dRPBhodQhC1oLOdv5nHTn6sXtbbswAa21UfcTnppADMYXVlc45h1TJMPxgDwN5vZKtPJ7J0aBDYSe5/NOzFp0MfdQRG4vYtH3Z80Bw2pN2P4fOAWvJibbNka2bpdtq79Dv4hH2Ilsb894sRAIb82oOtFnoBRqYU+oJnzIbHHi70NRGuZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGJKQ14/mt9tXLcq0jLxcRN0bbDkrnYy42KabhEWURM=;
 b=SDKSGLraJrSr/+UfenmWdr/jpNcamrzPcWw2zDuMbDSt3JmIVnM9IEiUfwySm63EP+RZAP4BpBXtHxBBt5D2TE+cb1t8bB+5Sqkk4iKFAym/O4Do7TM08BCS/rIU6ALjogCqr0dxLZ1vK19fWTgS+3xZro3vls3qzN5/3oXeY8D91DQeHP0Z69rXEUbe5pv0/AdHMsnfg3qFASHSGhvhfmOdJt40gyM1ZnxVNL/AXsg2Na/8hhIXpA802oUCF3IW6RFjBhJK0VTLjCAGrgR9RWY3WNODERNbybsckxkGiqY4JrzgsgpPalkkpwxofJRng7Ad1efeFEPhIXQfFZOrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGJKQ14/mt9tXLcq0jLxcRN0bbDkrnYy42KabhEWURM=;
 b=Y8FAUWyb8loArT3PiClLzLwt8J/bTtYvpWv9vxB8erW6RcktLf4BdJn/Wv1Oj45G7JFlitEvEXNhMfKjB04GfL1XDQ1GuU2qKSHkBZ1wKp2cL9UH4cg03lq/ReJIdHcXDgnDl/MVXO2letaszfUk4saVAs8WU4I8P5RIhIvOrG8=
Received: from BL1PR13CA0258.namprd13.prod.outlook.com (2603:10b6:208:2ba::23)
 by LV8PR12MB9262.namprd12.prod.outlook.com (2603:10b6:408:1e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Thu, 18 Apr
 2024 03:02:27 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::b6) by BL1PR13CA0258.outlook.office365.com
 (2603:10b6:208:2ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.11 via Frontend
 Transport; Thu, 18 Apr 2024 03:02:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 03:02:27 +0000
Received: from thomas-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 22:02:21 -0500
From: YiPeng Chai <YiPeng.Chai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <yipechai@amd.com>, <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>,
 <Candice.Li@amd.com>, <KevinYang.Wang@amd.com>, <Stanley.Yang@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>
Subject: [PATCH 15/15] drm/amdgpu: Use new interface to reserve bad page
Date: Thu, 18 Apr 2024 10:58:36 +0800
Message-ID: <20240418025836.170106-15-YiPeng.Chai@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418025836.170106-1-YiPeng.Chai@amd.com>
References: <20240418025836.170106-1-YiPeng.Chai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|LV8PR12MB9262:EE_
X-MS-Office365-Filtering-Correlation-Id: c1cc0ac6-f1e5-4145-8208-08dc5f53faf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 19W/wOX+ptMEjsdJ/IsWrpLbRD+BUJkLwjBNrO/chkL1iGnHgrrUy0MfR7zNP80HClR6X+VzbIOZHqUQd/v250kC5oEH+GjlX+Gmb6t/gADV/fTIV7jlTp0n2iS5ka5zQNpMoGMfbikpTcer3GL6JSA738apkg4RQLKM0FZUY7HGiYzPXlOCDfH6HD6MHB63VAAk1BTP4gKcBjrFqxBFtH084f144PkAZio55xqnJCLgWF4v8GsBtOXj1kDng+h1TtEOG4Lq9gK4LSq0YX+/1KCz6v2rJL3LqdFGJMytzAE8SJDJk+BqZlDOtpCafybjSOOqUK5CYaiz0WiBh26LCHAhMa+MQvelRquKl1g1oIt+gTm25vQgoKAzbMRC9sOyvR5H4Uk19fY3ekDVLqy9ehYEf0w7zpIr1WCKTpJIBMcfBYY5wzbZFgDt4oTS4s52d+wltoACu9aK9OsHkBp58DihowVEscp+KKKL0fKxs183ZwiqzR5UaKIMN9VogL6UJGnE6kII/z2npju0j129BC7mQefRiyAWXQBAk/igA54DO1u/oMu9Wg5eDNgNN9bCRJLQvOXGa5+IWFkoAIoSajwMP4JKY8hR+xov/BfjfQsoFi1i+ztCxyjnScR02RkefZszKA9BzXINqg8mVPPGFW8CqJi8mZOS3nGcezqrOM98JhxhQAhtXjWI2kA0bVKG0dA5I4ChbPzXHtV2irmYu40uyyszVbiMfFs5fVzHxxBNm0LJGW2wTAqxHh9rcttd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 03:02:27.6132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1cc0ac6-f1e5-4145-8208-08dc5f53faf0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9262
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

Use new interface to reserve bad page.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index d1a2ab944b7d..dee66db10fa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2548,9 +2548,7 @@ int amdgpu_ras_add_bad_pages(struct amdgpu_device *adev,
 			goto out;
 		}
 
-		amdgpu_vram_mgr_reserve_range(&adev->mman.vram_mgr,
-			bps[i].retired_page << AMDGPU_GPU_PAGE_SHIFT,
-			AMDGPU_GPU_PAGE_SIZE);
+		amdgpu_ras_reserve_page(adev, bps[i].retired_page);
 
 		memcpy(&data->bps[data->count], &bps[i], sizeof(*data->bps));
 		data->count++;
-- 
2.34.1

