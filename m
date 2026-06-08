Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pamvGt29J2qm1QIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 09:16:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0C465D19E
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 09:16:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=RJuIJp+z;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 569C610E12B;
	Tue,  9 Jun 2026 07:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [46.38.247.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B11010F21D
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2026 11:24:36 +0000 (UTC)
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gYqSf6LfZz891R;
 Mon,  8 Jun 2026 13:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1780917874;
 bh=2n1StceSz7SbJ7v7AI3zkzVTOe1ZJOJXlWpDij7DfuI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RJuIJp+z2EP1GbXsL37JmKLLhwPUQLngEnVFxka0FbCo9JwyKfqTaMWkr6PmP5+Tw
 4Ad9bisEujyMHOYjf4A8A1nDuIbQwDXswjA7sxeAQ/4B5vrXmaNwDS9XgQziVFvX7X
 8yor2c+WfbOPS/LA9K2pCZlVUXP/F/1wOf7LcfP1FD8FLcwh3Bi9VigCEJ2km8hamH
 fHYBMg6UeRpKpLX9fw5vK1DJbt21/qZ/vYcUnzV+5DkRVelnRqL3Jx9MEUUNkJqaS1
 FGAQLXcuFrIjMEUVtExsKOqERkZ3F1m26uwpkpKMrh6xYX3e73pJ9Wqqv2SsRqQSNU
 AsrPX4VcfA/3w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4gYqSf5fw9z4xHs;
 Mon,  8 Jun 2026 13:24:34 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gYqSd6mSVz8sZh;
 Mon,  8 Jun 2026 13:24:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2FFD361803;
 Mon,  8 Jun 2026 13:24:33 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5f2d4707-ae11-44f3-ad09-1c0580abde91@leemhuis.info>
Date: Mon, 8 Jun 2026 13:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) stack frame size (2088) exceeds
 limit (2048) in 'dml31_ModeSupport...
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernelci-results@groups.io, regressions@lists.linux.dev,
 kernelci@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, amd-gfx@lists.freedesktop.org
References: <178059594388.10259.8984887956034576074@330cfa3079ca>
 <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178091787355.3623625.15408127688317230229@mxe9fb.netcup.net>
X-NC-CID: eXrka6M8jsSTUlfGcSCIeRRgyRl/PFaULbGItnCAWYuDfKM+SFY=
X-Mailman-Approved-At: Tue, 09 Jun 2026 07:16:41 +0000
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
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:kernelci-results@groups.io,m:regressions@lists.linux.dev,m:kernelci@lists.linux.dev,m:gus@collabora.com,m:linux-next@vger.kernel.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,leemhuis.info:dkim,leemhuis.info:mid,leemhuis.info:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB0C465D19E

On 6/5/26 06:23, Randy Dunlap wrote:
> [adding amd-gfx]

[+Nathan -- I'm also wondering if we should CC the amdgpu maintainers,
but lets wait with that for a moment]

Nathan afaics saw this problem a few weeks ago already and filed and
issue for tracking: https://github.com/ClangBuiltLinux/linux/issues/2161

To quote from there: ""After LLVM commit 8ac9461e48e0 ("[SLP] Reject
2-element vectorization when vector inst count exceeds scalar",
2026-04-11), I am seeing two new -Wframe-larger-than instances from
drivers/gpu/drm/amd/display […]""

Side note: I wonder if that LLVM commit somehow made it to the KernelCI
env, or if something in the amdgpu code in -next changed and made the
problem worse.

Ciao, Thorsten

> On 6/4/26 10:59 AM, KernelCI bot wrote:
>> Hello,
>>
>> New build issue found on next/master:
>>
>> ---
>>  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
>> ---
>>
>> - dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
>> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> - commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
>> - tags: next-20260604
>>
>> Please include the KernelCI tag when submitting a fix:
>>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>>
>>
>> Log excerpt:
>> =====================================================
>> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>>  3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>>       |      ^
>> 1 error generated.
>>
>> =====================================================
>>
>>
>> # Builds where the incident occurred:
>>
>> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
>> - compiler: clang-21
>> - config: None
>> - dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60
>>
>>
>> #kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99
>>
>> --
>> This is an experimental report format. Please send feedback in!
>> Talk to us at kernelci@lists.linux.dev
>>
>> Made with love by the KernelCI team - https://kernelci.org
>>
> 

