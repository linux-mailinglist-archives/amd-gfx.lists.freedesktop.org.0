Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 598A79D0B2A
	for <lists+amd-gfx@lfdr.de>; Mon, 18 Nov 2024 09:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029DE10E1C5;
	Mon, 18 Nov 2024 08:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z8WUm/rv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012410E1C5
 for <amd-gfx@lists.freedesktop.org>; Mon, 18 Nov 2024 08:44:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpCzJxazMxC2HD67VtWCXE6QFUVLaImBjRzRtGjoa5Q8KwY/olKlB3X6TyKL0AlJM8enR9F8b1Tb11t1rdGLIr9ItIFqyiwuQa6Bmc24DBP2SUK3uFgvSm0g/+WlaDU4nFy5UtKZx4AFBZ6LfHLb7ZMZ0HxlgKvA338Kl/fOIe/iUEbbaZGM5Ufof4tBG0aXAZhbooDXerUrh/IkOYIbO6qdjvsqqUeIrcB2/GUvZo9Vbxjl66QWieo7iWPB1JY4ktXfkga04ZqJKO/DcYXynnLil/KLwi1h0Nh9mP1fH/l/QDYwhEIfGteURIGcFiqLzjPzpyCvaTYhrjnEiLpoBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZxaxPstKuqBbQV3m6D6Qvii5w0R43mAq2W/ENzgwVA=;
 b=CLakqSdqK1elA4kMspgduz3vJDZNQyaqYgdzxp/xCUamUZ1Gs1+UANzt2jPrZx3FT0IcpF0qOmIpAAGgBs3AXmJ7JnzaIRJjv12JH3iH+mQRABKS6YR+4QZRnF0Heb68Kae7hyy9ogh9BKo4OPuLKXX44i7pEhargjfb5oWdK5Z1msXei9nXfLZ6RW19P5ZlAkOsZ8TLks9C1JZmUNRLXsJdivpnzAKymAB9knK60dwoGZ9Gy+je4Fw4JTo4D8qbJVHouClyDkv2wInC6syxeqsBK9g/3fF59KkFnm3hCwnQCu+EMCFycfMbyZsapeeDXvcEO1lQ0Ty77Vi5Yr6xpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZxaxPstKuqBbQV3m6D6Qvii5w0R43mAq2W/ENzgwVA=;
 b=z8WUm/rvjEHQUnTH93qKCjA6VNppTLz/SnA/Qh5K1A68VaSqWzx5Juj+X8f4DnHythAgB0Oms3jcpri6JbWmEVHuNUUqc17gfZdh+Q6bn8P9pwDJV2U2kJ1JkD8zEb0RfgqvIlk6qrIbhN/HegknOF6jBZf461cbsxuqdVe6pfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 08:44:33 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%6]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 08:44:32 +0000
