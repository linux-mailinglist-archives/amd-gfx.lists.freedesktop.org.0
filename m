Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B828AF5F88
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Jul 2025 19:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2210E75F;
	Wed,  2 Jul 2025 17:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sK2PX/X/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2075.outbound.protection.outlook.com [40.107.212.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E1210E755
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Jul 2025 17:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx/jxo3ywCk0joXDwRPWDDfU2eSPf+vRTYtGCjH3/1U44LviQn9U7YwiwZJgseZxjYsAVKDcQLqp10y44Tr2qxe16OLMEp4wYW7Flu2r5qjtfzZCkEA1CVQk1Km4MYDRKOSvlQlrHaGipzlxxcf/RbY7HToWrAMilCJtQlCoGUozwU4jB7h2hIILeHy4gFeXDkru+wfSm4wJl06JQuvijjYT7ypJ8Vrnz8L+LIwXFC1BlDjnuIRDUStC6i+S7aSpD6Ujiw5MsQYnkufjDE+p6eT0pLu/5GRd4TvCsDy73tPHD4wxhaSUlLglhcNE6+qPxAoRGfYvlGbTBSamsBvOBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/RzC3jZf3GljBLVw0p7yOXwf5gs5i32XFYKTuqW3RI=;
 b=HOD+SA+e53UENwQWdhiell7Rumr+8FZaBGhgfm1LtfrRPSYU3vzhvZM0sgDlD1PGP+TI37QiKKtXwZf09hCRcmTlwmc52GrjIe5ecMI8UeB+7Y9YFt3W7Vzcta/L5s4q+XHBSU9CBXmsaJtifnHV6QEjo6jDOnZQWSddGxuzm0C0cdW8Jd6AD1b93RIcXdOKxjv8rm6JoZ8wXcOARd5l3ZLBS+II8zcNJUX4gi82DtC++21gkIGEkZmo12klHumrv1+4V6sXBYWlmPKT4gvlArHJEeFdYtJ4Jp8nxbpEEzCiQP2xJvNXNtmtShg1s3IGW8g8XMp2KRV5pa0pKQZiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/RzC3jZf3GljBLVw0p7yOXwf5gs5i32XFYKTuqW3RI=;
 b=sK2PX/X/k1+rjvEafOvZ6MOzrqApahEEBplv8j4zemokXRSGHH+p8s+NqQ0yEs+EetDlxygAiMgGIkeYjDeaWmiZzLzHMC8qhwYBmBCAb5aa0Y85Q5hwQNLDm/JAVr2BaHqaDNwnn96YlVdGH+eWUPNB4GoLyCy+dmY8f8E90bk=
Received: from BN0PR08CA0005.namprd08.prod.outlook.com (2603:10b6:408:142::20)
 by SJ2PR12MB9212.namprd12.prod.outlook.com (2603:10b6:a03:563::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 17:10:25 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:142:cafe::25) by BN0PR08CA0005.outlook.office365.com
 (2603:10b6:408:142::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Wed,
 2 Jul 2025 17:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 2 Jul 2025 17:10:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 12:10:24 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 12:10:23 -0500
From: <vitaly.prosyak@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: fix use-after-free in
 amdgpu_userq_suspend+0x51a/0x5a0
Date: Wed, 2 Jul 2025 13:10:20 -0400
Message-ID: <20250702171020.69028-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702171020.69028-1-vitaly.prosyak@amd.com>
References: <20250702171020.69028-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|SJ2PR12MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d91975-83ef-4796-1555-08ddb98b559f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CelouctpqZSWvjRMPesW1n63V8wKNy9JF2Z6S+ne4A/CWP1k5eUNxttgHDHL?=
 =?us-ascii?Q?fJcBJDjsHXdxqJakOP4m8bqWGA3GmqRj6NzOz0WbohMbqCIFv2dhG9tzN7Zc?=
 =?us-ascii?Q?v3S5Ep4bMU2xbVncrSEJBL11Vq8IAX6uwBf5fp+/L9fZSz224OhOAjBsQRJZ?=
 =?us-ascii?Q?EZxWTwkd665xn81hku8HzM+QzIFF+Jz1gcDA4+CwLue3nhUBg9HKfX2wtPpS?=
 =?us-ascii?Q?ofQgWJfQpDEV3cJsrGql0ZHPC2fM4aFa7w2+ChdXmOTTM+RGapdTpJSm8Ec8?=
 =?us-ascii?Q?39X7gaK28ZywXSDXE+KePIpHH/i5FplvZgQ5i9qx0AMJfozPNUuHTaAwoci3?=
 =?us-ascii?Q?OCyMsVexDWf9NVtu/yw1kN2xf4zyME4iJIq0dens2MxCZcUpLy4Qu9Kg17e6?=
 =?us-ascii?Q?Aw0/PBNK8R4ZZUymYTIVIWFoi88fZol2U5tf07a0Lp9FK/abUQVjMqoNkJ6h?=
 =?us-ascii?Q?AoIlsBKxEPEgcRp2kbxZWJa+gkTGx8JA/4JnJfXecTc6ZNQaoyvFsztLvgYJ?=
 =?us-ascii?Q?uwJ5f69LjWEKCS0Or8WNDR5+79RKYP4q+YseBmMBdHpGpsFp9bZk8ZHJ18hW?=
 =?us-ascii?Q?Iyy/NkH9KT/ddBn0p93xYwnX2HCwfSEmZh2dnvFj6mStH8UzrFSv25ofskBK?=
 =?us-ascii?Q?TzSKPSF3hfmDvpFmbBFsH5fcbbL34QbpHCtDMaYHN8R9MWOhoVVvmuJYL/iT?=
 =?us-ascii?Q?4HUW7Z72w8BKJMZIDwJL/mrMYptQzedsdsLSvOZ2USzH72yJ6oHMQkatGNtJ?=
 =?us-ascii?Q?oGpINck3JXku3zN2xe6pSfRUqtRtc7XbF2IaGb86Iu14umvsFXYnd5at62Oz?=
 =?us-ascii?Q?gkFsuY6XF4wU8DQGarwpGv1qYOX1mHecDhR5yQJWMyiSdJE35NCGEW449PtG?=
 =?us-ascii?Q?YLTC+lOYpw4L1j8idGcMmCp1zVZYcpu95PJ4qrSCe3FVgzIgBJopD7WN1ySg?=
 =?us-ascii?Q?ediyzmCkMCd8Unv/xubnF9lFzrkHkq328SVKfgJdFWoeXEtYWVkXTStJmNt2?=
 =?us-ascii?Q?nDh2CXmt/4Qo5Ns1Q+mTeRgTZPOUEllm57XsZaRnUDq0jXIwByLCgaHnYT+b?=
 =?us-ascii?Q?6+SZhEWzSgawUUbAV0hh/vjAK7jIFtvOl1MczQ2A5y+amL1PtUgL1fm08HV2?=
 =?us-ascii?Q?PgT6Q89Zw5M/K6CUVQLkOAWkM1+h8vUa5nFiQFbclbuzDA5M0he8wIkQyk0C?=
 =?us-ascii?Q?C+xQp7Dufb5gA5ss7wUyuPXz/aPlypV8mOSEQjd3VkGA0ou/pPXq5ucRJZtk?=
 =?us-ascii?Q?CtpvQYB9Ta+GlxRyXBMrFae6tWYzJCcXvlCyzXYQTpKM7er31clLxqjlhRCm?=
 =?us-ascii?Q?VQ13yOGDndm+v9K+dUB8032jkUnPdP/NJuLtLQZOlATzgeuaie8ckHZnlsAM?=
 =?us-ascii?Q?y8ZICCL2tQ2GLB6elKQERNknUeyQRMkyf6hGyw7eO17twSoqBhXdnKQYtiRv?=
 =?us-ascii?Q?xOYpO93ANBRh6+bRaNwPuK5Br9cqJiFE0IABS+FpQWkKnuPsKRRnp2DUeLvR?=
 =?us-ascii?Q?zm8b296XjmdYGueMCle/pMhPFrc7JxXi1H03?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:10:24.4132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d91975-83ef-4796-1555-08ddb98b559f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9212
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[  +0.000020] BUG: KASAN: slab-use-after-free in amdgpu_userq_suspend+0x51a/0x5a0 [amdgpu]
[  +0.000817] Read of size 8 at addr ffff88812eec8c58 by task amd_pci_unplug/1733

[  +0.000027] CPU: 10 UID: 0 PID: 1733 Comm: amd_pci_unplug Tainted: G        W          6.14.0+ #2
[  +0.000009] Tainted: [W]=WARN
[  +0.000003] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMING (WI-FI), BIOS 1401 12/03/2020
[  +0.000004] Call Trace:
[  +0.000004]  <TASK>
[  +0.000003]  dump_stack_lvl+0x76/0xa0
[  +0.000011]  print_report+0xce/0x600
[  +0.000009]  ? srso_return_thunk+0x5/0x5f
[  +0.000006]  ? kasan_complete_mode_report_info+0x76/0x200
[  +0.000007]  ? kasan_addr_to_slab+0xd/0xb0
[  +0.000006]  ? amdgpu_userq_suspend+0x51a/0x5a0 [amdgpu]
[  +0.000707]  kasan_report+0xbe/0x110
[  +0.000006]  ? amdgpu_userq_suspend+0x51a/0x5a0 [amdgpu]
[  +0.000541]  __asan_report_load8_noabort+0x14/0x30
[  +0.000005]  amdgpu_userq_suspend+0x51a/0x5a0 [amdgpu]
[  +0.000535]  ? stop_cpsch+0x396/0x600 [amdgpu]
[  +0.000556]  ? stop_cpsch+0x429/0x600 [amdgpu]
[  +0.000536]  ? __pfx_amdgpu_userq_suspend+0x10/0x10 [amdgpu]
[  +0.000536]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? kgd2kfd_suspend+0x132/0x1d0 [amdgpu]
[  +0.000542]  amdgpu_device_fini_hw+0x581/0xe90 [amdgpu]
[  +0.000485]  ? down_write+0xbb/0x140
[  +0.000007]  ? __mutex_unlock_slowpath.constprop.0+0x317/0x360
[  +0.000005]  ? __pfx_amdgpu_device_fini_hw+0x10/0x10 [amdgpu]
[  +0.000482]  ? __kasan_check_write+0x14/0x30
[  +0.000004]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? up_write+0x55/0xb0
[  +0.000007]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? blocking_notifier_chain_unregister+0x6c/0xc0
[  +0.000008]  amdgpu_driver_unload_kms+0x69/0x90 [amdgpu]
[  +0.000484]  amdgpu_pci_remove+0x93/0x130 [amdgpu]
[  +0.000482]  pci_device_remove+0xae/0x1e0
[  +0.000008]  device_remove+0xc7/0x180
[  +0.000008]  device_release_driver_internal+0x3d4/0x5a0
[  +0.000007]  device_release_driver+0x12/0x20
[  +0.000004]  pci_stop_bus_device+0x104/0x150
[  +0.000006]  pci_stop_and_remove_bus_device_locked+0x1b/0x40
[  +0.000005]  remove_store+0xd7/0xf0
[  +0.000005]  ? __pfx_remove_store+0x10/0x10
[  +0.000006]  ? __pfx__copy_from_iter+0x10/0x10
[  +0.000006]  ? __pfx_dev_attr_store+0x10/0x10
[  +0.000006]  dev_attr_store+0x3f/0x80
[  +0.000006]  sysfs_kf_write+0x125/0x1d0
[  +0.000004]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? __kasan_check_write+0x14/0x30
[  +0.000005]  kernfs_fop_write_iter+0x2ea/0x490
[  +0.000005]  ? rw_verify_area+0x70/0x420
[  +0.000005]  ? __pfx_kernfs_fop_write_iter+0x10/0x10
[  +0.000006]  vfs_write+0x90d/0xe70
[  +0.000005]  ? srso_return_thunk+0x5/0x5f
[  +0.000005]  ? __pfx_vfs_write+0x10/0x10
[  +0.000004]  ? local_clock+0x15/0x30
[  +0.000008]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? __kasan_slab_free+0x5f/0x80
[  +0.000005]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? __kasan_check_read+0x11/0x20
[  +0.000004]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? fdget_pos+0x1d3/0x500
[  +0.000007]  ksys_write+0x119/0x220
[  +0.000005]  ? putname+0x1c/0x30
[  +0.000006]  ? __pfx_ksys_write+0x10/0x10
[  +0.000007]  __x64_sys_write+0x72/0xc0
[  +0.000006]  x64_sys_call+0x18ab/0x26f0
[  +0.000006]  do_syscall_64+0x7c/0x170
[  +0.000004]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? __pfx___x64_sys_openat+0x10/0x10
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? __kasan_check_read+0x11/0x20
[  +0.000003]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? fpregs_assert_state_consistent+0x21/0xb0
[  +0.000006]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? syscall_exit_to_user_mode+0x4e/0x240
[  +0.000005]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? do_syscall_64+0x88/0x170
[  +0.000003]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? irqentry_exit+0x43/0x50
[  +0.000004]  ? srso_return_thunk+0x5/0x5f
[  +0.000004]  ? exc_page_fault+0x7c/0x110
[  +0.000006]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  +0.000006] RIP: 0033:0x7480c0b14887
[  +0.000005] Code: 10 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  +0.000005] RSP: 002b:00007fff142b0058 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  +0.000006] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007480c0b14887
[  +0.000003] RDX: 0000000000000001 RSI: 00007480c0e7365a RDI: 0000000000000004
[  +0.000003] RBP: 00007fff142b0080 R08: 0000563b2e73c170 R09: 0000000000000000
[  +0.000003] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff142b02f8
[  +0.000003] R13: 0000563b159a72a9 R14: 0000563b159a9d48 R15: 00007480c0f19040
[  +0.000008]  </TASK>

