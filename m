Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aK37Fel8TmoENwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 18:38:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD54728CB8
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 18:38:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZiW35zgK;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783110E610;
	Wed,  8 Jul 2026 16:37:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9802510E610
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 16:37:58 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ca158f02ccso2119095ad.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2026 09:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783528678; cv=none;
 d=google.com; s=arc-20260327;
 b=Q8GCudqnFVPGL0C8vCVkuhDZSmnVI558RfV6hLAbM/hphwmzRFZbmcSDRXYxOJRALj
 xzie3Hjkpme0OP7GmJ2yLqakaUYN5natwGnQiOZZAMSlhYhwUo/s3CO4QDZbflQgYZCu
 tS6TOg6SP1cDIPtxFppTCSwz0ZkIFjBaSbTKkrTM7RVPflUokL8SdNFWMktVx/NvoSM6
 CAwCzLZnUMtQEnLeCU2TiTt7T4DRQevvAnXYzZ2ol/qNeQFNXkm1fBbbliMHl57cZPeo
 aTzs6N6n/iy4vUQ6gG+Qqj5LQeFUeFNkenzAlZ218dWDBlQK5X2OJXR3ddj7entrzNL6
 q3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=O+k1DtIfODecMZBuuMrDA3K8Rvaf/rK8i68Y3WYqXzk=;
 fh=v7O4HYppFXB3U8ILbHr4qQKDumXuByEIEcfjhaAOxgM=;
 b=h3TW2FlYY284n4z+bMR7nyCvTKiqAmyTXEpGj1z8uDPJ1kCO3/SOjNw+OOmUSsp1oN
 wlgynnIANYRxvqUlOP/HlK0KwpKhfuNe5Eh241kSntEe1bRGmNNDw+d3Rbi14I9nqNn0
 1boB9L4k7gVKS/0OnVOI//0D+wcgbT8YYlhLSfO8arVcXl3Me2fZ1Wl/TJWiLsYcqYk0
 B+wfHGzijzcl1pjIsmlI3N/0tDBG2mfg8ezd2zZpMk1RiKENkGzJoQ2tGBKpfUEUmEax
 40OWabs7aGj7q/Nf2XZfe2tIUZ2qn67An04zamtKEa5pXI0+YVtgQS6hcnOM+6tGCNuc
 UUMg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783528678; x=1784133478; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=O+k1DtIfODecMZBuuMrDA3K8Rvaf/rK8i68Y3WYqXzk=;
 b=ZiW35zgKCOpyCrXKtP0d/H6Q5te2a+L7FnZXp3Znm9NYvXuoyp1a0cQVM7DZBJ4RXC
 9saPiimvjS1y3eroi+4ecksFG/Hu06WPKJGBrBZNuFBkiQ5xxOV7cbiDf8e5d8I6pHAd
 w250oetYbEQqkFkpsVVMN4UpREO+FQUj+lbgwlOCGFdPXDM63WTxc0Aj75N+rYToSwkM
 vaziBsRdkOIUAxjG5ys3jCciBbSloS0UWgfsbiRq8x8ZKFal8XGsHMuCwCLyhizpVMfx
 FDX/cZ5ZeRgmvVxOWjtM7UdQPJf/Oc3iL+UJRPxRCbRqTDOgnZdCU1APuqubwFxqJfqW
 S/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783528678; x=1784133478;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=O+k1DtIfODecMZBuuMrDA3K8Rvaf/rK8i68Y3WYqXzk=;
 b=OSwcoT1ZzshsxyL8UVYhX9uMqNDkra/4a9VJ8KR/UcDyZQ/J8noBl8bGkCLil2noDg
 7o+tOynVPnzhymxbFC5tkNYb8SPGBsonaTARy8l+847AYMhxqYMmvjEP8wuyyHKHdqTj
 VVUJOGvfhvrBpSy8E7hVUHKmx5EmSGkb6fy0jqqTMLaZ5wV946eFFNUkweiruzUGBw44
 Pt4Kvkr2LUcl+EdIrDsi0iKnWybXZy3FOPjxbtR+OO3AHl+OQEehMARJ2zTgl+0pU28a
 IC7yLbvEDwwRHvv3RDwEwAs7MMUKXqzlKjfrlp46EBxByjE5TG+dlQd23yEmR0VbkhXl
 nLBA==
