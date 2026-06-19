Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aId0BqSXNWoF0wYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 21:25:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0816A7837
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 21:25:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JmTNVPxl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33FA10E0F4;
	Fri, 19 Jun 2026 19:25:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE5E10E04B
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 19:25:20 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-137e836ccc8so147131c88.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 12:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781897120; cv=none;
 d=google.com; s=arc-20240605;
 b=OvwA5k4bAIUL9WLmpH1VAchhYc+bEUGGpRwoOI56/KOs5l1R17ZBdufO0VcXG0GqJS
 HTEpf6gkML+ZlbrGT5j+xxcILvHCaK7L3HPRlOGFhVkR+jyC8Ufnmj4yXQZHq3La4nRJ
 SWi9S0hG8tCgWPJcvcQHn3W74kKLKDYPZHpEQBylUo7l/Kzc+JHJsonsj85m4RHFlZL1
 cGlPG7As7cCKUGHCuMF2hKiUeqLY5oOwJi+ZAQXVkDyqBjbw1jA0Tlavr05LB57zX+tb
 0pst7yJkdues2zt7TymZ3Zl2flYhXZTnUbgLOfjM5TPJj0aXKi0zrGJ7R1MuCgjhGGMe
 MvVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=fByWRBOxrMvT/M8kORmV85w81Ldzx78mb/KtZbdgxvw=;
 fh=XzVWXv3p8P1Lr43bDTeBz/bNpjcuLsaYL9GQuk4gQB4=;
 b=D5BGtO/okqw16xdAc714DRMcJ5W3auBzxTg8thjhVGm4u+cjxHAnWv9Ktg2D9/cPPN
 /L8h9Q4QOf5NL6A+XlqearMfckyBLXPHeODzWHp465TfUN/0FXGVCLshameUC3NFu080
 xIX3RVmSPh29JrPj5j4LizDVA8FQUrJ4C1TwabhVOgSEBJ7cjWMFU2I+H8qAV9beu7kH
 lts0DM8oQ3TsqcFqL7bTU7WKjYs0popchsffqsB2+Obj4x/OXivXII3KWsf2SkV8SKKb
 Aar40rzEx6DIHP5uJxrq5USybQ79BaYZ5PhKkfZavuLmrRBjhjqIdgkB/AJZe++wLNMX
 WjeA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781897120; x=1782501920; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fByWRBOxrMvT/M8kORmV85w81Ldzx78mb/KtZbdgxvw=;
 b=JmTNVPxlwS2YgRe0y+ZRtG0oxYpdcPJG5mS5hnVDJyetELkyub6cAM8W5sycihLyX+
 GLRnduDMF3Kj8hdv7B+veBMcP/0v94Ynv21hLZ+FEzyTpBQwQN48hquYz84JD093FALi
 2xfQlzIRLLSDjcn+IIimbgxHwwV0pdEfmNNrewJAiH8BJRaev6+x4Z0kauSFnDqrNUvW
 Xyi5AHCc3hbbjSK9bZ9A8vSimuLGGhfcK3NVUbE9Dj+kT4deoqMQRSfl69AsuUgupkmu
 pvhGwviVRgePdN3jZqQpc/9bAvv6rDDWGxuBsb6S/BCjqMBFhVKp6iBNkmgFyI20V0Is
 Q6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781897120; x=1782501920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fByWRBOxrMvT/M8kORmV85w81Ldzx78mb/KtZbdgxvw=;
 b=pFlgThMLuO4DiOBqnLQWoAmrXWjIcbh7tC1sbSZti2c8ATaN47fpMOi0X9mNefY31y
 U5X01kVNiqQ7++5aqLGHct5yWI4qnOJG53B54BricVqTda1FCnn4E+lRH0wgr6H2rMvr
 cpkpVNAfRcIlRt7QXVkX9f6DqYNifaf/5Dq2df1AuzVTPtdy30qtvjYcqJWgrrhTk6Og
 iudljj/UA4imjoJdw9fprkOo3vfgCVqVP77W7mepjy95MR2gIwVvAhdxyQfWdU9DITpu
 hbwD2wpth1Z8mrkU/QoeS+nL5BAi40gPL738rGb+fEEwCGqwQsftAJJsrWixsJt/zVSu
 lr5g==
X-Gm-Message-State: AOJu0YxcyxvzRw871xcIL8fkdj8Cal9aaomFgzbX5TqGhHMiDMiHsOQV
 8gd3dhZ/eOVBE6b/uzYO7EqA102B+4nG+64kqyTFJxLUyarQ6TDubd0PrgKCUCw4JEO2UZmIgvK
 FE3Cr9yTM14u9xxpIkjDEkcg6mRT9M8I=
X-Gm-Gg: AfdE7ckhxeg2t0d0Q8jG+BG7G7kKSPoT7Z4NaJlbT3rKnoBrP82ZcLbyZCbSk0upLQV
 3CSQ6WqP9fUdxFD1OTrZF+TYgyJDYOlSKQ5ogrM6l9f9rJuwPp1agfWq4uvDaaibGgt7ipHaHUQ
 jOhr7lV/LWXepajn4N4eU0+PfVscUyPGjPeoGVwKq7Bs95E9f0VtEMvi3v3hvcJDFw346RQvCsa
 LBPgjg5JHoA7LMxLbqKgVwW9rv7CjrvsiX4XZB5yJlSTI163XP/ss5wcJywagslStqB9s3ERhf2
 RaAnxs+0XFXr+I+oKr/+hQF2/Zry2NcwnY9WL/A7Bz6ehpf8LGNeUqkUEem2GYDJZ4o0cQ==
