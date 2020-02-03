Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6A1511D7
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Feb 2020 22:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEB16E03C;
	Mon,  3 Feb 2020 21:32:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07406E03C
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Feb 2020 21:32:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so20265063wru.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 03 Feb 2020 13:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5H5DvKKoyR4sGPjBEgk5hSeKkBAu5SmsZDE9Qt78Eo=;
 b=h4lZJO2/+G4qB7JyT4kprr75MXToqUlkCbbQQk3xnqlYoH88zDSHRudMjuSpicGhEx
 Sz9yeyVt9JUYWtiRRoSE71U/cXoN+NazBDzVB67UpCmdQqeVOxcqJtlMA5GUz375Ngrc
 QUXlbfYOgEF2KZLQiD978r1OC9JdKuuEf5G7U7fbw4RTlkMeqx/PUl6BewzFsxhRxeDJ
 gPKQJWphDHhlCvV+BddgAJveJHX8/Cm//GPLLfaI7OwFDj4Y/4zczg6kILOk4PODmHek
 zh43sqMSSANe62UPXfFVMmed3tmLYqaoc6duaOmFb8K9pA7D761kpTBdhbIO8JZosjea
 b98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5H5DvKKoyR4sGPjBEgk5hSeKkBAu5SmsZDE9Qt78Eo=;
 b=YwyVHAOWROgl3kLU7pwyydIEoFfckN7cGPActtKYqA1WPvUY9urCJwtKGbaVg+Qa1d
 3Ije/w2Il/GeR1Mby0PbF8WIaSwMMQ4SFyJ2/q1GL4LHnOg+RbB5nSMV9RV5Ynw/sTHO
 WWTz/wbpzjKShjsWT9X4Qz1YYO5nisml8ahq78gTVmBPCNTlNAY5eoVQoEMKoDJ7DO5v
 LTgbWFyeq3PXxeHZSJqhFTXPAPFTL/Q+NBny41iOktlgPvsNlTIFSTXfw3FbAWo+vg++
 qzrm1nZF63ygdW4NVybPPc8adG9RS9nj5Yly4CzynJE+Um6zsNnQIC/EKPX0U20pw8kL
 InpQ==
X-Gm-Message-State: APjAAAUD/OUrdfeezIc3tt0lpoCNjeh6D515XTfMkcwgBJltpqzIEvoz
 nDOv8cu2flF3qEaFGLLWRNsWrdCnadkwZmW/Upc9qg==
X-Google-Smtp-Source: APXvYqxHcLK2KYNDVTnljWzByoqnHKyemNzMtkmXbSiKFw2v5vYodAP3fCu/2WTW3JELpNkhuJikRjiP6aBcrFAqvEM=
X-Received: by 2002:adf:a50b:: with SMTP id i11mr16443761wrb.362.1580765546263; 
 Mon, 03 Feb 2020 13:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20200129180130.585870-1-alexander.deucher@amd.com>
 <20200129180130.585870-3-alexander.deucher@amd.com>
In-Reply-To: <20200129180130.585870-3-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 3 Feb 2020 16:32:15 -0500
Message-ID: <CADnq5_P4NCzYUs66-Nbi3AuKu-9DkoVx96PU0FYcbE-v83+Kng@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu/smu10: fix
 smu10_get_clock_by_type_with_voltage
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

Ping?

On Wed, Jan 29, 2020 at 1:01 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Cull out 0 clocks to avoid a warning in DC.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/issues/963
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> index 273126cfc37d..689072a312a7 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> @@ -1080,9 +1080,11 @@ static int smu10_get_clock_by_type_with_voltage(struct pp_hwmgr *hwmgr,
>
>         clocks->num_levels = 0;
>         for (i = 0; i < pclk_vol_table->count; i++) {
> -               clocks->data[i].clocks_in_khz = pclk_vol_table->entries[i].clk  * 10;
> -               clocks->data[i].voltage_in_mv = pclk_vol_table->entries[i].vol;
> -               clocks->num_levels++;
> +               if (pclk_vol_table->entries[i].clk) {
> +                       clocks->data[clocks->num_levels].clocks_in_khz = pclk_vol_table->entries[i].clk  * 10;
> +                       clocks->data[clocks->num_levels].voltage_in_mv = pclk_vol_table->entries[i].vol;
> +                       clocks->num_levels++;
> +               }
>         }
>
>         return 0;
> --
> 2.24.1
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
