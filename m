Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFD01FCE33
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2020 15:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0189F43;
	Wed, 17 Jun 2020 13:16:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED1489F43
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 13:16:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so2280632wrs.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LzpkZLLo3QzsTLNBytsoeIn3TVGzEPO4q9Ei2i+dIss=;
 b=prkshgq9T1Pn3YJvnmbh4rlHdlc8p316TZLLWKaxIr27EG/z72mch2wWik690sb8tw
 NqhBchpRb1Lp12p6GeFQk2HwaW7Z2tbPGSBvZ4AxIZgcg2U/32hBp+IEy+juoQLuf3m8
 efd4ahivWus8N3XfDkkUIgW8uhe8BgtXBZhe8mZxyLOi09+l/R90Fje+hqFSGJ4+ELwQ
 OK294yH5Nn42JIjqAAUn73YH3CqaXT7jV7s996zxcaJarLE/EzDLPlL5qlR+PEt2bHuN
 wdYD2/s77OXROxNQ2oQHfbbpi1Dm1Oy03KMqGhr4TZPSBTIBRlZn/0vxkVJMj5gEKsNs
 BkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LzpkZLLo3QzsTLNBytsoeIn3TVGzEPO4q9Ei2i+dIss=;
 b=Od7n5gAq2B6pjwTCSVXonaMDS70U698az8D/2yBEyKqf6UYTTxqWMsVCRjcLrIWSwP
 QprjqVy3vKjdXRKdVEd5XRsrE1A/oYRYL/GC0wp+ZvIZqG3rXJ6XcbKoj7xeDNsxmF/G
 +qFliTWqejgXngDatzmFX0dONqm5TOD/cOdCFqX1YHjX3jujmPyFee9va96sYa1x8jma
 58pV84B8LPw5sogOYslZAj8AYkOEQXJw6664vvQ/9j8iq8VshWIVvCZq6Zp7EO5CdYnf
 ImyyEZKamOmCZ5Vs5zxlkLBdr3HiLN8dqq11BS4apOghbiVYRISwSHLEnxXXOUDxqZfy
 q/fQ==
X-Gm-Message-State: AOAM533GQHCwNUPQxla4E6unzYnL/5esX/ct6VpjOgZBGAUcBuj4sLI0
 qF6dEPzuUEdptNkerbkJQlgXcap1DntPzRpBfRJ2mQ==
X-Google-Smtp-Source: ABdhPJy95UUx2sL4rAue8kUnqdatYUPwPqDK0IuyC2rZR+0TT1EOioKv3LpgcX4NJQUCgx7hnXgYO2fVBLMaJxeBsN4=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9107248wru.124.1592399793827; 
 Wed, 17 Jun 2020 06:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200617035948.10855-1-evan.quan@amd.com>
In-Reply-To: <20200617035948.10855-1-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Jun 2020 09:16:22 -0400
Message-ID: <CADnq5_MDheFnaCgSih1RbZa7ENg53di7r2u9T4_iYykr7NR=kA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: drop unnecessary "@" on OD sysfs output
To: Evan Quan <evan.quan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Freehill,
 Chris" <Chris.Freehill@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 12:00 AM Evan Quan <evan.quan@amd.com> wrote:
>
> To follow conventional style. And this unnecessary "@" confuses
> our userspace tool.
>
> Change-Id: Id4cdc611d63e800cf5a93449b6331a1e8323e727
> Signed-off-by: Evan Quan <evan.quan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index d0f9991c4958..e99071f1fa59 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1035,7 +1035,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
>                         default:
>                                 break;
>                         }
> -                       size += sprintf(buf + size, "%d: %uMHz @ %umV\n", i, curve_settings[0], curve_settings[1] / NAVI10_VOLTAGE_SCALE);
> +                       size += sprintf(buf + size, "%d: %uMHz %umV\n", i, curve_settings[0], curve_settings[1] / NAVI10_VOLTAGE_SCALE);
>                 }
>                 break;
>         case SMU_OD_RANGE:
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
