Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4C13B421
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jan 2020 22:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A42316E03E;
	Tue, 14 Jan 2020 21:15:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C110C6E03E
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 21:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579036552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dLZFzHoDX4/nIpEkxB7fjMVOWkFZ3Uk8z25Kzc5DOM=;
 b=Meh26XuGzxqo84yp+WuW3nlAVbDpV3pN8QRHU7pyAbHeNX/4W6hlOq6zmRbfhQzdWAiey4
 dBvoTsSIToaQ6RN/xjNu0X7CJbkMkw9IXZlA13+cOhEdgGWVVIYHnlW+UY6gII9Giptxgk
 QK2Z2XLFmC1f4Bmh8tk0MqzTnI3NGL4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-LFSZMyyNPxmQ4kXBp8ozsg-1; Tue, 14 Jan 2020 16:15:50 -0500
Received: by mail-qt1-f197.google.com with SMTP id m15so9859506qtc.18
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jan 2020 13:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=4dLZFzHoDX4/nIpEkxB7fjMVOWkFZ3Uk8z25Kzc5DOM=;
 b=BBQ6Rj+uGqa6M6Cx1fNVTsykHs38QklOAUvsr74i8aVedTAVcB5cMhWehuKAcwJnFY
 12kW71frbV1Omi2/yHTprmw7tQb2dHxV+WhmiXXC8nJVtzyEDjjbGVQOTUsqn2gSXqTl
 15oz3CEgG41y5I7iMdokZDgkweXJt+jCYGlGskKsXUzDix5izUdRbDoPUunE11uRUCmJ
 oMHYxQo2Ks3jMd6/MttMzjELwja3Eez2cWPXEbmVeNcyIzo5Q8qu2ou+Wmd83ddxQbJw
 WeYFNE7/PoaNWlVm9POGV6lDfEIlCK5c2R/UxXmJceznoj78fe5V+gyJGHCW0zhZqA6U
 aZrA==
X-Gm-Message-State: APjAAAWuh9ySxYzYsT8wupitK8NSKV25zr01BVP0s2FUnr2jnsP4YCc4
 9mt5RttaECRzEEpm1Irz4mdHlqCZAElv3ZDU58NCgHt6DIfxOgQX4/p5gv8z1EqsQtZkzy4MFcf
 vio+3JL0N8F5ATNHpVGjfWlLUnw==
X-Received: by 2002:ac8:6f09:: with SMTP id g9mr526946qtv.275.1579036550428;
 Tue, 14 Jan 2020 13:15:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdRSDaOCZLpU6ux4R1u+wRFXnjkK7RIWBkoulbP+Cz+RP2MsawgnI3FJncxS+Ha5sAyieEgA==
X-Received: by 2002:ac8:6f09:: with SMTP id g9mr526920qtv.275.1579036550195;
 Tue, 14 Jan 2020 13:15:50 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id z28sm8293307qtz.69.2020.01.14.13.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 13:15:49 -0800 (PST)
Message-ID: <e9312adec3c177cd70a4c65d60bbc291ac9d8fb6.camel@redhat.com>
Subject: Re: [PATCH 1/2] drm/dp_mst: Add a function to determine the mst end
 device
From: Lyude Paul <lyude@redhat.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
Date: Tue, 14 Jan 2020 16:15:48 -0500
In-Reply-To: <20200108084416.6296-2-Wayne.Lin@amd.com>
References: <20200108084416.6296-1-Wayne.Lin@amd.com>
 <20200108084416.6296-2-Wayne.Lin@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: LFSZMyyNPxmQ4kXBp8ozsg-1
X-Mimecast-Spam-Score: 0
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
Cc: jerry.zuo@amd.com, harry.wentland@amd.com, Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This patch series looks awesome so far, thank you for the great work! This
patch looks great, I think we should just squash it into the next patch though
since we don't use this function until then.

On Wed, 2020-01-08 at 16:44 +0800, Wayne Lin wrote:
> [Why]
> For later usage convenience, add the function
> drm_dp_mst_is_dp_mst_end_device() to decide whether a peer device
> connected to a DFP is mst end device. Which also indicates if the peer
> device is capable of handling message or not.
> 
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index eebf325d7f48..8f54b241db08 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1918,6 +1918,22 @@ static u8 drm_dp_calculate_rad(struct drm_dp_mst_port
> *port,
>  	return parent_lct + 1;
>  }
>  
> +static bool drm_dp_mst_is_dp_mst_end_device(u8 pdt, bool mcs)
> +{
> +	switch (pdt) {
> +	case DP_PEER_DEVICE_DP_LEGACY_CONV:
> +	case DP_PEER_DEVICE_SST_SINK:
> +		return true;
> +	case DP_PEER_DEVICE_MST_BRANCHING:
> +		/* For sst branch device */
> +		if (!mcs)
> +			return true;
> +
> +		return false;
> +	}
> +	return true;
> +}
> +
>  static int drm_dp_port_set_pdt(struct drm_dp_mst_port *port, u8 new_pdt)
>  {
>  	struct drm_dp_mst_topology_mgr *mgr = port->mgr;
-- 
Cheers,
	Lyude Paul

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