X-Gm-Message-State: AOJu0YziKOGsYt3f08NIC3aGlgF74IZ1YwkYh9w6MQgAvfZxA8+QNJye
 JYCJvxZHItsyPub1fIMZeQpAYyOiXOCsif3OJjlBc8YQ44wvhXTaNHkaKrTat27H+mseCW4wWg2
 nnbb7MUN/PqzkAkZrlFcSMDWnyCXdjPo=
X-Gm-Gg: AfdE7cnHostgwvSR/nfbs1nvcUleAQoC50AZnBbXAuuxWtI/F0OpVj3IydYAh/8bbm0
 uHQVCOyffl3o6dGkt3YZvwC6BAg5X261jKiL5EJzutJj892gsUtwH15zkw6OrhWzHlhbQe4YFQy
 wGm+mUuK6Y1JJ39BvZO5Dm0FzWnTcuy8B5za/BuxgFyF/rIMHYI9lZ5O4om9iMNHoo0WbyTCth7
 W/Rk7OMCX8rqMcRTtxZC2PHgD5tRU24yNneb4bMplyM/bzaFEnB2AqUWWEsGbJBKd0bm6OIDxxZ
 rKZqGQfYeX3B5nBSdyBZLrZkDJC93fu8RFxItV/42JY9+yGpNIyiBOoF/0mz5fv4abPYGA==
X-Received: by 2002:a17:903:1a43:b0:2ca:dc3:5aa with SMTP id
 d9443c01a7336-2ccfebd2ccfmr2220925ad.2.1783528678007; Wed, 08 Jul 2026
 09:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260704101120.674980-1-john.olender@gmail.com>
In-Reply-To: <20260704101120.674980-1-john.olender@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Jul 2026 12:37:46 -0400
X-Gm-Features: AVVi8CdE8f-kr7Q3by_7MQSnLxqzJaxOEPS3IOAGGli69HMUD-KFBRSdwu9UGrc
Message-ID: <CADnq5_ODf=T4VD9_RptQaEtJr5Zinsom8jW8GJL56GN6shvJsQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Remove vbios bounds check from
 pp_entries_max()
To: John Olender <john.olender@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, kenneth.feng@amd.com, 
 alexander.deucher@amd.com, asad.kamal@amd.com, lijo.lazar@amd.com, 
 hawking.zhang@amd.com, kevinyang.wang@amd.com
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:john.olender@gmail.com,m:kenneth.feng@amd.com,m:alexander.deucher@amd.com,m:asad.kamal@amd.com,m:lijo.lazar@amd.com,m:hawking.zhang@amd.com,m:kevinyang.wang@amd.com,m:johnolender@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADD54728CB8

On Sat, Jul 4, 2026 at 6:19=E2=80=AFAM John Olender <john.olender@gmail.com=
> wrote:
>
> The soft_pp_table is not contained within the vbios when using a
> pp_table override since commit 3cfe433630508 ("drm/amd/pm: Use uploaded
> size for legacy custom PPTable").
>
> Fixes: e30b3e3ab51ad ("drm/amdgpu/pm: add pp_entries_max() helper")
> Signed-off-by: John Olender <john.olender@gmail.com>

Removing this will effectively remove the bounds check from tables
read from the bios.  I don't think we want to do that.

Alex

> ---
>  drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h b/drivers/gpu/d=
rm/amd/pm/powerplay/inc/hwmgr.h
> index 7ebc1344023ff..19023a850e882 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/inc/hwmgr.h
> @@ -833,14 +833,10 @@ static inline uint32_t pp_entries_max(const struct =
pp_hwmgr *hwmgr,
>                                       const void *sub_table,
>                                       size_t hdr_size, size_t rec_size)
>  {
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)hwmgr->ade=
v;
> -       const char *bios_end =3D (const char *)adev->bios + adev->bios_si=
ze;
>         const char *pp_end   =3D (const char *)hwmgr->soft_pp_table
>                                + hwmgr->soft_pp_table_size;
>         const char *entries  =3D (const char *)sub_table + hdr_size;
>
> -       if (pp_end > bios_end)
> -               return 0;
>         if (!rec_size || entries >=3D pp_end)
>                 return 0;
>         return (uint32_t)((pp_end - entries) / rec_size);
>
> base-commit: e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
> --
> 2.47.3
>
