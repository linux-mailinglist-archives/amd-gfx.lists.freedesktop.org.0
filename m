Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0201C3E35
	for <lists+amd-gfx@lfdr.de>; Mon,  4 May 2020 17:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17CF891D7;
	Mon,  4 May 2020 15:11:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13729891D7
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 May 2020 15:11:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g13so21369641wrb.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 04 May 2020 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhEddFOckY/oyASFGIqbcrBsxqXsy8dtWDqMGIw+dSs=;
 b=g5UwV5hPzRyqO9QImAeCet2zZ5DfeoBk39c1lSWAMkrsx7kl09uwPkas4sLCt8sktS
 wFzJjtY0+9VEUBLLLtEqvieghBM31dckVZkon+c/t1gG9JLehj5ZD3vYzYkhXxMBNUCc
 zYh1quwsMKUQLo/730LFOeOjCcdtZ4Y4/JA2+vNjrSutbP/UTarBu56nIaxDfQkdOKvf
 83oNzW6tIMrFBRJBZpopIbKFhRNNKw7v6ZLywdhKLpbI2K6PEDaAJ99FB3gDlxiaeHxS
 Ie384iSOlKwZRuI54fga9I+pNHLSHZ3WHNxqR93xtEN0DtngAOibO4k4YkMuVBXmdP+W
 /avQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhEddFOckY/oyASFGIqbcrBsxqXsy8dtWDqMGIw+dSs=;
 b=R0iLcniHmOZos4EuYx9/LpSsZFIjButLUFQznwdN2/mw27Xq83x9mnrYmaLrZhTPR8
 P8jd0mAGA/VA2zjtVFckKNX3v14l8X8OZa2GDEFRQKzjzZqm2DFEiH7Us/aOVfBK5U6i
 r9rOPqQvkTO1JFuaC/POqPINpneqnxGC5AQsP2TJVhnh35VA8Yw/nafiCdXqQ/ni8Cnr
 /UW7CDvBQR4G7CoW2QlbHF+Dxeq4E/obLQCysj5SVbmDbH3oeP7+pmzpfTpskU6AyX+D
 6LWxLEiL/hkR5xAIBjqeq8rhh1Fr/TWNtGYSvxyxzSP6GDBEEBaJFk/ycIu3gqUMn43G
 r+IQ==
X-Gm-Message-State: AGi0PuaSKCo+mnMgitq471R6Iz2mp1UFG3qTIdHHb/KgJI7tQ0TxKYgs
 kE43POgD0upLnGlPD6cJ3O31u7E+KHPF4S0K7z2gDw==
X-Google-Smtp-Source: APiQypIJ1tjok60siejgSKTFph4Cu/s4GW1xeWuDNQwxxeahrdILnTIR3+iqOYawjaRufX/+VGM2VRGPOLZVx3epwUg=
X-Received: by 2002:adf:ed86:: with SMTP id c6mr6768352wro.124.1588605096655; 
 Mon, 04 May 2020 08:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <8db5ae80-0b9d-7d44-18b6-5641eab0ac0d@FreeBSD.org>
 <CADnq5_NkrG1SDMAEfsVNA11Kn8baMaO4J3EcDzKOsNZCWk6LaA@mail.gmail.com>
 <53cf7e07-817a-116f-6e38-26ddfd480721@FreeBSD.org>
In-Reply-To: <53cf7e07-817a-116f-6e38-26ddfd480721@FreeBSD.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 May 2020 11:11:25 -0400
Message-ID: <CADnq5_NBpCAhF4dSWDgMfRmRDe0RKMF8WNaoxS06P9G71YpYLg@mail.gmail.com>
Subject: Re: amdgpu, dc, backlight brightness
To: Andriy Gapon <avg@freebsd.org>
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

On Mon, May 4, 2020 at 4:02 AM Andriy Gapon <avg@freebsd.org> wrote:
>
> On 29/04/2020 21:15, Alex Deucher wrote:
> > I think it varies from OEM to OEM and whatever windows required at the
> > time.  The sbios may also do different things depending on the osi
> > string passed to ACPI.  Originally, ACPI handled it all directly.
> > Then we got some laptops which which did the whole event via ATIF
> > thing (even that I think varied based on the .  Later, I think the
> > keys just produced brightness events and it was up to the OS to do
> > something with them so the user's environment would catch the events
> > and adjust the backlight via the standard OS backlight control
> > interface.  We never hooked up the ATIF stuff to DC since I don't
> > recall ever running into any laptops that used it for backlight
> > control (the code was carried over from radeon when we forked amdgpu).
>
> Thank you for the information!
> Indeed, I see that there are so many quirks in how brightness keys are handled
> by firmware.  Ranging from actually changing the brightness to posting ACPI
> events to posting key codes.  And then those options are not exclusive of each
> other.
>
> Just in case, I've written a bit of code for ATIF handler to control the
> backlight in the DC case.  I doubt that it is very useful, it was mostly an
> exercise for myself.
>

Care to send it out as a proper patch?  I don't mind applying it on
the off chance there are some laptops out there that might use this
path.

Alex

> ----------------------------------------------------------------------------
> commit ed2ca1d7e3fbdb641d9a1bc2de9b88e2927ff1bd
> Author: Andriy Gapon <avg@FreeBSD.org>
> Date:   Thu Apr 30 14:47:11 2020 +0300
>
>     amdgpu_acpi: perform automatic backlight adjustment in the DC case too
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index 04bbd8f41441c..62fbae1177091 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -444,7 +444,6 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
>
>                 DRM_DEBUG_DRIVER("ATIF: %d pending SBIOS requests\n", count);
>
> -               /* todo: add DC handling */
>                 if ((req.pending & ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST) &&
>                     !amdgpu_device_has_dc_support(adev)) {
>                         struct amdgpu_encoder *enc = atif->encoder_for_bl;
> @@ -463,6 +462,34 @@ static int amdgpu_atif_handler(struct amdgpu_device *adev,
>  #endif
>                         }
>                 }
> +#if defined(CONFIG_BACKLIGHT_CLASS_DEVICE) ||
> defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE)
> +               if ((req.pending & ATIF_PANEL_BRIGHTNESS_CHANGE_REQUEST) &&
> +                   amdgpu_device_has_dc_support(adev)) {
> +                       struct amdgpu_display_manager *dm = &adev->dm;
> +                       struct backlight_device *bd = dm->backlight_dev;
> +
> +                       if (bd) {
> +                               DRM_DEBUG_DRIVER("Changing brightness to %d\n",
> +                                                req.backlight_level);
> +
> +                               /*
> +                                * Newer Linux has
> +                                * backlight_device_set_brightness, but it is
> +                                * hardwired to post BACKLIGHT_UPDATE_SYSFS.
> +                                */
> +                               mutex_lock(&bd->ops_lock);
> +                               if (bd->ops &&
> +                                   req.backlight_level <= bd->props.max_brightness) {
> +                                       bd->props.brightness = req.backlight_level;
> +                                       backlight_update_status(bd);
> +                               }
> +                               mutex_unlock(&bd->ops_lock);
> +#if 0
> +                               backlight_generate_event(bd, BACKLIGHT_UPDATE_HOTKEY);
> +#endif
> +                       }
> +               }
> +#endif
>                 if (req.pending & ATIF_DGPU_DISPLAY_EVENT) {
>                         if ((adev->flags & AMD_IS_PX) &&
>                             amdgpu_atpx_dgpu_req_power_for_displays()) {
>
>
>
> --
> Andriy Gapon
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
