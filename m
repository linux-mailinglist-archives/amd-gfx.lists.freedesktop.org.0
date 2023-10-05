Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2927BA026
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Oct 2023 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139610E411;
	Thu,  5 Oct 2023 14:34:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7E510E079
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Oct 2023 14:34:57 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-32320381a07so1096700f8f.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Oct 2023 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696516495; x=1697121295; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mnsjZrQdh9DYOPe6kFeHHRw/KhavHxikKS0AoMLcBAQ=;
 b=B+ZWfro0/iTnN4NCIUYEW+bbF7AjAmuneOumAxM6BTlCEx7T7aO/nbp6GWMzk6fkud
 278q9JRTO2zqTAsYoT2+NY6E12aq/gOE2O0q8ojWvywCZ/1i3m7Esj56S3pFYrHWY+vU
 JxTusA3f9IDW/3/WaGX80a7K8OX7TCGpHEqiSA6LN7j585ghKgS+N5kN0zQOdsahnWX8
 SJYKHXZuRZVrrBssOyOy06O8SnOASWAq/UX5xHBFbmpxmQCG7xTRxf2EYFOM6fcCJsV9
 buhiAhw8J9tqlq5gJ04OaKG/5ZQNdhm6y3py6i7I6bvMFOCU+xXBdtOIUb8HFPpuCq/O
 ePxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696516495; x=1697121295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mnsjZrQdh9DYOPe6kFeHHRw/KhavHxikKS0AoMLcBAQ=;
 b=YCeyQyMTrcewfNVrFHb/WcwiQSQdh26zezzK7dpuzk1mB+qPBDv9ILI9znOl80qYui
 W1u+nJpvFnJj6UCnwom3G3vUD0wF6G87Thuaj8CeZGdcZ5aG4myrBbOZFsmTJ69t/u9D
 EIz3qASF0waUnc28poVm/KMNuxPsRmR7aADJySgpxtSSeRX9e1HE4a34UMFWzsBLztFx
 OAfHSIQ5uHdd63jghpbpD5Vtap3dDkraJS+l/JvEseQOQYLNwDCK0cY/GeDsDu4FpLN5
 yRXF5VwSRGaDe5aSERfgfVZC4uD5W3ovqDYQOB/qZz1G+0GkGxJX2FmXJxsK5XKam5Pz
 4Now==
X-Gm-Message-State: AOJu0Yyb4GvvOOT9St4epWaAiKCMHPZetFF/s7bj1xMotufzfz5F60D5
 Xs/CKt5cgXYfhVV60EA2KIY=
X-Google-Smtp-Source: AGHT+IF5iJLUdPx8JkDlOdU9Q1rfHcpfM06Gdgivq2BPYsYGVt4yslk8wm9EO+yhAru8d49+stqnQQ==
X-Received: by 2002:a05:6000:1189:b0:321:6936:c217 with SMTP id
 g9-20020a056000118900b003216936c217mr4833180wrx.14.1696516495226; 
 Thu, 05 Oct 2023 07:34:55 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adfee0d000000b00325aca09ad1sm1944615wrn.24.2023.10.05.07.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Oct 2023 07:34:54 -0700 (PDT)
Message-ID: <d9f617f9-3346-4b4c-bd00-a6da1b0f377a@gmail.com>
Date: Thu, 5 Oct 2023 16:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] drm/amdgpu: map wptr BO into GART
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230908160446.2188-1-shashank.sharma@amd.com>
 <20230908160446.2188-8-shashank.sharma@amd.com>
 <022fbf02-b9f6-1286-bd25-dd150384047e@gmail.com>
 <816ed7f8-9a22-4b17-ae0e-27701ea51557@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <816ed7f8-9a22-4b17-ae0e-27701ea51557@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, arvind.yadav@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 04.10.23 um 23:34 schrieb Felix Kuehling:
>
> On 2023-09-18 06:32, Christian König wrote:
>> Am 08.09.23 um 18:04 schrieb Shashank Sharma:
>>> To support oversubscription, MES FW expects WPTR BOs to
>>> be mapped into GART, before they are submitted to usermode
>>> queues. This patch adds a function for the same.
>>>
>>> V4: fix the wptr value before mapping lookup (Bas, Christian).
>>> V5: Addressed review comments from Christian:
>>>      - Either pin object or allocate from GART, but not both.
>>>      - All the handling must be done with the VM locks held.
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
>>> Signed-off-by: Arvind Yadav <arvind.yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c        | 81 
>>> +++++++++++++++++++
>>>   .../gpu/drm/amd/include/amdgpu_userqueue.h    |  1 +
>>>   2 files changed, 82 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c 
>>> b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>>> index e266674e0d44..c0eb622dfc37 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
>>> @@ -6427,6 +6427,79 @@ const struct amdgpu_ip_block_version 
>>> gfx_v11_0_ip_block =
>>>       .funcs = &gfx_v11_0_ip_funcs,
>>>   };
>>>   +static int
>>> +gfx_v11_0_map_gtt_bo_to_gart(struct amdgpu_device *adev, struct 
>>> amdgpu_bo *bo)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = amdgpu_bo_reserve(bo, true);
>>> +    if (ret) {
>>> +        DRM_ERROR("Failed to reserve bo. ret %d\n", ret);
>>> +        goto err_reserve_bo_failed;
>>> +    }
>>> +
>>> +    ret = amdgpu_ttm_alloc_gart(&bo->tbo);
>>> +    if (ret) {
>>> +        DRM_ERROR("Failed to bind bo to GART. ret %d\n", ret);
>>> +        goto err_map_bo_gart_failed;
>>> +    }
>>> +
>>> +    amdgpu_bo_unreserve(bo);
>>
>> The GART mapping can become invalid as soon as you unlock the BOs.
>>
>> You need to attach an eviction fence for this to work correctly.
>
> Don't you need an eviction fence on the WPTR BO regardless of the GTT 
> mapping?

