Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CB402C28
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Sep 2021 17:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF0A89DFB;
	Tue,  7 Sep 2021 15:47:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id E992489DFB
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Sep 2021 15:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7AE8320201C;
 Tue,  7 Sep 2021 17:47:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id GlxfX7FYum4E; Tue,  7 Sep 2021 17:47:55 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 27C0A20201B;
 Tue,  7 Sep 2021 17:47:55 +0200 (CEST)
Received: from [127.0.0.1] by thor with esmtp (Exim 4.95-RC2)
 (envelope-from <michel@daenzer.net>) id 1mNdKE-000vda-Af;
 Tue, 07 Sep 2021 17:47:54 +0200
Message-ID: <bbe48a89-1602-05a6-3ec5-c9b1b4775ae5@daenzer.net>
Date: Tue, 7 Sep 2021 17:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.2
Subject: Re: [PATCH 1/2] drm/amdgpu: fix use after free during BO move
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210907081447.182532-1-christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
In-Reply-To: <20210907081447.182532-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
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

On 2021-09-07 10:14, Christian König wrote:
> The memory backing old_mem is already freed at that point, move the
> check a bit more up.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1699
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 446943e32e3e..e2896ac2c9ce 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -513,6 +513,15 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>  		goto out;
>  	}
>  
> +	if (bo->type == ttm_bo_type_device &&
> +	    new_mem->mem_type == TTM_PL_VRAM &&
> +	    old_mem->mem_type != TTM_PL_VRAM) {
> +		/* amdgpu_bo_fault_reserve_notify will re-set this if the CPU
> +		 * accesses the BO after it's moved.
> +		 */
> +		abo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +	}
> +
>  	if (adev->mman.buffer_funcs_enabled) {
>  		if (((old_mem->mem_type == TTM_PL_SYSTEM &&
>  		      new_mem->mem_type == TTM_PL_VRAM) ||
> @@ -543,15 +552,6 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>  			return r;
>  	}
>  
> -	if (bo->type == ttm_bo_type_device &&
> -	    new_mem->mem_type == TTM_PL_VRAM &&
> -	    old_mem->mem_type != TTM_PL_VRAM) {
> -		/* amdgpu_bo_fault_reserve_notify will re-set this if the CPU
> -		 * accesses the BO after it's moved.
> -		 */
> -		abo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> -	}
> -
>  out:
>  	/* update statistics */
>  	atomic64_add(bo->base.size, &adev->num_bytes_moved);
> 

Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>

Thanks!


-- 
Earthling Michel Dänzer               |               https://redhat.com
Libre software enthusiast             |             Mesa and X developer
