Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5D6A2AA1D
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Feb 2025 14:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FB510E2F7;
	Thu,  6 Feb 2025 13:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PYFitnuI";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2064.outbound.protection.outlook.com [40.107.236.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347B610E836
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Feb 2025 13:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJ7Pr6JrHp9I5G9cGzSb1abndeC2smNK8NBa2cXIS00kaU+ABoYozIu1/MiLZHtMAj8+TpY7PjYB9ulgaY40REXUHfgL47kkMMN6y+b7kt3darPDwNdPgRvT3pi36zUbTYfFPrLtolLMkWCra6enuOzYoJe8ddv/IVBfsDhMtz4SWUFiZ/w2nBnuL9CpvhiCegswP4aN+VkXu+P5s4pIge5NP3EXDG9CNTP205VcLte0wXOEOWnxvOzAmaMPERfeC7hQ/dNbYXS4stZ1HCx6xby/ASlxgbYkTBQtpNUUfjRfqQp+/rlOsa1yVHl2ado9o2Ubv4iUgnCcrgoti+wCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMWxN4UothPkQgnITuw69dkAtsEYYXNNVnyzGZEWBdM=;
 b=Q+yRqMFOdKS4faJYJAxPaczXzcj516LC8gboJoeCGf9WaC3r7GQS6bX4WQzTKZVVDIVnls23ZJHnzcEERfs7l3PN4ZZ+V62RrSuSCIIUszBiyrahIaRb1mNfKCdp3/gMaw14CpFg4hp/Fwu1JGer8Q9OpDafmKTXMHPo/VYfBaJlJnxGPFe2z34gsDbyYpdC1gzr5EIh60XTaCZFXWcJ2EVSpMcIT5pqCAXC9RuHbiJvKlDKGx9kLp0aBDG1aB5En/MAJISo/BOPvFHzBhyM1ihGPAwIgJnw0dYkHdki+zdlFe0KeJjhZYyb0zNssR11VZvyssuLW1af+ISSV9QCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMWxN4UothPkQgnITuw69dkAtsEYYXNNVnyzGZEWBdM=;
 b=PYFitnuIDNTQ0b6mI5trpRj9OsxAf306Jny7GgDUuMU3m4L9rJXNnFotCDA9fhTRxSCwRrDDg4Wy1VPcEnXN+bG4xGHkzIo1o+yvh8OvscrM3vEa/uBjIT0A02e2tnTzrEe3Z+2SIQg1Cz/N/xmHpwRpMJBreK2LwLBltXobIlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15)
 by SA3PR12MB8045.namprd12.prod.outlook.com (2603:10b6:806:31d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 13:39:14 +0000
Received: from CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::217f:1ab1:9a5f:fecc]) by CY8PR12MB7491.namprd12.prod.outlook.com
 ([fe80::217f:1ab1:9a5f:fecc%5]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 13:39:13 +0000
Content-Type: multipart/alternative;
 boundary="------------y8P3v5wNVlNHmmSM0c0jMwBp"
Message-ID: <46471a72-93cc-4252-a1e4-354ed0983ee0@amd.com>
Date: Thu, 6 Feb 2025 08:39:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/44] drm/amdgpu/vcn: move more instanced data to
 vcn_instance
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20250131165741.1798488-1-alexander.deucher@amd.com>
 <20250131165741.1798488-11-alexander.deucher@amd.com>
 <a034d63d-503b-41ae-a549-206ed0033640@amd.com>
 <CADnq5_NTDXP4ZcENhzN2W_JzLRPZ+099xs_523GHaYSn0npOsQ@mail.gmail.com>
