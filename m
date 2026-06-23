Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D4l1KZ1DOmr/4wcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:28:13 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D746B545E
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:28:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JPC8ilqp;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F22410E9FF;
	Tue, 23 Jun 2026 08:28:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074E910E9FF
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 08:28:09 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gkyr56Ljgz9tqv;
 Tue, 23 Jun 2026 10:28:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1782203285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJimQdzybTxzTLGbKtZM1e8rYaAZQLBVJJujT6gBEis=;
 b=JPC8ilqp8nnQ4aN499Qi/XAZ92ws7JYpGM9wcnJvfQYq2+QgymDOolFOoI3jJ1yyXFc6c7
 5b1PPRW4aj5BbQYO2eOF7LI/lCw5Oh/CZfTFisW/PFI2Y5FWStfDqSTDtiGe1x31nB70ZS
 l/J+xIZ8Wp5SLgz4QbpXOuPk0nzfXDb6cmyJ6f5g7GXhAhspDh/b5k5+6b7Ndoi0EdDIsG
 J18HyzhAun1RI4XTVYVVj5sfCjd9XhVp+r+/Lj19BS9XqoA/9VOH2BLB+wp9Io1IWHA+Ie
 tbV0ywdxrapdd5WiDHTEZUN0Pyka3iBK5LbV009Mk1uM9n0oLbyKQvN1Y9jycA==
Message-ID: <f36d5096-b509-42b7-8a11-423c03c05919@mailbox.org>
Date: Tue, 23 Jun 2026 10:28:00 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] drm/amd/display: check GRPH_FLIP status before
 sending event
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, mario.limonciello@amd.com, wiagn233@outlook.com,
 sysdadmin@m1k.cloud, timur.kristof@gmail.com, xaver.hugl@kde.org,
 mario.kleiner.de@gmail.com, matthew.schwartz@linux.dev, chris@kode54.net,
 stable@vger.kernel.org
References: <20260622171752.73374-1-sunpeng.li@amd.com>
 <20260622171752.73374-3-sunpeng.li@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20260622171752.73374-3-sunpeng.li@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4p1kghpoqgpc6odtkt3cgxgochkn6agr
X-MBO-RS-ID: b2c8e0ce78beb67af8b
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
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:mario.limonciello@amd.com,m:wiagn233@outlook.com,m:sysdadmin@m1k.cloud,m:timur.kristof@gmail.com,m:xaver.hugl@kde.org,m:mario.kleiner.de@gmail.com,m:matthew.schwartz@linux.dev,m:chris@kode54.net,m:stable@vger.kernel.org,m:timurkristof@gmail.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,outlook.com,m1k.cloud,gmail.com,kde.org,linux.dev,kode54.net,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2D746B545E

On 6/22/26 19:17, sunpeng.li@amd.com wrote:
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index da118377b73a8..732ddafb5cfea 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4135,6 +4135,28 @@ static void amdgpu_dm_enable_self_refresh(struct amdgpu_display_manager *dm,
>  	}
>  }
>  
> +static void dm_arm_vblank_event(struct amdgpu_crtc *acrtc,
> +				struct dm_crtc_state *acrtc_state,
> +				bool pflip_update,
> +				bool cursor_update)
> +{
> +	assert_spin_locked(&acrtc->base.dev->event_lock);
> +
> +	if (pflip_update && acrtc->base.state->event &&
> +	acrtc_state->active_planes > 0) {
> +		drm_crtc_vblank_get(&acrtc->base);
> +		WARN_ON(acrtc->pflip_status != AMDGPU_FLIP_NONE);
> +		/* Arm flip completion handling and event delivery after programming. */
> +		prepare_flip_isr(acrtc);
> +	} else if (cursor_update && acrtc_state->active_planes > 0) {
> +		if (acrtc->base.state->event) {
> +			drm_crtc_vblank_get(&acrtc->base);
> +			acrtc->event = acrtc->base.state->event;
> +			acrtc->base.state->event = NULL;
> +		}
> +	}
> +}

This looks like it can be cleaned up a bit (feel free to ignore though):

{
	assert_spin_locked(&acrtc->base.dev->event_lock);

	if (acrtc->base.state->event && acrtc_state->active_planes > 0) {
		if (pflip_update) {
			drm_crtc_vblank_get(&acrtc->base);
			WARN_ON(acrtc->pflip_status != AMDGPU_FLIP_NONE);
			/* Arm flip completion handling and event delivery after programming. */
			prepare_flip_isr(acrtc);
		} else if (cursor_update) {
			drm_crtc_vblank_get(&acrtc->base);
			acrtc->event = acrtc->base.state->event;
			acrtc->base.state->event = NULL;
		}
	}
}


> +	/*
> +	 * DCE depends on a combination of GRPH_FLIP, VLINE0, and VUPDATE for
> +	 * event delivery. Only GRPH_FLIP handler can send pflip events, and it
> +	 * only fires if HW latched to the flip. Maintain legacy behavior by
> +	 * arming event before programming.
> +	 */
> +	if (amdgpu_ip_version(dm->adev, DCE_HWIP, 0) == 0) {
> +		scoped_guard(spinlock_irqsave, &pcrtc->dev->event_lock)
> +			dm_arm_vblank_event(acrtc_attach, acrtc_state,
> +					pflip_present, cursor_update);
>  	}

Coding style:

	if (amdgpu_ip_version(dm->adev, DCE_HWIP, 0) == 0) {
		scoped_guard(spinlock_irqsave, &pcrtc->dev->event_lock) {
			dm_arm_vblank_event(acrtc_attach, acrtc_state,
					    pflip_present, cursor_update);
		}
	}

Nested multi-line statements require curly braces.


> +		if (updated_planes_and_streams)
> +			flip_latched_during_prog =
> +				!dc_get_flip_pending_on_otg(dm->dc, acrtc_attach->otg_inst);

		if (updated_planes_and_streams) {
			flip_latched_during_prog =
				!dc_get_flip_pending_on_otg(dm->dc, acrtc_attach->otg_inst);
		}


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
