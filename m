Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808FAA07D63
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jan 2025 17:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230CE10E010;
	Thu,  9 Jan 2025 16:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UKrv6hq6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322C10E010
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jan 2025 16:25:03 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ee534d6800so225599a91.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jan 2025 08:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736439843; x=1737044643; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNx2XiQizkGQgHlnp+9N6gqVRTh8DPooKNftBJ8oNFQ=;
 b=UKrv6hq6yQ1GnPcuTf2p+NYsO+syEvxp0OwUr/hk5RwOnp+8GzEtFUg0zz2HqsTvew
 u9mLhvsSeom8OrYI+B7fcuIZvdTEgZtGJ3EtQUvX2HCobgdBGgBBEyWNpNRlUlBveuzw
 A3gH71l+q0jjiJs2086wVyMHeqA+JRozmcv/xNURPjL79p0O+KR+hfqcLhqPgGFnj0CY
 b0PGfny0IjVL+ztQMH4vQu8LYXEMAAlNe2TWhfn1EOBgi1/B29pgfqdP9Zaxf303uzym
 aS4+J2UHsgnfYGdeP2cWtLf8MeWWYZC/Gfy49S68eBXhKIAzuB7CWyRvQGtarksAVsIG
 UPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736439843; x=1737044643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNx2XiQizkGQgHlnp+9N6gqVRTh8DPooKNftBJ8oNFQ=;
 b=g/EuDHII7bjWqIFDc82loGdzWpeTIZbXZkvkWRPWDv5zVrK1kjTjOcchrG9j5FxOzY
 z9FO3VvJXnoQyYDnax+ffuP/Y4yb8l/tFIEnskFF3qsqmnZBMySGLpYVXJgjqhUzOJ1o
 ykObkyCXpWM/O5GC6rZqDJpyyANUxu4LOGhk7bQlzcpUX2AX+rhJDuDhCknrr1BesfN1
 2F9HZfuDl8AlDyWnzxtScyJqzTxxdxe2FxWEi+H262VzBAlhIs6RHreL9xwsUWaKyFXJ
 vGUPoLhJqYOxzmT337H/xImG3dXVmE4EdoOZ38n2uyQov3g6X87JL8sWDrRiI9UFhRS+
 fJJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhaAvzapE8UaWEaln6lddOeuaNfCh8hRVXQQ/8tr5JOzMpjrw+U/jgQxMawEzqwX+Y0a4tGIzF@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzru1LK5Vz5x/AhYBOq4j1Wk4vVumHKmrIif03j+Kbt+ab/MNgj
 hGNScIaqiGxVUDbdsuUxsw/lIIi0KD2tOe7fAUkJUXDU7PkgdilveokQwOS2F6e+UxczwwH1hnI
 LgR9QnhfIAkIDFWq0WsikCeFjuGTMxQ==
X-Gm-Gg: ASbGncuzGHrCiljEL8/hGGIKlwb5GFcnX8dWgHq59cOgHEMrUmrJ/ONncApwmb66zsW
 kthX/G3+boMNeCIMnHhObEAYRJw5TewOTL1bGzA==
X-Google-Smtp-Source: AGHT+IH+3CvpQcoUMjIcIA6ktx29sIOEZ4Ivm9seZ26+er0kYEAQmHDyLT0aY1k/iXBRjWjEFsLcmrolWhjlnT6YoJA=
X-Received: by 2002:a17:90a:dfcb:b0:2f4:447b:f095 with SMTP id
 98e67ed59e1d1-2f5490a9faamr4247041a91.4.1736439843378; Thu, 09 Jan 2025
 08:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20250109160938.2855092-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20250109160938.2855092-1-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jan 2025 11:23:51 -0500
