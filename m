Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6D348303
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Mar 2021 21:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA816EA02;
	Wed, 24 Mar 2021 20:40:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D0F6EA02
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 20:40:10 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so3020981oty.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Mar 2021 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ThWB51AEOBRVrnkph6KhCW2jWuirrstIjNw993I0nds=;
 b=sNalP1+kuKsO0n9Ss1mzySp3qStbiTrOurqM+l8ivK4LI0bAU0faUpsxyW0CP+pC7O
 Mvqy/nsAvAygPYtlf/Blxyo4D4b+REDrju+flzbemjrLlGGBvSrC8faoWvq6G4XH0vFl
 5zZ8W7Al3lcd6ud1t49TmxVJGs3Eh/LqySpOgqIrXiJd4xoNl2B63y69xpKWP+/PrfuY
 K25dw+POApcug0chsPIgJQpaPeUV07kojEhRvRJp0ESaaiW5PNpcXJ85ssfoWHEmIfit
 tlIeo2A99wjd7zrhMYMHm5pRRHDwOJhlwIObROq7hPSd8auV4KtBpIGcm0eySQNHiWSg
 M9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ThWB51AEOBRVrnkph6KhCW2jWuirrstIjNw993I0nds=;
 b=FWNT02TXvRIiRVryVEQrNEMLF0+59yQyciw8qYKqj2AVqwVvs8T/qtJIe/0rrC4XpR
 lN1B5FQDtTMMlXnZ9hae1MsFW3E7KpO/39FLCGlpL5uWNtBEHX2gYLVMPu/6OuiO8W+f
 5a0r5CZkI/GXAEMUymkoo+67PyiRcG9e/0ZhEe3L5McndcJ7TzcZUu+sJbn792+jb0e3
 xDyiAJ0mhGZqoQSPTUFGjcb4yxklG0dbVkLw7P/c2/YZT2Li7z3TRaonzIerHoAiNLjX
 RHZbsWOTJ3FG0Nse8yfjbx0sUCkTNhPFePbGYzY+Gw3jvD4i4Vv8a/xX0ffpYIX8DxuE
 ihXA==
X-Gm-Message-State: AOAM532b2zpgsbKjSK9NsFRP+8mFZduxbWq/QCgB+fOTfJ8XyfZjfMg5
 K04uvmUo3B+1FtcdByxCI6vcHI6AsFA1inXbILI=
X-Google-Smtp-Source: ABdhPJwlWdEx4sRRTw/60BeYw1iAwcxww/qlKaGjts6OVHJhDdo64loyiQly+R+WTXMZ4XL62X7jPVG3ht6Fj1bTO0Q=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr4685378ots.23.1616618409543;
 Wed, 24 Mar 2021 13:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <3eb98a62-12f4-d191-97b8-15e2f8ca06e3@thomaslambertz.de>
In-Reply-To: <3eb98a62-12f4-d191-97b8-15e2f8ca06e3@thomaslambertz.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 24 Mar 2021 16:39:58 -0400
Message-ID: <CADnq5_Oq8nBVuLomgPJm0o054ZTDoeuZSCJNkGe+ZhODDp93eQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: fix dmub invalid register read
To: mail@thomaslambertz.de
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
Cc: Leo Li <sunpeng.li@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 4:18 AM Thomas Lambertz <mail@thomaslambertz.de> wrote:
>
> DMCUB_SCRATCH_0 sometimes contains 0xdeadbeef during initialization.
> If this is detected, return 0 instead. This prevents wrong bit-flags
> from being read.
>
> The main impact of this bug is in the status check loop in
> dmub_srv_wait_for_auto_load. As it is waiting for the device to become
> ready, returning too early leads to a race condition. It is usually won
> on first boot, but lost when laptop resumes from sleep, breaking screen
> brightness control.
>
> This issue was always present, but previously mitigated by the fact that
> the full register was compared to the wanted value. Currently, only the
> bottom two bits are tested, which are also set in 0xdeadbeef, thus
> returning readiness to early.
>
> Fixes: 5fe6b98ae00d ("drm/amd/display: Update dmub code")

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1518

Harry, Leo, Rodrigo, any ideas?

Alex

> Signed-off-by: Thomas Lambertz <mail@thomaslambertz.de>
> ---
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c | 8 +++++++-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h | 2 ++
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
> index 8e8e65fa83c0..d6fcae182f68 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.c
> @@ -323,8 +323,14 @@ uint32_t dmub_dcn20_get_gpint_response(struct dmub_srv *dmub)
>  union dmub_fw_boot_status dmub_dcn20_get_fw_boot_status(struct dmub_srv *dmub)
>  {
>         union dmub_fw_boot_status status;
> +       uint32_t value;
> +
> +       value = REG_READ(DMCUB_SCRATCH0);
> +       if (value == DMCUB_SCRATCH0_INVALID)
> +               status.all = 0;
> +       else
> +               status.all = value;
>
> -       status.all = REG_READ(DMCUB_SCRATCH0);
>         return status;
>  }
>
> diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
> index a62be9c0652e..9557e76cf5d4 100644
> --- a/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
> +++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_dcn20.h
> @@ -154,6 +154,8 @@ struct dmub_srv_common_regs {
>
>  extern const struct dmub_srv_common_regs dmub_srv_dcn20_regs;
>
> +#define DMCUB_SCRATCH0_INVALID 0xdeadbeef
> +
>  /* Hardware functions. */
>
>  void dmub_dcn20_init(struct dmub_srv *dmub);
> --
> 2.31.0
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