Content-Language: en-US
From: Boyuan Zhang <Boyuan.Zhang@amd.com>
In-Reply-To: <CADnq5_NTDXP4ZcENhzN2W_JzLRPZ+099xs_523GHaYSn0npOsQ@mail.gmail.com>
X-ClientProxiedBy: YQBPR0101CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::19) To CY8PR12MB7491.namprd12.prod.outlook.com
 (2603:10b6:930:92::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7491:EE_|SA3PR12MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b33dfc-fc16-4016-c452-08dd46b3a4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTZCY0g2WmNXRkZhb3dVc3ovTkpRZ0xWcnJZNmxTaHlrOW10N2tyTHh1MDhN?=
 =?utf-8?B?Y09rbytzUlhZMUdpMXJJWXl0L21oWG5JdTdJc04rRDFRSEQwemFLMDV0Wm81?=
 =?utf-8?B?VE93akl1T203MkFGNVVsNjg0eUpDeUtnNXVYejRsZTdQaHFFYkJPTkpwWUha?=
 =?utf-8?B?MTlEd0J1NkIzdzNmVndQRXpVZEpkbW1LTHc2V1V6bXVjSnY3T3M1cVNQd1hN?=
 =?utf-8?B?b0Q2U2grVmRVTjdnMERacDBZQWRFMitUTkkzQlVWR0NYTHM1V1RqOEZUcjVW?=
 =?utf-8?B?aEJiYjNlQXpudGtuVmdSUmM3Ykk5WHhOMjBNT2k0ZE9wSEQrY3RGWHFCSjFr?=
 =?utf-8?B?S1JzTXVIWlhmRTFyN3lnZXJIMVB5Q1RJeUFCTUtZc1FoRWZtWG9hWndEUHJ4?=
 =?utf-8?B?WEpzNzNGYWdHYmE4cG9wdHh6c0NZTFd0WHpUQUkrY3B6ekYxWHRjYllPWitO?=
 =?utf-8?B?TXU1TEk1ZldvVndjd0puTEticUxacjU0cWpLNkdkRHFFaHVOSU93T1B3OGVm?=
 =?utf-8?B?c3krSmpaNWdRaG12b0NiT0ZwY0tYUVk0UkdXMy94c2xWQzhreU5UR04rdkZs?=
 =?utf-8?B?eEJyN3ZEVTk4cUoyWTJSaVNKUDFSOEhXaTRBWDRITEQ5Vmt3aTFaNmphRmVq?=
 =?utf-8?B?T3d4bEhpLzZRRDdCR21VbWpwMUw4TGQ2RWMzck5uN01sMFpHa25zS3hFbmxh?=
 =?utf-8?B?a1BsNHBuU1JlSmNKbVE1K2hQKzdHUWk4aG5XQnB5ejFpYXB5OVB3ckJ3ejk1?=
 =?utf-8?B?TG0wZGFBRG5WNFJ6Y29tZzMvaG5rcjJ4UHQ4MFg4WHAvM09Mb3R0WlRENHE5?=
 =?utf-8?B?a1c3VUlLaVpHUDZIazUyVk16dUZwaEhvQ2dxMGQyMmlUL1M0elR4dFpxQTll?=
 =?utf-8?B?ZzRrZG0waCtCang5MDhBTWpKL0g2MFJ6SlZmTURFTzBjOEppOGp1aHR4YnZ6?=
 =?utf-8?B?L0RESmVZYVNvd0tVcGZqdFZLUDJpMkpTYVJES0FYREt1WVJMVTVkTmM5YnBr?=
 =?utf-8?B?Uk5LSDFiMDhUb21HcXA5ODBpUFhDdUx5ZCtyQzlucnpEQ05Ua3NWZVBtbFFZ?=
 =?utf-8?B?V1hwQ2h3WFZWQUpEY2psc0FUL2tnVmhjeVIzMEk3NktoMnBLVWpZVXF3QVJp?=
 =?utf-8?B?ZFJld0hFNmsxNjZrSTlMVVhza1BzSWRuRUFPVFQvbGxVQnQrSnVLZDlyVjdk?=
 =?utf-8?B?SHVPbGQwVEROejdicyt5S1B4V3Vhck5Ec0k5ZUhJeld5VjBYME4vM0RDbUpL?=
 =?utf-8?B?dXFNRFNodm45OEJRaWxhejgrSGE4ajE1aitEWDRpUHNUN3V5bUhPUU1MRDJn?=
 =?utf-8?B?ZGxMdDB4UVI1QW1heWFIeURkZlR0bGpIenZnNjhUc0ZHVWNHUWkralh3Ykhj?=
 =?utf-8?B?cVFCSm9pOHBjU2NUdTh6dFJFQWF5VlNtV3NJNkFIaGcwejlpNGFBMlpkSGp0?=
 =?utf-8?B?azFPZGI5TktYZVdiYnRMNGVHMVNUYTJyZXUzUW1lR2pGQnliVGRxdVIwRUVm?=
 =?utf-8?B?N1MyOXd0VzVmMVNCQ3lvcEkvem8zVng1b01zV0JCbjRPdTdZU1MxcFJRR3dX?=
 =?utf-8?B?cGZKa0M0MW5CRUJNV1J0VXg1MHIyWTl3K1V4MGx1SWFWKzZLbGdnRUFsS2N6?=
 =?utf-8?B?NWxFOGsvczQxU0swRmlyT3ZBalpLU1lhWjI3Rnh0TnNDZVBGQUZmVzYxamIy?=
 =?utf-8?B?N1JiUGl5TTRxRCtUVEhkSlpHV0VmQy9uNWRPZ2hGajB4TGlGcGpsY1d5S0s0?=
 =?utf-8?B?SUYzOFJPcHhTRy9WUVpVTmtQbi8xbDNlVWxsd0lpcVVNdFZmRWVLNWo3ekpT?=
 =?utf-8?B?eFkvRk83Q0VxY1BUZGU5aGdzQXUycnZrdldRZzFRWUhCdVNkRHc5bXp1Vm9P?=
 =?utf-8?Q?NQTIGtHeErH6w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR12MB7491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NZRnpadFpTR2YzWTIrMlEzOXNCM2NKa1VzamdIYysrdFRhalZKV1B3ZXdL?=
 =?utf-8?B?Nm9tSVRCZDkwV01qWEVyNkpUeUJ4VHhmZlNYT29UTXRkTXlEbkgzL01qbUhM?=
 =?utf-8?B?UEhicnBKVzJUZ2FrZ1l2YzQwdWJRanJaZzVzZVROKytVMU1HMHZrdEdWcjFF?=
 =?utf-8?B?Y1VhMkh1V09TaHMxRUI2Zmg2SllTTDBXS21qMkYwSjdZL1ZDK1NWd3VuaWs1?=
 =?utf-8?B?bTZiOGRXKzV4ejBQdWYyVWp5VFQ0bGNpV2twcFEvays3ZUVkeGVMTGFHNmZS?=
 =?utf-8?B?UlVJWDVtSEZTcTk0eTk2ekxtVVZ3Z2JZQWoxWmJWVVlxbnREdGsvSVRMYi84?=
 =?utf-8?B?YTBEL1J6b1ZpV1VMMTRCY3JpL0MxOTdRc0Mxa2M3VU40dTI2MWdTc3ByM3Yy?=
 =?utf-8?B?VHJPREowanpPQi9MM0ZkSWwrbllqbXpmbUwzbkVGd3VtVGhkVUdZM1RVY0Zs?=
 =?utf-8?B?QXlncDc3b2N4U0pxMnUzM0RQWG5oa1liZmlZSC9jY3hvcENTajNXZXRTL2VV?=
 =?utf-8?B?THYvNExzSEg3REllUDdCK2lya1NldmkwNFE3RFlrcDlhcUpHOGlPQjVNcU1W?=
 =?utf-8?B?cXhUWUErM2RjUG5vbDJTa3Jma3ZaOUlaZldKNzQ5ZUxLTEJ1ak9DQ1d0OUh4?=
 =?utf-8?B?cmYrVlB6OEd1ZEs1dDJ1MzRyVk5jWUs2a0cyMnhuZmovN0E4dEN4MytzaFRN?=
 =?utf-8?B?TURsczlxMC9oeVVtT2pwUVF3TmE3SWFSbnF6Vk0zUTZ6ekxZcE9YWUlGczZt?=
 =?utf-8?B?OCs2SUV1dUgyNERDcFc2TEg2ckl2THRVanVwUVJNZFNKclY1VCtHVkZNSCtu?=
 =?utf-8?B?ckEvVk9HUXdoNzcxaklTYVFrVGErR0ZyaitGL2lYYm9aaXRlUXE4NnhZVkM4?=
 =?utf-8?B?OUhzbTJYVkdLWVdSdGtuMDBhZldmV1VRcXBGcHk0bTVsajhmeWZWeGJ3Zkd5?=
 =?utf-8?B?a0h2RENUNkxkdzFnQnNJb2REaVovdGtaUlBGbEh5ZGowaWtYZEdSei95WGxN?=
 =?utf-8?B?cGN4WGM0RDBjYkJBendReGthK1JoREcvRHNFY0REWHpvR21Oek5wUzc5ZVhu?=
 =?utf-8?B?NXZKT2tTa2oxMGdxNS9TN2xhOVZlU05FdGhndEtpd3NtbjdaUG1xV2tzMm4r?=
 =?utf-8?B?V2JKT0RLQTRmbzdpT041Z1hiZ05pQnNUcWVveW5Rd1BRZG40L2JLUWI5NW1K?=
 =?utf-8?B?c0toSG5EUVFIaHNQcFA4Q2QzaGJCSEkySHpVVkRqOUpDVm9kcnN3emI5QjJ3?=
 =?utf-8?B?K0R0bHFiZUdzaStqODhPRzlrZWFtRmpaS3lEUkdtME9WWWxVcjBCNWtpc0tm?=
 =?utf-8?B?MlREZ3crbEhsMjgzTFhiV2p6cFh3eElVRk1IS3Q5bUxGZU5EN1FacGpYcHpz?=
 =?utf-8?B?RU4xSEJxdjJKNDJ4NHUwTXhLc2p6dTRWNzFaMjNzV1RTaXJxYmJSWXpob3Er?=
 =?utf-8?B?TEo5ejBWdkxmZnZTTEFySHpjRHVheW5rQmhPWDZRbnVoQ2xDbm9RcitWakhR?=
 =?utf-8?B?SDh5WmNFbmg5TVJqNzgyYWFnL09aK0JrMmRESHBvZ1BXbVl0Tmo5czRlZU8y?=
 =?utf-8?B?SWxxd051b3Z0OENVa0Jna1NKTVVDV0VZWnF1cUlEZml5QW9PbFl0SjhNQi93?=
 =?utf-8?B?cmxVKzVkU0VrdnZEeUdMUG1lQ2RNMFdlQk83SDY5d0NvVGpZdE8xWUJibnFH?=
 =?utf-8?B?Qzc1Kzl2aGZLaFJGQzU3TUJFRC95OS9pR1JIdndYaDlRKzR1UlgyYVdlYXV1?=
 =?utf-8?B?K1hJT3NTMEg1NDZTT2ZkOEhSZzFKdUo3VGpqQ05jdTRDb0Z5UGFjaTVkRW4r?=
 =?utf-8?B?djVPUytQaGxwSkltQmVIVXFjN0dQdHd3TnB5QUFsd3NFZ1gxM08zRDMyWGpR?=
 =?utf-8?B?Q21kcXg0U1p6WHN3SFNYY0d6b1JQT2t1MnA3ZXdXeXhvSzJOZlhNY1hCcDIy?=
 =?utf-8?B?amFFQjdZTkJxb2c1Vm8zeUZGbUlmTUJkblJaL2htSzl2amxqcEZyRzYzTENw?=
 =?utf-8?B?UThqRHFuYm5kTW8ydkg5b0pheFJZd1FoQk16UlBuUVZWNkMxVVE0NUFTR1d0?=
 =?utf-8?B?SUcxMlRHcVlOZFoyOUhneVFLUEVLaTA5Zm5UUHdCTzhDSWZCa2ppRjNrZDNN?=
 =?utf-8?Q?Nfs+nEpI71xVqkXb6om74JX+P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b33dfc-fc16-4016-c452-08dd46b3a4c4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 13:39:13.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZnoXw2UC74DstScoZj5Q+UUSGl9s8TTS+sIbB4KlyiAJNRrq6CLsO0co8dq9cUVJMawhiH8uRe4N2RqnmGLiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8045
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

--------------y8P3v5wNVlNHmmSM0c0jMwBp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2025-02-05 15:09, Alex Deucher wrote:
> On Tue, Feb 4, 2025 at 10:42 PM Boyuan Zhang<Boyuan.Zhang@amd.com>  wrote:
>>
>> On 2025-01-31 11:57, Alex Deucher wrote:
>>> Move more per instance data into the per instance structure.
>>>
>>> v2: index instances directly on vcn1.0 and 2.0 to make
>>> it clear that they only support a single instance (Lijo)
>>>
>>> Signed-off-by: Alex Deucher<alexander.deucher@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |   2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 196 ++++++++++++------------
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  17 +-
>>>    drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c  |   4 +-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  42 ++---
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  92 +++++------
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  51 +++---
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  67 ++++----
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  19 ++-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c |  14 +-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c |  18 ++-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c |  16 +-
>>>    drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c |   8 +-
>>>    13 files changed, 279 insertions(+), 267 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> index 2c76bc5e25d92..5ee2ae66ed36b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>>> @@ -480,7 +480,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
>>>                        if (adev->vcn.harvest_config & (1 << i))
>>>                                continue;
>>>
>>> -                     for (j = 0; j < adev->vcn.num_enc_rings; j++)
>>> +                     for (j = 0; j < adev->vcn.inst[i].num_enc_rings; j++)
>>>                                if (adev->vcn.inst[i].ring_enc[j].sched.ready)
>>>                                        ++num_rings;
>>>                }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> index 0c3081a198d9e..9901b8e17f305 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
>>> @@ -127,93 +127,88 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>>>        unsigned int fw_shared_size, log_offset;
>>>        int i, r;
>>>
>>> -     mutex_init(&adev->vcn.vcn1_jpeg1_workaround);
>>>        for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
>>> +             mutex_init(&adev->vcn.inst[i].vcn1_jpeg1_workaround);
>>>                mutex_init(&adev->vcn.inst[i].vcn_pg_lock);
>>>                atomic_set(&adev->vcn.inst[i].total_submission_cnt, 0);
>>>                INIT_DELAYED_WORK(&adev->vcn.inst[i].idle_work, amdgpu_vcn_idle_work_handler);
>>>                atomic_set(&adev->vcn.inst[i].dpg_enc_submission_cnt, 0);
>>> -     }
>>> -
>>> -     if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>>> -         (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>>> -             adev->vcn.indirect_sram = true;
>>> -
>>> -     /*
>>> -      * Some Steam Deck's BIOS versions are incompatible with the
>>> -      * indirect SRAM mode, leading to amdgpu being unable to get
>>> -      * properly probed (and even potentially crashing the kernel).
>>> -      * Hence, check for these versions here - notice this is
>>> -      * restricted to Vangogh (Deck's APU).
>>> -      */
>>> -     if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
>>> -             const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
>>> -
>>> -             if (bios_ver && (!strncmp("F7A0113", bios_ver, 7) ||
>>> -                  !strncmp("F7A0114", bios_ver, 7))) {
>>> -                     adev->vcn.indirect_sram = false;
>>> -                     dev_info(adev->dev,
>>> -                             "Steam Deck quirk: indirect SRAM disabled on BIOS %s\n", bios_ver);
>>> +             if ((adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) &&
>>> +                 (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG))
>>> +                     adev->vcn.inst[i].indirect_sram = true;
>>> +
>>> +             /*
>>> +              * Some Steam Deck's BIOS versions are incompatible with the
>>> +              * indirect SRAM mode, leading to amdgpu being unable to get
>>> +              * properly probed (and even potentially crashing the kernel).
>>> +              * Hence, check for these versions here - notice this is
>>> +              * restricted to Vangogh (Deck's APU).
>>> +              */
>>> +             if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
>>> +                     const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
>>> +
>>> +                     if (bios_ver && (!strncmp("F7A0113", bios_ver, 7) ||
>>> +                                      !strncmp("F7A0114", bios_ver, 7))) {
>>> +                             adev->vcn.inst[i].indirect_sram = false;
>>> +                             dev_info(adev->dev,
>>> +                                      "Steam Deck quirk: indirect SRAM disabled on BIOS %s\n", bios_ver);
>>> +                     }
>>>                }
>>> -     }
>>>
>>> -     /* from vcn4 and above, only unified queue is used */
>>> -     adev->vcn.using_unified_queue =
>>> -             amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0);
>>> -
>>> -     hdr = (const struct common_firmware_header *)adev->vcn.inst[0].fw->data;
>>> -     adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
>>> -
>>> -     /* Bit 20-23, it is encode major and non-zero for new naming convention.
>>> -      * This field is part of version minor and DRM_DISABLED_FLAG in old naming
>>> -      * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
>>> -      * is zero in old naming convention, this field is always zero so far.
>>> -      * These four bits are used to tell which naming convention is present.
>>> -      */
>>> -     fw_check = (le32_to_cpu(hdr->ucode_version) >> 20) & 0xf;
>>> -     if (fw_check) {
>>> -             unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
>>> -
>>> -             fw_rev = le32_to_cpu(hdr->ucode_version) & 0xfff;
>>> -             enc_minor = (le32_to_cpu(hdr->ucode_version) >> 12) & 0xff;
>>> -             enc_major = fw_check;
>>> -             dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
>>> -             vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
>>> -             DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
>>> -                     enc_major, enc_minor, dec_ver, vep, fw_rev);
>>> -     } else {
>>> -             unsigned int version_major, version_minor, family_id;
>>> +             /* from vcn4 and above, only unified queue is used */
>>> +             adev->vcn.inst[i].using_unified_queue =
>>> +                     amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0);
>>> +
>>> +             hdr = (const struct common_firmware_header *)adev->vcn.inst[i].fw->data;
>>> +             adev->vcn.inst[i].fw_version = le32_to_cpu(hdr->ucode_version);
>>> +             adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
>>> +
>>> +             /* Bit 20-23, it is encode major and non-zero for new naming convention.
>>> +              * This field is part of version minor and DRM_DISABLED_FLAG in old naming
>>> +              * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
>>> +              * is zero in old naming convention, this field is always zero so far.
>>> +              * These four bits are used to tell which naming convention is present.
>>> +              */
>>> +             fw_check = (le32_to_cpu(hdr->ucode_version) >> 20) & 0xf;
>>> +             if (fw_check) {
>>> +                     unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
>>> +
>>> +                     fw_rev = le32_to_cpu(hdr->ucode_version) & 0xfff;
>>> +                     enc_minor = (le32_to_cpu(hdr->ucode_version) >> 12) & 0xff;
>>> +                     enc_major = fw_check;
>>> +                     dec_ver = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xf;
>>> +                     vep = (le32_to_cpu(hdr->ucode_version) >> 28) & 0xf;
>>> +                     DRM_INFO("Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n",
>>> +                              enc_major, enc_minor, dec_ver, vep, fw_rev);
>>> +             } else {
>>> +                     unsigned int version_major, version_minor, family_id;
>>>
>>> -             family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
>>> -             version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
>>> -             version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
>>> -             DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
>>> -                     version_major, version_minor, family_id);
>>> -     }
>>> +                     family_id = le32_to_cpu(hdr->ucode_version) & 0xff;
>>> +                     version_major = (le32_to_cpu(hdr->ucode_version) >> 24) & 0xff;
>>> +                     version_minor = (le32_to_cpu(hdr->ucode_version) >> 8) & 0xff;
>>> +                     DRM_INFO("Found VCN firmware Version: %u.%u Family ID: %u\n",
>>> +                              version_major, version_minor, family_id);
>>> +             }
>>>
>>> -     bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
>>> -     if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
>>> -             bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
>>> +             bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
>>> +             if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
>>> +                     bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
>>>
>>> -     if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(5, 0, 0)) {
>>> -             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
>>> -             log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
>>> -     } else if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0)) {
>>> -             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
>>> -             log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
>>> -     } else {
>>> -             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
>>> -             log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
>>> -     }
>>> -
>>> -     bo_size += fw_shared_size;
>>> +             if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(5, 0, 0)) {
>>> +                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
>>> +                     log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
>>> +             } else if (amdgpu_ip_version(adev, UVD_HWIP, 0) >= IP_VERSION(4, 0, 0)) {
>>> +                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
>>> +                     log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
>>> +             } else {
>>> +                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
>>> +                     log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
>>> +             }
>>>
>>> -     if (amdgpu_vcnfw_log)
>>> -             bo_size += AMDGPU_VCNFW_LOG_SIZE;
>>> +             bo_size += fw_shared_size;
>>>
>>> -     for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
>>> -             if (adev->vcn.harvest_config & (1 << i))
>>> -                     continue;
>>> +             if (amdgpu_vcnfw_log)
>>> +                     bo_size += AMDGPU_VCNFW_LOG_SIZE;
>>>
>>>                r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
>>>                                            AMDGPU_GEM_DOMAIN_VRAM |
>>> @@ -239,7 +234,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>>>                        adev->vcn.inst[i].fw_shared.log_offset = log_offset;
>>>                }
>>>
>>> -             if (adev->vcn.indirect_sram) {
>>> +             if (adev->vcn.inst[i].indirect_sram) {
>>>                        r = amdgpu_bo_create_kernel(adev, 64 * 2 * 4, PAGE_SIZE,
>>>                                        AMDGPU_GEM_DOMAIN_VRAM |
>>>                                        AMDGPU_GEM_DOMAIN_GTT,
>>> @@ -277,15 +272,14 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)
>>>
>>>                amdgpu_ring_fini(&adev->vcn.inst[j].ring_dec);
>>>
>>> -             for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +             for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i)
>>>                        amdgpu_ring_fini(&adev->vcn.inst[j].ring_enc[i]);
>>>
>>>                amdgpu_ucode_release(&adev->vcn.inst[j].fw);
>>>                mutex_destroy(&adev->vcn.inst[j].vcn_pg_lock);
>>> +             mutex_destroy(&adev->vcn.inst[j].vcn1_jpeg1_workaround);
>>>        }
>>>
>>> -     mutex_destroy(&adev->vcn.vcn1_jpeg1_workaround);
>>> -
>>>        return 0;
>>>    }
>>>
>>> @@ -404,12 +398,12 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>>        if (adev->vcn.harvest_config & (1 << i))
>>>                return;
>>>
>>> -     for (j = 0; j < adev->vcn.num_enc_rings; ++j)
>>> +     for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j)
>>>                fence[i] += amdgpu_fence_count_emitted(&vcn_inst->ring_enc[j]);
>>>
>>>        /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
>>> -         !adev->vcn.using_unified_queue) {
>>> +         !adev->vcn.inst[i].using_unified_queue) {
>>>                struct dpg_pause_state new_state;
>>>
>>>                if (fence[i] ||
>>> @@ -418,7 +412,7 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>>>                else
>>>                        new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
>>>
>>> -             adev->vcn.pause_dpg_mode(adev, i, &new_state);
>>> +             adev->vcn.inst[i].pause_dpg_mode(adev, i, &new_state);
>>>        }
>>>
>>>        fence[i] += amdgpu_fence_count_emitted(&vcn_inst->ring_dec);
>>> @@ -456,7 +450,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>>>
>>>        /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
>>> -         !adev->vcn.using_unified_queue) {
>>> +         !adev->vcn.inst[ring->me].using_unified_queue) {
>>>                struct dpg_pause_state new_state;
>>>
>>>                if (ring->funcs->type == AMDGPU_RING_TYPE_VCN_ENC) {
>>> @@ -466,7 +460,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>>>                        unsigned int fences = 0;
>>>                        unsigned int i;
>>>
>>> -                     for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +                     for (i = 0; i < adev->vcn.inst[ring->me].num_enc_rings; ++i)
>>>                                fences += amdgpu_fence_count_emitted(&adev->vcn.inst[ring->me].ring_enc[i]);
>>>
>>>                        if (fences || atomic_read(&adev->vcn.inst[ring->me].dpg_enc_submission_cnt))
>>> @@ -475,7 +469,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>>>                                new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
>>>                }
>>>
>>> -             adev->vcn.pause_dpg_mode(adev, ring->me, &new_state);
>>> +             adev->vcn.inst[ring->me].pause_dpg_mode(adev, ring->me, &new_state);
>>>        }
>>>        mutex_unlock(&adev->vcn.inst[ring->me].vcn_pg_lock);
>>>    }
>>> @@ -487,7 +481,7 @@ void amdgpu_vcn_ring_end_use(struct amdgpu_ring *ring)
>>>        /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
>>>        if (ring->adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
>>>            ring->funcs->type == AMDGPU_RING_TYPE_VCN_ENC &&
>>> -         !adev->vcn.using_unified_queue)
>>> +         !adev->vcn.inst[ring->me].using_unified_queue)
>>>                atomic_dec(&ring->adev->vcn.inst[ring->me].dpg_enc_submission_cnt);
>>>
>>>        atomic_dec(&ring->adev->vcn.inst[ring->me].total_submission_cnt);
>>> @@ -511,7 +505,7 @@ int amdgpu_vcn_dec_ring_test_ring(struct amdgpu_ring *ring)
>>>        r = amdgpu_ring_alloc(ring, 3);
>>>        if (r)
>>>                return r;
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.scratch9, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.scratch9, 0));
>>>        amdgpu_ring_write(ring, 0xDEADBEEF);
>>>        amdgpu_ring_commit(ring);
>>>        for (i = 0; i < adev->usec_timeout; i++) {
>>> @@ -576,14 +570,14 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
>>>                goto err;
>>>
>>>        ib = &job->ibs[0];
>>> -     ib->ptr[0] = PACKET0(adev->vcn.internal.data0, 0);
>>> +     ib->ptr[0] = PACKET0(adev->vcn.inst[ring->me].internal.data0, 0);
>>>        ib->ptr[1] = addr;
>>> -     ib->ptr[2] = PACKET0(adev->vcn.internal.data1, 0);
>>> +     ib->ptr[2] = PACKET0(adev->vcn.inst[ring->me].internal.data1, 0);
>>>        ib->ptr[3] = addr >> 32;
>>> -     ib->ptr[4] = PACKET0(adev->vcn.internal.cmd, 0);
>>> +     ib->ptr[4] = PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0);
>>>        ib->ptr[5] = 0;
>>>        for (i = 6; i < 16; i += 2) {
>>> -             ib->ptr[i] = PACKET0(adev->vcn.internal.nop, 0);
>>> +             ib->ptr[i] = PACKET0(adev->vcn.inst[ring->me].internal.nop, 0);
>>>                ib->ptr[i+1] = 0;
>>>        }
>>>        ib->length_dw = 16;
>>> @@ -746,7 +740,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>>>        uint32_t ib_pack_in_dw;
>>>        int i, r;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                ib_size_dw += 8;
>>>
>>>        r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>> @@ -759,7 +753,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>>>        ib->length_dw = 0;
>>>
>>>        /* single queue headers */
>>> -     if (adev->vcn.using_unified_queue) {
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue) {
>>>                ib_pack_in_dw = sizeof(struct amdgpu_vcn_decode_buffer) / sizeof(uint32_t)
>>>                                                + 4 + 2; /* engine info + decoding ib in dw */
>>>                ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, ib_pack_in_dw, false);
>>> @@ -778,7 +772,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
>>>        for (i = ib->length_dw; i < ib_size_dw; ++i)
>>>                ib->ptr[i] = 0x0;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                amdgpu_vcn_unified_ring_ib_checksum(&ib_checksum, ib_pack_in_dw);
>>>
>>>        r = amdgpu_job_submit_direct(job, ring, &f);
>>> @@ -876,7 +870,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>>>        uint64_t addr;
>>>        int i, r;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                ib_size_dw += 8;
>>>
>>>        r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>> @@ -890,7 +884,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>>>
>>>        ib->length_dw = 0;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, 0x11, true);
>>>
>>>        ib->ptr[ib->length_dw++] = 0x00000018;
>>> @@ -912,7 +906,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
>>>        for (i = ib->length_dw; i < ib_size_dw; ++i)
>>>                ib->ptr[i] = 0x0;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                amdgpu_vcn_unified_ring_ib_checksum(&ib_checksum, 0x11);
>>>
>>>        r = amdgpu_job_submit_direct(job, ring, &f);
>>> @@ -943,7 +937,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>>>        uint64_t addr;
>>>        int i, r;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                ib_size_dw += 8;
>>>
>>>        r = amdgpu_job_alloc_with_ib(ring->adev, NULL, NULL,
>>> @@ -957,7 +951,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>>>
>>>        ib->length_dw = 0;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, 0x11, true);
>>>
>>>        ib->ptr[ib->length_dw++] = 0x00000018;
>>> @@ -979,7 +973,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
>>>        for (i = ib->length_dw; i < ib_size_dw; ++i)
>>>                ib->ptr[i] = 0x0;
>>>
>>> -     if (adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.inst[ring->me].using_unified_queue)
>>>                amdgpu_vcn_unified_ring_ib_checksum(&ib_checksum, 0x11);
>>>
>>>        r = amdgpu_job_submit_direct(job, ring, &f);
>>> @@ -1396,7 +1390,7 @@ void amdgpu_debugfs_vcn_sched_mask_init(struct amdgpu_device *adev)
>>>        struct dentry *root = minor->debugfs_root;
>>>        char name[32];
>>>
>>> -     if (adev->vcn.num_vcn_inst <= 1 || !adev->vcn.using_unified_queue)
>>> +     if (adev->vcn.num_vcn_inst <= 1 || !adev->vcn.inst[0].using_unified_queue)
>>>                return;
>>>        sprintf(name, "amdgpu_vcn_sched_mask");
>>>        debugfs_create_file(name, 0600, root, adev,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>>> index 0bcf4d1c7175d..3b059f51894b9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
>>> @@ -322,6 +322,15 @@ struct amdgpu_vcn_inst {
>>>        struct mutex            vcn_pg_lock;
>>>        enum amd_powergating_state cur_state;
>>>        struct delayed_work     idle_work;
>>> +     unsigned                fw_version;
>>> +     unsigned                num_enc_rings;
>>> +     bool                    indirect_sram;
>>> +     struct amdgpu_vcn_reg    internal;
>>> +     struct mutex            vcn1_jpeg1_workaround;
>>> +     int (*pause_dpg_mode)(struct amdgpu_device *adev,
>>> +                           int inst_idx,
>>> +                           struct dpg_pause_state *new_state);
>>> +     bool using_unified_queue;
>>>    };
>>>
>>>    struct amdgpu_vcn_ras {
>>> @@ -330,24 +339,16 @@ struct amdgpu_vcn_ras {
>>>
>>>    struct amdgpu_vcn {
>>>        unsigned                fw_version;
>>> -     unsigned                num_enc_rings;
>>> -     bool                    indirect_sram;
>>> -
>>>        uint8_t num_vcn_inst;
>>>        struct amdgpu_vcn_inst   inst[AMDGPU_MAX_VCN_INSTANCES];
>>> -     struct amdgpu_vcn_reg    internal;
>>> -     struct mutex            vcn1_jpeg1_workaround;
>>>
>>>        unsigned        harvest_config;
>>> -     int (*pause_dpg_mode)(struct amdgpu_device *adev,
>>> -             int inst_idx, struct dpg_pause_state *new_state);
>>>
>>>        struct ras_common_if    *ras_if;
>>>        struct amdgpu_vcn_ras   *ras;
>>>
>>>        uint16_t inst_mask;
>>>        uint8_t num_inst_per_aid;
>>> -     bool using_unified_queue;
>>
>> unified_queue feature is determined by VCN IP version, so the "bool
>> using_unified_queue" should be a generic value for all instances. Should
>> we still need to separate it for each instance?
> Well, you could in theory have two different VCN instances each with a
> different version on an SoC.  We already have that today (e.g., navi31
> contains two instances, one is 4.0.0 and the other is 4.0.1), but it
> just so happens that both versions support unified queues.


yea make sense.

Reviewed-by: Boyuan Zhang <Boyuan.Zhang@amd.com> 
<mailto:Boyuan.Zhang@amd.com>


>
> Alex
>
>> Boyuan
>>
>>
>>>        /* IP reg dump */
>>>        uint32_t                *ip_dump;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
>>> index 8031406e20ff9..9e428e669ada6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
>>> @@ -607,12 +607,12 @@ static void jpeg_v1_0_ring_begin_use(struct amdgpu_ring *ring)
>>>        bool    set_clocks = !cancel_delayed_work_sync(&adev->vcn.inst[0].idle_work);
>>>        int             cnt = 0;
>>>
>>> -     mutex_lock(&adev->vcn.vcn1_jpeg1_workaround);
>>> +     mutex_lock(&adev->vcn.inst[0].vcn1_jpeg1_workaround);
>>>
>>>        if (amdgpu_fence_wait_empty(&adev->vcn.inst->ring_dec))
>>>                DRM_ERROR("JPEG dec: vcn dec ring may not be empty\n");
>>>
>>> -     for (cnt = 0; cnt < adev->vcn.num_enc_rings; cnt++) {
>>> +     for (cnt = 0; cnt < adev->vcn.inst[0].num_enc_rings; cnt++) {
>>>                if (amdgpu_fence_wait_empty(&adev->vcn.inst->ring_enc[cnt]))
>>>                        DRM_ERROR("JPEG dec: vcn enc ring[%d] may not be empty\n", cnt);
>>>        }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>>> index 757cacf11a817..c870d9ba64c69 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>>> @@ -105,7 +105,7 @@ static int vcn_v1_0_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>>
>>> -     adev->vcn.num_enc_rings = 2;
>>> +     adev->vcn.inst[0].num_enc_rings = 2;
>>>
>>>        vcn_v1_0_set_dec_ring_funcs(adev);
>>>        vcn_v1_0_set_enc_ring_funcs(adev);
>>> @@ -138,7 +138,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                return r;
>>>
>>>        /* VCN ENC TRAP */
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN, i + VCN_1_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
>>>                                        &adev->vcn.inst->irq);
>>>                if (r)
>>> @@ -166,18 +166,18 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>        if (r)
>>>                return r;
>>>
>>> -     adev->vcn.internal.scratch9 = adev->vcn.inst->external.scratch9 =
>>> +     adev->vcn.inst[0].internal.scratch9 = adev->vcn.inst->external.scratch9 =
>>>                SOC15_REG_OFFSET(UVD, 0, mmUVD_SCRATCH9);
>>> -     adev->vcn.internal.data0 = adev->vcn.inst->external.data0 =
>>> +     adev->vcn.inst[0].internal.data0 = adev->vcn.inst->external.data0 =
>>>                SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA0);
>>> -     adev->vcn.internal.data1 = adev->vcn.inst->external.data1 =
>>> +     adev->vcn.inst[0].internal.data1 = adev->vcn.inst->external.data1 =
>>>                SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA1);
>>> -     adev->vcn.internal.cmd = adev->vcn.inst->external.cmd =
>>> +     adev->vcn.inst[0].internal.cmd = adev->vcn.inst->external.cmd =
>>>                SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_CMD);
>>> -     adev->vcn.internal.nop = adev->vcn.inst->external.nop =
>>> +     adev->vcn.inst[0].internal.nop = adev->vcn.inst->external.nop =
>>>                SOC15_REG_OFFSET(UVD, 0, mmUVD_NO_OP);
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);
>>>
>>>                ring = &adev->vcn.inst->ring_enc[i];
>>> @@ -189,7 +189,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     adev->vcn.pause_dpg_mode = vcn_v1_0_pause_dpg_mode;
>>> +     adev->vcn.inst[0].pause_dpg_mode = vcn_v1_0_pause_dpg_mode;
>>>
>>>        if (amdgpu_vcnfw_log) {
>>>                volatile struct amdgpu_fw_shared *fw_shared = adev->vcn.inst->fw_shared.cpu_addr;
>>> @@ -253,7 +253,7 @@ static int vcn_v1_0_hw_init(struct amdgpu_ip_block *ip_block)
>>>        if (r)
>>>                return r;
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                ring = &adev->vcn.inst->ring_enc[i];
>>>                r = amdgpu_ring_test_helper(ring);
>>>                if (r)
>>> @@ -1833,7 +1833,7 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work)
>>>        struct amdgpu_device *adev = vcn_inst->adev;
>>>        unsigned int fences = 0, i;
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i)
>>>                fences += amdgpu_fence_count_emitted(&adev->vcn.inst->ring_enc[i]);
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
>>> @@ -1849,7 +1849,7 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work)
>>>                else
>>>                        new_state.jpeg = VCN_DPG_STATE__UNPAUSE;
>>>
>>> -             adev->vcn.pause_dpg_mode(adev, 0, &new_state);
>>> +             adev->vcn.inst[0].pause_dpg_mode(adev, 0, &new_state);
>>>        }
>>>
>>>        fences += amdgpu_fence_count_emitted(adev->jpeg.inst->ring_dec);
>>> @@ -1872,7 +1872,7 @@ static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring)
>>>        struct  amdgpu_device *adev = ring->adev;
>>>        bool set_clocks = !cancel_delayed_work_sync(&adev->vcn.inst[0].idle_work);
>>>
>>> -     mutex_lock(&adev->vcn.vcn1_jpeg1_workaround);
>>> +     mutex_lock(&adev->vcn.inst[0].vcn1_jpeg1_workaround);
>>>
>>>        if (amdgpu_fence_wait_empty(ring->adev->jpeg.inst->ring_dec))
>>>                DRM_ERROR("VCN dec: jpeg dec ring may not be empty\n");
>>> @@ -1898,7 +1898,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring *ring, bool set_clocks)
>>>                struct dpg_pause_state new_state;
>>>                unsigned int fences = 0, i;
>>>
>>> -             for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +             for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i)
>>>                        fences += amdgpu_fence_count_emitted(&adev->vcn.inst->ring_enc[i]);
>>>
>>>                if (fences)
>>> @@ -1916,14 +1916,14 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring *ring, bool set_clocks)
>>>                else if (ring->funcs->type == AMDGPU_RING_TYPE_VCN_JPEG)
>>>                        new_state.jpeg = VCN_DPG_STATE__PAUSE;
>>>
>>> -             adev->vcn.pause_dpg_mode(adev, 0, &new_state);
>>> +             adev->vcn.inst[0].pause_dpg_mode(adev, 0, &new_state);
>>>        }
>>>    }
>>>
>>>    void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
>>>    {
>>>        schedule_delayed_work(&ring->adev->vcn.inst[0].idle_work, VCN_IDLE_TIMEOUT);
>>> -     mutex_unlock(&ring->adev->vcn.vcn1_jpeg1_workaround);
>>> +     mutex_unlock(&ring->adev->vcn.inst[0].vcn1_jpeg1_workaround);
>>>    }
>>>
>>>    static void vcn_v1_0_print_ip_state(struct amdgpu_ip_block *ip_block, struct drm_printer *p)
>>> @@ -2057,11 +2057,11 @@ static int vcn_v1_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
>>>                uint32_t reg = amdgpu_ib_get_value(ib, i);
>>>                uint32_t val = amdgpu_ib_get_value(ib, i + 1);
>>>
>>> -             if (reg == PACKET0(p->adev->vcn.internal.data0, 0)) {
>>> +             if (reg == PACKET0(p->adev->vcn.inst[0].internal.data0, 0)) {
>>>                        msg_lo = val;
>>> -             } else if (reg == PACKET0(p->adev->vcn.internal.data1, 0)) {
>>> +             } else if (reg == PACKET0(p->adev->vcn.inst[0].internal.data1, 0)) {
>>>                        msg_hi = val;
>>> -             } else if (reg == PACKET0(p->adev->vcn.internal.cmd, 0)) {
>>> +             } else if (reg == PACKET0(p->adev->vcn.inst[0].internal.cmd, 0)) {
>>>                        r = vcn_v1_0_validate_bo(p, job,
>>>                                                 ((u64)msg_hi) << 32 | msg_lo);
>>>                        if (r)
>>> @@ -2146,7 +2146,7 @@ static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev)
>>>    {
>>>        int i;
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i)
>>>                adev->vcn.inst->ring_enc[i].funcs = &vcn_v1_0_enc_ring_vm_funcs;
>>>    }
>>>
>>> @@ -2157,7 +2157,7 @@ static const struct amdgpu_irq_src_funcs vcn_v1_0_irq_funcs = {
>>>
>>>    static void vcn_v1_0_set_irq_funcs(struct amdgpu_device *adev)
>>>    {
>>> -     adev->vcn.inst->irq.num_types = adev->vcn.num_enc_rings + 2;
>>> +     adev->vcn.inst->irq.num_types = adev->vcn.inst[0].num_enc_rings + 2;
>>>        adev->vcn.inst->irq.funcs = &vcn_v1_0_irq_funcs;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>>> index e55c1f8f260e9..b0a957664250c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>>> @@ -110,9 +110,9 @@ static int vcn_v2_0_early_init(struct amdgpu_ip_block *ip_block)
>>>        struct amdgpu_device *adev = ip_block->adev;
>>>
>>>        if (amdgpu_sriov_vf(adev))
>>> -             adev->vcn.num_enc_rings = 1;
>>> +             adev->vcn.inst[0].num_enc_rings = 1;
>>>        else
>>> -             adev->vcn.num_enc_rings = 2;
>>> +             adev->vcn.inst[0].num_enc_rings = 2;
>>>
>>>        vcn_v2_0_set_dec_ring_funcs(adev);
>>>        vcn_v2_0_set_enc_ring_funcs(adev);
>>> @@ -145,7 +145,7 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                return r;
>>>
>>>        /* VCN ENC TRAP */
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN,
>>>                                      i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
>>>                                      &adev->vcn.inst->irq);
>>> @@ -175,25 +175,25 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>        if (r)
>>>                return r;
>>>
>>> -     adev->vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> -     adev->vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> -     adev->vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> -     adev->vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> -     adev->vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> -     adev->vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>>
>>> -     adev->vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>>        adev->vcn.inst->external.scratch9 = SOC15_REG_OFFSET(UVD, 0, mmUVD_SCRATCH9);
>>> -     adev->vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>>        adev->vcn.inst->external.data0 = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA0);
>>> -     adev->vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>>        adev->vcn.inst->external.data1 = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA1);
>>> -     adev->vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>>        adev->vcn.inst->external.cmd = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_CMD);
>>> -     adev->vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>> +     adev->vcn.inst[0].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>>        adev->vcn.inst->external.nop = SOC15_REG_OFFSET(UVD, 0, mmUVD_NO_OP);
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);
>>>
>>>                ring = &adev->vcn.inst->ring_enc[i];
>>> @@ -210,7 +210,7 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     adev->vcn.pause_dpg_mode = vcn_v2_0_pause_dpg_mode;
>>> +     adev->vcn.inst[0].pause_dpg_mode = vcn_v2_0_pause_dpg_mode;
>>>
>>>        r = amdgpu_virt_alloc_mm_table(adev);
>>>        if (r)
>>> @@ -292,7 +292,7 @@ static int vcn_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
>>>        if (amdgpu_sriov_vf(adev))
>>>                ring->sched.ready = false;
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                ring = &adev->vcn.inst->ring_enc[i];
>>>                r = amdgpu_ring_test_helper(ring);
>>>                if (r)
>>> @@ -981,7 +981,7 @@ static int vcn_v2_0_start(struct amdgpu_device *adev)
>>>                amdgpu_dpm_enable_vcn(adev, true, 0);
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v2_0_start_dpg_mode(adev, adev->vcn.indirect_sram);
>>> +             return vcn_v2_0_start_dpg_mode(adev, adev->vcn.inst->indirect_sram);
>>>
>>>        vcn_v2_0_disable_static_power_gating(adev);
>>>
>>> @@ -1421,9 +1421,9 @@ void vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
>>>    {
>>>        struct amdgpu_device *adev = ring->adev;
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data0, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data0, 0));
>>>        amdgpu_ring_write(ring, 0);
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_START << 1));
>>>    }
>>>
>>> @@ -1438,7 +1438,7 @@ void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
>>>    {
>>>        struct amdgpu_device *adev = ring->adev;
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[0].internal.cmd, 0));
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_END << 1));
>>>    }
>>>
>>> @@ -1458,7 +1458,7 @@ void vcn_v2_0_dec_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
>>>        WARN_ON(ring->wptr % 2 || count % 2);
>>>
>>>        for (i = 0; i < count / 2; i++) {
>>> -             amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.nop, 0));
>>> +             amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.nop, 0));
>>>                amdgpu_ring_write(ring, 0);
>>>        }
>>>    }
>>> @@ -1479,25 +1479,25 @@ void vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
>>>        struct amdgpu_device *adev = ring->adev;
>>>
>>>        WARN_ON(flags & AMDGPU_FENCE_FLAG_64BIT);
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.context_id, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.context_id, 0));
>>>        amdgpu_ring_write(ring, seq);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data0, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data0, 0));
>>>        amdgpu_ring_write(ring, addr & 0xffffffff);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data1, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data1, 0));
>>>        amdgpu_ring_write(ring, upper_32_bits(addr) & 0xff);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_FENCE << 1));
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data0, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data0, 0));
>>>        amdgpu_ring_write(ring, 0);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data1, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data1, 0));
>>>        amdgpu_ring_write(ring, 0);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_TRAP << 1));
>>>    }
>>> @@ -1520,14 +1520,14 @@ void vcn_v2_0_dec_ring_emit_ib(struct amdgpu_ring *ring,
>>>        struct amdgpu_device *adev = ring->adev;
>>>        unsigned vmid = AMDGPU_JOB_GET_VMID(job);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.ib_vmid, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.ib_vmid, 0));
>>>        amdgpu_ring_write(ring, vmid);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.ib_bar_low, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.ib_bar_low, 0));
>>>        amdgpu_ring_write(ring, lower_32_bits(ib->gpu_addr));
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.ib_bar_high, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.ib_bar_high, 0));
>>>        amdgpu_ring_write(ring, upper_32_bits(ib->gpu_addr));
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.ib_size, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.ib_size, 0));
>>>        amdgpu_ring_write(ring, ib->length_dw);
>>>    }
>>>
>>> @@ -1536,16 +1536,16 @@ void vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring, uint32_t reg,
>>>    {
>>>        struct amdgpu_device *adev = ring->adev;
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data0, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data0, 0));
>>>        amdgpu_ring_write(ring, reg << 2);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data1, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data1, 0));
>>>        amdgpu_ring_write(ring, val);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.gp_scratch8, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.gp_scratch8, 0));
>>>        amdgpu_ring_write(ring, mask);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_REG_READ_COND_WAIT << 1));
>>>    }
>>> @@ -1570,13 +1570,13 @@ void vcn_v2_0_dec_ring_emit_wreg(struct amdgpu_ring *ring,
>>>    {
>>>        struct amdgpu_device *adev = ring->adev;
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data0, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data0, 0));
>>>        amdgpu_ring_write(ring, reg << 2);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.data1, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.data1, 0));
>>>        amdgpu_ring_write(ring, val);
>>>
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_WRITE_REG << 1));
>>>    }
>>> @@ -1777,9 +1777,9 @@ int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)
>>>        r = amdgpu_ring_alloc(ring, 4);
>>>        if (r)
>>>                return r;
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.cmd, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.cmd, 0));
>>>        amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_START << 1));
>>> -     amdgpu_ring_write(ring, PACKET0(adev->vcn.internal.scratch9, 0));
>>> +     amdgpu_ring_write(ring, PACKET0(adev->vcn.inst[ring->me].internal.scratch9, 0));
>>>        amdgpu_ring_write(ring, 0xDEADBEEF);
>>>        amdgpu_ring_commit(ring);
>>>        for (i = 0; i < adev->usec_timeout; i++) {
>>> @@ -1863,7 +1863,7 @@ static int vcn_v2_0_start_mmsch(struct amdgpu_device *adev,
>>>        adev->vcn.inst->ring_dec.wptr_old = 0;
>>>        vcn_v2_0_dec_ring_set_wptr(&adev->vcn.inst->ring_dec);
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i) {
>>>                adev->vcn.inst->ring_enc[i].wptr = 0;
>>>                adev->vcn.inst->ring_enc[i].wptr_old = 0;
>>>                vcn_v2_0_enc_ring_set_wptr(&adev->vcn.inst->ring_enc[i]);
>>> @@ -1989,7 +1989,7 @@ static int vcn_v2_0_start_sriov(struct amdgpu_device *adev)
>>>                        SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE2),
>>>                        AMDGPU_VCN_CONTEXT_SIZE);
>>>
>>> -             for (r = 0; r < adev->vcn.num_enc_rings; ++r) {
>>> +             for (r = 0; r < adev->vcn.inst[0].num_enc_rings; ++r) {
>>>                        ring = &adev->vcn.inst->ring_enc[r];
>>>                        ring->wptr = 0;
>>>                        MMSCH_V2_0_INSERT_DIRECT_WT(
>>> @@ -2178,7 +2178,7 @@ static void vcn_v2_0_set_enc_ring_funcs(struct amdgpu_device *adev)
>>>    {
>>>        int i;
>>>
>>> -     for (i = 0; i < adev->vcn.num_enc_rings; ++i)
>>> +     for (i = 0; i < adev->vcn.inst[0].num_enc_rings; ++i)
>>>                adev->vcn.inst->ring_enc[i].funcs = &vcn_v2_0_enc_ring_vm_funcs;
>>>    }
>>>
>>> @@ -2189,7 +2189,7 @@ static const struct amdgpu_irq_src_funcs vcn_v2_0_irq_funcs = {
>>>
>>>    static void vcn_v2_0_set_irq_funcs(struct amdgpu_device *adev)
>>>    {
>>> -     adev->vcn.inst->irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +     adev->vcn.inst->irq.num_types = adev->vcn.inst[0].num_enc_rings + 1;
>>>        adev->vcn.inst->irq.funcs = &vcn_v2_0_irq_funcs;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>> index 1d3780a2d8513..a3bac39e4c9db 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>>> @@ -121,11 +121,13 @@ static int amdgpu_ih_clientid_vcns[] = {
>>>    static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>>        if (amdgpu_sriov_vf(adev)) {
>>>                adev->vcn.num_vcn_inst = 2;
>>>                adev->vcn.harvest_config = 0;
>>> -             adev->vcn.num_enc_rings = 1;
>>> +             for (i = 0; i < adev->vcn.num_vcn_inst; i++)
>>> +                     adev->vcn.inst[i].num_enc_rings = 1;
>>>        } else {
>>>                u32 harvest;
>>>                int i;
>>> @@ -134,13 +136,12 @@ static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
>>>                        harvest = RREG32_SOC15(VCN, i, mmCC_UVD_HARVESTING);
>>>                        if (harvest & CC_UVD_HARVESTING__UVD_DISABLE_MASK)
>>>                                adev->vcn.harvest_config |= 1 << i;
>>> +                     adev->vcn.inst[i].num_enc_rings = 2;
>>>                }
>>>                if (adev->vcn.harvest_config == (AMDGPU_VCN_HARVEST_VCN0 |
>>>                                        AMDGPU_VCN_HARVEST_VCN1))
>>>                        /* both instances are harvested, disable the block */
>>>                        return -ENOENT;
>>> -
>>> -             adev->vcn.num_enc_rings = 2;
>>>        }
>>>
>>>        vcn_v2_5_set_dec_ring_funcs(adev);
>>> @@ -176,7 +177,7 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>
>>>                /* VCN ENC TRAP */
>>> -             for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +             for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i) {
>>>                        r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[j],
>>>                                i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE, &adev->vcn.inst[j].irq);
>>>                        if (r)
>>> @@ -205,22 +206,22 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>
>>>                if (adev->vcn.harvest_config & (1 << j))
>>>                        continue;
>>> -             adev->vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>> -
>>> -             adev->vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>> +
>>> +             adev->vcn.inst[j].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>>                adev->vcn.inst[j].external.scratch9 = SOC15_REG_OFFSET(VCN, j, mmUVD_SCRATCH9);
>>> -             adev->vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>>                adev->vcn.inst[j].external.data0 = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_DATA0);
>>> -             adev->vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>>                adev->vcn.inst[j].external.data1 = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_DATA1);
>>> -             adev->vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>>                adev->vcn.inst[j].external.cmd = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_CMD);
>>> -             adev->vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[j].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>>                adev->vcn.inst[j].external.nop = SOC15_REG_OFFSET(VCN, j, mmUVD_NO_OP);
>>>
>>>                ring = &adev->vcn.inst[j].ring_dec;
>>> @@ -240,7 +241,7 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>                if (r)
>>>                        return r;
>>>
>>> -             for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +             for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i) {
>>>                        enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);
>>>
>>>                        ring = &adev->vcn.inst[j].ring_enc[i];
>>> @@ -268,6 +269,9 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>
>>>                if (amdgpu_vcnfw_log)
>>>                        amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v2_5_pause_dpg_mode;
>>>        }
>>>
>>>        if (amdgpu_sriov_vf(adev)) {
>>> @@ -276,9 +280,6 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v2_5_pause_dpg_mode;
>>> -
>>>        r = amdgpu_vcn_ras_sw_init(adev);
>>>        if (r)
>>>                return r;
>>> @@ -369,7 +370,7 @@ static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
>>>                        if (r)
>>>                                return r;
>>>
>>> -                     for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +                     for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i) {
>>>                                ring = &adev->vcn.inst[j].ring_enc[i];
>>>                                r = amdgpu_ring_test_helper(ring);
>>>                                if (r)
>>> @@ -1018,7 +1019,7 @@ static int vcn_v2_5_start(struct amdgpu_device *adev, int i)
>>>                amdgpu_dpm_enable_vcn(adev, true, i);
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v2_5_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v2_5_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        /* disable register anti-hang mechanism */
>>>        WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_POWER_STATUS), 0,
>>> @@ -1746,7 +1747,7 @@ static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev)
>>>        for (j = 0; j < adev->vcn.num_vcn_inst; ++j) {
>>>                if (adev->vcn.harvest_config & (1 << j))
>>>                        continue;
>>> -             for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>>> +             for (i = 0; i < adev->vcn.inst[j].num_enc_rings; ++i) {
>>>                        adev->vcn.inst[j].ring_enc[i].funcs = &vcn_v2_5_enc_ring_vm_funcs;
>>>                        adev->vcn.inst[j].ring_enc[i].me = j;
>>>                }
>>> @@ -1917,10 +1918,10 @@ static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev)
>>>        for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>> -             adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].irq.funcs = &vcn_v2_5_irq_funcs;
>>>
>>> -             adev->vcn.inst[i].ras_poison_irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].ras_poison_irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].ras_poison_irq.funcs = &vcn_v2_6_ras_irq_funcs;
>>>        }
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>>> index 13b9ed96cccda..fabe4d75a7f6b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>>> @@ -127,11 +127,13 @@ static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
>>>    static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>>        if (amdgpu_sriov_vf(adev)) {
>>>                adev->vcn.num_vcn_inst = VCN_INSTANCES_SIENNA_CICHLID;
>>>                adev->vcn.harvest_config = 0;
>>> -             adev->vcn.num_enc_rings = 1;
>>> +             for (i = 0; i < adev->vcn.num_vcn_inst; i++)
>>> +                     adev->vcn.inst[i].num_enc_rings = 1;
>>>
>>>        } else {
>>>                if (adev->vcn.harvest_config == (AMDGPU_VCN_HARVEST_VCN0 |
>>> @@ -139,11 +141,13 @@ static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
>>>                        /* both instances are harvested, disable the block */
>>>                        return -ENOENT;
>>>
>>> -             if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
>>> -                 IP_VERSION(3, 0, 33))
>>> -                     adev->vcn.num_enc_rings = 0;
>>> -             else
>>> -                     adev->vcn.num_enc_rings = 2;
>>> +             for (i = 0; i < adev->vcn.num_vcn_inst; i++) {
>>> +                     if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
>>> +                         IP_VERSION(3, 0, 33))
>>> +                             adev->vcn.inst[i].num_enc_rings = 0;
>>> +                     else
>>> +                             adev->vcn.inst[i].num_enc_rings = 2;
>>> +             }
>>>        }
>>>
>>>        vcn_v3_0_set_dec_ring_funcs(adev);
>>> @@ -198,22 +202,22 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             adev->vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> -             adev->vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
>>>
>>> -             adev->vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
>>>                adev->vcn.inst[i].external.scratch9 = SOC15_REG_OFFSET(VCN, i, mmUVD_SCRATCH9);
>>> -             adev->vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
>>>                adev->vcn.inst[i].external.data0 = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_DATA0);
>>> -             adev->vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
>>>                adev->vcn.inst[i].external.data1 = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_DATA1);
>>> -             adev->vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
>>>                adev->vcn.inst[i].external.cmd = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_CMD);
>>> -             adev->vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>> +             adev->vcn.inst[i].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
>>>                adev->vcn.inst[i].external.nop = SOC15_REG_OFFSET(VCN, i, mmUVD_NO_OP);
>>>
>>>                /* VCN DEC TRAP */
>>> @@ -227,7 +231,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                ring = &adev->vcn.inst[i].ring_dec;
>>>                ring->use_doorbell = true;
>>>                if (amdgpu_sriov_vf(adev)) {
>>> -                     ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.num_enc_rings + 1);
>>> +                     ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.inst[i].num_enc_rings + 1);
>>>                } else {
>>>                        ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 8 * i;
>>>                }
>>> @@ -239,7 +243,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                if (r)
>>>                        return r;
>>>
>>> -             for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
>>> +             for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j) {
>>>                        enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(j);
>>>
>>>                        /* VCN ENC TRAP */
>>> @@ -251,7 +255,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        ring = &adev->vcn.inst[i].ring_enc[j];
>>>                        ring->use_doorbell = true;
>>>                        if (amdgpu_sriov_vf(adev)) {
>>> -                             ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.num_enc_rings + 1) + 1 + j;
>>> +                             ring->doorbell_index = vcn_doorbell_index + i * (adev->vcn.inst[i].num_enc_rings + 1) + 1 + j;
>>>                        } else {
>>>                                ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + j + 8 * i;
>>>                        }
>>> @@ -277,6 +281,9 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>
>>>                if (amdgpu_vcnfw_log)
>>>                        amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v3_0_pause_dpg_mode;
>>>        }
>>>
>>>        if (amdgpu_sriov_vf(adev)) {
>>> @@ -284,8 +291,6 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                if (r)
>>>                        return r;
>>>        }
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v3_0_pause_dpg_mode;
>>>
>>>        /* Allocate memory for VCN IP Dump buffer */
>>>        ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
>>> @@ -373,7 +378,7 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
>>>                                ring->sched.ready = true;
>>>                        }
>>>
>>> -                     for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
>>> +                     for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j) {
>>>                                ring = &adev->vcn.inst[i].ring_enc[j];
>>>                                if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, i)) {
>>>                                        ring->sched.ready = false;
>>> @@ -401,7 +406,7 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
>>>                        if (r)
>>>                                return r;
>>>
>>> -                     for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
>>> +                     for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j) {
>>>                                ring = &adev->vcn.inst[i].ring_enc[j];
>>>                                r = amdgpu_ring_test_helper(ring);
>>>                                if (r)
>>> @@ -1153,7 +1158,7 @@ static int vcn_v3_0_start(struct amdgpu_device *adev, int i)
>>>                amdgpu_dpm_enable_vcn(adev, true, i);
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v3_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v3_0_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        /* disable VCN power gating */
>>>        vcn_v3_0_disable_static_power_gating(adev, i);
>>> @@ -1433,7 +1438,7 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
>>>                        mmUVD_VCPU_CACHE_SIZE2),
>>>                        AMDGPU_VCN_CONTEXT_SIZE);
>>>
>>> -             for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
>>> +             for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j) {
>>>                        ring = &adev->vcn.inst[i].ring_enc[j];
>>>                        ring->wptr = 0;
>>>                        rb_addr = ring->gpu_addr;
>>> @@ -1921,11 +1926,11 @@ static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
>>>                uint32_t reg = amdgpu_ib_get_value(ib, i);
>>>                uint32_t val = amdgpu_ib_get_value(ib, i + 1);
>>>
>>> -             if (reg == PACKET0(p->adev->vcn.internal.data0, 0)) {
>>> +             if (reg == PACKET0(p->adev->vcn.inst[ring->me].internal.data0, 0)) {
>>>                        msg_lo = val;
>>> -             } else if (reg == PACKET0(p->adev->vcn.internal.data1, 0)) {
>>> +             } else if (reg == PACKET0(p->adev->vcn.inst[ring->me].internal.data1, 0)) {
>>>                        msg_hi = val;
>>> -             } else if (reg == PACKET0(p->adev->vcn.internal.cmd, 0) &&
>>> +             } else if (reg == PACKET0(p->adev->vcn.inst[ring->me].internal.cmd, 0) &&
>>>                           val == 0) {
>>>                        r = vcn_v3_0_dec_msg(p, job,
>>>                                             ((u64)msg_hi) << 32 | msg_lo);
>>> @@ -2089,7 +2094,7 @@ static void vcn_v3_0_set_enc_ring_funcs(struct amdgpu_device *adev)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             for (j = 0; j < adev->vcn.num_enc_rings; ++j) {
>>> +             for (j = 0; j < adev->vcn.inst[i].num_enc_rings; ++j) {
>>>                        adev->vcn.inst[i].ring_enc[j].funcs = &vcn_v3_0_enc_ring_vm_funcs;
>>>                        adev->vcn.inst[i].ring_enc[j].me = i;
>>>                }
>>> @@ -2255,7 +2260,7 @@ static void vcn_v3_0_set_irq_funcs(struct amdgpu_device *adev)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].irq.funcs = &vcn_v3_0_irq_funcs;
>>>        }
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> index dbbeeffc90726..ee87594fafa60 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>>> @@ -129,8 +129,9 @@ static int vcn_v4_0_early_init(struct amdgpu_ip_block *ip_block)
>>>                }
>>>        }
>>>
>>> -     /* re-use enc ring as unified ring */
>>> -     adev->vcn.num_enc_rings = 1;
>>> +     for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>> +             /* re-use enc ring as unified ring */
>>> +             adev->vcn.inst[i].num_enc_rings = 1;
>>>
>>>        vcn_v4_0_set_unified_ring_funcs(adev);
>>>        vcn_v4_0_set_irq_funcs(adev);
>>> @@ -214,7 +215,8 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                ring = &adev->vcn.inst[i].ring_enc[0];
>>>                ring->use_doorbell = true;
>>>                if (amdgpu_sriov_vf(adev))
>>> -                     ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + i * (adev->vcn.num_enc_rings + 1) + 1;
>>> +                     ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + i *
>>> +                             (adev->vcn.inst[i].num_enc_rings + 1) + 1;
>>>                else
>>>                        ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + 8 * i;
>>>                ring->vm_hub = AMDGPU_MMHUB0(0);
>>> @@ -226,6 +228,9 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>
>>>                vcn_v4_0_fw_shared_init(adev, i);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v4_0_pause_dpg_mode;
>>>        }
>>>
>>>        /* TODO: Add queue reset mask when FW fully supports it */
>>> @@ -238,8 +243,6 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v4_0_pause_dpg_mode;
>>>
>>>        r = amdgpu_vcn_ras_sw_init(adev);
>>>        if (r)
>>> @@ -1111,7 +1114,7 @@ static int vcn_v4_0_start(struct amdgpu_device *adev, int i)
>>>        fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v4_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v4_0_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        /* disable VCN power gating */
>>>        vcn_v4_0_disable_static_power_gating(adev, i);
>>> @@ -2172,10 +2175,10 @@ static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].irq.funcs = &vcn_v4_0_irq_funcs;
>>>
>>> -             adev->vcn.inst[i].ras_poison_irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].ras_poison_irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].ras_poison_irq.funcs = &vcn_v4_0_ras_irq_funcs;
>>>        }
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>>> index 8396ef6831b69..35854e074d142 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>>> @@ -114,9 +114,11 @@ static inline bool vcn_v4_0_3_normalizn_reqd(struct amdgpu_device *adev)
>>>    static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>> -     /* re-use enc ring as unified ring */
>>> -     adev->vcn.num_enc_rings = 1;
>>> +     for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>> +             /* re-use enc ring as unified ring */
>>> +             adev->vcn.inst[i].num_enc_rings = 1;
>>>
>>>        vcn_v4_0_3_set_unified_ring_funcs(adev);
>>>        vcn_v4_0_3_set_irq_funcs(adev);
>>> @@ -194,6 +196,9 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>
>>>                vcn_v4_0_3_fw_shared_init(adev, i);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v4_0_3_pause_dpg_mode;
>>>        }
>>>
>>>        /* TODO: Add queue reset mask when FW fully supports it */
>>> @@ -206,9 +211,6 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v4_0_3_pause_dpg_mode;
>>> -
>>>        if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN)) {
>>>                r = amdgpu_vcn_ras_sw_init(adev);
>>>                if (r) {
>>> @@ -1138,7 +1140,7 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev, int i)
>>>                amdgpu_dpm_enable_vcn(adev, true, i);
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v4_0_3_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v4_0_3_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        vcn_inst = GET_INST(VCN, i);
>>>        /* set VCN status busy */
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>> index f6b347fcdb7ed..0700a5f96084c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>>> @@ -115,9 +115,11 @@ static void vcn_v4_0_5_unified_ring_set_wptr(struct amdgpu_ring *ring);
>>>    static int vcn_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>> -     /* re-use enc ring as unified ring */
>>> -     adev->vcn.num_enc_rings = 1;
>>> +     for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>> +             /* re-use enc ring as unified ring */
>>> +             adev->vcn.inst[i].num_enc_rings = 1;
>>>        vcn_v4_0_5_set_unified_ring_funcs(adev);
>>>        vcn_v4_0_5_set_irq_funcs(adev);
>>>
>>> @@ -173,7 +175,7 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>                ring->use_doorbell = true;
>>>                if (amdgpu_sriov_vf(adev))
>>>                        ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
>>> -                                             i * (adev->vcn.num_enc_rings + 1) + 1;
>>> +                                             i * (adev->vcn.inst[i].num_enc_rings + 1) + 1;
>>>                else
>>>                        ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) +
>>>                                                2 + 8 * i;
>>> @@ -198,6 +200,9 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>
>>>                if (amdgpu_vcnfw_log)
>>>                        amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
>>>        }
>>>
>>>        if (amdgpu_sriov_vf(adev)) {
>>> @@ -206,9 +211,6 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
>>>                        return r;
>>>        }
>>>
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
>>> -
>>>        /* Allocate memory for VCN IP Dump buffer */
>>>        ptr = kcalloc(adev->vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
>>>        if (!ptr) {
>>> @@ -1014,7 +1016,7 @@ static int vcn_v4_0_5_start(struct amdgpu_device *adev, int i)
>>>        fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v4_0_5_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v4_0_5_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        /* disable VCN power gating */
>>>        vcn_v4_0_5_disable_static_power_gating(adev, i);
>>> @@ -1624,7 +1626,7 @@ static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].irq.funcs = &vcn_v4_0_5_irq_funcs;
>>>        }
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>>> index c5d59edf3a482..eeb3c9875ad50 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>>> @@ -98,9 +98,11 @@ static void vcn_v5_0_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
>>>    static int vcn_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>> -     /* re-use enc ring as unified ring */
>>> -     adev->vcn.num_enc_rings = 1;
>>> +     for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>> +             /* re-use enc ring as unified ring */
>>> +             adev->vcn.inst[i].num_enc_rings = 1;
>>>
>>>        vcn_v5_0_0_set_unified_ring_funcs(adev);
>>>        vcn_v5_0_0_set_irq_funcs(adev);
>>> @@ -184,15 +186,15 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)
>>>
>>>                if (amdgpu_vcnfw_log)
>>>                        amdgpu_vcn_fwlog_init(&adev->vcn.inst[i]);
>>> +
>>> +             if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> +                     adev->vcn.inst[i].pause_dpg_mode = vcn_v5_0_0_pause_dpg_mode;
>>>        }
>>>
>>>        /* TODO: Add queue reset mask when FW fully supports it */
>>>        adev->vcn.supported_reset =
>>>                amdgpu_get_soft_full_reset_mask(&adev->vcn.inst[0].ring_enc[0]);
>>>
>>> -     if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             adev->vcn.pause_dpg_mode = vcn_v5_0_0_pause_dpg_mode;
>>> -
>>>        vcn_v5_0_0_alloc_ip_dump(adev);
>>>
>>>        r = amdgpu_vcn_sysfs_reset_mask_init(adev);
>>> @@ -791,7 +793,7 @@ static int vcn_v5_0_0_start(struct amdgpu_device *adev, int i)
>>>        fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v5_0_0_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v5_0_0_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        /* disable VCN power gating */
>>>        vcn_v5_0_0_disable_static_power_gating(adev, i);
>>> @@ -1367,7 +1369,7 @@ static void vcn_v5_0_0_set_irq_funcs(struct amdgpu_device *adev)
>>>                if (adev->vcn.harvest_config & (1 << i))
>>>                        continue;
>>>
>>> -             adev->vcn.inst[i].irq.num_types = adev->vcn.num_enc_rings + 1;
>>> +             adev->vcn.inst[i].irq.num_types = adev->vcn.inst[i].num_enc_rings + 1;
>>>                adev->vcn.inst[i].irq.funcs = &vcn_v5_0_0_irq_funcs;
>>>        }
>>>    }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
>>> index 51a2d70a65c9e..f428d23eb2857 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
>>> @@ -58,9 +58,11 @@ static void vcn_v5_0_1_unified_ring_set_wptr(struct amdgpu_ring *ring);
>>>    static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
>>>    {
>>>        struct amdgpu_device *adev = ip_block->adev;
>>> +     int i;
>>>
>>> -     /* re-use enc ring as unified ring */
>>> -     adev->vcn.num_enc_rings = 1;
>>> +     for (i = 0; i < adev->vcn.num_vcn_inst; ++i)
>>> +             /* re-use enc ring as unified ring */
>>> +             adev->vcn.inst[i].num_enc_rings = 1;
>>>
>>>        vcn_v5_0_1_set_unified_ring_funcs(adev);
>>>        vcn_v5_0_1_set_irq_funcs(adev);
>>> @@ -586,7 +588,7 @@ static int vcn_v5_0_1_start(struct amdgpu_device *adev, int i)
>>>        fw_shared = adev->vcn.inst[i].fw_shared.cpu_addr;
>>>
>>>        if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG)
>>> -             return vcn_v5_0_1_start_dpg_mode(adev, i, adev->vcn.indirect_sram);
>>> +             return vcn_v5_0_1_start_dpg_mode(adev, i, adev->vcn.inst[i].indirect_sram);
>>>
>>>        vcn_inst = GET_INST(VCN, i);
>>>
--------------y8P3v5wNVlNHmmSM0c0jMwBp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-02-05 15:09, Alex Deucher
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADnq5_NTDXP4ZcENhzN2W_JzLRPZ+099xs_523GHaYSn0npOsQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Feb 4, 2025 at 10:42 PM Boyuan Zhang <a class="moz-txt-link-rfc2396E" href="mailto:Boyuan.Zhang@amd.com">&lt;Boyuan.Zhang@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

