Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QnaoNyr4O2qwgwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 17:30:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581416BFAA7
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jun 2026 17:30:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=plJ1iG3n;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBCA10E7B3;
	Wed, 24 Jun 2026 15:30:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E151710E7B3
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 15:30:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so14878295e9.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Jun 2026 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782315046; x=1782919846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1c+7+ScF+yUJ7fYakwqRelO0rmBKDx5VSA8OhUYj6lM=;
 b=plJ1iG3nH7XYSKURbFirkoZPKEr+ZXYPHO9iIJAl8oXM7IlZG263HbNqlph6HQ1TCg
 IEoc4R+KNaXMhYf1sGmu98T1rI5or4GGfLhxoFkp+ro7dN1hBo5Vz/fZKGWfe0rsqoRg
 ziluM/oPpCSGJwFmYiFSNVoocqFBpkSjPKP0mUU5Emd40/1JfpvEV4eeZu94zvHd49RA
 D3obKCPzw1awHzSgymJ2yUYzF+TUYomqlt/1opJptRmUsgBIGvxtqQ/CwfBXj+TAnxNz
 sakhOXDjxOIupA6AoubUQ2Z2Ji7JHY61co05ldZ4XeX53GerwrZOyfETCoU9gDo7vWkz
 fQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315046; x=1782919846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1c+7+ScF+yUJ7fYakwqRelO0rmBKDx5VSA8OhUYj6lM=;
 b=f5gRZB3xV2oH0CSnfltt9k7gWNcDgzIlpIRJIj/6d03CAO2XYP1afd7oIMKyUVXC+h
 OgWoqdm/NrL2irPXs/wGr/ZyU1+vVaz/zUVh/Blqc6DHbtLjMr6IiUl74Y4itSUaPK0t
 hCmM6OgWYbpcQ5+4WWM+47RbvmGHmEqCcqxyJ2KgsyuzAEQzHUIlHiBFQgO1rwyAoZQ3
 CpBp1lCmp5Efr+zg4lgn+9mLaeL/hMvlcEeGEPZpXeRqexbH2hBDvdnKpMsz8Tj0QSdP
 SiUjHbmnHYEUOv3iipn1Vrsk2kqjjqAmDaykMnTT4I56/bZ6lxbb9279+G6pMQh3zzHK
 lyiA==
X-Gm-Message-State: AOJu0YxPGs2VyFqHKG25ud4CJm5TCkTHeENDpH5ArGbQMDVzsAQRw83p
 IJYahA9wQx5YDn53l/wC6uco/E3ITfVIWej+P5qxMO7CdbhaN+k1zTkKeuLVDUdI
X-Gm-Gg: AfdE7clVjeVr44tssdjn1VQI8ik/Yo7H1jCAy+PFpcN8neAkZwC1iqjYKO58Nf4Bkzn
 9uL8gjI2fdhpdhmFCduJJob2q3VFxvPLf9FBn6HM7pNweGzJiMEdx9tWLhQIq92nAFx40mSZGZV
 4DdK48bZLJes6J/G8hFOkCuxK3qatPBs1WJS4M4hJWuHewQ2SiNRaBBQp2bG0sZwcpNI6L8Z8VF
 bfAckaXpX6Fh/LtsA9wroCGHalDFNn0V5uasuaq5tjSJFRJv8/yegZEnvMj/xPIPhNGgsea1WZW
 2TBOUJLD0SUVTidwjWXH2G9UfppkRnkEt38F5EjVHcLoKxW1P9poivcHQIFC+XBgbRjLWgO7Qgy
 t2rnEMGrIDzCd6/55PKz2KS7i766pOv/clKrcrvSGVrxnFe18qhGniGOxUxRoUilHFI0wx7TxdZ
 9yJDfxrPdcPGHTMbcry/VKcXhmZQ==
X-Received: by 2002:a05:600c:871b:b0:490:9588:bdae with SMTP id
 5b1f17b1804b1-4926086d9bfmr56820525e9.18.1782315045431; 
 Wed, 24 Jun 2026 08:30:45 -0700 (PDT)
