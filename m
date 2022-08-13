Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D3591826
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Aug 2022 03:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937DDAF54F;
	Sat, 13 Aug 2022 01:28:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EC88089
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Aug 2022 01:28:00 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id kb8so4647759ejc.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Aug 2022 18:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=voJd0MxVBK9H0xijt7bExl+PgJOMmp3dnud9V8qwmaw=;
 b=dDAv9/RGW5md581tI6zjl5d5ymmgjuv568bJ3FLDqviwLFsT6+FwtNaJqfkeg3HNj+
 Vfyr3VzMe2W+nnonAvk6vO1vN2VXC3U873V16+EuEJH5okX7IFw7EGGi9UPvgAYHA3Ym
 txU8SN7Qt+oevSsqpLef4Xb1sOItATMHxXkHizx0lLuwTSJ9IJFhOKX5NlEHcdvTrqHZ
 HwOLqyy7QauP4vTWwU+pwTy9o5408rmz8GVTg/JVV2Yo1A+odVxhOWGQV1Letp8IlzIH
 6W7vRG1gyMFbvpv0sP6Z0OJhtG673mavMFiDd7I9tNZnTEZezVIeDLFBxQSDss0iFsbd
 i/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=voJd0MxVBK9H0xijt7bExl+PgJOMmp3dnud9V8qwmaw=;
 b=O6ZVZta+fWYn+aput9x+bLNISP0iH1JqCsJje5Bn4sGczRltJuTjLynObT+kwkIJmH
 WvZkVRnHrI1VySxUHVEMVpHkuLQE0g1Ak4KTVs0HjHymAf3BqZBBt0/5Ge3+5H3/ajJq
 OlOA+jGmMbjLbiIdO4nkhb3Ggwnjga2vLMYz3yI+jZvca7UeXDv8YAhEZ9m+0eXFBFs2
 5MSbTYMawqTTX4JPvlEAq6Qfddl+p6C8m9gWDkry/4RBXvgDl7Pe73ZGDcCnZvB1ONnw
 265H8Q22Usi+FXgzdwnlszXyyIZEIZL/J0up24OA1xsROgubVSyOURiHGRxnWNjLbBjl
 /E+g==
X-Gm-Message-State: ACgBeo0zShFZ6xkat7h1p/TgFRzfLrPPdLyWgfpTy0mFURmQg0DblyOl
 12p5JOZDatEx24kvqXpwDC3oOQ==
X-Google-Smtp-Source: AA6agR76VtC6lrfekqgWxV3VZA7HrIy/qztyXlEGziMwb0vxgkeys86KnsyeG0YBf0mYdDSdHAW+LQ==
X-Received: by 2002:a17:906:eeca:b0:730:6880:c397 with SMTP id
 wu10-20020a170906eeca00b007306880c397mr4131231ejb.593.1660354078623; 
 Fri, 12 Aug 2022 18:27:58 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm1342536ejb.23.2022.08.12.18.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:27:58 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] drm/amdgpu: Add separate mode for syncing
 DMA_RESV_USAGE_BOOKKEEP.
Date: Sat, 13 Aug 2022 03:27:57 +0200
Message-Id: <20220813012801.1115950-3-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
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
Cc: christian.koenig@amd.com, daniel@ffwll.ch,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

To prep for allowing different sync modes in a follow-up patch.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c       | 11 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         | 11 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c      |  2 +-
 10 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index a6eb7697c936..746f44c1c3f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1158,7 +1158,7 @@ static int process_sync_pds_resv(struct amdkfd_process_info *process_info,
 		struct amdgpu_bo *pd = peer_vm->root.bo;
 
 		ret = amdgpu_sync_resv(NULL, sync, pd->tbo.base.resv,
-				       AMDGPU_SYNC_NE_OWNER,
+				       AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_NE_OWNER,
 				       AMDGPU_FENCE_OWNER_KFD);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index f1ceb25d1b84..91958e9db90b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -675,7 +675,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		sync_mode = amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
-				     &fpriv->vm);
+				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2c82b1d5a0d7..20c45f502536 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1410,7 +1410,8 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
  *
  * @adev: amdgpu device pointer
  * @resv: reservation object to sync to
- * @sync_mode: synchronization mode
+ * @implicit_sync_mode: synchronization mode for usage <= DMA_RESV_USAGE_READ
+ * @explicit_sync_mode: synchronization mode for usage DMA_RESV_USAGE_BOOKKEEP
  * @owner: fence owner
  * @intr: Whether the wait is interruptible
  *
