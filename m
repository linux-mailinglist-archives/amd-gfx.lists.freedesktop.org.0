Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751E1A6890
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2020 17:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EBB89DA7;
	Mon, 13 Apr 2020 15:14:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F4D89DA7
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2020 15:14:22 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a201so9961761wme.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2020 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Ob/TLVDFSx2i3avvvJO3H1IkTxGPJX7Em1CZIelZFQ=;
 b=raNO6h/KJXxue9I8OU9hBB1AnTF2wDwTTjStXZ+5c/M5FtvjGmhGmbedYAnUpE/GWn
 BaG0LRABrD+ePQ/xoMR7OS+309iuU0u+OEDLfhGXzIAqKUF7a6PwUDI5ftvXsQv5pEBi
 gJ+sPm04ZFtY7/1GHiKMq3r7+BVuW7t5lT/TW/y1bI7futmgzz5ftSr1XYNFWTEjRwMj
 n/nV2zd6UZesQcxSFcGBz62vL7uRUW83SczHy2uZdSK6uGntUAFMrq+SFGDTlo+/ssDd
 1GUH5el167MMDpCiMOQKI0cC14yOK0ENxgzUFgsqoQ+fQKOJ/BA+8bm4ieY4RQvfvWvn
 +ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Ob/TLVDFSx2i3avvvJO3H1IkTxGPJX7Em1CZIelZFQ=;
 b=TTSgyJAs74ZG+V639CjolfyfCft5BANX7llLeq1l54YN+6xIYRQB3XyAKWc554L1CD
 LOL7FvK1qAuAgth9LghRcIWH9nlkFyhYbESYZV0UTarL8WAFkgMlV5cV/Yx8sSGtYlg3
 ZZBybPFNXU4rZYNiIALH6ON+33BT8VPChK0moEKikMClAemOWChJakIdKwPa5O4/sJ4F
 uR+v8sS8fznO/P00i/E1buvNHB5dv/IqRGiaKuJwn50uXtrI8lFHxOFF64vuTTQnd6vF
 R95yvU/vaqY2DwDSENsld5yQ4ezDKbuNxejzFssJPMDTctOoDkncN5v8mOlZjegfdNjy
 iLMQ==
X-Gm-Message-State: AGi0PubHJHrDMIJyqgxLIQIrlU/bFxYsx17d7Sz0l3N0kyMDeDShTg0P
 QApDrZ1Bp1GCxEKSwtwEq3Fv1dZd8iZhLoKUqfoViw==
X-Google-Smtp-Source: APiQypJsvLxxi44LVmTdsn7FJJRror3Fuv5zN/X5Q++nx6ZieVs3JCgtMRzJyHerGT2VMXtc2sETyVrn8eB8z3EsPRM=
X-Received: by 2002:a1c:2842:: with SMTP id o63mr18907890wmo.73.1586790861699; 
 Mon, 13 Apr 2020 08:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <1586790530-19464-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1586790530-19464-1-git-send-email-Prike.Liang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:14:10 -0400
Message-ID: <CADnq5_Os9ePu+u0cmroyKRVyXroYD9Bggyy0Do1mWW18m5-Pbg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix the hw hang during perform system reboot
 and reset
To: Prike Liang <Prike.Liang@amd.com>
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
Cc: Rahul.Kumar1@amd.com, xinhui pan <Xinhui.Pan@amd.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Johannes Hirte <johannes.hirte@datenkhaos.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Apr 13, 2020 at 11:09 AM Prike Liang <Prike.Liang@amd.com> wrote:
>
> Unify set device CGPG to ungate state before enter poweroff or reset.
>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> Tested-by: Mengbing Wang <Mengbing.Wang@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 87f7c12..bbe090a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -2413,6 +2413,8 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
>  {
>         int i, r;
>
> +       amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
> +       amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
>
>         for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>                 if (!adev->ip_blocks[i].status.valid)
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