X-Received: by 2002:a05:7022:68d:b0:138:5ef:f34 with SMTP id
 a92af1059eb24-139aa5c5a33mr366797c88.1.1781897119843; Fri, 19 Jun 2026
 12:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260616222303.466318-1-xiaogang.chen@amd.com>
In-Reply-To: <20260616222303.466318-1-xiaogang.chen@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jun 2026 15:25:08 -0400
X-Gm-Features: AVVi8CetPOpy71sB9lTsmhvVw3tNY6tDmw0_Er4cYMTOKvELawSSqNH2N0mH6yY
Message-ID: <CADnq5_OmdGi5Dpk5HjtraMYch0NTnB6PZJi9AsTwVybsw+pFag@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdkfd: Guard m->cp_hqd_eop_control setting by
 q->eop_ring_buffer_size
To: "Xiaogang.Chen" <xiaogang.chen@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:xiaogang.chen@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E0816A7837

On Tue, Jun 16, 2026 at 6:34=E2=80=AFPM Xiaogang.Chen <xiaogang.chen@amd.co=
m> wrote:
>
> From: Xiaogang Chen <xiaogang.chen@amd.com>
>
> To prevent getting incorrect m->cp_hqd_eop_control value.

Would be clearer to say avoid wraparound if the value is 0.  Either way:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c   | 4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c   | 4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   | 4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c | 4 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c    | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c b/drivers/g=
pu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> index 82f194ea2a21..5f8bf87f475e 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v10.c
> @@ -203,8 +203,8 @@ static void update_mqd(struct mqd_manager *mm, void *=
mqd,
>          * more than (EOP entry count - 1) so a queue size of 0x800 dword=
s
>          * is safe, giving a maximum field value of 0xA.
>          */
> -       m->cp_hqd_eop_control =3D min(0xA,
> -               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1);
> +       m->cp_hqd_eop_control =3D q->eop_ring_buffer_size ? min(0xA,
> +               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1) : 0;
>         m->cp_hqd_eop_base_addr_lo =3D
>                         lower_32_bits(q->eop_ring_buffer_address >> 8);
>         m->cp_hqd_eop_base_addr_hi =3D
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c b/drivers/g=
pu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> index dff016c9c65c..7506a1410385 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v11.c
> @@ -241,8 +241,8 @@ static void update_mqd(struct mqd_manager *mm, void *=
mqd,
>          * more than (EOP entry count - 1) so a queue size of 0x800 dword=
s
>          * is safe, giving a maximum field value of 0xA.
>          */
> -       m->cp_hqd_eop_control =3D min(0xA,
> -               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1);
> +       m->cp_hqd_eop_control =3D q->eop_ring_buffer_size ? min(0xA,
> +               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1) : 0;
>         m->cp_hqd_eop_base_addr_lo =3D
>                         lower_32_bits(q->eop_ring_buffer_address >> 8);
>         m->cp_hqd_eop_base_addr_hi =3D
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c b/drivers/g=
pu/drm/amd/amdkfd/kfd_mqd_manager_v12.c
> index 51dde2c86eb3..f1f923eb0ea5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c
> @@ -216,8 +216,8 @@ static void update_mqd(struct mqd_manager *mm, void *=
mqd,
>          * more than (EOP entry count - 1) so a queue size of 0x800 dword=
s
>          * is safe, giving a maximum field value of 0xA.
>          */
> -       m->cp_hqd_eop_control =3D min(0xA,
> -               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1);
> +       m->cp_hqd_eop_control =3D q->eop_ring_buffer_size ? min(0xA,
> +               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1) : 0;
>         m->cp_hqd_eop_base_addr_lo =3D
>                         lower_32_bits(q->eop_ring_buffer_address >> 8);
>         m->cp_hqd_eop_base_addr_hi =3D
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c b/drivers=
/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c
> index 9014912ed82c..a6fff8032dce 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12_1.c
> @@ -294,8 +294,8 @@ static void update_mqd(struct mqd_manager *mm, void *=
mqd,
>          * more than (EOP entry count - 1) so a queue size of 0x800 dword=
s
>          * is safe, giving a maximum field value of 0xA.
>          */
> -       m->cp_hqd_eop_control =3D min(0xA,
> -               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1);
> +       m->cp_hqd_eop_control =3D q->eop_ring_buffer_size ? min(0xA,
> +               ffs(q->eop_ring_buffer_size / sizeof(unsigned int)) - 1 -=
 1) : 0;
>         m->cp_hqd_eop_base_addr_lo =3D
>                         lower_32_bits(q->eop_ring_buffer_address >> 8);
>         m->cp_hqd_eop_base_addr_hi =3D
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c b/drivers/gp=
u/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> index b3c3833b6874..14b4240de6f0 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_vi.c
> @@ -214,8 +214,8 @@ static void __update_mqd(struct mqd_manager *mm, void=
 *mqd,
>          * more than (EOP entry count - 1) so a queue size of 0x800 dword=
s
>          * is safe, giving a maximum field value of 0xA.
>          */
> -       m->cp_hqd_eop_control |=3D min(0xA,
> -               order_base_2(q->eop_ring_buffer_size / 4) - 1);
> +       m->cp_hqd_eop_control |=3D q->eop_ring_buffer_size ? min(0xA,
> +               order_base_2(q->eop_ring_buffer_size / 4) - 1) : 0;
>         m->cp_hqd_eop_base_addr_lo =3D
>                         lower_32_bits(q->eop_ring_buffer_address >> 8);
>         m->cp_hqd_eop_base_addr_hi =3D
> --
> 2.34.1
>