On 2025-01-31 11:57, Alex Deucher wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Move more per instance data into the per instance structure.

v2: index instances directly on vcn1.0 and 2.0 to make
it clear that they only support a single instance (Lijo)

Signed-off-by: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
---
  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |   2 +-
  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 196 ++++++++++++------------
  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  17 +-
  drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c  |   4 +-
  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c   |  42 ++---
  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c   |  92 +++++------
  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c   |  51 +++---
  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c   |  67 ++++----
  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c   |  19 ++-
  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c |  14 +-
  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c |  18 ++-
  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c |  16 +-
  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c |   8 +-
  13 files changed, 279 insertions(+), 267 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 2c76bc5e25d92..5ee2ae66ed36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -480,7 +480,7 @@ static int amdgpu_hw_ip_info(struct amdgpu_device *adev,
                      if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                              continue;

-                     for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; j++)
+                     for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; j++)
                              if (adev-&gt;vcn.inst[i].ring_enc[j].sched.ready)
                                      ++num_rings;
              }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 0c3081a198d9e..9901b8e17f305 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -127,93 +127,88 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
      unsigned int fw_shared_size, log_offset;
      int i, r;

-     mutex_init(&amp;adev-&gt;vcn.vcn1_jpeg1_workaround);
      for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; i++) {
+             mutex_init(&amp;adev-&gt;vcn.inst[i].vcn1_jpeg1_workaround);
              mutex_init(&amp;adev-&gt;vcn.inst[i].vcn_pg_lock);
              atomic_set(&amp;adev-&gt;vcn.inst[i].total_submission_cnt, 0);
              INIT_DELAYED_WORK(&amp;adev-&gt;vcn.inst[i].idle_work, amdgpu_vcn_idle_work_handler);
              atomic_set(&amp;adev-&gt;vcn.inst[i].dpg_enc_submission_cnt, 0);
-     }
-
-     if ((adev-&gt;firmware.load_type == AMDGPU_FW_LOAD_PSP) &amp;&amp;
-         (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG))
-             adev-&gt;vcn.indirect_sram = true;
-
-     /*
-      * Some Steam Deck's BIOS versions are incompatible with the
-      * indirect SRAM mode, leading to amdgpu being unable to get
-      * properly probed (and even potentially crashing the kernel).
-      * Hence, check for these versions here - notice this is
-      * restricted to Vangogh (Deck's APU).
-      */
-     if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
-             const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
-
-             if (bios_ver &amp;&amp; (!strncmp(&quot;F7A0113&quot;, bios_ver, 7) ||
-                  !strncmp(&quot;F7A0114&quot;, bios_ver, 7))) {
-                     adev-&gt;vcn.indirect_sram = false;
-                     dev_info(adev-&gt;dev,
-                             &quot;Steam Deck quirk: indirect SRAM disabled on BIOS %s\n&quot;, bios_ver);
+             if ((adev-&gt;firmware.load_type == AMDGPU_FW_LOAD_PSP) &amp;&amp;
+                 (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG))
+                     adev-&gt;vcn.inst[i].indirect_sram = true;
+
+             /*
+              * Some Steam Deck's BIOS versions are incompatible with the
+              * indirect SRAM mode, leading to amdgpu being unable to get
+              * properly probed (and even potentially crashing the kernel).
+              * Hence, check for these versions here - notice this is
+              * restricted to Vangogh (Deck's APU).
+              */
+             if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(3, 0, 2)) {
+                     const char *bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
+
+                     if (bios_ver &amp;&amp; (!strncmp(&quot;F7A0113&quot;, bios_ver, 7) ||
+                                      !strncmp(&quot;F7A0114&quot;, bios_ver, 7))) {
+                             adev-&gt;vcn.inst[i].indirect_sram = false;
+                             dev_info(adev-&gt;dev,
+                                      &quot;Steam Deck quirk: indirect SRAM disabled on BIOS %s\n&quot;, bios_ver);
+                     }
              }
