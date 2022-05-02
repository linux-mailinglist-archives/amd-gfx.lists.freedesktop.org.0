Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D735173C1
	for <lists+amd-gfx@lfdr.de>; Mon,  2 May 2022 18:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7577410E9A6;
	Mon,  2 May 2022 16:07:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441F910E976;
 Mon,  2 May 2022 16:07:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B82FC474;
 Mon,  2 May 2022 18:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651507664;
 bh=j4SLZmcogiKq7RcNH1Xlzei1jsmmSCfCCxv2JeKeBgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a4MwFinFisjBerH/WxTtakwZ7XW0xx1Y3bDpgaVgRwglYtDnNhPW4HlAGI9MUVKi2
 Yhl1LdSM1J0+WkYR4oSTdBhdwVoGhcf2mv1OxMe7/LehCplQRMWKxA/hVCaFrZ8dUQ
 yA9gtE2bkpAXNzDtBG9gl80pCg7mtuntBVTW7chQ=
Date: Mon, 2 May 2022 19:07:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
Message-ID: <YnABz/4haOHe66Do@pendragon.ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220502153900.408522-3-javierm@redhat.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Javier,

Thank you for the patch.

On Mon, May 02, 2022 at 05:38:59PM +0200, Javier Martinez Canillas wrote:
> By default the bits per pixel for the emulated framebuffer device is set
> to dev->mode_config.preferred_depth, but some devices need another value.
> 
> Since this second parameter is only used by a few drivers, and to allow
> drivers to use it for passing other configurations when registering the
> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
> 
> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
> for computing options bitfield values and getting the values respectively
> 
> For now, only the DRM_FB_BPP option exists but other options can be added.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Changes in v2:
> - Rename DRM_FB_SET_OPTION() to DRM_FB_SET() and make more clear in the

I assume you meant DRM_FB_OPTION() here, not DRM_FB_SET().

