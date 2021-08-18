Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E0F3F06B4
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Aug 2021 16:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9DB6E7E5;
	Wed, 18 Aug 2021 14:29:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F426E7DC
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 14:29:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so1913013wml.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Aug 2021 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KExo1vOgk1IRAjsQ5qkRBwdsIhbQyPw7rBBPl4d53Jw=;
 b=MaoevT53jOjRBx201UHgoIzC9SEK8a1spSjKdGIwgF21O0zrhpaZLiLAUtUqydDag+
 h7VUlmisd2ZrD8XmFY32Wl6+WdP3gLkQacaAL4gg18ldQXoBVEHqId1/VYLdynikc6Go
 +/wJPffuCReWw+Fs624E03WczVwQTupw7JjoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KExo1vOgk1IRAjsQ5qkRBwdsIhbQyPw7rBBPl4d53Jw=;
 b=pFJG7+UJ9V149yFa6Sl2qGpoIcyuhMRHR93OLYzNlTmQrgXNIg3+uBOnhpMSB1Ox10
 Y+1qLiZCgnIJKjhYgYJhnZodO7E2GnGtp7e0TBL7dPxdx9/aHt7dpjKnrf5ByU7EiZ7e
 HZxBi2237dLS3ChcLzzMkP88LaExYfSryYArvIAbpQ9EBPKx+EuZ5iajoHJ+10fSnOHS
 eViXrwRym/3HGgF8lNaRmTwWIw0hEs8LgzJHsM3Iz3tSzYnOXJiDDMsly6I4MvVwoIXa
 kMl05gQZ1hKVAq45QPTDn2/rhaO9jCY2hPK3AC5Hp7bVjbXSGGk6ZkOf/GUr9hUhnZyO
 y24g==
X-Gm-Message-State: AOAM5311Cdza7qGrE2D3p7E7FOvcLuud2tTSExTHu1R2f0qXRBvjkJWj
 9mtXgq8+jwmbuHp29Yyc/20o+A==
X-Google-Smtp-Source: ABdhPJyJsvCWmCkg6iSokcNzGOhGg9dSEC27m2NypR94YdBqHYDVntbhSCyYCMov7Vv6wrMbBdobFQ==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr8939860wmf.149.1629296970524; 
 Wed, 18 Aug 2021 07:29:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j16sm521402wrr.78.2021.08.18.07.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:29:30 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:29:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "monk.liu" <monk.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
Message-ID: <YR0ZSLwoZ9tTHBii@phenom.ffwll.local>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Wed, Aug 18, 2021 at 10:02:06AM -0400, Alex Deucher wrote:
> + dri-devel
> 
> Since scheduler is a shared component, please add dri-devel on all
> scheduler patches.

Do we need a MAINTAINRS entry specifically for this, or just oversight?

> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
> >
> > [Why]
> > for bailing job, this commit will delete it from pending list thus the
> > bailing job will never have a chance to be resubmitted even in advance
> > tdr mode.
> >
> > [How]
> > after embeded hw_fence into amdgpu_job is done, the race condition that
> > this commit tries to work around is completely solved.So revert this
> > commit.

Does this also hold for all other drivers? In general the commit message
feels rather rushed and I have no idea what's really going on.

Also at least around tdr there's been some solid clarifications around
how this is supposed to work between tdr and main scheduler thread, would
be good to explain how that all fits together. Or should fit together.
-Daniel

> > This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
> > v2:
> > add dma_fence_get/put() around timedout_job to avoid concurrent delete
> > during processing timedout_job
> >
> > Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
> >  1 file changed, 5 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index a2a953693b45..f9b9b3aefc4a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >  {
> >         struct drm_gpu_scheduler *sched;
> >         struct drm_sched_job *job;
> > +       struct dma_fence *fence;
> >         enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
> >
> >         sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> > @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >
> >         if (job) {
> >                 /*
> > -                * Remove the bad job so it cannot be freed by concurrent
> > -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > -                * is parked at which point it's safe.
> > +                * Get job->s_fence->parent here to avoid concurrent delete during
> > +                * processing timedout_job
> >                  */
> > -               list_del_init(&job->list);
> > +               fence = dma_fence_get(job->s_fence->parent);
> >                 spin_unlock(&sched->job_list_lock);
> >
> >                 status = job->sched->ops->timedout_job(job);
> > @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >                         job->sched->ops->free_job(job);
> >                         sched->free_guilty = false;
> >                 }
> > +               dma_fence_put(fence);
> >         } else {
> >                 spin_unlock(&sched->job_list_lock);
> >         }
> > @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >
> >         kthread_park(sched->thread);
> >
> > -       /*
> > -        * Reinsert back the bad job here - now it's safe as
> > -        * drm_sched_get_cleanup_job cannot race against us and release the
> > -        * bad job at this point - we parked (waited for) any in progress
> > -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > -        * now until the scheduler thread is unparked.
> > -        */
> > -       if (bad && bad->sched == sched)
> > -               /*
> > -                * Add at the head of the queue to reflect it was the earliest
> > -                * job extracted.
> > -                */
> > -               list_add(&bad->list, &sched->pending_list);
> > -
> >         /*
> >          * Iterate the job list from later to  earlier one and either deactive
> >          * their HW callbacks or remove them from pending list if they already
> > --
> > 2.25.1
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
