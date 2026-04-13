Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKBbKkMy3Wn1aQkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 20:13:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9BD3F1DDD
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Apr 2026 20:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6006810E4F8;
	Mon, 13 Apr 2026 18:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pQD+tzXw";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6963B10E4F8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2026 18:13:20 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-12a70b4de9bso377099c88.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Apr 2026 11:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776104000; cv=none;
 d=google.com; s=arc-20240605;
 b=XtQXHy3/ZBoYD4YZAAg2sf+1umH8T1v/Qj2A1OfbuBydo+GuthVw3414BwRDlQeMBz
 25Z98wqCh43OaGnZs7tworwzrbDKy0Fi/s1TP3QBTf+wu4Vhucj7Anx4bzexsV///FmP
 pCIq+lvQ6P7VikX599W67xP/S4MaoKfvGQumUMlOZ2SVve5V+lBWIRzdQk3zRpqZDIpA
 vA1wxjljzd5kPSir+4HhPgNeYsb8h5NGfYz14XCg2EhkLXS7IJ6yv40shoq3ASC5lKNa
 YbSd68EKd8JbKlufUMUNPWSvMYCVetHfFqJfFh4SPQtVQZ3ffGV+SFuc4wYrmIMook3B
 BVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vVVKoC6M8szpkspBmPFev5bUvMCnmAWZCFxFeRDtvro=;
 fh=GU15h6YqVqFwSK37ykuGGupWCqZWn/ypLR/uQ07U1wc=;
 b=Ck3u1EVmeDpRmRYciHNqARYRcZO8Fv6iakRucAfMibiIg3+OvQpcaJxGxNMoaq1BoY
 uYyvrXFnIuSBr4Oz/Zy8m9xCReeY+B6G6vrdsYNcuJ0cPPFW7F6MzofzQAROruOxl7X8
 2Zj7OFt13k2qHDXt819z5ywvFW2PfcMCP7lnzMJ/rEqYgUTnFlUCl6uw+bZrvSA+Z7Na
 qy4eXdrMq3ZDaghxS88cBCII8jmqgJ8dcTLVNgu9fBNsQe1AIHeocvM8T4fT5LbcNG7q
 z+Jc5aRYfPq927aQbMnVRMLwubcQoRCMWQBTe4VNPeT7GBM5tTF5F1MpYGd+uYyWXdf0
 DXXg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776104000; x=1776708800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vVVKoC6M8szpkspBmPFev5bUvMCnmAWZCFxFeRDtvro=;
 b=pQD+tzXw8SuQyS05iN0r4bSGggsgngv5gj49tjaQIBj1MYprSd3724z9RC3+VNqDHL
 J/MbpsyUJx5ti4pCjxE0uZb3Q0BaxoCm5GMevB+i8qpwIzUu9x2RmnBSIR0TZKNtlFLl
 IEhrMSQOQAKYZ+NiX0RR+l9tj0VS0KQylpXyfavy4+fF1lvNhluo1aMj6gP6KEfRrXU2
 BC6e43KtlE7f1LqgdZU0s5dnUgUKHalC5iYKo+jXf60Vq348DIafqTZuc8BQnIrJknx9
 XbGBJoqUfxR1KYTPNO/nw/sdJxmorl4fksO9bTnhw4RMZZCucLBu0gmcL9IkGU+bvsz/
 tDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776104000; x=1776708800;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vVVKoC6M8szpkspBmPFev5bUvMCnmAWZCFxFeRDtvro=;
 b=Au73TzD/eal5Lcqzf0xyYSrknFspXGVRsx5+Y4Id7omNYxdzUOtCtNkv59grGAS1DJ
 DR7C2wvBZ0Vf0FHfVW8rpUsSkle5vGufIMiytJMCHx3KJtXqtFsRf3tu0+319fUmaglw
 u9S5F9x8ITt8Un4kD9BlrRyNQTDy9zp0Io81/vUr9UWzQTlQcrByDVnNHvLi9qmH2v8V
 oZs+EHJqgk7QW3/U9RFY2dzKcb1pmCdQ4HJqH0XnV7snLcXfjZkYzU1cwTjQ3JjuT4Qf
 m7i2g1L2U/5E1dunDO1iLoSclgfK2A8NifjzpbyB0DpZKTwBRIVmbf/xRY47yr8BHxPa
 a+xA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AX4lh3/ndllgWcWjwbwqCogB/QTmRAv22td3nXjaJGguWmuM7gjSwdThDSHBnlTIam9qwBgR6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3j6f6S6BfmNUtlfEJiCNbONYJnBqSylv7E0uhF0h6Fis6KFrC
 hIRh27W/TI7I8OuTHcpxXBWeVODR5vLxlvyRoaQIgtoV4ZIyGO6okaHJ8LdAOHYT2pE43PzEsGY
 RA1m3CRNnRFlh5J9vy0SFE6fGPEk0JT4SY99O
