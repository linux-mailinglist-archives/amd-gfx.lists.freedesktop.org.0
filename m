Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE17248619
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Aug 2020 15:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224D189805;
	Tue, 18 Aug 2020 13:32:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23A889805
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Aug 2020 13:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gaptlo1ZAhsgl31pdmfLaSBeMEzxdhpbgBiIW8aUFSX/nIgK4UI0UyCCA+nTGdcVHesewQRa6u5cN1kwizVaHqpoYOG8pcUI0XvKr3XhfGJIarjgMMq+kiL/qFMRtr7yZhDg0m7dF5AHY0lb4cz7LiqJAwAV7/w61IJ6VIYcWjYdXozmraJunAeNeWZyTexBNLN3cvCIV9Ux+CTzKNwg+5jANwUNsByYLZEKYM5yIOiaBgBK7VBolTmnaKtHUotKnVdqtgEZgmAR6aeNwVTAbbjH5kNHPyOHN1LbVUr4c546s9Bbr0LM89D6fHsSABxqn6Y1+5cPGz6idH05xJVfzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF3UQTjZSJ7/PLOQwmQNfQy2Spdw9V+iAoxoN2UgOLc=;
 b=gSGgkjzmGdMQL5vFo4gWBS+lGt5Uz+PTbERJEhMCK8Em6eJSPwLdC+Zx7KnZNsIeobmmH6fgXgrBJWVr+/gVpjVerWcAECJpb7Jfoqzx2Y/EfmEW2Deuioe6h/OXrS4LJ71H3uqO8uO7548gUdfHyiYZMApvBu460SgxyGYTFdNZmKGbp/Yt7Uxt7XInF64J25WKb8TbVecgY5zMlvUv2h5hYAVuKVjqmi1WuBjRGBV0E/Aigupfwne0SyOcprAXWkioyUY+wr62CaYEuW+vjZor6s+EP1zsfXpLb+XniumAr7td19XJW1s882gu3ZyKnSHlBOILApmqLBDy0s3fpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oF3UQTjZSJ7/PLOQwmQNfQy2Spdw9V+iAoxoN2UgOLc=;
 b=hixV12AwBh2SRCGK6oPRhdryKjhEPBWLHX87msT7yChViitFEe+oZjbFH2BZRJMgwavufYaWkravIfq/yVFgaoDk4p4TBO2jf+3UV5AUio2SQ5K41plBtHrd+7QzESqV10NCEvf/pEKWsMsOR63v1Fi1rnUuZ0lGSwxIRhNjmow=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB1321.namprd12.prod.outlook.com (2603:10b6:3:78::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 13:32:56 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::e8b8:d8a1:5adb:614d]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::e8b8:d8a1:5adb:614d%4]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 13:32:56 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu: Fix repeatly flr issue
To: "Emily.Deng" <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200818132912.37875-1-Emily.Deng@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <e47d10e5-0404-dc4c-3f35-7b4961340fe1@amd.com>
Date: Tue, 18 Aug 2020 15:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200818132912.37875-1-Emily.Deng@amd.com>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::22) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2b:8b00:ad4a:160b:54c5:6c69]
 (2003:c5:8f2b:8b00:ad4a:160b:54c5:6c69) by
 FR2P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.10 via Frontend Transport; Tue, 18 Aug 2020 13:32:55 +0000
