Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HUCrGN9uMWrYjAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:42:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB66691500
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:42:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=OojBAbqr;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599DB10E7BB;
	Tue, 16 Jun 2026 15:42:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BE310E7BB
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 15:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1781624538; x=1781883738;
 bh=+oKTVJXIqijwrbl5Sd4QMiLl8gU26y5uU8LzNVyH+Vw=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=OojBAbqr2npX4+dEUe9tBXBYHDwa4cZm+FignIGgmgHsV0eV5vBqflKPQDyRmwdqU
 NoW24dIYLAJo4SZ/itA+0wWjv5nArShnUfiDr3DKYrlV6XmNPvAenq9mGvvCBvXfGJ
 d5Ni25h5uqap8BPeKWvEtzVHpDsX0QIIipL5IQ4Vsg6OTIGzBGnjx/jvoCNjpudWWg
 1Ll5oxc68t4hDHX80vi8mtaPbw0UsCnVXdPsAxl376na/GQ7W/bmtFrA9rgQbBBG0j
 pg/vYarL32lD1H2ePJO3EHKmsJ908QSuyTjNRoblNnnpJbpeqHhaBW6m0lK7hK5T0C
 NI7bTPhAT9ZNA==
Date: Tue, 16 Jun 2026 15:42:11 +0000
To: Alex Deucher <alexdeucher@gmail.com>
From: Gerhard Schwanzer <geschw@pm.me>
Cc: Xiaogang Chen <xiaogang.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Philip Yang <Philip.Yang@amd.com>
Subject: Re: [PATCH] drm/amdkfd: Use last + 1 of vm range to check 2MB huge
 page alignment
Message-ID: <20260616154200.66824-1-geschw@pm.me>
Feedback-ID: 110185885:user:proton
X-Pm-Message-ID: e0639863b9f42eca51c1dce08d1066afa0e7d5d0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	MID_CONTAINS_FROM(1.00)[];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:xiaogang.chen@amd.com,m:Alexander.Deucher@amd.com,m:Philip.Yang@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,pm.me:dkim,pm.me:mid,pm.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DAB66691500

Hi Alex, Xiaogang,

thanks for looking at this quickly.

Replying here because this patch instance carries my Tested-by tag.
One clarification: my runtime testing covers the reproduced split-tail
fault on the RX 7600 XT. It does not validate the head-side boundary
condition in this exact patch.

The remaining concern is the head-side condition: this version still uses
head->last there. In svm_range_split_head(), the generated head range is
[old_start, new_start - 1], so the split boundary is new_start, i.e.
head->last + 1. I replied with the concrete boundary examples here:

https://lore.kernel.org/all/20260616152320.60210-1-geschw@pm.me/

For that reason I think the head-side condition should use the exclusive
split boundary, e.g. new_start as in v2:

https://lore.kernel.org/all/20260616105553.13062-1-geschw@pm.me/

To avoid my Tested-by tag being read as covering the head-side boundary
logic, please either use an exclusive-boundary version or drop my
Tested-by from this exact version. My test result covers the reproduced
split-tail regression, not the head-side boundary logic.

Thanks,
Gerhard

