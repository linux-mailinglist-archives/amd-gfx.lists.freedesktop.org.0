Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8615461A
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Feb 2020 15:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09F6EA90;
	Thu,  6 Feb 2020 14:27:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE006EA90
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Feb 2020 14:27:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so7468730wrr.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Feb 2020 06:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GJaqRUkf5HmVJ0o+iFfDzsGvpuO8Qj/PoH6cu1uEDSI=;
 b=rF5wtFxTIovLa21NHQbdoU64N0CnMfQbSgnCy+5GQCGAVCTBHVv1oxGcmwLCkMfzSb
 9GuT2ke4UtIBHFCjs17MOyyhJmq2LUEx5yQTTmUrcqCss50zCrPF1T6bRPx5Oo9ezeHc
 XlB26KbvKU6tkcKb0nGJ7cLzuRUtb3MBUMGO7E7S2n3qE0bp7YmFuJ7TK502W1PoIMl6
 ehjtnv4GUusZaL90Ajw87XheKVsqG8SVO9d2URmPVWa4JYWplK/Pa6zuxrxgdYVasPBK
 tpmERlH+CemiRZaUy4ZzxC53z2ROQz/KNWigrtIhze+yU6GfisODwBw1XBrBELLTWUw7
 4e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GJaqRUkf5HmVJ0o+iFfDzsGvpuO8Qj/PoH6cu1uEDSI=;
 b=oEevyJkheZYC63SUT8VkGDeKTojLC1EhV8D2KWOd+qjdeVz+CaK46xFf/VdHI3qSI1
 52uHXe6I9uRYs3h95Yf6sKLO+pzj79dpIl74zOohHnd6RgQ9q7zsInzNcEuFncNjBGdC
 NNrFP+Wb3XNBu7L5OGULswvWFQ3IXQt8HAeuFNzUSiae40OxDmon2gOAa7IuzAx66l4P
 31kAiCvqXqd3HcBCaav30UZl7+V9lxHpp5e0fWaVM4DfTwefm6773DMdnWbHZ9IKfqzf
 OG8Wuzhi1fOUlIyQgoJqJTAxM/EcrgElR114iL0bPQ6KIZPzs2ZrBvHYTcweFZtws2Is
 jmGA==
X-Gm-Message-State: APjAAAWVoNRhW95xGyS3QovUFAy1e5qZNQYinxZ43kMc1YMyvNJFidL6
 q3TFpCtCmcfcZqlEAFTdjfzKzpxKSXSL1OeiOl3w2g==
X-Google-Smtp-Source: APXvYqyR87omOBOCCKhqVjJWf8XR6pYH9tMax+fHokpjU/EC7x9BWmou/BCLZ5YCFr6hrVWhu04TpEsF6NiACLO6d4k=
X-Received: by 2002:adf:a50b:: with SMTP id i11mr4014374wrb.362.1580999242346; 
 Thu, 06 Feb 2020 06:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20200201033707.16351-1-rajneesh.bhardwaj@amd.com>
 <20200201033707.16351-4-rajneesh.bhardwaj@amd.com>
 <aeb4f57d-fac8-8a4f-caac-2dd725f2f66a@amd.com>
 <CADnq5_PjVGNMsoxNcOZesZGXVe=P7QgNZDAmL7XV2OTEg3OxJQ@mail.gmail.com>
