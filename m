Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uztNO5XjVGorggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:41 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55BA74B569
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=gR+33CMf;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B1510E9A6;
	Mon, 13 Jul 2026 13:09:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 432 seconds by postgrey-1.36 at gabe;
 Mon, 13 Jul 2026 11:28:15 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [194.59.206.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192F110E905
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 11:28:15 +0000 (UTC)
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gzKkP6NtXz4Gvt;
 Mon, 13 Jul 2026 13:21:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1783941661;
 bh=+Srm2RlS9ODdW1n2btLT8VOhjgw9/2wwoYrw2kYUT2I=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=gR+33CMfaI1l1hx5ixcv/PttLExzu3pJEldV+yAKaywPueWrkM5v+IkwpCCUP95GZ
 I5xL6NLQnj1nR0gEmnMfKVfYVcF4WCFJaehfCIaYN9zsJ/04s4fKcdhOIEGjSXKrmB
 E4svSxyWGr/mtJy1s0E1WCXHnrQqB/gQL7WN1B2roUODxb0kO+UHFRJIJwBXOAoGeE
 v2DDyETfyaBHXNUmHw85b4Ync9dfKIukW9C9/dUv6H0R9MKXoszo48FE5M6A/8WLf7
 mWBr/JjkmAUIbICxzgQzL6XRRD0d0K//UgI5iJhAl9ywdUdGaETbHwuhs3oc4HF3rU
 09xxdpcG9/nDQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gzKkP5hcTz7wHk;
 Mon, 13 Jul 2026 13:21:01 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gzKkP24dVz8sgw;
 Mon, 13 Jul 2026 13:21:01 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id A1882601EC;
 Mon, 13 Jul 2026 13:20:57 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0dece759-302d-4b54-8716-9d641dad3b84@leemhuis.info>
Date: Mon, 13 Jul 2026 13:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x6658
 (R7 260X)
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Natalie Vock <natalie.vock@gmx.de>
References: <20260713061443.32561-1-timur.kristof@gmail.com>
 <fMZgsndLRnm1-Yt6VBK1JA@gmail.com>
 <f903ef1d-0d2d-4b71-afc2-e86207db7e8a@leemhuis.info>
 <5CyapnyQRMWqVd6eVa9xiw@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <5CyapnyQRMWqVd6eVa9xiw@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178394165796.3837220.6999120502901293845@mxe9fb.netcup.net>
X-NC-CID: wrqJVcW3Fhs7HhjnzHWlFUtcpgB02QyJ574RJZrev8Z7qQkiSm4=
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:tursulin@ursulin.net,m:natalie.vock@gmx.de,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,leemhuis.info:from_mime,leemhuis.info:dkim,leemhuis.info:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B55BA74B569

On 7/13/26 13:11, Timur Kristóf wrote:
>> To provide an example of what I want:
>>
>> https://gitlab.freedesktop.org/drm/i915/kernel/-/
>> work_items/16043#note_35638
>> 09 mentions commit-id 2914709c (Revert "drm/i915/backlight: Remove
>> try_vesa_interface"") -- but I didn't find a way to find tickets then
>> refer to that commit, for example with a search like this:
>> https://gitlab.freedesktop.org/search?
>> search=2914709c&nav_source=navbar&sear
>> ch_code=true
>>
>> Is there some trick to do this?
> For that example, if you open the commit link:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/commit/
> 2914709c914101eb704e01bed2351070d4161ccf
> 
> You can scroll down and see that the commit was mentioned, and you can then 
> click on the issues where it was mentioned.

Ahh, great, thx, you helped me quite a lot. Fun fact: I had briefly
looked at pages like that for a reference already, but seem I didn't
scroll down far enough. :-/

Ciao, Thorsten
