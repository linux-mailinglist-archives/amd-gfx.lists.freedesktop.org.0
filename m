Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADB79A3F7F
	for <lists+amd-gfx@lfdr.de>; Fri, 18 Oct 2024 15:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96BF10E920;
	Fri, 18 Oct 2024 13:23:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976410E914
 for <amd-gfx@lists.freedesktop.org>; Fri, 18 Oct 2024 13:23:45 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 49IDNdw71638318; Fri, 18 Oct 2024 18:53:39 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 49IDNd981638317;
 Fri, 18 Oct 2024 18:53:39 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Liu <leo.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v6 09/12] drm/amdgpu: clean the dummy wait_for_idle functions
Date: Fri, 18 Oct 2024 18:53:24 +0530
Message-Id: <20241018132327.1638247-10-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018132327.1638247-1-sunil.khatri@amd.com>
References: <20241018132327.1638247-1-sunil.khatri@amd.com>
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

Remove the dummy wait_for_idle functions for all
ip blocks.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c          | 6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c          | 6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c         | 6 ------
 drivers/gpu/drm/amd/amdgpu/cik.c                 | 6 +-----
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c           | 6 ------
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c           | 6 ------
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c            | 6 ------
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c            | 6 ------
 drivers/gpu/drm/amd/amdgpu/nv.c                  | 6 ------
 drivers/gpu/drm/amd/amdgpu/si.c                  | 6 ------
 drivers/gpu/drm/amd/amdgpu/soc15.c               | 6 ------
 drivers/gpu/drm/amd/amdgpu/soc21.c               | 6 ------
 drivers/gpu/drm/amd/amdgpu/soc24.c               | 6 ------
 drivers/gpu/drm/amd/amdgpu/vi.c                  | 6 ------
 drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c       | 7 -------
 drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 6 ------
 16 files changed, 1 insertion(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
index 8e0725198dae..1a9b7e8947d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c
@@ -584,11 +584,6 @@ static bool acp_is_idle(void *handle)
 	return true;
 }
 
-static int acp_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int acp_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -622,7 +617,6 @@ static const struct amd_ip_funcs acp_ip_funcs = {
 	.suspend = acp_suspend,
 	.resume = acp_resume,
 	.is_idle = acp_is_idle,
-	.wait_for_idle = acp_wait_for_idle,
 	.soft_reset = acp_soft_reset,
 	.set_clockgating_state = acp_set_clockgating_state,
 	.set_powergating_state = acp_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
index 4d82e8fec0f5..4832a179d8c3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
@@ -128,11 +128,6 @@ static bool isp_is_idle(void *handle)
 	return true;
 }
 
-static int isp_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int isp_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -157,7 +152,6 @@ static const struct amd_ip_funcs isp_ip_funcs = {
 	.hw_init = isp_hw_init,
 	.hw_fini = isp_hw_fini,
 	.is_idle = isp_is_idle,
-	.wait_for_idle = isp_wait_for_idle,
 	.soft_reset = isp_soft_reset,
 	.set_clockgating_state = isp_set_clockgating_state,
 	.set_powergating_state = isp_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index ed8015313827..1f2bc8116434 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -632,11 +632,6 @@ static bool amdgpu_vkms_is_idle(void *handle)
 	return true;
 }
 
-static int amdgpu_vkms_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int amdgpu_vkms_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -665,7 +660,6 @@ static const struct amd_ip_funcs amdgpu_vkms_ip_funcs = {
 	.suspend = amdgpu_vkms_suspend,
 	.resume = amdgpu_vkms_resume,
 	.is_idle = amdgpu_vkms_is_idle,
-	.wait_for_idle = amdgpu_vkms_wait_for_idle,
 	.soft_reset = amdgpu_vkms_soft_reset,
 	.set_clockgating_state = amdgpu_vkms_set_clockgating_state,
 	.set_powergating_state = amdgpu_vkms_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/cik.c b/drivers/gpu/drm/amd/amdgpu/cik.c
index c8fb592f13df..52d177007287 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik.c
@@ -2153,10 +2153,7 @@ static bool cik_common_is_idle(void *handle)
 	return true;
 }
 
-static int cik_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
+
 
 static int cik_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
@@ -2184,7 +2181,6 @@ static const struct amd_ip_funcs cik_common_ip_funcs = {
 	.hw_fini = cik_common_hw_fini,
 	.resume = cik_common_resume,
 	.is_idle = cik_common_is_idle,
-	.wait_for_idle = cik_common_wait_for_idle,
 	.soft_reset = cik_common_soft_reset,
 	.set_clockgating_state = cik_common_set_clockgating_state,
 	.set_powergating_state = cik_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 2d0a24a343f7..a5985663a867 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -2948,11 +2948,6 @@ static bool dce_v10_0_is_idle(void *handle)
 	return true;
 }
 
