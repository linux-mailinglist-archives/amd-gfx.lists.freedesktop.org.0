Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D1017F637
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2020 12:24:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDA16E1A2;
	Tue, 10 Mar 2020 11:24:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F7C6E160
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2020 11:24:18 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n2so913621wmc.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2020 04:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCjR2fm+E3rioTA86ys1oMFS/c4IFkl7hcpBhrBcOnE=;
 b=uayj9lXwp5iX0MlvKCyOFL9G7b4K6tNH/k0d5wPH3ln7umgzmnpE1hZgfapM9njss5
 Q/F8ioC6leTiU6u9QA5laEWdHnrldV+Opp3KoISoz+92wI84fNf2tWFYsVePUT8YM7X7
 WjC0rbp8g1zXR/GPZc9pKLMBYvB79a3TDI5E1e28xghjp9UMQSbY/Oe4DfzkxR2s+kYU
 bmX5/dfeOec8gldQpn7T8YsccnBm3O3Py0LNqH0z5iTuzfZqiy+VCwrC/qSGpbBbqAga
 g92lJB+ZQxvsjIUz9m8HsKhyUNsUutoPT5o1j0bXuvFKHCPjj0sOxHzLLzzUDd7cCBv8
 ELZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BCjR2fm+E3rioTA86ys1oMFS/c4IFkl7hcpBhrBcOnE=;
 b=Ife4bHHJP0uWkFjzwxp2Jfelayv6K2YoJAHYQwXzbWZigfiQ8dnQEDuf5mJDnYZ3Vq
 f/lr5Uj48GGmop4N09IWhfYPK3AHPDDk9avqcqxmTscImwDcIAA72f3pQREbOpNUlDBp
 KrjsEyOaTlxMojWyxdRuWWXLt/TqVahQwazhEfW+cdaAsenm46RwEbhjc54m8pnFWvSe
 +u1K10Ki80kMaLDrB/HfXCi5VRAnEb+lwJjP29pAAvw9gvWwx0w7sq3208wEulhY941Y
 bXJEpYpApSYW2rlN9i2yZeNj+6NfT7CHPsTKYQc45gOvGuUJoG/GqYQ/UL90z6L57LRR
 SOmw==
X-Gm-Message-State: ANhLgQ3niYQKPa16ZmdCd5jSzS0NPiNQZJiBwlhSwfhZLRoYMyUdFopS
 lFMbRcWUj4PbvgVQORupyFkdH0REqX7WYw==
X-Google-Smtp-Source: ADFU+vvBiXnb3V64S97uv6u8H3GG4wBOiiEFmDVrsrhRUlNddcaR6YWxROo0HnooLDHs9hCmyLleDw==
X-Received: by 2002:a1c:ba85:: with SMTP id k127mr1605873wmf.63.1583839456204; 
 Tue, 10 Mar 2020 04:24:16 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F32A80070E0F409F1853DFD.dip0.t-ipconnect.de.
 [2003:c5:8f32:a800:70e0:f409:f185:3dfd])
 by smtp.gmail.com with ESMTPSA id i6sm611560wru.40.2020.03.10.04.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 04:24:15 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu: cleanup drm_gpu_scheduler array creation
Date: Tue, 10 Mar 2020 12:27:46 +0100
Message-Id: <20200310112748.4899-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Move initialization of struct drm_gpu_scheduler array,
amdgpu_ctx_init_sched() to amdgpu_ring.c.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c    | 68 -------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h    |  3 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c   | 77 ++++++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
 5 files changed, 80 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 3b2370ad1e47..06d151c0fe4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -661,71 +661,3 @@ void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
 	idr_destroy(&mgr->ctx_handles);
 	mutex_destroy(&mgr->lock);
 }
-
-
-static void amdgpu_ctx_init_compute_sched(struct amdgpu_device *adev)
-{
-	int num_compute_sched_normal = 0;
-	int num_compute_sched_high = AMDGPU_MAX_COMPUTE_RINGS - 1;
-	int i;
-
-	/* use one drm sched array, gfx.compute_sched to store both high and
-	 * normal priority drm compute schedulers */
-	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
-		if (!adev->gfx.compute_ring[i].has_high_prio)
-			adev->gfx.compute_sched[num_compute_sched_normal++] =
-				&adev->gfx.compute_ring[i].sched;
-		else
-			adev->gfx.compute_sched[num_compute_sched_high--] =
-				&adev->gfx.compute_ring[i].sched;
-	}
-
-	/* compute ring only has two priority for now */
-	i = AMDGPU_GFX_PIPE_PRIO_NORMAL;
-	adev->gfx.compute_prio_sched[i] = &adev->gfx.compute_sched[0];
-	adev->gfx.num_compute_sched[i] = num_compute_sched_normal;
-
-	i = AMDGPU_GFX_PIPE_PRIO_HIGH;
-	adev->gfx.compute_prio_sched[i] =
-		&adev->gfx.compute_sched[num_compute_sched_high - 1];
-	adev->gfx.num_compute_sched[i] =
-		adev->gfx.num_compute_rings - num_compute_sched_normal;
-}
-
-void amdgpu_ctx_init_sched(struct amdgpu_device *adev)
-{
-	int i, j;
-
-	amdgpu_ctx_init_compute_sched(adev);
-	for (i = 0; i < adev->gfx.num_gfx_rings; i++) {
-		adev->gfx.gfx_sched[i] = &adev->gfx.gfx_ring[i].sched;
-		adev->gfx.num_gfx_sched++;
-	}
-
-	for (i = 0; i < adev->sdma.num_instances; i++) {
-		adev->sdma.sdma_sched[i] = &adev->sdma.instance[i].ring.sched;
-		adev->sdma.num_sdma_sched++;
-	}
-
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		adev->vcn.vcn_dec_sched[adev->vcn.num_vcn_dec_sched++] =
-			&adev->vcn.inst[i].ring_dec.sched;
-	}
-
-	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
-		if (adev->vcn.harvest_config & (1 << i))
-			continue;
-		for (j = 0; j < adev->vcn.num_enc_rings; ++j)
-			adev->vcn.vcn_enc_sched[adev->vcn.num_vcn_enc_sched++] =
-				&adev->vcn.inst[i].ring_enc[j].sched;
-	}
-
-	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
-		if (adev->jpeg.harvest_config & (1 << i))
-			continue;
-		adev->jpeg.jpeg_sched[adev->jpeg.num_jpeg_sched++] =
-			&adev->jpeg.inst[i].ring_dec.sched;
-	}
-}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index de490f183af2..f54e10314661 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -88,7 +88,4 @@ void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr);
 long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout);
 void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
 
