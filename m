Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395B84D3D0
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Feb 2024 22:25:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460B010E7F3;
	Wed,  7 Feb 2024 21:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UmMaUcaz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA010E734;
 Wed,  7 Feb 2024 21:25:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0BECCE1B17;
 Wed,  7 Feb 2024 21:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71566C433F1;
 Wed,  7 Feb 2024 21:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707341139;
 bh=ETw1UgSt30BpklExWxNhFjNShXfG1dH3FHqdG0S9oK8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UmMaUcaz/aWMfoHPqKtG+bcFVejo5yMCDs5gttUqnk3Bgv2zADzSnmIUVAlaT0+pM
 Ss+lvzQ3r3X8acnMZHR8g5ifZBioC04NiyAs3LzKXJSQQJoneJpIeomf8nhaKmTuff
 oj5jTWHAyaued2jlTdXUsbNN58IkdOz/vvArPrhmmBtopvHrDpDfYE6twm8Jq+NoxC
 zNlBCvS4qfHSFltjwBDZo0G/gBTH14Av0wbajwQLplEN+hJbyxd0TLfocLnZn4iNS2
 G7qmfnuz7khD5/P+TeK+9DkrkjJv99S7ZSyTTAskeAi/FRYZ6j/jQ8ybTVAVLTn5yZ
 /ddodhJosiEWA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sohaib Nadeem <sohaib.nadeem@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, jun.lei@amd.com, wenjing.liu@amd.com,
 austin.zheng@amd.com, Qingqing.Zhuo@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 16/29] drm/amd/display: increased min_dcfclk_mhz
 and min_fclk_mhz
Date: Wed,  7 Feb 2024 16:24:41 -0500
Message-ID: <20240207212505.3169-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207212505.3169-1-sashal@kernel.org>
References: <20240207212505.3169-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.77
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sohaib Nadeem <sohaib.nadeem@amd.com>

[ Upstream commit 2ff33c759a4247c84ec0b7815f1f223e155ba82a ]

[why]
Originally, PMFW said min FCLK is 300Mhz, but min DCFCLK can be increased
to 400Mhz because min FCLK is now 600Mhz so FCLK >= 1.5 * DCFCLK hardware
requirement will still be satisfied. Increasing min DCFCLK addresses
underflow issues (underflow occurs when phantom pipe is turned on for some
Sub-Viewport configs).

[how]
Increasing DCFCLK by raising the min_dcfclk_mhz

Reviewed-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Acked-by: Tom Chung <chiahsuan.chung@amd.com>
Signed-off-by: Sohaib Nadeem <sohaib.nadeem@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 85e0d1c2a908..baecc0ffe758 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -2123,7 +2123,7 @@ static int build_synthetic_soc_states(struct clk_bw_params *bw_params,
 	unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0,
 			max_phyclk_mhz = 0, max_dtbclk_mhz = 0, max_fclk_mhz = 0, max_uclk_mhz = 0;
 
-	unsigned int min_dcfclk_mhz = 199, min_fclk_mhz = 299;
+	unsigned int min_dcfclk_mhz = 399, min_fclk_mhz = 599;
 
 	static const unsigned int num_dcfclk_stas = 5;
 	unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {199, 615, 906, 1324, 1564};
-- 
2.43.0

