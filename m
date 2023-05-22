Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F570BF32
	for <lists+amd-gfx@lfdr.de>; Mon, 22 May 2023 15:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A02410E324;
	Mon, 22 May 2023 13:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B910E327
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 May 2023 13:08:27 +0000 (UTC)
Received: from kaveri ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202305221508248273; Mon, 22 May 2023 15:08:24 +0200
Received: from daenzer by kaveri with local (Exim 4.96)
 (envelope-from <michel@daenzer.net>) id 1q15Gx-003E7I-0b;
 Mon, 22 May 2023 15:08:23 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <Aurabindo.Pillai@amd.com>
Subject: [PATCH 2/2] Revert "drm/amd/display: Do not set drr on pipe commit"
Date: Mon, 22 May 2023 15:08:23 +0200
Message-Id: <20230522130823.769236-2-michel@daenzer.net>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522130823.769236-1-michel@daenzer.net>
References: <20230522130823.769236-1-michel@daenzer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F24.646B6948.002F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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
Cc: Wesley Chalmers <Wesley.Chalmers@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

This reverts commit 474f01015ffdb74e01c2eb3584a2822c64e7b2be.

Caused a regression:

Samsung Odyssey Neo G9, running at 5120x1440@240/VRR, connected to Navi
21 via DisplayPort, blanks and the GPU hangs while starting the Steam
game Assetto Corsa Competizione (via Proton 7.0).

Example dmesg excerpt:

 amdgpu 0000:0c:00.0: [drm] ERROR [CRTC:82:crtc-0] flip_done timed out
 NMI watchdog: Watchdog detected hard LOCKUP on cpu 6
 [...]
 RIP: 0010:amdgpu_device_rreg.part.0+0x2f/0xf0 [amdgpu]
 Code: 41 54 44 8d 24 b5 00 00 00 00 55 89 f5 53 48 89 fb 4c 3b a7 60 0b 00 00 73 6a 83 e2 02 74 29 4c 03 a3 68 0b 00 00 45 8b 24 24 <48> 8b 43 08 0f b7 70 3e 66 90 44 89 e0 5b 5d 41 5c 31 d2 31 c9 31
 RSP: 0000:ffffb39a119dfb88 EFLAGS: 00000086
 RAX: ffffffffc0eb96a0 RBX: ffff9e7963dc0000 RCX: 0000000000007fff
 RDX: 0000000000000000 RSI: 0000000000004ff6 RDI: ffff9e7963dc0000
 RBP: 0000000000004ff6 R08: ffffb39a119dfc40 R09: 0000000000000010
 R10: ffffb39a119dfc40 R11: ffffb39a119dfc44 R12: 00000000000e05ae
 R13: 0000000000000000 R14: ffff9e7963dc0010 R15: 0000000000000000
 FS:  000000001012f6c0(0000) GS:ffff9e805eb80000(0000) knlGS:000000007fd40000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00000000461ca000 CR3: 00000002a8a20000 CR4: 0000000000350ee0
 Call Trace:
  <TASK>
  dm_read_reg_func+0x37/0xc0 [amdgpu]
  generic_reg_get2+0x22/0x60 [amdgpu]
  optc1_get_crtc_scanoutpos+0x6a/0xc0 [amdgpu]
  dc_stream_get_scanoutpos+0x74/0x90 [amdgpu]
  dm_crtc_get_scanoutpos+0x82/0xf0 [amdgpu]
  amdgpu_display_get_crtc_scanoutpos+0x91/0x190 [amdgpu]
  ? dm_read_reg_func+0x37/0xc0 [amdgpu]
  amdgpu_get_vblank_counter_kms+0xb4/0x1a0 [amdgpu]
  dm_pflip_high_irq+0x213/0x2f0 [amdgpu]
  amdgpu_dm_irq_handler+0x8a/0x200 [amdgpu]
  amdgpu_irq_dispatch+0xd4/0x220 [amdgpu]
  amdgpu_ih_process+0x7f/0x110 [amdgpu]
  amdgpu_irq_handler+0x1f/0x70 [amdgpu]
  __handle_irq_event_percpu+0x46/0x1b0
  handle_irq_event+0x34/0x80
  handle_edge_irq+0x9f/0x240
  __common_interrupt+0x66/0x110
  common_interrupt+0x5c/0xd0
  asm_common_interrupt+0x22/0x40

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 6 ------
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 7 -------
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
index 6ce10fd4bb1a..5403e9399a46 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
@@ -2113,12 +2113,6 @@ void dcn20_optimize_bandwidth(
 	if (hubbub->funcs->program_compbuf_size)
 		hubbub->funcs->program_compbuf_size(hubbub, context->bw_ctx.bw.dcn.compbuf_size_kb, true);
 
-	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
-		dc_dmub_srv_p_state_delegate(dc,
-			true, context);
-		context->bw_ctx.bw.dcn.clk.p_state_change_support = true;
-	}
-
 	dc->clk_mgr->funcs->update_clocks(
 			dc->clk_mgr,
 			context,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 0411867654dd..0e071fbc9154 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -985,18 +985,11 @@ void dcn30_set_disp_pattern_generator(const struct dc *dc,
 void dcn30_prepare_bandwidth(struct dc *dc,
  	struct dc_state *context)
 {
-	if (context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching) {
-		dc->optimized_required = true;
-		context->bw_ctx.bw.dcn.clk.p_state_change_support = false;
-	}
-
 	if (dc->clk_mgr->dc_mode_softmax_enabled)
 		if (dc->clk_mgr->clks.dramclk_khz <= dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000 &&
 				context->bw_ctx.bw.dcn.clk.dramclk_khz > dc->clk_mgr->bw_params->dc_mode_softmax_memclk * 1000)
 			dc->clk_mgr->funcs->set_max_memclk(dc->clk_mgr, dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz);
 
 	dcn20_prepare_bandwidth(dc, context);
-
-	dc_dmub_srv_p_state_delegate(dc, false, context);
 }
 
-- 
2.40.1

