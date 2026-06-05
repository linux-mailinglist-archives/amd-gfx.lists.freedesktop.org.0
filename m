Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bjCwAHotI2r3jgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 22:11:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0064B1CB
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 22:11:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ocmDURUA;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83C311AAF1;
	Fri,  5 Jun 2026 20:11:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78C811AAF1
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 20:11:33 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-304f9bc869aso300387eec.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jun 2026 13:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780690293; cv=none;
 d=google.com; s=arc-20240605;
 b=Ncotk3w/NN83HlahSW6jPhzdKtb5WAhL6IpMLizBM2Yb/Fmgptiawlec9f1ZY3gSjW
 LTzyFqZ13+/mzWNBzR+KugDYizjGhImoJWS9HvzEdJF2FlpM94ZIFLccimgMr9SOxYBC
 nclaZ24uOHgyeJ7RNLdjM59dCuzCCCLXrD++i/+EBDsd2Wg2wSYiUix9r2RSdg4W9e/1
 Me1G3UrY1TRTuO3iq8W5qRdVZLf4HwLZxsVuxk2ruLnsuhrS7Thj/qWIKiMxg9YRF9rb
 hHs4Gl5W6Gxyo0UFVKekP681IG/TZf4XWTBQppOvafLxCFO50ucvHusBGt/JbYNo6wKM
 G9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QVOSb14WmMbULGVXqsMZDEvDWGuu5C/GCHGkbw3kEpU=;
 fh=pVXkSRI4iWxMX2nwzh6GHNF3uSMfA8RBUzqfkxIWt8U=;
 b=BmWFNpoKvPu4cA14m2SjhPJkr4nkz2RnWdDXlmZGvV+lTUOEfa28Ug7X3Bot5oagSi
 /QvY23la9LpxOr+y26QHXPtw8Wyqt0EqC7Vb+ZkPA5WdzRmnGOrKWN4maVNH257wQiMD
 dXT9kK8sbsq4cfIUvWdTWEl1s3/YfvfDlKyiXzAYRdocNwVzxn4S/4u92c7aAlQOdFPS
 FIb/S7ern82qTzSFasCvnIe9J2GXpiDEWl0+gsnR1B0YnjeiJmJDmoPubHr15uduE5H7
 gm914bDrLMzuU3CaaaqZ9sVsqfNIHVdnBcxJmlaLb/lOdKa2LcdDMQuEEUBo8dlYj2FW
 HBYw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780690293; x=1781295093; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVOSb14WmMbULGVXqsMZDEvDWGuu5C/GCHGkbw3kEpU=;
 b=ocmDURUAkr9ol/KkF14HTTO7kL3Zcr33AivDjLpxt4FCnoD/sIRVjStaVOhJhk29S2
 twyCUVWis5YRM6AP0xXsj0Tet9E5ilpCx+gF3Dcd32S3xjiktdAuagTEWS5bhr9/qr9k
 Zrgk8CN3/b/oVMWOD6qn8kaKE3xxtlK0Jo9VOXzmK38WdFqR7tON5RujauNPYuZDeUNN
 aY7Szl4/XtmMTIHuK31Ft8FeUYOczP0sxjJ6JXKDTY+Kx8P89JmRYucg4tzoIsCWTwZ7
 ECDN8UpGXhWRTJG60+rxUO7QOTUqcnwL8FFACir9zNmw0WGXJezrEsQuaP2yt3iOxsqB
 xk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780690293; x=1781295093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QVOSb14WmMbULGVXqsMZDEvDWGuu5C/GCHGkbw3kEpU=;
 b=NucuFkEfNsza0NHKRRf5JGj/YMNQw6W1+8z+H4YPVrfiivNAJrX5SVfmfvv7pe6Y0e
 RXw301mfsAmU5b7FSODV7h7ezDVruJMcHf5919NpFOF6e+JwCuIYRuWU0ByHm4bIMHoJ
 Z6sPqR9fn+gfd8zZ3P55eIfvTJ267IZn8f0J06Ecc+PsGcJSIumvzYWwTNZiedAaSXj8
 qdUa8wgPUdYLIn0lTzRCxDHDoL+BFWSbujq8o/xgvKul8HdreCLU83Rhx15arcZUM1eW
 2CeOpejQ8gWwFXtZ0QlGAGhG2MSYJFFzw/Hv8pvuXXvPPcNPHuCGyE0z9lHUVCvnmlkj
 FfPw==
X-Gm-Message-State: AOJu0Yy5LSqjYQbBrHoYR6BMGC8jgSFcBZIlblgrvbKfO4GTzl/5eh4l
 dqTXjEbModN3q8REEqxkp2IaotT8N7bXiT/eog7FyR8yejecxsKCRhUdcj/vefYsNYYHO2GL7Pt
 eUEy3hfuJb++1DjjSPvS/gVqMUAEjmmk=