@@ -1420,14 +1421,15 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
  * 0 on success, errno otherwise.
  */
 int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
-			     enum amdgpu_sync_mode sync_mode, void *owner,
+			     enum amdgpu_sync_mode implicit_sync_mode,
+			     enum amdgpu_sync_mode explicit_sync_mode, void *owner,
 			     bool intr)
 {
 	struct amdgpu_sync sync;
 	int r;
 
 	amdgpu_sync_create(&sync);
-	amdgpu_sync_resv(adev, &sync, resv, sync_mode, owner);
+	amdgpu_sync_resv(adev, &sync, resv, implicit_sync_mode, explicit_sync_mode, owner);
 	r = amdgpu_sync_wait(&sync, intr);
 	amdgpu_sync_free(&sync);
 	return r;
@@ -1448,7 +1450,8 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
 	return amdgpu_bo_sync_wait_resv(adev, bo->tbo.base.resv,
-					AMDGPU_SYNC_NE_OWNER, owner, intr);
+					AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_EXPLICIT,
+					owner, intr);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 147b79c10cbb..36ce9abb579c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -320,7 +320,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 		     bool shared);
 int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
-			     enum amdgpu_sync_mode sync_mode, void *owner,
+			     enum amdgpu_sync_mode implicit_sync_mode,
+			     enum amdgpu_sync_mode explicit_sync_mode, void *owner,
 			     bool intr);
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 504af1b93bfa..de508cb3f6a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -225,14 +225,15 @@ static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
  * @adev: amdgpu device
  * @sync: sync object to add fences from reservation object to
  * @resv: reservation object with embedded fence
- * @mode: how owner affects which fences we sync to
+ * @implicit_mode: how owner affects which fences with usage <= DMA_RESV_USAGE_READ we sync to
+ * @explicit_mode: how owner affects which fences with usage DMA_RESV_USAGE_BOOKKEEP we sync to
  * @owner: owner of the planned job submission
  *
  * Sync to the fence
  */
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
-		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
-		     void *owner)
+		     struct dma_resv *resv, enum amdgpu_sync_mode implicit_mode,
+		     enum amdgpu_sync_mode explicit_mode, void *owner)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *f;
@@ -245,6 +246,10 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, f) {
 		dma_fence_chain_for_each(f, f) {
 			struct dma_fence *tmp = dma_fence_chain_contained(f);
+			enum amdgpu_sync_mode mode = implicit_mode;
+
+			if (dma_resv_iter_usage(&cursor) >= DMA_RESV_USAGE_BOOKKEEP)
+				mode = explicit_mode;
 
 			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
 				r = amdgpu_sync_fence(sync, f);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
index 2d5c613cda10..57a39eedff78 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -48,8 +48,8 @@ struct amdgpu_sync {
 void amdgpu_sync_create(struct amdgpu_sync *sync);
 int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
-		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
-		     void *owner);
+		     struct dma_resv *resv, enum amdgpu_sync_mode implicit_mode,
+		     enum amdgpu_sync_mode explicit_mode, void *owner);
 struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 				     struct amdgpu_ring *ring);
 struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3b4c19412625..9d5fc6359191 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1978,6 +1978,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 	if (resv) {
 		r = amdgpu_sync_resv(adev, &(*job)->sync, resv,
 				     AMDGPU_SYNC_ALWAYS,
+				     AMDGPU_SYNC_EXPLICIT,
 				     AMDGPU_FENCE_OWNER_UNDEFINED);
 		if (r) {
 			DRM_ERROR("sync failed (%d).\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6eac649499d3..de08bab400d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1176,7 +1176,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 			goto err_free;
 	} else {
 		r = amdgpu_sync_resv(adev, &job->sync, bo->tbo.base.resv,
-				     AMDGPU_SYNC_ALWAYS,
+				     AMDGPU_SYNC_ALWAYS, AMDGPU_SYNC_ALWAYS,
 				     AMDGPU_FENCE_OWNER_UNDEFINED);
 		if (r)
 			goto err_free;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index 31913ae86de6..f10332e1c6c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, p->vm, true);
+	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 1fd3cbca20a2..6ec6217f0b0e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, p->vm);
+	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
 }
 
 /**
-- 
2.37.1

