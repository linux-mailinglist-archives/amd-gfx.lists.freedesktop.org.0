Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528033F2CF4
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Aug 2021 15:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CFF6EA8D;
	Fri, 20 Aug 2021 13:14:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0CE6EA8D
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 13:14:00 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso13414415ott.13
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Aug 2021 06:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cCZQCe/LjHs2VC1tn+je/m66X/RBbB8B23atdfrtw0Q=;
 b=to7WYXPpAj58xZPaB4e3mczwNpWCmBH6YXgBi/Z8DIQmqkdZIsROKywCQJlyjkqtHb
 DQGAEJlP8SsK4w8iShOni46gfD8ocDOs0QZDJRmk4qrc+lsjLM3gwCi13/arI7WQDOe2
 3p+zOsDlmbE8JuWafcYtkYdM17bWDn7km2Ji095ST5QZZZEVN3iAEvkOErt1NkEFg0Zf
 fih6J1kz83iSCPajF3/ZWcWxy2cxq+0NhVFuxpp52zwThZk/FMyX+BGN2+jcYHAp0yOo
 xyIjefWjQsaNm1GY3MUaLkItm3mg/PO6PQbGuDMzEpOpZhiYtbLl45x+6xrT3V4QFx1K
 8w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cCZQCe/LjHs2VC1tn+je/m66X/RBbB8B23atdfrtw0Q=;
 b=TZvpOyoMApmHFn9FG2dt8XIkaz9XtwccWwGtlZoxIWxwYEp2yTOai61GHpAkhcgiQk
 bgBKlkQKLAvh7N5K6Y5loB5Ww75e/HyCbM0o6bNdSZtZnvFLCXoVxF9dKigRth1qcqS7
 qcQ4XTqcB+aegoV34I7SitTIMwl4fuOuTc6CvQni5jHVeidPavFvItwggB+xH+59a44U
 lq2zSmUlztSNwYjqxCCm+a7dpfaJnfDlf9mcHxVEM+ZO0K4tZYJUOZM0dBYA0R7YpFI9
 iqsTIRK8lB96YgGmlAmJsmflGbQiVhUjDl9Xx2PTaW3evDEU1Blfo6aSEqsrpbTyVEVg
 4LIw==
X-Gm-Message-State: AOAM532Ve9hOZJ7AlOn1ZUZ79Vwx4BGWUP5ANi5RrcopBIJ3NmOTJYGE
 zvId2rXAOS38oN8ilsfmZLS6NjhuI3YwDM/CTgc=
X-Google-Smtp-Source: ABdhPJxyGXOirO0B9cc9NMEfsP0pVtuXIg7Y4hPQdmh4gkp9GgeFYi3WfuBWYHTotMyAtfVA+jQlosMXFocO+RfafDM=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr4050330otf.311.1629465239916; 
 Fri, 20 Aug 2021 06:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210820083031.1533-1-christian.koenig@amd.com>
In-Reply-To: <20210820083031.1533-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Aug 2021 09:13:49 -0400
Message-ID: <CADnq5_Md338tWSdrC39Ke78ZyJ+TukB9FZqmdNdgFWpeXO-Hww@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use the preferred pin domain after the check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 20, 2021 at 4:30 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> For some reason we run into an use case where a BO is already pinned
> into GTT, but should be pinned into VRAM|GTT again.
>
> Handle that case gracefully as well.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 795fa7445abe..92c8e6e7f346 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -920,11 +920,6 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u=
32 domain,
>                         return -EINVAL;
>         }
>
> -       /* This assumes only APU display buffers are pinned with (VRAM|GT=
T).
> -        * See function amdgpu_display_supported_domains()
> -        */
> -       domain =3D amdgpu_bo_get_preferred_pin_domain(adev, domain);
> -
>         if (bo->tbo.pin_count) {
>                 uint32_t mem_type =3D bo->tbo.resource->mem_type;
>                 uint32_t mem_flags =3D bo->tbo.resource->placement;
> @@ -949,6 +944,11 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u=
32 domain,
>                 return 0;
>         }
>
> +       /* This assumes only APU display buffers are pinned with (VRAM|GT=
T).
> +        * See function amdgpu_display_supported_domains()
> +        */
> +       domain =3D amdgpu_bo_get_preferred_pin_domain(adev, domain);
> +
>         if (bo->tbo.base.import_attach)
>                 dma_buf_pin(bo->tbo.base.import_attach);
>
> --
> 2.25.1
>
