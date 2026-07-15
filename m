Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nozkAwxeV2r8KQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 12:16:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72075CD9B
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 12:16:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dvvt7S5o;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46AA510E176;
	Wed, 15 Jul 2026 10:16:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AF910E176
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 10:16:40 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-474560436c3so1433771f8f.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 03:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784110599; x=1784715399; darn=lists.freedesktop.org;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ekLiH4NWujisXko+EZlaccF1jWzq+ulmz63PT5dzQws=;
 b=dvvt7S5ohm3XVhGdSyl+hKbxOOfU2R/TQmepEtl94TC0nF8Lcm43YPPNLNPtqQXeDj
 IwDUtfZn6SXcmhOHd2gP1gWgWiZMvxiYltQu7mp+mU20W6S9d2kP4LIcZ+l+/6sNq9wT
 uXQJXdlhk3hf48SvAw7nHLwu0uQsDRpX/HFTPA+cec4iq8Ley0SUwQj/E8s38XjsL667
 pp9giFtiSGGA0Khc70z6KBZAtbhRENN5Yso3N345bnxkG4Hnxohkg5/3TfgsFzzmPV5w
 7J+ApiKk6CY2WncpYudw9DEdD42TEW4QWY8Dq4qlX8zslybTaiEH7N6WyUO46TAX10qE
 jdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784110599; x=1784715399;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ekLiH4NWujisXko+EZlaccF1jWzq+ulmz63PT5dzQws=;
 b=Rr3EdaQsSj4qnAx0zfXjvIQ2wb6k4XlstzIyETtDzgxPnxoLpqPVa4fxDubOnOpaCL
 yLuCX8OvHJGdvbUTvHmuyDvYNG9Be3qGVgHr7PZvBR3lgbSjX6aENaetivhdAI5sjMQf
 9A/rBAX6npN6mS+mJAdrmzsMzzuy1tEnBBYBNSFQ3xyWQYoO/TL6mm9uiDvXzvjqycj8
 efHg2i8/gFxGb300m9cP3yA8FXjSm3wcPopagXvYwWciS/jbU6eTh8XIEwQP06kxoro2
 KbYxbeV6e1fsUrn/KgjFEHePNX4ihfig/EDENdaDXt4quOWNEZ0a4nGITDZZJNIwtEEr
 wfGA==
X-Gm-Message-State: AOJu0Yw2SONt+AVmaMWQdzYGfTrUgMDHh8MupHy55yLroRD78rG2NGKw
 0JpwKykI1K4HzYAHjwTnr1CLkB4CsEbjnq4YA+THcl7CAl1OjMyrpGjQUl4djA==
X-Gm-Gg: AfdE7ckEPiLCyd1cCFdGzpWQPLxFkogRlGYEM+iGFlEDwdYHwINd1ZmjCXSRfHWldx7
 wWJiAIAv4oxZsgY/eR5zxGnAMbDJJBgYh4tbJIZz0LGEoXVQ35IcQK6Z88noWnMRKDmT9vKGoPT
 TdhRPsALreMdo5q8tImLULpbDwEcuupXZsy+5E0HPjQZpXXkK35qkPmjBYC+F6kGnSexX/7eIQm
 Ie1rO6pxA7wXn9Uzrn9N1ljPCX+iHoAEVCa+9KlYMoGONoPiwBZiMRJcphuz5x7WZGIQCPipC8W
 M/pmvGMcXEm/I2PozR6/Hc6nT9HWmI+fmbDk5H7IKFe+h1p8tgF7SQ7Gcv6AsgixlB6Nh+TGx/U
 uaU7BAOuPfZ4NzRSrWYIA8uhLrusXl14xxMWr4oREHYgPN3f0fjRsAglXEdgKIMq71LObzkn0fL
 AwsYMEvh7Gzm02I2thS3jmByNYLvU7JhPYPOxdAhPARBKUpmWCGVrD9iEMc/4/CQaojS/s2h4t/
 UJPsDCtAArFAWt/BA4=
X-Received: by 2002:a05:6000:2f85:b0:47f:53cc:3a1d with SMTP id
 ffacd0b85a97d-47f53cc3fa6mr191486f8f.35.1784110598450; 
 Wed, 15 Jul 2026 03:16:38 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24CD7200F6BBA872344E1A32.dsl.pool.telekom.hu.
 [2001:4c4e:24cd:7200:f6bb:a872:344e:1a32])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464b7e22sm14773371f8f.25.2026.07.15.03.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2026 03:16:37 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, pierre-eric.pelloux-prayer@amd.com,
 Natalie Vock <natalie.vock@gmx.de>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 6/9] drm/amdgpu/gfx7: Clean up gfx ring during reset
