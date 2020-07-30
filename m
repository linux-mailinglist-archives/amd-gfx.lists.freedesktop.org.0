Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1E232F3D
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jul 2020 11:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1476E027;
	Thu, 30 Jul 2020 09:13:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C76E027
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 09:13:35 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id kq25so14270379ejb.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SqpbdHuj09/iAfXZfsvh57sDSafnyFbFu9aW8TdOi+0=;
 b=bEMh4xaaHhOhvkj6Gjf1vDOm7/P+erhdxhPzoSAFTnE8MGUvxW3uV3zC2fe2hBHdTR
 6EPTzYg0G8zGoxzqKrf8Nf6CKgssRJvwTHeYpz2Tingzm6k2WuwTt3UAn1m6quSIUBm5
 WY4eqkq0ru4T1Jwy6N67qX6/kn80ZMXhO53qNf8e+kaprSZubePnAf6BMGhqTAKuPwkU
 ptoXlUlg/wEFVAy7mv7WVKPAqgWHtBt+OMDFxxaEJTvYzkAMIR0SvJovpQu981qz9OH1
 fL34ncQaubGVeBdoIgr27HCmSnDYgr0Zs0IHBfcx09/awLvkoR6NK+jBz2FzemQS0r12
 /x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=SqpbdHuj09/iAfXZfsvh57sDSafnyFbFu9aW8TdOi+0=;
 b=P2nDWAo4EvAeXohDqII01KosaFJOe9etsZuZ1ys1JFEIyDglKKmhvb+SRCaVopT+9x
 H6cXOWzamFUrtBxls5S4u6IrvTa7Gt0vSL7hmHGKHCeQuUA84wLi5JnVMcAN7qWyr/V+
 XaiPhcxcubeyUZTVV+HJeCE7AbbADS0Hra5WRMUi2LBEzKLs03GIdhXnan5MJQnr3CSy
 ZwKIWi12TlwgynngXoXs9eiHOsWOUHc7jFXa81vrUKggWNPLA61mPZy331aeLf7HCzBo
 2rSq8sQlhS/xI1Ufjv4RMSemLlAH9gjO9IYV0uqw33K0SYst+bBWinwGsCxvmSvmFCDB
 xj3A==
X-Gm-Message-State: AOAM531PXv+bszRKZYaPyzpoIpvLIeeLiV1XHxwzRS4JyeszsnoxCOVf
 d4mgWuJrI+WBpiEN1W4zERY=
X-Google-Smtp-Source: ABdhPJxFHT5QPfvGPpZylFVV9+dwan1PdnHbdTUd/lMYV5dQ467SGVWus7yLN7DqSHgQHiqa1yTb/g==
X-Received: by 2002:a17:906:98c1:: with SMTP id
 zd1mr887156ejb.410.1596100414433; 
 Thu, 30 Jul 2020 02:13:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id du2sm4965641ejc.2.2020.07.30.02.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 02:13:33 -0700 (PDT)
Subject: Re: [PATCH 17/17] drm/amdgpu: move vram usage by vbios to mman
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200729173439.3698-1-alexander.deucher@amd.com>
 <20200729173439.3698-18-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3dc35ba3-f466-bc11-e0fd-0bdf14a911ce@gmail.com>
