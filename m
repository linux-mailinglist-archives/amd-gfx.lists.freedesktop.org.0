Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0cgwLpTjVGoqggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1174B565
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=FfkoyydB;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66C710E9A7;
	Mon, 13 Jul 2026 13:09:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1156F10E108
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 10:56:49 +0000 (UTC)
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gzKBR4GJSz70d1;
 Mon, 13 Jul 2026 12:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1783940207;
 bh=2ZZkHVudlaMtoonDI2SZXRw2rz+0+Us6B/f+6trY8Eo=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=FfkoyydB1+rp78A//nI9sDskav/SGpyNWtQHzoTr7/rZK7fU3i2Wze7IeC4ORwwGQ
 tc2KonexliZ92mrDjLf1ZeFbC5CvavZgmCRoA9+h3rN11Z5K4tKSdRIiqyQ+Hv8wpt
 g1JBfiNwhLMc7G8K1h6fjHvZjYL+IrqH7a+FucZl6dDsCMgV/aoaief+5Vb6Ls7Q6u
 skJkKbaDdFkDz6sk4yQKwAeYpZtHF4Cu19h/QLIYglrzGVIm9hA7xBcBhw4ehocMXu
 TRRXQhoP/M5tOSZ7lbhfdzh8dCTeQALVHg3Z5bPXz8dboC8KUXOzJp1fC3Ki4MLMQS
 iSeei/V5NfwhQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4gzKBR3Xf2z70ct;
 Mon, 13 Jul 2026 12:56:47 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gzKBQ6G1Qz8svF;
 Mon, 13 Jul 2026 12:56:46 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2FC61603F0;
 Mon, 13 Jul 2026 12:56:41 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f903ef1d-0d2d-4b71-afc2-e86207db7e8a@leemhuis.info>
Date: Mon, 13 Jul 2026 12:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x6658
 (R7 260X)
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Natalie Vock <natalie.vock@gmx.de>
References: <20260713061443.32561-1-timur.kristof@gmail.com>
 <c2050464-7f95-4b6a-95db-698c637136df@leemhuis.info>
 <fMZgsndLRnm1-Yt6VBK1JA@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fMZgsndLRnm1-Yt6VBK1JA@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178394020144.3768149.7611686007791612494@mxe9fb.netcup.net>
X-NC-CID: egUMxveJ5Jrl61v+duK/03J2Wxg8hGSI2mBuvor/V3Fd5YfivtY=
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
X-Rspamd-Queue-Id: 5AA1174B565

On 7/13/26 12:00, Timur Kristóf wrote:
> On Monday, July 13, 2026 10:28:08 AM Central European Summer Time Thorsten 
> Leemhuis wrote:
>> On 7/13/26 08:14, Timur Kristóf wrote:
>
>>> What I expected to happen is that the GPU would simply use
>>> its maximum memory clock, and indeed this is what seemed
>>> to happen according to amdgpu_pm_info which reads the
>>> current MCLK value from the SMU.
>>> However, some users reported a huge perf regression
>>
>> Were those private reports? If not, please consider linking them in the
>> trailers using Link: or Closes: tags, as explained in the patch
>> submission guidelines (and mandated by Linus, see the quotes and links
>> in
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-> the-importance-of-pointing-to-bug-reports-using-link-closes-tags for
>> details).

Thx for the reply!

> There is no bug report. I had a conversation on Reddit which brought my 
> attention to this issue, then I actually plugged in the GPU, tested it and 
> noticed that there is indeed a problem,

FWIW, we occasionally link to reddit threads as well, but sounds like
this would not make sense here.

> and this patch here is the best fix I  could find.

Great, thx.

BTW (feel free to ignore this if you have no idea): I first had wondered
if there is a bug report about this in
https://gitlab.freedesktop.org/drm/amd/-/work_items and wanted to search
if the culprit was mentioned anywhere. Do you by chance know if that is
somehow possible?

To provide an example of what I want:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16043#note_3563809
mentions commit-id 2914709c (Revert "drm/i915/backlight: Remove
try_vesa_interface"") -- but I didn't find a way to find tickets then
refer to that commit, for example with a search like this:
https://gitlab.freedesktop.org/search?search=2914709c&nav_source=navbar&search_code=true

Is there some trick to do this?

Ciao, Thorsten
