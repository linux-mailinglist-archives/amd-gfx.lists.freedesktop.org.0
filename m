Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AE486BD9
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jan 2022 22:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20C510E3F1;
	Thu,  6 Jan 2022 21:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F177210E3F1
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jan 2022 21:24:59 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id v6so5531024oib.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jan 2022 13:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=piCdHezAJ4ZME0NRjrObIWJOduFDKSyaTc6YdYTHHhE=;
 b=cTRTipR5fFndGYTU9svC0/XWouBQ5FA91vhuC6RexGxCm1WE51DDZCmwTENxK3ip8O
 phnP0KVd9fTyvb02s4/QxwP4HSBFNHtyvbG6RcXhWNZCvNVBKBXV5oeljLQOfqo/0hSr
 J8Vz3uf7ABb9ZkwN7btGshRvwWSLQpRHzk8N1QpVdLRk0OUf5fwn3uq3AN0qVgW2hSlC
 pXQzH7hBTJNunGjZg6IvsFcL2xB87iv7stONF3HsJlfzkVCiCkjGDSQkOS5LsihMAMig
 2G2PqkEKhvjTsZLt8n+2DTkC5Hiijpew6/dd4IsBZvW8q5CGoIV0Z6h43xBVlVFlNKWX
 KSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=piCdHezAJ4ZME0NRjrObIWJOduFDKSyaTc6YdYTHHhE=;
 b=q9UBFuCP3OJm1/qLbI6f5k3dE3MAYylotvQaxU6UIk32aylQWaO+BFy5LdWzJWpf3Z
 zppJkRh8IZA6HOgwCmq91MII2Q1KCSUTZpCqebbeuD8fQmoT1UUlLfNtjijldqXNgC96
 4CnbuvBJnLpLjQEt1ecP5bLGXr2qO17ZbdV1u0y/Y8emWJvIAT64t9nS48Ri280Pffkk
 blz5uZM3toCaxH6UEXPlpjI8Z66prjaWDngrGQHSY4HBWv1GnJQ8o1hPPM/Ib7iCj4xV
 shUI55CRjk2avcGSL/baj9p3KzCM6ju9DOri4jMYV9DigehkuluFz9gu2LOiF15DK8jG
 XhBA==
X-Gm-Message-State: AOAM533YXihxbnKXKk24GwIu5Oo0CzoDWgyGLVAz9Fp65VSJlP5zlpdm
 hCQmbkddFmlm+0n3KmQDg86/xucI+TyXa15IJsMjr3StHc3Usw==
X-Google-Smtp-Source: ABdhPJye62jyJkvU/0hnO59yzn8QKCnMwDxZc7hV6K5uZxw4lGyGdmhMdBIYYfJSY5DLboZGGBocduB8w7CBJEjDrno=
X-Received: by 2002:a05:6808:68f:: with SMTP id
 k15mr7374039oig.5.1641504298838; 
 Thu, 06 Jan 2022 13:24:58 -0800 (PST)
MIME-Version: 1.0
References: <CADnq5_O=DxnsZaCtFxoWX7jxO-nydyGyBaxWeDyeDLrODAGS9A@mail.gmail.com>
 <2102533868.175329251.1641483482834.JavaMail.root@zimbra39-e7>
In-Reply-To: <2102533868.175329251.1641483482834.JavaMail.root@zimbra39-e7>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Jan 2022 16:24:43 -0500
Message-ID: <CADnq5_OaHYVVqeqcQmrDQwzBnsiJK-kw73257a0QmsnNHd=wxg@mail.gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 6, 2022 at 10:38 AM Yann Dirson <ydirson@free.fr> wrote:
>
> Alex wrote:
> > > How is the stolen memory communicated to the driver ?  That host
> > > physical
> > > memory probably has to be mapped at the same guest physical address
> > > for
> > > the magic to work, right ?
> >
> > Correct.  The driver reads the physical location of that memory from
> > hardware registers.  Removing this chunk of code from gmc_v9_0.c will
> > force the driver to use the BAR,
>
> That would only be a workaround for a missing mapping of stolen
> memory to the guest, right ?


Correct. That will use the PCI BAR rather than the underlying physical
memory for CPU access to the carve out region.

