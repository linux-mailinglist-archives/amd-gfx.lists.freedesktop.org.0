Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10236C0707
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Mar 2023 01:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7932A10E07A;
	Mon, 20 Mar 2023 00:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA5510E078;
 Mon, 20 Mar 2023 00:53:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 149226114E;
 Mon, 20 Mar 2023 00:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2511C433D2;
 Mon, 20 Mar 2023 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679273638;
 bh=dP8MKAIz+hzlwbkB+IquFyYQGS6Da7JzwgrSPP86ulE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZjZeHF2CWiDuoZG0G138jmDSV9T64wduzOTZ/o79B9OZKIZRgmluLbJoux/sMjgMW
 EyGh1a37McLk7A4Y9uKLSRpbZpQ/J+Ug2dhN6/t/OVbxI1OQIx7ujwAGYm5pUXcm2F
 +vW1lHBJP5ve/hrdZLIggTPMEbt8iYRhqzE0GtDtszBQuqhezEZU25KWBPXuBdClkg
 bQzJ0zU0qp3FzXDafYUTsm2YAthjRciUW60gsY31IMeDXTwtFQoQhPm474DRsfqvyj
 +wvbUZHkHUzuf1PpkFMNipgjbVk2yiecjwOqBX+R1y8iaTwnmadGacqM0SgdUfOeV8
 UUBZfhyG7d6mA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 27/30] drm/amd/display: Update clock table to
 include highest clock setting
Date: Sun, 19 Mar 2023 20:52:52 -0400
Message-Id: <20230320005258.1428043-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320005258.1428043-1-sashal@kernel.org>
References: <20230320005258.1428043-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, oliver.logush@amd.com,
 Swapnil Patel <Swapnil.Patel@amd.com>, sunpeng.li@amd.com, airlied@gmail.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, harry.wentland@amd.com,
 christian.koenig@amd.com, Pavle Kotarac <pavle.kotarac@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Swapnil Patel <Swapnil.Patel@amd.com>

[ Upstream commit 2d99a7ec25cf456cd3680eb314d6454138e5aa64 ]

[Why]
Currently, the clk manager matches SocVoltage with voltage from
fused settings (dfPstate clock table). And then corresponding clocks
are selected.

However in certain situations, this leads to clk manager not
including at least one entry with highest supported clock setting.

[How]
Update the clk manager to include at least one entry with highest
supported clock setting.

Reviewed-by: Pavle Kotarac <pavle.kotarac@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Swapnil Patel <Swapnil.Patel@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/clk_mgr/dcn301/vg_clk_mgr.c    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
index 24715ca2fa944..01383aac6b419 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn301/vg_clk_mgr.c
@@ -529,6 +529,19 @@ static struct clk_bw_params vg_bw_params = {
 
 };
 
+static uint32_t find_max_clk_value(const uint32_t clocks[], uint32_t num_clocks)
+{
+	uint32_t max = 0;
+	int i;
+
+	for (i = 0; i < num_clocks; ++i) {
+		if (clocks[i] > max)
+			max = clocks[i];
+	}
+
+	return max;
+}
+
 static unsigned int find_dcfclk_for_voltage(const struct vg_dpm_clocks *clock_table,
 		unsigned int voltage)
 {
@@ -572,12 +585,16 @@ static void vg_clk_mgr_helper_populate_bw_params(
 
 	bw_params->clk_table.num_entries = j + 1;
 
-	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
+	for (i = 0; i < bw_params->clk_table.num_entries - 1; i++, j--) {
 		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].fclk;
 		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].memclk;
 		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].voltage;
 		bw_params->clk_table.entries[i].dcfclk_mhz = find_dcfclk_for_voltage(clock_table, clock_table->DfPstateTable[j].voltage);
 	}
+	bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].fclk;
+	bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].memclk;
+	bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].voltage;
+	bw_params->clk_table.entries[i].dcfclk_mhz = find_max_clk_value(clock_table->DcfClocks, VG_NUM_DCFCLK_DPM_LEVELS);
 
 	bw_params->vram_type = bios_info->memory_type;
 	bw_params->num_channels = bios_info->ma_channel_number;
-- 
2.39.2

