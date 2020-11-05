Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B972A8013
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Nov 2020 14:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD546ED25;
	Thu,  5 Nov 2020 13:55:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9A26ED25
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Nov 2020 13:55:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x7so1879143wrl.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Nov 2020 05:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bySZeFQlSOmNtgwNXy8w6B7tcxj3HjTKjamqTexqfY8=;
 b=NZkcmPpN84FBxaq2ffznrKwN3/yiqF7N89koZ/L75YvluQbiFpInUA6yv222fWasyu
 RjHO8I0lPnWdwXrxrGq52GBsD6f+Fk+uLTP5zvwVBbDCynQ1IKMlcsd2yKozUY/XWiZx
 aySF62WBsDloFHq9/NOC85OUPGXWjcz76jJQ84Ze4CM0aZvurZZK9kFcM4AwUqWmYVyD
 DDbPd56omJ5ML75xFtxtLjK2jZi+RDRsyaUFfYSymOYY/m5UMG7GnhdP1qswX/wVWt2z
 Hwmjc0JBwx3RYasFrNDmmY6s/mR6aT3MwUiIqes6hP9EPc1AEtnhPYkHiLsUjNg3Dxp5
 1cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bySZeFQlSOmNtgwNXy8w6B7tcxj3HjTKjamqTexqfY8=;
 b=eizT0aymG5dG5l0YwijOgg8dakNOE0NGIc3JSYMZKECzoSZa+VcgJQbWPg88QfT5vH
 huFegZEQkcIsTXuSKpRr5S3Cul9u23ggf3+Ks3DVCpd1XA1r8uWsWKXA8ZDCPqwode3w
 KPxmGpoA+kT7MA2JsMvP3wAetPAdAjvCySwEbPQfdMehaF1imux4cA58TZfrsb+qoWGD
 jb5imozlYnt+xhSaTC3C8KSmAjV08ME8ohlLXcpUOioEKjqb2jyjarnkuOb5BeAOrBRo
 +1wGMuoAM5mGFOP+zr8UcD8ZirPq0XTiqyLdoi/rSmnEKF7/Ox1YXQy+Wrhw68X8YaEG
 d6aw==
X-Gm-Message-State: AOAM532Uc5PAfRXqmtSCRZeFnRaRy/ZEgPg/WXgS42IPqGBCkVTtF3ox
 x96Xr2zcxlkC1mfuHDBQ2JCte88vOmeN94XOfW8=
X-Google-Smtp-Source: ABdhPJzwMGPSIXaGlYI54VSt7NVJc3J9UfS4jGE+xoFdYbgVfesXMuQvOWl/fhs0RhYDbXZqn6Nk2b2rZpVwNsRTxL4=
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr3298045wrn.124.1604584533071; 
 Thu, 05 Nov 2020 05:55:33 -0800 (PST)
MIME-Version: 1.0
References: <20201105132646.3392-1-Roman.Li@amd.com>
In-Reply-To: <20201105132646.3392-1-Roman.Li@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Nov 2020 08:55:22 -0500
Message-ID: <CADnq5_Pir6PFYOppdVv48P4m0xiA31cQ5xv0GEnYOQFr2=2GSw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: add ta firmware load for green-sardine
To: Roman Li <Roman.Li@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Prike Liang <Prike.Liang@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, Nov 5, 2020 at 8:27 AM <Roman.Li@amd.com> wrote:
>
> From: Roman Li <roman.li@amd.com>
>
> [Why]
> In preparation to enabling hdcp on green sardine.
>
> [How]
> Add green-sardine ta f/w loading in psp_v12
>
> Signed-off-by: Roman Li <roman.li@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> index dff5c15b4858..c4828bd3264b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> @@ -40,6 +40,7 @@
>  MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
>  MODULE_FIRMWARE("amdgpu/renoir_ta.bin");
>  MODULE_FIRMWARE("amdgpu/green_sardine_asd.bin");
> +MODULE_FIRMWARE("amdgpu/green_sardine_ta.bin");
>
>  /* address block */
>  #define smnMP1_FIRMWARE_FLAGS          0x3010024
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
