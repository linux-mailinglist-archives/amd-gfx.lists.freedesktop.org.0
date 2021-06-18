Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995E3ACD11
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Jun 2021 16:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A743E6EA21;
	Fri, 18 Jun 2021 14:06:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512EC6EA23
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Jun 2021 14:06:03 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q10so10658120oij.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Jun 2021 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=auQ4weX8p2gz/TRRNfRcpLYBlQcDrPPZYpGQcMompMI=;
 b=NlIIx7RPZ5IgVPgYMl/bplFh/ra7cy3rfnXD3lfx3UoANIECzu0Ne4mXQlh01sapmX
 QyJ36DkGiqPGh8Qf3bo0VJQUIAhC+g32BB27vqQUCTRul8PhhLtEAegyrC/EghLrYx0H
 JV/xJBpq3+k3Nrp2wwyHTfMstEDayI3DOk1bdiHunsdh2ITtbK9GbSVt/ILCEN+Kz2OC
 Bv9oKAMOZJzcnGvAGfLmgGiBqk1qWklb3Ln2u2Al4g0RNDtPAT7yIGH+3vD/0C6/06Q7
 GWLT3YqIVoR6Lub3YiJVlaItWUeAfkPeLzc3ry55BU8T9tTsnzAXaRTcIWKaCV3kFd2a
 VICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=auQ4weX8p2gz/TRRNfRcpLYBlQcDrPPZYpGQcMompMI=;
 b=FQVbfhlOQoUD6DMc54l5uZLdYbxqHBE8e82V2ZuUq/cNH0/8ESu1oGWzH+uwYb9Kzb
 rE/jYF/02RsF0zowy/uQiLoyzB8++YMbBSPjrQExQZ5KhnQFM8NvUmrbAbCKcwpot7gg
 2NkIWBCruqKT0zBqk52Aj0ojLndGIULgMyKqSA5NOUkmPXArJpBTu3VHXbwjOqnDiIAp
 x82/L6exfAgrVw7mm4WtNhPUv56AMU7oKdEauqcfe3EkhQYQ06pdmk9dwrEam+X7Bd59
 oG5LRf/ms/oFq6jSJL/8Ms2pKg+SJSkK0DtRx8iNKtVHsdibbIvT4t/mLp5fhBev16o6
 iebw==
X-Gm-Message-State: AOAM530L/5UuOLRECvBXIREmzYJb6dAuylXeZj1MAiFE1So4GFwZ7Gwo
 3x6IQe3PjGzx1RMWZYKr/FXpffpbjfEKt0/LkKs=
X-Google-Smtp-Source: ABdhPJzJuBLa5Q/+/l594p8ttC4ZZWQ1BdZAqgNIA6f6tiT4Rf4ASN2W/jZPPRpks/yTne8OQ1NxUcJ9eFFMmxsg8IU=
X-Received: by 2002:a05:6808:c3:: with SMTP id t3mr14061433oic.5.1624025162719; 
 Fri, 18 Jun 2021 07:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210618091711.294043-1-ChengZhe.Liu@amd.com>
In-Reply-To: <20210618091711.294043-1-ChengZhe.Liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Jun 2021 10:05:51 -0400
Message-ID: <CADnq5_OmVyc+XE9uUetfqi47AUZVG4s8iRS_BVNNiVk-hPqAQA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Power down VCN and JPEG before disabling SMU
 features
To: Chengzhe Liu <ChengZhe.Liu@amd.com>
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
Cc: Jack Xiao <Jack.Xiao@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Kevin Wang <Kevin1.Wang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 Deucher Alexander <Alexander.Deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Fri, Jun 18, 2021 at 5:17 AM Chengzhe Liu <ChengZhe.Liu@amd.com> wrote:
>
> When unloading driver, if VCN is powered on, sending message
> DisableAllSmuFeatures to SMU will cause SMU hang. We need to
> power down VCN and JPEG before clean up SMU.
>
> Signed-off-by: Chengzhe Liu <ChengZhe.Liu@amd.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index cb375f1beebd..ebe672142808 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -1453,10 +1453,14 @@ static int smu_hw_fini(void *handle)
>
>         if (smu->is_apu) {
>                 smu_powergate_sdma(&adev->smu, true);
> -               smu_dpm_set_vcn_enable(smu, false);
> -               smu_dpm_set_jpeg_enable(smu, false);
>         }
>
> +       smu_dpm_set_vcn_enable(smu, false);
> +       smu_dpm_set_jpeg_enable(smu, false);
> +
> +       adev->vcn.cur_state = AMD_PG_STATE_GATE;
> +       adev->jpeg.cur_state = AMD_PG_STATE_GATE;
> +
>         if (!smu->pm_enabled)
>                 return 0;
>
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
