Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i+uIF3FTVWqqmwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 23:06:57 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1CA74F2DB
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 23:06:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=MEtLxz+Q;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FCA10EB16;
	Mon, 13 Jul 2026 21:06:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2F310EB11;
 Mon, 13 Jul 2026 21:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQrScTMErwGvqTbe4/xRXxRntlCADJUSrD0i3fE7pTU=; b=MEtLxz+QaBvAuYqwlzpVK9DTMK
 2vEikTmQdo/d7diC4pmJnjScn04vhjDtET+9wHUXgiQHEmu0BIMMxxhxshP4pVaYWrXatPaYZ9UqU
 mc7YRYAqKwsAHGUmizXgKPSxzM/lR3Gk1SW1YMdgGr1ylDHKsHYyNGACbJzqA8tE7ufKdKb5y0ko8
 BAS0RWViFgPHrjDdIEE4xm0VgTh5XjXn4fV/TRBbRBTN928yOaf1tbGjAI8++zHNBrx68UpXzoWbo
 fKemjPL6WqzUQzwwWLoDWB+nc2P+XC3EtFfudlRWuulA7M+RJqiCW7gImoyIrJRQ0COXpx48MLmcI
 59Z0HZjA==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=[192.168.1.133]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wjNr8-00Eg7T-Rb; Mon, 13 Jul 2026 23:06:27 +0200
Message-ID: <220b89a8-348e-4021-a11a-cfd73610c688@Igalia.com>
Date: Mon, 13 Jul 2026 14:06:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/9] drm/managed: implement managed versions of
 kzalloc_obj/objs()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20260612-wb-drop-encoder-v6-0-9f3a54f81310@oss.qualcomm.com>
 <20260612-wb-drop-encoder-v6-1-9f3a54f81310@oss.qualcomm.com>
Content-Language: en-GB
From: John Harrison <John.Harrison@Igalia.com>
In-Reply-To: <20260612-wb-drop-encoder-v6-1-9f3a54f81310@oss.qualcomm.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,arm.com,ideasonboard.com,glider.be,raspberrypi.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[John.Harrison@Igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,Igalia.com:from_mime,Igalia.com:mid,igalia.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF1CA74F2DB

On 6/12/26 11:30, Dmitry Baryshkov wrote:
> The kzalloc_obj() and kzalloc_objs() functions proven to be useful and
> widely used for the reset of the kernel. Implement a drm_device-managed
> versions of those macros to mix the nice interface with the automatic
> freeing of the pointers.
>
> Note: the original macros accept optional GFP_foo arguments. They are
> skipped for now, making all allocations use GFP_KERNEL. If necessary,
> support for overriding the GFP type can be introduced later.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/drm/drm_managed.h | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 72d0d68be226..79049bec277d 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -105,6 +105,28 @@ static inline void *drmm_kcalloc(struct drm_device *dev,
>   	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
>   }
>   
> +/**
> + * drmm_kzalloc_objs - &drm_device-managed kzalloc_objs()
> + * @dev: DRM device
> + * @p: Variable or type to allocate an array of
> + * @count: How many elements in the array
> + *
> + * Returns: newly allocated pointer to the zeroed array of @P on success, or
There is a mix of p and P going on here. With this made more consistent:
Reviewed-by: John Harrison <John.Harrison@Igalia.com>

> + * NULL on failure.
> + */
> +#define drmm_kzalloc_objs(dev, p, count) \
> +	drmm_kcalloc(dev, count, sizeof(typeof(p)), GFP_KERNEL)
> +
> +/**
> + * drmm_kzalloc_obj - &drm_device-managed kzalloc_obj()
> + * @dev: DRM device
> + * @p: Variable or type to allocate
> + *
> + * Returns: newly allocated pointer to a @p on success, or NULL on failure.
> + */
> +#define drmm_kzalloc_obj(dev, P) \
> +	drmm_kzalloc_objs(dev, P, 1)
> +
>   char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>   
>   void drmm_kfree(struct drm_device *dev, void *data);
>

