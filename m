Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4D4A500F
	for <lists+amd-gfx@lfdr.de>; Mon, 31 Jan 2022 21:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741B910E44C;
	Mon, 31 Jan 2022 20:23:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B2D10E44C
 for <amd-gfx@lists.freedesktop.org>; Mon, 31 Jan 2022 20:23:32 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id q186so29003212oih.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 31 Jan 2022 12:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A1/JlQGgQ6O/xHEsG+k/efVuS95U27hibCm7CmHA1M8=;
 b=ECqAYFFF9ULIgV6llD4zXxqc1HEKxWfkSWBTGD4ewSg6vhyCcQu0V7SxKIbzmOdjSh
 ClsUUTG9BFRoPNDdOXVTDNI9V3+uScsU4tCfE3bVJojxTI0bbD0N6nl/LajoDkzQF/1E
 1P8UVoZwZ8vNCFFaCemlfMQD379p3E4BQ74yajuyWiwXyUZIqfYgExmaQUHjYeauT6Sn
 QGGjQGgtjzcbx2jJtBuRAj3pJgMC4oFkGXZ2HuSa1NX+2MPowlVb0DIOem03I2RJvz3J
 jbipPs0XE+Ch20tUkVSZy1lAXxTVZve6hrrfTyMkDEKWo+WkbEUYWz5rOkavWoZTvs6O
 b6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A1/JlQGgQ6O/xHEsG+k/efVuS95U27hibCm7CmHA1M8=;
 b=Wam/P3XcE7qHSruxj4/zzxrB2V9dxJN8t0HknKHNbQzgxDjSYJtkPMtaNld+6zvtPv
 cV4HRdZXv2EnZzhOAhguVBqNx4Bhzkv4TUX+JANJ7t/kK4wDtgs7T+dJhdDanUw6aCSB
 Q7BqzWxVBcrffKF2vXAxyYFdHLDedGGPKyI8RORs1dEseekvVe4J5xIEe0agbpEm8txN
 VLf2NBBOBsKp0KPpVsfrexza7cbq+TTEcWqjmkOGnBb0w4t77sP+G9sEiRL7hXETjDQ9
 bdI7RDsk/VoT8zjzrejJBk2fyX19EPYVAg5YBXl4lyfVOurQ7pgXXWpGCshtESsT5OoL
 9HGA==
X-Gm-Message-State: AOAM533fCW50x2hpJaQtCKZCZNQCq3Fh0+Bwk9oeWbWBmZWVrZ2VqWZp
 hr9NkFs+LNzpNZ9WyjG4rMRHMlrxZpvN27NuSzTqoYwJ
X-Google-Smtp-Source: ABdhPJw3kkvw51t826x0AP8lQiU0VUoFnd9TEecLfwM+15B4Xc59Awpz+I3SZlhuO7mq+hSwJmNaPD+j1UhO64+944Q=
X-Received: by 2002:a05:6808:2011:: with SMTP id
 q17mr19432678oiw.199.1643660611605; 
 Mon, 31 Jan 2022 12:23:31 -0800 (PST)
MIME-Version: 1.0
References: <20220131153527.11051-1-surbhi.kakarya@amd.com>
In-Reply-To: <20220131153527.11051-1-surbhi.kakarya@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 31 Jan 2022 15:23:19 -0500
Message-ID: <CADnq5_Pv8mVuKE4--HhvcsF_ff7X_OMo_2nVPqRAY=NprOEu-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Handle the GPU recovery failure in SRIOV
 environment.
To: Surbhi Kakarya <surbhi.kakarya@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Bokun Zhang <Bokun.Zhang@amd.com>, "Zytaruk, Kelly" <Kelly.Zytaruk@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Chang,
 HaiJun" <HaiJun.Chang@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "monk.liu" <Monk.Liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:35 AM Surbhi Kakarya <surbhi.kakarya@amd.com> wrote:
>
> This patch handles the GPU recovery faliure in sriov environment by
> retrying the reset if the first reset fails. To determine the condition of retry, a
> new function amdgpu_is_retry_sriov_reset() is added which returns true if failure is due
> to ETIMEDOUT, EINVAL or EBUSY, otherwise return false.
>
> It also handles the return status in Post Asic Reset by updating the return code
> with asic_reset_res and eventually return the return code in amdgpu_job_timedout().
>
> Change-Id: I45b9743adb548606aef8774496527d29fb3de0af

Missing your s-o-b.  Also, does this help on bare metal as well?  If
so, we should make this generic and also set a retry limit.

Alex


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 34 ++++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++-
>  2 files changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 53af2623c58f..8a742b77eef8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5026,6 +5026,21 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
>         return 0;
>  }
>
> +/**
> + * amdgpu_is_retry_sriov_reset - check if we should retry sriov reset
> + *
> + * Check amdgpu_is_retry_sriov_reset and return status to see if we should retry reset.
> + */
> +static bool amdgpu_is_retry_sriov_reset(int r)
> +{
> +
> +        if(r == -EBUSY || r == -ETIMEDOUT || r == -EINVAL)
> +                return true;
> +        else
> +                return false;
> +
> +}
> +
>  static void amdgpu_device_recheck_guilty_jobs(
>         struct amdgpu_device *adev, struct list_head *device_list_handle,
>         struct amdgpu_reset_context *reset_context)
> @@ -5064,8 +5079,13 @@ static void amdgpu_device_recheck_guilty_jobs(
>                         if (amdgpu_sriov_vf(adev)) {
>                                 amdgpu_virt_fini_data_exchange(adev);
>                                 r = amdgpu_device_reset_sriov(adev, false);
> -                               if (r)
> +                               if (r) {
>                                         adev->asic_reset_res = r;
> +                                       if (amdgpu_is_retry_sriov_reset(r)) {
> +                                               adev->asic_reset_res = 0;
> +                                               goto retry;
> +                                       }
> +                               }
>                         } else {
>                                 clear_bit(AMDGPU_SKIP_HW_RESET,
>                                           &reset_context->flags);
> @@ -5299,8 +5319,13 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>         /* Host driver will handle XGMI hive reset for SRIOV */
>         if (amdgpu_sriov_vf(adev)) {
>                 r = amdgpu_device_reset_sriov(adev, job ? false : true);
> -               if (r)
> -                       adev->asic_reset_res = r;
> +                if (r) {
> +                        adev->asic_reset_res = r;
> +                        if (amdgpu_is_retry_sriov_reset(r)) {
> +                               adev->asic_reset_res = 0;
> +                               goto retry;
> +                        }
> +                }
>         } else {
>                 r = amdgpu_do_asic_reset(device_list_handle, &reset_context);
>                 if (r && r == -EAGAIN)
> @@ -5341,6 +5366,9 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>                         drm_helper_resume_force_mode(adev_to_drm(tmp_adev));
>                 }
>
> +               if (tmp_adev->asic_reset_res)
> +                       r = tmp_adev->asic_reset_res;
> +
>                 tmp_adev->asic_reset_res = 0;
>
>                 if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index e0730ea56a8c..1f0fb21ac15a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -37,6 +37,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>         struct amdgpu_task_info ti;
>         struct amdgpu_device *adev = ring->adev;
>         int idx;
> +       int r = 0;
>
>         if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>                 DRM_INFO("%s - device unplugged skipping recovery on scheduler:%s",
> @@ -63,7 +64,10 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>                   ti.process_name, ti.tgid, ti.task_name, ti.pid);
>
>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
> -               amdgpu_device_gpu_recover(ring->adev, job);
> +               r = amdgpu_device_gpu_recover(ring->adev, job);
> +               if (r)
> +                       DRM_ERROR("GPU Recovery Failed: %d\n",r);
> +
>         } else {
>                 drm_sched_suspend_timeout(&ring->sched);
>                 if (amdgpu_sriov_vf(adev))
> --
> 2.25.1
>