Date: Thu, 30 Jul 2020 11:13:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729173439.3698-18-alexander.deucher@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 29.07.20 um 19:34 schrieb Alex Deucher:
> It's related to the memory manager so move it there.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           | 12 -----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c  |  4 ++--
>   .../gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c  |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 20 +++++++++----------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       | 13 ++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c      |  6 +++---
>   6 files changed, 30 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 44fd0ef7394f..81f6412eb54f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -649,16 +649,6 @@ struct amdgpu_atcs {
>   	struct amdgpu_atcs_functions functions;
>   };
>   
> -/*
> - * Firmware VRAM reservation
> - */
> -struct amdgpu_fw_vram_usage {
> -	u64 start_offset;
> -	u64 size;
> -	struct amdgpu_bo *reserved_bo;
> -	void *va;
> -};
> -
>   /*
>    * CGS
>    */
> @@ -942,8 +932,6 @@ struct amdgpu_device {
>   	struct delayed_work     delayed_init_work;
>   
>   	struct amdgpu_virt	virt;
> -	/* firmware VRAM reservation */
> -	struct amdgpu_fw_vram_usage fw_vram_usage;
>   
>   	/* link all shadow bo */
>   	struct list_head                shadow_list;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> index 29f767e026e4..681f2ef739b1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
> @@ -1786,9 +1786,9 @@ static int amdgpu_atombios_allocate_fb_scratch(struct amdgpu_device *adev)
>   			(uint32_t)(ATOM_VRAM_BLOCK_SRIOV_MSG_SHARE_RESERVATION <<
>   			ATOM_VRAM_OPERATION_FLAGS_SHIFT)) {
>   			/* Firmware request VRAM reservation for SR-IOV */
> -			adev->fw_vram_usage.start_offset = (start_addr &
> +			adev->mman.fw_vram_usage.start_offset = (start_addr &
>   				(~ATOM_VRAM_OPERATION_FLAGS_MASK)) << 10;
> -			adev->fw_vram_usage.size = size << 10;
> +			adev->mman.fw_vram_usage.size = size << 10;
>   			/* Use the default scratch size */
>   			usage_bytes = 0;
>   		} else {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> index 1279053324f9..07a835d42b72 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c
> @@ -89,9 +89,9 @@ int amdgpu_atomfirmware_allocate_fb_scratch(struct amdgpu_device *adev)
>   			(uint32_t)(ATOM_VRAM_BLOCK_SRIOV_MSG_SHARE_RESERVATION <<
>   			ATOM_VRAM_OPERATION_FLAGS_SHIFT)) {
>   			/* Firmware request VRAM reservation for SR-IOV */
> -			adev->fw_vram_usage.start_offset = (start_addr &
> +			adev->mman.fw_vram_usage.start_offset = (start_addr &
>   				(~ATOM_VRAM_OPERATION_FLAGS_MASK)) << 10;
> -			adev->fw_vram_usage.size = size << 10;
> +			adev->mman.fw_vram_usage.size = size << 10;
>   			/* Use the default scratch size */
>   			usage_bytes = 0;
>   		} else {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ea9b5b39f640..f81a33f79517 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1766,8 +1766,8 @@ static struct ttm_bo_driver amdgpu_bo_driver = {
>    */
>   static void amdgpu_ttm_fw_reserve_vram_fini(struct amdgpu_device *adev)
>   {
> -	amdgpu_bo_free_kernel(&adev->fw_vram_usage.reserved_bo,
> -		NULL, &adev->fw_vram_usage.va);
> +	amdgpu_bo_free_kernel(&adev->mman.fw_vram_usage.reserved_bo,
> +		NULL, &adev->mman.fw_vram_usage.va);
>   }
>   
>   /**
> @@ -1781,19 +1781,19 @@ static int amdgpu_ttm_fw_reserve_vram_init(struct amdgpu_device *adev)
>   {
>   	uint64_t vram_size = adev->gmc.visible_vram_size;
>   
> -	adev->fw_vram_usage.va = NULL;
> -	adev->fw_vram_usage.reserved_bo = NULL;
> +	adev->mman.fw_vram_usage.va = NULL;
> +	adev->mman.fw_vram_usage.reserved_bo = NULL;
>   
> -	if (adev->fw_vram_usage.size == 0 ||
> -	    adev->fw_vram_usage.size > vram_size)
> +	if (adev->mman.fw_vram_usage.size == 0 ||
> +	    adev->mman.fw_vram_usage.size > vram_size)
>   		return 0;
>   
>   	return amdgpu_bo_create_kernel_at(adev,
> -					  adev->fw_vram_usage.start_offset,
> -					  adev->fw_vram_usage.size,
> +					  adev->mman.fw_vram_usage.start_offset,
> +					  adev->mman.fw_vram_usage.size,
>   					  AMDGPU_GEM_DOMAIN_VRAM,
> -					  &adev->fw_vram_usage.reserved_bo,
> -					  &adev->fw_vram_usage.va);
> +					  &adev->mman.fw_vram_usage.reserved_bo,
> +					  &adev->mman.fw_vram_usage.va);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 6d7b83d967ce..95a513f7785f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -41,6 +41,16 @@
>   
>   #define AMDGPU_POISON	0xd0bed0be
>   
> +/*
> + * Firmware VRAM reservation
> + */
> +struct amdgpu_fw_vram_usage {
> +	u64 start_offset;
> +	u64 size;
> +	struct amdgpu_bo *reserved_bo;
> +	void *va;
> +};
> +

Maybe we should even inline the structure while doing so. I don't see 
the need for a separate struct here.

Christian.

>   struct amdgpu_mman {
>   	struct ttm_bo_device		bdev;
>   	bool				mem_global_referenced;
> @@ -70,6 +80,9 @@ struct amdgpu_mman {
>   	uint8_t				*discovery_bin;
>   	uint32_t			discovery_tmr_size;
>   	struct amdgpu_bo		*discovery_memory;
> +
> +	/* firmware VRAM reservation */
> +	struct amdgpu_fw_vram_usage fw_vram_usage;
>   };
>   
>   struct amdgpu_copy_mem {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 5cae39d35c04..816e086f00d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -401,7 +401,7 @@ static void amdgpu_virt_add_bad_page(struct amdgpu_device *adev,
>   	if (bp_block_size) {
>   		bp_cnt = bp_block_size / sizeof(uint64_t);
>   		for (bp_idx = 0; bp_idx < bp_cnt; bp_idx++) {
> -			retired_page = *(uint64_t *)(adev->fw_vram_usage.va +
> +			retired_page = *(uint64_t *)(adev->mman.fw_vram_usage.va +
>   					bp_block_offset + bp_idx * sizeof(uint64_t));
>   			bp.retired_page = retired_page;
>   
> @@ -428,10 +428,10 @@ void amdgpu_virt_init_data_exchange(struct amdgpu_device *adev)
>   	adev->virt.fw_reserve.p_pf2vf = NULL;
>   	adev->virt.fw_reserve.p_vf2pf = NULL;
>   
> -	if (adev->fw_vram_usage.va != NULL) {
> +	if (adev->mman.fw_vram_usage.va != NULL) {
>   		adev->virt.fw_reserve.p_pf2vf =
>   			(struct amd_sriov_msg_pf2vf_info_header *)(
> -			adev->fw_vram_usage.va + AMDGIM_DATAEXCHANGE_OFFSET);
> +			adev->mman.fw_vram_usage.va + AMDGIM_DATAEXCHANGE_OFFSET);
>   		AMDGPU_FW_VRAM_PF2VF_READ(adev, header.size, &pf2vf_size);
>   		AMDGPU_FW_VRAM_PF2VF_READ(adev, checksum, &checksum);
>   		AMDGPU_FW_VRAM_PF2VF_READ(adev, feature_flags, &adev->virt.gim_feature);

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
