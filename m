Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CF6090BA
	for <lists+amd-gfx@lfdr.de>; Sun, 23 Oct 2022 03:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E031110E046;
	Sun, 23 Oct 2022 01:50:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B8410E046;
 Sun, 23 Oct 2022 01:50:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH2/5ZnPVn6T/ln2noukIjfZTkPTvgLbB2fTEwsLy0xXCohj8FpafwtHciVMsJmhhTjwBO2lcfs1mJXR4Ue63DziEBL38KpYt9USR3zJbhdA3DJW74vJlo0mFLhLHjO58zXw/HhLiAIOZ2+EAXR1b466B2pSXnhzumr7Us113MexS/p4tAqbXACQn4ZXSf1iXS56QMyc0zJaLessaA1hBi6ocJS7mdnHHEQ05DXBQL4ve/Av9yuJGOGO9CkmgaYaro4+Ado64uJPkIOsgZQbzbjh7PUoellMkkDixEQ5ZEmpPLE6WGtTqv1q3nV0LZ6RKRS1jRXtLeGANtfE+V0FQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBD9+Req1zYhhQrQuts/qPotu7n+TI599fpPA3xxKA0=;
 b=MJ8L1EVrJUiAUJK9su8DdIYfr45PlPT+DeJV4GHE70/y33EK0mUhnYed+seCFInjrH1ArvnhHvKL+PzZU50wHf+XZxSvIdkenvkly+nRWQaee7M7XQ9+EW6b/J0HXwhiERec5PyNqa627MloexDfZwcveb/bpvQDurImGCfzGdpfSt2BprH5SPRAAytDKN7QmBknQwK+z1aSLHTkxJo27naiVE/FCP8zH1RSt7gMO0mZzRR4kVMP4NFK9wQ5vDDFtcHqLgUiwfax4AuWViqnoDwLtCFjgqNgaU4fZH1rBTojEhwhtwv6KCuB1gFQ+0V9/MRGktnWsib7WYOyIDtE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBD9+Req1zYhhQrQuts/qPotu7n+TI599fpPA3xxKA0=;
 b=zhl1aRsEkApI1TI2nhUDRPKJcaEj+g60gepLfoPvXyHBHFagg9zmvHJx5ng6jU512xvNjmi7vroU85FsrlxHfmq9pLJ29E8l7o5xroTyp+M2po2zDmwXGBRT4QXByGaj92bNvKVHV8dBwCJobqa9bMNCeqnSK30BwkOpJbYAOXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.26; Sun, 23 Oct 2022 01:50:48 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.021; Sun, 23 Oct 2022
 01:50:48 +0000
