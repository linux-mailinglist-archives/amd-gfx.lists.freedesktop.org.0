Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Gha6Iq1wMWp4jQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:50:05 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65696916BE
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 17:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=aQE+sKHc;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E6810E7A0;
	Tue, 16 Jun 2026 15:50:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 23927 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jun 2026 15:50:01 UTC
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch
 [109.224.244.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959F10E7A0
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1781625000; x=1781884200;
 bh=BWs5SL/v81EtVQn7ZUw4+xRoFdcPwPEKr0cQz6Jkwug=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=aQE+sKHcU4RNLiy/lKG7laLU6A15duE+iDrNY8UU05eKVKoL3OGUBkVVUx59cORvD
 TeV/KQFXg2ymTE5JlBSH2bb4+PLoXPdE88dRMO2V7Z7sFxPP1wFnFwlHTGmu5R0IgQ
 /lLfw+camJU+Q6f8yk2tDugzU55Z6BS8+QZI+5Ry4NbEWORDdFUazCVU6s6HdaHdDv
 Ijx2kjsvDwxGc/dzlnOsaVyvQGFBIw4wRPr3+7jtR4JMdAV8MwIOrjdtqnK8Q5DZ/I
 nR+X/2i9K8XJMKsMHoM7gBjpGrWmk4ahEVjYPFZRlKXyUOg1qI2zmtJZYZUvN3H9Y4
 XRTTpnWEuRqJQ==
Date: Tue, 16 Jun 2026 15:49:53 +0000
To: Xiaogang Chen <xiaogang.chen@amd.com>
From: Gerhard Schwanzer <geschw@pm.me>
Cc: amd-gfx@lists.freedesktop.org,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, Philip Yang <Philip.Yang@amd.com>
Subject: Re: [PATCH] drm/amdkfd: Use last + 1 of vm range to check 2MB huge
 page alignment
Message-ID: <20260616154941.68673-1-geschw@pm.me>
Feedback-ID: 110185885:user:proton
X-Pm-Message-ID: 75347ba2fb1adbf4a6cff4e1263f8d4c6a22953a
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
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaogang.chen@amd.com,m:Alexander.Deucher@amd.com,m:alexdeucher@gmail.com,m:Philip.Yang@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[geschw@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pm.me:dkim,pm.me:mid,pm.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E65696916BE

Hi Xiaogang, Alex,

threading note: my clarification after Alex's ack is archived on lore,
but not attached to this patch instance there. Repeating only the
essential point here because this patch carries my Tested-by tag.

My Tested-by covers the reproduced split-tail fault on RX 7600 XT. It
does not validate the head-side boundary condition in this exact patch.

This version still uses head->last on the head side. In
svm_range_split_head(), the generated head range is [old_start,
new_start - 1], so the split boundary is new_start, i.e. head->last + 1.

Technical details and boundary examples:
https://lore.kernel.org/all/20260616152320.60210-1-geschw@pm.me/

Please either use an exclusive-boundary version for the head-side
condition, e.g. new_start as in v2, or drop my Tested-by from this exact
version.

v2:
https://lore.kernel.org/all/20260616105553.13062-1-geschw@pm.me/

Thanks,
Gerhard

