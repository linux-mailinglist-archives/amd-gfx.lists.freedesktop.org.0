Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67715D2FA
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 08:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579586E463;
	Fri, 14 Feb 2020 07:39:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2486E462
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Feb 2020 07:39:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so9713681wrt.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 Feb 2020 23:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gwEXGayWNjSUDwj4aJkTLljk4bGT0CReLTVZDc39sU0=;
 b=Xq/pG5yyeEeBlDKdZXWTpZm8VEBGTgxYCdZ0teJEdSa+sexS8LAIinohzMT9BQ+PYe
 MT6CMno/oGY5ounDL+2VbMpPq9hyR6lHROVtnMpZuE6cXry0wCzBdYd12qVVXwcH+FhM
 Un1dpnGmyi28nSDZ1G+9gv/5vXXRdDCsO1a40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gwEXGayWNjSUDwj4aJkTLljk4bGT0CReLTVZDc39sU0=;
 b=lYkrEpsN+JsBBLaWyi6Xo81dbdVwCB1hw7UqiCxggP/U+b0f+STxiPSlf+Yv/itgpi
 EJ8WkxoykIN0WWsJZ9uU4wioIivfziNLG3tYZS64IxJnd2DqSspwTXLbcOIeOR7oVbMa
 R2XzXteow4mzwMaqG9M8CF1soqWCLcF35P2LUJSUUy++IxnsvM1ldn4Z8X5ZoGWs07zm
 54Am6F1lA27eoFnhwnGfvj94wWOesL3spDJXJAXpfBNu1Obczs8osikMgmBwokdyHwRE
 uYstIc1vFJ87VulwgQCvtv6hcfsqBwYnbcZcot1fYWhJ1nFGGiKlPjmifsVE/7UFJy7P
 AUwg==
X-Gm-Message-State: APjAAAWofmnu5vJio6o8ZLZBFRJrQZzrnHS66Oh/NqPXVOyZV9409yig
 r1K1CtuRc4oGS94RLe/U4F81Yw==
X-Google-Smtp-Source: APXvYqwcG8o8u+cGRJxharaUuoXuRJfBSDoC9kR2L00dkWuuhKJ3mN4MBN9VolZV6wjcMWeZVtIMEw==
X-Received: by 2002:a05:6000:1112:: with SMTP id
 z18mr2343126wrw.140.1581665977001; 
 Thu, 13 Feb 2020 23:39:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e1sm6052742wrt.84.2020.02.13.23.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 23:39:36 -0800 (PST)
Date: Fri, 14 Feb 2020 08:39:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 13/15] drm/amdgpu/display: split dp connector
 registration (v3)
Message-ID: <20200214073934.GV2363188@phenom.ffwll.local>
References: <20200207211713.3870-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207211713.3870-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 04:17:13PM -0500, Alex Deucher wrote:
> Split into init and register functions to avoid a segfault
> in some configs when the load/unload callbacks are removed.
> 
> v2:
> - add back accidently dropped has_aux setting
> - set dev in late_register
> 
> v3:
> - fix dp cec ordering

Why did you move this back out of the late_register callback when going
from v2->v3? In i915 we register the cec stuff from ->late_register, like
anything else userspace visible. Maybe follow-up patch (the idea behind
removing the ->load callback is to close all the driver load races,
instead of only open("/dev/dri/0"), which is protected by
drm_global_mutex). On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c   | 16 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c         | 10 ++--------
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  |  7 ++++++-
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> index ec1501e3a63a..f355d9a752d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
> @@ -1461,6 +1461,20 @@ static enum drm_mode_status amdgpu_connector_dp_mode_valid(struct drm_connector
>  	return MODE_OK;
>  }
>  
> +static int
> +amdgpu_connector_late_register(struct drm_connector *connector)
> +{
> +	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
> +	int r = 0;
> +
> +	if (amdgpu_connector->ddc_bus->has_aux) {
> +		amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
> +		r = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> +	}
> +
> +	return r;
> +}
> +
>  static const struct drm_connector_helper_funcs amdgpu_connector_dp_helper_funcs = {
>  	.get_modes = amdgpu_connector_dp_get_modes,
>  	.mode_valid = amdgpu_connector_dp_mode_valid,
> @@ -1475,6 +1489,7 @@ static const struct drm_connector_funcs amdgpu_connector_dp_funcs = {
>  	.early_unregister = amdgpu_connector_unregister,
>  	.destroy = amdgpu_connector_destroy,
>  	.force = amdgpu_connector_dvi_force,
> +	.late_register = amdgpu_connector_late_register,
>  };
>  
>  static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
> @@ -1485,6 +1500,7 @@ static const struct drm_connector_funcs amdgpu_connector_edp_funcs = {
>  	.early_unregister = amdgpu_connector_unregister,
>  	.destroy = amdgpu_connector_destroy,
>  	.force = amdgpu_connector_dvi_force,
> +	.late_register = amdgpu_connector_late_register,
>  };
>  
>  void
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index ea702a64f807..9b74cfdba7b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -186,16 +186,10 @@ amdgpu_atombios_dp_aux_transfer(struct drm_dp_aux *aux, struct drm_dp_aux_msg *m
>  
>  void amdgpu_atombios_dp_aux_init(struct amdgpu_connector *amdgpu_connector)
>  {
> -	int ret;
> -
>  	amdgpu_connector->ddc_bus->rec.hpd = amdgpu_connector->hpd.hpd;
> -	amdgpu_connector->ddc_bus->aux.dev = amdgpu_connector->base.kdev;
>  	amdgpu_connector->ddc_bus->aux.transfer = amdgpu_atombios_dp_aux_transfer;
> -	ret = drm_dp_aux_register(&amdgpu_connector->ddc_bus->aux);
> -	if (!ret)
> -		amdgpu_connector->ddc_bus->has_aux = true;
> -
> -	WARN(ret, "drm_dp_aux_register_i2c_bus() failed with error %d\n", ret);
> +	drm_dp_aux_init(&amdgpu_connector->ddc_bus->aux);
> +	amdgpu_connector->ddc_bus->has_aux = true;
>  }
>  
>  /***** general DP utility functions *****/
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 3959c942c88b..d5b9e72f2649 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -155,6 +155,11 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
>  	struct amdgpu_dm_connector *amdgpu_dm_connector =
>  		to_amdgpu_dm_connector(connector);
>  	struct drm_dp_mst_port *port = amdgpu_dm_connector->port;
> +	int r;
> +
> +	r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
> +	if (r)
> +		return r;
>  
>  #if defined(CONFIG_DEBUG_FS)
>  	connector_debugfs_init(amdgpu_dm_connector);
> @@ -484,7 +489,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
>  	aconnector->dm_dp_aux.aux.transfer = dm_dp_aux_transfer;
>  	aconnector->dm_dp_aux.ddc_service = aconnector->dc_link->ddc;
>  
> -	drm_dp_aux_register(&aconnector->dm_dp_aux.aux);
> +	drm_dp_aux_init(&aconnector->dm_dp_aux.aux);
>  	drm_dp_cec_register_connector(&aconnector->dm_dp_aux.aux,
>  				      &aconnector->base);
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
