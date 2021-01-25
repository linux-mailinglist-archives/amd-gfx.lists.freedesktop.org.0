Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F097A30271D
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Jan 2021 16:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D8989C07;
	Mon, 25 Jan 2021 15:50:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4F289C07
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 15:50:12 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id n7so3300187oic.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Jan 2021 07:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+SCPV4BZFoyRsHuoLx615eoKnvKtVamQHxepBfbqx7M=;
 b=oPAF8mPxf3i/aKjZBVEehR7jPY0ZKjBs4W5tfaDX8FBGXmeNOcgnljk2/LlV1oaL+i
 P8QucBzErKiclBQCKzr6sYDKlN2QP64ihkJbt9iURUKtfnJkqwvuQ0bX5X39hbqEzyOw
 cH/qbiCmCTXeR1G662Fg/dVCHIx5tQ23EpagoaneJlHuGeontLbDMGgIDh89SO055zO8
 aan+fv3aP0W5wwazVL54wTSUraayjFi+b2SjV+b6jVTLjbc2KApSGAPrF/n29LvQMBBi
 bZIOW9tN8vaiww9COS2Vzf5/2MM/OMBAzOJUIWChGigI0R8OEgix1OqKAhOEGFzOOWgg
 gOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+SCPV4BZFoyRsHuoLx615eoKnvKtVamQHxepBfbqx7M=;
 b=cJWcCDKFBjp8GbiH2d5M1sTRfY688kxIiO3Q83lWQmmrbV4VF/KUXeumWHYWTBoG2C
 mKPQYVCXxvL7Mj+A7IWRS2nFCXuMLuy4whdEjSSHH9UU93gFUcQltYrTyBQf9P4JqAtu
 NlU+X7DFEGZfXYiJwJvKsRIR74bpSMOymXv4gyv+aMJQO53/i7uay9QiQuUYzmU9ljnz
 mwiET9o5rmvqichlnwp6Y1Fq28+fRf8Gl4NmzhDn8f/nMXI2HpJ7MLevDCNOJAK8N5Zp
 GJB/6SFhlRxDcicTKVbOLk9KeReIMkzSwXEcLqOUzwG3lp96eOADQBpVsbqHOyKr0hyE
 sxbA==
X-Gm-Message-State: AOAM533AAC1/aYBl7pgwO6oMrZA3/+lBlvF9oEmT0Go280x3Tbu2/WqA
 AG7ZBe/7B/ZCdE2b0YHeCoQHdYpDXgscsoFCEpg=
X-Google-Smtp-Source: ABdhPJxEAfCVI5pVrdHU3xIgVq8j5ev1W+mk3AfPWV2EUQT3sibZcsN0BKMA+6aUw2N0xb34Hp1cYBMybhgtQ6buGCg=
X-Received: by 2002:aca:1a17:: with SMTP id a23mr493083oia.120.1611589811978; 
 Mon, 25 Jan 2021 07:50:11 -0800 (PST)
MIME-Version: 1.0
References: <YA6FW84XDSakXqNb@mwanda>
In-Reply-To: <YA6FW84XDSakXqNb@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Jan 2021 10:50:00 -0500
Message-ID: <CADnq5_PL8baNFhVpydh02gDbk88aqeFC76wox9qZXXEXzf6uQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix bitwise vs logical negate
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, Aaron Liu <aaron.liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Liu ChengZhe <ChengZhe.Liu@amd.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 3:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There was a mixup between logical and bitwise negate so it just sets
> "data1" and "data2" to zero.
>
> Fixes: 3c9a7b7d6e75 ("drm/amdgpu: update mmhub mgcg&ls for mmhub_v2_3")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Someone else sent the same fix last week.  Applied that one.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> index 1961745e89c7..ab9be5ad5a5f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
> @@ -531,12 +531,12 @@ mmhub_v2_3_update_medium_grain_light_sleep(struct amdgpu_device *adev,
>
>         if (enable && (adev->cg_flags & AMD_CG_SUPPORT_MC_LS)) {
>                 data &= ~MM_ATC_L2_CGTT_CLK_CTRL__MGLS_OVERRIDE_MASK;
> -               data1 &= !(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data1 &= ~(DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
>                         DAGB0_WR_CGTT_CLK_CTRL__LS_OVERRIDE_REGISTER_MASK);
> -               data2 &= !(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
> +               data2 &= ~(DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_WRITE_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_READ_MASK |
>                         DAGB0_RD_CGTT_CLK_CTRL__LS_OVERRIDE_RETURN_MASK |
> --
> 2.29.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
