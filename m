Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE78D0449
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2024 16:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42E10EEC0;
	Mon, 27 May 2024 14:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TAQSfdzP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD2910EEC0
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2024 14:42:00 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4202c1d19d5so79250335e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2024 07:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716820919; x=1717425719; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9dGePyw+31lhGeewGNiNtyLslOKAj6IjUkQnagADWWI=;
 b=TAQSfdzPEc4T2Xb0UKhY47Kkk9SXFu4rBZ3tRhnvyaKCJb3MuOHuFDvySnt12w7AaV
 1rnaT5Z0LtYB2v6BoqDWxFe+f/h6q+4Cwpd4zuMmTx0dDoFQ6bYeqb3EwqLXt+taMsWc
 Wgmda2+uC3yMko1Q9bKaBhrTNyW9hMoyGjvO+v1zUEUA8uKOI1k7F2dj4uOr/4ZV/yu6
 gwykHm7wuq/vvxvF/5DiqujdezYa3XL82+iGPz2qtY/uhh+HA/4tZvrV+da72SYRMkrL
 lRmLf1gFcMCj2K45HxC7eB+yLZmSjeKfJiWHbL0N3TPDGFFG7InEicPND7Z47U8HEZk/
 0Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716820919; x=1717425719;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9dGePyw+31lhGeewGNiNtyLslOKAj6IjUkQnagADWWI=;
 b=lDrm5Br/jEnAEJOjB/MZbn5hqjDhDA2zMnBXt1ECd/pQUEtUHv5yPczcXkosGsJFjF
 lUK39YF/evWjpJ/5M4SM05qSwho+k+BDNMNUTBGpDIAexCZ5FnFvO3M5O3lX9tEgZKmo
 X389l9A08RX13hzHSTY025rK9/vH+bvNFs2VoXxQ1PXbYC/6OoDjEzTnDPQ/zxtcIIet
 ffla4IlINUxTpu2BwIohvhQXZxCH/H9Xh8sJs/TN5d3Cc+S7A+tdv5dxCf9jwhsVT4r+
 09kZo5C1mq6hA7PrZdEDiadMaP7B4pYwP3DOpwWMqkZvTS1U+KDVQo+rArrfLcExeEGk
 tcew==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3R3vOintkMsc6YRWS13C1zfsTadZbnSiIxLVqDwtvszGkSnjM3mIT/H9Wqw37KJDCQ2abtlEVyArz71EKP+F9CKP8jkAloageBFqTVA==
X-Gm-Message-State: AOJu0Yw8aGyBxjp19iJbi0PIz/+x2Hhs/YNTvq37e/wq8CAtE4whqT2u
 7s4FlTA+W/i1Hb2RvbeAPoKviLJFkKQLEk+FQJ1gWAWL7X0d3snxCbnmuQ==
X-Google-Smtp-Source: AGHT+IEuQzrNOl8jz5PAk+0UNfnQ0X94er0zjfLAn+rv9+WnbJQHxhnXNL/ScfyT73uLAMq6Izo6ug==
X-Received: by 2002:a7b:cbd0:0:b0:420:1284:475 with SMTP id
 5b1f17b1804b1-421089cd413mr76804925e9.12.1716820918324; 
 Mon, 27 May 2024 07:41:58 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421010b9b02sm143172795e9.46.2024.05.27.07.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 07:41:57 -0700 (PDT)
