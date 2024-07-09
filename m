Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52C92AFC4
	for <lists+amd-gfx@lfdr.de>; Tue,  9 Jul 2024 08:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6686E10E127;
	Tue,  9 Jul 2024 06:07:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07C910E127
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jul 2024 06:07:32 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46967SOa1568344; Tue, 9 Jul 2024 11:37:28 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46967SY71568343;
 Tue, 9 Jul 2024 11:37:28 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/3] drm/amdgpu: select compute ME engines dynamically
Date: Tue,  9 Jul 2024 11:37:22 +0530
Message-Id: <20240709060723.1568284-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240709060723.1568284-1-sunil.khatri@amd.com>
References: <20240709060723.1568284-1-sunil.khatri@amd.com>
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

GFX ME right now is one but this could change in
future SOC's. Use no of ME for GFX as start point
for ME for compute for GFX11.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 4f57cf3dac48..dcef39907449 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -6456,7 +6456,7 @@ static void gfx_v11_ip_dump(void *handle)
 		for (j = 0; j < adev->gfx.mec.num_pipe_per_mec; j++) {
 			for (k = 0; k < adev->gfx.mec.num_queue_per_pipe; k++) {
 				/* ME0 is for GFX so start from 1 for CP */
-				soc21_grbm_select(adev, 1+i, j, k, 0);
+				soc21_grbm_select(adev, adev->gfx.me.num_me + i, j, k, 0);
 				for (reg = 0; reg < reg_count; reg++) {
 					adev->gfx.ip_dump_compute_queues[index + reg] =
 						RREG32(SOC15_REG_ENTRY_OFFSET(
-- 
2.34.1

