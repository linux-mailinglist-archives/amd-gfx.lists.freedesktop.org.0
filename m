Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 626A8151E8E
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Feb 2020 17:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C267B89DB7;
	Tue,  4 Feb 2020 16:54:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB2789DB7
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Feb 2020 16:53:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m16so23951559wrx.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 04 Feb 2020 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9BX3lKMiB84DZa6iKawgAaPfT8fDloPUQu5rhyRBGTM=;
 b=KexPIN4t/JZ0p86IuiYQYzeL8A0bSM5Wvp2ebw41rw1N7GZbS8yeCQ75V8L95Rh5P+
 6f41HXEcvo2vRNzRM+B3K/Veikq8Q2/H7XyOin4uiuxXYT0oa4eITHPcKpWBn8vjCqQF
 +z7a1WekQO7XFXjG42Neho6T/BWwt2zkZTTpO9YIWSOrIjR6CRHrSyDD0Aam/QiZeccS
 OtRG+yDmpa6839vtot5tC+qsOUgXOYOEPBEShmRo7cwJKKlTZMU80qIzQKz1PuTkc+nI
 5iDfA2T3KUYKj/5f9FQpoOfKg8hGrl/EqcC+yzINiJx7sLuvyRwr6mFGb/s9I6a1eKuU
 DdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9BX3lKMiB84DZa6iKawgAaPfT8fDloPUQu5rhyRBGTM=;
 b=jmUEVIgrA0pM2iWJe8i4t3tJSuFRS3+SZzYPzXcIIF9/3876Gf3/61PS3Rr/+EhnpS
 guQym+qpdox6FXWLNb80djzj/aLcv9CopyGkdabC9Xw4c2Ic7Ny0ClA9ZilgUNho3yKj
 3b64s30vBYTT+ADdTJ1lYWSswSxdXosxgRVx4d5ihtKx91onwRZ6hj4vcXWFLnRLm7w1
 HWPbzX9MsZ8ppT+djopK5JUnArrm7MU7X4VZlTkA7xpMkym1fv2ZGuS7dNMzXK28csg+
 alrrTMEzCDp/QULw0FmgM4wlAjslEkmBaxAu/7OtYLhSdBrj/xwNZ0Jii68HGspLrAmw
 8tjA==
X-Gm-Message-State: APjAAAUXyUUcbbJIsIlnA6YHmGU9E3yjm61kJ1uEFRXtt4+NsVPR7fhO
 QTkoKvW7F5Ryy32qiAv1BiUZNsE0W54Xg8RnTdw=
X-Google-Smtp-Source: APXvYqxBRDVTPdcgWuRhiIlbZmATngtxo+ZK6lQv76ZHYMxxF/1CeQAVyyQd0QJBgppurndmCEleritxRnsm2PlgLjY=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr24427073wrn.124.1580835238170; 
 Tue, 04 Feb 2020 08:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20200204145122.46353-1-nirmoy.das@amd.com>
In-Reply-To: <20200204145122.46353-1-nirmoy.das@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Feb 2020 11:53:47 -0500
Message-ID: <CADnq5_O78RiDRehdnhrR0pR7um2LnHQeuZoGeB_eHYs=AJraPw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix empty return on non-void function
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, nirmoy.das@amd.com, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Min, Frank" <Frank.Min@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Feb 4, 2020 at 9:49 AM Nirmoy Das <nirmoy.aiemd@gmail.com> wrote:
>
> This fixes empty return on non-void function, amdgpu_xgmi_remove_device
>
> Fixes: b80574252499e (drm/amdgpu: move xgmi init/fini to xgmi_add/remove_device call)
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> index 78989e9560d1..490f57d6704c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
> @@ -463,11 +463,11 @@ int amdgpu_xgmi_remove_device(struct amdgpu_device *adev)
>         struct amdgpu_hive_info *hive;
>
>         if (!adev->gmc.xgmi.supported)
> -               return;
> +               return -EINVAL;
>
>         hive = amdgpu_get_xgmi_hive(adev, 1);
>         if (!hive)
> -               return;
> +               return -EINVAL;
>
>         if (!(hive->number_devices--)) {
>                 amdgpu_xgmi_sysfs_destroy(adev, hive);
> --
> 2.25.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
