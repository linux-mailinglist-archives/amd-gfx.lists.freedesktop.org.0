Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4287BA96
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Mar 2024 10:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37B10E690;
	Thu, 14 Mar 2024 09:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SF1mthWq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442E110E557;
 Thu, 14 Mar 2024 09:38:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dhx1anbzyIJR1k9UqbtFrRlLjJ3zLq15Brwpuw6EclvxKm0ETsiD7h8+WLONrksU0vacOGbRNqRvOCxC1olXIaKCydS4u8FMAyQnZ/TawRbHaJ+o9d8268jilH+4OoHug8M4JsxaNPZkEP+bjvpSS1flVbkvyuQdgs+KZTm9WonPo0NIr7Bqccu1Oy5ADq6ox9QQX8I2Kh4NUtR2jhNmCcF5XHKi9bAh9UWLdzUA10VJCdyLPBC3H4JUVucQermTULNH5E/Wdj+SL6N2kGEIC3HeZESmY2f1n9GwJZ9sVXYCw0OvAH4mrBi1NymebwNJ+ZDYrBYzMrWlAmomhfWFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMzwG0oCwQYXKEsU1tn7WRXVB65gql3DEz7N8EvnEko=;
 b=DlajBjXjMRUEPokyJUHxbe2NdDbE4yHqwDqn0DU8469FKlVFTo/YeV0wGUy1PObShPcLrsN9w6cjeLqCxHpJ2COOPivqw5gXHtzxUo1R+yl+CMQ2J3ZB79Hj3NlUIYg5o+ExUFFUuAvtvuVFcR9K5rcQhUCOcSGA7C/s40j35+tj5SKaRqfYIblfr3UVOnWkjXj/aIbkcITr0DoiR6IuhJLYK0kxI8cUximzvNqq9avcO3krJz4TpQlAbdMSD7ARy6G6om18GtjVEwh+10D0wivHJKujycir7EbTiAid76djYnjqGLhvhLt5hbROK6u5WKUm5h3tzkHUhaUyX4HjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMzwG0oCwQYXKEsU1tn7WRXVB65gql3DEz7N8EvnEko=;
 b=SF1mthWqKdY0CyRR1/IOkm8QWdXbwSNv8L1kPDAn7e+uiwGZpdBX8b4rRjdrmt56IEw/ZXaTYQT543WLbUuSdn3SHVW4clV/AV5AOzXwg4qRe2jyrMpneAfFYyiiO+pFAWs+sl75r3mrYSjU7TK78kVnZdM4GVn/a5OUaA9wCqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9146.namprd12.prod.outlook.com (2603:10b6:610:19c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 09:38:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 09:38:42 +0000
Message-ID: <14f73e27-9d99-4f07-b3cc-352e9ed955ce@amd.com>
Date: Thu, 14 Mar 2024 10:38:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: fix null-ptr-deref in init entity
Content-Language: en-US
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Dokyung Song <dokyungs@yonsei.ac.kr>,
 jisoo.jang@yonsei.ac.kr, yw9865@yonsei.ac.kr
References: <20240313212037.299861-1-vitaly.prosyak@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240313212037.299861-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0198.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 9064b497-a3d5-47f9-e3f1-08dc440a892d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fSzyIfg/HdMSV+hMxJvExMwYez3ms9Y9srsd/BkVlclV8wCPKJf30SHRoIA+zyBKBn0K5BNPu1ID4eoZyLS3YBS/DMj4JnRcv5OmwzsysM/dXVf/gEQwk45z+dvpbkw2ILhjz/LvCCIBkaFGJwVHHOpMgGDJNAvuh1RNEr0t4ssmdIVx5/QjkT/UNVV0UPFCujbMMxD3AiW3G4N1mHAsg/iapQHxlDHZR4uNBwgM5d9ux8/RYTQ0Z5NZnMo9pAeBZ+wiJLwxwNZLQO0NiWnnqM1nmFf0iBBJNidQwFHmzX1vrRKbx7eE02T7ond0qe3ESWXMe0TRQfgcd5G9cF84a/30K92eG7AEXB0f+imLNYnJNHNKgNS3OZDrcDogwaodjlq2vMSrMFmV2djfxVaJdy0GA+hbFRVL3vWjtkqdnmAwd90rkMbYju9/+wAx6G9Z/JaZ/YMa2GUvLqcBAvSBfcCrZCoy3mdq9UTdhoNs69Q//p/+nCSa/7ljKF+3/IJBIrOSx8tbi6xTI8jlwtlG2xvVGY4ZvNzbGzcI5S9lVXrsNqQ4QwyNypQBRu8ADDzDts5OKG6wtj693/UpUhPQs/lyBUR5JqFU8qHYcebBI8nTLFa0s+SiR51Uei5q5C7/9Z1C1nqnUxD0dYyzRC6kc3Pk2kPevy9ytmtQxEui3Mo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R21sUFdTYm1NU1pKTkRVSmhwZmtOMHZpNG9KNTlBNjh1dG81Q1A1YVlUNlVk?=
 =?utf-8?B?ekRyQkhRNzFjQ1J0enNLeXAzUno0am85eGtqU3NKOVp0ZHAwOUhKVUptazZV?=
 =?utf-8?B?a0ZHVEthYnVWOGluV2srbmRsT3pySlR3QTUyRlR4d0RSQU1OVFJpdVRUMUtn?=
 =?utf-8?B?VFAwMEp6QytsUERsUGZoZnk5bi8rcHB5MlhjR3NhRkN2QUdGcFZteTlEUW1y?=
 =?utf-8?B?ZHpUaTdLdC9UWXByR3NYWlFzZk9rLzFURWpmTDhmeWlaeEVySlNWVG8wSGRh?=
 =?utf-8?B?N2VmTUNXV3NDSHFXMERXaTlESG5nU1FwdTlPUXpXRnRpa1lKVUtURDRwYnpP?=
 =?utf-8?B?OGgzZFVneWhTV29wKzZiRHRHRTVVczJVMTAybjM3L2FGZjZxSlpGQXBOb213?=
 =?utf-8?B?QVJYL0grVjh4bERINUpMNjBma09kK09jRUM2TjRxL3ZLR3RzMHZrU2EwY0JS?=
 =?utf-8?B?NUY1TnYvOGUzcGhZejV6RVpmUjhJQ1FyUjA4d0tqNzVlWGdqQlM0RXBKS3Ix?=
 =?utf-8?B?bzhjbjlRY2N0YllYNm14aEhtRzlvSU1KOUFRQzAwN1ZReHR3UytIV2RaSG1t?=
 =?utf-8?B?YUh1YndlMjU1MFJDaXo1UjloY2t1bStsYzVwR0s5N3NKVVcwYjVoNzhnbkF5?=
 =?utf-8?B?K29IdXAva2pSc2xhZGcvZnk1OTE4ekVpMEVyTnNjaHVyaGI3d0M0VDVuSjFv?=
 =?utf-8?B?T0hBNG10ZTFzblY2UGhuc1BqVzBoK2plNHZ1RTAwTmwxdU5MeE1GcVJWY2tW?=
 =?utf-8?B?QnI4a2hydkZFNDRidG52SFhzTnRrckkxaUV0Z3g0aUhCMDUwcFRHaFAxY1dP?=
 =?utf-8?B?R1YyaytIbFNOUmZmeDQ5V2FNTzZpTExCQ0VOVDRXTVhyQlV5VjJFdFk1RUdC?=
 =?utf-8?B?TnVFeGtTM2dGQ0YyU1UwQVpjNlp0U3c2c25jcEc1bk1RMHBsWUVwNWtRVGda?=
 =?utf-8?B?UkNUVG1vQzlpS1UvU1lGalJOL3hJeURJNkxpSHdlTEpuWS9WQVpLdXFYY0NL?=
 =?utf-8?B?S01KREVrNm8rS2RUR1BleVpybDM1eU9LTE1pRS9hNHdWRDZjckxDTDFtdTcy?=
 =?utf-8?B?WXNvWGdmZGFUcnBWcC9QTU9xWkx5NFR3NFptekV5RC85SmJoQlJQQkcveWx6?=
 =?utf-8?B?MjRqVjdsTnYyaCswdkNVNkNFRm9vcXZMZEx4WWFrQlY0MXpnaGw0OWVieTRt?=
 =?utf-8?B?YW9tUzdxSjRXUE1henRFVGxxODdYcjhFY3R5UDcwY0ZyeGNNU21PNWlBWXZT?=
 =?utf-8?B?bzRqcllZWWtCSFNlVHZGTWRCcnRFMklaUlpJbVlndkFPUHVTNC8yQUZWRVdi?=
 =?utf-8?B?NWlwdHRqV0hVUW1mcVRvK1NTVVZVZkgrZWl1cnpaa2kzRFUrOG9VL2xTM1ZJ?=
 =?utf-8?B?NzFEYitrQ1hGU3FudjA4K3ZZbVBaUHpBUEhhTElxelNGRlo3OGVELzB5Ynl0?=
 =?utf-8?B?bzdRSFVSRmd0NDBxVGRvQ2ttOWJhanBnYTN2OVZxYzd1ZnUxZzRTLzNBQTNC?=
 =?utf-8?B?ZXMwMUxtUWdEWUNISUM3VnVOQ2NLT1NmU3Q1UFMzYng0TUpLSVVqMEwyRWN0?=
 =?utf-8?B?dkVWS2NtcHQzRUs3OEJxMm1sK1RYU0FxY04vR3kxRWQyajdjaSs5MXJmTU9Z?=
 =?utf-8?B?Z3llaTdTLzUxb3BtWFhFVzBuYXNrSlErMkY4OVdWZ3FWWXpsakR6d1pqYzRx?=
 =?utf-8?B?LytFZlgrMnROZDI2TE85OXh1OXF3a1NoUmpNaUVqU2dhSWZrbm1nbjF4VWU1?=
 =?utf-8?B?bzYwMTExYS8rbkszRnd0RGdZajFYT2pjMVlCekZiby82UUJqb2YyOUZlTjBa?=
 =?utf-8?B?ODc3UEZjSGl3S2luaU5vMnRuVnhmRTY0bndVZXJxaG9lcmdOaVlXMTR0bWpD?=
 =?utf-8?B?M0RXNWk5MHBBWmRqT0U1YjVKNDlOaTF1dTY2Y3hkcjBRUWtNbEZlQUgrcFI2?=
 =?utf-8?B?cS9NRmp3eldGWDNPTFl2dEZpVnZ3b2thdmVOU0RwdmpLeFpVV2Y1dXdoc1VH?=
 =?utf-8?B?eDRqM09xWk9Ic1libFExYWZHQ2VmUDdrSHZPNkJhQXVpNmpjMUUrRG41Uy9W?=
 =?utf-8?B?S2NwUURVSFdXQy9GN2s5a3VvR3JHTW1jZE5KcnRBM1NKTHQ2TzJ4SFVyc2Rs?=
 =?utf-8?Q?a0CuY61RucjelwVIK2eq15qnP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9064b497-a3d5-47f9-e3f1-08dc440a892d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:38:42.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5SwThQs3frud90cQwt5GoveR6Rkws0MkHqWvDMbVIzu7qWORo7YTwSWfEA11JFX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9146
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

Am 13.03.24 um 22:20 schrieb vitaly.prosyak@amd.com:
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
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
> Cc: Dokyung Song <dokyungs@yonsei.ac.kr>
> Cc: <jisoo.jang@yonsei.ac.kr>
> Cc: <yw9865@yonsei.ac.kr>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>   1 file changed, 18 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 3c4f5a392b06..b5f79feb300a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -75,23 +75,25 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>   	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>   	RB_CLEAR_NODE(&entity->rb_tree_node);
>   
> -	if (!sched_list[0]->sched_rq) {
> -		/* Warn drivers not to do this and to fix their DRM
> -		 * calling order.
> -		 */
> -		pr_warn("%s: called with uninitialized scheduler\n", __func__);
> -	} else if (num_sched_list) {
> -		/* The "priority" of an entity cannot exceed the number of run-queues of a
> -		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
> -		 * the lowest priority available.
> -		 */
> -		if (entity->priority >= sched_list[0]->num_rqs) {
> -			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
> -				entity->priority, sched_list[0]->num_rqs);
> -			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> -						 (s32) DRM_SCHED_PRIORITY_KERNEL);
> +	if (sched_list[0]) {

That check is actually illegal since every entry covered by num_sched 
should be non-NULL.

> +		if (!sched_list[0]->sched_rq) {

That check here is broken. This needs to be num_sched_list && 
!sched_list[0]->sched_rq.

It's perfectly valid to initialize an entity without having a valid 
scheduler attached. It's just not valid to use the scheduler before it 
is initialized itself.

Regards,
Christian.

> +			/* Warn drivers not to do this and to fix their DRM
> +			 * calling order.
> +			 */
> +			pr_warn("%s: called with uninitialized scheduler\n", __func__);
> +		} else if (num_sched_list) {
> +			/* The "priority" of an entity cannot exceed the number of run-queues of a
> +			 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
> +			 * the lowest priority available.
> +			 */
> +			if (entity->priority >= sched_list[0]->num_rqs) {
> +				drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
> +						entity->priority, sched_list[0]->num_rqs);
> +				entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
> +							(s32) DRM_SCHED_PRIORITY_KERNEL);
> +			}
> +			entity->rq = sched_list[0]->sched_rq[entity->priority];
>   		}
> -		entity->rq = sched_list[0]->sched_rq[entity->priority];
>   	}
>   
>   	init_completion(&entity->entity_idle);

