Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957659F06A2
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Dec 2024 09:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D91910EF5E;
	Fri, 13 Dec 2024 08:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dPhWi/uk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8474A10EF5E
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Dec 2024 08:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovR0vKdtBArZpfSsCMrIMi/CO4rO0eZLw5Q15Xo5IA86LYaL/rZwexBZS7mBNo2wPONWxyKLpyWV8WPj59B6izdb9LNeIJeBntJBZ7eQvCuw/v8YVB5DNbEU4OLYJWYYgmQC9iFF13Y8z3JhIkxBOKw4LxOplMTRXmOmjFjgcda7EUxQbGzJDXQrVZPbybsKY3JEttPlRAkR5adido8kBnY2LtcEGSCRN9WuEYjX7QIoJiXwPu1Vbiy4J7++/Ot3GEcZm5nvrqBpADZH7Xq1/1+13mjKgZIObT8hF3A3TDUVHtroXIDgCfartUCRjT6AIxf0ycCJu5j7wh99v9hxKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdAoFBfjlkcSOHDZrXp3yM+/s0Zg6tu6yKvV2SCvW24=;
 b=kdwefNOPYtsl9pEXn4JdRvPHAf3zL0pjUC1Mbc1B8aqruTNx3WLhrR4dPLwKqLSkOdIQA8Qra/GjGCiVZXO5kw9KcZGtdTcfX7El09wJlxpYqR6DFs/cmcKl0p7xBuOhLXMoRnV1TI4HH+Pk7qJFGxFmx3jRjngWeIQTBT4txf+QbLYoFLu6f6Ft9xFkgbMgDYBvfOgo5DVs8INawXmOsCENgOoq2/xiHk70ZEF8rjuShKkqqyhbJ2C9VQHy3YN8TbSrQKvJ9HaRV4URgtxwCabu7t9jzsux17sMyyzab3sBd41ZlbkNLvSL8yscqpe1bj4kryXKOa0TmVP+NO8GlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdAoFBfjlkcSOHDZrXp3yM+/s0Zg6tu6yKvV2SCvW24=;
 b=dPhWi/uk91VFSCPLL3ha5vuHgBiiLA4o6kwsUlijOytDVTODTXvp10m15kU2ReTJYk5O04Yivr+yRbP2okOpStFJwz0yNNQ8vl81tnCVNTRHxpl/9bo7EozFEE8jxtlHsHrs7vMqFq9vzYYg0+YeLhoq867W0vrTqRV9paSfUFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 08:43:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 08:43:08 +0000
