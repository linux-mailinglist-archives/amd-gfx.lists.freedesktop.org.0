Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C6A3A1FA
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Feb 2025 17:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFB910E3CB;
	Tue, 18 Feb 2025 16:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="baI1tEm4";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2045.outbound.protection.outlook.com [40.107.102.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66EF10E3EA
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Feb 2025 16:01:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHqnQ8/r9p1NA0U7meSWsMWAIQKd3OoLzv9CfzGVM4/HeGXHuOfKBFqXFOAjW5fTkwIMxvKSkVm63p4SzP3cQKHdgYXNCxay1dhd6pAVe9UtURcYCxph96HlmUS0LiAn9hlziW/0oHBFcmG0a8wZuxDD1hAJsJilhvlKEXEIfb82U30VpiH5EIJIzhqCUvSXnYbv/Ae7P8HxZhUE9DA+raqbyt7i76Uk09STkrFh1BvKTmS9MlLVuw8vkDa5cqZXGzLZCAKikB7OoZntrucOPO4pDsHllsvX/88uNUd67jUe/5mnmgPNtbPqzYqezzOezngSRMeedNj4DN6gYOxhew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3w+yMORw6tOPqVykX8DarHnMqQ59mcRvNOoV1pdrqQ=;
 b=Q5vyNVjRYWf6XzktW54J9n4gOU4dbBRwxGP8yfYmbB79swnGTFLAVLxm5IkU9QpekWUptVKjmSc0f2EEs2dJ3TlV76kRS+AFzdCMnhPjle6RR9y2ME7bav8vibv0O111vdpmcxxvhgavPa53lrpMoDsb3AsZ0o9xaw/zYDQiFzGyGTtdwWRiJPZYiTYOZuBQwzGUrcBOCLTXGLsIX/KP8Vr+h5Bf9oucnGpwaD+g/Hjy+ZkSxuKhj38lQpv+iYArRW2dfckYXwOYBDm/7LjzCwi+lZbcG39Qnfjpp0fepwtva57B7i5miS9KuIhT7VI5xPKCykHZHcQA6NmjlJVmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3w+yMORw6tOPqVykX8DarHnMqQ59mcRvNOoV1pdrqQ=;
 b=baI1tEm4BYjh8ocRU987PYCnqfnRgFxNqyHI8DZtjnITK3bAFOUrY24clkMVgAd6MafAZsaykTckG/ztZpzWfLGvg61cy3fSDgN0Z9G0qugOhG3MN7+jdDwKisuwVMxP2Pzx6wlP0aChB410kp4RA0qYqUNWP5inWwBSq/5EoNc=
Received: from SN6PR01CA0028.prod.exchangelabs.com (2603:10b6:805:b6::41) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 16:01:54 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:805:b6:cafe::ba) by SN6PR01CA0028.outlook.office365.com
 (2603:10b6:805:b6::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Tue,
 18 Feb 2025 16:01:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 16:01:53 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Feb 2025 10:01:51 -0600
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>, Alex Sierra <alex.sierra@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>
Subject: [PATCH] drm/amdkfd: Fix Circular Locking Dependency in
 'svm_range_cpu_invalidate_pagetables'
Date: Tue, 18 Feb 2025 21:31:30 +0530
Message-ID: <20250218160130.810595-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 17403b54-33f1-429e-59c3-08dd50359047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWU3SUNGL0tuUlljYSt3NDEyQ09ibWdQbDRqUlZyVytjUWxaQUtoMnkwN1Bt?=
 =?utf-8?B?V1hVdjhUVXU5T2ViYVZ4dDl5TFRmc3lLbHh3U0tKN01SQTBPTjBXcUZGRXVq?=
 =?utf-8?B?QzdRbWxuRTM1UVk1amRkWTRHOXpzNkV6ejR1M0JicnRpcVFacytMQkVxM1hn?=
 =?utf-8?B?QzRSUGs0S3hxUnhnUVFzN3VzSnovYWwxUm5JOEZXU2ZoU0l2Wk1Da2xOUjcr?=
 =?utf-8?B?Rm1leStVNUZuZnhyQ0V0UzZJVnFMSG0wcWVPRE1SZGgyaDgvTWxJWWRsR2Q4?=
 =?utf-8?B?UFpGbFZ6OWpwcDB1UmJzbmNiR1N6c0ljOUNjWVErT0VmeDBFY2N5eXFTbTBm?=
 =?utf-8?B?b0RZb1RFMzU5OWdNN0ZabFF3elVQT2RFQ0cyc2NZbk5uV29yM0t2RUZmNCsw?=
 =?utf-8?B?WmM3M1lmVU9JTjhabzNzbTVGcG9YNjVkS1VLVSt1MFFkNVJVMlRqckk5RkZk?=
 =?utf-8?B?RzczeklnZ2ZPd2tMdnJnNmo2ZVhKV2lrb3d0WHBBeHdqOEFsVU9jeFpGZW5X?=
 =?utf-8?B?MG9lWXRIU2NBaHo4c3NTZzMrS0RTeFRZcTJPR2Z4VFNFZVJvc3FWdnVVcnNK?=
 =?utf-8?B?dDl3OHZscDAwb3hlaDBSbFltT2FjTXl3RW1iUStOdkdIMnU4cVNjdkpidEEw?=
 =?utf-8?B?OExDdE45bWE1VXVOcTFNb3F1TktIWkc1R2JoWDNhUCtkNzFuc1ZXNUlYcE9H?=
 =?utf-8?B?OGd6ekpYaGdIM2RmL0wxZUw0Q3QwUmJQSVd3aExDazR5NkF6Vnp6Vnhxc3g0?=
 =?utf-8?B?RDJybkRmR2o5SmRnbVg1RzZvQUtlU0FZaWZSTkFPbnBJbkFCTTIxZnpUdjA0?=
 =?utf-8?B?SzdUMk1rV2gwVzI4aXZKcTZaOGdsZE9HNGN2ZGpGUmRCT2JUM0lyY09OZjhQ?=
 =?utf-8?B?N1hWRHFGb1cyalVpbnpGUzM0QXZGR1JnU203YmNZZTBWdnlYZHFMcjVhQ3Vj?=
 =?utf-8?B?VGdWeXM2WURiL3lPa2VHTktTK2g4K2J6MHFFdWx1d3pWNFQ2Vk5CWVdUa0F2?=
 =?utf-8?B?LzJuMFBSZnJ0ejRYVzE5VURITS9ZakJmemZPMVFDTFJTMWNCOUdwSnZjYk8r?=
 =?utf-8?B?YVprUkFwWWp0MDIybnBpWGJiUTR0bzFZdnZQQmdIcm5reEJUaXhCVG4xSDBZ?=
 =?utf-8?B?TjAwZkRxL2taeUJRb0dNaUdCMmtLOU9neUZoaDBqZlBVM29vcTEvZGJQb043?=
 =?utf-8?B?VjkwOUg5cTdmSXRFUFFDV3lrTEgyL1lDeUdodmdOMnA3SWxEOG12SGlzeXNy?=
 =?utf-8?B?SXRDLzY0Q2Rxd2RjK0JTUnFsV0JNY2R5c01wc1gzZXdzWHF1NEdkTnpndUFJ?=
 =?utf-8?B?TklHTjY3dWJLb1ZINXJzNFFQTjlZNVNQWGlYRi9VK0tFbEtSZHR2cU9CRFJR?=
 =?utf-8?B?MXRBRVlBMHlZWlM0TzYvRzZNbnpHV2JDeTdwTS84Z2NyRDVZNGpQd282OUhB?=
 =?utf-8?B?OVoyUmJtOW14SWY3M0NUL3dEbHJSd1NDb0RCeituNUJGdDVva25HRHJOWFh5?=
 =?utf-8?B?TVZpOGZsNzc0UjBtU0ZGbUF4NFpicWV2NVNIVXZkSEhPaXJ3UndicXh3aEZk?=
 =?utf-8?B?UG5HcFhQdHBGL1NKenpMZXg4N2pqL1E3MWYvUTJJMlhqL3lkc2ZQWHBoeEYz?=
 =?utf-8?B?b0l1L01qdWJsU3ZXRitOeFJERGJsN3l4MEg2c1ZPM1ZKUUNpZFRqK1gySk5v?=
 =?utf-8?B?aXo1Y2t6ZXZuU0dZc25mMXFFc2ZneENmbnM2N2U3TVVoc1U4emRsaHNCZEVK?=
 =?utf-8?B?cEhXTGNyVTRXZEkybCtqZHdabXYvcDl3a09mbXhnY2hzenMrQnpiRThzaE5x?=
 =?utf-8?B?UHZReGt1NDZaTlBLbmIxNFRXTVRHK1RuaDlpWmlHakFLWmFETmpYbzVHVXZk?=
 =?utf-8?B?S0xLdTE2RjNGb0F3SE1FZ29iRy9EaTVya211VWNRSXlId09lcExWR0VQTmxI?=
 =?utf-8?B?RXF1YUFLcXhMYWppU2VPQjg5cGVuRWdvMHExRjJVTXl5bkVFSW9PbC9LNTJM?=
 =?utf-8?Q?fNH7MtS1P5H7N1m7NhA9oxAqQaVFMo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 16:01:53.9781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17403b54-33f1-429e-59c3-08dd50359047
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

This commit addresses a circular locking dependency in the
svm_range_cpu_invalidate_pagetables function. The function previously
held a lock while determining whether to perform an unmap or eviction
operation, which could lead to deadlocks.

To resolve this issue, a flag named `needs_unmap_or_evict` has been
introduced to indicate if an unmap or eviction operation is required.
The function now unlocks the `prange` lock before performing the
necessary operations, ensuring that the critical section is minimized
and preventing circular dependencies.

Fixes the below:

[  223.418794] ======================================================
[  223.418820] WARNING: possible circular locking dependency detected
[  223.418845] 6.12.0-amdstaging-drm-next-lol-050225 #14 Tainted: G     U     OE
[  223.418869] ------------------------------------------------------
[  223.418889] kfdtest/3939 is trying to acquire lock:
[  223.418906] ffff8957552eae38 (&dqm->lock_hidden){+.+.}-{3:3}, at: evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.419302]
               but task is already holding lock:
