Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723393F8962
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Aug 2021 15:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECAF6E85E;
	Thu, 26 Aug 2021 13:49:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C878A6E5A5
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Aug 2021 09:54:38 +0000 (UTC)
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 807023F322
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Aug 2021 09:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629971677;
 bh=dNIr4YVKEotD2T8xg6atNMHQAeZF9qxmxcqMCPFGE5M=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=vq3kWeAiF4skqc0sGtFPOIelvEwah1TCsjUmRxsVYyVAKXta+vfasdegP6kOn+Fwr
 lwMDxdq5rCxxqmPnDSGJpwQRtvaxJ04MOJ5UxLaMluJlmrKIjBtt+a0OajfNNtwTBw
 ChNCxKVMWqR4QvUWmXRmcZnneKR2iaYwbLSPJzjwdxlrh079HH4Q1pXrCzfDWXBryB
 2wF+nnN5fXv8xerjnqTphC8fXni223sgtwiTfiqD1S1PTZ8Jl9ulZBr57ZRekUhh1d
 9gFvhHnEZGBzKP67/gkzrpQNMIEHv5rsRKpN7QpAlFl06dtyA3oQ0fER0eeWVRtRmN
 NGLHUPvV9hMvw==
Received: by mail-ua1-f72.google.com with SMTP id
 v6-20020ab036a6000000b002b0720c18bdso643379uat.20
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Aug 2021 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dNIr4YVKEotD2T8xg6atNMHQAeZF9qxmxcqMCPFGE5M=;
 b=VcetUQqCgKrrUDnvzV+6HEhi3XvAuC9YUI7R0If9/wKA91XEZALIEhZ6Jq1tRLgw5J
 JgK6utxi8hr5cIeQ1OedFAfM1N0sXrc+bbPPycgQj7pAptZcPO3dcB+57Zk9SPDsOr2u
 zZirvIKUgNl4ikgnSb+mFe3RHibzDLES34Lcq9aElSJLKeJMEwhcbT0102DOHyCbHvjr
 qAzepMY4Ee/5yN2v30P+A4FbiY2oS5dkak9nCYkmz7i1EKDzvFReG84ho6NMD2Z5czUO
 2TzpI4B80O6zU5nnA8fSs9bqtYm3YCFGFs5S/b7sZKf/1vk5F0WYqcqIgKHgTNnxa7AQ
 c5zg==
X-Gm-Message-State: AOAM531L/rpoYddUKcfYGPMmjwos/nbQY24vgjBVfT79JpIbifFEmEyh
 ZnNaAhOpOCKBJtiIOfhdbDMIQL1p6RoitzMK6psBJM/kMpn4G7xOSRanIFuQMIJTW6caBOIAAAK
 f/hD+iEHOHPDWIyf3/S0fHytpMfcK7t3ppjwdOhLB4+OxkjH5WGznRkeLqDU=
X-Received: by 2002:a05:6122:809:: with SMTP id 9mr1543964vkj.4.1629971675866; 
 Thu, 26 Aug 2021 02:54:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcImCz0AAdJ0Hjm9V8vOZJDaQamDliq2wgY1XQr92qYt9I6Ra4/73vSmTTPc9lKGh1RRbzZsofUlD6VuvhLCA=
X-Received: by 2002:a05:6122:809:: with SMTP id 9mr1543957vkj.4.1629971675568; 
 Thu, 26 Aug 2021 02:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210826013523.394705-1-koba.ko@canonical.com>
 <20210826013523.394705-2-koba.ko@canonical.com>
 <b95b0e84-8fbc-bdd9-2079-a2dd84dff70f@amd.com>
 <CAJB-X+UBwqYSgm57B+1hhWJYNYoqwPPQrOP+i+cih+qZ8pn4Gg@mail.gmail.com>
