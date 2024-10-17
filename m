Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D43629A22BB
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Oct 2024 14:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7397510E806;
	Thu, 17 Oct 2024 12:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jlvCJhXd";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7D210E806
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Oct 2024 12:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niEiK4/wVyFSgVDxvooZ1XMPGTkxgl+XjKfGpiOA974TN3V8m1HQyBdKrLoKJI4bYCdnErSfkPdqO6ecqBwCnYgxuJiImnulmo5TNEEJS5hZfO6vI6gZKthH7IupsGuHkJlb8NDxUcsqYUMjl81Tr4uddZe2yRnllToUeBdYTmojewDFmZ1/eoNC/Tr8KR4BmsrymjpMEGO5oD110kVOdzoifZ8ZPI9j3L5rtOW84NTZCPxZBFQ/73KljbyhpR0Wod/Vp7ZMfGU1e4GqlM6jq8wBsk5N5D/cP69/OZPXgDTPj/phZLSuzkXr+YgJ3cM1l0+BL9f1UAT4vjE+McpPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvP67KPm9BEv7lZfBr3T5lztaP72TlkYR8/Y0kJgLzw=;
 b=UEdnzyPAFyxuPjpn8+7AxeS2/erLzK84RbzcDU5mmRzx91Asg2mqMIL4wmVEoAct+bJaCbl8HTbavLDYviAWl6Su4cZRjzcN6D9tYuFJCEz/38ghdQe/TW8dhCX//At8MOX/HYx1Y04nR2ElhNkIG0V0MVPz60M+3PI4UT8uzgFBgM6irMNi3Ld06Am0LoMBpiL/8uq5qI8BzzJFhZ5Vjf60WFEvYwSrk9cQei/Q/Ofame7Gyx05L2h31y7+MQMSHTOMkYRGiuAvlRXn2vRwPn3skcMQ2RJ0jV9u5z8t5IA/aqZsVNl30iFCV2o+sXUkoBsWNjW5q3dGb6MXjHQG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvP67KPm9BEv7lZfBr3T5lztaP72TlkYR8/Y0kJgLzw=;
 b=jlvCJhXd/MmzM7PzdkVyqlRl5P+upcYPQXULeOTLcSBkc5TDE09JDpimfAKDXb1QIef5PN05PA2/0QmpQeXG+R1XxtXzHJbOi2Hz20qHifky3IUQn8iSUuyOvY3vzYdank2nT8U3noGKrqTHylvViL3ab+yG842VZOSep0UkFxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CY8PR12MB8338.namprd12.prod.outlook.com (2603:10b6:930:7b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 12:49:09 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 12:49:09 +0000
Subject: Re: [PATCH v4 14/15] drm/amdgpu: clean unused functions of
 amd_ip_funcs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
References: <20241017100615.1492144-1-sunil.khatri@amd.com>
 <20241017100615.1492144-15-sunil.khatri@amd.com>
 <5afdd079-d840-4718-a6a1-65a82c59e47f@gmail.com>
From: "Khatri, Sunil" <sunil.khatri@amd.com>
Message-ID: <911ebfcf-bac5-92b7-9d45-ace7315ffea8@amd.com>
Date: Thu, 17 Oct 2024 18:19:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <5afdd079-d840-4718-a6a1-65a82c59e47f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PN3PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::23) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|CY8PR12MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 9887cd5c-952a-41ab-227d-08dceeaa17cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW5DaHJ4S0F6SXBXdytzR1pSQTZ1MUlnVjFEN1FmZWFQTmN1aVJIWko0dFg4?=
 =?utf-8?B?MEI4YkVHdkE1YkVJM3VLTkd4eitzQ2k1NERlVnJaQnQvYSthMTdmblFGZTdQ?=
 =?utf-8?B?TlZHZnlyV3huUjViLy92VEF6TDZaSDZRT2loS053dHNIQ0w4b001V01tbzNL?=
 =?utf-8?B?d1RyNGVpdTFkM3ROcXlkUUdtYld1a2NVMGxDVUxrT0JYU0hZZjdib0dzeVZW?=
 =?utf-8?B?UFJsZlZQSDQreW16L0RtNlVLZWlCalFkWkwrM3JQOGE5dit4bkNISkRlRDAr?=
 =?utf-8?B?MzhhZFpZazBmeThqYXJjb3g3ZlFLQWhNdE5RTU5VM0JKaUgyZHlQR0t0SUdD?=
 =?utf-8?B?YUVrQkczSTJMMHZlWVpnaDlINjFVYVczMlVvNnRNRjBaNVJtU3QvSXkzdi9k?=
 =?utf-8?B?cDl1VmdRbUFzaTJzZmlQV1Y3RHlSc01iWGx3by8wQkRKOExuVmxBeUpDVTI4?=
 =?utf-8?B?NEtaekZrSHRZNHNKRnVBTk9tSzJOcnF5NE1KdWp6RE83Z09xNU5yT1FsQjZp?=
 =?utf-8?B?bTQ5R08wQmVrM2JZamt2aURwNkQ4ZTFGdnBZTFRhTWZuckRGbmFsRzdKaHBp?=
 =?utf-8?B?WlFMNWNTOXhDYm9iZmZtbDJzWkkvaHA1bkxkZjhoTURMTExaWnBIeGNCVS9S?=
 =?utf-8?B?S3dISWxyWXlncWFWdjdETjlkcXNJQTFyY0M5U3ZaUUZrY3Z0aGV3QTM1SnNJ?=
 =?utf-8?B?UXBtZkNPVWplZkk2NEJiY1F6UkhremJ5WEZtWmkxZ3c1Vi9BOThDUDVRRFo5?=
 =?utf-8?B?MytsdytUV3FVQVMxYlJqdm9wbG5hQlJ3dGdzUTdsNXhjT0xxMnptZnVZUlNy?=
 =?utf-8?B?RzNreC9Tbjc5bCt5UFl1dHl2YXV1dnhYS0VGZllscDNKR3dMSTU1dzYzaWsr?=
 =?utf-8?B?N1VoM0tHVTJGSkUzZVI4K3VyRXNNNDFnSGxjRk9RQWt5Qi9TeVhWTmJ0ZGFZ?=
 =?utf-8?B?MmppSnJaSzJpaVlyVG52dEowN3Uza0JzN25jUGJaV0I5eGxGc0FSWDMxcE1V?=
 =?utf-8?B?UXB6TGkwd2FUc2FzNVJjNVFuZkI2QnhFaytqNU5CNFFOQityT0xtMDF4TjFp?=
 =?utf-8?B?dHRYV3UxcVQ3SGtDb2lnMnJidHZIZFU5S2FKek5JcjVHL0R2b3dXd1lNSDh5?=
 =?utf-8?B?ZWVvQmlXU0V4WG9VQ3A1bzhaUElSS3dsYUJ6UWR0cXRUTlRrRi9ZdzFPSTBZ?=
 =?utf-8?B?b3dJeHQvK3JraWlaUGQrd01iMTEwNUloV05jZ25ldnZvRW9aMnljMFg2dm5j?=
 =?utf-8?B?R05sdzUyUDRJT3ZieXZldVRVaXhtT3FJLy9NUEVtWUkrL2tpUnI0WmJZNUlB?=
 =?utf-8?B?b3AvQzZlbXBaSnNCTWdDdUVqMm1INjlDWnZGQVRudk4vdDVySTRTQkxySFVL?=
 =?utf-8?B?QzJFZzlGWFlVekllREliTUdwMk1va0ZqT2dDd25JZFdPbUEwZzYvZy9YM01M?=
 =?utf-8?B?c0NmS0xuckxuclh6U2ZrWVlWRmZ0SmNGeFBiWis3VG9CSkdKTWpQUGNrSExG?=
 =?utf-8?B?eExyaGF6K29zNlBUdHQ5cHFoNEwzRS9hbFpDSC9EYTJlRVZRWU1rRzVLZEtB?=
 =?utf-8?B?Q3o3R05md0htTzNzRGhaNXdXUEdIUzZjTDJkNzNPMWlUWk8rcGNNcFpPTkh6?=
 =?utf-8?B?aWdsZXNkcFJ1YlB4d3dQVTRsRm5ldE41S0YwUUl4VWc5TW9rSE53Qm80T29y?=
 =?utf-8?B?c1kvS2cxbzFHMSs1eXo3QW1WRmpORVRYSDljV2xRcFdVOXd3U2JvMGRVZkFW?=
 =?utf-8?Q?QWtyRifAcb0xdI69BwEHRdMIM7EZ4bJfLL1K7La?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHg4dWhiQkcvVm9CY2FsNHU0Ui93UlIwcVpUeWhkbE5kb0w5RjI2eklPdG9j?=
 =?utf-8?B?YkFCVmhPazdWellBZEdRZHdwTUtVMWIzaWNRblh3eXU2VzA3UlF0RDRhSWtt?=
 =?utf-8?B?V2dSZmhtcTNOcWJKU3pHR25rTERlNWs5UUZwdWRlRWZSTnhmbW1Qc0Q0MVo1?=
 =?utf-8?B?SUFnbGRuY01ZYkZaYUhac3RobFRyZzNBQXI4Um45Wm05R1oyWlNPeUh6ZEdR?=
 =?utf-8?B?MDB1Zm1pNUhXelN4TVBjMmNqQjVQM3NXc3hyQUZTbld0Z0lKV2ZCT3FuSThx?=
 =?utf-8?B?V2U4NGJVa2Z1YnhaYnRaRW1LS2FHV2FvL3cwVklMN21JNmcvb1NlYWJrTitw?=
 =?utf-8?B?WnBNbEd1OWtPZFZvU3gyUVE5UStwajlYdmE4VW1SVFpDYTltMEtzVFkrYkV6?=
 =?utf-8?B?OUczM1NUdStsQWhHaE05NkVLNmhac3VuQ1JoQU5WU1RBVjBsNzZrSTNlaHBl?=
 =?utf-8?B?R1BsMTFwZFNvVkhBN3Avd1hWcW01UGNiK0NKbVNvbWRsSzgvNHB4akpEdlVw?=
 =?utf-8?B?Z042bWhzaU9TdVEyVzd4TTZoM0xHb3djTzFJTkwyNkhCc2JsVUpjWkUxN3VJ?=
 =?utf-8?B?cnlSek03TmNvUkgza0Z3a0c5QWxUYyt4YndOYmJWZUVvNERDUnh6Zk14Z2pO?=
 =?utf-8?B?bXBJSlFJT1h0SUZLZTM4ak5QVEd3bDdlcUt4TkpySkJ0YW00ejV5aVRZK2Z6?=
 =?utf-8?B?YkVobUdUUy9KUmlwdGNDSHh2MjJETjJUY2xsMXpqUVZOeXhQWFpTclhoMVJN?=
 =?utf-8?B?NmtuZkd1OGp5YkFnWFZXZ1pNck5kVlRXQ2QvdlhKeEVTd09lcGU3SHBSQUNl?=
 =?utf-8?B?QVlMK1VEVkphZm1MU0FqK3NhU3NRYzBvNUU0NUptMVV3Z0lwdkNSTVljTlJy?=
 =?utf-8?B?ZjcyYU9ZTjVWdEl6a3dpcU50RlRUNFl1MXJ5OVIvMDg5QmhGcjJoaUtTdHkw?=
 =?utf-8?B?YkdyUzNwaVhMMTRNdGRFaHRYZVc0R09RQVVaNGZwVEoyblc5b1dkUnQwTzVo?=
 =?utf-8?B?Z2x0RWsyYldhcjJBMWgwdnJTVHZzc2h4YjgrQlh4NXBzMENERTZjR21rOGtU?=
 =?utf-8?B?ZUlxQ1lIY1h3Tnl1dnlhQlJVamwvYng3M0p3azBVbFNvQVpsUU1WdSs3UHdV?=
 =?utf-8?B?QmtVNnFJcFhtV3lRQjhVc2h4SVpJZEhvZ0huZXo2RXRFcVhLbGtiR3JJQzBj?=
 =?utf-8?B?ZENWOWVhZ04vRlo1aGlzOTFORWJkaS9jdkNaZzJJN3doak5hQjZJcVg5N1FZ?=
 =?utf-8?B?NlpXdGhreFVUYlppZzB5U2djSk1uS2IvbnJCZVBnNVM5VlZFVGprdXlCZXpW?=
 =?utf-8?B?RGJrMFB6cFl5bG1lY1hZZGhMYlNyMktqMDV4eFp3YjhmUEM4bi9taTh6ekhy?=
 =?utf-8?B?T29iM3JYM3AwSVNSaWtwNUtqNnhJUlk0NWlZa2FOWkR4bnpuWmt3N0YwVWF2?=
 =?utf-8?B?dVZJdU9OdzNjbWtxWERDeGdPa3hyamJta29adkJLT2ZpSU5leHF4WVJ3S3hR?=
 =?utf-8?B?V09jcE5Ybm1WM1htZEV1bWdodVdnMy84VGFWZ0V2SkE3K05aQnRhSHlBb2xz?=
 =?utf-8?B?eFNCRmJRbUZwWGNrbXQ2UzR2MlF3TjR3TlNHMlNVaFR1czBNUEZ4SlJFclVu?=
 =?utf-8?B?UVZMdEE3OHY5NGxOTW1WQzFWcytJempvNDc4OFdZaytGcldDbElVZmQ0K2Zl?=
 =?utf-8?B?MVFTaHc5VjY5L1RORXNsQzRnbDRvT04rV0FIbXNFS00zSDdiMEpGK0FFUjJz?=
 =?utf-8?B?MTFwblhEZDlDZVUrTitiaEt0ZkE2UmpKbnhDSTNGeUEvUnR0YWxMaTlsRkVG?=
 =?utf-8?B?ODh0WVRVVjNQU0lSRFBwZXJtZlc1c3lpTVovSGdhZXIrZDJDYWRsYXRtblhY?=
 =?utf-8?B?STZRbEJab2NIS1J4TUx0S2h1a0c3STVKVjdQMUs2eWlycmdBQWhCZk8yaXlM?=
 =?utf-8?B?SzZOMGYvU2tOODFLZS9UKzRBZi9SK3pJb0dPWnJaQ0pXSHJVSFRsYmxwVXE2?=
 =?utf-8?B?UktuVUs2NzBzRDJPZGZIZzAyTGlmdEhRbWxJdHJDLzEyQ2JoRzlTcjFQRG4w?=
 =?utf-8?B?Qkw5MVB0MFBkeWp3MUl3Y0pJL1Y3ZDZHWWFlc1k5ZHRqbGFnbndUeHRXKzFM?=
 =?utf-8?Q?TSKPRaTKLJxqD5aybfBPGMGP7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9887cd5c-952a-41ab-227d-08dceeaa17cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 12:49:09.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vCdB1gttEFmDElA9ruZwXAtsx67nrVt9Q19Kvt+4mfxEkmq5rDI2ihlNHB0JU1dAsv84iq/hjhwWGnqa64ugRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8338
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


