Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF2F718911
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 20:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500F910E1E0;
	Wed, 31 May 2023 18:11:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8488910E1DA
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 18:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMlRtqq+zHGDN0hd33QMWoVurEHuEOIqEn5fE2ec1vHYd1hMZg7ogP2HyKw7wiasgAkWAxr2GgrS6gWCokteQD9HwE6Qv7o2Be9f7//SUntJVIXOW6/o7Hl7cbPQH6hcbrOhncw+4E+J2Uysu5J/K1vqqCYZHBi631nm0dMF+knN81ve7Of/paUuk9o0nwot6j1hNxtQKuVOunyseoUWg/ww1ChQgQOoNQZDgbP8rtm0nZtvf74CyZ9FQr8SnsweoWBZN56D8suAGrd8rBZrF6HLq8Iuu06K4xHK/Q35KXJYa2iEcNh9RSccKHhjPtYdYoJiwriYwOC6DlX1ojMDIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/mcy/vUCXWI7SAu2vFT/JaFW3MVPhIocY6cK8m+ngI=;
 b=k7Ya2XW/aPQZLO+f6zq0dwOZuUiUv/p/UFJ1/tzKugktu7iXAb54ZeGLXSiS9eiLPjh8QeTvszgBp6ksh4UV1Mv1W53A3pKQaaKCgL/7Qpgxr3/S0Xq/CRW8XMprNdojwPy1HmnujxQn7CvaFFRmR1BvJ1vMLwMC466RXxym93STKvF3aqGXSAh09ktlLc5ojW5Yq7PVbPdRPSMkKxvL38P+2gbbbLB0MgiI2EyUEiep+bRhXA5X15TDrGjUoSUx2KpPTkJkjFQ4BgYzAKcKKzoq7DIBCcq/mD9GHfHXIeEsKQEFHv4Gd5XE/uAsL7oBeP+1wIJJ5P0lu6EREf7fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/mcy/vUCXWI7SAu2vFT/JaFW3MVPhIocY6cK8m+ngI=;
 b=K0VB6OMHzqnpqT4/wnq9fuM4SPlEXBen7QCBNXhE6mryAlEQ5q/OO4Rm981GCeCmBz4vkF+9aPcCdjYROf1sKJQ4G98Bpbo/Qos46YIt9xk4GXfYUjWbpi2dCIuR9yrly9jCHh+rMxNHw2qZw2TXYBQ9L2fhRxIhnDsMntkimNM=
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by DM4PR12MB7767.namprd12.prod.outlook.com (2603:10b6:8:100::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 31 May
 2023 18:11:23 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::34) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23 via Frontend
 Transport; Wed, 31 May 2023 18:11:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Wed, 31 May 2023 18:11:23 +0000
Received: from TRX40-1.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 31 May
 2023 13:11:12 -0500
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Felix Kuehling
 <felix.kuehling@amd.com>
Subject: [PATCH] drm/amdgpu: Add function parameter 'event' to kdoc in
 svm_range_evict()
Date: Wed, 31 May 2023 23:40:32 +0530
Message-ID: <20230531181032.3536318-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT041:EE_|DM4PR12MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e65720-6c7d-4312-9fd7-08db62027187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/PQ/iF5b1BaLGSOz+b6TVLee4bzhKMS+ZrJS4uEyus7/MC9MXo+6T4e7RmPCot42voTBvEDtFPdntUP8hr0ikKzIeM/RsnCi1ikx0ylyue1BD7LiEVUq9j8ZzKJ1FtN7ldzzDgxCzTwlGk//QkA0yOhABPlAk89qw8zMEmdFbRKXukuENb+0CQKVHchVt/Y7fIJ/pmA50rfGiFmTVKiWGlZRo95+Hkf18193GpYHkPkgvKvg5kxTMUSJT0//cHX/XohFw4Ib/SanQ29Heyv1HAUPBIRqDWstssH4cLe4/PQDV52wqhx5W4F+IryQpqBMBVwEOs1HMQGsbErR3RewANzCekmEU8hug1wclQrS8tselVk3/5G9nen7DkLWKIC/EF6uwkP2VG3BNdHlk/LLoQB6yjRuA1XtLaqjiJGjWDTGw2LqfcTW/5sMG06SbPMfY11aJ9e37oz7nqhwByfQ8ztKttcmw99xmRRB5SGtisppuQo8F5nEj+1gXspnDNWsxCLgcfVOMYSmqQOWuXfywhJ/sYJOOvfp007PyjIa0X/KU5EvCk/dGtFzxVGfzx0bjAqociWfbwayEhw5FcldHJEDsaxDiVgpmyLN8l66opZBYXxga+YD7DYVKQqVmclXWxy2lmfITu5o+jvGDxBNK1IzE454ZcLwWzOWr+X7Jqy/bqo7u9y4VMWqZcSBjbQvWSp9RCrrLGEHbw1KKIyCiwP3vjz4lgLGmJEeZuikoNGMoOr+Kg9QqpdxzJW/xvXG/syMXZOgvr0U0yUBR8XgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(4326008)(44832011)(2906002)(70586007)(316002)(8676002)(41300700001)(70206006)(110136005)(54906003)(5660300002)(8936002)(7696005)(6636002)(16526019)(186003)(1076003)(2616005)(336012)(426003)(83380400001)(26005)(47076005)(36860700001)(66574015)(40480700001)(86362001)(40460700003)(478600001)(6666004)(36756003)(81166007)(82740400003)(356005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 18:11:23.5821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e65720-6c7d-4312-9fd7-08db62027187
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7767
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes the following gcc with W=1:

drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:1841: warning: Function parameter or member 'event' not described in 'svm_range_evict'

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 84bb5bc6e731..338d7df04773 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1825,6 +1825,7 @@ static void svm_range_restore_work(struct work_struct *work)
  * @mm: current process mm_struct
  * @start: starting process queue number
  * @last: last process queue number
+ * @event: mmu notifier event when range is evicted or migrated
  *
  * Stop all queues of the process to ensure GPU doesn't access the memory, then
  * return to let CPU evict the buffer and proceed CPU pagetable update.
-- 
2.25.1

