Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9D29657C
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Oct 2020 21:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECAD6E0DD;
	Thu, 22 Oct 2020 19:44:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2306E0DD
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 19:44:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s9so4504296wro.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Oct 2020 12:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gNVvQUp5UXDL/TQwFv+MOvgwwjUKKG9Sa2J7so4h/Yo=;
 b=DDEiZZDtPjb+gYTx8GD8z9elSYNvMAU+qU2KwFWeMB/j6v1oMAuNCfh7X+lkNH57RU
 7AXCNQBG6oYYx8DCKjeG3C+TrMVDajIl18YqH+3UQpOVxETtdXr5HpqCA4sZwrn5KS0h
 6FZjgz7RVucTDqiaiyKq58tdRSLhAkuddk2aWtFZWWUQcNUnBYvrnhxkF+6MnQN6rC+U
 MT5D1hyCEu+z9rEmFdVPrzwfGIIFPBabG1oXp12AyDtYZJC1Bj2UTVemdcH8+x2KZGH7
 rOL+0GQHSiavDmOgffJsuXJudibkSuuGSP9r8wuozm5Du/QMgdtDQYDwY+zJNT4HJ3lr
 hpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNVvQUp5UXDL/TQwFv+MOvgwwjUKKG9Sa2J7so4h/Yo=;
 b=LzAAqU8qYuedrjAUZGJ9LjK1b2BiyVLVycANhC6NacUaMsE1ahQpVKVxW2jj+Zy8Md
 zpAerXfwBCBhjueYfYildiWk4LZGuriRfyfWF797gj4Arj+BjaXGwbBX3uQ+ojqR6XN3
 pim1baBk9KqBEGtHtcaeh8sTY+6Zkq494cFaCweM4VeT4dYAZXLvDK5vg5s0uv20D3ag
 gm5qKsGZQx+40v0tnjsaGzboBrHn4EmA73aFhoOQMUPsWlYm4M0oA9l/8/rUQRDWFvyf
 1ZErlWN0TVkY0n1hZegro8g+OOKznEYdn1/E5sXtdISo8BZ5QrgXNuWJp/EHCVttG70R
 /NYA==
X-Gm-Message-State: AOAM532GyJPRr1QZ4Dj6OvpPA29FopVEvVq8Uoix4EjIcJaD6L4rBnZ8
 Nc3MT6tQLO7v3T8PucrsndMdLn0hGEquag+2EUA=
X-Google-Smtp-Source: ABdhPJyYoMmqwcajQD7HTHW/s6jj6YNQR2VmFgciBuEYD2YQyB0om+4XdM9N6g/Akd+IywrrEAtV3v/JWBH/U8AyyFk=
X-Received: by 2002:a5d:6642:: with SMTP id f2mr4544115wrw.374.1603395896451; 
 Thu, 22 Oct 2020 12:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201022194112.295794-1-Harish.Kasiviswanathan@amd.com>
In-Reply-To: <20201022194112.295794-1-Harish.Kasiviswanathan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Oct 2020 15:44:44 -0400
Message-ID: <CADnq5_PUf31YYXtwwR-VkSPtPFOsXspoGDzSZd03tVfa3pwHGw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: During compute disable GFXOFF for
 Sienna_Cichlid
To: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
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

On Thu, Oct 22, 2020 at 3:41 PM Harish Kasiviswanathan
<Harish.Kasiviswanathan@amd.com> wrote:
>

Please include a patch description.  With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> Signed-off-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
> Change-Id: Ia9f8872b7654b99864bbef1afb9998d0cf39b7e5
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index 90fb864ac7aa..450389218516 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -647,6 +647,13 @@ void amdgpu_amdkfd_set_compute_idle(struct kgd_dev *kgd, bool idle)
>  {
>         struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
>
> +       /* Temp workaround to fix the soft hang observed in certain compute
> +        * applications if GFXOFF is enabled.
> +        */
> +       if (adev->asic_type == CHIP_SIENNA_CICHLID) {
> +               pr_debug("GFXOFF is %s\n", idle ? "enabled" : "disabled");
> +               amdgpu_gfx_off_ctrl(adev, idle);
> +       }
>         amdgpu_dpm_switch_power_profile(adev,
>                                         PP_SMC_POWER_PROFILE_COMPUTE,
>                                         !idle);
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
