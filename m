Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D99390207
	for <lists+amd-gfx@lfdr.de>; Tue, 25 May 2021 15:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C866E043;
	Tue, 25 May 2021 13:19:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5369D895C4
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 13:18:18 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id y2so42924562ybq.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 May 2021 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFE8UhqQ0J6TfG9b65MRmpHbqQQYga4fO71fp9dguj4=;
 b=EvPFwfJ5GEXCYm0Nq6vjM5AbA98xkSCMJMiK480aWcVejvISFb1PuHgBsF6tKs4fMw
 7kYXoUR4d5oEd3QeuioY2ZXORqjpG5EMLdB2/b6FcDD4HWVlqbyqkSoMbAwbDPdyBnux
 TsJgzFsA6+5gVKyk0v0DuOKiL+4GByIakZgepNrbXk78oTq2Yt/Vs+ppTK6RM8JHR1Se
 sC66jUyJwdoSMvniytf7tJw7XD8J5+Gs35X7iKqgmDD8s3KQeTuMsCFsPOFG8BuDb1dm
 jqWeKhs3di4uOv72xrlenD8M/iM/OiZA5RMWnR9D4/uCeY+qU9i0SzAKiGHcqs1C2MVZ
 jY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFE8UhqQ0J6TfG9b65MRmpHbqQQYga4fO71fp9dguj4=;
 b=o9m37RrFSeuP7GyL/Z2qzGVI6LV6Hgz5qOZIWv/Bg41VzhujR/h7nkusJ8xEqaVrov
 aLQ8rIo40hUNKlE0c4OxJcG4V/J5OEXvNjYQAWsn2f6nJlcC9R8mhpIvsK0nuQn38ea+
 2E4fiiLpIR3S24yxNAKRpChf6UGIjZAi5htxBU/UkRbU7IpjszzCQ5fNW79kfnK4JhoJ
 GxpevMVf+9ClBcrFhJg/SRByOo8IcWBHsS/87qwzGqc4oj/jOMFdpspiQQxUf2lhOO1/
 VG34vfQB6hL4cI23LbDwMrfDeqwrAQUWM/l0GDpFqDhaymeIdfBXlTG1+cho7/57S473
 O3jg==
X-Gm-Message-State: AOAM531LYwp5iPwBVUJBTc5Hg1AKqZUJLpJ1JZSSusoSAa64EE0gfKqT
 RPKY2+ybIuIxJhpAwUDrj3FVJwO0uXoM8/iwZjk=
X-Google-Smtp-Source: ABdhPJx00IKKTHSlR5CG1jP7/pQCwMGYcrpSFiBgiDk/VtlBWPNhSH4SiN71zwmsLd9ppjjqfZfhbplT2OQz2Zr0E1w=
X-Received: by 2002:a5b:3c2:: with SMTP id t2mr40907997ybp.39.1621948697454;
 Tue, 25 May 2021 06:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMdYzYptw9L=5SECtVkNZruTT-x57+03vj0A+5efvq8cESzLyQ@mail.gmail.com>
 <CADnq5_NXmRr_Q7JuWZxJAjmavVkvJjNcWayQ1x8LhfcX5CS0uA@mail.gmail.com>
 <CAMdYzYoamh-igvBbKaLSJ6bSc3wA29=8mooJDLMJkj9YQ=wj0A@mail.gmail.com>
 <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
