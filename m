Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YuHYJeqHNWpcywYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:18:18 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC886A7599
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 20:18:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=en03z8oa;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8353010E0F2;
	Fri, 19 Jun 2026 18:18:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1946 seconds by postgrey-1.36 at gabe;
 Fri, 19 Jun 2026 18:18:14 UTC
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch
 [109.224.244.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5830410E0F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 18:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1781893092; x=1782152292;
 bh=9MoLvimzx+bSftmBe7LQLFHvrzzoKgLDqPHsYoCjrDY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=en03z8oa8eMmu4gqdQzg+6vlFAC1Vba2hIaJfnJ1mDyg069z0eMdJLhvllmN/mbLc
 dGjQY1m/ceqZywCujp2N7IuSrhaIoXKssV+bdgy1/hVimU9Tut2SZX0YW3W2dUDN7y
 QHxQSLe8A4e9kK/gaPvO4+ucdvA4rpV4fsU32F4f0p77s0KcW/dpY8OP31fzUtCCtV
 9qThTPQe0y7Eq3zMfxMdVhOdJSbUVhw3Isltihz1IN/JPFCEEqA14cMOIGP5vpcpHq
 f4IRjTUCpXXTXo8X8c6uK6fP7ozM/4BGlWb10loDuuU99e8YF1gTTY4eM4GfB7iGHs
 pZbYKtavDZNuQ==
Date: Fri, 19 Jun 2026 18:18:07 +0000
To: Alex Deucher <alexdeucher@gmail.com>
From: Matthew Jacob <feralmatt@pm.me>
Cc: Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: support a couple of extra BARCO graphics
 adapters
Message-ID: <_wGLMSmA5KwXMOdJR9DMYYcrBGyWjl_lFPeCksAOJyOgTvqj_3yZOanviNEGgUKz2_z0RfvkZbU7hSjN_4iRXdwn3J5NtEQBIASG3v-hvM8=@pm.me>
In-Reply-To: <CADnq5_M+A0C6cQmkwG3Kt_AOQEgxB9+iGaq8E8p-XPnKakMLpg@mail.gmail.com>
References: <kb82H17fFzuBQ-ZxQz8SJqF6DPycZtYEc7XvSWxR0nww24pZJTnkYUU_d8bbJpqC34uGL7IhIPFznw4nMYtzozBZCxxTWBgjjA3gTdR49Fc=@pm.me>
 <CADnq5_M+A0C6cQmkwG3Kt_AOQEgxB9+iGaq8E8p-XPnKakMLpg@mail.gmail.com>
Feedback-ID: 169730088:user:proton
X-Pm-Message-ID: c39596485f41abb62771a9a9e25becff18ee8305
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,pm.me:dkim,pm.me:email,pm.me:mid,pm.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BC886A7599

Yeah, sorry. Let me figure out how to do that



Wizard, 3rd Class

Sent with Proton Mail secure email.

On Friday, June 19th, 2026 at 11:15, Alex Deucher <alexdeucher@gmail.com> w=
rote:

> On Fri, Jun 19, 2026 at 1:54=E2=80=AFPM Matthew Jacob <feralmatt@pm.me> w=
rote:
> >
> >
> >
> > BARCO produces its own adapters using AMD chipsets. Mostly they are use=
d on Windows platforms for radiology PACS review workstations. They don't w=
ant to spend resources to support Linux. Working with them unofficially joi=
ntly with Kaiser who is experimenting with Linux as an alternate platform I=
 got some patches to support some of the cards that Kaiser has in its fleet=
s in several regions. Neither Kaiser nor BARCO have any objection to inclus=
ion of these changes in Linux.
> >
> > Changes attached.
> >
>=20
> So you can retain authorship, can you send this as a proper git patch
> with your signed-off-by?
>=20
> Thanks,
>=20
> Alex
> 