Message-ID: <1fbac81d-393e-4643-8b1c-c3ccdf6ed0e2@gmail.com>
Date: Mon, 27 May 2024 16:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: drop MES 10.1 support v3
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20240523194818.1523936-1-alexander.deucher@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240523194818.1523936-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 23.05.24 um 21:48 schrieb Alex Deucher:
> It was an enablement vehicle for MES 11 and was never
> productized.  Remove it.
>
> v2: drop additional checks in the GFX10 code.
> v3: drop mes_api_def.h
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/Makefile           |    1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   20 -
>   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        |  281 +---
>   drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 1190 -----------------
>   drivers/gpu/drm/amd/amdgpu/mes_v10_1.h        |   29 -
>   drivers/gpu/drm/amd/amdgpu/nv.c               |    1 -
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c |    2 +-
>   drivers/gpu/drm/amd/include/mes_api_def.h     |  570 --------
>   8 files changed, 72 insertions(+), 2022 deletions(-)
>   delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
>   delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
>   delete mode 100644 drivers/gpu/drm/amd/include/mes_api_def.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 6e3d7f51616f..eddbb69a179f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -187,7 +187,6 @@ amdgpu-y += \
>   # add MES block
>   amdgpu-y += \
>   	amdgpu_mes.o \
> -	mes_v10_1.o \
>   	mes_v11_0.o \
>   	mes_v12_0.o
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index c5f23e1a1362..510916e28d37 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -94,7 +94,6 @@
>   #include "vcn_v4_0_5.h"
>   #include "jpeg_v4_0_5.h"
>   #include "amdgpu_vkms.h"
> -#include "mes_v10_1.h"
>   #include "mes_v11_0.h"
>   #include "mes_v12_0.h"
>   #include "smuio_v11_0.h"
> @@ -2319,25 +2318,6 @@ static int amdgpu_discovery_set_mm_ip_blocks(struct amdgpu_device *adev)
>   static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev)
>   {
>   	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 1, 10):
> -	case IP_VERSION(10, 1, 1):
> -	case IP_VERSION(10, 1, 2):
> -	case IP_VERSION(10, 1, 3):
> -	case IP_VERSION(10, 1, 4):
> -	case IP_VERSION(10, 3, 0):
> -	case IP_VERSION(10, 3, 1):
> -	case IP_VERSION(10, 3, 2):
> -	case IP_VERSION(10, 3, 3):
> -	case IP_VERSION(10, 3, 4):
> -	case IP_VERSION(10, 3, 5):
> -	case IP_VERSION(10, 3, 6):
> -		if (amdgpu_mes) {
> -			amdgpu_device_ip_block_add(adev, &mes_v10_1_ip_block);
> -			adev->enable_mes = true;
> -			if (amdgpu_mes_kiq)
> -				adev->enable_mes_kiq = true;
> -		}
> -		break;
>   	case IP_VERSION(11, 0, 0):
>   	case IP_VERSION(11, 0, 1):
>   	case IP_VERSION(11, 0, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 8ceb26a5575a..2a808029a47c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -3734,14 +3734,8 @@ static void gfx10_kiq_unmap_queues(struct amdgpu_ring *kiq_ring,
>   				   enum amdgpu_unmap_queues_action action,
>   				   u64 gpu_addr, u64 seq)
>   {
> -	struct amdgpu_device *adev = kiq_ring->adev;
>   	uint32_t eng_sel = ring->funcs->type == AMDGPU_RING_TYPE_GFX ? 4 : 0;
>   
> -	if (adev->enable_mes && !adev->gfx.kiq[0].ring.sched.ready) {
> -		amdgpu_mes_unmap_legacy_queue(adev, ring, action, gpu_addr, seq);
> -		return;
> -	}
> -
>   	amdgpu_ring_write(kiq_ring, PACKET3(PACKET3_UNMAP_QUEUES, 4));
>   	amdgpu_ring_write(kiq_ring, /* Q_sel: 0, vmid: 0, engine: 0, num_Q: 1 */
>   			  PACKET3_UNMAP_QUEUES_ACTION(action) |
> @@ -3999,33 +3993,18 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>   
>   	memset(&ib, 0, sizeof(ib));
>   
> -	if (ring->is_mes_queue) {
> -		uint32_t padding, offset;
> -
> -		offset = amdgpu_mes_ctx_get_offs(ring, AMDGPU_MES_CTX_IB_OFFS);
> -		padding = amdgpu_mes_ctx_get_offs(ring,
> -						  AMDGPU_MES_CTX_PADDING_OFFS);
> -
> -		ib.gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
> -		ib.ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
> -
> -		gpu_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, padding);
> -		cpu_ptr = amdgpu_mes_ctx_get_offs_cpu_addr(ring, padding);
> -		*cpu_ptr = cpu_to_le32(0xCAFEDEAD);
> -	} else {
> -		r = amdgpu_device_wb_get(adev, &index);
> -		if (r)
> -			return r;
> +	r = amdgpu_device_wb_get(adev, &index);
> +	if (r)
> +		return r;
>   
> -		gpu_addr = adev->wb.gpu_addr + (index * 4);
> -		adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
> -		cpu_ptr = &adev->wb.wb[index];
> +	gpu_addr = adev->wb.gpu_addr + (index * 4);
> +	adev->wb.wb[index] = cpu_to_le32(0xCAFEDEAD);
> +	cpu_ptr = &adev->wb.wb[index];
>   
> -		r = amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
> -		if (r) {
> -			DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
> -			goto err1;
> -		}
> +	r = amdgpu_ib_get(adev, NULL, 20, AMDGPU_IB_POOL_DIRECT, &ib);
> +	if (r) {
> +		DRM_ERROR("amdgpu: failed to get ib (%ld).\n", r);
> +		goto err1;
>   	}
>   
>   	ib.ptr[0] = PACKET3(PACKET3_WRITE_DATA, 3);
> @@ -4052,12 +4031,10 @@ static int gfx_v10_0_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>   	else
>   		r = -EINVAL;
>   err2:
> -	if (!ring->is_mes_queue)
> -		amdgpu_ib_free(adev, &ib, NULL);
> +	amdgpu_ib_free(adev, &ib, NULL);
>   	dma_fence_put(f);
>   err1:
> -	if (!ring->is_mes_queue)
> -		amdgpu_device_wb_free(adev, index);
> +	amdgpu_device_wb_free(adev, index);
>   	return r;
>   }
>   
> @@ -4832,18 +4809,16 @@ static int gfx_v10_0_sw_init(void *handle)
>   		}
>   	}
>   
> -	if (!adev->enable_mes_kiq) {
> -		r = amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
> -		if (r) {
> -			DRM_ERROR("Failed to init KIQ BOs!\n");
> -			return r;
> -		}
> -
> -		r = amdgpu_gfx_kiq_init_ring(adev, xcc_id);
> -		if (r)
> -			return r;
> +	r = amdgpu_gfx_kiq_init(adev, GFX10_MEC_HPD_SIZE, 0);
> +	if (r) {
> +		DRM_ERROR("Failed to init KIQ BOs!\n");
> +		return r;
>   	}
>   
> +	r = amdgpu_gfx_kiq_init_ring(adev, xcc_id);
> +	if (r)
> +		return r;
> +
>   	r = amdgpu_gfx_mqd_sw_init(adev, sizeof(struct v10_compute_mqd), 0);
>   	if (r)
>   		return r;
> @@ -4897,10 +4872,8 @@ static int gfx_v10_0_sw_fini(void *handle)
>   
>   	amdgpu_gfx_mqd_sw_fini(adev, 0);
>   
> -	if (!adev->enable_mes_kiq) {
> -		amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
> -		amdgpu_gfx_kiq_fini(adev, 0);
> -	}
> +	amdgpu_gfx_kiq_free_ring(&adev->gfx.kiq[0].ring);
> +	amdgpu_gfx_kiq_fini(adev, 0);
>   
>   	gfx_v10_0_pfp_fini(adev);
>   	gfx_v10_0_ce_fini(adev);
> @@ -7111,10 +7084,7 @@ static int gfx_v10_0_cp_resume(struct amdgpu_device *adev)
>   			return r;
>   	}
>   
> -	if (adev->enable_mes_kiq && adev->mes.kiq_hw_init)
> -		r = amdgpu_mes_kiq_hw_init(adev);
> -	else
> -		r = gfx_v10_0_kiq_resume(adev);
> +	r = gfx_v10_0_kiq_resume(adev);
>   	if (r)
>   		return r;
>   
> @@ -8435,45 +8405,17 @@ static u64 gfx_v10_0_ring_get_wptr_gfx(struct amdgpu_ring *ring)
>   static void gfx_v10_0_ring_set_wptr_gfx(struct amdgpu_ring *ring)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	uint32_t *wptr_saved;
> -	uint32_t *is_queue_unmap;
> -	uint64_t aggregated_db_index;
> -	uint32_t mqd_size = adev->mqds[AMDGPU_HW_IP_GFX].mqd_size;
> -	uint64_t wptr_tmp;
> -
> -	if (ring->is_mes_queue) {
> -		wptr_saved = (uint32_t *)(ring->mqd_ptr + mqd_size);
> -		is_queue_unmap = (uint32_t *)(ring->mqd_ptr + mqd_size +
> -					      sizeof(uint32_t));
> -		aggregated_db_index =
> -			amdgpu_mes_get_aggregated_doorbell_index(adev,
> -			AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
> -
> -		wptr_tmp = ring->wptr & ring->buf_mask;
> -		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
> -		*wptr_saved = wptr_tmp;
> -		/* assume doorbell always being used by mes mapped queue */
> -		if (*is_queue_unmap) {
> -			WDOORBELL64(aggregated_db_index, wptr_tmp);
> -			WDOORBELL64(ring->doorbell_index, wptr_tmp);
> -		} else {
> -			WDOORBELL64(ring->doorbell_index, wptr_tmp);
>   
> -			if (*is_queue_unmap)
> -				WDOORBELL64(aggregated_db_index, wptr_tmp);
> -		}
> +	if (ring->use_doorbell) {
> +		/* XXX check if swapping is necessary on BE */
> +		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> +			     ring->wptr);
> +		WDOORBELL64(ring->doorbell_index, ring->wptr);
>   	} else {
> -		if (ring->use_doorbell) {
> -			/* XXX check if swapping is necessary on BE */
> -			atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> -				     ring->wptr);
> -			WDOORBELL64(ring->doorbell_index, ring->wptr);
> -		} else {
> -			WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
> -				     lower_32_bits(ring->wptr));
> -			WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
> -				     upper_32_bits(ring->wptr));
> -		}
> +		WREG32_SOC15(GC, 0, mmCP_RB0_WPTR,
> +			     lower_32_bits(ring->wptr));
> +		WREG32_SOC15(GC, 0, mmCP_RB0_WPTR_HI,
> +			     upper_32_bits(ring->wptr));
>   	}
>   }
>   
> @@ -8498,42 +8440,13 @@ static u64 gfx_v10_0_ring_get_wptr_compute(struct amdgpu_ring *ring)
>   static void gfx_v10_0_ring_set_wptr_compute(struct amdgpu_ring *ring)
>   {
>   	struct amdgpu_device *adev = ring->adev;
> -	uint32_t *wptr_saved;
> -	uint32_t *is_queue_unmap;
> -	uint64_t aggregated_db_index;
> -	uint32_t mqd_size = adev->mqds[AMDGPU_HW_IP_COMPUTE].mqd_size;
> -	uint64_t wptr_tmp;
> -
> -	if (ring->is_mes_queue) {
> -		wptr_saved = (uint32_t *)(ring->mqd_ptr + mqd_size);
> -		is_queue_unmap = (uint32_t *)(ring->mqd_ptr + mqd_size +
> -					      sizeof(uint32_t));
> -		aggregated_db_index =
> -			amdgpu_mes_get_aggregated_doorbell_index(adev,
> -			AMDGPU_MES_PRIORITY_LEVEL_NORMAL);
> -
> -		wptr_tmp = ring->wptr & ring->buf_mask;
> -		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, wptr_tmp);
> -		*wptr_saved = wptr_tmp;
> -		/* assume doorbell always used by mes mapped queue */
> -		if (*is_queue_unmap) {
> -			WDOORBELL64(aggregated_db_index, wptr_tmp);
> -			WDOORBELL64(ring->doorbell_index, wptr_tmp);
> -		} else {
> -			WDOORBELL64(ring->doorbell_index, wptr_tmp);
>   
> -			if (*is_queue_unmap)
> -				WDOORBELL64(aggregated_db_index, wptr_tmp);
> -		}
> +	if (ring->use_doorbell) {
> +		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> +			     ring->wptr);
> +		WDOORBELL64(ring->doorbell_index, ring->wptr);
>   	} else {
> -		/* XXX check if swapping is necessary on BE */
> -		if (ring->use_doorbell) {
> -			atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> -				     ring->wptr);
> -			WDOORBELL64(ring->doorbell_index, ring->wptr);
> -		} else {
> -			BUG(); /* only DOORBELL method supported on gfx10 now */
> -		}
> +		BUG(); /* only DOORBELL method supported on gfx10 now */
>   	}
>   }
>   
> @@ -8592,10 +8505,6 @@ static void gfx_v10_0_ring_emit_ib_gfx(struct amdgpu_ring *ring,
>   				    (!amdgpu_sriov_vf(ring->adev) && flags & AMDGPU_IB_PREEMPTED) ? true : false);
>   	}
>   
> -	if (ring->is_mes_queue)
> -		/* inherit vmid from mqd */
> -		control |= 0x400000;
> -
>   	amdgpu_ring_write(ring, header);
>   	BUG_ON(ib->gpu_addr & 0x3); /* Dword align */
>   	amdgpu_ring_write(ring,
> @@ -8615,10 +8524,6 @@ static void gfx_v10_0_ring_emit_ib_compute(struct amdgpu_ring *ring,
>   	unsigned int vmid = AMDGPU_JOB_GET_VMID(job);
>   	u32 control = INDIRECT_BUFFER_VALID | ib->length_dw | (vmid << 24);
>   
> -	if (ring->is_mes_queue)
> -		/* inherit vmid from mqd */
> -		control |= 0x40000000;
> -
>   	/* Currently, there is a high possibility to get wave ID mismatch
>   	 * between ME and GDS, leading to a hw deadlock, because ME generates
>   	 * different wave IDs than the GDS expects. This situation happens
> @@ -8676,8 +8581,7 @@ static void gfx_v10_0_ring_emit_fence(struct amdgpu_ring *ring, u64 addr,
>   	amdgpu_ring_write(ring, upper_32_bits(addr));
>   	amdgpu_ring_write(ring, lower_32_bits(seq));
>   	amdgpu_ring_write(ring, upper_32_bits(seq));
> -	amdgpu_ring_write(ring, ring->is_mes_queue ?
> -			 (ring->hw_queue_id | AMDGPU_FENCE_MES_QUEUE_FLAG) : 0);
> +	amdgpu_ring_write(ring, 0);
>   }
>   
>   static void gfx_v10_0_ring_emit_pipeline_sync(struct amdgpu_ring *ring)
> @@ -8705,10 +8609,7 @@ static void gfx_v10_0_ring_invalidate_tlbs(struct amdgpu_ring *ring,
>   static void gfx_v10_0_ring_emit_vm_flush(struct amdgpu_ring *ring,
>   					 unsigned int vmid, uint64_t pd_addr)
>   {
> -	if (ring->is_mes_queue)
> -		gfx_v10_0_ring_invalidate_tlbs(ring, 0, 0, false, 0);
> -	else
> -		amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
> +	amdgpu_gmc_emit_flush_gpu_tlb(ring, vmid, pd_addr);
>   
>   	/* compute doesn't have PFP */
>   	if (ring->funcs->type == AMDGPU_RING_TYPE_GFX) {
> @@ -8859,19 +8760,9 @@ static void gfx_v10_0_ring_emit_ce_meta(struct amdgpu_ring *ring, bool resume)
>   
>   	cnt = (sizeof(ce_payload) >> 2) + 4 - 2;
>   
> -	if (ring->is_mes_queue) {
> -		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
> -				  gfx[0].gfx_meta_data) +
> -			offsetof(struct v10_gfx_meta_data, ce_payload);
> -		ce_payload_gpu_addr =
> -			amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
> -		ce_payload_cpu_addr =
> -			amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
> -	} else {
> -		offset = offsetof(struct v10_gfx_meta_data, ce_payload);
> -		ce_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
> -		ce_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
> -	}
> +	offset = offsetof(struct v10_gfx_meta_data, ce_payload);
> +	ce_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
> +	ce_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
>   
>   	amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, cnt));
>   	amdgpu_ring_write(ring, (WRITE_DATA_ENGINE_SEL(2) |
> @@ -8897,28 +8788,13 @@ static void gfx_v10_0_ring_emit_de_meta(struct amdgpu_ring *ring, bool resume)
>   	void *de_payload_cpu_addr;
>   	int cnt;
>   
> -	if (ring->is_mes_queue) {
> -		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
> -				  gfx[0].gfx_meta_data) +
> -			offsetof(struct v10_gfx_meta_data, de_payload);
> -		de_payload_gpu_addr =
> -			amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
> -		de_payload_cpu_addr =
> -			amdgpu_mes_ctx_get_offs_cpu_addr(ring, offset);
> -
> -		offset = offsetof(struct amdgpu_mes_ctx_meta_data,
> -				  gfx[0].gds_backup) +
> -			offsetof(struct v10_gfx_meta_data, de_payload);
> -		gds_addr = amdgpu_mes_ctx_get_offs_gpu_addr(ring, offset);
> -	} else {
> -		offset = offsetof(struct v10_gfx_meta_data, de_payload);
> -		de_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
> -		de_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
> +	offset = offsetof(struct v10_gfx_meta_data, de_payload);
> +	de_payload_gpu_addr = amdgpu_csa_vaddr(ring->adev) + offset;
> +	de_payload_cpu_addr = adev->virt.csa_cpu_addr + offset;
>   
> -		gds_addr = ALIGN(amdgpu_csa_vaddr(ring->adev) +
> -				 AMDGPU_CSA_SIZE - adev->gds.gds_size,
> -				 PAGE_SIZE);
> -	}
> +	gds_addr = ALIGN(amdgpu_csa_vaddr(ring->adev) +
> +			 AMDGPU_CSA_SIZE - adev->gds.gds_size,
> +			 PAGE_SIZE);
>   
>   	de_payload.gds_backup_addrlo = lower_32_bits(gds_addr);
>   	de_payload.gds_backup_addrhi = upper_32_bits(gds_addr);
> @@ -9170,49 +9046,34 @@ static int gfx_v10_0_eop_irq(struct amdgpu_device *adev,
>   	int i;
>   	u8 me_id, pipe_id, queue_id;
>   	struct amdgpu_ring *ring;
> -	uint32_t mes_queue_id = entry->src_data[0];
>   
>   	DRM_DEBUG("IH: CP EOP\n");
>   
> -	if (adev->enable_mes && (mes_queue_id & AMDGPU_FENCE_MES_QUEUE_FLAG)) {
> -		struct amdgpu_mes_queue *queue;
> -
> -		mes_queue_id &= AMDGPU_FENCE_MES_QUEUE_ID_MASK;
> -
> -		spin_lock(&adev->mes.queue_id_lock);
> -		queue = idr_find(&adev->mes.queue_id_idr, mes_queue_id);
> -		if (queue) {
> -			DRM_DEBUG("process mes queue id = %d\n", mes_queue_id);
> -			amdgpu_fence_process(queue->ring);
> -		}
> -		spin_unlock(&adev->mes.queue_id_lock);
> -	} else {
> -		me_id = (entry->ring_id & 0x0c) >> 2;
> -		pipe_id = (entry->ring_id & 0x03) >> 0;
> -		queue_id = (entry->ring_id & 0x70) >> 4;
> +	me_id = (entry->ring_id & 0x0c) >> 2;
> +	pipe_id = (entry->ring_id & 0x03) >> 0;
> +	queue_id = (entry->ring_id & 0x70) >> 4;
>   
> -		switch (me_id) {
> -		case 0:
> -			if (pipe_id == 0)
> -				amdgpu_fence_process(&adev->gfx.gfx_ring[0]);
> -			else
> -				amdgpu_fence_process(&adev->gfx.gfx_ring[1]);
> -			break;
> -		case 1:
> -		case 2:
> -			for (i = 0; i < adev->gfx.num_compute_rings; i++) {
> -				ring = &adev->gfx.compute_ring[i];
> -				/* Per-queue interrupt is supported for MEC starting from VI.
> -				 * The interrupt can only be enabled/disabled per pipe instead
> -				 * of per queue.
> -				 */
> -				if ((ring->me == me_id) &&
> -				    (ring->pipe == pipe_id) &&
> -				    (ring->queue == queue_id))
> -					amdgpu_fence_process(ring);
> -			}
> -			break;
> +	switch (me_id) {
> +	case 0:
> +		if (pipe_id == 0)
> +			amdgpu_fence_process(&adev->gfx.gfx_ring[0]);
> +		else
> +			amdgpu_fence_process(&adev->gfx.gfx_ring[1]);
> +		break;
> +	case 1:
> +	case 2:
> +		for (i = 0; i < adev->gfx.num_compute_rings; i++) {
> +			ring = &adev->gfx.compute_ring[i];
> +			/* Per-queue interrupt is supported for MEC starting from VI.
> +			 * The interrupt can only be enabled/disabled per pipe instead
> +			 * of per queue.
> +			 */
> +			if ((ring->me == me_id) &&
> +			    (ring->pipe == pipe_id) &&
> +			    (ring->queue == queue_id))
> +				amdgpu_fence_process(ring);
>   		}
> +		break;
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> deleted file mode 100644
> index 013aa690299e..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> +++ /dev/null
> @@ -1,1190 +0,0 @@
> -/*
> - * Copyright 2019 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <linux/firmware.h>
> -#include <linux/module.h>
> -#include "amdgpu.h"
> -#include "amdgpu_reset.h"
> -#include "soc15_common.h"
> -#include "nv.h"
> -#include "gc/gc_10_1_0_offset.h"
> -#include "gc/gc_10_1_0_sh_mask.h"
> -#include "gc/gc_10_1_0_default.h"
> -#include "v10_structs.h"
> -#include "mes_api_def.h"
> -
> -#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid               0x2820
> -#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid_BASE_IDX      1
> -#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid		0x4ca1
> -#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid_BASE_IDX	1
> -
> -MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
> -MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
> -MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
> -
> -static int mes_v10_1_hw_fini(void *handle);
> -static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev);
> -
> -#define MES_EOP_SIZE   2048
> -
> -static void mes_v10_1_ring_set_wptr(struct amdgpu_ring *ring)
> -{
> -	struct amdgpu_device *adev = ring->adev;
> -
> -	if (ring->use_doorbell) {
> -		atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> -			     ring->wptr);
> -		WDOORBELL64(ring->doorbell_index, ring->wptr);
> -	} else {
> -		BUG();
> -	}
> -}
> -
> -static u64 mes_v10_1_ring_get_rptr(struct amdgpu_ring *ring)
> -{
> -	return *ring->rptr_cpu_addr;
> -}
> -
> -static u64 mes_v10_1_ring_get_wptr(struct amdgpu_ring *ring)
> -{
> -	u64 wptr;
> -
> -	if (ring->use_doorbell)
> -		wptr = atomic64_read((atomic64_t *)ring->wptr_cpu_addr);
> -	else
> -		BUG();
> -	return wptr;
> -}
> -
> -static const struct amdgpu_ring_funcs mes_v10_1_ring_funcs = {
> -	.type = AMDGPU_RING_TYPE_MES,
> -	.align_mask = 1,
> -	.nop = 0,
> -	.support_64bit_ptrs = true,
> -	.get_rptr = mes_v10_1_ring_get_rptr,
> -	.get_wptr = mes_v10_1_ring_get_wptr,
> -	.set_wptr = mes_v10_1_ring_set_wptr,
> -	.insert_nop = amdgpu_ring_insert_nop,
> -};
> -
> -static int mes_v10_1_submit_pkt_and_poll_completion(struct amdgpu_mes *mes,
> -						    void *pkt, int size,
> -						    int api_status_off)
> -{
> -	int ndw = size / 4;
> -	signed long r;
> -	union MESAPI__ADD_QUEUE *x_pkt = pkt;
> -	struct MES_API_STATUS *api_status;
> -	struct amdgpu_device *adev = mes->adev;
> -	struct amdgpu_ring *ring = &mes->ring;
> -	unsigned long flags;
> -
> -	BUG_ON(size % 4 != 0);
> -
> -	spin_lock_irqsave(&mes->ring_lock, flags);
> -	if (amdgpu_ring_alloc(ring, ndw)) {
> -		spin_unlock_irqrestore(&mes->ring_lock, flags);
> -		return -ENOMEM;
> -	}
> -
> -	api_status = (struct MES_API_STATUS *)((char *)pkt + api_status_off);
> -	api_status->api_completion_fence_addr = mes->ring.fence_drv.gpu_addr;
> -	api_status->api_completion_fence_value = ++mes->ring.fence_drv.sync_seq;
> -
> -	amdgpu_ring_write_multiple(ring, pkt, ndw);
> -	amdgpu_ring_commit(ring);
> -	spin_unlock_irqrestore(&mes->ring_lock, flags);
> -
> -	DRM_DEBUG("MES msg=%d was emitted\n", x_pkt->header.opcode);
> -
> -	r = amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
> -				      adev->usec_timeout);
> -	if (r < 1) {
> -		DRM_ERROR("MES failed to response msg=%d\n",
> -			  x_pkt->header.opcode);
> -
> -		while (halt_if_hws_hang)
> -			schedule();
> -
> -		return -ETIMEDOUT;
> -	}
> -
> -	return 0;
> -}
> -
> -static int convert_to_mes_queue_type(int queue_type)
> -{
> -	if (queue_type == AMDGPU_RING_TYPE_GFX)
> -		return MES_QUEUE_TYPE_GFX;
> -	else if (queue_type == AMDGPU_RING_TYPE_COMPUTE)
> -		return MES_QUEUE_TYPE_COMPUTE;
> -	else if (queue_type == AMDGPU_RING_TYPE_SDMA)
> -		return MES_QUEUE_TYPE_SDMA;
> -	else
> -		BUG();
> -	return -1;
> -}
> -
> -static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
> -				  struct mes_add_queue_input *input)
> -{
> -	struct amdgpu_device *adev = mes->adev;
> -	union MESAPI__ADD_QUEUE mes_add_queue_pkt;
> -	struct amdgpu_vmhub *hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
> -	uint32_t vm_cntx_cntl = hub->vm_cntx_cntl;
> -
> -	memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
> -
> -	mes_add_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
> -	mes_add_queue_pkt.header.opcode = MES_SCH_API_ADD_QUEUE;
> -	mes_add_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
> -
> -	mes_add_queue_pkt.process_id = input->process_id;
> -	mes_add_queue_pkt.page_table_base_addr = input->page_table_base_addr;
> -	mes_add_queue_pkt.process_va_start = input->process_va_start;
> -	mes_add_queue_pkt.process_va_end = input->process_va_end;
> -	mes_add_queue_pkt.process_quantum = input->process_quantum;
> -	mes_add_queue_pkt.process_context_addr = input->process_context_addr;
> -	mes_add_queue_pkt.gang_quantum = input->gang_quantum;
> -	mes_add_queue_pkt.gang_context_addr = input->gang_context_addr;
> -	mes_add_queue_pkt.inprocess_gang_priority =
> -		input->inprocess_gang_priority;
> -	mes_add_queue_pkt.gang_global_priority_level =
> -		input->gang_global_priority_level;
> -	mes_add_queue_pkt.doorbell_offset = input->doorbell_offset;
> -	mes_add_queue_pkt.mqd_addr = input->mqd_addr;
> -	mes_add_queue_pkt.wptr_addr = input->wptr_addr;
> -	mes_add_queue_pkt.queue_type =
> -		convert_to_mes_queue_type(input->queue_type);
> -	mes_add_queue_pkt.paging = input->paging;
> -	mes_add_queue_pkt.vm_context_cntl = vm_cntx_cntl;
> -	mes_add_queue_pkt.gws_base = input->gws_base;
> -	mes_add_queue_pkt.gws_size = input->gws_size;
> -	mes_add_queue_pkt.trap_handler_addr = input->tba_addr;
> -
> -	return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -			&mes_add_queue_pkt, sizeof(mes_add_queue_pkt),
> -			offsetof(union MESAPI__ADD_QUEUE, api_status));
> -}
> -
> -static int mes_v10_1_remove_hw_queue(struct amdgpu_mes *mes,
> -				     struct mes_remove_queue_input *input)
> -{
> -	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
> -
> -	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
> -
> -	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
> -	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
> -	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
> -
> -	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
> -	mes_remove_queue_pkt.gang_context_addr = input->gang_context_addr;
> -
> -	return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
> -			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
> -}
> -
> -static int mes_v10_1_unmap_legacy_queue(struct amdgpu_mes *mes,
> -				 struct mes_unmap_legacy_queue_input *input)
> -{
> -	union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
> -
> -	memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
> -
> -	mes_remove_queue_pkt.header.type = MES_API_TYPE_SCHEDULER;
> -	mes_remove_queue_pkt.header.opcode = MES_SCH_API_REMOVE_QUEUE;
> -	mes_remove_queue_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
> -
> -	mes_remove_queue_pkt.doorbell_offset = input->doorbell_offset;
> -	mes_remove_queue_pkt.gang_context_addr = 0;
> -
> -	mes_remove_queue_pkt.pipe_id = input->pipe_id;
> -	mes_remove_queue_pkt.queue_id = input->queue_id;
> -
> -	if (input->action == PREEMPT_QUEUES_NO_UNMAP) {
> -		mes_remove_queue_pkt.preempt_legacy_gfx_queue = 1;
> -		mes_remove_queue_pkt.tf_addr = input->trail_fence_addr;
> -		mes_remove_queue_pkt.tf_data =
> -			lower_32_bits(input->trail_fence_data);
> -	} else {
> -		if (input->queue_type == AMDGPU_RING_TYPE_GFX)
> -			mes_remove_queue_pkt.unmap_legacy_gfx_queue = 1;
> -		else
> -			mes_remove_queue_pkt.unmap_kiq_utility_queue = 1;
> -	}
> -
> -	return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -			&mes_remove_queue_pkt, sizeof(mes_remove_queue_pkt),
> -			offsetof(union MESAPI__REMOVE_QUEUE, api_status));
> -}
> -
> -static int mes_v10_1_suspend_gang(struct amdgpu_mes *mes,
> -				  struct mes_suspend_gang_input *input)
> -{
> -	return 0;
> -}
> -
> -static int mes_v10_1_resume_gang(struct amdgpu_mes *mes,
> -				 struct mes_resume_gang_input *input)
> -{
> -	return 0;
> -}
> -
> -static int mes_v10_1_query_sched_status(struct amdgpu_mes *mes)
> -{
> -	union MESAPI__QUERY_MES_STATUS mes_status_pkt;
> -
> -	memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
> -
> -	mes_status_pkt.header.type = MES_API_TYPE_SCHEDULER;
> -	mes_status_pkt.header.opcode = MES_SCH_API_QUERY_SCHEDULER_STATUS;
> -	mes_status_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
> -
> -	return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -			&mes_status_pkt, sizeof(mes_status_pkt),
> -			offsetof(union MESAPI__QUERY_MES_STATUS, api_status));
> -}
> -
> -static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
> -{
> -	int i;
> -	struct amdgpu_device *adev = mes->adev;
> -	union MESAPI_SET_HW_RESOURCES mes_set_hw_res_pkt;
> -
> -	memset(&mes_set_hw_res_pkt, 0, sizeof(mes_set_hw_res_pkt));
> -
> -	mes_set_hw_res_pkt.header.type = MES_API_TYPE_SCHEDULER;
> -	mes_set_hw_res_pkt.header.opcode = MES_SCH_API_SET_HW_RSRC;
> -	mes_set_hw_res_pkt.header.dwsize = API_FRAME_SIZE_IN_DWORDS;
> -
> -	mes_set_hw_res_pkt.vmid_mask_mmhub = mes->vmid_mask_mmhub;
> -	mes_set_hw_res_pkt.vmid_mask_gfxhub = mes->vmid_mask_gfxhub;
> -	mes_set_hw_res_pkt.gds_size = adev->gds.gds_size;
> -	mes_set_hw_res_pkt.paging_vmid = 0;
> -	mes_set_hw_res_pkt.g_sch_ctx_gpu_mc_ptr = mes->sch_ctx_gpu_addr;
> -	mes_set_hw_res_pkt.query_status_fence_gpu_mc_ptr =
> -		mes->query_status_fence_gpu_addr;
> -
> -	for (i = 0; i < MAX_COMPUTE_PIPES; i++)
> -		mes_set_hw_res_pkt.compute_hqd_mask[i] =
> -			mes->compute_hqd_mask[i];
> -
> -	for (i = 0; i < MAX_GFX_PIPES; i++)
> -		mes_set_hw_res_pkt.gfx_hqd_mask[i] = mes->gfx_hqd_mask[i];
> -
> -	for (i = 0; i < MAX_SDMA_PIPES; i++)
> -		mes_set_hw_res_pkt.sdma_hqd_mask[i] = mes->sdma_hqd_mask[i];
> -
> -	for (i = 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
> -		mes_set_hw_res_pkt.aggregated_doorbells[i] =
> -			mes->aggregated_doorbells[i];
> -
> -	for (i = 0; i < 5; i++) {
> -		mes_set_hw_res_pkt.gc_base[i] = adev->reg_offset[GC_HWIP][0][i];
> -		mes_set_hw_res_pkt.mmhub_base[i] =
> -			adev->reg_offset[MMHUB_HWIP][0][i];
> -		mes_set_hw_res_pkt.osssys_base[i] =
> -			adev->reg_offset[OSSSYS_HWIP][0][i];
> -	}
> -
> -	mes_set_hw_res_pkt.disable_reset = 1;
> -	mes_set_hw_res_pkt.disable_mes_log = 1;
> -	mes_set_hw_res_pkt.use_different_vmid_compute = 1;
> -
> -	return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -			&mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt),
> -			offsetof(union MESAPI_SET_HW_RESOURCES, api_status));
> -}
> -
> -static void mes_v10_1_init_aggregated_doorbell(struct amdgpu_mes *mes)
> -{
> -	struct amdgpu_device *adev = mes->adev;
> -	uint32_t data;
> -
> -	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1);
> -	data &= ~(CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET_MASK |
> -		  CP_MES_DOORBELL_CONTROL1__DOORBELL_EN_MASK |
> -		  CP_MES_DOORBELL_CONTROL1__DOORBELL_HIT_MASK);
> -	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_LOW] <<
> -		CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET__SHIFT;
> -	data |= 1 << CP_MES_DOORBELL_CONTROL1__DOORBELL_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1, data);
> -
> -	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2);
> -	data &= ~(CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET_MASK |
> -		  CP_MES_DOORBELL_CONTROL2__DOORBELL_EN_MASK |
> -		  CP_MES_DOORBELL_CONTROL2__DOORBELL_HIT_MASK);
> -	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_NORMAL] <<
> -		CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET__SHIFT;
> -	data |= 1 << CP_MES_DOORBELL_CONTROL2__DOORBELL_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2, data);
> -
> -	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3);
> -	data &= ~(CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET_MASK |
> -		  CP_MES_DOORBELL_CONTROL3__DOORBELL_EN_MASK |
> -		  CP_MES_DOORBELL_CONTROL3__DOORBELL_HIT_MASK);
> -	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_MEDIUM] <<
> -		CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET__SHIFT;
> -	data |= 1 << CP_MES_DOORBELL_CONTROL3__DOORBELL_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3, data);
> -
> -	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4);
> -	data &= ~(CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET_MASK |
> -		  CP_MES_DOORBELL_CONTROL4__DOORBELL_EN_MASK |
> -		  CP_MES_DOORBELL_CONTROL4__DOORBELL_HIT_MASK);
> -	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_HIGH] <<
> -		CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET__SHIFT;
> -	data |= 1 << CP_MES_DOORBELL_CONTROL4__DOORBELL_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4, data);
> -
> -	data = RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5);
> -	data &= ~(CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET_MASK |
> -		  CP_MES_DOORBELL_CONTROL5__DOORBELL_EN_MASK |
> -		  CP_MES_DOORBELL_CONTROL5__DOORBELL_HIT_MASK);
> -	data |= mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_REALTIME] <<
> -		CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET__SHIFT;
> -	data |= 1 << CP_MES_DOORBELL_CONTROL5__DOORBELL_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5, data);
> -
> -	data = 1 << CP_HQD_GFX_CONTROL__DB_UPDATED_MSG_EN__SHIFT;
> -	WREG32_SOC15(GC, 0, mmCP_HQD_GFX_CONTROL, data);
> -}
> -
> -static const struct amdgpu_mes_funcs mes_v10_1_funcs = {
> -	.add_hw_queue = mes_v10_1_add_hw_queue,
> -	.remove_hw_queue = mes_v10_1_remove_hw_queue,
> -	.unmap_legacy_queue = mes_v10_1_unmap_legacy_queue,
> -	.suspend_gang = mes_v10_1_suspend_gang,
> -	.resume_gang = mes_v10_1_resume_gang,
> -};
> -
> -static int mes_v10_1_allocate_ucode_buffer(struct amdgpu_device *adev,
> -					   enum admgpu_mes_pipe pipe)
> -{
> -	int r;
> -	const struct mes_firmware_header_v1_0 *mes_hdr;
> -	const __le32 *fw_data;
> -	unsigned fw_size;
> -
> -	mes_hdr = (const struct mes_firmware_header_v1_0 *)
> -		adev->mes.fw[pipe]->data;
> -
> -	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
> -		   le32_to_cpu(mes_hdr->mes_ucode_offset_bytes));
> -	fw_size = le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
> -
> -	r = amdgpu_bo_create_reserved(adev, fw_size,
> -				      PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> -				      &adev->mes.ucode_fw_obj[pipe],
> -				      &adev->mes.ucode_fw_gpu_addr[pipe],
> -				      (void **)&adev->mes.ucode_fw_ptr[pipe]);
> -	if (r) {
> -		dev_err(adev->dev, "(%d) failed to create mes fw bo\n", r);
> -		return r;
> -	}
> -
> -	memcpy(adev->mes.ucode_fw_ptr[pipe], fw_data, fw_size);
> -
> -	amdgpu_bo_kunmap(adev->mes.ucode_fw_obj[pipe]);
> -	amdgpu_bo_unreserve(adev->mes.ucode_fw_obj[pipe]);
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_allocate_ucode_data_buffer(struct amdgpu_device *adev,
> -						enum admgpu_mes_pipe pipe)
> -{
> -	int r;
> -	const struct mes_firmware_header_v1_0 *mes_hdr;
> -	const __le32 *fw_data;
> -	unsigned fw_size;
> -
> -	mes_hdr = (const struct mes_firmware_header_v1_0 *)
> -		adev->mes.fw[pipe]->data;
> -
> -	fw_data = (const __le32 *)(adev->mes.fw[pipe]->data +
> -		   le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes));
> -	fw_size = le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
> -
> -	r = amdgpu_bo_create_reserved(adev, fw_size,
> -				      64 * 1024, AMDGPU_GEM_DOMAIN_GTT,
> -				      &adev->mes.data_fw_obj[pipe],
> -				      &adev->mes.data_fw_gpu_addr[pipe],
> -				      (void **)&adev->mes.data_fw_ptr[pipe]);
> -	if (r) {
> -		dev_err(adev->dev, "(%d) failed to create mes data fw bo\n", r);
> -		return r;
> -	}
> -
> -	memcpy(adev->mes.data_fw_ptr[pipe], fw_data, fw_size);
> -
> -	amdgpu_bo_kunmap(adev->mes.data_fw_obj[pipe]);
> -	amdgpu_bo_unreserve(adev->mes.data_fw_obj[pipe]);
> -
> -	return 0;
> -}
> -
> -static void mes_v10_1_free_ucode_buffers(struct amdgpu_device *adev,
> -					 enum admgpu_mes_pipe pipe)
> -{
> -	amdgpu_bo_free_kernel(&adev->mes.data_fw_obj[pipe],
> -			      &adev->mes.data_fw_gpu_addr[pipe],
> -			      (void **)&adev->mes.data_fw_ptr[pipe]);
> -
> -	amdgpu_bo_free_kernel(&adev->mes.ucode_fw_obj[pipe],
> -			      &adev->mes.ucode_fw_gpu_addr[pipe],
> -			      (void **)&adev->mes.ucode_fw_ptr[pipe]);
> -}
> -
> -static void mes_v10_1_enable(struct amdgpu_device *adev, bool enable)
> -{
> -	uint32_t pipe, data = 0;
> -
> -	if (enable) {
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL,
> -			     MES_PIPE1_RESET, adev->enable_mes_kiq ? 1 : 0);
> -		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -
> -		mutex_lock(&adev->srbm_mutex);
> -		for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -			if (!adev->enable_mes_kiq &&
> -			    pipe == AMDGPU_MES_KIQ_PIPE)
> -				continue;
> -
> -			nv_grbm_select(adev, 3, pipe, 0, 0);
> -			WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
> -			     (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
> -		}
> -		nv_grbm_select(adev, 0, 0, 0, 0);
> -		mutex_unlock(&adev->srbm_mutex);
> -
> -		/* clear BYPASS_UNCACHED to avoid hangs after interrupt. */
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL);
> -		data = REG_SET_FIELD(data, CP_MES_DC_OP_CNTL,
> -				     BYPASS_UNCACHED, 0);
> -		WREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL, data);
> -
> -		/* unhalt MES and activate pipe0 */
> -		data = REG_SET_FIELD(0, CP_MES_CNTL, MES_PIPE0_ACTIVE, 1);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE,
> -				     adev->enable_mes_kiq ? 1 : 0);
> -		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -		udelay(100);
> -	} else {
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_ACTIVE, 0);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIVE, 0);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL,
> -				     MES_INVALIDATE_ICACHE, 1);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET, 1);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_RESET,
> -				     adev->enable_mes_kiq ? 1 : 0);
> -		data = REG_SET_FIELD(data, CP_MES_CNTL, MES_HALT, 1);
> -		WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -	}
> -}
> -
> -/* This function is for backdoor MES firmware */
> -static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
> -				    enum admgpu_mes_pipe pipe)
> -{
> -	int r;
> -	uint32_t data;
> -
> -	mes_v10_1_enable(adev, false);
> -
> -	if (!adev->mes.fw[pipe])
> -		return -EINVAL;
> -
> -	r = mes_v10_1_allocate_ucode_buffer(adev, pipe);
> -	if (r)
> -		return r;
> -
> -	r = mes_v10_1_allocate_ucode_data_buffer(adev, pipe);
> -	if (r) {
> -		mes_v10_1_free_ucode_buffers(adev, pipe);
> -		return r;
> -	}
> -
> -	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_CNTL, 0);
> -
> -	mutex_lock(&adev->srbm_mutex);
> -	/* me=3, pipe=0, queue=0 */
> -	nv_grbm_select(adev, 3, pipe, 0, 0);
> -
> -	/* set ucode start address */
> -	WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
> -		     (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
> -
> -	/* set ucode fimrware address */
> -	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_LO,
> -		     lower_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
> -	WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_HI,
> -		     upper_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
> -
> -	/* set ucode instruction cache boundary to 2M-1 */
> -	WREG32_SOC15(GC, 0, mmCP_MES_MIBOUND_LO, 0x1FFFFF);
> -
> -	/* set ucode data firmware address */
> -	WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_LO,
> -		     lower_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
> -	WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_HI,
> -		     upper_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
> -
> -	/* Set 0x3FFFF (256K-1) to CP_MES_MDBOUND_LO */
> -	WREG32_SOC15(GC, 0, mmCP_MES_MDBOUND_LO, 0x3FFFF);
> -
> -	/* invalidate ICACHE */
> -	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 3, 0):
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
> -		break;
> -	default:
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
> -		break;
> -	}
> -	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
> -	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE, 1);
> -	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 3, 0):
> -		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
> -		break;
> -	default:
> -		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
> -		break;
> -	}
> -
> -	/* prime the ICACHE. */
> -	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 3, 0):
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid);
> -		break;
> -	default:
> -		data = RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
> -		break;
> -	}
> -	data = REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
> -	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 3, 0):
> -		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, data);
> -		break;
> -	default:
> -		WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
> -		break;
> -	}
> -
> -	nv_grbm_select(adev, 0, 0, 0, 0);
> -	mutex_unlock(&adev->srbm_mutex);
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev,
> -				      enum admgpu_mes_pipe pipe)
> -{
> -	int r;
> -	u32 *eop;
> -
> -	r = amdgpu_bo_create_reserved(adev, MES_EOP_SIZE, PAGE_SIZE,
> -			      AMDGPU_GEM_DOMAIN_GTT,
> -			      &adev->mes.eop_gpu_obj[pipe],
> -			      &adev->mes.eop_gpu_addr[pipe],
> -			      (void **)&eop);
> -	if (r) {
> -		dev_warn(adev->dev, "(%d) create EOP bo failed\n", r);
> -		return r;
> -	}
> -
> -	memset(eop, 0, adev->mes.eop_gpu_obj[pipe]->tbo.base.size);
> -
> -	amdgpu_bo_kunmap(adev->mes.eop_gpu_obj[pipe]);
> -	amdgpu_bo_unreserve(adev->mes.eop_gpu_obj[pipe]);
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_mqd_init(struct amdgpu_ring *ring)
> -{
> -	struct v10_compute_mqd *mqd = ring->mqd_ptr;
> -	uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
> -	uint32_t tmp;
> -
> -	memset(mqd, 0, sizeof(*mqd));
> -
> -	mqd->header = 0xC0310800;
> -	mqd->compute_pipelinestat_enable = 0x00000001;
> -	mqd->compute_static_thread_mgmt_se0 = 0xffffffff;
> -	mqd->compute_static_thread_mgmt_se1 = 0xffffffff;
> -	mqd->compute_static_thread_mgmt_se2 = 0xffffffff;
> -	mqd->compute_static_thread_mgmt_se3 = 0xffffffff;
> -	mqd->compute_misc_reserved = 0x00000003;
> -
> -	eop_base_addr = ring->eop_gpu_addr >> 8;
> -
> -	/* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
> -	tmp = mmCP_HQD_EOP_CONTROL_DEFAULT;
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
> -			(order_base_2(MES_EOP_SIZE / 4) - 1));
> -
> -	mqd->cp_hqd_eop_base_addr_lo = lower_32_bits(eop_base_addr);
> -	mqd->cp_hqd_eop_base_addr_hi = upper_32_bits(eop_base_addr);
> -	mqd->cp_hqd_eop_control = tmp;
> -
> -	/* disable the queue if it's active */
> -	ring->wptr = 0;
> -	mqd->cp_hqd_pq_rptr = 0;
> -	mqd->cp_hqd_pq_wptr_lo = 0;
> -	mqd->cp_hqd_pq_wptr_hi = 0;
> -
> -	/* set the pointer to the MQD */
> -	mqd->cp_mqd_base_addr_lo = ring->mqd_gpu_addr & 0xfffffffc;
> -	mqd->cp_mqd_base_addr_hi = upper_32_bits(ring->mqd_gpu_addr);
> -
> -	/* set MQD vmid to 0 */
> -	tmp = mmCP_MQD_CONTROL_DEFAULT;
> -	tmp = REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
> -	mqd->cp_mqd_control = tmp;
> -
> -	/* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
> -	hqd_gpu_addr = ring->gpu_addr >> 8;
> -	mqd->cp_hqd_pq_base_lo = lower_32_bits(hqd_gpu_addr);
> -	mqd->cp_hqd_pq_base_hi = upper_32_bits(hqd_gpu_addr);
> -
> -	/* set the wb address whether it's enabled or not */
> -	wb_gpu_addr = ring->rptr_gpu_addr;
> -	mqd->cp_hqd_pq_rptr_report_addr_lo = wb_gpu_addr & 0xfffffffc;
> -	mqd->cp_hqd_pq_rptr_report_addr_hi =
> -		upper_32_bits(wb_gpu_addr) & 0xffff;
> -
> -	/* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MASK=1 */
> -	wb_gpu_addr = ring->wptr_gpu_addr;
> -	mqd->cp_hqd_pq_wptr_poll_addr_lo = wb_gpu_addr & 0xfffffff8;
> -	mqd->cp_hqd_pq_wptr_poll_addr_hi = upper_32_bits(wb_gpu_addr) & 0xffff;
> -
> -	/* set up the HQD, this is similar to CP_RB0_CNTL */
> -	tmp = mmCP_HQD_PQ_CONTROL_DEFAULT;
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
> -			    (order_base_2(ring->ring_size / 4) - 1));
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
> -			    ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1) << 8));
> -#ifdef __BIG_ENDIAN
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
> -#endif
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 1);
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0);
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, NO_UPDATE_RPTR, 1);
> -	mqd->cp_hqd_pq_control = tmp;
> -
> -	/* enable doorbell? */
> -	tmp = 0;
> -	if (ring->use_doorbell) {
> -		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -				    DOORBELL_OFFSET, ring->doorbell_index);
> -		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -				    DOORBELL_EN, 1);
> -		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -				    DOORBELL_SOURCE, 0);
> -		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -				    DOORBELL_HIT, 0);
> -	}
> -	else
> -		tmp = REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -				    DOORBELL_EN, 0);
> -	mqd->cp_hqd_pq_doorbell_control = tmp;
> -
> -	mqd->cp_hqd_vmid = 0;
> -	/* activate the queue */
> -	mqd->cp_hqd_active = 1;
> -	mqd->cp_hqd_persistent_state = mmCP_HQD_PERSISTENT_STATE_DEFAULT;
> -	mqd->cp_hqd_ib_control = mmCP_HQD_IB_CONTROL_DEFAULT;
> -	mqd->cp_hqd_iq_timer = mmCP_HQD_IQ_TIMER_DEFAULT;
> -	mqd->cp_hqd_quantum = mmCP_HQD_QUANTUM_DEFAULT;
> -
> -	tmp = mmCP_HQD_GFX_CONTROL_DEFAULT;
> -	tmp = REG_SET_FIELD(tmp, CP_HQD_GFX_CONTROL, DB_UPDATED_MSG_EN, 1);
> -	/* offset: 184 - this is used for CP_HQD_GFX_CONTROL */
> -	mqd->cp_hqd_suspend_cntl_stack_offset = tmp;
> -
> -	amdgpu_device_flush_hdp(ring->adev, NULL);
> -	return 0;
> -}
> -
> -#if 0
> -static void mes_v10_1_queue_init_register(struct amdgpu_ring *ring)
> -{
> -	struct v10_compute_mqd *mqd = ring->mqd_ptr;
> -	struct amdgpu_device *adev = ring->adev;
> -	uint32_t data = 0;
> -
> -	mutex_lock(&adev->srbm_mutex);
> -	nv_grbm_select(adev, 3, ring->pipe, 0, 0);
> -
> -	/* set CP_HQD_VMID.VMID = 0. */
> -	data = RREG32_SOC15(GC, 0, mmCP_HQD_VMID);
> -	data = REG_SET_FIELD(data, CP_HQD_VMID, VMID, 0);
> -	WREG32_SOC15(GC, 0, mmCP_HQD_VMID, data);
> -
> -	/* set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_EN=0 */
> -	data = RREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL);
> -	data = REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
> -			     DOORBELL_EN, 0);
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL, data);
> -
> -	/* set CP_MQD_BASE_ADDR/HI with the MQD base address */
> -	WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR, mqd->cp_mqd_base_addr_lo);
> -	WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR_HI, mqd->cp_mqd_base_addr_hi);
> -
> -	/* set CP_MQD_CONTROL.VMID=0 */
> -	data = RREG32_SOC15(GC, 0, mmCP_MQD_CONTROL);
> -	data = REG_SET_FIELD(data, CP_MQD_CONTROL, VMID, 0);
> -	WREG32_SOC15(GC, 0, mmCP_MQD_CONTROL, 0);
> -
> -	/* set CP_HQD_PQ_BASE/HI with the ring buffer base address */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE, mqd->cp_hqd_pq_base_lo);
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE_HI, mqd->cp_hqd_pq_base_hi);
> -
> -	/* set CP_HQD_PQ_RPTR_REPORT_ADDR/HI */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR,
> -		     mqd->cp_hqd_pq_rptr_report_addr_lo);
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
> -		     mqd->cp_hqd_pq_rptr_report_addr_hi);
> -
> -	/* set CP_HQD_PQ_CONTROL */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL, mqd->cp_hqd_pq_control);
> -
> -	/* set CP_HQD_PQ_WPTR_POLL_ADDR/HI */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR,
> -		     mqd->cp_hqd_pq_wptr_poll_addr_lo);
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI,
> -		     mqd->cp_hqd_pq_wptr_poll_addr_hi);
> -
> -	/* set CP_HQD_PQ_DOORBELL_CONTROL */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL,
> -		     mqd->cp_hqd_pq_doorbell_control);
> -
> -	/* set CP_HQD_PERSISTENT_STATE.PRELOAD_SIZE=0x53 */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_PERSISTENT_STATE, mqd->cp_hqd_persistent_state);
> -
> -	/* set CP_HQD_ACTIVE.ACTIVE=1 */
> -	WREG32_SOC15(GC, 0, mmCP_HQD_ACTIVE, mqd->cp_hqd_active);
> -
> -	nv_grbm_select(adev, 0, 0, 0, 0);
> -	mutex_unlock(&adev->srbm_mutex);
> -}
> -#endif
> -
> -static int mes_v10_1_kiq_enable_queue(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_kiq *kiq = &adev->gfx.kiq[0];
> -	struct amdgpu_ring *kiq_ring = &adev->gfx.kiq[0].ring;
> -	int r;
> -
> -	if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
> -		return -EINVAL;
> -
> -	r = amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
> -	if (r) {
> -		DRM_ERROR("Failed to lock KIQ (%d).\n", r);
> -		return r;
> -	}
> -
> -	kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring);
> -
> -	return amdgpu_ring_test_helper(kiq_ring);
> -}
> -
> -static int mes_v10_1_queue_init(struct amdgpu_device *adev)
> -{
> -	int r;
> -
> -	r = mes_v10_1_mqd_init(&adev->mes.ring);
> -	if (r)
> -		return r;
> -
> -	r = mes_v10_1_kiq_enable_queue(adev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_ring_init(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_ring *ring;
> -
> -	ring = &adev->mes.ring;
> -
> -	ring->funcs = &mes_v10_1_ring_funcs;
> -
> -	ring->me = 3;
> -	ring->pipe = 0;
> -	ring->queue = 0;
> -
> -	ring->ring_obj = NULL;
> -	ring->use_doorbell = true;
> -	ring->doorbell_index = adev->doorbell_index.mes_ring0 << 1;
> -	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_SCHED_PIPE];
> -	ring->no_scheduler = true;
> -	sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->queue);
> -
> -	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
> -				AMDGPU_RING_PRIO_DEFAULT, NULL);
> -}
> -
> -static int mes_v10_1_kiq_ring_init(struct amdgpu_device *adev)
> -{
> -	struct amdgpu_ring *ring;
> -
> -	spin_lock_init(&adev->gfx.kiq[0].ring_lock);
> -
> -	ring = &adev->gfx.kiq[0].ring;
> -
> -	ring->me = 3;
> -	ring->pipe = 1;
> -	ring->queue = 0;
> -
> -	ring->adev = NULL;
> -	ring->ring_obj = NULL;
> -	ring->use_doorbell = true;
> -	ring->doorbell_index = adev->doorbell_index.mes_ring1 << 1;
> -	ring->eop_gpu_addr = adev->mes.eop_gpu_addr[AMDGPU_MES_KIQ_PIPE];
> -	ring->no_scheduler = true;
> -	sprintf(ring->name, "mes_kiq_%d.%d.%d",
> -		ring->me, ring->pipe, ring->queue);
> -
> -	return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
> -				AMDGPU_RING_PRIO_DEFAULT, NULL);
> -}
> -
> -static int mes_v10_1_mqd_sw_init(struct amdgpu_device *adev,
> -				 enum admgpu_mes_pipe pipe)
> -{
> -	int r, mqd_size = sizeof(struct v10_compute_mqd);
> -	struct amdgpu_ring *ring;
> -
> -	if (pipe == AMDGPU_MES_KIQ_PIPE)
> -		ring = &adev->gfx.kiq[0].ring;
> -	else if (pipe == AMDGPU_MES_SCHED_PIPE)
> -		ring = &adev->mes.ring;
> -	else
> -		BUG();
> -
> -	if (ring->mqd_obj)
> -		return 0;
> -
> -	r = amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
> -				    AMDGPU_GEM_DOMAIN_VRAM |
> -				    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
> -				    &ring->mqd_gpu_addr, &ring->mqd_ptr);
> -	if (r) {
> -		dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r);
> -		return r;
> -	}
> -	memset(ring->mqd_ptr, 0, mqd_size);
> -
> -	/* prepare MQD backup */
> -	adev->mes.mqd_backup[pipe] = kmalloc(mqd_size, GFP_KERNEL);
> -	if (!adev->mes.mqd_backup[pipe]) {
> -		dev_warn(adev->dev,
> -			 "no memory to create MQD backup for ring %s\n",
> -			 ring->name);
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_sw_init(void *handle)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	int pipe, r;
> -
> -	adev->mes.funcs = &mes_v10_1_funcs;
> -	adev->mes.kiq_hw_init = &mes_v10_1_kiq_hw_init;
> -
> -	r = amdgpu_mes_init(adev);
> -	if (r)
> -		return r;
> -
> -	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
> -			continue;
> -
> -		r = mes_v10_1_allocate_eop_buf(adev, pipe);
> -		if (r)
> -			return r;
> -
> -		r = mes_v10_1_mqd_sw_init(adev, pipe);
> -		if (r)
> -			return r;
> -	}
> -
> -	if (adev->enable_mes_kiq) {
> -		r = mes_v10_1_kiq_ring_init(adev);
> -		if (r)
> -			return r;
> -	}
> -
> -	r = mes_v10_1_ring_init(adev);
> -	if (r)
> -		return r;
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_sw_fini(void *handle)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	int pipe;
> -
> -	amdgpu_device_wb_free(adev, adev->mes.sch_ctx_offs);
> -	amdgpu_device_wb_free(adev, adev->mes.query_status_fence_offs);
> -
> -	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -		kfree(adev->mes.mqd_backup[pipe]);
> -
> -		amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
> -				      &adev->mes.eop_gpu_addr[pipe],
> -				      NULL);
> -		amdgpu_ucode_release(&adev->mes.fw[pipe]);
> -	}
> -
> -	amdgpu_bo_free_kernel(&adev->gfx.kiq[0].ring.mqd_obj,
> -			      &adev->gfx.kiq[0].ring.mqd_gpu_addr,
> -			      &adev->gfx.kiq[0].ring.mqd_ptr);
> -
> -	amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
> -			      &adev->mes.ring.mqd_gpu_addr,
> -			      &adev->mes.ring.mqd_ptr);
> -
> -	amdgpu_ring_fini(&adev->gfx.kiq[0].ring);
> -	amdgpu_ring_fini(&adev->mes.ring);
> -
> -	amdgpu_mes_fini(adev);
> -	return 0;
> -}
> -
> -static void mes_v10_1_kiq_setting(struct amdgpu_ring *ring)
> -{
> -	uint32_t tmp;
> -	struct amdgpu_device *adev = ring->adev;
> -
> -	/* tell RLC which is KIQ queue */
> -	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -	case IP_VERSION(10, 3, 0):
> -	case IP_VERSION(10, 3, 2):
> -	case IP_VERSION(10, 3, 1):
> -	case IP_VERSION(10, 3, 4):
> -		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid);
> -		tmp &= 0xffffff00;
> -		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
> -		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
> -		tmp |= 0x80;
> -		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, tmp);
> -		break;
> -	default:
> -		tmp = RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS);
> -		tmp &= 0xffffff00;
> -		tmp |= (ring->me << 5) | (ring->pipe << 3) | (ring->queue);
> -		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
> -		tmp |= 0x80;
> -		WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
> -		break;
> -	}
> -}
> -
> -static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev)
> -{
> -	int r = 0;
> -
> -	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
> -		r = mes_v10_1_load_microcode(adev, AMDGPU_MES_KIQ_PIPE);
> -		if (r) {
> -			DRM_ERROR("failed to load MES kiq fw, r=%d\n", r);
> -			return r;
> -		}
> -
> -		r = mes_v10_1_load_microcode(adev, AMDGPU_MES_SCHED_PIPE);
> -		if (r) {
> -			DRM_ERROR("failed to load MES fw, r=%d\n", r);
> -			return r;
> -		}
> -	}
> -
> -	mes_v10_1_enable(adev, true);
> -
> -	mes_v10_1_kiq_setting(&adev->gfx.kiq[0].ring);
> -
> -	r = mes_v10_1_queue_init(adev);
> -	if (r)
> -		goto failure;
> -
> -	return r;
> -
> -failure:
> -	mes_v10_1_hw_fini(adev);
> -	return r;
> -}
> -
> -static int mes_v10_1_hw_init(void *handle)
> -{
> -	int r;
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	if (!adev->enable_mes_kiq) {
> -		if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
> -			r = mes_v10_1_load_microcode(adev,
> -					     AMDGPU_MES_SCHED_PIPE);
> -			if (r) {
> -				DRM_ERROR("failed to MES fw, r=%d\n", r);
> -				return r;
> -			}
> -		}
> -
> -		mes_v10_1_enable(adev, true);
> -	}
> -
> -	r = mes_v10_1_queue_init(adev);
> -	if (r)
> -		goto failure;
> -
> -	r = mes_v10_1_set_hw_resources(&adev->mes);
> -	if (r)
> -		goto failure;
> -
> -	mes_v10_1_init_aggregated_doorbell(&adev->mes);
> -
> -	r = mes_v10_1_query_sched_status(&adev->mes);
> -	if (r) {
> -		DRM_ERROR("MES is busy\n");
> -		goto failure;
> -	}
> -
> -	/*
> -	 * Disable KIQ ring usage from the driver once MES is enabled.
> -	 * MES uses KIQ ring exclusively so driver cannot access KIQ ring
> -	 * with MES enabled.
> -	 */
> -	adev->gfx.kiq[0].ring.sched.ready = false;
> -	adev->mes.ring.sched.ready = true;
> -
> -	return 0;
> -
> -failure:
> -	mes_v10_1_hw_fini(adev);
> -	return r;
> -}
> -
> -static int mes_v10_1_hw_fini(void *handle)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	adev->mes.ring.sched.ready = false;
> -
> -	mes_v10_1_enable(adev, false);
> -
> -	if (adev->firmware.load_type == AMDGPU_FW_LOAD_DIRECT) {
> -		mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
> -		mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE);
> -	}
> -
> -	return 0;
> -}
> -
> -static int mes_v10_1_suspend(void *handle)
> -{
> -	int r;
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	r = amdgpu_mes_suspend(adev);
> -	if (r)
> -		return r;
> -
> -	return mes_v10_1_hw_fini(adev);
> -}
> -
> -static int mes_v10_1_resume(void *handle)
> -{
> -	int r;
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	r = mes_v10_1_hw_init(adev);
> -	if (r)
> -		return r;
> -
> -	return amdgpu_mes_resume(adev);
> -}
> -
> -static int mes_v10_0_early_init(void *handle)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -	int pipe, r;
> -
> -	for (pipe = 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -		if (!adev->enable_mes_kiq && pipe == AMDGPU_MES_KIQ_PIPE)
> -			continue;
> -		r = amdgpu_mes_init_microcode(adev, pipe);
> -		if (r)
> -			return r;
> -	}
> -
> -	return 0;
> -}
> -
> -static int mes_v10_0_late_init(void *handle)
> -{
> -	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
> -
> -	if (!amdgpu_in_reset(adev))
> -		amdgpu_mes_self_test(adev);
> -
> -	return 0;
> -}
> -
> -static const struct amd_ip_funcs mes_v10_1_ip_funcs = {
> -	.name = "mes_v10_1",
> -	.early_init = mes_v10_0_early_init,
> -	.late_init = mes_v10_0_late_init,
> -	.sw_init = mes_v10_1_sw_init,
> -	.sw_fini = mes_v10_1_sw_fini,
> -	.hw_init = mes_v10_1_hw_init,
> -	.hw_fini = mes_v10_1_hw_fini,
> -	.suspend = mes_v10_1_suspend,
> -	.resume = mes_v10_1_resume,
> -	.dump_ip_state = NULL,
> -	.print_ip_state = NULL,
> -};
> -
> -const struct amdgpu_ip_block_version mes_v10_1_ip_block = {
> -	.type = AMD_IP_BLOCK_TYPE_MES,
> -	.major = 10,
> -	.minor = 1,
> -	.rev = 0,
> -	.funcs = &mes_v10_1_ip_funcs,
> -};
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
> deleted file mode 100644
> index 9afd6ddb01e9..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/*
> - * Copyright 2019 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef __MES_V10_1_H__
> -#define __MES_V10_1_H__
> -
> -extern const struct amdgpu_ip_block_version mes_v10_1_ip_block;
> -
> -#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
> index 7e30a89fe03e..4938e6b340e9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -59,7 +59,6 @@
>   #include "vcn_v3_0.h"
>   #include "jpeg_v3_0.h"
>   #include "amdgpu_vkms.h"
> -#include "mes_v10_1.h"
>   #include "mxgpu_nv.h"
>   #include "smuio_v11_0.h"
>   #include "smuio_v11_0_6.h"
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index 4721b2fccd06..485e26abc619 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -35,7 +35,7 @@
>   #include "cik_regs.h"
>   #include "kfd_kernel_queue.h"
>   #include "amdgpu_amdkfd.h"
> -#include "mes_api_def.h"
> +#include "mes_v11_api_def.h"
>   #include "kfd_debug.h"
>   
>   /* Size of the per-pipe EOP queue */
> diff --git a/drivers/gpu/drm/amd/include/mes_api_def.h b/drivers/gpu/drm/amd/include/mes_api_def.h
> deleted file mode 100644
> index bf3d6ad263f9..000000000000
> --- a/drivers/gpu/drm/amd/include/mes_api_def.h
> +++ /dev/null
> @@ -1,570 +0,0 @@
> -/*
> - * Copyright 2019 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining a
> - * copy of this software and associated documentation files (the "Software"),
> - * to deal in the Software without restriction, including without limitation
> - * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be included in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef __MES_API_DEF_H__
> -#define __MES_API_DEF_H__
> -
> -#pragma pack(push, 4)
> -
> -#define MES_API_VERSION 1
> -
> -/* Driver submits one API(cmd) as a single Frame and this command size is same
> - * for all API to ease the debugging and parsing of ring buffer.
> - */
> -enum { API_FRAME_SIZE_IN_DWORDS = 64 };
> -
> -/* To avoid command in scheduler context to be overwritten whenever multiple
> - * interrupts come in, this creates another queue.
> - */
> -enum { API_NUMBER_OF_COMMAND_MAX = 32 };
> -
> -enum MES_API_TYPE {
> -	MES_API_TYPE_SCHEDULER = 1,
> -	MES_API_TYPE_MAX
> -};
> -
> -enum MES_SCH_API_OPCODE {
> -	MES_SCH_API_SET_HW_RSRC			= 0,
> -	MES_SCH_API_SET_SCHEDULING_CONFIG	= 1, /* agreegated db, quantums, etc */
> -	MES_SCH_API_ADD_QUEUE			= 2,
> -	MES_SCH_API_REMOVE_QUEUE		= 3,
> -	MES_SCH_API_PERFORM_YIELD		= 4,
> -	MES_SCH_API_SET_GANG_PRIORITY_LEVEL	= 5,
> -	MES_SCH_API_SUSPEND			= 6,
> -	MES_SCH_API_RESUME			= 7,
> -	MES_SCH_API_RESET			= 8,
> -	MES_SCH_API_SET_LOG_BUFFER		= 9,
> -	MES_SCH_API_CHANGE_GANG_PRORITY		= 10,
> -	MES_SCH_API_QUERY_SCHEDULER_STATUS	= 11,
> -	MES_SCH_API_PROGRAM_GDS			= 12,
> -	MES_SCH_API_SET_DEBUG_VMID		= 13,
> -	MES_SCH_API_MISC			= 14,
> -	MES_SCH_API_UPDATE_ROOT_PAGE_TABLE      = 15,
> -	MES_SCH_API_AMD_LOG                     = 16,
> -	MES_SCH_API_MAX				= 0xFF
> -};
> -
> -union MES_API_HEADER {
> -	struct {
> -		uint32_t type		: 4; /* 0 - Invalid; 1 - Scheduling; 2 - TBD */
> -		uint32_t opcode		: 8;
> -		uint32_t dwsize		: 8; /* including header */
> -		uint32_t reserved	: 12;
> -	};
> -
> -	uint32_t	u32All;
> -};
> -
> -enum MES_AMD_PRIORITY_LEVEL {
> -	AMD_PRIORITY_LEVEL_LOW		= 0,
> -	AMD_PRIORITY_LEVEL_NORMAL	= 1,
> -	AMD_PRIORITY_LEVEL_MEDIUM	= 2,
> -	AMD_PRIORITY_LEVEL_HIGH		= 3,
> -	AMD_PRIORITY_LEVEL_REALTIME	= 4,
> -	AMD_PRIORITY_NUM_LEVELS
> -};
> -
> -enum MES_QUEUE_TYPE {
> -	MES_QUEUE_TYPE_GFX,
> -	MES_QUEUE_TYPE_COMPUTE,
> -	MES_QUEUE_TYPE_SDMA,
> -	MES_QUEUE_TYPE_MAX,
> -};
> -
> -struct MES_API_STATUS {
> -	uint64_t	api_completion_fence_addr;
> -	uint64_t	api_completion_fence_value;
> -};
> -
> -enum { MAX_COMPUTE_PIPES = 8 };
> -enum { MAX_GFX_PIPES = 2 };
> -enum { MAX_SDMA_PIPES = 2 };
> -
> -enum { MAX_COMPUTE_HQD_PER_PIPE = 8 };
> -enum { MAX_GFX_HQD_PER_PIPE = 8 };
> -enum { MAX_SDMA_HQD_PER_PIPE = 10 };
> -
> -enum { MAX_QUEUES_IN_A_GANG = 8 };
> -
> -enum VM_HUB_TYPE {
> -	VM_HUB_TYPE_GC = 0,
> -	VM_HUB_TYPE_MM = 1,
> -	VM_HUB_TYPE_MAX,
> -};
> -
> -enum { VMID_INVALID = 0xffff };
> -
> -enum { MAX_VMID_GCHUB = 16 };
> -enum { MAX_VMID_MMHUB = 16 };
> -
> -enum MES_LOG_OPERATION {
> -	MES_LOG_OPERATION_CONTEXT_STATE_CHANGE = 0,
> -	MES_LOG_OPERATION_QUEUE_NEW_WORK = 1,
> -	MES_LOG_OPERATION_QUEUE_UNWAIT_SYNC_OBJECT = 2,
> -	MES_LOG_OPERATION_QUEUE_NO_MORE_WORK = 3,
> -	MES_LOG_OPERATION_QUEUE_WAIT_SYNC_OBJECT = 4,
> -	MES_LOG_OPERATION_QUEUE_INVALID = 0xF,
> -};
> -
> -enum MES_LOG_CONTEXT_STATE {
> -	MES_LOG_CONTEXT_STATE_IDLE		= 0,
> -	MES_LOG_CONTEXT_STATE_RUNNING		= 1,
> -	MES_LOG_CONTEXT_STATE_READY		= 2,
> -	MES_LOG_CONTEXT_STATE_READY_STANDBY	= 3,
> -	MES_LOG_CONTEXT_STATE_INVALID           = 0xF,
> -};
> -
> -struct MES_LOG_CONTEXT_STATE_CHANGE {
> -	void				*h_context;
> -	enum MES_LOG_CONTEXT_STATE	new_context_state;
> -};
> -
> -struct MES_LOG_QUEUE_NEW_WORK {
> -	uint64_t                   h_queue;
> -	uint64_t                   reserved;
> -};
> -
> -struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT {
> -	uint64_t                   h_queue;
> -	uint64_t                   h_sync_object;
> -};
> -
> -struct MES_LOG_QUEUE_NO_MORE_WORK {
> -	uint64_t                   h_queue;
> -	uint64_t                   reserved;
> -};
> -
> -struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT {
> -	uint64_t                   h_queue;
> -	uint64_t                   h_sync_object;
> -};
> -
> -struct MES_LOG_ENTRY_HEADER {
> -	uint32_t	first_free_entry_index;
> -	uint32_t	wraparound_count;
> -	uint64_t	number_of_entries;
> -	uint64_t	reserved[2];
> -};
> -
> -struct MES_LOG_ENTRY_DATA {
> -	uint64_t	gpu_time_stamp;
> -	uint32_t	operation_type; /* operation_type is of MES_LOG_OPERATION type */
> -	uint32_t	reserved_operation_type_bits;
> -	union {
> -		struct MES_LOG_CONTEXT_STATE_CHANGE     context_state_change;
> -		struct MES_LOG_QUEUE_NEW_WORK           queue_new_work;
> -		struct MES_LOG_QUEUE_UNWAIT_SYNC_OBJECT queue_unwait_sync_object;
> -		struct MES_LOG_QUEUE_NO_MORE_WORK       queue_no_more_work;
> -		struct MES_LOG_QUEUE_WAIT_SYNC_OBJECT   queue_wait_sync_object;
> -		uint64_t                                all[2];
> -	};
> -};
> -
> -struct MES_LOG_BUFFER {
> -	struct MES_LOG_ENTRY_HEADER	header;
> -	struct MES_LOG_ENTRY_DATA	entries[1];
> -};
> -
> -enum MES_SWIP_TO_HWIP_DEF {
> -	MES_MAX_HWIP_SEGMENT = 6,
> -};
> -
> -union MESAPI_SET_HW_RESOURCES {
> -	struct {
> -		union MES_API_HEADER	header;
> -		uint32_t		vmid_mask_mmhub;
> -		uint32_t		vmid_mask_gfxhub;
> -		uint32_t		gds_size;
> -		uint32_t		paging_vmid;
> -		uint32_t		compute_hqd_mask[MAX_COMPUTE_PIPES];
> -		uint32_t		gfx_hqd_mask[MAX_GFX_PIPES];
> -		uint32_t		sdma_hqd_mask[MAX_SDMA_PIPES];
> -		uint32_t		aggregated_doorbells[AMD_PRIORITY_NUM_LEVELS];
> -		uint64_t		g_sch_ctx_gpu_mc_ptr;
> -		uint64_t		query_status_fence_gpu_mc_ptr;
> -		uint32_t		gc_base[MES_MAX_HWIP_SEGMENT];
> -		uint32_t		mmhub_base[MES_MAX_HWIP_SEGMENT];
> -		uint32_t		osssys_base[MES_MAX_HWIP_SEGMENT];
> -		struct MES_API_STATUS	api_status;
> -		union {
> -			struct {
> -				uint32_t disable_reset	: 1;
> -				uint32_t use_different_vmid_compute : 1;
> -				uint32_t disable_mes_log   : 1;
> -				uint32_t apply_mmhub_pgvm_invalidate_ack_loss_wa : 1;
> -				uint32_t apply_grbm_remote_register_dummy_read_wa : 1;
> -				uint32_t second_gfx_pipe_enabled : 1;
> -				uint32_t enable_level_process_quantum_check : 1;
> -				uint32_t apply_cwsr_program_all_vmid_sq_shader_tba_registers_wa : 1;
> -				uint32_t enable_mqd_active_poll : 1;
> -				uint32_t disable_timer_int : 1;
> -				uint32_t reserved	: 22;
> -			};
> -			uint32_t	uint32_t_all;
> -		};
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__ADD_QUEUE {
> -	struct {
> -		union MES_API_HEADER		header;
> -		uint32_t			process_id;
> -		uint64_t			page_table_base_addr;
> -		uint64_t			process_va_start;
> -		uint64_t			process_va_end;
> -		uint64_t			process_quantum;
> -		uint64_t			process_context_addr;
> -		uint64_t			gang_quantum;
> -		uint64_t			gang_context_addr;
> -		uint32_t			inprocess_gang_priority;
> -		enum MES_AMD_PRIORITY_LEVEL	gang_global_priority_level;
> -		uint32_t			doorbell_offset;
> -		uint64_t			mqd_addr;
> -		uint64_t			wptr_addr;
> -		uint64_t                        h_context;
> -		uint64_t                        h_queue;
> -		enum MES_QUEUE_TYPE		queue_type;
> -		uint32_t			gds_base;
> -		uint32_t			gds_size;
> -		uint32_t			gws_base;
> -		uint32_t			gws_size;
> -		uint32_t			oa_mask;
> -		uint64_t                        trap_handler_addr;
> -		uint32_t                        vm_context_cntl;
> -
> -		struct {
> -			uint32_t paging			: 1;
> -			uint32_t debug_vmid		: 4;
> -			uint32_t program_gds		: 1;
> -			uint32_t is_gang_suspended	: 1;
> -			uint32_t is_tmz_queue		: 1;
> -			uint32_t map_kiq_utility_queue  : 1;
> -			uint32_t reserved		: 23;
> -		};
> -		struct MES_API_STATUS		api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__REMOVE_QUEUE {
> -	struct {
> -		union MES_API_HEADER	header;
> -		uint32_t		doorbell_offset;
> -		uint64_t		gang_context_addr;
> -
> -		struct {
> -			uint32_t unmap_legacy_gfx_queue   : 1;
> -			uint32_t unmap_kiq_utility_queue  : 1;
> -			uint32_t preempt_legacy_gfx_queue : 1;
> -			uint32_t reserved                 : 29;
> -		};
> -		struct MES_API_STATUS	    api_status;
> -
> -		uint32_t                    pipe_id;
> -		uint32_t                    queue_id;
> -
> -		uint64_t                    tf_addr;
> -		uint32_t                    tf_data;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__SET_SCHEDULING_CONFIG {
> -	struct {
> -		union MES_API_HEADER	header;
> -		/* Grace period when preempting another priority band for this
> -		 * priority band. The value for idle priority band is ignored,
> -		 * as it never preempts other bands.
> -		 */
> -		uint64_t		grace_period_other_levels[AMD_PRIORITY_NUM_LEVELS];
> -		/* Default quantum for scheduling across processes within
> -		 * a priority band.
> -		 */
> -		uint64_t		process_quantum_for_level[AMD_PRIORITY_NUM_LEVELS];
> -		/* Default grace period for processes that preempt each other
> -		 * within a priority band.
> -		 */
> -		uint64_t		process_grace_period_same_level[AMD_PRIORITY_NUM_LEVELS];
> -		/* For normal level this field specifies the target GPU
> -		 * percentage in situations when it's starved by the high level.
> -		 * Valid values are between 0 and 50, with the default being 10.
> -		 */
> -		uint32_t		normal_yield_percent;
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__PERFORM_YIELD {
> -	struct {
> -		union MES_API_HEADER	header;
> -		uint32_t		dummy;
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__CHANGE_GANG_PRIORITY_LEVEL {
> -	struct {
> -		union MES_API_HEADER		header;
> -		uint32_t			inprocess_gang_priority;
> -		enum MES_AMD_PRIORITY_LEVEL	gang_global_priority_level;
> -		uint64_t			gang_quantum;
> -		uint64_t			gang_context_addr;
> -		struct MES_API_STATUS		api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__SUSPEND {
> -	struct {
> -		union MES_API_HEADER	header;
> -		/* false - suspend all gangs; true - specific gang */
> -		struct {
> -			uint32_t suspend_all_gangs	: 1;
> -			uint32_t reserved		: 31;
> -		};
> -		/* gang_context_addr is valid only if suspend_all = false */
> -		uint64_t		gang_context_addr;
> -
> -		uint64_t		suspend_fence_addr;
> -		uint32_t		suspend_fence_value;
> -
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__RESUME {
> -	struct {
> -		union MES_API_HEADER	header;
> -		/* false - resume all gangs; true - specified gang */
> -		struct {
> -			uint32_t resume_all_gangs	: 1;
> -			uint32_t reserved		: 31;
> -		};
> -		/* valid only if resume_all_gangs = false */
> -		uint64_t		gang_context_addr;
> -
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__RESET {
> -	struct {
> -		union MES_API_HEADER		header;
> -
> -		struct {
> -			/* Only reset the queue given by doorbell_offset (not entire gang) */
> -			uint32_t                reset_queue_only : 1;
> -			/* Hang detection first then reset any queues that are hung */
> -			uint32_t                hang_detect_then_reset : 1;
> -			/* Only do hang detection (no reset) */
> -			uint32_t                hang_detect_only : 1;
> -			/* Rest HP and LP kernel queues not managed by MES */
> -			uint32_t                reset_legacy_gfx : 1;
> -			uint32_t                reserved : 28;
> -		};
> -
> -		uint64_t			gang_context_addr;
> -
> -		/* valid only if reset_queue_only = true */
> -		uint32_t			doorbell_offset;
> -
> -		/* valid only if hang_detect_then_reset = true */
> -		uint64_t			doorbell_offset_addr;
> -		enum MES_QUEUE_TYPE		queue_type;
> -
> -		/* valid only if reset_legacy_gfx = true */
> -		uint32_t			pipe_id_lp;
> -		uint32_t			queue_id_lp;
> -		uint32_t			vmid_id_lp;
> -		uint64_t			mqd_mc_addr_lp;
> -		uint32_t			doorbell_offset_lp;
> -		uint64_t			wptr_addr_lp;
> -
> -		uint32_t			pipe_id_hp;
> -		uint32_t			queue_id_hp;
> -		uint32_t			vmid_id_hp;
> -		uint64_t			mqd_mc_addr_hp;
> -		uint32_t			doorbell_offset_hp;
> -		uint64_t			wptr_addr_hp;
> -
> -		struct MES_API_STATUS		api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__SET_LOGGING_BUFFER {
> -	struct {
> -		union MES_API_HEADER	header;
> -		/* There are separate log buffers for each queue type */
> -		enum MES_QUEUE_TYPE	log_type;
> -		/* Log buffer GPU Address */
> -		uint64_t		logging_buffer_addr;
> -		/* number of entries in the log buffer */
> -		uint32_t		number_of_entries;
> -		/* Entry index at which CPU interrupt needs to be signalled */
> -		uint32_t		interrupt_entry;
> -
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__QUERY_MES_STATUS {
> -	struct {
> -		union MES_API_HEADER	header;
> -		bool			mes_healthy; /* 0 - not healthy, 1 - healthy */
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__PROGRAM_GDS {
> -	struct {
> -		union MES_API_HEADER	header;
> -		uint64_t		process_context_addr;
> -		uint32_t		gds_base;
> -		uint32_t		gds_size;
> -		uint32_t		gws_base;
> -		uint32_t		gws_size;
> -		uint32_t		oa_mask;
> -		struct MES_API_STATUS	api_status;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__SET_DEBUG_VMID {
> -	struct {
> -		union MES_API_HEADER	header;
> -		struct MES_API_STATUS	api_status;
> -		union {
> -			struct {
> -				uint32_t use_gds	: 1;
> -				uint32_t reserved	: 31;
> -			} flags;
> -			uint32_t	u32All;
> -		};
> -		uint32_t		reserved;
> -		uint32_t		debug_vmid;
> -		uint64_t		process_context_addr;
> -		uint64_t		page_table_base_addr;
> -		uint64_t		process_va_start;
> -		uint64_t		process_va_end;
> -		uint32_t		gds_base;
> -		uint32_t		gds_size;
> -		uint32_t		gws_base;
> -		uint32_t		gws_size;
> -		uint32_t		oa_mask;
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -enum MESAPI_MISC_OPCODE {
> -	MESAPI_MISC__MODIFY_REG,
> -	MESAPI_MISC__INV_GART,
> -	MESAPI_MISC__QUERY_STATUS,
> -	MESAPI_MISC__MAX,
> -};
> -
> -enum MODIFY_REG_SUBCODE {
> -	MODIFY_REG__OVERWRITE,
> -	MODIFY_REG__RMW_OR,
> -	MODIFY_REG__RMW_AND,
> -	MODIFY_REG__MAX,
> -};
> -
> -enum { MISC_DATA_MAX_SIZE_IN_DWORDS = 20 };
> -
> -struct MODIFY_REG {
> -	enum MODIFY_REG_SUBCODE   subcode;
> -	uint32_t                  reg_offset;
> -	uint32_t                  reg_value;
> -};
> -
> -struct INV_GART {
> -	uint64_t                  inv_range_va_start;
> -	uint64_t                  inv_range_size;
> -};
> -
> -struct QUERY_STATUS {
> -	uint32_t context_id;
> -};
> -
> -union MESAPI__MISC {
> -	struct {
> -		union MES_API_HEADER	header;
> -		enum MESAPI_MISC_OPCODE	opcode;
> -		struct MES_API_STATUS	api_status;
> -
> -		union {
> -			struct		MODIFY_REG modify_reg;
> -			struct		INV_GART inv_gart;
> -			struct		QUERY_STATUS query_status;
> -			uint32_t	data[MISC_DATA_MAX_SIZE_IN_DWORDS];
> -		};
> -	};
> -
> -	uint32_t	max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI__UPDATE_ROOT_PAGE_TABLE {
> -	struct {
> -		union MES_API_HEADER        header;
> -		uint64_t                    page_table_base_addr;
> -		uint64_t                    process_context_addr;
> -		struct MES_API_STATUS       api_status;
> -	};
> -
> -	uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -union MESAPI_AMD_LOG {
> -	struct {
> -		union MES_API_HEADER        header;
> -		uint64_t                    p_buffer_memory;
> -		uint64_t                    p_buffer_size_used;
> -		struct MES_API_STATUS       api_status;
> -	};
> -
> -	uint32_t max_dwords_in_api[API_FRAME_SIZE_IN_DWORDS];
> -};
> -
> -#pragma pack(pop)
> -#endif