Message-ID: <868538e7-fb2f-4f75-8a7c-a995a733e8b0@amd.com>
Date: Fri, 13 Dec 2024 09:43:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/5] drm/amdgpu: track bo memory stats at runtime
To: Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 tvrtko.ursulin@igalia.com
Cc: Alexander.Deucher@amd.com
References: <20241212155206.5030-1-Yunxiang.Li@amd.com>
 <20241212155206.5030-6-Yunxiang.Li@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241212155206.5030-6-Yunxiang.Li@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ea0d20-c724-46c2-685e-08dd1b522b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Mmp0UWpEUXBubUNFNXhCM3pMN3JBTXB1MVRoY3lqb0N2TnhYRTFEVWJKVEMy?=
 =?utf-8?B?WmhiNXQ0dzlpakFUMVNDTmZlbVN3TjFhUjdwdm84ZlpYaGNQSnRVQ3JvK3Bl?=
 =?utf-8?B?ZjRrL1oyZnl5T3dJUGlOdklUU1A4OEhKVkUwL3hhbEJ4T1ppUUJ5V3YvZFg3?=
 =?utf-8?B?cVZvWXRDNnRxSzRpM3ZkMmY4WGxVNnlROVU5VnpFVnJJbmZ5T1JZZ1hnRnQv?=
 =?utf-8?B?b0VwRkExbnkzYm9YL2RYS2pzNUN5RURPTFllNGJKRWFoL212NEpDN1MxRm5H?=
 =?utf-8?B?UEZWeGNvbDJKaU9nbEZ5L1VCMFllbnRDbGlzOTVJUnd6aWtCZU1rZkg1MGxY?=
 =?utf-8?B?RitvVWorYzlWaGx6aG1ROHA5b0dtb2dGV1FrVFZEcVRJVTcvZytUc2JuQmJM?=
 =?utf-8?B?bktGOFc0cWdxVEdxV1pnTno0S1BnaUNZV0ZJcWFha2d1WXhPRkJKVmd2blhw?=
 =?utf-8?B?ZFBPYjE3Qnp3R3hMOVVSOVFkTHBFUUxWTjQ5K2J5VnpiODRUOXl1bE9IeGl0?=
 =?utf-8?B?YUFTNkkvbnZYS25LWmQrdTYvUFlMNHFxZ0YvMDBxS1VGalZrb1BOMFdDYVhn?=
 =?utf-8?B?RFJYdjNFZXd6VzBsZExtcjl4dUJUNWt3bDYrWkhTcDJINVNmMlBOSkY4TFRY?=
 =?utf-8?B?bklZS0t6K2JqYUlQaytDRDRYMi94bEJQT1hNcTduQ0J4L0RhdzV5Rm91WUJs?=
 =?utf-8?B?UlJXYVZpLzBkNzM3ZXlQK2xmMWtKRU5nNHVDMXJ6M3pNSzgzUCtJU1NJR2pF?=
 =?utf-8?B?SHRZYlh5Q2VObDNnQ2IzdThpYjJlZUFIU3JObkp4Y244WGJMRGNML1g0NURE?=
 =?utf-8?B?NExkSXZpYnJydVRCVkllSFpUQlFCT3FaaVNxR0h1NlJpUU5zWUY2Qmt6emxC?=
 =?utf-8?B?V0pJb2dFdFNZUWl4aTV1Rm9MWVhwa3dSTjFYb1NNdFRMbEI2SGU1bTk0R2Jn?=
 =?utf-8?B?cDF0R1ZpOEpYWUUwRm1RQkpWVGwvMFo3NS9TSUs1ank0RXd0Z3ZLSTNlOU1T?=
 =?utf-8?B?RmR3ejFUR3FxQ3I4Nm56ZzQ1akYvVi9DSUdzTnFHMUZSZDQwT1FDZXFrV3Ri?=
 =?utf-8?B?RERRRGNHcjNDSExaWGIyS00va21lNkh1eUYreW05ekQvckxsWFhFQTdWZW8y?=
 =?utf-8?B?MWFHbUsyR1hLS2NCbXpLYUVEQTFNbTlRNVVJeWRqRm5uMVpsZTRmN25qc3Z5?=
 =?utf-8?B?UWRJRWtXSHhtc3BkUmtMRFMrcWk3RkphMnlRZ1h3SHFNUnFxdlY4VDN3cEh4?=
 =?utf-8?B?ZFNjQlNOSEtqdWV6aXFib2xCUjZLZXZ6UStjdEI4VEIxTjJLOUV1N2IvS1FZ?=
 =?utf-8?B?VFcvUnpUM3UwU0wzK21CSGhOeWd2ODFpTnVSckRoV1h1MUdYNklFT2JjK1I3?=
 =?utf-8?B?UjAwU3lHUm1aNTI0WkRPb2Z5U2gwTkwyOXlHWDA3MkIwUy95K2RiZ0xMeWRz?=
 =?utf-8?B?cEVRUURBTEFhMzdXSjFxQkI4ZTNrTzFRd0tkSjlvTVdad1Vwd3FZTVU1ZUxI?=
 =?utf-8?B?UUR2ZFU0UWJGclhGUUlaMmhWb0EwbXZ0S2t6N0VoVnlrY2tCVDdkQi9jU1FJ?=
 =?utf-8?B?dVB4UGFNN0YvcmpZTmI0UU4rMTUyemduWlBpeVBMV3F6S1NuR3ZSNFhjb3Rm?=
 =?utf-8?B?ZVE3K3JzS0hEZTRDbmN4eXAvTmxMRXhpMGh0ZEZTM2JCaXhIOFhQbEdKM0Qw?=
 =?utf-8?B?WkQ0TTRUR25OQnhEdHpyamIxU2NoWGNycUl3am9NV3N5WThtWEFqRkYrZ3Jx?=
 =?utf-8?B?WDV0MjVxSjhncWxDWlZpUWhKdlY1ZUxXMkN2SVFralF4ZUlOR09nSTJhNmJ5?=
 =?utf-8?B?aHcrRHpCbXhUdHBSM0ZWdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVMrSll3bU14eW1jUmlDaGN5SlV4OE1BdHhVVG5qWFd4SFFKUTJVOUsyS1Jr?=
 =?utf-8?B?ZEZIMk5wRFBiblBXTzdFSmVXUTd6VFJwSElUR2pUQmVacDltRU9ra2Q3RXB6?=
 =?utf-8?B?SFRiam9FcjRhVFRzQms0alhZQWd4NHRwbCttRGh6ZFJ4TVhFNEhVNnVFc0Vh?=
 =?utf-8?B?dmE1SnpOLzVNQjV1cXFsazdlREdoU1BmWVVqVmRLZG40ZmhjZThadkJpQXlq?=
 =?utf-8?B?Ym5aRE9xRFZTSnRWdm1od3MrcFJRUmg1VVY0QjZlb0Evb3JRTVJlNU45L2lB?=
 =?utf-8?B?RlhYUkdUU0hEYlptL2YrWjNSdXFFaUQyVC9WM2xuZ0VhZ1ZXdHpRM2dzTXJ2?=
 =?utf-8?B?ZUp6dHFMUDdYQjhySnh6MHE4U29OVkhZczZxSVZ3ZFJlTFhNYkNHVlJEQzd5?=
 =?utf-8?B?L2t6WTM3ZkdHdXA1ZW0rbUNhZTdzQldockFVS1dSUFBkL21xc1lXZDVnSE9n?=
 =?utf-8?B?cjVySk10ZnVQYjFMdTc3cDJUaUpxRGtKT2NMMXFEV012VDlSU2JRTUpYcElz?=
 =?utf-8?B?OE9aL25XZis5VjRNNE5PRnlsTWVmeEpWc0hXcTlTaUk4cnNlVS9OTGRZeEN1?=
 =?utf-8?B?bzQ0MDdXQThsSDIranhDUHRDN09TVmc4QXJ4YnEvR05qTkRpUlAzVWxJQWpT?=
 =?utf-8?B?NWNPWGNMUlo0Ny82cnpaNFlVaVVodFZTb0VpNlpWcFFZL0RDMjZaQVRMcDla?=
 =?utf-8?B?TjY2RkpxQmNFVXpFL1FhRjhWV2ppeFdSblcxYzJzby9yd21wazN3cURqNmMy?=
 =?utf-8?B?UWtKK0VSeG04Y3JFbFNYbjJYaHMwVkRlSEp2UklsaFZnVnVTLzVIQkhDQVMr?=
 =?utf-8?B?ZkZQMjVpQWlkcUJQZXZuVk5xcUdySVJIN2w0YnV5Z1gyTkVWbnhlT2hBZzdK?=
 =?utf-8?B?dFZUeDhyMytJNXpHdjQwL1dqQ3RWUVpFKzMvOG5XZjh4WHhVTjR5K3Q5KzRr?=
 =?utf-8?B?VmlXMUsvOXNJekZGVXhqaDUya2JDdVJCWFVmMitCaG1CdkNuVm5qcXJTZ1JL?=
 =?utf-8?B?Tm1kMW0vbUNzeHhPby9NKzhQdzNNazhka2lrWEl1MTRkUjA3aGR3Mm05TnFY?=
 =?utf-8?B?aXdtNDNxWndxY3NsbC9sS05pQlYrRlRvaXAyYTlSa1V1WEsyRnVpTmFtY3Nm?=
 =?utf-8?B?TjF2cmU0MmhvaDgwZm9NeEJhNG5CWG54MkFZQ1B6UUV5ZTJHaWloQU9nNnVw?=
 =?utf-8?B?NS9XTEVaYVlqQ0o5bEpqMzB4MVFCV3BNZzBYZ1lMVThNOHZRTkxkWElUdGZy?=
 =?utf-8?B?d0QzYzhoQ0p2L2ZUNlJ5K3FJUzBJQ0syUmpJNS9TekhEYWRQRE1GUy9RS1FM?=
 =?utf-8?B?WXoxOU5Pb3ltdG5Ha1ltd2JrcXl6UkdMR2x0SFJaSmhQWHJ6TElxRGxJTkwy?=
 =?utf-8?B?UEZXT1VLVXJ4bTJWc2JyNG9zbGNHS1ZIZjNyMXY4THFidXFaek44Z3hVZ3NC?=
 =?utf-8?B?YVdDN1MwcUtIQ3VXZ0did2FWS3N3WmRnb0R6L3ZHUUw3eUkyY0M2cmthM2FM?=
 =?utf-8?B?SDBCRnpvVkZvNkx0Qm16S2tySWdPMkVXUGhuRUM5cGNmMWpvU2NZZHl4T2k1?=
 =?utf-8?B?djlwV2FkWThhcFpEMkNpVkVyaVl5emNaMktCNGNrdlBTaXlCTFdKZkNKV0ZG?=
 =?utf-8?B?QkZvWjJhbkNBK0VJTkc2RkRUWHJORjNmaFU1MHZsS21rUk1RcVpZaWpLTzg4?=
 =?utf-8?B?dHo0c3dKeHNxSHBuVFRJU0R5REwyTVppdDg5VmhYQ2syMmJKa1ltSDgrWm9o?=
 =?utf-8?B?b1ZzOXRaYkMyakFMZHc5V041TDNlc09YQ3dET0FvNjFFOFZIdi9HamsyS3kv?=
 =?utf-8?B?cHRpankrdTJ2RlFjdkVaY3ZvcVRTZTV2ais3YURmOVphN0dCZDJwRXRPYmJB?=
 =?utf-8?B?aXZZeTVmOW1DZVFDSEhqSWJycUQ2VUxDSjEyeEwzb0lCTC9QeUJxVGh2MVky?=
 =?utf-8?B?YS9TRGswVldYVTg3U3lKazJJbEFvWGZTd2lpS0grelZPNGNTRVNxYVJxWmJq?=
 =?utf-8?B?NkZhMFFDcEdyODA2SEs0ZkpiMFdoeC9Qa2k3NlhVSlh5QlYvTHJvSVZ5UUJq?=
 =?utf-8?B?dlZZNi9oQ1F1VURCUDZHZ3FlT25XaFJQN2Zqd0RhUW1LNWk5S0lKVWRnMmNE?=
 =?utf-8?Q?Elr5qVXu18GChWdvB8GEuIEID?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ea0d20-c724-46c2-685e-08dd1b522b33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 08:43:08.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wrb9LQP/GABL+etq11IOnJRBdZddPVHJqZ3eww5lhVQN32eOVEhYy89zGYhf10mx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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

