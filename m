Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB928E9A1
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Oct 2020 03:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D00D89FD3;
	Thu, 15 Oct 2020 01:09:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCC089FD3
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 01:09:41 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z22so816186wmi.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Oct 2020 18:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2h2Qsx9ZUJUxYmDlnwbCftC4uD9zli7XBWyzrPAGsS8=;
 b=NJ1BQAG0REZjIjtWRGUCroxF2d5ZK9Q7j5Pw/p/SXPQJR2r56iOKbASaNDIhovzHS9
 8j8NoeH+BvayE461uy3y8fkN29UXe1lfUzmyQIbw7xQdKlEticu8K9D1iuuqWW65YrHd
 Jg/Hy4Dyw7rs+ckThur06dfGbA8BtHojrh7G6U9d0gEt5cTFCEMxgjl+v0uiW7em2X3M
 D6yI0Amy+XtxMR3hUrRkhsMwkD6hix/L30vRW1wL5S5kjIlVJb9hiwlXu560GLH00WYe
 mC6HDCK75MGlkLpeS9Cht3p48nAYCE5AXAoROGOUoqr41q6AZNuZqeM9sgLqIYD8ukmq
 figw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2h2Qsx9ZUJUxYmDlnwbCftC4uD9zli7XBWyzrPAGsS8=;
 b=rDGLrNt+s4luqsdb3tjPCZEfcJvDWjMwUoqUl1AZi4xKYbjnoEuvXkQP55wwvmb80V
 AqK+41pxRUiUQF8X+SjffGcJWBCtkYxawEI6u7bml6HvmpqOagFriTEM2359poaZq+N5
 RRHtAdLD/ussyLwtt+ijGlvhMRZrTUQQ5vPdR8ActGXaM/FpyZS2jLuqOBa2oXbtBAkg
 iQt1lu6gfNOkk/XOLu+tOQqAyYosxJPLEN9Z7aGzF5Miot0+dyojLKHXTQjUhFM/UzAC
 oEyIkXKxP/ZkfuXo65rrevKbMk0laVsSEaeZ4PNJz4b5mhrC7dhsBruups5HHNmwfhk/
 ff/w==
X-Gm-Message-State: AOAM531r+RipGjHlvXGbqmRHBSywVJA4tm0lyxZuEfwQtT2v9ii8vnFz
 EWptf6GFnSGLoYQK1FldDGE57zoLDPCNLRL5qb0=
X-Google-Smtp-Source: ABdhPJyXYHAuWa6H/xow4RN3XCvSuOEAqDjEV0U/OHtv+lWeUS6Z/8RPpRGmMgwzVNicuSFH0voTTmpIT4ZENtfeBDQ=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr1292835wmk.73.1602724179924; 
 Wed, 14 Oct 2020 18:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201014235823.58784-1-ray.huang@amd.com>
In-Reply-To: <20201014235823.58784-1-ray.huang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Oct 2020 21:09:28 -0400
Message-ID: <CADnq5_M7Ghw_o68sbWeeLXg_JCL+4wYzQrHNDi=6uiiWgSSZdw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: disable gpa mode for direct loading
To: Huang Rui <ray.huang@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 14, 2020 at 7:59 PM Huang Rui <ray.huang@amd.com> wrote:
>
> This patch fixes the gfx hang while use firmware direct loading mode.
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 042ad5e4292b..8fc69c208adb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -129,6 +129,13 @@
>  #define mmCP_HYP_ME_UCODE_DATA                 0x5817
>  #define mmCP_HYP_ME_UCODE_DATA_BASE_IDX                1
>
> +#define mmCPG_PSP_DEBUG                                0x5c10
> +#define mmCPG_PSP_DEBUG_BASE_IDX               1
> +#define mmCPC_PSP_DEBUG                                0x5c11
> +#define mmCPC_PSP_DEBUG_BASE_IDX               1
> +#define CPC_PSP_DEBUG__GPA_OVERRIDE_MASK       0x00000008L
> +#define CPG_PSP_DEBUG__GPA_OVERRIDE_MASK       0x00000008L
> +
>  MODULE_FIRMWARE("amdgpu/navi10_ce.bin");
>  MODULE_FIRMWARE("amdgpu/navi10_pfp.bin");
>  MODULE_FIRMWARE("amdgpu/navi10_me.bin");
> @@ -7035,6 +7042,18 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
>         WREG32_SOC15(GC, 0, mmGRBM_CAM_DATA, data);
>  }
>
> +static void gfx_v10_0_disable_gpa_mode(struct amdgpu_device *adev)
> +{
> +       uint32_t data;
> +       data = RREG32_SOC15(GC, 0, mmCPC_PSP_DEBUG);
> +       data |= CPC_PSP_DEBUG__GPA_OVERRIDE_MASK;
> +       WREG32_SOC15(GC, 0, mmCPC_PSP_DEBUG, data);
> +
> +       data = RREG32_SOC15(GC, 0, mmCPG_PSP_DEBUG);
> +       data |= CPG_PSP_DEBUG__GPA_OVERRIDE_MASK;
> +       WREG32_SOC15(GC, 0, mmCPG_PSP_DEBUG, data);
> +}
> +
>  static int gfx_v10_0_hw_init(void *handle)
>  {
>         int r;
> @@ -7060,6 +7079,7 @@ static int gfx_v10_0_hw_init(void *handle)
>                                 return r;
>                         }
>                 }
> +               gfx_v10_0_disable_gpa_mode(adev);
>         }
>
>         /* if GRBM CAM not remapped, set up the remapping */
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
