Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B487EA284DF
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Feb 2025 08:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299D810E138;
	Wed,  5 Feb 2025 07:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hu5pnw+2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991EE10E138
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Feb 2025 07:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaePoCx1NKbX21SCshd/1fROfWHqNFpU2BbqYs6G0m9bYpHWu5ICVFLcPkHX1QLQOpCA+9ECPgXfSij2o4CKXVjFaimQrFWnJnYMDeqmc06L/GfbfzqD3jUAhnsGmemZk9ZcS/fvnsxCQjHeTCpdgNn3fUa6T5F/p/RA+05HkC43jCpqrAHbAQrrxImatEMbUQVkDWyWtV6Pjf/FQiyP7ouTJIuhYNyazYlD50q0iTif/xnyy3aX/spqlkwTVrOtbNil+nlyJelwCp8AYJ0vCRRGNcFCSWpnU16N2C72OWy8Rm7a0085CxF9q+8YEIWBdHQ4JmPH+pBRF6qGwmSYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqNbTSCV5CrUHFbQE3/PMeqMjOOl3gzU81/WgtyJ5fM=;
 b=RWrdWz6xexnJIdRAU1XPMsZ36JqXvL/eRZWJJAUmaJ7jmnvhwaToxDjvZSrhPdKpCNzsyf8Fh8r7I9AunhiAR/fhMtcHn80ZqOcK/iCYZlTbgy01Quad3NyK0mYNf04gQuYwK+aMu1C4KRbdDz3ZpRkbs7LAcdLtbabF8pOWu+n6dZeLbzmWNXDrO1IyIM4VkmstTnty9hO+yePI44WgpxW2q8AtIXguj6xBDlaFuinQpQSyNNgNTCxfsdHuqIDaiaBrr4D+N51DqnAQFMbaCht9FY8Q949WSyvhTPxJXDDCC0tvbRzp7hXRa85SHFEwydl7MvE44jbGxaJNQu5T5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqNbTSCV5CrUHFbQE3/PMeqMjOOl3gzU81/WgtyJ5fM=;
 b=Hu5pnw+2P0KwBpx/7+EDRFeNRyj/yJD1m8qfgiFpDgURyalq9z17LYs/NYtqxcygIUQzUzCztX3PCKNiK2tA06l666LY6azTzss+7CjX73VNKgENeJ6okLt48jSaTwOjj0j7GOfh7qrklyhfRtCzSCxzdqnkJko3he4OXGzIZYE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8)
 by BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 07:18:40 +0000
