Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF885237E4
	for <lists+amd-gfx@lfdr.de>; Wed, 11 May 2022 17:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247A710E90C;
	Wed, 11 May 2022 15:57:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA7A10E90C
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 May 2022 15:57:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AaPoq6rtmg1YS/3RqI4LRCfIASPVIqGzJXbT8NNisAbC3ZoHmV27qwBvP6/mLeYJmC6a5EWI4ghEnY2KpyT2OeVt51erSVa07xxgrzo215P/X4AYGkmls+nMFP09xakGLWAYbFcycEi0BTa8/Da+lBPt9CFfQU4DrM3YYG+b+g833hquPYLGHSvY3UZ2N/U+ClMiGWPpGHzDACROUClMVFv79KgqZtsBXO3Hm+jgpnE35wlq35ZEHMDKXKSZ1sIvt25SpQrf6S0teviO+4p3R9kPaK0dO6vsZ3B0sD3AMOOQ3m02Hsfhdtxlb9PNj6j9r8mh2cdelxw1xYkD+Jos1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMSmFLL1SlyhBNKLN4LGntclthqCR/x8QOYZlfWklzA=;
 b=bU6t2gKMy9I9f1hF7heLivLW5pav0mwRpEJXvxHIYk6g9CZdwXbbwcuIWKi6Qg7zc0pY7NdXTo4Bq8AfVoNQN/vW/Wf6HKLuu4RVKsD4iy/aRe3wfPR3pN+rwXSR+WaMZM+ovgZsaOWo3u29KYQbtoDKIAnQQXU1VgaF9jUPdXaRrr8GAde+VZiIumQLIcJx+s/X/IOqKaZ/rBZTSLppieXHPGyXNcwpxSZcC5aHX6kez572FyPGu/o3rWB9BQ1pHQEGI7JhYwwMjC9zxJWYqK9U7mM+TEzvfxjtikfksypvgizTTvEAT28FJHYhkMMsOLP24zNIPnzP+H2MT5nVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMSmFLL1SlyhBNKLN4LGntclthqCR/x8QOYZlfWklzA=;
 b=aZevmVcWNaX0p4UFGHwoZ3N3pib2n1oBFC40h9acHVWmool8mcqYUui99zUXMdr5emHgrCcNEdxe8iqTZCT12vGwuk8eNuQH7SWHKFlzN7uXbI7BVYjCS7Fi+8H/6kbOLibRWjYladEWP4ECd9RUnOrpnFAvMz1Urk+Hw5Gp15Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BY5PR12MB3908.namprd12.prod.outlook.com (2603:10b6:a03:1ae::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 15:57:19 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::1ce8:827f:a09:f6e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 15:57:19 +0000
Message-ID: <be946517-4355-0f9f-4dad-9653af3f9140@amd.com>
Date: Wed, 11 May 2022 11:57:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/amdgpu: Fix multiple GPU resets in XGMI hive.
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220504161841.24669-1-andrey.grodzovsky@amd.com>
 <aec08997-9565-a596-f143-eccf92653a84@amd.com>
 <8ea0a998-b056-8cbf-d666-5305fd124a5d@amd.com>
 <40baeccc-86c0-5fc2-c970-c0bf8b6b6943@amd.com>
 <384abcbc-c5e9-3732-7257-7f7bbf4c704b@amd.com>
 <05a18be9-dcc3-9246-b572-e47ccf5e804b@amd.com>
 <5f49de9e-dfa0-3371-c800-581f00556820@amd.com>
 <82cf78c6-9246-e892-bc42-99f6ec668481@amd.com>
 <ffad0f2b-b975-c099-a96d-98f82bc972ab@gmail.com>
 <3cefe63f-1f27-db1c-aeee-3731ca1e6d1d@amd.com>
 <df5deb8c-1a33-e177-ce26-eaccae179786@amd.com>
 <2b9b0047-6eb9-4117-9fa3-4396be39d39a@amd.com>
 <fb066a24-3737-ad5d-d098-ef0b5d4a54d4@amd.com>
 <2d366654-8df3-c6ae-d6fc-4fa94fc32fb1@amd.com>
 <3e0c3d24-2135-b02f-93a3-ab2a597c794f@gmail.com>
 <9cd38f76-13d0-7e99-9c8c-dff847c6cf2b@amd.com>
 <6699d9ec-501d-d2d5-2220-88fb754819a7@amd.com>
 <27535877-a13f-75fc-368f-68105dffc7f8@amd.com>
 <7330c50f-4623-c377-9486-c9a8fa884e15@amd.com>
 <4a52a938-f758-4b51-1f71-599a4af23e20@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <4a52a938-f758-4b51-1f71-599a4af23e20@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::21) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a6bbc4-18a1-40f3-6aac-08da3366eda3
