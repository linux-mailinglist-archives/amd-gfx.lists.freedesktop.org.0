Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oi52O+PSPGqzswgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 09:04:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E786C33B5
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2026 09:03:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NZ3EYI40;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A53410F152;
	Thu, 25 Jun 2026 07:03:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5080F10E07E;
 Wed, 24 Jun 2026 11:38:35 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4glg1M49jqz9vGR;
 Wed, 24 Jun 2026 13:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1782301111; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HV2lLqgXjOl+Lxo/8p13Wzs0cePcH00ansQo1+4Niw=;
 b=NZ3EYI40wV11NVQY3x+H8q3+RTUhftybHWSHPj8robJhre4p5i3eVvDRHcXB1CVQc8Ogvr
 hYS1kWl4VKPG/Pj/T4XGgP0pr0QukSZH5Dhj0UGDu9Q0IsVjsD9aVyHUSzTYmzHch0IJqG
 Y9RT0HMmVyeaBR9je/9KBGwkE0AjjsiwBaWDyFa1H7KKn88fZNsce5hGGyAvFKNWrJauhH
 qSjFZymChl1TEZYNoDykbSVVcCQ9OdIRoJoKHQS94SVbigK3iiX2ugj5p5yBhZUIMHK+Ii
 hNYTwCPcNvZrV2nxe/0aozEkOWzC3VaqbkPraPGJFe9i+DJDyH2Wr366IXc7nw==
Message-ID: <27d0f7c4d1c8c3beaa0ef1732d2cc4c773826575.camel@mailbox.org>
Subject: Re: [RFC] drm/sched: Replace completion with a flush
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost	 <matthew.brost@intel.com>, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 13:38:28 +0200
In-Reply-To: <fd5e55f6-c6be-48b4-8b87-c3d6d6d0a6ff@igalia.com>
References: <20260611123423.39819-1-tvrtko.ursulin@igalia.com>
 <ba8ea856526d54753da68deefe7b77f15c908fa3.camel@mailbox.org>
 <fd5e55f6-c6be-48b4-8b87-c3d6d6d0a6ff@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 31ueit5ouojyds81y79rjgsi9gsab7ac
X-MBO-RS-ID: 923db6dc4facddbe1ff
X-Mailman-Approved-At: Thu, 25 Jun 2026 07:03:56 +0000
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
Reply-To: phasta@kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[mailbox.org:query timed out];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50E786C33B5

On Tue, 2026-06-23 at 08:19 +0100, Tvrtko Ursulin wrote:
> On 17/06/2026 09:38, Philipp Stanner wrote:
> >=20
> > > @@ -576,6 +578,13 @@ void drm_sched_entity_select_rq(struct drm_sched=
_entity *entity)
> > > =C2=A0=C2=A0 return;
> > > =C2=A0=20
> > > =C2=A0=C2=A0 spin_lock(&entity->lock);
> > > +
> > > + if (entity->stopped) {
> > > + spin_unlock(&entity->lock);
> > > + return;
> > > +
> > > + }
> >=20
> > Seems unrelated? Why wasn't this needed semantically before?
>=20
> It solidifies the guarantee drm_sched_entity_kill() expects that the=20
> scheduler assigned to an entity cannot change after entity has been stopp=
ed.
>=20
> There we have this sequence:
>=20
> =C2=A0=C2=A0 spin_lock(&entity->lock);
> =C2=A0=C2=A0 entity->stopped =3D true;
> =C2=A0=C2=A0 sched =3D drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0=C2=A0 spin_unlock(&entity->lock);
>=20
> =C2=A0=C2=A0 if (sched)
> =C2=A0=C2=A0=C2=A0 drm_sched_flush_run_work(sched);
>=20
> That is, without that check, in theory, an evil driver could race=20
> drm_sched_entity_select_rq() (via drm_sched_job_arm()) and=20
> drm_sched_entity_kill(). I am not sure if any driver can actually do=20
> that at the moment but it felt sensible to express it in code.

So, I was mentally in my Rust code the last weeks; re-evaluating this,
I see what you want to achieve.

I think this is then a valid robustness addition. However:

 * entity->lock's documentation currently does not state that entity-
   >stopped is also protected by that lock. That needs an update.
 * Separate patch is desirable
 * That patch should investigate whether entity->stopped can
   consistently be locked, i.e. drm_sched_entity_is_idle()
 * It might be a good opportunity to document the idempotence status of
   drm_sched_entity_kill() :)


P.
