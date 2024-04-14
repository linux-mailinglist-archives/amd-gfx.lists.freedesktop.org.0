Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B827E8A2D4D
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Apr 2024 13:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B72E10F4E0;
	Fri, 12 Apr 2024 11:25:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF6610F44B
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Apr 2024 11:25:23 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 43CBPCYo025601; Fri, 12 Apr 2024 16:55:12 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 43CBPBO7025600;
 Fri, 12 Apr 2024 16:55:11 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add missing vbios version from devcoredump
Date: Fri, 12 Apr 2024 16:55:10 +0530
Message-Id: <20240412112510.25575-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add vbios version in the devcoredump along with formatting
the information with proper alignment.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index 1129e5e5fb42..64fe564b8036 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -188,10 +188,11 @@ static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
 		   adev->vpe.feature_version, adev->vpe.fw_version);
 
 	drm_printf(p, "\nVBIOS Information\n");
-	drm_printf(p, "name: %s\n", ctx->name);
-	drm_printf(p, "pn %s\n", ctx->vbios_pn);
-	drm_printf(p, "version: %s\n", ctx->vbios_ver_str);
-	drm_printf(p, "date: %s\n", ctx->date);
+	drm_printf(p, "vbios name       : %s\n", ctx->name);
+	drm_printf(p, "vbios pn         : %s\n", ctx->vbios_pn);
+	drm_printf(p, "vbios version    : %d\n", ctx->version);
+	drm_printf(p, "vbios ver_str    : %s\n", ctx->vbios_ver_str);
+	drm_printf(p, "vbios date       : %s\n", ctx->date);
 }
 
 static ssize_t
-- 
2.34.1

