Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAwjKoZboWmDsQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:53:26 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197961B4BDA
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 09:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741D610EA68;
	Fri, 27 Feb 2026 08:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=m1k.cloud header.i=@m1k.cloud header.b="ZwY/ZHnm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.m1k.cloud (mail.m1k.cloud [195.231.66.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32D10EA68
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 08:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=m1k.cloud; s=mail;
 t=1772182401; bh=PQSyTl9guSU+z6/pPlMF4+EUtu4f+h4qt8VCSJp/+Pc=;
 h=Subject:To:Cc:References:From:In-Reply-To;
 b=ZwY/ZHnmzW7SG3OMI0hu6T1c+6s7XW0aQgtqhTqHx0/n14JWXjuyqWamIK3wHyIpi
 FqWCC7x6rNBqbVygGTpjOXeP1r2zzloBTt/OCtK92wv9TFOLSDkRmyq4quxUfsw5O6
 2peR0lkkimP81967Mn9U3vSFb3Cs1Qt92tY06xphm92RzZLPK2nz4VTmMJ9RVY29AR
 aJ0Vp/8bKfrZaWN71aNXeZFWvV/RxrdrJCjGdU7/Y/aQrS7UnqeF/ExuIC2jxG7PI1
 DaWk3cpiCM7jsVOSfPfJ4rzszU4SlmnzVCVFSI6Sq4r3aAfPaToUFVSocGsD0zieVd
 KoSLdhT+rZGMA==
Message-ID: <84316e45-f596-49c4-b3e7-cdfc7a19a519@m1k.cloud>
Date: Fri, 27 Feb 2026 09:53:21 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] drm/amd/display: complete cursor vblank events
 immediately
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, rodrigo.siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
References: <20260217191632.1243826-1-sysdadmin@m1k.cloud>
 <f43075c8-e5f1-426c-b70e-743d1e7e4c59@amd.com>
Content-Language: en-US
From: Michele Palazzi <sysdadmin@m1k.cloud>
In-Reply-To: <f43075c8-e5f1-426c-b70e-743d1e7e4c59@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:sunpeng.li@amd.com,m:harry.wentland@amd.com,m:rodrigo.siqueira@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 197961B4BDA
X-Rspamd-Action: no action

On 2/23/26 16:27, Leo Li wrote:
> 
> Really nice debuging work, thanks for catching this!
> 
> Ideally, the cursor event should be delivered when hardware latches onto the new
> cursor info and starts scanning it out. The latching event fires an interrupt
> that should be handled by dm_crtc_high_irq().
> 
> dm_pflip_high_irq() handles an interrupt specifically for when hardware latches
> onto a new fb address; I don't think it actually fires when there's a
> cursor-only update. I think if we really want to do it right, we can have
> another "acrtc_attach->cursor_event" just for cusror-only updates, and deliver
> the event in crtc_high_irq().
> 
> In any case, I don't foresee any major issues with delivering the event early.
> And since it fixes an ongoing issue:
> 
> Reviewed-by: Leo Li <sunpeng.li@amd.com>
> 
> Thanks!
> Leo

Thanks for the review. Further testing confirms that both this patch and 
increasing the dGPU vblank offdelay (from 2 frames to ~50 frames) 
independently eliminate the flip timeouts in my testing. Both work by 
reducing the frequency of vblank disable/re-enable cycles, basically 
either could be an interim fix.

Your deferred vblank enable/disable series 
https://lore.kernel.org/amd-gfx/20260224212639.390768-1-sunpeng.li@amd.com/T/#t 
looks like it could be the proper solution going forward instead 
(haven't tested it).

