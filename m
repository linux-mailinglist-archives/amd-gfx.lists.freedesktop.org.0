Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bApaHTFfJ2pdvQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 02:32:49 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80F065B5CA
	for <lists+amd-gfx@lfdr.de>; Tue, 09 Jun 2026 02:32:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iC0V95KY;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB39D10E01F;
	Tue,  9 Jun 2026 00:32:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF48910E01F
 for <amd-gfx@lists.freedesktop.org>; Tue,  9 Jun 2026 00:32:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F0D75601E6;
 Tue,  9 Jun 2026 00:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ECB1F00893;
 Tue,  9 Jun 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780965163;
 bh=AWqrUcAU/dt3Yzxo/R4IB34ld94Wfxn8b7jvT0dbAR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=iC0V95KY4ScnH68l4HJawJ7OVP+VZbg+jO22tdeMTc+tE3J2rXsQomUEWBDN97mkP
 cNGwSbxlEqSjPnipuOzPbdHBkPy2kejeOsMZKFVHOo1gyNc10B+S8vH4vNQ/uI4IY7
 DHHqh1mDA4+XS8bluWat2bI5d9tUATl8R2oDysK+wIO0mRyE0Q53Vl80ZSK4CPoq4j
 5/zhQ0bOM+gOww0m7KM/3CyQAKfYZPq1hq1Jtp2hbr4kSlTf9vxxshGc6nQZM4QBvm
 5CS3weUw/0szJ6rN7YhoBh0I2zWai8X1w/WB3zomAMLmvEvZgscNJdNs21/zXpwgLZ
 kZzpBTNUkdRRA==
Date: Mon, 8 Jun 2026 17:32:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: kernelci-results@groups.io, regressions@lists.linux.dev,
 kernelci@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 amd-gfx@lists.freedesktop.org,
 Gaghik Khachatrian <gaghik.khachatrian@amd.com>,
 James Lin <pinglei.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, llvm@lists.linux.dev
Subject: Re: [REGRESSION] next/master: (build) stack frame size (2088)
 exceeds limit (2048) in 'dml31_ModeSupport...
Message-ID: <20260609003238.GA3576576@ax162>
References: <178059594388.10259.8984887956034576074@330cfa3079ca>
 <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
 <5f2d4707-ae11-44f3-ad09-1c0580abde91@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f2d4707-ae11-44f3-ad09-1c0580abde91@leemhuis.info>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:kernelci-results@groups.io,m:regressions@lists.linux.dev,m:kernelci@lists.linux.dev,m:gus@collabora.com,m:linux-next@vger.kernel.org,m:rdunlap@infradead.org,m:gaghik.khachatrian@amd.com,m:pinglei.lin@amd.com,m:alexander.deucher@amd.com,m:llvm@lists.linux.dev,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,kernelci.org:url,kernelci.org:email,linux.dev:email,ax162:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C80F065B5CA

On Mon, Jun 08, 2026 at 01:24:32PM +0200, Thorsten Leemhuis wrote:
> On 6/5/26 06:23, Randy Dunlap wrote:
> > [adding amd-gfx]
> 
> [+Nathan -- I'm also wondering if we should CC the amdgpu maintainers,
> but lets wait with that for a moment]

Thanks for the CC. Bringing in more folks based on my bisect below.

> Nathan afaics saw this problem a few weeks ago already and filed and
> issue for tracking: https://github.com/ClangBuiltLinux/linux/issues/2161
> 
> To quote from there: ""After LLVM commit 8ac9461e48e0 ("[SLP] Reject
> 2-element vectorization when vector inst count exceeds scalar",
> 2026-04-11), I am seeing two new -Wframe-larger-than instances from
> drivers/gpu/drm/amd/display […]""
> 
> Side note: I wonder if that LLVM commit somehow made it to the KernelCI
> env, or if something in the amdgpu code in -next changed and made the
> problem worse.

So I think these are two separate but perhaps related issues (i.e., the
latter of the "side note" comment), as that LLVM commit is only in LLVM
main (currently 23.0.0) but this instance that KernelCI flags is visible
with clang-21.

With clang-22 and a distribution configuration, I see:

  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3381:6: warning: stack frame size (2312) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3381 | void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3800:6: warning: stack frame size (2128) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3800 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3892:6: warning: stack frame size (2136) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than]
   3892 | void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
        |      ^
  1 warning generated.

My bisect lands on commit faaeeecef94a ("drm/amd/display: Fix type
mismatches in DML and normalize loop bounds") in -next, which makes
sense. I have not looked into this super closely but I suspect that
change makes it easier for LLVM to inline or unroll loops, which can
result in more stack usage (especially as this code has some functions
with many tens of parameters). It is rather hard to look at and modify
this drm/amd/display code so I have not prioritized it...

I wonder if

  https://github.com/llvm/llvm-project/issues/115862
  https://github.com/llvm/llvm-project/issues/143908

are related, even if KASAN is not enabled here.

> > On 6/4/26 10:59 AM, KernelCI bot wrote:
> >> Hello,
> >>
> >> New build issue found on next/master:
> >>
> >> ---
> >>  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
> >> ---
> >>
> >> - dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> >> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >> - commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
> >> - tags: next-20260604
> >>
> >> Please include the KernelCI tag when submitting a fix:
> >>
> >> Reported-by: kernelci.org bot <bot@kernelci.org>
> >>
> >>
> >> Log excerpt:
> >> =====================================================
> >> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >>  3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >>       |      ^
> >> 1 error generated.
> >>
> >> =====================================================
> >>
> >>
> >> # Builds where the incident occurred:
> >>
> >> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> >> - compiler: clang-21
> >> - config: None
> >> - dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60
> >>
> >>
> >> #kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> >>
> >> --
> >> This is an experimental report format. Please send feedback in!
> >> Talk to us at kernelci@lists.linux.dev
> >>
> >> Made with love by the KernelCI team - https://kernelci.org
> >>
> > 
> 

-- 
Cheers,
Nathan
