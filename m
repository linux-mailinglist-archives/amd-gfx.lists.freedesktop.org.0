Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHckBbt36GmVKgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 09:24:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0C9442EA7
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 09:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9BB882D0;
	Wed, 22 Apr 2026 07:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sPJ8fFex";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2097882D0
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2026 07:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlhDz5lPLCT/z/JLlC/MABDNbc/FpMGVrHgAzJIcJLHaVngXy5CiC7NUv5nL6eqxRq6KtTUIJJTpzmR8xxB2vD499oaRyf92G3zDLQsxwceJBeXOW2mUpzGjf1JziWm+/b4og9/PemnXwSY87gu+5LMlQw4xKexmC8Z65Oh8vacc9ebifIfv6PWskdiPXgkrWgEWiBzqsk2xvi0FPt7J0QANimJUrAV/ikqH+5tzaYgzl0A8fRo+le7Dsl589TI69dTuSK6HieZKQhHI24ROydlIfpiItgxINFzeZ2SKWQo2sKsoUZpVijHtQR/ZCJmisPnq89CIXEJlZqkKYu8V3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/xcJ2XkEGuLvE64XkrfxfGEXkubQNMUkKK8AM7kQSM=;
 b=R5OvLA9LtulEKQgAkj7IzaBcv/rya6GcH6CuOAoNKeomT0UAEf2RJe895Os6RfI841uRb8+BlwF/gzG03NN3FjIZCvD+xks4+oGw9WsZPWwIsD/QXZ2L9o9ctelsUriq3CA8wXr3ttpJ1IzH99bFJnQNfDObtxRWDzwbwxt4dhi9umC8yypnIS7TMKN5qbuW2YmsWerjOiWVo3paFL1pV11+xBXGQw0wbQAdxPBrA1n2fulyt2tHNRyaQsWZ6/mr62PVtEKWwheTLQg0uUYOEnDX/9eCg6y4izbbJs7PrgkMX33uCpGXtrXFzU3RyEUTWgJKTWOmX37/QS0eP6yc4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/xcJ2XkEGuLvE64XkrfxfGEXkubQNMUkKK8AM7kQSM=;
 b=sPJ8fFexY4uyaJeOGRylIm0ZPOuok4KA+odcOkvRjE+wpCQ4LcbVZwPb3i5USklm4KSPCkusnQCHF+8wBppgMCIe1Nla9DJqGOUyjn1v9ucf+cekv+ZMze8WCPK4pzkrAKieANN275VQJC57BrrwyACzyI5hAcsLSqS8qa9JASE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.18; Wed, 22 Apr
 2026 07:24:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 07:24:35 +0000
Message-ID: <e0a6c051-8acb-435c-9344-7a4f96aca2f1@amd.com>
Date: Wed, 22 Apr 2026 09:24:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/amdgpu: remove deadlocks from
 amdgpu_userq_pre_reset
To: "Khatri, Sunil" <sukhatri@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 alexander.deucher@amd.com, Prike.Liang@amd.com, amd-gfx@lists.freedesktop.org
References: <20260421125513.4545-1-christian.koenig@amd.com>
 <20260421125513.4545-2-christian.koenig@amd.com>
 <e0761bb4-6cb5-40ec-b5f4-f57c6ef636e2@amd.com>
 <e70355c6-778b-46d9-bf29-cbbb4adc9d0f@amd.com>
 <ed622c66-3d8d-4bd0-8b61-21dc17255162@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ed622c66-3d8d-4bd0-8b61-21dc17255162@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: e6dc1b42-c5bf-4abe-0d4d-08dea0403480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003|11006099003;
