Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7CA3E2D3C
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Aug 2021 17:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 715776E33F;
	Fri,  6 Aug 2021 15:09:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE756E08C
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Aug 2021 14:30:17 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 23A5DC258D
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Aug 2021 14:30:15 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6E3EF60010;
 Fri,  6 Aug 2021 14:29:52 +0000 (UTC)
Message-ID: <3524e3fb29d40003e59645a9ee5364ac62d34879.camel@hadess.net>
Subject: Re: Power-saving/performance toggles for amdgpu
From: Bastien Nocera <hadess@hadess.net>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Date: Fri, 06 Aug 2021 16:29:51 +0200
In-Reply-To: <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
References: <36ccfc64de628c060a736b8e05ae076246b686fc.camel@hadess.net>
 <CADnq5_NdfbJ9RAqMMxLYfvC70QPyuTQ8ggRZM2uYZAOuQx_vSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Aug 2021 15:09:34 +0000
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

Nearly a year later, hello again, :)

On Mon, 2020-09-14 at 01:46 -0400, Alex Deucher wrote:
> On older radeons (e.g., pre-GCN hardware), there were separate power
> states for battery and AC, but these asics are supported by the radeon
> kernel driver.  None of the hardware supported by amdgpu exposes
> anything like that anymore.  The rest is mainly for profiling and
> debugging.  For more information see the relevant kernel
> documentation:
> https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#gpu-power-thermal-controls-and-monitoring
> I don't think there is anything you'd want to tweak there.

Is the power_dpm_force_performance_level sysfs property for the amdgpu
driver not something that one could tweak?
https://www.kernel.org/doc/html/latest/gpu/amdgpu.html#power-dpm-force-performance-level

System76's own power management daemon changes it:
https://github.com/pop-os/system76-power/blob/master/src/radeon.rs

So I'm wondering whether it would have any effect, for example, I would
expect setting "high" when a performance mode is requested so that
there's little latency in terms of frequency switching, "low" to force
minimal power draw in a power saving mode, and "auto" the rest of the
time.

Cheers

