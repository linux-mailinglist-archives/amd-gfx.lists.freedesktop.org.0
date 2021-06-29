Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFB3B76E1
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Jun 2021 19:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCE789CF1;
	Tue, 29 Jun 2021 17:03:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5089CF1
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 17:03:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i8so127000wrc.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Jun 2021 10:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1mzwo7wjAUa0IJEbXNRwxkpgdnTr5r+kaQt26hfpS9Q=;
 b=QmmxT28DkHNzpao9vOpgiqd/+dJLsDibGQbrStNZ7JbAn0dorBqHkDj0WWKEfZk7OQ
 FNxBzNYYbYzgKsCZ0j18iEU1KtSxaIL4Fyk8uM4HCQ67154O4rhEmH9kLiuRXoOrC5q7
 S624F07BLgYEYsvGXAHARz0QA4dg1CTiaNym2G/4ZRiWeANMPe2N15L3MveDp/WgRSYk
 IJA2nKKslgAsYg8dbGq8sMAXlDTQQYlDUbjGPAMWzEYVYvDRIOTDYXncAhpesbhqxL40
 4Pb94hp2YdPRJ2JAMke+tMLiLTqa8JIZadNCDJ75yRoh9swK/MMMGXHQQBoAwR42SkSD
 djPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1mzwo7wjAUa0IJEbXNRwxkpgdnTr5r+kaQt26hfpS9Q=;
 b=as7aOXwH388xl/g0T/JLo7Nun5NljW1PGT3Of12FR2pBHOvj7NRJ4fKeO6g7uE8tzw
 K/xEq4Zme2HMVBQhopmKudCFelfUxkfvxs6kRSlYeIWgDlQjkT4+DW8ELVH72r3Ygfi2
 4Z6AQpjyg7+t3N59GbfPjUWeCFyQNwF8zcWkXF+ywbuOItMHdYoT1kjZzSsH8/5zSwlK
 jKmOvOrpGz0I6v1q40MWsOEij9uBxegFheaSAYtfvD93iqIRvPpmySsC73xqUP8nQIMY
 VybiZYM362kyvEDBCJW1iMECRSylABuNFFvQgEIFbwJUZtYcgcKwntFt9MdfnV2EDaE6
 E2cw==
X-Gm-Message-State: AOAM532oPeDbTyzzTvACHTgYkde9oKcw4zICAiaCQq0zYAioGWMSFbdm
 umZouXAQRMLR2DcdvKiy0SVXkA==
X-Google-Smtp-Source: ABdhPJw9BHdV2PhR+4EY9fQcITZ83GZhxsD5N3hVP1Z53THaNgNupwsLwr8mtFaReraEAQtYUI3qaQ==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr34485328wrr.374.1624986222594; 
 Tue, 29 Jun 2021 10:03:42 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9ed5:b63d:622c:fb4e?
 ([2001:861:44c0:66c0:9ed5:b63d:622c:fb4e])
 by smtp.gmail.com with ESMTPSA id h10sm3399285wmb.40.2021.06.29.10.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 10:03:37 -0700 (PDT)
Subject: Re: [PATCH] drm/aperture: Pass DRM driver structure instead of driver
 name
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@redhat.com
References: <20210629135833.22679-1-tzimmermann@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <32c2b8f1-e8e5-c161-ed87-f80190173552@baylibre.com>
Date: Tue, 29 Jun 2021 19:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629135833.22679-1-tzimmermann@suse.de>
Content-Language: en-US
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
Cc: linux-hyperv@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 29/06/2021 15:58, Thomas Zimmermann wrote:
> Print the name of the DRM driver when taking over fbdev devices. Makes
> the output to dmesg more consistent. Note that the driver name is only
> used for printing a string to the kernel log. No UAPI is affected by this
> change.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

...

>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

...

>  
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index a7388bf7c838..3d0ccc7eef1b 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -285,7 +285,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	 * Remove early framebuffers (ie. simplefb). The framebuffer can be
>  	 * located anywhere in RAM
>  	 */
> -	ret = drm_aperture_remove_framebuffers(false, "meson-drm-fb");
> +	ret = drm_aperture_remove_framebuffers(false, &meson_driver);
>  	if (ret)
>  		goto free_drm;
>  

...
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
