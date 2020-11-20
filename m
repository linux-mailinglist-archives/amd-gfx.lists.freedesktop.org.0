Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA32BB7ED
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:54:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554626E92A;
	Fri, 20 Nov 2020 20:54:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB15C6E92A
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:54:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id c198so9838319wmd.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 12:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6gtitu9hIZ1DFGP7fDRCeTGfDZpqX7LgGrx/EZ06lno=;
 b=C8sdl3KRfmU5GiRLAZLalVtoHi1d5SGJkb3yBLo2005oUawmEJNoES0gWEB2Yt21xV
 uVVNBI/nFz6ryF7qkYnckokJuuMYI3PIyf54c9qr28YiTw4IBQFAaqq1YU3F39Wn0bno
 AbI9jtLSPujRVfNFvbEPkg0N+99VGReJLfZHNERXubrHxoOJ46hknFQtdg77it+nV6Ml
 2RHKKMJr+z66MHaKw5wkzLy+aV1QTbg8X46bFC5uPPuy1vYMQ0RcenuH0DR4uXjHxc9U
 X6J0r807nKzgCYW295P2RKAX7ZOGmf44j/624Rv1DjKLl9H8lBK2koD+9AHKKubnS9bk
 yz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6gtitu9hIZ1DFGP7fDRCeTGfDZpqX7LgGrx/EZ06lno=;
 b=b/F1rDGNUjHPRTQ/NAJQV+Y0lpgQQJFqhi7cFVaG3+NqUlrgsRSu2sUa+kO51wn0+u
 0AhnUp3Pv/54RXf8sCJhYkYCVTz49n+1J3XS0y02ShTYne9arNfMS4RWg9J5YN1eHHmi
 L8Ot/3/JfCIIWvlsq273kg/lAiwCLLK43l8LwLjruZJOviFadLJZL7EcYD4Pmv4R4OO/
 B6owsYL5ptWl0OphOKdFvjN61YxMOZqP5Y76PhMA1UWy33CGH7WDreoejPOBCo/hxQNv
 j3JynL7MUJWnLbvGEfhWEdL/vKyqG1bh4ZKAcP7VcMi2kyRglY4XQ8pnw8gcrQmawhOI
 DVIw==
X-Gm-Message-State: AOAM531v6yhNz9dMGPF+FvQPRiPMwkzyKwG4tF7XvVnvtFXE/wrKZAKl
 lsatLbOcMTggiqEE/rBtOWaJjr+VDFNQXKT2wJfNPYNM
X-Google-Smtp-Source: ABdhPJysh3W/P3vTGP3f876oDKAW5yJAD2qdwVUs8f3UdiJVJLVocrHjYawCYhkN1SXbr69YJHm14eQbaj+SQTqsQzE=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr11751193wmb.39.1605905649546; 
 Fri, 20 Nov 2020 12:54:09 -0800 (PST)
MIME-Version: 1.0
References: <WTGdykXJRzSbZ9WqH7JBxEOBb6zx3t3iR1ujC8S8DmY@cp3-web-020.plabs.ch>
In-Reply-To: <WTGdykXJRzSbZ9WqH7JBxEOBb6zx3t3iR1ujC8S8DmY@cp3-web-020.plabs.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 15:53:58 -0500
Message-ID: <CADnq5_Mj3=mcNhvA08bfdoTEBJiEbWaetXv4TDzYivimE3TT9Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amd/display: add cursor plane checks
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 3:19 PM Simon Ser <contact@emersion.fr> wrote:
>
> This series adds checks for all cursor plane properties. This avoids
> accepting configurations that we won't be able to display.
>
> I've tested this series against various scenarios using a hacked up
> wlroots [1].
>
> [1]: https://github.com/emersion/wlroots/commits/amdgpu-cursor-invalid

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Simon Ser (4):
>   drm/amd/display: add cursor FB size check
>   drm/amd/display: disallow cropping for cursor plane
>   drm/amd/display: check cursor scaling
>   drm/amd/display: don't expose rotation prop for cursor plane
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 81 +++++++++++++++++--
>  1 file changed, 75 insertions(+), 6 deletions(-)
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
