Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A0449F08
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Nov 2021 00:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0316E170;
	Mon,  8 Nov 2021 23:34:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CD46E170;
 Mon,  8 Nov 2021 23:34:20 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b12so29754592wrh.4;
 Mon, 08 Nov 2021 15:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EzlEpuPMSkn+JiXpaVDjumahmP/gH6MVcM8onIzqW48=;
 b=O0ceWYI67s9m0HDzX1h6gVUqruvqfOBXQPLYx/gVhJybBg/U/qWuz6SooXPP5qcunS
 3f5iEqoN2DAlibgAjmW7IiM20CqzOLxwvdnghRb9/QjvSVGFm67Ma5zOCU6BtcMyA4eS
 bjPpojPBq617J4rEGzciaT9yES2TS6yI/P5Jsbr8tMVSQ+K2ABUKvX2fbfeyLADEX4N3
 fmqMxjBYdRrx8M/5Wt52l1FT+JJ/oOTxbXEDhcmnvubWBnqAqJdA5+Rdnu5j5bIjiglS
 GRpq6BWQOfzUoO/xTBvSxTJcfJ0NrLS7eTJBpStD38mKY6IsmWcpZVFUT25lsKQJHAna
 qU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EzlEpuPMSkn+JiXpaVDjumahmP/gH6MVcM8onIzqW48=;
 b=2HOs3xrmlRHH2uBnjonsZralDR1ZHL0XfQSMyWmo88yHt9QvQeqjDT+QkqG3MEiPv1
 89SbE2TTcebNqg08ZtAcfDTFQ79Y1/wAOUzdbromt43tw3RUdGoGiE/TsERBrhXe5z3t
 CXaIV73UCuD6BDldDYZ7awfgvo3SUVKNWJm9ax7WARuUlGWMvu5VV6JOHwYpBH+Lhzgx
 yQcFJd99o7Twj96D4/80Id5hVub8vmhXvxMFC73Wwuf6LpNpCLnCRd7hRMLYaS/XZob7
 JCzNg47pWT1LFqCfIRFMAaM23m7bOCkhVwCBWpv+XUqgqHuVrp45L0Ys75H3tQipijF4
 OGFQ==
X-Gm-Message-State: AOAM530WCP8EiKI9tz+QpHcZXxtvGFA8E+KdJi3YShrH1RZsQIX7vfoX
 /tWov1ot7VXlvqRIz7qmIT/BxVWXYB3E3seTiXU=
X-Google-Smtp-Source: ABdhPJy/VCrTx8D9wOtQGMpMK7Wf9blQOGwXif+wWQ6OIirvW7rT39w2SVfXPuMQS70l/CmKF6mYfm16UXZ1gruawgY=
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr3635573wri.251.1636414459250; 
 Mon, 08 Nov 2021 15:34:19 -0800 (PST)
MIME-Version: 1.0
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local>
 <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Nov 2021 15:39:17 -0800
Message-ID: <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: "Liu, Monk" <Monk.Liu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Chen, Jingwen" <Jingwen.Chen@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

I stumbled across this thread when I ran into the same issue, while
working out how to move drm/msm to use scheduler's retire +
timeout/recovery (and get rid of our own mirror list of in-flight
jobs).  We already have hw error detection enabled, and it can signal
quite fast, so assuming the first job on the list is the guilty job
just won't work.

But I was considering a slightly different approach to fixing this,
instead just handling it all in drm_sched_main() and getting rid of
the complicated kthread parking gymnastics.  Ie. something along the
lines of:

---------------------
diff --git a/drivers/gpu/drm/scheduler/sched_main.c
b/drivers/gpu/drm/scheduler/sched_main.c
index 67382621b429..4d6ce775c316 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
drm_gpu_scheduler *sched)
        return false;
 }

