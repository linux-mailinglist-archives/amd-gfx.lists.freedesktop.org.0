Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CEB92FA22
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2024 14:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF6810ECE8;
	Fri, 12 Jul 2024 12:23:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A454C10ECE2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2024 12:23:32 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 46CCNNRf223629; Fri, 12 Jul 2024 17:53:23 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 46CCNNIi223628;
 Fri, 12 Jul 2024 17:53:23 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/2] drm/amdgpu: add print support for sdma_v_5_2 ip_dump
Date: Fri, 12 Jul 2024 17:53:17 +0530
Message-Id: <20240712122317.223571-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240712122317.223571-1-sunil.khatri@amd.com>
References: <20240712122317.223571-1-sunil.khatri@amd.com>
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

Add support for ip dump for sdma_v_5_2 in devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 05a13086405b..dc1ca2205807 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -1722,6 +1722,29 @@ static void sdma_v5_2_ring_end_use(struct amdgpu_ring *ring)
 	amdgpu_gfx_off_ctrl(adev, true);
 }
 
+static void sdma_v5_2_print_ip_state(void *handle, struct drm_printer *p)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	int i, j;
+	uint32_t reg_count = ARRAY_SIZE(sdma_reg_list_5_2);
+	uint32_t instance_offset;
+
+	if (adev->sdma.ip_dump == NULL)
+		return;
+
+	drm_printf(p, "num_instances:%d\n", adev->sdma.num_instances);
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		instance_offset = i * reg_count;
+		drm_printf(p, "\nInstance:%d\n", i);
+
+		for (j = 0; j < reg_count; j++)
+			drm_printf(p, "%-50s \t 0x%08x\n", sdma_reg_list_5_2[j].reg_name,
+				   adev->sdma.ip_dump[instance_offset + j]);
+	}
+
+
+
+}
 static void sdma_v5_2_dump_ip_state(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -1760,6 +1783,7 @@ const struct amd_ip_funcs sdma_v5_2_ip_funcs = {
 	.set_powergating_state = sdma_v5_2_set_powergating_state,
 	.get_clockgating_state = sdma_v5_2_get_clockgating_state,
 	.dump_ip_state = sdma_v5_2_dump_ip_state,
+	.print_ip_state = sdma_v5_2_print_ip_state,
 };
 
 static const struct amdgpu_ring_funcs sdma_v5_2_ring_funcs = {
-- 
2.34.1

