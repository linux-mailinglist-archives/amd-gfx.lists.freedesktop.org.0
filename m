Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +kW5FHxSVWqKmwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 23:02:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB674F2B5
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 23:02:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c8U2TmAh;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335F310EB0C;
	Mon, 13 Jul 2026 21:02:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0561E10EB0A
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 21:02:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2cac39b729dso8773285ad.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 14:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783976568; cv=none;
 d=google.com; s=arc-20260327;
 b=apRNMpm+EepDa63YiZsbXpXnk4tyMl+fyRdUoFf+0GxToVbejfV7Lf13E1kQySJfrz
 zt/2YSjjzFySv34NwrwHiFgX88I+h/njCk3TiX3MrdS0skAa9R2655/KH2ZjIRsW2+uk
 2quTBk73/a+bWCZoK9z/vWFQ+ILz3EoOx5/hGHjPRfdqDGJsoObdX90J2cbGGl0/5kyN
 p2z1bIm1sBFl5QJIzanx+2/qA/YINocj4DhBK5wAHAZNsbDrjVgOoXlHP8Yft8Np5kK7
 rBGu7lbo4B60nxOeDVYt6kOwp13yxcd6e5Ji0FPoyKzzCOf66y4oIBg31uWEu9YvIozI
 9VmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ph13hASe9yyfNakzf/6CDMCgAv4kGnsSrdyRu0m/C04=;
 fh=7tZISgKZRmTM/BwjRskAEx/q9Jhm9oQzPd8OG42RS0k=;
 b=QMMn9XcJ64f46DlLEfIfBaRxOoCP+FBhrMhoIaOKf1IpXDH9NgAi4adaMQgJseJnaE
 bPHnvfjgaE+wmBhwrqTkVNKo9/5D8HtzKAeogW+X4IgGdSRNoIUNt0rbuta0/Qn06+lE
 cuCRYeOah3G+iKP0JSHQVMnnp6Ew0e76M3K8nWs21E3NurAgStkZuNH2G3nIowSxQ41l
 a6wvjT9pzEzv+WulSXitGUNxsl5gd1wcC0gnSqB3+87j+iuafPy3jPuSscrGi7SJZnog
 qjMG1A5dLgBQ6qJmr3eVt+HT4Dot8XZHdlS51vLiha79tFYUgmB7rkF9LixJ5wwVeDtO
 xn2g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783976568; x=1784581368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ph13hASe9yyfNakzf/6CDMCgAv4kGnsSrdyRu0m/C04=;
 b=c8U2TmAhYI8A6TBvD7I5eRpSKbKcn51Miz3I79EqVpqiRO/kPsmZbr1Xlp2ydQ8WXV
 LxRdGv6BqSuRKycU1fQIIcAtbcvGF559L6zdoFP7s9SvPFB54XETj+9kac3uEcb1TLCu
 cv5UGNhi2GWa0k/0LDKtEM5b1LXq2TJnNrgajgm2A8iDEcQzxU1Dy3ZVMup5Y6ilLj53
 D37a1wUC+RaL1FSkOZhz3lNHmbPJ3OhrdGkruiKLXX5Yb0eZ3RXfoDOk8x+eJO5SOLAH
 0ulUAJLnhm2DuVMLjSvJze7aofz7QvcD8VLWVE5Oo+VVrMEPSkFXG4rqMOzn3SZIBTkK
 GaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783976568; x=1784581368;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ph13hASe9yyfNakzf/6CDMCgAv4kGnsSrdyRu0m/C04=;
 b=FJAJZVdKCJLznKuG7dgA3/nUutNqaKcyAgYvGE0SZImdib8BvS49aXoxBdDyqM3a0W
 21VH/ZpkS/Ex6FxXPPxKj7kjrJcEvynM5ggyN9oZ9J7XxCwhgQKybH3xcVcF5vh3o85/
 n0GSuY3xA2ErpONoAhkoJPUHJLfU7n1YHdRSdfG/Z8iaXILfRACxb+x9EaSS2VxaZhed
 MF2FTpnsTxJjsjNv8kVcCRwBFqjthuB4cClFvPpS0CC/sMluWge7oDH/KtErV0kFityl
 1WwfDC/9s0Ok+Fo3gJFWcvcm2NCdskEPCGLUyoAWGKJ8KghLPEWgXAeo7fBlDjdoqlCt
 QjDg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrMdK9BaSQldKbUxbIbss/B6IEE1AhAWOJwTwfaVJwJGJT9giDlsBLp9sDFUemxfS+8OYpP9BZ+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj1qx3K90Jnc5IN8v+pNNFhKlPWYCBPo1VILP9OXY0rTMMu2yB
 D/p6eKvkTg75ItK/c38ZR9tATlwPnDwd91gcNyaJDlgQgd8hPGe8bOAD0/GGMiTz/Yy9P2qzFZ3
 2g9jGsJrENhwEnO1zZi50YNdh6dIwSjImdQ==
