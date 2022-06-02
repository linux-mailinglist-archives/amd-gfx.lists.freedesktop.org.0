Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525253C03C
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Jun 2022 23:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7634611328D;
	Thu,  2 Jun 2022 21:07:20 +0000 (UTC)
X-Original-To: amd-gfx@freedesktop.org
Delivered-To: amd-gfx@freedesktop.org
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A000211327E
 for <amd-gfx@freedesktop.org>; Thu,  2 Jun 2022 21:07:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C03080029D;
 Thu,  2 Jun 2022 21:01:06 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4CA7140240A;
 Thu,  2 Jun 2022 21:01:04 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/dm/mst: Stop grabbing mst_mgr->lock in
 compute_mst_dsc_configs_for_state()
Date: Thu,  2 Jun 2022 17:00:54 -0400
Message-Id: <20220602210056.73316-2-lyude@redhat.com>
In-Reply-To: <20220602210056.73316-1-lyude@redhat.com>
References: <20220602210056.73316-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, Hersen Wu <hersenwu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Noticed this while trying to update amdgpu for the non-atomic MST removal
changes - for some reason we appear to grab mst_mgr->lock before computing
mst DSC configs. This is wrong though - mst_mgr->lock is only needed while
traversing the actual MST topology state - which is not typically something
that DRM drivers should be doing themselves anyway.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 9221b6690a4a..cb3b0e08acc4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -1056,13 +1056,10 @@ bool compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
 		if (!is_dsc_need_re_compute(state, dc_state, stream->link))
 			continue;
 
-		mutex_lock(&aconnector->mst_mgr.lock);
 		if (!compute_mst_dsc_configs_for_link(state, dc_state, stream->link,
 			vars, &link_vars_start_index)) {
-			mutex_unlock(&aconnector->mst_mgr.lock);
 			return false;
 		}
-		mutex_unlock(&aconnector->mst_mgr.lock);
 
 		for (j = 0; j < dc_state->stream_count; j++) {
 			if (dc_state->streams[j]->link == stream->link)
-- 
2.35.3

