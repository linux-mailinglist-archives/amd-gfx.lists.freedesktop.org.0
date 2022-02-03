Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59C84A8D8B
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Feb 2022 21:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C357D10E5FD;
	Thu,  3 Feb 2022 20:31:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E63510E5FD;
 Thu,  3 Feb 2022 20:31:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA6E661A66;
 Thu,  3 Feb 2022 20:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C178C340E8;
 Thu,  3 Feb 2022 20:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643920292;
 bh=Me95Hl1kGor5YetTEHBi3lyv2nnCkkJQr/4ECFJl+fE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cLqaz5eYY7ApLzoeUSU5DotohrUJLQvlxtc/LalNqUr31nbloEQxlb4nCxwEr/XJj
 c1+TC0CF32NWRdGQL4k12vFGRvDtuMYq5AKKPku4OzbvjujHVX38tE9uckuZWPZ3H0
 Vl9EWnXbsE4bqN66r8CiEeBQrJvLk1pA03wjST8MbIKe4BfaLL6bANOOQKDWE83PJM
 OgjpewAj+skmaghvqYnzY3Ar49fydeoeJp8M+ItMh9K/6p59qQoogMaZa6V5TiNf8x
 4h0vD8kJTc6iEFbRXbX3+bQs4HZNNgFKwlwRUs1mmX2CSdfbo4nBgyKuCYuKZeN+xK
 N/pVE2a2gXh7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 39/52] drm/amdgpu/display: adjust msleep limit in
 dp_wait_for_training_aux_rd_interval
Date: Thu,  3 Feb 2022 15:29:33 -0500
Message-Id: <20220203202947.2304-39-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203202947.2304-1-sashal@kernel.org>
References: <20220203202947.2304-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, stylon.wang@amd.com,
 Wesley.Chalmers@amd.com, sunpeng.li@amd.com, wenjing.liu@amd.com,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 airlied@linux.ie, Jerry.Zuo@amd.com, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, George.Shen@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Jun.Lei@amd.com, Harry Wentland <harry.wentland@amd.com>,
 christian.koenig@amd.com, Jimmy.Kizito@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit dc919d670c6fd1ac81ebf31625cd19579f7b3d4c ]

Some architectures (e.g., ARM) have relatively low udelay limits.
On most architectures, anything longer than 2000us is not recommended.
Change the check to align with other similar checks in DC.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 13bc69d6b6791..01ac1a64c78b9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -201,7 +201,7 @@ void dp_wait_for_training_aux_rd_interval(
 	uint32_t wait_in_micro_secs)
 {
 #if defined(CONFIG_DRM_AMD_DC_DCN)
-	if (wait_in_micro_secs > 16000)
+	if (wait_in_micro_secs > 1000)
 		msleep(wait_in_micro_secs/1000);
 	else
 		udelay(wait_in_micro_secs);
-- 
2.34.1

