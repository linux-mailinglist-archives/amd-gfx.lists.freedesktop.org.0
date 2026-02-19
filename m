Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMLJLKAyl2kcvgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 16:56:16 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6FB1606E0
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 16:56:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4164110E023;
	Thu, 19 Feb 2026 15:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="YTnJ6TvB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7E010E023
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Feb 2026 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1771516570; bh=jE2A3dsw917KNDecUWJNPvfTdN/5jI1GVsVEIfU1miY=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=YTnJ6TvBxdXOqm9RxJSD2PRUBL6bxB4YpCA/3sFRX+/R/+v9+8onazFfVWY0MXbM+
 UK9mJS5tkPgFaIlQO5gWDrte4R4b2dpcxB37QGNmhWPYi1y8kjfUhshoRGRTPQqnbD
 CsLdvsTLZsYf7C9QCu5N4Zi5he+1KgLjkeyqnmX8z6tC75OicWKTN4O+2dd5Rxc9XE
 1di3WofuHsCQQyWjXlxun9ytXqe+IXVlJMQNLEnwiNjKCbsEdRSlEshryq0F2ysKLB
 +HFNRoe55x+99rv5yxaDa/pw0eD5kDpJLDrffzaiHdI0pjtNb9YPuH6Wzag++MWI9C
 jvH3iUWzjYUHg==
Message-ID: <6b91ca71-40fe-4be3-b007-cda351580d39@m1k.cloud>
Date: Thu, 19 Feb 2026 16:56:10 +0100
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
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <43954b65-db3c-4f6b-837f-e025ac84788f@mailbox.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:harry.wentland@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 1F6FB1606E0
X-Rspamd-Action: no action


On 2/19/26 14:59, Michel Dänzer wrote:
> Can't the issue be solved by fixing the pflip_status handling in the vblank handler?
> I guess that might also hit the second race condition:
> 
>> - If vblank is disabled by the off-delay timer before the handler
>>    runs, the PENDING cursor event is never delivered and the commit hangs.
> 
> That sounds like the drm_crtc_vblank_get/put handling might be incorrect in amdgpu_dm.
> 
> In a nutshell, the vblank interrupt is kept enabled as long as there have been more
> drm_crtc_vblank_get calls than _put ones for the CRTC. I.e. amdgpu_dm needs to call the former under circumstances where it needs the interrupt to be on, and the latter only once it's no longer needed for those circumstances (in this case when sending the event).


The get/put pairing seems correct, the issue is that cursor and pflip 
share the same acrtc->event slot, so the pflip_status check in the 
vblank handler can race. Adding a dedicated cursor_event field, separate 
from event used by pflip, could maybe solve the whole thing?
