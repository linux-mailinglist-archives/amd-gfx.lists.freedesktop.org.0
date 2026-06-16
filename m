Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FmFuCFjFMWrCpwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 23:51:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841326957BA
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 23:51:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=St2PxIkt;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB5C10ED3E;
	Tue, 16 Jun 2026 21:51:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E53010ED54
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 21:51:16 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1365eb2a773so238591c88.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 14:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781646676; cv=none;
 d=google.com; s=arc-20240605;
 b=DGc5T6zGnJj4Xf402fSaKt6Pti1CldmwzxNlw0bXNlAsGifqWU3UafmzyShx1MSEvR
 vBeNvMDCjq+byFhMTEBsa42lLyPOGnrRN+UtR9IZnCZGj2mXUtU7UjoeFSivV8dLrsOV
 POgz1E8pZZQTiABlcS7iEaaA2sY6EfS/TlYtw3XQKSMwgdYSuepTYFv6EBCacmmsAs3t
 U/fXauTsuh/cf5pE7J57vflZSBHgq0A3DMKtUx8zHssrzQvj5PyYPN9cQEuTohqaal4Z
 y/o8bxk4tHj/xCGzhvr3qDsds1EZz4nEbVUArHWZFxQ/8puUj1wlFJOMNnV8SISzqfhm
 Heiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qzYIGU7JhghujTXYz8WeWEjQ9HHY7xjnmn+gc95SIK8=;
 fh=pVXkSRI4iWxMX2nwzh6GHNF3uSMfA8RBUzqfkxIWt8U=;
 b=OVX7iD7R6eff5rKlOITp9BhzybCRxBGjsK4Qh5dzMQVzlbz7mIfPsE09e9ULmDqjok
 lZnCc1ildVYkNpLNWhBom9lJmfiVlbyieLg6MuGGAOic2BjWezA4xkyYraSr1KrX5Bkr
 9Yb3NUYQ1UJcUt3+KAAStkmDjtclYBQK6wFloTwxPQGjpBB/lLlrqHOy1js/IXCGSGl1
 7bwqyxah79BLb7Z1Bg7oR0X75b72tTQ9YtawqTl/VhDGk79NxUOmoqS+ZUC6XuLwQPyN
 DIHoRz0ZfGmvuuSyU89cAw4iV8+QPlBU9hIB8Ckqf7bYbFIlDI2SaPbZWFzhNCuwycwE
 i5tA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781646676; x=1782251476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzYIGU7JhghujTXYz8WeWEjQ9HHY7xjnmn+gc95SIK8=;
 b=St2PxIktwsm0saua3l23mskfq5P3HsqktZsn0eShyiDjakUOc9HD1bo9uqsOLHS+Ay
 gzItLMULkClXuiPjsKkjr6RmDSqwc93KQr9N1jkCPilVSvsLvI/1Mi3sCpjLqb1GXyjT
 BKQGGEII0QxoVozsiT4rm39Qpwnz8xFCaTzFjVvIxenXm2fRXvTPtNB/3hS1xAT4d/VY
 v9miFPf4KUneHO1iABdqXwJNfuzmFs56qKMWEez/JWGWtRw9Z6mkVMAxG8GmxUC1nYQ+
 aDix0B+IL6djplLbDQU0YcKZ6ASCsVa3razQr9ixVC/bYhq1HzDuPU/mE3glvr4X8W2B
 XyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781646676; x=1782251476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qzYIGU7JhghujTXYz8WeWEjQ9HHY7xjnmn+gc95SIK8=;
 b=l4LriwNyV44lAyrHZay6si0ptLuhknfVbIznul/xEDoPUNq33cFq59JPF9EgSyU4Bd
 yoa+6Rd9jxLRQFHvJzegp4ncbfXLw8UxAu0/MaJKxWPnzhutJy8uv5DXm8bq7M6GPkyK
 RJ82pnyiPNhJr/DVTq/+Pwzv6UtKRsPGmCQgFlFEVmzp9nPHLsVmULSXLR2HoiQKKF/Q
 CHACc7Nn9PVdHIEixoZz76m2RN01PmzOTbGHBhl5Zlffvi2Bt4C8KeTWB0Zg9ga+WEy4
 cnDepdb01YhPrhYxsIfGYPUJI8XMoLzvMNlOonV6poP8JQaTjutCaeJ6f+Fud5LCIg+R
 2OSw==
X-Gm-Message-State: AOJu0YwBxsRddaA4oE7Hezg6QY4t6uDHv5xuLG7ABBc5oVIhVbVdl783
 +W4+lAs/mqAQisiswfVmPlOSUj60zQuo4aOVAZypCU/AhuQWEPBNnXxUQPg7K2XbnMdu5HyjJna
 Sefq9w0QL0E2olMfjQVinwj/7Q/1yNNI=
