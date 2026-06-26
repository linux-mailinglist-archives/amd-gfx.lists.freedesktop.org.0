Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s8ZwLgs+PmrwBwkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 10:53:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED2E6CB7EB
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 10:53:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=sSYV2gbW;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038210F50D;
	Fri, 26 Jun 2026 08:53:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DE910F502;
 Fri, 26 Jun 2026 08:53:25 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gmqFr5M37z9tsY;
 Fri, 26 Jun 2026 10:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1782464000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8ththMBG+84d8ctaLVozbhNg629lcbcbIJXlC8vPYc=;
 b=sSYV2gbWRD8EpJdL+FgRmhxlqbGnugHjH9TdZydsrY5QlqaDQwv/UYrZL+CjnJgLdIlraD
 QpIthiSHBXWErDXVnH4Ct0q6yCG77seXX8NU6Da67AbtDMUoMFIMgpXtbMSxvvABmIHASC
 h8kboyCurkg3L4j8Fg91bMv4u4aanxpJ0dHOlF7apBe/ui4PYSsne86EvsEX48LZ+guhR7
 KxCn6eGHO4vGhem50G5lveeX+3u51c8ApRI4BTXmkvwWsEjrP8n+yTfzZyzUuL5gBfqEnL
 B8VSfFE6sxdPTlZfbujKRBY0zBmMUwTj7OHuN9hsnXW3v5Ye7fE8iK/Wy1+rsg==
Message-ID: <7a474010-67a1-426b-9ca2-76c11cfbb0ac@mailbox.org>
Date: Fri, 26 Jun 2026 10:53:15 +0200
MIME-Version: 1.0
Subject: Re: [RFC PATCH] drm/amd/display: extend HPD debounce filter to
 DisplayPort SST
To: Nick Haghiri <nick@haghiri.net>, Ivan Lipski <ivlipski@amd.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Xaver Hugl <xaver.hugl@kde.org>
References: <20260625150439.330875-1-nick@haghiri.net>
 <928d4c2a-d8b7-43d7-995e-a3e6996d2952@amd.com>
 <8e62f139-1d61-433e-8029-b10025a289d3@haghiri.net>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <8e62f139-1d61-433e-8029-b10025a289d3@haghiri.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4atn6ks4z84yes6ty6tdpkipeqfayuif
X-MBO-RS-ID: 9796ec2181fda82a13a
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
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michel.daenzer@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ED2E6CB7EB


[ Adding Xaver for awareness ]

On 6/25/26 21:45, Nick Haghiri wrote:
> On 6/25/26 3:15 PM, Ivan Lipski wrote:
>> I don't think I've encountered a situation when a monitor with DP can
>> wake a system up from DPMS, so that's interesting. What distro and
>> desktop environment are you using? I'd like to reproduce this issue
>> and help with it.
> 
> openSUSE Tumbleweed, KDE Plasma 6.7 on Wayland (KWin). GPU is an RX 9070
> XT (RDNA4), monitor is an MSI MPG 274U over DisplayPort SST.
> 
> What happens: when the output goes DPMS-off and the monitor drops into
> deep sleep, it briefly de-asserts and re-asserts HPD. amdgpu forwards
> that as a hotplug, KWin re-probes and re-enables the output, and the
> panel comes right back on, so it never actually stays asleep while
> connected.

FWIW, that the panel comes on and stays on might be a KWin bug. Mutter had a bug like that, which I fixed in https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/4209/diffs?commit_id=ec73076e07640fc0752d9ecc66c5934726db2d7e.


P.S. For other reasons, mutter also has debouncing similar to this. If the kernel debounces as well, it'll take longer until mutter actually removes an unplugged display from its display configuration, hopefully not too bad though.

-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
