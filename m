Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4EF87C8C2
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Mar 2024 07:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6048110E805;
	Fri, 15 Mar 2024 06:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DniLqqW6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3235510E805
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Mar 2024 06:12:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaYSVJCpCqScuufJBM+xkRGkhph0yO3PzqOrelqw6nb6H+RGGsTWJO7tAz29I4U4sMSpwLbKB4aIo0SLqfCkNvjMGIQNoeLPGbqkTfzzpOG6UrS3qRCuOlmtFJQBs8di+WnaZKDU8a95CcTEQHjGE8C0mBHfKa50UfCmjH5Y6xGrwUZ1VFQGQjXs5xAnW8DaX0tHXA8g+0uPoZMr51X0KztWcfHpH2Rxb9silMUHn2TjxkIZedEzPigQtgBhauKHepsIV7UHq1NKVYntQlWp1sDSjx1a8q6/5rII3IlJzrQvfAj7fZdazIy3rGx2Wrq/i4M5A9W2rxiZb59gQFSmpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEYM9V8PUkORAR7sR737v51gF4D+RvObmOQZPj9lnwU=;
 b=RE5KtLmKo8tvvevEZnR1D2Ht5swlRSMgw9nWgDTcMT+HQUFtS3MB59SPbpLIh/RzIls6rEdj5dS8RlbwjoL6HhejHMtnqFMUrWjm/xvj+Vy8FbQiaZFOLjrjwBcTIq5UMbeoKuTh4DCe1+ZH3mgM2IMJ7yDrZhIb0oR3Nt1gHO6sXrYWCLTqYpmm10TYilJSiB0F9jOZyqu+k+jGwkQ8Hfl8hPMVQpNU1jnnREktKJ7/iVOdzTQ5ycY7iMmvcxZgZwbCxQub2ADDy58/vaygNQ64qm05diSqMRj1iRQxWmmpz4BrYlL6h7TIiQo40u4I4Xdcuo8cSmq2JCSbkJzFlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEYM9V8PUkORAR7sR737v51gF4D+RvObmOQZPj9lnwU=;
 b=DniLqqW6djgRenKcOoKGrmYwkeUPeUED9IrYhVwZ7MRyKcAl2D5GoZEXnrGxAnNHkIBUQzvtysko2K/fQuSiKl1wDSaCKDavXmidb12ttuqp1WZU7cFBmHF0H/QuN+uTCyI/5qxC+u4u8XGi7Xa/7kQG41q0qxU3r1ZDAj7Crps=
Received: from BN8PR04CA0056.namprd04.prod.outlook.com (2603:10b6:408:d4::30)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Fri, 15 Mar
 2024 06:12:38 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:d4:cafe::aa) by BN8PR04CA0056.outlook.office365.com
 (2603:10b6:408:d4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21 via Frontend
 Transport; Fri, 15 Mar 2024 06:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.0 via Frontend Transport; Fri, 15 Mar 2024 06:12:38 +0000
Received: from amdoffice.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 15 Mar
 2024 01:12:35 -0500
From: ZhenGuo Yin <zhenguo.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <mdaenzer@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Arunpravin.PaneerSelvam@amd.com>,
 <emily.deng@amd.com>, <monk.liu@amd.com>, ZhenGuo Yin <zhenguo.yin@amd.com>
Subject: [PATCH] drm/amd/amdgpu: add pipe1 hardware support
Date: Fri, 15 Mar 2024 14:12:26 +0800
Message-ID: <20240315061226.1691633-1-zhenguo.yin@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f319d2-ccce-4540-3168-08dc44b6ea16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CQs9NtrxucAHWx3oz/vrHf5ztQ66UM64OQGlRMSPB5YBTl1aAZ+6kqSyNZspkn94lpnOhAdrVBf0m5qt3DxhIFfk/ITCiM7hylQemfSPIB71K5/IfSdEOieYoZ8Vlk0nWCVGH1HJ4OYSDsW23ZEQJKcwwnPQunyuckzoYnXCHzDgUd/0/L0Eu7Qs15wxbCaIrav5CKzaYmtYTZ/gAX/r0F6QeFNpvexg46sbxMjYGJ0L+WtXLv3J/zJvxHh7qd962pcYmcqUzF07dx0is61vcp6P3vQ/wRA/z2buvDQLhN6/HC6hIMUmCwLUryhBtf1xMg8icicqPVh1HD57RzD97tdRVjDFB99xa2jkZUctJeaC744T6UON6C3V1LMCOhhI42Z8Ftj1k8qDfkiZgvydpsvtZ3fw5V+baZNbyPacIOA365YyymOjeYj+ENg8K81gxZPPOZPuAfqxbvfr6+y/dHJlFR8o5nP5DEi3cjcWf7iNcanzmc5gUiTlkBZilkMpv1Pnm+HrxgWVmiwoHgO7gtpm51z/+iJU3ANZT4lBQEp4gUcgzT9WG5vN7q0DyTl1H/apc55uI3iwOY1Lb6ha+4bdO0I2ezGhxn/fHFaQcI/CULbSew2GU1fnlKKNhosOcKW0E3HfMfRIzTonik/v7rLzxofHdG4G6udxv3lgUQADLp0uubogiKzO5hH4EYA0wBa4Fs3HvsTtoL4c5adLHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 06:12:38.1358 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f319d2-ccce-4540-3168-08dc44b6ea16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

Enable pipe1 support starting from SIENNA CICHLID asic.
Need to use correct ref/mask for pipe1 hdp flush.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2117
Fixes: 085292c3d780 ("Revert "drm/amd/amdgpu: add pipe1 hardware support"")
Signed-off-by: ZhenGuo Yin <zhenguo.yin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index f90905ef32c7..5eb6f189920b 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -4518,7 +4518,7 @@ static int gfx_v10_0_sw_init(void *handle)
 	case IP_VERSION(10, 3, 3):
 	case IP_VERSION(10, 3, 7):
 		adev->gfx.me.num_me = 1;
-		adev->gfx.me.num_pipe_per_me = 1;
+		adev->gfx.me.num_pipe_per_me = 2;
 		adev->gfx.me.num_queue_per_pipe = 1;
 		adev->gfx.mec.num_mec = 2;
 		adev->gfx.mec.num_pipe_per_mec = 4;
@@ -8317,7 +8317,7 @@ static void gfx_v10_0_ring_emit_hdp_flush(struct amdgpu_ring *ring)
 		}
 		reg_mem_engine = 0;
 	} else {
-		ref_and_mask = nbio_hf_reg->ref_and_mask_cp0;
+		ref_and_mask = nbio_hf_reg->ref_and_mask_cp0 << ring->pipe;
 		reg_mem_engine = 1; /* pfp */
 	}
 
-- 
2.35.1

