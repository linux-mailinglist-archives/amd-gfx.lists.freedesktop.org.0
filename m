Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C076C11BD7E
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Dec 2019 20:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF546EBC3;
	Wed, 11 Dec 2019 19:52:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FC06EBC3
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 19:52:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t2so31112wrr.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Dec 2019 11:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C2rVpwUwqRDvrozJsP8VUfiVgi0AUAbn8mDCl5zyJks=;
 b=KwelJYlCfnu2ha+RRVeZVGbRodM18Mqj5HghV3f3L6s12smI2eZJSeSknKJxPMwMge
 PODF7XWguVGXGu5hSp6X9BrvlDMqCc6MTKuhPF4eg9lSHkiZfZuPQ5bq91lh3vKmO8HA
 qivscGKfNSB9JsX+rFFbVujvYhZjseTU7v0B38avYr9qa/nlSJ7hHOaH0iTRHa/cFd9t
 csIpDg0LLLE9TaOsHEvg8GnwVi7LsF6X2txBANdlfi28G7W0ZQcmrc3hKpyiTeyFgQNh
 Cp8YVCgP75HqaziJtOC2HNFILAmSX4iiykbb60HXtuRqgZPnoGbgBFuT+AI/i+Z8bwi4
 Czlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C2rVpwUwqRDvrozJsP8VUfiVgi0AUAbn8mDCl5zyJks=;
 b=U3CkAJw3jfNlC7JV8WC+8ew36GhVYdEwH4+a4UNLWiKwKWvgI3CpcIM02UlDhMRGEl
 tBVY3anq+L2ClTP3hST1i6rFqOGEk2j/Lh/i6czlHy/q1T2nO59qMbHxLp+lkjiq8AUN
 dmLswuj6NS3cg7OqRlx5mkPDBFC3gK+oclXPtWTrZmH8fqx20XGV6BFq24nL3bn2Dqkm
 eamZTNm5+VgCo7B6vN6IoM6QsdQ24+gkBxVgq1KHKDwHeV8wmdh4Uaq6jlaFaOJQ5ZHI
 8dXE/BFAYaCUZmXE0yjwBiDS3abYSNV1HZayS5rb7JYC0u9eV24hB5OtWP3YUPAWaboc
 rgAg==
X-Gm-Message-State: APjAAAVHo3B4AbnouX9AZHHBmSKSvS2gUvDovQ5QEzHYlEskkLnAAbbz
 dEZ2GNSN+i4t1KMTtRu+wTNp4grhE002drZ0XTw=
X-Google-Smtp-Source: APXvYqzI6BTzS9Uvh0Ba6jhARaAYaXPh7+rK3AIj2b83/A6QyT2xFeaJIIbxBbnp/tmBUS0/OKSDKplzTy3U9kKiyjc=
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr1644994wrs.11.1576093942239;
 Wed, 11 Dec 2019 11:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20191211194824.11146-1-leo.liu@amd.com>
In-Reply-To: <20191211194824.11146-1-leo.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 Dec 2019 14:52:10 -0500
Message-ID: <CADnq5_MoHOzDKK2xGBp3JBAZNAOzWEk_csw0ZD8Ubx8PgbUu6A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add JPEG check to VCN idle handler and begin
 use
To: Leo Liu <leo.liu@amd.com>
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

On Wed, Dec 11, 2019 at 2:49 PM Leo Liu <leo.liu@amd.com> wrote:
>
> Since it's only needed with VCN1.0 when HW has no its
> own JPEG HW IP block

typo "HW does not have its own"
With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Signed-off-by: Leo Liu <leo.liu@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 29 +++++++++++++++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h |  2 ++
>  2 files changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 428cfd58b37d..95ac721f2de0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -186,6 +186,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                 }
>         }
>
> +       adev->vcn.has_jpeg_block = (amdgpu_device_ip_get_ip_block(adev, AMD_IP_BLOCK_TYPE_JPEG)) ?
> +               true : false;
> +
>         return 0;
>  }
>
> @@ -306,15 +309,17 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
>                         else
>                                 new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
>
> -                       if (amdgpu_fence_count_emitted(&adev->jpeg.inst[j].ring_dec))
> -                               new_state.jpeg = VCN_DPG_STATE__PAUSE;
> -                       else
> -                               new_state.jpeg = VCN_DPG_STATE__UNPAUSE;
> -
> +                       if (!adev->vcn.has_jpeg_block) {
> +                               if (amdgpu_fence_count_emitted(&adev->jpeg.inst[j].ring_dec))
> +                                       new_state.jpeg = VCN_DPG_STATE__PAUSE;
> +                               else
> +                                       new_state.jpeg = VCN_DPG_STATE__UNPAUSE;
> +                       }
>                         adev->vcn.pause_dpg_mode(adev, &new_state);
>                 }
>
> -               fence[j] += amdgpu_fence_count_emitted(&adev->jpeg.inst[j].ring_dec);
> +               if (!adev->vcn.has_jpeg_block)
> +                       fence[j] += amdgpu_fence_count_emitted(&adev->jpeg.inst[j].ring_dec);
>                 fence[j] += amdgpu_fence_count_emitted(&adev->vcn.inst[j].ring_dec);
>                 fences += fence[j];
>         }
> @@ -358,14 +363,16 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
>                 else
>                         new_state.fw_based = VCN_DPG_STATE__UNPAUSE;
>
> -               if (amdgpu_fence_count_emitted(&adev->jpeg.inst[ring->me].ring_dec))
> -                       new_state.jpeg = VCN_DPG_STATE__PAUSE;
> -               else
> -                       new_state.jpeg = VCN_DPG_STATE__UNPAUSE;
> +               if (!adev->vcn.has_jpeg_block) {
> +                       if (amdgpu_fence_count_emitted(&adev->jpeg.inst[ring->me].ring_dec))
> +                               new_state.jpeg = VCN_DPG_STATE__PAUSE;
> +                       else
> +                               new_state.jpeg = VCN_DPG_STATE__UNPAUSE;
> +               }
>
>                 if (ring->funcs->type == AMDGPU_RING_TYPE_VCN_ENC)
>                         new_state.fw_based = VCN_DPG_STATE__PAUSE;
> -               else if (ring->funcs->type == AMDGPU_RING_TYPE_VCN_JPEG)
> +               else if (!adev->vcn.has_jpeg_block && ring->funcs->type == AMDGPU_RING_TYPE_VCN_JPEG)
>                         new_state.jpeg = VCN_DPG_STATE__PAUSE;
>
>                 adev->vcn.pause_dpg_mode(adev, &new_state);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> index 402a5046b985..9a2381d006c6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h
> @@ -192,6 +192,8 @@ struct amdgpu_vcn {
>         unsigned        harvest_config;
>         int (*pause_dpg_mode)(struct amdgpu_device *adev,
>                 struct dpg_pause_state *new_state);
> +
> +       bool has_jpeg_block;
>  };
>
>  int amdgpu_vcn_sw_init(struct amdgpu_device *adev);
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
