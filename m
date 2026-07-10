Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1TIRO1L4UGrr9AIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:49:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A1573B696
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:49:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EbwJFvLU;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E8010F8E8;
	Fri, 10 Jul 2026 13:49:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A110F8E8
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 13:49:03 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ccae46de39so1503155ad.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783691343; cv=none;
 d=google.com; s=arc-20260327;
 b=q99Ee8ar/tKm+gEom4l+qlZ0X1Z1XutgM/eDfaX07Amau3JEAPKZFZq8S24RCIqnbE
 hynGDHCDaCbD71lydG0t36tfXbfsecjc2bfNBMDnq8HzVsnivAR+Bdx04LsJbul9903e
 vaHp9zegEDxzyppg2T9VH9iSs2tSKFhtNnCqII80onlhMtfL9hD+68J9q3hhxuZwvYZg
 ga7Wk/bJHv0A2PTyFdCB8r9Ij4K11WGU7uWZGS+9yzPax4GnxZ/AQl+w1Ka9FawbjPxn
 9j8nMTvmNTwJ/XbtDJhXAdkwV1dy5njh6cFHgfn/dQD9JsIM1BOdgaVte9Ne6FSGQyc1
 tn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=xS4990NQQ4qRZRVu84VT5A1DwjeEZrhbYGDVvijlegY=;
 fh=71+A56B16h7xLzCp/Whc+V0ibBa/wp8a/Irth0yYHv4=;
 b=a6z0O/lIoBNfTsF3P20KYY+rFQt61oOwIK10E93VwrrcRE4hq1Mf3XsBJWg8EqHn+E
 9OHtOb7c2GVabYJ+IAN1yvnBVmYBYDHc1w4IcXN1Rd4er8bY96RksxB3KrvlGc6EiEAM
 NiY0LSjmdurC8SmuJaqILWHxG7Y/9DM/oPCe+MFxpOeVg/ouGeKf+99l1iynZv4HsnDz
 51eAbcuj3EGhol8RxcduYuLAonuQpRxbX2ACT5MSKIVC/nYa0UnrmJCapV9jw+rzpCVh
 IDz0MDEdhbGKYi2Pvo0ipZFxhTsNoW+c2dRHAPEmKK7sNGyRd0p9gqkWa4v39VviCA7G
 X7WQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783691343; x=1784296143; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xS4990NQQ4qRZRVu84VT5A1DwjeEZrhbYGDVvijlegY=;
 b=EbwJFvLUTY8eFuVOS5iB1QNhDZNl5HVRbHISTvPsE/Oio6yDKvB16aogg6RrpbDw2q
 q3Zqe/xVUExCWyJWTwIRdarwtJ8HTy7TpqrO6STYMEJPtxYmgHaK/1UDhF3teihLjown
 +mzJBWGLYra2lEYWBUVfvWQFYRDyQawL9rE5NYGJdZ+5x5AKN5MryUfnGavmF33jFY1+
 RhVbDMQ+DQTQwZA2uBmUqKXpp8QrvkteMv66kX/T/89VVd/AoYo1c8lqCRNfnix7oCC9
 nyF2KSlRVqnU0azmLZzsRDXnolGlTLyoo9qPXzWghzTMWcAGdCDEISdgMZplAHaOpX4W
 53dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691343; x=1784296143;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xS4990NQQ4qRZRVu84VT5A1DwjeEZrhbYGDVvijlegY=;
 b=LTyFKhlq99ooXxt5aEAtoES0BIEYnzOzc4FpZE0Idqy1KDks9sEkhhmbATYj4zVNHP
 i/m6urm1VRUbCSeN7mYMETdCW+MkCO/VLQXzn3JgUvTKFxT6BOijbVLUJeAJR3uVZkEz
 UE7UtkYj8B7KKZsGHSQGFLiPObPaa/j5ZOuUnvjC6K6WHShHxxpwGgsXWCgFKjwEUgZd
 1L5jhgP/+g/16knkQ9kKhuMQR1TPzs6YIih/Apnitb/lxG7Vqjodl2wr+rsVBLQcOSqw
 XNY7iVH/C8pqGpSYACXY8gpaGt3pohQidXWSR/eLlnWdPD1/8sKT0RIh2UY25+mrn+pV
 NBTA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqYwh3MNwI2wwZHTKuGgX6AsCJAjQmOKkwNj2sRpGEkitTzYQ1csFLadY8dOU5rH8MnqAh+0Mz7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPlHeonlfB0vr0QfT/Z4ZCZpBwL03GviidQjPYk1ZNzP4uf7bI
 dv8Xk5mwsq7nmzhiDtOrIuOt3b2k5S45oozwptqbXhd18f4ymh68plLJVW9F0pD9JyDCk7rIqkE
 A/hEWNueP196OEZzWzooeTvaBGgqfrYztqQ==