>
>
> > but I'm not sure if there are any
> > other places in the driver that make assumptions about using the
> > physical host address or not on APUs off hand.
>
> gmc_v9_0_vram_gtt_location() updates vm_manager.vram_base_offset from
> the same value.  I'm not sure I understand why in this case there is
> no reason to use the BAR while there are some in gmc_v9_0_mc_init().
>
> vram_base_offset then gets used in several places:
>
> * amdgpu_gmc_init_pdb0, that seems likely enough to be problematic,
>   right ?
>   As a sidenote the XGMI offset added earlier gets substracted
>   here to deduce vram base addr
>   (a couple of new acronyms there: PDB, PDE -- page directory base/entry?=
)
>
> * amdgpu_ttm_map_buffer, amdgpu_vm_bo_update_mapping: those seem to be
>   as problematic
>
> * amdgpu_gmc_vram_mc2pa: until I got there I had assumed MC could stand f=
or
>   "memory controller", but then "MC address of buffer" makes me doubt
>
>

MC =3D memory controller (as in graphics memory controller).

These are GPU addresses not CPU addresses so they should be fine.

> >
> >         if ((adev->flags & AMD_IS_APU) ||
> >             (adev->gmc.xgmi.supported &&
> >              adev->gmc.xgmi.connected_to_cpu)) {
> >                 adev->gmc.aper_base =3D
> >                         adev->gfxhub.funcs->get_mc_fb_offset(adev) +
> >                         adev->gmc.xgmi.physical_node_id *
> >                         adev->gmc.xgmi.node_segment_size;
> >                 adev->gmc.aper_size =3D adev->gmc.real_vram_size;
> >         }
>
>
> Now for the test... it does indeed seem to go much further, I even
> loose the dom0's efifb to that black screen hopefully showing the
> driver started to setup the hardware.  Will probably still have to
> hunt down whether it still tries to use efifb afterwards (can't see
> why it would not, TBH, given the previous behaviour where it kept
> using it after the guest failed to start).
>
> The log shows many details about TMR loading
>
> Then as expected:
>
> [2022-01-06 15:16:09] <6>[    5.844589] amdgpu 0000:00:05.0: amdgpu: RAP:=
 optional rap ta ucode is not available
> [2022-01-06 15:16:09] <6>[    5.844619] amdgpu 0000:00:05.0: amdgpu: SECU=
REDISPLAY: securedisplay ta ucode is not available
> [2022-01-06 15:16:09] <7>[    5.844639] [drm:amdgpu_device_init.cold [amd=
gpu]] hw_init (phase2) of IP block <smu>...
> [2022-01-06 15:16:09] <6>[    5.845515] amdgpu 0000:00:05.0: amdgpu: SMU =
is initialized successfully!
>
>
> not sure about that unhandled interrupt (and a bit worried about messed-u=
p logs):
>
> [2022-01-06 15:16:09] <7>[    6.010681] amdgpu 0000:00:05.0: [drm:amdgpu_=
ring_test_hel[2022-01-06 15:16:10] per [amdgpu]] ring test on sdma0 succeed=
ed
> [2022-01-06 15:16:10] <7>[    6.010831] [drm:amdgpu_ih_process [amdgpu]] =
amdgpu_ih_process: rptr 0, wptr 32
> [2022-01-06 15:16:10] <7>[    6.011002] [drm:amdgpu_irq_dispatch [amdgpu]=
] Unhandled interrupt src_id: 243
>
>
> then comes a first error:
>
> [2022-01-06 15:16:10] <6>[    6.011785] [drm] Display Core initialized wi=
th v3.2.149!
> [2022-01-06 15:16:10] <6>[    6.012714] [drm] DMUB hardware initialized: =
version=3D0x0101001C
> [2022-01-06 15:16:10] <3>[    6.228263] [drm:dc_dmub_srv_wait_idle [amdgp=
u]] *ERROR* Error waiting for DMUB idle: status=3D3
> [2022-01-06 15:16:10] <7>[    6.229125] [drm:amdgpu_dm_init.isra.0.cold [=
amdgpu]] amdgpu: freesync_module init done 0000000076c7b459.
> [2022-01-06 15:16:10] <7>[    6.229677] [drm:amdgpu_dm_init.isra.0.cold [=
amdgpu]] amdgpu: hdcp_workqueue init done 0000000087e28b47.
> [2022-01-06 15:16:10] <7>[    6.229979] [drm:amdgpu_dm_init.isra.0.cold [=
amdgpu]] amdgpu_dm_connector_init()
>
> ... which we can see again several times later though the driver seems su=
fficient to finish init:
>
> [2022-01-06 15:16:10] <6>[    6.615615] [drm] late_init of IP block <smu>=
...
> [2022-01-06 15:16:10] <6>[    6.615772] [drm] late_init of IP block <gfx_=
v9_0>...
> [2022-01-06 15:16:10] <6>[    6.615801] [drm] late_init of IP block <sdma=
_v4_0>...
> [2022-01-06 15:16:10] <6>[    6.615827] [drm] late_init of IP block <dm>.=
..
> [2022-01-06 15:16:10] <3>[    6.801790] [drm:dc_dmub_srv_wait_idle [amdgp=
u]] *ERROR* Error waiting for DMUB idle: status=3D3
> [2022-01-06 15:16:10] <7>[    6.806079] [drm:drm_minor_register [drm]]
> [2022-01-06 15:16:10] <7>[    6.806195] [drm:drm_minor_register [drm]] ne=
w minor registered 128
> [2022-01-06 15:16:10] <7>[    6.806223] [drm:drm_minor_register [drm]]
> [2022-01-06 15:16:10] <7>[    6.806289] [drm:drm_minor_register [drm]] ne=
w minor registered 0
> [2022-01-06 15:16:10] <7>[    6.806355] [drm:drm_sysfs_connector_add [drm=
]] adding "eDP-1" to sysfs
> [2022-01-06 15:16:10] <7>[    6.806424] [drm:drm_dp_aux_register_devnode =
[drm_kms_helper]] drm_dp_aux_dev: aux [AMDGPU DM aux hw bus 0] registered a=
s minor 0
> [2022-01-06 15:16:10] <7>[    6.806498] [drm:drm_sysfs_hotplug_event [drm=
]] generating hotplug event
> [2022-01-06 15:16:10] <6>[    6.806533] [drm] Initialized amdgpu 3.42.0 2=
0150101 for 0000:00:05.0 on minor 0
>
>

