Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UI4dDrgT6mmytQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 14:42:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB446452223
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 14:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E800A10F0F8;
	Thu, 23 Apr 2026 12:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="jn8A1Ww9";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1609A10F056;
 Thu, 23 Apr 2026 10:14:22 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7460E40E00C4; 
 Thu, 23 Apr 2026 10:14:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id aMWtIg-9UTMt; Thu, 23 Apr 2026 10:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1776939249; bh=Z3fMnOzXvY9vQ6rbTljdxVI28pomvdIlA1Bba16AfpY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jn8A1Ww91QGYOA8y+n5VK2+pK1EPRVjDgUreAwiRRS+tWJ0JeHVwmRJhvqYC88y4S
 1AB2WbPxJU0ZOmaa3C2M+wpgpAJnRkdE+DynlWfK5OJ3eFkkQKttXlbmeW3BMvIL25
 5K5GjomiMzQgFIAmrYvQJfX+OVK53L/whn5WKxxpz+NGU/jEWidVdb5B6+JOCccai3
 JYN4OmDN6iC4YTGy3Lt36k7jaYSjzGxxJngX60XlhWH/8Qq/HX0bkHaPIR8w7Vnixt
 ui3npXsSp/Rp0OJXhxTbTj1sLCbv0TrzP1aPLlkmmvX92jmtEtBkXZkZuffboxr0vg
 As+5gVJZBsr6K1BgNlLELQVF8ym9/e0sJ7BE+z/hXIj0WQXmBEoUeqjn2MqsJXhXLg
 atc5x1ARUPwN93GMK317ythCe6oaI0Yqa+MMt1Pp77quGneTRtOIahwjC597fkHzsN
 H7nq+EEO0/UTjA7HMQVCz6kZNEDrJourtQtuxTSXuJd2eEx1ooBpMWKyH5TfYTPix/
 33GL4Ap22ZKs+YJhFyEdnQ1e1A6TaA8JPwTJeKBNoguSpQNAF7Q/ySO5RXjsVPFYU7
 5BgqMe07H0D2q7ucvKYRfCsPIhVFTE1eXMBBXzkwZQCAqGVy2W8plPyA2/VGUKZb8c
 jPztUW54IUD4ZD2F6d7IVsb0=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 CE14D40E0031; Thu, 23 Apr 2026 10:13:59 +0000 (UTC)
Date: Thu, 23 Apr 2026 12:13:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Rafal Ostrowski <rostrows@amd.com>, amd-gfx@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: amdgpu: WARNING:
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:58 at
 dc_assert_fp_enabled+0x10/0x20 [amdgpu], CPU#5: (udev-worker)/418
Message-ID: <20260423101352.GAaenw4LLAwWyEtANw@fat_crate.local>
References: <20260421132303.GCaed6N9mDwutP6sEx@fat_crate.local>
 <CADnq5_POMAQyY1OtqE6v4-NwoN2ViUCTeq-RQp79UwpMeDZRYA@mail.gmail.com>
 <20260422203314.GCaekwikuCiHx8CK-S@fat_crate.local>
 <CADnq5_MD=88gWXFp_-sQ0qpj-xDbqNsEkofnaNqFkQbJL43hNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_MD=88gWXFp_-sQ0qpj-xDbqNsEkofnaNqFkQbJL43hNg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 23 Apr 2026 12:42:22 +0000
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,alien8.de:dkim,gitlab.freedesktop.org:url,fat_crate.local:mid]
X-Rspamd-Queue-Id: CB446452223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:54:32PM -0400, Alex Deucher wrote:
> It's in drm-next, should land in this week's next-fixes PR.
> https://gitlab.freedesktop.org/drm/kernel/-/commit/07598c76964a2c73702fa652bcd07ec21088c5ef

Thanks, that fixes it.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
