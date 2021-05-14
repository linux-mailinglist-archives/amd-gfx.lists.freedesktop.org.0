Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D91381153
	for <lists+amd-gfx@lfdr.de>; Fri, 14 May 2021 22:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F33A6F448;
	Fri, 14 May 2021 20:00:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520966F448
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 20:00:14 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 s24-20020a4aead80000b02901fec6deb28aso120972ooh.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 13:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6LBa0aR+j3aawPZj4KzBBdk1YuW5GCmqJBP1ip6wwo=;
 b=WMk41e9MlFWESWY9pPA8fZpOlwBP9aRWZCySxTIfaVtl3ivafHTqWysabpZYMMEAjW
 zZE4TM7ksCIu6N8KoE6BJk29XF2qDW7xqXqDN3uVBx1SHl9LpuGThJak0x4UWaT3dbUi
 OjhQgsg902MyHxWrpj41mpnBHTH5OcxTnvIsTDLTQat1QO6JBBxgqYwixD7bwMkemMfb
 cJmLH2tT6cu+wMCb7CPWOqgzNAytacEkRY7j7d+SjYKHgQpWdSHQ0Ez3cQ4s8j9l7oXN
 pGWelLBAKp3G3Xn99KwT2GVaED8W3MwGjuBMjuUHVRpzkB9SK1AVKeLdoLH2eIRlqdmS
 jpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6LBa0aR+j3aawPZj4KzBBdk1YuW5GCmqJBP1ip6wwo=;
 b=BQK2ShLzTj1ecNKpoFzuk5/oIUP2QjHYtUvdQUMpFLN8+I7TYc7M59q3ds42AaoroT
 cMUwT3V7wneP79VTuKIcSqHk8oywKf3wT8YILslK6dON+55ERtJW3uhG56wJzUmOre+o
 j2nHY/L9eDWSOfNoa4HiRmhLdVJx+HGJkOKPbv7ZOVt1xskaNlsd9CBabeSl1PoJPmSu
 oRwg8i7+f0i2ToLQ/iz16bg8YXpg6TgjorUFW7odlJyE2q6TIp/G9qwXE3kAkjgq6F4L
 x0uFGJXQnuK+K1+Pikzsbywrf7t/x9kW00R2/D+4jyF0HYe98S9KR0CfAmfTFdckiALr
 sxqQ==
X-Gm-Message-State: AOAM533VStzFxPXRGmkFfqqBz9AFWBeFvxIiPNqve7i/lCxh5akbPcna
 GkaKpgEXDcnZMZsJGgxnnLqlZO62ho/YUBoTRfg=
X-Google-Smtp-Source: ABdhPJzXjZ5/z5JiLZem8hYV2s2miGUJWopGu0LhqKGye36t3z2rvmHJrKEwT1V6u6INTYpa9ibG7J2Dpq6WKbDARX8=
X-Received: by 2002:a4a:d004:: with SMTP id h4mr37649102oor.90.1621022412205; 
 Fri, 14 May 2021 13:00:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210514072706.4264-1-PengJu.Zhou@amd.com>
 <20210514072706.4264-13-PengJu.Zhou@amd.com>
In-Reply-To: <20210514072706.4264-13-PengJu.Zhou@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 May 2021 16:00:01 -0400
Message-ID: <CADnq5_OzWpgnsW69UOgsL8Sw7+WE_geaV+7LLL-6PmfBz5dc6Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] drm/amdgpu: Skip the program of MMMC_VM_AGP_* in
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
> KMD should not program these registers, the value were
> defined in the host, so skip them in the SRIOV environment.
>
> Signed-off-by: Peng Ju Zhou <PengJu.Zhou@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> index e24225b3d42a..422d106a650b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
> @@ -197,12 +197,12 @@ static void mmhub_v2_0_init_system_aperture_regs(struct amdgpu_device *adev)
>         uint64_t value;
>         uint32_t tmp;
>
> -       /* Program the AGP BAR */
> -       WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
> -       WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
> -       WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
> -
>         if (!amdgpu_sriov_vf(adev)) {
> +               /* Program the AGP BAR */
> +               WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
> +               WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
> +               WREG32_SOC15_RLC(MMHUB, 0, mmMMMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
> +
>                 /* Program the system aperture low logical page number. */
>                 WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
>                              min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
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
