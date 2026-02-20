Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PxGFjhBmGneDwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 12:10:48 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD771672AA
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Feb 2026 12:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2A410E7B8;
	Fri, 20 Feb 2026 11:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="RnG+c/tT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B6D10E7B8
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Feb 2026 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1771585841; bh=asfgtfKfQeVveokKthwyiOEzF4/2GzTrIvHaLs2LsTg=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=RnG+c/tTCL0oGucwErQPwyJRFIlK26QzIvm1WM0gEuJbqo23698YXW9k3vFxr2qdm
 8flbTInr29E/4y9DWU6i575/RgU5Bq7/+5NeIYDUaaXDcH2X+kCCFPEm6g8n53Zi84
 OAh0opqWggCe0xkQnkEcJG4zDVUH52R/qu9CjiaYq5fVl5MtOsL2V8ApnpN6JguxkP
 PgAw2sBHQ+QoB/236fZYyCn0LYEWcLYGTLte6dSBdTdfYbzph/8FYhq8Dc5mLUHHdZ
 INou4ecBQ4zM7novcQTMe/wrVpB4Ea7G4rLgk5u/fo8UM84tjC6Tis7yoGW+4OAgds
 bQP+iPbjEsxCw==
Message-ID: <0e416077-3443-4985-8988-496524958ebb@m1k.cloud>
Date: Fri, 20 Feb 2026 12:10:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] drm/amd/display: complete cursor vblank events
 immediately
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org
References: <20260218003104.1256473-1-sysdadmin@m1k.cloud>
 <02cb98e2-5666-45ca-be15-93c93f517238@mailbox.org>
 <44af0f28-8731-4c54-8bf6-0e844eb14b14@m1k.cloud>
 <d2d820a1-0320-4047-8837-2fed0186f4cf@mailbox.org>
 <001df5d5-4602-47f6-9d04-5c94f83d40d0@m1k.cloud>
 <43954b65-db3c-4f6b-837f-e025ac84788f@mailbox.org>
 <6b91ca71-40fe-4be3-b007-cda351580d39@m1k.cloud>
 <9ffdc1e3-cf1a-424f-b7b0-6e7a5da49120@mailbox.org>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <9ffdc1e3-cf1a-424f-b7b0-6e7a5da49120@mailbox.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:harry.wentland@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DCD771672AA
X-Rspamd-Action: no action

On 2/19/26 17:02, Michel Dänzer wrote:
> "If vblank is disabled by the off-delay timer before the handler runs, the PENDING cursor event is never delivered" indicates otherwise. If the handling was correct, the vblank interrupt should never be disabled before the handler runs.

You are correct again, calling drm_crtc_vblank_get() ensures the 
off-delay timer cannot disable the interrupt before handler runs.
I will add a fallback to check if it fails and send the event 
immediately only in that case, this would prevent hangs for disabled crtcs.

> Maybe? If the vblank event handler never needs to send an event for a flip.

This point would be covered with a dedicated cursor_event, the vblank 
handler only touches cursor_event, never acrtc->event. So the condition 
is met.
Unless advised against it I will be moving in this direction testing 
this approach, and if nothing unforeseen arises send a v2 when ready.
Thanks for the guidance.
