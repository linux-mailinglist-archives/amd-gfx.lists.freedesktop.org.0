Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F69AF79D
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 04:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF7B10E9E4;
	Fri, 25 Oct 2024 02:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h1OjPnRp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3630E10E9E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 25 Oct 2024 02:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/wRHSvcuwUB94oKY01zrCNCBWDSOHro77aRPiGEHM1DgO2V5Od1Wndh8TAdxdnq9c2bqLzWPx5ZsViIViM5LxqTGCVpaQ5KFA1WJGUQ3xy7luUupMIeVjWGMz64IHNwmzb+ThDvXcAzT4gBgzmYEYWdTJNTCinwyPamOXqZkW8QfPW093JNZPTqRGa6aHWZ9pnAU+mf6IvilePhog4ouy5mr1dkcathblZs21J/4v5/UBDsUbu8nZQ3tgGKbXcG2OwQr+InyXkv0/AS0cpY/K5mc+8qvmmNKAhMrIZJ/f+qcifuA02mRlOz3AqBlmWUcOMNXixf+SmeGjiKsOQ7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBlvSEzl2SJA4+b8WpLlv+2F67/GpsdKN2/ZHIMmmkA=;
 b=at9npTKSvoctzXWk6wKTrnpO7BSbJ9+c2T8KL8FpCE5XjKBnYqbW9Hh6+Xo/LVovyLiTm5H5vnizk7wbhU56/hlynQEb/eYzkmy76x2zjLhc601ka3LHWZzJ/kza6MIxslcbh0c2uHizIPbknUkf/tmjv0AiYmkKEiEpSEO1nyTURDFhi4pPpOOlJhRRfyolQSDJyjhcQ8j5hPgqQy1lvQP98fF0BfA56/KtP4IHzmkuHQXbaN3gGO2VA1z0B2M781NnoHvTKLWoscQw0vOkyl+9nt+IKIaFXgB49urLwO6okn4Cz1jYINV9WqQcWD4X/+ZqU33KF4KjhmhCT83/og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBlvSEzl2SJA4+b8WpLlv+2F67/GpsdKN2/ZHIMmmkA=;
 b=h1OjPnRpMZn0Akc6nPGjWC73xzMZSbCc4dTjmNdpjV+AaqCpSO+vLWT0GwwKLgCXMyFlbArx2jNVdYXlnQ+5hla/A5w5ZAZV8h7wlrnBd4h5jWYA4qXAeN4JDQ+31XLXzzKR+PAHG3XemknSXj+Z1JEvHItRrbEEcZx1Bgo6TBQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 by MN0PR12MB5738.namprd12.prod.outlook.com (2603:10b6:208:371::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:46:08 +0000
Received: from CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::217f:1ab1:9a5f:fecc]) by CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::217f:1ab1:9a5f:fecc%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:46:08 +0000
Message-ID: <72451cc4-46df-49d1-b2c7-34dd9ee87d94@amd.com>
Date: Thu, 24 Oct 2024 22:46:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/32] drm/amdgpu: pass ip_block in set_powergating_state
To: "Khatri, Sunil" <sunil.khatri@amd.com>, amd-gfx@lists.freedesktop.org,
 leo.liu@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com
References: <20241017132053.53214-1-boyuan.zhang@amd.com>
 <20241017132053.53214-8-boyuan.zhang@amd.com>
 <e93bb43b-88bb-b5a3-3d75-8613435a8dea@amd.com>
