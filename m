Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GynDK1EsGmshgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 17:19:57 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B021254973
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Mar 2026 17:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4985610E76C;
	Tue, 10 Mar 2026 16:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="lTg8uTQ/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF3F10E770
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Mar 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1773159588; bh=XfahCbbBU42ppEMWysnEU/L4fJqy3ZGLvsy1TKI8SSs=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=lTg8uTQ/6HD4Xyg5U3nIC6GCcv3uJ1SAkS2ptmXM+7PI/C5tzmyk/MnUvZm8T4cGT
 AVN2HLPfl3zFuQL9ORer4LVL7oDFEIMcglIDIuk8JwM1ejNHxzjwLSvW3xWABHckdm
 SpLBY/xfp02Eutn52jrih0nzI4RxxPC3MG4YnfM+dkoDZV2+gUZSqZezP27TfYub2I
 gkD9HYzeN4JsXCWvjlcyeubdsKHZ0Ip2z8VesZtUuDuIVaDvWvz9ZMruzMYtwNSLFy
 SHgQfj4E7UkLrqRtcLXE0uiZIrjHz4wB+uGp/dwbUlN2djGYgoKQXGsb1yG5CvadEH
 IR6nnfw+nMP1g==
Message-ID: <a1e5c22c-20b9-4802-8246-cd93029c5e5b@m1k.cloud>
Date: Tue, 10 Mar 2026 17:19:48 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/amd/display: Save cursor-only vblank event seperately
 from pflips
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org
Cc: Harry.Wentland@amd.com, superm1@kernel.org, michel.daenzer@mailbox.org
References: <20260305222131.160914-1-sunpeng.li@amd.com>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <20260305222131.160914-1-sunpeng.li@amd.com>
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
X-Rspamd-Queue-Id: 5B021254973
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:Harry.Wentland@amd.com,m:superm1@kernel.org,m:michel.daenzer@mailbox.org,s:lists@lfdr.de];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m1k.cloud:dkim,m1k.cloud:mid,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/5/26 23:21, sunpeng.li@amd.com wrote:
> From: Leo Li <sunpeng.li@amd.com>
> 
> [Why]
> 
> It's suspected that there's a race condition where cursor-only updates
> can race with page-flip updates when updating the amdgpu_crtc->event,
> which is used to track the pending vblank event until it's send by the
> interrupt handler.
> 
> Theoretically, DRM should prevent concurrent updates on the same CRTC.
> But evidently, according to findings[1] on a previous attemp to fix
> this, there is a race.
> 
> [How]
> 
> Save pending vblank events from cursor-only updates seperately in
> amdgpu_crtc->cursor_event. Since cursor updates won't arm the pflip_irq
> to fire, we'll send it in crtc/vupdate_irq handlers.
> 
> [1] https://lore.kernel.org/amd-gfx/20260217191632.1243826-1-sysdadmin@m1k.cloud/
> 

fyi i am testing this patch, looking good so far but i'd give it another 
24 hours to be sure
