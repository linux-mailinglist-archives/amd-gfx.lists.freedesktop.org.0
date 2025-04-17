Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20081A91C43
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Apr 2025 14:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90010EAEB;
	Thu, 17 Apr 2025 12:32:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221CC10E2D1;
 Thu, 17 Apr 2025 12:32:27 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 53HCW4nE4002391; Thu, 17 Apr 2025 18:02:04 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 53HCW4KK4002390;
 Thu, 17 Apr 2025 18:02:04 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH V6 4/5] drm/amdgpu: change DRM_ERROR to drm_file_err in
 amdgpu_userqueue.c
Date: Thu, 17 Apr 2025 18:01:54 +0530
Message-Id: <20250417123155.4002358-4-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417123155.4002358-1-sunil.khatri@amd.com>
References: <20250417123155.4002358-1-sunil.khatri@amd.com>
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

change the DRM_ERROR to drm_file_err to add process name
and pid to the logging.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 52 +++++++++++--------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
index 613a3a63301b..4ef49179bbaf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
@@ -125,25 +125,25 @@ int amdgpu_userqueue_create_object(struct amdgpu_userq_mgr *uq_mgr,
 
 	r = amdgpu_bo_create(adev, &bp, &userq_obj->obj);
 	if (r) {
-		DRM_ERROR("Failed to allocate BO for userqueue (%d)", r);
+		drm_file_err(uq_mgr->file, "Failed to allocate BO for userqueue (%d)", r);
 		return r;
 	}
 
 	r = amdgpu_bo_reserve(userq_obj->obj, true);
 	if (r) {
-		DRM_ERROR("Failed to reserve BO to map (%d)", r);
+		drm_file_err(uq_mgr->file, "Failed to reserve BO to map (%d)", r);
 		goto free_obj;
 	}
 
 	r = amdgpu_ttm_alloc_gart(&(userq_obj->obj)->tbo);
 	if (r) {
-		DRM_ERROR("Failed to alloc GART for userqueue object (%d)", r);
+		drm_file_err(uq_mgr->file, "Failed to alloc GART for userqueue object (%d)", r);
 		goto unresv;
 	}
 
 	r = amdgpu_bo_kmap(userq_obj->obj, &userq_obj->cpu_ptr);
 	if (r) {
-		DRM_ERROR("Failed to map BO for userqueue (%d)", r);
+		drm_file_err(uq_mgr->file, "Failed to map BO for userqueue (%d)", r);
 		goto unresv;
 	}
 
@@ -179,7 +179,7 @@ amdgpu_userqueue_get_doorbell_index(struct amdgpu_userq_mgr *uq_mgr,
 
 	gobj = drm_gem_object_lookup(filp, db_info->doorbell_handle);
 	if (gobj == NULL) {
-		DRM_ERROR("Can't find GEM object for doorbell\n");
+		drm_file_err(uq_mgr->file, "Can't find GEM object for doorbell\n");
 		return -EINVAL;
 	}
 
@@ -189,13 +189,15 @@ amdgpu_userqueue_get_doorbell_index(struct amdgpu_userq_mgr *uq_mgr,
 	/* Pin the BO before generating the index, unpin in queue destroy */
 	r = amdgpu_bo_pin(db_obj->obj, AMDGPU_GEM_DOMAIN_DOORBELL);
 	if (r) {
-		DRM_ERROR("[Usermode queues] Failed to pin doorbell object\n");
+		drm_file_err(uq_mgr->file,
+			"[Usermode queues] Failed to pin doorbell object\n");
 		goto unref_bo;
 	}
 
 	r = amdgpu_bo_reserve(db_obj->obj, true);
 	if (r) {
-		DRM_ERROR("[Usermode queues] Failed to pin doorbell object\n");
+		drm_file_err(uq_mgr->file,
+			"[Usermode queues] Failed to pin doorbell object\n");
 		goto unpin_bo;
 	}
 
@@ -217,7 +219,8 @@ amdgpu_userqueue_get_doorbell_index(struct amdgpu_userq_mgr *uq_mgr,
 		break;
 
 	default:
-		DRM_ERROR("[Usermode queues] IP %d not support\n", db_info->queue_type);
+		drm_file_err(uq_mgr->file,
+			     "[Usermode queues] IP %d not support\n", db_info->queue_type);
 		r = -EINVAL;
 		goto unpin_bo;
 	}
@@ -285,7 +288,8 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	if (args->in.ip_type != AMDGPU_HW_IP_GFX &&
 	    args->in.ip_type != AMDGPU_HW_IP_DMA &&
 	    args->in.ip_type != AMDGPU_HW_IP_COMPUTE) {
-		DRM_ERROR("Usermode queue doesn't support IP type %u\n", args->in.ip_type);
+		drm_file_err(uq_mgr->file,
+			     "Usermode queue doesn't support IP type %u\n", args->in.ip_type);
 		return -EINVAL;
 	}
 
@@ -307,14 +311,16 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 
 	uq_funcs = adev->userq_funcs[args->in.ip_type];
 	if (!uq_funcs) {
-		DRM_ERROR("Usermode queue is not supported for this IP (%u)\n", args->in.ip_type);
+		drm_file_err(uq_mgr->file,
+			"Usermode queue is not supported for this IP (%u)\n",
+			args->in.ip_type);
 		r = -EINVAL;
 		goto unlock;
 	}
 
 	queue = kzalloc(sizeof(struct amdgpu_usermode_queue), GFP_KERNEL);
 	if (!queue) {
-		DRM_ERROR("Failed to allocate memory for queue\n");
+		drm_file_err(uq_mgr->file, "Failed to allocate memory for queue\n");
 		r = -ENOMEM;
 		goto unlock;
 	}
@@ -330,7 +336,7 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	/* Convert relative doorbell offset into absolute doorbell index */
 	index = amdgpu_userqueue_get_doorbell_index(uq_mgr, &db_info, filp);
 	if (index == (uint64_t)-EINVAL) {
-		DRM_ERROR("Failed to get doorbell for queue\n");
+		drm_file_err(uq_mgr->file, "Failed to get doorbell for queue\n");
 		kfree(queue);
 		goto unlock;
 	}
@@ -339,13 +345,13 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 	xa_init_flags(&queue->fence_drv_xa, XA_FLAGS_ALLOC);
 	r = amdgpu_userq_fence_driver_alloc(adev, queue);
 	if (r) {
-		DRM_ERROR("Failed to alloc fence driver\n");
+		drm_file_err(uq_mgr->file, "Failed to alloc fence driver\n");
 		goto unlock;
 	}
 
 	r = uq_funcs->mqd_create(uq_mgr, &args->in, queue);
 	if (r) {
-		DRM_ERROR("Failed to create Queue\n");
+		drm_file_err(uq_mgr->file, "Failed to create Queue\n");
 		amdgpu_userq_fence_driver_free(queue);
 		kfree(queue);
 		goto unlock;
@@ -354,7 +360,7 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 
 	qid = idr_alloc(&uq_mgr->userq_idr, queue, 1, AMDGPU_MAX_USERQ_COUNT, GFP_KERNEL);
 	if (qid < 0) {
-		DRM_ERROR("Failed to allocate a queue id\n");
+		drm_file_err(uq_mgr->file, "Failed to allocate a queue id\n");
 		amdgpu_userq_fence_driver_free(queue);
 		uq_funcs->mqd_destroy(uq_mgr, queue);
 		kfree(queue);
@@ -374,7 +380,7 @@ amdgpu_userqueue_create(struct drm_file *filp, union drm_amdgpu_userq *args)
 		r = uq_funcs->map(uq_mgr, queue);
 		if (r) {
 			mutex_unlock(&adev->userq_mutex);
-			DRM_ERROR("Failed to map Queue\n");
+			drm_file_err(uq_mgr->file, "Failed to map Queue\n");
 			idr_remove(&uq_mgr->userq_idr, qid);
 			amdgpu_userq_fence_driver_free(queue);
 			uq_funcs->mqd_destroy(uq_mgr, queue);
@@ -405,7 +411,7 @@ int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 		r = amdgpu_userqueue_create(filp, args);
 		if (r)
-			DRM_ERROR("Failed to create usermode queue\n");
+			drm_file_err(filp, "Failed to create usermode queue\n");
 		break;
 
 	case AMDGPU_USERQ_OP_FREE:
@@ -423,7 +429,7 @@ int amdgpu_userq_ioctl(struct drm_device *dev, void *data,
 			return -EINVAL;
 		r = amdgpu_userqueue_destroy(filp, args->in.queue_id);
 		if (r)
-			DRM_ERROR("Failed to destroy usermode queue\n");
+			drm_file_err(filp, "Failed to destroy usermode queue\n");
 		break;
 
 	default:
@@ -496,7 +502,7 @@ amdgpu_userqueue_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 		ret = amdgpu_vm_lock_pd(vm, &exec, 2);
 		drm_exec_retry_on_contention(&exec);
 		if (unlikely(ret)) {
-			DRM_ERROR("Failed to lock PD\n");
+			drm_file_err(uq_mgr->file, "Failed to lock PD\n");
 			goto unlock_all;
 		}
 
@@ -536,7 +542,7 @@ amdgpu_userqueue_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 		bo = bo_va->base.bo;
 		ret = amdgpu_userqueue_validate_vm_bo(NULL, bo);
 		if (ret) {
-			DRM_ERROR("Failed to validate BO\n");
+			drm_file_err(uq_mgr->file, "Failed to validate BO\n");
 			goto unlock_all;
 		}
 
@@ -567,7 +573,7 @@ amdgpu_userqueue_validate_bos(struct amdgpu_userq_mgr *uq_mgr)
 
 	ret = amdgpu_eviction_fence_replace_fence(&fpriv->evf_mgr, &exec);
 	if (ret)
-		DRM_ERROR("Failed to replace eviction fence\n");
+		drm_file_err(uq_mgr->file, "Failed to replace eviction fence\n");
 
 unlock_all:
 	drm_exec_fini(&exec);
@@ -586,13 +592,13 @@ static void amdgpu_userqueue_resume_worker(struct work_struct *work)
 
 	ret = amdgpu_userqueue_validate_bos(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Failed to validate BOs to restore\n");
+		drm_file_err(uq_mgr->file, "Failed to validate BOs to restore\n");
 		goto unlock;
 	}
 
 	ret = amdgpu_userqueue_resume_all(uq_mgr);
 	if (ret) {
-		DRM_ERROR("Failed to resume all queues\n");
+		drm_file_err(uq_mgr->file, "Failed to resume all queues\n");
 		goto unlock;
 	}
 
-- 
2.34.1