Am 12.12.24 um 16:52 schrieb Yunxiang Li:
> Before, every time fdinfo is queried we try to lock all the BOs in the
> VM and calculate memory usage from scratch. This works okay if the
> fdinfo is rarely read and the VMs don't have a ton of BOs. If either of
> these conditions is not true, we get a massive performance hit.
>
> In this new revision, we track the BOs as they change states. This way
> when the fdinfo is queried we only need to take the status lock and copy
> out the usage stats with minimal impact to the runtime performance. With
> this new approach however, we would no longer be able to track active
> buffers.
>
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

That is really close, but one thing is now not handled any more :)

DMA-buf doesn't create additional GEM handles for a BO when they are 
imported into V4L for example.

I think just calling amdgpu_vm_bo_update_shared() in 
amdgpu_dma_buf_attach() should be enough to handle that case.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c |  18 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |   3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 110 ++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |   4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |   4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 204 ++++++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     |  23 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c  |   1 +
>   8 files changed, 228 insertions(+), 139 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> index 7717e3e4f05b5..91d638098889d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
> @@ -60,7 +60,7 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	struct amdgpu_fpriv *fpriv = file->driver_priv;
>   	struct amdgpu_vm *vm = &fpriv->vm;
>   
> -	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_NUM];
>   	ktime_t usage[AMDGPU_HW_IP_NUM];
>   	const char *pl_name[] = {
>   		[TTM_PL_VRAM] = "vram",
> @@ -72,15 +72,8 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   		[AMDGPU_PL_DOORBELL] = "doorbell",
>   	};
>   	unsigned int hw_ip, i;
> -	int ret;
> -
> -	ret = amdgpu_bo_reserve(vm->root.bo, false);
> -	if (ret)
> -		return;
> -
> -	amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
> -	amdgpu_bo_unreserve(vm->root.bo);
>   
> +	amdgpu_vm_get_memory(vm, stats);
>   	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
>   
>   	/*
> @@ -97,7 +90,6 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   
>   		drm_print_memory_stats(p,
>   				       &stats[i].drm,
> -				       DRM_GEM_OBJECT_ACTIVE |
>   				       DRM_GEM_OBJECT_RESIDENT |
>   				       DRM_GEM_OBJECT_PURGEABLE,
>   				       pl_name[i]);
> @@ -115,9 +107,11 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>   	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
>   		   stats[TTM_PL_VRAM].evicted/1024UL);
>   	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
> -		   stats[TTM_PL_VRAM].requested/1024UL);
> +		   (stats[TTM_PL_VRAM].drm.shared +
> +		    stats[TTM_PL_VRAM].drm.private) / 1024UL);
>   	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
> -		   stats[TTM_PL_TT].requested/1024UL);
> +		   (stats[TTM_PL_TT].drm.shared +
> +		    stats[TTM_PL_TT].drm.private) / 1024UL);
>   
>   	for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>   		if (!usage[hw_ip])
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index fe7ae45500639..9f1382ff9d813 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -43,6 +43,7 @@
>   #include "amdgpu_dma_buf.h"
>   #include "amdgpu_hmm.h"
>   #include "amdgpu_xgmi.h"
> +#include "amdgpu_vm.h"
>   
>   static int
>   amdgpu_gem_add_input_fence(struct drm_file *filp,
> @@ -288,6 +289,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>   	if (r)
>   		return r;
>   
> +	amdgpu_vm_bo_update_shared(abo);
>   	bo_va = amdgpu_vm_bo_find(vm, abo);
>   	if (!bo_va)
>   		bo_va = amdgpu_vm_bo_add(adev, vm, abo);
> @@ -362,6 +364,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>   		goto out_unlock;
>   
>   	amdgpu_vm_bo_del(adev, bo_va);
> +	amdgpu_vm_bo_update_shared(bo);
>   	if (!amdgpu_vm_ready(vm))
>   		goto out_unlock;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 951b20e40fd35..96f4b8904e9a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1258,7 +1258,7 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   		return;
>   
>   	abo = ttm_to_amdgpu_bo(bo);
> -	amdgpu_vm_bo_invalidate(abo, evict);
> +	amdgpu_vm_bo_move(abo, new_mem, evict);
>   
>   	amdgpu_bo_kunmap(abo);
>   
> @@ -1271,75 +1271,6 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
>   			     old_mem ? old_mem->mem_type : -1);
>   }
>   
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int sz)
> -{
> -	const unsigned int domain_to_pl[] = {
> -		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]	    = TTM_PL_SYSTEM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]	    = TTM_PL_TT,
> -		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]	    = TTM_PL_VRAM,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]	    = AMDGPU_PL_GDS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]	    = AMDGPU_PL_GWS,
> -		[ilog2(AMDGPU_GEM_DOMAIN_OA)]	    = AMDGPU_PL_OA,
> -		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
> -	};
> -	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> -	struct ttm_resource *res = bo->tbo.resource;
> -	struct drm_gem_object *obj = &bo->tbo.base;
> -	uint64_t size = amdgpu_bo_size(bo);
> -	unsigned int type;
> -
> -	if (!res) {
> -		/*
> -		 * If no backing store use one of the preferred domain for basic
> -		 * stats. We take the MSB since that should give a reasonable
> -		 * view.
> -		 */
> -		BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
> -			     TTM_PL_VRAM < TTM_PL_SYSTEM);
> -		type = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
> -		if (!type)
> -			return;
> -		type--;
> -		if (drm_WARN_ON_ONCE(&adev->ddev,
> -				     type >= ARRAY_SIZE(domain_to_pl)))
> -			return;
> -		type = domain_to_pl[type];
> -	} else {
> -		type = res->mem_type;
> -	}
> -
> -	if (drm_WARN_ON_ONCE(&adev->ddev, type >= sz))
> -		return;
> -
> -	/* DRM stats common fields: */
> -
> -	if (drm_gem_object_is_shared_for_memory_stats(obj))
> -		stats[type].drm.shared += size;
> -	else
> -		stats[type].drm.private += size;
> -
> -	if (res) {
> -		stats[type].drm.resident += size;
> -
> -		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP))
> -			stats[type].drm.active += size;
> -		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> -			stats[type].drm.purgeable += size;
> -	}
> -
> -	/* amdgpu specific stats: */
> -
> -	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
> -		stats[TTM_PL_VRAM].requested += size;
> -		if (type != TTM_PL_VRAM)
> -			stats[TTM_PL_VRAM].evicted += size;
> -	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
> -		stats[TTM_PL_TT].requested += size;
> -	}
> -}
> -
>   /**
>    * amdgpu_bo_release_notify - notification about a BO being released
>    * @bo: pointer to a buffer object
> @@ -1554,6 +1485,45 @@ u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
>   	return amdgpu_gmc_sign_extend(offset);
>   }
>   
> +/**
> + * amdgpu_bo_mem_stats_placement - bo placement for memory accounting
> + * @bo:	the buffer object we should look at
> + *
> + * BO can have multiple preferred placements, to avoid double counting we want
> + * to file it under a single placement for memory stats.
> + * Luckily, if we take the highest set bit in preferred_domains the result is
> + * quite sensible.
> + *
> + * Returns:
> + * Which of the placements should the BO be accounted under.
> + */
> +uint32_t amdgpu_bo_mem_stats_placement(struct amdgpu_bo *bo)
> +{
> +	uint32_t domain = bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK;
> +
> +	if (!domain)
> +		return TTM_PL_SYSTEM;
> +
> +	switch (rounddown_pow_of_two(domain)) {
> +	case AMDGPU_GEM_DOMAIN_CPU:
> +		return TTM_PL_SYSTEM;
> +	case AMDGPU_GEM_DOMAIN_GTT:
> +		return TTM_PL_TT;
> +	case AMDGPU_GEM_DOMAIN_VRAM:
> +		return TTM_PL_VRAM;
> +	case AMDGPU_GEM_DOMAIN_GDS:
> +		return AMDGPU_PL_GDS;
> +	case AMDGPU_GEM_DOMAIN_GWS:
> +		return AMDGPU_PL_GWS;
> +	case AMDGPU_GEM_DOMAIN_OA:
> +		return AMDGPU_PL_OA;
> +	case AMDGPU_GEM_DOMAIN_DOORBELL:
> +		return AMDGPU_PL_DOORBELL;
> +	default:
> +		return TTM_PL_SYSTEM;
> +	}
> +}
> +
>   /**
>    * amdgpu_bo_get_preferred_domain - get preferred domain
>    * @adev: amdgpu device object
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> index ce3314152d20f..bdc9a5bc4da46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -305,9 +305,7 @@ int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
>   int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
>   u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
> -void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
> +uint32_t amdgpu_bo_mem_stats_placement(struct amdgpu_bo *bo);
>   uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
>   					    uint32_t domain);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 2852a6064c9ac..461fb8090ae04 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,15 +26,15 @@
>   
>   #include <linux/dma-direction.h>
>   #include <drm/gpu_scheduler.h>
> +#include <drm/ttm/ttm_placement.h>
>   #include "amdgpu_vram_mgr.h"
> -#include "amdgpu.h"
>   
>   #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
>   #define AMDGPU_PL_GWS		(TTM_PL_PRIV + 1)
>   #define AMDGPU_PL_OA		(TTM_PL_PRIV + 2)
>   #define AMDGPU_PL_PREEMPT	(TTM_PL_PRIV + 3)
>   #define AMDGPU_PL_DOORBELL	(TTM_PL_PRIV + 4)
> -#define __AMDGPU_PL_LAST	(TTM_PL_PRIV + 4)
> +#define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 5)
>   
>   #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
>   #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 88173bd1f9a2c..48086ba82e53a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -36,6 +36,7 @@
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/drm_exec.h>
>   #include "amdgpu.h"
> +#include "amdgpu_vm.h"
>   #include "amdgpu_trace.h"
>   #include "amdgpu_amdkfd.h"
>   #include "amdgpu_gmc.h"
> @@ -310,6 +311,111 @@ static void amdgpu_vm_bo_reset_state_machine(struct amdgpu_vm *vm)
>   	spin_unlock(&vm->status_lock);
>   }
>   
> +/**
> + * amdgpu_vm_update_shared - helper to update shared memory stat
> + * @base: base structure for tracking BO usage in a VM
> + *
> + * Takes the vm status_lock and updates the shared memory stat. If the basic
> + * stat changed (e.g. buffer was moved) amdgpu_vm_update_stats need to be called
> + * as well.
> + */
> +static void amdgpu_vm_update_shared(struct amdgpu_vm_bo_base *base)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	uint64_t size = amdgpu_bo_size(bo);
> +	uint32_t bo_memtype = amdgpu_bo_mem_stats_placement(bo);
> +	bool shared;
> +
> +	spin_lock(&vm->status_lock);
> +	shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);
> +	if (base->shared != shared) {
> +		base->shared = shared;
> +		if (shared) {
> +			vm->stats[bo_memtype].drm.shared += size;
> +			vm->stats[bo_memtype].drm.private -= size;
> +		} else {
> +			vm->stats[bo_memtype].drm.shared -= size;
> +			vm->stats[bo_memtype].drm.private += size;
> +		}
> +	}
> +	spin_unlock(&vm->status_lock);
> +}
> +
> +/**
> + * amdgpu_vm_bo_update_shared - callback when bo gets shared/unshared
> + * @bo: amdgpu buffer object
> + *
> + * Update the per VM stats for all the vm if needed from private to shared or
> + * vice versa.
> + */
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo)
> +{
> +	struct amdgpu_vm_bo_base *base;
> +
> +	for (base = bo->vm_bo; base; base = base->next)
> +		amdgpu_vm_update_shared(base);
> +}
> +
> +/**
> + * amdgpu_vm_update_stats_locked - helper to update normal memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @res:  the ttm_resource to use for the purpose of accounting, may or may not
> + *        be bo->tbo.resource
> + * @sign: if we should add (+1) or subtract (-1) from the stat
> + *
> + * Caller need to have the vm status_lock held. Useful for when multiple update
> + * need to happen at the same time.
> + */
> +static void amdgpu_vm_update_stats_locked(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *res, int sign)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +	struct amdgpu_bo *bo = base->bo;
> +	int64_t size = sign * amdgpu_bo_size(bo);
> +	uint32_t bo_memtype = amdgpu_bo_mem_stats_placement(bo);
> +
> +	/* For drm-total- and drm-shared-, BO are accounted by their preferred
> +	 * placement, see also amdgpu_bo_mem_stats_placement.
> +	 */
> +	if (base->shared)
> +		vm->stats[bo_memtype].drm.shared += size;
> +	else
> +		vm->stats[bo_memtype].drm.private += size;
> +
> +	if (res && res->mem_type < __AMDGPU_PL_NUM) {
> +		uint32_t res_memtype = res->mem_type;
> +
> +		vm->stats[res_memtype].drm.resident += size;
> +		/* BO only count as purgeable if it is resident,
> +		 * since otherwise there's nothing to purge.
> +		 */
> +		if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
> +			vm->stats[res_memtype].drm.purgeable += size;
> +		if (!(bo->preferred_domains & amdgpu_mem_type_to_domain(res_memtype)))
> +			vm->stats[bo_memtype].evicted += size;
> +	}
> +}
> +
> +/**
> + * amdgpu_vm_update_stats - helper to update normal memory stat
> + * @base: base structure for tracking BO usage in a VM
> + * @res:  the ttm_resource to use for the purpose of accounting, may or may not
> + *        be bo->tbo.resource
> + * @sign: if we should add (+1) or subtract (-1) from the stat
> + *
> + * Updates the basic memory stat when bo is added/deleted/moved.
> + */
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *res, int sign)
> +{
> +	struct amdgpu_vm *vm = base->vm;
> +
> +	spin_lock(&vm->status_lock);
> +	amdgpu_vm_update_stats_locked(base, res, sign);
> +	spin_unlock(&vm->status_lock);
> +}
> +
>   /**
>    * amdgpu_vm_bo_base_init - Adds bo to the list of bos associated with the vm
>    *
> @@ -333,6 +439,11 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   	base->next = bo->vm_bo;
>   	bo->vm_bo = base;
>   
> +	spin_lock(&vm->status_lock);
> +	base->shared = drm_gem_object_is_shared_for_memory_stats(&bo->tbo.base);
> +	amdgpu_vm_update_stats_locked(base, bo->tbo.resource, +1);
> +	spin_unlock(&vm->status_lock);
> +
>   	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
>   		return;
>   
> @@ -1083,53 +1194,11 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	return r;
>   }
>   
> -static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
> -				    struct amdgpu_mem_stats *stats,
> -				    unsigned int size)
> -{
> -	struct amdgpu_vm *vm = bo_va->base.vm;
> -	struct amdgpu_bo *bo = bo_va->base.bo;
> -
> -	if (!bo)
> -		return;
> -
> -	/*
> -	 * For now ignore BOs which are currently locked and potentially
> -	 * changing their location.
> -	 */
> -	if (!amdgpu_vm_is_bo_always_valid(vm, bo) &&
> -	    !dma_resv_trylock(bo->tbo.base.resv))
> -		return;
> -
> -	amdgpu_bo_get_memory(bo, stats, size);
> -	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
> -		dma_resv_unlock(bo->tbo.base.resv);
> -}
> -
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size)
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_NUM])
>   {
> -	struct amdgpu_bo_va *bo_va, *tmp;
> -
>   	spin_lock(&vm->status_lock);
> -	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> -
> -	list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
> -		amdgpu_vm_bo_get_memory(bo_va, stats, size);
> +	memcpy(stats, vm->stats, sizeof(*stats) * __AMDGPU_PL_NUM);
>   	spin_unlock(&vm->status_lock);
>   }
>   
> @@ -2076,6 +2145,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   			if (*base != &bo_va->base)
>   				continue;
>   
> +			amdgpu_vm_update_stats(*base, bo->tbo.resource, -1);
>   			*base = bo_va->base.next;
>   			break;
>   		}
> @@ -2174,6 +2244,32 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted)
>   	}
>   }
>   
> +/**
> + * amdgpu_vm_bo_move - handle BO move
> + *
> + * @bo: amdgpu buffer object
> + * @new_mem: the new placement of the BO move
> + * @evicted: is the BO evicted
> + *
> + * Update the memory stats for the new placement and mark @bo as invalid.
> + */
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted)
> +{
> +	struct amdgpu_vm_bo_base *bo_base;
> +
> +	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
> +		struct amdgpu_vm *vm = bo_base->vm;
> +
> +		spin_lock(&vm->status_lock);
> +		amdgpu_vm_update_stats_locked(bo_base, bo->tbo.resource, -1);
> +		amdgpu_vm_update_stats_locked(bo_base, new_mem, +1);
> +		spin_unlock(&vm->status_lock);
> +	}
> +
> +	amdgpu_vm_bo_invalidate(bo, evicted);
> +}
> +
>   /**
>    * amdgpu_vm_get_block_size - calculate VM page table size as power of two
>    *
> @@ -2590,6 +2686,16 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   	vm->is_compute_context = false;
>   }
>   
> +static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
> +{
> +	for (int i = 0; i < __AMDGPU_PL_NUM; ++i) {
> +		if (!(drm_memory_stats_is_zero(&vm->stats[i].drm) &&
> +		      vm->stats[i].evicted == 0))
> +			return false;
> +	}
> +	return true;
> +}
> +
>   /**
>    * amdgpu_vm_fini - tear down a vm instance
>    *
> @@ -2613,7 +2719,6 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   
>   	root = amdgpu_bo_ref(vm->root.bo);
>   	amdgpu_bo_reserve(root, true);
> -	amdgpu_vm_put_task_info(vm->task_info);
>   	amdgpu_vm_set_pasid(adev, vm, 0);
>   	dma_fence_wait(vm->last_unlocked, false);
>   	dma_fence_put(vm->last_unlocked);
> @@ -2661,6 +2766,15 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   		}
>   	}
>   
> +	if (!amdgpu_vm_stats_is_zero(vm)) {
> +		struct amdgpu_task_info *ti = vm->task_info;
> +
> +		dev_warn(adev->dev,
> +			 "VM memory stats for proc %s(%d) task %s(%d) is non-zero when fini\n",
> +			 ti->process_name, ti->pid, ti->task_name, ti->tgid);
> +	}
> +
> +	amdgpu_vm_put_task_info(vm->task_info);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 6a1b344e15e1b..e742281b1ff7f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -35,6 +35,7 @@
>   #include "amdgpu_sync.h"
>   #include "amdgpu_ring.h"
>   #include "amdgpu_ids.h"
> +#include "amdgpu_ttm.h"
>   
>   struct drm_exec;
>   
> @@ -202,9 +203,13 @@ struct amdgpu_vm_bo_base {
>   	/* protected by bo being reserved */
>   	struct amdgpu_vm_bo_base	*next;
>   
> -	/* protected by spinlock */
> +	/* protected by vm status_lock */
>   	struct list_head		vm_status;
>   
> +	/* if the bo is counted as shared in mem stats
> +	 * protected by vm status_lock */
> +	bool				shared;
> +
>   	/* protected by the BO being reserved */
>   	bool				moved;
>   };
> @@ -324,10 +329,7 @@ struct amdgpu_vm_fault_info {
>   struct amdgpu_mem_stats {
>   	struct drm_memory_stats drm;
>   
> -	/* buffers that requested this placement */
> -	uint64_t requested;
> -	/* buffers that requested this placement
> -	 * but are currently evicted */
> +	/* buffers that requested this placement but are currently evicted */
>   	uint64_t evicted;
>   };
>   
> @@ -345,6 +347,9 @@ struct amdgpu_vm {
>   	/* Lock to protect vm_bo add/del/move on all lists of vm */
>   	spinlock_t		status_lock;
>   
> +	/* Memory statistics for this vm, protected by status_lock */
> +	struct amdgpu_mem_stats stats[__AMDGPU_PL_NUM];
> +
>   	/* Per-VM and PT BOs who needs a validation */
>   	struct list_head	evicted;
>   
> @@ -525,6 +530,11 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>   			bool clear);
>   bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>   void amdgpu_vm_bo_invalidate(struct amdgpu_bo *bo, bool evicted);
> +void amdgpu_vm_update_stats(struct amdgpu_vm_bo_base *base,
> +			    struct ttm_resource *new_res, int sign);
> +void amdgpu_vm_bo_update_shared(struct amdgpu_bo *bo);
> +void amdgpu_vm_bo_move(struct amdgpu_bo *bo, struct ttm_resource *new_mem,
> +		       bool evicted);
>   uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr);
>   struct amdgpu_bo_va *amdgpu_vm_bo_find(struct amdgpu_vm *vm,
>   				       struct amdgpu_bo *bo);
> @@ -575,8 +585,7 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
>   void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
> -			  struct amdgpu_mem_stats *stats,
> -			  unsigned int size);
> +			  struct amdgpu_mem_stats stats[__AMDGPU_PL_NUM]);
>   
>   int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		       struct amdgpu_bo_vm *vmbo, bool immediate);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index f78a0434a48fa..b0bf216821152 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -537,6 +537,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>   	if (!entry->bo)
>   		return;
>   
> +	amdgpu_vm_update_stats(entry, entry->bo->tbo.resource, -1);
>   	entry->bo->vm_bo = NULL;
>   	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
>   