X-Gm-Gg: AeBDiesMxsp99tY4+tg/sLq2kvaZCXzIP4sHC3la2oGPY8uZXvoUzvHsJl0P24FPYb7
 UyjxTYntkgiSrN7fj9rAEYMJJKz54rAN9c5uyKSIWiiFieFDeqAJS3Xc2E/9hbcwaRo00p/q3+3
 Wavk1erDi9mj8VzNYDNUjo1Ci+7brecMCr28pqGHCdMxHaK7MpekbjelWxc3r/KCKf7PCQkPi7w
 CDZBRx93xwCK03On4egiYlAwb6GbL1cMnDbWyIuaNi8WoTLkiisxXj50uRZ701s8Mz1t/cXvaIi
 PFDC02lfRJNzRcfBW/IaINrFIso6wBIgZPWxrEASM+jS8eZEwnHsu/aIigKC/0AY2gzu4A==
X-Received: by 2002:a05:7022:672b:b0:119:e56b:46b6 with SMTP id
 a92af1059eb24-12c34dbed15mr3119305c88.0.1776103999545; Mon, 13 Apr 2026
 11:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260406225008.2787532-1-werner@verivus.com>
 <20260406225008.2787532-2-werner@verivus.com>
In-Reply-To: <20260406225008.2787532-2-werner@verivus.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2026 14:13:06 -0400
X-Gm-Features: AQROBzAVudQT9b1KEMIQwaqVTOGdwq-wFQfJObhPf6ovAb3esDyy6cLWlE6yctQ
Message-ID: <CADnq5_PUEMT4n3ZpBuZH0A5QRZdwLjXAGCAnc6nM6CW5td8LmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: fix integer overflow in
 amdgpu_gem_align_pitch()
To: Werner Kasselman <werner@verivus.ai>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:werner@verivus.ai,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,verivus.ai:email,verivus.com:email]
X-Rspamd-Queue-Id: 1F9BD3F1DDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 3:41=E2=80=AFAM Werner Kasselman <werner@verivus.ai>=
 wrote:
>
> amdgpu_gem_align_pitch() uses signed int for the pitch calculation.

Can you convert amdgpu_gem_align_pitch() to use unsigned ints?  The
width passed to it is always unsigned.  That would simplify things.

Alex

> When alignment rounding pushes the width to a boundary value (e.g.,
> 2^30 for cpp=3D4), the multiplication 'aligned * cpp' overflows signed
> 32-bit int, producing 0 or a negative value.
>
> The overflow guard in drm_mode_create_dumb() validates width * cpp
> BEFORE the driver callback, but amdgpu_mode_dumb_create() bypasses the
> generic drm_mode_size_dumb() helper and performs its own alignment
> rounding, which can push the pitch past the pre-validated range.
>
> A zero pitch propagates to a zero-size GEM object allocation via
> amdgpu_gem_object_create(). The 0-byte BO passes
> amdgpu_bo_validate_size() (since 0 < man->size) and is returned to
> userspace with a valid handle. This object can then be mmap'd or
> referenced in GPU command submissions, potentially causing out-of-bounds
> access to adjacent slab memory.
>
> DRM_IOCTL_MODE_CREATE_DUMB requires no DRM authentication, so any local
> user with access to /dev/dri/renderD* can trigger this with e.g.
> width=3D1073741760, bpp=3D32, height=3D1.
>
> Add an overflow check in amdgpu_gem_align_pitch() to detect when
> 'aligned * cpp' would exceed INT_MAX, returning 0 in that case. Add
> corresponding checks in amdgpu_mode_dumb_create() to reject pitch=3D0
> and size=3D0 with -EINVAL.
>
> The proper long-term fix is to convert amdgpu to use
> drm_mode_size_dumb() which centralizes pitch/size calculation with
> proper overflow guards, as is being done for other drivers in Thomas
> Zimmermann's dumb-buffer series.
>
> Found via AST-based call-graph analysis using sqry.
>
> Fixes: 087451f372bf ("drm/amdgpu: use generic fb helpers instead of setti=
ng up AMD own's.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Kasselman <werner@verivus.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index a6107109a2b8..b4341abba20c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -1246,6 +1246,15 @@ static int amdgpu_gem_align_pitch(struct amdgpu_de=
vice *adev,
>
>         aligned +=3D pitch_mask;
>         aligned &=3D ~pitch_mask;
> +
> +       /* Sanity check to avoid integer overflow in aligned * cpp.
> +        * The caller (drm_mode_create_dumb) validates width * cpp fits
> +        * in u32 before alignment, but rounding up can push aligned
> +        * past INT_MAX / cpp, causing signed overflow to 0 or negative.
> +        */
> +       if (aligned > INT_MAX / (cpp ? cpp : 1) || aligned <=3D 0)
> +               return 0;
> +
>         return aligned * cpp;
>  }
>
> @@ -1273,8 +1282,12 @@ int amdgpu_mode_dumb_create(struct drm_file *file_=
priv,
>
>         args->pitch =3D amdgpu_gem_align_pitch(adev, args->width,
>                                              DIV_ROUND_UP(args->bpp, 8), =
0);
> +       if (!args->pitch)
> +               return -EINVAL;
>         args->size =3D (u64)args->pitch * args->height;
>         args->size =3D ALIGN(args->size, PAGE_SIZE);
> +       if (!args->size)
> +               return -EINVAL;
>         domain =3D amdgpu_bo_get_preferred_domain(adev,
>                                 amdgpu_display_supported_domains(adev, fl=
ags));
>         r =3D amdgpu_gem_object_create(adev, args->size, 0, domain, flags=
,
> --
> 2.43.0
>
