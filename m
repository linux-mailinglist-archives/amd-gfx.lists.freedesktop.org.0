Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55773A3C467
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2025 17:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4E810E33B;
	Wed, 19 Feb 2025 16:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IGmLN1Md";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0810E33B
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2025 16:05:13 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fbfa7100b0so1644426a91.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2025 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739981113; x=1740585913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHVGlUUMZuwuFyVDzJSzfu4GU4VD6QLy9wQJTlEKzrA=;
 b=IGmLN1MddnatRiqpxL0oPPsrSN2+G8jO30tuOUe42533ykHiMQGUsz7t6Vw7KFuzYe
 4RUqQ9Mq7jntxaGAlztZ/fHd7P62GnxnnQsjSoSX7GPAt/chgHUkmvjeQPYQ0vgZw40O
 RAk6kl2cgGMqyHOim8D3wEOZ8uNHRiOn7Gh32EaGi5az66b0H3MQPOIrRRBwtbeJN1cS
 dXXsufKPiW5rqRHuJF1lnM26+uAsJMTguU332s19ZCxPqQnBAmhIJMZ0vBzil6nUIWjD
 4JRsfVhG40j/gkBcIcw6gvtwvWbj3xlEsyMbe+XM0icuHnfa917TRy4eCgXlXOh4BmmM
 JMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739981113; x=1740585913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QHVGlUUMZuwuFyVDzJSzfu4GU4VD6QLy9wQJTlEKzrA=;
 b=gwdM/6R4nix6EKxEGU/UJpJnJ1IMWPgiIybcFipmW4w05V47m0X2rdi/CTbDXJT0FZ
 db+EFDup3XZUQtDB/8aQVd3eVeK2xo+0OGThDL138vAUD/J+eE1T6cn+ht2NlQZkpbRZ
 mrxcPrycI7wYpkPJ3aUwmJzZtGsx13Cqxe1JRyKFFdwiFww57w8DX26nSiexV3L/ptoF
 8mXApXjpEx0Kk2H9dXPWlyHFVc2z0wldxMagzxlVXB5b6SgTH9IQ2ZpMUlzoggLBkaO4
 wVNXlNvts7lL/z3y2xXaV+gVORKU6Ud7axxcp1J4XfEHxXmRLvjwD8Yrkxps6FS89kCY
 o26Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCY8hfh/uptmamv/Ps4wpu0lBiXG4IQeK6lWnC0TlDy0AL9mKm6scIgnGeW96S6LXBcg/6iYnX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsjiXv2CEid7mwNFuYtwiM8A/+wNhFlwx7rPG+QaxMuu9KdVFf
 kG7XcDLaSlIcozyMSm5ESxHYC/cEcWe4sjcl1mGvgEVpZMZ/rfxK311cH5r9JcCeAT8Hz0s2V0A
 RCgfZ3EbNs+bNzx0fXnWOPG1dwOIkGw==
X-Gm-Gg: ASbGncugfHGcEREEwy4u8nSQIHGgPqiLaLH7NoU9KLz9ZeS05B999D/u88vq5yxoZVI
 wnJtV5p2cBwBHUKOyeL2z9ouI0kVYgAu53flAq7QPO8cyh4Il9j57U6iJwOiGinf/hZS53ZMt
X-Google-Smtp-Source: AGHT+IF1aTXKg/lQeCYLvqQCII1bo/T8lsSHXXbVloFzI/othmHAPYW0pXHweMugFPCvIJ6e3IDYDwvfKpc/mJdUons=
X-Received: by 2002:a17:90b:2fc3:b0:2ee:a558:b6bf with SMTP id
 98e67ed59e1d1-2fc4117c0cfmr11032899a91.8.1739981113007; Wed, 19 Feb 2025
 08:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20250219154005.121058-1-sunil.khatri@amd.com>
In-Reply-To: <20250219154005.121058-1-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2025 11:05:01 -0500
X-Gm-Features: AWEUYZnJSdhkvaW72J7sZ1K6_6OZB3wHDi1jYBUq1XTq55Ra04zfZKegjDgzzDQ
Message-ID: <CADnq5_NUkmbtq-pOGJ3JpYOz-81H2BA7DcJwCSkhC6WA_SvtXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: update the handle ptr in get_clockgating_state
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
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

