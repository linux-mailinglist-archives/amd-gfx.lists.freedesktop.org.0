Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DFB5B238F
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Sep 2022 18:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEB610EB58;
	Thu,  8 Sep 2022 16:25:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA50310EB58
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Sep 2022 16:25:53 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12803ac8113so12459434fac.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Sep 2022 09:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=1+fbCb5TCHjW5euJ2pWSZOa7Ws6PUwS1tRSP+1OpkX4=;
 b=UBIIZrFGPJ9F18thH76FI9/5P45Ell7h7XuYAZzI2nDWts6fC37pFjHb9PjW0Ek+iV
 0VrSK+Ebbc8wPivVKbFWTdc6GYmvHVQUkBY0qcHhN6gdI6Dkyq5Fctn8FiqSmgyn+X3Q
 9Qal9YnSa5GDS6TVqT0Sh4XCvAew3MO64cHmjrkXE4Jg+6Ht65NWKRXTz6iQZX7/X8LC
 KpAJuXHgym9IkKVSOSIvuFoFqeXrgCfo4WNx9Ot3/X2v08g5in7gQ+lJHxRq9U3p6c/9
 LFAevt6L97zrlTza3iNTJQb0JUmz/CPH8JFZ+h0L2k8NDtD68GlwoQc6FvG0tKasNzNd
 Rjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1+fbCb5TCHjW5euJ2pWSZOa7Ws6PUwS1tRSP+1OpkX4=;
 b=xzlkYxeReR9j5HhB0/COtTyz56BzQjFjtCf97+1QI8rzhmVk3+8mKYDLjSdWlC4/zs
 58wCQekFSpL/Vihxwe8EMp/gX9sy9Ai40cyf+Sx57XlbDHzqpj9/gnzs6vVwlxXIBGsb
 2a5ErObatskK5BR52MB4YuTAXqxLEPF/AGpIvPuJH95RjtSONq4Oqn2Zc7e9/AfhwznZ
 b1vQNYiHp0Tr2yoYEWKw0noA1OtO7yTwuRCtjaYAXNLgYARCYBt1ECzGvRqpXA7cZOSK
 KvWlO7OdJVDaxYdeF9xHir5OGQ9EgNrAagWjni1S9O8GImME8vIgp0gCDttT8+9zNlS9
 oQEA==
X-Gm-Message-State: ACgBeo0FiqeYy/FMZsQPx+uqTgoERejsvBcMuPxjbhSnL6MRHKn8AmzE
 7MPohkK/YLAIpNOMpghoUvvVRFbJbQxOoCrTUtE=
X-Google-Smtp-Source: AA6agR4in1MMwSHxv7PzToj4IGrDaMK/BKC/4s/odCgpu3GtNArfdkAOWo7qheaYtpk+c5zo4VCqXEe9iPRSsNe0F4Q=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr2421511oam.96.1662654352991; Thu, 08
 Sep 2022 09:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220908032344.1682187-1-lijo.lazar@amd.com>
 <20220908161152.GA200598@bhelgaas>
