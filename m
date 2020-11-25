Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E32C3EDD
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 12:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A155E6E8AA;
	Wed, 25 Nov 2020 11:16:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472726E90A
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 11:15:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1khsm5-0006lY-IB; Wed, 25 Nov 2020 12:15:49 +0100
Message-ID: <bec26ed329bf13da8362c9aba225f86089d805d9.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
From: Lucas Stach <l.stach@pengutronix.de>
To: Steven Price <steven.price@arm.com>, Luben Tuikov
 <luben.tuikov@amd.com>,  Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Alexander
 Deucher <Alexander.Deucher@amd.com>
Date: Wed, 25 Nov 2020 12:15:48 +0100
In-Reply-To: <40741fd8-4496-2c12-7850-b68fe8dc8e2a@arm.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
 <40741fd8-4496-2c12-7850-b68fe8dc8e2a@arm.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: amd-gfx@lists.freedesktop.org
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am Mittwoch, den 25.11.2020, 11:04 +0000 schrieb Steven Price:
> On 25/11/2020 03:17, Luben Tuikov wrote:
> > The job timeout handler now returns status
> > indicating back to the DRM layer whether the job
> > was successfully cancelled or whether more time
> > should be given to the job to complete.
> 
> I'm not sure I understand in what circumstances you would want to give 
> the job more time to complete. Could you expand on that?

On etnaviv we don't have the ability to preempt a running job, but we
can look at the GPU state to determine if it's still making progress
with the current job, so we want to extend the timeout in that case to
not kill a long running but valid job.

Regards,
Lucas

> One thing we're missing at the moment in Panfrost is the ability to 
> suspend ("soft stop" is the Mali jargon) a job and pick something else 
> to run. The propitiatory driver stack uses this to avoid timing out long 
> running jobs while still allowing other processes to have time on the 
> GPU. But this interface as it stands doesn't seem to provide that.
> 
> As the kernel test robot has already pointed out - you'll need to at the 
> very least update the other uses of this interface.
> 
> Steve
> 
> > Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  6 ++++--
> >   include/drm/gpu_scheduler.h             | 13 ++++++++++---
> >   2 files changed, 14 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > index ff48101bab55..81b73790ecc6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> > @@ -28,7 +28,7 @@
> >   #include "amdgpu.h"
> >   #include "amdgpu_trace.h"
> >   
> > -static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> > +static int amdgpu_job_timedout(struct drm_sched_job *s_job)
> >   {
> >   	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
> >   	struct amdgpu_job *job = to_amdgpu_job(s_job);
> > @@ -41,7 +41,7 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> >   	    amdgpu_ring_soft_recovery(ring, job->vmid, s_job->s_fence->parent)) {
> >   		DRM_ERROR("ring %s timeout, but soft recovered\n",
> >   			  s_job->sched->name);
> > -		return;
> > +		return 0;
> >   	}
> >   
> >   	amdgpu_vm_get_task_info(ring->adev, job->pasid, &ti);
> > @@ -53,10 +53,12 @@ static void amdgpu_job_timedout(struct drm_sched_job *s_job)
> >   
> >   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
> >   		amdgpu_device_gpu_recover(ring->adev, job);
> > +		return 0;
> >   	} else {
> >   		drm_sched_suspend_timeout(&ring->sched);
> >   		if (amdgpu_sriov_vf(adev))
> >   			adev->virt.tdr_debug = true;
> > +		return 1;
> >   	}
> >   }
> >   
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 2e0c368e19f6..61f7121e1c19 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -230,10 +230,17 @@ struct drm_sched_backend_ops {
> >   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
> >   
> >   	/**
> > -         * @timedout_job: Called when a job has taken too long to execute,
> > -         * to trigger GPU recovery.
> > +	 * @timedout_job: Called when a job has taken too long to execute,
> > +	 * to trigger GPU recovery.
> > +	 *
> > +	 * Return 0, if the job has been aborted successfully and will
> > +	 * never be heard of from the device. Return non-zero if the
> > +	 * job wasn't able to be aborted, i.e. if more time should be
> > +	 * given to this job. The result is not "bool" as this
> > +	 * function is not a predicate, although its result may seem
> > +	 * as one.
> >   	 */
> > -	void (*timedout_job)(struct drm_sched_job *sched_job);
> > +	int (*timedout_job)(struct drm_sched_job *sched_job);
> >   
> >   	/**
> >            * @free_job: Called once the job's finished fence has been signaled
> > 

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