X-Gm-Gg: AfdE7cntOrZlUCIxJHw6zvTHf2QSpFY+FRrIg8Fc+hcMt25bj1DnNQIETCTLDXI9SjV
 ecgKY7hyaH/BlZ9snQ9HMcYUX4teF57iVZN2pRz+lXtOTMTeSYkKv+cxHO5PKT6IS7gp4DglFF/
 J1EtrvB827e12Z2Dv/XCHYAURWMNUnzgySMPAG8swv1vIEVo2b51Bwpo7G+FEpqyR1Vf/zXH/lD
 mzVdtNfRq2CNjZYjdczKcJvMWQU8V6Ua5GVZmREMqMmgmJCltfQlw7m6n/mftZ4H5m6IQppzEaM
 pD+KZPl68Ts8Uz8u09MCHdZoeZ6+5QRaOIK1zej4y6BB3CTVpPl2T2ylhJEr4yCwOJ15cA==
X-Received: by 2002:a17:903:2b0e:b0:2cc:e3b6:f305 with SMTP id
 d9443c01a7336-2ce9f038e25mr76823955ad.4.1783976568454; Mon, 13 Jul 2026
 14:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
 <20260713164321.3350036-5-srinivasan.shanmugam@amd.com>
 <CADnq5_NMu8eVhhrnkKVui2_cY8yn7Opr7OOqW4V2Svc=fpnhFw@mail.gmail.com>
In-Reply-To: <CADnq5_NMu8eVhhrnkKVui2_cY8yn7Opr7OOqW4V2Svc=fpnhFw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jul 2026 17:02:36 -0400
X-Gm-Features: AVVi8CcnKFg2P1-ZsyPsNvDIY1ERAgUAiX28s489qM0uHeI4mbswfcqbiqy0xU8
Message-ID: <CADnq5_O4NbGu02-+qD2LukX+K9QntboFZFi+R+_jo5GGdu5f7A@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] drm/amdgpu: Remove queue-scoped WAIT_EVENT records
 on queue teardown
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5EB674F2B5

On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Mon, Jul 13, 2026 at 1:39=E2=80=AFPM Srinivasan Shanmugam
> <srinivasan.shanmugam@amd.com> wrote:
> >
> > Pending WAIT_EVENT records for queue-scoped events store queue pointers
> > and own queue references while queued.
> >
> > Remove all WAIT_EVENT records associated with a user queue before USERQ
> > drops its queue reference during queue teardown. This mirrors the
> > EVENTFD queue cleanup path and prevents pending records from keeping
> > stale queue state after the queue is removed from USERQ ownership.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Actually this patch should be applied before the IOCTL is enabled
otherwise the previous patch will leak events.

Alex

>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h |  2 ++
> >  2 files changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_userq.c
> > index 5bf231d7a630..b3ac1e81c9ca 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> > @@ -56,6 +56,24 @@ amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *us=
erq_mgr)
> >         return &fpriv->eventfd_mgr;
> >  }
> >
> > +/*
> > + * Get the per-file wait-event manager associated with this userq mana=
ger.
> > + */
> > +struct amdgpu_wait_event_mgr *
> > +amdgpu_userq_wait_event_mgr(struct amdgpu_userq_mgr *userq_mgr)
> > +{
> > +       struct amdgpu_fpriv *fpriv;
> > +
> > +       if (WARN_ON(!userq_mgr || !userq_mgr->file))
> > +               return NULL;
> > +
> > +       fpriv =3D userq_mgr->file->driver_priv;
> > +       if (WARN_ON(!fpriv))
> > +               return NULL;
> > +
> > +       return &fpriv->wait_event_mgr;
> > +}
> > +
> >  u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
> >  {
> >         int i;
> > @@ -1040,6 +1058,7 @@ int amdgpu_userq_ioctl(struct drm_device *dev, vo=
id *data,
> >                         return -ENOENT;
> >
> >                 amdgpu_eventfd_remove_queue(&fpriv->eventfd_mgr, queue)=
;
> > +               amdgpu_wait_event_remove_queue(&fpriv->wait_event_mgr, =
queue);
> >
> >                 amdgpu_userq_put(queue);
> >                 break;
> > @@ -1426,6 +1445,8 @@ void amdgpu_userq_mgr_fini(struct amdgpu_userq_mg=
r *userq_mgr)
> >
> >                 amdgpu_eventfd_remove_queue(amdgpu_userq_eventfd_mgr(us=
erq_mgr),
> >                                             queue);
> > +               amdgpu_wait_event_remove_queue(amdgpu_userq_wait_event_=
mgr(userq_mgr),
> > +                                              queue);
> >
> >                 amdgpu_userq_put(queue);
> >         }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_userq.h
> > index 187bfd66eb13..6a53cd3208da 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> > @@ -203,4 +203,6 @@ int amdgpu_userq_input_cwsr_params_validate(
> >         struct amdgpu_cwsr_params *cwsr_params);
> >  struct amdgpu_eventfd_mgr *
> >  amdgpu_userq_eventfd_mgr(struct amdgpu_userq_mgr *userq_mgr);
> > +struct amdgpu_wait_event_mgr *
> > +amdgpu_userq_wait_event_mgr(struct amdgpu_userq_mgr *userq_mgr);
> >  #endif
> > --
> > 2.34.1
> >
