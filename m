Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z5cIFDhAMGqyQQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 20:11:04 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CA6689154
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 20:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=jocktvn6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474D710E596;
	Mon, 15 Jun 2026 18:11:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E2D10E596
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 18:11:01 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-137fe3c973cso80272c88.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 11:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781547061; cv=none;
 d=google.com; s=arc-20240605;
 b=cvbdV7QNvptZA8P2f0oPufJx9tjkDBElS1JfqUwkO3NCDiYIx4KsIs1BMU3Bjjb8K4
 WbvmKXliwWLfDZiS3O1nTv6v7Na0msxwAKJSAQDDGnMvuESs3kyJL03vWzb1ZKmEv1W/
 i6TK1gFYBxjUxSVRfqIXa0+y7X9/sM54fo2kZn5+U8LLQvXalHdtQlF6PjumZjToABU/
 wGIPCzvN/5GQaPp57IQHvE3NkveEcjEhsJ6HjAnjYZqtqtDW1uYdk+tRnjb8ukvQCtHO
 Ai/StMgSl1WhealSAnABBgaJdjS8uoQhsGd+QzFUYruDLHismXCSPxI5Z5DeK2bgdGYD
 2w+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Ab9yu7Cd1q5D3mT7WWKeN/wFAyu07eUo+v0cx92nrXQ=;
 fh=/jXuF6kkEzGc76I89MWDwYajZhHhstOH8SMMdzCQivY=;
 b=cVaP20g0svoD0qtoh/5/eMbVP9taPWFAYNlibVpWRxcyMUCuvea6CVndNaWTQfaKFv
 KUeKwV+q5i8mMEL/bFaSpa/Bmw668p/fLUEHeaydkIbtN0OmjoR4r7UjVsL9cE8x0pEV
 xpc4FOwwWj+JEeziZZsHplrBTVUWKSk2J2C0tMEd1FstVVtlxG2NxLSgv4NtYD8Bmka9
 PC5ldcDqYTZoGzhXvu868kgue2QeXH2wvpNSCOaNWR8rthN9ZgIg2kuGAIIBScQBtMQM
 MyIaXz+N/jn4t3T+A4teWzrYfucYzkuf/CfGOpSQiVph3Ruo5BJQHbrtbMK0OehVIYHA
 d4EQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781547061; x=1782151861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ab9yu7Cd1q5D3mT7WWKeN/wFAyu07eUo+v0cx92nrXQ=;
 b=jocktvn6887ZsoRWbF06y1pBUR4qJqje1YH64JuM0G99GUqZ9gKiFaKiYNxODhuhIK
 LCMNOAnDG7tv+HpjyZwE7rugVB7eSyjKa3l2V9d2F9Z9Chgp+45pjqYGIyDaNlvgFJoh
 N/YxYM5xTyg5J8yCn7Z4kFTqXg1+/KyW0sF8na6htUbqn3AT+e4UVV83dpSDCYIP7UYH
 uGT1vbZJ7e7OuNW8pJlsl4Z47hl22Goic8m3/S1NKL/WDnHjJOH1fqPzR+34NAaUw0jY
 EbJ+NFtIP/Nt17CJGDlmaoIPW3lHrZKeuR/RCpQQJOlTKoVPU3sDadI70BxXQprWOKqO
 77bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781547061; x=1782151861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ab9yu7Cd1q5D3mT7WWKeN/wFAyu07eUo+v0cx92nrXQ=;
 b=otCTFAR05tva+ZM5dRrzsI8DNpmfaB7HQwRosHDbqfEim6hX9WbY51vIrsIBmJ8IKF
 hEA7IzqnN5Pje3GkiR5op0IVB7cYvRiM7gK0fPL4cMUy9MRO9ITXnirfbScks243G1mj
 9iDMZdsl1WpWRNFZmRIdHH2mGxveexoYHhoybt7Hj4GjcnBhq7b2uRve/HPBZrkNGYrI
 VvHgMbm+rzRD4BF30XL1/Vnz9z8qi/b5UN1KLouBfB7o+b7ZKt2r7U56F5EGvoQZBhyz
 8tG9iMSK0VeHLu8Atr0yruTOojRtZzuBzvBRQzB/3ilMcPlxTRRAJHc+gWOahQPLizXR
 BLVA==