On Wed, Feb 19, 2025 at 10:53=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com=
> wrote:
>
> Update the *handle to amdgpu_ip_block ptr for all
> functions pointers of get_clockgating_state.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Thanks,

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c    | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c       | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/ih_v6_1.c       | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/ih_v7_0.c       | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/nv.c            | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c   | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c     | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c     | 2 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c         | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/soc21.c         | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/soc24.c         | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/vce_v3_0.c      | 4 ++--
>  drivers/gpu/drm/amd/amdgpu/vi.c            | 4 ++--
>  drivers/gpu/drm/amd/include/amd_shared.h   | 2 +-
>  32 files changed, 61 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 2a5cae0a2334..6cd8ebce2d74 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2252,7 +2252,8 @@ void amdgpu_device_ip_get_clockgating_state(struct =
amdgpu_device *adev,
>                 if (!adev->ip_blocks[i].status.valid)
>                         continue;
>                 if (adev->ip_blocks[i].version->funcs->get_clockgating_st=
ate)
> -                       adev->ip_blocks[i].version->funcs->get_clockgatin=
g_state((void *)adev, flags);
> +                       adev->ip_blocks[i].version->funcs->get_clockgatin=
g_state(
> +                               &adev->ip_blocks[i], flags);
>         }
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index d70574a25326..f54617c6c071 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -8503,9 +8503,9 @@ static int gfx_v10_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v10_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v10_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         /* AMD_CG_SUPPORT_GFX_FGCG */
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v11_0.c
> index aabc5bacd154..2087d53b4990 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -5571,9 +5571,9 @@ static int gfx_v11_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v11_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v11_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         /* AMD_CG_SUPPORT_GFX_MGCG */
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v12_0.c
> index 638507422f9b..9ab6a850cefd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> @@ -4196,9 +4196,9 @@ static int gfx_v12_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v12_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v12_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         /* AMD_CG_SUPPORT_GFX_MGCG */
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v8_0.c
> index 6a025438f9d0..6add76ef75e8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> @@ -5452,9 +5452,9 @@ static int gfx_v8_0_set_powergating_state(struct am=
dgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v8_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v8_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gfx_v9_0.c
> index ccdfe7c37517..e144bce938d5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -5301,9 +5301,9 @@ static int gfx_v9_0_set_clockgating_state(struct am=
dgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v9_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v9_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v9_4_3.c
> index f5b1d2edf805..c88564de50cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
> @@ -2795,9 +2795,9 @@ static int gfx_v9_4_3_set_clockgating_state(struct =
amdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gfx_v9_4_3_get_clockgating_state(void *handle, u64 *flags)
> +static void gfx_v9_4_3_get_clockgating_state(struct amdgpu_ip_block *ip_=
block, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v10_0.c
> index 9bedca9a79c6..edf6cf42f141 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -1115,9 +1115,9 @@ static int gmc_v10_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>                 return athub_v2_0_set_clockgating(adev, state);
>  }
>
> -static void gmc_v10_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gmc_v10_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(10, 1, =
3) ||
>             amdgpu_ip_version(adev, GC_HWIP, 0) =3D=3D IP_VERSION(10, 1, =
4))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v11_0.c
> index e48b0439f6df..f86d0650a05e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> @@ -1012,9 +1012,9 @@ static int gmc_v11_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>         return athub_v3_0_set_clockgating(adev, state);
>  }
>
> -static void gmc_v11_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gmc_v11_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         adev->mmhub.funcs->get_clockgating(adev, flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd=
/amdgpu/gmc_v12_0.c
> index b749f1c3f6a9..c6d45d0fb9d1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -1009,9 +1009,9 @@ static int gmc_v12_0_set_clockgating_state(struct a=
mdgpu_ip_block *ip_block,
>         return athub_v4_1_0_set_clockgating(adev, state);
>  }
>
> -static void gmc_v12_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gmc_v12_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         adev->mmhub.funcs->get_clockgating(adev, flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v8_0.c
> index d06585207c33..744081652d42 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -1686,9 +1686,9 @@ static int gmc_v8_0_set_powergating_state(struct am=
dgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gmc_v8_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gmc_v8_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v9_0.c
> index 4f3ce6d22386..a80f3e2bcba8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -2573,9 +2573,9 @@ static int gmc_v9_0_set_clockgating_state(struct am=
dgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void gmc_v9_0_get_clockgating_state(void *handle, u64 *flags)
> +static void gmc_v9_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         adev->mmhub.funcs->get_clockgating(adev, flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/a=
mdgpu/ih_v6_0.c
> index f8a485164437..7198ddfaa8f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> @@ -768,9 +768,9 @@ static int ih_v6_0_set_powergating_state(struct amdgp=
u_ip_block *ip_block,
>         return 0;
>  }
>
> -static void ih_v6_0_get_clockgating_state(void *handle, u64 *flags)
> +static void ih_v6_0_get_clockgating_state(struct amdgpu_ip_block *ip_blo=
ck, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (!RREG32_SOC15(OSSSYS, 0, regIH_CLK_CTRL))
>                 *flags |=3D AMD_CG_SUPPORT_IH_CG;
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/a=
mdgpu/ih_v6_1.c
> index dd0042efceec..342b166c136d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
> @@ -749,9 +749,9 @@ static int ih_v6_1_set_powergating_state(struct amdgp=
u_ip_block *ip_block,
>         return 0;
>  }
>
> -static void ih_v6_1_get_clockgating_state(void *handle, u64 *flags)
> +static void ih_v6_1_get_clockgating_state(struct amdgpu_ip_block *ip_blo=
ck, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (!RREG32_SOC15(OSSSYS, 0, regIH_CLK_CTRL))
>                 *flags |=3D AMD_CG_SUPPORT_IH_CG;
> diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/a=
mdgpu/ih_v7_0.c
> index 8f9b15c171f3..71c1c77035e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
> @@ -739,9 +739,9 @@ static int ih_v7_0_set_powergating_state(struct amdgp=
u_ip_block *ip_block,
>         return 0;
>  }
>
> -static void ih_v7_0_get_clockgating_state(void *handle, u64 *flags)
> +static void ih_v7_0_get_clockgating_state(struct amdgpu_ip_block *ip_blo=
ck, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (!RREG32_SOC15(OSSSYS, 0, regIH_CLK_CTRL))
>                 *flags |=3D AMD_CG_SUPPORT_IH_CG;
> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd=
/amdgpu/navi10_ih.c
> index 62cdfe10e6f4..1c727ccd03b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> @@ -682,9 +682,9 @@ static int navi10_ih_set_powergating_state(struct amd=
gpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void navi10_ih_get_clockgating_state(void *handle, u64 *flags)
> +static void navi10_ih_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (!RREG32_SOC15(OSSSYS, 0, mmIH_CLK_CTRL))
>                 *flags |=3D AMD_CG_SUPPORT_IH_CG;
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index 8d84dff58b7e..5d4a4e7fd97f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -1078,9 +1078,9 @@ static int nv_common_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void nv_common_get_clockgating_state(void *handle, u64 *flags)
> +static void nv_common_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         if (amdgpu_sriov_vf(adev))
>                 *flags =3D 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v3_0.c
> index c611328671ed..6e75a4a85f74 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -1514,9 +1514,9 @@ static int sdma_v3_0_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v3_0_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v3_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v4_0.c
> index ea42fb10d207..d31ee01383df 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2331,9 +2331,9 @@ static int sdma_v4_0_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v4_0_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v4_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/a=
md/amdgpu/sdma_v4_4_2.c
> index 3dc0ffa81484..23a6bb16a0b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -1920,9 +1920,9 @@ static int sdma_v4_4_2_set_powergating_state(struct=
 amdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v4_4_2_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v4_4_2_get_clockgating_state(struct amdgpu_ip_block *ip=
_block, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_0.c
> index b764550834a0..377efb2b8d0e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -1883,9 +1883,9 @@ static int sdma_v5_0_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v5_0_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v5_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v5_2.c
> index b1818e87889a..ce05d895f977 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -1847,9 +1847,9 @@ static int sdma_v5_2_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v5_2_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v5_2_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v6_0.c
> index b83a0a69ac5b..60a1dff73cbe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -1621,7 +1621,7 @@ static int sdma_v6_0_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v6_0_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v6_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd=
/amdgpu/sdma_v7_0.c
> index 9b40ae67a92f..b71dba041a48 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -1600,7 +1600,7 @@ static int sdma_v7_0_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void sdma_v7_0_get_clockgating_state(void *handle, u64 *flags)
> +static void sdma_v7_0_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
>  }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amd=
gpu/soc15.c
> index 6f8d867b290e..2c6d2099e215 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -1461,9 +1461,9 @@ static int soc15_common_set_clockgating_state(struc=
t amdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void soc15_common_get_clockgating_state(void *handle, u64 *flags)
> +static void soc15_common_get_clockgating_state(struct amdgpu_ip_block *i=
p_block, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amd=
gpu/soc21.c
> index a302f1ae6282..7925cbb61d0d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc21.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
> @@ -1002,9 +1002,9 @@ static int soc21_common_set_powergating_state(struc=
t amdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void soc21_common_get_clockgating_state(void *handle, u64 *flags)
> +static void soc21_common_get_clockgating_state(struct amdgpu_ip_block *i=
p_block, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         adev->nbio.funcs->get_clockgating_state(adev, flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amd=
gpu/soc24.c
> index 69c5c8769395..4e506c91e978 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc24.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
> @@ -574,9 +574,9 @@ static int soc24_common_set_powergating_state(struct =
amdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void soc24_common_get_clockgating_state(void *handle, u64 *flags)
> +static void soc24_common_get_clockgating_state(struct amdgpu_ip_block *i=
p_block, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>
>         adev->nbio.funcs->get_clockgating_state(adev, flags);
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v5_0.c
> index 050a0f309390..2295c8713d61 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
> @@ -837,9 +837,9 @@ static int uvd_v5_0_set_powergating_state(struct amdg=
pu_ip_block *ip_block,
>         return ret;
>  }
>
> -static void uvd_v5_0_get_clockgating_state(void *handle, u64 *flags)
> +static void uvd_v5_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         mutex_lock(&adev->pm.mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/=
amdgpu/uvd_v6_0.c
> index d9d036ee51fb..070a0624c2c5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
> @@ -1498,9 +1498,9 @@ static int uvd_v6_0_set_powergating_state(struct am=
dgpu_ip_block *ip_block,
>         return ret;
>  }
>
> -static void uvd_v6_0_get_clockgating_state(void *handle, u64 *flags)
> +static void uvd_v6_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         mutex_lock(&adev->pm.mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/=
amdgpu/vce_v3_0.c
> index f8bddcd19b68..01248a3982ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> @@ -828,9 +828,9 @@ static int vce_v3_0_set_powergating_state(struct amdg=
pu_ip_block *ip_block,
>         return ret;
>  }
>
> -static void vce_v3_0_get_clockgating_state(void *handle, u64 *flags)
> +static void vce_v3_0_get_clockgating_state(struct amdgpu_ip_block *ip_bl=
ock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         mutex_lock(&adev->pm.mutex);
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu=
/vi.c
> index 06615f160331..12fe571787f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -1994,9 +1994,9 @@ static int vi_common_set_powergating_state(struct a=
mdgpu_ip_block *ip_block,
>         return 0;
>  }
>
> -static void vi_common_get_clockgating_state(void *handle, u64 *flags)
> +static void vi_common_get_clockgating_state(struct amdgpu_ip_block *ip_b=
lock, u64 *flags)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       struct amdgpu_device *adev =3D ip_block->adev;
>         int data;
>
>         if (amdgpu_sriov_vf(adev))
> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/a=
md/include/amd_shared.h
> index 6dccee403a3d..3e86865563dc 100644
> --- a/drivers/gpu/drm/amd/include/amd_shared.h
> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -415,7 +415,7 @@ struct amd_ip_funcs {
>                                      enum amd_clockgating_state state);
>         int (*set_powergating_state)(struct amdgpu_ip_block *ip_block,
>                                      enum amd_powergating_state state);
> -       void (*get_clockgating_state)(void *handle, u64 *flags);
> +       void (*get_clockgating_state)(struct amdgpu_ip_block *ip_block, u=
64 *flags);
>         void (*dump_ip_state)(struct amdgpu_ip_block *ip_block);
>         void (*print_ip_state)(struct amdgpu_ip_block *ip_block, struct d=
rm_printer *p);
>  };
> --
> 2.34.1
>
