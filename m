Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181ACA19F0F
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Jan 2025 08:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417B10E779;
	Thu, 23 Jan 2025 07:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bOZGM+lw";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58B910E77F
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jan 2025 07:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737617704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lf0BZUp7ZGmjxG/9Q7auKIncjplw19R9RJmfyaaXa+8=;
 b=bOZGM+lwOIatJxZkM4hYiW+YD74LM8Syjc4cydASJ9h34cdEMU+ix5kttUZD3dPf9Yg/1s
 NEEG9zkO2Ay0pyE4jyXSuAdIJd0m2uoedDu+n8nQKEQPdNojRHRbHLcZLoPIevKe/GEFq2
 t24SWTyDP5keV6xI9CwN2hZH1VUGzAg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-FII43ayOOwO0KKURiHCnPA-1; Thu, 23 Jan 2025 02:35:03 -0500
X-MC-Unique: FII43ayOOwO0KKURiHCnPA-1
X-Mimecast-MFC-AGG-ID: FII43ayOOwO0KKURiHCnPA
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2166464e236so17521375ad.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Jan 2025 23:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737617702; x=1738222502;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W4BN572VUFCarYdnwN8cGa+EHCfnb6F5sly/f0mJXB8=;
 b=S4+3uaPOnTHp+A+pVosGckxSHSaFbAJ/RK6oKKKBBNhkg6eQh7gmKpOrmwbYGxJ4bM
 WBsijcxyC01tAF0eN8BIQwQ3SCE4A1AJraOEiNj9qNLvLfQ63IQeKNMh9C1nm0o1AzSu
 E7svXINYowUI9sBLSHxuMcjS5JdyyYRUxOoiAPawuvRn2JpiS6OB/Tp6KKjNFGwft74u
 y6x8LoofmFAevIFIQNyy3qQtCc2SGdctJYfiCsM6FgAaZC5OhwoLzwrFiSfv4SMRymlO
 EDsG0lfy8KmhgsJ1FmA6vkQ3sLWcKJyVaP1BQixr+Ygkr/HNkIfnoUf++R3TY1U68fFd
 7UXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXktr8Rp+0vfrWyD4hn29L8zWm1OUGxK2GH/xIbSoTFhW/R0IBhFWD18ra3rHV2e4BeD+3dRlpn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRwZ8pDYk0/2IQaT6MwY8r0QcD0gSkeY6qUedo4lS1Yy7XgUZh
 XNSONrei00ByplyWl6OHHrHtJPUBJiocGQNLaRJwbpMCczWL3EZdBeyw+rfhOpFkNDM4+04Pkro
 SSbS/WGlLLansHlVAnvCpccD177ahkQsA903IzRU/ZA/wUl0BjPfnr9SQprlAysY=
X-Gm-Gg: ASbGnctcsaRCxhdW+wExS7VlyzSwvTMholJYKONlzjTjN7VgNNk3CHdJm84UvfLT9AW
 j5pPTGWl525nXhBjZS+Onsep7Yy/ztEcpm6IJ078TUsAOIq5CtIRV3jDSILuyt505rGHdv2WvgY
 3120qC/otITUroRASqU0NiEfQ13FsPh1WjAL8swnG6llojtQ5vVgqwqg5uHUaZgh1mwl0MF5rss
 zgtkrjTPX/hGSBtnBov3HtAuln0iyurQWQdeneKtbouPLYyTDboXBU1CSSJH+XuleVvI42rJjbs
 Xy7bJts0mV+FasRxWNdG
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id
 adf61e73a8af0-1eb215902cbmr29852221637.27.1737617702188; 
 Wed, 22 Jan 2025 23:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh77DDXX36dyhexySOTFKoaJSg/tDd255UJXbhLAfDvHlHC7l2xvqlFBRPYqoRrLU70wpG+g==
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id
 adf61e73a8af0-1eb215902cbmr29852184637.27.1737617701798; 
 Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab9c9462sm12612476b3a.100.2025.01.22.23.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Message-ID: <e6aea551ec14bcece31c3cbb861afee361547f84.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Melissa Wen
 <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:34:30 +0100
In-Reply-To: <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
 <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
 <20250122180353.7ef8fbc1@collabora.com>
 <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EHu8Ca19yOtRk6_6-hF7QfESKiMPKn8NK-kQRZ4TcHE_1737617702
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