Message-ID: <55db8072-29e8-c567-34c4-ad9c6bd66cea@amd.com>
Date: Sat, 22 Oct 2022 21:50:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 06/13] drm/amdgpu: cleanup scheduler job initialization
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221014084641.128280-1-christian.koenig@amd.com>
 <20221014084641.128280-7-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221014084641.128280-7-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::12) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ad3043-90f4-417a-77cc-08dab49901be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urQrLUqtlFQRjk/ssTvN5PTAWaxLOtl7/cOlYE7cJYuSUQsRScvyw1CqNw3kft35WmwkEL7bSPtoahTrI37iiM+8hvTNpk8PSIBzxy0DCaOygQOvcCgXYQdZjTVJ6hhbQ8F9o8Wnp0mHrg3d8+2tL4Ld4yjztdW6n1IL2urBTq9BO3POlrTGRZWK96TrC6LdQwpFmdYzQP0RcHnyA3wxo7H+kNcPH3qiJLyDGzssKkmy30p6KYYw1OYjS1jTer3Zyyb50pwKiEhTkIJBrIcj1Ys/ckYVDN6giLyEV0XojXGEVNvhE4gx/VKCFY71bIKLjHMqFepIOkP6HflezmlktwFLFRIKddQsq3KNaulBaOk4Y2P1rC5Kzy1DKOrLo/m3K2W8E/Ypu30VjyxQBaEe+RhhuQMY32MOfm0wy+V7Yrosvh2hlhCyVE/Ar3ow9bqyPg9FLKlaCb9ZMxSCvuGmuHdnFaLsOetWpgAwRw5dMv7VUr3AG4Fm5ZpvpbMcgY55mb0Z/I3KTW7bMppUls/X1gEbhQHdML8BDFUsyTXPRqeELCVHrPGoXNG1OIofVvb5pj21CuHbLZtcTFkwBKYltykynwaXS4zIyDK4y9VhiRmFrQHXRGHW4ai4QsamajAa1aYVV7LE3OWCcWmc1f39no2O848TW2r/SQxFv0bGM+y8fiHsgoCBu2g90Z78teb0jelcfpu0HoY2eAIFymgH8YRSngR7bsXfvcXczmrSEMD6fgvF0R7kgPbcGSbOnH1fBaI8/3QdXcti2W+XcULTkXhn7MaW9GaX5QnF7Fiqbf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(366004)(136003)(39860400002)(451199015)(66946007)(66574015)(38100700002)(36756003)(86362001)(6666004)(83380400001)(31696002)(66476007)(31686004)(8676002)(2616005)(44832011)(30864003)(6486002)(2906002)(478600001)(6512007)(4001150100001)(5660300002)(26005)(8936002)(4326008)(316002)(53546011)(186003)(41300700001)(6506007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUdXNWJGLzRPTThpNGFQcDBiYmVEcHVPU2JSbUVCQlJIM3hDMDdxc2VubktY?=
 =?utf-8?B?Z2lZWHo0NmdUeWxEaWtqRWE2bVN5MG94c1AveTJzQ2JCQjhSZTYrSWNXbW8v?=
 =?utf-8?B?a2JvQnQzeXlQMkswNThJcGtvMXpJeFlKdEphS3cvbUNRemV1akRsZEdUNnFQ?=
 =?utf-8?B?TnQ5VTBKNnZlckgrYkcvL3IvUUJRZ3VjZDd2NWI4OERoWm5lanp6a3RSR1py?=
 =?utf-8?B?bHNIQi80N2ZEdllFeG4yMUoxc1cya04zWENjSWZwMHlieGlKMXNxM20xWTJS?=
 =?utf-8?B?dGJHQ1VXN2E4MjhjZFp5TU1Ob3IzKytKNmRibnFHZkp0OVlEN2E3SmxTOEQ1?=
 =?utf-8?B?VytObXh1Smh0Q2ZZcFFDVzhkMjhhL2ZaVituNFA5dUZsMm9nbWhsREl3ZjFZ?=
 =?utf-8?B?anBGWVg5eG5lSW90c1VnejNDRkJzTkhOekk0ZEVGK2l1cDJ6UzBmYzBUMXpu?=
 =?utf-8?B?Si9DQStCYTJrM2U3WHViY1JhTzZwbnA4Z3k1N2k4akc3WlFFbUJ3bWJNaHVT?=
 =?utf-8?B?ZFlWR1NZSmZ1ck84ckh4ckpTbElUNFgxYit4dTBET1hSMFhGbFNyYjA2K20y?=
 =?utf-8?B?eWpmVGY0d0FNdENEOEg2NHVxRHJhTmpseU9vSEpPRGxiTDQyR1dvdWZqRHdz?=
 =?utf-8?B?b3BxOUM3NllsUFVxbXBYNW4zTzhRNlZjWGNBR2FhbldkVGppQ3NXS2o5MHR2?=
 =?utf-8?B?aFM3akhCc1hCTmc5M003d0QrNlJiZ1l5OE9KQnNPN2JZZXZrZHNvNjhiRkdM?=
 =?utf-8?B?WWxtTU92Nk1qY2pwWVl3OWgvZGlpeVNIU0NyVkVrbE9aNGtTTmdoeEJvMzF3?=
 =?utf-8?B?L2c3SHVMTEhKdGNaa0NQamk4anliU1IxT0lzdG1rcjlqb1dIVFY5cDJ0TW5U?=
 =?utf-8?B?Vk0rYitwU0FXTGt6UWpmMnEzRHFZQ21EWUtTM0lPcnViYVM2dVNWTlhLTXdh?=
 =?utf-8?B?Q0w4d1NwcDdQcW03V0J6cW1SempSN2hTbSt0eEVDVFd0QXdUVzhrMDM3QzYv?=
 =?utf-8?B?dmNPZDM1SEFRbXVkQ2s0S243SjdLL2ZVN0JjODY5c1craFM5QlhCQ05GbkJw?=
 =?utf-8?B?OGVIQkJCYTZZeUljQWRqcGduUmNLQWZxeWp6S3B5ZXBPQzgwTTFkQlJBU1BJ?=
 =?utf-8?B?cCs2MmYwYUJWM2k1a2VseTFOeWpzdEhRL01WUXFlL0dOczZ5K3luSDNGdHR0?=
 =?utf-8?B?aEx5U1Z1dmVYdzJRdlFvbEFOYktPb3RpU3dVdnVnUnJzYjByZmg5NEx5bjR0?=
 =?utf-8?B?RzV4UndBL04ydGtid083S1FkWW5tN28rU0xkWGRhemNZOHUwYWtFak4wbkQz?=
 =?utf-8?B?S21sb1BXbDRNNGYzd2s4MkJHR2QxWGhPMlZCYWo4NlhGSHB4TlBIQ2xsTzNR?=
 =?utf-8?B?MVJEcXpBazl5QTBvQVdQbGNyNmpvZThzdEpzTUdJdFd6UXpUZmpnK0xNR3hF?=
 =?utf-8?B?dDJITk81Tll6MmFDcTlTTjQ4OEdRTHIxSXZHK3R0bkF3RXNKeElWZDV6OWl3?=
 =?utf-8?B?ckhCNHhhWmgrOEZxbU94c2pVNXpCbEJra3MzWnVaT1RZVkFtZlRLWHNKdldy?=
 =?utf-8?B?clRFUWtnUU9lS0NwTk1kQkxYUUExSWNCNFBOOVJzWGo3NDYweVFpdmtFdUx3?=
 =?utf-8?B?bGZsY3kwRVlwNmg1U1p6OVBLY0RaWE96aWhtbDNFcVRNSGJDam9XT2tERGdT?=
 =?utf-8?B?bWlSN3M4MUtxYW5ycm1IYW5IZlhKWWhmemU0dW5GL3ZLYmEvRUZldFhESWV4?=
 =?utf-8?B?TjJiVDBUVlJZeXF5OU9McjdKc2xuUVZnNTJUbWFPNDZxd3docElPMFczYldJ?=
 =?utf-8?B?Und4VFZXZXZNbm1ZRGluVVo2cE11dTNZdVFwdVNuUm1TUk9hTTRkUXk0L2Ro?=
 =?utf-8?B?ZFZ3djZlRE0wVU9CRnkreTgwa0oxSkY3OWU1b0d3SU5KcVBUV0dvZzRoY05P?=
 =?utf-8?B?Z25NVkpUT1laNXg3K1E0am8wUzcvR3NBUjNrd2RsRlUzU2pMaldjdGV1azl2?=
 =?utf-8?B?dGdGRVFlZkFoWmE1M2s0NUc2b0VZRzZjU25RT01IM3hZR2dXQTMyZTJGd0pO?=
 =?utf-8?B?U0tSeXJ5bnV2U1V6QkFUcVJpOFlkNmt2MzhkejB5ZFlxTEhsSGtMR0pLOWR3?=
 =?utf-8?Q?zBVx9Cgq0F/DYvfBt1re9Y+B1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ad3043-90f4-417a-77cc-08dab49901be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2022 01:50:48.0477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAHZyVtV0QvNiUr6QIEPLgBOTRwNwI0EYRF1Lzk53oxwLrG/c/ix3rIR7RAdcw4T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2022-10-14 04:46, Christian König wrote:
> Init the DRM scheduler base class while allocating the job.
> 
> This makes the whole handling much more cleaner.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  8 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     | 44 ++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     | 14 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c    |  7 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 56 +++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c     |  9 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     | 13 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c     | 22 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 61 +++++++++++----------
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c      | 12 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c       |  8 +--
>  drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c       | 14 +++--
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c    | 17 ++----
>  14 files changed, 137 insertions(+), 150 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 0561812aa0a4..046d466b4ee4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -673,7 +673,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device *adev,
>  		goto err;
>  	}
>  
> -	ret = amdgpu_job_alloc(adev, 1, &job, NULL);
> +	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1bbd39b3b0fc..aa6f6c428dbc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -291,12 +291,8 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>  		return -EINVAL;
>  
>  	for (i = 0; i < p->gang_size; ++i) {
> -		ret = amdgpu_job_alloc(p->adev, num_ibs[i], &p->jobs[i], vm);
> -		if (ret)
> -			goto free_all_kdata;
> -
> -		ret = drm_sched_job_init(&p->jobs[i]->base, p->entities[i],
> -					 &fpriv->vm);
> +		ret = amdgpu_job_alloc(p->adev, vm, p->entities[i], vm,
> +				       num_ibs[i], &p->jobs[i]);
>  		if (ret)
>  			goto free_all_kdata;
>  	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index e187dc0ab898..5c69461ab3e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -88,8 +88,9 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	return DRM_GPU_SCHED_STAT_NOMINAL;
>  }
>  
> -int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
> -		     struct amdgpu_job **job, struct amdgpu_vm *vm)
> +int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> +		     struct drm_sched_entity *entity, void *owner,
> +		     unsigned num_ibs, struct amdgpu_job **job)