X-Gm-Message-State: AOJu0YwDMGkujMIpkWgw64mS7FS+N5UTJP/IkJ+Lb1Ba23SrNNtH0F3x
 Ocqb/2Olb5CiFcoY8tg8x9QszoJyKln++QevWxDGqY9ePqEWw/KdaZ5WGeTF75UaFW7aFJF9iV9
 +c7YvyAGwDfgc7JBgjqykLfvO/V8zXMaEOA==
X-Gm-Gg: Acq92OFPPWoXaaWRn4LbTL8771yM8tsruCeAKuDs/o5H28AREWFsSyvciieDqTjYKJd
 tT3sOaJQOqm/VE9/MSyE8OCGfxZI/3iLrHKb7hs64qVD+FqJDaHAO+uYw2XYurhUE12VgjaypST
 1gELUK8YNh19QT1KVe2w1Oq9EGzHRjZ6jCnDfxqHLx4ziRS7vkKwFElU9t/Yow6t4pnGCTpbAWf
 fgMZGSoqqVeLXrx1VHYR74l8S2wA0Rsly2+5Y4huFTOjPhciINBth4ihozYdlKiSLr7wEhSkrv+
 kyxbjhSemSnYFhyWOIpnJSESh1jooTrGSm+tjV5uZ9DP7PfYnCedZ32FttfiK98IODBm/g==
X-Received: by 2002:a05:7022:5f14:b0:137:fea7:9297 with SMTP id
 a92af1059eb24-1384bb009cdmr1838018c88.1.1781547060864; Mon, 15 Jun 2026
 11:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260613022204.1147028-1-mario.limonciello@amd.com>
In-Reply-To: <20260613022204.1147028-1-mario.limonciello@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 14:10:48 -0400
X-Gm-Features: AVVi8CeXxFhVmpCws5yZfgAUMYNDWGynkzZyxAddvSdOziARrYuJL-_gYg-j0QU
Message-ID: <CADnq5_OHUwBrENHoriQuu656gQmLYANHLior5Fc+4=mR3UCZcg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: fix list_del corruption in kfd_criu_resume_svm
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5CA6689154

On Fri, Jun 12, 2026 at 10:29=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> The cleanup tail of kfd_criu_resume_svm() walks
> svms->criu_svm_metadata_list and kfree()s each struct criu_svm_metadata
> without removing it from the list. The list head is left pointing at
> freed kmalloc-96 objects.
>
> A second AMDKFD_IOC_CRIU_OP from the same process re-enters: list_empty()
> reads the dangling ->next (use-after-free), the loop walks freed entries,
> and each is kfree()'d again (double-free). This is reachable by an
> unprivileged render-group user via /dev/kfd with no capabilities required=
.
>
> Add list_del() before the kfree() so the list is properly emptied. The
> list_for_each_entry_safe() iterator already caches the next pointer, so
> unlinking during the walk is safe.
>
> Fixes: 2a909ae71871 ("drm/amdkfd: CRIU resume shared virtual memory range=
s")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.c
> index 8d241ad760f19..df7fca65e9a21 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -4115,6 +4115,7 @@ int kfd_criu_resume_svm(struct kfd_process *p)
>         list_for_each_entry_safe(criu_svm_md, next, &svms->criu_svm_metad=
ata_list, list) {
>                 pr_debug("freeing criu_svm_md[]\n\tstart: 0x%llx\n",
>                                                 criu_svm_md->data.start_a=
ddr);
> +               list_del(&criu_svm_md->list);
>                 kfree(criu_svm_md);
>         }
>
> --
> 2.43.0
>
