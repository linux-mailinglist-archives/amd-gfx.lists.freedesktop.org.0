Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A294094F7
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Sep 2021 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E846E1A7;
	Mon, 13 Sep 2021 14:36:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6976E15E
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 14:36:43 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 o16-20020a9d2210000000b0051b1e56c98fso13573550ota.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Sep 2021 07:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DC4//KG46cLPoMdK5vdbYlEffeZWINNHxY2Cb02XbIg=;
 b=CTghzrt3B84y7yMX93EMIffikuJATai+qHvKVBoCZGqTlgeY69PNR94LG2ihbv+N9x
 KrbL12czEuoFfrwl7wo5rDrWxejNK3kakMNuksl3pN3XaQJ6zr0pXFz3Wr0hIdUSOnEg
 l8A1sI9r6yosTEQ+VDsOdQ7B1KTprqH2dFvEWg6GxR5jeXgly2ai+HXkBvBE4dpIlfjD
 bQtYzn+rl6vu9yGZJ7GC22nH4d6sFBP93q/I0nbhOscwC/g86nBdAVLFEDXwzb7jRRxF
 A4snWjz5gmxFfl6inUR+Yvb9uOQ4lEfa/9woX7DbpgvdZe2qjrWjlTvepxg3yZVtdqN6
 mYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DC4//KG46cLPoMdK5vdbYlEffeZWINNHxY2Cb02XbIg=;
 b=v4yuomletwwZ/UKqCi2212z3Nmeg9iyoi5Ky+TDqgraMJDAWanYlCxjhGF4pOPfInP
 8TFcZy/bjkk0MnouOeC+DhkHBcoL2mB9+AKE5DUpETvsC2Z1zxp0wAyPgFmOcxMPIY0M
 YNRjeeSvLATEwNde8LIzeP4RlgxIc7glBsr10IEduNIN07oVBU6PQ1RZ2BE+dOsvVVsU
 JhRlEQ3dntGe5bIaaONl34n5+5eMUjPjhNU8pBRHQjp9f8UIqWNjRtBLJ722QFwhHP+J
 8pXJd3RzMLSqrrJHSQUGN9GZXFHkYBPJXH4wPZ39Loxt9+KC2rQabg7NWSGkFXnZGMPq
 cOeg==
X-Gm-Message-State: AOAM530gxbvhUb9MWJDlZouTwK06Hl4lOHXLUPsnHXCiuFGPFZzrZnFw
 ubqg3waNevDaC5tOh69IeR1WAgbb6R2jJ7i5zs0=
X-Google-Smtp-Source: ABdhPJyA1+R91kSuwymNclbzg010b3ubt2A5FRZHng07HCQuc84hZoJWhh6L/Ay5nwFIEs/nmqZ60KrogUbVmdqq0oM=
X-Received: by 2002:a05:6830:25d3:: with SMTP id
 d19mr10376033otu.357.1631543802125; 
 Mon, 13 Sep 2021 07:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210910032530.725067-1-evan.quan@amd.com>
In-Reply-To: <20210910032530.725067-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Sep 2021 10:36:31 -0400
Message-ID: <CADnq5_P-u4w4zMn-hoxuTortkh1XJegTfs=zLVcX=+q832A8XA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: use generic fb helpers instead of setting up
 AMD own's.