In-Reply-To: <CAJB-X+UBwqYSgm57B+1hhWJYNYoqwPPQrOP+i+cih+qZ8pn4Gg@mail.gmail.com>
From: Koba Ko <koba.ko@canonical.com>
Date: Thu, 26 Aug 2021 17:54:24 +0800
Message-ID: <CAJB-X+VR_au36vPyrph8jEWrkF9zk0Z3kuW-PONTWox=CqTfRQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] drm/amdgpu: Disable PCIE_DPM on Intel RKL Platform
To: "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 26 Aug 2021 13:49:36 +0000
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

On Thu, Aug 26, 2021 at 5:34 PM Koba Ko <koba.ko@canonical.com> wrote:
>
> On Thu, Aug 26, 2021 at 5:07 PM Lazar, Lijo <lijo.lazar@amd.com> wrote:
> >
> >
> >
> > On 8/26/2021 7:05 AM, Koba Ko wrote:
> > > AMD polaris GPUs have an issue about audio noise on RKL platform,
> > > they provide a commit to fix but for SMU7-based GPU still
> > > need another module parameter,
> > >
> > > modprobe amdgpu ppfeaturemask=0xfff7bffb
> > >
> > > to avoid the module parameter, switch PCI_DPM by determining
> > > intel platform in amd drm driver is a better way.
> > >
> > > Fixes: 1a31474cdb48 ("drm/amd/pm: workaround for audio noise issue")
> > > Ref: https://lists.freedesktop.org/archives/amd-gfx/2021-August/067413.html
> > > Signed-off-by: Koba Ko <koba.ko@canonical.com>
> > > ---
> > >   .../gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 15 ++++++++++++++-
> > >   1 file changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > > index 0541bfc81c1b..6ce2a2046457 100644
> > > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
> > > @@ -27,6 +27,7 @@
> > >   #include <linux/pci.h>
> > >   #include <linux/slab.h>
> > >   #include <asm/div64.h> > +#include <asm/intel-family.h>
> >
> > Maybe, include conditionally for X86_64.
> >
> > >   #include <drm/amdgpu_drm.h>
> > >   #include "ppatomctrl.h"
> > >   #include "atombios.h"
> > > @@ -1733,6 +1734,17 @@ static int smu7_disable_dpm_tasks(struct pp_hwmgr *hwmgr)
> > >       return result;
> > >   }
> > >
> > > +static bool intel_core_rkl_chk(void)
> > > +{
> > > +#ifdef CONFIG_X86_64
> >
> > Better to use IS_ENABLED() here.
> >
> > Apart from that, looks fine to me.
> >
> > Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks for the comments.
> I will send v3.

Should I nack v2 after sending v3?
Thanks
> >
> > Thanks,
> > Lijo
> >
> > > +     struct cpuinfo_x86 *c = &cpu_data(0);
> > > +
> > > +     return (c->x86 == 6 && c->x86_model == INTEL_FAM6_ROCKETLAKE);
> > > +#else
> > > +     return false;
> > > +#endif
> > > +}
> > > +
> > >   static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
> > >   {
> > >       struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
> > > @@ -1758,7 +1770,8 @@ static void smu7_init_dpm_defaults(struct pp_hwmgr *hwmgr)
> > >
> > >       data->mclk_dpm_key_disabled = hwmgr->feature_mask & PP_MCLK_DPM_MASK ? false : true;
> > >       data->sclk_dpm_key_disabled = hwmgr->feature_mask & PP_SCLK_DPM_MASK ? false : true;
> > > -     data->pcie_dpm_key_disabled = hwmgr->feature_mask & PP_PCIE_DPM_MASK ? false : true;
> > > +     data->pcie_dpm_key_disabled =
> > > +             intel_core_rkl_chk() || !(hwmgr->feature_mask & PP_PCIE_DPM_MASK);
> > >       /* need to set voltage control types before EVV patching */
> > >       data->voltage_control = SMU7_VOLTAGE_CONTROL_NONE;
> > >       data->vddci_control = SMU7_VOLTAGE_CONTROL_NONE;
> > >
