Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9E4648EF
	for <lists+amd-gfx@lfdr.de>; Wed,  1 Dec 2021 08:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836B96EB86;
	Wed,  1 Dec 2021 07:37:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0C6EB83
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Dec 2021 07:37:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRvAycqCkod20lrJLKa/m9SoIunqAL4vlxdmg06MOGUstJcfZn3NUaN/uGE70zGgDZGSwhkdilewZHF3qjWwyJmzWapdEBd7myUd2u6Byl3xBGIbDIPHjjSjhMVgYcG2dCR4AUuNEGhjefSvmb6mQTyLwAm7hJde5TIWjzFK/hLMFMHqiVH7SF7vtQ5DM0cJuOEISZ+2NDNDsWZcQ5JeopKRDtQTJRovUyMGsHX5CV765fEYMzzKFfRDEZxN7ANywYjJsqIeklvmGqZwiDaZQg/Rds4e+VsISQE2KbM2dLKQRPA5raNoFPn61fQNSyhUvNWkqB9K+R9WGgQeJg6rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efi3hdrDQl0eCJcmrmjbsKqXRhHRqI/WKnYa39iKZzo=;
 b=J76BpFDAx7n3CeZPI7S+53vfsVsCf0gnJbRzWng4o5zAt2fCJCf63AYnQSQFShGsKb/it00FbGHbgvLO5Uigg9Qh0cu41qD8I24+950PTUEFljb7zZeHUdb4H0lqI0UDst+q7zU50NcR9yJPtc00tSYXnRS47c49v6x5GNZs5Zp1IJYGxrlq8cTyMU6pArqELVW4qznDPn2VZj6pjIqNh3aRHuFNZSmIi7X8eK+ZWHMfBrMB191u5DcXtCZHz1KrZjexCOnbcu+HVAsLJJu3Tr8nSgWUQ/USPr44q7lGoFgq9dmn+hptSdQX5Mwws0kdQfC9zRSonyXxEpixFQnT6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efi3hdrDQl0eCJcmrmjbsKqXRhHRqI/WKnYa39iKZzo=;
 b=jSrwc4jaoDodlHBhtbmgkElKEbBxXuVbkUKtppNGLB08Bbx70I9P3XYByTfBU+IkZx5sQhizFJXXG3AcQzyh5DqI+KDrSVtAMHw2DhFhJOzP3+GTLQZoPZf862QUzBpmZkoNImRl19++PtFNIv3LoDnaGZCjTXMretm/WdtYdQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3930.namprd12.prod.outlook.com (2603:10b6:5:1c9::19)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 07:37:10 +0000
