Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB845420738
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Oct 2021 10:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B136E933;
	Mon,  4 Oct 2021 08:20:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53DF86E933
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Oct 2021 08:20:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id j27so12807198wms.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 04 Oct 2021 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=womy/LrBcLxG+1r7oSRB+t0JGA0dnn1OmJiyPfQdUGQ=;
 b=WYtyItEzalYlqyG0GPnq57boJqi0UkV0xk/OLGj7XhyrsA7SCbwT0KdduMS9NP3hau
 t9aqYfLyyOAXBjUA44w9T88jWen15bxEc8bod9DrQ6xYj3fxP7t4vLJgUVjBhSgagn8m
 HYY2GkbQPE8UyPhFcHaxSZ8/LmtVxEL0IehBo4Xr1BgDMhGZ66hN979IRVMnT8SwLBeA
 9us3Om4NaZUUkCtPdOAZE47osqvSodLoBiGk+7T/HblB8VWvLHjUiPeCYDpEtYEFSMXQ
 v6ZG2lmnvi7zFoFSlSoYf3rUSndhptkbuCGhBvOPug/93WYPUnvJCRcd28I/B8qe+4Mk
 tBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=womy/LrBcLxG+1r7oSRB+t0JGA0dnn1OmJiyPfQdUGQ=;
 b=eyVru9QNT5UxeoSe9SZlL+ul8LCv1ksNerFMz6csahF2sO7Ec+DLjRWbteXjYfxukT
 2i68jLCj9Atp52u4UhfUk7sztxxt55pFeOCK+uBpKxxhA6L6WsP0Ehc8Hbq0aApRFF9D
 t7RCWViB2SoVmXPLAzvJOsR0KNt5hsG01SAGXmKTwvCs/6rfezjJd3UD+s+pOkGLeBe5
 mY+E3s5RxvBQsJYmAn+QU9TkTjTYE2lmhi1Yxkg5tV3ZJVUCYJZCJZj9UsmQ1gNfXlPX
 bXoXvB8QHqrsxIOqeftjsiHfCV1Ly9ZuCkUqZMIXH9woqDMJNmIMyMSsni24/73ERbxV
 BmjQ==
X-Gm-Message-State: AOAM532BXtblDlFEghcmP9yWwlpkb27GPQ0j8dYyOF5rfunrheO51UjF
 wBtlFvqDdhALQPb446YFQyzAakUusEg=
X-Google-Smtp-Source: ABdhPJzQ1+/5gGEyhyeHdyzjv80OEexSWsreFOfHiEB0jR8Z3GTfbuJKqCxzZcvl03t3WpX//+tmyg==
X-Received: by 2002:a1c:2282:: with SMTP id i124mr414660wmi.164.1633335617687; 
 Mon, 04 Oct 2021 01:20:17 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id v23sm13570161wmj.4.2021.10.04.01.20.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:20:17 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/gmc9: convert to IP version checking
