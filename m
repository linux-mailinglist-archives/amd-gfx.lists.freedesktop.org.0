Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JODfEpH9VmofEAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 05:25:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904DE75A432
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 05:25:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a9nFnHOA;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD9110E11B;
	Wed, 15 Jul 2026 03:25:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2546510E11B;
 Wed, 15 Jul 2026 03:25:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D7DB600BB;
 Wed, 15 Jul 2026 03:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731DB1F000E9;
 Wed, 15 Jul 2026 03:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1784085900;
 bh=jxiltSPYUvPydryUh4Z+BA9e7i6Gd73pT+TO6aqS/jc=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=a9nFnHOAWAL/IfU/rO/iwkNtCVDlL/kYUGawZyf7RsGv1A7Xe4QGsvHGtlpCfEYy2
 XQOWuYRpmy/hlUe9pDDiKJvl3cKKm8Kc3fwOcbUNjeawi8PvWfNGSrTbiNlmG+71Ft
 wz9+UEJCklZoO0SHoVREaJNdMd2SyqxvT6nL6YlBq7koXgoYzEOvbaJJzQHdAvXXcV
 2tzumr5fA0Uvn2bIwlHp9AZlK9oFiMFOyl1e5bX9TFsUFLH/kR6VTBFCpwm1www3uW
 ojFgTLvPsFHtC+6FWkYG9Qg/4DrcGUsWVHZwt35iiC1DAmeZoJ0SDZ7TkTErTgF2c6
 YKxW68ozYN37w==
Message-ID: <a72d0fca-b938-4e6a-b994-6c84d315a6ed@kernel.org>
Date: Tue, 14 Jul 2026 22:24:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix writeback completion timing
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>
References: <20260711033159.3096477-1-alex.hung@amd.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, mwen@igalia.com, tzimmermann@suse.de, ray.wu@amd.com,
 jpeisach@ubuntu.com, cristian.ciocaltea@collabora.com,
 timur.kristof@gmail.com, ivan.lipski@amd.com, chen-yu.chen@amd.com,
 srinivasan.shanmugam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260711033159.3096477-1-alex.hung@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,suse.de,ubuntu.com,collabora.com,lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 904DE75A432



On 7/10/26 22:31, Alex Hung wrote:
> [WHY]
> The out fence was signalled on the first vblank after arming, before the
> DMA finished copying, and the old code worked around this with an
> mdelay() in the IRQ handler.
> 
> [HOW]
> Hold a vblank reference while writeback is pending and signal the out
> fence on the second vblank instead of using mdelay(). Add
> amdgpu_dm_crtc_complete_writeback() to finish and clean up writeback
> from both the IRQ and teardown paths.
> 
> This can be verified by running IGT's kms_writeback 20 times without
> timeout errors.
> 
> Assisted-by: Copilot:Claude-Opus-4.8
> Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  1 +
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 ++
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c | 33 ++++++++++---------
>   3 files changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 8069fc41cc7f..7c784277396a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -509,6 +509,7 @@ struct amdgpu_crtc {
>   	struct drm_pending_vblank_event *event;
> 
>   	bool wb_pending;
> +	bool wb_frame_done;
>   	bool wb_enabled;
>   	struct drm_writeback_connector *wb_conn;
>   };
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d67dcaa3fa8f..0f5453649200 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4521,6 +4521,7 @@ bool amdgpu_dm_crtc_complete_writeback(struct amdgpu_crtc *acrtc)
>   	spin_lock_irqsave(&acrtc->wb_conn->job_lock, flags);
>   	pending = acrtc->wb_pending;
>   	acrtc->wb_pending = false;
> +	acrtc->wb_frame_done = false;
>   	spin_unlock_irqrestore(&acrtc->wb_conn->job_lock, flags);
> 
>   	if (!pending)
> @@ -4988,6 +4989,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
>   	 * cannot run its matching vblank_put before this get.
>   	 */
>   	WARN_ON(drm_crtc_vblank_get(&acrtc->base));
> +	acrtc->wb_frame_done = false;
>   	acrtc->wb_pending = true;
>   }
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> index c5467f34c51f..4de7fb264cb2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> @@ -1974,23 +1974,26 @@ static void dm_crtc_high_irq(void *interrupt_params)
>   		return;
> 
>   	if (acrtc->wb_conn && acrtc->wb_pending) {
> -		struct dc_stream_state *stream = acrtc->dm_irq_params.stream;
> -		unsigned int v_total, refresh_hz;
> -
> -		v_total = stream->adjust.v_total_max ?
> -			  stream->adjust.v_total_max : stream->timing.v_total;
> -		refresh_hz = div_u64((uint64_t) stream->timing.pix_clk_100hz *
> -			     100LL, (v_total * stream->timing.h_total));
> -		mdelay(1000 / refresh_hz);
> -
> -		/*
> -		 * Completion (signalling the out fence and releasing the vblank
> -		 * reference taken in dm_set_writeback()) is handled by the shared
> -		 * helper, which is also used by the teardown path.
> -		 */
> -		if (amdgpu_dm_crtc_complete_writeback(acrtc))
> +		if (acrtc->wb_frame_done) {
> +			/*
> +			 * Second vblank: the DMA for the captured frame has
> +			 * had a full frame period to flush to memory. Signal
> +			 * the out fence now.
> +			 */
> +			amdgpu_dm_crtc_complete_writeback(acrtc);
> +		} else {
> +			/*
> +			 * First vblank after arming: the frame has been
> +			 * scanned out and the DMA is finishing. Disable
> +			 * writeback immediately to prevent the hardware from
> +			 * starting a new capture that would overwrite the
> +			 * buffer. Signal completion on the next vblank to
> +			 * ensure the DMA is fully flushed to memory.
> +			 */
>   			dc_stream_fc_disable_writeback(adev->dm.dc,
>   						       acrtc->dm_irq_params.stream, 0);
> +			acrtc->wb_frame_done = true;
> +		}
>   	}
> 
>   	vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
> --
> 2.43.0
> 