In-Reply-To: <20220908161152.GA200598@bhelgaas>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 8 Sep 2022 12:25:41 -0400
Message-ID: <CADnq5_O-apd-22NRT3VGcAeEQeimuywSsMynCAxTNDUbqfVxRQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Don't enable LTR if not supported
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 wielkiegie@gmail.com, stable@vger.kernel.org, Alexander.Deucher@amd.com,
 Evan Quan <evan.quan@amd.com>, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Sep 8, 2022 at 12:12 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> [+cc Evan, author of 62f8f5c3bfc2 ("drm/amdgpu: enable ASPM support
> for PCIE 7.4.0/7.6.0")]
>
> On Thu, Sep 08, 2022 at 08:53:44AM +0530, Lijo Lazar wrote:
> > As per PCIE Base Spec r4.0 Section 6.18
> > 'Software must not enable LTR in an Endpoint unless the Root Complex
> > and all intermediate Switches indicate support for LTR.'
> >
> > This fixes the Unsupported Request error reported through AER during
> > ASPM enablement.
> >
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=216455
> >
> > The error was unnoticed before and got visible because of the commit
> > referenced below. This doesn't fix anything in the commit below, rather
> > fixes the issue in amdgpu exposed by the commit. The reference is only
> > to associate this commit with below one so that both go together.
> >
> > Fixes: 8795e182b02d ("PCI/portdrv: Don't disable AER reporting in get_port_device_capability()")
> >
> > Reported-by: Gustaw Smolarczyk <wielkiegie@gmail.com>
> > Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c | 9 ++++++++-
> >  drivers/gpu/drm/amd/amdgpu/nbio_v6_1.c | 9 ++++++++-
> >  drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 9 ++++++++-
>
> nbio_v4_3_program_ltr() checks pdev->ltr_path itself instead of doing
> it in *_program_aspm().  It'd be nice to use the same approach for all
> versions.
>
> I really don't like the fact that amdgpu does all this ASPM fiddling
> in the driver in the first place.  ASPM should be configured by the
> PCI core, not by each individual driver.  ASPM has all sorts of
> requirements that relate to upstream devices, which I think amdgpu
> ignores, but the core pays attention to.
>
> Do you know why the driver configures ASPM itself?  If the PCI core is
> doing something wrong (and I'm sure it is, ASPM support is kind of a
> mess), I'd much prefer to fix up the core where *all* drivers can
> benefit from it.

This is the programming sequence we get from our hardware team and it
is used on both windows and Linux.  As far as I understand it windows
doesn't handle this in the core, it's up to the individual drivers to
enable it.  I'm not familiar with how this should be enabled
generically, but at least for our hardware, it seems to have some
variation compared to what is done in the PCI core due to stability,
etc. It seems to me that this may need asic specific implementations
for a lot of hardware depending on the required programming sequences.
E.g., various asics may need hardware workaround for bugs or platform
issues, etc.  I can ask for more details from our hardware team.

Alex

>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> > index b465baa26762..aa761ff3a5fa 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> > @@ -380,6 +380,7 @@ static void nbio_v2_3_enable_aspm(struct amdgpu_device *adev,
> >               WREG32_PCIE(smnPCIE_LC_CNTL, data);
> >  }
> >
> > +#ifdef CONFIG_PCIEASPM
> >  static void nbio_v2_3_program_ltr(struct amdgpu_device *adev)
> >  {
> >       uint32_t def, data;
> > @@ -401,9 +402,11 @@ static void nbio_v2_3_program_ltr(struct amdgpu_device *adev)
> >       if (def != data)
> >               WREG32_PCIE(smnBIF_CFG_DEV0_EPF0_DEVICE_CNTL2, data);
> >  }
> > +#endif
> >
> >  static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
> >  {
> > +#ifdef CONFIG_PCIEASPM
> >       uint32_t def, data;
> >
> >       def = data = RREG32_PCIE(smnPCIE_LC_CNTL);
> > @@ -459,7 +462,10 @@ static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
> >       if (def != data)
> >               WREG32_PCIE(smnPCIE_LC_CNTL6, data);
> >
> > -     nbio_v2_3_program_ltr(adev);
> > +     /* Don't bother about LTR if LTR is not enabled
> > +      * in the path */
> > +     if (adev->pdev->ltr_path)
> > +             nbio_v2_3_program_ltr(adev);
> >
> >       def = data = RREG32_SOC15(NBIO, 0, mmRCC_BIF_STRAP3);
> >       data |= 0x5DE0 << RCC_BIF_STRAP3__STRAP_VLINK_ASPM_IDLE_TIMER__SHIFT;
> > @@ -483,6 +489,7 @@ static void nbio_v2_3_program_aspm(struct amdgpu_device *adev)
> >       data &= ~PCIE_LC_CNTL3__LC_DSC_DONT_ENTER_L23_AFTER_PME_ACK_MASK;
> >       if (def != data)
> >               WREG32_PCIE(smnPCIE_LC_CNTL3, data);
> > +#endif
> >  }
