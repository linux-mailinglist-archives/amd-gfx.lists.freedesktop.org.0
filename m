Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E396C44BB38
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Nov 2021 06:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B5C6E02F;
	Wed, 10 Nov 2021 05:26:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D35F6E02F
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Nov 2021 05:26:49 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bl27so3230460oib.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 09 Nov 2021 21:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1DFCjU/o2KpygSlrWJ4Jj5cD6fiG4AZIwWsSV7vuDY=;
 b=GmHfyTE/+aVCGt2oh5j8ncuUHMAIPomC+OrWp2RNfeLs+StTgTNOD+h76vtW2P+ERa
 q5W25eO7caYilD2a/rOXxYPVnR6KgmpKdNudmWQFlvJSNtU+NuaJHG462ad7ZFhTVO+A
 vQH5+rFd4vIXxlOntPuon1cn+xx6T/r5DwVZuM8JF6uAL6Wm2mPquHHCDMWPBFPID7B0
 qRLKCn6vjqTWyJ9lQXFdNg/32KacC3wYiZAwfQPnq5I2Oa8WTd7HN1uCwnoZjTLEBaGq
 Wb4qaMSvzHDXVDxaifHv3dMjln9rbLDKZEpdOhA2Uibx6Hd3qwl0F3LqAbjFnkvp1Frn
 UjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1DFCjU/o2KpygSlrWJ4Jj5cD6fiG4AZIwWsSV7vuDY=;
 b=nl6gsX55WUjXCwDfm+WWq9VGZTQGnwm/3VhRn5bmkmk5f6/Hbnl/i3p2koby6i5pJj
 Rkqpd0TSJmVgaNzql7pinrq/VF6bgRwsaMrnxIUWcAjsdzlWIXpr63kVA8Xp4DEftWEE
 GHud7qQ0NGcb2wRrhvFBsvBEWj84RRRzRFJufrwNuzIu9Y4JkxycZtR3d34D7zZdHFLX
 yMT6llE0vqgF5iWhN5rYmqGXbG4dN2v0W9Dxa4RNm0bq7r0mZEgAdkSbAPpWHhUVpYCn
 1rlgCHrcjuo0ek9Oy5gp+vgCaD1V8dg0XsBamSMHyq5qUnJLHnCB5puUb50ttcXNaqJh
 ys7w==
X-Gm-Message-State: AOAM533+IB2RABtkubJmj5cMeGaVNwAvJ83Ply1pf18Ts1cf5W+k4cMP
 BqOkarIjIc4VNHrzA7sGxyloMnvUrOm0S8PaxjY=
X-Google-Smtp-Source: ABdhPJzN6dI16aBmOgyonoPWdm9LaTN0Sxl1rDbaYi+c5EDzlY+ogHLk3gFAEf/Iw2tH2f6E2vtDVTqovM89hQ49ZRQ=
X-Received: by 2002:aca:3f87:: with SMTP id m129mr10756190oia.5.1636522008666; 
 Tue, 09 Nov 2021 21:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20211110051608.32696-1-guchun.chen@amd.com>
In-Reply-To: <20211110051608.32696-1-guchun.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 10 Nov 2021 00:26:37 -0500
Message-ID: <CADnq5_MV9EAGAg=mMFCjK7y6cBLjyUCFM5BDnEAcmxGt0BsoFw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add missed support for UVD IP_VERSION(3, 0,
 64)
To: Guchun Chen <guchun.chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Flora Cui <flora.cui@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Nov 10, 2021 at 12:16 AM Guchun Chen <guchun.chen@amd.com> wrote:
>
> Fixes: 5b30f206dbd1("drm/amdgpu/amdgpu_vcn: convert to IP version checking")
> Signed-off-by: Flora Cui <flora.cui@amd.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 1 +
>  drivers/gpu/drm/amd/amdgpu/nv.c               | 1 +
>  3 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index a20d21409c95..ff70bc233489 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -882,6 +882,7 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
>                         break;
>                 case IP_VERSION(3, 0, 0):
>                 case IP_VERSION(3, 0, 16):
> +               case IP_VERSION(3, 0, 64):
>                 case IP_VERSION(3, 1, 1):
>                 case IP_VERSION(3, 0, 2):
>                         amdgpu_device_ip_block_add(adev, &vcn_v3_0_ip_block);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index 2658414c503d..4f7c70845785 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -134,6 +134,7 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
>                         adev->vcn.indirect_sram = true;
>                 break;
>         case IP_VERSION(3, 0, 0):
> +       case IP_VERSION(3, 0, 64):
>                 if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(10, 3, 0))
>                         fw_name = FIRMWARE_SIENNA_CICHLID;
>                 else
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index febc903adf58..59eafa31c626 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -182,6 +182,7 @@ static int nv_query_video_codecs(struct amdgpu_device *adev, bool encode,
>  {
>         switch (adev->ip_versions[UVD_HWIP][0]) {
>         case IP_VERSION(3, 0, 0):
> +       case IP_VERSION(3, 0, 64):
>                 if (amdgpu_sriov_vf(adev)) {
>                         if (encode)
>                                 *codecs = &sriov_sc_video_codecs_encode;
> --
> 2.17.1
>
