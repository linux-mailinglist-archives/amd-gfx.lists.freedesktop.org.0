Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917295F143D
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Sep 2022 22:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B13C10E443;
	Fri, 30 Sep 2022 20:56:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFC710E379
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Sep 2022 20:56:51 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s30so3815875eds.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Sep 2022 13:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=HoSHS1WPkhAwQnOU0Q15dZ32plNGe5b+66u0e0kIc/Q=;
 b=IGe7kZ8LZgS5Z33uB08Hh0ehh5mPe+yxaOQXl6XvzjC82FlydTNbspByqdNd6qcLBF
 kPXKNK1fiuBLoQ+bz8GwuQVMTmK/4KxG0KinCBHyC1CryI0UeZADy0irPfu0G/yBR1/c
 ywDjXTtDDF3nAQlIXE+vxEE0Dm/0mleNDMzio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=HoSHS1WPkhAwQnOU0Q15dZ32plNGe5b+66u0e0kIc/Q=;
 b=xIHRj98qfDiAyb5+zZfuAYTQ0Pj/FR5XRDpdQvW4Q7ddsQHGDsUThFaEL/L8axikYa
 NGTAjs/ixXEblG84O8unOOZNLtIiI/210uJTc3PESz5UBekl5ax28lONJXBCO6B2dRoL
 2EPVR2JrAwAI5ULiodmECEQFIGAaRdgi1QbhH964uakn4R35vGfzD/tPSbtDT+sPb+30
 JSS4gEylHmXesCpppsCNIW8dzY9Gqbs+Y4Qd87ZIgCU0ybb7P97T6GYKovDLlvwN9c5X
 w8k3JbMMX7PdkkBUp/sVpGSzuVQRXG5FFQAUEQdX2JMvQ1061MEvzyc7L8lGpjx+274V
 aaFg==
X-Gm-Message-State: ACrzQf2iWIxIRKjFxsSX/9mHgLFNqN+48e+8EX5gTY7th3Gtqt72kNR4
 ll0CG7bGd0TzfdEGB+AgXh8dNg==
X-Google-Smtp-Source: AMsMyM5UmNdf71SVJYAyX9dUKbqgoy5ALsM6xWnh4LIL0QaMhJbFbwsckxbpw8k1Vz99EjxoHzJ8SQ==
X-Received: by 2002:a05:6402:26d2:b0:451:5a8c:346b with SMTP id
 x18-20020a05640226d200b004515a8c346bmr9058307edd.424.1664571410001; 
 Fri, 30 Sep 2022 13:56:50 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 cb15-20020a0564020b6f00b004576e3aee69sm2338148edb.4.2022.09.30.13.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 13:56:48 -0700 (PDT)
Date: Fri, 30 Sep 2022 22:56:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [pull] amdgpu drm-fixes-6.0
Message-ID: <YzdYDmNLWBN3PMFq@phenom.ffwll.local>
References: <20220930135810.6156-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930135810.6156-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: daniel.vetter@ffwll.ch, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Sep 30, 2022 at 09:58:10AM -0400, Alex Deucher wrote:
> Hi Dave, Daniel,
> 
> Sorry, some last minute changes to deal with updated firmwares/bioses and
> board revisions containing new IPs added in this cycle.  It required
> pulling in some cleanup patches for the RLC firmware handing, but they
> are only applied to GC 11 in this case.  I figured that would be cleaner
> then a bunch of local fixes that would cause merge conflicts for -next,
> and time was getting short for 6.0. They are only applied to GC 11, so no
> chance of regression on existing asics.
> 
> The following changes since commit 83ca5fb40e758e0a0257bf4e3a1148dd52c6d0f2:
> 
>   drm/amd/display: Prevent OTG shutdown during PSR SU (2022-09-29 10:07:42 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.0-2022-09-30
> 
> for you to fetch changes up to 5369e662f99087b4ad38b151aaefecb690117f10:
> 
>   drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode (2022-09-29 15:22:31 -0400)
> 
> ----------------------------------------------------------------
> amd-drm-fixes-6.0-2022-09-30:

dim isn't entirely happy:

dim: 5369e662f990 ("drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode"): committer Signed-off-by missing.
dim: dd00f3eeba5b ("drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx"): committer Signed-off-by missing.

Can you pls respin?
-Daniel

> 
> amdgpu:
> - VCN 4.x fixes
> - RLC fixes for GC 11.x
> 
> ----------------------------------------------------------------
> Hawking Zhang (8):
>       drm/amdgpu: save rlcv/rlcp ucode version in amdgpu_gfx
>       drm/amdgpu: add helper to init rlc fw in header v2_0
>       drm/amdgpu: add helper to init rlc fw in header v2_1
>       drm/amdgpu: add helper to init rlc fw in header v2_2
>       drm/amdgpu: add helper to init rlc fw in header v2_3
>       drm/amdgpu: add helper to init rlc fw in header v2_4
>       drm/amdgpu: add helper to init rlc firmware
>       drm/amdgpu/gfx11: switch to amdgpu_gfx_rlc_init_microcode
> 
> Sonny Jiang (2):
>       drm/amdgpu: Enable VCN DPG for GC11_0_1
>       drm/amdgpu: Enable sram on vcn_4_0_2
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h   |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c   | 264 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h   |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |   4 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c    | 151 +----------------
>  drivers/gpu/drm/amd/amdgpu/soc21.c        |   1 +
>  7 files changed, 281 insertions(+), 149 deletions(-)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
