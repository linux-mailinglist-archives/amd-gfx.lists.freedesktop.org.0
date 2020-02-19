Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6675164A33
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Feb 2020 17:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506EE6EC53;
	Wed, 19 Feb 2020 16:25:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0C16EC53
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2020 16:25:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z3so1280182wru.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Feb 2020 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ucMFLPslXqf64+4bK1KJv31azSv3nFhq5znaEAb6xV0=;
 b=SB/Pfil2fN4WXC8a4N81uafGKtPkeL8oIOw5SDIYoh8fJ8keWuWbh+OTb6O9K9Tazg
 zm+j4sz+fhAcC2FVmbExt6OySPLJ3cKPXMPLYa1pRug9sRQk097AHWhvChcuxy/Hq6fd
 ooKZ0J4S8UaDTLScPmXx4lMsazHGSaH6JWxqx4ScncB380Ua4LqPRAx6sErlHeoZLzeW
 Te3Tpu2nnE/o4qE+cHaGizbdTrDo7EAxGo2ktcdBeDP2Yv6RrWDjTFkmv+d3W4xcaTei
 D7t/CHiKhdNB7dMkzieNmWlPeytC+fYyQu5AMa4HiOalerd2EfaB7nKcgnU2AyQyUl/h
 bqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ucMFLPslXqf64+4bK1KJv31azSv3nFhq5znaEAb6xV0=;
 b=l+E5/Nh1MGgKtWDzthJRuNosDZArOpg8IsuZkRKK9ElSrZlzYjXjLQE5+UspPOjeLM
 x6OgiRbDBSym006XthLX6lYeSZOoITTkAQcrjYck3oaONKR10+NV5jcDXtPO8X4g4Gwf
 qwXUrYygPp8RGvP9hGFQcCjImDggGOuImXE7ASn/7/m2yImNg33MF/kewy3jXjRrZBhB
 q6hicWwKusTm2TqgFIdb9RO5bihjv63ZAPDR4Xb/Eh+ixXwdh1sIlBF2teFGRrEB3biu
 ZfhQeaz2mQyPAbolqQVa3+5MKXY0CJYOfXUtwVUyJmBqTbkJQRQA6WziTguTwzrCWB+V
 zq7g==
X-Gm-Message-State: APjAAAWoa0X02guw0JsvCirVo+SKsB8YQRY6sHm/5jCWrQo0Ak1ppY+e
 Vno0XK/0L+SmcDGvm5NjOV55exIw59fWiWBsLvyUaw==
X-Google-Smtp-Source: APXvYqxJSnbIh1p2hYMnfMFMS5IP5w+ul/DqkP7LSV7l+w/vz8C+bM2Y3MMbMPRtlPg/tgmYGUy/AxGaFvqlAwhp+eo=
X-Received: by 2002:adf:ec4c:: with SMTP id w12mr38567383wrn.124.1582129516026; 
 Wed, 19 Feb 2020 08:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20191216171834.217251-1-alexander.deucher@amd.com>
 <20191216171834.217251-3-alexander.deucher@amd.com>
In-Reply-To: <20191216171834.217251-3-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Feb 2020 11:25:04 -0500
Message-ID: <CADnq5_M5JvZuH1_GHyMvvi6Xi6AwLsoBSXhg9=7tPO_KVB8mqg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Enter low power state if CRTC active.
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 12:18 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> CRTC in DPMS state off calls for low power state entry.
> Support both atomic mode setting and pre-atomic mode setting.
>
> v2: move comment
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Ping?

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 45 +++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 61dc26515c7e..e7f7463a0cbe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1296,24 +1296,55 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
>  {
>         struct drm_device *drm_dev = dev_get_drvdata(dev);
>         struct amdgpu_device *adev = drm_dev->dev_private;
> -       struct drm_crtc *crtc;
> +       /* we don't want the main rpm_idle to call suspend - we want to autosuspend */
> +       int ret = 1;
>
>         if (!adev->runpm) {
>                 pm_runtime_forbid(dev);
>                 return -EBUSY;
>         }
>
> -       list_for_each_entry(crtc, &drm_dev->mode_config.crtc_list, head) {
> -               if (crtc->enabled) {
> -                       DRM_DEBUG_DRIVER("failing to power off - crtc active\n");
> -                       return -EBUSY;
> +       if (amdgpu_device_has_dc_support(adev)) {
> +               struct drm_crtc *crtc;
> +
> +               drm_modeset_lock_all(drm_dev);
> +
> +               drm_for_each_crtc(crtc, drm_dev) {
> +                       if (crtc->state->active) {
> +                               ret = -EBUSY;
> +                               break;
> +                       }
>                 }
> +
> +               drm_modeset_unlock_all(drm_dev);
> +
> +       } else {
> +               struct drm_connector *list_connector;
> +               struct drm_connector_list_iter iter;
> +
> +               mutex_lock(&drm_dev->mode_config.mutex);
> +               drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> +
> +               drm_connector_list_iter_begin(drm_dev, &iter);
> +               drm_for_each_connector_iter(list_connector, &iter) {
> +                       if (list_connector->dpms ==  DRM_MODE_DPMS_ON) {
> +                               ret = -EBUSY;
> +                               break;
> +                       }
> +               }
> +
> +               drm_connector_list_iter_end(&iter);
> +
> +               drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> +               mutex_unlock(&drm_dev->mode_config.mutex);
>         }
>
> +       if (ret == -EBUSY)
> +               DRM_DEBUG_DRIVER("failing to power off - crtc active\n");
> +
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_autosuspend(dev);
> -       /* we don't want the main rpm_idle to call suspend - we want to autosuspend */
> -       return 1;
> +       return ret;
>  }
>
>  long amdgpu_drm_ioctl(struct file *filp,
> --
> 2.23.0
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
