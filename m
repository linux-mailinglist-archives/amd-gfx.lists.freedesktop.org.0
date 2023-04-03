Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D336D59AF
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Apr 2023 09:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BDC10E5F3;
	Tue,  4 Apr 2023 07:31:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 380 seconds by postgrey-1.36 at gabe;
 Mon, 03 Apr 2023 13:18:16 UTC
Received: from tretyak2.mcst.ru (tretyak2.mcst.ru [212.5.119.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2007D89153;
 Mon,  3 Apr 2023 13:18:16 +0000 (UTC)
Received: from tretyak2.mcst.ru (localhost [127.0.0.1])
 by tretyak2.mcst.ru (Postfix) with ESMTP id 02F3B102390;
 Mon,  3 Apr 2023 16:11:52 +0300 (MSK)
Received: from frog.lab.sun.mcst.ru (frog.lab.sun.mcst.ru [172.16.4.50])
 by tretyak2.mcst.ru (Postfix) with ESMTP id F19EE102391;
 Mon,  3 Apr 2023 16:11:01 +0300 (MSK)
Received: from artemiev-i.lab.sun.mcst.ru (avior-1 [192.168.53.223])
 by frog.lab.sun.mcst.ru (8.13.4/8.12.11) with ESMTP id 333DAwDL024350;
 Mon, 3 Apr 2023 16:10:58 +0300
From: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH] drm/amd/display: Fix potential null dereference
Date: Mon,  3 Apr 2023 16:10:37 +0300
Message-Id: <20230403131037.1912215-1-Igor.A.Artemiev@mcst.ru>
X-Mailer: git-send-email 2.39.0.152.ga5737674b6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.39/RELEASE,
 bases: 20111107 #2745587, check: 20230403 notchecked
X-AV-Checked: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 04 Apr 2023 07:31:53 +0000
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
Cc: lvc-project@linuxtesting.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The adev->dm.dc pointer can be NULL and dereferenced in amdgpu_dm_fini()
without checking.

Add a NULL pointer check before calling dc_dmub_srv_destroy(). 

Found by Linux Verification Center (linuxtesting.org) with SVACE. 

Fixes: 9a71c7d31734 ("drm/amd/display: Register DMUB service with DC")
Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a01fd41643fc..27f7a554874e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1854,7 +1854,8 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		dc_deinit_callbacks(adev->dm.dc);
 #endif
 
-	dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
+	if (adev->dm.dc)
+		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
 
 	if (dc_enable_dmub_notifications(adev->dm.dc)) {
 		kfree(adev->dm.dmub_notify);
-- 
2.30.2

