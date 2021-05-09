Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F83377778
	for <lists+amd-gfx@lfdr.de>; Sun,  9 May 2021 17:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482BA6E22F;
	Sun,  9 May 2021 15:59:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1F36E22F
 for <amd-gfx@lists.freedesktop.org>; Sun,  9 May 2021 15:59:07 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j75so13567063oih.10
 for <amd-gfx@lists.freedesktop.org>; Sun, 09 May 2021 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nMwGuf7NSwXz5Jn11NYod/Y0jD55edU/HOVuKpeLd1M=;
 b=CFuatQR9zuox27DDYVBtB2CzgmYDL9ctOxkptblD8bIr6iYrYhzy8IRPNKtC3cm9hU
 EsIbJMf+e4a8tOboa/yP0/8iwe6U6WbcHI+Jnzy1VC1VvSrEoxEJj+2ku+XUnUX82gbI
 s2ZCATChL73guiezEieRyEm+FrznGfdfhiIKL8pmyI7VnIyKzd8nFdX7MFdIXHv1Czdr
 /ux5qTJDGEVv8oz4KEXP8Doa43vEsBeiB8kZwUWFH98aKD4ahaTKI012J+u9OTBmXeSG
 YfpzNndV7r83BZUj9zEiwL8a7S9NfBQkN3W97OdE7zxOZwgb16SR+yx244DP6JtIrKuF
 hIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nMwGuf7NSwXz5Jn11NYod/Y0jD55edU/HOVuKpeLd1M=;
 b=qptCYrSsMYdstqtCulYWs18whn3144ab35xcvuuzn2cVGngFOX85IDOyns8M7+pKNy
 Mqr0fbE8IDrglp9tZZOeCipeRhQoqIRC3fsOSPBeqwhU4ycV4aEw5i6kWY+sp3dE+GVt
 Jd17x2pPQY0cQSwhv0zIvY9zhte52bP2w1dRd7qVEPj7NGKVNHRlsXz1OCvISNzPWIxh
 Pm+27DpomJCbtH0d6VefeTOOoBE0F0Pl11AemyjOXCvCd2BNzRVm7jSt93WWob/dEbvO
 dUeip3mC9oX1Ihfvp7PK70/uRv5P4ZWBQuMnSsX4i98yM2nEGGeXRChuAFQX0xIEC0+y
 s+3w==
X-Gm-Message-State: AOAM531iMgEwSbm0r90xOivX+qJ18Zn+KmQoUORK8ecB3M6mPcezGkwA
 cnH6CcGhYahY8Au673tIKXT9kwW3MCI+5CIHrV0=
X-Google-Smtp-Source: ABdhPJyRgVYqdy1FO/HFuSybDIbGBUNFHGVdkDMUjEN/YIM/RsiCNqpYCpJ2HXSPWCWQRqoYDyOGgqD+V1bmL5l46do=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr21694720oif.5.1620575947271; 
 Sun, 09 May 2021 08:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210508064740.7705-1-Jiawei.Gu@amd.com>
In-Reply-To: <20210508064740.7705-1-Jiawei.Gu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sun, 9 May 2021 11:58:56 -0400
Message-ID: <CADnq5_PEogZDyFV_NOzbsajJQ_0A1+Jui-Mx7N_xsyWR5wXb8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Align serial size in drm_amdgpu_info_vbios
To: Jiawei Gu <Jiawei.Gu@amd.com>
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
Cc: Kees Cook <keescook@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, May 8, 2021 at 2:48 AM Jiawei Gu <Jiawei.Gu@amd.com> wrote:
>
> 20 should be serial char size now instead of 16.
>
> Signed-off-by: Jiawei Gu <Jiawei.Gu@amd.com>

Please make sure this keeps proper 64 bit alignment in the structure.

Alex


> ---
>  include/uapi/drm/amdgpu_drm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 2b487a8d2727..1c20721f90da 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -957,7 +957,7 @@ struct drm_amdgpu_info_vbios {
>         __u8 vbios_pn[64];
>         __u32 version;
>         __u8 date[32];
> -       __u8 serial[16];
> +       __u8 serial[20];
>         __u32 dev_id;
>         __u32 rev_id;
>         __u32 sub_dev_id;
> --
> 2.17.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
