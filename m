Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7458A7401
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Apr 2024 20:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967F5112DDE;
	Tue, 16 Apr 2024 18:59:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44BF3112DD6
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Apr 2024 18:59:35 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 43GIxU3E230783; Wed, 17 Apr 2024 00:29:30 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 43GIxU6o230782;
 Wed, 17 Apr 2024 00:29:30 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2 3/6] drm/amdgpu: add protype for print ip state
Date: Wed, 17 Apr 2024 00:29:20 +0530
Message-Id: <20240416185923.230700-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416185923.230700-1-sunil.khatri@amd.com>
References: <20240416185923.230700-1-sunil.khatri@amd.com>
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

Add the protoype for print ip state to be used
to print the registers in devcoredump during
a gpu reset.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c      | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/cik.c                  | 1 +
 drivers/gpu/drm/amd/amdgpu/cik_ih.c               | 1 +
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/cz_ih.c                | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c              | 1 +
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c              | 1 +
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c              | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c            | 2 ++
 drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/nv.c                   | 1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c            | 1 +
 drivers/gpu/drm/amd/amdgpu/si.c                   | 1 +
 drivers/gpu/drm/amd/amdgpu/si_dma.c               | 1 +
 drivers/gpu/drm/amd/amdgpu/si_ih.c                | 1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                | 1 +
 drivers/gpu/drm/amd/amdgpu/soc21.c                | 1 +
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vce_v2_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vce_v3_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c             | 2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c             | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c           | 1 +
 drivers/gpu/drm/amd/amdgpu/vi.c                   | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 drivers/gpu/drm/amd/include/amd_shared.h          | 2 ++
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c        | 1 +
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c        | 1 +
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c  | 1 +
 64 files changed, 67 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 34a62033a388..bf6c4a0d0525 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -638,6 +638,7 @@ static const struct amd_ip_funcs acp_ip_funcs = {
 	.set_clockgating_state = acp_set_clockgating_state,
 	.set_powergating_state = acp_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version acp_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index 5bb9e0dacbf3..06ad68714172 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -876,6 +876,7 @@ static const struct amd_ip_funcs umsch_mm_v4_0_ip_funcs = {
 	.suspend = umsch_mm_suspend,
 	.resume = umsch_mm_resume,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version umsch_mm_v4_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index d1dc91009c0e..e30eecd02ae1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -659,6 +659,7 @@ static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
 	.set_clockgating_state = amdgpu_vkms_set_clockgating_state,
 	.set_powergating_state = amdgpu_vkms_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version amdgpu_vkms_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index 884de42553a6..cf1d5d462b67 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2211,6 +2211,7 @@ static const struct amd_ip_funcs cik_common_ip_funcs = {
 	.set_clockgating_state = cik_common_set_clockgating_state,
 	.set_powergating_state = cik_common_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version cik_common_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 676f3f612fde..576baa9dbb0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -436,6 +436,7 @@ static const struct amd_ip_funcs cik_ih_ip_funcs = {
 	.set_clockgating_state = cik_ih_set_clockgating_state,
 	.set_powergating_state = cik_ih_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs cik_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index d797b1fbbffc..555f763077cc 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -1229,6 +1229,7 @@ static const struct amd_ip_funcs cik_sdma_ip_funcs = {
 	.set_clockgating_state = cik_sdma_set_clockgating_state,
 	.set_powergating_state = cik_sdma_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs cik_sdma_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index 958c84a6af7e..072643787384 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -434,6 +434,7 @@ static const struct amd_ip_funcs cz_ih_ip_funcs = {
 	.set_clockgating_state = cz_ih_set_clockgating_state,
 	.set_powergating_state = cz_ih_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs cz_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 7a32ca7d6fc4..b44fce44c066 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -3334,6 +3334,7 @@ static const struct amd_ip_funcs dce_v10_0_ip_funcs = {
 	.set_clockgating_state = dce_v10_0_set_clockgating_state,
 	.set_powergating_state = dce_v10_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 67c01e137fac..80b2e7f79acf 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3465,6 +3465,7 @@ static const struct amd_ip_funcs dce_v11_0_ip_funcs = {
 	.set_clockgating_state = dce_v11_0_set_clockgating_state,
 	.set_powergating_state = dce_v11_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 209cd44bbcec..db20012600f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -3155,6 +3155,7 @@ static const struct amd_ip_funcs dce_v6_0_ip_funcs = {
 	.set_clockgating_state = dce_v6_0_set_clockgating_state,
 	.set_powergating_state = dce_v6_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index fff7f4f766b2..5b56100ec902 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -3243,6 +3243,7 @@ static const struct amd_ip_funcs dce_v8_0_ip_funcs = {
 	.set_clockgating_state = dce_v8_0_set_clockgating_state,
 	.set_powergating_state = dce_v8_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static void
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 3b3fb41b138c..1b62f4984025 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -9299,6 +9299,7 @@ static const struct amd_ip_funcs gfx_v10_0_ip_funcs = {
 	.set_powergating_state = gfx_v10_0_set_powergating_state,
 	.get_clockgating_state = gfx_v10_0_get_clockgating_state,
 	.dump_ip_state = gfx_v10_ip_dump,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index fec076c90fd2..45f655c2b03d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -6170,6 +6170,7 @@ static const struct amd_ip_funcs gfx_v11_0_ip_funcs = {
 	.set_powergating_state = gfx_v11_0_set_powergating_state,
 	.get_clockgating_state = gfx_v11_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v11_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index 559250c8a147..d0992ce9fb47 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3458,6 +3458,7 @@ static const struct amd_ip_funcs gfx_v6_0_ip_funcs = {
 	.set_clockgating_state = gfx_v6_0_set_clockgating_state,
 	.set_powergating_state = gfx_v6_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v6_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 81f7ab0dc135..541dbd70d8c7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -4978,6 +4978,7 @@ static const struct amd_ip_funcs gfx_v7_0_ip_funcs = {
 	.set_clockgating_state = gfx_v7_0_set_clockgating_state,
 	.set_powergating_state = gfx_v7_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v7_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 522cbd45dd46..2f0e72caee1a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -6879,6 +6879,7 @@ static const struct amd_ip_funcs gfx_v8_0_ip_funcs = {
 	.set_powergating_state = gfx_v8_0_set_powergating_state,
 	.get_clockgating_state = gfx_v8_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index ff4229b005dc..75ea7c9e9c4d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -6857,6 +6857,7 @@ static const struct amd_ip_funcs gfx_v9_0_ip_funcs = {
 	.set_powergating_state = gfx_v9_0_set_powergating_state,
 	.get_clockgating_state = gfx_v9_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_gfx = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
index 16881e9345c8..835004187a58 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c
@@ -4017,6 +4017,7 @@ static const struct amd_ip_funcs gfx_v9_4_3_ip_funcs = {
 	.set_powergating_state = gfx_v9_4_3_set_powergating_state,
 	.get_clockgating_state = gfx_v9_4_3_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs gfx_v9_4_3_ring_funcs_compute = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 060e54b8ffff..3e38d8bfcb69 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -1116,6 +1116,7 @@ static const struct amd_ip_funcs gmc_v6_0_ip_funcs = {
 	.set_clockgating_state = gmc_v6_0_set_clockgating_state,
 	.set_powergating_state = gmc_v6_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v6_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 534825022ddd..85df8fc81065 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1355,6 +1355,7 @@ static const struct amd_ip_funcs gmc_v7_0_ip_funcs = {
 	.set_clockgating_state = gmc_v7_0_set_clockgating_state,
 	.set_powergating_state = gmc_v7_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v7_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index aba787e1386a..fc97757e33d9 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1718,6 +1718,7 @@ static const struct amd_ip_funcs gmc_v8_0_ip_funcs = {
 	.set_powergating_state = gmc_v8_0_set_powergating_state,
 	.get_clockgating_state = gmc_v8_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index 2d6f969266b8..07984f7c3ae7 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -426,6 +426,7 @@ static const struct amd_ip_funcs iceland_ih_ip_funcs = {
 	.set_clockgating_state = iceland_ih_set_clockgating_state,
 	.set_powergating_state = iceland_ih_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs iceland_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index e0756b954cf5..a99d3880dd1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -749,6 +749,7 @@ static const struct amd_ip_funcs ih_v6_0_ip_funcs = {
 	.set_powergating_state = ih_v6_0_set_powergating_state,
 	.get_clockgating_state = ih_v6_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v6_0_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index e9da3ac79321..61eb5e974b6a 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -754,6 +754,7 @@ static const struct amd_ip_funcs ih_v6_1_ip_funcs = {
 	.set_powergating_state = ih_v6_1_set_powergating_state,
 	.get_clockgating_state = ih_v6_1_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v6_1_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 31ed5030169b..aa6235dd4f2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -750,6 +750,7 @@ static const struct amd_ip_funcs ih_v7_0_ip_funcs = {
 	.set_powergating_state = ih_v7_0_set_powergating_state,
 	.get_clockgating_state = ih_v7_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs ih_v7_0_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
index 698c5d4b7484..ef3e42f6b841 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c
@@ -760,6 +760,7 @@ static const struct amd_ip_funcs jpeg_v2_0_ip_funcs = {
 	.set_clockgating_state = jpeg_v2_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v2_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
index 0a9a2d58e3ee..afeaf3c64e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c
@@ -633,6 +633,7 @@ static const struct amd_ip_funcs jpeg_v2_5_ip_funcs = {
 	.set_clockgating_state = jpeg_v2_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
@@ -654,6 +655,7 @@ static const struct amd_ip_funcs jpeg_v2_6_ip_funcs = {
 	.set_clockgating_state = jpeg_v2_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v2_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v2_5_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
index e03d46151ae3..1c7cf4800bf7 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v3_0.c
@@ -558,6 +558,7 @@ static const struct amd_ip_funcs jpeg_v3_0_ip_funcs = {
 	.set_clockgating_state = jpeg_v3_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v3_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v3_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
index f142cb200552..237fe5df5a8f 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0.c
@@ -720,6 +720,7 @@ static const struct amd_ip_funcs jpeg_v4_0_ip_funcs = {
 	.set_clockgating_state = jpeg_v4_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
index bc3a6f16f4bf..d66af11aa66c 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c
@@ -1054,6 +1054,7 @@ static const struct amd_ip_funcs jpeg_v4_0_3_ip_funcs = {
 	.set_clockgating_state = jpeg_v4_0_3_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_3_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_3_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
index ee29c97721ec..da6bb9022b80 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c
@@ -763,6 +763,7 @@ static const struct amd_ip_funcs jpeg_v4_0_5_ip_funcs = {
 	.set_clockgating_state = jpeg_v4_0_5_set_clockgating_state,
 	.set_powergating_state = jpeg_v4_0_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v4_0_5_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index f5664c92d10d..64c856bfe0cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -514,6 +514,7 @@ static const struct amd_ip_funcs jpeg_v5_0_0_ip_funcs = {
 	.set_clockgating_state = jpeg_v5_0_0_set_clockgating_state,
 	.set_powergating_state = jpeg_v5_0_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs jpeg_v5_0_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
index 4ed0429cf4f7..a626bf904926 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -1177,6 +1177,7 @@ static const struct amd_ip_funcs mes_v10_1_ip_funcs = {
 	.suspend = mes_v10_1_suspend,
 	.resume = mes_v10_1_resume,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version mes_v10_1_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
index 57f17c699d80..515938961629 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1335,6 +1335,7 @@ static const struct amd_ip_funcs mes_v11_0_ip_funcs = {
 	.suspend = mes_v11_0_suspend,
 	.resume = mes_v11_0_resume,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version mes_v11_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 550c5ca4ea03..b281462093f1 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -714,6 +714,7 @@ static const struct amd_ip_funcs navi10_ih_ip_funcs = {
 	.set_powergating_state = navi10_ih_set_powergating_state,
 	.get_clockgating_state = navi10_ih_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs navi10_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index d7d3b972392b..b5303cd3cb53 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1132,4 +1132,5 @@ static const struct amd_ip_funcs nv_common_ip_funcs = {
 	.set_powergating_state = nv_common_set_powergating_state,
 	.get_clockgating_state = nv_common_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 5c67c8a5c35f..3c67bd35302d 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -1114,6 +1114,7 @@ static const struct amd_ip_funcs sdma_v2_4_ip_funcs = {
 	.set_clockgating_state = sdma_v2_4_set_clockgating_state,
 	.set_powergating_state = sdma_v2_4_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs sdma_v2_4_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 4fad06daa9c9..060798bf04db 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -1554,6 +1554,7 @@ static const struct amd_ip_funcs sdma_v3_0_ip_funcs = {
 	.set_powergating_state = sdma_v3_0_set_powergating_state,
 	.get_clockgating_state = sdma_v3_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs sdma_v3_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index b5b15dba9a76..85235470e872 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2707,6 +2707,7 @@ static const struct amd_ip_funcs si_common_ip_funcs = {
 	.set_clockgating_state = si_common_set_clockgating_state,
 	.set_powergating_state = si_common_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version si_common_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index f969e5cc2a5e..c23d85542cfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -709,6 +709,7 @@ static const struct amd_ip_funcs si_dma_ip_funcs = {
 	.set_clockgating_state = si_dma_set_clockgating_state,
 	.set_powergating_state = si_dma_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs si_dma_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 3b7427f5a6c9..5237395e4fab 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -297,6 +297,7 @@ static const struct amd_ip_funcs si_ih_ip_funcs = {
 	.set_clockgating_state = si_ih_set_clockgating_state,
 	.set_powergating_state = si_ih_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs si_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 6ba6c96c91c8..a5d3c66b5868 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1502,4 +1502,5 @@ static const struct amd_ip_funcs soc15_common_ip_funcs = {
 	.set_powergating_state = soc15_common_set_powergating_state,
 	.get_clockgating_state= soc15_common_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index 40e7ab0716cd..27c26e42120e 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -986,4 +986,5 @@ static const struct amd_ip_funcs soc21_common_ip_funcs = {
 	.set_powergating_state = soc21_common_set_powergating_state,
 	.get_clockgating_state = soc21_common_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 794a1f7bc2ca..24d49d813607 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -487,6 +487,7 @@ static const struct amd_ip_funcs tonga_ih_ip_funcs = {
 	.set_clockgating_state = tonga_ih_set_clockgating_state,
 	.set_powergating_state = tonga_ih_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ih_funcs tonga_ih_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
index 1e232ed23102..805d6662c88b 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v3_1.c
@@ -820,6 +820,7 @@ static const struct amd_ip_funcs uvd_v3_1_ip_funcs = {
 	.set_clockgating_state = uvd_v3_1_set_clockgating_state,
 	.set_powergating_state = uvd_v3_1_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version uvd_v3_1_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
index 48bcf41e5558..3f19c606f4de 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c
@@ -770,6 +770,7 @@ static const struct amd_ip_funcs uvd_v4_2_ip_funcs = {
 	.set_clockgating_state = uvd_v4_2_set_clockgating_state,
 	.set_powergating_state = uvd_v4_2_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v4_2_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
index 838b7d720c52..efd903c21d48 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v5_0.c
@@ -878,6 +878,7 @@ static const struct amd_ip_funcs uvd_v5_0_ip_funcs = {
 	.set_powergating_state = uvd_v5_0_set_powergating_state,
 	.get_clockgating_state = uvd_v5_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v5_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 036378f5f53f..495de5068455 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -1546,6 +1546,7 @@ static const struct amd_ip_funcs uvd_v6_0_ip_funcs = {
 	.set_powergating_state = uvd_v6_0_set_powergating_state,
 	.get_clockgating_state = uvd_v6_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs uvd_v6_0_ring_phys_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
index 2178cf5a27b7..66fada199bda 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
@@ -627,6 +627,7 @@ static const struct amd_ip_funcs vce_v2_0_ip_funcs = {
 	.set_clockgating_state = vce_v2_0_set_clockgating_state,
 	.set_powergating_state = vce_v2_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs vce_v2_0_ring_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
index 0f0d4b0d50cb..32517c364cf7 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
@@ -914,6 +914,7 @@ static const struct amd_ip_funcs vce_v3_0_ip_funcs = {
 	.set_powergating_state = vce_v3_0_set_powergating_state,
 	.get_clockgating_state = vce_v3_0_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs vce_v3_0_ring_phys_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 7ff5d0574454..cb253bd3a2a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1903,6 +1903,7 @@ static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
 	.set_clockgating_state = vcn_v1_0_set_clockgating_state,
 	.set_powergating_state = vcn_v1_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index 4df1b75f971a..f18fd61c435e 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -2009,6 +2009,7 @@ static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
 	.set_clockgating_state = vcn_v2_0_set_clockgating_state,
 	.set_powergating_state = vcn_v2_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index d91c3154641b..baec14bde2a2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1902,6 +1902,7 @@ static const struct amd_ip_funcs vcn_v2_5_ip_funcs = {
 	.set_clockgating_state = vcn_v2_5_set_clockgating_state,
 	.set_powergating_state = vcn_v2_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
@@ -1923,6 +1924,7 @@ static const struct amd_ip_funcs vcn_v2_6_ip_funcs = {
         .set_clockgating_state = vcn_v2_5_set_clockgating_state,
         .set_powergating_state = vcn_v2_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v2_5_ip_block =
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
index e64af339e924..91bfad1ef1a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -2231,6 +2231,7 @@ static const struct amd_ip_funcs vcn_v3_0_ip_funcs = {
 	.set_clockgating_state = vcn_v3_0_set_clockgating_state,
 	.set_powergating_state = vcn_v3_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v3_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index efaad53e2ffe..92478b1c0dc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -2131,6 +2131,7 @@ static const struct amd_ip_funcs vcn_v4_0_ip_funcs = {
 	.set_clockgating_state = vcn_v4_0_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v4_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
index 599b6466183e..2279d8fce03d 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c
@@ -1661,6 +1661,7 @@ static const struct amd_ip_funcs vcn_v4_0_3_ip_funcs = {
 	.set_clockgating_state = vcn_v4_0_3_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_3_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v4_0_3_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
index c649fa2c19e8..874b780ee09c 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c
@@ -1753,6 +1753,7 @@ static const struct amd_ip_funcs vcn_v4_0_5_ip_funcs = {
 	.set_clockgating_state = vcn_v4_0_5_set_clockgating_state,
 	.set_powergating_state = vcn_v4_0_5_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v4_0_5_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 9d0d1efd1acc..cfd351e22c14 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -1329,6 +1329,7 @@ static const struct amd_ip_funcs vcn_v5_0_0_ip_funcs = {
 	.set_clockgating_state = vcn_v5_0_0_set_clockgating_state,
 	.set_powergating_state = vcn_v5_0_0_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version vcn_v5_0_0_ip_block = {
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index a04aa6833fc5..d39c670f6220 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -2059,6 +2059,7 @@ static const struct amd_ip_funcs vi_common_ip_funcs = {
 	.set_powergating_state = vi_common_set_powergating_state,
 	.get_clockgating_state = vi_common_get_clockgating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 static const struct amdgpu_ip_block_version vi_common_ip_block =
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8bd8bd77b9be..af1685090246 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3121,6 +3121,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.set_clockgating_state = dm_set_clockgating_state,
 	.set_powergating_state = dm_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version dm_ip_block = {
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 9884f6c48a7d..7536c173a546 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -24,6 +24,7 @@
 #define __AMD_SHARED_H__
 
 #include <drm/amd_asic_type.h>
+#include <drm/drm_print.h>
 
 
 #define AMD_MAX_USEC_TIMEOUT		1000000  /* 1000 ms */
@@ -322,6 +323,7 @@ struct amd_ip_funcs {
 				     enum amd_powergating_state state);
 	void (*get_clockgating_state)(void *handle, u64 *flags);
 	void (*dump_ip_state)(void *handle);
+	void (*print_ip_state)(void *handle, struct drm_printer *p);
 };
 
 
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 8c07f8c7f3ab..6bb42d04b247 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3317,6 +3317,7 @@ static const struct amd_ip_funcs kv_dpm_ip_funcs = {
 	.set_clockgating_state = kv_dpm_set_clockgating_state,
 	.set_powergating_state = kv_dpm_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version kv_smu_ip_block = {
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index c312b9332326..f245fc0bc6d3 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -8061,6 +8061,7 @@ static const struct amd_ip_funcs si_dpm_ip_funcs = {
 	.set_clockgating_state = si_dpm_set_clockgating_state,
 	.set_powergating_state = si_dpm_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version si_smu_ip_block =
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index c63474ee17a7..5fb21a0508cd 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -303,6 +303,7 @@ static const struct amd_ip_funcs pp_ip_funcs = {
 	.set_clockgating_state = pp_set_clockgating_state,
 	.set_powergating_state = pp_set_powergating_state,
 	.dump_ip_state = NULL,
+	.print_ip_state = NULL,
 };
 
 const struct amdgpu_ip_block_version pp_smu_ip_block =
-- 
2.34.1