Date: Wed, 15 Jul 2026 12:16:36 +0200
Message-ID: <20288812.fSG56mABFh@timur-max>
In-Reply-To: <d6e5a13d-bb65-4633-8c0e-8b89f292bc3f@ursulin.net>
References: <20260713125838.30607-1-timur.kristof@gmail.com>
 <20260713125838.30607-7-timur.kristof@gmail.com>
 <d6e5a13d-bb65-4633-8c0e-8b89f292bc3f@ursulin.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C72075CD9B

On 2026. j=C3=BAlius 15., szerda 11:18:19 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=
=C3=A1ri id=C5=91 Tvrtko Ursulin=20
wrote:
> On 13/07/2026 13:58, Timur Krist=C3=B3f wrote:
> > Clear the WPTR and RPTR at ring initialization.
> > Additionally clear the ring contents during reset.
>=20
> Please add the why part to your commit messages. ;)

After a reset, the ring contents could be "dirty" and thus need to be clear=
ed=20
to prevent the command processor from executing packets left over in the ri=
ng=20
from before the reset. I think this is obvious, but I'm happy to add some t=
ext=20
to the commit message to explain it more.

>=20
> Cover letter mentions the series is reworking to match gfx7 to gfx8 but
> I looked in drm-tip and amd-staging-drm-next and
> gfx_v8_0_cp_gfx_resume() does not yet have these changes.

The GFX8 code does have this:

=46or graphics queues:
In gfx_v8_0_cp_gfx_resume() it also sets wptr =3D 0; and calls=20
amdgpu_ring_clear_ring() unconditionally. This is actually not needed durin=
g=20
first initialization because the amdgpu_ring_init() called from=20
gfx_v8_0_sw_init() already clears the ring, which is why I call the clear=20
conditionally on GFX6-7. I could of course change the GFX6-7 code to also c=
all=20
it unconditionally though for the sake of simplicity and consistency.
(It is missing the atomic things though. I think it should have that too.)

=46or compute queues:
In gfx_v8_0_kcq_init_queue() it clears the wptr, also the wptr_cpu_addr and=
=20
also calls amdgpu_ring_clear_ring().


>=20
> > Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > ---
> >=20
> >   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c index a93cc02c3400..915612628f9a
> > 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > @@ -2546,8 +2546,14 @@ static int gfx_v7_0_cp_gfx_resume(struct
> > amdgpu_device *adev)>=20
> >   	WREG32(mmSCRATCH_ADDR, 0);
> >   =09
> >   	/* ring 0 - compute and gfx */
> >=20
> > -	/* Set ring buffer size */
> >=20
> >   	ring =3D &adev->gfx.gfx_ring[0];
> >=20
> > +	atomic64_set((atomic64_t *)ring->wptr_cpu_addr, 0);
> > +	atomic64_set((atomic64_t *)ring->rptr_cpu_addr, 0);
>=20
> One day we need to fix this whole atomic64 situation.

What is the situation that needs to be fixed?


>=20
> > +
> > +	if (amdgpu_in_reset(adev))
> > +		amdgpu_ring_clear_ring(ring);
> > +
> > +	/* Set ring buffer size */
> >=20
> >   	rb_bufsz =3D order_base_2(ring->ring_size / 8);
> >   	tmp =3D (order_base_2(AMDGPU_GPU_PAGE_SIZE/8) << 8) | rb_bufsz;
> >  =20
> >   #ifdef __BIG_ENDIAN
> >=20
> > @@ -2559,6 +2565,7 @@ static int gfx_v7_0_cp_gfx_resume(struct
> > amdgpu_device *adev)>=20
> >   	WREG32(mmCP_RB0_CNTL, tmp | CP_RB0_CNTL__RB_RPTR_WR_ENA_MASK);
> >   	ring->wptr =3D 0;
> >   	WREG32(mmCP_RB0_WPTR, lower_32_bits(ring->wptr));
> >=20
> > +	WREG32(mmCP_RB0_RPTR, lower_32_bits(ring->wptr));
> >=20
> >   	/* set the wb address whether it's enabled or not */
> >   	rptr_addr =3D ring->rptr_gpu_addr;




