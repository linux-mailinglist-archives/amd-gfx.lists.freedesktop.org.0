Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBCBAy5pvmnxOwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:26 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE42E482A
	for <lists+amd-gfx@lfdr.de>; Sat, 21 Mar 2026 10:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CD610E379;
	Sat, 21 Mar 2026 09:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kvXX5vrc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com
 [74.125.224.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7069210EB47
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 22:38:50 +0000 (UTC)
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-64e9f9226a7so2101936d50.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Mar 2026 15:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774046329; cv=none;
 d=google.com; s=arc-20240605;
 b=RuFKrJHN4FB3VaxpJHTvi29GI5WnpOKxS3y1UtVaMJ8mq7Gk6xzllyGct4YTe4UjqI
 w6ehaiG7uvqX/n6fcJUIj9jYTriWJlcyWrMvj3IV8o2Nl2/KuTwEgYOiSeqNpVvA5uUI
 cL2azB9GnnIzNMZFHU9Ay1t18E4ighdpuduA3LNE0I70ETfdYlYg2AIkAU0UktRINfu+
 jvfVpLtS8vaku6Fsl48W+yQtRIs9OqB492nF1QM4AhJbRuHQgA9djP3KNwpLHEPgJjkA
 GGMJakfVO+BsgnmImkGd5eP7ppK7GV+cZmBBnQxfj3oo24KADeOzseGm66NiTtKWY79l
 tydQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 fh=reQzXWkLzH9Xsbp5tG8yl3C2cxhKhRNjJ0JNy5g8xwo=;
 b=A7bMm1Uc08g3ZXQu9z3jQwRZkUnZKj5I64RwNevzNr1+gnQf3wqxRkYcAaHRHSsqzq
 SgH17DoTjhu8xTLsSn+j2JZVztv3Auumycc0UflHm5avpaguVNTHYGv6TVNpCrxwTBea
 b6OuLH4xBg6KpDwxSqd+TZmbmBl4bSMFBKwKsdDIBfC0nFN2KyvpJ2Lv6UnXORSDEd0e
 3qgXsT3DQIrA2IBhtfpN60O0jDIPArahzJCUNz/5xOYxd1igcBvh9eRUGPT0axW+2tk3
 vNN1ojpVYHlzwtkDyy7N2/Agi31KOHjYHFWaJbtBxp6EbpG2C8MFaA8TF3wck5ml0zIp
 AdEw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774046329; x=1774651129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 b=kvXX5vrczBwzeLzetQEk30KLX2hI8wZSCEZPkz20BHdO3OAlPJiiyRZYMBjwTkqK6G
 lA5a2Vymp8+CNUMPqbfeM4+pqnADDrPl5sa+jaMfitV0HrH1BZYm1SDX4gPbT4ep3nZV
 vqu1n16wt+dXoujFWL+/sK8qDWM3+xx7HV8swGmXa3oAvgTqtPCi6hyUxlZKQD0wldj4
 Iqw2vxzzYJOJahzsWAEo0XxnEE5AUh92KtkTU+eIvYoAsYYZbwPvlzKBXd13jPw/5Fi8
 bHuYLT2x00OCwkNMEM7eeGTr+r4Z4WC45fTvR/llh3PsxA5cVoVGzDH2RV+5im+1NitV
 1ldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774046329; x=1774651129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1QP6vLGAno7k+sNss+wwfyElHbIT2Fj2kzdCjibqhnU=;
 b=KQAJrhOs3Mnaq12+Qq7eCsTaaaMllV2HyVdMSod8XZqwnVyPJ7hIKoj3XM42KiTTL8
 /USIBKvlgoA4QMSvIp788cYnSPJOdB0jQAy60LKtooedIQz4dTYks7wZKrcOyOMJZG1m
 UtNto1eaQmtGtTMNR9MRsKZWqxFBzavvhCfM64m3qjd11D8sPFXYeFC9BwpNtna8e7j9
 jeZC3gUYwQu/QxH5yFGCA7M1Wr9ECHkk05TG9lA6XvAtpd6476xXzFzFNEWNBO9YrNpL
 bRpDZyAAm2ovUNJdJDCLLQLI3JDuelkSe1a1+8hCOFXC25xdDdNKRFQ5WVOw9pHS7pub
 lqUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRLc9vpKIyZhqh/CuQ9HbW9CxwTZ/tbygn7fw+THLSqUU7Mf3vGtdzZEmU4JHAOIHZln28zAW9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiDXOqp/L6VL/FY8tLPe5j+w+sX3Gk5sDnGPuIlZDz8bolvRHU
 PfUupQ7f6+A1jnLfPJIrfOaHi6fL3EELwYpywZPk1y85MTeUYnCUdfE3BKWa8etIKO0u653ZWE8
 gcE9Oi6yZHCupfXBuiJo8NmEmZUAyF8o=
X-Gm-Gg: ATEYQzymoWzujdIcS7FJyC4ayMTk1OS5CMSmygrDiC5x/QNxsWuZzjCJvdTwP2yQxR9
 n2hsRAVodQqxQRT7m+ykvk5lt1UTRoBbKL8dMjyF1H4TAOIR9WxTrshm0d+tRQyLqDm7qHlIVT7
 XCQZp+t7IGApAYaxU4WYWSZdn5qIwo5BwF2O6dDbuGP/7sAJg12wd0rxoJjyK3Q4jXOPIsIfEjI
 Y2SEaPmoeuzed5QEzQ9s85rlR/oHidAG/sn5xvfXzgqcsJ9rSdFRJp1FLSyfg35MyvXsOyWojzz
 ELtt
X-Received: by 2002:a53:b9d2:0:b0:64c:f2f5:8f5c with SMTP id
 956f58d0204a3-64eaa707e47mr3626057d50.30.1774046329351; Fri, 20 Mar 2026
 15:38:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
 <20260313132103.2529746-65-jim.cromie@gmail.com>
 <177402491485.6181.1878747749743687917.b4-review@b4>
In-Reply-To: <177402491485.6181.1878747749743687917.b4-review@b4>
From: jim.cromie@gmail.com
Date: Fri, 20 Mar 2026 16:38:23 -0600
X-Gm-Features: AaiRm532nEVSECCKtVZQBvh7bVjnXge5XC4gNh5bglnjYOP9OLegdkUxnYh0aWg
Message-ID: <CAJfuBxy7U4DtDHKrphky7mCHMxmC9ZvuE4cdH1qAzZ4PZGuz1A@mail.gmail.com>
Subject: Re: [PATCH v11 64/65] drm_print: fix drm_printer dynamic debug bypass
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, simona@ffwll.ch, jbaron@akamai.com, 
 gregkh@linuxfoundation.org, mripard@kernel.org, tzimmermann@suse.de, 
 maarten.lankhorst@linux.intel.com, jani.nikula@intel.com, 
 ville.syrjala@linux.intel.com, christian.koenig@amd.com, 
 matthew.auld@intel.com, arunpravin.paneerselvam@amd.com, 
 skhan@linuxfoundation.org, pmladek@suse.com, ukaszb@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 21 Mar 2026 09:47:17 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jbaron@akamai.com,m:gregkh@linuxfoundation.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:jani.nikula@intel.com,m:ville.syrjala@linux.intel.com,m:christian.koenig@amd.com,m:matthew.auld@intel.com,m:arunpravin.paneerselvam@amd.com,m:skhan@linuxfoundation.org,m:pmladek@suse.com,m:ukaszb@chromium.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,akamai.com,linuxfoundation.org,kernel.org,suse.de,linux.intel.com,intel.com,amd.com,suse.com,chromium.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: AFEE42E482A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 10:43=E2=80=AFAM Louis Chauvet
<louis.chauvet@bootlin.com> wrote:
>
> On Fri, 13 Mar 2026 07:20:29 -0600, Jim Cromie <jim.cromie@gmail.com> wro=
te:
> > [...]
> > mismatch in intel_pipe_config_compare(), the resulting UART storm
> > causes a hard timeout after 20 minutes (see below the snip).
> >
> > To fix this, change __drm_printfn_dbg() to use the explicit
> > drm_debug_enabled_instrumented() instead. This ensures the bit-test is
> > performed at runtime for this unguarded helper, stopping the UART storm=
.
>
> Why don't use use drm_debug_enabled directly? Does it make sense to call
> the _instrumented when [2] is not enabled?

my reason is so that we can turn on the pr-debug, and see how often
this happens.
If it happens a lot, we can look for ways to replace the bit-test with
a static-key guard.

That said, we could use drm_debug_enabled(), we'd lose the counting ability=
 when
DRM_USE_DYNAMIC_DEBUG=3Dn, but still have it for =3Dy.
So Im happy with either way.

>
> >
>
> --
> Louis Chauvet <louis.chauvet@bootlin.com>
