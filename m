Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82825B5A3C
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Sep 2022 14:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E823110E43B;
	Mon, 12 Sep 2022 12:37:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0177010E449
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Sep 2022 12:36:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id y17so14790439ejo.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Sep 2022 05:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=EmDnICpSj0w6XCFcactmCm8+NOLbeocP8Ma+MM65WV8=;
 b=qRTev35q1/idyRL4Ek5DnPbfC8o1DMNj0cYucUtjUuyEF4NKufzMO8j64oAiZshePO
 uMwf4PhoUDUgbaXPH1k+o7+OTBHuyY+996Qaiu/kxUrLShYA4zXLbuUQJsbXdDUa1OB6
 Q+RpWHYm9XqFJKQjAg7DxFMsRljx9FMpEBXG9ywgCZRpUdSNJjaDgL8an8Yt/WSuPOZP
 Ebw3v8fyAETUkjck88bEGXd/SoTPOpTr5P+tTcpzqeraegYguLhTeAWa2dwXd0aJ3bXb
 mxVT/mohZz6+PNhfyxbD3LBW0UmvNtXMRn6F+3ffJcWtx1Q9XnG36OQwSp+CW2zvytq3
 UjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=EmDnICpSj0w6XCFcactmCm8+NOLbeocP8Ma+MM65WV8=;
 b=AcG+cVlrA5DibhrTGgEsoKy4f/OnK1/TvRSkJiAHEJOyDPIHntchNaW2ZEKlPwIs1u
 b/TSBIkwjAcWK14gkJy62PvjUvMo3za8uBG0ftH78OhxXiGZvkQoBiVhXUWFb2IYrihM
 InSqUnOO/wSSz0ifdxkGIuZU8qzQBcWtmfN8iR9u3ICtDHcAxYklm8Ond0FuCONcsN58
 EU7II4DhuXEoeu62nD6oQgGLhrRWo1BG7drCa/bpoiMBc8P2yyUWsGesdhCebJp0SSCH
 21j8HAVN1B8rmFS3LIiVn/3S+COhFUqvCc6DvOzvk/yqZKHewEGIgdVa8uPmMVE/WuWl
 8Gkg==
X-Gm-Message-State: ACgBeo1ywFOETSnYQZYOlTaqs/Yj/WmUj8HExM0WXjtlA7CM+YDPnbEC
 sBOnTJbGxUBxNWobl80EaVk=
X-Google-Smtp-Source: AA6agR7m5J5IHXiJ9APmS0peRl6jYNLy0h1hZFH1SrpyRgtjvih9FF2RtvSkRnoJ9WOjQ3ym69nd9w==
X-Received: by 2002:a17:907:1629:b0:774:cfaf:5a87 with SMTP id
 hb41-20020a170907162900b00774cfaf5a87mr13851518ejc.428.1662986209583; 
 Mon, 12 Sep 2022 05:36:49 -0700 (PDT)
Received: from able.fritz.box (p4fc20f4e.dip0.t-ipconnect.de. [79.194.15.78])
 by smtp.gmail.com with ESMTPSA id
 au6-20020a170907092600b00770c8e157ccsm4335639ejc.136.2022.09.12.05.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 05:36:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/7] drm/amdgpu: reorder CS code
Date: Mon, 12 Sep 2022 14:36:40 +0200
Message-Id: <20220912123640.20058-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220912123640.20058-1-christian.koenig@amd.com>
References: <20220912123640.20058-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Sort the functions in the order they are called

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 802 +++++++++++++------------
 1 file changed, 402 insertions(+), 400 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ee02fecc27b7..e104d7ef3c3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -278,6 +278,323 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 	return ret;
 }
 
