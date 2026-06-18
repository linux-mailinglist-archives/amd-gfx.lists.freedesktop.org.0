Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i9phBHC5M2r4FQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 11:25:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715169ED6A
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 11:25:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qTAvaI3H;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFBB10F224;
	Thu, 18 Jun 2026 09:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF24310ED2F
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 09:24:58 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ggwKy2sknz9tsq;
 Thu, 18 Jun 2026 11:24:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1781774694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQyI2dSUVTbIxU9Z89sIcmzDm/G1DUgMHNgWI4ZJ5/k=;
 b=qTAvaI3HKCPIAYsKjyBofzfFDje80NOiTqnRWVgGELAxvZdo3vL4ARJhwNO/BP0uhxbcQ4
 XaFoZoXbAFpvBBJOeEBjbl5utDzlPLQEp5XHPDJUUsxdcGVKbUw/XEcEuzwTt15SEcEv+b
 kH4PLI4gJ0Jzp3xTkGZ53i6iJKuAe/qm8OY1fMyaiiRy9GWy1QSL2h+kfmN67niTHIB7XE
 TJuKKgoSCTZupEfDs+9KPPNFL70RV3rRuMcJCJmembYPcWBIxpJzXfDRWI3GiMxkqw/1Tg
 FIZYIkzDoEAX2EyuKJJa8dLEDjEdBoCQFabTSBsw/ZYI7vphhPv6fwc2xbxfAw==
Message-ID: <d177cd76-4f98-4a23-b461-5fc0c0dd521d@mailbox.org>
Date: Thu, 18 Jun 2026 11:24:49 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/amd/display: check GRPH_FLIP status before
 sending event
To: Leo Li <sunpeng.li@amd.com>
Cc: Harry.Wentland@amd.com, mario.limonciello@amd.com, wiagn233@outlook.com,
 sysdadmin@m1k.cloud, timur.kristof@gmail.com, xaver.hugl@kde.org,
 mario.kleiner.de@gmail.com, stable@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20260616201828.389985-1-sunpeng.li@amd.com>
 <20260616201828.389985-3-sunpeng.li@amd.com>
 <a74f1233-d63f-4bcb-a379-3c9a6332cfb4@mailbox.org>
 <75732f3e-8ffd-4cac-b205-8f6cf705daab@mailbox.org>
 <7bf196dd-c43a-44b5-91e2-ee7ab40fd6f5@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <7bf196dd-c43a-44b5-91e2-ee7ab40fd6f5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xun9c4djyi6xzuuhzar54e78hjto4g44
X-MBO-RS-ID: 50ad6863b3a1faeff7c
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:mario.limonciello@amd.com,m:wiagn233@outlook.com,m:sysdadmin@m1k.cloud,m:timur.kristof@gmail.com,m:xaver.hugl@kde.org,m:mario.kleiner.de@gmail.com,m:stable@vger.kernel.org,m:timurkristof@gmail.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,outlook.com,m1k.cloud,gmail.com,kde.org,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6715169ED6A

On 6/17/26 21:27, Leo Li wrote:
> On 2026-06-17 04:56, Michel Dänzer wrote:
>> On 6/17/26 10:07, Michel Dänzer wrote:
>>> On 6/16/26 22:18, sunpeng.li@amd.com wrote:
>>>>
>>>> * Add a flip_programmed completion. Arm it (reinit_completion) under
>>>>   event_lock together with prepare_flip_isr(), and signal it
>>>>   (complete_all) right after update_planes_and_stream_adapter() programs
>>>>   the flip. It starts in the "completed" state at crtc init.
>>>
>>> Is the completion really necessary? Wouldn't moving the acrtc->pflip_status = AMDGPU_FLIP_SUBMITTED assignment after the flip programming suffice?
> 
> [...]
> >> Or even just moving the unlocking of event_lock after the flip programming.
> 
> I initially thought about doing so. But the possibility of update_planes_and_stream_adapter() sleeping made me think otherwise.

That is a problem.

If the flip programming could be done while holding event_lock, this could be made 100% reliable, avoiding the issue below.


> I suppose the worst case scenario with arming acrtc->event/pflip_status after programming is we deliver the event a frame later than it needs to be (which is also the case with the current patch), thus stalling the next commit via flip_done, and making userspace think it missed the programming deadline.

Yep. Hopefully won't happen too often in practice?


>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 00f7a3b445ebf..571198c46c0c2 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -4384,17 +4384,17 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>>>  		 * from 0 -> n planes we have to skip a hardware generated event
>>>>  		 * and rely on sending it from software.
>>>>  		 */
>>>> +		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>>>>  		if (acrtc_attach->base.state->event &&
>>>>  		    acrtc_state->active_planes > 0) {
>>>>  			drm_crtc_vblank_get(pcrtc);
>>>>  
>>>> -			spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>>>> -
>>>>  			WARN_ON(acrtc_attach->pflip_status != AMDGPU_FLIP_NONE);
>>>> +			/* Arm flip completion handling and event delivery */
>>>> +			reinit_completion(&acrtc_attach->dm_irq_params.flip_programmed);
>>>>  			prepare_flip_isr(acrtc_attach);
>>>> -
>>>> -			spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>>>>  		}
>>>> +		spin_unlock_irqrestore(&pcrtc->dev->event_lock, flags);
>>>>  
>>>>  		if (acrtc_state->stream) {
>>>>  			if (acrtc_state->freesync_vrr_info_changed)
>>>
>>> Pulling event_lock out of the if block doesn't make any difference (other than locking it unnecessarily when the block isn't entered 🙂, does it?
> 
> FWIU the crtc_state->event pointer itself should be guarded under event_lock, since it can be NULL'd concurrently.

Gotcha, I was fooled by the acrtc_attach->base.state->event disguise. :)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
