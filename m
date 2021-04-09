Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96580359FB0
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Apr 2021 15:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9386EA1C;
	Fri,  9 Apr 2021 13:19:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4256EA1C
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Apr 2021 13:19:53 +0000 (UTC)
Date: Fri, 09 Apr 2021 13:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1617974391;
 bh=tHPkIhE14AwUmcCL/p2WjqB6xb4AsRVTbsP7rUcY6tY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=DY1NuncJpvOyXa9BmJEAqv9C2oTCUPZLZwuvdTs/PQnCETxCgfahU+I+hH3CWrB8K
 cYHZ0shPsjCu51CPCiXeIgWCzpmTqtbLCXOxr4QV5n+V4UeXMFfEYFtFDHYkuTMEd+
 76zfKgNGWFRXA5vUQ/lZJf5Igygbik03K0HaVqHcxxvPEC6JvbSI8FznNlDZmx3YKc
 d3dZTocDbukho5r+VdQ0w09Dqazuz5i1GNdowYSL6PvMvfrYpvSmvko00gI02GTYlW
 NHrXEzTliw6OhvDkpg+QEzGiHEMqV5pI7eNWXukTJGemJ9T4dBSgVz02DTM6bOLk8B
 CLiIMJSHu6TMA==
To: Simon Ser <contact@emersion.fr>
From: Simon Ser <contact@emersion.fr>
Subject: Re: amd/display: allow non-linear multi-planar formats
Message-ID: <YsPGje8t2-fY1GTI6waUph1jQzm5WtagjUUi0lFy3Q7_I20gG8Ln1bIBqi00nj5RMzdkFhrftPbUrpqwrV2bSvEJbDD8IG9dPHAaZNTLQM8=@emersion.fr>
In-Reply-To: <20210326165944.1310-1-contact@emersion.fr>
References: <20210326165944.1310-1-contact@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

Can you have a look at this patch?

Thanks,

Simon

On Friday, March 26th, 2021 at 5:59 PM, Simon Ser <contact@emersion.fr> wrote:

> Accept non-linear buffers which use a multi-planar format, as long
> as they don't use DCC.
>
> Tested on GFX9 with NV12.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 36ee52104007..66e3ecf123d1 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4216,13 +4216,6 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>  	if (modifier == DRM_FORMAT_MOD_LINEAR)
>  		return true;
>
> -	/*
> -	 * The arbitrary tiling support for multiplane formats has not been hooked
> -	 * up.
> -	 */
> -	if (info->num_planes > 1)
> -		return false;
> -
>  	/*
>  	 * For D swizzle the canonical modifier depends on the bpp, so check
>  	 * it here.
> @@ -4241,6 +4234,10 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>  		/* Per radeonsi comments 16/64 bpp are more complicated. */
>  		if (info->cpp[0] != 4)
>  			return false;
> +		/* We support multi-planar formats, but not when combined with
> +		 * additional DCC metadata planes. */
> +		if (info->num_planes > 1)
> +			return false;
>  	}
>
>  	return true;
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
