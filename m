Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sxpOEtO4O2p0bwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 13:00:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE316BD876
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 13:00:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=paJDuwHM;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C20F10E062;
	Wed, 24 Jun 2026 11:00:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCF210E637
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 11:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLZG5T7rjDmmE2KGf044Pg1ABvOYrsjefz7Waz6VwLg=; b=paJDuwHM45PBE5otbkS8zkF7F+
 Lskcb/4kG2YKbKt//4GTVPhvjZbLuNsHsqc0MGCZwcFvhoBnzYvIc/eu7jMGleawaLd5Y9eKI3see
 CruyarP7ldlefg1Umvz/o7ukVrdFFapTmdrj1hyKVG3bb8nBh7up/6GNQNLJ4Ba3/dm1gsTThh8VZ
 vLxd4sM0dy91GJwSP469gCuVVIdXJ9JBgE16laiWppvG06VHPUi1lv8coD0Huz0q4/OBaAR3DIoQZ
 Yn9vQVKzV9K1Hi9yQ/9Wj5+kdU8WcPszob3HF0Svqt96RAy9+QqrqznLce2FKcOpxoz3a1w+vGQI+
 V/QUvZtw==;
Received: from [90.240.106.137] (helo=[192.168.0.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wcLLH-004ZNB-1k; Wed, 24 Jun 2026 13:00:27 +0200
Message-ID: <4b2ebeaa-f3a4-4787-b8d7-76cd225b6564@igalia.com>
Date: Wed, 24 Jun 2026 12:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amdgpu: Simplify filtering rings during IP block
 soft reset
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOh?=
 =?UTF-8?Q?k?= <maraeo@gmail.com>, Lazar Lijo <lijo.lazar@amd.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
References: <20260624073829.40835-1-timur.kristof@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260624073829.40835-1-timur.kristof@gmail.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:natalie.vock@gmx.de,m:mario.limonciello@amd.com,m:maraeo@gmail.com,m:lijo.lazar@amd.com,m:martin.roukala@mupuf.org,m:srinivasan.shanmugam@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de,mupuf.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BE316BD876


On 24/06/2026 08:38, Timur Kristóf wrote:
> Instead of storing pointers to affected rings in an array,
> just iterate over all rings of the device and filter the
> affected rings by type using the type mask.
> 
> This is done to save memory used by the array of affected
> rings which was sized AMDGPU_MAX_RINGS.
> 
> Suggested-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c   | 30 ++------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 53 ++++++++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  4 +-
>   3 files changed, 40 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> index 65505bc50399a..99ed0b0d82e94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> @@ -481,28 +481,6 @@ static u32 amdgpu_ring_mask_from_ip(const enum amd_ip_block_type ip_type)
>   	}
>   }
>   
> -/**
> - * amdgpu_filter_rings() - Filter rings according to a mask.
> - *
> - * @adev: amdgpu_device pointer
> - * @ring_type_mask: Mask of ring types you are looking for
> - * @out_rings: Array of rings which is going to be filled
> - * @out_num_rings: Number of rings which were filtered
> - */
> -static void amdgpu_filter_rings(struct amdgpu_device *adev, const u32 ring_type_mask,
> -				struct amdgpu_ring **out_rings, u32 *out_num_rings)
> -{
> -	u32 num_rings = 0;
> -	int i;
> -
> -	for (i = 0; i < adev->num_rings; ++i) {
> -		if (BIT(adev->rings[i]->funcs->type) & ring_type_mask)
> -			out_rings[num_rings++] = adev->rings[i];
> -	}
> -
> -	*out_num_rings = num_rings;
> -}
> -
>   /**
>    * amdgpu_device_ip_soft_reset() - Perform a graceful soft reset on an IP block.
>    *
> @@ -524,10 +502,9 @@ int amdgpu_device_ip_soft_reset(struct amdgpu_ring *guilty_ring,
>   				struct amdgpu_fence *guilty_fence)
>   {
>   	struct amdgpu_device *adev = guilty_ring->adev;
> -	struct amdgpu_ring *rings[AMDGPU_MAX_RINGS];
>   	struct amdgpu_ip_block *ip_block;
>   	enum amd_ip_block_type ip_type;
> -	u32 num_rings, ring_type_mask;
> +	u32 ring_type_mask;
>   	int r;
>   
>   	ip_type = amdgpu_ip_from_ring(guilty_ring->funcs->type);
> @@ -543,14 +520,13 @@ int amdgpu_device_ip_soft_reset(struct amdgpu_ring *guilty_ring,
>   		ip_block->version->funcs->name);
>   
>   	ring_type_mask = amdgpu_ring_mask_from_ip(ip_type);
> -	amdgpu_filter_rings(adev, ring_type_mask, rings, &num_rings);
>   
>   	amdgpu_device_lock_reset_domain(adev->reset_domain);
> -	amdgpu_multi_ring_reset_helper_begin(rings, num_rings, guilty_ring, guilty_fence);
> +	amdgpu_multi_ring_reset_helper_begin(ring_type_mask, guilty_ring, guilty_fence);
>   
>   	r = ip_block->version->funcs->soft_reset(ip_block);
>   
> -	r = amdgpu_multi_ring_reset_helper_end(rings, num_rings, guilty_ring, r);
> +	r = amdgpu_multi_ring_reset_helper_end(ring_type_mask, guilty_ring, r);
>   	amdgpu_device_unlock_reset_domain(adev->reset_domain);

Patch looks correct to me so:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I do however have some lamentations:

1)
ring_type_mask is derived directly from the guilty_ring so strictly 
speaking is redundant as parameter to begin/end helpers.

2)
Lets consider this sequence:

   ip_type = amdgpu_ip_from_ring(guilty_ring->funcs->type);
   ring_type_mask = amdgpu_ring_mask_from_ip(ip_type);

And expand it for say sdma:

ip_type = amdgpu_ip_from_ring(ring_type)
{
	switch (ring_type) {
	case AMDGPU_RING_TYPE_SDMA:
		return AMD_IP_BLOCK_TYPE_SDMA;

ring_mask_type = amdgpu_ring_mask_from_ip(ip_type)
{
	switch (ip_type) {
	case AMD_IP_BLOCK_TYPE_SDMA:
		return BIT(AMDGPU_RING_TYPE_SDMA);

Identity map kind of.

I am not sure it is worth it for the reset code on it's own, only if 
there are other places in the driver which ask the same question, but in 
general I am often tempted to just store those in the respective parent 
data structures at init time.

In this case that would be something like:

ring->ip_type - holding AMD_IP_BLOCK_TYPE_SDMA

ip_block->ring_mask - holding a bitmask mask of rings implemented

Again probably not worth the effort in this instance. I only mention it 
because there are similar things in the driver with much more often used 
invariant lookups which then waste a lot of space. For example the one I 
recently re-posted saves ~150KiB of .text:

https://lore.kernel.org/amd-gfx/20260622121034.52762-1-tvrtko.ursulin@igalia.com/

>   
>   	if (r) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 8062135e73a1d..ab5df854c1d20 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -884,8 +884,7 @@ int amdgpu_ring_reset_helper_end(struct amdgpu_ring *ring,
>   /**
>    * amdgpu_multi_ring_reset_helper_begin() - Prepare multiple rings for a reset.
>    *
> - * @rings: Pointer to an array of amdgpu rings that are affected.
> - * @num_rings: Number of rings in the array.
> + * @ring_type_mask: Bitmask of affected ring types
>    * @guilty_ring: The ring which is guilty of causing a reset.
>    * @guilty_fence: The fence which didn't signal on the guilty ring.
>    *
> @@ -904,7 +903,7 @@ int amdgpu_ring_reset_helper_end(struct amdgpu_ring *ring,
>    * After the reset is complete, the caller should then call
>    * amdgpu_multi_ring_reset_helper_end() to restore the rings.
>    */
> -void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_rings,
> +void amdgpu_multi_ring_reset_helper_begin(const u32 ring_type_mask,
>   					  struct amdgpu_ring *guilty_ring,
>   					  struct amdgpu_fence *guilty_fence)
>   {
> @@ -915,8 +914,11 @@ void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_ri
>   	int i;
>   	u32 t;
>   
> -	for (i = 0; i < num_rings; ++i) {
> -		ring = rings[i];
> +	for (i = 0; i < adev->num_rings; ++i) {
> +		ring = adev->rings[i];
> +
> +		if (!(BIT(ring->funcs->type) & ring_type_mask))
> +			continue;

Another thing to consider is if adding a succint helper for the ring 
walks would be interesting. Ie.

  amdgpu_for_each_ring(adev, ring, mask)

Regards,

Tvrtko

>   
>   		/* Don't accept new submissions on the ring. */
>   		if (amdgpu_ring_sched_ready(ring) && !drm_sched_is_stopped(&ring->sched))
> @@ -949,8 +951,11 @@ void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_ri
>   		rings_busy = false;
>   
>   		/* Check if any of the non-guilty rings are busy */
> -		for (i = 0; i < num_rings; ++i) {
> -			ring = rings[i];
> +		for (i = 0; i < adev->num_rings; ++i) {
> +			ring = adev->rings[i];
> +
> +			if (!(BIT(ring->funcs->type) & ring_type_mask))
> +				continue;
>   
>   			if (ring == guilty_ring)
>   				continue;
> @@ -966,8 +971,11 @@ void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_ri
>   		mdelay(10);
>   	}
>   
> -	for (i = 0; i < num_rings; ++i) {
> -		ring = rings[i];
> +	for (i = 0; i < adev->num_rings; ++i) {
> +		ring = adev->rings[i];
> +
> +		if (!(BIT(ring->funcs->type) & ring_type_mask))
> +			continue;
>   
>   		/*
>   		 * Find guilty fences, ie. the fences that didn't signal
> @@ -991,8 +999,7 @@ void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_ri
>   /**
>    * amdgpu_multi_ring_reset_helper_end() - Prepare multiple rings for a reset.
>    *
> - * @rings: Pointer to an array of amdgpu rings that are affected.
> - * @num_rings: Number of rings in the array.
> + * @ring_type_mask: Bitmask of affected ring types
>    * @guilty_ring: The ring which is guilty of causing a reset.
>    * @ret: Return code from the reset function.
>    *
> @@ -1004,7 +1011,7 @@ void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_ri
>    * be called to restore some state, but it won't attempt to
>    * fully restore the ring contents.
>    */
> -int amdgpu_multi_ring_reset_helper_end(struct amdgpu_ring **rings, u32 num_rings,
> +int amdgpu_multi_ring_reset_helper_end(const u32 ring_type_mask,
>   				       struct amdgpu_ring *guilty_ring, int ret)
>   {
>   	struct amdgpu_device *adev = guilty_ring->adev;
> @@ -1012,8 +1019,11 @@ int amdgpu_multi_ring_reset_helper_end(struct amdgpu_ring **rings, u32 num_rings
>   	int i, r;
>   
>   	/* Set preempt condition, rings are now allowed to execute submissions */
> -	for (i = 0; i < num_rings; ++i) {
> -		ring = rings[i];
> +	for (i = 0; i < adev->num_rings; ++i) {
> +		ring = adev->rings[i];
> +
> +		if (!(BIT(ring->funcs->type) & ring_type_mask))
> +			continue;
>   
>   		if (ring->funcs->init_cond_exec)
>   			amdgpu_ring_set_preempt_cond_exec(ring, true);
> @@ -1027,9 +1037,13 @@ int amdgpu_multi_ring_reset_helper_end(struct amdgpu_ring **rings, u32 num_rings
>   		return ret;
>   
>   	/* Restore contents of all rings */
> -	for (i = 0; i < num_rings; ++i) {
> -		ring = rings[i];
> +	for (i = 0; i < adev->num_rings; ++i) {
> +		ring = adev->rings[i];
> +
> +		if (!(BIT(ring->funcs->type) & ring_type_mask))
> +			continue;
>   
> +		/* Restore contents of the ring */
>   		r = amdgpu_ring_reset_helper_end(ring, ring->guilty_fence);
>   		if (r) {
>   			dev_err(adev->dev,
> @@ -1040,8 +1054,11 @@ int amdgpu_multi_ring_reset_helper_end(struct amdgpu_ring **rings, u32 num_rings
>   	}
>   
>   	/* Accept submissions on all rings again */
> -	for (i = 0; i < num_rings; ++i) {
> -		ring = rings[i];
> +	for (i = 0; i < adev->num_rings; ++i) {
> +		ring = adev->rings[i];
> +
> +		if (!(BIT(ring->funcs->type) & ring_type_mask))
> +			continue;
>   
>   		if (!amdgpu_ring_sched_ready(ring))
>   			continue;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index c272e0b028ad8..9d3934b4f1069 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -595,10 +595,10 @@ void amdgpu_ring_reset_helper_begin(struct amdgpu_ring *ring,
>   				    struct amdgpu_fence *guilty_fence);
>   int amdgpu_ring_reset_helper_end(struct amdgpu_ring *ring,
>   				 struct amdgpu_fence *guilty_fence);
> -void amdgpu_multi_ring_reset_helper_begin(struct amdgpu_ring **rings, u32 num_rings,
> +void amdgpu_multi_ring_reset_helper_begin(const u32 ring_type_mask,
>   					  struct amdgpu_ring *guilty_ring,
>   					  struct amdgpu_fence *guilty_fence);
> -int amdgpu_multi_ring_reset_helper_end(struct amdgpu_ring **rings, u32 num_rings,
> +int amdgpu_multi_ring_reset_helper_end(const u32 ring_type_mask,
>   				       struct amdgpu_ring *guilty_ring, int ret);
>   bool amdgpu_ring_is_reset_type_supported(struct amdgpu_ring *ring,
>   					 u32 reset_type);

