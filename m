Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 770AE20E191
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2020 23:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C0489C1F;
	Mon, 29 Jun 2020 21:59:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A437789C1F
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2020 21:59:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o8so16907138wmh.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2020 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llEzq10FQ4xf80k9hEEuHp3zdhQVka6KUuAt6abF4G4=;
 b=q0M3F/Lpxpq9sgllozdk7X23l+Ha8ANnguIcVUTZ2H8M54dBvXrSqtXDpZ01SW+4v9
 31ybmw7xaW2MHMHdUYt+dyfAkaHWds8qrdH/Pb6EjC9dY4nsxmA6f3Air2e8JzRfRHWp
 7oo0PudQjmcl7N0QOS3/WKkl0p6ANx3SxAFHHCnC8v5/4b1mv+9IXyEzc9WkCnSjLgX2
 LwQLXefwy4vcWMkuY+vypM9ytCw/NHcTVBsmA8sJHY/vECfKwQqMLNrZgNH6UAlbxMYY
 fml+shU0zlcIUtmfqECWaLgEaVcMuyQzcMBfKe3IWJx8c9R40zhOF9M9MA7AmattU5UC
 3F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llEzq10FQ4xf80k9hEEuHp3zdhQVka6KUuAt6abF4G4=;
 b=IUDB5GlLhGw5aiME0ExYC1MTJvywFSDfKu8DFAllb5YDKxHS/AiTQiEMzck5ofoy27
 ycoRWiAZ29coV2OvHa05hfQ0tBEeXEmpYVDMQ2Xwx7beU4qj2DZhaXHL25owo0gNoWP4
 H/UtLlkwXiX4sGQ3NzkBef2Lp4xiLkfcXgnidmMx6O4jsNI7V3/q20OWBjoOLG+CfDdK
 zfL8Q8m2PfkdjLXw4c7Ct+vUgvMQejFL7G6MJAvlh7ko7pa/TfEA2qMuw/OcYQCzTOsa
 cro60TzrhhlenM17XFHvvVZ5CMUWymbo++xObmRrTT6spuHbY86vb1fbJvI5WuLG2xz0
 wTqw==
X-Gm-Message-State: AOAM530hRXHyMtFvm4scSPlULHFt2aH6R/1WmJ9Y3Tpm6t+KdLuAlImv
 W2K7CLD2hQUDyQma4ge6mEs+9dBv4fn1MmPJNSs=
X-Google-Smtp-Source: ABdhPJzdktDyNp1p2R7yd/Lk2vq4mC/NMapJ33qVHnp+TRuZ+zeMYurOuQhkKbwzZr8/r9AqOj17LNX31AN3cV4jlRg=
X-Received: by 2002:a1c:3954:: with SMTP id g81mr18383805wma.73.1593467946358; 
 Mon, 29 Jun 2020 14:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200629204924.13426-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200629204924.13426-1-nicholas.kazlauskas@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Jun 2020 17:58:55 -0400
Message-ID: <CADnq5_NNtmxtFH91qvX=C=_A8C70DcnVKRe3j4N58if2d7LQFA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Only revalidate bandwidth on medium and
 fast updates
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
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
Cc: Hersen Wu <hersenxs.wu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 4:49 PM Nicholas Kazlauskas
<nicholas.kazlauskas@amd.com> wrote:
>
> [Why]
> Changes that are fast don't require updating DLG parameters making
> this call unnecessary. Considering this is an expensive call it should
> not be done on every flip.
>
> DML touches clocks, p-state support, DLG params and a few other DC
> internal flags and these aren't expected during fast. A hang has been
> reported with this change when called on every flip which suggests that
> modifying these fields is not recommended behavior on fast updates.
>
> [How]
> Guard the validation to only happen if update type isn't FAST.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1191
> Fixes: e1995f0909e3 ("drm/amd/display: Revalidate bandwidth before commiting DC updates")
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 67402d75e67e..942ceb0f6383 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2607,10 +2607,12 @@ void dc_commit_updates_for_stream(struct dc *dc,
>
>         copy_stream_update_to_stream(dc, context, stream, stream_update);
>
> -       if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false)) {
> -               DC_ERROR("Mode validation failed for stream update!\n");
> -               dc_release_state(context);
> -               return;
> +       if (update_type > UPDATE_TYPE_FAST) {
> +               if (!dc->res_pool->funcs->validate_bandwidth(dc, context, false)) {
> +                       DC_ERROR("Mode validation failed for stream update!\n");
> +                       dc_release_state(context);
> +                       return;
> +               }
>         }
>
>         commit_planes_for_stream(
> --
> 2.25.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
