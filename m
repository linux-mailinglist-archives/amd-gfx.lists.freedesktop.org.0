Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7539814815
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Dec 2023 13:30:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDB810E9FB;
	Fri, 15 Dec 2023 12:30:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ECED10EA23
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Dec 2023 12:30:36 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c41b43e1eso6983265e9.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Dec 2023 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702643435; x=1703248235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ufofOPI53dqusnXUX0bRKlt3F7zsxLk0Z5Y5RBkysg0=;
 b=SRzAbrOlbZFjIuycGNX+NoA252z8Fm+Vcpo3AhR4yfp7HIs3a4yAXqevscFPdzgSSI
 xHYl7mSGoU1fUe2syMyDA+V9qwItPYVDm16PUANyaUljlDHnzoeEkkLd1b3gCLxXfMC0
 KMsOQderVJl5d1dURyjV1QGng5eR7WbAe6oBSrhs/r6XVb5mt9/wWN6zgIAmysjUWbYi
 aM/wLz39PjHTyuQEB/7VPpyKC9zXoYOesBcsQRWdrpUFvQ/4xT/Z9dkxRs3bSJ7HffZ0
 Dko0H7yMdZqE8w52X2frTsZGOdilSmZoKXdLjZE0V0cp+bOFSWhFTJjdSQEL+sJO7Y1Q
 q3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702643435; x=1703248235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufofOPI53dqusnXUX0bRKlt3F7zsxLk0Z5Y5RBkysg0=;
 b=GjYhFjhYfMXpimirqH/x7QuncxciqpIZkvehcWqygA8xDt5+gsFf0rGa6+jHtugryd
 mj3waeCVhOE3+X/tCVii8Vs5jIqhC8mHNYVyAYRxEi26swMHzdC81xtzGhJ35grrryWu
 0info5w4Psz7/OfD++ndmLvJGFNlkl4qD8T7PKG6maM5txckInn7MV01VhN9uWiKEaYH
 dL73Cm4F/6wA0mqzN0gETF+WEUaTwVi2urx1ZwziDgG+UnIXe2x4kGaeCHsY49Qef2TQ
 kcb0h8dUFdQPh6hrh3v6j2qVS3G0OysaCDc8yYaWfYM6gEZaCClDcLP7iUtQs4HftoRo
 l3vg==
X-Gm-Message-State: AOJu0YysCrfFjJAq/1LWXsMqYFqxaPhxTaG62hObnoqNw81przaKakjJ
 X95IpvwLNW7mTPuYr/c4w0c=
X-Google-Smtp-Source: AGHT+IFJpkSiSmCDwigeQEavmwobjmcQY0uBATGBvVcwEGV/v7ncb9cu8LzxcTLKStFjdbxcydYclA==
X-Received: by 2002:a05:600c:141:b0:40c:3667:9e89 with SMTP id
 w1-20020a05600c014100b0040c36679e89mr5001527wmm.85.1702643434398; 
 Fri, 15 Dec 2023 04:30:34 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0040b45356b72sm31126484wms.33.2023.12.15.04.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Dec 2023 04:30:33 -0800 (PST)