To: Evan Quan <evan.quan@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Thu, Sep 9, 2021 at 11:25 PM Evan Quan <evan.quan@amd.com> wrote:
>
> With the shadow buffer support from generic framebuffer emulation, it's
> possible now to have runpm kicked when no update for console.
>
> Change-Id: I285472c9100ee6f649d3f3f3548f402b9cd34eaf
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> --
> v1->v2:
>   - rename amdgpu_align_pitch as amdgpu_gem_align_pitch to align with
>     other APIs from the same file (Alex)
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  13 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c      | 388 --------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  30 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h    |  20 -
>  7 files changed, 50 insertions(+), 426 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 8d0748184a14..73a2151ee43f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -45,7 +45,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_kms.o \
>         amdgpu_atombios.o atombios_crtc.o amdgpu_connectors.o \
>         atom.o amdgpu_fence.o amdgpu_ttm.o amdgpu_object.o amdgpu_gart.o =
\
>         amdgpu_encoders.o amdgpu_display.o amdgpu_i2c.o \
> -       amdgpu_fb.o amdgpu_gem.o amdgpu_ring.o \
> +       amdgpu_gem.o amdgpu_ring.o \
>         amdgpu_cs.o amdgpu_bios.o amdgpu_benchmark.o amdgpu_test.o \
>         atombios_dp.o amdgpu_afmt.o amdgpu_trace_points.o \
>         atombios_encoders.o amdgpu_sa.o atombios_i2c.o \
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 682d459e992a..bcc308b7f826 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -3695,8 +3695,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>         /* Get a log2 for easy divisions. */
>         adev->mm_stats.log2_max_MBps =3D ilog2(max(1u, max_MBps));
>
> -       amdgpu_fbdev_init(adev);
> -
>         r =3D amdgpu_pm_sysfs_init(adev);
>         if (r) {
>                 adev->pm_sysfs_en =3D false;
> @@ -3854,8 +3852,6 @@ void amdgpu_device_fini_hw(struct amdgpu_device *ad=
ev)
>                 amdgpu_ucode_sysfs_fini(adev);
>         sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>
> -       amdgpu_fbdev_fini(adev);
> -
>         amdgpu_irq_fini_hw(adev);
>
>         amdgpu_device_ip_fini_early(adev);
> @@ -3931,7 +3927,7 @@ int amdgpu_device_suspend(struct drm_device *dev, b=
ool fbcon)
>         drm_kms_helper_poll_disable(dev);
>
>         if (fbcon)
> -               amdgpu_fbdev_set_suspend(adev, 1);
> +               drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_=
helper, true);
>
>         cancel_delayed_work_sync(&adev->delayed_init_work);
>
> @@ -4009,7 +4005,7 @@ int amdgpu_device_resume(struct drm_device *dev, bo=
ol fbcon)
>         flush_delayed_work(&adev->delayed_init_work);
>
>         if (fbcon)
> -               amdgpu_fbdev_set_suspend(adev, 0);
> +               drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_=
helper, false);
>
>         drm_kms_helper_poll_enable(dev);
>
> @@ -4638,7 +4634,7 @@ int amdgpu_do_asic_reset(struct list_head *device_l=
ist_handle,
>                                 if (r)
>                                         goto out;
>
> -                               amdgpu_fbdev_set_suspend(tmp_adev, 0);
> +                               drm_fb_helper_set_suspend_unlocked(adev_t=
o_drm(tmp_adev)->fb_helper, false);
>
>                                 /*
>                                  * The GPU enters bad state once faulty p=
ages
> @@ -5025,7 +5021,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device =
*adev,
>                  */
>                 amdgpu_unregister_gpu_instance(tmp_adev);
>
> -               amdgpu_fbdev_set_suspend(tmp_adev, 1);
> +               drm_fb_helper_set_suspend_unlocked(adev_to_drm(adev)->fb_=
helper, true);
>
>                 /* disable ras on ALL IPs */
>                 if (!need_emergency_restart &&
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_display.c
> index 7a7316731911..58bfc7f00d76 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1572,13 +1572,10 @@ int amdgpu_display_suspend_helper(struct amdgpu_d=
evice *adev)
>                         continue;
>                 }
>                 robj =3D gem_to_amdgpu_bo(fb->obj[0]);
> -               /* don't unpin kernel fb objects */
> -               if (!amdgpu_fbdev_robj_is_fb(adev, robj)) {
> -                       r =3D amdgpu_bo_reserve(robj, true);
> -                       if (r =3D=3D 0) {
> -                               amdgpu_bo_unpin(robj);
> -                               amdgpu_bo_unreserve(robj);
> -                       }
> +               r =3D amdgpu_bo_reserve(robj, true);
> +               if (r =3D=3D 0) {
> +                       amdgpu_bo_unpin(robj);
> +                       amdgpu_bo_unreserve(robj);
>                 }
>         }
>         return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 987482c26b1a..db21af5e84ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1348,6 +1348,19 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>                 goto err_pci;
>         }
>
> +       /*
> +        * 1. don't init fbdev on hw without DCE
> +        * 2. don't init fbdev if there are no connectors
> +        */
> +       if (adev->mode_info.mode_config_initialized &&
> +           !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) =
{
> +               /* select 8 bpp console on low vram cards */
> +               if (adev->gmc.real_vram_size <=3D (32*1024*1024))
> +                       drm_fbdev_generic_setup(adev_to_drm(adev), 8);
> +               else
> +                       drm_fbdev_generic_setup(adev_to_drm(adev), 32);
> +       }
> +
>         ret =3D amdgpu_debugfs_init(adev);
>         if (ret)
>                 DRM_ERROR("Creating debugfs files failed (%d).\n", ret);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_fb.c
> deleted file mode 100644
> index cd0acbea75da..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> +++ /dev/null
> @@ -1,388 +0,0 @@
> -/*
> - * Copyright =C2=A9 2007 David Airlie
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice (including the =
next
> - * paragraph) shall be included in all copies or substantial portions of=
 the
> - * Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> - *
> - * Authors:
> - *     David Airlie
> - */
> -
> -#include <linux/module.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/slab.h>
> -#include <linux/vga_switcheroo.h>
> -
> -#include <drm/amdgpu_drm.h>
> -#include <drm/drm_crtc.h>
> -#include <drm/drm_crtc_helper.h>
> -#include <drm/drm_fb_helper.h>
> -#include <drm/drm_fourcc.h>
> -
> -#include "amdgpu.h"
> -#include "cikd.h"
> -#include "amdgpu_gem.h"
> -
> -#include "amdgpu_display.h"
> -
> -/* object hierarchy -
> -   this contains a helper + a amdgpu fb
> -   the helper contains a pointer to amdgpu framebuffer baseclass.
> -*/
> -
> -static int
> -amdgpufb_open(struct fb_info *info, int user)
> -{
> -       struct drm_fb_helper *fb_helper =3D info->par;
> -       int ret =3D pm_runtime_get_sync(fb_helper->dev->dev);
> -       if (ret < 0 && ret !=3D -EACCES) {
> -               pm_runtime_mark_last_busy(fb_helper->dev->dev);
> -               pm_runtime_put_autosuspend(fb_helper->dev->dev);
> -               return ret;
> -       }
> -       return 0;
> -}
> -
> -static int
> -amdgpufb_release(struct fb_info *info, int user)
> -{
> -       struct drm_fb_helper *fb_helper =3D info->par;
> -
> -       pm_runtime_mark_last_busy(fb_helper->dev->dev);
> -       pm_runtime_put_autosuspend(fb_helper->dev->dev);
> -       return 0;
> -}
> -
> -static const struct fb_ops amdgpufb_ops =3D {
> -       .owner =3D THIS_MODULE,
> -       DRM_FB_HELPER_DEFAULT_OPS,
> -       .fb_open =3D amdgpufb_open,
> -       .fb_release =3D amdgpufb_release,
> -       .fb_fillrect =3D drm_fb_helper_cfb_fillrect,
> -       .fb_copyarea =3D drm_fb_helper_cfb_copyarea,
> -       .fb_imageblit =3D drm_fb_helper_cfb_imageblit,
> -};
> -
> -
> -int amdgpu_align_pitch(struct amdgpu_device *adev, int width, int cpp, b=
ool tiled)
> -{
> -       int aligned =3D width;
> -       int pitch_mask =3D 0;
> -
> -       switch (cpp) {
> -       case 1:
> -               pitch_mask =3D 255;
> -               break;
> -       case 2:
> -               pitch_mask =3D 127;
> -               break;
> -       case 3:
> -       case 4:
> -               pitch_mask =3D 63;
> -               break;
> -       }
> -
> -       aligned +=3D pitch_mask;
> -       aligned &=3D ~pitch_mask;
> -       return aligned * cpp;
> -}
> -
> -static void amdgpufb_destroy_pinned_object(struct drm_gem_object *gobj)
> -{
> -       struct amdgpu_bo *abo =3D gem_to_amdgpu_bo(gobj);
> -       int ret;
> -
> -       ret =3D amdgpu_bo_reserve(abo, true);
> -       if (likely(ret =3D=3D 0)) {
> -               amdgpu_bo_kunmap(abo);
> -               amdgpu_bo_unpin(abo);
> -               amdgpu_bo_unreserve(abo);
> -       }
> -       drm_gem_object_put(gobj);
> -}
> -
> -static int amdgpufb_create_pinned_object(struct amdgpu_fbdev *rfbdev,
> -                                        struct drm_mode_fb_cmd2 *mode_cm=
d,
> -                                        struct drm_gem_object **gobj_p)
> -{
> -       const struct drm_format_info *info;
> -       struct amdgpu_device *adev =3D rfbdev->adev;
> -       struct drm_gem_object *gobj =3D NULL;
> -       struct amdgpu_bo *abo =3D NULL;
> -       bool fb_tiled =3D false; /* useful for testing */
> -       u32 tiling_flags =3D 0, domain;
> -       int ret;
> -       int aligned_size, size;
> -       int height =3D mode_cmd->height;
> -       u32 cpp;
> -       u64 flags =3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
> -                              AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     |
> -                              AMDGPU_GEM_CREATE_VRAM_CLEARED;
> -
> -       info =3D drm_get_format_info(adev_to_drm(adev), mode_cmd);
> -       cpp =3D info->cpp[0];
> -
> -       /* need to align pitch with crtc limits */
> -       mode_cmd->pitches[0] =3D amdgpu_align_pitch(adev, mode_cmd->width=
, cpp,
> -                                                 fb_tiled);
> -       domain =3D amdgpu_display_supported_domains(adev, flags);
> -       height =3D ALIGN(mode_cmd->height, 8);
> -       size =3D mode_cmd->pitches[0] * height;
> -       aligned_size =3D ALIGN(size, PAGE_SIZE);
> -       ret =3D amdgpu_gem_object_create(adev, aligned_size, 0, domain, f=
lags,
> -                                      ttm_bo_type_device, NULL, &gobj);
> -       if (ret) {
> -               pr_err("failed to allocate framebuffer (%d)\n", aligned_s=
ize);
> -               return -ENOMEM;
> -       }
> -       abo =3D gem_to_amdgpu_bo(gobj);
> -
> -       if (fb_tiled)
> -               tiling_flags =3D AMDGPU_TILING_SET(ARRAY_MODE, GRPH_ARRAY=
_2D_TILED_THIN1);
> -
> -       ret =3D amdgpu_bo_reserve(abo, false);
> -       if (unlikely(ret !=3D 0))
> -               goto out_unref;
> -
> -       if (tiling_flags) {
> -               ret =3D amdgpu_bo_set_tiling_flags(abo,
> -                                                tiling_flags);
> -               if (ret)
> -                       dev_err(adev->dev, "FB failed to set tiling flags=
\n");
> -       }
> -
> -       ret =3D amdgpu_bo_pin(abo, domain);
> -       if (ret) {
> -               amdgpu_bo_unreserve(abo);
> -               goto out_unref;
> -       }
> -
> -       ret =3D amdgpu_ttm_alloc_gart(&abo->tbo);
> -       if (ret) {
> -               amdgpu_bo_unreserve(abo);
> -               dev_err(adev->dev, "%p bind failed\n", abo);
> -               goto out_unref;
> -       }
> -
> -       ret =3D amdgpu_bo_kmap(abo, NULL);
> -       amdgpu_bo_unreserve(abo);
> -       if (ret) {
> -               goto out_unref;
> -       }
> -
> -       *gobj_p =3D gobj;
> -       return 0;
> -out_unref:
> -       amdgpufb_destroy_pinned_object(gobj);
> -       *gobj_p =3D NULL;
> -       return ret;
> -}
> -
> -static int amdgpufb_create(struct drm_fb_helper *helper,
> -                          struct drm_fb_helper_surface_size *sizes)
> -{
> -       struct amdgpu_fbdev *rfbdev =3D (struct amdgpu_fbdev *)helper;
> -       struct amdgpu_device *adev =3D rfbdev->adev;
> -       struct fb_info *info;
> -       struct drm_framebuffer *fb =3D NULL;
> -       struct drm_mode_fb_cmd2 mode_cmd;
> -       struct drm_gem_object *gobj =3D NULL;
> -       struct amdgpu_bo *abo =3D NULL;
> -       int ret;
> -
> -       memset(&mode_cmd, 0, sizeof(mode_cmd));
> -       mode_cmd.width =3D sizes->surface_width;
> -       mode_cmd.height =3D sizes->surface_height;
> -
> -       if (sizes->surface_bpp =3D=3D 24)
> -               sizes->surface_bpp =3D 32;
> -
> -       mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->surfac=
e_bpp,
> -                                                         sizes->surface_=
depth);
> -
> -       ret =3D amdgpufb_create_pinned_object(rfbdev, &mode_cmd, &gobj);
> -       if (ret) {
> -               DRM_ERROR("failed to create fbcon object %d\n", ret);
> -               return ret;
> -       }
> -
> -       abo =3D gem_to_amdgpu_bo(gobj);
> -
> -       /* okay we have an object now allocate the framebuffer */
> -       info =3D drm_fb_helper_alloc_fbi(helper);
> -       if (IS_ERR(info)) {
> -               ret =3D PTR_ERR(info);
> -               goto out;
> -       }
> -
> -       ret =3D amdgpu_display_gem_fb_init(adev_to_drm(adev), &rfbdev->rf=
b,
> -                                        &mode_cmd, gobj);
> -       if (ret) {
> -               DRM_ERROR("failed to initialize framebuffer %d\n", ret);
> -               goto out;
> -       }
> -
> -       fb =3D &rfbdev->rfb.base;
> -
> -       /* setup helper */
> -       rfbdev->helper.fb =3D fb;
> -
> -       info->fbops =3D &amdgpufb_ops;
> -
> -       info->fix.smem_start =3D amdgpu_gmc_vram_cpu_pa(adev, abo);
> -       info->fix.smem_len =3D amdgpu_bo_size(abo);
> -       info->screen_base =3D amdgpu_bo_kptr(abo);
> -       info->screen_size =3D amdgpu_bo_size(abo);
> -
> -       drm_fb_helper_fill_info(info, &rfbdev->helper, sizes);
> -
> -       /* setup aperture base/size for vesafb takeover */
> -       info->apertures->ranges[0].base =3D adev_to_drm(adev)->mode_confi=
g.fb_base;
> -       info->apertures->ranges[0].size =3D adev->gmc.aper_size;
> -
> -       /* Use default scratch pixmap (info->pixmap.flags =3D FB_PIXMAP_S=
YSTEM) */
> -
> -       if (info->screen_base =3D=3D NULL) {
> -               ret =3D -ENOSPC;
> -               goto out;
> -       }
> -
> -       DRM_INFO("fb mappable at 0x%lX\n",  info->fix.smem_start);
> -       DRM_INFO("vram apper at 0x%lX\n",  (unsigned long)adev->gmc.aper_=
base);
> -       DRM_INFO("size %lu\n", (unsigned long)amdgpu_bo_size(abo));
> -       DRM_INFO("fb depth is %d\n", fb->format->depth);
> -       DRM_INFO("   pitch is %d\n", fb->pitches[0]);
> -
> -       vga_switcheroo_client_fb_set(adev->pdev, info);
> -       return 0;
> -
> -out:
> -       if (fb && ret) {
> -               drm_gem_object_put(gobj);
> -               drm_framebuffer_unregister_private(fb);
> -               drm_framebuffer_cleanup(fb);
> -               kfree(fb);
> -       }
> -       return ret;
> -}
> -
> -static int amdgpu_fbdev_destroy(struct drm_device *dev, struct amdgpu_fb=
dev *rfbdev)
> -{
> -       struct amdgpu_framebuffer *rfb =3D &rfbdev->rfb;
> -       int i;
> -
> -       drm_fb_helper_unregister_fbi(&rfbdev->helper);
> -
> -       if (rfb->base.obj[0]) {
> -               for (i =3D 0; i < rfb->base.format->num_planes; i++)
> -                       drm_gem_object_put(rfb->base.obj[0]);
> -               amdgpufb_destroy_pinned_object(rfb->base.obj[0]);
> -               rfb->base.obj[0] =3D NULL;
> -               drm_framebuffer_unregister_private(&rfb->base);
> -               drm_framebuffer_cleanup(&rfb->base);
> -       }
> -       drm_fb_helper_fini(&rfbdev->helper);
> -
> -       return 0;
> -}
> -
> -static const struct drm_fb_helper_funcs amdgpu_fb_helper_funcs =3D {
> -       .fb_probe =3D amdgpufb_create,
> -};
> -
> -int amdgpu_fbdev_init(struct amdgpu_device *adev)
> -{
> -       struct amdgpu_fbdev *rfbdev;
> -       int bpp_sel =3D 32;
> -       int ret;
> -
> -       /* don't init fbdev on hw without DCE */
> -       if (!adev->mode_info.mode_config_initialized)
> -               return 0;
> -
> -       /* don't init fbdev if there are no connectors */
> -       if (list_empty(&adev_to_drm(adev)->mode_config.connector_list))
> -               return 0;
> -
> -       /* select 8 bpp console on low vram cards */
> -       if (adev->gmc.real_vram_size <=3D (32*1024*1024))
> -               bpp_sel =3D 8;
> -
> -       rfbdev =3D kzalloc(sizeof(struct amdgpu_fbdev), GFP_KERNEL);
> -       if (!rfbdev)
> -               return -ENOMEM;
> -
> -       rfbdev->adev =3D adev;
> -       adev->mode_info.rfbdev =3D rfbdev;
> -
> -       drm_fb_helper_prepare(adev_to_drm(adev), &rfbdev->helper,
> -                             &amdgpu_fb_helper_funcs);
> -
> -       ret =3D drm_fb_helper_init(adev_to_drm(adev), &rfbdev->helper);
> -       if (ret) {
> -               kfree(rfbdev);
> -               return ret;
> -       }
> -
> -       /* disable all the possible outputs/crtcs before entering KMS mod=
e */
> -       if (!amdgpu_device_has_dc_support(adev) && !amdgpu_virtual_displa=
y)
> -               drm_helper_disable_unused_functions(adev_to_drm(adev));
> -
> -       drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel);
> -       return 0;
> -}
> -
> -void amdgpu_fbdev_fini(struct amdgpu_device *adev)
> -{
> -       if (!adev->mode_info.rfbdev)
> -               return;
> -
> -       amdgpu_fbdev_destroy(adev_to_drm(adev), adev->mode_info.rfbdev);
> -       kfree(adev->mode_info.rfbdev);
> -       adev->mode_info.rfbdev =3D NULL;
> -}
> -
> -void amdgpu_fbdev_set_suspend(struct amdgpu_device *adev, int state)
> -{
> -       if (adev->mode_info.rfbdev)
> -               drm_fb_helper_set_suspend_unlocked(&adev->mode_info.rfbde=
v->helper,
> -                                                  state);
> -}
> -
> -int amdgpu_fbdev_total_size(struct amdgpu_device *adev)
> -{
> -       struct amdgpu_bo *robj;
> -       int size =3D 0;
> -
> -       if (!adev->mode_info.rfbdev)
> -               return 0;
> -
> -       robj =3D gem_to_amdgpu_bo(adev->mode_info.rfbdev->rfb.base.obj[0]=
);
> -       size +=3D amdgpu_bo_size(robj);
> -       return size;
> -}
> -
> -bool amdgpu_fbdev_robj_is_fb(struct amdgpu_device *adev, struct amdgpu_b=
o *robj)
> -{
> -       if (!adev->mode_info.rfbdev)
> -               return false;
> -       if (robj =3D=3D gem_to_amdgpu_bo(adev->mode_info.rfbdev->rfb.base=
.obj[0]))
> -               return true;
> -       return false;
> -}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 9e2525b96d04..355db8438522 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -876,6 +876,32 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void=
 *data,
