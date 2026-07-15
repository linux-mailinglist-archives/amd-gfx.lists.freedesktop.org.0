Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7yIKLhabV2pNXwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:37:10 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E669375F772
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jul 2026 16:37:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s+l2MrFm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F2C10F0EE;
	Wed, 15 Jul 2026 14:37:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F263D10E3C9
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 14:37:06 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-ca6d9c91206so479311a12.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jul 2026 07:37:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784126226; cv=none;
 d=google.com; s=arc-20260327;
 b=mP3/9P9UxGpE0GZsu15ge0f0mRaAQzllrA8M5r1at7XFEm/y35yAGY5nKACoKRGuJU
 jl3O2IWWnxzDNEDZa13JqTQP+KpCnGiv7aJkvp7Cw9+RR4maPqjLeKzzUslAm8xgOspg
 FN2lQk1uOPazxYQLMv36KvNK3jqQPihqa7y3mIaDwxhhbhkbll0XSDv8SDL5J5N2Zsbs
 nF+QgPc0zxuo8cfarCqKrgQWoIuFw5c0ZRIs68jKoTR6G2NZ2J3w8T8R9QnKeHAVtztq
 HwAP5p/FfB48gTdHEqtRJyexFm1tWjdgPhCZZ2aLN1FxKFKcvmoKvNuvR2klI9b/cQVA
 ilJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=RupGTgejPPsyAJhtGHU+brHs2w4IzqjzDjR3stQz2Ig=;
 fh=xCevRrIPVtygaXT6hxdYbjeN5Na4GjR5LMIVgxK/8Dk=;
 b=bGgdfxSZVouM1onc5yEfIGt4ObRfIhNrwFOLcU/CSMcPupaxEbLHWfWRA8mcmt0jiQ
 UvtRtIDTbcGXonJp3A262kWqyFnGe5KqMaIX1rHL0JgQVSlvXmvgfxsrH29FafDSaPLV
 o4M6rpzeO3HGwL5UKHdnewyoEjKLVzVR4UGGFQjJtDk9dGI3oDn16UXln+7Kej9XSKsP
 ZdIcpuXO4UftEjtCvQgqL3zLzr9dEPlFfTCwkczMOkHfm27i960EwrNvDWS6HPjM6bOU
 POasJjl17tJT2ey2e81WcKEEyIAc263Kfm/xXVFuoT96Hi7yrfPwucQxatxFx8+PRhvR
 TDTw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784126226; x=1784731026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=RupGTgejPPsyAJhtGHU+brHs2w4IzqjzDjR3stQz2Ig=;
 b=s+l2MrFmdojBI1A8F+5UnrJc1CPf+A965oCxn8CXs7xvrDB5jOiA8XoF/6/O3XXEPU
 EJQAP93oHsRl/XV9BgVW82VdKyKVZvivd9KaOm4xt2pzrE193IghEidM76uYJH3A5ZEc
 ezblMXzt82V1v08rPu0y1nLwg6AbIkD17P5uvhPMSOP3BwZvPc4n0jUSjYImUyXL1+V6
 1EIxVOzgBAND540DlkLdsPvBmicRsE3ZLDfktsjXKi7PAdEbn7/z+TFaFfL6M2+VUJfY
 SuQxeuW67UQwwb9RvVtxTwBbDhlE7Sh6oi7nAHN+hR93DhwsQYbbfbCr+hhayYeiUFoa
 GrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784126226; x=1784731026;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=RupGTgejPPsyAJhtGHU+brHs2w4IzqjzDjR3stQz2Ig=;
 b=aNhdp8mKsmyAB5LkuJTEsQv40XTW3odksShEhOqKb2M1pqncsvjUgkd5Sp/MTnwnlJ
 EOQIWoygj24PRtT/DqlS1Gx2YD/YDr2P/VriWYLPG4gz0vJU13WDIab9RK3/wVLj+kJ6
 lcTkGmcofDmvg9DOyeiowmgklw9dPpwyJHIZ/1xuMnQpvdQeGVOx6hQblubUSy351qCw
 JG8Z1CZB1Mhrt2AW9xWbmbCi2oabapZiFEIlB5Hn7xZaKRFMsJEybY5o9zDWB9Ydnx1r
 Wlk2J4gNP43XtMIeHyz2KMj8YM7YLwpLVoSQfT2WKcHuld2Lh076Sa1OUuytLG+/JchT
 uJoQ==
