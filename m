Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E86744C209
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Nov 2021 14:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F07C6E161;
	Wed, 10 Nov 2021 13:24:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858146E150
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Nov 2021 13:24:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id t30so3974329wra.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Nov 2021 05:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AtWc/vfRUep2b/w7c+5dONXT3fuYeTTXygWHlVHnHVo=;
 b=HkpWZCjy21OBIIdpEUX2kbJcqJhZsPb3PiLo80yjTPfAJv92ibXi4vKzGD0sWwoBaY
 NhnagqXGvBlrqhFr/Cu7yKhFU06xLzM96f7BUcwO2QjzsotlGiW7ZR+++BOU+4onIi5C
 hZ9I1eDrHun+kzjJoKS8kF0bASHoixa5qcLRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AtWc/vfRUep2b/w7c+5dONXT3fuYeTTXygWHlVHnHVo=;
 b=g0wN8SEPVkrzqDL+JOr7t7giWepONnScj672pgIDmaIoiwHrbRX7xmpafvLbpNL/NF
 qg4myLEY9vV3EzzV6L38+nX94BrKzEOzvydivTIlZ39vWg42SNjK4c4e2JlND+2QvvAH
 8AJwipXnO4E66puJz26R5Lzk+b65QBU8VqD8/spWmSvX12UpHr9NcwVtBRc0de5r31Ek
 I90CFYX0BAzP4GK+93IafXbGXR4y7r04ZZJhKwB810aleIr9gtSR5mjy68vi+bvbGQfm
 Vw1q79z9O5rTaaHiay/Olxc5C9D/DIg85D5E5k96USG80VlsiQjKoV6FEKkEi9AiBVcl
 SWxw==
X-Gm-Message-State: AOAM533JiE0oqk0y/hPsNcwRlrRIBuuMirdLMH7vTi7GEHZPPQp1j7iO
 ziQnSxp7wyvzFOSgzvLtA8eI0w==
X-Google-Smtp-Source: ABdhPJwFe5b/wcob3nE2vupbxbXof31flduvijKI5iUuubaAFl2jHW7z18hyxdN0O+6HqmO+lPv+kg==
X-Received: by 2002:adf:ecce:: with SMTP id s14mr16966170wro.98.1636550653756; 
 Wed, 10 Nov 2021 05:24:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l7sm29273730wry.86.2021.11.10.05.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:24:12 -0800 (PST)
Date: Wed, 10 Nov 2021 14:24:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Message-ID: <YYvH+3jNqhzxhlG9@phenom.ffwll.local>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
 <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
 <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
 <CAF6AEGvGQP-6eNevDyS9sXg+6qOKMrG7h5rwhKO=v8L5mQOiUA@mail.gmail.com>
 <YYuVyRlAATYO4ptP@phenom.ffwll.local>
 <ec8352f1-e473-683b-ecc6-9969c50c4bac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec8352f1-e473-683b-ecc6-9969c50c4bac@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Liu, Monk" <Monk.Liu@amd.com>, "Chen,
 Jingwen" <Jingwen.Chen@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Nov 10, 2021 at 11:09:50AM +0100, Christian K�nig wrote:
> Am 10.11.21 um 10:50 schrieb Daniel Vetter:
> > On Tue, Nov 09, 2021 at 08:17:01AM -0800, Rob Clark wrote:
> > > On Tue, Nov 9, 2021 at 1:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > On Mon, Nov 08, 2021 at 03:39:17PM -0800, Rob Clark wrote:
> > > > > I stumbled across this thread when I ran into the same issue, while
> > > > > working out how to move drm/msm to use scheduler's retire +
> > > > > timeout/recovery (and get rid of our own mirror list of in-flight
> > > > > jobs).  We already have hw error detection enabled, and it can signal
> > > > > quite fast, so assuming the first job on the list is the guilty job
> > > > > just won't work.
> > > > > 
> > > > > But I was considering a slightly different approach to fixing this,
> > > > > instead just handling it all in drm_sched_main() and getting rid of
> > > > > the complicated kthread parking gymnastics.  Ie. something along the
> > > > > lines of:
> > > > So handling timeouts in the main sched thread wont work as soon as you
> > > > have multiple engines and reset that impacts across engines:
> > > > 
> > > > - Nothing is simplified since you still need to stop the other scheduler
> > > >    threads.
> > > > 
> > > > - You get deadlocks if 2 schedulers time out at the same time, and both
> > > >    want to stop the other one.
> > > > 
> > > > Hence workqueue. Now the rule for the wq is that you can only have one per
> > > > reset domain, so
> > > > - single engine you just take the one drm/sched provides
> > > > - if reset affects all your engines in the chip, then you allocate on in
> > > >    the drm_device and pass that to all
> > > > - if you have a complex of gpus all interconnected (e.g. xgmi hive for
> > > >    amd), then it's one wq for the entire hive
> > > > 
> > > > _All_ reset related things must be run on that workqueue or things breaks,
> > > > which means if you get hw fault that also needs to be run there. I guess
> > > > we should either patch drm/sched to check you call that function from the
> > > > right workqueue, or just handle it internally.
> > > Hmm, ok.. I guess it would be useful to better document the reasoning
> > > for the current design, that would have steered me more towards the
> > > approach taken in this patch.
> > Maybe this was because you worked on an old kernel? Boris did update the
> > kerneldoc as part of making gpu reset work for panfrost, which has this
> > multi-engine reset problem. If that's not yet clear then we need to
> > improve the docs further.
> > 
> > AMD's problem is even worse, because their reset domain is the entire xgmi
> > hive, so multiple pci devices.
> 
> I'm pushing for quite a while that we get something like an
> amdgpu_reset_domain structure or similar for this, but we unfortunately
> don't have that yet.
> 
> Maybe it should be a good idea to have something like a drm_sched_domain or
> similar with all the necessary information for the inter scheduler handling.
> 
> E.g. a workqueue for reset etc...

