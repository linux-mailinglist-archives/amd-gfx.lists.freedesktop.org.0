Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2187C78ED4B
	for <lists+amd-gfx@lfdr.de>; Thu, 31 Aug 2023 14:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CBD10E66C;
	Thu, 31 Aug 2023 12:37:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC0F10E5EA;
 Thu, 31 Aug 2023 10:29:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A488161DAB;
 Thu, 31 Aug 2023 10:29:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6983C433C8;
 Thu, 31 Aug 2023 10:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1693477771;
 bh=n7XYpIoHtsPh4F6mWsyvz+3exvdD3VfOyzPPO2/fitM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WuA+2Iosw1DQs+PoFXGFko8jwHKSI3h1oeTi5cBhek9Oyxe+we8A/f9ECLXbdeGE9
 chnEyE8pNABYeqz93OH3H7qabj5soQnhGrsof04IE7umrdypNmFoFfUZi6u5x0LBa5
 OKdnJjXl2GAvo1m9PvgcYxENaSVuObPM5g4ax+Eo=
Date: Thu, 31 Aug 2023 12:29:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH AUTOSEL 5.10 13/22] drm/amdgpu: install stub fence into
 potential unused fence pointers
Message-ID: <2023083119-phoney-ascend-d4ec@gregkh>
References: <20230724012419.2317649-1-sashal@kernel.org>
 <20230724012419.2317649-13-sashal@kernel.org>
 <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7RTgAMBLHbwtp4zgiBSDrTFtAj07k5qMzkuLQy2Zr+sZA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 31 Aug 2023 12:37:37 +0000
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org, Lang Yu <Lang.Yu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 11:53:29AM -0700, Chia-I Wu wrote:
> On Sun, Jul 23, 2023 at 6:24 PM Sasha Levin <sashal@kernel.org> wrote:
> >
> > From: Lang Yu <Lang.Yu@amd.com>
> >
> > [ Upstream commit 187916e6ed9d0c3b3abc27429f7a5f8c936bd1f0 ]
> >
> > When using cpu to update page tables, vm update fences are unused.
> > Install stub fence into these fence pointers instead of NULL
> > to avoid NULL dereference when calling dma_fence_wait() on them.
> >
> > Suggested-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> We start getting this warning spew on chromeos, likely from
> dma_fence_is_later because the stub fence is on a different timeline:
> 
> [  273.334767] WARNING: CPU: 1 PID: 13383 at
> include/linux/dma-fence.h:478 amdgpu_sync_keep_later+0x95/0xbd
> [  273.334769] Modules linked in: snd_seq_dummy snd_seq snd_seq_device
> bridge stp llc tun vhost_vsock vhost vhost_iotlb
> vmw_vsock_virtio_transport_common vsock 8021q veth lzo_rle
> lzo_compress zram uinput snd_acp_sof_mach snd_acp_mach snd_soc_dmic
> xt_cgroup rfcomm xt_MASQUERADE cmac algif_hash algif_skcipher af_alg
> btusb btrtl btintel btbcm rtw89_8852ae rtw89_pci rtw89_8852a
> rtw89_core snd_sof_amd_renoir snd_sof_xtensa_dsp snd_sof_amd_acp
> snd_acp_pci snd_acp_config snd_soc_acpi snd_pci_acp3x snd_sof_pci
> snd_sof snd_hda_codec_hdmi snd_sof_utils snd_hda_intel mac80211
> snd_intel_dspcfg snd_hda_codec cros_ec_typec snd_hwdep roles
> snd_hda_core typec snd_soc_rt5682s snd_soc_rt1019 snd_soc_rl6231
> ip6table_nat i2c_piix4 fuse bluetooth ecdh_generic ecc cfg80211
> iio_trig_sysfs cros_ec_lid_angle cros_ec_sensors cros_ec_sensors_core
> industrialio_triggered_buffer kfifo_buf industrialio cros_ec_sensorhub
> r8153_ecm cdc_ether usbnet r8152 mii uvcvideo videobuf2_vmalloc
> videobuf2_memops videobuf2_v4l2
> [  273.334795]  videobuf2_common joydev
> [  273.334799] CPU: 1 PID: 13383 Comm: chrome:cs0 Tainted: G        W
>        5.10.192-23384-g3d3f0f0c5e4f #1
> fe1e7e3b7510aa7b8e01701478119255f825a36f
> [  273.334800] Hardware name: Google Dewatt/Dewatt, BIOS
> Google_Dewatt.14500.347.0 03/30/2023
> [  273.334802] RIP: 0010:amdgpu_sync_keep_later+0x95/0xbd
> [  273.334804] Code: 00 00 b8 01 00 00 00 f0 0f c1 43 38 85 c0 74 26
> 8d 48 01 09 c1 78 24 49 89 1e 5b 41 5e 5d c3 cc cc cc cc e8 4a 94 ac
> ff eb ce <0f> 0b 49 8b 06 48 85 c0 75 af eb c2 be 02 00 00 00 48 8d 7b
> 38 e8
> [  273.334805] RSP: 0018:ffffb222c1817b50 EFLAGS: 00010293
> [  273.334807] RAX: ffffffff89bfc838 RBX: ffff8aa425e9ed00 RCX: 0000000000000000
> [  273.334808] RDX: ffff8aa426156a98 RSI: ffff8aa425e9ed00 RDI: ffff8aa432518918
> [  273.334810] RBP: ffffb222c1817b60 R08: ffff8aa43ca6c0a0 R09: ffff8aa33af3c9a0
> [  273.334811] R10: fffffcf8c5986600 R11: ffffffff87a00fce R12: 0000000000000098
> [  273.334812] R13: 00000000005e2a00 R14: ffff8aa432518918 R15: 0000000000000000
> [  273.334814] FS:  00007e70f8694640(0000) GS:ffff8aa4e6080000(0000)
> knlGS:0000000000000000
> [  273.334816] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  273.334817] CR2: 00007e70ea049020 CR3: 0000000178e6e000 CR4: 0000000000750ee0
> [  273.334818] PKRU: 55555554
> [  273.334819] Call Trace:
> [  273.334822]  ? __warn+0xa3/0x131
> [  273.334824]  ? amdgpu_sync_keep_later+0x95/0xbd
> [  273.334826]  ? report_bug+0x97/0xfa
> [  273.334829]  ? handle_bug+0x41/0x66
> [  273.334832]  ? exc_invalid_op+0x1b/0x72
> [  273.334835]  ? asm_exc_invalid_op+0x12/0x20
> [  273.334837]  ? native_sched_clock+0x9a/0x9a
> [  273.334840]  ? amdgpu_sync_keep_later+0x95/0xbd
> [  273.334843]  amdgpu_sync_vm_fence+0x23/0x39
> [  273.334846]  amdgpu_cs_ioctl+0x1782/0x1e56
> [  273.334851]  ? amdgpu_cs_report_moved_bytes+0x5f/0x5f
> [  273.334854]  drm_ioctl_kernel+0xdf/0x150
> [  273.334858]  drm_ioctl+0x1f5/0x3d2
> [  273.334928]  ? amdgpu_cs_report_moved_bytes+0x5f/0x5f
> [  273.334932]  amdgpu_drm_ioctl+0x49/0x81
> [  273.334935]  __x64_sys_ioctl+0x7d/0xc8
> [  273.334937]  do_syscall_64+0x42/0x54
> [  273.334939]  entry_SYSCALL_64_after_hwframe+0x4a/0xaf
> [  273.334941] RIP: 0033:0x7e70ff797649
> [  273.334943] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10
> c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00
> 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1d 48 8b 45 c8 64 48 2b 04 25 28
> 00 00
> [  273.334945] RSP: 002b:00007e70f8693170 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  273.334947] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007e70ff797649
> [  273.334948] RDX: 00007e70f8693248 RSI: 00000000c0186444 RDI: 0000000000000013
> [  273.334950] RBP: 00007e70f86931c0 R08: 00007e70f8693350 R09: 00007e70f8693340
> [  273.334951] R10: 000000000000000a R11: 0000000000000246 R12: 00000000c0186444
> [  273.334952] R13: 00007e70f8693380 R14: 00007e70f8693248 R15: 0000000000000013
> [  273.334954] ---[ end trace fc066a0fcea39e8c ]---

Thanks, I'll go revert this now.

greg k-h