Checkpatch.pl complains about "unsigned" and wants "unsigned int" here.

>  {
>  	if (num_ibs == 0)
>  		return -EINVAL;
> @@ -110,23 +111,30 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
>  	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
>  	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
>  
> -	return 0;
> +	if (!entity)
> +		return 0;
> +
> +	return drm_sched_job_init(&(*job)->base, entity, owner);
>  }
>  
> -int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
> -		enum amdgpu_ib_pool_type pool_type,
> -		struct amdgpu_job **job)
> +int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> +			     struct drm_sched_entity *entity, void *owner,
> +			     unsigned size, enum amdgpu_ib_pool_type pool_type,

Here also, "unsigned int".

> +			     struct amdgpu_job **job)
>  {
>  	int r;
>  
> -	r = amdgpu_job_alloc(adev, 1, job, NULL);
> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
>  	if (r)
>  		return r;
>  
>  	(*job)->num_ibs = 1;
>  	r = amdgpu_ib_get(adev, NULL, size, pool_type, &(*job)->ibs[0]);
> -	if (r)
> +	if (r) {
> +		if (entity)
> +			drm_sched_job_cleanup(&(*job)->base);
>  		kfree(*job);
> +	}
>  
>  	return r;
>  }
> @@ -190,6 +198,9 @@ void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
>  
>  void amdgpu_job_free(struct amdgpu_job *job)
>  {
> +	if (job->base.entity)
> +		drm_sched_job_cleanup(&job->base);
> +
>  	amdgpu_job_free_resources(job);
>  	amdgpu_sync_free(&job->sync);
>  	amdgpu_sync_free(&job->sched_sync);
> @@ -202,25 +213,16 @@ void amdgpu_job_free(struct amdgpu_job *job)
>  		dma_fence_put(&job->hw_fence);
>  }
>  
> -int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
> -		      void *owner, struct dma_fence **f)
> +struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job)
>  {
> -	int r;
> -
> -	if (!f)
> -		return -EINVAL;
> -
> -	r = drm_sched_job_init(&job->base, entity, owner);
> -	if (r)
> -		return r;
> +	struct dma_fence *f;
>  
>  	drm_sched_job_arm(&job->base);
> -
> -	*f = dma_fence_get(&job->base.s_fence->finished);
> +	f = dma_fence_get(&job->base.s_fence->finished);
>  	amdgpu_job_free_resources(job);
>  	drm_sched_entity_push_job(&job->base);
>  
> -	return 0;
> +	return f;
>  }
>  
>  int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> index ab7b150e5d50..f099210c386a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> @@ -78,18 +78,20 @@ static inline struct amdgpu_ring *amdgpu_job_ring(struct amdgpu_job *job)
>  	return to_amdgpu_ring(job->base.entity->rq->sched);
>  }
>  
> -int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
> -		     struct amdgpu_job **job, struct amdgpu_vm *vm);
> -int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev, unsigned size,
> -		enum amdgpu_ib_pool_type pool, struct amdgpu_job **job);
> +int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> +		     struct drm_sched_entity *entity, void *owner,
> +		     unsigned num_ibs, struct amdgpu_job **job);
> +int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
> +			     struct drm_sched_entity *entity, void *owner,
> +			     unsigned size, enum amdgpu_ib_pool_type pool_type,
> +			     struct amdgpu_job **job);