-     }

-     /* from vcn4 and above, only unified queue is used */
-     adev-&gt;vcn.using_unified_queue =
-             amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(4, 0, 0);
-
-     hdr = (const struct common_firmware_header *)adev-&gt;vcn.inst[0].fw-&gt;data;
-     adev-&gt;vcn.fw_version = le32_to_cpu(hdr-&gt;ucode_version);
-
-     /* Bit 20-23, it is encode major and non-zero for new naming convention.
-      * This field is part of version minor and DRM_DISABLED_FLAG in old naming
-      * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
-      * is zero in old naming convention, this field is always zero so far.
-      * These four bits are used to tell which naming convention is present.
-      */
-     fw_check = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 20) &amp; 0xf;
-     if (fw_check) {
-             unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
-
-             fw_rev = le32_to_cpu(hdr-&gt;ucode_version) &amp; 0xfff;
-             enc_minor = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 12) &amp; 0xff;
-             enc_major = fw_check;
-             dec_ver = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 24) &amp; 0xf;
-             vep = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 28) &amp; 0xf;
-             DRM_INFO(&quot;Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n&quot;,
-                     enc_major, enc_minor, dec_ver, vep, fw_rev);
-     } else {
-             unsigned int version_major, version_minor, family_id;
+             /* from vcn4 and above, only unified queue is used */
+             adev-&gt;vcn.inst[i].using_unified_queue =
+                     amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(4, 0, 0);
+
+             hdr = (const struct common_firmware_header *)adev-&gt;vcn.inst[i].fw-&gt;data;
+             adev-&gt;vcn.inst[i].fw_version = le32_to_cpu(hdr-&gt;ucode_version);
+             adev-&gt;vcn.fw_version = le32_to_cpu(hdr-&gt;ucode_version);
+
+             /* Bit 20-23, it is encode major and non-zero for new naming convention.
+              * This field is part of version minor and DRM_DISABLED_FLAG in old naming
+              * convention. Since the l:wq!atest version minor is 0x5B and DRM_DISABLED_FLAG
+              * is zero in old naming convention, this field is always zero so far.
+              * These four bits are used to tell which naming convention is present.
+              */
+             fw_check = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 20) &amp; 0xf;
+             if (fw_check) {
+                     unsigned int dec_ver, enc_major, enc_minor, vep, fw_rev;
+
+                     fw_rev = le32_to_cpu(hdr-&gt;ucode_version) &amp; 0xfff;
+                     enc_minor = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 12) &amp; 0xff;
+                     enc_major = fw_check;
+                     dec_ver = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 24) &amp; 0xf;
+                     vep = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 28) &amp; 0xf;
+                     DRM_INFO(&quot;Found VCN firmware Version ENC: %u.%u DEC: %u VEP: %u Revision: %u\n&quot;,
+                              enc_major, enc_minor, dec_ver, vep, fw_rev);
+             } else {
+                     unsigned int version_major, version_minor, family_id;

-             family_id = le32_to_cpu(hdr-&gt;ucode_version) &amp; 0xff;
-             version_major = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 24) &amp; 0xff;
-             version_minor = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 8) &amp; 0xff;
-             DRM_INFO(&quot;Found VCN firmware Version: %u.%u Family ID: %u\n&quot;,
-                     version_major, version_minor, family_id);
-     }
+                     family_id = le32_to_cpu(hdr-&gt;ucode_version) &amp; 0xff;
+                     version_major = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 24) &amp; 0xff;
+                     version_minor = (le32_to_cpu(hdr-&gt;ucode_version) &gt;&gt; 8) &amp; 0xff;
+                     DRM_INFO(&quot;Found VCN firmware Version: %u.%u Family ID: %u\n&quot;,
+                              version_major, version_minor, family_id);
+             }

