Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1832A83A9
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Nov 2020 17:38:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30226EDC7;
	Thu,  5 Nov 2020 16:38:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95526EDC7;
 Thu,  5 Nov 2020 16:38:39 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D181420068;
 Thu,  5 Nov 2020 17:38:33 +0100 (CET)
Date: Thu, 5 Nov 2020 17:38:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/19] [Set 1] Rid W=1 warnings from GPU
Message-ID: <20201105163831.GA86540@ravnborg.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=AZguWiFxckorV0VyCPwA:9 a=CjuIK1q_8ugA:10
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Gareth Hughes <gareth@valinux.com>, Fabio Estevam <festevam@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, David Francis <David.Francis@amd.com>,
 Jingoo Han <jg1.han@samsung.com>, amd-gfx@lists.freedesktop.org,
 Rob Clark <rob.clark@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-media@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 linaro-mm-sig@lists.linaro.org, linux-tegra@vger.kernel.org,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Lee.

On Thu, Nov 05, 2020 at 02:44:58PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Thanks for looking into this.

> There are 5000 warnings to work through.
> 
> It will take a couple more sets.
:-)

>   gpu: drm: panel: panel-simple: Fix 'struct panel_desc's header
I have a patch here that inline the comments - and fix the warning as a
side effect. I will get it posted tonight as this is better.

>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_write_byte_to_dpcd'
When I looked at his I had another unused function after removing the
first.

>   gpu: drm: panel: panel-ilitek-ili9322: Demote non-conformant
>     kernel-doc header
Agree on this simple approch, will apply.

>   gpu: drm: bridge: analogix: analogix_dp_reg: Remove unused function
>     'analogix_dp_start_aux_transaction'
OK, this was the one I referred to above. They should be squashed into
one patch.

	Sam
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