[  +0.000445] Allocated by task 427 on cpu 5 at 29.342331s:
[  +0.000011]  kasan_save_stack+0x28/0x60
[  +0.000006]  kasan_save_track+0x18/0x70
[  +0.000006]  kasan_save_alloc_info+0x38/0x60
[  +0.000005]  __kasan_kmalloc+0xc1/0xd0
[  +0.000006]  __kmalloc_cache_noprof+0x1bd/0x430
[  +0.000007]  amdgpu_driver_open_kms+0x172/0x760 [amdgpu]
[  +0.000493]  drm_file_alloc+0x569/0x9a0
[  +0.000007]  drm_client_init+0x1b7/0x410
[  +0.000007]  drm_fbdev_client_setup+0x174/0x470
[  +0.000006]  drm_client_setup+0x8a/0xf0
[  +0.000006]  amdgpu_pci_probe+0x510/0x10c0 [amdgpu]
[  +0.000483]  local_pci_probe+0xe7/0x1b0
[  +0.000006]  pci_device_probe+0x5bf/0x890
[  +0.000006]  really_probe+0x1fd/0x950
[  +0.000005]  __driver_probe_device+0x307/0x410
[  +0.000006]  driver_probe_device+0x4e/0x150
[  +0.000005]  __driver_attach+0x223/0x510
[  +0.000006]  bus_for_each_dev+0x102/0x1a0
[  +0.000005]  driver_attach+0x3d/0x60
[  +0.000006]  bus_add_driver+0x309/0x650
[  +0.000005]  driver_register+0x13d/0x490
[  +0.000006]  __pci_register_driver+0x1ee/0x2b0
[  +0.000006]  rfcomm_dlc_clear_state+0x69/0x220 [rfcomm]
[  +0.000011]  do_one_initcall+0x9c/0x3e0
[  +0.000007]  do_init_module+0x29e/0x7f0
[  +0.000006]  load_module+0x5c75/0x7c80
[  +0.000006]  init_module_from_file+0x106/0x180
[  +0.000006]  idempotent_init_module+0x377/0x740
[  +0.000006]  __x64_sys_finit_module+0xd7/0x180
[  +0.000006]  x64_sys_call+0x1f0b/0x26f0
[  +0.000006]  do_syscall_64+0x7c/0x170
[  +0.000005]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

