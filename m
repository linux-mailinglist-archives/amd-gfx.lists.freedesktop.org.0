Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Aa61KkEcRmqSKAsAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:07:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D676F4938
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:07:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=leemhuis.info header.s=key2 header.b=TjtJ1wMw;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C4910F20E;
	Thu,  2 Jul 2026 08:07:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 350 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jul 2026 07:50:13 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E713210F1C4
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 Jul 2026 07:50:13 +0000 (UTC)
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0yj5z78xf;
 Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1782978261;
 bh=TsN6WMMBCEo3X7M+PaHTEiPe/r/MX65+aVkikPoZo+8=;
 h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
 b=TjtJ1wMwyQhbAj5p3WcdecFKurKvL1gKgOZBAFY7bOfBZpq7hogycwScebDww3mTi
 SEjfzI7PBhKif6OHy6RC2pR8cm6hObzSgIhJgn5n0SX5Ps9wcYHjvOHGDh7iQD3KGW
 q6m7bEHFEPxQ+4Eqyci7OJgHSzMWDDvRg46UIX9qK3t+yFiSAZomCJDrccs4014Sio
 bvmkdw4r88FNxN9R8Oga14/X3X0tDHtOCsh7eSGZjzEeL2W54VJUQfiOv0Ufdo58pO
 1WmFrpF5xzXENt1jiSpgyVPvra+Jtq6gXQcwAEUChK9xnEQm4y6aGdzPGR4Knzd0+b
 dCZNlHSOXtQYA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0Gcvz78xd;
 Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
X-Spam-Status: No, score=-2.901 required=6.31 tests=[ALL_TRUSTED=-1,
 BAYES_00=-1.9, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4grTRR5mvhz8tYM;
 Thu,  2 Jul 2026 09:44:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id A4244603E0;
 Thu,  2 Jul 2026 09:44:18 +0200 (CEST)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <64546a50-5593-4083-aaa7-6f772f8c81b5@leemhuis.info>
Date: Thu, 2 Jul 2026 09:44:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] linux-firmware-amdgpu 20260622 prevents clean poweroff on
 AMD RX 6800
To: IT4roundtheW0rd <IT4roundtheW0rd@protonmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
In-Reply-To: <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <178297825897.3306651.13862513967389606757@mxe9fb.netcup.net>
X-NC-CID: WQUHJuKIRcozFvv2yzdqCWxTh1SrywKG3JrO4uvjTbwvR5T3U8o=
X-Mailman-Approved-At: Thu, 02 Jul 2026 08:07:22 +0000
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
	FORGED_RECIPIENTS(0.00)[m:IT4roundtheW0rd@protonmail.com,m:linux-firmware@kernel.org,m:regressions@lists.linux.dev,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,leemhuis.info:dkim,leemhuis.info:mid,leemhuis.info:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15D676F4938

[adding a few people to the CC]

On 6/27/26 02:42, IT4roundtheW0rd wrote:
> 
> I'd like to report a regression in linux-firmware-amdgpu introduced with
> the 20260622 release.
> 
> *System:*
> - Distro: CachyOS
> - Kernel: 7.1.1-2-cachyos
> - GPU: AMD RX 6800-series
> - Bootloader: GRUB
> 
> *Problem:*
> After updating linux-firmware-amdgpu from 1:20260519-1 to 1:20260622-1,
> the system no longer shuts down completely when running `poweroff`.
> Fans, keyboard LEDs, and power button LED remain active after the
> shutdown sequence. The system hangs after "Sending SIGTERM to remaining
> processes..." and never reaches full power-off (ACPI *S5).*

A few questions:

* Which firmware files does your GPU use exactly (a full dmesg log
should answer this)
* Does the problem happen with a vanilla kernel as well (it most likely
will, but would be good to confirm, as heavily patched vendor kernels
can lead to all sort of issues).

Ciao, Thorsten

> *Relevant log excerpt (journalctl -b -1):*
> 
>     Jun 27 02:04:14 cachyos systemd-shutdown[1]: Sending SIGTERM to
> remaining processes...
> 
> (no further entries — system hangs here)
> 
> *Workaround:*
> Downgrading to linux-firmware-amdgpu 1:20260519-1 resolves the issue
> completely.
> 
> *Steps to reproduce:*
> 1. Update linux-firmware-amdgpu to 1:20260622-1
> 2. Run `poweroff`
> 3. System hangs — power is not cut
> 
> *Additional notes:*
> The root cause appears to be that the new firmware blob prevents the
> amdgpu driver from cleanly releasing the GPU before the ACPI S5 power
> state transition. No other packages were updated in the same transaction
> that could explain this behavior.
> 
> This issue was researched and this report was drafted with the
> assistance of Claude (Anthropic AI).
> 
> Best regards,
> 
> Benjamin Maas 

