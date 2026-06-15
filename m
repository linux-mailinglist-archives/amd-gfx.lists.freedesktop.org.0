Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pKnxGtwFMGrGLwUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 16:02:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 353F3686E6D
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 16:02:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eQyKNOHp;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35FB10E06B;
	Mon, 15 Jun 2026 14:02:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7982E10E06B
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 14:01:59 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-306f1213aadso292876eec.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 07:01:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781532119; cv=none;
 d=google.com; s=arc-20240605;
 b=cgJkb7r5ypybdm2GfYeKelJr6tyJ2UVznGDZ74E/hWQIZZ+AhshhpQyVtyPiM7HNxQ
 xNDuHVRynaIl7kcgGMrLiItAEztirz+wflMzkysCg1OOtPNJmEaUO350dsplbTNSCHpD
 KgtynzYzHsJHp///6IfoLJm1VK1UEWD4vU5MnVbxg0eEVzJvEFSLd/MdQvYzmGPtPqlD
 epybgg7oLgXXycI4B8B4J0F5I8UiwMuvEMsoTg3mcklrffN0oKEJVz2RTdBQiBQpunaV
 c2T8nN6zAswFn/oC542jvvFpzc2i/GMyQTR4sbdjGTvojv3+I0sW28mlZDOxgnBvJ5Zf
 L8kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hGWPV6O98ELzCRUl47OrdL737TmXEFUIflcCizDApvc=;
 fh=/jXuF6kkEzGc76I89MWDwYajZhHhstOH8SMMdzCQivY=;
 b=L4g/Q+uNykiZpsvGXlDvw0aJKsqRPuuPXRVwa5Xs3v2DDJq4HMjEFwpcK72Sy14tZO
 o8A4DiOLIfSHX0m5h28I5Edt7sYSrNAAuiLW+1FtxdRvU0EDlkBvD+Tu93e7JHg9tdJH
 jEXgXqaWvwJE8MJwlBwB7jLTQQL/6W7TBe2SvLLobfPNz5XdFgdwTCi9XBdo9xoUa+7c
 gaBXdMJIOBnSNoOb5bm4Yr8/Aw2PFE73rYhyZKRzE1jhyRrSQHTucQcTPpgSzeqOhS1W
 ihAWUYlhRVXAesymPjLL1jW588Flr/bTxfDDdDf33lSUHBNrjmRMb+NwGghYLRw2jSQ6
 mHSQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781532119; x=1782136919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGWPV6O98ELzCRUl47OrdL737TmXEFUIflcCizDApvc=;
 b=eQyKNOHpviIWSyHErySvZrjhNIwnrX8BBGkvsfpwcWZZksRydK7vgVTvjQVrbdtXsn
 m3j2587wswkjxOHII3m3rzcpI29vjsnCiRL9/ALNJU1osYw/p1LR9hO0JDIqL5rqgikO
 sYZBccabt5vEGQInUgIOVGCfG2tBRghL+qJQjlO6W/wauskgnv8svMXdayFctNIT8DPp
 R37SL+VXtbP4xtLdh6jJ2XinMC+gw4kTcvYco4Yh5mBXXQfUkDMSXArQF8c6CcvPnfIN
 Lfm2Gi5CVTXMSzcyOdHW/nBvScSZ831WPW8IsTIR9P7FoWDaRGxqPKRxAxhwTvE7YZSf
 5jxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781532119; x=1782136919;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hGWPV6O98ELzCRUl47OrdL737TmXEFUIflcCizDApvc=;
 b=WojH3sHH3gBC3tY4Sd9fttb01wy3mEP4cEtzYW/e1vtxhES6GRqppN0tokKgCxGKyi
 LwB3XrYHtTh7b1SZxmUOckNKE4xJBmMDSyEOnleLYnbTyOq0rxwzd0Gt5ibvIP4B5+jk
 s6IP/7Oeb3ALapzK3k6J4WtWx9HReQsifhm0hNW5fCZaUK76+lO/5FoOtAFUs2Onwes9
 FhVfW4ch/BYwATRWKcUF12ZlUjPb+viKidxeLA6L59pu+q6KJTNVWch7ZGgOg0zTyVwA
 adzEuXbOMhoAGFb/qhins2xsFDTyl5cW9DLMGjz9grnKR/v3jqAPWVw6yX/n/gkdQ1AT
 ewFw==
