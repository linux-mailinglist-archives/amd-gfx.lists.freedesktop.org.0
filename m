Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213D852352
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Feb 2024 01:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008BE10E682;
	Tue, 13 Feb 2024 00:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cevW7IBc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4EF10E682;
 Tue, 13 Feb 2024 00:23:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AB9F6CE1892;
 Tue, 13 Feb 2024 00:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A7CC433F1;
 Tue, 13 Feb 2024 00:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707783796;
 bh=dyYuoQO6LL8LOppQkKkh22dO/q0dhL/RGV1YgeuYVDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cevW7IBcdSX19+TWVvjsmKYDTBdjZYNUrNLvPBKOqHUYY5Jg8CJKOk9pbY8xaWGKd
 RqkYwxpIhVX3qBP59Q4Yy8iVhN5KpLGjxqc/PzrYFVdilY/QG3KOby45rAPbHkJt27
 yE9VmC8p5Gx+e4a3HBTi1Su8WT/uRckP7X1PkvYoBlv4UKQU9J0OoDFifaWAbG/oOp
 oSZk6zaFbM6rgdpjKrEnUaocjyTj6tzALDx5YREI0shuIhYjWVX6LI2ck/ardRwO86
 xJ5xseouyQMFMov/mNph2xaqfTR47U0dQ8DL99IMw0+unE0BlcoECBH5BOvj6byqyA
 pw0bO/1XxptDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Prike Liang <Prike.Liang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lijo.lazar@amd.com, Hawking.Zhang@amd.com,
 mario.limonciello@amd.com, le.ma@amd.com, andrealmeid@igalia.com,
 maarten.lankhorst@linux.intel.com, srinivasan.shanmugam@amd.com,
 James.Zhu@amd.com, aurabindo.pillai@amd.com, Jiadong.Zhu@amd.com,
 guchun.chen@amd.com, jesse.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 24/28] drm/amdgpu: skip to program GFXDEC
 registers for suspend abort
Date: Mon, 12 Feb 2024 19:22:22 -0500
Message-ID: <20240213002235.671934-24-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213002235.671934-1-sashal@kernel.org>
References: <20240213002235.671934-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.77
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

From: Prike Liang <Prike.Liang@amd.com>

[ Upstream commit 93bafa32a6918154aa0caf9f66679a32c2431357 ]

In the suspend abort cases, the gfx power rail doesn't turn off so
some GFXDEC registers/CSB can't reset to default value and at this
moment reinitialize GFXDEC/CSB will result in an unexpected error.
So let skip those program sequence for the suspend abort case.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 ++
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c   | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index c46c6fbd235e..e636c7850f77 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -999,6 +999,8 @@ struct amdgpu_device {
 	bool				in_s3;
 	bool				in_s4;
 	bool				in_s0ix;
+	/* indicate amdgpu suspension status */
+	bool				suspend_complete;
 
 	enum pp_mp1_state               mp1_state;
 	struct amdgpu_doorbell_index doorbell_index;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index b9983ca99eb7..f24c3a20e901 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2414,6 +2414,7 @@ static int amdgpu_pmops_suspend(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
+	adev->suspend_complete = false;
 	if (amdgpu_acpi_is_s0ix_active(adev))
 		adev->in_s0ix = true;
 	else if (amdgpu_acpi_is_s3_active(adev))
@@ -2428,6 +2429,7 @@ static int amdgpu_pmops_suspend_noirq(struct device *dev)
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(drm_dev);
 
+	adev->suspend_complete = true;
 	if (amdgpu_acpi_should_gpu_reset(adev))
 		return amdgpu_asic_reset(adev);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 84ca601f7d5f..195b29892354 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3064,6 +3064,14 @@ static int gfx_v9_0_cp_gfx_start(struct amdgpu_device *adev)
 
 	gfx_v9_0_cp_gfx_enable(adev, true);
 
+	/* Now only limit the quirk on the APU gfx9 series and already
+	 * confirmed that the APU gfx10/gfx11 needn't such update.
+	 */
+	if (adev->flags & AMD_IS_APU &&
+			adev->in_s3 && !adev->suspend_complete) {
+		DRM_INFO(" Will skip the CSB packet resubmit\n");
+		return 0;
+	}
 	r = amdgpu_ring_alloc(ring, gfx_v9_0_get_csb_size(adev) + 4 + 3);
 	if (r) {
 		DRM_ERROR("amdgpu: cp failed to lock ring (%d).\n", r);
-- 
2.43.0

