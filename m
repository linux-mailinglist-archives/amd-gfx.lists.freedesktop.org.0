Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM6RCwHF8mkjuAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Apr 2026 04:57:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D025049C9DD
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Apr 2026 04:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE7D10F1DD;
	Thu, 30 Apr 2026 02:57:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E5XiTwvq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4131410F1DD;
 Thu, 30 Apr 2026 02:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xImaRP/4wDtBvvEYKGC4KemEXs3x+yTli7phnhTPU86HO0Qb2SeCER+2wIRPfmxuJEeiI8KxUtFhNhtNnS89Y7P2XlSSGoSelZy66xySNZaX8kS+WCQR+KcYcxQOjdgVvmAn+xgVOYSQtj7ijPOZnB990HCydOk5R391kvIxsnvhFq+Zo0rFwfgxFfOpC239wBYMCfwUqvvkOqsjhPdgw6ocZB949pk0B2Rwrj4c+0PsPkI2dsnBUWqgWAxZpGISglX7Xkwn3lVE7Td5eLaEusxspN6r9nMkGcWKZukxBQ+QAIOOzDPuT/49psCweMzoYtYwZa2RqVj4oceh1DSjNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nw7adUFgzFwMSS/qdKdC4XmySbM5Uyz5pqcydjRpyQ=;
 b=Xd+ZsTMnCEqDd8xNbhUYFnIVJ44HwVaIflFVLTtaosJol67b1geRZ7Cku89g4smTumKxMbn3qVeMxqjbo+uAx6J87Vh6k92EjH5j/pQb4NvC+tjsB6HlMUTuX1oYJ9BOMaelnELnS8HT8IJRCCpnTqqvkf1dgyeiShxNnGSX1+DhCY/nk7WYT5zdzmGuIkNvawoIGjoD8vxRwwOL4sjewLtRDp9cnjEG0Y5fvDUxvYqS+vmlUph2OejO0r/iyIdl52L193So8EnJ4UtXa+BzgzeMuRE6JYfhXTObdxATbZp+a55PF2qT8D8OnmPIcvyoU2/brfYQcRf6w3seBblRlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nw7adUFgzFwMSS/qdKdC4XmySbM5Uyz5pqcydjRpyQ=;
 b=E5XiTwvqOE6QL6fnSoRmO4GxuQh5Ih+kUk5DSxc1hbQJuiSdjNkZWlr9Jvde1ji4TRtwJByQYVOMOkZni1HICSkUXYRDVstS5P3o5u6OSnHsAYoTmjS2wRBaR7cAocpRgoUVXF0yaEVK5BZt0D1hxXXlGFFiuJ2NSB2yqoPHv5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 02:56:58 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 02:56:58 +0000
Message-ID: <02ded343-38bd-4621-83fd-78a027eb96e2@amd.com>
Date: Thu, 30 Apr 2026 10:56:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/POC PATCH 00/12] POC SVM implementation in AMDGPU based on
 drm_gpusvm
From: "Huang, Honglei1" <honghuan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zeng, Oak"
 <Oak.Zeng@amd.com>, "Liu, Jenny (Jing)" <Jenny-Jing.Liu@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>, "Chen, Xiaogang"
 <Xiaogang.Chen@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Zhu, Lingshan" <Lingshan.Zhu@amd.com>, "Shen, Junhua"
 <Junhua.Shen@amd.com>, yiru.ma@amd.com, "sima@ffwll.ch" <sima@ffwll.ch>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20260317112958.2925370-1-honglei1.huang@amd.com>
 <e21e8e1a-4d2e-40e9-bbb7-2764cf33e760@amd.com>
 <ae5fe946-4756-43b4-848f-3b545ac61ba7@amd.com>
 <abuE0KBPtAZM9Bo0@lstrano-desk.jf.intel.com>
 <098d5d68-f218-4cee-8b73-201e7012a287@amd.com>
 <acDeRhCTh/ehOUyu@lstrano-desk.jf.intel.com>
 <a9d979e7-6ff1-47c5-87c5-b905e5c84ded@amd.com>
 <aenBy61U66DkSZUl@gsse-cloud1.jf.intel.com>
 <7a1ba278-1201-4585-b35b-3fb2cec6035f@amd.com>
 <5e44f013-a1c1-4621-9eea-e4f2459f223e@amd.com>
