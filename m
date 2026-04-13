Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIBaIObZ3GmcWQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 13:56:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0F3EB9DE
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 13:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99D10E40F;
	Mon, 13 Apr 2026 11:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="CBVL7J8q";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="mLuEzuIX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97FC10E0F7
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2026 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1776081375;
 bh=7cvaLdmsV1sDukQkd5jgRgV
 dSzoLRBaySwz43K7vqwQ=; b=CBVL7J8qRiom59bCev07NWzAk5+Nzw0XYpQtfQe7hMQDUirzeG
 mVedGKPSSlY7I12ZuzRj/RSN46Sb/lSaBKDRgLi2p/byzLFJYaNXioNgZeARpWyGz0W0eg3M6gl
 mRFMhC4GOHBs/slA8Kbzl5c8M03KGEttO3vlQtfIpJo2z4z0GjOF3JCO/JXDUOq1phy2paG5QjI
 gdmrq2qKL9F12FpejmqIJQD1zHQ8W51IV5Y/YNBbBN7YthpzT9mWNWXmqpkCgfiz2i7iNtA4lS3
 HKJeT8DLHC9cA46j09bIsfWcEv7s6xnGZreOILWnbmOGIKz4NjGei0K7SSCv6i86lJQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1776081375; bh=7cvaLdmsV1sDukQkd5jgRgV
 dSzoLRBaySwz43K7vqwQ=; b=mLuEzuIX0XZcYRE8ZZKi+yvvy/dEIE/QDTgQGZ8zl7GVONPRV5
 LHC83FPI/xGH+g9uQRwR2Yx1uq1kCgzPbjAQ==;
Message-ID: <56e81193-13ad-476e-aa24-06c46bb39454@damsy.net>
Date: Mon, 13 Apr 2026 13:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: fix NULL pointer dereference in
 amdgpu_devcoredump_format
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
References: <20260410013639.129917-1-vitaly.prosyak@amd.com>
 <20260410013639.129917-2-vitaly.prosyak@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20260410013639.129917-2-vitaly.prosyak@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408r,damsy.net:s=202408e];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:vitaly.prosyak@amd.com,m:pierre-eric.pelloux-prayer@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:jesse.zhang@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[damsy.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,damsy.net:dkim,damsy.net:mid]
X-Rspamd-Queue-Id: EBC0F3EB9DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Le 10/04/2026 à 03:35, vitaly.prosyak@amd.com a écrit :
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> A race condition in the devcoredump code causes a NULL pointer
> dereference in amdgpu_devcoredump_format() when two GPU resets occur
> in quick succession.
> 
> The sequence of events:
> 
> 1. First reset calls amdgpu_coredump(), creates coredump1, sets
>     adev->coredump = coredump1, and queues the deferred work.
> 2. The deferred work begins executing (work_pending() returns false
>     since the work is now running, not just queued).
> 3. A second reset calls amdgpu_coredump(). work_pending() returns
>     false because the work is running, so amdgpu_coredump() proceeds:
>     creates coredump2, overwrites adev->coredump = coredump2, and
>     re-queues the deferred work with queue_work().
> 4. The first deferred work finishes and unconditionally sets
>     adev->coredump = NULL, destroying the reference to coredump2.
> 5. The re-queued deferred work starts and reads
>     adev->coredump = NULL. It then passes this NULL into
>     amdgpu_devcoredump_format() which dereferences coredump->adev
>     (offset 0 in the struct), triggering:
> 
>     KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>     RIP: 0010:amdgpu_devcoredump_format+0xa6/0x36b0 [amdgpu]
> 
> This was observed during the amd_deadlock IGT test where multiple
> subtests trigger rapid ring resets. The dmesg log shows four
> coredumps created within 120ms (at 102.377s, 104.424s, 104.492s,
> and 104.497s), with the crash occurring 13ms after the last one.
> 
> Fix this with three changes:
> 
> - Replace work_pending() with work_busy() in amdgpu_coredump() to
>    also reject new coredumps while the deferred work is executing,
>    not just when it is queued. This closes the main race window.
> 
> - Add a defensive NULL check for adev->coredump at the start of
>    amdgpu_devcoredump_deferred_work() to prevent the crash if the
>    race still occurs (work_busy() is advisory, not a full barrier).
> 
> - Guard the unconditional coredump->pasid = job->pasid assignment
>    with a NULL check on job, since callers can pass job=NULL (as
>    evidenced by the existing if (job && job->pasid) pattern).
> 
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

The Fixes: tag is missing for this commit.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 8edec416fe2b..5cfd9ecccdf2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -464,6 +464,9 @@ static void amdgpu_devcoredump_deferred_work(struct work_struct *work)
>   	struct amdgpu_device *adev = container_of(work, typeof(*adev), coredump_work);
>   	struct amdgpu_coredump_info *coredump = adev->coredump;
>   
> +	if (!coredump)
> +		goto end;
> +
>   	/* Do a one-time preparation of the coredump output because
>   	 * repeatingly calling drm_coredump_printer is very slow.
>   	 */
> @@ -499,7 +502,7 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>   	int i, off, idx;
>   
>   	/* No need to generate a new coredump if there's one in progress already. */
> -	if (work_pending(&adev->coredump_work))
> +	if (work_busy(&adev->coredump_work))
>   		return;
>   
>   	if (job && job->pasid)
> @@ -511,7 +514,8 @@ void amdgpu_coredump(struct amdgpu_device *adev, bool skip_vram_check,
>   
>   	coredump->skip_vram_check = skip_vram_check;
>   	coredump->reset_vram_lost = vram_lost;
> -	coredump->pasid = job->pasid;
> +	if (job)
> +		coredump->pasid = job->pasid;

Nit: This line could be moved in the existing if (job && job->pasid).

The series look good and is:

Reviewed-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Thanks!

>   
>   	if (job && job->pasid) {
>   		struct amdgpu_task_info *ti;
