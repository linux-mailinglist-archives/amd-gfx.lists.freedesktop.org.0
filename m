Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC21F40FC48
	for <lists+amd-gfx@lfdr.de>; Fri, 17 Sep 2021 17:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7496ED99;
	Fri, 17 Sep 2021 15:28:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3B06ED99
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 15:28:44 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id c19so9043004qte.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Sep 2021 08:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FuUl9aOPg9QPdrIHV0biXxlqCjl1iKxoc7c2hM70or8=;
 b=EP6dopb5uZ6xB7hk7smmHCo5rwSq/qA3gjv1iMAmKJMLQsW6PnAFBunN/1xmi1hXu6
 2GML45WWK+Qy4uu/0tuA8sliENLT25yh//O1S3sl0FUEBZsX81zfA5koKK94JNQnFHH1
 uz3yvspNzd7So2lSSZQVZt9Wr8Jlirf92luhT2KUG6Z6wKYAibqX193EJntyfbxgsA/v
 WfM3db9CQdmLuWmo5lrr7gjzVjxTDrN42OVTS1cpGd82NpyAn46eVqVhuI0PSNNvgC0B
 R8oBexpwsV8NVpFPts3OtNTB38vP5ToFW1dyoMM0N/XyctmB0nORrD44BWtEGhK79E9J
 2N5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FuUl9aOPg9QPdrIHV0biXxlqCjl1iKxoc7c2hM70or8=;
 b=rgcK97tqGNOrKc5xOekNjFGA/zPR3ci8nXrjrLB7lkiN55aBd3/YWeKwwM/AyZS/D3
 z3njy9AylLJd/t9+Q46EWjXiGiEf1ltaD/CxJMqD+TrUUAz+iUKqVHCbxBN+Vfp+RB7T
 8xZdINs+dE1Eylh7zhu/A1nRddVPuE+qhLilOHf9rOuowRdLEYKFKYGBMR51XK4m4S3V
 mQ7M58E0Ohy4D3Jj9AKYUTKshSF5I2PPuuTwInjH7unnQLpBn1GigAffViXOkVDuhRwT
 +n8Yl9z26nsuCeimxb4oGzp9A4cteBVg5cx+V1jnPxeoGQMJsdXJ26bBbs5fHlybZGVu
 cuAw==
X-Gm-Message-State: AOAM533rUrmftqGxDixBPTgfpO27IYf8xLh3rw91WyTSGWZZAONmkk7B
 M1yzx/ul856xBHUvVOdjwViR7w==
X-Google-Smtp-Source: ABdhPJz+1IlUibrmV063aG8RG51cYbX7TCpqGdEoZMmlxd6qClcPIVgP6f5A94RrfNPtSYy6ER/Jeg==
X-Received: by 2002:a05:622a:1347:: with SMTP id
 w7mr10705287qtk.325.1631892523996; 
 Fri, 17 Sep 2021 08:28:43 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id l1sm1746827qkj.65.2021.09.17.08.28.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:28:43 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:28:42 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/15] dmr: cleanup: drm_modeset_lock_all_ctx() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917152842.GA2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-2-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-2-greenfoo@u92.eu>
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

On Thu, Sep 16, 2021 at 11:15:38PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace the boilerplate code
> surrounding drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN()
> and DRM_MODESET_LOCK_ALL_END()
> 

Hi Fernando,
Thank you for your patch. Could you please fix the subject, changing dmr to drm?

> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index ced09c7c06f9..5f5184f071ed 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -574,6 +574,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  	int num_connectors_detected = 0;
>  	int num_tiled_conns = 0;
>  	struct drm_modeset_acquire_ctx ctx;
> +	int err;

I think you can just reuse 'ret' instead of creating a new variable. That
ensures if the lock fails we return the error from the macros.

Sean

>  
>  	if (!drm_drv_uses_atomic_modeset(dev))
>  		return false;
> @@ -585,10 +586,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  	if (!save_enabled)
>  		return false;
>  
> -	drm_modeset_acquire_init(&ctx, 0);
> -
> -	while (drm_modeset_lock_all_ctx(dev, &ctx) != 0)
> -		drm_modeset_backoff(&ctx);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
>  
>  	memcpy(save_enabled, enabled, count);
>  	mask = GENMASK(count - 1, 0);
> @@ -743,8 +741,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
>  		ret = false;
>  	}
>  
> -	drm_modeset_drop_locks(&ctx);
> -	drm_modeset_acquire_fini(&ctx);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
>  
>  	kfree(save_enabled);
>  	return ret;
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
