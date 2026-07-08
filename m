Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oHnRJw2QTmr3PQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 19:59:41 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85B729600
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 19:59:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jY3cSKEs;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE0710F209;
	Wed,  8 Jul 2026 17:59:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E4610F209
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 17:59:38 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2cc7a269ca1so1558475ad.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2026 10:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783533578; cv=none;
 d=google.com; s=arc-20260327;
 b=CYf4RYFzrkoiS3ErT90GVRxpY4RKeprFElu2G7/VHhmSarASIH/coPoygocgs4qJo7
 c99/Z+AlYRcdRDqBlTq/5rGK7CZPZqkwdk29m6iYIlSKkRi+ekmsfoJZW5dVRtVId9cX
 9sJOxRcAqnryvPhVjxVRhZ/JJtfeZ6BMH7ETQ8j8sWOaW59SQIBtre02ZsiniifKfOWd
 osulbhVwRRIatAsUP74Ihqct5ppGs+1bbAP8RNAm2wOEIIoQ5oXMAlbgmMDY2Of2LhTA
 n9wXyvQnRKGl85RA5Q9G/JntVO8j1yc/gd+eY4xkEBLxD9Lw4frLYmCZXEoS2Wp0kkAC
 6cRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=JKyLtq/gV81HpTQAr5LOSIkZIQbefVlqQzV7cajcbUw=;
 fh=xw/4MfAq5mkwaCWTPWK41pFCvYR79moo62GoVQ/OTMY=;
 b=FwFtSX870kIGMJwhaCF4Y6apQ4sq86Xh+rHSN0ntj31Y0pXnQujUT6cR3bjKbX3doa
 0KhiOXMYZh8zdJa/Bz7/yQShsjg/owiUV1YAAGXKCsZFw3gnkdvaxjyc1G4JP2q/ocGK
 ucF/ANOD7S4RDaSI3fOpemmO8Cuay2EIbAZ2GKWp5+MAig3SmVulbePFENi2rRZY+TWB
 IykKxOuku4LppPd3SBByg7jv9pLmt00RXfXiz273l/YdZi8BgiRSq1AxoH/emwK/5Bme
 rwnTbW1+9kQwISRyIKu8vSlzVCJknwne7+K2MmcGr8OAS9/PJnFgx7bAxCDqqx0F9kZn
 gx7Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783533578; x=1784138378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JKyLtq/gV81HpTQAr5LOSIkZIQbefVlqQzV7cajcbUw=;
 b=jY3cSKEs+8f2M6iDBpRQ60JfaKgiUC8fqt9NxLX9D0yB2O4Yhx1pKgl6hG7jnb6Raz
 KItRQiyBHF8mXbrhmAlOs0NIWZQMksykIW/dTz9VXTSH1ubyatUZURUowEVxOgB6iqKV
 qNNwlMyNI2etHn0Wiszq4+o/rq9vYFXYTlzQs9Kwk6sOyqAbkum8JO1nLfVj4stW3Sdh
 Op/LQ6Gd1yDXR0oV1Y2ZN6VsLT2dft4M29RJHAs16bpNRteEwq32kbP8pVxwhqScKG4x
 5O4er+abBGQGfQSy0xOrQZWT/ymQnpJ4Hves7zbyWE5RujNDC4yegzs2dvWlwtQ5VC2k
 5VRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783533578; x=1784138378;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JKyLtq/gV81HpTQAr5LOSIkZIQbefVlqQzV7cajcbUw=;
 b=CGBFg0smniVmybo17nS8TLXV6ns261SwUVEGZNkiZiGCmx9UnM3NCl0j/fWXRuf4sy
 Jc282QsRw3cr1NYn2DmKlmUcJzcMkx8Ag9mO18kYf0EhM5tTxjs6nsOazR0OVxfwa93m
 AsUF1jEzs63Z0qPyLgnRDl1U0ubgEk4xgeHSLhVNOS9V2FBOMFtfty3C0+3mnPbdlRQI
 55eAaSbL5980rPTlC3B5xX7ZGiQv86liQSohO2XIoAqGDK/9Ev33mcEoV/KEFfgUAmb9
 ym3pkAedzjs0YCfQydjFkFL516pAzaPcTPtfQU1lvrdLLVstoK8iHjwmJ6pADB2Gqtym
 eRbw==
