Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 767bLVlcMWpHiAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:23:21 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287446906F2
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:23:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="U/nEpsfi";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47D210E923;
	Tue, 16 Jun 2026 14:23:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1DE810E923
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 14:23:17 +0000 (UTC)
Received: by mail-dl1-f49.google.com with SMTP id
 a92af1059eb24-1365eb2a773so216200c88.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 07:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781619797; cv=none;
 d=google.com; s=arc-20240605;
 b=CRxz0hkLKqAGF6yzRD4E0aZj/562ugQAE+wJ7Gpr6xrdUvt4/Va26etJBCXdDj+nRi
 a/QYL2ZGPAiBLRinOCY7r9/aTNZnCuHQWiE1hJadagnR5z7cYD0RhWCj6WwStkzii0J5
 +/2uunwDxklgY88OBwNOHMNOTW+FPouSM8/jhdKxjNCRvAi/xoiUu6I0ieQ4gsRotfkP
 BfKF+1uWNDO4sN9lAEQhQSO37ktaUsIXsdbRF5SKOZ04lwAgavAgSJFQEf1ocD38k114
 Pd6Flg5ASGCrsQBceciTejXZ7XVX5nYlWz1eaGAlmsIQBu9R1iOlHdf5mTUQ0FVpv6wa
 ru/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4f9tRXvbOVsDavyKjWkhWFw6RYsEvRmvgoZHRD2XqWc=;
 fh=ZALIDHo8pLRdkfs24V7vMF67xNVOyg3fIMVdLwiGvIo=;
 b=ICqHNFcYUwdhwcmslervqI1ZIlzGMaukayzksDFYQhQQm4BLQ1QuzaYNEkQQaJzJfb
 6X8oOci0YKllh32OQcgAP2hiD/Dbt6Wu8gF+sPnK6yIn462tyZYEWqC7s2NbS2EijrZl
 XuUa1lryuY7DwRqNazZzWV3ebewNMBSbgl6WfFwH0xaqyqVT+fc7/zqvcNsw77ZX0GQz
 ZlCEHAp5aqSRYcUhwZRhbXWnqa/EwHQl3FbcWByq+0CXUDzM2WeEToav2ESco45gtGkL
 2H9d2q0hTPOsnpp4G3g1qXjWFgIEjyYlw2E27e6Qwtt6t4cLJoW2WJroueH1B4iATBTX
 ts8g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781619797; x=1782224597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4f9tRXvbOVsDavyKjWkhWFw6RYsEvRmvgoZHRD2XqWc=;
 b=U/nEpsfiKyKngEhYAf/Gk9h6o9HP426xanCfEHSrpMK6hIyWg0ghIEMV7LJ1hM0PgU
 +a4y+8BTqqQs/+iYvG9Ylw2w6575KH0UHurEWXvEA08/M+VosQB6eKOXM+2usxRie8rc
 +idxdNy7g2O2362G7slqlgdi6YNQJCYplgbq/y9DHTzV6IDOLMD01Z+4iJiL9lbTdTUF
 ub0N0ClSGfTqzumPVSGDEiD6LLiVhwSQ57u83ap2Es6oPbgz1tUAQHXFaOJtACbhrUXx
 FOJ84xF4Nr8LKDcLrlQfu+rHLPzreSc0rtSPLcP/yhmrwAhqPTAY3a38+JxF9GLufWVF
 2+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781619797; x=1782224597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4f9tRXvbOVsDavyKjWkhWFw6RYsEvRmvgoZHRD2XqWc=;
 b=CI+Ew7j57j+GP2awZ6RZ87NhQ14Ac8wqfKvZxoDmaI5lTW47rRToPCNnVmxVpZOILl
 P18mTs2RDMitJe97F5yG+q45/w/rxtBZTH29AJOVhT9IdN/EeRWnl/mwefRzbtiZac74
 rP5YjBukA612EqSUDAhHeBX9mJ1t0GwtHszrPeiTtHZXAdoKJIJ30qbVHdTPMrz57gvH
 fAsE3MeHrxbxvrNMVSnvwKxCwfJHB471U2QuM6lZkNnAY9lmOpHaX/UmtbnYlRVZFuAP
 T0APbb+90m1M51h2EfP/uyWZ9sO9GB9xIH+TF53COgv6VW2LzY0j9GdwKPkH4JlGE2mU
 3kcQ==
X-Gm-Message-State: AOJu0Yy/nfpxm12PpxnCCphpiUq8oB5SeOnW9VJZKToLTaVWLiamz0AP
 EO5nfLsqLWZA/mXWrmlHxRr4MNU0n0AiLJK/pCPqObMl6wooCfQOBbwdz4JOtVeKmPadak9V8DM
 3qYVHFl0DjGr6ra748GlAaiHLvplBAYM=
X-Gm-Gg: Acq92OFTZmFKLgExy9StK9Uve1L7tBu2rm3vp0zNGeU5vE6lp5g7lSEYC7NMSx16jxb
 hsposex0OtSXfD4hfEhuJqsY1izOfPveoDsNzcR1dncX4xoiAMsTM9xbo7Klqa9rDBKaZWonJKZ
 r8YZGgFHgR6RdAMPLv1/GHPLqvReo3CXxV/JJqgD+UmOiLpQlOOPnSZInRBXQFmbqgsSTzmi8qa
 ZghBBX0kxomwmvvUQ5renX/+C2u833XvOwUurcgILpg9dKqmqmXKY4RQNmuyzw+F91jWMtLtpEI
 rBReutVhrCLpgIhD2W70C+3rVH9vAwjeBkP77NLpqViIRSS1s5GHh8r/b9OYbsJRDs5Ucp2u81M
 q9pi3
X-Received: by 2002:a05:7022:123:b0:138:5ef:f34 with SMTP id
 a92af1059eb24-1384baf9623mr4947929c88.1.1781619796889; Tue, 16 Jun 2026
 07:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260601140828.27779-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260601140828.27779-1-tvrtko.ursulin@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jun 2026 10:23:04 -0400
X-Gm-Features: AVVi8CeVtunHVOFoUMGs9tjc-wlR825IJ2gCCCo9ow256wAn9z08B1IbeE4sXfU
Message-ID: <CADnq5_Om02nCVZNpbe51CdWyO6WfiSPWcCfx90bfrdQTL71cPA@mail.gmail.com>
Subject: Re: [PATCH 0/7] Grab bag of context handling stuff
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:kernel-dev@igalia.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 287446906F2

On Mon, Jun 1, 2026 at 10:08=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
> In some semblance of order, the series starts with a fix and then continu=
es with
> some old cleanup patches, and a couple of new ones.
>
> Only lightly tested so giving it a spin in AMD's CI would be essential.

Applied the series.  We'll see what the CI says.

Thanks!

Alex

>
> First patch probably deserves immediate attention and if no mistakes or
> regressions are present can be merged before the rest.
>
> Tvrtko Ursulin (7):
>   drm/amdgpu: Fix context pstate override handling
>   drm/amdgpu: Remove arbitrary number of contexts limitation
>   drm/amdgpu: Consolidate ctx put
>   drm/amdgpu: Remove live context error log and skip
>   drm/amdgpu: Simplify amdgpu_ctx_get_stable_pstate()
>   drm/amdgpu: Convert context manager to xarray
>   drm/amdgpu: Clarify odd behaviour of AMDGPU_CTX_OP_GET_STABLE_PSTATE
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h       |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c   | 278 ++++++++--------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h   |  14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sched.c |   8 +-
>  4 files changed, 117 insertions(+), 184 deletions(-)
>
> --
> 2.54.0
>