X-Gm-Gg: Acq92OEDxyWKDw1hV+COtzEA8vnwxYydcN/P88N4iI95vJg0n4TKyYwaELqE1iyawvi
 VOks+fU8AT31a7ZSmOz/ziA9QHTsBljSlY+32dDWwpuKupBoIDh3GPllfeaCGA23on5CEbfX1Je
 x8msCzhghiDyxyygai6R59puaVnYqXsx1rzInvU9vCgrGAVvJsbpDPm7oJ0Cl69dqHt+gC6xXiO
 LEKp2Y1BnIwp5q+6nZ/UddIDC6HaM45PndzsmET/Ri7rwdwoxTrTeqgtc2DkZdqQUmLIcEtHlW3
 o8OXMW1HJ14g2uRL9CMdVXTS4LXx9lRXmZ8qFS6EubUbY111ttjBsd6f4WP4OtNMyVNhvA==
X-Received: by 2002:a05:7022:120:b0:138:43e8:c6bc with SMTP id
 a92af1059eb24-1398f704b21mr175669c88.3.1781646676167; Tue, 16 Jun 2026
 14:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260611035747.548780-1-Jesse.Zhang@amd.com>
 <20260611035747.548780-6-Jesse.Zhang@amd.com>
In-Reply-To: <20260611035747.548780-6-Jesse.Zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jun 2026 17:51:03 -0400
X-Gm-Features: AVVi8Cclr61RFgQfvC9aPeOm0O4W7oddvh0daIcIvVa__AAeN8o6VvbAdk9OeSc
Message-ID: <CADnq5_MM-iWJEo_wJPu0DufNgohDgbk2DHw81CVp9t001rodMQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] drm/amdgpu/gfx11: try KQ first in EOP IRQ
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,mail.gmail.com:mid,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 841326957BA

On Thu, Jun 11, 2026 at 12:04=E2=80=AFAM Jesse Zhang <Jesse.Zhang@amd.com> =
wrote:
>
> KQ EOPs were misrouted into the userq fence path when enable_mes
> is true. Try KQ by ring_id first (KCQ and UQ never share a HW
> slot); fall back to amdgpu_userq_process_fence_irq() on miss.
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>

I think you can squash 4 and 6 into one patch.  With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 30 ++++++++++++++++----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v11_0.c
> index 208f9ffed60a..a3294cf96992 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
> @@ -6515,31 +6515,32 @@ static int gfx_v11_0_eop_irq(struct amdgpu_device=
 *adev,
>                              struct amdgpu_iv_entry *entry)
>  {
>         u32 doorbell_offset =3D entry->src_data[0];
> -       u8 me_id, pipe_id, queue_id;
> -       struct amdgpu_ring *ring;
> -       int i;
>
>         DRM_DEBUG("IH: CP EOP\n");
>
> -       if (adev->enable_mes && doorbell_offset) {
> -               amdgpu_userq_process_fence_irq(adev, doorbell_offset);
> -       } else {
> -               me_id =3D (entry->ring_id & 0x0c) >> 2;
> -               pipe_id =3D (entry->ring_id & 0x03) >> 0;
> -               queue_id =3D (entry->ring_id & 0x70) >> 4;
> +       if (!adev->gfx.disable_kq) {
> +               u8 me_id =3D (entry->ring_id & 0x0c) >> 2;
> +               u8 pipe_id =3D (entry->ring_id & 0x03) >> 0;
> +               u8 queue_id =3D (entry->ring_id & 0x70) >> 4;
> +               struct amdgpu_ring *ring;
> +               int i;
>
>                 switch (me_id) {
>                 case 0:
>                         /*
>                          * MES splits gfx HQDs per (me,pipe): KGQ owns qu=
eue=3D0,
>                          * userq gfx owns queue>=3D1 (see amdgpu_mes_get_=
hqd_mask).
> +                        * Require a strict (me,pipe,queue) match so user=
q gfx
> +                        * EOPs fall through to amdgpu_userq_process_fenc=
e_irq().
>                          */
>                         for (i =3D 0; i < adev->gfx.num_gfx_rings; i++) {
>                                 ring =3D &adev->gfx.gfx_ring[i];
>                                 if ((ring->me =3D=3D me_id) &&
>                                     (ring->pipe =3D=3D pipe_id) &&
> -                                   (ring->queue =3D=3D queue_id))
> +                                   (ring->queue =3D=3D queue_id)) {
>                                         amdgpu_fence_process(ring);
> +                                       return 0;
> +                               }
>                         }
>                         break;
>                 case 1:
> @@ -6552,13 +6553,20 @@ static int gfx_v11_0_eop_irq(struct amdgpu_device=
 *adev,
>                                  */
>                                 if ((ring->me =3D=3D me_id) &&
>                                     (ring->pipe =3D=3D pipe_id) &&
> -                                   (ring->queue =3D=3D queue_id))
> +                                   (ring->queue =3D=3D queue_id)) {
>                                         amdgpu_fence_process(ring);
> +                                       return 0;
> +                               }
>                         }
>                         break;
> +               default:
> +                       break;
>                 }
>         }
>
> +       if (adev->enable_mes && doorbell_offset)
> +               amdgpu_userq_process_fence_irq(adev, doorbell_offset);
> +
>         return 0;
>  }
>
> --
> 2.49.0
>