>   kernel-doc what this macro does (Laurent Pinchart).
> - Fix some kernel-doc issues I didn't notice in v1.
> - Add Reviewed-by tags from Thomas and Laurent.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  6 ++++--
>  drivers/gpu/drm/arm/hdlcd_drv.c                 |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c                |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  2 +-
>  drivers/gpu/drm/ast/ast_drv.c                   |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    |  2 +-
>  drivers/gpu/drm/drm_drv.c                       |  2 +-
>  drivers/gpu/drm/drm_fb_helper.c                 | 17 +++++++++++++----
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  2 +-
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c             |  2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c              |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c       |  2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c                 |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c               |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c               |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                   |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c           |  2 +-
>  drivers/gpu/drm/sti/sti_drv.c                   |  2 +-
>  drivers/gpu/drm/stm/drv.c                       |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 +-
>  drivers/gpu/drm/tidss/tidss_drv.c               |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c             |  2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                   |  2 +-
>  drivers/gpu/drm/tiny/bochs.c                    |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c             |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c            |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                   |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c            |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 +-
>  include/drm/drm_fb_helper.h                     | 12 ++++++++++++
>  33 files changed, 59 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index b03663f42cc9..0c54470975e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2118,9 +2118,11 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	    !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) {
>  		/* select 8 bpp console on low vram cards */
>  		if (adev->gmc.real_vram_size <= (32*1024*1024))
> -			drm_fbdev_generic_setup(adev_to_drm(adev), 8);
> +			drm_fbdev_generic_setup(adev_to_drm(adev),
> +						DRM_FB_OPTION(DRM_FB_BPP, 8));
>  		else
> -			drm_fbdev_generic_setup(adev_to_drm(adev), 32);
> +			drm_fbdev_generic_setup(adev_to_drm(adev),
> +						DRM_FB_OPTION(DRM_FB_BPP, 32));
>  	}
>  
>  	ret = amdgpu_debugfs_init(adev);
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index e89ae0ec60eb..b69b1e5be379 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -321,7 +321,7 @@ static int hdlcd_drm_bind(struct device *dev)
>  	if (ret)
>  		goto err_register;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index d5aef21426cf..25685b579a05 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -863,7 +863,7 @@ static int malidp_bind(struct device *dev)
>  	if (ret)
>  		goto register_fail;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 7780b72de9e8..dcccc2e93aea 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -343,7 +343,7 @@ static int aspeed_gfx_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(&priv->drm, 32);
> +	drm_fbdev_generic_setup(&priv->drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  	return 0;
>  
>  err_unload:
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 7465c4f0156a..115be73e9b02 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -126,7 +126,7 @@ static int ast_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		return ret;
>  
> -	drm_fbdev_generic_setup(dev, 32);
> +	drm_fbdev_generic_setup(dev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 651e3c109360..d2ced1a03df9 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -760,7 +760,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(ddev, 24);
> +	drm_fbdev_generic_setup(ddev, DRM_FB_OPTION(DRM_FB_BPP, 24));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8214a0b1ab7f..9fbc2287c876 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -324,7 +324,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *		if (ret)
>   *			return ret;
>   *
> - *		drm_fbdev_generic_setup(drm, 32);
> + *		drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>   *
>   *		return 0;
>   *	}
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index d265a73313c9..fd0084ad77c3 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2501,8 +2501,17 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>  /**
>   * drm_fbdev_generic_setup() - Setup generic fbdev emulation
>   * @dev: DRM device
> - * @preferred_bpp: Preferred bits per pixel for the device.
> - *                 @dev->mode_config.preferred_depth is used if this is zero.
> + * @options: options for the registered framebuffer.
> + *
> + * The @options parameter is a multi-field parameter that can contain
> + * different options for the emulated framebuffer device registered.
> + *
> + * The options field values can be set using DRM_FB_OPTION() to compute
> + * the value according to the option bitfield and can be obtained using
> + * DRM_FB_GET_OPTION(). The options fields are the following:
> + *
> + * * DRM_FB_BPP: bits per pixel for the device. If the field is not set,
> + *   @dev->mode_config.preferred_depth is used instead.
>   *
>   * This function sets up generic fbdev emulation for drivers that supports
>   * dumb buffers with a virtual address and that can be mmap'ed.
> @@ -2525,10 +2534,10 @@ static const struct drm_client_funcs drm_fbdev_client_funcs = {
>   *
>   * The fbdev is destroyed by drm_dev_unregister().
>   */
> -void drm_fbdev_generic_setup(struct drm_device *dev,
> -			     unsigned int preferred_bpp)
> +void drm_fbdev_generic_setup(struct drm_device *dev, unsigned int options)
>  {
>  	struct drm_fb_helper *fb_helper;
> +	unsigned int preferred_bpp = DRM_FB_GET_OPTION(DRM_FB_BPP, options);
>  	int ret;
>  
>  	drm_WARN(dev, !dev->registered, "Device has not been registered.\n");
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> index 7a503bf08d0f..293390f0d99c 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -334,7 +334,7 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto put;
>  
> -	drm_fbdev_generic_setup(drm, legacyfb_depth);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, legacyfb_depth));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index 2af51df6dca7..eb6f3e5d4c95 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -237,7 +237,7 @@ static int kirin_drm_bind(struct device *dev)
>  	if (ret)
>  		goto err_kms_cleanup;
>  
> -	drm_fbdev_generic_setup(drm_dev, 32);
> +	drm_fbdev_generic_setup(drm_dev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> index 9b84df34a6a1..f84b54793d96 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> @@ -148,7 +148,7 @@ struct dcss_kms_dev *dcss_kms_attach(struct dcss_dev *dcss)
>  	if (ret)
>  		goto cleanup_crtc;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return kms;
>  
> diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> index a57812ec36b1..5fd8cf003a4c 100644
> --- a/drivers/gpu/drm/imx/imx-drm-core.c
> +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> @@ -251,7 +251,7 @@ static int imx_drm_bind(struct device *dev)
>  	if (ret)
>  		goto err_poll_fini;
>  
> -	drm_fbdev_generic_setup(drm, legacyfb_depth);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, legacyfb_depth));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 8eb0ad501a7b..2e7815294e32 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1388,7 +1388,7 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>  		goto err_clk_notifier_unregister;
>  	}
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
> index e601baa87e55..e2ca0162061f 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -238,7 +238,7 @@ static int mcde_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto unbind;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 247c6ff277ef..fef2cc840baf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -393,7 +393,7 @@ static int mtk_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto err_deinit;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 1b70938cfd2c..87fcee9143a9 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -350,7 +350,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	if (ret)
>  		goto uninstall_irq;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 9d71c55a31c0..6b251916a6c9 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -357,7 +357,7 @@ static int mxsfb_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 520301b405f1..11b5aea3a166 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -308,7 +308,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
>  	if (ret < 0)
>  		goto dev_put;
>  
> -	drm_fbdev_generic_setup(drm, priv->variant->fb_bpp);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, priv->variant->fb_bpp));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 1cb6f0c224bb..883beebe6317 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -122,7 +122,7 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto modeset_cleanup;
>  
> -	drm_fbdev_generic_setup(&qdev->ddev, 32);
> +	drm_fbdev_generic_setup(&qdev->ddev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  	return 0;
>  
>  modeset_cleanup:
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 957ea97541d5..6faadab6577b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -681,7 +681,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  
>  	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
>  
> -	drm_fbdev_generic_setup(&rcdu->ddev, 32);
> +	drm_fbdev_generic_setup(&rcdu->ddev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index d858209cf8de..b97ab614d25a 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -200,7 +200,7 @@ static int sti_bind(struct device *dev)
>  
>  	drm_mode_config_reset(ddev);
>  
> -	drm_fbdev_generic_setup(ddev, 32);
> +	drm_fbdev_generic_setup(ddev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 0da7cce2a1a2..a04a54d0cc9a 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -203,7 +203,7 @@ static int stm_drm_platform_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put;
>  
> -	drm_fbdev_generic_setup(ddev, 16);
> +	drm_fbdev_generic_setup(ddev, DRM_FB_OPTION(DRM_FB_BPP, 16));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index 275f7e4a03ae..f593a8d127fa 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -112,7 +112,7 @@ static int sun4i_drv_bind(struct device *dev)
>  	if (ret)
>  		goto finish_poll;
>  
> -	drm_fbdev_generic_setup(drm, 32);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 04cfff89ee51..58f0d69b2979 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -180,7 +180,7 @@ static int tidss_probe(struct platform_device *pdev)
>  		goto err_irq_uninstall;
>  	}
>  
> -	drm_fbdev_generic_setup(ddev, 32);
> +	drm_fbdev_generic_setup(ddev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	dev_dbg(dev, "%s done\n", __func__);
>  
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index eee3c447fbac..5216365ccab5 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -384,7 +384,7 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
>  		goto init_failed;
>  	priv->is_registered = true;
>  
> -	drm_fbdev_generic_setup(ddev, bpp);
> +	drm_fbdev_generic_setup(ddev, DRM_FB_OPTION(DRM_FB_BPP, bpp));
>  	return 0;
>  
>  init_failed:
> diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
> index f0fa3b15c341..df989d5ff5a0 100644
> --- a/drivers/gpu/drm/tiny/arcpgu.c
> +++ b/drivers/gpu/drm/tiny/arcpgu.c
> @@ -392,7 +392,7 @@ static int arcpgu_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_generic_setup(&arcpgu->drm, 16);
> +	drm_fbdev_generic_setup(&arcpgu->drm, DRM_FB_OPTION(DRM_FB_BPP, 16));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index ed971c8bb446..c99608f20bcc 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -663,7 +663,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
>  	if (ret)
>  		goto err_free_dev;
>  
> -	drm_fbdev_generic_setup(dev, 32);
> +	drm_fbdev_generic_setup(dev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  	return ret;
>  
>  err_free_dev:
> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
> index 6d9d2921abf4..5fc940d09043 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -226,7 +226,7 @@ static int tve200_probe(struct platform_device *pdev)
>  	 * Passing in 16 here will make the RGB565 mode the default
>  	 * Passing in 32 will use XRGB8888 mode
>  	 */
> -	drm_fbdev_generic_setup(drm, 16);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 16));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> index f4f2bd79a7cb..2212be1bf03e 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -79,7 +79,7 @@ static int vbox_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		goto err_irq_fini;
>  
> -	drm_fbdev_generic_setup(&vbox->ddev, 32);
> +	drm_fbdev_generic_setup(&vbox->ddev, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 162bc18e7497..ddfdf9907344 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -291,7 +291,7 @@ static int vc4_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto unbind_all;
>  
> -	drm_fbdev_generic_setup(drm, 16);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 16));
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 5f25a8d15464..d62aa084392b 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -128,7 +128,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
>  	if (ret)
>  		goto err_deinit;
>  
> -	drm_fbdev_generic_setup(vdev->priv, 32);
> +	drm_fbdev_generic_setup(vdev->priv, DRM_FB_OPTION(DRM_FB_BPP, 32));
>  	return 0;
>  
>  err_deinit:
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> index 824b510e337b..be1f0f6b460b 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> @@ -135,7 +135,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
>  		goto err_poll_fini;
>  
>  	/* Initialize fbdev generic emulation. */
> -	drm_fbdev_generic_setup(drm, 24);
> +	drm_fbdev_generic_setup(drm, DRM_FB_OPTION(DRM_FB_BPP, 24));
>  
>  	return 0;
>  
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 3af4624368d8..740f87560102 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -35,6 +35,7 @@ struct drm_fb_helper;
>  #include <drm/drm_client.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
> +#include <linux/bitfield.h>
>  #include <linux/kgdb.h>
>  
>  enum mode_set_atomic {
> @@ -42,6 +43,17 @@ enum mode_set_atomic {
>  	ENTER_ATOMIC_MODE_SET,
>  };
>  
> +#define DRM_FB_BPP_MASK GENMASK(7, 0)
> +
> +/* Using the GNU statement expression extension */
> +#define DRM_FB_OPTION(option, value)				\
> +	({							\
> +		WARN_ON(!FIELD_FIT(option##_MASK, value));	\
> +		FIELD_PREP(option##_MASK, value);		\
> +	})
> +
> +#define DRM_FB_GET_OPTION(option, word) FIELD_GET(option##_MASK, word)
> +
>  /**
>   * struct drm_fb_helper_surface_size - describes fbdev size and scanout surface size
>   * @fb_width: fbdev width
> -- 
> 2.35.1
> 

-- 
Regards,

Laurent Pinchart
