Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N8EFEm00HWpeWQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:41 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C561AD8D
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E281112EE0;
	Mon,  1 Jun 2026 07:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=poczta.fm header.i=@poczta.fm header.b="A45h48hc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A1112B28
 for <amd-gfx@lists.freedesktop.org>; Sun, 31 May 2026 12:42:11 +0000 (UTC)
Received: from Stacjonarny (62-133-144-026.dynamicip.ostnet.pl [62.133.144.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by www.poczta.fm (INTERIA.PL) with ESMTPSA;
 Sun, 31 May 2026 14:42:08 +0200 (CEST)
From: "Artur Chlebek" <achlebek@poczta.fm>
To: "'Greg KH'" <gregkh@linuxfoundation.org>
Cc: <amd-gfx@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <stable@vger.kernel.org>
References: <002901dcf0eb$9472e210$bd58a630$@poczta.fm>
 <2026053159-unread-disagree-0da7@gregkh> 
In-Reply-To: 
Subject: RE: 7.0.9 vs 7.0.10/7.1 Radeon 260X regression
Date: Sun, 31 May 2026 14:42:08 +0200
Message-ID: <003901dcf0fa$e5315ce0$af9416a0$@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFDUGtZMJYvTWCxG+Cy9+QRqeP05ADRSPyrAmjEVgO3QYPi8A==
Content-Language: pl
X-IPL-Priority-Group: 0-0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
 t=1780231329; bh=aQxHIfR0Wt2sOg4MkPcCIB7mzg9EaFBUOuncs0GU2l8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=A45h48hc9sRiVQUTQ1VwRafd6Kuh75w372Llu0owqL1tHlxHvBoPGF3ABeRgTDaQj
 UAjPvLnzO92AaNvUPDEZR3UtD0WsE6ldC4G12fRMAB2zF9sqZ70PjOdSbEyKhGokyt
 4IQOnNA9Bdnn21V/HKtRYH1ElCe5K3jlGmOrXvhk=
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[poczta.fm,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[poczta.fm:s=dk];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:regressions@lists.linux.dev,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[poczta.fm];
	FORGED_SENDER(0.00)[achlebek@poczta.fm,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[poczta.fm:+];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[achlebek@poczta.fm,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[poczta.fm:email,poczta.fm:mid,poczta.fm:dkim,linux.dev:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email]
X-Rspamd-Queue-Id: AA9C561AD8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

-----Original Message-----
From: Greg KH <gregkh@linuxfoundation.org>
Sent: Sunday, May 31, 2026 1:43 PM
To: Artur Chlebek <achlebek@poczta.fm>
Cc: amd-gfx@lists.freedesktop.org; regressions@lists.linux.dev;
stable@vger.kernel.org
Subject: Re: 7.0.9 vs 7.0.10/7.1 Radeon 260X regression

On Sun, May 31, 2026 at 12:52:30PM +0200, Artur Chlebek wrote:
>> Hi, I have 5x fps drop on amdgpu Radeon 260X 1GB between kernel 7.0.9 
>> and
>> 7.0.10 or 7.1rc
>> 
>> Original sparse mail got flagged as spam so let me elaborate:
>> Newest vanilla Fedora with Plasma, Gigabyte GA-H97-D3H, looked into 
>> things like clocks, PM, ASPM, tried flags, GTTSIZE, .dc=0 - all seems 
>> fine nothing helps.
> 
> Can you use 'git bisect' to find the offending commit?
> 
> thanks,
> 
> greg k-h

I'm sorry I'm not familiar with git at all, and very new to Linux. I can do
some local tests if led by hand...

PS: I can confirm that 7.0.9-205 is 25fps in Unigine Heaven, and 7.0.10-200
(or 7.1 since beginning of rc availability) is 3-5fps.

