Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wByaODT2v2moBgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Mar 2026 15:01:24 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537352E98E4
	for <lists+amd-gfx@lfdr.de>; Sun, 22 Mar 2026 15:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AF410E21D;
	Sun, 22 Mar 2026 14:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lrt8fvFa";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7710E1A6
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4EB244560
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A803C2BCB4
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2026 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774188080;
 bh=QmdXwTMByXlQtXyVEuM8ZEQe80RkWuQUj8gRkLjyMOs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lrt8fvFazEtLA06IWldGlVlmOQ9mHzsIa5lVgNVMJuSLZls+9ojaALd2yLH9TNEK8
 Z9AFdviJ2lH+eG675obsclGgxjJPTRcR4aY9K2wcxIRO4SxtnQE2vD38hUhjmnSxNl
 fbIkJfFr85Mi6bC+kRkjnqxWTUvDU0vDN932IWPczz0VpJZdBLSRxu5Xe42qUqrH62
 ouH6ScH4hlVLr8Ah+of3+v7WGTtarOykMwhMNii4TFCDP1/dh7cH0Fn36QDbjgMLbj
 tVPINM0Fdw6zw+4j9KR5Qak4ZCyu+equOiDjcaEFva7JzaVpWesAogJeJme0DmRoVn
 6fJJI4MGAtdWA==
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2c0e38f3f60so1736288eec.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 22 Mar 2026 07:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqEk1KuoEnUXPtAxTFpciieS6zV/M1zAbgCBqnlwSGSfCbbsTdo4YNfo2Tzw4X2KBEZx57T/r2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJzyzyrzzzSXVuS+nxEMr/tjVgUrLQb1EDJ9d4AoxNk0DWM9tk
 oXgkkCpCHvcU/18DMb/qI514r5scc48gDk3chnfSu0l5FIxvL6z9yDTZkdsDtCDmuNixGq8yb2o
 j69rb17jQ/uRN9ANfaebu6oL0kd1QDw==
X-Received: by 2002:a05:7022:125:b0:119:e569:f875 with SMTP id
 a92af1059eb24-12a72342011mr4458266c88.18.1774188079697; Sun, 22 Mar 2026
 07:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
 <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-11-f3935f6db579@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 22 Mar 2026 14:01:07 +0000
X-Gmail-Original-Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
X-Gm-Features: AaiRm51o2YPhQeYKXw9UtRNG-i4wgZe6wEfJUWBYiwwTcCwjkboilWj5OZVfgGo
Message-ID: <CAAOTY__bMYqtVLqYin4sLs1F=-yWoYVj=W0osL_vcwdqCHVACw@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] drm/mediatek: dp: Convert to
 drm_output_color_format
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,rock-chips.com,arm.com,pengutronix.de,sntech.de,nxp.com,sholland.org,raspberrypi.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:nicolas.frattaroli@collabora.com,m:jani.nikula@linux.intel.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:andy.yan@rock-chips.com,m:liviu.dudau@arm.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:victor.liu@nxp.com,m:wens@kernel.org,m:samuel@sholland.org,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.i
 nfradead.org,m:linux-sunxi@lists.linux.dev,m:jani.nikula@intel.com,m:jernejskrabec@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_SENDER(0.00)[chunkuang.hu@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[chunkuang.hu@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 537352E98E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Maxime Ripard <mripard@kernel.org> =E6=96=BC 2026=E5=B9=B43=E6=9C=885=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Now that we introduced a new drm_output_color_format enum to represent
> what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
> enum.
>
> The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
> drm_output_color_format is a proper enum. However, the enum was done is
> such a way than DRM_COLOR_FORMAT_X =3D BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
> the transitition is easier.
>
> The only thing we need to consider is if the original code meant to use
> that value as a bitmask, in which case we do need to keep the bit shift,
> or as a discriminant in which case we don't.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>