-     bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
-     if (adev-&gt;firmware.load_type != AMDGPU_FW_LOAD_PSP)
-             bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr-&gt;ucode_size_bytes) + 8);
+             bo_size = AMDGPU_VCN_STACK_SIZE + AMDGPU_VCN_CONTEXT_SIZE;
+             if (adev-&gt;firmware.load_type != AMDGPU_FW_LOAD_PSP)
+                     bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr-&gt;ucode_size_bytes) + 8);

-     if (amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(5, 0, 0)) {
-             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
-             log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
-     } else if (amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(4, 0, 0)) {
-             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
-             log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
-     } else {
-             fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
-             log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
-     }
-
-     bo_size += fw_shared_size;
+             if (amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(5, 0, 0)) {
+                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn5_fw_shared));
+                     log_offset = offsetof(struct amdgpu_vcn5_fw_shared, fw_log);
+             } else if (amdgpu_ip_version(adev, UVD_HWIP, 0) &gt;= IP_VERSION(4, 0, 0)) {
+                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_vcn4_fw_shared));
+                     log_offset = offsetof(struct amdgpu_vcn4_fw_shared, fw_log);
+             } else {
+                     fw_shared_size = AMDGPU_GPU_PAGE_ALIGN(sizeof(struct amdgpu_fw_shared));
+                     log_offset = offsetof(struct amdgpu_fw_shared, fw_log);
+             }

-     if (amdgpu_vcnfw_log)
-             bo_size += AMDGPU_VCNFW_LOG_SIZE;
+             bo_size += fw_shared_size;

-     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; i++) {
-             if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
-                     continue;
+             if (amdgpu_vcnfw_log)
+                     bo_size += AMDGPU_VCNFW_LOG_SIZE;

              r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
                                          AMDGPU_GEM_DOMAIN_VRAM |
@@ -239,7 +234,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
                      adev-&gt;vcn.inst[i].fw_shared.log_offset = log_offset;
              }

-             if (adev-&gt;vcn.indirect_sram) {
+             if (adev-&gt;vcn.inst[i].indirect_sram) {
                      r = amdgpu_bo_create_kernel(adev, 64 * 2 * 4, PAGE_SIZE,
                                      AMDGPU_GEM_DOMAIN_VRAM |
                                      AMDGPU_GEM_DOMAIN_GTT,
@@ -277,15 +272,14 @@ int amdgpu_vcn_sw_fini(struct amdgpu_device *adev)

              amdgpu_ring_fini(&amp;adev-&gt;vcn.inst[j].ring_dec);

-             for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+             for (i = 0; i &lt; adev-&gt;vcn.inst[j].num_enc_rings; ++i)
                      amdgpu_ring_fini(&amp;adev-&gt;vcn.inst[j].ring_enc[i]);

              amdgpu_ucode_release(&amp;adev-&gt;vcn.inst[j].fw);
              mutex_destroy(&amp;adev-&gt;vcn.inst[j].vcn_pg_lock);
+             mutex_destroy(&amp;adev-&gt;vcn.inst[j].vcn1_jpeg1_workaround);
      }

-     mutex_destroy(&amp;adev-&gt;vcn.vcn1_jpeg1_workaround);
-
      return 0;
  }

@@ -404,12 +398,12 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
      if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
              return;

-     for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j)
+     for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j)
              fence[i] += amdgpu_fence_count_emitted(&amp;vcn_inst-&gt;ring_enc[j]);

      /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG &amp;&amp;
