Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84501BBE19C
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Oct 2025 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF3910E35D;
	Mon,  6 Oct 2025 12:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TUvhNbSn";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7283910E35D
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Oct 2025 12:56:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ts6tXeT/bQohONcERaenwQU1lWB41lsnhnGIN68Q+yrgjceU5yIqE/oNXylzTWxUXh/vR+dWzF/PnY1T3TmB1uyHt9Wmtn93jhiBq+an4zRDPpf3dTwTK8rvpMx9M3PYhyazSd6hBZM7YhrrTXf4ipxjOizNimYfiXhtd8FBdfo56ht+fivsP5jiZlmAATUDq2SGI68i/0CRMhtHmaw33q2h9mQAE6hxVsSiYi0+zhsd4BtOiei0FxfDABvGVCS+pFfq4rb9N35vnpzCEtcbPilzZqHx6Trn/ld1VfZpDpsN9zCLPUE9f30R6s2B+WcoAdUfatpf268vfnWmFGEKTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEMeESAvbc1XVIB+sy6DAISf5igwITqfDnTvFWOgLHM=;
 b=cz+nOHcMLfmJXW7eTyK6V/XOMDx7HL9IO8tgj85nPPHFqzW1Aq0WwEgLpbJGuHgk3yXaOgaU9oH0NVV5ycmo8/XH8NDNMJ0FOpAeVOOlp2Ux6UfwyuK+AaqZ7ALBHvP+dLi9nR35jP7ZXuEpCzoNWstrmktyBupm+cp1EK2dWNY4IN322QsH6G/vr16Olbvv0/CrwZWkHnVG6wZUGcZ8G4ZA2Cfjp21S+CZzJ/tIR99O7LNHkToTTGz/x7kwwe8mkLMJ1RpXzEAZB2po6UM1VvLMS1FqXxqzj9re6zW7Ff+0GZh6GsaWAal9Kcljk9+tqJdMA2lLN/FYkZIiQtDw5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEMeESAvbc1XVIB+sy6DAISf5igwITqfDnTvFWOgLHM=;
 b=TUvhNbSn1/TzYXMDR5Qo3GBQ3g65Uo3w1rcMIRwerc/iTuyzjjz4BfVAIwEPApVakoLA5WSDqim9bmtkLRVKBLaoo8gF4gvRuBlWrBqQQRu6Cq7bJSh9kddWHo+BoFv2PEYfvdU8TTpFj/Q7hYLesBDw+qMmD+XKunTTf1mfeWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by CH0PR12MB8486.namprd12.prod.outlook.com (2603:10b6:610:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 12:55:52 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::36fa:deca:aaeb:75da]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::36fa:deca:aaeb:75da%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 12:55:52 +0000
Message-ID: <2d3aa22f-8771-f4d2-7305-78093c0c3aa6@amd.com>
Date: Mon, 6 Oct 2025 08:55:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdkfd: Fix svm_bo and vram page refcount
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>, Philip Yang
 <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>
References: <20250926210331.17401-1-Philip.Yang@amd.com>
 <87ae1017-5990-4d6e-b42c-7a15f5663281@amd.com>
 <f3349a43-446f-f712-ac61-fa867cd74242@amd.com>
 <674f455e-434d-43d2-8f4f-18f577479ac9@amd.com>
 <aa910171-bc96-d8b1-1bee-65f3ef5d1f46@amd.com>
 <17ee1a4d-69cd-4be9-bd6a-2924e8731db8@amd.com>
