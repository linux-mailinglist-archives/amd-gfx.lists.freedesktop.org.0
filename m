Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id og8mNb7JS2obaQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 17:29:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E570A71299C
	for <lists+amd-gfx@lfdr.de>; Mon, 06 Jul 2026 17:29:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=f1NYrUQC;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE9D10E39C;
	Mon,  6 Jul 2026 15:29:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D684710E39C
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2026 15:28:58 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-3800f0907d5so525155a91.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Jul 2026 08:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783351738; cv=none;
 d=google.com; s=arc-20260327;
 b=K6Iag/Xc7wthsSBflBJtYa5aOMydrJBT2rBoBRp3LBgA9M2sKdpgSwAUlCknsEPTcJ
 xPouAQulze9pApkhWu+vZnU+Htra59DyuuCTqKopyHEPP1egb47orWpWaAIL/4noTXSX
 8/6Y2gVh4MO0Kn0OVf+0UxnnjKEcy3pg6mHWRm5fFVvQMzpaypcnGQKe2fifsCZ+lVln
 ip12LxcmVDdYG3kulMZ73fLP3YCKHCPUtxJCEbrxADgbBvFfk7VcRakMfwuz+nKguChm
 kL4BNBAErM80dd1wPGBU6p+rysaKZECxfQRarWNC+3x9WGtlueet/Z0XENu+2gGHEUuG
 lUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=w+BMGun5iU8KsZVnG860Gzx43qMrTwbb0atvfmrQlp0=;
 fh=RQP6lrvJvlg7seZproqDP8VKF+PLTh9KE2F42aSrcjE=;
 b=Y8BcMZZ/MOOT1Tw59VSIlDstGQN2Z6KJIJF3/m3j6v7cHGMmwropigP9nyoPau8uHC
 ixOCgm7fuiVmhStrP3Ll6klrkX6p64Ft8yiLsNg7z45xQR/3qpPOuXgH+Ntj4wp0ir0a
 qzRN1/KN1YUfgO2Ky8ib8iXCH5UinTGYkOljru/5Y47kgwE1jcVa9KiUJuOSzxzlxzYp
 sr8iNrm0uzVs0zoTR3Z4PT4pCeNgNBmbmARWCCg7q7SDf7MqkCEhO6pDqGaibXUrkSqq
 yOqHQwfKxYp+c50AHwLpbngON+VzTn6xnCdpbWz2lkRdxeEpwqwTucuiGqzznjqBv7M8
 BOcA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783351738; x=1783956538; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=w+BMGun5iU8KsZVnG860Gzx43qMrTwbb0atvfmrQlp0=;
 b=f1NYrUQCXqaG755ml3n9LkW/f9r3rX2K35qKBaF5vkKCTVyFBM1V43QDs9HG/EQWMe
 RBwBDktprAydL3N1+daWWqWt5+Te2jZioBEL/FNqBs3/UILmZBDlRIDCKUM+hB/AgJ1A
 MSfdeZh3Jh6h71JZi7o3vVLXxVwf6jz4PfyO2ugmLIDICfAW1Vn4irFVzoZxRNI8RRSX
 WTthUfhqBxigjRrSFcqms1Uko1dAqzZmNSt0h0WKvMDJvPmfkBZFoWGXES0h5/rhHYJL
 su0ILiZXUWZ52ch/UdILYSujbEmUKK3KrctZ0th434q2sNjHbJfHmzr3wKcn5FM95c70
 FqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783351738; x=1783956538;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=w+BMGun5iU8KsZVnG860Gzx43qMrTwbb0atvfmrQlp0=;
 b=nwzsfQ69Xb9NVPy35yRvSOTY+ezS8l3sa6QCwN3JzX4ubXCn1w02TXdschitJ+eoaK
 7YWgSVuV4wO0n13htAFAeCCajbwqUaYyjzZ76Tet7VaRC4sr1No46P6kxK1uDqBU3Nwd
 zo5IHgJNuArX2kDdUylLPHOZKYgElAJC9zw/ndpqk5hfgiEqz7JBxlPrPfWZONGqRWGr
 p6zlHDIb9+MdzTOIVGcGMHIPNKDGqDZBm9fvR6OXSnbW91aYH7r7cyUvKfOlWGP6yREj
 0GsxRCp2TvJLGVTNjO8KnLpIbQzox9gJtHRklvNMnqZNoo6MMl5cabkl1f4qnkyfz100
 /41g==
