Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B96D33F7523
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Aug 2021 14:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0BF6E209;
	Wed, 25 Aug 2021 12:34:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDD26E1A3
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 10:08:50 +0000 (UTC)
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2B92D40763
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629886128;
 bh=p4WRDyPgyM0cpJuOad4k1lt81zvr80KEwBbO+rMLL8E=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=NWTgRRGnins22xhWwL49LxmmAbtLIb91l6Dm0t8XqQGzqTo3DW6YeuC2/PAHeASm2
 IQv9tz3xWWfFn1G/YwQkl3utjmfVybb5C06UQxov+LR1LD2XkSO41UucUvLoIr8YuR
 +85VqyLIa0q8sWGiq02qFchuzsPBz+SmtsgU1Zh7+U+GKL9ArOE4dZcWDaEoxI+/3W
 CXWjC+pZKBya+K3/IGNrtRl7o0hO0qLCpsM0qhYoYWsEovr1LSZHifKlUP7odo0YGh
 soLaFJsrXgnwaBBkzhWVw2p6EVCbH7ej67+X11plTV9bYKYfKVNPVvvgbMHdMr67dN
 FuEnEnLW/4Zhg==
Received: by mail-vs1-f69.google.com with SMTP id
 z30-20020a67d29e000000b002c35475ec63so3146383vsi.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Aug 2021 03:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p4WRDyPgyM0cpJuOad4k1lt81zvr80KEwBbO+rMLL8E=;
 b=I9xf1zN9NsjU/RptuUCNRKgVh5q5hg0u4FunRG4K6KgWc3zmAX+RY0V2PaSo/MNeCp
 RBCAljYG0Hku6BpxBbGzKlRT43gIa9Ya+EiCgXQhAfsq7DE9JRhEJ6h+DpzP5jr788bK
 E2m7z1TaQlXduhXIIXqj/7tAgVzLLgmNXbWq3KdUGQAejXaAcaqfLJSyDUrfNt+o2ESl
 QasF75iQkNMPS/TCCNfh37odtMXyCv25OOtpiaNqMgt8aM3ifTeNdRNHrnQWacEK+ti0
 01K5+mi4p4vxRjzJlsga+EKUcGnbCTuRUbbKDa9SxfSl9Ht/R4CCQE34u4kUzD/v+u+V
 SPFg==
X-Gm-Message-State: AOAM532E7nOjLB4HoRLjWlTa++jDT8TOzho7UMx0GVddeUYbmP5VS6LX
 BpkowPDNm3r5Jkc+qrRh5jC0O6tvTDc1XFw046Aa4ENhrPDRTFoWPwfkqo+hVJ6jM1st4XUB7K2
 +NOcZyn8BXv4giCkcDRJbAnyUbztc0aD1CVQjb3gTXn1npoKBbxEQ70IVHac=
X-Received: by 2002:a05:6102:2150:: with SMTP id
 h16mr14150366vsg.28.1629886127042; 
 Wed, 25 Aug 2021 03:08:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy8Wqe9FklXqblDInmkUSt7WP/BWubQBg381Ns7QWeMa6HtYfXjnUgour+26+Mdjay/XbOErsZMqreHKZN6dg=
X-Received: by 2002:a05:6102:2150:: with SMTP id
 h16mr14150360vsg.28.1629886126607; 
 Wed, 25 Aug 2021 03:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210825043522.346512-1-koba.ko@canonical.com>
 <20210825043522.346512-2-koba.ko@canonical.com> <87y28pev59.fsf@intel.com>
In-Reply-To: <87y28pev59.fsf@intel.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Wed, 25 Aug 2021 18:08:35 +0800
Message-ID: <CAJB-X+X2Vbj9bAj98yxfAhi2-LMk0=_Hq=b1-1o5iOykQRj5fQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Aug 2021 12:34:20 +0000
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

On Wed, Aug 25, 2021 at 5:22 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Wed, 25 Aug 2021, Koba Ko <koba.ko@canonical.com> wrote:
> > AMD polaris GPUs have an issue about audio noise on RKL platform,
> > they provide a commit to fix but for SMU7-based GPU still
> > need another module parameter,
> >
> > For avoiding the module parameter, switch PCI_DPM by determining
> > intel platform in amd drm driver.
>
> I'll just note that you could have a Tiger Lake PCH combined with a
> number of platforms other than Rocket Lake, including not just the
> obvious Tiger Lake but also Sky Lake, Kaby Lake, Coffee Lake, and Comet
> Lake.
>
> Again, I don't know what the root cause or fix should be, the workaround
> presented here impacts a much larger number of platforms than where
> you're claiming the issue is.

Hi Jani, thanks for your feedback.
Is there any way to identify the RKL PCH?
I trace the intel_pch.c and can't find the only pch id for RKL.

INTEL_PCH_TGP_DEVICE_ID_TYPE is used by both TGL and RKL.

so it seems that using IS_ROCKETLAKE() is the only way.

Thanks
>
> BR,
> Jani.
>
>
> >
> > Fixes: 1a31474cdb48 ("drm/amd/pm: workaround for audio noise issue")
> > Ref: https://lists.freedesktop.org/archives/amd-gfx/2021-August/067413.html
> > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > ---
> >  .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 21 ++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > index 0541bfc81c1b..346110dd0f51 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > @@ -1733,6 +1733,25 @@ static int smu7_disable_dpm_tasks(struct pp_hwmgr *hwmgr)
> >       return result;
> >  }
> >
> > +#include <drm/intel_pch.h>
> > +
> > +static bool intel_tgp_chk(void)
> > +{
> > +     struct pci_dev *pch = NULL;
> > +     unsigned short id;
> > +
> > +     while ((pch = pci_get_class(PCI_CLASS_BRIDGE_ISA << 8, pch))) {
> > +             if (pch->vendor != PCI_VENDOR_ID_INTEL)
> > +                     continue;
> > +
> > +             id = pch->device & INTEL_PCH_DEVICE_ID_MASK;
> > +             if (id == INTEL_PCH_TGP_DEVICE_ID_TYPE || INTEL_PCH_TGP2_DEVICE_ID_TYPE)
>
> PS. This is always true. ;)

got, thanks

>
> > +                     return true;
> > +     }
> > +
> > +     return false;
> > +}
> > +
> >  static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
> >  {
> >       struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
> > @@ -1758,7 +1777,7 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
> >
> >       data->mclk_dpm_key_disabled = hwmgr->feature_mask & PP_MCLK_DPM_MASK ? false : true;
> >       data->sclk_dpm_key_disabled = hwmgr->feature_mask & PP_SCLK_DPM_MASK ? false : true;
> > -     data->pcie_dpm_key_disabled = hwmgr->feature_mask & PP_PCIE_DPM_MASK ? false : true;
> > +     data->pcie_dpm_key_disabled = intel_tgp_chk() || !(hwmgr->feature_mask & PP_PCIE_DPM_MASK);
> >       /* need to set voltage control types before EVV patching */
> >       data->voltage_control = SMU7_VOLTAGE_CONTROL_NONE;
> >       data->vddci_control = SMU7_VOLTAGE_CONTROL_NONE;
>
> --
> Jani Nikula, Intel Open Source Graphics Center
