Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLyrHGfvlmngrAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 12:09:27 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B915E2C5
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 12:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE7810E689;
	Thu, 19 Feb 2026 11:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="sprgLZrA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99AEE10E689
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Feb 2026 11:09:23 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fGrHN169Sz9ssB;
 Thu, 19 Feb 2026 12:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1771499360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cij18fF+5q3Rzjolkw/VR7hRWsRz5yj4DamHzZW2SVU=;
 b=sprgLZrAl+Hm0PNqnYgM+J3e91x5XHLJ7F6g0imVoMndsuz8Yb8zHya0NCOEQ60vHMjUiT
 9bOJJpQe9AD4teyG2AZe890sOpvSJtlKmHW4ZGA99g4Kam73UZXPEG7rFlB0pqwKoVmC0G
 7om2gwvpe6/e+gA6djSHSAjyANDkG+j5tvNpPRDlhkvFzMO4fTOO+0y70bX+/5Jg88KO8e
 wgpa8w4eAuX3ZvH9xYNHKfemixyPSCXMHMreXrfpnQnyOI5waR45bGKI7OOzeqctjcimg4
 GCN1SIChOO+01Bo6JNbUdybq+tpbeIRS0rypdLiMs4mI3wTA/NSdpkVjQliGHg==
Message-ID: <d2d820a1-0320-4047-8837-2fed0186f4cf@mailbox.org>
Date: Thu, 19 Feb 2026 12:09:17 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] drm/amd/display: complete cursor vblank events
 immediately
To: Michele Palazzi <sysdadmin@m1k.cloud>
Cc: harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org
References: <20260218003104.1256473-1-sysdadmin@m1k.cloud>
 <02cb98e2-5666-45ca-be15-93c93f517238@mailbox.org>
 <44af0f28-8731-4c54-8bf6-0e844eb14b14@m1k.cloud>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <44af0f28-8731-4c54-8bf6-0e844eb14b14@m1k.cloud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: cciwunpaxcyua51fc669nrc8q63zx8dk
X-MBO-RS-ID: 08215879b910e6f2e77
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sysdadmin@m1k.cloud,m:harry.wentland@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:mid,mailbox.org:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ED6B915E2C5
X-Rspamd-Action: no action


[ Fixed up the top-posting, please don't ]

On 2/18/26 11:09, Michele Palazzi wrote:
> On 2/18/26 10:41, Michel Dänzer wrote:
>> On 2/18/26 01:31, Michele Palazzi wrote:
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index a8a59126b2d2..35987ce80c71 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -10168,8 +10168,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>>       } else if (cursor_update && acrtc_state->active_planes > 0) {
>>>           spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>>>           if (acrtc_attach->base.state->event) {
>>> -            drm_crtc_vblank_get(pcrtc);
>>> -            acrtc_attach->event = acrtc_attach->base.state->event;
>>> +            drm_crtc_send_vblank_event(pcrtc, acrtc_attach->base.state->event);
>>
>> Can this code run before start of vblank? If yes, the event would have the wrong sequence number and timestamp.
>
> Yes, but the original code path had the same problem.

Are you sure?

I'd expect the original code to send the event only when an interrupt fires during vblank, at which point the values are correct.


> Would drm_crtc_arm_vblank_event() be more appropriate here? The concern is that it reintroduces the starvation race if the vblank off-delay fires before the interrupt.

Not sure that could happen, some of the issues discussed in the comment above drm_crtc_arm_vblank_event might apply though.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