-         !adev-&gt;vcn.using_unified_queue) {
+         !adev-&gt;vcn.inst[i].using_unified_queue) {
              struct dpg_pause_state new_state;

              if (fence[i] ||
@@ -418,7 +412,7 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
              else
                      new_state.fw_based = VCN_DPG_STATE__UNPAUSE;

-             adev-&gt;vcn.pause_dpg_mode(adev, i, &amp;new_state);
+             adev-&gt;vcn.inst[i].pause_dpg_mode(adev, i, &amp;new_state);
      }

      fence[i] += amdgpu_fence_count_emitted(&amp;vcn_inst-&gt;ring_dec);
@@ -456,7 +450,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)

      /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG &amp;&amp;
-         !adev-&gt;vcn.using_unified_queue) {
+         !adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue) {
              struct dpg_pause_state new_state;

              if (ring-&gt;funcs-&gt;type == AMDGPU_RING_TYPE_VCN_ENC) {
@@ -466,7 +460,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
                      unsigned int fences = 0;
                      unsigned int i;

-                     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+                     for (i = 0; i &lt; adev-&gt;vcn.inst[ring-&gt;me].num_enc_rings; ++i)
                              fences += amdgpu_fence_count_emitted(&amp;adev-&gt;vcn.inst[ring-&gt;me].ring_enc[i]);

                      if (fences || atomic_read(&amp;adev-&gt;vcn.inst[ring-&gt;me].dpg_enc_submission_cnt))
@@ -475,7 +469,7 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
                              new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
              }

-             adev-&gt;vcn.pause_dpg_mode(adev, ring-&gt;me, &amp;new_state);
+             adev-&gt;vcn.inst[ring-&gt;me].pause_dpg_mode(adev, ring-&gt;me, &amp;new_state);
      }
      mutex_unlock(&amp;adev-&gt;vcn.inst[ring-&gt;me].vcn_pg_lock);
  }
@@ -487,7 +481,7 @@ void amdgpu_vcn_ring_end_use(struct amdgpu_ring *ring)
      /* Only set DPG pause for VCN3 or below, VCN4 and above will be handled by FW */
      if (ring-&gt;adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG &amp;&amp;
          ring-&gt;funcs-&gt;type == AMDGPU_RING_TYPE_VCN_ENC &amp;&amp;
-         !adev-&gt;vcn.using_unified_queue)
+         !adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              atomic_dec(&amp;ring-&gt;adev-&gt;vcn.inst[ring-&gt;me].dpg_enc_submission_cnt);

      atomic_dec(&amp;ring-&gt;adev-&gt;vcn.inst[ring-&gt;me].total_submission_cnt);
@@ -511,7 +505,7 @@ int amdgpu_vcn_dec_ring_test_ring(struct amdgpu_ring *ring)
      r = amdgpu_ring_alloc(ring, 3);
      if (r)
              return r;
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.scratch9, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.scratch9, 0));
      amdgpu_ring_write(ring, 0xDEADBEEF);
      amdgpu_ring_commit(ring);
      for (i = 0; i &lt; adev-&gt;usec_timeout; i++) {
@@ -576,14 +570,14 @@ static int amdgpu_vcn_dec_send_msg(struct amdgpu_ring *ring,
              goto err;

      ib = &amp;job-&gt;ibs[0];
-     ib-&gt;ptr[0] = PACKET0(adev-&gt;vcn.internal.data0, 0);
+     ib-&gt;ptr[0] = PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0);
      ib-&gt;ptr[1] = addr;
-     ib-&gt;ptr[2] = PACKET0(adev-&gt;vcn.internal.data1, 0);
+     ib-&gt;ptr[2] = PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0);
      ib-&gt;ptr[3] = addr &gt;&gt; 32;
-     ib-&gt;ptr[4] = PACKET0(adev-&gt;vcn.internal.cmd, 0);
+     ib-&gt;ptr[4] = PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0);
      ib-&gt;ptr[5] = 0;
      for (i = 6; i &lt; 16; i += 2) {
-             ib-&gt;ptr[i] = PACKET0(adev-&gt;vcn.internal.nop, 0);
+             ib-&gt;ptr[i] = PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.nop, 0);
              ib-&gt;ptr[i+1] = 0;
      }
      ib-&gt;length_dw = 16;
@@ -746,7 +740,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
      uint32_t ib_pack_in_dw;
      int i, r;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              ib_size_dw += 8;

      r = amdgpu_job_alloc_with_ib(ring-&gt;adev, NULL, NULL,
@@ -759,7 +753,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
      ib-&gt;length_dw = 0;

      /* single queue headers */
-     if (adev-&gt;vcn.using_unified_queue) {
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue) {
              ib_pack_in_dw = sizeof(struct amdgpu_vcn_decode_buffer) / sizeof(uint32_t)
                                              + 4 + 2; /* engine info + decoding ib in dw */
              ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, ib_pack_in_dw, false);
@@ -778,7 +772,7 @@ static int amdgpu_vcn_dec_sw_send_msg(struct amdgpu_ring *ring,
      for (i = ib-&gt;length_dw; i &lt; ib_size_dw; ++i)
              ib-&gt;ptr[i] = 0x0;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              amdgpu_vcn_unified_ring_ib_checksum(&amp;ib_checksum, ib_pack_in_dw);

      r = amdgpu_job_submit_direct(job, ring, &amp;f);
@@ -876,7 +870,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
      uint64_t addr;
      int i, r;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              ib_size_dw += 8;

      r = amdgpu_job_alloc_with_ib(ring-&gt;adev, NULL, NULL,
@@ -890,7 +884,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand

      ib-&gt;length_dw = 0;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, 0x11, true);

      ib-&gt;ptr[ib-&gt;length_dw++] = 0x00000018;
@@ -912,7 +906,7 @@ static int amdgpu_vcn_enc_get_create_msg(struct amdgpu_ring *ring, uint32_t hand
      for (i = ib-&gt;length_dw; i &lt; ib_size_dw; ++i)
              ib-&gt;ptr[i] = 0x0;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              amdgpu_vcn_unified_ring_ib_checksum(&amp;ib_checksum, 0x11);

      r = amdgpu_job_submit_direct(job, ring, &amp;f);
@@ -943,7 +937,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
      uint64_t addr;
      int i, r;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              ib_size_dw += 8;

      r = amdgpu_job_alloc_with_ib(ring-&gt;adev, NULL, NULL,
@@ -957,7 +951,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han

      ib-&gt;length_dw = 0;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              ib_checksum = amdgpu_vcn_unified_ring_ib_header(ib, 0x11, true);

      ib-&gt;ptr[ib-&gt;length_dw++] = 0x00000018;
@@ -979,7 +973,7 @@ static int amdgpu_vcn_enc_get_destroy_msg(struct amdgpu_ring *ring, uint32_t han
      for (i = ib-&gt;length_dw; i &lt; ib_size_dw; ++i)
              ib-&gt;ptr[i] = 0x0;

-     if (adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.inst[ring-&gt;me].using_unified_queue)
              amdgpu_vcn_unified_ring_ib_checksum(&amp;ib_checksum, 0x11);

      r = amdgpu_job_submit_direct(job, ring, &amp;f);
@@ -1396,7 +1390,7 @@ void amdgpu_debugfs_vcn_sched_mask_init(struct amdgpu_device *adev)
      struct dentry *root = minor-&gt;debugfs_root;
      char name[32];

-     if (adev-&gt;vcn.num_vcn_inst &lt;= 1 || !adev-&gt;vcn.using_unified_queue)
+     if (adev-&gt;vcn.num_vcn_inst &lt;= 1 || !adev-&gt;vcn.inst[0].using_unified_queue)
              return;
      sprintf(name, &quot;amdgpu_vcn_sched_mask&quot;);
      debugfs_create_file(name, 0600, root, adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
index 0bcf4d1c7175d..3b059f51894b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
@@ -322,6 +322,15 @@ struct amdgpu_vcn_inst {
      struct mutex            vcn_pg_lock;
      enum amd_powergating_state cur_state;
      struct delayed_work     idle_work;
+     unsigned                fw_version;
+     unsigned                num_enc_rings;
+     bool                    indirect_sram;
+     struct amdgpu_vcn_reg    internal;
+     struct mutex            vcn1_jpeg1_workaround;
+     int (*pause_dpg_mode)(struct amdgpu_device *adev,
+                           int inst_idx,
+                           struct dpg_pause_state *new_state);
+     bool using_unified_queue;
  };

  struct amdgpu_vcn_ras {
@@ -330,24 +339,16 @@ struct amdgpu_vcn_ras {

  struct amdgpu_vcn {
      unsigned                fw_version;
-     unsigned                num_enc_rings;
-     bool                    indirect_sram;
-
      uint8_t num_vcn_inst;
      struct amdgpu_vcn_inst   inst[AMDGPU_MAX_VCN_INSTANCES];
-     struct amdgpu_vcn_reg    internal;
-     struct mutex            vcn1_jpeg1_workaround;

      unsigned        harvest_config;
-     int (*pause_dpg_mode)(struct amdgpu_device *adev,
-             int inst_idx, struct dpg_pause_state *new_state);

      struct ras_common_if    *ras_if;
      struct amdgpu_vcn_ras   *ras;

      uint16_t inst_mask;
      uint8_t num_inst_per_aid;
-     bool using_unified_queue;
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

unified_queue feature is determined by VCN IP version, so the &quot;bool
using_unified_queue&quot; should be a generic value for all instances. Should
we still need to separate it for each instance?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Well, you could in theory have two different VCN instances each with a
different version on an SoC.  We already have that today (e.g., navi31
contains two instances, one is 4.0.0 and the other is 4.0.1), but it
just so happens that both versions support unified queues.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>yea make sense. <br>
    </p>
    <p><font size="2"><span style="font-size:11pt;"><span data-markjs="true" data-olk-copy-source="MessageBody"><span data-markjs="true" class="mark5quw442ch" style="" data-ogac="" data-ogab="" data-ogsc="" data-ogsb="" data-olk-copy-source="MessageBody">Reviewed-by</span></span>:
          Boyuan Zhang <a href="mailto:Boyuan.Zhang@amd.com" title="mailto:Boyuan.Zhang@amd.com" data-linkindex="2">&lt;Boyuan.Zhang@amd.com&gt;</a></span></font></p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CADnq5_NTDXP4ZcENhzN2W_JzLRPZ+099xs_523GHaYSn0npOsQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Alex

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Boyuan


</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
      /* IP reg dump */
      uint32_t                *ip_dump;
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
index 8031406e20ff9..9e428e669ada6 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v1_0.c
@@ -607,12 +607,12 @@ static void jpeg_v1_0_ring_begin_use(struct amdgpu_ring *ring)
      bool    set_clocks = !cancel_delayed_work_sync(&amp;adev-&gt;vcn.inst[0].idle_work);
      int             cnt = 0;

-     mutex_lock(&amp;adev-&gt;vcn.vcn1_jpeg1_workaround);
+     mutex_lock(&amp;adev-&gt;vcn.inst[0].vcn1_jpeg1_workaround);

      if (amdgpu_fence_wait_empty(&amp;adev-&gt;vcn.inst-&gt;ring_dec))
              DRM_ERROR(&quot;JPEG dec: vcn dec ring may not be empty\n&quot;);

-     for (cnt = 0; cnt &lt; adev-&gt;vcn.num_enc_rings; cnt++) {
+     for (cnt = 0; cnt &lt; adev-&gt;vcn.inst[0].num_enc_rings; cnt++) {
              if (amdgpu_fence_wait_empty(&amp;adev-&gt;vcn.inst-&gt;ring_enc[cnt]))
                      DRM_ERROR(&quot;JPEG dec: vcn enc ring[%d] may not be empty\n&quot;, cnt);
      }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 757cacf11a817..c870d9ba64c69 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -105,7 +105,7 @@ static int vcn_v1_0_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;

-     adev-&gt;vcn.num_enc_rings = 2;
+     adev-&gt;vcn.inst[0].num_enc_rings = 2;

      vcn_v1_0_set_dec_ring_funcs(adev);
      vcn_v1_0_set_enc_ring_funcs(adev);
@@ -138,7 +138,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
              return r;

      /* VCN ENC TRAP */
-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN, i + VCN_1_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
                                      &amp;adev-&gt;vcn.inst-&gt;irq);
              if (r)
@@ -166,18 +166,18 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
      if (r)
              return r;

-     adev-&gt;vcn.internal.scratch9 = adev-&gt;vcn.inst-&gt;external.scratch9 =
+     adev-&gt;vcn.inst[0].internal.scratch9 = adev-&gt;vcn.inst-&gt;external.scratch9 =
              SOC15_REG_OFFSET(UVD, 0, mmUVD_SCRATCH9);
-     adev-&gt;vcn.internal.data0 = adev-&gt;vcn.inst-&gt;external.data0 =
+     adev-&gt;vcn.inst[0].internal.data0 = adev-&gt;vcn.inst-&gt;external.data0 =
              SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA0);
-     adev-&gt;vcn.internal.data1 = adev-&gt;vcn.inst-&gt;external.data1 =
+     adev-&gt;vcn.inst[0].internal.data1 = adev-&gt;vcn.inst-&gt;external.data1 =
              SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA1);
-     adev-&gt;vcn.internal.cmd = adev-&gt;vcn.inst-&gt;external.cmd =
+     adev-&gt;vcn.inst[0].internal.cmd = adev-&gt;vcn.inst-&gt;external.cmd =
              SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_CMD);
-     adev-&gt;vcn.internal.nop = adev-&gt;vcn.inst-&gt;external.nop =
+     adev-&gt;vcn.inst[0].internal.nop = adev-&gt;vcn.inst-&gt;external.nop =
              SOC15_REG_OFFSET(UVD, 0, mmUVD_NO_OP);

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);

              ring = &amp;adev-&gt;vcn.inst-&gt;ring_enc[i];
@@ -189,7 +189,7 @@ static int vcn_v1_0_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     adev-&gt;vcn.pause_dpg_mode = vcn_v1_0_pause_dpg_mode;
+     adev-&gt;vcn.inst[0].pause_dpg_mode = vcn_v1_0_pause_dpg_mode;

      if (amdgpu_vcnfw_log) {
              volatile struct amdgpu_fw_shared *fw_shared = adev-&gt;vcn.inst-&gt;fw_shared.cpu_addr;
@@ -253,7 +253,7 @@ static int vcn_v1_0_hw_init(struct amdgpu_ip_block *ip_block)
      if (r)
              return r;

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              ring = &amp;adev-&gt;vcn.inst-&gt;ring_enc[i];
              r = amdgpu_ring_test_helper(ring);
              if (r)
@@ -1833,7 +1833,7 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work)
      struct amdgpu_device *adev = vcn_inst-&gt;adev;
      unsigned int fences = 0, i;

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i)
              fences += amdgpu_fence_count_emitted(&amp;adev-&gt;vcn.inst-&gt;ring_enc[i]);

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG) {
@@ -1849,7 +1849,7 @@ static void vcn_v1_0_idle_work_handler(struct work_struct *work)
              else
                      new_state.jpeg = VCN_DPG_STATE__UNPAUSE;

-             adev-&gt;vcn.pause_dpg_mode(adev, 0, &amp;new_state);
+             adev-&gt;vcn.inst[0].pause_dpg_mode(adev, 0, &amp;new_state);
      }

      fences += amdgpu_fence_count_emitted(adev-&gt;jpeg.inst-&gt;ring_dec);
@@ -1872,7 +1872,7 @@ static void vcn_v1_0_ring_begin_use(struct amdgpu_ring *ring)
      struct  amdgpu_device *adev = ring-&gt;adev;
      bool set_clocks = !cancel_delayed_work_sync(&amp;adev-&gt;vcn.inst[0].idle_work);

-     mutex_lock(&amp;adev-&gt;vcn.vcn1_jpeg1_workaround);
+     mutex_lock(&amp;adev-&gt;vcn.inst[0].vcn1_jpeg1_workaround);

      if (amdgpu_fence_wait_empty(ring-&gt;adev-&gt;jpeg.inst-&gt;ring_dec))
              DRM_ERROR(&quot;VCN dec: jpeg dec ring may not be empty\n&quot;);
@@ -1898,7 +1898,7 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring *ring, bool set_clocks)
              struct dpg_pause_state new_state;
              unsigned int fences = 0, i;

-             for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+             for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i)
                      fences += amdgpu_fence_count_emitted(&amp;adev-&gt;vcn.inst-&gt;ring_enc[i]);

              if (fences)
@@ -1916,14 +1916,14 @@ void vcn_v1_0_set_pg_for_begin_use(struct amdgpu_ring *ring, bool set_clocks)
              else if (ring-&gt;funcs-&gt;type == AMDGPU_RING_TYPE_VCN_JPEG)
                      new_state.jpeg = VCN_DPG_STATE__PAUSE;

-             adev-&gt;vcn.pause_dpg_mode(adev, 0, &amp;new_state);
+             adev-&gt;vcn.inst[0].pause_dpg_mode(adev, 0, &amp;new_state);
      }
  }

  void vcn_v1_0_ring_end_use(struct amdgpu_ring *ring)
  {
      schedule_delayed_work(&amp;ring-&gt;adev-&gt;vcn.inst[0].idle_work, VCN_IDLE_TIMEOUT);
-     mutex_unlock(&amp;ring-&gt;adev-&gt;vcn.vcn1_jpeg1_workaround);
+     mutex_unlock(&amp;ring-&gt;adev-&gt;vcn.inst[0].vcn1_jpeg1_workaround);
  }

  static void vcn_v1_0_print_ip_state(struct amdgpu_ip_block *ip_block, struct drm_printer *p)
