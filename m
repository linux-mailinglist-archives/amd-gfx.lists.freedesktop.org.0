Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF53C3E2D38
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Aug 2021 17:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875846E14C;
	Fri,  6 Aug 2021 15:08:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D607C6E14C
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Aug 2021 15:08:47 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r5so2020484oiw.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 06 Aug 2021 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cbp42HOQbl7cC0jXiqIARBhKht4MLrJWPRlNJ4Qzn2Q=;
 b=kh0XaLO/ML7vGdor7J6L2V4ulGuQ7VzGAiKUjrmRlItlRLD40EfamVX6hRfptd52vS
 URK0bt1B317COjBRytLs28y/MKt49bVj0bLM4MbVTH9/K2Edd7AHh/audKbgYWYuDeDX
 AfjsYdZs/DKIH1N4G2sZ01I6Zd2SVyb7wOSkhzAwWBJdhP/Gu1ym78gNNsFGMs22ZjHp
 Y0B10cX3c5ORcHhfTClCWHYuhoPMTl/FbpwQ4uRx/lniDkuS4CxObcJ1CO+zeet+01R1
 lxM4BcVzeUSLThoDk3S/i56SpQNCQb4ttEys1yZ1HJjMsYm/5uL3tUgswZzQipm8c6UX
 vDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cbp42HOQbl7cC0jXiqIARBhKht4MLrJWPRlNJ4Qzn2Q=;
 b=jtu4XqZjsXQ6P/h+HCglKbtCZNZN7m5SiMF9MsQVVgioSptqxZMLg/a1ElvalxX4S4
 HVcXYE4qoC9O0rdbII992xpquMECD/Dgw0BinrslMinp04OELc06obctc7uzf38pZMUm
 tO5rE4tcaUdyq0JnpaScKJub123y8p0nXtuFOJ/tfcT2x4p50dZphK+PcrgX4h7ay203
 ZnUvUGm+AeHf4qMcLdGOXLzYbrBNi5+I84huuvXaNIq1I32sSigj5Cy2XiQ0Ihh5Oofh
 qK1gaeJh+oTf3WQ/zQp9r36cepthwEK0Sd6h+i33ddpJXetdG0DEHS4DNkIPwNrwOmLY
 nDFg==
X-Gm-Message-State: AOAM5328ZUx2In2CnLhZVvXtDwiqzvdUK72y8hq9Rh7f8wTZNfGK7zuw
 Sl211MCd6QmonJJpPIavZgV967tYMBYezjayHCtLXPLmSGA=
X-Google-Smtp-Source: ABdhPJwfO4AWqAhTu0SGYrpuCFmeC5smpIG/Yu1pxfXy3PXptLsRDL9oToEPMIg7fNVC6Afe+6ElYElDLqb6X3oMo9c=
X-Received: by 2002:a05:6808:6d2:: with SMTP id
 m18mr7688702oih.120.1628262527129; 
 Fri, 06 Aug 2021 08:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
 <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
 <3524e3fb29d40003e59645a9ee5364ac62d34879.camel@hadess.net>
In-Reply-To: <3524e3fb29d40003e59645a9ee5364ac62d34879.camel@hadess.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 Aug 2021 11:08:36 -0400
Message-ID: <CADnq5_ORyFoNHk0Zng_6Ei6NEm557bpdtR6o5zE=3fpBp3qddw@mail.gmail.com>
Subject: Re: Power-saving/performance toggles for amdgpu
To: Bastien Nocera <hadess@hadess.net>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Aug 6, 2021 at 10:29 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> Nearly a year later, hello again, :)
>
> On Mon, 2020-09-14 at 01:46 -0400, Alex Deucher wrote:
> > On older radeons (e.g., pre-GCN hardware), there were separate power
> > states for battery and AC, but these asics are supported by the radeon
> > kernel driver.  None of the hardware supported by amdgpu exposes
> > anything like that anymore.  The rest is mainly for profiling and
> > debugging.  For more information see the relevant kernel
> > documentation:
> > https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#gpu-power-thermal-controls-and-monitoring
> > I don't think there is anything you'd want to tweak there.
>
> Is the power_dpm_force_performance_level sysfs property for the amdgpu
> driver not something that one could tweak?
> https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#power-dpm-force-performance-level
>
> System76's own power management daemon changes it:
> https://github.com/pop-os/system76-power/blob/master/src/radeon.rs
>
> So I'm wondering whether it would have any effect, for example, I would
> expect setting "high" when a performance mode is requested so that
> there's little latency in terms of frequency switching, "low" to force
> minimal power draw in a power saving mode, and "auto" the rest of the
> time.

One could, but it's mainly there for debugging or profiling.  There is
a microcontroller on the GPU that dynamically adjusts the clocks and
voltages at runtime based on GPU load.  It's tuned to do a good job in
as many cases as possible by default.  If you really want to tweak
things, it would probably be better to adjust pp_power_profile_mode.
That has a bunch of preset profiles (or you can specify a custom one)
that adjust the heuristics (how quickly the clocks ramp up/down, etc.)
for the dynamic reclocking done by the GPU.  That said, for most
workloads, I doubt you'll see much of a change.  When the GPU is idle,
clock and power gating kick in for most blocks and we also support
runtime power management so the dGPU will effectively get turned off
if it's idle.  The only tricky part with runtime power management, is
that we can't enable it if the framebuffer console is enabled because
the kernel keeps a persistent kmap of the framebuffer, so we can't
power down the GPU because we never know when an access might come in.
We probably need some sort of deferred IO or shadow framebuffer design
to handle that, but we haven't had time to delve into fixing that.

Alex