In-Reply-To: <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 25 May 2021 09:18:06 -0400
Message-ID: <CAMdYzYrq=qUSEQeOywOp_v2voN1B1C2gPFnK6wJx4ASF8bduhw@mail.gmail.com>
Subject: Re: radeon ring 0 test failed on arm64
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Approved-At: Tue, 25 May 2021 13:19:38 +0000
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 9:05 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 25, 2021 at 8:56 AM Peter Geis <pgwipeout@gmail.com> wrote:
> >
> > On Tue, May 25, 2021 at 8:47 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Tue, May 25, 2021 at 8:42 AM Peter Geis <pgwipeout@gmail.com> wrote:
> > > >
> > > > Good Evening,
> > > >
> > > > I am stress testing the pcie controller on the rk3566-quartz64 prototype SBC.
> > > > This device has 1GB available at <0x3 0x00000000> for the PCIe
> > > > controller, which makes a dGPU theoretically possible.
> > > > While attempting to light off a HD7570 card I manage to get a modeset
> > > > console, but ring0 test fails and disables acceleration.
> > > >
> > > > Note, we do not have UEFI, so all PCIe setup is from the Linux kernel.
> > > > Any insight you can provide would be much appreciated.
> > >
> > > Does your platform support PCIe cache coherency with the CPU?  I.e.,
> > > does the CPU allow cache snoops from PCIe devices?  That is required
> > > for the driver to operate.
> >
> > Ah, most likely not.
> > This issue has come up already as the GIC isn't permitted to snoop on
> > the CPUs, so I doubt the PCIe controller can either.
> >
> > Is there no way to work around this or is it dead in the water?
>
> It's required by the pcie spec.  You could potentially work around it
> if you can allocate uncached memory for DMA, but I don't think that is
> possible currently.  Ideally we'd figure out some way to detect if a
> particular platform supports cache snooping or not as well.
>
> Alex

Okay. Considering the RPi crew have similar issues trying to get dGPUs
working on the RPi4, I believe this is unfortunately a common issue on
arm64 consumer devices.
A common test for cache snooping would benefit other subsystems too,
since the GIC-V3 on the rk356x series requires an ugly hack to disable
cache snooping.

Thank you for your time,
Peter