Received: from timur-max.localnet ([62.77.225.138])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492640260a6sm372785e9.6.2026.06.24.08.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 08:30:44 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Amir Shetaia <Amir.Shetaia@amd.com>,
 Marek =?UTF-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Siwei He <siwei.he@amd.com>,
 Philip Yang <philip.yang@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 5/7] drm/amdgpu/gmc12.0: Use AMDGPU_PTE_IS_PTE flag for
 init_pte_flags on GFX12.0
Date: Wed, 24 Jun 2026 17:30:42 +0200
Message-ID: <2128479.Jadu78ljVU@timur-max>
In-Reply-To: <3e09e693-5494-49e7-8aaa-2338867991f5@ursulin.net>
References: <20260529103059.21470-1-timur.kristof@gmail.com>
 <20260529103059.21470-6-timur.kristof@gmail.com>
 <3e09e693-5494-49e7-8aaa-2338867991f5@ursulin.net>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,ursulin.net];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 581416BFAA7

On 2026. j=C3=BAnius 24., szerda 16:54:04 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=
=C3=A1ri id=C5=91 Tvrtko Ursulin=20
wrote:
> On 29/05/2026 11:30, Timur Krist=C3=B3f wrote:
> > According to some SVM code this flag is necessary on
> > also GFX12.0 not just GFX12.1.
> >=20
> > Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > ---
> >=20
> >   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> > b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c index
> > 586703ec0dfa0..7bbf5f848ce1b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> > @@ -641,11 +641,12 @@ static int gmc_v12_0_early_init(struct
> > amdgpu_ip_block *ip_block)>=20
> >   		adev->gmc.xgmi.connected_to_cpu =3D
> >   	=09
> >   			adev->smuio.funcs-
>is_host_gpu_xgmi_supported(adev);
> >=20
> > +	adev->gmc.init_pte_flags =3D AMDGPU_PTE_IS_PTE;
> > +
> >=20
> >   	switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> >   =09
> >   	case IP_VERSION(12, 1, 0):
> >   		gmc_v12_1_set_gmc_funcs(adev);
> >   		gmc_v12_1_set_irq_funcs(adev);
> >=20
> > -		adev->gmc.init_pte_flags =3D AMDGPU_PTE_IS_PTE;
> >=20
> >   		break;
> >   =09
> >   	default:
> >   		gmc_v12_0_set_gmc_funcs(adev);
>=20
> Code is fine but I don't have the inside knowledge to comment on the
> GFX12.0 vs GFX12.1 situation. Where is this SVM code commit message
> mentions?

Hi,

amdgpu_vm_pte_update_flags() has the following comment:

/* Workaround for fault priority problem on GMC9 and GFX12,
 * EXECUTABLE for GMC9 fault priority and init_pte_flags
 * (e.g. AMDGPU_PTE_IS_PTE on GFX12)
 */

svm_range_get_pte_flags() unconditionally uses this PTE flag on GFX12.x, ad=
ded=20
by this commit: a8a4615ba0fa3ee1248ae2184e7e848d7b644e70
which says: "This resolves the issues related to SVM enablement in GFX12."

While they don't elaborate what exactly the problem is that is being worked=
=20
around, it is pretty clear that the flag is necessary for proper fault hand=
ling=20
on GFX12.x and indeed I can confirm that it solves the problem for me. I th=
ink=20
the reason why it was missing here is because the authors just fixed the is=
sue=20
for SVM and forgot to fix it also for graphics.

Timur

>=20
> Otherwise, maybe people who added this workaround could review? Those
> two are the relevant patches AFAICT:
>=20
> commit db29ddf6505f3e831e000c95ae013b18a37f70bc
> Author: Mukul Joshi <mukul.joshi@amd.com>
> Date:   Thu Apr 24 21:51:23 2025 -0400
>=20
>      drm/amdgpu: Add per-ASIC PTE init flag
>=20
>=20
> commit 9d47b2c36b9a6c6b844c33cab407a5d7ad102234
> Author: Siwei He <siwei.he@amd.com>
> Date:   Tue Apr 14 14:46:54 2026 -0400
>=20
>      drm/amdgpu: OR init_pte_flags into invalid leaf PTE update
>=20
> I took the liberty to add some CCs.
>=20
> Regards,
>=20
> Tvrtko




