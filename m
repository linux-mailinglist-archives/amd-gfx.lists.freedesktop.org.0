Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D51D520E4B
	for <lists+amd-gfx@lfdr.de>; Tue, 10 May 2022 09:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A916310F534;
	Tue, 10 May 2022 07:12:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 920AB10F517
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 May 2022 07:12:49 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aeae3.dynamic.kabel-deutschland.de
 [95.90.234.227])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 429EA61EA1923;
 Tue, 10 May 2022 09:12:47 +0200 (CEST)
Message-ID: <c354ffaf-ffcb-363e-12b1-3a9909087c35@molgen.mpg.de>
Date: Tue, 10 May 2022 09:12:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/amdgpu: Check kernel version for 'hypervisor_is_type'
Content-Language: en-US
To: Yongqiang Sun <yongqiang.sun@amd.com>
References: <20220509170732.791710-1-yongqiang.sun@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220509170732.791710-1-yongqiang.sun@amd.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Yongqiang,


Thank you for your patch.

Am 09.05.22 um 19:07 schrieb Yongqiang Sun:
> hypervisor_is_type is added since kernel 4.15, dkms package failed to

Also mention the commit hash and summary of the commit adding that.

> install on older kernel e.g. 3.10.
> 
> Use marcro check kernel version to determine whether the function is

macro (found by my spell checker)

> used.

Please reflow for 75 characters per line.

The Signed-off-by line is missing.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c  | 4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> index 88b852b3a2cb..963b2e68205e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> @@ -28,7 +28,7 @@
>   #ifdef CONFIG_X86
>   #include <asm/hypervisor.h>
>   #endif
> -
> +#include <linux/version.h>
>   #include "amdgpu.h"
>   #include "amdgpu_gmc.h"
>   #include "amdgpu_ras.h"
> @@ -653,10 +653,12 @@ void amdgpu_gmc_get_vbios_allocations(struct amdgpu_device *adev)
>   		 * VEGA10 SRIOV VF with MS_HYPERV host needs some firmware reserved area.
>   		 */
>   #ifdef CONFIG_X86
> +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
>   		if (amdgpu_sriov_vf(adev) && hypervisor_is_type(X86_HYPER_MS_HYPERV)) {
>   			adev->mman.stolen_reserved_offset = 0x500000;
>   			adev->mman.stolen_reserved_size = 0x200000;
>   		}
> +#endif

`scripts/checkpatch.pl` warns about using `LINUX_VERSION_CODE`.

>   #endif
>   		break;
>   	case CHIP_RAVEN:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> index 02b161a1287b..5a50122a1161 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
> @@ -26,7 +26,7 @@
>   #ifdef CONFIG_X86
>   #include <asm/hypervisor.h>
>   #endif
> -
> +#include <linux/version.h>
>   #include <drm/drm_drv.h>
>   #include <xen/xen.h>
>   
> @@ -728,8 +728,10 @@ void amdgpu_detect_virtualization(struct amdgpu_device *adev)
>   		case CHIP_VEGA10:
>   			soc15_set_virt_ops(adev);
>   #ifdef CONFIG_X86
> +#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
>   			/* not send GPU_INIT_DATA with MS_HYPERV*/
>   			if (!hypervisor_is_type(X86_HYPER_MS_HYPERV))
> +#endif
>   #endif
>   				/* send a dummy GPU_INIT_DATA request to host on vega10 */
>   				amdgpu_virt_request_init_data(adev);

Is this patch for inclusion to the Linux kernel or just for people 
building the newer code as module for older Linux kernel versions?


Kind regards,

Paul
