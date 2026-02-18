Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHXBMTftlmmxrAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 12:00:07 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97015E11B
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Feb 2026 12:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7915110E6C2;
	Thu, 19 Feb 2026 11:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="WHWLwiRs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B7B10E59E
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Feb 2026 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1771409374; bh=b13CRDRWY7m0QdxhY2EQ1/+9RywH/Hi6A6ec55Hjluk=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=WHWLwiRsNOjW5w51k1TuCDu7zgcUNrM/VB5n3ePCp4lsVi9gPS+Oxs5SGWugBsYRn
 QFAffa/msg9Do1ZkzOUh5I7gI6PayELOkYqespNGPlJtchmbBL/bmJUuMkDQvlLhm9
 6UQvtv71iMAjsOIiCVG8i2ETPLq6L/3FUTx0n3Yz8PBTmuD0Z2TOBARBBnVsMF/MJd
 RneFLynkXfkn+pnCm3nJdBkfVGfZh95uYTYTboeDifN0oIpTQRIBn+GK9rWPgS965T
 q4agA7Oi6QrHiC6nr+A5mliFqAFPIVHLbXj81RGygMAbGqjQ9AXu4fOJwzzDiEt4pg
 +DQLES3DeIchQ==
Message-ID: <44af0f28-8731-4c54-8bf6-0e844eb14b14@m1k.cloud>
Date: Wed, 18 Feb 2026 11:09:34 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] drm/amd/display: complete cursor vblank events
 immediately
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 sunpeng.li@amd.com
References: <20260218003104.1256473-1-sysdadmin@m1k.cloud>
 <02cb98e2-5666-45ca-be15-93c93f517238@mailbox.org>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <02cb98e2-5666-45ca-be15-93c93f517238@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 19 Feb 2026 10:59:48 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[24];
	DMARC_POLICY_ALLOW(-0.50)[m1k.cloud,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[m1k.cloud:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:harry.wentland@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[m1k.cloud:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m1k.cloud:mid,m1k.cloud:dkim]
X-Rspamd-Queue-Id: 7A97015E11B
X-Rspamd-Action: no action

Yes, but the original code path had the same problem.

Would drm_crtc_arm_vblank_event() be more appropriate here? The concern 
is that it reintroduces the starvation race if the vblank off-delay 
fires before the interrupt.

On 2/18/26 10:41, Michel Dänzer wrote:
> On 2/18/26 01:31, Michele Palazzi wrote:
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index a8a59126b2d2..35987ce80c71 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -10168,8 +10168,7 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>>   	} else if (cursor_update && acrtc_state->active_planes > 0) {
>>   		spin_lock_irqsave(&pcrtc->dev->event_lock, flags);
>>   		if (acrtc_attach->base.state->event) {
>> -			drm_crtc_vblank_get(pcrtc);
>> -			acrtc_attach->event = acrtc_attach->base.state->event;
>> +			drm_crtc_send_vblank_event(pcrtc, acrtc_attach->base.state->event);
> 
> Can this code run before start of vblank? If yes, the event would have the wrong sequence number and timestamp.
> 
> 

