Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4733FC7C5
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Aug 2021 15:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D75F896A3;
	Tue, 31 Aug 2021 13:01:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE658961E
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Aug 2021 13:01:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id z4so27560403wrr.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Aug 2021 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pgzUJZKh2wS6pXg0RIrCJjjJeglt+gOIjlzwnZuF7yw=;
 b=XOITCHpYN8AFQlNiNidYxcTZU10pbAvxrLbPlj6OCxqrEdyUZTBxzYhmsnzdAZtScw
 J9QGaCRRJDdPA5iuA4PPLUwSljRtsoO3v1mKfyVDTwwMLJ9pENrQcYAPUgrX4kQ0bPOv
 Vq/75GNk4vox8KnFILWVXQXexA+T38241OhMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pgzUJZKh2wS6pXg0RIrCJjjJeglt+gOIjlzwnZuF7yw=;
 b=m7IG6ZSEI5WxCIrPZyaE0OJIaLx+2GYGz+55TBVgw6vMERNtt8uquwLSa1htXi68Wj
 tmhWVp7X+kzsuyuy9KbPlMP8LiKtrwbofanAvp4GjhMXqB1oQjVXCrfydd7zdtaIgMYk
 Ct5DmQ+8wmSccSuUEXRZobWnYrG9zxSJ7HMq3Y9dOzdoDfxq2FhgfCpCGNfht7CgX9vr
 g6AcZbS47RAcModariFGJKleHUY+kTjRfQQ4q5mhSx5kHGVL6xAqs+JQhrjbXm1fZWr1
 UjZh6jda8hXQjU49xokL1cj0hul8WDsrEAdOEIMuBk0J9P4wUK4LtsOG1BresEllfdvB
 yLIg==
X-Gm-Message-State: AOAM530NHVDu/thhaRaNyqtSAkXb8zmLBmsRV507sK1sL88fUtHO3Mxe
 J56WhvgkMBhZx46rJP5iovX67ExjI5l5/Q==
X-Google-Smtp-Source: ABdhPJz82ZmOFOCbgXnjuy+DZcRfYOpoUYOEAKJ9WWyWxsTIhZKvamEJciigjda8uZ/dzf2cJmeUhQ==
X-Received: by 2002:adf:c506:: with SMTP id q6mr30410165wrf.78.1630414901049; 
 Tue, 31 Aug 2021 06:01:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z126sm2473352wmc.11.2021.08.31.06.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 06:01:40 -0700 (PDT)
Date: Tue, 31 Aug 2021 15:01:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Monk Liu <Monk.Liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jingwen chen <jingwen.chen@amd.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Message-ID: <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS4nlkpjeitiwFy1@phenom.ffwll.local>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> Can we please have some actual commit message here, with detailed
> explanation of the race/bug/whatever, how you fix it and why this is the
> best option?
> 
> On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > tested-by: jingwen chen <jingwen.chen@amd.com>
> > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
> >  1 file changed, 4 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> > index ecf8140..894fdb24 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
> >  	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> >  
> >  	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> > +	if (!__kthread_should_park(sched->thread))
> 
> This is a __ function, i.e. considered internal, and it's lockless atomic,
> i.e. unordered. And you're not explaining why this works.
> 
> Iow it's probably buggy, and an just unconditionally parking the kthread
> is probably the right thing to do. If it's not the right thing to do,
> there's a bug here for sure.

Also why don't we reuse the function drivers already have to stop a
scheduler thread? We seem to have two kthread_park now, that's probably
one too much.
-Daniel

> > +		kthread_park(sched->thread);
> > +
> >  	spin_lock(&sched->job_list_lock);
> >  	job = list_first_entry_or_null(&sched->pending_list,
> >  				       struct drm_sched_job, list);
> >  
> >  	if (job) {
> > -		/*
> > -		 * Remove the bad job so it cannot be freed by concurrent
> > -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> > -		 * is parked at which point it's safe.
> > -		 */
> > -		list_del_init(&job->list);
> >  		spin_unlock(&sched->job_list_lock);
> >  
> > +		/* vendor's timeout_job should call drm_sched_start() */
> >  		status = job->sched->ops->timedout_job(job);
> >  
> >  		/*
> > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
> >  	kthread_park(sched->thread);
> >  
> >  	/*
> > -	 * Reinsert back the bad job here - now it's safe as
> > -	 * drm_sched_get_cleanup_job cannot race against us and release the
> > -	 * bad job at this point - we parked (waited for) any in progress
> > -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> > -	 * now until the scheduler thread is unparked.
> > -	 */
> > -	if (bad && bad->sched == sched)
> > -		/*
> > -		 * Add at the head of the queue to reflect it was the earliest
> > -		 * job extracted.
> > -		 */
> > -		list_add(&bad->list, &sched->pending_list);
> > -
> > -	/*
> >  	 * Iterate the job list from later to  earlier one and either deactive
> >  	 * their HW callbacks or remove them from pending list if they already
> >  	 * signaled.
> > -- 
> > 2.7.4
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
