Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6BA48F25C
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jan 2022 23:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40EC10E27B;
	Fri, 14 Jan 2022 22:22:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9878D10E27B;
 Fri, 14 Jan 2022 22:22:27 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id t9so14128366oie.12;
 Fri, 14 Jan 2022 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OuFqSaMxaXSA3AG2hrBWHPE80p6dOgVotZ/6HyoHHDQ=;
 b=DInweyXhj+pq4R0V0wEKu4edGsSit9iMrD9zEnh+MSBExEn8lPa7LJnvF+fyZsPx3P
 AW4nKVFqc2/+znfySiTSmQ1L7lG/CFCyPwrzZt/gabEZ04jPhgN9NirWhIfboMrWhOgi
 6tfPgyogxPf22ql8cWDG3HgK2j/aO9VYWqeh3bBmD6LO0w0rFnLgrxtyHrO8A58OKAEF
 0Sd/hq7D9nQYkpTJmWHh/9biy+L/lGXtZVPtUziJEJ/Ji5RmZwGMlSgPe0HEuzpzgbbG
 aM8Tuh4DFw06C6TScuQ1A7f3cdXIg3YhDMKvVZ4DbrqR5glCFds+r/BbMh7Z376Owp5d
 fdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OuFqSaMxaXSA3AG2hrBWHPE80p6dOgVotZ/6HyoHHDQ=;
 b=vxcOIG/eBf6+AApbnykY+o5wTQErkeO+cNCmawhMciIm4OycqQz2ewkj9tqifm5ptT
 ZwP9pOp4fHuzY+ZWM/Rp8fFO8aRo609IkX8LzIfp9zIzHcTsNrRuX1YwN1o8y9PtNj+q
 RrBZcA3XRAuQudQXeXYPqHAjfMr+VmBQxcHSkCPjjlhVj4mWQbQ+om7BbtcuwE9F7HQ9
 78r8jkbLO1PuZv1EQf6tY2SqbYxv73yruftIu0FWLAqp7w4JBErEPX504Vf3Hx93T0Z2
 YdaKuBPAtkElLDdqrwTFTqLvMxOlhayJQ3V70UfyWdz/MDUyyDMyeIGvzThQTXb+xff8
 zPpw==
X-Gm-Message-State: AOAM532nc9jRGaPTFDwesCAB8CiytXH8VVnDK0rH3+I1FcrwiDcDVMFP
 olrFmO+KVnuoaQk2Fdud6egsXSiEvxXFZTNgp8o=
X-Google-Smtp-Source: ABdhPJyvgK+CZsm//lGNrHCH6ev3Ik3D8iP9ufTbc7sMAeJopB8avoD4Em0aJ/WF3OYVj7+qmcyUuAz690RTSGGAwCE=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr14140437oig.5.1642198946853; 
 Fri, 14 Jan 2022 14:22:26 -0800 (PST)
MIME-Version: 1.0
References: <20220114104352.6107-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220114104352.6107-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 14 Jan 2022 17:22:15 -0500
Message-ID: <CADnq5_Nn2BzODYyUZBq5Qy-7WURbejMi4amBeu3gvg5AdY9SdA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove redundant initialization of
 dpg_width
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: xinhui pan <Xinhui.Pan@amd.com>, Abaci Robot <abaci@linux.alibaba.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Jan 14, 2022 at 5:44 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> dpg_width is being initialized to width but this is never read
> as dpg_width is overwritten later on. Remove the redundant
> initialization.
>
> Cleans up the following clang-analyzer warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:6020:8:
> warning: Value stored to 'dpg_width' during its initialization is never
> read [clang-analyzer-deadcode.DeadStores].
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 497470513e76..1f8831156bc4 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -6017,7 +6017,7 @@ static void set_crtc_test_pattern(struct dc_link *link,
>                 else if (link->dc->hwss.set_disp_pattern_generator) {
>                         struct pipe_ctx *odm_pipe;
>                         int opp_cnt = 1;
> -                       int dpg_width = width;
> +                       int dpg_width;
>
>                         for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
>                                 opp_cnt++;
> --
> 2.20.1.7.g153144c
>
