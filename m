Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5394973626
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2024 13:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDBE10E79B;
	Tue, 10 Sep 2024 11:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XHiN6LSi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CF610E79B
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2024 11:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725967452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5af8lqRwlYHWTNiv2Qjrhnnec53VwZ7vS8UEWqhLOqU=;
 b=XHiN6LSiaA9tV0E2i21livGwn2ON7iAeYwBFAdgB8JbMOz/cNgZ59Ej56NNEhbRjWp0Woz
 YewAO/ML2Ay7x7OTQWHZVrwCA9AKPoFLz62QzN7Ks1bO+F1GxGIYN1CuF8OS86F6Ye1jgm
 /AoHsSUXuAsANpEDBKRaZQTz+4cPG2g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-TOYYj1w8P86-8FGiIl7S8Q-1; Tue, 10 Sep 2024 07:24:11 -0400
X-MC-Unique: TOYYj1w8P86-8FGiIl7S8Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5c384fc1c65so7302259a12.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2024 04:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725967450; x=1726572250;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5af8lqRwlYHWTNiv2Qjrhnnec53VwZ7vS8UEWqhLOqU=;
 b=aA7G7Odwi6Xil/NO5nj9FJnawNR9oOmIrx0YkDmjWkIGtfUa0MfHJ7lwcS68sr8cAZ
 mORaYmGhmHCsvIoggZr95h8zm5URoUS7TZXAYsHgQ8+quBdxqICFXyKc3tpn4NkyTmOh
 Y78WF/xmqirvk50BQJVe+AtVTmKeqoO9YsU74fikH0QHNQ5/GidVA61AJpRbyeQMfh68
 3eC3ogU/17qu8h9RcgMmWqRZBOplaQ2yBQk3LVbfK/hLzg90h/LBO5dFT+l1Ud8wz95T
 KRPlDGzORUOO5M8Ud0vtQeyU/NK8mZ8MyBC1c8qNzSDG0adPI2aWKaBzvp79ckrBue4p
 3siw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1hNTTP0rARaoel9CN4964U4gO6iyYdZndN5fFBNfaimN8jiVfcvXH8K6vFI/fhGWfuy2GwMxn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRGUpIDg+fhc7u43IDZm9EoMxhhQM4hUOS2c+h/5cSvO5mV6d3
 upzsxIASInh0/+LcG1gCDSHcNA1mUpUU5tFw0YoHfMNmNdLVwUXU6Y3YbZJ3Fk3NT+hZKp7YrvP
 D+p1kISBtQPx+hdQ0LA4Em5J3DUYVr1Urg2qZNTQKsukmKZFEPa1zjkqOAMkCV2s=
X-Received: by 2002:a50:cbca:0:b0:5c2:5c89:d24a with SMTP id
 4fb4d7f45d1cf-5c40160251fmr2811873a12.12.1725967449944; 
 Tue, 10 Sep 2024 04:24:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3RpcuhCSNbOYFSTW8RfGAkDbjPKlC7whcoTbxQ7G9XQsKRm+FOISuMHcHmX3JcY3X+qmiVQ==
X-Received: by 2002:a50:cbca:0:b0:5c2:5c89:d24a with SMTP id
 4fb4d7f45d1cf-5c40160251fmr2811835a12.12.1725967449276; 
 Tue, 10 Sep 2024 04:24:09 -0700 (PDT)
