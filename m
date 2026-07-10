Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SNeTJV/yUGqi8wIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:23:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FCA73B346
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:23:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QZOGXUMS;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FEF10E1B2;
	Fri, 10 Jul 2026 13:23:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E110E1B2
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 13:23:40 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-384422b05b5so162449a91.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783689820; cv=none;
 d=google.com; s=arc-20260327;
 b=Z3XDXc8vKSZosCSSaVemtBhIIkANTiTHdO3P+7yUyRMLWyFYXl+KWKQIt/XG/evdO3
 dO/9W6bwVJwKMyB5pc4PtoY/nwWeNkyMVl6g5M7DRHJTyeScbA4VmXG2mBRiedtr8q3y
 N4UzFHxK6yGo5IEkTw4IEvmI4B5/Yq231O03OGrCv8W5yMeLGIqbqOPFMQUlPagPwFE7
 Ekq5nsxG5Ygn3R9qyKuD2/aw8K0s7lEe9QM1yM2yzugp9jAVZQJzAfwngWC+zTZLfy5v
 rDH0Hfr+nLS39LLhIEW3YIYKZx7HEI8f8W+2ch1DyfDsZ+bu2sL7uzRxjX1j5bcaBZTE
 ByGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=A+55NFv/oNTAVwlYXY4Qavuiv1ZmlNGS6X9JQC9FXiU=;
 fh=fcjLEDkedOfH7GYcHXDTuF89F5JA6c1ampYU644HToA=;
 b=jf2e3WVBH5trvvFaCimMjlK0YQvfyKqSN56BVoJG9Ly6LvRxlQl7w1OEVAQEX7aKqt
 65F1zdAD4knInbIUj1BqsUO8YpQJO+DTBPHrqQATY4QwBeZAU8rPkXQnK6UixTg0UY7r
 R1Eyr3r7TnlT8eb0sVWYxxC1hma0o3A1Vpy0FEyKWATez3/ITyEkyCQc/PS6XcaAvAAH
 9ClYczrIVAkwEKIHEvy6ZRrR08R7YvHzL9Q3zDn7lY/TXd3FIn0+KnYpwrrEQ3ylES4G
 GMomCbIAg8LpazNpo5avLex21uZZYZc8fX1/Mz2Q3dTa/FCCNT9A5k597+V/onrbKsQ0
 023A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689820; x=1784294620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=A+55NFv/oNTAVwlYXY4Qavuiv1ZmlNGS6X9JQC9FXiU=;
 b=QZOGXUMS6l3ZiuwCTTHtRlN+nPZHOaki4W2X6Dv6NNCH/bMewK8TyEykLz+dMRt3TS
 cBXEX3elB3yA5kj20NG3/8sLLl46PAWsep0RTuRwH16ccXQt4drQcrHuht5Q3ur9GLzS
 Xu/OJorBacMTtek+UhoW3wa2lJHD/qTMkAbzG/Z/3r5v35WKpTq9g+TZeQ8v+kRL1ZA5
 2vebasPARYoF9ZXWNMVfpG0smPwaTgBHnjhUf/A03jpgOhzttzjVGDiZQzvy5Kpvykpf
 xKrw2Cqhx+chLFZD8F/TvmS9QjDArInJDyIoo0iNCsQlXCnKyt/OeKZlPGVm/1/5rNqQ
 rmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689820; x=1784294620;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=A+55NFv/oNTAVwlYXY4Qavuiv1ZmlNGS6X9JQC9FXiU=;
 b=J8yzq7A0448tOxYp3v3CG/FsH5406LQHMpqI6E416IP7LUHLduvp22ePcDLFpr0IgJ
 OHv0+Ax/QYCkuuAxCqar/zi8lyYpqdWQaqkn7iw10KY3bm3DEhP68UUxjKC1afMg6GXk
 9BMbSqu0gNK41eiqcO+/B+TtS4HaeCGNCMgewM2VL7wZppLgwGcMrK+j6RSh5hEE7pTy
 Jce3GSM5+dUskrqa+1n7K6RVsbLsLfuYoCcWMH3NFZUFuLQlWWRI3KfHeZJ/nwPc48YA
 UFHTdPQ8hO739ylVZ2Req5UA6eWX6unquIJc2xf3sdGZnCke9I5umwR8M91pGAUMUg4I
 XRfA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoyQ4gSRGnxtEnRQOm/kVK/fa892sNQbuhj09tbtX3LhApUPeRC8UwCXsIR6vA72yPFJk8JbJkT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYPcPn91q7iAFbSyvo6ajUQt0i4+zRXGH5S/bJhcx3FISQzbPR
 v4D5ND66IUFgiyPWSlRcgB0V75U1t6qrovGCfvcob8EeuUBh//0SoKk72GJ6Rn2k4BCjK9lajwh
 mZm3RCe1KQMMY1S4hZjuMRzjE6lwn/Xc=
