Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E729D48C9
	for <lists+amd-gfx@lfdr.de>; Thu, 21 Nov 2024 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692FC8903B;
	Thu, 21 Nov 2024 08:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HlRM50/H";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377A010E410
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2024 08:27:29 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso5067035e9.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 Nov 2024 00:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732177647; x=1732782447; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8dLsotoMiVRV1KiE3qB73rB9WvwJ0R/bsFNNe7pB+ZY=;
 b=HlRM50/H6t5vG3oPyvuL34OtTHKEXYTqAv0snN9rR32U2REzA7c1uLFSp/cPWHDiux
 smymsxW7wTVHkWz10REb8cDLEbVojA38wlHaxXJ6v2Nh0exHF5AWgnIyivs4SfhS8Dea
 7Q8vGrw8LFR61BQbgMV9mpDiWJw/P5y6ZF6VdvaDicYBfyJLeZUgJof0yDRtAFEuuRRU
 ujcCIboKWvWeZ4szMjolm7bmevSAxJuqysd/AYDdJL8bhnuotp+MQ7j97ZD/hEinyOr2
 1BFLBIfoxRTcPz8TuniazwJPkIBfVy8J9lNcyEaaEfpeqPdh77PKAW+YxkRD0iiceJ2r
 nnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732177647; x=1732782447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8dLsotoMiVRV1KiE3qB73rB9WvwJ0R/bsFNNe7pB+ZY=;
 b=sXHDDApvRDcXiw6keoSfQaawOn1r36s3ONI2J58reSNW6U40bwV+YkQce3/tUF+3BV
 KYRuTuw8QVkpngqeqUD0Q3nkr4oWizssylOjKBNYpd8ogoZA+WlnXY1DUzQ9BaV1hpgM
 uKdHL8s/CrA2jRArWmTh3mWn3ROjOZq5SPonqHsRfsfRhZloIEIUbo+LELewAR2QcgVp
 aROF/TSm+ROpu4teNNhvpP44koLJjnYxeHAOUa7C9ZQgh+FguuwuXbQHypG8YIYuoldK
 NwgKzYgnOxPI14A8Lg96Gqui7cKwjTb5Fb9+5tcgIgf8iU0IiQWZL+1NxyQ6Vmen0UUW
 VozA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNNXaN5KRzIcUNAaouHtGUA27n3iyT3TM3jf7xKAIKsPc2iOCUBT0X+eRs4JYngCtcpIQ03Bsp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXi4BvaqjwyW6cUs0YbiIW0A1nUNnqHnPITqIIi4uwuBOs+LCJ
 w5tFTTgE10z1cj687lc+jrshcRzV869J1fcBworMTPeHVwYJHpHn
X-Google-Smtp-Source: AGHT+IEzLhqzBpONjuTWPiEE13QQS8Qb5jORT1mj+zTsJZ2fgC5Ij5FeXwC06AEnzczb7ZlcTR/kYw==
X-Received: by 2002:a05:600c:3513:b0:431:5503:43ca with SMTP id
 5b1f17b1804b1-4334f027a4emr41839175e9.28.1732177647160; 
 Thu, 21 Nov 2024 00:27:27 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b46029acsm45424835e9.18.2024.11.21.00.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 00:27:26 -0800 (PST)
