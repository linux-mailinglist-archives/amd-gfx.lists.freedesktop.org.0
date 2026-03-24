Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIjmLQyHwmkAegQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2026 13:43:56 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F65F308840
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Mar 2026 13:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA5610E69A;
	Tue, 24 Mar 2026 12:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EOH1niQc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5E510E0E8;
 Tue, 24 Mar 2026 09:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1774343785; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SYajBwuiZa8oR0IGy+sTz3PqpZrdBA/lNr0MoEAENTM+2lZ3W133Sd2UB4kk7kFSdTYfqIMtNFyozDZ6AIe3N/H//n0LK8rfhUdvxkX9oV8qVzaUuXHbvvnXhEpOQqBhz0mhFmGxqCSgw98UansqvWiOPFBBPmF/TUNnL7C2HnQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1774343785;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Tw/G9VTXwnHHHKSCmjoBsBkmBbbcaWdFFIwUqNEEQZw=; 
 b=PAZeN6C+SYUsvuGqzrS2CnaplC+BBQxWmcHgJiQgN+kus0naAKpO3ZZR8NMDhCOexYzujaiRdez3CsD4DH0GWdZl707RYgn0Tj4CmR4qacVn4KYFOyL2HzsWv9TAlrN/ri62vXemfjXVra8akvFnMBlD2zwcos8lYv+Dkts7ulM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774343785; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=Tw/G9VTXwnHHHKSCmjoBsBkmBbbcaWdFFIwUqNEEQZw=;
 b=EOH1niQczPS5fbilI4PiiNRgJuvNBqXb7Mfen8spkZtWoA8KCHnvlGcBIuYVFEWp
 T+j1DeFy1jVFNoJJSanWd2d1AH3/DIq1hNRaBr8FseE+DZypZmgdFb2Zjv8wSPuH0CZ
 MP9TL1jsYt98vtYhRXvkCuUjsC9UiyERHaGiwJYI=
Received: by mx.zohomail.com with SMTPS id 1774343783701798.6167436689976;
 Tue, 24 Mar 2026 02:16:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 12/14] drm/rockchip: analogix: Convert to
 drm_output_color_format
Date: Tue, 24 Mar 2026 10:16:14 +0100
Message-ID: <5921295.GXAFRqVoOG@workhorse>
In-Reply-To: <20260305-drm-rework-color-formats-v3-12-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-12-f3935f6db579@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Mailman-Approved-At: Tue, 24 Mar 2026 12:43:53 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,collabora.com,sntech.de,nxp.com,sholland.org,raspberrypi.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 0F65F308840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, 5 March 2026 10:05:04 Central European Standard Time Maxime Ripard wrote:
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
> 
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
> 
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> index fdab71d51e2a71d644f128b1bf1c39429b4ad52a..96bd3dd239d251af3d5a7d0fbd4dd74942d44f2d 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -169,16 +169,16 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
>  static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
>  				 struct drm_connector *connector)
>  {
>  	struct drm_display_info *di = &connector->display_info;
>  	/* VOP couldn't output YUV video format for eDP rightly */
> -	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
> +	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
>  
>  	if ((di->color_formats & mask)) {
>  		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
>  		di->color_formats &= ~mask;
> -		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
> +		di->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
>  		di->bpc = 8;
>  	}
>  
>  	return 0;
>  }
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I'm not the maintainer of this driver, but touched both the color
formats and rockchip code enough to confidently state that this
patch is trivially correct. I'm sure Heiko and Andy will agree. :)

Kind regards,
Nicolas Frattaroli


