Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846B1A1908A
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Jan 2025 12:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32ED810E6BF;
	Wed, 22 Jan 2025 11:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uDrBD7zo";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9176C10E6BF
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jan 2025 11:23:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzF8TbyZ4VaTIUTYl7L8+yD9cATwN2gREpuPytXTZ3RBnWLTVpFIJZs7ruQGMXLoDNzT0vvm3rqTi8zDqMkN4o56lwbjlkbKcwjCi4ijqZezqnThhi8oICvv340CHk0W9e4nDMB2SxHFY95+ec2vqgx88WlrByigcbWEUftYhBlhWjSuiGdvJ4iSqd99xrvbGwcdEZvGVDgEc/0oWHNepZDje1yuqHkd3kulwvC4u4x8xQrn2MB1lhhZnA/MnawP/9THf5hchS2isAWL/lOvykkJu894GkgeSd7uqTV8+4oUmAgTohGJDhVBkmHsJjCYpZnNlTjWDtNU39hq2K+2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YOtCexo/pIDq5DxrZiTRcoBnSiXunpK/Z3fjD08fr4=;
 b=ZfdynlYKiZ7whEpk/sCpdrlIIUfjNlTW6RfElDbSQwIpV9iF9VKpIh4NDkm1MFQF857z2iPKdk4Uwe+KYWrQT0EKIC5CpXPIqZ+igFIMyBxM5dZrocCETBf6FxlSx5QeoywDTjjdeTprCQF3wggK4asKuYWozx27/jjnXrrZIdRK936Qepq8ha9wEzHacI+372TepR1JZuMsl/QOWZ4onkjmX2c3DQIyG0XZuR4KOwf8tala976PNJyuPO7ShmczbYyH1OKjMEWXn1frJk/5opQLaWptKC8qFG4MwNTK1n7OCTI2ePGu+rOj01J2W9Io5xmMYCeMhvZzgWtMURFVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YOtCexo/pIDq5DxrZiTRcoBnSiXunpK/Z3fjD08fr4=;
 b=uDrBD7zogTbZGkHgOhLfr37PCyPvzDy/PpMLeIJ/SSksJJ0QxmhsAwlNHsjGW7M9Rz6ZvtqV398XxYIk3GHXegB9hnipLf0CJkQNFW+lwNZwobeOaKxUhfcICRn2XZPOe821mT0/9qI3eJt+T8q07nwj1wxS0cIvLFyv+rsgrOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB7820.namprd12.prod.outlook.com (2603:10b6:510:268::8)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 11:23:28 +0000
Received: from PH7PR12MB7820.namprd12.prod.outlook.com
 ([fe80::7606:59:8d0d:6d4c]) by PH7PR12MB7820.namprd12.prod.outlook.com
 ([fe80::7606:59:8d0d:6d4c%4]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 11:23:28 +0000
Message-ID: <e901bd2f-7afc-4d6e-b5b0-2fca44719ed7@amd.com>
Date: Wed, 22 Jan 2025 16:53:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] drm/amd/pm: Add metrics support for smuv13.0.12
To: Asad Kamal <asad.kamal@amd.com>, amd-gfx@lists.freedesktop.org
Cc: le.ma@amd.com, hawking.zhang@amd.com, shiwu.zhang@amd.com,
 alexander.deucher@amd.com
