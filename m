Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E78CC20A
	for <lists+amd-gfx@lfdr.de>; Wed, 22 May 2024 15:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73A010E009;
	Wed, 22 May 2024 13:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hXQh52zr";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F6E10E009
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2024 13:22:50 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52232d0e5ceso6679022e87.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 May 2024 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716384168; x=1716988968; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SIQhe+tMA9rQZRm9Mwh+CFPQmYiZHvqL/eBWhNaMzk4=;
 b=hXQh52zrUhIC1xs8BfnlFg1ISJVTTcq7YcvkiOdNM5FzMc6I3Rq1bfwJbgQB1sZEal
 NrUTsnmHzEXsC6vV20hMUoDRXtGVJbldN6Qox+Q09OCP3kNUaFL0Lcd2EM2L5NIadzju
 DlzC7FcZ1Nql9VAJ0V/e8JCyMOPigPb4cAOCIqOgnLx4lzBSVpHifeu9v2R8oeYqD76v
 HUXxhZ4IWyA5SfOVSd4jFKGn72ug+ywsOTjslBtIm4ECSjyTVc+8lTGkoBcqGhfDRhqr
 aulSEbVE7Ls/lpeHb8lfGX8r/2etWgzNsGwNXKKtfBukA2h/23Ze70O/8nGBAY7Iaeo5
 fSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716384168; x=1716988968;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SIQhe+tMA9rQZRm9Mwh+CFPQmYiZHvqL/eBWhNaMzk4=;
 b=Z84w4lbBXImBvRD0zn0Qvp7R1xmd0YqMr6cR8iRXO5PZgPNfpxNLbiUrMOmw4pT0/S
 0L79fuPk1mVUrZeXhULvegycEuyAGuB0g5Vu7mY+9U/gfWnpCDwKGFXk72fdyu0PGtWu
 BSrXYzauFJW5x3OTvXRxwDomQLUGSUGnCSOigMk6CQDn6cUYIzK8mx+QkdzTSk4HSMvr
 7Bj91oKctBnWabOeEvsrhZD7yCr3ytezeGBw0sxvhzs+Qy2dj/I905EntroF7zeQvbU6
 z6pk9I3XDkPy32y7jYG27j4YEkVzYBrQh0teXouuIjUKAB9TbTxUFDxSg651/iDKDYxJ
 4mwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs6NDMykut1ribMnVMlVx9Zx7GW5NQru0MTnAVGmHHkzgFbXYYpAipJrKxFyjwPlp3kqj/6paA4wAwIN56wx6iHMPrrmXB79AbFoQ40A==
X-Gm-Message-State: AOJu0YxJWUIUlyo+qlMbsmT6y92voVwRuYHNRcF2/HTz46s4g2vm5OmR
 B9NKkWxLNJCTzQ1XpkuItJPXNhzKrM3mb+A4pjQtIjp+1BJ7AN+VLNeLeVOYquI=
X-Google-Smtp-Source: AGHT+IEJ1RiNW8YrnORaBDNfPmmtG7Bn1EKHBtoqVKkkH/thyN4HZM7d5vLvLSrdVzne35J8DxG+nw==
X-Received: by 2002:a05:6512:3458:b0:523:b7ec:a218 with SMTP id
 2adb3069b0e04-526bf35cad3mr1272832e87.21.1716384168467; 
 Wed, 22 May 2024 06:22:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10?
 ([2a01:e0a:982:cbb0:8b9d:52bd:4757:6b10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17844sm1776943566b.190.2024.05.22.06.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 06:22:47 -0700 (PDT)
Message-ID: <c9c8aa2f-38c8-4362-8b08-9fbc0821ae0c@linaro.org>
Date: Wed, 22 May 2024 15:22:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
 <20240522-panel-sw43408-fix-v3-2-6902285adcc0@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240522-panel-sw43408-fix-v3-2-6902285adcc0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 22/05/2024 08:25, Dmitry Baryshkov wrote:
> This panel driver uses DSC PPS functions and as such depends on the
> DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
> available to the driver.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
> Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/panel/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 4a2f621433ef..3e3f63479544 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
>   	depends on OF
>   	depends on DRM_MIPI_DSI
>   	depends on BACKLIGHT_CLASS_DEVICE
> +	select DRM_DISPLAY_DSC_HELPER
> +	select DRM_DISPLAY_HELPER
>   	help
>   	  Say Y here if you want to enable support for LG sw43408 panel.
>   	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
