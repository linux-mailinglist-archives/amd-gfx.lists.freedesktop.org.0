Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD9F17B493
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Mar 2020 03:43:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9B6EC54;
	Fri,  6 Mar 2020 02:43:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40B6EC54
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Mar 2020 02:43:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGUwPbUgxWViKgNeKQsE2gs2cnGi5qLBf/w3AJfn4md51hUu6lC+fS2RfEIuidW76KvZKRgTodeJIvnr1C4RNXH7+jwbjketuqy204UFdmsXjQ1ibU5nntI2tVSbYd0vffb7uFLuawSV9xs7CKx3aAYhiETBVpuj3/VDItQXasmooAwl2ckjc0/WIHtVLVG9GfXvPhgYEzdIgfoB626OogodYfG/l2PZqYf2N9npv1sQQqCv8gOuBMAbpP/3yxIg2+D32nMScFeo040KTeA3tBTwU71p1Y0r3yi2wunFsPu929z07pfy85R/vmu5Dc9z4qGFvfOqYa7gHwHnaWBBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtRbvMs3SAiA/lfmpDkglyvlqqBiDUqUC0mj6KoMUb0=;
 b=RSDNWq2X7lqbOy/Ja/ZnRcEjH+Ye2BEvm1nC8t72sL6ekqP1XFqUMnSqMwaFi//qHYQWJMHhahbezDO/oz1hQMGQI5tdXh8jfPb2Fp606FbKeMrD/12aN8sPZWXC04AdrhXNVkrbp8cgBlDnyG2V9coNUs+5EufkD4qovFn+yGvKxRQsv5NJN91rYR2XYIiYldOI036RL3NAMwiuFoPnxrQ7KQOvkC1ruCpVaIAdbnRcOV+YPojgSdId5OmG67dIDZNfBxsB+sjrin4lRbHSPHZu+T4riKIUlDbJhi+xgVnrU1bBgDri30ooEq2uoXd0CF6CKQHtzzuW1oCjDIuTHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtRbvMs3SAiA/lfmpDkglyvlqqBiDUqUC0mj6KoMUb0=;
 b=eZF2enoo3m86iM2hMBGtIXSuAWjGh8Oan0ShPPJ+qFzgx3O1kXvP7LMRnPNBnNXfAVljEo7DemYqDv3FjKvLy+osAndw9fWOmdJM6YfXRvmW8e+ncKbcF2LRZ8OIVyEi/EGVR48fMjwAgUMtJAclRf4tw4n78hqkRxjdrAlq9ao=
