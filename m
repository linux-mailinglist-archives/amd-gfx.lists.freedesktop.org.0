Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C874F7F183F
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Nov 2023 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842BE10E435;
	Mon, 20 Nov 2023 16:16:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::621])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291D710E09C;
 Mon, 20 Nov 2023 16:16:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OFvI7S7w8Hs18/YPnO3/oEDuhZv3n7WfxlJ7cC1bQeP6rnzzH3EsKQmpitDqkDSLitvt0RRxoCDe1ILkCiHDXbG9/8kY2NXw2hjt6G1J0fozemDoAkuFY3HwOJ6ogjupkfrmeO/d4dOULqZF2had3T6Bv5l8ZY2xoSqxKkpmzF7HYFaQPKH1YUc1xrxzEIspm8h9LGi+EJgSD24bwn5j7GrRI18Xd5uCFw6eEpN99NRzIpjg4TapZYacVtgRvXCJW9cWTzud5xxTXKgbimlzyCPZb2Tyus2QdgMWK97PRwednRVkSgeoiem8S/ldNEMjR8y+Y1J0BSmJU1gKI8HFzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0rZe25vgLTcjijXhFhv87cLB0CWTKa6TDayO2VwB78=;
 b=XyTznTAvXLgrUCayO7XIVhST9X/XEATEAA276/0uWfhunOpPWQn0Emaa1p4L0zBqXwRQu/mRtQH49o1rmQF46qOumvRTxKrXfjAJt3V7YuaPFtc8n4V6T8ALv4XLu4rUzkjGXgSIUCyqExik0COGIFCv0mNlEE9hsoz0ED6VxPfu47FlH38SgaeNYKbr1KfRN7URUN4be3afR7Ki2yK2lSBGPuqvfuoyFP9MKuzegUfnRJ9LzkkZCdejLnpSi9I2d7D0Ux3wTLFM+NnW92yQfHVzrg/w33AL3RMgvkHJU13e9jyj023Kea6e/wB4L9McCnrhJTHJ3wZBqJ5tPLhgIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0rZe25vgLTcjijXhFhv87cLB0CWTKa6TDayO2VwB78=;
 b=k3iXi2x2mjkhZxm5H1hU+oAoSIrw8ZIPu2vQ/lovQu4YqK/AKdHSFBPgrkYoF2jxakpNk6p0JjmC1JZsJiOLD1TjYeZlXJqdpXnAttrja54eU+B/SJC6uDBDJdP46aMI8Q7SQPBnFRtQW8JrNjF/JcBbTjPETMNdq4wB7+DxcYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 16:15:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 16:15:53 +0000
