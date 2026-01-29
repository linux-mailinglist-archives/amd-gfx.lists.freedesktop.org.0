Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPqfLWore2lRCAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Jan 2026 10:42:02 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A4AE37D
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Jan 2026 10:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CA688647;
	Thu, 29 Jan 2026 09:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="alhv56tP";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89B710E843
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 09:41:58 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so7615865e9.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Jan 2026 01:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769679717; x=1770284517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCrMEk305V4ep1Ljp2+tjNf0DgD09QiSWq/9O+50H9A=;
 b=alhv56tPM5XAyfvmUTIRaVazP6xdSF1e9qjlhA2OreT8J9Uzzdsq67XrQ04ZbziRpp
 iQY2Skd2ikax5wQV74ho7LG1dOLUfTcBZBNpJhBn4FPByFUygYpTNNQbh3e9WTrubSCH
 Slh4DfrSFQVgHLTbSK07k976ftXMRUbL0rsG0pj5K3MosPxiUFWgyY4z0TSG7OxjkIjX
 WHic6UXEV4Vrr/3U8K9vh51iSrzoqWUGvZMJ6zbGAc9crm+GAxR12xmcbos6I6vawBZZ
 53F8Cz6uk/z4we6pn5nmWF3zc0nZocTu8AnanIMBsFol8/eP2/EeQWr4+vyp/4sDV2aK
 Zfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769679717; x=1770284517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NCrMEk305V4ep1Ljp2+tjNf0DgD09QiSWq/9O+50H9A=;
 b=bRBgc56+8y9WVIn+KZqycArpxewXCGn1lhRqvOus5T97Eq/4s/np8xWvB9cvfHzT3X
 PPjjRfjbqBTq7BfJKbqFs5ca+YE+i95TyJHcbss3mbMertzKdbT7HWb5zt1Zhhh8BXG1
 0w3wYdcFwz+30n7/HybGFyo0S2D4jRsShnQw9rPtW75N5tCGjw4HRLk6uzgfP8wKWSN1
 w9do9tmI4X9LxxNooJ+tSPVPH6wU24ill/wR9Wg8dVzx9GkQJJChumHuBU57i/lsFi6Y
 uiAa8w5BeCDrXxz6vJy9HQYwFYO8/P9fYlnoHGblLkRdSArWFju9VC1BXSfr52chwkBJ
 cefA==
X-Gm-Message-State: AOJu0YzBMp9NTLC8+gFsatSlQU38QTKOI3bUUG4YTl7tJyB85X0r9c4p
 AivOqiKp2XjAo/cX5Rr19HWAqDMqa5f4a6v6PRAgXrUPpKt+KIpcsSle/bnotw==
X-Gm-Gg: AZuq6aIWPxf1i1+vl/aoNDolJhg0TtCFmdzuSAdZ7bIRS4HgZ1vci+9PUHE8LIiEnVv
 V+fgGktpWcN5T7q8iEzYWpYyI6rI7UV+pPzZOMvhChJqexsyV+wvxVlbr47TkLHKlW47rb/ExUu
 50uh+7j29xvvu091jdMu5Kwrl2BA2FMgz9rw4IeXJ17uj/hhy/u1BzdaYCMiyHUBc2mME3cgiBg
 LcFZbailIy5gHPLqjsOt6XH1GsVQnEnj5JEJedr2ZDyxjSgS5Neci+g4+RMLEqsY0XRcn5qFZyf
 Mr4wdzsY10a7yl4ZSDMPhNc+N72E1/OCravofFvjxMKNJWuT0dNJwPglGuLQlwWpws1dLVpicHz
 o9eHzjIefAu+PGwzE5flvEdUawbd3drKtABNB85L4flI7Rdf263HPY20uiQrogofrO3iUNLJek9
 jEzKCt9wA+IEFseI7k9xMgIFjAwQJTgYWSyx1wTPql+LsEx7pPi8xVjdMw8CU=
X-Received: by 2002:a05:600c:6094:b0:477:7bca:8b2b with SMTP id
 5b1f17b1804b1-48069c1dd79mr93394485e9.15.1769679717169; 
 Thu, 29 Jan 2026 01:41:57 -0800 (PST)
Received: from timur-hyperion.localnet (5401DF8B.dsl.pool.telekom.hu.
 [84.1.223.139]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e13235f5sm12617367f8f.29.2026.01.29.01.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 01:41:56 -0800 (PST)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/3] drm/amdgpu/gfx10: fix wptr reset in KGQ init
Date: Thu, 29 Jan 2026 10:41:55 +0100
Message-ID: <3572729.LZWGnKmheA@timur-hyperion>
In-Reply-To: <20260129043446.33377-1-alexander.deucher@amd.com>
References: <20260129043446.33377-1-alexander.deucher@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 279A4AE37D
X-Rspamd-Action: no action

On Thursday, January 29, 2026 5:34:44=E2=80=AFAM Central European Standard =
Time Alex=20
Deucher wrote:
> wptr is a 64 bit value and we need to update the
> full value, not just 32 bits. Align with what we
> already do for KCQs.
>=20
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Reviewed-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
for the series.

I notice that the code base already does this for gfx9, but is rather=20
inconsistent on gfx6-8. If you think that's useful, I could submit some=20
patches to do the same on older GPUs. What do you think?

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c index e9254ec3b6417..ef7d91a4437=
ec
> 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -6883,7 +6883,7 @@ static int gfx_v10_0_kgq_init_queue(struct amdgpu_r=
ing
> *ring, bool reset) memcpy_toio(mqd, adev->gfx.me.mqd_backup[mqd_idx],
> sizeof(*mqd)); /* reset the ring */
>  		ring->wptr =3D 0;
> -		*ring->wptr_cpu_addr =3D 0;
> +		atomic64_set((atomic64_t *)ring->wptr_cpu_addr, 0);
>  		amdgpu_ring_clear_ring(ring);
>  	}