To: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
References: <20211001194822.1818798-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <784bfe0f-688b-8735-19c2-8388209bec1d@gmail.com>
Date: Mon, 4 Oct 2021 10:20:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211001194822.1818798-1-alexander.deucher@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 01.10.21 um 21:48 schrieb Alex Deucher:
> Use IP versions rather than asic_type to differentiate
> IP version specific features.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 136 ++++++++++++++------------
>   1 file changed, 71 insertions(+), 65 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 5551359d5dfd..cb82404df534 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -579,7 +579,7 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>   	 * the new fast GRBM interface.
>   	 */
>   	if ((entry->vmid_src == AMDGPU_GFXHUB_0) &&
> -	    (adev->asic_type < CHIP_ALDEBARAN))
> +	    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 4, 2)))
>   		RREG32(hub->vm_l2_pro_fault_status);
>   
>   	status = RREG32(hub->vm_l2_pro_fault_status);
> @@ -597,26 +597,28 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
>   			gfxhub_client_ids[cid],
>   			cid);
>   	} else {
> -		switch (adev->asic_type) {
> -		case CHIP_VEGA10:
> +		switch (adev->ip_versions[MMHUB_HWIP][0]) {
> +		case IP_VERSION(9, 0, 0):
>   			mmhub_cid = mmhub_client_ids_vega10[cid][rw];
>   			break;
> -		case CHIP_VEGA12:
> +		case IP_VERSION(9, 3, 0):
>   			mmhub_cid = mmhub_client_ids_vega12[cid][rw];
>   			break;
> -		case CHIP_VEGA20:
> +		case IP_VERSION(9, 4, 0):
>   			mmhub_cid = mmhub_client_ids_vega20[cid][rw];
>   			break;
> -		case CHIP_ARCTURUS:
> +		case IP_VERSION(9, 4, 1):
>   			mmhub_cid = mmhub_client_ids_arcturus[cid][rw];
>   			break;
> -		case CHIP_RAVEN:
> +		case IP_VERSION(9, 1, 0):
> +		case IP_VERSION(9, 2, 0):
>   			mmhub_cid = mmhub_client_ids_raven[cid][rw];
>   			break;
> -		case CHIP_RENOIR:
> +		case IP_VERSION(1, 5, 0):
> +		case IP_VERSION(2, 4, 0):
>   			mmhub_cid = mmhub_client_ids_renoir[cid][rw];
>   			break;
> -		case CHIP_ALDEBARAN:
> +		case IP_VERSION(9, 4, 2):
>   			mmhub_cid = mmhub_client_ids_aldebaran[cid][rw];
>   			break;
>   		default:
> @@ -694,7 +696,7 @@ static uint32_t gmc_v9_0_get_invalidate_req(unsigned int vmid,
>   static bool gmc_v9_0_use_invalidate_semaphore(struct amdgpu_device *adev,
>   				       uint32_t vmhub)
>   {
> -	if (adev->asic_type == CHIP_ALDEBARAN)
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
>   		return false;
>   
>   	return ((vmhub == AMDGPU_MMHUB_0 ||
> @@ -745,7 +747,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   
>   	hub = &adev->vmhub[vmhub];
>   	if (adev->gmc.xgmi.num_physical_nodes &&
> -	    adev->asic_type == CHIP_VEGA20) {
> +	    adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0)) {
>   		/* Vega20+XGMI caches PTEs in TC and TLB. Add a
>   		 * heavy-weight TLB flush (type 2), which flushes
>   		 * both. Due to a race condition with concurrent
> @@ -808,7 +810,7 @@ static void gmc_v9_0_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>   		 * GRBM interface.
>   		 */
>   		if ((vmhub == AMDGPU_GFXHUB_0) &&
> -		    (adev->asic_type < CHIP_ALDEBARAN))
> +		    (adev->ip_versions[GC_HWIP][0] < IP_VERSION(9, 4, 2)))
>   			RREG32_NO_KIQ(hub->vm_inv_eng0_req +
>   				      hub->eng_distance * eng);
>   
> @@ -874,7 +876,7 @@ static int gmc_v9_0_flush_gpu_tlb_pasid(struct amdgpu_device *adev,
>   		 * still need a second TLB flush after this.
>   		 */
>   		bool vega20_xgmi_wa = (adev->gmc.xgmi.num_physical_nodes &&
> -				       adev->asic_type == CHIP_VEGA20);
> +				       adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0));
>   		/* 2 dwords flush + 8 dwords fence */
>   		unsigned int ndw = kiq->pmf->invalidate_tlbs_size + 8;
>   
> @@ -1088,13 +1090,13 @@ static void gmc_v9_0_get_vm_pte(struct amdgpu_device *adev,
>   		*flags &= ~AMDGPU_PTE_VALID;
>   	}
>   
> -	if ((adev->asic_type == CHIP_ARCTURUS ||
> -	    adev->asic_type == CHIP_ALDEBARAN) &&
> +	if ((adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
> +	     adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2)) &&
>   	    !(*flags & AMDGPU_PTE_SYSTEM) &&
>   	    mapping->bo_va->is_xgmi)
>   		*flags |= AMDGPU_PTE_SNOOPED;
>   
> -	if (adev->asic_type == CHIP_ALDEBARAN)
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2))
>   		*flags |= mapping->flags & AMDGPU_PTE_SNOOPED;
>   }
>   
> @@ -1108,9 +1110,10 @@ static unsigned gmc_v9_0_get_vbios_fb_size(struct amdgpu_device *adev)
>   	} else {
>   		u32 viewport;
>   
> -		switch (adev->asic_type) {
> -		case CHIP_RAVEN:
> -		case CHIP_RENOIR:
> +		switch (adev->ip_versions[DCE_HWIP][0]) {
> +		case IP_VERSION(1, 0, 0):
> +		case IP_VERSION(1, 0, 1):
> +		case IP_VERSION(2, 1, 0):
>   			viewport = RREG32_SOC15(DCE, 0, mmHUBP0_DCSURF_PRI_VIEWPORT_DIMENSION);
>   			size = (REG_GET_FIELD(viewport,
>   					      HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_HEIGHT) *
> @@ -1118,9 +1121,6 @@ static unsigned gmc_v9_0_get_vbios_fb_size(struct amdgpu_device *adev)
>   					      HUBP0_DCSURF_PRI_VIEWPORT_DIMENSION, PRI_VIEWPORT_WIDTH) *
>   				4);
>   			break;
> -		case CHIP_VEGA10:
> -		case CHIP_VEGA12:
> -		case CHIP_VEGA20:
>   		default:
>   			viewport = RREG32_SOC15(DCE, 0, mmSCL0_VIEWPORT_SIZE);
>   			size = (REG_GET_FIELD(viewport, SCL0_VIEWPORT_SIZE, VIEWPORT_HEIGHT) *
> @@ -1151,11 +1151,11 @@ static void gmc_v9_0_set_gmc_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->asic_type) {
> -	case CHIP_VEGA10:
> +	switch (adev->ip_versions[UMC_HWIP][0]) {
> +	case IP_VERSION(6, 0, 0):
>   		adev->umc.funcs = &umc_v6_0_funcs;
>   		break;
> -	case CHIP_VEGA20:
> +	case IP_VERSION(6, 1, 1):
>   		adev->umc.max_ras_err_cnt_per_query = UMC_V6_1_TOTAL_CHANNEL_NUM;
>   		adev->umc.channel_inst_num = UMC_V6_1_CHANNEL_INSTANCE_NUM;
>   		adev->umc.umc_inst_num = UMC_V6_1_UMC_INSTANCE_NUM;
> @@ -1163,7 +1163,7 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
>   		adev->umc.channel_idx_tbl = &umc_v6_1_channel_idx_tbl[0][0];
>   		adev->umc.ras_funcs = &umc_v6_1_ras_funcs;
>   		break;
> -	case CHIP_ARCTURUS:
> +	case IP_VERSION(6, 1, 2):
>   		adev->umc.max_ras_err_cnt_per_query = UMC_V6_1_TOTAL_CHANNEL_NUM;
>   		adev->umc.channel_inst_num = UMC_V6_1_CHANNEL_INSTANCE_NUM;
>   		adev->umc.umc_inst_num = UMC_V6_1_UMC_INSTANCE_NUM;
> @@ -1171,7 +1171,7 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
>   		adev->umc.channel_idx_tbl = &umc_v6_1_channel_idx_tbl[0][0];
>   		adev->umc.ras_funcs = &umc_v6_1_ras_funcs;
>   		break;
> -	case CHIP_ALDEBARAN:
> +	case IP_VERSION(6, 7, 0):
>   		adev->umc.max_ras_err_cnt_per_query = UMC_V6_7_TOTAL_CHANNEL_NUM;
>   		adev->umc.channel_inst_num = UMC_V6_7_CHANNEL_INSTANCE_NUM;
>   		adev->umc.umc_inst_num = UMC_V6_7_UMC_INSTANCE_NUM;
> @@ -1190,11 +1190,11 @@ static void gmc_v9_0_set_umc_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v9_0_set_mmhub_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->asic_type) {
> -	case CHIP_ARCTURUS:
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
> +	case IP_VERSION(9, 4, 1):
>   		adev->mmhub.funcs = &mmhub_v9_4_funcs;
>   		break;
> -	case CHIP_ALDEBARAN:
> +	case IP_VERSION(9, 4, 2):
>   		adev->mmhub.funcs = &mmhub_v1_7_funcs;
>   		break;
>   	default:
> @@ -1205,14 +1205,14 @@ static void gmc_v9_0_set_mmhub_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v9_0_set_mmhub_ras_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->asic_type) {
> -	case CHIP_VEGA20:
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
> +	case IP_VERSION(9, 4, 0):
>   		adev->mmhub.ras_funcs = &mmhub_v1_0_ras_funcs;
>   		break;
> -	case CHIP_ARCTURUS:
> +	case IP_VERSION(9, 4, 1):
>   		adev->mmhub.ras_funcs = &mmhub_v9_4_ras_funcs;
>   		break;
> -	case CHIP_ALDEBARAN:
> +	case IP_VERSION(9, 4, 2):
>   		adev->mmhub.ras_funcs = &mmhub_v1_7_ras_funcs;
>   		break;
>   	default:
> @@ -1233,8 +1233,9 @@ static void gmc_v9_0_set_hdp_ras_funcs(struct amdgpu_device *adev)
>   
>   static void gmc_v9_0_set_mca_funcs(struct amdgpu_device *adev)
>   {
> -	switch (adev->asic_type) {
> -	case CHIP_ALDEBARAN:
> +	/* is UMC the right IP to check for MCA?  Maybe DF? */
> +	switch (adev->ip_versions[UMC_HWIP][0]) {
> +	case IP_VERSION(6, 7, 0):
>   		if (!adev->gmc.xgmi.connected_to_cpu)
>   			adev->mca.funcs = &mca_v3_0_funcs;
>   		break;
> @@ -1247,11 +1248,12 @@ static int gmc_v9_0_early_init(void *handle)
>   {
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> +	/* ARCT and VEGA20 don't have XGMI defined in their IP discovery tables */
>   	if (adev->asic_type == CHIP_VEGA20 ||
>   	    adev->asic_type == CHIP_ARCTURUS)
>   		adev->gmc.xgmi.supported = true;
>   
> -	if (adev->asic_type == CHIP_ALDEBARAN) {
> +	if (adev->ip_versions[XGMI_HWIP][0] == IP_VERSION(6, 1, 0)) {
>   		adev->gmc.xgmi.supported = true;
>   		adev->gmc.xgmi.connected_to_cpu =
>   			adev->smuio.funcs->is_host_gpu_xgmi_supported(adev);
> @@ -1289,7 +1291,8 @@ static int gmc_v9_0_late_init(void *handle)
>   	 * Workaround performance drop issue with VBIOS enables partial
>   	 * writes, while disables HBM ECC for vega10.
>   	 */
> -	if (!amdgpu_sriov_vf(adev) && (adev->asic_type == CHIP_VEGA10)) {
> +	if (!amdgpu_sriov_vf(adev) &&
> +	    (adev->ip_versions[UMC_HWIP][0] == IP_VERSION(6, 0, 0))) {
>   		if (!(adev->ras_enabled & (1 << AMDGPU_RAS_BLOCK__UMC))) {
>   			if (adev->df.funcs->enable_ecc_force_par_wr_rmw)
>   				adev->df.funcs->enable_ecc_force_par_wr_rmw(adev, false);
> @@ -1393,17 +1396,18 @@ static int gmc_v9_0_mc_init(struct amdgpu_device *adev)
>   
>   	/* set the gart size */
>   	if (amdgpu_gart_size == -1) {
> -		switch (adev->asic_type) {
> -		case CHIP_VEGA10:  /* all engines support GPUVM */
> -		case CHIP_VEGA12:  /* all engines support GPUVM */
> -		case CHIP_VEGA20:
> -		case CHIP_ARCTURUS:
> -		case CHIP_ALDEBARAN:
> +		switch (adev->ip_versions[GC_HWIP][0]) {
> +		case IP_VERSION(9, 0, 1):  /* all engines support GPUVM */
> +		case IP_VERSION(9, 2, 1):  /* all engines support GPUVM */
> +		case IP_VERSION(9, 4, 0):
> +		case IP_VERSION(9, 4, 1):
> +		case IP_VERSION(9, 4, 2):
>   		default:
>   			adev->gmc.gart_size = 512ULL << 20;
>   			break;
> -		case CHIP_RAVEN:   /* DCE SG support */
> -		case CHIP_RENOIR:
> +		case IP_VERSION(9, 1, 0):   /* DCE SG support */
> +		case IP_VERSION(9, 2, 2):   /* DCE SG support */
> +		case IP_VERSION(9, 3, 0):
>   			adev->gmc.gart_size = 1024ULL << 20;
>   			break;
>   		}
> @@ -1464,7 +1468,8 @@ static int gmc_v9_0_gart_init(struct amdgpu_device *adev)
>    */
>   static void gmc_v9_0_save_registers(struct amdgpu_device *adev)
>   {
> -	if (adev->asic_type == CHIP_RAVEN)
> +	if ((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
> +	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1)))
>   		adev->gmc.sdpif_register = RREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0);
>   }
>   
> @@ -1507,8 +1512,9 @@ static int gmc_v9_0_sw_init(void *handle)
>   
>   	adev->gmc.vram_type = vram_type;
>   	adev->gmc.vram_vendor = vram_vendor;
> -	switch (adev->asic_type) {
> -	case CHIP_RAVEN:
> +	switch (adev->ip_versions[GC_HWIP][0]) {
> +	case IP_VERSION(9, 1, 0):
> +	case IP_VERSION(9, 2, 2):
>   		adev->num_vmhubs = 2;
>   
>   		if (adev->rev_id == 0x0 || adev->rev_id == 0x1) {
> @@ -1520,11 +1526,11 @@ static int gmc_v9_0_sw_init(void *handle)
>   				adev->vm_manager.num_level > 1;
>   		}
>   		break;
> -	case CHIP_VEGA10:
> -	case CHIP_VEGA12:
> -	case CHIP_VEGA20:
> -	case CHIP_RENOIR:
> -	case CHIP_ALDEBARAN:
> +	case IP_VERSION(9, 0, 1):
> +	case IP_VERSION(9, 2, 1):
> +	case IP_VERSION(9, 4, 0):
> +	case IP_VERSION(9, 3, 0):
> +	case IP_VERSION(9, 4, 2):
>   		adev->num_vmhubs = 2;
>   
>   
> @@ -1539,7 +1545,7 @@ static int gmc_v9_0_sw_init(void *handle)
>   		else
>   			amdgpu_vm_adjust_size(adev, 256 * 1024, 9, 3, 48);
>   		break;
> -	case CHIP_ARCTURUS:
> +	case IP_VERSION(9, 4, 1):
>   		adev->num_vmhubs = 3;
>   
>   		/* Keep the vm size same with Vega20 */
> @@ -1555,7 +1561,7 @@ static int gmc_v9_0_sw_init(void *handle)
>   	if (r)
>   		return r;
>   
> -	if (adev->asic_type == CHIP_ARCTURUS) {
> +	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1)) {
>   		r = amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC1, VMC_1_0__SRCID__VM_FAULT,
>   					&adev->gmc.vm_fault);
>   		if (r)
> @@ -1622,8 +1628,8 @@ static int gmc_v9_0_sw_init(void *handle)
>   	 * for video processing.
>   	 */
>   	adev->vm_manager.first_kfd_vmid =
> -		(adev->asic_type == CHIP_ARCTURUS ||
> -		 adev->asic_type == CHIP_ALDEBARAN) ? 3 : 8;
> +		(adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 1) ||
> +		 adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 2)) ? 3 : 8;
>   
>   	amdgpu_vm_manager_init(adev);
>   
> @@ -1649,12 +1655,12 @@ static int gmc_v9_0_sw_fini(void *handle)
>   static void gmc_v9_0_init_golden_registers(struct amdgpu_device *adev)
>   {
>   
> -	switch (adev->asic_type) {
> -	case CHIP_VEGA10:
> +	switch (adev->ip_versions[MMHUB_HWIP][0]) {
> +	case IP_VERSION(9, 0, 0):
>   		if (amdgpu_sriov_vf(adev))
>   			break;
>   		fallthrough;
> -	case CHIP_VEGA20:
> +	case IP_VERSION(9, 4, 0):
>   		soc15_program_register_sequence(adev,
>   						golden_settings_mmhub_1_0_0,
>   						ARRAY_SIZE(golden_settings_mmhub_1_0_0));
> @@ -1662,9 +1668,8 @@ static void gmc_v9_0_init_golden_registers(struct amdgpu_device *adev)
>   						golden_settings_athub_1_0_0,
>   						ARRAY_SIZE(golden_settings_athub_1_0_0));
>   		break;
> -	case CHIP_VEGA12:
> -		break;
> -	case CHIP_RAVEN:
> +	case IP_VERSION(9, 1, 0):
> +	case IP_VERSION(9, 2, 0):
>   		/* TODO for renoir */
>   		soc15_program_register_sequence(adev,
>   						golden_settings_athub_1_0_0,
> @@ -1684,7 +1689,8 @@ static void gmc_v9_0_init_golden_registers(struct amdgpu_device *adev)
>    */
>   void gmc_v9_0_restore_registers(struct amdgpu_device *adev)
>   {
> -	if (adev->asic_type == CHIP_RAVEN) {
> +	if ((adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 0)) ||
> +	    (adev->ip_versions[DCE_HWIP][0] == IP_VERSION(1, 0, 1))) {
>   		WREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0, adev->gmc.sdpif_register);
>   		WARN_ON(adev->gmc.sdpif_register !=
>   			RREG32_SOC15(DCE, 0, mmDCHUBBUB_SDPIF_MMIO_CNTRL_0));

