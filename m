Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08021F93E
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF276E842;
	Tue, 14 Jul 2020 18:24:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 487016E844
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id l6so16509113qkc.6
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P2EDxdwkNXg0EI9QwU8B2+ALjdw7MDAvdnQa4/M31o8=;
 b=ZLPu4dqC1cvZBkKfjtEqugrkovt17WKRuleqMw3AIWCBvyK7J3pXGjOnVSAI5DBw8W
 HESlnzaVNmuqhJIrAjuw9GcqUgNPpTp32dbeWbSxENYVaLgVtkgiW+4Aj8j3jFus6xTS
 dd77ImGmvyRecYjS+tgkdAYnrjzqmvc2Mq9vJAjG2bU/mfvmbcPKSU26MgXxr5cA/OvN
 emsOGT0tbQmLnlfeIEIv9oLXlqb2Bj11VjGdhdxgejQE/ZPrQMpXAvfYE3y2VWb1lC2c
 QVd2sWE1LkBbqDvlnKjTZpnxZOgxjcuyH1RSq3NZnN7L/sVLEGUsRb4n3QXeMBdsJRvI
 eESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2EDxdwkNXg0EI9QwU8B2+ALjdw7MDAvdnQa4/M31o8=;
 b=NxDkLwKRHSjabQM85X0VOC3BVWh8zdx01JDy3vjNiJP87V4wtby3MOUwJJBSJttif8
 Uf8MxuzVXqK1AKBqHNMi536OvXwgiC37oF65cbk15gpfnzin8taJJfki2sx/+rkLPLaG
 +WtCDaxLQkl9XZG7FeB/CUlU9115mBFsQFov3hdN3lf+tLFWkbtGeC56O1vePbKvld/i
 JiBQL37ODoc0On6uAt09l9ngZGDj9yIweeuYOEfXUp3jV5yYGDjy7vjnZUaY2hZfazTa
 AXoWmndtbLwWSq1KdCBJOUqrDQ5y+k+mGgMJ7Xvzw0/tcFZCe+cwVqJtiEYqapzSHy5C
 kTww==
X-Gm-Message-State: AOAM532eHUjsisKob0CkO6q3PzdwEAXaVW+P9uurq5/J6I5uHbB95E/y
 cmZXZReEMvBmTieRHxnkCp9066Ra
X-Google-Smtp-Source: ABdhPJxLLhwzM37HYXV7LfI+5WlWXas2DAg6ArmJA8wOZln76FNiW1+8swRAECEl+GugBAf3F1b6lg==
X-Received: by 2002:a37:d91:: with SMTP id 139mr5541813qkn.291.1594751072232; 
 Tue, 14 Jul 2020 11:24:32 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 18/42] drm/amdgpu: configure navy_flounder gfx according to
 gfx 10.3
Date: Tue, 14 Jul 2020 14:23:29 -0400
Message-Id: <20200714182353.2164930-19-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

The gfx version of navy_flounder is 10.3, identical to
sienna_cichlid, follow the way of sienna_cichlid.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Jiansong Chen <Jiansong.Chen@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 5e24adca964b..02645356f96f 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -5720,6 +5720,7 @@ static void gfx_v10_0_cp_gfx_set_doorbell(struct amdgpu_device *adev,
 	WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_CONTROL, tmp);
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		tmp = REG_SET_FIELD(0, CP_RB_DOORBELL_RANGE_LOWER,
 				    DOORBELL_RANGE_LOWER_Sienna_Cichlid, ring->doorbell_index);
 		WREG32_SOC15(GC, 0, mmCP_RB_DOORBELL_RANGE_LOWER, tmp);
@@ -5852,6 +5853,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 	if (enable) {
 		switch (adev->asic_type) {
 		case CHIP_SIENNA_CICHLID:
+		case CHIP_NAVY_FLOUNDER:
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid, 0);
 			break;
 		default:
@@ -5861,6 +5863,7 @@ static void gfx_v10_0_cp_compute_enable(struct amdgpu_device *adev, bool enable)
 	} else {
 		switch (adev->asic_type) {
 		case CHIP_SIENNA_CICHLID:
+		case CHIP_NAVY_FLOUNDER:
 			WREG32_SOC15(GC, 0, mmCP_MEC_CNTL_Sienna_Cichlid,
 				     (CP_MEC_CNTL__MEC_ME1_HALT_MASK |
 				      CP_MEC_CNTL__MEC_ME2_HALT_MASK));
@@ -5954,6 +5957,7 @@ static void gfx_v10_0_kiq_setting(struct amdgpu_ring *ring)
 	/* tell RLC which is KIQ queue */
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
 		tmp &= 0xffffff00;
 		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
@@ -6657,6 +6661,7 @@ static bool gfx_v10_0_check_grbm_cam_remapping(struct amdgpu_device *adev)
 	 * has been remapped to mmVGT_ESGS_RING_SIZE */
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		data = RREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_Sienna_Cichlid);
 		WREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_Sienna_Cichlid, 0);
 		WREG32_SOC15(GC, 0, mmVGT_ESGS_RING_SIZE_UMD, pattern);
@@ -6695,6 +6700,7 @@ static void gfx_v10_0_setup_grbm_cam_remapping(struct amdgpu_device *adev)
 
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		/* mmVGT_TF_RING_SIZE_UMD -> mmVGT_TF_RING_SIZE */
 		data = (SOC15_REG_OFFSET(GC, 0, mmVGT_TF_RING_SIZE_UMD) <<
 			GRBM_CAM_DATA__CAM_ADDR__SHIFT) |
@@ -6985,6 +6991,7 @@ static int gfx_v10_0_soft_reset(void *handle)
 	tmp = RREG32_SOC15(GC, 0, mmGRBM_STATUS2);
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		if (REG_GET_FIELD(tmp, GRBM_STATUS2, RLC_BUSY_Sienna_Cichlid))
 			grbm_soft_reset = REG_SET_FIELD(grbm_soft_reset,
 							GRBM_SOFT_RESET,
@@ -7136,6 +7143,7 @@ static void gfx_v10_0_set_safe_mode(struct amdgpu_device *adev)
 
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 
 		/* wait for RLC_SAFE_MODE */
@@ -7167,6 +7175,7 @@ static void gfx_v10_0_unset_safe_mode(struct amdgpu_device *adev)
 	data = RLC_SAFE_MODE__CMD_MASK;
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		WREG32_SOC15(GC, 0, mmRLC_SAFE_MODE_Sienna_Cichlid, data);
 		break;
 	default:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
