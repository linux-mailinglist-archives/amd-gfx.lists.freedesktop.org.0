Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDfoLHEg3WneaAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 18:57:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D803F055C
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 18:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED9110E4D7;
	Mon, 13 Apr 2026 16:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pHTK//oS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D78010E4D7
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2026 16:57:18 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-12c373ee97fso303244c88.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2026 09:57:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776099438; cv=none;
 d=google.com; s=arc-20240605;
 b=ID+U6s8CQ83gA3lF38YsdHyapW0WMVLgTQYzYMbBRWhhfEtWgzvQbkbejZ17mjCdv2
 8hg2AB4CJb0zRUWSXCXRNkCgCEQApwukZuMFIMkjkkwO7Ag9mcpeP/FEoce0O/3j9LzF
 1JpFbTW2pUzSZ9NzAYiXsXvk+xt2U9uUeYcOlsLzb3++2Z8Q88JmlknmlF3XgH/QA6hw
 eQ+8NWNOieJrzOXQMPNWr455r2OqmBBEEN81qgkz6jYN5Ak7lcGTPOPJWN+XtdW2oRzu
 uAJlD1khCi38bIQAuCfUV4JtLj3Kt5fkv2cpn69eF4pmr8OawJayTf+/OjO8RWqygiVV
 EtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FQ450IY3IaiAVrg78umDaODH95JXzV+JVIHR0GxHPjM=;
 fh=U2UahfMGk5vXaMhbl3BvY7QHlbhpENboJb35tR+5PqI=;
 b=JcL0MMrDkIajQTE94LxmzGuOCxcfa/L2SP/TrWDYuFkKzaDxT4VQzz5XIosB//8O/d
 3E8M2/Xdrw3QTYbVIvoQ1J2yV9xCmn3xIBVqwqlR9+ooFoCj2+H17ZmjUZaJzntIqcMd
 3xoXaT/xqPsODX2eetNzeI29yX89vwB+Mr82gaIJbrc46ANsqTeb075KsF6pWhWUx/ng
 +0FMl5z+Wh6oUGhMW7DwvbxAjps+eNFFOJSsuyckf+iHlLYj2TXvCFAVNYAvYrBEkSGq
 omMzITzFxLvVuoD0AAYszE4m+sEEOdUazim+oErtn0c795D0R+Wszce8lDqd/AhWZyEm
 Mh+g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776099438; x=1776704238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQ450IY3IaiAVrg78umDaODH95JXzV+JVIHR0GxHPjM=;
 b=pHTK//oSNvK+52msoC1MUTfXz9TiGTCiB0ZDEnDcd1v47X/c3DDhzU1OuFWGuteqiO
 yl9s41qJxapYgWzWGGrwwE5w+BrcOAwLBnojg4p1s7drCnYyUEM5p2CJ8X5DMvLiuI1T
 4UdwsbK5+OjJpCajfU8KpoYwGE24+x5KsESOMy8/yZGV82/FOPnMlg45rI3oBsHFkecc
 iLtHuz3CXo9MJqAX0mnh/qH5QyM3N6MaK+LQwb4SFkBIrWquB4LcOrEW5QEc07U7KIBX
 GLqKTmSOTCVqEidp6dzarWS8qvWeezIdboxMU6lnKvcFeLFT4l3R4RS3oFVk1r+HysOy
 aTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776099438; x=1776704238;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FQ450IY3IaiAVrg78umDaODH95JXzV+JVIHR0GxHPjM=;
 b=cBPRb5RYmh4unKMOQ503TjG01bggH275O0GT79JlUN3grX/NGbC2L5mTpAkER+r1Cd
 FRob2C93NcZ52v4Wn7oT8c3SZw5nIk6tvfFjwaTrg30HvDapD/+XoUPjaTkt9rGRcg+z
 qE5vLH4ZqM0ZXZuWPf+lbODi4ZpHwn9nqqkvlJrZatMXuTH5TsmS5MAe5VYFvsdJf0pG
 OSJG9BbUwzSLw96CDVhAt1vmvTy3XGOOyy2gMS7GlOSmGdwyYkSFftimEPDBCS5FnmBT
 bWDm+Swvpju2YpKPPhZryTyLVpezCFFYYZxnhVMvIMda5GixgQ5Xdn3h/G5sSKTVRbpK
 mNHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ87jrLQgHaevd2kZp2p5PVBKjCFyxHd5/TZ/LyWWMV/Z7jeV9WvGqMejqWC4KHEqVJA+h7H/QhA@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/nUldz28uvkbxJfjwfFAvlwzq/LxrDIsmNdOxpl+8n0kTCDKc
 /nPRblX7ss9apf9psAaD0s73D7jBwGk1cTgU7oOwBNmTHwKFvoScXqkB3NGbV4oE7BImGgZLESz
 ClahtTzJr5QMxTZimZHznst9gs+wNa/4=
