Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A050A60BB9E
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Oct 2022 23:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F2810E097;
	Mon, 24 Oct 2022 21:07:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77BC10E097
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Oct 2022 21:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkBCYNcBp+NQ+664ffluPJzqRVv6HLQVtxC9f1dDPP0uX+XkI8BvIFxJOWlGk3304v0qQZ8T3GpudvWfMnsIHI1OslLQG8PI9C5TuqvsO5lc6CX5/jkjgUia7Kuas0hoYnwsTr0+UUu3rTZMm4/Fj/yABFdAyFPM5NiZtP8pqWtZW9r64G9gaE60FVmTAK/a1kATwEc0WyfCKpstkK4GOp+KW4wu9bQUktvj4uTw+9z8NEtPZc7iang8NhS6oJn+ZYhIHns0rtIEYMX7Rk5BDV0KT5ZFxL6C8kBkWZW1tXK6S0M9btha7by4eilCaXEQZVr+T0LaKTqE/c9vNimp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dALn0YQ8EgywaJXJjYNfVGA3408xmnBkwllQ+JmkzwI=;
 b=a3sDzfF3+NmYNzzOziV1tuWTTdn+vRc7tjRPogDweEio7qYmbzAj4h28JbP3RVabUPogruGk9IlLKCvaZMlM6URsrVJtdlaXK+qLXWr+jkuh5+sLSo9Fs5yVALAopREkoUlunwMkQyy0vPTpSXb49GUVzBu6Ov9kNwk4E/czmotLhheagY5vQL78u+jFQ9TPwRmklst7VUUWh19GySMJQdqPxEDdOcvXrdH8ICmhn4/yAjHWmfSiMCHzpKwipRIqcX30nXsHFEl68o2RaOncA1XOs7lmr2LpQam2va5HLnUcFlOpdMPtazwXMOoNxOwUGb8k7J+QRKHM9zM1EbpdJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dALn0YQ8EgywaJXJjYNfVGA3408xmnBkwllQ+JmkzwI=;
 b=rcJmAsI50NnKWcQ01HFxcfJKvdO9Yxv+BRmCfpq104ZAEzSK+F/zmgETZI8pH2pMFNx0CKcFMH7hyeaPNVsUXDToqy2MC4KwiUu/fOz+EP86Si+PJq6nM+iw2eM0NN49MnfbtuE9KzLL/RNeJWReCn+TNMg2/EUBMfgAlU8A7wQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5275.namprd12.prod.outlook.com (2603:10b6:408:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 21:06:55 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7e91:f457:9ec5:33be%6]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 21:06:55 +0000
