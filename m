Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3851CB557
	for <lists+amd-gfx@lfdr.de>; Fri,  8 May 2020 19:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B5B6EB39;
	Fri,  8 May 2020 17:04:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12866EB39
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2020 17:04:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u127so11340927wmg.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 May 2020 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KQYeKe5Hrr8NWqtWTMwxMrRR1QGVEHESPKAb5MTJjUE=;
 b=IfrLi9ApO65E7VENcNBbnqWTbd1qkbOlUpQjePkrNmioqmhN4HQHB+JlVoiUMHDJvd
 cg/O6FShRZeBYsAXOBFHRzVjbuiK5cmGl9MdkdoCxiHEnNoPZpCxXgep2O1EprRTuRue
 C8DsVcyyZDj6EfYF0CQL9Kk6sSAbpHYEr4fLO4Ctbz8jKx/bs/xtJTAvS7xyE4xkpfxK
 D0C2qmk7ajZWjHpo4PsjSFdlGSGhFznWLG2TlL9IfwkbZzbXSyLNSaZHDMhUTFE/nuaj
 A+jLA1gbKFE2qEj+1hJHSeJlKZ6dMDqR1z75YwwgMmvZTORw1vD4fO2DtSdz14cYwTnD
 n6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KQYeKe5Hrr8NWqtWTMwxMrRR1QGVEHESPKAb5MTJjUE=;
 b=m0gAvak0Sz/H8dl1oGWcpguapBxRNA/ufo76ptzxcy/2g3fRKP3O4KW7iuGx2HTsDa
 Gd5CdgbY4voLLQjrIlDUgFi11yPEudmdkpPhdvss0W78glliKx8pxqovrjfo2qWsX5yV
 A1/JLzaN3dJOogP4O7ZR0y4UquasngeBCu00NWdNhBngCOUBjABEc6AVhvJVb7BUt9X6
 KMjBw9CaqRwqk9ERMGzeH/d8clQ4gibXD2Ma7CJXC/LVOU4+b1ySe0aK5/401tO35Amr
 54GUB0ZtDt93BwnKxnWRJUDsGxNhgVnVbyr8mR2eKvhsbqM++Uq3L1m3umZdnwX4feZt
 1MSA==
X-Gm-Message-State: AGi0PuZZoou+gdtqgdg3bO/XuYgjTgPugyww60CHK/md7fx23FiH68ud
 Lp6X/TGvxGZ8m7SWKV+BRhN1AO1b47WWDhgIXeGRnxWq
X-Google-Smtp-Source: APiQypLmGfCGEtamxCMjHKZ4OrhExtZVPSOCNTHtEagYouDsjc073zb9oXV8B69ylpGu9eSzw/KRVkxGOcT7euMHTHc=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr16688412wma.70.1588957482394; 
 Fri, 08 May 2020 10:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200508100253.12839-1-evan.quan@amd.com>
 <20200508100253.12839-2-evan.quan@amd.com>
In-Reply-To: <20200508100253.12839-2-evan.quan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 May 2020 13:04:31 -0400
Message-ID: <CADnq5_Pw0se56hATgHxZapr4RZ4ALgDXmfOLRLkgBVviimj6pg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: report correct AC/DC event based
 on ctxid
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 8, 2020 at 6:03 AM Evan Quan <evan.quan@amd.com> wrote:
>
> 'ctxid' is used to distinguish different events raised from SMC.
> 0x3 and 0x4 are for AC and DC power mode.
>
> Change-Id: I7dbcb053fe9cea7c70e0a33afc2115b3745f6186
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> index ab727f33b8d9..dcd3a54d18a3 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -1522,6 +1522,7 @@ static int smu_v11_0_irq_process(struct amdgpu_device *adev,
>  {
>         uint32_t client_id = entry->client_id;
>         uint32_t src_id = entry->src_id;
> +       uint32_t ctxid = entry->ctxid;

As noted by Christian, just use the entry->src_data[0] directly.

>
>         if (client_id == SOC15_IH_CLIENTID_THM) {
>                 switch (src_id) {
> @@ -1547,8 +1548,18 @@ static int smu_v11_0_irq_process(struct amdgpu_device *adev,
>
>                 }
>         } else if (client_id == SOC15_IH_CLIENTID_MP1) {
> -               if (src_id == 0xfe)
> -                       smu_v11_0_ack_ac_dc_interrupt(&adev->smu);
> +               if (src_id == 0xfe) {
> +                       switch (ctxid) {
> +                       case 0x3:
> +                               dev_info(adev->dev, "Switched to AC mode!\n");
> +                               smu_v11_0_ack_ac_dc_interrupt(&adev->smu);
> +                               break;
> +                       case 0x4:
> +                               dev_info(adev->dev, "Switched to DC mode!\n");

Might want to make these dev_debug so we don't spam the logs.  With
those fixed, patch is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> +                               smu_v11_0_ack_ac_dc_interrupt(&adev->smu);
> +                               break;
> +                       }
> +               }
>         }
>
>         return 0;
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
