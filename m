Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D703447C838
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Dec 2021 21:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D71112962;
	Tue, 21 Dec 2021 20:29:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A10112957
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Dec 2021 20:29:11 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q25so638720oiw.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Dec 2021 12:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XNJ3MfuUXEjK0F0P95ZwyHEFVKcML2BEV7qHHxf/J80=;
 b=kU18H+qFjsGDPcF2OPBttlRI7r+napJk09JJZY+JT4PsFJiBo556aCtWeEh+jbT1Re
 zb9J/b+Qbgg4YM8Kx7mrwSr//Z8S2faJMCRh1sz9H7qX7xGrU0A5J6aVK8Y7NiSCIgUL
 lw3Q3jhvor1cAQDCa7tdbEIU/5+cX0MCjXisoQC/YbweEx1jryzGe0l4/CWta/sqXeEM
 G6/sXAjtdpE1f8zd8BjiibmZ3vLbjs6S9vCtV1RuBQP3TpKqkuPVhrFiRbnFS+UGTda2
 cXx5o9AcIHzdaDU5Cbtx48JJrLiqd28haEnrutdrztKUis6qurP1PPH7+bU8BuHIp6R1
 +Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XNJ3MfuUXEjK0F0P95ZwyHEFVKcML2BEV7qHHxf/J80=;
 b=jHOX7EB78Vm0bHIynpEFwK4yd7l9hkdqm4uJMG0gaVC+fVs/QoYzwu4jFBmJTiuYhD
 0NQBH8b/PhAKCjzB4I5hBOJVrhr+HU/lDdKxa4mJ50iLgv+PMRocKufDVCxORNETKZDt
 IFZiWvzGn2AkcZGS9bHmEjkkjr+zsF+4Rro35A2CViIzGhHiqoLBHj5BX9BwOkooSwRA
 +3cB3jCHmjdlz5MehDZ7+Dup5CuJe+dtmjm5+eLXf2hM25fGYeCcO0EshJV1aVUjcjTm
 QgUqbJLs0Wlvf4fNyPvSgzQRA2rV3kH4gaWXwGqS7Pk+YWEsCEFDc/GUwDHKxzsJ9yox
 YZPw==
X-Gm-Message-State: AOAM531reK6LLAbz/VghOvdp9JFe1pNTUjCKwH8crOSg7PpJxY/uU53R
 zFeKXRmVOwlkpRcI282TPJaohxpbuFKQQ5wbMHQ=
X-Google-Smtp-Source: ABdhPJxTZy/vWVKDs3GEzDIv5Hx8Ni7k8+Q9oPypsaHhWDDYlkEg0+5DM67/3oRtHF3nm31eF8tXP95dLdLPZku+qrc=
X-Received: by 2002:a05:6808:44:: with SMTP id v4mr95478oic.123.1640118550907; 
 Tue, 21 Dec 2021 12:29:10 -0800 (PST)
MIME-Version: 1.0
References: <909640d5-d2e2-6e03-2bb0-1aca9877cb79@gmail.com>
 <1391457040.91074677.1639932075125.JavaMail.root@zimbra39-e7>
In-Reply-To: <1391457040.91074677.1639932075125.JavaMail.root@zimbra39-e7>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 21 Dec 2021 15:28:59 -0500
Message-ID: <CADnq5_PpnoGCxSO95+mEkcXuR7umWU-hTtUQh2G8q5xPNzPzrg@mail.gmail.com>
Subject: Re: Various problems trying to vga-passthrough a Renoir iGPU to a
 xen/qubes-os hvm
To: Yann Dirson <ydirson@free.fr>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Dec 19, 2021 at 11:41 AM Yann Dirson <ydirson@free.fr> wrote:
>
> Christian wrote:
> > Am 19.12.21 um 17:00 schrieb Yann Dirson:
> > > Alex wrote:
> > >> Thinking about this more, I think the problem might be related to
> > >> CPU
> > >> access to "VRAM".  APUs don't have dedicated VRAM, they use a
> > >> reserved
> > >> carve out region at the top of system memory.  For CPU access to
> > >> this
> > >> memory, we kmap the physical address of the carve out region of
> > >> system
> > >> memory.  You'll need to make sure that region is accessible to the
> > >> guest.
> > > So basically, the non-virt flow is is: (video?) BIOS reserves
> > > memory, marks it
> > > as reserved in e820, stores the physaddr somewhere, which the GPU
> > > driver gets.
> > > Since I suppose this includes the framebuffer, this probably has to
> > > occur around
> > > the moment the driver calls
> > > drm_aperture_remove_conflicting_pci_framebuffers()
> > > (which happens before this hw init step), right ?
> >
> > Well, that partially correct. The efifb is using the PCIe resources
> > to
> > access the framebuffer and as far as I know we use that one to kick
> > it out.
> >
> > The stolen memory we get over e820/registers is separate to that.
> >
> > > ... which brings me to a point that's been puzzling me for some
> > > time, which is
> > > that as the hw init fails, the efifb driver is still using the
> > > framebuffer.
> >
> > No, it isn't. You are probably just still seeing the same screen.
> >
> > The issue is most likely that while efi was kicked out nobody
> > re-programmed the display hardware to show something different.
> >
> > > Am I right in suspecting that efifb should get stripped of its
> > > ownership of the
> > > fb aperture first, and that if I don't get a black screen on
> > > hw_init failure
> > > that issue should be the first focus point ?
> >
> > You assumption with the black screen is incorrect. Since the hardware
> > works independent even if you kick out efi you still have the same
> > screen content, you just can't update it anymore.
>
> It's not only that the screen keeps its contents, it's that the dom0
> happily continues updating it.

