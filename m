Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F771DEFC4
	for <lists+amd-gfx@lfdr.de>; Fri, 22 May 2020 21:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1576EA36;
	Fri, 22 May 2020 19:10:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBF46EA32
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 19:10:53 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l17so11201173wrr.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q5iXRODobZJ2FNcUNousfU3RzCb0dgFJ5J0gsEfMWyQ=;
 b=FqxcnY6aQBlAiB08L/IFIfI049U/0C4j7yfxguq6TF5e72mOhgBoYsO3DP3bTdm65i
 tPO/mMM9wWAsb1rAyoEg3C9hxbMdTtMOF2z0vzDSfbzGSBfpF4XV4cFajHqfGCxTUq6I
 7LhL/fPwNlsQklBzQOlGJTczfsUfjH6Tcvf4l59itQCdKkfkKNqW2AssAfkeA8AhCMDw
 sRNVCRJRXres/2kvgFcmvEbAiRJoc0+GPrZUdhe63wKBzAi+M69jtW00VEYUf8I9oIYj
 rvABn66zZWkbA5wOZqNjQ+ORfffrIB0FLjw2X8I37NHWnuN6rMDUY/1mXowvavN5SIdp
 NqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q5iXRODobZJ2FNcUNousfU3RzCb0dgFJ5J0gsEfMWyQ=;
 b=EJMC94RTmDp2g0YLSn2sgKrANpZZYXQg/7DWwHpCvA0ktURssO5QPzxLXlnwyV1Zg3
 mKc7bxu8GnJg7HT2DQ2xvFmSnl2NQvJm6OGARxBB66H+qdoYds9hxiKFmTkdRUqTHphJ
 e5UU+W4zdG4Bz5ATZybYlEVwdOJH50+AJ+cSMe0tSvRgOJ57XTh7j9enMWFa+IoRYQpG
 KlFNbpL1J4mW2w9w/DI6VrYRNCfTYyKMGu5npWD91CctSH8hmi7gTDjaO0OyOcnyw7Ce
 qiV0QmtShrxKnLxiXxZqAnJcR0qDdfE+SYHwjbuZ8pL9d15Zhxz5SULgweIkZ3GoD/fk
 lILg==
X-Gm-Message-State: AOAM533iZyhxwLtPVEr6/jf3/EyxxDpqdD542Kk5uGHt2ZlF8+/yYqL6
 XznkWzM8dE7bg0wYiRzhxqYM/AX5rU311uDqnVdM5w==
X-Google-Smtp-Source: ABdhPJwIeTJNH4IdbOWLuOPXv9uqQdWVEKLHU8Fm8Tmt97XBDzQB8iF9EXBZs+HZdJdjlctHi9Q1uA22FBre6liXRTQ=
X-Received: by 2002:a05:6000:14b:: with SMTP id
 r11mr4817354wrx.124.1590174652309; 
 Fri, 22 May 2020 12:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200522181931.277182-1-Gavin.Wan@amd.com>
In-Reply-To: <20200522181931.277182-1-Gavin.Wan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 May 2020 15:10:40 -0400
Message-ID: <CADnq5_P3a9-_zaoZBGi1nrnUJ2HVYb4_UWpjxLn7+S9qSe5zpQ@mail.gmail.com>
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

On Fri, May 22, 2020 at 2:20 PM Gavin Wan <Gavin.Wan@amd.com> wrote:
>
> For SRIOV, since the CP_INT_CNTL_RING0 is programed on host side.
> The Guest should not program CP_INT_CNTL_RING0 again.
>
> Change-Id: Ic336fab3b23b8371c9e9e192182a3ba14a8db8e1
> Signed-off-by: Gavin Wan <Gavin.Wan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index bd5dd4f64311..39275bf79448 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4558,6 +4558,9 @@ static void gfx_v10_0_constants_init(struct amdgpu_device *adev)
>  static void gfx_v10_0_enable_gui_idle_interrupt(struct amdgpu_device *adev,
>                                                bool enable)
>  {
> +       if (amdgpu_sriov_vf(adev))
> +               return;
> +

This needs to be below the stack variable declarations or you'll get a warning.

Alex

>         u32 tmp = RREG32_SOC15(GC, 0, mmCP_INT_CNTL_RING0);
>
>         tmp = REG_SET_FIELD(tmp, CP_INT_CNTL_RING0, CNTX_BUSY_INT_ENABLE,
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
