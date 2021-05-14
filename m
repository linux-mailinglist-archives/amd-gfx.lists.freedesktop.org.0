Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A3380CF7
	for <lists+amd-gfx@lfdr.de>; Fri, 14 May 2021 17:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D6C6EEC4;
	Fri, 14 May 2021 15:29:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647656EEA5
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 14:54:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id 69so11664095plc.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 May 2021 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITqVGi5SndQrMkcFSU1RtiIxc9czHN3u3Tgs78Cw9A8=;
 b=Lj/tcxHj/53peCCj/ew30KKxmjfuHEyxTnDDfjwDWyqIBd4Gc4FecAuIwyi8goUSHe
 hM/o0jDkXu+yTE9JoLxxYCR2motDxXqfNs9n1UxSUvcZMGFFFIrg7kwUrok0KYP/qkCL
 Zo70mD69927D/Wjso3yDjNfAaj1v2qiOePe1Q51YxzHXbxljRGrTgPLJz4qHTWdqmBjU
 a/7wiBbXe/+t3+4DqValnNvWTuiWcK/UXu9jci8LLij5iNvjpY5OwYOvE7Ikg0yz1yqM
 xKX78dmAapwi7SI7WwCb864z5OIgDugLI4DkLKmrteLq99laP0EwB75F+UiPPdj8Jq1x
 xERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITqVGi5SndQrMkcFSU1RtiIxc9czHN3u3Tgs78Cw9A8=;
 b=MROAPQWH60CxaV0rihEUrnkQ9+asMm2oB2ex8S8/uiuBI5l2QK2gk2IGuMnLZ2LkZF
 6BZ2z0h/5EGqh0LhAFPBuROTyFWnWBJbRXJPnRmFhGe+AdMO0QbwF5FyQmMo+Gn2jxPS
 4euD+Lf9MebRaJBU1IqKrIK1MsyoV8v4aNBdlf0NSIXf1Z8wDTpfDjN7KsZL8VHSGJhN
 XCAPTSurwUvFfvDkz6yIUUomve1NgAINv87Ht7lud+S1AWC+YcPj0KcDb3u/T5JLK7hL
 UtZkpsC7Ho0iY4FT9FLr8LxsL5DquhVBddXmz1xcKKbZXo/Xb/d6gw6ZmJVhqwmmKD2G
 8EXw==
X-Gm-Message-State: AOAM5300239WQzIK+yVUtudilepIE6N64GIRB61+4/6xmaw8PSi33OHE
 P4dodc4Tal3EjgBoAG500FtPppoYqVHiSg9L0nF2KA==
X-Google-Smtp-Source: ABdhPJxOue4nDNlJ4CSrkoHVhpPpGSHuWrE0njoSkzwnD+OwNse9OU37A+jbKRrWR/mXT9sFwPvhd43MYm2VkD9f7sA=
X-Received: by 2002:a17:902:b210:b029:eb:535f:852 with SMTP id
 t16-20020a170902b210b02900eb535f0852mr46202739plr.80.1621004095814; Fri, 14
 May 2021 07:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210514114734.687096-1-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20210514114734.687096-1-Rodrigo.Siqueira@amd.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 14 May 2021 10:54:44 -0400
Message-ID: <CAC0gqY4JdrFnFTTErkd+7PBMXTabacEik+4s7LoemVrDk=AXXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix overlay validation by considering
 cursors
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
X-Mailman-Approved-At: Fri, 14 May 2021 15:29:09 +0000
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
Cc: Harry Wentland <harry.wentland@amd.com>,
 "Tianci . Yin" <tianci.yin@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Wheeler <daniel.wheeler@amd.com>, Nicholas Choi <nicholas.choi@amd.com>,
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 14, 2021 at 7:48 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> A few weeks ago, we saw a two cursor issue in a ChromeOS system. We
> fixed it in the commit:
>
>  drm/amd/display: Fix two cursor duplication when using overlay
>  (read the commit message for more details)
>
> After this change, we noticed that some IGT subtests related to
> kms_plane and kms_plane_scaling started to fail. After investigating
> this issue, we noticed that all subtests that fail have a primary plane
> covering the overlay plane, which is currently rejected by amdgpu dm.
> Fail those IGT tests highlight that our verification was too broad and
> compromises the overlay usage in our drive. This patch fixes this issue
nit: driver*
> by ensuring that we only reject commits where the primary plane is not
> fully covered by the overlay when the cursor hardware is enabled. With
> this fix, all IGT tests start to pass again, which means our overlay
> support works as expected.
>
> Cc: Tianci.Yin <tianci.yin@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> Cc: Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Daniel Wheeler <daniel.wheeler@amd.com>
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ccd67003b120..9c2537a17a7b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -10067,7 +10067,7 @@ static int validate_overlay(struct drm_atomic_state *state)
>         int i;
>         struct drm_plane *plane;
>         struct drm_plane_state *old_plane_state, *new_plane_state;
> -       struct drm_plane_state *primary_state, *overlay_state = NULL;
> +       struct drm_plane_state *primary_state, *cursor_state, *overlay_state = NULL;
>
>         /* Check if primary plane is contained inside overlay */
>         for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, new_plane_state, i) {
> @@ -10097,6 +10097,14 @@ static int validate_overlay(struct drm_atomic_state *state)
>         if (!primary_state->crtc)
>                 return 0;
>
> +       /* check if cursor plane is enabled */
> +       cursor_state = drm_atomic_get_plane_state(state, overlay_state->crtc->cursor);
> +       if (IS_ERR(cursor_state))
> +               return PTR_ERR(cursor_state);
> +
> +       if (drm_atomic_plane_disabling(plane->state, cursor_state))
> +               return 0;
> +
>         /* Perform the bounds check to ensure the overlay plane covers the primary */
>         if (primary_state->crtc_x < overlay_state->crtc_x ||
>             primary_state->crtc_y < overlay_state->crtc_y ||
> --
> 2.25.1
>
Happy this was caught earlier. Would not have been fun debugging it on
Chrome haha.
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