Received: from CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::8c7e:a1a7:74ac:29a8]) by CH2PR12MB4152.namprd12.prod.outlook.com
 ([fe80::8c7e:a1a7:74ac:29a8%5]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 07:18:38 +0000
Message-ID: <3e9fdb25-aebd-44d6-8973-e329a021f46f@amd.com>
Date: Wed, 5 Feb 2025 15:18:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amd/pm: Add APIs for device access checks
Content-Language: en-US
To: Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Hawking.Zhang@amd.com, Alexander.Deucher@amd.com,
 pierre-eric.pelloux-prayer@amd.com, kenneth.feng@amd.com,
 mario.limonciello@amd.com
References: <20250204063817.1865562-1-lijo.lazar@amd.com>
From: "Xu, Feifei" <feifxu@amd.com>
In-Reply-To: <20250204063817.1865562-1-lijo.lazar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY1PR01CA0200.jpnprd01.prod.outlook.com (2603:1096:403::30)
 To DM6PR12MB4153.namprd12.prod.outlook.com
 (2603:10b6:5:212::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4152:EE_|BY5PR12MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e78ccf-de0c-42b4-918e-08dd45b54f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ykh5dVZBZEUwRCt3TjdTb0R2ckZKYVlhbU5OeEFKaGF2Z1Y4WkVrcWQzK25L?=
 =?utf-8?B?NDFpSVowZlZmTXRiejZqckNIbnJQTUVLOGhCNGk1aUpMNVY3RFp1dld4ajdC?=
 =?utf-8?B?S1YrQi90Wjd3cWFTb0lFSlU3bjFYL25qMktSb2w5blh3WlJaWW1USloycXZr?=
 =?utf-8?B?RWZrdjFhNGVLb0xYb2ZCMUhVTGdWV0ozSGZ3ZG0yRndkeGVTSTIxdTVzOGkr?=
 =?utf-8?B?REpSbGRweXdBMGk2ZHdkWmlGQmdXY25QNVF1U2N4TWlsR1JPVGhXejYxMlJO?=
 =?utf-8?B?eXMxY1ZrUW42NHFReHp2V2Vhd0NlSTZCeWJuOWJmY0RsbDJ3UEtGdk9mSW1W?=
 =?utf-8?B?bk1Kb0ZJcS8zWXBuem5tN3dYZXUxd0hFNDZ1RDBTTnF6VHlTa2pURHM1K1V6?=
 =?utf-8?B?MXhlYnl6bk1TQmh2NG1ZeENoZmI3dDVsMnpWeThDRTlkNHNTTmNlMU5HaFVW?=
 =?utf-8?B?OHliMVo3NXVZcmRzWHZnVGd4eVpya0RFYWNyOXU5K3BneWdNRGk1WjVjT2cw?=
 =?utf-8?B?SEx2RGM5UkhkSlBZSXNYWGZKNERWaXUvcVV4eFZwL2Zqc2dsN2F6R0trWTlJ?=
 =?utf-8?B?MzhCdnd4R2RGc3Yzeng1a0t3SmhSNzIxRU5LWEtKUjNUWWpyc1JwOWhTUzVy?=
 =?utf-8?B?SWNKYlhtejlZdjVlVDJVNU96ZFhRQ0h0WTBxaFBteGJKRWFoRHY4bUxDWHUw?=
 =?utf-8?B?QUZaUjRtWkJOOFZpQ0RUT2JudkswNFQweHVmZHRvNGNiWk1mRC9jUFJWK3hB?=
 =?utf-8?B?T3JoTXRjNmdFWEM3VDl0QU5uQUhYblRqY21LYks5NlBDdHhGUVFoc0MyZ2lv?=
 =?utf-8?B?cmxKanl2TXh0OU0yQ3k1QVBRK2xhRU5yMks5TlFpZTZhVnpqamh2bDZRZlpm?=
 =?utf-8?B?SUFRSFBIRm44ckpZUWt2aFFWTVZLRjdaaEV0aXROSkZlcWRRcTFqRmhyMWt3?=
 =?utf-8?B?Z2d1cGxRb3FXMDNxL0Zrb0ExaVpLTzFJcGRFSEhPMThKdFRUQ0RvSVd2a0tY?=
 =?utf-8?B?UzUxM2M4dUVhanNOeUVaRmxsTW8vRlhYRmE1QkFPdDNNaCtyMWZtNlhvTzg4?=
 =?utf-8?B?cXI1RE9BcDNWV3d5K1pIL3ZxOVpqaS9aUWJqaG11NXUrMDZRSHE1YlRBVDV1?=
 =?utf-8?B?MHkrdDRKSlAzand0KzVmenBuL3pweXhDYngwQ3pWdVpNTEFzM0VrQ3Exdm4z?=
 =?utf-8?B?OGZ6aHBUREhFeDFXbUdYZmF2TnlTbGRwNDR3WDAzN1FjWkUzbGNZN2FEOXhL?=
 =?utf-8?B?blB0aTJWOW9mUk5iN0g5TzNQRWVWSzlxWUU5ckpjdTRVZE8zTFFycUZLR01E?=
 =?utf-8?B?VFd0L2VQNVpGVnFvN3pFM0RMRnNCeEt2V2g1NU1XTFlHbjdydFhFSDlmMXZm?=
 =?utf-8?B?Zis2SmFORnhCR2t1L2twclhTR2U5aU5QazFkY3BhY2V3aUc4TldpRWZmQ09n?=
 =?utf-8?B?UVRRM2JlMlM4bmV2R3pEcXo2WVpaaGVtUFhYNm45MEFqWlBnaG9CNHBYdVls?=
 =?utf-8?B?eHUxZU5DQzVRSnJ3SUxRUFMvd3JFeXN6SHhJekNIeHJVeStoRy9kQzlla0lT?=
 =?utf-8?B?d3RqbTkyWTVHeVErQmZURDFSOVZFNk9BMWpwL3EvRzRsaUlDUGFXMDc1dUpI?=
 =?utf-8?B?M0Q5YjJLTUF4WXcwak1ES3VaYVZRRUFwUzhScTNwUTJ5dEZ3QWQ5MExiWmwr?=
 =?utf-8?B?a2hMVkNzd0dhUTcyMXRxWWZ1Vjl4Y25LQ0VNYWlRZWovRGtoR1dUYXkrSjdX?=
 =?utf-8?B?WkxQQXZ5SzMwZWlrWVdpeTVTZ0RKd2RlaENsZ29mazVtVzJuVXFvSHFRMmVN?=
 =?utf-8?B?NGZEYWs2NEFWTStOeXRxamkzOS9PMkF4UVhOaUY1WUlzK043a0RzS2htMXlw?=
 =?utf-8?Q?Ywr7IEe1eI+Cd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4152.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWgxK1hPamFycTZGdWlBbEFuaVp2TGtUK3lHaVM3SVNGUmlsUVpyaDVkSDZE?=
 =?utf-8?B?VGd6QitJY3pwbXNIZ3B2a2lFcTJuNVE0VUlHOEt4V1E0S1FPWVdBSU41dXVE?=
 =?utf-8?B?bDhTOFJnc1hVL2ZHMGF2VkkxZzNNT2lFWFAwU3ZnanRlZ2ltdWYwKzgzV2pJ?=
 =?utf-8?B?ZGJ2d2RGb2hIUmZ1OTFjd1IzVkpFQkJ1ZUhVakMrdkdDTUZVNXcvNTNTMjhn?=
 =?utf-8?B?UHV3STF6bWRuMFdjcHNqNmpaNlUwaGVHNHkrOWNBbzUrOXlEVWNUa2xySVUy?=
 =?utf-8?B?Wm1sM0JXNE1rNE93VEczdXlHWldpcC80Z09yWWtmRDEvY0ZsTFZ3N3BrdG9z?=
 =?utf-8?B?My9SYkppeE8xVHdqNG9nZ2YzZHArTGhuZjNxekZseGlLYWVHU0x3R09EM1Bl?=
 =?utf-8?B?bFo4ZjNPakJ0V1lTVHpILzI0d1pvSGszd1JwR1gvT1Q5ZzBSVjJkWHkzQW51?=
 =?utf-8?B?bG00eWhYRjVMT3FCeFFsc3FqSUZSVU5PVEZsR2lhdmlDbjc5NjlUWEk2VUJY?=
 =?utf-8?B?R0w4Rmp4b0pKM201bWpRbE9wR1hWYW5XNUg0ZXV4K2NsSFVUL3FQTHNLNkxn?=
 =?utf-8?B?UC9uMDFhQWZ6WEdUaHZvSmV1UTV4YzhSWlpVNWd1NHZzUVBwN3QwVTR4Wjg1?=
 =?utf-8?B?SHVud245Y2krM3QxWE1JMHhHUmxXdUVqeEh3dXFKRjFxWmZObDZaZEExeXVu?=
 =?utf-8?B?Vm4rTXgrVUg0Mk9sUnBNYXp4cUw3MzhxR3F3NElDN1l6MWNhcTN0NWNpdTdq?=
 =?utf-8?B?TzhSeElhZksrekc2VWNqcGExb0s5bk84dHl3Nk5FdE1jaVVqTE9YOGhibUpy?=
 =?utf-8?B?aXlGZFljOStESWFvL2YyQnViUjRpMXhPaXF1YnRMU0FCdVhpd1QwVklIOGdj?=
 =?utf-8?B?UUFKNnkrN3ZlZ1E0YWFkdG8rSDlTcVVBZnJGREhESVc2V2MrYjhibjhFWm1Q?=
 =?utf-8?B?eTRiUlM4NUx5UExiRjd2Y1lGcXZKaFRpZC9LT2NrUThuTjBHcHovMS9BRUNH?=
 =?utf-8?B?S29qYmJMMzJZa3MwQUQvNTFXcFdmYTd0aklpeTFjdHdkRytHNXErdGQwWXpY?=
 =?utf-8?B?VE9uMllxekV2L000ZVdzRzRmZWpEbnBFcmdidjRtTlFzOG95UUxKTk1TblZk?=
 =?utf-8?B?NVVYNUk1S0ZabUlTRDNRZURCNVBVaGEwVENEcjRqWGVEMFh4RW9EV0kwL3ov?=
 =?utf-8?B?YjhpeDRWaGhKWUZpUVh6MEVuMjJjUjJHcTZLcDQ5TGZqejRhOFVNcWVQcXFM?=
 =?utf-8?B?bXNVM1NiTFNONFpKZ1NvRHhaWHkraTBCdVF3N0Z2NGVDbHFhM2dqWXI4REFC?=
 =?utf-8?B?RUtsemlOdWVZelFrbVY1U3lpeU8vSnN5OGhtaGdsUlluRWp1NkcyUlRtZWhn?=
 =?utf-8?B?NEdiQnE5RUpPd1FkWTBhTFkvdFNIRGxqMXRvYVFzbzBkeTJueW0zOXl2WTBT?=
 =?utf-8?B?dGtmNHVTV1pqQllheFZFMjk0K09yTHQ5MFgzMFpnR0NHVnB1ZHpiS1k2d3Jr?=
 =?utf-8?B?c3V5WFJ0MDlGakhIVnYzYlBPQmgxSlI5ZmN2VkxFMGlpVE0wZ245VVBaZXQ5?=
 =?utf-8?B?SlpoaDE4ZHdER0VQS2lLVGoxUUhlZkhjT0Y4cFoyVTYrMTdrYWxUWG9ibDRK?=
 =?utf-8?B?THZDOGpPRnRBNEtkN2FhWUVFL2U4NGVrK0JmdWhaelljdDR3QjYwZk5RZ1Nv?=
 =?utf-8?B?cHowU25jZ2lMNkk2ZXRzMW54MVdVem52aFVwMlNwZk1zSm1xUFdIZkViaXZn?=
 =?utf-8?B?Z2Ezczk5YUdYWVJMdkt0RFlSalJLeUpqendhWmdLZ0NPTklINThkUVV5VndU?=
 =?utf-8?B?bXVsaUtUVDRFdU42Nm5OTDNhTUEvanlRc3Fkdlh4Q3h0VTVGQUd6ekdXOEZV?=
 =?utf-8?B?NFB2N1NweWxYZDN1WVpQYk9oRXJrODlCTVFzdENPTTM1UkZOZmM2bDhxeHhy?=
 =?utf-8?B?NUFIVFdFUEordHZ3c081bXphaGZLUUN5NTM0Q1VQSi9EMUozK0FTR1R0eEM5?=
 =?utf-8?B?Nk92WUZROENNZUtKTG1TZ01ZODFGY0t4dzV1TVdIeXFhVU5nSzE5WUhWanNX?=
 =?utf-8?B?YVVScUVyME1KSGp3ZjJ0aUJWZEFnMGlqa2ZxUTRDQkJrYk9QNytaajF3NEpo?=
 =?utf-8?Q?Chw1x8tzjHjZroxJZshS9cP4o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e78ccf-de0c-42b4-918e-08dd45b54f82
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4153.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 07:18:38.7210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3xLd6mzQIdcW9kkzpgxMe4tYD/OOvl6WvH7WFZt8OJn4GTSXHs17B3HTS5zey8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292
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

Series is Reviewed-by: Feifei Xu <Feifei Xu@amd.com>

On 2/4/2025 2:38 PM, Lijo Lazar wrote:
> Wrap the checks before device access in helper functions and use them
> for device access. The generic order of APIs now is to do input argument
> validation first and check if device access is allowed.
>
> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> ---
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 616 +++++++++++------------------
>   1 file changed, 229 insertions(+), 387 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 0aca0803514e..0fe0b798f559 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -97,6 +97,77 @@ const char * const amdgpu_pp_profile_name[] = {
>   	"UNCAPPED",
>   };
>   
> +/**
> + * amdgpu_pm_dev_state_check - Check if device can be accessed.
> + * @adev: Target device.
> + *
> + * Checks the state of the @adev for access. Return 0 if the device is
> + * accessible or a negative error code otherwise.
> + */
> +static int amdgpu_pm_dev_state_check(struct amdgpu_device *adev)
> +{
> +	if (amdgpu_in_reset(adev))
> +		return -EPERM;
> +	if (adev->in_suspend && !adev->in_runpm)
> +		return -EPERM;
> +
> +	return 0;
> +}
> +
> +/**
> + * amdgpu_pm_get_access - Check if device can be accessed, resume if needed.
> + * @adev: Target device.
> + *
> + * Checks the state of the @adev for access. Use runtime pm API to resume if
> + * needed. Return 0 if the device is accessible or a negative error code
> + * otherwise.
> + */
> +static int amdgpu_pm_get_access(struct amdgpu_device *adev)
> +{
> +	int ret;
> +
> +	ret = amdgpu_pm_dev_state_check(adev);
> +	if (ret)
> +		return ret;
> +
> +	return pm_runtime_resume_and_get(adev->dev);
> +}
> +
> +/**
> + * amdgpu_pm_get_access_if_active - Check if device is active for access.
> + * @adev: Target device.
> + *
> + * Checks the state of the @adev for access. Use runtime pm API to determine
> + * if device is active. Allow access only if device is active.Return 0 if the
> + * device is accessible or a negative error code otherwise.
> + */
> +static int amdgpu_pm_get_access_if_active(struct amdgpu_device *adev)
> +{
> +	int ret;
> +
> +	ret = amdgpu_pm_dev_state_check(adev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_get_if_active(adev->dev);
> +	if (ret <= 0)
> +		return ret ?: -EPERM;
> +
> +	return 0;
> +}
> +
> +/**
> + * amdgpu_pm_put_access - Put to auto suspend mode after a device access.
> + * @adev: Target device.
> + *
> + * Should be paired with amdgpu_pm_get_access* calls
> + */
> +static inline void amdgpu_pm_put_access(struct amdgpu_device *adev)
> +{
> +	pm_runtime_mark_last_busy(adev->dev);
> +	pm_runtime_put_autosuspend(adev->dev);
> +}
> +
>   /**
>    * DOC: power_dpm_state
>    *
> @@ -140,18 +211,13 @@ static ssize_t amdgpu_get_power_dpm_state(struct device *dev,
>   	enum amd_pm_state_type pm;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	amdgpu_dpm_get_current_power_state(adev, &pm);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return sysfs_emit(buf, "%s\n",
>   			  (pm == POWER_STATE_TYPE_BATTERY) ? "battery" :
> @@ -168,11 +234,6 @@ static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
>   	enum amd_pm_state_type  state;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	if (strncmp("battery", buf, strlen("battery")) == 0)
>   		state = POWER_STATE_TYPE_BATTERY;
>   	else if (strncmp("balanced", buf, strlen("balanced")) == 0)
> @@ -182,14 +243,13 @@ static ssize_t amdgpu_set_power_dpm_state(struct device *dev,
>   	else
>   		return -EINVAL;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	amdgpu_dpm_set_power_state(adev, state);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   }
> @@ -263,18 +323,13 @@ static ssize_t amdgpu_get_power_dpm_force_performance_level(struct device *dev,
>   	enum amd_dpm_forced_level level = 0xff;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	level = amdgpu_dpm_get_performance_level(adev);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return sysfs_emit(buf, "%s\n",
>   			  (level == AMD_DPM_FORCED_LEVEL_AUTO) ? "auto" :
> @@ -299,11 +354,6 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
>   	enum amd_dpm_forced_level level;
>   	int ret = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	if (strncmp("low", buf, strlen("low")) == 0) {
>   		level = AMD_DPM_FORCED_LEVEL_LOW;
>   	} else if (strncmp("high", buf, strlen("high")) == 0) {
> @@ -328,14 +378,13 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	mutex_lock(&adev->pm.stable_pstate_ctx_lock);
>   	if (amdgpu_dpm_force_performance_level(adev, level)) {
> -		pm_runtime_mark_last_busy(ddev->dev);
> -		pm_runtime_put_autosuspend(ddev->dev);
> +		amdgpu_pm_put_access(adev);
>   		mutex_unlock(&adev->pm.stable_pstate_ctx_lock);
>   		return -EINVAL;
>   	}
> @@ -343,8 +392,7 @@ static ssize_t amdgpu_set_power_dpm_force_performance_level(struct device *dev,
>   	adev->pm.stable_pstate_ctx = NULL;
>   	mutex_unlock(&adev->pm.stable_pstate_ctx_lock);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   }
> @@ -359,19 +407,14 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
>   	uint32_t i;
>   	int buf_len, ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	if (amdgpu_dpm_get_pp_num_states(adev, &data))
>   		memset(&data, 0, sizeof(data));
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	buf_len = sysfs_emit(buf, "states: %d\n", data.nums);
>   	for (i = 0; i < data.nums; i++)
> @@ -394,20 +437,15 @@ static ssize_t amdgpu_get_pp_cur_state(struct device *dev,
>   	enum amd_pm_state_type pm = 0;
>   	int i = 0, ret = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	amdgpu_dpm_get_current_power_state(adev, &pm);
>   
>   	ret = amdgpu_dpm_get_pp_num_states(adev, &data);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return ret;
> @@ -429,11 +467,11 @@ static ssize_t amdgpu_get_pp_force_state(struct device *dev,
>   {
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> +	ret = amdgpu_pm_dev_state_check(adev);
> +	if (ret)
> +		return ret;
>   
>   	if (adev->pm.pp_force_state_enabled)
>   		return amdgpu_get_pp_cur_state(dev, attr, buf);
> @@ -453,11 +491,6 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
>   	unsigned long idx;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	adev->pm.pp_force_state_enabled = false;
>   
>   	if (strlen(buf) == 1)
> @@ -469,7 +502,7 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
>   
>   	idx = array_index_nospec(idx, ARRAY_SIZE(data.states));
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -490,14 +523,13 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
>   		adev->pm.pp_force_state_enabled = true;
>   	}
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   
>   err_out:
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
> +
>   	return ret;
>   }
>   
> @@ -521,18 +553,13 @@ static ssize_t amdgpu_get_pp_table(struct device *dev,
>   	char *table = NULL;
>   	int size, ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_get_pp_table(adev, &table);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (size <= 0)
>   		return size;
> @@ -554,19 +581,13 @@ static ssize_t amdgpu_set_pp_table(struct device *dev,
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
>   	int ret = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_pp_table(adev, buf, count);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return ret;
> @@ -735,11 +756,6 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
>   	const char delimiter[3] = {' ', '\n', '\0'};
>   	uint32_t type;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	if (count > 127 || count == 0)
>   		return -EINVAL;
>   
> @@ -785,7 +801,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
>   			tmp_str++;
>   	}
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -806,14 +822,13 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct device *dev,
>   			goto err_out;
>   	}
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   
>   err_out:
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
> +
>   	return -EINVAL;
>   }
>   
> @@ -835,14 +850,9 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
>   	};
>   	uint clk_index;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	for (clk_index = 0 ; clk_index < 6 ; clk_index++) {
>   		ret = amdgpu_dpm_emit_clock_levels(adev, od_clocks[clk_index], buf, &size);
> @@ -861,7 +871,7 @@ static ssize_t amdgpu_get_pp_od_clk_voltage(struct device *dev,
>   	if (size == 0)
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -892,23 +902,17 @@ static ssize_t amdgpu_set_pp_features(struct device *dev,
>   	uint64_t featuremask;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	ret = kstrtou64(buf, 0, &featuremask);
>   	if (ret)
>   		return -EINVAL;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_ppfeature_status(adev, featuremask);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return -EINVAL;
> @@ -925,20 +929,15 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>   	ssize_t size;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_get_ppfeature_status(adev, buf);
>   	if (size <= 0)
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -991,14 +990,9 @@ static ssize_t amdgpu_get_pp_dpm_clock(struct device *dev,
>   	int size = 0;
>   	int ret = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	ret = amdgpu_dpm_emit_clock_levels(adev, type, buf, &size);
>   	if (ret == -ENOENT)
> @@ -1007,7 +1001,7 @@ static ssize_t amdgpu_get_pp_dpm_clock(struct device *dev,
>   	if (size == 0)
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -1057,23 +1051,17 @@ static ssize_t amdgpu_set_pp_dpm_clock(struct device *dev,
>   	int ret;
>   	uint32_t mask = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	ret = amdgpu_read_mask(buf, count, &mask);
>   	if (ret)
>   		return ret;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_force_clock_level(adev, type, mask);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return -EINVAL;
> @@ -1240,18 +1228,13 @@ static ssize_t amdgpu_get_pp_sclk_od(struct device *dev,
>   	uint32_t value = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	value = amdgpu_dpm_get_sclk_od(adev);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return sysfs_emit(buf, "%d\n", value);
>   }
> @@ -1266,24 +1249,18 @@ static ssize_t amdgpu_set_pp_sclk_od(struct device *dev,
>   	int ret;
>   	long int value;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	ret = kstrtol(buf, 0, &value);
>   
>   	if (ret)
>   		return -EINVAL;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	amdgpu_dpm_set_sclk_od(adev, (uint32_t)value);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   }
> @@ -1297,18 +1274,13 @@ static ssize_t amdgpu_get_pp_mclk_od(struct device *dev,
>   	uint32_t value = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	value = amdgpu_dpm_get_mclk_od(adev);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return sysfs_emit(buf, "%d\n", value);
>   }
> @@ -1323,24 +1295,18 @@ static ssize_t amdgpu_set_pp_mclk_od(struct device *dev,
>   	int ret;
>   	long int value;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	ret = kstrtol(buf, 0, &value);
>   
>   	if (ret)
>   		return -EINVAL;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	amdgpu_dpm_set_mclk_od(adev, (uint32_t)value);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   }
> @@ -1378,20 +1344,15 @@ static ssize_t amdgpu_get_pp_power_profile_mode(struct device *dev,
>   	ssize_t size;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_get_power_profile_mode(adev, buf);
>   	if (size <= 0)
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -1414,11 +1375,6 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
>   	long int profile_mode = 0;
>   	const char delimiter[3] = {' ', '\n', '\0'};
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	tmp[0] = *(buf);
>   	tmp[1] = '\0';
>   	ret = kstrtol(tmp, 0, &profile_mode);
> @@ -1445,14 +1401,13 @@ static ssize_t amdgpu_set_pp_power_profile_mode(struct device *dev,
>   	}
>   	parameter[parameter_size] = profile_mode;
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_power_profile_mode(adev, parameter, parameter_size);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (!ret)
>   		return count;
> @@ -1466,19 +1421,14 @@ static int amdgpu_hwmon_get_sensor_generic(struct amdgpu_device *adev,
>   {
>   	int r, size = sizeof(uint32_t);
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	r = pm_runtime_get_if_active(adev->dev);
> -	if (r <= 0)
> -		return r ?: -EPERM;
> +	r = amdgpu_pm_get_access_if_active(adev);
> +	if (r)
> +		return r;
>   
>   	/* get the sensor value */
>   	r = amdgpu_dpm_read_sensor(adev, sensor, query, &size);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return r;
>   }
> @@ -1576,24 +1526,19 @@ static ssize_t amdgpu_get_pcie_bw(struct device *dev,
>   	uint64_t count0 = 0, count1 = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	if (adev->flags & AMD_IS_APU)
>   		return -ENODATA;
>   
>   	if (!adev->asic_funcs->get_pcie_usage)
>   		return -ENODATA;
>   
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	amdgpu_asic_get_pcie_usage(adev, &count0, &count1);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return sysfs_emit(buf, "%llu %llu %i\n",
>   			  count0, count1, pcie_get_mps(adev->pdev));
> @@ -1615,12 +1560,11 @@ static ssize_t amdgpu_get_unique_id(struct device *dev,
>   {
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	int r;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> +	r = amdgpu_pm_dev_state_check(adev);
> +	if (r)
> +		return r;
>   	if (adev->unique_id)
>   		return sysfs_emit(buf, "%016llx\n", adev->unique_id);
>   
> @@ -1715,9 +1659,9 @@ static ssize_t amdgpu_get_apu_thermal_cap(struct device *dev,
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
>   
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	ret = amdgpu_dpm_get_apu_thermal_limit(adev, &limit);
>   	if (!ret)
> @@ -1725,7 +1669,7 @@ static ssize_t amdgpu_get_apu_thermal_cap(struct device *dev,
>   	else
>   		size = sysfs_emit(buf, "failed to get thermal limit\n");
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -1749,20 +1693,18 @@ static ssize_t amdgpu_set_apu_thermal_cap(struct device *dev,
>   		return -EINVAL;
>   	}
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_apu_thermal_limit(adev, value);
>   	if (ret) {
> -		pm_runtime_mark_last_busy(ddev->dev);
> -		pm_runtime_put_autosuspend(ddev->dev);
> +		amdgpu_pm_put_access(adev);
>   		dev_err(dev, "failed to update thermal limit\n");
>   		return ret;
>   	}
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   }
> @@ -1786,18 +1728,13 @@ static ssize_t amdgpu_get_pm_metrics(struct device *dev,
>   	ssize_t size = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_get_pm_metrics(adev, buf, PAGE_SIZE);
>   
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -1824,14 +1761,9 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
>   	ssize_t size = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(ddev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_get_gpu_metrics(adev, &gpu_metrics);
>   	if (size <= 0)
> @@ -1843,7 +1775,7 @@ static ssize_t amdgpu_get_gpu_metrics(struct device *dev,
>   	memcpy(buf, gpu_metrics, size);
>   
>   out:
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -1939,19 +1871,14 @@ static ssize_t amdgpu_set_smartshift_bias(struct device *dev,
>   	int r = 0;
>   	int bias = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	r = pm_runtime_resume_and_get(ddev->dev);
> -	if (r < 0)
> -		return r;
> -
>   	r = kstrtoint(buf, 10, &bias);
>   	if (r)
>   		goto out;
>   
> +	r = amdgpu_pm_get_access(adev);
> +	if (r < 0)
> +		return r;
> +
>   	if (bias > AMDGPU_SMARTSHIFT_MAX_BIAS)
>   		bias = AMDGPU_SMARTSHIFT_MAX_BIAS;
>   	else if (bias < AMDGPU_SMARTSHIFT_MIN_BIAS)
> @@ -1963,8 +1890,8 @@ static ssize_t amdgpu_set_smartshift_bias(struct device *dev,
>   	/* TODO: update bias level with SMU message */
>   
>   out:
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
> +
>   	return r;
>   }
>   
> @@ -2218,14 +2145,14 @@ static ssize_t amdgpu_get_pm_policy_attr(struct device *dev,
>   	struct drm_device *ddev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(ddev);
>   	struct amdgpu_pm_policy_attr *policy_attr;
> +	int r;
>   
>   	policy_attr =
>   		container_of(attr, struct amdgpu_pm_policy_attr, dev_attr);
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> +	r = amdgpu_pm_dev_state_check(adev);
> +	if (r)
> +		return r;
>   
>   	return amdgpu_dpm_get_pm_policy_info(adev, policy_attr->id, buf);
>   }
> @@ -2243,11 +2170,6 @@ static ssize_t amdgpu_set_pm_policy_attr(struct device *dev,
>   	char *tmp, *param;
>   	long val;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	count = min(count, sizeof(tmp_buf));
>   	memcpy(tmp_buf, buf, count);
>   	tmp_buf[count - 1] = '\0';
> @@ -2273,14 +2195,13 @@ static ssize_t amdgpu_set_pm_policy_attr(struct device *dev,
>   	policy_attr =
>   		container_of(attr, struct amdgpu_pm_policy_attr, dev_attr);
>   
> -	ret = pm_runtime_resume_and_get(ddev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_pm_policy(adev, policy_attr->id, val);
>   
> -	pm_runtime_mark_last_busy(ddev->dev);
> -	pm_runtime_put_autosuspend(ddev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return ret;
> @@ -2704,18 +2625,13 @@ static ssize_t amdgpu_hwmon_get_pwm1_enable(struct device *dev,
>   	u32 pwm_mode = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(adev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	ret = amdgpu_dpm_get_fan_control_mode(adev, &pwm_mode);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return -EINVAL;
> @@ -2733,11 +2649,6 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
>   	u32 pwm_mode;
>   	int value;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	err = kstrtoint(buf, 10, &value);
>   	if (err)
>   		return err;
> @@ -2751,14 +2662,13 @@ static ssize_t amdgpu_hwmon_set_pwm1_enable(struct device *dev,
>   	else
>   		return -EINVAL;
>   
> -	ret = pm_runtime_resume_and_get(adev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
>   	ret = amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
>   
> -	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return -EINVAL;
> @@ -2789,16 +2699,11 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
>   	u32 value;
>   	u32 pwm_mode;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	err = kstrtou32(buf, 10, &value);
>   	if (err)
>   		return err;
>   
> -	err = pm_runtime_resume_and_get(adev->dev);
> +	err = amdgpu_pm_get_access(adev);
>   	if (err < 0)
>   		return err;
>   
> @@ -2815,8 +2720,7 @@ static ssize_t amdgpu_hwmon_set_pwm1(struct device *dev,
>   	err = amdgpu_dpm_set_fan_speed_pwm(adev, value);
>   
>   out:
> -	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -2832,18 +2736,13 @@ static ssize_t amdgpu_hwmon_get_pwm1(struct device *dev,
>   	int err;
>   	u32 speed = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	err = pm_runtime_get_if_active(adev->dev);
> -	if (err <= 0)
> -		return err ?: -EPERM;
> +	err = amdgpu_pm_get_access_if_active(adev);
> +	if (err)
> +		return err;
>   
>   	err = amdgpu_dpm_get_fan_speed_pwm(adev, &speed);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -2859,18 +2758,13 @@ static ssize_t amdgpu_hwmon_get_fan1_input(struct device *dev,
>   	int err;
>   	u32 speed = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	err = pm_runtime_get_if_active(adev->dev);
> -	if (err <= 0)
> -		return err ?: -EPERM;
> +	err = amdgpu_pm_get_access_if_active(adev);
> +	if (err)
> +		return err;
>   
>   	err = amdgpu_dpm_get_fan_speed_rpm(adev, &speed);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -2920,18 +2814,13 @@ static ssize_t amdgpu_hwmon_get_fan1_target(struct device *dev,
>   	int err;
>   	u32 rpm = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	err = pm_runtime_get_if_active(adev->dev);
> -	if (err <= 0)
> -		return err ?: -EPERM;
> +	err = amdgpu_pm_get_access_if_active(adev);
> +	if (err)
> +		return err;
>   
>   	err = amdgpu_dpm_get_fan_speed_rpm(adev, &rpm);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -2948,16 +2837,11 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
>   	u32 value;
>   	u32 pwm_mode;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	err = kstrtou32(buf, 10, &value);
>   	if (err)
>   		return err;
>   
> -	err = pm_runtime_resume_and_get(adev->dev);
> +	err = amdgpu_pm_get_access(adev);
>   	if (err < 0)
>   		return err;
>   
> @@ -2973,8 +2857,7 @@ static ssize_t amdgpu_hwmon_set_fan1_target(struct device *dev,
>   	err = amdgpu_dpm_set_fan_speed_rpm(adev, value);
>   
>   out:
> -	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -2990,18 +2873,13 @@ static ssize_t amdgpu_hwmon_get_fan1_enable(struct device *dev,
>   	u32 pwm_mode = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(adev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	ret = amdgpu_dpm_get_fan_control_mode(adev, &pwm_mode);
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (ret)
>   		return -EINVAL;
> @@ -3019,11 +2897,6 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
>   	int value;
>   	u32 pwm_mode;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	err = kstrtoint(buf, 10, &value);
>   	if (err)
>   		return err;
> @@ -3035,14 +2908,13 @@ static ssize_t amdgpu_hwmon_set_fan1_enable(struct device *dev,
>   	else
>   		return -EINVAL;
>   
> -	err = pm_runtime_resume_and_get(adev->dev);
> +	err = amdgpu_pm_get_access(adev);
>   	if (err < 0)
>   		return err;
>   
>   	err = amdgpu_dpm_set_fan_control_mode(adev, pwm_mode);
>   
> -	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return -EINVAL;
> @@ -3157,14 +3029,9 @@ static ssize_t amdgpu_hwmon_show_power_cap_generic(struct device *dev,
>   	ssize_t size;
>   	int r;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	r = pm_runtime_get_if_active(adev->dev);
> -	if (r <= 0)
> -		return r ?: -EPERM;
> +	r = amdgpu_pm_get_access_if_active(adev);
> +	if (r)
> +		return r;
>   
>   	r = amdgpu_dpm_get_power_limit(adev, &limit,
>   				      pp_limit_level, power_type);
> @@ -3174,7 +3041,7 @@ static ssize_t amdgpu_hwmon_show_power_cap_generic(struct device *dev,
>   	else
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -3235,11 +3102,6 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
>   	int err;
>   	u32 value;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	if (amdgpu_sriov_vf(adev))
>   		return -EINVAL;
>   
> @@ -3250,14 +3112,13 @@ static ssize_t amdgpu_hwmon_set_power_cap(struct device *dev,
>   	value = value / 1000000; /* convert to Watt */
>   	value |= limit_type << 24;
>   
> -	err = pm_runtime_resume_and_get(adev->dev);
> +	err = amdgpu_pm_get_access(adev);
>   	if (err < 0)
>   		return err;
>   
>   	err = amdgpu_dpm_set_power_limit(adev, value);
>   
> -	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
> -	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	if (err)
>   		return err;
> @@ -3695,20 +3556,15 @@ static int amdgpu_retrieve_od_settings(struct amdgpu_device *adev,
>   	int size = 0;
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	ret = pm_runtime_get_if_active(adev->dev);
> -	if (ret <= 0)
> -		return ret ?: -EPERM;
> +	ret = amdgpu_pm_get_access_if_active(adev);
> +	if (ret)
> +		return ret;
>   
>   	size = amdgpu_dpm_print_clock_levels(adev, od_type, buf);
>   	if (size == 0)
>   		size = sysfs_emit(buf, "\n");
>   
> -	pm_runtime_put_autosuspend(adev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return size;
>   }
> @@ -3776,11 +3632,6 @@ amdgpu_distribute_custom_od_settings(struct amdgpu_device *adev,
>   	long parameter[64];
>   	int ret;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
>   	ret = parse_input_od_command_lines(in_buf,
>   					   count,
>   					   &cmd_type,
> @@ -3789,7 +3640,7 @@ amdgpu_distribute_custom_od_settings(struct amdgpu_device *adev,
>   	if (ret)
>   		return ret;
>   
> -	ret = pm_runtime_resume_and_get(adev->dev);
> +	ret = amdgpu_pm_get_access(adev);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -3808,14 +3659,12 @@ amdgpu_distribute_custom_od_settings(struct amdgpu_device *adev,
>   			goto err_out;
>   	}
>   
> -	pm_runtime_mark_last_busy(adev->dev);
> -	pm_runtime_put_autosuspend(adev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return count;
>   
>   err_out:
> -	pm_runtime_mark_last_busy(adev->dev);
> -	pm_runtime_put_autosuspend(adev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return ret;
>   }
> @@ -4785,16 +4634,10 @@ static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
>   static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
> -	struct drm_device *dev = adev_to_drm(adev);
>   	u64 flags = 0;
>   	int r;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> -
> -	r = pm_runtime_resume_and_get(dev->dev);
> +	r = amdgpu_pm_get_access(adev);
>   	if (r < 0)
>   		return r;
>   
> @@ -4811,7 +4654,7 @@ static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
>   	seq_printf(m, "\n");
>   
>   out:
> -	pm_runtime_put_autosuspend(dev->dev);
> +	amdgpu_pm_put_access(adev);
>   
>   	return r;
>   }
> @@ -4831,10 +4674,9 @@ static ssize_t amdgpu_pm_prv_buffer_read(struct file *f, char __user *buf,
>   	void *smu_prv_buf;
>   	int ret = 0;
>   
> -	if (amdgpu_in_reset(adev))
> -		return -EPERM;
> -	if (adev->in_suspend && !adev->in_runpm)
> -		return -EPERM;
> +	ret = amdgpu_pm_dev_state_check(adev);
> +	if (ret)
> +		return ret;
>   
>   	ret = amdgpu_dpm_get_smu_prv_buf_details(adev, &smu_prv_buf, &smu_prv_buf_size);
>   	if (ret)