Looks like it initialized fine.  I guess the DMCUB firmware issues are
not fatal.  Probably need input from one of the display guys on that.

> At one point though a new problem shows: it seem to have issues driving t=
he CRTC in the end:
>
> [2022-01-06 15:16:25] <7>[   11.140807] amdgpu 0000:00:05.0: [drm:drm_vbl=
ank_enable [drm]] enabling vblank on crtc 0, ret: 0
> [2022-01-06 15:16:25] <3>[   11.329306] [drm:dc_dmub_srv_wait_idle [amdgp=
u]] *ERROR* Error waiting for DMUB idle: status=3D3
> [2022-01-06 15:16:25] <3>[   11.524327] [drm:dc_dmub_srv_wait_idle [amdgp=
u]] *ERROR* Error waiting for DMUB idle: status=3D3
> [2022-01-06 15:16:25] <4>[   11.641814] [drm] Fence fallback timer expire=
d on ring comp_1.3.0
> [2022-01-06 15:16:25] <7>[   11.641877] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on comp_1.3.0 succeeded
> [2022-01-06 15:16:25] <4>[   12.145804] [drm] Fence fallback timer expire=
d on ring comp_1.0.1
> [2022-01-06 15:16:25] <7>[   12.145862] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on comp_1.0.1 succeeded
> [2022-01-06 15:16:25] <4>[   12.649771] [drm] Fence fallback timer expire=
d on ring comp_1.1.1
> [2022-01-06 15:16:25] <7>[   12.649789] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on comp_1.1.1 succeeded
> [2022-01-06 15:16:25] <4>[   13.153815] [drm] Fence fallback timer expire=
d on ring comp_1.2.1
> [2022-01-06 15:16:25] <7>[   13.153836] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on comp_1.2.1 succeeded
> [2022-01-06 15:16:25] <4>[   13.657756] [drm] Fence fallback timer expire=
d on ring comp_1.3.1
> [2022-01-06 15:16:25] <7>[   13.657767] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on comp_1.3.1 succeeded
> [2022-01-06 15:16:25] <7>[   13.657899] [drm:sdma_v4_0_ring_set_wptr [amd=
gpu]] Setting write pointer
> [2022-01-06 15:16:25] <7>[   13.658008] [drm:sdma_v4_0_ring_set_wptr [amd=
gpu]] Using doorbell -- wptr_offs =3D=3D 0x00000198 lower_32_bits(ring->wpt=
r) << 2 =3D=3D 0x00000100 upper_32_bits(ring->wptr) << 2 =3D=3D 0x00000000
> [2022-01-06 15:16:25] <7>[   13.658114] [drm:sdma_v4_0_ring_set_wptr [amd=
gpu]] calling WDOORBELL64(0x000001e0, 0x0000000000000100)
> [2022-01-06 15:16:25] <4>[   14.161792] [drm] Fence fallback timer expire=
d on ring sdma0
> [2022-01-06 15:16:25] <7>[   14.161811] amdgpu 0000:00:05.0: [drm:amdgpu_=
ib_ring_tests [amdgpu]] ib test on sdma0 succeeded
> [2022-01-06 15:16:25] <3>[   21.609821] [drm:drm_atomic_helper_wait_for_f=
lip_done [drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
>
>
> No visible change if I boot with efifb:off (aside from entering LUKS
> passphrase in the dark, that is).
>
>
> Tried patching gmc_v9_0_vram_gtt_location() to use the BAR too [2], but
> that turns out to work even less:


That won't work.  These are GPU addresses not CPU addresses.

>
> [2022-01-06 16:27:48] <6>[    6.230166] amdgpu 0000:00:05.0: amdgpu: SMU =
is initialized successfully!
> [2022-01-06 16:27:48] <7>[    6.230168] [drm:amdgpu_device_init.cold [amd=
gpu]] hw_init (phase2) of IP block <gfx_v9_0>...
> [2022-01-06 16:27:48] <6>[    6.231948] [drm] kiq ring mec 2 pipe 1 q 0
> [2022-01-06 16:27:48] <7>[    6.231861] [drm:amdgpu_ih_process [amdgpu]] =
amdgpu_ih_process: rptr 448, wptr 512
> [2022-01-06 16:27:48] <7>[    6.231962] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] kiq alloc'd 64
> [2022-01-06 16:27:48] <7>[    6.232172] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] kiq size init: 256
> [2022-01-06 16:27:48] <7>[    6.232344] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] kiq size after set_res: 248
> [2022-01-06 16:27:48] <7>[    6.232530] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] kiq size after map_q: 192
> [2022-01-06 16:27:48] <7>[    6.232725] [drm:amdgpu_ih_process [amdgpu]] =
amdgpu_ih_process: rptr 512, wptr 544
> [2022-01-06 16:27:48] <3>[    6.429974] amdgpu 0000:00:05.0: [drm:amdgpu_=
ring_test_helper [amdgpu]] *ERROR* ring kiq_2.1.0 test failed (-110)
> [2022-01-06 16:27:48] <7>[    6.430167] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] kiq size after test: 0
> [2022-01-06 16:27:48] <3>[    6.430353] [drm:amdgpu_gfx_enable_kcq.cold [=
amdgpu]] *ERROR* KCQ enable failed
> [2022-01-06 16:27:48] <3>[    6.430532] [drm:amdgpu_device_init.cold [amd=
gpu]] *ERROR* hw_init of IP block <gfx_v9_0> failed -110
> [2022-01-06 16:27:48] <3>[    6.430720] amdgpu 0000:00:05.0: amdgpu: amdg=
pu_device_ip_init failed
>
>
>
>
> As a sidenote, my warning on ring_alloc() being called twice without
> commiting or undoing [1] gets triggered.  Given the call chain it looks
> like this would happen in the previous usage of that ring, would have to
> dig deeper to understand that.  Unless I'm missing something and this wou=
ld
> be legal ?

