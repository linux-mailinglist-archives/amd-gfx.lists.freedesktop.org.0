Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 248F646A5E9
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Dec 2021 20:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9927376C;
	Mon,  6 Dec 2021 19:46:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1496E7370C
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Dec 2021 19:46:04 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so15017927otl.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Dec 2021 11:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=23TP7z0yw1UEixzb/JxUCtamkArxbSGCCOSLNRnlaVY=;
 b=FOiR4WtVYRCjv/ctikr+qOP34V2O2jtPw9X1OvlpbTRcFB//7UUqgG4JKffvhXwqMc
 yKEZgrQdaWA3PYBk6SVzmyPubO3DgTHArRtfoQUu+5mivE/MCuWX9jNOmNSuYXBF4ew4
 Tui4kmDDivCgIEPdaWaHpjbRGbwVTjF5eZukNCXDI2Zc1SyxjZht0VvWU02ZAV4n8ARc
 1Z8iSyl89s1rqlF3vAcK+AYdc0ciV6sVeVudqnbSXZQ1ZT3qF4rPZjBedSUHlL3DnSsA
 ZW/73/54iVsEuwCzlhWXAvuMQiZPTza+qBMePq39hgPIMhnDyjdd1Xj8HcRgnvt1PFd0
 WfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=23TP7z0yw1UEixzb/JxUCtamkArxbSGCCOSLNRnlaVY=;
 b=xRV7IIxrviT9ptBa4MKKY1YawK3p20NLRnevYe6tSuLO2aWgyHk1N23WLWoUA86GCJ
 plt3KOoS7CJOpQVyWMnIvfJ/1ddWDqkfTERUBWC5uCrZazR/GVJLNRW32rmfatfBTmZd
 +3+6YI3lZuoxI7kw6paQMnB0IiN2792/BjYUQ54GXa9+5VImC+BZE6Dmj6z89Au6m9RG
 k25f2iVk2uTUCLQvDfhkYg2HQIoFwXOloYvy7zlJhSVZM8agE/FNCxdPUfvUI4BedP68
 e1IBAm7sI6OY198uWCiibER0NkCS8ZThYZpFk4+TwxfVUlsPAXoDFs0WHSRzg3PA/8Z3
 qGXQ==
X-Gm-Message-State: AOAM533GoGpNDrYqZgBSJtbcHl5vCOI0Eaciy/wVM9mJNxKb7l40G1WX
 sNUr6rvFxjKd5+RwEb+D6/GdcEhr8zyb75UQxGc=
X-Google-Smtp-Source: ABdhPJyntCm6vC3vvIHmIkrNC7iStD11YgiLRV/fE+XqZoKxEl7M0WPou/ISi/DZdMUpX3Oa9Ro+YvzpkLqwlYj6sGY=
X-Received: by 2002:a05:6830:1bcf:: with SMTP id
 v15mr32338570ota.200.1638819962882; 
 Mon, 06 Dec 2021 11:46:02 -0800 (PST)
MIME-Version: 1.0
References: <141592746.1489383804.1638011381741.JavaMail.root@zimbra39-e7>
 <314840412.1490602780.1638030522137.JavaMail.root@zimbra39-e7>
In-Reply-To: <314840412.1490602780.1638030522137.JavaMail.root@zimbra39-e7>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Dec 2021 14:45:51 -0500
Message-ID: <CADnq5_P6ZoxFXxTAmMsNqbCO3_FZ4+2qn+YJ5488q6Ew-FaU-A@mail.gmail.com>
Subject: Re: Various problems trying to vga-passthrough a Renoir iGPU to a
 xen/qubes-os hvm
To: Yann Dirson <ydirson@free.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Nov 27, 2021 at 11:28 AM <ydirson@free.fr> wrote:
>
> Hello,
>
> Xen passthrough of a boot GPU those days (at least in the small QubesOS w=
orld)
> is mostly tested/documented for Intel iGPUs (or I missed something).
> I've been trying to do that with a Renoir GPU (for context, the goal is
> to have a xen domU dedicated to the GUI [3]).  I won't go into all the de=
tails
> of my successive attempts in this email, various (relative) progress repo=
rts are
> available at [0] (there are other things to be investigated listed there,=
 but
> at least some of them can possibly wait).  And I have surely missed more =
than
> a couple of key points.

We have not validated virtualization of our integrated GPUs.  I don't
know that it will work at all.  We had done a bit of testing but ran
into the same issues with the PSP, but never had a chance to debug
further because this feature is not productized.