Message-ID: <814430b0-38de-4fd5-9719-a2f7b217cb0d@amd.com>
Date: Mon, 20 Nov 2023 11:15:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
 <73a16f1e-3556-49b3-bd19-8b510f6af3fd@suse.de>
 <7501fb58-9f34-4410-b529-c01e2e45e019@amd.com>
 <86a843ed-d286-4da0-9fa9-b777d783982f@suse.de>
 <c4e5254a-6c69-434a-8128-dd140ddba623@amd.com>
 <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <73722172-69e8-4bdf-bfe3-e7c5bbff7219@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0316.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::10) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ccd1cd-9a84-43ef-ec76-08dbe9e3f838
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SBqVu4pUNWnXTS/IUJl9PlaH6xGYBPWcopnO8AHeIQrQK1oF7s3o5QngFQxRkhES4f0NQ6JEcgvKrHX0jpU077e7ToR3XnRWP0qIs/+9W5pB+xau4y9PaukeIJ5sdagSb4EZ0EbobJXouQRC5MknzWRXdw8pHpydjRbrH8g4ytzEvHezxFfT3UdpLFWzRC7bZbPsBZND3dq7CCxvMUzENZVs62280VcZGC/do3KB0jeT8nv9BzXb9HRGKckZgicZBoRdJf8qOdszbvQyingVdIPqWdcdnDu5hjDvNWgV7lps7mefl02xxLF9jBUapo67zcBedATAE/6Wq6KIEk8ymkjdWbLCjSX0TLqtmN4ml8BVKJdLzYyLIDf8HKUW7rrRo5yA9J59hfJV5ECVvK4p44D6s9Q6pgtpSQChpNZgebrPX2GYKA/uKA5WwA8meMNJQsfIhdq8YdUYn5QnzUrOU0hCxeIRa9xKE9G7LPcrcxrFeOyVYRV0NYHn5to6te/eIwns+Ibdw4wLgxpZHjH7M3B7TOMZfJrdGf0zk/1t3AfgGsbF/xmMcvOsvZesA0fd1kA5WR+7/BgHOSVQYaTBEgzGc/VuJ5Trrlfjojb8otcsaMFHIW2kMw+R9YBbK71+ACZi8HaqUSNrGtsXFIfelw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(86362001)(31696002)(4001150100001)(2906002)(5660300002)(66476007)(66946007)(66556008)(316002)(110136005)(44832011)(8676002)(8936002)(36756003)(41300700001)(6486002)(478600001)(6506007)(2616005)(6512007)(53546011)(83380400001)(26005)(66574015)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVkL0xlWnhodWlNVis2Rmh6YW9VSUhLVVdsU01tMkFzMWdiNFZ0OHBWUmh4?=
 =?utf-8?B?eWpuYzRFa2owSy93aWJsNXF3U2c3MDBXZk1hUjFqRk5lNTd3Y09hN1JnblRS?=
 =?utf-8?B?dUtKWG9wU0hVaG9mVHpHS0ZsZ2VYSDY1SS9rcUExc0FFZzV0ZlpFZXQvKyt3?=
 =?utf-8?B?ZDdkeG1GTE1NTVR5QVJQYUVXUkovaGV2K3FQT05rUzMyOVBJcWNMZWtpUjUw?=
 =?utf-8?B?T1VwZkZOU0NGSWlDcnFYV2JMa0xjdFhtNXFTS3ZZNHMrb1BlY3VJQjhmT3ky?=
 =?utf-8?B?YjRVbmVER01MMG1hV001dEx1d0ZmRnFGemc4UVVFdVh6ZGJhR04rcWY1U0cz?=
 =?utf-8?B?clVUbnY1TmxMdHNKbmdFaWZDeHVPNmNXcTY4KzhvRVFIT2ZjeHRYSEZ5QlNh?=
 =?utf-8?B?TU1yTmwzV0VPdlRsUUxVMHRaOHozZG03QzllYzhNVm9kWnQzUE1oR2JhNzRx?=
 =?utf-8?B?WTcyMXZZbGUyMEd0Nmc4bDZGVkp3ZE5WVTg2aWVTcFRJVm8rSmVnVEl4VWts?=
 =?utf-8?B?UmxHeGJDY3E2OUFSUVBDNHVkNEs2YlVxWmNUajZJWnhjSGZFR25yZEl5bCtY?=
 =?utf-8?B?SDd1VHhzdldZWkJBV015UmJxVGVzUEhrcWlxVnBnbi9PS1FlalR5aE90K1l5?=
 =?utf-8?B?Nk9xcXdMWkx5MGUyZFhTYllEdzhmemhBVmY0OXdZeU1SSHJsUWpId2VkTWx2?=
 =?utf-8?B?aWtNeXRkRmxvSjl5enF6K1dtS09lV3RocW1mVmF3M2dESWhRVnhvcXU0VG9V?=
 =?utf-8?B?VmU2SDJnaEQ0bldVSTlmbi8yb29Sbmltb00yUHR2TFNmVzVoSjlwQ3kvZFdw?=
 =?utf-8?B?aSt0c21iR2x5UUNNT1lZU1prRlBYME9qallUaDRmNmFzbkNJZzJLeEZQek5x?=
 =?utf-8?B?USs2ZlArUmJhT0lrcyt2aVVmcy9MKzVJbVJhNXYyMkh1NnBOZmNBNDU4UTFa?=
 =?utf-8?B?QUtyU3VUN3UvcEFUKzI2MXQ1dWV6VE5sR21SalhPQ3RLTFRDcWo5empvWWNT?=
 =?utf-8?B?ODFSdmtBUC9ZY3pYM3VVejU0ejdyeVdPQ0RzODV3end0cWlkeHJSalhoNnhR?=
 =?utf-8?B?S1JSVXB5OWljY1ZVYllvL1hETUNOclh6dDNXdURLc0t4NXVyckVzS0ZCd2lF?=
 =?utf-8?B?SGkzT2pDOG1OMU8yUFhQVGZoSXNpSCtyVDlkRVdUZGpkZ3dKenJiN09Td1ZF?=
 =?utf-8?B?aS9OMkYxNnMxem1Sd2ZGOVRadmduc1VYSEJLUCtEaGRSRmFHRUtNNksrWm5C?=
 =?utf-8?B?Tm94UDlYWEhqSjErbEUzZUJEeFBZeGxJOWRONElVZFRWdTI5Y2ZBU1NoNjR4?=
 =?utf-8?B?MC9jeGpXUWlvdXN5UjhYdVNlc2x5YVZJRlpkUGlpTXk3dU91Q1d3WDJ0N1h3?=
 =?utf-8?B?WUdaVWQ0RTZyVW16bWo3RjhVekNSUE4vTSs5ZGhPNS8rZURoSTdTaGdheVVw?=
 =?utf-8?B?cW43NzJYNnZNZFZrOHBESzBYWjRJbkZWMFg0U0VNVXpxMXRSQXpEQVBaN0pi?=
 =?utf-8?B?ODluMnpDSEUyQmJVdU5lUGFkQ09BamlnbmlDbDBBT3c5U0VleHd6WWdQazNT?=
 =?utf-8?B?TW5NcnJWMU5NcHNrWExncnNLZHRaUG9FUjhSbUtESUdnQ094Rko4WVllRFFm?=
 =?utf-8?B?SmE4MTc4Z0JoN3hHbURMMDJYUzlJZ3U5STYzcFVzY3REQW4zQTFPQ1duY2hT?=
 =?utf-8?B?NGYyMnA4QzI2S2M1MUh2QVFMdnIvK0VxeVpub1ZFZTdtUDdyRzZYeGxtanlW?=
 =?utf-8?B?b1JadmdKZE5uVi8wZW1VRUxFNFQ0KzRYc0crUzlVU1o1RnpHbTZ6SURYWWcr?=
 =?utf-8?B?TFJjMFBrQU5JamQzRWJvdXRrY000bmk1UXdqUk1ZWjdiQ3NoaDFnUDJpNW45?=
 =?utf-8?B?TENFcHMyL05HQ0JuY1RKeE4vRmgvM3UyVXYwNHF5eWNoTmpBSDE3WlR4VndE?=
 =?utf-8?B?YWx3bFlNMU8xaGE5aWx3UTU2OGFlQWc0VjNmZzdwMVJicXE1ZGdjSFlQak9r?=
 =?utf-8?B?N2J6Mkw2OFlHY1pjQkpsU0dUUUdYbHZBNXlvMXVnOVU2QkRsZjU1M1hodzJq?=
 =?utf-8?B?SDN3QjRDQ2ZGNUNrdFlmNDZMMmF1QWNqQmhzTDhGRTB4bXNnNVR6T0cvaW9C?=
 =?utf-8?Q?OlzqLZ87o5nruZkd/bQDxodpy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ccd1cd-9a84-43ef-ec76-08dbe9e3f838
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 16:15:53.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTPlHIq8goJCliJv5du0Kg5q3qbFRapu0cJsA9l2hBn1ATpP1gYki0BpuEjtfdPLTV+dky6+X3F/zU3pR50cdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478
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