X-Gm-Message-State: AOJu0YzKzEGeXrFBVnH/+1uyToKhU1Y0c27QLPcvqMUd4Vpirzw3GiNY
 xz7/g2SjKAZmeNTyO0mRLyhaTpJ+sghjNIWl3N5z7UVtz04h1IyABmjkqfdEtSHUwTifn2pfrTZ
 ZsN4mndWeiorMEODmBOmOXLP7NTsvsqg=
X-Gm-Gg: AfdE7cm7EErN3yANbu9bcUYQrRUjKzBO1vXL0B39VctgyPOGuwLlltjNm7T5rI76K2y
 C+7kqIC9U68DwV6bWoVpLlDDSJTf7NCsXxim1VY3MwohXgi1WNOy15hXcV7jg+RqlzOZrVdmAxD
 sD1K1C52Xi2/7hvsniVEYZzU0YH8M5vAIA/UN3x3luS+W2QYUqmhgD443JIeDtWKhQQgOjFtQWN
 WmyLITjwpDDChKhwodMxiIedQ7go7M86mCKZb70OEWoaab5F5b07cvmu/XQ4TnrZdbQiA2Q8s1N
 6XlmcxeNXQ5sBEdqN5wGsCbzZJFk0BtZnrSMKrrp8ik1eypr4admYHn2sAEXLkda7JBdPQ==
X-Received: by 2002:a17:903:2bcc:b0:2c9:99be:f011 with SMTP id
 d9443c01a7336-2ce9f28e423mr134742235ad.6.1784126226256; Wed, 15 Jul 2026
 07:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260715135518.3947786-1-lijo.lazar@amd.com>
In-Reply-To: <20260715135518.3947786-1-lijo.lazar@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Jul 2026 10:36:54 -0400
X-Gm-Features: AUfX_mzyxnTNOm4t13nvzirMNjU07GVDs646WoYb2OhQQFcO8I2uTL6b3v9gFlk
Message-ID: <CADnq5_PPv1m3fvLZ3LAFjcZ7CMonvdvx1yO15RG2V9esNKyQtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Prefer default discovery offset
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com, 
 Alexander.Deucher@amd.com, Feifei.Xu@amd.com
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:lijo.lazar@amd.com,m:Hawking.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:Feifei.Xu@amd.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E669375F772
X-Rspamd-Action: no action

On Wed, Jul 15, 2026 at 10:34=E2=80=AFAM Lijo Lazar <lijo.lazar@amd.com> wr=
ote:
>
> If a valid signature is seen at the default offset, use the default
> size/offset for discovery.
>
> Fixes: 01bdc7e219c4 ("drm/amdgpu: New interface to get IP discovery binar=
y v3")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/work_items/5447
>
> Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 44e7d2e3e6df..186661c94d8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -334,6 +334,19 @@ static int amdgpu_discovery_get_tmr_info(struct amdg=
pu_device *adev,
>                         goto out;
>                 }
>         } else {
> +               if (adev->discovery.offset) {
> +                       u32 signature;
> +
> +                       /* If VRAM holds a valid discovery signature at t=
he default
> +                        * discovery offset, use it as-is.
> +                        */
> +                       amdgpu_device_vram_access(adev, adev->discovery.o=
ffset,
> +                                                 &signature, sizeof(sign=
ature),
> +                                                 false);
> +                       if (le32_to_cpu(signature) =3D=3D BINARY_SIGNATUR=
E)
> +                               goto out;
> +               }
> +
>                 tmr_size =3D RREG32(mmDRIVER_SCRATCH_2);
>                 if (tmr_size) {
>                         /* It's preferred to transition to PSP mailbox re=
g interface
> --
> 2.49.0
>
