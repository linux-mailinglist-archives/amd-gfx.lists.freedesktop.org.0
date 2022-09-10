Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A26405B5555
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Sep 2022 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6818D10E271;
	Mon, 12 Sep 2022 07:26:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606C210E145;
 Sat, 10 Sep 2022 06:27:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98AC360BED;
 Sat, 10 Sep 2022 06:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD12C433D6;
 Sat, 10 Sep 2022 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1662791235;
 bh=KVyLdf9+86lyaQ2gQRQI25T66/lAewKU1JSp++Y12cY=;
 h=Subject:To:Cc:From:Date:From;
 b=QJJqc9OPBA2gseoQO6VZGvAkC3UsVaC0Xk+7UttiP3LdRLEVY7HIyc5S18UZWpFOg
 YJ/Az766Z79JlvQ5MMi3Tmzxp+fs7vCkYENBoNXklaNieX8ccXJdcMPsepdvOfI4jA
 OlHCNQVzang8Qfg3WMqEeSLzB0ekDpF/qKzTorCQ=
Subject: Patch "drm/amd/display: fix memory leak when using debugfs_lookup()"
 has been added to the 5.19-stable tree
To: Jerry.Zuo@amd.com, Rodrigo.Siqueira@amd.com, Wayne.Lin@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, bhanuprakash.modem@intel.com,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com, hersenxs.wu@amd.com,
 jiapeng.chong@linux.alibaba.com, lyz_cs@pku.edu.cn, mikita.lipski@amd.com,
 patrik.r.jakobsson@gmail.com, seanpaul@chromium.org, sunpeng.li@amd.com,
 tdwilliamsiv@gmail.com, wenjing.liu@amd.com
From: <gregkh@linuxfoundation.org>
Date: Sat, 10 Sep 2022 08:27:18 +0200
Message-ID: <1662791238245106@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Mon, 12 Sep 2022 07:26:54 +0000
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
Cc: stable-commits@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/amd/display: fix memory leak when using debugfs_lookup()

to the 5.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-amd-display-fix-memory-leak-when-using-debugfs_lookup.patch
and it can be found in the queue-5.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cbfac7fa491651c57926c99edeb7495c6c1aeac2 Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 2 Sep 2022 15:01:05 +0200
Subject: drm/amd/display: fix memory leak when using debugfs_lookup()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

commit cbfac7fa491651c57926c99edeb7495c6c1aeac2 upstream.

When calling debugfs_lookup() the result must have dput() called on it,
otherwise the memory will leak over time.  Fix this up by properly
calling dput().

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: hersen wu <hersenxs.wu@amd.com>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Thelford Williams <tdwilliamsiv@gmail.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3188,7 +3188,7 @@ void crtc_debugfs_init(struct drm_crtc *
 				   &crc_win_y_end_fops);
 	debugfs_create_file_unsafe("crc_win_update", 0644, dir, crtc,
 				   &crc_win_update_fops);
-
+	dput(dir);
 }
 #endif
 /*


Patches currently in stable-queue which might be from gregkh@linuxfoundation.org are

queue-5.19/alsa-aloop-fix-random-zeros-in-capture-data-when-using-jiffies-timer.patch
queue-5.19/driver-core-fix-driver_set_override-issue-with-empty-strings.patch
queue-5.19/alsa-usb-audio-split-endpoint-setups-for-hw_params-and-prepare.patch
queue-5.19/soc-fsl-select-fsl_guts-driver-for-dpio.patch
queue-5.19/fs-only-do-a-memory-barrier-for-the-first-set_buffer_uptodate.patch
queue-5.19/tracefs-only-clobber-mode-uid-gid-on-remount-if-asked.patch
queue-5.19/efi-capsule-loader-fix-use-after-free-in-efi_capsule_write.patch
queue-5.19/alsa-emu10k1-fix-out-of-bounds-access-in-snd_emu10k1_pcm_channel_alloc.patch
queue-5.19/net-mvpp2-debugfs-fix-memory-leak-when-using-debugfs_lookup.patch
queue-5.19/efi-libstub-disable-struct-randomization.patch
queue-5.19/revert-mm-kmemleak-take-a-full-lowmem-check-in-kmemleak_-_phys.patch
queue-5.19/sched-debug-fix-dentry-leak-in-update_sched_domain_debugfs.patch
queue-5.19/alsa-usb-audio-fix-an-out-of-bounds-bug-in-__snd_usb_parse_audio_interface.patch
queue-5.19/kprobes-prohibit-probes-in-gate-area.patch
queue-5.19/tracing-hold-caller_addr-to-hardirq_-enable-disable-_ip.patch
queue-5.19/wifi-iwlegacy-4965-corrected-fix-for-potential-off-by-one-overflow-in-il4965_rs_fill_link_cmd.patch
queue-5.19/alsa-pcm-oss-fix-race-at-sndctl_dsp_sync.patch
queue-5.19/perf-risc-v-fix-access-beyond-allocated-array.patch
queue-5.19/debugfs-add-debugfs_lookup_and_remove.patch
queue-5.19/wifi-mt76-mt7921e-fix-crash-in-chip-reset-fail.patch
queue-5.19/btrfs-zoned-fix-api-misuse-of-zone-finish-waiting.patch
queue-5.19/vfio-type1-unpin-zero-pages.patch
queue-5.19/tracing-fix-to-check-event_mutex-is-held-while-accessing-trigger-list.patch
queue-5.19/alsa-hda-once-again-fix-regression-of-page-allocations-with-iommu.patch
queue-5.19/btrfs-zoned-set-pseudo-max-append-zone-limit-in-zone-emulation-mode.patch
queue-5.19/drm-amd-display-fix-memory-leak-when-using-debugfs_lookup.patch
queue-5.19/alsa-usb-audio-clear-fixed-clock-rate-at-closing-ep.patch
