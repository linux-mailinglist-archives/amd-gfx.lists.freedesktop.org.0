Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4611822ED
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 20:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1056E9F8;
	Wed, 11 Mar 2020 19:56:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28266E9F1
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 19:56:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 25so3477960wmk.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding;
 bh=g0ySXUraY2gdZNQiIVrb2mdX9XF2SK3zsJLAgLDMscw=;
 b=IqAQdPGNYrr3Xxmwv/ZWzW7Sgkq/hpXWsrgQKcdCzfhvyDBb+01txVxLfFKClnm7IE
 Hrz7y/ic5kJVbU8Co5sEjNNR8vocHDhi/qwSssRh37QVeFnly4N1JFsvyokq44eMIRTu
 XKh4HRhym2vsEp/o9t5LAfv+MlXNaLwHSUfCTWN/RRJb6c0viFdi8hI+0bRb5qhbr8W0
 G4PXXcknOAVXsPyy3LThr4kRyZCHiI2U/8Rmahhm1tb0kFO6lFADky7eadqhyg/DV7Wj
 fmAL3MYi9sez0CpYtS21QhDU3xvnc1JZ/ynRfdd26JVVcISRrZjU1zVocmOCu7dZIQHj
 L/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :mime-version:content-transfer-encoding;
 bh=g0ySXUraY2gdZNQiIVrb2mdX9XF2SK3zsJLAgLDMscw=;
 b=E0pa8laQ05bX6EzLFpS/b2E5fHjd3HOHGv8zrBQETae1ZSrRRzQny7np3XdMtSrDaL
 D6Z0sbhRT2Co3jdxny0rPswQAt3HH1GkQU+oHGX5DgY9gNU+NPffQhE4WUsBgSp4FtQT
 HKNYvh0hpkZuFKANfS9srNJTei3TbHFbHQC/drUw2Ty6DHxe9w+AltwlafUGwXmdD6dv
 1sy4D9snNf7FZ5+bwK3n5eDWHJfY98UYdixjynSt0yd2TsWuZbCgdmyds7+Y0pkBA5XP
 377XFPWEgsMwi3FzWzHfBWSAU+HraMz2dNf7BaT1pjncHdpCGi/q4gjVUCotmlcmQfSs
 gpcg==
X-Gm-Message-State: ANhLgQ2DKviytg6l7hQ8Q+gHgtA63TANMKEl8NrEpuw7zJRfGll51jQ7
 MIorjzNA6Rpita8E2VjP2yuZXOcOmW7RZlxW
X-Google-Smtp-Source: ADFU+vuF7LOdQ6AIBUCTeo5wrwhhu7E/TC9NN0apdLGRZo6Mli9XA+8QJ0nqJ2iBlJaKgRfNPNjeKw==
X-Received: by 2002:a05:600c:215:: with SMTP id
 21mr351466wmi.119.1583956613795; 
 Wed, 11 Mar 2020 12:56:53 -0700 (PDT)
Received: from brihaspati.fritz.box
 (p200300C58F28AE00BD65D97DC346E601.dip0.t-ipconnect.de.
 [2003:c5:8f28:ae00:bd65:d97d:c346:e601])
 by smtp.gmail.com with ESMTPSA id l17sm10709107wmg.23.2020.03.11.12.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:56:53 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/amdgpu: disable gpu_sched load balancer for vcn jobs
Date: Wed, 11 Mar 2020 21:00:32 +0100
Message-Id: <20200311200032.50502-1-nirmoy.das@amd.com>
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
Reply-To: 20200311195759.49332-1-nirmoy.das@amd.com
Cc: Boyuan.Zhang@amd.com, nirmoy.das@amd.com, alexander.deucher@amd.com,
 James.Zhu@amd.com, Leo.Liu@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VCN HW  doesn't support dynamic load balance on multiple
instances for a context. This patch modifies entity's
sched_list to a sched_list consist of only one drm scheduler.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  | 13 +++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h  |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  1 +
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c    |  2 ++
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c    |  2 ++
 8 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 8304d0c87899..db0eef19c636 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1203,6 +1203,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 			    union drm_amdgpu_cs *cs)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
+	struct amdgpu_ring *ring = to_amdgpu_ring(p->entity->rq->sched);
 	struct drm_sched_entity *entity = p->entity;
 	enum drm_sched_priority priority;
 	struct amdgpu_bo_list_entry *e;
@@ -1257,6 +1258,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	priority = job->base.s_priority;
 	drm_sched_entity_push_job(&job->base, entity);
 
+	if (ring->funcs->no_gpu_sched_loadbalance)
+		amdgpu_ctx_disable_gpu_sched_load_balance(entity);
+
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index fa575bdc03c8..1127e8f77721 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -559,6 +559,19 @@ void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
 	}
 }
 
