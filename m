Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E211488DEE2
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 13:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5473C10FBD8;
	Wed, 27 Mar 2024 12:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jL/+v8wk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF1C10FBD6;
 Wed, 27 Mar 2024 12:19:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D41E0614E2;
 Wed, 27 Mar 2024 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751D7C433F1;
 Wed, 27 Mar 2024 12:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711541988;
 bh=egbXLkqW2ltqYLDtV6wrlHM4IKYp43oTYDDs7XtRjas=;
 h=From:To:Cc:Subject:Date:From;
 b=jL/+v8wk6SaqbT5RprVf52E/yxtdY+3GRIdgJJxpr8NUpRn6f/9SDoPGKQczfXUlU
 PFLCnXIFxm/1vdJjmxExIAChTXx6mkgh6zVzWDI6ruggtmTzbonSgxpjfjWrQuqcpf
 inbz1ZUpotGGjL5GrhWjkZtk9g5SBGVzFQLpel0Wf2KZKde1+5SGlVMZh6A5OdG+89
 tVuxCzY8BsNcznxrYNnmE4N+5nADGGEHb19JT2RbYB9GBvkpMiwdF4Qriq+hzt/KfM
 ewSJJfzVePbMEX0q9XX6GJgxkKzF/ejQI1Q1iPlaTtp+9Q7UH1wNQYffry6lwULAir
 Gzva0okKwawHA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	allen.pan@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Charlene Liu <charlene.liu@amd.com>, Alex Hung <alex.hung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: FAILED: Patch "drm/amd/display: Add a dc_state NULL check in
 dc_state_release" failed to apply to 5.10-stable tree
Date: Wed, 27 Mar 2024 08:19:46 -0400
Message-ID: <20240327121946.2835462-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 334b56cea5d9df5989be6cf1a5898114fa70ad98 Mon Sep 17 00:00:00 2001
From: Allen Pan <allen.pan@amd.com>
Date: Fri, 23 Feb 2024 18:20:16 -0500
Subject: [PATCH] drm/amd/display: Add a dc_state NULL check in
 dc_state_release

[How]
Check wheather state is NULL before releasing it.

Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Allen Pan <allen.pan@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 180ac47868c22..5cc7f8da209c5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -334,7 +334,8 @@ static void dc_state_free(struct kref *kref)
 
 void dc_state_release(struct dc_state *state)
 {
-	kref_put(&state->refcount, dc_state_free);
+	if (state != NULL)
+		kref_put(&state->refcount, dc_state_free);
 }
 /*
  * dc_state_add_stream() - Add a new dc_stream_state to a dc_state.
-- 
2.43.0




