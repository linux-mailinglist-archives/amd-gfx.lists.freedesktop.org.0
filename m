Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bx3oLDN8Imo+YQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 09:35:15 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF01646095
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 09:35:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=infradead.org header.s=bombadil.20210309 header.b=TBwu1x8y;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=infradead.org (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12A811A4F3;
	Fri,  5 Jun 2026 07:35:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63D310E43F
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 04:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=6EbPTaXUn50Mv/Oae7oFClRjhC8wddU4zN9h8OrX1nw=; b=TBwu1x8yU9UDyLAPFlpnEuscmM
 W96XUR4ez2PWBUiY9kKKvtFBXX9vZVlbLaOQHN45j+qn74YynNTa/PBzlWSp0ujGityihvjIylS+G
 z8Ei7jc6ANhFZqKFnnx1z++7PLENDe7xSDYIIoVmIEuFPtGEZaWoLnA+OrKN2TkpqU2vhGmUoAIpo
 RLh2orj5fNrQ48F6wdbvDAQ4Ckq/zHf73O53eJGfZIs8i3Ye1bJud9U6Sx4bqurvQxCfAYCYa3n9n
 PNvEfMXkrsyoYJCMWOp/FgFYGxAy1h/h4gktDhJ7ukNCmoVt0jrRfcEzadg8/a7qrnb19PY7Fjoy8
 hJ6oi7kg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
 id 1wVM5I-000000004Re-1rCD; Fri, 05 Jun 2026 04:23:04 +0000
Message-ID: <6bdbbc1b-9934-462c-b9aa-afaf0605c2a0@infradead.org>
Date: Thu, 4 Jun 2026 21:23:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) stack frame size (2088) exceeds
 limit (2048) in 'dml31_ModeSupport...
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <178059594388.10259.8984887956034576074@330cfa3079ca>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <178059594388.10259.8984887956034576074@330cfa3079ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 05 Jun 2026 07:35:12 +0000
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kernelci@lists.linux.dev,m:kernelci-results@groups.io,m:regressions@lists.linux.dev,m:gus@collabora.com,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,infradead.org:from_mime,infradead.org:mid,kernelci.org:url,kernelci.org:email,linux.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AF01646095

[adding amd-gfx]

On 6/4/26 10:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  b99ae45861eccff1e1d8c7b05a13650be805d437
> - tags: next-20260604
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3872:6: error: stack frame size (2088) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
>  3872 | void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
>       |      ^
> 1 error generated.
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6a21abf22cc72b6e94bf3c60
> 
> 
> #kernelci issue maestro:96417cd30041ab8f3153128d0120c6cd70782d99
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy

