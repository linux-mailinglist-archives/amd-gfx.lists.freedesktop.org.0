Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67B17FBCC2
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Nov 2023 15:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7D10E55E;
	Tue, 28 Nov 2023 14:30:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::ac])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDE010E1BE
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Nov 2023 12:01:22 +0000 (UTC)
Message-ID: <c7713283-032c-4454-823b-d7de9bfd5d5b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701172880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rDnnbdi8L2gDJsglrgs0R0nH2zrPUWNxiPxevkVDh3w=;
 b=gPaU1O+xxAqc3tBWssrXz657e1dVhPemuQUIiIU/4C7YhkPjebi6uS4x8FziXCI6L01XrK
 Euww1v3tuxxNRsRMoau3I3VD2amcXUjYxi/Tj5eDQmtYY9nKbfS3iyygBR04uLhVj6iXWB
 bd+E8AohGEZKlyUaFiseRtX50vO07rI=
Date: Tue, 28 Nov 2023 20:01:13 +0800
MIME-Version: 1.0
Subject: Re: [6/8] drm/ofdrm: Do not include <drm/drm_plane_helper.h>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
References: <20231128104723.20622-7-tzimmermann@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128104723.20622-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 28 Nov 2023 14:30:13 +0000
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
Cc: javierm@redhat.com, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, laurent.pinchart@ideasonboard.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,


On 2023/11/28 18:45, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>


Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>


> ---
>   drivers/gpu/drm/tiny/ofdrm.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 05a72473cfc65..ab89b7fc7bf61 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -19,7 +19,6 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_simple_kms_helper.h>
>   