Message-ID: <fe14d738-ab23-460f-ac44-2090ef9ab4c5@gmail.com>
Date: Fri, 15 Dec 2023 13:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/amdgpu: Auto-validate DMABuf imports in
 compute VMs
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20231214223001.218746-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231214223001.218746-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: xiaogang.chen@amd.com, mukul.joshi@amd.com, ramesh.errabolu@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 14.12.23 um 23:30 schrieb Felix Kuehling:
> DMABuf imports in compute VMs are not wrapped in a kgd_mem object on the
> process_info->kfd_bo_list. There is no explicit KFD API call to validate
> them or add eviction fences to them.
>
> This patch automatically validates and fences dymanic DMABuf imports when
> they are added to a compute VM. Revalidation after evictions is handled
> in the VM code.
>
> v2:
> * Renamed amdgpu_vm_validate_evicted_bos to amdgpu_vm_validate
> * Eliminated evicted_user state, use evicted state for VM BOs and user BOs
> * Fixed and simplified amdgpu_vm_fence_imports, depends on reserved BOs
> * Moved dma_resv_reserve_fences for amdgpu_vm_fence_imports into
>    amdgpu_vm_validate, outside the vm->status_lock
> * Added dummy version of amdgpu_amdkfd_bo_validate_and_fence for builds
>    without KFD
>
> v4: Eliminate amdgpu_vm_fence_imports. It's not needed because the
> reservation with its fences is shared with the export, as long as all
> imports are from KFD, with the exports already reserved, validated and
> fenced by the KFD restore worker.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    | 10 ++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 39 ++++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |  4 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 29 ++++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 52 ++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  7 +--
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 10 ++--
>   8 files changed, 121 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index f262b9d89541..584a0cea5572 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -191,6 +191,9 @@ struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>   int amdgpu_amdkfd_remove_fence_on_pt_pd_bos(struct amdgpu_bo *bo);
>   int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>   				unsigned long cur_seq, struct kgd_mem *mem);
> +int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> +					uint32_t domain,
> +					struct dma_fence *fence);
>   #else
>   static inline
>   bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
> @@ -216,6 +219,13 @@ int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
>   {
>   	return 0;
>   }
> +static inline
> +int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> +					uint32_t domain,
> +					struct dma_fence *fence)
> +{
> +	return 0;
> +}
>   #endif
>   /* Shared API */
>   int amdgpu_amdkfd_alloc_gtt_mem(struct amdgpu_device *adev, size_t size,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 5f445d856769..6f3a4cb2a9ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -426,9 +426,9 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
>   	return ret;
>   }
>   
> -static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> -					       uint32_t domain,
> -					       struct dma_fence *fence)
> +int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> +					uint32_t domain,
> +					struct dma_fence *fence)
>   {
>   	int ret = amdgpu_bo_reserve(bo, false);
>   
> @@ -464,13 +464,15 @@ static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
>    * again. Page directories are only updated after updating page
>    * tables.
>    */
> -static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm)
> +static int vm_validate_pt_pd_bos(struct amdgpu_vm *vm,
> +				 struct ww_acquire_ctx *ticket)
>   {
>   	struct amdgpu_bo *pd = vm->root.bo;
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(pd->tbo.bdev);
>   	int ret;
>   
> -	ret = amdgpu_vm_validate_pt_bos(adev, vm, amdgpu_amdkfd_validate_vm_bo, NULL);
> +	ret = amdgpu_vm_validate(adev, vm, ticket,
> +				 amdgpu_amdkfd_validate_vm_bo, NULL);
>   	if (ret) {
>   		pr_err("failed to validate PT BOs\n");
>   		return ret;
> @@ -1310,14 +1312,15 @@ static int map_bo_to_gpuvm(struct kgd_mem *mem,
>   	return ret;
>   }
>   
> -static int process_validate_vms(struct amdkfd_process_info *process_info)
> +static int process_validate_vms(struct amdkfd_process_info *process_info,
> +				struct ww_acquire_ctx *ticket)
>   {
>   	struct amdgpu_vm *peer_vm;
>   	int ret;
>   
>   	list_for_each_entry(peer_vm, &process_info->vm_list_head,
>   			    vm_list_node) {
> -		ret = vm_validate_pt_pd_bos(peer_vm);
> +		ret = vm_validate_pt_pd_bos(peer_vm, ticket);
>   		if (ret)
>   			return ret;
>   	}
> @@ -1402,7 +1405,7 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
>   	ret = amdgpu_bo_reserve(vm->root.bo, true);
>   	if (ret)
>   		goto reserve_pd_fail;
> -	ret = vm_validate_pt_pd_bos(vm);
> +	ret = vm_validate_pt_pd_bos(vm, NULL);
>   	if (ret) {
>   		pr_err("validate_pt_pd_bos() failed\n");
>   		goto validate_pd_fail;
> @@ -2043,7 +2046,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
>   	    bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
>   		is_invalid_userptr = true;
>   
> -	ret = vm_validate_pt_pd_bos(avm);
> +	ret = vm_validate_pt_pd_bos(avm, NULL);
>   	if (unlikely(ret))
>   		goto out_unreserve;
>   
> @@ -2122,7 +2125,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
>   		goto unreserve_out;
>   	}
>   
> -	ret = vm_validate_pt_pd_bos(avm);
> +	ret = vm_validate_pt_pd_bos(avm, NULL);
>   	if (unlikely(ret))
>   		goto unreserve_out;
>   
> @@ -2620,7 +2623,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
>   		}
>   	}
>   
> -	ret = process_validate_vms(process_info);
> +	ret = process_validate_vms(process_info, NULL);
>   	if (ret)
>   		goto unreserve_out;
>   
> @@ -2880,11 +2883,6 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>   
>   	amdgpu_sync_create(&sync_obj);
>   
> -	/* Validate PDs and PTs */
> -	ret = process_validate_vms(process_info);
> -	if (ret)
> -		goto validate_map_fail;
> -
>   	/* Validate BOs and map them to GPUVM (update VM page tables). */
>   	list_for_each_entry(mem, &process_info->kfd_bo_list,
>   			    validate_list) {
> @@ -2935,6 +2933,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>   	if (failed_size)
>   		pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
>   
> +	/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
> +	 * validations above would invalidate DMABuf imports again.
> +	 */
> +	ret = process_validate_vms(process_info, &exec.ticket);
> +	if (ret)
> +		goto validate_map_fail;
> +
>   	/* Update mappings not managed by KFD */
>   	list_for_each_entry(peer_vm, &process_info->vm_list_head,
>   			vm_list_node) {
> @@ -3006,7 +3011,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
>   				   &process_info->eviction_fence->base,
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   	}
> -	/* Attach eviction fence to PD / PT BOs */
> +	/* Attach eviction fence to PD / PT BOs and DMABuf imports */
>   	list_for_each_entry(peer_vm, &process_info->vm_list_head,
>   			    vm_list_node) {
>   		struct amdgpu_bo *bo = peer_vm->root.bo;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index e50be6500030..dc7fac778417 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -952,10 +952,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>   	p->bytes_moved = 0;
>   	p->bytes_moved_vis = 0;
>   
> -	r = amdgpu_vm_validate_pt_bos(p->adev, &fpriv->vm,
> -				      amdgpu_cs_bo_validate, p);
> +	r = amdgpu_vm_validate(p->adev, &fpriv->vm, NULL,
> +			       amdgpu_cs_bo_validate, p);
>   	if (r) {
> -		DRM_ERROR("amdgpu_vm_validate_pt_bos() failed.\n");
> +		DRM_ERROR("amdgpu_vm_validate() failed.\n");
>   		goto out_free_user_pages;
>   	}
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index decbbe3d4f06..055ba2ea4c12 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -377,6 +377,10 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>   	struct amdgpu_vm_bo_base *bo_base;
>   	int r;
>   
> +	/* FIXME: This should be after the "if", but needs a fix to make sure
> +	 * DMABuf imports are initialized in the right VM list.
> +	 */
> +	amdgpu_vm_bo_invalidate(adev, bo, false);
>   	if (!bo->tbo.resource || bo->tbo.resource->mem_type == TTM_PL_SYSTEM)
>   		return;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index b1ce22a9b186..7bd32601c2a7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -187,7 +187,34 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>   	else
>   		++bo_va->ref_count;
>   	amdgpu_bo_unreserve(abo);
> -	return 0;
> +
> +	/* Validate and add eviction fence to DMABuf imports with dynamic
> +	 * attachment in compute VMs. Re-validation will be done by
> +	 * amdgpu_vm_validate. Fences are on the reservation shared with the
> +	 * export, which is currently required to be validated and fenced
> +	 * already by amdgpu_amdkfd_gpuvm_restore_process_bos.
> +	 *
> +	 * Nested locking below for the case that a GEM object is opened in
> +	 * kfd_mem_export_dmabuf. Since the lock below is only taken for imports,
> +	 * but not for export, this is a different lock class that cannot lead to
> +	 * circular lock dependencies.
> +	 */
> +	if (!vm->is_compute_context || !vm->process_info)
> +		return 0;
> +	if (!obj->import_attach ||
> +	    !dma_buf_is_dynamic(obj->import_attach->dmabuf))
> +		return 0;
> +	mutex_lock_nested(&vm->process_info->lock, 1);
> +	if (!WARN_ON(!vm->process_info->eviction_fence)) {
> +		r = amdgpu_amdkfd_bo_validate_and_fence(abo, AMDGPU_GEM_DOMAIN_GTT,
> +							&vm->process_info->eviction_fence->base);
> +		if (r)
> +			dev_warn(adev->dev, "%d: validate_and_fence failed: %d\n",
> +				 vm->task_info.pid, r);
> +	}
> +	mutex_unlock(&vm->process_info->lock);
> +
> +	return r;
>   }
>   
>   static void amdgpu_gem_object_close(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 7da71b6a9dc6..49b3f90be527 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -426,24 +426,29 @@ uint64_t amdgpu_vm_generation(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   }
>   
>   /**
> - * amdgpu_vm_validate_pt_bos - validate the page table BOs
> + * amdgpu_vm_validate - validate evicted BOs tracked in the VM
>    *
>    * @adev: amdgpu device pointer
>    * @vm: vm providing the BOs
> + * @ticket: optional reservation ticket used to reserve the VM
>    * @validate: callback to do the validation
>    * @param: parameter for the validation callback
>    *
> - * Validate the page table BOs on command submission if neccessary.
> + * Validate the page table BOs and per-VM BOs on command submission if
> + * necessary. If a ticket is given, also try to validate evicted user queue
> + * BOs. They must already be reserved with the given ticket.
>    *
>    * Returns:
>    * Validation result.
>    */
> -int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> -			      int (*validate)(void *p, struct amdgpu_bo *bo),
> -			      void *param)
> +int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> +		       struct ww_acquire_ctx *ticket,
> +		       int (*validate)(void *p, struct amdgpu_bo *bo),
> +		       void *param)
>   {
>   	struct amdgpu_vm_bo_base *bo_base;
>   	struct amdgpu_bo *shadow;
> +	struct dma_resv *resv;
>   	struct amdgpu_bo *bo;
>   	int r;
>   
> @@ -464,8 +469,27 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		spin_unlock(&vm->status_lock);
>   
>   		bo = bo_base->bo;
> +		resv = bo->tbo.base.resv;
>   		shadow = amdgpu_bo_shadowed(bo);
>   
> +		if (resv != vm->root.bo->tbo.base.resv) {
> +			if (!ticket) {
> +				/* We need to move the BO out of the evicted
> +				 * list to avoid an infinite loop. It will be
> +				 * moved back to evicted in the next
> +				 * amdgpu_vm_handle_moved.
> +				 */
> +				amdgpu_vm_bo_invalidated(bo_base);
> +				spin_lock(&vm->status_lock);
> +				continue;
> +			}
> +			if (dma_resv_locking_ctx(resv) != ticket) {
> +				pr_warn_ratelimited("Evicted user BO is not reserved in pid %d\n",
> +						    vm->task_info.pid);
> +				return -EINVAL;
> +			}

Ok that makes sense after your explanation.

> +		}
> +
>   		r = validate(param, bo);
>   		if (r)
>   			return r;
> @@ -475,7 +499,9 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   				return r;
>   		}
>   
> -		if (bo->tbo.type != ttm_bo_type_kernel) {
> +		if (resv != vm->root.bo->tbo.base.resv) {
> +			amdgpu_vm_bo_invalidated(bo_base);
> +		} if (bo->tbo.type != ttm_bo_type_kernel) {
>   			amdgpu_vm_bo_moved(bo_base);
>   		} else {
>   			vm->update_funcs->map_table(to_amdgpu_bo_vm(bo));
> @@ -1425,11 +1451,21 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   		}
>   
>   		r = amdgpu_vm_bo_update(adev, bo_va, clear);
> -		if (r)
> -			return r;
>   
>   		if (unlock)
>   			dma_resv_unlock(resv);
> +		if (r)
> +			return r;
> +
> +		/* Remember evicted DMABuf imports in compute VMs for later
> +		 * validation
> +		 */
> +		if (vm->is_compute_context && bo_va->base.bo &&
> +		    bo_va->base.bo->tbo.base.import_attach &&
> +		    (!bo_va->base.bo->tbo.resource ||
> +		     bo_va->base.bo->tbo.resource->mem_type == TTM_PL_SYSTEM))
> +			amdgpu_vm_bo_evicted(&bo_va->base);
> +

The change looks mostly good now. Just one thing which worries me is 
that when GFX and compute is mixed in the same VM this here might cause 
problems when we run into an error during command submission.

E.g. GFX validates the VM BOs, but then the IOCTL fails before calling 
amdgpu_vm_handle_moved().

In this case the DMA-buf wouldn't be validated any more.

Regards,
Christian.

>   		spin_lock(&vm->status_lock);
>   	}
>   	spin_unlock(&vm->status_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index b6cd565562ad..40254f564e6e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -434,9 +434,10 @@ int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
>   		      unsigned int num_fences);
>   bool amdgpu_vm_ready(struct amdgpu_vm *vm);
>   uint64_t amdgpu_vm_generation(struct amdgpu_device *adev, struct amdgpu_vm *vm);
> -int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> -			      int (*callback)(void *p, struct amdgpu_bo *bo),
> -			      void *param);
> +int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
> +		       struct ww_acquire_ctx *ticket,
> +		       int (*callback)(void *p, struct amdgpu_bo *bo),
> +		       void *param);
>   int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job, bool need_pipe_sync);
>   int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
>   			  struct amdgpu_vm *vm, bool immediate);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 2834fb351818..9f29bbdb9050 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -1509,9 +1509,9 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx, bool intr)
>   			goto unreserve_out;
>   		}
>   
> -		r = amdgpu_vm_validate_pt_bos(pdd->dev->adev,
> -					      drm_priv_to_vm(pdd->drm_priv),
> -					      svm_range_bo_validate, NULL);
> +		r = amdgpu_vm_validate(pdd->dev->adev,
> +				       drm_priv_to_vm(pdd->drm_priv), NULL,
> +				       svm_range_bo_validate, NULL);
>   		if (r) {
>   			pr_debug("failed %d validate pt bos\n", r);
>   			goto unreserve_out;
> @@ -1630,7 +1630,9 @@ static int svm_range_validate_and_map(struct mm_struct *mm,
>   		goto free_ctx;
>   	}
>   
> -	svm_range_reserve_bos(ctx, intr);
> +	r = svm_range_reserve_bos(ctx, intr);
> +	if (r)
> +		goto free_ctx;
>   
>   	p = container_of(prange->svms, struct kfd_process, svms);
>   	owner = kfd_svm_page_owner(p, find_first_bit(ctx->bitmap,