In-Reply-To: <CADnq5_PjVGNMsoxNcOZesZGXVe=P7QgNZDAmL7XV2OTEg3OxJQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Feb 2020 09:27:11 -0500
Message-ID: <CADnq5_PhEwAszT1R56K9+u+uXiaLaEbyh6Uguv=OzyPfqdWq=w@mail.gmail.com>
Subject: Re: [Patch v2 3/4] drm/amdkfd: refactor runtime pm for baco
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 4, 2020 at 11:46 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Feb 4, 2020 at 4:28 PM Felix Kuehling <felix.kuehling@amd.com> wrote:
> >
> > On 2020-01-31 10:37 p.m., Rajneesh Bhardwaj wrote:
> > > So far the kfd driver implemented same routines for runtime and system
> > > wide suspend and resume (s2idle or mem). During system wide suspend the
> > > kfd aquires an atomic lock that prevents any more user processes to
> > > create queues and interact with kfd driver and amd gpu. This mechanism
> > > created problem when amdgpu device is runtime suspended with BACO
> > > enabled. Any application that relies on kfd driver fails to load because
> > > the driver reports a locked kfd device since gpu is runtime suspended.
> > >
> > > However, in an ideal case, when gpu is runtime  suspended the kfd driver
> > > should be able to:
> > >
> > >   - auto resume amdgpu driver whenever a client requests compute service
> > >   - prevent runtime suspend for amdgpu  while kfd is in use
> > >
> > > This change refactors the amdgpu and amdkfd drivers to support BACO and
> > > runtime power management.
> > >
> > > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
> >
> > One small comment inline. Other than that patches 1-3 are
> >
> > Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >
> > Also, I believe patch 1 is unchanged from v1 and already got a
> > Reviewed-by from Alex. Please remember to add that tag before you submit.
> >
> > The last patch that enabled runtime PM by default, I'd leave the
> > decision to submit that up to Alex. There may be other considerations
> > than just KFD.
>
> KFD was the only thing left.  I've been running with runpm forced on
> for a while now with no problems across a wide variety of hardware.

Actually, we need to prevent runtime pm if xgmi is active.  One more
thing to check.

Alex


