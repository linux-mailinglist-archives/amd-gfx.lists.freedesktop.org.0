Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD54DDC64
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Mar 2022 16:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E32C10E9D8;
	Fri, 18 Mar 2022 15:06:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E720610E9D8
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Mar 2022 15:06:11 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso10467576ooi.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Mar 2022 08:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OR3tTDRtWYJqdtBS5gkgMwjYTzt3PtVD/TCzwS5B3E=;
 b=P6GyfmqXNrgLS9WdnRanGwu33FltrH4r1jDcHE+8Pm2fMu+V0ZfmQcJEcQJ4Xn0Oh2
 hYp6oCAGTjP+sec69mqyOjyu9h87I0afMtQYY7AFCvStkbogH6y35FjZ8wbsM6uL6tiN
 EO9ppgYqsiPR0FXAAfsRwBuqAK5zzb9yLItEVZR5jI96x92SLjW1rFcVLB8LzbyEeObc
 KTtyYx1w2rAqy8QajRbXZt0GvqvQmgcXnidrH6mTAX3Pj9mSNcRRMrCmPv8OtDXP1HsK
 NBLLv+ykOEZDRaGB55eGGD+H6DWmF3jdw5fml/GBaoOOPYcpfr/mU+4V71PbbHAmPSGk
 5AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OR3tTDRtWYJqdtBS5gkgMwjYTzt3PtVD/TCzwS5B3E=;
 b=LVsJSlSBfN7f9nC6tHmIgd1bErXQF6uiXz4HT/ImxMFaWoIQ3fPtcED1rTHxbLrO+9
 4mKlevtsR/hCZKQ+J7tatdnUcSWMbyHnqDJJL83zCgsGiWACZJo5BYA5NOGdDFQJPzoU
 f3lBXHu6E2lTBms1SclmWsqbXN+u68fH72JZ83cDAeMdnLFC+mtArTZEbHkQoTAilaZ+
 gy3MWHupH8dmuhlO78ZO5QhBKhEPE8qfvEsWTqhAqiDIh4InnhXTjyCxj6AI72OJNs9m
 QqgKwsAMwN5YtouWvyCQrOJbT5UD8fc02lv7Os2/ZmhjOHVGfBhB00PqCNKiz9n/vK3n
 q6RQ==
X-Gm-Message-State: AOAM531OPXjHomZZEjalML4Ifiq7N4DniC8buAfgh31xwsLTaaiLLABp
 NZXHsW51zi1dEYTtP5VRu8UUHCKuqfq+TyeeC+U=
X-Google-Smtp-Source: ABdhPJxeq4SFYPT+zc21L6QpSflRysAOEA4Q2ctuTFK0PU5pgvaGdy23xjOP5wjtk9PpnhxW7e7FKuijutGY7E3iWLc=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr3846119oao.253.1647615971082; Fri, 18
 Mar 2022 08:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <87ee57c8fu.fsf@turner.link>
 <CADnq5_Nr5-FR2zP1ViVsD_ZMiW=UHC1wO8_HEGm26K_EG2KDoA@mail.gmail.com>
 <87czkk1pmt.fsf@dmarc-none.turner.link>
 <BYAPR12MB46140BE09E37244AE129C01A975C9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87sftfqwlx.fsf@dmarc-none.turner.link>
 <BYAPR12MB4614E2CFEDDDEAABBAB986A0975E9@BYAPR12MB4614.namprd12.prod.outlook.com>
 <87ee4wprsx.fsf@turner.link> <4b3ed7f6-d2b6-443c-970e-d963066ebfe3@amd.com>
 <87pmo8r6ob.fsf@turner.link>
 <5a68afe4-1e9e-c683-e06d-30afc2156f14@leemhuis.info>
 <CADnq5_MCKTLOfWKWvi94Q9-d5CGdWBoWVxEYL3YXOpMiPnLOyg@mail.gmail.com>
 <87pmnnpmh5.fsf@dmarc-none.turner.link>
 <CADnq5_NG_dQCYwqHM0umjTMg5Uud6zC4=MiscH91Y9v7mW9bJA@mail.gmail.com>
 <092b825a-10ff-e197-18a1-d3e3a097b0e3@leemhuis.info>
 <877d96to55.fsf@dmarc-none.turner.link>
 <87lexdw8gd.fsf@turner.link>
 <d541b534-8b83-b566-56eb-ea8baa7c998e@leemhuis.info>
 <40b3084a-11b8-0962-4b33-34b56d3a87a3@molgen.mpg.de>
 <bc714e87-d1dc-cdda-5a29-25820faaff40@leemhuis.info>
 <20220318084625.27d42a51.alex.williamson@redhat.com>
