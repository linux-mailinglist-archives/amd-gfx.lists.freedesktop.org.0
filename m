Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A266F94CFD5
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2024 14:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E8010E0FA;
	Fri,  9 Aug 2024 12:12:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D96E10E8E2
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2024 12:12:08 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 479CC2u84051506; Fri, 9 Aug 2024 17:42:02 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 479CC2LP4051505;
 Fri, 9 Aug 2024 17:42:02 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v1 2/4] drm/amdgpu: add print support for gfx9_4_3 ipdump
Date: Fri,  9 Aug 2024 17:41:55 +0530
Message-Id: <20240809121157.4051442-3-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240809121157.4051442-1-sunil.khatri@amd.com>
References: <20240809121157.4051442-1-sunil.khatri@amd.com>
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

Add support of gfx9_4_3 ipdump print so devcoredump
could trigger it to dump the captured registers
in devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 3bd84acba643..59417feac9a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -4304,6 +4304,28 @@ static void gfx_v9_4_3_ring_insert_nop(struct amdgpu_ring *ring, uint32_t num_no
 		amdgpu_ring_write(ring, ring->funcs->nop);
 }
 
+static void gfx_v9_4_3_ip_print(void *handle, struct drm_printer *p)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+	uint32_t i;
+	uint32_t xcc_id, xcc_offset, num_xcc;
+	uint32_t reg_count = ARRAY_SIZE(gc_reg_list_9_4_3);
+
+	if (!adev->gfx.ip_dump_core)
+		return;
+
+	num_xcc = NUM_XCC(adev->gfx.xcc_mask);
+	drm_printf(p, "Number of Instances:%d\n", num_xcc);
+	for (xcc_id = 0; xcc_id < num_xcc; xcc_id++) {
+		xcc_offset = xcc_id * reg_count;
+		drm_printf(p, "\nInstance id:%d\n", xcc_id);
+		for (i = 0; i < reg_count; i++)
+			drm_printf(p, "%-50s \t 0x%08x\n",
+				   gc_reg_list_9_4_3[i].reg_name,
+				   adev->gfx.ip_dump_core[xcc_offset + i]);
+	}
+}
+
 static void gfx_v9_4_3_ip_dump(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
@@ -4344,7 +4366,7 @@ static const struct amd_ip_funcs gfx_v9_4_3_ip_funcs = {
 	.set_powergating_state = gfx_v9_4_3_set_powergating_state,
 	.get_clockgating_state = gfx_v9_4_3_get_clockgating_state,
 	.dump_ip_state = gfx_v9_4_3_ip_dump,
-	.print_ip_state = NULL,
+	.print_ip_state = gfx_v9_4_3_ip_print,
 };
 
 static const struct amdgpu_ring_funcs gfx_v9_4_3_ring_funcs_compute = {
-- 
2.34.1

