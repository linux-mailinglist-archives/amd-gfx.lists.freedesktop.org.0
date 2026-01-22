Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AO4fEJZWcmkpiwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Jan 2026 17:55:50 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BF6A711
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Jan 2026 17:55:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBC210E9F8;
	Thu, 22 Jan 2026 16:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XuTpte2l";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95B910E9F8
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Jan 2026 16:55:45 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-1233bc11279so94453c88.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Jan 2026 08:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769100945; cv=none;
 d=google.com; s=arc-20240605;
 b=FYfXBo0ZhtPe9PO74054BNQSeiQ8VMItRSlsMaeTFhZgUcjO8C/iaP/MuEJelnjG8c
 I9De8lA4DRVil89vLvs5aJdapAQ3xukPccd6mOALFvq7ZgfSX/AZ+3t+n675DmKQ4AqY
 AmGtjzTN0F4tMCZjs2kyyzdp/h81CCn+QPDFcEgHA12zqXdmVwQDarpo1fpeZ9Mez89X
 Y3cGvCeLn7fbxtCh2lAvUmT/9zriZRRvY3yL+4cxpqxK6vgBLwWjPFB8yqxQfww18cCX
 GIP0tggk/RKPuvcom0iiSRfQuYu4ebuP8qsDzmrJpznSmzxtq2bO0+yQDyvE5UnexYoK
 v6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Lt3jf2Z3DBJKABdfKAxe9MNepgl0lM1XukuRc5rRc5w=;
 fh=tfjiyQiw2s6YcdxXwhHMkIDXKm8aun+ea11dOqVouwo=;
 b=S0UBYA9NtPum/r5D33Uh5oWr9+wuxtvf+ChPqLxHYuxjsHTpvAPFmThx+OaKOOat/M
 L8zK4CA9mWP2xAisVika8raA00NhfXB4LEhrLTAAuijasuuRhtpMO1oOl8NA4/1vhPx2
 72EioSj48ubjh+ZxemerUSlqzFvgsL7rxlUYZR53tdHzSZrF4WaBrVpaOo+IndJYxOEL
 oWPRfghFRTR1Hv5yo9QMIs6K5KrdH4isIc7//hS3fBb6JBB0/9YPdhsW/suEujMYhckd
 o4oTkZNnTSy6miIHKRWaGbejdo9YExoFg5gK1DjZJBZGTWFs5a/aNGbyKYxIaz3PhMWC
 ffZw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769100945; x=1769705745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lt3jf2Z3DBJKABdfKAxe9MNepgl0lM1XukuRc5rRc5w=;
 b=XuTpte2l9k5eg9UgDreAGq0OOpr98SsTKVT2dDRSQJrxaW4CkEeVBbm4gGC0rga4g7
 fZavcxLNEVRYgw222dGdNvrFRQ0oXUsMKuGC6QFydRbtjV5P2cHX3JaAx+H6jWwYpckb
 L/h8JUnwlHTrzLSuUJbc5rrhFwFzTI/oOVHim5n9Yoscky1sYAVyfKw9jjib4Lr4En5F
 IdqUD0LTJOuZr+RxXIXT4ghIYpXkEXMsMR3dWJdoPu1D13ZSjO/YKngVukgZZECpveIX
 oi2cBgpxf/qn3A2FSDIJQ0ZKY+9ZQerNNUugW2OMMfsH+xbJslrXB+ZItX5SCQjo1G8i
 pI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769100945; x=1769705745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Lt3jf2Z3DBJKABdfKAxe9MNepgl0lM1XukuRc5rRc5w=;
 b=pDYYQ5G8MniRFbSqTVzE4m5Dns8/B5bqUA2ZpqAa6JZjo1Q6CF73vo1aaA684NfAD5
 AWEaZQpBKGXk7jN0d6hJQVhqiVG5N0icMvfo34s92lW4XI5at1Fq/wwGi4YpMa6YVYMQ
 z2FdVmgzr1WvgDF/TXOFEaMO9gNAsAfhpv1xbhfX6fE+FGGUK2lM5feO6bx58h9XSpHJ
 iyZ+vnvof8xIvXgToFlwik7Y/TFCnFA/1xazIPtRdihdqd7gPVOPllzVhzpz1fNsRe2X
 dFVdPTLPRpG/oQWxyzBP66UNXGqMdVUdweiVX4CwYcsqidQJRrNQt+YTTqm9PDi9Lln+
 9CIQ==
