Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE6F3D85D4
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Jul 2021 04:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14CC6EA7E;
	Wed, 28 Jul 2021 02:15:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23C26EA7E
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Jul 2021 02:15:39 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t128so1910081oig.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Jul 2021 19:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OBqn9Ff/AtdPnJjevRzVhUfFDsdsxqP2GIWkCd7/8FQ=;
 b=G2j3Xo7Ji2H4sTxReBMlVHjaJvMvn9j2S/2vH1khvQhhw98d6o3ECk251PB8S8FeC2
 3W6ll8luWDBruz1MJq7t8dQhkGfUPCGt7fw9Piz44fS93RvUI4hyyf/ioDlZRyaRGGH9
 e1GMK+qSLpU7RgJDQ6Y4ywauQFVdB8I0TN5cf8n0Z8Ns4KDeII16RswxhXvSbTW9x2Gx
 gCFTNEmCuPFkoNJH7KXI+wEECxzamPaePi7wUaUQIZWyskDyVehcthC2byFPwGzJcJgH
 Xekk+Yez68s8H824V6VLbV4MtYtUenFYRIecXQoHVLYq+hAyU6TdggRoD/5OS2iglwxB
 OkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OBqn9Ff/AtdPnJjevRzVhUfFDsdsxqP2GIWkCd7/8FQ=;
 b=DomdsUhuvVzKyO4XKV0yI3BDGSTGxdPZWkjV69s0hQr5fqkPJnxQe04rnBsEFTEXUQ
 gvATj04LN8tqKFkEdDpoza6ElG9yyiO2lNNLiMcwfFdJLCmkg6XK6w3U2LOcnpbV28Zn
 27vRy0aFQQ35Jwp1AyoPc9H8EBGAvuTCXYOkJhJPrMLCr/Zo5JGJwnBlArsNyQPfCIcP
 gcABoDgw57zrWZqhTxVY8sifZqtExEkx+Y+E1L+0lKwJOjEFV/qsyNeWjmnQYuYKUs/S
 dNlWIMKNztRWE5KDxbqNKpAHmx/m1i9qmNF+ctqwmt1/gx/L6Wndlou/iXYdCQqHpv9x
 B54g==
X-Gm-Message-State: AOAM532tHXwkgroYx2Je48AD6fqlC3jFnf4UVcGc/T5AYBCtLr5Wfc/9
 C6P1byzW9siFHTjMZtwo9uTtxi+orGqwgYW7kOM=
X-Google-Smtp-Source: ABdhPJwAhrZnIOoLBtn706gD3VpXlxGA5B5KD61251QxcW2TZbArgyfdr5xEyXFQ00TeDzbnAHT8F8L3I4RZqIONzB8=
X-Received: by 2002:a05:6808:1390:: with SMTP id
 c16mr16638109oiw.123.1627438539366; 
 Tue, 27 Jul 2021 19:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210728021037.446968-1-ray.huang@amd.com>
In-Reply-To: <20210728021037.446968-1-ray.huang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 27 Jul 2021 22:15:28 -0400
Message-ID: <CADnq5_PbxCyBz2Wqw-tFsmvH7HGqdW6neiVGh8EyrDY6eA094A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove the access of xxx_PSP_DEBUG on
 cycan_skillfish
To: Huang Rui <ray.huang@amd.com>
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
Cc: Chen Gong <Curry.Gong@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Lang Yu <Lang.Yu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Tue, Jul 27, 2021 at 10:11 PM Huang Rui <ray.huang@amd.com> wrote:
>
> It won't need to clear the xxx_PSP_DEBUG registers, because firmware
> will handle this change.
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index f94ef15b3166..24b0195fe665 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3541,8 +3541,6 @@ static const struct soc15_reg_golden golden_settings_gc_10_3_5[] = {
>
>  static const struct soc15_reg_golden golden_settings_gc_10_0_cyan_skillfish[] = {
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmGRBM_GFX_INDEX, 0xffffffff, 0xe0000000),
> -       SOC15_REG_GOLDEN_VALUE(GC, 0, mmCPG_PSP_DEBUG, 0x0000003f, 0x00000000),
> -       SOC15_REG_GOLDEN_VALUE(GC, 0, mmCPC_PSP_DEBUG, 0x0000003f, 0x00000000),
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmGE_FAST_CLKS, 0x3fffffff, 0x0000493e),
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_CPF_CLK_CTRL, 0xfcff8fff, 0xf8000100),
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_SPI_CLK_CTRL, 0xff7f0fff, 0x3c000100),
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
