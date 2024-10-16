Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C09A0266
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2024 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D3E10E68F;
	Wed, 16 Oct 2024 07:23:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BD110E5DA
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2024 07:23:10 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49G7N11X1399773; Wed, 16 Oct 2024 12:53:01 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49G7N1xU1399772;
 Wed, 16 Oct 2024 12:53:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v3 09/16] drm/amdgpu: clean the dummy resume functions
Date: Wed, 16 Oct 2024 12:52:51 +0530
Message-Id: <20241016072258.1399698-10-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016072258.1399698-1-sunil.khatri@amd.com>
References: <20241016072258.1399698-1-sunil.khatri@amd.com>
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

Remove the dummy resume functions for all
ip blocks.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 9b98b40ac4db..1383fd1644d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -71,11 +71,6 @@ static int isp_suspend(struct amdgpu_ip_block *ip_block)
 	return 0;
 }
 
-static int isp_resume(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int isp_load_fw_by_psp(struct amdgpu_device *adev)
 {
 	const struct common_firmware_header *hdr;
@@ -167,7 +162,6 @@ static const struct amd_ip_funcs isp_ip_funcs = {
 	.hw_init = isp_hw_init,
 	.hw_fini = isp_hw_fini,
 	.suspend = isp_suspend,
-	.resume = isp_resume,
 	.is_idle = isp_is_idle,
 	.wait_for_idle = isp_wait_for_idle,
 	.soft_reset = isp_soft_reset,
-- 
2.34.1