Content-Language: en-US
From: Boyuan Zhang <Boyuan.Zhang@amd.com>
In-Reply-To: <e93bb43b-88bb-b5a3-3d75-8613435a8dea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0432.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::27) To CY8PR12MB7491.namprd12.prod.outlook.com
 (2603:10b6:930:92::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7491:EE_|MN0PR12MB5738:EE_
X-MS-Office365-Filtering-Correlation-Id: 204ab0b3-50b6-43e7-b39f-08dcf49f2d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YitESFJ5K1BkMXI2VFNlUUcyN0lRUGZLZDhHVHZkUVI1UytuZWs2alRsRFMy?=
 =?utf-8?B?SzUyb28vODdpV3hPdFJZVG1BMGYyYTk4cjFSNDQ3Q1o1bWorb1VQeDEyaXhQ?=
 =?utf-8?B?ckdMV1RQaEZWb0lQdjdkaktIS1JFZCszbnlTRnR5a2VPRHloSzhCbm03TlRK?=
 =?utf-8?B?SWpwSFJEYVY4VHp2U3JMbFhsWE1sbWJJckt1UnVucVlyNzBtSjlIV2pPdVBa?=
 =?utf-8?B?QktyUDZPOUQ2aEdBMHNmeW5nWU5mRXgwMHpsSzF5Vmk1OTVVZVFkNlVwbEkw?=
 =?utf-8?B?cjU5TmVkMWZreDMraGFQL2tNQnNsSEJSU2hxdExzVlpuS1JmSmhyWVdpSzd4?=
 =?utf-8?B?dHRhbmNNdjFvdUFZVEkrZkc1dk5LK0RwZjlTcThPS3JFemo2QVFVQ08vWWE3?=
 =?utf-8?B?YmJSK09xaWVLc3RmR3FwNjZOakhrTm1scTRSMVVwZVhnak9QT3Vpd0RaMTdN?=
 =?utf-8?B?clQraDZKZnNFSXFWdjUwL0o3eFFZb0x6c3YzK0Zvb2MreWdROXZ4WE11SHA1?=
 =?utf-8?B?RW9kbEhsM2hOUHV3RzlNMzFrZTMyRE5pWko5VVpweDRIa2cyeDJ0T3JBVjNF?=
 =?utf-8?B?SWxpUHBEZWpsb2NpYjJZSFBudSs2Y3Z6QkxlV25abDFNUWtpL1R4WEFhd3pz?=
 =?utf-8?B?UnFxbzRGcy8vVFVtSWhVODAyUGIrRkxCZVdQdTZkVHppR3dTclVWNStPbUhN?=
 =?utf-8?B?Q01aSDRxOHdkR1Nmd0Fub0dlam5aMzNsdnJlR3d1anltSGJ5OGFwTGdqaTFj?=
 =?utf-8?B?OGg0enA5ekR2eFcvZmVtZzl0bk1rQy9tZGt5cVNBL2xZUDVDNlU5NHNqODVP?=
 =?utf-8?B?WkphcVlWOUR2R0NURG1oRGtON3ZYR0xRd0R6MjM4WWQ1MVozRWJ3aEorS2RH?=
 =?utf-8?B?RFNiMXV4WUJSQmJEZS9SeUR3U2tFQ3N1TGJqcmh2bzJ0aXMrVXZUc05CcEhx?=
 =?utf-8?B?bEdwYWQydFFxaEpaTDMvY1VVYWI0QXN3RWtjRTJRajVmeDM2NHkrN0M5THlN?=
 =?utf-8?B?T3VweGpldEhZRzZYbkJlN2VNYVp5T2dOYU8yVG1Xa2Y1SVh1VmZSenk0ajEv?=
 =?utf-8?B?UEJQMm5NaU9rK2JrdUJ2OEJzaExINzQ2T1VMU1VOMUZ1OVY4WGRuZHVVbkVO?=
 =?utf-8?B?MC9GODlFa3BwWnVxK1B2RU9sQkwyOEhJOGhHZ2puc2tycHNOUWdYak9jTFQ4?=
 =?utf-8?B?dXNtVVZHNHdQSDlNOUtRZWFCRTI5eU54K3BvZHZ0T0ZKazVDQnFnVnZLUzIv?=
 =?utf-8?B?L0NwUVh0WUFSRFRmakxmY3EwVWVvcUd1cFNOY00xR21xaUZtSy85Y1R4QW1J?=
 =?utf-8?B?V1VYTFE2RC9vckpJc3ZzN002MkNDWW5ZN0E5TjZNRERIeDRuMlBRVlIwaWFG?=
 =?utf-8?B?aFZhdjdJeFgrMEd6b3B2blhEWVhzTWdNTzY1SndMZ0dOb0w4YVVNV2NTemNJ?=
 =?utf-8?B?QXBZdFB1cTExSTYvVjVpUnU2bkF3ZHZqc0dsWkxkT0d6Nm9NZWNUdWN4cUZL?=
 =?utf-8?B?VVpNQXRDVWhtNUx2bHBlMDZWZXlFK05jM29RSjIzRkRWLytBbHo5Q1h4ZDVt?=
 =?utf-8?B?bVl6eEZxRHNwNitLNzdFNkk1bllzTG44T1d4ajNTb053NHRYU1FBUzgrUXF6?=
 =?utf-8?B?QW42bGFMZEhRNEpzOVNvVXBXaTIzWmxWZU5EdjZ1ME91cFhTYWMvbU5hN3Mz?=
 =?utf-8?B?SVluMEk0V1EyVWg5U2hldWh2a2lZOXEzaFlwV0EvTE5LaVVQM1lFZXRVL3lu?=
 =?utf-8?Q?B8JE4WslVQkACgJGFE4FAW1OZyuVUNJHlGaE7wu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGU3b1N2ZlJnN0l5eHJkR09nM2Qyb1d6ckpINWExdE50dHhkNyt1RXdKQlpm?=
 =?utf-8?B?TjQ1NENPSEhSVnNPeS95VUltNHlqN04rQXlNa2ZGSG9zRVoxaEVkdHBhQVQr?=
 =?utf-8?B?Y21Oa2FwUTN2KzNkUnNEL0NGSU15R1FPL0cxM0FYdjJUenIweVpnQjdYWTAr?=
 =?utf-8?B?cWhicjIrRUJxeW8vS2RwQkhUN2p1eUNOQUp0UitqOXZiQ0RHNlltbnF1TFpa?=
 =?utf-8?B?cTNKazhka3BsdG5CNGRDd2RoQmlVeUZmak4vcEM3WklkZzJhZ3JkMXVNWFYx?=
 =?utf-8?B?YlBMMmU3YjkreTg0eHZmdHhTclFTcHVnZjR6QXExUW80NEFxUVJRVWVOajNW?=
 =?utf-8?B?V1JyNm5SS3dVcGNYbTFZNTBoT3h6d0ZhVEtGY2JNT28yWnJmNmczZXdYV09r?=
 =?utf-8?B?TkJwY0lSMlV5L0VadGRXUDlrSWRudmJpNjFVSEFUUU9TanRNd0NBdUxvZDhE?=
 =?utf-8?B?NHovV1lNeDhIem5JZjU1TEJycFNVTDBidWdHSE5jbXZXc21MMmtmSHViZVdK?=
 =?utf-8?B?eFR6bDBUbUpIdzM0cFFZeFlWUkdEVzhIb2FFMXFIUTdiUXRmTUVVTTlFcjdX?=
 =?utf-8?B?aHJ0M1llTFdpdkNlTEJxSk93NEtwMUJKRERVYTNIWGh1c3NndWxER0ZCTnd5?=
 =?utf-8?B?RGt6VzA2cGZnamZuRmM3SHhERHJwRkNwbkJEbGtHYVpBNjJpa0xwZjRWL1hM?=
 =?utf-8?B?N0NDMGlsYS9DL0UwSHlUSkg5VHI2RzBsTkYxbEg3aGx4a25GUWYvT3RHUVFT?=
 =?utf-8?B?TVY1M3BkaGZhT1dSVWdaTExTUzg4dXVJYzZybmZVTlJweEtyZ1pSZldGNHov?=
 =?utf-8?B?Sm9sWjZWaGlhZGVUMzhtWmttd1MzTEpSeVQ4YkxZcER3MG9Va1RZZjVIcmNv?=
 =?utf-8?B?akNsdmFzdkZ5Vm0vRkl0dkVPWk9Bc1pMdWx6OUJ5ZHhTTHIzOWEzaTBwMHZw?=
 =?utf-8?B?cjNMMzZRMGQwZWJFVVFEek5EVTZCeWlFMWdKSjRrT25temU0VTJjNWIxMWRj?=
 =?utf-8?B?TTI2SDFleVFJQlM0a2hRc2lVWmZTaVliVFRNWm5Cb0lodDlhYmRkbGF5b2FG?=
 =?utf-8?B?NXdUdXhPSVJUK1FmU1p0MDdlb1lIWkh0TVBRcktVb3JUb21OQmN5TU54dzBo?=
 =?utf-8?B?Nng4cXpaSVFuUlQ5Qjl4b3pVNElzdFg0MDdsblNLK2kwL3QrVmRoUjUyVDd3?=
 =?utf-8?B?eUNJa1Fld3ZDR2ZUQm9xd2Q0TjNLNUZlTHU5LzhQUTIyWTdMKzYyWTMrR1Nx?=
 =?utf-8?B?ZkIrNHFDOEswS1MrSlBqU3ByeHNNYXFXdmdRcWU5eVpWajd5eGtxRmRFZ1B3?=
 =?utf-8?B?TkQxaHczcFRrMFpmVC9xd2t6S1lrKzVzZkMzSnFQU0VGMUZueGh1WVpuWnhQ?=
 =?utf-8?B?R1RxTGtUbkNScXB0enllOURjVzAxY096MUoxS0cxUktUQnRYS3N3N3R3QXp3?=
 =?utf-8?B?WmRiencrR0wwdk9oKyszcGp2cFRXa2w5dXN0N3RCTzR3VUNlRG9sT3ZJU2RG?=
 =?utf-8?B?WXNQeW9hSFFXZlFBMGkwSVJrSlBSVDV4bUN0RlZTZDR1Q1NzQ1k5QTVhT0g0?=
 =?utf-8?B?V2FFZGswQ0diZm1EZzJzNmVWTmdNYStGaHEreERYVkZBYmZtSFZIZDhnMG0v?=
 =?utf-8?B?bFJ2NDAyNXRwdFZIa09tOWJPNG1FVGNRUkpZeVR5UldVQXhsV1BvMUhucGRW?=
 =?utf-8?B?Q1ZISzAvNU1uWjczTGxYaFhMaXVmaElqRFRvUVF0bCt1R01aZkdGR1E2QVpQ?=
 =?utf-8?B?alpKaWFqOW1xWXZ5aGZwa1ExemxSLzNhWW1zcVNXZ1BPUkhiT2VzOHJ5VDc0?=
 =?utf-8?B?QnRuRnpMeU5jMmJuc1pYSy9KNlV3K092bVU4Vk1pN2sva08vVTZqOER3eFZz?=
 =?utf-8?B?NUxKS0ZXcjdYOVArTDZpMVhXWWZJNUFDT2JpbXpvNGhHdW0ydStqWE1jdnpH?=
 =?utf-8?B?WktCdjRmVy9idzE0LzA3SElMejZtd1hFc2Jzb3BkRWsrZ2M5Si9yTXJVSmsv?=
 =?utf-8?B?R3ZOcGR1bktnbTFpVGY5cDFWRUVaOHdkSVBrRU1sVXJrNUNvNk8yS25GL01D?=
 =?utf-8?B?VXlDWXIycmpLMlgrWFZGZ3NmcGFFSU1qb1RTaGcrc1psVkNVeWJaVzlreVhs?=
 =?utf-8?Q?krlbMy4fP8v7YIkWb+SoRNWvl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204ab0b3-50b6-43e7-b39f-08dcf49f2d67
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:46:08.1046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oamu6szjEizzEr4JXAho5n8xTK9rpV+HiDIZ013h0xrCdC/q8DjxAYupnI0243Gwvxo89zmILoN3PGxZ7wNd1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5738
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


On 2024-10-22 03:42, Khatri, Sunil wrote:
>
> On 10/17/2024 6:50 PM, boyuan.zhang@amd.com wrote:
>> From: Boyuan Zhang <boyuan.zhang@amd.com>
>>
>> Pass ip_block instead of adev in set_powergating_state callback 
>> function.
>> Modify set_powergating_state ip functions for all correspoding ip 
>> blocks.
>>
>> v2: fix a ip block index error.
>>
>> Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c        |  5 ++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c           |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c           |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/cik.c                  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c               |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c                |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c            |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/nv.c                   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c            |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c          |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/si.c                   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/si_dma.c               |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c                |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/soc15.c                |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/soc21.c                |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/soc24.c                |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c             |  4 ++--
>>   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             |  9 +++++----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 11 ++++++-----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             | 12 ++++++------
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             | 13 +++++++------
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           |  8 ++++----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           |  9 +++++----
>>   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           |  9 +++++----
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c            |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/vi.c                   |  2 +-
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>>   drivers/gpu/drm/amd/include/amd_shared.h          |  2 +-
>>   drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        |  2 +-
>>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        |  2 +-
>>   drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  |  2 +-
>>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  2 +-
>>   82 files changed, 165 insertions(+), 157 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> index 575826d220b8..64828cb7c2f1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> @@ -600,10 +600,10 @@ static int acp_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int acp_set_powergating_state(void *handle,
>> +static int acp_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         amdgpu_dpm_set_powergating_by_smu(adev, 
>> AMD_IP_BLOCK_TYPE_ACP, enable, 0);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index b545940e512b..dd3ae5d74436 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -724,7 +724,10 @@ void amdgpu_amdkfd_set_compute_idle(struct 
>> amdgpu_device *adev, bool idle)
>>           /* Disable GFXOFF and PG. Temporary workaround
>>            * to fix some compute applications issue on GFX9.
>>            */
>> - 
>> adev->ip_blocks[AMD_IP_BLOCK_TYPE_GFX].version->funcs->set_powergating_state((void 
>> *)adev, state);
> We have the function for this requirement and i feel better use this
> amdgpu_device_ip_get_ip_block


Fixed in new patch-set just submitted (Patch 07/29)


>> +        for (int i = 0; i < adev->num_ip_blocks; i++) {
>> +            if (adev->ip_blocks[i].version->type == 
>> AMD_IP_BLOCK_TYPE_GFX)
>> + adev->ip_blocks[i].version->funcs->set_powergating_state((void 
>> *)&adev->ip_blocks[i], state);
>> +        }
>>       }
>>       amdgpu_dpm_switch_power_profile(adev,
>>                       PP_SMC_POWER_PROFILE_COMPUTE,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index dbe4c26f63e6..fe5de35eef64 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2154,7 +2154,7 @@ int amdgpu_device_ip_set_powergating_state(void 
>> *dev,
>>           if (!adev->ip_blocks[i].version->funcs->set_powergating_state)
>>               continue;
>>           r = adev->ip_blocks[i].version->funcs->set_powergating_state(
>> -            (void *)adev, state);
>> +            (void *)&adev->ip_blocks[i], state);
>> We dont need type casting anymore by void * as we already have 
>> ip_block type ptr also valid at other places too and probably in 
>> other patches
>>           if (r)
>>               DRM_ERROR("set_powergating_state of IP block <%s> 
>> failed %d\n",
>> adev->ip_blocks[i].version->funcs->name, r);
>> @@ -3128,7 +3128,7 @@ int amdgpu_device_set_pg_state(struct 
>> amdgpu_device *adev,
>>               adev->ip_blocks[i].version->type != 
>> AMD_IP_BLOCK_TYPE_JPEG &&
>> adev->ip_blocks[i].version->funcs->set_powergating_state) {
>>               /* enable powergating to save power */
>> -            r = 
>> adev->ip_blocks[i].version->funcs->set_powergating_state((void *)adev,
>> +            r = 
>> adev->ip_blocks[i].version->funcs->set_powergating_state((void 
>> *)&adev->ip_blocks[i],
>>                                               state);
>> Typecasting not needed.
>>               if (r) {
>>                   DRM_ERROR("set_powergating_state(gate) of IP block 
>> <%s> failed %d\n",
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> index adc0b80ca5db..844f71eeea27 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> @@ -164,7 +164,7 @@ static int isp_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int isp_set_powergating_state(void *handle,
>> +static int isp_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> index 8ef6bf7c6b65..527470323c33 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> @@ -3793,7 +3793,7 @@ static int psp_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int psp_set_powergating_state(void *handle,
>> +static int psp_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> index fd31e2e9feb9..f44ce5edba6a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> @@ -647,7 +647,7 @@ static int amdgpu_vkms_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int amdgpu_vkms_set_powergating_state(void *handle,
>> +static int amdgpu_vkms_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> index 6d96e1f21e20..f3a9ea3f6044 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> @@ -644,10 +644,10 @@ static int vpe_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int vpe_set_powergating_state(void *handle,
>> +static int vpe_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       struct amdgpu_vpe *vpe = &adev->vpe;
>>         if (!adev->pm.dpm_enabled)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik.c
>> index 6c18ab35cf69..08b398aa6c6d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
>> @@ -2185,7 +2185,7 @@ static int 
>> cik_common_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int cik_common_set_powergating_state(void *handle,
>> +static int cik_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                           enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 9e9a58fd86ce..42c3eb8b6a95 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -408,7 +408,7 @@ static int cik_ih_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>
>> Function could be remove in another patch as this isnt doing anything 
>> by checking if the fuction is NULL or not.
>> -static int cik_ih_set_powergating_state(void *handle,
>> +static int cik_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> index df3f429e003e..5283b0e94f02 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> @@ -1204,7 +1204,7 @@ static int cik_sdma_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int cik_sdma_set_powergating_state(void *handle,
>> +static int cik_sdma_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index cadd69a243af..4bf5402bd3aa 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -405,7 +405,7 @@ static int cz_ih_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int cz_ih_set_powergating_state(void *handle,
>> +static int cz_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       // TODO
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> index 2d0a24a343f7..e7505934cce2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> @@ -3313,7 +3313,7 @@ static int dce_v10_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
> Clean up in a different patch as it returns 0 and all other functions 
> which return 0 in one separate patch.
>>   -static int dce_v10_0_set_powergating_state(void *handle,
>> +static int dce_v10_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> index 386ece7bc389..8adee675f4d5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> @@ -3445,7 +3445,7 @@ static int dce_v11_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>> Same as above and please follow the clean up in one patch for a 
>> particular function for all files can take reference of any other 
>> function that i pushed as that code is merged.
>>   -static int dce_v11_0_set_powergating_state(void *handle,
>> +static int dce_v11_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> index cd3e0118988d..66cb19f9b073 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> @@ -3135,7 +3135,7 @@ static int dce_v6_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int dce_v6_0_set_powergating_state(void *handle,
>> +static int dce_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> index 295bc1d47095..57a5207b4e76 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> @@ -3223,7 +3223,7 @@ static int dce_v8_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int dce_v8_0_set_powergating_state(void *handle,
>> +static int dce_v8_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>> index bf5c739c7058..b5da9a1e8216 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
>> @@ -3673,7 +3673,7 @@ static void 
>> gfx_v10_0_ring_invalidate_tlbs(struct amdgpu_ring *ring,
>>   static void gfx_v10_0_update_spm_vmid_internal(struct amdgpu_device 
>> *adev,
>>                              unsigned int vmid);
>>   -static int gfx_v10_0_set_powergating_state(void *handle,
>> +static int gfx_v10_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state);
>>   static void gfx10_kiq_set_resources(struct amdgpu_ring *kiq_ring, 
>> uint64_t queue_mask)
>>   {
>> @@ -7451,7 +7451,7 @@ static int gfx_v10_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>        * otherwise the gfxoff disallowing will be failed to set.
>>        */
>>       if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(10, 3, 1))
>> -        gfx_v10_0_set_powergating_state(ip_block->adev, 
>> AMD_PG_STATE_UNGATE);
>> +        gfx_v10_0_set_powergating_state(ip_block, AMD_PG_STATE_UNGATE);
>>         if (!adev->no_hw_access) {
>>           if (amdgpu_async_gfx_ring) {
>> @@ -8339,10 +8339,10 @@ static const struct amdgpu_rlc_funcs 
>> gfx_v10_0_rlc_funcs_sriov = {
>>       .is_rlcg_access_range = gfx_v10_0_is_rlcg_access_range,
>>   };
>>   -static int gfx_v10_0_set_powergating_state(void *handle,
>> +static int gfx_v10_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>> index c78a63da8d2e..92786e3bbf0e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>> @@ -5424,10 +5424,10 @@ static void gfx_v11_cntl_pg(struct 
>> amdgpu_device *adev, bool enable)
>>       amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
>>   }
>>   -static int gfx_v11_0_set_powergating_state(void *handle,
>> +static int gfx_v11_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
>> index dc25fcb89b13..4ff78c9e3e43 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
>> @@ -3846,10 +3846,10 @@ static void gfx_v12_cntl_pg(struct 
>> amdgpu_device *adev, bool enable)
>>   }
>>   #endif
>>   -static int gfx_v12_0_set_powergating_state(void *handle,
>> +static int gfx_v12_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> index 6ac6d4dfa49f..429aa895d6bf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> @@ -3400,11 +3400,11 @@ static int 
>> gfx_v6_0_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int gfx_v6_0_set_powergating_state(void *handle,
>> +static int gfx_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       bool gate = false;
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == AMD_PG_STATE_GATE)
>>           gate = true;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> index 77150c9f1e18..7c04dccec8d7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> @@ -4869,11 +4869,11 @@ static int 
>> gfx_v7_0_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int gfx_v7_0_set_powergating_state(void *handle,
>> +static int gfx_v7_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       bool gate = false;
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == AMD_PG_STATE_GATE)
>>           gate = true;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> index cb59ba3a6d1b..22ada2ede46b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> @@ -5360,10 +5360,10 @@ static void 
>> cz_update_gfx_cg_power_gating(struct amdgpu_device *adev,
>>       }
>>   }
>>   -static int gfx_v8_0_set_powergating_state(void *handle,
>> +static int gfx_v8_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> index d85b2968a7cf..6516e88c55aa 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
>> @@ -5214,10 +5214,10 @@ static const struct amdgpu_rlc_funcs 
>> gfx_v9_0_rlc_funcs = {
>>       .is_rlcg_access_range = gfx_v9_0_is_rlcg_access_range,
>>   };
>>   -static int gfx_v9_0_set_powergating_state(void *handle,
>> +static int gfx_v9_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
>> index 7d425d2e7ab0..627652cab308 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
>> @@ -2760,7 +2760,7 @@ static const struct amdgpu_rlc_funcs 
>> gfx_v9_4_3_rlc_funcs = {
>>       .is_rlcg_access_range = gfx_v9_4_3_is_rlcg_access_range,
>>   };
>>   -static int gfx_v9_4_3_set_powergating_state(void *handle,
>> +static int gfx_v9_4_3_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> index 5cf2002fcba8..b398021d5b90 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
>> @@ -1133,7 +1133,7 @@ static void 
>> gmc_v10_0_get_clockgating_state(void *handle, u64 *flags)
>>           athub_v2_0_get_clockgating(adev, flags);
>>   }
>>   -static int gmc_v10_0_set_powergating_state(void *handle,
>> +static int gmc_v10_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> index 4df4d73038f8..36e2f4e5a865 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
>> @@ -1020,7 +1020,7 @@ static void 
>> gmc_v11_0_get_clockgating_state(void *handle, u64 *flags)
>>       athub_v3_0_get_clockgating(adev, flags);
>>   }
>>   -static int gmc_v11_0_set_powergating_state(void *handle,
>> +static int gmc_v11_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>> index e33f9e9058cc..c6510f12afb4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
>> @@ -1004,7 +1004,7 @@ static void 
>> gmc_v12_0_get_clockgating_state(void *handle, u64 *flags)
>>       athub_v4_1_0_get_clockgating(adev, flags);
>>   }
>>   -static int gmc_v12_0_set_powergating_state(void *handle,
>> +static int gmc_v12_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> index c1e2f1d79e74..3965b9ca8e9c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> @@ -1100,7 +1100,7 @@ static int gmc_v6_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int gmc_v6_0_set_powergating_state(void *handle,
>> +static int gmc_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> index 54a48662f3b5..b43eaa42e5c7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> @@ -1327,7 +1327,7 @@ static int gmc_v7_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int gmc_v7_0_set_powergating_state(void *handle,
>> +static int gmc_v7_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> index c4f2ad32c078..d36cf90d4133 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> @@ -1679,7 +1679,7 @@ static int gmc_v8_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int gmc_v8_0_set_powergating_state(void *handle,
>> +static int gmc_v8_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> index 94600e5c8ea3..5aac51d9db2f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
>> @@ -2485,7 +2485,7 @@ static void gmc_v9_0_get_clockgating_state(void 
>> *handle, u64 *flags)
>>       athub_v1_0_get_clockgating(adev, flags);
>>   }
>>   -static int gmc_v9_0_set_powergating_state(void *handle,
>> +static int gmc_v9_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                       enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index a3fb01f905d4..879d34e88014 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -398,7 +398,7 @@ static int iceland_ih_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int iceland_ih_set_powergating_state(void *handle,
>> +static int iceland_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> index 09403eac483b..4f271d9f43ba 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> @@ -756,10 +756,10 @@ static void 
>> ih_v6_0_update_ih_mem_power_gating(struct amdgpu_device *adev,
>>       WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
>>   }
>>   -static int ih_v6_0_set_powergating_state(void *handle,
>> +static int ih_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> index 9706d7593d26..5b0a1eaa1fd0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> @@ -737,10 +737,10 @@ static void 
>> ih_v6_1_update_ih_mem_power_gating(struct amdgpu_device *adev,
>>       WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
>>   }
>>   -static int ih_v6_1_set_powergating_state(void *handle,
>> +static int ih_v6_1_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> index 9657145d7cce..a584863f1bed 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> @@ -727,10 +727,10 @@ static void 
>> ih_v7_0_update_ih_mem_power_gating(struct amdgpu_device *adev,
>>       WREG32_SOC15(OSSSYS, 0, regIH_MEM_POWER_CTRL, ih_mem_pwr_cntl);
>>   }
>>   -static int ih_v7_0_set_powergating_state(void *handle,
>> +static int ih_v7_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       bool enable = (state == AMD_PG_STATE_GATE);
>>         if (adev->pg_flags & AMD_PG_SUPPORT_IH_SRAM_PG)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> index 6762b5c64ccb..c5f692a45bee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> @@ -35,7 +35,7 @@
>>     static void jpeg_v2_0_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v2_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v2_0_set_powergating_state(void *handle,
>> +static int jpeg_v2_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>     /**
>> @@ -154,7 +154,7 @@ static int jpeg_v2_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>         if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>             RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS))
>> -        jpeg_v2_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        jpeg_v2_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>         return 0;
>>   }
>> @@ -692,10 +692,10 @@ static int jpeg_v2_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v2_0_set_powergating_state(void *handle,
>> +static int jpeg_v2_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                       enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (state == adev->jpeg.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> index 4b8c801f204d..f1ddef8e60ee 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> @@ -38,7 +38,7 @@
>>     static void jpeg_v2_5_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v2_5_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v2_5_set_powergating_state(void *handle,
>> +static int jpeg_v2_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>   static void jpeg_v2_5_set_ras_funcs(struct amdgpu_device *adev);
>>   @@ -219,7 +219,7 @@ static int jpeg_v2_5_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>             if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>                 RREG32_SOC15(JPEG, i, mmUVD_JRBC_STATUS))
>> -            jpeg_v2_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +            jpeg_v2_5_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>             if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__JPEG))
>>               amdgpu_irq_put(adev, 
>> &adev->jpeg.inst[i].ras_poison_irq, 0);
>> @@ -541,10 +541,10 @@ static int jpeg_v2_5_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v2_5_set_powergating_state(void *handle,
>> +static int jpeg_v2_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (state == adev->jpeg.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> index 7996209818b6..69f0a9006b96 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> @@ -36,7 +36,7 @@
>>     static void jpeg_v3_0_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v3_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v3_0_set_powergating_state(void *handle,
>> +static int jpeg_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>     /**
>> @@ -168,7 +168,7 @@ static int jpeg_v3_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>         if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>             RREG32_SOC15(JPEG, 0, mmUVD_JRBC_STATUS))
>> -        jpeg_v3_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        jpeg_v3_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>         return 0;
>>   }
>> @@ -483,10 +483,10 @@ static int jpeg_v3_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v3_0_set_powergating_state(void *handle,
>> +static int jpeg_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if(state == adev->jpeg.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> index 20e1fe89c463..e304108d7024 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> @@ -39,7 +39,7 @@
>>   static int jpeg_v4_0_start_sriov(struct amdgpu_device *adev);
>>   static void jpeg_v4_0_set_dec_ring_funcs(struct amdgpu_device *adev);
>>   static void jpeg_v4_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v4_0_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>   static void jpeg_v4_0_set_ras_funcs(struct amdgpu_device *adev);
>>   @@ -199,7 +199,7 @@ static int jpeg_v4_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>       if (!amdgpu_sriov_vf(adev)) {
>>           if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>               RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS))
>> -            jpeg_v4_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +            jpeg_v4_0_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>       }
>>       if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__JPEG))
>>           amdgpu_irq_put(adev, &adev->jpeg.inst->ras_poison_irq, 0);
>> @@ -645,10 +645,10 @@ static int jpeg_v4_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v4_0_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (amdgpu_sriov_vf(adev)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> index 2a53537db135..f4d6a4768ee2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> @@ -43,7 +43,7 @@ enum jpeg_engin_status {
>>     static void jpeg_v4_0_3_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v4_0_3_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v4_0_3_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_3_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>   static void jpeg_v4_0_3_set_ras_funcs(struct amdgpu_device *adev);
>>   static void jpeg_v4_0_3_dec_ring_set_wptr(struct amdgpu_ring *ring);
>> @@ -371,7 +371,7 @@ static int jpeg_v4_0_3_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>         if (!amdgpu_sriov_vf(adev)) {
>>           if (adev->jpeg.cur_state != AMD_PG_STATE_GATE)
>> -            ret = jpeg_v4_0_3_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +            ret = jpeg_v4_0_3_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>       }
>>         return ret;
>> @@ -960,10 +960,10 @@ static int 
>> jpeg_v4_0_3_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v4_0_3_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_3_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (amdgpu_sriov_vf(adev)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> index ef2d4237925b..2a28eb479a34 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> @@ -48,7 +48,7 @@
>>     static void jpeg_v4_0_5_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v4_0_5_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v4_0_5_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>     static void jpeg_v4_0_5_dec_ring_set_wptr(struct amdgpu_ring *ring);
>> @@ -228,7 +228,7 @@ static int jpeg_v4_0_5_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>           if (!amdgpu_sriov_vf(adev)) {
>>               if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>                   RREG32_SOC15(JPEG, i, regUVD_JRBC_STATUS))
>> -                jpeg_v4_0_5_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +                jpeg_v4_0_5_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>           }
>>       }
>>       return 0;
>> @@ -676,10 +676,10 @@ static int 
>> jpeg_v4_0_5_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v4_0_5_set_powergating_state(void *handle,
>> +static int jpeg_v4_0_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (amdgpu_sriov_vf(adev)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> index 7954a6fae464..692d0083b5f7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> @@ -36,7 +36,7 @@
>>     static void jpeg_v5_0_0_set_dec_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void jpeg_v5_0_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int jpeg_v5_0_0_set_powergating_state(void *handle,
>> +static int jpeg_v5_0_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>     /**
>> @@ -165,7 +165,7 @@ static int jpeg_v5_0_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>         if (adev->jpeg.cur_state != AMD_PG_STATE_GATE &&
>>             RREG32_SOC15(JPEG, 0, regUVD_JRBC_STATUS))
>> -        jpeg_v5_0_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        jpeg_v5_0_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>         return 0;
>>   }
>> @@ -570,10 +570,10 @@ static int 
>> jpeg_v5_0_0_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int jpeg_v5_0_0_set_powergating_state(void *handle,
>> +static int jpeg_v5_0_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (state == adev->jpeg.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 93da900b7ee2..9ca248ea3428 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -677,7 +677,7 @@ static int navi10_ih_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int navi10_ih_set_powergating_state(void *handle,
>> +static int navi10_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c 
>> b/drivers/gpu/drm/amd/amdgpu/nv.c
>> index 4e8f9af1e2be..6481f72b32d6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
>> @@ -1085,7 +1085,7 @@ static int nv_common_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int nv_common_set_powergating_state(void *handle,
>> +static int nv_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>>       /* TODO */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> index 10fd772cb80f..6a1028baf16d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> @@ -1087,7 +1087,7 @@ static int sdma_v2_4_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v2_4_set_powergating_state(void *handle,
>> +static int sdma_v2_4_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> index 69fba087e09c..42d996d4136f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> @@ -1506,7 +1506,7 @@ static int sdma_v3_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v3_0_set_powergating_state(void *handle,
>> +static int sdma_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
>> index 3f5959557727..a2f5f2be699b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
>> @@ -2312,10 +2312,10 @@ static int 
>> sdma_v4_0_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int sdma_v4_0_set_powergating_state(void *handle,
>> +static int sdma_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         switch (amdgpu_ip_version(adev, SDMA0_HWIP, 0)) {
>>       case IP_VERSION(4, 1, 0):
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
>> index 9c7cea0890c9..95d5de2bd186 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
>> @@ -1830,7 +1830,7 @@ static int 
>> sdma_v4_4_2_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int sdma_v4_4_2_set_powergating_state(void *handle,
>> +static int sdma_v4_4_2_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> index 6a675daf5620..82a8bbd53d49 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> @@ -1859,7 +1859,7 @@ static int sdma_v5_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v5_0_set_powergating_state(void *handle,
>> +static int sdma_v5_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> index e1413ccaf7e4..b84d5c27bb94 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> @@ -1818,7 +1818,7 @@ static int sdma_v5_2_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v5_2_set_powergating_state(void *handle,
>> +static int sdma_v5_2_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> index 4b33bd6b776d..bc9fe03ab145 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> @@ -1589,7 +1589,7 @@ static int sdma_v6_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v6_0_set_powergating_state(void *handle,
>> +static int sdma_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> index 24f24974ac1d..c224e7e7e103 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> @@ -1524,7 +1524,7 @@ static int sdma_v7_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int sdma_v7_0_set_powergating_state(void *handle,
>> +static int sdma_v7_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c 
>> b/drivers/gpu/drm/amd/amdgpu/si.c
>> index b9934661a92e..6b0211c94836 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
>> @@ -2681,7 +2681,7 @@ static int si_common_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int si_common_set_powergating_state(void *handle,
>> +static int si_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                           enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c 
>> b/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> index d44483ed3363..26782dad9311 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> @@ -672,12 +672,12 @@ static int si_dma_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int si_dma_set_powergating_state(void *handle,
>> +static int si_dma_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       u32 tmp;
>>   -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         WREG32(DMA_PGFSM_WRITE,  0x00002000);
>>       WREG32(DMA_PGFSM_CONFIG, 0x100010ff);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index b018a3b90401..976d803bef8c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -269,7 +269,7 @@ static int si_ih_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int si_ih_set_powergating_state(void *handle,
>> +static int si_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c 
>> b/drivers/gpu/drm/amd/amdgpu/soc15.c
>> index 6ab34c526c86..9fbada694cd7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
>> @@ -1481,7 +1481,7 @@ static void 
>> soc15_common_get_clockgating_state(void *handle, u64 *flags)
>>           adev->df.funcs->get_clockgating_state(adev, flags);
>>   }
>>   -static int soc15_common_set_powergating_state(void *handle,
>> +static int soc15_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                           enum amd_powergating_state state)
>>   {
>>       /* todo */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c 
>> b/drivers/gpu/drm/amd/amdgpu/soc21.c
>> index c4b950e75133..6497a65f9738 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/soc21.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
>> @@ -968,10 +968,10 @@ static int 
>> soc21_common_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int soc21_common_set_powergating_state(void *handle,
>> +static int soc21_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                          enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
>>       case IP_VERSION(6, 0, 0):
>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c 
>> b/drivers/gpu/drm/amd/amdgpu/soc24.c
>> index b20dc81dc257..7b43d8908448 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/soc24.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
>> @@ -557,10 +557,10 @@ static int 
>> soc24_common_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int soc24_common_set_powergating_state(void *handle,
>> +static int soc24_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                             enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         switch (amdgpu_ip_version(adev, LSDMA_HWIP, 0)) {
>>       case IP_VERSION(7, 0, 0):
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 45fb5140c8b7..77fba40e1dbc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -454,7 +454,7 @@ static int tonga_ih_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int tonga_ih_set_powergating_state(void *handle,
>> +static int tonga_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> index 3011b5853fb4..561fc15173b6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> @@ -796,7 +796,7 @@ static int uvd_v3_1_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int uvd_v3_1_set_powergating_state(void *handle,
>> +static int uvd_v3_1_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> index 4852a2ab128f..6bd728153b4c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> @@ -714,7 +714,7 @@ static int uvd_v4_2_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int uvd_v4_2_set_powergating_state(void *handle,
>> +static int uvd_v4_2_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the UVD block.
>> @@ -724,7 +724,7 @@ static int uvd_v4_2_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == AMD_PG_STATE_GATE) {
>>           uvd_v4_2_stop(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> index a24b210c79ac..02e0e5c9e701 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> @@ -817,7 +817,7 @@ static int uvd_v5_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int uvd_v5_0_set_powergating_state(void *handle,
>> +static int uvd_v5_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the UVD block.
>> @@ -827,7 +827,7 @@ static int uvd_v5_0_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret = 0;
>>         if (state == AMD_PG_STATE_GATE) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> index b4eeeebfe095..fdf23d2b0e42 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> @@ -1476,7 +1476,7 @@ static int uvd_v6_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int uvd_v6_0_set_powergating_state(void *handle,
>> +static int uvd_v6_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the UVD block.
>> @@ -1486,7 +1486,7 @@ static int uvd_v6_0_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret = 0;
>>         WREG32(mmUVD_POWER_STATUS, UVD_POWER_STATUS__UVD_PG_EN_MASK);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> index a4531000ec0b..836643c99572 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> @@ -596,7 +596,7 @@ static int vce_v2_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int vce_v2_0_set_powergating_state(void *handle,
>> +static int vce_v2_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the VCE block.
>> @@ -606,7 +606,7 @@ static int vce_v2_0_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == AMD_PG_STATE_GATE)
>>           return vce_v2_0_stop(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> index 9f9a9d89bcdc..e985cf1e63f1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> @@ -801,7 +801,7 @@ static int vce_v3_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int vce_v3_0_set_powergating_state(void *handle,
>> +static int vce_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the VCE block.
>> @@ -811,7 +811,7 @@ static int vce_v3_0_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret = 0;
>>         if (state == AMD_PG_STATE_GATE) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> index f4d2650e6b7a..30d64672f3c5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> @@ -958,7 +958,7 @@ static int vce_v4_0_set_clockgating_state(void 
>> *handle,
>>   }
>>   #endif
>>   -static int vce_v4_0_set_powergating_state(void *handle,
>> +static int vce_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the VCE block.
>> @@ -968,7 +968,7 @@ static int vce_v4_0_set_powergating_state(void 
>> *handle,
>>        * revisit this when there is a cleaner line between
>>        * the smc and the hw blocks
>>        */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == AMD_PG_STATE_GATE)
>>           return vce_v4_0_stop(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> index 1d5b0f4e5b1a..34b1e55a907a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> @@ -85,7 +85,8 @@ static int vcn_v1_0_stop(struct amdgpu_device *adev);
>>   static void vcn_v1_0_set_dec_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v1_0_set_powergating_state(void *handle, enum 
>> amd_powergating_state state);
>> +static int vcn_v1_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>> +                enum amd_powergating_state state);
>>   static int vcn_v1_0_pause_dpg_mode(struct amdgpu_device *adev,
>>                   int inst_idx, struct dpg_pause_state *new_state);
>>   @@ -281,7 +282,7 @@ static int vcn_v1_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>       if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>>           (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>>            RREG32_SOC15(VCN, 0, mmUVD_STATUS))) {
>> -        vcn_v1_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        vcn_v1_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>       }
>>         return 0;
>> @@ -1799,7 +1800,7 @@ static void vcn_v1_0_dec_ring_insert_nop(struct 
>> amdgpu_ring *ring, uint32_t coun
>>       }
>>   }
>>   -static int vcn_v1_0_set_powergating_state(void *handle,
>> +static int vcn_v1_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the VCN block.
>> @@ -1810,7 +1811,7 @@ static int vcn_v1_0_set_powergating_state(void 
>> *handle,
>>        * the smc and the hw blocks
>>        */
>>       int ret;
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (state == adev->vcn.cur_state)
>>           return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> index d87e5505cf51..6c1f5d05f90a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> @@ -92,7 +92,7 @@ static const struct amdgpu_hwip_reg_entry 
>> vcn_reg_list_2_0[] = {
>>   static void vcn_v2_0_set_dec_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v2_0_set_enc_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v2_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v2_0_set_powergating_state(void *handle,
>> +static int vcn_v2_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>   static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
>>                   int inst_idx, struct dpg_pause_state *new_state);
>> @@ -318,7 +318,7 @@ static int vcn_v2_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>       if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>>           (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>>             RREG32_SOC15(VCN, 0, mmUVD_STATUS)))
>> -        vcn_v2_0_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        vcn_v2_0_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>         return 0;
>>   }
>> @@ -1796,7 +1796,7 @@ int vcn_v2_0_dec_ring_test_ring(struct 
>> amdgpu_ring *ring)
>>   }
>>     -static int vcn_v2_0_set_powergating_state(void *handle,
>> +static int vcn_v2_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       /* This doesn't actually powergate the VCN block.
>> @@ -1807,7 +1807,7 @@ static int vcn_v2_0_set_powergating_state(void 
>> *handle,
>>        * the smc and the hw blocks
>>        */
>>       int ret;
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>         if (amdgpu_sriov_vf(adev)) {
>>           adev->vcn.cur_state = AMD_PG_STATE_UNGATE;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> index ad0922eb16c0..35ded346771d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> @@ -95,7 +95,7 @@ static const struct amdgpu_hwip_reg_entry 
>> vcn_reg_list_2_5[] = {
>>   static void vcn_v2_5_set_dec_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v2_5_set_powergating_state(void *handle,
>> +static int vcn_v2_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                   enum amd_powergating_state state);
>>   static int vcn_v2_5_pause_dpg_mode(struct amdgpu_device *adev,
>>                   int inst_idx, struct dpg_pause_state *new_state);
>> @@ -398,8 +398,9 @@ static int vcn_v2_5_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>             if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>>               (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>> -             RREG32_SOC15(VCN, i, mmUVD_STATUS)))
>> -            vcn_v2_5_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +             RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
>> +            vcn_v2_5_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>> +        }
>> Dont really need braces here as its one line and continous check.
>>             if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN))
>>               amdgpu_irq_put(adev, &adev->vcn.inst[i].ras_poison_irq, 
>> 0);
>> @@ -1825,10 +1826,10 @@ static int 
>> vcn_v2_5_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int vcn_v2_5_set_powergating_state(void *handle,
>> +static int vcn_v2_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (amdgpu_sriov_vf(adev))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index 19c7f9cd4c15..c02c9ef8ddeb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -105,7 +105,7 @@ static int vcn_v3_0_start_sriov(struct 
>> amdgpu_device *adev);
>>   static void vcn_v3_0_set_dec_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v3_0_set_enc_ring_funcs(struct amdgpu_device *adev);
>>   static void vcn_v3_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v3_0_set_powergating_state(void *handle,
>> +static int vcn_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>               enum amd_powergating_state state);
>>   static int vcn_v3_0_pause_dpg_mode(struct amdgpu_device *adev,
>>               int inst_idx, struct dpg_pause_state *new_state);
>> @@ -430,9 +430,9 @@ static int vcn_v3_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>             if (!amdgpu_sriov_vf(adev)) {
>>               if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>> -                    (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>> -                     RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
>> -                vcn_v3_0_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +                (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>> +                 RREG32_SOC15(VCN, i, mmUVD_STATUS))) {
>> +                vcn_v3_0_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>               }
>>           }
>>       }
>> @@ -2159,10 +2159,10 @@ static int 
>> vcn_v3_0_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int vcn_v3_0_set_powergating_state(void *handle,
>> +static int vcn_v3_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         /* for SRIOV, guest should not control VCN Power-gating
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> index e97d7f4ae371..319eb5a3d061 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> @@ -96,7 +96,7 @@ static int amdgpu_ih_clientid_vcns[] = {
>>   static int vcn_v4_0_start_sriov(struct amdgpu_device *adev);
>>   static void vcn_v4_0_set_unified_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v4_0_set_powergating_state(void *handle,
>> +static int vcn_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>           enum amd_powergating_state state);
>>   static int vcn_v4_0_pause_dpg_mode(struct amdgpu_device *adev,
>>           int inst_idx, struct dpg_pause_state *new_state);
>> @@ -357,9 +357,9 @@ static int vcn_v4_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>               continue;
>>           if (!amdgpu_sriov_vf(adev)) {
>>               if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>> -                        (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>> -                                RREG32_SOC15(VCN, i, regUVD_STATUS))) {
>> -                        vcn_v4_0_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +                (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>> +                 RREG32_SOC15(VCN, i, regUVD_STATUS))) {
>> +                vcn_v4_0_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>               }
>>           }
>>           if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN))
>> @@ -2037,9 +2037,10 @@ static int vcn_v4_0_set_clockgating_state(void 
>> *handle, enum amd_clockgating_sta
>>    *
>>    * Set VCN block powergating state
>>    */
>> -static int vcn_v4_0_set_powergating_state(void *handle, enum 
>> amd_powergating_state state)
>> +static int vcn_v4_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>> +                      enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         /* for SRIOV, guest should not control VCN Power-gating
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> index ba22913398ec..b6c1135d6fec 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> @@ -87,7 +87,7 @@ static const struct amdgpu_hwip_reg_entry 
>> vcn_reg_list_4_0_3[] = {
>>   static int vcn_v4_0_3_start_sriov(struct amdgpu_device *adev);
>>   static void vcn_v4_0_3_set_unified_ring_funcs(struct amdgpu_device 
>> *adev);
>>   static void vcn_v4_0_3_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v4_0_3_set_powergating_state(void *handle,
>> +static int vcn_v4_0_3_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>           enum amd_powergating_state state);
>>   static int vcn_v4_0_3_pause_dpg_mode(struct amdgpu_device *adev,
>>           int inst_idx, struct dpg_pause_state *new_state);
>> @@ -319,7 +319,7 @@ static int vcn_v4_0_3_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>       cancel_delayed_work_sync(&adev->vcn.idle_work);
>>         if (adev->vcn.cur_state != AMD_PG_STATE_GATE)
>> -        vcn_v4_0_3_set_powergating_state(adev, AMD_PG_STATE_GATE);
>> +        vcn_v4_0_3_set_powergating_state(ip_block, AMD_PG_STATE_GATE);
>>         return 0;
>>   }
>> @@ -1623,10 +1623,10 @@ static int 
>> vcn_v4_0_3_set_clockgating_state(void *handle,
>>    *
>>    * Set VCN block powergating state
>>    */
>> -static int vcn_v4_0_3_set_powergating_state(void *handle,
>> +static int vcn_v4_0_3_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         /* for SRIOV, guest should not control VCN Power-gating
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> index 873672f64778..ebf6301b13be 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> @@ -95,7 +95,7 @@ static int amdgpu_ih_clientid_vcns[] = {
>>     static void vcn_v4_0_5_set_unified_ring_funcs(struct 
>> amdgpu_device *adev);
>>   static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v4_0_5_set_powergating_state(void *handle,
>> +static int vcn_v4_0_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>           enum amd_powergating_state state);
>>   static int vcn_v4_0_5_pause_dpg_mode(struct amdgpu_device *adev,
>>           int inst_idx, struct dpg_pause_state *new_state);
>> @@ -309,7 +309,7 @@ static int vcn_v4_0_5_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>               if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>>                   (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>>                   RREG32_SOC15(VCN, i, regUVD_STATUS))) {
>> -                vcn_v4_0_5_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +                vcn_v4_0_5_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>               }
>>           }
>>       }
>> @@ -1531,9 +1531,10 @@ static int 
>> vcn_v4_0_5_set_clockgating_state(void *handle, enum amd_clockgating_s
>>    *
>>    * Set VCN block powergating state
>>    */
>> -static int vcn_v4_0_5_set_powergating_state(void *handle, enum 
>> amd_powergating_state state)
>> +static int vcn_v4_0_5_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>> +        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (state == adev->vcn.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> index 893e66c2b9a5..50c102f1b5fe 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> @@ -78,7 +78,7 @@ static int amdgpu_ih_clientid_vcns[] = {
>>     static void vcn_v5_0_0_set_unified_ring_funcs(struct 
>> amdgpu_device *adev);
>>   static void vcn_v5_0_0_set_irq_funcs(struct amdgpu_device *adev);
>> -static int vcn_v5_0_0_set_powergating_state(void *handle,
>> +static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>           enum amd_powergating_state state);
>>   static int vcn_v5_0_0_pause_dpg_mode(struct amdgpu_device *adev,
>>           int inst_idx, struct dpg_pause_state *new_state);
>> @@ -273,7 +273,7 @@ static int vcn_v5_0_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>               if ((adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) ||
>>                   (adev->vcn.cur_state != AMD_PG_STATE_GATE &&
>>                   RREG32_SOC15(VCN, i, regUVD_STATUS))) {
>> -                vcn_v5_0_0_set_powergating_state(adev, 
>> AMD_PG_STATE_GATE);
>> +                vcn_v5_0_0_set_powergating_state(ip_block, 
>> AMD_PG_STATE_GATE);
>>               }
>>           }
>>       }
>> @@ -1258,9 +1258,10 @@ static int 
>> vcn_v5_0_0_set_clockgating_state(void *handle, enum amd_clockgating_s
>>    *
>>    * Set VCN block powergating state
>>    */
>> -static int vcn_v5_0_0_set_powergating_state(void *handle, enum 
>> amd_powergating_state state)
>> +static int vcn_v5_0_0_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>> +        enum amd_powergating_state state)
>>   {
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +    struct amdgpu_device *adev = ip_block->adev;
>>       int ret;
>>         if (state == adev->vcn.cur_state)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index 73de5909f655..8df4f4352d65 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -616,7 +616,7 @@ static int vega10_ih_set_clockgating_state(void 
>> *handle,
>>     }
>>   -static int vega10_ih_set_powergating_state(void *handle,
>> +static int vega10_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> index a42404a58015..4ac43aeb85c1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> @@ -681,7 +681,7 @@ static int vega20_ih_set_clockgating_state(void 
>> *handle,
>>     }
>>   -static int vega20_ih_set_powergating_state(void *handle,
>> +static int vega20_ih_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 4996049dc199..6b58723f0b2e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -2003,7 +2003,7 @@ static int vi_common_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int vi_common_set_powergating_state(void *handle,
>> +static int vi_common_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                           enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 7616d7a509b9..d5a0417f95df 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -961,7 +961,7 @@ static int dm_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int dm_set_powergating_state(void *handle,
>> +static int dm_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>             enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h 
>> b/drivers/gpu/drm/amd/include/amd_shared.h
>> index f98b3a544477..03c77bbc2e6d 100644
>> --- a/drivers/gpu/drm/amd/include/amd_shared.h
>> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
>> @@ -398,7 +398,7 @@ struct amd_ip_funcs {
>>       int (*post_soft_reset)(struct amdgpu_ip_block *ip_block);
>>       int (*set_clockgating_state)(void *handle,
>>                        enum amd_clockgating_state state);
>> -    int (*set_powergating_state)(void *handle,
>> +    int (*set_powergating_state)(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state);
>>       void (*get_clockgating_state)(void *handle, u64 *flags);
>>       void (*dump_ip_state)(struct amdgpu_ip_block *ip_block);
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c 
>> b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> index af7da780b58b..d5130da88162 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> @@ -3194,7 +3194,7 @@ static int kv_dpm_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int kv_dpm_set_powergating_state(void *handle,
>> +static int kv_dpm_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                         enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c 
>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> index a4908f0402f1..18c47fa89bc1 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> @@ -7860,7 +7860,7 @@ static int si_dpm_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -static int si_dpm_set_powergating_state(void *handle,
>> +static int si_dpm_set_powergating_state(struct amdgpu_ip_block 
>> *ip_block,
>>                       enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> index de5ee1c5503f..069b604d6e7a 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> @@ -254,7 +254,7 @@ static int pp_sw_reset(struct amdgpu_ip_block 
>> *ip_block)
>>       return 0;
>>   }
>>   -static int pp_set_powergating_state(void *handle,
>> +static int pp_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                       enum amd_powergating_state state)
>>   {
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c 
>> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index 115931d1c461..4aaaf0e0b851 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -2184,7 +2184,7 @@ static int smu_set_clockgating_state(void *handle,
>>       return 0;
>>   }
>>   -static int smu_set_powergating_state(void *handle,
>> +static int smu_set_powergating_state(struct amdgpu_ip_block *ip_block,
>>                        enum amd_powergating_state state)
>>   {
>>       return 0;