X-Gm-Gg: AfdE7cmsPTxmdLJyzbCh4xW3+wmUfqjJVldAJtFJ8iYNttbEQUx6Uv1ZuRNXsvFKeQS
 Murd7evoJhQF+wEcX099QRAH2jI0MXwH3vaOudxHZnfLunAlUsfmp2uprSM6ynT2hDCWIWNADIi
 cfU9p1SqXOK76ECoTlSpsINVqSdXn6EPjJXsNUfhS27s2z3yoOjUEQX0gq/L/StHeP5JmagaKk5
 AV0a03osHXeOxsjaPC7ic6ACp8CDKf40SwWityLyHL/OtUkbxj9q+uhVZlA0QzpJanQgO3d2lhH
 KupKFwgSikZcgKa50DJ26I0oRb9ZamgBJQGlNWJ8zUx6DrItjeo60Q4KBEM=
X-Received: by 2002:a17:903:1a43:b0:2ca:dc3:5aa with SMTP id
 d9443c01a7336-2ccfebd2ccfmr67524865ad.2.1783691343343; Fri, 10 Jul 2026
 06:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260709060008.529870-1-rdunlap@infradead.org>
In-Reply-To: <20260709060008.529870-1-rdunlap@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2026 09:48:50 -0400
X-Gm-Features: AVVi8CcK_3QnyMscbnBUT-PodKZQsI5aL9GJwYpH03HEj1BoT3GRsWZihGnfauk
Message-ID: <CADnq5_MUfwrc+X8T3EsirA5en+104cHM_6LfmvwYbjMYenRT7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: drop kernel-doc for deleted struct fields
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rdunlap@infradead.org,m:dri-devel@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:timur.kristof@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,lists.freedesktop.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 48A1573B696

Applied.  Thanks!

Alex

On Thu, Jul 9, 2026 at 3:27=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> 3 fields in struct amd_ip_funcs have been deleted, so also delete the
> kernel-doc comments for them to avoid warnings:
>
> WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct me=
mber 'check_soft_reset' description in 'amd_ip_funcs'
> WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct me=
mber 'pre_soft_reset' description in 'amd_ip_funcs'
> WARNING: ../drivers/gpu/drm/amd/include/amd_shared.h:481 Excess struct me=
mber 'post_soft_reset' description in 'amd_ip_funcs'
>
> Fixes: 947e46eb2fb9 ("drm/amdgpu: Delete check_soft_reset() from amd_ip_f=
uncs")
> Fixes: b7500532e12b ("drm/amdgpu: Delete pre/post_soft_reset() from amd_i=
p_funcs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> Cc: amd-gfx@lists.freedesktop.org
>
>  drivers/gpu/drm/amd/include/amd_shared.h |    3 ---
>  1 file changed, 3 deletions(-)
>
> --- linext-2026-0708.orig/drivers/gpu/drm/amd/include/amd_shared.h
> +++ linext-2026-0708/drivers/gpu/drm/amd/include/amd_shared.h
> @@ -439,10 +439,7 @@ enum amd_dpm_forced_level;
>   * @complete: handles IP specific changes after resume
>   * @is_idle: returns current IP block idle status
>   * @wait_for_idle: poll for idle
> - * @check_soft_reset: check soft reset the IP block
> - * @pre_soft_reset: pre soft reset the IP block
>   * @soft_reset: soft reset the IP block
> - * @post_soft_reset: post soft reset the IP block
>   * @set_clockgating_state: enable/disable cg for the IP block
>   * @set_powergating_state: enable/disable pg for the IP block
>   * @get_clockgating_state: get current clockgating status
