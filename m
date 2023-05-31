Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F771892F
	for <lists+amd-gfx@lfdr.de>; Wed, 31 May 2023 20:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301B010E4F2;
	Wed, 31 May 2023 18:16:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EB710E4F2
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 May 2023 18:16:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYbZpcAhMLxU8Xzej/o04AbhsnjHcVD8KgLqAFgHJruzTsM9kwjmDmqZ8IjEMssAQT9pJu/lahF0gq1fyEVXQ9jGhjqTzQEOeqtTcHF8P3vU4DdYZUKQw7ivWDn+HETjH51Kjr78mK1al2rvXp5wkFd8dSz1gux4gAed//+RDE4rjxMjRSgN82tuWS3gYt/UWa6qhns/SjSFsRmwuTJFTd5IwrjwH5sDejvuRhkHixEKmH2MUdO8lYkKxkt5y/NLp4BkaPk+7v59iZYHFlIIFhF6xiet05rRO1L2TbguQdRL2XOreMVWOu/s9Z/StFxWn6JjK/bxcV2lpeLRqDeGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qau7/73pt/eHzawVythZZbqhfzsOG3KxLak4a53Wx8Q=;
 b=lOxG5D2QNrAQOm7GNSC6ub4NR5cSc5Z/2aV/V2L21uzpOkgMqmAa6ADcOmagNBk7ip8fbNOAjXIfjfW36Ds/Ocz1d93W3KD7VqLEUo9l1Ckwsud3cKmrsugOih7u6XdVjSzrDHHUd6nO9g5hXa7qtT3XfOMxAOYvyTop0Gavsp4SduXw+UdJJZ9UZfLzITJtOlOYHKr2e/LjoWrTuibnEOXPO/lFE6FJKO7JfIM+QPAWzDEmrsl93mIA7GTH/0X3ZZqdiT7bq/qx0iZlPeDQt6hfRkd4gDrLRLxcazVHxOSzbnh8Wu6c8A0GCSw37UHFlZ3Zh88RX2h7NHOy8KO7AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qau7/73pt/eHzawVythZZbqhfzsOG3KxLak4a53Wx8Q=;
 b=OAyJ7+z8NwGzoH07q3CapajPR02uErE27nDfpzrkGR6Jvokj3wr5/sz28QBOA74dBi3WfTWVyX8CyIWsgKIKe6KM/D6gFdtdZF96wzIVrG9U2ttaPhZx2Pm9EERrrfkI6xYvx+e+DgEUiO0lFKOGOWYXvVXQPbQvgAU+YnYOzKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH8PR12MB7303.namprd12.prod.outlook.com (2603:10b6:510:220::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Wed, 31 May
 2023 18:16:03 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::2dc3:c1:e72d:55bc%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 18:16:03 +0000
Message-ID: <b476952c-fd3e-dd08-9233-9ceb35d182fb@amd.com>
Date: Wed, 31 May 2023 14:16:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: Add function parameter 'event' to kdoc in
 svm_range_evict()
Content-Language: en-US
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230531181032.3536318-1-srinivasan.shanmugam@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230531181032.3536318-1-srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0435.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10d::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH8PR12MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaac066-e9b6-44f9-bf52-08db620317f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Y2PJNWDSZH4P64NhD00G5FhaZDPRnzQZBIDBREfUSQ+rMdjLHVSQWJp1eq1oBICNff9RDtHswgvEZOUY4tFWq1W3/2ESdCkA5nqV1SFkV+eWdnbxPSOaj6GMmCA2G7ZQpF2Ve2AposGbwNo42dEqzFqTnCy5f+57ksoeAWLW/c97V4+BwTxRdRGRFEolYTkm0ITb4qww9mZvMBaDwD8JtR7nbD7mnmDDfGH6v7TnXK9Zq3QwbvWi8+7ufMjh+T22jWn19TWR/Hbp74+/MG9xPJWocsrVruo7kWgv/3lSrTLqSPAKajpvkfyWeTqc7H5UJptu+BXhqdaaTFX56TEBruv9iiVLqAyhfHOFKzdK8iodGJyKncKUPZhohl61FnIDoWzIGrsCFOzfyQP7WjYae9wXZkz4nr848uZaF+PvUv4SKawc276A47cuMcsq6A2D9+LxHMBGyd3HC+fUvPArT56T9j6jncaz5e3AnolvCpgoqvvIjS55BlLVqNeF5PZO8cgMVmMQxR+Z7pauESKgLoAkoX4/+ItqbAwf/E33EJ3yWVSdOkyu+Zn8myXWgd+6OTtIwfswT50I++Y4Occx5OXN+QYjQhxwiE9L8CISjGHyJMgY2AUdQn0LZSz4PghO/M5ZRvbY72+TY7ZYpjTYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199021)(478600001)(83380400001)(5660300002)(186003)(66574015)(4326008)(6636002)(2906002)(8676002)(6486002)(86362001)(8936002)(316002)(41300700001)(31686004)(38100700002)(31696002)(6512007)(6506007)(26005)(44832011)(110136005)(66946007)(2616005)(66556008)(66476007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3BSeVBnK25OYlg3eTAxTEtaOUU4a2pnWVc4UnMxZ1RLb25KalVKNWFFUlNP?=
 =?utf-8?B?eTA0NW1GWFl0VkZ6ZDljUjlYV3g4ZkZSRVFvNjFOR0t2aXdiWjdHUFFFUlgz?=
 =?utf-8?B?TUxEdUgwbmRMRWhPZ3JaZzYwc0M2eHVoc0dxK3pXOWRPZCtLTXROVTlrVXRx?=
 =?utf-8?B?WlhVRkMvUXZjcUpwRHJSMXg0bUZXeVlPeWk0eTR6YU10MEpqb1ByQmlhUHZX?=
 =?utf-8?B?WXljK3VaOThPcEFFQWxzdFY4UTR2SmlKSTNqK3l4dFJ5bnlQb2R1Y3ZUczdH?=
 =?utf-8?B?ZkhPN0JvaHRrbDJsaUE4RDIyTVVqQU9qQ3RZUFd2Sk5RNVZBL1JMZURWZk9K?=
 =?utf-8?B?d2V5N0NxNXVDSG8zS2RvVXBRMUYrWGlHUThQYVAxY1dKSURQemkyYXA5SzBD?=
 =?utf-8?B?TVZ6MFVlT1pTNG52T1FicE42NWg2U3pzdm43NnRrQUd3aVFRbE9CR2pNQlBX?=
 =?utf-8?B?MXpYcXNKZ3VSdjFCZDFSY1hyUVJjY1VjbGRlU2Vpb2twVzdvaGtUTmRNaGtH?=
 =?utf-8?B?Ukt4YWJWSm50ZndGd1ErRS9XSnI0RG4wVjRGYWc4VkZWV0lDVVorNU50UDlz?=
 =?utf-8?B?eTREMVdEcjFOdldOMTdGTnRxV200UHlOdUtJcHhXVkxhY3pBbmVRUzdxcHpH?=
 =?utf-8?B?KzVDZGtYRjZVbDgwejdZYitqdlhyblIrVDNpNU1sbW43NnZaWjFOTXpjbUZN?=
 =?utf-8?B?N2JudzNxdnhKQjl2c2lVZmcrZ1haM3FBKzNKZEJhbW5GelFhNGEyRXltZytv?=
 =?utf-8?B?V2tVMXNIc0RTK0RoWVo0S2YrMW10S1pIMUVmRXpkWlUwdDMyZTk0NXcyWWtk?=
 =?utf-8?B?cmFhTElXRUpVVmI3cmduQnhUc0JTZDZVRkdmcTZYaGxkR0h6cWVPNDU5cDYx?=
 =?utf-8?B?U3N4b0ZtQWp0OWtINHh1SDhtaEhPZXB5Nm9ZalR6YmVzRmozOG9jMkhGQXR6?=
 =?utf-8?B?dTNPSkJlbGFqczgxVFRHRytuemM0all0cWIveGFGUU5qdDVTSUgrUkN0OHBj?=
 =?utf-8?B?Rnd3YXVpajRQeTNMZlVjTjY5V1g4cDFDTmV0WDcxVngwYVp5emQ5emhpRmNF?=
 =?utf-8?B?L1BNNXdET0FJV3JPWFVFVkh1RThnV3FoWjVsWVNWOUtaV1FONGVPUFFVcWo1?=
 =?utf-8?B?TzFHS29UOEhNMXFTS1dEN2JjQjNLTHVYcVhQK3ZrZ0U1WHc0NytBNU96UVFK?=
 =?utf-8?B?dHdPeUNzbW05Y3ZqSWMzZVo0Z1U2QjZMMy9KUjZoR1krZWt3UFF0MC9rVE5M?=
 =?utf-8?B?V3ovdWN2bi9zNVV5TWowR1FXSytvcGN4aExtUm51ZjlPdnJhZUhyQTNHa2Fl?=
 =?utf-8?B?V0h6UE9hQm1ZbmNoVWcxek9IcDRtQ1MxY3lrT0tUYnA5S1gxQm9BUmN1M3Rk?=
 =?utf-8?B?OXpBK1doNGlRSjhmUWUyY3Q1ZHBtekZzeU9PS05ZaFRSZ0g4SENQakVoV3Nn?=
 =?utf-8?B?NWtvZnZ4ZjJFelBiN2xSZDA3dkUvQm5sa2h2UHpCRWdsaHRUcWxDVDFSMXMy?=
 =?utf-8?B?Y1lNdnpBUHo5dUhPbmtGMEJKZ29XMmpnMmF4ZDhnUWN1bmNPeXE2QnU2MGNq?=
 =?utf-8?B?WmN1VzAvcUJlRnBBeGVUeFZVbXhYakprZVVxRVpYM24vMG9qbjN3NHFJK3pK?=
 =?utf-8?B?bGV6Ynh3ZDBMajB3b2c5RGUzVzd1eWxva0tURjR2cSttYWdUQmh0V1d3byti?=
 =?utf-8?B?ZHZUaVc0TjhRYXFKQk42cGxNemV4WkZHUnRuRlZiQVRWVGd4ejlVdmNISzk5?=
 =?utf-8?B?ZXUwQjJhWkpUZThveURxTEYrb1A0cjdmVTlBay94M1J1bnlKS0JpM0diRmV2?=
 =?utf-8?B?TXMxMWl0bHNKZ3JqbWtmUlk1Wi9HdzFRMTVOT3VHMERXRHRMdnFvY3JFNmMz?=
 =?utf-8?B?WG1iQnhOK3hMZGhuZUZCTmw3b0oxM0JpbXhNaGdzYXNUZFhvSjdBS0w0WmpG?=
 =?utf-8?B?bURsYUdCSFpPMzYxa3U1d1ZBL1lvUDJLZmJydVJTdVdJTGRralV4cVRtMEF5?=
 =?utf-8?B?OG9SUEJRamhsTXR4QVkyM0M2bW9seVJyZ2JNdmErM1lJWnFUeVU4QU5JR3ZU?=
 =?utf-8?B?U0NoanNVRS9QbnRVRFFJZHpUS1luZTRCWFYrQUdNZytoVWJnTUhMNjRTQjNN?=
 =?utf-8?Q?rXHiXaKzlEGpv7vfoSGydb45o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaac066-e9b6-44f9-bf52-08db620317f6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 18:16:03.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsIXY3rlUXuOLrAza8jSBXunmCV2QPNBtyNybePMyHDOtxJ+so5jTTWBmtpwcQoUDTwYox3Vu7wnD62zkFLc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7303
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
Cc: amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 2023-05-31 um 14:10 schrieb Srinivasan Shanmugam:
> Fixes the following gcc with W=1:
>
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:1841: warning: Function parameter or member 'event' not described in 'svm_range_evict'
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 84bb5bc6e731..338d7df04773 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1825,6 +1825,7 @@ static void svm_range_restore_work(struct work_struct *work)
>    * @mm: current process mm_struct
>    * @start: starting process queue number
>    * @last: last process queue number
> + * @event: mmu notifier event when range is evicted or migrated
>    *
>    * Stop all queues of the process to ensure GPU doesn't access the memory, then
>    * return to let CPU evict the buffer and proceed CPU pagetable update.
