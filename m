Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFA65B12EC
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Sep 2022 05:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31F10E941;
	Thu,  8 Sep 2022 03:29:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189F910E93F
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Sep 2022 03:29:04 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1278624b7c4so22823337fac.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Sep 2022 20:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iWL5Bo8vYJGNVw9v2NhY7MkNjhDtje3cmY9GoMdR1Vs=;
 b=q4Ag8s0bjzHqGngazSy+woz3ZJ4pjMluqR104ZusqiuaQWD8ZSeHCgblqoKFOy9FBk
 LiE03FXZRC+JRXNRT+WTm6eIO+olJpP9P9KnpPuPJO9LSo5EHsHTxDefi4ZlayZnqKVC
 +BScqG/tPbUQ5cUVz3gBLvDVkiTKyhoYCDqiZLoO/J60miST0ztN8pQs7zMa/zWZ5Lot
 66aSRLghzHDX6wEFXq7qEf43BalJbkfjN5hUQnJqcmXVKu3akhDqLloh2ksLoC1oGIU2
 +NlbTJzDV2TmqsmCDt51GDWkV+MYIa98A13EJW7BsKWD9iCLMgLnbp14tNddMVgQ55EI
 sdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iWL5Bo8vYJGNVw9v2NhY7MkNjhDtje3cmY9GoMdR1Vs=;
 b=VelgnQcP9tQW8UxNt9hW94UsI2vCRigtpgyvIg7rzwgOVZfA2j2eiJ8CJJma8/K82k
 NNhxT6WNi4pVRl3Q0A15GfPdcOl70MAHHd8HiGphR8cs3xvgZKw2fVXnsAHIhGRGePh1
 hW8yp8bbpVsfq5oGaPKSQMERQ0TO6MDR13/Wff+UyB++/Hsfg3lTjJC300QS2VTs1U1K
 l2gFkAc3n8LE6KPmEB/uglAz8PQ7HQ4Dj5BakD5pI0ccwDxkBRnt4zXXewgISkMnf14O
 eIFSmAdBjgfE0yjsZazoxBpSmJDfpWf7K12iKbAiU+RgbBmg3wIC/341vq99SntF7qG4
 5nqw==
X-Gm-Message-State: ACgBeo1EdwtlEFCy37roc63g1NbNomqwNtly2DX4ZJUdoGX4BjVhvDNF
 z7ZNt9SIrfKkUT6hO1TPBqNjJxGvKywyIAgReK8=
X-Google-Smtp-Source: AA6agR5+nBXUWNsuk2vULsUXKsUkpqppD+vxxyiiE409vN8FNIHALinOShCaZlKl0YxxZ4syBz6CVwJGse7w5bqAefc=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr835126oam.96.1662607743298; Wed, 07 Sep
 2022 20:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220908032344.1682187-1-lijo.lazar@amd.com>
In-Reply-To: <20220908032344.1682187-1-lijo.lazar@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 Sep 2022 23:28:51 -0400
Message-ID: <CADnq5_MQ64piXz-CJeEn2e4yi_kwePYCea_sTxdFUAb+j8wu5Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Don't enable LTR if not supported
To: Lijo Lazar <lijo.lazar@amd.com>
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
Cc: stable@vger.kernel.org, wielkiegie@gmail.com, helgaas@kernel.org,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Sep 7, 2022 at 11:24 PM Lijo Lazar <lijo.lazar@amd.com> wrote:
>
> As per PCIE Base Spec r4.0 Section 6.18
> 'Software must not enable LTR in an Endpoint unless the Root Complex
> and all intermediate Switches indicate support for LTR.'
>
> This fixes the Unsupported Request error reported through AER during
> ASPM enablement.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216455
>
> The error was unnoticed before and got visible because of the commit
> referenced below. This doesn't fix anything in the commit below, rather
> fixes the issue in amdgpu exposed by the commit. The reference is only
> to associate this commit with below one so that both go together.
>
> Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_port_device_capability()")
>
> Reported-by: Gustaw Smolarczyk <wielkiegie@gmail.com>
> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> Cc: stable@vger.kernel.org
> ---

Even though the ASPM code in si.c, cik.c, and vi.c doesn't mess with
LTR, it still sets up ASPM so shouldn't it be protected with
CONFIG_PCIEASPM as well?

Alex

