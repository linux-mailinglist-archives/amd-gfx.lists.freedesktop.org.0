Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE251A0961
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Apr 2020 10:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E697E6E5CE;
	Tue,  7 Apr 2020 08:31:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770071.outbound.protection.outlook.com [40.107.77.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB5076E5CE
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Apr 2020 08:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLks7ziZBjBWn6aexS4frkU0k02DCmL6p2ECSKmmXmPq7SCvcd2YUdOK/1Y+Gc7FYWCizrPHWYbp3G+aTmhQATnrjMQVDgGrjNMMXYLm3WWfqOFRJ7m7dZih1SqJhjkQg7CYX8tgMzlvt3/94tlfaq0r4coXKNWm7KRk0YAi+Llz7IscLpO/xtz++BF/TmyT4b0eIBlNBDbAV15AWa4z5t2K4LfDOaavAxIuQJ7Fpj8e4BmfuHAA51eTRNaipqsW3iEuTf9ab3LW1nQQ5+igrRNKsQfqrPnaj44iJOFbAMpgieXB3+wUp2p9TGj87VwhqUnStnv06F+LG2JZaAz8Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnIBwJ9tU6QcCAFiXZaKZCjAI6oGY/JjbQCYVgZlLVU=;
 b=DmPXD0cFBO2o8rpOz3qRO6/SYyXeOA77PPAYifG2UClqB2nZkOoCWeuQ7cxGc0C3BMFc6gO7w0qdhHVybNeW6xOv7n+RxIub1bQMFKxoKxrARRzQognphiqMKb9HntLYAmUAVouUSv7wjglZKq0eYm8GZg6xl+qsPKsC7Q/zHynLKJpaxqLcHd0rP7mijCtd2Ri1t5Fk1R+DvM1HiH8YR1BC7AnIy5I5/f+haYYrPP2XyDIIEvHd29AtAJ9NERbsrjHflfl9Rwxzej6RXhnOBUX+S9AHqVtbKqVL8Lnx8eyzGvyIoNciLzQMHB4Ol/NMxGG7sBoewLF8kB86r1Zbeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnIBwJ9tU6QcCAFiXZaKZCjAI6oGY/JjbQCYVgZlLVU=;
 b=V0qAGdzIVrbTT1cLBvA5LRQELiPnHegDMJDHjnVC9WGdyJNRvhCLkr7bMLxNdU/q6RHredK+1y9cM9Fhu4MeVtH4bUyTq69jv+wfhLwpvU2wnFUXSlbnq2vC+n+DwaZTSvbfnBTF9CGnbg38/bNvoa8IyO4VNw7+QfqqGsDjFQg=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB3294.namprd12.prod.outlook.com (2603:10b6:208:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Tue, 7 Apr
 2020 08:31:35 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 08:31:35 +0000
Date: Tue, 7 Apr 2020 16:31:26 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix gfx hang during suspend with video
 playback
Message-ID: <20200407083125.GC27094@jenkins-Celadon-RN>
References: <1585886873-22825-1-git-send-email-Prike.Liang@amd.com>
 <20200403062642.GA9191@jenkins-Celadon-RN>
 <MN2PR12MB3536631520E378DE4DAACCAAFBC70@MN2PR12MB3536.namprd12.prod.outlook.com>
 <20200403100554.GA9721@jenkins-Celadon-RN>
 <20200403102832.GB9721@jenkins-Celadon-RN>
 <MN2PR12MB3536428C0B9FE390FC01C74CFBC30@MN2PR12MB3536.namprd12.prod.outlook.com>
 <20200407080300.GA27094@jenkins-Celadon-RN>
 <MN2PR12MB353690325FB658194DDFCB77FBC30@MN2PR12MB3536.namprd12.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <MN2PR12MB353690325FB658194DDFCB77FBC30@MN2PR12MB3536.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:202:2e::30) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK2PR06CA0018.apcprd06.prod.outlook.com (2603:1096:202:2e::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16 via Frontend Transport; Tue, 7 Apr 2020 08:31:32 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c4f36b34-5d57-40e8-95a2-08d7dace14e4
X-MS-TrafficTypeDiagnostic: MN2PR12MB3294:|MN2PR12MB3294:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB32941F81DF1ABEB844947B86ECC30@MN2PR12MB3294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(45080400002)(316002)(53546011)(86362001)(66946007)(8676002)(66556008)(6636002)(66476007)(186003)(1076003)(966005)(478600001)(956004)(2906002)(5660300002)(81156014)(55016002)(30864003)(15650500001)(8936002)(54906003)(16526019)(26005)(33716001)(52116002)(6666004)(6862004)(6496006)(81166006)(9686003)(33656002)(4326008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BgxYc6uWISmo8olnP4OTWLvylEeBZ0+YNAOsoUnDybJo1qYW4z31HFLRbvVPPF/5qXEAnwlVcsxkPHsTrs8GDcK28WuLl3nj4PwSqb0KHBUzKh3Q+2u64++zAbLzCzhMZhXlmkGe8ksG9JdyKIBdnoxAH/QyNWMPHkr5z6jdHd5EKxSlskM4CcgBs6pOSbbl39CiY5VpQ61oW+Tb8Ryv+2tjXSIrLxgr7IVoNGqb8SoNjRl+1wKhwGomTvz6ukBSW4eTWMydkvLl6mXxFDaM0OoDX9et5q7kRMSFQCUtRWYblE7KfFspsODac8NWwaGEXLv0gMYO8F+e/RaCgp4K3teUzD0jNRgrX9kLp1IuKc4NKH+ew8Mb95bniITBQcISc9oalCrrS0ofCzinE55IFxJTtcvgDMjNmkSaCLLZs1fyCWI7J/ldk03x3D/DOhsyBM6zeYa0Hi0XJx3lvLoEQOmuLi8tXaTQWxSF8193YLIZgryRFGoLpFMOfuJ7PSjAb5s+/33j6jQcTK06TIQVgg==
X-MS-Exchange-AntiSpam-MessageData: 7X8ebO0UjGIjAF6PB0IRcPGTJbfEebvsi2GAzeTuZDOQcwZJI0+YqF1Mnh17ZiYmgq9Iya4nGEJhwvRb1tjSZvJpyEUOs8m295u3v7tS5rE+rduWylOokqg0GsFTxrLY1UmzJFWn4DK1DEqHJiEmfQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f36b34-5d57-40e8-95a2-08d7dace14e4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 08:31:34.9264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +C8dvfMaNBCnGFXP9fl9chtppeQ/pP5smnWQrW2NA3Djyti7T/mfOlnrchxCtxmVwo6DK4fpRd70GT9+5wux+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 04:26:19PM +0800, Liang, Prike wrote:
> 
> 
> > -----Original Message-----
> > From: Huang, Ray <Ray.Huang@amd.com>
> > Sent: Tuesday, April 7, 2020 4:03 PM
> > To: Liang, Prike <Prike.Liang@amd.com>
> > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix
> > <Felix.Kuehling@amd.com>; Quan, Evan <Evan.Quan@amd.com>; amd-
> > gfx@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/amdgpu: fix gfx hang during suspend with video
> > playback
> > 
> > On Tue, Apr 07, 2020 at 01:49:43PM +0800, Liang, Prike wrote:
> > >
> > > > -----Original Message-----
> > > > From: Huang, Ray <Ray.Huang@amd.com>
> > > > Sent: Friday, April 3, 2020 6:29 PM
> > > > To: Liang, Prike <Prike.Liang@amd.com>
> > > > Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix
> > > > <Felix.Kuehling@amd.com>; Quan, Evan <Evan.Quan@amd.com>; amd-
> > > > gfx@lists.freedesktop.org
> > > > Subject: Re: [PATCH] drm/amdgpu: fix gfx hang during suspend with
> > > > video playback
> > > >
> > > > On Fri, Apr 03, 2020 at 06:05:55PM +0800, Huang Rui wrote:
> > > > > On Fri, Apr 03, 2020 at 05:22:28PM +0800, Liang, Prike wrote:
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Huang, Ray <Ray.Huang@amd.com>
> > > > > > > Sent: Friday, April 3, 2020 2:27 PM
> > > > > > > To: Liang, Prike <Prike.Liang@amd.com>
> > > > > > > Cc: amd-gfx@lists.freedesktop.org; Quan, Evan
> > > > <Evan.Quan@amd.com>;
> > > > > > > Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling,
> > > > > > > Felix <Felix.Kuehling@amd.com>
> > > > > > > Subject: Re: [PATCH] drm/amdgpu: fix gfx hang during suspend
> > > > > > > with video playback
> > > > > > >
> > > > > > > (+ Felix)
> > > > > > >
> > > > > > > On Fri, Apr 03, 2020 at 12:07:53PM +0800, Liang, Prike wrote:
> > > > > > > > The system will be hang up during S3 as SMU is pending at GC
> > > > > > > > not respose the register CP_HQD_ACTIVE access request and
> > > > > > > > this issue can be fixed by adding RLC safe mode guard before
> > > > > > > > each HQD map/unmap retrive opt.
> > > > > > >
> > > > > > > We need more information for the issue, does the map/unmap is
> > > > > > > required for MAP_QUEUES/UNMAP_QUEUES packets or writing with
> > > > MMIO or both?
> > > > > > >
> > > > > > [Prike]  The issue hang up at MP1 was trying to read register
> > > > > > RSMU_RESIDENCY_COUNTER_GC but did not get response from GFX,
> > > > since GFX was busy at reading register CP_HQD_ACTIVE.
> > > > > > Moreover, when disabled GFXOFF this issue also can't see so
> > > > > > there is likely to perform register accessed at GFXOFF CGPG/CGCG
> > enter stage.
> > > > > > As for only  this issue, that seems just MMIO  access failed
> > > > > > case which
> > > > occurred under QUEUE map/unmap status check.
> > > > > >
> > > > >
> > > > > While we start to do S3, we will disable gfxoff at start of suspend.
> > > > > Then in this point, the gfx should be always in "on" state.
> > > > >
> > > > > > > From your patch, you just protect the kernel kiq and user queue.
> > > > > > > What about other kernel compute queues? HIQ?
> > > > > > >
> > > > > > [Prike] So far just find the KIQ/CPQ/DIQ map/unmap will inquire
> > > > > > the CP_HQD_ACTIVE status by MMIO accessing, therefore just guard
> > > > > > the KIQ
> > > > and some type user queue now. Regarding HIQ map and ummap which
> > used
> > > > the method of submitting configuration packet.
> > > > > >
> > > > >
> > > > > KIQ itself init/unit should be always under gfx on state. Can you
> > > > > give a check the result if not add enter/exit rlc safe mode around it?
> > > >
> > > > Wait... In your case, the system didn't load any user queues because
> > > > no ROCm based application is running. So the issue is probably
> > > > caused by KIQ itself init/unit, can you confirm?
> > > [Prike]  This  improper register access is under performing MQD
> > > destroy during amdkfd suspend period. For the KIQ UNI process may not
> > > need the RLC guard as GFX CGPG has been disabled at the early suspend
> > period.
> > 
> > How about move below gfxoff/cgpg disabling ahead of
> > amdgpu_amdkfd_suspend?
> > 
> >         amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
> >         amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
> > 
> >         amdgpu_amdkfd_suspend(adev, !fbcon);
> > 
> > We should disable the gfxoff/cgpg at first to avoid mmio access.
> > 
> [Prike]  Generally speaking that's fine to un-gate the CGPG before each GFX MMIO access.
>  That's should be no different to enter RLC safe mode.
> So do you prefer the solution to move the CGPG ungated at suspend early time right ? 
> 

Yes, that is able to avoid all impact from the following GC access
behavoir.

Thanks,
Ray

> > Thanks,
> > Ray
> > 
> > >
> > > If have concern the other case over guard will send a patch for simplify it.
> > > >
> > > > Thanks,
> > > > Ray
> > > >
> > > > >
> > > > > Hi Felix, maybe we need to use packets with kiq to map all user queues.
> > > > >
> > > > > Thanks,
> > > > > Ray
> > > > >
> > > > > > > Thanks,
> > > > > > > Ray
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> > > > > > > > Tested-by: Mengbing Wang <Mengbing.Wang@amd.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c | 6
> > > > ++++++
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             | 4 ++++
> > > > > > > >  2 files changed, 10 insertions(+)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > > > > > > > index df841c2..e265063 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c
> > > > > > > > @@ -232,6 +232,7 @@ int kgd_gfx_v9_hqd_load(struct kgd_dev
> > > > > > > > *kgd, void
> > > > > > > *mqd, uint32_t pipe_id,
> > > > > > > >  	uint32_t *mqd_hqd;
> > > > > > > >  	uint32_t reg, hqd_base, data;
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_enter_safe_mode(adev);
> > > > > > > >  	m = get_mqd(mqd);
> > > > > > > >
> > > > > > > >  	acquire_queue(kgd, pipe_id, queue_id); @@ -299,6 +300,7
> > @@
> > > > > > > > int kgd_gfx_v9_hqd_load(struct kgd_dev *kgd, void *mqd,
> > > > > > > > uint32_t pipe_id,
> > > > > > > >
> > > > > > > >  	release_queue(kgd);
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_exit_safe_mode(adev);
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -497,6 +499,7 @@ bool kgd_gfx_v9_hqd_is_occupied(struct
> > > > > > > > kgd_dev
> > > > > > > *kgd, uint64_t queue_address,
> > > > > > > >  	bool retval = false;
> > > > > > > >  	uint32_t low, high;
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_enter_safe_mode(adev);
> > > > > > > >  	acquire_queue(kgd, pipe_id, queue_id);
> > > > > > > >  	act = RREG32(SOC15_REG_OFFSET(GC, 0,
> > mmCP_HQD_ACTIVE));
> > > > > > > >  	if (act) {
> > > > > > > > @@ -508,6 +511,7 @@ bool kgd_gfx_v9_hqd_is_occupied(struct
> > > > > > > > kgd_dev
> > > > > > > *kgd, uint64_t queue_address,
> > > > > > > >  			retval = true;
> > > > > > > >  	}
> > > > > > > >  	release_queue(kgd);
> > > > > > > > +	amdgpu_gfx_rlc_exit_safe_mode(adev);
> > > > > > > >  	return retval;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -541,6 +545,7 @@ int kgd_gfx_v9_hqd_destroy(struct
> > > > > > > > kgd_dev *kgd,
> > > > > > > void *mqd,
> > > > > > > >  	uint32_t temp;
> > > > > > > >  	struct v9_mqd *m = get_mqd(mqd);
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_enter_safe_mode(adev);
> > > > > > > >  	if (adev->in_gpu_reset)
> > > > > > > >  		return -EIO;
> > > > > > > >
> > > > > > > > @@ -577,6 +582,7 @@ int kgd_gfx_v9_hqd_destroy(struct
> > > > > > > > kgd_dev *kgd,
> > > > > > > void *mqd,
> > > > > > > >  	}
> > > > > > > >
> > > > > > > >  	release_queue(kgd);
> > > > > > > > +	amdgpu_gfx_rlc_exit_safe_mode(adev);
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > > b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > > index 1fea077..ee107d9 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > > > > > > > @@ -3533,6 +3533,7 @@ static int
> > > > > > > > gfx_v9_0_kiq_init_register(struct
> > > > > > > amdgpu_ring *ring)
> > > > > > > >  	struct v9_mqd *mqd = ring->mqd_ptr;
> > > > > > > >  	int j;
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_enter_safe_mode(adev);
> > > > > > > >  	/* disable wptr polling */
> > > > > > > >  	WREG32_FIELD15(GC, 0, CP_PQ_WPTR_POLL_CNTL, EN, 0);
> > > > > > > >
> > > > > > > > @@ -3629,6 +3630,7 @@ static int
> > > > > > > > gfx_v9_0_kiq_init_register(struct
> > > > > > > amdgpu_ring *ring)
> > > > > > > >  	if (ring->use_doorbell)
> > > > > > > >  		WREG32_FIELD15(GC, 0, CP_PQ_STATUS,
> > DOORBELL_ENABLE,
> > > > > > > 1);
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_exit_safe_mode(adev);
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > @@ -3637,6 +3639,7 @@ static int
> > > > > > > > gfx_v9_0_kiq_fini_register(struct
> > > > > > > amdgpu_ring *ring)
> > > > > > > >  	struct amdgpu_device *adev = ring->adev;
> > > > > > > >  	int j;
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_enter_safe_mode(adev);
> > > > > > > >  	/* disable the queue if it's active */
> > > > > > > >  	if (RREG32_SOC15(GC, 0, mmCP_HQD_ACTIVE) & 1) {
> > > > > > > >
> > > > > > > > @@ -3668,6 +3671,7 @@ static int
> > > > > > > > gfx_v9_0_kiq_fini_register(struct
> > > > > > > amdgpu_ring *ring)
> > > > > > > >  	WREG32_SOC15_RLC(GC, 0, mmCP_HQD_PQ_WPTR_HI, 0);
> > > > > > > >  	WREG32_SOC15_RLC(GC, 0, mmCP_HQD_PQ_WPTR_LO, 0);
> > > > > > > >
> > > > > > > > +	amdgpu_gfx_rlc_exit_safe_mode(adev);
> > > > > > > >  	return 0;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > --
> > > > > > > > 2.7.4
> > > > > > > >
> > > > > _______________________________________________
> > > > > amd-gfx mailing list
> > > > > amd-gfx@lists.freedesktop.org
> > > > > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F
> > > > > list
> > > > > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-
> > > > gfx&amp;data=02%7C01%7Cra
> > > > >
> > > >
> > y.huang%40amd.com%7C040563ff26374383ec6108d7d7b6a2bb%7C3dd8961
> > > > fe4884e6
> > > > >
> > > >
> > 08e11a82d994e183d%7C0%7C0%7C637215053543776633&amp;sdata=COMv
> > > > G7W4%2Fl7
> > > > > aKDAV8Qgbl%2F3myW0HCSz7qk014OLUzrY%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
