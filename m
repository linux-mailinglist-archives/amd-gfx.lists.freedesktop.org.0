Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F78A05C3
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Apr 2024 04:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A2010EC6C;
	Thu, 11 Apr 2024 02:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2liTBb9s";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CAA10EC6C
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Apr 2024 02:17:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zn9bQxRL5zSzopOjOTephAPlxX4L7m8PXgVJMuotkB3deyqLz8Kz6tIvbUsc8nGeZDu0lI5oZiEmErXragqlxrShbTbo44a/nF8nf3GgLbHAL73rYilz7nfhxKsxTlw3Y3P5GXfSO8CH93I8VqKpavtgjt9t3BcJzzTtixXbk1po6R89+T6N1jwN+c/0s3NG/PJLvxiwHlrby6qEuwsXHCVbHxvRwed1wjY6bN9IuY2Fekq1+tdD+6eCHzq146TL66Ry+7xBo/+IcSr4+hllaC0/yoieTWkIx2caaKGjECUvdlEqaiO/q2IhWItn7DO6BnZPRyE66SwHIskwfwPOjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcI1416TID/k322S2o/qQdPZbagAh3ukkIGSDsbjPxs=;
 b=Giea98aPYXdkzrnumjhPq3w1BLjVptmlihrezjHBXPfel16MLFjhp3ddHnMSaXv7jNmfqrjqK0IDhQFWBq6htR3t7H6FC7vzW+ZmCaohJivs6HvzIHuPDD5FzYedx+smUJ+eUOBabz1NzGl8GX+IBee5EYqGKtyIBzU7Qo1Kzryn0M8IOoE/q2QY2EatTDm+9CdB6+oy578e+MQefNXKBSOaHuBbyDUomlQqohRDofXw9nNRXNhNfMax+Ksud7CLoj8BdVFq9s83HxuVNNlGAoyKQgtcSrVCmyXp3hRYgU6CKtqlibCXBi7oPOO4oNW3eEaVsnJFROFtfbdeWcT/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcI1416TID/k322S2o/qQdPZbagAh3ukkIGSDsbjPxs=;
 b=2liTBb9sgrp6hZdjC9O1YHw3Po2EcgV1wYqk7WUKgZW6n5HD7Smv+E0jJRWnl1WE8uA24KfYybqewCCIlGFTcN/uUc1dkj2X5AA74N9Sv8wDYfKqCImX49H9E/ymcpVI7SkCheJiAiK0tJk1zFMTvVKvly/AVPUzDaM2MSzt680=
Received: from CYZPR02CA0016.namprd02.prod.outlook.com (2603:10b6:930:a1::28)
 by SJ2PR12MB8847.namprd12.prod.outlook.com (2603:10b6:a03:546::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 02:16:59 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:a1:cafe::13) by CYZPR02CA0016.outlook.office365.com
 (2603:10b6:930:a1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 02:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 11 Apr 2024 02:16:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 10 Apr
 2024 21:16:58 -0500
Received: from Xiaogang-ROCM-Dev.attlocal.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 10 Apr 2024 21:16:53 -0500
From: Xiaogang.Chen <xiaogang.chen@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <felix.kuehling@amd.com>, Xiaogang Chen <xiaogang.chen@amd.com>, "Xiaogang
 Chen" <Xiaogang.Chen@amd.com>
Subject: [PATCH] amd/kfd: cancle work iterms at ih_wq in kfd_interrupt_exit
Date: Wed, 10 Apr 2024 21:18:22 -0500
Message-ID: <20240411021822.2347485-1-xiaogang.chen@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xiaogang.chen@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|SJ2PR12MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a007c55-6e30-4073-1b43-08dc59cd77b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wBWMNBPI3+NDPjL8eWpG+SOVTuAhRxHhu3l16rYY3Rj0LTJNWEs7bGEyglKgPtzmSSB3zeGQCkPK1rk8MsL8V7+BZqHLzrk09fzb7DIVptErwEBZR7Q/9DB/e5MjiVgJ5erzWOf7u2+8/kSR5HPZzHDd04Wozwpb0cpEMFzYMXDKO+o7HsYCHfoN5EZuXcxevGUu8XGgYdUpVIKKN+uuuc6S+lPrPcKFkFnYeKln9gk+03Ht2H5JnnyAWA7HlG/kBSXstXnQB/lrmQZ8vkypfKAzEgjyxJ3SEjiOIxGYKx/MTPaz75SacMcKmIaYt7tnv6WTZRgZAudK+0FMx+6ppUsN5L370WlJdxCiVjAOGY3AD9s50FWXbpLRu3CGDd/PQdBvrX2XTpKXk3CXBFdBK+qDavyBN4WyVRbjU9gb0/Cjj2154AjkLwpNDUsJ4C3g2qcP4shSk6d4UJ65vmpn9eiU/taqCN4ORrRlXnE77etD/g6EWUPbagZXsK2hjGRIEpPEkPLrC1iagr/qIMi3DHgcwhJ5W8NEsAdoEiUqbcqIC+zePjpXffqh2jVyuPZS5jBjYVnjrRY7YjePR8j/pT0nBGB3kohPrhB0loQMpkM0DxwyXDBmOT9ubLiQ7Iwl2K4ipYl45PkFUo/nVHcewtlb86fc8XjDAGeK24THkadM8P/gtsM2edQFf/WdjiIAZnNTA1+Rrt+wC3hPFbkNm9hXM6I6fL1Ooc1q+OgkkK3aoCJkPioEWRWGvpHLRGha
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 02:16:59.0421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a007c55-6e30-4073-1b43-08dc59cd77b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8847
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

From: Xiaogang Chen <xiaogang.chen@amd.com>

When kfd/amdgpu driver is tearing down cannot handle callback from
ih_wq. If there is still work items left cancle them instead of flush
that would wait until they got served.

Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
index 9b6b6e882593..1847b9290a84 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_interrupt.c
@@ -98,11 +98,12 @@ void kfd_interrupt_exit(struct kfd_node *node)
 	spin_unlock_irqrestore(&node->interrupt_lock, flags);
 
 	/*
-	 * flush_work ensures that there are no outstanding
-	 * work-queue items that will access interrupt_ring. New work items
+	 * cancel work items still at ih_wq ensures that there are no outstanding
+	 * work-queue items that will access interrupt_ring. At this stage kfd/amd
+	 * driver is tearing down, cannot handle call back from wq. New work itemst
 	 * can't be created because we stopped interrupt handling above.
 	 */
-	flush_workqueue(node->ih_wq);
+	cancel_work(&node->interrupt_work);
 
 	destroy_workqueue(node->ih_wq);
 
-- 
2.25.1

