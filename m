Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CED4F193B
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Apr 2022 18:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD61610E604;
	Mon,  4 Apr 2022 16:19:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424D710E604
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Apr 2022 16:19:23 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae916.dynamic.kabel-deutschland.de
 [95.90.233.22])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D626A61E64846;
 Mon,  4 Apr 2022 18:19:20 +0200 (CEST)
Message-ID: <daeb333a-20b3-ca34-44e9-375f3b5ad2de@molgen.mpg.de>
Date: Mon, 4 Apr 2022 18:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/1] drm/amdgpu: Flush TLB after mapping for VG20+XGMI
Content-Language: en-US
To: Philip Yang <Philip.Yang@amd.com>
References: <20220401195726.21436-1-Philip.Yang@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220401195726.21436-1-Philip.Yang@amd.com>
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
Cc: felix.kuehling@amd.com, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Philip,


Thank you for your patch.

Am 01.04.22 um 21:57 schrieb Philip Yang:
> For VG20 + XGMI bridge, all mappings PTEs cache in TC, this may have
> stall invalid PTEs in TC because one cache line has 8 pages. Need always

Can you please rephrase. “may have stall …” is really hard to understand.

> flush_tlb after updating mapping.

Maybe:

So, always flush_tlb after updating the mapping.

> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f0aec04111a3..687c9a140645 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -837,6 +837,12 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   		goto error_unlock;
>   	}
>   
> +	/* Vega20+XGMI where PTEs get inadvertently cached in L2 texture cache,
> +	 * heavy-weight flush TLB unconditionally.
> +	 */
> +	flush_tlb |= (adev->gmc.xgmi.num_physical_nodes &&
> +		      adev->ip_versions[GC_HWIP][0] == IP_VERSION(9, 4, 0));
> +
>   	memset(&params, 0, sizeof(params));
>   	params.adev = adev;
>   	params.vm = vm;

Did you do any performance measurement, if that flushing affects anything?


Kind regards,

Paul