>  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c | 9 ++++++++-
>  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c | 9 ++++++++-
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 9 ++++++++-
>  3 files changed, 24 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> index b465baa26762..aa761ff3a5fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> @@ -380,6 +380,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
>                 WREG32_PCIE(smnPCIE_LC_CNTL, data);
>  }
>
> +#ifdef CONFIG_PCIEASPM
>  static void nbio_v2_3_program_ltr(struct amdgpu_device *adev)
>  {
>         uint32_t def, data;
> @@ -401,9 +402,11 @@ static void nbio_v2_3_program_ltr(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
>  }
> +#endif
>
>  static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
>  {
> +#ifdef CONFIG_PCIEASPM
>         uint32_t def, data;
>
>         def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
> @@ -459,7 +462,10 @@ static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL6, data);
>
> -       nbio_v2_3_program_ltr(adev);
> +       /* Don't bother about LTR if LTR is not enabled
> +        * in the path */
> +       if (adev->pdev->ltr_path)
> +               nbio_v2_3_program_ltr(adev);
>
>         def = data = RREG32_SOC15(NBIO, 0, mmRCC_BIF_STRAP3);
>         data |= 0x5DE0 << RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
> @@ -483,6 +489,7 @@ static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
>         data &= ~PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL3, data);
> +#endif
>  }
>
>  static void nbio_v2_3_apply_lc_spc_mode_wa(struct amdgpu_device *adev)
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
> index f7f6ddebd3e4..37615a77287b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c
> @@ -282,6 +282,7 @@ static void nbio_v6_1_init_registers(struct amdgpu_device *adev)
>                         mmBIF_BX_DEV0_EPF0_VF0_HDP_MEM_COHERENCY_FLUSH_CNTL) << 2;
>  }
>
> +#ifdef CONFIG_PCIEASPM
>  static void nbio_v6_1_program_ltr(struct amdgpu_device *adev)
>  {
>         uint32_t def, data;
> @@ -303,9 +304,11 @@ static void nbio_v6_1_program_ltr(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
>  }
> +#endif
>
>  static void nbio_v6_1_program_aspm(struct amdgpu_device *adev)
>  {
> +#ifdef CONFIG_PCIEASPM
>         uint32_t def, data;
>
>         def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
> @@ -361,7 +364,10 @@ static void nbio_v6_1_program_aspm(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL6, data);
>
> -       nbio_v6_1_program_ltr(adev);
> +       /* Don't bother about LTR if LTR is not enabled
> +        * in the path */
> +       if (adev->pdev->ltr_path)
> +               nbio_v6_1_program_ltr(adev);
>
>         def = data = RREG32_PCIE(smnRCC_BIF_STRAP3);
>         data |= 0x5DE0 << RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
> @@ -385,6 +391,7 @@ static void nbio_v6_1_program_aspm(struct amdgpu_device *adev)
>         data &= ~PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL3, data);
> +#endif
>  }
>
>  const struct amdgpu_nbio_funcs nbio_v6_1_funcs = {
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> index 11848d1e238b..19455a725939 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
> @@ -673,6 +673,7 @@ struct amdgpu_nbio_ras nbio_v7_4_ras = {
>  };
>
>
> +#ifdef CONFIG_PCIEASPM
>  static void nbio_v7_4_program_ltr(struct amdgpu_device *adev)
>  {
>         uint32_t def, data;
> @@ -694,9 +695,11 @@ static void nbio_v7_4_program_ltr(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
>  }
> +#endif
>
>  static void nbio_v7_4_program_aspm(struct amdgpu_device *adev)
>  {
> +#ifdef CONFIG_PCIEASPM
>         uint32_t def, data;
>
>         if (adev->ip_versions[NBIO_HWIP][0] == IP_VERSION(7, 4, 4))
> @@ -755,7 +758,10 @@ static void nbio_v7_4_program_aspm(struct amdgpu_device *adev)
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL6, data);
>
> -       nbio_v7_4_program_ltr(adev);
> +       /* Don't bother about LTR if LTR is not enabled
> +        * in the path */
> +       if (adev->pdev->ltr_path)
> +               nbio_v7_4_program_ltr(adev);
>
>         def = data = RREG32_PCIE(smnRCC_BIF_STRAP3);
>         data |= 0x5DE0 << RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
> @@ -779,6 +785,7 @@ static void nbio_v7_4_program_aspm(struct amdgpu_device *adev)
>         data &= ~PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
>         if (def != data)
>                 WREG32_PCIE(smnPCIE_LC_CNTL3, data);
> +#endif
>  }
>
>  const struct amdgpu_nbio_funcs nbio_v7_4_funcs = {
> --
> 2.25.1
>