>
> Summary of the setup:
> - GPU protected from dom0 driver using pci-stub (gets access to the GPU v=
ia efifb
>   until hopefully the GUI domain seizes it)
> - host is Xen 4.14, dom0 uses Linux 5.14 (Qubes' kernel-latest)
> - guest is a Xen HVM with running in a stub domain, launched through libv=
irt/libxl
> - hackish enablement of the IGD passthrough codepaths through
>   - libxl PCI VID hack: https://github.com/ydirson/xen/commit/4c9d4cb5c3d=
c1282ba83f17d15072c197b60281c
>   - qemu BDF hack: https://github.com/ydirson/qemu/commit/6a165467e25864f=
1ae17390a44a9c1425ba67aed
>
> The first problem encountered, i.e. that the guest amdgpu driver was not =
able
> to access the PCI expansion ROM, I have hacked around for now by letting =
the
> driver load as firmware a copy of the ROMdriver [1] - this was a 5.14.15 =
kernel
> with the QubesOS patches (all reachable from this commit).
>
> Doing this seems to make the driver happy on this aspect, but several iss=
ues
> now become visible, and after some digging I feel some insights from peop=
le
> familiar with the code gets really necessary :)
>
> The first problems are shown below as [T0], my interpretation being:
> 1. Xorg aborts (audit: type=3D1701) -- should find a way to get more deta=
ils, but
>    that is surely not the root cause of what follows
> 2. a PSP command fails -- I cannot find any AMD documentation on how PSP =
works,
>    that could possibly help
> 3. the PSP fails to load some firmware as part of its own init -- here I'=
m quite
>    uncomfortable, I thought of the PSP as being distinct from the cpu cor=
es and
>    gpu, but here it appears as a disting IP *within* the gpu.  I also fai=
led to
>    find any detailed description of the whole stuff and their interaction=
s.
> 4. following this failure the driver finishes (while initialization was s=
till
>    ongoing)

You need a functional PSP to get the GPU driver up and running.

> 5. then vcn_v2_0_sw_fini() triggers a bad memory access, which appeared t=
o be
>    while dereferencing adev->vcn.inst->fw_shared_cpu_addr.
>
> After adding traces on the individual IPs init/fini [2] showed that the v=
cn
> sw_init was indeed run, and likely initialized this pointer.  Any idea ho=
w
> it became invalid ?  One track I briefly followed was that some of the IP
> init appears to be asynchronous (the failure in PSP init occurs after lat=
er
> IPs get initialized), but that pointer seems to be initialized early and
> synchronously by VCN sw_init.
>
>
> Then, to workaround the problem with PSP not being able to initialized, I=
 used
> fw_load_type=3D0 to use direct loading (and noted that fw_load_type=3D1, =
advertised
> as loading firmware using SMU, just does not do anything in the code).

That will not work on modern GPUs.  The PSP is required for firmware
loading.  Without firmware the various engines on the GPU (GFX,
compute, VCN) won't work.

>
> The result, using 5.15.4 at this time, resulted in trace [T1].  The error=
 surfacing
> now is "ring kiq_2.1.0 test failed" with a timeout.  I had to dig the ker=
nel commit
> messages to discover that KIQ is a Kernel Interface Queue, and there are =
various
> other acronyms around this (eg. "eop", whose introduction seems older tha=
n the
> landing of the driver in the kernel) which really make it hard to be effi=
cient at
> understanding the code.  Will gladly be enlightened :)
>
> And this also ends with the VCN sw_fini going fireworks, and a quick look=
 at the
> assembler seems to hint that although the code changed a bit, it is still=
 the
> same statement crashing.
>
> Also noticed that ip_block_mask=3D0xfff7 to disable the PSP on this ASIC =
will do slightly
> different things, but end up with the same errors.
>
>
> I will gladly take any suggestion, pointers to additional information, et=
c :)

PSP is fundamental to the operation of the GPU.

Alex


>
> Best regards,
> --
> Yann
>
>
> [0] https://forum.qubes-os.org/t/amd-igpu-passthrough-attempt/6766/
> [1] https://github.com/ydirson/linux/commit/4ca50829aa44b29e8428328e913a0=
546568bf1c0
> [2] https://github.com/ydirson/linux/commit/87004f9542b9a80b4fb8386973127=
78cf47e4146
> [3] https://www.qubes-os.org/news/2020/03/18/gui-domain/#gpu-passthrough-=
the-perfect-world-desktop-solution
>
> [T0]
>
> [2021-11-23 21:05:52] [    4.297684] amdgpu 0000:00:05.0: amdgpu: Fetched=
 VBIOS from firmware file
