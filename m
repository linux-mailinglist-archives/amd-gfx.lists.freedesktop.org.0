Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6k5PMWpLI2q1oAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 06 Jun 2026 00:19:22 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7264B9B2
	for <lists+amd-gfx@lfdr.de>; Sat, 06 Jun 2026 00:19:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XXrDpLxm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEB511AB8B;
	Fri,  5 Jun 2026 22:19:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com
 [74.125.82.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9DD11AB8B
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 22:19:20 +0000 (UTC)
Received: by mail-dy1-f177.google.com with SMTP id
 5a478bee46e88-3042a99f0ceso280528eec.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jun 2026 15:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780697960; cv=none;
 d=google.com; s=arc-20240605;
 b=Ws3xW5Jr3EkfpJXWTrN4XOyBFykH+7RUICeHDtk0zJ94rXey3843gsWexJiiPGE7At
 TL7fSV8w0d1r/5tlqcjtYG4dmNimEJMDy95nNIDysgzDwt/i0nLnYa8Aexa/bgpgXStG
 KkloqpogiHf5PkGfxgxy8SkXAOSeBtCXnPfOIQNcTRtw5X0otSyNenfqLbhJ6484/MxF
 BCP0kWQ7XFxZ/hwUGEojllNZsloTZ5Ywbqz2Kk4yZW7qtXRWAz1Nkvo0Ghbo57f2Wjl/
 K1XCz/SH2FhMl/ateYYViRrHQkwYp2SrsyP0bgtOLaeWrM5yO8GTZ6K/pdWB1B6f3iDg
 N7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fF7tmMZdtlx2RMhQ8SYpuBdYYm9DQbjbP/TcuhfaQrY=;
 fh=BkO+K4n8EYEBqKg6owXrzV0n+G9SahvjasSPRK+cwck=;
 b=UJWUVCAk/5wlH68/malfdUuQfdB0unyMP/XW9GwSARIJqjeuzBh9nLZQft4w+hBAC0
 PAef22l5aK9RMKefthjxD0grAYnhJQhjqAUlngnxq7+jFc2/hWq0Uem2S5WOqzt9N6bv
 4FG33BVUbkM0XZLrH+sTKofWmbTz9OmCPYKatkTC2rnTgHEhm7XnEoH9PBED3sfDvVyO
 ZxlDxkKO8ZU9MgxDVGv6e1moiI/V/fPnJvdA49K8WWwjjxLZqlBTyj0C10qjOh7YWamf
 YZm1iA85mGgyzeC0IP4NRm+lSHncFHjdgE3wyEntmRjK+9CfVUI7vVmDafF8lzB9tOUH
 qX8w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780697960; x=1781302760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fF7tmMZdtlx2RMhQ8SYpuBdYYm9DQbjbP/TcuhfaQrY=;
 b=XXrDpLxmZZwC7ZnkqzYHX6ZlBR9vHeU762h2pqDLuE7JKcpl2IjFtyPd9DFQBs/t/m
 EptcHEEWQmGBtW3AETvEPds+5N7GZDoR2QHyjBjjEvxeeVEWY/PJcR45T84Fgl6zKbXP
 uImM/nXWcmRIFyEOsR104fDVQoTxeM6ZhC7T1NzV3Ou6jhuBoUNBnYbaF6vXOQrLkSmY
 dys2oXwUFCgYyDM2YuqlyK5DwHyx6EaSRx1DFpiV1l5CBh8Ph0+7gkhN3/mdS0b5R7p8
 imUHkx+R98e98cMlxJ30Z1Fcf8Tzk97sHlIVWueuupDPb1OkxZyRkGzWwQUw3pUXn+SU
 0wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780697960; x=1781302760;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fF7tmMZdtlx2RMhQ8SYpuBdYYm9DQbjbP/TcuhfaQrY=;
 b=UifePHXOxjn5jmUn9gijhO23DPlGFtv7iwQo1Z2ohmwXtGbFT8vk4PFhAI1x/gZAp2
 mmeyKpt6jtwUVRE0T7Hlt+ruuA8FaLXqR/UL6sweD4LiHJNh/hvgTxOuwrA9tMsa/f4J
 Hu+Bpc3jqIR0k45JmtBcFwM/zF/CE6zAAHlYCQchfLS3RtePl1wgrH8EYfC4vbouB485
 eixAHHXe66g690SVvoGhugA/pErnB+uS08cbM/Iok7/i/MH0/BELzYrBPEVXspcJG2tC
 UZ6RrDMu2g1Wtpsla3rRfkzXP3awu6cgO7BBg5S8RkuIN6LVS1BZWdRqMWGx163zM+cn
 Nf4Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cHU4wGrH+ex0rLILgP7Fpphnp/r2MupTAFi5KXlksx4wJokxOsc4XXvP9F8Sfapim4ik6JrvN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH8NSzgG5TXbGxlEqMHS6/GWu4BTDxbMu1zVeq31tT6AW3kicH
 EaCB+X0k/rLPLF3YsiSrYpVc/Y7T8F1FAyPH9UtqbHMU492TwOOiLpwRXOegn7OGUic08re30L7
 zigUlBFB8voV9qW4yGh3osfh9WLD9QT4=
X-Gm-Gg: Acq92OH/HI5JgjDTYV44Ab8k+nIiXLzgNlZcKJfbE7uRgDqGcup3c1iU4c7xAJNcjaS
 XSnT4zRyObsHXpnGUYX9AV0/cuipY9uisI3tEGGw7lC+rWY3fiuW5DMVVIEke3y0Y7axqlZakkw
 SQUaUOYsf2SpHmt8A57DfWSH8Zli2rWHw44fOJO/K/FJR5ATfgkxT6jLa98mF0/roe8jGXKGttP
 Ru2AFLpM66zjlsyb3iENo1fhGa+sDqHnDftl6b/8Yh23Z1uuLcOSarjI+Y03qdMtMSPhzISNSLJ
 Snhsk1zKCrkOOU3O0y/LTn+8UM0n6DExB0qnROTWO9Ov0qmPixL7EzRTNdNYT7EoqHy1yLWlQCp
 id1Vc
X-Received: by 2002:a05:7022:423:b0:137:fdce:fec2 with SMTP id
 a92af1059eb24-138067f0b96mr1123950c88.4.1780697959490; Fri, 05 Jun 2026
 15:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260603194535.2371150-1-alexander.deucher@amd.com>
 <9cc1c11a-ffbd-4b33-9608-111ba12bed1d@amd.com> <5051245.OV4Wx5bFTl@timur-max>
In-Reply-To: <5051245.OV4Wx5bFTl@timur-max>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jun 2026 18:19:08 -0400
X-Gm-Features: AVHnY4IftsJoT3NRlzni5QsXSP4BuQjPKI-TbZ5lj1MBZ9M14acKqWn-A9-vnwk
Message-ID: <CADnq5_O=tWh9=CCqW0xw=x32O5i0_vDwASh++hyb+VYMQ3dbpg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: always emit the job vm fence
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25C7264B9B2

On Fri, Jun 5, 2026 at 6:11=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@gm=
ail.com> wrote:
>
> On 2026. j=C3=BAnius 5., p=C3=A9ntek 11:24:45 k=C3=B6z=C3=A9p-eur=C3=B3pa=
i ny=C3=A1ri id=C5=91 Christian K=C3=B6nig
> wrote:
> > On 6/3/26 21:45, Alex Deucher wrote:
> > > We need the fence to reemit the gds switch or spm update
> > > after a queue reset.
> > >
> > > Fixes: a17ef941212b ("drm/amdgpu: rework ring reset backup and reemit=
 v9")
> > > Cc: timur.kristof@gmail.com
> > > Cc: christian.koenig@amd.com
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > That was avoided because it means another entry in the EOP ring buffer =
which
> > can be bad for performance.
> >
> > But correctness is obviously more important, just to keep in mind when =
we
> > suddenly see 1% fps decrease and don't know where it's coming from.
> >
> > Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Thanks Christian, that's a valid point.
> Do you think we should worry about an actual perf impact here?
>
> If we want to avoid adding an extra fence, then an alternative solution c=
ould
> be to include the emitted commands in the ib_wptr of the job's own fence =
when
> a VM fence was not emitted.
>
> What do you guys think?

@Christian Koenig Is there a reason we need to emit gds and spm before
the vm fence if the vm fence is required?  I've sent out a series to
retain that behavior, but if it doesn't matter, we could simplify
things more and move gds and spm into the ib fence.

Alex

>
> Thanks,
> Timur
>
> >
> > > ---
> > >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c index
> > > 2f3470208829e..7e0e2281719b1 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > > @@ -853,12 +853,10 @@ void amdgpu_vm_flush(struct amdgpu_ring *ring,
> > > struct amdgpu_job *job,>
> > >                                         job->oa_size);
> > >
> > >     }
> > >
> > > -   if (vm_flush_needed || pasid_mapping_needed ||
> cleaner_shader_needed) {
> > > -           amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
> > > -           fence =3D &job->hw_vm_fence->base;
> > > -           /* get a ref for the job */
> > > -           dma_fence_get(fence);
> > > -   }
> > > +   amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
> > > +   fence =3D &job->hw_vm_fence->base;
> > > +   /* get a ref for the job */
> > > +   dma_fence_get(fence);
> > >
> > >     if (vm_flush_needed) {
> > >
> > >             mutex_lock(&id_mgr->lock);
>
>
>
>
