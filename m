Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D34E46659F
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Dec 2021 15:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29136E0DF;
	Thu,  2 Dec 2021 14:44:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E316E0DF
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Dec 2021 14:44:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDn+VKS2LJ/VGQ2UUqL7SgzOzwLKJjulgPlY+dmC6P4RuvwwA+YjzHMGvn1r1IsOoVk3VA9OHgV1UIvxCLB2FJqty/9LwkKdFUJiYuLcG+UIwemEOhcyH2LiU0Fe4E0zMV5r59T1znfkwtsb8gDsyF/7yPgNBk7KXTArVeDG06+H6cQ6TkT5ZoZLBfpZyXzoJEaiPQ9MBP05pUp7LSVvmSr7SVumzzZImF2IR9u4KGMNQJUX3FBlbemYhW7R0hhSd8W3DZqSiOErBM0l6kJsYtf/PkK+ijO6r/CSeb7sKGz1dpy/amvn/IbidSU05Yjhc9xJCWpjf598o74gpd5lzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6J6DBM9BzfCiEPhjqfvPhIfy620VH4YU8WAj37ZTtCM=;
 b=jngN3N1BvNE+spNH5JxMhzwplGBJQiLUM2cRKgiL9Bf+P248U7qVvenW/9WCNRQbKs9YHPOiPTIeviEhOPbswDSXysLuIzkxz/WiYySVvLFpQTNJpz4HCzpt7XjNFozMhIpPSGrB1S8Istj2Xeu9JLPAaKrnL9yBZn4SnGaIoiTkRem99M0FECTFTaLBGJOYdilPflF/nVwO8aTWLnJveBE/bmH2QN1n0wn7A2tXT0A0HitUztpQnfg2Zf58R7PZCGGGLEzvb7rCbQWEaRnKnTSJ0taJHjrxznsdDzrAJejndUs5enfgMsPqdIv+TtnndVQj3Mv3qD8ABPBkthr/9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6J6DBM9BzfCiEPhjqfvPhIfy620VH4YU8WAj37ZTtCM=;
 b=lp5IQX80gyyYLpI3mIZc3nh4SmcUnSLZKlicBVE9Dv54fwAUxgC+2LU0VYCbEE03LhvLPYgtePGT1xcDSBhbcqF1fo+W80kFg7Qi1o0WFOvJTBj1oLNwBlQJc4d2RQmX8mdIE+bm10/GogJM3o0ikkc2MGwkOyt1L0Lf/4PlUik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19)
 by DM6PR12MB3513.namprd12.prod.outlook.com (2603:10b6:5:18a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 14:29:32 +0000
Received: from DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::41ea:d7dc:f041:633c]) by DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::41ea:d7dc:f041:633c%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 14:29:32 +0000
Message-ID: <cbd852a9-7cec-a854-6d24-e813bf382f94@amd.com>
Date: Thu, 2 Dec 2021 19:59:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 07/17] drm/amd/pm: create a new holder for those APIs
 used only by legacy ASICs(si/kv)
Content-Language: en-US
To: Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20211202030930.1681278-1-evan.quan@amd.com>
 <20211202030930.1681278-8-evan.quan@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20211202030930.1681278-8-evan.quan@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::21) To DM6PR12MB3930.namprd12.prod.outlook.com
 (2603:10b6:5:1c9::19)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 PN3PR01CA0064.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:99::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Thu, 2 Dec 2021 14:29:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84c87a1d-64d5-4d79-370a-08d9b5a02770
