Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131CA914684
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2024 11:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F410E147;
	Mon, 24 Jun 2024 09:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BaayKoYs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FFF10E147
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2024 09:35:26 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-421820fc26dso34312275e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2024 02:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719221725; x=1719826525; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g7oZoDQtYu3LpVefBmXC1WU7O8gmgkenFTffSYFYpaA=;
 b=BaayKoYsXTmy8zTft7+L8SYm7XjhdtwzQ64IzzIOzhbmxt8iMApi7mp//UkahNjGxd
 3m3lw9MjiEab6J9SQ/DDg0y+ZZ83rw2pp3ztF1CDL1nacsMUSX/gZrK57FjPx/+rlqRd
 6TmADQdjV1LWxiBrxzXOLv3INKESaDHj+/RBGOELfoLeNEDChD9dSJe/V0BNmGCOijDR
 /DQNOU7UWu91zC67H6a15+G9bcgbH1dYaAHpbwnV6os5zg6gybSAVUD0ZCi63yE7Nk3N
 iSyli7h+B/RmoysIRVicoQkamT0OlJCzQPe57HPG83OOMnKPsVnrVptKYrhbaeakUKqT
 hRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719221725; x=1719826525;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g7oZoDQtYu3LpVefBmXC1WU7O8gmgkenFTffSYFYpaA=;
 b=V1866U+xm+qM9HUYCe1Wyfvp7Btt57RId7qgy7DH2xwordHINQ6PqR/2iN8cZcvJAm
 DYyU6IXNKnBXvO7NBJCABAQtcgK0V55DPlV7RCoYv7UJG9cTsiqOKBMnLUlbBZl8XIQe
 2dJZf5LS/H4lRLl47PExmwvKlJMUQqKY5AyZUcCiXjy2awCiuZIXNT57n6CWCNgDOU6M
 Aw/2KuhBWMJdWij7+2fgB4z+eFJf6RDkXPrKcHf2d1FYF9sjymvl3qDubCvLs1awmI+J
 4yqcXZwXm/mumU7thJIB512B9O6rUmvnQ56uLkZ2AOwg2ytVPFHHa3qSLlS546cbPPQf
 zdkg==
X-Gm-Message-State: AOJu0YwvFcpZWV5Ziuto7O4u4rA44A+vXotSXY0Dcr6Ta2u+JLGdaLA/
 vVstwz9r8lXGeR2PscHXLs/IUlThGdGxJK8B9RZ84+ebYuGI0dlK
X-Google-Smtp-Source: AGHT+IH96EchLNwmuHy3XzVwgVsRrN+aAzmsvK8IDDQRH6XZ/0Yn9VdemOizxE9mvZ6fUmnsS5rFWw==
X-Received: by 2002:a05:600c:8a6:b0:421:819c:5d6b with SMTP id
 5b1f17b1804b1-4248b980b2fmr40009645e9.23.1719221724787; 
 Mon, 24 Jun 2024 02:35:24 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d3c5sm133401975e9.8.2024.06.24.02.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 02:35:24 -0700 (PDT)
Message-ID: <951495e9-06b3-4455-a394-e3a6312872dc@gmail.com>
Date: Mon, 24 Jun 2024 11:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: normalize registers as local xcc to
 read/write under sriov in TLB flush
To: Jane Jian <Jane.Jian@amd.com>, Lijo.Lazar@amd.com, Haijun.Chang@amd.com,
 Victor.Zhao@amd.com
Cc: amd-gfx@lists.freedesktop.org
References: <20240624091318.2487733-1-Jane.Jian@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240624091318.2487733-1-Jane.Jian@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 24.06.24 um 11:13 schrieb Jane Jian:
> [WHY]
> sriov has the higher bit violation when flushing tlb
>
> [HOW]
> normalize the registers to keep lower 16-bit(dword aligned) to aviod higher bit violation
> RLCG will mask xcd out and always assume it's accessing its own xcd
>
> [TODO]
> later will add the normalization in sriovw/rreg after fixing bugs
>
> v2
> rename the normalized macro, add ip block type for further use
> move asics func declaration after ip block type since new func refers ip block type
> add normalization in emit flush tlb as well
>
> v3
> declare the new func in the asic specific header
>
> Signed-off-by: Jane Jian <Jane.Jian@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 112 +++++++++++----------
>   drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c |  17 ++++
>   drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.h |  28 ++++++
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c      |  32 ++++--
>   drivers/gpu/drm/amd/amdgpu/soc15.c         |   2 +
>   drivers/gpu/drm/amd/amdgpu/soc15_common.h  |   5 +-
>   6 files changed, 130 insertions(+), 66 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 083f353cff6e..070fd9e601fe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -583,61 +583,6 @@ struct amdgpu_video_codecs {
>   	const struct amdgpu_video_codec_info *codec_array;
>   };
>   
> -/*
> - * ASIC specific functions.
> - */
> -struct amdgpu_asic_funcs {
> -	bool (*read_disabled_bios)(struct amdgpu_device *adev);
> -	bool (*read_bios_from_rom)(struct amdgpu_device *adev,
> -				   u8 *bios, u32 length_bytes);
> -	int (*read_register)(struct amdgpu_device *adev, u32 se_num,
> -			     u32 sh_num, u32 reg_offset, u32 *value);
> -	void (*set_vga_state)(struct amdgpu_device *adev, bool state);
> -	int (*reset)(struct amdgpu_device *adev);
> -	enum amd_reset_method (*reset_method)(struct amdgpu_device *adev);
> -	/* get the reference clock */
> -	u32 (*get_xclk)(struct amdgpu_device *adev);
> -	/* MM block clocks */
> -	int (*set_uvd_clocks)(struct amdgpu_device *adev, u32 vclk, u32 dclk);
> -	int (*set_vce_clocks)(struct amdgpu_device *adev, u32 evclk, u32 ecclk);
> -	/* static power management */
> -	int (*get_pcie_lanes)(struct amdgpu_device *adev);
> -	void (*set_pcie_lanes)(struct amdgpu_device *adev, int lanes);
> -	/* get config memsize register */
> -	u32 (*get_config_memsize)(struct amdgpu_device *adev);
> -	/* flush hdp write queue */
> -	void (*flush_hdp)(struct amdgpu_device *adev, struct amdgpu_ring *ring);
> -	/* invalidate hdp read cache */
> -	void (*invalidate_hdp)(struct amdgpu_device *adev,
> -			       struct amdgpu_ring *ring);
> -	/* check if the asic needs a full reset of if soft reset will work */
> -	bool (*need_full_reset)(struct amdgpu_device *adev);
> -	/* initialize doorbell layout for specific asic*/
> -	void (*init_doorbell_index)(struct amdgpu_device *adev);
> -	/* PCIe bandwidth usage */
> -	void (*get_pcie_usage)(struct amdgpu_device *adev, uint64_t *count0,
> -			       uint64_t *count1);
> -	/* do we need to reset the asic at init time (e.g., kexec) */
> -	bool (*need_reset_on_init)(struct amdgpu_device *adev);
> -	/* PCIe replay counter */
> -	uint64_t (*get_pcie_replay_count)(struct amdgpu_device *adev);
> -	/* device supports BACO */
> -	int (*supports_baco)(struct amdgpu_device *adev);
> -	/* pre asic_init quirks */
> -	void (*pre_asic_init)(struct amdgpu_device *adev);
> -	/* enter/exit umd stable pstate */
> -	int (*update_umd_stable_pstate)(struct amdgpu_device *adev, bool enter);
> -	/* query video codecs */
> -	int (*query_video_codecs)(struct amdgpu_device *adev, bool encode,
> -				  const struct amdgpu_video_codecs **codecs);
> -	/* encode "> 32bits" smn addressing */
> -	u64 (*encode_ext_smn_addressing)(int ext_id);
> -
> -	ssize_t (*get_reg_state)(struct amdgpu_device *adev,
> -				 enum amdgpu_reg_state reg_state, void *buf,
> -				 size_t max_size);
> -};
> -
>   /*
>    * IOCTL.
>    */
> @@ -728,6 +673,63 @@ enum amd_hw_ip_block_type {
>   	MAX_HWIP
>   };
>   
> +/*
> + * ASIC specific functions.
> + */
> +struct amdgpu_asic_funcs {
> +	bool (*read_disabled_bios)(struct amdgpu_device *adev);
> +	bool (*read_bios_from_rom)(struct amdgpu_device *adev,
> +				   u8 *bios, u32 length_bytes);
> +	int (*read_register)(struct amdgpu_device *adev, u32 se_num,
> +			     u32 sh_num, u32 reg_offset, u32 *value);
> +	void (*set_vga_state)(struct amdgpu_device *adev, bool state);
> +	int (*reset)(struct amdgpu_device *adev);
> +	enum amd_reset_method (*reset_method)(struct amdgpu_device *adev);
> +	/* get the reference clock */
> +	u32 (*get_xclk)(struct amdgpu_device *adev);
> +	/* MM block clocks */
> +	int (*set_uvd_clocks)(struct amdgpu_device *adev, u32 vclk, u32 dclk);
> +	int (*set_vce_clocks)(struct amdgpu_device *adev, u32 evclk, u32 ecclk);
> +	/* static power management */
> +	int (*get_pcie_lanes)(struct amdgpu_device *adev);
> +	void (*set_pcie_lanes)(struct amdgpu_device *adev, int lanes);
> +	/* get config memsize register */
> +	u32 (*get_config_memsize)(struct amdgpu_device *adev);
> +	/* flush hdp write queue */
> +	void (*flush_hdp)(struct amdgpu_device *adev, struct amdgpu_ring *ring);
> +	/* invalidate hdp read cache */
> +	void (*invalidate_hdp)(struct amdgpu_device *adev,
> +			       struct amdgpu_ring *ring);
> +	/* check if the asic needs a full reset of if soft reset will work */
> +	bool (*need_full_reset)(struct amdgpu_device *adev);
> +	/* initialize doorbell layout for specific asic*/
> +	void (*init_doorbell_index)(struct amdgpu_device *adev);
> +	/* PCIe bandwidth usage */
> +	void (*get_pcie_usage)(struct amdgpu_device *adev, uint64_t *count0,
> +			       uint64_t *count1);
> +	/* do we need to reset the asic at init time (e.g., kexec) */
> +	bool (*need_reset_on_init)(struct amdgpu_device *adev);
> +	/* PCIe replay counter */
> +	uint64_t (*get_pcie_replay_count)(struct amdgpu_device *adev);
> +	/* device supports BACO */
> +	int (*supports_baco)(struct amdgpu_device *adev);
> +	/* pre asic_init quirks */
> +	void (*pre_asic_init)(struct amdgpu_device *adev);
> +	/* enter/exit umd stable pstate */
> +	int (*update_umd_stable_pstate)(struct amdgpu_device *adev, bool enter);
> +	/* query video codecs */
> +	int (*query_video_codecs)(struct amdgpu_device *adev, bool encode,
> +				  const struct amdgpu_video_codecs **codecs);
> +	/* encode "> 32bits" smn addressing */
> +	u64 (*encode_ext_smn_addressing)(int ext_id);
> +
> +	ssize_t (*get_reg_state)(struct amdgpu_device *adev,
> +				 enum amdgpu_reg_state reg_state, void *buf,
> +				 size_t max_size);
> +	/* normalize offset to keep in lower 16-bit */
> +	u32 (*normalize_reg_offset)(enum amd_hw_ip_block_type hwip, u32 offset);
> +};
> +

