Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B9C21A991
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jul 2020 23:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB286E02F;
	Thu,  9 Jul 2020 21:13:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 692AC6E02F
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2020 21:13:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f18so3373884wml.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jul 2020 14:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fTnS2X5vvBy2ck69diW0APfP3pN8bU2RWwnR94y3m3Q=;
 b=oibjX4pq/CVxUEdAJytK3zoo/hwIAB8cIzFLSMs/3SY4qlKlPvbYuOAY657ROU2iGm
 e9B2ecOk+p9SIeHvshPXh9lEq7aU+LxfhoLXOz/2wGNmDINdPxUHGKeINB0CWFRTNTcS
 PE5BIFbTH6Qu84iTlqGga7OSHSjfv9Y6x/WIv84AL/PnyI8rZ8D5+BCj9BxBd9rondX1
 QnsQJfjn0uBXhBOghtkKzUWPncsnab6XJpNQIzfA7A4UDuxfcJgB0Jaqpx6v7+JL55u9
 y6D4IdIMEBxIvDh/IX7lw4oPznpSKXSkUmEe5PEZySaEAlhVuT0hSsGUjU07KS76isWM
 jFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fTnS2X5vvBy2ck69diW0APfP3pN8bU2RWwnR94y3m3Q=;
 b=ixNKhj7XnSFF10kKQGpuAVbBUQupobNFgm0pJr16OYm8RKQ2nWBvf1Sz4CZM/sLp9m
 exgD4d8D7o/K7QY1TaW5yQOXVbw9E6C5c7FuKWgaRPZaLJXAoXNlFZtEXX1T9iR6D+kk
 Bk//fRhM2W4MCmHzndG/QnCS0fSjD5ZBsXdchS/H2K5MBFV565ayfoeDuUwMoDDNIucH
 ul6S6xAOUebbOrIuilXxKZXqcU8vWwLsnnGDxUjXbSDKE1bQ4/9xdVyT8XhFpO+yAzRN
 vajSDvucB5l6ia+Oy7fYgNJ9p0vehefqdrF9/h55WBLME3/jRfF977nYyS2P/nWbC+Du
 J5IQ==
X-Gm-Message-State: AOAM532i8D2I8sGVmURp4A8uqdd+Oplo4QfcUaT84L3tKfDXTWjPjItC
 RWbWb/iV3IpHVEi//lSIimg+kmgpK/CnqytImjxf7g==
X-Google-Smtp-Source: ABdhPJxpXWRznXKnyoaxF8VaQLnxyusVQoOimt1IOezWjtK0A3j2MQDFxwoDGUwElpzjNRk3OJDxpunc4CMAy8kaa2g=
X-Received: by 2002:a1c:de07:: with SMTP id v7mr1871262wmg.56.1594329201146;
 Thu, 09 Jul 2020 14:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200709191758.69565-1-nirmoy.das@amd.com>
In-Reply-To: <20200709191758.69565-1-nirmoy.das@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 9 Jul 2020 17:13:10 -0400
Message-ID: <CADnq5_MiOHeyepQtCd0aAVgViaiixHRmTsuEFT4V9cyshMfBEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: minor cleanup of phase1 suspend code
To: Nirmoy Das <nirmoy.aiemd@gmail.com>
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
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jul 9, 2020 at 3:15 PM Nirmoy Das <nirmoy.aiemd@gmail.com> wrote:
>
> Cleanup of phase1 suspend code to reduce unnecessary indentation.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 ++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2913e41f63a5..81ca92127c00 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2456,18 +2456,21 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
>         for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>                 if (!adev->ip_blocks[i].status.valid)
>                         continue;
> +
>                 /* displays are handled separately */
> -               if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_DCE) {
> -                       /* XXX handle errors */
> -                       r = adev->ip_blocks[i].version->funcs->suspend(adev);
> -                       /* XXX handle errors */
> -                       if (r) {
> -                               DRM_ERROR("suspend of IP block <%s> failed %d\n",
> -                                         adev->ip_blocks[i].version->funcs->name, r);
> -                               return r;
> -                       }
> -                       adev->ip_blocks[i].status.hw = false;
> +               if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_DCE)
> +                       continue;
> +
> +               /* XXX handle errors */
> +               r = adev->ip_blocks[i].version->funcs->suspend(adev);
> +               /* XXX handle errors */
> +               if (r) {
> +                       DRM_ERROR("suspend of IP block <%s> failed %d\n",
> +                                 adev->ip_blocks[i].version->funcs->name, r);
> +                       return r;
>                 }
> +
> +               adev->ip_blocks[i].status.hw = false;
>         }
>
>         return 0;
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