On 2023-11-20 11:02, Thomas Zimmermann wrote:
> Hi Christian
>
> Am 20.11.23 um 16:22 schrieb Christian König:
>> Am 20.11.23 um 16:18 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 20.11.23 um 16:06 schrieb Felix Kuehling:
>>>> On 2023-11-20 6:54, Thomas Zimmermann wrote:
>>>>> Hi
>>>>>
>>>>> Am 17.11.23 um 22:44 schrieb Felix Kuehling:
>>>>>> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>>>>>>
>>>>>> These helper functions are needed for KFD to export and import DMABufs
>>>>>> the right way without duplicating the tracking of DMABufs
>>>>>> associated with
>>>>>> GEM objects while ensuring that move notifier callbacks are working as
>>>>>> intended.
>>>>> I'm unhappy to see these functions making a comeback. They are the
>>>>> boiler-plate logic that all drivers should use. Historically,
>>>>> drivers did a lot one things in their GEM code that was only
>>>>> semi-correct. Unifying most of that made the memory management more
>>>>> readable. Not giving back drivers to option of tinkering with this
>>>>> might be preferable. The rsp hooks in struct drm_driver,
>>>>> prime_fd_to_handle and prime_handle_to_fd, are only there for vmwgfx.
>>>>>
>>>>> If you want to hook into prime import and export, there are
>>>>> drm_driver.gem_prime_import and drm_gem_object_funcs.export. Isn't
>>>>> it possible to move the additional code behind these pointers?
>>>> I'm not trying to hook into these functions, I'm just trying to call
>>>> them. I'm not bringing back the .prime_handle_to_fd and
>>>> .prime_fd_to_handle hooks in struct drm_driver. I need a clean way to
>>>> export and import DMAbuffers from a kernel mode context. I had
>>>> incorrect or semi-correct ways of doing that by calling some
>>>> driver-internal functions, but then my DMABufs aren't correctly
>>>> linked with GEM handles in DRM and move notifiers in amdgpu aren't
>>>> working correctly.
>>> I understand that. But why don't you use drm_driver.gem_prime_import
>>> and drm_gem_object_funcs.export to add the amdkfd-specific code? These
>>> callbacks are being invoked from within drm_gem_prime_fd_to_handle() and
>>> drm_gem_prime_handle_to_fd() as part of the importing and exporting
>>> logic. With the intention of doing driver-specific things. Hence you
>>> should not have to re-export the internal drm_gem_prime_*_to_*() helpers.
>>>
>>> My question is if the existing hooks are not suitable for your needs.
>>> If so, how could we improve them?
>> No no. You don't seem to understand the use case :) Felix doesn't try to
>> implement any driver-specific things.
> I meant that I understand that this patchset is not about setting
> drm_driver.prime_handle_to_fd, et al.
>
>> What Felix tries to do is to export a DMA-buf handle from kernel space.
> For example, looking at patch 2, it converts a GEM handle to a file
> descriptor and then assigns the rsp dmabuf to mem, which is of type
> struct kgd_mem. From my impression, this could be done within the
> existing ->export hook.

