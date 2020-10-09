Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C6288081
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Oct 2020 04:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F096EC0C;
	Fri,  9 Oct 2020 02:52:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D3E6EC0E
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Oct 2020 02:52:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d3so8346580wma.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Oct 2020 19:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hz1tPUGJnlkR+GUIkJ0ZZv/BJJD9+b0gaFxhFNTB2UU=;
 b=CBdvEQeeDci8t6vuIzW3cnyeJ+7puIR6tYRVwJJrFR3eFvmCuiV5bU4Gu+rrTYp1Wk
 QH67i2xZRS7QXD5LKCUWahbmnFmrBogME/g1owW8N2KUBUPJHsziQe1CAIRvX3hzXd/y
 Wc+b6gqbT2pPATpSYZwtJQ3xcQKT01pqAY0RBx/1rWbZxzgegvMhgpXvkGqPYschY04s
 qtqtb7QHgKrdSybSwgQlWdxQI96Pcbw69HPKeMpM0kC+6+75yT9L328sC5PBp+h0Vat5
 nkCnmqMuVy90C1bmAYbf+9h9Diuyt4Yh6cisAr/Ke7+0YYxQWpyA1RLiWxgRX3RF/51A
 X8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hz1tPUGJnlkR+GUIkJ0ZZv/BJJD9+b0gaFxhFNTB2UU=;
 b=uX9tWszYIhJBmA0z/3q/h9rY+pJa4YHzKRmAqVVQ5OXTDNAwbNomBb1prkVV/j+lOh
 O9cntLZYUGfEX4qznRF5Jp6CTsN5cZn/+22kPzvqEK/Hb1MSAet1JZ2TBNh6l8PnTgCA
 TddFh1ZMYzcw0a93QAh4+TqlR8h3sXU2tV12Mh7Pn5hBqAz0O3hdOwAdm/YomW+fj5wT
 kRjPSydlNqPm3qMO/IO7DvDbLfVxGbguXU+3/9Dr8kPq4g7hd/FrxbEkZN9CoB2ohUbn
 JgMVG1bTDaUgo5MuHOekqtBKYaCMd6aPxufBfvHboZ8cp2PH/slTcXPVrRbSkKKYjm9A
 hQhA==
X-Gm-Message-State: AOAM531KMqcD/WhnkYwoO8V8y5/6pb0oxCbbVGuYS0tBVTW/FYig2X+R
 k1HFhEQLy542fjA6M1t8/9eORNAciy7VwgnsB0Lc93Bg
X-Google-Smtp-Source: ABdhPJzrfuDXBXGHdlpCMwEUgzDVvHcUKPyx/Ql+d/L1srIQ2j0cPyrr/PEXSoJsV6x2XFN6hw1MRUhK1LDZE7JRk68=
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr7367264wmk.73.1602211956431; 
 Thu, 08 Oct 2020 19:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201008193908.3124447-1-alexander.deucher@amd.com>
In-Reply-To: <20201008193908.3124447-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Oct 2020 22:52:25 -0400
Message-ID: <CADnq5_ORhSsnJRe6zd5EEM556VZSQHTA4ay7BU_pfo4Z47-MKw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: mark Sienna Cichlid as experimental in 5.9
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
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

On Thu, Oct 8, 2020 at 3:39 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Certain boards have problems in DMCU handling in 5.9, mark
> as experimental for now.  Will re-enable in 5.9 stable once
> the appropriate fixes are backported.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>
> Still working on the appropriate fixes so I decided to tee this up
> for now so we don't miss 5.9.  drm-next is working properly.

We've found the fix.  Ignore this.

Thanks,

Alex

>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 321032d3a51a..ed60d136fff7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1048,12 +1048,12 @@ static const struct pci_device_id pciidlist[] = {
>         {0x1002, 0x7362, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_NAVI12},
>
>         /* Sienna_Cichlid */
> -       {0x1002, 0x73A0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> -       {0x1002, 0x73A2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> -       {0x1002, 0x73A3, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> -       {0x1002, 0x73AB, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> -       {0x1002, 0x73AE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> -       {0x1002, 0x73BF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID},
> +       {0x1002, 0x73A0, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
> +       {0x1002, 0x73A2, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
> +       {0x1002, 0x73A3, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
> +       {0x1002, 0x73AB, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
> +       {0x1002, 0x73AE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
> +       {0x1002, 0x73BF, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_SIENNA_CICHLID|AMD_EXP_HW_SUPPORT},
>
>         {0, 0, 0}
>  };
> --
> 2.25.4
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