+/**
+ * amdgpu_ctx_disable_gpu_sched_load_balance - disable gpu_sched's load balancer
+ * @entity: entity on which load balancer will be disabled
+ */
+void amdgpu_ctx_disable_gpu_sched_load_balance(struct drm_sched_entity *entity)
+{
+	struct drm_gpu_scheduler **scheds = &entity->rq->sched;
+
+	/* disable gpu_sched's job load balancer by assigning only one */
+	/* drm scheduler to the entity */
+	drm_sched_entity_modify_sched(entity, scheds, 1);
+}
+
 int amdgpu_ctx_wait_prev_fence(struct amdgpu_ctx *ctx,
 			       struct drm_sched_entity *entity)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
index de490f183af2..3a2f900b8000 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
@@ -90,5 +90,6 @@ void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr);
 
 void amdgpu_ctx_init_sched(struct amdgpu_device *adev);
 
+void amdgpu_ctx_disable_gpu_sched_load_balance(struct drm_sched_entity *entity);
 
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 4981e443a884..64dad7ba74da 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -140,6 +140,7 @@ void amdgpu_job_free(struct amdgpu_job *job)
 int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 		      void *owner, struct dma_fence **f)
 {
+	struct amdgpu_ring *ring = to_amdgpu_ring(entity->rq->sched);
 	enum drm_sched_priority priority;
 	int r;
 
@@ -154,6 +155,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
 	amdgpu_job_free_resources(job);
 	priority = job->base.s_priority;
 	drm_sched_entity_push_job(&job->base, entity);
+	if (ring->funcs->no_gpu_sched_loadbalance)
+		amdgpu_ctx_disable_gpu_sched_load_balance(entity);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 448c76cbf3ed..f78fe1a6912b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -115,6 +115,7 @@ struct amdgpu_ring_funcs {
 	u32			nop;
 	bool			support_64bit_ptrs;
 	bool			no_user_fence;
+	bool			no_gpu_sched_loadbalance;
 	unsigned		vmhub;
 	unsigned		extra_dw;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index 71f61afdc655..749ccdb5fbfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -1871,6 +1871,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
 	.align_mask = 0xf,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.no_gpu_sched_loadbalance = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = vcn_v1_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v1_0_dec_ring_get_wptr,
@@ -1905,6 +1906,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_enc_ring_vm_funcs = {
 	.nop = VCN_ENC_CMD_NO_OP,
 	.support_64bit_ptrs = false,
 	.no_user_fence = true,
+	.no_gpu_sched_loadbalance = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = vcn_v1_0_enc_ring_get_rptr,
 	.get_wptr = vcn_v1_0_enc_ring_get_wptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
index f2745fd1ddb3..c48423b54bc5 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
@@ -1954,6 +1954,7 @@ static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
 static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_DEC,
 	.align_mask = 0xf,
+	.no_gpu_sched_loadbalance = true,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = vcn_v2_0_dec_ring_get_rptr,
 	.get_wptr = vcn_v2_0_dec_ring_get_wptr,
@@ -1984,6 +1985,7 @@ static const struct amdgpu_ring_funcs vcn_v2_0_dec_ring_vm_funcs = {
 static const struct amdgpu_ring_funcs vcn_v2_0_enc_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
+	.no_gpu_sched_loadbalance = true,
 	.nop = VCN_ENC_CMD_NO_OP,
 	.vmhub = AMDGPU_MMHUB_0,
 	.get_rptr = vcn_v2_0_enc_ring_get_rptr,
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
index 9b22e2b55132..1cc8e1420fc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
@@ -1478,6 +1478,7 @@ static void vcn_v2_5_dec_ring_set_wptr(struct amdgpu_ring *ring)
 static const struct amdgpu_ring_funcs vcn_v2_5_dec_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_DEC,
 	.align_mask = 0xf,
+	.no_gpu_sched_loadbalance = true,
 	.vmhub = AMDGPU_MMHUB_1,
 	.get_rptr = vcn_v2_5_dec_ring_get_rptr,
 	.get_wptr = vcn_v2_5_dec_ring_get_wptr,
@@ -1577,6 +1578,7 @@ static void vcn_v2_5_enc_ring_set_wptr(struct amdgpu_ring *ring)
 static const struct amdgpu_ring_funcs vcn_v2_5_enc_ring_vm_funcs = {
 	.type = AMDGPU_RING_TYPE_VCN_ENC,
 	.align_mask = 0x3f,
+	.no_gpu_sched_loadbalance = true,
 	.nop = VCN_ENC_CMD_NO_OP,
 	.vmhub = AMDGPU_MMHUB_1,
 	.get_rptr = vcn_v2_5_enc_ring_get_rptr,
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
