Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DFB61E3C9
	for <lists+amd-gfx@lfdr.de>; Sun,  6 Nov 2022 18:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DC410E1B1;
	Sun,  6 Nov 2022 17:05:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D93C10E1B2;
 Sun,  6 Nov 2022 17:05:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F4BE60C3F;
 Sun,  6 Nov 2022 17:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B11C433C1;
 Sun,  6 Nov 2022 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667754304;
 bh=HTtkplH0Al1Xn/NgtjXg4+3UjrdAKVV8cT4XsQznA4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HD9QW1vmuSb+n5MPqf1US/6CH2bmtabcs69hdlKcv2gIf4vw+ZzdFN+zz+EeV6Cyt
 2x2BaWDhBoU8aHn7bmQuW0nBD8YBN0iQPCLk0GKyKkOJOi2ReplTNvQyI4Gq77B8Gb
 nWfJj6WDVtcL5k6yXq4W2SR1qiGiFmgJFk7XWlZLQ9hD04jZ1JzjMkZd9bDHxpqThi
 IzalO8L5+bX7nJ6eFS5Zz2eaE6XZ5fQeqmaUovJzcPRn7+vG3X5yOisy7B3yfgp/I/
 SA5ahdWELiGkOR2kUU9/jSlRnlvlc9v7M4Aw0NaW3WeftcS/v/3RadlhAMRZ/OKmcg
 wWYLn6GQrtStQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 28/30] drm/amd/display: Don't return false if no
 stream
Date: Sun,  6 Nov 2022 12:03:40 -0500
Message-Id: <20221106170345.1579893-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170345.1579893-1-sashal@kernel.org>
References: <20221106170345.1579893-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Ethan.Wellenreiter@amd.com,
 dri-devel@lists.freedesktop.org, sunpeng.li@amd.com, airlied@gmail.com,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Syed.Hassan@amd.com,
 amd-gfx@lists.freedesktop.org, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Jun.Lei@amd.com,
 harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alvin Lee <Alvin.Lee2@amd.com>

[ Upstream commit abe4d9f03fae76c9650b0d942faf6990b35c377b ]

pipe_ctx[i] exists even if the pipe is not
in use. If the pipe is not in use it will
always have a null stream, so don't return
false in this case.

Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Acked-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
Signed-off-by: Alvin Lee <Alvin.Lee2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 1f195c5b3377..13cd1f2e50ca 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -187,7 +187,7 @@ bool dcn32_all_pipes_have_stream_and_plane(struct dc *dc,
 		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
 
 		if (!pipe->stream)
-			return false;
+			continue;
 
 		if (!pipe->plane_state)
 			return false;
-- 
2.35.1

