Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0V/oObg+Omq/4gcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E006B51F3
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 10:07:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=skoll.ca header.s=canit2 header.b=aKi3naqD;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=skoll.ca
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6910E9D6;
	Tue, 23 Jun 2026 08:07:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 440 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jun 2026 19:42:33 UTC
Received: from dianne.skoll.ca (dianne.skoll.ca [144.217.161.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EA410E7EB;
 Mon, 22 Jun 2026 19:42:33 +0000 (UTC)
Received: from pi4.skoll.ca ([192.168.84.18])
 by dianne.skoll.ca (8.18.1/8.18.1/Debian-6) with ESMTPS id 65MJYotZ452560
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2026 15:34:50 -0400
Received: from gato.skoll.ca (gato.skoll.ca [192.168.83.21])
 by pi4.skoll.ca (Postfix) with ESMTPS id 4gkdgs6PrZzdZSgV;
 Mon, 22 Jun 2026 15:34:49 -0400 (EDT)
Date: Mon, 22 Jun 2026 15:34:49 -0400
From: Dianne Skoll <dianne@skoll.ca>
To: Jaak Ristioja <jaak@ristioja.ee>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Salvatore Bonaccorso
 <carnil@debian.org>, Chris Park <chris.park@amd.com>, Matthew Stewart
 <matthew.stewart2@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Harry Wentland <harry.wentland@amd.com>, Leo
 Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 1139950@bugs.debian.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [resend] [regression] amdgpu carrizo: no display signal after
 modeset
Message-ID: <20260622153449.453b493e@gato.skoll.ca>
In-Reply-To: <6cf6be99-76c3-43b3-854f-96cae180318c@ristioja.ee>
References: <9fba2020-24d1-4235-9869-319d4aab3a4c@ristioja.ee>
 <178198613176.3658222.16247101620976737948@eldamar.lan>
 <ajcLuO0YZCoPN7Xw@eldamar.lan>
 <e4f60b98-9bd8-491a-9703-a5a7a58a4ca0@amd.com>
 <82b5026d-2dcc-4dcd-9094-2ccf70057964@ristioja.ee>
 <6cf6be99-76c3-43b3-854f-96cae180318c@ristioja.ee>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skoll.ca; h=date
 :from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=canit2;
 bh=4YKCsCv6Dg8q+CHcKvgFdReQSfbL8ScgwMWEpw1J2Gw=; b=aKi3naqDtIW0
 rwnLRqwlTtUGB4KeoXWWFDyebgVE337PqtNWO9EJIEE7N3rBKvbl07mgLFaN2pEk
 MTX0mEwjvYSYbSjDJIKITwAMbbedhvmtJgEDnplHQVqk8MkovLY1PT/9JT7S2KrI
 BFZRskstywzSZzeyhJZ/4zNlEwy9WVzDXafBpASbPBT3jY4k6Z5D0IsvjfkRvwOO
 VrADqTpLA4BohSmK0rAIr58C+YbIqdnJXqCL8Jhh7qBjwtMiL7KNvZiMgUGsSR/N
 OtAWnWImdP52ZKKt+iSTK1rAB2KGWNoTzG1IBoDPWNphJrDMSevFAemwEQP76zJ1
 B5/Mk5ITQA==
X-Scanned-By: CanIt (www . roaringpenguin . com)
X-Scanned-By: mailmunge 3.20 on 192.168.83.18
X-Spam-Score: undef - relay 192.168.84.18 marked with skip_spam_scan
X-CanIt-Geo: No geolocation information available for 192.168.84.18
X-CanItPRO-Stream: outbound (inherits from default)
X-Canit-Stats-ID: Bayes signature not available
X-CanIt-Archive-Cluster: tWKWaF/NcZkqjWIj0BEJTBHJhwY
X-CanIt-Archived-As: base/20260622 / 01huHyO29
X-Mailman-Approved-At: Tue, 23 Jun 2026 08:07:15 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[skoll.ca,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[skoll.ca:s=canit2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,debian.org,linuxfoundation.org,igalia.com,gmail.com,ffwll.ch,bugs.debian.org,lists.linux.dev,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianne@skoll.ca,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[skoll.ca:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,ristioja.ee:email,gato.skoll.ca:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 23E006B51F3

On Mon, 22 Jun 2026 20:46:44 +0300
Jaak Ristioja <jaak@ristioja.ee> wrote:

> Reverting commit fee50077656 ("drm/amd/display: Bump the HDMI clock to 
> 340MHz") on top of v7.1.1 appears to resolve the issue, as I am now able 
> to get a picture.

Unfortunately, reverting that commit will *break* it for me with my Dasung
E-Ink monitor. :(

If it's not possible to detect what the maximum HDMI clock should be, perhaps
a module parameter specifying the HDMI version could be implemented?  Or
a parameter to specify the maximum HDMI clock directly?

Regards,

Dianne.
