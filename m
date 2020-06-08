Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4F1F2079
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jun 2020 22:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7079A89F38;
	Mon,  8 Jun 2020 20:10:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684F489F38
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2020 20:10:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q11so18870199wrp.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jun 2020 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FpmDjv/4z+bOOzMaaZCzq+OX4BSSRVwW43zPHhJ2xCc=;
 b=utBp6bAo/kqQ2oA4ckj15HQYrQ59JUWEqJA3Of5/uxOsvMvb4EkBFGz67gIH6xZK2F
 +PEezeXivKuWi4lrP5l0ZVAJa8SI+M1tbHteo9tjSDU+AgeZTgj5tkX3n8qZ9T1OfNzh
 fMeNumH8wGu3RzzdHeU60ieAl7DY79DaqpCrukiWirXD+vjprfMkfaz8dOqf6jCOKpCl
 MxI6gyJeiQJG92a+j4R9A8xP57KzuuYMYHMfvba1f7ju+DqUL9nL6tWXLZjtr0zF/ejX
 qCh+RwpNCgd5PEUV8qdxxJqWFfW2siV7QaWEK549z4QLR/O9omuvZ+r9/ma9TQvvvQY5
 Ly2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FpmDjv/4z+bOOzMaaZCzq+OX4BSSRVwW43zPHhJ2xCc=;
 b=EpkHLeED1JAviCYFXmAq/gI6wPxxAa55mJGUZMhC09hD0TLmEvbO7BqNxD/x9NW26i
 5IyG7RhRT2OXof2chnrG5vt0YeEYSXEs8aE+/+BEBx2ymeXs7gCVVmOm+qbY0h9uPtYN
 gAw7Qjo2gx6H61Ko81fzY5/yrltPSbw9embV8ZyPyG3d55kO5bjgDBpIs8WYaPeXdoKZ
 OYG5Mfmo35D/Ar+ocWy6D0ybenevmCKxtHW/IFKVLW4zfN3RkCb6vYVrrpKAM0dcShts
 FmPX2/BTeZPDa7EKMwOEnQUJafupBWaFgwqEtgWCbldmhBldL6SZhIVWe13YoV3Ctr+v
 VAxw==
X-Gm-Message-State: AOAM530j09X+jmUEquiey0sCDWT932ZJlACM7mTYLZC/uGktLTJcTxpP
 JkS6jy2eFCWp8chglJKq+1eckAVmG5lbZGniKIE=
X-Google-Smtp-Source: ABdhPJyy5itok2Iy8uyhjJuP9dIySwRmblOvMoIpl2MphBFuJdv3p5xFj6rtOPz3uZF59vWcOPZv2OGYgiEySofNba4=
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr483601wrq.362.1591647048950; 
 Mon, 08 Jun 2020 13:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200605173744.68500-1-efremov@linux.com>
In-Reply-To: <20200605173744.68500-1-efremov@linux.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jun 2020 16:10:37 -0400
Message-ID: <CADnq5_Orcz=D=coVwd9U1prAPPDzJbFWnhzcONKvmMtCpFAbdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Use kvfree() to free coeff in
 build_regamma()
To: Denis Efremov <efremov@linux.com>
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "for 3.8" <stable@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 5, 2020 at 1:38 PM Denis Efremov <efremov@linux.com> wrote:
>
> Use kvfree() instead of kfree() to free coeff in build_regamma()
> because the memory is allocated with kvzalloc().
>
> Fixes: e752058b8671 ("drm/amd/display: Optimize gamma calculations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied the series.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> index 9431b48aecb4..56bb1f9f77ce 100644
> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
> @@ -843,7 +843,7 @@ static bool build_regamma(struct pwl_float_data_ex *rgb_regamma,
>         pow_buffer_ptr = -1; // reset back to no optimize
>         ret = true;
>  release:
> -       kfree(coeff);
> +       kvfree(coeff);
>         return ret;
>  }
>
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