X-MS-TrafficTypeDiagnostic: BY5PR12MB3908:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB390892EDDE839B4B723C9FAEEAC89@BY5PR12MB3908.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mF6sjdHSYG1mxIPBA595eMuF/XlQsumieZxpEJxwjYROnhIC+JpSNMBZNMPWMExEyNi52UqDJtPvE2ksTIAEdUWrbp/O6M5VKmG1FZ2ggnpQv8yB+acULqQkDhmAHDpOkxMViYoIN4gda0BQoH0qVGPLwcRXtdUK5AQaXGxAzxkSOeerDHZ47r8GMWWYCfr0SKdp5x6nUcBJKhwyEu9VK5VRR1f7At84KhwbFZoknS6rBxwFDWVWQQ13MiiU1QyEY+CikYG62wzJAN/ARr+bS8NWsQVbi4HSvNf0ToDkZGEKAqzfwtSV2vcapxZOjcsFPmlVqI6dtXDzFrCzIIsdiWu6Hi7QfKXRwx8LQCnCBCGkBr99C+iHvolUylKkqkfIcLOLGZhbSyNmmnnc8O5ouSk8LbS2etfCjCydDQczOgFy73duDOFPKns0/vPd6Yh4zZqg0ZkXmd7nbKwHTqVaYUYB0itn74EqpqaJ+myQjIK04j/uRyF8R7G9AVSabBsxitU3PKn8Ad1pVRmJDIzuwAjkZLphXokGF1A7QY8TVCU2pG7VXI4YQrxHiu7tEJN6LG3YNDzufl/f6ibN7TPM/Tpn3n681PbL7VWOgX8ENnD0IvlfY/R3YaGUbcpLo0EUh21BY1J3vYgWMPT+Ail7n9vLYx1XH6xt/s9BKLkoNKCNdI6x6BjRI3SllaXhP+rWL3IUyVq7SkraSWO47of5VW+mZ1iQhiLDWjzwNPzKiDUyslJYjbLIJ+M30yKwT/5g
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(6486002)(31696002)(66476007)(66946007)(66556008)(8676002)(4326008)(86362001)(110136005)(2616005)(316002)(5660300002)(6512007)(30864003)(38100700002)(31686004)(53546011)(6506007)(2906002)(66574015)(186003)(44832011)(83380400001)(8936002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDBlT3RCNUg3WHAwb1lXak9ycFBvaklmMXlVbTlmdVRxWjc3Skhkd1ZYYlhY?=
 =?utf-8?B?NHJUTnRFQytzYUd2YUNVaWxtV1hQZ3dQNnZZVWNkOVJxYVk5TDlGWEduSW1i?=
 =?utf-8?B?RFZ4L1RsT1VCWVRQaW5xYXUzMytmNHdXcFdDRy9uNmlVa2IrTjdlSStxTXht?=
 =?utf-8?B?OHNhak9pbTd4YlJXVFRTT0EzQkFaS3hyMWcvdXVIUi9Qa3ptQ2QxUmNKQkpS?=
 =?utf-8?B?WUhnQlFDUmRkNUZrSDl0c0RuSm5teDBwSkdoRXlHVTV4cFhkT0VYbzRJUnU3?=
 =?utf-8?B?M3dxU0xLU0FQR1RMZDE2SXgvQ3pOMUhKRHVXaVFneEdZTGdpdmlCZy9BRTl3?=
 =?utf-8?B?S1Vkc1l4aXdnNytxNks2UGNhd3NHSXVsd29tWEY2OXYycjBKamdkUVRyanZK?=
 =?utf-8?B?cnNzNXhCdkFwQzhTQjJrbzNvWS9sY0VvZERIdFQ1alNTZ0xFdDJRTXV1L2hJ?=
 =?utf-8?B?ZUJPbHlyWnY3SzRrL2pSdG01VFF2Tk9xTjVjU1h5QmtKVHcrenhCR0N0Wkds?=
 =?utf-8?B?WWtFTzBqcGRqYmZzcms4RWdnNXZLemxudWR2aDlud1lLTHR2czg2TjE1OVZ1?=
 =?utf-8?B?aUkwR3Yvblp6YXlZZ3BpQUd4VUw3akNoY1FqWFJqb0xwaE5OWExseGtsZUhm?=
 =?utf-8?B?MUlaYVh2MklxSWlrV3BaNE4waWNpS0lpUzNzNUJKaGpRSHhzb0trREhtZ3Vy?=
 =?utf-8?B?cmxrdVBZaG9KanhOeHg2VzJLS3BacG9KcDMvbGhnZzRvWDkvOXBUS2RtTkpX?=
 =?utf-8?B?WkUvREJiTjFKeklzVEdvMS95SnhHOTBhamtKN05xcDBYMmtWRG5FUGd3Y1l4?=
 =?utf-8?B?T1pVejd3WEFtUi93b3RHLytnNFFDZDFheXV0K0RGQ2tzWi9COTFBUlZEbEsx?=
 =?utf-8?B?ZHhXTy9UR3ZIRWVaM2kwMFFYbVE1Mm5obUhaU3l4S0RhdFRDUTZ3aGZCYkYz?=
 =?utf-8?B?dVc4STNFOEcwUjVnMTR5VnlvbGd6SUU2Nzd4bmRsNWdKdmE4YmhnRTRLQmRJ?=
 =?utf-8?B?KzRZUnFpeGs1a2FwbnJYbHMwVlhpTktTSDBGdW1kcUZoS1FKV3lSWVpQQ0dk?=
 =?utf-8?B?QWN6aUZpQWNOem41N2NDUjl6eXB3ZzRrSCsrSTIzZmg5bFZyVXZKd3JiYVY0?=
 =?utf-8?B?TFZNMjJZNTc3QmppYWFtMGdzWDJNTkIrWms3WDRYQ1JUVXg3WUhXMzY1MTJJ?=
 =?utf-8?B?OVJDMXNCQ251MUt5VjBaajNGK1hqOXRFUXFpZ2FVaGlVb1ZJcXFIZGp0MEkr?=
 =?utf-8?B?TTlqb1NZMFZMSWp4eTJmVFZRQVl6VFNKM2EwQU1pSE8zUllqOTMwYzNXQmo4?=
 =?utf-8?B?Uk9DRXBPRVpCbTBqTmMrTHhCenpkeDNnSHFjR1BpR3pwd2tkWDFBaTE4azhl?=
 =?utf-8?B?QWFBenJZajdEb0RsbnJyOENaTHVlV0EzcHlsU0lhQkJ3MnlJR3lwMzBtVEFI?=
 =?utf-8?B?bFpZajB2SnZvNU9oOWtRSTdURk9TcXppYzJxYkdqVllpZGFkaVcwdi90Ykd2?=
 =?utf-8?B?QzZ5RkV6UzhtdWZRTmFYZFhGS2VraDQxQUxCY3BmOXBGRnJ3STFYU3dqblVk?=
 =?utf-8?B?Y2NUYVBDTUh3RnFKdEh5Y1JVZTk4TVgxeFVHY0xCb3JGMEt2VXg4dkR5MWND?=
 =?utf-8?B?NDB1RE9sZmpFMlphZ2ZzYUZ3aFA2L3JVWFFHWGgwOUpSS2pZVXBteVJtWXda?=
 =?utf-8?B?enlJS2RMdktxcnZHQlA3VVhPZDlycXM1K1NvMVVRTi9hMXR4bjFjVTlMUlJI?=
 =?utf-8?B?bk40VmFLejJIWE5ldXZ4KzFxQlY2alZpM2JWTnN0NERaUGNJbDJySUxiVVBj?=
 =?utf-8?B?ZWphdGJrTC8raGlaR0h4VTM3LzVrMXN6ZkZ1Ym5vZlQyOGhrNTBpeVgzTS96?=
 =?utf-8?B?elBqL0gxdEtpSW5jcXE1Tmk1R282OFdjV0tMMXh1N1czV3dFTGpRbndJVzZC?=
 =?utf-8?B?QU94OVRKbXZwY1N4STNyNk1tQURIcFQzc3Azb2Fvd2tXTzVIVWxZeUhnTDVC?=
 =?utf-8?B?bTFIbEdZZ2hWdjJtbEF3ZXdPcVh5NEY4SkYwWW8yNWtndzZtZWxya3BkdTk2?=
 =?utf-8?B?UmdxZ28zOGdlM1BGRml1R2dqOHdDZkk1cUxlMWNFZTMvdHdOQUZCaEZHME5W?=
 =?utf-8?B?eDQra3ZlcjBRNEY5bXZtMlQrMkJ0eS9sM1FqNkVvTnllODVqbktEa3hrQzBK?=
 =?utf-8?B?SDBQcEtoTFJhbFBjRHdUZ3lScEI2cHJpVnc0ZkhCaU53aDNJS1ZlWkZtSTBQ?=
 =?utf-8?B?RE1lVUpmZ3RKZ0QzTnh4Wmo5T09nWWdIK2IvUnNiYVlaUHFsR0RMTHBpc3g3?=
 =?utf-8?B?eXZBN1pHSllaNktEaWJMZDR1VXFPdTNiMTlYVWRrR0g4b2FxUkV1VEorRlZO?=
 =?utf-8?Q?gp12RfKPDcREgGh3nWAzfV7Ds80i7IkzaDZGCDxfodm7b?=
X-MS-Exchange-AntiSpam-MessageData-1: YmKzidxCbY5UXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a6bbc4-18a1-40f3-6aac-08da3366eda3
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 15:57:19.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LoLWXytLcGmx8pJVqyc+3HAwWVCgb2FVkjIPwHWoJ5sGPa4sOSdXllhgM4m/NMM5XZ4rIOAw7gb/JcqdTa++uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3908
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
Cc: Bai Zoy <Zoy.Bai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


On 2022-05-11 11:39, Christian König wrote:
> Am 11.05.22 um 17:35 schrieb Andrey Grodzovsky:
>> On 2022-05-11 11:20, Lazar, Lijo wrote:
>>>
>>>
>>> On 5/11/2022 7:28 PM, Christian König wrote:
>>>> Am 11.05.22 um 15:43 schrieb Andrey Grodzovsky:
>>>>> On 2022-05-11 03:38, Christian König wrote:
>>>>>> Am 10.05.22 um 20:53 schrieb Andrey Grodzovsky:
>>>>>>> [SNIP]
>>>>>>>> E.g. in the reset code (either before or after the reset, 
>>>>>>>> that's debatable) you do something like this:
>>>>>>>>
>>>>>>>> for (i = 0; i < num_ring; ++i)
>>>>>>>>     cancel_delayed_work(ring[i]->scheduler....)
>>>>>>>> cancel_work(adev->ras_work);
>>>>>>>> cancel_work(adev->iofault_work);
>>>>>>>> cancel_work(adev->debugfs_work);
>>>>>>>> ...
>>>>>>>>
>>>>>>>> You don't really need to track which reset source has fired and 
>>>>>>>> which hasn't, because that would be racy again. Instead just 
>>>>>>>> bluntly reset all possible sources.
>>>>>>>>
>>>>>>>> Christian.
>>>>>>>
>>>>>>>
>>>>>>> I don't say we care if it fired once or twice (I need to add a 
>>>>>>> fix to only insert reset work to pending reset list if it's not 
>>>>>>> already there), the point of using list (or array) to which you 
>>>>>>> add and from which you remove is that the logic of this is 
>>>>>>> encapsulated within reset domain. In your way we need to be 
>>>>>>> aware who exactly schedules reset work and explicitly cancel 
>>>>>>> them, this also means that for any new source added in the 
>>>>>>> future you will need to remember to add him
>>>>>>
>>>>>> I don't think that this is a valid argument. Additionally to the 
>>>>>> schedulers we probably just need less than a handful of reset 
>>>>>> sources, most likely even just one or two is enough.
>>>>>>
>>>>>> The only justification I can see of having additional separate 
>>>>>> reset sources would be if somebody wants to know if a specific 
>>>>>> source has been handled or not (e.g. call flush_work() or 
>>>>>> work_pending()). Like in the case of a reset triggered through 
>>>>>> debugfs.
>>>>>
>>>>>
>>>>> This is indeed one reason, another is as we said before that if 
>>>>> you share 'reset source' (meaning a delayed work) with another 
>>>>> client (i.e. RAS and KFD) it means you make assumption that the 
>>>>> other client always proceeds with the
>>>>> reset exactly the same way as you expect. So today we have this 
>>>>> only in scheduler vs non scheduler reset happening - non scheduler 
>>>>> reset clients assume the reset is always fully executed in HW 
>>>>> while scheduler based reset makes shortcuts and not always does HW 
>>>>> reset hence they cannot share 'reset source' (delayed work). Yes, 
>>>>> we can always add this in the future if and when such problem will 
>>>>> arise but no one will remember this then and a new bug will be 
>>>>> introduced and will take time to find and resolve.
>>>>
>>>> Mhm, so your main concern is that we forget to correctly handle the 
>>>> new reset sources?
>>>>
>>>> How about we do it like this then:
>>>>
>>>> struct amdgpu_reset_domain {
>>>>      ....
>>>>      union {
>>>>          struct {
>>>>              struct work_item debugfs;
>>>>              struct work_item ras;
>>>>              ....
>>>>          };
>>>>          struct work_item array[]
>>>>      } reset_sources;
>>>> }
>>>>
>>>
>>> If it's only about static array,
>>>
>>> enum amdgpu_reset_soruce {
>>>
>>> AMDGPU_RESET_SRC_RAS,
>>> AMDGPU_RESET_SRC_ABC,
>>> .....
>>> AMDGPU_RESET_SRC_XYZ,
>>> AMDGPU_RESET_SRC_MAX
>>>
>>> };
>>>
>>> struct work_struct reset_work[AMDGPU_RESET_SRC_MAX]; => An index for 
>>> each work item
>>>
>>>
>>> Thanks,
>>> Lijo
>>
>>
>> It's possible though it makes harder to generalize reset_domain later 
>> for other drivers.
>> But still one caveat, look at amdgpu_recover_work_struct and it's 
>> usage in amdgpu_device_gpu_recover and in gpu_recover_get,
>> At least for debugfs i need to return back the result of GPU reset 
>> and so I cannot store actual work items in the array mentioned above
>> but rather pointers to work_item because i need a way to get back the 
>> return value from gpu_recover like I do now in 
>> amdgpu_device_gpu_recover.
>
> You should try to avoid that as well.


Why ?


>
> See when the debugfs reset is canceled because of a scheduler reset 
> you won't get a useful return code either.


That true.

>
> What we should do instead is to cache the status of the last reset in 
> the reset domain.


Probably an atomic ret in reset_domain then.

Another 2 points i forgot to ask -

1) What race condition you had in mind about insertion and extraction 
from the list if all is done under lock ?