[  +0.000013] Freed by task 1733 on cpu 5 at 59.907086s:
[  +0.000011]  kasan_save_stack+0x28/0x60
[  +0.000006]  kasan_save_track+0x18/0x70
[  +0.000005]  kasan_save_free_info+0x3b/0x60
[  +0.000005]  __kasan_slab_free+0x54/0x80
[  +0.000006]  kfree+0x127/0x470
[  +0.000006]  amdgpu_driver_postclose_kms+0x455/0x760 [amdgpu]
[  +0.000493]  drm_file_free.part.0+0x5b1/0xba0
[  +0.000006]  drm_file_free+0x13/0x30
[  +0.000006]  drm_client_release+0x1c4/0x2b0
[  +0.000006]  drm_fbdev_ttm_fb_destroy+0xd2/0x120 [drm_ttm_helper]
[  +0.000007]  put_fb_info+0x97/0xe0
[  +0.000007]  unregister_framebuffer+0x197/0x380
[  +0.000005]  drm_fb_helper_unregister_info+0x94/0x100
[  +0.000005]  drm_fbdev_client_unregister+0x3c/0x80
[  +0.000007]  drm_client_dev_unregister+0x144/0x330
[  +0.000006]  drm_dev_unregister+0x49/0x1b0
[  +0.000006]  drm_dev_unplug+0x4c/0xd0
[  +0.000006]  amdgpu_pci_remove+0x58/0x130 [amdgpu]
[  +0.000484]  pci_device_remove+0xae/0x1e0
[  +0.000008]  device_remove+0xc7/0x180
[  +0.000007]  device_release_driver_internal+0x3d4/0x5a0
[  +0.000006]  device_release_driver+0x12/0x20
[  +0.000007]  pci_stop_bus_device+0x104/0x150
[  +0.000006]  pci_stop_and_remove_bus_device_locked+0x1b/0x40
[  +0.000006]  remove_store+0xd7/0xf0
[  +0.000006]  dev_attr_store+0x3f/0x80
[  +0.000005]  sysfs_kf_write+0x125/0x1d0
[  +0.000006]  kernfs_fop_write_iter+0x2ea/0x490
[  +0.000006]  vfs_write+0x90d/0xe70
[  +0.000006]  ksys_write+0x119/0x220
[  +0.000006]  __x64_sys_write+0x72/0xc0
[  +0.000006]  x64_sys_call+0x18ab/0x26f0
[  +0.000005]  do_syscall_64+0x7c/0x170
[  +0.000006]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