X-Gm-Message-State: AOJu0Yybwhz0TRHD891OCIkrqSMOV7/Dp01KXbnOFqMsV4rNFHO3tn46
 fEP/vZelxHB6x6oTUH7VF0qNEzD3busjl50SPeSDHHClxQ0jQ3d/9sg96UmIgfqDe/5TM8AtZn+
 ZgHUMSRYFdIf/nu3x264eNWEtZBa8Mg/2vTRi
X-Gm-Gg: AfdE7ckKx74uOo9tSafo4DHvBiplv87SPWRTvpJLBUUtO5v9Ot5s/7LjtTjZARrcKfZ
 nsHGmraZ8yerklbrBM+OQS6ZZvPmg9OoKxAsSGddvbYKolD33DaUUdThOJteDf8mcyzKtynlu93
 FCjpYVkOixiHR28aFiLWhxm395uWt+WqZVaJbMY1WDF+ogvIivPYAJk6LCBj+hYLW93QNQR9xDE
 SP7Ah1kARgJwEnLH0l23yh7SV50yWY8zJe0QUhmlrXLeYvzV3xY90MdPZ797AoUPclewB/1hinC
 NW2tWsxDcnjXdwLdlIQVoIYu516q1ama/4rY/tyH6ErXMs4aaST93aREA8Y=
X-Received: by 2002:a05:6a21:339c:b0:3bf:abbc:da62 with SMTP id
 adf61e73a8af0-3c03c423668mr7960897637.2.1783351738261; Mon, 06 Jul 2026
 08:28:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260701161721.85681-1-timur.kristof@gmail.com>
 <20260701161721.85681-12-timur.kristof@gmail.com>
 <BL3PR12MB6425244AF10CABCDF2A131D3EEF42@BL3PR12MB6425.namprd12.prod.outlook.com>
 <3281153.KVeVyVuyWN@timur-max>
In-Reply-To: <3281153.KVeVyVuyWN@timur-max>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Jul 2026 11:28:46 -0400
X-Gm-Features: AVVi8CcO5WcoQWSorG1HBadvcD7kR5pAc4T-sn0smlCU0kjIbjhXRYGWGOPGN_g
Message-ID: <CADnq5_PQ7U7RyFfgV2MPMYL8OYsx1NuwnPr9pEnXnBDwGcHg0w@mail.gmail.com>
Subject: Re: [PATCH 11/14] drm/amdgpu/ih6.0: Use MMIO ACK for retry CAM on IH
 6.0
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, 
 Natalie Vock <natalie.vock@gmx.de>, "Shetaia, Amir" <Amir.Shetaia@amd.com>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "He, Siwei" <Siwei.He@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>, 
 "Joshi, Mukul" <Mukul.Joshi@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:natalie.vock@gmx.de,m:Amir.Shetaia@amd.com,m:maraeo@gmail.com,m:Mario.Limonciello@amd.com,m:tursulin@ursulin.net,m:Felix.Kuehling@amd.com,m:Lijo.Lazar@amd.com,m:Siwei.He@amd.com,m:Philip.Yang@amd.com,m:Mukul.Joshi@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,ursulin.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E570A71299C