Yeah, indeed :)

Long story short we need a general eviction fence handling for BOs.

Regards,
Christian.

>
> Regards,
>   Felix
>
>
>>
>>> +    bo = amdgpu_bo_ref(bo);
>>> +
>>> +    return 0;
>>> +
>>> +err_map_bo_gart_failed:
>>> +    amdgpu_bo_unreserve(bo);
>>> +err_reserve_bo_failed:
>>> +    return ret;
>>> +}
>>> +
>>> +static int
>>> +gfx_v11_0_create_wptr_mapping(struct amdgpu_device *adev,
>>> +                  struct amdgpu_usermode_queue *queue,
>>> +                  uint64_t wptr)
>>> +{
>>> +    struct amdgpu_bo_va_mapping *wptr_mapping;
>>> +    struct amdgpu_vm *wptr_vm;
>>> +    struct amdgpu_bo *wptr_bo = NULL;
>>> +    int ret;
>>> +
>>> +    mutex_lock(&queue->vm->eviction_lock);
>>
>> Never ever touch the eviction lock outside of the VM code! That lock 
>> is completely unrelated to what you do here.
>>
>>> +    wptr_vm = queue->vm;
>>> +    ret = amdgpu_bo_reserve(wptr_vm->root.bo, false);
>>> +    if (ret)
>>> +        goto unlock;
>>> +
>>> +    wptr &= AMDGPU_GMC_HOLE_MASK;
>>> +    wptr_mapping = amdgpu_vm_bo_lookup_mapping(wptr_vm, wptr >> 
>>> PAGE_SHIFT);
>>> +    amdgpu_bo_unreserve(wptr_vm->root.bo);
>>> +    if (!wptr_mapping) {
>>> +        DRM_ERROR("Failed to lookup wptr bo\n");
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    wptr_bo = wptr_mapping->bo_va->base.bo;
>>> +    if (wptr_bo->tbo.base.size > PAGE_SIZE) {
>>> +        DRM_ERROR("Requested GART mapping for wptr bo larger than 
>>> one page\n");
>>> +        ret = -EINVAL;
>>> +        goto unlock;
>>> +    }
>>
>> We probably also want to enforce that this BO is a per VM BO.
>>
>>> +
>>> +    ret = gfx_v11_0_map_gtt_bo_to_gart(adev, wptr_bo);
>>> +    if (ret) {
>>> +        DRM_ERROR("Failed to map wptr bo to GART\n");
>>> +        goto unlock;
>>> +    }
>>> +
>>> +    queue->wptr_mc_addr = wptr_bo->tbo.resource->start << PAGE_SHIFT;
>>
>> This needs to be amdgpu_bo_gpu_offset() instead.
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +unlock:
>>> +    mutex_unlock(&queue->vm->eviction_lock);
>>> +    return ret;
>>> +}
>>> +
>>>   static void gfx_v11_0_userq_unmap(struct amdgpu_userq_mgr *uq_mgr,
>>>                     struct amdgpu_usermode_queue *queue)
>>>   {
>>> @@ -6475,6 +6548,7 @@ static int gfx_v11_0_userq_map(struct 
>>> amdgpu_userq_mgr *uq_mgr,
>>>       queue_input.queue_size = userq_props->queue_size >> 2;
>>>       queue_input.doorbell_offset = userq_props->doorbell_index;
>>>       queue_input.page_table_base_addr = 
>>> amdgpu_gmc_pd_addr(queue->vm->root.bo);
>>> +    queue_input.wptr_mc_addr = queue->wptr_mc_addr;
>>>         amdgpu_mes_lock(&adev->mes);
>>>       r = adev->mes.funcs->add_hw_queue(&adev->mes, &queue_input);
>>> @@ -6601,6 +6675,13 @@ static int gfx_v11_0_userq_mqd_create(struct 
>>> amdgpu_userq_mgr *uq_mgr,
>>>           goto free_mqd;
>>>       }
>>>   +    /* FW expects WPTR BOs to be mapped into GART */
>>> +    r = gfx_v11_0_create_wptr_mapping(adev, queue, 
>>> userq_props.wptr_gpu_addr);
>>> +    if (r) {
>>> +        DRM_ERROR("Failed to create WPTR mapping\n");
>>> +        goto free_ctx;
>>> +    }
>>> +
>>>       /* Map userqueue into FW using MES */
>>>       r = gfx_v11_0_userq_map(uq_mgr, queue, &userq_props);
>>>       if (r) {
>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_userqueue.h 
>>> b/drivers/gpu/drm/amd/include/amdgpu_userqueue.h
>>> index 34e20daa06c8..ae155de62560 100644
>>> --- a/drivers/gpu/drm/amd/include/amdgpu_userqueue.h
>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_userqueue.h
>>> @@ -39,6 +39,7 @@ struct amdgpu_usermode_queue {
>>>       int            queue_type;
>>>       uint64_t        doorbell_handle;
>>>       uint64_t        doorbell_index;
>>> +    uint64_t        wptr_mc_addr;
>>>       uint64_t        flags;
>>>       struct amdgpu_mqd_prop    *userq_prop;
>>>       struct amdgpu_userq_mgr *userq_mgr;
>>