Received: from DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::41ea:d7dc:f041:633c]) by DM6PR12MB3930.namprd12.prod.outlook.com
 ([fe80::41ea:d7dc:f041:633c%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 07:37:10 +0000
Message-ID: <df8b16d6-891b-88fc-c6cf-c50d3358c8fd@amd.com>
Date: Wed, 1 Dec 2021 13:06:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH V2 07/17] drm/amd/pm: create a new holder for those APIs
 used only by legacy ASICs(si/kv)
Content-Language: en-US
To: "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211130074259.1271965-1-evan.quan@amd.com>
 <20211130074259.1271965-8-evan.quan@amd.com>
 <ec62e7b6-fe58-36a6-0350-e316be08bd64@amd.com>
 <DM6PR12MB2619301E194B0222FE5AC881E4689@DM6PR12MB2619.namprd12.prod.outlook.com>
 <ffe792f8-f43e-86b0-c9f2-2fda3f5fb73a@amd.com>
 <DM6PR12MB2619B32FC808CC9EA5EFCD9EE4689@DM6PR12MB2619.namprd12.prod.outlook.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <DM6PR12MB2619B32FC808CC9EA5EFCD9EE4689@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To DM6PR12MB3930.namprd12.prod.outlook.com
 (2603:10b6:5:1c9::19)
MIME-Version: 1.0
Received: from [10.252.81.250] (165.204.159.242) by
 PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:27::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Wed, 1 Dec 2021 07:37:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 043333c7-7e6d-463b-b2e1-08d9b49d6154
X-MS-TrafficTypeDiagnostic: DM6PR12MB4973:
X-Microsoft-Antispam-PRVS: <DM6PR12MB49736B32B64DDFBF480C0A6997689@DM6PR12MB4973.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K6DVG9b420eGGIHCU0Xwta74nPujSjBhhhepNqIEErmcx2iFPlTcU9cThy4BYPpswjz+C+GAAwougtVpVtd0k6WuRg2IHoLW+PyhP7cVBNkaCBqfRZW+Hflzy8+jgFFVue248Sa/qLEbAbsON+c5R7E8UmiuBTI5t83WX2/FvzB2f7LrVaa0AUjaxRNILgpe6QGmvCDWI4iq2tETHfOXW3+k9ChLPT/WcKqjywgXob97aLS0s2C+DT5qCbApDcYMvkiEPrxV40lhgEJdzWsEyw4ypfhDDKgjyAXo2rKCOv7KSyMnuocAHfXc5/2rDZ6bl/yH3WreS3emH8jS93rWcPZnUNXCgz0xhNA/770o1t0r8r9gKuZnCktG0i5wtK4viJSEO9Ox8D8W0i4NY53fLizWqbji97WwLQYHuztnDZWq1Bfpzu1v+mGFMqxWYG/GLjfEAdIMdbYN2TlarbQ52k2G0Ffb8Wz6KKjfFpghLVm3JAOBQh/jpC2MWqPc2aHbYyyxKswfmpRPHdc7tmKfuoHcpvxkjAdSz5XR2robO72A4f99cwHYr7dKsEdo852vpSmKwGY1CfSpxIn752FvvdTAdjSXFBV0y+oihADrfKf0z8UOfGq8qOwOpeBR4M0eLmkbIU6A+EYOBEo3568DZJNZ6GTx+17rfV0twO/LdVOGpEx4N20EaZiW370pkAC1FXW2jcoFZWw2OiXzSk3nHIXWPlmYhf1LcTGiv/oXlj45HMDTmWxYookqqrVpYD9A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3930.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(36756003)(54906003)(30864003)(110136005)(4326008)(66946007)(8676002)(53546011)(31696002)(2616005)(316002)(31686004)(19627235002)(508600001)(38100700002)(6666004)(16576012)(26005)(6486002)(5660300002)(2906002)(83380400001)(86362001)(956004)(186003)(8936002)(43740500002)(45980500001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3lhbWhYUkRCTGFqeTBSak5HTzkrL1p2b3YzQm5TamRYeElxWE5zZld4N0Nq?=
 =?utf-8?B?MTdYL2U1MnAzYkJleGhaWlVqY2RjOUZtOGxHZm9xR0hEVysrVGxrTUgvVTF5?=
 =?utf-8?B?cmpNUy9wZU9QQW5GeG5iL2wwc1lxQVhmWjlWQ3BBT2pjL05YajZ1YTU0bVFL?=
 =?utf-8?B?NEdhcnNOcTJ2aHJjSmdPVENLc3plemlYWklxczVmbnFSOXZSSFJkdnZRWHMv?=
 =?utf-8?B?UFpCdEoxMW5tZ1JmYlVNYUtCU0FIQUlCc2NOTDcybGtFZVZSVm5wVUF4WThM?=
 =?utf-8?B?TUxwTVBCb3R0bHUwdGVLZjloeVN6VmxNRkhGemEzRzJUY204cDNPNUM3SzFa?=
 =?utf-8?B?ZXNZQ3oxNlBjbXNhQ3VvMG1aTzF3amZhY1pVUzY3ZWxSb3ZjcDIrRHc0SmdM?=
 =?utf-8?B?TE5yYTNmMjVrTlExRldCUUFiTnhqNHdLaFp3S2FGbExzN28xZllBRWgzaDBO?=
 =?utf-8?B?ZGsyaEJNdkl1SDdVc1VDdm9DMStrNjlHanF0WEtvUHNGME5oNkZlMkRCcC85?=
 =?utf-8?B?N0tyaUZEYUN3RllNY2lOaHUrSkk0dFpCTmZOTzUyNmpNaElqdW9iYTdlSGg5?=
 =?utf-8?B?Z0F3d1VpOG15cEkraFV5cUJodFRpNWhnMWdiZTViOHlLWjN2WDhCTVV5VWlO?=
 =?utf-8?B?cjRYMXgyeTAvcHNtTTRoSHVBK3pmWE1DRmpWbkFVR2UrRzVyeTRSaVBGNVNW?=
 =?utf-8?B?TTkvaVNQTWZ4S2Vka2lyL1JCSGtKcnl4NGJiTndYMVJsdVRYR0syOFlaaEdE?=
 =?utf-8?B?NmxKUGxmYkZNTkE4TDdGdnQ5R1IrRFRoelN5RFVybkdyaXJRU0QrenBIYUNL?=
 =?utf-8?B?RE9YcXgvVlA5cDBFaWIzWmx5c1phQ0pEeGxqSG5BeGVjREQ3N1UrZy8yTHpX?=
 =?utf-8?B?RWZ1dG9DdnFaY1A4WlVNUzVwOVRURTBVeUZJUElaSndDMkFxeXBLSmFGYk9m?=
 =?utf-8?B?a3B5eUdPeWU2YnhHTlBLMWkxeVQwVkhOc1FYdXFvU0d6ck1PRXNLR3RSUHF6?=
 =?utf-8?B?RVNkN0FBRG5oNVpqVWRhMFh1NFdCZkFhZWlaNFdBR1RzRWNRc1FNSW8vTkM3?=
 =?utf-8?B?ZWFRSE1WektINU5OTkpVZkU0WSt0cWdMWG9tYkxnM0FkTVpNQlRhd2lSQVBK?=
 =?utf-8?B?U0owVG1OSHJnTHhtOGNpNDRTc2xYazBGYXdxZnNGOWpMKzZ0RUJaTWRpc0Nu?=
 =?utf-8?B?OTA5N1lWUWIvbUQxYkF6SkJsbnNKMHhFcWFjUjZENlUzVUVwOThmU0lSMXdI?=
 =?utf-8?B?S0srQjZGQ3Mra1NTMjNnSFAycnB3eVlEc0UwUnVjam1jV0gwbnNKbHNMY2hl?=
 =?utf-8?B?Vk1BVzhCWjBWV0h4Yk82M01qdjNneW41VjFQWUR2ZE5IdGt6UGVtMVZZOE5w?=
 =?utf-8?B?NDVkcmJIWENJcStsZFBVYVk5Sk9rVlg1RzRIdlQ2cDhIaWN0WU9CYUJHbDlF?=
 =?utf-8?B?emY3N2ZYQ3BWYWJ1UDFaK1E0d1dIRkpZaUxPREtlNkg0SkgzSzQvU2ZnZTlz?=
 =?utf-8?B?QU5iU3Vlc294Mm4wa28rSGlHSFpKckF5SFlLWGpvMXB0QzgwbEZ0bkpGekFm?=
 =?utf-8?B?NU8ycnFnUlFZQWxJUTVKbEVSb3NWU2xURVdBY3JQd21HS2JkbEhuWk1nNExD?=
 =?utf-8?B?a0xKVzNXK2NhemRkc25KL2RHazl0ZW9KelZsOUFFSGpCL3VmMCtxdzR1WllP?=
 =?utf-8?B?VGpnWkFXUWVQa1pUZUpQQXBIbDFvOEpkVEY2eEFobVN1ejJIYVRwTVlHYjYx?=
 =?utf-8?B?Zk1qdnErR01JYjZzSUYrK3o4K2RQV3NZZDNncWtJSktNa1BlTEkzVSs0OW42?=
 =?utf-8?B?M1RqL0N6NkZmRVpSdys4VDIxWE9TYXdKcStnd3RqdThYakQ5ejlpYklkUktr?=
 =?utf-8?B?SFRkdGF5cllLU2ZiNE96WWJIRjRUOVQxMUdrKzAwcnpiYnU2MUZlSWhJU3BE?=
 =?utf-8?B?NkgvYkNpQy9yczFkM2dDN1JXTHRVS1hXRGNxUVQyVG90WlBGSjhubWU5YnJx?=
 =?utf-8?B?cG5jZVJiRzVwTThWTkYwVVJrWmYvVjNkS0ZLQmUvV0xiSDZ3ZzYwMFRubHFh?=
 =?utf-8?B?eVpKTmlVUHZ6elBhd3lxNXFjZC8xNDhTZFFRUytpZHBtUnVWN3FXeFdFQWVp?=
 =?utf-8?Q?keew=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043333c7-7e6d-463b-b2e1-08d9b49d6154
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3930.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 07:37:10.2881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Hg9Hsq/8UfNa6SFK0J27PdKV9YGjL2faG2YotbI4g1R1gXKuM03isqZfQLKuTg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On 12/1/2021 12:47 PM, Quan, Evan wrote:
> [AMD Official Use Only]
> 
> 
> 
>> -----Original Message-----
>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>> Sent: Wednesday, December 1, 2021 12:19 PM
>> To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
>> Subject: Re: [PATCH V2 07/17] drm/amd/pm: create a new holder for those
>> APIs used only by legacy ASICs(si/kv)
>>
>>
>>
>> On 12/1/2021 8:43 AM, Quan, Evan wrote:
>>> [AMD Official Use Only]
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>>>> Sent: Tuesday, November 30, 2021 9:21 PM
>>>> To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
>> Christian
>>>> <Christian.Koenig@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
>>>> Subject: Re: [PATCH V2 07/17] drm/amd/pm: create a new holder for
>> those
>>>> APIs used only by legacy ASICs(si/kv)
>>>>
>>>>
>>>>
>>>> On 11/30/2021 1:12 PM, Evan Quan wrote:
>>>>> Those APIs are used only by legacy ASICs(si/kv). They cannot be
>>>>> shared by other ASICs. So, we create a new holder for them.
>>>>>
>>>>> Signed-off-by: Evan Quan <evan.quan@amd.com>
>>>>> Change-Id: I555dfa37e783a267b1d3b3a7db5c87fcc3f1556f
>>>>> --
>>>>> v1->v2:
>>>>>      - move other APIs used by si/kv in amdgpu_atombios.c to the new
>>>>>        holder also(Alex)
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  421 -----
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h  |   30 -
>>>>>     .../gpu/drm/amd/include/kgd_pp_interface.h    |    1 +
>>>>>     drivers/gpu/drm/amd/pm/amdgpu_dpm.c           | 1008 +-----------
>>>>>     drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |   15 -
>>>>>     drivers/gpu/drm/amd/pm/powerplay/Makefile     |    2 +-
>>>>>     drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c     |    2 +
>>>>>     drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c | 1453
>>>> +++++++++++++++++
>>>>>     drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h |   70 +
>>>>>     drivers/gpu/drm/amd/pm/powerplay/si_dpm.c     |    2 +
>>>>>     10 files changed, 1534 insertions(+), 1470 deletions(-)
>>>>>     create mode 100644
>> drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
>>>>>     create mode 100644
>> drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>>>> index 12a6b1c99c93..f2e447212e62 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
>>>>> @@ -1083,427 +1083,6 @@ int
>>>> amdgpu_atombios_get_clock_dividers(struct amdgpu_device *adev,
>>>>>     	return 0;
>>>>>     }
>>>>>
>>>>> -int amdgpu_atombios_get_memory_pll_dividers(struct
>> amdgpu_device
>>>> *adev,
>>>>> -					    u32 clock,
>>>>> -					    bool strobe_mode,
>>>>> -					    struct atom_mpll_param
>>>> *mpll_param)
>>>>> -{
>>>>> -	COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1 args;
>>>>> -	int index = GetIndexIntoMasterTable(COMMAND,
>>>> ComputeMemoryClockParam);
>>>>> -	u8 frev, crev;
>>>>> -
>>>>> -	memset(&args, 0, sizeof(args));
>>>>> -	memset(mpll_param, 0, sizeof(struct atom_mpll_param));
>>>>> -
>>>>> -	if (!amdgpu_atom_parse_cmd_header(adev-
>>>>> mode_info.atom_context, index, &frev, &crev))
>>>>> -		return -EINVAL;
>>>>> -
>>>>> -	switch (frev) {
>>>>> -	case 2:
>>>>> -		switch (crev) {
>>>>> -		case 1:
>>>>> -			/* SI */
>>>>> -			args.ulClock = cpu_to_le32(clock);	/* 10 khz */
>>>>> -			args.ucInputFlag = 0;
>>>>> -			if (strobe_mode)
>>>>> -				args.ucInputFlag |=
>>>> MPLL_INPUT_FLAG_STROBE_MODE_EN;
>>>>> -
>>>>> -			amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> -
>>>>> -			mpll_param->clkfrac =
>>>> le16_to_cpu(args.ulFbDiv.usFbDivFrac);
>>>>> -			mpll_param->clkf =
>>>> le16_to_cpu(args.ulFbDiv.usFbDiv);
>>>>> -			mpll_param->post_div = args.ucPostDiv;
>>>>> -			mpll_param->dll_speed = args.ucDllSpeed;
>>>>> -			mpll_param->bwcntl = args.ucBWCntl;
>>>>> -			mpll_param->vco_mode =
>>>>> -				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_VCO_MODE_MASK);
>>>>> -			mpll_param->yclk_sel =
>>>>> -				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_BYPASS_DQ_PLL) ? 1 : 0;
>>>>> -			mpll_param->qdr =
>>>>> -				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_QDR_ENABLE) ? 1 : 0;
>>>>> -			mpll_param->half_rate =
>>>>> -				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_AD_HALF_RATE) ? 1 : 0;
>>>>> -			break;
>>>>> -		default:
>>>>> -			return -EINVAL;
>>>>> -		}
>>>>> -		break;
>>>>> -	default:
>>>>> -		return -EINVAL;
>>>>> -	}
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -void amdgpu_atombios_set_engine_dram_timings(struct
>> amdgpu_device
>>>> *adev,
>>>>> -					     u32 eng_clock, u32 mem_clock)
>>>>> -{
>>>>> -	SET_ENGINE_CLOCK_PS_ALLOCATION args;
>>>>> -	int index = GetIndexIntoMasterTable(COMMAND,
>>>> DynamicMemorySettings);
>>>>> -	u32 tmp;
>>>>> -
>>>>> -	memset(&args, 0, sizeof(args));
>>>>> -
>>>>> -	tmp = eng_clock & SET_CLOCK_FREQ_MASK;
>>>>> -	tmp |= (COMPUTE_ENGINE_PLL_PARAM << 24);
>>>>> -
>>>>> -	args.ulTargetEngineClock = cpu_to_le32(tmp);
>>>>> -	if (mem_clock)
>>>>> -		args.sReserved.ulClock = cpu_to_le32(mem_clock &
>>>> SET_CLOCK_FREQ_MASK);
>>>>> -
>>>>> -	amdgpu_atom_execute_table(adev->mode_info.atom_context,
>>>> index, (uint32_t *)&args);
>>>>> -}
>>>>> -
>>>>> -void amdgpu_atombios_get_default_voltages(struct amdgpu_device
>>>> *adev,
>>>>> -					  u16 *vddc, u16 *vddci, u16 *mvdd)
>>>>> -{
>>>>> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> -	int index = GetIndexIntoMasterTable(DATA, FirmwareInfo);
>>>>> -	u8 frev, crev;
>>>>> -	u16 data_offset;
>>>>> -	union firmware_info *firmware_info;
>>>>> -
>>>>> -	*vddc = 0;
>>>>> -	*vddci = 0;
>>>>> -	*mvdd = 0;
>>>>> -
>>>>> -	if (amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> -				   &frev, &crev, &data_offset)) {
>>>>> -		firmware_info =
>>>>> -			(union firmware_info *)(mode_info->atom_context-
>>>>> bios +
>>>>> -						data_offset);
>>>>> -		*vddc = le16_to_cpu(firmware_info-
>>>>> info_14.usBootUpVDDCVoltage);
>>>>> -		if ((frev == 2) && (crev >= 2)) {
>>>>> -			*vddci = le16_to_cpu(firmware_info-
>>>>> info_22.usBootUpVDDCIVoltage);
>>>>> -			*mvdd = le16_to_cpu(firmware_info-
>>>>> info_22.usBootUpMVDDCVoltage);
>>>>> -		}
>>>>> -	}
>>>>> -}
>>>>> -
>>>>> -union set_voltage {
>>>>> -	struct _SET_VOLTAGE_PS_ALLOCATION alloc;
>>>>> -	struct _SET_VOLTAGE_PARAMETERS v1;
>>>>> -	struct _SET_VOLTAGE_PARAMETERS_V2 v2;
>>>>> -	struct _SET_VOLTAGE_PARAMETERS_V1_3 v3;
>>>>> -};
>>>>> -
>>>>> -int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev, u8
>>>> voltage_type,
>>>>> -			     u16 voltage_id, u16 *voltage)
>>>>> -{
>>>>> -	union set_voltage args;
>>>>> -	int index = GetIndexIntoMasterTable(COMMAND, SetVoltage);
>>>>> -	u8 frev, crev;
>>>>> -
>>>>> -	if (!amdgpu_atom_parse_cmd_header(adev-
>>>>> mode_info.atom_context, index, &frev, &crev))
>>>>> -		return -EINVAL;
>>>>> -
>>>>> -	switch (crev) {
>>>>> -	case 1:
>>>>> -		return -EINVAL;
>>>>> -	case 2:
>>>>> -		args.v2.ucVoltageType =
>>>> SET_VOLTAGE_GET_MAX_VOLTAGE;
>>>>> -		args.v2.ucVoltageMode = 0;
>>>>> -		args.v2.usVoltageLevel = 0;
>>>>> -
>>>>> -		amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> -
>>>>> -		*voltage = le16_to_cpu(args.v2.usVoltageLevel);
>>>>> -		break;
>>>>> -	case 3:
>>>>> -		args.v3.ucVoltageType = voltage_type;
>>>>> -		args.v3.ucVoltageMode = ATOM_GET_VOLTAGE_LEVEL;
>>>>> -		args.v3.usVoltageLevel = cpu_to_le16(voltage_id);
>>>>> -
>>>>> -		amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> -
>>>>> -		*voltage = le16_to_cpu(args.v3.usVoltageLevel);
>>>>> -		break;
>>>>> -	default:
>>>>> -		DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
>>>>> -		return -EINVAL;
>>>>> -	}
>>>>> -
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -int
>> amdgpu_atombios_get_leakage_vddc_based_on_leakage_idx(struct
>>>> amdgpu_device *adev,
>>>>> -						      u16 *voltage,
>>>>> -						      u16 leakage_idx)
>>>>> -{
>>>>> -	return amdgpu_atombios_get_max_vddc(adev,
>>>> VOLTAGE_TYPE_VDDC, leakage_idx, voltage);
>>>>> -}
>>>>> -
>>>>> -union voltage_object_info {
>>>>> -	struct _ATOM_VOLTAGE_OBJECT_INFO v1;
>>>>> -	struct _ATOM_VOLTAGE_OBJECT_INFO_V2 v2;
>>>>> -	struct _ATOM_VOLTAGE_OBJECT_INFO_V3_1 v3;
>>>>> -};
>>>>> -
>>>>> -union voltage_object {
>>>>> -	struct _ATOM_VOLTAGE_OBJECT v1;
>>>>> -	struct _ATOM_VOLTAGE_OBJECT_V2 v2;
>>>>> -	union _ATOM_VOLTAGE_OBJECT_V3 v3;
>>>>> -};
>>>>> -
>>>>> -
>>>>> -static ATOM_VOLTAGE_OBJECT_V3
>>>>
>> *amdgpu_atombios_lookup_voltage_object_v3(ATOM_VOLTAGE_OBJECT_I
>>>> NFO_V3_1 *v3,
>>>>> -									u8
>>>> voltage_type, u8 voltage_mode)
>>>>> -{
>>>>> -	u32 size = le16_to_cpu(v3->sHeader.usStructureSize);
>>>>> -	u32 offset = offsetof(ATOM_VOLTAGE_OBJECT_INFO_V3_1,
>>>> asVoltageObj[0]);
>>>>> -	u8 *start = (u8 *)v3;
>>>>> -
>>>>> -	while (offset < size) {
>>>>> -		ATOM_VOLTAGE_OBJECT_V3 *vo =
>>>> (ATOM_VOLTAGE_OBJECT_V3 *)(start + offset);
>>>>> -		if ((vo->asGpioVoltageObj.sHeader.ucVoltageType ==
>>>> voltage_type) &&
>>>>> -		    (vo->asGpioVoltageObj.sHeader.ucVoltageMode ==
>>>> voltage_mode))
>>>>> -			return vo;
>>>>> -		offset += le16_to_cpu(vo-
>>>>> asGpioVoltageObj.sHeader.usSize);
>>>>> -	}
>>>>> -	return NULL;
>>>>> -}
>>>>> -
>>>>> -int amdgpu_atombios_get_svi2_info(struct amdgpu_device *adev,
>>>>> -			      u8 voltage_type,
>>>>> -			      u8 *svd_gpio_id, u8 *svc_gpio_id)
>>>>> -{
>>>>> -	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> -	u8 frev, crev;
>>>>> -	u16 data_offset, size;
>>>>> -	union voltage_object_info *voltage_info;
>>>>> -	union voltage_object *voltage_object = NULL;
>>>>> -
>>>>> -	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> -				   &frev, &crev, &data_offset)) {
>>>>> -		voltage_info = (union voltage_object_info *)
>>>>> -			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> -
>>>>> -		switch (frev) {
>>>>> -		case 3:
>>>>> -			switch (crev) {
>>>>> -			case 1:
>>>>> -				voltage_object = (union voltage_object *)
>>>>> -
>>>> 	amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> -
>>>> voltage_type,
>>>>> -
>>>> VOLTAGE_OBJ_SVID2);
>>>>> -				if (voltage_object) {
>>>>> -					*svd_gpio_id = voltage_object-
>>>>> v3.asSVID2Obj.ucSVDGpioId;
>>>>> -					*svc_gpio_id = voltage_object-
>>>>> v3.asSVID2Obj.ucSVCGpioId;
>>>>> -				} else {
>>>>> -					return -EINVAL;
>>>>> -				}
>>>>> -				break;
>>>>> -			default:
>>>>> -				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> -				return -EINVAL;
>>>>> -			}
>>>>> -			break;
>>>>> -		default:
>>>>> -			DRM_ERROR("unknown voltage object table\n");
>>>>> -			return -EINVAL;
>>>>> -		}
>>>>> -
>>>>> -	}
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -bool
>>>>> -amdgpu_atombios_is_voltage_gpio(struct amdgpu_device *adev,
>>>>> -				u8 voltage_type, u8 voltage_mode)
>>>>> -{
>>>>> -	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> -	u8 frev, crev;
>>>>> -	u16 data_offset, size;
>>>>> -	union voltage_object_info *voltage_info;
>>>>> -
>>>>> -	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> -				   &frev, &crev, &data_offset)) {
>>>>> -		voltage_info = (union voltage_object_info *)
>>>>> -			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> -
>>>>> -		switch (frev) {
>>>>> -		case 3:
>>>>> -			switch (crev) {
>>>>> -			case 1:
>>>>> -				if
>>>> (amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> -
>>>> voltage_type, voltage_mode))
>>>>> -					return true;
>>>>> -				break;
>>>>> -			default:
>>>>> -				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> -				return false;
>>>>> -			}
>>>>> -			break;
>>>>> -		default:
>>>>> -			DRM_ERROR("unknown voltage object table\n");
>>>>> -			return false;
>>>>> -		}
>>>>> -
>>>>> -	}
>>>>> -	return false;
>>>>> -}
>>>>> -
>>>>> -int amdgpu_atombios_get_voltage_table(struct amdgpu_device *adev,
>>>>> -				      u8 voltage_type, u8 voltage_mode,
>>>>> -				      struct atom_voltage_table *voltage_table)
>>>>> -{
>>>>> -	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> -	u8 frev, crev;
>>>>> -	u16 data_offset, size;
>>>>> -	int i;
>>>>> -	union voltage_object_info *voltage_info;
>>>>> -	union voltage_object *voltage_object = NULL;
>>>>> -
>>>>> -	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> -				   &frev, &crev, &data_offset)) {
>>>>> -		voltage_info = (union voltage_object_info *)
>>>>> -			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> -
>>>>> -		switch (frev) {
>>>>> -		case 3:
>>>>> -			switch (crev) {
>>>>> -			case 1:
>>>>> -				voltage_object = (union voltage_object *)
>>>>> -
>>>> 	amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> -
>>>> voltage_type, voltage_mode);
>>>>> -				if (voltage_object) {
>>>>> -					ATOM_GPIO_VOLTAGE_OBJECT_V3
>>>> *gpio =
>>>>> -						&voltage_object-
>>>>> v3.asGpioVoltageObj;
>>>>> -					VOLTAGE_LUT_ENTRY_V2 *lut;
>>>>> -					if (gpio->ucGpioEntryNum >
>>>> MAX_VOLTAGE_ENTRIES)
>>>>> -						return -EINVAL;
>>>>> -					lut = &gpio->asVolGpioLut[0];
>>>>> -					for (i = 0; i < gpio->ucGpioEntryNum;
>>>> i++) {
>>>>> -						voltage_table-
>>>>> entries[i].value =
>>>>> -							le16_to_cpu(lut-
>>>>> usVoltageValue);
>>>>> -						voltage_table-
>>>>> entries[i].smio_low =
>>>>> -							le32_to_cpu(lut-
>>>>> ulVoltageId);
>>>>> -						lut =
>>>> (VOLTAGE_LUT_ENTRY_V2 *)
>>>>> -							((u8 *)lut +
>>>> sizeof(VOLTAGE_LUT_ENTRY_V2));
>>>>> -					}
>>>>> -					voltage_table->mask_low =
>>>> le32_to_cpu(gpio->ulGpioMaskVal);
>>>>> -					voltage_table->count = gpio-
>>>>> ucGpioEntryNum;
>>>>> -					voltage_table->phase_delay = gpio-
>>>>> ucPhaseDelay;
>>>>> -					return 0;
>>>>> -				}
>>>>> -				break;
>>>>> -			default:
>>>>> -				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> -				return -EINVAL;
>>>>> -			}
>>>>> -			break;
>>>>> -		default:
>>>>> -			DRM_ERROR("unknown voltage object table\n");
>>>>> -			return -EINVAL;
>>>>> -		}
>>>>> -	}
>>>>> -	return -EINVAL;
>>>>> -}
>>>>> -
>>>>> -union vram_info {
>>>>> -	struct _ATOM_VRAM_INFO_V3 v1_3;
>>>>> -	struct _ATOM_VRAM_INFO_V4 v1_4;
>>>>> -	struct _ATOM_VRAM_INFO_HEADER_V2_1 v2_1;
>>>>> -};
>>>>> -
>>>>> -#define MEM_ID_MASK           0xff000000
>>>>> -#define MEM_ID_SHIFT          24
>>>>> -#define CLOCK_RANGE_MASK      0x00ffffff
>>>>> -#define CLOCK_RANGE_SHIFT     0
>>>>> -#define LOW_NIBBLE_MASK       0xf
>>>>> -#define DATA_EQU_PREV         0
>>>>> -#define DATA_FROM_TABLE       4
>>>>> -
>>>>> -int amdgpu_atombios_init_mc_reg_table(struct amdgpu_device *adev,
>>>>> -				      u8 module_index,
>>>>> -				      struct atom_mc_reg_table *reg_table)
>>>>> -{
>>>>> -	int index = GetIndexIntoMasterTable(DATA, VRAM_Info);
>>>>> -	u8 frev, crev, num_entries, t_mem_id, num_ranges = 0;
>>>>> -	u32 i = 0, j;
>>>>> -	u16 data_offset, size;
>>>>> -	union vram_info *vram_info;
>>>>> -
>>>>> -	memset(reg_table, 0, sizeof(struct atom_mc_reg_table));
>>>>> -
>>>>> -	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> -				   &frev, &crev, &data_offset)) {
>>>>> -		vram_info = (union vram_info *)
>>>>> -			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> -		switch (frev) {
>>>>> -		case 1:
>>>>> -			DRM_ERROR("old table version %d, %d\n", frev,
>>>> crev);
>>>>> -			return -EINVAL;
>>>>> -		case 2:
>>>>> -			switch (crev) {
>>>>> -			case 1:
>>>>> -				if (module_index < vram_info-
>>>>> v2_1.ucNumOfVRAMModule) {
>>>>> -					ATOM_INIT_REG_BLOCK *reg_block
>>>> =
>>>>> -						(ATOM_INIT_REG_BLOCK *)
>>>>> -						((u8 *)vram_info +
>>>> le16_to_cpu(vram_info->v2_1.usMemClkPatchTblOffset));
>>>>> -
>>>> 	ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
>>>>> -
>>>> 	(ATOM_MEMORY_SETTING_DATA_BLOCK *)
>>>>> -						((u8 *)reg_block + (2 *
>>>> sizeof(u16)) +
>>>>> -						 le16_to_cpu(reg_block-
>>>>> usRegIndexTblSize));
>>>>> -					ATOM_INIT_REG_INDEX_FORMAT
>>>> *format = &reg_block->asRegIndexBuf[0];
>>>>> -					num_entries =
>>>> (u8)((le16_to_cpu(reg_block->usRegIndexTblSize)) /
>>>>> -
>>>> sizeof(ATOM_INIT_REG_INDEX_FORMAT)) - 1;
>>>>> -					if (num_entries >
>>>> VBIOS_MC_REGISTER_ARRAY_SIZE)
>>>>> -						return -EINVAL;
>>>>> -					while (i < num_entries) {
>>>>> -						if (format-
>>>>> ucPreRegDataLength & ACCESS_PLACEHOLDER)
>>>>> -							break;
>>>>> -						reg_table-
>>>>> mc_reg_address[i].s1 =
>>>>> -
>>>> 	(u16)(le16_to_cpu(format->usRegIndex));
>>>>> -						reg_table-
>>>>> mc_reg_address[i].pre_reg_data =
>>>>> -							(u8)(format-
>>>>> ucPreRegDataLength);
>>>>> -						i++;
>>>>> -						format =
>>>> (ATOM_INIT_REG_INDEX_FORMAT *)
>>>>> -							((u8 *)format +
>>>> sizeof(ATOM_INIT_REG_INDEX_FORMAT));
>>>>> -					}
>>>>> -					reg_table->last = i;
>>>>> -					while ((le32_to_cpu(*(u32
>>>> *)reg_data) != END_OF_REG_DATA_BLOCK) &&
>>>>> -					       (num_ranges <
>>>> VBIOS_MAX_AC_TIMING_ENTRIES)) {
>>>>> -						t_mem_id =
>>>> (u8)((le32_to_cpu(*(u32 *)reg_data) & MEM_ID_MASK)
>>>>> -								>>
>>>> MEM_ID_SHIFT);
>>>>> -						if (module_index ==
>>>> t_mem_id) {
>>>>> -							reg_table-
>>>>> mc_reg_table_entry[num_ranges].mclk_max =
>>>>> -
>>>> 	(u32)((le32_to_cpu(*(u32 *)reg_data) & CLOCK_RANGE_MASK)
>>>>> -								      >>
>>>> CLOCK_RANGE_SHIFT);
>>>>> -							for (i = 0, j = 1; i <
>>>> reg_table->last; i++) {
>>>>> -								if ((reg_table-
>>>>> mc_reg_address[i].pre_reg_data & LOW_NIBBLE_MASK) ==
>>>> DATA_FROM_TABLE) {
>>>>> -
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i] =
>>>>> -
>>>> 	(u32)le32_to_cpu(*((u32 *)reg_data + j));
>>>>> -									j++;
>>>>> -								} else if
>>>> ((reg_table->mc_reg_address[i].pre_reg_data & LOW_NIBBLE_MASK) ==
>>>> DATA_EQU_PREV) {
>>>>> -
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i] =
>>>>> -
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i - 1];
>>>>> -								}
>>>>> -							}
>>>>> -							num_ranges++;
>>>>> -						}
>>>>> -						reg_data =
>>>> (ATOM_MEMORY_SETTING_DATA_BLOCK *)
>>>>> -							((u8 *)reg_data +
>>>> le16_to_cpu(reg_block->usRegDataBlkSize));
>>>>> -					}
>>>>> -					if (le32_to_cpu(*(u32 *)reg_data) !=
>>>> END_OF_REG_DATA_BLOCK)
>>>>> -						return -EINVAL;
>>>>> -					reg_table->num_entries =
>>>> num_ranges;
>>>>> -				} else
>>>>> -					return -EINVAL;
>>>>> -				break;
>>>>> -			default:
>>>>> -				DRM_ERROR("Unknown table
>>>> version %d, %d\n", frev, crev);
>>>>> -				return -EINVAL;
>>>>> -			}
>>>>> -			break;
>>>>> -		default:
>>>>> -			DRM_ERROR("Unknown table version %d, %d\n",
>>>> frev, crev);
>>>>> -			return -EINVAL;
>>>>> -		}
>>>>> -		return 0;
>>>>> -	}
>>>>> -	return -EINVAL;
>>>>> -}
>>>>> -
>>>>>     bool amdgpu_atombios_has_gpu_virtualization_table(struct
>>>> amdgpu_device *adev)
>>>>>     {
>>>>>     	int index = GetIndexIntoMasterTable(DATA, GPUVirtualizationInfo);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
>>>>> index 27e74b1fc260..cb5649298dcb 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
>>>>> @@ -160,26 +160,6 @@ int
>> amdgpu_atombios_get_clock_dividers(struct
>>>> amdgpu_device *adev,
>>>>>     				       bool strobe_mode,
>>>>>     				       struct atom_clock_dividers *dividers);
>>>>>
>>>>> -int amdgpu_atombios_get_memory_pll_dividers(struct
>> amdgpu_device
>>>> *adev,
>>>>> -					    u32 clock,
>>>>> -					    bool strobe_mode,
>>>>> -					    struct atom_mpll_param
>>>> *mpll_param);
>>>>> -
>>>>> -void amdgpu_atombios_set_engine_dram_timings(struct
>> amdgpu_device
>>>> *adev,
>>>>> -					     u32 eng_clock, u32 mem_clock);
>>>>> -
>>>>> -bool
>>>>> -amdgpu_atombios_is_voltage_gpio(struct amdgpu_device *adev,
>>>>> -				u8 voltage_type, u8 voltage_mode);
>>>>> -
>>>>> -int amdgpu_atombios_get_voltage_table(struct amdgpu_device *adev,
>>>>> -				      u8 voltage_type, u8 voltage_mode,
>>>>> -				      struct atom_voltage_table
>>>> *voltage_table);
>>>>> -
>>>>> -int amdgpu_atombios_init_mc_reg_table(struct amdgpu_device *adev,
>>>>> -				      u8 module_index,
>>>>> -				      struct atom_mc_reg_table *reg_table);
>>>>> -
>>>>>     bool amdgpu_atombios_has_gpu_virtualization_table(struct
>>>> amdgpu_device *adev);
>>>>>
>>>>>     void amdgpu_atombios_scratch_regs_lock(struct amdgpu_device
>> *adev,
>>>> bool lock);
>>>>> @@ -190,21 +170,11 @@ void
>>>> amdgpu_atombios_scratch_regs_set_backlight_level(struct
>> amdgpu_device
>>>> *adev
>>>>>     bool amdgpu_atombios_scratch_need_asic_init(struct amdgpu_device
>>>> *adev);
>>>>>
>>>>>     void amdgpu_atombios_copy_swap(u8 *dst, u8 *src, u8 num_bytes,
>> bool
>>>> to_le);
>>>>> -int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev, u8
>>>> voltage_type,
>>>>> -			     u16 voltage_id, u16 *voltage);
>>>>> -int
>> amdgpu_atombios_get_leakage_vddc_based_on_leakage_idx(struct
>>>> amdgpu_device *adev,
>>>>> -						      u16 *voltage,
>>>>> -						      u16 leakage_idx);
>>>>> -void amdgpu_atombios_get_default_voltages(struct amdgpu_device
>>>> *adev,
>>>>> -					  u16 *vddc, u16 *vddci, u16 *mvdd);
>>>>>     int amdgpu_atombios_get_clock_dividers(struct amdgpu_device
>> *adev,
>>>>>     				       u8 clock_type,
>>>>>     				       u32 clock,
>>>>>     				       bool strobe_mode,
>>>>>     				       struct atom_clock_dividers *dividers);
>>>>> -int amdgpu_atombios_get_svi2_info(struct amdgpu_device *adev,
>>>>> -			      u8 voltage_type,
>>>>> -			      u8 *svd_gpio_id, u8 *svc_gpio_id);
>>>>>
>>>>>     int amdgpu_atombios_get_data_table(struct amdgpu_device *adev,
>>>>>     				   uint32_t table,
>>>>
>>>>
>>>> Whether used in legacy or new logic, atombios table parsing/execution
>>>> should be kept as separate logic. These shouldn't be moved along with
>> dpm.
>>> [Quan, Evan] Are you suggesting another place holder for those atombios
>> APIs? Like legacy_atombios.c?
>>
>> What I meant is no need to move them, keep it in the same file. We also
>> have atomfirmware, splitting this and adding another legacy_atombios is
>> not required.
> [Quan, Evan] Hmm, that seems contrary to Alex' suggestions.
> Although I'm fine with either. I kind of prefer Alex's suggestions.
> That is if they are destined to be dropped(together with SI/KV support), we should get them separated now.
> 

Hmm, that is not the way the code is structured currently. We don't keep 
as atombios_powerplay.c or atomfirmware_smu.c. The logic related to 
atombios is kept in single place. We could mark these as legacy APIs 
such that they get dropped whenever KV/SI support is dropped.

Thanks,
Lijo


> BR
> Evan
>>
>>>>
>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
>>>> b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
>>>>> index 2e295facd086..cdf724dcf832 100644
>>>>> --- a/drivers/gpu/drm/amd/include/kgd_pp_interface.h
>>>>> +++ b/drivers/gpu/drm/amd/include/kgd_pp_interface.h
>>>>> @@ -404,6 +404,7 @@ struct amd_pm_funcs {
>>>>>     	int (*get_dpm_clock_table)(void *handle,
>>>>>     				   struct dpm_clocks *clock_table);
>>>>>     	int (*get_smu_prv_buf_details)(void *handle, void **addr, size_t
>>>> *size);
>>>>> +	int (*change_power_state)(void *handle);
>>>>>     };
>>>>>
>>>>>     struct metrics_table_header {
>>>>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>>>> b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>>>>> index ecaf0081bc31..c6801d10cde6 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
>>>>> @@ -34,113 +34,9 @@
>>>>>
>>>>>     #define WIDTH_4K 3840
>>>>>
>>>>> -#define amdgpu_dpm_pre_set_power_state(adev) \
>>>>> -		((adev)->powerplay.pp_funcs-
>>>>> pre_set_power_state((adev)->powerplay.pp_handle))
>>>>> -
>>>>> -#define amdgpu_dpm_post_set_power_state(adev) \
>>>>> -		((adev)->powerplay.pp_funcs-
>>>>> post_set_power_state((adev)->powerplay.pp_handle))
>>>>> -
>>>>> -#define amdgpu_dpm_display_configuration_changed(adev) \
>>>>> -		((adev)->powerplay.pp_funcs-
>>>>> display_configuration_changed((adev)->powerplay.pp_handle))
>>>>> -
>>>>> -#define amdgpu_dpm_print_power_state(adev, ps) \
>>>>> -		((adev)->powerplay.pp_funcs->print_power_state((adev)-
>>>>> powerplay.pp_handle, (ps)))
>>>>> -
>>>>> -#define amdgpu_dpm_vblank_too_short(adev) \
>>>>> -		((adev)->powerplay.pp_funcs->vblank_too_short((adev)-
>>>>> powerplay.pp_handle))
>>>>> -
>>>>>     #define amdgpu_dpm_enable_bapm(adev, e) \
>>>>>     		((adev)->powerplay.pp_funcs->enable_bapm((adev)-
>>>>> powerplay.pp_handle, (e)))
>>>>>
>>>>> -#define amdgpu_dpm_check_state_equal(adev, cps, rps, equal) \
>>>>> -		((adev)->powerplay.pp_funcs->check_state_equal((adev)-
>>>>> powerplay.pp_handle, (cps), (rps), (equal)))
>>>>> -
>>>>> -void amdgpu_dpm_print_class_info(u32 class, u32 class2)
>>>>> -{
>>>>> -	const char *s;
>>>>> -
>>>>> -	switch (class & ATOM_PPLIB_CLASSIFICATION_UI_MASK) {
>>>>> -	case ATOM_PPLIB_CLASSIFICATION_UI_NONE:
>>>>> -	default:
>>>>> -		s = "none";
>>>>> -		break;
>>>>> -	case ATOM_PPLIB_CLASSIFICATION_UI_BATTERY:
>>>>> -		s = "battery";
>>>>> -		break;
>>>>> -	case ATOM_PPLIB_CLASSIFICATION_UI_BALANCED:
>>>>> -		s = "balanced";
>>>>> -		break;
>>>>> -	case ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE:
>>>>> -		s = "performance";
>>>>> -		break;
>>>>> -	}
>>>>> -	printk("\tui class: %s\n", s);
>>>>> -	printk("\tinternal class:");
>>>>> -	if (((class & ~ATOM_PPLIB_CLASSIFICATION_UI_MASK) == 0) &&
>>>>> -	    (class2 == 0))
>>>>> -		pr_cont(" none");
>>>>> -	else {
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_BOOT)
>>>>> -			pr_cont(" boot");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
>>>>> -			pr_cont(" thermal");
>>>>> -		if (class &
>>>> ATOM_PPLIB_CLASSIFICATION_LIMITEDPOWERSOURCE)
>>>>> -			pr_cont(" limited_pwr");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_REST)
>>>>> -			pr_cont(" rest");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_FORCED)
>>>>> -			pr_cont(" forced");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
>>>>> -			pr_cont(" 3d_perf");
>>>>> -		if (class &
>>>> ATOM_PPLIB_CLASSIFICATION_OVERDRIVETEMPLATE)
>>>>> -			pr_cont(" ovrdrv");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_UVDSTATE)
>>>>> -			pr_cont(" uvd");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_3DLOW)
>>>>> -			pr_cont(" 3d_low");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_ACPI)
>>>>> -			pr_cont(" acpi");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
>>>>> -			pr_cont(" uvd_hd2");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
>>>>> -			pr_cont(" uvd_hd");
>>>>> -		if (class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
>>>>> -			pr_cont(" uvd_sd");
>>>>> -		if (class2 &
>>>> ATOM_PPLIB_CLASSIFICATION2_LIMITEDPOWERSOURCE_2)
>>>>> -			pr_cont(" limited_pwr2");
>>>>> -		if (class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
>>>>> -			pr_cont(" ulv");
>>>>> -		if (class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
>>>>> -			pr_cont(" uvd_mvc");
>>>>> -	}
>>>>> -	pr_cont("\n");
>>>>> -}
>>>>> -
>>>>> -void amdgpu_dpm_print_cap_info(u32 caps)
>>>>> -{
>>>>> -	printk("\tcaps:");
>>>>> -	if (caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY)
>>>>> -		pr_cont(" single_disp");
>>>>> -	if (caps & ATOM_PPLIB_SUPPORTS_VIDEO_PLAYBACK)
>>>>> -		pr_cont(" video");
>>>>> -	if (caps & ATOM_PPLIB_DISALLOW_ON_DC)
>>>>> -		pr_cont(" no_dc");
>>>>> -	pr_cont("\n");
>>>>> -}
>>>>> -
>>>>> -void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
>>>>> -				struct amdgpu_ps *rps)
>>>>> -{
>>>>> -	printk("\tstatus:");
>>>>> -	if (rps == adev->pm.dpm.current_ps)
>>>>> -		pr_cont(" c");
>>>>> -	if (rps == adev->pm.dpm.requested_ps)
>>>>> -		pr_cont(" r");
>>>>> -	if (rps == adev->pm.dpm.boot_ps)
>>>>> -		pr_cont(" b");
>>>>> -	pr_cont("\n");
>>>>> -}
>>>>> -
>>>>>     static void amdgpu_dpm_get_active_displays(struct amdgpu_device
>>>> *adev)
>>>>>     {
>>>>>     	struct drm_device *ddev = adev_to_drm(adev);
>>>>> @@ -161,7 +57,6 @@ static void
>> amdgpu_dpm_get_active_displays(struct
>>>> amdgpu_device *adev)
>>>>>     	}
>>>>>     }
>>>>>
>>>>> -
>>>>>     u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev)
>>>>>     {
>>>>>     	struct drm_device *dev = adev_to_drm(adev);
>>>>> @@ -209,679 +104,6 @@ static u32 amdgpu_dpm_get_vrefresh(struct
>>>> amdgpu_device *adev)
>>>>>     	return vrefresh;
>>>>>     }
>>>>>
>>>>> -union power_info {
>>>>> -	struct _ATOM_POWERPLAY_INFO info;
>>>>> -	struct _ATOM_POWERPLAY_INFO_V2 info_2;
>>>>> -	struct _ATOM_POWERPLAY_INFO_V3 info_3;
>>>>> -	struct _ATOM_PPLIB_POWERPLAYTABLE pplib;
>>>>> -	struct _ATOM_PPLIB_POWERPLAYTABLE2 pplib2;
>>>>> -	struct _ATOM_PPLIB_POWERPLAYTABLE3 pplib3;
>>>>> -	struct _ATOM_PPLIB_POWERPLAYTABLE4 pplib4;
>>>>> -	struct _ATOM_PPLIB_POWERPLAYTABLE5 pplib5;
>>>>> -};
>>>>> -
>>>>> -union fan_info {
>>>>> -	struct _ATOM_PPLIB_FANTABLE fan;
>>>>> -	struct _ATOM_PPLIB_FANTABLE2 fan2;
>>>>> -	struct _ATOM_PPLIB_FANTABLE3 fan3;
>>>>> -};
>>>>> -
>>>>> -static int amdgpu_parse_clk_voltage_dep_table(struct
>>>> amdgpu_clock_voltage_dependency_table *amdgpu_table,
>>>>> -
>>>> ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
>>>>> -{
>>>>> -	u32 size = atom_table->ucNumEntries *
>>>>> -		sizeof(struct amdgpu_clock_voltage_dependency_entry);
>>>>> -	int i;
>>>>> -	ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;
>>>>> -
>>>>> -	amdgpu_table->entries = kzalloc(size, GFP_KERNEL);
>>>>> -	if (!amdgpu_table->entries)
>>>>> -		return -ENOMEM;
>>>>> -
>>>>> -	entry = &atom_table->entries[0];
>>>>> -	for (i = 0; i < atom_table->ucNumEntries; i++) {
>>>>> -		amdgpu_table->entries[i].clk = le16_to_cpu(entry-
>>>>> usClockLow) |
>>>>> -			(entry->ucClockHigh << 16);
>>>>> -		amdgpu_table->entries[i].v = le16_to_cpu(entry-
>>>>> usVoltage);
>>>>> -		entry = (ATOM_PPLIB_Clock_Voltage_Dependency_Record
>>>> *)
>>>>> -			((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_Clock_Voltage_Dependency_Record));
>>>>> -	}
>>>>> -	amdgpu_table->count = atom_table->ucNumEntries;
>>>>> -
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -int amdgpu_get_platform_caps(struct amdgpu_device *adev)
>>>>> -{
>>>>> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> -	union power_info *power_info;
>>>>> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> -	u16 data_offset;
>>>>> -	u8 frev, crev;
>>>>> -
>>>>> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> -				   &frev, &crev, &data_offset))
>>>>> -		return -EINVAL;
>>>>> -	power_info = (union power_info *)(mode_info->atom_context-
>>>>> bios + data_offset);
>>>>> -
>>>>> -	adev->pm.dpm.platform_caps = le32_to_cpu(power_info-
>>>>> pplib.ulPlatformCaps);
>>>>> -	adev->pm.dpm.backbias_response_time =
>>>> le16_to_cpu(power_info->pplib.usBackbiasTime);
>>>>> -	adev->pm.dpm.voltage_response_time = le16_to_cpu(power_info-
>>>>> pplib.usVoltageTime);
>>>>> -
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -/* sizeof(ATOM_PPLIB_EXTENDEDHEADER) */
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2 12
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3 14
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4 16
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5 18
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6 20
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7 22
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8 24
>>>>> -#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V9 26
>>>>> -
>>>>> -int amdgpu_parse_extended_power_table(struct amdgpu_device
>> *adev)
>>>>> -{
>>>>> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> -	union power_info *power_info;
>>>>> -	union fan_info *fan_info;
>>>>> -	ATOM_PPLIB_Clock_Voltage_Dependency_Table *dep_table;
>>>>> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> -	u16 data_offset;
>>>>> -	u8 frev, crev;
>>>>> -	int ret, i;
>>>>> -
>>>>> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> -				   &frev, &crev, &data_offset))
>>>>> -		return -EINVAL;
>>>>> -	power_info = (union power_info *)(mode_info->atom_context-
>>>>> bios + data_offset);
>>>>> -
>>>>> -	/* fan table */
>>>>> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
>>>>> -		if (power_info->pplib3.usFanTableOffset) {
>>>>> -			fan_info = (union fan_info *)(mode_info-
>>>>> atom_context->bios + data_offset +
>>>>> -						      le16_to_cpu(power_info-
>>>>> pplib3.usFanTableOffset));
>>>>> -			adev->pm.dpm.fan.t_hyst = fan_info->fan.ucTHyst;
>>>>> -			adev->pm.dpm.fan.t_min = le16_to_cpu(fan_info-
>>>>> fan.usTMin);
>>>>> -			adev->pm.dpm.fan.t_med = le16_to_cpu(fan_info-
>>>>> fan.usTMed);
>>>>> -			adev->pm.dpm.fan.t_high = le16_to_cpu(fan_info-
>>>>> fan.usTHigh);
>>>>> -			adev->pm.dpm.fan.pwm_min =
>>>> le16_to_cpu(fan_info->fan.usPWMMin);
>>>>> -			adev->pm.dpm.fan.pwm_med =
>>>> le16_to_cpu(fan_info->fan.usPWMMed);
>>>>> -			adev->pm.dpm.fan.pwm_high =
>>>> le16_to_cpu(fan_info->fan.usPWMHigh);
>>>>> -			if (fan_info->fan.ucFanTableFormat >= 2)
>>>>> -				adev->pm.dpm.fan.t_max =
>>>> le16_to_cpu(fan_info->fan2.usTMax);
>>>>> -			else
>>>>> -				adev->pm.dpm.fan.t_max = 10900;
>>>>> -			adev->pm.dpm.fan.cycle_delay = 100000;
>>>>> -			if (fan_info->fan.ucFanTableFormat >= 3) {
>>>>> -				adev->pm.dpm.fan.control_mode =
>>>> fan_info->fan3.ucFanControlMode;
>>>>> -				adev->pm.dpm.fan.default_max_fan_pwm
>>>> =
>>>>> -					le16_to_cpu(fan_info-
>>>>> fan3.usFanPWMMax);
>>>>> -				adev-
>>>>> pm.dpm.fan.default_fan_output_sensitivity = 4836;
>>>>> -				adev->pm.dpm.fan.fan_output_sensitivity =
>>>>> -					le16_to_cpu(fan_info-
>>>>> fan3.usFanOutputSensitivity);
>>>>> -			}
>>>>> -			adev->pm.dpm.fan.ucode_fan_control = true;
>>>>> -		}
>>>>> -	}
>>>>> -
>>>>> -	/* clock dependancy tables, shedding tables */
>>>>> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE4)) {
>>>>> -		if (power_info->pplib4.usVddcDependencyOnSCLKOffset) {
>>>>> -			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcDependencyOnSCLKOffset));
>>>>> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddc_dependency_on_sclk,
>>>>> -								 dep_table);
>>>>> -			if (ret) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return ret;
>>>>> -			}
>>>>> -		}
>>>>> -		if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
>>>>> -			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usVddciDependencyOnMCLKOffset));
>>>>> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddci_dependency_on_mclk,
>>>>> -								 dep_table);
>>>>> -			if (ret) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return ret;
>>>>> -			}
>>>>> -		}
>>>>> -		if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
>>>>> -			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcDependencyOnMCLKOffset));
>>>>> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddc_dependency_on_mclk,
>>>>> -								 dep_table);
>>>>> -			if (ret) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return ret;
>>>>> -			}
>>>>> -		}
>>>>> -		if (power_info->pplib4.usMvddDependencyOnMCLKOffset)
>>>> {
>>>>> -			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usMvddDependencyOnMCLKOffset));
>>>>> -			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.mvdd_dependency_on_mclk,
>>>>> -								 dep_table);
>>>>> -			if (ret) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return ret;
>>>>> -			}
>>>>> -		}
>>>>> -		if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
>>>>> -			ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =
>>>>> -				(ATOM_PPLIB_Clock_Voltage_Limit_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usMaxClockVoltageOnDCOffset));
>>>>> -			if (clk_v->ucNumEntries) {
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.sclk =
>>>>> -					le16_to_cpu(clk_v-
>>>>> entries[0].usSclkLow) |
>>>>> -					(clk_v->entries[0].ucSclkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.mclk =
>>>>> -					le16_to_cpu(clk_v-
>>>>> entries[0].usMclkLow) |
>>>>> -					(clk_v->entries[0].ucMclkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.vddc =
>>>>> -					le16_to_cpu(clk_v-
>>>>> entries[0].usVddc);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.vddci =
>>>>> -					le16_to_cpu(clk_v-
>>>>> entries[0].usVddci);
>>>>> -			}
>>>>> -		}
>>>>> -		if (power_info->pplib4.usVddcPhaseShedLimitsTableOffset)
>>>> {
>>>>> -			ATOM_PPLIB_PhaseSheddingLimits_Table *psl =
>>>>> -				(ATOM_PPLIB_PhaseSheddingLimits_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcPhaseShedLimitsTableOffset));
>>>>> -			ATOM_PPLIB_PhaseSheddingLimits_Record *entry;
>>>>> -
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries =
>>>>> -				kcalloc(psl->ucNumEntries,
>>>>> -					sizeof(struct
>>>> amdgpu_phase_shedding_limits_entry),
>>>>> -					GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -
>>>>> -			entry = &psl->entries[0];
>>>>> -			for (i = 0; i < psl->ucNumEntries; i++) {
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].sclk =
>>>>> -					le16_to_cpu(entry->usSclkLow) |
>>>> (entry->ucSclkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].mclk =
>>>>> -					le16_to_cpu(entry->usMclkLow) |
>>>> (entry->ucMclkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].voltage =
>>>>> -					le16_to_cpu(entry->usVoltage);
>>>>> -				entry =
>>>> (ATOM_PPLIB_PhaseSheddingLimits_Record *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_PhaseSheddingLimits_Record));
>>>>> -			}
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.count =
>>>>> -				psl->ucNumEntries;
>>>>> -		}
>>>>> -	}
>>>>> -
>>>>> -	/* cac data */
>>>>> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE5)) {
>>>>> -		adev->pm.dpm.tdp_limit = le32_to_cpu(power_info-
>>>>> pplib5.ulTDPLimit);
>>>>> -		adev->pm.dpm.near_tdp_limit = le32_to_cpu(power_info-
>>>>> pplib5.ulNearTDPLimit);
>>>>> -		adev->pm.dpm.near_tdp_limit_adjusted = adev-
>>>>> pm.dpm.near_tdp_limit;
>>>>> -		adev->pm.dpm.tdp_od_limit = le16_to_cpu(power_info-
>>>>> pplib5.usTDPODLimit);
>>>>> -		if (adev->pm.dpm.tdp_od_limit)
>>>>> -			adev->pm.dpm.power_control = true;
>>>>> -		else
>>>>> -			adev->pm.dpm.power_control = false;
>>>>> -		adev->pm.dpm.tdp_adjustment = 0;
>>>>> -		adev->pm.dpm.sq_ramping_threshold =
>>>> le32_to_cpu(power_info->pplib5.ulSQRampingThreshold);
>>>>> -		adev->pm.dpm.cac_leakage = le32_to_cpu(power_info-
>>>>> pplib5.ulCACLeakage);
>>>>> -		adev->pm.dpm.load_line_slope = le16_to_cpu(power_info-
>>>>> pplib5.usLoadLineSlope);
>>>>> -		if (power_info->pplib5.usCACLeakageTableOffset) {
>>>>> -			ATOM_PPLIB_CAC_Leakage_Table *cac_table =
>>>>> -				(ATOM_PPLIB_CAC_Leakage_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(power_info-
>>>>> pplib5.usCACLeakageTableOffset));
>>>>> -			ATOM_PPLIB_CAC_Leakage_Record *entry;
>>>>> -			u32 size = cac_table->ucNumEntries * sizeof(struct
>>>> amdgpu_cac_leakage_table);
>>>>> -			adev->pm.dpm.dyn_state.cac_leakage_table.entries
>>>> = kzalloc(size, GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			entry = &cac_table->entries[0];
>>>>> -			for (i = 0; i < cac_table->ucNumEntries; i++) {
>>>>> -				if (adev->pm.dpm.platform_caps &
>>>> ATOM_PP_PLATFORM_CAP_EVV) {
>>>>> -					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc1 =
>>>>> -						le16_to_cpu(entry-
>>>>> usVddc1);
>>>>> -					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc2 =
>>>>> -						le16_to_cpu(entry-
>>>>> usVddc2);
>>>>> -					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc3 =
>>>>> -						le16_to_cpu(entry-
>>>>> usVddc3);
>>>>> -				} else {
>>>>> -					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc =
>>>>> -						le16_to_cpu(entry->usVddc);
>>>>> -					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].leakage =
>>>>> -						le32_to_cpu(entry-
>>>>> ulLeakageValue);
>>>>> -				}
>>>>> -				entry = (ATOM_PPLIB_CAC_Leakage_Record
>>>> *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_CAC_Leakage_Record));
>>>>> -			}
>>>>> -			adev->pm.dpm.dyn_state.cac_leakage_table.count
>>>> = cac_table->ucNumEntries;
>>>>> -		}
>>>>> -	}
>>>>> -
>>>>> -	/* ext tables */
>>>>> -	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> -	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
>>>>> -		ATOM_PPLIB_EXTENDEDHEADER *ext_hdr =
>>>> (ATOM_PPLIB_EXTENDEDHEADER *)
>>>>> -			(mode_info->atom_context->bios + data_offset +
>>>>> -			 le16_to_cpu(power_info-
>>>>> pplib3.usExtendendedHeaderOffset));
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2) &&
>>>>> -			ext_hdr->usVCETableOffset) {
>>>>> -			VCEClockInfoArray *array = (VCEClockInfoArray *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1);
>>>>> -			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table
>>>> *limits =
>>>>> -
>>>> 	(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1 +
>>>>> -				 1 + array->ucNumEntries *
>>>> sizeof(VCEClockInfo));
>>>>> -			ATOM_PPLIB_VCE_State_Table *states =
>>>>> -				(ATOM_PPLIB_VCE_State_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1 +
>>>>> -				 1 + (array->ucNumEntries * sizeof
>>>> (VCEClockInfo)) +
>>>>> -				 1 + (limits->numEntries *
>>>> sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record)));
>>>>> -			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record
>>>> *entry;
>>>>> -			ATOM_PPLIB_VCE_State_Record *state_entry;
>>>>> -			VCEClockInfo *vce_clk;
>>>>> -			u32 size = limits->numEntries *
>>>>> -				sizeof(struct
>>>> amdgpu_vce_clock_voltage_dependency_entry);
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries =
>>>>> -				kzalloc(size, GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.count =
>>>>> -				limits->numEntries;
>>>>> -			entry = &limits->entries[0];
>>>>> -			state_entry = &states->entries[0];
>>>>> -			for (i = 0; i < limits->numEntries; i++) {
>>>>> -				vce_clk = (VCEClockInfo *)
>>>>> -					((u8 *)&array->entries[0] +
>>>>> -					 (entry->ucVCEClockInfoIndex *
>>>> sizeof(VCEClockInfo)));
>>>>> -				adev-
>>>>>
>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].evclk
>>>> =
>>>>> -					le16_to_cpu(vce_clk->usEVClkLow) |
>>>> (vce_clk->ucEVClkHigh << 16);
>>>>> -				adev-
>>>>>
>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].ecclk
>>>> =
>>>>> -					le16_to_cpu(vce_clk->usECClkLow) |
>>>> (vce_clk->ucECClkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].v =
>>>>> -					le16_to_cpu(entry->usVoltage);
>>>>> -				entry =
>>>> (ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record));
>>>>> -			}
>>>>> -			adev->pm.dpm.num_of_vce_states =
>>>>> -					states->numEntries >
>>>> AMD_MAX_VCE_LEVELS ?
>>>>> -					AMD_MAX_VCE_LEVELS : states-
>>>>> numEntries;
>>>>> -			for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++)
>>>> {
>>>>> -				vce_clk = (VCEClockInfo *)
>>>>> -					((u8 *)&array->entries[0] +
>>>>> -					 (state_entry->ucVCEClockInfoIndex
>>>> * sizeof(VCEClockInfo)));
>>>>> -				adev->pm.dpm.vce_states[i].evclk =
>>>>> -					le16_to_cpu(vce_clk->usEVClkLow) |
>>>> (vce_clk->ucEVClkHigh << 16);
>>>>> -				adev->pm.dpm.vce_states[i].ecclk =
>>>>> -					le16_to_cpu(vce_clk->usECClkLow) |
>>>> (vce_clk->ucECClkHigh << 16);
>>>>> -				adev->pm.dpm.vce_states[i].clk_idx =
>>>>> -					state_entry->ucClockInfoIndex &
>>>> 0x3f;
>>>>> -				adev->pm.dpm.vce_states[i].pstate =
>>>>> -					(state_entry->ucClockInfoIndex &
>>>> 0xc0) >> 6;
>>>>> -				state_entry =
>>>> (ATOM_PPLIB_VCE_State_Record *)
>>>>> -					((u8 *)state_entry +
>>>> sizeof(ATOM_PPLIB_VCE_State_Record));
>>>>> -			}
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3) &&
>>>>> -			ext_hdr->usUVDTableOffset) {
>>>>> -			UVDClockInfoArray *array = (UVDClockInfoArray *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usUVDTableOffset) +
>>>> 1);
>>>>> -			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table
>>>> *limits =
>>>>> -
>>>> 	(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usUVDTableOffset) +
>>>> 1 +
>>>>> -				 1 + (array->ucNumEntries * sizeof
>>>> (UVDClockInfo)));
>>>>> -			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record
>>>> *entry;
>>>>> -			u32 size = limits->numEntries *
>>>>> -				sizeof(struct
>>>> amdgpu_uvd_clock_voltage_dependency_entry);
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries =
>>>>> -				kzalloc(size, GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.count =
>>>>> -				limits->numEntries;
>>>>> -			entry = &limits->entries[0];
>>>>> -			for (i = 0; i < limits->numEntries; i++) {
>>>>> -				UVDClockInfo *uvd_clk = (UVDClockInfo *)
>>>>> -					((u8 *)&array->entries[0] +
>>>>> -					 (entry->ucUVDClockInfoIndex *
>>>> sizeof(UVDClockInfo)));
>>>>> -				adev-
>>>>>
>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].vclk =
>>>>> -					le16_to_cpu(uvd_clk->usVClkLow) |
>>>> (uvd_clk->ucVClkHigh << 16);
>>>>> -				adev-
>>>>>
>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].dclk =
>>>>> -					le16_to_cpu(uvd_clk->usDClkLow) |
>>>> (uvd_clk->ucDClkHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].v =
>>>>> -					le16_to_cpu(entry->usVoltage);
>>>>> -				entry =
>>>> (ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record));
>>>>> -			}
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4) &&
>>>>> -			ext_hdr->usSAMUTableOffset) {
>>>>> -			ATOM_PPLIB_SAMClk_Voltage_Limit_Table *limits =
>>>>> -				(ATOM_PPLIB_SAMClk_Voltage_Limit_Table
>>>> *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usSAMUTableOffset)
>>>> + 1);
>>>>> -			ATOM_PPLIB_SAMClk_Voltage_Limit_Record *entry;
>>>>> -			u32 size = limits->numEntries *
>>>>> -				sizeof(struct
>>>> amdgpu_clock_voltage_dependency_entry);
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries =
>>>>> -				kzalloc(size, GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.count =
>>>>> -				limits->numEntries;
>>>>> -			entry = &limits->entries[0];
>>>>> -			for (i = 0; i < limits->numEntries; i++) {
>>>>> -				adev-
>>>>>
>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].clk =
>>>>> -					le16_to_cpu(entry->usSAMClockLow)
>>>> | (entry->ucSAMClockHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].v
>> =
>>>>> -					le16_to_cpu(entry->usVoltage);
>>>>> -				entry =
>>>> (ATOM_PPLIB_SAMClk_Voltage_Limit_Record *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_SAMClk_Voltage_Limit_Record));
>>>>> -			}
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5) &&
>>>>> -		    ext_hdr->usPPMTableOffset) {
>>>>> -			ATOM_PPLIB_PPM_Table *ppm =
>>>> (ATOM_PPLIB_PPM_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usPPMTableOffset));
>>>>> -			adev->pm.dpm.dyn_state.ppm_table =
>>>>> -				kzalloc(sizeof(struct amdgpu_ppm_table),
>>>> GFP_KERNEL);
>>>>> -			if (!adev->pm.dpm.dyn_state.ppm_table) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			adev->pm.dpm.dyn_state.ppm_table->ppm_design
>>>> = ppm->ucPpmDesign;
>>>>> -			adev->pm.dpm.dyn_state.ppm_table-
>>>>> cpu_core_number =
>>>>> -				le16_to_cpu(ppm->usCpuCoreNumber);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table-
>>>>> platform_tdp =
>>>>> -				le32_to_cpu(ppm->ulPlatformTDP);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table-
>>>>> small_ac_platform_tdp =
>>>>> -				le32_to_cpu(ppm->ulSmallACPlatformTDP);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table->platform_tdc
>>>> =
>>>>> -				le32_to_cpu(ppm->ulPlatformTDC);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table-
>>>>> small_ac_platform_tdc =
>>>>> -				le32_to_cpu(ppm->ulSmallACPlatformTDC);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table->apu_tdp =
>>>>> -				le32_to_cpu(ppm->ulApuTDP);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table->dgpu_tdp =
>>>>> -				le32_to_cpu(ppm->ulDGpuTDP);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table-
>>>>> dgpu_ulv_power =
>>>>> -				le32_to_cpu(ppm->ulDGpuUlvPower);
>>>>> -			adev->pm.dpm.dyn_state.ppm_table->tj_max =
>>>>> -				le32_to_cpu(ppm->ulTjmax);
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6) &&
>>>>> -			ext_hdr->usACPTableOffset) {
>>>>> -			ATOM_PPLIB_ACPClk_Voltage_Limit_Table *limits =
>>>>> -				(ATOM_PPLIB_ACPClk_Voltage_Limit_Table
>>>> *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr->usACPTableOffset) +
>>>> 1);
>>>>> -			ATOM_PPLIB_ACPClk_Voltage_Limit_Record *entry;
>>>>> -			u32 size = limits->numEntries *
>>>>> -				sizeof(struct
>>>> amdgpu_clock_voltage_dependency_entry);
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries =
>>>>> -				kzalloc(size, GFP_KERNEL);
>>>>> -			if (!adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.count =
>>>>> -				limits->numEntries;
>>>>> -			entry = &limits->entries[0];
>>>>> -			for (i = 0; i < limits->numEntries; i++) {
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].clk
>> =
>>>>> -					le16_to_cpu(entry->usACPClockLow)
>>>> | (entry->ucACPClockHigh << 16);
>>>>> -				adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].v =
>>>>> -					le16_to_cpu(entry->usVoltage);
>>>>> -				entry =
>>>> (ATOM_PPLIB_ACPClk_Voltage_Limit_Record *)
>>>>> -					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_ACPClk_Voltage_Limit_Record));
>>>>> -			}
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7) &&
>>>>> -			ext_hdr->usPowerTuneTableOffset) {
>>>>> -			u8 rev = *(u8 *)(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> -			ATOM_PowerTune_Table *pt;
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table =
>>>>> -				kzalloc(sizeof(struct amdgpu_cac_tdp_table),
>>>> GFP_KERNEL);
>>>>> -			if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
>>>>> -
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> -				return -ENOMEM;
>>>>> -			}
>>>>> -			if (rev > 0) {
>>>>> -				ATOM_PPLIB_POWERTUNE_Table_V1 *ppt =
>>>> (ATOM_PPLIB_POWERTUNE_Table_V1 *)
>>>>> -					(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> -				adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> maximum_power_delivery_limit =
>>>>> -					ppt->usMaximumPowerDeliveryLimit;
>>>>> -				pt = &ppt->power_tune_table;
>>>>> -			} else {
>>>>> -				ATOM_PPLIB_POWERTUNE_Table *ppt =
>>>> (ATOM_PPLIB_POWERTUNE_Table *)
>>>>> -					(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> -				adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> maximum_power_delivery_limit = 255;
>>>>> -				pt = &ppt->power_tune_table;
>>>>> -			}
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table->tdp =
>>>> le16_to_cpu(pt->usTDP);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> configurable_tdp =
>>>>> -				le16_to_cpu(pt->usConfigurableTDP);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table->tdc =
>>>> le16_to_cpu(pt->usTDC);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> battery_power_limit =
>>>>> -				le16_to_cpu(pt->usBatteryPowerLimit);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> small_power_limit =
>>>>> -				le16_to_cpu(pt->usSmallPowerLimit);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> low_cac_leakage =
>>>>> -				le16_to_cpu(pt->usLowCACLeakage);
>>>>> -			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> high_cac_leakage =
>>>>> -				le16_to_cpu(pt->usHighCACLeakage);
>>>>> -		}
>>>>> -		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8) &&
>>>>> -				ext_hdr->usSclkVddgfxTableOffset) {
>>>>> -			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> -				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> -				 le16_to_cpu(ext_hdr-
>>>>> usSclkVddgfxTableOffset));
>>>>> -			ret = amdgpu_parse_clk_voltage_dep_table(
>>>>> -					&adev-
>>>>> pm.dpm.dyn_state.vddgfx_dependency_on_sclk,
>>>>> -					dep_table);
>>>>> -			if (ret) {
>>>>> -				kfree(adev-
>>>>> pm.dpm.dyn_state.vddgfx_dependency_on_sclk.entries);
>>>>> -				return ret;
>>>>> -			}
>>>>> -		}
>>>>> -	}
>>>>> -
>>>>> -	return 0;
>>>>> -}
>>>>> -
>>>>> -void amdgpu_free_extended_power_table(struct amdgpu_device
>> *adev)
>>>>> -{
>>>>> -	struct amdgpu_dpm_dynamic_state *dyn_state = &adev-
>>>>> pm.dpm.dyn_state;
>>>>> -
>>>>> -	kfree(dyn_state->vddc_dependency_on_sclk.entries);
>>>>> -	kfree(dyn_state->vddci_dependency_on_mclk.entries);
>>>>> -	kfree(dyn_state->vddc_dependency_on_mclk.entries);
>>>>> -	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
>>>>> -	kfree(dyn_state->cac_leakage_table.entries);
>>>>> -	kfree(dyn_state->phase_shedding_limits_table.entries);
>>>>> -	kfree(dyn_state->ppm_table);
>>>>> -	kfree(dyn_state->cac_tdp_table);
>>>>> -	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
>>>>> -	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
>>>>> -	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
>>>>> -	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
>>>>> -	kfree(dyn_state->vddgfx_dependency_on_sclk.entries);
>>>>> -}
>>>>> -
>>>>> -static const char *pp_lib_thermal_controller_names[] = {
>>>>> -	"NONE",
>>>>> -	"lm63",
>>>>> -	"adm1032",
>>>>> -	"adm1030",
>>>>> -	"max6649",
>>>>> -	"lm64",
>>>>> -	"f75375",
>>>>> -	"RV6xx",
>>>>> -	"RV770",
>>>>> -	"adt7473",
>>>>> -	"NONE",
>>>>> -	"External GPIO",
>>>>> -	"Evergreen",
>>>>> -	"emc2103",
>>>>> -	"Sumo",
>>>>> -	"Northern Islands",
>>>>> -	"Southern Islands",
>>>>> -	"lm96163",
>>>>> -	"Sea Islands",
>>>>> -	"Kaveri/Kabini",
>>>>> -};
>>>>> -
>>>>> -void amdgpu_add_thermal_controller(struct amdgpu_device *adev)
>>>>> -{
>>>>> -	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> -	ATOM_PPLIB_POWERPLAYTABLE *power_table;
>>>>> -	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> -	ATOM_PPLIB_THERMALCONTROLLER *controller;
>>>>> -	struct amdgpu_i2c_bus_rec i2c_bus;
>>>>> -	u16 data_offset;
>>>>> -	u8 frev, crev;
>>>>> -
>>>>> -	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> -				   &frev, &crev, &data_offset))
>>>>> -		return;
>>>>> -	power_table = (ATOM_PPLIB_POWERPLAYTABLE *)
>>>>> -		(mode_info->atom_context->bios + data_offset);
>>>>> -	controller = &power_table->sThermalController;
>>>>> -
>>>>> -	/* add the i2c bus for thermal/fan chip */
>>>>> -	if (controller->ucType > 0) {
>>>>> -		if (controller->ucFanParameters &
>>>> ATOM_PP_FANPARAMETERS_NOFAN)
>>>>> -			adev->pm.no_fan = true;
>>>>> -		adev->pm.fan_pulses_per_revolution =
>>>>> -			controller->ucFanParameters &
>>>>
>> ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_M
>>>> ASK;
>>>>> -		if (adev->pm.fan_pulses_per_revolution) {
>>>>> -			adev->pm.fan_min_rpm = controller->ucFanMinRPM;
>>>>> -			adev->pm.fan_max_rpm = controller-
>>>>> ucFanMaxRPM;
>>>>> -		}
>>>>> -		if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_RV6xx) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_RV6XX;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_RV770) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_RV770;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_EVERGREEN) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EVERGREEN;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_SUMO) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_SUMO;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_NISLANDS) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type = THERMAL_TYPE_NI;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_SISLANDS) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type = THERMAL_TYPE_SI;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_CISLANDS) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type = THERMAL_TYPE_CI;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_KAVERI) {
>>>>> -			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type = THERMAL_TYPE_KV;
>>>>> -		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_EXTERNAL_GPIO) {
>>>>> -			DRM_INFO("External GPIO thermal controller %s fan
>>>> control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EXTERNAL_GPIO;
>>>>> -		} else if (controller->ucType ==
>>>>> -
>>>> ATOM_PP_THERMALCONTROLLER_ADT7473_WITH_INTERNAL) {
>>>>> -			DRM_INFO("ADT7473 with internal thermal
>>>> controller %s fan control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_ADT7473_WITH_INTERNAL;
>>>>> -		} else if (controller->ucType ==
>>>>> -
>>>> ATOM_PP_THERMALCONTROLLER_EMC2103_WITH_INTERNAL) {
>>>>> -			DRM_INFO("EMC2103 with internal thermal
>>>> controller %s fan control\n",
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EMC2103_WITH_INTERNAL;
>>>>> -		} else if (controller->ucType <
>>>> ARRAY_SIZE(pp_lib_thermal_controller_names)) {
>>>>> -			DRM_INFO("Possible %s thermal controller at
>>>> 0x%02x %s fan control\n",
>>>>> -
>>>> pp_lib_thermal_controller_names[controller->ucType],
>>>>> -				 controller->ucI2cAddress >> 1,
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EXTERNAL;
>>>>> -			i2c_bus = amdgpu_atombios_lookup_i2c_gpio(adev,
>>>> controller->ucI2cLine);
>>>>> -			adev->pm.i2c_bus = amdgpu_i2c_lookup(adev,
>>>> &i2c_bus);
>>>>> -			if (adev->pm.i2c_bus) {
>>>>> -				struct i2c_board_info info = { };
>>>>> -				const char *name =
>>>> pp_lib_thermal_controller_names[controller->ucType];
>>>>> -				info.addr = controller->ucI2cAddress >> 1;
>>>>> -				strlcpy(info.type, name, sizeof(info.type));
>>>>> -				i2c_new_client_device(&adev->pm.i2c_bus-
>>>>> adapter, &info);
>>>>> -			}
>>>>> -		} else {
>>>>> -			DRM_INFO("Unknown thermal controller type %d at
>>>> 0x%02x %s fan control\n",
>>>>> -				 controller->ucType,
>>>>> -				 controller->ucI2cAddress >> 1,
>>>>> -				 (controller->ucFanParameters &
>>>>> -				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> -		}
>>>>> -	}
>>>>> -}
>>>>> -
>>>>> -struct amd_vce_state*
>>>>> -amdgpu_get_vce_clock_state(void *handle, u32 idx)
>>>>> -{
>>>>> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>>> -
>>>>> -	if (idx < adev->pm.dpm.num_of_vce_states)
>>>>> -		return &adev->pm.dpm.vce_states[idx];
>>>>> -
>>>>> -	return NULL;
>>>>> -}
>>>>> -
>>>>>     int amdgpu_dpm_get_sclk(struct amdgpu_device *adev, bool low)
>>>>>     {
>>>>>     	const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
>>>>> @@ -1243,211 +465,6 @@ void
>>>> amdgpu_dpm_thermal_work_handler(struct work_struct *work)
>>>>>     	amdgpu_pm_compute_clocks(adev);
>>>>>     }
>>>>>
>>>>> -static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct
>>>> amdgpu_device *adev,
>>>>> -						     enum
>>>> amd_pm_state_type dpm_state)
>>>>> -{
>>>>> -	int i;
>>>>> -	struct amdgpu_ps *ps;
>>>>> -	u32 ui_class;
>>>>> -	bool single_display = (adev->pm.dpm.new_active_crtc_count < 2) ?
>>>>> -		true : false;
>>>>> -
>>>>> -	/* check if the vblank period is too short to adjust the mclk */
>>>>> -	if (single_display && adev->powerplay.pp_funcs->vblank_too_short)
>>>> {
>>>>> -		if (amdgpu_dpm_vblank_too_short(adev))
>>>>> -			single_display = false;
>>>>> -	}
>>>>> -
>>>>> -	/* certain older asics have a separare 3D performance state,
>>>>> -	 * so try that first if the user selected performance
>>>>> -	 */
>>>>> -	if (dpm_state == POWER_STATE_TYPE_PERFORMANCE)
>>>>> -		dpm_state = POWER_STATE_TYPE_INTERNAL_3DPERF;
>>>>> -	/* balanced states don't exist at the moment */
>>>>> -	if (dpm_state == POWER_STATE_TYPE_BALANCED)
>>>>> -		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> -
>>>>> -restart_search:
>>>>> -	/* Pick the best power state based on current conditions */
>>>>> -	for (i = 0; i < adev->pm.dpm.num_ps; i++) {
>>>>> -		ps = &adev->pm.dpm.ps[i];
>>>>> -		ui_class = ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_UI_MASK;
>>>>> -		switch (dpm_state) {
>>>>> -		/* user states */
>>>>> -		case POWER_STATE_TYPE_BATTERY:
>>>>> -			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_BATTERY) {
>>>>> -				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> -					if (single_display)
>>>>> -						return ps;
>>>>> -				} else
>>>>> -					return ps;
>>>>> -			}
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_BALANCED:
>>>>> -			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_BALANCED) {
>>>>> -				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> -					if (single_display)
>>>>> -						return ps;
>>>>> -				} else
>>>>> -					return ps;
>>>>> -			}
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_PERFORMANCE:
>>>>> -			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE) {
>>>>> -				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> -					if (single_display)
>>>>> -						return ps;
>>>>> -				} else
>>>>> -					return ps;
>>>>> -			}
>>>>> -			break;
>>>>> -		/* internal states */
>>>>> -		case POWER_STATE_TYPE_INTERNAL_UVD:
>>>>> -			if (adev->pm.dpm.uvd_ps)
>>>>> -				return adev->pm.dpm.uvd_ps;
>>>>> -			else
>>>>> -				break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_UVD_SD:
>>>>> -			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_SDSTATE)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_UVD_HD:
>>>>> -			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_HDSTATE)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
>>>>> -			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_HD2STATE)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
>>>>> -			if (ps->class2 &
>>>> ATOM_PPLIB_CLASSIFICATION2_MVC)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_BOOT:
>>>>> -			return adev->pm.dpm.boot_ps;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_THERMAL:
>>>>> -			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_THERMAL)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_ACPI:
>>>>> -			if (ps->class & ATOM_PPLIB_CLASSIFICATION_ACPI)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_ULV:
>>>>> -			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		case POWER_STATE_TYPE_INTERNAL_3DPERF:
>>>>> -			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
>>>>> -				return ps;
>>>>> -			break;
>>>>> -		default:
>>>>> -			break;
>>>>> -		}
>>>>> -	}
>>>>> -	/* use a fallback state if we didn't match */
>>>>> -	switch (dpm_state) {
>>>>> -	case POWER_STATE_TYPE_INTERNAL_UVD_SD:
>>>>> -		dpm_state = POWER_STATE_TYPE_INTERNAL_UVD_HD;
>>>>> -		goto restart_search;
>>>>> -	case POWER_STATE_TYPE_INTERNAL_UVD_HD:
>>>>> -	case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
>>>>> -	case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
>>>>> -		if (adev->pm.dpm.uvd_ps) {
>>>>> -			return adev->pm.dpm.uvd_ps;
>>>>> -		} else {
>>>>> -			dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> -			goto restart_search;
>>>>> -		}
>>>>> -	case POWER_STATE_TYPE_INTERNAL_THERMAL:
>>>>> -		dpm_state = POWER_STATE_TYPE_INTERNAL_ACPI;
>>>>> -		goto restart_search;
>>>>> -	case POWER_STATE_TYPE_INTERNAL_ACPI:
>>>>> -		dpm_state = POWER_STATE_TYPE_BATTERY;
>>>>> -		goto restart_search;
>>>>> -	case POWER_STATE_TYPE_BATTERY:
>>>>> -	case POWER_STATE_TYPE_BALANCED:
>>>>> -	case POWER_STATE_TYPE_INTERNAL_3DPERF:
>>>>> -		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> -		goto restart_search;
>>>>> -	default:
>>>>> -		break;
>>>>> -	}
>>>>> -
>>>>> -	return NULL;
>>>>> -}
>>>>> -
>>>>> -static void amdgpu_dpm_change_power_state_locked(struct
>>>> amdgpu_device *adev)
>>>>> -{
>>>>> -	struct amdgpu_ps *ps;
>>>>> -	enum amd_pm_state_type dpm_state;
>>>>> -	int ret;
>>>>> -	bool equal = false;
>>>>> -
>>>>> -	/* if dpm init failed */
>>>>> -	if (!adev->pm.dpm_enabled)
>>>>> -		return;
>>>>> -
>>>>> -	if (adev->pm.dpm.user_state != adev->pm.dpm.state) {
>>>>> -		/* add other state override checks here */
>>>>> -		if ((!adev->pm.dpm.thermal_active) &&
>>>>> -		    (!adev->pm.dpm.uvd_active))
>>>>> -			adev->pm.dpm.state = adev->pm.dpm.user_state;
>>>>> -	}
>>>>> -	dpm_state = adev->pm.dpm.state;
>>>>> -
>>>>> -	ps = amdgpu_dpm_pick_power_state(adev, dpm_state);
>>>>> -	if (ps)
>>>>> -		adev->pm.dpm.requested_ps = ps;
>>>>> -	else
>>>>> -		return;
>>>>> -
>>>>> -	if (amdgpu_dpm == 1 && adev->powerplay.pp_funcs-
>>>>> print_power_state) {
>>>>> -		printk("switching from power state:\n");
>>>>> -		amdgpu_dpm_print_power_state(adev, adev-
>>>>> pm.dpm.current_ps);
>>>>> -		printk("switching to power state:\n");
>>>>> -		amdgpu_dpm_print_power_state(adev, adev-
>>>>> pm.dpm.requested_ps);
>>>>> -	}
>>>>> -
>>>>> -	/* update whether vce is active */
>>>>> -	ps->vce_active = adev->pm.dpm.vce_active;
>>>>> -	if (adev->powerplay.pp_funcs->display_configuration_changed)
>>>>> -		amdgpu_dpm_display_configuration_changed(adev);
>>>>> -
>>>>> -	ret = amdgpu_dpm_pre_set_power_state(adev);
>>>>> -	if (ret)
>>>>> -		return;
>>>>> -
>>>>> -	if (adev->powerplay.pp_funcs->check_state_equal) {
>>>>> -		if (0 != amdgpu_dpm_check_state_equal(adev, adev-
>>>>> pm.dpm.current_ps, adev->pm.dpm.requested_ps, &equal))
>>>>> -			equal = false;
>>>>> -	}
>>>>> -
>>>>> -	if (equal)
>>>>> -		return;
>>>>> -
>>>>> -	if (adev->powerplay.pp_funcs->set_power_state)
>>>>> -		adev->powerplay.pp_funcs->set_power_state(adev-
>>>>> powerplay.pp_handle);
>>>>> -
>>>>> -	amdgpu_dpm_post_set_power_state(adev);
>>>>> -
>>>>> -	adev->pm.dpm.current_active_crtcs = adev-
>>>>> pm.dpm.new_active_crtcs;
>>>>> -	adev->pm.dpm.current_active_crtc_count = adev-
>>>>> pm.dpm.new_active_crtc_count;
>>>>> -
>>>>> -	if (adev->powerplay.pp_funcs->force_performance_level) {
>>>>> -		if (adev->pm.dpm.thermal_active) {
>>>>> -			enum amd_dpm_forced_level level = adev-
>>>>> pm.dpm.forced_level;
>>>>> -			/* force low perf level for thermal */
>>>>> -			amdgpu_dpm_force_performance_level(adev,
>>>> AMD_DPM_FORCED_LEVEL_LOW);
>>>>> -			/* save the user's level */
>>>>> -			adev->pm.dpm.forced_level = level;
>>>>> -		} else {
>>>>> -			/* otherwise, user selected level */
>>>>> -			amdgpu_dpm_force_performance_level(adev,
>>>> adev->pm.dpm.forced_level);
>>>>> -		}
>>>>> -	}
>>>>> -}
>>>>> -
>>>>>     void amdgpu_pm_compute_clocks(struct amdgpu_device *adev)
>>>>>     {
>>>>
>>>> Rename to amdgpu_dpm_compute_clocks?
>>> [Quan, Evan] Sure, I can do that.
>>>>
>>>>>     	int i = 0;
>>>>> @@ -1464,9 +481,12 @@ void amdgpu_pm_compute_clocks(struct
>>>> amdgpu_device *adev)
>>>>>     			amdgpu_fence_wait_empty(ring);
>>>>>     	}
>>>>>
>>>>> -	if (adev->powerplay.pp_funcs->dispatch_tasks) {
>>>>> +	if ((adev->family == AMDGPU_FAMILY_SI) ||
>>>>> +	     (adev->family == AMDGPU_FAMILY_KV)) {
>>>>> +		amdgpu_dpm_get_active_displays(adev);
>>>>> +		adev->powerplay.pp_funcs->change_power_state(adev-
>>>>> powerplay.pp_handle);
>>>>
>>>> It would be clearer if the newly added logic in this function is in
>>>> another patch. This does more than what the patch subject says.
>>> [Quan, Evan] Actually there are no new logic added. These are for "!adev-
>>> powerplay.pp_funcs->dispatch_tasks".
>>> Considering there are actually only SI and KV which do not have -
>>> dispatch_tasks() implemented.
>>> So, I used "((adev->family == AMDGPU_FAMILY_SI) ||(adev->family ==
>> AMDGPU_FAMILY_KV))" here.
>>> Maybe i should stick with "!adev->powerplay.pp_funcs->dispatch_tasks"?
>>
>> This change also adds a new callback change_power_state(). I interpreted
>> it as something different from what the patch subject says.
>>
>>>>
>>>>> +	} else {
>>>>>     		if (!amdgpu_device_has_dc_support(adev)) {
>>>>> -			mutex_lock(&adev->pm.mutex);
>>>>>     			amdgpu_dpm_get_active_displays(adev);
>>>>>     			adev->pm.pm_display_cfg.num_display = adev-
>>>>> pm.dpm.new_active_crtc_count;
>>>>>     			adev->pm.pm_display_cfg.vrefresh =
>>>> amdgpu_dpm_get_vrefresh(adev);
>>>>> @@ -1480,14 +500,8 @@ void amdgpu_pm_compute_clocks(struct
>>>> amdgpu_device *adev)
>>>>>     				adev->powerplay.pp_funcs-
>>>>> display_configuration_change(
>>>>>     							adev-
>>>>> powerplay.pp_handle,
>>>>>     							&adev-
>>>>> pm.pm_display_cfg);
>>>>> -			mutex_unlock(&adev->pm.mutex);
>>>>>     		}
>>>>>     		amdgpu_dpm_dispatch_task(adev,
>>>> AMD_PP_TASK_DISPLAY_CONFIG_CHANGE, NULL);
>>>>> -	} else {
>>>>> -		mutex_lock(&adev->pm.mutex);
>>>>> -		amdgpu_dpm_get_active_displays(adev);
>>>>> -		amdgpu_dpm_change_power_state_locked(adev);
>>>>> -		mutex_unlock(&adev->pm.mutex);
>>>>>     	}
>>>>>     }
>>>>>
>>>>> @@ -1550,18 +564,6 @@ void amdgpu_dpm_enable_vce(struct
>>>> amdgpu_device *adev, bool enable)
>>>>>     	}
>>>>>     }
>>>>>
>>>>> -void amdgpu_pm_print_power_states(struct amdgpu_device *adev)
>>>>> -{
>>>>> -	int i;
>>>>> -
>>>>> -	if (adev->powerplay.pp_funcs->print_power_state == NULL)
>>>>> -		return;
>>>>> -
>>>>> -	for (i = 0; i < adev->pm.dpm.num_ps; i++)
>>>>> -		amdgpu_dpm_print_power_state(adev, &adev-
>>>>> pm.dpm.ps[i]);
>>>>> -
>>>>> -}
>>>>> -
>>>>>     void amdgpu_dpm_enable_jpeg(struct amdgpu_device *adev, bool
>>>> enable)
>>>>>     {
>>>>>     	int ret = 0;
>>>>> diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>> b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>>> index 01120b302590..295d2902aef7 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>>> +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
>>>>> @@ -366,24 +366,10 @@ enum amdgpu_display_gap
>>>>>         AMDGPU_PM_DISPLAY_GAP_IGNORE       = 3,
>>>>>     };
>>>>>
>>>>> -void amdgpu_dpm_print_class_info(u32 class, u32 class2);
>>>>> -void amdgpu_dpm_print_cap_info(u32 caps);
>>>>> -void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
>>>>> -				struct amdgpu_ps *rps);
>>>>>     u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev);
>>>>>     int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum
>>>> amd_pp_sensors sensor,
>>>>>     			   void *data, uint32_t *size);
>>>>>
>>>>> -int amdgpu_get_platform_caps(struct amdgpu_device *adev);
>>>>> -
>>>>> -int amdgpu_parse_extended_power_table(struct amdgpu_device
>> *adev);
>>>>> -void amdgpu_free_extended_power_table(struct amdgpu_device
>>>> *adev);
>>>>> -
>>>>> -void amdgpu_add_thermal_controller(struct amdgpu_device *adev);
>>>>> -
>>>>> -struct amd_vce_state*
>>>>> -amdgpu_get_vce_clock_state(void *handle, u32 idx);
>>>>> -
>>>>>     int amdgpu_dpm_set_powergating_by_smu(struct amdgpu_device
>>>> *adev,
>>>>>     				      uint32_t block_type, bool gate);
>>>>>
>>>>> @@ -438,7 +424,6 @@ void amdgpu_pm_compute_clocks(struct
>>>> amdgpu_device *adev);
>>>>>     void amdgpu_dpm_enable_uvd(struct amdgpu_device *adev, bool
>>>> enable);
>>>>>     void amdgpu_dpm_enable_vce(struct amdgpu_device *adev, bool
>>>> enable);
>>>>>     void amdgpu_dpm_enable_jpeg(struct amdgpu_device *adev, bool
>>>> enable);
>>>>> -void amdgpu_pm_print_power_states(struct amdgpu_device *adev);
>>>>>     int amdgpu_pm_load_smu_firmware(struct amdgpu_device *adev,
>>>> uint32_t *smu_version);
>>>>>     int amdgpu_dpm_set_light_sbr(struct amdgpu_device *adev, bool
>>>> enable);
>>>>>     int amdgpu_dpm_send_hbm_bad_pages_num(struct amdgpu_device
>>>> *adev, uint32_t size);
>>>>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/Makefile
>>>> b/drivers/gpu/drm/amd/pm/powerplay/Makefile
>>>>> index 0fb114adc79f..614d8b6a58ad 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/powerplay/Makefile
>>>>> +++ b/drivers/gpu/drm/amd/pm/powerplay/Makefile
>>>>> @@ -28,7 +28,7 @@ AMD_POWERPLAY = $(addsuffix
>>>> /Makefile,$(addprefix $(FULL_AMD_PATH)/pm/powerplay/
>>>>>
>>>>>     include $(AMD_POWERPLAY)
>>>>>
>>>>> -POWER_MGR-y = amd_powerplay.o
>>>>> +POWER_MGR-y = amd_powerplay.o legacy_dpm.o
>>>>>
>>>>>     POWER_MGR-$(CONFIG_DRM_AMDGPU_CIK)+= kv_dpm.o kv_smc.o
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
>>>> b/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
>>>>> index 380a5336c74f..90f4c65659e2 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/powerplay/kv_dpm.c
>>>>> @@ -36,6 +36,7 @@
>>>>>
>>>>>     #include "gca/gfx_7_2_d.h"
>>>>>     #include "gca/gfx_7_2_sh_mask.h"
>>>>> +#include "legacy_dpm.h"
>>>>>
>>>>>     #define KV_MAX_DEEPSLEEP_DIVIDER_ID     5
>>>>>     #define KV_MINIMUM_ENGINE_CLOCK         800
>>>>> @@ -3389,6 +3390,7 @@ static const struct amd_pm_funcs
>> kv_dpm_funcs
>>>> = {
>>>>>     	.get_vce_clock_state = amdgpu_get_vce_clock_state,
>>>>>     	.check_state_equal = kv_check_state_equal,
>>>>>     	.read_sensor = &kv_dpm_read_sensor,
>>>>> +	.change_power_state = amdgpu_dpm_change_power_state_locked,
>>>>>     };
>>>>>
>>>>>     static const struct amdgpu_irq_src_funcs kv_dpm_irq_funcs = {
>>>>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
>>>> b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
>>>>
>>>> This could get confused with all APIs that support legacy dpms. This
>>>> file has only a subset of APIs to support legacy dpm. Needs a better
>>>> name - powerplay_ctrl/powerplay_util ?
>>> [Quan, Evan] The "legacy_dpm" refers for those logics used only by
>> si/kv(si_dpm.c, kv_dpm.c).
>>> Considering these logics are not used at default(radeon driver instead of
>> amdgpu driver is used to support those legacy ASICs at default).
>>> We might drop support for them from our amdgpu driver. So, I gather all
>> those APIs and put them in a new holder.
>>> Maybe you wrongly treat it as a new holder for powerplay APIs(used by
>> VI/AI)?
>>
>> As it got moved under powerplay, I thought they were also used in AI/VI
>> powerplay. Otherwise, move si/kv along with this out of powerplay and
>> keep them separate.
>>
>> Thanks,
>> Lijo
>>
>>>
>>> BR
>>> Evan
>>>>
>>>> Thanks,
>>>> Lijo
>>>>
>>>>> new file mode 100644
>>>>> index 000000000000..9427c1026e1d
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.c
>>>>> @@ -0,0 +1,1453 @@
>>>>> +/*
>>>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person obtaining
>> a
>>>>> + * copy of this software and associated documentation files (the
>>>> "Software"),
>>>>> + * to deal in the Software without restriction, including without
>> limitation
>>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>>> + * and/or sell copies of the Software, and to permit persons to whom
>> the
>>>>> + * Software is furnished to do so, subject to the following conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be
>> included
>>>> in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>> KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN
>>>> NO EVENT SHALL
>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>>>> DAMAGES OR
>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>> OTHERWISE,
>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
>> OR
>>>> THE USE OR
>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> + */
>>>>> +
>>>>> +#include "amdgpu.h"
>>>>> +#include "amdgpu_atombios.h"
>>>>> +#include "amdgpu_i2c.h"
>>>>> +#include "atom.h"
>>>>> +#include "amd_pcie.h"
>>>>> +#include "legacy_dpm.h"
>>>>> +
>>>>> +#define amdgpu_dpm_pre_set_power_state(adev) \
>>>>> +		((adev)->powerplay.pp_funcs-
>>>>> pre_set_power_state((adev)->powerplay.pp_handle))
>>>>> +
>>>>> +#define amdgpu_dpm_post_set_power_state(adev) \
>>>>> +		((adev)->powerplay.pp_funcs-
>>>>> post_set_power_state((adev)->powerplay.pp_handle))
>>>>> +
>>>>> +#define amdgpu_dpm_display_configuration_changed(adev) \
>>>>> +		((adev)->powerplay.pp_funcs-
>>>>> display_configuration_changed((adev)->powerplay.pp_handle))
>>>>> +
>>>>> +#define amdgpu_dpm_print_power_state(adev, ps) \
>>>>> +		((adev)->powerplay.pp_funcs->print_power_state((adev)-
>>>>> powerplay.pp_handle, (ps)))
>>>>> +
>>>>> +#define amdgpu_dpm_vblank_too_short(adev) \
>>>>> +		((adev)->powerplay.pp_funcs->vblank_too_short((adev)-
>>>>> powerplay.pp_handle))
>>>>> +
>>>>> +#define amdgpu_dpm_check_state_equal(adev, cps, rps, equal) \
>>>>> +		((adev)->powerplay.pp_funcs->check_state_equal((adev)-
>>>>> powerplay.pp_handle, (cps), (rps), (equal)))
>>>>> +
>>>>> +int amdgpu_atombios_get_memory_pll_dividers(struct
>> amdgpu_device
>>>> *adev,
>>>>> +					    u32 clock,
>>>>> +					    bool strobe_mode,
>>>>> +					    struct atom_mpll_param
>>>> *mpll_param)
>>>>> +{
>>>>> +	COMPUTE_MEMORY_CLOCK_PARAM_PARAMETERS_V2_1 args;
>>>>> +	int index = GetIndexIntoMasterTable(COMMAND,
>>>> ComputeMemoryClockParam);
>>>>> +	u8 frev, crev;
>>>>> +
>>>>> +	memset(&args, 0, sizeof(args));
>>>>> +	memset(mpll_param, 0, sizeof(struct atom_mpll_param));
>>>>> +
>>>>> +	if (!amdgpu_atom_parse_cmd_header(adev-
>>>>> mode_info.atom_context, index, &frev, &crev))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	switch (frev) {
>>>>> +	case 2:
>>>>> +		switch (crev) {
>>>>> +		case 1:
>>>>> +			/* SI */
>>>>> +			args.ulClock = cpu_to_le32(clock);	/* 10 khz */
>>>>> +			args.ucInputFlag = 0;
>>>>> +			if (strobe_mode)
>>>>> +				args.ucInputFlag |=
>>>> MPLL_INPUT_FLAG_STROBE_MODE_EN;
>>>>> +
>>>>> +			amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> +
>>>>> +			mpll_param->clkfrac =
>>>> le16_to_cpu(args.ulFbDiv.usFbDivFrac);
>>>>> +			mpll_param->clkf =
>>>> le16_to_cpu(args.ulFbDiv.usFbDiv);
>>>>> +			mpll_param->post_div = args.ucPostDiv;
>>>>> +			mpll_param->dll_speed = args.ucDllSpeed;
>>>>> +			mpll_param->bwcntl = args.ucBWCntl;
>>>>> +			mpll_param->vco_mode =
>>>>> +				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_VCO_MODE_MASK);
>>>>> +			mpll_param->yclk_sel =
>>>>> +				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_BYPASS_DQ_PLL) ? 1 : 0;
>>>>> +			mpll_param->qdr =
>>>>> +				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_QDR_ENABLE) ? 1 : 0;
>>>>> +			mpll_param->half_rate =
>>>>> +				(args.ucPllCntlFlag &
>>>> MPLL_CNTL_FLAG_AD_HALF_RATE) ? 1 : 0;
>>>>> +			break;
>>>>> +		default:
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +		break;
>>>>> +	default:
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +void amdgpu_atombios_set_engine_dram_timings(struct
>>>> amdgpu_device *adev,
>>>>> +					     u32 eng_clock, u32 mem_clock)
>>>>> +{
>>>>> +	SET_ENGINE_CLOCK_PS_ALLOCATION args;
>>>>> +	int index = GetIndexIntoMasterTable(COMMAND,
>>>> DynamicMemorySettings);
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	memset(&args, 0, sizeof(args));
>>>>> +
>>>>> +	tmp = eng_clock & SET_CLOCK_FREQ_MASK;
>>>>> +	tmp |= (COMPUTE_ENGINE_PLL_PARAM << 24);
>>>>> +
>>>>> +	args.ulTargetEngineClock = cpu_to_le32(tmp);
>>>>> +	if (mem_clock)
>>>>> +		args.sReserved.ulClock = cpu_to_le32(mem_clock &
>>>> SET_CLOCK_FREQ_MASK);
>>>>> +
>>>>> +	amdgpu_atom_execute_table(adev->mode_info.atom_context,
>>>> index, (uint32_t *)&args);
>>>>> +}
>>>>> +
>>>>> +union firmware_info {
>>>>> +	ATOM_FIRMWARE_INFO info;
>>>>> +	ATOM_FIRMWARE_INFO_V1_2 info_12;
>>>>> +	ATOM_FIRMWARE_INFO_V1_3 info_13;
>>>>> +	ATOM_FIRMWARE_INFO_V1_4 info_14;
>>>>> +	ATOM_FIRMWARE_INFO_V2_1 info_21;
>>>>> +	ATOM_FIRMWARE_INFO_V2_2 info_22;
>>>>> +};
>>>>> +
>>>>> +void amdgpu_atombios_get_default_voltages(struct amdgpu_device
>>>> *adev,
>>>>> +					  u16 *vddc, u16 *vddci, u16 *mvdd)
>>>>> +{
>>>>> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> +	int index = GetIndexIntoMasterTable(DATA, FirmwareInfo);
>>>>> +	u8 frev, crev;
>>>>> +	u16 data_offset;
>>>>> +	union firmware_info *firmware_info;
>>>>> +
>>>>> +	*vddc = 0;
>>>>> +	*vddci = 0;
>>>>> +	*mvdd = 0;
>>>>> +
>>>>> +	if (amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> +				   &frev, &crev, &data_offset)) {
>>>>> +		firmware_info =
>>>>> +			(union firmware_info *)(mode_info->atom_context-
>>>>> bios +
>>>>> +						data_offset);
>>>>> +		*vddc = le16_to_cpu(firmware_info-
>>>>> info_14.usBootUpVDDCVoltage);
>>>>> +		if ((frev == 2) && (crev >= 2)) {
>>>>> +			*vddci = le16_to_cpu(firmware_info-
>>>>> info_22.usBootUpVDDCIVoltage);
>>>>> +			*mvdd = le16_to_cpu(firmware_info-
>>>>> info_22.usBootUpMVDDCVoltage);
>>>>> +		}
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +union set_voltage {
>>>>> +	struct _SET_VOLTAGE_PS_ALLOCATION alloc;
>>>>> +	struct _SET_VOLTAGE_PARAMETERS v1;
>>>>> +	struct _SET_VOLTAGE_PARAMETERS_V2 v2;
>>>>> +	struct _SET_VOLTAGE_PARAMETERS_V1_3 v3;
>>>>> +};
>>>>> +
>>>>> +int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev,
>> u8
>>>> voltage_type,
>>>>> +			     u16 voltage_id, u16 *voltage)
>>>>> +{
>>>>> +	union set_voltage args;
>>>>> +	int index = GetIndexIntoMasterTable(COMMAND, SetVoltage);
>>>>> +	u8 frev, crev;
>>>>> +
>>>>> +	if (!amdgpu_atom_parse_cmd_header(adev-
>>>>> mode_info.atom_context, index, &frev, &crev))
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	switch (crev) {
>>>>> +	case 1:
>>>>> +		return -EINVAL;
>>>>> +	case 2:
>>>>> +		args.v2.ucVoltageType =
>>>> SET_VOLTAGE_GET_MAX_VOLTAGE;
>>>>> +		args.v2.ucVoltageMode = 0;
>>>>> +		args.v2.usVoltageLevel = 0;
>>>>> +
>>>>> +		amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> +
>>>>> +		*voltage = le16_to_cpu(args.v2.usVoltageLevel);
>>>>> +		break;
>>>>> +	case 3:
>>>>> +		args.v3.ucVoltageType = voltage_type;
>>>>> +		args.v3.ucVoltageMode = ATOM_GET_VOLTAGE_LEVEL;
>>>>> +		args.v3.usVoltageLevel = cpu_to_le16(voltage_id);
>>>>> +
>>>>> +		amdgpu_atom_execute_table(adev-
>>>>> mode_info.atom_context, index, (uint32_t *)&args);
>>>>> +
>>>>> +		*voltage = le16_to_cpu(args.v3.usVoltageLevel);
>>>>> +		break;
>>>>> +	default:
>>>>> +		DRM_ERROR("Unknown table version %d, %d\n", frev, crev);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +int
>> amdgpu_atombios_get_leakage_vddc_based_on_leakage_idx(struct
>>>> amdgpu_device *adev,
>>>>> +						      u16 *voltage,
>>>>> +						      u16 leakage_idx)
>>>>> +{
>>>>> +	return amdgpu_atombios_get_max_vddc(adev,
>>>> VOLTAGE_TYPE_VDDC, leakage_idx, voltage);
>>>>> +}
>>>>> +
>>>>> +union voltage_object_info {
>>>>> +	struct _ATOM_VOLTAGE_OBJECT_INFO v1;
>>>>> +	struct _ATOM_VOLTAGE_OBJECT_INFO_V2 v2;
>>>>> +	struct _ATOM_VOLTAGE_OBJECT_INFO_V3_1 v3;
>>>>> +};
>>>>> +
>>>>> +union voltage_object {
>>>>> +	struct _ATOM_VOLTAGE_OBJECT v1;
>>>>> +	struct _ATOM_VOLTAGE_OBJECT_V2 v2;
>>>>> +	union _ATOM_VOLTAGE_OBJECT_V3 v3;
>>>>> +};
>>>>> +
>>>>> +static ATOM_VOLTAGE_OBJECT_V3
>>>>
>> *amdgpu_atombios_lookup_voltage_object_v3(ATOM_VOLTAGE_OBJECT_I
>>>> NFO_V3_1 *v3,
>>>>> +									u8
>>>> voltage_type, u8 voltage_mode)
>>>>> +{
>>>>> +	u32 size = le16_to_cpu(v3->sHeader.usStructureSize);
>>>>> +	u32 offset = offsetof(ATOM_VOLTAGE_OBJECT_INFO_V3_1,
>>>> asVoltageObj[0]);
>>>>> +	u8 *start = (u8 *)v3;
>>>>> +
>>>>> +	while (offset < size) {
>>>>> +		ATOM_VOLTAGE_OBJECT_V3 *vo =
>>>> (ATOM_VOLTAGE_OBJECT_V3 *)(start + offset);
>>>>> +		if ((vo->asGpioVoltageObj.sHeader.ucVoltageType ==
>>>> voltage_type) &&
>>>>> +		    (vo->asGpioVoltageObj.sHeader.ucVoltageMode ==
>>>> voltage_mode))
>>>>> +			return vo;
>>>>> +		offset += le16_to_cpu(vo-
>>>>> asGpioVoltageObj.sHeader.usSize);
>>>>> +	}
>>>>> +	return NULL;
>>>>> +}
>>>>> +
>>>>> +int amdgpu_atombios_get_svi2_info(struct amdgpu_device *adev,
>>>>> +			      u8 voltage_type,
>>>>> +			      u8 *svd_gpio_id, u8 *svc_gpio_id)
>>>>> +{
>>>>> +	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> +	u8 frev, crev;
>>>>> +	u16 data_offset, size;
>>>>> +	union voltage_object_info *voltage_info;
>>>>> +	union voltage_object *voltage_object = NULL;
>>>>> +
>>>>> +	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> +				   &frev, &crev, &data_offset)) {
>>>>> +		voltage_info = (union voltage_object_info *)
>>>>> +			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> +
>>>>> +		switch (frev) {
>>>>> +		case 3:
>>>>> +			switch (crev) {
>>>>> +			case 1:
>>>>> +				voltage_object = (union voltage_object *)
>>>>> +
>>>> 	amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> +
>>>> voltage_type,
>>>>> +
>>>> VOLTAGE_OBJ_SVID2);
>>>>> +				if (voltage_object) {
>>>>> +					*svd_gpio_id = voltage_object-
>>>>> v3.asSVID2Obj.ucSVDGpioId;
>>>>> +					*svc_gpio_id = voltage_object-
>>>>> v3.asSVID2Obj.ucSVCGpioId;
>>>>> +				} else {
>>>>> +					return -EINVAL;
>>>>> +				}
>>>>> +				break;
>>>>> +			default:
>>>>> +				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> +				return -EINVAL;
>>>>> +			}
>>>>> +			break;
>>>>> +		default:
>>>>> +			DRM_ERROR("unknown voltage object table\n");
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +
>>>>> +	}
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +bool
>>>>> +amdgpu_atombios_is_voltage_gpio(struct amdgpu_device *adev,
>>>>> +				u8 voltage_type, u8 voltage_mode)
>>>>> +{
>>>>> +	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> +	u8 frev, crev;
>>>>> +	u16 data_offset, size;
>>>>> +	union voltage_object_info *voltage_info;
>>>>> +
>>>>> +	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> +				   &frev, &crev, &data_offset)) {
>>>>> +		voltage_info = (union voltage_object_info *)
>>>>> +			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> +
>>>>> +		switch (frev) {
>>>>> +		case 3:
>>>>> +			switch (crev) {
>>>>> +			case 1:
>>>>> +				if
>>>> (amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> +
>>>> voltage_type, voltage_mode))
>>>>> +					return true;
>>>>> +				break;
>>>>> +			default:
>>>>> +				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> +				return false;
>>>>> +			}
>>>>> +			break;
>>>>> +		default:
>>>>> +			DRM_ERROR("unknown voltage object table\n");
>>>>> +			return false;
>>>>> +		}
>>>>> +
>>>>> +	}
>>>>> +	return false;
>>>>> +}
>>>>> +
>>>>> +int amdgpu_atombios_get_voltage_table(struct amdgpu_device
>> *adev,
>>>>> +				      u8 voltage_type, u8 voltage_mode,
>>>>> +				      struct atom_voltage_table *voltage_table)
>>>>> +{
>>>>> +	int index = GetIndexIntoMasterTable(DATA, VoltageObjectInfo);
>>>>> +	u8 frev, crev;
>>>>> +	u16 data_offset, size;
>>>>> +	int i;
>>>>> +	union voltage_object_info *voltage_info;
>>>>> +	union voltage_object *voltage_object = NULL;
>>>>> +
>>>>> +	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> +				   &frev, &crev, &data_offset)) {
>>>>> +		voltage_info = (union voltage_object_info *)
>>>>> +			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> +
>>>>> +		switch (frev) {
>>>>> +		case 3:
>>>>> +			switch (crev) {
>>>>> +			case 1:
>>>>> +				voltage_object = (union voltage_object *)
>>>>> +
>>>> 	amdgpu_atombios_lookup_voltage_object_v3(&voltage_info->v3,
>>>>> +
>>>> voltage_type, voltage_mode);
>>>>> +				if (voltage_object) {
>>>>> +					ATOM_GPIO_VOLTAGE_OBJECT_V3
>>>> *gpio =
>>>>> +						&voltage_object-
>>>>> v3.asGpioVoltageObj;
>>>>> +					VOLTAGE_LUT_ENTRY_V2 *lut;
>>>>> +					if (gpio->ucGpioEntryNum >
>>>> MAX_VOLTAGE_ENTRIES)
>>>>> +						return -EINVAL;
>>>>> +					lut = &gpio->asVolGpioLut[0];
>>>>> +					for (i = 0; i < gpio->ucGpioEntryNum;
>>>> i++) {
>>>>> +						voltage_table-
>>>>> entries[i].value =
>>>>> +							le16_to_cpu(lut-
>>>>> usVoltageValue);
>>>>> +						voltage_table-
>>>>> entries[i].smio_low =
>>>>> +							le32_to_cpu(lut-
>>>>> ulVoltageId);
>>>>> +						lut =
>>>> (VOLTAGE_LUT_ENTRY_V2 *)
>>>>> +							((u8 *)lut +
>>>> sizeof(VOLTAGE_LUT_ENTRY_V2));
>>>>> +					}
>>>>> +					voltage_table->mask_low =
>>>> le32_to_cpu(gpio->ulGpioMaskVal);
>>>>> +					voltage_table->count = gpio-
>>>>> ucGpioEntryNum;
>>>>> +					voltage_table->phase_delay = gpio-
>>>>> ucPhaseDelay;
>>>>> +					return 0;
>>>>> +				}
>>>>> +				break;
>>>>> +			default:
>>>>> +				DRM_ERROR("unknown voltage object
>>>> table\n");
>>>>> +				return -EINVAL;
>>>>> +			}
>>>>> +			break;
>>>>> +		default:
>>>>> +			DRM_ERROR("unknown voltage object table\n");
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +	}
>>>>> +	return -EINVAL;
>>>>> +}
>>>>> +
>>>>> +union vram_info {
>>>>> +	struct _ATOM_VRAM_INFO_V3 v1_3;
>>>>> +	struct _ATOM_VRAM_INFO_V4 v1_4;
>>>>> +	struct _ATOM_VRAM_INFO_HEADER_V2_1 v2_1;
>>>>> +};
>>>>> +
>>>>> +#define MEM_ID_MASK           0xff000000
>>>>> +#define MEM_ID_SHIFT          24
>>>>> +#define CLOCK_RANGE_MASK      0x00ffffff
>>>>> +#define CLOCK_RANGE_SHIFT     0
>>>>> +#define LOW_NIBBLE_MASK       0xf
>>>>> +#define DATA_EQU_PREV         0
>>>>> +#define DATA_FROM_TABLE       4
>>>>> +
>>>>> +int amdgpu_atombios_init_mc_reg_table(struct amdgpu_device
>> *adev,
>>>>> +				      u8 module_index,
>>>>> +				      struct atom_mc_reg_table *reg_table)
>>>>> +{
>>>>> +	int index = GetIndexIntoMasterTable(DATA, VRAM_Info);
>>>>> +	u8 frev, crev, num_entries, t_mem_id, num_ranges = 0;
>>>>> +	u32 i = 0, j;
>>>>> +	u16 data_offset, size;
>>>>> +	union vram_info *vram_info;
>>>>> +
>>>>> +	memset(reg_table, 0, sizeof(struct atom_mc_reg_table));
>>>>> +
>>>>> +	if (amdgpu_atom_parse_data_header(adev-
>>>>> mode_info.atom_context, index, &size,
>>>>> +				   &frev, &crev, &data_offset)) {
>>>>> +		vram_info = (union vram_info *)
>>>>> +			(adev->mode_info.atom_context->bios +
>>>> data_offset);
>>>>> +		switch (frev) {
>>>>> +		case 1:
>>>>> +			DRM_ERROR("old table version %d, %d\n", frev,
>>>> crev);
>>>>> +			return -EINVAL;
>>>>> +		case 2:
>>>>> +			switch (crev) {
>>>>> +			case 1:
>>>>> +				if (module_index < vram_info-
>>>>> v2_1.ucNumOfVRAMModule) {
>>>>> +					ATOM_INIT_REG_BLOCK *reg_block
>>>> =
>>>>> +						(ATOM_INIT_REG_BLOCK *)
>>>>> +						((u8 *)vram_info +
>>>> le16_to_cpu(vram_info->v2_1.usMemClkPatchTblOffset));
>>>>> +
>>>> 	ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
>>>>> +
>>>> 	(ATOM_MEMORY_SETTING_DATA_BLOCK *)
>>>>> +						((u8 *)reg_block + (2 *
>>>> sizeof(u16)) +
>>>>> +						 le16_to_cpu(reg_block-
>>>>> usRegIndexTblSize));
>>>>> +					ATOM_INIT_REG_INDEX_FORMAT
>>>> *format = &reg_block->asRegIndexBuf[0];
>>>>> +					num_entries =
>>>> (u8)((le16_to_cpu(reg_block->usRegIndexTblSize)) /
>>>>> +
>>>> sizeof(ATOM_INIT_REG_INDEX_FORMAT)) - 1;
>>>>> +					if (num_entries >
>>>> VBIOS_MC_REGISTER_ARRAY_SIZE)
>>>>> +						return -EINVAL;
>>>>> +					while (i < num_entries) {
>>>>> +						if (format-
>>>>> ucPreRegDataLength & ACCESS_PLACEHOLDER)
>>>>> +							break;
>>>>> +						reg_table-
>>>>> mc_reg_address[i].s1 =
>>>>> +
>>>> 	(u16)(le16_to_cpu(format->usRegIndex));
>>>>> +						reg_table-
>>>>> mc_reg_address[i].pre_reg_data =
>>>>> +							(u8)(format-
>>>>> ucPreRegDataLength);
>>>>> +						i++;
>>>>> +						format =
>>>> (ATOM_INIT_REG_INDEX_FORMAT *)
>>>>> +							((u8 *)format +
>>>> sizeof(ATOM_INIT_REG_INDEX_FORMAT));
>>>>> +					}
>>>>> +					reg_table->last = i;
>>>>> +					while ((le32_to_cpu(*(u32
>>>> *)reg_data) != END_OF_REG_DATA_BLOCK) &&
>>>>> +					       (num_ranges <
>>>> VBIOS_MAX_AC_TIMING_ENTRIES)) {
>>>>> +						t_mem_id =
>>>> (u8)((le32_to_cpu(*(u32 *)reg_data) & MEM_ID_MASK)
>>>>> +								>>
>>>> MEM_ID_SHIFT);
>>>>> +						if (module_index ==
>>>> t_mem_id) {
>>>>> +							reg_table-
>>>>> mc_reg_table_entry[num_ranges].mclk_max =
>>>>> +
>>>> 	(u32)((le32_to_cpu(*(u32 *)reg_data) & CLOCK_RANGE_MASK)
>>>>> +								      >>
>>>> CLOCK_RANGE_SHIFT);
>>>>> +							for (i = 0, j = 1; i <
>>>> reg_table->last; i++) {
>>>>> +								if ((reg_table-
>>>>> mc_reg_address[i].pre_reg_data & LOW_NIBBLE_MASK) ==
>>>> DATA_FROM_TABLE) {
>>>>> +
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i] =
>>>>> +
>>>> 	(u32)le32_to_cpu(*((u32 *)reg_data + j));
>>>>> +									j++;
>>>>> +								} else if
>>>> ((reg_table->mc_reg_address[i].pre_reg_data & LOW_NIBBLE_MASK) ==
>>>> DATA_EQU_PREV) {
>>>>> +
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i] =
>>>>> +
>>>> 	reg_table->mc_reg_table_entry[num_ranges].mc_data[i - 1];
>>>>> +								}
>>>>> +							}
>>>>> +							num_ranges++;
>>>>> +						}
>>>>> +						reg_data =
>>>> (ATOM_MEMORY_SETTING_DATA_BLOCK *)
>>>>> +							((u8 *)reg_data +
>>>> le16_to_cpu(reg_block->usRegDataBlkSize));
>>>>> +					}
>>>>> +					if (le32_to_cpu(*(u32 *)reg_data) !=
>>>> END_OF_REG_DATA_BLOCK)
>>>>> +						return -EINVAL;
>>>>> +					reg_table->num_entries =
>>>> num_ranges;
>>>>> +				} else
>>>>> +					return -EINVAL;
>>>>> +				break;
>>>>> +			default:
>>>>> +				DRM_ERROR("Unknown table
>>>> version %d, %d\n", frev, crev);
>>>>> +				return -EINVAL;
>>>>> +			}
>>>>> +			break;
>>>>> +		default:
>>>>> +			DRM_ERROR("Unknown table version %d, %d\n",
>>>> frev, crev);
>>>>> +			return -EINVAL;
>>>>> +		}
>>>>> +		return 0;
>>>>> +	}
>>>>> +	return -EINVAL;
>>>>> +}
>>>>> +
>>>>> +void amdgpu_dpm_print_class_info(u32 class, u32 class2)
>>>>> +{
>>>>> +	const char *s;
>>>>> +
>>>>> +	switch (class & ATOM_PPLIB_CLASSIFICATION_UI_MASK) {
>>>>> +	case ATOM_PPLIB_CLASSIFICATION_UI_NONE:
>>>>> +	default:
>>>>> +		s = "none";
>>>>> +		break;
>>>>> +	case ATOM_PPLIB_CLASSIFICATION_UI_BATTERY:
>>>>> +		s = "battery";
>>>>> +		break;
>>>>> +	case ATOM_PPLIB_CLASSIFICATION_UI_BALANCED:
>>>>> +		s = "balanced";
>>>>> +		break;
>>>>> +	case ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE:
>>>>> +		s = "performance";
>>>>> +		break;
>>>>> +	}
>>>>> +	printk("\tui class: %s\n", s);
>>>>> +	printk("\tinternal class:");
>>>>> +	if (((class & ~ATOM_PPLIB_CLASSIFICATION_UI_MASK) == 0) &&
>>>>> +	    (class2 == 0))
>>>>> +		pr_cont(" none");
>>>>> +	else {
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_BOOT)
>>>>> +			pr_cont(" boot");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_THERMAL)
>>>>> +			pr_cont(" thermal");
>>>>> +		if (class &
>>>> ATOM_PPLIB_CLASSIFICATION_LIMITEDPOWERSOURCE)
>>>>> +			pr_cont(" limited_pwr");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_REST)
>>>>> +			pr_cont(" rest");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_FORCED)
>>>>> +			pr_cont(" forced");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
>>>>> +			pr_cont(" 3d_perf");
>>>>> +		if (class &
>>>> ATOM_PPLIB_CLASSIFICATION_OVERDRIVETEMPLATE)
>>>>> +			pr_cont(" ovrdrv");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_UVDSTATE)
>>>>> +			pr_cont(" uvd");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_3DLOW)
>>>>> +			pr_cont(" 3d_low");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_ACPI)
>>>>> +			pr_cont(" acpi");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_HD2STATE)
>>>>> +			pr_cont(" uvd_hd2");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_HDSTATE)
>>>>> +			pr_cont(" uvd_hd");
>>>>> +		if (class & ATOM_PPLIB_CLASSIFICATION_SDSTATE)
>>>>> +			pr_cont(" uvd_sd");
>>>>> +		if (class2 &
>>>> ATOM_PPLIB_CLASSIFICATION2_LIMITEDPOWERSOURCE_2)
>>>>> +			pr_cont(" limited_pwr2");
>>>>> +		if (class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
>>>>> +			pr_cont(" ulv");
>>>>> +		if (class2 & ATOM_PPLIB_CLASSIFICATION2_MVC)
>>>>> +			pr_cont(" uvd_mvc");
>>>>> +	}
>>>>> +	pr_cont("\n");
>>>>> +}
>>>>> +
>>>>> +void amdgpu_dpm_print_cap_info(u32 caps)
>>>>> +{
>>>>> +	printk("\tcaps:");
>>>>> +	if (caps & ATOM_PPLIB_SINGLE_DISPLAY_ONLY)
>>>>> +		pr_cont(" single_disp");
>>>>> +	if (caps & ATOM_PPLIB_SUPPORTS_VIDEO_PLAYBACK)
>>>>> +		pr_cont(" video");
>>>>> +	if (caps & ATOM_PPLIB_DISALLOW_ON_DC)
>>>>> +		pr_cont(" no_dc");
>>>>> +	pr_cont("\n");
>>>>> +}
>>>>> +
>>>>> +void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
>>>>> +				struct amdgpu_ps *rps)
>>>>> +{
>>>>> +	printk("\tstatus:");
>>>>> +	if (rps == adev->pm.dpm.current_ps)
>>>>> +		pr_cont(" c");
>>>>> +	if (rps == adev->pm.dpm.requested_ps)
>>>>> +		pr_cont(" r");
>>>>> +	if (rps == adev->pm.dpm.boot_ps)
>>>>> +		pr_cont(" b");
>>>>> +	pr_cont("\n");
>>>>> +}
>>>>> +
>>>>> +void amdgpu_pm_print_power_states(struct amdgpu_device *adev)
>>>>> +{
>>>>> +	int i;
>>>>> +
>>>>> +	if (adev->powerplay.pp_funcs->print_power_state == NULL)
>>>>> +		return;
>>>>> +
>>>>> +	for (i = 0; i < adev->pm.dpm.num_ps; i++)
>>>>> +		amdgpu_dpm_print_power_state(adev, &adev-
>>>>> pm.dpm.ps[i]);
>>>>> +
>>>>> +}
>>>>> +
>>>>> +union power_info {
>>>>> +	struct _ATOM_POWERPLAY_INFO info;
>>>>> +	struct _ATOM_POWERPLAY_INFO_V2 info_2;
>>>>> +	struct _ATOM_POWERPLAY_INFO_V3 info_3;
>>>>> +	struct _ATOM_PPLIB_POWERPLAYTABLE pplib;
>>>>> +	struct _ATOM_PPLIB_POWERPLAYTABLE2 pplib2;
>>>>> +	struct _ATOM_PPLIB_POWERPLAYTABLE3 pplib3;
>>>>> +	struct _ATOM_PPLIB_POWERPLAYTABLE4 pplib4;
>>>>> +	struct _ATOM_PPLIB_POWERPLAYTABLE5 pplib5;
>>>>> +};
>>>>> +
>>>>> +int amdgpu_get_platform_caps(struct amdgpu_device *adev)
>>>>> +{
>>>>> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> +	union power_info *power_info;
>>>>> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> +	u16 data_offset;
>>>>> +	u8 frev, crev;
>>>>> +
>>>>> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> +				   &frev, &crev, &data_offset))
>>>>> +		return -EINVAL;
>>>>> +	power_info = (union power_info *)(mode_info->atom_context-
>>>>> bios + data_offset);
>>>>> +
>>>>> +	adev->pm.dpm.platform_caps = le32_to_cpu(power_info-
>>>>> pplib.ulPlatformCaps);
>>>>> +	adev->pm.dpm.backbias_response_time =
>>>> le16_to_cpu(power_info->pplib.usBackbiasTime);
>>>>> +	adev->pm.dpm.voltage_response_time = le16_to_cpu(power_info-
>>>>> pplib.usVoltageTime);
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +union fan_info {
>>>>> +	struct _ATOM_PPLIB_FANTABLE fan;
>>>>> +	struct _ATOM_PPLIB_FANTABLE2 fan2;
>>>>> +	struct _ATOM_PPLIB_FANTABLE3 fan3;
>>>>> +};
>>>>> +
>>>>> +static int amdgpu_parse_clk_voltage_dep_table(struct
>>>> amdgpu_clock_voltage_dependency_table *amdgpu_table,
>>>>> +
>>>> ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
>>>>> +{
>>>>> +	u32 size = atom_table->ucNumEntries *
>>>>> +		sizeof(struct amdgpu_clock_voltage_dependency_entry);
>>>>> +	int i;
>>>>> +	ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;
>>>>> +
>>>>> +	amdgpu_table->entries = kzalloc(size, GFP_KERNEL);
>>>>> +	if (!amdgpu_table->entries)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	entry = &atom_table->entries[0];
>>>>> +	for (i = 0; i < atom_table->ucNumEntries; i++) {
>>>>> +		amdgpu_table->entries[i].clk = le16_to_cpu(entry-
>>>>> usClockLow) |
>>>>> +			(entry->ucClockHigh << 16);
>>>>> +		amdgpu_table->entries[i].v = le16_to_cpu(entry-
>>>>> usVoltage);
>>>>> +		entry = (ATOM_PPLIB_Clock_Voltage_Dependency_Record
>>>> *)
>>>>> +			((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_Clock_Voltage_Dependency_Record));
>>>>> +	}
>>>>> +	amdgpu_table->count = atom_table->ucNumEntries;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +/* sizeof(ATOM_PPLIB_EXTENDEDHEADER) */
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2 12
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3 14
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4 16
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5 18
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6 20
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7 22
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8 24
>>>>> +#define SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V9 26
>>>>> +
>>>>> +int amdgpu_parse_extended_power_table(struct amdgpu_device
>> *adev)
>>>>> +{
>>>>> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> +	union power_info *power_info;
>>>>> +	union fan_info *fan_info;
>>>>> +	ATOM_PPLIB_Clock_Voltage_Dependency_Table *dep_table;
>>>>> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> +	u16 data_offset;
>>>>> +	u8 frev, crev;
>>>>> +	int ret, i;
>>>>> +
>>>>> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> +				   &frev, &crev, &data_offset))
>>>>> +		return -EINVAL;
>>>>> +	power_info = (union power_info *)(mode_info->atom_context-
>>>>> bios + data_offset);
>>>>> +
>>>>> +	/* fan table */
>>>>> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
>>>>> +		if (power_info->pplib3.usFanTableOffset) {
>>>>> +			fan_info = (union fan_info *)(mode_info-
>>>>> atom_context->bios + data_offset +
>>>>> +						      le16_to_cpu(power_info-
>>>>> pplib3.usFanTableOffset));
>>>>> +			adev->pm.dpm.fan.t_hyst = fan_info->fan.ucTHyst;
>>>>> +			adev->pm.dpm.fan.t_min = le16_to_cpu(fan_info-
>>>>> fan.usTMin);
>>>>> +			adev->pm.dpm.fan.t_med = le16_to_cpu(fan_info-
>>>>> fan.usTMed);
>>>>> +			adev->pm.dpm.fan.t_high = le16_to_cpu(fan_info-
>>>>> fan.usTHigh);
>>>>> +			adev->pm.dpm.fan.pwm_min =
>>>> le16_to_cpu(fan_info->fan.usPWMMin);
>>>>> +			adev->pm.dpm.fan.pwm_med =
>>>> le16_to_cpu(fan_info->fan.usPWMMed);
>>>>> +			adev->pm.dpm.fan.pwm_high =
>>>> le16_to_cpu(fan_info->fan.usPWMHigh);
>>>>> +			if (fan_info->fan.ucFanTableFormat >= 2)
>>>>> +				adev->pm.dpm.fan.t_max =
>>>> le16_to_cpu(fan_info->fan2.usTMax);
>>>>> +			else
>>>>> +				adev->pm.dpm.fan.t_max = 10900;
>>>>> +			adev->pm.dpm.fan.cycle_delay = 100000;
>>>>> +			if (fan_info->fan.ucFanTableFormat >= 3) {
>>>>> +				adev->pm.dpm.fan.control_mode =
>>>> fan_info->fan3.ucFanControlMode;
>>>>> +				adev->pm.dpm.fan.default_max_fan_pwm
>>>> =
>>>>> +					le16_to_cpu(fan_info-
>>>>> fan3.usFanPWMMax);
>>>>> +				adev-
>>>>> pm.dpm.fan.default_fan_output_sensitivity = 4836;
>>>>> +				adev->pm.dpm.fan.fan_output_sensitivity =
>>>>> +					le16_to_cpu(fan_info-
>>>>> fan3.usFanOutputSensitivity);
>>>>> +			}
>>>>> +			adev->pm.dpm.fan.ucode_fan_control = true;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/* clock dependancy tables, shedding tables */
>>>>> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE4)) {
>>>>> +		if (power_info->pplib4.usVddcDependencyOnSCLKOffset) {
>>>>> +			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcDependencyOnSCLKOffset));
>>>>> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddc_dependency_on_sclk,
>>>>> +								 dep_table);
>>>>> +			if (ret) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return ret;
>>>>> +			}
>>>>> +		}
>>>>> +		if (power_info->pplib4.usVddciDependencyOnMCLKOffset) {
>>>>> +			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usVddciDependencyOnMCLKOffset));
>>>>> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddci_dependency_on_mclk,
>>>>> +								 dep_table);
>>>>> +			if (ret) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return ret;
>>>>> +			}
>>>>> +		}
>>>>> +		if (power_info->pplib4.usVddcDependencyOnMCLKOffset) {
>>>>> +			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcDependencyOnMCLKOffset));
>>>>> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.vddc_dependency_on_mclk,
>>>>> +								 dep_table);
>>>>> +			if (ret) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return ret;
>>>>> +			}
>>>>> +		}
>>>>> +		if (power_info->pplib4.usMvddDependencyOnMCLKOffset)
>>>> {
>>>>> +			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usMvddDependencyOnMCLKOffset));
>>>>> +			ret = amdgpu_parse_clk_voltage_dep_table(&adev-
>>>>> pm.dpm.dyn_state.mvdd_dependency_on_mclk,
>>>>> +								 dep_table);
>>>>> +			if (ret) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return ret;
>>>>> +			}
>>>>> +		}
>>>>> +		if (power_info->pplib4.usMaxClockVoltageOnDCOffset) {
>>>>> +			ATOM_PPLIB_Clock_Voltage_Limit_Table *clk_v =
>>>>> +				(ATOM_PPLIB_Clock_Voltage_Limit_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usMaxClockVoltageOnDCOffset));
>>>>> +			if (clk_v->ucNumEntries) {
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.sclk =
>>>>> +					le16_to_cpu(clk_v-
>>>>> entries[0].usSclkLow) |
>>>>> +					(clk_v->entries[0].ucSclkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.mclk =
>>>>> +					le16_to_cpu(clk_v-
>>>>> entries[0].usMclkLow) |
>>>>> +					(clk_v->entries[0].ucMclkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.vddc =
>>>>> +					le16_to_cpu(clk_v-
>>>>> entries[0].usVddc);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.max_clock_voltage_on_dc.vddci =
>>>>> +					le16_to_cpu(clk_v-
>>>>> entries[0].usVddci);
>>>>> +			}
>>>>> +		}
>>>>> +		if (power_info->pplib4.usVddcPhaseShedLimitsTableOffset)
>>>> {
>>>>> +			ATOM_PPLIB_PhaseSheddingLimits_Table *psl =
>>>>> +				(ATOM_PPLIB_PhaseSheddingLimits_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib4.usVddcPhaseShedLimitsTableOffset));
>>>>> +			ATOM_PPLIB_PhaseSheddingLimits_Record *entry;
>>>>> +
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries =
>>>>> +				kcalloc(psl->ucNumEntries,
>>>>> +					sizeof(struct
>>>> amdgpu_phase_shedding_limits_entry),
>>>>> +					GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +
>>>>> +			entry = &psl->entries[0];
>>>>> +			for (i = 0; i < psl->ucNumEntries; i++) {
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].sclk =
>>>>> +					le16_to_cpu(entry->usSclkLow) |
>>>> (entry->ucSclkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].mclk =
>>>>> +					le16_to_cpu(entry->usMclkLow) |
>>>> (entry->ucMclkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.entries[i].voltage =
>>>>> +					le16_to_cpu(entry->usVoltage);
>>>>> +				entry =
>>>> (ATOM_PPLIB_PhaseSheddingLimits_Record *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_PhaseSheddingLimits_Record));
>>>>> +			}
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.phase_shedding_limits_table.count =
>>>>> +				psl->ucNumEntries;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/* cac data */
>>>>> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE5)) {
>>>>> +		adev->pm.dpm.tdp_limit = le32_to_cpu(power_info-
>>>>> pplib5.ulTDPLimit);
>>>>> +		adev->pm.dpm.near_tdp_limit = le32_to_cpu(power_info-
>>>>> pplib5.ulNearTDPLimit);
>>>>> +		adev->pm.dpm.near_tdp_limit_adjusted = adev-
>>>>> pm.dpm.near_tdp_limit;
>>>>> +		adev->pm.dpm.tdp_od_limit = le16_to_cpu(power_info-
>>>>> pplib5.usTDPODLimit);
>>>>> +		if (adev->pm.dpm.tdp_od_limit)
>>>>> +			adev->pm.dpm.power_control = true;
>>>>> +		else
>>>>> +			adev->pm.dpm.power_control = false;
>>>>> +		adev->pm.dpm.tdp_adjustment = 0;
>>>>> +		adev->pm.dpm.sq_ramping_threshold =
>>>> le32_to_cpu(power_info->pplib5.ulSQRampingThreshold);
>>>>> +		adev->pm.dpm.cac_leakage = le32_to_cpu(power_info-
>>>>> pplib5.ulCACLeakage);
>>>>> +		adev->pm.dpm.load_line_slope = le16_to_cpu(power_info-
>>>>> pplib5.usLoadLineSlope);
>>>>> +		if (power_info->pplib5.usCACLeakageTableOffset) {
>>>>> +			ATOM_PPLIB_CAC_Leakage_Table *cac_table =
>>>>> +				(ATOM_PPLIB_CAC_Leakage_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(power_info-
>>>>> pplib5.usCACLeakageTableOffset));
>>>>> +			ATOM_PPLIB_CAC_Leakage_Record *entry;
>>>>> +			u32 size = cac_table->ucNumEntries * sizeof(struct
>>>> amdgpu_cac_leakage_table);
>>>>> +			adev->pm.dpm.dyn_state.cac_leakage_table.entries
>>>> = kzalloc(size, GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			entry = &cac_table->entries[0];
>>>>> +			for (i = 0; i < cac_table->ucNumEntries; i++) {
>>>>> +				if (adev->pm.dpm.platform_caps &
>>>> ATOM_PP_PLATFORM_CAP_EVV) {
>>>>> +					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc1 =
>>>>> +						le16_to_cpu(entry-
>>>>> usVddc1);
>>>>> +					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc2 =
>>>>> +						le16_to_cpu(entry-
>>>>> usVddc2);
>>>>> +					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc3 =
>>>>> +						le16_to_cpu(entry-
>>>>> usVddc3);
>>>>> +				} else {
>>>>> +					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].vddc =
>>>>> +						le16_to_cpu(entry->usVddc);
>>>>> +					adev-
>>>>> pm.dpm.dyn_state.cac_leakage_table.entries[i].leakage =
>>>>> +						le32_to_cpu(entry-
>>>>> ulLeakageValue);
>>>>> +				}
>>>>> +				entry = (ATOM_PPLIB_CAC_Leakage_Record
>>>> *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_CAC_Leakage_Record));
>>>>> +			}
>>>>> +			adev->pm.dpm.dyn_state.cac_leakage_table.count
>>>> = cac_table->ucNumEntries;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	/* ext tables */
>>>>> +	if (le16_to_cpu(power_info->pplib.usTableSize) >=
>>>>> +	    sizeof(struct _ATOM_PPLIB_POWERPLAYTABLE3)) {
>>>>> +		ATOM_PPLIB_EXTENDEDHEADER *ext_hdr =
>>>> (ATOM_PPLIB_EXTENDEDHEADER *)
>>>>> +			(mode_info->atom_context->bios + data_offset +
>>>>> +			 le16_to_cpu(power_info-
>>>>> pplib3.usExtendendedHeaderOffset));
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V2) &&
>>>>> +			ext_hdr->usVCETableOffset) {
>>>>> +			VCEClockInfoArray *array = (VCEClockInfoArray *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1);
>>>>> +			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table
>>>> *limits =
>>>>> +
>>>> 	(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1 +
>>>>> +				 1 + array->ucNumEntries *
>>>> sizeof(VCEClockInfo));
>>>>> +			ATOM_PPLIB_VCE_State_Table *states =
>>>>> +				(ATOM_PPLIB_VCE_State_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usVCETableOffset) +
>>>> 1 +
>>>>> +				 1 + (array->ucNumEntries * sizeof
>>>> (VCEClockInfo)) +
>>>>> +				 1 + (limits->numEntries *
>>>> sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record)));
>>>>> +			ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record
>>>> *entry;
>>>>> +			ATOM_PPLIB_VCE_State_Record *state_entry;
>>>>> +			VCEClockInfo *vce_clk;
>>>>> +			u32 size = limits->numEntries *
>>>>> +				sizeof(struct
>>>> amdgpu_vce_clock_voltage_dependency_entry);
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries =
>>>>> +				kzalloc(size, GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.count =
>>>>> +				limits->numEntries;
>>>>> +			entry = &limits->entries[0];
>>>>> +			state_entry = &states->entries[0];
>>>>> +			for (i = 0; i < limits->numEntries; i++) {
>>>>> +				vce_clk = (VCEClockInfo *)
>>>>> +					((u8 *)&array->entries[0] +
>>>>> +					 (entry->ucVCEClockInfoIndex *
>>>> sizeof(VCEClockInfo)));
>>>>> +				adev-
>>>>>
>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].evclk
>>>> =
>>>>> +					le16_to_cpu(vce_clk->usEVClkLow) |
>>>> (vce_clk->ucEVClkHigh << 16);
>>>>> +				adev-
>>>>>
>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].ecclk
>>>> =
>>>>> +					le16_to_cpu(vce_clk->usECClkLow) |
>>>> (vce_clk->ucECClkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.vce_clock_voltage_dependency_table.entries[i].v =
>>>>> +					le16_to_cpu(entry->usVoltage);
>>>>> +				entry =
>>>> (ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_VCE_Clock_Voltage_Limit_Record));
>>>>> +			}
>>>>> +			adev->pm.dpm.num_of_vce_states =
>>>>> +					states->numEntries >
>>>> AMD_MAX_VCE_LEVELS ?
>>>>> +					AMD_MAX_VCE_LEVELS : states-
>>>>> numEntries;
>>>>> +			for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++)
>>>> {
>>>>> +				vce_clk = (VCEClockInfo *)
>>>>> +					((u8 *)&array->entries[0] +
>>>>> +					 (state_entry->ucVCEClockInfoIndex
>>>> * sizeof(VCEClockInfo)));
>>>>> +				adev->pm.dpm.vce_states[i].evclk =
>>>>> +					le16_to_cpu(vce_clk->usEVClkLow) |
>>>> (vce_clk->ucEVClkHigh << 16);
>>>>> +				adev->pm.dpm.vce_states[i].ecclk =
>>>>> +					le16_to_cpu(vce_clk->usECClkLow) |
>>>> (vce_clk->ucECClkHigh << 16);
>>>>> +				adev->pm.dpm.vce_states[i].clk_idx =
>>>>> +					state_entry->ucClockInfoIndex &
>>>> 0x3f;
>>>>> +				adev->pm.dpm.vce_states[i].pstate =
>>>>> +					(state_entry->ucClockInfoIndex &
>>>> 0xc0) >> 6;
>>>>> +				state_entry =
>>>> (ATOM_PPLIB_VCE_State_Record *)
>>>>> +					((u8 *)state_entry +
>>>> sizeof(ATOM_PPLIB_VCE_State_Record));
>>>>> +			}
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V3) &&
>>>>> +			ext_hdr->usUVDTableOffset) {
>>>>> +			UVDClockInfoArray *array = (UVDClockInfoArray *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usUVDTableOffset) +
>>>> 1);
>>>>> +			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table
>>>> *limits =
>>>>> +
>>>> 	(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usUVDTableOffset) +
>>>> 1 +
>>>>> +				 1 + (array->ucNumEntries * sizeof
>>>> (UVDClockInfo)));
>>>>> +			ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record
>>>> *entry;
>>>>> +			u32 size = limits->numEntries *
>>>>> +				sizeof(struct
>>>> amdgpu_uvd_clock_voltage_dependency_entry);
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries =
>>>>> +				kzalloc(size, GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.count =
>>>>> +				limits->numEntries;
>>>>> +			entry = &limits->entries[0];
>>>>> +			for (i = 0; i < limits->numEntries; i++) {
>>>>> +				UVDClockInfo *uvd_clk = (UVDClockInfo *)
>>>>> +					((u8 *)&array->entries[0] +
>>>>> +					 (entry->ucUVDClockInfoIndex *
>>>> sizeof(UVDClockInfo)));
>>>>> +				adev-
>>>>>
>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].vclk =
>>>>> +					le16_to_cpu(uvd_clk->usVClkLow) |
>>>> (uvd_clk->ucVClkHigh << 16);
>>>>> +				adev-
>>>>>
>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].dclk =
>>>>> +					le16_to_cpu(uvd_clk->usDClkLow) |
>>>> (uvd_clk->ucDClkHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.uvd_clock_voltage_dependency_table.entries[i].v =
>>>>> +					le16_to_cpu(entry->usVoltage);
>>>>> +				entry =
>>>> (ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_UVD_Clock_Voltage_Limit_Record));
>>>>> +			}
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V4) &&
>>>>> +			ext_hdr->usSAMUTableOffset) {
>>>>> +			ATOM_PPLIB_SAMClk_Voltage_Limit_Table *limits =
>>>>> +				(ATOM_PPLIB_SAMClk_Voltage_Limit_Table
>>>> *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usSAMUTableOffset)
>>>> + 1);
>>>>> +			ATOM_PPLIB_SAMClk_Voltage_Limit_Record *entry;
>>>>> +			u32 size = limits->numEntries *
>>>>> +				sizeof(struct
>>>> amdgpu_clock_voltage_dependency_entry);
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries =
>>>>> +				kzalloc(size, GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.count =
>>>>> +				limits->numEntries;
>>>>> +			entry = &limits->entries[0];
>>>>> +			for (i = 0; i < limits->numEntries; i++) {
>>>>> +				adev-
>>>>>
>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].clk =
>>>>> +					le16_to_cpu(entry->usSAMClockLow)
>>>> | (entry->ucSAMClockHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.samu_clock_voltage_dependency_table.entries[i].v
>> =
>>>>> +					le16_to_cpu(entry->usVoltage);
>>>>> +				entry =
>>>> (ATOM_PPLIB_SAMClk_Voltage_Limit_Record *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_SAMClk_Voltage_Limit_Record));
>>>>> +			}
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V5) &&
>>>>> +		    ext_hdr->usPPMTableOffset) {
>>>>> +			ATOM_PPLIB_PPM_Table *ppm =
>>>> (ATOM_PPLIB_PPM_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usPPMTableOffset));
>>>>> +			adev->pm.dpm.dyn_state.ppm_table =
>>>>> +				kzalloc(sizeof(struct amdgpu_ppm_table),
>>>> GFP_KERNEL);
>>>>> +			if (!adev->pm.dpm.dyn_state.ppm_table) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			adev->pm.dpm.dyn_state.ppm_table->ppm_design
>>>> = ppm->ucPpmDesign;
>>>>> +			adev->pm.dpm.dyn_state.ppm_table-
>>>>> cpu_core_number =
>>>>> +				le16_to_cpu(ppm->usCpuCoreNumber);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table-
>>>>> platform_tdp =
>>>>> +				le32_to_cpu(ppm->ulPlatformTDP);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table-
>>>>> small_ac_platform_tdp =
>>>>> +				le32_to_cpu(ppm->ulSmallACPlatformTDP);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table->platform_tdc
>>>> =
>>>>> +				le32_to_cpu(ppm->ulPlatformTDC);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table-
>>>>> small_ac_platform_tdc =
>>>>> +				le32_to_cpu(ppm->ulSmallACPlatformTDC);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table->apu_tdp =
>>>>> +				le32_to_cpu(ppm->ulApuTDP);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table->dgpu_tdp =
>>>>> +				le32_to_cpu(ppm->ulDGpuTDP);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table-
>>>>> dgpu_ulv_power =
>>>>> +				le32_to_cpu(ppm->ulDGpuUlvPower);
>>>>> +			adev->pm.dpm.dyn_state.ppm_table->tj_max =
>>>>> +				le32_to_cpu(ppm->ulTjmax);
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V6) &&
>>>>> +			ext_hdr->usACPTableOffset) {
>>>>> +			ATOM_PPLIB_ACPClk_Voltage_Limit_Table *limits =
>>>>> +				(ATOM_PPLIB_ACPClk_Voltage_Limit_Table
>>>> *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr->usACPTableOffset) +
>>>> 1);
>>>>> +			ATOM_PPLIB_ACPClk_Voltage_Limit_Record *entry;
>>>>> +			u32 size = limits->numEntries *
>>>>> +				sizeof(struct
>>>> amdgpu_clock_voltage_dependency_entry);
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries =
>>>>> +				kzalloc(size, GFP_KERNEL);
>>>>> +			if (!adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.count =
>>>>> +				limits->numEntries;
>>>>> +			entry = &limits->entries[0];
>>>>> +			for (i = 0; i < limits->numEntries; i++) {
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].clk
>> =
>>>>> +					le16_to_cpu(entry->usACPClockLow)
>>>> | (entry->ucACPClockHigh << 16);
>>>>> +				adev-
>>>>> pm.dpm.dyn_state.acp_clock_voltage_dependency_table.entries[i].v =
>>>>> +					le16_to_cpu(entry->usVoltage);
>>>>> +				entry =
>>>> (ATOM_PPLIB_ACPClk_Voltage_Limit_Record *)
>>>>> +					((u8 *)entry +
>>>> sizeof(ATOM_PPLIB_ACPClk_Voltage_Limit_Record));
>>>>> +			}
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V7) &&
>>>>> +			ext_hdr->usPowerTuneTableOffset) {
>>>>> +			u8 rev = *(u8 *)(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> +			ATOM_PowerTune_Table *pt;
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table =
>>>>> +				kzalloc(sizeof(struct amdgpu_cac_tdp_table),
>>>> GFP_KERNEL);
>>>>> +			if (!adev->pm.dpm.dyn_state.cac_tdp_table) {
>>>>> +
>>>> 	amdgpu_free_extended_power_table(adev);
>>>>> +				return -ENOMEM;
>>>>> +			}
>>>>> +			if (rev > 0) {
>>>>> +				ATOM_PPLIB_POWERTUNE_Table_V1 *ppt =
>>>> (ATOM_PPLIB_POWERTUNE_Table_V1 *)
>>>>> +					(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> +				adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> maximum_power_delivery_limit =
>>>>> +					ppt->usMaximumPowerDeliveryLimit;
>>>>> +				pt = &ppt->power_tune_table;
>>>>> +			} else {
>>>>> +				ATOM_PPLIB_POWERTUNE_Table *ppt =
>>>> (ATOM_PPLIB_POWERTUNE_Table *)
>>>>> +					(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +					 le16_to_cpu(ext_hdr-
>>>>> usPowerTuneTableOffset));
>>>>> +				adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> maximum_power_delivery_limit = 255;
>>>>> +				pt = &ppt->power_tune_table;
>>>>> +			}
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table->tdp =
>>>> le16_to_cpu(pt->usTDP);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> configurable_tdp =
>>>>> +				le16_to_cpu(pt->usConfigurableTDP);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table->tdc =
>>>> le16_to_cpu(pt->usTDC);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> battery_power_limit =
>>>>> +				le16_to_cpu(pt->usBatteryPowerLimit);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> small_power_limit =
>>>>> +				le16_to_cpu(pt->usSmallPowerLimit);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> low_cac_leakage =
>>>>> +				le16_to_cpu(pt->usLowCACLeakage);
>>>>> +			adev->pm.dpm.dyn_state.cac_tdp_table-
>>>>> high_cac_leakage =
>>>>> +				le16_to_cpu(pt->usHighCACLeakage);
>>>>> +		}
>>>>> +		if ((le16_to_cpu(ext_hdr->usSize) >=
>>>> SIZE_OF_ATOM_PPLIB_EXTENDEDHEADER_V8) &&
>>>>> +				ext_hdr->usSclkVddgfxTableOffset) {
>>>>> +			dep_table =
>>>> (ATOM_PPLIB_Clock_Voltage_Dependency_Table *)
>>>>> +				(mode_info->atom_context->bios +
>>>> data_offset +
>>>>> +				 le16_to_cpu(ext_hdr-
>>>>> usSclkVddgfxTableOffset));
>>>>> +			ret = amdgpu_parse_clk_voltage_dep_table(
>>>>> +					&adev-
>>>>> pm.dpm.dyn_state.vddgfx_dependency_on_sclk,
>>>>> +					dep_table);
>>>>> +			if (ret) {
>>>>> +				kfree(adev-
>>>>> pm.dpm.dyn_state.vddgfx_dependency_on_sclk.entries);
>>>>> +				return ret;
>>>>> +			}
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +void amdgpu_free_extended_power_table(struct amdgpu_device
>> *adev)
>>>>> +{
>>>>> +	struct amdgpu_dpm_dynamic_state *dyn_state = &adev-
>>>>> pm.dpm.dyn_state;
>>>>> +
>>>>> +	kfree(dyn_state->vddc_dependency_on_sclk.entries);
>>>>> +	kfree(dyn_state->vddci_dependency_on_mclk.entries);
>>>>> +	kfree(dyn_state->vddc_dependency_on_mclk.entries);
>>>>> +	kfree(dyn_state->mvdd_dependency_on_mclk.entries);
>>>>> +	kfree(dyn_state->cac_leakage_table.entries);
>>>>> +	kfree(dyn_state->phase_shedding_limits_table.entries);
>>>>> +	kfree(dyn_state->ppm_table);
>>>>> +	kfree(dyn_state->cac_tdp_table);
>>>>> +	kfree(dyn_state->vce_clock_voltage_dependency_table.entries);
>>>>> +	kfree(dyn_state->uvd_clock_voltage_dependency_table.entries);
>>>>> +	kfree(dyn_state->samu_clock_voltage_dependency_table.entries);
>>>>> +	kfree(dyn_state->acp_clock_voltage_dependency_table.entries);
>>>>> +	kfree(dyn_state->vddgfx_dependency_on_sclk.entries);
>>>>> +}
>>>>> +
>>>>> +static const char *pp_lib_thermal_controller_names[] = {
>>>>> +	"NONE",
>>>>> +	"lm63",
>>>>> +	"adm1032",
>>>>> +	"adm1030",
>>>>> +	"max6649",
>>>>> +	"lm64",
>>>>> +	"f75375",
>>>>> +	"RV6xx",
>>>>> +	"RV770",
>>>>> +	"adt7473",
>>>>> +	"NONE",
>>>>> +	"External GPIO",
>>>>> +	"Evergreen",
>>>>> +	"emc2103",
>>>>> +	"Sumo",
>>>>> +	"Northern Islands",
>>>>> +	"Southern Islands",
>>>>> +	"lm96163",
>>>>> +	"Sea Islands",
>>>>> +	"Kaveri/Kabini",
>>>>> +};
>>>>> +
>>>>> +void amdgpu_add_thermal_controller(struct amdgpu_device *adev)
>>>>> +{
>>>>> +	struct amdgpu_mode_info *mode_info = &adev->mode_info;
>>>>> +	ATOM_PPLIB_POWERPLAYTABLE *power_table;
>>>>> +	int index = GetIndexIntoMasterTable(DATA, PowerPlayInfo);
>>>>> +	ATOM_PPLIB_THERMALCONTROLLER *controller;
>>>>> +	struct amdgpu_i2c_bus_rec i2c_bus;
>>>>> +	u16 data_offset;
>>>>> +	u8 frev, crev;
>>>>> +
>>>>> +	if (!amdgpu_atom_parse_data_header(mode_info->atom_context,
>>>> index, NULL,
>>>>> +				   &frev, &crev, &data_offset))
>>>>> +		return;
>>>>> +	power_table = (ATOM_PPLIB_POWERPLAYTABLE *)
>>>>> +		(mode_info->atom_context->bios + data_offset);
>>>>> +	controller = &power_table->sThermalController;
>>>>> +
>>>>> +	/* add the i2c bus for thermal/fan chip */
>>>>> +	if (controller->ucType > 0) {
>>>>> +		if (controller->ucFanParameters &
>>>> ATOM_PP_FANPARAMETERS_NOFAN)
>>>>> +			adev->pm.no_fan = true;
>>>>> +		adev->pm.fan_pulses_per_revolution =
>>>>> +			controller->ucFanParameters &
>>>>
>> ATOM_PP_FANPARAMETERS_TACHOMETER_PULSES_PER_REVOLUTION_M
>>>> ASK;
>>>>> +		if (adev->pm.fan_pulses_per_revolution) {
>>>>> +			adev->pm.fan_min_rpm = controller->ucFanMinRPM;
>>>>> +			adev->pm.fan_max_rpm = controller-
>>>>> ucFanMaxRPM;
>>>>> +		}
>>>>> +		if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_RV6xx) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_RV6XX;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_RV770) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_RV770;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_EVERGREEN) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EVERGREEN;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_SUMO) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_SUMO;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_NISLANDS) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type = THERMAL_TYPE_NI;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_SISLANDS) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type = THERMAL_TYPE_SI;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_CISLANDS) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type = THERMAL_TYPE_CI;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_KAVERI) {
>>>>> +			DRM_INFO("Internal thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type = THERMAL_TYPE_KV;
>>>>> +		} else if (controller->ucType ==
>>>> ATOM_PP_THERMALCONTROLLER_EXTERNAL_GPIO) {
>>>>> +			DRM_INFO("External GPIO thermal controller %s fan
>>>> control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EXTERNAL_GPIO;
>>>>> +		} else if (controller->ucType ==
>>>>> +
>>>> ATOM_PP_THERMALCONTROLLER_ADT7473_WITH_INTERNAL) {
>>>>> +			DRM_INFO("ADT7473 with internal thermal
>>>> controller %s fan control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_ADT7473_WITH_INTERNAL;
>>>>> +		} else if (controller->ucType ==
>>>>> +
>>>> ATOM_PP_THERMALCONTROLLER_EMC2103_WITH_INTERNAL) {
>>>>> +			DRM_INFO("EMC2103 with internal thermal
>>>> controller %s fan control\n",
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EMC2103_WITH_INTERNAL;
>>>>> +		} else if (controller->ucType <
>>>> ARRAY_SIZE(pp_lib_thermal_controller_names)) {
>>>>> +			DRM_INFO("Possible %s thermal controller at
>>>> 0x%02x %s fan control\n",
>>>>> +
>>>> pp_lib_thermal_controller_names[controller->ucType],
>>>>> +				 controller->ucI2cAddress >> 1,
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +			adev->pm.int_thermal_type =
>>>> THERMAL_TYPE_EXTERNAL;
>>>>> +			i2c_bus = amdgpu_atombios_lookup_i2c_gpio(adev,
>>>> controller->ucI2cLine);
>>>>> +			adev->pm.i2c_bus = amdgpu_i2c_lookup(adev,
>>>> &i2c_bus);
>>>>> +			if (adev->pm.i2c_bus) {
>>>>> +				struct i2c_board_info info = { };
>>>>> +				const char *name =
>>>> pp_lib_thermal_controller_names[controller->ucType];
>>>>> +				info.addr = controller->ucI2cAddress >> 1;
>>>>> +				strlcpy(info.type, name, sizeof(info.type));
>>>>> +				i2c_new_client_device(&adev->pm.i2c_bus-
>>>>> adapter, &info);
>>>>> +			}
>>>>> +		} else {
>>>>> +			DRM_INFO("Unknown thermal controller type %d at
>>>> 0x%02x %s fan control\n",
>>>>> +				 controller->ucType,
>>>>> +				 controller->ucI2cAddress >> 1,
>>>>> +				 (controller->ucFanParameters &
>>>>> +				  ATOM_PP_FANPARAMETERS_NOFAN) ?
>>>> "without" : "with");
>>>>> +		}
>>>>> +	}
>>>>> +}
>>>>> +
>>>>> +struct amd_vce_state* amdgpu_get_vce_clock_state(void *handle,
>> u32
>>>> idx)
>>>>> +{
>>>>> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>>> +
>>>>> +	if (idx < adev->pm.dpm.num_of_vce_states)
>>>>> +		return &adev->pm.dpm.vce_states[idx];
>>>>> +
>>>>> +	return NULL;
>>>>> +}
>>>>> +
>>>>> +static struct amdgpu_ps *amdgpu_dpm_pick_power_state(struct
>>>> amdgpu_device *adev,
>>>>> +						     enum
>>>> amd_pm_state_type dpm_state)
>>>>> +{
>>>>> +	int i;
>>>>> +	struct amdgpu_ps *ps;
>>>>> +	u32 ui_class;
>>>>> +	bool single_display = (adev->pm.dpm.new_active_crtc_count < 2) ?
>>>>> +		true : false;
>>>>> +
>>>>> +	/* check if the vblank period is too short to adjust the mclk */
>>>>> +	if (single_display && adev->powerplay.pp_funcs->vblank_too_short)
>>>> {
>>>>> +		if (amdgpu_dpm_vblank_too_short(adev))
>>>>> +			single_display = false;
>>>>> +	}
>>>>> +
>>>>> +	/* certain older asics have a separare 3D performance state,
>>>>> +	 * so try that first if the user selected performance
>>>>> +	 */
>>>>> +	if (dpm_state == POWER_STATE_TYPE_PERFORMANCE)
>>>>> +		dpm_state = POWER_STATE_TYPE_INTERNAL_3DPERF;
>>>>> +	/* balanced states don't exist at the moment */
>>>>> +	if (dpm_state == POWER_STATE_TYPE_BALANCED)
>>>>> +		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> +
>>>>> +restart_search:
>>>>> +	/* Pick the best power state based on current conditions */
>>>>> +	for (i = 0; i < adev->pm.dpm.num_ps; i++) {
>>>>> +		ps = &adev->pm.dpm.ps[i];
>>>>> +		ui_class = ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_UI_MASK;
>>>>> +		switch (dpm_state) {
>>>>> +		/* user states */
>>>>> +		case POWER_STATE_TYPE_BATTERY:
>>>>> +			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_BATTERY) {
>>>>> +				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> +					if (single_display)
>>>>> +						return ps;
>>>>> +				} else
>>>>> +					return ps;
>>>>> +			}
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_BALANCED:
>>>>> +			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_BALANCED) {
>>>>> +				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> +					if (single_display)
>>>>> +						return ps;
>>>>> +				} else
>>>>> +					return ps;
>>>>> +			}
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_PERFORMANCE:
>>>>> +			if (ui_class ==
>>>> ATOM_PPLIB_CLASSIFICATION_UI_PERFORMANCE) {
>>>>> +				if (ps->caps &
>>>> ATOM_PPLIB_SINGLE_DISPLAY_ONLY) {
>>>>> +					if (single_display)
>>>>> +						return ps;
>>>>> +				} else
>>>>> +					return ps;
>>>>> +			}
>>>>> +			break;
>>>>> +		/* internal states */
>>>>> +		case POWER_STATE_TYPE_INTERNAL_UVD:
>>>>> +			if (adev->pm.dpm.uvd_ps)
>>>>> +				return adev->pm.dpm.uvd_ps;
>>>>> +			else
>>>>> +				break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_UVD_SD:
>>>>> +			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_SDSTATE)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_UVD_HD:
>>>>> +			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_HDSTATE)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
>>>>> +			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_HD2STATE)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
>>>>> +			if (ps->class2 &
>>>> ATOM_PPLIB_CLASSIFICATION2_MVC)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_BOOT:
>>>>> +			return adev->pm.dpm.boot_ps;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_THERMAL:
>>>>> +			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_THERMAL)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_ACPI:
>>>>> +			if (ps->class & ATOM_PPLIB_CLASSIFICATION_ACPI)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_ULV:
>>>>> +			if (ps->class2 & ATOM_PPLIB_CLASSIFICATION2_ULV)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		case POWER_STATE_TYPE_INTERNAL_3DPERF:
>>>>> +			if (ps->class &
>>>> ATOM_PPLIB_CLASSIFICATION_3DPERFORMANCE)
>>>>> +				return ps;
>>>>> +			break;
>>>>> +		default:
>>>>> +			break;
>>>>> +		}
>>>>> +	}
>>>>> +	/* use a fallback state if we didn't match */
>>>>> +	switch (dpm_state) {
>>>>> +	case POWER_STATE_TYPE_INTERNAL_UVD_SD:
>>>>> +		dpm_state = POWER_STATE_TYPE_INTERNAL_UVD_HD;
>>>>> +		goto restart_search;
>>>>> +	case POWER_STATE_TYPE_INTERNAL_UVD_HD:
>>>>> +	case POWER_STATE_TYPE_INTERNAL_UVD_HD2:
>>>>> +	case POWER_STATE_TYPE_INTERNAL_UVD_MVC:
>>>>> +		if (adev->pm.dpm.uvd_ps) {
>>>>> +			return adev->pm.dpm.uvd_ps;
>>>>> +		} else {
>>>>> +			dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> +			goto restart_search;
>>>>> +		}
>>>>> +	case POWER_STATE_TYPE_INTERNAL_THERMAL:
>>>>> +		dpm_state = POWER_STATE_TYPE_INTERNAL_ACPI;
>>>>> +		goto restart_search;
>>>>> +	case POWER_STATE_TYPE_INTERNAL_ACPI:
>>>>> +		dpm_state = POWER_STATE_TYPE_BATTERY;
>>>>> +		goto restart_search;
>>>>> +	case POWER_STATE_TYPE_BATTERY:
>>>>> +	case POWER_STATE_TYPE_BALANCED:
>>>>> +	case POWER_STATE_TYPE_INTERNAL_3DPERF:
>>>>> +		dpm_state = POWER_STATE_TYPE_PERFORMANCE;
>>>>> +		goto restart_search;
>>>>> +	default:
>>>>> +		break;
>>>>> +	}
>>>>> +
>>>>> +	return NULL;
>>>>> +}
>>>>> +
>>>>> +int amdgpu_dpm_change_power_state_locked(void *handle)
>>>>> +{
>>>>> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>>>> +	struct amdgpu_ps *ps;
>>>>> +	enum amd_pm_state_type dpm_state;
>>>>> +	int ret;
>>>>> +	bool equal = false;
>>>>> +
>>>>> +	/* if dpm init failed */
>>>>> +	if (!adev->pm.dpm_enabled)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (adev->pm.dpm.user_state != adev->pm.dpm.state) {
>>>>> +		/* add other state override checks here */
>>>>> +		if ((!adev->pm.dpm.thermal_active) &&
>>>>> +		    (!adev->pm.dpm.uvd_active))
>>>>> +			adev->pm.dpm.state = adev->pm.dpm.user_state;
>>>>> +	}
>>>>> +	dpm_state = adev->pm.dpm.state;
>>>>> +
>>>>> +	ps = amdgpu_dpm_pick_power_state(adev, dpm_state);
>>>>> +	if (ps)
>>>>> +		adev->pm.dpm.requested_ps = ps;
>>>>> +	else
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	if (amdgpu_dpm == 1 && adev->powerplay.pp_funcs-
>>>>> print_power_state) {
>>>>> +		printk("switching from power state:\n");
>>>>> +		amdgpu_dpm_print_power_state(adev, adev-
>>>>> pm.dpm.current_ps);
>>>>> +		printk("switching to power state:\n");
>>>>> +		amdgpu_dpm_print_power_state(adev, adev-
>>>>> pm.dpm.requested_ps);
>>>>> +	}
>>>>> +
>>>>> +	/* update whether vce is active */
>>>>> +	ps->vce_active = adev->pm.dpm.vce_active;
>>>>> +	if (adev->powerplay.pp_funcs->display_configuration_changed)
>>>>> +		amdgpu_dpm_display_configuration_changed(adev);
>>>>> +
>>>>> +	ret = amdgpu_dpm_pre_set_power_state(adev);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	if (adev->powerplay.pp_funcs->check_state_equal) {
>>>>> +		if (0 != amdgpu_dpm_check_state_equal(adev, adev-
>>>>> pm.dpm.current_ps, adev->pm.dpm.requested_ps, &equal))
>>>>> +			equal = false;
>>>>> +	}
>>>>> +
>>>>> +	if (equal)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (adev->powerplay.pp_funcs->set_power_state)
>>>>> +		adev->powerplay.pp_funcs->set_power_state(adev-
>>>>> powerplay.pp_handle);
>>>>> +
>>>>> +	amdgpu_dpm_post_set_power_state(adev);
>>>>> +
>>>>> +	adev->pm.dpm.current_active_crtcs = adev-
>>>>> pm.dpm.new_active_crtcs;
>>>>> +	adev->pm.dpm.current_active_crtc_count = adev-
>>>>> pm.dpm.new_active_crtc_count;
>>>>> +
>>>>> +	if (adev->powerplay.pp_funcs->force_performance_level) {
>>>>> +		if (adev->pm.dpm.thermal_active) {
>>>>> +			enum amd_dpm_forced_level level = adev-
>>>>> pm.dpm.forced_level;
>>>>> +			/* force low perf level for thermal */
>>>>> +			amdgpu_dpm_force_performance_level(adev,
>>>> AMD_DPM_FORCED_LEVEL_LOW);
>>>>> +			/* save the user's level */
>>>>> +			adev->pm.dpm.forced_level = level;
>>>>> +		} else {
>>>>> +			/* otherwise, user selected level */
>>>>> +			amdgpu_dpm_force_performance_level(adev,
>>>> adev->pm.dpm.forced_level);
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
>>>> b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
>>>>> new file mode 100644
>>>>> index 000000000000..4adc765c8824
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/amd/pm/powerplay/legacy_dpm.h
>>>>> @@ -0,0 +1,70 @@
>>>>> +/*
>>>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person obtaining
>> a
>>>>> + * copy of this software and associated documentation files (the
>>>> "Software"),
>>>>> + * to deal in the Software without restriction, including without
>> limitation
>>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>>> + * and/or sell copies of the Software, and to permit persons to whom
>> the
>>>>> + * Software is furnished to do so, subject to the following conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be
>> included
>>>> in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>>>> KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>>> MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN
>>>> NO EVENT SHALL
>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>>>> DAMAGES OR
>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>>>> OTHERWISE,
>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
>> OR
>>>> THE USE OR
>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>> + *
>>>>> + */
>>>>> +#ifndef __LEGACY_DPM_H__
>>>>> +#define __LEGACY_DPM_H__
>>>>> +
>>>>> +int amdgpu_atombios_get_memory_pll_dividers(struct
>> amdgpu_device
>>>> *adev,
>>>>> +					    u32 clock,
>>>>> +					    bool strobe_mode,
>>>>> +					    struct atom_mpll_param
>>>> *mpll_param);
>>>>> +
>>>>> +void amdgpu_atombios_set_engine_dram_timings(struct
>>>> amdgpu_device *adev,
>>>>> +					     u32 eng_clock, u32 mem_clock);
>>>>> +
>>>>> +void amdgpu_atombios_get_default_voltages(struct amdgpu_device
>>>> *adev,
>>>>> +					  u16 *vddc, u16 *vddci, u16 *mvdd);
>>>>> +
>>>>> +int amdgpu_atombios_get_max_vddc(struct amdgpu_device *adev,
>> u8
>>>> voltage_type,
>>>>> +			     u16 voltage_id, u16 *voltage);
>>>>> +
>>>>> +int
>> amdgpu_atombios_get_leakage_vddc_based_on_leakage_idx(struct
>>>> amdgpu_device *adev,
>>>>> +						      u16 *voltage,
>>>>> +						      u16 leakage_idx);
>>>>> +
>>>>> +int amdgpu_atombios_get_svi2_info(struct amdgpu_device *adev,
>>>>> +			      u8 voltage_type,
>>>>> +			      u8 *svd_gpio_id, u8 *svc_gpio_id);
>>>>> +
>>>>> +bool
>>>>> +amdgpu_atombios_is_voltage_gpio(struct amdgpu_device *adev,
>>>>> +				u8 voltage_type, u8 voltage_mode);
>>>>> +int amdgpu_atombios_get_voltage_table(struct amdgpu_device
>> *adev,
>>>>> +				      u8 voltage_type, u8 voltage_mode,
>>>>> +				      struct atom_voltage_table
>>>> *voltage_table);
>>>>> +
>>>>> +int amdgpu_atombios_init_mc_reg_table(struct amdgpu_device
>> *adev,
>>>>> +				      u8 module_index,
>>>>> +				      struct atom_mc_reg_table *reg_table);
>>>>> +
>>>>> +void amdgpu_dpm_print_class_info(u32 class, u32 class2);
>>>>> +void amdgpu_dpm_print_cap_info(u32 caps);
>>>>> +void amdgpu_dpm_print_ps_status(struct amdgpu_device *adev,
>>>>> +				struct amdgpu_ps *rps);
>>>>> +int amdgpu_get_platform_caps(struct amdgpu_device *adev);
>>>>> +int amdgpu_parse_extended_power_table(struct amdgpu_device
>>>> *adev);
>>>>> +void amdgpu_free_extended_power_table(struct amdgpu_device
>>>> *adev);
>>>>> +void amdgpu_add_thermal_controller(struct amdgpu_device *adev);
>>>>> +struct amd_vce_state* amdgpu_get_vce_clock_state(void *handle,
>> u32
>>>> idx);
>>>>> +int amdgpu_dpm_change_power_state_locked(void *handle);
>>>>> +void amdgpu_pm_print_power_states(struct amdgpu_device *adev);
>>>>> +#endif
>>>>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
>>>> b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
>>>>> index 4f84d8b893f1..a2881c90d187 100644
>>>>> --- a/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
>>>>> +++ b/drivers/gpu/drm/amd/pm/powerplay/si_dpm.c
>>>>> @@ -37,6 +37,7 @@
>>>>>     #include <linux/math64.h>
>>>>>     #include <linux/seq_file.h>
>>>>>     #include <linux/firmware.h>
>>>>> +#include <legacy_dpm.h>
>>>>>
>>>>>     #define MC_CG_ARB_FREQ_F0           0x0a
>>>>>     #define MC_CG_ARB_FREQ_F1           0x0b
>>>>> @@ -8101,6 +8102,7 @@ static const struct amd_pm_funcs
>> si_dpm_funcs
>>>> = {
>>>>>     	.check_state_equal = &si_check_state_equal,
>>>>>     	.get_vce_clock_state = amdgpu_get_vce_clock_state,
>>>>>     	.read_sensor = &si_dpm_read_sensor,
>>>>> +	.change_power_state = amdgpu_dpm_change_power_state_locked,
>>>>>     };
>>>>>
>>>>>     static const struct amdgpu_irq_src_funcs si_dpm_irq_funcs = {
>>>>>