+static int amdgpu_cs_ib_fill(struct amdgpu_device *adev,
+			     struct amdgpu_cs_parser *parser)
+{
+	struct amdgpu_fpriv *fpriv = parser->filp->driver_priv;
+	struct amdgpu_vm *vm = &fpriv->vm;
+	int r, ce_preempt = 0, de_preempt = 0;
+	struct amdgpu_ring *ring;
+	int i, j;
+
+	for (i = 0, j = 0; i < parser->nchunks && j < parser->job->num_ibs; i++) {
+		struct amdgpu_cs_chunk *chunk;
+		struct amdgpu_ib *ib;
+		struct drm_amdgpu_cs_chunk_ib *chunk_ib;
+		struct drm_sched_entity *entity;
+
+		chunk = &parser->chunks[i];
+		ib = &parser->job->ibs[j];
+		chunk_ib = (struct drm_amdgpu_cs_chunk_ib *)chunk->kdata;
+
+		if (chunk->chunk_id != AMDGPU_CHUNK_ID_IB)
+			continue;
+
+		if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
+		    chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT) {
+			if (chunk_ib->flags & AMDGPU_IB_FLAG_CE)
+				ce_preempt++;
+			else
+				de_preempt++;
+
+			/* each GFX command submit allows 0 or 1 IB preemptible for CE & DE */
+			if (ce_preempt > 1 || de_preempt > 1)
+				return -EINVAL;
+		}
+
+		r = amdgpu_ctx_get_entity(parser->ctx, chunk_ib->ip_type,
+					  chunk_ib->ip_instance, chunk_ib->ring,
+					  &entity);
+		if (r)
+			return r;
+
+		if (chunk_ib->flags & AMDGPU_IB_FLAG_PREAMBLE)
+			parser->job->preamble_status |=
+				AMDGPU_PREAMBLE_IB_PRESENT;
+
+		if (parser->entity && parser->entity != entity)
+			return -EINVAL;
+
+		/* Return if there is no run queue associated with this entity.
+		 * Possibly because of disabled HW IP*/
+		if (entity->rq == NULL)
+			return -EINVAL;
+
+		parser->entity = entity;
+
+		ring = to_amdgpu_ring(entity->rq->sched);
+		r =  amdgpu_ib_get(adev, vm, ring->funcs->parse_cs ?
+				   chunk_ib->ib_bytes : 0,
+				   AMDGPU_IB_POOL_DELAYED, ib);
+		if (r) {
+			DRM_ERROR("Failed to get ib !\n");
+			return r;
+		}
+
+		ib->gpu_addr = chunk_ib->va_start;
+		ib->length_dw = chunk_ib->ib_bytes / 4;
+		ib->flags = chunk_ib->flags;
+
+		j++;
+	}
+
+	/* MM engine doesn't support user fences */
+	ring = to_amdgpu_ring(parser->entity->rq->sched);
+	if (parser->job->uf_addr && ring->funcs->no_user_fence)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int amdgpu_cs_process_fence_dep(struct amdgpu_cs_parser *p,
+				       struct amdgpu_cs_chunk *chunk)
+{
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	unsigned num_deps;
+	int i, r;
+	struct drm_amdgpu_cs_chunk_dep *deps;
+
+	deps = (struct drm_amdgpu_cs_chunk_dep *)chunk->kdata;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_dep);
+
+	for (i = 0; i < num_deps; ++i) {
+		struct amdgpu_ctx *ctx;
+		struct drm_sched_entity *entity;
+		struct dma_fence *fence;
+
+		ctx = amdgpu_ctx_get(fpriv, deps[i].ctx_id);
+		if (ctx == NULL)
+			return -EINVAL;
+
+		r = amdgpu_ctx_get_entity(ctx, deps[i].ip_type,
+					  deps[i].ip_instance,
+					  deps[i].ring, &entity);
+		if (r) {
+			amdgpu_ctx_put(ctx);
+			return r;
+		}
+
+		fence = amdgpu_ctx_get_fence(ctx, entity, deps[i].handle);
+		amdgpu_ctx_put(ctx);
+
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
+		else if (!fence)
+			continue;
+
+		if (chunk->chunk_id == AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES) {
+			struct drm_sched_fence *s_fence;
+			struct dma_fence *old = fence;
+
+			s_fence = to_drm_sched_fence(fence);
+			fence = dma_fence_get(&s_fence->scheduled);
+			dma_fence_put(old);
+		}
+
+		r = amdgpu_sync_fence(&p->job->sync, fence);
+		dma_fence_put(fence);
+		if (r)
+			return r;
+	}
+	return 0;
+}
+
+static int amdgpu_syncobj_lookup_and_add_to_sync(struct amdgpu_cs_parser *p,
+						 uint32_t handle, u64 point,
+						 u64 flags)
+{
+	struct dma_fence *fence;
+	int r;
+
+	r = drm_syncobj_find_fence(p->filp, handle, point, flags, &fence);
+	if (r) {
+		DRM_ERROR("syncobj %u failed to find fence @ %llu (%d)!\n",
+			  handle, point, r);
+		return r;
+	}
+
+	r = amdgpu_sync_fence(&p->job->sync, fence);
+	dma_fence_put(fence);
+
+	return r;
+}
+
+static int amdgpu_cs_process_syncobj_in_dep(struct amdgpu_cs_parser *p,
+					    struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_sem *deps;
+	unsigned num_deps;
+	int i, r;
+
+	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_sem);
+	for (i = 0; i < num_deps; ++i) {
+		r = amdgpu_syncobj_lookup_and_add_to_sync(p, deps[i].handle,
+							  0, 0);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
+static int amdgpu_cs_process_syncobj_timeline_in_dep(struct amdgpu_cs_parser *p,
+						     struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
+	unsigned num_deps;
+	int i, r;
+
+	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
+	for (i = 0; i < num_deps; ++i) {
+		r = amdgpu_syncobj_lookup_and_add_to_sync(p,
+							  syncobj_deps[i].handle,
+							  syncobj_deps[i].point,
+							  syncobj_deps[i].flags);
+		if (r)
+			return r;
+	}
+
+	return 0;
+}
+
+static int amdgpu_cs_process_syncobj_out_dep(struct amdgpu_cs_parser *p,
+					     struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_sem *deps;
+	unsigned num_deps;
+	int i;
+
+	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_sem);
+
+	if (p->post_deps)
+		return -EINVAL;
+
+	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
+				     GFP_KERNEL);
+	p->num_post_deps = 0;
+
+	if (!p->post_deps)
+		return -ENOMEM;
+
+
+	for (i = 0; i < num_deps; ++i) {
+		p->post_deps[i].syncobj =
+			drm_syncobj_find(p->filp, deps[i].handle);
+		if (!p->post_deps[i].syncobj)
+			return -EINVAL;
+		p->post_deps[i].chain = NULL;
+		p->post_deps[i].point = 0;
+		p->num_post_deps++;
+	}
+
+	return 0;
+}
+
+
+static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p,
+						      struct amdgpu_cs_chunk *chunk)
+{
+	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
+	unsigned num_deps;
+	int i;
+
+	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
+	num_deps = chunk->length_dw * 4 /
+		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
+
+	if (p->post_deps)
+		return -EINVAL;
+
+	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
+				     GFP_KERNEL);
+	p->num_post_deps = 0;
+
+	if (!p->post_deps)
+		return -ENOMEM;
+
+	for (i = 0; i < num_deps; ++i) {
+		struct amdgpu_cs_post_dep *dep = &p->post_deps[i];
+
+		dep->chain = NULL;
+		if (syncobj_deps[i].point) {
+			dep->chain = dma_fence_chain_alloc();
+			if (!dep->chain)
+				return -ENOMEM;
+		}
+
+		dep->syncobj = drm_syncobj_find(p->filp,
+						syncobj_deps[i].handle);
+		if (!dep->syncobj) {
+			dma_fence_chain_free(dep->chain);
+			return -EINVAL;
+		}
+		dep->point = syncobj_deps[i].point;
+		p->num_post_deps++;
+	}
+
+	return 0;
+}
+
+static int amdgpu_cs_dependencies(struct amdgpu_device *adev,
+				  struct amdgpu_cs_parser *p)
+{
+	int i, r;
+
+	for (i = 0; i < p->nchunks; ++i) {
+		struct amdgpu_cs_chunk *chunk;
+
+		chunk = &p->chunks[i];
+
+		switch (chunk->chunk_id) {
+		case AMDGPU_CHUNK_ID_DEPENDENCIES:
+		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
+			r = amdgpu_cs_process_fence_dep(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
+			r = amdgpu_cs_process_syncobj_in_dep(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
+			r = amdgpu_cs_process_syncobj_out_dep(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
+			r = amdgpu_cs_process_syncobj_timeline_in_dep(p, chunk);
+			if (r)
+				return r;
+			break;
+		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
+			r = amdgpu_cs_process_syncobj_timeline_out_dep(p, chunk);
+			if (r)
+				return r;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 /* Convert microseconds to bytes. */
 static u64 us_to_bytes(struct amdgpu_device *adev, s64 us)
 {
@@ -659,25 +976,15 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	return r;
 }
 
-static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
+static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
 {
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_bo_list_entry *e;
-	int r;
+	int i;
 
-	list_for_each_entry(e, &p->validated, tv.head) {
-		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-		struct dma_resv *resv = bo->tbo.base.resv;
-		enum amdgpu_sync_mode sync_mode;
+	if (!trace_amdgpu_cs_enabled())
+		return;
 
-		sync_mode = amdgpu_bo_explicit_sync(bo) ?
-			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
-		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
-				     &fpriv->vm);
-		if (r)
-			return r;
-	}
-	return 0;
+	for (i = 0; i < parser->job->num_ibs; i++)
+		trace_amdgpu_cs(parser, i);
 }
 
 static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
@@ -733,417 +1040,119 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			offset = m->start * AMDGPU_GPU_PAGE_SIZE;
 			kptr += va_start - offset;
 
-			if (ring->funcs->parse_cs) {
-				memcpy(ib->ptr, kptr, chunk_ib->ib_bytes);
-				amdgpu_bo_kunmap(aobj);
-
-				r = amdgpu_ring_parse_cs(ring, p, p->job, ib);
-				if (r)
-					return r;
-			} else {
-				ib->ptr = (uint32_t *)kptr;
-				r = amdgpu_ring_patch_cs_in_place(ring, p, p->job, ib);
-				amdgpu_bo_kunmap(aobj);
-				if (r)
-					return r;
-			}
-
-			j++;
-		}
-	}
-
-	if (!p->job->vm)
-		return amdgpu_cs_sync_rings(p);
-
-
-	r = amdgpu_vm_clear_freed(adev, vm, NULL);
-	if (r)
-		return r;
-
-	r = amdgpu_vm_bo_update(adev, fpriv->prt_va, false);
-	if (r)
-		return r;
-
-	r = amdgpu_sync_fence(&p->job->sync, fpriv->prt_va->last_pt_update);
-	if (r)
-		return r;
-
-	if (fpriv->csa_va) {
-		bo_va = fpriv->csa_va;
-		BUG_ON(!bo_va);
-		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r)
-			return r;
-
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
-		if (r)
-			return r;
-	}
-
-	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-		/* ignore duplicates */
-		bo = ttm_to_amdgpu_bo(e->tv.bo);
-		if (!bo)
-			continue;
-
-		bo_va = e->bo_va;
-		if (bo_va == NULL)
-			continue;
-
-		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r)
-			return r;
-
-		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
-		if (r)
-			return r;
-	}
-
-	r = amdgpu_vm_handle_moved(adev, vm);
-	if (r)
-		return r;
-
-	r = amdgpu_vm_update_pdes(adev, vm, false);
-	if (r)
-		return r;
-
-	r = amdgpu_sync_fence(&p->job->sync, vm->last_update);
-	if (r)
-		return r;
-
-	p->job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
-
-	if (amdgpu_vm_debug) {
-		/* Invalidate all BOs to test for userspace bugs */
-		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
-
-			/* ignore duplicates */
-			if (!bo)
-				continue;
-
-			amdgpu_vm_bo_invalidate(adev, bo, false);
-		}
-	}
-
-	return amdgpu_cs_sync_rings(p);
-}
-
-static int amdgpu_cs_ib_fill(struct amdgpu_device *adev,
-			     struct amdgpu_cs_parser *parser)
-{
-	struct amdgpu_fpriv *fpriv = parser->filp->driver_priv;
-	struct amdgpu_vm *vm = &fpriv->vm;
-	int r, ce_preempt = 0, de_preempt = 0;
-	struct amdgpu_ring *ring;
-	int i, j;
-
-	for (i = 0, j = 0; i < parser->nchunks && j < parser->job->num_ibs; i++) {
-		struct amdgpu_cs_chunk *chunk;
-		struct amdgpu_ib *ib;
-		struct drm_amdgpu_cs_chunk_ib *chunk_ib;
-		struct drm_sched_entity *entity;
-
-		chunk = &parser->chunks[i];
-		ib = &parser->job->ibs[j];
-		chunk_ib = (struct drm_amdgpu_cs_chunk_ib *)chunk->kdata;
-
-		if (chunk->chunk_id != AMDGPU_CHUNK_ID_IB)
-			continue;
-
-		if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
-		    chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT) {
-			if (chunk_ib->flags & AMDGPU_IB_FLAG_CE)
-				ce_preempt++;
-			else
-				de_preempt++;
-
-			/* each GFX command submit allows 0 or 1 IB preemptible for CE & DE */
-			if (ce_preempt > 1 || de_preempt > 1)
-				return -EINVAL;
-		}
-
-		r = amdgpu_ctx_get_entity(parser->ctx, chunk_ib->ip_type,
-					  chunk_ib->ip_instance, chunk_ib->ring,
-					  &entity);
-		if (r)
-			return r;
-
-		if (chunk_ib->flags & AMDGPU_IB_FLAG_PREAMBLE)
-			parser->job->preamble_status |=
-				AMDGPU_PREAMBLE_IB_PRESENT;
-
-		if (parser->entity && parser->entity != entity)
-			return -EINVAL;
-
-		/* Return if there is no run queue associated with this entity.
-		 * Possibly because of disabled HW IP*/
-		if (entity->rq == NULL)
-			return -EINVAL;
-
-		parser->entity = entity;
-
-		ring = to_amdgpu_ring(entity->rq->sched);
-		r =  amdgpu_ib_get(adev, vm, ring->funcs->parse_cs ?
-				   chunk_ib->ib_bytes : 0,
-				   AMDGPU_IB_POOL_DELAYED, ib);
-		if (r) {
-			DRM_ERROR("Failed to get ib !\n");
-			return r;
-		}
-
-		ib->gpu_addr = chunk_ib->va_start;
-		ib->length_dw = chunk_ib->ib_bytes / 4;
-		ib->flags = chunk_ib->flags;
-
-		j++;
-	}
-
-	/* MM engine doesn't support user fences */
-	ring = to_amdgpu_ring(parser->entity->rq->sched);
-	if (parser->job->uf_addr && ring->funcs->no_user_fence)
-		return -EINVAL;
-
-	return 0;
-}
-
-static int amdgpu_cs_process_fence_dep(struct amdgpu_cs_parser *p,
-				       struct amdgpu_cs_chunk *chunk)
-{
-	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	unsigned num_deps;
-	int i, r;
-	struct drm_amdgpu_cs_chunk_dep *deps;
-
-	deps = (struct drm_amdgpu_cs_chunk_dep *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_dep);
-
-	for (i = 0; i < num_deps; ++i) {
-		struct amdgpu_ctx *ctx;
-		struct drm_sched_entity *entity;
-		struct dma_fence *fence;
-
-		ctx = amdgpu_ctx_get(fpriv, deps[i].ctx_id);
-		if (ctx == NULL)
-			return -EINVAL;
-
-		r = amdgpu_ctx_get_entity(ctx, deps[i].ip_type,
-					  deps[i].ip_instance,
-					  deps[i].ring, &entity);
-		if (r) {
-			amdgpu_ctx_put(ctx);
-			return r;
-		}
-
-		fence = amdgpu_ctx_get_fence(ctx, entity, deps[i].handle);
-		amdgpu_ctx_put(ctx);
-
-		if (IS_ERR(fence))
-			return PTR_ERR(fence);
-		else if (!fence)
-			continue;
+			if (ring->funcs->parse_cs) {
+				memcpy(ib->ptr, kptr, chunk_ib->ib_bytes);
+				amdgpu_bo_kunmap(aobj);
 
-		if (chunk->chunk_id == AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES) {
-			struct drm_sched_fence *s_fence;
-			struct dma_fence *old = fence;
+				r = amdgpu_ring_parse_cs(ring, p, p->job, ib);
+				if (r)
+					return r;
+			} else {
+				ib->ptr = (uint32_t *)kptr;
+				r = amdgpu_ring_patch_cs_in_place(ring, p, p->job, ib);
+				amdgpu_bo_kunmap(aobj);
+				if (r)
+					return r;
+			}
 
-			s_fence = to_drm_sched_fence(fence);
-			fence = dma_fence_get(&s_fence->scheduled);
-			dma_fence_put(old);
+			j++;
 		}
-
-		r = amdgpu_sync_fence(&p->job->sync, fence);
-		dma_fence_put(fence);
-		if (r)
-			return r;
 	}
-	return 0;
-}
 
