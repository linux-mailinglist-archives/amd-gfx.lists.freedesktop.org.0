Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAYYHnDYsmlDQAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 16:14:56 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE542740EB
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 16:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7C410EA3F;
	Thu, 12 Mar 2026 15:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hnFVRCGH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FC210EA3F
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Mar 2026 15:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lm1cIHifD3pXUmfOsl0qhpn9mw/Hub7tlM5TNQvZ4z8=; b=hnFVRCGH+nJyQ/K+ffv6WP6Yvd
 cZDZDpU5WPq1egw+2bVNymmae9UscrxKfBMHSqGQP20iI2hZ9TFEMqt36i3jNaoCdr0PIDCKfzM/o
 bn4CzWHoXkoh1bE0Z/j8hmNfScZ+ZN6ItsXKTRXrBr5fyFsUDqyQ92bBe7ICaOPEp/THmMqDRBBE7
 eCiGJXqVnwMFv/BURe+XbCtW8V4oB9U726mPqJU6BYn86eD0ZZJtQH0kRE2iZJaRRy2j46Y6/xVF1
 j7icjn70PznohrvcdErPYi4G92/yFr9cFBxCIvPHhXYoQCwdqYx5c2QDtV3N+5B7WZQmV9VUq6JQ6
 WXYg2avw==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1w0hkQ-00EYVK-L0; Thu, 12 Mar 2026 16:14:50 +0100
Message-ID: <bf57db16-c69b-4c72-855c-caad49e85ca2@igalia.com>
Date: Thu, 12 Mar 2026 15:14:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Move amdgpu_vm_is_bo_always_valid() before
 first use
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20260312150607.1855822-1-srinivasan.shanmugam@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260312150607.1855822-1-srinivasan.shanmugam@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,igalia.com:email,igalia.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: CAE542740EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 12/03/2026 15:06, Srinivasan Shanmugam wrote:
> Smatch reports that 'bo' could be NULL in amdgpu_vm_bo_update(), even
> though amdgpu_vm_is_bo_always_valid() already checks for a NULL BO.
> 
> Move amdgpu_vm_is_bo_always_valid() earlier in the file so the helper
> definition appears before its first use. This allows static analysis
> tools to see the NULL check performed by the helper and avoids the
> warning.

Oh wow, it was just a thought I did not honestly expect it will make a 
difference. But if it works it works..

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 28 +++++++++++++-------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index b89013a6aa0b..f1a816a8043a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -138,6 +138,20 @@ static void amdgpu_vm_assert_locked(struct amdgpu_vm *vm)
>   	dma_resv_assert_held(vm->root.bo->tbo.base.resv);
>   }
>   
> +/**
> + * amdgpu_vm_is_bo_always_valid - check if the BO is VM always valid
> + *
> + * @vm: VM to test against.
> + * @bo: BO to be tested.
> + *
> + * Returns true if the BO shares the dma_resv object with the root PD and is
> + * always guaranteed to be valid inside the VM.
> + */
> +bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
> +{
> +	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
> +}
> +
>   /**
>    * amdgpu_vm_bo_evicted - vm_bo is evicted
>    *
> @@ -3159,20 +3173,6 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
>   	xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
>   }
>   
> -/**
> - * amdgpu_vm_is_bo_always_valid - check if the BO is VM always valid
> - *
> - * @vm: VM to test against.
> - * @bo: BO to be tested.
> - *
> - * Returns true if the BO shares the dma_resv object with the root PD and is
> - * always guaranteed to be valid inside the VM.
> - */
> -bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
> -{
> -	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
> -}
> -
>   void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
>   			       struct amdgpu_task_info *task_info)
>   {