From: Philip Yang <yangp@amd.com>
In-Reply-To: <17ee1a4d-69cd-4be9-bd6a-2924e8731db8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0315.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::16) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:EE_|CH0PR12MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ff0697-6ee4-46ea-526b-08de04d7adf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVRYcWhvMFB2WEhLU21lc3QrV1N4NmpzZ0VyeEVFK29RaHp1cEcyZ2dyTEpq?=
 =?utf-8?B?T2ExeFIxWUpsdnpYejQ2cFB1cTBLS0RMZlJqM2ZLeWJnb3RmMEtIWWJHc2c3?=
 =?utf-8?B?b2ZrNHRrY0FaYkhDQ0wyY1k2QUlhLzZ2NUpnSFZvbCtuU1ZGSE5RcjE4ZW1x?=
 =?utf-8?B?dFRXbHEvOFpRemIrVDJCNm8xTjVuS3hSRFdZNWh5TFQ2M2Zpb2lTdEFEWUlX?=
 =?utf-8?B?bi9CUmx2TjMra3JJWFIzcXRHaGRRQmRORWJBM1k1eXRrTDU4c2x6MG1JalNn?=
 =?utf-8?B?MkFxSHoxU1F1Yk1vSHEraktudTNXQ2x3SzAzY21kUlZJcm1UUzZWVndiMmox?=
 =?utf-8?B?U2xPRE9sRVQ0Zm9JcGI4dUlsK3VJMWVzVlFQNThkTzlUTVpRek5qMDJQRzBB?=
 =?utf-8?B?b0Q3eXlpQzFybEpPNHBKZDAvMEtjN1ExaURnUXB3UTJBOURNNXE4SWhXODN1?=
 =?utf-8?B?WmQxN1l0aDBJNkI0bDhiV3c0RCs0TFZNMElUTkpLdlAxQllrR00xMnF4YjRx?=
 =?utf-8?B?WjhYSHdWaE5sci9KS24wMERuMldpV3ZTdlVmSktRWUVCL1FWcml6bTZJWThl?=
 =?utf-8?B?RTNHQWIvZDhsRVpJQXlpaGNsUDNPMEwzWWFKQUd1aHRUNVAzOGpOR3ZBbk50?=
 =?utf-8?B?NnBselROa2hDd0tZQ3pOUThvMzlrRFBLMGZUNGR5V3Z0bDlpa01OVkVoMFFz?=
 =?utf-8?B?YkhIdXNSd2pvMW1wOWF6TW1lVEtSK2ZGVTl3WWlXNjdpei9sN2h3YktGWEg3?=
 =?utf-8?B?dkRyUURNZWF0VHdxVFEydGlVbklKeWo3aTVvYXF5c0d6ZW5zR01TeDZqSFQ5?=
 =?utf-8?B?dU9CaVlvQUJiT0s4cERGRVJJS1RRcXpuZktJdEJ6THZKTDZtcTZJMHNNSllM?=
 =?utf-8?B?UlE0SlVLS3d3Y3NmeUFIdytoNEVwNjlwYTlsMkNsZmhEYTFCTHVKUXdmR1lJ?=
 =?utf-8?B?ZytGZ2dEeW9TekhCUzdaWXJDV05DRUNkcy9McFFoM29ENWpEMkV0QVV1QXZz?=
 =?utf-8?B?ak9hUC9HVW02cE5EQ0hMb0p5TmRzV0QrWUJ4NkRJSUV5QUZrajBkSkc3Y3JG?=
 =?utf-8?B?aEZJQTA2aXJlOU1CN0VIaUdaV1F6WVBWelM4NlZFVFVDaExFejBGUlJ4M0h2?=
 =?utf-8?B?RDJWV1NIZUM3eDVlMzVSejVaUlRqQlBPNERBQ0x1MVRqZGZOKzJrWjZXWTd1?=
 =?utf-8?B?YXkzTWJxUEQrYlprZ3NNT3YrelA5VlhnQ1VGTGJteHZjbUU3LzlCQVFJa2NR?=
 =?utf-8?B?M29ibm56N0lVS0FKTjJHVzVOSFVZVEtGM3JsMGp6K3R6RzlZUHpBcXdMVWJs?=
 =?utf-8?B?dnUzUDBjejM2U0FxUG9rS2VoQWR6aUFoWmNrRjJKRTdTVnVJazhqZjIrRHJq?=
 =?utf-8?B?NWlYcTdheFM5MVNnUHUxKytYeVB0a2QvTlR3YXBveExqWFQxVHBWRDlpTnYy?=
 =?utf-8?B?NUQzUUIyR3pIWFkzak02UHZwQVZ3M01OSkhnMTRTOTVyaDhzeHVaeGZSRFRX?=
 =?utf-8?B?cmxqc3hsc3lTVVk0YnFRUUhTOVBPNHBSdE1vUG1MN3J5OXJYVkRtR3ZVL2tl?=
 =?utf-8?B?b0k3VVJDSGlKTzJmZjRIdVlYRWozS1A5UWZPbk9Yd3ZoVWxrb1JFZUlYdExt?=
 =?utf-8?B?NGxyVHpzZlFvclhIT1psL28yU2tzaElYL0RZRGEvSVRsR1kxT0JqTE51MThD?=
 =?utf-8?B?MWUyOTR2RzNRQWlqR3dLSkRrbUo4QzlYSGxXNTdwaHcrM3JZWWIxakNxdURX?=
 =?utf-8?B?bHJJY3F4UGkrTnNOM25MdWJRM0pBYkFzTEU2UzhwTVgyOUxRb0Y3YzlScFZU?=
 =?utf-8?B?cUl1MkZDQnNSVzF4YVFWcmpRWjUwbTFTQ2k0SkwzZUJpeU9JbVBrQ05yK0pK?=
 =?utf-8?B?QlVGS2NYYmgxZ0syNUNUamczRmRDb1ZuVFVpMXhSQU5XM3BCMW5zZzdtZ0I1?=
 =?utf-8?Q?uSD0NuKmE++L4O+7oHIXsHOwy2eax9nO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVRTHF6emhHd2M5S0FPM2tjVkxtV1J2NkYrT0FMSWxqSldQd2hZNDhQNVFK?=
 =?utf-8?B?MHpNSWVZcGpaeW1zRVBGVFptQXF3NHdlZGJ2U09aVFhFK3RkWmNGbW82R09Z?=
 =?utf-8?B?S2I3SkNHY1FjV2s2dnhiNGJENkpZS1czMWxFQ1g0NW5EU2FpVXpYTjhPVjAz?=
 =?utf-8?B?UDllbWc0UzJZZ256ZFZIL05HbVpGeW8vSGpEZEI4NDQ5ZnhvZktXZk5nTFg2?=
 =?utf-8?B?Wmpsby9yYkpsaHhkS2FMOC9ySkl5OFJ5WGJFM1pvNTNkSlU5cmZ4YzJ4TGd3?=
 =?utf-8?B?K2t0dWxzTkxsRnBtNDRpK1BQVlJpdnRlVFI4K2MvVlVWaVR6MHF0bjlLeFF0?=
 =?utf-8?B?S3g4UllJb2gzVUUwR2JCdENuRkJXQ2sydXE5UFdzbUpJbFpPdCtlSnNMM2po?=
 =?utf-8?B?NU1hTStnblhBZ1Z1RDhJMGJNRUxlTnc2NFVrWlY5ZjlxS0xkQWg1bjJvcVJZ?=
 =?utf-8?B?enNkaDFOMG0vbkFlTTQ1ZUEvaTZZYkxSamNSQy9CM0FteWRzUFVoc2NuRFIy?=
 =?utf-8?B?bGE5WHZyM2IwVlRxeVV0OHdkMHRFMlZ0amtMTTZ3d1pxYXZPelA1Q0Jsa2Fo?=
 =?utf-8?B?dHJoUU42RU8rMUlRSENtWTRPWUNEWTl0eE95Z0FqS0g2aEY2N3h0RWlnbEpE?=
 =?utf-8?B?UUQzcXBmeHQ1Y0FzRFFpTEdxTUs3bjFhQit6eUJGemVkeWtKTFNIY1kreUky?=
 =?utf-8?B?RzlKQktUZmtlUDdjMWVZQlMrNXFYdko5OFRNSngybXNmK2YrMnpwZHI4YWtZ?=
 =?utf-8?B?TnhkWGdLNFQwa3NBSE9vU2xLZkZSMHdTU3VjaEtGTUJNWW1peFVFcm9rR0xx?=
 =?utf-8?B?bTFoc2w1cTJWNXJzelJ5Q1FNdlNnQ04yM1IwMzVzVHFOVWVhcmltcFFiSUpK?=
 =?utf-8?B?SWJ4elVpSVlwSXZRSUFwR0daa0hZSUFtRWk4SEttWVI1ajIxL240Mk9pTXhV?=
 =?utf-8?B?V0ZXbHE2TU9YdnBpdlpYOGtjalhvUmErOVJrekczMEw3SlNpT2RQYjRTUXdq?=
 =?utf-8?B?VjlReGk4SlZJdERyWlZUekJMUHNOdnBYTWZMZUVpREpRelp6d0J2cUVWWGZT?=
 =?utf-8?B?eHYvdUpveXFraDUvc2tWS3BRSzRoa3pSYjVHSzhyQXBNVFZxRkZ4NEZ4bEcy?=
 =?utf-8?B?N0tOYklYd0dRTHRuSmt4K3FGRGhrUWNBN2VZcHoxa3BRNE9UTkkwbDZsTk9k?=
 =?utf-8?B?K2lDRCtSQ3pWSHRLaHMvUlFJNzFiRVJFUVVLZ2hDZytVd3p2VUJkVzBzTE9h?=
 =?utf-8?B?TnoveHlUUm5vdmVPU3h3dE1rbWxBTnRYbHcyVnZBUS9TUTlkMGY5NHE1RHFi?=
 =?utf-8?B?WFo5RGsxbFl4K3ZJRGRGUkswdEFoSVRxR0JQa2VGYkVuclNUTk9RK0NTaFRH?=
 =?utf-8?B?STNPZFdXeFdTeWpRSUI2bVdLY05ZajZHa1NRNGlRcEdNY1pSRTZmUmZQSlNt?=
 =?utf-8?B?ekJpVDZEZ1l2WjQyWS9HcVFPbnppT1hadWVaZHIzMXp5RVhaeEVzRzRCVlVp?=
 =?utf-8?B?Y2xHU3JBZnh6QmRnbmRXUkZtKzd4YXBRcnhhQWxIbUlYc2hIakE1MHdEV2Vm?=
 =?utf-8?B?WkhPRzJabkk3NnZQdXBYQVgxVDhMb1pzUlI1WFdkQ2ptamlZc2hhS2tiSEZ0?=
 =?utf-8?B?elhjZ1Z5OTUxOWpGcGZlUHJtK0dnOTY2TXlZY0NPajlVQ3dVaHpTeWFpU2Zr?=
 =?utf-8?B?c3F2ajlMZVRaNmhpQXZ4OURkWFBiK25wcXZXUDJyTXdZWGF2ODExL3NvR1Mx?=
 =?utf-8?B?VEY2N0dtQlArVVV2M0ExalovbnVUZnFLWThkOUtNeXNZeXdxMy92ZU9TUGoz?=
 =?utf-8?B?SWhFbXIxc3RFVU9EbjZ3Q1JyRllvS04wZmNSdWtUU0VHSnhrRmtaRll5cmNO?=
 =?utf-8?B?dGhiazN5MHNuTVZqc3h0T05tNDN5bXFpQndaYWdxOTJNRlM2UVVPT011Q1c5?=
 =?utf-8?B?eXIzQThnb2VCL0RrSFhSZkNRZG55UzRKR1lpY0tOcXdBc2FDQVh0QmV2a3E1?=
 =?utf-8?B?S21UQThXMGU4eWdoV3dPVkM1TlAvNWs3SURBamVEWVBHSnBUQVM5UzhwaTRR?=
 =?utf-8?B?ZDM0NWpjbnh5UytJTnAvK1VLRU5BNlYrWVRSdEI4cDNEVEx0dWczUnIzT0sz?=
 =?utf-8?Q?s4vo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ff0697-6ee4-46ea-526b-08de04d7adf2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 12:55:51.8491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJc3rEIHqFam5BxpMOJFfT26dfafrb1x7BTR7c7uGtVssjeACTzc2PgC5xDdhwpb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8486
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


