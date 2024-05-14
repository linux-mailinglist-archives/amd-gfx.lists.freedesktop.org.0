Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3308C4E6A
	for <lists+amd-gfx@lfdr.de>; Tue, 14 May 2024 11:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB11710E24F;
	Tue, 14 May 2024 09:10:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2610E24F
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 May 2024 09:10:27 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 44E9ALh5005467; Tue, 14 May 2024 14:40:21 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 44E9ALUj005466;
 Tue, 14 May 2024 14:40:21 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu: add more device info to the devcoredump
Date: Tue, 14 May 2024 14:40:19 +0530
Message-Id: <20240514091019.5441-1-sunil.khatri@amd.com>
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

Adding more device information:
a. PCI info
b. VRAM and GTT info
c. GDC config

Also correct the print layout and section information for
in devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
index c1cb62683695..f0a44d0dec27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
@@ -224,12 +224,29 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
 			   coredump->reset_task_info.process_name,
 			   coredump->reset_task_info.pid);
 
-	/* GPU IP's information of the SOC */
-	drm_printf(&p, "\nIP Information\n");
+	/* SOC Information */
+	drm_printf(&p, "\nSOC Information\n");
+	drm_printf(&p, "SOC Device id: %d\n", coredump->adev->pdev->device);
+	drm_printf(&p, "SOC PCI Revision id: %d\n", coredump->adev->pdev->revision);
 	drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
 	drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev_id);
 	drm_printf(&p, "SOC External Revision id: %d\n", coredump->adev->external_rev_id);
 
+	/* Memory Information */
+	drm_printf(&p, "\nSOC Memory Information\n");
+	drm_printf(&p, "real vram size: %llu\n", coredump->adev->gmc.real_vram_size);
+	drm_printf(&p, "visible vram size: %llu\n", coredump->adev->gmc.visible_vram_size);
+	drm_printf(&p, "visible vram size: %llu\n", coredump->adev->mman.gtt_mgr.manager.size);
+
+	/* GDS Config */
+	drm_printf(&p, "\nGDS Config\n");
+	drm_printf(&p, "gds: total size: %d\n", coredump->adev->gds.gds_size);
+	drm_printf(&p, "gds: compute partition size: %d\n", coredump->adev->gds.gds_size);
+	drm_printf(&p, "gds: gws per compute partition: %d\n", coredump->adev->gds.gws_size);
+	drm_printf(&p, "gds: os per compute partition: %d\n", coredump->adev->gds.oa_size);
+
+	/* HWIP Version Information */
+	drm_printf(&p, "\nHW IP Version Information\n");
 	for (int i = 1; i < MAX_HWIP; i++) {
 		for (int j = 0; j < HWIP_MAX_INSTANCE; j++) {
 			ver = coredump->adev->ip_versions[i][j];
-- 
2.34.1