> [2021-11-23 21:05:52] [    4.297709] amdgpu: ATOM BIOS: 113-RENOIR-025
> [2021-11-23 21:05:52] [    4.302046] [drm] VCN decode is enabled in VM mo=
de
> [2021-11-23 21:05:52] [    4.302066] [drm] VCN encode is enabled in VM mo=
de
> [2021-11-23 21:05:52] [    4.302078] [drm] JPEG decode is enabled in VM m=
ode
> [2021-11-23 21:05:52] [    4.302144] [drm] vm size is 262144 GB, 4 levels=
, block size is 9-bit, fragment size is 9-bit
> [2021-11-23 21:05:52] [    4.302181] amdgpu 0000:00:05.0: amdgpu: VRAM: 5=
12M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
> [2021-11-23 21:05:52] [    4.302217] amdgpu 0000:00:05.0: amdgpu: GART: 1=
024M 0x0000000000000000 - 0x000000003FFFFFFF
> [2021-11-23 21:05:52] [    4.302246] amdgpu 0000:00:05.0: amdgpu: AGP: 26=
7419648M 0x000000F800000000 - 0x0000FFFFFFFFFFFF
> [2021-11-23 21:05:52] [    4.302268] mtrr: base(0x430000000) is not align=
ed on a size(0x20000000) boundary
> [2021-11-23 21:05:52] [    4.302289] Failed to add WC MTRR for [000000000=
998bb55-00000000eb9e681e]; performance may suffer.
> [2021-11-23 21:05:52] [    4.302295] [drm] Detected VRAM RAM=3D512M, BAR=
=3D512M
> [2021-11-23 21:05:52] [    4.302341] [drm] RAM width 128bits DDR4
> [2021-11-23 21:05:52] [    4.302401] [drm] amdgpu: 512M of VRAM memory re=
ady
> [2021-11-23 21:05:52] [    4.302412] [drm] amdgpu: 691M of GTT memory rea=
dy.
> [2021-11-23 21:05:52] [    4.302437] [drm] GART: num cpu pages 262144, nu=
m gpu pages 262144
> [2021-11-23 21:05:52] [    4.302565] [drm] PCIE GART of 1024M enabled.
> [2021-11-23 21:05:52] [    4.302575] [drm] PTB located at 0x000000F400900=
000
> [2021-11-23 21:05:52] [    4.312921] amdgpu 0000:00:05.0: amdgpu: PSP run=
time database doesn't exist
> [2021-11-23 21:05:52] [    4.342353] [drm] Loading DMUB firmware via PSP:=
 version=3D0x01010019
> [2021-11-23 21:05:52] [    4.346679] [drm] Found VCN firmware Version ENC=
: 1.14 DEC: 5 VEP: 0 Revision: 20
> [2021-11-23 21:05:52] [    4.346723] amdgpu 0000:00:05.0: amdgpu: Will us=
e PSP to load VCN firmware
> [2021-11-23 21:05:52] [    4.978736] [drm] reserve 0x400000 from 0xf41f80=
0000 for PSP TMR
> ...
> [2021-11-23 21:05:53] [    5.379127] kauditd_printk_skb: 166 callbacks su=
ppressed
> [2021-11-23 21:05:53] [    5.379130] audit: type=3D1130 audit(1637697953.=
112:140): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
lightdm comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
> [2021-11-23 21:05:53] [    5.398103] audit: type=3D1701 audit(1637697953.=
131:141): auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D873 comm=
=3D"Xorg" exe=3D"/usr/libexec/Xorg" sig=3D6 res=3D1
> [2021-11-23 21:05:53] [    5.418058] audit: type=3D1334 audit(1637697953.=
150:142): prog-id=3D32 op=3DLOAD
> [2021-11-23 21:05:53] [    5.418081] audit: type=3D1334 audit(1637697953.=
150:143): prog-id=3D33 op=3DLOAD
> [2021-11-23 21:05:53] [    5.418096] audit: type=3D1334 audit(1637697953.=
150:144): prog-id=3D34 op=3DLOAD
> [2021-11-23 21:05:53] [    5.418401] audit: type=3D1130 audit(1637697953.=
151:145): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
systemd-coredump@2-878-0 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
> [2021-11-23 21:05:53] [    5.454438] audit: type=3D1130 audit(1637697953.=
184:146): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
qubes-input-sender-keyboard@event7 comm=3D"systemd" exe=3D"/usr/lib/systemd=
/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
> [2021-11-23 21:05:53] [    5.464666] audit: type=3D1130 audit(1637697953.=
197:147): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
qubes-input-sender-keyboard@event6 comm=3D"systemd" exe=3D"/usr/lib/systemd=
/systemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
> [2021-11-23 21:05:53] [    5.515827] audit: type=3D1131 audit(1637697953.=
248:148): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
systemd-coredump@2-878-0 comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" =
hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
> [2021-11-23 21:05:53] [    5.521839] audit: type=3D1131 audit(1637697953.=
254:149): pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295 msg=3D'unit=3D=
lightdm comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dfailed'
> [2021-11-23 21:05:55] [    7.675982] [drm] psp command (0xFFFFFFFF) faile=
d and response status is (0xFFFFFFFF)
> [2021-11-23 21:05:55] [    7.676007] [drm:psp_hw_start [amdgpu]] *ERROR* =
PSP load tmr failed!
> [2021-11-23 21:05:55] [    7.676213] [drm:psp_hw_init [amdgpu]] *ERROR* P=
SP firmware loading failed
> [2021-11-23 21:05:55] [    7.676371] [drm:amdgpu_device_fw_loading [amdgp=
u]] *ERROR* hw_init of IP block <psp> failed -22
> [2021-11-23 21:05:55] [    7.676530] amdgpu 0000:00:05.0: amdgpu: amdgpu_=
device_ip_init failed
> [2021-11-23 21:05:55] [    7.676563] amdgpu 0000:00:05.0: amdgpu: Fatal e=
rror during GPU init
> [2021-11-23 21:05:55] [    7.676578] amdgpu 0000:00:05.0: amdgpu: amdgpu:=
 finishing device.
