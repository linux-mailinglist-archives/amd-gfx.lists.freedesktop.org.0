Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2009730EF
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2024 12:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FE410E76B;
	Tue, 10 Sep 2024 10:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AyfSk7fi";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E06910E76F
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2024 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725962739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llCiz1wgiDOjZioOMdI2jOtnGvZR8jccEgYLQZWziXc=;
 b=AyfSk7fiBJ5o76BOXC59PDNi2b1Wg641jvKw831zkl+xKUkcT3Lh1pNPD1m0A/nNxk9f6m
 hySDlWDhuYhqXc84lgrI1sNxBgOzCWCRe0u/6tfz/k+eyE15o+SAMN+2BM+aomWV7Qybs/
 lGwHWGjnZd3r29x52r7Iy/3tzqe51cU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-t6kT3N87ODK_FrjKnt1qXw-1; Tue, 10 Sep 2024 06:05:36 -0400
X-MC-Unique: t6kT3N87ODK_FrjKnt1qXw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb22d396cso21777315e9.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2024 03:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725962735; x=1726567535;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=llCiz1wgiDOjZioOMdI2jOtnGvZR8jccEgYLQZWziXc=;
 b=hnU5innb+LzHryOZKFOqPs6cSSHUD1ErWqqm4TLQAFrkPRTuekMmGZKrofPk3L0RY4
 wu7nSg9LXjP1ofnM7Hsg7MD6kh4dTztljLxAoybNRYYOOva7psTF158ROqTvMFfyLOsF
 tuNhQqiZJ0y1tQu3TqfS1fbwdiDfHpok0n4wwWv0ZIQhA6kZtWSZx1UBmGS4ETsUy4LQ
 Du1ptiRE9eRd0goHwu32gUHm6X10UQb8RN5aCzljxTWkndd/LWVk+QShxiY89rjWd2t8
 iETtlo/psK6HzIAxMT5UR1gVErI/XPhGG0Ry4X76Wjvj5LJ4h3ptJCCKeGIUR9XCGhwO
 QJ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkHT4eVeGD7hxvQRKfA2nIntC0zDv8Laq285XBIDcK7Z9H4TcvfYd1XmGbO8lbP8s4hiN0+dBc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg1aMI7eqJS4Csw4lnEvCvUisgcT5zH2dq6DBExrY1qzgI1vfK
 fLPQmFbUM9caEMaSZZQQHRREmuCKIuooiz0LDfIjRDGE9kfi4mEUOQe5mGXqNnRoHNrKmu+6p4e
 wp0MKW+34PJhEbPuvQh/zDOsTUKzIgYCDEU/LSfmIpjRJdd4bcKyC7xJKycazk5k=
X-Received: by 2002:a05:600c:3b1d:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-42cb7501dc3mr50992165e9.0.1725962735380; 
 Tue, 10 Sep 2024 03:05:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/HoxNOiNzwKYHD+D/SuZK8zhXeyBr4s97IDD/XgtIZJ9CESYvLArazuUWOfhXm3tFz2p2HQ==
X-Received: by 2002:a05:600c:3b1d:b0:42c:b750:1a1e with SMTP id
 5b1f17b1804b1-42cb7501dc3mr50991895e9.0.1725962734865; 
 Tue, 10 Sep 2024 03:05:34 -0700 (PDT)
Received: from eisenberg.fritz.box ([2001:16b8:3dba:4b00:6ba1:ad1b:2dfb:e2a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc01a8ee7sm18218625e9.0.2024.09.10.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 03:05:33 -0700 (PDT)
Message-ID: <9dd486a94717c51ec9dfcea648a98487b68a7385.camel@redhat.com>
Subject: Re: [PATCH 6/8] drm/sched: Re-order struct drm_sched_rq members for
 clarity
From: Philipp Stanner <pstanner@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>
Date: Tue, 10 Sep 2024 12:05:32 +0200
In-Reply-To: <20240909171937.51550-7-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
 <20240909171937.51550-7-tursulin@igalia.com>
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

On Mon, 2024-09-09 at 18:19 +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>=20
> Lets re-order the members to make it clear which are protected by the
> lock
> and at the same time document it via kerneldoc.

I'd prefer if commit messages follow the idiomatic kernel style of that
order:
   1. Describe the current situation
   2. State why it's bad or undesirable
   3. (describe the solution)
   4. Conclude commit message through sentences in imperative stating
      what the commit does.

In this case I would go for:
"struct drm_sched_rq contains a spinlock that protects several struct
members. The current documentation incorrectly states that this lock
only guards the entities list. In truth, it guards that list, the
rb_tree and the current entity.

Document what the lock actually guards. Rearrange struct members so
that this becomes even more visible."

>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> ---
> =C2=A0include/drm/gpu_scheduler.h | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index a06753987d93..d4a3ba333568 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -243,10 +243,10 @@ struct drm_sched_entity {
> =C2=A0/**
> =C2=A0 * struct drm_sched_rq - queue of entities to be scheduled.
> =C2=A0 *
> - * @lock: to modify the entities list.
> =C2=A0 * @sched: the scheduler to which this rq belongs to.
> - * @entities: list of the entities to be scheduled.
> + * @lock: protects the list, tree and current entity.

Would be more consistent with the below comment if you'd address them
with their full name, aka "protects @entities, @rb_tree_root and
@current_entity".


Thanks,
P.


> =C2=A0 * @current_entity: the entity which is to be scheduled.
> + * @entities: list of the entities to be scheduled.
> =C2=A0 * @rb_tree_root: root of time based priory queue of entities for
> FIFO scheduling
> =C2=A0 *
> =C2=A0 * Run queue is a set of entities scheduling command submissions fo=
r
> @@ -254,10 +254,12 @@ struct drm_sched_entity {
> =C2=A0 * the next entity to emit commands from.
> =C2=A0 */
> =C2=A0struct drm_sched_rq {
> - spinlock_t lock;
> =C2=A0 struct drm_gpu_scheduler *sched;
> - struct list_head entities;
> +
> + spinlock_t lock;
> + /* Following members are protected by the @lock: */
> =C2=A0 struct drm_sched_entity *current_entity;
> + struct list_head entities;
> =C2=A0 struct rb_root_cached rb_tree_root;
> =C2=A0};
> =C2=A0