X-MS-TrafficTypeDiagnostic: DM6PR12MB3513:
X-Microsoft-Antispam-PRVS: <DM6PR12MB351387DB459B0578931207EF97699@DM6PR12MB3513.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:174;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59YpFtk6+36n72Aqr7pivHsHKaM1Yq48RRl8fLjprtmzsO58VnTVSCs1Boz1u2yBtWM6zmnSnAD/msyRAK1ggKcVOS4JK9SnlV7UVaka9pHouKtMp5xMOdD6bhAWSMbSqhKG/Wa5kbZovs5G/7qKYMsmCVZkgJc0yD4KITWw87LHlUqzKW4F0F1SgZFpw8HuoByHqiT83nQ4gxz26GXBfDvFOkx/iC55A+Ek1gTbsQUNiL3lRXcx3NpmrSJ4mNFNDwTLBJLy96kCvX5p65zc8RUAJ63qm2ddaCIWHqfd0Cw+hlj+Gi6JpMFhh/yJuJBPFD4oxqXDk3+jjXMY737vyaL1JVB5Bx1GxOhV1e7+u+4q9pkwTpcTPowHNqDo2/D/DZ0QwNwuD10k+BANMD2xD4w6s3rzOyE8zakOvlibB6dmVGHSTiQUl2kgxYzgKE+PwCN35Yr3kg3duiHAzWo5/ooNSevtkOLQjXPKdq5C0ztEycACzWHwl4+brbNL/PGxAnjdo4ocoFUcplqBtOHXf8uPUitt7KgnjiUqXZauMf55sIfyjQMdWZrokkvDkvjTN/u7vbLVTb+asuMV7raBVYJ4ebByaOe10WKrQ0Gs4wIfbhhIAxFO5sQLNpEbGBufMssTde4TxMGMq8F0jcHG6ewP6UFOwHgSr8IOj4xBDJTmFy6B0OXjb/ACW2QD/fqAwb82CVgVHulwW6QTQFtK8z4rPLzuugeDuEU5nuXjtxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3930.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(26005)(30864003)(186003)(66556008)(6486002)(5660300002)(38100700002)(16576012)(2906002)(8676002)(8936002)(66476007)(316002)(31696002)(66946007)(6666004)(2616005)(4326008)(86362001)(31686004)(956004)(83380400001)(36756003)(53546011)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDFENDN5SmFRK0dnNFFZMXloWW9XWFZwb2pWdDdOMm5SU0k3N2MvQzZteklO?=
 =?utf-8?B?ZStZN3B4WFh2Rkd6Q1J4R1oyS1hpcUpmQmtiWHBXVGpYWDFnUnNpZmdGMktR?=
 =?utf-8?B?S3FVWXVMMzBDVHNDZmVzVlZ0c0NWVEJLNmc3VEpKZmJobDB2UThJbjg5WjND?=
 =?utf-8?B?Q2pIY3ZmblFMeHh6NHlvMmdsR0lseGxjOHNIanZPdGRuem1LNm94Mk5DUTNU?=
 =?utf-8?B?bTJTYStZanVJdUFKUW5pZXlZb1EvUW9NS0FFYS9ZdTNKajBFcXBsYVluNmcw?=
 =?utf-8?B?Q0plZE12ZFlaZlU4Wml6b3dJRGVBbFRoSUdEcFgvSVdFZy9QbUpCb1N5T0U2?=
 =?utf-8?B?dHdaVmpVdTBYa3BRaWdvbDEwMWhTNWt6MjF0dDI4MG5sNW5MVzlUOXlxL3lS?=
 =?utf-8?B?Y3k5YjN3M2Q5YnVPeW5ubm1kd0VhWFlDR05rd2h0aFlucXQwb21nMzU1ZE5z?=
 =?utf-8?B?S1ltbDdjMkdueFNrUkxvaThiMHlZL2FvR25ZMFg5WkkralY1QjhxRCs0cHla?=
 =?utf-8?B?dUI4TGY0aW5aMkJlcGdybW9HdytpREhEUzZiSzVjSXAxY1VKZ3hmOStRZjRZ?=
 =?utf-8?B?SFBYaktXL2hkRmRaRnNwZzRlUW9HcTFvdHJ1KzZtM1A5MDdCWE1BSG83K3hv?=
 =?utf-8?B?elNUdjJFOTloVm9qVkNCOUpLNW5WemcyQ1l4SHlSdE4zcGJxcEtXMEpKL3I0?=
 =?utf-8?B?REdNZFVNYjFXcEovM0pNSWdXWUpwZlBuMmx6RWdWdkNwTjlFWFZvSVZjNHFE?=
 =?utf-8?B?ZENsN0ExcVFTWU1zNmdXVnpxWk8yVG9mOXhiV0FNNXdYNFhMRnBIY05JTERQ?=
 =?utf-8?B?bG13UEhtYzhJVHdjem1OUmxCSWExNUtuTjV6dEhTUkdoQm9NYnh0Z2ZvdWhC?=
 =?utf-8?B?TG1pV0ErMzFVd2N1UEhaalVoaUpzdjVMMlJZVXJsNmxSdzhhQ2tCVnVEb3kw?=
 =?utf-8?B?dXBIcm1uT3NRNXprK0Q1dkd6aUFua0Y4SDhRTklZZmphVkszMjRTRmFFQmM1?=
 =?utf-8?B?V1hKeGFHMkRaQXE4OE9EMEF0M2FUTjFtaHVzSzVKRDJqdWFKMFZnSERzNEwy?=
 =?utf-8?B?WmZKdk9FcnBMT2t0UzlqY0c4UHZXTVRpRXQvYjAwd2pkc2ZEZHpucklsTjNj?=
 =?utf-8?B?Mk5adEhjbjFVOElhQUI1WGw5WU1KYWRPOG9hU0E2eC9KQ3BtNFhtbUJjVEZO?=
 =?utf-8?B?TGRlR29VakxmeHZxUm5oRUxEcTY1RGUyTEthTmMyT0M4VSs0amxQVEZXa3di?=
 =?utf-8?B?T1l4bEhDclpaeXhpZUIzamcycUZIUmFGYkZNTTJ3QmRka0pkZEVnOG9OZ3FW?=
 =?utf-8?B?cGdhNFVvaUVYc3ZqdzJ4N3BzZVppUEVXQ2RybVBNSGMzb1FNM2hlOTRzVU9t?=
 =?utf-8?B?ZmJMQ1ZUaElIN1E1NGhIdFBoaFhxUlcwTnFOSWJiMDQrWFhLUlpnSzBFS3BW?=
 =?utf-8?B?WWNuengyR1ZmUko4eFYyQ2s1RGRrenRkSHFPeVF2eWljTXBvSUdBcUlkbGpI?=
 =?utf-8?B?Tml0ekh1QkhmV1N5cmFBWjlValNXMEZnQ0JWS2VPZmp0TFFtODRJY3pRODJ1?=
 =?utf-8?B?SUdIQnZ6TXQ5Um9xdGFqN1FpcHBaQXk1MmVaUUhsSGREcUxJK2kxZmlRZGI4?=
 =?utf-8?B?cUFDVWZMR3JwRWIzbkF5YTlkcVVUd2FxcVQyNWI3MG1MNUJBd2ZWMjdvamtq?=
 =?utf-8?B?ekNqdXoxUzYzUXI3M1IwQ0srZHVIcU9tcVhEY2xzUGMyMGdOYWFIQk9Gam9E?=
 =?utf-8?B?SkFDejA1ZFk2bFBhZTBrOSt4MWhDWk1jMHdSRnpvcmtkNUxvRWtWbGg3Mmkr?=
 =?utf-8?B?a09udHJERDVHY0FKdnVEOTdZdEZRdlEreU16R0k0TWxRNVhCTTZxQ0JYWFVX?=
 =?utf-8?B?RjdOOGtTWVg2bkhiNjZYYTFTUDBEWWw5U1ovdzc3NlhIbEtZcldScXhhZGtP?=
 =?utf-8?B?TU9XeWNsK2lwUjhCVzBneWJpajUwNkVOZ2ZQaG56QVhGczZPaGNuR0tOb2ht?=
 =?utf-8?B?VjVjUVhBZERpTUdlZjBSYXZmR0UwbVRJSGRVM0NIQzFiWW9pRHVqTXY3MGRi?=
 =?utf-8?B?OTFmRGNkQm5UcDF6MFVaZS9naUJ4NWFhaFZnemQ5U004S3hKNDFqem9nWEFQ?=
 =?utf-8?Q?Wkmw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c87a1d-64d5-4d79-370a-08d9b5a02770
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3930.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 14:29:32.2399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLFKfcLnH+5H8oU7dY5MtP/DV1l5FnbNScwHNJv0IKQHVC4ymikopBGEg41iS2uC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3513
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
Cc: Alexander.Deucher@amd.com, Kenneth.Feng@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On 12/2/2021 8:39 AM, Evan Quan wrote:
> Those APIs are used only by legacy ASICs(si/kv). They cannot be
> shared by other ASICs. So, we create a new holder for them.
> 
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Change-Id: I555dfa37e783a267b1d3b3a7db5c87fcc3f1556f
> --
> v1->v2:
>    - rename amdgpu_pm_compute_clocks as amdgpu_dpm_compute_clocks(Lijo)
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |    2 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |    2 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |    2 +-
>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |    2 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c  |    2 +-
>   .../gpu/drm/amd/include/kgd_pp_interface.h    |    1 +
>   drivers/gpu/drm/amd/pm/amdgpu_dpm.c           | 1022 +---------------
>   drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   17 +-
>   drivers/gpu/drm/amd/pm/powerplay/Makefile     |    2 +-
>   drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c     |    6 +-
>   drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c | 1024 +++++++++++++++++
>   drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h |   37 +
>   drivers/gpu/drm/amd/pm/powerplay/si_dpm.c     |    6 +-
>   13 files changed, 1089 insertions(+), 1036 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
>   create mode 100644 drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index d1570a462a51..5d5205870861 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2532,7 +2532,7 @@ static void dce_v10_0_crtc_dpms(struct drm_crtc *crtc, int mode)
>   		break;
>   	}
>   	/* adjust pm to dpms */
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   }
>   
>   static void dce_v10_0_crtc_prepare(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 18a7b3bd633b..4d812b22c54f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2608,7 +2608,7 @@ static void dce_v11_0_crtc_dpms(struct drm_crtc *crtc, int mode)
>   		break;
>   	}
>   	/* adjust pm to dpms */
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   }
>   
>   static void dce_v11_0_crtc_prepare(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index c7803dc2b2d5..b90bc2adf778 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2424,7 +2424,7 @@ static void dce_v6_0_crtc_dpms(struct drm_crtc *crtc, int mode)
>   		break;
>   	}
>   	/* adjust pm to dpms */
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   }
>   
>   static void dce_v6_0_crtc_prepare(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 8318ee8339f1..7c1379b02f94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2433,7 +2433,7 @@ static void dce_v8_0_crtc_dpms(struct drm_crtc *crtc, int mode)
>   		break;
>   	}
>   	/* adjust pm to dpms */
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   }
>   
>   static void dce_v8_0_crtc_prepare(struct drm_crtc *crtc)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
> index 46550811da00..75284e2cec74 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_pp_smu.c
> @@ -101,7 +101,7 @@ bool dm_pp_apply_display_requirements(
>   
>   		amdgpu_dpm_display_configuration_change(adev, &adev->pm.pm_display_cfg);
>   
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   	}
>   
>   	return true;
> diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> index 2e295facd086..cdf724dcf832 100644
> --- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> +++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
> @@ -404,6 +404,7 @@ struct amd_pm_funcs {
>   	int (*get_dpm_clock_table)(void *handle,
>   				   struct dpm_clocks *clock_table);
>   	int (*get_smu_prv_buf_details)(void *handle, void **addr, size_t *size);
> +	int (*change_power_state)(void *handle);
>   };
>   
>   struct metrics_table_header {
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> index efe6f8129c06..9b268f300815 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
> @@ -34,113 +34,9 @@
>   
>   #define WIDTH_4K 3840
>   
> -#define amdgpu_dpm_pre_set_power_state(adev) \
> -		((adev)->powerplay.pp_funcs->pre_set_power_state((adev)->powerplay.pp_handle))
> -
> -#define amdgpu_dpm_post_set_power_state(adev) \
> -		((adev)->powerplay.pp_funcs->post_set_power_state((adev)->powerplay.pp_handle))
> -
> -#define amdgpu_dpm_display_configuration_changed(adev) \
> -		((adev)->powerplay.pp_funcs->display_configuration_changed((adev)->powerplay.pp_handle))
> -
> -#define amdgpu_dpm_print_power_state(adev, ps) \
> -		((adev)->powerplay.pp_funcs->print_power_state((adev)->powerplay.pp_handle, (ps)))
> -
> -#define amdgpu_dpm_vblank_too_short(adev) \
> -		((adev)->powerplay.pp_funcs->vblank_too_short((adev)->powerplay.pp_handle))
> -
>   #define amdgpu_dpm_enable_bapm(adev, e) \
>   		((adev)->powerplay.pp_funcs->enable_bapm((adev)->powerplay.pp_handle, (e)))
>   
> -#define amdgpu_dpm_check_state_equal(adev, cps, rps, equal) \
> -		((adev)->powerplay.pp_funcs->check_state_equal((adev)->powerplay.pp_handle, (cps), (rps), (equal)))
> -
> -void amdgpu_dpm_print_class_info(u32 class, u32 class2)
> -{
> -	const char *s;
> -
> -	switch (class & ATOM_PPLIB_CLASSIFICATION_UI_MASK) {
> -	case ATOM_PPLIB_CLASSIFICATION_UI_NONE:
> -	default:
> -		s = "none";
> -		break;
> -	case ATOM_PPLIB_CLASSIFICATION_UI_BATTERY:
> -		s = "battery";
> -		break;
> -	case ATOM_PPLIB_CLASSIFICATION_UI_BALANCED:
> -		s = "balanced";
> -		break;
> -	case ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE:
> -		s = "performance";
> -		break;
> -	}
> -	printk("\tui class: %s\n", s);
> -	printk("\tinternal class:");
> -	if (((class & ~ATOM_PPLIB_CLASSIFICATION_UI_MASK) == 0) &&
> -	    (class2 == 0))
> -		pr_cont(" none");
> -	else {
> -		if (class & ATOM_PPLIB_CLASSIFICATION_BOOT)
> -			pr_cont(" boot");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
> -			pr_cont(" thermal");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_LIMITEDPOWERSOURCE)
> -			pr_cont(" limited_pwr");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_REST)
> -			pr_cont(" rest");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_FORCED)
> -			pr_cont(" forced");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
> -			pr_cont(" 3d_perf");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_OVERDRIVETEMPLATE)
> -			pr_cont(" ovrdrv");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_UVDSTATE)
> -			pr_cont(" uvd");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_3DLOW)
> -			pr_cont(" 3d_low");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_ACPI)
> -			pr_cont(" acpi");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
> -			pr_cont(" uvd_hd2");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
> -			pr_cont(" uvd_hd");
> -		if (class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
> -			pr_cont(" uvd_sd");
> -		if (class2 & ATOM_PPLIB_CLASSIFICATION2_LIMITEDPOWERSOURCE_2)
> -			pr_cont(" limited_pwr2");
> -		if (class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
> -			pr_cont(" ulv");
> -		if (class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
> -			pr_cont(" uvd_mvc");
> -	}
> -	pr_cont("\n");
> -}
> -
> -void amdgpu_dpm_print_cap_info(u32 caps)
> -{
> -	printk("\tcaps:");
> -	if (caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY)
> -		pr_cont(" single_disp");
> -	if (caps & ATOM_PPLIB_SUPPORTS_VIDEO_PLAYBACK)
> -		pr_cont(" video");
> -	if (caps & ATOM_PPLIB_DISALLOW_ON_DC)
> -		pr_cont(" no_dc");
> -	pr_cont("\n");
> -}
> -
> -void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
> -				struct amdgpu_ps *rps)
> -{
> -	printk("\tstatus:");
> -	if (rps == adev->pm.dpm.current_ps)
> -		pr_cont(" c");
> -	if (rps == adev->pm.dpm.requested_ps)
> -		pr_cont(" r");
> -	if (rps == adev->pm.dpm.boot_ps)
> -		pr_cont(" b");
> -	pr_cont("\n");
> -}
> -
>   static void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
>   {
>   	struct drm_device *ddev = adev_to_drm(adev);
> @@ -161,7 +57,6 @@ static void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
>   	}
>   }
>   
> -
>   u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev)
>   {
>   	struct drm_device *dev = adev_to_drm(adev);
> @@ -209,679 +104,6 @@ static u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
>   	return vrefresh;
>   }
>   
> -union power_info {
> -	struct _ATOM_POWERPLAY_INFO info;
> -	struct _ATOM_POWERPLAY_INFO_V2 info_2;
> -	struct _ATOM_POWERPLAY_INFO_V3 info_3;
> -	struct _ATOM_PPLIB_POWERPLAYTABLE pplib;
> -	struct _ATOM_PPLIB_POWERPLAYTABLE2 pplib2;
> -	struct _ATOM_PPLIB_POWERPLAYTABLE3 pplib3;
> -	struct _ATOM_PPLIB_POWERPLAYTABLE4 pplib4;
> -	struct _ATOM_PPLIB_POWERPLAYTABLE5 pplib5;
> -};
> -
> -union fan_info {
> -	struct _ATOM_PPLIB_FANTABLE fan;
> -	struct _ATOM_PPLIB_FANTABLE2 fan2;
> -	struct _ATOM_PPLIB_FANTABLE3 fan3;
> -};
> -
> -static int amdgpu_parse_clk_voltage_dep_table(struct amdgpu_clock_voltage_dependency_table *amdgpu_table,
> -					      ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
> -{
> -	u32 size = atom_table->ucNumEntries *
> -		sizeof(struct amdgpu_clock_voltage_dependency_entry);
> -	int i;
> -	ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;
> -
> -	amdgpu_table->entries = kzalloc(size, GFP_KERNEL);
> -	if (!amdgpu_table->entries)
> -		return -ENOMEM;
> -
> -	entry = &atom_table->entries[0];
> -	for (i = 0; i < atom_table->ucNumEntries; i++) {
> -		amdgpu_table->entries[i].clk = le16_to_cpu(entry->usClockLow) |
> -			(entry->ucClockHigh << 16);
> -		amdgpu_table->entries[i].v = le16_to_cpu(entry->usVoltage);
> -		entry = (ATOM_PPLIB_Clock_Voltage_Dependency_Record *)
> -			((u8 *)entry + sizeof(ATOM_PPLIB_Clock_Voltage_Dependency_Record));
> -	}
> -	amdgpu_table->count = atom_table->ucNumEntries;
> -
> -	return 0;
> -}
> -
> -int amdgpu_get_platform_caps(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> -	union power_info *power_info;
> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> -	u16 data_offset;
> -	u8 frev, crev;
> -
> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> -				   &frev, &crev, &data_offset))
> -		return -EINVAL;
> -	power_info = (union power_info *)(mode_info->atom_context->bios + data_offset);
> -
> -	adev->pm.dpm.platform_caps = le32_to_cpu(power_info->pplib.ulPlatformCaps);
> -	adev->pm.dpm.backbias_response_time = le16_to_cpu(power_info->pplib.usBackbiasTime);
> -	adev->pm.dpm.voltage_response_time = le16_to_cpu(power_info->pplib.usVoltageTime);
> -
> -	return 0;
> -}
> -
> -/* sizeof(ATOM_PPLIB_EXTENDEDHEADER) */
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2 12
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3 14
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4 16
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5 18
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6 20
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7 22
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8 24
> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V9 26
> -
> -int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> -	union power_info *power_info;
> -	union fan_info *fan_info;
> -	ATOM_PPLIB_Clock_Voltage_Dependency_Table *dep_table;
> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> -	u16 data_offset;
> -	u8 frev, crev;
> -	int ret, i;
> -
> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> -				   &frev, &crev, &data_offset))
> -		return -EINVAL;
> -	power_info = (union power_info *)(mode_info->atom_context->bios + data_offset);
> -
> -	/* fan table */
> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
> -		if (power_info->pplib3.usFanTableOffset) {
> -			fan_info = (union fan_info *)(mode_info->atom_context->bios + data_offset +
> -						      le16_to_cpu(power_info->pplib3.usFanTableOffset));
> -			adev->pm.dpm.fan.t_hyst = fan_info->fan.ucTHyst;
> -			adev->pm.dpm.fan.t_min = le16_to_cpu(fan_info->fan.usTMin);
> -			adev->pm.dpm.fan.t_med = le16_to_cpu(fan_info->fan.usTMed);
> -			adev->pm.dpm.fan.t_high = le16_to_cpu(fan_info->fan.usTHigh);
> -			adev->pm.dpm.fan.pwm_min = le16_to_cpu(fan_info->fan.usPWMMin);
> -			adev->pm.dpm.fan.pwm_med = le16_to_cpu(fan_info->fan.usPWMMed);
> -			adev->pm.dpm.fan.pwm_high = le16_to_cpu(fan_info->fan.usPWMHigh);
> -			if (fan_info->fan.ucFanTableFormat >= 2)
> -				adev->pm.dpm.fan.t_max = le16_to_cpu(fan_info->fan2.usTMax);
> -			else
> -				adev->pm.dpm.fan.t_max = 10900;
> -			adev->pm.dpm.fan.cycle_delay = 100000;
> -			if (fan_info->fan.ucFanTableFormat >= 3) {
> -				adev->pm.dpm.fan.control_mode = fan_info->fan3.ucFanControlMode;
> -				adev->pm.dpm.fan.default_max_fan_pwm =
> -					le16_to_cpu(fan_info->fan3.usFanPWMMax);
> -				adev->pm.dpm.fan.default_fan_output_sensitivity = 4836;
> -				adev->pm.dpm.fan.fan_output_sensitivity =
> -					le16_to_cpu(fan_info->fan3.usFanOutputSensitivity);
> -			}
> -			adev->pm.dpm.fan.ucode_fan_control = true;
> -		}
> -	}
> -
> -	/* clock dependancy tables, shedding tables */
> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE4)) {
> -		if (power_info->pplib4.usVddcDependencyOnSCLKOffset) {
> -			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnSCLKOffset));
> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_sclk,
> -								 dep_table);
> -			if (ret) {
> -				amdgpu_free_extended_power_table(adev);
> -				return ret;
> -			}
> -		}
> -		if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
> -			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usVddciDependencyOnMCLKOffset));
> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddci_dependency_on_mclk,
> -								 dep_table);
> -			if (ret) {
> -				amdgpu_free_extended_power_table(adev);
> -				return ret;
> -			}
> -		}
> -		if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
> -			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnMCLKOffset));
> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_mclk,
> -								 dep_table);
> -			if (ret) {
> -				amdgpu_free_extended_power_table(adev);
> -				return ret;
> -			}
> -		}
> -		if (power_info->pplib4.usMvddDependencyOnMCLKOffset) {
> -			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usMvddDependencyOnMCLKOffset));
> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.mvdd_dependency_on_mclk,
> -								 dep_table);
> -			if (ret) {
> -				amdgpu_free_extended_power_table(adev);
> -				return ret;
> -			}
> -		}
> -		if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
> -			ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =
> -				(ATOM_PPLIB_Clock_Voltage_Limit_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usMaxClockVoltageOnDCOffset));
> -			if (clk_v->ucNumEntries) {
> -				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.sclk =
> -					le16_to_cpu(clk_v->entries[0].usSclkLow) |
> -					(clk_v->entries[0].ucSclkHigh << 16);
> -				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.mclk =
> -					le16_to_cpu(clk_v->entries[0].usMclkLow) |
> -					(clk_v->entries[0].ucMclkHigh << 16);
> -				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.vddc =
> -					le16_to_cpu(clk_v->entries[0].usVddc);
> -				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.vddci =
> -					le16_to_cpu(clk_v->entries[0].usVddci);
> -			}
> -		}
> -		if (power_info->pplib4.usVddcPhaseShedLimitsTableOffset) {
> -			ATOM_PPLIB_PhaseSheddingLimits_Table *psl =
> -				(ATOM_PPLIB_PhaseSheddingLimits_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib4.usVddcPhaseShedLimitsTableOffset));
> -			ATOM_PPLIB_PhaseSheddingLimits_Record *entry;
> -
> -			adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries =
> -				kcalloc(psl->ucNumEntries,
> -					sizeof(struct amdgpu_phase_shedding_limits_entry),
> -					GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -
> -			entry = &psl->entries[0];
> -			for (i = 0; i < psl->ucNumEntries; i++) {
> -				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].sclk =
> -					le16_to_cpu(entry->usSclkLow) | (entry->ucSclkHigh << 16);
> -				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].mclk =
> -					le16_to_cpu(entry->usMclkLow) | (entry->ucMclkHigh << 16);
> -				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].voltage =
> -					le16_to_cpu(entry->usVoltage);
> -				entry = (ATOM_PPLIB_PhaseSheddingLimits_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_PhaseSheddingLimits_Record));
> -			}
> -			adev->pm.dpm.dyn_state.phase_shedding_limits_table.count =
> -				psl->ucNumEntries;
> -		}
> -	}
> -
> -	/* cac data */
> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE5)) {
> -		adev->pm.dpm.tdp_limit = le32_to_cpu(power_info->pplib5.ulTDPLimit);
> -		adev->pm.dpm.near_tdp_limit = le32_to_cpu(power_info->pplib5.ulNearTDPLimit);
> -		adev->pm.dpm.near_tdp_limit_adjusted = adev->pm.dpm.near_tdp_limit;
> -		adev->pm.dpm.tdp_od_limit = le16_to_cpu(power_info->pplib5.usTDPODLimit);
> -		if (adev->pm.dpm.tdp_od_limit)
> -			adev->pm.dpm.power_control = true;
> -		else
> -			adev->pm.dpm.power_control = false;
> -		adev->pm.dpm.tdp_adjustment = 0;
> -		adev->pm.dpm.sq_ramping_threshold = le32_to_cpu(power_info->pplib5.ulSQRampingThreshold);
> -		adev->pm.dpm.cac_leakage = le32_to_cpu(power_info->pplib5.ulCACLeakage);
> -		adev->pm.dpm.load_line_slope = le16_to_cpu(power_info->pplib5.usLoadLineSlope);
> -		if (power_info->pplib5.usCACLeakageTableOffset) {
> -			ATOM_PPLIB_CAC_Leakage_Table *cac_table =
> -				(ATOM_PPLIB_CAC_Leakage_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(power_info->pplib5.usCACLeakageTableOffset));
> -			ATOM_PPLIB_CAC_Leakage_Record *entry;
> -			u32 size = cac_table->ucNumEntries * sizeof(struct amdgpu_cac_leakage_table);
> -			adev->pm.dpm.dyn_state.cac_leakage_table.entries = kzalloc(size, GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.cac_leakage_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			entry = &cac_table->entries[0];
> -			for (i = 0; i < cac_table->ucNumEntries; i++) {
> -				if (adev->pm.dpm.platform_caps & ATOM_PP_PLATFORM_CAP_EVV) {
> -					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc1 =
> -						le16_to_cpu(entry->usVddc1);
> -					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc2 =
> -						le16_to_cpu(entry->usVddc2);
> -					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc3 =
> -						le16_to_cpu(entry->usVddc3);
> -				} else {
> -					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc =
> -						le16_to_cpu(entry->usVddc);
> -					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].leakage =
> -						le32_to_cpu(entry->ulLeakageValue);
> -				}
> -				entry = (ATOM_PPLIB_CAC_Leakage_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_CAC_Leakage_Record));
> -			}
> -			adev->pm.dpm.dyn_state.cac_leakage_table.count = cac_table->ucNumEntries;
> -		}
> -	}
> -
> -	/* ext tables */
> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
> -		ATOM_PPLIB_EXTENDEDHEADER *ext_hdr = (ATOM_PPLIB_EXTENDEDHEADER *)
> -			(mode_info->atom_context->bios + data_offset +
> -			 le16_to_cpu(power_info->pplib3.usExtendendedHeaderOffset));
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2) &&
> -			ext_hdr->usVCETableOffset) {
> -			VCEClockInfoArray *array = (VCEClockInfoArray *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1);
> -			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *limits =
> -				(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1 +
> -				 1 + array->ucNumEntries * sizeof(VCEClockInfo));
> -			ATOM_PPLIB_VCE_State_Table *states =
> -				(ATOM_PPLIB_VCE_State_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1 +
> -				 1 + (array->ucNumEntries * sizeof (VCEClockInfo)) +
> -				 1 + (limits->numEntries * sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record)));
> -			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *entry;
> -			ATOM_PPLIB_VCE_State_Record *state_entry;
> -			VCEClockInfo *vce_clk;
> -			u32 size = limits->numEntries *
> -				sizeof(struct amdgpu_vce_clock_voltage_dependency_entry);
> -			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries =
> -				kzalloc(size, GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.count =
> -				limits->numEntries;
> -			entry = &limits->entries[0];
> -			state_entry = &states->entries[0];
> -			for (i = 0; i < limits->numEntries; i++) {
> -				vce_clk = (VCEClockInfo *)
> -					((u8 *)&array->entries[0] +
> -					 (entry->ucVCEClockInfoIndex * sizeof(VCEClockInfo)));
> -				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].evclk =
> -					le16_to_cpu(vce_clk->usEVClkLow) | (vce_clk->ucEVClkHigh << 16);
> -				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].ecclk =
> -					le16_to_cpu(vce_clk->usECClkLow) | (vce_clk->ucECClkHigh << 16);
> -				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].v =
> -					le16_to_cpu(entry->usVoltage);
> -				entry = (ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record));
> -			}
> -			adev->pm.dpm.num_of_vce_states =
> -					states->numEntries > AMD_MAX_VCE_LEVELS ?
> -					AMD_MAX_VCE_LEVELS : states->numEntries;
> -			for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++) {
> -				vce_clk = (VCEClockInfo *)
> -					((u8 *)&array->entries[0] +
> -					 (state_entry->ucVCEClockInfoIndex * sizeof(VCEClockInfo)));
> -				adev->pm.dpm.vce_states[i].evclk =
> -					le16_to_cpu(vce_clk->usEVClkLow) | (vce_clk->ucEVClkHigh << 16);
> -				adev->pm.dpm.vce_states[i].ecclk =
> -					le16_to_cpu(vce_clk->usECClkLow) | (vce_clk->ucECClkHigh << 16);
> -				adev->pm.dpm.vce_states[i].clk_idx =
> -					state_entry->ucClockInfoIndex & 0x3f;
> -				adev->pm.dpm.vce_states[i].pstate =
> -					(state_entry->ucClockInfoIndex & 0xc0) >> 6;
> -				state_entry = (ATOM_PPLIB_VCE_State_Record *)
> -					((u8 *)state_entry + sizeof(ATOM_PPLIB_VCE_State_Record));
> -			}
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3) &&
> -			ext_hdr->usUVDTableOffset) {
> -			UVDClockInfoArray *array = (UVDClockInfoArray *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usUVDTableOffset) + 1);
> -			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *limits =
> -				(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usUVDTableOffset) + 1 +
> -				 1 + (array->ucNumEntries * sizeof (UVDClockInfo)));
> -			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *entry;
> -			u32 size = limits->numEntries *
> -				sizeof(struct amdgpu_uvd_clock_voltage_dependency_entry);
> -			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries =
> -				kzalloc(size, GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.count =
> -				limits->numEntries;
> -			entry = &limits->entries[0];
> -			for (i = 0; i < limits->numEntries; i++) {
> -				UVDClockInfo *uvd_clk = (UVDClockInfo *)
> -					((u8 *)&array->entries[0] +
> -					 (entry->ucUVDClockInfoIndex * sizeof(UVDClockInfo)));
> -				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].vclk =
> -					le16_to_cpu(uvd_clk->usVClkLow) | (uvd_clk->ucVClkHigh << 16);
> -				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].dclk =
> -					le16_to_cpu(uvd_clk->usDClkLow) | (uvd_clk->ucDClkHigh << 16);
> -				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].v =
> -					le16_to_cpu(entry->usVoltage);
> -				entry = (ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record));
> -			}
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4) &&
> -			ext_hdr->usSAMUTableOffset) {
> -			ATOM_PPLIB_SAMClk_Voltage_Limit_Table *limits =
> -				(ATOM_PPLIB_SAMClk_Voltage_Limit_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usSAMUTableOffset) + 1);
> -			ATOM_PPLIB_SAMClk_Voltage_Limit_Record *entry;
> -			u32 size = limits->numEntries *
> -				sizeof(struct amdgpu_clock_voltage_dependency_entry);
> -			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries =
> -				kzalloc(size, GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.count =
> -				limits->numEntries;
> -			entry = &limits->entries[0];
> -			for (i = 0; i < limits->numEntries; i++) {
> -				adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].clk =
> -					le16_to_cpu(entry->usSAMClockLow) | (entry->ucSAMClockHigh << 16);
> -				adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].v =
> -					le16_to_cpu(entry->usVoltage);
> -				entry = (ATOM_PPLIB_SAMClk_Voltage_Limit_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_SAMClk_Voltage_Limit_Record));
> -			}
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5) &&
> -		    ext_hdr->usPPMTableOffset) {
> -			ATOM_PPLIB_PPM_Table *ppm = (ATOM_PPLIB_PPM_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usPPMTableOffset));
> -			adev->pm.dpm.dyn_state.ppm_table =
> -				kzalloc(sizeof(struct amdgpu_ppm_table), GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.ppm_table) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			adev->pm.dpm.dyn_state.ppm_table->ppm_design = ppm->ucPpmDesign;
> -			adev->pm.dpm.dyn_state.ppm_table->cpu_core_number =
> -				le16_to_cpu(ppm->usCpuCoreNumber);
> -			adev->pm.dpm.dyn_state.ppm_table->platform_tdp =
> -				le32_to_cpu(ppm->ulPlatformTDP);
> -			adev->pm.dpm.dyn_state.ppm_table->small_ac_platform_tdp =
> -				le32_to_cpu(ppm->ulSmallACPlatformTDP);
> -			adev->pm.dpm.dyn_state.ppm_table->platform_tdc =
> -				le32_to_cpu(ppm->ulPlatformTDC);
> -			adev->pm.dpm.dyn_state.ppm_table->small_ac_platform_tdc =
> -				le32_to_cpu(ppm->ulSmallACPlatformTDC);
> -			adev->pm.dpm.dyn_state.ppm_table->apu_tdp =
> -				le32_to_cpu(ppm->ulApuTDP);
> -			adev->pm.dpm.dyn_state.ppm_table->dgpu_tdp =
> -				le32_to_cpu(ppm->ulDGpuTDP);
> -			adev->pm.dpm.dyn_state.ppm_table->dgpu_ulv_power =
> -				le32_to_cpu(ppm->ulDGpuUlvPower);
> -			adev->pm.dpm.dyn_state.ppm_table->tj_max =
> -				le32_to_cpu(ppm->ulTjmax);
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6) &&
> -			ext_hdr->usACPTableOffset) {
> -			ATOM_PPLIB_ACPClk_Voltage_Limit_Table *limits =
> -				(ATOM_PPLIB_ACPClk_Voltage_Limit_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usACPTableOffset) + 1);
> -			ATOM_PPLIB_ACPClk_Voltage_Limit_Record *entry;
> -			u32 size = limits->numEntries *
> -				sizeof(struct amdgpu_clock_voltage_dependency_entry);
> -			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries =
> -				kzalloc(size, GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.count =
> -				limits->numEntries;
> -			entry = &limits->entries[0];
> -			for (i = 0; i < limits->numEntries; i++) {
> -				adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].clk =
> -					le16_to_cpu(entry->usACPClockLow) | (entry->ucACPClockHigh << 16);
> -				adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].v =
> -					le16_to_cpu(entry->usVoltage);
> -				entry = (ATOM_PPLIB_ACPClk_Voltage_Limit_Record *)
> -					((u8 *)entry + sizeof(ATOM_PPLIB_ACPClk_Voltage_Limit_Record));
> -			}
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7) &&
> -			ext_hdr->usPowerTuneTableOffset) {
> -			u8 rev = *(u8 *)(mode_info->atom_context->bios + data_offset +
> -					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> -			ATOM_PowerTune_Table *pt;
> -			adev->pm.dpm.dyn_state.cac_tdp_table =
> -				kzalloc(sizeof(struct amdgpu_cac_tdp_table), GFP_KERNEL);
> -			if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
> -				amdgpu_free_extended_power_table(adev);
> -				return -ENOMEM;
> -			}
> -			if (rev > 0) {
> -				ATOM_PPLIB_POWERTUNE_Table_V1 *ppt = (ATOM_PPLIB_POWERTUNE_Table_V1 *)
> -					(mode_info->atom_context->bios + data_offset +
> -					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> -				adev->pm.dpm.dyn_state.cac_tdp_table->maximum_power_delivery_limit =
> -					ppt->usMaximumPowerDeliveryLimit;
> -				pt = &ppt->power_tune_table;
> -			} else {
> -				ATOM_PPLIB_POWERTUNE_Table *ppt = (ATOM_PPLIB_POWERTUNE_Table *)
> -					(mode_info->atom_context->bios + data_offset +
> -					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> -				adev->pm.dpm.dyn_state.cac_tdp_table->maximum_power_delivery_limit = 255;
> -				pt = &ppt->power_tune_table;
> -			}
> -			adev->pm.dpm.dyn_state.cac_tdp_table->tdp = le16_to_cpu(pt->usTDP);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->configurable_tdp =
> -				le16_to_cpu(pt->usConfigurableTDP);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->tdc = le16_to_cpu(pt->usTDC);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->battery_power_limit =
> -				le16_to_cpu(pt->usBatteryPowerLimit);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->small_power_limit =
> -				le16_to_cpu(pt->usSmallPowerLimit);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->low_cac_leakage =
> -				le16_to_cpu(pt->usLowCACLeakage);
> -			adev->pm.dpm.dyn_state.cac_tdp_table->high_cac_leakage =
> -				le16_to_cpu(pt->usHighCACLeakage);
> -		}
> -		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8) &&
> -				ext_hdr->usSclkVddgfxTableOffset) {
> -			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> -				(mode_info->atom_context->bios + data_offset +
> -				 le16_to_cpu(ext_hdr->usSclkVddgfxTableOffset));
> -			ret = amdgpu_parse_clk_voltage_dep_table(
> -					&adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk,
> -					dep_table);
> -			if (ret) {
> -				kfree(adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk.entries);
> -				return ret;
> -			}
> -		}
> -	}
> -
> -	return 0;
> -}
> -
> -void amdgpu_free_extended_power_table(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_dpm_dynamic_state *dyn_state = &adev->pm.dpm.dyn_state;
> -
> -	kfree(dyn_state->vddc_dependency_on_sclk.entries);
> -	kfree(dyn_state->vddci_dependency_on_mclk.entries);
> -	kfree(dyn_state->vddc_dependency_on_mclk.entries);
> -	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
> -	kfree(dyn_state->cac_leakage_table.entries);
> -	kfree(dyn_state->phase_shedding_limits_table.entries);
> -	kfree(dyn_state->ppm_table);
> -	kfree(dyn_state->cac_tdp_table);
> -	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
> -	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
> -	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
> -	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
> -	kfree(dyn_state->vddgfx_dependency_on_sclk.entries);
> -}
> -
> -static const char *pp_lib_thermal_controller_names[] = {
> -	"NONE",
> -	"lm63",
> -	"adm1032",
> -	"adm1030",
> -	"max6649",
> -	"lm64",
> -	"f75375",
> -	"RV6xx",
> -	"RV770",
> -	"adt7473",
> -	"NONE",
> -	"External GPIO",
> -	"Evergreen",
> -	"emc2103",
> -	"Sumo",
> -	"Northern Islands",
> -	"Southern Islands",
> -	"lm96163",
> -	"Sea Islands",
> -	"Kaveri/Kabini",
> -};
> -
> -void amdgpu_add_thermal_controller(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> -	ATOM_PPLIB_POWERPLAYTABLE *power_table;
> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> -	ATOM_PPLIB_THERMALCONTROLLER *controller;
> -	struct amdgpu_i2c_bus_rec i2c_bus;
> -	u16 data_offset;
> -	u8 frev, crev;
> -
> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> -				   &frev, &crev, &data_offset))
> -		return;
> -	power_table = (ATOM_PPLIB_POWERPLAYTABLE *)
> -		(mode_info->atom_context->bios + data_offset);
> -	controller = &power_table->sThermalController;
> -
> -	/* add the i2c bus for thermal/fan chip */
> -	if (controller->ucType > 0) {
> -		if (controller->ucFanParameters & ATOM_PP_FANPARAMETERS_NOFAN)
> -			adev->pm.no_fan = true;
> -		adev->pm.fan_pulses_per_revolution =
> -			controller->ucFanParameters & ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
> -		if (adev->pm.fan_pulses_per_revolution) {
> -			adev->pm.fan_min_rpm = controller->ucFanMinRPM;
> -			adev->pm.fan_max_rpm = controller->ucFanMaxRPM;
> -		}
> -		if (controller->ucType == ATOM_PP_THERMALCONTROLLER_RV6xx) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_RV6XX;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_RV770) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_RV770;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_EVERGREEN) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_EVERGREEN;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_SUMO) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_SUMO;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_NISLANDS) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_NI;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_SISLANDS) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_SI;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_CISLANDS) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_CI;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_KAVERI) {
> -			DRM_INFO("Internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_KV;
> -		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_EXTERNAL_GPIO) {
> -			DRM_INFO("External GPIO thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_EXTERNAL_GPIO;
> -		} else if (controller->ucType ==
> -			   ATOM_PP_THERMALCONTROLLER_ADT7473_WITH_INTERNAL) {
> -			DRM_INFO("ADT7473 with internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_ADT7473_WITH_INTERNAL;
> -		} else if (controller->ucType ==
> -			   ATOM_PP_THERMALCONTROLLER_EMC2103_WITH_INTERNAL) {
> -			DRM_INFO("EMC2103 with internal thermal controller %s fan control\n",
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_EMC2103_WITH_INTERNAL;
> -		} else if (controller->ucType < ARRAY_SIZE(pp_lib_thermal_controller_names)) {
> -			DRM_INFO("Possible %s thermal controller at 0x%02x %s fan control\n",
> -				 pp_lib_thermal_controller_names[controller->ucType],
> -				 controller->ucI2cAddress >> 1,
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -			adev->pm.int_thermal_type = THERMAL_TYPE_EXTERNAL;
> -			i2c_bus = amdgpu_atombios_lookup_i2c_gpio(adev, controller->ucI2cLine);
> -			adev->pm.i2c_bus = amdgpu_i2c_lookup(adev, &i2c_bus);
> -			if (adev->pm.i2c_bus) {
> -				struct i2c_board_info info = { };
> -				const char *name = pp_lib_thermal_controller_names[controller->ucType];
> -				info.addr = controller->ucI2cAddress >> 1;
> -				strlcpy(info.type, name, sizeof(info.type));
> -				i2c_new_client_device(&adev->pm.i2c_bus->adapter, &info);
> -			}
> -		} else {
> -			DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> -				 controller->ucType,
> -				 controller->ucI2cAddress >> 1,
> -				 (controller->ucFanParameters &
> -				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> -		}
> -	}
> -}
> -
> -struct amd_vce_state*
> -amdgpu_get_vce_clock_state(void *handle, u32 idx)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	if (idx < adev->pm.dpm.num_of_vce_states)
> -		return &adev->pm.dpm.vce_states[idx];
> -
> -	return NULL;
> -}
> -
>   int amdgpu_dpm_get_sclk(struct amdgpu_device *adev, bool low)
>   {
>   	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
> @@ -1240,215 +462,10 @@ void amdgpu_dpm_thermal_work_handler(struct work_struct *work)
>   	adev->pm.dpm.state = dpm_state;
>   	mutex_unlock(&adev->pm.mutex);
>   
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   }
>   
> -static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct amdgpu_device *adev,
> -						     enum amd_pm_state_type dpm_state)
> -{
> -	int i;
> -	struct amdgpu_ps *ps;
> -	u32 ui_class;
> -	bool single_display = (adev->pm.dpm.new_active_crtc_count < 2) ?
> -		true : false;
> -
> -	/* check if the vblank period is too short to adjust the mclk */
> -	if (single_display && adev->powerplay.pp_funcs->vblank_too_short) {
> -		if (amdgpu_dpm_vblank_too_short(adev))
> -			single_display = false;
> -	}
> -
> -	/* certain older asics have a separare 3D performance state,
> -	 * so try that first if the user selected performance
> -	 */
> -	if (dpm_state == POWER_STATE_TYPE_PERFORMANCE)
> -		dpm_state = POWER_STATE_TYPE_INTERNAL_3DPERF;
> -	/* balanced states don't exist at the moment */
> -	if (dpm_state == POWER_STATE_TYPE_BALANCED)
> -		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> -
> -restart_search:
> -	/* Pick the best power state based on current conditions */
> -	for (i = 0; i < adev->pm.dpm.num_ps; i++) {
> -		ps = &adev->pm.dpm.ps[i];
> -		ui_class = ps->class & ATOM_PPLIB_CLASSIFICATION_UI_MASK;
> -		switch (dpm_state) {
> -		/* user states */
> -		case POWER_STATE_TYPE_BATTERY:
> -			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_BATTERY) {
> -				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> -					if (single_display)
> -						return ps;
> -				} else
> -					return ps;
> -			}
> -			break;
> -		case POWER_STATE_TYPE_BALANCED:
> -			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_BALANCED) {
> -				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> -					if (single_display)
> -						return ps;
> -				} else
> -					return ps;
> -			}
> -			break;
> -		case POWER_STATE_TYPE_PERFORMANCE:
> -			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE) {
> -				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> -					if (single_display)
> -						return ps;
> -				} else
> -					return ps;
> -			}
> -			break;
> -		/* internal states */
> -		case POWER_STATE_TYPE_INTERNAL_UVD:
> -			if (adev->pm.dpm.uvd_ps)
> -				return adev->pm.dpm.uvd_ps;
> -			else
> -				break;
> -		case POWER_STATE_TYPE_INTERNAL_UVD_SD:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_UVD_HD:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
> -			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_BOOT:
> -			return adev->pm.dpm.boot_ps;
> -		case POWER_STATE_TYPE_INTERNAL_THERMAL:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_ACPI:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_ACPI)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_ULV:
> -			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
> -				return ps;
> -			break;
> -		case POWER_STATE_TYPE_INTERNAL_3DPERF:
> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
> -				return ps;
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -	/* use a fallback state if we didn't match */
> -	switch (dpm_state) {
> -	case POWER_STATE_TYPE_INTERNAL_UVD_SD:
> -		dpm_state = POWER_STATE_TYPE_INTERNAL_UVD_HD;
> -		goto restart_search;
> -	case POWER_STATE_TYPE_INTERNAL_UVD_HD:
> -	case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
> -	case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
> -		if (adev->pm.dpm.uvd_ps) {
> -			return adev->pm.dpm.uvd_ps;
> -		} else {
> -			dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> -			goto restart_search;
> -		}
> -	case POWER_STATE_TYPE_INTERNAL_THERMAL:
> -		dpm_state = POWER_STATE_TYPE_INTERNAL_ACPI;
> -		goto restart_search;
> -	case POWER_STATE_TYPE_INTERNAL_ACPI:
> -		dpm_state = POWER_STATE_TYPE_BATTERY;
> -		goto restart_search;
> -	case POWER_STATE_TYPE_BATTERY:
> -	case POWER_STATE_TYPE_BALANCED:
> -	case POWER_STATE_TYPE_INTERNAL_3DPERF:
> -		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> -		goto restart_search;
> -	default:
> -		break;
> -	}
> -
> -	return NULL;
> -}
> -
> -static void amdgpu_dpm_change_power_state_locked(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_ps *ps;
> -	enum amd_pm_state_type dpm_state;
> -	int ret;
> -	bool equal = false;
> -
> -	/* if dpm init failed */
> -	if (!adev->pm.dpm_enabled)
> -		return;
> -
> -	if (adev->pm.dpm.user_state != adev->pm.dpm.state) {
> -		/* add other state override checks here */
> -		if ((!adev->pm.dpm.thermal_active) &&
> -		    (!adev->pm.dpm.uvd_active))
> -			adev->pm.dpm.state = adev->pm.dpm.user_state;
> -	}
> -	dpm_state = adev->pm.dpm.state;
> -
> -	ps = amdgpu_dpm_pick_power_state(adev, dpm_state);
> -	if (ps)
> -		adev->pm.dpm.requested_ps = ps;
> -	else
> -		return;
> -
> -	if (amdgpu_dpm == 1 && adev->powerplay.pp_funcs->print_power_state) {
> -		printk("switching from power state:\n");
> -		amdgpu_dpm_print_power_state(adev, adev->pm.dpm.current_ps);
> -		printk("switching to power state:\n");
> -		amdgpu_dpm_print_power_state(adev, adev->pm.dpm.requested_ps);
> -	}
> -
> -	/* update whether vce is active */
> -	ps->vce_active = adev->pm.dpm.vce_active;
> -	if (adev->powerplay.pp_funcs->display_configuration_changed)
> -		amdgpu_dpm_display_configuration_changed(adev);
> -
> -	ret = amdgpu_dpm_pre_set_power_state(adev);
> -	if (ret)
> -		return;
> -
> -	if (adev->powerplay.pp_funcs->check_state_equal) {
> -		if (0 != amdgpu_dpm_check_state_equal(adev, adev->pm.dpm.current_ps, adev->pm.dpm.requested_ps, &equal))
> -			equal = false;
> -	}
> -
> -	if (equal)
> -		return;
> -
> -	if (adev->powerplay.pp_funcs->set_power_state)
> -		adev->powerplay.pp_funcs->set_power_state(adev->powerplay.pp_handle);
> -
> -	amdgpu_dpm_post_set_power_state(adev);
> -
> -	adev->pm.dpm.current_active_crtcs = adev->pm.dpm.new_active_crtcs;
> -	adev->pm.dpm.current_active_crtc_count = adev->pm.dpm.new_active_crtc_count;
> -
> -	if (adev->powerplay.pp_funcs->force_performance_level) {
> -		if (adev->pm.dpm.thermal_active) {
> -			enum amd_dpm_forced_level level = adev->pm.dpm.forced_level;
> -			/* force low perf level for thermal */
> -			amdgpu_dpm_force_performance_level(adev, AMD_DPM_FORCED_LEVEL_LOW);
> -			/* save the user's level */
> -			adev->pm.dpm.forced_level = level;
> -		} else {
> -			/* otherwise, user selected level */
> -			amdgpu_dpm_force_performance_level(adev, adev->pm.dpm.forced_level);
> -		}
> -	}
> -}
> -
> -void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
> +void amdgpu_dpm_compute_clocks(struct amdgpu_device *adev)
>   {
>   	int i = 0;
>   
> @@ -1464,9 +481,12 @@ void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
>   			amdgpu_fence_wait_empty(ring);
>   	}
>   
> -	if (adev->powerplay.pp_funcs->dispatch_tasks) {
> +	if ((adev->family == AMDGPU_FAMILY_SI) ||
> +	     (adev->family == AMDGPU_FAMILY_KV)) {
> +		amdgpu_dpm_get_active_displays(adev);
> +		adev->powerplay.pp_funcs->change_power_state(adev->powerplay.pp_handle);

Missed this earlier. This also subtly drops the mutex lock (here and 
below). Is that intended?

Thanks,
Lijo

> +	} else {
>   		if (!amdgpu_device_has_dc_support(adev)) {
> -			mutex_lock(&adev->pm.mutex);
>   			amdgpu_dpm_get_active_displays(adev);
>   			adev->pm.pm_display_cfg.num_display = adev->pm.dpm.new_active_crtc_count;
>   			adev->pm.pm_display_cfg.vrefresh = amdgpu_dpm_get_vrefresh(adev);
> @@ -1480,14 +500,8 @@ void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
>   				adev->powerplay.pp_funcs->display_configuration_change(
>   							adev->powerplay.pp_handle,
>   							&adev->pm.pm_display_cfg);
> -			mutex_unlock(&adev->pm.mutex);
>   		}
>   		amdgpu_dpm_dispatch_task(adev, AMD_PP_TASK_DISPLAY_CONFIG_CHANGE, NULL);
> -	} else {
> -		mutex_lock(&adev->pm.mutex);
> -		amdgpu_dpm_get_active_displays(adev);
> -		amdgpu_dpm_change_power_state_locked(adev);
> -		mutex_unlock(&adev->pm.mutex);
>   	}
>   }
>   
> @@ -1505,7 +519,7 @@ void amdgpu_dpm_enable_uvd(struct amdgpu_device *adev, bool enable)
>   		}
>   		mutex_unlock(&adev->pm.mutex);
>   
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   	} else {
>   		ret = amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_UVD, !enable);
>   		if (ret)
> @@ -1541,7 +555,7 @@ void amdgpu_dpm_enable_vce(struct amdgpu_device *adev, bool enable)
>   		}
>   		mutex_unlock(&adev->pm.mutex);
>   
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   	} else {
>   		ret = amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_VCE, !enable);
>   		if (ret)
> @@ -1550,18 +564,6 @@ void amdgpu_dpm_enable_vce(struct amdgpu_device *adev, bool enable)
>   	}
>   }
>   
> -void amdgpu_pm_print_power_states(struct amdgpu_device *adev)
> -{
> -	int i;
> -
> -	if (adev->powerplay.pp_funcs->print_power_state == NULL)
> -		return;
> -
> -	for (i = 0; i < adev->pm.dpm.num_ps; i++)
> -		amdgpu_dpm_print_power_state(adev, &adev->pm.dpm.ps[i]);
> -
> -}
> -
>   void amdgpu_dpm_enable_jpeg(struct amdgpu_device *adev, bool enable)
>   {
>   	int ret = 0;
> @@ -1724,7 +726,7 @@ void amdgpu_dpm_set_power_state(struct amdgpu_device *adev,
>   	if (adev->powerplay.pp_funcs->dispatch_tasks)
>   		amdgpu_dpm_dispatch_task(adev, AMD_PP_TASK_ENABLE_USER_STATE, &state);
>   	else
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   }
>   
>   enum amd_dpm_forced_level amdgpu_dpm_get_performance_level(struct amdgpu_device *adev)
> @@ -1898,7 +900,7 @@ int amdgpu_dpm_set_sclk_od(struct amdgpu_device *adev, uint32_t value)
>   				     AMD_PP_TASK_READJUST_POWER_STATE,
>   				     NULL) == -EOPNOTSUPP) {
>   		adev->pm.dpm.current_ps = adev->pm.dpm.boot_ps;
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   	}
>   
>   	return 0;
> @@ -1927,7 +929,7 @@ int amdgpu_dpm_set_mclk_od(struct amdgpu_device *adev, uint32_t value)
>   				     AMD_PP_TASK_READJUST_POWER_STATE,
>   				     NULL) == -EOPNOTSUPP) {
>   		adev->pm.dpm.current_ps = adev->pm.dpm.boot_ps;
> -		amdgpu_pm_compute_clocks(adev);
> +		amdgpu_dpm_compute_clocks(adev);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> index 01120b302590..89caece4ab3e 100644
> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> @@ -366,24 +366,10 @@ enum amdgpu_display_gap
>       AMDGPU_PM_DISPLAY_GAP_IGNORE       = 3,
>   };
>   
> -void amdgpu_dpm_print_class_info(u32 class, u32 class2);
> -void amdgpu_dpm_print_cap_info(u32 caps);
> -void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
> -				struct amdgpu_ps *rps);
>   u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev);
>   int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum amd_pp_sensors sensor,
>   			   void *data, uint32_t *size);
>   
> -int amdgpu_get_platform_caps(struct amdgpu_device *adev);
> -
> -int amdgpu_parse_extended_power_table(struct amdgpu_device *adev);
> -void amdgpu_free_extended_power_table(struct amdgpu_device *adev);
> -
> -void amdgpu_add_thermal_controller(struct amdgpu_device *adev);
> -
> -struct amd_vce_state*
> -amdgpu_get_vce_clock_state(void *handle, u32 idx);
> -
>   int amdgpu_dpm_set_powergating_by_smu(struct amdgpu_device *adev,
>   				      uint32_t block_type, bool gate);
>   
> @@ -434,11 +420,10 @@ int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum amd_pp_sensors senso
>   
>   void amdgpu_dpm_thermal_work_handler(struct work_struct *work);
>   
> -void amdgpu_pm_compute_clocks(struct amdgpu_device *adev);
> +void amdgpu_dpm_compute_clocks(struct amdgpu_device *adev);
>   void amdgpu_dpm_enable_uvd(struct amdgpu_device *adev, bool enable);
>   void amdgpu_dpm_enable_vce(struct amdgpu_device *adev, bool enable);
>   void amdgpu_dpm_enable_jpeg(struct amdgpu_device *adev, bool enable);
> -void amdgpu_pm_print_power_states(struct amdgpu_device *adev);
>   int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev, uint32_t *smu_version);
>   int amdgpu_dpm_set_light_sbr(struct amdgpu_device *adev, bool enable);
>   int amdgpu_dpm_send_hbm_bad_pages_num(struct amdgpu_device *adev, uint32_t size);
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/Makefile b/drivers/gpu/drm/amd/pm/powerplay/Makefile
> index 0fb114adc79f..614d8b6a58ad 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/Makefile
> +++ b/drivers/gpu/drm/amd/pm/powerplay/Makefile
> @@ -28,7 +28,7 @@ AMD_POWERPLAY = $(addsuffix /Makefile,$(addprefix $(FULL_AMD_PATH)/pm/powerplay/
>   
>   include $(AMD_POWERPLAY)
>   
> -POWER_MGR-y = amd_powerplay.o
> +POWER_MGR-y = amd_powerplay.o legacy_dpm.o
>   
>   POWER_MGR-$(CONFIG_DRM_AMDGPU_CIK)+= kv_dpm.o kv_smc.o
>   
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c b/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
> index 380a5336c74f..eed89835231c 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
> @@ -36,6 +36,7 @@
>   
>   #include "gca/gfx_7_2_d.h"
>   #include "gca/gfx_7_2_sh_mask.h"
> +#include "legacy_dpm.h"
>   
>   #define KV_MAX_DEEPSLEEP_DIVIDER_ID     5
>   #define KV_MINIMUM_ENGINE_CLOCK         800
> @@ -3087,7 +3088,7 @@ static int kv_dpm_hw_init(void *handle)
>   	else
>   		adev->pm.dpm_enabled = true;
>   	mutex_unlock(&adev->pm.mutex);
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   	return ret;
>   }
>   
> @@ -3135,7 +3136,7 @@ static int kv_dpm_resume(void *handle)
>   			adev->pm.dpm_enabled = true;
>   		mutex_unlock(&adev->pm.mutex);
>   		if (adev->pm.dpm_enabled)
> -			amdgpu_pm_compute_clocks(adev);
> +			amdgpu_dpm_compute_clocks(adev);
>   	}
>   	return 0;
>   }
> @@ -3389,6 +3390,7 @@ static const struct amd_pm_funcs kv_dpm_funcs = {
>   	.get_vce_clock_state = amdgpu_get_vce_clock_state,
>   	.check_state_equal = kv_check_state_equal,
>   	.read_sensor = &kv_dpm_read_sensor,
> +	.change_power_state = amdgpu_dpm_change_power_state_locked,
>   };
>   
>   static const struct amdgpu_irq_src_funcs kv_dpm_irq_funcs = {
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
> new file mode 100644
> index 000000000000..67c84b7ad8e7
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
> @@ -0,0 +1,1024 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "amdgpu.h"
> +#include "amdgpu_i2c.h"
> +#include "amdgpu_atombios.h"
> +#include "atom.h"
> +#include "amd_pcie.h"
> +#include "legacy_dpm.h"
> +
> +#define amdgpu_dpm_pre_set_power_state(adev) \
> +		((adev)->powerplay.pp_funcs->pre_set_power_state((adev)->powerplay.pp_handle))
> +
> +#define amdgpu_dpm_post_set_power_state(adev) \
> +		((adev)->powerplay.pp_funcs->post_set_power_state((adev)->powerplay.pp_handle))
> +
> +#define amdgpu_dpm_display_configuration_changed(adev) \
> +		((adev)->powerplay.pp_funcs->display_configuration_changed((adev)->powerplay.pp_handle))
> +
> +#define amdgpu_dpm_print_power_state(adev, ps) \
> +		((adev)->powerplay.pp_funcs->print_power_state((adev)->powerplay.pp_handle, (ps)))
> +
> +#define amdgpu_dpm_vblank_too_short(adev) \
> +		((adev)->powerplay.pp_funcs->vblank_too_short((adev)->powerplay.pp_handle))
> +
> +#define amdgpu_dpm_check_state_equal(adev, cps, rps, equal) \
> +		((adev)->powerplay.pp_funcs->check_state_equal((adev)->powerplay.pp_handle, (cps), (rps), (equal)))
> +
> +void amdgpu_dpm_print_class_info(u32 class, u32 class2)
> +{
> +	const char *s;
> +
> +	switch (class & ATOM_PPLIB_CLASSIFICATION_UI_MASK) {
> +	case ATOM_PPLIB_CLASSIFICATION_UI_NONE:
> +	default:
> +		s = "none";
> +		break;
> +	case ATOM_PPLIB_CLASSIFICATION_UI_BATTERY:
> +		s = "battery";
> +		break;
> +	case ATOM_PPLIB_CLASSIFICATION_UI_BALANCED:
> +		s = "balanced";
> +		break;
> +	case ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE:
> +		s = "performance";
> +		break;
> +	}
> +	printk("\tui class: %s\n", s);
> +	printk("\tinternal class:");
> +	if (((class & ~ATOM_PPLIB_CLASSIFICATION_UI_MASK) == 0) &&
> +	    (class2 == 0))
> +		pr_cont(" none");
> +	else {
> +		if (class & ATOM_PPLIB_CLASSIFICATION_BOOT)
> +			pr_cont(" boot");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
> +			pr_cont(" thermal");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_LIMITEDPOWERSOURCE)
> +			pr_cont(" limited_pwr");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_REST)
> +			pr_cont(" rest");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_FORCED)
> +			pr_cont(" forced");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
> +			pr_cont(" 3d_perf");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_OVERDRIVETEMPLATE)
> +			pr_cont(" ovrdrv");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_UVDSTATE)
> +			pr_cont(" uvd");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_3DLOW)
> +			pr_cont(" 3d_low");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_ACPI)
> +			pr_cont(" acpi");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
> +			pr_cont(" uvd_hd2");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
> +			pr_cont(" uvd_hd");
> +		if (class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
> +			pr_cont(" uvd_sd");
> +		if (class2 & ATOM_PPLIB_CLASSIFICATION2_LIMITEDPOWERSOURCE_2)
> +			pr_cont(" limited_pwr2");
> +		if (class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
> +			pr_cont(" ulv");
> +		if (class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
> +			pr_cont(" uvd_mvc");
> +	}
> +	pr_cont("\n");
> +}
> +
> +void amdgpu_dpm_print_cap_info(u32 caps)
> +{
> +	printk("\tcaps:");
> +	if (caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY)
> +		pr_cont(" single_disp");
> +	if (caps & ATOM_PPLIB_SUPPORTS_VIDEO_PLAYBACK)
> +		pr_cont(" video");
> +	if (caps & ATOM_PPLIB_DISALLOW_ON_DC)
> +		pr_cont(" no_dc");
> +	pr_cont("\n");
> +}
> +
> +void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
> +				struct amdgpu_ps *rps)
> +{
> +	printk("\tstatus:");
> +	if (rps == adev->pm.dpm.current_ps)
> +		pr_cont(" c");
> +	if (rps == adev->pm.dpm.requested_ps)
> +		pr_cont(" r");
> +	if (rps == adev->pm.dpm.boot_ps)
> +		pr_cont(" b");
> +	pr_cont("\n");
> +}
> +
> +void amdgpu_pm_print_power_states(struct amdgpu_device *adev)
> +{
> +	int i;
> +
> +	if (adev->powerplay.pp_funcs->print_power_state == NULL)
> +		return;
> +
> +	for (i = 0; i < adev->pm.dpm.num_ps; i++)
> +		amdgpu_dpm_print_power_state(adev, &adev->pm.dpm.ps[i]);
> +
> +}
> +
> +union power_info {
> +	struct _ATOM_POWERPLAY_INFO info;
> +	struct _ATOM_POWERPLAY_INFO_V2 info_2;
> +	struct _ATOM_POWERPLAY_INFO_V3 info_3;
> +	struct _ATOM_PPLIB_POWERPLAYTABLE pplib;
> +	struct _ATOM_PPLIB_POWERPLAYTABLE2 pplib2;
> +	struct _ATOM_PPLIB_POWERPLAYTABLE3 pplib3;
> +	struct _ATOM_PPLIB_POWERPLAYTABLE4 pplib4;
> +	struct _ATOM_PPLIB_POWERPLAYTABLE5 pplib5;
> +};
> +
> +int amdgpu_get_platform_caps(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	union power_info *power_info;
> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> +	u16 data_offset;
> +	u8 frev, crev;
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> +				   &frev, &crev, &data_offset))
> +		return -EINVAL;
> +	power_info = (union power_info *)(mode_info->atom_context->bios + data_offset);
> +
> +	adev->pm.dpm.platform_caps = le32_to_cpu(power_info->pplib.ulPlatformCaps);
> +	adev->pm.dpm.backbias_response_time = le16_to_cpu(power_info->pplib.usBackbiasTime);
> +	adev->pm.dpm.voltage_response_time = le16_to_cpu(power_info->pplib.usVoltageTime);
> +
> +	return 0;
> +}
> +
> +union fan_info {
> +	struct _ATOM_PPLIB_FANTABLE fan;
> +	struct _ATOM_PPLIB_FANTABLE2 fan2;
> +	struct _ATOM_PPLIB_FANTABLE3 fan3;
> +};
> +
> +static int amdgpu_parse_clk_voltage_dep_table(struct amdgpu_clock_voltage_dependency_table *amdgpu_table,
> +					      ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
> +{
> +	u32 size = atom_table->ucNumEntries *
> +		sizeof(struct amdgpu_clock_voltage_dependency_entry);
> +	int i;
> +	ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;
> +
> +	amdgpu_table->entries = kzalloc(size, GFP_KERNEL);
> +	if (!amdgpu_table->entries)
> +		return -ENOMEM;
> +
> +	entry = &atom_table->entries[0];
> +	for (i = 0; i < atom_table->ucNumEntries; i++) {
> +		amdgpu_table->entries[i].clk = le16_to_cpu(entry->usClockLow) |
> +			(entry->ucClockHigh << 16);
> +		amdgpu_table->entries[i].v = le16_to_cpu(entry->usVoltage);
> +		entry = (ATOM_PPLIB_Clock_Voltage_Dependency_Record *)
> +			((u8 *)entry + sizeof(ATOM_PPLIB_Clock_Voltage_Dependency_Record));
> +	}
> +	amdgpu_table->count = atom_table->ucNumEntries;
> +
> +	return 0;
> +}
> +
> +/* sizeof(ATOM_PPLIB_EXTENDEDHEADER) */
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2 12
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3 14
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4 16
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5 18
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6 20
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7 22
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8 24
> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V9 26
> +
> +int amdgpu_parse_extended_power_table(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	union power_info *power_info;
> +	union fan_info *fan_info;
> +	ATOM_PPLIB_Clock_Voltage_Dependency_Table *dep_table;
> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> +	u16 data_offset;
> +	u8 frev, crev;
> +	int ret, i;
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> +				   &frev, &crev, &data_offset))
> +		return -EINVAL;
> +	power_info = (union power_info *)(mode_info->atom_context->bios + data_offset);
> +
> +	/* fan table */
> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
> +		if (power_info->pplib3.usFanTableOffset) {
> +			fan_info = (union fan_info *)(mode_info->atom_context->bios + data_offset +
> +						      le16_to_cpu(power_info->pplib3.usFanTableOffset));
> +			adev->pm.dpm.fan.t_hyst = fan_info->fan.ucTHyst;
> +			adev->pm.dpm.fan.t_min = le16_to_cpu(fan_info->fan.usTMin);
> +			adev->pm.dpm.fan.t_med = le16_to_cpu(fan_info->fan.usTMed);
> +			adev->pm.dpm.fan.t_high = le16_to_cpu(fan_info->fan.usTHigh);
> +			adev->pm.dpm.fan.pwm_min = le16_to_cpu(fan_info->fan.usPWMMin);
> +			adev->pm.dpm.fan.pwm_med = le16_to_cpu(fan_info->fan.usPWMMed);
> +			adev->pm.dpm.fan.pwm_high = le16_to_cpu(fan_info->fan.usPWMHigh);
> +			if (fan_info->fan.ucFanTableFormat >= 2)
> +				adev->pm.dpm.fan.t_max = le16_to_cpu(fan_info->fan2.usTMax);
> +			else
> +				adev->pm.dpm.fan.t_max = 10900;
> +			adev->pm.dpm.fan.cycle_delay = 100000;
> +			if (fan_info->fan.ucFanTableFormat >= 3) {
> +				adev->pm.dpm.fan.control_mode = fan_info->fan3.ucFanControlMode;
> +				adev->pm.dpm.fan.default_max_fan_pwm =
> +					le16_to_cpu(fan_info->fan3.usFanPWMMax);
> +				adev->pm.dpm.fan.default_fan_output_sensitivity = 4836;
> +				adev->pm.dpm.fan.fan_output_sensitivity =
> +					le16_to_cpu(fan_info->fan3.usFanOutputSensitivity);
> +			}
> +			adev->pm.dpm.fan.ucode_fan_control = true;
> +		}
> +	}
> +
> +	/* clock dependancy tables, shedding tables */
> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE4)) {
> +		if (power_info->pplib4.usVddcDependencyOnSCLKOffset) {
> +			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnSCLKOffset));
> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_sclk,
> +								 dep_table);
> +			if (ret) {
> +				amdgpu_free_extended_power_table(adev);
> +				return ret;
> +			}
> +		}
> +		if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
> +			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usVddciDependencyOnMCLKOffset));
> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddci_dependency_on_mclk,
> +								 dep_table);
> +			if (ret) {
> +				amdgpu_free_extended_power_table(adev);
> +				return ret;
> +			}
> +		}
> +		if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
> +			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usVddcDependencyOnMCLKOffset));
> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.vddc_dependency_on_mclk,
> +								 dep_table);
> +			if (ret) {
> +				amdgpu_free_extended_power_table(adev);
> +				return ret;
> +			}
> +		}
> +		if (power_info->pplib4.usMvddDependencyOnMCLKOffset) {
> +			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usMvddDependencyOnMCLKOffset));
> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev->pm.dpm.dyn_state.mvdd_dependency_on_mclk,
> +								 dep_table);
> +			if (ret) {
> +				amdgpu_free_extended_power_table(adev);
> +				return ret;
> +			}
> +		}
> +		if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
> +			ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =
> +				(ATOM_PPLIB_Clock_Voltage_Limit_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usMaxClockVoltageOnDCOffset));
> +			if (clk_v->ucNumEntries) {
> +				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.sclk =
> +					le16_to_cpu(clk_v->entries[0].usSclkLow) |
> +					(clk_v->entries[0].ucSclkHigh << 16);
> +				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.mclk =
> +					le16_to_cpu(clk_v->entries[0].usMclkLow) |
> +					(clk_v->entries[0].ucMclkHigh << 16);
> +				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.vddc =
> +					le16_to_cpu(clk_v->entries[0].usVddc);
> +				adev->pm.dpm.dyn_state.max_clock_voltage_on_dc.vddci =
> +					le16_to_cpu(clk_v->entries[0].usVddci);
> +			}
> +		}
> +		if (power_info->pplib4.usVddcPhaseShedLimitsTableOffset) {
> +			ATOM_PPLIB_PhaseSheddingLimits_Table *psl =
> +				(ATOM_PPLIB_PhaseSheddingLimits_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib4.usVddcPhaseShedLimitsTableOffset));
> +			ATOM_PPLIB_PhaseSheddingLimits_Record *entry;
> +
> +			adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries =
> +				kcalloc(psl->ucNumEntries,
> +					sizeof(struct amdgpu_phase_shedding_limits_entry),
> +					GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +
> +			entry = &psl->entries[0];
> +			for (i = 0; i < psl->ucNumEntries; i++) {
> +				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].sclk =
> +					le16_to_cpu(entry->usSclkLow) | (entry->ucSclkHigh << 16);
> +				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].mclk =
> +					le16_to_cpu(entry->usMclkLow) | (entry->ucMclkHigh << 16);
> +				adev->pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].voltage =
> +					le16_to_cpu(entry->usVoltage);
> +				entry = (ATOM_PPLIB_PhaseSheddingLimits_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_PhaseSheddingLimits_Record));
> +			}
> +			adev->pm.dpm.dyn_state.phase_shedding_limits_table.count =
> +				psl->ucNumEntries;
> +		}
> +	}
> +
> +	/* cac data */
> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE5)) {
> +		adev->pm.dpm.tdp_limit = le32_to_cpu(power_info->pplib5.ulTDPLimit);
> +		adev->pm.dpm.near_tdp_limit = le32_to_cpu(power_info->pplib5.ulNearTDPLimit);
> +		adev->pm.dpm.near_tdp_limit_adjusted = adev->pm.dpm.near_tdp_limit;
> +		adev->pm.dpm.tdp_od_limit = le16_to_cpu(power_info->pplib5.usTDPODLimit);
> +		if (adev->pm.dpm.tdp_od_limit)
> +			adev->pm.dpm.power_control = true;
> +		else
> +			adev->pm.dpm.power_control = false;
> +		adev->pm.dpm.tdp_adjustment = 0;
> +		adev->pm.dpm.sq_ramping_threshold = le32_to_cpu(power_info->pplib5.ulSQRampingThreshold);
> +		adev->pm.dpm.cac_leakage = le32_to_cpu(power_info->pplib5.ulCACLeakage);
> +		adev->pm.dpm.load_line_slope = le16_to_cpu(power_info->pplib5.usLoadLineSlope);
> +		if (power_info->pplib5.usCACLeakageTableOffset) {
> +			ATOM_PPLIB_CAC_Leakage_Table *cac_table =
> +				(ATOM_PPLIB_CAC_Leakage_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(power_info->pplib5.usCACLeakageTableOffset));
> +			ATOM_PPLIB_CAC_Leakage_Record *entry;
> +			u32 size = cac_table->ucNumEntries * sizeof(struct amdgpu_cac_leakage_table);
> +			adev->pm.dpm.dyn_state.cac_leakage_table.entries = kzalloc(size, GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.cac_leakage_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			entry = &cac_table->entries[0];
> +			for (i = 0; i < cac_table->ucNumEntries; i++) {
> +				if (adev->pm.dpm.platform_caps & ATOM_PP_PLATFORM_CAP_EVV) {
> +					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc1 =
> +						le16_to_cpu(entry->usVddc1);
> +					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc2 =
> +						le16_to_cpu(entry->usVddc2);
> +					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc3 =
> +						le16_to_cpu(entry->usVddc3);
> +				} else {
> +					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc =
> +						le16_to_cpu(entry->usVddc);
> +					adev->pm.dpm.dyn_state.cac_leakage_table.entries[i].leakage =
> +						le32_to_cpu(entry->ulLeakageValue);
> +				}
> +				entry = (ATOM_PPLIB_CAC_Leakage_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_CAC_Leakage_Record));
> +			}
> +			adev->pm.dpm.dyn_state.cac_leakage_table.count = cac_table->ucNumEntries;
> +		}
> +	}
> +
> +	/* ext tables */
> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
> +		ATOM_PPLIB_EXTENDEDHEADER *ext_hdr = (ATOM_PPLIB_EXTENDEDHEADER *)
> +			(mode_info->atom_context->bios + data_offset +
> +			 le16_to_cpu(power_info->pplib3.usExtendendedHeaderOffset));
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2) &&
> +			ext_hdr->usVCETableOffset) {
> +			VCEClockInfoArray *array = (VCEClockInfoArray *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1);
> +			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *limits =
> +				(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1 +
> +				 1 + array->ucNumEntries * sizeof(VCEClockInfo));
> +			ATOM_PPLIB_VCE_State_Table *states =
> +				(ATOM_PPLIB_VCE_State_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usVCETableOffset) + 1 +
> +				 1 + (array->ucNumEntries * sizeof (VCEClockInfo)) +
> +				 1 + (limits->numEntries * sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record)));
> +			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *entry;
> +			ATOM_PPLIB_VCE_State_Record *state_entry;
> +			VCEClockInfo *vce_clk;
> +			u32 size = limits->numEntries *
> +				sizeof(struct amdgpu_vce_clock_voltage_dependency_entry);
> +			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries =
> +				kzalloc(size, GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.count =
> +				limits->numEntries;
> +			entry = &limits->entries[0];
> +			state_entry = &states->entries[0];
> +			for (i = 0; i < limits->numEntries; i++) {
> +				vce_clk = (VCEClockInfo *)
> +					((u8 *)&array->entries[0] +
> +					 (entry->ucVCEClockInfoIndex * sizeof(VCEClockInfo)));
> +				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].evclk =
> +					le16_to_cpu(vce_clk->usEVClkLow) | (vce_clk->ucEVClkHigh << 16);
> +				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].ecclk =
> +					le16_to_cpu(vce_clk->usECClkLow) | (vce_clk->ucECClkHigh << 16);
> +				adev->pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].v =
> +					le16_to_cpu(entry->usVoltage);
> +				entry = (ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record));
> +			}
> +			adev->pm.dpm.num_of_vce_states =
> +					states->numEntries > AMD_MAX_VCE_LEVELS ?
> +					AMD_MAX_VCE_LEVELS : states->numEntries;
> +			for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++) {
> +				vce_clk = (VCEClockInfo *)
> +					((u8 *)&array->entries[0] +
> +					 (state_entry->ucVCEClockInfoIndex * sizeof(VCEClockInfo)));
> +				adev->pm.dpm.vce_states[i].evclk =
> +					le16_to_cpu(vce_clk->usEVClkLow) | (vce_clk->ucEVClkHigh << 16);
> +				adev->pm.dpm.vce_states[i].ecclk =
> +					le16_to_cpu(vce_clk->usECClkLow) | (vce_clk->ucECClkHigh << 16);
> +				adev->pm.dpm.vce_states[i].clk_idx =
> +					state_entry->ucClockInfoIndex & 0x3f;
> +				adev->pm.dpm.vce_states[i].pstate =
> +					(state_entry->ucClockInfoIndex & 0xc0) >> 6;
> +				state_entry = (ATOM_PPLIB_VCE_State_Record *)
> +					((u8 *)state_entry + sizeof(ATOM_PPLIB_VCE_State_Record));
> +			}
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3) &&
> +			ext_hdr->usUVDTableOffset) {
> +			UVDClockInfoArray *array = (UVDClockInfoArray *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usUVDTableOffset) + 1);
> +			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *limits =
> +				(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usUVDTableOffset) + 1 +
> +				 1 + (array->ucNumEntries * sizeof (UVDClockInfo)));
> +			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *entry;
> +			u32 size = limits->numEntries *
> +				sizeof(struct amdgpu_uvd_clock_voltage_dependency_entry);
> +			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries =
> +				kzalloc(size, GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.count =
> +				limits->numEntries;
> +			entry = &limits->entries[0];
> +			for (i = 0; i < limits->numEntries; i++) {
> +				UVDClockInfo *uvd_clk = (UVDClockInfo *)
> +					((u8 *)&array->entries[0] +
> +					 (entry->ucUVDClockInfoIndex * sizeof(UVDClockInfo)));
> +				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].vclk =
> +					le16_to_cpu(uvd_clk->usVClkLow) | (uvd_clk->ucVClkHigh << 16);
> +				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].dclk =
> +					le16_to_cpu(uvd_clk->usDClkLow) | (uvd_clk->ucDClkHigh << 16);
> +				adev->pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].v =
> +					le16_to_cpu(entry->usVoltage);
> +				entry = (ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record));
> +			}
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4) &&
> +			ext_hdr->usSAMUTableOffset) {
> +			ATOM_PPLIB_SAMClk_Voltage_Limit_Table *limits =
> +				(ATOM_PPLIB_SAMClk_Voltage_Limit_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usSAMUTableOffset) + 1);
> +			ATOM_PPLIB_SAMClk_Voltage_Limit_Record *entry;
> +			u32 size = limits->numEntries *
> +				sizeof(struct amdgpu_clock_voltage_dependency_entry);
> +			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries =
> +				kzalloc(size, GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.count =
> +				limits->numEntries;
> +			entry = &limits->entries[0];
> +			for (i = 0; i < limits->numEntries; i++) {
> +				adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].clk =
> +					le16_to_cpu(entry->usSAMClockLow) | (entry->ucSAMClockHigh << 16);
> +				adev->pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].v =
> +					le16_to_cpu(entry->usVoltage);
> +				entry = (ATOM_PPLIB_SAMClk_Voltage_Limit_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_SAMClk_Voltage_Limit_Record));
> +			}
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5) &&
> +		    ext_hdr->usPPMTableOffset) {
> +			ATOM_PPLIB_PPM_Table *ppm = (ATOM_PPLIB_PPM_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usPPMTableOffset));
> +			adev->pm.dpm.dyn_state.ppm_table =
> +				kzalloc(sizeof(struct amdgpu_ppm_table), GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.ppm_table) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			adev->pm.dpm.dyn_state.ppm_table->ppm_design = ppm->ucPpmDesign;
> +			adev->pm.dpm.dyn_state.ppm_table->cpu_core_number =
> +				le16_to_cpu(ppm->usCpuCoreNumber);
> +			adev->pm.dpm.dyn_state.ppm_table->platform_tdp =
> +				le32_to_cpu(ppm->ulPlatformTDP);
> +			adev->pm.dpm.dyn_state.ppm_table->small_ac_platform_tdp =
> +				le32_to_cpu(ppm->ulSmallACPlatformTDP);
> +			adev->pm.dpm.dyn_state.ppm_table->platform_tdc =
> +				le32_to_cpu(ppm->ulPlatformTDC);
> +			adev->pm.dpm.dyn_state.ppm_table->small_ac_platform_tdc =
> +				le32_to_cpu(ppm->ulSmallACPlatformTDC);
> +			adev->pm.dpm.dyn_state.ppm_table->apu_tdp =
> +				le32_to_cpu(ppm->ulApuTDP);
> +			adev->pm.dpm.dyn_state.ppm_table->dgpu_tdp =
> +				le32_to_cpu(ppm->ulDGpuTDP);
> +			adev->pm.dpm.dyn_state.ppm_table->dgpu_ulv_power =
> +				le32_to_cpu(ppm->ulDGpuUlvPower);
> +			adev->pm.dpm.dyn_state.ppm_table->tj_max =
> +				le32_to_cpu(ppm->ulTjmax);
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6) &&
> +			ext_hdr->usACPTableOffset) {
> +			ATOM_PPLIB_ACPClk_Voltage_Limit_Table *limits =
> +				(ATOM_PPLIB_ACPClk_Voltage_Limit_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usACPTableOffset) + 1);
> +			ATOM_PPLIB_ACPClk_Voltage_Limit_Record *entry;
> +			u32 size = limits->numEntries *
> +				sizeof(struct amdgpu_clock_voltage_dependency_entry);
> +			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries =
> +				kzalloc(size, GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.count =
> +				limits->numEntries;
> +			entry = &limits->entries[0];
> +			for (i = 0; i < limits->numEntries; i++) {
> +				adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].clk =
> +					le16_to_cpu(entry->usACPClockLow) | (entry->ucACPClockHigh << 16);
> +				adev->pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].v =
> +					le16_to_cpu(entry->usVoltage);
> +				entry = (ATOM_PPLIB_ACPClk_Voltage_Limit_Record *)
> +					((u8 *)entry + sizeof(ATOM_PPLIB_ACPClk_Voltage_Limit_Record));
> +			}
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7) &&
> +			ext_hdr->usPowerTuneTableOffset) {
> +			u8 rev = *(u8 *)(mode_info->atom_context->bios + data_offset +
> +					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> +			ATOM_PowerTune_Table *pt;
> +			adev->pm.dpm.dyn_state.cac_tdp_table =
> +				kzalloc(sizeof(struct amdgpu_cac_tdp_table), GFP_KERNEL);
> +			if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
> +				amdgpu_free_extended_power_table(adev);
> +				return -ENOMEM;
> +			}
> +			if (rev > 0) {
> +				ATOM_PPLIB_POWERTUNE_Table_V1 *ppt = (ATOM_PPLIB_POWERTUNE_Table_V1 *)
> +					(mode_info->atom_context->bios + data_offset +
> +					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> +				adev->pm.dpm.dyn_state.cac_tdp_table->maximum_power_delivery_limit =
> +					ppt->usMaximumPowerDeliveryLimit;
> +				pt = &ppt->power_tune_table;
> +			} else {
> +				ATOM_PPLIB_POWERTUNE_Table *ppt = (ATOM_PPLIB_POWERTUNE_Table *)
> +					(mode_info->atom_context->bios + data_offset +
> +					 le16_to_cpu(ext_hdr->usPowerTuneTableOffset));
> +				adev->pm.dpm.dyn_state.cac_tdp_table->maximum_power_delivery_limit = 255;
> +				pt = &ppt->power_tune_table;
> +			}
> +			adev->pm.dpm.dyn_state.cac_tdp_table->tdp = le16_to_cpu(pt->usTDP);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->configurable_tdp =
> +				le16_to_cpu(pt->usConfigurableTDP);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->tdc = le16_to_cpu(pt->usTDC);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->battery_power_limit =
> +				le16_to_cpu(pt->usBatteryPowerLimit);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->small_power_limit =
> +				le16_to_cpu(pt->usSmallPowerLimit);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->low_cac_leakage =
> +				le16_to_cpu(pt->usLowCACLeakage);
> +			adev->pm.dpm.dyn_state.cac_tdp_table->high_cac_leakage =
> +				le16_to_cpu(pt->usHighCACLeakage);
> +		}
> +		if ((le16_to_cpu(ext_hdr->usSize) >= SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8) &&
> +				ext_hdr->usSclkVddgfxTableOffset) {
> +			dep_table = (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
> +				(mode_info->atom_context->bios + data_offset +
> +				 le16_to_cpu(ext_hdr->usSclkVddgfxTableOffset));
> +			ret = amdgpu_parse_clk_voltage_dep_table(
> +					&adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk,
> +					dep_table);
> +			if (ret) {
> +				kfree(adev->pm.dpm.dyn_state.vddgfx_dependency_on_sclk.entries);
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +void amdgpu_free_extended_power_table(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_dpm_dynamic_state *dyn_state = &adev->pm.dpm.dyn_state;
> +
> +	kfree(dyn_state->vddc_dependency_on_sclk.entries);
> +	kfree(dyn_state->vddci_dependency_on_mclk.entries);
> +	kfree(dyn_state->vddc_dependency_on_mclk.entries);
> +	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
> +	kfree(dyn_state->cac_leakage_table.entries);
> +	kfree(dyn_state->phase_shedding_limits_table.entries);
> +	kfree(dyn_state->ppm_table);
> +	kfree(dyn_state->cac_tdp_table);
> +	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
> +	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
> +	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
> +	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
> +	kfree(dyn_state->vddgfx_dependency_on_sclk.entries);
> +}
> +
> +static const char *pp_lib_thermal_controller_names[] = {
> +	"NONE",
> +	"lm63",
> +	"adm1032",
> +	"adm1030",
> +	"max6649",
> +	"lm64",
> +	"f75375",
> +	"RV6xx",
> +	"RV770",
> +	"adt7473",
> +	"NONE",
> +	"External GPIO",
> +	"Evergreen",
> +	"emc2103",
> +	"Sumo",
> +	"Northern Islands",
> +	"Southern Islands",
> +	"lm96163",
> +	"Sea Islands",
> +	"Kaveri/Kabini",
> +};
> +
> +void amdgpu_add_thermal_controller(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
> +	ATOM_PPLIB_POWERPLAYTABLE *power_table;
> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
> +	ATOM_PPLIB_THERMALCONTROLLER *controller;
> +	struct amdgpu_i2c_bus_rec i2c_bus;
> +	u16 data_offset;
> +	u8 frev, crev;
> +
> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context, index, NULL,
> +				   &frev, &crev, &data_offset))
> +		return;
> +	power_table = (ATOM_PPLIB_POWERPLAYTABLE *)
> +		(mode_info->atom_context->bios + data_offset);
> +	controller = &power_table->sThermalController;
> +
> +	/* add the i2c bus for thermal/fan chip */
> +	if (controller->ucType > 0) {
> +		if (controller->ucFanParameters & ATOM_PP_FANPARAMETERS_NOFAN)
> +			adev->pm.no_fan = true;
> +		adev->pm.fan_pulses_per_revolution =
> +			controller->ucFanParameters & ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_MASK;
> +		if (adev->pm.fan_pulses_per_revolution) {
> +			adev->pm.fan_min_rpm = controller->ucFanMinRPM;
> +			adev->pm.fan_max_rpm = controller->ucFanMaxRPM;
> +		}
> +		if (controller->ucType == ATOM_PP_THERMALCONTROLLER_RV6xx) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_RV6XX;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_RV770) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_RV770;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_EVERGREEN) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_EVERGREEN;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_SUMO) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_SUMO;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_NISLANDS) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_NI;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_SISLANDS) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_SI;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_CISLANDS) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_CI;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_KAVERI) {
> +			DRM_INFO("Internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_KV;
> +		} else if (controller->ucType == ATOM_PP_THERMALCONTROLLER_EXTERNAL_GPIO) {
> +			DRM_INFO("External GPIO thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_EXTERNAL_GPIO;
> +		} else if (controller->ucType ==
> +			   ATOM_PP_THERMALCONTROLLER_ADT7473_WITH_INTERNAL) {
> +			DRM_INFO("ADT7473 with internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_ADT7473_WITH_INTERNAL;
> +		} else if (controller->ucType ==
> +			   ATOM_PP_THERMALCONTROLLER_EMC2103_WITH_INTERNAL) {
> +			DRM_INFO("EMC2103 with internal thermal controller %s fan control\n",
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_EMC2103_WITH_INTERNAL;
> +		} else if (controller->ucType < ARRAY_SIZE(pp_lib_thermal_controller_names)) {
> +			DRM_INFO("Possible %s thermal controller at 0x%02x %s fan control\n",
> +				 pp_lib_thermal_controller_names[controller->ucType],
> +				 controller->ucI2cAddress >> 1,
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +			adev->pm.int_thermal_type = THERMAL_TYPE_EXTERNAL;
> +			i2c_bus = amdgpu_atombios_lookup_i2c_gpio(adev, controller->ucI2cLine);
> +			adev->pm.i2c_bus = amdgpu_i2c_lookup(adev, &i2c_bus);
> +			if (adev->pm.i2c_bus) {
> +				struct i2c_board_info info = { };
> +				const char *name = pp_lib_thermal_controller_names[controller->ucType];
> +				info.addr = controller->ucI2cAddress >> 1;
> +				strlcpy(info.type, name, sizeof(info.type));
> +				i2c_new_client_device(&adev->pm.i2c_bus->adapter, &info);
> +			}
> +		} else {
> +			DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
> +				 controller->ucType,
> +				 controller->ucI2cAddress >> 1,
> +				 (controller->ucFanParameters &
> +				  ATOM_PP_FANPARAMETERS_NOFAN) ? "without" : "with");
> +		}
> +	}
> +}
> +
> +struct amd_vce_state* amdgpu_get_vce_clock_state(void *handle, u32 idx)
> +{
> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +
> +	if (idx < adev->pm.dpm.num_of_vce_states)
> +		return &adev->pm.dpm.vce_states[idx];
> +
> +	return NULL;
> +}
> +
> +static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct amdgpu_device *adev,
> +						     enum amd_pm_state_type dpm_state)
> +{
> +	int i;
> +	struct amdgpu_ps *ps;
> +	u32 ui_class;
> +	bool single_display = (adev->pm.dpm.new_active_crtc_count < 2) ?
> +		true : false;
> +
> +	/* check if the vblank period is too short to adjust the mclk */
> +	if (single_display && adev->powerplay.pp_funcs->vblank_too_short) {
> +		if (amdgpu_dpm_vblank_too_short(adev))
> +			single_display = false;
> +	}
> +
> +	/* certain older asics have a separare 3D performance state,
> +	 * so try that first if the user selected performance
> +	 */
> +	if (dpm_state == POWER_STATE_TYPE_PERFORMANCE)
> +		dpm_state = POWER_STATE_TYPE_INTERNAL_3DPERF;
> +	/* balanced states don't exist at the moment */
> +	if (dpm_state == POWER_STATE_TYPE_BALANCED)
> +		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> +
> +restart_search:
> +	/* Pick the best power state based on current conditions */
> +	for (i = 0; i < adev->pm.dpm.num_ps; i++) {
> +		ps = &adev->pm.dpm.ps[i];
> +		ui_class = ps->class & ATOM_PPLIB_CLASSIFICATION_UI_MASK;
> +		switch (dpm_state) {
> +		/* user states */
> +		case POWER_STATE_TYPE_BATTERY:
> +			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_BATTERY) {
> +				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> +					if (single_display)
> +						return ps;
> +				} else
> +					return ps;
> +			}
> +			break;
> +		case POWER_STATE_TYPE_BALANCED:
> +			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_BALANCED) {
> +				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> +					if (single_display)
> +						return ps;
> +				} else
> +					return ps;
> +			}
> +			break;
> +		case POWER_STATE_TYPE_PERFORMANCE:
> +			if (ui_class == ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE) {
> +				if (ps->caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
> +					if (single_display)
> +						return ps;
> +				} else
> +					return ps;
> +			}
> +			break;
> +		/* internal states */
> +		case POWER_STATE_TYPE_INTERNAL_UVD:
> +			if (adev->pm.dpm.uvd_ps)
> +				return adev->pm.dpm.uvd_ps;
> +			else
> +				break;
> +		case POWER_STATE_TYPE_INTERNAL_UVD_SD:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_UVD_HD:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
> +			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_BOOT:
> +			return adev->pm.dpm.boot_ps;
> +		case POWER_STATE_TYPE_INTERNAL_THERMAL:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_ACPI:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_ACPI)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_ULV:
> +			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
> +				return ps;
> +			break;
> +		case POWER_STATE_TYPE_INTERNAL_3DPERF:
> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
> +				return ps;
> +			break;
> +		default:
> +			break;
> +		}
> +	}
> +	/* use a fallback state if we didn't match */
> +	switch (dpm_state) {
> +	case POWER_STATE_TYPE_INTERNAL_UVD_SD:
> +		dpm_state = POWER_STATE_TYPE_INTERNAL_UVD_HD;
> +		goto restart_search;
> +	case POWER_STATE_TYPE_INTERNAL_UVD_HD:
> +	case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
> +	case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
> +		if (adev->pm.dpm.uvd_ps) {
> +			return adev->pm.dpm.uvd_ps;
> +		} else {
> +			dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> +			goto restart_search;
> +		}
> +	case POWER_STATE_TYPE_INTERNAL_THERMAL:
> +		dpm_state = POWER_STATE_TYPE_INTERNAL_ACPI;
> +		goto restart_search;
> +	case POWER_STATE_TYPE_INTERNAL_ACPI:
> +		dpm_state = POWER_STATE_TYPE_BATTERY;
> +		goto restart_search;
> +	case POWER_STATE_TYPE_BATTERY:
> +	case POWER_STATE_TYPE_BALANCED:
> +	case POWER_STATE_TYPE_INTERNAL_3DPERF:
> +		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
> +		goto restart_search;
> +	default:
> +		break;
> +	}
> +
> +	return NULL;
> +}
> +
> +int amdgpu_dpm_change_power_state_locked(void *handle)
> +{
> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> +	struct amdgpu_ps *ps;
> +	enum amd_pm_state_type dpm_state;
> +	int ret;
> +	bool equal = false;
> +
> +	/* if dpm init failed */
> +	if (!adev->pm.dpm_enabled)
> +		return 0;
> +
> +	if (adev->pm.dpm.user_state != adev->pm.dpm.state) {
> +		/* add other state override checks here */
> +		if ((!adev->pm.dpm.thermal_active) &&
> +		    (!adev->pm.dpm.uvd_active))
> +			adev->pm.dpm.state = adev->pm.dpm.user_state;
> +	}
> +	dpm_state = adev->pm.dpm.state;
> +
> +	ps = amdgpu_dpm_pick_power_state(adev, dpm_state);
> +	if (ps)
> +		adev->pm.dpm.requested_ps = ps;
> +	else
> +		return -EINVAL;
> +
> +	if (amdgpu_dpm == 1 && adev->powerplay.pp_funcs->print_power_state) {
> +		printk("switching from power state:\n");
> +		amdgpu_dpm_print_power_state(adev, adev->pm.dpm.current_ps);
> +		printk("switching to power state:\n");
> +		amdgpu_dpm_print_power_state(adev, adev->pm.dpm.requested_ps);
> +	}
> +
> +	/* update whether vce is active */
> +	ps->vce_active = adev->pm.dpm.vce_active;
> +	if (adev->powerplay.pp_funcs->display_configuration_changed)
> +		amdgpu_dpm_display_configuration_changed(adev);
> +
> +	ret = amdgpu_dpm_pre_set_power_state(adev);
> +	if (ret)
> +		return ret;
> +
> +	if (adev->powerplay.pp_funcs->check_state_equal) {
> +		if (0 != amdgpu_dpm_check_state_equal(adev, adev->pm.dpm.current_ps, adev->pm.dpm.requested_ps, &equal))
> +			equal = false;
> +	}
> +
> +	if (equal)
> +		return 0;
> +
> +	if (adev->powerplay.pp_funcs->set_power_state)
> +		adev->powerplay.pp_funcs->set_power_state(adev->powerplay.pp_handle);
> +
> +	amdgpu_dpm_post_set_power_state(adev);
> +
> +	adev->pm.dpm.current_active_crtcs = adev->pm.dpm.new_active_crtcs;
> +	adev->pm.dpm.current_active_crtc_count = adev->pm.dpm.new_active_crtc_count;
> +
> +	if (adev->powerplay.pp_funcs->force_performance_level) {
> +		if (adev->pm.dpm.thermal_active) {
> +			enum amd_dpm_forced_level level = adev->pm.dpm.forced_level;
> +			/* force low perf level for thermal */
> +			amdgpu_dpm_force_performance_level(adev, AMD_DPM_FORCED_LEVEL_LOW);
> +			/* save the user's level */
> +			adev->pm.dpm.forced_level = level;
> +		} else {
> +			/* otherwise, user selected level */
> +			amdgpu_dpm_force_performance_level(adev, adev->pm.dpm.forced_level);
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
> new file mode 100644
> index 000000000000..7ac30f1aed20
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
> @@ -0,0 +1,37 @@
> +/*
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +#ifndef __LEGACY_DPM_H__
> +#define __LEGACY_DPM_H__
> +
> +void amdgpu_dpm_print_class_info(u32 class, u32 class2);
> +void amdgpu_dpm_print_cap_info(u32 caps);
> +void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
> +				struct amdgpu_ps *rps);
> +int amdgpu_get_platform_caps(struct amdgpu_device *adev);
> +int amdgpu_parse_extended_power_table(struct amdgpu_device *adev);
> +void amdgpu_free_extended_power_table(struct amdgpu_device *adev);
> +void amdgpu_add_thermal_controller(struct amdgpu_device *adev);
> +struct amd_vce_state* amdgpu_get_vce_clock_state(void *handle, u32 idx);
> +int amdgpu_dpm_change_power_state_locked(void *handle);
> +void amdgpu_pm_print_power_states(struct amdgpu_device *adev);
> +#endif
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> index ab0fa6c79255..35d287903aea 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
> @@ -37,6 +37,7 @@
>   #include <linux/math64.h>
>   #include <linux/seq_file.h>
>   #include <linux/firmware.h>
> +#include <legacy_dpm.h>
>   
>   #define MC_CG_ARB_FREQ_F0           0x0a
>   #define MC_CG_ARB_FREQ_F1           0x0b
> @@ -7800,7 +7801,7 @@ static int si_dpm_hw_init(void *handle)
>   	else
>   		adev->pm.dpm_enabled = true;
>   	mutex_unlock(&adev->pm.mutex);
> -	amdgpu_pm_compute_clocks(adev);
> +	amdgpu_dpm_compute_clocks(adev);
>   	return ret;
>   }
>   
> @@ -7848,7 +7849,7 @@ static int si_dpm_resume(void *handle)
>   			adev->pm.dpm_enabled = true;
>   		mutex_unlock(&adev->pm.mutex);
>   		if (adev->pm.dpm_enabled)
> -			amdgpu_pm_compute_clocks(adev);
> +			amdgpu_dpm_compute_clocks(adev);
>   	}
>   	return 0;
>   }
> @@ -8101,6 +8102,7 @@ static const struct amd_pm_funcs si_dpm_funcs = {
>   	.check_state_equal = &si_check_state_equal,
>   	.get_vce_clock_state = amdgpu_get_vce_clock_state,
>   	.read_sensor = &si_dpm_read_sensor,
> +	.change_power_state = amdgpu_dpm_change_power_state_locked,
>   };
>   
>   static const struct amdgpu_irq_src_funcs si_dpm_irq_funcs = {
> 
