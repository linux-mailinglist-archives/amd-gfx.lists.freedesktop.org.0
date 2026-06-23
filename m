Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JHDZBf+LO2puZggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD46BC541
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b="V0/CDEZk";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7D110EDEA;
	Wed, 24 Jun 2026 07:49:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCE610EC2E;
 Tue, 23 Jun 2026 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rExIrn+CwI3H6PMuvZ/8l032+n7O7ou0ZKl7vHP3/Ao=; b=V0/CDEZkgfjqkuWKvYNPBQnyiT
 mwuijZPoNfgkvWDZaprsRBufwsElDBm/FxoIjx43KF5K+db79egA+ZoY21uDdnmLy8lE0cv3xd34r
 nRrbHmpelQFPa6Ii25ACmc3RjaxqBrXhwgrKE4XJg/052Lla+Pe4LBY29IV3U9pRAWP6OjhDanW8B
 LPekD9cZPG4BPBgtnHuC9bOxr6Vha2+y8DO7Vx615LpYnAyVZO9g5zbBmJ0PAMH6Yk+r/Lp0SRy9G
 4lQwfupmFQyQmzC5vBZuLxw/2rLLvpPJ9xxF95EBK7PIz8tnIrXiDZWGzm4hPLVuNRcLKMZgFx6AP
 af002NSg==;
