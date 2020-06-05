Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EEB1EFC92
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jun 2020 17:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A646E93A;
	Fri,  5 Jun 2020 15:35:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2E6E939
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2020 15:35:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u13so8860207wml.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jun 2020 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=syQ4JhrxLkl7ozqPVACEdiLABKEoULlub0KXpsDNYQ8=;
 b=o3OM4MGtJ9KDLeEcyw/ja2PKToItZ0uRiruc8YScXQ2REtlMt8gTC2dcA025K3Tsme
 JwYBFLaTCMgeJ8JlsiqKjEHERcecxmEXEJwbZxYchSXgPcV1+y7AArZT7DrY2bnEF69v
 z20yTmpoogtYBN0SFgRvPy1XXtljFeptjiUernQflNhhyvcDA/zq3ZI27f/CNpxS/Ngj
 2xoZKnso4SGaienKDRAK+l4VDmBAmx43dn9J98FTvlz8/YYGgVdP2cr9lU0f/lQRfM73
 JXW9ELOWw+4NfBFBr2aVnwQakObyR9aNxE2ytprvPVL9BBpvN3ZRZp5U5Nc10t/1kTKp
 NzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=syQ4JhrxLkl7ozqPVACEdiLABKEoULlub0KXpsDNYQ8=;
 b=Et447KaVbvXtcutF82P3f7ORpC8KSF5LsLvz9yqD5gaIuKiYJuYJAnzitOYEwA+fAj
 j7oZ2hfye37dpQDNLC5A+Mj6CiDw/kzQHaxTGLjw3pTRSncK9vp5U6Exk0acwfr4mcFG
 N1Vaen1I7y93BU8TGILjbDVCd50JG/Z0V7aeV9sw+ZWfRX5jdSM6H+NgKzAfzaLL1KqI
 uMGTIgTWptyaswcJcEoxleF4Hmfmegj5ie6IHsuJSE4JCYn2h7703r5gYWC76yvYZZi6
 MAhaWaWO0akSoYorp9UnzeBhjmWUUd1KymjlZkhIoBdgbHNPxKP7Si9Ma2kCqwVQgReY
 q9ig==
X-Gm-Message-State: AOAM532yvbq+m3/qcuxc+cbIdMRHsa9hjlSXw+5usO9sVPA0C6DTOmso
 dKp3+rkxzX8zHUTm/ddMt/W6PuV2fKgzE+uX86sHrA==
X-Google-Smtp-Source: ABdhPJwjRLBVmBjP//eka4a2gRdnMNu7WPrCpXWIw4gE6qroY3QLLa9eCCPyfxfEwx7CiX+3y/Ltj+YNbvh6Ymmo4kY=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr3312043wmy.79.1591371351438; 
 Fri, 05 Jun 2020 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200605153432.83159-1-alexander.deucher@amd.com>
In-Reply-To: <20200605153432.83159-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jun 2020 11:35:40 -0400
Message-ID: <CADnq5_M3_+Y+kKY+k5QWfakQ+LqE=jW43mwfyyTBicnVn2oeUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/soc15: fix using ip discovery tables on renoir
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 5, 2020 at 11:34 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> The PWR block moved into SMUIO, so the ip discovery table
> doesn't have an entry for PWR, but the register has the
> same absolute offset, so just patch up the offsets after
> updating the offsets from the IP discovery table.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Nevermind.  this won't work.

> ---
>  drivers/gpu/drm/amd/amdgpu/soc15.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index 623745b2d8b3..21f29685f158 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -670,7 +670,7 @@ static uint32_t soc15_get_rev_id(struct amdgpu_device *adev)
>
>  int soc15_set_ip_blocks(struct amdgpu_device *adev)
>  {
> -       int r;
> +       int r, i;
>
>         /* Set IP register base before any HW register access */
>         switch (adev->asic_type) {
> @@ -686,6 +686,10 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
>                                 DRM_WARN("failed to init reg base from ip discovery table, "
>                                          "fallback to legacy init method\n");
>                                 vega10_reg_base_init(adev);
> +                       } else {
> +                               /* PWR block was merged into SMUIO on renoir */
> +                               for (i = 0 ; i < HWIP_MAX_INSTANCE; ++i)
> +                                       adev->reg_offset[PWR_HWIP][i] = adev->reg_offset[SMUIO_HWIP][i];
>                         }
>                 }
>                 break;
> --
> 2.25.4
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