On Wed, 2025-01-22 at 20:37 -0800, Matthew Brost wrote:
> On Wed, Jan 22, 2025 at 06:04:58PM +0100, Boris Brezillon wrote:
> > On Wed, 22 Jan 2025 16:14:59 +0000
> > Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> >=20
> > > On 22/01/2025 15:51, Boris Brezillon wrote:
> > > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > =C2=A0=20
> > > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0=09=09=C2=A0=C2=A0 const struct drm_panthor_queue_cre=
ate
> > > > > *args)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=09struct drm_gpu_scheduler *drm_sched;
> > > > > +=09struct drm_sched_init_params sched_params;=C2=A0=20
> > > >=20
> > > > nit: Could we use a struct initializer instead of a
> > > > memset(0)+field-assignment?
> > > >=20
> > > > =09struct drm_sched_init_params sched_params =3D {
> >=20
> > Actually, you can even make it const if it's not modified after the
> > declaration.
> >=20
> > > > =09=09.ops =3D &panthor_queue_sched_ops,
> > > > =09=09.submit_wq =3D group->ptdev->scheduler->wq,
> > > > =09=09.num_rqs =3D 1,
> > > > =09=09.credit_limit =3D args->ringbuf_size /
> > > > sizeof(u64),
> > > > =09=09.hang_limit =3D 0,
> > > > =09=09.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > =09=09.timeout_wq =3D group->ptdev->reset.wq,
> > > > =09=09.name =3D "panthor-queue",
> > > > =09=09.dev =3D group->ptdev->base.dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=C2=A0=20
> > >=20
>=20
> +2

Yup, getting rid of memset() similar to Danilo's suggestion is surely a
good idea.

I personally don't like mixing initialization and declaration when
possible (readability), but having it const is probably a good
argument.

P.

>=20
> Matt
>=20
> > > +1 on this as a general approach for the whole series. And I'd
> > > drop the=20
> > > explicit zeros and NULLs. Memsets could then go too.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > >=20
> > > > The same comment applies the panfrost changes BTW.
> > > > =C2=A0=20
> > > > > =C2=A0=C2=A0=09struct panthor_queue *queue;
> > > > > =C2=A0=C2=A0=09int ret;
> > > > > =C2=A0=20
> > > > > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0=09if (!queue)
> > > > > =C2=A0=C2=A0=09=09return ERR_PTR(-ENOMEM);
> > > > > =C2=A0=20
> > > > > +=09memset(&sched_params, 0, sizeof(struct
> > > > > drm_sched_init_params));
> > > > > +
> > > > > =C2=A0=C2=A0=09queue->fence_ctx.id =3D dma_fence_context_alloc(1)=
;
> > > > > =C2=A0=C2=A0=09spin_lock_init(&queue->fence_ctx.lock);
> > > > > =C2=A0=C2=A0=09INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > > > > @@ -3341,17 +3344,23 @@ group_create_queue(struct
> > > > > panthor_group *group,
> > > > > =C2=A0=C2=A0=09if (ret)
> > > > > =C2=A0=C2=A0=09=09goto err_free_queue;
> > > > > =C2=A0=20
> > > > > +=09sched_params.ops =3D &panthor_queue_sched_ops;
> > > > > +=09sched_params.submit_wq =3D group->ptdev->scheduler-
> > > > > >wq;
> > > > > +=09sched_params.num_rqs =3D 1;
> > > > > =C2=A0=C2=A0=09/*
> > > > > -=09 * Credit limit argument tells us the total number
> > > > > of instructions
> > > > > +=09 * The credit limit argument tells us the total
> > > > > number of instructions
> > > > > =C2=A0=C2=A0=09 * across all CS slots in the ringbuffer, with som=
e
> > > > > jobs requiring
> > > > > =C2=A0=C2=A0=09 * twice as many as others, depending on their
> > > > > profiling status.
> > > > > =C2=A0=C2=A0=09 */
> > > > > -=09ret =3D drm_sched_init(&queue->scheduler,
> > > > > &panthor_queue_sched_ops,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1=
,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size /
> > > > > sizeof(u64),
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group-
> > > > > >ptdev->base.dev);
> > > > > +=09sched_params.credit_limit =3D args->ringbuf_size /
> > > > > sizeof(u64);
> > > > > +=09sched_params.hang_limit =3D 0;
> > > > > +=09sched_params.timeout =3D
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS);
> > > > > +=09sched_params.timeout_wq =3D group->ptdev->reset.wq;
> > > > > +=09sched_params.score =3D NULL;
> > > > > +=09sched_params.name =3D "panthor-queue";
> > > > > +=09sched_params.dev =3D group->ptdev->base.dev;
> > > > > +
> > > > > +=09ret =3D drm_sched_init(&queue->scheduler,
> > > > > &sched_params);
> > > > > =C2=A0=C2=A0=09if (ret)
> > > > > =C2=A0=C2=A0=09=09goto err_free_queue;=C2=A0=20
> >=20