>
> Alex
>
> >
> > See inline ...
> >
> >
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 12 +++---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h |  8 ++--
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 +-
> > >   drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 29 +++++++++------
> > >   drivers/gpu/drm/amd/amdkfd/kfd_priv.h      |  1 +
> > >   drivers/gpu/drm/amd/amdkfd/kfd_process.c   | 43 ++++++++++++++++++++--
> > >   6 files changed, 70 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > index 8609287620ea..314c4a2a0354 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> > > @@ -178,18 +178,18 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
> > >               kgd2kfd_interrupt(adev->kfd.dev, ih_ring_entry);
> > >   }
> > >
> > > -void amdgpu_amdkfd_suspend(struct amdgpu_device *adev)
> > > +void amdgpu_amdkfd_suspend(struct amdgpu_device *adev, bool run_pm)
> > >   {
> > >       if (adev->kfd.dev)
> > > -             kgd2kfd_suspend(adev->kfd.dev);
> > > +             kgd2kfd_suspend(adev->kfd.dev, run_pm);
> > >   }
> > >
> > > -int amdgpu_amdkfd_resume(struct amdgpu_device *adev)
> > > +int amdgpu_amdkfd_resume(struct amdgpu_device *adev, bool run_pm)
> > >   {
> > >       int r = 0;
> > >
> > >       if (adev->kfd.dev)
> > > -             r = kgd2kfd_resume(adev->kfd.dev);
> > > +             r = kgd2kfd_resume(adev->kfd.dev, run_pm);
> > >
> > >       return r;
> > >   }
> > > @@ -713,11 +713,11 @@ void kgd2kfd_exit(void)
> > >   {
> > >   }
> > >
> > > -void kgd2kfd_suspend(struct kfd_dev *kfd)
> > > +void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
> > >   {
> > >   }
> > >
> > > -int kgd2kfd_resume(struct kfd_dev *kfd)
> > > +int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
> > >   {
> > >       return 0;
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> > > index 47b0f2957d1f..9e8db702d878 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> > > @@ -122,8 +122,8 @@ struct amdkfd_process_info {
> > >   int amdgpu_amdkfd_init(void);
> > >   void amdgpu_amdkfd_fini(void);
> > >
> > > -void amdgpu_amdkfd_suspend(struct amdgpu_device *adev);
> > > -int amdgpu_amdkfd_resume(struct amdgpu_device *adev);
> > > +void amdgpu_amdkfd_suspend(struct amdgpu_device *adev, bool run_pm);
> > > +int amdgpu_amdkfd_resume(struct amdgpu_device *adev, bool run_pm);
> > >   void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
> > >                       const void *ih_ring_entry);
> > >   void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
> > > @@ -249,8 +249,8 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
> > >                        struct drm_device *ddev,
> > >                        const struct kgd2kfd_shared_resources *gpu_resources);
> > >   void kgd2kfd_device_exit(struct kfd_dev *kfd);
> > > -void kgd2kfd_suspend(struct kfd_dev *kfd);
> > > -int kgd2kfd_resume(struct kfd_dev *kfd);
> > > +void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm);
> > > +int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm);
> > >   int kgd2kfd_pre_reset(struct kfd_dev *kfd);
> > >   int kgd2kfd_post_reset(struct kfd_dev *kfd);
> > >   void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > index 5030a09babb8..43843e6c4bcd 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > @@ -3311,7 +3311,7 @@ int amdgpu_device_suspend(struct drm_device *dev, bool fbcon)
> > >               }
> > >       }
> > >
> > > -     amdgpu_amdkfd_suspend(adev);
> > > +     amdgpu_amdkfd_suspend(adev, !fbcon);
> > >
> > >       amdgpu_ras_suspend(adev);
> > >
> > > @@ -3395,7 +3395,7 @@ int amdgpu_device_resume(struct drm_device *dev, bool fbcon)
> > >                       }
> > >               }
> > >       }
> > > -     r = amdgpu_amdkfd_resume(adev);
> > > +     r = amdgpu_amdkfd_resume(adev, !fbcon);
> > >       if (r)
> > >               return r;
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> > > index 798ad1c8f799..42ee9ea5c45a 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
> > > @@ -732,7 +732,7 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
> > >   void kgd2kfd_device_exit(struct kfd_dev *kfd)
> > >   {
> > >       if (kfd->init_complete) {
> > > -             kgd2kfd_suspend(kfd);
> > > +             kgd2kfd_suspend(kfd, false);
> > >               device_queue_manager_uninit(kfd->dqm);
> > >               kfd_interrupt_exit(kfd);
> > >               kfd_topology_remove_device(kfd);
> > > @@ -753,7 +753,7 @@ int kgd2kfd_pre_reset(struct kfd_dev *kfd)
> > >
> > >       kfd->dqm->ops.pre_reset(kfd->dqm);
> > >
> > > -     kgd2kfd_suspend(kfd);
> > > +     kgd2kfd_suspend(kfd, false);
> > >
> > >       kfd_signal_reset_event(kfd);
> > >       return 0;
> > > @@ -787,21 +787,23 @@ bool kfd_is_locked(void)
> > >       return  (atomic_read(&kfd_locked) > 0);
> > >   }
> > >
> > > -void kgd2kfd_suspend(struct kfd_dev *kfd)
> > > +void kgd2kfd_suspend(struct kfd_dev *kfd, bool run_pm)
> > >   {
> > >       if (!kfd->init_complete)
> > >               return;
> > >
> > > -     /* For first KFD device suspend all the KFD processes */
> > > -     if (atomic_inc_return(&kfd_locked) == 1)
> > > -             kfd_suspend_all_processes();
> > > +     /* for runtime suspend, skip locking kfd */
> > > +     if (!run_pm) {
> > > +             /* For first KFD device suspend all the KFD processes */
> > > +             if (atomic_inc_return(&kfd_locked) == 1)
> > > +                     kfd_suspend_all_processes();
> > > +     }
> > >
> > >       kfd->dqm->ops.stop(kfd->dqm);
> > > -
> > >       kfd_iommu_suspend(kfd);
> > >   }
> > >
> > > -int kgd2kfd_resume(struct kfd_dev *kfd)
> > > +int kgd2kfd_resume(struct kfd_dev *kfd, bool run_pm)
> > >   {
> > >       int ret, count;
> > >
> > > @@ -812,10 +814,13 @@ int kgd2kfd_resume(struct kfd_dev *kfd)
> > >       if (ret)
> > >               return ret;
> > >
> > > -     count = atomic_dec_return(&kfd_locked);
> > > -     WARN_ONCE(count < 0, "KFD suspend / resume ref. error");
> > > -     if (count == 0)
> > > -             ret = kfd_resume_all_processes();
> > > +     /* for runtime resume, skip unlocking kfd */
> > > +     if (!run_pm) {
> > > +             count = atomic_dec_return(&kfd_locked);
> > > +             WARN_ONCE(count < 0, "KFD suspend / resume ref. error");
> > > +             if (count == 0)
> > > +                     ret = kfd_resume_all_processes();
> > > +     }
> > >
> > >       return ret;
> > >   }
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > > index c0b0defc8f7a..20dd4747250d 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> > > @@ -647,6 +647,7 @@ struct kfd_process_device {
> > >        * function.
> > >        */
> > >       bool already_dequeued;
> > > +     bool runtime_inuse;
> > >
> > >       /* Is this process/pasid bound to this device? (amd_iommu_bind_pasid) */
> > >       enum kfd_pdd_bound bound;
> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > > index 25b90f70aecd..6907a5a2cbc8 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > > @@ -31,6 +31,7 @@
> > >   #include <linux/compat.h>
> > >   #include <linux/mman.h>
> > >   #include <linux/file.h>
> > > +#include <linux/pm_runtime.h>
> > >   #include "amdgpu_amdkfd.h"
> > >   #include "amdgpu.h"
> > >
> > > @@ -440,6 +441,16 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
> > >               kfree(pdd->qpd.doorbell_bitmap);
> > >               idr_destroy(&pdd->alloc_idr);
> > >
> > > +             /*
> > > +              * before destroying pdd, make sure to report availability
> > > +              * for auto suspend
> > > +              */
> > > +             if (pdd->runtime_inuse) {
> > > +                     pm_runtime_mark_last_busy(pdd->dev->ddev->dev);
> > > +                     pm_runtime_put_autosuspend(pdd->dev->ddev->dev);
> > > +                     pdd->runtime_inuse = false;
> > > +             }
> > > +
> > >               kfree(pdd);
> > >       }
> > >   }
> > > @@ -754,6 +765,7 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_dev *dev,
> > >       pdd->process = p;
> > >       pdd->bound = PDD_UNBOUND;
> > >       pdd->already_dequeued = false;
> > > +     pdd->runtime_inuse = false;
> > >       list_add(&pdd->per_device_list, &p->per_device_data);
> > >
> > >       /* Init idr used for memory handle translation */
> > > @@ -843,15 +855,40 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
> > >               return ERR_PTR(-ENOMEM);
> > >       }
> > >
> > > +     /*
> > > +      * signal runtime-pm system to auto resume and prevent
> > > +      * further runtime suspend once device pdd is created until
> > > +      * pdd is destroyed.
> > > +      */
> > > +     if (!pdd->runtime_inuse) {
> > > +             err = pm_runtime_get_sync(dev->ddev->dev);
> > > +             if (err < 0)
> > > +                     return ERR_PTR(err);
> > > +     }
> > > +
> > >       err = kfd_iommu_bind_process_to_device(pdd);
> > >       if (err)
> > > -             return ERR_PTR(err);
> > > +             goto out;
> > >
> > >       err = kfd_process_device_init_vm(pdd, NULL);
> > >       if (err)
> > > -             return ERR_PTR(err);
> > > +             goto out;
> > >
> > > -     return pdd;
> > > +     if (!err) {
> > > +             /*
> > > +              * make sure that runtime_usage counter is incremented
> > > +              * just once per pdd
> > > +              */
> > > +             if (!pdd->runtime_inuse)
> > > +                     pdd->runtime_inuse = true;
> >
> > The "if" is redundant here. You can just set pdd->runtime_inuse = true
> > unconditionally.
> >
> > Regards,
> >    Felix
> >
> > > +
> > > +             return pdd;
> > > +     }
> > > +out:
> > > +     /* balance runpm reference count and exit with error */
> > > +     pm_runtime_mark_last_busy(dev->ddev->dev);
> > > +     pm_runtime_put_autosuspend(dev->ddev->dev);
> > > +     return ERR_PTR(err);
> > >   }
> > >
> > >   struct kfd_process_device *kfd_get_first_process_device_data(
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
