Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5AE6A3655
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Feb 2023 03:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA2310E173;
	Mon, 27 Feb 2023 02:01:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838BB10E173;
 Mon, 27 Feb 2023 02:00:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6C9160CFB;
 Mon, 27 Feb 2023 02:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78E1C4339E;
 Mon, 27 Feb 2023 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463258;
 bh=yDEmqvxwsg0vE2JAlr2G8lYxZpQza/IUr6UE/jPyzYI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GK8uIQcy3rgE5Qb/jwnYzAuF6y/PnylBW/nyN6fFjd5MdxLQzBvSJ/SACD2a+QW0z
 QiIyG+Y3BdIuiDkNoRaM7VwjvrPfMEQ8tDavgiBrBXFsydTKbQ6KZk6hEEqeJWHlzy
 CrqEgAVRMWZqzFYIUUA0A9sqzcBPj4jLn0TTtodZZk+fJVr5l7Bv3V6p013AIj1kiV
 Vc+QQAE9h1NvrTgYD3hGWZeVMpf6KNrjDiq6Roq0l/srsBNmY87q6aQIDIdXxvQjjl
 alnYw/Zd8Q/X3QAJU1+3wJJV3IWlAyivOmKgR4GQ5tINTxL+saV/ClYU+DPZ/NfeR8
 x8WDz1PzBiPAw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 03/60] drm/amd/display: Reduce expected sdp
 bandwidth for dcn321
Date: Sun, 26 Feb 2023 20:59:48 -0500
Message-Id: <20230227020045.1045105-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Dillon Varone <Dillon.Varone@amd.com>,
 george.shen@amd.com, amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com,
 airlied@gmail.com, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Samson.Tam@amd.com, yang.lee@linux.alibaba.com,
 alvin.lee2@amd.com, daniel@ffwll.ch, Jasdeep Dhillon <jdhillon@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dillon Varone <Dillon.Varone@amd.com>

[ Upstream commit 6b81090d6d4cc0fd818c9ec9dbb6906f921ad396 ]

[Description]
Modify soc BB to reduce expected sdp bandwidth and align with measurements to
fix underflow issues.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Jasdeep Dhillon <jdhillon@amd.com>
Signed-off-by: Dillon Varone <Dillon.Varone@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
index f4b176599be7a..0ea406145c1d7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c
@@ -136,7 +136,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_21_soc = {
 	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
 	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
 	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
-	.pct_ideal_sdp_bw_after_urgent = 100.0,
+	.pct_ideal_sdp_bw_after_urgent = 90.0,
 	.pct_ideal_fabric_bw_after_urgent = 67.0,
 	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 20.0,
 	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0, // N/A, for now keep as is until DML implemented
-- 
2.39.0