X-Gm-Gg: AfdE7ckTbps/qz7wtK4+v1R2FLzmf7e3qlqgeDP547Rg1xyRjK1yIH3YgHlJrruNfpn
 fmZpWnNlZdqISoWD3DlwT0hqOs5bN9IK4kccPBSqLFTJnkAz92GvC8Hl4q3SQJKLPpTepDvf40/
 QndGrK+kmHERr7ky3jMmJodrISjI9k6bjx/BCnD+Eye3F5vMTtShbV3CY+c9qiTd+1CofoQ3tTi
 Ea6+A+4xpuGfktYr24ishOen288J/MqE8NsOnBQWFW2/zzb53MY2K1I769uM5dRU3iO7oKEbnWd
 5R7wR4WlvKlR3yDJzZ/wCTCUR6ForUrBT6El5jqnCroUIVhkDnmE7V04jks=
X-Received: by 2002:a17:90b:37ce:b0:37e:2053:3489 with SMTP id
 98e67ed59e1d1-389419cded7mr9478697a91.3.1783689819489; Fri, 10 Jul 2026
 06:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <b12cbd03-9e11-44ff-9ce1-8afb82379b53@amd.com>
 <20260708125636.8103-1-ulissespaixao@usp.br>
In-Reply-To: <20260708125636.8103-1-ulissespaixao@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2026 09:23:27 -0400
X-Gm-Features: AVVi8Cc0t-wJtq5yy-2Tj_W8I3d59dgHnZyoqjlSrmN3XT5Z4bZFbexSiJ5wtro
Message-ID: <CADnq5_OkpYczJu0LK9pEmBWFx=3Cq4GXNhSghRLGO-jXQvomJA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/amd/amdgpu: remove duplicated code in gfx_v11 and
 gfx_v12
To: Ulisses Paixao <ulissespaixao@usp.br>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, Felipe Sousa <felipesousa@usp.br>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ulissespaixao@usp.br,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:felipesousa@usp.br,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,usp.br,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,amd.com:email,usp.br:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18FCA73B346

On Wed, Jul 8, 2026 at 9:19=E2=80=AFAM Ulisses Paixao <ulissespaixao@usp.br=
> wrote:
>
> The functions gfx_v11_0_handle_priv_fault and
> gfx_v12_0_handle_priv_fault share the same logic for searching and
> triggering a scheduler fault on a ring. This patch moves the shared
> ring-searching logic to a common function, amdgpu_gfx_handle_priv_fault,
> in amdgpu_gfx.c. The hardware-specific decoding of ring IDs remains in
> the version-specific files to maintain proper architectural separation.
>
> Signed-off-by: Ulisses Paixao <ulissespaixao@usp.br>
> Co-developed-by: Felipe Sousa <felipesousa@usp.br>
> Signed-off-by: Felipe Sousa <felipesousa@usp.br>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

This code recently changed.  Can you respin against the latest
linux-next or amd-staging-drm-next?

Alex