Content-Language: en-US
In-Reply-To: <5e44f013-a1c1-4621-9eea-e4f2459f223e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0013.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::18) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 026fe295-e9de-4013-2c2b-08dea66424c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: fb9v9qVbkc0pdZWLxZq/aZ/3UQTqJbTMaNJQNBzFDOV+7od8eiAYzAvW0DWibvFJo67hsCMTqLCIZZxDVLRJ+JCr9lUJfnhapJq9gav7orEo80BebZV4TBtmI+CBDL09ZTSERsQRtUum8f6rp9otAjP6jM11XCtERKEUvmSot8y9Kn3v9G/ZQQuASHyKAsl2qL1vh3yWhDrC+EApCVVV+2Jklnigd3SWADebvhuFPMv3qtBcgWgtJONvCzLxD+BeYBIiHrJ+wXKPIi5cDMhTOiO5EyWugXwIIAP4YkfIGvslMzD7R2kpBhubre1/hpWEAuINngdG9jntnTbxhTDuCmIN8mYCmQ+reRFmj86tjmB4gL0843Yf5iDD8XtY1sJa1E8mwKYV4XGu1ABzKuwXXELO8tp+XpLjpUpP7M+4I0DANZRPdxEkMyu9P7NipWXs6GuU/1YgMZI95m9EOOxNvw7krJQCaqt/J3VqUAx7SdeJXuRo4siTzqCG3PamBap1Xh/+yH0eaedSQoIto5bSaiYni+I4Z1OAk6TeZtjr913ywk1dmxFqAE+z3f/3GD/N+ShbexPdNy5fuCZLOj1PuzCD5r9CNEy5loGSvtX22U1JX2hFnzjrT/U+A4Cpmvca1LRGJw5Q8r+Dbieytnw3oiYSwOnvhBEzZ72CbfiFQ3cmrIIuINfVhfZcpkI44Obmownnjc7KqkN9Dd3e0B7aejTytEC02Joyxh4pWun743o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHZHWE9IRWdKSkVJb2oxazdYWUIzUStjNkR1VDZuclBVaGpUWWUyaVVwa0dm?=
 =?utf-8?B?RVNiaG1FZUlKWnJjRnVWMGZqajhLLytHeHlPaGFjV0dUS3lSOUNBcHRxendU?=
 =?utf-8?B?QW5RY0FEbHBaSGI0T3Z5WG1iVlBwMmx6dzNlQ3FaZlljSHJ6cjNndFl5UERv?=
 =?utf-8?B?dTdjZHA0MWpma211K201dENLclRKekk0YVFXYTVMSlhneGdSakVWbjdiU2pp?=
 =?utf-8?B?YVhZZmRIRnpYdXpXS2lOR0tkMDdpaTdOYjVNbFdyMEI0UUsvNW5SaElpWlQ4?=
 =?utf-8?B?WjJpVFBxMGVlRWJsSFJnV0xiUFZteCtlcUZuN3JLZnZxalpqTkV3ekdZbDlZ?=
 =?utf-8?B?T3I1Tm1iOUdmMFo0V3lhSmNWaGhySVNCU3podmlOOWFHUUNpNHBCNzlSVUJQ?=
 =?utf-8?B?K1dodVBvYWVGdTBSY1M4U3ZjQVFqMUEzMzBEamdvelBYZytTTnp1andPdjNi?=
 =?utf-8?B?c3lWNGR0bWRsVm9heHFiZGxIYWhlOXZJUlVRNlJ6cTZibkIrNGFpTysrcGVI?=
 =?utf-8?B?ZWxsSDE5a3pxZDhPTmxBTUVQZTZnU3Mxdy9WMWZPb0ZRcjU1c0RtTitFQzNy?=
 =?utf-8?B?a1c5ZWxvUEpUVEgvQ0RDd3U4ME41UFpaeUc5NmN6czVXUHFaL0pLU2h3T1cw?=
 =?utf-8?B?YmdpNE9NaFo3dDlHcmh4Q29GTC82UDBFekdoTVdWOEZQaWgyTFpMeWJ1MGJv?=
 =?utf-8?B?M1hvajcxcHBHSU5VYko1N29oOERSbGUxdlZnZ3c5SzRNcmFRcDRac3EzS2Rx?=
 =?utf-8?B?NHdTT1FoSndyN3dCejVnVHpiMU52MC9HeExJRTdMUUdPT3RQdEVtbXMwYUV4?=
 =?utf-8?B?MmdRTVNoZjUrSENNN1hxWVdJVElwWXR0RzBoaytMMGplTGhaeXQ5bFpjQzJa?=
 =?utf-8?B?STZyM2FBV0xvQjkzYUJSQ1k0QnJZaHFsNjlDNmd2ZVZDQ1FnYnJQbzgzWFVq?=
 =?utf-8?B?Y0dVbHBHclk4WXI1YTJSRnhneGxVODJQcUphSG1lclM3ZVBZdnpnRVpWa21h?=
 =?utf-8?B?YTQ0NGR4WWVmVHlJb0gvUHZCN010bnMyYWFDSzZGOE5FajJmZnhZekhYT3Vy?=
 =?utf-8?B?M2k4anNLWXprZGx6ZStCbCtMa3BWUURqMS9EN1JDVTN0V1VJMDhSUXc0OWxO?=
 =?utf-8?B?aXJKMUIxOGx6Q3M5R0VBQVJaWHltdjFIN1pvdGRrSm95M2R2MG5zMEtQdU5E?=
 =?utf-8?B?MG1Fc2tPcnF3enlER2FkQ2YyS3M0a0dlQlV4MU5vWWVzRUErd2tmbVorbitt?=
 =?utf-8?B?UUhDNWI1QUlyQ1lmdmRVR1NNUmNCdkRNVk1IL3BiRzFVWFF4TlN3TUZZZFhu?=
 =?utf-8?B?cE9MVDcxcXNoMjBmaWwvbXBNOElCSTlUTTh2dXZTeVZvSWRoaVBFbDY5elE0?=
 =?utf-8?B?NlI0L2Z2ZGlhS1BpbTdwL2hHOUFjZEk1Ty9GcFM2NEJPa0ZnZFFhN05FQnpa?=
 =?utf-8?B?SjV2TDFtYTlEMCsrS0w1U09VZkc2YlJpd0RpV0Vxd3dvRnh4QUtkTW5BRjdR?=
 =?utf-8?B?Ry9MQTZ4T2xYWnhDQlFEbDVYcmxiUG80d2F6c3d5STU0YmlPR3Q3czdZM2hJ?=
 =?utf-8?B?cXFnL1dpRHBRZG40cU5GcFJUbEhpUWZDeHk3Q0NtZFlYNU9wUFpPVy9Oamwr?=
 =?utf-8?B?OWFnOXFZeXhWdGhlRWFSS0IwanBpZnk1cmV1NHVRSEV5NWRnTjFCYVdQZVFm?=
 =?utf-8?B?ejcwNlBuMkJSUW1sczVyUlMvcDhGOTFjaTJ4bTlGWlF6cThQZk96OTNpdmxE?=
 =?utf-8?B?d2JqbTJNY0RjeGY5SjRhU2JKNDdueUNJQTB1Q2w3aHA0MHh1dXZxWngrVjZJ?=
 =?utf-8?B?U2FySFR4UjAwWHpJZjBPSDVzU2xsM09Hb1RKV09LbzZjRS9pbnZJek1hejZn?=
 =?utf-8?B?ODd2ZEpUWloyZWVURGgzTjl1T1FYMmN4YS8vZGl2aWF2SzRpRXpGWTBYT09S?=
 =?utf-8?B?Zkw1ZExGK2wrVUhkRm1XL0ZoQTMxSnJtbWI5V3N4ck1pN0sxdzZRS1RHSTd6?=
 =?utf-8?B?anBsTXUxR1RUK001aVZkc1VsWlorL0c0clRsM2JQdlk0RU9ZaC82T2ViMUxl?=
 =?utf-8?B?N09WNEpFYXRkS2NGQjZTUHZEYXRvaU4xSVFaMVN5dkJCNUIvZDlFZDlWRVRW?=
 =?utf-8?B?L0dudW96d0QzUEJlWlBDNFRQTnVicTA2K3VxNGNpUFFGM0x0UzNCbytjbWd5?=
 =?utf-8?B?MHY0Q3g1aW9aVWpyRUpvRGNqd05hS045Um40MkVYSklqYWFUUFF4a0lYbjZa?=
 =?utf-8?B?ZzhaaWRqYmIzcmI1dVJ6T0l3QUJjNjB6UWtQRFQyTjB1Z3h1OVdhZVp3eG5W?=
 =?utf-8?B?cFpwdzk5YSt5dHV5ZDRrb0FVUUpWVEFRc3N5b2xWb202dEoxYm5aUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 026fe295-e9de-4013-2c2b-08dea66424c9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 02:56:58.0396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7cNJwS5QP0Zt2E+Ov/YeAf6GmgV5b0gzPtKiwxWYppB4nuMEwXxZPj66RcaGL7LmiLgk6R3dlx/ObFhf/7cEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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
