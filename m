Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 652696B943A
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Mar 2023 13:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D073910E7BE;
	Tue, 14 Mar 2023 12:43:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C2D10E7BD;
 Tue, 14 Mar 2023 12:43:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D22E061774;
 Tue, 14 Mar 2023 12:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989C2C433EF;
 Tue, 14 Mar 2023 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678797822;
 bh=yjNMJTJ0RO3C3iNpdBJYuDltmk9wej9BzuKPkT0X7wc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LCaSIXvktG/72fG2JXBem6IRjuK5pnPi6W352sHDDPcuiu/+E6orkwi7Vb0qn+h1G
 z57NaVRWvYerDJfS1CaLX8uXA9t8Byk+7Fw9hEpRAtf2AP1Qp8xlaAn0To1W7Nyzje
 5sleWyg4iglIzUpe8MFQtQOlFcDTQhKgpYdTiEGi8TXa7e1dGbvHgSbRMCIuTwUJ+b
 N1SUF08qtPEJGrr6hWlJ7gRLoW2e0okcqI9MlTGdjJ6S98Tp+sRb0jsgGwQ87FHLEp
 hFBHFDa2Ef85BKvmc7ywiuV/WgND37QPVnNS4QeBZ2wPzsp17QRXFMTJgatvQxodmA
 yKHi8PhZ6J0QQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 12/13] drm/amdgpu: fix ttm_bo calltrace warning in
 psp_hw_fini
Date: Tue, 14 Mar 2023 08:43:24 -0400
Message-Id: <20230314124325.470931-12-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314124325.470931-1-sashal@kernel.org>
References: <20230314124325.470931-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Horatio Zhang <Hongkun.Zhang@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, longlyao <Longlong.Yao@amd.com>,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Horatio Zhang <Hongkun.Zhang@amd.com>

[ Upstream commit 23f4a2d29ba57bf88095f817de5809d427fcbe7e ]

The call trace occurs when the amdgpu is removed after
the mode1 reset. During mode1 reset, from suspend to resume,
there is no need to reinitialize the ta firmware buffer
which caused the bo pin_count increase redundantly.

[  489.885525] Call Trace:
[  489.885525]  <TASK>
[  489.885526]  amdttm_bo_put+0x34/0x50 [amdttm]
[  489.885529]  amdgpu_bo_free_kernel+0xe8/0x130 [amdgpu]
[  489.885620]  psp_free_shared_bufs+0xb7/0x150 [amdgpu]
[  489.885720]  psp_hw_fini+0xce/0x170 [amdgpu]
[  489.885815]  amdgpu_device_fini_hw+0x2ff/0x413 [amdgpu]
[  489.885960]  ? blocking_notifier_chain_unregister+0x56/0xb0
[  489.885962]  amdgpu_driver_unload_kms+0x51/0x60 [amdgpu]
[  489.886049]  amdgpu_pci_remove+0x5a/0x140 [amdgpu]
[  489.886132]  ? __pm_runtime_resume+0x60/0x90
[  489.886134]  pci_device_remove+0x3e/0xb0
[  489.886135]  __device_release_driver+0x1ab/0x2a0
[  489.886137]  driver_detach+0xf3/0x140
[  489.886138]  bus_remove_driver+0x6c/0xf0
[  489.886140]  driver_unregister+0x31/0x60
[  489.886141]  pci_unregister_driver+0x40/0x90
[  489.886142]  amdgpu_exit+0x15/0x451 [amdgpu]

Signed-off-by: Horatio Zhang <Hongkun.Zhang@amd.com>
Signed-off-by: longlyao <Longlong.Yao@amd.com>
Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 087147f09933a..3b8825a3e2336 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -1695,7 +1695,7 @@ static int psp_hdcp_initialize(struct psp_context *psp)
 	psp->hdcp_context.context.mem_context.shared_mem_size = PSP_HDCP_SHARED_MEM_SIZE;
 	psp->hdcp_context.context.ta_load_type = GFX_CMD_ID_LOAD_TA;
 
-	if (!psp->hdcp_context.context.initialized) {
+	if (!psp->hdcp_context.context.mem_context.shared_buf) {
 		ret = psp_ta_init_shared_buf(psp, &psp->hdcp_context.context.mem_context);
 		if (ret)
 			return ret;
@@ -1762,7 +1762,7 @@ static int psp_dtm_initialize(struct psp_context *psp)
 	psp->dtm_context.context.mem_context.shared_mem_size = PSP_DTM_SHARED_MEM_SIZE;
 	psp->dtm_context.context.ta_load_type = GFX_CMD_ID_LOAD_TA;
 
-	if (!psp->dtm_context.context.initialized) {
+	if (!psp->dtm_context.context.mem_context.shared_buf) {
 		ret = psp_ta_init_shared_buf(psp, &psp->dtm_context.context.mem_context);
 		if (ret)
 			return ret;
@@ -1830,7 +1830,7 @@ static int psp_rap_initialize(struct psp_context *psp)
 	psp->rap_context.context.mem_context.shared_mem_size = PSP_RAP_SHARED_MEM_SIZE;
 	psp->rap_context.context.ta_load_type = GFX_CMD_ID_LOAD_TA;
 
-	if (!psp->rap_context.context.initialized) {
+	if (!psp->rap_context.context.mem_context.shared_buf) {
 		ret = psp_ta_init_shared_buf(psp, &psp->rap_context.context.mem_context);
 		if (ret)
 			return ret;
-- 
2.39.2