+static bool handle_timeout(struct drm_gpu_scheduler *sched)
+{
+       struct drm_sched_job *bad;
+
+       if (!sched->has_timeout)
+               return false;
+
+       sched->has_timeout =3D false;
+
+       spin_lock(&sched->job_list_lock);
+       bad =3D list_first_entry_or_null(&sched->pending_list,
+                                      struct drm_sched_job, list);
+
+       if (!bad) {
+               spin_unlock(&sched->job_list_lock);
+               return false;
+       }
+
+       spin_unlock(&sched->job_list_lock);
+
+       if (sched->timeout_wq =3D=3D system_wq) {
+               /*
+                * If driver has no specific requirements about serializing
+                * reset wrt. other engines, just call timedout_job() direc=
tly
+                */
+               sched->ops->timedout_job(job);
+       } else {
+               /*
+                * Otherwise queue it on timeout_wq and wait for it to comp=
lete
+                */
+               ... more typing needed here ...
+       }
+
+       if (sched->free_guilty) {
+               sched->ops->free_job(job);
+               sched->free_guilty =3D false;
+       }
+}
+
 /**
  * drm_sched_main - main scheduler thread
  *
@@ -787,6 +826,7 @@ static int drm_sched_main(void *param)

                wait_event_interruptible(sched->wake_up_worker,
                                         (cleanup_job =3D
drm_sched_get_cleanup_job(sched)) ||
+                                        handle_timeout(sched) ||
                                         (!drm_sched_blocked(sched) &&
                                          (entity =3D
drm_sched_select_entity(sched))) ||
                                         kthread_should_stop());
---------------------

drm_sched_fault() and the sw timeout handler would just set
sched->has_timeout and kick sched->wake_up_worker.

And since we handle the timeout case after
drm_sched_get_cleanup_job(), we know that all of the successfully
completed jobs have already been popped off the list, and won't be
unfairly maligned.

BR,
-R

On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
>
> [AMD Official Use Only]
>
> Okay, I will reprepare this patch
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Tuesday, August 31, 2021 9:02 PM
> To: Liu, Monk <Monk.Liu@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Chen,=
 Jingwen <Jingwen.Chen@amd.com>
> Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>
> On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
> > Can we please have some actual commit message here, with detailed
> > explanation of the race/bug/whatever, how you fix it and why this is
> > the best option?
> >
> > On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
> > > tested-by: jingwen chen <jingwen.chen@amd.com>
> > > Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> > > Signed-off-by: jingwen chen <jingwen.chen@amd.com>
> > > ---
> > >  drivers/gpu/drm/scheduler/sched_main.c | 24
> > > ++++--------------------
> > >  1 file changed, 4 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index ecf8140..894fdb24 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_=
struct *work)
> > >     sched =3D container_of(work, struct drm_gpu_scheduler,
> > > work_tdr.work);
> > >
> > >     /* Protects against concurrent deletion in
> > > drm_sched_get_cleanup_job */
> > > +   if (!__kthread_should_park(sched->thread))
> >
> > This is a __ function, i.e. considered internal, and it's lockless
> > atomic, i.e. unordered. And you're not explaining why this works.
> >
> > Iow it's probably buggy, and an just unconditionally parking the
> > kthread is probably the right thing to do. If it's not the right thing
> > to do, there's a bug here for sure.
>
> Also why don't we reuse the function drivers already have to stop a sched=
uler thread? We seem to have two kthread_park now, that's probably one too =
much.
> -Daniel
>
> > > +           kthread_park(sched->thread);
> > > +
> > >     spin_lock(&sched->job_list_lock);
> > >     job =3D list_first_entry_or_null(&sched->pending_list,
> > >                                    struct drm_sched_job, list);
> > >
> > >     if (job) {
> > > -           /*
> > > -            * Remove the bad job so it cannot be freed by concurrent
> > > -            * drm_sched_cleanup_jobs. It will be reinserted back aft=
er sched->thread
> > > -            * is parked at which point it's safe.
> > > -            */
> > > -           list_del_init(&job->list);
> > >             spin_unlock(&sched->job_list_lock);
> > >
> > > +           /* vendor's timeout_job should call drm_sched_start() */
> > >             status =3D job->sched->ops->timedout_job(job);
> > >
> > >             /*
> > > @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sc=
hed, struct drm_sched_job *bad)
> > >     kthread_park(sched->thread);
> > >
> > >     /*
> > > -    * Reinsert back the bad job here - now it's safe as
> > > -    * drm_sched_get_cleanup_job cannot race against us and release t=
he
> > > -    * bad job at this point - we parked (waited for) any in progress
> > > -    * (earlier) cleanups and drm_sched_get_cleanup_job will not be c=
alled
> > > -    * now until the scheduler thread is unparked.
> > > -    */
> > > -   if (bad && bad->sched =3D=3D sched)
> > > -           /*
> > > -            * Add at the head of the queue to reflect it was the ear=
liest
> > > -            * job extracted.
> > > -            */
> > > -           list_add(&bad->list, &sched->pending_list);
> > > -
> > > -   /*
> > >      * Iterate the job list from later to  earlier one and either dea=
ctive
> > >      * their HW callbacks or remove them from pending list if they al=
ready
> > >      * signaled.
> > > --
> > > 2.7.4
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog=
.
> > ffwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf7=
6
> > b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601170
> > 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJL=
g
> > KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=3D0
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.f=
fwll.ch%2F&amp;data=3D04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76b308=
d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660117051194614%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DQzgCU7%2BPdA0aWL5%2BJLgKeKbGaMMGqeGI9KE0=
P0LXlN4%3D&amp;reserved=3D0