> ---
> v5:
> Return early on adv->gfx.disable_kq check.
>
> v4:
> Restore the adev->gfx.disable_kq check to prevent falsely triggering
> scheduler faults on idle kernel rings when MES is managing user queues.
>
> v3:
> Return early if the ring is found in the gfx rings loop.
>
> v2:
> Keep the HW-specific decoding in gfx_v11_0.c and gfx_v12_0.c.
> Remove the redundant check for adev->gfx.disable_kq.
> Simplify the search loop in amdgpu_gfx_handle_priv_fault to iterate over
> all gfx and compute rings without a switch statement.
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 42 +++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |  2 ++
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c  | 27 +---------------
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c  | 27 +---------------
>  4 files changed, 46 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index b8ca87669..50e265abe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -830,6 +830,48 @@ int amdgpu_gfx_enable_kgq(struct amdgpu_device *adev=
, int xcc_id)
>         return r;
>  }
>
> +/**
> + * amdgpu_gfx_handle_priv_fault - Handle privileged instruction fault
> + *
> + * @adev: amdgpu_device pointer
> + * @me_id: micro-engine ID of the faulty ring
> + * @pipe_id: pipe ID of the faulty ring
> + * @queue_id: queue ID of the faulty ring
> + *
> + * This function handles privileged instruction faults by identifying
> + * the faulty ring (gfx or compute) and triggering a scheduler fault
> + */
> +void amdgpu_gfx_handle_priv_fault(struct amdgpu_device *adev,
> +                                       u8 me_id, u8 pipe_id, u8 queue_id=
)
> +{
> +       struct amdgpu_ring *ring;
> +       int i;
> +
> +       /*
> +        * The scheduler only handles kernel queues so this is a no-op
> +        * without them.
> +        */
> +       if (adev->gfx.disable_kq)
> +               return;
> +
> +
> +       for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
> +               ring =3D &adev->gfx.gfx_ring[i];
> +               if (ring->me =3D=3D me_id && ring->pipe =3D=3D pipe_id &&
> +                   ring->queue =3D=3D queue_id) {
> +                       drm_sched_fault(&ring->sched);
> +                       return;
> +               }
> +       }
> +
> +       for (i =3D 0; i < adev->gfx.num_compute_rings; i++) {
> +               ring =3D &adev->gfx.compute_ring[i];
> +               if (ring->me =3D=3D me_id && ring->pipe =3D=3D pipe_id &&
> +                   ring->queue =3D=3D queue_id)
> +                       drm_sched_fault(&ring->sched);
> +       }
> +}
> +
>  static void amdgpu_gfx_do_off_ctrl(struct amdgpu_device *adev, bool enab=
le,
>                                    bool no_delay)
>  {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.h
> index a0cf0a3b4..0b2f6ce85 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -611,6 +611,8 @@ bool amdgpu_gfx_is_high_priority_graphics_queue(struc=
t amdgpu_device *adev,
>                                                 struct amdgpu_ring *ring)=
;
>  bool amdgpu_gfx_is_me_queue_enabled(struct amdgpu_device *adev, int me,
>                                     int pipe, int queue);
> +void amdgpu_gfx_handle_priv_fault(struct amdgpu_device *adev,
> +                                       u8 me_id, u8 pipe_id, u8 queue_id=
);
>  void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable);
>  void amdgpu_gfx_off_ctrl_immediate(struct amdgpu_device *adev, bool enab=
le);
>  int amdgpu_get_gfx_off_status(struct amdgpu_device *adev, uint32_t *valu=
e);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v11_0.c
> index 2c6f1e25c..888c9f3c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -6688,37 +6688,12 @@ static void gfx_v11_0_handle_priv_fault(struct am=
dgpu_device *adev,
>                                         struct amdgpu_iv_entry *entry)
>  {
>         u8 me_id, pipe_id, queue_id;
> -       struct amdgpu_ring *ring;
> -       int i;
>
>         me_id =3D (entry->ring_id & 0x0c) >> 2;
>         pipe_id =3D (entry->ring_id & 0x03) >> 0;
>         queue_id =3D (entry->ring_id & 0x70) >> 4;
>
> -       if (!adev->gfx.disable_kq) {
> -               switch (me_id) {
> -               case 0:
> -                       for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
> -                               ring =3D &adev->gfx.gfx_ring[i];
> -                               if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> -                                       drm_sched_fault(&ring->sched);
> -                       }
> -                       break;
> -               case 1:
> -               case 2:
> -                       for (i =3D 0; i < adev->gfx.num_compute_rings; i+=
+) {
> -                               ring =3D &adev->gfx.compute_ring[i];
> -                               if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> -                                       drm_sched_fault(&ring->sched);
> -                       }
> -                       break;
> -               default:
> -                       BUG();
> -                       break;
> -               }
> -       }
> +       amdgpu_gfx_handle_priv_fault(adev, me_id, pipe_id, queue_id);
>  }
>
>  static int gfx_v11_0_priv_reg_irq(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v12_0.c
> index 6baac533a..3f0d29372 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
> @@ -5019,37 +5019,12 @@ static void gfx_v12_0_handle_priv_fault(struct am=
dgpu_device *adev,
>                                         struct amdgpu_iv_entry *entry)
>  {
>         u8 me_id, pipe_id, queue_id;
> -       struct amdgpu_ring *ring;
> -       int i;
>
>         me_id =3D (entry->ring_id & 0x0c) >> 2;
>         pipe_id =3D (entry->ring_id & 0x03) >> 0;
>         queue_id =3D (entry->ring_id & 0x70) >> 4;
>
> -       if (!adev->gfx.disable_kq) {
> -               switch (me_id) {
> -               case 0:
> -                       for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
> -                               ring =3D &adev->gfx.gfx_ring[i];
> -                               if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> -                                       drm_sched_fault(&ring->sched);
> -                       }
> -                       break;
> -               case 1:
> -               case 2:
> -                       for (i =3D 0; i < adev->gfx.num_compute_rings; i+=
+) {
> -                               ring =3D &adev->gfx.compute_ring[i];
> -                               if (ring->me =3D=3D me_id && ring->pipe =
=3D=3D pipe_id &&
> -                                   ring->queue =3D=3D queue_id)
> -                                       drm_sched_fault(&ring->sched);
> -                       }
> -                       break;
> -               default:
> -                       BUG();
> -                       break;
> -               }
> -       }
> +       amdgpu_gfx_handle_priv_fault(adev, me_id, pipe_id, queue_id);
>  }
>
>  static int gfx_v12_0_priv_reg_irq(struct amdgpu_device *adev,
> --
> 2.34.1
>
