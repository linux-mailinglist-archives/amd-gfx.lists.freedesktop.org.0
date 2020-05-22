Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F861DF036
	for <lists+amd-gfx@lfdr.de>; Fri, 22 May 2020 21:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9758F6EA3A;
	Fri, 22 May 2020 19:53:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F36EA39
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 19:53:06 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so11334006wru.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 12:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8onKDKqsgzl9AreRiDkEHzQkZcDtZpsqapxwawQFn2s=;
 b=PbdEU0cCaqt4LKRNcrC2+CqYumc8n8ze/jd/RDhg4Os57b7/cbrByjWIfRigDXlwx8
 cnwiyLv0IReQywORGdIg+gUWO8XHVLmtw9U4QGyANZ2NxJsOs3HB1Ot3jK1gs8212dVg
 dKbYVdQ5BBOb0ieMJ2K0dUwKtP1Hg6owcc8S/mBXT1/iDXHaXHM+dy+ja1UlEcoSIKN6
 3yusa3vnzMgapMoR2A3jhY+qtMjWsIKRDByaVuh840Kv0sWPivtlArD/NpHQabuZ9jeh
 9mSaEUXTxgeZfEQY7HY49gHYeHdKaBsuHUHA5MH+KgRbhmSu5PcMHdWqk5wB6HfL8Jq+
 CSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8onKDKqsgzl9AreRiDkEHzQkZcDtZpsqapxwawQFn2s=;
 b=aBq4nS6v/KPrb0eHn/Zr58yBFhrqTHfn5mLPGDy8ayBvSfeFz03ts/Zwa6RoDSsEdA
 RcK+FokZP/v3n7frmwT7R2n0ahC8640ylsuFy5PuAGjZWooVDvZbtiEpkHaX8IykRlvN
 57GCOfXPWNLdGYyNSaXgd7JQiKiSKATdZvnYobF/LDIa3SF+QT2BR08GzLuzyj7Z8UK4
 5mzMp/eILonD1O5p2O/2mVZzxFQhZaK07JBlB4AZQny3YbT0cK9jyGcJ+t1MCIVwLFAs
 hU2B9kt6VghmzSe9OUGeXChhA7Ps28jxw8WRdY3/ve+Tn+94uaRTdyr0Vg3eZKTVlp3g
 9PZg==
X-Gm-Message-State: AOAM531CvHu2NnQt9P0w3CIjID7ojvOi8Ls1MqEllbr+HEHUSHLfCMWn
 HsFXimeDwMzLt4TnFN+kmZyNX75WDYGOAhRp+5I=
X-Google-Smtp-Source: ABdhPJwMdZe8HtvgG0PspcOcFQ+aIE3pCvAGbzvEhyqTEPEeMvC0JfZ3nRFUNNldjj7UtTxBrFduXaVz9KfMHpKinBs=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr4866548wrp.419.1590177185027; 
 Fri, 22 May 2020 12:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200522193927.278795-1-Gavin.Wan@amd.com>
In-Reply-To: <20200522193927.278795-1-Gavin.Wan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 May 2020 15:52:53 -0400
Message-ID: <CADnq5_NOQbz_uM4VLR6qnw3ZzaCOj8MhHtufPDUnzRDkQV5xVg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: Fix the CGCG setting is overwritten for
 SRIOV.
To: Gavin Wan <Gavin.Wan@amd.com>
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

On Fri, May 22, 2020 at 3:39 PM Gavin Wan <Gavin.Wan@amd.com> wrote:
>
> For SRIOV, since the CP_INT_CNTL_RING0 is programed on host side.
> The Guest should not program CP_INT_CNTL_RING0 again.
>
> Change-Id: Ic336fab3b23b8371c9e9e192182a3ba14a8db8e1
> Signed-off-by: Gavin Wan <Gavin.Wan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index bd5dd4f64311..4d6928cfc269 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4558,7 +4558,12 @@ static void gfx_v10_0_constants_init(struct amdgpu_device *adev)
>  static void gfx_v10_0_enable_gui_idle_interrupt(struct amdgpu_device *adev,
>                                                bool enable)
>  {
> -       u32 tmp = RREG32_SOC15(GC, 0, mmCP_INT_CNTL_RING0);
> +       u32 tmp;
> +
> +       if (amdgpu_sriov_vf(adev))
> +               return;
> +
> +       tmp = RREG32_SOC15(GC, 0, mmCP_INT_CNTL_RING0);
>
>         tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_BUSY_INT_ENABLE,
>                             enable ? 1 : 0);
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
