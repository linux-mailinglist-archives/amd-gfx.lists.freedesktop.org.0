Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8B44D9FA2
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Mar 2022 17:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A188987C;
	Tue, 15 Mar 2022 16:09:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5027A8987C
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Mar 2022 16:09:36 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5ae8f9.dynamic.kabel-deutschland.de
 [95.90.232.249])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3354E61EA1927;
 Tue, 15 Mar 2022 17:09:34 +0100 (CET)
Message-ID: <39dcbcab-8a92-4a01-e355-6e37ac4f1ce6@molgen.mpg.de>
Date: Tue, 15 Mar 2022 17:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3] drm/amdgpu: add workarounds for VCN TMZ issue on
 CHIP_RAVEN
Content-Language: en-US
To: Lang Yu <Lang.Yu@amd.com>
References: <20220314024519.2201231-1-Lang.Yu@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220314024519.2201231-1-Lang.Yu@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Lang,


Am 14.03.22 um 03:45 schrieb Lang Yu:

Thank you for your patch. A shorter commit message summary would be:

 > drm/amdgpu: Work around VNC TMZ issue on CHIP_RAVEN

> It is a hardware issue that VCN can't handle a GTT
> backing stored TMZ buffer on CHIP_RAVEN series ASIC.

Where is that documented, and how can this be reproduced?

> Move such a TMZ buffer to VRAM domain before command
> submission as a wrokaround.

workaround

Please use a text width of 75 characters per line.

> v2:
>   - Use patch_cs_in_place callback.
> 
> v3:
>   - Bail out early if unsecure IBs.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 71 +++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> index 7bbb9ba6b80b..1ac9e06d3a4d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
> @@ -24,6 +24,7 @@
>   #include <linux/firmware.h>
>   
>   #include "amdgpu.h"
> +#include "amdgpu_cs.h"
>   #include "amdgpu_vcn.h"
>   #include "amdgpu_pm.h"
>   #include "soc15.h"
> @@ -1905,6 +1906,75 @@ static const struct amd_ip_funcs vcn_v1_0_ip_funcs = {
>   	.set_powergating_state = vcn_v1_0_set_powergating_state,
>   };
>   
> +/*
> + * It is a hardware issue that VCN can't handle a GTT TMZ buffer on
> + * CHIP_RAVEN series ASIC. Move such a GTT TMZ buffer to VRAM domain
> + * before command submission as a workaround.
> + */
> +static int vcn_v1_0_validate_bo(struct amdgpu_cs_parser *parser,
> +				struct amdgpu_job *job,
> +				uint64_t addr)
> +{
> +	struct ttm_operation_ctx ctx = { false, false };
> +	struct amdgpu_fpriv *fpriv = parser->filp->driver_priv;
> +	struct amdgpu_vm *vm = &fpriv->vm;
> +	struct amdgpu_bo_va_mapping *mapping;
> +	struct amdgpu_bo *bo;
> +	int r;
> +
> +	addr &= AMDGPU_GMC_HOLE_MASK;
> +	if (addr & 0x7) {
> +		DRM_ERROR("VCN messages must be 8 byte aligned!\n");
> +		return -EINVAL;
> +	}
> +
> +	mapping = amdgpu_vm_bo_lookup_mapping(vm, addr/AMDGPU_GPU_PAGE_SIZE);
> +	if (!mapping || !mapping->bo_va || !mapping->bo_va->base.bo)
> +		return -EINVAL;
> +
> +	bo = mapping->bo_va->base.bo;
> +	if (!(bo->flags & AMDGPU_GEM_CREATE_ENCRYPTED))
> +		return 0;
> +
> +	amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_VRAM);
> +	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> +	if (r) {
> +		DRM_ERROR("Failed validating the VCN message BO (%d)!\n", r);

to validate

> +		return r;
> +	}
> +
> +	return r;
> +}
> +
> +static int vcn_v1_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
> +					   struct amdgpu_job *job,
> +					   struct amdgpu_ib *ib)
> +{
> +	uint32_t msg_lo = 0, msg_hi = 0;
> +	int i, r;

Use unsigned int for the counter variable?

> +
> +	if (!(ib->flags & AMDGPU_IB_FLAGS_SECURE))
> +		return 0;
> +
> +	for (i = 0; i < ib->length_dw; i += 2) {
> +		uint32_t reg = amdgpu_ib_get_value(ib, i);
> +		uint32_t val = amdgpu_ib_get_value(ib, i + 1);
> +
> +		if (reg == PACKET0(p->adev->vcn.internal.data0, 0)) {
> +			msg_lo = val;
> +		} else if (reg == PACKET0(p->adev->vcn.internal.data1, 0)) {
> +			msg_hi = val;
> +		} else if (reg == PACKET0(p->adev->vcn.internal.cmd, 0)) {
> +			r = vcn_v1_0_validate_bo(p, job,
> +						 ((u64)msg_hi) << 32 | msg_lo);
> +			if (r)
> +				return r;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
>   	.type = AMDGPU_RING_TYPE_VCN_DEC,
>   	.align_mask = 0xf,
> @@ -1914,6 +1984,7 @@ static const struct amdgpu_ring_funcs vcn_v1_0_dec_ring_vm_funcs = {
>   	.get_rptr = vcn_v1_0_dec_ring_get_rptr,
>   	.get_wptr = vcn_v1_0_dec_ring_get_wptr,
>   	.set_wptr = vcn_v1_0_dec_ring_set_wptr,
> +	.patch_cs_in_place = vcn_v1_0_ring_patch_cs_in_place,
>   	.emit_frame_size =
>   		6 + 6 + /* hdp invalidate / flush */
>   		SOC15_FLUSH_GPU_TLB_NUM_WREG * 6 +


Kind regards,

Paul