@@ -2057,11 +2057,11 @@ static int vcn_v1_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
              uint32_t reg = amdgpu_ib_get_value(ib, i);
              uint32_t val = amdgpu_ib_get_value(ib, i + 1);

-             if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.data0, 0)) {
+             if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[0].internal.data0, 0)) {
                      msg_lo = val;
-             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.data1, 0)) {
+             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[0].internal.data1, 0)) {
                      msg_hi = val;
-             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.cmd, 0)) {
+             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[0].internal.cmd, 0)) {
                      r = vcn_v1_0_validate_bo(p, job,
                                               ((u64)msg_hi) &lt;&lt; 32 | msg_lo);
                      if (r)
@@ -2146,7 +2146,7 @@ static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev)
  {
      int i;

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i)
              adev-&gt;vcn.inst-&gt;ring_enc[i].funcs = &amp;vcn_v1_0_enc_ring_vm_funcs;
  }

@@ -2157,7 +2157,7 @@ static const struct amdgpu_irq_src_funcs vcn_v1_0_irq_funcs = {

  static void vcn_v1_0_set_irq_funcs(struct amdgpu_device *adev)
  {
-     adev-&gt;vcn.inst-&gt;irq.num_types = adev-&gt;vcn.num_enc_rings + 2;
+     adev-&gt;vcn.inst-&gt;irq.num_types = adev-&gt;vcn.inst[0].num_enc_rings + 2;
      adev-&gt;vcn.inst-&gt;irq.funcs = &amp;vcn_v1_0_irq_funcs;
  }

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index e55c1f8f260e9..b0a957664250c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -110,9 +110,9 @@ static int vcn_v2_0_early_init(struct amdgpu_ip_block *ip_block)
      struct amdgpu_device *adev = ip_block-&gt;adev;

      if (amdgpu_sriov_vf(adev))
-             adev-&gt;vcn.num_enc_rings = 1;
+             adev-&gt;vcn.inst[0].num_enc_rings = 1;
      else
-             adev-&gt;vcn.num_enc_rings = 2;
+             adev-&gt;vcn.inst[0].num_enc_rings = 2;

      vcn_v2_0_set_dec_ring_funcs(adev);
      vcn_v2_0_set_enc_ring_funcs(adev);
@@ -145,7 +145,7 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
              return r;

      /* VCN ENC TRAP */
-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VCN,
                                    i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE,
                                    &amp;adev-&gt;vcn.inst-&gt;irq);
@@ -175,25 +175,25 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
      if (r)
              return r;

-     adev-&gt;vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
-     adev-&gt;vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
-     adev-&gt;vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
-     adev-&gt;vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
-     adev-&gt;vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
-     adev-&gt;vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;

-     adev-&gt;vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
      adev-&gt;vcn.inst-&gt;external.scratch9 = SOC15_REG_OFFSET(UVD, 0, mmUVD_SCRATCH9);
-     adev-&gt;vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
      adev-&gt;vcn.inst-&gt;external.data0 = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA0);
-     adev-&gt;vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
      adev-&gt;vcn.inst-&gt;external.data1 = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_DATA1);
-     adev-&gt;vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
      adev-&gt;vcn.inst-&gt;external.cmd = SOC15_REG_OFFSET(UVD, 0, mmUVD_GPCOM_VCPU_CMD);
-     adev-&gt;vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
+     adev-&gt;vcn.inst[0].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
      adev-&gt;vcn.inst-&gt;external.nop = SOC15_REG_OFFSET(UVD, 0, mmUVD_NO_OP);

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);

              ring = &amp;adev-&gt;vcn.inst-&gt;ring_enc[i];
@@ -210,7 +210,7 @@ static int vcn_v2_0_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     adev-&gt;vcn.pause_dpg_mode = vcn_v2_0_pause_dpg_mode;
+     adev-&gt;vcn.inst[0].pause_dpg_mode = vcn_v2_0_pause_dpg_mode;

      r = amdgpu_virt_alloc_mm_table(adev);
      if (r)
@@ -292,7 +292,7 @@ static int vcn_v2_0_hw_init(struct amdgpu_ip_block *ip_block)
      if (amdgpu_sriov_vf(adev))
              ring-&gt;sched.ready = false;

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              ring = &amp;adev-&gt;vcn.inst-&gt;ring_enc[i];
              r = amdgpu_ring_test_helper(ring);
              if (r)
@@ -981,7 +981,7 @@ static int vcn_v2_0_start(struct amdgpu_device *adev)
              amdgpu_dpm_enable_vcn(adev, true, 0);

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v2_0_start_dpg_mode(adev, adev-&gt;vcn.indirect_sram);
+             return vcn_v2_0_start_dpg_mode(adev, adev-&gt;vcn.inst-&gt;indirect_sram);

      vcn_v2_0_disable_static_power_gating(adev);

@@ -1421,9 +1421,9 @@ void vcn_v2_0_dec_ring_insert_start(struct amdgpu_ring *ring)
  {
      struct amdgpu_device *adev = ring-&gt;adev;

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data0, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0));
      amdgpu_ring_write(ring, 0);
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));
      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));
  }

@@ -1438,7 +1438,7 @@ void vcn_v2_0_dec_ring_insert_end(struct amdgpu_ring *ring)
  {
      struct amdgpu_device *adev = ring-&gt;adev;

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[0].internal.cmd, 0));
      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_END &lt;&lt; 1));
  }

@@ -1458,7 +1458,7 @@ void vcn_v2_0_dec_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
      WARN_ON(ring-&gt;wptr % 2 || count % 2);

      for (i = 0; i &lt; count / 2; i++) {
-             amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.nop, 0));
+             amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.nop, 0));
              amdgpu_ring_write(ring, 0);
      }
  }
@@ -1479,25 +1479,25 @@ void vcn_v2_0_dec_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
      struct amdgpu_device *adev = ring-&gt;adev;

      WARN_ON(flags &amp; AMDGPU_FENCE_FLAG_64BIT);
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.context_id, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.context_id, 0));
      amdgpu_ring_write(ring, seq);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data0, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0));
      amdgpu_ring_write(ring, addr &amp; 0xffffffff);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data1, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0));
      amdgpu_ring_write(ring, upper_32_bits(addr) &amp; 0xff);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));
      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_FENCE &lt;&lt; 1));

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data0, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0));
      amdgpu_ring_write(ring, 0);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data1, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0));
      amdgpu_ring_write(ring, 0);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));

      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_TRAP &lt;&lt; 1));
  }
@@ -1520,14 +1520,14 @@ void vcn_v2_0_dec_ring_emit_ib(struct amdgpu_ring *ring,
      struct amdgpu_device *adev = ring-&gt;adev;
      unsigned vmid = AMDGPU_JOB_GET_VMID(job);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.ib_vmid, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.ib_vmid, 0));
      amdgpu_ring_write(ring, vmid);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.ib_bar_low, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.ib_bar_low, 0));
      amdgpu_ring_write(ring, lower_32_bits(ib-&gt;gpu_addr));
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.ib_bar_high, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.ib_bar_high, 0));
      amdgpu_ring_write(ring, upper_32_bits(ib-&gt;gpu_addr));
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.ib_size, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.ib_size, 0));
      amdgpu_ring_write(ring, ib-&gt;length_dw);
  }

@@ -1536,16 +1536,16 @@ void vcn_v2_0_dec_ring_emit_reg_wait(struct amdgpu_ring *ring, uint32_t reg,
  {
      struct amdgpu_device *adev = ring-&gt;adev;

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data0, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0));
      amdgpu_ring_write(ring, reg &lt;&lt; 2);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data1, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0));
      amdgpu_ring_write(ring, val);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.gp_scratch8, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.gp_scratch8, 0));
      amdgpu_ring_write(ring, mask);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));

      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_REG_READ_COND_WAIT &lt;&lt; 1));
  }
@@ -1570,13 +1570,13 @@ void vcn_v2_0_dec_ring_emit_wreg(struct amdgpu_ring *ring,
  {
      struct amdgpu_device *adev = ring-&gt;adev;

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data0, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0));
      amdgpu_ring_write(ring, reg &lt;&lt; 2);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.data1, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0));
      amdgpu_ring_write(ring, val);

-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));

      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_WRITE_REG &lt;&lt; 1));
  }
@@ -1777,9 +1777,9 @@ int vcn_v2_0_dec_ring_test_ring(struct amdgpu_ring *ring)
      r = amdgpu_ring_alloc(ring, 4);
      if (r)
              return r;
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.cmd, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0));
      amdgpu_ring_write(ring, VCN_DEC_KMD_CMD | (VCN_DEC_CMD_PACKET_START &lt;&lt; 1));
-     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.internal.scratch9, 0));
+     amdgpu_ring_write(ring, PACKET0(adev-&gt;vcn.inst[ring-&gt;me].internal.scratch9, 0));
      amdgpu_ring_write(ring, 0xDEADBEEF);
      amdgpu_ring_commit(ring);
      for (i = 0; i &lt; adev-&gt;usec_timeout; i++) {
@@ -1863,7 +1863,7 @@ static int vcn_v2_0_start_mmsch(struct amdgpu_device *adev,
      adev-&gt;vcn.inst-&gt;ring_dec.wptr_old = 0;
      vcn_v2_0_dec_ring_set_wptr(&amp;adev-&gt;vcn.inst-&gt;ring_dec);

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i) {
              adev-&gt;vcn.inst-&gt;ring_enc[i].wptr = 0;
              adev-&gt;vcn.inst-&gt;ring_enc[i].wptr_old = 0;
              vcn_v2_0_enc_ring_set_wptr(&amp;adev-&gt;vcn.inst-&gt;ring_enc[i]);
@@ -1989,7 +1989,7 @@ static int vcn_v2_0_start_sriov(struct amdgpu_device *adev)
                      SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE2),
                      AMDGPU_VCN_CONTEXT_SIZE);

-             for (r = 0; r &lt; adev-&gt;vcn.num_enc_rings; ++r) {
+             for (r = 0; r &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++r) {
                      ring = &amp;adev-&gt;vcn.inst-&gt;ring_enc[r];
                      ring-&gt;wptr = 0;
                      MMSCH_V2_0_INSERT_DIRECT_WT(
@@ -2178,7 +2178,7 @@ static void vcn_v2_0_set_enc_ring_funcs(struct amdgpu_device *adev)
  {
      int i;

-     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i)
+     for (i = 0; i &lt; adev-&gt;vcn.inst[0].num_enc_rings; ++i)
              adev-&gt;vcn.inst-&gt;ring_enc[i].funcs = &amp;vcn_v2_0_enc_ring_vm_funcs;
  }

@@ -2189,7 +2189,7 @@ static const struct amdgpu_irq_src_funcs vcn_v2_0_irq_funcs = {

  static void vcn_v2_0_set_irq_funcs(struct amdgpu_device *adev)
  {
-     adev-&gt;vcn.inst-&gt;irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+     adev-&gt;vcn.inst-&gt;irq.num_types = adev-&gt;vcn.inst[0].num_enc_rings + 1;
      adev-&gt;vcn.inst-&gt;irq.funcs = &amp;vcn_v2_0_irq_funcs;
  }

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 1d3780a2d8513..a3bac39e4c9db 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -121,11 +121,13 @@ static int amdgpu_ih_clientid_vcns[] = {
  static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

      if (amdgpu_sriov_vf(adev)) {
              adev-&gt;vcn.num_vcn_inst = 2;
              adev-&gt;vcn.harvest_config = 0;
-             adev-&gt;vcn.num_enc_rings = 1;
+             for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; i++)
+                     adev-&gt;vcn.inst[i].num_enc_rings = 1;
      } else {
              u32 harvest;
              int i;
@@ -134,13 +136,12 @@ static int vcn_v2_5_early_init(struct amdgpu_ip_block *ip_block)
                      harvest = RREG32_SOC15(VCN, i, mmCC_UVD_HARVESTING);
                      if (harvest &amp; CC_UVD_HARVESTING__UVD_DISABLE_MASK)
                              adev-&gt;vcn.harvest_config |= 1 &lt;&lt; i;
+                     adev-&gt;vcn.inst[i].num_enc_rings = 2;
              }
              if (adev-&gt;vcn.harvest_config == (AMDGPU_VCN_HARVEST_VCN0 |
                                      AMDGPU_VCN_HARVEST_VCN1))
                      /* both instances are harvested, disable the block */
                      return -ENOENT;
-
-             adev-&gt;vcn.num_enc_rings = 2;
      }

      vcn_v2_5_set_dec_ring_funcs(adev);
@@ -176,7 +177,7 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;

              /* VCN ENC TRAP */
-             for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+             for (i = 0; i &lt; adev-&gt;vcn.inst[j].num_enc_rings; ++i) {
                      r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_vcns[j],
                              i + VCN_2_0__SRCID__UVD_ENC_GENERAL_PURPOSE, &amp;adev-&gt;vcn.inst[j].irq);
                      if (r)
@@ -205,22 +206,22 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)

              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; j))
                      continue;
-             adev-&gt;vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
-
-             adev-&gt;vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
+
+             adev-&gt;vcn.inst[j].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[j].external.scratch9 = SOC15_REG_OFFSET(VCN, j, mmUVD_SCRATCH9);
-             adev-&gt;vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[j].external.data0 = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_DATA0);
-             adev-&gt;vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[j].external.data1 = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_DATA1);
-             adev-&gt;vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[j].external.cmd = SOC15_REG_OFFSET(VCN, j, mmUVD_GPCOM_VCPU_CMD);
-             adev-&gt;vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[j].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[j].external.nop = SOC15_REG_OFFSET(VCN, j, mmUVD_NO_OP);

              ring = &amp;adev-&gt;vcn.inst[j].ring_dec;
@@ -240,7 +241,7 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
              if (r)
                      return r;

-             for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+             for (i = 0; i &lt; adev-&gt;vcn.inst[j].num_enc_rings; ++i) {
                      enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(i);

                      ring = &amp;adev-&gt;vcn.inst[j].ring_enc[i];
@@ -268,6 +269,9 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)

              if (amdgpu_vcnfw_log)
                      amdgpu_vcn_fwlog_init(&amp;adev-&gt;vcn.inst[i]);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v2_5_pause_dpg_mode;
      }

      if (amdgpu_sriov_vf(adev)) {
@@ -276,9 +280,6 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v2_5_pause_dpg_mode;
-
      r = amdgpu_vcn_ras_sw_init(adev);
      if (r)
              return r;
@@ -369,7 +370,7 @@ static int vcn_v2_5_hw_init(struct amdgpu_ip_block *ip_block)
                      if (r)
                              return r;

-                     for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+                     for (i = 0; i &lt; adev-&gt;vcn.inst[j].num_enc_rings; ++i) {
                              ring = &amp;adev-&gt;vcn.inst[j].ring_enc[i];
                              r = amdgpu_ring_test_helper(ring);
                              if (r)
@@ -1018,7 +1019,7 @@ static int vcn_v2_5_start(struct amdgpu_device *adev, int i)
              amdgpu_dpm_enable_vcn(adev, true, i);

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v2_5_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v2_5_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      /* disable register anti-hang mechanism */
      WREG32_P(SOC15_REG_OFFSET(VCN, i, mmUVD_POWER_STATUS), 0,
@@ -1746,7 +1747,7 @@ static void vcn_v2_5_set_enc_ring_funcs(struct amdgpu_device *adev)
      for (j = 0; j &lt; adev-&gt;vcn.num_vcn_inst; ++j) {
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; j))
                      continue;
-             for (i = 0; i &lt; adev-&gt;vcn.num_enc_rings; ++i) {
+             for (i = 0; i &lt; adev-&gt;vcn.inst[j].num_enc_rings; ++i) {
                      adev-&gt;vcn.inst[j].ring_enc[i].funcs = &amp;vcn_v2_5_enc_ring_vm_funcs;
                      adev-&gt;vcn.inst[j].ring_enc[i].me = j;
              }
@@ -1917,10 +1918,10 @@ static void vcn_v2_5_set_irq_funcs(struct amdgpu_device *adev)
      for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i) {
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;
-             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].irq.funcs = &amp;vcn_v2_5_irq_funcs;

-             adev-&gt;vcn.inst[i].ras_poison_irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].ras_poison_irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].ras_poison_irq.funcs = &amp;vcn_v2_6_ras_irq_funcs;
      }
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index 13b9ed96cccda..fabe4d75a7f6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -127,11 +127,13 @@ static void vcn_v3_0_enc_ring_set_wptr(struct amdgpu_ring *ring);
  static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

      if (amdgpu_sriov_vf(adev)) {
              adev-&gt;vcn.num_vcn_inst = VCN_INSTANCES_SIENNA_CICHLID;
              adev-&gt;vcn.harvest_config = 0;
-             adev-&gt;vcn.num_enc_rings = 1;
+             for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; i++)
+                     adev-&gt;vcn.inst[i].num_enc_rings = 1;

      } else {
              if (adev-&gt;vcn.harvest_config == (AMDGPU_VCN_HARVEST_VCN0 |
@@ -139,11 +141,13 @@ static int vcn_v3_0_early_init(struct amdgpu_ip_block *ip_block)
                      /* both instances are harvested, disable the block */
                      return -ENOENT;

-             if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
-                 IP_VERSION(3, 0, 33))
-                     adev-&gt;vcn.num_enc_rings = 0;
-             else
-                     adev-&gt;vcn.num_enc_rings = 2;
+             for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; i++) {
+                     if (amdgpu_ip_version(adev, UVD_HWIP, 0) ==
+                         IP_VERSION(3, 0, 33))
+                             adev-&gt;vcn.inst[i].num_enc_rings = 0;
+                     else
+                             adev-&gt;vcn.inst[i].num_enc_rings = 2;
+             }
      }

      vcn_v3_0_set_dec_ring_funcs(adev);
