Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F09D709E
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Nov 2024 14:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D8310E4EA;
	Sun, 24 Nov 2024 13:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BiRaPziq";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CAC10E4E7;
 Sun, 24 Nov 2024 13:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8FBBC5C53B8;
 Sun, 24 Nov 2024 13:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EE7C4CECC;
 Sun, 24 Nov 2024 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455431;
 bh=DqWiCfpkrzTx2envKHNBpAO1sH0IGlyIeYuu6hZ0jJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BiRaPziq31VWRl9Hskl+THHZ5X2w16QQ5ABPp2CdKLbcBIZSrc5auJaD1ph8SYaP1
 y2CxlRkAJqzQ3bK3HKlvJ89fqSGVyyPSHSfueEItjNiU2XawJbDU/NTSjFoxIbHZeb
 hWUfJnijKBSXSpLhgAhg/allSfbJNpwm4FSmPJI7mUYqUqPi5EuIR+Llnk/dAhva0E
 17VERAVVE2IxO3rUKWaLueg6GrACngVFzxHSeYJiGJOwkavLw1bloHHp7xxjQKhWzI
 rQpGypoMSnQM7W0aEOr2Xaz/NzqobQhxuP8t07/gGBAd+frtBvOC/j/yIzvrESLZqx
 y4fLcmYS7dccw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Leo Ma <hanghong.ma@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Alvin.Lee2@amd.com,
 Samson.Tam@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com,
 joshua.aberback@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 067/107] drm/amd/display: Fix underflow when
 playing 8K video in full screen mode
Date: Sun, 24 Nov 2024 08:29:27 -0500
Message-ID: <20241124133301.3341829-67-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
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

From: Leo Ma <hanghong.ma@amd.com>

[ Upstream commit 4007f07a47de4a277f4760cac3aed1b31d973eea ]

[Why&How]
Flickering observed while playing 8k HEVC-10 bit video in full screen
mode with black border. We didn't support this case for subvp.
Make change to the existing check to disable subvp for this corner case.

Reviewed-by: Alvin Lee <alvin.lee2@amd.com>
Signed-off-by: Leo Ma <hanghong.ma@amd.com>
Signed-off-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index 8697eac1e1f7e..6c9e1a10911e2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -859,7 +859,7 @@ static void populate_dml21_plane_config_from_plane_state(struct dml2_context *dm
 	plane->immediate_flip = plane_state->flip_immediate;
 
 	plane->composition.rect_out_height_spans_vactive =
-		plane_state->dst_rect.height >= stream->timing.v_addressable &&
+		plane_state->dst_rect.height >= stream->src.height &&
 		stream->dst.height >= stream->timing.v_addressable;
 }
 
-- 
2.43.0

