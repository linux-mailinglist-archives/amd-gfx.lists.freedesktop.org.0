Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TBKzAK+zPmrWKQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:15:27 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563926CF5E1
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 19:15:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H4jwwzss;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168F10E1AF;
	Fri, 26 Jun 2026 17:15:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF4B10E1AF
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 17:15:23 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-c0efc7ef797so195989766b.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782494122; x=1783098922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaFvOn4phT6mS2rSFgScWy7KDalpqaHGDITfPjY0MxI=;
 b=H4jwwzsszQE+tsS1UglxaU0CcRfAJGvMsMdEYLleHjRiDmh/1Czb+Hvv0H06fkn43X
 IvCeA/HQVxUBWl3ku0XlJx9/8xWN8xzO9XayNKmdzcMN/n/QibzCQP0j3sAjn8siStU2
 13PNm3Xsj5KMPmwZhSM3MbKMIkk5NJ5Sf6jVHySosWx2o/X2rFyr8OKhBojHI1YW3a4V
 ho8fC9o9IdGABaQ157RWISwGWnQyQ9QiWp8MnlhTwaiz387mhr8W9FXnCQgp8bP6vUYn
 aj/OHU4tEsfAHnMX2IgoxQdJfaUputfyYls6F6DF8kjxBsSpWI29TlDE1YuK2IYnCY/k
 ACNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782494122; x=1783098922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CaFvOn4phT6mS2rSFgScWy7KDalpqaHGDITfPjY0MxI=;
 b=fS0Xy6UQLSz2xcdFE6x5CD2FnOlG4VQdR5WVVIEF3AkVI2ivOPV3sUj6si0FwxF+8L
 /i0l/SvUhjY5DPzmEPqDnn2cJyzsWgqYKrEorNUJQC/SU9tCDUNDw5jCCvxUyzG9J7ku
 3A1tkMYQK8Kuy7U6EZTdtdeeBvMU7ef4iHH7pubtEfXLPSTMLhZ0SqYmNaZkXvHmygCM
 micjKQULiFEwhYWQUpieiewuZ60r2M5vyiSh7xkPE9bU4JCd7cZT2371hjz5REzmys2m
 IEsDM8wpchKI/rl/9/n9oBUBn6+hMGjxSy/R/PdAX1pAgG392+ghH2+3q+K0sQcBHFzg
 y10A==
X-Gm-Message-State: AOJu0YzsZrZ53/z+/tVfJDUaT1HVt2OXr7iMzLjuqBr/E2d6t6B3zIqP
 I9q9zyOJ+uCbwHK8WsGNuwNlXrejxDPxghvfs5kxnpogwZ6OB49QKlijRshZXA==
X-Gm-Gg: AfdE7cmJVJlSXwOhZ7F1WCiPYRbLotin5jwxLAUuH5fDyRe55kdx8xUgsD+wiN21tal
 oU4zXQbOeU2uM1uTOt8c7XEUJyD/1fwZM86TFqibYurBeVMHxV+rxAzdE0G9lWw3LwXnKeqr2YO
 dL3Hj9Y7belNHk8Y7Mt4fm48IgcsNTJK1MQdxjcXwCWC3QDw9/wcWLjpMn9/GdPrTUoXj8fKM4v
 DhQu/VEn9JQgOrVi8Y5dcZtw67+Hn00tKzIV3ASVvxA6UdEFJxMw96RxZ00MU5P6a5aALb6OTG2
 w3TUrnNVkHoHQwHRZtgqbTRzg8uJVI2bImIbDQW4dfiAK346TlzAMLSaeEJSwUVPoPN5d87bMDe
 WC7uSTZUcdAb+yw9XTXv1PhLkMsJYhtC6i6C3/Vec9gJ1XQ3AIsGDEAhOpkNNqWLzo/50Bq9Pe6
 sXhDWvknXme3geRQdfLG1RV7V1Mui0qJmc+ZMi