[  +0.000012] The buggy address belongs to the object at ffff88812eec8000
               which belongs to the cache kmalloc-rnd-07-4k of size 4096
[  +0.000016] The buggy address is located 3160 bytes inside of
               freed 4096-byte region [ffff88812eec8000, ffff88812eec9000)

[  +0.000023] The buggy address belongs to the physical page:
[  +0.000009] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x12eec8
[  +0.000007] head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[  +0.000005] flags: 0x17ffffc0000040(head|node=0|zone=2|lastcpupid=0x1fffff)
[  +0.000007] page_type: f5(slab)
[  +0.000008] raw: 0017ffffc0000040 ffff888100054500 dead000000000122 0000000000000000
[  +0.000005] raw: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
[  +0.000006] head: 0017ffffc0000040 ffff888100054500 dead000000000122 0000000000000000
[  +0.000005] head: 0000000000000000 0000000080040004 00000000f5000000 0000000000000000
[  +0.000006] head: 0017ffffc0000003 ffffea0004bbb201 ffffffffffffffff 0000000000000000
[  +0.000005] head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
[  +0.000005] page dumped because: kasan: bad access detected

[  +0.000010] Memory state around the buggy address:
[  +0.000009]  ffff88812eec8b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000012]  ffff88812eec8b80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000011] >ffff88812eec8c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000011]                                                     ^
[  +0.000010]  ffff88812eec8c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000011]  ffff88812eec8d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  +0.000011] ==================================================================

The use-after-free occurs because a delayed work item (`suspend_work`) may still
be pending or running when resources it accesses are freed during device removal
or file close. The previous code used `flush_work(&fpriv->evf_mgr.suspend_work.work)`,
which does not wait for delayed work that has not yet started. As a result, the
delayed work could run after its memory was freed, causing a use-after-free.
By switching to `flush_delayed_work(&fpriv->evf_mgr.suspend_work)`, we ensure that
the kernel waits for both queued and delayed work to finish before
freeing memory, closing this race.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
index 295e7186e156..aac0de86f3e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -664,7 +664,7 @@ static void amdgpu_userq_restore_worker(struct work_struct *work)
 	struct amdgpu_fpriv *fpriv = uq_mgr_to_fpriv(uq_mgr);
 	int ret;
 
-	flush_work(&fpriv->evf_mgr.suspend_work.work);
+	flush_delayed_work(&fpriv->evf_mgr.suspend_work);
 
 	mutex_lock(&uq_mgr->userq_mutex);
 
-- 
2.34.1

