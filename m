Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4FE381125
	for <lists+amd-gfx@lfdr.de>; Fri, 14 May 2021 21:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB3C88843;
	Fri, 14 May 2021 19:55:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B487B88843
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 19:55:34 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 o202-20020a4a2cd30000b02901fcaada0306so122788ooo.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 12:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BsAVlo1vyV3dJ5v0Bti1mTPWcBMhZvxrC/4VgaZXCbE=;
 b=t6qld9pb9enB+38l0Go714YfH37O8d6v+u4MGssruJ7oSdqARvBFck0KwLAOn8WBHS
 tTR1x3onrmmscexc1ijUWojIrbPpSmUhsc+kYg+ZpeGf4hv9HK3nfCLpfd7pwxVycwlC
 JgC6R6H+Ove59imiuf+1rC5SB/oL/vbrRLv41gyRj4osPCnwe4DZ6RHreKA9J3F8NcZw
 AayNEHhGTYCzW3THeNDhQt+4jTUOZeqEd2eOuZNxehUr5eQq4W8EvpCiFdcZT08qB15u
 H/TYVlCmcUpKcroYc0ihLKhwkITq3suzOJYjReImTiz0oYC+o1yiW/DPhMNhiY1fDBoN
 BKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BsAVlo1vyV3dJ5v0Bti1mTPWcBMhZvxrC/4VgaZXCbE=;
 b=j6MzVl581wV9E4R+ZGL2Ib3/USZinabo+fBsueRSp/QPmGJC8kEmVzTlECd9Gyqn5o
 wZAqZKg20Yki1KIsJYmIdfW5hD9JNQ+CcgwqCmL19Xsz1mahREWwdY4CIgs4cV2o0e4H
 tJ3Ox6GmSCieqlU+PGz9ARAWb4td1DxivikBFH/kvLzBMBXFB9tYAEdsEW7fS0HuCrus
 VUcCnBu00CB8BKSrlh4gClhWi8Fajs42hoV6vEMCWaDVPAqNeJ914JYZjbfTiLoBESaS
 F0C029dQh1rHKb/FJWKssj/aP6kS7MEJMYnBqx7DxZzvVQm9v4pAJViMAdO6xGCepjO1
 OqFw==
X-Gm-Message-State: AOAM531x0jlybmpba+0RLGfvb8gVlnnbJrtCcXzh5TDI6+kSTEKXfrU1
 kp38VgR9btO5NpDEvn/Edbj54xaw5lPxiE1ACso=
X-Google-Smtp-Source: ABdhPJxerc+TKGmns/V3VedaUpN92ho8steVgXtcsGEuXaLxr4QzurAUIeOh5VivGKmh+4UFi+IDVTsAAHbG3LxJzCo=
X-Received: by 2002:a4a:d543:: with SMTP id q3mr37663658oos.72.1621022134108; 
 Fri, 14 May 2021 12:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210514072706.4264-1-PengJu.Zhou@amd.com>
 <20210514072706.4264-14-PengJu.Zhou@amd.com>
In-Reply-To: <20210514072706.4264-14-PengJu.Zhou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 May 2021 15:55:23 -0400
Message-ID: <CADnq5_PiHdu1Hcab4BP=iaeC8TkzquotP-RkLFijjn6GMns+TQ@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] drm/amdgpu: Skip the program of GRBM_CAM* in
 SRIOV
To: Peng Ju Zhou <PengJu.Zhou@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 3:27 AM Peng Ju Zhou <PengJu.Zhou@amd.com> wrote:
>
> KMD should not the program these registers,
> so skip them in the SRIOV environment.
>
> Signed-off-by: Peng Ju Zhou <PengJu.Zhou@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 67db0197c882..952a2f0f2f4e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -7114,6 +7114,9 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
>  {
>         uint32_t data;
>
> +       if (amdgpu_sriov_vf(adev))
> +               return;
> +
>         /* initialize cam_index to 0
>          * index will auto-inc after each data writting */
>         WREG32_SOC15(GC, 0, mmGRBM_CAM_INDEX, 0);
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
