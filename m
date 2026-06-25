Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ldPZN0cwPmq7BAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A46CB263
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KaT1iddS;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FF410F49B;
	Fri, 26 Jun 2026 07:54:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4D710F2DF
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 14:26:38 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-7f69b71f7b2so26576627b3.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 07:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782397597; cv=none;
 d=google.com; s=arc-20260327;
 b=gSwhw5VzEN84ckMCbNM+KeQLEOU8RmHp+5+jhUn2cl0L7LmGuSqL5Eh9CAd30ny0kQ
 E0hYWS6Q1spSQSYbDG07JJR5ZNur9EbwcZ63px+Ej7btM8c4KL8dHb/sFRddt8D47N9M
 Vq8fNfz6vgeytj9A+zM0br8keaalvnUHoftpxwWftxOA9W9qShKnn7Pn4of/5o59CeMs
 tZWf6NaZaiw+mZP6uBDUcOZul7/TWaspNYvVMT0J46rTiGXu0LVARTuAplv2Eat/GMVu
 uPqPz7ZpvvNuIL/Q49VuNl+/dGGByxksCDRHcJyTysrvG0mGJnTmj1FeZMA9TfL4aMZu
 4M3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:references:in-reply-to:dkim-signature;
 bh=zG0ziIrnl5+Uq7ZzfQ6z6EifKGZA4Cbm70aG+1ToxjY=;
 fh=9X7mPNQiEIoOX2Mrz8M7YhToZFNWV/p2ZuZ/YnRRxrg=;
 b=EEVK53VLuRhpkv/1TBStERtvhhlSKyWWtJdP8aD6KRE7xxOdbAyvm0isn8EturUq+C
 gJdQF2MXC11LSjp6Qbu3krc+9W+6ZkAJ769hebLC9asW3bnXQKvi5+aAGLQIQmIcYbfT
 Be3RhXMTRwqla5MMa/ow0fKZ+IQ5yRRIAgKPtXsX9ueSjHO5/oimzFLNKUSUNKWPLR8S
 z6PuuHNIS+nl8Vvkd307ikXWf6f7Ci0a+WkWIBTUzTs/tAIsOQMml5YRzFztccDOEOoJ
 ZFn0i1hS7jVyfcoT8Es55EpsB7z+8z2IVhNw1Gs7YAi922gqHbpkvyuLXCReKofEEPcw
 X5Qg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782397597; x=1783002397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:references:in-reply-to:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zG0ziIrnl5+Uq7ZzfQ6z6EifKGZA4Cbm70aG+1ToxjY=;
 b=KaT1iddSxn/bETwnP6DZu3AsNZ19jacJhqD8V7Ib26Ti0VIRUKtl1xCEZPvGoRvksN
 tvMy01A6CVEp80kwHurjVL+worT6UAWZxUjKxzLX0Tg42MrV96cvNnqgmV0Z6QIPbNTl
 k9JDlp4yUN18QY7BhGDHJOexwEk9CNXcrTvzU00M2CxbeMouOzGjxND2iJDjBct3bi5o
 cRUtwdOVJWZmoaqgbF/OhR/3cnn7ywNnzsPdXXzWdO+8mKHQpL+308yEE2KGdjwfENQ+
 hmwtXcdmTlHf9v9cfuJDlH32PAYOs3EWmCY/C64xssEYE2LS45HhbXLoKVncGkWshtfK
 gcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782397597; x=1783002397;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zG0ziIrnl5+Uq7ZzfQ6z6EifKGZA4Cbm70aG+1ToxjY=;
 b=Q5uEuSsmEfjAF9/BKDATquqWczWs97eDTw/fGrpzg1Myg8m918YYaOJ1h+32y6P9S3
 CsD8GGIR0ae/uCrjWTrF2IeLSxtvbMq50K1LbVurdv0t18qiOt+j9XNL/zXKgbRQhLT3
 X2G6ZKRnJZYi68zRN1SAZC/QRdSXHehaTEwEeyn9reyYrZ40kGAa+4JLyDRbtZRXCQdV
 iCcJG1JkibueklyoMs/wKLA0UqUYspSPWr0Yi+Jgd9mr6dHMkDaEqoLLNXkVjlBgvX/7
 p5FO+kdNeByK9ENgUMeDNAgNmRD3knq38f9rEF59BMp2a0BaKHYnNUX6RV6MePtKNDKX
 s5sA==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro1CxHlSOdapu4rYN7bnjwHJO5Pdq3BumgmnkKmffnO4xnAZ3lC1BuV0ooxwoLR/cmc+X3xalJN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+09raemDPgpxnaO2ZBGtSkZYIDRdzS2EG9WIXzQOjvnJeDX9R
 42o2dG+0cjLe3bm5PGLCvEZpJ69iLZLmt3PgqrITNseqU8xqrKrZ677sAo4V7GVXOvzaGb20BSE
 9F2TTqm6eaF/v3bgwcN2I2PNIIU60aKGEAeMAqgw=