On 2025-10-03 18:16, Felix Kuehling wrote:
> [+Linux MM and HMM maintainers]
>
> Please see below my question about the safety of using 
> zone_device_page_init.
>
> On 2025-10-03 18:02, Philip Yang wrote:
>>
>> On 2025-10-03 17:46, Felix Kuehling wrote:
>>>
>>> On 2025-10-03 17:18, Philip Yang wrote:
>>>>
>>>> On 2025-10-03 17:05, Felix Kuehling wrote:
>>>>> On 2025-09-26 17:03, Philip Yang wrote:
>>>>>> zone_device_page_init uses set_page_count to set vram page 
>>>>>> refcount to
>>>>>> 1, there is race if step 2 happens between step 1 and 3.
>>>>>>
>>>>>> 1. CPU page fault handler get vram page, migrate the vram page to
>>>>>> system page
>>>>>> 2. GPU page fault migrate to the vram page, set page refcount to 1
>>>>>> 3. CPU page fault handler put vram page, the vram page refcount is
>>>>>> 0 and reduce the vram_bo refcount
>>>>>> 4. vram_bo refcount is 1 off because the vram page is still used.
>>>>>>
>>>>>> Afterwards, this causes use-after-free bug and page refcount 
>>>>>> warning.
>>>>>
>>>>> This implies that migration to RAM and to VRAM of the same range 
>>>>> are happening at the same time. Isn't that a bigger problem? It 
>>>>> means someone doing a migration is not holding the 
>>>>> prange->migrate_mutex.
>>>>
>>>> Migration hold prange->migrate_mutex so we don't have migration to 
>>>> RAM and VRAM of same range at same time, the issue is in step 3, 
>>>> CPU page fault handler do_swap_page put_page after 
>>>> pgmap->ops->migrate_to_ram() returns and during migate_to_vram.
>>>
>>> That's the part I don't understand. The CPU page fault handler 
>>> (svm_migrate_to_ram) is holding prange->migrate_mutex until the very 
>>> end. Where do we have a put_page for a zone_device page outside the 
>>> prange->migrate_mutex? Do you have a backtrace?
>> do_swap_page() {
>>    .......
>>         } else if (is_device_private_entry(entry)) {
>>    ........
>>
>>             /*
>>              * Get a page reference while we know the page can't be
>>              * freed.
>>              */
>>             if (trylock_page(vmf->page)) {
>>                 struct dev_pagemap *pgmap;
>>
>>                 get_page(vmf->page);
>>                 pte_unmap_unlock(vmf->pte, vmf->ptl);
>>                 pgmap = page_pgmap(vmf->page);
>>                 ret = pgmap->ops->migrate_to_ram(vmf);
>>                 unlock_page(vmf->page);
>>                 put_page(vmf->page);
>>
>> This put_page reduce the vram page refcount to zero if 
>> migrate_to_vram -> svm_migrate_get_vram_page already call 
>> zone_device_page_init set page refcount to 1.
>>
>> put_page must be after unlock_page as put_page may free the page, 
>> svm_migrate_get_vram_page can lock the page, but page refcount 
>> becomes 0.
>
> OK. Then you must have hit the 
> WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref)) in that 
> function.
This warning is for pgmap percpu_refcount, not for page refcount, I 
didn't see this warning.
>
> It sounds like zone_device_page_init is just unsafe to use in general. 
> It assumes that pages have a 0 refcount. But I don't see a good way 
> for drivers to guarantee that, because they are not in control of when 
> the page refcounts for their zone-device pages get decremented.

