Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EJirMb4XTWrsuwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:14:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984A71D1EA
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 17:14:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RAWIzn47;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9786210EDF4;
	Tue,  7 Jul 2026 15:14:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA0210EDF4
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jul 2026 15:14:03 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493c00f74baso27377065e9.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jul 2026 08:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783437242; x=1784042042; darn=lists.freedesktop.org;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rhVMrgKTFk4c9PTbvHUH603Sj5ntvj17NQl+4agRfKw=;
 b=RAWIzn47tW7MIpi17/mq4P0GLt212I02G3t4y9ivL9eYwK6XGOMqt7o5siZQThy4Mn
 aBp+xBCtYfHO4UC0yJ9neoTVOsxYzv22NVn212M8Fsvsv2HXU0KigEuan8uAcQ2u8z+n
 VXnMywB4bMfuzH08V3wWTRi8EhDJe015/MT+P97TxgWPffFsZuKhtQRRhmdfp5kVaB9y
 3mqqMNH2/3bnVPn+QsHTgBEREI3wVrOQgYR1x+tqUf8SpiyHglU4LDh4k7seZQv+jZmY
 J7QNZvXaM/V1WNIFHlYf1WLquJ0oGdVrAfDogu3crns4RWjTWHlWTU6y+5YbCek13T/9
 rSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783437242; x=1784042042;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=rhVMrgKTFk4c9PTbvHUH603Sj5ntvj17NQl+4agRfKw=;
 b=UZnAHsa+T0iiDBxlLbfjopWfjlUCgpYGGTjb1+sHa/gk75GRgJ7PvpTBsI2+qWKGHr
 O3WxidI1YSMEiBk8ow0vTdom2bZRvPyKdaDvW2Jnh1MQGeEsfnXe7pc5TJL+t4EmID8k
 ZvUx2h5hIdLsVNKt/tkdiDFc6AzqpSlhYO3Fu3qFFGadJbxrXLZY3izYAMeApgZ55cjM
 iug82QGR8c/JCTQEyLsDmAXW1Gay5rwaSIj5a/19IVuaHbhNOtrHOFE/3ij/CC0EJu57
 xJdKTmk4qRtrsc7rIRk+I+yIfZYNZoAOc+SfyNSAyNpNR+Sr8FZR0uGF1+yxV03gQpcr
 ONWA==
X-Gm-Message-State: AOJu0YwwdLCGJ71haJDWWIhrozaZriZDOIHzHRbVAgNi2kJmChr+4hav
 KzVI14Hd5iLr693PQoPSehH4SnXlHOxdHX8VMy/zNnZAhmIekj3EK2wn
X-Gm-Gg: AfdE7cn0rY/fXZYjvUphyrRjV6t1I83OrkfoOc1WVmmHa/ipmRGzpdkb32xxcPijxpF
 QS1pQVcVYTtQq0pF/eyv5sG+EDM8K/iZLILEEZyHOrd6gbfIF4zHv07w5jaYZ8ZCqeQ/KR1RQ7p
 TsES2wuH2ZAbdY3Z1s33HAkdw649eFzaKoc7vJBOHhYr84Vt2ucmGoFuv+9SXVymFZdmI9a1jeI
 PdvUj5sTm63bneV0WKKO04KyCOeS2uZ0AQXIPsgYCSvSbk/4Po1wmCWuiOjC159pP8hFmFtYnvw
 J9VU52TJC86irY5JlQParDpZI3N5cnJFtzofUhcwxbS2TbZ6l5TwLKkWi8JWSMh3VJSpqqxL5VF
 tOYnkKQoMaFUiAO10b+PYw+OouzIaNPWanHpZN19pRJrkQeABp/0+gDEtPZAdH27W77UwxTfw2W
 PJyEF+MqC0jLvdxYg5UskpFJFbBFcvkaQIfLMwk363GiMg5HXoj8bpnm9qAERG
X-Received: by 2002:a05:600c:3f0b:b0:492:437a:a653 with SMTP id
 5b1f17b1804b1-493e1ff0070mr38795985e9.26.1783437241825; 
 Tue, 07 Jul 2026 08:14:01 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B9F4A.dsl.pool.telekom.hu.
 [94.27.159.74]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039ad21sm34038875f8f.20.2026.07.07.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 08:14:01 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/4] drm/gfx10: Program DB_RING_CONTROL
Date: Tue, 07 Jul 2026 17:14:00 +0200
Message-ID: <4904707.vXUDI8C0e8@timur-hyperion>
In-Reply-To: <CADnq5_O-Ho6fq+8P=1jg3t0vRwSY1tCY_=erxgetKXUiA-Ma7g@mail.gmail.com>
References: <20260626204101.31172-1-alexander.deucher@amd.com>
 <14526594.2vocr9iq0E@timur-max>
 <CADnq5_O-Ho6fq+8P=1jg3t0vRwSY1tCY_=erxgetKXUiA-Ma7g@mail.gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexdeucher@gmail.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[timur-hyperion:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1984A71D1EA

On Tuesday, July 7, 2026 3:44:28=E2=80=AFPM Central European Summer Time Al=
ex Deucher=20
wrote:
> On Tue, Jul 7, 2026 at 4:06=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@=
gmail.com>=20
wrote:
> > On 2026. j=C3=BAnius 26., p=C3=A9ntek 22:40:58 k=C3=B6z=C3=A9p-eur=C3=
=B3pai ny=C3=A1ri id=C5=91 Alex Deucher
> >=20
> > wrote:
> > > This is needed to allocate occlusion counters across
> > > both gfx pipes.
> > >=20
> > > Fixes: b7a1a0ef12b8 ("drm/amd/amdgpu: add pipe1 hardware support")
> > > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c index
> > > d72ecf5dab09e..6ff7a8a700939
> > > 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > > @@ -5352,6 +5352,9 @@ static void gfx_v10_0_constants_init(struct
> > > amdgpu_device *adev) gfx_v10_0_get_tcc_info(adev);
> > >=20
> > >       adev->gfx.config.pa_sc_tile_steering_override =3D
> > >      =20
> > >               gfx_v10_0_init_pa_sc_tile_steering_override(adev);
> > >=20
> > > +     /* program DB_RING_CONTROL for multiple GFX pipes */
> > > +     WREG32_FIELD15(GC, 0, DB_RING_CONTROL, COUNTER_CONTROL,
> > > +                    (adev->gfx.me.num_pipe_per_me > 1) ? 0 : 1);
> >=20
> > Hi Alex,
> >=20
> > Why do you set this to zero when the number of pipes is more than 1?
> > Wouldn't it need to be the other way around and set to the number of pi=
pes
> > (or number of rings)?
>=20
> The hardware default is 1.  The other settings are as follows for this
> field: 0 - split occlusion counters between gfx pipes
> 1 - all occlusion counters to pipe 0
> 2 - all occlusion counters to pipe 1
>=20

I see, thanks!

Could you please mention that in a comment or maybe add an enum for the=20
possible values of that field?

With that, the series is:
Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>


> >=20
> > >       /* XXX SH_MEM regs */
> > >       /* where to put LDS, scratch, GPUVM in FSA64 space */