-static int dce_v10_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static bool dce_v10_0_check_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	struct amdgpu_device *adev = ip_block->adev;
@@ -3330,7 +3325,6 @@ static const struct amd_ip_funcs dce_v10_0_ip_funcs = {
 	.suspend = dce_v10_0_suspend,
 	.resume = dce_v10_0_resume,
 	.is_idle = dce_v10_0_is_idle,
-	.wait_for_idle = dce_v10_0_wait_for_idle,
 	.check_soft_reset = dce_v10_0_check_soft_reset,
 	.soft_reset = dce_v10_0_soft_reset,
 	.set_clockgating_state = dce_v10_0_set_clockgating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 386ece7bc389..5c907a1a4778 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -3086,11 +3086,6 @@ static bool dce_v11_0_is_idle(void *handle)
 	return true;
 }
 
-static int dce_v11_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int dce_v11_0_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	u32 srbm_soft_reset = 0, tmp;
@@ -3462,7 +3457,6 @@ static const struct amd_ip_funcs dce_v11_0_ip_funcs = {
 	.suspend = dce_v11_0_suspend,
 	.resume = dce_v11_0_resume,
 	.is_idle = dce_v11_0_is_idle,
-	.wait_for_idle = dce_v11_0_wait_for_idle,
 	.soft_reset = dce_v11_0_soft_reset,
 	.set_clockgating_state = dce_v11_0_set_clockgating_state,
 	.set_powergating_state = dce_v11_0_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index cd3e0118988d..a53e4fac89dc 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -2843,11 +2843,6 @@ static bool dce_v6_0_is_idle(void *handle)
 	return true;
 }
 
-static int dce_v6_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int dce_v6_0_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	DRM_INFO("xxxx: dce_v6_0_soft_reset --- no impl!!\n");
@@ -3152,7 +3147,6 @@ static const struct amd_ip_funcs dce_v6_0_ip_funcs = {
 	.suspend = dce_v6_0_suspend,
 	.resume = dce_v6_0_resume,
 	.is_idle = dce_v6_0_is_idle,
-	.wait_for_idle = dce_v6_0_wait_for_idle,
 	.soft_reset = dce_v6_0_soft_reset,
 	.set_clockgating_state = dce_v6_0_set_clockgating_state,
 	.set_powergating_state = dce_v6_0_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 295bc1d47095..9278e0d8d00c 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -2866,11 +2866,6 @@ static bool dce_v8_0_is_idle(void *handle)
 	return true;
 }
 
-static int dce_v8_0_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int dce_v8_0_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	u32 srbm_soft_reset = 0, tmp;
@@ -3240,7 +3235,6 @@ static const struct amd_ip_funcs dce_v8_0_ip_funcs = {
 	.suspend = dce_v8_0_suspend,
 	.resume = dce_v8_0_resume,
 	.is_idle = dce_v8_0_is_idle,
-	.wait_for_idle = dce_v8_0_wait_for_idle,
 	.soft_reset = dce_v8_0_soft_reset,
 	.set_clockgating_state = dce_v8_0_set_clockgating_state,
 	.set_powergating_state = dce_v8_0_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 95c6461aab6f..38f5a2cbc3fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -1039,11 +1039,6 @@ static bool nv_common_is_idle(void *handle)
 	return true;
 }
 
-static int nv_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int nv_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -1111,7 +1106,6 @@ static const struct amd_ip_funcs nv_common_ip_funcs = {
 	.suspend = nv_common_suspend,
 	.resume = nv_common_resume,
 	.is_idle = nv_common_is_idle,
-	.wait_for_idle = nv_common_wait_for_idle,
 	.soft_reset = nv_common_soft_reset,
 	.set_clockgating_state = nv_common_set_clockgating_state,
 	.set_powergating_state = nv_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/si.c b/drivers/gpu/drm/amd/amdgpu/si.c
index 66ccb76eb72a..36f17c87de85 100644
--- a/drivers/gpu/drm/amd/amdgpu/si.c
+++ b/drivers/gpu/drm/amd/amdgpu/si.c
@@ -2649,11 +2649,6 @@ static bool si_common_is_idle(void *handle)
 	return true;
 }
 
-static int si_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int si_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -2679,7 +2674,6 @@ static const struct amd_ip_funcs si_common_ip_funcs = {
 	.hw_fini = si_common_hw_fini,
 	.resume = si_common_resume,
 	.is_idle = si_common_is_idle,
-	.wait_for_idle = si_common_wait_for_idle,
 	.soft_reset = si_common_soft_reset,
 	.set_clockgating_state = si_common_set_clockgating_state,
 	.set_powergating_state = si_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index dd1c1aacdd8e..d974c0b5a909 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -1341,11 +1341,6 @@ static bool soc15_common_is_idle(void *handle)
 	return true;
 }
 