X-Gm-Message-State: AOJu0YxZVJtyfSl5EdMT1ytVgUHLxUJCp4hn3olvXFQQi6OfmA41Q7re
 BD5AFbj/iN22oGIMjJXGUFhRflvj6bKK3/pNfUBZDDBoEL+XGUQruPUbOwy3SrfrL61WrVzNMId
 Bkc2EXurt61+aKjUHx/JK86WgD+E1doo=
X-Gm-Gg: AfdE7cn0uAe6NwoAM+oYqVprj259fPrSs5mAYzhpw2MGxgfopCisOq4DrjrlxlCcEGq
 RnnQ3EX46KYZbdmlI9K74eK7gvWM8JI67/+PLJNj2jTC54dLGkXML5v0OfeibU6E92s0GtWriCM
 ONgKmzCtX3jk7pDfN6gq2tLDTMhIRvuDf3JJFAMjr6S8iBJ7texVCv8fi3Dx93wkfQsO2iVB30v
 E3Fl8to++V+R9KiakQZvX5OUSg7FR00CNa55DPChlx4Hb8bcSm0oVJjWyd6AgFBHC7cAMOTLZWH
 4zaM3jHiyUNd7CM+dzA4JD7BhCrqbf4XHMOTERSkwB4seBhYgInbkTb3Bs0=
X-Received: by 2002:a17:903:2443:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2ccfebc85a5mr4307955ad.2.1783533578305; Wed, 08 Jul 2026
 10:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260708174501.179428-1-Roman.Li@amd.com>
 <CADnq5_OgAYKtoh=FMY_XQkfY0+WeRxn-oDztg-qEJNg8mFM9vA@mail.gmail.com>
In-Reply-To: <CADnq5_OgAYKtoh=FMY_XQkfY0+WeRxn-oDztg-qEJNg8mFM9vA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jul 2026 13:59:25 -0400
X-Gm-Features: AVVi8CfEaH9tuwQ6RujGo1jqMi4IdHibDgPOE2RSQR8YysKoR7AaCJnIINw8rvQ
Message-ID: <CADnq5_NZThx2CnewzbUw9K7-GzPV4Wy1SAxS3DzLk92cHToYPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/discovery: Fix device family for DCN42
To: Roman.Li@amd.com
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 Kanala.RamalingeswaraReddy@amd.com, 
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>, Praful.Swarnakar@amd.com, 
 Ivan Lipski <ivan.lipski@amd.com>, Matthew Stewart <Matthew.Stewart2@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Roman.Li@amd.com,m:alexander.deucher@amd.com,m:Kanala.RamalingeswaraReddy@amd.com,m:Pratik.Vishwakarma@amd.com,m:Praful.Swarnakar@amd.com,m:ivan.lipski@amd.com,m:Matthew.Stewart2@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4C85B729600

On Wed, Jul 8, 2026 at 1:57=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> On Wed, Jul 8, 2026 at 1:54=E2=80=AFPM <Roman.Li@amd.com> wrote:
> >
> > From: Roman Li <Roman.Li@amd.com>
> >
> > GC 11.7.0 and 11.7.1 should map to AMDGPU_FAMILY_GC_11_5_4 for DCN42.
> >
> > Signed-off-by: Roman Li <Roman.Li@amd.com>
>

Please add:
Fixes: cf591e67c095 ("drm/amdgpu: add support for GC IP version 11.7.0")
Fixes: a928d8d81ec5 ("drm/amdgpu: add support for GC IP version 11.7.1")


> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_discovery.c
> > index f33278fcc0f4..f52566e05caa 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> > @@ -3368,9 +3368,11 @@ int amdgpu_discovery_set_ip_blocks(struct amdgpu=
_device *adev)
> >         case IP_VERSION(11, 5, 3):
> >         case IP_VERSION(11, 5, 4):
> >         case IP_VERSION(11, 5, 6):
> > +               adev->family =3D AMDGPU_FAMILY_GC_11_5_0;
> > +               break;
> >         case IP_VERSION(11, 7, 0):
> >         case IP_VERSION(11, 7, 1):
> > -               adev->family =3D AMDGPU_FAMILY_GC_11_5_0;
> > +               adev->family =3D AMDGPU_FAMILY_GC_11_5_4;
> >                 break;
> >         case IP_VERSION(12, 0, 0):
> >         case IP_VERSION(12, 0, 1):
> > --
> > 2.34.1
> >
