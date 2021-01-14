Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2642F58E0
	for <lists+amd-gfx@lfdr.de>; Thu, 14 Jan 2021 04:24:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335A289D84;
	Thu, 14 Jan 2021 03:24:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945A189D52
 for <amd-gfx@lists.freedesktop.org>; Thu, 14 Jan 2021 03:24:41 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id a109so4055938otc.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Jan 2021 19:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zC7pdlFHvzBynbCiWffKYpSs7eoGyfNm/k2w0rz6PsI=;
 b=UZU9xlvcWd4sOl3PPnT5tegqcUkHjSBIq8A3Y9R/G+hNfm7I8btIu2+Lh00frXYs5r
 uJba/ciFsS5hXva9JuX5RscGO+RikdD09B9wwS+m3RAQBNISZPJ1/9HBNNsYbAq88C3O
 2QLUYbTO2H63ZpprmcIhWgze8QqxAhERP1ZaqovxaR7UDD02eTeZ/77bSHFykuODPVsx
 ZQ2YrKdsWgByQUsBccv0FECkIdHqCtmVvR236B4RN+s/l3JZsLfR59qkSg4M8n3iWPzw
 9g2di1++SueQBaJbRcl9PKIHlVF7VfivfFwnf8KV7ITqj2oENn30CJpwPNjcX18SAzsX
 o5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zC7pdlFHvzBynbCiWffKYpSs7eoGyfNm/k2w0rz6PsI=;
 b=gnQchXLRxbww4/VwgQ4JEoONGiijdvm+o0H3Nwlxa4NT0Br6hjavkUwkLh/GGGE5qO
 Np63eXlsnhS5Tx2otDhaRHpqyV+OcyrwxKxRmFziozcGGyfjI3UQUihikDy9paOnTVup
 YWLTrZzLt2kuluBrzzWpfhrAhmsj5xjPuLX5NLkidtNP+s+Gu7JI9U3+NsdvDMOoQIyl
 2vundYaGsWzDLmRbWSC0Jc31vKP/DrYC89P1hBaEZ/WOYFePxy+QzY1Ivxh1ig8cRiSI
 boweqS3kla9OYiKXqrImQy9/8MkTMDQgV3kvCJ9Po9yDOnLTQ9FIO4mmXGIO9sSjWTol
 uA2A==
X-Gm-Message-State: AOAM531odC1rM+HKOI1JCI62hubJe4cBLlcGvdEPLQtlDK3a28JcQZZB
 un7PGNf5oSrI1cldwsCGcmuoNQBQAxApY5TvtKCk6Rt3
X-Google-Smtp-Source: ABdhPJyT5uIUzrUqAURxJ3e4dJaA4JWkHPKmZrdMKYtIECjPt/osES4G+r+qczlY4gxTVRf2KvXSqbNi3SyYQHSDOww=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr3331415otl.311.1610594680728; 
 Wed, 13 Jan 2021 19:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20210104175337.636270-1-alexander.deucher@amd.com>
In-Reply-To: <20210104175337.636270-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 13 Jan 2021 22:24:29 -0500
Message-ID: <CADnq5_NM4tVs+Mv6RmToa-BNNxnT_io0U145ZfwQK0e4a-y4_g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: check the result of copy_from_user in secure
 display debugfs (v2)
To: amd-gfx list <amd-gfx@lists.freedesktop.org>, "Su,
 Jinzhou (Joe)" <Jinzhou.Su@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

+ Joe

On Mon, Jan 4, 2021 at 12:53 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Make sure the copy succeeded.  Also fixes a warning.
>
> v2: fix the error check
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> index 455978781380..b033344c5ce2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_securedisplay.c
> @@ -101,7 +101,9 @@ static ssize_t amdgpu_securedisplay_debugfs_write(struct file *f, const char __u
>                 return -EINVAL;
>
>         memset(str,  0, sizeof(str));
> -       copy_from_user(str, buf, size);
> +       ret = copy_from_user(str, buf, size);
> +       if (ret)
> +               return -EFAULT;
>
>         ret = pm_runtime_get_sync(dev->dev);
>         if (ret < 0) {
> --
> 2.29.2
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
