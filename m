Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id etJ1A0RcIWpTFAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 13:06:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E563F4AF
	for <lists+amd-gfx@lfdr.de>; Thu, 04 Jun 2026 13:06:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JTUWNy9B;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A4110E117;
	Thu,  4 Jun 2026 11:06:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5B10E117
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 11:06:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45fd45e596cso283041f8f.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2026 04:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780571199; x=1781175999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2HuSB236qGR3oItsGDeVzp1v8EvB6HtAeOG2+SOlPy0=;
 b=JTUWNy9BVdzk/bfRsqmI2DpcuGSjlHXl+gMAkAqd3w4Wiv1ZMq+9XpsdohHdCKMAie
 K1Rasti3s/SNDCufjKP71+qEmotazVnAfpVQZUPsM8wilk6Ln2RCkD6L4RId6osZuo8F
 2jfWFQvh57LB97Ywz6VZ3CM6W10vbYWIJeNCW8D8LVxuwg/oy2XgzJcAafbEX8qAYTOe
 RnNQSF7z2r0zKrKyeIRaRHTNmskaoYajUM5+63Eef2btt8I14LxrPD+i3MzZCZtbyHzs
 vHrqKa4FCq4q4ukLUa5H+V0SnFF8anhjQC/C51VaWX4ITGN1Rdg+3TQeV+YMqn6A7qOu
 qrTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780571199; x=1781175999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2HuSB236qGR3oItsGDeVzp1v8EvB6HtAeOG2+SOlPy0=;
 b=am2+osvCjvsJYKaKX6NXuIIod7XZscJKZ+6xSUQsqD5z6IA+C/5er4u2gUxe+AAlj5
 z1vxKS+V6Ya8D95VVh9Cqp7Zqwtz6Gp3XrfF8wjfJuln/8Ulivu9T47rVFlfVzr6OAKa
 xtXtV1jNn8rX73mtV4atoyjzuDQFzPuMZUfiy/tl5XvuWuW8ieM5WxEEMeO9opoKB9ca
 wj2dkk6YsNruW8wMgNVdmL+SZnSwEf1FkbQol56eIa2P9MFHWJmXzGnwtAFtRheCQJGU
 4rRdHzzF8rgaJDnyx+vPZ1V2GOd0LAKL0D8enMjXfExmTHYrVZzd30tb/N+vkh3ZGicM
 J4bg==
X-Gm-Message-State: AOJu0Yx3ncF+3lDZdcAMALOI7FQ8R5JBpzjRiR02f/GLHLTrkxJC+1jk
 m9gEaFaYTALu9mujLy5KMRUnj3QT7FwjheIbhuqqOjUE02SrSc2SaP4xeG+dIw==
X-Gm-Gg: Acq92OGo1qNij10UtAH659Z4WmAe0OaY50WfOzpBmqeZtQXmrU3XuDDEdYslblyADiz
 QvORbdpA5dTQTWqB9w7ZeLHc/xg8v5bLGum5SvU9ydaAU7npH4+3NP+xoTwm24nbKH/pV7qOqO/
 +8Yo2IjToY5KkOgonpd9hrQR3MUHo3hi/Z6BvA2+41GYuZ4SQ3fQ5cpIweX5+ML6Dyof3Tkpg2h
 UXOfuQQzrWWKm18s7a2MSHl1V35p1s4o/dDdyDx7WkOeNbOlAfVFivnug2vhzHtzi1BPt4yeLmp
 2Zfq1jgYowtgCwe/AZJETHnFIwyqoFOpEKqdJ+SOcALx9E8jTtPxE/n6GUbBDYsu7kt3uH/f3K0
 t8feEy73f3NYFzP4yLbXUyTqzowkkOP9RUVNEHwl2MFpeke98KlIRub9vvttOVUh8cPVcHaZPT3
 NRiXl38ofgseH0/oy2jXgECwU/PqaPwd9avZuYycLyyufgrIVyxwjnjanrEc/gs0wk5ghORxjsw
 DRCprBEtpRdxe2G6cVilDN5IWPqMX7isSNlrw60
X-Received: by 2002:a05:600c:8b23:b0:490:b115:e03f with SMTP id
 5b1f17b1804b1-490b5e893admr121026145e9.8.1780571199203; 
 Thu, 04 Jun 2026 04:06:39 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24EDFA00ACE56DB4A62D1E35.dsl.pool.telekom.hu.
 [2001:4c4e:24ed:fa00:ace5:6db4:a62d:1e35])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3b59f0sm72188235e9.2.2026.06.04.04.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 04:06:38 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Subject: Re: [PATCH] drm/amdgpu: always emit the job vm fence
Date: Thu, 04 Jun 2026 13:06:37 +0200
Message-ID: <4882616.vXUDI8C0e8@timur-max>
In-Reply-To: <20260603194535.2371150-1-alexander.deucher@amd.com>
References: <20260603194535.2371150-1-alexander.deucher@amd.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 332E563F4AF

Hi Alex,

On 2026. j=C3=BAnius 3., szerda 21:45:35 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=C3=
=A1ri id=C5=91 Alex Deucher=20
wrote:
> We need the fence to reemit the gds switch or spm update
> after a queue reset.
>=20
> Fixes: a17ef941212b ("drm/amdgpu: rework ring reset backup and reemit v9")
> Cc: timur.kristof@gmail.com
> Cc: christian.koenig@amd.com
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

The patch makes good sense to me. Thanks!

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c index 2f3470208829e..7e0e2281719=
b1
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -853,12 +853,10 @@ void amdgpu_vm_flush(struct amdgpu_ring *ring, stru=
ct
> amdgpu_job *job, job->oa_size);
>  	}
>=20
> -	if (vm_flush_needed || pasid_mapping_needed ||=20
cleaner_shader_needed) {
> -		amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
> -		fence =3D &job->hw_vm_fence->base;
> -		/* get a ref for the job */
> -		dma_fence_get(fence);
> -	}
> +	amdgpu_fence_emit(ring, job->hw_vm_fence, 0);
> +	fence =3D &job->hw_vm_fence->base;
> +	/* get a ref for the job */
> +	dma_fence_get(fence);
>=20
>  	if (vm_flush_needed) {
>  		mutex_lock(&id_mgr->lock);