X-Received: by 2002:a17:906:478f:b0:bef:d3a1:5065 with SMTP id
 a640c23a62f3a-c1205d8f123mr468648766b.18.1782494121952; 
 Fri, 26 Jun 2026 10:15:21 -0700 (PDT)
Received: from timur-max.localnet ([2a0a:f640:1701:30c:61f9:a53e:4a65:c732])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c11fbe05ed6sm354728366b.30.2026.06.26.10.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 10:15:21 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Do not fiddle with the idle workers too
 much
Date: Fri, 26 Jun 2026 19:15:19 +0200
Message-ID: <7279658.9J7NaK4W3v@timur-max>
In-Reply-To: <20260626085558.97923-4-tvrtko.ursulin@igalia.com>
References: <20260626085558.97923-1-tvrtko.ursulin@igalia.com>
 <20260626085558.97923-4-tvrtko.ursulin@igalia.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,timur-max:mid,amd.com:email,lists.freedesktop.org:from_smtp,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 563926CF5E1

On 2026. j=C3=BAnius 26., p=C3=A9ntek 10:55:58 k=C3=B6z=C3=A9p-eur=C3=B3pai=
 ny=C3=A1ri id=C5=91 Tvrtko Ursulin=20
wrote:
> Idle workers only need to be canceled or pushed back if we are potentially
> idle. Make the both operations conditional on the pre-increment and post-
> decrement status of the in-flight job counter.
>=20