X-Gm-Message-State: AOJu0YyWHqUjH/WK2JeIY4lADHL2Vh6gub2Vepwg1xpqBX3lpVDNd/3U
 UxuvoKPh1D8113YR8jER5IsH1mXAunkRIobdeWHLa6mIn5MxBPsiMHooEPpd5efz/GzUZ5ZrzR+
 sFgXvpnnGNG5Jwwq01ucd46u1eK3GX/4=
X-Gm-Gg: Acq92OEog8eFpH3Mornc7rtXGHzyf5EIfoRQBVv1/q4b5UV5Hu3nJhWYSAmvdi1zqwj
 /w3qdBSuLWoIsFknrv/wcnyqsPuQHs1yeqRryQ53WtF+Lab6du2797meqe6mgBW7teml0aEkFhf
 Z0HEhareHw6KKgj+16ITUYnHWO9UVS1/H3Upp7E9H6zqXZhvuB5qLGiCvOw7SWIyk2wvfPxgUxW
 nmicxMlQlAldoNNw1K/OdlriScBw00DIptwgsTKRYzkwBTSA9qUbUUtSNSHYdwSlIyBd32Gn9L0
 feP936bet6vrkLTJX1R2N7ohqn9n/3stNwX5q8LMjcuilRaOeSS/dNRCLSRWpskwLDR03Q==
X-Received: by 2002:a05:7022:38f:b0:134:d037:aca3 with SMTP id
 a92af1059eb24-1384bb9ada0mr2909001c88.3.1781532118212; Mon, 15 Jun 2026
 07:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260613020724.1131374-1-mario.limonciello@amd.com>
In-Reply-To: <20260613020724.1131374-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 10:01:45 -0400
X-Gm-Features: AVVi8CdtiUKqULCem4YnAk_JhhtEN1iVgT0roym1AOUIBFIsQhrinM6ESfM2ez8
Message-ID: <CADnq5_Mvwpuom_YCTsCaNyhsfZeoj4_NDrHmzd7-gM9vHhqhsw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: validate CP_GFX_SHADOW chunk size in CS pass1
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org
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
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mario.limonciello@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 353F3686E6D

On Sat, Jun 13, 2026 at 8:24=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> Add a minimum-length check for the AMDGPU_CHUNK_ID_CP_GFX_SHADOW chunk in
> amdgpu_cs_pass1(), matching the gate already present for the IB, FENCE an=
d
> BO_HANDLES chunk types.
>
> The CP_GFX_SHADOW case previously shared a bare break with the dependency
> and syncobj chunk types, which do not dereference a fixed-size struct. Wh=
en
> userspace submits this chunk with length_dw =3D=3D 0, vmemdup_array_user(=
) is
> called with size 0 and returns ZERO_SIZE_PTR, which passes the IS_ERR()
> check. amdgpu_cs_p2_shadow() then dereferences chunk->kdata as a struct
> drm_amdgpu_cs_chunk_cp_gfx_shadow (reading shadow->flags), faulting on th=
e
> ZERO_SIZE_PTR and causing a NULL-pointer dereference.
>
> This is reachable by an unprivileged process in the render group. Reject
> undersized chunks with -EINVAL during pass1 so the bad submission is
> rejected before pass2 ever dereferences the data.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Fixes: ac9287055ff1 ("drm/amdgpu: add gfx shadow CS IOCTL support")

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 0416827b4bb45..d63fbc7c568de 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -248,13 +248,17 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser =
*p,
>                                 goto free_partial_kdata;
>                         break;
>
> +               case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
> +                       if (size < sizeof(struct drm_amdgpu_cs_chunk_cp_g=
fx_shadow))
> +                               goto free_partial_kdata;
> +                       break;
> +
>                 case AMDGPU_CHUNK_ID_DEPENDENCIES:
>                 case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
>                 case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
>                 case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
>                 case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
>                 case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
> -               case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
>                         break;
>
>                 default:
> --
> 2.43.0
>