Message-ID: <118de535-b4c2-43be-be06-bb3c82079995@amd.com>
Date: Mon, 18 Nov 2024 14:14:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/pm: fix and simplify workload handling
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
References: <20241116140209.2081056-1-alexander.deucher@amd.com>
 <20241116140209.2081056-2-alexander.deucher@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20241116140209.2081056-2-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::20) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 44931fa5-05f5-47f5-1f08-08dd07ad38f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjZlak02aHBVRGJVWWhlMUViS2lEWGRmbzAxbHNiRHlBTGNmZWtBb2puNDRJ?=
 =?utf-8?B?V1U0amgwaUE3dmZSUStxQTU2NmZhREF0Rm51Z0dmYlROMVVUYXRycFphKzNn?=
 =?utf-8?B?V0YwK01JVGhVb1VtczcwT3hXcW1QQ3J0QTlZemd5R0pmSjJDWm5uM0R0cUVh?=
 =?utf-8?B?dEJDeTlkb2NWSlY3TFEvZ29UdTAyWlVTQnQ5Z0lpZHJIYk5kcmRMak83U2N5?=
 =?utf-8?B?V3ZUSER4WU44a0h6b0E4Zi91ejFZcG93SkF6TWtyWE9YVHVDREZCbHRpaTlE?=
 =?utf-8?B?VnlsQnFRN3VxVS9YeE01enFVUFRKZmFDbm45UThFcCtWUG9tL1Rpc3YwWktX?=
 =?utf-8?B?bmZHQ3RUYmtOc2c0SU1KMWw5eUpYNzNoRExkVGs3UzV2VEVyaU1ZQ2lIaTVT?=
 =?utf-8?B?YWtCOXJRRnhZb1d2RnNoSkNENWozVmRiY2NibDFUcVp4Nzc1U2xIa0ZmZVd6?=
 =?utf-8?B?SU95MnNLK0tPa0l6dHg0T2pmRXIwVWprUkNnWklSVEQxL1dORXkzOSthYldi?=
 =?utf-8?B?SUNmelFMMEFaYlpndlFqL1hkRXRqUnliNnVTZE9Ma2U5elk1cEVpTjh4bGp3?=
 =?utf-8?B?MWl6LzJMc3lnS3FZUVF2bWx1RzI2S2Y2c1BDcWdsODVMSHQ4b1k3YmF5Vkg5?=
 =?utf-8?B?MWxrb0l6L2FCeS9KWDhLaDV5T1Jwbk5kbElrdkFURUtWMlRiMkVhbFBPUXRN?=
 =?utf-8?B?enpveXNGV0h6MjJnSFI0QnFHM3VnQzRvMkFOY0lrcmE5ZU5Bd0d0dXNyaENx?=
 =?utf-8?B?U0NUSzNlZHZ4TWRaWG1CemIzOWFGY2hnQWcwQU1rZXdQVWFFR2RoNjdPR3hL?=
 =?utf-8?B?bko3cFE2bXlXODkrTjBKU3FkcnJ1UTFxcjFEQ0lZazZsRVFxdUJ6SlBvUjVj?=
 =?utf-8?B?ZlNhT2dIeENqeUl5VmVYN3BsZGJyVTFGeWNLYlB1OHB1em1ZVGFaZHc0TkUy?=
 =?utf-8?B?V3Q4WTZBV0RSVktoUlFKZmN5VEVhQjFtSGQ3N2tVUkUxL2NoYjdRaXloWmR3?=
 =?utf-8?B?SlAyWEFrcUJwcncrM0JZWHFOaVgvazVjY3JXM3gzNjEwcExWVkFhQmRweURN?=
 =?utf-8?B?MGpnT0ZzY3loU1hoU1UwcndrK2N4NGZyNHN3NU9WWkl4TTdEWVVGd2xudy9P?=
 =?utf-8?B?b3p0YkJzaTllbmNxcVBHNkdnQkdYQjhPV1QwSVlBNEVEZTM3bXUzU1U0MUtw?=
 =?utf-8?B?TzIrS1docjBDRy9SOW5HY3g3ZXlNMGZIdzJyYmNYQ3FRSFFER0k3RHJDb1BN?=
 =?utf-8?B?dFNPNDNXSDdKY0s1eEhYa29tYU9BWnBEZm5EWlVMUkdud2ZMK1NVaDJsS2Rw?=
 =?utf-8?B?QUVwejkxb1N2dXozL3NBOWdlemsrRmpQOFg5bHF1M2U5T0FTL0dvaEx6NEpk?=
 =?utf-8?B?dFo0TUFOeC91Ym0rSUZCTWEzK3pWVHdTeWJjRndZS000Y05iVXhxQXMzQXJV?=
 =?utf-8?B?R3VDLzc5YXNWanpRNFRKNDViazZ0dmZvNFdnU1VxZ3hOVzc5QWdnY2VNK3NK?=
 =?utf-8?B?MjVDTVNYcUgrTms4YnREN0FjK2FOcGJTTHQ1TmRPdDlub083MXZuWkF0OGIv?=
 =?utf-8?B?WG5DOGduM1orYVFBK05YNzhKWUoxOFpWMmRHRmJ3dm14aGVUU3RHbFpGUGpU?=
 =?utf-8?B?N1V6Y2ZzejRxNWtSeWxoQW9zaUo1cHJUZ2VIME9LbmduYnNtY2xxdm5IT2U5?=
 =?utf-8?B?Tlp3aVRBbklMZ3N3ZUlaRkZ5V3JOeDlNV056QTRnNk1nSzFkajV4OTNubzBF?=
 =?utf-8?Q?RrZU6uv1ooaKV3UfEy67b1ZS3e4gIDyiZw/qpwS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWlOZzl6QjFNWnluTUdGbk1jbjhmWm9JUmNqeU94Q0FwRDJoUVk0bmN6aGNS?=
 =?utf-8?B?Qm5pMWVzQnJDQnBwaFlkeThnanNOb1BONGJlWWRvRzYrTUZjaWZkcVNFQ2h5?=
 =?utf-8?B?bDVlVXdZK0JTMTZNNDAycFFQOHE1UllpNXNJdTh5WlN6bWtFazFRNGYyTUhJ?=
 =?utf-8?B?RnllVlRWTDdmb29iT0EzWFJZMTlzdmRJd3IrOHFVOER3Q1d5MGRYRnpVb2t2?=
 =?utf-8?B?dGQ3dWVtdDRzdDNZWm9iZklKMzJJMFNmWkFyMjhYajBTb29TMFVrVFgwbnBD?=
 =?utf-8?B?dlpNVnZBZ1BnZlNkOUdUNnBqTStDc2ZJSjhhL04zcXVQK3dQVU5CSGFaUHNJ?=
 =?utf-8?B?ZmZDUmpGbkNrS0hPQmJNbURQVEIxWWszUFNTNHp3YW5tTDkvQnF2U3EyMERE?=
 =?utf-8?B?Y3YzT1plMnZaTFYwUk9LaVJHSnNRZ3pHcEVsMks2T0I2UzNYcTJlamRPNHlE?=
 =?utf-8?B?di95SDF6S2RPSWsvREtNOXZSYWR1UVB4MStPTFlVTFkydS95ZnRhVTIvTXRF?=
 =?utf-8?B?UkYxOGNlbVFGRmFjQ0h2NGZVSEJvNVdvbjJSZ3ZUbnZqdzhDS3FRVks4cXds?=
 =?utf-8?B?OGN4NnJZVTAvTjVqTjlGd1AyNUh6N3grTUozREljYWsvZUEyd1VmRVBBekcz?=
 =?utf-8?B?dlRSbUJjcllhRWhSQWRHTXJUOE91SWNWMVlhQWhFa2o2M3J4WGRxQzBFUGdJ?=
 =?utf-8?B?cTZMWWNad3liRytGOWV6VCtFRURidk14Kzk2QXZiSnN2cWRtZk5vVWxHMlVQ?=
 =?utf-8?B?enkyY0hhNnpuM04rOW9wOUQvNnEzSldrbitqTmFkL1VXSHZuYTFHdHhVeHBL?=
 =?utf-8?B?YTdzZWhCcEdiNHdjcUE0T3JESS90YUpyOEVkQmRkZXZiYTcwM3p5VSthWWdr?=
 =?utf-8?B?T3NQK0Q3b2E4OStsUVUzMHZRWGMzZmVMTHpmZGNYVXpSRExqZG5HWjRZb2Jo?=
 =?utf-8?B?RmkxL1hzTTdLSWJmWGRpVEdRdnNzS1pSSnpzTEtLbVl0anpHTytkbTBWUTVY?=
 =?utf-8?B?UHZRcVVpNHhXemIwUUJZWkVYUm95dnE0NXJVT0NnMkxYWkxUVElpcHplWnlI?=
 =?utf-8?B?T3cwODR5cE9IeXpJYnpRTDVKUHNuOHFhL0c3eTJBVmVVbzArODF2YVpWbTRJ?=
 =?utf-8?B?MVM0T0dsdis0Q0RsT2E2UDJnWEM3K1ptejlHcTFaZkhxYkxjQU5QTVJObmpo?=
 =?utf-8?B?djdGRVBSYUprakhQbnNpazliNUtOUEdkZGFMTzRwOVJkWjUza2I5NXR6ZkUz?=
 =?utf-8?B?dVU2cWM1NEFPdGFwcVp1MVBhTDFpb3ZBME83b2pWdzNBZmx4L0R1bklqQ0JI?=
 =?utf-8?B?S3pYQmxXUU11RG5OaW5NL0IzQWJWejlwZCtSNmk0TmNmMjFLbjV5QUJsQlJs?=
 =?utf-8?B?bnlTdTBJWStuN3V0V1FmSEplMkVQLzRpSVlSWTRkZ080UG1RTjZDU2RIWWxn?=
 =?utf-8?B?LzhWUENqbUZZc0ZPY0dJYUMwVitxQ05EOUd3ci9jOXlZbDJHWTViUWFrSkdh?=
 =?utf-8?B?Sno0dEVveDNuNUlqTTM0cVpjdDdDdmE1RkNmb2s4cGJVYm15aUJabU1raFhS?=
 =?utf-8?B?UE83cithOTVKSmFINlFQandpZGs2KzlldVlpZ1NDOUc5Tzd5SUsrV0JTQm4z?=
 =?utf-8?B?RjhIalBHQ3ZlaXV0MDZuZlQzYisvL0NlMTFPZzhqWSt0c052Q2V6S09LenZt?=
 =?utf-8?B?bGE3SHlFWkRHUzFHYmtpZG9EdDB0UEpXK1c1MFVyWmdiK0IxNEJNY045V2NF?=
 =?utf-8?B?ZTJFOUJPNW5KQXN5NnN4V2M5MFJLZHJRMnMzb1B4cWlaeUhqWS81aW40Z29L?=
 =?utf-8?B?ZlpkODNRNDBkdGJabGNBQ1ZMcFdJOHN6NzNxblcxU0hHNndOc0ZEakhvcS9q?=
 =?utf-8?B?QmpSUjJCYk0rSjRJS0ROUVdWQUlSVnN1QmtRVUNSMjZqdW9ZSE4yT0F0bW9E?=
 =?utf-8?B?elJDZGtyWithNDlQekwwQkhkVlE1YXZVSEZqUGZYOG5ZSGVVT1h5UkFkUDBG?=
 =?utf-8?B?QkRqTG9oNUdwNGNaSWJsblFFZEJOUHIrOVEza2VGU1hneENlbXN5RnhhcmRV?=
 =?utf-8?B?ODZ2NEFyVHF2VUpyTTlGN0JNV1IxUUI2VG10V3lEM2ZWL1E4L1BzUGRNZ09v?=
 =?utf-8?Q?SXth+KQCyr9/ZJZAUVl0dULxm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44931fa5-05f5-47f5-1f08-08dd07ad38f5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 08:44:32.7244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMQ3yoeaQcazPLEl1c1tibuywf9W+7RSuQAdWyvidzxf+LD0+ij5JXsMvVH7j1Bl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
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