Yeah I think as soon as we have more stuff than just the wq then a
drm_sched_reset_domain sounds good.

But if it's just driver stuff (e.g. the xgmi locking you have in amdgpu
reset comes to mind) then I think just a driver_reset_domain struct that
bundles all that stuff up seems good enough.

E.g. on i915 I'm also pondering whether some of the fw requests should be
processed by the reset wq, to avoid locking headaches, so I don't think
hiding that work too much in abstractions is a good idea.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Also there might more issues in drm/sched ofc, e.g. I've looked a bit at
> > ordering/barriers and I'm pretty sure a lot are still missing. Or at least
> > we should have comments in the code explaining why it all works.
> > -Daniel
> > 
> > > BR,
> > > -R
> > > 
> > > > -Daniel
> > > > 
> > > > > ---------------------
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 67382621b429..4d6ce775c316 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > @@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
> > > > > drm_gpu_scheduler *sched)
> > > > >          return false;
> > > > >   }
> > > > > 
> > > > > +static bool handle_timeout(struct drm_gpu_scheduler *sched)
> > > > > +{
> > > > > +       struct drm_sched_job *bad;
> > > > > +
> > > > > +       if (!sched->has_timeout)
> > > > > +               return false;
> > > > > +
> > > > > +       sched->has_timeout = false;
> > > > > +
> > > > > +       spin_lock(&sched->job_list_lock);
> > > > > +       bad = list_first_entry_or_null(&sched->pending_list,
> > > > > +                                      struct drm_sched_job, list);
> > > > > +
> > > > > +       if (!bad) {
> > > > > +               spin_unlock(&sched->job_list_lock);
> > > > > +               return false;
> > > > > +       }
> > > > > +
> > > > > +       spin_unlock(&sched->job_list_lock);
> > > > > +
> > > > > +       if (sched->timeout_wq == system_wq) {
> > > > > +               /*
> > > > > +                * If driver has no specific requirements about serializing
> > > > > +                * reset wrt. other engines, just call timedout_job() directly
> > > > > +                */
> > > > > +               sched->ops->timedout_job(job);
> > > > > +       } else {
> > > > > +               /*
> > > > > +                * Otherwise queue it on timeout_wq and wait for it to complete
> > > > > +                */
> > > > > +               ... more typing needed here ...
> > > > > +       }
> > > > > +
> > > > > +       if (sched->free_guilty) {
> > > > > +               sched->ops->free_job(job);
> > > > > +               sched->free_guilty = false;
> > > > > +       }
> > > > > +}
> > > > > +
> > > > >   /**
> > > > >    * drm_sched_main - main scheduler thread
> > > > >    *
> > > > > @@ -787,6 +826,7 @@ static int drm_sched_main(void *param)
> > > > > 
> > > > >                  wait_event_interruptible(sched->wake_up_worker,
> > > > >                                           (cleanup_job =
> > > > > drm_sched_get_cleanup_job(sched)) ||
> > > > > +                                        handle_timeout(sched) ||
> > > > >                                           (!drm_sched_blocked(sched) &&
> > > > >                                            (entity =
> > > > > drm_sched_select_entity(sched))) ||
> > > > >                                           kthread_should_stop());
> > > > > ---------------------
> > > > > 
> > > > > drm_sched_fault() and the sw timeout handler would just set
> > > > > sched->has_timeout and kick sched->wake_up_worker.
> > > > > 
> > > > > And since we handle the timeout case after
> > > > > drm_sched_get_cleanup_job(), we know that all of the successfully
> > > > > completed jobs have already been popped off the list, and won't be
> > > > > unfairly maligned.
> > > > > 
> > > > > BR,
> > > > > -R
> > > > > 
> > > > > On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
> > > > > > [AMD Official Use Only]
> > > > > > 
> > > > > > Okay, I will reprepare this patch
> > > > > > 
> > > > > > Thanks
> > > > > > 
> > > > > > ------------------------------------------
> > > > > > Monk Liu | Cloud-GPU Core team
> > > > > > ------------------------------------------
> > > > > > 
> > > > > > -----Original Message-----
> > > > > > From: Daniel Vetter <daniel@ffwll.ch>
> > > > > > Sent: Tuesday, August 31, 2021 9:02 PM
> > > > > > To: Liu, Monk <Monk.Liu@amd.com>
> > > > > > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Chen, Jingwen <Jingwen.Chen@amd.com>
> > > > > > Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
> > > > > > 
> > > > > > On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> > > > > > > Can we please have some actual commit message here, with detailed
> > > > > > > explanation of the race/bug/whatever, how you fix it and why this is
> > > > > > > the best option?
> > > > > > > 
> > > > > > > On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > > > > > > > tested-by: jingwen chen <jingwen.chen@amd.com>
> > > > > > > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > > > > > > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > > > > > > > ---
> > > > > > > >   drivers/gpu/drm/scheduler/sched_main.c | 24
> > > > > > > > ++++--------------------
> > > > > > > >   1 file changed, 4 insertions(+), 20 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > index ecf8140..894fdb24 100644
> > > > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > > > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
> > > > > > > >      sched = container_of(work, struct drm_gpu_scheduler,
> > > > > > > > work_tdr.work);
> > > > > > > > 
> > > > > > > >      /* Protects against concurrent deletion in
> > > > > > > > drm_sched_get_cleanup_job */
> > > > > > > > +   if (!__kthread_should_park(sched->thread))
> > > > > > > This is a __ function, i.e. considered internal, and it's lockless
> > > > > > > atomic, i.e. unordered. And you're not explaining why this works.
> > > > > > > 
> > > > > > > Iow it's probably buggy, and an just unconditionally parking the
> > > > > > > kthread is probably the right thing to do. If it's not the right thing
> > > > > > > to do, there's a bug here for sure.
> > > > > > Also why don't we reuse the function drivers already have to stop a scheduler thread? We seem to have two kthread_park now, that's probably one too much.
> > > > > > -Daniel
> > > > > > 
> > > > > > > > +           kthread_park(sched->thread);
> > > > > > > > +
> > > > > > > >      spin_lock(&sched->job_list_lock);
> > > > > > > >      job = list_first_entry_or_null(&sched->pending_list,
> > > > > > > >                                     struct drm_sched_job, list);
> > > > > > > > 
> > > > > > > >      if (job) {
> > > > > > > > -           /*
> > > > > > > > -            * Remove the bad job so it cannot be freed by concurrent
> > > > > > > > -            * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > > > > > > > -            * is parked at which point it's safe.
> > > > > > > > -            */
> > > > > > > > -           list_del_init(&job->list);
> > > > > > > >              spin_unlock(&sched->job_list_lock);
> > > > > > > > 
> > > > > > > > +           /* vendor's timeout_job should call drm_sched_start() */
> > > > > > > >              status = job->sched->ops->timedout_job(job);
> > > > > > > > 
> > > > > > > >              /*
> > > > > > > > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> > > > > > > >      kthread_park(sched->thread);
> > > > > > > > 
> > > > > > > >      /*
> > > > > > > > -    * Reinsert back the bad job here - now it's safe as
> > > > > > > > -    * drm_sched_get_cleanup_job cannot race against us and release the
> > > > > > > > -    * bad job at this point - we parked (waited for) any in progress
> > > > > > > > -    * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > > > > > > > -    * now until the scheduler thread is unparked.
> > > > > > > > -    */
> > > > > > > > -   if (bad && bad->sched == sched)
> > > > > > > > -           /*
> > > > > > > > -            * Add at the head of the queue to reflect it was the earliest
> > > > > > > > -            * job extracted.
> > > > > > > > -            */
> > > > > > > > -           list_add(&bad->list, &sched->pending_list);
> > > > > > > > -
> > > > > > > > -   /*
> > > > > > > >       * Iterate the job list from later to  earlier one and either deactive
> > > > > > > >       * their HW callbacks or remove them from pending list if they already
> > > > > > > >       * signaled.
> > > > > > > > --
> > > > > > > > 2.7.4
> > > > > > > > 
> > > > > > > --
> > > > > > > Daniel Vetter
> > > > > > > Software Engineer, Intel Corporation
> > > > > > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.
> > > > > > > ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76
> > > > > > > b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601170
> > > > > > > 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > > > > > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QzgCU7%2BPdA0aWL5%2BJLg
> > > > > > > KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=0
> > > > > > --
> > > > > > Daniel Vetter
> > > > > > Software Engineer, Intel Corporation
> > > > > > https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660117051194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QzgCU7%2BPdA0aWL5%2BJLgKeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=0
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