-void amdgpu_ctx_init_sched(struct amdgpu_device *adev);
-
-
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 572eb6ea8eab..b2a99f9fc223 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3092,7 +3092,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 			adev->gfx.config.max_cu_per_sh,
 			adev->gfx.cu_info.number);
 
-	amdgpu_ctx_init_sched(adev);
+	amdgpu_ring_init_sched(adev);
 
 	adev->accel_working = true;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index a7e1d0425ed0..99875dd633e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -454,3 +454,80 @@ int amdgpu_ring_test_helper(struct amdgpu_ring *ring)
 	ring->sched.ready = !r;
 	return r;
 }
+
+static void amdgpu_ring_init_compute_sched(struct amdgpu_device *adev)
+{
+	int num_compute_sched_normal = 0;
+	int num_compute_sched_high = AMDGPU_MAX_COMPUTE_RINGS - 1;
+	int i;
+
+	/* use one drm sched array, gfx.compute_sched to store both high and */
+	/* normal priority drm compute schedulers */
+	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
+		if (!adev->gfx.compute_ring[i].has_high_prio)
+			adev->gfx.compute_sched[num_compute_sched_normal++] =
+				&adev->gfx.compute_ring[i].sched;
+		else
+			adev->gfx.compute_sched[num_compute_sched_high--] =
+				&adev->gfx.compute_ring[i].sched;
+	}
+
+	/* compute ring only has two priority for now */
+	i = AMDGPU_GFX_PIPE_PRIO_NORMAL;
+	adev->gfx.compute_prio_sched[i] = &adev->gfx.compute_sched[0];
+	adev->gfx.num_compute_sched[i] = num_compute_sched_normal;
+
+	i = AMDGPU_GFX_PIPE_PRIO_HIGH;
+	adev->gfx.compute_prio_sched[i] =
+		&adev->gfx.compute_sched[num_compute_sched_high - 1];
+	adev->gfx.num_compute_sched[i] =
+		adev->gfx.num_compute_rings - num_compute_sched_normal;
+}
+
+/**
+ * amdgpu_ring_init_sched - populate array of drm scheds for each HW IP
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Populate an array of struct drm_gpu_schedulers for each HW IP which
+ * can be use by amdgpu_ctx_get_entity() to initialize an entity.
+ *
+ */
+
+void amdgpu_ring_init_sched(struct amdgpu_device *adev)
+{
+	int i, j;
+
+	amdgpu_ring_init_compute_sched(adev);
+	for (i = 0; i < adev->gfx.num_gfx_rings; i++) {
+		adev->gfx.gfx_sched[i] = &adev->gfx.gfx_ring[i].sched;
+		adev->gfx.num_gfx_sched++;
+	}
+
+	for (i = 0; i < adev->sdma.num_instances; i++) {
+		adev->sdma.sdma_sched[i] = &adev->sdma.instance[i].ring.sched;
+		adev->sdma.num_sdma_sched++;
+	}
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		adev->vcn.vcn_dec_sched[adev->vcn.num_vcn_dec_sched++] =
+			&adev->vcn.inst[i].ring_dec.sched;
+	}
+
+	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
+		if (adev->vcn.harvest_config & (1 << i))
+			continue;
+		for (j = 0; j < adev->vcn.num_enc_rings; ++j)
+			adev->vcn.vcn_enc_sched[adev->vcn.num_vcn_enc_sched++] =
+				&adev->vcn.inst[i].ring_enc[j].sched;
+	}
+
+	for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
+		if (adev->jpeg.harvest_config & (1 << i))
+			continue;
+		adev->jpeg.jpeg_sched[adev->jpeg.num_jpeg_sched++] =
+			&adev->jpeg.inst[i].ring_dec.sched;
+	}
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 9a443013d70d..4ccd056d4353 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -326,4 +326,6 @@ int amdgpu_debugfs_ring_init(struct amdgpu_device *adev,
 			     struct amdgpu_ring *ring);
 void amdgpu_debugfs_ring_fini(struct amdgpu_ring *ring);
 
+void amdgpu_ring_init_sched(struct amdgpu_device *adev);
+
 #endif
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
