Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E490391967
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 16:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F686ED0B;
	Wed, 26 May 2021 14:00:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB776ED0B
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 14:00:15 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id o21so1046019iow.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CxRTVEDXzm6xbMjC+P9ZPcC9pj9sRrAGAdQowRw8GEs=;
 b=C8/PoRQ1ZsP8bp62w5QKY3IFVLnnOEBL28gQu/JgX7JuhSzBRhvxMiKwF6g8GRtx8K
 MavGSccxWGMV6tiz4NPhwnkwYulojupR53dZJJr1R3J7FjDUQhgcpumKXbNuRoxh91Yq
 k13P814cCTvyk6xyedM3UD+7ufPQoyjRFyvxALYDEEVwz6Bpu0aeCXYrGT57ST4FZcvz
 XUxq51FeIX8uDMWtOs1Nl+TtiAPUAA3SuSKOAuhKLOeSd3jaLnZiVwQg7A9f38s57gQS
 4EWaeeUREeImp53EksyQkeS2mMCN3VGIPlfSYo2CWMJL/SHQljawMNmTxqJVjrOcW3Li
 kWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CxRTVEDXzm6xbMjC+P9ZPcC9pj9sRrAGAdQowRw8GEs=;
 b=m1xEbJ2AWlQOwun8AUuKR4k/cwwsrxiqpSeyjKZ16dQD7kJdy7VVnr7kCSjHqLMYvQ
 Xziel/aT/JIYvMoURgzv3TSV53YrD45mAIh0AS6cNVR2CqyQPScit3U/s2zouR4ATSH9
 6fLJTVoQ4ZcB3CmobdN1DqeTak5oFtDdSQqfPgWXnmWD863AjOi82Kh/HkyNl5wFBuw3
 o4auZZGIbGJyZ0h6MGxBB2BrQmp6HlC3CMhHqZZXQxxbGWaCkRPiAKVifYPCoNoly7Qv
 G8kBr9Lk7pdMPvknoNudaboG4IFfwfXy53litWNhxc6bw/tpgcn91GRtD8r+xuA2JDk6
 m5Xg==
X-Gm-Message-State: AOAM533elREQi6AL5zvciYvwVLUcM6Uz5V6hwjdqLvhYgcdu3aCjEUYM
 STLaVpAbKsnsh6Qded4ld44AgEHRbsn+86Bpbmvdxw==
X-Google-Smtp-Source: ABdhPJzfSCMlqzkCkYr/UhEhthFzvrvx2qHmHGAlP0FyZbS8+keATiKLTvCxiD3VNYWW/j6IyP1UUSjp+PsCAN7Rfp0=
X-Received: by 2002:a6b:3119:: with SMTP id j25mr22586872ioa.64.1622037614524; 
 Wed, 26 May 2021 07:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <RbK0wXzzSSK3M7hx467tnbnCEW1BmHW8lY9PBwcqs4@cp7-web-045.plabs.ch>
In-Reply-To: <RbK0wXzzSSK3M7hx467tnbnCEW1BmHW8lY9PBwcqs4@cp7-web-045.plabs.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 26 May 2021 16:00:17 +0200
Message-ID: <CAP+8YyGU71kt_OcV-EjboCQFNE7EDwDb2M2mvRx4t9K_Wgg_0g@mail.gmail.com>
Subject: Re: [PATCH RESEND] amd/display: convert DRM_DEBUG_ATOMIC to
 drm_dbg_atomic
To: Simon Ser <contact@emersion.fr>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

I think there are plenty more occurrences too or did I miss the
cleanup of those?

On Wed, May 26, 2021 at 3:56 PM Simon Ser <contact@emersion.fr> wrote:
>
> This allows to tie the log message to a specific DRM device.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2c9d099adfc2..4dd811816cba 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10089,7 +10089,7 @@ static int dm_check_crtc_cursor(struct drm_atomic_state *state,
>
>         if (cursor_scale_w != primary_scale_w ||
>             cursor_scale_h != primary_scale_h) {
> -               DRM_DEBUG_ATOMIC("Cursor plane scaling doesn't match primary plane\n");
> +               drm_dbg_atomic(crtc->dev, "Cursor plane scaling doesn't match primary plane\n");
>                 return -EINVAL;
>         }
>
> --
> 2.31.1
>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