X-Gm-Gg: Acq92OEGZSrOe28GWvz8cMZEqwZuEQVJpnpzFQzdKtNi07t7aCN1zIkllMwaBW7rbp6
 bTNP6lD3qmosr6UbuJ2tCJ1AgC+bFdduZaGF/6EOGpY/aFQfOTTygqdloh4Pdj/GlF4N+PyiSCR
 7L0l/rDbR7KyKsC1aQIRMscX2v/74ycK5gzSoUOPTrjDXbie/aDLW8FOC5qDpZmVVETCjTZQBPA
 VTrFXnKgzOdMvyzmtWIGserrBS+eHGBQt/lWFx0O8s9aLGt1pMqBrxsD05Y3IjUBjC5CP0MpE1y
 H30/cK+RCIHZl8rMboA+q3q6RjMlJjp6KMwR8d/Z02bE6k3UnFBx6ROmDPO2LY8ceo2a2+Lgu99
 2+nrC
X-Received: by 2002:a05:7022:ec3:b0:12c:900b:9dee with SMTP id
 a92af1059eb24-138067716f7mr902406c88.1.1780690292922; Fri, 05 Jun 2026
 13:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260605103144.2537331-1-Jesse.Zhang@amd.com>
 <20260605103144.2537331-5-Jesse.Zhang@amd.com>
In-Reply-To: <20260605103144.2537331-5-Jesse.Zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jun 2026 16:11:21 -0400
X-Gm-Features: AVHnY4KSUvE_axODy6SSJUwe0AHlQCR8x_9BfYiJ43HFWZSjCowPTuwGS9Ab6Kw
Message-ID: <CADnq5_M394vxy35oLW=kSspQcvxhuu-tBXAnFBUNZJAy5koESQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/amdgpu/gfx11: try KQ ring_id match before
 user-queue lookup
To: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, 
 Christian Koenig <christian.koenig@amd.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Jesse.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52E0064B1CB

On Fri, Jun 5, 2026 at 6:39=E2=80=AFAM Jesse Zhang <Jesse.Zhang@amd.com> wr=
ote:
>
> KCQ and user queues never share a HW slot, so a KQ ring_id hit is
> authoritative. Match KQ first; only call into the userq path when
> no KQ owns the faulting slot.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v11_0.c
> index 27d0a3dbfce8..1f159c9333a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -6688,10 +6688,12 @@ static void gfx_v11_0_handle_priv_fault(struct am=
dgpu_device *adev,
>          */
>         u32 doorbell_offset =3D entry->src_data[0] & 0x3ff;
>
> -       if (adev->enable_mes && doorbell_offset) {
> -               amdgpu_userq_process_reset_irq(adev, entry->pasid,
> -                                              doorbell_offset);
> -       } else if (!adev->gfx.disable_kq) {
> +       /*
> +        * Try KQ first by ring_id (HW slot is authoritative). The MES <-=
>
> +        * KMD compute_hqd_mask contract guarantees KCQ and user queues
> +        * never share a HW slot.
> +        */
> +       if (!adev->gfx.disable_kq) {
>                 u8 me_id =3D (entry->ring_id & 0x0c) >> 2;
>                 u8 pipe_id =3D (entry->ring_id & 0x03) >> 0;
>                 u8 queue_id =3D (entry->ring_id & 0x70) >> 4;
> @@ -6703,8 +6705,10 @@ static void gfx_v11_0_handle_priv_fault(struct amd=
gpu_device *adev,
>                         for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
>                                 ring =3D &adev->gfx.gfx_ring[i];
>                                 if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> +                                   ring->queue =3D=3D queue_id) {
>                                         drm_sched_fault(&ring->sched);
> +                                       return;
> +                               }
>                         }
>                         break;
>                 case 1:
> @@ -6712,8 +6716,10 @@ static void gfx_v11_0_handle_priv_fault(struct amd=
gpu_device *adev,
>                         for (i =3D 0; i < adev->gfx.num_compute_rings; i+=
+) {
>                                 ring =3D &adev->gfx.compute_ring[i];
>                                 if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> +                                   ring->queue =3D=3D queue_id) {
>                                         drm_sched_fault(&ring->sched);
> +                                       return;
> +                               }
>                         }
>                         break;
>                 default:
> @@ -6721,6 +6727,11 @@ static void gfx_v11_0_handle_priv_fault(struct amd=
gpu_device *adev,
>                         break;
>                 }
>         }
> +
> +       /* No KQ matched: HW slot is a MES-scheduled user queue. */
> +       if (adev->enable_mes && doorbell_offset)
> +               amdgpu_userq_process_reset_irq(adev, entry->pasid,
> +                                              doorbell_offset);

While you are at it, can you check if gfx_v11_0_eop_irq() and
gfx_v12_0_eop_irq() have similar issues?  Maybe those should be
reworked similarly.

Alex

>  }
>
>  static int gfx_v11_0_priv_reg_irq(struct amdgpu_device *adev,
> --
> 2.49.0
>
