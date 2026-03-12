Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAw1HjDQsmnrPwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 15:39:44 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2067273833
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 15:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EB010EA28;
	Thu, 12 Mar 2026 14:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ks6yBY7h";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A6010EA28
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hQU+hNRMd/LPPpIIVKBH5h0u4SkUWiz6tPQOcRE6bjc=; b=Ks6yBY7hDMk+67tyiJsXU1bVyH
 g13mQdr9s27QoIRYzjKJDV/VToKIpyyiYN+WIsar4NjbSRznVERk31H+w3+wQYi3lD72bzBzed3bP
 Qj1RszIUhp9NbBmoZaU6UDfe/mfEKXbq2czojgHwkSptyJSlRaqvZmelyDmWf+2Bh/ANKOXzNXt88
 3o2pVv7dAS2N8RnkIBkcGtSTHtfFtScO9OhHbYlVGj0pcYJswRo+tg5aRBhyegCS1swPdAAvBAteo
 dk0hWfje/BR8L+aVWWua+qXjLEVbqGCaDTOfuK0iGkEm5WG9yKssPHFJ+tAaTDPOI8sH0cVmFoH1o
 9NVhAG1w==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w0hCJ-00EXci-7p; Thu, 12 Mar 2026 15:39:35 +0100
Message-ID: <2bdb769a-7814-480c-932c-c0e44c58c2bd@igalia.com>
Date: Thu, 12 Mar 2026 14:39:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Add explicit NULL check for bo in
 amdgpu_vm_bo_update()
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260312141315.1851106-1-srinivasan.shanmugam@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260312141315.1851106-1-srinivasan.shanmugam@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:dan.carpenter@linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,igalia.com:email,igalia.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C2067273833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 12/03/2026 14:13, Srinivasan Shanmugam wrote:
> amdgpu_vm_bo_update() allows bo_va->base.bo to be NULL in some paths,
> such as PRT-only updates.
> 
> Although amdgpu_vm_is_bo_always_valid() already returns false for a NULL
> BO, Smatch still warns that bo may be NULL before it is dereferenced
> later in the block.
> 
> Add an explicit `bo &&` check before calling
> amdgpu_vm_is_bo_always_valid() to make the non-NULL condition clear and
> fixes the below smatch error
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1353 amdgpu_vm_bo_update() error: we previously assumed 'bo' could be null (see line 1292)
> 
> Fixes: 26e20235ce00 ("drm/amdgpu: Add amdgpu_bo_is_vm_bo helper")
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b89013a6aa0b..0d26346178d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1349,7 +1349,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   	 * the evicted list so that it gets validated again on the
>   	 * next command submission.
>   	 */
> -	if (amdgpu_vm_is_bo_always_valid(vm, bo)) {
> +	if (bo && amdgpu_vm_is_bo_always_valid(vm, bo)) {

That would be unfortunate:

bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo 
*bo)
{
	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
}

Maybe Dan can make smatch smarter? :) Because I don't think papering 
randomly at a single call site is great. It is even in the same 
compilation unit. Hmm does the order matter to smatch? Should we maybe 
move amdgpu_vm_is_bo_always_valid() to be earlier in the file?

Regards,

Tvrtko

>   		if (bo->tbo.resource &&
>   		    !(bo->preferred_domains &
>   		      amdgpu_mem_type_to_domain(bo->tbo.resource->mem_type)))

