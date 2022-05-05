Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF4651C08A
	for <lists+amd-gfx@lfdr.de>; Thu,  5 May 2022 15:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996E210E0B4;
	Thu,  5 May 2022 13:23:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108C10E0A6
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 May 2022 13:23:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mk8P2kcaV7L0lXXFVXqZjqz7+0d4xjS+evjEDeKjIQW0BPkKKc8Jg4svH7Nv8zK71OCPiHA7ZIDH9pnkWJxsmu58za9v42jEi77SV05PwVAmMpRHSqCyER6ypCtzif0veMFXjQJL4d0D9Qp2PLR+PHgiaEmRofJD2r+hAAVy8QP02OIVD15hsBdT0U84jCtK7cwWo5W7x79k/4WARm4DlnQbZ1Be/019j5jfT3XwhdAcCLFjfchzMJxrgB6zyyZ6EasSzqOrHkT1yIW+h7YftnBV5LMkv31kysJ2MecXdLEuW6NEGsY5TAY4+xNCA3iwWJvLLawbQPHbuAPioAt1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBAewQa2CTW3gMnqmlFiO8aTd3s92QCQbO4MjksvPTU=;
 b=LN3F8NdWaNqE6XULdDszUWZpsX5auHZ3WPMLWcWrBEe6ZTY9kVvK2Gdemey7JRCN8R7oMqBFtpUJupSNu0E+0ZPMKfdk0ydSuOzMwl3LaB9mmyHGPCye9kl9RpiM4xgXxGjEUDj+EDAoYBxCrPzwsEIJi9D+Uu74r9jVAYwLhRwi//PlY+GZjzphDJJHsSG7Jqt+I/QvlbryG9bLNsW8ylXKIpX9nB7gepMXFmQgF0aom+aWm6y26UN76/G9gGBeY4lPLejj/Pwo5YH4D6Ato6DGMl9WN0IPq3BmFuJtPzwGBODjGSRib/5HmeBU/XoF+uNfNzPelJ1y4vF6JVJbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBAewQa2CTW3gMnqmlFiO8aTd3s92QCQbO4MjksvPTU=;
 b=LIEhmZA6KFQ3V34Y6Y658Q5sJ2Z2jUYSMyjQ+Yx1gDz2D4eQt10BzdjV1lW8ESQ//E0LhxFWhJuBjwSv2cuurkhxDowkUlj+o8RVJiccRL4MLjk5z2K620n/WjWCM+39LUtdT1/1APRY31VlbPOxRi0qaztG/h1MFs7Hf7YdjuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1292.namprd12.prod.outlook.com (2603:10b6:3:73::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Thu, 5 May 2022 13:23:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 13:23:27 +0000
