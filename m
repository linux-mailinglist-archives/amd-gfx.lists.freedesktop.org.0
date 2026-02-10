Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFu6F5FLi2mWTwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 16:15:29 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB36911C61A
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 16:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB47010E38F;
	Tue, 10 Feb 2026 15:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KvGQdzJp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD21B10E38F
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 15:15:25 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1233bc11279so177583c88.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 07:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770736525; cv=none;
 d=google.com; s=arc-20240605;
 b=V73zprPszc0MoS9J+Om0Q8ntfz74AOL3ileR9BTvJ6UKZr1C0mQoZlXi6ziu696qBD
 UF3bKBdBMkYzKSYgCrEPi+JkpwVZNZShQMuplk6bTVzkOOF4wxmWfuBRasDFeBa3YFoV
 Tmo9H92EVqBxMTPNLqFt6snkj2CK2q60X93YOqDh4ka2UvsSiNQM2cvRMWSp3rPwksTQ
 CGHyA9AE+jxG3OVxX9CIFGRElFhby0gBZzrTLc+DojrojIDahTnJkGkx5JiHU0HkjD+U
 vjVp/qJcgBjKkWC+cOm47xwYO9B9Zoyu4qPrRmZnBO6HGG/DuIjOEIXu6to3yDTGRgWp
 2i4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WvvkE1y0r1ceFVnccPGppQ+59hL4WcNIjd8KOey2yGU=;
 fh=5mEWqUSS6g37coqvH57xNufl9XjaQWsQpNg3FfcurTQ=;
 b=SGMapo5BFVikopCFxuCEQUWqzn/TYMvTyzuI1Z7lQjivSyElhzMwlev6pTuknafGcu
 +6MSsvI+NCBDaGMHBujdL9OGGsVmLkKjxnGv1FRZjSmtyNnexNfCjc2/giONIfQ7Jtl/
 c8Ka2B0V/27Zk/LaVTe9JDtWyqkN0aOeUO7MbIYkrfDQOzCZaJnufVqVTA82fvetscTI
 uSIsShJrjkleWioUkAgE/gIyHlk2XYBeB+NKZc7rd+XW6sIHeohsQ8PYw1lbGQqkLe8V
 E80I3qzBnbB7xaA3JE5L298rmZ6haRc0ZxeUhyuFbgMcrPkSxCWj16siqi0W1B9D0um7
 xGEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770736525; x=1771341325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvvkE1y0r1ceFVnccPGppQ+59hL4WcNIjd8KOey2yGU=;
 b=KvGQdzJpyM48bs99K+WeoVWfZq96TOMUP8DBJWfhNFqyILXl1sMkfSlFhFxv6n58bt
 TYVwdfE6NoBSwCL7ak0UVeztcEkkj5vLX90phEVn8nxwAJplzva/XlCwf5GwstTroSam
 48OuleFc94pNR9kn0vVZwWv7WVVZmJptlvtK0eTgqOxipfkUCbz5q+jXJ6kpT5MlRYZq
 PWvM2+YGuwF48K51Rc2TzNy0AjOB5jY6xurF7ml2seqBu0FoGDcZqX6o97u7COgW7GXZ
 6b/4+feGxA7w8yCJfHsLhbeUuylT5eTs6fk9gfHGNJSFje3l4Bbs3RbBtSkd/WU4ndIF
 rhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770736525; x=1771341325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WvvkE1y0r1ceFVnccPGppQ+59hL4WcNIjd8KOey2yGU=;
 b=tbgFnyeBh37pMEiLrcWiI3nL4mGeXnH+3RD1tKnJSsKvp8rZwPyk5ThKzLqlUxGOpy
 3cU0UqvYEWlHEcJ7qU3FOXTU/K88Pqk3YQOPgsD33yml5BZak7mLQrG7jzbNh84cjDew
 UWVq+1O9yHx81d+Xtk1ut6alGxNGrib1CqE9BwCaItEXm9193/KM0aY+7IJ4ZYsAqaMl
 0RLv4HO1OUKIf1voYLI7rl5soz/HYc8dBeUE0bRPPl7syrYLjH90Y2rp6vAHxKZgrPcW
 GbBTjaw+6sRxil2hpMLJ1iw+nCx16tyPDzeKOPGYRdsOTka29NR7dF53q/oQVIRZSVhP
 mlXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjw0hr4tgjWrYGvHXhdx45GUtInWbFA/NugIezrCCidc7m19Qfh1yBcLpJmbcw9Q1HQ8TQ8rwZ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp5XjJGQM9yUPLGM/33N3xS7i3neKb7yONr10TfaK57/AYIECb
 83IArC/vJnLA3aV17/FZZ5atHgWaVHbAm4FS0yNP6CTc0CCrtWRKQJRJBpYALXFOKsJqdpaQw+K
 kqnvxObCcfEFsx35tPWGUkLO3rW7IaIg=
X-Gm-Gg: AZuq6aKzaF8l6aPJT/UefFtfs/rtA6WuD2GQpgSZ6PPUeDYMmK1lw3gdzWzLlxBbqdH
 aYboXyq22qOGCmZKOzo1nkSFXYjHYWMm/p8jxW/lyZR7bh1fYP0BjpM5LZoULHheX28bfeaIJ2a
 Q3poB6z+EpMabM0tRx69285G3VWEfKyXYBQp4Mt17dco8ht7m2BoHRAS3LPwY4yXbL3FVooTgll
 p7BCwvfeM5+IRm1ZFdnhH0Gaj+NCuha4gocVhn/abMeSIlH2cUTI4594xUPWVZZ58xLmaln/mYv
 rb5x3Rwl
