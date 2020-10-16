Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BE28FC85
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Oct 2020 05:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4532F6E88C;
	Fri, 16 Oct 2020 03:02:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F746E88C
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Oct 2020 03:02:16 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j136so1261594wmj.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Oct 2020 20:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmnqTi+G3o3yhYgTs1+2+UTtkRW08OX4zEmfU+3DjS8=;
 b=d+TtQDil31mQKFTsJFRG7VJHFwYMdNXQ9UYOHHjJTe9Ea0Go3zMdpbmSDI+e3PZHyd
 7l8fMEDHq24evAEFxqPh9SVH1H7gl+Jq6BfFH5gc26bfEl4jPalIBMEvWItpQPHEXx7R
 QQZAHPsRaERlxtxqk8E/Tz7KvEC/4b1AOMYgx8ZNSBfdi84c3R6Phx6d+XNfzoUVa20y
 Jz7q35lEM+atBQFfKh8B2c+G9O9o05ee+9aK6XeSh1IzVFMJwSpfxi/dhfflRoBOfFJG
 f2cBs/e2yFDf4y2TNOw1ubaND2V0n180RRK5LMkMEnUzlabQmfY6xz+GbZvbQoBzB9wX
 V+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmnqTi+G3o3yhYgTs1+2+UTtkRW08OX4zEmfU+3DjS8=;
 b=g3iqrO3ydTTBF9nuIjB/X+ag9/tRyyT9mtzW5+I2U45MNFx+8J5s9FnKQqRJHINM3J
 GqPNEGaD/s8qV5jeRV4ap9I395bQuY9uPeCpjlLdmwRr3Mhv2uWvBpyfgjm81LzeBMjU
 Z3eRPMjvP9AaHox9XfhwoE2zME7kpJBM+pkOSBIgHjl92Ma9DnP7M77YII7e7X+5f4QX
 h4RRnRtE3yrAPQhK2xBMHZBYaRW0oDSs/eE6Hy5NvCehce/uypVKtnApgCAzRHPA/NdU
 1o2wfroldO0mBhBXmoG5NZk002n3TA1LsEIbXVlnjo6ELgiKewupT2GIluq2vXDNc9te
 rFdQ==
X-Gm-Message-State: AOAM533NKl7VPUQ3NXFqX8d0R/E89spHsSLZ8x2pmKI9DEGTBK2sguKH
 2VNgsbCXH0s6+w4kTVjODCsVkWcrCuT64HyjFUI=
X-Google-Smtp-Source: ABdhPJwgfigdc/SvidGZpKu3feftBjgJyX3vFHkl84AABD6+h8PRKIz2YvS11KDThbp6YTz17cPWLeo5tiW/A4fw5Ks=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr1447930wmk.73.1602817335659; 
 Thu, 15 Oct 2020 20:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <1602696294-5611-1-git-send-email-andrey.grodzovsky@amd.com>
 <1602696294-5611-2-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1602696294-5611-2-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Oct 2020 23:02:04 -0400
Message-ID: <CADnq5_O=kSbhuBNTjYiMUp8kwgBfU4XUEULAtYEhJz6rE4hyXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Avoid MST manager resource leak.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
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
Cc: xinhui pan <xinhui.pan@amd.com>, "Wentland, Harry" <harry.wentland@amd.com>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 14, 2020 at 1:25 PM Andrey Grodzovsky
<andrey.grodzovsky@amd.com> wrote:
>
> On connector destruction call drm_dp_mst_topology_mgr_destroy
> to release resources allocated in drm_dp_mst_topology_mgr_init.
> Do it only if MST manager was initialized before otherwsie a crash
> is seen on driver unload/device unplug.
>

Not really an mst expert, but this seems to match what i915 and
nouveau do.  Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a72447d..64799c4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5170,6 +5170,13 @@ static void amdgpu_dm_connector_destroy(struct drm_connector *connector)
>         struct amdgpu_device *adev = drm_to_adev(connector->dev);
>         struct amdgpu_display_manager *dm = &adev->dm;
>
> +       /*
> +        * Call only if mst_mgr was initialized before since it's not done
> +        * for all connector types.
> +        */
> +       if (aconnector->mst_mgr.dev)
> +               drm_dp_mst_topology_mgr_destroy(&aconnector->mst_mgr);
> +
>  #if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||\
>         defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
>
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