On Fri, Jul 3, 2026 at 2:46=E2=80=AFPM Timur Krist=C3=B3f <timur.kristof@gm=
ail.com> wrote:
>
> On 2026. j=C3=BAlius 3., p=C3=A9ntek 19:46:03 k=C3=B6z=C3=A9p-eur=C3=B3pa=
i ny=C3=A1ri id=C5=91 Joshi, Mukul
> wrote:
> > AMD General
> >
> >
> > > -----Original Message-----
> > > From: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > > Sent: Wednesday, July 1, 2026 12:17 PM
> > > To: amd-gfx@lists.freedesktop.org; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>; Koenig, Christian
> > > <Christian.Koenig@amd.com>; Natalie Vock <natalie.vock@gmx.de>; Sheta=
ia,
> > > Amir <Amir.Shetaia@amd.com>; Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>=
;
> > > Limonciello, Mario <Mario.Limonciello@amd.com>; Tvrtko Ursulin
> > > <tursulin@ursulin.net>; Kuehling, Felix <Felix.Kuehling@amd.com>; Laz=
ar,
> > > Lijo
> > <Lijo.Lazar@amd.com>; He, Siwei <Siwei.He@amd.com>; Yang, Philip
> > > <Philip.Yang@amd.com>; Joshi, Mukul <Mukul.Joshi@amd.com>
> > > Cc: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > > Subject: [PATCH 11/14] drm/amdgpu/ih6.0: Use MMIO ACK for retry CAM o=
n IH
> > > 6.0
> > >
> > >
> > >
> > > The doorbell is not working on Navi 31.
> > > Use the IH_RETRY_CAM_ACK register.
> >
>
> Hi Mukul,
>
> > I think the doorbell path is not enabled for IH CAM so that=E2=80=99s p=
robably the
> > reason its not working.
> > I think we need an update to the NBIO
> > ih_doorbell_range() function to enable the doorbell path.
>
> Can you please be more specific and elaborate on what we need to do on th=
e NBIO
> ih_doorbell_range() function? Also, can you say which NBIO version is use=
d for
> for Navi 3 and Navi 4 GPUs?

navi3 dGPUs use nbio_v4_3.c.  navi3 APUs use nbio_v7_11.c (strix) and
nbio_v7_7.c (phoenix).  navi4 uses nbif_v6_3_1.c.

Alex

>
> > Having said that, we intend to use doorbells on all ASICs to ack IH CAM=
s
> > that support retry faults.
>
> I'm OK with that, if the doorbell really works on these GPUs.
>
> Thanks & best regards,
> Timur
>
> >
> >
> > >
> > >
> > > Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > > ---
> > >
> > >  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > >
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> > > b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> > > index 65e5d21753f9..a97c85b0cb99 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
> > > @@ -307,6 +307,11 @@ static int ih_v6_0_enable_ring(struct amdgpu_dev=
ice
> > > *adev,
> > >
> > >       return 0;
> > >
> > >  }
> > >
> > >
> > >
> > > +static void ih_v6_0_retry_cam_ack(struct amdgpu_device *adev, u32
> > > +cam_index) {
> > > +     WREG32_SOC15(OSSSYS, 0, regIH_RETRY_CAM_ACK, cam_index); }
> > > +
> > >
> > >  /**
> > >
> > >   * ih_v6_0_irq_init - init and enable the interrupt ring
> > >   *
> > >
> > > @@ -807,7 +812,8 @@ static const struct amdgpu_ih_funcs ih_v6_0_funcs=
 =3D {
> > >
> > >       .get_wptr =3D ih_v6_0_get_wptr,
> > >       .decode_iv =3D amdgpu_ih_decode_iv_helper,
> > >       .decode_iv_ts =3D amdgpu_ih_decode_iv_ts_helper,
> > >
> > > -     .set_rptr =3D ih_v6_0_set_rptr
> > > +     .set_rptr =3D ih_v6_0_set_rptr,
> > > +     .retry_cam_ack =3D ih_v6_0_retry_cam_ack,
> > >
> > >  };
> > >
> > >
> > >
> > >  static void ih_v6_0_set_interrupt_funcs(struct amdgpu_device *adev)
> > >
> > > --
> > > 2.54.0
> >
> >
>
>
>
>
