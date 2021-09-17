Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD4A40FD36
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Sep 2021 17:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A466EE06;
	Fri, 17 Sep 2021 15:49:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95F06EE06
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 15:49:10 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id j13so4273045qtq.6
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yNboy2nybDEpZvjijJhKd+CeyrFg+AJ7CoANY2kY7TA=;
 b=PcnJ/QqxvMhMi9fyasgFvHa/sLaqYyMYOz6DJJFEFQCw9HGFfs7KGZWZUzOBnTccxd
 2huaYpg3OXmPPgfhte1FwhCmhiI1kHSKEMbOEuKXXLM0yyR27/Pwox4unL+9FMs1qOyb
 rIGWayOPNyBFDBUlcmls4Q2wkFtbnCln6p7D2IWxdz6t6c5j5DaRVb2hBnqH5mSKvU1W
 vZFKE+JlnHA+HCiXhV+958t5hyEY439/W0qFxVKpGnZ4N0z8NlcCs119QpJw+JOP16BX
 E1zOKeTf6iaVRYQkRIzB3Fs/fdm5Y0Lv7oUvQSoSZhgwoQqhXoMeqfoDChjMr2cxoIxY
 ZU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yNboy2nybDEpZvjijJhKd+CeyrFg+AJ7CoANY2kY7TA=;
 b=1uwqDK52XsSE/WYdm97mNd4D8SNq+qx7ms6lp/tYzO1TM5R2dlsYNsxDYMeEMdujj9
 Cw/vsGdXbtBHOrT7eO0gm/bzKeWVqHbyamBEIOOdOt+g8jM4eLCIoEzvh3MncepaM34L
 Q0D4VUF0c0YyqTiT4HL4byCgPp+qndWxPsR/Ea0EyNH4QJRs0ZQGg57Ui0BHkW68WK8G
 yILvFvSAUCs2+vQjpVr0mtTtNycZqCXem40zy6cwiyAfl57qSTPAIpPRinBZxEMJhiot
 EpbfoPDIk4l0YGAszVg81jZM+cjUuXA2Ic+3TIE1s+DM+dw39XhHSHd1xpQqARFncB4y
 yKXg==
X-Gm-Message-State: AOAM533gCTydsNEyKMihF9VLHOlb9JgsP58/NeUGm8Av6T/kR4m+NMCV
 m4cvnalJXioFMgyTJWVVArhGsg==
X-Google-Smtp-Source: ABdhPJyLyH366vADUu+ohTu5GzEnkgYuK5GA75CUu1ovLPgTG4KG0LqyBAV0jarYEVHHFThFOm/VWg==
X-Received: by 2002:ac8:7558:: with SMTP id b24mr11241149qtr.160.1631893749909; 
 Fri, 17 Sep 2021 08:49:09 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id c10sm4408958qtb.20.2021.09.17.08.49.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:49:09 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:49:08 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 13/15] drm/gma500: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917154908.GN2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-14-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-14-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:50PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/gma500/psb_device.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
> index 951725a0f7a3..4e27f65a1f16 100644
> --- a/drivers/gpu/drm/gma500/psb_device.c
> +++ b/drivers/gpu/drm/gma500/psb_device.c
> @@ -8,6 +8,7 @@
>  #include <linux/backlight.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_drv.h>
>  
>  #include "gma_device.h"
>  #include "intel_bios.h"
> @@ -169,8 +170,10 @@ static int psb_save_display_registers(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = dev->dev_private;
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct gma_connector *connector;
>  	struct psb_state *regs = &dev_priv->regs.psb;
> +	int ret;
>  
>  	/* Display arbitration control + watermarks */
>  	regs->saveDSPARB = PSB_RVDC32(DSPARB);
> @@ -183,7 +186,7 @@ static int psb_save_display_registers(struct drm_device *dev)
>  	regs->saveCHICKENBIT = PSB_RVDC32(DSPCHICKENBIT);
>  
>  	/* Save crtc and output state */
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		if (drm_helper_crtc_in_use(crtc))
>  			dev_priv->ops->save_crtc(crtc);
> @@ -193,7 +196,8 @@ static int psb_save_display_registers(struct drm_device *dev)
>  		if (connector->save)
>  			connector->save(&connector->base);
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
> +
>  	return 0;

Return ret here please

>  }
>  
> @@ -207,8 +211,10 @@ static int psb_restore_display_registers(struct drm_device *dev)
>  {
>  	struct drm_psb_private *dev_priv = dev->dev_private;
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	struct gma_connector *connector;
>  	struct psb_state *regs = &dev_priv->regs.psb;
> +	int ret;
>  
>  	/* Display arbitration + watermarks */
>  	PSB_WVDC32(regs->saveDSPARB, DSPARB);
> @@ -223,7 +229,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
>  	/*make sure VGA plane is off. it initializes to on after reset!*/
>  	PSB_WVDC32(0x80000000, VGACNTRL);
>  
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
>  		if (drm_helper_crtc_in_use(crtc))
>  			dev_priv->ops->restore_crtc(crtc);
> @@ -232,7 +238,7 @@ static int psb_restore_display_registers(struct drm_device *dev)
>  		if (connector->restore)
>  			connector->restore(&connector->base);
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  	return 0;

Here too

>  }
>  
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