Seems this issue is caused by the change in commit 1afaeb8293c9 
"mm/migrate: Trylock device page in do_swap_page", I am not sure if the 
same fix is needed in several drivers calling zone_device_page_init.

Regards,

Philip

>
> Regards,
>   Felix
>
>
>>
>> Regards,
>>
>> Philip
>>
>>>
>>> Regards,
>>>   Felix
>>>
>>>
>>>>
>>>> Regards,
>>>>
>>>> Philip
>>>>
>>>>>
>>>>> Regards,
>>>>>   Felix
>>>>>
>>>>>
>>>>>>
>>>>>> zone_device_page_init should not use in page migration, change to
>>>>>> get_page fix the race bug.
>>>>>>
>>>>>> Add WARN_ONCE to report this issue early because the refcount bug is
>>>>>> hard to investigate.
>>>>>>
>>>>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 14 +++++++++++++-
>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c 
>>>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>>> index d10c6673f4de..15ab2db4af1d 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>>>>>> @@ -217,7 +217,8 @@ svm_migrate_get_vram_page(struct svm_range 
>>>>>> *prange, unsigned long pfn)
>>>>>>       page = pfn_to_page(pfn);
>>>>>>       svm_range_bo_ref(prange->svm_bo);
>>>>>>       page->zone_device_data = prange->svm_bo;
>>>>>> -    zone_device_page_init(page);
>>>>>> +    get_page(page);
>>>>>> +    lock_page(page);
>>>>>>   }
>>>>>>     static void
>>>>>> @@ -552,6 +553,17 @@ svm_migrate_ram_to_vram(struct svm_range 
>>>>>> *prange, uint32_t best_loc,
>>>>>>       if (mpages) {
>>>>>>           prange->actual_loc = best_loc;
>>>>>>           prange->vram_pages += mpages;
>>>>>> +        /*
>>>>>> +         * To guarent we hold correct page refcount for all 
>>>>>> prange vram
>>>>>> +         * pages and svm_bo refcount.
>>>>>> +         * After prange migrated to VRAM, each vram page 
>>>>>> refcount hold
>>>>>> +         * one svm_bo refcount, and vram node hold one refcount.
>>>>>> +         * After page migrated to system memory, vram page refcount
>>>>>> +         * reduced to 0, svm_migrate_page_free reduce svm_bo 
>>>>>> refcount.
>>>>>> +         * svm_range_vram_node_free will free the svm_bo.
>>>>>> +         */
>>>>>> +        WARN_ONCE(prange->vram_pages == 
>>>>>> kref_read(&prange->svm_bo->kref),
>>>>>> +              "svm_bo refcount leaking\n");
>>>>>>       } else if (!prange->actual_loc) {
>>>>>>           /* if no page migrated and all pages from prange are at
>>>>>>            * sys ram drop svm_bo got from svm_range_vram_node_new
