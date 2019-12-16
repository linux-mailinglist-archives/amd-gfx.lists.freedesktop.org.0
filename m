Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD827121ABC
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Dec 2019 21:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 516796E87A;
	Mon, 16 Dec 2019 20:16:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AD56E87A
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2019 20:16:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so675937wma.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Dec 2019 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZNP9P4XqLfq1XfDDi/McSzgFyH9B9+RzmB+2W5W5Tw=;
 b=p2vnEG9U9yvlN5iM39Ib/+lMrxBaodNQTsSLYz51IrPCz+4kA3OPD3ygadp6NhHdCC
 m40DGrNR0KkFwH/D29QcBbnJPzpOlHthTyr8RLxWX0+6veZArKkWYDxj8OPio68Ouzea
 I9Ag8PGJ+wqJ2b0fMi7gIrENQb6O6Z7QjccOru1PnqaygVpdknkpvJFYIFvCW2ZouvYH
 NGK0AmcbufTpjcGRtL6SD/wi9RqYWV/RiVbhL1WKEb6O599iOCZ2E4FC+Ycwoy6fTxHk
 zI9wssYV75YgUFQ0MMcCPQnReUrKm7l6xAeIUfSQWPvMtIUJ46aq31PD7inhTh+QRktw
 fohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZNP9P4XqLfq1XfDDi/McSzgFyH9B9+RzmB+2W5W5Tw=;
 b=HvQjqz4yW4N09jYtC0HQqAQZhPEqTKtDAM6a9dwrcuoPCcqoMzU3Tk3eOV8JDkf4AX
 EOf5SYuFYzA2fryeKnIEufphhTNY6L1dL95eysSZjeJKVn7hFaeJf44mH+bVr0Dcgbsr
 Fs76lFBapHKGI7ab3AhwTz2eb1GmfADEYw9KX90f3R9Rc0sWE3URjsfB4wEsEy5A2UOO
 /vfD4xltkA96/ObKf+6yGHTDUIX1VSWXpncd8Gujn+oOTAtnR05L6sXKz1EOpz+WQW3u
 QDb/q6BzYnQAWS6b3Q2+6Yg18caR9fVFpyiyH6z30TnQcFgJB6iiCtCyadiXz0FFsF3d
 1ikA==
X-Gm-Message-State: APjAAAU3XsHfPsb6MPVkUpT8QmoQY+rN+NY9sbysiWisQvH3ywLnUZ6s
 I1PmzSdTC9Sl3D6PYxtpBzSiByYYxjAS/++ns2jpUQ==
X-Google-Smtp-Source: APXvYqy4gIGVZZNh4CeskMJNgvOqkXsvp+Z095t6Lfze1H9K3tPaGLFOp6p3OAe2RyQuxvDyxbTzT9nbAS1laXWv/Rc=
X-Received: by 2002:a1c:e909:: with SMTP id q9mr957593wmc.30.1576527382068;
 Mon, 16 Dec 2019 12:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20191216160543.13054-1-leo.liu@amd.com>
 <20191216201444.28465-1-leo.liu@amd.com>
In-Reply-To: <20191216201444.28465-1-leo.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2019 15:16:10 -0500
Message-ID: <CADnq5_P1ksbJNkFkPpCxPhmgeCJn=d6PKcc7BHwTomLc2+7q1Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vcn: remove unnecessary included headers
To: Leo Liu <leo.liu@amd.com>
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

On Mon, Dec 16, 2019 at 3:15 PM Leo Liu <leo.liu@amd.com> wrote:
>
> Esp. VCN1.0 headers should not be here
>
> v2: add back the <linux/module.h> to keep consistent.
>
> Signed-off-by: Leo Liu <leo.liu@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> index e522025430c7..623b9f9ef1ea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -28,16 +28,10 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>
> -#include <drm/drm.h>
> -
>  #include "amdgpu.h"
>  #include "amdgpu_pm.h"
>  #include "amdgpu_vcn.h"
>  #include "soc15d.h"
> -#include "soc15_common.h"
> -
> -#include "vcn/vcn_1_0_offset.h"
> -#include "vcn/vcn_1_0_sh_mask.h"
>
>  /* Firmware Names */
>  #define FIRMWARE_RAVEN         "amdgpu/raven_vcn.bin"
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