>
>
> >
> > >
> > > Alex
> > >
> > >
> > > >
> > > > Very Respectfully,
> > > > Peter Geis
> > > >
> > > > lspci -v
> > > > 00:00.0 PCI bridge: Fuzhou Rockchip Electronics Co., Ltd Device 3566
> > > > (rev 01) (prog-if 00 [Normal decode])
> > > >         Flags: bus master, fast devsel, latency 0, IRQ 96
> > > >         Bus: primary=00, secondary=01, subordinate=ff, sec-latency=0
> > > >         I/O behind bridge: 00001000-00001fff [size=4K]
> > > >         Memory behind bridge: 00900000-009fffff [size=1M]
> > > >         Prefetchable memory behind bridge:
> > > > 0000000010000000-000000001fffffff [size=256M]
> > > >         Expansion ROM at 300a00000 [virtual] [disabled] [size=64K]
> > > >         Capabilities: [40] Power Management version 3
> > > >         Capabilities: [50] MSI: Enable+ Count=1/32 Maskable- 64bit+
> > > >         Capabilities: [70] Express Root Port (Slot-), MSI 00
> > > >         Capabilities: [b0] MSI-X: Enable- Count=1 Masked-
> > > >         Capabilities: [100] Advanced Error Reporting
> > > >         Capabilities: [148] Secondary PCI Express
> > > >         Capabilities: [160] L1 PM Substates
> > > >         Capabilities: [170] Vendor Specific Information: ID=0002 Rev=4
> > > > Len=100 <?>
> > > >         Kernel driver in use: pcieport
> > > >
> > > > 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
> > > > [AMD/ATI] Turks PRO [Radeon HD 7570] (prog-if 00 [VGA controller])
> > > >         Subsystem: Dell Turks PRO [Radeon HD 7570]
> > > >         Flags: bus master, fast devsel, latency 0, IRQ 95
> > > >         Memory at 310000000 (64-bit, prefetchable) [size=256M]
> > > >         Memory at 300900000 (64-bit, non-prefetchable) [size=128K]
> > > >         I/O ports at 1000 [size=256]
> > > >         Expansion ROM at 300920000 [disabled] [size=128K]
> > > >         Capabilities: [50] Power Management version 3
> > > >         Capabilities: [58] Express Legacy Endpoint, MSI 00
> > > >         Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
> > > >         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1
> > > > Len=010 <?>
> > > >         Capabilities: [150] Advanced Error Reporting
> > > >         Kernel driver in use: radeon
> > > >
> > > > 01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Turks
> > > > HDMI Audio [Radeon HD 6500/6600 / 6700M Series]
> > > >         Subsystem: Dell Turks HDMI Audio [Radeon HD 6500/6600 / 6700M Series]
> > > >         Flags: bus master, fast devsel, latency 0, IRQ 98
> > > >         Memory at 300940000 (64-bit, non-prefetchable) [size=16K]
> > > >         Capabilities: [50] Power Management version 3
> > > >         Capabilities: [58] Express Legacy Endpoint, MSI 00
> > > >         Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > > >         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1
> > > > Len=010 <?>
> > > >         Capabilities: [150] Advanced Error Reporting
> > > >         Kernel driver in use: snd_hda_intel
> > > >
> > > > [    6.431312] rockchip-dw-pcie 3c0000000.pcie: Looking up
> > > > vpcie3v3-supply from device tree
> > > > [    6.434619] rockchip-dw-pcie 3c0000000.pcie: host bridge
> > > > /pcie@fe260000 ranges:
> > > > [    6.435350] rockchip-dw-pcie 3c0000000.pcie: Parsing ranges property...
> > > > [    6.436018] rockchip-dw-pcie 3c0000000.pcie:       IO
> > > > 0x0300800000..0x03008fffff -> 0x0000800000
> > > > [    6.436978] rockchip-dw-pcie 3c0000000.pcie:      MEM
> > > > 0x0300900000..0x033fffffff -> 0x0000900000
> > > > [    6.438065] rockchip-dw-pcie 3c0000000.pcie: got 49 for legacy interrupt
> > > > [    6.439386] rockchip-dw-pcie 3c0000000.pcie: found 5 interrupts
> > > > [    6.439934] rockchip-dw-pcie 3c0000000.pcie: invalid resource
> > > > [    6.440473] rockchip-dw-pcie 3c0000000.pcie: iATU unroll: enabled
> > > > [    6.441029] rockchip-dw-pcie 3c0000000.pcie: Detected iATU regions:
> > > > 8 outbound, 8 inbound
> > > > [    6.650165] rockchip-dw-pcie 3c0000000.pcie: Link up
> > > > [    6.652438] rockchip-dw-pcie 3c0000000.pcie: PCI host bridge to bus 0000:00
> > > > [    6.653142] pci_bus 0000:00: root bus resource [bus 00]
> > > > [    6.653899] pci_bus 0000:00: root bus resource [io  0x0000-0xfffff]
> > > > (bus address [0x800000-0x8fffff])
> > > > [    6.654781] pci_bus 0000:00: root bus resource [mem
> > > > 0x300900000-0x33fffffff] (bus address [0x00900000-0x3fffffff])
> > > > [    6.655782] pci_bus 0000:00: scanning bus
> > > > [    6.656689] pci 0000:00:00.0: disabling Extended Tags (this device
> > > > can't handle them)
> > > > [    6.657605] pci 0000:00:00.0: [1d87:3566] type 01 class 0x060400
> > > > [    6.658418] pci 0000:00:00.0: reg 0x38: [mem 0x00000000-0x0000ffff pref]
> > > > [    6.659923] pci 0000:00:00.0: supports D1 D2
> > > > [    6.660360] pci 0000:00:00.0: PME# supported from D0 D1 D3hot
> > > > [    6.661053] pci 0000:00:00.0: PME# disabled
> > > > [    6.672578] pci_bus 0000:00: fixups for bus
> > > > [    6.673063] pci 0000:00:00.0: scanning [bus 01-ff] behind bridge, pass 0
> > > > [    6.675021] pci_bus 0000:01: busn_res: can not insert [bus 01-ff]
> > > > under [bus 00] (conflicts with (null) [bus 00])
> > > > [    6.675993] pci_bus 0000:01: scanning bus
> > > > [    6.676705] pci 0000:01:00.0: [1002:675d] type 00 class 0x030000
> > > > [    6.677672] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x0fffffff
> > > > 64bit pref]
> > > > [    6.678493] pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x0001ffff 64bit]
> > > > [    6.679217] pci 0000:01:00.0: reg 0x20: initial BAR value 0x00000000 invalid
> > > > [    6.679894] pci 0000:01:00.0: reg 0x20: [io  size 0x0100]
> > > > [    6.680565] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
> > > > [    6.682170] pci 0000:01:00.0: supports D1 D2
> > > > [    6.682897] pci 0000:01:00.0: 2.000 Gb/s available PCIe bandwidth,
> > > > limited by 2.5 GT/s PCIe x1 link at 0000:00:00.0 (capable of 32.000
> > > > Gb/s with 2.5 GT/s PCIe x16 link)
> > > > [    6.686670] pci 0000:01:00.0: vgaarb: VGA device added:
> > > > decodes=io+mem,owns=none,locks=none
> > > > [    6.688367] pci 0000:01:00.1: [1002:aa90] type 00 class 0x040300
> > > > [    6.689168] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
> > > > [    6.691099] pci 0000:01:00.1: supports D1 D2
> > > > [    6.702495] pci_bus 0000:01: fixups for bus
> > > > [    6.702935] pci_bus 0000:01: bus scan returning with max=01
> > > > [    6.703500] pci 0000:00:00.0: scanning [bus 01-ff] behind bridge, pass 1
> > > > [    6.704171] pci_bus 0000:00: bus scan returning with max=ff
> > > > [    6.704768] pci 0000:00:00.0: BAR 15: assigned [mem
> > > > 0x310000000-0x31fffffff 64bit pref]
> > > > [    6.705664] pci 0000:00:00.0: BAR 14: assigned [mem 0x300900000-0x3009fffff]
> > > > [    6.706337] pci 0000:00:00.0: BAR 6: assigned [mem
> > > > 0x300a00000-0x300a0ffff pref]
> > > > [    6.707035] pci 0000:00:00.0: BAR 13: assigned [io  0x1000-0x1fff]
> > > > [    6.707687] pci 0000:01:00.0: BAR 0: assigned [mem
> > > > 0x310000000-0x31fffffff 64bit pref]
> > > > [    6.708522] pci 0000:01:00.0: BAR 2: assigned [mem
> > > > 0x300900000-0x30091ffff 64bit]
> > > > [    6.709411] pci 0000:01:00.0: BAR 6: assigned [mem
> > > > 0x300920000-0x30093ffff pref]
> > > > [    6.710116] pci 0000:01:00.1: BAR 0: assigned [mem
> > > > 0x300940000-0x300943fff 64bit]
> > > > [    6.710897] pci 0000:01:00.0: BAR 4: assigned [io  0x1000-0x10ff]
> > > > [    6.711516] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> > > > [    6.712022] pci 0000:00:00.0:   bridge window [io  0x1000-0x1fff]
> > > > [    6.712617] pci 0000:00:00.0:   bridge window [mem 0x300900000-0x3009fffff]
> > > > [    6.713278] pci 0000:00:00.0:   bridge window [mem
> > > > 0x310000000-0x31fffffff 64bit pref]
> > > > [    6.716165] pcieport 0000:00:00.0: assign IRQ: got 95
> > > > [    6.749839] pcieport 0000:00:00.0: PME: Signaling with IRQ 96
> > > > [    6.751738] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x0 (reading 0x35661d87)
> > > > [    6.752495] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x4 (reading 0x100507)
> > > > [    6.753224] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x8 (reading 0x6040001)
> > > > [    6.754217] pcieport 0000:00:00.0: saving config space at offset
> > > > 0xc (reading 0x10000)
> > > > [    6.754942] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x10 (reading 0x0)
> > > > [    6.755640] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x14 (reading 0x0)
> > > > [    6.756337] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x18 (reading 0xff0100)
> > > > [    6.757073] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x1c (reading 0x20001010)
> > > > [    6.757878] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x20 (reading 0x900090)
> > > > [    6.758614] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x24 (reading 0x1ff11001)
> > > > [    6.759361] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x28 (reading 0x0)
> > > > [    6.760057] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x2c (reading 0x0)
> > > > [    6.760752] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x30 (reading 0x0)
> > > > [    6.761501] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x34 (reading 0x40)
> > > > [    6.762206] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x38 (reading 0x0)
> > > > [    6.762902] pcieport 0000:00:00.0: saving config space at offset
> > > > 0x3c (reading 0x2015f)
> > > > [    6.764350] radeon 0000:01:00.0: assign IRQ: got 95
> > > > [    6.766212] radeon 0000:01:00.0: enabling device (0000 -> 0003)
> > > > [    6.766911] [drm:drm_minor_register]
> > > > [    6.770051] [drm:drm_minor_register] new minor registered 128
> > > > [    6.770606] [drm:drm_minor_register]
> > > > [    6.771958] [drm:drm_minor_register] new minor registered 0
> > > > [    6.772640] [drm] initializing kernel modesetting (TURKS
> > > > 0x1002:0x675D 0x1028:0x2B20 0x00).
> > > > [    7.029251] [drm:radeon_get_bios] ATOMBIOS detected
> > > > [    7.029814] ATOM BIOS: TURKS
> > > > [    7.030100] [drm:atom_allocate_fb_scratch] atom firmware requested
> > > > 00000000 0kb
> > > > [    7.030901] [drm] GPU not posted. posting now...
> > > > [    7.037575] radeon 0000:01:00.0: VRAM: 1024M 0x0000000000000000 -
> > > > 0x000000003FFFFFFF (1024M used)
> > > > [    7.038388] radeon 0000:01:00.0: GTT: 1024M 0x0000000040000000 -
> > > > 0x000000007FFFFFFF
> > > > [    7.039082] [drm] Detected VRAM RAM=1024M, BAR=256M
> > > > [    7.039533] [drm] RAM width 128bits DDR
> > > > [    7.040975] [drm] radeon: 1024M of VRAM memory ready
> > > > [    7.041543] [drm] radeon: 1024M of GTT memory ready.
> > > > [    7.042289] [drm:ni_init_microcode]
> > > > [    7.042639] [drm] Loading TURKS Microcode
> > > > [    7.043047] [drm] Internal thermal controller with fan control
> > > > [    7.059713] [drm] radeon: dpm initialized
> > > > [    7.060375] [drm] GART: num cpu pages 262144, num gpu pages 262144
> > > > [    7.069457] [drm] enabling PCIE gen 2 link speeds, disable with
> > > > radeon.pcie_gen2=0
> > > > [    7.167901] [drm] PCIE GART of 1024M enabled (table at 0x0000000000162000).
> > > > [    7.169257] radeon 0000:01:00.0: WB enabled
> > > > [    7.169770] radeon 0000:01:00.0: fence driver on ring 0 use gpu
> > > > addr 0x0000000040000c00
> > > > [    7.170496] radeon 0000:01:00.0: fence driver on ring 3 use gpu
> > > > addr 0x0000000040000c0c
> > > > [    7.177636] radeon 0000:01:00.0: fence driver on ring 5 use gpu
> > > > addr 0x0000000000072118
> > > > [    7.182365] radeon 0000:01:00.0: radeon: MSI limited to 32-bit
> > > > [    7.184105] radeon 0000:01:00.0: radeon: using MSI.
> > > > [    7.184571] [drm:drm_irq_install] irq=97
> > > > [    7.185619] [drm] radeon: irq initialized.
> > > > [    7.186795] radeon 0000:01:00.0: enabling bus mastering
> > > > [    7.187346] [drm:evergreen_irq_process] evergreen_irq_process
> > > > start: rptr 0, wptr 96
> > > > [    7.188118] [drm:evergreen_irq_process] IH: D1 flip
> > > > [    7.188563] [drm:evergreen_irq_process] IH: D2 flip
> > > > [    7.189006] [drm:evergreen_irq_process] IH: D3 flip
> > > > [    7.189450] [drm:evergreen_irq_process] IH: D4 flip
> > > > [    7.189894] [drm:evergreen_irq_process] IH: D5 flip
> > > > [    7.190337] [drm:evergreen_irq_process] IH: D6 flip
> > > > [    7.190811] [drm:evergreen_irq_process] evergreen_irq_process
> > > > start: rptr 96, wptr 96
> > > > [    7.530753] [drm:r600_ring_test] *ERROR* radeon: ring 0 test failed
> > > > (scratch(0x8504)=0xCAFEDEAD)
> > > > [    7.531564] radeon 0000:01:00.0: disabling GPU acceleration
> > > > [    7.533961] [drm:drm_irq_uninstall] irq=97
> > > > _______________________________________________
> > > > amd-gfx mailing list
> > > > amd-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
