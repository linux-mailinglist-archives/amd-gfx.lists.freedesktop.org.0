Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556791722CE
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Feb 2020 17:06:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC736E918;
	Thu, 27 Feb 2020 16:06:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CF36E918
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Feb 2020 16:06:54 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r17so4063625wrj.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Feb 2020 08:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4r8USTLmnOlLCHC5e9IgZNZNSr/WEW+/sdjjwOCqwI=;
 b=b+kUuDvZzSVJPL1HGfpvE7VlB0xCiV824ywCGCWUdphXx9aoVBmN/fHqziuXtey2pc
 D/fzhTg6njsCVH8T8cUVAkFkgbfqOobyLkqZrbpIgwmKEDqSFDF88Ydkgw4i5XIV+u/a
 ZmRTX/KU6nuni0XxD/AnnRea0n/ljrQ/dCMuHTxwjOpA3FK/E7grFGup+SYygmEWvoug
 FPZUKVGMlWCt0DjWK7TrUtcXeVGpb4hHTgcTQhkOwtK1xmHmMgMC6psdnxjcLEeDiabQ
 DxSahousqP+njavogf6zda4bpoZNnaNpAPI7jGOD6+rLxhk8jpveor3OVhU70y919yZq
 glCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4r8USTLmnOlLCHC5e9IgZNZNSr/WEW+/sdjjwOCqwI=;
 b=EwlkjCpi4bVcbEwoCrv1d4VNbk5kdVolmTHPdmDA+t7R1ggpDcEqueX2icSpzzX2kR
 +w3YX+wTHeAObpCVc74TLWkH9b5vN0aq48LfN//KvT+nylAge5eiL5EIXvv3qnlAlyGy
 B9n2VrH76malwG+sNRkeJOJM4sKYZ6lru55dfoxmXwKWgxrFjr08E+PruZ3+yy0IFXtG
 rt4Facmr1rVqVEVT552rrzxOwtq7/AagLSDRkHPb9AyPX8L3Soe8mzeEs4+1ffGx6dHn
 Lmpn9+Jk1ffe87LBthy4hqP/91Db8D6UEGfKKHJRXkcyZG/lYlC99Z/KKjPaqeSKp0K+
 IsPQ==
X-Gm-Message-State: APjAAAUOlhWDttv+taxOO4YirpL49JElaCN7Hi8bCIOHLehCHQRjnEJx
 k4WI+VlHKwbO1uFJVuzvE9OlWudubPgTO6+od6ayFg==
X-Google-Smtp-Source: APXvYqzh56POIRCen1ElnEBPnQP31pfwGFoIeJh2QzHWrpvN1IvvrzB4ANWG+PQ9H2/c8xsN9zYOe5gqo4rV7rygpAM=
X-Received: by 2002:a5d:55ca:: with SMTP id i10mr5476113wrw.111.1582819613430; 
 Thu, 27 Feb 2020 08:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20200227155349.10993-1-hersenxs.wu@amd.com>
In-Reply-To: <20200227155349.10993-1-hersenxs.wu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Feb 2020 11:06:42 -0500
Message-ID: <CADnq5_McqbMxX29za=mKFgAh6Ur=9X2x3T88WisLdFiWWO=nVg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu/display: navi1x copy dcn watermark clock
 settings to smu resume from s3
To: Hersen Wu <hersenxs.wu@amd.com>
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
Cc: "Quan, Evan" <evan.quan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 10:54 AM Hersen Wu <hersenxs.wu@amd.com> wrote:
>
>  This interface is for dGPU Navi1x. Linux dc-pplib interface depends
>  on window driver dc implementation.
>
>  For Navi1x, clock settings of dcn watermarks are fixed. the settings
>  should be passed to smu during boot up and resume from s3.
>  boot up: dc calculate dcn watermark clock settings within dc_create,
>  dcn20_resource_construct, then call pplib functions below to pass
>  the settings to smu:
>  smu_set_watermarks_for_clock_ranges
>  smu_set_watermarks_table
>  navi10_set_watermarks_table
>  smu_write_watermarks_table
>
>  For Renoir, clock settings of dcn watermark are also fixed values.
>  dc has implemented different flow for window driver:
>  dc_hardware_init / dc_set_power_state
>  dcn10_init_hw
>  notify_wm_ranges
>  set_wm_ranges
>
>  For Linux
>  smu_set_watermarks_for_clock_ranges
>  renoir_set_watermarks_table
>  smu_write_watermarks_table
>
>  dc_hardware_init -> amdgpu_dm_init
>  dc_set_power_state --> dm_resume
>
>  therefore, linux dc-pplib interface of navi10/12/14 is different
>  from that of Renoir.
>
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 931cbd7b372e..c58c0e95735e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1435,6 +1435,68 @@ static void s3_handle_mst(struct drm_device *dev, bool suspend)
>                 drm_kms_helper_hotplug_event(dev);
>  }
>
> +static int amdgpu_dm_smu_write_watermarks_table(struct amdgpu_device *adev)
> +{
> +       struct smu_context *smu = &adev->smu;
> +       int ret = 0;
> +
> +       if (!is_support_sw_smu(adev))
> +               return 0;
> +
> +       /* This interface is for dGPU Navi1x.Linux dc-pplib interface depends
> +        * on window driver dc implementation.
> +        * For Navi1x, clock settings of dcn watermarks are fixed. the settings
> +        * should be passed to smu during boot up and resume from s3.
> +        * boot up: dc calculate dcn watermark clock settings within dc_create,
> +        * dcn20_resource_construct
> +        * then call pplib functions below to pass the settings to smu:
> +        * smu_set_watermarks_for_clock_ranges
> +        * smu_set_watermarks_table
> +        * navi10_set_watermarks_table
> +        * smu_write_watermarks_table
> +        *
> +        * For Renoir, clock settings of dcn watermark are also fixed values.
> +        * dc has implemented different flow for window driver:
> +        * dc_hardware_init / dc_set_power_state
> +        * dcn10_init_hw
> +        * notify_wm_ranges
> +        * set_wm_ranges
> +        * -- Linux
> +        * smu_set_watermarks_for_clock_ranges
> +        * renoir_set_watermarks_table
> +        * smu_write_watermarks_table
> +        *
> +        * For Linux,
> +        * dc_hardware_init -> amdgpu_dm_init
> +        * dc_set_power_state --> dm_resume
> +        *
> +        * therefore, this function apply to navi10/12/14 but not Renoir
> +        * *
> +        */
> +       switch(adev->asic_type) {
> +       case CHIP_NAVI10:
> +       case CHIP_NAVI14:
> +       case CHIP_NAVI12:
> +               break;
> +       default:
> +               return 0;
> +       }
> +
> +       /* pass data to smu controller */
> +       if ((smu->watermarks_bitmap & WATERMARKS_EXIST) &&
> +                       !(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
> +               ret = smu_write_watermarks_table(smu);
> +
> +               if (ret) {
> +                       DRM_ERROR("Failed to update WMTABLE!\n");
> +                       return ret;
> +               }
> +               smu->watermarks_bitmap |= WATERMARKS_LOADED;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * dm_hw_init() - Initialize DC device
>   * @handle: The base driver device containing the amdgpu_dm device.
> @@ -1713,6 +1775,8 @@ static int dm_resume(void *handle)
>
>         amdgpu_dm_irq_resume_late(adev);
>
> +       amdgpu_dm_smu_write_watermarks_table(adev);
> +
>         return 0;
>  }
>
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