Received: from 179-125-64-254-dinamico.pombonet.net.br ([179.125.64.254]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc5Bl-004HK4-42; Tue, 23 Jun 2026 19:45:33 +0200
Date: Tue, 23 Jun 2026 14:45:23 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Natalie Vock <natalie.vock@gmx.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 cgroups@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/amdgpu: Wire up dmem cgroup reclaim for VRAM
 manager
Message-ID: <ajrGM2Ij_LssrvhT@quatroqueijos.cascardo.eti.br>
References: <20260611173301.17473-1-thomas.hellstrom@linux.intel.com>
 <20260611173301.17473-7-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611173301.17473-7-thomas.hellstrom@linux.intel.com>
X-Mailman-Approved-At: Wed, 24 Jun 2026 07:49:12 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmx.de,cmpxchg.org,kernel.org,suse.com,vger.kernel.org,amd.com,intel.com,linux.intel.com,suse.de,ffwll.ch,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03AD46BC541

On Thu, Jun 11, 2026 at 07:33:01PM +0200, Thomas Hellström wrote:
> Register the VRAM manager with the dmem cgroup reclaim infrastructure
> so that lowering dmem.max below current VRAM usage triggers TTM
> eviction rather than failing with -EBUSY.
> 
> Guard place->flags in amdgpu_ttm_bo_eviction_valuable() against NULL,
> as the TTM reclaim path passes a NULL place in cgroup drain mode.
> 
> v3:
> - Rebased on fix for uninitialized list and buddy allocator on the
>   drmm_cgroup_register_region() error path.
> 
> v5:
> - Rebased on the introduction of struct dmem_cgroup_init.
> - Clear the reclaim callback in amdgpu_vram_mgr_fini() to prevent
>   use-after-free if cgroup reclaim is triggered after driver unbind
>   while userspace holds an open DRM file descriptor. (Sashiko-bot)
> - Switch from drmm_cgroup_register_region() to the raw
>   dmem_cgroup_register_region() and store the region in
>   amdgpu_vram_mgr.cg_region. Call dmem_cgroup_unregister_region()
>   in amdgpu_vram_mgr_fini() after ttm_resource_manager_evict_all()
>   to drain in-flight reclaim callbacks, and clear man->cg afterwards.
>   This is required because amdgpu's vram manager fini is called
>   explicitly during driver unbind, which may precede the DRM device
>   release and thus precede any drmm-based cleanup. (Sashiko-bot)
> 
> v6:
> - Fix mgr->cg_region never being assigned, so
>   dmem_cgroup_unregister_region() in fini silently no-ops on NULL
>   and leaks the region. (Sashiko-bot)
> - Reorder fini to call set_used(false) and evict_all() before
>   dmem_cgroup_unregister_region(), so ttm_resource_free() can
>   uncharge via man->cg during eviction; clear man->cg after
>   unregister. (Sashiko-bot)
> 
> Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Hi, Thomas.

I needed the following fixup for this. Otherwise, it regresses on the dmem
region name.

Regards.
Cascardo


diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 2250bab0970d..d93bb88e8b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -942,7 +942,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 					     .size = adev->gmc.real_vram_size,
 					     .ops = &amdgpu_vram_mgr_dmem_ops,
 					     .reclaim_priv = man,
-					 }, "vram");
+					 }, "drm/%s/vram",
+					    adev_to_drm(adev)->unique);
 	if (IS_ERR(cg))
 		return PTR_ERR(cg);
 

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 31 ++++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  2 ++
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 2740de94e93c..8cbcd33f51a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1488,7 +1488,7 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  	dma_resv_for_each_fence(&resv_cursor, bo->base.resv,
>  				DMA_RESV_USAGE_BOOKKEEP, f) {
>  		if (amdkfd_fence_check_mm(f, current->mm) &&
> -		    !(place->flags & TTM_PL_FLAG_CONTIGUOUS))
> +		    !(place && (place->flags & TTM_PL_FLAG_CONTIGUOUS)))
>  			return false;
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 08f05c3aed1d..2250bab0970d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -906,6 +906,10 @@ static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
>  	.debug	= amdgpu_vram_mgr_debug
>  };
>  
> +static const struct dmem_cgroup_ops amdgpu_vram_mgr_dmem_ops = {
> +	.reclaim = ttm_resource_manager_dmem_reclaim,
> +};
> +
>  /**
>   * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
>   *
> @@ -917,6 +921,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  {
>  	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> +	struct dmem_cgroup_region *cg;
>  	int err;
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev,
> @@ -933,12 +938,16 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  	if (err)
>  		return err;
>  
> -	man->cg = drmm_cgroup_register_region(adev_to_drm(adev), "vram",
> -					      &(struct dmem_cgroup_init){
> -						.size = adev->gmc.real_vram_size,
> -					      });
> -	if (IS_ERR(man->cg))
> -		return PTR_ERR(man->cg);
> +	cg = dmem_cgroup_register_region(&(struct dmem_cgroup_init){
> +					     .size = adev->gmc.real_vram_size,
> +					     .ops = &amdgpu_vram_mgr_dmem_ops,
> +					     .reclaim_priv = man,
> +					 }, "vram");
> +	if (IS_ERR(cg))
> +		return PTR_ERR(cg);
> +
> +	mgr->cg_region = cg;
> +	ttm_resource_manager_set_dmem_region(man, cg);
>  
>  	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
>  	ttm_resource_manager_set_used(man, true);
> @@ -966,6 +975,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>  	if (ret)
>  		return;
>  
> +	/*
> +	 * Drain any in-flight dmem cgroup reclaim callbacks and remove the
> +	 * region from the global list.  This must happen after evict_all()
> +	 * so that ttm_resource_free() can still uncharge via man->cg while
> +	 * BOs are being evicted.
> +	 */
> +	dmem_cgroup_unregister_region(mgr->cg_region);
> +	mgr->cg_region = NULL;
> +	man->cg = NULL;
> +
>  	mutex_lock(&mgr->lock);
>  	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks)
>  		kfree(rsv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> index 429a21a2e9b2..07103cddb335 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -36,6 +36,8 @@ struct amdgpu_vram_mgr {
>  	atomic64_t vis_usage;
>  	u64 default_page_size;
>  	struct list_head allocated_vres_list;
> +	/** @cg_region: dmem cgroup region for VRAM; unregistered in fini. */
> +	struct dmem_cgroup_region *cg_region;
>  };
>  
>  struct amdgpu_vres_task {
> -- 
> 2.54.0
> 
