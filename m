Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206A588DDE6
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E5810FB0D;
	Wed, 27 Mar 2024 12:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XxY+awt1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6F210FB0D;
 Wed, 27 Mar 2024 12:12:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E12AD61516;
 Wed, 27 Mar 2024 12:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D360C433F1;
 Wed, 27 Mar 2024 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541523;
 bh=CUokZle71eVi5IZgVUJqOoWc8rIzAKb9BeedCsdmd6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=XxY+awt1rJyORNo11WnsLZRAA2OIz/9urXHWsgeDsTzaLW4vej6kDRcODarCsoeYU
 2zlMqxMnNAbmJ6ig8JxHQRxLTRDSdKX2p7A+dUGyiVdT2Uc3NqmjDw5Lc+DC2ax7+D
 WwQHWlnsLwqK4NroGTXruPgKhVBEnMkVMqB9aaMuymR8FpQh+EhPyLps1hyHicqXnS
 +PiISraC7nfiQrfbGoZAHDeYbbGAbRITTaisWO/mkkeHt2TnfZ9LC/PbQynykkMvIs
 kETOEtwcLmn7BIsA7XH3ICw4GBv2/hgR39dok3WvtG4RKrgAVTSH6A18QaKcUwiIC7
 DF3GtN7eIRrlA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dillon.varone@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Martin Leung <martin.leung@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Init link enc resources in dc_state
 only if res_pool presents" failed to apply to 6.1-stable tree
Date: Wed, 27 Mar 2024 08:12:01 -0400
Message-ID: <20240327121201.2829199-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
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

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From ca25a2b5f841f991e472e2dde7f5e2d337dbea08 Mon Sep 17 00:00:00 2001
From: Dillon Varone <dillon.varone@amd.com>
Date: Thu, 28 Dec 2023 21:36:39 -0500
Subject: [PATCH] drm/amd/display: Init link enc resources in dc_state only if
 res_pool presents

[Why & How]
res_pool is not initialized in all situations such as virtual
environments, and therefore link encoder resources should not be
initialized if res_pool is NULL.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Martin Leung <martin.leung@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 460a8010c79fe..56feee0ff01b1 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -267,7 +267,8 @@ void dc_state_construct(struct dc *dc, struct dc_state *state)
 	state->clk_mgr = dc->clk_mgr;
 
 	/* Initialise DIG link encoder resource tracking variables. */
-	link_enc_cfg_init(dc, state);
+	if (dc->res_pool)
+		link_enc_cfg_init(dc, state);
 }
 
 void dc_state_destruct(struct dc_state *state)
-- 
2.43.0




