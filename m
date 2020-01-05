Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C15D41308D5
	for <lists+amd-gfx@lfdr.de>; Sun,  5 Jan 2020 16:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DADB89A75;
	Sun,  5 Jan 2020 15:41:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF6889A75
 for <amd-gfx@lists.freedesktop.org>; Sun,  5 Jan 2020 15:41:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u2so12823887wmc.3
 for <amd-gfx@lists.freedesktop.org>; Sun, 05 Jan 2020 07:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LHpie9FvOWN4RoWRYsX80eIojbix9t057leLR56+E+8=;
 b=jS+AYpDQYRysJ1QSKt4TKLkUDlId951wLvcDfj2Lh1E3HhXPNF5j2S9P6LaYAsPdri
 A1DccEcqmuvJ72U86xhiKv0DIFrq8cj7zvhjTpeNHmv/Q8Dk5IZqhv7+7Z/Nhlb4Qqn7
 6deVrFaaWHpC13ScTZ7OWLpv1DMX2SnXAIERe8gC1rjL4Kms5KfLDOZomw8bVKtTSCGH
 jdZlLcK+aSNYMQsMLZm43g4tlYTiQYiPWoWXhwzKJIQ2TvtMsl4JeHrU+9UoUKRpPxH1
 X7C4ybvbtrAbzC+FicSphmIPO4TGeNwICmq2KV7aO/IpSMoYZLWX+muwr5fKFUptf3sD
 INbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LHpie9FvOWN4RoWRYsX80eIojbix9t057leLR56+E+8=;
 b=twaOHry3OlnJZ7GFUrO+uyxd7YeipiigIMT1+825i7ObdRZgmUwTJc8Hg8lML32Zho
 W0QnS/2i7WLVRjhvF7WBgqn58CMFQviC6tvHPqc9AKsOsT1yYRN7EgasGxrKhhDtT3GN
 Ym0EZzSJabrnaFZujJ51S79p5malGpF49KrUBPGHYdTQ9ipu1dzkEL55/yBjGa0IGolI
 tVVqDmTZCiz4vcb2f0R1ru0r/kI+H3jZdXq2g+mugunvLZwdyyiZmT9VN9PbzS9xmOZw
 4QbmwkgtoB0aQbwWb3onrKA1VqZ0lGwLo7kq5BDbG7Uc/bL722OAwJDstLIzBK+BSX5B
 GjaQ==
X-Gm-Message-State: APjAAAWJNo8DtcOjHRsH/yQh5NtJFdE29x4pYg8S5ITAwcG6hQNoJ5Kl
 afl0MBaer/M8m3HNjL6yUMRRKzKA
X-Google-Smtp-Source: APXvYqzH74CXSnnocyYS+IQChbDKYPqFMnlfMvrmD5VR17EfHqh2aqzV1Kou0U4uRX8p/LbFEoW5PQ==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr29803534wmi.60.1578238866021; 
 Sun, 05 Jan 2020 07:41:06 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id a184sm19944803wmf.29.2020.01.05.07.41.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 Jan 2020 07:41:05 -0800 (PST)
Subject: Re: [PATCH 2/5] drm/amdgpu: export function to flush TLB via pasid
To: Alex Sierra <alex.sierra@amd.com>, amd-gfx@lists.freedesktop.org
References: <20191220062442.33635-1-alex.sierra@amd.com>
 <20191220062442.33635-2-alex.sierra@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f80f87d2-0422-176a-b55f-7805d02f6af2@gmail.com>
