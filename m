Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sczwG+WvPmoGKQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 18:59:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A4E6CF4DA
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 18:59:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Rdhux1Ii;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E9610E1B4;
	Fri, 26 Jun 2026 16:59:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A8010E1B4
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 16:59:14 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c0b97e268f3so165103266b.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782493153; x=1783097953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUSrLdQ2FI4LHY0dWueNCnyawFEpRnJYUQiGcaotRTs=;
 b=Rdhux1IixPoMKalP6eS9UuJL1ZntPTqBZsIgkjjtcoYXyBiLfMScFA+0VSTStN2BEq
 mthi6FfiQhKWOd6mmX+XZBv0eiMyuKLqAEAWHsQ2L3E6erN4AN31ibWt+w2JvWpvxddy
 +5eNXQ2cTtk8e/6olEliBzJYTd9MYr2MO4LT3kxd4Th/tZIMpwPwsLhdNpF78hOyMFA/
 lfCX8Tcu4TJtlTAj5L2L4VF4l80zuXoJGVpUMfOh+9fLc+I50H315zlDdVbrnQklj2mG
 zvFXapWPMfDCrOhqr8SFDRqnPvzYKSvknDcS/J02gXe0wJXkg52eGdKweawtr0vx4hav
 5gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782493153; x=1783097953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BUSrLdQ2FI4LHY0dWueNCnyawFEpRnJYUQiGcaotRTs=;
 b=Xa3tjyU36RN3QgCei1qcrWOFbTdDW0C3KaK47Gh1IFC61Agh/WSqTG4wCKL81E83ey
 ICKkrNRGuMnKYQpmcUSpGBsoDaGOyTdsZap/WU6YC0O3fvAZ+dShRlcCtVGPSOnCdppJ
 S5HLlWFFFojWDvW/pDjEh81Hb07W1F9z864uUu5ULCHD4AxllDD6h8o6UGhkHy4eRmVi
 aEif/LKHvP7nL7nXzkQnPhMyPDSp1LMyB+xCnsa5wOzvB6NyLq6cAPOLQYz79RWVD9KE
 czBK2mZh5S5G70Uc4e5EOH7rhc8YZEzpNxKRWdtg/TYdnm4bVoqKnKGF1JjApD2e2iE8
 a4ng==
X-Gm-Message-State: AOJu0YxbjHpnoaOZl8CQMMhRx6FXXki869htXTrVEhyAaPIPmiCJavuE
 NpMKjJ22ehP7w6ftSAeyx3Jv9NNF0LkfiDt7H+fwTtK5Lalm4TdMBBXdYOtvdQ==
X-Gm-Gg: AfdE7ckDW1Pk8OLkLMYXWa80W2I2g9I6Wbbe6RfcX6I7Yq1GSi9AiE+mqLV0MvkMPBB
 Uof+KUDNevsa6NmW4e0vtbuLl0kKr7SZ8MSKgD7kYuYYzo2+xpP6V9F7nJIZHn25eYH/Uv8RCng
 mVCcThaJ8XIeBaM+/KcCE6knS8fuSw1Y5gQRjwP7ws8VLiUL1Z6m7GcGcV7JvlFtCcZR0r3oLhr
 +xserdhxlNz0jKfrXl55N8jOsjRPrDbKIuAwdeYJP8qGJ8giIpZreoyLgpu9Uw00z+0G7NYkWjj
 1MPUcpYhbRRMWKqUeg6tIj1gAxQJVzaUgLlwy14h9kRxnAIW0ha9LyDDqkeE0OGG2Ca2lMiuM7D
 Zjo2ILdfFbkQ9LioHGymdRJxC2SmHYKL15b1dcW0fXDi/3JO16W625gWF3QKyAekUnAjnBAfXY9
 g2JzP3yuYlTOgI/cbKEjvJXI1cOrA7Ww==
X-Received: by 2002:a17:906:e108:10b0:c12:29a3:e348 with SMTP id
 a640c23a62f3a-c1229a3eca4mr139568066b.27.1782493152627; 
 Fri, 26 Jun 2026 09:59:12 -0700 (PDT)
Received: from timur-max.localnet ([2a0a:f640:1701:30c:61f9:a53e:4a65:c732])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c121cd03f24sm159682066b.32.2026.06.26.09.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 09:59:12 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: Remove unused amdgpu_device_ip_is_hw
Date: Fri, 26 Jun 2026 18:59:10 +0200
Message-ID: <4887714.vXUDI8C0e8@timur-max>
In-Reply-To: <20260626085558.97923-2-tvrtko.ursulin@igalia.com>
References: <20260626085558.97923-1-tvrtko.ursulin@igalia.com>
 <20260626085558.97923-2-tvrtko.ursulin@igalia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9A4E6CF4DA

On 2026. j=C3=BAnius 26., p=C3=A9ntek 10:55:56 k=C3=B6z=C3=A9p-eur=C3=B3pai=
 ny=C3=A1ri id=C5=91 Tvrtko Ursulin=20
wrote:
> This function is unused so lets remove it.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Timur Krist=C3=B3f <timur.kristof@gmail.com>

Nice cleanup!

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>

Are there any more uses left of the amdgpu_ip_block_status.hw field?
As far as I can see the field is set but never used, maybe we could remove =
it=20
too. What did this field mean anyway?

Best regards,
Timur


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c | 21 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h |  2 --
>  2 files changed, 23 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c index 6aa54156bbc9..62285e973c5c
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> @@ -368,27 +368,6 @@ int amdgpu_device_ip_wait_for_idle(struct amdgpu_dev=
ice
> *adev, return 0;
>  }
>=20
> -/**
> - * amdgpu_device_ip_is_hw - is the hardware IP enabled
> - *
> - * @adev: amdgpu_device pointer
> - * @block_type: Type of hardware IP (SMU, GFX, UVD, etc.)
> - *
> - * Check if the hardware IP is enable or not.
> - * Returns true if it the IP is enable, false if not.
> - */
> -bool amdgpu_device_ip_is_hw(struct amdgpu_device *adev,
> -			    enum amd_ip_block_type block_type)
> -{
> -	struct amdgpu_ip_block *ip_block;
> -
> -	ip_block =3D amdgpu_device_ip_get_ip_block(adev, block_type);
> -	if (ip_block)
> -		return ip_block->status.hw;
> -
> -	return false;
> -}
> -
>  /**
>   * amdgpu_device_ip_is_valid - is the hardware IP valid
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h index 1d0df6d93957..11739fbdeaa6
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h
> @@ -146,8 +146,6 @@ void amdgpu_device_ip_get_clockgating_state(struct
> amdgpu_device *adev, u64 *flags);
>  int amdgpu_device_ip_wait_for_idle(struct amdgpu_device *adev,
>  				   enum amd_ip_block_type=20
block_type);
> -bool amdgpu_device_ip_is_hw(struct amdgpu_device *adev,
> -			    enum amd_ip_block_type block_type);
>  bool amdgpu_device_ip_is_valid(struct amdgpu_device *adev,
>  			       enum amd_ip_block_type block_type);




