Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F36B9447
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Mar 2023 13:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D7110E7C8;
	Tue, 14 Mar 2023 12:44:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C0910E7C6;
 Tue, 14 Mar 2023 12:44:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 138A3B818F3;
 Tue, 14 Mar 2023 12:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD10DC433EF;
 Tue, 14 Mar 2023 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678797839;
 bh=j1MGEQmNXwRQZbXTFfs+jQOVxqSqFNMBQT1eucoL3Ak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dgub9wu2g+tP8Aj4X7wCzfiJpWcpvrZFrQT6nJ51q1ymVvFSxMetAxU28zUSI1gdE
 JHptIOO8hwmrBy/Mc5syVfPtJp9w/+ggKFbrDE4aBdDyhM/XSI8SHsxzVlbtASn6Iz
 FFGsxZ5YZXuYpNjvXWPJ8BdaGzedH04IOG5sgF5O3H+ZTci7RSHD9p5fzKtPomfJeV
 qHv5sMkd9CqDhVTQmMiYdZaSS6rziCmd8ce9Q9UlZt+zHDuBWLAAjECqKNkHh4tzB/
 643DGtr6XXa0b8j+iPLw8osu5Ac5VaNbdXEH8DpQzmBeNR888CP/VGGdgJHhqq+Lo0
 J253yaYvIY6mg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 10/10] drm/amd/display: fix shift-out-of-bounds
 in CalculateVMAndRowBytes
Date: Tue, 14 Mar 2023 08:43:44 -0400
Message-Id: <20230314124344.471127-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314124344.471127-1-sashal@kernel.org>
References: <20230314124344.471127-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Alex Hung <alex.hung@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, Daniel Wheeler <daniel.wheeler@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Hung <alex.hung@amd.com>

[ Upstream commit 031f196d1b1b6d5dfcb0533b431e3ab1750e6189 ]

[WHY]
When PTEBufferSizeInRequests is zero, UBSAN reports the following
warning because dml_log2 returns an unexpected negative value:

  shift exponent 4294966273 is too large for 32-bit type 'int'

[HOW]

In the case PTEBufferSizeInRequests is zero, skip the dml_log2() and
assign the result directly.

Reviewed-by: Jun Lei <Jun.Lei@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 518672a2450f4..de0fa87b301a5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1868,7 +1868,10 @@ static unsigned int CalculateVMAndRowBytes(
 	}
 
 	if (SurfaceTiling == dm_sw_linear) {
-		*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
+		if (PTEBufferSizeInRequests == 0)
+			*dpte_row_height = 1;
+		else
+			*dpte_row_height = dml_min(128, 1 << (unsigned int) dml_floor(dml_log2(PTEBufferSizeInRequests * *PixelPTEReqWidth / Pitch), 1));
 		*dpte_row_width_ub = (dml_ceil(((double) SwathWidth - 1) / *PixelPTEReqWidth, 1) + 1) * *PixelPTEReqWidth;
 		*PixelPTEBytesPerRow = *dpte_row_width_ub / *PixelPTEReqWidth * *PTERequestSize;
 	} else if (ScanDirection != dm_vert) {
-- 
2.39.2

