Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B82614E9C
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Nov 2022 16:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9A910E3F4;
	Tue,  1 Nov 2022 15:50:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from moc6.cz (hosting.moc6.cz [IPv6:2a02:c60:c70:8900::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC7210E3F4;
 Tue,  1 Nov 2022 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=moc6.cz;
 s=mail20201116; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To;
 bh=1fsBVDnm8hy+DctJMMCqY6Ap6gJHi5gvPoChw6Lc/vI=; b=O4uU7lg6MaJiTlT8a9jo1a6TCG
 xGAheeinRU4BL+6LdBLQWwjxkFxnKn5/MeSGKxrdkWI7SGG0cvs7f7YPFrNgYC5goCdHGqPL8r9B3
 P8J2ko3FXt9Yo06FWd/buMAv9Qw//BuXYW86bmr38KBcwgMfkt+uYWX9YOwiR1W6cg/envmY2JdOB
 ihBgAeJG4wjRCFq267AEwyABt3hEgimqPXvnJpK5WOJlCK6jZJusO5YUdcFGFGy5/fwbBW/mkYVYW
 /ySPAC7GakqNjP44kUDr1sCXKxW5nMdi8JIfpecatl3bOtoauzrHHvvvnQlOiPr0FUhvRwFYGi+lJ
 oYkVjkMD2QXgwn4IQWhDfpEP8uqUggnQWuIeQ8XTSZfjrmlIqP/kvvJ/7TK+xBQGh1BlZbwZTBvEw
 NPfT6ywnOQlkKIR+4Hs5PEdPDCsdm8oG2iClqSHqIqQsQCQl31nW2LvFk1O0CJo5UVuo2PjmNAKZL
 3DyepqrGd0l5iiujlpL/96GzCIRmP8+TozRKZH2VyBL5HfHyc1ymzviCELzZS/aILY8xRcbamWk0I
 h+DBStifvFIe7WukF+ok0aaYkFKAbpyitnkxcC0h8MhzS0grJ5reVmJDW+AOrgv1W/ViPk7/F8046
 J2WtmNcYdz7YTvkDett6EW527lCbl/DWWPuGX1x/c=;
Received: from Debian-exim by moc6.cz with local (Exim 4.94.2)
 (envelope-from <Debian-exim@moc6.cz>) authenticated: Debian-exim
 id 1optPB-00119c-O5; Tue, 01 Nov 2022 16:42:21 +0100
Date: Tue, 1 Nov 2022 16:42:21 +0100
From: Filip Moc <dev@moc6.cz>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amd/display: add parameter backlight_min
Message-ID: <Y2E+XUEPbQn2tMt+@moc6.cz>
References: <Y117XNaSP6/8bH+3@moc6.cz>
 <CADnq5_Muegi+dvmrg5U=Cau_oeXQFjv_h2Pdn_j9AG0mRgE4=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Muegi+dvmrg5U=Cau_oeXQFjv_h2Pdn_j9AG0mRgE4=g@mail.gmail.com>
X-Mailman-Approved-At: Tue, 01 Nov 2022 15:50:13 +0000
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello Alex,

thank you for your response.

Yes, I have HP ENVY x360 Convertible 13-ay1xxx, and backlight_min=2
seems to work the best in my case.

I added a dmi based quirk table. So far with support only for display 0
to make it simple. Support for more displays in quirk table can be added
later if ever needed.

According to [1] HP ENVY x360 Convertible 13-ag0xxx also needs a quirk
so I'm going to use this to cover both:
DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP")
DMI_MATCH(DMI_PRODUCT_NAME, "HP ENVY x360 Convertible 13-")

So far it seems to be working fine.
I'll send this in v2 once I do some final tweaks and do more tests.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=203439#c5

Filip


V Mon, Oct 31, 2022 at 11:36:09AM -0400, Alex Deucher napsal(a):
> On Sun, Oct 30, 2022 at 5:26 AM Filip Moc <dev@moc6.cz> wrote:
> >
> > There are some devices on which amdgpu won't allow user to set brightness
> > to sufficiently low values even though the hardware would support it just
> > fine.
> >
> > This usually happens in two cases when either configuration of brightness
> > levels via ACPI/ATIF is not available and amdgpu falls back to defaults
> > (currently 12 for minimum level) which may be too high for some devices or
> > even the configuration via ATIF is available but the minimum brightness
> > level provided by the manufacturer is set to unreasonably high value.
> >
> > In either case user can use this new module parameter to adjust the
> > minimum allowed backlight brightness level.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439
> > Signed-off-by: Filip Moc <dev@moc6.cz>
> 
> Does your system require an override and if so, what is it?  It would
> be good to add a quirk for your system as well so that other users of
> the same system wouldn't need to manually figure out an apply the
> settings.
> 
> Alex
> 
> 
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
> >  3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 0e6ddf05c23c..c5445402c49d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
> >  extern uint amdgpu_dc_visual_confirm;
> >  extern uint amdgpu_dm_abm_level;
> >  extern int amdgpu_backlight;
> > +#ifdef CONFIG_DRM_AMD_DC
> > +extern int amdgpu_backlight_override_min[];
> > +#endif
> >  extern struct amdgpu_mgpu_info mgpu_info;
> >  extern int amdgpu_ras_enable;
> >  extern uint amdgpu_ras_mask;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 16f6a313335e..f2fb549ac52f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -43,6 +43,7 @@
> >  #include "amdgpu_irq.h"
> >  #include "amdgpu_dma_buf.h"
> >  #include "amdgpu_sched.h"
> > +#include "amdgpu_dm.h"
> >  #include "amdgpu_fdinfo.h"
> >  #include "amdgpu_amdkfd.h"
> >
> > @@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
> >  MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
> >  module_param_named(backlight, amdgpu_backlight, bint, 0444);
> >
> > +/**
> > + * DOC: backlight_min (array of int)
> > + * Override minimum allowed backlight brightness signal (per display).
> > + * Must be less than the maximum brightness signal.
> > + * Negative value means no override.
> > + *
> > + * Defaults to all -1 (no override on any display).
> > + */
> > +#ifdef CONFIG_DRM_AMD_DC
> > +int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
> > +MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
> > +module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
> > +#endif
> > +
> >  /**
> >   * DOC: tmz (int)
> >   * Trusted Memory Zone (TMZ) is a method to protect data being written
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index eb4ce7216104..e2c36ba93d05 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
> >         dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
> >         dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
> >  #endif
> > +
> > +       if (amdgpu_backlight_override_min[bl_idx] >= 0) {
> > +               if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
> > +                       DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
> > +                                 bl_idx,
> > +                                 dm->backlight_caps[bl_idx].min_input_signal,
> > +                                 amdgpu_backlight_override_min[bl_idx]);
> > +                       dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
> > +               } else {
> > +                       DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
> > +                                 bl_idx,
> > +                                 amdgpu_backlight_override_min[bl_idx],
> > +                                 dm->backlight_caps[bl_idx].max_input_signal);
> > +               }
> > +       }
> >  }
> >
> >  static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,
> >
> > base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
> > --
> > 2.30.2
> >
