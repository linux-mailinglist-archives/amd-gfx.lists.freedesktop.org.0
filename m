Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9C2BB7E9
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:51:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1556E923;
	Fri, 20 Nov 2020 20:51:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6DE6E923
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:51:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c9so11715216wml.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 12:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hp1beRzvggAjg6DNfEJAvxavmdQAqyj8G1QOi3nTVdI=;
 b=S33g00KXZ/twyZnJUhkM5hLl2o/4M+aZaI8450J//KMADRP/Sr4hEFDhKNN+spSqAL
 AqGvNGuvIpIbu5t484uRynA5xLuKSMCM0J3LAAp2HrsSU9Okej/zxXB+0FEPNks6qqZf
 DJjusuO65sqosV4W35J/B3gjApH+fRZRfxiLbE2W7qmjlVZwYm/AxqrDn/9b6l0b1OAU
 j1O5n561haIyFANOEPB3cpwlQCI4HxcsUFuRe4+LllsaU8A+GQm1Aaa9lU39smrdUUE1
 oJusJQsK6AKzQEGmGBrclhrs3o0oRlNv8TlDuO8ixAgLaMWM5C1w08pQKNSrFxaqUWbo
 9YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hp1beRzvggAjg6DNfEJAvxavmdQAqyj8G1QOi3nTVdI=;
 b=DlNxlHn0DkzsiJ3lq9DhsR33t9Nf7MG3DE4nkghVsfPOmyc2OVdv517XSt7X6L/VtM
 pzQO3x+5/7LfQSTi+NRn1jPyXCh3h58P33ukYJMRurDIj2/+aA8iNXDMWpPWKwsr7cv/
 63UWFhJxLMvOCQ6rcF2zykcxUDOzIzG4nRP6N9rD0565x8lHkJZ8Jvs4GafMeArJzIXQ
 XkW+90VGNDoS2tk9MCHSt0Cb3i/gcAKk2iUniMgmbuvWETw2YHUOoI5xTM0oPzR+4Gy7
 dp9YAXYu0L/zBKptbErH9Qx08zd5NsIovQhJEOi+vs7qDRajwU9q3Si0DqX7vdy0+vDN
 7AWw==
X-Gm-Message-State: AOAM5300eaChDvTMz8RIdqsEPflrb8yhfsAnxddEMzbjvHrUnxiiJ4sF
 3FtWCLIFK31CVxZ6PRpx2ODLQ3rSFNgUo5eyg0I=
X-Google-Smtp-Source: ABdhPJxfyZPnlHNZ9aGuvVNplbB+1FpUlCJTcI1P1UTu3zVeqv7p8zoTi78X+GRTZwDJQYzgwvOgVfl0FYN9DtIRqDY=
X-Received: by 2002:a7b:c157:: with SMTP id z23mr11632329wmi.70.1605905469116; 
 Fri, 20 Nov 2020 12:51:09 -0800 (PST)
MIME-Version: 1.0
References: <P5iZhKB1vEj9b6kWD41KhDPb7BvvEr72fMg2Kke4PI@cp7-web-039.plabs.ch>
In-Reply-To: <P5iZhKB1vEj9b6kWD41KhDPb7BvvEr72fMg2Kke4PI@cp7-web-039.plabs.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 15:50:57 -0500
Message-ID: <CADnq5_NjZB=1t_MpYN7mx39UFiFaM2gDVmfZy0gNKDm-+TyGHw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/amd/display: add cursor FB size check
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 Harry Wentland <hwentlan@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 3:19 PM Simon Ser <contact@emersion.fr> wrote:
>
> This patch expands the cursor checks added in "drm/amd/display: add basic
> atomic check for cursor plane" to also include a FB size check. Without
> this patch, setting a FB smaller than max_cursor_size with an invalid
> width would result in amdgpu error messages and a fallback to a 64-byte
> width:
>
>     [drm:hubp1_cursor_set_attributes [amdgpu]] *ERROR* Invalid cursor pitch of 100. Only 64/128/256 is supported on DCN.
>
> Note that DC uses the word "pitch" when actually checking the FB width.
> Indeed, the function handle_cursor_update does this:
>
>     attributes.pitch = attributes.width;
>
> In my tests, the cursor FB actually had a pitch of 512 bytes.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reported-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2855bb918535..bd63f1c4ae79 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8902,6 +8902,28 @@ static int dm_update_plane_state(struct dc *dc,
>                         return -EINVAL;
>                 }
>
> +               if (new_plane_state->fb) {
> +                       if (new_plane_state->fb->width > new_acrtc->max_cursor_width ||
> +                           new_plane_state->fb->height > new_acrtc->max_cursor_height) {
> +                               DRM_DEBUG_ATOMIC("Bad cursor FB size %dx%d\n",
> +                                                new_plane_state->fb->width,
> +                                                new_plane_state->fb->height);
> +                               return -EINVAL;
> +                       }
> +
> +                       switch (new_plane_state->fb->width) {
> +                       case 64:
> +                       case 128:
> +                       case 256:
> +                               /* FB width is supported by cursor plane */

I'm pretty sure DCE6.x only supports 64 and DCE8-12 only supports 128.
I think only DCN supports 256.

Alex


> +                               break;
> +                       default:
> +                               DRM_DEBUG_ATOMIC("Bad cursor FB width %d\n",
> +                                                new_plane_state->fb->width);
> +                               return -EINVAL;
> +                       }
> +               }
> +
>                 return 0;
>         }
>
> --
> 2.29.2
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