Date: Sun, 5 Jan 2020 16:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191220062442.33635-2-alex.sierra@amd.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 20.12.19 um 07:24 schrieb Alex Sierra:
> This can be used directly from amdgpu and amdkfd to invalidate
> TLB through pasid.
> It supports gmc v7, v8, v9 and v10.
>
> Change-Id: I6563a8eba2e42d1a67fa2547156c20da41d1e490
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  6 ++
>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c  | 81 ++++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c   | 33 ++++++++++
>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   | 34 ++++++++++
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 84 +++++++++++++++++++++++++
>   5 files changed, 238 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> index b499a3de8bb6..b6413a56f546 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> @@ -92,6 +92,9 @@ struct amdgpu_gmc_funcs {
>   	/* flush the vm tlb via mmio */
>   	void (*flush_gpu_tlb)(struct amdgpu_device *adev, uint32_t vmid,
>   				uint32_t vmhub, uint32_t flush_type);
> +	/* flush the vm tlb via pasid */
> +	int (*flush_gpu_tlb_pasid)(struct amdgpu_device *adev, uint16_t pasid,
> +					uint32_t flush_type, bool all_hub);
>   	/* flush the vm tlb via ring */
>   	uint64_t (*emit_flush_gpu_tlb)(struct amdgpu_ring *ring, unsigned vmid,
>   				       uint64_t pd_addr);
> @@ -216,6 +219,9 @@ struct amdgpu_gmc {
>   };
>   
>   #define amdgpu_gmc_flush_gpu_tlb(adev, vmid, vmhub, type) ((adev)->gmc.gmc_funcs->flush_gpu_tlb((adev), (vmid), (vmhub), (type)))
> +#define amdgpu_gmc_flush_gpu_tlb_pasid(adev, pasid, type, allhub) \
> +	((adev)->gmc.gmc_funcs->flush_gpu_tlb_pasid \
> +	((adev), (pasid), (type), (allhub)))
>   #define amdgpu_gmc_emit_flush_gpu_tlb(r, vmid, addr) (r)->adev->gmc.gmc_funcs->emit_flush_gpu_tlb((r), (vmid), (addr))
>   #define amdgpu_gmc_emit_pasid_mapping(r, vmid, pasid) (r)->adev->gmc.gmc_funcs->emit_pasid_mapping((r), (vmid), (pasid))
>   #define amdgpu_gmc_map_mtype(adev, flags) (adev)->gmc.gmc_funcs->map_mtype((adev),(flags))
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> index f5725336a5f2..b1a5408a8d7e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> @@ -30,6 +30,8 @@
>   #include "hdp/hdp_5_0_0_sh_mask.h"
>   #include "gc/gc_10_1_0_sh_mask.h"
>   #include "mmhub/mmhub_2_0_0_sh_mask.h"
> +#include "athub/athub_2_0_0_sh_mask.h"
> +#include "athub/athub_2_0_0_offset.h"
>   #include "dcn/dcn_2_0_0_offset.h"
>   #include "dcn/dcn_2_0_0_sh_mask.h"
>   #include "oss/osssys_5_0_0_offset.h"
> @@ -37,6 +39,7 @@
>   #include "navi10_enum.h"
>   
>   #include "soc15.h"
> +#include "soc15d.h"
>   #include "soc15_common.h"
>   
>   #include "nbio_v2_3.h"
> @@ -234,6 +237,48 @@ static bool gmc_v10_0_use_invalidate_semaphore(struct amdgpu_device *adev,
>   		(!amdgpu_sriov_vf(adev)));
>   }
>   
> +static bool gmc_v10_0_get_atc_vmid_pasid_mapping_info(
> +					struct amdgpu_device *adev,
> +					uint8_t vmid, uint16_t *p_pasid)
> +{
> +	uint32_t value;
> +
> +	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
> +		     + vmid);
> +	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
> +
> +	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
> +}
> +
> +static int gmc_v10_0_invalidate_tlbs_with_kiq(struct amdgpu_device *adev,
> +					uint16_t pasid, uint32_t flush_type,
> +					bool all_hub)
> +{
> +	signed long r;
> +	uint32_t seq;
> +	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
> +
> +	spin_lock(&adev->gfx.kiq.ring_lock);
> +	amdgpu_ring_alloc(ring, 12); /* fence + invalidate_tlbs package*/
> +	amdgpu_ring_write(ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
> +	amdgpu_ring_write(ring,
> +			PACKET3_INVALIDATE_TLBS_DST_SEL(1) |
> +			PACKET3_INVALIDATE_TLBS_ALL_HUB(all_hub) |
> +			PACKET3_INVALIDATE_TLBS_PASID(pasid) |
> +			PACKET3_INVALIDATE_TLBS_FLUSH_TYPE(flush_type));
> +	amdgpu_fence_emit_polling(ring, &seq);
> +	amdgpu_ring_commit(ring);
> +	spin_unlock(&adev->gfx.kiq.ring_lock);
> +
> +	r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
> +	if (r < 1) {
> +		DRM_ERROR("wait for kiq fence error: %ld.\n", r);
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * GART
>    * VMID 0 is the physical GPU addresses as used by the kernel.
> @@ -380,6 +425,41 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	DRM_ERROR("Error flushing GPU TLB using the SDMA (%d)!\n", r);
>   }
>   
> +/**
> + * gmc_v10_0_flush_gpu_tlb_pasid - tlb flush via pasid
> + *
> + * @adev: amdgpu_device pointer
> + * @pasid: pasid to be flush
> + *
> + * Flush the TLB for the requested pasid.
> + */
> +static int gmc_v10_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
> +					uint16_t pasid, uint32_t flush_type,
> +					bool all_hub)
> +{
> +	int vmid;
> +	uint16_t queried_pasid;
> +	bool ret;
> +	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
> +
> +	if (amdgpu_emu_mode == 0 && ring->sched.ready)
> +		return gmc_v10_0_invalidate_tlbs_with_kiq(adev,
> +						pasid, flush_type, all_hub);
> +
> +	for (vmid = 1; vmid < 16; vmid++) {
> +
> +		ret = gmc_v10_0_get_atc_vmid_pasid_mapping_info(adev, vmid,
> +				&queried_pasid);
> +		if (ret	&& queried_pasid == pasid) {
> +			amdgpu_gmc_flush_gpu_tlb(adev, vmid,
> +					AMDGPU_GFXHUB_0, 0);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static uint64_t gmc_v10_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
>   					     unsigned vmid, uint64_t pd_addr)
>   {
> @@ -531,6 +611,7 @@ static void gmc_v10_0_get_vm_pte(struct amdgpu_device *adev,
>   
>   static const struct amdgpu_gmc_funcs gmc_v10_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v10_0_flush_gpu_tlb,
> +	.flush_gpu_tlb_pasid = gmc_v10_0_flush_gpu_tlb_pasid,
>   	.emit_flush_gpu_tlb = gmc_v10_0_emit_flush_gpu_tlb,
>   	.emit_pasid_mapping = gmc_v10_0_emit_pasid_mapping,
>   	.map_mtype = gmc_v10_0_map_mtype,
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> index f08e5330642d..19d5b133e1d7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> @@ -418,6 +418,38 @@ static int gmc_v7_0_mc_init(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> +/**
> + * gmc_v7_0_flush_gpu_tlb_pasid - tlb flush via pasid
> + *
> + * @adev: amdgpu_device pointer
> + * @pasid: pasid to be flush
> + *
> + * Flush the TLB for the requested pasid.
> + */
> +static int gmc_v7_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
> +					uint16_t pasid, uint32_t flush_type,
> +					bool all_hub)
> +{
> +	int vmid;
> +	unsigned int tmp;
> +
> +	if (adev->in_gpu_reset)
> +		return -EIO;
> +
> +	for (vmid = 1; vmid < 16; vmid++) {
> +
> +		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
> +		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
> +			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
> +			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
> +			RREG32(mmVM_INVALIDATE_RESPONSE);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * GART
>    * VMID 0 is the physical GPU addresses as used by the kernel.
> @@ -1333,6 +1365,7 @@ static const struct amd_ip_funcs gmc_v7_0_ip_funcs = {
>   
>   static const struct amdgpu_gmc_funcs gmc_v7_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v7_0_flush_gpu_tlb,
> +	.flush_gpu_tlb_pasid = gmc_v7_0_flush_gpu_tlb_pasid,
>   	.emit_flush_gpu_tlb = gmc_v7_0_emit_flush_gpu_tlb,
>   	.emit_pasid_mapping = gmc_v7_0_emit_pasid_mapping,
>   	.set_prt = gmc_v7_0_set_prt,
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> index 6d96d40fbcb8..27d83204fa2b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> @@ -620,6 +620,39 @@ static int gmc_v8_0_mc_init(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> +/**
> + * gmc_v8_0_flush_gpu_tlb_pasid - tlb flush via pasid
> + *
> + * @adev: amdgpu_device pointer
> + * @pasid: pasid to be flush
> + *
> + * Flush the TLB for the requested pasid.
> + */
> +static int gmc_v8_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
> +					uint16_t pasid, uint32_t flush_type,
> +					bool all_hub)
> +{
> +	int vmid;
> +	unsigned int tmp;
> +
> +	if (adev->in_gpu_reset)
> +		return -EIO;
> +
> +	for (vmid = 1; vmid < 16; vmid++) {
> +
> +		tmp = RREG32(mmATC_VMID0_PASID_MAPPING + vmid);
> +		if ((tmp & ATC_VMID0_PASID_MAPPING__VALID_MASK) &&
> +			(tmp & ATC_VMID0_PASID_MAPPING__PASID_MASK) == pasid) {
> +			WREG32(mmVM_INVALIDATE_REQUEST, 1 << vmid);
> +			RREG32(mmVM_INVALIDATE_RESPONSE);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +
> +}
> +
>   /*
>    * GART
>    * VMID 0 is the physical GPU addresses as used by the kernel.
> @@ -1700,6 +1733,7 @@ static const struct amd_ip_funcs gmc_v8_0_ip_funcs = {
>   
>   static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v8_0_flush_gpu_tlb,
> +	.flush_gpu_tlb_pasid = gmc_v8_0_flush_gpu_tlb_pasid,
>   	.emit_flush_gpu_tlb = gmc_v8_0_emit_flush_gpu_tlb,
>   	.emit_pasid_mapping = gmc_v8_0_emit_pasid_mapping,
>   	.set_prt = gmc_v8_0_set_prt,
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index fa025ceeea0f..eb1e64bd56ed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -38,10 +38,12 @@
>   #include "dce/dce_12_0_sh_mask.h"
>   #include "vega10_enum.h"
>   #include "mmhub/mmhub_1_0_offset.h"
> +#include "athub/athub_1_0_sh_mask.h"
>   #include "athub/athub_1_0_offset.h"
>   #include "oss/osssys_4_0_offset.h"
>   
>   #include "soc15.h"
> +#include "soc15d.h"
>   #include "soc15_common.h"
>   #include "umc/umc_6_0_sh_mask.h"
>   
> @@ -434,6 +436,47 @@ static bool gmc_v9_0_use_invalidate_semaphore(struct amdgpu_device *adev,
>   		   adev->pdev->device == 0x15d8)));
>   }
>   
> +static bool gmc_v9_0_get_atc_vmid_pasid_mapping_info(struct amdgpu_device *adev,
> +					uint8_t vmid, uint16_t *p_pasid)
> +{
> +	uint32_t value;
> +
> +	value = RREG32(SOC15_REG_OFFSET(ATHUB, 0, mmATC_VMID0_PASID_MAPPING)
> +		     + vmid);
> +	*p_pasid = value & ATC_VMID0_PASID_MAPPING__PASID_MASK;
> +
> +	return !!(value & ATC_VMID0_PASID_MAPPING__VALID_MASK);
> +}

Probably better to expose just this function in the GMC interface.

> +
> +static int gmc_v9_0_invalidate_tlbs_with_kiq(struct amdgpu_device *adev,
> +				uint16_t pasid, uint32_t flush_type,
> +				bool all_hub)
> +{
> +	signed long r;
> +	uint32_t seq;
> +	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
> +
> +	spin_lock(&adev->gfx.kiq.ring_lock);
> +	amdgpu_ring_alloc(ring, 12); /* fence + invalidate_tlbs package*/
> +	amdgpu_ring_write(ring, PACKET3(PACKET3_INVALIDATE_TLBS, 0));
> +	amdgpu_ring_write(ring,
> +			PACKET3_INVALIDATE_TLBS_DST_SEL(1) |
> +			PACKET3_INVALIDATE_TLBS_ALL_HUB(all_hub) |
> +			PACKET3_INVALIDATE_TLBS_PASID(pasid) |
> +			PACKET3_INVALIDATE_TLBS_FLUSH_TYPE(flush_type));

That stuff is completely unrelated to the GMC and shouldn't be added here.

Christian.

> +	amdgpu_fence_emit_polling(ring, &seq);
> +	amdgpu_ring_commit(ring);
> +	spin_unlock(&adev->gfx.kiq.ring_lock);
> +
> +	r = amdgpu_fence_wait_polling(ring, seq, adev->usec_timeout);
> +	if (r < 1) {
> +		DRM_ERROR("wait for kiq fence error: %ld.\n", r);
> +		return -ETIME;
> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * GART
>    * VMID 0 is the physical GPU addresses as used by the kernel.
> @@ -532,6 +575,46 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   	DRM_ERROR("Timeout waiting for VM flush ACK!\n");
>   }
>   
> +/**
> + * gmc_v9_0_flush_gpu_tlb_pasid - tlb flush via pasid
> + *
> + * @adev: amdgpu_device pointer
> + * @pasid: pasid to be flush
> + *
> + * Flush the TLB for the requested pasid.
> + */
> +static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
> +					uint16_t pasid, uint32_t flush_type,
> +					bool all_hub)
> +{
> +	int vmid, i;
> +	uint16_t queried_pasid;
> +	bool ret;
> +	struct amdgpu_ring *ring = &adev->gfx.kiq.ring;
> +
> +	if (adev->in_gpu_reset)
> +		return -EIO;
> +
> +	if (ring->sched.ready)
> +		return gmc_v9_0_invalidate_tlbs_with_kiq(adev,
> +						pasid, flush_type, all_hub);
> +
> +	for (vmid = 1; vmid < 16; vmid++) {
> +
> +		ret = gmc_v9_0_get_atc_vmid_pasid_mapping_info(adev, vmid,
> +				&queried_pasid);
> +		if (ret && queried_pasid == pasid) {
> +			for (i = 0; i < adev->num_vmhubs; i++)
> +				amdgpu_gmc_flush_gpu_tlb(adev, vmid,
> +							i, flush_type);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +
> +}
> +
>   static uint64_t gmc_v9_0_emit_flush_gpu_tlb(struct amdgpu_ring *ring,
>   					    unsigned vmid, uint64_t pd_addr)
>   {
> @@ -693,6 +776,7 @@ static void gmc_v9_0_get_vm_pte(struct amdgpu_device *adev,
>   
>   static const struct amdgpu_gmc_funcs gmc_v9_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v9_0_flush_gpu_tlb,
> +	.flush_gpu_tlb_pasid = gmc_v9_0_flush_gpu_tlb_pasid,
>   	.emit_flush_gpu_tlb = gmc_v9_0_emit_flush_gpu_tlb,
>   	.emit_pasid_mapping = gmc_v9_0_emit_pasid_mapping,
>   	.map_mtype = gmc_v9_0_map_mtype,

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