I don't remember off hand.

Alex

>
> [2022-01-06 15:52:17] <4>[    5.929158] ------------[ cut here ]---------=
---
> [2022-01-06 15:52:17] <4>[    5.929170] WARNING: CPU: 1 PID: 458 at drive=
rs/gpu/drm/amd/amdgpu/amdgpu_ring.c:74 amdgpu_ring_alloc+0x62/0x70 [amdgpu]
> [2022-01-06 15:52:17] <4>[    5.929323] Modules linked in: ip6table_filte=
r ip6table_mangle joydev ip6table_raw ip6_tables ipt_REJECT nf_reject_ipv4 =
xt_state xt_conntrack iptable_filter iptable_mangle iptable_raw xt_MASQUERA=
DE iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 intel_rapl=
_msr intel_rapl_common crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clm=
ulni_intel amdgpu(+) iommu_v2 gpu_sched i2c_algo_bit drm_ttm_helper ttm drm=
_kms_helper ehci_pci cec pcspkr ehci_hcd i2c_piix4 serio_raw ata_generic pa=
ta_acpi xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen=
_gntalloc xen_blkback fuse drm xen_evtchn bpf_preload ip_tables overlay xen=
_blkfront
> [2022-01-06 15:52:17] <4>[    5.929458] CPU: 1 PID: 458 Comm: sdma0 Not t=
ainted 5.15.4-1.fc32.qubes.x86_64+ #8
> [2022-01-06 15:52:17] <4>[    5.929474] Hardware name: Xen HVM domU, BIOS=
 4.14.3 01/03/2022