X-Gm-Gg: AeBDieuxe92oVzcs/3YKC/lArzz5Y0y5KLBj/TlwcoC75ZRP+Lgiofr/9KXu55eGQ/q
 CkDSaZuQzVHgyV019sA1/lQP4zWL5egy0EkNKmXD9jt8AN5IxIRPEaUK4NulEf1gvfJOyrM9+YN
 sqdndJB/IS8NiQZAIFuIJFhmYWSuFBQYSdENlUJgebXDM1cYhQiMokPL2z4RYkahARkXEbWgG96
 /RsleZOk6P/Y21X0PPJIFwwOl2UjZAW/sVgjEnvwwgC8bwX79J2MsYOaweBTJhKcBYB80I12bFn
 OMRRec3Fdg0Sl6nqhcrTLMOniPIuEZzGUI+Kpr3CHCmsjS7HD0f7EfqwrmLWIEI/N6yPWQ==
X-Received: by 2002:a05:7022:6183:b0:127:def:dd72 with SMTP id
 a92af1059eb24-12c34e451e1mr3444425c88.2.1776099437584; Mon, 13 Apr 2026
 09:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260413062153.4050981-1-sunil.khatri@amd.com>
 <20260413062153.4050981-5-sunil.khatri@amd.com>
In-Reply-To: <20260413062153.4050981-5-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2026 12:57:05 -0400
X-Gm-Features: AQROBzCbjzhae-2I_6hMcgzGZK3yu8EecQVnhf74kDWX68ZJmfut9rE92Uz9Qxg
Message-ID: <CADnq5_NYG21JcqnGqXpwi9W+cOyB1+jv+GO7QF3rTaFBVAGuew@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/amdgpu/userq: use pm_runtime_resume_and_get
 and fix err handling
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunil.khatri@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 08D803F055C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 2:22=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Use pm_runtime_resume_and_get instead of pm_runtime_get_sync as it
> return error but put the reference in the function itself.
>
> In goto statements we need to drop the pm reference too.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 76badb4d4a81..6a635bb8bb30 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -734,10 +734,9 @@ amdgpu_userq_create(struct drm_file *filp, union drm=
_amdgpu_userq *args)
>         if (r)
>                 return r;
>
> -       r =3D pm_runtime_get_sync(adev_to_drm(adev)->dev);
> +       r =3D pm_runtime_resume_and_get(adev_to_drm(adev)->dev);
>         if (r < 0) {
> -               drm_file_err(uq_mgr->file, "pm_runtime_get_sync() failed =
for userqueue create\n");
> -               pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
> +               drm_file_err(uq_mgr->file, "pm_runtime_resume_and_get() f=
ailed for userqueue create\n");
>                 return r;
>         }
>
> @@ -745,13 +744,15 @@ amdgpu_userq_create(struct drm_file *filp, union dr=
m_amdgpu_userq *args)
>         if (!uq_funcs) {
>                 drm_file_err(uq_mgr->file, "Usermode queue is not support=
ed for this IP (%u)\n",
>                              args->in.ip_type);
> -               return -EINVAL;
> +               r =3D -EINVAL;
> +               goto err_pm_runtime;
>         }
>
>         queue =3D kzalloc(sizeof(struct amdgpu_usermode_queue), GFP_KERNE=
L);
>         if (!queue) {
>                 drm_file_err(uq_mgr->file, "Failed to allocate memory for=
 queue\n");
> -               return -ENOMEM;
> +               r =3D -ENOMEM;
> +               goto err_pm_runtime;
>         }
>
>         INIT_LIST_HEAD(&queue->userq_va_list);
> @@ -865,6 +866,8 @@ amdgpu_userq_create(struct drm_file *filp, union drm_=
amdgpu_userq *args)
>         amdgpu_bo_unreserve(fpriv->vm.root.bo);
>  free_queue:
>         kfree(queue);
> +err_pm_runtime:
> +       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>         return r;
>  }
>
> --
> 2.34.1
>
