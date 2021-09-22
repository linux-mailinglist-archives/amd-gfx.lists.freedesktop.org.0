Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A3641448A
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Sep 2021 11:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA89289DB8;
	Wed, 22 Sep 2021 09:08:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2A589DB8
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Sep 2021 09:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzDDylioZlylPdLHauc8mYErVKY5sr9BD9PgkBEnFKO8gpb1sjxBrsxx3HlD/PPFy3BvbhIY8KehqB+VQDwFLXWYMxzAJCfZfUtE5gUoc0uNXnFgPOis4ofUioaI4GizaCbZjG9gtf+qss8G6AoU7uXvEkfLA/rvaAS1Z8hYKVDXgVGVrNwf/M1fq4PO300FFiKnp4k5vLn+Dxe5iPk6aW4y5cvD3Fua3QEth/++r64sXKyDTfa980mGfOZrv9aukzwyP5PT8Azc2ktaOByBeDaScoEYzXSHCmZhbNQdjUtfovOFzgm+0G07QWqEkxjNGZEeFYk/SvjObWd29j9+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Wvq28fF5C+DGNmn4+HO+ld1SI3wh44rTaAogM6pq7Xw=;
 b=j89eBEf29O41BzIZf5XvOJzQHtXz/BDtfdKmLg2+c1TaQpQJOHDFLXt/wG1/hyvPFrDVE3OTMpoHkKeRg3tS7TaoigswsgCmzujqvIzsPtoPkvLelvaDviJL9m2LodafgriRXMFtDP3iugkTTGNqDDL/cHIbCNIt6AMT2R0Y8D6TjZVy1DGXV1kSUlNT48hKQUjzamwMyETSsYcrFQEzAozd8e3FtkQgmixY62qbTbN5fEQuzu4dquewupghkjwfHdWQPMq0gNk3wIvHTgtbtfBrBTOk4nbDiGN+Fk48/zcL2PgtHn4t9lbGw93tMsPNS9F8+YHPJbno80nKiBI/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wvq28fF5C+DGNmn4+HO+ld1SI3wh44rTaAogM6pq7Xw=;
 b=nGoeNekkcq326p1th6e6XPIdQrQbsBz9xuFk8dibxiY5snDUXYgpy0SRm1+EH5Auy74tJo105oAQGvyV8pNgA/3mJySoJAC4u72YL82Vr8y59e+R9KcAj7nM6x1NgtxXK4C5L+2d47sOr3wGOAMf9CtdQvaLrOiq8yWJoKBUQRM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19)
 by DM5PR12MB2440.namprd12.prod.outlook.com (2603:10b6:4:b6::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 22 Sep
 2021 09:08:15 +0000
Received: from DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::5879:5961:8a30:6a57]) by DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::5879:5961:8a30:6a57%7]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 09:08:15 +0000
Subject: Re: [PATCH 61/66] drm/amdgpu: convert IP version array to include
 instances
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210921180725.1985552-1-alexander.deucher@amd.com>
 <20210921180725.1985552-62-alexander.deucher@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
Message-ID: <1af0fadb-8301-df97-2398-80d88b757590@amd.com>
Date: Wed, 22 Sep 2021 14:38:01 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210921180725.1985552-62-alexander.deucher@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:1::13) To DM6PR12MB3930.namprd12.prod.outlook.com
 (2603:10b6:5:1c9::19)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 PN1PR01CA0073.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 09:08:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a962dbe-9b49-4991-e82e-08d97da8821c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2440ED4ACF13541673543C5B97A29@DM5PR12MB2440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 105cu7lCAy3zifpRlKzj6SAdc0SGHE17H9Wrvcq69XaAyS2iCgDzZkOI94BBgKWsKqb5pC89zvsm7CfMshTqLWEttMuiJhx0/vi68sdZ+VbsMOHB5g1vvOGtk3uJdZ9d2O6I6jZ27EpXZ2l7TELypYZF+vA9Tq3jcC5Bn/kfg+Ki0/0wtrfpiPqan/2y7Nd3jZ1JRjBbCymxp09pif7Jzm4LxQ3dCJnkFRfudzwy6/yCT5uZUoAVJIdwPPIg9H8G2KlJCrfX95+xB2d9NQ827oO8v+6N0bdqougVPQ5ocNhxOUAXddextTguoXm5LdN5oYt1bFutSunAusmoyEEn0QsISukM9suQJNiHm3sprPw6wHj9Hbyha9nFQbqDR/QLaC+NqYyGTpNnjTi0dJraUbPmiWaDB2Rw8EaBIvPiE2Ph4FYKvB5V/0zFhrfnAea5HjsNjA17sZVSCOvf83yXrq1V+Y9VSFqY3+LZ6BCWUUCmFR4of6bHYEPHEOlDzrQjFWQV3OVP4JvEdclidmlr7LfWEqjFjyBUt1cULPVPVYfKDC20T8vvwp55jVyaA6vHyIW+UgyBennCH7aLoDiMGjytP6E/pCgtc3RPHE6fWcVX0z5Obq+i91/n1FCZh2vOZFAOR7xF9XzABHaBO5oHY/YWoCJrnq4Djtvac4xyt8GavYXEC0/R4cC+OB1zWNku21uAlLWu1so+YfWa2gIo4EE+4Aju+3nKJbdMy+B9y04xrk4wrqs0Gy4D5qajMlrL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3930.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(53546011)(66556008)(508600001)(83380400001)(36756003)(66476007)(38100700002)(66946007)(30864003)(316002)(16576012)(26005)(6666004)(5660300002)(186003)(956004)(6486002)(86362001)(8936002)(8676002)(2906002)(2616005)(31696002)(21314003)(45980500001)(43740500002)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3czSldUZG5mekRoUGw1QjdYaC9hMDBxUlZCRmNHM3dpdk9ydXY4WG5MRGRw?=
 =?utf-8?B?aExnTC8zZURqZXlMSXFnWGVXRnNoM2ZkNUhvMXhCa29GUXo5b0tiREZDYmw0?=
 =?utf-8?B?R3NKWE5jd3h1SVh4Q2FvNFdva1lEY0ErUkE1Q1ZPUHRvR21TMDVEMGhFd3Zp?=
 =?utf-8?B?M0NDektwc285dTFtOUlGMkZ0UEUyUmVBRWtIOUk4RER3QzhaakpFQ0pONk5a?=
 =?utf-8?B?cG1lWCtVWG1hb1B4dEFFVlBmUkZlNTQ2eDNLODRzL1poYWovazFKWWxkdFRw?=
 =?utf-8?B?c0ZYbUszbE9oc0NjWG1ZZlJzQWJLYTI2WC9wZllGdG5uTWdjQ1Y3WmlwWTVy?=
 =?utf-8?B?UkRMQ0RhZ0MvVE5JbzJsN1RBV2gxZkRrbXI0VDMxQjNCQllQNmE5QXZwTEFR?=
 =?utf-8?B?b0VSaklYQ3FuNm53OUs4VitxTHVjV21FOTFuQ2NOZDg1M1hETEF0SFptb2dz?=
 =?utf-8?B?UWVkejkrbHVjUERBOEFySlVOM2hMdTlweWcyMkFkelV3blpEWGFVU1o2L1Fm?=
 =?utf-8?B?ZGRxbmwvNDJwQnhmZlNhaW51OTcydVFsWVlpRHAzL0hUb2QxK3VnempLM3dr?=
 =?utf-8?B?cmFVUEFvMjFlVzJJQ1FLODcwUXhXdGhhV0hjczd4cmZxT0FycmlGaytOOE5k?=
 =?utf-8?B?dWVjOCtpUDV0aytnelR3dEhaUE1sbFdFY1NQREtmZnNYMEhTL1pNb0g1cVY1?=
 =?utf-8?B?ck41ZFJDQ1Q3Nkw4aWRFU1QyUlJDM0Nkd1hhbjhPVjhsdWE3eXErRkRhZ1JB?=
 =?utf-8?B?dERvQ0NXekF2U2NZMEFJZysycm4yekZmWkt1VnBMbVV1aGJtNHlIZGtwTTlh?=
 =?utf-8?B?eFRmY2FBenZjYTNMYS9pWk9Ec3dIZUpJYVJldFBUbWNhOUxMSFI4TEtSL2tr?=
 =?utf-8?B?UERuVXB3eHVEbkgra0pXdDM1NjNvekpLeFIvZ1F3N2cyMUtPYjZ4QWJyeCt0?=
 =?utf-8?B?eEljNkFvUDJVUk5Nb3ZSTjAvcExGaWpnZUdsNndtQkRhc0FWM2lLc1k0d0FK?=
 =?utf-8?B?SFJubE9FZCs0UnlQRzU3Skx0Uk84Sm1HaGQzVDl2eTVIajVLemVLY3BDMGMr?=
 =?utf-8?B?RCthbU9JcUh2ZldoN3hCZHdVR1FBQWtLWWxXVTJUWWNoOWJydDNSYmRDbjhr?=
 =?utf-8?B?bWxSa0FDdFZGT1RvdXdsYVJselQvMjZ4blFvT1gwVXdxVVBHckRjYlpLQzN0?=
 =?utf-8?B?UlpNVGNOendIM0tUc3YzNDRmZWlNekdsODJORnYyVzNJd0puTWlhWUdvSE9Y?=
 =?utf-8?B?WUJ6NHJPc2N6NXFRWVBhVkVvQ1o2OXZHOHdtRDF5TmwrVW5DMXVQZHIwV3R2?=
 =?utf-8?B?V2ZPVG1ZVWFUdmJnSkJqV2FFMnFrVGoxNDRvZ3VCUjMvQVhSOERjcm9FVUZF?=
 =?utf-8?B?c1RtY2dZY05aQSt6dHAyalZLaWllNlh6UEdGUTlmVmNhTnBZd1FRN1JZUWZX?=
 =?utf-8?B?OS8wZXBwc2dFTCtEUmtzOVdhQ2dtcjN1RTJxWDJ0TThLY1V6aWJQYTdFMzIr?=
 =?utf-8?B?MHZnaTB0ZzZzT1Yxa1BuMTFMQXRZN081UHUzL1U3bFdRUlZzZUFITldKM0Nk?=
 =?utf-8?B?VERhT1N3RU9ZQ3dyUEw0RTRnK3FhNjBFWmRPQk1XWlM3eUhjNGV0dHZTelI1?=
 =?utf-8?B?Z0VXMzlsZnZtbFNIendIaUJSbHk1Mzg0MHFRdHBIVlZvUmNGNUpWVzVIZ29X?=
 =?utf-8?B?Rndma3BwWFY4eW1FU291bWNjSnlqbUNTeUw1bzRWeFVNamU5RGtPaklsYlIr?=
 =?utf-8?Q?Enp93yhPyhn36qnI01l2j9NtfuH5qUx41jdVyqK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a962dbe-9b49-4991-e82e-08d97da8821c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3930.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:08:14.8601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEtUVC9AsTqodi2oevHpPPLTDxnQpROkAum7Bbtb/mmbe06sIsrGbpMKNgTi/V3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2440
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



On 9/21/2021 11:37 PM, Alex Deucher wrote:
> Allow us to query instances versions more cleanly.
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 262 +++++++++---------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |  34 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |   4 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_0.c       |   2 +-
>   drivers/gpu/drm/amd/amdgpu/athub_v2_1.c       |   2 +-
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  80 +++---
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c         |  72 ++---
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c      |   4 +-
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  16 +-
>   drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c         |  14 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c       |  14 +-
>   drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c       |   2 +-
>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   4 +-
>   drivers/gpu/drm/amd/amdgpu/nv.c               |   8 +-
>   drivers/gpu/drm/amd/amdgpu/psp_v11_0.c        |   4 +-
>   drivers/gpu/drm/amd/amdgpu/psp_v13_0.c        |   4 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  34 +--
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |   8 +-
>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |  10 +-
>   drivers/gpu/drm/amd/amdgpu/soc15.c            |  24 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |   4 +-
>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   8 +-
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  26 +-
>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |  52 ++--
>   .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   |  32 +--
>   .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   |  24 +-
>   .../gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c    |  28 +-
>   .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  10 +-
>   29 files changed, 394 insertions(+), 394 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index b153c3740307..f4bceb2624fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1096,7 +1096,7 @@ struct amdgpu_device {
>   	struct pci_saved_state          *pci_state;
>   
>   	struct amdgpu_reset_control     *reset_cntl;
> -	uint32_t                        ip_versions[HW_ID_MAX];
> +	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];

Here is the confusion. "ip_versions" is used like this - 
adev->ip_versions[MMHUB_HWIP] - which means the first dimension can max 
out at MAX_HWIP. So why is the array maxed to HW_ID_MAX?  HWID looks 
like a completely different thing.

Got this confusion while reviewing patch 52. Besides, this change 
doesn't go well with that patch because HWIP is really replicating 
instances.

Thanks,
Lijo

>   };
>   
>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 9d8aea39f36a..eff348dee9e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -369,7 +369,7 @@ int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev)
>   							hw_id_names[le16_to_cpu(ip->hw_id)]);
>   					adev->reg_offset[hw_ip][ip->number_instance] =
>   						ip->base_address;
> -					adev->ip_versions[hw_ip + ip->number_instance] =
> +					adev->ip_versions[hw_ip][ip->number_instance] =
>   						amdgpu_discovery_convert_version(ip->major,
>   										 ip->minor,
>   										 ip->revision);
> @@ -525,139 +525,139 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	case CHIP_VEGA10:
>   		vega10_reg_base_init(adev);
>   		adev->sdma.num_instances = 2;
> -		adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 0, 0);
> -		adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 0, 0);
> -		adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 0, 0);
> -		adev->ip_versions[DF_HWIP] = IP_VERSION(2, 1, 0);
> -		adev->ip_versions[NBIO_HWIP] = IP_VERSION(6, 1, 0);
> -		adev->ip_versions[UMC_HWIP] = IP_VERSION(6, 0, 0);
> -		adev->ip_versions[MP0_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[MP1_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[THM_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[SMUIO_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[GC_HWIP] = IP_VERSION(9, 0, 1);
> -		adev->ip_versions[UVD_HWIP] = IP_VERSION(7, 0, 0);
> -		adev->ip_versions[VCE_HWIP] = IP_VERSION(4, 0, 0);
> -		adev->ip_versions[DCI_HWIP] = IP_VERSION(12, 0, 0);
> +		adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 0, 0);
> +		adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 0, 0);
> +		adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 0, 0);
> +		adev->ip_versions[DF_HWIP][0] = IP_VERSION(2, 1, 0);
> +		adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(6, 1, 0);
> +		adev->ip_versions[UMC_HWIP][0] = IP_VERSION(6, 0, 0);
> +		adev->ip_versions[MP0_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[MP1_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[THM_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 0, 1);
> +		adev->ip_versions[UVD_HWIP][0] = IP_VERSION(7, 0, 0);
> +		adev->ip_versions[VCE_HWIP][0] = IP_VERSION(4, 0, 0);
> +		adev->ip_versions[DCI_HWIP][0] = IP_VERSION(12, 0, 0);
>   		break;
>   	case CHIP_VEGA12:
>   		vega10_reg_base_init(adev);
>   		adev->sdma.num_instances = 2;
> -		adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 3, 0);
> -		adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 3, 0);
> -		adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 0, 1);
> -		adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 0, 1);
> -		adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 0, 1);
> -		adev->ip_versions[DF_HWIP] = IP_VERSION(2, 5, 0);
> -		adev->ip_versions[NBIO_HWIP] = IP_VERSION(6, 2, 0);
> -		adev->ip_versions[UMC_HWIP] = IP_VERSION(6, 1, 0);
> -		adev->ip_versions[MP0_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[MP1_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[THM_HWIP] = IP_VERSION(9, 0, 0);
> -		adev->ip_versions[SMUIO_HWIP] = IP_VERSION(9, 0, 1);
> -		adev->ip_versions[GC_HWIP] = IP_VERSION(9, 2, 1);
> -		adev->ip_versions[UVD_HWIP] = IP_VERSION(7, 0, 0);
> -		adev->ip_versions[VCE_HWIP] = IP_VERSION(4, 0, 0);
> -		adev->ip_versions[DCI_HWIP] = IP_VERSION(12, 0, 1);
> +		adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 3, 0);
> +		adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 3, 0);
> +		adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 0, 1);
> +		adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 0, 1);
> +		adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 0, 1);
> +		adev->ip_versions[DF_HWIP][0] = IP_VERSION(2, 5, 0);
> +		adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(6, 2, 0);
> +		adev->ip_versions[UMC_HWIP][0] = IP_VERSION(6, 1, 0);
> +		adev->ip_versions[MP0_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[MP1_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[THM_HWIP][0] = IP_VERSION(9, 0, 0);
> +		adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(9, 0, 1);
> +		adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 2, 1);
> +		adev->ip_versions[UVD_HWIP][0] = IP_VERSION(7, 0, 0);
> +		adev->ip_versions[VCE_HWIP][0] = IP_VERSION(4, 0, 0);
> +		adev->ip_versions[DCI_HWIP][0] = IP_VERSION(12, 0, 1);
>   		break;
>   	case CHIP_RAVEN:
>   		vega10_reg_base_init(adev);
>   		adev->sdma.num_instances = 1;
>   		adev->vcn.num_vcn_inst = 1;
>   		if (adev->apu_flags & AMD_APU_IS_RAVEN2) {
> -			adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 2, 0);
> -			adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 2, 0);
> -			adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 1, 1);
> -			adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 1, 1);
> -			adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 1, 1);
> -			adev->ip_versions[DF_HWIP] = IP_VERSION(2, 1, 1);
> -			adev->ip_versions[NBIO_HWIP] = IP_VERSION(7, 0, 1);
> -			adev->ip_versions[UMC_HWIP] = IP_VERSION(7, 5, 0);
> -			adev->ip_versions[MP0_HWIP] = IP_VERSION(10, 0, 1);
> -			adev->ip_versions[MP1_HWIP] = IP_VERSION(10, 0, 1);
> -			adev->ip_versions[THM_HWIP] = IP_VERSION(10, 1, 0);
> -			adev->ip_versions[SMUIO_HWIP] = IP_VERSION(10, 0, 1);
> -			adev->ip_versions[GC_HWIP] = IP_VERSION(9, 2, 2);
> -			adev->ip_versions[UVD_HWIP] = IP_VERSION(1, 0, 1);
> -			adev->ip_versions[DCE_HWIP] = IP_VERSION(1, 0, 1);
> +			adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 2, 0);
> +			adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 2, 0);
> +			adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 1, 1);
> +			adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 1, 1);
> +			adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 1, 1);
> +			adev->ip_versions[DF_HWIP][0] = IP_VERSION(2, 1, 1);
> +			adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(7, 0, 1);
> +			adev->ip_versions[UMC_HWIP][0] = IP_VERSION(7, 5, 0);
> +			adev->ip_versions[MP0_HWIP][0] = IP_VERSION(10, 0, 1);
> +			adev->ip_versions[MP1_HWIP][0] = IP_VERSION(10, 0, 1);
> +			adev->ip_versions[THM_HWIP][0] = IP_VERSION(10, 1, 0);
> +			adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(10, 0, 1);
> +			adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 2, 2);
> +			adev->ip_versions[UVD_HWIP][0] = IP_VERSION(1, 0, 1);
> +			adev->ip_versions[DCE_HWIP][0] = IP_VERSION(1, 0, 1);
>   		} else {
> -			adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 1, 0);
> -			adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 1, 0);
> -			adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 1, 0);
> -			adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 1, 0);
> -			adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 1, 0);
> -			adev->ip_versions[DF_HWIP] = IP_VERSION(2, 1, 0);
> -			adev->ip_versions[NBIO_HWIP] = IP_VERSION(7, 0, 0);
> -			adev->ip_versions[UMC_HWIP] = IP_VERSION(7, 0, 0);
> -			adev->ip_versions[MP0_HWIP] = IP_VERSION(10, 0, 0);
> -			adev->ip_versions[MP1_HWIP] = IP_VERSION(10, 0, 0);
> -			adev->ip_versions[THM_HWIP] = IP_VERSION(10, 0, 0);
> -			adev->ip_versions[SMUIO_HWIP] = IP_VERSION(10, 0, 0);
> -			adev->ip_versions[GC_HWIP] = IP_VERSION(9, 1, 0);
> -			adev->ip_versions[UVD_HWIP] = IP_VERSION(1, 0, 0);
> -			adev->ip_versions[DCE_HWIP] = IP_VERSION(1, 0, 0);
> +			adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 1, 0);
> +			adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 1, 0);
> +			adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 1, 0);
> +			adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 1, 0);
> +			adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 1, 0);
> +			adev->ip_versions[DF_HWIP][0] = IP_VERSION(2, 1, 0);
> +			adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(7, 0, 0);
> +			adev->ip_versions[UMC_HWIP][0] = IP_VERSION(7, 0, 0);
> +			adev->ip_versions[MP0_HWIP][0] = IP_VERSION(10, 0, 0);
> +			adev->ip_versions[MP1_HWIP][0] = IP_VERSION(10, 0, 0);
> +			adev->ip_versions[THM_HWIP][0] = IP_VERSION(10, 0, 0);
> +			adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(10, 0, 0);
> +			adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 1, 0);
> +			adev->ip_versions[UVD_HWIP][0] = IP_VERSION(1, 0, 0);
> +			adev->ip_versions[DCE_HWIP][0] = IP_VERSION(1, 0, 0);
>   		}
>   		break;
>   	case CHIP_VEGA20:
>   		vega20_reg_base_init(adev);
>   		adev->sdma.num_instances = 2;
> -		adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 4, 0);
> -		adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 4, 0);
> -		adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 2, 0);
> -		adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 2, 0);
> -		adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 2, 0);
> -		adev->ip_versions[DF_HWIP] = IP_VERSION(3, 6, 0);
> -		adev->ip_versions[NBIO_HWIP] = IP_VERSION(7, 4, 0);
> -		adev->ip_versions[UMC_HWIP] = IP_VERSION(6, 1, 1);
> -		adev->ip_versions[MP0_HWIP] = IP_VERSION(11, 0, 2);
> -		adev->ip_versions[MP1_HWIP] = IP_VERSION(11, 0, 2);
> -		adev->ip_versions[THM_HWIP] = IP_VERSION(11, 0, 2);
> -		adev->ip_versions[SMUIO_HWIP] = IP_VERSION(11, 0, 2);
> -		adev->ip_versions[GC_HWIP] = IP_VERSION(9, 4, 0);
> -		adev->ip_versions[UVD_HWIP] = IP_VERSION(7, 2, 0);
> -		adev->ip_versions[VCE_HWIP] = IP_VERSION(4, 1, 0);
> -		adev->ip_versions[DCI_HWIP] = IP_VERSION(12, 1, 0);
> +		adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 4, 0);
> +		adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 4, 0);
> +		adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 2, 0);
> +		adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 2, 0);
> +		adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 2, 0);
> +		adev->ip_versions[DF_HWIP][0] = IP_VERSION(3, 6, 0);
> +		adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(7, 4, 0);
> +		adev->ip_versions[UMC_HWIP][0] = IP_VERSION(6, 1, 1);
> +		adev->ip_versions[MP0_HWIP][0] = IP_VERSION(11, 0, 2);
> +		adev->ip_versions[MP1_HWIP][0] = IP_VERSION(11, 0, 2);
> +		adev->ip_versions[THM_HWIP][0] = IP_VERSION(11, 0, 2);
> +		adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(11, 0, 2);
> +		adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 4, 0);
> +		adev->ip_versions[UVD_HWIP][0] = IP_VERSION(7, 2, 0);
> +		adev->ip_versions[VCE_HWIP][0] = IP_VERSION(4, 1, 0);
> +		adev->ip_versions[DCI_HWIP][0] = IP_VERSION(12, 1, 0);
>   		break;
>   	case CHIP_ARCTURUS:
>   		arct_reg_base_init(adev);
>   		adev->sdma.num_instances = 8;
>   		adev->vcn.num_vcn_inst = 2;
> -		adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 4, 1);
> -		adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 4, 1);
> -		adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 2, 1);
> -		adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 2, 1);
> -		adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 2, 2);
> -		adev->ip_versions[DF_HWIP] = IP_VERSION(3, 6, 1);
> -		adev->ip_versions[NBIO_HWIP] = IP_VERSION(7, 4, 1);
> -		adev->ip_versions[UMC_HWIP] = IP_VERSION(6, 1, 2);
> -		adev->ip_versions[MP0_HWIP] = IP_VERSION(11, 0, 4);
> -		adev->ip_versions[MP1_HWIP] = IP_VERSION(11, 0, 2);
> -		adev->ip_versions[THM_HWIP] = IP_VERSION(11, 0, 3);
> -		adev->ip_versions[SMUIO_HWIP] = IP_VERSION(11, 0, 3);
> -		adev->ip_versions[GC_HWIP] = IP_VERSION(9, 4, 1);
> -		adev->ip_versions[UVD_HWIP] = IP_VERSION(2, 5, 0);
> +		adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 4, 1);
> +		adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 4, 1);
> +		adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 2, 1);
> +		adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 2, 1);
> +		adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 2, 2);
> +		adev->ip_versions[DF_HWIP][0] = IP_VERSION(3, 6, 1);
> +		adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(7, 4, 1);
> +		adev->ip_versions[UMC_HWIP][0] = IP_VERSION(6, 1, 2);
> +		adev->ip_versions[MP0_HWIP][0] = IP_VERSION(11, 0, 4);
> +		adev->ip_versions[MP1_HWIP][0] = IP_VERSION(11, 0, 2);
> +		adev->ip_versions[THM_HWIP][0] = IP_VERSION(11, 0, 3);
> +		adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(11, 0, 3);
> +		adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 4, 1);
> +		adev->ip_versions[UVD_HWIP][0] = IP_VERSION(2, 5, 0);
>   		break;
>   	case CHIP_ALDEBARAN:
>   		aldebaran_reg_base_init(adev);
>   		adev->sdma.num_instances = 5;
>   		adev->vcn.num_vcn_inst = 2;
> -		adev->ip_versions[MMHUB_HWIP] = IP_VERSION(9, 4, 2);
> -		adev->ip_versions[ATHUB_HWIP] = IP_VERSION(9, 4, 2);
> -		adev->ip_versions[OSSSYS_HWIP] = IP_VERSION(4, 4, 0);
> -		adev->ip_versions[HDP_HWIP] = IP_VERSION(4, 4, 0);
> -		adev->ip_versions[SDMA0_HWIP] = IP_VERSION(4, 4, 0);
> -		adev->ip_versions[DF_HWIP] = IP_VERSION(3, 6, 2);
> -		adev->ip_versions[NBIO_HWIP] = IP_VERSION(7, 4, 4);
> -		adev->ip_versions[UMC_HWIP] = IP_VERSION(6, 7, 0);
> -		adev->ip_versions[MP0_HWIP] = IP_VERSION(13, 0, 2);
> -		adev->ip_versions[MP1_HWIP] = IP_VERSION(13, 0, 2);
> -		adev->ip_versions[THM_HWIP] = IP_VERSION(13, 0, 2);
> -		adev->ip_versions[SMUIO_HWIP] = IP_VERSION(13, 0, 2);
> -		adev->ip_versions[GC_HWIP] = IP_VERSION(9, 4, 2);
> -		adev->ip_versions[UVD_HWIP] = IP_VERSION(2, 6, 0);
> -		adev->ip_versions[XGMI_HWIP] = IP_VERSION(6, 1, 0);
> +		adev->ip_versions[MMHUB_HWIP][0] = IP_VERSION(9, 4, 2);
> +		adev->ip_versions[ATHUB_HWIP][0] = IP_VERSION(9, 4, 2);
> +		adev->ip_versions[OSSSYS_HWIP][0] = IP_VERSION(4, 4, 0);
> +		adev->ip_versions[HDP_HWIP][0] = IP_VERSION(4, 4, 0);
> +		adev->ip_versions[SDMA0_HWIP][0] = IP_VERSION(4, 4, 0);
> +		adev->ip_versions[DF_HWIP][0] = IP_VERSION(3, 6, 2);
> +		adev->ip_versions[NBIO_HWIP][0] = IP_VERSION(7, 4, 4);
> +		adev->ip_versions[UMC_HWIP][0] = IP_VERSION(6, 7, 0);
> +		adev->ip_versions[MP0_HWIP][0] = IP_VERSION(13, 0, 2);
> +		adev->ip_versions[MP1_HWIP][0] = IP_VERSION(13, 0, 2);
> +		adev->ip_versions[THM_HWIP][0] = IP_VERSION(13, 0, 2);
> +		adev->ip_versions[SMUIO_HWIP][0] = IP_VERSION(13, 0, 2);
> +		adev->ip_versions[GC_HWIP][0] = IP_VERSION(9, 4, 2);
> +		adev->ip_versions[UVD_HWIP][0] = IP_VERSION(2, 6, 0);
> +		adev->ip_versions[XGMI_HWIP][0] = IP_VERSION(6, 1, 0);
>   		break;
>   	default:
>   		r = amdgpu_discovery_reg_base_init(adev);
> @@ -673,7 +673,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -706,11 +706,11 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		return -EINVAL;
>   	}
>   
> -	if (adev->ip_versions[XGMI_HWIP] == IP_VERSION(4, 8, 0))
> +	if (adev->ip_versions[XGMI_HWIP][0] == IP_VERSION(4, 8, 0))
>   		adev->gmc.xgmi.supported = true;
>   
>   	/* set NBIO version */
> -	switch (adev->ip_versions[NBIO_HWIP]) {
> +	switch (adev->ip_versions[NBIO_HWIP][0]) {
>   	case IP_VERSION(6, 1, 0):
>   	case IP_VERSION(6, 2, 0):
>   		adev->nbio.funcs = &nbio_v6_1_funcs;
> @@ -749,7 +749,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	switch (adev->ip_versions[HDP_HWIP]) {
> +	switch (adev->ip_versions[HDP_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   	case IP_VERSION(4, 0, 1):
>   	case IP_VERSION(4, 1, 0):
> @@ -771,7 +771,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	switch (adev->ip_versions[DF_HWIP]) {
> +	switch (adev->ip_versions[DF_HWIP][0]) {
>   	case IP_VERSION(3, 6, 0):
>   	case IP_VERSION(3, 6, 1):
>   	case IP_VERSION(3, 6, 2):
> @@ -788,7 +788,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	switch (adev->ip_versions[SMUIO_HWIP]) {
> +	switch (adev->ip_versions[SMUIO_HWIP][0]) {
>   	case IP_VERSION(9, 0, 0):
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(10, 0, 0):
> @@ -819,7 +819,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	/* what IP to use for this? */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 1, 0):
>   	case IP_VERSION(9, 2, 1):
> @@ -847,7 +847,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	/* use GC or MMHUB IP version */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 1, 0):
>   	case IP_VERSION(9, 2, 1):
> @@ -874,7 +874,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		return -EINVAL;
>   	}
>   
> -	switch (adev->ip_versions[OSSSYS_HWIP]) {
> +	switch (adev->ip_versions[OSSSYS_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   	case IP_VERSION(4, 0, 1):
>   	case IP_VERSION(4, 1, 0):
> @@ -900,7 +900,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	if (likely(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)) {
> -		switch (adev->ip_versions[MP0_HWIP]) {
> +		switch (adev->ip_versions[MP0_HWIP][0]) {
>   		case IP_VERSION(9, 0, 0):
>   			amdgpu_device_ip_block_add(adev, &psp_v3_1_ip_block);
>   			break;
> @@ -938,7 +938,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	if (likely(adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)) {
> -		switch (adev->ip_versions[MP1_HWIP]) {
> +		switch (adev->ip_versions[MP1_HWIP][0]) {
>   		case IP_VERSION(9, 0, 0):
>   		case IP_VERSION(10, 0, 0):
>   		case IP_VERSION(10, 0, 1):
> @@ -975,8 +975,8 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	if (adev->enable_virtual_display || amdgpu_sriov_vf(adev)) {
>   		amdgpu_device_ip_block_add(adev, &amdgpu_vkms_ip_block);
>   #if defined(CONFIG_DRM_AMD_DC)
> -	} else if (adev->ip_versions[DCE_HWIP]) {
> -		switch (adev->ip_versions[DCE_HWIP]) {
> +	} else if (adev->ip_versions[DCE_HWIP][0]) {
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
>   		case IP_VERSION(1, 0, 0):
>   		case IP_VERSION(1, 0, 1):
>   		case IP_VERSION(2, 0, 2):
> @@ -995,8 +995,8 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		default:
>   			return -EINVAL;
>   		}
> -	} else if (adev->ip_versions[DCI_HWIP]) {
> -		switch (adev->ip_versions[DCI_HWIP]) {
> +	} else if (adev->ip_versions[DCI_HWIP][0]) {
> +		switch (adev->ip_versions[DCI_HWIP][0]) {
>   		case IP_VERSION(12, 0, 0):
>   		case IP_VERSION(12, 0, 1):
>   		case IP_VERSION(12, 1, 0):
> @@ -1007,7 +1007,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		}
>   	}
>   #endif
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 1, 0):
>   	case IP_VERSION(9, 2, 1):
> @@ -1034,7 +1034,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		return -EINVAL;
>   	}
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   	case IP_VERSION(4, 0, 1):
>   	case IP_VERSION(4, 1, 0):
> @@ -1064,7 +1064,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
> -		switch (adev->ip_versions[MP1_HWIP]) {
> +		switch (adev->ip_versions[MP1_HWIP][0]) {
>   		case IP_VERSION(9, 0, 0):
>   		case IP_VERSION(10, 0, 0):
>   		case IP_VERSION(10, 0, 1):
> @@ -1098,8 +1098,8 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		}
>   	}
>   
> -	if (adev->ip_versions[VCE_HWIP]) {
> -		switch (adev->ip_versions[UVD_HWIP]) {
> +	if (adev->ip_versions[VCE_HWIP][0]) {
> +		switch (adev->ip_versions[UVD_HWIP][0]) {
>   		case IP_VERSION(7, 0, 0):
>   		case IP_VERSION(7, 2, 0):
>   			amdgpu_device_ip_block_add(adev, &uvd_v7_0_ip_block);
> @@ -1107,7 +1107,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   		default:
>   			return -EINVAL;
>   		}
> -		switch (adev->ip_versions[VCE_HWIP]) {
> +		switch (adev->ip_versions[VCE_HWIP][0]) {
>   		case IP_VERSION(4, 0, 0):
>   		case IP_VERSION(4, 1, 0):
>   			amdgpu_device_ip_block_add(adev, &vce_v4_0_ip_block);
> @@ -1116,7 +1116,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   			return -EINVAL;
>   		}
>   	} else {
> -		switch (adev->ip_versions[UVD_HWIP]) {
> +		switch (adev->ip_versions[UVD_HWIP][0]) {
>   		case IP_VERSION(1, 0, 0):
>   		case IP_VERSION(1, 0, 1):
>   			amdgpu_device_ip_block_add(adev, &vcn_v1_0_ip_block);
> @@ -1153,7 +1153,7 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu_device *adev)
>   	}
>   
>   	if (adev->enable_mes) {
> -		switch (adev->ip_versions[GC_HWIP]) {
> +		switch (adev->ip_versions[GC_HWIP][0]) {
>   		case IP_VERSION(10, 1, 10):
>   		case IP_VERSION(10, 1, 1):
>   		case IP_VERSION(10, 1, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index c47d29689be4..7d414f1606b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -76,7 +76,7 @@ static void psp_check_pmfw_centralized_cstate_management(struct psp_context *psp
>   		return;
>   	}
>   
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(11, 0, 4):
>   	case IP_VERSION(11, 0, 7):
>   	case IP_VERSION(11, 0, 9):
> @@ -97,7 +97,7 @@ static int psp_early_init(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   	struct psp_context *psp = &adev->psp;
>   
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(9, 0, 0):
>   		psp_v3_1_set_psp_funcs(psp);
>   		psp->autoload_supported = false;
> @@ -279,7 +279,7 @@ static int psp_sw_init(void *handle)
>   			return ret;
>   		}
>   	} else if (amdgpu_sriov_vf(adev) &&
> -		   adev->ip_versions[MP0_HWIP] == IP_VERSION(13, 0, 2)) {
> +		   adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2)) {
>   		ret = psp_init_ta_microcode(psp, "aldebaran");
>   		if (ret) {
>   			DRM_ERROR("Failed to initialize ta microcode!\n");
> @@ -322,8 +322,8 @@ static int psp_sw_init(void *handle)
>   		}
>   	}
>   
> -	if (adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 0) ||
> -	    adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 7)) {
> +	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
> +	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7)) {
>   		ret= psp_sysfs_init(adev);
>   		if (ret) {
>   			return ret;
> @@ -353,8 +353,8 @@ static int psp_sw_fini(void *handle)
>   		psp->ta_fw = NULL;
>   	}
>   
> -	if (adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 0) ||
> -	    adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 7))
> +	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 0) ||
> +	    adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7))
>   		psp_sysfs_fini(adev);
>   
>   	kfree(cmd);
> @@ -613,7 +613,7 @@ static int psp_tmr_init(struct psp_context *psp)
>   
>   static bool psp_skip_tmr(struct psp_context *psp)
>   {
> -	switch (psp->adev->ip_versions[MP0_HWIP]) {
> +	switch (psp->adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(11, 0, 9):
>   	case IP_VERSION(11, 0, 7):
>   	case IP_VERSION(13, 0, 2):
> @@ -1010,8 +1010,8 @@ int psp_xgmi_terminate(struct psp_context *psp)
>   	struct amdgpu_device *adev = psp->adev;
>   
>   	/* XGMI TA unload currently is not supported on Arcturus/Aldebaran A+A */
> -	if (adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 4) ||
> -	    (adev->ip_versions[MP0_HWIP] == IP_VERSION(13, 0, 2) &&
> +	if (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 4) ||
> +	    (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2) &&
>   	     adev->gmc.xgmi.connected_to_cpu))
>   		return 0;
>   
> @@ -1113,7 +1113,7 @@ int psp_xgmi_get_node_id(struct psp_context *psp, uint64_t *node_id)
>   
>   static bool psp_xgmi_peer_link_info_supported(struct psp_context *psp)
>   {
> -	return psp->adev->ip_versions[MP0_HWIP] == IP_VERSION(13, 0, 2) &&
> +	return psp->adev->ip_versions[MP0_HWIP][0] == IP_VERSION(13, 0, 2) &&
>   		psp->xgmi_context.context.bin_desc.feature_version >= 0x2000000b;
>   }
>   
> @@ -2232,8 +2232,8 @@ static int psp_load_smu_fw(struct psp_context *psp)
>   
>   	if ((amdgpu_in_reset(adev) &&
>   	     ras && adev->ras_enabled &&
> -	     (adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 4) ||
> -	      adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 2)))) {
> +	     (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 4) ||
> +	      adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 2)))) {
>   		ret = amdgpu_dpm_set_mp1_state(adev, PP_MP1_STATE_UNLOAD);
>   		if (ret) {
>   			DRM_WARN("Failed to set MP1 state prepare for reload\n");
> @@ -2330,9 +2330,9 @@ static int psp_load_non_psp_fw(struct psp_context *psp)
>   			continue;
>   
>   		if (psp->autoload_supported &&
> -		    (adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 7) ||
> -		     adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 11) ||
> -		     adev->ip_versions[MP0_HWIP] == IP_VERSION(11, 0, 12)) &&
> +		    (adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 7) ||
> +		     adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 11) ||
> +		     adev->ip_versions[MP0_HWIP][0] == IP_VERSION(11, 0, 12)) &&
>   		    (ucode->ucode_id == AMDGPU_UCODE_ID_SDMA1 ||
>   		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA2 ||
>   		     ucode->ucode_id == AMDGPU_UCODE_ID_SDMA3))
> @@ -2920,7 +2920,7 @@ static int psp_init_sos_base_fw(struct amdgpu_device *adev)
>   		le32_to_cpu(sos_hdr->header.ucode_array_offset_bytes);
>   
>   	if (adev->gmc.xgmi.connected_to_cpu ||
> -	    (adev->ip_versions[MP0_HWIP] != IP_VERSION(13, 0, 2))) {
> +	    (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 2))) {
>   		adev->psp.sos.fw_version = le32_to_cpu(sos_hdr->header.ucode_version);
>   		adev->psp.sos.feature_version = le32_to_cpu(sos_hdr->sos.fw_version);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 9724f5f5f702..4d3f2386ef53 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -86,7 +86,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>   	for (i = 0; i < adev->vcn.num_vcn_inst; i++)
>   		atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
>   
> -	switch (adev->ip_versions[UVD_HWIP]) {
> +	switch (adev->ip_versions[UVD_HWIP][0]) {
>   	case IP_VERSION(1, 0, 0):
>   	case IP_VERSION(1, 0, 1):
>   		if (adev->apu_flags & AMD_APU_IS_RAVEN2)
> @@ -134,7 +134,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>   			adev->vcn.indirect_sram = true;
>   		break;
>   	case IP_VERSION(3, 0, 0):
> -		if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0))
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
>   			fw_name = FIRMWARE_SIENNA_CICHLID;
>   		else
>   			fw_name = FIRMWARE_NAVY_FLOUNDER;
> diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
> index d3f634eb40fb..ab6a07e5e8c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_0.c
> @@ -77,7 +77,7 @@ int athub_v2_0_set_clockgating(struct amdgpu_device *adev,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[ATHUB_HWIP]) {
> +	switch (adev->ip_versions[ATHUB_HWIP][0]) {
>   	case IP_VERSION(2, 0, 0):
>   	case IP_VERSION(2, 0, 2):
>   		athub_v2_0_update_medium_grain_clock_gating(adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> index 0fbeaf05204e..2edefd10e56c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
> @@ -70,7 +70,7 @@ int athub_v2_1_set_clockgating(struct amdgpu_device *adev,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[ATHUB_HWIP]) {
> +	switch (adev->ip_versions[ATHUB_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   	case IP_VERSION(2, 1, 1):
>   	case IP_VERSION(2, 1, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 4c632306ed70..71bb3c0dc1da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -1537,7 +1537,7 @@ static u32 gfx_v10_rlcg_rw(struct amdgpu_device *adev, u32 offset, u32 v, uint32
>   	scratch_reg3 = adev->rmmio +
>   		       (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG3) * 4;
>   
> -	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0)) {
>   		spare_int = adev->rmmio +
>   			    (adev->reg_offset[GC_HWIP][0][mmRLC_SPARE_INT_0_Sienna_Cichlid_BASE_IDX]
>   			     + mmRLC_SPARE_INT_0_Sienna_Cichlid) * 4;
> @@ -3727,7 +3727,7 @@ static void gfx_v10_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
>   
>   static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_gc_rlc_spm_10_0_nv10,
> @@ -3750,7 +3750,7 @@ static void gfx_v10_0_init_spm_golden_registers(struct amdgpu_device *adev)
>   
>   static void gfx_v10_0_init_golden_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_gc_10_1,
> @@ -3985,7 +3985,7 @@ static void gfx_v10_0_check_fw_write_wait(struct amdgpu_device *adev)
>   {
>   	adev->gfx.cp_fw_write_wait = false;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 2):
>   	case IP_VERSION(10, 1, 1):
> @@ -4066,7 +4066,7 @@ static bool gfx_v10_0_navi10_gfxoff_should_enable(struct amdgpu_device *adev)
>   
>   static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   		if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
>   			adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
> @@ -4093,7 +4093,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   		chip_name = "navi10";
>   		break;
> @@ -4684,7 +4684,7 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
>   
>   	adev->gfx.funcs = &gfx_v10_0_gfx_funcs;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -4818,7 +4818,7 @@ static int gfx_v10_0_sw_init(void *handle)
>   	struct amdgpu_kiq *kiq;
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -5068,8 +5068,8 @@ static void gfx_v10_0_setup_rb(struct amdgpu_device *adev)
>   	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
>   		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
>   			bitmap = i * adev->gfx.config.max_sh_per_se + j;
> -			if (((adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0)) ||
> -				(adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 3))) &&
> +			if (((adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) ||
> +				(adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3))) &&
>   			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
>   				continue;
>   			gfx_v10_0_select_se_sh(adev, i, j, 0xffffffff);
> @@ -5096,7 +5096,7 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
>   
>   	/* for ASICs that integrates GFX v10.3
>   	 * pa_sc_tile_steering_override should be set to 0 */
> -	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
>   		return 0;
>   
>   	/* init num_sc */
> @@ -5249,7 +5249,7 @@ static void gfx_v10_0_get_tcc_info(struct amdgpu_device *adev)
>   	/* TCCs are global (not instanced). */
>   	uint32_t tcc_disable;
>   
> -	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0)) {
>   		tcc_disable = RREG32_SOC15(GC, 0, mmCGTS_TCC_DISABLE_gc_10_3) |
>   			      RREG32_SOC15(GC, 0, mmCGTS_USER_TCC_DISABLE_gc_10_3);
>   	} else {
> @@ -5326,7 +5326,7 @@ static int gfx_v10_0_init_csb(struct amdgpu_device *adev)
>   	adev->gfx.rlc.funcs->get_csb_buffer(adev, adev->gfx.rlc.cs_ptr);
>   
>   	/* csib */
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)) {
>   		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_HI,
>   				adev->gfx.rlc.clear_state_gpu_addr >> 32);
>   		WREG32_SOC15_RLC(GC, 0, mmRLC_CSIB_ADDR_LO,
> @@ -5948,7 +5948,7 @@ static int gfx_v10_0_cp_gfx_enable(struct amdgpu_device *adev, bool enable)
>   	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, PFP_HALT, enable ? 0 : 1);
>   	tmp = REG_SET_FIELD(tmp, CP_ME_CNTL, CE_HALT, enable ? 0 : 1);
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)) {
>   		WREG32_SOC15_RLC(GC, 0, mmCP_ME_CNTL, tmp);
>   	} else {
>   		WREG32_SOC15(GC, 0, mmCP_ME_CNTL, tmp);
> @@ -6337,7 +6337,7 @@ static void gfx_v10_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
>   		}
>   		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_CONTROL, tmp);
>   	}
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -6474,7 +6474,7 @@ static int gfx_v10_0_cp_gfx_resume(struct amdgpu_device *adev)
>   static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
>   {
>   	if (enable) {
> -		switch (adev->ip_versions[GC_HWIP]) {
> +		switch (adev->ip_versions[GC_HWIP][0]) {
>   		case IP_VERSION(10, 3, 0):
>   		case IP_VERSION(10, 3, 2):
>   		case IP_VERSION(10, 3, 1):
> @@ -6488,7 +6488,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
>   			break;
>   		}
>   	} else {
> -		switch (adev->ip_versions[GC_HWIP]) {
> +		switch (adev->ip_versions[GC_HWIP][0]) {
>   		case IP_VERSION(10, 3, 0):
>   		case IP_VERSION(10, 3, 2):
>   		case IP_VERSION(10, 3, 1):
> @@ -6586,7 +6586,7 @@ static void gfx_v10_0_kiq_setting(struct amdgpu_ring *ring)
>   	struct amdgpu_device *adev = ring->adev;
>   
>   	/* tell RLC which is KIQ queue */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -7303,7 +7303,7 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
>   
>   	/* check if mmVGT_ESGS_RING_SIZE_UMD
>   	 * has been remapped to mmVGT_ESGS_RING_SIZE */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 4):
> @@ -7350,7 +7350,7 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
>   	 * index will auto-inc after each data writting */
>   	WREG32_SOC15(GC, 0, mmGRBM_CAM_INDEX, 0);
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -7520,19 +7520,19 @@ static int gfx_v10_0_hw_init(void *handle)
>   	 * init golden registers and rlc resume may override some registers,
>   	 * reconfig them here
>   	 */
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 10) ||
> -	    adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 1) ||
> -	    adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 10) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 1) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2))
>   		gfx_v10_0_tcp_harvest(adev);
>   
>   	r = gfx_v10_0_cp_resume(adev);
>   	if (r)
>   		return r;
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
>   		gfx_v10_3_program_pbb_mode(adev);
>   
> -	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
>   		gfx_v10_3_set_power_brake_sequence(adev);
>   
>   	return r;
> @@ -7584,7 +7584,7 @@ static int gfx_v10_0_hw_fini(void *handle)
>   	if (amdgpu_sriov_vf(adev)) {
>   		gfx_v10_0_cp_gfx_enable(adev, false);
>   		/* Program KIQ position of RLC_CP_SCHEDULERS during destroy */
> -		if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0)) {
> +		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0)) {
>   			tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
>   			tmp &= 0xffffff00;
>   			WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
> @@ -7670,7 +7670,7 @@ static int gfx_v10_0_soft_reset(void *handle)
>   
>   	/* GRBM_STATUS2 */
>   	tmp = RREG32_SOC15(GC, 0, mmGRBM_STATUS2);
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -7726,7 +7726,7 @@ static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device *adev)
>   {
>   	uint64_t clock, clock_lo, clock_hi, hi_check;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 1):
>   	case IP_VERSION(10, 3, 3):
>   		clock = (uint64_t)RREG32_SOC15(SMUIO, 0, mmGOLDEN_TSC_COUNT_LOWER_Vangogh) |
> @@ -7784,7 +7784,7 @@ static int gfx_v10_0_early_init(void *handle)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -7848,7 +7848,7 @@ static void gfx_v10_0_set_safe_mode(struct amdgpu_device *adev)
>   	data = RLC_SAFE_MODE__CMD_MASK;
>   	data |= (1 << RLC_SAFE_MODE__MESSAGE__SHIFT);
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -7884,7 +7884,7 @@ static void gfx_v10_0_unset_safe_mode(struct amdgpu_device *adev)
>   	uint32_t data;
>   
>   	data = RLC_SAFE_MODE__CMD_MASK;
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -8193,7 +8193,7 @@ static void gfx_v10_0_apply_medium_grain_clock_gating_workaround(struct amdgpu_d
>   		mmCGTS_SA1_QUAD1_SM_CTRL_REG
>   	};
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 1, 2)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 1, 2)) {
>   		for (i = 0; i < ARRAY_SIZE(tcp_ctrl_regs_nv12); i++) {
>   			reg_idx = adev->reg_offset[GC_HWIP][0][mmCGTS_SA0_WGP00_CU0_TCP_CTRL_REG_BASE_IDX] +
>   				  tcp_ctrl_regs_nv12[i];
> @@ -8238,8 +8238,8 @@ static int gfx_v10_0_update_gfx_clock_gating(struct amdgpu_device *adev,
>   		/* ===  CGCG + CGLS === */
>   		gfx_v10_0_update_coarse_grain_clock_gating(adev, enable);
>   
> -		if ((adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 1, 10)) &&
> -		     (adev->ip_versions[GC_HWIP] <= IP_VERSION(10, 1, 2)))
> +		if ((adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 1, 10)) &&
> +		     (adev->ip_versions[GC_HWIP][0] <= IP_VERSION(10, 1, 2)))
>   			gfx_v10_0_apply_medium_grain_clock_gating_workaround(adev);
>   	} else {
>   		/* CGCG/CGLS should be disabled before MGCG/MGLS
> @@ -8335,7 +8335,7 @@ static void gfx_v10_cntl_power_gating(struct amdgpu_device *adev, bool enable)
>   	 * Power/performance team will optimize it and might give a new value later.
>   	 */
>   	if (enable && (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
> -		switch (adev->ip_versions[GC_HWIP]) {
> +		switch (adev->ip_versions[GC_HWIP][0]) {
>   		case IP_VERSION(10, 3, 1):
>   			data = 0x4E20 & RLC_PG_DELAY_3__CGCG_ACTIVE_BEFORE_CGPG_MASK_Vangogh;
>   			WREG32_SOC15(GC, 0, mmRLC_PG_DELAY_3, data);
> @@ -8399,7 +8399,7 @@ static int gfx_v10_0_set_powergating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -8428,7 +8428,7 @@ static int gfx_v10_0_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -9541,7 +9541,7 @@ static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev)
>   
>   static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 3):
> @@ -9641,8 +9641,8 @@ static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,
>   	for (i = 0; i < adev->gfx.config.max_shader_engines; i++) {
>   		for (j = 0; j < adev->gfx.config.max_sh_per_se; j++) {
>   			bitmap = i * adev->gfx.config.max_sh_per_se + j;
> -			if (((adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0)) ||
> -				(adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 3))) &&
> +			if (((adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) ||
> +				(adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3))) &&
>   			    ((gfx_v10_3_get_disabled_sa(adev) >> bitmap) & 1))
>   				continue;
>   			mask = 1;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 3a160d78c98f..8f2966bcf5a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -953,7 +953,7 @@ static void gfx_v9_0_set_kiq_pm4_funcs(struct amdgpu_device *adev)
>   
>   static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_gc_9_0,
> @@ -1009,8 +1009,8 @@ static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	if ((adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 1)) &&
> -	    (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 2)))
> +	if ((adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) &&
> +	    (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 2)))
>   		soc15_program_register_sequence(adev, golden_settings_gc_9_x_common,
>   						(const u32)ARRAY_SIZE(golden_settings_gc_9_x_common));
>   }
> @@ -1194,14 +1194,14 @@ static void gfx_v9_0_check_fw_write_wait(struct amdgpu_device *adev)
>   	adev->gfx.me_fw_write_wait = false;
>   	adev->gfx.mec_fw_write_wait = false;
>   
> -	if ((adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 1)) &&
> +	if ((adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) &&
>   	    ((adev->gfx.mec_fw_version < 0x000001a5) ||
>   	    (adev->gfx.mec_feature_version < 46) ||
>   	    (adev->gfx.pfp_fw_version < 0x000000b7) ||
>   	    (adev->gfx.pfp_feature_version < 46)))
>   		DRM_WARN_ONCE("CP firmware version too old, please update!");
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   		if ((adev->gfx.me_fw_version >= 0x0000009c) &&
>   		    (adev->gfx.me_feature_version >= 42) &&
> @@ -1301,7 +1301,7 @@ static bool is_raven_kicker(struct amdgpu_device *adev)
>   
>   static bool check_if_enlarge_doorbell_range(struct amdgpu_device *adev)
>   {
> -	if ((adev->ip_versions[GC_HWIP] == IP_VERSION(9, 3, 0)) &&
> +	if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 3, 0)) &&
>   	    (adev->gfx.me_fw_version >= 0x000000a5) &&
>   	    (adev->gfx.me_feature_version >= 52))
>   		return true;
> @@ -1314,7 +1314,7 @@ static void gfx_v9_0_check_if_need_gfxoff(struct amdgpu_device *adev)
>   	if (gfx_v9_0_should_disable_gfxoff(adev->pdev))
>   		adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -1558,9 +1558,9 @@ static int gfx_v9_0_init_rlc_microcode(struct amdgpu_device *adev,
>   
>   static bool gfx_v9_0_load_mec2_fw_bin_support(struct amdgpu_device *adev)
>   {
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 2) ||
> -	    adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 1) ||
> -	    adev->ip_versions[GC_HWIP] == IP_VERSION(9, 3, 0))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 3, 0))
>   		return false;
>   
>   	return true;
> @@ -1668,7 +1668,7 @@ static int gfx_v9_0_init_microcode(struct amdgpu_device *adev)
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   		chip_name = "vega10";
>   		break;
> @@ -1800,7 +1800,7 @@ static void gfx_v9_0_init_always_on_cu_mask(struct amdgpu_device *adev)
>   
>   	if (adev->flags & AMD_IS_APU)
>   		always_on_cu_num = 4;
> -	else if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 2, 1))
> +	else if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 2, 1))
>   		always_on_cu_num = 8;
>   	else
>   		always_on_cu_num = 12;
> @@ -1969,7 +1969,7 @@ static int gfx_v9_0_rlc_init(struct amdgpu_device *adev)
>   			return r;
>   	}
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 2, 2):
>   	case IP_VERSION(9, 1, 0):
>   		gfx_v9_0_init_lbpw(adev);
> @@ -2149,7 +2149,7 @@ static int gfx_v9_0_gpu_early_init(struct amdgpu_device *adev)
>   
>   	adev->gfx.funcs = &gfx_v9_0_gfx_funcs;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   		adev->gfx.config.max_hw_contexts = 8;
>   		adev->gfx.config.sc_prim_fifo_size_frontend = 0x20;
> @@ -2313,7 +2313,7 @@ static int gfx_v9_0_sw_init(void *handle)
>   	struct amdgpu_kiq *kiq;
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -2605,7 +2605,7 @@ static void gfx_v9_0_init_sq_config(struct amdgpu_device *adev)
>   {
>   	uint32_t tmp;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 4, 1):
>   		tmp = RREG32_SOC15(GC, 0, mmSQ_CONFIG);
>   		tmp = REG_SET_FIELD(tmp, SQ_CONFIG,
> @@ -2941,7 +2941,7 @@ static void gfx_v9_0_init_gfx_power_gating(struct amdgpu_device *adev)
>   		/* program GRBM_REG_SAVE_GFX_IDLE_THRESHOLD to 0x55f0 */
>   		data |= (0x55f0 << RLC_AUTO_PG_CTRL__GRBM_REG_SAVE_GFX_IDLE_THRESHOLD__SHIFT);
>   		WREG32(SOC15_REG_OFFSET(GC, 0, mmRLC_AUTO_PG_CTRL), data);
> -		if (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 3, 0))
> +		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 3, 0))
>   			pwr_10_0_gfxip_control_over_cgpg(adev, true);
>   	}
>   }
> @@ -3053,7 +3053,7 @@ static void gfx_v9_0_init_pg(struct amdgpu_device *adev)
>   	 * And it's needed by gfxoff feature.
>   	 */
>   	if (adev->gfx.rlc.is_rlc_v2_1) {
> -		if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 2, 1) ||
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 2, 1) ||
>   		    (adev->apu_flags & AMD_APU_IS_RAVEN2))
>   			gfx_v9_1_init_rlc_save_restore_list(adev);
>   		gfx_v9_0_enable_save_restore_machine(adev);
> @@ -3166,7 +3166,7 @@ static int gfx_v9_0_rlc_resume(struct amdgpu_device *adev)
>   			return r;
>   	}
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 2, 2):
>   	case IP_VERSION(9, 1, 0):
>   		if (amdgpu_lbpw == 0)
> @@ -3969,8 +3969,8 @@ static void gfx_v9_0_init_tcp_config(struct amdgpu_device *adev)
>   {
>   	u32 tmp;
>   
> -	if (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 1) &&
> -	    adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 2))
> +	if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1) &&
> +	    adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 2))
>   		return;
>   
>   	tmp = RREG32_SOC15(GC, 0, mmTCP_ADDR_CONFIG);
> @@ -4010,7 +4010,7 @@ static int gfx_v9_0_hw_init(void *handle)
>   	if (r)
>   		return r;
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 2))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
>   		gfx_v9_4_2_set_power_brake_sequence(adev);
>   
>   	return r;
> @@ -4242,7 +4242,7 @@ static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)
>   
>   	amdgpu_gfx_off_ctrl(adev, false);
>   	mutex_lock(&adev->gfx.gpu_clock_mutex);
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 0, 1) && amdgpu_sriov_runtime(adev)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 0, 1) && amdgpu_sriov_runtime(adev)) {
>   		clock = gfx_v9_0_kiq_read_clock(adev);
>   	} else {
>   		WREG32_SOC15(GC, 0, mmRLC_CAPTURE_GPU_CLOCK_COUNT, 1);
> @@ -4592,7 +4592,7 @@ static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
>   	if (!ring->sched.ready)
>   		return 0;
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 1)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1)) {
>   		vgpr_init_shader_ptr = vgpr_init_compute_shader_arcturus;
>   		vgpr_init_shader_size = sizeof(vgpr_init_compute_shader_arcturus);
>   		vgpr_init_regs_ptr = vgpr_init_regs_arcturus;
> @@ -4742,8 +4742,8 @@ static int gfx_v9_0_early_init(void *handle)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 1) ||
> -	    adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 2))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
>   		adev->gfx.num_gfx_rings = 0;
>   	else
>   		adev->gfx.num_gfx_rings = GFX9_NUM_GFX_RINGS;
> @@ -4777,7 +4777,7 @@ static int gfx_v9_0_ecc_late_init(void *handle)
>   	}
>   
>   	/* requires IBs so do in late init after IB pool is initialized */
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 2))
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
>   		r = gfx_v9_4_2_do_edc_gpr_workarounds(adev);
>   	else
>   		r = gfx_v9_0_do_edc_gpr_workarounds(adev);
> @@ -4905,7 +4905,7 @@ static void gfx_v9_0_update_medium_grain_clock_gating(struct amdgpu_device *adev
>   		/* 1 - RLC_CGTT_MGCG_OVERRIDE */
>   		def = data = RREG32_SOC15(GC, 0, mmRLC_CGTT_MGCG_OVERRIDE);
>   
> -		if (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 2, 1))
> +		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 2, 1))
>   			data &= ~RLC_CGTT_MGCG_OVERRIDE__CPF_CGTT_SCLK_OVERRIDE_MASK;
>   
>   		data &= ~(RLC_CGTT_MGCG_OVERRIDE__GRBM_CGTT_SCLK_OVERRIDE_MASK |
> @@ -4939,7 +4939,7 @@ static void gfx_v9_0_update_medium_grain_clock_gating(struct amdgpu_device *adev
>   		/* 1 - MGCG_OVERRIDE */
>   		def = data = RREG32_SOC15(GC, 0, mmRLC_CGTT_MGCG_OVERRIDE);
>   
> -		if (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 2, 1))
> +		if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 2, 1))
>   			data |= RLC_CGTT_MGCG_OVERRIDE__CPF_CGTT_SCLK_OVERRIDE_MASK;
>   
>   		data |= (RLC_CGTT_MGCG_OVERRIDE__RLC_CGTT_SCLK_OVERRIDE_MASK |
> @@ -5045,7 +5045,7 @@ static void gfx_v9_0_update_coarse_grain_clock_gating(struct amdgpu_device *adev
>   		/* enable cgcg FSM(0x0000363F) */
>   		def = RREG32_SOC15(GC, 0, mmRLC_CGCG_CGLS_CTRL);
>   
> -		if (adev->ip_versions[GC_HWIP] == IP_VERSION(9, 4, 1))
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1))
>   			data = (0x2000 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |
>   				RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
>   		else
> @@ -5171,7 +5171,7 @@ static int gfx_v9_0_set_powergating_state(void *handle,
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   	bool enable = (state == AMD_PG_STATE_GATE);
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 2, 2):
>   	case IP_VERSION(9, 1, 0):
>   	case IP_VERSION(9, 3, 0):
> @@ -5218,7 +5218,7 @@ static int gfx_v9_0_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -5268,7 +5268,7 @@ static void gfx_v9_0_get_clockgating_state(void *handle, u32 *flags)
>   	if (data & CP_MEM_SLP_CNTL__CP_MEM_LS_EN_MASK)
>   		*flags |= AMD_CG_SUPPORT_GFX_CP_LS | AMD_CG_SUPPORT_GFX_MGLS;
>   
> -	if (adev->ip_versions[GC_HWIP] != IP_VERSION(9, 4, 1)) {
> +	if (adev->ip_versions[GC_HWIP][0] != IP_VERSION(9, 4, 1)) {
>   		/* AMD_CG_SUPPORT_GFX_3D_CGCG */
>   		data = RREG32_KIQ(SOC15_REG_OFFSET(GC, 0, mmRLC_CGCG_CGLS_CTRL_3D));
>   		if (data & RLC_CGCG_CGLS_CTRL_3D__CGCG_EN_MASK)
> @@ -7039,7 +7039,7 @@ static void gfx_v9_0_set_irq_funcs(struct amdgpu_device *adev)
>   
>   static void gfx_v9_0_set_rlc_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -7058,7 +7058,7 @@ static void gfx_v9_0_set_rlc_funcs(struct amdgpu_device *adev)
>   static void gfx_v9_0_set_gds_init(struct amdgpu_device *adev)
>   {
>   	/* init asci gds info */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 2, 1):
>   	case IP_VERSION(9, 4, 0):
> @@ -7080,7 +7080,7 @@ static void gfx_v9_0_set_gds_init(struct amdgpu_device *adev)
>   		break;
>   	}
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   	case IP_VERSION(9, 4, 0):
>   		adev->gds.gds_compute_max_wave_id = 0x7ff;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
> index 149f3843e0e7..e80d1dc43079 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
> @@ -506,7 +506,7 @@ static int gfxhub_v2_1_get_xgmi_info(struct amdgpu_device *adev)
>   	u32 max_num_physical_nodes   = 0;
>   	u32 max_physical_node_id     = 0;
>   
> -	switch (adev->ip_versions[XGMI_HWIP]) {
> +	switch (adev->ip_versions[XGMI_HWIP][0]) {
>   	case IP_VERSION(4, 8, 0):
>   		max_num_physical_nodes   = 4;
>   		max_physical_node_id     = 3;
> @@ -544,7 +544,7 @@ static void gfxhub_v2_1_utcl2_harvest(struct amdgpu_device *adev)
>   		adev->gfx.config.max_sh_per_se *
>   		adev->gfx.config.max_shader_engines);
>   
> -	if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 3)) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 3)) {
>   		/* Get SA disabled bitmap from eFuse setting */
>   		efuse_setting = RREG32_SOC15(GC, 0, mmCC_GC_SA_UNIT_DISABLE);
>   		efuse_setting &= CC_GC_SA_UNIT_DISABLE__SA_DISABLE_MASK;
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index b488257ff201..6d0586009de3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -133,7 +133,7 @@ static int gmc_v10_0_process_interrupt(struct amdgpu_device *adev,
>   		 * the new fast GRBM interface.
>   		 */
>   		if ((entry->vmid_src == AMDGPU_GFXHUB_0) &&
> -		    (adev->ip_versions[GC_HWIP] < IP_VERSION(10, 3, 0)))
> +		    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 3, 0)))
>   			RREG32(hub->vm_l2_pro_fault_status);
>   
>   		status = RREG32(hub->vm_l2_pro_fault_status);
> @@ -268,7 +268,7 @@ static void gmc_v10_0_flush_vm_hub(struct amdgpu_device *adev, uint32_t vmid,
>   	 * to avoid a false ACK due to the new fast GRBM interface.
>   	 */
>   	if ((vmhub == AMDGPU_GFXHUB_0) &&
> -	    (adev->ip_versions[GC_HWIP] < IP_VERSION(10, 3, 0)))
> +	    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(10, 3, 0)))
>   		RREG32_RLC_NO_KIQ(hub->vm_inv_eng0_req +
>   				  hub->eng_distance * eng, hub_ip);
>   
> @@ -657,7 +657,7 @@ static void gmc_v10_0_set_gmc_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v10_0_set_umc_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[UMC_HWIP]) {
> +	switch (adev->ip_versions[UMC_HWIP][0]) {
>   	case IP_VERSION(8, 7, 0):
>   		adev->umc.max_ras_err_cnt_per_query = UMC_V8_7_TOTAL_CHANNEL_NUM;
>   		adev->umc.channel_inst_num = UMC_V8_7_CHANNEL_INSTANCE_NUM;
> @@ -674,7 +674,7 @@ static void gmc_v10_0_set_umc_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v10_0_set_mmhub_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 3, 0):
>   	case IP_VERSION(2, 4, 0):
>   		adev->mmhub.funcs = &mmhub_v2_3_funcs;
> @@ -687,7 +687,7 @@ static void gmc_v10_0_set_mmhub_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v10_0_set_gfxhub_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 3, 0):
>   	case IP_VERSION(10, 3, 2):
>   	case IP_VERSION(10, 3, 1):
> @@ -857,7 +857,7 @@ static int gmc_v10_0_sw_init(void *handle)
>   		adev->gmc.vram_vendor = vram_vendor;
>   	}
>   
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   	case IP_VERSION(10, 1, 1):
>   	case IP_VERSION(10, 1, 2):
> @@ -1132,7 +1132,7 @@ static int gmc_v10_0_set_clockgating_state(void *handle,
>   	if (r)
>   		return r;
>   
> -	if (adev->ip_versions[ATHUB_HWIP] >= IP_VERSION(2, 1, 0))
> +	if (adev->ip_versions[ATHUB_HWIP][0] >= IP_VERSION(2, 1, 0))
>   		return athub_v2_1_set_clockgating(adev, state);
>   	else
>   		return athub_v2_0_set_clockgating(adev, state);
> @@ -1144,7 +1144,7 @@ static void gmc_v10_0_get_clockgating_state(void *handle, u32 *flags)
>   
>   	adev->mmhub.funcs->get_clockgating(adev, flags);
>   
> -	if (adev->ip_versions[ATHUB_HWIP] >= IP_VERSION(2, 1, 0))
> +	if (adev->ip_versions[ATHUB_HWIP][0] >= IP_VERSION(2, 1, 0))
>   		athub_v2_1_get_clockgating(adev, flags);
>   	else
>   		athub_v2_0_get_clockgating(adev, flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> index 88938115557b..eecfb1545c1e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> @@ -49,7 +49,7 @@ static void hdp_v4_0_flush_hdp(struct amdgpu_device *adev,
>   static void hdp_v4_0_invalidate_hdp(struct amdgpu_device *adev,
>   				    struct amdgpu_ring *ring)
>   {
> -	if (adev->ip_versions[HDP_HWIP] == IP_VERSION(4, 4, 0))
> +	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 4, 0))
>   		return;
>   
>   	if (!ring || !ring->funcs->emit_wreg)
> @@ -79,7 +79,7 @@ static void hdp_v4_0_reset_ras_error_count(struct amdgpu_device *adev)
>   	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__HDP))
>   		return;
>   
> -	if (adev->ip_versions[HDP_HWIP] >= IP_VERSION(4, 4, 0))
> +	if (adev->ip_versions[HDP_HWIP][0] >= IP_VERSION(4, 4, 0))
>   		WREG32_SOC15(HDP, 0, mmHDP_EDC_CNT, 0);
>   	else
>   		/*read back hdp ras counter to reset it to 0 */
> @@ -91,10 +91,10 @@ static void hdp_v4_0_update_clock_gating(struct amdgpu_device *adev,
>   {
>   	uint32_t def, data;
>   
> -	if (adev->ip_versions[HDP_HWIP] == IP_VERSION(4, 0, 0) ||
> -	    adev->ip_versions[HDP_HWIP] == IP_VERSION(4, 0, 1) ||
> -	    adev->ip_versions[HDP_HWIP] == IP_VERSION(4, 1, 1) ||
> -	    adev->ip_versions[HDP_HWIP] == IP_VERSION(4, 1, 0)) {
> +	if (adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 0, 0) ||
> +	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 0, 1) ||
> +	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 1, 1) ||
> +	    adev->ip_versions[HDP_HWIP][0] == IP_VERSION(4, 1, 0)) {
>   		def = data = RREG32(SOC15_REG_OFFSET(HDP, 0, mmHDP_MEM_POWER_LS));
>   
>   		if (enable && (adev->cg_flags & AMD_CG_SUPPORT_HDP_LS))
> @@ -136,7 +136,7 @@ static void hdp_v4_0_get_clockgating_state(struct amdgpu_device *adev,
>   
>   static void hdp_v4_0_init_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[HDP_HWIP]) {
> +	switch (adev->ip_versions[HDP_HWIP][0]) {
>   	case IP_VERSION(4, 2, 1):
>   		WREG32_FIELD15(HDP, 0, HDP_MMHUB_CNTL, HDP_MMHUB_GCC, 1);
>   		break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> index e0cb919b4814..25f8e93e5ec3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> @@ -153,7 +153,7 @@ mmhub_v2_0_print_l2_protection_fault_status(struct amdgpu_device *adev,
>   	dev_err(adev->dev,
>   		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>   		status);
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 0, 0):
>   	case IP_VERSION(2, 0, 2):
>   		mmhub_cid = mmhub_client_ids_navi1x[cid][rw];
> @@ -569,7 +569,7 @@ static void mmhub_v2_0_update_medium_grain_clock_gating(struct amdgpu_device *ad
>   	if (!(adev->cg_flags & AMD_CG_SUPPORT_MC_MGCG))
>   		return;
>   
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   	case IP_VERSION(2, 1, 1):
>   	case IP_VERSION(2, 1, 2):
> @@ -603,7 +603,7 @@ static void mmhub_v2_0_update_medium_grain_clock_gating(struct amdgpu_device *ad
>   			  DAGB0_CNTL_MISC2__DISABLE_TLBRD_CG_MASK);
>   	}
>   
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   	case IP_VERSION(2, 1, 1):
>   	case IP_VERSION(2, 1, 2):
> @@ -629,7 +629,7 @@ static void mmhub_v2_0_update_medium_grain_light_sleep(struct amdgpu_device *ade
>   	if (!(adev->cg_flags & AMD_CG_SUPPORT_MC_LS))
>   		return;
>   
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   	case IP_VERSION(2, 1, 1):
>   	case IP_VERSION(2, 1, 2):
> @@ -646,7 +646,7 @@ static void mmhub_v2_0_update_medium_grain_light_sleep(struct amdgpu_device *ade
>   		data &= ~MM_ATC_L2_MISC_CG__MEM_LS_ENABLE_MASK;
>   
>   	if (def != data) {
> -		switch (adev->ip_versions[MMHUB_HWIP]) {
> +		switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   		case IP_VERSION(2, 1, 0):
>   		case IP_VERSION(2, 1, 1):
>   		case IP_VERSION(2, 1, 2):
> @@ -665,7 +665,7 @@ static int mmhub_v2_0_set_clockgating(struct amdgpu_device *adev,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 0, 0):
>   	case IP_VERSION(2, 0, 2):
>   	case IP_VERSION(2, 1, 0):
> @@ -690,7 +690,7 @@ static void mmhub_v2_0_get_clockgating(struct amdgpu_device *adev, u32 *flags)
>   	if (amdgpu_sriov_vf(adev))
>   		*flags = 0;
>   
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   	case IP_VERSION(2, 1, 1):
>   	case IP_VERSION(2, 1, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index 4cf5d0595bbe..a11d60ec6321 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -90,7 +90,7 @@ mmhub_v2_3_print_l2_protection_fault_status(struct amdgpu_device *adev,
>   	dev_err(adev->dev,
>   		"MMVM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
>   		status);
> -	switch (adev->ip_versions[MMHUB_HWIP]) {
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
>   	case IP_VERSION(2, 3, 0):
>   	case IP_VERSION(2, 4, 0):
>   		mmhub_cid = mmhub_client_ids_vangogh[cid][rw];
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> index c3f968d9cfcb..1d8414c3fadb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -107,7 +107,7 @@ force_update_wptr_for_self_int(struct amdgpu_device *adev,
>   {
>   	u32 ih_cntl, ih_rb_cntl;
>   
> -	if (adev->ip_versions[OSSSYS_HWIP] < IP_VERSION(5, 0, 3))
> +	if (adev->ip_versions[OSSSYS_HWIP][0] < IP_VERSION(5, 0, 3))
>   		return;
>   
>   	ih_cntl = RREG32_SOC15(OSSSYS, 0, mmIH_CNTL2);
> @@ -332,7 +332,7 @@ static int navi10_ih_irq_init(struct amdgpu_device *adev)
>   
>   	if (unlikely(adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT)) {
>   		if (ih[0]->use_bus_addr) {
> -			switch (adev->ip_versions[OSSSYS_HWIP]) {
> +			switch (adev->ip_versions[OSSSYS_HWIP][0]) {
>   			case IP_VERSION(5, 0, 3):
>   			case IP_VERSION(5, 2, 0):
>   			case IP_VERSION(5, 2, 1):
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 57be517d70bf..89e32d6e2c10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -180,7 +180,7 @@ static const struct amdgpu_video_codecs yc_video_codecs_decode = {
>   static int nv_query_video_codecs(struct amdgpu_device *adev, bool encode,
>   				 const struct amdgpu_video_codecs **codecs)
>   {
> -	switch (adev->ip_versions[UVD_HWIP]) {
> +	switch (adev->ip_versions[UVD_HWIP][0]) {
>   	case IP_VERSION(3, 0, 0):
>   		if (amdgpu_sriov_vf(adev)) {
>   			if (encode)
> @@ -509,7 +509,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)
>   		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
>   				  amdgpu_reset_method);
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 5, 0):
>   	case IP_VERSION(13, 0, 1):
>   	case IP_VERSION(13, 0, 3):
> @@ -1044,7 +1044,7 @@ static int nv_common_early_init(void *handle)
>   	/* TODO: split the GC and PG flags based on the relevant IP version for which
>   	 * they are relevant.
>   	 */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(10, 1, 10):
>   		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
>   			AMD_CG_SUPPORT_GFX_CGCG |
> @@ -1375,7 +1375,7 @@ static int nv_common_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[NBIO_HWIP]) {
> +	switch (adev->ip_versions[NBIO_HWIP][0]) {
>   	case IP_VERSION(2, 3, 0):
>   	case IP_VERSION(2, 3, 1):
>   	case IP_VERSION(2, 3, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> index 13dace5d2855..382cebfc2069 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
> @@ -93,7 +93,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(11, 0, 2):
>   		chip_name = "vega20";
>   		break;
> @@ -129,7 +129,7 @@ static int psp_v11_0_init_microcode(struct psp_context *psp)
>   	}
>   
>   
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(11, 0, 2):
>   	case IP_VERSION(11, 0, 4):
>   		err = psp_init_sos_microcode(psp, chip_name);
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
> index 64b52c5ea981..17655bc6d2f1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
> @@ -47,7 +47,7 @@ static int psp_v13_0_init_microcode(struct psp_context *psp)
>   	const char *chip_name;
>   	int err = 0;
>   
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(13, 0, 2):
>   		chip_name = "aldebaran";
>   		break;
> @@ -58,7 +58,7 @@ static int psp_v13_0_init_microcode(struct psp_context *psp)
>   	default:
>   		BUG();
>   	}
> -	switch (adev->ip_versions[MP0_HWIP]) {
> +	switch (adev->ip_versions[MP0_HWIP][0]) {
>   	case IP_VERSION(13, 0, 2):
>   		err = psp_init_sos_microcode(psp, chip_name);
>   		if (err)
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index cb74f8c35d0a..e8e4749e9c79 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -469,7 +469,7 @@ static int sdma_v4_0_irq_id_to_seq(unsigned client_id)
>   
>   static void sdma_v4_0_init_golden_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_sdma_4,
> @@ -539,7 +539,7 @@ static void sdma_v4_0_setup_ulv(struct amdgpu_device *adev)
>   	 * The only chips with SDMAv4 and ULV are VG10 and VG20.
>   	 * Server SKUs take a different hysteresis setting from other SKUs.
>   	 */
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   		if (adev->pdev->device == 0x6860)
>   			break;
> @@ -590,8 +590,8 @@ static void sdma_v4_0_destroy_inst_ctx(struct amdgpu_device *adev)
>   
>   		/* arcturus shares the same FW memory across
>   		   all SDMA isntances */
> -		if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 2) ||
> -		    adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 4, 0))
> +		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
> +		    adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0))
>   			break;
>   	}
>   
> @@ -621,7 +621,7 @@ static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   		chip_name = "vega10";
>   		break;
> @@ -667,8 +667,8 @@ static int sdma_v4_0_init_microcode(struct amdgpu_device *adev)
>   		goto out;
>   
>   	for (i = 1; i < adev->sdma.num_instances; i++) {
> -		if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 2) ||
> -                    adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 4, 0)) {
> +		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) ||
> +                    adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 4, 0)) {
>   			/* Acturus & Aldebaran will leverage the same FW memory
>   			   for every SDMA instance */
>   			memcpy((void *)&adev->sdma.instance[i],
> @@ -1108,7 +1108,7 @@ static void sdma_v4_0_ctx_switch_enable(struct amdgpu_device *adev, bool enable)
>   		 * Arcturus for the moment and firmware version 14
>   		 * and above.
>   		 */
> -		if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 2) &&
> +		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) &&
>   		    adev->sdma.instance[i].fw_version >= 14)
>   			WREG32_SDMA(i, mmSDMA0_PUB_DUMMY_REG2, enable);
>   		/* Extend page fault timeout to avoid interrupt storm */
> @@ -1395,7 +1395,7 @@ static void sdma_v4_0_init_pg(struct amdgpu_device *adev)
>   	if (!(adev->pg_flags & AMD_PG_SUPPORT_SDMA))
>   		return;
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 1, 0):
>           case IP_VERSION(4, 1, 1):
>   	case IP_VERSION(4, 1, 2):
> @@ -1838,7 +1838,7 @@ static bool sdma_v4_0_fw_support_paging_queue(struct amdgpu_device *adev)
>   {
>   	uint fw_version = adev->sdma.instance[0].fw_version;
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 0, 0):
>   		return fw_version >= 430;
>   	case IP_VERSION(4, 0, 1):
> @@ -1863,7 +1863,7 @@ static int sdma_v4_0_early_init(void *handle)
>   	}
>   
>   	/* TODO: Page queue breaks driver reload under SRIOV */
> -	if ((adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 0, 0)) &&
> +	if ((adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 0, 0)) &&
>   	    amdgpu_sriov_vf((adev)))
>   		adev->sdma.has_page_queue = false;
>   	else if (sdma_v4_0_fw_support_paging_queue(adev))
> @@ -2136,14 +2136,14 @@ static int sdma_v4_0_process_trap_irq(struct amdgpu_device *adev,
>   		amdgpu_fence_process(&adev->sdma.instance[instance].ring);
>   		break;
>   	case 1:
> -		if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 0))
> +		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 0))
>   			amdgpu_fence_process(&adev->sdma.instance[instance].page);
>   		break;
>   	case 2:
>   		/* XXX compute */
>   		break;
>   	case 3:
> -		if (adev->ip_versions[SDMA0_HWIP] != IP_VERSION(4, 2, 0))
> +		if (adev->ip_versions[SDMA0_HWIP][0] != IP_VERSION(4, 2, 0))
>   			amdgpu_fence_process(&adev->sdma.instance[instance].page);
>   		break;
>   	}
> @@ -2359,7 +2359,7 @@ static int sdma_v4_0_set_powergating_state(void *handle,
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 1, 0):
>   	case IP_VERSION(4, 1, 1):
>   	case IP_VERSION(4, 1, 2):
> @@ -2547,7 +2547,7 @@ static void sdma_v4_0_set_ring_funcs(struct amdgpu_device *adev)
>   	int i;
>   
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 2) && i >= 5)
> +		if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) && i >= 5)
>   			adev->sdma.instance[i].ring.funcs =
>   					&sdma_v4_0_ring_funcs_2nd_mmhub;
>   		else
> @@ -2555,7 +2555,7 @@ static void sdma_v4_0_set_ring_funcs(struct amdgpu_device *adev)
>   					&sdma_v4_0_ring_funcs;
>   		adev->sdma.instance[i].ring.me = i;
>   		if (adev->sdma.has_page_queue) {
> -			if (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(4, 2, 2) && i >= 5)
> +			if (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(4, 2, 2) && i >= 5)
>   				adev->sdma.instance[i].page.funcs =
>   					&sdma_v4_0_page_ring_funcs_2nd_mmhub;
>   			else
> @@ -2782,7 +2782,7 @@ static const struct amdgpu_sdma_ras_funcs sdma_v4_0_ras_funcs = {
>   
>   static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(4, 2, 0):
>   	case IP_VERSION(4, 2, 2):
>   		adev->sdma.funcs = &sdma_v4_0_ras_funcs;
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index d3b01d2977c0..853d1511b889 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -187,7 +187,7 @@ static u32 sdma_v5_0_get_reg_offset(struct amdgpu_device *adev, u32 instance, u3
>   
>   static void sdma_v5_0_init_golden_registers(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(5, 0, 0):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_sdma_5,
> @@ -248,12 +248,12 @@ static int sdma_v5_0_init_microcode(struct amdgpu_device *adev)
>   	const struct common_firmware_header *header = NULL;
>   	const struct sdma_firmware_header_v1_0 *hdr;
>   
> -	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(5, 0, 5)))
> +	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 0, 5)))
>   		return 0;
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(5, 0, 0):
>   		chip_name = "navi10";
>   		break;
> @@ -1634,7 +1634,7 @@ static int sdma_v5_0_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(5, 0, 0):
>   	case IP_VERSION(5, 0, 2):
>   	case IP_VERSION(5, 0, 5):
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 92f29beda3b2..0fec1d9dd638 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -136,7 +136,7 @@ static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
>   
>   	DRM_DEBUG("\n");
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(5, 2, 0):
>   		chip_name = "sienna_cichlid";
>   		break;
> @@ -174,7 +174,7 @@ static int sdma_v5_2_init_microcode(struct amdgpu_device *adev)
>   		       (void *)&adev->sdma.instance[0],
>   		       sizeof(struct amdgpu_sdma_instance));
>   
> -	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP] == IP_VERSION(5, 2, 0)))
> +	if (amdgpu_sriov_vf(adev) && (adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 2, 0)))
>   		return 0;
>   
>   	DRM_DEBUG("psp_load == '%s'\n",
> @@ -1530,7 +1530,7 @@ static void sdma_v5_2_update_medium_grain_clock_gating(struct amdgpu_device *ade
>   
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
>   
> -		if (adev->sdma.instance[i].fw_version < 70 && adev->ip_versions[SDMA0_HWIP] == IP_VERSION(5, 2, 1))
> +		if (adev->sdma.instance[i].fw_version < 70 && adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 2, 1))
>   			adev->cg_flags &= ~AMD_CG_SUPPORT_SDMA_MGCG;
>   
>   		if (enable && (adev->cg_flags & AMD_CG_SUPPORT_SDMA_MGCG)) {
> @@ -1567,7 +1567,7 @@ static void sdma_v5_2_update_medium_grain_light_sleep(struct amdgpu_device *adev
>   
>   	for (i = 0; i < adev->sdma.num_instances; i++) {
>   
> -		if (adev->sdma.instance[i].fw_version < 70 && adev->ip_versions[SDMA0_HWIP] == IP_VERSION(5, 2, 1))
> +		if (adev->sdma.instance[i].fw_version < 70 && adev->ip_versions[SDMA0_HWIP][0] == IP_VERSION(5, 2, 1))
>   			adev->cg_flags &= ~AMD_CG_SUPPORT_SDMA_LS;
>   
>   		if (enable && (adev->cg_flags & AMD_CG_SUPPORT_SDMA_LS)) {
> @@ -1596,7 +1596,7 @@ static int sdma_v5_2_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[SDMA0_HWIP]) {
> +	switch (adev->ip_versions[SDMA0_HWIP][0]) {
>   	case IP_VERSION(5, 2, 0):
>   	case IP_VERSION(5, 2, 2):
>   	case IP_VERSION(5, 2, 1):
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index 7f4cd1a4f6cb..74310bb4216a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -156,8 +156,8 @@ static const struct amdgpu_video_codecs rn_video_codecs_decode =
>   static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
>   				    const struct amdgpu_video_codecs **codecs)
>   {
> -	if (adev->ip_versions[VCE_HWIP]) {
> -		switch (adev->ip_versions[VCE_HWIP]) {
> +	if (adev->ip_versions[VCE_HWIP][0]) {
> +		switch (adev->ip_versions[VCE_HWIP][0]) {
>   		case IP_VERSION(4, 0, 0):
>   		case IP_VERSION(4, 1, 0):
>   			if (encode)
> @@ -169,7 +169,7 @@ static int soc15_query_video_codecs(struct amdgpu_device *adev, bool encode,
>   			return -EINVAL;
>   		}
>   	} else {
> -		switch (adev->ip_versions[UVD_HWIP]) {
> +		switch (adev->ip_versions[UVD_HWIP][0]) {
>   		case IP_VERSION(1, 0, 0):
>   		case IP_VERSION(1, 0, 1):
>   			if (encode)
> @@ -341,11 +341,11 @@ static u32 soc15_get_xclk(struct amdgpu_device *adev)
>   {
>   	u32 reference_clock = adev->clock.spll.reference_freq;
>   
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(12, 0, 0) ||
> -	    adev->ip_versions[MP1_HWIP] == IP_VERSION(12, 0, 1))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 0) ||
> +	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(12, 0, 1))
>   		return 10000;
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(10, 0, 0) ||
> -	    adev->ip_versions[MP1_HWIP] == IP_VERSION(10, 0, 1))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(10, 0, 0) ||
> +	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(10, 0, 1))
>   		return reference_clock / 4;
>   
>   	return reference_clock;
> @@ -576,7 +576,7 @@ soc15_asic_reset_method(struct amdgpu_device *adev)
>   		dev_warn(adev->dev, "Specified reset method:%d isn't supported, using AUTO instead.\n",
>   				  amdgpu_reset_method);
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(10, 0, 0):
>   	case IP_VERSION(10, 0, 1):
>   	case IP_VERSION(12, 0, 0):
> @@ -641,7 +641,7 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
>   
>   static bool soc15_supports_baco(struct amdgpu_device *adev)
>   {
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(9, 0, 0):
>   	case IP_VERSION(11, 0, 2):
>   		if (adev->asic_type == CHIP_VEGA20) {
> @@ -1172,7 +1172,7 @@ static int soc15_common_early_init(void *handle)
>   	/* TODO: split the GC and PG flags based on the relevant IP version for which
>   	 * they are relevant.
>   	 */
> -	switch (adev->ip_versions[GC_HWIP]) {
> +	switch (adev->ip_versions[GC_HWIP][0]) {
>   	case IP_VERSION(9, 0, 1):
>   		adev->asic_funcs = &soc15_asic_funcs;
>   		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
> @@ -1583,7 +1583,7 @@ static int soc15_common_set_clockgating_state(void *handle,
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[NBIO_HWIP]) {
> +	switch (adev->ip_versions[NBIO_HWIP][0]) {
>   	case IP_VERSION(6, 1, 0):
>   	case IP_VERSION(6, 2, 0):
>   	case IP_VERSION(7, 4, 0):
> @@ -1639,7 +1639,7 @@ static void soc15_common_get_clockgating_state(void *handle, u32 *flags)
>   
>   	adev->hdp.funcs->get_clock_gating_state(adev, flags);
>   
> -	if (adev->ip_versions[MP0_HWIP] != IP_VERSION(13, 0, 2)) {
> +	if (adev->ip_versions[MP0_HWIP][0] != IP_VERSION(13, 0, 2)) {
>   
>   		/* AMD_CG_SUPPORT_DRM_MGCG */
>   		data = RREG32(SOC15_REG_OFFSET(MP0, 0, mmMP0_MISC_CGTT_CTRL0));
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> index e9758969fbe6..f4a7a30ecebd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -1720,7 +1720,7 @@ static void vcn_v2_5_set_dec_ring_funcs(struct amdgpu_device *adev)
>   	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>   		if (adev->vcn.harvest_config & (1 << i))
>   			continue;
> -		if (adev->ip_versions[UVD_HWIP] == IP_VERSION(2, 5, 0))
> +		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(2, 5, 0))
>   			adev->vcn.inst[i].ring_dec.funcs = &vcn_v2_5_dec_ring_vm_funcs;
>   		else /* CHIP_ALDEBARAN */
>   			adev->vcn.inst[i].ring_dec.funcs = &vcn_v2_6_dec_ring_vm_funcs;
> @@ -1737,7 +1737,7 @@ static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev)
>   		if (adev->vcn.harvest_config & (1 << j))
>   			continue;
>   		for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
> -			if (adev->ip_versions[UVD_HWIP] == IP_VERSION(2, 5, 0))
> +			if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(2, 5, 0))
>   				adev->vcn.inst[j].ring_enc[i].funcs = &vcn_v2_5_enc_ring_vm_funcs;
>   			else /* CHIP_ALDEBARAN */
>   				adev->vcn.inst[j].ring_enc[i].funcs = &vcn_v2_6_enc_ring_vm_funcs;
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> index a81d834ea0d3..6940716db1df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
> @@ -95,7 +95,7 @@ static int vcn_v3_0_early_init(void *handle)
>   		adev->vcn.num_enc_rings = 1;
>   
>   	} else {
> -		if (adev->ip_versions[UVD_HWIP] == IP_VERSION(3, 0, 0)) {
> +		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 0, 0)) {
>   			u32 harvest;
>   
>   			for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
> @@ -110,7 +110,7 @@ static int vcn_v3_0_early_init(void *handle)
>   				return -ENOENT;
>   		}
>   
> -		if (adev->ip_versions[UVD_HWIP] == IP_VERSION(3, 0, 33))
> +		if (adev->ip_versions[UVD_HWIP][0] == IP_VERSION(3, 0, 33))
>   			adev->vcn.num_enc_rings = 0;
>   		else
>   			adev->vcn.num_enc_rings = 2;
> @@ -1270,7 +1270,7 @@ static int vcn_v3_0_start(struct amdgpu_device *adev)
>   		fw_shared->rb.wptr = lower_32_bits(ring->wptr);
>   		fw_shared->multi_queue.decode_queue_mode &= cpu_to_le32(~FW_QUEUE_RING_RESET);
>   
> -		if (adev->ip_versions[UVD_HWIP] != IP_VERSION(3, 0, 33)) {
> +		if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(3, 0, 33)) {
>   			fw_shared->multi_queue.encode_generalpurpose_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
>   			ring = &adev->vcn.inst[i].ring_enc[0];
>   			WREG32_SOC15(VCN, i, mmUVD_RB_RPTR, lower_32_bits(ring->wptr));
> @@ -1642,7 +1642,7 @@ static int vcn_v3_0_pause_dpg_mode(struct amdgpu_device *adev,
>   					UVD_POWER_STATUS__STALL_DPG_POWER_UP_MASK,
>   					~UVD_POWER_STATUS__STALL_DPG_POWER_UP_MASK);
>   
> -				if (adev->ip_versions[UVD_HWIP] != IP_VERSION(3, 0, 33)) {
> +				if (adev->ip_versions[UVD_HWIP][0] != IP_VERSION(3, 0, 33)) {
>   					/* Restore */
>   					fw_shared = adev->vcn.inst[inst_idx].fw_shared_cpu_addr;
>   					fw_shared->multi_queue.encode_generalpurpose_queue_mode |= cpu_to_le32(FW_QUEUE_RING_RESET);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index fc8a30251fa4..fb89ce4dd28c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1344,7 +1344,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>   		init_data.flags.gpu_vm_support = true;
>   		break;
>   	default:
> -		switch (adev->ip_versions[DCE_HWIP]) {
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
>   		case IP_VERSION(2, 1, 0):
>   			init_data.flags.gpu_vm_support = true;
>   			if (ASICREV_IS_GREEN_SARDINE(adev->external_rev_id))
> @@ -1658,7 +1658,7 @@ static int load_dmcu_fw(struct amdgpu_device *adev)
>   			return 0;
>   		break;
>   	default:
> -		switch (adev->ip_versions[DCE_HWIP]) {
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
>   		case IP_VERSION(2, 0, 2):
>   		case IP_VERSION(2, 0, 0):
>   		case IP_VERSION(2, 1, 0):
> @@ -1750,7 +1750,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>   	enum dmub_status status;
>   	int r;
>   
> -	switch (adev->ip_versions[DCE_HWIP]) {
> +	switch (adev->ip_versions[DCE_HWIP][0]) {
>   	case IP_VERSION(2, 1, 0):
>   		dmub_asic = DMUB_ASIC_DCN21;
>   		fw_name_dmub = FIRMWARE_RENOIR_DMUB;
> @@ -1758,7 +1758,7 @@ static int dm_dmub_sw_init(struct amdgpu_device *adev)
>   			fw_name_dmub = FIRMWARE_GREEN_SARDINE_DMUB;
>   		break;
>   	case IP_VERSION(3, 0, 0):
> -		if (adev->ip_versions[GC_HWIP] == IP_VERSION(10, 3, 0)) {
> +		if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0)) {
>   			dmub_asic = DMUB_ASIC_DCN30;
>   			fw_name_dmub = FIRMWARE_SIENNA_CICHLID_DMUB;
>   		} else {
> @@ -2078,7 +2078,7 @@ static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
>   	 * therefore, this function apply to navi10/12/14 but not Renoir
>   	 * *
>   	 */
> -	switch (adev->ip_versions[DCE_HWIP]) {
> +	switch (adev->ip_versions[DCE_HWIP][0]) {
>   	case IP_VERSION(2, 0, 2):
>   	case IP_VERSION(2, 0, 0):
>   		break;
> @@ -4086,7 +4086,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
>   	/* Use Outbox interrupt */
> -	switch (adev->ip_versions[DCE_HWIP]) {
> +	switch (adev->ip_versions[DCE_HWIP][0]) {
>   	case IP_VERSION(3, 0, 0):
>   	case IP_VERSION(3, 1, 2):
>   	case IP_VERSION(3, 1, 3):
> @@ -4098,7 +4098,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   		break;
>   	default:
>   		DRM_DEBUG_KMS("Unsupported DCN IP version for outbox: 0x%X\n",
> -			      adev->ip_versions[DCE_HWIP]);
> +			      adev->ip_versions[DCE_HWIP][0]);
>   	}
>   #endif
>   
> @@ -4186,7 +4186,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   		break;
>   	default:
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -		switch (adev->ip_versions[DCE_HWIP]) {
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
>   		case IP_VERSION(1, 0, 0):
>   		case IP_VERSION(1, 0, 1):
>   		case IP_VERSION(2, 0, 2):
> @@ -4205,7 +4205,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
>   			break;
>   		default:
>   			DRM_ERROR("Unsupported DCE IP versions: 0x%X\n",
> -					adev->ip_versions[DCE_HWIP]);
> +					adev->ip_versions[DCE_HWIP][0]);
>   			goto fail;
>   		}
>   #endif
> @@ -4357,7 +4357,7 @@ static int dm_early_init(void *handle)
>   		break;
>   	default:
>   #if defined(CONFIG_DRM_AMD_DC_DCN)
> -		switch (adev->ip_versions[DCE_HWIP]) {
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
>   		case IP_VERSION(2, 0, 2):
>   		case IP_VERSION(3, 0, 0):
>   			adev->mode_info.num_crtc = 6;
> @@ -4387,7 +4387,7 @@ static int dm_early_init(void *handle)
>   			break;
>   		default:
>   			DRM_ERROR("Unsupported DCE IP versions: 0x%x\n",
> -					adev->ip_versions[DCE_HWIP]);
> +					adev->ip_versions[DCE_HWIP][0]);
>   			return -EINVAL;
>   		}
>   #endif
> @@ -4609,7 +4609,7 @@ fill_gfx9_tiling_info_from_device(const struct amdgpu_device *adev,
>   	tiling_info->gfx9.num_rb_per_se =
>   		adev->gfx.config.gb_addr_config_fields.num_rb_per_se;
>   	tiling_info->gfx9.shaderEnable = 1;
> -	if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
> +	if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
>   		tiling_info->gfx9.num_pkrs = adev->gfx.config.gb_addr_config_fields.num_pkrs;
>   }
>   
> @@ -5050,7 +5050,7 @@ get_plane_modifiers(const struct amdgpu_device *adev, unsigned int plane_type, u
>   	case AMDGPU_FAMILY_NV:
>   	case AMDGPU_FAMILY_VGH:
>   	case AMDGPU_FAMILY_YC:
> -		if (adev->ip_versions[GC_HWIP] >= IP_VERSION(10, 3, 0))
> +		if (adev->ip_versions[GC_HWIP][0] >= IP_VERSION(10, 3, 0))
>   			add_gfx10_3_modifiers(adev, mods, &size, &capacity);
>   		else
>   			add_gfx10_1_modifiers(adev, mods, &size, &capacity);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index 150cac4ea75c..9c601997a96a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -455,7 +455,7 @@ static int smu_get_power_num_states(void *handle,
>   
>   bool is_support_sw_smu(struct amdgpu_device *adev)
>   {
> -	if (adev->ip_versions[MP1_HWIP] >= IP_VERSION(11, 0, 0))
> +	if (adev->ip_versions[MP1_HWIP][0] >= IP_VERSION(11, 0, 0))
>   		return true;
>   
>   	return false;
> @@ -575,7 +575,7 @@ static int smu_set_funcs(struct amdgpu_device *adev)
>   	if (adev->pm.pp_feature & PP_OVERDRIVE_MASK)
>   		smu->od_enabled = true;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
>   	case IP_VERSION(11, 0, 9):
> @@ -694,7 +694,7 @@ static int smu_late_init(void *handle)
>   		return ret;
>   	}
>   
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(13, 0, 1))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 1))
>   		return 0;
>   
>   	if (!amdgpu_sriov_vf(adev) || smu->od_enabled) {
> @@ -1140,10 +1140,10 @@ static int smu_smc_hw_setup(struct smu_context *smu)
>   	if (adev->in_suspend && smu_is_dpm_running(smu)) {
>   		dev_info(adev->dev, "dpm has been enabled\n");
>   		/* this is needed specifically */
> -		if ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) ||
> -		    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 11)) ||
> -		    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 5, 0)) ||
> -		    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 12)))
> +		if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) ||
> +		    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11)) ||
> +		    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0)) ||
> +		    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 12)))
>   			ret = smu_system_features_control(smu, true);
>   		return ret;
>   	}
> @@ -1286,7 +1286,7 @@ static int smu_start_smc_engine(struct smu_context *smu)
>   	int ret = 0;
>   
>   	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP) {
> -		if (adev->ip_versions[MP1_HWIP] < IP_VERSION(11, 0, 0)) {
> +		if (adev->ip_versions[MP1_HWIP][0] < IP_VERSION(11, 0, 0)) {
>   			if (smu->ppt_funcs->load_microcode) {
>   				ret = smu->ppt_funcs->load_microcode(smu);
>   				if (ret)
> @@ -1405,14 +1405,14 @@ static int smu_disable_dpms(struct smu_context *smu)
>   	 *     properly.
>   	 */
>   	if (smu->uploading_custom_pp_table &&
> -	    ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 9)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 11)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 5, 0)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 12)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13))))
> +	    ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 12)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))))
>   		return smu_disable_all_features_with_exception(smu,
>   							       true,
>   							       SMU_FEATURE_COUNT);
> @@ -1421,10 +1421,10 @@ static int smu_disable_dpms(struct smu_context *smu)
>   	 * For Sienna_Cichlid, PMFW will handle the features disablement properly
>   	 * on BACO in. Driver involvement is unnecessary.
>   	 */
> -	if (((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 9))) &&
> +	if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9))) &&
>   	    use_baco)
>   		return smu_disable_all_features_with_exception(smu,
>   							       true,
> @@ -1446,7 +1446,7 @@ static int smu_disable_dpms(struct smu_context *smu)
>   			dev_err(adev->dev, "Failed to disable smu features.\n");
>   	}
>   
> -	if (adev->ip_versions[MP1_HWIP] >= IP_VERSION(11, 0, 0) &&
> +	if (adev->ip_versions[MP1_HWIP][0] >= IP_VERSION(11, 0, 0) &&
>   	    adev->gfx.rlc.funcs->stop)
>   		adev->gfx.rlc.funcs->stop(adev);
>   
> @@ -2283,11 +2283,11 @@ int smu_get_power_limit(void *handle,
>   	} else {
>   		switch (limit_level) {
>   		case SMU_PPT_LIMIT_CURRENT:
> -			if ((adev->ip_versions[MP1_HWIP] == IP_VERSION(13, 0, 2)) ||
> -			    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) ||
> -			    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 11)) ||
> -			    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 12)) ||
> -			    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13)))
> +			if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 2)) ||
> +			    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) ||
> +			    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11)) ||
> +			    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 12)) ||
> +			    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13)))
>   				ret = smu_get_asic_power_limits(smu,
>   								&smu->current_power_limit,
>   								NULL,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index d96f904a765b..71161f6b78fe 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -345,7 +345,7 @@ navi10_get_allowed_feature_mask(struct smu_context *smu,
>   
>   	/* DPM UCLK enablement should be skipped for navi10 A0 secure board */
>   	if (!(is_asic_secure(smu) &&
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) &&
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) &&
>   	     (adev->rev_id == 0)) &&
>   	    (adev->pm.pp_feature & PP_MCLK_DPM_MASK))
>   		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_UCLK_BIT)
> @@ -354,7 +354,7 @@ navi10_get_allowed_feature_mask(struct smu_context *smu,
>   
>   	/* DS SOCCLK enablement should be skipped for navi10 A0 secure board */
>   	if (is_asic_secure(smu) &&
> -	    (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) &&
> +	    (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) &&
>   	    (adev->rev_id == 0))
>   		*(uint64_t *)feature_mask &=
>   				~FEATURE_MASK(FEATURE_DS_SOCCLK_BIT);
> @@ -925,7 +925,7 @@ static int navi1x_get_smu_metrics_data(struct smu_context *smu,
>   		return ret;
>   	}
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 9):
>   		if (smu_version > 0x00341C00)
>   			ret = navi12_get_smu_metrics_data(smu, member, value);
> @@ -935,8 +935,8 @@ static int navi1x_get_smu_metrics_data(struct smu_context *smu,
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
>   	default:
> -		if (((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
> -		      ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
> +		if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
> +		      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
>   			ret = navi10_get_smu_metrics_data(smu, member, value);
>   		else
>   			ret = navi10_get_legacy_smu_metrics_data(smu, member, value);
> @@ -1509,7 +1509,7 @@ static int navi10_populate_umd_state_clk(struct smu_context *smu)
>   	uint32_t sclk_freq;
>   
>   	pstate_table->gfxclk_pstate.min = gfx_table->min;
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 0):
>   		switch (adev->pdev->revision) {
>   		case 0xf0: /* XTX */
> @@ -2562,8 +2562,8 @@ static bool navi10_need_umc_cdr_workaround(struct smu_context *smu)
>   	if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT))
>   		return false;
>   
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0) ||
> -	    adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0) ||
> +	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5))
>   		return true;
>   
>   	return false;
> @@ -2671,8 +2671,8 @@ static int navi10_run_umc_cdr_workaround(struct smu_context *smu)
>   	 * - PPSMC_MSG_SetDriverDummyTableDramAddrLow
>   	 * - PPSMC_MSG_GetUMCFWWA
>   	 */
> -	if (((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) && (pmfw_version >= 0x2a3500)) ||
> -	    ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5)) && (pmfw_version >= 0x351D00))) {
> +	if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && (pmfw_version >= 0x2a3500)) ||
> +	    ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && (pmfw_version >= 0x351D00))) {
>   		ret = smu_cmn_send_smc_msg_with_param(smu,
>   						      SMU_MSG_GET_UMC_FW_WA,
>   						      0,
> @@ -2691,13 +2691,13 @@ static int navi10_run_umc_cdr_workaround(struct smu_context *smu)
>   			return 0;
>   
>   		if (umc_fw_disable_cdr) {
> -			if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0))
> +			if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0))
>   				return navi10_umc_hybrid_cdr_workaround(smu);
>   		} else {
>   			return navi10_set_dummy_pstates_table_location(smu);
>   		}
>   	} else {
> -		if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0))
> +		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0))
>   			return navi10_umc_hybrid_cdr_workaround(smu);
>   	}
>   
> @@ -3151,7 +3151,7 @@ static ssize_t navi1x_get_gpu_metrics(struct smu_context *smu,
>   		return ret;
>   	}
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 9):
>   		if (smu_version > 0x00341C00)
>   			ret = navi12_get_gpu_metrics(smu, table);
> @@ -3161,8 +3161,8 @@ static ssize_t navi1x_get_gpu_metrics(struct smu_context *smu,
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
>   	default:
> -		if (((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
> -		      ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
> +		if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 5)) && smu_version > 0x00351F00) ||
> +		      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 0)) && smu_version > 0x002A3B00))
>   			ret = navi10_get_gpu_metrics(smu, table);
>   		else
>   			ret =navi10_get_legacy_gpu_metrics(smu, table);
> @@ -3180,7 +3180,7 @@ static int navi10_enable_mgpu_fan_boost(struct smu_context *smu)
>   	uint32_t param = 0;
>   
>   	/* Navi12 does not support this */
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 9))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9))
>   		return 0;
>   
>   	/*
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index 6a0fed5e33d9..15e66e1912de 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -74,7 +74,7 @@
>   #define SMU_11_0_7_GFX_BUSY_THRESHOLD 15
>   
>   #define GET_PPTABLE_MEMBER(field, member) do {\
> -	if (smu->adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13))\
> +	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))\
>   		(*member) = (smu->smu_table.driver_pptable + offsetof(PPTable_beige_goby_t, field));\
>   	else\
>   		(*member) = (smu->smu_table.driver_pptable + offsetof(PPTable_t, field));\
> @@ -82,7 +82,7 @@
>   
>   static int get_table_size(struct smu_context *smu)
>   {
> -	if (smu->adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13))
> +	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
>   		return sizeof(PPTable_beige_goby_t);
>   	else
>   		return sizeof(PPTable_t);
> @@ -298,7 +298,7 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
>   	}
>   
>   	if ((adev->pm.pp_feature & PP_GFX_DCS_MASK) &&
> -	    (adev->ip_versions[MP1_HWIP] > IP_VERSION(11, 0, 7)) &&
> +	    (adev->ip_versions[MP1_HWIP][0] > IP_VERSION(11, 0, 7)) &&
>   	    !(adev->flags & AMD_IS_APU))
>   		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_GFX_DCS_BIT);
>   
> @@ -496,7 +496,7 @@ static uint32_t sienna_cichlid_get_throttler_status_locked(struct smu_context *s
>   	uint32_t throttler_status = 0;
>   	int i;
>   
> -	if ((smu->adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +	if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   	     (smu->smc_fw_version >= 0x3A4300)) {
>   		for (i = 0; i < THROTTLER_COUNT; i++)
>   			throttler_status |=
> @@ -517,7 +517,7 @@ static int sienna_cichlid_get_smu_metrics_data(struct smu_context *smu,
>   		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics);
>   	SmuMetrics_V2_t *metrics_v2 =
>   		&(((SmuMetricsExternal_t *)(smu_table->metrics_table))->SmuMetrics_V2);
> -	bool use_metrics_v2 = ((smu->adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +	bool use_metrics_v2 = ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   		(smu->smc_fw_version >= 0x3A4300)) ? true : false;
>   	uint16_t average_gfx_activity;
>   	int ret = 0;
> @@ -1170,7 +1170,7 @@ static int sienna_cichlid_print_clk_levels(struct smu_context *smu,
>   		 * and onwards SMU firmwares.
>   		 */
>   		smu_cmn_get_smc_version(smu, NULL, &smu_version);
> -		if ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +		if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   		     (smu_version < 0x003a2900))
>   			break;
>   
> @@ -1937,7 +1937,7 @@ static void sienna_cichlid_dump_od_table(struct smu_context *smu,
>   							od_table->UclkFmax);
>   
>   	smu_cmn_get_smc_version(smu, NULL, &smu_version);
> -	if (!((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +	if (!((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   	       (smu_version < 0x003a2900)))
>   		dev_dbg(smu->adev->dev, "OD: VddGfxOffset: %d\n", od_table->VddGfxOffset);
>   }
> @@ -2161,7 +2161,7 @@ static int sienna_cichlid_od_edit_dpm_table(struct smu_context *smu,
>   		 * and onwards SMU firmwares.
>   		 */
>   		smu_cmn_get_smc_version(smu, NULL, &smu_version);
> -		if ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +		if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   		     (smu_version < 0x003a2900)) {
>   			dev_err(smu->adev->dev, "OD GFX Voltage offset functionality is supported "
>   						"only by 58.41.0 and onwards SMU firmwares!\n");
> @@ -2865,7 +2865,7 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
>   	PPTable_t *pptable = table_context->driver_pptable;
>   	int i;
>   
> -	if (smu->adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13)) {
> +	if (smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13)) {
>   		beige_goby_dump_pptable(smu);
>   		return;
>   	}
> @@ -3625,7 +3625,7 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct smu_context *smu,
>   	SmuMetrics_V2_t *metrics_v2 =
>   		&(metrics_external.SmuMetrics_V2);
>   	struct amdgpu_device *adev = smu->adev;
> -	bool use_metrics_v2 = ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) &&
> +	bool use_metrics_v2 = ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
>   		(smu->smc_fw_version >= 0x3A4300)) ? true : false;
>   	uint16_t average_gfx_activity;
>   	int ret = 0;
> @@ -3706,8 +3706,8 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct smu_context *smu,
>   
>   	gpu_metrics->current_fan_speed = use_metrics_v2 ? metrics_v2->CurrFanSpeed : metrics->CurrFanSpeed;
>   
> -	if (((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7)) && smu->smc_fw_version > 0x003A1E00) ||
> -	      ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 11)) && smu->smc_fw_version > 0x00410400)) {
> +	if (((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) && smu->smc_fw_version > 0x003A1E00) ||
> +	      ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11)) && smu->smc_fw_version > 0x00410400)) {
>   		gpu_metrics->pcie_link_width = use_metrics_v2 ? metrics_v2->PcieWidth : metrics->PcieWidth;
>   		gpu_metrics->pcie_link_speed = link_speed[use_metrics_v2 ? metrics_v2->PcieRate : metrics->PcieRate];
>   	} else {
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> index 1ae8b8dc3bd3..3470c33ee09d 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> @@ -90,11 +90,11 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
>   	struct amdgpu_firmware_info *ucode = NULL;
>   
>   	if (amdgpu_sriov_vf(adev) &&
> -	    ((adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 9)) ||
> -	     (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 7))))
> +	    ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 9)) ||
> +	     (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7))))
>   		return 0;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 0):
>   		chip_name = "navi10";
>   		break;
> @@ -121,7 +121,7 @@ int smu_v11_0_init_microcode(struct smu_context *smu)
>   		break;
>   	default:
>   		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
> -			adev->ip_versions[MP1_HWIP]);
> +			adev->ip_versions[MP1_HWIP][0]);
>   		return -EINVAL;
>   	}
>   
> @@ -239,7 +239,7 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
>   	if (smu->is_apu)
>   		adev->pm.fw_version = smu_version;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 0):
>   		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_NV10;
>   		break;
> @@ -272,7 +272,7 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
>   		break;
>   	default:
>   		dev_err(smu->adev->dev, "smu unsupported IP version: 0x%x.\n",
> -			adev->ip_versions[MP1_HWIP]);
> +			adev->ip_versions[MP1_HWIP][0]);
>   		smu->smc_driver_if_version = SMU11_DRIVER_IF_VERSION_INV;
>   		break;
>   	}
> @@ -496,7 +496,7 @@ int smu_v11_0_init_power(struct smu_context *smu)
>   {
>   	struct amdgpu_device *adev = smu->adev;
>   	struct smu_power_context *smu_power = &smu->smu_power;
> -	size_t size = adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 5, 0) ?
> +	size_t size = adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0) ?
>   			sizeof(struct smu_11_5_power_context) :
>   			sizeof(struct smu_11_0_power_context);
>   
> @@ -753,9 +753,9 @@ int smu_v11_0_init_display_count(struct smu_context *smu, uint32_t count)
>   	/* Navy_Flounder/Dimgrey_Cavefish do not support to change
>   	 * display num currently
>   	 */
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 11) ||
> -	    adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 5, 0) ||
> -	    adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 13))
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 11) ||
> +	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 5, 0) ||
> +	    adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 13))
>   		return 0;
>   
>   	return smu_cmn_send_smc_msg_with_param(smu,
> @@ -1140,7 +1140,7 @@ int smu_v11_0_gfx_off_control(struct smu_context *smu, bool enable)
>   	int ret = 0;
>   	struct amdgpu_device *adev = smu->adev;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 5):
>   	case IP_VERSION(11, 0, 9):
> @@ -1634,7 +1634,7 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
>   	mutex_lock(&smu_baco->mutex);
>   
>   	if (state == SMU_BACO_STATE_ENTER) {
> -		switch (adev->ip_versions[MP1_HWIP]) {
> +		switch (adev->ip_versions[MP1_HWIP][0]) {
>   		case IP_VERSION(11, 0, 7):
>   		case IP_VERSION(11, 0, 11):
>   		case IP_VERSION(11, 0, 12):
> @@ -1653,7 +1653,7 @@ int smu_v11_0_baco_set_state(struct smu_context *smu, enum smu_baco_state state)
>   		default:
>   			if (!ras || !adev->ras_enabled ||
>   			    adev->gmc.xgmi.pending_reset) {
> -				if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 2)) {
> +				if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 2)) {
>   					data = RREG32_SOC15(THM, 0, mmTHM_BACO_CNTL_ARCT);
>   					data |= 0x80000000;
>   					WREG32_SOC15(THM, 0, mmTHM_BACO_CNTL_ARCT, data);
> @@ -1935,7 +1935,7 @@ int smu_v11_0_set_performance_level(struct smu_context *smu,
>   	 * Separate MCLK and SOCCLK soft min/max settings are not allowed
>   	 * on Arcturus.
>   	 */
> -	if (adev->ip_versions[MP1_HWIP] == IP_VERSION(11, 0, 2)) {
> +	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 2)) {
>   		mclk_min = mclk_max = 0;
>   		socclk_min = socclk_max = 0;
>   	}
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index 08f3cc809fc6..05c5e61f3506 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -89,13 +89,13 @@ int smu_v13_0_init_microcode(struct smu_context *smu)
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(13, 0, 2):
>   		chip_name = "aldebaran";
>   		break;
>   	default:
>   		dev_err(adev->dev, "Unsupported IP version 0x%x\n",
> -			adev->ip_versions[MP1_HWIP]);
> +			adev->ip_versions[MP1_HWIP][0]);
>   		return -EINVAL;
>   	}
>   
> @@ -211,7 +211,7 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
>   	smu_minor = (smu_version >> 8) & 0xff;
>   	smu_debug = (smu_version >> 0) & 0xff;
>   
> -	switch (smu->adev->ip_versions[MP1_HWIP]) {
> +	switch (smu->adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(13, 0, 2):
>   		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_ALDE;
>   		break;
> @@ -221,7 +221,7 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
>   		break;
>   	default:
>   		dev_err(smu->adev->dev, "smu unsupported IP version: 0x%x.\n",
> -			smu->adev->ip_versions[MP1_HWIP]);
> +			smu->adev->ip_versions[MP1_HWIP][0]);
>   		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_INV;
>   		break;
>   	}
> @@ -743,7 +743,7 @@ int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable)
>   	int ret = 0;
>   	struct amdgpu_device *adev = smu->adev;
>   
> -	switch (adev->ip_versions[MP1_HWIP]) {
> +	switch (adev->ip_versions[MP1_HWIP][0]) {
>   	case IP_VERSION(13, 0, 1):
>   	case IP_VERSION(13, 0, 3):
>   		if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
> 
