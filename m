Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2AA80025D
	for <lists+amd-gfx@lfdr.de>; Fri,  1 Dec 2023 05:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4922110E012;
	Fri,  1 Dec 2023 04:09:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 448 seconds by postgrey-1.36 at gabe;
 Fri, 01 Dec 2023 02:43:45 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ac])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF810E7AB
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 Dec 2023 02:43:45 +0000 (UTC)
Message-ID: <9a741d8d-a699-4fe8-af59-f90c91014d01@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701398175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EIETJb62GcJnMc0HG5pRvWQuoXMY9gZZynhystY1S+g=;
 b=ZZyzjJQWQ2LuSvhxg2XyMudBtyeZupmuAAnvmKHiwQ+cISrZEQwCONl2svSSzC0iMFByAQ
 u/8MQxOL1o4lub/0CjMMm58jAsESsW0JcN9g3bzVvzGoQAKuXcSu6dHSO9Zps4rSSQoC93
 iTR4J7EEcdkpBG1hYmDGsbImU9l4c6A=
Date: Fri, 1 Dec 2023 10:36:08 +0800
MIME-Version: 1.0
Subject: Re: [1/8] drm/plane-helper: Move drm_plane_helper_atomic_check() into
 udl
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com
References: <20231128104723.20622-2-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128104723.20622-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 01 Dec 2023 04:08:58 +0000
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
> The udl driver is the only caller of drm_plane_helper_atomic_check().
> Move the function into the driver. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_plane_helper.c | 32 ------------------------------
>   drivers/gpu/drm/udl/udl_modeset.c  | 19 ++++++++++++++++--
>   include/drm/drm_plane_helper.h     |  2 --
>   3 files changed, 17 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index 5e95089676ff8..7982be4b0306d 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -279,35 +279,3 @@ void drm_plane_helper_destroy(struct drm_plane *plane)
>   	kfree(plane);
>   }
>   EXPORT_SYMBOL(drm_plane_helper_destroy);
> -
> -/**
> - * drm_plane_helper_atomic_check() - Helper to check plane atomic-state
> - * @plane: plane to check
> - * @state: atomic state object
> - *
> - * Provides a default plane-state check handler for planes whose atomic-state
> - * scale and positioning are not expected to change since the plane is always
> - * a fullscreen scanout buffer.
> - *
> - * This is often the case for the primary plane of simple framebuffers. See
> - * also drm_crtc_helper_atomic_check() for the respective CRTC-state check
> - * helper function.
> - *
> - * RETURNS:
> - * Zero on success, or an errno code otherwise.
> - */
> -int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state)
> -{
> -	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> -	struct drm_crtc *new_crtc = new_plane_state->crtc;
> -	struct drm_crtc_state *new_crtc_state = NULL;
> -
> -	if (new_crtc)
> -		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> -
> -	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> -						   DRM_PLANE_NO_SCALING,
> -						   DRM_PLANE_NO_SCALING,
> -						   false, false);
> -}
> -EXPORT_SYMBOL(drm_plane_helper_atomic_check);


Since this function is removed, does the comments of the drm_crtc_helper_atomic_check()
function (in the drm_crtc_helper.c) need to update as well? I'm ask because I see the
comments of the drm_crtc_helper_atomic_check() still referencing this function.


> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
> index 40876bcdd79a4..7702359c90c22 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -21,7 +21,6 @@
>   #include <drm/drm_gem_framebuffer_helper.h>
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_modeset_helper_vtables.h>
> -#include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_vblank.h>
>   
> @@ -261,6 +260,22 @@ static const uint64_t udl_primary_plane_fmtmods[] = {
>   	DRM_FORMAT_MOD_INVALID
>   };
>   
> +static int udl_primary_plane_helper_atomic_check(struct drm_plane *plane,
> +						 struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
> +	struct drm_crtc_state *new_crtc_state = NULL;
> +
> +	if (new_crtc)
> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
> +
> +	return drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
> +						   DRM_PLANE_NO_SCALING,
> +						   DRM_PLANE_NO_SCALING,
> +						   false, false);
> +}
> +
>   static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   						   struct drm_atomic_state *state)
>   {
> @@ -296,7 +311,7 @@ static void udl_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   
>   static const struct drm_plane_helper_funcs udl_primary_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> -	.atomic_check = drm_plane_helper_atomic_check,
> +	.atomic_check = udl_primary_plane_helper_atomic_check,
>   	.atomic_update = udl_primary_plane_helper_atomic_update,
>   };
>   
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 3a574e8cd22f4..75f9c4830564a 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -26,7 +26,6 @@
>   
>   #include <linux/types.h>
>   
> -struct drm_atomic_state;
>   struct drm_crtc;
>   struct drm_framebuffer;
>   struct drm_modeset_acquire_ctx;
> @@ -42,7 +41,6 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
>   int drm_plane_helper_disable_primary(struct drm_plane *plane,
>   				     struct drm_modeset_acquire_ctx *ctx);
>   void drm_plane_helper_destroy(struct drm_plane *plane);
> -int drm_plane_helper_atomic_check(struct drm_plane *plane, struct drm_atomic_state *state);
>   
>   /**
>    * DRM_PLANE_NON_ATOMIC_FUNCS - Default plane functions for non-atomic drivers