2) This I asked already - why you opposed so much to allocation on the 
stack ? I understand the problem with dynamic memory allocations but why 
stack ? We do multiple allocations on the stack for any function
we call during GPU reset, what so special in this case where we allocate 
work struct on the stack? It's not like the work struct is especially 
big compared to other stuff we allocate on the stack.

Andrey


>
> Regards,
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>>> Not 100% sure if that works, but something like that should do the 
>>>> trick.
>>>>
>>>> My main concern is that I don't want to allocate the work items on 
>>>> the stack and dynamic allocation (e.g. kmalloc) is usually not 
>>>> possible either.
>>>>
>>>> Additional to that putting/removing work items from a list, array 
>>>> or other container is a very common source for race conditions.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>> to the cancellation list which you showed above. In current way 
>>>>>>> all this done automatically within reset_domain code and it's 
>>>>>>> agnostic to specific driver and it's specific list of reset 
>>>>>>> sources. Also in case we would want to generalize reset_domain 
>>>>>>> to other GPU drivers (which was
>>>>>>> a plan as far as i remember) this explicit mention of each reset 
>>>>>>> works for cancellation is again less suitable in my opinion.
>>>>>>
>>>>>> Well we could put the work item for the scheduler independent 
>>>>>> reset source into the reset domain as well. But I'm not sure 
>>>>>> those additional reset sources should be part of any common 
>>>>>> handling, that is largely amdgpu specific.
>>>>>
>>>>>
>>>>> So it's for sure more then one source for the reasons described 
>>>>> above, also note that for scheduler we already cancel delayed work 
>>>>> in drm_sched_stop so calling them again in amdgpu code kind of 
>>>>> superfluous.
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> The only difference is I chose to do the canceling right 
>>>>>>>>>>> BEFORE the HW reset and not AFTER. I did this because I see 
>>>>>>>>>>> a possible race where a new reset request is being generated 
>>>>>>>>>>> exactly after we finished the HW reset but before we 
>>>>>>>>>>> canceled out all pending resets - in such case you wold not 
>>>>>>>>>>> want to cancel this 'border line new' reset request.
>>>>>>>>>>
>>>>>>>>>> Why not? Any new reset request directly after a hardware 
>>>>>>>>>> reset is most likely just falsely generated by the reset itself.
>>>>>>>>>>
>>>>>>>>>> Ideally I would cancel all sources after the reset, but 
>>>>>>>>>> before starting any new work.
>>>>>>>>>>
>>>>>>>>>> Regards,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Andrey
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>>> You can see that if many different reset sources share 
>>>>>>>>>>>>>> same work struct what can happen is that the first to 
>>>>>>>>>>>>>> obtain the lock you describe bellow might opt out from 
>>>>>>>>>>>>>> full HW reset because his bad job did signal for example 
>>>>>>>>>>>>>> or because his hunged IP block was able to recover 
>>>>>>>>>>>>>> through SW reset but in the meantime another reset source 
>>>>>>>>>>>>>> who needed an actual HW reset just silently returned and 
>>>>>>>>>>>>>> we end up with unhandled reset request. True that today 
>>>>>>>>>>>>>> this happens only to job timeout reset sources that are 
>>>>>>>>>>>>>> handled form within the scheduler and won't use this 
>>>>>>>>>>>>>> single work struct but no one prevents a future case for 
>>>>>>>>>>>>>> this to happen and also, if we actually want to unify 
>>>>>>>>>>>>>> scheduler time out handlers within reset domain (which 
>>>>>>>>>>>>>> seems to me the right design approach) we won't be able 
>>>>>>>>>>>>>> to use just one work struct for this reason anyway.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> Just to add to this point - a reset domain is co-operative 
>>>>>>>>>>>>> domain. In addition to sharing a set of clients from 
>>>>>>>>>>>>> various reset sources for one device, it also will have a 
>>>>>>>>>>>>> set of devices like in XGMI hive. The job timeout on one 
>>>>>>>>>>>>> device may not eventually result in result, but a RAS 
>>>>>>>>>>>>> error happening on another device at the same time would 
>>>>>>>>>>>>> need a reset. The second device's RAS error cannot return 
>>>>>>>>>>>>> seeing that a reset work already started, or ignore the 
>>>>>>>>>>>>> reset work given that another device has filled the reset 
>>>>>>>>>>>>> data.
>>>>>>>>>>>>>
>>>>>>>>>>>>> When there is a reset domain, it should take care of the 
>>>>>>>>>>>>> work scheduled and keeping it in device or any other level 
>>>>>>>>>>>>> doesn't sound good.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>> Lijo
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I'd put the reset work struct into the reset_domain 
>>>>>>>>>>>>>>> struct. That way you'd have exactly one worker for the 
>>>>>>>>>>>>>>> reset domain. You could implement a lock-less scheme to 
>>>>>>>>>>>>>>> decide whether you need to schedule a reset, e.g. using 
>>>>>>>>>>>>>>> an atomic counter in the shared work struct that gets 
>>>>>>>>>>>>>>> incremented when a client wants to trigger a reset 
>>>>>>>>>>>>>>> (atomic_add_return). If that counter is exactly 1 after 
>>>>>>>>>>>>>>> incrementing, you need to fill in the rest of the work 
>>>>>>>>>>>>>>> struct and schedule the work. Otherwise, it's already 
>>>>>>>>>>>>>>> scheduled (or another client is in the process of 
>>>>>>>>>>>>>>> scheduling it) and you just return. When the worker 
>>>>>>>>>>>>>>> finishes (after confirming a successful reset), it 
>>>>>>>>>>>>>>> resets the counter to 0, so the next client requesting a 
>>>>>>>>>>>>>>> reset will schedule the worker again.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>>>   Felix
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Additional to that keep in mind that you can't 
>>>>>>>>>>>>>>>>> allocate any memory before or during the GPU reset nor 
>>>>>>>>>>>>>>>>> wait for the reset to complete (so you can't allocate 
>>>>>>>>>>>>>>>>> anything on the stack either).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> There is no dynamic allocation here, regarding stack 
>>>>>>>>>>>>>>>> allocations - we do it all the time when we call 
>>>>>>>>>>>>>>>> functions, even during GPU resets, how on stack 
>>>>>>>>>>>>>>>> allocation of work struct in amdgpu_device_gpu_recover 
>>>>>>>>>>>>>>>> is different from any other local variable we allocate 
>>>>>>>>>>>>>>>> in any function we call ?
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I am also not sure why it's not allowed to wait for 
>>>>>>>>>>>>>>>> reset to complete ? Also, see in amdgpu_ras_do_recovery 
>>>>>>>>>>>>>>>> and gpu_recover_get (debugfs) - the caller expects the 
>>>>>>>>>>>>>>>> reset to complete before he returns. I can probably 
>>>>>>>>>>>>>>>> work around it in RAS code by calling 
>>>>>>>>>>>>>>>> atomic_set(&ras->in_recovery, 0) from some callback 
>>>>>>>>>>>>>>>> within actual reset function but regarding sysfs it 
>>>>>>>>>>>>>>>> actually expects a result returned indicating whether 
>>>>>>>>>>>>>>>> the call was successful or not.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> I don't think that concept you try here will work.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Also in general seems to me it's cleaner approach 
>>>>>>>>>>>>>>>>>> where this logic (the work items) are held and 
>>>>>>>>>>>>>>>>>> handled in reset_domain and are not split in each 
>>>>>>>>>>>>>>>>>> adev or any other entity. We might want in the future 
>>>>>>>>>>>>>>>>>> to even move the scheduler handling into reset domain 
>>>>>>>>>>>>>>>>>> since reset domain is supposed to be a generic things 
>>>>>>>>>>>>>>>>>> and not only or AMD.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Andrey
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky 
>>>>>>>>>>>>>>>>>>>>>> <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>>>>>>>>>> Tested-by: Bai Zoy <Zoy.Bai@amd.com>
>>>>>>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu.h | 11 +---
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 
>>>>>>>>>>>>>>>>>>>>>> +++--
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 3 +
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h | 73 
>>>>>>>>>>>>>>>>>>>>>> +++++++++++++++++++++-
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h | 3 +-
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 7 ++-
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 7 ++-
>>>>>>>>>>>>>>>>>>>>>> drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 7 ++-
>>>>>>>>>>>>>>>>>>>>>>   8 files changed, 104 insertions(+), 24 
>>>>>>>>>>>>>>>>>>>>>> deletions(-)
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>>>>>>>>>>>>>>>> index 4264abc5604d..99efd8317547 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>>>>>>>>>>>>>>>>>>>> @@ -109,6 +109,7 @@
>>>>>>>>>>>>>>>>>>>>>>   #include "amdgpu_fdinfo.h"
>>>>>>>>>>>>>>>>>>>>>>   #include "amdgpu_mca.h"
>>>>>>>>>>>>>>>>>>>>>>   #include "amdgpu_ras.h"
>>>>>>>>>>>>>>>>>>>>>> +#include "amdgpu_reset.h"
>>>>>>>>>>>>>>>>>>>>>>     #define MAX_GPU_INSTANCE 16
>>>>>>>>>>>>>>>>>>>>>>   @@ -509,16 +510,6 @@ struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_allowed_register_entry {
>>>>>>>>>>>>>>>>>>>>>>       bool grbm_indexed;
>>>>>>>>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>>>>>>>>   -enum amd_reset_method {
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_NONE = -1,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_LEGACY = 0,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_MODE0,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_MODE1,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_MODE2,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_BACO,
>>>>>>>>>>>>>>>>>>>>>> - AMD_RESET_METHOD_PCI,
>>>>>>>>>>>>>>>>>>>>>> -};
>>>>>>>>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>>>>>>>>   struct amdgpu_video_codec_info {
>>>>>>>>>>>>>>>>>>>>>>       u32 codec_type;
>>>>>>>>>>>>>>>>>>>>>>       u32 max_width;
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>>>>>>>>>>>>>> index e582f1044c0f..7fa82269c30f 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>>>>>>>>>>>>>>>> @@ -5201,6 +5201,12 @@ int 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_gpu_recover_imp(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>>>>>>>>>>       }
>>>>>>>>>>>>>>>>>>>>>> tmp_vram_lost_counter = 
>>>>>>>>>>>>>>>>>>>>>> atomic_read(&((adev)->vram_lost_counter));
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    /* Drop all pending resets since we will 
>>>>>>>>>>>>>>>>>>>>>> reset now anyway */
>>>>>>>>>>>>>>>>>>>>>> +    tmp_adev = 
>>>>>>>>>>>>>>>>>>>>>> list_first_entry(device_list_handle, struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device,
>>>>>>>>>>>>>>>>>>>>>> + reset_list);
>>>>>>>>>>>>>>>>>>>>>> + amdgpu_reset_pending_list(tmp_adev->reset_domain);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>       /* Actual ASIC resets if needed.*/
>>>>>>>>>>>>>>>>>>>>>>       /* Host driver will handle XGMI hive reset 
>>>>>>>>>>>>>>>>>>>>>> for SRIOV */
>>>>>>>>>>>>>>>>>>>>>>       if (amdgpu_sriov_vf(adev)) {
>>>>>>>>>>>>>>>>>>>>>> @@ -5296,7 +5302,7 @@ int 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_gpu_recover_imp(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device *adev,
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     struct amdgpu_recover_work_struct {
>>>>>>>>>>>>>>>>>>>>>> -    struct work_struct base;
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_reset_work_struct base;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_device *adev;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_job *job;
>>>>>>>>>>>>>>>>>>>>>>       int ret;
>>>>>>>>>>>>>>>>>>>>>> @@ -5304,7 +5310,7 @@ struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_recover_work_struct {
>>>>>>>>>>>>>>>>>>>>>>     static void 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_queue_gpu_recover_work(struct 
>>>>>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> -    struct amdgpu_recover_work_struct 
>>>>>>>>>>>>>>>>>>>>>> *recover_work = container_of(work, struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_recover_work_struct, base);
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_recover_work_struct 
>>>>>>>>>>>>>>>>>>>>>> *recover_work = container_of(work, struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_recover_work_struct, base.base.work);
>>>>>>>>>>>>>>>>>>>>>> recover_work->ret = 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_gpu_recover_imp(recover_work->adev, 
>>>>>>>>>>>>>>>>>>>>>> recover_work->job);
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>> @@ -5316,12 +5322,15 @@ int 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_gpu_recover(struct amdgpu_device 
>>>>>>>>>>>>>>>>>>>>>> *adev,
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_recover_work_struct work = 
>>>>>>>>>>>>>>>>>>>>>> {.adev = adev, .job = job};
>>>>>>>>>>>>>>>>>>>>>>   - INIT_WORK(&work.base, 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_queue_gpu_recover_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_DELAYED_WORK(&work.base.base, 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device_queue_gpu_recover_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_LIST_HEAD(&work.base.node);
>>>>>>>>>>>>>>>>>>>>>>         if 
>>>>>>>>>>>>>>>>>>>>>> (!amdgpu_reset_domain_schedule(adev->reset_domain, 
>>>>>>>>>>>>>>>>>>>>>> &work.base))
>>>>>>>>>>>>>>>>>>>>>>           return -EAGAIN;
>>>>>>>>>>>>>>>>>>>>>>   - flush_work(&work.base);
>>>>>>>>>>>>>>>>>>>>>> + flush_delayed_work(&work.base.base);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>>>>>>>>>>>>>>>>>>>>> &work.base);
>>>>>>>>>>>>>>>>>>>>>>         return work.ret;
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>>>>>>>>>>>>>>>>>>>> index c80af0889773..ffddd419c351 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>>>>>>>>>>>>>>>>>>>>> @@ -134,6 +134,9 @@ struct amdgpu_reset_domain 
>>>>>>>>>>>>>>>>>>>>>> *amdgpu_reset_create_reset_domain(enum 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_d
>>>>>>>>>>>>>>>>>>>>>> atomic_set(&reset_domain->in_gpu_reset, 0);
>>>>>>>>>>>>>>>>>>>>>> init_rwsem(&reset_domain->sem);
>>>>>>>>>>>>>>>>>>>>>>   + INIT_LIST_HEAD(&reset_domain->pending_works);
>>>>>>>>>>>>>>>>>>>>>> + mutex_init(&reset_domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>       return reset_domain;
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>   diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>>>>>>>>>>>>>>>>>>>> index 1949dbe28a86..863ec5720fc1 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>>>>>>>>>>>>>>>>>>>>> @@ -24,7 +24,18 @@
>>>>>>>>>>>>>>>>>>>>>>   #ifndef __AMDGPU_RESET_H__
>>>>>>>>>>>>>>>>>>>>>>   #define __AMDGPU_RESET_H__
>>>>>>>>>>>>>>>>>>>>>>   -#include "amdgpu.h"
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/atomic.h>
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/mutex.h>
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/list.h>
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/kref.h>
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/rwsem.h>
>>>>>>>>>>>>>>>>>>>>>> +#include <linux/workqueue.h>
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +struct amdgpu_device;
>>>>>>>>>>>>>>>>>>>>>> +struct amdgpu_job;
>>>>>>>>>>>>>>>>>>>>>> +struct amdgpu_hive_info;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>     enum AMDGPU_RESET_FLAGS {
>>>>>>>>>>>>>>>>>>>>>>   @@ -32,6 +43,17 @@ enum AMDGPU_RESET_FLAGS {
>>>>>>>>>>>>>>>>>>>>>> AMDGPU_SKIP_HW_RESET = 1,
>>>>>>>>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>>>>>>>>   +
>>>>>>>>>>>>>>>>>>>>>> +enum amd_reset_method {
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_NONE = -1,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_LEGACY = 0,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_MODE0,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_MODE1,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_MODE2,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_BACO,
>>>>>>>>>>>>>>>>>>>>>> + AMD_RESET_METHOD_PCI,
>>>>>>>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>   struct amdgpu_reset_context {
>>>>>>>>>>>>>>>>>>>>>>       enum amd_reset_method method;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_device *reset_req_dev;
>>>>>>>>>>>>>>>>>>>>>> @@ -40,6 +62,8 @@ struct amdgpu_reset_context {
>>>>>>>>>>>>>>>>>>>>>>       unsigned long flags;
>>>>>>>>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>>>>>>>>   +struct amdgpu_reset_control;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>   struct amdgpu_reset_handler {
>>>>>>>>>>>>>>>>>>>>>>       enum amd_reset_method reset_method;
>>>>>>>>>>>>>>>>>>>>>>       struct list_head handler_list;
>>>>>>>>>>>>>>>>>>>>>> @@ -76,12 +100,21 @@ enum amdgpu_reset_domain_type {
>>>>>>>>>>>>>>>>>>>>>>       XGMI_HIVE
>>>>>>>>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>>>>>>>>   +
>>>>>>>>>>>>>>>>>>>>>> +struct amdgpu_reset_work_struct {
>>>>>>>>>>>>>>>>>>>>>> +    struct delayed_work base;
>>>>>>>>>>>>>>>>>>>>>> +    struct list_head node;
>>>>>>>>>>>>>>>>>>>>>> +};
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>>   struct amdgpu_reset_domain {
>>>>>>>>>>>>>>>>>>>>>>       struct kref refcount;
>>>>>>>>>>>>>>>>>>>>>>       struct workqueue_struct *wq;
>>>>>>>>>>>>>>>>>>>>>>       enum amdgpu_reset_domain_type type;
>>>>>>>>>>>>>>>>>>>>>>       struct rw_semaphore sem;
>>>>>>>>>>>>>>>>>>>>>>       atomic_t in_gpu_reset;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    struct list_head pending_works;
>>>>>>>>>>>>>>>>>>>>>> +    struct mutex reset_lock;
>>>>>>>>>>>>>>>>>>>>>>   };
>>>>>>>>>>>>>>>>>>>>>>     @@ -113,9 +146,43 @@ static inline void 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_put_reset_domain(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain *dom
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     static inline bool 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_schedule(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain *domain,
>>>>>>>>>>>>>>>>>>>>>> - struct work_struct *work)
>>>>>>>>>>>>>>>>>>>>>> + struct amdgpu_reset_work_struct *work)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> -    return queue_work(domain->wq, work);
>>>>>>>>>>>>>>>>>>>>>> + mutex_lock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    if (!queue_delayed_work(domain->wq, 
>>>>>>>>>>>>>>>>>>>>>> &work->base, 0)) {
>>>>>>>>>>>>>>>>>>>>>> + mutex_unlock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> +        return false;
>>>>>>>>>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + list_add_tail(&work->node, 
>>>>>>>>>>>>>>>>>>>>>> &domain->pending_works);
>>>>>>>>>>>>>>>>>>>>>> + mutex_unlock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +    return true;
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +static inline void 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_del_pendning_work(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain *domain,
>>>>>>>>>>>>>>>>>>>>>> + struct amdgpu_reset_work_struct *work)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> + mutex_lock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> + list_del_init(&work->node);
>>>>>>>>>>>>>>>>>>>>>> + mutex_unlock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +static inline void 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_pending_list(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain *domain)
>>>>>>>>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_reset_work_struct *entry, *tmp;
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + mutex_lock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>> + list_for_each_entry_safe(entry, tmp, 
>>>>>>>>>>>>>>>>>>>>>> &domain->pending_works, node) {
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + list_del_init(&entry->node);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> +        /* Stop any other related pending resets */
>>>>>>>>>>>>>>>>>>>>>> + cancel_delayed_work(&entry->base);
>>>>>>>>>>>>>>>>>>>>>> +    }
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + mutex_unlock(&domain->reset_lock);
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     void amdgpu_device_lock_reset_domain(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain *reset_domain);
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>>>>>>>>>>>>>>>>>>>>> index 239f232f9c02..574e870d3064 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h
>>>>>>>>>>>>>>>>>>>>>> @@ -25,6 +25,7 @@
>>>>>>>>>>>>>>>>>>>>>>   #define AMDGPU_VIRT_H
>>>>>>>>>>>>>>>>>>>>>>     #include "amdgv_sriovmsg.h"
>>>>>>>>>>>>>>>>>>>>>> +#include "amdgpu_reset.h"
>>>>>>>>>>>>>>>>>>>>>>     #define AMDGPU_SRIOV_CAPS_SRIOV_VBIOS (1 << 
>>>>>>>>>>>>>>>>>>>>>> 0) /* vBIOS is sr-iov ready */
>>>>>>>>>>>>>>>>>>>>>>   #define AMDGPU_SRIOV_CAPS_ENABLE_IOV (1 << 1) 
>>>>>>>>>>>>>>>>>>>>>> /* sr-iov is enabled on this GPU */
>>>>>>>>>>>>>>>>>>>>>> @@ -230,7 +231,7 @@ struct amdgpu_virt {
>>>>>>>>>>>>>>>>>>>>>>       uint32_t reg_val_offs;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_irq_src ack_irq;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_irq_src rcv_irq;
>>>>>>>>>>>>>>>>>>>>>> -    struct work_struct flr_work;
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_reset_work_struct flr_work;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_mm_table mm_table;
>>>>>>>>>>>>>>>>>>>>>>       const struct amdgpu_virt_ops *ops;
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_vf_error_buffer vf_errors;
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>>>>> index b81acf59870c..f3d1c2be9292 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>>>>>>>>> @@ -251,7 +251,7 @@ static int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_ai_set_mailbox_ack_irq(struct amdgpu_device 
>>>>>>>>>>>>>>>>>>>>>> *adev,
>>>>>>>>>>>>>>>>>>>>>>     static void xgpu_ai_mailbox_flr_work(struct 
>>>>>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> -    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, flr_work);
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, 
>>>>>>>>>>>>>>>>>>>>>> flr_work.base.work);
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_device *adev = 
>>>>>>>>>>>>>>>>>>>>>> container_of(virt, struct amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>>>>>       int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>>>>>   @@ -380,7 +380,8 @@ int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_ai_mailbox_get_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>           return r;
>>>>>>>>>>>>>>>>>>>>>>       }
>>>>>>>>>>>>>>>>>>>>>>   - INIT_WORK(&adev->virt.flr_work, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_ai_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_ai_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>>>>>>>>>>>>>>>>>>>>         return 0;
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>> @@ -389,6 +390,8 @@ void 
>>>>>>>>>>>>>>>>>>>>>> xgpu_ai_mailbox_put_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>>>>>>>>>>>>>>>>>>>>> &adev->virt.flr_work);
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     static int xgpu_ai_request_init_data(struct 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>>>>> index 22c10b97ea81..927b3d5bb1d0 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>>>>>>>>> @@ -275,7 +275,7 @@ static int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_nv_set_mailbox_ack_irq(struct amdgpu_device 
>>>>>>>>>>>>>>>>>>>>>> *adev,
>>>>>>>>>>>>>>>>>>>>>>     static void xgpu_nv_mailbox_flr_work(struct 
>>>>>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> -    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, flr_work);
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, 
>>>>>>>>>>>>>>>>>>>>>> flr_work.base.work);
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_device *adev = 
>>>>>>>>>>>>>>>>>>>>>> container_of(virt, struct amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>>>>>       int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>>>>>>>>   @@ -407,7 +407,8 @@ int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_nv_mailbox_get_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>           return r;
>>>>>>>>>>>>>>>>>>>>>>       }
>>>>>>>>>>>>>>>>>>>>>>   - INIT_WORK(&adev->virt.flr_work, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_nv_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_nv_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>>>>>>>>>>>>>>>>>>>>         return 0;
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>> @@ -416,6 +417,8 @@ void 
>>>>>>>>>>>>>>>>>>>>>> xgpu_nv_mailbox_put_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>>>>>>>>>>>>>>>>>>>>> &adev->virt.flr_work);
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     const struct amdgpu_virt_ops xgpu_nv_virt_ops 
>>>>>>>>>>>>>>>>>>>>>> = {
>>>>>>>>>>>>>>>>>>>>>> diff --git 
>>>>>>>>>>>>>>>>>>>>>> a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c 
>>>>>>>>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>>>>>>>>>>>>>>>>>>>>> index 7b63d30b9b79..1d4ef5c70730 100644
>>>>>>>>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>>>>>>>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>>>>>>>>>>>>>>>>>>>>> @@ -512,7 +512,7 @@ static int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_vi_set_mailbox_ack_irq(struct amdgpu_device 
>>>>>>>>>>>>>>>>>>>>>> *adev,
>>>>>>>>>>>>>>>>>>>>>>     static void xgpu_vi_mailbox_flr_work(struct 
>>>>>>>>>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> -    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, flr_work);
>>>>>>>>>>>>>>>>>>>>>> +    struct amdgpu_virt *virt = 
>>>>>>>>>>>>>>>>>>>>>> container_of(work, struct amdgpu_virt, 
>>>>>>>>>>>>>>>>>>>>>> flr_work.base.work);
>>>>>>>>>>>>>>>>>>>>>>       struct amdgpu_device *adev = 
>>>>>>>>>>>>>>>>>>>>>> container_of(virt, struct amdgpu_device, virt);
>>>>>>>>>>>>>>>>>>>>>>         /* wait until RCV_MSG become 3 */
>>>>>>>>>>>>>>>>>>>>>> @@ -610,7 +610,8 @@ int 
>>>>>>>>>>>>>>>>>>>>>> xgpu_vi_mailbox_get_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>           return r;
>>>>>>>>>>>>>>>>>>>>>>       }
>>>>>>>>>>>>>>>>>>>>>>   - INIT_WORK(&adev->virt.flr_work, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_vi_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_DELAYED_WORK(&adev->virt.flr_work.base, 
>>>>>>>>>>>>>>>>>>>>>> xgpu_vi_mailbox_flr_work);
>>>>>>>>>>>>>>>>>>>>>> + INIT_LIST_HEAD(&adev->virt.flr_work.node);
>>>>>>>>>>>>>>>>>>>>>>         return 0;
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>> @@ -619,6 +620,8 @@ void 
>>>>>>>>>>>>>>>>>>>>>> xgpu_vi_mailbox_put_irq(struct amdgpu_device *adev)
>>>>>>>>>>>>>>>>>>>>>>   {
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.ack_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> amdgpu_irq_put(adev, &adev->virt.rcv_irq, 0);
>>>>>>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>>>>>>> + 
>>>>>>>>>>>>>>>>>>>>>> amdgpu_reset_domain_del_pendning_work(adev->reset_domain, 
>>>>>>>>>>>>>>>>>>>>>> &adev->virt.flr_work);
>>>>>>>>>>>>>>>>>>>>>>   }
>>>>>>>>>>>>>>>>>>>>>>     const struct amdgpu_virt_ops xgpu_vi_virt_ops 
>>>>>>>>>>>>>>>>>>>>>> = {
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>
