Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HW5KGWxHmr7JAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 12:33:09 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1014562CA14
	for <lists+amd-gfx@lfdr.de>; Tue, 02 Jun 2026 12:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14FA10EE9A;
	Tue,  2 Jun 2026 10:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="m3Xcf++W";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B5C1810EE9A
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 10:33:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E41C353D
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 03:33:01 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 0561F3F632
 for <amd-gfx@lists.freedesktop.org>; Tue,  2 Jun 2026 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
 t=1780396386; bh=iOHUK6brXgyIm879Y6Al2FeqYaz5id6uidKZL33WOWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m3Xcf++WuiNVPX1/ienNqF5arq4fFFEj7N115eYOaHd88WyovjkM/FbYd83JL8RMd
 bBUmWJb5sOW/L7N3G8y4EMMhOoI9d8KXtbvBLpfOBkKjNs4sd2rFxZZZToEySVe/dr
 4ajsofygBG6bP8HBlYq8RdwqAqepvwXAe4uCdbYs=
Date: Tue, 2 Jun 2026 11:32:32 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 3/8] drm/komeda: use drmm_writeback_connector_init()
Message-ID: <ah6xQEWemicF_ECc@e142607>
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com>
 <20260505-wb-drop-encoder-v5-3-42567b7c7af2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505-wb-drop-encoder-v5-3-42567b7c7af2@oss.qualcomm.com>
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
X-Rspamd-Queue-Id: 1014562CA14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[arm.com:s=foss];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:jani.nikula@linux.intel.com,m:suraj.kandpal@intel.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:laurent.pinchart+renesas@ideasonboard.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:kieran.bingham+renesas@ideasonboard.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:christophe.jaillet@wanadoo.fr,m:jesszhan0024@gmail.com,m:louis.chauvet@bootlin.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:
 laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email,bootlin.com:email,intel.com:email]
X-Rspamd-Action: no action

On Tue, May 05, 2026 at 03:25:00AM +0300, Dmitry Baryshkov wrote:
> The driver uses drm_writeback_connector_init() instead of its drmm
> counterpart, but it doesn't perform the job queue cleanup (neither
> manually nor by calling drm_writeback_connector_cleanup()). On the
> contrary, the drmm_writeback_connector_init() function ensures the
> proper cleanup of the job queue.
> 
> Use drmm_plain_encoder_alloc() to allocate simple encoder and
> drmm_writeback_connector_init() in order to initialize writeback
> connector instance.
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  .../drm/arm/display/komeda/komeda_wb_connector.c   | 30 ++++++++++++----------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> index 41cc3e080dc9..bcc53d4015f1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_wb_connector.c
> @@ -5,6 +5,7 @@
>   *
>   */
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>  #include "komeda_dev.h"
>  #include "komeda_kms.h"
>  
> @@ -121,17 +122,10 @@ komeda_wb_connector_fill_modes(struct drm_connector *connector,
>  	return 0;
>  }
>  
> -static void komeda_wb_connector_destroy(struct drm_connector *connector)
> -{
> -	drm_connector_cleanup(connector);
> -	kfree(to_kconn(to_wb_conn(connector)));
> -}
> -
>  static const struct drm_connector_funcs komeda_wb_connector_funcs = {
>  	.reset			= drm_atomic_helper_connector_reset,
>  	.detect			= komeda_wb_connector_detect,
>  	.fill_modes		= komeda_wb_connector_fill_modes,
> -	.destroy		= komeda_wb_connector_destroy,
>  	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
>  };
> @@ -143,13 +137,15 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  	struct komeda_wb_connector *kwb_conn;
>  	struct drm_writeback_connector *wb_conn;
>  	struct drm_display_info *info;
> +	struct drm_encoder *encoder;
> +
>  	u32 *formats, n_formats = 0;
>  	int err;
>  
>  	if (!kcrtc->master->wb_layer)
>  		return 0;
>  
> -	kwb_conn = kzalloc_obj(*kwb_conn);
> +	kwb_conn = drmm_kzalloc(&kms->base, sizeof(*kwb_conn), GFP_KERNEL);
>  	if (!kwb_conn)
>  		return -ENOMEM;
>  
> @@ -165,11 +161,19 @@ static int komeda_wb_connector_add(struct komeda_kms_dev *kms,
>  		return -ENOMEM;
>  	}
>  
> -	err = drm_writeback_connector_init(&kms->base, wb_conn,
> -					   &komeda_wb_connector_funcs,
> -					   &komeda_wb_encoder_helper_funcs,
> -					   formats, n_formats,
> -					   BIT(drm_crtc_index(&kcrtc->base)));
> +	encoder = drmm_plain_encoder_alloc(&kms->base, NULL,
> +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> +	if (IS_ERR(encoder))
> +		return PTR_ERR(encoder);
> +
> +	drm_encoder_helper_add(encoder, &komeda_wb_encoder_helper_funcs);
> +
> +	encoder->possible_crtcs = drm_crtc_mask(&kcrtc->base);
> +
> +	err = drmm_writeback_connector_init(&kms->base, wb_conn,
> +					    &komeda_wb_connector_funcs,
> +					    encoder,
> +					    formats, n_formats);
>  	komeda_put_fourcc_list(formats);
>  	if (err) {
>  		kfree(kwb_conn);
> 
> -- 
> 2.47.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