Received: from DM6PR12MB3931.namprd12.prod.outlook.com (2603:10b6:5:1cb::12)
 by DM6PR12MB3946.namprd12.prod.outlook.com (2603:10b6:5:1cb::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14; Fri, 6 Mar
 2020 02:43:34 +0000
Received: from DM6PR12MB3931.namprd12.prod.outlook.com
 ([fe80::c51d:4e6b:f0f1:b7a3]) by DM6PR12MB3931.namprd12.prod.outlook.com
 ([fe80::c51d:4e6b:f0f1:b7a3%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 02:43:34 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [enable VCN2.0 for NV12 SRIOV 3/6] drm/amdgpu: implement
 initialization part on VCN2.0 for SRIOV
Thread-Topic: [enable VCN2.0 for NV12 SRIOV 3/6] drm/amdgpu: implement
 initialization part on VCN2.0 for SRIOV
Thread-Index: AQHV8vKm/D4ThDjyA0yJaM2IammkRqg6KpKAgACxj1A=
Date: Fri, 6 Mar 2020 02:43:34 +0000
Message-ID: <DM6PR12MB3931E9DEB131BE289492E73084E30@DM6PR12MB3931.namprd12.prod.outlook.com>
References: <1583415187-16594-1-git-send-email-Monk.Liu@amd.com>
 <1583415187-16594-3-git-send-email-Monk.Liu@amd.com>
 <dd1f4dae-a48e-3d4f-0815-5b101810a794@amd.com>
In-Reply-To: <dd1f4dae-a48e-3d4f-0815-5b101810a794@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 313ea0ea-4b42-46eb-bc8c-08d7c1782a44
x-ms-traffictypediagnostic: DM6PR12MB3946:|DM6PR12MB3946:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB39463FC30039CBDEFDEECA4884E30@DM6PR12MB3946.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(189003)(199004)(52536014)(71200400001)(30864003)(2906002)(5660300002)(33656002)(76116006)(64756008)(66476007)(66556008)(316002)(7696005)(66446008)(6506007)(66946007)(81166006)(55016002)(8676002)(26005)(478600001)(186003)(86362001)(9686003)(8936002)(110136005)(81156014)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3946;
 H:DM6PR12MB3931.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ODOhEsIETUiwsJiwy8ArXtTQ4L/RQ8D3pr+Rq4LXq+8ZmdUDQ9ya6ZehsCSmnZ5sUemhukFJRN4vUmccO2Q4GXq3A4RZn7hyzB7vfeKJUpiPE+jl4twfXEWXdk7N0HvCL66m16JHfk1vN5jHVOZHhIdYqJJ4zKQV9bd+adM36PQgHxMy0pZWoL/b4Zo4S3V7sNf2cAtJ+st9FNDjVFy/E8lpHvtv9owWenMIMQRFAOwCrj6LnZ90ofJunaTLy1OY4ky8hmH5OMTmrgAsYgcueiJASL9cbI+/FU1WS+38JXEuLxVyWy2io/pwktMLEgJSUTkta2fGbvd07Ho8CeQBBPzLJ0v+fRLX0Eb1eQfyHcWfifCpa5VPhMg7n4vy+dD7G8PAuih7zeAKg1hH+pFPUyHzS9zj/FHibNhb1OnerM9V1Ai2KlftowEzhhzKQ8td
x-ms-exchange-antispam-messagedata: tZ/peSTmmqPiqo+FvJKH62IlcE2WcpbydX4GKmJfTMpe5B21YDQg0RSFYaGi1irq0dnylnh8MwjT94sVYKIkGCPBNEOLbrYzsg5VsJrLsLo7JEnA0EwmLyGrRNpknq0bU45ORYAaMLpZievKyVdX6Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313ea0ea-4b42-46eb-bc8c-08d7c1782a44
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 02:43:34.4049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xN0EpaA/6hT6/H7aXqoPxpkGiMbBcbStmgvSfKkzy2WgnfqP1sUMD6KUSVs+4Mk3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3946
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Okay, no problem 

_____________________________________
Monk Liu|GPU Virtualization Team |AMD


-----Original Message-----
From: Liu, Leo <Leo.Liu@amd.com> 
Sent: Friday, March 6, 2020 12:08 AM
To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [enable VCN2.0 for NV12 SRIOV 3/6] drm/amdgpu: implement initialization part on VCN2.0 for SRIOV


On 2020-03-05 8:33 a.m., Monk Liu wrote:
> one dec ring and one enc ring
It seems more than that, you might add more messages.


>
> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c | 231 +++++++++++++++++++++++++++++++++-
>   1 file changed, 228 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c 
> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> index c387c81..421e5bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c
> @@ -29,6 +29,7 @@
>   #include "soc15d.h"
>   #include "amdgpu_pm.h"
>   #include "amdgpu_psp.h"
> +#include "mmsch_v2_0.h"
>   
>   #include "vcn/vcn_2_0_0_offset.h"
>   #include "vcn/vcn_2_0_0_sh_mask.h"
> @@ -54,7 +55,7 @@ static int vcn_v2_0_set_powergating_state(void *handle,
>   				enum amd_powergating_state state);
>   static int vcn_v2_0_pause_dpg_mode(struct amdgpu_device *adev,
>   				int inst_idx, struct dpg_pause_state *new_state);
> -
> +static int vcn_v2_0_start_sriov(struct amdgpu_device *adev);

Please keep the empty line here.


>   /**
>    * vcn_v2_0_early_init - set function pointers
>    *
> @@ -67,7 +68,10 @@ static int vcn_v2_0_early_init(void *handle)
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
>   	adev->vcn.num_vcn_inst = 1;
> -	adev->vcn.num_enc_rings = 2;
> +	if (amdgpu_sriov_vf(adev))
> +		adev->vcn.num_enc_rings = 1;
> +	else
> +		adev->vcn.num_enc_rings = 2;
>   
>   	vcn_v2_0_set_dec_ring_funcs(adev);
>   	vcn_v2_0_set_enc_ring_funcs(adev);
> @@ -154,7 +158,10 @@ static int vcn_v2_0_sw_init(void *handle)
>   	for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
>   		ring = &adev->vcn.inst->ring_enc[i];
>   		ring->use_doorbell = true;
> -		ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + i;
> +		if (!amdgpu_sriov_vf(adev))
> +			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 2 + i;
> +		else
> +			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) 
> ++ 1 + i;
>   		sprintf(ring->name, "vcn_enc%d", i);
>   		r = amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst->irq, 0);
>   		if (r)
> @@ -163,6 +170,10 @@ static int vcn_v2_0_sw_init(void *handle)
>   
>   	adev->vcn.pause_dpg_mode = vcn_v2_0_pause_dpg_mode;
>   
> +	r = amdgpu_virt_alloc_mm_table(adev);
> +	if (r)
> +		return r;
> +

This is not needed for bare metal.


>   	return 0;
>   }
>   
> @@ -178,6 +189,8 @@ static int vcn_v2_0_sw_fini(void *handle)
>   	int r;
>   	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>   
> +	amdgpu_virt_free_mm_table(adev);
> +

same as above here.


Regards,

Leo



>   	r = amdgpu_vcn_suspend(adev);
>   	if (r)
>   		return r;
> @@ -203,6 +216,9 @@ static int vcn_v2_0_hw_init(void *handle)
>   	adev->nbio.funcs->vcn_doorbell_range(adev, ring->use_doorbell,
>   					     ring->doorbell_index, 0);
>   
> +	if (amdgpu_sriov_vf(adev))
> +		vcn_v2_0_start_sriov(adev);
> +
>   	r = amdgpu_ring_test_helper(ring);
>   	if (r)
>   		goto done;
> @@ -1680,6 +1696,215 @@ static int vcn_v2_0_set_powergating_state(void *handle,
>   	return ret;
>   }
>   
> +static int vcn_v2_0_start_mmsch(struct amdgpu_device *adev,
> +				struct amdgpu_mm_table *table)
> +{
> +	uint32_t data = 0, loop;
> +	uint64_t addr = table->gpu_addr;
> +	struct mmsch_v2_0_init_header *header;
> +	uint32_t size;
> +	int i;
> +
> +	header = (struct mmsch_v2_0_init_header *)table->cpu_addr;
> +	size = header->header_size + header->vcn_table_size;
> +
> +	/* 1, write to vce_mmsch_vf_ctx_addr_lo/hi register with GPU mc addr
> +	 * of memory descriptor location
> +	 */
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_CTX_ADDR_LO, lower_32_bits(addr));
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_CTX_ADDR_HI, upper_32_bits(addr));
> +
> +	/* 2, update vmid of descriptor */
> +	data = RREG32_SOC15(UVD, 0, mmMMSCH_VF_VMID);
> +	data &= ~MMSCH_VF_VMID__VF_CTX_VMID_MASK;
> +	/* use domain0 for MM scheduler */
> +	data |= (0 << MMSCH_VF_VMID__VF_CTX_VMID__SHIFT);
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_VMID, data);
> +
> +	/* 3, notify mmsch about the size of this descriptor */
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_CTX_SIZE, size);
> +
> +	/* 4, set resp to zero */
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_MAILBOX_RESP, 0);
> +
> +	adev->vcn.inst->ring_dec.wptr = 0;
> +	adev->vcn.inst->ring_dec.wptr_old = 0;
> +	vcn_v2_0_dec_ring_set_wptr(&adev->vcn.inst->ring_dec);
> +
> +	for (i = 0; i < adev->vcn.num_enc_rings; ++i) {
> +		adev->vcn.inst->ring_enc[i].wptr = 0;
> +		adev->vcn.inst->ring_enc[i].wptr_old = 0;
> +		vcn_v2_0_enc_ring_set_wptr(&adev->vcn.inst->ring_enc[i]);
> +	}
> +
> +	/* 5, kick off the initialization and wait until
> +	 * VCE_MMSCH_VF_MAILBOX_RESP becomes non-zero
> +	 */
> +	WREG32_SOC15(UVD, 0, mmMMSCH_VF_MAILBOX_HOST, 0x10000001);
> +
> +	data = RREG32_SOC15(UVD, 0, mmMMSCH_VF_MAILBOX_RESP);
> +	loop = 1000;
> +	while ((data & 0x10000002) != 0x10000002) {
> +		udelay(10);
> +		data = RREG32_SOC15(UVD, 0, mmMMSCH_VF_MAILBOX_RESP);
> +		loop--;
> +		if (!loop)
> +			break;
> +	}
> +
> +	if (!loop) {
> +		DRM_ERROR("failed to init MMSCH, " \
> +			"mmMMSCH_VF_MAILBOX_RESP = 0x%08x\n", data);
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vcn_v2_0_start_sriov(struct amdgpu_device *adev) {
> +	int r;
> +	uint32_t tmp;
> +	struct amdgpu_ring *ring;
> +	uint32_t offset, size;
> +	uint32_t table_size = 0;
> +	struct mmsch_v2_0_cmd_direct_write direct_wt = { {0} };
> +	struct mmsch_v2_0_cmd_direct_read_modify_write direct_rd_mod_wt = { {0} };
> +	struct mmsch_v2_0_cmd_direct_polling direct_poll = { {0} };
> +	struct mmsch_v2_0_cmd_end end = { {0} };
> +	struct mmsch_v2_0_init_header *header;
> +	uint32_t *init_table = adev->virt.mm_table.cpu_addr;
> +	uint8_t i = 0;
> +
> +	header = (struct mmsch_v2_0_init_header *)init_table;
> +	direct_wt.cmd_header.command_type = MMSCH_COMMAND__DIRECT_REG_WRITE;
> +	direct_rd_mod_wt.cmd_header.command_type =
> +		MMSCH_COMMAND__DIRECT_REG_READ_MODIFY_WRITE;
> +	direct_poll.cmd_header.command_type =
> +		MMSCH_COMMAND__DIRECT_REG_POLLING;
> +	end.cmd_header.command_type = MMSCH_COMMAND__END;
> +
> +	if (header->vcn_table_offset == 0 && header->vcn_table_size == 0) {
> +		header->version = MMSCH_VERSION;
> +		header->header_size = sizeof(struct mmsch_v2_0_init_header) >> 2;
> +
> +		header->vcn_table_offset = header->header_size;
> +
> +		init_table += header->vcn_table_offset;
> +
> +		size = AMDGPU_GPU_PAGE_ALIGN(adev->vcn.fw->size + 4);
> +
> +		MMSCH_V2_0_INSERT_DIRECT_RD_MOD_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_STATUS),
> +			0xFFFFFFFF, 0x00000004);
> +
> +		/* mc resume*/
> +		if (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) {
> +			tmp = AMDGPU_UCODE_ID_VCN;
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i,
> +					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
> +				adev->firmware.ucode[tmp].tmr_mc_addr_lo);
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i,
> +					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
> +				adev->firmware.ucode[tmp].tmr_mc_addr_hi);
> +			offset = 0;
> +		} else {
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i,
> +					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
> +				lower_32_bits(adev->vcn.inst->gpu_addr));
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i,
> +					mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
> +				upper_32_bits(adev->vcn.inst->gpu_addr));
> +			offset = size;
> +		}
> +
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_OFFSET0),
> +			0);
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE0),
> +			size);
> +
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
> +			lower_32_bits(adev->vcn.inst->gpu_addr + offset));
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_HIGH),
> +			upper_32_bits(adev->vcn.inst->gpu_addr + offset));
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_OFFSET1),
> +			0);
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE1),
> +			AMDGPU_VCN_STACK_SIZE);
> +
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_LOW),
> +			lower_32_bits(adev->vcn.inst->gpu_addr + offset +
> +				AMDGPU_VCN_STACK_SIZE));
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_VCPU_CACHE2_64BIT_BAR_HIGH),
> +			upper_32_bits(adev->vcn.inst->gpu_addr + offset +
> +				AMDGPU_VCN_STACK_SIZE));
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_OFFSET2),
> +			0);
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE2),
> +			AMDGPU_VCN_CONTEXT_SIZE);
> +
> +		for (r = 0; r < adev->vcn.num_enc_rings; ++r) {
> +			ring = &adev->vcn.inst->ring_enc[r];
> +			ring->wptr = 0;
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i, mmUVD_RB_BASE_LO),
> +				lower_32_bits(ring->gpu_addr));
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i, mmUVD_RB_BASE_HI),
> +				upper_32_bits(ring->gpu_addr));
> +			MMSCH_V2_0_INSERT_DIRECT_WT(
> +				SOC15_REG_OFFSET(UVD, i, mmUVD_RB_SIZE),
> +				ring->ring_size / 4);
> +		}
> +
> +		ring = &adev->vcn.inst->ring_dec;
> +		ring->wptr = 0;
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_RBC_RB_64BIT_BAR_LOW),
> +			lower_32_bits(ring->gpu_addr));
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i,
> +				mmUVD_LMI_RBC_RB_64BIT_BAR_HIGH),
> +			upper_32_bits(ring->gpu_addr));
> +		/* force RBC into idle state */
> +		tmp = order_base_2(ring->ring_size);
> +		tmp = REG_SET_FIELD(0, UVD_RBC_RB_CNTL, RB_BUFSZ, tmp);
> +		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_BLKSZ, 1);
> +		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_FETCH, 1);
> +		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_NO_UPDATE, 1);
> +		tmp = REG_SET_FIELD(tmp, UVD_RBC_RB_CNTL, RB_RPTR_WR_EN, 1);
> +		MMSCH_V2_0_INSERT_DIRECT_WT(
> +			SOC15_REG_OFFSET(UVD, i, mmUVD_RBC_RB_CNTL), tmp);
> +
> +		/* add end packet */
> +		tmp = sizeof(struct mmsch_v2_0_cmd_end);
> +		memcpy((void *)init_table, &end, tmp);
> +		table_size += (tmp / 4);
> +		header->vcn_table_size = table_size;
> +
> +	}
> +	return vcn_v2_0_start_mmsch(adev, &adev->virt.mm_table); }
> +
>   static const struct amd_ip_funcs vcn_v2_0_ip_funcs = {
>   	.name = "vcn_v2_0",
>   	.early_init = vcn_v2_0_early_init,
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
