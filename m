Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACF8149065
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Jan 2020 22:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE0772BCF;
	Fri, 24 Jan 2020 21:47:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1547972BCF
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Jan 2020 21:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579902420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZ8/zoD2YUAatRXIds3tRZvWL8s5JZzo0G1GptJguZ8=;
 b=K2V58tBhk7Bh/L/e0zOnA4gxk0yMeLJO90wTs6BaeSKj9iGeBVr4SJqHtYF1/HFYWjpvcV
 ZogRGvjBZvV2Ilz6TRQpQ5IRMgKzEiRT65wxRTM7A3iZVzDJU1BPNh4kcZHmLZtzUhERuv
 h7WzYpXm1Lzo43Rw6zpuWGBTa8V+uyw=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-wvrUknfvOimNYeZqIps8CA-1; Fri, 24 Jan 2020 16:46:55 -0500
Received: by mail-qt1-f198.google.com with SMTP id e8so2256769qtg.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Jan 2020 13:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CZ8/zoD2YUAatRXIds3tRZvWL8s5JZzo0G1GptJguZ8=;
 b=l8yq9OVJN/AsIqiN+M7IdXtLH5RGxBZDySy+sWVexJFtCAPqaGCEyfnETbbnQqiKDo
 wrM/qTfN/YrOEC2EdHG9+D6eTm7w5DG1T0xrUcIbxByfwhHjm50RUZIxZOIC5YSyZ8Zn
 bpJDc0ULRFXyO+E5GDB7Kym4pHTycRyinjRVc5wKQc9mKhAaUC+5/k7bfd0k2i8WXyM3
 QIlIeW75shi2ZF/vw/OvmoJyr1U5A9mLcShbcytJgYtpdTWizncLCklBwOagc5fcMZyQ
 ZoZQtq8epPMTFxPLlfpnOtuOmJmpaAzHbeZzDJuDKTNoe+OPcf1SUucTnHMOaF5F2uXs
 Oxxw==
X-Gm-Message-State: APjAAAV6osnXNP81J+BVY/iX/nvc1mCDtEq1Okkzmjm317LEdzmoWfgH
 6rYG9y4wUiUDeizaI80Z6xeXDcAZkgbo1SDte0TcLCN+LaObHwfv/rX+NHcEUiZMptF67hOpdhQ
 oKjNYXCfL9Kaw0fREBrjgDjeGLw==
X-Received: by 2002:ac8:44b0:: with SMTP id a16mr4617882qto.223.1579902414686; 
 Fri, 24 Jan 2020 13:46:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7dKs2yCh94xERYP14P9UE6uJoy0nxtmofQxaz6PAa3NG5The49XOOkqDkp2HcV6+6ZbLcRA==
X-Received: by 2002:ac8:44b0:: with SMTP id a16mr4617852qto.223.1579902414347; 
 Fri, 24 Jan 2020 13:46:54 -0800 (PST)
Received: from dhcp-10-20-1-90.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id p50sm4490834qtf.5.2020.01.24.13.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 13:46:53 -0800 (PST)
Message-ID: <8189d38480b6457efe2af94020c27e03c1f2de0a.camel@redhat.com>
Subject: Re: [PATCH v2] drm/amd/dm/mst: Ignore payload update failures
From: Lyude Paul <lyude@redhat.com>
To: Mikita Lipski <mlipski@amd.com>, amd-gfx@lists.freedesktop.org
Date: Fri, 24 Jan 2020 16:46:52 -0500
In-Reply-To: <abc8346d-2b27-7f8f-a54d-9f22cba82b84@amd.com>
References: <20200124000643.99859-1-lyude@redhat.com>
 <20200124191047.120064-1-lyude@redhat.com>
 <abc8346d-2b27-7f8f-a54d-9f22cba82b84@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31)
MIME-Version: 1.0
X-MC-Unique: wvrUknfvOimNYeZqIps8CA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "David \(ChunMing\)
 Zhou" <David1.Zhou@amd.com>, Martin Tsai <martin.tsai@amd.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alvin Lee <alvin.lee2@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jean Delvare <jdelvare@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, 2020-01-24 at 14:20 -0500, Mikita Lipski wrote:
> On 1/24/20 2:10 PM, Lyude Paul wrote:
> > Disabling a display on MST can potentially happen after the entire MST
> > topology has been removed, which means that we can't communicate with
> > the topology at all in this scenario. Likewise, this also means that we
> > can't properly update payloads on the topology and as such, it's a good
> > idea to ignore payload update failures when disabling displays.
> > Currently, amdgpu makes the mistake of halting the payload update
> > process when any payload update failures occur, resulting in leaving
> > DC's local copies of the payload tables out of date.
> > 
> > This ends up causing problems with hotplugging MST topologies, and
> > causes modesets on the second hotplug to fail like so:
> > 
> > [drm] Failed to updateMST allocation table forpipe idx:1
> > ------------[ cut here ]------------
> > WARNING: CPU: 5 PID: 1511 at
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2677
> > update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
> > Modules linked in: cdc_ether usbnet fuse xt_conntrack nf_conntrack
> > nf_defrag_ipv6 libcrc32c nf_defrag_ipv4 ipt_REJECT nf_reject_ipv4
> > nft_counter nft_compat nf_tables nfnetlink tun bridge stp llc sunrpc
> > vfat fat wmi_bmof uvcvideo snd_hda_codec_realtek snd_hda_codec_generic
> > snd_hda_codec_hdmi videobuf2_vmalloc snd_hda_intel videobuf2_memops
> > videobuf2_v4l2 snd_intel_dspcfg videobuf2_common crct10dif_pclmul
> > snd_hda_codec videodev crc32_pclmul snd_hwdep snd_hda_core
> > ghash_clmulni_intel snd_seq mc joydev pcspkr snd_seq_device snd_pcm
> > sp5100_tco k10temp i2c_piix4 snd_timer thinkpad_acpi ledtrig_audio snd
> > wmi soundcore video i2c_scmi acpi_cpufreq ip_tables amdgpu(O)
> > rtsx_pci_sdmmc amd_iommu_v2 gpu_sched mmc_core i2c_algo_bit ttm
> > drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec drm
> > crc32c_intel serio_raw hid_multitouch r8152 mii nvme r8169 nvme_core
> > rtsx_pci pinctrl_amd
> > CPU: 5 PID: 1511 Comm: gnome-shell Tainted: G           O      5.5.0-
> > rc7Lyude-Test+ #4
> > Hardware name: LENOVO FA495SIT26/FA495SIT26, BIOS R12ET22W(0.22 )
> > 01/31/2019
> > RIP: 0010:update_mst_stream_alloc_table+0x11e/0x130 [amdgpu]
> > Code: 28 00 00 00 75 2b 48 8d 65 e0 5b 41 5c 41 5d 41 5e 5d c3 0f b6 06
> > 49 89 1c 24 41 88 44 24 08 0f b6 46 01 41 88 44 24 09 eb 93 <0f> 0b e9
> > 2f ff ff ff e8 a6 82 a3 c2 66 0f 1f 44 00 00 0f 1f 44 00
> > RSP: 0018:ffffac428127f5b0 EFLAGS: 00010202
> > RAX: 0000000000000002 RBX: ffff8d1e166eee80 RCX: 0000000000000000
> > RDX: ffffac428127f668 RSI: ffff8d1e166eee80 RDI: ffffac428127f610
> > RBP: ffffac428127f640 R08: ffffffffc03d94a8 R09: 0000000000000000
> > R10: ffff8d1e24b02000 R11: ffffac428127f5b0 R12: ffff8d1e1b83d000
> > R13: ffff8d1e1bea0b08 R14: 0000000000000002 R15: 0000000000000002
> > FS:  00007fab23ffcd80(0000) GS:ffff8d1e28b40000(0000)
> > knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 00007f151f1711e8 CR3: 00000005997c0000 CR4: 00000000003406e0
> > Call Trace:
> >   ? mutex_lock+0xe/0x30
> >   dc_link_allocate_mst_payload+0x9a/0x210 [amdgpu]
> >   ? dm_read_reg_func+0x39/0xb0 [amdgpu]
> >   ? core_link_enable_stream+0x656/0x730 [amdgpu]
> >   core_link_enable_stream+0x656/0x730 [amdgpu]
> >   dce110_apply_ctx_to_hw+0x58e/0x5d0 [amdgpu]
> >   ? dcn10_verify_allow_pstate_change_high+0x1d/0x280 [amdgpu]
> >   ? dcn10_wait_for_mpcc_disconnect+0x3c/0x130 [amdgpu]
> >   dc_commit_state+0x292/0x770 [amdgpu]
> >   ? add_timer+0x101/0x1f0
> >   ? ttm_bo_put+0x1a1/0x2f0 [ttm]
> >   amdgpu_dm_atomic_commit_tail+0xb59/0x1ff0 [amdgpu]
> >   ? amdgpu_move_blit.constprop.0+0xb8/0x1f0 [amdgpu]
> >   ? amdgpu_bo_move+0x16d/0x2b0 [amdgpu]
> >   ? ttm_bo_handle_move_mem+0x118/0x570 [ttm]
> >   ? ttm_bo_validate+0x134/0x150 [ttm]
> >   ? dm_plane_helper_prepare_fb+0x1b9/0x2a0 [amdgpu]
> >   ? _cond_resched+0x15/0x30
> >   ? wait_for_completion_timeout+0x38/0x160
> >   ? _cond_resched+0x15/0x30
> >   ? wait_for_completion_interruptible+0x33/0x190
> >   commit_tail+0x94/0x130 [drm_kms_helper]
> >   drm_atomic_helper_commit+0x113/0x140 [drm_kms_helper]
> >   drm_atomic_helper_set_config+0x70/0xb0 [drm_kms_helper]
> >   drm_mode_setcrtc+0x194/0x6a0 [drm]
> >   ? _cond_resched+0x15/0x30
> >   ? mutex_lock+0xe/0x30
> >   ? drm_mode_getcrtc+0x180/0x180 [drm]
> >   drm_ioctl_kernel+0xaa/0xf0 [drm]
> >   drm_ioctl+0x208/0x390 [drm]
> >   ? drm_mode_getcrtc+0x180/0x180 [drm]
> >   amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> >   do_vfs_ioctl+0x458/0x6d0
> >   ksys_ioctl+0x5e/0x90
> >   __x64_sys_ioctl+0x16/0x20
> >   do_syscall_64+0x55/0x1b0
> >   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > RIP: 0033:0x7fab2121f87b
> > Code: 0f 1e fa 48 8b 05 0d 96 2c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff
> > ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01
> > f0 ff ff 73 01 c3 48 8b 0d dd 95 2c 00 f7 d8 64 89 01 48
> > RSP: 002b:00007ffd045f9068 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 00007ffd045f90a0 RCX: 00007fab2121f87b
> > RDX: 00007ffd045f90a0 RSI: 00000000c06864a2 RDI: 000000000000000b
> > RBP: 00007ffd045f90a0 R08: 0000000000000000 R09: 000055dbd2985d10
> > R10: 000055dbd2196280 R11: 0000000000000246 R12: 00000000c06864a2
> > R13: 000000000000000b R14: 0000000000000000 R15: 000055dbd2196280
> > ---[ end trace 6ea888c24d2059cd ]---
> > 
> > Note as well, I have only been able to reproduce this on setups with 2
> > MST displays.
> > 
> > Changes since v1:
> > * Don't return false when part 1 or part 2 of updating the payloads
> >    fails, we don't want to abort at any step of the process even if
> >    things fail
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Acked-by: Harry Wentland <harry.wentland@amd.com>
> > Cc: stable@vger.kernel.org
> > ---
> >   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 13 ++++---------
> >   1 file changed, 4 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > index 069b7a6f5597..318b474ff20e 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> > @@ -216,7 +216,8 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
> >   		drm_dp_mst_reset_vcpi_slots(mst_mgr, mst_port);
> >   	}
> >   
> > -	ret = drm_dp_update_payload_part1(mst_mgr);
> > +	/* It's OK for this to fail */
> > +	drm_dp_update_payload_part1(mst_mgr);
> >   
> >   	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
> >   	 * AUX message. The sequence is slot 1-63 allocated sequence for each
> > @@ -225,9 +226,6 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
> >   
> >   	get_payload_table(aconnector, proposed_table);
> >   
> > -	if (ret)
> > -		return false;
> > -
> 
> Sorry for being picky, but I think this might cause compilation error on 
> some systems for having unused variable (int ret). Its better just to 
> strip out both ret integer declarations.

No problem! It wouldn't be fair if I was the only one who got to be picky
anyway ;)

> 
> Otherwise the patch is good. Thanks again!
> 
> Reviewed-by: Mikita Lipski <Mikita.Lipski@amd.com>
> 
> Mikita
> 
> >   	return true;
> >   }
> >   
> > @@ -285,7 +283,6 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >   	struct amdgpu_dm_connector *aconnector;
> >   	struct drm_dp_mst_topology_mgr *mst_mgr;
> >   	struct drm_dp_mst_port *mst_port;
> > -	int ret;
> >   
> >   	aconnector = (struct amdgpu_dm_connector *)stream->dm_stream_context;
> >   
> > @@ -299,10 +296,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
> >   	if (!mst_mgr->mst_state)
> >   		return false;
> >   
> > -	ret = drm_dp_update_payload_part2(mst_mgr);
> > -
> > -	if (ret)
> > -		return false;
> > +	/* It's OK for this to fail */
> > +	drm_dp_update_payload_part2(mst_mgr);
> >   
> >   	if (!enable)
> >   		drm_dp_mst_deallocate_vcpi(mst_mgr, mst_port);
> > 
-- 
Cheers,
	Lyude Paul

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