Message-ID: <bda0c7ec-8bd4-2829-fae3-fed6562f0670@amd.com>
Date: Mon, 24 Oct 2022 17:06:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] drm/amdkfd: Fix the warning of
 array-index-out-of-bounds
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
References: <20221024112639.3440664-1-Jun.Ma2@amd.com>
 <20221024112639.3440664-2-Jun.Ma2@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221024112639.3440664-2-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:610:4f::37) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BN9PR12MB5275:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eba2b0c-a8b8-40c5-50ba-08dab603ae3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dweOP0Y94fcRj41g8vtohssMkLLkGOBrZ3URHgiBnI1T1nlpG0QjCfJ1og210k8bjwuNlQcl0fT8NcJxsJMoa9IGKxG+9nebCsfvgz9tGdIGlHpFRKjKh3Z4zrOSp46WPvoE+Y4xkED6Rzsr6JEn7IJEF4rPxa1BxymaxJEhukPaKA03A+A9MOCaHYZFod3nP6AMjPVMDHDkPQ7rew/4AFvg/Vw2gwCz0SNqGx4bh3zQ0NTSXxQQnz+keWomVPRNUSpBGlLj7yORFkCxspJGDWMvF7mcC8TOQWIEcRhjnN8Fhu2niVDzwwEr6yvQw8s8iaZJT8SOvBHuS8daLLPQ3aF8VB+yLaTcRoMYdUvppgsAaBzRt9FaAl8ZiaciXo2tuDGrj9YKFpiagnBB5lb2NqsUgdx/ycUdlPmsGo8P/yM9gcoYWrmWavCnvKazi5ZTQ/lRrLVzfajt/FRzEBC7fGudqLd3q6KhgSl1NiptfXK8g2iaQkX+IUvyJDoiNTzHOzgLCtef6U/MeSm1N/ftWsZGLTas1vBLuUWBuSLj2np3Z2hhZ1EPCh5fhEtKx3TZU+EFHsg+aTvcaptoDWdp4tFr+bvTMqnN0VSJd+7A4g2aHa70DzDC+nfEzdvmu6l+K2puYgruYiBCXrBU4Qy64ycwLN3cuzTeNjt17u6L8brfFxi9BX/AeBJ+bsi1GH9SQr3meXKEcKuVUUCP8wxbZlnJ68mLBp9qAOsXF6/qqTxwSEK+B794myBF2FybRYT25wpPfFlI0BYYa/nG7hv3JLlZ9xbiiN/opRZN8IleV1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(31686004)(6506007)(316002)(53546011)(6512007)(26005)(44832011)(36756003)(30864003)(6636002)(4001150100001)(4326008)(8676002)(66556008)(66476007)(86362001)(31696002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(478600001)(6486002)(83380400001)(36916002)(38100700002)(2616005)(186003)(43740500002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEpPejllcCtyQWcyb1JMcUNLUk5RQzB5UDNMYWorNzBGTXNCYlpCV1VraGg1?=
 =?utf-8?B?R2V3bUp3Sll4b3U2aExZdk12c20rTEtoZElOM3NncWtQZythS3NCQ01wK0xD?=
 =?utf-8?B?dlU5OTZmdWRQZnVqZzBHUitXT1ZpVS9qaWsvMGlqdExobkp4VG1GTkhsaU9H?=
 =?utf-8?B?clZ4WXZUa01UTlYydm1leFJNU2pLdTdOUDByVDUrak53dThNV1pXZU5ENEtD?=
 =?utf-8?B?bThrd0U0NkdVZ205UXZyUDhsc0gyWkdpbWh2Z3RPOHVTRHNMemxvTVAwWXhw?=
 =?utf-8?B?NmlySE1wZ3N2Njk1cC9WVlZETDFHNXB2QjQrNDZ0QnNOb2ZaZ0xnT1hVZFlO?=
 =?utf-8?B?U2U1VXdsY2thaWZIa3JYN2wrN0RxcmQ0STVZVEZVSjhUd3o5RGNCeEo1N1lt?=
 =?utf-8?B?VkZ5YmhCUW1JS0RUQUFRMi9hS0NESU1ERjBwQnBRanVBU0VGUC9yL1hMcmg5?=
 =?utf-8?B?d2MyenRDOUF4U1JmR2tqcWphUDJOUTIvZVI1YW5Qc2Y4WWFOcXZJVU5CanJv?=
 =?utf-8?B?ZWY5eHJpbXBaa2YvT3cyeFpXa1p0VGt2ZDJ6MHZidkRXVmVHQmRUWitJVnRW?=
 =?utf-8?B?M1dWZE9jVWtEUGF5bFNBdnMvWGtCNzFkMVp4OEwwMi9kRGRBeDlBVUZRakNJ?=
 =?utf-8?B?My9UMWU5UkpKMEIwRkNlMHphUVVnRk0yMmxKczl4YTFCOWRLWWhuMjNuWG13?=
 =?utf-8?B?SUZSdHhTeWdsN1hkYm5JN05UU0xsQ3Z0NXRBT3JZbXl3YXIzeWl6WUdZQlpl?=
 =?utf-8?B?eDc2ajV0UUdvRFlFZ25WcVlvYU5xUk1UUjJaTTBHQWRiZHRiekk2Z2ZTdkVE?=
 =?utf-8?B?bWdDQWhEbGVKekxlOXdqRWJrTml1UG1WRmVOd2FkLzNMeE5hbURmajdPU01o?=
 =?utf-8?B?ZHYzdlh1UDhLV05PRDJ3TTVDc2Q1TXV1cTNuQTVkSFNKMEtNdUZyMmdlUUg3?=
 =?utf-8?B?ZHppU2NTejJQSVNSOTdSN1NUUjlqaGFGMUVBd2paVkJ1NVA5SkJ2RUw4QS9T?=
 =?utf-8?B?VmJ1ZUhTNnRPR1hrelBKaG45Mk9jYnY4WkhVSURzMEdZa3JxWE1LbWNXMjgr?=
 =?utf-8?B?TFBjcEw1eEVjSUd3SWpuZktMZnA1YkVmMmZNZzIwV2d5Z3R0UUdZangxa0Jr?=
 =?utf-8?B?NmxiaUpXbUVITFBPcHU3Y1FNcXIvUXZDQlkxMmRNTkJLTUJtZGZiUnIwM2ZS?=
 =?utf-8?B?eFordTJ1MmtqMU8wMHFaRU9vUmpHUXFmUHdkTVZTZ0hxczExV04rNnVKRmVV?=
 =?utf-8?B?a2FvT3B5YW1HZzlVMzlIQWRXdXc3d2NpMW5XV0l2MEltRzU2Uk9nRVRJN1Ba?=
 =?utf-8?B?ZDNpbEVIUldna25sVkNHUi9aTUk3UFh2eHg1Q25FV3VhcDdyQUxVcVBJYXRz?=
 =?utf-8?B?czJRRjI4NlBmQ01MUVJKQmFCQjBJWjhqekk2Z0tHSWx4S3hRcWgxMTZjaGZp?=
 =?utf-8?B?RDBsaThrd0Fza1VvcjBBRURoTmY2QS92dHNwVnNHeEN1ZFFITWk0eExTYnVM?=
 =?utf-8?B?bHN5N3djZE9NWWR6LzJ0R0Q3Uy9yaWlvcklyd2Fqd1R4aU11UzA1amp3WmdL?=
 =?utf-8?B?cFpPakR3T1IyK3BNU3R6QWhJVFpyWG5vSml6Mmo5bGMzYUdDc2FqdDY3NDUv?=
 =?utf-8?B?RDNabTJibElzUzlHNkJsMjlOYXllWGFTTm9QUjFjc0tRcW12SEZPOU56UUI4?=
 =?utf-8?B?djVJeXRDSXE4Qk52anNCaVdudjFXNDJrNGZkNkNrU2tDNlJITS9mWEFVdUU2?=
 =?utf-8?B?K1NiTm85ODJvQ3grUVVwWjVJYW0zV1h0aThYY3VkbGdJcHluYmw2R3FJYzdN?=
 =?utf-8?B?bkVGcXlMMk03djVHSzg5MjMreEdaM01wdjdsbmxWelRpRFRFWW9lSFBFK1pF?=
 =?utf-8?B?a3hKSGNZanJZVnRhUGVMd25icXVVQVp0MThMbjM3Uk15T0pRTk9OTFZmd1JH?=
 =?utf-8?B?N0Fpa1pqeXJhWU56SStYaGhzL3pqVTI5bHp5MEd3OFFsWlYyK3ZzVWlKbVRF?=
 =?utf-8?B?M0ZjZlpnS1R1dlViNUtaQXBHRnE2dStVR05TQU5RbFZIdDRxeHVxaDhZMzNs?=
 =?utf-8?B?dEk2WnFHYXN3R1JJTGNMQlczcU0xRUZLdjVZcW1HQ1VjRER4Qzd1NHBZcFk4?=
 =?utf-8?Q?yMKCSgoLLhiF14JoGkAwuou0b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eba2b0c-a8b8-40c5-50ba-08dab603ae3f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:06:55.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1ZCM0HLnakhJFTO6JSCEoIbQdhnurrUX9gdlX3Wwxxza1g3VxnEgpKdMV7lCu7tTfzCb6d5XOhe3d1uBhuN+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5275
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
Cc: guchun.chen@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


On 2022-10-24 07:26, Ma Jun wrote:
> For some GPUs with more CUs, the original sibling_map[32]
> in struct crat_subtype_cache is not enough
> to save the cache information when create the VCRAT table,
> so fill the cache info into struct kfd_cache_properties_ext
> directly to fix the problem.
>
> At the same time, a new directory
> "/sys/class/kfd/kfd/topology/nodes/*nodes_num*/caches_ext"
> is created for cache information showing.

Is this necessary because existing user mode cannot handle the larger 
sibling map? If so, you'll also need to update the Thunk to parse the 
information from caches_ext. Do you have a link to that patch?

If user mode can handle a larger siblingmap in the existing sysfs 
interface, we should not create new one.

Another alternative is to add more lines to the existing cache info 
sysfs entries. Older user mode will probably ignore the ones it doesn't 
know about.

Regards,
   Felix


>
> The original directory "cache" is reserved for GPU which using real CRAT
> table.
>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_crat.c     | 1229 +-------------------
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1246 ++++++++++++++++++++-
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.h |   21 +
>   3 files changed, 1261 insertions(+), 1235 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> index 4857ec5b9f46..e6928c60338e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_crat.c
> @@ -30,799 +30,6 @@
>   #include "amdgpu.h"
>   #include "amdgpu_amdkfd.h"
>   
> -/* Static table to describe GPU Cache information */
> -struct kfd_gpu_cache_info {
> -	uint32_t	cache_size;
> -	uint32_t	cache_level;
> -	uint32_t	flags;
> -	/* Indicates how many Compute Units share this cache
> -	 * within a SA. Value = 1 indicates the cache is not shared
> -	 */
> -	uint32_t	num_cu_shared;
> -};
> -
> -static struct kfd_gpu_cache_info kaveri_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache (in SQC module) per bank */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache (in SQC module) per bank */
> -		.cache_size = 8,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -
> -	/* TODO: Add L2 Cache information */
> -};
> -
> -
> -static struct kfd_gpu_cache_info carrizo_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache (in SQC module) per bank */
> -		.cache_size = 8,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 4,
> -	},
> -	{
> -		/* Scalar L1 Data Cache (in SQC module) per bank. */
> -		.cache_size = 4,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 4,
> -	},
> -
> -	/* TODO: Add L2 Cache information */
> -};
> -
> -#define hawaii_cache_info kaveri_cache_info
> -#define tonga_cache_info carrizo_cache_info
> -#define fiji_cache_info  carrizo_cache_info
> -#define polaris10_cache_info carrizo_cache_info
> -#define polaris11_cache_info carrizo_cache_info
> -#define polaris12_cache_info carrizo_cache_info
> -#define vegam_cache_info carrizo_cache_info
> -
> -/* NOTE: L1 cache information has been updated and L2/L3
> - * cache information has been added for Vega10 and
> - * newer ASICs. The unit for cache_size is KiB.
> - * In future,  check & update cache details
> - * for every new ASIC is required.
> - */
> -
> -static struct kfd_gpu_cache_info vega10_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 4096,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 16,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info raven_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 1024,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 11,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info renoir_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 1024,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info vega12_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 2048,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 5,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info vega20_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 3,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 8192,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 16,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info aldebaran_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 8192,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 14,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info navi10_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 4096,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info vangogh_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 1024,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info navi14_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 12,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 2048,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 12,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info sienna_cichlid_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 4096,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -	{
> -		/* L3 Data Cache per GPU */
> -		.cache_size = 128*1024,
> -		.cache_level = 3,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info navy_flounder_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 3072,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -	{
> -		/* L3 Data Cache per GPU */
> -		.cache_size = 96*1024,
> -		.cache_level = 3,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 10,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info dimgrey_cavefish_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 2048,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -	{
> -		/* L3 Data Cache per GPU */
> -		.cache_size = 32*1024,
> -		.cache_level = 3,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info beige_goby_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 1024,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -	{
> -		/* L3 Data Cache per GPU */
> -		.cache_size = 16*1024,
> -		.cache_level = 3,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 8,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info yellow_carp_cache_info[] = {
> -	{
> -		/* TCP L1 Cache per CU */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 1,
> -	},
> -	{
> -		/* Scalar L1 Instruction Cache per SQC */
> -		.cache_size = 32,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_INST_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* Scalar L1 Data Cache per SQC */
> -		.cache_size = 16,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 2,
> -	},
> -	{
> -		/* GL1 Data Cache per SA */
> -		.cache_size = 128,
> -		.cache_level = 1,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 6,
> -	},
> -	{
> -		/* L2 Data Cache per GPU (Total Tex Cache) */
> -		.cache_size = 2048,
> -		.cache_level = 2,
> -		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> -				CRAT_CACHE_FLAGS_DATA_CACHE |
> -				CRAT_CACHE_FLAGS_SIMD_CACHE),
> -		.num_cu_shared = 6,
> -	},
> -};
> -
> -static struct kfd_gpu_cache_info gc_10_3_6_cache_info[] = {
> -       {
> -               /* TCP L1 Cache per CU */
> -               .cache_size = 16,
> -               .cache_level = 1,
> -               .flags = (CRAT_CACHE_FLAGS_ENABLED |
> -                               CRAT_CACHE_FLAGS_DATA_CACHE |
> -                               CRAT_CACHE_FLAGS_SIMD_CACHE),
> -               .num_cu_shared = 1,
> -       },
> -       {
> -               /* Scalar L1 Instruction Cache per SQC */
> -               .cache_size = 32,
> -               .cache_level = 1,
> -               .flags = (CRAT_CACHE_FLAGS_ENABLED |
> -                               CRAT_CACHE_FLAGS_INST_CACHE |
> -                               CRAT_CACHE_FLAGS_SIMD_CACHE),
> -               .num_cu_shared = 2,
> -       },
> -       {
> -               /* Scalar L1 Data Cache per SQC */
> -               .cache_size = 16,
> -               .cache_level = 1,
> -               .flags = (CRAT_CACHE_FLAGS_ENABLED |
> -                               CRAT_CACHE_FLAGS_DATA_CACHE |
> -                               CRAT_CACHE_FLAGS_SIMD_CACHE),
> -               .num_cu_shared = 2,
> -       },
> -       {
> -               /* GL1 Data Cache per SA */
> -               .cache_size = 128,
> -               .cache_level = 1,
> -               .flags = (CRAT_CACHE_FLAGS_ENABLED |
> -                               CRAT_CACHE_FLAGS_DATA_CACHE |
> -                               CRAT_CACHE_FLAGS_SIMD_CACHE),
> -               .num_cu_shared = 2,
> -       },
> -       {
> -               /* L2 Data Cache per GPU (Total Tex Cache) */
> -               .cache_size = 256,
> -               .cache_level = 2,
> -               .flags = (CRAT_CACHE_FLAGS_ENABLED |
> -                               CRAT_CACHE_FLAGS_DATA_CACHE |
> -                               CRAT_CACHE_FLAGS_SIMD_CACHE),
> -               .num_cu_shared = 2,
> -       },
> -};
> -
>   static void kfd_populated_cu_info_cpu(struct kfd_topology_device *dev,
>   		struct crat_subtype_computeunit *cu)
>   {
> @@ -1223,419 +430,6 @@ int kfd_parse_crat_table(void *crat_image, struct list_head *device_list,
>   	return ret;
>   }
>   
> -/* Helper function. See kfd_fill_gpu_cache_info for parameter description */
> -static int fill_in_l1_pcache(struct crat_subtype_cache *pcache,
> -				struct kfd_gpu_cache_info *pcache_info,
> -				struct kfd_cu_info *cu_info,
> -				int mem_available,
> -				int cu_bitmask,
> -				int cache_type, unsigned int cu_processor_id,
> -				int cu_block)
> -{
> -	unsigned int cu_sibling_map_mask;
> -	int first_active_cu;
> -
> -	/* First check if enough memory is available */
> -	if (sizeof(struct crat_subtype_cache) > mem_available)
> -		return -ENOMEM;
> -
> -	cu_sibling_map_mask = cu_bitmask;
> -	cu_sibling_map_mask >>= cu_block;
> -	cu_sibling_map_mask &=
> -		((1 << pcache_info[cache_type].num_cu_shared) - 1);
> -	first_active_cu = ffs(cu_sibling_map_mask);
> -
> -	/* CU could be inactive. In case of shared cache find the first active
> -	 * CU. and incase of non-shared cache check if the CU is inactive. If
> -	 * inactive active skip it
> -	 */
> -	if (first_active_cu) {
> -		memset(pcache, 0, sizeof(struct crat_subtype_cache));
> -		pcache->type = CRAT_SUBTYPE_CACHE_AFFINITY;
> -		pcache->length = sizeof(struct crat_subtype_cache);
> -		pcache->flags = pcache_info[cache_type].flags;
> -		pcache->processor_id_low = cu_processor_id
> -					 + (first_active_cu - 1);
> -		pcache->cache_level = pcache_info[cache_type].cache_level;
> -		pcache->cache_size = pcache_info[cache_type].cache_size;
> -
> -		/* Sibling map is w.r.t processor_id_low, so shift out
> -		 * inactive CU
> -		 */
> -		cu_sibling_map_mask =
> -			cu_sibling_map_mask >> (first_active_cu - 1);
> -
> -		pcache->sibling_map[0] = (uint8_t)(cu_sibling_map_mask & 0xFF);
> -		pcache->sibling_map[1] =
> -				(uint8_t)((cu_sibling_map_mask >> 8) & 0xFF);
> -		pcache->sibling_map[2] =
> -				(uint8_t)((cu_sibling_map_mask >> 16) & 0xFF);
> -		pcache->sibling_map[3] =
> -				(uint8_t)((cu_sibling_map_mask >> 24) & 0xFF);
> -		return 0;
> -	}
> -	return 1;
> -}
> -
> -/* Helper function. See kfd_fill_gpu_cache_info for parameter description */
> -static int fill_in_l2_l3_pcache(struct crat_subtype_cache *pcache,
> -				struct kfd_gpu_cache_info *pcache_info,
> -				struct kfd_cu_info *cu_info,
> -				int mem_available,
> -				int cache_type, unsigned int cu_processor_id)
> -{
> -	unsigned int cu_sibling_map_mask;
> -	int first_active_cu;
> -	int i, j, k;
> -
> -	/* First check if enough memory is available */
> -	if (sizeof(struct crat_subtype_cache) > mem_available)
> -		return -ENOMEM;
> -
> -	cu_sibling_map_mask = cu_info->cu_bitmap[0][0];
> -	cu_sibling_map_mask &=
> -		((1 << pcache_info[cache_type].num_cu_shared) - 1);
> -	first_active_cu = ffs(cu_sibling_map_mask);
> -
> -	/* CU could be inactive. In case of shared cache find the first active
> -	 * CU. and incase of non-shared cache check if the CU is inactive. If
> -	 * inactive active skip it
> -	 */
> -	if (first_active_cu) {
> -		memset(pcache, 0, sizeof(struct crat_subtype_cache));
> -		pcache->type = CRAT_SUBTYPE_CACHE_AFFINITY;
> -		pcache->length = sizeof(struct crat_subtype_cache);
> -		pcache->flags = pcache_info[cache_type].flags;
> -		pcache->processor_id_low = cu_processor_id
> -					 + (first_active_cu - 1);
> -		pcache->cache_level = pcache_info[cache_type].cache_level;
> -		pcache->cache_size = pcache_info[cache_type].cache_size;
> -
> -		/* Sibling map is w.r.t processor_id_low, so shift out
> -		 * inactive CU
> -		 */
> -		cu_sibling_map_mask =
> -			cu_sibling_map_mask >> (first_active_cu - 1);
> -		k = 0;
> -		for (i = 0; i < cu_info->num_shader_engines; i++) {
> -			for (j = 0; j < cu_info->num_shader_arrays_per_engine;
> -				j++) {
> -				pcache->sibling_map[k] =
> -				 (uint8_t)(cu_sibling_map_mask & 0xFF);
> -				pcache->sibling_map[k+1] =
> -				 (uint8_t)((cu_sibling_map_mask >> 8) & 0xFF);
> -				pcache->sibling_map[k+2] =
> -				 (uint8_t)((cu_sibling_map_mask >> 16) & 0xFF);
> -				pcache->sibling_map[k+3] =
> -				 (uint8_t)((cu_sibling_map_mask >> 24) & 0xFF);
> -				k += 4;
> -				cu_sibling_map_mask =
> -					cu_info->cu_bitmap[i % 4][j + i / 4];
> -				cu_sibling_map_mask &= (
> -				 (1 << pcache_info[cache_type].num_cu_shared)
> -				 - 1);
> -			}
> -		}
> -		return 0;
> -	}
> -	return 1;
> -}
> -
> -#define KFD_MAX_CACHE_TYPES 6
> -
> -static int kfd_fill_gpu_cache_info_from_gfx_config(struct kfd_dev *kdev,
> -						   struct kfd_gpu_cache_info *pcache_info)
> -{
> -	struct amdgpu_device *adev = kdev->adev;
> -	int i = 0;
> -
> -	/* TCP L1 Cache per CU */
> -	if (adev->gfx.config.gc_tcp_l1_size) {
> -		pcache_info[i].cache_size = adev->gfx.config.gc_tcp_l1_size;
> -		pcache_info[i].cache_level = 1;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_DATA_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[0].num_cu_shared = adev->gfx.config.gc_num_tcp_per_wpg / 2;
> -		i++;
> -	}
> -	/* Scalar L1 Instruction Cache per SQC */
> -	if (adev->gfx.config.gc_l1_instruction_cache_size_per_sqc) {
> -		pcache_info[i].cache_size =
> -			adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> -		pcache_info[i].cache_level = 1;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_INST_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[i].num_cu_shared = adev->gfx.config.gc_num_sqc_per_wgp * 2;
> -		i++;
> -	}
> -	/* Scalar L1 Data Cache per SQC */
> -	if (adev->gfx.config.gc_l1_data_cache_size_per_sqc) {
> -		pcache_info[i].cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> -		pcache_info[i].cache_level = 1;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_DATA_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[i].num_cu_shared = adev->gfx.config.gc_num_sqc_per_wgp * 2;
> -		i++;
> -	}
> -	/* GL1 Data Cache per SA */
> -	if (adev->gfx.config.gc_gl1c_per_sa &&
> -	    adev->gfx.config.gc_gl1c_size_per_instance) {
> -		pcache_info[i].cache_size = adev->gfx.config.gc_gl1c_per_sa *
> -			adev->gfx.config.gc_gl1c_size_per_instance;
> -		pcache_info[i].cache_level = 1;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_DATA_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> -		i++;
> -	}
> -	/* L2 Data Cache per GPU (Total Tex Cache) */
> -	if (adev->gfx.config.gc_gl2c_per_gpu) {
> -		pcache_info[i].cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> -		pcache_info[i].cache_level = 2;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_DATA_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> -		i++;
> -	}
> -	/* L3 Data Cache per GPU */
> -	if (adev->gmc.mall_size) {
> -		pcache_info[i].cache_size = adev->gmc.mall_size / 1024;
> -		pcache_info[i].cache_level = 3;
> -		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> -					CRAT_CACHE_FLAGS_DATA_CACHE |
> -					CRAT_CACHE_FLAGS_SIMD_CACHE);
> -		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> -		i++;
> -	}
> -	return i;
> -}
> -
> -/* kfd_fill_gpu_cache_info - Fill GPU cache info using kfd_gpu_cache_info
> - * tables
> - *
> - *	@kdev - [IN] GPU device
> - *	@gpu_processor_id - [IN] GPU processor ID to which these caches
> - *			    associate
> - *	@available_size - [IN] Amount of memory available in pcache
> - *	@cu_info - [IN] Compute Unit info obtained from KGD
> - *	@pcache - [OUT] memory into which cache data is to be filled in.
> - *	@size_filled - [OUT] amount of data used up in pcache.
> - *	@num_of_entries - [OUT] number of caches added
> - */
> -static int kfd_fill_gpu_cache_info(struct kfd_dev *kdev,
> -			int gpu_processor_id,
> -			int available_size,
> -			struct kfd_cu_info *cu_info,
> -			struct crat_subtype_cache *pcache,
> -			int *size_filled,
> -			int *num_of_entries)
> -{
> -	struct kfd_gpu_cache_info *pcache_info;
> -	struct kfd_gpu_cache_info cache_info[KFD_MAX_CACHE_TYPES];
> -	int num_of_cache_types = 0;
> -	int i, j, k;
> -	int ct = 0;
> -	int mem_available = available_size;
> -	unsigned int cu_processor_id;
> -	int ret;
> -	unsigned int num_cu_shared;
> -
> -	switch (kdev->adev->asic_type) {
> -	case CHIP_KAVERI:
> -		pcache_info = kaveri_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(kaveri_cache_info);
> -		break;
> -	case CHIP_HAWAII:
> -		pcache_info = hawaii_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(hawaii_cache_info);
> -		break;
> -	case CHIP_CARRIZO:
> -		pcache_info = carrizo_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(carrizo_cache_info);
> -		break;
> -	case CHIP_TONGA:
> -		pcache_info = tonga_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(tonga_cache_info);
> -		break;
> -	case CHIP_FIJI:
> -		pcache_info = fiji_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(fiji_cache_info);
> -		break;
> -	case CHIP_POLARIS10:
> -		pcache_info = polaris10_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(polaris10_cache_info);
> -		break;
> -	case CHIP_POLARIS11:
> -		pcache_info = polaris11_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(polaris11_cache_info);
> -		break;
> -	case CHIP_POLARIS12:
> -		pcache_info = polaris12_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(polaris12_cache_info);
> -		break;
> -	case CHIP_VEGAM:
> -		pcache_info = vegam_cache_info;
> -		num_of_cache_types = ARRAY_SIZE(vegam_cache_info);
> -		break;
> -	default:
> -		switch (KFD_GC_VERSION(kdev)) {
> -		case IP_VERSION(9, 0, 1):
> -			pcache_info = vega10_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(vega10_cache_info);
> -			break;
> -		case IP_VERSION(9, 2, 1):
> -			pcache_info = vega12_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(vega12_cache_info);
> -			break;
> -		case IP_VERSION(9, 4, 0):
> -		case IP_VERSION(9, 4, 1):
> -			pcache_info = vega20_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(vega20_cache_info);
> -			break;
> -		case IP_VERSION(9, 4, 2):
> -			pcache_info = aldebaran_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(aldebaran_cache_info);
> -			break;
> -		case IP_VERSION(9, 1, 0):
> -		case IP_VERSION(9, 2, 2):
> -			pcache_info = raven_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(raven_cache_info);
> -			break;
> -		case IP_VERSION(9, 3, 0):
> -			pcache_info = renoir_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(renoir_cache_info);
> -			break;
> -		case IP_VERSION(10, 1, 10):
> -		case IP_VERSION(10, 1, 2):
> -		case IP_VERSION(10, 1, 3):
> -		case IP_VERSION(10, 1, 4):
> -			pcache_info = navi10_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(navi10_cache_info);
> -			break;
> -		case IP_VERSION(10, 1, 1):
> -			pcache_info = navi14_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(navi14_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 0):
> -			pcache_info = sienna_cichlid_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(sienna_cichlid_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 2):
> -			pcache_info = navy_flounder_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(navy_flounder_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 4):
> -			pcache_info = dimgrey_cavefish_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(dimgrey_cavefish_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 1):
> -			pcache_info = vangogh_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(vangogh_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 5):
> -			pcache_info = beige_goby_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(beige_goby_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 3):
> -		case IP_VERSION(10, 3, 7): /* TODO: Double check these on production silicon */
> -			pcache_info = yellow_carp_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(yellow_carp_cache_info);
> -			break;
> -		case IP_VERSION(10, 3, 6):
> -			pcache_info = gc_10_3_6_cache_info;
> -			num_of_cache_types = ARRAY_SIZE(gc_10_3_6_cache_info);
> -			break;
> -		case IP_VERSION(11, 0, 0):
> -		case IP_VERSION(11, 0, 1):
> -		case IP_VERSION(11, 0, 2):
> -		case IP_VERSION(11, 0, 3):
> -			pcache_info = cache_info;
> -			num_of_cache_types =
> -				kfd_fill_gpu_cache_info_from_gfx_config(kdev, pcache_info);
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> -	}
> -
> -	*size_filled = 0;
> -	*num_of_entries = 0;
> -
> -	/* For each type of cache listed in the kfd_gpu_cache_info table,
> -	 * go through all available Compute Units.
> -	 * The [i,j,k] loop will
> -	 *		if kfd_gpu_cache_info.num_cu_shared = 1
> -	 *			will parse through all available CU
> -	 *		If (kfd_gpu_cache_info.num_cu_shared != 1)
> -	 *			then it will consider only one CU from
> -	 *			the shared unit
> -	 */
> -
> -	for (ct = 0; ct < num_of_cache_types; ct++) {
> -	  cu_processor_id = gpu_processor_id;
> -	  if (pcache_info[ct].cache_level == 1) {
> -	    for (i = 0; i < cu_info->num_shader_engines; i++) {
> -	      for (j = 0; j < cu_info->num_shader_arrays_per_engine; j++) {
> -	        for (k = 0; k < cu_info->num_cu_per_sh;
> -		  k += pcache_info[ct].num_cu_shared) {
> -		  ret = fill_in_l1_pcache(pcache,
> -					pcache_info,
> -					cu_info,
> -					mem_available,
> -					cu_info->cu_bitmap[i % 4][j + i / 4],
> -					ct,
> -					cu_processor_id,
> -					k);
> -
> -		  if (ret < 0)
> -			break;
> -
> -		  if (!ret) {
> -				pcache++;
> -				(*num_of_entries)++;
> -				mem_available -= sizeof(*pcache);
> -				(*size_filled) += sizeof(*pcache);
> -		  }
> -
> -		  /* Move to next CU block */
> -		  num_cu_shared = ((k + pcache_info[ct].num_cu_shared) <=
> -					cu_info->num_cu_per_sh) ?
> -					pcache_info[ct].num_cu_shared :
> -					(cu_info->num_cu_per_sh - k);
> -		  cu_processor_id += num_cu_shared;
> -		}
> -	      }
> -	    }
> -	  } else {
> -			ret = fill_in_l2_l3_pcache(pcache,
> -				pcache_info,
> -				cu_info,
> -				mem_available,
> -				ct,
> -				cu_processor_id);
> -
> -			if (ret < 0)
> -				break;
> -
> -			if (!ret) {
> -				pcache++;
> -				(*num_of_entries)++;
> -				mem_available -= sizeof(*pcache);
> -				(*size_filled) += sizeof(*pcache);
> -			}
> -	  }
> -	}
> -
> -	pr_debug("Added [%d] GPU cache entries\n", *num_of_entries);
> -
> -	return 0;
> -}
> -
>   static bool kfd_ignore_crat(void)
>   {
>   	bool ret;
> @@ -2203,8 +997,6 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
>   	struct crat_subtype_computeunit *cu;
>   	struct kfd_cu_info cu_info;
>   	int avail_size = *size;
> -	int num_of_cache_entries = 0;
> -	int cache_mem_filled = 0;
>   	uint32_t nid = 0;
>   	int ret = 0;
>   
> @@ -2304,31 +1096,12 @@ static int kfd_create_vcrat_image_gpu(void *pcrat_image,
>   	crat_table->length += sizeof(struct crat_subtype_memory);
>   	crat_table->total_entries++;
>   
> -	/* TODO: Fill in cache information. This information is NOT readily
> -	 * available in KGD
> -	 */
> -	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
> -		sub_type_hdr->length);
> -	ret = kfd_fill_gpu_cache_info(kdev, cu->processor_id_low,
> -				avail_size,
> -				&cu_info,
> -				(struct crat_subtype_cache *)sub_type_hdr,
> -				&cache_mem_filled,
> -				&num_of_cache_entries);
> -
> -	if (ret < 0)
> -		return ret;
> -
> -	crat_table->length += cache_mem_filled;
> -	crat_table->total_entries += num_of_cache_entries;
> -	avail_size -= cache_mem_filled;
> -
>   	/* Fill in Subtype: IO_LINKS
>   	 *  Only direct links are added here which is Link from GPU to
>   	 *  its NUMA node. Indirect links are added by userspace.
>   	 */
>   	sub_type_hdr = (typeof(sub_type_hdr))((char *)sub_type_hdr +
> -		cache_mem_filled);
> +		sub_type_hdr->length);
>   	ret = kfd_fill_gpu_direct_io_link_to_cpu(&avail_size, kdev,
>   		(struct crat_subtype_iolink *)sub_type_hdr, proximity_domain);
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index e0680d265a66..97e88c35be01 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -50,6 +50,747 @@ static struct kfd_system_properties sys_props;
>   static DECLARE_RWSEM(topology_lock);
>   static uint32_t topology_crat_proximity_domain;
>   
> +/* Static table to describe GPU Cache information */
> +struct kfd_gpu_cache_info {
> +	uint32_t	cache_size;
> +	uint32_t	cache_level;
> +	uint32_t	flags;
> +	/* Indicates how many Compute Units share this cache
> +	 * within a SA. Value = 1 indicates the cache is not shared
> +	 */
> +	uint32_t	num_cu_shared;
> +};
> +
> +static struct kfd_gpu_cache_info kaveri_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache (in SQC module) per bank */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache (in SQC module) per bank */
> +		.cache_size = 8,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +
> +	/* TODO: Add L2 Cache information */
> +};
> +
> +static struct kfd_gpu_cache_info carrizo_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache (in SQC module) per bank */
> +		.cache_size = 8,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 4,
> +	},
> +	{
> +		/* Scalar L1 Data Cache (in SQC module) per bank. */
> +		.cache_size = 4,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 4,
> +	},
> +
> +	/* TODO: Add L2 Cache information */
> +};
> +
> +#define hawaii_cache_info kaveri_cache_info
> +#define tonga_cache_info carrizo_cache_info
> +#define fiji_cache_info  carrizo_cache_info
> +#define polaris10_cache_info carrizo_cache_info
> +#define polaris11_cache_info carrizo_cache_info
> +#define polaris12_cache_info carrizo_cache_info
> +#define vegam_cache_info carrizo_cache_info
> +
> +/* NOTE: L1 cache information has been updated and L2/L3
> + * cache information has been added for Vega10 and
> + * newer ASICs. The unit for cache_size is KiB.
> + * In future,  check & update cache details
> + * for every new ASIC is required.
> + */
> +static struct kfd_gpu_cache_info vega10_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 4096,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 16,
> +	},
> +};
> +static struct kfd_gpu_cache_info raven_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 1024,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 11,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info renoir_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 1024,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info vega12_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 2048,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 5,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info vega20_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 3,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 8192,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 16,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info aldebaran_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 8192,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 14,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info navi10_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 4096,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info vangogh_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 1024,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info navi14_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 12,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 2048,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 12,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info sienna_cichlid_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 4096,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +	{
> +		/* L3 Data Cache per GPU */
> +		.cache_size = 128*1024,
> +		.cache_level = 3,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info navy_flounder_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 3072,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +	{
> +		/* L3 Data Cache per GPU */
> +		.cache_size = 96*1024,
> +		.cache_level = 3,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 10,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info dimgrey_cavefish_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 2048,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +	{
> +		/* L3 Data Cache per GPU */
> +		.cache_size = 32*1024,
> +		.cache_level = 3,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +};
> +
> +static struct kfd_gpu_cache_info beige_goby_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 1024,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +	{
> +		/* L3 Data Cache per GPU */
> +		.cache_size = 16*1024,
> +		.cache_level = 3,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 8,
> +	},
> +};
> +static struct kfd_gpu_cache_info yellow_carp_cache_info[] = {
> +	{
> +		/* TCP L1 Cache per CU */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 1,
> +	},
> +	{
> +		/* Scalar L1 Instruction Cache per SQC */
> +		.cache_size = 32,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_INST_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* Scalar L1 Data Cache per SQC */
> +		.cache_size = 16,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 2,
> +	},
> +	{
> +		/* GL1 Data Cache per SA */
> +		.cache_size = 128,
> +		.cache_level = 1,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 6,
> +	},
> +	{
> +		/* L2 Data Cache per GPU (Total Tex Cache) */
> +		.cache_size = 2048,
> +		.cache_level = 2,
> +		.flags = (CRAT_CACHE_FLAGS_ENABLED |
> +				CRAT_CACHE_FLAGS_DATA_CACHE |
> +				CRAT_CACHE_FLAGS_SIMD_CACHE),
> +		.num_cu_shared = 6,
> +	},
> +};
> +
>   struct kfd_topology_device *kfd_topology_device_by_proximity_domain_no_lock(
>   						uint32_t proximity_domain)
>   {
> @@ -149,6 +890,7 @@ static void kfd_release_topology_device(struct kfd_topology_device *dev)
>   {
>   	struct kfd_mem_properties *mem;
>   	struct kfd_cache_properties *cache;
> +	struct kfd_cache_properties_ext *cache_ext;
>   	struct kfd_iolink_properties *iolink;
>   	struct kfd_iolink_properties *p2plink;
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
> @@ -171,6 +913,13 @@ static void kfd_release_topology_device(struct kfd_topology_device *dev)
>   		kfree(cache);
>   	}
>   
> +	while (dev->cache_props_ext.next != &dev->cache_props_ext) {
> +		cache_ext = container_of(dev->cache_props_ext.next,
> +				struct kfd_cache_properties_ext, list);
> +		list_del(&cache_ext->list);
> +		kfree(cache_ext);
> +	}
> +
>   	while (dev->io_link_props.next != &dev->io_link_props) {
>   		iolink = container_of(dev->io_link_props.next,
>   				struct kfd_iolink_properties, list);
> @@ -227,6 +976,7 @@ struct kfd_topology_device *kfd_create_topology_device(
>   
>   	INIT_LIST_HEAD(&dev->mem_props);
>   	INIT_LIST_HEAD(&dev->cache_props);
> +	INIT_LIST_HEAD(&dev->cache_props_ext);
>   	INIT_LIST_HEAD(&dev->io_link_props);
>   	INIT_LIST_HEAD(&dev->p2p_link_props);
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
> @@ -387,7 +1137,6 @@ static ssize_t kfd_cache_show(struct kobject *kobj, struct attribute *attr,
>   
>   	/* Making sure that the buffer is an empty string */
>   	buffer[0] = 0;
> -
>   	cache = container_of(attr, struct kfd_cache_properties, attr);
>   	if (cache->gpu && kfd_devcgroup_check_permission(cache->gpu))
>   		return -EPERM;
> @@ -423,6 +1172,50 @@ static struct kobj_type cache_type = {
>   	.sysfs_ops = &cache_ops,
>   };
>   
> +static ssize_t kfd_cache_ext_show(struct kobject *kobj, struct attribute *attr,
> +		char *buffer)
> +{
> +	int offs = 0;
> +	uint32_t i, j;
> +	struct kfd_cache_properties_ext *cache;
> +
> +	/* Making sure that the buffer is an empty string */
> +	buffer[0] = 0;
> +	cache = container_of(attr, struct kfd_cache_properties_ext, attr);
> +	if (cache->gpu && kfd_devcgroup_check_permission(cache->gpu))
> +		return -EPERM;
> +	sysfs_show_32bit_prop(buffer, offs, "processor_id_low",
> +			cache->processor_id_low);
> +	sysfs_show_32bit_prop(buffer, offs, "level", cache->cache_level);
> +	sysfs_show_32bit_prop(buffer, offs, "size", cache->cache_size);
> +	sysfs_show_32bit_prop(buffer, offs, "cache_line_size",
> +			      cache->cacheline_size);
> +	sysfs_show_32bit_prop(buffer, offs, "cache_lines_per_tag",
> +			      cache->cachelines_per_tag);
> +	sysfs_show_32bit_prop(buffer, offs, "association", cache->cache_assoc);
> +	sysfs_show_32bit_prop(buffer, offs, "latency", cache->cache_latency);
> +	sysfs_show_32bit_prop(buffer, offs, "type", cache->cache_type);
> +	offs += snprintf(buffer+offs, PAGE_SIZE-offs, "sibling_map ");
> +	for (i = 0; i < CRAT_SIBLINGMAP_SIZE; i++)
> +		for (j = 0; j < sizeof(cache->sibling_map[0])*8; j++)
> +			/* Check each bit */
> +			offs += snprintf(buffer+offs, PAGE_SIZE-offs, "%d,",
> +					 (cache->sibling_map[i] >> j) & 1);
> +
> +	/* Replace the last "," with end of line */
> +	buffer[offs-1] = '\n';
> +	return offs;
> +}
> +
> +static const struct sysfs_ops cache_ext_ops = {
> +	.show = kfd_cache_ext_show,
> +};
> +
> +static struct kobj_type cache_ext_type = {
> +	.release = kfd_topology_kobj_release,
> +	.sysfs_ops = &cache_ext_ops,
> +};
> +
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
>   /****** Sysfs of Performance Counters ******/
>   
> @@ -610,6 +1403,7 @@ static void kfd_remove_sysfs_node_entry(struct kfd_topology_device *dev)
>   	struct kfd_iolink_properties *p2plink;
>   	struct kfd_iolink_properties *iolink;
>   	struct kfd_cache_properties *cache;
> +	struct kfd_cache_properties_ext *cache_ext;
>   	struct kfd_mem_properties *mem;
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
>   	struct kfd_perf_properties *perf;
> @@ -663,6 +1457,18 @@ static void kfd_remove_sysfs_node_entry(struct kfd_topology_device *dev)
>   		dev->kobj_cache = NULL;
>   	}
>   
> +	if (dev->kobj_cache_ext) {
> +		list_for_each_entry(cache_ext, &dev->cache_props_ext, list)
> +			if (cache_ext->kobj) {
> +				kfd_remove_sysfs_file(cache_ext->kobj,
> +							&cache_ext->attr);
> +				cache_ext->kobj = NULL;
> +			}
> +		kobject_del(dev->kobj_cache_ext);
> +		kobject_put(dev->kobj_cache_ext);
> +		dev->kobj_cache_ext = NULL;
> +	}
> +
>   	if (dev->kobj_mem) {
>   		list_for_each_entry(mem, &dev->mem_props, list)
>   			if (mem->kobj) {
> @@ -707,6 +1513,7 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
>   	struct kfd_iolink_properties *p2plink;
>   	struct kfd_iolink_properties *iolink;
>   	struct kfd_cache_properties *cache;
> +	struct kfd_cache_properties_ext *cache_ext;
>   	struct kfd_mem_properties *mem;
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
>   	struct kfd_perf_properties *perf;
> @@ -741,6 +1548,10 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
>   	if (!dev->kobj_cache)
>   		return -ENOMEM;
>   
> +	dev->kobj_cache_ext = kobject_create_and_add("caches_ext", dev->kobj_node);
> +	if (!dev->kobj_cache_ext)
> +		return -ENOMEM;
> +
>   	dev->kobj_iolink = kobject_create_and_add("io_links", dev->kobj_node);
>   	if (!dev->kobj_iolink)
>   		return -ENOMEM;
> @@ -830,6 +1641,28 @@ static int kfd_build_sysfs_node_entry(struct kfd_topology_device *dev,
>   		i++;
>   	}
>   
> +	i = 0;
> +	list_for_each_entry(cache_ext, &dev->cache_props_ext, list) {
> +		cache_ext->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
> +		if (!cache_ext->kobj)
> +			return -ENOMEM;
> +		ret = kobject_init_and_add(cache_ext->kobj, &cache_ext_type,
> +				dev->kobj_cache_ext, "%d", i);
> +		if (ret < 0) {
> +			kobject_put(cache_ext->kobj);
> +			return ret;
> +		}
> +
> +		cache_ext->attr.name = "properties";
> +		cache_ext->attr.mode = KFD_SYSFS_FILE_MODE;
> +		sysfs_attr_init(&cache_ext->attr);
> +		ret = sysfs_create_file(cache_ext->kobj, &cache_ext->attr);
> +		if (ret < 0)
> +			return ret;
> +		i++;
> +	}
> +
> +
>   	i = 0;
>   	list_for_each_entry(iolink, &dev->io_link_props, list) {
>   		iolink->kobj = kzalloc(sizeof(struct kobject), GFP_KERNEL);
> @@ -1268,6 +2101,7 @@ static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
>   	struct kfd_topology_device *out_dev = NULL;
>   	struct kfd_mem_properties *mem;
>   	struct kfd_cache_properties *cache;
> +	struct kfd_cache_properties_ext *cache_ext;
>   	struct kfd_iolink_properties *iolink;
>   	struct kfd_iolink_properties *p2plink;
>   
> @@ -1288,6 +2122,8 @@ static struct kfd_topology_device *kfd_assign_gpu(struct kfd_dev *gpu)
>   				mem->gpu = dev->gpu;
>   			list_for_each_entry(cache, &dev->cache_props, list)
>   				cache->gpu = dev->gpu;
> +			list_for_each_entry(cache, &dev->cache_props_ext, list)
> +				cache_ext->gpu = dev->gpu;
>   			list_for_each_entry(iolink, &dev->io_link_props, list)
>   				iolink->gpu = dev->gpu;
>   			list_for_each_entry(p2plink, &dev->p2p_link_props, list)
> @@ -1721,6 +2557,397 @@ static void kfd_topology_set_capabilities(struct kfd_topology_device *dev)
>   		dev->node_props.capability |= HSA_CAP_TRAP_DEBUG_FIRMWARE_SUPPORTED;
>   }
>   
> +/* Helper function. See kfd_fill_gpu_cache_info for parameter description */
> +static int fill_in_l1_pcache(struct kfd_cache_properties_ext **props_ext,
> +				struct kfd_gpu_cache_info *pcache_info,
> +				struct kfd_cu_info *cu_info,
> +				int cu_bitmask,
> +				int cache_type, unsigned int cu_processor_id,
> +				int cu_block)
> +{
> +	unsigned int cu_sibling_map_mask;
> +	int first_active_cu;
> +	struct kfd_cache_properties_ext *pcache = NULL;
> +
> +	cu_sibling_map_mask = cu_bitmask;
> +	cu_sibling_map_mask >>= cu_block;
> +	cu_sibling_map_mask &= ((1 << pcache_info[cache_type].num_cu_shared) - 1);
> +	first_active_cu = ffs(cu_sibling_map_mask);
> +
> +	/* CU could be inactive. In case of shared cache find the first active
> +	 * CU. and incase of non-shared cache check if the CU is inactive. If
> +	 * inactive active skip it
> +	 */
> +	if (first_active_cu) {
> +		pcache = kfd_alloc_struct(pcache);
> +		if (!pcache)
> +			return -ENOMEM;
> +
> +		memset(pcache, 0, sizeof(struct kfd_cache_properties_ext));
> +		pcache->processor_id_low = cu_processor_id + (first_active_cu - 1);
> +		pcache->cache_level = pcache_info[cache_type].cache_level;
> +		pcache->cache_size = pcache_info[cache_type].cache_size;
> +
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_DATA_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_DATA;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_INST_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_INSTRUCTION;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_CPU_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_CPU;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_SIMD_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_HSACU;
> +
> +		/* Sibling map is w.r.t processor_id_low, so shift out
> +		 * inactive CU
> +		 */
> +		cu_sibling_map_mask =
> +			cu_sibling_map_mask >> (first_active_cu - 1);
> +
> +		pcache->sibling_map[0] = (uint8_t)(cu_sibling_map_mask & 0xFF);
> +		pcache->sibling_map[1] =
> +				(uint8_t)((cu_sibling_map_mask >> 8) & 0xFF);
> +		pcache->sibling_map[2] =
> +				(uint8_t)((cu_sibling_map_mask >> 16) & 0xFF);
> +		pcache->sibling_map[3] =
> +				(uint8_t)((cu_sibling_map_mask >> 24) & 0xFF);
> +
> +		*props_ext = pcache;
> +
> +		return 0;
> +	}
> +	return 1;
> +}
> +
> +/* Helper function. See kfd_fill_gpu_cache_info for parameter description */
> +static int fill_in_l2_l3_pcache(struct kfd_cache_properties_ext **props_ext,
> +				struct kfd_gpu_cache_info *pcache_info,
> +				struct kfd_cu_info *cu_info,
> +				int cache_type, unsigned int cu_processor_id)
> +{
> +	unsigned int cu_sibling_map_mask;
> +	int first_active_cu;
> +	int i, j, k;
> +	struct kfd_cache_properties_ext *pcache = NULL;
> +
> +	cu_sibling_map_mask = cu_info->cu_bitmap[0][0];
> +	cu_sibling_map_mask &=
> +		((1 << pcache_info[cache_type].num_cu_shared) - 1);
> +	first_active_cu = ffs(cu_sibling_map_mask);
> +
> +	/* CU could be inactive. In case of shared cache find the first active
> +	 * CU. and incase of non-shared cache check if the CU is inactive. If
> +	 * inactive active skip it
> +	 */
> +	if (first_active_cu) {
> +		pcache = kfd_alloc_struct(pcache);
> +		if (!pcache)
> +			return -ENOMEM;
> +
> +		memset(pcache, 0, sizeof(struct kfd_cache_properties_ext));
> +		pcache->processor_id_low = cu_processor_id
> +					+ (first_active_cu - 1);
> +		pcache->cache_level = pcache_info[cache_type].cache_level;
> +		pcache->cache_size = pcache_info[cache_type].cache_size;
> +
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_DATA_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_DATA;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_INST_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_INSTRUCTION;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_CPU_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_CPU;
> +		if (pcache_info[cache_type].flags & CRAT_CACHE_FLAGS_SIMD_CACHE)
> +			pcache->cache_type |= HSA_CACHE_TYPE_HSACU;
> +
> +		/* Sibling map is w.r.t processor_id_low, so shift out
> +		 * inactive CU
> +		 */
> +		cu_sibling_map_mask = cu_sibling_map_mask >> (first_active_cu - 1);
> +		k = 0;
> +
> +		for (i = 0; i < cu_info->num_shader_engines; i++) {
> +			for (j = 0; j < cu_info->num_shader_arrays_per_engine; j++) {
> +				pcache->sibling_map[k] = (uint8_t)(cu_sibling_map_mask & 0xFF);
> +				pcache->sibling_map[k+1] = (uint8_t)((cu_sibling_map_mask >> 8) & 0xFF);
> +				pcache->sibling_map[k+2] = (uint8_t)((cu_sibling_map_mask >> 16) & 0xFF);
> +				pcache->sibling_map[k+3] = (uint8_t)((cu_sibling_map_mask >> 24) & 0xFF);
> +				k += 4;
> +
> +				cu_sibling_map_mask = cu_info->cu_bitmap[i % 4][j + i / 4];
> +				cu_sibling_map_mask &= ((1 << pcache_info[cache_type].num_cu_shared) - 1);
> +			}
> +		}
> +		*props_ext = pcache;
> +		return 0;
> +	}
> +	return 1;
> +}
> +
> +#define KFD_MAX_CACHE_TYPES 6
> +
> +static int kfd_fill_gpu_cache_info_from_gfx_config(struct kfd_dev *kdev,
> +						   struct kfd_gpu_cache_info *pcache_info)
> +{
> +	struct amdgpu_device *adev = kdev->adev;
> +	int i = 0;
> +
> +	/* TCP L1 Cache per CU */
> +	if (adev->gfx.config.gc_tcp_l1_size) {
> +		pcache_info[i].cache_size = adev->gfx.config.gc_tcp_l1_size;
> +		pcache_info[i].cache_level = 1;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_DATA_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[0].num_cu_shared = adev->gfx.config.gc_num_tcp_per_wpg / 2;
> +		i++;
> +	}
> +	/* Scalar L1 Instruction Cache per SQC */
> +	if (adev->gfx.config.gc_l1_instruction_cache_size_per_sqc) {
> +		pcache_info[i].cache_size =
> +			adev->gfx.config.gc_l1_instruction_cache_size_per_sqc;
> +		pcache_info[i].cache_level = 1;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_INST_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[i].num_cu_shared = adev->gfx.config.gc_num_sqc_per_wgp * 2;
> +		i++;
> +	}
> +	/* Scalar L1 Data Cache per SQC */
> +	if (adev->gfx.config.gc_l1_data_cache_size_per_sqc) {
> +		pcache_info[i].cache_size = adev->gfx.config.gc_l1_data_cache_size_per_sqc;
> +		pcache_info[i].cache_level = 1;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_DATA_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[i].num_cu_shared = adev->gfx.config.gc_num_sqc_per_wgp * 2;
> +		i++;
> +	}
> +	/* GL1 Data Cache per SA */
> +	if (adev->gfx.config.gc_gl1c_per_sa &&
> +		adev->gfx.config.gc_gl1c_size_per_instance) {
> +		pcache_info[i].cache_size = adev->gfx.config.gc_gl1c_per_sa *
> +			adev->gfx.config.gc_gl1c_size_per_instance;
> +		pcache_info[i].cache_level = 1;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_DATA_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> +		i++;
> +	}
> +	/* L2 Data Cache per GPU (Total Tex Cache) */
> +	if (adev->gfx.config.gc_gl2c_per_gpu) {
> +		pcache_info[i].cache_size = adev->gfx.config.gc_gl2c_per_gpu;
> +		pcache_info[i].cache_level = 2;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_DATA_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> +		i++;
> +	}
> +	/* L3 Data Cache per GPU */
> +	if (adev->gmc.mall_size) {
> +		pcache_info[i].cache_size = adev->gmc.mall_size / 1024;
> +		pcache_info[i].cache_level = 3;
> +		pcache_info[i].flags = (CRAT_CACHE_FLAGS_ENABLED |
> +					CRAT_CACHE_FLAGS_DATA_CACHE |
> +					CRAT_CACHE_FLAGS_SIMD_CACHE);
> +		pcache_info[i].num_cu_shared = adev->gfx.config.max_cu_per_sh;
> +		i++;
> +	}
> +	return i;
> +}
> +/* kfd_fill_cache_non_crat_info - Fill GPU cache info using kfd_gpu_cache_info
> + * tables
> + */
> +static int kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct kfd_dev *kdev)
> +{
> +	struct kfd_gpu_cache_info *pcache_info = NULL;
> +	struct kfd_gpu_cache_info cache_info[KFD_MAX_CACHE_TYPES];
> +	int num_of_cache_types = 0;
> +	int i, j, k;
> +	int ct = 0;
> +	unsigned int cu_processor_id;
> +	int ret;
> +	unsigned int num_cu_shared;
> +	struct kfd_cu_info cu_info;
> +	struct kfd_cu_info *pcu_info;
> +	int gpu_processor_id;
> +	struct kfd_cache_properties_ext *props_ext;
> +	int num_of_entries = 0;
> +
> +	amdgpu_amdkfd_get_cu_info(kdev->adev, &cu_info);
> +	pcu_info = &cu_info;
> +
> +	gpu_processor_id = kdev->processor_id_low;
> +
> +	switch (kdev->adev->asic_type) {
> +	case CHIP_KAVERI:
> +		pcache_info = kaveri_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(kaveri_cache_info);
> +		break;
> +	case CHIP_HAWAII:
> +		pcache_info = hawaii_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(hawaii_cache_info);
> +		break;
> +	case CHIP_CARRIZO:
> +		pcache_info = carrizo_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(carrizo_cache_info);
> +		break;
> +	case CHIP_TONGA:
> +		pcache_info = tonga_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(tonga_cache_info);
> +		break;
> +	case CHIP_FIJI:
> +		pcache_info = fiji_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(fiji_cache_info);
> +		break;
> +	case CHIP_POLARIS10:
> +		pcache_info = polaris10_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(polaris10_cache_info);
> +		break;
> +	case CHIP_POLARIS11:
> +		pcache_info = polaris11_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(polaris11_cache_info);
> +		break;
> +	case CHIP_POLARIS12:
> +		pcache_info = polaris12_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(polaris12_cache_info);
> +		break;
> +	case CHIP_VEGAM:
> +		pcache_info = vegam_cache_info;
> +		num_of_cache_types = ARRAY_SIZE(vegam_cache_info);
> +		break;
> +	default:
> +		switch (KFD_GC_VERSION(kdev)) {
> +		case IP_VERSION(9, 0, 1):
> +			pcache_info = vega10_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(vega10_cache_info);
> +			break;
> +		case IP_VERSION(9, 2, 1):
> +			pcache_info = vega12_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(vega12_cache_info);
> +			break;
> +		case IP_VERSION(9, 4, 0):
> +		case IP_VERSION(9, 4, 1):
> +			pcache_info = vega20_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(vega20_cache_info);
> +			break;
> +		case IP_VERSION(9, 4, 2):
> +			pcache_info = aldebaran_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(aldebaran_cache_info);
> +			break;
> +		case IP_VERSION(9, 1, 0):
> +		case IP_VERSION(9, 2, 2):
> +			pcache_info = raven_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(raven_cache_info);
> +			break;
> +		case IP_VERSION(9, 3, 0):
> +			pcache_info = renoir_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(renoir_cache_info);
> +			break;
> +		case IP_VERSION(10, 1, 10):
> +		case IP_VERSION(10, 1, 2):
> +		case IP_VERSION(10, 1, 3):
> +		case IP_VERSION(10, 1, 4):
> +			pcache_info = navi10_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(navi10_cache_info);
> +			break;
> +		case IP_VERSION(10, 1, 1):
> +			pcache_info = navi14_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(navi14_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 0):
> +			pcache_info = sienna_cichlid_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(sienna_cichlid_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 2):
> +			pcache_info = navy_flounder_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(navy_flounder_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 4):
> +			pcache_info = dimgrey_cavefish_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(dimgrey_cavefish_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 1):
> +			pcache_info = vangogh_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(vangogh_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 5):
> +			pcache_info = beige_goby_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(beige_goby_cache_info);
> +			break;
> +		case IP_VERSION(10, 3, 3):
> +		case IP_VERSION(10, 3, 6): /* TODO: Double check these on production silicon */
> +		case IP_VERSION(10, 3, 7): /* TODO: Double check these on production silicon */
> +			pcache_info = yellow_carp_cache_info;
> +			num_of_cache_types = ARRAY_SIZE(yellow_carp_cache_info);
> +			break;
> +		case IP_VERSION(11, 0, 0):
> +		case IP_VERSION(11, 0, 1):
> +		case IP_VERSION(11, 0, 2):
> +		case IP_VERSION(11, 0, 3):
> +			pcache_info = cache_info;
> +			num_of_cache_types =
> +				kfd_fill_gpu_cache_info_from_gfx_config(kdev, pcache_info);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* For each type of cache listed in the kfd_gpu_cache_info table,
> +	 * go through all available Compute Units.
> +	 * The [i,j,k] loop will
> +	 *		if kfd_gpu_cache_info.num_cu_shared = 1
> +	 *			will parse through all available CU
> +	 *		If (kfd_gpu_cache_info.num_cu_shared != 1)
> +	 *			then it will consider only one CU from
> +	 *			the shared unit
> +	 */
> +	for (ct = 0; ct < num_of_cache_types; ct++) {
> +		cu_processor_id = gpu_processor_id;
> +		if (pcache_info[ct].cache_level == 1) {
> +			for (i = 0; i < pcu_info->num_shader_engines; i++) {
> +				for (j = 0; j < pcu_info->num_shader_arrays_per_engine; j++) {
> +					for (k = 0; k < pcu_info->num_cu_per_sh; k += pcache_info[ct].num_cu_shared) {
> +
> +						ret = fill_in_l1_pcache(&props_ext, pcache_info, pcu_info,
> +										pcu_info->cu_bitmap[i % 4][j + i / 4], ct,
> +										cu_processor_id, k);
> +
> +						if (ret < 0)
> +							break;
> +
> +						if (!ret) {
> +							num_of_entries++;
> +							list_add_tail(&props_ext->list, &dev->cache_props_ext);
> +						}
> +
> +						/* Move to next CU block */
> +						num_cu_shared = ((k + pcache_info[ct].num_cu_shared) <=
> +							pcu_info->num_cu_per_sh) ?
> +							pcache_info[ct].num_cu_shared :
> +							(pcu_info->num_cu_per_sh - k);
> +						cu_processor_id += num_cu_shared;
> +					}
> +				}
> +			}
> +		} else {
> +			ret = fill_in_l2_l3_pcache(&props_ext, pcache_info,
> +								pcu_info, ct, cu_processor_id);
> +
> +			if (ret < 0)
> +				break;
> +
> +			if (!ret) {
> +				num_of_entries++;
> +				list_add_tail(&props_ext->list, &dev->cache_props_ext);
> +			}
> +		}
> +	}
> +	pr_debug("Added [%d] GPU cache entries\n", num_of_entries);
> +	return 0;
> +}
> +
>   int kfd_topology_add_device(struct kfd_dev *gpu)
>   {
>   	uint32_t gpu_id;
> @@ -1759,6 +2986,7 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
>   			topology_crat_proximity_domain--;
>   			return res;
>   		}
> +
>   		res = kfd_parse_crat_table(crat_image,
>   					   &temp_topology_device_list,
>   					   proximity_domain);
> @@ -1771,23 +2999,27 @@ int kfd_topology_add_device(struct kfd_dev *gpu)
>   
>   		kfd_topology_update_device_list(&temp_topology_device_list,
>   			&topology_device_list);
> +		up_write(&topology_lock);
> +
> +		dev = kfd_assign_gpu(gpu);
> +		if (WARN_ON(!dev)) {
> +			res = -ENODEV;
> +			goto err;
> +		}
> +
> +		down_write(&topology_lock);
> +		kfd_fill_cache_non_crat_info(dev, gpu);
>   
>   		/* Update the SYSFS tree, since we added another topology
>   		 * device
>   		 */
>   		res = kfd_topology_update_sysfs();
>   		up_write(&topology_lock);
> -
>   		if (!res)
>   			sys_props.generation_count++;
>   		else
>   			pr_err("Failed to update GPU (ID: 0x%x) to sysfs topology. res=%d\n",
>   						gpu_id, res);
> -		dev = kfd_assign_gpu(gpu);
> -		if (WARN_ON(!dev)) {
> -			res = -ENODEV;
> -			goto err;
> -		}
>   	}
>   
>   	dev->gpu_id = gpu_id;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> index dc4e239c8f8f..fc35fe9fa914 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
> @@ -103,6 +103,25 @@ struct kfd_cache_properties {
>   	struct attribute	attr;
>   };
>   
> +#define VCRAT_SIBLINGMAP_SIZE 64
> +
> +/* for GPUs with more CUs */
> +struct kfd_cache_properties_ext {
> +	struct list_head	list;
> +	uint32_t		processor_id_low;
> +	uint32_t		cache_level;
> +	uint32_t		cache_size;
> +	uint32_t		cacheline_size;
> +	uint32_t		cachelines_per_tag;
> +	uint32_t		cache_assoc;
> +	uint32_t		cache_latency;
> +	uint32_t		cache_type;
> +	uint8_t			sibling_map[VCRAT_SIBLINGMAP_SIZE];
> +	struct kfd_dev		*gpu;
> +	struct kobject		*kobj;
> +	struct attribute	attr;
> +};
> +
>   struct kfd_iolink_properties {
>   	struct list_head	list;
>   	uint32_t		iolink_type;
> @@ -139,6 +158,7 @@ struct kfd_topology_device {
>   	struct list_head		mem_props;
>   	uint32_t			cache_count;
>   	struct list_head		cache_props;
> +	struct list_head		cache_props_ext;
>   	struct list_head		io_link_props;
>   	struct list_head		p2p_link_props;
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
> @@ -148,6 +168,7 @@ struct kfd_topology_device {
>   	struct kobject			*kobj_node;
>   	struct kobject			*kobj_mem;
>   	struct kobject			*kobj_cache;
> +	struct kobject			*kobj_cache_ext;
>   	struct kobject			*kobj_iolink;
>   	struct kobject			*kobj_p2plink;
>   #ifdef HAVE_AMD_IOMMU_PC_SUPPORTED
