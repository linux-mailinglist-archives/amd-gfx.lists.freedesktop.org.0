Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AG9FEpLjVGopggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C5874B560
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=QXkWykl8;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B69210E9A3;
	Mon, 13 Jul 2026 13:09:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A439310E571;
 Mon, 13 Jul 2026 07:14:52 +0000 (UTC)
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gzDFF2YLdz41mt;
 Mon, 13 Jul 2026 09:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1783926833;
 bh=ft5/eljShbuYhVYHfb0X4qATRaHxv9WlJJ3lqFQIN2A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QXkWykl8hifEgutAY/lzyn35YKVwZWQWF3ZaqD7dFUropywiLUD+NzTU9FbrMS8Gb
 N7TxJzsyM0rLg1s/N6S+evPSuSWcZKd3S72/5H9dIgpUVrYW9zJfbJ/NJReuVi0hiA
 ZEdzy7+Yr2Yn2lwb9NaTOuQbP8Q03XImk0jOy1ds6DrsPXaCFjrUwgbNgeJU2W9foc
 IeTnObDohuNHv8HGeUgcPfb760bwn+7YdwIoW7B5laHHhvYjg6ZsQPAN7SCUtJNtAk
 XCKUKycfalhsqa+m1pOL8dSc8Pd5aec/KxZiGCDjsJndw0jrSY8Hn+zQwBmHhsLsgy
 IClFEYaqTfVJA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gzDF31rC6z41vC;
 Mon, 13 Jul 2026 09:13:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
X-Spam-Status: No, score=-2.898 required=6.31 tests=[ALL_TRUSTED=-1,
 BAYES_00=-1.9, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 URIBL_DBL_BLOCKED_OPENDNS=0.001, URIBL_ZEN_BLOCKED_OPENDNS=0.001]
 autolearn=ham autolearn_force=no
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gzDDz3Vhbz8tbl;
 Mon, 13 Jul 2026 09:13:39 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 81FD66041D;
 Mon, 13 Jul 2026 09:13:31 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ae5c29aa-3790-479a-bdfb-1b571eaab809@leemhuis.info>
Date: Mon, 13 Jul 2026 09:13:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [resend] [regression] amdgpu carrizo: no display signal after
 modeset
To: Dianne Skoll <dianne@skoll.ca>, Jaak Ristioja <jaak@ristioja.ee>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Salvatore Bonaccorso <carnil@debian.org>, Chris Park <chris.park@amd.com>,
 Matthew Stewart <matthew.stewart2@amd.com>,
 Dan Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 1139950@bugs.debian.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <9fba2020-24d1-4235-9869-319d4aab3a4c@ristioja.ee>
 <178198613176.3658222.16247101620976737948@eldamar.lan>
 <ajcLuO0YZCoPN7Xw@eldamar.lan> <e4f60b98-9bd8-491a-9703-a5a7a58a4ca0@amd.com>
 <82b5026d-2dcc-4dcd-9094-2ccf70057964@ristioja.ee>
 <6cf6be99-76c3-43b3-854f-96cae180318c@ristioja.ee>
 <20260622153449.453b493e@gato.skoll.ca>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260622153449.453b493e@gato.skoll.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178392681229.3442660.9578169747564647640@mxe9fb.netcup.net>
X-NC-CID: MzLG2tZMKB/ADR25837MhEmuu9VJVl40ek1ivkRoK5XTXQ/26lE=
X-Mailman-Approved-At: Mon, 13 Jul 2026 13:09:32 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,debian.org,linuxfoundation.org,igalia.com,gmail.com,ffwll.ch,bugs.debian.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:from_mime,leemhuis.info:dkim,leemhuis.info:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,ristioja.ee:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9C5874B560

On 6/22/26 21:34, Dianne Skoll wrote:
> On Mon, 22 Jun 2026 20:46:44 +0300
> Jaak Ristioja <jaak@ristioja.ee> wrote:
> 
>> Reverting commit fee50077656 ("drm/amd/display: Bump the HDMI clock to 
>> 340MHz") on top of v7.1.1 appears to resolve the issue, as I am now able 
>> to get a picture.
> 
> Unfortunately, reverting that commit will *break* it for me with my Dasung
> E-Ink monitor. :(
Jaak, was this ever resolved? It looks like this fell through the
cracks, but maybe I missed something.

If this is still unfixed, I think it likely is best if you report this
to https://gitlab.freedesktop.org/drm/amd/-/work_items/ if you haven't
done so already -- I suspect that is more likely to get the attention of
the amdgpu maintainers. Please drop the link to the ticket here after
submitting the issue.

Ciao, Thorsten
