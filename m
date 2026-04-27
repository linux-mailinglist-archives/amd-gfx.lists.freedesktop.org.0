Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIGGJWtZ72n5AQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 14:41:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A33472A41
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 14:41:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894E910E726;
	Mon, 27 Apr 2026 12:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="QPoHYnKp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 535 seconds by postgrey-1.36 at gabe;
 Mon, 27 Apr 2026 09:44:40 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295A810E652
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 Apr 2026 09:44:40 +0000 (UTC)
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4g3z2R48WVz71Rl;
 Mon, 27 Apr 2026 11:35:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1777282543;
 bh=WAZl2h4jDPwyDStFG5RaQK5OkI2VUxN4Ha5YU0wrxNU=;
 h=Date:Subject:To:References:From:Cc:Reply-To:In-Reply-To:From;
 b=QPoHYnKpfVBaPOc5UWoNMSH4LNGLk+EnLKw2CqVa0HMdrowXkFHJ+VhxtJZTIIS8z
 aR1W6YK8AbD0NYjnXeCCvFpL4yfGKH8VTCgGr3GHYIdZpNOkWP/Yt74IboqiBQlNa8
 Hg2PC6N32L90uy0Oj/Ys2ANvlBG9RnZ5OzsRhfiVAezsW17Wp7E1Yex0NUWB/hSjrM
 ciESgFugKCo0m5OprzVRI3c9QZesVaxQtkIhGgYSQoexVzcodxwZ98VCkw1C9bBUuS
 ViVy7qkgK7VcHr8BFu8J1Z8529StnfjUvDBxEKP4b8RBS1c2yiFgp9bzO44KhFJBwy
 cJP94MJfLw3tw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4g3z2R3SLWz71R1;
 Mon, 27 Apr 2026 11:35:43 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g3z2Q3HFjz8sZh;
 Mon, 27 Apr 2026 11:35:42 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id A8262632B7;
 Mon, 27 Apr 2026 11:35:41 +0200 (CEST)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info>
Date: Mon, 27 Apr 2026 11:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
To: Brandon Taylor <br.ta.2818@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Timo Lindfors <timo.lindfors@iki.fi>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177728254204.278230.6479635209091071276@mxe9fb.netcup.net>
X-NC-CID: oDMoUf7EhfuY0SViidsRx00FAG2iO8Bu/2zx3SOezkW25uKD0uU=
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: F2A33472A41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_RECIPIENTS(0.00)[m:br.ta.2818@gmail.com,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:alexander.deucher@amd.com,m:timo.lindfors@iki.fi,m:christian.koenig@amd.com,m:brta2818@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[regressions@lists.linux.dev];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.linux.dev:replyto]

On 4/26/26 01:22, Brandon Taylor wrote:
> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used to
> default to the `radeon` firmware

FYI, as using the wrong terms can lead to confusion while dealing with
bugs: that's not a firmware, that's the driver (sometimes also called
kernel module)

> on kernel versions up to and
> including 6.18. I could manually change this behavior to use the new
> `amdgpu` firmware by setting `radeon.si_support=0 amdgpu.si_support=1`
> as kernel parameters in the GRUB bootloader. Everything worked fine,
> and I was able to play my Windows games without any problems.
> 
> That was, until kernel version 6.19 came out.>
> 6.19, from what I was able to Google, was supposed to have AMD GPUs to
> default to the new `amdgpu` firmware. Unfortunately, when I updated
> the kernel and rebooted, I got a black screen.
> 
> Further Google searches led me to reboot, set `nomodeset` in the
> kernel parameters, switch to a TTY, login, and investigate the output
> of a `dmesg` command — and what I saw ... Well, let's just say it's
> the kind of thing that would make Linus go Chernobyl:
> 
> `amdgpu: probe with driver amdgpu failed with error -22`

Please provide a full kernel log, this is needed to full understand the
problem

> And this issue has not been fixed in kernel version 7.0, which I guess
> is set to be the next LTS kernel.

No, it's not.

> Now, I hope to God that this email finds whoever is responsible for
> breaking this `amdgpu` firmware before the same thing happens to Linus
> via Fedora 44, and he goes berserk. I realize that's not a heck of a
> lot of time, but God only knows HOW many Linux users with AMD GPUs are
> pissed off by this kind of issue — and I for one can only imagine how
> Linus' reaction will compare when it happens to HIM!

FWIW, you seem to assume that the problem hits everyone with a AMD GPUs.
That's not the case, we'd know this by now. Maybe it's not even
something that hits everyone with a card/gpu like yours, as some falires
only show up in certain environments, for example in combination with a
specific mainboard chipset or firmware.

Anyway: I CCed a few people that might be able to help. But they likely
will need at least the full kernel log mentioned above .

Ciao, Thorsten
