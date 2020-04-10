Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED71A4671
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Apr 2020 14:45:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4804B6ECD5;
	Fri, 10 Apr 2020 12:45:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7B56ECD5
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2020 12:45:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f13so2145713wrm.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Apr 2020 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEQEwHMVyhNAcg7gJd+uq6NCjAzRsC9nV/zxI3Ftbok=;
 b=V+sD+VLPjhW1wINZHp106IpcUhzmpJvGrXDb/n29ByJosohTmyLyjq2mLiCMmn6t7e
 D07MzUzR+7ryagOoNG3cFiRP4Zaz3XRi0ke9dH7FdjsNvxvKMgE0X6QrBwTVqKjPr8W7
 KQjahR7NJB3qb4mK7HNpA/Y33VuQuXCsEFdSgIvsjTb9Wzb3NCyE3mmlV9lvuwTDnN8n
 Haa8AD9S4Jh2+wu5Sih6irUvFr8W19ubQqnEWrl45v+4ltYK+6TubmTx+M+4KycwPg63
 aKSJ2YEDF55bM6NXlJYMbAWGaOZoEAOtr7gTmP/EB+zbyNbyCtmbzN/XJMH+Tqr6Ll+P
 cmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEQEwHMVyhNAcg7gJd+uq6NCjAzRsC9nV/zxI3Ftbok=;
 b=JzK4Yb/7+bVUfqi44m7c1l7Cx6BI01Y0Tzm/Q15fLIRzmRWsGpRCb/T8EpXAQC+DsX
 ATxaz7TjTPvVSnkV+9uIHd5JeIAmRfKp364HYt6nN7bVPtMRvCe97xjY8cEBlNNe1/Gp
 bYPvI1kqkuSmWC/jFq9vvtjrtfB65uas2UHeKZ/jxnexo6T3jgWbLuI9vaEb/1VdEnTV
 3YvI4UgwBfdqMZVIwRR637mrDi425Bs8XYhroGxHT6gvGMfxyLbGQkeesAZK2SWMbjWD
 lej37b16CyTz9G0081FYyYWc/9fZo2OQZEwcJQsLgbJfp1IJFIHtLJfHeCVDyzWOu1UO
 a0Ww==
X-Gm-Message-State: AGi0PuY+R0MsXyAeFu9JDRrmchnaFknGdFB2Nyd4pHwuX3cvlXLmLjEM
 ivpa/RM+on/AbQnxiEKDKNqWuGjdzZT27MLSGVowpg==
X-Google-Smtp-Source: APiQypI1oWhKlBNOCuTtQeGeyvp+JROb1ycRHxetExCmR4S8G2j7/siGDCKfgfWcdHLqrGFaJGPlLNO8zqEz0eoQvcE=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr4780540wrw.124.1586522703458; 
 Fri, 10 Apr 2020 05:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200410080136.29119-1-evan.quan@amd.com>
