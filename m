Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182231F9DE1
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2020 18:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA626E4A2;
	Mon, 15 Jun 2020 16:54:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A316E4A2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 16:54:50 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id r15so262070wmh.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2020 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QYRIvEyVSPQMEvYsOBrI+5vg8pTBA86JG4mG79tS2ug=;
 b=rufny+kz29smVqH6T06KWipOwAzhCLFQNTQv/Pw/zIuSyhSdwSuPsUwCG8PnG+kNmh
 ru7BeG+iCUSQR3uvwEhfDs+QZDmwlp3M4HgTVeYzTJbTRRIn733i8KuMFIdoIZAbT93e
 lXzDQVo1ncMvO5YuOm0+tV6QIdWmQJDeJ7L2Rk9DBNfhg6ErGtQ98QoawXa9jOSz9OfV
 9jMPRlVWNIk4qMhxRYVBsZApU9ElLCQxs0XTJvudMUpLqS2/Vg/ZfZZ1pzXlPomvWhjs
 aXsRrLq8YtOJffHAW0j3wKXPGeTMxbVzBYxCCIxv5YqfKAEJALKY+Gxvdvn/6gWrH0Mf
 0Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QYRIvEyVSPQMEvYsOBrI+5vg8pTBA86JG4mG79tS2ug=;
 b=FPD//479KvoagOWkk/kjuYZ9aWMfqqkrBQc1yyzT021CT3OXjwDWb52u5WoyeG7br7
 Cepy+mR5kFfrez4hCPKNUut6XJvIKZ1FG/dGKY35KA9HD3QBWjDF9sSBg9mK1MXop5ot
 eM7qss9jV7usuNQTNWGUaMDLoWRgIYiT1sjit1SjxkTzV7wpX56o/iYIlWFAxgglCbjt
 zrsLpYwm2pVmCyfYvLmzXRlP/3EEG31/s85KWJiSuW9jNgYVLSv800+FWFy4ubCNnx0a
 Yls3dPbhwwS+h9kV40PFw4CvmIj6CLBw/JSTHXk6tHBiPyvyv4rTWJhzZ+GioCZLQjDn
 02wA==
X-Gm-Message-State: AOAM531NjMQQhpuIvNVVCtoi6Kt6j3hCCzXnZnt/9VPO3PP+V+etESpC
 RM94Q08MaT6ST2BZAopkRL6z6uBVmkxORVEYqQWz3Q==
X-Google-Smtp-Source: ABdhPJwXWUogN+snOBel94l3aciXfTNJ+UHxxs7840dxR34n82lm/jBD45gRW00diB1MRz7uKom6WrSdEwgDxaq2L+8=
X-Received: by 2002:a1c:32c4:: with SMTP id y187mr234535wmy.79.1592240089336; 
 Mon, 15 Jun 2020 09:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200615161824.164285-1-tom.stdenis@amd.com>
In-Reply-To: <20200615161824.164285-1-tom.stdenis@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2020 12:54:38 -0400
Message-ID: <CADnq5_P5WfraZuPm_uuR2qpn3tBoaAWS8m5+0FHL9RwvxZS1pg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix SQ_DEBUG_STS_GLOBAL* registers
To: Tom St Denis <tom.stdenis@amd.com>
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

On Mon, Jun 15, 2020 at 12:18 PM Tom St Denis <tom.stdenis@amd.com> wrote:
>
> Forgot to subtract the SOC15 IP offsetand add the BASE_IDX values.
>
> Signed-off-by: Tom St Denis <tom.stdenis@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h   | 6 ++++--
>  .../gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h   | 6 ++++--
>  drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_0_offset.h  | 9 ++++++---
>  drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_offset.h  | 9 ++++++---
>  .../gpu/drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h    | 9 ++++++---
>  5 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> index aab3d22c3b0f..baac40fa70e7 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> @@ -21,8 +21,10 @@
>  #ifndef _gc_10_1_0_OFFSET_HEADER
>  #define _gc_10_1_0_OFFSET_HEADER
>
> -#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x2309
> -#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x2310
> +#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x0309
> +#define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
> +#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x0310
> +#define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
>
>  // addressBlock: gc_sdma0_sdma0dec
>  // base address: 0x4980
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> index 16c7f6f2467e..0bde3b4e9567 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_3_0_offset.h
> @@ -22,8 +22,10 @@
>  #ifndef _gc_10_3_0_OFFSET_HEADER
>  #define _gc_10_3_0_OFFSET_HEADER
>
> -#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x2309
> -#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x2310
> +#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x0309
> +#define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
> +#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x0310
> +#define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
>
>  // addressBlock: gc_sdma0_sdma0dec
>  // base address: 0x4980
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_0_offset.h
> index e3e1a9c1153b..12d451e5475b 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_0_offset.h
> @@ -21,9 +21,12 @@
>  #ifndef _gc_9_0_OFFSET_HEADER
>  #define _gc_9_0_OFFSET_HEADER
>
> -#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x2309
> -#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x2310
> -#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x2311
> +#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x0309
> +#define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
> +#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x0310
> +#define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
> +#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x0311
> +#define mmSQ_DEBUG_STS_GLOBAL3_BASE_IDX                                                                0
>
>  // addressBlock: gc_grbmdec
>  // base address: 0x8000
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_offset.h
> index 6b1ad9082a2c..d17d1e622e4f 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_1_offset.h
> @@ -21,9 +21,12 @@
>  #ifndef _gc_9_1_OFFSET_HEADER
>  #define _gc_9_1_OFFSET_HEADER
>
> -#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x2309
> -#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x2310
> -#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x2311
> +#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x0309
> +#define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
> +#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x0310
> +#define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
> +#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x0311
> +#define mmSQ_DEBUG_STS_GLOBAL3_BASE_IDX                                                                0
>
>  // addressBlock: gc_grbmdec
>  // base address: 0x8000
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h
> index f377354e850e..c30720277912 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_9_2_1_offset.h
> @@ -21,9 +21,12 @@
>  #ifndef _gc_9_2_1_OFFSET_HEADER
>  #define _gc_9_2_1_OFFSET_HEADER
>
> -#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x2309
> -#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x2310
> -#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x2311
> +#define mmSQ_DEBUG_STS_GLOBAL                                                                          0x0309
> +#define mmSQ_DEBUG_STS_GLOBAL_BASE_IDX                                                                 0
> +#define mmSQ_DEBUG_STS_GLOBAL2                                                                         0x0310
> +#define mmSQ_DEBUG_STS_GLOBAL2_BASE_IDX                                                                0
> +#define mmSQ_DEBUG_STS_GLOBAL3                                                                         0x0311
> +#define mmSQ_DEBUG_STS_GLOBAL3_BASE_IDX                                                                0
>
>  // addressBlock: gc_grbmdec
>  // base address: 0x8000
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