Nice catch!

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c  | 11 +++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c |  9 +++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c  | 12 +++++-------
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c    | 12 +++++-------
>  4 files changed, 20 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c index 85372af1216d..623a5339bc47
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -2460,9 +2460,8 @@ void amdgpu_gfx_profile_ring_begin_use(struct
> amdgpu_ring *ring) else
>  		profile =3D PP_SMC_POWER_PROFILE_COMPUTE;
>=20
> -	atomic_inc(&adev->gfx.total_submission_cnt);
> -
> -	cancel_delayed_work_sync(&adev->gfx.idle_work);
> +	if (!atomic_fetch_inc(&adev->gfx.total_submission_cnt))
> +		cancel_delayed_work_sync(&adev->gfx.idle_work);
>=20
>  	/* We can safely return early here because we've cancelled the
>  	 * the delayed work so there is no one else to set it to false
> @@ -2490,9 +2489,9 @@ void amdgpu_gfx_profile_ring_end_use(struct
> amdgpu_ring *ring) if (amdgpu_dpm_is_overdrive_enabled(adev))
>  		return;
>=20
> -	atomic_dec(&ring->adev->gfx.total_submission_cnt);
> -
> -	schedule_delayed_work(&ring->adev->gfx.idle_work,
> GFX_PROFILE_IDLE_TIMEOUT); +	if
> (atomic_dec_and_test(&ring->adev->gfx.total_submission_cnt))
> +		schedule_delayed_work(&ring->adev->gfx.idle_work,
> +				      GFX_PROFILE_IDLE_TIMEOUT);
>  }
>=20
>  /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c index 63ee6ba6a931..57935c3215=
15
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -134,8 +134,8 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring
> *ring) {
>  	struct amdgpu_device *adev =3D ring->adev;
>=20
> -	atomic_inc(&adev->jpeg.total_submission_cnt);
> -	cancel_delayed_work_sync(&adev->jpeg.idle_work);
> +	if (!atomic_fetch_inc(&adev->jpeg.total_submission_cnt))
> +		cancel_delayed_work_sync(&adev->jpeg.idle_work);
>=20
>  	mutex_lock(&adev->jpeg.jpeg_pg_lock);
>  	amdgpu_device_ip_set_powergating_state(adev,=20
AMD_IP_BLOCK_TYPE_JPEG,
> @@ -145,8 +145,9 @@ void amdgpu_jpeg_ring_begin_use(struct amdgpu_ring
> *ring)
>=20
>  void amdgpu_jpeg_ring_end_use(struct amdgpu_ring *ring)
>  {
> -	atomic_dec(&ring->adev->jpeg.total_submission_cnt);
> -	schedule_delayed_work(&ring->adev->jpeg.idle_work,=20
JPEG_IDLE_TIMEOUT);
> +	if (atomic_dec_and_test(&ring->adev->jpeg.total_submission_cnt))
> +		schedule_delayed_work(&ring->adev->jpeg.idle_work,
> +				      JPEG_IDLE_TIMEOUT);
>  }
>=20
>  int amdgpu_jpeg_dec_ring_test_ring(struct amdgpu_ring *ring)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c index b261aa7c1ba8..8d2abf706dfd
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> @@ -506,9 +506,8 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ri=
ng)
> struct amdgpu_device *adev =3D ring->adev;
>  	struct amdgpu_vcn_inst *vcn_inst =3D &adev->vcn.inst[ring->me];
>=20
> -	atomic_inc(&vcn_inst->total_submission_cnt);
> -
> -	cancel_delayed_work_sync(&vcn_inst->idle_work);
> +	if (!atomic_fetch_inc(&vcn_inst->total_submission_cnt))
> +		cancel_delayed_work_sync(&vcn_inst->idle_work);
>=20
>  	mutex_lock(&vcn_inst->vcn_pg_lock);
>  	vcn_inst->set_pg_state(vcn_inst, AMD_PG_STATE_UNGATE);
> @@ -550,10 +549,9 @@ void amdgpu_vcn_ring_end_use(struct amdgpu_ring *rin=
g)
>  	    !adev->vcn.inst[ring->me].using_unified_queue)
>  		atomic_dec(&ring->adev->vcn.inst[ring-
>me].dpg_enc_submission_cnt);
>=20
> -	atomic_dec(&ring->adev->vcn.inst[ring->me].total_submission_cnt);
> -
> -	schedule_delayed_work(&ring->adev->vcn.inst[ring->me].idle_work,
> -			      VCN_IDLE_TIMEOUT);
> +	if
> (atomic_dec_and_test(&ring->adev->vcn.inst[ring->me].total_submission_cnt=
))
> +		schedule_delayed_work(&ring->adev->vcn.inst[ring-
>me].idle_work, +				 =20
>    VCN_IDLE_TIMEOUT);
>  }
>=20
>  int amdgpu_vcn_dec_ring_test_ring(struct amdgpu_ring *ring)
> diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c index 8b8184fe6764..0d8a3cea63ee
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> @@ -159,9 +159,8 @@ static void vcn_v2_5_ring_begin_use(struct amdgpu_ring
> *ring) struct amdgpu_device *adev =3D ring->adev;
>  	struct amdgpu_vcn_inst *v =3D &adev->vcn.inst[ring->me];
>=20
> -	atomic_inc(&adev->vcn.inst[0].total_submission_cnt);
> -
> -	cancel_delayed_work_sync(&adev->vcn.inst[0].idle_work);
> +	if (!atomic_fetch_inc(&adev->vcn.inst[0].total_submission_cnt))
> +		cancel_delayed_work_sync(&adev->vcn.inst[0].idle_work);
>=20
>  	/* We can safely return early here because we've cancelled the
>  	 * the delayed work so there is no one else to set it to false
> @@ -207,10 +206,9 @@ static void vcn_v2_5_ring_end_use(struct amdgpu_ring
> *ring) !adev->vcn.inst[ring->me].using_unified_queue)
>  		atomic_dec(&adev->vcn.inst[ring-
>me].dpg_enc_submission_cnt);
>=20
> -	atomic_dec(&adev->vcn.inst[0].total_submission_cnt);
> -
> -	schedule_delayed_work(&adev->vcn.inst[0].idle_work,
> -			      VCN_IDLE_TIMEOUT);
> +	if (atomic_dec_and_test(&adev->vcn.inst[0].total_submission_cnt))
> +		schedule_delayed_work(&adev->vcn.inst[0].idle_work,
> +				      VCN_IDLE_TIMEOUT);
>  }
>=20
>  /**




