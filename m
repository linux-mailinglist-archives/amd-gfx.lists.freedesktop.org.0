Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642B26F276
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Sep 2020 05:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A91D6EC8D;
	Fri, 18 Sep 2020 03:00:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8466EC8D
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 03:00:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w2so3835212wmi.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Sep 2020 20:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGZkd+X0/XNHZVlX4lKBZwOacgGygGaE1zncjXo+8eo=;
 b=TNlpxerOTJGjRpHuEVpFiWWAU0MRPgK2Iyd1Gy21HLfAqiHKpZYtIiJizJANznqeWQ
 NvuXcK59wZfkKqahLMuHlBI5AfTuDHmf5Bjg8mNPaqjOCoMazCC7u8UVgRddNbIqnURF
 2eyVlMWxjW/cw5NEG34ku2DfnuRzv7SdvP3SimUcJ4GDs4sYk3uoaX0OZMnMirPHAgP9
 CCCy/HCtySLXyKQPbNd/ai358uDU3tTiGRg3gTprnc7lm/YIL7GNLyT8M2UGDCtiqwsn
 v9kX2BF6oqzLSHYfwbukxVGLDkVQh2c4mFNSOQuP9bcfIEgiMhntprcE0m+5x5otT1ka
 7jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGZkd+X0/XNHZVlX4lKBZwOacgGygGaE1zncjXo+8eo=;
 b=M8FLWEUNV8VLmPLkFIOSXzPCBVT7Z131chzWiQ/B8G40Qaux9hgEpDN87jSdBKIo1C
 MyE00ptMYOnbN3EYYF1tGb0RqKdtNUu1LDwxa3N//yYQYvX9oQ6cC3O2DxqyfJY8eU2Q
 uUOSmobYjNA2ue0+YeQ7MWVuAHr9F6SjDRqAegaIF2gcdknqpsOXd3vsfUGOUrTgEI8G
 PzQhFogblmj00lXjObLZPiSe1hv76H9v3cx+QolDSxLjQT6pj8wS7W8xm2Tdudj2zZ+7
 PG5BUFsaQuLnOUm9a6QOMyS2auSC94vsm77w2kggBnTxnd5iWPMl+ghPXG7xoTWcUcSJ
 BUew==
X-Gm-Message-State: AOAM533IDhv310/zc2Xr/qP3RHmlTOvfpPfQRO6c92VephU2xXyQ2KAz
 xZUiJ4KrzRFt0epg365cPzveikOBejJHrfipdGc=
X-Google-Smtp-Source: ABdhPJz6Vywdi0uo0+agcH1/chB8UtnLFdm24ZwhknrvTS2QbVU3t/S2pz/FSh57Da4FNHGLkR2Ph96IGrEQspubMgo=
X-Received: by 2002:a7b:c141:: with SMTP id z1mr13473024wmi.79.1600398038056; 
 Thu, 17 Sep 2020 20:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200917221324.520327-1-luben.tuikov@amd.com>
 <20200917221324.520327-2-luben.tuikov@amd.com>
In-Reply-To: <20200917221324.520327-2-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Sep 2020 23:00:26 -0400
Message-ID: <CADnq5_MzYXViQOiCSyPHn8=BcB=Ju5+8PGqfHSAXGSYbVCpT2Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Sep 17, 2020 at 6:13 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> Convert to using devm_drm_dev_alloc(),
> as drm_dev_init() is going away.
>
> v2: Remove drm_dev_put() since
>     a) devres doesn't do refcounting, see
>     Documentation/driver-api/driver-model/devres.rst,
>     Section 4, paragraph 1; and since
>     b) devres acts as garbage collector when
>     the DRM device's parent's devres "action" callback
>     is called to free the container device (amdgpu_device),
>     which embeds the DRM dev.
>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 3f07d1475bd2..8d658d2a16fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1159,25 +1159,20 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 return ret;
>
> -       adev = kzalloc(sizeof(*adev), GFP_KERNEL);
> -       if (!adev)
> -               return -ENOMEM;
> +       adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
> +       if (IS_ERR(adev))
> +               return PTR_ERR(adev);
>
>         adev->dev  = &pdev->dev;
>         adev->pdev = pdev;
>         ddev = adev_to_drm(adev);
> -       ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
> -       if (ret)
> -               goto err_free;
> -
> -       drmm_add_final_kfree(ddev, adev);
>
>         if (!supports_atomic)
>                 ddev->driver_features &= ~DRIVER_ATOMIC;
>
>         ret = pci_enable_device(pdev);
>         if (ret)
> -               goto err_free;
> +               return ret;
>
>         ddev->pdev = pdev;
>         pci_set_drvdata(pdev, ddev);
> @@ -1205,8 +1200,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>
>  err_pci:
>         pci_disable_device(pdev);
> -err_free:
> -       drm_dev_put(ddev);
>         return ret;
>  }
>
> @@ -1223,7 +1216,6 @@ amdgpu_pci_remove(struct pci_dev *pdev)
>         amdgpu_driver_unload_kms(dev);
>         pci_disable_device(pdev);
>         pci_set_drvdata(pdev, NULL);
> -       drm_dev_put(dev);
>  }
>
>  static void
> --
> 2.28.0.394.ge197136389
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
