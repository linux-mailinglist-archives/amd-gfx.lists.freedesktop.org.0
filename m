Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFBF3E3E16
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Aug 2021 05:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F86489811;
	Mon,  9 Aug 2021 03:06:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D53289811
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Aug 2021 03:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzLQy7wNXXzLV20VK9BDVzlOXn5PiKO5i7XDggOHtdFlC13m2AOAb1JZr8rpYoEdivtVKAaSrr87vzd2uy30HPks4Y2LZTRElNoXIlRBrSOWHyfM6Yc1G21/o+L2Tw6a7849CMSPSN5Rj3+IS0QkLeHp1R5cLNKaPhw96iUl3Q7s/A+SZk5wWz1UK6qbNpE9HgC1mI+lsWPF8Cl6fhHRWzFv/Qku2ZBUlqiZnUy1QpeRXnH34e2Y8GXUAPDQWOauXcDQDm3aUTdLxUE3ewl6fEkalMuvuIPTT6bLsYwZNYOWAPUMBUZbB6hAOlSlN0S1S+yNiLh9JE9wsXXV+3M2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR0rBzC768JD6HoNR/jTb1Bxg46Y8C+OYbC93orpuRU=;
 b=RJpzxy/lII+AOD5Ou5TiyPn3yPTsWx3oHjj1qvBYzutmz+XivqgJ5+GPgqD4KYTZNZrdp521dEOn2tYfI7hLdqhPdSl/H4LnUz+lLNeP97UY49+0pjgfqA813POZAHklCQi4lFGOscVUQf3H3KetDetuQ7cxdj08BArlftpFgqTY3T+F7a9lwDQzS3GRLbvZ2B03UZQRafG8HhuH5QrfVioK7u/mA+Joa8BPDGK1/hEuSrpa+vvsnK7rGacKRG5x5MiiA13R/f0YlqcUA5xSk38H13HQmKut+TD0PafS6pCf6onbHOWA1YAy6JHYAAv64A2aJHvY2LrO3oGsr/rneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR0rBzC768JD6HoNR/jTb1Bxg46Y8C+OYbC93orpuRU=;
 b=1fKa/QrByHbeejZmAtdvY6Iq5rDe8Lgzq0yOHIDyhNoYv1wwwDbQui6N6kKCkcyflNg5Si1jUUfXGqMnnQyGHiLXh0DcvR5fSC/D5gvQCqA5uGuL/9+gOHKdhLmxFB8BpWfdDaxDSu1OtfKpqWSTf0bxAeH1r0oTWTn7xBBHKh8=