Received: from ?IPv6:2001:16b8:3dba:4b00:6ba1:ad1b:2dfb:e2a2?
 ([2001:16b8:3dba:4b00:6ba1:ad1b:2dfb:e2a2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd41bbdsm4149378a12.6.2024.09.10.04.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 04:24:08 -0700 (PDT)
Message-ID: <f4eeff7aa079bb82b208e7606381dc01ed56d79e.camel@redhat.com>
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>
Date: Tue, 10 Sep 2024 13:24:07 +0200
In-Reply-To: <abe23963-4cd8-486c-b405-ef3504dd106c@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-7-tursulin@igalia.com>
 <9dd486a94717c51ec9dfcea648a98487b68a7385.camel@redhat.com>
 <abe23963-4cd8-486c-b405-ef3504dd106c@igalia.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 2024-09-10 at 11:42 +0100, Tvrtko Ursulin wrote:
>=20
> On 10/09/2024 11:05, Philipp Stanner wrote:
> > On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
> > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > >=20
> > > Lets re-order the members to make it clear which are protected by
> > > the
> > > lock
> > > and at the same time document it via kerneldoc.
> >=20
> > I'd prefer if commit messages follow the idiomatic kernel style of
> > that
> > order:
> > =C2=A0=C2=A0=C2=A0 1. Describe the current situation
> > =C2=A0=C2=A0=C2=A0 2. State why it's bad or undesirable
> > =C2=A0=C2=A0=C2=A0 3. (describe the solution)
> > =C2=A0=C2=A0=C2=A0 4. Conclude commit message through sentences in impe=
rative
> > stating
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 what the commit does.
> >=20
> > In this case I would go for:
> > "struct drm_sched_rq contains a spinlock that protects several
> > struct
> > members. The current documentation incorrectly states that this
> > lock
> > only guards the entities list. In truth, it guards that list, the
> > rb_tree and the current entity.
> >=20
> > Document what the lock actually guards. Rearrange struct members so
> > that this becomes even more visible."
>=20
> IMO a bit much to ask for a text book format, for a trivial patch,
> when=20
> all points are already implicitly obvious. That is "lets make it
> clear"=20
> =3D current situation is not clear -> obviously bad with no need to=20
> explain; "and the same time document" =3D means it is currently not=20
> documented -> again obviously not desirable.
>=20
> But okay, since I agree with the point below (*), I can explode the
> text=20
> for maximum redundancy.

I agree that for very short / trivial changes one can keep it short.
But the line separating what is obvious for oneself and for others is
often thin.

P.

>=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0=C2=A0include/drm/gpu_scheduler.h | 10 ++++++----
> > > =C2=A0=C2=A01 file changed, 6 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index a06753987d93..d4a3ba333568 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -243,10 +243,10 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0/**
> > > =C2=A0=C2=A0 * struct drm_sched_rq - queue of entities to be schedule=
d.
> > > =C2=A0=C2=A0 *
> > > - * @lock: to modify the entities list.
> > > =C2=A0=C2=A0 * @sched: the scheduler to which this rq belongs to.
> > > - * @entities: list of the entities to be scheduled.
> > > + * @lock: protects the list, tree and current entity.
> >=20
> > Would be more consistent with the below comment if you'd address
> > them
> > with their full name, aka "protects @entities, @rb_tree_root and
> > @current_entity".
>=20
> *) this one I agree with.
>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > Thanks,
> > P.
> >=20
> >=20
> > > =C2=A0=C2=A0 * @current_entity: the entity which is to be scheduled.
> > > + * @entities: list of the entities to be scheduled.
> > > =C2=A0=C2=A0 * @rb_tree_root: root of time based priory queue of enti=
ties
> > > for
> > > FIFO scheduling
> > > =C2=A0=C2=A0 *
> > > =C2=A0=C2=A0 * Run queue is a set of entities scheduling command
> > > submissions for
> > > @@ -254,10 +254,12 @@ struct drm_sched_entity {
> > > =C2=A0=C2=A0 * the next entity to emit commands from.
> > > =C2=A0=C2=A0 */
> > > =C2=A0=C2=A0struct drm_sched_rq {
> > > - spinlock_t lock;
> > > =C2=A0=C2=A0 struct drm_gpu_scheduler *sched;
> > > - struct list_head entities;
> > > +
> > > + spinlock_t lock;
> > > + /* Following members are protected by the @lock: */
> > > =C2=A0=C2=A0 struct drm_sched_entity *current_entity;
> > > + struct list_head entities;
> > > =C2=A0=C2=A0 struct rb_root_cached rb_tree_root;
> > > =C2=A0=C2=A0};
> > > =C2=A0=20
> >=20
>=20