"unsigned int" correspondingly in the chunk above.

>  void amdgpu_job_set_resources(struct amdgpu_job *job, struct amdgpu_bo *gds,
>  			      struct amdgpu_bo *gws, struct amdgpu_bo *oa);
>  void amdgpu_job_free_resources(struct amdgpu_job *job);
>  void amdgpu_job_set_gang_leader(struct amdgpu_job *job,
>  				struct amdgpu_job *leader);
>  void amdgpu_job_free(struct amdgpu_job *job);
> -int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
> -		      void *owner, struct dma_fence **f);
> +struct dma_fence *amdgpu_job_submit(struct amdgpu_job *job);
>  int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
>  			     struct dma_fence **fence);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 518eb0e40d32..de182bfcf85f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -150,14 +150,15 @@ static int amdgpu_jpeg_dec_set_reg(struct amdgpu_ring *ring, uint32_t handle,
>  	const unsigned ib_size_dw = 16;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> +				     AMDGPU_IB_POOL_DIRECT, &job);
>  	if (r)
>  		return r;
>  
>  	ib = &job->ibs[0];
>  
> -	ib->ptr[0] = PACKETJ(adev->jpeg.internal.jpeg_pitch, 0, 0, PACKETJ_TYPE0);
> +	ib->ptr[0] = PACKETJ(adev->jpeg.internal.jpeg_pitch, 0, 0,
> +			     PACKETJ_TYPE0);
>  	ib->ptr[1] = 0xDEADBEEF;
>  	for (i = 2; i < 16; i += 2) {
>  		ib->ptr[i] = PACKETJ(0, 0, 0, PACKETJ_TYPE6);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index f898e870d157..30edb05e0d25 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -189,7 +189,6 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	struct amdgpu_device *adev = ring->adev;
>  	unsigned offset, num_pages, num_dw, num_bytes;
>  	uint64_t src_addr, dst_addr;
> -	struct dma_fence *fence;
>  	struct amdgpu_job *job;
>  	void *cpu_addr;
>  	uint64_t flags;
> @@ -229,7 +228,9 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
>  	num_bytes = num_pages * 8 * AMDGPU_GPU_PAGES_IN_CPU_PAGE;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4 + num_bytes,
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     num_dw * 4 + num_bytes,
>  				     AMDGPU_IB_POOL_DELAYED, &job);
>  	if (r)
>  		return r;
> @@ -269,18 +270,8 @@ static int amdgpu_ttm_map_buffer(struct ttm_buffer_object *bo,
>  		}
>  	}
>  
> -	r = amdgpu_job_submit(job, &adev->mman.entity,
> -			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
> -	if (r)
> -		goto error_free;
> -
> -	dma_fence_put(fence);
> -
> -	return r;
> -
> -error_free:
> -	amdgpu_job_free(job);
> -	return r;
> +	dma_fence_put(amdgpu_job_submit(job));
> +	return 0;
>  }
>  
>  /**
> @@ -1432,7 +1423,8 @@ static void amdgpu_ttm_vram_mm_access(struct amdgpu_device *adev, loff_t pos,
>  }
>  
>  static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
> -					unsigned long offset, void *buf, int len, int write)
> +					unsigned long offset, void *buf,
> +					int len, int write)
>  {
>  	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
> @@ -1456,26 +1448,27 @@ static int amdgpu_ttm_access_memory_sdma(struct ttm_buffer_object *bo,
>  		memcpy(adev->mman.sdma_access_ptr, buf, len);
>  
>  	num_dw = ALIGN(adev->mman.buffer_funcs->copy_num_dw, 8);
> -	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4, AMDGPU_IB_POOL_DELAYED, &job);
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     num_dw * 4, AMDGPU_IB_POOL_DELAYED,
> +				     &job);
>  	if (r)
>  		goto out;
>  
>  	amdgpu_res_first(abo->tbo.resource, offset, len, &src_mm);
> -	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) + src_mm.start;
> +	src_addr = amdgpu_ttm_domain_start(adev, bo->resource->mem_type) +
> +		src_mm.start;
>  	dst_addr = amdgpu_bo_gpu_offset(adev->mman.sdma_access_bo);
>  	if (write)
>  		swap(src_addr, dst_addr);
>  
> -	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr, PAGE_SIZE, false);
> +	amdgpu_emit_copy_buffer(adev, &job->ibs[0], src_addr, dst_addr,
> +				PAGE_SIZE, false);
>  
>  	amdgpu_ring_pad_ib(adev->mman.buffer_funcs_ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
>  
> -	r = amdgpu_job_submit(job, &adev->mman.entity, AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
> -	if (r) {
> -		amdgpu_job_free(job);
> -		goto out;
> -	}
> +	fence = amdgpu_job_submit(job);
>  
>  	if (!dma_fence_wait_timeout(fence, false, adev->sdma_timeout))
>  		r = -ETIMEDOUT;
> @@ -1974,7 +1967,9 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
>  		AMDGPU_IB_POOL_DELAYED;
>  	int r;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, num_dw * 4, pool, job);
> +	r = amdgpu_job_alloc_with_ib(adev, &adev->mman.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     num_dw * 4, pool, job);
>  	if (r)
>  		return r;
>  
> @@ -2033,8 +2028,7 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>  	if (direct_submit)
>  		r = amdgpu_job_submit_direct(job, ring, fence);
>  	else
> -		r = amdgpu_job_submit(job, &adev->mman.entity,
> -				      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
> +		*fence = amdgpu_job_submit(job);
>  	if (r)
>  		goto error_free;
>  
> @@ -2079,16 +2073,8 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring, uint32_t src_data,
>  
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
>  	WARN_ON(job->ibs[0].length_dw > num_dw);
> -	r = amdgpu_job_submit(job, &adev->mman.entity,
> -			      AMDGPU_FENCE_OWNER_UNDEFINED, fence);
> -	if (r)
> -		goto error_free;
> -
> +	*fence = amdgpu_job_submit(job);
>  	return 0;
> -
> -error_free:
> -	amdgpu_job_free(job);
> -	return r;
>  }
>  
>  int amdgpu_fill_buffer(struct amdgpu_bo *bo,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index 6eac649499d3..8baddf79635b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1132,7 +1132,9 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  	unsigned offset_idx = 0;
>  	unsigned offset[3] = { UVD_BASE_SI, 0, 0 };
>  
> -	r = amdgpu_job_alloc_with_ib(adev, 64, direct ? AMDGPU_IB_POOL_DIRECT :
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->uvd.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     64, direct ? AMDGPU_IB_POOL_DIRECT :
>  				     AMDGPU_IB_POOL_DELAYED, &job);
>  	if (r)
>  		return r;
> @@ -1181,10 +1183,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
>  		if (r)
>  			goto err_free;
>  
> -		r = amdgpu_job_submit(job, &adev->uvd.entity,
> -				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
> -		if (r)
> -			goto err_free;
> +		f = amdgpu_job_submit(job);
>  	}
>  
>  	amdgpu_bo_reserve(bo, true);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 02cb3a12dd76..b239e874f2d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -450,8 +450,10 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	uint64_t addr;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -				     AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> +				     &job);
>  	if (r)
>  		return r;
>  
> @@ -538,7 +540,9 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	struct dma_fence *f = NULL;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     ib_size_dw * 4,
>  				     direct ? AMDGPU_IB_POOL_DIRECT :
>  				     AMDGPU_IB_POOL_DELAYED, &job);
>  	if (r)
> @@ -570,8 +574,7 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
>  	if (direct)
>  		r = amdgpu_job_submit_direct(job, ring, &f);
>  	else
> -		r = amdgpu_job_submit(job, &ring->adev->vce.entity,
> -				      AMDGPU_FENCE_OWNER_UNDEFINED, &f);
> +		f = amdgpu_job_submit(job);
>  	if (r)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 0b52af415b28..965b7755cb88 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -600,15 +600,16 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>  				   struct amdgpu_ib *ib_msg,
>  				   struct dma_fence **fence)
>  {
> +	uint64_t addr = AMDGPU_GPU_PAGE_ALIGN(ib_msg->gpu_addr);

"u64" : checkpatch.pl.

>  	struct amdgpu_device *adev = ring->adev;
>  	struct dma_fence *f = NULL;
>  	struct amdgpu_job *job;
>  	struct amdgpu_ib *ib;
> -	uint64_t addr = AMDGPU_GPU_PAGE_ALIGN(ib_msg->gpu_addr);
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, 64,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
> +				     64, AMDGPU_IB_POOL_DIRECT,
> +				     &job);
>  	if (r)
>  		goto err;
>  
> @@ -787,8 +788,9 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>  	if (sq)
>  		ib_size_dw += 8;
>  
> -	r = amdgpu_job_alloc_with_ib(adev, ib_size_dw * 4,
> -				AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
> +				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> +				     &job);
>  	if (r)
>  		goto err;
>  
> @@ -916,8 +918,9 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>  	if (sq)
>  		ib_size_dw += 8;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
> +				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> +				     &job);
>  	if (r)
>  		return r;
>  
> @@ -982,8 +985,9 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>  	if (sq)
>  		ib_size_dw += 8;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
> +				     ib_size_dw * 4, AMDGPU_IB_POOL_DIRECT,
> +				     &job);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> index 69e105fa41f6..126364882d09 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
> @@ -47,6 +47,32 @@ static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
>  	return r;
>  }
>  
> +/* Allocate a new job for @count PTE updates */
> +static int amdgpu_vm_sdma_alloc_job(struct amdgpu_vm_update_params *p,
> +				    unsigned int count)
> +{
> +	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
> +		: AMDGPU_IB_POOL_DELAYED;
> +	struct drm_sched_entity *entity = p->immediate ? &p->vm->immediate
> +		: &p->vm->delayed;
> +	unsigned int ndw;
> +	int r;
> +
> +	/* estimate how many dw we need */
> +	ndw = AMDGPU_VM_SDMA_MIN_NUM_DW;
> +	if (p->pages_addr)
> +		ndw += count * 2;
> +	ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
> +
> +	r = amdgpu_job_alloc_with_ib(p->adev, entity, AMDGPU_FENCE_OWNER_VM,
> +				     ndw * 4, pool, &p->job);
> +	if (r)
> +		return r;
> +
> +	p->num_dw_left = ndw;
> +	return 0;
> +}
> +
>  /**
>   * amdgpu_vm_sdma_prepare - prepare SDMA command submission
>   *
> @@ -61,17 +87,12 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
>  				  struct dma_resv *resv,
>  				  enum amdgpu_sync_mode sync_mode)
>  {
> -	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
> -		: AMDGPU_IB_POOL_DELAYED;
> -	unsigned int ndw = AMDGPU_VM_SDMA_MIN_NUM_DW;
>  	int r;
>  
> -	r = amdgpu_job_alloc_with_ib(p->adev, ndw * 4, pool, &p->job);
> +	r = amdgpu_vm_sdma_alloc_job(p, 0);
>  	if (r)
>  		return r;
>  
> -	p->num_dw_left = ndw;
> -
>  	if (!resv)
>  		return 0;
>  
> @@ -91,20 +112,16 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>  				 struct dma_fence **fence)
>  {
>  	struct amdgpu_ib *ib = p->job->ibs;
> -	struct drm_sched_entity *entity;
>  	struct amdgpu_ring *ring;
>  	struct dma_fence *f;
> -	int r;
>  
> -	entity = p->immediate ? &p->vm->immediate : &p->vm->delayed;
> -	ring = container_of(entity->rq->sched, struct amdgpu_ring, sched);
> +	ring = container_of(p->vm->delayed.rq->sched, struct amdgpu_ring,
> +			    sched);
>  
>  	WARN_ON(ib->length_dw == 0);
>  	amdgpu_ring_pad_ib(ring, ib);
>  	WARN_ON(ib->length_dw > p->num_dw_left);
> -	r = amdgpu_job_submit(p->job, entity, AMDGPU_FENCE_OWNER_VM, &f);
> -	if (r)
> -		goto error;
> +	f = amdgpu_job_submit(p->job);
>  
>  	if (p->unlocked) {
>  		struct dma_fence *tmp = dma_fence_get(f);
> @@ -127,10 +144,6 @@ static int amdgpu_vm_sdma_commit(struct amdgpu_vm_update_params *p,
>  	}
>  	dma_fence_put(f);
>  	return 0;
> -
> -error:
> -	amdgpu_job_free(p->job);
> -	return r;
>  }
>  
>  /**
> @@ -210,8 +223,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  				 uint64_t flags)
>  {
>  	struct amdgpu_bo *bo = &vmbo->bo;
> -	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
> -		: AMDGPU_IB_POOL_DELAYED;
>  	struct dma_resv_iter cursor;
>  	unsigned int i, ndw, nptes;
>  	struct dma_fence *fence;
> @@ -238,19 +249,9 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
>  			if (r)
>  				return r;
>  
> -			/* estimate how many dw we need */
> -			ndw = 32;
> -			if (p->pages_addr)
> -				ndw += count * 2;
> -			ndw = max(ndw, AMDGPU_VM_SDMA_MIN_NUM_DW);
> -			ndw = min(ndw, AMDGPU_VM_SDMA_MAX_NUM_DW);
> -
> -			r = amdgpu_job_alloc_with_ib(p->adev, ndw * 4, pool,
> -						     &p->job);
> +			r = amdgpu_vm_sdma_alloc_job(p, count);
>  			if (r)
>  				return r;
> -
> -			p->num_dw_left = ndw;
>  		}
>  
>  		if (!p->pages_addr) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index f513e2c2e964..657e53708248 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -371,7 +371,9 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	 * translation. Avoid this by doing the invalidation from the SDMA
>  	 * itself.
>  	 */
> -	r = amdgpu_job_alloc_with_ib(adev, 16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
> +	r = amdgpu_job_alloc_with_ib(ring->adev, &adev->mman.entity,
> +				     AMDGPU_FENCE_OWNER_UNDEFINED,
> +				     16 * 4, AMDGPU_IB_POOL_IMMEDIATE,
>  				     &job);
>  	if (r)
>  		goto error_alloc;
> @@ -380,10 +382,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  	job->vm_needs_flush = true;
>  	job->ibs->ptr[job->ibs->length_dw++] = ring->funcs->nop;
>  	amdgpu_ring_pad_ib(ring, &job->ibs[0]);
> -	r = amdgpu_job_submit(job, &adev->mman.entity,
> -			      AMDGPU_FENCE_OWNER_UNDEFINED, &fence);
> -	if (r)
> -		goto error_submit;
> +	fence = amdgpu_job_submit(job);
>  
>  	mutex_unlock(&adev->mman.gtt_window_lock);
>  
> @@ -392,9 +391,6 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  
>  	return;
>  
> -error_submit:
> -	amdgpu_job_free(job);
> -
>  error_alloc:
>  	mutex_unlock(&adev->mman.gtt_window_lock);
>  	DRM_ERROR("Error flushing GPU TLB using the SDMA (%d)!\n", r);
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> index 375c440957dc..5fe872f4bea7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -216,8 +216,8 @@ static int uvd_v6_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>  	uint64_t addr;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> +				     AMDGPU_IB_POOL_DIRECT, &job);
>  	if (r)
>  		return r;
>  
> @@ -280,8 +280,8 @@ static int uvd_v6_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
>  	uint64_t addr;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> +				     AMDGPU_IB_POOL_DIRECT, &job);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> index e668b3baa8c6..1c0210de8455 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
> @@ -213,7 +213,8 @@ static int uvd_v7_0_enc_ring_test_ring(struct amdgpu_ring *ring)
>   *
>   * Open up a stream for HW test
>   */
> -static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
> +static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring,
> +				       uint32_t handle,

"u32" : checkpatch.pl.

>  				       struct amdgpu_bo *bo,
>  				       struct dma_fence **fence)
>  {
> @@ -224,8 +225,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>  	uint64_t addr;
>  	int i, r;
>  
> -	r = amdgpu_job_alloc_with_ib(ring->adev, ib_size_dw * 4,
> -					AMDGPU_IB_POOL_DIRECT, &job);
> +	r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL, ib_size_dw * 4,
> +				     AMDGPU_IB_POOL_DIRECT, &job);
>  	if (r)
>  		return r;
>  
> @@ -276,7 +277,8 @@ static int uvd_v7_0_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t handle
>   *
>   * Close up a stream for HW test or if userspace failed to do so
>   */
> -static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
> +static int uvd_v7_0_enc_get_destroy_msg(struct amdgpu_ring *ring,
> +					uint32_t handle,

"u32" : checkpatch.pl.

Regards,
Luben

