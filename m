Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0510843D0AB
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Oct 2021 20:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B1F6E15F;
	Wed, 27 Oct 2021 18:24:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9566E15F
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 18:24:08 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 107-20020a9d0a74000000b00553bfb53348so4937869otg.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Oct 2021 11:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BFzjd2gOI7wVpczhBtfcAhWLmIt1BMpD564YshcMQ3Q=;
 b=jjzFQMfkfSx0/7PrGtOh7EPrdpNXKkNpnuivbRKvppO/RS3d0qt5viCN5yivJN9MWp
 71EyosuhlgiyRWgNuQm2ZibEK7y2judWhSyeZImlw+iuumj3XvMdx2ltBNrvBIncM0ZE
 cO9r9hZm6C2iS6MnW/VyYKCDp6egT8Lk8Ia8QTWHYfWDQqfbCHDC/Gx5RS2z/zGeMzct
 VlFllIdrc3W8OMRhwOGASte5kZCexTgS23/cEO66zADri5b5cTFACOb3UzN/IpnWLoVq
 6QaC2+XgdGcSuYX71SYKsNgyP3ahB9c/fLYzsgaZsfQXOIQHKqOYF3YHSsR6AMml45V2
 P5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFzjd2gOI7wVpczhBtfcAhWLmIt1BMpD564YshcMQ3Q=;
 b=DO5Uq/n7S/kjNFjuUnBkGmuLMoVYKPpgVmenXoyjO/CauS92BgTW3OcMaqWFuqOreS
 ysMHZcfkQzXfeHWZjZkzYfgGPl9SzpmHuAqP80v9lbfBj10SiP7S9AS5hJ+DdqautixA
 Vpujqsg0P4R7YbrzDl//nJDL28+rm8PwENJ9yi6ujdqEnEzKDjmwqsDQ8a+Tjn83eGzw
 YaqwxLwT/i/S8GHyPvjaPTuELHjhdyWstnGEWHIpv382SvYSynoBUNvoMU6q3vPArbtm
 k18rLEY+bu6An4i/kna1Y44t7rQhAxpgP9/1rTq48xP4Ur6/0wSX+X6wk8x5Jx5VIZAH
 EVHQ==
X-Gm-Message-State: AOAM531UQXPP1TJdT9sOlXRBqvxYHp3efTpUwp6BUXsAZmwuVNx1ZbrR
 KiwMVPBcUisn/EtBUsERyZQiTzcPrleGnLVFQicrqdyyorptjQ==
X-Google-Smtp-Source: ABdhPJzv9AbNzrSY1FIce0tkFufYLyvvqbg6kRPtDded1nXyf5fGLA4MzXGsqDotROiEp6yAkzRCrb+t/+ZXyg3SRu4=
X-Received: by 2002:a9d:1b4f:: with SMTP id l73mr26562461otl.200.1635359047970; 
 Wed, 27 Oct 2021 11:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211027182212.1484689-1-alexander.deucher@amd.com>
In-Reply-To: <20211027182212.1484689-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 27 Oct 2021 14:23:56 -0400
Message-ID: <CADnq5_PzD5h0UmhQko7YE86a1xhm2LnPFhDgwgEhBe7iKNov0A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc6: fix DMA mask
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 2:22 PM Alex Deucher <alexander.deucher@amd.com> wrote:
>
> The DMA mask on SI parts is 40 bits not 44.  Looks like a copy
> paste typo.
>

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1762

Fixed locally.

Alex

> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> index 0e81e03e9b49..a9354cb2d639 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
> @@ -841,7 +841,7 @@ static int gmc_v6_0_sw_init(void *handle)
>
>         adev->gmc.mc_mask = 0xffffffffffULL;
>
> -       r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(44));
> +       r = dma_set_mask_and_coherent(adev->dev, DMA_BIT_MASK(40));
>         if (r) {
>                 dev_warn(adev->dev, "No suitable DMA available.\n");
>                 return r;
> --
> 2.31.1
>
