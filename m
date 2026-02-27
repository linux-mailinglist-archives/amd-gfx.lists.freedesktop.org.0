Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKIfINVcoWmDsQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:59:01 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E571B4CDE
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:59:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C610EA69;
	Fri, 27 Feb 2026 08:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="wFa8NRUp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4822810EA69
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1772182735; bh=S+Ma0S7CWv5JSDVI0O/U/wKK7fJ+BduzE80lcKE/0T8=;
 h=Subject:From:To:Cc:References:In-Reply-To;
 b=wFa8NRUpVaETHHn7ZZPMGExRlBP68K0xGBN0VMlSXOIEj2Zgq4w1hUMRs0R1GODhK
 GF+7QOkXAso5NfkRaq04ymTFLNi37K3GfB6xU8hdj65ebD2AgWQVkistoNN6HSyrd9
 DPsrActjyyWR4BGtbaFE44RQ7YPvhc8FXmBnq6NcHJS3GnAJ4qe0UMT0m7Fn8RvrDy
 ftGK2SCcnnHi9GQDaqlw1agXpbe2+tNZDo3Q0Z/w94QKhpHuRYGb1saw57v19paiV0
 SRKcdg2a9GJnt6i0GkBnTI5ZW384d/q1jaQc2uL0sGY6hdH7eZXgA4b6ttZGueMS1V
 H4tH+KiCN83xQ==
Message-ID: <bc9b30d6-3ca9-44f0-825f-82b1142c8b48@m1k.cloud>
Date: Fri, 27 Feb 2026 09:58:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] drm/amd/display: complete cursor vblank events
 immediately
From: Michele Palazzi <sysdadmin@m1k.cloud>
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, siqueira@igalia.com
References: <20260217191632.1243826-1-sysdadmin@m1k.cloud>
 <f43075c8-e5f1-426c-b70e-743d1e7e4c59@amd.com>
 <84316e45-f596-49c4-b3e7-cdfc7a19a519@m1k.cloud>
Content-Language: en-US
In-Reply-To: <84316e45-f596-49c4-b3e7-cdfc7a19a519@m1k.cloud>
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
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:harry.wentland@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:siqueira@igalia.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sysdadmin@m1k.cloud,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,m1k.cloud:mid,m1k.cloud:dkim]
X-Rspamd-Queue-Id: B8E571B4CDE
X-Rspamd-Action: no action

On 2/27/26 09:53, Michele Palazzi wrote:
> On 2/23/26 16:27, Leo Li wrote:
>>
>> Really nice debuging work, thanks for catching this!
>>
>> Ideally, the cursor event should be delivered when hardware latches 
>> onto the new
>> cursor info and starts scanning it out. The latching event fires an 
>> interrupt
>> that should be handled by dm_crtc_high_irq().
>>
>> dm_pflip_high_irq() handles an interrupt specifically for when 
>> hardware latches
>> onto a new fb address; I don't think it actually fires when there's a
>> cursor-only update. I think if we really want to do it right, we can have
>> another "acrtc_attach->cursor_event" just for cusror-only updates, and 
>> deliver
>> the event in crtc_high_irq().
>>
>> In any case, I don't foresee any major issues with delivering the 
>> event early.
>> And since it fixes an ongoing issue:
>>
>> Reviewed-by: Leo Li <sunpeng.li@amd.com>
>>
>> Thanks!
>> Leo
> 
> Thanks for the review. Further testing confirms that both this patch and 
> increasing the dGPU vblank offdelay (from 2 frames to ~50 frames) 
> independently eliminate the flip timeouts in my testing. Both work by 
> reducing the frequency of vblank disable/re-enable cycles, basically 
> either could be an interim fix.
> 
> Your deferred vblank enable/disable series https://lore.kernel.org/amd- 
> gfx/20260224212639.390768-1-sunpeng.li@amd.com/T/#t looks like it could 
> be the proper solution going forward instead (haven't tested it).
> 

fixed siqueira@igalia.com cc
