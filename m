Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D6E8A829B
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Apr 2024 13:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C5D10F152;
	Wed, 17 Apr 2024 11:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z/DGXtpu";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180A10E9BD
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Apr 2024 11:58:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksLjxda0ycMhvcaa1C4oGt5u2AwobnvAziP4zPHSh3w02bUqgCIyPADzMq/cnyPFfMWCS0B990g8Fit8uByPsbkEIwioe9JTZ5N9l4VzQCzLUJ1xGHU+PtQFSjjzhHPlFWAGOw+LUBjwtVJxHyx9oAqDeSRBKtNraooJ/wmMQiNCj644lOSB+NVmstm7FeYeUlFbIsaJ06cRpCHxmU+w6uH8m2PumRt+7imy252vdMSjjAhc5VpY4RsBBeKGKUHLKtd4MY+qHZA8zEUr0UDe7rQJpO2kk3yKd7AEq5ALftzJ4yTqEyIR9yX4U20cxAOjH3RzJldJ6yNiDT1T0NzYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT5vvEC3ha0sgCOkNpYDVpldbhMhs5Fm4NRg0YNDOT8=;
 b=QSNUhF7aKJg+sY8ZdC4aHfheQXYKUatKqH6Tgznn/YU9JyjLXwat0TV/ZjX5Vwg+f+mCtnZfBccJhmPTRRfOVESx9eNWa7y2EuYKP0OIq1yXrGQooJfRalvr+t/tFRhwFdA+qLXhSexfT4ApUJkjeA6I91tzPTM+1xBhkPFEx/2TrmAO8WE+z9vYs87HtIEjOZfi0TLcg1wKlVlU5eQxsqLKDqhSYTz+KosLkkHct6HNgBNorf9/CFPOk9ja5IjjI1AvgaRCCvqoFahNW1Xt233ixVFPU6uJCyEK4lB/mqHB9fWH9Fp6UBcKtM0avbISF5ggQu5mR+hhq2NF9V3rSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT5vvEC3ha0sgCOkNpYDVpldbhMhs5Fm4NRg0YNDOT8=;
 b=z/DGXtpu1wW2rGUu9/tVIuty4eVFAAkSOASX9CzkGteUOdegKxZ46mwUdNSXDQFn9jA8EGlNXGLSYuwVd6fFqwzppweVhpNH9XpHL5vO6ndYysJAw3WaX4erAKlleg9n7nju413EwRe+scK7UnfoEHWQu3bSX5g54IaV5zogAZE=
Received: from BYAPR06CA0006.namprd06.prod.outlook.com (2603:10b6:a03:d4::19)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Wed, 17 Apr
 2024 11:58:04 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::6a) by BYAPR06CA0006.outlook.office365.com
 (2603:10b6:a03:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 11:58:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 11:58:03 +0000
Received: from mlse-blrlinux-ll.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 06:57:59 -0500
From: Lijo Lazar <lijo.lazar@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Hawking.Zhang@amd.com>, <Alexander.Deucher@amd.com>, <Le.Ma@amd.com>
Subject: [PATCH] drm/amdgpu: Assign correct bits for SDMA HDP flush
Date: Wed, 17 Apr 2024 17:27:43 +0530
Message-ID: <20240417115743.167530-1-lijo.lazar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: a31bcabd-4503-4437-c5e1-08dc5ed5a30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4j2AqpExYezb04vJ5YbVr1CFpGvt8m1DkxVQ8vndv0smkvAGrJ5fVTPCKsRWTbxlL3Vgjg8rCy73d7P6VGuHnS30jKFDElq4g0ozXBeIXNlnbyhmHxtdHDOhWKjgyoQCyNuDyYiKb/IRiofHwNSLD7uzN+MLxAhtztCcqreFJSE/n1sXGbhbz1N35TqxR1CVMOm47KA/Z95ZiNbS3bLXFO9xvvP2unS1t1c47E762qtK90p75L3Ik3cBxWhgRUvl6TStCOWmGBQYLGJapUTVgH3x3hnnadTFUCBF7i83rS2HHoy8doxF1eMsQUveWrCS9+9VD8MEVNyP7FMaqCl+mgpSUY906wlfELOfm4PeQU7GCw9ErIFN5QcMZALS+4h75pdfloUWPxDuM78j8SkZUMU+sC2M8N4kkwKJw8A4KXmORlw6tzd5LqNV5j2Hk2DApmVY0kECh7Q4az6xGBCMLDxzlJ5g6Wop80xQrqPa++BKQS1C6DS5g5RXSzI32WBTT2fizEafpJr/qbulgGYIP5FjIvJB1Ki3dNGrxVgVBONbddizCR1pv04Lpf3ZawNEGJFdNX3vHf/umqT2xr5z0qjvoamjYqhx9nbrUwewY5Rw6SAdnP2zUO+NVvLDZjEfHLU4vz/GvKUGnIOIs3P8Ij1A5rtsOG4Gc6IcFXbeULTnnJ+QvJTgN1PKNv1oIqObidOeZhTHrQAtgZJOLpkzikpR3zWHlFeu4yqpVHzRtJiB076l65x6V/YfCTmlDESs
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 11:58:03.4642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a31bcabd-4503-4437-c5e1-08dc5ed5a30a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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

HDP Flush request bit can be kept unique per AID, and doesn't need to be
unique SOC-wide. Assign only bits 10-13 for SDMA v4.4.2.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
index f8e2cd514493..09e45ef16c0d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
@@ -368,7 +368,8 @@ static void sdma_v4_4_2_ring_emit_hdp_flush(struct amdgpu_ring *ring)
 	u32 ref_and_mask = 0;
 	const struct nbio_hdp_flush_reg *nbio_hf_reg = adev->nbio.hdp_flush_reg;
 
-	ref_and_mask = nbio_hf_reg->ref_and_mask_sdma0 << ring->me;
+	ref_and_mask = nbio_hf_reg->ref_and_mask_sdma0
+		       << (ring->me % adev->sdma.num_inst_per_aid);
 
 	sdma_v4_4_2_wait_reg_mem(ring, 0, 1,
 			       adev->nbio.funcs->get_hdp_flush_done_offset(adev),
-- 
2.25.1