That would skip the call to export_and_register_object. I think that's 
what I'm currently missing to set up gem_obj->dmabuf.

Regards,
   Felix


>
> Then there's close_fd(), which cannot go into ->export. It looks like
> the fd isn't really required.  Could the drm_prime_handle_to_fd() be
> reworked into a helper that converts the handle to the dmabuf without
> the fd?  Something like drm_gem_prime_handle_to_dmabuf(), which would
> then be exported?
>
> And I have the question wrt the 3rd patch; just that it's about importing.
>
> (Looking further through the code, it appears that the fd could be
> removed from the helpers, the callbacks and vmwgfx. It would then be
> used entirely in the ioctl entry points, such as
> drm_prime_fd_to_handle_ioctl().)
>
> Best regards
> Thomas
>
>
>> Regards,
>> Christian.
>>
>>> Best regards
>>> Thomas
>>>
>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> CC: Christian König <christian.koenig@amd.com>
>>>>>> CC: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>>>>>>    include/drm/drm_prime.h     |  7 +++++++
>>>>>>    2 files changed, 25 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>>>>>> index 63b709a67471..834a5e28abbe 100644
>>>>>> --- a/drivers/gpu/drm/drm_prime.c
>>>>>> +++ b/drivers/gpu/drm/drm_prime.c
>>>>>> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf
>>>>>> *dma_buf)
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>    -/*
>>>>>> +/**
>>>>>>     * drm_gem_prime_fd_to_handle - PRIME import function for GEM
>>>>>> drivers
>>>>>>     * @dev: drm_device to import into
>>>>>>     * @file_priv: drm file-private structure
>>>>>> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>>>>>>     *
>>>>>>     * Returns 0 on success or a negative error code on failure.
>>>>>>     */
>>>>>> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>> -                      struct drm_file *file_priv, int prime_fd,
>>>>>> -                      uint32_t *handle)
>>>>>> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>> +                   uint32_t *handle)
>>>>>>    {
>>>>>>        struct dma_buf *dma_buf;
>>>>>>        struct drm_gem_object *obj;
>>>>>> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct
>>>>>> drm_device *dev,
>>>>>>        dma_buf_put(dma_buf);
>>>>>>        return ret;
>>>>>>    }
>>>>>> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>>>>>>      int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void
>>>>>> *data,
>>>>>>                     struct drm_file *file_priv)
>>>>>> @@ -408,7 +409,7 @@ static struct dma_buf
>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>        return dmabuf;
>>>>>>    }
>>>>>>    -/*
>>>>>> +/**
>>>>>>     * drm_gem_prime_handle_to_fd - PRIME export function for GEM
>>>>>> drivers
>>>>>>     * @dev: dev to export the buffer from
>>>>>>     * @file_priv: drm file-private structure
>>>>>> @@ -421,10 +422,10 @@ static struct dma_buf
>>>>>> *export_and_register_object(struct drm_device *dev,
>>>>>>     * The actual exporting from GEM object to a dma-buf is done
>>>>>> through the
>>>>>>     * &drm_gem_object_funcs.export callback.
>>>>>>     */
>>>>>> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>> -                      struct drm_file *file_priv, uint32_t handle,
>>>>>> -                      uint32_t flags,
>>>>>> -                      int *prime_fd)
>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>> +                   uint32_t flags,
>>>>>> +                   int *prime_fd)
>>>>>>    {
>>>>>>        struct drm_gem_object *obj;
>>>>>>        int ret = 0;
>>>>>> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct
>>>>>> drm_device *dev,
>>>>>>          return ret;
>>>>>>    }
>>>>>> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>>>>>>      int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void
>>>>>> *data,
>>>>>>                     struct drm_file *file_priv)
>>>>>> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>>>>>>     * @obj: GEM object to export
>>>>>>     * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>>>>>>     *
>>>>>> - * This is the implementation of the &drm_gem_object_funcs.export
>>>>>> functions
>>>>>> - * for GEM drivers using the PRIME helpers. It is used as the
>>>>>> default for
>>>>>> - * drivers that do not set their own.
>>>>>> + * This is the implementation of the &drm_gem_object_funcs.export
>>>>>> functions for GEM drivers
>>>>>> + * using the PRIME helpers. It is used as the default in
>>>>>> + * drm_gem_prime_handle_to_fd().
>>>>>>     */
>>>>>>    struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>>>>>                         int flags)
>>>>>> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>>>>>     * @dev: drm_device to import into
>>>>>>     * @dma_buf: dma-buf object to import
>>>>>>     *
>>>>>> - * This is the implementation of the gem_prime_import functions
>>>>>> for GEM
>>>>>> - * drivers using the PRIME helpers. It is the default for drivers
>>>>>> that do
>>>>>> - * not set their own &drm_driver.gem_prime_import.
>>>>>> + * This is the implementation of the gem_prime_import functions
>>>>>> for GEM drivers
>>>>>> + * using the PRIME helpers. Drivers can use this as their
>>>>>> + * &drm_driver.gem_prime_import implementation. It is used as the
>>>>>> default
>>>>>> + * implementation in drm_gem_prime_fd_to_handle().
>>>>>>     *
>>>>>>     * Drivers must arrange to call drm_prime_gem_destroy() from their
>>>>>>     * &drm_gem_object_funcs.free hook when using this function.
>>>>>> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
>>>>>> index a7abf9f3e697..2a1d01e5b56b 100644
>>>>>> --- a/include/drm/drm_prime.h
>>>>>> +++ b/include/drm/drm_prime.h
>>>>>> @@ -60,12 +60,19 @@ enum dma_data_direction;
>>>>>>      struct drm_device;
>>>>>>    struct drm_gem_object;
>>>>>> +struct drm_file;
>>>>>>      /* core prime functions */
>>>>>>    struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>>>>>>                          struct dma_buf_export_info *exp_info);
>>>>>>    void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>>>>>>    +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>>>>>> +                   struct drm_file *file_priv, int prime_fd,
>>>>>> uint32_t *handle);
>>>>>> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>>>>>> +                   struct drm_file *file_priv, uint32_t handle,
>>>>>> uint32_t flags,
>>>>>> +                   int *prime_fd);
>>>>>> +
>>>>>>    /* helper functions for exporting */
>>>>>>    int drm_gem_map_attach(struct dma_buf *dma_buf,
>>>>>>                   struct dma_buf_attachment *attach);