Message-ID: <bbdf794e-7f14-498a-a37a-308df8c22995@gmail.com>
Date: Thu, 21 Nov 2024 09:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: fix usage slab after free
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 --cc=alexander.deucher@amd.com
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20241114014650.397845-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20241114014650.397845-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 14.11.24 um 02:46 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> [  +0.000021] BUG: KASAN: slab-use-after-free in drm_sched_entity_flush+0x6cb/0x7a0 [gpu_sched]
> [  +0.000027] Read of size 8 at addr ffff8881b8605f88 by task amd_pci_unplug/2147
>
> [  +0.000023] CPU: 6 PID: 2147 Comm: amd_pci_unplug Not tainted 6.10.0+ #1
> [  +0.000016] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMING (WI-FI), BIOS 1401 12/03/2020
> [  +0.000016] Call Trace:
> [  +0.000008]  <TASK>
> [  +0.000009]  dump_stack_lvl+0x76/0xa0
> [  +0.000017]  print_report+0xce/0x5f0
> [  +0.000017]  ? drm_sched_entity_flush+0x6cb/0x7a0 [gpu_sched]
> [  +0.000019]  ? srso_return_thunk+0x5/0x5f
> [  +0.000015]  ? kasan_complete_mode_report_info+0x72/0x200
> [  +0.000016]  ? drm_sched_entity_flush+0x6cb/0x7a0 [gpu_sched]
> [  +0.000019]  kasan_report+0xbe/0x110
> [  +0.000015]  ? drm_sched_entity_flush+0x6cb/0x7a0 [gpu_sched]
> [  +0.000023]  __asan_report_load8_noabort+0x14/0x30
> [  +0.000014]  drm_sched_entity_flush+0x6cb/0x7a0 [gpu_sched]
> [  +0.000020]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __kasan_check_write+0x14/0x30
> [  +0.000016]  ? __pfx_drm_sched_entity_flush+0x10/0x10 [gpu_sched]
> [  +0.000020]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? __kasan_check_write+0x14/0x30
> [  +0.000013]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? enable_work+0x124/0x220
> [  +0.000015]  ? __pfx_enable_work+0x10/0x10
> [  +0.000013]  ? srso_return_thunk+0x5/0x5f
> [  +0.000014]  ? free_large_kmalloc+0x85/0xf0
> [  +0.000016]  drm_sched_entity_destroy+0x18/0x30 [gpu_sched]
> [  +0.000020]  amdgpu_vce_sw_fini+0x55/0x170 [amdgpu]
> [  +0.000735]  ? __kasan_check_read+0x11/0x20
> [  +0.000016]  vce_v4_0_sw_fini+0x80/0x110 [amdgpu]
> [  +0.000726]  amdgpu_device_fini_sw+0x331/0xfc0 [amdgpu]
> [  +0.000679]  ? mutex_unlock+0x80/0xe0
> [  +0.000017]  ? __pfx_amdgpu_device_fini_sw+0x10/0x10 [amdgpu]
> [  +0.000662]  ? srso_return_thunk+0x5/0x5f
> [  +0.000014]  ? __kasan_check_write+0x14/0x30
> [  +0.000013]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? mutex_unlock+0x80/0xe0
> [  +0.000016]  amdgpu_driver_release_kms+0x16/0x80 [amdgpu]
> [  +0.000663]  drm_minor_release+0xc9/0x140 [drm]
> [  +0.000081]  drm_release+0x1fd/0x390 [drm]
> [  +0.000082]  __fput+0x36c/0xad0
> [  +0.000018]  __fput_sync+0x3c/0x50
> [  +0.000014]  __x64_sys_close+0x7d/0xe0
> [  +0.000014]  x64_sys_call+0x1bc6/0x2680
> [  +0.000014]  do_syscall_64+0x70/0x130
> [  +0.000014]  ? srso_return_thunk+0x5/0x5f
> [  +0.000014]  ? irqentry_exit_to_user_mode+0x60/0x190
> [  +0.000015]  ? srso_return_thunk+0x5/0x5f
> [  +0.000014]  ? irqentry_exit+0x43/0x50
> [  +0.000012]  ? srso_return_thunk+0x5/0x5f
> [  +0.000013]  ? exc_page_fault+0x7c/0x110
> [  +0.000015]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [  +0.000014] RIP: 0033:0x7ffff7b14f67
> [  +0.000013] Code: ff e8 0d 16 02 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 41 c3 48 83 ec 18 89 7c 24 0c e8 73 ba f7 ff
> [  +0.000026] RSP: 002b:00007fffffffe378 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
> [  +0.000019] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ffff7b14f67
> [  +0.000014] RDX: 0000000000000000 RSI: 00007ffff7f6f47a RDI: 0000000000000003
> [  +0.000014] RBP: 00007fffffffe3a0 R08: 0000555555569890 R09: 0000000000000000
> [  +0.000014] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fffffffe5c8
> [  +0.000013] R13: 00005555555552a9 R14: 0000555555557d48 R15: 00007ffff7ffd040
> [  +0.000020]  </TASK>
>
> [  +0.000016] Allocated by task 383 on cpu 7 at 26.880319s:
> [  +0.000014]  kasan_save_stack+0x28/0x60
> [  +0.000008]  kasan_save_track+0x18/0x70
> [  +0.000007]  kasan_save_alloc_info+0x38/0x60
> [  +0.000007]  __kasan_kmalloc+0xc1/0xd0
> [  +0.000007]  kmalloc_trace_noprof+0x180/0x380
> [  +0.000007]  drm_sched_init+0x411/0xec0 [gpu_sched]
> [  +0.000012]  amdgpu_device_init+0x695f/0xa610 [amdgpu]
> [  +0.000658]  amdgpu_driver_load_kms+0x1a/0x120 [amdgpu]
> [  +0.000662]  amdgpu_pci_probe+0x361/0xf30 [amdgpu]
> [  +0.000651]  local_pci_probe+0xe7/0x1b0
> [  +0.000009]  pci_device_probe+0x248/0x890
> [  +0.000008]  really_probe+0x1fd/0x950
> [  +0.000008]  __driver_probe_device+0x307/0x410
> [  +0.000007]  driver_probe_device+0x4e/0x150
> [  +0.000007]  __driver_attach+0x223/0x510
> [  +0.000006]  bus_for_each_dev+0x102/0x1a0
> [  +0.000007]  driver_attach+0x3d/0x60
> [  +0.000006]  bus_add_driver+0x2ac/0x5f0
> [  +0.000006]  driver_register+0x13d/0x490
> [  +0.000008]  __pci_register_driver+0x1ee/0x2b0
> [  +0.000007]  llc_sap_close+0xb0/0x160 [llc]
> [  +0.000009]  do_one_initcall+0x9c/0x3e0
> [  +0.000008]  do_init_module+0x241/0x760
> [  +0.000008]  load_module+0x51ac/0x6c30
> [  +0.000006]  __do_sys_init_module+0x234/0x270
> [  +0.000007]  __x64_sys_init_module+0x73/0xc0
> [  +0.000006]  x64_sys_call+0xe3/0x2680
> [  +0.000006]  do_syscall_64+0x70/0x130
> [  +0.000007]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> [  +0.000015] Freed by task 2147 on cpu 6 at 160.507651s:
> [  +0.000013]  kasan_save_stack+0x28/0x60
> [  +0.000007]  kasan_save_track+0x18/0x70
> [  +0.000007]  kasan_save_free_info+0x3b/0x60
> [  +0.000007]  poison_slab_object+0x115/0x1c0
> [  +0.000007]  __kasan_slab_free+0x34/0x60
> [  +0.000007]  kfree+0xfa/0x2f0
> [  +0.000007]  drm_sched_fini+0x19d/0x410 [gpu_sched]
> [  +0.000012]  amdgpu_fence_driver_sw_fini+0xc4/0x2f0 [amdgpu]
> [  +0.000662]  amdgpu_device_fini_sw+0x77/0xfc0 [amdgpu]
> [  +0.000653]  amdgpu_driver_release_kms+0x16/0x80 [amdgpu]
> [  +0.000655]  drm_minor_release+0xc9/0x140 [drm]
> [  +0.000071]  drm_release+0x1fd/0x390 [drm]
> [  +0.000071]  __fput+0x36c/0xad0
> [  +0.000008]  __fput_sync+0x3c/0x50
> [  +0.000007]  __x64_sys_close+0x7d/0xe0
> [  +0.000007]  x64_sys_call+0x1bc6/0x2680
> [  +0.000007]  do_syscall_64+0x70/0x130
> [  +0.000007]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> [  +0.000014] The buggy address belongs to the object at ffff8881b8605f80
>                 which belongs to the cache kmalloc-64 of size 64
> [  +0.000020] The buggy address is located 8 bytes inside of
>                 freed 64-byte region [ffff8881b8605f80, ffff8881b8605fc0)
>
> [  +0.000028] The buggy address belongs to the physical page:
> [  +0.000011] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1b8605
> [  +0.000008] anon flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
> [  +0.000007] page_type: 0xffffefff(slab)
> [  +0.000009] raw: 0017ffffc0000000 ffff8881000428c0 0000000000000000 dead000000000001
> [  +0.000006] raw: 0000000000000000 0000000000200020 00000001ffffefff 0000000000000000
> [  +0.000006] page dumped because: kasan: bad access detected
>
> [  +0.000012] Memory state around the buggy address:
> [  +0.000011]  ffff8881b8605e80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> [  +0.000015]  ffff8881b8605f00: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
> [  +0.000015] >ffff8881b8605f80: fa fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> [  +0.000013]                       ^
> [  +0.000011]  ffff8881b8606000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc
> [  +0.000014]  ffff8881b8606080: fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb fb
> [  +0.000013] ==================================================================
>
> The issue reproduced on VG20 during the IGT pci_unplug test.
> The root cause of the issue is that the function drm_sched_fini is called before drm_sched_entity_kill.
> In drm_sched_fini, the drm_sched_rq structure is freed, but this structure is later accessed by
> each entity within the run queue, leading to invalid memory access.
> To resolve this, the order of cleanup calls is updated:
>
>      Before:
>          amdgpu_fence_driver_sw_fini
>          amdgpu_device_ip_fini
>
>      After:
>          amdgpu_device_ip_fini
>          amdgpu_fence_driver_sw_fini
>
> This updated order ensures that all entities in the IPs are cleaned up first, followed by proper
> cleanup of the schedulers.
>
> Additional Investigation:
>
> During debugging, another issue was identified in the amdgpu_vce_sw_fini function. The vce.vcpu_bo
> buffer must be freed only as the final step in the cleanup process to prevent any premature
> access during earlier cleanup stages.
>
> v2: Using Christian suggestion call drm_sched_entity_destroy before drm_sched_fini.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Change-Id: Icaf4adbf0b581c7194e5ec5d44b10833753f98d5

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c    | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index b3ca911e55d6..dccd13277982 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4698,8 +4698,8 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>   	int idx;
>   	bool px;
>   
> -	amdgpu_fence_driver_sw_fini(adev);
>   	amdgpu_device_ip_fini(adev);
> +	amdgpu_fence_driver_sw_fini(adev);
>   	amdgpu_ucode_release(&adev->firmware.gpu_info_fw);
>   	adev->accel_working = false;
>   	dma_fence_put(rcu_dereference_protected(adev->gang_submit, true));
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a061fb8a2fcf..6a0dcafcb740 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -214,15 +214,15 @@ int amdgpu_vce_sw_fini(struct amdgpu_device *adev)
>   
>   	drm_sched_entity_destroy(&adev->vce.entity);
>   
> -	amdgpu_bo_free_kernel(&adev->vce.vcpu_bo, &adev->vce.gpu_addr,
> -		(void **)&adev->vce.cpu_addr);
> -
>   	for (i = 0; i < adev->vce.num_rings; i++)
>   		amdgpu_ring_fini(&adev->vce.ring[i]);
>   
>   	amdgpu_ucode_release(&adev->vce.fw);
>   	mutex_destroy(&adev->vce.idle_mutex);
>   
> +	amdgpu_bo_free_kernel(&adev->vce.vcpu_bo, &adev->vce.gpu_addr,
> +		(void **)&adev->vce.cpu_addr);
> +
>   	return 0;
>   }
>   

