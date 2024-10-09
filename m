Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB496996DA5
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2024 16:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7E510E74F;
	Wed,  9 Oct 2024 14:25:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6368C10E74A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2024 14:25:18 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 499EPDIZ891962; Wed, 9 Oct 2024 19:55:13 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 499EPDUX891961;
 Wed, 9 Oct 2024 19:55:13 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 10/13] drm/amdgpu: clean the dummy suspend functions
Date: Wed,  9 Oct 2024 19:54:59 +0530
Message-Id: <20241009142502.891864-11-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009142502.891864-1-sunil.khatri@amd.com>
References: <20241009142502.891864-1-sunil.khatri@amd.com>
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

Remove the dummy suspend functions for all
ip blocks.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c  | 6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/cik.c         | 6 ------
 drivers/gpu/drm/amd/amdgpu/si.c          | 6 ------
 4 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 1383fd1644d6..4d82e8fec0f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -66,11 +66,6 @@ static int isp_hw_fini(struct amdgpu_ip_block *ip_block)
 	return -ENODEV;
 }
 
-static int isp_suspend(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int isp_load_fw_by_psp(struct amdgpu_device *adev)
 {
 	const struct common_firmware_header *hdr;
@@ -161,7 +156,6 @@ static const struct amd_ip_funcs isp_ip_funcs = {
 	.late_init = NULL,
 	.hw_init = isp_hw_init,
 	.hw_fini = isp_hw_fini,
-	.suspend = isp_suspend,
 	.is_idle = isp_is_idle,
 	.wait_for_idle = isp_wait_for_idle,
 	.soft_reset = isp_soft_reset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index fd31e2e9feb9..ed8015313827 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -613,7 +613,8 @@ static int amdgpu_vkms_suspend(struct amdgpu_ip_block *ip_block)
 	r = drm_mode_config_helper_suspend(adev_to_drm(adev));
 	if (r)
 		return r;
-	return amdgpu_vkms_hw_fini(ip_block);
+
+	return 0;
 }
 
 static int amdgpu_vkms_resume(struct amdgpu_ip_block *ip_block)
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index f3f6b32d4e2a..c8fb592f13df 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2143,11 +2143,6 @@ static int cik_common_hw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int cik_common_suspend(struct amdgpu_ip_block *ip_block)
-{
-	return cik_common_hw_fini(ip_block);
-}
-
 static int cik_common_resume(struct amdgpu_ip_block *ip_block)
 {
 	return cik_common_hw_init(ip_block);
@@ -2187,7 +2182,6 @@ static const struct amd_ip_funcs cik_common_ip_funcs = {
 	.late_init = NULL,
 	.hw_init = cik_common_hw_init,
 	.hw_fini = cik_common_hw_fini,
-	.suspend = cik_common_suspend,
 	.resume = cik_common_resume,
 	.is_idle = cik_common_is_idle,
 	.wait_for_idle = cik_common_wait_for_idle,
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index f0817d5fbea8..66ccb76eb72a 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2639,11 +2639,6 @@ static int si_common_hw_fini(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int si_common_suspend(struct amdgpu_ip_block *ip_block)
-{
-	return si_common_hw_fini(ip_block);
-}
-
 static int si_common_resume(struct amdgpu_ip_block *ip_block)
 {
 	return si_common_hw_init(ip_block);
@@ -2682,7 +2677,6 @@ static const struct amd_ip_funcs si_common_ip_funcs = {
 	.late_init = NULL,
 	.hw_init = si_common_hw_init,
 	.hw_fini = si_common_hw_fini,
-	.suspend = si_common_suspend,
 	.resume = si_common_resume,
 	.is_idle = si_common_is_idle,
 	.wait_for_idle = si_common_wait_for_idle,
-- 
2.34.1

