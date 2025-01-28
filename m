Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5AA20C15
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Jan 2025 15:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0132B10E679;
	Tue, 28 Jan 2025 14:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kkBBgrUD";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12B810E66C;
 Tue, 28 Jan 2025 14:30:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 254225C5FC0;
 Tue, 28 Jan 2025 14:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCFDFC4CED3;
 Tue, 28 Jan 2025 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738074606;
 bh=HZxDt6elYKpZuEAk9Z61KJVeahL/VISXNocfo0PHA0g=;
 h=From:To:Cc:Subject:Date:From;
 b=kkBBgrUDYHrLQCu4V6tNozR8TT/DVbD8p6oimvzMwM9qiUxg60Og5xrtYCIxmBBy2
 zOdXEqg2tA1fsUDRecK/YoJIXaDoZfUiH8180nf+YLinsA4+sm6VP5R3tg4Q4TVBfm
 CGuOvyiuSpvz8rs+9wM17Z4GOUzFHktUrYgg529uRkQK2CXy8MCKK05SYTO7l76C0m
 SPEEy6NNbYe87fTBDnzfuyc3jmwDaw+l9cbFDMOVXFTVHZpMgh94GfR0RDVgA6yn68
 S6L9xJJJEYq74maZq+DOb15S+nmNete+mkcv5g+25mVgAjuFAa/gN3luL1kXyrh2eL
 ySs2KEuB2uIyw==
From: Philipp Stanner <phasta@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Date: Tue, 28 Jan 2025 15:29:27 +0100
Message-ID: <20250128142927.103290-2-phasta@kernel.org>
X-Mailer: git-send-email 2.47.1
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

drm_sched_init() has a great many parameters and upcoming new
functionality for the scheduler might add even more. Generally, the
great number of parameters reduces readability and has already caused
one missnaming in:

commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in nouveau_sched_init()").

Introduce a new struct for the scheduler init parameters and port all
users.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Point out that the hang-limit is deprecated. (Christian)
  - Initialize the structs to 0 at declaration. (Planet Earth)
  - Don't set stuff explicitly to 0 / NULL. (Tvrtko)
  - Make the structs const where possible. (Boris)
  - v3d: Use just 1, universal, function for sched-init. (Maíra)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 18 ++++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    | 20 +++----
 drivers/gpu/drm/imagination/pvr_queue.c    | 18 ++++--
 drivers/gpu/drm/lima/lima_sched.c          | 16 +++--
 drivers/gpu/drm/msm/msm_ringbuffer.c       | 17 +++---
 drivers/gpu/drm/nouveau/nouveau_sched.c    | 15 +++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 20 ++++---
 drivers/gpu/drm/panthor/panthor_mmu.c      | 16 +++--
 drivers/gpu/drm/panthor/panthor_sched.c    | 29 +++++----
 drivers/gpu/drm/scheduler/sched_main.c     | 50 ++++++----------
 drivers/gpu/drm/v3d/v3d_sched.c            | 68 +++++++++-------------
 drivers/gpu/drm/xe/xe_execlist.c           | 16 +++--
 drivers/gpu/drm/xe/xe_gpu_scheduler.c      | 17 +++++-
 include/drm/gpu_scheduler.h                | 37 ++++++++++--
 14 files changed, 206 insertions(+), 151 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 96316111300a..daf58b0ff0fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2816,6 +2816,12 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
 
 static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 {
+	struct drm_sched_init_args args = {
+		.ops = &amdgpu_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.timeout_wq = adev->reset_domain->wq,
+		.dev = adev->dev
+	};
 	long timeout;
 	int r, i;
 
@@ -2841,12 +2847,12 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
-				   DRM_SCHED_PRIORITY_COUNT,
-				   ring->num_hw_submission, 0,
-				   timeout, adev->reset_domain->wq,
-				   ring->sched_score, ring->name,
-				   adev->dev);
+		args.timeout = timeout;
+		args.credit_limit = ring->num_hw_submission;
+		args.score = ring->sched_score;
+		args.name = ring->name;
+
+		r = drm_sched_init(&ring->sched, &args);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 5b67eda122db..1693fd660bf1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -144,17 +144,17 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 
 int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
-	int ret;
+	const struct drm_sched_init_args args = {
+		.ops = &etnaviv_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = etnaviv_hw_jobs_limit,
+		.hang_limit = etnaviv_job_hang_limit,
+		.timeout = msecs_to_jiffies(500),
+		.name = dev_name(gpu->dev),
+		.dev = gpu->dev
+	};
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
-			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
-	if (ret)
-		return ret;
-
-	return 0;
+	return drm_sched_init(&gpu->sched, &args);
 }
 
 void etnaviv_sched_fini(struct etnaviv_gpu *gpu)
diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/imagination/pvr_queue.c
index c4f08432882b..d5c22874a9c1 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1210,6 +1210,17 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
 		},
 	};
 	struct pvr_device *pvr_dev = ctx->pvr_dev;
+	const struct drm_sched_init_args sched_args = {
+		.ops = &pvr_queue_sched_ops,
+		.submit_wq = pvr_dev->sched_wq,
+		.num_rqs = 1,
+		.credit_limit = 64 * 1024,
+		.hang_limit = 1,
+		.timeout = msecs_to_jiffies(500),
+		.timeout_wq = pvr_dev->sched_wq,
+		.name = "pvr-queue",
+		.dev = pvr_dev->base.dev
+	};
 	struct drm_gpu_scheduler *sched;
 	struct pvr_queue *queue;
 	int ctx_state_size, err;
@@ -1282,12 +1293,7 @@ struct pvr_queue *pvr_queue_create(struct pvr_context *ctx,
 
 	queue->timeline_ufo.value = cpu_map;
 
-	err = drm_sched_init(&queue->scheduler,
-			     &pvr_queue_sched_ops,
-			     pvr_dev->sched_wq, 1, 64 * 1024, 1,
-			     msecs_to_jiffies(500),
-			     pvr_dev->sched_wq, NULL, "pvr-queue",
-			     pvr_dev->base.dev);
+	err = drm_sched_init(&queue->scheduler, &sched_args);
 	if (err)
 		goto err_release_ufo;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index b40c90e97d7e..137adbd2b52d 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -515,18 +515,22 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 {
 	unsigned int timeout = lima_sched_timeout_ms > 0 ?
 			       lima_sched_timeout_ms : 10000;
+	const struct drm_sched_init_args args = {
+		.ops = &lima_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.hang_limit = lima_job_hang_limit,
+		.timeout = msecs_to_jiffies(timeout),
+		.name = name,
+		.dev = pipe->ldev->dev
+	};
 
 	pipe->fence_context = dma_fence_context_alloc(1);
 	spin_lock_init(&pipe->fence_lock);
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
-			      DRM_SCHED_PRIORITY_COUNT,
-			      1,
-			      lima_job_hang_limit,
-			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+	return drm_sched_init(&pipe->base, &args);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index c803556a8f64..c9d5283df3e3 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -59,8 +59,14 @@ static const struct drm_sched_backend_ops msm_sched_ops = {
 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 		void *memptrs, uint64_t memptrs_iova)
 {
+	struct drm_sched_init_args args = {
+		.ops = &msm_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = num_hw_submissions,
+		.timeout = MAX_SCHEDULE_TIMEOUT,
+		.dev = gpu->dev->dev
+	};
 	struct msm_ringbuffer *ring;
-	long sched_timeout;
 	char name[32];
 	int ret;
 
@@ -87,6 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	}
 
 	msm_gem_object_set_name(ring->bo, "ring%d", id);
+	args.name = to_msm_bo(ring->bo)->name,
 
 	ring->end   = ring->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
 	ring->next  = ring->start;
@@ -95,13 +102,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->memptrs = memptrs;
 	ring->memptrs_iova = memptrs_iova;
 
-	 /* currently managing hangcheck ourselves: */
-	sched_timeout = MAX_SCHEDULE_TIMEOUT;
-
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     num_hw_submissions, 0, sched_timeout,
-			     NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+	ret = drm_sched_init(&ring->sched, &args);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 4412f2711fb5..b5aac8eebfdd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 {
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
-	const long timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
+	const struct drm_sched_init_args args = {
+		.ops = &nouveau_sched_ops,
+		.submit_wq = wq,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = credit_limit,
+		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
+		.name = "nouveau_sched",
+		.dev = drm->dev->dev
+	};
 	int ret;
 
 	if (!wq) {
@@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		sched->wq = wq;
 	}
 
-	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
-			     NOUVEAU_SCHED_PRIORITY_COUNT,
-			     credit_limit, 0, timeout,
-			     NULL, NULL, "nouveau_sched", drm->dev->dev);
+	ret = drm_sched_init(drm_sched, &args);
 	if (ret)
 		goto fail_wq;
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 9b8e82fb8bc4..893fd91cf5b0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -836,8 +836,16 @@ static irqreturn_t panfrost_job_irq_handler(int irq, void *data)
 
 int panfrost_job_init(struct panfrost_device *pfdev)
 {
+	struct drm_sched_init_args args = {
+		.ops = &panfrost_sched_ops,
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 2,
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.timeout_wq = pfdev->reset.wq,
+		.name = "pan_js",
+		.dev = pfdev->dev
+	};
 	struct panfrost_job_slot *js;
-	unsigned int nentries = 2;
 	int ret, j;
 
 	/* All GPUs have two entries per queue, but without jobchain
@@ -845,7 +853,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	 * so let's just advertise one entry in that case.
 	 */
 	if (!panfrost_has_hw_feature(pfdev, HW_FEATURE_JOBCHAIN_DISAMBIGUATION))
-		nentries = 1;
+		args.credit_limit = 1;
 
 	pfdev->js = js = devm_kzalloc(pfdev->dev, sizeof(*js), GFP_KERNEL);
 	if (!js)
@@ -875,13 +883,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 	for (j = 0; j < NUM_JOB_SLOTS; j++) {
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
-		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops, NULL,
-				     DRM_SCHED_PRIORITY_COUNT,
-				     nentries, 0,
-				     msecs_to_jiffies(JOB_TIMEOUT_MS),
-				     pfdev->reset.wq,
-				     NULL, "pan_js", pfdev->dev);
+		ret = drm_sched_init(&js->queue[j].sched, &args);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 5ce80e2532d5..22b196ff686c 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2278,6 +2278,16 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 	u64 full_va_range = 1ull << va_bits;
 	struct drm_gem_object *dummy_gem;
 	struct drm_gpu_scheduler *sched;
+	const struct drm_sched_init_args sched_args = {
+		.ops = &panthor_vm_bind_ops,
+		.submit_wq = ptdev->mmu->vm.wq,
+		.num_rqs = 1,
+		.credit_limit = 1,
+		/* Bind operations are synchronous for now, no timeout needed. */
+		.timeout = MAX_SCHEDULE_TIMEOUT,
+		.name = "panthor-vm-bind",
+		.dev = ptdev->base.dev
+	};
 	struct io_pgtable_cfg pgtbl_cfg;
 	u64 mair, min_va, va_range;
 	struct panthor_vm *vm;
@@ -2335,11 +2345,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 		goto err_mm_takedown;
 	}
 
-	/* Bind operations are synchronous for now, no timeout needed. */
-	ret = drm_sched_init(&vm->sched, &panthor_vm_bind_ops, ptdev->mmu->vm.wq,
-			     1, 1, 0,
-			     MAX_SCHEDULE_TIMEOUT, NULL, NULL,
-			     "panthor-vm-bind", ptdev->base.dev);
+	ret = drm_sched_init(&vm->sched, &sched_args);
 	if (ret)
 		goto err_free_io_pgtable;
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5844a7f639e0..44713cfdcd74 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3284,6 +3284,22 @@ static struct panthor_queue *
 group_create_queue(struct panthor_group *group,
 		   const struct drm_panthor_queue_create *args)
 {
+	const struct drm_sched_init_args sched_args = {
+		.ops = &panthor_queue_sched_ops,
+		.submit_wq = group->ptdev->scheduler->wq,
+		.num_rqs = 1,
+		/*
+		 * The credit limit argument tells us the total number of
+		 * instructions across all CS slots in the ringbuffer, with
+		 * some jobs requiring twice as many as others, depending on
+		 * their profiling status.
+		 */
+		.credit_limit = args->ringbuf_size / sizeof(u64),
+		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
+		.timeout_wq = group->ptdev->reset.wq,
+		.name = "panthor-queue",
+		.dev = group->ptdev->base.dev
+	};
 	struct drm_gpu_scheduler *drm_sched;
 	struct panthor_queue *queue;
 	int ret;
@@ -3354,17 +3370,8 @@ group_create_queue(struct panthor_group *group,
 	if (ret)
 		goto err_free_queue;
 
-	/*
-	 * Credit limit argument tells us the total number of instructions
-	 * across all CS slots in the ringbuffer, with some jobs requiring
-	 * twice as many as others, depending on their profiling status.
-	 */
-	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
-			     group->ptdev->scheduler->wq, 1,
-			     args->ringbuf_size / sizeof(u64),
-			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
-			     group->ptdev->reset.wq,
-			     NULL, "panthor-queue", group->ptdev->base.dev);
+
+	ret = drm_sched_init(&queue->scheduler, &sched_args);
 	if (ret)
 		goto err_free_queue;
 
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a48be16ab84f..6295b2654a7c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1244,40 +1244,24 @@ static void drm_sched_run_job_work(struct work_struct *w)
  * drm_sched_init - Init a gpu scheduler instance
  *
  * @sched: scheduler instance
- * @ops: backend operations for this scheduler
- * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
- *	       allocated and used
- * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
- * @credit_limit: the number of credits this scheduler can hold from all jobs
- * @hang_limit: number of times to allow a job to hang before dropping it
- * @timeout: timeout value in jiffies for the scheduler
- * @timeout_wq: workqueue to use for timeout work. If NULL, the system_wq is
- *		used
- * @score: optional score atomic shared with other schedulers
- * @name: name used for debugging
- * @dev: target &struct device
+ * @args: scheduler initialization arguments
  *
  * Return 0 on success, otherwise error code.
  */
-int drm_sched_init(struct drm_gpu_scheduler *sched,
-		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
-		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
 {
 	int i;
 
-	sched->ops = ops;
-	sched->credit_limit = credit_limit;
-	sched->name = name;
-	sched->timeout = timeout;
-	sched->timeout_wq = timeout_wq ? : system_wq;
-	sched->hang_limit = hang_limit;
-	sched->score = score ? score : &sched->_score;
-	sched->dev = dev;
+	sched->ops = args->ops;
+	sched->credit_limit = args->credit_limit;
+	sched->name = args->name;
+	sched->timeout = args->timeout;
+	sched->timeout_wq = args->timeout_wq ? : system_wq;
+	sched->hang_limit = args->hang_limit;
+	sched->score = args->score ? args->score : &sched->_score;
+	sched->dev = args->dev;
 
-	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
+	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
 		/* This is a gross violation--tell drivers what the  problem is.
 		 */
 		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
@@ -1292,16 +1276,16 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return 0;
 	}
 
-	if (submit_wq) {
-		sched->submit_wq = submit_wq;
+	if (args->submit_wq) {
+		sched->submit_wq = args->submit_wq;
 		sched->own_submit_wq = false;
 	} else {
 #ifdef CONFIG_LOCKDEP
-		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(name,
+		sched->submit_wq = alloc_ordered_workqueue_lockdep_map(args->name,
 								       WQ_MEM_RECLAIM,
 								       &drm_sched_lockdep_map);
 #else
-		sched->submit_wq = alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
+		sched->submit_wq = alloc_ordered_workqueue(args->name, WQ_MEM_RECLAIM);
 #endif
 		if (!sched->submit_wq)
 			return -ENOMEM;
@@ -1309,11 +1293,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->own_submit_wq = true;
 	}
 
-	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
+	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
 					GFP_KERNEL | __GFP_ZERO);
 	if (!sched->sched_rq)
 		goto Out_check_own;
-	sched->num_rqs = num_rqs;
+	sched->num_rqs = args->num_rqs;
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 961465128d80..dfccb4cda3a1 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -820,67 +820,57 @@ static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
 	.free_job = v3d_cpu_job_free
 };
 
+/*
+ * v3d's scheduler instances are all identical, except for ops and name.
+ */
+static int
+v3d_queue_sched_init(struct v3d_dev *v3d, const struct drm_sched_backend_ops *ops,
+		     enum v3d_queue queue, const char *name)
+{
+	struct drm_sched_init_args args = {
+		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
+		.credit_limit = 1,
+		.timeout = msecs_to_jiffies(500),
+		.dev = v3d->drm.dev
+	};
+
+	args.ops = ops;
+	args.name = name;
+
+	return drm_sched_init(&v3d->queue[queue].sched, &args);
+}
+
 int
 v3d_sched_init(struct v3d_dev *v3d)
 {
-	int hw_jobs_limit = 1;
-	int job_hang_limit = 0;
-	int hang_limit_ms = 500;
 	int ret;
 
-	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+	ret = v3d_queue_sched_init(v3d, &v3d_bin_sched_ops, V3D_BIN, "v3d_bin");
 	if (ret)
 		return ret;
 
-	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+	ret = v3d_queue_sched_init(v3d, &v3d_render_sched_ops, V3D_RENDER,
+				   "v3d_render");
 	if (ret)
 		goto fail;
 
-	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+	ret = v3d_queue_sched_init(v3d, &v3d_tfu_sched_ops, V3D_TFU, "v3d_tfu");
 	if (ret)
 		goto fail;
 
 	if (v3d_has_csd(v3d)) {
-		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops, NULL,
-				     DRM_SCHED_PRIORITY_COUNT,
-				     hw_jobs_limit, job_hang_limit,
-				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+		ret = v3d_queue_sched_init(v3d, &v3d_csd_sched_ops, V3D_CSD,
+					   "v3d_csd");
 		if (ret)
 			goto fail;
 
-		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops, NULL,
-				     DRM_SCHED_PRIORITY_COUNT,
-				     hw_jobs_limit, job_hang_limit,
-				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+		ret = v3d_queue_sched_init(v3d, &v3d_cache_clean_sched_ops,
+					   V3D_CACHE_CLEAN, "v3d_cache_clean");
 		if (ret)
 			goto fail;
 	}
 
-	ret = drm_sched_init(&v3d->queue[V3D_CPU].sched,
-			     &v3d_cpu_sched_ops, NULL,
-			     DRM_SCHED_PRIORITY_COUNT,
-			     1, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_cpu", v3d->drm.dev);
+	ret = v3d_queue_sched_init(v3d, &v3d_cpu_sched_ops, V3D_CPU, "v3d_cpu");
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index a8c416a48812..db1c52dcf1a6 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -332,6 +332,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
 static int execlist_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct drm_gpu_scheduler *sched;
+	const struct drm_sched_init_args args = {
+		.ops = &drm_sched_ops,
+		.num_rqs = 1,
+		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
+		.hang_limit = XE_SCHED_HANG_LIMIT,
+		.timeout = XE_SCHED_JOB_TIMEOUT,
+		.name = q->hwe->name,
+		.dev = gt_to_xe(q->gt)->drm.dev
+	};
 	struct xe_execlist_exec_queue *exl;
 	struct xe_device *xe = gt_to_xe(q->gt);
 	int err;
@@ -346,11 +355,8 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 
 	exl->q = q;
 
-	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
-			     q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
-			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, q->hwe->name,
-			     gt_to_xe(q->gt)->drm.dev);
+
+	err = drm_sched_init(&exl->sched, &args);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 50361b4638f9..be95f4cca007 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -63,13 +63,24 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 		  atomic_t *score, const char *name,
 		  struct device *dev)
 {
+	const struct drm_sched_init_args args = {
+		.ops = ops,
+		.submit_wq = submit_wq,
+		.num_rqs = 1,
+		.credit_limit = hw_submission,
+		.hang_limit = hang_limit,
+		.timeout = timeout,
+		.timeout_wq = timeout_wq,
+		.score = score,
+		.name = name,
+		.dev = dev
+	};
+
 	sched->ops = xe_ops;
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
 
-	return drm_sched_init(&sched->base, ops, submit_wq, 1, hw_submission,
-			      hang_limit, timeout, timeout_wq, score, name,
-			      dev);
+	return drm_sched_init(&sched->base, &args);
 }
 
 void xe_sched_fini(struct xe_gpu_scheduler *sched)
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a0ff08123f07..f0f5435598a8 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -540,12 +540,39 @@ struct drm_gpu_scheduler {
 	struct device			*dev;
 };
 
+/**
+ * struct drm_sched_init_args - parameters for initializing a DRM GPU scheduler
+ *
+ * @ops: backend operations provided by the driver
+ * @submit_wq: workqueue to use for submission. May be NULL.
+ *	If NULL, an ordered wq is allocated and used.
+ * @num_rqs: Number of run-queues. This may be at most DRM_SCHED_PRIORITY_COUNT,
+ *	as there's usually one run-queue per priority, but may be less.
+ * @credit_limit: the number of credits this scheduler can hold from all jobs
+ * @hang_limit: number of times to allow a job to hang before dropping it.
+ *	This mechanism is DEPRECATED. Set it to 0.
+ * @timeout: timeout value in jiffies for the scheduler
+ * @timeout_wq: workqueue to use for timeout work. May be NULL.
+ *	If NULL, the system_wq is used.
+ * @score: score atomic shared with other schedulers. May be NULL.
+ * @name: name used for debugging
+ * @dev: associated device. Used for debugging
+ */
+struct drm_sched_init_args {
+	const struct drm_sched_backend_ops *ops;
+	struct workqueue_struct *submit_wq;
+	struct workqueue_struct *timeout_wq;
+	u32 num_rqs;
+	u32 credit_limit;
+	unsigned int hang_limit;
+	long timeout;
+	atomic_t *score;
+	const char *name;
+	struct device *dev;
+};
+
 int drm_sched_init(struct drm_gpu_scheduler *sched,
-		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *submit_wq,
-		   u32 num_rqs, u32 credit_limit, unsigned int hang_limit,
-		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev);
+		const struct drm_sched_init_args *args);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.47.1