>         return r;
>  }
>
> +static int amdgpu_gem_align_pitch(struct amdgpu_device *adev,
> +                                 int width,
> +                                 int cpp,
> +                                 bool tiled)
> +{
> +       int aligned =3D width;
> +       int pitch_mask =3D 0;
> +
> +       switch (cpp) {
> +       case 1:
> +               pitch_mask =3D 255;
> +               break;
> +       case 2:
> +               pitch_mask =3D 127;
> +               break;
> +       case 3:
> +       case 4:
> +               pitch_mask =3D 63;
> +               break;
> +       }
> +
> +       aligned +=3D pitch_mask;
> +       aligned &=3D ~pitch_mask;
> +       return aligned * cpp;
> +}
> +
>  int amdgpu_mode_dumb_create(struct drm_file *file_priv,
>                             struct drm_device *dev,
>                             struct drm_mode_create_dumb *args)
> @@ -896,8 +922,8 @@ int amdgpu_mode_dumb_create(struct drm_file *file_pri=
v,
>         if (adev->mman.buffer_funcs_enabled)
>                 flags |=3D AMDGPU_GEM_CREATE_VRAM_CLEARED;
>
> -       args->pitch =3D amdgpu_align_pitch(adev, args->width,
> -                                        DIV_ROUND_UP(args->bpp, 8), 0);
> +       args->pitch =3D amdgpu_gem_align_pitch(adev, args->width,
> +                                            DIV_ROUND_UP(args->bpp, 8), =
0);
>         args->size =3D (u64)args->pitch * args->height;
>         args->size =3D ALIGN(args->size, PAGE_SIZE);
>         domain =3D amdgpu_bo_get_preferred_domain(adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_mode.h
> index 89fb372ed49c..6043bf6fd414 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -232,8 +232,6 @@ struct amdgpu_i2c_chan {
>         struct mutex mutex;
>  };
>
> -struct amdgpu_fbdev;
> -
>  struct amdgpu_afmt {
>         bool enabled;
>         int offset;
> @@ -309,13 +307,6 @@ struct amdgpu_framebuffer {
>         uint64_t address;
>  };
>
> -struct amdgpu_fbdev {
> -       struct drm_fb_helper helper;
> -       struct amdgpu_framebuffer rfb;
> -       struct list_head fbdev_list;
> -       struct amdgpu_device *adev;
> -};
> -
>  struct amdgpu_mode_info {
>         struct atom_context *atom_context;
>         struct card_info *atom_card_info;
> @@ -341,8 +332,6 @@ struct amdgpu_mode_info {
>         struct edid *bios_hardcoded_edid;
>         int bios_hardcoded_edid_size;
>
> -       /* pointer to fbdev info structure */
> -       struct amdgpu_fbdev *rfbdev;
>         /* firmware flags */
>         u32 firmware_flags;
>         /* pointer to backlight encoder */
> @@ -631,15 +620,6 @@ bool amdgpu_crtc_get_scanout_position(struct drm_crt=
c *crtc,
>                         int *hpos, ktime_t *stime, ktime_t *etime,
>                         const struct drm_display_mode *mode);
>
> -/* fbdev layer */
> -int amdgpu_fbdev_init(struct amdgpu_device *adev);
> -void amdgpu_fbdev_fini(struct amdgpu_device *adev);
> -void amdgpu_fbdev_set_suspend(struct amdgpu_device *adev, int state);
> -int amdgpu_fbdev_total_size(struct amdgpu_device *adev);
> -bool amdgpu_fbdev_robj_is_fb(struct amdgpu_device *adev, struct amdgpu_b=
o *robj);
> -
> -int amdgpu_align_pitch(struct amdgpu_device *adev, int width, int bpp, b=
ool tiled);
> -
>  /* amdgpu_display.c */
>  void amdgpu_display_print_display_setup(struct drm_device *dev);
>  int amdgpu_display_modeset_create_props(struct amdgpu_device *adev);
> --
> 2.29.0
>