On 11/16/2024 7:32 PM, Alex Deucher wrote:
> smu->workload_mask is IP specific and should not be messed with in
> the common code. The mask bits vary across SMU versions.
> 
> Move all handling of smu->workload_mask in to the backends and
> simplify the code.  Store the user's preference in smu->power_profile_mode
> which will be reflected in sysfs.  For internal driver profile
> switches for KFD or VCN, just update the workload mask so that the
> user's preference is retained.  Remove all of the extra now unused
> workload related elements in the smu structure.
> 
> v2: use refcounts for workload profiles
> v3: rework based on feedback from Lijo
> v4: fix the refcount on failure, drop backend mask
> 
> Fixes: 8cc438be5d49 ("drm/amd/pm: correct the workload setting")
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Kenneth Feng <kenneth.feng@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 156 +++++++++++-------
>  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  15 +-
>  .../gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 146 ++++++++--------
>  .../gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c   | 146 ++++++++--------
>  .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 145 ++++++++--------
>  .../gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c  |  41 ++---
>  .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   |  43 ++---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c  | 143 ++++++++--------
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 117 +++++++------
>  .../drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c  | 144 ++++++++--------
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |  30 ++++
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h        |   5 +
>  12 files changed, 611 insertions(+), 520 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index eb1e2473b36a..d0c94f894f84 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -72,6 +72,10 @@ static int smu_set_power_limit(void *handle, uint32_t limit);
>  static int smu_set_fan_speed_rpm(void *handle, uint32_t speed);
>  static int smu_set_gfx_cgpg(struct smu_context *smu, bool enabled);
>  static int smu_set_mp1_state(void *handle, enum pp_mp1_state mp1_state);
> +static void smu_power_profile_mode_get(struct smu_context *smu,
> +				       enum PP_SMC_POWER_PROFILE profile_mode);
> +static void smu_power_profile_mode_put(struct smu_context *smu,
> +				       enum PP_SMC_POWER_PROFILE profile_mode);
>  
>  static int smu_sys_get_pp_feature_mask(void *handle,
>  				       char *buf)
> @@ -1268,8 +1272,6 @@ static int smu_sw_init(struct amdgpu_ip_block *ip_block)
>  	INIT_WORK(&smu->interrupt_work, smu_interrupt_work_fn);
>  	atomic64_set(&smu->throttle_int_counter, 0);
>  	smu->watermarks_bitmap = 0;
> -	smu->power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> -	smu->default_power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>  
>  	for (i = 0; i < adev->vcn.num_vcn_inst; i++)
>  		atomic_set(&smu->smu_power.power_gate.vcn_gated[i], 1);
> @@ -1277,27 +1279,13 @@ static int smu_sw_init(struct amdgpu_ip_block *ip_block)
>  	atomic_set(&smu->smu_power.power_gate.vpe_gated, 1);
>  	atomic_set(&smu->smu_power.power_gate.umsch_mm_gated, 1);
>  
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT] = 0;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_FULLSCREEN3D] = 1;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_POWERSAVING] = 2;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_VIDEO] = 3;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_VR] = 4;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_COMPUTE] = 5;
> -	smu->workload_prority[PP_SMC_POWER_PROFILE_CUSTOM] = 6;
> -
>  	if (smu->is_apu ||
>  	    !smu_is_workload_profile_available(smu, PP_SMC_POWER_PROFILE_FULLSCREEN3D))
> -		smu->workload_mask = 1 << smu->workload_prority[PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT];
> +		smu->power_profile_mode = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>  	else
> -		smu->workload_mask = 1 << smu->workload_prority[PP_SMC_POWER_PROFILE_FULLSCREEN3D];
> -
> -	smu->workload_setting[0] = PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
> -	smu->workload_setting[1] = PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> -	smu->workload_setting[2] = PP_SMC_POWER_PROFILE_POWERSAVING;
> -	smu->workload_setting[3] = PP_SMC_POWER_PROFILE_VIDEO;
> -	smu->workload_setting[4] = PP_SMC_POWER_PROFILE_VR;
> -	smu->workload_setting[5] = PP_SMC_POWER_PROFILE_COMPUTE;
> -	smu->workload_setting[6] = PP_SMC_POWER_PROFILE_CUSTOM;
> +		smu->power_profile_mode = PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> +	smu_power_profile_mode_get(smu, smu->power_profile_mode);
> +
>  	smu->display_config = &adev->pm.pm_display_cfg;
>  
>  	smu->smu_dpm.dpm_level = AMD_DPM_FORCED_LEVEL_AUTO;
> @@ -2133,6 +2121,9 @@ static int smu_suspend(struct amdgpu_ip_block *ip_block)
>  	if (!ret)
>  		adev->gfx.gfx_off_entrycount = count;
>  
> +	/* clear this on suspend so it will get reprogrammed on resume */
> +	smu->workload_mask = 0;
> +
>  	return 0;
>  }
>  
> @@ -2244,26 +2235,46 @@ static int smu_enable_umd_pstate(void *handle,
>  	return 0;
>  }
>  
> -static int smu_bump_power_profile_mode(struct smu_context *smu,
> -					   long *param,
> -					   uint32_t param_size)
> +static int smu_bump_power_profile_mode(struct smu_context *smu)
>  {
> -	int ret = 0;
> +	u32 workload_mask = 0;
> +	int i, ret = 0;
> +
> +	for (i = 0; i < PP_SMC_POWER_PROFILE_COUNT; i++) {
> +		if (smu->workload_refcount[i])
> +			workload_mask |= 1 << i;
> +	}
> +
> +	if (smu->workload_mask == workload_mask)
> +		return 0;
>  
>  	if (smu->ppt_funcs->set_power_profile_mode)
> -		ret = smu->ppt_funcs->set_power_profile_mode(smu, param, param_size);
> +		ret = smu->ppt_funcs->set_power_profile_mode(smu, workload_mask);
> +
> +	if (!ret)
> +		smu->workload_mask = workload_mask;
>  
>  	return ret;
>  }
>  
> +static void smu_power_profile_mode_get(struct smu_context *smu,
> +				       enum PP_SMC_POWER_PROFILE profile_mode)
> +{
> +	smu->workload_refcount[profile_mode]++;
> +}
> +
> +static void smu_power_profile_mode_put(struct smu_context *smu,
> +				       enum PP_SMC_POWER_PROFILE profile_mode)
> +{
> +	if (smu->workload_refcount[profile_mode])
> +		smu->workload_refcount[profile_mode]--;
> +}
> +
>  static int smu_adjust_power_state_dynamic(struct smu_context *smu,
>  					  enum amd_dpm_forced_level level,
> -					  bool skip_display_settings,
> -					  bool init)
> +					  bool skip_display_settings)
>  {
>  	int ret = 0;
> -	int index = 0;
> -	long workload[1];
>  	struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
>  
>  	if (!skip_display_settings) {
> @@ -2300,14 +2311,8 @@ static int smu_adjust_power_state_dynamic(struct smu_context *smu,
>  	}
>  
>  	if (smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL &&
> -		smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM) {
> -		index = fls(smu->workload_mask);
> -		index = index > 0 && index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
> -		workload[0] = smu->workload_setting[index];
> -
> -		if (init || smu->power_profile_mode != workload[0])
> -			smu_bump_power_profile_mode(smu, workload, 0);
> -	}
> +	    smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM)
> +		smu_bump_power_profile_mode(smu);
>  
>  	return ret;
>  }
> @@ -2326,13 +2331,13 @@ static int smu_handle_task(struct smu_context *smu,
>  		ret = smu_pre_display_config_changed(smu);
>  		if (ret)
>  			return ret;
> -		ret = smu_adjust_power_state_dynamic(smu, level, false, false);
> +		ret = smu_adjust_power_state_dynamic(smu, level, false);
>  		break;
>  	case AMD_PP_TASK_COMPLETE_INIT:
> -		ret = smu_adjust_power_state_dynamic(smu, level, true, true);
> +		ret = smu_adjust_power_state_dynamic(smu, level, true);
>  		break;
>  	case AMD_PP_TASK_READJUST_POWER_STATE:
> -		ret = smu_adjust_power_state_dynamic(smu, level, true, false);
> +		ret = smu_adjust_power_state_dynamic(smu, level, true);
>  		break;
>  	default:
>  		break;
> @@ -2354,12 +2359,11 @@ static int smu_handle_dpm_task(void *handle,
>  
>  static int smu_switch_power_profile(void *handle,
>  				    enum PP_SMC_POWER_PROFILE type,
> -				    bool en)
> +				    bool enable)
>  {
>  	struct smu_context *smu = handle;
>  	struct smu_dpm_context *smu_dpm_ctx = &(smu->smu_dpm);
> -	long workload[1];
> -	uint32_t index;
> +	int ret;
>  
>  	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
>  		return -EOPNOTSUPP;
> @@ -2367,21 +2371,21 @@ static int smu_switch_power_profile(void *handle,
>  	if (!(type < PP_SMC_POWER_PROFILE_CUSTOM))
>  		return -EINVAL;
>  
> -	if (!en) {
> -		smu->workload_mask &= ~(1 << smu->workload_prority[type]);
> -		index = fls(smu->workload_mask);
> -		index = index > 0 && index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
> -		workload[0] = smu->workload_setting[index];
> -	} else {
> -		smu->workload_mask |= (1 << smu->workload_prority[type]);
> -		index = fls(smu->workload_mask);
> -		index = index <= WORKLOAD_POLICY_MAX ? index - 1 : 0;
> -		workload[0] = smu->workload_setting[index];
> -	}
> -
>  	if (smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_MANUAL &&
> -		smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM)
> -		smu_bump_power_profile_mode(smu, workload, 0);
> +	    smu_dpm_ctx->dpm_level != AMD_DPM_FORCED_LEVEL_PERF_DETERMINISM) {
> +		if (enable)
> +			smu_power_profile_mode_get(smu, type);
> +		else
> +			smu_power_profile_mode_put(smu, type);
> +		ret = smu_bump_power_profile_mode(smu);
> +		if (ret) {
> +			if (enable)
> +				smu_power_profile_mode_put(smu, type);
> +			else
> +				smu_power_profile_mode_get(smu, type);
> +			return ret;
> +		}
> +	}
>  
>  	return 0;
>  }
> @@ -3080,12 +3084,48 @@ static int smu_set_power_profile_mode(void *handle,
>  				      uint32_t param_size)
>  {
>  	struct smu_context *smu = handle;
> +	bool custom_changed = false;
> +	int ret = 0, i;
>  
>  	if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled ||
>  	    !smu->ppt_funcs->set_power_profile_mode)
>  		return -EOPNOTSUPP;
>  
> -	return smu_bump_power_profile_mode(smu, param, param_size);
> +	if (param[param_size] == PP_SMC_POWER_PROFILE_CUSTOM) {
> +		if (param_size > SMU_BACKEND_MAX_CUSTOM_PARAMETERS)

Sorry, didn't have a closer look at this during last review.

I think the check should be > (SMU_BACKEND_MAX_CUSTOM_PARAMETERS - 1)
otherwise, if param_size == SMU_BACKEND_MAX_CUSTOM_PARAMETERS, then
below loop will crash.

> +			return -EINVAL;
> +		/* param_size is actually a max index, not an array size */
> +		for (i = 0; i <= param_size; i++) {
> +			if (smu->custom_profile_input[i] != param[i]) {

Looking at the code, custom mode is a bit tricky.

This check may not help much. For ex: input[0] determines the clock
type. Each time a different clock type could be chosen but the settings
for the clock could also be the same as last time. In that case, this
check here doesn't help and leaves it to backend. Since input[0] or
something else could determine the input type, I think it's better to
pass the params directly to backend whenever there is a request for
custom mode. Also, the number of valid customer parameters differ from
SOC to SOC. In summary, leave the rest to backend and FW. Then, we could
just keep custom_profile_input as a pointer pointing to input params array.

Thanks,
Lijo

> +				custom_changed = true;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if ((param[param_size] != smu->power_profile_mode) || custom_changed) {
> +		/* save the parameters for custom */
> +		if (custom_changed) {
> +			/* param_size is actually a max index, not an array size */
> +			for (i = 0; i <= param_size; i++)
> +				smu->custom_profile_input[i] = param[i];> +			smu->custom_profile_size = param_size;
> +			/* clear frontend mask so custom changes propogate */
> +			smu->workload_mask = 0;
> +		}
> +		/* clear the old user preference */
> +		smu_power_profile_mode_put(smu, smu->power_profile_mode);
> +		/* set the new user preference */
> +		smu_power_profile_mode_get(smu, param[param_size]);
> +		ret = smu_bump_power_profile_mode(smu);> +		if (ret)
> +			smu_power_profile_mode_put(smu, param[param_size]);
> +		else
> +			/* store the user's preference */
> +			smu->power_profile_mode = param[param_size];
> +	}
> +
> +	return ret;
>  }
>  
>  static int smu_get_fan_control_mode(void *handle, u32 *fan_mode)
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> index 06d817fb84aa..85b9079a766b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
> @@ -509,6 +509,8 @@ enum smu_fw_status {
>   */
>  #define SMU_WBRF_EVENT_HANDLING_PACE	10
>  
> +#define SMU_BACKEND_MAX_CUSTOM_PARAMETERS	11
> +
>  struct smu_context {
>  	struct amdgpu_device            *adev;
>  	struct amdgpu_irq_src		irq_source;
> @@ -556,11 +558,14 @@ struct smu_context {
>  	uint32_t hard_min_uclk_req_from_dal;
>  	bool disable_uclk_switch;
>  
> +	/* asic agnostic workload mask */
>  	uint32_t workload_mask;
> -	uint32_t workload_prority[WORKLOAD_POLICY_MAX];
> -	uint32_t workload_setting[WORKLOAD_POLICY_MAX];
> +	/* default/user workload preference */
>  	uint32_t power_profile_mode;
> -	uint32_t default_power_profile_mode;
> +	uint32_t workload_refcount[PP_SMC_POWER_PROFILE_COUNT];
> +	/* backend specific custom workload settings */
> +	long custom_profile_input[SMU_BACKEND_MAX_CUSTOM_PARAMETERS];
> +	bool custom_profile_size;
>  	bool pm_enabled;
>  	bool is_apu;
>  
> @@ -731,9 +736,9 @@ struct pptable_funcs {
>  	 * @set_power_profile_mode: Set a power profile mode. Also used to
>  	 *                          create/set custom power profile modes.
>  	 * &input: Power profile mode parameters.
> -	 * &size: Size of &input.
> +	 * &workload_mask: mask of workloads to enable
>  	 */
> -	int (*set_power_profile_mode)(struct smu_context *smu, long *input, uint32_t size);
> +	int (*set_power_profile_mode)(struct smu_context *smu, u32 workload_mask);
>  
>  	/**
>  	 * @dpm_set_vcn_enable: Enable/disable VCN engine dynamic power
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 6c8e80f6b592..06dce73e1b7b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -1441,98 +1441,96 @@ static int arcturus_get_power_profile_mode(struct smu_context *smu,
>  	return size;
>  }
>  
> -static int arcturus_set_power_profile_mode(struct smu_context *smu,
> -					   long *input,
> -					   uint32_t size)
> +static int arcturus_set_power_profile_mode_coeff(struct smu_context *smu,
> +						 long *input,
> +						 uint32_t size)
>  {
>  	DpmActivityMonitorCoeffInt_t activity_monitor;
> -	int workload_type = 0;
> -	uint32_t profile_mode = input[size];
> -	int ret = 0;
> +	int ret;
>  
> -	if (profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", profile_mode);
> +	if (size != 10)
>  		return -EINVAL;
> +
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor),
> +				   false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
>  	}
>  
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor.Gfx_FPS = input[1];
> +		activity_monitor.Gfx_UseRlcBusy = input[2];
> +		activity_monitor.Gfx_MinActiveFreqType = input[3];
> +		activity_monitor.Gfx_MinActiveFreq = input[4];
> +		activity_monitor.Gfx_BoosterFreqType = input[5];
> +		activity_monitor.Gfx_BoosterFreq = input[6];
> +		activity_monitor.Gfx_PD_Data_limit_c = input[7];
> +		activity_monitor.Gfx_PD_Data_error_coeff = input[8];
> +		activity_monitor.Gfx_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	case 1: /* Uclk */
> +		activity_monitor.Mem_FPS = input[1];
> +		activity_monitor.Mem_UseRlcBusy = input[2];
> +		activity_monitor.Mem_MinActiveFreqType = input[3];
> +		activity_monitor.Mem_MinActiveFreq = input[4];
> +		activity_monitor.Mem_BoosterFreqType = input[5];
> +		activity_monitor.Mem_BoosterFreq = input[6];
> +		activity_monitor.Mem_PD_Data_limit_c = input[7];
> +		activity_monitor.Mem_PD_Data_error_coeff = input[8];
> +		activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>  
> -	if ((profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) &&
> -	     (smu->smc_fw_version >= 0x360d00)) {
> -		if (size != 10)
> -			return -EINVAL;
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor),
> +				   true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -				       WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor),
> -				       false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	return ret;
> +}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor.Gfx_FPS = input[1];
> -			activity_monitor.Gfx_UseRlcBusy = input[2];
> -			activity_monitor.Gfx_MinActiveFreqType = input[3];
> -			activity_monitor.Gfx_MinActiveFreq = input[4];
> -			activity_monitor.Gfx_BoosterFreqType = input[5];
> -			activity_monitor.Gfx_BoosterFreq = input[6];
> -			activity_monitor.Gfx_PD_Data_limit_c = input[7];
> -			activity_monitor.Gfx_PD_Data_error_coeff = input[8];
> -			activity_monitor.Gfx_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		case 1: /* Uclk */
> -			activity_monitor.Mem_FPS = input[1];
> -			activity_monitor.Mem_UseRlcBusy = input[2];
> -			activity_monitor.Mem_MinActiveFreqType = input[3];
> -			activity_monitor.Mem_MinActiveFreq = input[4];
> -			activity_monitor.Mem_BoosterFreqType = input[5];
> -			activity_monitor.Mem_BoosterFreq = input[6];
> -			activity_monitor.Mem_PD_Data_limit_c = input[7];
> -			activity_monitor.Mem_PD_Data_error_coeff = input[8];
> -			activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +static int arcturus_set_power_profile_mode(struct smu_context *smu,
> +					   u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -				       WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor),
> -				       true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> -			return ret;
> -		}
> -	}
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
>  
> -	/*
> -	 * Conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT
> -	 * Not all profile modes are supported on arcturus.
> -	 */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       profile_mode);
> -	if (workload_type < 0) {
> -		dev_dbg(smu->adev->dev, "Unsupported power profile mode %d on arcturus\n", profile_mode);
> -		return -EINVAL;
> +	if (custom_enabled) {
> +		ret = arcturus_set_power_profile_mode_coeff(smu,
> +							    smu->custom_profile_input,
> +							    smu->custom_profile_size);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	ret = smu_cmn_send_smc_msg_with_param(smu,
> -					  SMU_MSG_SetWorkloadMask,
> -					  1 << workload_type,
> -					  NULL);
> +					      SMU_MSG_SetWorkloadMask,
> +					      backend_workload_mask,
> +					      NULL);
>  	if (ret) {
> -		dev_err(smu->adev->dev, "Fail to set workload type %d\n", workload_type);
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
>  		return ret;
>  	}
>  
> -	smu->power_profile_mode = profile_mode;
> -
> -	return 0;
> +	return ret;
>  }
>  
>  static int arcturus_set_performance_level(struct smu_context *smu,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> index faa8e7d9c3c6..a53725773ad4 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c
> @@ -2006,87 +2006,99 @@ static int navi10_get_power_profile_mode(struct smu_context *smu, char *buf)
>  	return size;
>  }
>  
> -static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> +static int navi10_set_power_profile_mode_coeff(struct smu_context *smu,
> +					       long *input,
> +					       uint32_t size)
>  {
>  	DpmActivityMonitorCoeffInt_t activity_monitor;
> -	int workload_type, ret = 0;
> +	int ret;
>  
> -	smu->power_profile_mode = input[size];
> +	if (size != 10)
> +		return -EINVAL;
>  
> -	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor), false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
> +	}
> +
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor.Gfx_FPS = input[1];
> +		activity_monitor.Gfx_MinFreqStep = input[2];
> +		activity_monitor.Gfx_MinActiveFreqType = input[3];
> +		activity_monitor.Gfx_MinActiveFreq = input[4];
> +		activity_monitor.Gfx_BoosterFreqType = input[5];
> +		activity_monitor.Gfx_BoosterFreq = input[6];
> +		activity_monitor.Gfx_PD_Data_limit_c = input[7];
> +		activity_monitor.Gfx_PD_Data_error_coeff = input[8];
> +		activity_monitor.Gfx_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	case 1: /* Socclk */
> +		activity_monitor.Soc_FPS = input[1];
> +		activity_monitor.Soc_MinFreqStep = input[2];
> +		activity_monitor.Soc_MinActiveFreqType = input[3];
> +		activity_monitor.Soc_MinActiveFreq = input[4];
> +		activity_monitor.Soc_BoosterFreqType = input[5];
> +		activity_monitor.Soc_BoosterFreq = input[6];
> +		activity_monitor.Soc_PD_Data_limit_c = input[7];
> +		activity_monitor.Soc_PD_Data_error_coeff = input[8];
> +		activity_monitor.Soc_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	case 2: /* Memclk */
> +		activity_monitor.Mem_FPS = input[1];
> +		activity_monitor.Mem_MinFreqStep = input[2];
> +		activity_monitor.Mem_MinActiveFreqType = input[3];
> +		activity_monitor.Mem_MinActiveFreq = input[4];
> +		activity_monitor.Mem_BoosterFreqType = input[5];
> +		activity_monitor.Mem_BoosterFreq = input[6];
> +		activity_monitor.Mem_PD_Data_limit_c = input[7];
> +		activity_monitor.Mem_PD_Data_error_coeff = input[8];
> +		activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	default:
>  		return -EINVAL;
>  	}
>  
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size != 10)
> -			return -EINVAL;
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor), true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor), false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	return ret;
> +}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor.Gfx_FPS = input[1];
> -			activity_monitor.Gfx_MinFreqStep = input[2];
> -			activity_monitor.Gfx_MinActiveFreqType = input[3];
> -			activity_monitor.Gfx_MinActiveFreq = input[4];
> -			activity_monitor.Gfx_BoosterFreqType = input[5];
> -			activity_monitor.Gfx_BoosterFreq = input[6];
> -			activity_monitor.Gfx_PD_Data_limit_c = input[7];
> -			activity_monitor.Gfx_PD_Data_error_coeff = input[8];
> -			activity_monitor.Gfx_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		case 1: /* Socclk */
> -			activity_monitor.Soc_FPS = input[1];
> -			activity_monitor.Soc_MinFreqStep = input[2];
> -			activity_monitor.Soc_MinActiveFreqType = input[3];
> -			activity_monitor.Soc_MinActiveFreq = input[4];
> -			activity_monitor.Soc_BoosterFreqType = input[5];
> -			activity_monitor.Soc_BoosterFreq = input[6];
> -			activity_monitor.Soc_PD_Data_limit_c = input[7];
> -			activity_monitor.Soc_PD_Data_error_coeff = input[8];
> -			activity_monitor.Soc_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		case 2: /* Memclk */
> -			activity_monitor.Mem_FPS = input[1];
> -			activity_monitor.Mem_MinFreqStep = input[2];
> -			activity_monitor.Mem_MinActiveFreqType = input[3];
> -			activity_monitor.Mem_MinActiveFreq = input[4];
> -			activity_monitor.Mem_BoosterFreqType = input[5];
> -			activity_monitor.Mem_BoosterFreq = input[6];
> -			activity_monitor.Mem_PD_Data_limit_c = input[7];
> -			activity_monitor.Mem_PD_Data_error_coeff = input[8];
> -			activity_monitor.Mem_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +static int navi10_set_power_profile_mode(struct smu_context *smu,
> +					 u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor), true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
> +
> +	if (custom_enabled) {
> +		ret = navi10_set_power_profile_mode_coeff(smu,
> +							  smu->custom_profile_input,
> +							  smu->custom_profile_size);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       smu->power_profile_mode);
> -	if (workload_type < 0)
> -		return -EINVAL;
>  	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
> -				    1 << workload_type, NULL);
> -	if (ret)
> -		dev_err(smu->adev->dev, "[%s] Failed to set work load mask!", __func__);
> +					      backend_workload_mask, NULL);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
> +		return ret;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index 30d050a6e953..928f17ba3d1a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -1704,90 +1704,101 @@ static int sienna_cichlid_get_power_profile_mode(struct smu_context *smu, char *
>  	return size;
>  }
>  
> -static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> +static int sienna_cichlid_set_power_profile_mode_coeff(struct smu_context *smu,
> +						       long *input, uint32_t size)
>  {
>  
>  	DpmActivityMonitorCoeffIntExternal_t activity_monitor_external;
>  	DpmActivityMonitorCoeffInt_t *activity_monitor =
>  		&(activity_monitor_external.DpmActivityMonitorCoeffInt);
> -	int workload_type, ret = 0;
> +	int ret;
>  
> -	smu->power_profile_mode = input[size];
> +	if (size != 10)
> +		return -EINVAL;
>  
> -	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external), false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
> +	}
> +
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor->Gfx_FPS = input[1];
> +		activity_monitor->Gfx_MinFreqStep = input[2];
> +		activity_monitor->Gfx_MinActiveFreqType = input[3];
> +		activity_monitor->Gfx_MinActiveFreq = input[4];
> +		activity_monitor->Gfx_BoosterFreqType = input[5];
> +		activity_monitor->Gfx_BoosterFreq = input[6];
> +		activity_monitor->Gfx_PD_Data_limit_c = input[7];
> +		activity_monitor->Gfx_PD_Data_error_coeff = input[8];
> +		activity_monitor->Gfx_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	case 1: /* Socclk */
> +		activity_monitor->Fclk_FPS = input[1];
> +		activity_monitor->Fclk_MinFreqStep = input[2];
> +		activity_monitor->Fclk_MinActiveFreqType = input[3];
> +		activity_monitor->Fclk_MinActiveFreq = input[4];
> +		activity_monitor->Fclk_BoosterFreqType = input[5];
> +		activity_monitor->Fclk_BoosterFreq = input[6];
> +		activity_monitor->Fclk_PD_Data_limit_c = input[7];
> +		activity_monitor->Fclk_PD_Data_error_coeff = input[8];
> +		activity_monitor->Fclk_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	case 2: /* Memclk */
> +		activity_monitor->Mem_FPS = input[1];
> +		activity_monitor->Mem_MinFreqStep = input[2];
> +		activity_monitor->Mem_MinActiveFreqType = input[3];
> +		activity_monitor->Mem_MinActiveFreq = input[4];
> +		activity_monitor->Mem_BoosterFreqType = input[5];
> +		activity_monitor->Mem_BoosterFreq = input[6];
> +		activity_monitor->Mem_PD_Data_limit_c = input[7];
> +		activity_monitor->Mem_PD_Data_error_coeff = input[8];
> +		activity_monitor->Mem_PD_Data_error_rate_coeff = input[9];
> +		break;
> +	default:
>  		return -EINVAL;
>  	}
>  
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size != 10)
> -			return -EINVAL;
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external), true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor_external), false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	return ret;
> +}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor->Gfx_FPS = input[1];
> -			activity_monitor->Gfx_MinFreqStep = input[2];
> -			activity_monitor->Gfx_MinActiveFreqType = input[3];
> -			activity_monitor->Gfx_MinActiveFreq = input[4];
> -			activity_monitor->Gfx_BoosterFreqType = input[5];
> -			activity_monitor->Gfx_BoosterFreq = input[6];
> -			activity_monitor->Gfx_PD_Data_limit_c = input[7];
> -			activity_monitor->Gfx_PD_Data_error_coeff = input[8];
> -			activity_monitor->Gfx_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		case 1: /* Socclk */
> -			activity_monitor->Fclk_FPS = input[1];
> -			activity_monitor->Fclk_MinFreqStep = input[2];
> -			activity_monitor->Fclk_MinActiveFreqType = input[3];
> -			activity_monitor->Fclk_MinActiveFreq = input[4];
> -			activity_monitor->Fclk_BoosterFreqType = input[5];
> -			activity_monitor->Fclk_BoosterFreq = input[6];
> -			activity_monitor->Fclk_PD_Data_limit_c = input[7];
> -			activity_monitor->Fclk_PD_Data_error_coeff = input[8];
> -			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		case 2: /* Memclk */
> -			activity_monitor->Mem_FPS = input[1];
> -			activity_monitor->Mem_MinFreqStep = input[2];
> -			activity_monitor->Mem_MinActiveFreqType = input[3];
> -			activity_monitor->Mem_MinActiveFreq = input[4];
> -			activity_monitor->Mem_BoosterFreqType = input[5];
> -			activity_monitor->Mem_BoosterFreq = input[6];
> -			activity_monitor->Mem_PD_Data_limit_c = input[7];
> -			activity_monitor->Mem_PD_Data_error_coeff = input[8];
> -			activity_monitor->Mem_PD_Data_error_rate_coeff = input[9];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +static int sienna_cichlid_set_power_profile_mode(struct smu_context *smu,
> +						 u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor_external), true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
> +
> +	if (custom_enabled) {
> +		ret = sienna_cichlid_set_power_profile_mode_coeff(smu,
> +								  smu->custom_profile_input,
> +								  smu->custom_profile_size);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       smu->power_profile_mode);
> -	if (workload_type < 0)
> -		return -EINVAL;
>  	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
> -				    1 << workload_type, NULL);
> -	if (ret)
> -		dev_err(smu->adev->dev, "[%s] Failed to set work load mask!", __func__);
> +					      backend_workload_mask, NULL);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
> +		return ret;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> index cd3e9ba3eff4..f9ff1eafef14 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> @@ -1056,42 +1056,27 @@ static int vangogh_get_power_profile_mode(struct smu_context *smu,
>  	return size;
>  }
>  
> -static int vangogh_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> +static int vangogh_set_power_profile_mode(struct smu_context *smu,
> +					  u32 workload_mask)
>  {
> -	int workload_type, ret;
> -	uint32_t profile_mode = input[size];
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
>  
> -	if (profile_mode >= PP_SMC_POWER_PROFILE_COUNT) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", profile_mode);
> -		return -EINVAL;
> -	}
> -
> -	if (profile_mode == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT ||
> -			profile_mode == PP_SMC_POWER_PROFILE_POWERSAVING)
> -		return 0;
> -
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       profile_mode);
> -	if (workload_type < 0) {
> -		dev_dbg(smu->adev->dev, "Unsupported power profile mode %d on VANGOGH\n",
> -					profile_mode);
> -		return -EINVAL;
> -	}
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
>  
>  	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_ActiveProcessNotify,
> -				    1 << workload_type,
> -				    NULL);
> +					      backend_workload_mask,
> +					      NULL);
>  	if (ret) {
> -		dev_err_once(smu->adev->dev, "Fail to set workload type %d\n",
> -					workload_type);
> +		dev_err_once(smu->adev->dev, "Fail to set workload mask 0x%08x\n",
> +			     workload_mask);
>  		return ret;
>  	}
>  
> -	smu->power_profile_mode = profile_mode;
> -
> -	return 0;
> +	return ret;
>  }
>  
>  static int vangogh_set_soft_freq_limited_range(struct smu_context *smu,
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> index a34797f3576b..c45974150ec2 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
> @@ -864,44 +864,27 @@ static int renoir_force_clk_levels(struct smu_context *smu,
>  	return ret;
>  }
>  
> -static int renoir_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> +static int renoir_set_power_profile_mode(struct smu_context *smu,
> +					 u32 workload_mask)
>  {
> -	int workload_type, ret;
> -	uint32_t profile_mode = input[size];
> +	int ret;
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
>  
> -	if (profile_mode > PP_SMC_POWER_PROFILE_CUSTOM) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", profile_mode);
> -		return -EINVAL;
> -	}
> -
> -	if (profile_mode == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT ||
> -			profile_mode == PP_SMC_POWER_PROFILE_POWERSAVING)
> -		return 0;
> -
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       profile_mode);
> -	if (workload_type < 0) {
> -		/*
> -		 * TODO: If some case need switch to powersave/default power mode
> -		 * then can consider enter WORKLOAD_COMPUTE/WORKLOAD_CUSTOM for power saving.
> -		 */
> -		dev_dbg(smu->adev->dev, "Unsupported power profile mode %d on RENOIR\n", profile_mode);
> -		return -EINVAL;
> -	}
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
>  
>  	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_ActiveProcessNotify,
> -				    1 << workload_type,
> -				    NULL);
> +					      backend_workload_mask,
> +					      NULL);
>  	if (ret) {
> -		dev_err_once(smu->adev->dev, "Fail to set workload type %d\n", workload_type);
> +		dev_err_once(smu->adev->dev, "Failed to set workload mask 0x08%x\n",
> +			     workload_mask);
>  		return ret;
>  	}
>  
> -	smu->power_profile_mode = profile_mode;
> -
> -	return 0;
> +	return ret;
>  }
>  
>  static int renoir_set_peak_clock_by_device(struct smu_context *smu)
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> index 199bdd9720d3..a793fee2a086 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
> @@ -2571,82 +2571,76 @@ static int smu_v13_0_0_get_power_profile_mode(struct smu_context *smu,
>  	return size;
>  }
>  
> -static int smu_v13_0_0_set_power_profile_mode(struct smu_context *smu,
> -					      long *input,
> -					      uint32_t size)
> +static int smu_v13_0_0_set_power_profile_mode_coeff(struct smu_context *smu,
> +						    long *input,
> +						    uint32_t size)
>  {
>  	DpmActivityMonitorCoeffIntExternal_t activity_monitor_external;
>  	DpmActivityMonitorCoeffInt_t *activity_monitor =
>  		&(activity_monitor_external.DpmActivityMonitorCoeffInt);
> -	int workload_type, ret = 0;
> -	u32 workload_mask, selected_workload_mask;
> -
> -	smu->power_profile_mode = input[size];
> +	int ret;
>  
> -	if (smu->power_profile_mode >= PP_SMC_POWER_PROFILE_COUNT) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
> +	if (size != 9)
>  		return -EINVAL;
> -	}
> -
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size != 9)
> -			return -EINVAL;
>  
> -		ret = smu_cmn_update_table(smu,
> -					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -					   WORKLOAD_PPLIB_CUSTOM_BIT,
> -					   (void *)(&activity_monitor_external),
> -					   false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external),
> +				   false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor->Gfx_FPS = input[1];
> -			activity_monitor->Gfx_MinActiveFreqType = input[2];
> -			activity_monitor->Gfx_MinActiveFreq = input[3];
> -			activity_monitor->Gfx_BoosterFreqType = input[4];
> -			activity_monitor->Gfx_BoosterFreq = input[5];
> -			activity_monitor->Gfx_PD_Data_limit_c = input[6];
> -			activity_monitor->Gfx_PD_Data_error_coeff = input[7];
> -			activity_monitor->Gfx_PD_Data_error_rate_coeff = input[8];
> -			break;
> -		case 1: /* Fclk */
> -			activity_monitor->Fclk_FPS = input[1];
> -			activity_monitor->Fclk_MinActiveFreqType = input[2];
> -			activity_monitor->Fclk_MinActiveFreq = input[3];
> -			activity_monitor->Fclk_BoosterFreqType = input[4];
> -			activity_monitor->Fclk_BoosterFreq = input[5];
> -			activity_monitor->Fclk_PD_Data_limit_c = input[6];
> -			activity_monitor->Fclk_PD_Data_error_coeff = input[7];
> -			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor->Gfx_FPS = input[1];
> +		activity_monitor->Gfx_MinActiveFreqType = input[2];
> +		activity_monitor->Gfx_MinActiveFreq = input[3];
> +		activity_monitor->Gfx_BoosterFreqType = input[4];
> +		activity_monitor->Gfx_BoosterFreq = input[5];
> +		activity_monitor->Gfx_PD_Data_limit_c = input[6];
> +		activity_monitor->Gfx_PD_Data_error_coeff = input[7];
> +		activity_monitor->Gfx_PD_Data_error_rate_coeff = input[8];
> +		break;
> +	case 1: /* Fclk */
> +		activity_monitor->Fclk_FPS = input[1];
> +		activity_monitor->Fclk_MinActiveFreqType = input[2];
> +		activity_monitor->Fclk_MinActiveFreq = input[3];
> +		activity_monitor->Fclk_BoosterFreqType = input[4];
> +		activity_monitor->Fclk_BoosterFreq = input[5];
> +		activity_monitor->Fclk_PD_Data_limit_c = input[6];
> +		activity_monitor->Fclk_PD_Data_error_coeff = input[7];
> +		activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -					   WORKLOAD_PPLIB_CUSTOM_BIT,
> -					   (void *)(&activity_monitor_external),
> -					   true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> -			return ret;
> -		}
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external),
> +				   true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
>  	}
>  
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       smu->power_profile_mode);
> +	return ret;
> +}
>  
> -	if (workload_type < 0)
> -		return -EINVAL;
> +static int smu_v13_0_0_set_power_profile_mode(struct smu_context *smu,
> +					      u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int workload_type, ret;
>  
> -	selected_workload_mask = workload_mask = 1 << workload_type;
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
>  
>  	/* Add optimizations for SMU13.0.0/10.  Reuse the power saving profile */
>  	if ((amdgpu_ip_version(smu->adev, MP1_HWIP, 0) == IP_VERSION(13, 0, 0) &&
> @@ -2658,15 +2652,26 @@ static int smu_v13_0_0_set_power_profile_mode(struct smu_context *smu,
>  							       CMN2ASIC_MAPPING_WORKLOAD,
>  							       PP_SMC_POWER_PROFILE_POWERSAVING);
>  		if (workload_type >= 0)
> -			workload_mask |= 1 << workload_type;
> +			backend_workload_mask |= 1 << workload_type;
> +	}
> +
> +	if (custom_enabled) {
> +		ret = smu_v13_0_0_set_power_profile_mode_coeff(smu,
> +							       smu->custom_profile_input,
> +							       smu->custom_profile_size);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	ret = smu_cmn_send_smc_msg_with_param(smu,
> -					       SMU_MSG_SetWorkloadMask,
> -					       workload_mask,
> -					       NULL);
> -	if (!ret)
> -		smu->workload_mask = selected_workload_mask;
> +					      SMU_MSG_SetWorkloadMask,
> +					      backend_workload_mask,
> +					      NULL);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
> +		return ret;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index 34c1e0c7e1e4..41113569057b 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -2530,78 +2530,87 @@ do {													\
>  	return result;
>  }
>  
> -static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> +static int smu_v13_0_7_set_power_profile_mode_coeff(struct smu_context *smu,
> +						    long *input, uint32_t size)
>  {
>  
>  	DpmActivityMonitorCoeffIntExternal_t activity_monitor_external;
>  	DpmActivityMonitorCoeffInt_t *activity_monitor =
>  		&(activity_monitor_external.DpmActivityMonitorCoeffInt);
> -	int workload_type, ret = 0;
> +	int ret;
>  
> -	smu->power_profile_mode = input[size];
> +	if (size != 8)
> +		return -EINVAL;
>  
> -	if (smu->power_profile_mode > PP_SMC_POWER_PROFILE_WINDOW3D) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external), false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
> +	}
> +
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor->Gfx_ActiveHystLimit = input[1];
> +		activity_monitor->Gfx_IdleHystLimit = input[2];
> +		activity_monitor->Gfx_FPS = input[3];
> +		activity_monitor->Gfx_MinActiveFreqType = input[4];
> +		activity_monitor->Gfx_BoosterFreqType = input[5];
> +		activity_monitor->Gfx_MinActiveFreq = input[6];
> +		activity_monitor->Gfx_BoosterFreq = input[7];
> +		break;
> +	case 1: /* Fclk */
> +		activity_monitor->Fclk_ActiveHystLimit = input[1];
> +		activity_monitor->Fclk_IdleHystLimit = input[2];
> +		activity_monitor->Fclk_FPS = input[3];
> +		activity_monitor->Fclk_MinActiveFreqType = input[4];
> +		activity_monitor->Fclk_BoosterFreqType = input[5];
> +		activity_monitor->Fclk_MinActiveFreq = input[6];
> +		activity_monitor->Fclk_BoosterFreq = input[7];
> +		break;
> +	default:
>  		return -EINVAL;
>  	}
>  
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size != 8)
> -			return -EINVAL;
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external), true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor_external), false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	return ret;
> +}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor->Gfx_ActiveHystLimit = input[1];
> -			activity_monitor->Gfx_IdleHystLimit = input[2];
> -			activity_monitor->Gfx_FPS = input[3];
> -			activity_monitor->Gfx_MinActiveFreqType = input[4];
> -			activity_monitor->Gfx_BoosterFreqType = input[5];
> -			activity_monitor->Gfx_MinActiveFreq = input[6];
> -			activity_monitor->Gfx_BoosterFreq = input[7];
> -			break;
> -		case 1: /* Fclk */
> -			activity_monitor->Fclk_ActiveHystLimit = input[1];
> -			activity_monitor->Fclk_IdleHystLimit = input[2];
> -			activity_monitor->Fclk_FPS = input[3];
> -			activity_monitor->Fclk_MinActiveFreqType = input[4];
> -			activity_monitor->Fclk_BoosterFreqType = input[5];
> -			activity_monitor->Fclk_MinActiveFreq = input[6];
> -			activity_monitor->Fclk_BoosterFreq = input[7];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu,
> +					      u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
>  
> -		ret = smu_cmn_update_table(smu,
> -				       SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> -				       (void *)(&activity_monitor_external), true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
> +
> +	if (custom_enabled) {
> +		ret = smu_v13_0_7_set_power_profile_mode_coeff(smu,
> +							       smu->custom_profile_input,
> +							       smu->custom_profile_size);
> +		if (ret)
>  			return ret;
> -		}
>  	}
>  
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       smu->power_profile_mode);
> -	if (workload_type < 0)
> -		return -EINVAL;
>  	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
> -				    1 << workload_type, NULL);
> +					      backend_workload_mask, NULL);
>  
> -	if (ret)
> -		dev_err(smu->adev->dev, "[%s] Failed to set work load mask!", __func__);
> -	else
> -		smu->workload_mask = (1 << workload_type);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
> +		return ret;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> index 884938d69fca..90a66913dc97 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c
> @@ -1717,90 +1717,98 @@ static int smu_v14_0_2_get_power_profile_mode(struct smu_context *smu,
>  	return size;
>  }
>  
> -static int smu_v14_0_2_set_power_profile_mode(struct smu_context *smu,
> -					      long *input,
> -					      uint32_t size)
> +static int smu_v14_0_2_set_power_profile_mode_coeff(struct smu_context *smu,
> +						    long *input,
> +						    uint32_t size)
>  {
>  	DpmActivityMonitorCoeffIntExternal_t activity_monitor_external;
>  	DpmActivityMonitorCoeffInt_t *activity_monitor =
>  		&(activity_monitor_external.DpmActivityMonitorCoeffInt);
> -	int workload_type, ret = 0;
> -	uint32_t current_profile_mode = smu->power_profile_mode;
> -	smu->power_profile_mode = input[size];
> +	int ret;
>  
> -	if (smu->power_profile_mode >= PP_SMC_POWER_PROFILE_COUNT) {
> -		dev_err(smu->adev->dev, "Invalid power profile mode %d\n", smu->power_profile_mode);
> +	if (size != 9)
>  		return -EINVAL;
> +
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external),
> +				   false);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> +		return ret;
>  	}
>  
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -		if (size != 9)
> -			return -EINVAL;
> +	switch (input[0]) {
> +	case 0: /* Gfxclk */
> +		activity_monitor->Gfx_FPS = input[1];
> +		activity_monitor->Gfx_MinActiveFreqType = input[2];
> +		activity_monitor->Gfx_MinActiveFreq = input[3];
> +		activity_monitor->Gfx_BoosterFreqType = input[4];
> +		activity_monitor->Gfx_BoosterFreq = input[5];
> +		activity_monitor->Gfx_PD_Data_limit_c = input[6];
> +		activity_monitor->Gfx_PD_Data_error_coeff = input[7];
> +		activity_monitor->Gfx_PD_Data_error_rate_coeff = input[8];
> +		break;
> +	case 1: /* Fclk */
> +		activity_monitor->Fclk_FPS = input[1];
> +		activity_monitor->Fclk_MinActiveFreqType = input[2];
> +		activity_monitor->Fclk_MinActiveFreq = input[3];
> +		activity_monitor->Fclk_BoosterFreqType = input[4];
> +		activity_monitor->Fclk_BoosterFreq = input[5];
> +		activity_monitor->Fclk_PD_Data_limit_c = input[6];
> +		activity_monitor->Fclk_PD_Data_error_coeff = input[7];
> +		activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
>  
> -		ret = smu_cmn_update_table(smu,
> -					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -					   WORKLOAD_PPLIB_CUSTOM_BIT,
> -					   (void *)(&activity_monitor_external),
> -					   false);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -			return ret;
> -		}
> +	ret = smu_cmn_update_table(smu,
> +				   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> +				   WORKLOAD_PPLIB_CUSTOM_BIT,
> +				   (void *)(&activity_monitor_external),
> +				   true);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> +		return ret;
> +	}
>  
> -		switch (input[0]) {
> -		case 0: /* Gfxclk */
> -			activity_monitor->Gfx_FPS = input[1];
> -			activity_monitor->Gfx_MinActiveFreqType = input[2];
> -			activity_monitor->Gfx_MinActiveFreq = input[3];
> -			activity_monitor->Gfx_BoosterFreqType = input[4];
> -			activity_monitor->Gfx_BoosterFreq = input[5];
> -			activity_monitor->Gfx_PD_Data_limit_c = input[6];
> -			activity_monitor->Gfx_PD_Data_error_coeff = input[7];
> -			activity_monitor->Gfx_PD_Data_error_rate_coeff = input[8];
> -			break;
> -		case 1: /* Fclk */
> -			activity_monitor->Fclk_FPS = input[1];
> -			activity_monitor->Fclk_MinActiveFreqType = input[2];
> -			activity_monitor->Fclk_MinActiveFreq = input[3];
> -			activity_monitor->Fclk_BoosterFreqType = input[4];
> -			activity_monitor->Fclk_BoosterFreq = input[5];
> -			activity_monitor->Fclk_PD_Data_limit_c = input[6];
> -			activity_monitor->Fclk_PD_Data_error_coeff = input[7];
> -			activity_monitor->Fclk_PD_Data_error_rate_coeff = input[8];
> -			break;
> -		default:
> -			return -EINVAL;
> -		}
> +	return ret;
> +}
>  
> -		ret = smu_cmn_update_table(smu,
> -					   SMU_TABLE_ACTIVITY_MONITOR_COEFF,
> -					   WORKLOAD_PPLIB_CUSTOM_BIT,
> -					   (void *)(&activity_monitor_external),
> -					   true);
> -		if (ret) {
> -			dev_err(smu->adev->dev, "[%s] Failed to set activity monitor!", __func__);
> -			return ret;
> -		}
> -	}
> +static int smu_v14_0_2_set_power_profile_mode(struct smu_context *smu,
> +					      u32 workload_mask)
> +{
> +	u32 backend_workload_mask = 0;
> +	bool custom_enabled = false;
> +	int ret;
> +
> +	smu_cmn_get_backend_workload_mask(smu, workload_mask,
> +					  &backend_workload_mask,
> +					  &custom_enabled);
>  
> -	if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_COMPUTE)
> +	/* disable deep sleep if compute is enabled */
> +	if (workload_mask & (1 << PP_SMC_POWER_PROFILE_COMPUTE))
>  		smu_v14_0_deep_sleep_control(smu, false);
> -	else if (current_profile_mode == PP_SMC_POWER_PROFILE_COMPUTE)
> +	else
>  		smu_v14_0_deep_sleep_control(smu, true);
>  
> -	/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> -	workload_type = smu_cmn_to_asic_specific_index(smu,
> -						       CMN2ASIC_MAPPING_WORKLOAD,
> -						       smu->power_profile_mode);
> -	if (workload_type < 0)
> -		return -EINVAL;
> +	if (custom_enabled) {
> +		ret = smu_v14_0_2_set_power_profile_mode_coeff(smu,
> +							       smu->custom_profile_input,
> +							       smu->custom_profile_size);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	ret = smu_cmn_send_smc_msg_with_param(smu,
> -					       SMU_MSG_SetWorkloadMask,
> -					       1 << workload_type,
> -					       NULL);
> -	if (!ret)
> -		smu->workload_mask = 1 << workload_type;
> +	ret = smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetWorkloadMask,
> +					      backend_workload_mask, NULL);
> +	if (ret) {
> +		dev_err(smu->adev->dev, "Failed to set workload mask 0x%08x\n",
> +			workload_mask);
> +		return ret;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> index 007a81e108ec..9551c6f69c34 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -1221,3 +1221,33 @@ void smu_cmn_generic_plpd_policy_desc(struct smu_dpm_policy *policy)
>  {
>  	policy->desc = &xgmi_plpd_policy_desc;
>  }
> +
> +void smu_cmn_get_backend_workload_mask(struct smu_context *smu,
> +				       u32 workload_mask,
> +				       u32 *backend_workload_mask,
> +				       bool *custom_enabled)
> +{
> +	int workload_type;
> +	u32 profile_mode;
> +
> +	*custom_enabled = false;
> +	*backend_workload_mask = 0;
> +
> +	for (profile_mode = 0; profile_mode < PP_SMC_POWER_PROFILE_COUNT; profile_mode++) {
> +		if (!(workload_mask & (1 << profile_mode)))
> +			continue;
> +
> +		/* conv PP_SMC_POWER_PROFILE* to WORKLOAD_PPLIB_*_BIT */
> +		workload_type = smu_cmn_to_asic_specific_index(smu,
> +							       CMN2ASIC_MAPPING_WORKLOAD,
> +							       profile_mode);
> +
> +		if (workload_type < 0)
> +			continue;
> +
> +		*backend_workload_mask |= 1 << workload_type;
> +
> +		if (profile_mode == PP_SMC_POWER_PROFILE_CUSTOM)
> +			*custom_enabled = true;
> +	}
> +}
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> index 1de685defe85..8d40c02efa00 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.h
> @@ -147,5 +147,10 @@ bool smu_cmn_is_audio_func_enabled(struct amdgpu_device *adev);
>  void smu_cmn_generic_soc_policy_desc(struct smu_dpm_policy *policy);
>  void smu_cmn_generic_plpd_policy_desc(struct smu_dpm_policy *policy);
>  
> +void smu_cmn_get_backend_workload_mask(struct smu_context *smu,
> +				       u32 workload_mask,
> +				       u32 *backend_workload_mask,
> +				       bool *custom_enabled);
> +
>  #endif
>  #endif