-static int amdgpu_syncobj_lookup_and_add_to_sync(struct amdgpu_cs_parser *p,
-						 uint32_t handle, u64 point,
-						 u64 flags)
-{
-	struct dma_fence *fence;
-	int r;
+	if (!p->job->vm)
+		return 0;
 
-	r = drm_syncobj_find_fence(p->filp, handle, point, flags, &fence);
-	if (r) {
-		DRM_ERROR("syncobj %u failed to find fence @ %llu (%d)!\n",
-			  handle, point, r);
+	r = amdgpu_vm_clear_freed(adev, vm, NULL);
+	if (r)
 		return r;
-	}
-
-	r = amdgpu_sync_fence(&p->job->sync, fence);
-	dma_fence_put(fence);
 
-	return r;
-}
+	r = amdgpu_vm_bo_update(adev, fpriv->prt_va, false);
+	if (r)
+		return r;
 
-static int amdgpu_cs_process_syncobj_in_dep(struct amdgpu_cs_parser *p,
-					    struct amdgpu_cs_chunk *chunk)
-{
-	struct drm_amdgpu_cs_chunk_sem *deps;
-	unsigned num_deps;
-	int i, r;
+	r = amdgpu_sync_fence(&p->job->sync, fpriv->prt_va->last_pt_update);
+	if (r)
+		return r;
 
-	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_sem);
-	for (i = 0; i < num_deps; ++i) {
-		r = amdgpu_syncobj_lookup_and_add_to_sync(p, deps[i].handle,
-							  0, 0);
+	if (fpriv->csa_va) {
+		bo_va = fpriv->csa_va;
+		BUG_ON(!bo_va);
+		r = amdgpu_vm_bo_update(adev, bo_va, false);
 		if (r)
 			return r;
-	}
-
-	return 0;
-}
-
-
-static int amdgpu_cs_process_syncobj_timeline_in_dep(struct amdgpu_cs_parser *p,
-						     struct amdgpu_cs_chunk *chunk)
-{
-	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
-	unsigned num_deps;
-	int i, r;
 
-	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
-	for (i = 0; i < num_deps; ++i) {
-		r = amdgpu_syncobj_lookup_and_add_to_sync(p,
-							  syncobj_deps[i].handle,
-							  syncobj_deps[i].point,
-							  syncobj_deps[i].flags);
+		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
 		if (r)
 			return r;
 	}
 
-	return 0;
-}
-
-static int amdgpu_cs_process_syncobj_out_dep(struct amdgpu_cs_parser *p,
-					     struct amdgpu_cs_chunk *chunk)
-{
-	struct drm_amdgpu_cs_chunk_sem *deps;
-	unsigned num_deps;
-	int i;
-
-	deps = (struct drm_amdgpu_cs_chunk_sem *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_sem);
-
-	if (p->post_deps)
-		return -EINVAL;
-
-	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
-				     GFP_KERNEL);
-	p->num_post_deps = 0;
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+		/* ignore duplicates */
+		bo = ttm_to_amdgpu_bo(e->tv.bo);
+		if (!bo)
+			continue;
 
