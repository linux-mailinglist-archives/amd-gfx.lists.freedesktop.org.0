Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFd3Ny/u/WlJkwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 16:07:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397BE4F7907
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 16:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A68410E5E2;
	Fri,  8 May 2026 14:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dfZ8ANVK";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F31710E5E2
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2026 14:07:40 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2eeafc50c87so149778eec.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 May 2026 07:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778249259; cv=none;
 d=google.com; s=arc-20240605;
 b=SwG5Fy91D9R3+kknDrgiAW/Gkh1qoXtSJfHNWZFQD9LgqnJTuSRAq0T4X4jyVW2Por
 HgxzEnOGlkDNoeEJBjf5WvyuftvmlsO4XffUCR99jsxjfHBDmiiAs4eSmaIkyge+Lp7C
 rMNSkcC6uGCfIqZCvPGaaOJ1gChGBoCT51uURt+RPHFFzq6udjog6hm35hx4GO29deil
 9vygmzPIn1BusGGxuWXncU7xizJOQj7aKowT6xixRvRY44kGq4nnquRxLoQWPFOBq/Vm
 4BJBKS6tcul4TeoKw07ZTEnXMltk+zRNtCwR/i9IYMze69QcMJ1L+3Rt49wQ2mX1jafU
 3h9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OWKVi1tbC2z5Okn9L1nkfgnz1z9pqgvimn6uEdDTLHA=;
 fh=SzwJ8M4vuZOafN9CbziCPTZVOheyUSbdXs8RxOMZby4=;
 b=lCbup2hVQ4KF9LB3UVSb2TXX+fES3jvvMCPam8o0Teh7rI1nBz7I7DBdXdL3BE8UT/
 r+c9DwalguYcv9KuQGT0jSuVMFETGqmV6vnumLpE+Fquuvf2SooTV6ID1z401cheodZI
 EczZZApI/sKOCuxsc4czTB3qMalGEdAedhc1/v+KZhiKApGDYA4TAVkpvIrgMaGrAZj2
 OrX/Cd/Ygds1ZYqiF8nh0wRn7FYwmb17XmqZm2DKV4nGD3dTjHAB6SwAgI9QHLtiewoQ
 Z8HLIsQ5YptSODBIysmwohi10mxxaBil/yg3jPfyMBH4G11x409p+OkJdrFmZht4JoYz
 jVwQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778249259; x=1778854059; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWKVi1tbC2z5Okn9L1nkfgnz1z9pqgvimn6uEdDTLHA=;
 b=dfZ8ANVKkBFpS85xNmnGVfDHHUehX0s9Wzn7CYVZG/TCybNttkdpXxNMUFE+NWQz14
 USrvsbzXT1ash84BVjBfIL6gLx+D9IoQY4DQCGfkiQpvui+Lt4jx1/8iv6zbb8or2I7G
 H5SeiuVYOn6CRGLbGXPozrQBWv+UfD8gZT4xcAGaiQjEhPQh/W2CLOch6emrO+6kr3se
 v/8wzkLEphZjAbZ6eE1p7rbn9DvqxaLQ4vkR7cAevzg74trJvhDfBitupJTj1eNdSWRl
 9XNpyTXPchetZ4vo92O2xy7Y+XKZymIgtkQoMWBGfo6Gzjogf0GOUyQqQKIJgH63dInG
 QUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778249259; x=1778854059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OWKVi1tbC2z5Okn9L1nkfgnz1z9pqgvimn6uEdDTLHA=;
 b=NF9O+pJhvZg6Zf79Vn9p4VgZJe+/4Y2QJUCeeE99qGqy4x6NJIs7sCHiF08DS4EcFm
 RXBFF8d0m88940+o7t/Y3zyvbF+M9rcaP4mDI6EHenqKkBgQTaKvJYo0pf89cAT+teF5
 QRAK+J56ayauFyokSqPM8h77ZhCMchsMxFs+Q9tBUl8ySqBG0PXWjsR6YZjiyq0yMwGO
 Pn37aGuQio+1BzvBg1jOqqZhjQ1AaFXF2WIdzX+EPi8Ee78PM/YfMGVAUGw3r/e9zTwW
 N51ENiAtoP5BxKO+dvqTFTLbgRZ8kM9uU72GgxYgW5+7PcJhIAVUg1G/9nYPVYOvPTY2
 yedA==
