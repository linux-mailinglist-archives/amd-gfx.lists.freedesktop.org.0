Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hcv9Bv+LO2prZggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFE6BC53F
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 09:49:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YTL7tJty;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=reject) header.from=mailbox.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C4710EDE4;
	Wed, 24 Jun 2026 07:49:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFA110EA16;
 Tue, 23 Jun 2026 08:48:42 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gkzHq4Fnhz9v78;
 Tue, 23 Jun 2026 10:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1782204519; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pWD3kXy7FvABniqLASAYr3Ar2q381R1F4yLWK1E99wE=;
 b=YTL7tJty+RcTyAY2LQcXaJ5APm2LXSo32vd2hGyvdizLazpzO++yDPdUQzOPRZaGSJezAV
 GVKnhXS1uZJnnp9vet+NC2VncdCU4c1/VMECnKaZHNyc6n9UcTQzYeTBG4GHPaltMah4yv
 tDv7pBP/ulkgG5SpuGEiut0TNnR8Y/AiO8P5HsdZUlI2+aqmePcoIPdLuPx3uKDmfCbg8I
 DCuE6v9+EHKb2NYdZaJ+ztlX97RD97kPscOiA+EPTGTv6/GSCYtmZLfdWEmKPCuDqHM5ji
 ZXw06OSL6/WNSTWi5NBfbTS5ndFFYXFhqaV6FC7d99M/2/t4t7KuTJH9WOOx8A==
Message-ID: <e9b876bea7a2ef33d5e4ca103721135400c875be.camel@mailbox.org>
Subject: Re: [RFC] drm/sched: Replace completion with a flush
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost	 <matthew.brost@intel.com>, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 23 Jun 2026 10:48:34 +0200
In-Reply-To: <fd5e55f6-c6be-48b4-8b87-c3d6d6d0a6ff@igalia.com>
References: <20260611123423.39819-1-tvrtko.ursulin@igalia.com>
 <ba8ea856526d54753da68deefe7b77f15c908fa3.camel@mailbox.org>
 <fd5e55f6-c6be-48b4-8b87-c3d6d6d0a6ff@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 160ee2143d28db947d8
X-MBO-RS-META: irs6qozanikhp3peidcjecktyaca5zn4
X-Mailman-Approved-At: Wed, 24 Jun 2026 07:49:12 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mailbox.org:dkim,mailbox.org:mid,mailbox.org:from_mime,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0FFE6BC53F

On Tue, 2026-06-23 at 08:19 +0100, Tvrtko Ursulin wrote:
> On 17/06/2026 09:38, Philipp Stanner wrote:
> > > +	/*
> > > +	 * Make sure this entity is not used by the scheduler at the moment=
.
> > > +	 *
> > > +	 * Scheduler is guaranteed to be stable after the entity was stoppe=
d and
> > > +	 * removed from the run-queue.
> > > +	 */
> > > +	if (sched)
> > > +		drm_sched_flush_run_work(sched);
> > > =C2=A0=20
> > > -	/* The entity is guaranteed to not be used by the scheduler */
> > > =C2=A0=C2=A0	prev =3D rcu_dereference_check(entity->last_scheduled, t=
rue);
> > > =C2=A0=C2=A0	dma_fence_get(prev);
> > > =C2=A0=C2=A0	while ((job =3D drm_sched_entity_queue_pop(entity))) {
> > > @@ -576,6 +578,13 @@ void drm_sched_entity_select_rq(struct drm_sched=
_entity *entity)
> > > =C2=A0=C2=A0		return;
> > > =C2=A0=20
> > > =C2=A0=C2=A0	spin_lock(&entity->lock);
> > > +
> > > +	if (entity->stopped) {
> > > +		spin_unlock(&entity->lock);
> > > +		return;
> > > +
> > > +	}
> >=20
> > Seems unrelated? Why wasn't this needed semantically before?
>=20
> It solidifies the guarantee drm_sched_entity_kill() expects that the=20
> scheduler assigned to an entity cannot change after entity has been stopp=
ed.

That in general I like a lot, of course. As you probably know my
"dream" for drm_sched is to get rid of as much lockless magic as
possible, shown by the entries I've added to Documentation/gpu/todo.rst
(on drm-misc-next).

>=20
> There we have this sequence:
>=20
> =C2=A0=C2=A0 spin_lock(&entity->lock);
> =C2=A0=C2=A0 entity->stopped =3D true;
> =C2=A0=C2=A0 sched =3D drm_sched_rq_remove_entity(entity->rq, entity);
> =C2=A0=C2=A0 spin_unlock(&entity->lock);
>=20
> =C2=A0=C2=A0 if (sched)
> =C2=A0=C2=A0=C2=A0	drm_sched_flush_run_work(sched);
>=20
> That is, without that check, in theory, an evil driver could race=20
> drm_sched_entity_select_rq() (via drm_sched_job_arm()) and=20
> drm_sched_entity_kill(). I am not sure if any driver can actually do=20
> that at the moment but it felt sensible to express it in code.

The devil is in the "at the moment".

AFAICS and as your explanation sounds, this is an existing problem that
is unrelated to the Flush RFC. So I suppose that this should be a
separate patch (independent from this one) which precisely focusses on
this robustness work.

A dedicated patch probably should then be concerned about the 'stopped'
bool's synchronization in general and should investigate the lockless
check in drm_sched_entity_is_idle(), too. The memory barrier there
seems only concerned about the list=E2=80=A6


>=20
> > > +
> > > =C2=A0=C2=A0	sched =3D drm_sched_pick_best(entity->sched_list, entity=
->num_sched_list);
> > > =C2=A0=C2=A0	rq =3D sched ? &sched->rq : NULL;
> > > =C2=A0=C2=A0	if (rq !=3D entity->rq) {
> > > diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu=
/drm/scheduler/sched_internal.h
> > > index 13ecb771d7a2..80dece3be415 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_internal.h
> > > +++ b/drivers/gpu/drm/scheduler/sched_internal.h
> > > @@ -35,12 +35,22 @@ bool drm_sched_can_queue(struct drm_gpu_scheduler=
 *sched,
> > > =C2=A0=C2=A0			 struct drm_sched_entity *entity);
> > > =C2=A0=C2=A0void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
> > > =C2=A0=20
> > > +/**
> > > + * drm_sched_flush_run_work - flush the run-job work
> >=20
> > In v1, you'd probably want to document what this function typically
> > will be used for :)
>=20
> Well its in the scheduler _internal_ header and I am not sure what to
> write which will add real value.
>=20
> "Only used to make sure a stopped entity is not in use by the scheduler=
=20
> workers."

I think the magic word that provides value to newbies trying to get
familiar with our complex code base is "synchronization".

"A synchronization helper used to make sure that no scheduler worker
does access this entity anymore."


Kind greetings,
Philipp