In-Reply-To: <20220318084625.27d42a51.alex.williamson@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Mar 2022 11:06:00 -0400
Message-ID: <CADnq5_OE7JpffYggKsu92DAjur1CCSqZQ7LbMqcfmAk68FerDA@mail.gmail.com>
Subject: Re: [REGRESSION] Too-low frequency limit for AMD GPU
 PCI-passed-through to Windows VM
To: Alex Williamson <alex.williamson@redhat.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Lijo Lazar <lijo.lazar@amd.com>,
 kvm@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>, Xinhui Pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 James Turner <linuxkernel.foss@dmarc-none.turner.link>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>,
 regressions@lists.linux.dev
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Mar 18, 2022 at 10:46 AM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Fri, 18 Mar 2022 08:01:31 +0100
> Thorsten Leemhuis <regressions@leemhuis.info> wrote:
>
> > On 18.03.22 06:43, Paul Menzel wrote:
> > >
> > > Am 17.03.22 um 13:54 schrieb Thorsten Leemhuis:
> > >> On 13.03.22 19:33, James Turner wrote:
> > >>>
> > >>>> My understanding at this point is that the root problem is probably
> > >>>> not in the Linux kernel but rather something else (e.g. the machine
> > >>>> firmware or AMD Windows driver) and that the change in f9b7f3703ff9
> > >>>> ("drm/amdgpu/acpi: make ATPX/ATCS structures global (v2)") simply
> > >>>> exposed the underlying problem.
> > >>
> > >> FWIW: that in the end is irrelevant when it comes to the Linux kernel's
> > >> 'no regressions' rule. For details see:
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/admin-guide/reporting-regressions.rst
> > >>
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/process/handling-regressions.rst
> > >>
> > >>
> > >> That being said: sometimes for the greater good it's better to not
> > >> insist on that. And I guess that might be the case here.
> > >
> > > But who decides that?
> >
> > In the end afaics: Linus. But he can't watch each and every discussion,
> > so it partly falls down to people discussing a regression, as they can
> > always decide to get him involved in case they are unhappy with how a
> > regression is handled. That obviously includes me in this case. I simply
> > use my best judgement in such situations. I'm still undecided if that
> > path is appropriate here, that's why I wrote above to see what James
> > would say, as he afaics was the only one that reported this regression.
> >
> > > Running stuff in a virtual machine is not that uncommon.
> >
> > No, it's about passing through a GPU to a VM, which is a lot less common
> > -- and afaics an area where blacklisting GPUs on the host to pass them
> > through is not uncommon (a quick internet search confirmed that, but I
> > might be wrong there).
>
> Right, interference from host drivers and pre-boot environments is
> always a concern with GPU assignment in particular.  AMD GPUs have a
> long history of poor behavior relative to things like PCI secondary bus
> resets which we use to try to get devices to clean, reusable states for
> assignment.  Here a device is being bound to a host driver that
> initiates some sort of power control, unbound from that driver and
> exposed to new drivers far beyond the scope of the kernel's regression
> policy.  Perhaps it's possible to undo such power control when
> unbinding the device, but it's not necessarily a given that such a
> thing is possible for this device without a cold reset.
>
> IMO, it's not fair to restrict the kernel from such advancements.  If
> the use case is within a VM, don't bind host drivers.  It's difficult
> to make promises when dynamically switching between host and userspace
> drivers for devices that don't have functional reset mechanisms.
> Thanks,

Additionally, operating the isolated device in a VM on a constrained
environment like a laptop may have other adverse side effects.  The
driver in the guest would ideally know that this is a laptop and needs
to properly interact with APCI to handle power management on the
device.  If that is not the case, the driver in the guest may end up
running the device out of spec with what the platform supports.  It's
also likely to break suspend and resume, especially on systems which
use S0ix since the firmware will generally only turn off certain power
rails if all of the devices on the rails have been put into the proper
state.  That state may vary depending on the platform requirements.

Alex

>
> Alex
>