X-Gm-Message-State: AOJu0Yxh+T6Y18I1oKE7SmB70/rilOaH6yJRLnXMvGjiWXlgjSUMKWyb
 xHvpnnJ+r20PveNI7MfDsRWFqlRTRsjoE9Ah4oVyO5WFCszu9eRPdX1ZvepWCmoc8NudRHCILE2
 oqbSvj9eFMBfNp3GiBrY/nIE5EUVHr2YM9g==
X-Gm-Gg: AeBDieugXFNM8YA22CpHxUNb4Irar+7V8KWcoSYykLVapgkLedesedpGonfjJYMtDoz
 PU0SPa04TKqyR/fFz6j61f9fUUk00xzHHleUg4GkeN7l3a7UEilS0PSv3DN1I3iGkJI/ga5lcBx
 zOWw6lT/E20PXNQmGiMOukYx+A0iWZLUrtCzmsjDsMHcLapEMvtlTkmuBHmwCVQBmJablhn8XWN
 xEM2BVjLwOF4wwCJWPsUww7vn9KXwA/gbjXw+vUjI7xy7GIXTmuCjFMfLQmrI+UdRx18kcokszT
 YjOTUP1EqUUQK9kse2lQWTHsa4PgomA3fYTvcajI99bUmB4eTn0Vg5ty+lYECcaCJ0q5E77pcwR
 cpy2t
X-Received: by 2002:a05:7022:226:b0:12c:888b:aaab with SMTP id
 a92af1059eb24-132030ecb31mr2684798c88.0.1778249259353; Fri, 08 May 2026
 07:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260507172946.2048931-1-amir.shetaia@amd.com>
In-Reply-To: <20260507172946.2048931-1-amir.shetaia@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 May 2026 10:07:27 -0400
X-Gm-Features: AVHnY4Iz11qv_Ljl9MO8K0eoOE0dAKGHeIkhD9eshAqH0qGxBDZAx-lEZavdgIw
Message-ID: <CADnq5_OUDbj9WZQW6uqZWamXeNf+RMu63R94bUVLj5vQq6kMSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: reject non-user addresses early in
 GEM_USERPTR ioctl
To: Amir Shetaia <amir.shetaia@amd.com>
Cc: amd-gfx@lists.freedesktop.org, harish.kasiviswanathan@amd.com
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
X-Rspamd-Queue-Id: 397BE4F7907
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:amir.shetaia@amd.com,m:harish.kasiviswanathan@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 1:39=E2=80=AFPM Amir Shetaia <amir.shetaia@amd.com> =
wrote:
>
> From: Amir Shetaia <Amir.Shetaia@amd.com>
>
> amdgpu_gem_userptr_ioctl() currently accepts any value of args->addr
> and only discovers an out-of-range pointer much later, inside
> amdgpu_gem_object_create() and the HMM mirror registration path.
> Userspace can drive that path with kernel-side virtual addresses;
> the get_user_pages() layer rejects them, but only after the driver
> has already allocated a GEM object and started wiring up notifier
> state that then has to be torn down on failure.
>
> Add an access_ok() guard at the top of the ioctl, right after the
> existing page-alignment check and before flag validation, so any
> address that does not lie within the calling task's user address
> range is rejected with -EFAULT before any allocation occurs. No
> legitimate ROCm/HSA userspace passes kernel-mode pointers through
> this interface, so this is defense-in-depth rather than a behaviour
> change for valid callers; -EFAULT matches the convention already
> used by other uaccess-style rejections in the kernel.
>
> Also add an explicit #include <linux/uaccess.h>; access_ok() is
> otherwise only available transitively through other headers in
> this translation unit.
>
> Signed-off-by: Amir Shetaia <Amir.Shetaia@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 0071d6957828..ad3d371ad7b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -32,6 +32,7 @@
>  #include <linux/pci.h>
>  #include <linux/dma-buf.h>
>  #include <linux/dma-fence-unwrap.h>
> +#include <linux/uaccess.h>
>
>  #include <drm/amdgpu_drm.h>
>  #include <drm/drm_drv.h>
> @@ -509,6 +510,9 @@ int amdgpu_gem_userptr_ioctl(struct drm_device *dev, =
void *data,
>         if (offset_in_page(args->addr | args->size))
>                 return -EINVAL;
>
> +       if (!access_ok((void __user *)(uintptr_t)args->addr, args->size))
> +               return -EFAULT;
> +
>         /* reject unknown flag values */
>         if (args->flags & ~(AMDGPU_GEM_USERPTR_READONLY |
>             AMDGPU_GEM_USERPTR_ANONONLY | AMDGPU_GEM_USERPTR_VALIDATE |
> --
> 2.43.0
>