X-Originating-IP: [2003:c5:8f2b:8b00:ad4a:160b:54c5:6c69]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62d18495-d4ef-40e1-0e30-08d8437b3739
X-MS-TrafficTypeDiagnostic: DM5PR12MB1321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB132124E6E716BF69B25F27978B5C0@DM5PR12MB1321.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ZE95Q/KgtpxFea2EkhjuKDyNI4/Wf7ln6a6o2s8Bf7O3dU9sjtdFZjJIPdls+lmqdQE3leq1ZA0CBKAZ2JAseFK20ieOiJ/vmO0/2P1RUUJnzA0kXL3/aX+jF51zRTwoxwTO9BrkX2aw/Ddz9MyXtf4dPGMwxWzcJJ233e5IKyRu9TnkLVUbf0l6ASiwNdrFrEqU2Qfzii9dLYcF+3/mxnXYMX1FNUTIWc9mkt34c15b5ZoopoTVwc4XV6g4a3jQyb563ymxB3DsBsp0xoJDChyQdRFlyQHkzyKdsfnAOaSIfmTZCzXoBDzwV4elKvfHeqSzPVF6WPnY/+lCiSOL8sms6fU9B4c7+cxrWCkk01undgvRA3U7aPdpUb9o8LW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(366004)(39860400002)(66946007)(52116002)(66556008)(66476007)(6666004)(31696002)(6486002)(83380400001)(316002)(8676002)(186003)(53546011)(8936002)(16526019)(36756003)(31686004)(478600001)(5660300002)(2616005)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: K11QtIa3dwRH7C+jdFBCRzlnmfTiYf8v+Mgd7HhMn7l1dVlJ6eiTersqyHC2S0gJH6j3PAxfAJBQYCm4NGtbCwLRp2Qxa78WLt8ljsAjWBPZnA4JgVbxNw9o3OsKvz+llgm0sGvIK0kA/iTdGYDKQmpbGO204b17iun3gcHjLibzXUGF+bjkq8Dh93KQ1zgOlNMhB39vARMz+9yEsTfjnsYbx7n5PFbYWKBSO3wTB7uo7GdSIxgTjMmfJucaUrc/eXWGOVLszJYp2L/wSL6ay2f/Rx4cASxD0zsOE7r/g1rLkPx0E79y9BQYhKXT/1HINReUXBPrH2s0pJwrmF+sjt4mNy4FmuDUHX/ZJIuYzI0zL1rPxBjbKgztCVwwM7CyFL930D9x8KF+8c3Aeas8OF1pFBA3ZJhxj/O9UXNNQ7vqPyHzvDuLjPyHcirYA3l9WpNaCdarttjoqLMasOPSeeG+k3Ce+7NRgAuJyMFzg3wEJxwrI89zdXEjvb6lqCgpHB8jbHuknnZ7ppBazUtfM2TPawBBCKN1lRZjc3u/Q/g2VGkegfHXt8Tg5HQl3s7rqre7iCJAtFEMbZxtW7cfUDIo57oehSGtol8gUvso7VDUqirm6xbeIUKVREKEYuxeilSjHQXNhRmXGYP1kzbha+AFrGSRX2a8QlPVaPwRNTC46qQjAlrKKDxMGN0vKMWiyTq05vvC7mTQ3kml72B7zA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d18495-d4ef-40e1-0e30-08d8437b3739
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 13:32:56.2827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: de21hIMk8KM0aW7QiExwO7I1qFVhvKlbs0c/NGuDp9c63qLKTq5lMgqah2pp0FhNB/yqzyi7JjSO6G6FrapkQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1321
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Acked-by: Nirmoy Das <nirmoy.das@amd.com>

On 8/18/20 3:29 PM, Emily.Deng wrote:
> From: jqdeng <Emily.Deng@amd.com>
>
> Only for no job running test case need to do recover in
> flr notification.
> For having job in mirror list, then let guest driver to
> hit job timeout, and then do recover.
>
> Signed-off-by: jqdeng <Emily.Deng@amd.com>
> Change-Id: Ic6234fce46fa1655ba81c4149235eeac75e75868
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 28 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  2 +-
>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 ++--
>   4 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 1f9d97f61aa5..69115781be05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1136,6 +1136,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
>   #define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter));
>   
>   /* Common functions */
> +bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   			      struct amdgpu_job* job);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index fe8878761c29..de4bce6d7516 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3925,6 +3925,34 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
>   	return r;
>   }
>   
> +/**
> + * amdgpu_device_has_job_running - check if there is any job in mirror list
> + *
> + * @adev: amdgpu device pointer
> + *
> + * check if there is any job in mirror list
> + */
> +bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
> +{
> +	int i;
> +	struct drm_sched_job *job;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		if (!ring || !ring->sched.thread)
> +			continue;
> +
> +		spin_lock(&ring->sched.job_list_lock);
> +		job = list_first_entry_or_null(&ring->sched.ring_mirror_list,
> +				struct drm_sched_job, node);
> +		spin_unlock(&ring->sched.job_list_lock);
> +		if (job)
> +			return true;
> +	}
> +	return false;
> +}
> +
>   /**
>    * amdgpu_device_should_recover_gpu - check if we should try GPU recovery
>    *
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> index fe31cbeccfe9..bd4e7c2d0dd1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
> @@ -261,7 +261,7 @@ static void xgpu_ai_mailbox_flr_work(struct work_struct *work)
>   
>   	/* Trigger recovery for world switch failure if no TDR */
>   	if (amdgpu_device_should_recover_gpu(adev)
> -		&& adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT)
> +		&& (amdgpu_device_has_job_running(adev) || adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT))
>   		amdgpu_device_gpu_recover(adev, NULL);
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> index 6f55172e8337..d5c14745a9d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
> @@ -281,8 +281,8 @@ static void xgpu_nv_mailbox_flr_work(struct work_struct *work)
>   	up_read(&adev->reset_sem);
>   
>   	/* Trigger recovery for world switch failure if no TDR */
> -	if (amdgpu_device_should_recover_gpu(adev)
> -		&& (adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT ||
> +	if (amdgpu_device_should_recover_gpu(adev) && (amdgpu_device_has_job_running(adev) ||
> +		adev->sdma_timeout == MAX_SCHEDULE_TIMEOUT ||
>   		adev->gfx_timeout == MAX_SCHEDULE_TIMEOUT ||
>   		adev->compute_timeout == MAX_SCHEDULE_TIMEOUT ||
>   		adev->video_timeout == MAX_SCHEDULE_TIMEOUT))
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