X-Gm-Features: AbW1kvaxJ-D-DPF0Pu0Q_7DrHqOIR_vETMHbNHtEXnSY8HkJLgQrxXpRo_JsrSE
Message-ID: <CADnq5_PJV5g3Pf5JkYztck+tcmHMMzqcnaG9t_rONX8M5E6Ffw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Fix Circular Locking Dependency in AMDGPU
 GFX Isolation
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 9, 2025 at 11:17=E2=80=AFAM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> This commit addresses a circular locking dependency issue within the GFX
> isolation mechanism. The problem was identified by a warning indicating
> a potential deadlock due to inconsistent lock acquisition order.
>
> - The `amdgpu_gfx_enforce_isolation_ring_begin_use` and
>   `amdgpu_gfx_enforce_isolation_ring_end_use` functions previously
>   acquired `enforce_isolation_mutex` and called `amdgpu_gfx_kfd_sch_ctrl`=
,
>   leading to potential deadlocks. ie., If `amdgpu_gfx_kfd_sch_ctrl` is
>   called while `enforce_isolation_mutex` is held, and
>   `amdgpu_gfx_enforce_isolation_handler` is called while `kfd_sch_mutex` =
is
>   held, it can create a circular dependency.
>
> By ensuring consistent lock usage, this fix resolves the issue:
>
> [  606.297333] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  606.297343] WARNING: possible circular locking dependency detected
> [  606.297353] 6.10.0-amd-mlkd-610-311224-lof #19 Tainted: G           OE
> [  606.297365] ------------------------------------------------------
> [  606.297375] kworker/u96:3/3825 is trying to acquire lock:
> [  606.297385] ffff9aa64e431cb8 ((work_completion)(&(&adev->gfx.enforce_i=
solation[i].work)->work)){+.+.}-{0:0}, at: __flush_work+0x232/0x610
> [  606.297413]
>                but task is already holding lock:
> [  606.297423] ffff9aa64e432338 (&adev->gfx.kfd_sch_mutex){+.+.}-{3:3}, a=
t: amdgpu_gfx_kfd_sch_ctrl+0x51/0x4d0 [amdgpu]
> [  606.297725]
>                which lock already depends on the new lock.
>
> [  606.297738]
>                the existing dependency chain (in reverse order) is:
> [  606.297749]
>                -> #2 (&adev->gfx.kfd_sch_mutex){+.+.}-{3:3}:
> [  606.297765]        __mutex_lock+0x85/0x930
> [  606.297776]        mutex_lock_nested+0x1b/0x30
> [  606.297786]        amdgpu_gfx_kfd_sch_ctrl+0x51/0x4d0 [amdgpu]
> [  606.298007]        amdgpu_gfx_enforce_isolation_ring_begin_use+0x2a4/0=
x5d0 [amdgpu]
> [  606.298225]        amdgpu_ring_alloc+0x48/0x70 [amdgpu]
> [  606.298412]        amdgpu_ib_schedule+0x176/0x8a0 [amdgpu]
> [  606.298603]        amdgpu_job_run+0xac/0x1e0 [amdgpu]
> [  606.298866]        drm_sched_run_job_work+0x24f/0x430 [gpu_sched]
> [  606.298880]        process_one_work+0x21e/0x680
> [  606.298890]        worker_thread+0x190/0x350
> [  606.298899]        kthread+0xe7/0x120
> [  606.298908]        ret_from_fork+0x3c/0x60
> [  606.298919]        ret_from_fork_asm+0x1a/0x30
> [  606.298929]
>                -> #1 (&adev->enforce_isolation_mutex){+.+.}-{3:3}:
> [  606.298947]        __mutex_lock+0x85/0x930
> [  606.298956]        mutex_lock_nested+0x1b/0x30
> [  606.298966]        amdgpu_gfx_enforce_isolation_handler+0x87/0x370 [am=
dgpu]
> [  606.299190]        process_one_work+0x21e/0x680
> [  606.299199]        worker_thread+0x190/0x350
> [  606.299208]        kthread+0xe7/0x120
> [  606.299217]        ret_from_fork+0x3c/0x60
> [  606.299227]        ret_from_fork_asm+0x1a/0x30
> [  606.299236]
>                -> #0 ((work_completion)(&(&adev->gfx.enforce_isolation[i]=
.work)->work)){+.+.}-{0:0}:
> [  606.299257]        __lock_acquire+0x16f9/0x2810
> [  606.299267]        lock_acquire+0xd1/0x300
> [  606.299276]        __flush_work+0x250/0x610
> [  606.299286]        cancel_delayed_work_sync+0x71/0x80
> [  606.299296]        amdgpu_gfx_kfd_sch_ctrl+0x287/0x4d0 [amdgpu]
> [  606.299509]        amdgpu_gfx_enforce_isolation_ring_begin_use+0x2a4/0=
x5d0 [amdgpu]
> [  606.299723]        amdgpu_ring_alloc+0x48/0x70 [amdgpu]
> [  606.299909]        amdgpu_ib_schedule+0x176/0x8a0 [amdgpu]
> [  606.300101]        amdgpu_job_run+0xac/0x1e0 [amdgpu]
> [  606.300355]        drm_sched_run_job_work+0x24f/0x430 [gpu_sched]
> [  606.300369]        process_one_work+0x21e/0x680
> [  606.300378]        worker_thread+0x190/0x350
> [  606.300387]        kthread+0xe7/0x120
> [  606.300396]        ret_from_fork+0x3c/0x60
> [  606.300406]        ret_from_fork_asm+0x1a/0x30
> [  606.300416]
>                other info that might help us debug this:
>
> [  606.300428] Chain exists of:
>                  (work_completion)(&(&adev->gfx.enforce_isolation[i].work=
)->work) --> &adev->enforce_isolation_mutex --> &adev->gfx.kfd_sch_mutex
>
> [  606.300458]  Possible unsafe locking scenario:
>
> [  606.300468]        CPU0                    CPU1
> [  606.300476]        ----                    ----
> [  606.300484]   lock(&adev->gfx.kfd_sch_mutex);
> [  606.300494]                                lock(&adev->enforce_isolati=
on_mutex);
> [  606.300508]                                lock(&adev->gfx.kfd_sch_mut=
ex);
> [  606.300521]   lock((work_completion)(&(&adev->gfx.enforce_isolation[i]=
.work)->work));
> [  606.300536]
>                 *** DEADLOCK ***
>
> [  606.300546] 5 locks held by kworker/u96:3/3825:
> [  606.300555]  #0: ffff9aa5aa1f5d58 ((wq_completion)comp_1.1.0){+.+.}-{0=
:0}, at: process_one_work+0x3f5/0x680
> [  606.300577]  #1: ffffaa53c3c97e40 ((work_completion)(&sched->work_run_=
job)){+.+.}-{0:0}, at: process_one_work+0x1d6/0x680
> [  606.300600]  #2: ffff9aa64e463c98 (&adev->enforce_isolation_mutex){+.+=
.}-{3:3}, at: amdgpu_gfx_enforce_isolation_ring_begin_use+0x1c3/0x5d0 [amdg=
pu]
> [  606.300837]  #3: ffff9aa64e432338 (&adev->gfx.kfd_sch_mutex){+.+.}-{3:=
3}, at: amdgpu_gfx_kfd_sch_ctrl+0x51/0x4d0 [amdgpu]
> [  606.301062]  #4: ffffffff8c1a5660 (rcu_read_lock){....}-{1:2}, at: __f=
lush_work+0x70/0x610
> [  606.301083]
>                stack backtrace:
> [  606.301092] CPU: 14 PID: 3825 Comm: kworker/u96:3 Tainted: G          =
 OE      6.10.0-amd-mlkd-610-311224-lof #19