X-Rspamd-Queue-Id: D025049C9DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[honghuan@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]



On 4/29/2026 5:56 PM, Huang, Honglei1 wrote:
> 
> 
> On 4/23/2026 4:22 PM, Huang, Honglei1 wrote:
> ...
>>>>>>>>>>
>>>>>>>>>> This patch series implements basic SVM support with the 
>>>>>>>>>> following features:
>>>>>>>>>>
>>>>>>>>>>       1. attributes sepatarated from physical page management:
>>>>>>>>>>
>>>>>>>>>>         - Attribute layer (amdgpu_svm_attr_tree): a driver 
>>>>>>>>>> side interval
>>>>>>>>>>           tree that stores SVM attributes. Managed through the 
>>>>>>>>>> SET_ATTR,
>>>>>>>>>>           and mmu notifier callback.
>>>>>>>
>>>>>>> Can you explain the mmu notifier callback interaction here? See 
>>>>>>> below in
>>>>>>> Xe the attribute tree is existing VMA tree (gpuvm).
>>>>>>>
>>>>>>
>>>>>> Let me try to explain, apologies if the description is not fully
>>>>>> precise.
>>>>>>
>>>>>> In current implementation, the MMU notifier callback interacts 
>>>>>> with the attr
>>>>>> tree only in the munmap path remove the corresponding attribute
>>>>>> entries from the attr tree so that stale attributes do not persist 
>>>>>> for
>>>>>> freed address space.
>>>>>>
>>>>>
>>>>> Ah, yes. We reset our attributes upon munmap too. We actually don't 
>>>>> this
>>>>> 100% correct quite either and series in flight to fix [1].
>>>>>
>>>>> [1] https://patchwork.freedesktop.org/series/161815/
>>>>
>>>> Hi matt,
>>>>
>>>> It seems like you are tring to modify the implementation into remove 
>>>> the
>>>> attributes when munmap.
>>>>
>>>> Actuall we have a discussion internally that does the driver need to 
>>>> remove
>>>> the attributes when munmap.
>>>>
>>>> So there servel ideas:
>>>>
>>>> 1. attribute need keep: attributes may be needed again when a new VMA
>>>> appears or on subsequent faults.
>>>> 2.attribute need keep: attributes can be set independent of whether 
>>>> memory
>>>> is currently mapped; attributes persist and are modified explicitly via
>>>> ioctl, not implicitly by notifier callbacks.
>>>> 3. attribute need remove: casue VMA is gone, driver can do nothing 
>>>> without
>>>> VMA.
>>>>
>>>> and I saw xe_svm set default attribute in the previous version, this 
>>>> is also
>>>> a option.
>>>>
>>>> Can you please help to give some information that why xe_svm is 
>>>> turing to
>>>> remove the attribute when munmap? And does keeping attribute is a 
>>>> valid way?
>>>>
>>>
>>> This is a semantic choice, and we’re trying to match the semantics of
>>> CPU madvise. I believe any semantic an individual driver stack wants to
>>> define is valid, but if vendors mismatch sematics this will create a
>>> level of vendor lock in which may (cough Nvidia, CUDA) or may not (open
>>> source) be desired.
>>>
>>> AFAIK, if you do something like this in C (a CPU-only program):
>>>
>>> mmap(addr_range);
>>> madvise(addr_range, some_flags);
>>> munmap(addr_range);
>>>
>>> mmap(addr_range); /* Here the madvise attributes are reset */
>>>
>>> Also, AFAIK, the CUDA GPU madvise API works this way as well.
>>>
>>> That said, making this work 100% reliably is quite difficult, especially
>>> with a rude user.
>>>
>>> For example:
>>>
>>> mmap(addr_range);
>>> gpu_madvise(addr_range, some_flags);
>>> /* GPU never actually touches memory */
>>> munmap(addr_range);
>>>
>>> So we have an opt-in VM bind flag,
>>> DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET, which we’re working on to mostly
>>> handle the “rude” case above. Maybe we can reach 100% correctness, but
>>> again, this is a difficult problem is WIP.
>>>
>>
>> I think the current amdgpu SVM draft version also has the issue for 
>> the rude user situlation. Maybe this is caused by the separation of 
>> attribute layer and physical layer. Seems like KFD_SVM doesn't have 
>> this issue.
>>
>> Maybe driver can find_or_insert in madvise ioctl path, to add a MMU 
>> notifier but do not to get_page, and then clean the attribyte in mmu 
>> notifier callback instead of GC. This is just my thought.
>>
>> And really thanks for the information, and waiting for other's comments.
>>
> 
> Hi Matt,
> 
> I'd like to share a concrete bug we hit in the amdgpu SVM 
> implementation/tests about stale attributes.
> 
> In short it is stale attr_range overlaps with VM_PFNMAP VMA
> 
> 1: User allocates memory and sets GPU attributes but never use/fault it.
> 
>     CPU VMA (anonymous):
>     |<── 0x1000 ── 0x5000 ──>|
> 
>     attr_range:
>     |<── 0x1000 ── 0x5000 ──>|
> 
> 2: User munmaps the region, attr_range is NOT cleaned up
> 
>     CPU VMA: (gone)
> 
>     attr_range:           stale
>     |<── 0x1000 ── 0x5000  ─>|
> 
>     No gpusvm_range existed, No MMU notifier, No GC, No cleanup
> 
> 
> 3: User mmaps new memory for device pfn remap  partially overlapping the 
> old range,
> and new memory for GPU set attribute
> 
> 
>     CPU VMAs:
>     |<── 0x1000 ── 0x2000 ──>|<── 0x2000 ── 0x4000 ──>|
>     |   VM_PFNMAP                  |   anonymous (new alloc)      |
> 
>     attr_range:              STILL STALE
>     |<────── 0x1000 ─── 0x5000 ─────────────>|
> 
> 
> 4: GPU faults at address 0x3000
> 
>     Fault handler finds the stale attr_range [0x1000, 0x5000):
>       gpuva_start = 0x1000  (from stale attr_range)
>       gpuva_end   = 0x5000  (from stale attr_range)
> 
>     drm_gpusvm_range_chunk_size()  find the  chunk: 0x0000-0x5000 cover 
> the VM_PFNMAP area
> 
>     |<── 0x1000 ── 0x2000 ──>|<── 0x2000 ──── 0x4000 ───>|
>     |   VM_PFNMAP                  |                                    |
>      hmm_range_fault fails
>      or vma check:
>      VM_PFNMAP -> -EOPNOTSUPP
> 
> I think it is caused by of the stale attribute.
> Or is this considered as an invalid userspace behavior?

