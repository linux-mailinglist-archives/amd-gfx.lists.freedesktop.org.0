Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50F87CE78
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Mar 2024 15:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81577112261;
	Fri, 15 Mar 2024 14:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UyzPhXDG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BB5112261;
 Fri, 15 Mar 2024 14:04:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-513b022a238so2616006e87.0; 
 Fri, 15 Mar 2024 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710511450; x=1711116250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lYTEGB7zPxQny+jq90ffxCzeLxp0iDrYTzwcRSjMo7o=;
 b=UyzPhXDGYANfW+HBMPjjgG4KYdVgUjZWEmKS2MyLxXZu0hlrb27Ry87OQE1Gr3pw9v
 dgmSaVMA6xFgBdOhLU9/MsmxnKiY6uI5pUnVE15GFjwBknsZ81v6r8kWcX9sq+1z/Dmq
 fc33HtgkHFWFdk8WggHhHdLZxbdM/5eRgT/MGr+j0W5xc7zObhuflSKHjBKmlGsN41Hr
 ShCtBXHmqWYUN5k0wdomb2p26C2Rjj+KTGyOvsAsFYrgtk9Iiho//3xtX7KybQ3+kSyn
 /zx2Q3ziD5wQalM2GbUpvxHMF69CjU+1ckiemNeNrWVWPadIBxWUfmZbtauU5gsAN6+C
 9MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710511450; x=1711116250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYTEGB7zPxQny+jq90ffxCzeLxp0iDrYTzwcRSjMo7o=;
 b=DQdCwg6ARgUybs07aFsSNNZy4w1Y0LmLzEeQWds+q1PssuaGIMrTzBnLKj5FhU8bq7
 mX+wijbhAU1Tyamh6DAwPgPILXUfobWz5/OH1NN4j5IOUiQzcEuMM3xtYKcc4YuVIAO8
 /zGaDVjClRbOskcPibztn5n9X5hGUr5l6U8ppcq3JGXWu8Fr3JHiFUT9tbT9iI5oOdzj
 JTOH5twh3PzVJWJjoy9BBXE07ZcBjtm0VYLS8PKXBRSSEX4ROuOWAFHj65nrkhUn5ZCE
 LvOELZdZVlNdVxHTpUJlMexJxRv6nKGOyThCWqxco2zl/zJHmdqGZTLjxR78g99Q8zRv
 Afog==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4Ne8UdNIJ8DK67VayUS33ugTOVukf01pmuZNMPa2OB+1QyC1Zex0cZEuR51BZLS/bBcfbG1iK4cGu5hoRsSpv71cyVmQ3fV/Bh4Wh4k9qF5sqOU0s8AgeARC6QO7DWm50xR8a+r3QxxrKgG3Mww==
X-Gm-Message-State: AOJu0YxlZtcizit0T9e83s4lCgUyjwFSI0Njfvwb9sdA2fRt4HmkpJQ/
 Lgu2h0wAGPYOp5gSsRSQx7m79LswKWqcyKf+73dEscqNwIHvQ/aP
X-Google-Smtp-Source: AGHT+IE1iM6nPnrWm0J+DBAUp0S69pwH0Yj+j9sU1lQOjBDPmpeq1coXVD/pDikbvd75Ids5aJPdaw==
X-Received: by 2002:a19:430e:0:b0:513:b28f:6b5d with SMTP id
 q14-20020a19430e000000b00513b28f6b5dmr3264440lfa.19.1710511450246; 
 Fri, 15 Mar 2024 07:04:10 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00413ea26f942sm8639360wmq.14.2024.03.15.07.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 07:04:09 -0700 (PDT)
Message-ID: <62173dc5-2cc9-4bcc-9ef5-72631ae96e30@gmail.com>
Date: Fri, 15 Mar 2024 15:04:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: fix null-ptr-deref in init entity
Content-Language: en-US
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Dokyung Song <dokyungs@yonsei.ac.kr>,
 jisoo.jang@yonsei.ac.kr, yw9865@yonsei.ac.kr
References: <20240315023926.343164-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240315023926.343164-1-vitaly.prosyak@amd.com>
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