@@ -198,22 +202,22 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             adev-&gt;vcn.internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
-             adev-&gt;vcn.internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.context_id = mmUVD_CONTEXT_ID_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.ib_vmid = mmUVD_LMI_RBC_IB_VMID_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.ib_bar_low = mmUVD_LMI_RBC_IB_64BIT_BAR_LOW_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.ib_bar_high = mmUVD_LMI_RBC_IB_64BIT_BAR_HIGH_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.ib_size = mmUVD_RBC_IB_SIZE_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.gp_scratch8 = mmUVD_GP_SCRATCH8_INTERNAL_OFFSET;

-             adev-&gt;vcn.internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.scratch9 = mmUVD_SCRATCH9_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[i].external.scratch9 = SOC15_REG_OFFSET(VCN, i, mmUVD_SCRATCH9);
-             adev-&gt;vcn.internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.data0 = mmUVD_GPCOM_VCPU_DATA0_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[i].external.data0 = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_DATA0);
-             adev-&gt;vcn.internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.data1 = mmUVD_GPCOM_VCPU_DATA1_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[i].external.data1 = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_DATA1);
-             adev-&gt;vcn.internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.cmd = mmUVD_GPCOM_VCPU_CMD_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[i].external.cmd = SOC15_REG_OFFSET(VCN, i, mmUVD_GPCOM_VCPU_CMD);
-             adev-&gt;vcn.internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
+             adev-&gt;vcn.inst[i].internal.nop = mmUVD_NO_OP_INTERNAL_OFFSET;
              adev-&gt;vcn.inst[i].external.nop = SOC15_REG_OFFSET(VCN, i, mmUVD_NO_OP);

              /* VCN DEC TRAP */
@@ -227,7 +231,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
              ring = &amp;adev-&gt;vcn.inst[i].ring_dec;
              ring-&gt;use_doorbell = true;
              if (amdgpu_sriov_vf(adev)) {
-                     ring-&gt;doorbell_index = vcn_doorbell_index + i * (adev-&gt;vcn.num_enc_rings + 1);
+                     ring-&gt;doorbell_index = vcn_doorbell_index + i * (adev-&gt;vcn.inst[i].num_enc_rings + 1);
              } else {
                      ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + 8 * i;
              }
@@ -239,7 +243,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
              if (r)
                      return r;

-             for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j) {
+             for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j) {
                      enum amdgpu_ring_priority_level hw_prio = amdgpu_vcn_get_enc_ring_prio(j);

                      /* VCN ENC TRAP */
@@ -251,7 +255,7 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
                      ring = &amp;adev-&gt;vcn.inst[i].ring_enc[j];
                      ring-&gt;use_doorbell = true;
                      if (amdgpu_sriov_vf(adev)) {
-                             ring-&gt;doorbell_index = vcn_doorbell_index + i * (adev-&gt;vcn.num_enc_rings + 1) + 1 + j;
+                             ring-&gt;doorbell_index = vcn_doorbell_index + i * (adev-&gt;vcn.inst[i].num_enc_rings + 1) + 1 + j;
                      } else {
                              ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + 2 + j + 8 * i;
                      }
@@ -277,6 +281,9 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)

              if (amdgpu_vcnfw_log)
                      amdgpu_vcn_fwlog_init(&amp;adev-&gt;vcn.inst[i]);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v3_0_pause_dpg_mode;
      }

      if (amdgpu_sriov_vf(adev)) {
@@ -284,8 +291,6 @@ static int vcn_v3_0_sw_init(struct amdgpu_ip_block *ip_block)
              if (r)
                      return r;
      }
-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v3_0_pause_dpg_mode;

      /* Allocate memory for VCN IP Dump buffer */
      ptr = kcalloc(adev-&gt;vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
@@ -373,7 +378,7 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
                              ring-&gt;sched.ready = true;
                      }

-                     for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j) {
+                     for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j) {
                              ring = &amp;adev-&gt;vcn.inst[i].ring_enc[j];
                              if (amdgpu_vcn_is_disabled_vcn(adev, VCN_ENCODE_RING, i)) {
                                      ring-&gt;sched.ready = false;
@@ -401,7 +406,7 @@ static int vcn_v3_0_hw_init(struct amdgpu_ip_block *ip_block)
                      if (r)
                              return r;

-                     for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j) {
+                     for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j) {
                              ring = &amp;adev-&gt;vcn.inst[i].ring_enc[j];
                              r = amdgpu_ring_test_helper(ring);
                              if (r)
@@ -1153,7 +1158,7 @@ static int vcn_v3_0_start(struct amdgpu_device *adev, int i)
              amdgpu_dpm_enable_vcn(adev, true, i);

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v3_0_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v3_0_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      /* disable VCN power gating */
      vcn_v3_0_disable_static_power_gating(adev, i);
@@ -1433,7 +1438,7 @@ static int vcn_v3_0_start_sriov(struct amdgpu_device *adev)
                      mmUVD_VCPU_CACHE_SIZE2),
                      AMDGPU_VCN_CONTEXT_SIZE);

-             for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j) {
+             for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j) {
                      ring = &amp;adev-&gt;vcn.inst[i].ring_enc[j];
                      ring-&gt;wptr = 0;
                      rb_addr = ring-&gt;gpu_addr;
@@ -1921,11 +1926,11 @@ static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
              uint32_t reg = amdgpu_ib_get_value(ib, i);
              uint32_t val = amdgpu_ib_get_value(ib, i + 1);

-             if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.data0, 0)) {
+             if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[ring-&gt;me].internal.data0, 0)) {
                      msg_lo = val;
-             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.data1, 0)) {
+             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[ring-&gt;me].internal.data1, 0)) {
                      msg_hi = val;
-             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.internal.cmd, 0) &amp;&amp;
+             } else if (reg == PACKET0(p-&gt;adev-&gt;vcn.inst[ring-&gt;me].internal.cmd, 0) &amp;&amp;
                         val == 0) {
                      r = vcn_v3_0_dec_msg(p, job,
                                           ((u64)msg_hi) &lt;&lt; 32 | msg_lo);
@@ -2089,7 +2094,7 @@ static void vcn_v3_0_set_enc_ring_funcs(struct amdgpu_device *adev)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             for (j = 0; j &lt; adev-&gt;vcn.num_enc_rings; ++j) {
+             for (j = 0; j &lt; adev-&gt;vcn.inst[i].num_enc_rings; ++j) {
                      adev-&gt;vcn.inst[i].ring_enc[j].funcs = &amp;vcn_v3_0_enc_ring_vm_funcs;
                      adev-&gt;vcn.inst[i].ring_enc[j].me = i;
              }
@@ -2255,7 +2260,7 @@ static void vcn_v3_0_set_irq_funcs(struct amdgpu_device *adev)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].irq.funcs = &amp;vcn_v3_0_irq_funcs;
      }
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index dbbeeffc90726..ee87594fafa60 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -129,8 +129,9 @@ static int vcn_v4_0_early_init(struct amdgpu_ip_block *ip_block)
              }
      }

-     /* re-use enc ring as unified ring */
-     adev-&gt;vcn.num_enc_rings = 1;
+     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i)
+             /* re-use enc ring as unified ring */
+             adev-&gt;vcn.inst[i].num_enc_rings = 1;

      vcn_v4_0_set_unified_ring_funcs(adev);
      vcn_v4_0_set_irq_funcs(adev);
@@ -214,7 +215,8 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
              ring = &amp;adev-&gt;vcn.inst[i].ring_enc[0];
              ring-&gt;use_doorbell = true;
              if (amdgpu_sriov_vf(adev))
-                     ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + i * (adev-&gt;vcn.num_enc_rings + 1) + 1;
+                     ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + i *
+                             (adev-&gt;vcn.inst[i].num_enc_rings + 1) + 1;
              else
                      ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) + 2 + 8 * i;
              ring-&gt;vm_hub = AMDGPU_MMHUB0(0);
@@ -226,6 +228,9 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;

              vcn_v4_0_fw_shared_init(adev, i);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v4_0_pause_dpg_mode;
      }

      /* TODO: Add queue reset mask when FW fully supports it */
@@ -238,8 +243,6 @@ static int vcn_v4_0_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v4_0_pause_dpg_mode;

      r = amdgpu_vcn_ras_sw_init(adev);
      if (r)
@@ -1111,7 +1114,7 @@ static int vcn_v4_0_start(struct amdgpu_device *adev, int i)
      fw_shared = adev-&gt;vcn.inst[i].fw_shared.cpu_addr;

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v4_0_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v4_0_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      /* disable VCN power gating */
      vcn_v4_0_disable_static_power_gating(adev, i);
@@ -2172,10 +2175,10 @@ static void vcn_v4_0_set_irq_funcs(struct amdgpu_device *adev)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].irq.funcs = &amp;vcn_v4_0_irq_funcs;

-             adev-&gt;vcn.inst[i].ras_poison_irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].ras_poison_irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].ras_poison_irq.funcs = &amp;vcn_v4_0_ras_irq_funcs;
      }
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 8396ef6831b69..35854e074d142 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -114,9 +114,11 @@ static inline bool vcn_v4_0_3_normalizn_reqd(struct amdgpu_device *adev)
  static int vcn_v4_0_3_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

-     /* re-use enc ring as unified ring */
-     adev-&gt;vcn.num_enc_rings = 1;
+     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i)
+             /* re-use enc ring as unified ring */
+             adev-&gt;vcn.inst[i].num_enc_rings = 1;

      vcn_v4_0_3_set_unified_ring_funcs(adev);
      vcn_v4_0_3_set_irq_funcs(adev);
@@ -194,6 +196,9 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;

              vcn_v4_0_3_fw_shared_init(adev, i);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v4_0_3_pause_dpg_mode;
      }

      /* TODO: Add queue reset mask when FW fully supports it */
@@ -206,9 +211,6 @@ static int vcn_v4_0_3_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v4_0_3_pause_dpg_mode;
-
      if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__VCN)) {
              r = amdgpu_vcn_ras_sw_init(adev);
              if (r) {
@@ -1138,7 +1140,7 @@ static int vcn_v4_0_3_start(struct amdgpu_device *adev, int i)
              amdgpu_dpm_enable_vcn(adev, true, i);

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v4_0_3_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v4_0_3_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      vcn_inst = GET_INST(VCN, i);
      /* set VCN status busy */
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index f6b347fcdb7ed..0700a5f96084c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -115,9 +115,11 @@ static void vcn_v4_0_5_unified_ring_set_wptr(struct amdgpu_ring *ring);
  static int vcn_v4_0_5_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

-     /* re-use enc ring as unified ring */
-     adev-&gt;vcn.num_enc_rings = 1;
+     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i)
+             /* re-use enc ring as unified ring */
+             adev-&gt;vcn.inst[i].num_enc_rings = 1;
      vcn_v4_0_5_set_unified_ring_funcs(adev);
      vcn_v4_0_5_set_irq_funcs(adev);

@@ -173,7 +175,7 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
              ring-&gt;use_doorbell = true;
              if (amdgpu_sriov_vf(adev))
                      ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) +
-                                             i * (adev-&gt;vcn.num_enc_rings + 1) + 1;
+                                             i * (adev-&gt;vcn.inst[i].num_enc_rings + 1) + 1;
              else
                      ring-&gt;doorbell_index = (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1) +
                                              2 + 8 * i;
@@ -198,6 +200,9 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)

              if (amdgpu_vcnfw_log)
                      amdgpu_vcn_fwlog_init(&amp;adev-&gt;vcn.inst[i]);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
      }

      if (amdgpu_sriov_vf(adev)) {
@@ -206,9 +211,6 @@ static int vcn_v4_0_5_sw_init(struct amdgpu_ip_block *ip_block)
                      return r;
      }

-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v4_0_5_pause_dpg_mode;
-
      /* Allocate memory for VCN IP Dump buffer */
      ptr = kcalloc(adev-&gt;vcn.num_vcn_inst * reg_count, sizeof(uint32_t), GFP_KERNEL);
      if (!ptr) {
@@ -1014,7 +1016,7 @@ static int vcn_v4_0_5_start(struct amdgpu_device *adev, int i)
      fw_shared = adev-&gt;vcn.inst[i].fw_shared.cpu_addr;

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v4_0_5_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v4_0_5_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      /* disable VCN power gating */
      vcn_v4_0_5_disable_static_power_gating(adev, i);
@@ -1624,7 +1626,7 @@ static void vcn_v4_0_5_set_irq_funcs(struct amdgpu_device *adev)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].irq.funcs = &amp;vcn_v4_0_5_irq_funcs;
      }
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index c5d59edf3a482..eeb3c9875ad50 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -98,9 +98,11 @@ static void vcn_v5_0_0_unified_ring_set_wptr(struct amdgpu_ring *ring);
  static int vcn_v5_0_0_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

-     /* re-use enc ring as unified ring */
-     adev-&gt;vcn.num_enc_rings = 1;
+     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i)
+             /* re-use enc ring as unified ring */
+             adev-&gt;vcn.inst[i].num_enc_rings = 1;

      vcn_v5_0_0_set_unified_ring_funcs(adev);
      vcn_v5_0_0_set_irq_funcs(adev);
@@ -184,15 +186,15 @@ static int vcn_v5_0_0_sw_init(struct amdgpu_ip_block *ip_block)

              if (amdgpu_vcnfw_log)
                      amdgpu_vcn_fwlog_init(&amp;adev-&gt;vcn.inst[i]);
+
+             if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
+                     adev-&gt;vcn.inst[i].pause_dpg_mode = vcn_v5_0_0_pause_dpg_mode;
      }

      /* TODO: Add queue reset mask when FW fully supports it */
      adev-&gt;vcn.supported_reset =
              amdgpu_get_soft_full_reset_mask(&amp;adev-&gt;vcn.inst[0].ring_enc[0]);

-     if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             adev-&gt;vcn.pause_dpg_mode = vcn_v5_0_0_pause_dpg_mode;
-
      vcn_v5_0_0_alloc_ip_dump(adev);

      r = amdgpu_vcn_sysfs_reset_mask_init(adev);
@@ -791,7 +793,7 @@ static int vcn_v5_0_0_start(struct amdgpu_device *adev, int i)
      fw_shared = adev-&gt;vcn.inst[i].fw_shared.cpu_addr;

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v5_0_0_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v5_0_0_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      /* disable VCN power gating */
      vcn_v5_0_0_disable_static_power_gating(adev, i);
@@ -1367,7 +1369,7 @@ static void vcn_v5_0_0_set_irq_funcs(struct amdgpu_device *adev)
              if (adev-&gt;vcn.harvest_config &amp; (1 &lt;&lt; i))
                      continue;

-             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.num_enc_rings + 1;
+             adev-&gt;vcn.inst[i].irq.num_types = adev-&gt;vcn.inst[i].num_enc_rings + 1;
              adev-&gt;vcn.inst[i].irq.funcs = &amp;vcn_v5_0_0_irq_funcs;
      }
  }
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
index 51a2d70a65c9e..f428d23eb2857 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_1.c
@@ -58,9 +58,11 @@ static void vcn_v5_0_1_unified_ring_set_wptr(struct amdgpu_ring *ring);
  static int vcn_v5_0_1_early_init(struct amdgpu_ip_block *ip_block)
  {
      struct amdgpu_device *adev = ip_block-&gt;adev;
+     int i;

-     /* re-use enc ring as unified ring */
-     adev-&gt;vcn.num_enc_rings = 1;
+     for (i = 0; i &lt; adev-&gt;vcn.num_vcn_inst; ++i)
+             /* re-use enc ring as unified ring */
+             adev-&gt;vcn.inst[i].num_enc_rings = 1;

      vcn_v5_0_1_set_unified_ring_funcs(adev);
      vcn_v5_0_1_set_irq_funcs(adev);
@@ -586,7 +588,7 @@ static int vcn_v5_0_1_start(struct amdgpu_device *adev, int i)
      fw_shared = adev-&gt;vcn.inst[i].fw_shared.cpu_addr;

      if (adev-&gt;pg_flags &amp; AMD_PG_SUPPORT_VCN_DPG)
-             return vcn_v5_0_1_start_dpg_mode(adev, i, adev-&gt;vcn.indirect_sram);
+             return vcn_v5_0_1_start_dpg_mode(adev, i, adev-&gt;vcn.inst[i].indirect_sram);

      vcn_inst = GET_INST(VCN, i);

</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------y8P3v5wNVlNHmmSM0c0jMwBp--