Received: from CO2PR04CA0128.namprd04.prod.outlook.com (2603:10b6:104:7::30)
 by BY5PR12MB5528.namprd12.prod.outlook.com (2603:10b6:a03:1c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Mon, 9 Aug
 2021 03:05:57 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:7:cafe::d6) by CO2PR04CA0128.outlook.office365.com
 (2603:10b6:104:7::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Mon, 9 Aug 2021 03:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4394.16 via Frontend Transport; Mon, 9 Aug 2021 03:05:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sun, 8 Aug
 2021 22:05:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Sun, 8 Aug
 2021 20:05:56 -0700
Received: from wayne-dev (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Sun, 8 Aug 2021 22:05:54 -0500
Date: Mon, 9 Aug 2021 11:05:53 +0800
From: Jingwen Chen <Jingwen.Chen2@amd.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, "Andrey
 Grodzovsky" <andrey.grodzovsky@amd.com>, <monk.liu@amd.com>,
 <christian.koenig@amd.com>, Jack Zhang <Jack.Zhang7@hotmail.com>,
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCHv2 1/2] drm/amd/amdgpu embed hw_fence into amdgpu_job
Message-ID: <20210809030553.w2vulwdog56j2wg5@wayne-dev>
References: <20210805083146.324741-1-Jingwen.Chen2@amd.com>
 <f3ddf3e1-bbc5-f42f-d9f3-7306ed4b9f69@amd.com>
 <20210806054723.gblvo7qa5fqcijfk@wayne-dev>
 <d4bc2215-adab-7c0b-8b2f-16db74b8f90e@gmail.com>
 <20210809021837.ychpua6pzmdhvvr6@wayne-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809021837.ychpua6pzmdhvvr6@wayne-dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d3e7f1e-68f4-4bf9-34ca-08d95ae29bec
X-MS-TrafficTypeDiagnostic: BY5PR12MB5528:
X-Microsoft-Antispam-PRVS: <BY5PR12MB552802AFB5AC3D6F4786EE66B7F69@BY5PR12MB5528.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CmGHR6rKk42Y/FXcB7iCFcRnTso2KMEItRg/K/6hErzxljpQ6i1pIpXxE6xmivTgqNQ37w+h8zU95seH+L090isK+r1N4YrCrhxcJHSbVJa6UYB/NDdyMSM78027Ccxw1WA5ytxQX2a4bu/0u44EeiR2/DxCmUEDdBPi59uz9/k9FAmbYjaOKv4pWBHfdRJL9Wq+B28w4VnP1BG/Rka8vtwpK2D3b8QOLbJIXFhb3L5WRUcQpTxHhUzTcKuMHpz8AVrZO4LRhEHNsq3za6oEicjdkgwc+qmP/Bn3kTSjS+qheCrdN/M9NeFroG9JmJFP1mnl96FQPzYH8hO06Iejcixt3PKYD7vJSJG3O2BPsibj3dpWWxitd4q4/ofX1w0GoOZsWqOrCDd1xDXBDgHflkBKrIMbg4tvLHbe7dDX34Bz/F88bMMuH0ZusnkbJ2K5oth0ZnKGACI912aG9+jyJhqqoQshZneQefZ6UKX11E8cyaFVd93GtxjAdFGF/x2mFkszhzGWMoFDLbd6ErPiLJDJkg7DKUWsluCU6rA288EcYUaruOrbE8cQ2rHqLX8Evo3YtlsGdku4idG01oBkkxSfHBQdq7uD4Mv5/XhhTn6o8sVsdz8SyUZqVFKLqR0NR0Soy5ylxC9yiohZCA2FMDErYrmuaW8GuAIfF9Me9JCwLQVYf9xRrc7y7TCUeNlgj8GRGj81Gp0WIdYTGeBd5EvCTpQLSu3Ux5sydxMp3gulA25XB1Vdg1pUIKGcHQDl
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(36840700001)(30864003)(55016002)(336012)(1076003)(2906002)(426003)(9686003)(8676002)(186003)(82740400003)(356005)(53546011)(26005)(45080400002)(70586007)(36860700001)(81166007)(316002)(34020700004)(478600001)(82310400003)(83380400001)(8936002)(110136005)(66574015)(33716001)(32650700002)(5660300002)(70206006)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 03:05:57.3024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3e7f1e-68f4-4bf9-34ca-08d95ae29bec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5528
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

On Mon Aug 09, 2021 at 10:18:37AM +0800, Jingwen Chen wrote:
> On Fri Aug 06, 2021 at 11:48:04AM +0200, Christian K�nig wrote:
> > 
> > 
> > Am 06.08.21 um 07:52 schrieb Jingwen Chen:
> > > On Thu Aug 05, 2021 at 05:13:22PM -0400, Andrey Grodzovsky wrote:
> > > > On 2021-08-05 4:31 a.m., Jingwen Chen wrote:
> > > > > From: Jack Zhang <Jack.Zhang1@amd.com>
> > > > > 
> > > > > Why: Previously hw fence is alloced separately with job.
> > > > > It caused historical lifetime issues and corner cases.
> > > > > The ideal situation is to take fence to manage both job
> > > > > and fence's lifetime, and simplify the design of gpu-scheduler.
> > > > > 
> > > > > How:
> > > > > We propose to embed hw_fence into amdgpu_job.
> > > > > 1. We cover the normal job submission by this method.
> > > > > 2. For ib_test, and submit without a parent job keep the
> > > > > legacy way to create a hw fence separately.
> > > > > v2:
> > > > > use AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT to show that the fence is
> > > > > embeded in a job.
> > > > > 
> > > > > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > > > > Signed-off-by: Jack Zhang <Jack.Zhang7@hotmail.com>
> > > > > ---
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c  |  1 -
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c   | 63 ++++++++++++++++-----
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c      |  2 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     | 35 ++++++++----
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |  4 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h    |  5 +-
> > > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |  2 +-
> > > > >    8 files changed, 84 insertions(+), 30 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > > index 7b46ba551cb2..3003ee1c9487 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > > > @@ -714,7 +714,6 @@ int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
> > > > >    	ret = dma_fence_wait(f, false);
> > > > >    err_ib_sched:
> > > > > -	dma_fence_put(f);
> > > > >    	amdgpu_job_free(job);
> > > > >    err:
> > > > >    	return ret;
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > index 536005bff24a..277128846dd1 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > > > > @@ -1414,7 +1414,7 @@ static void amdgpu_ib_preempt_mark_partial_job(struct amdgpu_ring *ring)
> > > > >    			continue;
> > > > >    		}
> > > > >    		job = to_amdgpu_job(s_job);
> > > > > -		if (preempted && job->fence == fence)
> > > > > +		if (preempted && (&job->hw_fence) == fence)
> > > > >    			/* mark the job as preempted */
> > > > >    			job->preemption_status |= AMDGPU_IB_PREEMPTED;
> > > > >    	}
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > index 7495911516c2..5e29d797a265 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> > > > > @@ -129,30 +129,46 @@ static u32 amdgpu_fence_read(struct amdgpu_ring *ring)
> > > > >     *
> > > > >     * @ring: ring the fence is associated with
> > > > >     * @f: resulting fence object
> > > > > + * @job: job the fence is embeded in
> > > > >     * @flags: flags to pass into the subordinate .emit_fence() call
> > > > >     *
> > > > >     * Emits a fence command on the requested ring (all asics).
> > > > >     * Returns 0 on success, -ENOMEM on failure.
> > > > >     */
> > > > > -int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
> > > > > +int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f, struct amdgpu_job *job,
> > > > >    		      unsigned flags)
> > > > >    {
> > > > >    	struct amdgpu_device *adev = ring->adev;
> > > > > -	struct amdgpu_fence *fence;
> > > > > +	struct dma_fence *fence;
> > > > > +	struct amdgpu_fence *am_fence;
> > > > >    	struct dma_fence __rcu **ptr;
> > > > >    	uint32_t seq;
> > > > >    	int r;
> > > > > -	fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
> > > > > -	if (fence == NULL)
> > > > > -		return -ENOMEM;
> > > > > +	if (job == NULL) {
> > > > > +		/* create a sperate hw fence */
> > > > > +		am_fence = kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
> > > > > +		if (am_fence == NULL)
> > > > > +			return -ENOMEM;
> > > > > +		fence = &am_fence->base;
> > > > > +		am_fence->ring = ring;
> > > > > +	} else {
> > > > > +		/* take use of job-embedded fence */
> > > > > +		fence = &job->hw_fence;
> > > > > +		job->ring = ring;
> > > > 
> > > > If you would make hw_fence of type amdgpu_fence
> > > > you could probably avoid the special job->ring = ring
> > > > See more in related comment at the bottom
> > > > 
> > > Hi Andry,
> > > 
> > > I'm only make the amdgpu_fence for the fence without job parameter
> > > provided to amdgpu_fence_emit. For embeded fence which is the hw_fence
> > > in amdgpu_job, it will be allocated along with amdgpu_job as dma_fence.
> > 
> > When you have the job and need the ring you can just do
> > conatiner_of(job->sched, struct amdgpu_ring, sched).
> > 
> > No need for an extra ring pointer here.
> > 
> > Regards,
> > Christian.
> I see, I will change this.
> 
> Best Regards,
> JingWen Chen
Hi Christian & Andrey,

A version 3 of this patch has been sent, and the other tdr related patch
doesn't need change, so version 2 of tdr is OK to review.

Best Regards,
JingWen Chen

> > 
> > > 
> > > Regards,
> > > Jingwen Chen
> > > > > +	}
> > > > >    	seq = ++ring->fence_drv.sync_seq;
> > > > > -	fence->ring = ring;
> > > > > -	dma_fence_init(&fence->base, &amdgpu_fence_ops,
> > > > > +	dma_fence_init(fence, &amdgpu_fence_ops,
> > > > >    		       &ring->fence_drv.lock,
> > > > >    		       adev->fence_context + ring->idx,
> > > > >    		       seq);
> > > > > +
> > > > > +	if (job != NULL) {
> > > > > +		/* mark this fence has a parent job */
> > > > > +		set_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &fence->flags);
> > > > > +	}
> > > > > +
> > > > >    	amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
> > > > >    			       seq, flags | AMDGPU_FENCE_FLAG_INT);
> > > > >    	pm_runtime_get_noresume(adev_to_drm(adev)->dev);
> > > > > @@ -175,9 +191,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
> > > > >    	/* This function can't be called concurrently anyway, otherwise
> > > > >    	 * emitting the fence would mess up the hardware ring buffer.
> > > > >    	 */
> > > > > -	rcu_assign_pointer(*ptr, dma_fence_get(&fence->base));
> > > > > +	rcu_assign_pointer(*ptr, dma_fence_get(fence));
> > > > > -	*f = &fence->base;
> > > > > +	*f = fence;
> > > > >    	return 0;
> > > > >    }
> > > > > @@ -621,8 +637,16 @@ static const char *amdgpu_fence_get_driver_name(struct dma_fence *fence)
> > > > >    static const char *amdgpu_fence_get_timeline_name(struct dma_fence *f)
> > > > >    {
> > > > > -	struct amdgpu_fence *fence = to_amdgpu_fence(f);
> > > > > -	return (const char *)fence->ring->name;
> > > > > +	struct amdgpu_ring *ring;
> > > > > +
> > > > > +	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> > > > > +		struct amdgpu_job *job = container_of(f, struct amdgpu_job, hw_fence);
> > > > > +
> > > > > +		ring = job->ring;
> > > > > +	} else {
> > > > > +		ring = to_amdgpu_fence(f)->ring;
> > > > > +	}
> > > > 
> > > > Same as above
> > > > 
> > > > 
> > > > > +	return (const char *)ring->name;
> > > > >    }
> > > > >    /**
> > > > > @@ -656,8 +680,20 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
> > > > >    static void amdgpu_fence_free(struct rcu_head *rcu)
> > > > >    {
> > > > >    	struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
> > > > > -	struct amdgpu_fence *fence = to_amdgpu_fence(f);
> > > > > -	kmem_cache_free(amdgpu_fence_slab, fence);
> > > > > +
> > > > > +	if (test_bit(AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT, &f->flags)) {
> > > > > +	/* free job if fence has a parent job */
> > > > > +		struct amdgpu_job *job;
> > > > > +
> > > > > +		job = container_of(f, struct amdgpu_job, hw_fence);
> > > > > +		kfree(job);
> > > > > +	} else {
> > > > > +	/* free fence_slab if it's separated fence*/
> > > > > +		struct amdgpu_fence *fence;
> > > > > +
> > > > > +		fence = to_amdgpu_fence(f);
> > > > > +		kmem_cache_free(amdgpu_fence_slab, fence);
> > > > > +	}
> > > > >    }
> > > > >    /**
> > > > > @@ -680,6 +716,7 @@ static const struct dma_fence_ops amdgpu_fence_ops = {
> > > > >    	.release = amdgpu_fence_release,
> > > > >    };
> > > > > +
> > > > >    /*
> > > > >     * Fence debugfs
> > > > >     */
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> > > > > index ec65ab0ddf89..c076a6b9a5a2 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> > > > > @@ -262,7 +262,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
> > > > >    				       fence_flags | AMDGPU_FENCE_FLAG_64BIT);
> > > > >    	}
> > > > > -	r = amdgpu_fence_emit(ring, f, fence_flags);
> > > > > +	r = amdgpu_fence_emit(ring, f, job, fence_flags);
> > > > >    	if (r) {
> > > > >    		dev_err(adev->dev, "failed to emit fence (%d)\n", r);
> > > > >    		if (job && job->vmid)
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > > index d33e6d97cc89..65a395060de2 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > > > > @@ -127,11 +127,16 @@ void amdgpu_job_free_resources(struct amdgpu_job *job)
> > > > >    {
> > > > >    	struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
> > > > >    	struct dma_fence *f;
> > > > > +	struct dma_fence *hw_fence;
> > > > >    	unsigned i;
> > > > > -	/* use sched fence if available */
> > > > > -	f = job->base.s_fence ? &job->base.s_fence->finished : job->fence;
> > > > > +	if (job->hw_fence.ops == NULL)
> > > > > +		hw_fence = job->external_hw_fence;
> > > > > +	else
> > > > > +		hw_fence = &job->hw_fence;
> > > > > +	/* use sched fence if available */
> > > > > +	f = job->base.s_fence ? &job->base.s_fence->finished : hw_fence;
> > > > >    	for (i = 0; i < job->num_ibs; ++i)
> > > > >    		amdgpu_ib_free(ring->adev, &job->ibs[i], f);
> > > > >    }
> > > > > @@ -142,20 +147,27 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
> > > > >    	drm_sched_job_cleanup(s_job);
> > > > > -	dma_fence_put(job->fence);
> > > > >    	amdgpu_sync_free(&job->sync);
> > > > >    	amdgpu_sync_free(&job->sched_sync);
> > > > > -	kfree(job);
> > > > > +
> > > > > +    /* only put the hw fence if has embedded fence */
> > > > > +	if (job->hw_fence.ops != NULL)
> > > > > +		dma_fence_put(&job->hw_fence);
> > > > > +	else
> > > > > +		kfree(job);
> > > > >    }
> > > > >    void amdgpu_job_free(struct amdgpu_job *job)
> > > > >    {
> > > > >    	amdgpu_job_free_resources(job);
> > > > > -
> > > > > -	dma_fence_put(job->fence);
> > > > >    	amdgpu_sync_free(&job->sync);
> > > > >    	amdgpu_sync_free(&job->sched_sync);
> > > > > -	kfree(job);
> > > > > +
> > > > > +	/* only put the hw fence if has embedded fence */
> > > > > +	if (job->hw_fence.ops != NULL)
> > > > > +		dma_fence_put(&job->hw_fence);
> > > > > +	else
> > > > > +		kfree(job);
> > > > >    }
> > > > >    int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
> > > > > @@ -184,11 +196,14 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
> > > > >    	job->base.sched = &ring->sched;
> > > > >    	r = amdgpu_ib_schedule(ring, job->num_ibs, job->ibs, NULL, fence);
> > > > > -	job->fence = dma_fence_get(*fence);
> > > > > +	/* record external_hw_fence for direct submit */
> > > > > +	job->external_hw_fence = dma_fence_get(*fence);
> > > > >    	if (r)
> > > > >    		return r;
> > > > >    	amdgpu_job_free(job);
> > > > > +	dma_fence_put(*fence);
> > > > > +
> > > > >    	return 0;
> > > > >    }
> > > > > @@ -246,10 +261,8 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
> > > > >    		if (r)
> > > > >    			DRM_ERROR("Error scheduling IBs (%d)\n", r);
> > > > >    	}
> > > > > -	/* if gpu reset, hw fence will be replaced here */
> > > > > -	dma_fence_put(job->fence);
> > > > > -	job->fence = dma_fence_get(fence);
> > > > > +	dma_fence_get(fence);
> > > > >    	amdgpu_job_free_resources(job);
> > > > >    	fence = r ? ERR_PTR(r) : fence;
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > > index 81caac9b958a..92324c978534 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > > > > @@ -46,7 +46,9 @@ struct amdgpu_job {
> > > > >    	struct amdgpu_sync	sync;
> > > > >    	struct amdgpu_sync	sched_sync;
> > > > >    	struct amdgpu_ib	*ibs;
> > > > > -	struct dma_fence	*fence; /* the hw fence */
> > > > > +	struct dma_fence	hw_fence;
> > > > > +	struct amdgpu_ring *ring;
> > > > Why not instead of 2 fields above just embed � struct amdgpu_fence as
> > > > hw_fence� and by this save the extra 'ring' field handling ?
> > > > 
> > > > Andrey
> > > > 
> > > > 
> > > > > +	struct dma_fence	*external_hw_fence;
> > > > >    	uint32_t		preamble_status;
> > > > >    	uint32_t                preemption_status;
> > > > >    	uint32_t		num_ibs;
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > > > index 9c11ced4312c..03d4b29a76d6 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > > > > @@ -48,6 +48,9 @@
> > > > >    #define AMDGPU_FENCE_FLAG_INT           (1 << 1)
> > > > >    #define AMDGPU_FENCE_FLAG_TC_WB_ONLY    (1 << 2)
> > > > > +/* fence flag bit to indicate the face is embeded in job*/
> > > > > +#define AMDGPU_FENCE_FLAG_EMBED_IN_JOB_BIT		(DMA_FENCE_FLAG_USER_BITS + 1)
> > > > > +
> > > > >    #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
> > > > >    #define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
> > > > > @@ -118,7 +121,7 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device *adev);
> > > > >    void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev);
> > > > >    int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev);
> > > > >    void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev);
> > > > > -int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **fence,
> > > > > +int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **fence, struct amdgpu_job *job,
> > > > >    		      unsigned flags);
> > > > >    int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,
> > > > >    			      uint32_t timeout);
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > > index 2a88ed5d983b..2af8860d74cc 100644
> > > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > > > @@ -1218,7 +1218,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
> > > > >    		amdgpu_gmc_emit_pasid_mapping(ring, job->vmid, job->pasid);
> > > > >    	if (vm_flush_needed || pasid_mapping_needed) {
> > > > > -		r = amdgpu_fence_emit(ring, &fence, 0);
> > > > > +		r = amdgpu_fence_emit(ring, &fence, NULL, 0);
> > > > >    		if (r)
> > > > >    			return r;
> > > > >    	}
> > 