In-Reply-To: <20200410080136.29119-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Apr 2020 08:44:52 -0400
Message-ID: <CADnq5_NtxmN68VVKadomSSZ_vRcYZvCDJm6mhX269S2kKM2yiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix wrong vram lost counter increment
To: Evan Quan <evan.quan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 4:02 AM Evan Quan <evan.quan@amd.com> wrote:
>
> Vram lost counter is wrongly increased by two during baco reset.
>
> Change-Id: I8b9959a5d1632abc774ba07d56cf295bdd8288eb
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 36 ++++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/cik.c           |  2 --
>  drivers/gpu/drm/amd/amdgpu/nv.c            |  4 ---
>  drivers/gpu/drm/amd/amdgpu/soc15.c         |  4 ---
>  drivers/gpu/drm/amd/amdgpu/vi.c            |  2 --
>  5 files changed, 34 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index a2a4e4b28d00..c9317975c46e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2087,8 +2087,40 @@ static void amdgpu_device_fill_reset_magic(struct amdgpu_device *adev)
>   */
>  static bool amdgpu_device_check_vram_lost(struct amdgpu_device *adev)
>  {
> -       return !!memcmp(adev->gart.ptr, adev->reset_magic,
> -                       AMDGPU_RESET_MAGIC_NUM);
> +       if (memcmp(adev->gart.ptr, adev->reset_magic,
> +                       AMDGPU_RESET_MAGIC_NUM))
> +               return true;
> +
> +       if (!adev->in_gpu_reset)
> +               return false;
> +
> +       /*
> +        * For all ASICs with baco reset, the VRAM is assumed to be
> +        * lost.
> +        * For SOC15 and NV ASICs with mode1 reset, the VRAM is also
> +        * assumed to be lost.
> +        */
> +       switch (amdgpu_asic_reset_method(adev)) {
> +       case AMD_RESET_METHOD_BACO:
> +               return true;
> +       case AMD_RESET_METHOD_MODE1:
> +               switch (adev->asic_type) {
> +               case CHIP_VEGA10:
> +               case CHIP_VEGA12:
> +               case CHIP_VEGA20:
> +               case CHIP_RAVEN:
> +               case CHIP_ARCTURUS:
> +               case CHIP_RENOIR:
> +               case CHIP_NAVI10:
> +               case CHIP_NAVI14:
> +               case CHIP_NAVI12:

I think we can probably just drop the asic check and always return
true for MODE1 reset.  The UMC block gets reset is memory is not
reliable.

Alex

> +                       return true;
> +               default:
> +                       return false;
> +               }
> +       default:
> +               return false;
> +       }
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
> index db68ffa27984..fe306d0f73f7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik.c
> @@ -1358,8 +1358,6 @@ static int cik_asic_reset(struct amdgpu_device *adev)
>         int r;
>
>         if (cik_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
> -               if (!adev->in_suspend)
> -                       amdgpu_inc_vram_lost(adev);
>                 r = amdgpu_dpm_baco_reset(adev);
>         } else {
>                 r = cik_asic_pci_config_reset(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 7768880fcccf..995bdec9fa7d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -351,8 +351,6 @@ static int nv_asic_reset(struct amdgpu_device *adev)
>         struct smu_context *smu = &adev->smu;
>
>         if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
> -               if (!adev->in_suspend)
> -                       amdgpu_inc_vram_lost(adev);
>                 ret = smu_baco_enter(smu);
>                 if (ret)
>                         return ret;
> @@ -360,8 +358,6 @@ static int nv_asic_reset(struct amdgpu_device *adev)
>                 if (ret)
>                         return ret;
>         } else {
> -               if (!adev->in_suspend)
> -                       amdgpu_inc_vram_lost(adev);
>                 ret = nv_asic_mode1_reset(adev);
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index a597ad22b675..58a440a15525 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -569,14 +569,10 @@ static int soc15_asic_reset(struct amdgpu_device *adev)
>
>         switch (soc15_asic_reset_method(adev)) {
>                 case AMD_RESET_METHOD_BACO:
> -                       if (!adev->in_suspend)
> -                               amdgpu_inc_vram_lost(adev);
>                         return soc15_asic_baco_reset(adev);
>                 case AMD_RESET_METHOD_MODE2:
>                         return amdgpu_dpm_mode2_reset(adev);
>                 default:
> -                       if (!adev->in_suspend)
> -                               amdgpu_inc_vram_lost(adev);
>                         return soc15_asic_mode1_reset(adev);
>         }
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 0a90c296409b..af8986a55354 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -744,8 +744,6 @@ static int vi_asic_reset(struct amdgpu_device *adev)
>         int r;
>
>         if (vi_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
> -               if (!adev->in_suspend)
> -                       amdgpu_inc_vram_lost(adev);
>                 r = amdgpu_dpm_baco_reset(adev);
>         } else {
>                 r = vi_asic_pci_config_reset(adev);
> --
> 2.26.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
