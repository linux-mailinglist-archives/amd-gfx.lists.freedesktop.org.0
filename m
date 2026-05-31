Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A47MYM0HWpZWQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:28:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE4D61ADE8
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CD9112EEA;
	Mon,  1 Jun 2026 07:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ue1Vj2S9";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FEC510E624
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 11:44:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B89F4345A;
 Sun, 31 May 2026 11:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3ED41F00893;
 Sun, 31 May 2026 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
 s=korg; t=1780227848;
 bh=+y00Ah9wIWTgYhJGFLLWj7NlWeNyuJ0QIN43RRZvfRw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ue1Vj2S96m/XBBjc8YR0JTJsHIrpMn2Pr3s2NeYCuqIYesjsqYb36RxDp8hp30C8t
 eWerYIyqM5vMYIJ6Qu6IvXUtOWx9YvQgtryH7RbXn4l3toXbHwhmkDayrO0EahYXqA
 4RSzARC2uq8KhqrhypzEPjtrob38vkMpUVR9Ve8Q=
Date: Sun, 31 May 2026 13:43:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Artur Chlebek <achlebek@poczta.fm>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 stable@vger.kernel.org
Subject: Re: 7.0.9 vs 7.0.10/7.1 Radeon 260X regression
Message-ID: <2026053159-unread-disagree-0da7@gregkh>
References: <002901dcf0eb$9472e210$bd58a630$@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <002901dcf0eb$9472e210$bd58a630$@poczta.fm>
X-Mailman-Approved-At: Mon, 01 Jun 2026 07:27:37 +0000
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:achlebek@poczta.fm,m:regressions@lists.linux.dev,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[poczta.fm];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 7CE4D61ADE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 12:52:30PM +0200, Artur Chlebek wrote:
> Hi, I have 5x fps drop on amdgpu Radeon 260X 1GB between kernel 7.0.9 and
> 7.0.10 or 7.1rc
> 
> Original sparse mail got flagged as spam so let me elaborate:
> Newest vanilla Fedora with Plasma, Gigabyte GA-H97-D3H, looked into things
> like clocks, PM, ASPM, tried flags, GTTSIZE, .dc=0 - all seems fine nothing
> helps.

Can you use 'git bisect' to find the offending commit?

thanks,

greg k-h