If the hypevisor is using efifb, then yes that could be a problem as
the hypervisor could be writing to the efifb resources which ends up
writing to the same physical memory.  That applies to any GPU on a
UEFI system.  You'll need to make sure efifb is not in use in the
hypervisor.

Alex


>
> > But putting efi asside what Alex pointed out pretty much breaks your
> > neck trying to forward the device. You maybe could try to hack the
> > driver to use the PCIe BAR for framebuffer access, but that might be
> > quite a bit slower.
> >
> > Regards,
> > Christian.
> >
> > >
> > >> Alex
> > >>
> > >> On Mon, Dec 13, 2021 at 3:29 PM Alex Deucher
> > >> <alexdeucher@gmail.com>
> > >> wrote:
> > >>> On Sun, Dec 12, 2021 at 5:19 PM Yann Dirson <ydirson@free.fr>
> > >>> wrote:
> > >>>> Alex wrote:
> > >>>>> On Mon, Dec 6, 2021 at 4:36 PM Yann Dirson <ydirson@free.fr>
> > >>>>> wrote:
> > >>>>>> Hi Alex,
> > >>>>>>
> > >>>>>>> We have not validated virtualization of our integrated
> > >>>>>>> GPUs.  I
> > >>>>>>> don't
> > >>>>>>> know that it will work at all.  We had done a bit of
> > >>>>>>> testing but
> > >>>>>>> ran
> > >>>>>>> into the same issues with the PSP, but never had a chance
> > >>>>>>> to
> > >>>>>>> debug
> > >>>>>>> further because this feature is not productized.
> > >>>>>> ...
> > >>>>>>> You need a functional PSP to get the GPU driver up and
> > >>>>>>> running.
> > >>>>>> Ah, thanks for the hint :)
> > >>>>>>
> > >>>>>> I guess that if I want to have any chance to get the PSP
> > >>>>>> working
> > >>>>>> I'm
> > >>>>>> going to need more details on it.  A quick search some time
> > >>>>>> ago
> > >>>>>> mostly
> > >>>>>> brought reverse-engineering work, rather than official AMD
> > >>>>>> doc.
> > >>>>>>   Are
> > >>>>>> there some AMD resources I missed ?
> > >>>>> The driver code is pretty much it.
> > >>>> Let's try to shed some more light on how things work, taking as
> > >>>> excuse
> > >>>> psp_v12_0_ring_create().
> > >>>>
> > >>>> First, register access through [RW]REG32_SOC15() is implemented
> > >>>> in
> > >>>> terms of __[RW]REG32_SOC15_RLC__(), which is basically a
> > >>>> [RW]REG32(),
> > >>>> except it has to be more complex in the SR-IOV case.
> > >>>> Has the RLC anything to do with SR-IOV ?
> > >>> When running the driver on a SR-IOV virtual function (VF), some
> > >>> registers are not available directly via the VF's MMIO aperture
> > >>> so
> > >>> they need to go through the RLC.  For bare metal or passthrough
> > >>> this
> > >>> is not relevant.
> > >>>
> > >>>> It accesses registers in the MMIO range of the MP0 IP, and the
> > >>>> "MP0"
> > >>>> name correlates highly with MMIO accesses in PSP-handling code.
> > >>>> Is "MP0" another name for PSP (and "MP1" for SMU) ?  The MP0
> > >>>> version
> > >>> Yes.
> > >>>
> > >>>> reported at v11.0.3 by discovery seems to contradict the use of
> > >>>> v12.0
> > >>>> for RENOIR as set by soc15_set_ip_blocks(), or do I miss
> > >>>> something ?
> > >>> Typo in the ip discovery table on renoir.
> > >>>
> > >>>> More generally (and mostly out of curiosity while we're at it),
> > >>>> do we
> > >>>> have a way to match IPs listed at discovery time with the ones
> > >>>> used
> > >>>> in the driver ?
> > >>> In general, barring typos, the code is shared at the major
> > >>> version
> > >>> level.  The actual code may or may not need changes to handle
> > >>> minor
> > >>> revision changes in an IP.  The driver maps the IP versions from
> > >>> the
> > >>> ip discovery table to the code contained in the driver.
> > >>>
> > >>>> ---
> > >>>>
> > >>>> As for the register names, maybe we could have a short
> > >>>> explanation of
> > >>>> how they are structured ?  Eg. mmMP0_SMN_C2PMSG_69: that seems
> > >>>> to
> > >>>> be
> > >>>> a MMIO register named "C2PMSG_69" in the "MP0" IP, but I'm not
> > >>>> sure
> > >>>> of the "SMN" part -- that could refer to the "System Management
> > >>>> Network",
> > >>>> described in [0] as an internal bus.  Are we accessing this
> > >>>> register
> > >>>> through this SMN ?
> > >>> These registers are just mailboxes for the PSP firmware.  All of
> > >>> the
> > >>> C2PMSG registers functionality is defined by the PSP firmware.
> > >>>   They
> > >>> are basically scratch registers used to communicate between the
> > >>> driver
> > >>> and the PSP firmware.
> > >>>
> > >>>>
> > >>>>>   On APUs, the PSP is shared with
> > >>>>> the CPU and the rest of the platform.  The GPU driver just
> > >>>>> interacts
> > >>>>> with it for a few specific tasks:
> > >>>>> 1. Loading Trusted Applications (e.g., trusted firmware
> > >>>>> applications
> > >>>>> that run on the PSP for specific functionality, e.g., HDCP and
> > >>>>> content
> > >>>>> protection, etc.)
> > >>>>> 2. Validating and loading firmware for other engines on the
> > >>>>> SoC.
> > >>>>>   This
> > >>>>> is required to use those engines.
> > >>>> Trying to understand in more details how we start the PSP up, I
> > >>>> noticed
> > >>>> that psp_v12_0 has support for loading a sOS firmware, but never
> > >>>> calls
> > >>>> init_sos_microcode() - and anyway there is no sos firmware for
> > >>>> renoir
> > >>>> and green_sardine, which seem to be the only ASICs with this PSP
> > >>>> version.
> > >>>> Is it something that's just not been completely wired up yet ?
> > >>> On APUs, the PSP is shared with the CPU so the PSP firmware is
> > >>> part
> > >>> of
> > >>> the sbios image.  The driver doesn't load it.  We only load it on
> > >>> dGPUs where the driver is responsible for the chip
> > >>> initialization.
> > >>>
> > >>>> That also rings a bell, that we have nothing about Secure OS in
> > >>>> the doc
> > >>>> yet (not even the acronym in the glossary).
> > >>>>
> > >>>>
> > >>>>> I'm not too familiar with the PSP's path to memory from the GPU
> > >>>>> perspective.  IIRC, most memory used by the PSP goes through
> > >>>>> carve
> > >>>>> out
> > >>>>> "vram" on APUs so it should work, but I would double check if
> > >>>>> there
> > >>>>> are any system memory allocations that used to interact with
> > >>>>> the PSP
> > >>>>> and see if changing them to vram helps.  It does work with the
> > >>>>> IOMMU
> > >>>>> enabled on bare metal, so it should work in passthrough as well
> > >>>>> in
> > >>>>> theory.
> > >>>> I can see a single case in the PSP code where GTT is used
> > >>>> instead
> > >>>> of
> > >>>> vram: to create fw_pri_bo when SR-IOV is not used (and there has
> > >>>> to be a reason, since the SR-IOV code path does use vram).
> > >>>> Changing it to vram does not make a difference, but then the
> > >>>> only bo that seems to be used at that point is the one for the
> > >>>> psp ring,
> > >>>> which is allocated in vram, so I'm not too much surprised.
> > >>>>
> > >>>> Maybe I should double-check bo_create calls to hunt for more ?
> > >>> We looked into this a bit ourselves and ran into the same issues.
> > >>> We'd probably need to debug this with the PSP team to make
> > >>> further
> > >>> progress, but this was not productized so neither team had the
> > >>> resources to delve further.
> > >>>
> > >>> Alex
> > >>>
> > >>>>
> > >>>> [0]
> > >>>> https://github.com/PSPReverse/psp-docs/blob/master/masterthesis-eichner-psp-2020.pdf
> >
> >