-	if (!p->post_deps)
-		return -ENOMEM;
+		bo_va = e->bo_va;
+		if (bo_va == NULL)
+			continue;
 
+		r = amdgpu_vm_bo_update(adev, bo_va, false);
+		if (r)
+			return r;
 
-	for (i = 0; i < num_deps; ++i) {
-		p->post_deps[i].syncobj =
-			drm_syncobj_find(p->filp, deps[i].handle);
-		if (!p->post_deps[i].syncobj)
-			return -EINVAL;
-		p->post_deps[i].chain = NULL;
-		p->post_deps[i].point = 0;
-		p->num_post_deps++;
+		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
+		if (r)
+			return r;
 	}
 
-	return 0;
-}
-
-
-static int amdgpu_cs_process_syncobj_timeline_out_dep(struct amdgpu_cs_parser *p,
-						      struct amdgpu_cs_chunk *chunk)
-{
-	struct drm_amdgpu_cs_chunk_syncobj *syncobj_deps;
-	unsigned num_deps;
-	int i;
-
-	syncobj_deps = (struct drm_amdgpu_cs_chunk_syncobj *)chunk->kdata;
-	num_deps = chunk->length_dw * 4 /
-		sizeof(struct drm_amdgpu_cs_chunk_syncobj);
+	r = amdgpu_vm_handle_moved(adev, vm);
+	if (r)
+		return r;
 
-	if (p->post_deps)
-		return -EINVAL;
+	r = amdgpu_vm_update_pdes(adev, vm, false);
+	if (r)
+		return r;
 
-	p->post_deps = kmalloc_array(num_deps, sizeof(*p->post_deps),
-				     GFP_KERNEL);
-	p->num_post_deps = 0;
+	r = amdgpu_sync_fence(&p->job->sync, vm->last_update);
+	if (r)
+		return r;
 
-	if (!p->post_deps)
-		return -ENOMEM;
+	p->job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 
-	for (i = 0; i < num_deps; ++i) {
-		struct amdgpu_cs_post_dep *dep = &p->post_deps[i];
+	if (amdgpu_vm_debug) {
+		/* Invalidate all BOs to test for userspace bugs */
+		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
+			struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
 
-		dep->chain = NULL;
-		if (syncobj_deps[i].point) {
-			dep->chain = dma_fence_chain_alloc();
-			if (!dep->chain)
-				return -ENOMEM;
-		}
+			/* ignore duplicates */
+			if (!bo)
+				continue;
 
-		dep->syncobj = drm_syncobj_find(p->filp,
-						syncobj_deps[i].handle);
-		if (!dep->syncobj) {
-			dma_fence_chain_free(dep->chain);
-			return -EINVAL;
+			amdgpu_vm_bo_invalidate(adev, bo, false);
 		}
-		dep->point = syncobj_deps[i].point;
-		p->num_post_deps++;
 	}
 
 	return 0;
 }
 
-static int amdgpu_cs_dependencies(struct amdgpu_device *adev,
-				  struct amdgpu_cs_parser *p)
+static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
-	int i, r;
-
-	for (i = 0; i < p->nchunks; ++i) {
-		struct amdgpu_cs_chunk *chunk;
+	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_bo_list_entry *e;
+	int r;
 
-		chunk = &p->chunks[i];
+	list_for_each_entry(e, &p->validated, tv.head) {
+		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
+		struct dma_resv *resv = bo->tbo.base.resv;
+		enum amdgpu_sync_mode sync_mode;
 
-		switch (chunk->chunk_id) {
-		case AMDGPU_CHUNK_ID_DEPENDENCIES:
-		case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
-			r = amdgpu_cs_process_fence_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
-			r = amdgpu_cs_process_syncobj_in_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
-			r = amdgpu_cs_process_syncobj_out_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
-			r = amdgpu_cs_process_syncobj_timeline_in_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
-			r = amdgpu_cs_process_syncobj_timeline_out_dep(p, chunk);
-			if (r)
-				return r;
-			break;
-		}
+		sync_mode = amdgpu_bo_explicit_sync(bo) ?
+			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
+		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
+				     &fpriv->vm);
+		if (r)
+			return r;
 	}
-
 	return 0;
 }
 
@@ -1243,17 +1252,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	return r;
 }
 
-static void trace_amdgpu_cs_ibs(struct amdgpu_cs_parser *parser)
-{
-	int i;
-
-	if (!trace_amdgpu_cs_enabled())
-		return;
-
-	for (i = 0; i < parser->job->num_ibs; i++)
-		trace_amdgpu_cs(parser, i);
-}
-
 /* Cleanup the parser structure */
 static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
 				  bool backoff)
@@ -1342,6 +1340,10 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	if (r)
 		goto out;
 
+	r = amdgpu_cs_sync_rings(&parser);
+	if (r)
+		goto out;
+
 	r = amdgpu_cs_submit(&parser, data);
 out:
 	amdgpu_cs_parser_fini(&parser, r, reserved_buffers);
-- 
2.25.1