Message-ID: <aec08997-9565-a596-f143-eccf92653a84@amd.com>
Date: Thu, 5 May 2022 15:23:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/amdgpu: Fix multiple GPU resets in XGMI hive.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20220504161841.24669-1-andrey.grodzovsky@amd.com>
 <7e9f45be-41a0-0764-8f4d-2787319477fb@amd.com>
 <80f0a3d8-5b42-f1b3-5396-464c665361c7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <80f0a3d8-5b42-f1b3-5396-464c665361c7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb27c535-6c41-41d0-22f3-08da2e9a701c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1292:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB129219051C6EA0F2BD13A38883C29@DM5PR12MB1292.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zxdxmMPz0ad/gx2MgwnsLHYvwU4pFIcSHKlAUBf8kjI2z8rM/OB/CyoqEyheC5QliOgVUm5j5EzCGFbYzXRtzleI/2J+TBhWQq3t7FUuVQEk9zABRGle0iTFK9vYFmlgNAh4lgnD8SQHM4QyNXc6110NrO7L6zCM8i7GC9xQVvkQY08wWkqnnC7vp8T5bwiGsFyvE77oJ4HNMspC/c6BgI84iqVdOx4UxolsbKil7SiPhIv3C8iKyeuqkVwMsU3CyvLLPOSJQg7EjsjghXL/mi66XWgyKdpg0o64WDChl+5f9necZUm50BBT6HOfhv1mzxbUc7wKcPlGOzs9rWkmkXP/LUfuECqJHSEOIDbewWwTTgc1Zhl5ieTJia+qkUf3eVlOTBQ3c4Vj3mI7MNjAlsw2BEOE3DTxzKvuURcv+27srR/Ah+tAH4tAKr5DtJfiPvC7n0pJ7727bE5IhutZHI6iw8uGbh4OswwTSU1hiUVlHdHiNyoCTREdAa4CNdMDxhNWGfumykb+bEipOKEwAEwWv9QmzHTQCxqdwvBcGRuk1gRaY3riKaUGftp0ipcPjDCrHVsNZoHEdGZuIIWC+IrkXTzoNpP4C6cLWg00nsFsAVMrhhUzYpi9+5ksoyYKKlCOLBwKq6Nu6/1zfKXRO3nBX/SwLMQa0iuDXzojaEQ2Xt02fZP+uPf+t8rs52lLr77rWbe0its/hiMr2S9Ouw+QmpbUHBK8nAp8pg6DfY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(36756003)(30864003)(5660300002)(86362001)(66574015)(6486002)(316002)(8936002)(508600001)(26005)(186003)(31696002)(6506007)(53546011)(66946007)(2906002)(83380400001)(6512007)(6666004)(66556008)(66476007)(31686004)(4326008)(8676002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRpK1JZRFM5NUN2WFRWeXJOanVjTWNoMXp2d1h5Z05OVjRhTWpnZnJGbUlK?=
 =?utf-8?B?ckR6OUZNZGN0aTVDdnN3eUdraW0zYTlGd3pza1hqd2VTVHNLak4xK1NNODFJ?=
 =?utf-8?B?TU8raEVha2U2Q2pEWDhVb01kUmp5WnVxWmlQSkxVRFVaM3RybjhlWjhkOHc3?=
 =?utf-8?B?M2Y4azQyWlNndjl3bWVjZW8rOWYyR2s0bTl1REh3UUFTSGltdmxCeDd1VzBP?=
 =?utf-8?B?WU8zc3hKWUs1TGhRaG5HK2pMdCtpV1pLVmZkQzNnN1pYV0RqeEpVVlBTU2VV?=
 =?utf-8?B?dWRLUGxsdEZXRVlXWTV1Z1NhT0NoMC9tZmJBUHJUdlVsTktLc1BTRFRzWGk3?=
 =?utf-8?B?ZWEvTkEvUysvZEw4VUFHTnhzZXZJRWRCeWRMUkNJVGE5djlsSWVGV0dMVzRI?=
 =?utf-8?B?Sms4dkFmTEo5UWVsMnhZS2xiOU1jVTBTdExOT2RzQnZxTVBSU0xSSEFybXlw?=
 =?utf-8?B?Z21EeGM3MlhvTWhCZmZheDJkSTRSR096bWw4V2xQOEF5RVhTQVZ0Q1diVGhi?=
 =?utf-8?B?VkFnUzZrR1U0Tm5pY1QwalN1d3dCMThBdmY2SklRRFI3L0szVFZ2Z2Y2ck5s?=
 =?utf-8?B?UzBPM0dONVV5WGtTVHRUOWIzYmUzbldQaTBuSFFBLzFaajNkcy9QOGhUTFJN?=
 =?utf-8?B?YmFieFpoMGMxb2JPVldUMWsvY1pNditMVUtLb29oUWxQWVZkeUxYL1l5bUZ0?=
 =?utf-8?B?ODgrUnVJMytWSEliVEsyTlNDL2xWZVN4US96V2R1MHFydXRUS0J0elJvZ0wv?=
 =?utf-8?B?aFEzc0NoWnQ4Szc0cnN2dTJoZHBBdFpZYzMvbmJncXVsdVZPQlFaU01kY3dl?=
 =?utf-8?B?bEtVZlN6ZTF0cnJBVllHTldxNDEwbmwvYXgxV0Zxb0xKaEZVSm51SktoMk1R?=
 =?utf-8?B?R2p0VUNOWVVxWm8yeUFQOUdCOHUzakozREhrNFFiUC8ya0kzVjZhN0I5SFln?=
 =?utf-8?B?OHVtVmxtUzA2K3M2cVZsalU1UEpaYmw0RGZFRlhiR1pFY1R1OUxWV3l0ZnNp?=
 =?utf-8?B?L09yTUVmU1U4d3lqQXc5MWVGS2poU0t2OFhiMHV2YXZ2OU1PQkxVTVlvSjdr?=
 =?utf-8?B?OVdPNDdmQkV6a3NHbUhmOXFmdUZkVEUzWTc4ODBacTJtRlZURWZnRDdycjZk?=
 =?utf-8?B?Q2RuNjRPeXBQZDE2Q3ZtSk1GbW5zYjFGQms2eG1OMUFXdjFHbzd6WU1rOWNT?=
 =?utf-8?B?K2dxeWV3ZFVrbkVGaWF1dWVFSTMwa2tnQUd4a0pWdE00QWhFRmJXeUo4T21t?=
 =?utf-8?B?ZXZsdEU5MGhkallSOWJBMW5ad2NJRE1ZdVV6MTNrKzdoY0dFOEl6bjFsNUta?=
 =?utf-8?B?RXJseUhRdEtJVUlybk9Ec2wxaWNSYVh6OWVkNFlYNjJBKzN5dlI2ZlpkZm5z?=
 =?utf-8?B?eU1RVTk0aTdIUGlidmdvNmh5UDJ6OWlrb2FrYWJRc01GQ3IwOXFhVkRybXoz?=
 =?utf-8?B?aVQ5M1d5WHYwbjBuRkhaRE1aL0JUSEh0QmF1UlNzSmJvNVc5Y21qaWNUR1kr?=
 =?utf-8?B?MkV2SGNKN3BOSHZlVnlCWmhYREdNeWdFQ3dMZHByK05PZnBERU8xemJlTEZT?=
 =?utf-8?B?aDdidElRTXFFMllpdVdpSDQ5RGF5cGIxcWZTZXB4d0R6bGcxc3M5b2EwQm9O?=
 =?utf-8?B?K2NYUEtjdlRQaEZFd0pWOS9YeUxEc0JRSk12dHVSVFN6QWwrU240cVFHeVdU?=
 =?utf-8?B?UXRnY1U5VlBVYncxVTBKTmhvL2VvdHhVYzB2SjExZittM2dBeUJDbkJUc2Yx?=
 =?utf-8?B?Q0hLbmJrTnI1NVhFMHdUYkhKdWEreFlMMWtRUHBJSTRWcnV3K3ozbFhlbVZ3?=
 =?utf-8?B?bExFdDVoaVRnamJIK0p4bWMzeVJ1dmdKWlo4b3NGOW91MENkcEN4ekdaWVFD?=
 =?utf-8?B?Z05JTnQ2RTlWVXg3aWZRQ0E5UGVtamZvdWdPTTMwWVVLTGZSVmZHbG5pWVU0?=
 =?utf-8?B?bjNJSHNOL05ad1htV3lJekFCMmZIaGU4WHd4V05jT2llT0JnK09BYWp3bm9R?=
 =?utf-8?B?Wm94SDI3WXNQaVZEL09BRVpsTnhKOVV0bnJQeGhOVGFJQXFsbHVOUFVQMkNy?=
 =?utf-8?B?eVlpa2t0T05tVjZ5cWZiRE04akh6aTNMaVErbmtmUzUvUDUwbCtIY3FlMFZQ?=
 =?utf-8?B?YXNDMlhlMk5SSFNwKzVVWHpSbHBoZlNkZjlqVjdKM0c1T3FYT3lNQWk1Wko5?=
 =?utf-8?B?bTA1OXZjdHNjb1B3cHAya0k0RkZxaWMrM3ZyREhTUzIzU0w0TmhIRWJWMDht?=
 =?utf-8?B?MmU2OUFNOUhRZzFMVlI5VUVVS2tkbndCK0p4bVl3eXQvb3BKYUdGamJHTXBL?=
 =?utf-8?B?M0hkdHViSk0xQmdkK1ZLdUhWckZnMWsweHRxZzYyWmdnWU9hRllCZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb27c535-6c41-41d0-22f3-08da2e9a701c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 13:23:27.0673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqLITUmUY/dz7DtzN0yTrtFiFTsdgTXdtUE0h5Z6dWx2JHBJ8DQjAil4lL2asSRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
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
Cc: Bai Zoy <Zoy.Bai@amd.com>, lijo.lazar@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 05.05.22 um 15:15 schrieb Andrey Grodzovsky:
> On 2022-05-05 06:09, Christian König wrote:
>
>> Am 04.05.22 um 18:18 schrieb Andrey Grodzovsky:
>>> Problem:
>>> During hive reset caused by command timing out on a ring
>>> extra resets are generated by triggered by KFD which is
>>> unable to accesses registers on the resetting ASIC.
>>>
>>> Fix: Rework GPU reset to use a list of pending reset jobs
>>> such that the first reset jobs that actaully resets the entire
>>> reset domain will cancel all those pending redundant resets.
>>>
>>> This is in line with what we already do for redundant TDRs
>>> in scheduler code.
>>
>> Mhm, why exactly do you need the extra linked list then?
>>
>> Let's talk about that on our call today.
>
>
> Going to miss it as you know, and also this is the place to discuss 
> technical questions anyway so -

Good point.

> It's needed because those other resets are not time out handlers that 
> are governed by the scheduler
> but rather external resets that are triggered by such clients as KFD, 
> RAS and sysfs. Scheduler has no
> knowledge of them (and should not have) but they are serialized into 
> same wq as the TO handlers
> from the scheduler. It just happens that TO triggered reset causes in 
> turn another reset (from KFD in
> this case) and we want to prevent this second reset from taking place 
> just as we want to avoid multiple
> TO resets to take place in scheduler code.

Yeah, but why do you need multiple workers?

You have a single worker for the GPU reset not triggered by the 
scheduler in you adev and cancel that at the end of the reset procedure.

If anybody things it needs to trigger another reset while in reset 
(which is actually a small design bug separately) the reset will just be 
canceled in the same way we cancel the scheduler resets.

Christian.

>
> Andrey
>
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Tested-by: Bai Zoy <Zoy.Bai@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 11 +---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 +++--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  |  3 +
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 73 
>>> +++++++++++++++++++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h   |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  7 ++-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  7 ++-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  7 ++-
>>>   8 files changed, 104 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 4264abc5604d..99efd8317547 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -109,6 +109,7 @@
>>>   #include "amdgpu_fdinfo.h"
>>>   #include "amdgpu_mca.h"
>>>   #include "amdgpu_ras.h"
>>> +#include "amdgpu_reset.h"
>>>     #define MAX_GPU_INSTANCE        16
>>>   @@ -509,16 +510,6 @@ struct amdgpu_allowed_register_entry {
>>>       bool grbm_indexed;
>>>   };
>>>   -enum amd_reset_method {
>>> -    AMD_RESET_METHOD_NONE = -1,
>>> -    AMD_RESET_METHOD_LEGACY = 0,
>>> -    AMD_RESET_METHOD_MODE0,
>>> -    AMD_RESET_METHOD_MODE1,
>>> -    AMD_RESET_METHOD_MODE2,
>>> -    AMD_RESET_METHOD_BACO,
>>> -    AMD_RESET_METHOD_PCI,
>>> -};
>>> -
>>>   struct amdgpu_video_codec_info {
>>>       u32 codec_type;
>>>       u32 max_width;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index e582f1044c0f..7fa82269c30f 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5201,6 +5201,12 @@ int amdgpu_device_gpu_recover_imp(struct 
>>> amdgpu_device *adev,
>>>       }
>>>         tmp_vram_lost_counter = 
>>> atomic_read(&((adev)->vram_lost_counter));
>>> +
>>> +    /* Drop all pending resets since we will reset now anyway */
>>> +    tmp_adev = list_first_entry(device_list_handle, struct 
>>> amdgpu_device,
>>> +                        reset_list);
>>> +    amdgpu_reset_pending_list(tmp_adev->reset_domain);
>>> +
>>>       /* Actual ASIC resets if needed.*/
>>>       /* Host driver will handle XGMI hive reset for SRIOV */
>>>       if (amdgpu_sriov_vf(adev)) {
>>> @@ -5296,7 +5302,7 @@ int amdgpu_device_gpu_recover_imp(struct 
>>> amdgpu_device *adev,
>>>   }
>>>     struct amdgpu_recover_work_struct {
>>> -    struct work_struct base;
>>> +    struct amdgpu_reset_work_struct base;
>>>       struct amdgpu_device *adev;
>>>       struct amdgpu_job *job;
>>>       int ret;
>>> @@ -5304,7 +5310,7 @@ struct amdgpu_recover_work_struct {
>>>     static void amdgpu_device_queue_gpu_recover_work(struct 
>>> work_struct *work)
>>>   {
>>> -    struct amdgpu_recover_work_struct *recover_work = 
>>> container_of(work, struct amdgpu_recover_work_struct, base);
>>> +    struct amdgpu_recover_work_struct *recover_work = 
>>> container_of(work, struct amdgpu_recover_work_struct, base.base.work);
>>>         recover_work->ret = 
>>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>>>   }
>>> @@ -5316,12 +5322,15 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>   {
>>>       struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>>> job};
>>>   -    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>> +    INIT_DELAYED_WORK(&work.base.base, 
>>> amdgpu_device_queue_gpu_recover_work);
>>> +    INIT_LIST_HEAD(&work.base.node);
>>>         if (!amdgpu_reset_domain_schedule(adev->reset_domain, 
>>> &work.base))
>>>           return -EAGAIN;
>>>   -    flush_work(&work.base);
>>> +    flush_delayed_work(&work.base.base);
>>> +
>>> + amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>> &work.base);
>>>         return work.ret;
>>>   }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index c80af0889773..ffddd419c351 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -134,6 +134,9 @@ struct amdgpu_reset_domain 
>>> *amdgpu_reset_create_reset_domain(enum amdgpu_reset_d
>>>       atomic_set(&reset_domain->in_gpu_reset, 0);
>>>       init_rwsem(&reset_domain->sem);
>>>   +    INIT_LIST_HEAD(&reset_domain->pending_works);
>>> +    mutex_init(&reset_domain->reset_lock);
>>> +
>>>       return reset_domain;
>>>   }
>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> index 1949dbe28a86..863ec5720fc1 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> @@ -24,7 +24,18 @@
>>>   #ifndef __AMDGPU_RESET_H__
>>>   #define __AMDGPU_RESET_H__
>>>   -#include "amdgpu.h"
>>> +
>>> +#include <linux/atomic.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/list.h>
>>> +#include <linux/kref.h>
>>> +#include <linux/rwsem.h>
>>> +#include <linux/workqueue.h>
>>> +
>>> +struct amdgpu_device;
>>> +struct amdgpu_job;
>>> +struct amdgpu_hive_info;
>>> +
>>>     enum AMDGPU_RESET_FLAGS {
>>>   @@ -32,6 +43,17 @@ enum AMDGPU_RESET_FLAGS {
>>>       AMDGPU_SKIP_HW_RESET = 1,
>>>   };
>>>   +
>>> +enum amd_reset_method {
>>> +    AMD_RESET_METHOD_NONE = -1,
>>> +    AMD_RESET_METHOD_LEGACY = 0,
>>> +    AMD_RESET_METHOD_MODE0,
>>> +    AMD_RESET_METHOD_MODE1,
>>> +    AMD_RESET_METHOD_MODE2,
>>> +    AMD_RESET_METHOD_BACO,
>>> +    AMD_RESET_METHOD_PCI,
>>> +};
>>> +
>>>   struct amdgpu_reset_context {
>>>       enum amd_reset_method method;
>>>       struct amdgpu_device *reset_req_dev;
>>> @@ -40,6 +62,8 @@ struct amdgpu_reset_context {
>>>       unsigned long flags;
>>>   };
>>>   +struct amdgpu_reset_control;
>>> +
>>>   struct amdgpu_reset_handler {
>>>       enum amd_reset_method reset_method;
>>>       struct list_head handler_list;
>>> @@ -76,12 +100,21 @@ enum amdgpu_reset_domain_type {
>>>       XGMI_HIVE
>>>   };
>>>   +
>>> +struct amdgpu_reset_work_struct {
>>> +    struct delayed_work base;
>>> +    struct list_head node;
>>> +};
>>> +
>>>   struct amdgpu_reset_domain {
>>>       struct kref refcount;
>>>       struct workqueue_struct *wq;
>>>       enum amdgpu_reset_domain_type type;
>>>       struct rw_semaphore sem;
>>>       atomic_t in_gpu_reset;
>>> +
>>> +    struct list_head pending_works;
>>> +    struct mutex reset_lock;
>>>   };
>>>     @@ -113,9 +146,43 @@ static inline void 
>>> amdgpu_reset_put_reset_domain(struct amdgpu_reset_domain *dom
>>>   }
>>>     static inline bool amdgpu_reset_domain_schedule(struct 
>>> amdgpu_reset_domain *domain,
>>> -                        struct work_struct *work)
>>> +                        struct amdgpu_reset_work_struct *work)
>>>   {
>>> -    return queue_work(domain->wq, work);
>>> +    mutex_lock(&domain->reset_lock);
>>> +
>>> +    if (!queue_delayed_work(domain->wq, &work->base, 0)) {
>>> +        mutex_unlock(&domain->reset_lock);
>>> +        return false;
>>> +    }
>>> +
>>> +    list_add_tail(&work->node, &domain->pending_works);
>>> +    mutex_unlock(&domain->reset_lock);
>>> +
>>> +    return true;
>>> +}
>>> +
>>> +static inline void amdgpu_reset_domain_del_pendning_work(struct 
>>> amdgpu_reset_domain *domain,
>>> +                  struct amdgpu_reset_work_struct *work)
>>> +{
>>> +    mutex_lock(&domain->reset_lock);
>>> +    list_del_init(&work->node);
>>> +    mutex_unlock(&domain->reset_lock);
>>> +}
>>> +
>>> +static inline void amdgpu_reset_pending_list(struct 
>>> amdgpu_reset_domain *domain)
>>> +{
>>> +    struct amdgpu_reset_work_struct *entry, *tmp;
>>> +
>>> +    mutex_lock(&domain->reset_lock);
>>> +    list_for_each_entry_safe(entry, tmp, &domain->pending_works, 
>>> node) {
>>> +
>>> +        list_del_init(&entry->node);
>>> +
>>> +        /* Stop any other related pending resets */
>>> +        cancel_delayed_work(&entry->base);
>>> +    }
>>> +
>>> +    mutex_unlock(&domain->reset_lock);
>>>   }
>>>     void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain 
>>> *reset_domain);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>> index 239f232f9c02..574e870d3064 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>> @@ -25,6 +25,7 @@
>>>   #define AMDGPU_VIRT_H
>>>     #include "amdgv_sriovmsg.h"
>>> +#include "amdgpu_reset.h"
>>>     #define AMDGPU_SRIOV_CAPS_SRIOV_VBIOS  (1 << 0) /* vBIOS is 
>>> sr-iov ready */
>>>   #define AMDGPU_SRIOV_CAPS_ENABLE_IOV   (1 << 1) /* sr-iov is 
>>> enabled on this GPU */
>>> @@ -230,7 +231,7 @@ struct amdgpu_virt {
>>>       uint32_t            reg_val_offs;
>>>       struct amdgpu_irq_src        ack_irq;
>>>       struct amdgpu_irq_src        rcv_irq;
>>> -    struct work_struct        flr_work;
>>> +    struct amdgpu_reset_work_struct flr_work;
>>>       struct amdgpu_mm_table        mm_table;
>>>       const struct amdgpu_virt_ops    *ops;
>>>       struct amdgpu_vf_error_buffer    vf_errors;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> index b81acf59870c..f3d1c2be9292 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> @@ -251,7 +251,7 @@ static int xgpu_ai_set_mailbox_ack_irq(struct 
>>> amdgpu_device *adev,
>>>     static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>>>   {
>>> -    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work);
>>> +    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work.base.work);
>>>       struct amdgpu_device *adev = container_of(virt, struct 
>>> amdgpu_device, virt);
>>>       int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>   @@ -380,7 +380,8 @@ int xgpu_ai_mailbox_get_irq(struct 
>>> amdgpu_device *adev)
>>>           return r;
>>>       }
>>>   -    INIT_WORK(&adev->virt.flr_work, xgpu_ai_mailbox_flr_work);
>>> +    INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>> xgpu_ai_mailbox_flr_work);
>>> +    INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>         return 0;
>>>   }
>>> @@ -389,6 +390,8 @@ void xgpu_ai_mailbox_put_irq(struct 
>>> amdgpu_device *adev)
>>>   {
>>>       amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>       amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>> +
>>> + amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>> &adev->virt.flr_work);
>>>   }
>>>     static int xgpu_ai_request_init_data(struct amdgpu_device *adev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> index 22c10b97ea81..927b3d5bb1d0 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> @@ -275,7 +275,7 @@ static int xgpu_nv_set_mailbox_ack_irq(struct 
>>> amdgpu_device *adev,
>>>     static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>>>   {
>>> -    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work);
>>> +    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work.base.work);
>>>       struct amdgpu_device *adev = container_of(virt, struct 
>>> amdgpu_device, virt);
>>>       int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>   @@ -407,7 +407,8 @@ int xgpu_nv_mailbox_get_irq(struct 
>>> amdgpu_device *adev)
>>>           return r;
>>>       }
>>>   -    INIT_WORK(&adev->virt.flr_work, xgpu_nv_mailbox_flr_work);
>>> +    INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>> xgpu_nv_mailbox_flr_work);
>>> +    INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>         return 0;
>>>   }
>>> @@ -416,6 +417,8 @@ void xgpu_nv_mailbox_put_irq(struct 
>>> amdgpu_device *adev)
>>>   {
>>>       amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>       amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>> +
>>> + amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>> &adev->virt.flr_work);
>>>   }
>>>     const struct amdgpu_virt_ops xgpu_nv_virt_ops = {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> index 7b63d30b9b79..1d4ef5c70730 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> @@ -512,7 +512,7 @@ static int xgpu_vi_set_mailbox_ack_irq(struct 
>>> amdgpu_device *adev,
>>>     static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
>>>   {
>>> -    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work);
>>> +    struct amdgpu_virt *virt = container_of(work, struct 
>>> amdgpu_virt, flr_work.base.work);
>>>       struct amdgpu_device *adev = container_of(virt, struct 
>>> amdgpu_device, virt);
>>>         /* wait until RCV_MSG become 3 */
>>> @@ -610,7 +610,8 @@ int xgpu_vi_mailbox_get_irq(struct amdgpu_device 
>>> *adev)
>>>           return r;
>>>       }
>>>   -    INIT_WORK(&adev->virt.flr_work, xgpu_vi_mailbox_flr_work);
>>> +    INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>> xgpu_vi_mailbox_flr_work);
>>> +    INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>         return 0;
>>>   }
>>> @@ -619,6 +620,8 @@ void xgpu_vi_mailbox_put_irq(struct 
>>> amdgpu_device *adev)
>>>   {
>>>       amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>       amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>> +
>>> + amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>> &adev->virt.flr_work);
>>>   }
>>>     const struct amdgpu_virt_ops xgpu_vi_virt_ops = {
>>

