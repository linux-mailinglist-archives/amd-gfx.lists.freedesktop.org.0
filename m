Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CC3740CE
	for <lists+amd-gfx@lfdr.de>; Wed,  5 May 2021 18:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34DC6EC1D;
	Wed,  5 May 2021 16:38:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EBD6EC1C;
 Wed,  5 May 2021 16:38:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84B5761460;
 Wed,  5 May 2021 16:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232705;
 bh=dJ5/COIlT6J37OFtDufkjFBKXDMtSNEacyn8dl+s/d8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bnm37LD7FcekW7xb366qBz8S4Fc9lc0b/cWf2Uj+tj6ZlSI8am/QlCUACwuKFTiRL
 pA+n4PnYh+d3gSynGIzNXPkhRwi5XW2aDwPlyDzo1V09ldvdvz6jdEPwk2O78Ah9Kl
 XcDpGOtMzNm0K8J8hwDjqqS3DKIwJcZsxsjWaQZO5lGhvEG+967w85rvdSCaH3Ug21
 fPpkIerNKXbA+cmo8pJUP5h2d9qfy8IUTNmBSfDYBCnx/QW0w9qpwb4A4CIerkLqy/
 s10sCrH7a+q0bUyRo5iVDonF4nml2t7I3Kph9L5bKbUP61ewnQ0sypyYGiJQChTrut
 aV2+1gUAokNjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 66/85] drm/amd/display: fixed divide by zero
 kernel crash during dsc enablement
Date: Wed,  5 May 2021 12:36:29 -0400
Message-Id: <20210505163648.3462507-66-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Robin Singh <Robin.Singh@amd.com>,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Robin Singh <robin.singh@amd.com>

[ Upstream commit 19cc1f3829567e7dca21c1389ea6407b8f5efab4 ]

[why]
During dsc enable, a divide by zero condition triggered the
kernel crash.

[how]
An IGT test, which enable the DSC, was crashing at the time of
restore the default dsc status, becaue of h_totals value
becoming 0. So add a check before divide condition. If h_total
is zero, gracefully ignore and set the default value.

kernel panic log:

	[  128.758827] divide error: 0000 [#1] PREEMPT SMP NOPTI
	[  128.762714] CPU: 5 PID: 4562 Comm: amd_dp_dsc Tainted: G        W         5.4.19-android-x86_64 #1
	[  128.769728] Hardware name: ADVANCED MICRO DEVICES, INC. Mauna/Mauna, BIOS WMN0B13N Nov 11 2020
	[  128.777695] RIP: 0010:hubp2_vready_at_or_After_vsync+0x37/0x7a [amdgpu]
	[  128.785707] Code: 80 02 00 00 48 89 f3 48 8b 7f 08 b ......
	[  128.805696] RSP: 0018:ffffad8f82d43628 EFLAGS: 00010246
	......
	[  128.857707] CR2: 00007106d8465000 CR3: 0000000426530000 CR4: 0000000000140ee0
	[  128.865695] Call Trace:
	[  128.869712] hubp3_setup+0x1f/0x7f [amdgpu]
	[  128.873705] dcn20_update_dchubp_dpp+0xc8/0x54a [amdgpu]
	[  128.877706] dcn20_program_front_end_for_ctx+0x31d/0x463 [amdgpu]
	[  128.885706] dc_commit_state+0x3d2/0x658 [amdgpu]
	[  128.889707] amdgpu_dm_atomic_commit_tail+0x4b3/0x1e7c [amdgpu]
	[  128.897699] ? dm_read_reg_func+0x41/0xb5 [amdgpu]
	[  128.901707] ? dm_read_reg_func+0x41/0xb5 [amdgpu]
	[  128.905706] ? __is_insn_slot_addr+0x43/0x48
	[  128.909706] ? fill_plane_buffer_attributes+0x29e/0x3dc [amdgpu]
	[  128.917705] ? dm_plane_helper_prepare_fb+0x255/0x284 [amdgpu]
	[  128.921700] ? usleep_range+0x7c/0x7c
	[  128.925705] ? preempt_count_sub+0xf/0x18
	[  128.929706] ? _raw_spin_unlock_irq+0x13/0x24
	[  128.933732] ? __wait_for_common+0x11e/0x18f
	[  128.937705] ? _raw_spin_unlock_irq+0x13/0x24
	[  128.941706] ? __wait_for_common+0x11e/0x18f
	[  128.945705] commit_tail+0x8b/0xd2 [drm_kms_helper]
	[  128.949707] drm_atomic_helper_commit+0xd8/0xf5 [drm_kms_helper]
	[  128.957706] amdgpu_dm_atomic_commit+0x337/0x360 [amdgpu]
	[  128.961705] ? drm_atomic_check_only+0x543/0x68d [drm]
	[  128.969705] ? drm_atomic_set_property+0x760/0x7af [drm]
	[  128.973704] ? drm_mode_atomic_ioctl+0x6f3/0x85a [drm]
	[  128.977705] drm_mode_atomic_ioctl+0x6f3/0x85a [drm]
	[  128.985705] ? drm_atomic_set_property+0x7af/0x7af [drm]
	[  128.989706] drm_ioctl_kernel+0x82/0xda [drm]
	[  128.993706] drm_ioctl+0x225/0x319 [drm]
	[  128.997707] ? drm_atomic_set_property+0x7af/0x7af [drm]
	[  129.001706] ? preempt_count_sub+0xf/0x18
	[  129.005713] amdgpu_drm_ioctl+0x4b/0x76 [amdgpu]
	[  129.009705] vfs_ioctl+0x1d/0x2a
	[  129.013705] do_vfs_ioctl+0x419/0x43d
	[  129.017707] ksys_ioctl+0x52/0x71
	[  129.021707] __x64_sys_ioctl+0x16/0x19
	[  129.025706] do_syscall_64+0x78/0x85
	[  129.029705] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Robin Singh <robin.singh@amd.com>
Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Reviewed-by: Robin Singh <Robin.Singh@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
index 368818d2dfc6..cd9bd71da4b7 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hubp.c
@@ -1,5 +1,5 @@
 /*
- * Copyright 2012-17 Advanced Micro Devices, Inc.
+ * Copyright 2012-2021 Advanced Micro Devices, Inc.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -181,11 +181,14 @@ void hubp2_vready_at_or_After_vsync(struct hubp *hubp,
 	else
 		Set HUBP_VREADY_AT_OR_AFTER_VSYNC = 0
 	*/
-	if ((pipe_dest->vstartup_start - (pipe_dest->vready_offset+pipe_dest->vupdate_width
-		+ pipe_dest->vupdate_offset) / pipe_dest->htotal) <= pipe_dest->vblank_end) {
-		value = 1;
-	} else
-		value = 0;
+	if (pipe_dest->htotal != 0) {
+		if ((pipe_dest->vstartup_start - (pipe_dest->vready_offset+pipe_dest->vupdate_width
+			+ pipe_dest->vupdate_offset) / pipe_dest->htotal) <= pipe_dest->vblank_end) {
+			value = 1;
+		} else
+			value = 0;
+	}
+
 	REG_UPDATE(DCHUBP_CNTL, HUBP_VREADY_AT_OR_AFTER_VSYNC, value);
 }
 
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