X-Gm-Message-State: AOJu0Yxgn4LyQhU/Vl8ViPH+bdSe9dXq0lxlqLqZGCvOJFJ/0XH6x8kz
 v5joouJAiCXmc4dJ+rKVbUeCvCFlMMZfvs00W7cp41VY1XphgUmeBMCaIBITmrPXu0pIVCS/0Mg
 Ip7uypOV34RrNRKOeFO5iiQ4OsBPygKs=
X-Gm-Gg: AZuq6aIOutZnal0DYx3J2ctao4rbRXAS1u5Whhz5ocS5fG3OQkPBJi89LrlIphHJpnf
 hHDzC++FkOfgt35kuIgNSZJs3iLFUoPT1tbLTnMZCB2dUl0Tveb082wf4JOmrH/OfvxcQ+8jRW7
 M1g/K1VrneNKyI6YAQH0x5NK3VvwJr+CKWXZhDJct1FK8XGHl5+0fIJCdqK1qjmOT8qkTLZ6HNm
 Xrnb3HgF0fGpozZbXo6DI5Ti/SI3ma+J+orVziDqdmw+ow2VLI3wfrkt997xt/HuRX2mQLjS6cD
 eTJKC9w=
X-Received: by 2002:a05:7022:3a82:b0:11e:332:1e01 with SMTP id
 a92af1059eb24-1244a7dd101mr7299571c88.3.1769100944955; Thu, 22 Jan 2026
 08:55:44 -0800 (PST)
MIME-Version: 1.0
References: <20260122155559.881810-1-shaoyun.liu@amd.com>
In-Reply-To: <20260122155559.881810-1-shaoyun.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Jan 2026 11:55:33 -0500
X-Gm-Features: AZwV_Qjx6BGZjpZjwRa0jXW29TUFGk3OxsQTiN-_FvEP8igeHttz5N0NQHLMLI8
Message-ID: <CADnq5_MgHf5qoTeZdHkNj=rACaytxibNyuWEkfVmbk10PbHG+g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/include : Update MES v12 API header - SUSPEND
To: Shaoyun Liu <shaoyun.liu@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:shaoyun.liu@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 976BF6A711
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:52=E2=80=AFAM Shaoyun Liu <shaoyun.liu@amd.com> =
wrote:
>
> Update SUSPEND API to support sdma queues

It would be good to note the minimum firmware version which supports
this.  With that fixed:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> Signed-off-by: Shaoyun Liu <shaoyun.liu@amd.com>
> ---
>  drivers/gpu/drm/amd/include/mes_v12_api_def.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/mes_v12_api_def.h b/drivers/gpu/=
drm/amd/include/mes_v12_api_def.h
> index 83e4f0142324..e541a43714a1 100644
> --- a/drivers/gpu/drm/amd/include/mes_v12_api_def.h
> +++ b/drivers/gpu/drm/amd/include/mes_v12_api_def.h
> @@ -492,8 +492,10 @@ union MESAPI__SUSPEND {
>                 union MES_API_HEADER    header;
>                 /* false - suspend all gangs; true - specific gang */
>                 struct {
> -                       uint32_t        suspend_all_gangs : 1;
> -                       uint32_t        reserved : 31;
> +                       uint32_t      suspend_all_gangs : 1; // suspend a=
ll compute gangs (can be set together with suspend_all_sdma_gangs)
> +                       uint32_t      query_status : 1;
> +                       uint32_t      suspend_all_sdma_gangs : 1; // susp=
end all sdma gangs (can be set together with suspend_all_gangs)
> +                       uint32_t      reserved : 29;
>                 };
>                 /* gang_context_addr is valid only if suspend_all =3D fal=
se */
>
> --
> 2.34.1
>