X-Received: by 2002:a05:7022:699c:b0:119:e56b:46b6 with SMTP id
 a92af1059eb24-1272489a391mr456988c88.0.1770736524754; Tue, 10 Feb 2026
 07:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20260210145506.1539775-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260210145506.1539775-1-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 Feb 2026 10:15:11 -0500
X-Gm-Features: AZwV_Qj8LvpGC_8fJpSUmnmwBJWnhWed7BNOl5v87KrkBDJpN7fP_SLPgtMP9LM
Message-ID: <CADnq5_N5t77+AzqjX50K1pVbraK9zOMz8rOVqqOCth8i_az8GQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/amdgpu: Make amdgpu_fence_emit() non-failing
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AB36911C61A
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 10:02=E2=80=AFAM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> dma_fence_wait(old, false) is not interruptible and cannot return an
> error. Drop the unreachable error handling in amdgpu_fence_emit().
>
> Since the function can no longer fail, convert amdgpu_fence_emit() to
> return void and remove return value handling from all callers.
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 12 ++++--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c    |  9 +--------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    |  7 ++-----
>  4 files changed, 9 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
> index 1054d66c54fa..4d2052347aa1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -107,16 +107,14 @@ static void amdgpu_fence_save_fence_wptr_end(struct=
 amdgpu_fence *af)
>   * @flags: flags to pass into the subordinate .emit_fence() call
>   *
>   * Emits a fence command on the requested ring (all asics).
> - * Returns 0 on success, -ENOMEM on failure.
>   */
> -int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
> -                     unsigned int flags)
> +void amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af=
,
> +                      unsigned int flags)
>  {
>         struct amdgpu_device *adev =3D ring->adev;
>         struct dma_fence *fence;
>         struct dma_fence __rcu **ptr;
>         uint32_t seq;
> -       int r;
>
>         fence =3D &af->base;
>         af->ring =3D ring;
> @@ -141,10 +139,8 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, stru=
ct amdgpu_fence *af,
>                 rcu_read_unlock();
>
>                 if (old) {
> -                       r =3D dma_fence_wait(old, false);

Might want a comment here as to why it's safe to ignore the return value.

> +                       dma_fence_wait(old, false);
>                         dma_fence_put(old);
> -                       if (r)
> -                               return r;
>                 }
>         }
>
> @@ -155,7 +151,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struc=
t amdgpu_fence *af,
>          */
>         rcu_assign_pointer(*ptr, dma_fence_get(fence));
>
> -       return 0;
> +       return;

This can be dropped since the function is void.  Other than that,
looks good to me.  With my comments fixed, the series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ib.c
> index bfa64cd7a62d..07b43a498592 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -297,14 +297,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, uns=
igned int num_ibs,
>                 amdgpu_ring_init_cond_exec(ring, ring->cond_exe_gpu_addr)=
;
>         }
>
> -       r =3D amdgpu_fence_emit(ring, af, fence_flags);
> -       if (r) {
> -               dev_err(adev->dev, "failed to emit fence (%d)\n", r);
> -               if (job && job->vmid)
> -                       amdgpu_vmid_reset(adev, ring->vm_hub, job->vmid);
> -               amdgpu_ring_undo(ring);
> -               goto free_fence;
> -       }
> +       amdgpu_fence_emit(ring, af, fence_flags);
>         *f =3D &af->base;
>         /* get a ref for the job */
>         if (job)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_ring.h
> index 1abd8fdb5cef..5a82db0888f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -172,8 +172,8 @@ void amdgpu_fence_driver_hw_init(struct amdgpu_device=
 *adev);
>  void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev);
>  int amdgpu_fence_driver_sw_init(struct amdgpu_device *adev);
>  void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev);
> -int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
> -                     unsigned int flags);
> +void amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af=
,
> +                      unsigned int flags);
>  int amdgpu_fence_emit_polling(struct amdgpu_ring *ring, uint32_t *s,
>                               uint32_t timeout);
>  bool amdgpu_fence_process(struct amdgpu_ring *ring);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index 807f8bcc7de5..2be65bd6b39c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -783,8 +783,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct =
amdgpu_job *job,
>         bool cleaner_shader_needed =3D false;
>         bool pasid_mapping_needed =3D false;
>         struct dma_fence *fence =3D NULL;
> -       unsigned int patch;
> -       int r;
> +       unsigned int patch =3D 0;
>
>         if (amdgpu_vmid_had_gpu_reset(adev, id)) {
>                 gds_switch_needed =3D true;
> @@ -845,9 +844,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct =
amdgpu_job *job,
>         }
>
>         if (vm_flush_needed || pasid_mapping_needed || cleaner_shader_nee=
ded) {
> -               r =3D amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
> -               if (r)
> -                       return r;
> +               amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
>                 fence =3D &job->hw_vm_fence->base;
>                 /* get a ref for the job */
>                 dma_fence_get(fence);
> --
> 2.34.1
>
