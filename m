Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1EA2E6F85
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Dec 2020 10:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 416E8893B8;
	Tue, 29 Dec 2020 09:43:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4C68926B;
 Tue, 29 Dec 2020 02:55:56 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D4fCq49zlzj0f4;
 Tue, 29 Dec 2020 10:55:03 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 29 Dec 2020 10:55:46 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: fix comparison pointer to bool warning in
 dc.c
Date: Tue, 29 Dec 2020 10:55:47 +0800
Message-ID: <1609210547-16776-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 29 Dec 2020 09:43:48 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes coccicheck warning:
drivers/gpu/drm/amd/display/dc/core/dc.c:1543:12-19: WARNING: Comparison
to bool
drivers/gpu/drm/amd/display/dc/core/dc.c:1496:14-42: WARNING: Comparison
to bool
drivers/gpu/drm/amd/display/dc/core/dc.c:971:15-48: WARNING: Comparison
to bool
drivers/gpu/drm/amd/display/dc/core/dc.c:976:15-44: WARNING: Comparison
to bool

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 58eb0d6..ea28b75 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -968,12 +968,12 @@ struct dc *dc_create(const struct dc_init_data *init_params)
 		goto alloc_fail;
 
 	if (init_params->dce_environment == DCE_ENV_VIRTUAL_HW) {
-		if (false == dc_construct_ctx(dc, init_params)) {
+		if (!dc_construct_ctx(dc, init_params)) {
 			dc_destruct(dc);
 			goto construct_fail;
 		}
 	} else {
-		if (false == dc_construct(dc, init_params)) {
+		if (!dc_construct(dc, init_params)) {
 			dc_destruct(dc);
 			goto construct_fail;
 		}
@@ -1493,7 +1493,7 @@ bool dc_commit_state(struct dc *dc, struct dc_state *context)
 	enum dc_status result = DC_ERROR_UNEXPECTED;
 	int i;
 
-	if (false == context_changed(dc, context))
+	if (!context_changed(dc, context))
 		return DC_OK;
 
 	DC_LOG_DC("%s: %d streams\n",
@@ -1540,7 +1540,7 @@ bool dc_acquire_release_mpc_3dlut(
 		if (found_pipe_idx) {
 			if (acquire && pool->funcs->acquire_post_bldn_3dlut)
 				ret = pool->funcs->acquire_post_bldn_3dlut(res_ctx, pool, mpcc_id, lut, shaper);
-			else if (acquire == false && pool->funcs->release_post_bldn_3dlut)
+			else if (!acquire && pool->funcs->release_post_bldn_3dlut)
 				ret = pool->funcs->release_post_bldn_3dlut(res_ctx, pool, lut, shaper);
 		}
 	}
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