X-Gm-Gg: AfdE7ckZnU0HcS7NW9suqw44m+tSjM49CKSASduvUYicW1tr26TVA4Cd++HHtvF8okY
 dK26HE3XPCU7KIfL/teamxlaKVzNxi74gxXZrCHatJahTFyNLQz8B9peOPxNtBkDfpSHSafycZP
 9Zh1Lep5l9b8IheVwoQ7ra9/Dn7pOpEss56IUiO72cjyEhWwyUpM8ZC0p4f0EiQkBP0c2JrZCrd
 gOdH5lRq7bD/r1dpH3PiocrCYI6xVvR4w3PknU5P8r6II+AjsP7a6WJFQISLZq1YH2dzzmnwg==
X-Received: by 2002:a05:690c:368d:b0:7be:fedd:726b with SMTP id
 00721157ae682-80a6d262368mr24686747b3.42.1782397597299; Thu, 25 Jun 2026
 07:26:37 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 25 Jun 2026 07:26:36 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST; 
 Thu, 25 Jun 2026 07:26:36 -0700
In-Reply-To: <20260625135341.1159-1-alhouseenyousef@gmail.com>
References: <20260624172029.2508-1-alhouseenyousef@gmail.com>
 <20260625135341.1159-1-alhouseenyousef@gmail.com>
MIME-Version: 1.0
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
Date: Thu, 25 Jun 2026 07:26:36 -0700
X-Gm-Features: AVVi8CesCW6iLL67hakaynYG37WtYiPVPjL9y6jKGomdujasLZOfkHuY3iSrjGg
Message-ID: <CAMuQ4bWVb-vxCWMxF_JpJmBnKD=rVH2KZWf36jnzPbC35CdrmA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: reject mapping info when BO VA is gone
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 26 Jun 2026 07:54:04 +0000
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 798A46CB263

Hi Alex, Christian,

Please drop this v2 as well.

I rechecked the target tree and missed the existing !bo_va check in
AMDGPU_GEM_OP_GET_MAPPING_INFO. The close-race case is already handled
before the mapping list walks, so this patch only makes the later check
unreachable and changes the errno.

Sorry for the churn.

Thanks,
Yousef

On Thu, 25 Jun 2026 15:53:41 +0200, Yousef Alhouseen
<alhouseenyousef@gmail.com> wrote:
> AMDGPU_GEM_OP_GET_MAPPING_INFO looks up the GEM object from the file
> handle and then locks the object and VM before resolving the BO-VA. The
> GEM object reference keeps the BO alive, but it does not keep the
> per-file handle open.
>
> If a racing close drops the last handle reference in that window,
> amdgpu_gem_object_close() can remove the BO-VA before
> amdgpu_vm_bo_find() runs. The ioctl then walks the BO-VA mapping lists
> unconditionally.
>
> Return -EINVAL if the BO is no longer associated with this VM.
>
> Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
> Changes in v2:
> - Describe the handle-close race instead of an initially unmapped BO.
> - Return -EINVAL instead of -ENOENT.
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++++
> 1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 212c14d99..6f5b6f4c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -1087,6 +1087,12 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, vo=
id *data,
> struct drm_amdgpu_gem_vm_entry *vm_entries;
> struct amdgpu_bo_va_mapping *mapping;
> int num_mappings =3D 0;
> +
> + if (!bo_va) {
> + r =3D -EINVAL;
> + goto out_exec;
> + }
> +
> /*
> * num_entries is set as an input to the size of the user-allocated array =
of
> * drm_amdgpu_gem_vm_entry stored at args->value.
> --
> 2.54.0
