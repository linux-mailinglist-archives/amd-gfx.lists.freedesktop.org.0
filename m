Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD391B4EFA
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2020 23:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE230892A8;
	Wed, 22 Apr 2020 21:16:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32A2892A8
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2020 21:16:30 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u127so4237460wmg.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2020 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v2cT0nMRSdLPFUjUv5tzpfvlXI3hYZCtEdVsuXcRXR8=;
 b=dTBbOQT7QIg1oslT/QzFx0K41btpyhun+wpUpU8z5KRTkyIdvBp4ahu3YrMxWWBLkg
 YaSbXaUjsJPo0qtcKkAWC2tCFus2LQ0e99SJqdt2phfxQ5cx5sKlhqbhxSdnrI9rjWzU
 rfFogBWqad8F9Kq4uqEByDn/OlBCv8hbPdPoBQ6qCYerzQvRaSDU4KpNfPYoMBMrTA1V
 PYmnDLPG7dN37xN3o+p0t4Q9DH7hsaINYfroxY60c/ItDNNxzp4dca1kH0BYIBFmkJL/
 upCj8p5DGVPhhZxUG7xOnZClUfBH2S8hu6NHx5AaMqbCKAg1K7WaYj33hY4hxm5Jx1/I
 gc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v2cT0nMRSdLPFUjUv5tzpfvlXI3hYZCtEdVsuXcRXR8=;
 b=udvMte5g3eN2rEDpQAfSFRV5B1Oxe0J24fWtonSh0LBaEm6PCrZ2Nf1vfp/UpAz/qO
 3bkKep1FUTrwalXOJ1CMAvk5hGRKyfj6/RLVRDSfcFvqjmD4pxnpqbqQ06T3SnVKm2xP
 Ip8Li8oxRp0VunT71TGKuTGDa5er/KWeRM/56r6cQDXsp8OmSwL6ELRBy5BKkdOt1AOM
 HQououcVH8hZlK5uA59L1zarNPZWMaAd0CEvc0eyA7zfuBziF2xDihCaym40mblo1jsI
 qPYVF31uWoPkcYXw+EY0Q3ef6+gs3dvZ82Fk+88MXYjFsKNZUxbqHFOB2W5ELd3jNqeY
 nhKA==
X-Gm-Message-State: AGi0PuaPNAxOjNLFD0PDFUU+XnkyoufRlbgfQQE7j9YN4MZWmA7x/WmH
 RMqz26b2M/9F2Ok/rHysOKSi9e4VMz7CB16mBj8yXA==
X-Google-Smtp-Source: APiQypLU7g4QN74fWbZ2oqLzNnDh+IePQwobwjbBiZTjUsGc0LwfENDYZtlRId2V1UAfaEuDGUqKrH/QaGKZ+rM1Ac8=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr432814wme.79.1587590189590; 
 Wed, 22 Apr 2020 14:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200422090119.4692-1-limingyu@uniontech.com>
In-Reply-To: <20200422090119.4692-1-limingyu@uniontech.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Apr 2020 17:16:18 -0400
Message-ID: <CADnq5_P2SV-iXbJQEy5SELprz5qP+SgxHuX8S+bF=CNjasvmnw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Init data to avoid oops while reading
 pp_num_states.
To: limingyu <limingyu@uniontech.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 zhoubinbin <zhoubinbin@uniontech.com>, dujiangqi@uniontech.com,
 zhangyueqian@uniontech.com, caizhaopeng@uniontech.com, honghao@uniontech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 9:13 AM limingyu <limingyu@uniontech.com> wrote:
>
> For chip like CHIP_OLAND with si enabled(amdgpu.si_support=1),
> the amdgpu will expose pp_num_states to the /sys directory.
> In this moment, read the pp_num_states file will excute the
> amdgpu_get_pp_num_states func. In our case, the data hasn't
> been initialized, so the kernel will access some ilegal
> address, trigger the segmentfault and system will reboot soon:
>
>     uos@uos-PC:~$ cat /sys/devices/pci0000\:00/0000\:00\:00.0/0000\:01\:00
>     .0/pp_num_states
>
>     Message from syslogd@uos-PC at Apr 22 09:26:20 ...
>      kernel:[   82.154129] Internal error: Oops: 96000004 [#1] SMP
>
> This patch aims to fix this problem, avoid that reading file
> triggers the kernel sementfault.
>
> Signed-off-by: limingyu <limingyu@uniontech.com>
> Signed-off-by: zhoubinbin <zhoubinbin@uniontech.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> index abe94a55ecad..17de9dc60ea1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> @@ -444,8 +444,10 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
>                 ret = smu_get_power_num_states(&adev->smu, &data);
>                 if (ret)
>                         return ret;
> -       } else if (adev->powerplay.pp_funcs->get_pp_num_states)
> +       } else if (adev->powerplay.pp_funcs->get_pp_num_states) {
>                 amdgpu_dpm_get_pp_num_states(adev, &data);
> +       } else
> +               memset(&data, 0, sizeof(data));
>
>         pm_runtime_mark_last_busy(ddev->dev);
>         pm_runtime_put_autosuspend(ddev->dev);
> --
> 2.20.1
>
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