Am 15.03.24 um 03:39 schrieb vitaly.prosyak@amd.com:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> The bug can be triggered by sending an amdgpu_cs_wait_ioctl
> to the AMDGPU DRM driver on any ASICs with valid context.
> The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> For example the following code:
>
>      static void Syzkaller2(int fd)
>      {
> 	union drm_amdgpu_ctx arg1;
> 	union drm_amdgpu_wait_cs arg2;
>
> 	arg1.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
> 	ret = drmIoctl(fd, 0x140106442 /* amdgpu_ctx_ioctl */, &arg1);
>
> 	arg2.in.handle = 0x0;
> 	arg2.in.timeout = 0x2000000000000;
> 	arg2.in.ip_type = AMD_IP_VPE /* 0x9 */;
> 	arg2->in.ip_instance = 0x0;
> 	arg2.in.ring = 0x0;
> 	arg2.in.ctx_id = arg1.out.alloc.ctx_id;
>
> 	drmIoctl(fd, 0xc0206449 /* AMDGPU_WAIT_CS * /, &arg2);
>      }
>
> The ioctl AMDGPU_WAIT_CS without previously submitted job could be assumed that
> the error should be returned, but the following commit 1decbf6bb0b4dc56c9da6c5e57b994ebfc2be3aa
> modified the logic and allowed to have sched_rq equal to NULL.
>
> As a result when there is no job the ioctl AMDGPU_WAIT_CS returns success.
> The change fixes null-ptr-deref in init entity and the stack below demonstrates
> the error condition:
>
> [  +0.000007] BUG: kernel NULL pointer dereference, address: 0000000000000028
> [  +0.007086] #PF: supervisor read access in kernel mode
> [  +0.005234] #PF: error_code(0x0000) - not-present page
> [  +0.005232] PGD 0 P4D 0
> [  +0.002501] Oops: 0000 [#1] PREEMPT SMP KASAN NOPTI
> [  +0.005034] CPU: 10 PID: 9229 Comm: amd_basic Tainted: G    B   W    L     6.7.0+ #4
> [  +0.007797] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMING (WI-FI), BIOS 1401 12/03/2020
> [  +0.009798] RIP: 0010:drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
> [  +0.006426] Code: 80 00 00 00 00 00 00 00 e8 1a 81 82 e0 49 89 9c 24 c0 00 00 00 4c 89 ef e8 4a 80 82 e0 49 8b 5d 00 48 8d 7b 28 e8 3d 80 82 e0 <48> 83 7b 28 00 0f 84 28 01 00 00 4d 8d ac 24 98 00 00 00 49 8d 5c
> [  +0.019094] RSP: 0018:ffffc90014c1fa40 EFLAGS: 00010282
> [  +0.005237] RAX: 0000000000000001 RBX: 0000000000000000 RCX: ffffffff8113f3fa
> [  +0.007326] RDX: fffffbfff0a7889d RSI: 0000000000000008 RDI: ffffffff853c44e0
> [  +0.007264] RBP: ffffc90014c1fa80 R08: 0000000000000001 R09: fffffbfff0a7889c
> [  +0.007266] R10: ffffffff853c44e7 R11: 0000000000000001 R12: ffff8881a719b010
> [  +0.007263] R13: ffff88810d412748 R14: 0000000000000002 R15: 0000000000000000
> [  +0.007264] FS:  00007ffff7045540(0000) GS:ffff8883cc900000(0000) knlGS:0000000000000000
> [  +0.008236] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.005851] CR2: 0000000000000028 CR3: 000000011912e000 CR4: 0000000000350ef0
> [  +0.007175] Call Trace:
> [  +0.002561]  <TASK>
> [  +0.002141]  ? show_regs+0x6a/0x80
> [  +0.003473]  ? __die+0x25/0x70
> [  +0.003124]  ? page_fault_oops+0x214/0x720
> [  +0.004179]  ? preempt_count_sub+0x18/0xc0
> [  +0.004093]  ? __pfx_page_fault_oops+0x10/0x10
> [  +0.004590]  ? srso_return_thunk+0x5/0x5f
> [  +0.004000]  ? vprintk_default+0x1d/0x30
> [  +0.004063]  ? srso_return_thunk+0x5/0x5f
> [  +0.004087]  ? vprintk+0x5c/0x90
> [  +0.003296]  ? drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
> [  +0.005807]  ? srso_return_thunk+0x5/0x5f
> [  +0.004090]  ? _printk+0xb3/0xe0
> [  +0.003293]  ? __pfx__printk+0x10/0x10
> [  +0.003735]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
> [  +0.005482]  ? do_user_addr_fault+0x345/0x770
> [  +0.004361]  ? exc_page_fault+0x64/0xf0
> [  +0.003972]  ? asm_exc_page_fault+0x27/0x30
> [  +0.004271]  ? add_taint+0x2a/0xa0
> [  +0.003476]  ? drm_sched_entity_init+0x2d3/0x420 [gpu_sched]
> [  +0.005812]  amdgpu_ctx_get_entity+0x3f9/0x770 [amdgpu]
> [  +0.009530]  ? finish_task_switch.isra.0+0x129/0x470
> [  +0.005068]  ? __pfx_amdgpu_ctx_get_entity+0x10/0x10 [amdgpu]
> [  +0.010063]  ? __kasan_check_write+0x14/0x20
> [  +0.004356]  ? srso_return_thunk+0x5/0x5f
> [  +0.004001]  ? mutex_unlock+0x81/0xd0
> [  +0.003802]  ? srso_return_thunk+0x5/0x5f
> [  +0.004096]  amdgpu_cs_wait_ioctl+0xf6/0x270 [amdgpu]
> [  +0.009355]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
> [  +0.009981]  ? srso_return_thunk+0x5/0x5f
> [  +0.004089]  ? srso_return_thunk+0x5/0x5f
> [  +0.004090]  ? __srcu_read_lock+0x20/0x50
> [  +0.004096]  drm_ioctl_kernel+0x140/0x1f0 [drm]
> [  +0.005080]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
> [  +0.009974]  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
> [  +0.005618]  ? srso_return_thunk+0x5/0x5f
> [  +0.004088]  ? __kasan_check_write+0x14/0x20
> [  +0.004357]  drm_ioctl+0x3da/0x730 [drm]
> [  +0.004461]  ? __pfx_amdgpu_cs_wait_ioctl+0x10/0x10 [amdgpu]
> [  +0.009979]  ? __pfx_drm_ioctl+0x10/0x10 [drm]
> [  +0.004993]  ? srso_return_thunk+0x5/0x5f
> [  +0.004090]  ? __kasan_check_write+0x14/0x20
> [  +0.004356]  ? srso_return_thunk+0x5/0x5f
> [  +0.004090]  ? _raw_spin_lock_irqsave+0x99/0x100
> [  +0.004712]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [  +0.005063]  ? __pfx_arch_do_signal_or_restart+0x10/0x10
> [  +0.005477]  ? srso_return_thunk+0x5/0x5f
> [  +0.004000]  ? preempt_count_sub+0x18/0xc0
> [  +0.004237]  ? srso_return_thunk+0x5/0x5f
> [  +0.004090]  ? _raw_spin_unlock_irqrestore+0x27/0x50
> [  +0.005069]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
> [  +0.008912]  __x64_sys_ioctl+0xcd/0x110
> [  +0.003918]  do_syscall_64+0x5f/0xe0
> [  +0.003649]  ? noist_exc_debug+0xe6/0x120
> [  +0.004095]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> [  +0.005150] RIP: 0033:0x7ffff7b1a94f
> [  +0.003647] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
> [  +0.019097] RSP: 002b:00007fffffffe0a0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  +0.007708] RAX: ffffffffffffffda RBX: 000055555558b360 RCX: 00007ffff7b1a94f
> [  +0.007176] RDX: 000055555558b360 RSI: 00000000c0206449 RDI: 0000000000000003
> [  +0.007326] RBP: 00000000c0206449 R08: 000055555556ded0 R09: 000000007fffffff
> [  +0.007176] R10: 0000000000000000 R11: 0000000000000246 R12: 00007fffffffe5d8
> [  +0.007238] R13: 0000000000000003 R14: 000055555555cba8 R15: 00007ffff7ffd040
> [  +0.007250]  </TASK>
>
> v2: Reworked check to guard against null ptr deref and added helpful comments
>      (Christian)
>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
> Cc: Dokyung Song <dokyungs@yonsei.ac.kr>
> Cc: <jisoo.jang@yonsei.ac.kr>
> Cc: <yw9865@yonsei.ac.kr>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Going to push this to drm-misc-fixes.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 3c4f5a392b06..58c8161289fe 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -71,13 +71,19 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	entity->guilty = guilty;
>   	entity->num_sched_list = num_sched_list;
>   	entity->priority = priority;
> +	/*
> +	 * It's perfectly valid to initialize an entity without having a valid
> +	 * scheduler attached. It's just not valid to use the scheduler before it
> +	 * is initialized itself.
> +	 */
>   	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;
>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   
> -	if (!sched_list[0]->sched_rq) {
> -		/* Warn drivers not to do this and to fix their DRM
> -		 * calling order.
> +	if (num_sched_list && !sched_list[0]->sched_rq) {
> +		/* Since every entry covered by num_sched_list
> +		 * should be non-NULL and therefore we warn drivers
> +		 * not to do this and to fix their DRM calling order.
>   		 */
>   		pr_warn("%s: called with uninitialized scheduler\n", __func__);
>   	} else if (num_sched_list) {

