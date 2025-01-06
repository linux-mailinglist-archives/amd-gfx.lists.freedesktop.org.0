Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABF5A0278F
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jan 2025 15:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1C410E681;
	Mon,  6 Jan 2025 14:12:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id A47A810E5C0
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jan 2025 08:58:07 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
 by gateway (Coremail) with SMTP id _____8CxG6wbm3tnZI5eAA--.538S3;
 Mon, 06 Jan 2025 16:58:03 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
 by front1 (Coremail) with SMTP id qMiowMBx38cUm3tnFUgWAA--.30775S2;
 Mon, 06 Jan 2025 16:57:57 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/amd/display: Stop control flow if the divisior is
 zero
Date: Mon,  6 Jan 2025 16:57:55 +0800
Message-ID: <20250106085755.3268-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMBx38cUm3tnFUgWAA--.30775S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9fXoW3tFWrCw15Cw4xCryxWw4fCrX_yoW8JF4DCo
 Z7Cr43WryDJ343Casrur17JrWfKr13KrZ7u3W0qF1qq3ZrXF18JF1Fgr48KF4vyr43JFn7
 uF17XrZ5Jry7K3Wrl-sFpf9Il3svdjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf
 9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
 UjIYCTnIWjp_UUUYI7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
 8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
 Y2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
 0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280
 aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
 kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
 5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
 W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
 1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
 0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU
 2BT5DUUUU
X-Mailman-Approved-At: Mon, 06 Jan 2025 14:12:56 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

As far as I can tell, with the current existing macro definitions, there
is no better way to do the minimal and proper changes to stop the control
flow if the divisior is zero.

In order to keep the current ability for the aim of debugging and avoid
printing the warning message twice, it is better to only use ASSERT_BUG()
and SPL_ASSERT_BUG() directly after doing the following four steps:

(1) Replace ASSERT() with ASSERT_WARN()
(2) Replace SPL_ASSERT() with SPL_ASSERT_WARN()
(3) Add ASSERT_BUG() macro definition
(4) Add SPL_ASSERT_BUG() macro definition

This version is based on 6.13-rc6, tested on x86 and LoongArch.

