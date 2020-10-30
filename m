Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA529FCD6
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Oct 2020 05:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49516E951;
	Fri, 30 Oct 2020 04:49:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088C76E951
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Oct 2020 04:49:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k125so1763554wmf.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Oct 2020 21:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79RD2S2sqcqqjZSBIiuWXoOSrGXzs5hov/s45ugFqxo=;
 b=KP11B+4FDDvCA9Lj346sRbc0X0aUz60GQNeTDa9Nx8yaT206nd0YDZazSC6JinXj8p
 JOfd0ws9n6QnAMrqQvHAfDJURm3T9u3q0GSgLzbnmVICzPaCiXt1Iotu1Pobb5ZD4nmR
 nSHuTNzsDaBMU6f60z2A/T7LDqfs5h914ks6lhM7r6ZpQhYMKE9ZY+9sj71+8SMEZV5D
 gVW4ykjycRpE8cdPyvKix6EUq5WnRcYKZO6bvOj4s13uDwBX3eqSmrfuFodiOBVzaNji
 5r/arp1yU95ArkYrZfrys/j0LNWRCRJPC9sfbLz1N3/tUdXlnEAHV4URifcDAEgWJdVl
 Nqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79RD2S2sqcqqjZSBIiuWXoOSrGXzs5hov/s45ugFqxo=;
 b=D3xBmJicwthWhOven0ruZ6rjp548gFcriwJr+Tv3XdUfVqTmMVLJroyIlm6Q48S8b5
 Ex43d9EQBJ2NsVQM4beBh/zI5Rj0iCInH0/4Xn6gdBkH5sCLIq8qogUIOQHkxglGw69v
 1AMGe7w7zQhpZ+xyxXDMeY8nMditWix5AsrzAP6xMhKONDolYgFgxc+lcNZSm1i4VVbh
 oRv378FHkZEVA8m170lHWu3yUVCNexcqwFTTZ4pAUfr6Hbnat0iD4kFjHIo4lYgAaDp9
 i3sHd3zpx6Uma5f+90OpNKvLEFhZragie6Y6eK+CRINRRPJqS5qw2odq+Ve4b+ClKYHT
 lYcQ==
X-Gm-Message-State: AOAM5306MnDiJ83J0DVzkCKm3NStIrF7NQ6sYG3+hzNhwifViw/V0kdX
 EL/OemM8GzHc1H7/pYbqDGDy9AZPE1N6P88eir9C07hOJUQ=
X-Google-Smtp-Source: ABdhPJwVvqncd4SfKBO8lEt9MJc+jrOjcTt2w++r4Be+JzFVqImBiHKp6M/FqvzT13CAI8XUGlA7GO0T+FqXt1camgg=
X-Received: by 2002:a05:600c:25a:: with SMTP id 26mr427744wmj.39.1604033341668; 
 Thu, 29 Oct 2020 21:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201030043306.1557713-1-likun.gao@amd.com>
In-Reply-To: <20201030043306.1557713-1-likun.gao@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Oct 2020 00:48:49 -0400
Message-ID: <CADnq5_N2hnxPXc+xR815219po5gHggciN-WYvTZn_9RBQqAt0g@mail.gmail.com>
Subject: Re: [PATCH xf86-video-amdgpu] Fix drmmode_crtc_scanout_create logic
To: Likun Gao <likun.gao@amd.com>
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
Cc: Guchun Chen <Guchun.Chen@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Hawking Zhang <hawking.zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 12:33 AM Likun Gao <likun.gao@amd.com> wrote:
>
> From: Likun Gao <Likun.Gao@amd.com>
>
> If crtc scanout create successfully, the function of
> drmmode_crtc_scanout_create should return TURE.
>
> Signed-off-by: Likun Gao <Likun.Gao@amd.com>
> Change-Id: I4b7540b0d128c2d55f2b8491569004741435f343

Please create a gitlab MR for xf86-video-amdgpu updates:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/merge_requests

Alex

> ---
>  src/drmmode_display.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
> index f74106e..465915f 100644
> --- a/src/drmmode_display.c
> +++ b/src/drmmode_display.c
> @@ -513,9 +513,10 @@ drmmode_crtc_scanout_create(xf86CrtcPtr crtc, PixmapPtr *scanout,
>                 ErrorF("failed to create CRTC scanout FB\n");
>  error:
>                 drmmode_crtc_scanout_destroy(scanout);
> +               return FALSE;
>         }
>
> -       return FALSE;
> +       return TRUE;
>  }
>
>  static void
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
