Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731A94CC98
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2024 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0335810E876;
	Fri,  9 Aug 2024 08:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="fU9/d69g";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1711510E872
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2024 08:46:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7aa74d1ab8so22077166b.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Aug 2024 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723193160; x=1723797960; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=72fzkNql20oZmkyoYxQE69cjTMLd53lCrcpG8jSN45k=;
 b=fU9/d69gpHjdWWMuxM5Ex++yzkgw62mBxm3KfsZWgvD01xkOKBtxzniM5GPgXuM25z
 Q8Ab6AmhnEb3v9/fkwVMIDqmgkpFy2MJSrbCweE1rBjpm683uaCoWTtX+sOwpKekcMa0
 G0aXfCuhZykgLz9OGsxGrkIcV9o5bj9aBzoMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723193160; x=1723797960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=72fzkNql20oZmkyoYxQE69cjTMLd53lCrcpG8jSN45k=;
 b=i920sfGQ5aoccBE2/1lX3kzoSC5rshR3M5hRntahOF1AWLmlNQ3vyjhPeT034ofpy6
 f0uImhjaVIeei/pVORbE3r9bO690+FxBHgbPPbXiz7o5d60b8IbApLrsUCHSio3uSjDh
 v0li+k7D35nQT5rfq6N8EJ8T0HuEmYVEy083la7N1ikD6IXqC1dwuhbt4kwqt+QOgoQW
 N/DLO84GZUUOLqfgyE6RQX0Q+E2BudHotFdo5HfkgMXJ3ZUvpv+ncOu1u1MvXkfk5Kdl
 Xv1vUW+hrf1FYTeglJONq11RjDdKTBRuu8ELRh3qQX+T1dPbdvsULZQPSvh6fmuYJWq+
 g1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy1zdsCQ2heGdzSZtcTwONTU39CtKWTn0jLXfR5AVZq0X4eskBozfmDrLpTCdvZ4byMjyY82pA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZpGohq5rG+dv4vgXgEpbDplpHlqee7/uAF39k8m6Qbr+Ir1Jr
 iaCzaQlTmhMc3orQLTzQEln6A1j5ikQLS9Z82VstotFkFJ4Avusze4xB96B2mnY=
X-Google-Smtp-Source: AGHT+IFkrJ2c4TakfF6EyYpfYC5bggsGcKZmnZrOkxoZ9muG1idw93FCyntJmLE9/435y1pFPmNcVA==
X-Received: by 2002:a17:907:2d23:b0:a7a:9e11:e875 with SMTP id
 a640c23a62f3a-a80aa65511cmr44659166b.6.1723193160341; 
 Fri, 09 Aug 2024 01:46:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d4522esm817359266b.106.2024.08.09.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 01:45:59 -0700 (PDT)
Date: Fri, 9 Aug 2024 10:45:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/nouveau: Do not set struct
 drm_mode_config_funcs.output_poll_changed
Message-ID: <ZrXXRfoJAXiZWQUj@phenom.ffwll.local>
References: <20240807084539.304014-1-tzimmermann@suse.de>
 <20240807084539.304014-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807084539.304014-5-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Wed, Aug 07, 2024 at 10:41:36AM +0200, Thomas Zimmermann wrote:
> The output_poll_changed hook was only necessary before in-kernel
> DRM clients existed, but is now obsolete. The client code handles
> display otplugging internally.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c   | 1 -
>  drivers/gpu/drm/nouveau/nouveau_display.c | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e4c8ce6dd40a..eed579a6c858 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2648,7 +2648,6 @@ nv50_disp_atomic_state_alloc(struct drm_device *dev)
>  static const struct drm_mode_config_funcs
>  nv50_disp_func = {
>  	.fb_create = nouveau_user_framebuffer_create,
> -	.output_poll_changed = drm_fb_helper_output_poll_changed,
>  	.atomic_check = nv50_disp_atomic_check,
>  	.atomic_commit = nv50_disp_atomic_commit,
>  	.atomic_state_alloc = nv50_disp_atomic_state_alloc,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 8a87e9697a42..e2fd561cd23f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -391,7 +391,6 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
>  
>  static const struct drm_mode_config_funcs nouveau_mode_config_funcs = {
>  	.fb_create = nouveau_user_framebuffer_create,
> -	.output_poll_changed = drm_fb_helper_output_poll_changed,
>  };
>  
>  
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