> [  606.301109] Hardware name: Gigabyte Technology Co., Ltd. X570S GAMING =
X/X570S GAMING X, BIOS F7 03/22/2024
> [  606.301124] Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> [  606.301140] Call Trace:
> [  606.301146]  <TASK>
> [  606.301154]  dump_stack_lvl+0x9b/0xf0
> [  606.301166]  dump_stack+0x10/0x20
> [  606.301175]  print_circular_bug+0x26c/0x340
> [  606.301187]  check_noncircular+0x157/0x170
> [  606.301197]  ? register_lock_class+0x48/0x490
> [  606.301213]  __lock_acquire+0x16f9/0x2810
> [  606.301230]  lock_acquire+0xd1/0x300
> [  606.301239]  ? __flush_work+0x232/0x610
> [  606.301250]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  606.301261]  ? mark_held_locks+0x54/0x90
> [  606.301274]  ? __flush_work+0x232/0x610
> [  606.301284]  __flush_work+0x250/0x610
> [  606.301293]  ? __flush_work+0x232/0x610
> [  606.301305]  ? __pfx_wq_barrier_func+0x10/0x10
> [  606.301318]  ? mark_held_locks+0x54/0x90
> [  606.301331]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  606.301345]  cancel_delayed_work_sync+0x71/0x80
> [  606.301356]  amdgpu_gfx_kfd_sch_ctrl+0x287/0x4d0 [amdgpu]
> [  606.301661]  amdgpu_gfx_enforce_isolation_ring_begin_use+0x2a4/0x5d0 [=
amdgpu]
> [  606.302050]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  606.302069]  amdgpu_ring_alloc+0x48/0x70 [amdgpu]
> [  606.302452]  amdgpu_ib_schedule+0x176/0x8a0 [amdgpu]
> [  606.302862]  ? drm_sched_entity_error+0x82/0x190 [gpu_sched]
> [  606.302890]  amdgpu_job_run+0xac/0x1e0 [amdgpu]
> [  606.303366]  drm_sched_run_job_work+0x24f/0x430 [gpu_sched]
> [  606.303388]  process_one_work+0x21e/0x680
> [  606.303409]  worker_thread+0x190/0x350
> [  606.303424]  ? __pfx_worker_thread+0x10/0x10
> [  606.303437]  kthread+0xe7/0x120
> [  606.303449]  ? __pfx_kthread+0x10/0x10
> [  606.303463]  ret_from_fork+0x3c/0x60
> [  606.303476]  ? __pfx_kthread+0x10/0x10
> [  606.303489]  ret_from_fork_asm+0x1a/0x30
> [  606.303512]  </TASK>
>
> Fixes: afefd6f24502 ("drm/amdgpu: Implement Enforce Isolation Handler for=
 KGD/KFD serialization")
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> v2: Refactor lock handling to resolve circular dependency  (Alex)
>
> - Introduced a `sched_work` flag to defer the call to `amdgpu_gfx_kfd_sch=
_ctrl` until after releasing `enforce_isolation_mutex`.
> - This change ensures that `amdgpu_gfx_kfd_sch_ctrl` is called outside th=
e critical section, preventing the circular dependency and deadlock.
> - The `sched_work` flag is set within the mutex-protected section if cond=
itions are met, and the actual function call is made afterward.
> - This approach ensures consistent lock acquisition order.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 6d5d81f0dc4e..784b03abb3a4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -2054,6 +2054,7 @@ void amdgpu_gfx_enforce_isolation_ring_begin_use(st=
ruct amdgpu_ring *ring)
>  {
>         struct amdgpu_device *adev =3D ring->adev;
>         u32 idx;
> +       bool sched_work =3D false;
>
>         if (!adev->gfx.enable_cleaner_shader)
>                 return;
> @@ -2072,9 +2073,12 @@ void amdgpu_gfx_enforce_isolation_ring_begin_use(s=
truct amdgpu_ring *ring)
>         mutex_lock(&adev->enforce_isolation_mutex);
>         if (adev->enforce_isolation[idx]) {
>                 if (adev->kfd.init_complete)
> -                       amdgpu_gfx_kfd_sch_ctrl(adev, idx, false);
> +                       sched_work =3D true;
>         }
>         mutex_unlock(&adev->enforce_isolation_mutex);
> +
> +       if (sched_work)
> +               amdgpu_gfx_kfd_sch_ctrl(adev, idx, false);
>  }
>
>  /**
> @@ -2090,6 +2094,7 @@ void amdgpu_gfx_enforce_isolation_ring_end_use(stru=
ct amdgpu_ring *ring)
>  {
>         struct amdgpu_device *adev =3D ring->adev;
>         u32 idx;
> +       bool sched_work =3D false;
>
>         if (!adev->gfx.enable_cleaner_shader)
>                 return;
> @@ -2105,9 +2110,12 @@ void amdgpu_gfx_enforce_isolation_ring_end_use(str=
uct amdgpu_ring *ring)
>         mutex_lock(&adev->enforce_isolation_mutex);
>         if (adev->enforce_isolation[idx]) {
>                 if (adev->kfd.init_complete)
> -                       amdgpu_gfx_kfd_sch_ctrl(adev, idx, true);
> +                       sched_work =3D true;
>         }
>         mutex_unlock(&adev->enforce_isolation_mutex);
> +
> +       if (sched_work)
> +               amdgpu_gfx_kfd_sch_ctrl(adev, idx, true);
>  }
>
>  /*
> --
> 2.34.1
>