Hi all,

After internal discussion, I'd like to summary some conclusions from team.

It is decided that default behavior will be to keep attributes on munmap 
for behavioral consistency, advantages of explicit interfaces, safety 
and extensibility.
And provide an opt-in flag similar to Xe's 
DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET.

There is a concern about behavioral consistency from Felix. In 
userspace, whether free() actually triggers a munmap is outside the 
user's control, the C library allocator may retain pages internally 
rather than returning them to the OS. As It is said: "when you call 
malloc and then free, that doesn't necessarily result in unmapping the 
pages it may result in unmapping pages if you are freeing something big 
that was allocated with mmap under the hood, but it may also just stick 
around. From a user's point of view who just uses malloc/free and sets 
some attributes, they have no way of knowing whether their attributes 
will stick or not. I think if the attributes always stick, that would 
give you a more consistent behavior."

And it is from Christian that explicit interfaces are better than 
implicit ones auto-removing attributes on munmap is an implicit kernel 
reaction that users may not even be aware of. As it is said: "Explicit 
interfaces which say 'hey kernel, do something' are usually better than 
implicit interfaces where the kernel is doing something on its own and 
we are just reacting to it." And it is also noted that we can always add 
a flag for auto-removal later if needed, but the reverse would be a UAPI 
breaking change.

Based on the above, the next steps are:

1. Change the logic to keep the attribute as default in current 
implementation.
2. Maybe need adding a new ioctl op to explicitly delete attribute? 
Currently the UAPI can only overwrite attributes to not to map/default 
but not truly remove them.
3. Add a new UAPI flag similar to DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET.
4. For the auto reset path, need to address the "never-faulted" issue.
     Maybe we can register a lightweight MMU notifier at madvise ioctl 
time to observe munmap and clean up attr_range, even if the GPU never 
touches the range.

Please correct me if I'm wrong on any of the above assumptions. Would be 
interested to hear thoughts on this direction.

Regards,
Honglei

> Regards,
> Honglei
> 
>> Regards,
>> Honglei
>>
>>
>>> Matt
>>>
>>>>
>>>> Regards,
>>>> Honglei...