Why are you moving this definition around?

Regards,
Christian.

>   #define HWIP_MAX_INSTANCE	44
>   
>   #define HW_ID_MAX		300
> diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
> index 2c9a0aa41e2d..7cdd4b9d08ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
> +++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c
> @@ -29,6 +29,7 @@
>   #include "gfx_v9_4_3.h"
>   #include "gfxhub_v1_2.h"
>   #include "sdma_v4_4_2.h"
> +#include "aqua_vanjaram.h"
>   
>   #define XCP_INST_MASK(num_inst, xcp_id)                                        \
>   	(num_inst ? GENMASK(num_inst - 1, 0) << (xcp_id * num_inst) : 0)
> @@ -1085,3 +1086,19 @@ ssize_t aqua_vanjaram_get_reg_state(struct amdgpu_device *adev,
>   
>   	return size;
>   }
> +
> +u32 aqua_vanjaram_normalize_reg_offset(enum amd_hw_ip_block_type hwip, u32 offset)
> +{
> +	u32 normalized_offset;
> +
> +	switch (hwip) {
> +	case GC_HWIP:
> +		normalized_offset = offset & 0xffff;
> +		break;
> +	default:
> +		normalized_offset = offset;
> +		break;
> +	}
> +
> +	return normalized_offset;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.h b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.h
> new file mode 100644
> index 000000000000..8d1b7a89cb71
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.h
> @@ -0,0 +1,28 @@
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +#ifndef __AQUA_VANJARAM_H__
> +#define __AQUA_VANJARAM_H__
> +
> +u32 aqua_vanjaram_normalize_reg_offset(enum amd_hw_ip_block_type hwip, u32 offset);
> +
> +#endif
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 88b4644f8e96..19e4429db37c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -853,8 +853,12 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	 */
>   	if (adev->gfx.kiq[inst].ring.sched.ready &&
>   	    (amdgpu_sriov_runtime(adev) || !amdgpu_sriov_vf(adev))) {
> -		uint32_t req = hub->vm_inv_eng0_req + hub->eng_distance * eng;
> -		uint32_t ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
> +
> +		/* Select lower 16 bits to write in local xcc */
> +		if (AMDGPU_IS_GFXHUB(vmhub)) {
> +			req = NORMALIZE_XCC_REG_OFFSET(req);
> +			ack = NORMALIZE_XCC_REG_OFFSET(ack);
> +		}
>   
>   		amdgpu_gmc_fw_reg_write_reg_wait(adev, req, ack, inv_req,
>   						 1 << vmid, inst);
> @@ -979,6 +983,7 @@ static uint64_t gmc_v9_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
>   	struct amdgpu_vmhub *hub = &adev->vmhub[ring->vm_hub];
>   	uint32_t req = gmc_v9_0_get_invalidate_req(vmid, 0);
>   	unsigned int eng = ring->vm_inv_eng;
> +	u32 low_distance, high_distance, req_offset, ack;
>   
>   	/*
>   	 * It may lose gpuvm invalidate acknowldege state across power-gating
> @@ -986,7 +991,18 @@ static uint64_t gmc_v9_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
>   	 * release after invalidation to avoid entering power gated state
>   	 * to WA the Issue
>   	 */
> +	low_distance = hub->ctx0_ptb_addr_lo32 + (hub->ctx_addr_distance * vmid);
> +	high_distance = hub->ctx0_ptb_addr_hi32 + (hub->ctx_addr_distance * vmid);
> +	req_offset = hub->vm_inv_eng0_req + hub->eng_distance * eng;
> +	ack = hub->vm_inv_eng0_ack + hub->eng_distance * eng;
>   
> +	/* Select lower 16 bits to write in local xcc */
> +	if (AMDGPU_IS_GFXHUB(ring->vm_hub)) {
> +		low_distance = NORMALIZE_XCC_REG_OFFSET(low_distance);
> +		high_distance = NORMALIZE_XCC_REG_OFFSET(high_distance);
> +		req_offset = NORMALIZE_XCC_REG_OFFSET(req_offset);
> +		ack = NORMALIZE_XCC_REG_OFFSET(ack);
> +	}
>   	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
>   	if (use_semaphore)
>   		/* a read return value of 1 means semaphore acuqire */
> @@ -994,18 +1010,14 @@ static uint64_t gmc_v9_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
>   					  hub->vm_inv_eng0_sem +
>   					  hub->eng_distance * eng, 0x1, 0x1);
>   
> -	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_lo32 +
> -			      (hub->ctx_addr_distance * vmid),
> +	amdgpu_ring_emit_wreg(ring, low_distance,
>   			      lower_32_bits(pd_addr));
>   
> -	amdgpu_ring_emit_wreg(ring, hub->ctx0_ptb_addr_hi32 +
> -			      (hub->ctx_addr_distance * vmid),
> +	amdgpu_ring_emit_wreg(ring, high_distance,
>   			      upper_32_bits(pd_addr));
>   
> -	amdgpu_ring_emit_reg_write_reg_wait(ring, hub->vm_inv_eng0_req +
> -					    hub->eng_distance * eng,
> -					    hub->vm_inv_eng0_ack +
> -					    hub->eng_distance * eng,
> +	amdgpu_ring_emit_reg_write_reg_wait(ring, req_offset,
> +					    ack,
>   					    req, 1 << vmid);
>   
>   	/* TODO: It needs to continue working on debugging with semaphore for GFXHUB as well. */
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
> index 8d16dacdc172..3a1fa2797f02 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.c
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
> @@ -78,6 +78,7 @@
>   #include "mxgpu_ai.h"
>   #include "amdgpu_ras.h"
>   #include "amdgpu_xgmi.h"
> +#include "aqua_vanjaram.h"
>   #include <uapi/linux/kfd_ioctl.h>
>   
>   #define mmMP0_MISC_CGTT_CTRL0                                                                   0x01b9
> @@ -927,6 +928,7 @@ static const struct amdgpu_asic_funcs aqua_vanjaram_asic_funcs =
>   	.query_video_codecs = &soc15_query_video_codecs,
>   	.encode_ext_smn_addressing = &aqua_vanjaram_encode_ext_smn_addressing,
>   	.get_reg_state = &aqua_vanjaram_get_reg_state,
> +	.normalize_reg_offset = &aqua_vanjaram_normalize_reg_offset,
>   };
>   
>   static int soc15_common_early_init(void *handle)
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15_common.h b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
> index 242b24f73c17..01afd1a24e8b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15_common.h
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
> @@ -210,4 +210,7 @@
>   #define WREG64_MCA(ext, mca_base, idx, val) \
>   	WREG64_PCIE_EXT(adev->asic_funcs->encode_ext_smn_addressing(ext) + mca_base + (idx * 8), val)
>   
> -#endif
> +#define NORMALIZE_XCC_REG_OFFSET(offset) \
> +	((amdgpu_sriov_vf(adev) && adev->asic_funcs->normalize_reg_offset) ? \
> +	adev->asic_funcs->normalize_reg_offset(GC_HWIP, offset) : offset)
> +#endif
> \ No newline at end of file