References: <20250122095543.148993-1-asad.kamal@amd.com>
 <20250122095543.148993-4-asad.kamal@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20250122095543.148993-4-asad.kamal@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To PH7PR12MB7820.namprd12.prod.outlook.com
 (2603:10b6:510:268::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7820:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: e075f36d-95fe-4268-e7dd-08dd3ad731a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWxXOWJXOWdwWXpSOXl2Y0NtOEViZzYzS0ttbUZxR2pmTUxkdkVKelJoaTdN?=
 =?utf-8?B?YWlzTk1rMjFKUGNXTGwxcUdPVnZ5MmsrUVlQQlA3ZWlNYXN4QTZsQTlJOVJM?=
 =?utf-8?B?WWRyTytpYWFkem5MWkVsV1BIY2ZEYThIeGVDQWg0VDRFRCtTQzhwWHZmSHJ1?=
 =?utf-8?B?VHZod283ZEREb0paWllLNnB4Yjc4SDA0VjBJZlpSeEhHTnRlWUVwSU8rN0JB?=
 =?utf-8?B?R1RBbWRsWTlmdXQzaUlCNGdMamNKZjVja2hiekxxYmdmM1l3cCtnYjBrZU1E?=
 =?utf-8?B?TUJSSEVsSC90Z1V4YzhmRGRSbzk4KzQ2dGpEMldmK3dqNThkcERmR3dXQ25X?=
 =?utf-8?B?anN4NnpYK25VcUlUL3k2ZkZnODRTNDNnaXVBaE5tb3VwaDl2bzlMaTlIdEo5?=
 =?utf-8?B?UG1yWjdab0J6N0I2U1hlWXpJcUdGclp3a09uYy8yZGRTYVRmNUwxQ3YrZ1FC?=
 =?utf-8?B?VEdzWjFsRFNiMVZadk1HczdBSFdzNy93cTZXQ1MvajhqLzRVK1dZdW5aKzls?=
 =?utf-8?B?SnFUWmxOa1ZGY0dkUmVWV3pUUlgyQlJHZ01ob09RNHM5WjJvaWFPazV5M2ZS?=
 =?utf-8?B?UElobFBnWVdDRU5hREF4OWFiMk5LUkJUYkk2dGFyS1FPQUR5ZUJITkJCTlB5?=
 =?utf-8?B?aXBoZlJUUW1rRGQ4dG9POVFiUmpMajR6RkNWVkJSdnFZMXk0MzRXM1hoc1N3?=
 =?utf-8?B?VWxYMHRnVnI4dy9lRjQyV1JLc2xmcjR6UVN6TnpUMGx5TlFxQmNjK0VwNkY5?=
 =?utf-8?B?YVJ2T0FIdHI1NWcvNUxzRjdzMFBOKzJ6b3F6Y1N0WnE3dHYxVW82dTNBY1ZJ?=
 =?utf-8?B?L25EUmhscWZxRlVTWlpuRW1rU2IrMy8yVyszUGRObEh1MDg2UWdUSGxBK25a?=
 =?utf-8?B?V1AvSk5QdDJwMkFoMStBZWVpZEVxSklNa04wemlqY1ZJQVpGZXkxQVpIUUl3?=
 =?utf-8?B?UVlpTFV6L1hyb0FtSUFUaENmcWNDbDBvMXNrK1N2UWVWN0dlSlJRZW1iNytE?=
 =?utf-8?B?RjcweUdqVXM5VkpXT1B3aU1VMDJrTTZBT2ljY0tPZ1RmdnpDT1ppOTNoR2Nm?=
 =?utf-8?B?MDlrS1pHbU85KzJ5TVBtRm1nNXZablBLUkdhUUtibmV6bjNVaE9iaEx4OXRm?=
 =?utf-8?B?ZGNBM1N1cFFoNGQ4d09hMllXOENneXlzZ2hlR1ZqRWJQbUJIRGpSaFBoUEV6?=
 =?utf-8?B?bzV4S0p1UnhxZFNxSjNOUUFvV2VxV1JoeWNQbkVTZnVISzZod2hGTjQvRFRW?=
 =?utf-8?B?Qmh2ZVM1WFQ1c3FmZWxvQVlBbEZpb2NFSWxVcDJmdERrTEMyVEZvcXpDbnVu?=
 =?utf-8?B?aElzTFV3VE1tZEpMY004dGJ5bXlndzNDZGpwakdJa29xU2JsMTVINGpZRlBQ?=
 =?utf-8?B?cWZ2ckRBaHQrYWNsTG15OEpBUXhFenhOaVNoVmhFTDdIeWN2SVJLZEZYRVo2?=
 =?utf-8?B?T2hHMUI2eWtuK2tBeFBYd0s5eW9lVkxMUVhJdlhIT2F3MW5rRUo5UjNXV3RM?=
 =?utf-8?B?TUtSMzd5Y0s3TjR4clZJOE5iSXZuWTJ6ZDhBUmEySi9vZ0ovbHZJMlBKNUF0?=
 =?utf-8?B?NVBvMUxGdWhhMHpwRUxzdHkwRTZoKzkwNUE1cVpJdWZnekFsTE1MS0JtczhQ?=
 =?utf-8?B?QVE1VW1ZUi9PWnJoRDQ0NklMaUJSV3BTYzg2R1FRd3pzTkNJQURMNjI5ZXYv?=
 =?utf-8?B?L1lvVHNiZW1FQk1KdHBrRG1wWnhVT1ZXK3gxVTl2T1NWTStRK0VrcmNzNlFv?=
 =?utf-8?B?cGNyZ3YyYWJ4My9uVUo4ZUltN0JvdEs0WlQzcWF6UHpGYTU4Ull4VVBMMlZn?=
 =?utf-8?B?c2ZGcHg2SkVLRlhKSHNkWFBWRVJwOTI4RWZCT1hLUzZYK01SU2gxV1Nncks4?=
 =?utf-8?Q?lPPUqs3jmU9aa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7820.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzN6c0ROYkljM2xhZTRVMkF3MjRlR2JCZ0s0dDliM2JyMDdzYlNYcEJxajRM?=
 =?utf-8?B?SXgxb1VWeDJqZ2twUU01OFJ6eDY1MzlWUXFKRTJvMWN4VUZpQmxnM09FbTlS?=
 =?utf-8?B?bFdndVJyRnd4RDNFNmZIMTBsQldEQVByVUVpd3JqcFQxUXFWOXFoUzBWd1Vz?=
 =?utf-8?B?bEU4NkVwZ04xSHVSMzRiclJrb0lLOGcxeDBxcnVYTzY0bEJKUzd1VDQxNWYr?=
 =?utf-8?B?Z2NIaUVlTHpEQlZkMkd4WUZCU2hhMXphK0hVS2toK0ozVnEzOHJucjI5VERH?=
 =?utf-8?B?eXJ0UWxreFNEWnR1MElRL29iRzcrUkY0WERiTEdVUElyWjRlWnY3T2FDS0RL?=
 =?utf-8?B?R2xTZVFZbFFZazd0RkdDUDNBTG0zYmppa3pEMUY4bWJHMEc4OEovUEZ6YXhs?=
 =?utf-8?B?aVQ5V0hvQTFRNkw0bkQ0Wm80SDhuOFlwNmtzR1VuZXRWdzNCanBmQXZBOWpD?=
 =?utf-8?B?Q0ZZMys0UmZwcnhtY0w4ZVJLYzBWRzdkNUs1REFJTGdKNEdHZ0FHdjVyb2J6?=
 =?utf-8?B?YTFGSjc2YVp5WHdpMjFVMWlKdGNwSGJxNGdVMUdxTWpzZTZwWDJQZUVDVjdV?=
 =?utf-8?B?MnJGK2dya1Qza0hCNWM5eVR4MGZROXlzNDA5aXBxeHpPR0twOUd4NU9LS3Bt?=
 =?utf-8?B?bnpseXRCc2tjNGg5WlQ5VjhXSkU4THU2K091OWdWc1RpLzlkc0FPbmsxdDg3?=
 =?utf-8?B?Y3JFR2tTYTFtVVJMblFjanBqZ290bnhxV3g5eHV5NThnRDNvWHN1d1JnNkNJ?=
 =?utf-8?B?TVZIcFAxdFhpQU9wSUFleXhFRmdWdUkvSEwvdTBjMEh4U3lGcTJTRXpXNC9x?=
 =?utf-8?B?NTlrOUhiTGtQK09wckpzZXNCOVpFbzBYVUFyVVgzL3BGYlM0UkhUazR1bE5W?=
 =?utf-8?B?UXVTYmdvMjZpOXQ2dGlxL1VzNy9nbU0zRFNLT1J6QXBVU2cwUkJOVmNodGM2?=
 =?utf-8?B?QlFXcTVxYzJvcUJQUzVrVXp2dEpVZFE1M1J4SkJYbWgvcTR5UVdzS2o2RWFJ?=
 =?utf-8?B?d1E5S0tNeGluWmNFOWt0RG5QU2w3V1lwOW1IeTZIZzhOSEVJcGFWSVdBME5T?=
 =?utf-8?B?ZnRIYlc4TW5QS2pxalp2ZHM3VkVWVC84K1B5Szg1WFl1cUlQNEdiTzArOGpy?=
 =?utf-8?B?aHdoTnhhNWpTY3BYdCtzNTN3MGxCOTJleFprQVp6WWl3OVV3OUo3bkxvVVNU?=
 =?utf-8?B?UjY3MEkrOTBIU2dSN3FROERRaFJUeEN4MFE4Q0t5KzNmMGNpTjBYbUNkbno3?=
 =?utf-8?B?Z1huZituRUdFeWdSWXliRVJ4ZkowZVFGbm1pQ3Z2QnVnNGdaUno2MDFsZlh2?=
 =?utf-8?B?bEdLeWVyMi9ZUVpvK0FObU51MDdJRUZwU1hvVEJOeUZMLzBqdWdXcHY1QTky?=
 =?utf-8?B?aWtzVXlCcDExdkpuZkRYcnRxQWZORFRWUFhYVHc4aE5Vc2FCZ3FsQzFWckxN?=
 =?utf-8?B?Y282ckFKeG1Zd01VRlNsOEdxdTVVaUNMbUJOSlp3Z2hQK2t4SHNURmxoZTBz?=
 =?utf-8?B?V0xVTjVVd3JjOEdocVYzZjFxU2Z3bXNlUUJ5aENNSnVlUFovaUh2dnc1SkE5?=
 =?utf-8?B?MmY5a2cwS21wZENVamtIbytCbzBINkIzU3E5T1RjcktIcFBlQjRQT0V6VUJn?=
 =?utf-8?B?ajM5ZW41Y2NtMWdpbm0vcU9rNS83bDNEb3RQY3J1bU9qakxiYStNajBTSlB6?=
 =?utf-8?B?SFhkdTZPSFhza1haSGFaUDdicnpaSTVudVVkNWoyY2NRRUpxSEo2SnBCeG4w?=
 =?utf-8?B?MDhqQWtxYXBzN0tOR0liaXFwc2Y0Q3RNaGdkRE5CNHVZQWJoZk05Mmh3TUZu?=
 =?utf-8?B?bFU1Ni9yaWx4RFNYclRTdUVqTDhGcEFkbXFrWjdjdFU4cTlrS3FWbGtLSFR0?=
 =?utf-8?B?dWxtc05WRnYxU215TzFVMmhQamYyeGoyZDVqQWFtOTE2ZlNaT3A4ZFdUdVR0?=
 =?utf-8?B?SytPbVN4ZlBuVmlQT2VUaVk2SGRFWlI3S0tjN0wxekREWldhTTd0SjN1OGVQ?=
 =?utf-8?B?Y1RIVk1iQXhmbzdhZUxwUVd3dS8yOTA5bmQ1VGV1T2Z6Nzd5ZTJFTXBOcVR4?=
 =?utf-8?B?RHpnalNjL2tSVVBFNk4zREM4N0FaTk9CWnd5M0NzTWVQMDAxODdIVjhHZzNj?=
 =?utf-8?Q?X93BdvUqy4VnpmYqWGg4Tni97?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e075f36d-95fe-4268-e7dd-08dd3ad731a1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7820.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 11:23:28.5448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A98R039fNc80/nlaZkXs1ZY1ZnmitWOgwDyytfjrFlWnf4tVtbW3zJQosdC4rPxC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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



On 1/22/2025 3:25 PM, Asad Kamal wrote:
> Add metrics table support for smuv13.0.12 to
> fetch data from metrics version v2
> 
> v2: Update get metric field and get metric size macro (Lijo)
> 
> Signed-off-by: Asad Kamal <asad.kamal@amd.com>

Series is -

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c  | 186 ++++++++++--------
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h  |   8 +
>  2 files changed, 113 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> index d4a159bb5a65..72c18b1635c0 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c
> @@ -105,7 +105,6 @@ MODULE_FIRMWARE("amdgpu/smu_13_0_14.bin");
>  
>  enum smu_v13_0_6_caps {
>  	SMU_CAP(DPM),
> -	SMU_CAP(UNI_METRICS),
>  	SMU_CAP(DPM_POLICY),
>  	SMU_CAP(OTHER_END_METRICS),
>  	SMU_CAP(SET_UCLK_MAX),
> @@ -272,8 +271,13 @@ struct PPTable_t {
>  #define SMUQ10_TO_UINT(x) ((x) >> 10)
>  #define SMUQ10_FRAC(x) ((x) & 0x3ff)
>  #define SMUQ10_ROUND(x) ((SMUQ10_TO_UINT(x)) + ((SMUQ10_FRAC(x)) >= 0x200))
> -#define GET_METRIC_FIELD(field, flag) ((flag) ?\
> -		(metrics_v1->field) : (metrics_v0->field))
> +#define GET_GPU_METRIC_FIELD(field, version) ((version == METRICS_VERSION_V0) ?\
> +		(metrics_v0->field) : (metrics_v2->field))
> +#define GET_METRIC_FIELD(field, version) ((version == METRICS_VERSION_V1) ?\
> +		(metrics_v1->field) : GET_GPU_METRIC_FIELD(field, version))
> +#define METRICS_TABLE_SIZE (max3(sizeof(MetricsTableV0_t),\
> +				   sizeof(MetricsTableV1_t),\
> +				   sizeof(MetricsTableV2_t)))
>  
>  struct smu_v13_0_6_dpm_map {
>  	enum smu_clk_type clk_type;
> @@ -282,6 +286,18 @@ struct smu_v13_0_6_dpm_map {
>  	uint32_t *freq_table;
>  };
>  
> +static inline int smu_v13_0_6_get_metrics_version(struct smu_context *smu)
> +{
> +	if ((smu->adev->flags & AMD_IS_APU) &&
> +	    smu->smc_fw_version <= 0x4556900)
> +		return METRICS_VERSION_V1;
> +	else if (amdgpu_ip_version(smu->adev, MP1_HWIP, 0) ==
> +		 IP_VERSION(13, 0, 12))
> +		return METRICS_VERSION_V2;
> +
> +	return METRICS_VERSION_V0;
> +}
> +
>  static inline void smu_v13_0_6_cap_set(struct smu_context *smu,
>  				       enum smu_v13_0_6_caps cap)
>  {
> @@ -309,7 +325,6 @@ static inline bool smu_v13_0_6_cap_supported(struct smu_context *smu,
>  static void smu_v13_0_14_init_caps(struct smu_context *smu)
>  {
>  	enum smu_v13_0_6_caps default_cap_list[] = { SMU_CAP(DPM),
> -						     SMU_CAP(UNI_METRICS),
>  						     SMU_CAP(SET_UCLK_MAX),
>  						     SMU_CAP(DPM_POLICY),
>  						     SMU_CAP(PCIE_METRICS),
> @@ -335,12 +350,14 @@ static void smu_v13_0_14_init_caps(struct smu_context *smu)
>  static void smu_v13_0_12_init_caps(struct smu_context *smu)
>  {
>  	enum smu_v13_0_6_caps default_cap_list[] = { SMU_CAP(DPM),
> -						     SMU_CAP(UNI_METRICS),
>  						     SMU_CAP(PCIE_METRICS),
>  						     SMU_CAP(CTF_LIMIT),
>  						     SMU_CAP(MCA_DEBUG_MODE),
>  						     SMU_CAP(RMA_MSG),
> -						     SMU_CAP(ACA_SYND) };
> +						     SMU_CAP(ACA_SYND),
> +						     SMU_CAP(OTHER_END_METRICS),
> +						     SMU_CAP(HST_LIMIT_METRICS),
> +						     SMU_CAP(PER_INST_METRICS) };
>  	uint32_t fw_ver = smu->smc_fw_version;
>  
>  	for (int i = 0; i < ARRAY_SIZE(default_cap_list); i++)
> @@ -356,7 +373,6 @@ static void smu_v13_0_12_init_caps(struct smu_context *smu)
>  static void smu_v13_0_6_init_caps(struct smu_context *smu)
>  {
>  	enum smu_v13_0_6_caps default_cap_list[] = { SMU_CAP(DPM),
> -						     SMU_CAP(UNI_METRICS),
>  						     SMU_CAP(SET_UCLK_MAX),
>  						     SMU_CAP(DPM_POLICY),
>  						     SMU_CAP(PCIE_METRICS),
> @@ -382,8 +398,6 @@ static void smu_v13_0_6_init_caps(struct smu_context *smu)
>  		smu_v13_0_6_cap_clear(smu, SMU_CAP(RMA_MSG));
>  		smu_v13_0_6_cap_clear(smu, SMU_CAP(ACA_SYND));
>  
> -		if (fw_ver <= 0x4556900)
> -			smu_v13_0_6_cap_clear(smu, SMU_CAP(UNI_METRICS));
>  		if (fw_ver >= 0x04556F00)
>  			smu_v13_0_6_cap_set(smu, SMU_CAP(HST_LIMIT_METRICS));
>  		if (fw_ver >= 0x04556A00)
> @@ -514,7 +528,7 @@ static int smu_v13_0_6_tables_init(struct smu_context *smu)
>  			       PAGE_SIZE, AMDGPU_GEM_DOMAIN_VRAM);
>  
>  	SMU_TABLE_INIT(tables, SMU_TABLE_SMU_METRICS,
> -		       max(sizeof(MetricsTableV0_t), sizeof(MetricsTableV1_t)),
> +		       METRICS_TABLE_SIZE,
>  		       PAGE_SIZE,
>  		       AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT);
>  
> @@ -522,8 +536,7 @@ static int smu_v13_0_6_tables_init(struct smu_context *smu)
>  		       PAGE_SIZE,
>  		       AMDGPU_GEM_DOMAIN_VRAM | AMDGPU_GEM_DOMAIN_GTT);
>  
> -	smu_table->metrics_table = kzalloc(max(sizeof(MetricsTableV0_t),
> -					       sizeof(MetricsTableV1_t)), GFP_KERNEL);
> +	smu_table->metrics_table = kzalloc(METRICS_TABLE_SIZE, GFP_KERNEL);
>  	if (!smu_table->metrics_table)
>  		return -ENOMEM;
>  	smu_table->metrics_time = 0;
> @@ -755,9 +768,10 @@ static int smu_v13_0_6_setup_driver_pptable(struct smu_context *smu)
>  	struct smu_table_context *smu_table = &smu->smu_table;
>  	MetricsTableV0_t *metrics_v0 = (MetricsTableV0_t *)smu_table->metrics_table;
>  	MetricsTableV1_t *metrics_v1 = (MetricsTableV1_t *)smu_table->metrics_table;
> +	MetricsTableV2_t *metrics_v2 = (MetricsTableV2_t *)smu_table->metrics_table;
>  	struct PPTable_t *pptable =
>  		(struct PPTable_t *)smu_table->driver_pptable;
> -	bool flag = !smu_v13_0_6_cap_supported(smu, SMU_CAP(UNI_METRICS));
> +	int version = smu_v13_0_6_get_metrics_version(smu);
>  	int ret, i, retry = 100;
>  	uint32_t table_version;
>  
> @@ -769,7 +783,7 @@ static int smu_v13_0_6_setup_driver_pptable(struct smu_context *smu)
>  				return ret;
>  
>  			/* Ensure that metrics have been updated */
> -			if (GET_METRIC_FIELD(AccumulationCounter, flag))
> +			if (GET_METRIC_FIELD(AccumulationCounter, version))
>  				break;
>  
>  			usleep_range(1000, 1100);
> @@ -786,29 +800,30 @@ static int smu_v13_0_6_setup_driver_pptable(struct smu_context *smu)
>  			table_version;
>  
>  		pptable->MaxSocketPowerLimit =
> -			SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketPowerLimit, flag));
> +			SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketPowerLimit, version));
>  		pptable->MaxGfxclkFrequency =
> -			SMUQ10_ROUND(GET_METRIC_FIELD(MaxGfxclkFrequency, flag));
> +			SMUQ10_ROUND(GET_METRIC_FIELD(MaxGfxclkFrequency, version));
>  		pptable->MinGfxclkFrequency =
> -			SMUQ10_ROUND(GET_METRIC_FIELD(MinGfxclkFrequency, flag));
> +			SMUQ10_ROUND(GET_METRIC_FIELD(MinGfxclkFrequency, version));
>  
>  		for (i = 0; i < 4; ++i) {
>  			pptable->FclkFrequencyTable[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(FclkFrequencyTable, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(FclkFrequencyTable, version)[i]);
>  			pptable->UclkFrequencyTable[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequencyTable, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequencyTable, version)[i]);
>  			pptable->SocclkFrequencyTable[i] = SMUQ10_ROUND(
> -				GET_METRIC_FIELD(SocclkFrequencyTable, flag)[i]);
> +				GET_METRIC_FIELD(SocclkFrequencyTable, version)[i]);
>  			pptable->VclkFrequencyTable[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequencyTable, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequencyTable, version)[i]);
>  			pptable->DclkFrequencyTable[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequencyTable, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequencyTable, version)[i]);
>  			pptable->LclkFrequencyTable[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(LclkFrequencyTable, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(LclkFrequencyTable, version)[i]);
>  		}
>  
>  		/* use AID0 serial number by default */
> -		pptable->PublicSerialNumber_AID = GET_METRIC_FIELD(PublicSerialNumber_AID, flag)[0];
> +		pptable->PublicSerialNumber_AID =
> +			GET_METRIC_FIELD(PublicSerialNumber_AID, version)[0];
>  
>  		pptable->Init = true;
>  	}
> @@ -1130,7 +1145,8 @@ static int smu_v13_0_6_get_smu_metrics_data(struct smu_context *smu,
>  	struct smu_table_context *smu_table = &smu->smu_table;
>  	MetricsTableV0_t *metrics_v0 = (MetricsTableV0_t *)smu_table->metrics_table;
>  	MetricsTableV1_t *metrics_v1 = (MetricsTableV1_t *)smu_table->metrics_table;
> -	bool flag = !smu_v13_0_6_cap_supported(smu, SMU_CAP(UNI_METRICS));
> +	MetricsTableV2_t *metrics_v2 = (MetricsTableV2_t *)smu_table->metrics_table;
> +	int version = smu_v13_0_6_get_metrics_version(smu);
>  	struct amdgpu_device *adev = smu->adev;
>  	int ret = 0;
>  	int xcc_id;
> @@ -1145,50 +1161,50 @@ static int smu_v13_0_6_get_smu_metrics_data(struct smu_context *smu,
>  	case METRICS_AVERAGE_GFXCLK:
>  		if (smu_v13_0_6_cap_supported(smu, SMU_CAP(DPM))) {
>  			xcc_id = GET_INST(GC, 0);
> -			*value = SMUQ10_ROUND(GET_METRIC_FIELD(GfxclkFrequency, flag)[xcc_id]);
> +			*value = SMUQ10_ROUND(GET_METRIC_FIELD(GfxclkFrequency, version)[xcc_id]);
>  		} else {
>  			*value = 0;
>  		}
>  		break;
>  	case METRICS_CURR_SOCCLK:
>  	case METRICS_AVERAGE_SOCCLK:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocclkFrequency, flag)[0]);
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocclkFrequency, version)[0]);
>  		break;
>  	case METRICS_CURR_UCLK:
>  	case METRICS_AVERAGE_UCLK:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequency, flag));
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequency, version));
>  		break;
>  	case METRICS_CURR_VCLK:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequency, flag)[0]);
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequency, version)[0]);
>  		break;
>  	case METRICS_CURR_DCLK:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequency, flag)[0]);
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequency, version)[0]);
>  		break;
>  	case METRICS_CURR_FCLK:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(FclkFrequency, flag));
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(FclkFrequency, version));
>  		break;
>  	case METRICS_AVERAGE_GFXACTIVITY:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusy, flag));
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusy, version));
>  		break;
>  	case METRICS_AVERAGE_MEMACTIVITY:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilization, flag));
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilization, version));
>  		break;
>  	case METRICS_CURR_SOCKETPOWER:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocketPower, flag)) << 8;
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(SocketPower, version)) << 8;
>  		break;
>  	case METRICS_TEMPERATURE_HOTSPOT:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketTemperature, flag)) *
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketTemperature, version)) *
>  			 SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
>  		break;
>  	case METRICS_TEMPERATURE_MEM:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxHbmTemperature, flag)) *
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxHbmTemperature, version)) *
>  			 SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
>  		break;
>  	/* This is the max of all VRs and not just SOC VR.
>  	 * No need to define another data type for the same.
>  	 */
>  	case METRICS_TEMPERATURE_VRSOC:
> -		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxVrTemperature, flag)) *
> +		*value = SMUQ10_ROUND(GET_METRIC_FIELD(MaxVrTemperature, version)) *
>  			 SMU_TEMPERATURE_UNITS_PER_CENTIGRADES;
>  		break;
>  	default:
> @@ -2479,17 +2495,18 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  	struct smu_table_context *smu_table = &smu->smu_table;
>  	struct gpu_metrics_v1_7 *gpu_metrics =
>  		(struct gpu_metrics_v1_7 *)smu_table->gpu_metrics_table;
> -	bool flag = !smu_v13_0_6_cap_supported(smu, SMU_CAP(UNI_METRICS));
> +	int version = smu_v13_0_6_get_metrics_version(smu);
>  	int ret = 0, xcc_id, inst, i, j, k, idx;
>  	struct amdgpu_device *adev = smu->adev;
>  	MetricsTableV0_t *metrics_v0;
>  	MetricsTableV1_t *metrics_v1;
> +	MetricsTableV2_t *metrics_v2;
>  	struct amdgpu_xcp *xcp;
>  	u16 link_width_level;
>  	u32 inst_mask;
>  	bool per_inst;
>  
> -	metrics_v0 = kzalloc(max(sizeof(MetricsTableV0_t), sizeof(MetricsTableV1_t)), GFP_KERNEL);
> +	metrics_v0 = kzalloc(METRICS_TABLE_SIZE, GFP_KERNEL);
>  	ret = smu_v13_0_6_get_metrics_table(smu, metrics_v0, true);
>  	if (ret) {
>  		kfree(metrics_v0);
> @@ -2497,64 +2514,69 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  	}
>  
>  	metrics_v1 = (MetricsTableV1_t *)metrics_v0;
> +	metrics_v2 = (MetricsTableV2_t *)metrics_v0;
>  
>  	smu_cmn_init_soft_gpu_metrics(gpu_metrics, 1, 7);
>  
>  	gpu_metrics->temperature_hotspot =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketTemperature, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(MaxSocketTemperature, version));
>  	/* Individual HBM stack temperature is not reported */
>  	gpu_metrics->temperature_mem =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(MaxHbmTemperature, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(MaxHbmTemperature, version));
>  	/* Reports max temperature of all voltage rails */
>  	gpu_metrics->temperature_vrsoc =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(MaxVrTemperature, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(MaxVrTemperature, version));
>  
>  	gpu_metrics->average_gfx_activity =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusy, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusy, version));
>  	gpu_metrics->average_umc_activity =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilization, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilization, version));
>  
>  	gpu_metrics->mem_max_bandwidth =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(MaxDramBandwidth, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(MaxDramBandwidth, version));
>  
>  	gpu_metrics->curr_socket_power =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(SocketPower, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(SocketPower, version));
>  	/* Energy counter reported in 15.259uJ (2^-16) units */
> -	gpu_metrics->energy_accumulator = GET_METRIC_FIELD(SocketEnergyAcc, flag);
> +	gpu_metrics->energy_accumulator = GET_METRIC_FIELD(SocketEnergyAcc, version);
>  
>  	for (i = 0; i < MAX_GFX_CLKS; i++) {
>  		xcc_id = GET_INST(GC, i);
>  		if (xcc_id >= 0)
>  			gpu_metrics->current_gfxclk[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(GfxclkFrequency, flag)[xcc_id]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(GfxclkFrequency, version)[xcc_id]);
>  
>  		if (i < MAX_CLKS) {
>  			gpu_metrics->current_socclk[i] =
> -				SMUQ10_ROUND(GET_METRIC_FIELD(SocclkFrequency, flag)[i]);
> +				SMUQ10_ROUND(GET_METRIC_FIELD(SocclkFrequency, version)[i]);
>  			inst = GET_INST(VCN, i);
>  			if (inst >= 0) {
>  				gpu_metrics->current_vclk0[i] =
> -					SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequency, flag)[inst]);
> +					SMUQ10_ROUND(GET_METRIC_FIELD(VclkFrequency,
> +								      version)[inst]);
>  				gpu_metrics->current_dclk0[i] =
> -					SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequency, flag)[inst]);
> +					SMUQ10_ROUND(GET_METRIC_FIELD(DclkFrequency,
> +								      version)[inst]);
>  			}
>  		}
>  	}
>  
> -	gpu_metrics->current_uclk = SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequency, flag));
> +	gpu_metrics->current_uclk = SMUQ10_ROUND(GET_METRIC_FIELD(UclkFrequency, version));
>  
>  	/* Total accumulated cycle counter */
> -	gpu_metrics->accumulation_counter = GET_METRIC_FIELD(AccumulationCounter, flag);
> +	gpu_metrics->accumulation_counter = GET_METRIC_FIELD(AccumulationCounter, version);
>  
>  	/* Accumulated throttler residencies */
> -	gpu_metrics->prochot_residency_acc = GET_METRIC_FIELD(ProchotResidencyAcc, flag);
> -	gpu_metrics->ppt_residency_acc = GET_METRIC_FIELD(PptResidencyAcc, flag);
> -	gpu_metrics->socket_thm_residency_acc = GET_METRIC_FIELD(SocketThmResidencyAcc, flag);
> -	gpu_metrics->vr_thm_residency_acc = GET_METRIC_FIELD(VrThmResidencyAcc, flag);
> -	gpu_metrics->hbm_thm_residency_acc = GET_METRIC_FIELD(HbmThmResidencyAcc, flag);
> +	gpu_metrics->prochot_residency_acc = GET_METRIC_FIELD(ProchotResidencyAcc, version);
> +	gpu_metrics->ppt_residency_acc = GET_METRIC_FIELD(PptResidencyAcc, version);
> +	gpu_metrics->socket_thm_residency_acc = GET_METRIC_FIELD(SocketThmResidencyAcc, version);
> +	gpu_metrics->vr_thm_residency_acc = GET_METRIC_FIELD(VrThmResidencyAcc, version);
> +	gpu_metrics->hbm_thm_residency_acc =
> +		GET_METRIC_FIELD(HbmThmResidencyAcc, version);
>  
>  	/* Clock Lock Status. Each bit corresponds to each GFXCLK instance */
> -	gpu_metrics->gfxclk_lock_status = GET_METRIC_FIELD(GfxLockXCDMak, flag) >> GET_INST(GC, 0);
> +	gpu_metrics->gfxclk_lock_status = GET_METRIC_FIELD(GfxLockXCDMak,
> +							   version) >> GET_INST(GC, 0);
>  
>  	if (!(adev->flags & AMD_IS_APU)) {
>  		/*Check smu version, PCIE link speed and width will be reported from pmfw metric
> @@ -2562,9 +2584,9 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  		 * for pf from registers
>  		 */
>  		if (smu_v13_0_6_cap_supported(smu, SMU_CAP(PCIE_METRICS))) {
> -			gpu_metrics->pcie_link_width = metrics_v0->PCIeLinkWidth;
> +			gpu_metrics->pcie_link_width = GET_GPU_METRIC_FIELD(PCIeLinkWidth, version);
>  			gpu_metrics->pcie_link_speed =
> -				pcie_gen_to_speed(metrics_v0->PCIeLinkSpeed);
> +				pcie_gen_to_speed(GET_GPU_METRIC_FIELD(PCIeLinkSpeed, version));
>  		} else if (!amdgpu_sriov_vf(adev)) {
>  			link_width_level = smu_v13_0_6_get_current_pcie_link_width_level(smu);
>  			if (link_width_level > MAX_LINK_WIDTH)
> @@ -2577,37 +2599,37 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  		}
>  
>  		gpu_metrics->pcie_bandwidth_acc =
> -				SMUQ10_ROUND(metrics_v0->PcieBandwidthAcc[0]);
> +				SMUQ10_ROUND(GET_GPU_METRIC_FIELD(PcieBandwidthAcc, version)[0]);
>  		gpu_metrics->pcie_bandwidth_inst =
> -				SMUQ10_ROUND(metrics_v0->PcieBandwidth[0]);
> +				SMUQ10_ROUND(GET_GPU_METRIC_FIELD(PcieBandwidth, version)[0]);
>  		gpu_metrics->pcie_l0_to_recov_count_acc =
> -				metrics_v0->PCIeL0ToRecoveryCountAcc;
> +				GET_GPU_METRIC_FIELD(PCIeL0ToRecoveryCountAcc, version);
>  		gpu_metrics->pcie_replay_count_acc =
> -				metrics_v0->PCIenReplayAAcc;
> +				GET_GPU_METRIC_FIELD(PCIenReplayAAcc, version);
>  		gpu_metrics->pcie_replay_rover_count_acc =
> -				metrics_v0->PCIenReplayARolloverCountAcc;
> +				GET_GPU_METRIC_FIELD(PCIenReplayARolloverCountAcc, version);
>  		gpu_metrics->pcie_nak_sent_count_acc =
> -				metrics_v0->PCIeNAKSentCountAcc;
> +				GET_GPU_METRIC_FIELD(PCIeNAKSentCountAcc, version);
>  		gpu_metrics->pcie_nak_rcvd_count_acc =
> -				metrics_v0->PCIeNAKReceivedCountAcc;
> +				GET_GPU_METRIC_FIELD(PCIeNAKReceivedCountAcc, version);
>  		if (smu_v13_0_6_cap_supported(smu, SMU_CAP(OTHER_END_METRICS)))
>  			gpu_metrics->pcie_lc_perf_other_end_recovery =
> -				metrics_v0->PCIeOtherEndRecoveryAcc;
> +				GET_GPU_METRIC_FIELD(PCIeOtherEndRecoveryAcc, version);
>  
>  	}
>  
>  	gpu_metrics->system_clock_counter = ktime_get_boottime_ns();
>  
>  	gpu_metrics->gfx_activity_acc =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusyAcc, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(SocketGfxBusyAcc, version));
>  	gpu_metrics->mem_activity_acc =
> -		SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilizationAcc, flag));
> +		SMUQ10_ROUND(GET_METRIC_FIELD(DramBandwidthUtilizationAcc, version));
>  
>  	for (i = 0; i < NUM_XGMI_LINKS; i++) {
>  		gpu_metrics->xgmi_read_data_acc[i] =
> -			SMUQ10_ROUND(GET_METRIC_FIELD(XgmiReadDataSizeAcc, flag)[i]);
> +			SMUQ10_ROUND(GET_METRIC_FIELD(XgmiReadDataSizeAcc, version)[i]);
>  		gpu_metrics->xgmi_write_data_acc[i] =
> -			SMUQ10_ROUND(GET_METRIC_FIELD(XgmiWriteDataSizeAcc, flag)[i]);
> +			SMUQ10_ROUND(GET_METRIC_FIELD(XgmiWriteDataSizeAcc, version)[i]);
>  		ret = amdgpu_get_xgmi_link_status(adev, i);
>  		if (ret >= 0)
>  			gpu_metrics->xgmi_link_status[i] = ret;
> @@ -2627,11 +2649,11 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  			for (j = 0; j < adev->jpeg.num_jpeg_rings; ++j) {
>  				gpu_metrics->xcp_stats[i].jpeg_busy
>  					[(idx * adev->jpeg.num_jpeg_rings) + j] =
> -					SMUQ10_ROUND(GET_METRIC_FIELD(JpegBusy, flag)
> +					SMUQ10_ROUND(GET_METRIC_FIELD(JpegBusy, version)
>  							[(inst * adev->jpeg.num_jpeg_rings) + j]);
>  			}
>  			gpu_metrics->xcp_stats[i].vcn_busy[idx] =
> -			       SMUQ10_ROUND(GET_METRIC_FIELD(VcnBusy, flag)[inst]);
> +			       SMUQ10_ROUND(GET_METRIC_FIELD(VcnBusy, version)[inst]);
>  			idx++;
>  
>  		}
> @@ -2642,24 +2664,26 @@ static ssize_t smu_v13_0_6_get_gpu_metrics(struct smu_context *smu, void **table
>  			for_each_inst(k, inst_mask) {
>  				inst = GET_INST(GC, k);
>  				gpu_metrics->xcp_stats[i].gfx_busy_inst[idx] =
> -					SMUQ10_ROUND(metrics_v0->GfxBusy[inst]);
> +					SMUQ10_ROUND(GET_GPU_METRIC_FIELD(GfxBusy, version)[inst]);
>  				gpu_metrics->xcp_stats[i].gfx_busy_acc[idx] =
> -					SMUQ10_ROUND(metrics_v0->GfxBusyAcc[inst]);
> +					SMUQ10_ROUND(GET_GPU_METRIC_FIELD(GfxBusyAcc,
> +									  version)[inst]);
>  
>  				if (smu_v13_0_6_cap_supported(
>  					    smu, SMU_CAP(HST_LIMIT_METRICS)))
>  					gpu_metrics->xcp_stats[i].gfx_below_host_limit_acc[idx] =
> -						SMUQ10_ROUND(metrics_v0->GfxclkBelowHostLimitAcc
> +						SMUQ10_ROUND(GET_GPU_METRIC_FIELD
> +								(GfxclkBelowHostLimitAcc, version)
>  								[inst]);
>  				idx++;
>  			}
>  		}
>  	}
>  
> -	gpu_metrics->xgmi_link_width = SMUQ10_ROUND(GET_METRIC_FIELD(XgmiWidth, flag));
> -	gpu_metrics->xgmi_link_speed = SMUQ10_ROUND(GET_METRIC_FIELD(XgmiBitrate, flag));
> +	gpu_metrics->xgmi_link_width = SMUQ10_ROUND(GET_METRIC_FIELD(XgmiWidth, version));
> +	gpu_metrics->xgmi_link_speed = SMUQ10_ROUND(GET_METRIC_FIELD(XgmiBitrate, version));
>  
> -	gpu_metrics->firmware_timestamp = GET_METRIC_FIELD(Timestamp, flag);
> +	gpu_metrics->firmware_timestamp = GET_METRIC_FIELD(Timestamp, version);
>  
>  	*table = (void *)gpu_metrics;
>  	kfree(metrics_v0);
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h
> index f0fa42a645c0..717fe669882e 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.h
> @@ -27,6 +27,14 @@
>  #define SMU_13_0_6_UMD_PSTATE_SOCCLK_LEVEL 0x4
>  #define SMU_13_0_6_UMD_PSTATE_MCLK_LEVEL 0x2
>  
> +typedef enum {
> +/*0*/   METRICS_VERSION_V0                  = 0,
> +/*1*/   METRICS_VERSION_V1                  = 1,
> +/*2*/   METRICS_VERSION_V2                  = 2,
> +
> +/*3*/   NUM_METRICS                         = 3
> +} METRICS_LIST_e;
> +
>  extern void smu_v13_0_6_set_ppt_funcs(struct smu_context *smu);
>  
>  #endif