> [2021-11-23 21:05:55] [    7.679044] amdgpu: probe of 0000:00:05.0 failed=
 with error -22
> [2021-11-23 21:05:55] [    7.679102] BUG: unable to handle page fault for=
 address: ffffb1f120cdf000
> [2021-11-23 21:05:55] [    7.679117] #PF: supervisor write access in kern=
el mode
> [2021-11-23 21:05:55] [    7.679129] #PF: error_code(0x0002) - not-presen=
t page
> [2021-11-23 21:05:55] [    7.679140] PGD 1000067 P4D 1000067 PUD 11dc067 =
PMD 0
> [2021-11-23 21:05:55] [    7.679154] Oops: 0002 [#1] SMP NOPTI
> [2021-11-23 21:05:55] [    7.679163] CPU: 0 PID: 276 Comm: systemd-udevd =
Not tainted 5.14.15-1.fc32.qubes.x86_64 #1
> [2021-11-23 21:05:55] [    7.679180] Hardware name: Xen HVM domU, BIOS 4.=
14.3 11/14/2021
> [2021-11-23 21:05:55] [    7.679194] RIP: 0010:vcn_v2_0_sw_fini+0x10/0x40=
 [amdgpu]
> [2021-11-23 21:05:55] [    7.679367] Code: 66 f0 83 c2 81 c6 ea 05 00 00 =
31 c9 4c 89 cf e9 b6 4d ee ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 =
38 17 01 00 48 89 fd <c7> 00 00 00 00 00 e8 d5 d5 f1 ff 48 89 ef e8 2d 20 f=
f ff 85 c0 74
> [2021-11-23 21:05:55] [    7.679402] RSP: 0018:ffffb1f1002cfc30 EFLAGS: 0=
0010206
> [2021-11-23 21:05:55] [    7.679414] RAX: ffffb1f120cdf000 RBX: ffff8b4d9=
a675620 RCX: 0000000000000000
> [2021-11-23 21:05:55] [    7.679429] RDX: 000000000000000e RSI: 000000000=
0000003 RDI: ffff8b4d9a660000
> [2021-11-23 21:05:55] [    7.679444] RBP: ffff8b4d9a660000 R08: 000000000=
000000f R09: 000000008010000f
> [2021-11-23 21:05:55] [    7.679459] R10: 0000000040000000 R11: 000000001=
b99d000 R12: ffff8b4d9a675590
> [2021-11-23 21:05:55] [    7.679474] R13: ffff8b4d9a676400 R14: 000000000=
000000c R15: ffff8b4d813ef36c
> [2021-11-23 21:05:55] [    7.679490] FS:  000073bc16d48380(0000) GS:ffff8=
b4dbcc00000(0000) knlGS:0000000000000000
> [2021-11-23 21:05:55] [    7.679507] CS:  0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> [2021-11-23 21:05:55] [    7.679520] CR2: ffffb1f120cdf000 CR3: 000000000=
4160000 CR4: 0000000000350ef0
> [2021-11-23 21:05:55] [    7.679536] Call Trace:
> [2021-11-23 21:05:55] [    7.679545]  amdgpu_device_ip_fini.isra.0+0xb6/0=
x1e0 [amdgpu]
> [2021-11-23 21:05:55] [    7.679691]  amdgpu_device_fini_sw+0xe/0x100 [am=
dgpu]
> [2021-11-23 21:05:55] [    7.679835]  amdgpu_driver_release_kms+0x12/0x30=
 [amdgpu]
> [2021-11-23 21:05:55] [    7.679978]  devm_drm_dev_init_release+0x3d/0x60=
 [drm]
> [2021-11-23 21:05:55] [    7.680008]  devres_release_all+0xb8/0x100
> [2021-11-23 21:05:55] [    7.680019]  really_probe+0x100/0x310
> [2021-11-23 21:05:55] [    7.680029]  __driver_probe_device+0xfe/0x180
> [2021-11-23 21:05:55] [    7.680040]  driver_probe_device+0x1e/0x90
> [2021-11-23 21:05:55] [    7.680050]  __driver_attach+0xc0/0x1c0
> [2021-11-23 21:05:55] [    7.680059]  ? __device_attach_driver+0xe0/0xe0
> [2021-11-23 21:05:55] [    7.680070]  ? __device_attach_driver+0xe0/0xe0
> [2021-11-23 21:05:55] [    7.680081]  bus_for_each_dev+0x89/0xd0
> [2021-11-23 21:05:55] [    7.680090]  bus_add_driver+0x12b/0x1e0
> [2021-11-23 21:05:55] [    7.680099]  driver_register+0x8f/0xe0
> [2021-11-23 21:05:55] [    7.680109]  ? 0xffffffffc0e7b000
> [2021-11-23 21:05:55] [    7.680117]  do_one_initcall+0x57/0x200
> [2021-11-23 21:05:55] [    7.680128]  do_init_module+0x5c/0x260
> [2021-11-23 21:05:55] [    7.680137]  __do_sys_finit_module+0xae/0x110
> [2021-11-23 21:05:55] [    7.680149]  do_syscall_64+0x3b/0x90
> [2021-11-23 21:05:55] [    7.680158]  entry_SYSCALL_64_after_hwframe+0x44=
/0xae
> [2021-11-23 21:05:55] [    7.680170] RIP: 0033:0x73bc17ce9edd
> [2021-11-23 21:05:55] [    7.680180] Code: 00 c3 66 2e 0f 1f 84 00 00 00 =
00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 =
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 7f 0c 00 f7 d=
8 64 89 01 48
> [2021-11-23 21:05:55] [    7.680215] RSP: 002b:00007fffa9b51688 EFLAGS: 0=
0000246 ORIG_RAX: 0000000000000139
> [2021-11-23 21:05:55] [    7.680231] RAX: ffffffffffffffda RBX: 0000602da=
93e3120 RCX: 000073bc17ce9edd
> [2021-11-23 21:05:55] [    7.680246] RDX: 0000000000000000 RSI: 000073bc1=
7e2732c RDI: 0000000000000014
> [2021-11-23 21:05:55] [    7.680260] RBP: 0000000000020000 R08: 000000000=
0000000 R09: 0000602da93e3bb0
> [2021-11-23 21:05:55] [    7.680275] R10: 0000000000000014 R11: 000000000=
0000246 R12: 000073bc17e2732c
> [2021-11-23 21:05:55] [    7.680290] R13: 0000602da9338960 R14: 000000000=
0000007 R15: 0000602da93e4000
> [2021-11-23 21:05:55] [    7.680306] Modules linked in: joydev intel_rapl=
_msr amdgpu(+) intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel=
 ghash_clmulni_intel ip6table_filter ip6table_mangle ip6table_raw ip6_table=
s iommu_v2 gpu_sched ipt_REJECT i2c_algo_bit nf_reject_ipv4 drm_ttm_helper =
ttm xt_state xt_conntrack iptable_filter iptable_mangle iptable_raw drm_kms=
_helper ehci_pci xt_MASQUERADE iptable_nat nf_nat nf_conntrack ehci_hcd cec=
 nf_defrag_ipv6 serio_raw nf_defrag_ipv4 i2c_piix4 ata_generic pata_acpi pc=
spkr xen_scsiback target_core_mod xen_netback uinput xen_privcmd xen_gntdev=
 drm xen_gntalloc xen_blkback fuse xen_evtchn bpf_preload ip_tables overlay=
 xen_blkfront
> [2021-11-23 21:05:55] [    7.876218] CR2: ffffb1f120cdf000
> [2021-11-23 21:05:55] [    7.876227] ---[ end trace 36c4552e098fcc4e ]---
> [2021-11-23 21:05:55] [    7.876239] RIP: 0010:vcn_v2_0_sw_fini+0x10/0x40=
 [amdgpu]
> [2021-11-23 21:05:55] [    7.876400] Code: 66 f0 83 c2 81 c6 ea 05 00 00 =
31 c9 4c 89 cf e9 b6 4d ee ff 66 0f 1f 44 00 00 0f 1f 44 00 00 55 48 8b 87 =
38 17 01 00 48 89 fd <c7> 00 00 00 00 00 e8 d5 d5 f1 ff 48 89 ef e8 2d 20 f=
f ff 85 c0 74
> [2021-11-23 21:05:55] [    7.876439] RSP: 0018:ffffb1f1002cfc30 EFLAGS: 0=
0010206
> [2021-11-23 21:05:55] [    7.876451] RAX: ffffb1f120cdf000 RBX: ffff8b4d9=
a675620 RCX: 0000000000000000
> [2021-11-23 21:05:55] [    7.876467] RDX: 000000000000000e RSI: 000000000=
0000003 RDI: ffff8b4d9a660000
> [2021-11-23 21:05:55] [    7.876483] RBP: ffff8b4d9a660000 R08: 000000000=
000000f R09: 000000008010000f
> [2021-11-23 21:05:55] [    7.876500] R10: 0000000040000000 R11: 000000001=
b99d000 R12: ffff8b4d9a675590
> [2021-11-23 21:05:55] [    7.876515] R13: ffff8b4d9a676400 R14: 000000000=
000000c R15: ffff8b4d813ef36c
> [2021-11-23 21:05:55] [    7.876533] FS:  000073bc16d48380(0000) GS:ffff8=
b4dbcc00000(0000) knlGS:0000000000000000
> [2021-11-23 21:05:55] [    7.876551] CS:  0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> [2021-11-23 21:05:55] [    7.876565] CR2: ffffb1f120cdf000 CR3: 000000000=
4160000 CR4: 0000000000350ef0
> [2021-11-23 21:05:55] [    7.876582] Kernel panic - not syncing: Fatal ex=
ception
> [2021-11-23 21:05:55] [    7.877654] Kernel Offset: 0x1000000 from 0xffff=
ffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
>
>
> [T1]
>
> [2021-11-27 00:56:45] [    3.183789] [drm] Found VCN firmware Version ENC=
: 1.14 DEC: 5 VEP: 0 Revision: 20
> [2021-11-27 00:56:45] [    3.207583] [drm] sw_init of IP block <jpeg_v2_0=
>...
> [2021-11-27 00:56:45] [    3.210594] amdgpu 0000:00:05.0: amdgpu: SMU is =
initialized successfully!
> [2021-11-27 00:56:45] [    3.227177] [drm] kiq ring mec 2 pipe 1 q 0
> ...
> [2021-11-27 00:56:45] [    3.420287] amdgpu 0000:00:05.0: [drm:amdgpu_rin=
g_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
> [2021-11-27 00:56:45] [    3.420485] [drm:amdgpu_gfx_enable_kcq.cold [amd=
gpu]] *ERROR* KCQ enable failed
> [2021-11-27 00:56:45] [    3.420681] [drm:amdgpu_device_ip_init [amdgpu]]=
 *ERROR* hw_init of IP block <gfx_v9_0> failed -110
> [2021-11-27 00:56:45] [    3.420878] amdgpu 0000:00:05.0: amdgpu: amdgpu_=
device_ip_init failed
> [2021-11-27 00:56:45] [    3.420893] amdgpu 0000:00:05.0: amdgpu: Fatal e=
rror during GPU init
> [2021-11-27 00:56:45] [    3.420919] usb 1-1: New USB device found, idVen=
dor=3D0627, idProduct=3D0001, bcdDevice=3D 0.00
> [2021-11-27 00:56:45] [    3.420937] usb 1-1: New USB device strings: Mfr=
=3D1, Product=3D3, SerialNumber=3D10
> [2021-11-27 00:56:45] [    3.420954] usb 1-1: Product: QEMU USB Tablet
> [2021-11-27 00:56:45] [    3.420964] usb 1-1: Manufacturer: QEMU
> [2021-11-27 00:56:45] [    3.420973] usb 1-1: SerialNumber: 28754-0000:00=
:04.0-1
> [2021-11-27 00:56:45] [    3.424285] amdgpu 0000:00:05.0: amdgpu: amdgpu:=
 finishing device.
> ...
> [2021-11-27 00:56:45] [    3.491635] amdgpu: probe of 0000:00:05.0 failed=
 with error -110
> [2021-11-27 00:56:45] [    3.492802] [drm] sw_fini of IP block <jpeg_v2_0=
>...
> [2021-11-27 00:56:45] [    3.492827] [drm] sw_fini of IP block <vcn_v2_0>=
...
> [2021-11-27 00:56:45] [    3.492843] BUG: unable to handle page fault for=
 address: ffff9e9ea0d41000
> [2021-11-27 00:56:45] [    3.492857] #PF: supervisor write access in kern=
el mode
> [2021-11-27 00:56:45] [    3.492868] #PF: error_code(0x0002) - not-presen=
t page
> [2021-11-27 00:56:45] [    3.492880] PGD 1000067 P4D 1000067 PUD 11db067 =
PMD 0
> [2021-11-27 00:56:45] [    3.492895] Oops: 0002 [#1] SMP NOPTI
> [2021-11-27 00:56:45] [    3.492905] CPU: 0 PID: 280 Comm: systemd-udevd =
Not tainted 5.15.4-1.fc32.qubes.x86_64 #1
> [2021-11-27 00:56:45] [    3.558408] Hardware name: Xen HVM domU, BIOS 4.=
14.3 11/25/2021
> [2021-11-27 00:56:45] [    3.558422] RIP: 0010:vcn_v2_0_sw_fini+0x72/0x90=
 [amdgpu]
> [2021-11-27 00:56:45] [    3.558598] Code: 89 ef e8 f1 1f ff ff 85 c0 75 =
08 48 89 ef e8 15 1e ff ff 48 8b 54 24 08 65 48 2b 14 25 28 00 00 00 75 18 =
48 83 c4 10 5b 5d c3 <c7> 03 00 00 00 00 8b 7c 24 04 e8 4f 48 ba ff eb bc e=
8 88 a2 58 ee
> [2021-11-27 00:56:45] [    3.558637] RSP: 0018:ffff9e9e8054bc18 EFLAGS: 0=
0010202
> [2021-11-27 00:56:45] [    3.558649] RAX: 0000000000000001 RBX: ffff9e9ea=
0d41000 RCX: ffff8df77cc20a08
> [2021-11-27 00:56:45] [    3.558665] RDX: 000030a703011a40 RSI: ffff9e9e8=
054bc1c RDI: ffffffffc0340f40
> [2021-11-27 00:56:45] [    3.558682] RBP: ffff8df74e000000 R08: 000000000=
0000000 R09: ffff9e9e8054ba90
> [2021-11-27 00:56:45] [    3.558698] R10: ffff9e9e8054ba88 R11: ffffffffa=
f945d68 R12: ffff8df74e015a70
> [2021-11-27 00:56:45] [    3.558713] R13: ffff8df74e0168e0 R14: 000000000=
000000a R15: ffff8df741be637c
> [2021-11-27 00:56:45] [    3.558731] FS:  00007f73d2d14380(0000) GS:ffff8=
df77cc00000(0000) knlGS:0000000000000000
> [2021-11-27 00:56:45] [    3.558749] CS:  0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> [2021-11-27 00:56:45] [    3.558763] CR2: ffff9e9ea0d41000 CR3: 000000000=
6b82000 CR4: 0000000000350ef0
> [2021-11-27 00:56:45] [    3.558781] Call Trace:
> [2021-11-27 00:56:45] [    3.558788]  <TASK>
> [2021-11-27 00:56:45] [    3.558795]  amdgpu_device_ip_fini.isra.0.cold+0=
x27/0x55 [amdgpu]
> [2021-11-27 00:56:45] [    3.558992]  amdgpu_device_fini_sw+0x16/0x100 [a=
mdgpu]
> [2021-11-27 00:56:45] [    3.559144]  amdgpu_driver_release_kms+0x12/0x30=
 [amdgpu]
> [2021-11-27 00:56:45] [    3.559290]  devm_drm_dev_init_release+0x3d/0x60=
 [drm]
> [2021-11-27 00:56:45] [    3.559326]  devres_release_all+0xb8/0x100
> [2021-11-27 00:56:45] [    3.559339]  really_probe+0x100/0x310
> [2021-11-27 00:56:45] [    3.559350]  __driver_probe_device+0xfe/0x180
> [2021-11-27 00:56:45] [    3.559362]  driver_probe_device+0x1e/0x90
> [2021-11-27 00:56:45] [    3.559372]  __driver_attach+0xc0/0x1c0
> [2021-11-27 00:56:45] [    3.559382]  ? __device_attach_driver+0xe0/0xe0
> [2021-11-27 00:56:45] [    3.559393]  ? __device_attach_driver+0xe0/0xe0
> [2021-11-27 00:56:45] [    3.559405]  bus_for_each_dev+0x89/0xd0
> [2021-11-27 00:56:45] [    3.559414]  bus_add_driver+0x12b/0x1e0
> [2021-11-27 00:56:45] [    3.559424]  driver_register+0x8f/0xe0
> [2021-11-27 00:56:45] [    3.559433]  ? 0xffffffffc0df1000
> [2021-11-27 00:56:45] [    3.559443]  do_one_initcall+0x57/0x200
> [2021-11-27 00:56:45] [    3.559455]  do_init_module+0x5c/0x260
> [2021-11-27 00:56:45] [    3.559465]  __do_sys_finit_module+0xae/0x110
> [2021-11-27 00:56:45] [    3.559477]  do_syscall_64+0x3b/0x90
> [2021-11-27 00:56:45] [    3.559488]  entry_SYSCALL_64_after_hwframe+0x44=
/0xae
> [2021-11-27 00:56:45] [    3.559502] RIP: 0033:0x7f73d3cb5edd
> [2021-11-27 00:56:45] [    3.559512] Code: 00 c3 66 2e 0f 1f 84 00 00 00 =
00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 =
4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b 7f 0c 00 f7 d=
8 64 89 01 48
> [2021-11-27 00:56:45] [    3.559551] RSP: 002b:00007ffc83eee328 EFLAGS: 0=
0000246 ORIG_RAX: 0000000000000139
> [2021-11-27 00:56:45] [    3.559569] RAX: ffffffffffffffda RBX: 000060d4f=
098bf90 RCX: 00007f73d3cb5edd
> [2021-11-27 00:56:45] [    3.559584] RDX: 0000000000000000 RSI: 000060d4f=
098c680 RDI: 0000000000000014
> [2021-11-27 00:56:45] [    3.559600] RBP: 0000000000020000 R08: 000000000=
0000000 R09: 000060d4f098c6e0
> [2021-11-27 00:56:45] [    3.559617] R10: 0000000000000014 R11: 000000000=
0000246 R12: 000060d4f098c680
> [2021-11-27 00:56:45] [    3.559633] R13: 000060d4f08dc080 R14: 000000000=
0000000 R15: 000060d4f098cbf0
> [2021-11-27 00:56:45] [    3.559650]  </TASK>
> [2021-11-27 00:56:45] [    3.559656] Modules linked in: ip6table_filter i=
p6table_mangle ip6table_raw ip6_tables ipt_REJECT nf_reject_ipv4 xt_state x=
t_conntrack iptable_filter iptable_mangle iptable_raw xt_MASQUERADE iptable=
_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 amdgpu(+) intel_rapl=
_msr iommu_v2 gpu_sched i2c_algo_bit drm_ttm_helper intel_rapl_common ttm c=
rct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel drm_kms_helpe=
r pcspkr cec serio_raw ehci_pci ehci_hcd i2c_piix4 ata_generic pata_acpi xe=
n_scsiback target_core_mod xen_netback uinput xen_privcmd xen_gntdev xen_gn=
talloc fuse xen_blkback drm xen_evtchn bpf_preload ip_tables overlay xen_bl=
kfront
> [2021-11-27 00:56:45] [    3.559807] CR2: ffff9e9ea0d41000
> [2021-11-27 00:56:45] [    3.559817] ---[ end trace 7cad684cd6eb2013 ]---
> [2021-11-27 00:56:45] [    3.559829] RIP: 0010:vcn_v2_0_sw_fini+0x72/0x90=
 [amdgpu]
> [2021-11-27 00:56:45] [    3.559994] Code: 89 ef e8 f1 1f ff ff 85 c0 75 =
08 48 89 ef e8 15 1e ff ff 48 8b 54 24 08 65 48 2b 14 25 28 00 00 00 75 18 =
48 83 c4 10 5b 5d c3 <c7> 03 00 00 00 00 8b 7c 24 04 e8 4f 48 ba ff eb bc e=
8 88 a2 58 ee
> [2021-11-27 00:56:45] [    3.560033] RSP: 0018:ffff9e9e8054bc18 EFLAGS: 0=
0010202
> [2021-11-27 00:56:45] [    3.560045] RAX: 0000000000000001 RBX: ffff9e9ea=
0d41000 RCX: ffff8df77cc20a08
> [2021-11-27 00:56:45] [    3.560062] RDX: 000030a703011a40 RSI: ffff9e9e8=
054bc1c RDI: ffffffffc0340f40
> [2021-11-27 00:56:45] [    3.560078] RBP: ffff8df74e000000 R08: 000000000=
0000000 R09: ffff9e9e8054ba90
> [2021-11-27 00:56:45] [    3.560094] R10: ffff9e9e8054ba88 R11: ffffffffa=
f945d68 R12: ffff8df74e015a70
> [2021-11-27 00:56:45] [    3.560111] R13: ffff8df74e0168e0 R14: 000000000=
000000a R15: ffff8df741be637c
> [2021-11-27 00:56:45] [    3.560130] FS:  00007f73d2d14380(0000) GS:ffff8=
df77cc00000(0000) knlGS:0000000000000000
> [2021-11-27 00:56:45] [    3.560147] CS:  0010 DS: 0000 ES: 0000 CR0: 000=
0000080050033
> [2021-11-27 00:56:45] [    3.560159] CR2: ffff9e9ea0d41000 CR3: 000000000=
6b82000 CR4: 0000000000350ef0
> [2021-11-27 00:56:45] [    3.560175] Kernel panic - not syncing: Fatal ex=
ception
> [2021-11-27 00:56:45] [    3.561248] Kernel Offset: 0x2d000000 from 0xfff=
fffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
