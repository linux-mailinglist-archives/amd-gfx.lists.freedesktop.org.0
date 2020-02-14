Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ED215E031
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 17:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E96C6FA92;
	Fri, 14 Feb 2020 16:13:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05736FA8B;
 Fri, 14 Feb 2020 16:13:03 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97483246A1;
 Fri, 14 Feb 2020 16:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696783;
 bh=hEqE9s7hwqc0TcLQaHrv60bKO82V3yKIzTCuzVp1MNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XRdfvZHi+h3n+36WffgnNhjGYETdOZBy1lSwSi8dyNCOg4/QfuTwhGD8OX5TV+POm
 BO5xGHaiajuNJf4rZji/wYnbM5TzAFe4KZiSLxOkpUawAIGYJYnbGx/4hwvmmtzyRX
 nMS3l017KgvWUhJeGQtymU5PB5wOgJL6eRlncXao=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 059/252] drm/amd/powerplay: remove set but not
 used variable 'threshold', 'state'
Date: Fri, 14 Feb 2020 11:08:34 -0500
Message-Id: <20200214161147.15842-59-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit f5ac1595156a8b63812ed6fa0803ddf7207cced7 ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c: In function fiji_populate_single_graphic_level:
drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c:943:11: warning: variable threshold set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c: In function fiji_populate_memory_timing_parameters:
drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c:1504:8: warning: variable state set but not used [-Wunused-but-set-variable]

They are introduced by commit 2e112b4ae3ba ("drm/amd/pp:
remove fiji_smc/smumgr split."), but never used,
so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
index 40df5c2706cce..d517fbd6809c9 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/fiji_smumgr.c
@@ -950,7 +950,7 @@ static int fiji_populate_single_graphic_level(struct pp_hwmgr *hwmgr,
 {
 	int result;
 	/* PP_Clocks minClocks; */
-	uint32_t threshold, mvdd;
+	uint32_t mvdd;
 	struct smu7_hwmgr *data = (struct smu7_hwmgr *)(hwmgr->backend);
 	struct phm_ppt_v1_information *table_info =
 			(struct phm_ppt_v1_information *)(hwmgr->pptable);
@@ -983,8 +983,6 @@ static int fiji_populate_single_graphic_level(struct pp_hwmgr *hwmgr,
 	level->VoltageDownHyst = 0;
 	level->PowerThrottle = 0;
 
-	threshold = clock * data->fast_watermark_threshold / 100;
-
 	data->display_timing.min_clock_in_sr = hwmgr->display_config->min_core_set_clock_in_sr;
 
 	if (phm_cap_enabled(hwmgr->platform_descriptor.platformCaps, PHM_PlatformCaps_SclkDeepSleep))
@@ -1510,7 +1508,7 @@ static int fiji_populate_memory_timing_parameters(struct pp_hwmgr *hwmgr,
 	uint32_t dram_timing;
 	uint32_t dram_timing2;
 	uint32_t burstTime;
-	ULONG state, trrds, trrdl;
+	ULONG trrds, trrdl;
 	int result;
 
 	result = atomctrl_set_engine_dram_timings_rv770(hwmgr,
@@ -1522,7 +1520,6 @@ static int fiji_populate_memory_timing_parameters(struct pp_hwmgr *hwmgr,
 	dram_timing2 = cgs_read_register(hwmgr->device, mmMC_ARB_DRAM_TIMING2);
 	burstTime = cgs_read_register(hwmgr->device, mmMC_ARB_BURST_TIME);
 
-	state = PHM_GET_FIELD(burstTime, MC_ARB_BURST_TIME, STATE0);
 	trrds = PHM_GET_FIELD(burstTime, MC_ARB_BURST_TIME, TRRDS0);
 	trrdl = PHM_GET_FIELD(burstTime, MC_ARB_BURST_TIME, TRRDL0);
 
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