> [2022-01-06 15:52:17] <4>[    5.929487] RIP: 0010:amdgpu_ring_alloc+0x62/=
0x70 [amdgpu]
> [2022-01-06 15:52:17] <4>[    5.929628] Code: 87 28 02 00 00 48 8b 82 b8 =
00 00 00 48 85 c0 74 05 e8 b2 ae 90 ee 44 89 e0 41 5c c3 0f 0b 41 bc f4 ff =
ff ff 44 89 e0 41 5c c3 <0f> 0b 48 8b 57 08 eb bc 66 0f 1f 44 00 00 0f 1f 4=
4 00 00 85 f6 0f
> [2022-01-06 15:52:17] <4>[    5.929667] RSP: 0018:ffffb129005f3dd8 EFLAGS=
: 00010206
> [2022-01-06 15:52:17] <4>[    5.929678] RAX: 0000000000000060 RBX: ffff96=
209112d230 RCX: 0000000000000050
> [2022-01-06 15:52:17] <4>[    5.929693] RDX: ffffffffc0ac6c60 RSI: 000000=
000000006d RDI: ffff96208c5eb8f8
> [2022-01-06 15:52:17] <4>[    5.929707] RBP: ffff96209112d000 R08: ffffb1=
29005f3e50 R09: ffff96208c5eba98
> [2022-01-06 15:52:17] <4>[    5.929722] R10: 0000000000000000 R11: 000000=
0000000001 R12: ffff962090a0c780
> [2022-01-06 15:52:17] <4>[    5.929736] R13: 0000000000000001 R14: ffff96=
208c5eb8f8 R15: ffff96208c5eb970
> [2022-01-06 15:52:17] <4>[    5.929752] FS:  0000000000000000(0000) GS:ff=
ff9620bcd00000(0000) knlGS:0000000000000000
> [2022-01-06 15:52:17] <4>[    5.929768] CS:  0010 DS: 0000 ES: 0000 CR0: =
0000000080050033
> [2022-01-06 15:52:17] <4>[    5.929781] CR2: 00007c1130d0f860 CR3: 000000=
00040c4000 CR4: 0000000000350ee0
> [2022-01-06 15:52:17] <4>[    5.929797] Call Trace:
> [2022-01-06 15:52:17] <4>[    5.929805]  <TASK>
> [2022-01-06 15:52:17] <4>[    5.929812]  amdgpu_ib_schedule+0xa9/0x540 [a=
mdgpu]
> [2022-01-06 15:52:17] <4>[    5.929956]  ? _raw_spin_unlock_irqrestore+0x=
a/0x20
> [2022-01-06 15:52:17] <4>[    5.929969]  amdgpu_job_run+0xce/0x1f0 [amdgp=
u]
> [2022-01-06 15:52:17] <4>[    5.930131]  drm_sched_main+0x300/0x500 [gpu_=
sched]
> [2022-01-06 15:52:17] <4>[    5.930146]  ? finish_wait+0x80/0x80
> [2022-01-06 15:52:17] <4>[    5.930156]  ? drm_sched_rq_select_entity+0xa=
0/0xa0 [gpu_sched]
> [2022-01-06 15:52:17] <4>[    5.930171]  kthread+0x127/0x150
> [2022-01-06 15:52:17] <4>[    5.930181]  ? set_kthread_struct+0x40/0x40
> [2022-01-06 15:52:17] <4>[    5.930192]  ret_from_fork+0x22/0x30
> [2022-01-06 15:52:17] <4>[    5.930203]  </TASK>
> [2022-01-06 15:52:17] <4>[    5.930208] ---[ end trace cf0edb400b0116c7 ]=
---
>
>
> [1] https://github.com/ydirson/linux/commit/4a010943e74d6bf621bd9e72a7620=
a65af23ecc9
> [2] https://github.com/ydirson/linux/commit/e90230e008ce204d822f07e36b3c3=
e196d561c28
>
> >
> >
> >
> > >
> > > > > >
> > > > > > > ... which brings me to a point that's been puzzling me for
> > > > > > > some
> > > > > > > time, which is
> > > > > > > that as the hw init fails, the efifb driver is still using
> > > > > > > the
> > > > > > > framebuffer.
> > > > > >
> > > > > > No, it isn't. You are probably just still seeing the same
> > > > > > screen.
> > > > > >
> > > > > > The issue is most likely that while efi was kicked out nobody
> > > > > > re-programmed the display hardware to show something
> > > > > > different.
> > > > > >
> > > > > > > Am I right in suspecting that efifb should get stripped of
> > > > > > > its
> > > > > > > ownership of the
> > > > > > > fb aperture first, and that if I don't get a black screen
> > > > > > > on
> > > > > > > hw_init failure
> > > > > > > that issue should be the first focus point ?
> > > > > >
> > > > > > You assumption with the black screen is incorrect. Since the
> > > > > > hardware
> > > > > > works independent even if you kick out efi you still have the
> > > > > > same
> > > > > > screen content, you just can't update it anymore.
> > > > >
> > > > > It's not only that the screen keeps its contents, it's that the
> > > > > dom0
> > > > > happily continues updating it.
> > > >
> > > > If the hypevisor is using efifb, then yes that could be a problem
> > > > as
> > > > the hypervisor could be writing to the efifb resources which ends
> > > > up
> > > > writing to the same physical memory.  That applies to any GPU on
> > > > a
> > > > UEFI system.  You'll need to make sure efifb is not in use in the
> > > > hypervisor.
>
> > >
> > > That remark evokes several things to me.  First one is that every
> > > time
> > > I've tried booting with efifb disabled in dom0, there was no
> > > visible
> > > improvements in the guest driver - i.i. I really have to dig how
> > > vram mapping
> > > is performed and check things are as expected anyway.
> >
> > Ultimately you end up at the same physical memory.  efifb uses the
> > PCI
> > BAR which points to the same physical memory that the driver directly
> > maps.
> >
> > >
> > > The other is that, when dom0 cannot use efifb, entering a luks key
> > > is
> > > suddenly less user-friendly.  But in theory I'd think we could
> > > overcome
> > > this by letting dom0 use efifb until ready to start the guest, a
> > > simple
> > > driver unbind at the right moment should be expected to work, right
> > > ?
> > > Going further and allowing the guest to use efifb on its own could
> > > possibly be more tricky (starting with a different state?) but does
> > > not seem to sound completely outlandish either - or does it ?
> > >
> >
> > efifb just takes whatever hardware state the GOP driver in the pre-OS
> > environment left the GPU in.  Once you have a driver loaded in the
> > OS,
> > that state is gone so I I don't see much value in using efifb once
> > you
> > have a real driver in the mix.  If you want a console on the host,
> > it's probably better to use 2 GPU or just load the real driver as
> > needed in both the host and guest.
> >
> > > >
> > > > Alex
> > > >
> > > >
> > > > >
> > > > > > But putting efi asside what Alex pointed out pretty much
> > > > > > breaks
> > > > > > your
> > > > > > neck trying to forward the device. You maybe could try to
> > > > > > hack
> > > > > > the
> > > > > > driver to use the PCIe BAR for framebuffer access, but that
> > > > > > might
> > > > > > be
> > > > > > quite a bit slower.
> > > > > >
> > > > > > Regards,
> > > > > > Christian.
> > > > > >
> > > > > > >
> > > > > > >> Alex
> > > > > > >>
> > > > > > >> On Mon, Dec 13, 2021 at 3:29 PM Alex Deucher
> > > > > > >> <alexdeucher@gmail.com>
> > > > > > >> wrote:
> > > > > > >>> On Sun, Dec 12, 2021 at 5:19 PM Yann Dirson
> > > > > > >>> <ydirson@free.fr>
> > > > > > >>> wrote:
> > > > > > >>>> Alex wrote:
> > > > > > >>>>> On Mon, Dec 6, 2021 at 4:36 PM Yann Dirson
> > > > > > >>>>> <ydirson@free.fr>
> > > > > > >>>>> wrote:
> > > > > > >>>>>> Hi Alex,
> > > > > > >>>>>>
> > > > > > >>>>>>> We have not validated virtualization of our
> > > > > > >>>>>>> integrated
> > > > > > >>>>>>> GPUs.  I
> > > > > > >>>>>>> don't
> > > > > > >>>>>>> know that it will work at all.  We had done a bit of
> > > > > > >>>>>>> testing but
> > > > > > >>>>>>> ran
> > > > > > >>>>>>> into the same issues with the PSP, but never had a
> > > > > > >>>>>>> chance
> > > > > > >>>>>>> to
> > > > > > >>>>>>> debug
> > > > > > >>>>>>> further because this feature is not productized.
> > > > > > >>>>>> ...
> > > > > > >>>>>>> You need a functional PSP to get the GPU driver up
> > > > > > >>>>>>> and
> > > > > > >>>>>>> running.
> > > > > > >>>>>> Ah, thanks for the hint :)
> > > > > > >>>>>>
> > > > > > >>>>>> I guess that if I want to have any chance to get the
> > > > > > >>>>>> PSP
> > > > > > >>>>>> working
> > > > > > >>>>>> I'm
> > > > > > >>>>>> going to need more details on it.  A quick search some
> > > > > > >>>>>> time
> > > > > > >>>>>> ago
> > > > > > >>>>>> mostly
> > > > > > >>>>>> brought reverse-engineering work, rather than official
> > > > > > >>>>>> AMD
> > > > > > >>>>>> doc.
> > > > > > >>>>>>   Are
> > > > > > >>>>>> there some AMD resources I missed ?
> > > > > > >>>>> The driver code is pretty much it.
> > > > > > >>>> Let's try to shed some more light on how things work,
> > > > > > >>>> taking
> > > > > > >>>> as
> > > > > > >>>> excuse
> > > > > > >>>> psp_v12_0_ring_create().
> > > > > > >>>>
> > > > > > >>>> First, register access through [RW]REG32_SOC15() is
> > > > > > >>>> implemented
> > > > > > >>>> in
> > > > > > >>>> terms of __[RW]REG32_SOC15_RLC__(), which is basically a
> > > > > > >>>> [RW]REG32(),
> > > > > > >>>> except it has to be more complex in the SR-IOV case.
> > > > > > >>>> Has the RLC anything to do with SR-IOV ?
> > > > > > >>> When running the driver on a SR-IOV virtual function
> > > > > > >>> (VF),
> > > > > > >>> some
> > > > > > >>> registers are not available directly via the VF's MMIO
> > > > > > >>> aperture
> > > > > > >>> so
> > > > > > >>> they need to go through the RLC.  For bare metal or
> > > > > > >>> passthrough
> > > > > > >>> this
> > > > > > >>> is not relevant.
> > > > > > >>>
> > > > > > >>>> It accesses registers in the MMIO range of the MP0 IP,
> > > > > > >>>> and
> > > > > > >>>> the
> > > > > > >>>> "MP0"
> > > > > > >>>> name correlates highly with MMIO accesses in
> > > > > > >>>> PSP-handling
> > > > > > >>>> code.
> > > > > > >>>> Is "MP0" another name for PSP (and "MP1" for SMU) ?  The
> > > > > > >>>> MP0
> > > > > > >>>> version
> > > > > > >>> Yes.
> > > > > > >>>
> > > > > > >>>> reported at v11.0.3 by discovery seems to contradict the
> > > > > > >>>> use
> > > > > > >>>> of
> > > > > > >>>> v12.0
> > > > > > >>>> for RENOIR as set by soc15_set_ip_blocks(), or do I miss
> > > > > > >>>> something ?
> > > > > > >>> Typo in the ip discovery table on renoir.
> > > > > > >>>
> > > > > > >>>> More generally (and mostly out of curiosity while we're
> > > > > > >>>> at
> > > > > > >>>> it),
> > > > > > >>>> do we
> > > > > > >>>> have a way to match IPs listed at discovery time with
> > > > > > >>>> the
> > > > > > >>>> ones
> > > > > > >>>> used
> > > > > > >>>> in the driver ?
> > > > > > >>> In general, barring typos, the code is shared at the
> > > > > > >>> major
> > > > > > >>> version
> > > > > > >>> level.  The actual code may or may not need changes to
> > > > > > >>> handle
> > > > > > >>> minor
> > > > > > >>> revision changes in an IP.  The driver maps the IP
> > > > > > >>> versions
> > > > > > >>> from
> > > > > > >>> the
> > > > > > >>> ip discovery table to the code contained in the driver.
> > > > > > >>>
> > > > > > >>>> ---
> > > > > > >>>>
> > > > > > >>>> As for the register names, maybe we could have a short
> > > > > > >>>> explanation of
> > > > > > >>>> how they are structured ?  Eg. mmMP0_SMN_C2PMSG_69: that
> > > > > > >>>> seems
> > > > > > >>>> to
> > > > > > >>>> be
> > > > > > >>>> a MMIO register named "C2PMSG_69" in the "MP0" IP, but
> > > > > > >>>> I'm
> > > > > > >>>> not
> > > > > > >>>> sure
> > > > > > >>>> of the "SMN" part -- that could refer to the "System
> > > > > > >>>> Management
> > > > > > >>>> Network",
> > > > > > >>>> described in [0] as an internal bus.  Are we accessing
> > > > > > >>>> this
> > > > > > >>>> register
> > > > > > >>>> through this SMN ?
> > > > > > >>> These registers are just mailboxes for the PSP firmware.
> > > > > > >>>  All
> > > > > > >>> of
> > > > > > >>> the
> > > > > > >>> C2PMSG registers functionality is defined by the PSP
> > > > > > >>> firmware.
> > > > > > >>>   They
> > > > > > >>> are basically scratch registers used to communicate
> > > > > > >>> between
> > > > > > >>> the
> > > > > > >>> driver
> > > > > > >>> and the PSP firmware.
> > > > > > >>>
> > > > > > >>>>
> > > > > > >>>>>   On APUs, the PSP is shared with
> > > > > > >>>>> the CPU and the rest of the platform.  The GPU driver
> > > > > > >>>>> just
> > > > > > >>>>> interacts
> > > > > > >>>>> with it for a few specific tasks:
> > > > > > >>>>> 1. Loading Trusted Applications (e.g., trusted firmware
> > > > > > >>>>> applications
> > > > > > >>>>> that run on the PSP for specific functionality, e.g.,
> > > > > > >>>>> HDCP
> > > > > > >>>>> and
> > > > > > >>>>> content
> > > > > > >>>>> protection, etc.)
> > > > > > >>>>> 2. Validating and loading firmware for other engines on
> > > > > > >>>>> the
> > > > > > >>>>> SoC.
> > > > > > >>>>>   This
> > > > > > >>>>> is required to use those engines.
> > > > > > >>>> Trying to understand in more details how we start the
> > > > > > >>>> PSP
> > > > > > >>>> up, I
> > > > > > >>>> noticed
> > > > > > >>>> that psp_v12_0 has support for loading a sOS firmware,
> > > > > > >>>> but
> > > > > > >>>> never
> > > > > > >>>> calls
> > > > > > >>>> init_sos_microcode() - and anyway there is no sos
> > > > > > >>>> firmware
> > > > > > >>>> for
> > > > > > >>>> renoir
> > > > > > >>>> and green_sardine, which seem to be the only ASICs with
> > > > > > >>>> this
> > > > > > >>>> PSP
> > > > > > >>>> version.
> > > > > > >>>> Is it something that's just not been completely wired up
> > > > > > >>>> yet
> > > > > > >>>> ?
> > > > > > >>> On APUs, the PSP is shared with the CPU so the PSP
> > > > > > >>> firmware
> > > > > > >>> is
> > > > > > >>> part
> > > > > > >>> of
> > > > > > >>> the sbios image.  The driver doesn't load it.  We only
> > > > > > >>> load
> > > > > > >>> it on
> > > > > > >>> dGPUs where the driver is responsible for the chip
> > > > > > >>> initialization.
> > > > > > >>>
> > > > > > >>>> That also rings a bell, that we have nothing about
> > > > > > >>>> Secure OS
> > > > > > >>>> in
> > > > > > >>>> the doc
> > > > > > >>>> yet (not even the acronym in the glossary).
> > > > > > >>>>
> > > > > > >>>>
> > > > > > >>>>> I'm not too familiar with the PSP's path to memory from
> > > > > > >>>>> the
> > > > > > >>>>> GPU
> > > > > > >>>>> perspective.  IIRC, most memory used by the PSP goes
> > > > > > >>>>> through
> > > > > > >>>>> carve
> > > > > > >>>>> out
> > > > > > >>>>> "vram" on APUs so it should work, but I would double
> > > > > > >>>>> check
> > > > > > >>>>> if
> > > > > > >>>>> there
> > > > > > >>>>> are any system memory allocations that used to interact
> > > > > > >>>>> with
> > > > > > >>>>> the PSP
> > > > > > >>>>> and see if changing them to vram helps.  It does work
> > > > > > >>>>> with
> > > > > > >>>>> the
> > > > > > >>>>> IOMMU
> > > > > > >>>>> enabled on bare metal, so it should work in passthrough
> > > > > > >>>>> as
> > > > > > >>>>> well
> > > > > > >>>>> in
> > > > > > >>>>> theory.
> > > > > > >>>> I can see a single case in the PSP code where GTT is
> > > > > > >>>> used
> > > > > > >>>> instead
> > > > > > >>>> of
> > > > > > >>>> vram: to create fw_pri_bo when SR-IOV is not used (and
> > > > > > >>>> there
> > > > > > >>>> has
> > > > > > >>>> to be a reason, since the SR-IOV code path does use
> > > > > > >>>> vram).
> > > > > > >>>> Changing it to vram does not make a difference, but then
> > > > > > >>>> the
> > > > > > >>>> only bo that seems to be used at that point is the one
> > > > > > >>>> for
> > > > > > >>>> the
> > > > > > >>>> psp ring,
> > > > > > >>>> which is allocated in vram, so I'm not too much
> > > > > > >>>> surprised.
> > > > > > >>>>
> > > > > > >>>> Maybe I should double-check bo_create calls to hunt for
> > > > > > >>>> more
> > > > > > >>>> ?
> > > > > > >>> We looked into this a bit ourselves and ran into the same
> > > > > > >>> issues.
> > > > > > >>> We'd probably need to debug this with the PSP team to
> > > > > > >>> make
> > > > > > >>> further
> > > > > > >>> progress, but this was not productized so neither team
> > > > > > >>> had
> > > > > > >>> the
> > > > > > >>> resources to delve further.
> > > > > > >>>
> > > > > > >>> Alex
> > > > > > >>>
> > > > > > >>>>
> > > > > > >>>> [0]
> > > > > > >>>> https://github.com/PSPReverse/psp-docs/blob/master/mastert=
hesis-eichner-psp-2020.pdf
> > > > > >
> > > > > >
> > > >
> >
