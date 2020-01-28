Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D64F14C1E0
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Jan 2020 22:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE916F413;
	Tue, 28 Jan 2020 21:05:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDCA6F413
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jan 2020 21:05:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q10so17728986wrm.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jan 2020 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E2a2z4l5Pj72KWAkXb5z3qUbAPqTY/6uPF+x99Q7bKo=;
 b=H6RZ3hyi7dk+qfUx6KcLrklFJhW7iDYC2Qj+FulXRGGm0CUZjxvVCOB+xDdzGAqZn8
 JoG/C36ndHLmUYy6oWbOW70IJikdR/FWRtXBZkrnjn2wLioigzUpt9KjA/anbjOVYOsN
 erfKRPf5nAMu62h1rOnzUMQuTsw5xuvgDvIdv0dqs++eg/xxSfIauH4z8XZH0jGMocZJ
 uhI/yKxt//E3ii9YJMc+4+cbqfT8l3BRyJ3Gg2MkQ0fyJgUFXFk1DJFjVlOuZtJUT2zP
 CBz6mm0R9kFipDE67ChuO4fxz+5s5czPWNV3si8+6eNWcPtTZIawy18yIboMKDVY+7e6
 PvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E2a2z4l5Pj72KWAkXb5z3qUbAPqTY/6uPF+x99Q7bKo=;
 b=EnPSzGf942ncT7f+UGRrUgmT2zKBOS/utdfuYsccqy4gTTe/7enXjaddDyKh7EN+RS
 uIzFOsyiJTp5wfNe8CySlZku9o65TDSX0uz8KlxVTFrBeNA/A5wDJCxd+vbMew3Rkmgc
 NugF4n6x+TXVizM266El2VKWjLU/+8yvZE8YK9JxgHR6UlPXN9VE2S+FBnG52KMAhPe2
 UV4QtTEWKcpWoTROMikkGbKcm0kyphOJA7AYr0fLEwuyeU1IwblTRBNDx5UM3qT+TMJn
 Rw5YhBpOnljOqtrUaXJuqjlcAbI9JGcxJ9FJkU9LtbQtljIRm2qsIlrvlQ/ijorwAz7U
 Pbow==
X-Gm-Message-State: APjAAAWb9s7rG0ZiAO0VDXo8yw20VkIgEGlSG3VlM7ufHQavmLSrHJuG
 ei00q7aUQ9SxXbP8v0ZKzxB6DTxLlFH9H0jl6uo=
X-Google-Smtp-Source: APXvYqwzJtvBIjWdaS4DxyZkOHKrpEYOnTc90NCmhDFuI7Nayt8TyG3+t/jxsm8W9XxfjqZQp4rrJ4QV8S4dg1yaR0E=
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr30120726wrp.111.1580245527241; 
 Tue, 28 Jan 2020 13:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20200125183321.2315-1-alexander.deucher@amd.com>
 <3caaa45e-03c4-4e34-61d4-6db90b6d17c8@gmail.com>
In-Reply-To: <3caaa45e-03c4-4e34-61d4-6db90b6d17c8@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jan 2020 16:05:15 -0500
Message-ID: <CADnq5_N8zDd16v+-15V1+UTO2OGr-a8zxvx7=0aZ366HHNeydw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/navi10: add mclk to
 navi10_get_clock_by_type_with_latency
To: Matt Coffin <mcoffin13@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 1:50 PM Matt Coffin <mcoffin13@gmail.com> wrote:
>
> Let me know if I'm not doing this correctly since I'm still new.
>
>
>
> Patch is
>
> Reviewed-by: Matt Coffin <mcoffin13@gmail.com>

Thanks!

Alex

>
> On 1/25/20 11:33 AM, Alex Deucher wrote:
> > Doesn't seem to be used, but add it just in case.
> >
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> > index 015f5ea38901..f60762f9b143 100644
> > --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> > +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> > @@ -1008,6 +1008,8 @@ static int navi10_get_clock_by_type_with_latency(struct smu_context *smu,
> >       case SMU_GFXCLK:
> >       case SMU_DCEFCLK:
> >       case SMU_SOCCLK:
> > +     case SMU_MCLK:
> > +     case SMU_UCLK:
> >               ret = smu_get_dpm_level_count(smu, clk_type, &level_count);
> >               if (ret)
> >                       return ret;
> >
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