X-Microsoft-Antispam-Message-Info: JIqahJaJYNSvhJQsEfNPfDLVGiG8nbrk9PveK+2O92HP0zl1fYwkcPwojwcSINOtYSoxAYb+HGn648zY43DKn/6l2kwDeryXXq3Yv39+ngA1FxLpw5rgYXDf4hc97kO7DZS2msIWNRECj4oseWdiP0CjD5BwA3enxP8HX0jufB36uxYh61lwO2EmO4arVo2zJZI+6Xd9kt0QbzGbREwMI2C3zMbvL1Uvsc8px5dfvt+TmO/Nwipl2rSC8WXLi28I9LvZeOGg8HLaZJAPWnzscEqb012F6hNPe9J/OrzN/GkK/X8PZRqEY0WD+0vTw5ouN7ygjokiCl7gwvDQzAkVeFeB3yky3PEwF/hLVIXCOtL7ptszu0oy9mlQ8GpKqpf3UHYImiHFeWAP5lWoMi9A++d8rSB69h7kpy0oQb00fzo6c+A6w5LWs/4K3LP9XR0H0DlntRz3zIMdHh2ol9PxjrHaPEofyHC19IVSK40B2cASt+jZpkDGSCrNH5sGfV1e6Odg2MxwTNiJ2a/P4cYmjDNtn177rMnce/G1uaPDLoV10z2AMdYktnXS7PlFKZYIaDr1aOefaAUUKeUYqRQAj7wneFRBIgu4i+h7DnXUrgrwnyKSmvRkB9v1LbDTEgYhsN9fbLPR5MxkiJYtyc1mms/NY0PRU9NmLkxY8f/3p0+S7sU1Nfuqbo++q17lwu+CYDVbwQ8fyvFW3SBikPuNmHDX0tuM7t5vkbaLg/I6AHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003)(11006099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktwVThaNFI5SWExaFdRdGVBQ0cxYktzUFFSZlo5MkEza0dOZ01vSURCMFc2?=
 =?utf-8?B?V2RLSC90cGVMaEV4T1dVTDVRUG9qWG1HUTZ1SkhOcURRbnpqbTJFdlBjWG1x?=
 =?utf-8?B?TzJpbTFYV3JMOTJTZURYakMxN2x0QUJXRVJSMUNVZ2c4a0pHSllJOEgwaVhS?=
 =?utf-8?B?LzFBbisvUkxwSFZuWHhrSmxIRERacFpYa2NrNjdvTzIxaUllT2oxV2RFTmFE?=
 =?utf-8?B?ck9GK3VSVE5iamFQR0NQem05anpuUTNrRGtzS1BQNldpVGpHRjlTbVMrZFlU?=
 =?utf-8?B?b05hVkhpV2lsTkxKdjZSL1l1dEtIbUYwY0NkbzJhb1hwcmo3RE9tcXNQYUEz?=
 =?utf-8?B?dEtEMit1M3doaGtiQ3BRMzFkUUwrVjBDVkZvQUlwYURCdjM4QWFBZEpMemxC?=
 =?utf-8?B?Yks5TFo1czNKWEJJeE1tUDZPVllUTStYODdOZWlreGxxRFpYeTU1Y1V3Vy96?=
 =?utf-8?B?bzBKd1VjVUxTclp4K1pKVmNlTmhWNnFsR0JuS2ZiQWMrN3ZkQ2kzMVFNZWUr?=
 =?utf-8?B?cmhNRGlWM0NlVXhXSXlqNUN0bzdrTVBWczM2ZURLcWN5TmJwRXRjUHB4clVl?=
 =?utf-8?B?Wi9NNExzNXpyUGdDL0Y3VXFZYTdTMnVtVUpsRjV4TGN3TEFXQXU0UnIxNmJh?=
 =?utf-8?B?RUdwcGRyMys5dnk3anlMdTZScHZFNTRTWHNXNFMxT0FmckpkeWlzYzFTWCtx?=
 =?utf-8?B?REdKNkJ4QkhIakN5MUg3Z2FxVzVuV0VPRm43aFhTUE91Sk11dlZyZ1BZZzRX?=
 =?utf-8?B?TTBPNkI3SlNKTDFhSk9HSUVhSkhGS3BRendhUzlTSWhLVFpORDJ6dlU3eTNK?=
 =?utf-8?B?Y01TejZPckR4aWE3Y3dwUGtKckN1aUg4bkxjMlZNMWdKYUcyMG1GV2dLMDlP?=
 =?utf-8?B?VFpqdzV1TUxBVUlxOG1LL3lJZkZ6alNSWkVJMk92cFBhTDg2NWRtMEIrVW5R?=
 =?utf-8?B?cHlKam1JejlFRGUyR3ZOdHFrZFV3WXhZaE9SOVFFMzVkQzIxaVlzRmt1MlFZ?=
 =?utf-8?B?bFZGTFEvbU5FcmgxM2g0VTJsRStMTzFPQVlEK1JSZVVqYXpXMjZWSUkrMlJH?=
 =?utf-8?B?RlZxRzZaQ0dLeVora2xuNkZnWThSMFJiYkVmblhPOUtHZEwxOXM0TDF4TUhG?=
 =?utf-8?B?VEtpQUMwL2UwRHNUc0drWG1WN1RLaHY3QXpZYS9CNWFGaTVFVXVUMzI4c2tE?=
 =?utf-8?B?R0ZYQmZKcmtvbDJFbnhTRkxaWE1qL0VGTFhQdmF4bnUwNWlRYWdjaXBhU3N1?=
 =?utf-8?B?RUJuUWd3eElJTmxIRWFIQnVMZjRIMzFSUHp0MlNrZEcrNmIraG52MU03UFNW?=
 =?utf-8?B?OUQ2Wjk3UTJSOERnZGhjMWkvbm9hSWU4d3NsQ3J1eGFpK2ZpbHJFVDNpUGEz?=
 =?utf-8?B?L013YTRiSGdRZ0daMDk0QTU4L0JUSWkwT1NZSXArSUpFNVhRYVlLQlZobFdq?=
 =?utf-8?B?ZitqbHNRNUphU2dPQXAxNXFGOWdIUVVFRFZnZUVaSjFFcE9xRi9ITVVlZ2Zn?=
 =?utf-8?B?aGwweHU2VFlpcWxzSnR5TnFnVEovNmMvWFo1QW5lR1hQVFpDODNxeGI0aW8z?=
 =?utf-8?B?N2hZZ3N5aVlzWUFjWDRmTVNvOE52RmJua2dxb2ZiRFBsaWVkUkNpL3Yzbkc4?=
 =?utf-8?B?VGZwYzRjcnVKdktOOFhzbWRrY1lKc05sRnRoUDNLVFlpcVlDMkpZekxURDJp?=
 =?utf-8?B?R2VSclk1VVNFSFVFZlc1dlFVY1JmbmJteHVtL1lRWWlOTUJZWkZ1TVk5Rnhp?=
 =?utf-8?B?dWFFMFIyckx6am9IcDhPaEl5VGl4VjJFZnhWUnRyWCsweHFZd0ozME9KeHEw?=
 =?utf-8?B?VkxFUzJBNngyaWlsb2NQeDhmNmFyVktTalhsTkdYdmgvZlZURVc3bk80ZnhX?=
 =?utf-8?B?Rk9USkZMcnVhSGlLSldvNCtuNDViWHg2b0VrYzNNWGJFZ1NhT1NNM01GRnZO?=
 =?utf-8?B?emdsUXNWRzM1bW1qMzQ1enJOaUtHQWRpMDdZMENHNWF3eTNVZkxXYmFwbVV3?=
 =?utf-8?B?clhNczBwdGtJUjBFOGJYa2FYOEN4NUZaUjVCUjR5SG9UWi9QRDVLYmlwc0dy?=
 =?utf-8?B?eWlJL01MKzBTZ284ZDM5Z0tmMElMeWQ2TDNIZTlBZWtFRHlKNmVhZ0x4aGpl?=
 =?utf-8?B?aFlmZStBNEFTLzR1VEkvVStxT0hXbXlDcDdlUm94L21HbTZzNXlBT2QrL0Rj?=
 =?utf-8?B?SklnOFBLcHpPR3RHM0V3TXptcmpBSUtSUHN2aUVBS20vZzluWFo2SGJaVVJi?=
 =?utf-8?B?WjIyY1grTzRyVEFvUEtxOFcrNXNNaVozLzZCTXo4blFOMElUNmxzZ0lPZzFI?=
 =?utf-8?Q?1IrxayPzTHN4bKf6St?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6dc1b42-c5bf-4abe-0d4d-08dea0403480
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 07:24:35.4859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oYOF2h5EZyCAPQNgO7bOFA/D+FVs5VFzO0oj44ydpx5dRSWtB/LiGcRoOrvAkrKq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sukhatri@amd.com,m:ckoenig.leichtzumerken@gmail.com,m:alexander.deucher@amd.com,m:Prike.Liang@amd.com,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: 6F0C9442EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 09:19, Khatri, Sunil wrote:
> 
> On 22-04-2026 12:43 pm, Christian König wrote:
>> On 4/22/26 06:53, Khatri, Sunil wrote:
>>> On 21-04-2026 06:25 pm, Christian König wrote:
>>>> The purpose of a GPU reset is to make sure that fence can be signaled
>>>> again and the signal and resume workers can make progress again.
>>>>
>>>> So waiting for the resume worker or any fence in the GPU reset path is
>>>> just utterly nonsense.
>>>>
>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 26 +++++++++++------------
>>>>  1 file changed, 12 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>> index 8f48520cb822..b632bc3c952b 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>>>> @@ -1496,23 +1496,21 @@ void amdgpu_userq_pre_reset(struct amdgpu_device *adev)
>>>>  {
>>>>  	const struct amdgpu_userq_funcs *userq_funcs;
>>>>  	struct amdgpu_usermode_queue *queue;
>>>> -	struct amdgpu_userq_mgr *uqm;
>>>>  	unsigned long queue_id;
>>>>  
>>>> +	/* TODO: We probably need a new lock for the queue state */
>>>>  	xa_for_each(&adev->userq_doorbell_xa, queue_id, queue) {
>>>> -		uqm = queue->userq_mgr;
>>>> -		cancel_delayed_work_sync(&uqm->resume_work);
>>>> -		if (queue->state == AMDGPU_USERQ_STATE_MAPPED) {
>>>> -			amdgpu_userq_wait_for_last_fence(queue);
>>>> -			userq_funcs = adev->userq_funcs[queue->queue_type];
>>>> -			userq_funcs->unmap(queue);
>>>> -			/* just mark all queues as hung at this point.
>>>> -			 * if unmap succeeds, we could map again
>>>> -			 * in amdgpu_userq_post_reset() if vram is not lost
>>>> -			 */
>>>> -			queue->state = AMDGPU_USERQ_STATE_HUNG;
>>>> -			amdgpu_userq_fence_driver_force_completion(queue);
>>>> -		}
>>>> +		if (queue->state != AMDGPU_USERQ_STATE_MAPPED)
>>>> +			continue;
>>> If the queue is in prempt state and if at that time we are in this function we should still be doing force completion for work in those queue else the waiters will keep waiting.
>>>
>>>> +
>>>> +		userq_funcs = adev->userq_funcs[queue->queue_type];
>>>> +		userq_funcs->unmap(queue);
>>> GPU is already hung if we are here and observation is we are unable to unmap as we have tried to reset via the fw and that failed to atleast thats what i have seen. Could we skip unmap ???
>>>> +		/* just mark all queues as hung at this point.
>>>> +		 * if unmap succeeds, we could map again
>>>> +		 * in amdgpu_userq_post_reset() if vram is not lost
>>>> +		 */
>>>> +		queue->state = AMDGPU_USERQ_STATE_HUNG;
>>>> +		amdgpu_userq_fence_driver_force_completion(queue);
>>> we should be calling completion irrespective of queue state here. The GPU atleast the queue is hung and fw has failed to reset. We have to release the fences by foce completion.
>> Yeah, I agree completely with those require comments I has similar thoughts while going over this.
>>
>> I'm only driven by bugs here and my goal with the patch was to remove the obvious deadlock in the function.
>>
>> Somebody needs to sit down and go over the whole handling for GPU resets and make sure it plays nicely with user queues.
>>
>> Regards,
>> Christian.
> For now this is what i think we could do.
> In the loop: If a queue is mapped -> try unmap
> 
> Irrespective of the queue state:
> Set queue to HUNG and call amdgpu_userq_fence_driver_force_completion

How do we protect the queue state? We don't have a lock for that and in a GPU reset you can't grab things like the userq_lock.

Could we call unmap while holding the doorbell XA lock or would that clash with something?

Regards,
Christian.

> 
> Regards
> Sunil Khatri 
>>> Regards
>>> Sunil Khatri
>>>
>>>>  	}
>>>>  }
>>>>  