[  223.419303] ffff8957556b83b0 (&prange->lock){+.+.}-{3:3}, at: svm_range_cpu_invalidate_pagetables+0x9d/0x850 [amdgpu]
[  223.419447] Console: switching to colour dummy device 80x25
[  223.419477] [IGT] amd_basic: executing
[  223.419599]
               which lock already depends on the new lock.

[  223.419611]
               the existing dependency chain (in reverse order) is:
[  223.419621]
               -> #2 (&prange->lock){+.+.}-{3:3}:
[  223.419636]        __mutex_lock+0x85/0xe20
[  223.419647]        mutex_lock_nested+0x1b/0x30
[  223.419656]        svm_range_validate_and_map+0x2f1/0x15b0 [amdgpu]
[  223.419954]        svm_range_set_attr+0xe8c/0x1710 [amdgpu]
[  223.420236]        svm_ioctl+0x46/0x50 [amdgpu]
[  223.420503]        kfd_ioctl_svm+0x50/0x90 [amdgpu]
[  223.420763]        kfd_ioctl+0x409/0x6d0 [amdgpu]
[  223.421024]        __x64_sys_ioctl+0x95/0xd0
[  223.421036]        x64_sys_call+0x1205/0x20d0
[  223.421047]        do_syscall_64+0x87/0x140
[  223.421056]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  223.421068]
               -> #1 (reservation_ww_class_mutex){+.+.}-{3:3}:
[  223.421084]        __ww_mutex_lock.constprop.0+0xab/0x1560
[  223.421095]        ww_mutex_lock+0x2b/0x90
[  223.421103]        amdgpu_amdkfd_alloc_gtt_mem+0xcc/0x2b0 [amdgpu]
[  223.421361]        add_queue_mes+0x3bc/0x440 [amdgpu]
[  223.421623]        unhalt_cpsch+0x1ae/0x240 [amdgpu]
[  223.421888]        kgd2kfd_start_sched+0x5e/0xd0 [amdgpu]
[  223.422148]        amdgpu_amdkfd_start_sched+0x3d/0x50 [amdgpu]
[  223.422414]        amdgpu_gfx_enforce_isolation_handler+0x132/0x270 [amdgpu]
[  223.422662]        process_one_work+0x21e/0x680
[  223.422673]        worker_thread+0x190/0x330
[  223.422682]        kthread+0xe7/0x120
[  223.422690]        ret_from_fork+0x3c/0x60
[  223.422699]        ret_from_fork_asm+0x1a/0x30
[  223.422708]
               -> #0 (&dqm->lock_hidden){+.+.}-{3:3}:
[  223.422723]        __lock_acquire+0x16f4/0x2810
[  223.422734]        lock_acquire+0xd1/0x300
[  223.422742]        __mutex_lock+0x85/0xe20
[  223.422751]        mutex_lock_nested+0x1b/0x30
[  223.422760]        evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.423025]        kfd_process_evict_queues+0x8a/0x1d0 [amdgpu]
[  223.423285]        kgd2kfd_quiesce_mm+0x43/0x90 [amdgpu]
[  223.423540]        svm_range_cpu_invalidate_pagetables+0x4a7/0x850 [amdgpu]
[  223.423807]        __mmu_notifier_invalidate_range_start+0x1f5/0x250
[  223.423819]        copy_page_range+0x1e94/0x1ea0
[  223.423829]        copy_process+0x172f/0x2ad0
[  223.423839]        kernel_clone+0x9c/0x3f0
[  223.423847]        __do_sys_clone+0x66/0x90
[  223.423856]        __x64_sys_clone+0x25/0x30
[  223.423864]        x64_sys_call+0x1d7c/0x20d0
[  223.423872]        do_syscall_64+0x87/0x140
[  223.423880]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  223.423891]
               other info that might help us debug this:

[  223.423903] Chain exists of:
                 &dqm->lock_hidden --> reservation_ww_class_mutex --> &prange->lock

[  223.423926]  Possible unsafe locking scenario:

[  223.423935]        CPU0                    CPU1
[  223.423942]        ----                    ----
[  223.423949]   lock(&prange->lock);
[  223.423958]                                lock(reservation_ww_class_mutex);
[  223.423970]                                lock(&prange->lock);
[  223.423981]   lock(&dqm->lock_hidden);
[  223.423990]
                *** DEADLOCK ***

[  223.423999] 5 locks held by kfdtest/3939:
[  223.424006]  #0: ffffffffb82b4fc0 (dup_mmap_sem){.+.+}-{0:0}, at: copy_process+0x1387/0x2ad0
[  223.424026]  #1: ffff89575eda81b0 (&mm->mmap_lock){++++}-{3:3}, at: copy_process+0x13a8/0x2ad0
[  223.424046]  #2: ffff89575edaf3b0 (&mm->mmap_lock/1){+.+.}-{3:3}, at: copy_process+0x13e4/0x2ad0
[  223.424066]  #3: ffffffffb82e76e0 (mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: copy_page_range+0x1cea/0x1ea0
[  223.424088]  #4: ffff8957556b83b0 (&prange->lock){+.+.}-{3:3}, at: svm_range_cpu_invalidate_pagetables+0x9d/0x850 [amdgpu]
[  223.424365]
               stack backtrace:
[  223.424374] CPU: 0 UID: 0 PID: 3939 Comm: kfdtest Tainted: G     U     OE      6.12.0-amdstaging-drm-next-lol-050225 #14
[  223.424392] Tainted: [U]=USER, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
[  223.424401] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS PRO WIFI/X570 AORUS PRO WIFI, BIOS F36a 02/16/2022
[  223.424416] Call Trace:
[  223.424423]  <TASK>
[  223.424430]  dump_stack_lvl+0x9b/0xf0
[  223.424441]  dump_stack+0x10/0x20
[  223.424449]  print_circular_bug+0x275/0x350
[  223.424460]  check_noncircular+0x157/0x170
[  223.424469]  ? __bfs+0xfd/0x2c0
[  223.424481]  __lock_acquire+0x16f4/0x2810
[  223.424490]  ? srso_return_thunk+0x5/0x5f
[  223.424505]  lock_acquire+0xd1/0x300
[  223.424514]  ? evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.424783]  __mutex_lock+0x85/0xe20
[  223.424792]  ? evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.425058]  ? srso_return_thunk+0x5/0x5f
[  223.425067]  ? mark_held_locks+0x54/0x90
[  223.425076]  ? evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.425339]  ? srso_return_thunk+0x5/0x5f
[  223.425350]  mutex_lock_nested+0x1b/0x30
[  223.425358]  ? mutex_lock_nested+0x1b/0x30
[  223.425367]  evict_process_queues_cpsch+0x43/0x210 [amdgpu]
[  223.425631]  kfd_process_evict_queues+0x8a/0x1d0 [amdgpu]
[  223.425893]  kgd2kfd_quiesce_mm+0x43/0x90 [amdgpu]
[  223.426156]  svm_range_cpu_invalidate_pagetables+0x4a7/0x850 [amdgpu]
[  223.426423]  ? srso_return_thunk+0x5/0x5f
[  223.426436]  __mmu_notifier_invalidate_range_start+0x1f5/0x250
[  223.426450]  copy_page_range+0x1e94/0x1ea0
[  223.426461]  ? srso_return_thunk+0x5/0x5f
[  223.426474]  ? srso_return_thunk+0x5/0x5f
[  223.426484]  ? lock_acquire+0xd1/0x300
[  223.426494]  ? copy_process+0x1718/0x2ad0
[  223.426502]  ? srso_return_thunk+0x5/0x5f
[  223.426510]  ? sched_clock_noinstr+0x9/0x10
[  223.426519]  ? local_clock_noinstr+0xe/0xc0
[  223.426528]  ? copy_process+0x1718/0x2ad0
[  223.426537]  ? srso_return_thunk+0x5/0x5f
[  223.426550]  copy_process+0x172f/0x2ad0
[  223.426569]  kernel_clone+0x9c/0x3f0
[  223.426577]  ? __schedule+0x4c9/0x1b00
[  223.426586]  ? srso_return_thunk+0x5/0x5f
[  223.426594]  ? sched_clock_noinstr+0x9/0x10
[  223.426602]  ? srso_return_thunk+0x5/0x5f
[  223.426610]  ? local_clock_noinstr+0xe/0xc0
[  223.426619]  ? schedule+0x107/0x1a0
[  223.426629]  __do_sys_clone+0x66/0x90
[  223.426643]  __x64_sys_clone+0x25/0x30
[  223.426652]  x64_sys_call+0x1d7c/0x20d0
[  223.426661]  do_syscall_64+0x87/0x140
[  223.426671]  ? srso_return_thunk+0x5/0x5f
[  223.426679]  ? common_nsleep+0x44/0x50
[  223.426690]  ? srso_return_thunk+0x5/0x5f
[  223.426698]  ? trace_hardirqs_off+0x52/0xd0
[  223.426709]  ? srso_return_thunk+0x5/0x5f
[  223.426717]  ? syscall_exit_to_user_mode+0xcc/0x200
[  223.426727]  ? srso_return_thunk+0x5/0x5f
[  223.426736]  ? do_syscall_64+0x93/0x140
[  223.426748]  ? srso_return_thunk+0x5/0x5f
[  223.426756]  ? up_write+0x1c/0x1e0
[  223.426765]  ? srso_return_thunk+0x5/0x5f
[  223.426775]  ? srso_return_thunk+0x5/0x5f
[  223.426783]  ? trace_hardirqs_off+0x52/0xd0
[  223.426792]  ? srso_return_thunk+0x5/0x5f
[  223.426800]  ? syscall_exit_to_user_mode+0xcc/0x200
[  223.426810]  ? srso_return_thunk+0x5/0x5f
[  223.426818]  ? do_syscall_64+0x93/0x140
[  223.426826]  ? syscall_exit_to_user_mode+0xcc/0x200
[  223.426836]  ? srso_return_thunk+0x5/0x5f
[  223.426844]  ? do_syscall_64+0x93/0x140
[  223.426853]  ? srso_return_thunk+0x5/0x5f
[  223.426861]  ? irqentry_exit+0x6b/0x90
[  223.426869]  ? srso_return_thunk+0x5/0x5f
[  223.426877]  ? exc_page_fault+0xa7/0x2c0
[  223.426888]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  223.426898] RIP: 0033:0x7f46758eab57
[  223.426906] Code: ba 04 00 f3 0f 1e fa 64 48 8b 04 25 10 00 00 00 45 31 c0 31 d2 31 f6 bf 11 00 20 01 4c 8d 90 d0 02 00 00 b8 38 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 41 89 c0 85 c0 75 2c 64 48 8b 04 25 10 00
[  223.426930] RSP: 002b:00007fff5c3e5188 EFLAGS: 00000246 ORIG_RAX: 0000000000000038
[  223.426943] RAX: ffffffffffffffda RBX: 00007f4675f8c040 RCX: 00007f46758eab57
[  223.426954] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000001200011
[  223.426965] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[  223.426975] R10: 00007f4675e81a50 R11: 0000000000000246 R12: 0000000000000001
[  223.426986] R13: 00007fff5c3e5470 R14: 00007fff5c3e53e0 R15: 00007fff5c3e5410
[  223.427004]  </TASK>

Fixes: 4683cfecadeb ("drm/amdkfd: deregister svm range")
Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index db3034b00dac..a076269cce7f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -2574,6 +2574,7 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 	struct svm_range *prange;
 	unsigned long start;
 	unsigned long last;
+	bool needs_unmap_or_evict = false;
 
 	if (range->event == MMU_NOTIFY_RELEASE)
 		return true;
@@ -2597,14 +2598,21 @@ svm_range_cpu_invalidate_pagetables(struct mmu_interval_notifier *mni,
 
 	switch (range->event) {
 	case MMU_NOTIFY_UNMAP:
-		svm_range_unmap_from_cpu(mni->mm, prange, start, last);
+		needs_unmap_or_evict = true;
 		break;
 	default:
-		svm_range_evict(prange, mni->mm, start, last, range->event);
+		needs_unmap_or_evict = true;
 		break;
 	}
-
 	svm_range_unlock(prange);
+
+	if (needs_unmap_or_evict) {
+		if (range->event == MMU_NOTIFY_UNMAP)
+			svm_range_unmap_from_cpu(mni->mm, prange, start, last);
+		else
+			svm_range_evict(prange, mni->mm, start, last, range->event);
+	}
+
 	mmput(mni->mm);
 
 	return true;
-- 
2.34.1

