Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBODJGxZ72n5AQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 14:41:16 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA3D472A4F
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 14:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8E10E72B;
	Mon, 27 Apr 2026 12:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="iYyaOGDh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fo3QIksx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Mon, 27 Apr 2026 10:21:48 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7611A10E692
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 10:21:48 +0000 (UTC)
Date: Mon, 27 Apr 2026 12:14:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1777284862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwvNzA77cTupsEIv6dal9H7A7nSRcWczX8S6oci8yxk=;
 b=iYyaOGDhytUqJvSrIxSK+nkq/ZSyMs2/DpwRlCS0wldcYHIn7O2NrESm62Qe2jamiaGE/w
 H0KS+3L0Bdf0tTBWc53JFEHN2yZVjLLhn2GAzlZ5m8Y/BvZxG8NBs7AIYmrxtz2SHop5VU
 VHN/wEzsUGeD4gIzz5vcTfE6q94OWGTC3nnoK6QkStrKJ3tRmftEM+piRSMypzAmOU7/Jc
 +TMHy0x8TQdjGLz+RCKZ2l/TKBnWb7sSarQTLuYMxNwmAn9VfpWG/+gO57wYRFgxAWY6Xx
 oia3mHBV3TIHiJ3rfQqbrLEC9d3Cm925+zLjDp4yekxxNvhIYl+9c9GatjrVoA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1777284862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NwvNzA77cTupsEIv6dal9H7A7nSRcWczX8S6oci8yxk=;
 b=fo3QIksxWzVdamRewmKjdxtyjLbotkLf90WEvnAeL5AaBHDvw2IBCUHnAy5M2zOQgtw4aL
 NuKtOe7cqy2nJNAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Ostrowski, Rafal" <Rafal.Ostrowski@amd.com>
Cc: Bert Karwatzki <spasswolf@web.de>,
 "Varone, Dillon" <Dillon.Varone@amd.com>, "Hung, Alex" <Alex.Hung@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: kernel panic when resuming from hibernate in next-20260406 with
 PREEMPT_RT
Message-ID: <20260427101421.7N9_OOk5@linutronix.de>
References: <20260409131411.10598-1-spasswolf@web.de>
 <IA1PR12MB6307858BAECC7CC3AE8AA958F8582@IA1PR12MB6307.namprd12.prod.outlook.com>
 <a67b9159f69e8788a598fb459d8e6d99d1776f2f.camel@web.de>
 <IA1PR12MB6307AC51F4C6E4A77BCB5EDDF8582@IA1PR12MB6307.namprd12.prod.outlook.com>
 <IA1PR12MB630789B32C2104D1FAC2B761F8592@IA1PR12MB6307.namprd12.prod.outlook.com>
 <a1c86a3b83e26d86f95068e8005ce4b2efdca23a.camel@web.de>
 <IA1PR12MB630726FFADF30847A8496012F8362@IA1PR12MB6307.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <IA1PR12MB630726FFADF30847A8496012F8362@IA1PR12MB6307.namprd12.prod.outlook.com>
X-Mailman-Approved-At: Mon, 27 Apr 2026 12:41:11 +0000
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
X-Rspamd-Queue-Id: 4CA3D472A4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Rafal.Ostrowski@amd.com,m:spasswolf@web.de,m:Dillon.Varone@amd.com,m:Alex.Hung@amd.com,m:Alexander.Deucher@amd.com,m:tglx@linutronix.de,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[web.de,amd.com,linutronix.de,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER(0.00)[bigeasy@linutronix.de,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linutronix.de:dkim,linutronix.de:mid]

On 2026-04-27 09:23:32 [+0000], Ostrowski, Rafal wrote:
> Hi Bert,

Hi Rafal,

> I am glad to hear that mentioned patch fixed your issue.
> Small clarification - amdgpu is not designed to support
> PREEMPT_RT flag, but it was still worth to fix as obvious regression.

What does this mean? It is not a flag but a preemption model. It is part
of the official kernel.

> Kind Regards,
> Rafal Ostrowski

Sebastian