On 10/17/2024 5:48 PM, Christian König wrote:
> Am 17.10.24 um 12:06 schrieb Sunil Khatri:
>> Remove the unused and commented out code for vcn/uvd IP's.
>> Also remove the functions which are set to NULL as these are
>> global structures and all members are set to 0 or NULL during
>> initialization.
>
> Please separate that into two patches, one for the vcn/uvd stuff and 
> one for the rest.
Sure
>
> Leo needs to take a look at the VCN/UVD stuff, but I think it is ok to 
> remove that.
For all the unused code defined between #if endif i did confirmed with 
leo to clean up but i will split and add leo too in the review.
>
> Regards,
> Christian.
>
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c       |   4 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c       |   1 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c       |   5 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |   2 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |   4 -
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c       |   2 -
>>   drivers/gpu/drm/amd/amdgpu/cik.c              |   3 -
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c           |   3 -
>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c            |   3 -
>>   drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   3 -
>>   drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   3 -
>>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c         |   2 -
>>   drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c         |   2 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c         |   2 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c         |   2 -
>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |   2 -
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c       |   3 -
>>   drivers/gpu/drm/amd/amdgpu/ih_v6_0.c          |   3 -
>>   drivers/gpu/drm/amd/amdgpu/ih_v6_1.c          |   3 -
>>   drivers/gpu/drm/amd/amdgpu/ih_v7_0.c          |   3 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c        |   7 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c        |  14 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c        |   7 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c        |   7 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c      |   7 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c      |   7 -
>>   drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c      |   7 -
>>   drivers/gpu/drm/amd/amdgpu/mes_v11_0.c        |   2 -
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c        |   3 -
>>   drivers/gpu/drm/amd/amdgpu/nv.c               |   2 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c        |   3 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c        |   3 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/si.c               |   3 -
>>   drivers/gpu/drm/amd/amdgpu/si_dma.c           |   3 -
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c            |   3 -
>>   drivers/gpu/drm/amd/amdgpu/soc15.c            |   2 -
>>   drivers/gpu/drm/amd/amdgpu/soc21.c            |   2 -
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c         | 284 ------------------
>>   drivers/gpu/drm/amd/amdgpu/vce_v2_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/vce_v3_0.c         |   3 -
>>   drivers/gpu/drm/amd/amdgpu/vce_v4_0.c         | 275 -----------------
>>   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c         |   1 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c         |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         |  10 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c         |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c         |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c       |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c       |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c       |   5 -
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/vega20_ih.c        |   1 -
>>   drivers/gpu/drm/amd/amdgpu/vi.c               |   2 -
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 -
>>   drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c    |   2 -
>>   drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c    |   2 -
>>   .../gpu/drm/amd/pm/powerplay/amd_powerplay.c  |   2 -
>>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     |   4 -
>>   70 files changed, 790 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> index 8b7e056a7355..ec5e0dcf8613 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
>> @@ -603,8 +603,6 @@ static int acp_set_powergating_state(void *handle,
>>     static const struct amd_ip_funcs acp_ip_funcs = {
>>       .name = "acp_ip",
>> -    .early_init = NULL,
>> -    .late_init = NULL,
>>       .sw_init = acp_sw_init,
>>       .sw_fini = acp_sw_fini,
>>       .hw_init = acp_hw_init,
>> @@ -614,8 +612,6 @@ static const struct amd_ip_funcs acp_ip_funcs = {
>>       .is_idle = acp_is_idle,
>>       .set_clockgating_state = acp_set_clockgating_state,
>>       .set_powergating_state = acp_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version acp_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> index acc8a4b2732b..b6e4a8226832 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>> @@ -143,7 +143,6 @@ static int isp_set_powergating_state(void *handle,
>>   static const struct amd_ip_funcs isp_ip_funcs = {
>>       .name = "isp_ip",
>>       .early_init = isp_early_init,
>> -    .late_init = NULL,
>>       .hw_init = isp_hw_init,
>>       .hw_fini = isp_hw_fini,
>>       .is_idle = isp_is_idle,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> index cad153e333d8..abd5e980c9c7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
>> @@ -4095,17 +4095,12 @@ const struct attribute_group 
>> amdgpu_flash_attr_group = {
>>   const struct amd_ip_funcs psp_ip_funcs = {
>>       .name = "psp",
>>       .early_init = psp_early_init,
>> -    .late_init = NULL,
>>       .sw_init = psp_sw_init,
>>       .sw_fini = psp_sw_fini,
>>       .hw_init = psp_hw_init,
>>       .hw_fini = psp_hw_fini,
>>       .suspend = psp_suspend,
>>       .resume = psp_resume,
>> -    .is_idle = NULL,
>> -    .check_soft_reset = NULL,
>> -    .wait_for_idle = NULL,
>> -    .soft_reset = NULL,
>>       .set_clockgating_state = psp_set_clockgating_state,
>>       .set_powergating_state = psp_set_powergating_state,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>> index 3ef75f1a47f6..bd2d3863c3ed 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>> @@ -993,8 +993,6 @@ static const struct amd_ip_funcs 
>> umsch_mm_v4_0_ip_funcs = {
>>       .hw_fini = umsch_mm_hw_fini,
>>       .suspend = umsch_mm_suspend,
>>       .resume = umsch_mm_resume,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version umsch_mm_v4_0_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> index 6850a27f724f..52e01e09a1b3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
>> @@ -641,8 +641,6 @@ static int amdgpu_vkms_set_powergating_state(void 
>> *handle,
>>     static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
>>       .name = "amdgpu_vkms",
>> -    .early_init = NULL,
>> -    .late_init = NULL,
>>       .sw_init = amdgpu_vkms_sw_init,
>>       .sw_fini = amdgpu_vkms_sw_fini,
>>       .hw_init = amdgpu_vkms_hw_init,
>> @@ -651,8 +649,6 @@ static const struct amd_ip_funcs 
>> amdgpu_vkms_ip_funcs = {
>>       .is_idle = amdgpu_vkms_is_idle,
>>       .set_clockgating_state = amdgpu_vkms_set_clockgating_state,
>>       .set_powergating_state = amdgpu_vkms_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version amdgpu_vkms_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> index 6d96e1f21e20..46713a158d90 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c
>> @@ -906,14 +906,12 @@ static void vpe_set_ring_funcs(struct 
>> amdgpu_device *adev)
>>   const struct amd_ip_funcs vpe_ip_funcs = {
>>       .name = "vpe_v6_1",
>>       .early_init = vpe_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vpe_sw_init,
>>       .sw_fini = vpe_sw_fini,
>>       .hw_init = vpe_hw_init,
>>       .hw_fini = vpe_hw_fini,
>>       .suspend = vpe_suspend,
>>       .resume = vpe_resume,
>> -    .soft_reset = NULL,
>>       .set_clockgating_state = vpe_set_clockgating_state,
>>       .set_powergating_state = vpe_set_powergating_state,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik.c
>> index d7a843280059..23b712fda53d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
>> @@ -2171,15 +2171,12 @@ static int 
>> cik_common_set_powergating_state(void *handle,
>>   static const struct amd_ip_funcs cik_common_ip_funcs = {
>>       .name = "cik_common",
>>       .early_init = cik_common_early_init,
>> -    .late_init = NULL,
>>       .hw_init = cik_common_hw_init,
>>       .resume = cik_common_resume,
>>       .is_idle = cik_common_is_idle,
>>       .soft_reset = cik_common_soft_reset,
>>       .set_clockgating_state = cik_common_set_clockgating_state,
>>       .set_powergating_state = cik_common_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ip_block_version cik_common_ip_block =
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 9e9a58fd86ce..1da17755ad53 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -417,7 +417,6 @@ static int cik_ih_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs cik_ih_ip_funcs = {
>>       .name = "cik_ih",
>>       .early_init = cik_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = cik_ih_sw_init,
>>       .sw_fini = cik_ih_sw_fini,
>>       .hw_init = cik_ih_hw_init,
>> @@ -429,8 +428,6 @@ static const struct amd_ip_funcs cik_ih_ip_funcs = {
>>       .soft_reset = cik_ih_soft_reset,
>>       .set_clockgating_state = cik_ih_set_clockgating_state,
>>       .set_powergating_state = cik_ih_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs cik_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c 
>> b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> index df3f429e003e..ede1a028d48d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
>> @@ -1213,7 +1213,6 @@ static int cik_sdma_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs cik_sdma_ip_funcs = {
>>       .name = "cik_sdma",
>>       .early_init = cik_sdma_early_init,
>> -    .late_init = NULL,
>>       .sw_init = cik_sdma_sw_init,
>>       .sw_fini = cik_sdma_sw_fini,
>>       .hw_init = cik_sdma_hw_init,
>> @@ -1225,8 +1224,6 @@ static const struct amd_ip_funcs 
>> cik_sdma_ip_funcs = {
>>       .soft_reset = cik_sdma_soft_reset,
>>       .set_clockgating_state = cik_sdma_set_clockgating_state,
>>       .set_powergating_state = cik_sdma_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs cik_sdma_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index cadd69a243af..d72973bd570d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -415,7 +415,6 @@ static int cz_ih_set_powergating_state(void *handle,
>>   static const struct amd_ip_funcs cz_ih_ip_funcs = {
>>       .name = "cz_ih",
>>       .early_init = cz_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = cz_ih_sw_init,
>>       .sw_fini = cz_ih_sw_fini,
>>       .hw_init = cz_ih_hw_init,
>> @@ -427,8 +426,6 @@ static const struct amd_ip_funcs cz_ih_ip_funcs = {
>>       .soft_reset = cz_ih_soft_reset,
>>       .set_clockgating_state = cz_ih_set_clockgating_state,
>>       .set_powergating_state = cz_ih_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs cz_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> index a5985663a867..5098c50d54c8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
>> @@ -3317,7 +3317,6 @@ static int dce_v10_0_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs dce_v10_0_ip_funcs = {
>>       .name = "dce_v10_0",
>>       .early_init = dce_v10_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = dce_v10_0_sw_init,
>>       .sw_fini = dce_v10_0_sw_fini,
>>       .hw_init = dce_v10_0_hw_init,
>> @@ -3329,8 +3328,6 @@ static const struct amd_ip_funcs 
>> dce_v10_0_ip_funcs = {
>>       .soft_reset = dce_v10_0_soft_reset,
>>       .set_clockgating_state = dce_v10_0_set_clockgating_state,
>>       .set_powergating_state = dce_v10_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static void
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> index 5c907a1a4778..c5680ff4ab9f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
>> @@ -3449,7 +3449,6 @@ static int dce_v11_0_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs dce_v11_0_ip_funcs = {
>>       .name = "dce_v11_0",
>>       .early_init = dce_v11_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = dce_v11_0_sw_init,
>>       .sw_fini = dce_v11_0_sw_fini,
>>       .hw_init = dce_v11_0_hw_init,
>> @@ -3460,8 +3459,6 @@ static const struct amd_ip_funcs 
>> dce_v11_0_ip_funcs = {
>>       .soft_reset = dce_v11_0_soft_reset,
>>       .set_clockgating_state = dce_v11_0_set_clockgating_state,
>>       .set_powergating_state = dce_v11_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static void
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> index a53e4fac89dc..eb7de9122d99 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
>> @@ -3139,7 +3139,6 @@ static int dce_v6_0_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs dce_v6_0_ip_funcs = {
>>       .name = "dce_v6_0",
>>       .early_init = dce_v6_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = dce_v6_0_sw_init,
>>       .sw_fini = dce_v6_0_sw_fini,
>>       .hw_init = dce_v6_0_hw_init,
>> @@ -3150,8 +3149,6 @@ static const struct amd_ip_funcs 
>> dce_v6_0_ip_funcs = {
>>       .soft_reset = dce_v6_0_soft_reset,
>>       .set_clockgating_state = dce_v6_0_set_clockgating_state,
>>       .set_powergating_state = dce_v6_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static void
>> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> index 9278e0d8d00c..04b79ff87f75 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
>> @@ -3227,7 +3227,6 @@ static int dce_v8_0_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs dce_v8_0_ip_funcs = {
>>       .name = "dce_v8_0",
>>       .early_init = dce_v8_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = dce_v8_0_sw_init,
>>       .sw_fini = dce_v8_0_sw_fini,
>>       .hw_init = dce_v8_0_hw_init,
>> @@ -3238,8 +3237,6 @@ static const struct amd_ip_funcs 
>> dce_v8_0_ip_funcs = {
>>       .soft_reset = dce_v8_0_soft_reset,
>>       .set_clockgating_state = dce_v8_0_set_clockgating_state,
>>       .set_powergating_state = dce_v8_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static void
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> index 5769055909bc..41f50bf380c4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
>> @@ -3435,7 +3435,6 @@ static void gfx_v6_0_emit_mem_sync(struct 
>> amdgpu_ring *ring)
>>   static const struct amd_ip_funcs gfx_v6_0_ip_funcs = {
>>       .name = "gfx_v6_0",
>>       .early_init = gfx_v6_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = gfx_v6_0_sw_init,
>>       .sw_fini = gfx_v6_0_sw_fini,
>>       .hw_init = gfx_v6_0_hw_init,
>> @@ -3446,8 +3445,6 @@ static const struct amd_ip_funcs 
>> gfx_v6_0_ip_funcs = {
>>       .wait_for_idle = gfx_v6_0_wait_for_idle,
>>       .set_clockgating_state = gfx_v6_0_set_clockgating_state,
>>       .set_powergating_state = gfx_v6_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs gfx_v6_0_ring_funcs_gfx = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> index a683d2bfb8de..824d5913103b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
>> @@ -5005,8 +5005,6 @@ static const struct amd_ip_funcs 
>> gfx_v7_0_ip_funcs = {
>>       .soft_reset = gfx_v7_0_soft_reset,
>>       .set_clockgating_state = gfx_v7_0_set_clockgating_state,
>>       .set_powergating_state = gfx_v7_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs gfx_v7_0_ring_funcs_gfx = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> index 8b72463fd5c0..480c41ee947e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
>> @@ -6948,8 +6948,6 @@ static const struct amd_ip_funcs 
>> gfx_v8_0_ip_funcs = {
>>       .set_clockgating_state = gfx_v8_0_set_clockgating_state,
>>       .set_powergating_state = gfx_v8_0_set_powergating_state,
>>       .get_clockgating_state = gfx_v8_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_gfx = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> index c1e2f1d79e74..ca000b3d1afc 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
>> @@ -1121,8 +1121,6 @@ static const struct amd_ip_funcs 
>> gmc_v6_0_ip_funcs = {
>>       .soft_reset = gmc_v6_0_soft_reset,
>>       .set_clockgating_state = gmc_v6_0_set_clockgating_state,
>>       .set_powergating_state = gmc_v6_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_gmc_funcs gmc_v6_0_gmc_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> index 54a48662f3b5..07f45f1a503a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
>> @@ -1348,8 +1348,6 @@ static const struct amd_ip_funcs 
>> gmc_v7_0_ip_funcs = {
>>       .soft_reset = gmc_v7_0_soft_reset,
>>       .set_clockgating_state = gmc_v7_0_set_clockgating_state,
>>       .set_powergating_state = gmc_v7_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_gmc_funcs gmc_v7_0_gmc_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> index c4f2ad32c078..12d5967ecd45 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
>> @@ -1722,8 +1722,6 @@ static const struct amd_ip_funcs 
>> gmc_v8_0_ip_funcs = {
>>       .set_clockgating_state = gmc_v8_0_set_clockgating_state,
>>       .set_powergating_state = gmc_v8_0_set_powergating_state,
>>       .get_clockgating_state = gmc_v8_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index a3fb01f905d4..7f45e93c0397 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -407,7 +407,6 @@ static int iceland_ih_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs iceland_ih_ip_funcs = {
>>       .name = "iceland_ih",
>>       .early_init = iceland_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = iceland_ih_sw_init,
>>       .sw_fini = iceland_ih_sw_fini,
>>       .hw_init = iceland_ih_hw_init,
>> @@ -419,8 +418,6 @@ static const struct amd_ip_funcs 
>> iceland_ih_ip_funcs = {
>>       .soft_reset = iceland_ih_soft_reset,
>>       .set_clockgating_state = iceland_ih_set_clockgating_state,
>>       .set_powergating_state = iceland_ih_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs iceland_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> index 09403eac483b..38f953fd65d9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
>> @@ -779,7 +779,6 @@ static void ih_v6_0_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs ih_v6_0_ip_funcs = {
>>       .name = "ih_v6_0",
>>       .early_init = ih_v6_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = ih_v6_0_sw_init,
>>       .sw_fini = ih_v6_0_sw_fini,
>>       .hw_init = ih_v6_0_hw_init,
>> @@ -792,8 +791,6 @@ static const struct amd_ip_funcs ih_v6_0_ip_funcs 
>> = {
>>       .set_clockgating_state = ih_v6_0_set_clockgating_state,
>>       .set_powergating_state = ih_v6_0_set_powergating_state,
>>       .get_clockgating_state = ih_v6_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs ih_v6_0_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> index 9706d7593d26..61381e0c3795 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
>> @@ -762,7 +762,6 @@ static void ih_v6_1_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs ih_v6_1_ip_funcs = {
>>       .name = "ih_v6_1",
>>       .early_init = ih_v6_1_early_init,
>> -    .late_init = NULL,
>>       .sw_init = ih_v6_1_sw_init,
>>       .sw_fini = ih_v6_1_sw_fini,
>>       .hw_init = ih_v6_1_hw_init,
>> @@ -775,8 +774,6 @@ static const struct amd_ip_funcs ih_v6_1_ip_funcs 
>> = {
>>       .set_clockgating_state = ih_v6_1_set_clockgating_state,
>>       .set_powergating_state = ih_v6_1_set_powergating_state,
>>       .get_clockgating_state = ih_v6_1_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs ih_v6_1_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> index 9657145d7cce..d2428cf5d385 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
>> @@ -752,7 +752,6 @@ static void ih_v7_0_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs ih_v7_0_ip_funcs = {
>>       .name = "ih_v7_0",
>>       .early_init = ih_v7_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = ih_v7_0_sw_init,
>>       .sw_fini = ih_v7_0_sw_fini,
>>       .hw_init = ih_v7_0_hw_init,
>> @@ -765,8 +764,6 @@ static const struct amd_ip_funcs ih_v7_0_ip_funcs 
>> = {
>>       .set_clockgating_state = ih_v7_0_set_clockgating_state,
>>       .set_powergating_state = ih_v7_0_set_powergating_state,
>>       .get_clockgating_state = ih_v7_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs ih_v7_0_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> index 6762b5c64ccb..d6823fb45d32 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
>> @@ -742,7 +742,6 @@ static int jpeg_v2_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v2_0_ip_funcs = {
>>       .name = "jpeg_v2_0",
>>       .early_init = jpeg_v2_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v2_0_sw_init,
>>       .sw_fini = jpeg_v2_0_sw_fini,
>>       .hw_init = jpeg_v2_0_hw_init,
>> @@ -751,14 +750,8 @@ static const struct amd_ip_funcs 
>> jpeg_v2_0_ip_funcs = {
>>       .resume = jpeg_v2_0_resume,
>>       .is_idle = jpeg_v2_0_is_idle,
>>       .wait_for_idle = jpeg_v2_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v2_0_set_clockgating_state,
>>       .set_powergating_state = jpeg_v2_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs jpeg_v2_0_dec_ring_vm_funcs 
>> = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> index 4b8c801f204d..5063a38801d6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
>> @@ -613,7 +613,6 @@ static int jpeg_v2_5_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v2_5_ip_funcs = {
>>       .name = "jpeg_v2_5",
>>       .early_init = jpeg_v2_5_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v2_5_sw_init,
>>       .sw_fini = jpeg_v2_5_sw_fini,
>>       .hw_init = jpeg_v2_5_hw_init,
>> @@ -622,20 +621,13 @@ static const struct amd_ip_funcs 
>> jpeg_v2_5_ip_funcs = {
>>       .resume = jpeg_v2_5_resume,
>>       .is_idle = jpeg_v2_5_is_idle,
>>       .wait_for_idle = jpeg_v2_5_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v2_5_set_clockgating_state,
>>       .set_powergating_state = jpeg_v2_5_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
>>       .name = "jpeg_v2_6",
>>       .early_init = jpeg_v2_5_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v2_5_sw_init,
>>       .sw_fini = jpeg_v2_5_sw_fini,
>>       .hw_init = jpeg_v2_5_hw_init,
>> @@ -644,14 +636,8 @@ static const struct amd_ip_funcs 
>> jpeg_v2_6_ip_funcs = {
>>       .resume = jpeg_v2_5_resume,
>>       .is_idle = jpeg_v2_5_is_idle,
>>       .wait_for_idle = jpeg_v2_5_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v2_5_set_clockgating_state,
>>       .set_powergating_state = jpeg_v2_5_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs 
>> = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> index 7996209818b6..10adbb7cbf53 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
>> @@ -533,7 +533,6 @@ static int jpeg_v3_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v3_0_ip_funcs = {
>>       .name = "jpeg_v3_0",
>>       .early_init = jpeg_v3_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v3_0_sw_init,
>>       .sw_fini = jpeg_v3_0_sw_fini,
>>       .hw_init = jpeg_v3_0_hw_init,
>> @@ -542,14 +541,8 @@ static const struct amd_ip_funcs 
>> jpeg_v3_0_ip_funcs = {
>>       .resume = jpeg_v3_0_resume,
>>       .is_idle = jpeg_v3_0_is_idle,
>>       .wait_for_idle = jpeg_v3_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v3_0_set_clockgating_state,
>>       .set_powergating_state = jpeg_v3_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs jpeg_v3_0_dec_ring_vm_funcs 
>> = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> index 20e1fe89c463..89953c0f5f1f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
>> @@ -700,7 +700,6 @@ static int jpeg_v4_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v4_0_ip_funcs = {
>>       .name = "jpeg_v4_0",
>>       .early_init = jpeg_v4_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v4_0_sw_init,
>>       .sw_fini = jpeg_v4_0_sw_fini,
>>       .hw_init = jpeg_v4_0_hw_init,
>> @@ -709,14 +708,8 @@ static const struct amd_ip_funcs 
>> jpeg_v4_0_ip_funcs = {
>>       .resume = jpeg_v4_0_resume,
>>       .is_idle = jpeg_v4_0_is_idle,
>>       .wait_for_idle = jpeg_v4_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v4_0_set_clockgating_state,
>>       .set_powergating_state = jpeg_v4_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs jpeg_v4_0_dec_ring_vm_funcs 
>> = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> index 2a53537db135..6917e4a8e96a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
>> @@ -1050,7 +1050,6 @@ static int jpeg_v4_0_3_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v4_0_3_ip_funcs = {
>>       .name = "jpeg_v4_0_3",
>>       .early_init = jpeg_v4_0_3_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v4_0_3_sw_init,
>>       .sw_fini = jpeg_v4_0_3_sw_fini,
>>       .hw_init = jpeg_v4_0_3_hw_init,
>> @@ -1059,14 +1058,8 @@ static const struct amd_ip_funcs 
>> jpeg_v4_0_3_ip_funcs = {
>>       .resume = jpeg_v4_0_3_resume,
>>       .is_idle = jpeg_v4_0_3_is_idle,
>>       .wait_for_idle = jpeg_v4_0_3_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v4_0_3_set_clockgating_state,
>>       .set_powergating_state = jpeg_v4_0_3_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs 
>> jpeg_v4_0_3_dec_ring_vm_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> index ef2d4237925b..f3cce523f3cb 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
>> @@ -741,7 +741,6 @@ static int jpeg_v4_0_5_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v4_0_5_ip_funcs = {
>>       .name = "jpeg_v4_0_5",
>>       .early_init = jpeg_v4_0_5_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v4_0_5_sw_init,
>>       .sw_fini = jpeg_v4_0_5_sw_fini,
>>       .hw_init = jpeg_v4_0_5_hw_init,
>> @@ -750,14 +749,8 @@ static const struct amd_ip_funcs 
>> jpeg_v4_0_5_ip_funcs = {
>>       .resume = jpeg_v4_0_5_resume,
>>       .is_idle = jpeg_v4_0_5_is_idle,
>>       .wait_for_idle = jpeg_v4_0_5_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v4_0_5_set_clockgating_state,
>>       .set_powergating_state = jpeg_v4_0_5_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs 
>> jpeg_v4_0_5_dec_ring_vm_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> index 7954a6fae464..06840d1dae79 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
>> @@ -620,7 +620,6 @@ static int jpeg_v5_0_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>   static const struct amd_ip_funcs jpeg_v5_0_0_ip_funcs = {
>>       .name = "jpeg_v5_0_0",
>>       .early_init = jpeg_v5_0_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = jpeg_v5_0_0_sw_init,
>>       .sw_fini = jpeg_v5_0_0_sw_fini,
>>       .hw_init = jpeg_v5_0_0_hw_init,
>> @@ -629,14 +628,8 @@ static const struct amd_ip_funcs 
>> jpeg_v5_0_0_ip_funcs = {
>>       .resume = jpeg_v5_0_0_resume,
>>       .is_idle = jpeg_v5_0_0_is_idle,
>>       .wait_for_idle = jpeg_v5_0_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = jpeg_v5_0_0_set_clockgating_state,
>>       .set_powergating_state = jpeg_v5_0_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs 
>> jpeg_v5_0_0_dec_ring_vm_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>> index 2edfe86a866b..8ca137313961 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
>> @@ -1707,8 +1707,6 @@ static const struct amd_ip_funcs 
>> mes_v11_0_ip_funcs = {
>>       .hw_fini = mes_v11_0_hw_fini,
>>       .suspend = mes_v11_0_suspend,
>>       .resume = mes_v11_0_resume,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version mes_v11_0_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 93da900b7ee2..0820ed62e2e8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -694,7 +694,6 @@ static void navi10_ih_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs navi10_ih_ip_funcs = {
>>       .name = "navi10_ih",
>>       .early_init = navi10_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = navi10_ih_sw_init,
>>       .sw_fini = navi10_ih_sw_fini,
>>       .hw_init = navi10_ih_hw_init,
>> @@ -707,8 +706,6 @@ static const struct amd_ip_funcs 
>> navi10_ih_ip_funcs = {
>>       .set_clockgating_state = navi10_ih_set_clockgating_state,
>>       .set_powergating_state = navi10_ih_set_powergating_state,
>>       .get_clockgating_state = navi10_ih_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs navi10_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c 
>> b/drivers/gpu/drm/amd/amdgpu/nv.c
>> index c16f724384cd..6b72169be8f8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
>> @@ -1104,6 +1104,4 @@ static const struct amd_ip_funcs 
>> nv_common_ip_funcs = {
>>       .set_clockgating_state = nv_common_set_clockgating_state,
>>       .set_powergating_state = nv_common_set_powergating_state,
>>       .get_clockgating_state = nv_common_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> index 10fd772cb80f..7948d74f8722 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
>> @@ -1096,7 +1096,6 @@ static int sdma_v2_4_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs sdma_v2_4_ip_funcs = {
>>       .name = "sdma_v2_4",
>>       .early_init = sdma_v2_4_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v2_4_sw_init,
>>       .sw_fini = sdma_v2_4_sw_fini,
>>       .hw_init = sdma_v2_4_hw_init,
>> @@ -1108,8 +1107,6 @@ static const struct amd_ip_funcs 
>> sdma_v2_4_ip_funcs = {
>>       .soft_reset = sdma_v2_4_soft_reset,
>>       .set_clockgating_state = sdma_v2_4_set_clockgating_state,
>>       .set_powergating_state = sdma_v2_4_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs sdma_v2_4_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> index 69fba087e09c..9a3d729545a7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
>> @@ -1534,7 +1534,6 @@ static void 
>> sdma_v3_0_get_clockgating_state(void *handle, u64 *flags)
>>   static const struct amd_ip_funcs sdma_v3_0_ip_funcs = {
>>       .name = "sdma_v3_0",
>>       .early_init = sdma_v3_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v3_0_sw_init,
>>       .sw_fini = sdma_v3_0_sw_fini,
>>       .hw_init = sdma_v3_0_hw_init,
>> @@ -1550,8 +1549,6 @@ static const struct amd_ip_funcs 
>> sdma_v3_0_ip_funcs = {
>>       .set_clockgating_state = sdma_v3_0_set_clockgating_state,
>>       .set_powergating_state = sdma_v3_0_set_powergating_state,
>>       .get_clockgating_state = sdma_v3_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs sdma_v3_0_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> index 6a675daf5620..d31c4860933f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
>> @@ -1929,7 +1929,6 @@ static void sdma_v5_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs sdma_v5_0_ip_funcs = {
>>       .name = "sdma_v5_0",
>>       .early_init = sdma_v5_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v5_0_sw_init,
>>       .sw_fini = sdma_v5_0_sw_fini,
>>       .hw_init = sdma_v5_0_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> index e1413ccaf7e4..ffa8c62ac101 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
>> @@ -1918,7 +1918,6 @@ static void sdma_v5_2_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs sdma_v5_2_ip_funcs = {
>>       .name = "sdma_v5_2",
>>       .early_init = sdma_v5_2_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v5_2_sw_init,
>>       .sw_fini = sdma_v5_2_sw_fini,
>>       .hw_init = sdma_v5_2_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> index 4856a093e23f..449d515e6b67 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
>> @@ -1649,7 +1649,6 @@ static void sdma_v6_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   const struct amd_ip_funcs sdma_v6_0_ip_funcs = {
>>       .name = "sdma_v6_0",
>>       .early_init = sdma_v6_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v6_0_sw_init,
>>       .sw_fini = sdma_v6_0_sw_fini,
>>       .hw_init = sdma_v6_0_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> index 24f24974ac1d..dfd4b08e4b47 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
>> @@ -1579,7 +1579,6 @@ static void sdma_v7_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   const struct amd_ip_funcs sdma_v7_0_ip_funcs = {
>>       .name = "sdma_v7_0",
>>       .early_init = sdma_v7_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = sdma_v7_0_sw_init,
>>       .sw_fini = sdma_v7_0_sw_fini,
>>       .hw_init = sdma_v7_0_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si.c 
>> b/drivers/gpu/drm/amd/amdgpu/si.c
>> index 6d8d5547d18b..82d6f5aabb1d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si.c
>> @@ -2659,14 +2659,11 @@ static int 
>> si_common_set_powergating_state(void *handle,
>>   static const struct amd_ip_funcs si_common_ip_funcs = {
>>       .name = "si_common",
>>       .early_init = si_common_early_init,
>> -    .late_init = NULL,
>>       .hw_init = si_common_hw_init,
>>       .resume = si_common_resume,
>>       .is_idle = si_common_is_idle,
>>       .set_clockgating_state = si_common_set_clockgating_state,
>>       .set_powergating_state = si_common_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ip_block_version si_common_ip_block =
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c 
>> b/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> index d44483ed3363..47647a6083e8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
>> @@ -691,7 +691,6 @@ static int si_dma_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs si_dma_ip_funcs = {
>>       .name = "si_dma",
>>       .early_init = si_dma_early_init,
>> -    .late_init = NULL,
>>       .sw_init = si_dma_sw_init,
>>       .sw_fini = si_dma_sw_fini,
>>       .hw_init = si_dma_hw_init,
>> @@ -703,8 +702,6 @@ static const struct amd_ip_funcs si_dma_ip_funcs = {
>>       .soft_reset = si_dma_soft_reset,
>>       .set_clockgating_state = si_dma_set_clockgating_state,
>>       .set_powergating_state = si_dma_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs si_dma_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index b018a3b90401..2ec1ebe4db11 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -278,7 +278,6 @@ static int si_ih_set_powergating_state(void *handle,
>>   static const struct amd_ip_funcs si_ih_ip_funcs = {
>>       .name = "si_ih",
>>       .early_init = si_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = si_ih_sw_init,
>>       .sw_fini = si_ih_sw_fini,
>>       .hw_init = si_ih_hw_init,
>> @@ -290,8 +289,6 @@ static const struct amd_ip_funcs si_ih_ip_funcs = {
>>       .soft_reset = si_ih_soft_reset,
>>       .set_clockgating_state = si_ih_set_clockgating_state,
>>       .set_powergating_state = si_ih_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs si_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c 
>> b/drivers/gpu/drm/amd/amdgpu/soc15.c
>> index 19391cbc1474..93e44e7ee3fa 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
>> @@ -1494,6 +1494,4 @@ static const struct amd_ip_funcs 
>> soc15_common_ip_funcs = {
>>       .set_clockgating_state = soc15_common_set_clockgating_state,
>>       .set_powergating_state = soc15_common_set_powergating_state,
>>       .get_clockgating_state= soc15_common_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c 
>> b/drivers/gpu/drm/amd/amdgpu/soc21.c
>> index 078f25b5f09b..1c07ebdc0d1f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/soc21.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
>> @@ -993,6 +993,4 @@ static const struct amd_ip_funcs 
>> soc21_common_ip_funcs = {
>>       .set_clockgating_state = soc21_common_set_clockgating_state,
>>       .set_powergating_state = soc21_common_set_powergating_state,
>>       .get_clockgating_state = soc21_common_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 45fb5140c8b7..5a04a6770138 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -463,7 +463,6 @@ static int tonga_ih_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs tonga_ih_ip_funcs = {
>>       .name = "tonga_ih",
>>       .early_init = tonga_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = tonga_ih_sw_init,
>>       .sw_fini = tonga_ih_sw_fini,
>>       .hw_init = tonga_ih_hw_init,
>> @@ -478,8 +477,6 @@ static const struct amd_ip_funcs 
>> tonga_ih_ip_funcs = {
>>       .post_soft_reset = tonga_ih_post_soft_reset,
>>       .set_clockgating_state = tonga_ih_set_clockgating_state,
>>       .set_powergating_state = tonga_ih_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ih_funcs tonga_ih_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> index 3011b5853fb4..bdbca25d80c4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
>> @@ -805,7 +805,6 @@ static int uvd_v3_1_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs uvd_v3_1_ip_funcs = {
>>       .name = "uvd_v3_1",
>>       .early_init = uvd_v3_1_early_init,
>> -    .late_init = NULL,
>>       .sw_init = uvd_v3_1_sw_init,
>>       .sw_fini = uvd_v3_1_sw_fini,
>>       .hw_init = uvd_v3_1_hw_init,
>> @@ -818,8 +817,6 @@ static const struct amd_ip_funcs 
>> uvd_v3_1_ip_funcs = {
>>       .soft_reset = uvd_v3_1_soft_reset,
>>       .set_clockgating_state = uvd_v3_1_set_clockgating_state,
>>       .set_powergating_state = uvd_v3_1_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version uvd_v3_1_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> index 4852a2ab128f..a836dc9cfcad 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
>> @@ -755,7 +755,6 @@ static int uvd_v4_2_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs uvd_v4_2_ip_funcs = {
>>       .name = "uvd_v4_2",
>>       .early_init = uvd_v4_2_early_init,
>> -    .late_init = NULL,
>>       .sw_init = uvd_v4_2_sw_init,
>>       .sw_fini = uvd_v4_2_sw_fini,
>>       .hw_init = uvd_v4_2_hw_init,
>> @@ -768,8 +767,6 @@ static const struct amd_ip_funcs 
>> uvd_v4_2_ip_funcs = {
>>       .soft_reset = uvd_v4_2_soft_reset,
>>       .set_clockgating_state = uvd_v4_2_set_clockgating_state,
>>       .set_powergating_state = uvd_v4_2_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> index a24b210c79ac..ab55fae3569e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
>> @@ -867,7 +867,6 @@ static void uvd_v5_0_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs uvd_v5_0_ip_funcs = {
>>       .name = "uvd_v5_0",
>>       .early_init = uvd_v5_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = uvd_v5_0_sw_init,
>>       .sw_fini = uvd_v5_0_sw_fini,
>>       .hw_init = uvd_v5_0_hw_init,
>> @@ -881,8 +880,6 @@ static const struct amd_ip_funcs 
>> uvd_v5_0_ip_funcs = {
>>       .set_clockgating_state = uvd_v5_0_set_clockgating_state,
>>       .set_powergating_state = uvd_v5_0_set_powergating_state,
>>       .get_clockgating_state = uvd_v5_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> index b4eeeebfe095..39f8c3d3a135 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
>> @@ -1532,7 +1532,6 @@ static void uvd_v6_0_get_clockgating_state(void 
>> *handle, u64 *flags)
>>   static const struct amd_ip_funcs uvd_v6_0_ip_funcs = {
>>       .name = "uvd_v6_0",
>>       .early_init = uvd_v6_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = uvd_v6_0_sw_init,
>>       .sw_fini = uvd_v6_0_sw_fini,
>>       .hw_init = uvd_v6_0_hw_init,
>> @@ -1549,8 +1548,6 @@ static const struct amd_ip_funcs 
>> uvd_v6_0_ip_funcs = {
>>       .set_clockgating_state = uvd_v6_0_set_clockgating_state,
>>       .set_powergating_state = uvd_v6_0_set_powergating_state,
>>       .get_clockgating_state = uvd_v6_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> index 55fa858328f6..f909a60a8853 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
>> @@ -1462,104 +1462,6 @@ static void 
>> uvd_v7_0_enc_ring_emit_wreg(struct amdgpu_ring *ring,
>>       amdgpu_ring_write(ring, val);
>>   }
>>   -#if 0
>> -static bool uvd_v7_0_is_idle(void *handle)
>> -{
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -
>> -    return !(RREG32(mmSRBM_STATUS) & SRBM_STATUS__UVD_BUSY_MASK);
>> -}
>> -
>> -static int uvd_v7_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
>> -{
>> -    unsigned i;
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    for (i = 0; i < adev->usec_timeout; i++) {
>> -        if (uvd_v7_0_is_idle(handle))
>> -            return 0;
>> -    }
>> -    return -ETIMEDOUT;
>> -}
>> -
>> -#define AMDGPU_UVD_STATUS_BUSY_MASK    0xfd
>> -static bool uvd_v7_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -    u32 srbm_soft_reset = 0;
>> -    u32 tmp = RREG32(mmSRBM_STATUS);
>> -
>> -    if (REG_GET_FIELD(tmp, SRBM_STATUS, UVD_RQ_PENDING) ||
>> -        REG_GET_FIELD(tmp, SRBM_STATUS, UVD_BUSY) ||
>> -        (RREG32_SOC15(UVD, ring->me, mmUVD_STATUS) &
>> -            AMDGPU_UVD_STATUS_BUSY_MASK))
>> -        srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset,
>> -                SRBM_SOFT_RESET, SOFT_RESET_UVD, 1);
>> -
>> -    if (srbm_soft_reset) {
>> -        adev->uvd.inst[ring->me].srbm_soft_reset = srbm_soft_reset;
>> -        return true;
>> -    } else {
>> -        adev->uvd.inst[ring->me].srbm_soft_reset = 0;
>> -        return false;
>> -    }
>> -}
>> -
>> -static int uvd_v7_0_pre_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    if (!adev->uvd.inst[ring->me].srbm_soft_reset)
>> -        return 0;
>> -
>> -    uvd_v7_0_stop(adev);
>> -    return 0;
>> -}
>> -
>> -static int uvd_v7_0_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -    u32 srbm_soft_reset;
>> -
>> -    if (!adev->uvd.inst[ring->me].srbm_soft_reset)
>> -        return 0;
>> -    srbm_soft_reset = adev->uvd.inst[ring->me].srbm_soft_reset;
>> -
>> -    if (srbm_soft_reset) {
>> -        u32 tmp;
>> -
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -        tmp |= srbm_soft_reset;
>> -        dev_info(adev->dev, "SRBM_SOFT_RESET=0x%08X\n", tmp);
>> -        WREG32(mmSRBM_SOFT_RESET, tmp);
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -
>> -        udelay(50);
>> -
>> -        tmp &= ~srbm_soft_reset;
>> -        WREG32(mmSRBM_SOFT_RESET, tmp);
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -
>> -        /* Wait a little for things to settle down */
>> -        udelay(50);
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static int uvd_v7_0_post_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    if (!adev->uvd.inst[ring->me].srbm_soft_reset)
>> -        return 0;
>> -
>> -    mdelay(5);
>> -
>> -    return uvd_v7_0_start(adev);
>> -}
>> -#endif
>> -
>>   static int uvd_v7_0_set_interrupt_state(struct amdgpu_device *adev,
>>                       struct amdgpu_irq_src *source,
>>                       unsigned type,
>> @@ -1609,187 +1511,9 @@ static int uvd_v7_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>       return 0;
>>   }
>>   -#if 0
>> -static void uvd_v7_0_set_sw_clock_gating(struct amdgpu_device *adev)
>> -{
>> -    uint32_t data, data1, data2, suvd_flags;
>> -
>> -    data = RREG32_SOC15(UVD, ring->me, mmUVD_CGC_CTRL);
>> -    data1 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE);
>> -    data2 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_CTRL);
>> -
>> -    data &= ~(UVD_CGC_CTRL__CLK_OFF_DELAY_MASK |
>> -          UVD_CGC_CTRL__CLK_GATE_DLY_TIMER_MASK);
>> -
>> -    suvd_flags = UVD_SUVD_CGC_GATE__SRE_MASK |
>> -             UVD_SUVD_CGC_GATE__SIT_MASK |
>> -             UVD_SUVD_CGC_GATE__SMP_MASK |
>> -             UVD_SUVD_CGC_GATE__SCM_MASK |
>> -             UVD_SUVD_CGC_GATE__SDB_MASK;
>> -
>> -    data |= UVD_CGC_CTRL__DYN_CLOCK_MODE_MASK |
>> -        (1 << REG_FIELD_SHIFT(UVD_CGC_CTRL, CLK_GATE_DLY_TIMER)) |
>> -        (4 << REG_FIELD_SHIFT(UVD_CGC_CTRL, CLK_OFF_DELAY));
>> -
>> -    data &= ~(UVD_CGC_CTRL__UDEC_RE_MODE_MASK |
>> -            UVD_CGC_CTRL__UDEC_CM_MODE_MASK |
>> -            UVD_CGC_CTRL__UDEC_IT_MODE_MASK |
>> -            UVD_CGC_CTRL__UDEC_DB_MODE_MASK |
>> -            UVD_CGC_CTRL__UDEC_MP_MODE_MASK |
>> -            UVD_CGC_CTRL__SYS_MODE_MASK |
>> -            UVD_CGC_CTRL__UDEC_MODE_MASK |
>> -            UVD_CGC_CTRL__MPEG2_MODE_MASK |
>> -            UVD_CGC_CTRL__REGS_MODE_MASK |
>> -            UVD_CGC_CTRL__RBC_MODE_MASK |
>> -            UVD_CGC_CTRL__LMI_MC_MODE_MASK |
>> -            UVD_CGC_CTRL__LMI_UMC_MODE_MASK |
>> -            UVD_CGC_CTRL__IDCT_MODE_MASK |
>> -            UVD_CGC_CTRL__MPRD_MODE_MASK |
>> -            UVD_CGC_CTRL__MPC_MODE_MASK |
>> -            UVD_CGC_CTRL__LBSI_MODE_MASK |
>> -            UVD_CGC_CTRL__LRBBM_MODE_MASK |
>> -            UVD_CGC_CTRL__WCB_MODE_MASK |
>> -            UVD_CGC_CTRL__VCPU_MODE_MASK |
>> -            UVD_CGC_CTRL__JPEG_MODE_MASK |
>> -            UVD_CGC_CTRL__JPEG2_MODE_MASK |
>> -            UVD_CGC_CTRL__SCPU_MODE_MASK);
>> -    data2 &= ~(UVD_SUVD_CGC_CTRL__SRE_MODE_MASK |
>> -            UVD_SUVD_CGC_CTRL__SIT_MODE_MASK |
>> -            UVD_SUVD_CGC_CTRL__SMP_MODE_MASK |
>> -            UVD_SUVD_CGC_CTRL__SCM_MODE_MASK |
>> -            UVD_SUVD_CGC_CTRL__SDB_MODE_MASK);
>> -    data1 |= suvd_flags;
>> -
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_CGC_CTRL, data);
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE, 0);
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE, data1);
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_CTRL, data2);
>> -}
>> -
>> -static void uvd_v7_0_set_hw_clock_gating(struct amdgpu_device *adev)
>> -{
>> -    uint32_t data, data1, cgc_flags, suvd_flags;
>> -
>> -    data = RREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE);
>> -    data1 = RREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE);
>> -
>> -    cgc_flags = UVD_CGC_GATE__SYS_MASK |
>> -        UVD_CGC_GATE__UDEC_MASK |
>> -        UVD_CGC_GATE__MPEG2_MASK |
>> -        UVD_CGC_GATE__RBC_MASK |
>> -        UVD_CGC_GATE__LMI_MC_MASK |
>> -        UVD_CGC_GATE__IDCT_MASK |
>> -        UVD_CGC_GATE__MPRD_MASK |
>> -        UVD_CGC_GATE__MPC_MASK |
>> -        UVD_CGC_GATE__LBSI_MASK |
>> -        UVD_CGC_GATE__LRBBM_MASK |
>> -        UVD_CGC_GATE__UDEC_RE_MASK |
>> -        UVD_CGC_GATE__UDEC_CM_MASK |
>> -        UVD_CGC_GATE__UDEC_IT_MASK |
>> -        UVD_CGC_GATE__UDEC_DB_MASK |
>> -        UVD_CGC_GATE__UDEC_MP_MASK |
>> -        UVD_CGC_GATE__WCB_MASK |
>> -        UVD_CGC_GATE__VCPU_MASK |
>> -        UVD_CGC_GATE__SCPU_MASK |
>> -        UVD_CGC_GATE__JPEG_MASK |
>> -        UVD_CGC_GATE__JPEG2_MASK;
>> -
>> -    suvd_flags = UVD_SUVD_CGC_GATE__SRE_MASK |
>> -                UVD_SUVD_CGC_GATE__SIT_MASK |
>> -                UVD_SUVD_CGC_GATE__SMP_MASK |
>> -                UVD_SUVD_CGC_GATE__SCM_MASK |
>> -                UVD_SUVD_CGC_GATE__SDB_MASK;
>> -
>> -    data |= cgc_flags;
>> -    data1 |= suvd_flags;
>> -
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_CGC_GATE, data);
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_SUVD_CGC_GATE, data1);
>> -}
>> -
>> -static void uvd_v7_0_set_bypass_mode(struct amdgpu_device *adev, 
>> bool enable)
>> -{
>> -    u32 tmp = RREG32_SMC(ixGCK_DFS_BYPASS_CNTL);
>> -
>> -    if (enable)
>> -        tmp |= (GCK_DFS_BYPASS_CNTL__BYPASSDCLK_MASK |
>> -            GCK_DFS_BYPASS_CNTL__BYPASSVCLK_MASK);
>> -    else
>> -        tmp &= ~(GCK_DFS_BYPASS_CNTL__BYPASSDCLK_MASK |
>> -             GCK_DFS_BYPASS_CNTL__BYPASSVCLK_MASK);
>> -
>> -    WREG32_SMC(ixGCK_DFS_BYPASS_CNTL, tmp);
>> -}
>> -
>> -
>> -static int uvd_v7_0_set_clockgating_state(void *handle,
>> -                      enum amd_clockgating_state state)
>> -{
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE);
>> -    struct amdgpu_ip_block *ip_block;
>> -
>> -    ip_block = amdgpu_device_ip_get_ip_block(adev, 
>> AMD_IP_BLOCK_TYPE_UVD);
>> -    if (!ip_block)
>> -        return -EINVAL;
>> -
>> -    uvd_v7_0_set_bypass_mode(adev, enable);
>> -
>> -    if (!(adev->cg_flags & AMD_CG_SUPPORT_UVD_MGCG))
>> -        return 0;
>> -
>> -    if (enable) {
>> -        /* disable HW gating and enable Sw gating */
>> -        uvd_v7_0_set_sw_clock_gating(adev);
>> -    } else {
>> -        /* wait for STATUS to clear */
>> -        if (uvd_v7_0_wait_for_idle(ip_block))
>> -            return -EBUSY;
>> -
>> -        /* enable HW gates because UVD is idle */
>> -        /* uvd_v7_0_set_hw_clock_gating(adev); */
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static int uvd_v7_0_set_powergating_state(void *handle,
>> -                      enum amd_powergating_state state)
>> -{
>> -    /* This doesn't actually powergate the UVD block.
>> -     * That's done in the dpm code via the SMC.  This
>> -     * just re-inits the block as necessary.  The actual
>> -     * gating still happens in the dpm code.  We should
>> -     * revisit this when there is a cleaner line between
>> -     * the smc and the hw blocks
>> -     */
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -
>> -    if (!(adev->pg_flags & AMD_PG_SUPPORT_UVD))
>> -        return 0;
>> -
>> -    WREG32_SOC15(UVD, ring->me, mmUVD_POWER_STATUS, 
>> UVD_POWER_STATUS__UVD_PG_EN_MASK);
>> -
>> -    if (state == AMD_PG_STATE_GATE) {
>> -        uvd_v7_0_stop(adev);
>> -        return 0;
>> -    } else {
>> -        return uvd_v7_0_start(adev);
>> -    }
>> -}
>> -#endif
>> -
>> -static int uvd_v7_0_set_clockgating_state(void *handle,
>> -                      enum amd_clockgating_state state)
>> -{
>> -    /* needed for driver unload*/
>> -    return 0;
>> -}
>> -
>>   const struct amd_ip_funcs uvd_v7_0_ip_funcs = {
>>       .name = "uvd_v7_0",
>>       .early_init = uvd_v7_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = uvd_v7_0_sw_init,
>>       .sw_fini = uvd_v7_0_sw_fini,
>>       .hw_init = uvd_v7_0_hw_init,
>> @@ -1797,14 +1521,6 @@ const struct amd_ip_funcs uvd_v7_0_ip_funcs = {
>>       .prepare_suspend = uvd_v7_0_prepare_suspend,
>>       .suspend = uvd_v7_0_suspend,
>>       .resume = uvd_v7_0_resume,
>> -    .is_idle = NULL /* uvd_v7_0_is_idle */,
>> -    .wait_for_idle = NULL /* uvd_v7_0_wait_for_idle */,
>> -    .check_soft_reset = NULL /* uvd_v7_0_check_soft_reset */,
>> -    .pre_soft_reset = NULL /* uvd_v7_0_pre_soft_reset */,
>> -    .soft_reset = NULL /* uvd_v7_0_soft_reset */,
>> -    .post_soft_reset = NULL /* uvd_v7_0_post_soft_reset */,
>> -    .set_clockgating_state = uvd_v7_0_set_clockgating_state,
>> -    .set_powergating_state = NULL /* uvd_v7_0_set_powergating_state */,
>>   };
>>     static const struct amdgpu_ring_funcs uvd_v7_0_ring_vm_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> index a4531000ec0b..c1ed91b39415 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
>> @@ -617,7 +617,6 @@ static int vce_v2_0_set_powergating_state(void 
>> *handle,
>>   static const struct amd_ip_funcs vce_v2_0_ip_funcs = {
>>       .name = "vce_v2_0",
>>       .early_init = vce_v2_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vce_v2_0_sw_init,
>>       .sw_fini = vce_v2_0_sw_fini,
>>       .hw_init = vce_v2_0_hw_init,
>> @@ -629,8 +628,6 @@ static const struct amd_ip_funcs 
>> vce_v2_0_ip_funcs = {
>>       .soft_reset = vce_v2_0_soft_reset,
>>       .set_clockgating_state = vce_v2_0_set_clockgating_state,
>>       .set_powergating_state = vce_v2_0_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs vce_v2_0_ring_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> index 9f9a9d89bcdc..6bb318a06f19 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
>> @@ -896,7 +896,6 @@ static void vce_v3_0_emit_pipeline_sync(struct 
>> amdgpu_ring *ring)
>>   static const struct amd_ip_funcs vce_v3_0_ip_funcs = {
>>       .name = "vce_v3_0",
>>       .early_init = vce_v3_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vce_v3_0_sw_init,
>>       .sw_fini = vce_v3_0_sw_fini,
>>       .hw_init = vce_v3_0_hw_init,
>> @@ -912,8 +911,6 @@ static const struct amd_ip_funcs 
>> vce_v3_0_ip_funcs = {
>>       .set_clockgating_state = vce_v3_0_set_clockgating_state,
>>       .set_powergating_state = vce_v3_0_set_powergating_state,
>>       .get_clockgating_state = vce_v3_0_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ring_funcs vce_v3_0_ring_phys_funcs = {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> index f4d2650e6b7a..da78f69da724 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
>> @@ -543,7 +543,6 @@ static int vce_v4_0_hw_fini(struct 
>> amdgpu_ip_block *ip_block)
>>       cancel_delayed_work_sync(&adev->vce.idle_work);
>>         if (!amdgpu_sriov_vf(adev)) {
>> -        /* vce_v4_0_wait_for_idle(ip_block); */
>>           vce_v4_0_stop(adev);
>>       } else {
>>           /* full access mode, so don't touch any VCE register */
>> @@ -691,273 +690,6 @@ static int vce_v4_0_set_clockgating_state(void 
>> *handle,
>>       return 0;
>>   }
>>   -#if 0
>> -static bool vce_v4_0_is_idle(void *handle)
>> -{
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    u32 mask = 0;
>> -
>> -    mask |= (adev->vce.harvest_config & AMDGPU_VCE_HARVEST_VCE0) ? 0 
>> : SRBM_STATUS2__VCE0_BUSY_MASK;
>> -    mask |= (adev->vce.harvest_config & AMDGPU_VCE_HARVEST_VCE1) ? 0 
>> : SRBM_STATUS2__VCE1_BUSY_MASK;
>> -
>> -    return !(RREG32(mmSRBM_STATUS2) & mask);
>> -}
>> -
>> -static int vce_v4_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
>> -{
>> -    unsigned i;
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    for (i = 0; i < adev->usec_timeout; i++)
>> -        if (vce_v4_0_is_idle(handle))
>> -            return 0;
>> -
>> -    return -ETIMEDOUT;
>> -}
>> -
>> -#define  VCE_STATUS_VCPU_REPORT_AUTO_BUSY_MASK  0x00000008L /* 
>> AUTO_BUSY */
>> -#define  VCE_STATUS_VCPU_REPORT_RB0_BUSY_MASK   0x00000010L /* 
>> RB0_BUSY */
>> -#define  VCE_STATUS_VCPU_REPORT_RB1_BUSY_MASK   0x00000020L /* 
>> RB1_BUSY */
>> -#define  AMDGPU_VCE_STATUS_BUSY_MASK 
>> (VCE_STATUS_VCPU_REPORT_AUTO_BUSY_MASK | \
>> -                      VCE_STATUS_VCPU_REPORT_RB0_BUSY_MASK)
>> -
>> -static bool vce_v4_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -    u32 srbm_soft_reset = 0;
>> -
>> -    /* According to VCE team , we should use VCE_STATUS instead
>> -     * SRBM_STATUS.VCE_BUSY bit for busy status checking.
>> -     * GRBM_GFX_INDEX.INSTANCE_INDEX is used to specify which VCE
>> -     * instance's registers are accessed
>> -     * (0 for 1st instance, 10 for 2nd instance).
>> -     *
>> -     *VCE_STATUS
>> -     *|UENC|ACPI|AUTO ACTIVE|RB1 |RB0 |RB2 | |FW_LOADED|JOB |
>> - *|----+----+-----------+----+----+----+----------+---------+----|
>> -     *|bit8|bit7|    bit6   |bit5|bit4|bit3|   bit2   |  bit1 |bit0|
>> -     *
>> -     * VCE team suggest use bit 3--bit 6 for busy status check
>> -     */
>> -    mutex_lock(&adev->grbm_idx_mutex);
>> -    WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0);
>> -    if (RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_STATUS) & 
>> AMDGPU_VCE_STATUS_BUSY_MASK) {
>> -        srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, 
>> SRBM_SOFT_RESET, SOFT_RESET_VCE0, 1);
>> -        srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, 
>> SRBM_SOFT_RESET, SOFT_RESET_VCE1, 1);
>> -    }
>> -    WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0x10);
>> -    if (RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_STATUS) & 
>> AMDGPU_VCE_STATUS_BUSY_MASK) {
>> -        srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, 
>> SRBM_SOFT_RESET, SOFT_RESET_VCE0, 1);
>> -        srbm_soft_reset = REG_SET_FIELD(srbm_soft_reset, 
>> SRBM_SOFT_RESET, SOFT_RESET_VCE1, 1);
>> -    }
>> -    WREG32_FIELD(GRBM_GFX_INDEX, INSTANCE_INDEX, 0);
>> -    mutex_unlock(&adev->grbm_idx_mutex);
>> -
>> -    if (srbm_soft_reset) {
>> -        adev->vce.srbm_soft_reset = srbm_soft_reset;
>> -        return true;
>> -    } else {
>> -        adev->vce.srbm_soft_reset = 0;
>> -        return false;
>> -    }
>> -}
>> -
>> -static int vce_v4_0_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -    u32 srbm_soft_reset;
>> -
>> -    if (!adev->vce.srbm_soft_reset)
>> -        return 0;
>> -    srbm_soft_reset = adev->vce.srbm_soft_reset;
>> -
>> -    if (srbm_soft_reset) {
>> -        u32 tmp;
>> -
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -        tmp |= srbm_soft_reset;
>> -        dev_info(adev->dev, "SRBM_SOFT_RESET=0x%08X\n", tmp);
>> -        WREG32(mmSRBM_SOFT_RESET, tmp);
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -
>> -        udelay(50);
>> -
>> -        tmp &= ~srbm_soft_reset;
>> -        WREG32(mmSRBM_SOFT_RESET, tmp);
>> -        tmp = RREG32(mmSRBM_SOFT_RESET);
>> -
>> -        /* Wait a little for things to settle down */
>> -        udelay(50);
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> -static int vce_v4_0_pre_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    if (!adev->vce.srbm_soft_reset)
>> -        return 0;
>> -
>> -    mdelay(5);
>> -
>> -    return vce_v4_0_suspend(adev);
>> -}
>> -
>> -
>> -static int vce_v4_0_post_soft_reset(struct amdgpu_ip_block *ip_block)
>> -{
>> -    struct amdgpu_device *adev = ip_block->adev;
>> -
>> -    if (!adev->vce.srbm_soft_reset)
>> -        return 0;
>> -
>> -    mdelay(5);
>> -
>> -    return vce_v4_0_resume(adev);
>> -}
>> -
>> -static void vce_v4_0_override_vce_clock_gating(struct amdgpu_device 
>> *adev, bool override)
>> -{
>> -    u32 tmp, data;
>> -
>> -    tmp = data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_RB_ARB_CTRL));
>> -    if (override)
>> -        data |= VCE_RB_ARB_CTRL__VCE_CGTT_OVERRIDE_MASK;
>> -    else
>> -        data &= ~VCE_RB_ARB_CTRL__VCE_CGTT_OVERRIDE_MASK;
>> -
>> -    if (tmp != data)
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_RB_ARB_CTRL), data);
>> -}
>> -
>> -static void vce_v4_0_set_vce_sw_clock_gating(struct amdgpu_device 
>> *adev,
>> -                         bool gated)
>> -{
>> -    u32 data;
>> -
>> -    /* Set Override to disable Clock Gating */
>> -    vce_v4_0_override_vce_clock_gating(adev, true);
>> -
>> -    /* This function enables MGCG which is controlled by firmware.
>> -       With the clocks in the gated state the core is still
>> -       accessible but the firmware will throttle the clocks on the
>> -       fly as necessary.
>> -    */
>> -    if (gated) {
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B));
>> -        data |= 0x1ff;
>> -        data &= ~0xef0000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B), data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_CLOCK_GATING));
>> -        data |= 0x3ff000;
>> -        data &= ~0xffc00000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING), 
>> data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_CLOCK_GATING_2));
>> -        data |= 0x2;
>> -        data &= ~0x00010000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2), 
>> data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_REG_CLOCK_GATING));
>> -        data |= 0x37f;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_REG_CLOCK_GATING), data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_DMA_DCLK_CTRL));
>> -        data |= VCE_UENC_DMA_DCLK_CTRL__WRDMCLK_FORCEON_MASK |
>> -            VCE_UENC_DMA_DCLK_CTRL__RDDMCLK_FORCEON_MASK |
>> -            VCE_UENC_DMA_DCLK_CTRL__REGCLK_FORCEON_MASK  |
>> -            0x8;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL), 
>> data);
>> -    } else {
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B));
>> -        data &= ~0x80010;
>> -        data |= 0xe70008;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_B), data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_CLOCK_GATING));
>> -        data |= 0xffc00000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING), 
>> data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_CLOCK_GATING_2));
>> -        data |= 0x10000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING_2), 
>> data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_REG_CLOCK_GATING));
>> -        data &= ~0xffc00000;
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_REG_CLOCK_GATING), data);
>> -
>> -        data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_DMA_DCLK_CTRL));
>> -        data &= ~(VCE_UENC_DMA_DCLK_CTRL__WRDMCLK_FORCEON_MASK |
>> -              VCE_UENC_DMA_DCLK_CTRL__RDDMCLK_FORCEON_MASK |
>> -              VCE_UENC_DMA_DCLK_CTRL__REGCLK_FORCEON_MASK  |
>> -              0x8);
>> -        WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_DMA_DCLK_CTRL), 
>> data);
>> -    }
>> -    vce_v4_0_override_vce_clock_gating(adev, false);
>> -}
>> -
>> -static void vce_v4_0_set_bypass_mode(struct amdgpu_device *adev, 
>> bool enable)
>> -{
>> -    u32 tmp = RREG32_SMC(ixGCK_DFS_BYPASS_CNTL);
>> -
>> -    if (enable)
>> -        tmp |= GCK_DFS_BYPASS_CNTL__BYPASSECLK_MASK;
>> -    else
>> -        tmp &= ~GCK_DFS_BYPASS_CNTL__BYPASSECLK_MASK;
>> -
>> -    WREG32_SMC(ixGCK_DFS_BYPASS_CNTL, tmp);
>> -}
>> -
>> -static int vce_v4_0_set_clockgating_state(void *handle,
>> -                      enum amd_clockgating_state state)
>> -{
>> -    struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> -    bool enable = (state == AMD_CG_STATE_GATE);
>> -    int i;
>> -
>> -    if ((adev->asic_type == CHIP_POLARIS10) ||
>> -        (adev->asic_type == CHIP_TONGA) ||
>> -        (adev->asic_type == CHIP_FIJI))
>> -        vce_v4_0_set_bypass_mode(adev, enable);
>> -
>> -    if (!(adev->cg_flags & AMD_CG_SUPPORT_VCE_MGCG))
>> -        return 0;
>> -
>> -    mutex_lock(&adev->grbm_idx_mutex);
>> -    for (i = 0; i < 2; i++) {
>> -        /* Program VCE Instance 0 or 1 if not harvested */
>> -        if (adev->vce.harvest_config & (1 << i))
>> -            continue;
>> -
>> -        WREG32_FIELD(GRBM_GFX_INDEX, VCE_INSTANCE, i);
>> -
>> -        if (enable) {
>> -            /* initialize VCE_CLOCK_GATING_A: Clock ON/OFF delay */
>> -            uint32_t data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_CLOCK_GATING_A);
>> -            data &= ~(0xf | 0xff0);
>> -            data |= ((0x0 << 0) | (0x04 << 4));
>> -            WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_CLOCK_GATING_A, 
>> data);
>> -
>> -            /* initialize VCE_UENC_CLOCK_GATING: Clock ON/OFF delay */
>> -            data = RREG32(SOC15_REG_OFFSET(VCE, 0, 
>> mmVCE_UENC_CLOCK_GATING);
>> -            data &= ~(0xf | 0xff0);
>> -            data |= ((0x0 << 0) | (0x04 << 4));
>> -            WREG32(SOC15_REG_OFFSET(VCE, 0, mmVCE_UENC_CLOCK_GATING, 
>> data);
>> -        }
>> -
>> -        vce_v4_0_set_vce_sw_clock_gating(adev, enable);
>> -    }
>> -
>> -    WREG32_FIELD(GRBM_GFX_INDEX, VCE_INSTANCE, 0);
>> -    mutex_unlock(&adev->grbm_idx_mutex);
>> -
>> -    return 0;
>> -}
>> -#endif
>> -
>>   static int vce_v4_0_set_powergating_state(void *handle,
>>                         enum amd_powergating_state state)
>>   {
>> @@ -1076,19 +808,12 @@ static int vce_v4_0_process_interrupt(struct 
>> amdgpu_device *adev,
>>   const struct amd_ip_funcs vce_v4_0_ip_funcs = {
>>       .name = "vce_v4_0",
>>       .early_init = vce_v4_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vce_v4_0_sw_init,
>>       .sw_fini = vce_v4_0_sw_fini,
>>       .hw_init = vce_v4_0_hw_init,
>>       .hw_fini = vce_v4_0_hw_fini,
>>       .suspend = vce_v4_0_suspend,
>>       .resume = vce_v4_0_resume,
>> -    .is_idle = NULL /* vce_v4_0_is_idle */,
>> -    .wait_for_idle = NULL /* vce_v4_0_wait_for_idle */,
>> -    .check_soft_reset = NULL /* vce_v4_0_check_soft_reset */,
>> -    .pre_soft_reset = NULL /* vce_v4_0_pre_soft_reset */,
>> -    .soft_reset = NULL /* vce_v4_0_soft_reset */,
>> -    .post_soft_reset = NULL /* vce_v4_0_post_soft_reset */,
>>       .set_clockgating_state = vce_v4_0_set_clockgating_state,
>>       .set_powergating_state = vce_v4_0_set_powergating_state,
>>   };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> index 129c759772c2..497b5d93a58b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
>> @@ -1987,7 +1987,6 @@ static void vcn_v1_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
>>       .name = "vcn_v1_0",
>>       .early_init = vcn_v1_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v1_0_sw_init,
>>       .sw_fini = vcn_v1_0_sw_fini,
>>       .hw_init = vcn_v1_0_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> index 19bbd49f760e..e0322cbca3ec 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
>> @@ -2095,7 +2095,6 @@ static void vcn_v2_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
>>       .name = "vcn_v2_0",
>>       .early_init = vcn_v2_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v2_0_sw_init,
>>       .sw_fini = vcn_v2_0_sw_fini,
>>       .hw_init = vcn_v2_0_hw_init,
>> @@ -2104,10 +2103,6 @@ static const struct amd_ip_funcs 
>> vcn_v2_0_ip_funcs = {
>>       .resume = vcn_v2_0_resume,
>>       .is_idle = vcn_v2_0_is_idle,
>>       .wait_for_idle = vcn_v2_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v2_0_set_clockgating_state,
>>       .set_powergating_state = vcn_v2_0_set_powergating_state,
>>       .dump_ip_state = vcn_v2_0_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> index 30420ead7fc4..6aa08281d094 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
>> @@ -1987,7 +1987,6 @@ static void vcn_v2_5_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
>>       .name = "vcn_v2_5",
>>       .early_init = vcn_v2_5_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v2_5_sw_init,
>>       .sw_fini = vcn_v2_5_sw_fini,
>>       .hw_init = vcn_v2_5_hw_init,
>> @@ -1996,10 +1995,6 @@ static const struct amd_ip_funcs 
>> vcn_v2_5_ip_funcs = {
>>       .resume = vcn_v2_5_resume,
>>       .is_idle = vcn_v2_5_is_idle,
>>       .wait_for_idle = vcn_v2_5_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v2_5_set_clockgating_state,
>>       .set_powergating_state = vcn_v2_5_set_powergating_state,
>>       .dump_ip_state = vcn_v2_5_dump_ip_state,
>> @@ -2009,7 +2004,6 @@ static const struct amd_ip_funcs 
>> vcn_v2_5_ip_funcs = {
>>   static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
>>           .name = "vcn_v2_6",
>>           .early_init = vcn_v2_5_early_init,
>> -        .late_init = NULL,
>>           .sw_init = vcn_v2_5_sw_init,
>>           .sw_fini = vcn_v2_5_sw_fini,
>>           .hw_init = vcn_v2_5_hw_init,
>> @@ -2018,10 +2012,6 @@ static const struct amd_ip_funcs 
>> vcn_v2_6_ip_funcs = {
>>           .resume = vcn_v2_5_resume,
>>           .is_idle = vcn_v2_5_is_idle,
>>           .wait_for_idle = vcn_v2_5_wait_for_idle,
>> -        .check_soft_reset = NULL,
>> -        .pre_soft_reset = NULL,
>> -        .soft_reset = NULL,
>> -        .post_soft_reset = NULL,
>>           .set_clockgating_state = vcn_v2_5_set_clockgating_state,
>>           .set_powergating_state = vcn_v2_5_set_powergating_state,
>>       .dump_ip_state = vcn_v2_5_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> index 13632c22d2f9..6732ad7f16f5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
>> @@ -2313,7 +2313,6 @@ static void vcn_v3_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
>>       .name = "vcn_v3_0",
>>       .early_init = vcn_v3_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v3_0_sw_init,
>>       .sw_fini = vcn_v3_0_sw_fini,
>>       .hw_init = vcn_v3_0_hw_init,
>> @@ -2322,10 +2321,6 @@ static const struct amd_ip_funcs 
>> vcn_v3_0_ip_funcs = {
>>       .resume = vcn_v3_0_resume,
>>       .is_idle = vcn_v3_0_is_idle,
>>       .wait_for_idle = vcn_v3_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v3_0_set_clockgating_state,
>>       .set_powergating_state = vcn_v3_0_set_powergating_state,
>>       .dump_ip_state = vcn_v3_0_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> index e7b7a8150ea7..5512259cac79 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
>> @@ -2220,7 +2220,6 @@ static void vcn_v4_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
>>       .name = "vcn_v4_0",
>>       .early_init = vcn_v4_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v4_0_sw_init,
>>       .sw_fini = vcn_v4_0_sw_fini,
>>       .hw_init = vcn_v4_0_hw_init,
>> @@ -2229,10 +2228,6 @@ static const struct amd_ip_funcs 
>> vcn_v4_0_ip_funcs = {
>>       .resume = vcn_v4_0_resume,
>>       .is_idle = vcn_v4_0_is_idle,
>>       .wait_for_idle = vcn_v4_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v4_0_set_clockgating_state,
>>       .set_powergating_state = vcn_v4_0_set_powergating_state,
>>       .dump_ip_state = vcn_v4_0_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> index 6dcae398b2dc..0d5c94bfc0ef 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
>> @@ -1796,7 +1796,6 @@ static void vcn_v4_0_3_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v4_0_3_ip_funcs = {
>>       .name = "vcn_v4_0_3",
>>       .early_init = vcn_v4_0_3_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v4_0_3_sw_init,
>>       .sw_fini = vcn_v4_0_3_sw_fini,
>>       .hw_init = vcn_v4_0_3_hw_init,
>> @@ -1805,10 +1804,6 @@ static const struct amd_ip_funcs 
>> vcn_v4_0_3_ip_funcs = {
>>       .resume = vcn_v4_0_3_resume,
>>       .is_idle = vcn_v4_0_3_is_idle,
>>       .wait_for_idle = vcn_v4_0_3_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v4_0_3_set_clockgating_state,
>>       .set_powergating_state = vcn_v4_0_3_set_powergating_state,
>>       .dump_ip_state = vcn_v4_0_3_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> index edb9cd8390b6..71961fb3f7ff 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
>> @@ -1678,7 +1678,6 @@ static void vcn_v4_0_5_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
>>       .name = "vcn_v4_0_5",
>>       .early_init = vcn_v4_0_5_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v4_0_5_sw_init,
>>       .sw_fini = vcn_v4_0_5_sw_fini,
>>       .hw_init = vcn_v4_0_5_hw_init,
>> @@ -1687,10 +1686,6 @@ static const struct amd_ip_funcs 
>> vcn_v4_0_5_ip_funcs = {
>>       .resume = vcn_v4_0_5_resume,
>>       .is_idle = vcn_v4_0_5_is_idle,
>>       .wait_for_idle = vcn_v4_0_5_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v4_0_5_set_clockgating_state,
>>       .set_powergating_state = vcn_v4_0_5_set_powergating_state,
>>       .dump_ip_state = vcn_v4_0_5_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c 
>> b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> index 89bf29fa6f8d..fe2cc1a80c13 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
>> @@ -1404,7 +1404,6 @@ static void vcn_v5_0_dump_ip_state(struct 
>> amdgpu_ip_block *ip_block)
>>   static const struct amd_ip_funcs vcn_v5_0_0_ip_funcs = {
>>       .name = "vcn_v5_0_0",
>>       .early_init = vcn_v5_0_0_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vcn_v5_0_0_sw_init,
>>       .sw_fini = vcn_v5_0_0_sw_fini,
>>       .hw_init = vcn_v5_0_0_hw_init,
>> @@ -1413,10 +1412,6 @@ static const struct amd_ip_funcs 
>> vcn_v5_0_0_ip_funcs = {
>>       .resume = vcn_v5_0_0_resume,
>>       .is_idle = vcn_v5_0_0_is_idle,
>>       .wait_for_idle = vcn_v5_0_0_wait_for_idle,
>> -    .check_soft_reset = NULL,
>> -    .pre_soft_reset = NULL,
>> -    .soft_reset = NULL,
>> -    .post_soft_reset = NULL,
>>       .set_clockgating_state = vcn_v5_0_0_set_clockgating_state,
>>       .set_powergating_state = vcn_v5_0_0_set_powergating_state,
>>       .dump_ip_state = vcn_v5_0_dump_ip_state,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index 73de5909f655..0fedadd0a6a4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -625,7 +625,6 @@ static int vega10_ih_set_powergating_state(void 
>> *handle,
>>   const struct amd_ip_funcs vega10_ih_ip_funcs = {
>>       .name = "vega10_ih",
>>       .early_init = vega10_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vega10_ih_sw_init,
>>       .sw_fini = vega10_ih_sw_fini,
>>       .hw_init = vega10_ih_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c 
>> b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> index a42404a58015..b7e3fb4628b2 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega20_ih.c
>> @@ -690,7 +690,6 @@ static int vega20_ih_set_powergating_state(void 
>> *handle,
>>   const struct amd_ip_funcs vega20_ih_ip_funcs = {
>>       .name = "vega20_ih",
>>       .early_init = vega20_ih_early_init,
>> -    .late_init = NULL,
>>       .sw_init = vega20_ih_sw_init,
>>       .sw_fini = vega20_ih_sw_fini,
>>       .hw_init = vega20_ih_hw_init,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c 
>> b/drivers/gpu/drm/amd/amdgpu/vi.c
>> index 607b48a2d5eb..b3fa54c0514e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
>> @@ -2036,8 +2036,6 @@ static const struct amd_ip_funcs 
>> vi_common_ip_funcs = {
>>       .set_clockgating_state = vi_common_set_clockgating_state,
>>       .set_powergating_state = vi_common_set_powergating_state,
>>       .get_clockgating_state = vi_common_get_clockgating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     static const struct amdgpu_ip_block_version vi_common_ip_block =
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index a4882b16ace2..5e9854f5d276 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3407,8 +3407,6 @@ static const struct amd_ip_funcs 
>> amdgpu_dm_funcs = {
>>       .soft_reset = dm_soft_reset,
>>       .set_clockgating_state = dm_set_clockgating_state,
>>       .set_powergating_state = dm_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version dm_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c 
>> b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> index 785cb20e64b6..8908646ad620 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
>> @@ -3304,8 +3304,6 @@ static const struct amd_ip_funcs 
>> kv_dpm_ip_funcs = {
>>       .is_idle = kv_dpm_is_idle,
>>       .set_clockgating_state = kv_dpm_set_clockgating_state,
>>       .set_powergating_state = kv_dpm_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version kv_smu_ip_block = {
>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c 
>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> index 7b0ded50251a..ee23a0f897c5 100644
>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
>> @@ -8046,8 +8046,6 @@ static const struct amd_ip_funcs 
>> si_dpm_ip_funcs = {
>>       .wait_for_idle = si_dpm_wait_for_idle,
>>       .set_clockgating_state = si_dpm_set_clockgating_state,
>>       .set_powergating_state = si_dpm_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version si_smu_ip_block =
>> diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c 
>> b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> index 5aadb6061c22..26624a716fc6 100644
>> --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
>> @@ -287,8 +287,6 @@ static const struct amd_ip_funcs pp_ip_funcs = {
>>       .is_idle = pp_is_idle,
>>       .set_clockgating_state = pp_set_clockgating_state,
>>       .set_powergating_state = pp_set_powergating_state,
>> -    .dump_ip_state = NULL,
>> -    .print_ip_state = NULL,
>>   };
>>     const struct amdgpu_ip_block_version pp_smu_ip_block =
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c 
>> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index accc96a03bd9..277169c2f711 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -2580,10 +2580,6 @@ const struct amd_ip_funcs smu_ip_funcs = {
>>       .late_fini = smu_late_fini,
>>       .suspend = smu_suspend,
>>       .resume = smu_resume,
>> -    .is_idle = NULL,
>> -    .check_soft_reset = NULL,
>> -    .wait_for_idle = NULL,
>> -    .soft_reset = NULL,
>>       .set_clockgating_state = smu_set_clockgating_state,
>>       .set_powergating_state = smu_set_powergating_state,
>>   };
>