-static int soc15_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int soc15_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -1501,7 +1496,6 @@ static const struct amd_ip_funcs soc15_common_ip_funcs = {
 	.suspend = soc15_common_suspend,
 	.resume = soc15_common_resume,
 	.is_idle = soc15_common_is_idle,
-	.wait_for_idle = soc15_common_wait_for_idle,
 	.soft_reset = soc15_common_soft_reset,
 	.set_clockgating_state = soc15_common_set_clockgating_state,
 	.set_powergating_state = soc15_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/soc21.c b/drivers/gpu/drm/amd/amdgpu/soc21.c
index cdcc5c09a6b3..78550a965579 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc21.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc21.c
@@ -927,11 +927,6 @@ static bool soc21_common_is_idle(void *handle)
 	return true;
 }
 
-static int soc21_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int soc21_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -1000,7 +995,6 @@ static const struct amd_ip_funcs soc21_common_ip_funcs = {
 	.suspend = soc21_common_suspend,
 	.resume = soc21_common_resume,
 	.is_idle = soc21_common_is_idle,
-	.wait_for_idle = soc21_common_wait_for_idle,
 	.soft_reset = soc21_common_soft_reset,
 	.set_clockgating_state = soc21_common_set_clockgating_state,
 	.set_powergating_state = soc21_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/soc24.c b/drivers/gpu/drm/amd/amdgpu/soc24.c
index 34ed064a6a64..216a45556cf4 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc24.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc24.c
@@ -522,11 +522,6 @@ static bool soc24_common_is_idle(void *handle)
 	return true;
 }
 
-static int soc24_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int soc24_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -591,7 +586,6 @@ static const struct amd_ip_funcs soc24_common_ip_funcs = {
 	.suspend = soc24_common_suspend,
 	.resume = soc24_common_resume,
 	.is_idle = soc24_common_is_idle,
-	.wait_for_idle = soc24_common_wait_for_idle,
 	.soft_reset = soc24_common_soft_reset,
 	.set_clockgating_state = soc24_common_set_clockgating_state,
 	.set_powergating_state = soc24_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
index 7a19b4f5b09f..a40c789dc3c4 100644
--- a/drivers/gpu/drm/amd/amdgpu/vi.c
+++ b/drivers/gpu/drm/amd/amdgpu/vi.c
@@ -1741,11 +1741,6 @@ static bool vi_common_is_idle(void *handle)
 	return true;
 }
 
-static int vi_common_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int vi_common_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -2043,7 +2038,6 @@ static const struct amd_ip_funcs vi_common_ip_funcs = {
 	.suspend = vi_common_suspend,
 	.resume = vi_common_resume,
 	.is_idle = vi_common_is_idle,
-	.wait_for_idle = vi_common_wait_for_idle,
 	.soft_reset = vi_common_soft_reset,
 	.set_clockgating_state = vi_common_set_clockgating_state,
 	.set_powergating_state = vi_common_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
index 2cd6cb991f29..fbea169460f2 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
@@ -3099,12 +3099,6 @@ static bool kv_dpm_is_idle(void *handle)
 	return true;
 }
 
-static int kv_dpm_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
-
 static int kv_dpm_soft_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -3313,7 +3307,6 @@ static const struct amd_ip_funcs kv_dpm_ip_funcs = {
 	.suspend = kv_dpm_suspend,
 	.resume = kv_dpm_resume,
 	.is_idle = kv_dpm_is_idle,
-	.wait_for_idle = kv_dpm_wait_for_idle,
 	.soft_reset = kv_dpm_soft_reset,
 	.set_clockgating_state = kv_dpm_set_clockgating_state,
 	.set_powergating_state = kv_dpm_set_powergating_state,
diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
index f193c77cc141..7eacf4dd1b60 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
@@ -244,11 +244,6 @@ static bool pp_is_idle(void *handle)
 	return false;
 }
 
-static int pp_wait_for_idle(struct amdgpu_ip_block *ip_block)
-{
-	return 0;
-}
-
 static int pp_sw_reset(struct amdgpu_ip_block *ip_block)
 {
 	return 0;
@@ -295,7 +290,6 @@ static const struct amd_ip_funcs pp_ip_funcs = {
 	.suspend = pp_suspend,
 	.resume = pp_resume,
 	.is_idle = pp_is_idle,
-	.wait_for_idle = pp_wait_for_idle,
 	.soft_reset = pp_sw_reset,
 	.set_clockgating_state = pp_set_clockgating_state,
 	.set_powergating_state = pp_set_powergating_state,
-- 
2.34.1