Tiezhu Yang (5):
  drm/amd/display: Replace ASSERT() with ASSERT_WARN()
  drm/amd/display: Replace SPL_ASSERT() with SPL_ASSERT_WARN()
  drm/amd/display: Add ASSERT_BUG() macro definition
  drm/amd/display: Add SPL_ASSERT_BUG() macro definition
  drm/amd/display: Harden callers of division functions

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  8 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    |  2 +-
 .../gpu/drm/amd/display/dc/basics/bw_fixed.c  | 18 ++---
 .../gpu/drm/amd/display/dc/basics/dce_calcs.c |  2 +-
 .../drm/amd/display/dc/basics/fixpt31_32.c    | 28 +++----
 .../drm/amd/display/dc/bios/bios_parser2.c    |  6 +-
 .../amd/display/dc/bios/bios_parser_common.c  |  2 +-
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dce100/dce_clk_mgr.c   |  4 +-
 .../dc/clk_mgr/dce110/dce110_clk_mgr.c        |  4 +-
 .../display/dc/clk_mgr/dcn10/rv1_clk_mgr.c    |  2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  |  2 +-
 .../amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c |  8 +-
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c   |  6 +-
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dcn301/dcn301_smu.c    |  2 +-
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 10 +--
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  | 12 +--
 .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.c  |  4 +-
 .../dc/clk_mgr/dcn314/dcn314_clk_mgr.c        | 14 ++--
 .../display/dc/clk_mgr/dcn314/dcn314_smu.c    |  4 +-
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        | 14 ++--
 .../display/dc/clk_mgr/dcn315/dcn315_smu.c    |  2 +-
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        | 12 +--
 .../display/dc/clk_mgr/dcn316/dcn316_smu.c    |  2 +-
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  |  2 +-
 .../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c  | 18 ++---
 .../amd/display/dc/clk_mgr/dcn35/dcn35_smu.c  |  6 +-
 .../dc/clk_mgr/dcn401/dcn401_clk_mgr.c        | 10 +--
 drivers/gpu/drm/amd/display/dc/core/dc.c      | 24 +++---
 .../drm/amd/display/dc/core/dc_hw_sequencer.c |  4 +-
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c | 12 +--
 .../gpu/drm/amd/display/dc/core/dc_resource.c | 62 ++++++++--------
 drivers/gpu/drm/amd/display/dc/core/dc_stat.c |  4 +-
 .../gpu/drm/amd/display/dc/core/dc_stream.c   |  2 +-
 .../gpu/drm/amd/display/dc/core/dc_surface.c  |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  6 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c    |  8 +-
 .../amd/display/dc/dccg/dcn20/dcn20_dccg.c    |  2 +-
 .../amd/display/dc/dccg/dcn31/dcn31_dccg.c    |  2 +-
 .../amd/display/dc/dccg/dcn35/dcn35_dccg.c    |  4 +-
 .../amd/display/dc/dccg/dcn401/dcn401_dccg.c  |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_audio.c    |  6 +-
 .../gpu/drm/amd/display/dc/dce/dce_clk_mgr.c  |  8 +-
 .../drm/amd/display/dc/dce/dce_clock_source.c |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_dmcu.c |  2 +-
 .../gpu/drm/amd/display/dc/dce/dce_i2c_sw.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/dce/dce_ipp.c  |  4 +-
 .../drm/amd/display/dc/dce/dce_link_encoder.c |  8 +-
 .../drm/amd/display/dc/dce/dce_mem_input.c    |  6 +-
 .../amd/display/dc/dce/dce_stream_encoder.c   | 10 +--
 .../drm/amd/display/dc/dce/dce_transform.c    |  8 +-
 drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c |  4 +-
 .../gpu/drm/amd/display/dc/dce/dmub_replay.c  |  4 +-
 .../dc/dce110/dce110_timing_generator.c       |  2 +-
 .../amd/display/dc/dce60/dce60_hw_sequencer.c |  2 +-
 .../drm/amd/display/dc/dce60/dce60_resource.c |  2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_vmid.c |  2 +-
 .../amd/display/dc/dcn21/dcn21_link_encoder.c |  4 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 +-
 .../gpu/drm/amd/display/dc/dcn30/dcn30_vpg.c  |  2 +-
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  |  2 +-
 .../amd/display/dc/dcn31/dcn31_panel_cntl.c   |  2 +-
 .../display/dc/dio/dcn10/dcn10_link_encoder.c |  4 +-
 .../dc/dio/dcn10/dcn10_stream_encoder.c       |  8 +-
 .../dc/dio/dcn20/dcn20_stream_encoder.c       |  4 +-
 .../dc/dio/dcn30/dcn30_dio_stream_encoder.c   | 16 ++--
 .../dc/dio/dcn314/dcn314_dio_stream_encoder.c |  6 +-
 .../dc/dio/dcn32/dcn32_dio_stream_encoder.c   |  6 +-
 .../dc/dio/dcn35/dcn35_dio_stream_encoder.c   |  8 +-
 .../dc/dio/dcn401/dcn401_dio_stream_encoder.c |  8 +-
 drivers/gpu/drm/amd/display/dc/dm_services.h  |  2 +-
 .../amd/display/dc/dml/calcs/dcn_calc_math.c  |  6 +-
 .../drm/amd/display/dc/dml/calcs/dcn_calcs.c  | 18 ++---
 .../drm/amd/display/dc/dml/dcn10/dcn10_fpu.c  |  2 +-
 .../drm/amd/display/dc/dml/dcn20/dcn20_fpu.c  | 14 ++--
 .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
 .../dc/dml/dcn20/display_mode_vba_20v2.c      |  2 +-
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     | 54 +++++++-------
 .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 54 +++++++-------
 .../dc/dml/dcn21/display_mode_vba_21.c        |  2 +-
 .../dc/dml/dcn21/display_rq_dlg_calc_21.c     | 54 +++++++-------
 .../drm/amd/display/dc/dml/dcn30/dcn30_fpu.c  |  4 +-
 .../dc/dml/dcn30/display_mode_vba_30.c        |  4 +-
 .../dc/dml/dcn30/display_rq_dlg_calc_30.c     | 56 +++++++-------
 .../amd/display/dc/dml/dcn301/dcn301_fpu.c    |  6 +-
 .../amd/display/dc/dml/dcn302/dcn302_fpu.c    |  2 +-
 .../amd/display/dc/dml/dcn303/dcn303_fpu.c    |  2 +-
 .../drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  |  6 +-
 .../dc/dml/dcn31/display_mode_vba_31.c        |  4 +-
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     | 50 ++++++-------
 .../amd/display/dc/dml/dcn314/dcn314_fpu.c    |  6 +-
 .../dc/dml/dcn314/display_mode_vba_314.c      |  4 +-
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 50 ++++++-------
 .../drm/amd/display/dc/dml/dcn32/dcn32_fpu.c  | 32 ++++----
 .../dc/dml/dcn32/display_rq_dlg_calc_32.c     | 58 +++++++--------
 .../amd/display/dc/dml/dcn321/dcn321_fpu.c    |  2 +-
 .../drm/amd/display/dc/dml/dcn35/dcn35_fpu.c  |  4 +-
 .../amd/display/dc/dml/dcn351/dcn351_fpu.c    |  4 +-
 .../drm/amd/display/dc/dml/display_mode_vba.c | 12 +--
 .../display/dc/dml/dml1_display_rq_dlg_calc.c | 74 +++++++++----------
 .../amd/display/dc/dml2/display_mode_core.c   | 14 ++--
 .../amd/display/dc/dml2/display_mode_util.c   | 12 +--
 .../dc/dml2/dml21/dml21_translation_helper.c  | 10 +--
 .../amd/display/dc/dml2/dml21/dml21_utils.c   |  8 +-
 .../amd/display/dc/dml2/dml21/dml21_wrapper.c |  8 +-
 .../lib_float_math.c                          |  4 +-
 .../dc/dml2/dml21/src/inc/dml2_debug.c        |  2 +-
 .../display/dc/dml2/dml2_dc_resource_mgmt.c   | 50 ++++++-------
 .../gpu/drm/amd/display/dc/dml2/dml2_policy.c |  2 +-
 .../display/dc/dml2/dml2_translation_helper.c | 10 +--
 .../gpu/drm/amd/display/dc/dml2/dml2_utils.c  |  6 +-
 .../drm/amd/display/dc/dml2/dml2_wrapper.c    | 10 +--
 .../display/dc/dml2/dml_display_rq_dlg_calc.c | 62 ++++++++--------
 .../amd/display/dc/dpp/dcn10/dcn10_dpp_dscl.c |  4 +-
 .../drm/amd/display/dc/dpp/dcn30/dcn30_dpp.c  |  8 +-
 .../display/dc/dpp/dcn401/dcn401_dpp_dscl.c   |  4 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  4 +-
 .../drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c  | 24 +++---
 .../drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c  |  2 +-
 .../amd/display/dc/dsc/dcn401/dcn401_dsc.c    |  4 +-
 drivers/gpu/drm/amd/display/dc/gpio/hw_gpio.c |  2 +-
 .../dc/hpo/dcn31/dcn31_hpo_dp_link_encoder.c  |  6 +-
 .../hpo/dcn31/dcn31_hpo_dp_stream_encoder.c   |  4 +-
 .../dc/hpo/dcn32/dcn32_hpo_dp_link_encoder.c  |  2 +-
 .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  4 +-
 .../display/dc/hubbub/dcn20/dcn20_hubbub.c    |  6 +-
 .../display/dc/hubbub/dcn31/dcn31_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn32/dcn32_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn35/dcn35_hubbub.c    |  8 +-
 .../display/dc/hubbub/dcn401/dcn401_hubbub.c  | 10 +--
 .../amd/display/dc/hubp/dcn10/dcn10_hubp.c    |  4 +-
 .../amd/display/dc/hubp/dcn20/dcn20_hubp.c    |  4 +-
 .../amd/display/dc/hubp/dcn401/dcn401_hubp.c  |  8 +-
 .../amd/display/dc/hwss/dce110/dce110_hwseq.c |  8 +-
 .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   |  8 +-
 .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   | 22 +++---
 .../amd/display/dc/hwss/dcn201/dcn201_hwseq.c |  4 +-
 .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   | 24 +++---
 .../amd/display/dc/hwss/dcn31/dcn31_hwseq.c   |  4 +-
 .../amd/display/dc/hwss/dcn314/dcn314_hwseq.c | 10 +--
 .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 18 ++---
 .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 10 +--
 .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c |  6 +-
 .../gpu/drm/amd/display/dc/irq/irq_service.c  |  4 +-
 .../display/dc/link/accessories/link_dp_cts.c |  4 +-
 .../amd/display/dc/link/hwss/link_hwss_dio.c  |  2 +-
 .../amd/display/dc/link/hwss/link_hwss_dpia.c |  2 +-
 .../drm/amd/display/dc/link/link_detection.c  |  4 +-
 .../gpu/drm/amd/display/dc/link/link_dpms.c   | 26 +++----
 .../dc/link/protocols/link_dp_capability.c    | 12 +--
 .../display/dc/link/protocols/link_dp_phy.c   |  4 +-
 .../dc/link/protocols/link_dp_training.c      | 14 ++--
 .../link/protocols/link_dp_training_8b_10b.c  |  2 +-
 .../dc/link/protocols/link_dp_training_dpia.c |  4 +-
 .../link_dp_training_fixed_vs_pe_retimer.c    |  4 +-
 .../amd/display/dc/link/protocols/link_dpcd.c |  2 +-
 .../link/protocols/link_edp_panel_control.c   |  6 +-
 .../amd/display/dc/link/protocols/link_hpd.c  |  2 +-
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  | 16 ++--
 .../drm/amd/display/dc/mpc/dcn20/dcn20_mpc.c  | 14 ++--
 .../drm/amd/display/dc/opp/dcn20/dcn20_opp.c  |  2 +-
 .../amd/display/dc/optc/dcn10/dcn10_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn20/dcn20_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn201/dcn201_optc.c  |  2 +-
 .../amd/display/dc/optc/dcn30/dcn30_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn31/dcn31_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn35/dcn35_optc.c    |  2 +-
 .../amd/display/dc/optc/dcn401/dcn401_optc.c  |  4 +-
 drivers/gpu/drm/amd/display/dc/os_types.h     |  7 +-
 .../dc/resource/dce100/dce100_resource.c      |  2 +-
 .../dc/resource/dce110/dce110_resource.c      |  2 +-
 .../dc/resource/dce112/dce112_resource.c      |  2 +-
 .../dc/resource/dce120/dce120_resource.c      |  2 +-
 .../dc/resource/dce80/dce80_resource.c        |  2 +-
 .../dc/resource/dcn10/dcn10_resource.c        |  4 +-
 .../dc/resource/dcn20/dcn20_resource.c        | 30 ++++----
 .../dc/resource/dcn201/dcn201_resource.c      |  2 +-
 .../dc/resource/dcn21/dcn21_resource.c        | 12 +--
 .../dc/resource/dcn30/dcn30_resource.c        | 26 +++----
 .../dc/resource/dcn31/dcn31_resource.c        |  4 +-
 .../dc/resource/dcn314/dcn314_resource.c      |  2 +-
 .../dc/resource/dcn315/dcn315_resource.c      |  4 +-
 .../dc/resource/dcn316/dcn316_resource.c      |  6 +-
 .../dc/resource/dcn32/dcn32_resource.c        | 20 ++---
 .../dc/resource/dcn321/dcn321_resource.c      |  6 +-
 .../dc/resource/dcn35/dcn35_resource.c        |  2 +-
 .../dc/resource/dcn351/dcn351_resource.c      |  2 +-
 .../dc/resource/dcn401/dcn401_resource.c      |  6 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c   | 12 +--
 .../gpu/drm/amd/display/dc/spl/spl_debug.h    | 15 +++-
 .../drm/amd/display/dc/spl/spl_fixpt31_32.c   | 32 ++++----
 .../drm/amd/display/dc/spl/spl_fixpt31_32.h   | 12 +--
 .../gpu/drm/amd/display/dmub/src/dmub_srv.c   |  4 +-
 .../gpu/drm/amd/display/include/fixed31_32.h  | 12 +--
 .../amd/display/modules/color/color_gamma.c   |  2 +-
 .../amd/display/modules/freesync/freesync.c   |  4 +-
 .../amd/display/modules/power/power_helpers.c |  8 +-
 .../gpu/drm/amd/display/modules/vmid/vmid.c   |  2 +-
 203 files changed, 961 insertions(+), 947 deletions(-)

-- 
2.42.0

