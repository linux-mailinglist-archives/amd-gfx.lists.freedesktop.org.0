Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CB44B27A7
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Feb 2022 15:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67B410EA6B;
	Fri, 11 Feb 2022 14:19:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Fri, 11 Feb 2022 11:35:07 UTC
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC6E10EAA8
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Feb 2022 11:35:07 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JwBGr2lfdz4xRB;
 Fri, 11 Feb 2022 22:29:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644578982;
 bh=jVoIClN15+OtLQuv2Kdtn7rJzhfibLfv/3zw6QaPCWg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aA2uFoAhqcTnM5aYJUTHpBDSIhoHEqhd+F+G/yoE8Ifa9EFZJdFmdbWvwgvc21ZUd
 In/GxrGv/88X/cuscJlxnjiOmxH1ej2HLJwJKyrx5A7O+JtU5XD8ifQTpyVnqoC8vI
 W+YP1aXhw6Q2XxbtBgGSY7eaIVFoQt1UKjkaOJAi61/Vf2/pSMmCGuNl5FoeiGJyZ3
 /zjZtGC3wrdPnYya2Ne7T9bsbs3IETUmLeXirke52q5RRuH5G+bUlvy02T3jiLsU4J
 13qggON3Is8nx6XbvdckUtKyWDPor+2vJSbuluNC1Z87h6mN3sPR76f9p20mACdFm8
 Zf/xetor5pTUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ash Logan <ash@heyquark.com>, benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [RFC] Upstreaming Linux for Nintendo Wii U
In-Reply-To: <0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com>
References: <0020d47c-0e23-822c-33f5-ccb7ea4c1072@heyquark.com>
Date: Fri, 11 Feb 2022 22:29:36 +1100
Message-ID: <87ee49sktb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 11 Feb 2022 14:19:18 +0000
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
Cc: linkmauve@linkmauve.fr, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ash Logan <ash@heyquark.com> writes:
> Hello,

Hi Ash,

I can't really answer all your questions, but I can chime in on one or
two things ...

> - Right now I've made a new platform (like ps3) rather than joining the
> GameCube and Wii in embedded6xx, since that is marked as BROKEN_ON_SMP.
> The Wii U is a 3-core system, though a CPU bug[8] prevents existing
> userspaces working with it. Bit of a "cross that bridge when we get
> there" situation, though I'm reluctant to prevent that possibility by
> using a BROKEN_ON_SMP platform.

I'm happy for it to be a new platform. I'd almost prefer it to be a
separate platform, that way you can make changes in your platform code
without worrying (as much) about breaking other platforms.

> - Like the Wii before it, the Wii U has a small amount of RAM at address
> zero, a gap, then a large amount of RAM at a higher address. Instead of
> the "map everything and reserve the gap" approach of the Wii, we loop
> over each memblock and map only true RAM[9]. This seems to work, but as
> far as I can tell is unique amongst powerpc32 platforms, so it's worth
> pointing out. (Note: I've been told this doesn't work anymore after some
> KUAP changes[10], so this point might be moot; haven't investigated)

We'd need more detail on that I guess. Currently all the 32-bit
platforms use the flat memory model, which assumes RAM is a single
contiguous block. Though that doesn't mean it all has to be used or
mapped, like the Wii does. To properly support your layout you should be
using sparsemem, but it's possible that's more trouble than it's worth,
I'm not sure. How far apart are the low and high blocks of RAM, and what
are their sizes?

> - Due to the aformentioned DMA restrictions and possibly a fatal
> bytemasking bug on uncached mappings[11], I have been wondering if it'd
> be better to just give up on the SRAM at address 0 altogether and use it
> as VRAM or something, loading the kernel at a higher address.

Don't you have exceptions entering down at low addresses? Even so you
could possibly trampoline them up to the kernel at a high address.
 
> In terms of platform bringup, the key issue is whether to be embedded6xx
> or not and what output device to use. Beyond that it's just things like
> IRQ controller drivers, should be pretty straightforward. I think on our
> end, we'll start rebasing to 5.15 (LTS) and start sending patches from
> there. I know getting closer to HEAD is preferable, this project has
> just moved very slowly in the past and being on LTS has been a lifesaver.

As I said I'm happy for it to be a new platform. If there ends up being
a lot of shared code we can always refactor, but embedded6xx is only
~1500 LOC anyway.

One thing that has come up with previous console port submissions is the
requirement for patches to be signed off. The docs are here if you
aren't familiar with them:
  https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Otherwise your plan sounds good to me, 4.19 is pretty old so getting up
to 5.15 would be a good start. Then submit whatever bits you can and
chip away at it.

cheers
