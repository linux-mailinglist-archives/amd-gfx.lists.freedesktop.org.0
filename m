Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D826FE1A
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Sep 2020 15:20:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7726E182;
	Fri, 18 Sep 2020 13:20:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE506E182
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 13:20:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l15so6693283wmh.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Sep 2020 06:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E5pzW4fgSDVxA1LdLVOWzEkMk3h+fO0QjpI6uhIf9Mc=;
 b=LEjxsl4lJzD869W4Eq//fqg/kd2nhpGj2rY9jDzr5uNjx1LfwkDJlRgQom/7y93TKO
 VPezrQG1bzgsaIfJT4L8jUtEJQfbf/hb2B5XybrUfHIpVWB+oR4GGfGa1/+PSgZ5Phes
 uiUu7RxV4fYh2DO/Ry6Kg0yyq/1qJhyr2Tf1YIf7DZyCAMAZDHOwfqR73JVugUHNsq4l
 MHpPy325LJkMJ60oUI3uZCU52REH1lh5yUuzR/PGZ1ZeLcHFbkwp298atJXZnP3oBiJU
 OAVQNtwabd882RO+uQEv5iZTBwYGHX8ls403VUfbLO6aqlG6LhApe/vtdZLY1rR8bfff
 XhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E5pzW4fgSDVxA1LdLVOWzEkMk3h+fO0QjpI6uhIf9Mc=;
 b=oGNwcKXuwmrkxMWc+X1XBrHaCTtvk9tdEXfQB4E6OmKetN8QmXgvIAeTTiWvXqUWQW
 BCTQgOen16ikr9MjUhgcZ8OABGUVImH5np+iVn9/fQ2ut2oAagsJZeJgxf/aYK0usQB7
 6O4XqImqYUm5daPnGJ3u65qscD5jNoiA41c89abnxZHQM1mFYuWMT6GoMBpOPrPwEssM
 Pg+BVjP8yImlIvEj1/CYCbRNfUOogpGJ3YXn8lpYpeEd9ywMjRsRP/IpD5tDce2EhXuN
 YM1/44SFPcz8ja1VYwQCOH6Zo6ephYFJkpNCiVs0KaN9QGQg+J2c6swFzBTPHngvayPJ
 4Rlg==
X-Gm-Message-State: AOAM5332hheeV43w4BpQ4ltcbdjPgZGLZlSsjCXGyMx9Asezc1ip/4er
 +wIirYaaMus/gQuVj9MGNonxZxSC4YSzbM2UsF2eXdg4
X-Google-Smtp-Source: ABdhPJyZ3x1pqEA7GArS8sEV/pMru87OsgQYXUtrSWPM7ZZ138DL9WySaRX2yn3A40QQwa4a1mStURbLXTrqXc4u+WU=
X-Received: by 2002:a7b:c090:: with SMTP id r16mr15802789wmh.56.1600435207276; 
 Fri, 18 Sep 2020 06:20:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200730181637.677551-1-alexander.deucher@amd.com>
In-Reply-To: <20200730181637.677551-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Sep 2020 09:19:56 -0400
Message-ID: <CADnq5_OhZJBMkHUfbP1TVdSCAgoneap6Z3cCYn0ZZfv_Gh2KqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: optimize the mclk dpm policy settings
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ping?

On Thu, Jul 30, 2020 at 2:16 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> From: Evan Quan <evan.quan@amd.com>
>
> Different mclk dpm policy will be applied based on the VRAM
> width.
>
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> index ffe05b7cc1f0..b81719433017 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu7_hwmgr.c
> @@ -1585,9 +1585,19 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
>         data->current_profile_setting.sclk_down_hyst = 100;
>         data->current_profile_setting.sclk_activity = SMU7_SCLK_TARGETACTIVITY_DFLT;
>         data->current_profile_setting.bupdate_mclk = 1;
> -       data->current_profile_setting.mclk_up_hyst = 0;
> -       data->current_profile_setting.mclk_down_hyst = 100;
> -       data->current_profile_setting.mclk_activity = SMU7_MCLK_TARGETACTIVITY_DFLT;
> +       if (adev->gmc.vram_width == 256) {
> +               data->current_profile_setting.mclk_up_hyst = 10;
> +               data->current_profile_setting.mclk_down_hyst = 60;
> +               data->current_profile_setting.mclk_activity = 25;
> +       } else if (adev->gmc.vram_width == 128) {
> +               data->current_profile_setting.mclk_up_hyst = 5;
> +               data->current_profile_setting.mclk_down_hyst = 16;
> +               data->current_profile_setting.mclk_activity = 20;
> +       } else if (adev->gmc.vram_width == 64) {
> +               data->current_profile_setting.mclk_up_hyst = 3;
> +               data->current_profile_setting.mclk_down_hyst = 16;
> +               data->current_profile_setting.mclk_activity = 20;
> +       }
>         hwmgr->workload_mask = 1 << hwmgr->workload_prority[PP_SMC_POWER_PROFILE_FULLSCREEN3D];
>         hwmgr->power_profile_mode = PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>         hwmgr->default_power_profile_mode = PP_SMC_POWER_PROFILE_FULLSCREEN3D;
> --
> 2.25.4
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
