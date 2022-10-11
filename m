Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D86C5FB2A7
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Oct 2022 14:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3437A10E315;
	Tue, 11 Oct 2022 12:48:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653EC10E043;
 Tue, 11 Oct 2022 12:41:34 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MmwLN6p0XzpVZ8;
 Tue, 11 Oct 2022 20:38:20 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 11 Oct 2022 20:41:31 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 20:41:30 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/amd/display: fix build error on arm64
Date: Tue, 11 Oct 2022 20:41:03 +0800
Message-ID: <20221011124103.2123883-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 Oct 2022 12:47:59 +0000
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
Cc: alexander.deucher@amd.com, jun.lei@amd.com, yangyingliang@huawei.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

dcn20_build_mapped_resource() and dcn20_acquire_dsc() is not defined,
if CONFIG_DRM_AMD_DC_DCN is disabled.

Fix the following build error on arm64:

  ERROR: modpost: "dcn20_build_mapped_resource" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
  ERROR: modpost: "dcn20_acquire_dsc" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Fixes: 20dad3813b3c ("drm/amd/display: Add a helper to map ODM/MPC/Multi-Plane resources")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4a6e867369b8..bbed5685d847 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -3721,12 +3721,16 @@ bool dc_resource_acquire_secondary_pipe_for_mpc_odm(
 		else
 			sec_pipe->stream_res.opp = sec_pipe->top_pipe->stream_res.opp;
 		if (sec_pipe->stream->timing.flags.DSC == 1) {
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 			dcn20_acquire_dsc(dc, &state->res_ctx, &sec_pipe->stream_res.dsc, pipe_idx);
+#endif
 			ASSERT(sec_pipe->stream_res.dsc);
 			if (sec_pipe->stream_res.dsc == NULL)
 				return false;
 		}
+#if defined(CONFIG_DRM_AMD_DC_DCN)
 		dcn20_build_mapped_resource(dc, state, sec_pipe->stream);
+#endif
 	}
 
 	return true;
-- 
2.25.1

