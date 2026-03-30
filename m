Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIDSDLHdymkQAwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 22:31:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FC6360F93
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Mar 2026 22:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BA810E7DC;
	Mon, 30 Mar 2026 20:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bZ+UYluH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C978C10E7DC
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2026 20:31:41 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso349178eec.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Mar 2026 13:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774902701; cv=none;
 d=google.com; s=arc-20240605;
 b=diR/5c2KNjJBejN/kF+q8aRDWsBjbBmsmwCSF+Yt3qIkMDyjet8siBkzOp9YAyaJpa
 DpoG/O4s+cZ6UnClZKNkgwmQIH/4qhyEe8kRK1hFI9s0mZXafWJGF5XIuH8Oq8QL1Qgk
 glaf/mP9/woN5CKsq7FSS5nv6Kr+BUwHfzWuLlEUGj+1b+PPVYJkkGq4lnI++naOvQkI
 NV5YvYlfyObj/tRVnMqyopFSKIZP+050U3ih6BSqprd7c/OhXdrcTydE2Xz3aua+YzFZ
 yJZ+vHfRfY9rsdSlfP8XGpH1nafQjMzBaKo01LyeH/7rrLSb9mn31vNHTZBLyV+RCrW8
 DRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Bsj+xuCyPB1Gye6kEoF0M0LpGQVZ+o7LqdOp4csMVeU=;
 fh=HIUvFRmKsoK/UdAqQObOVwzburIpRS4Q3IWL+IVclYM=;
 b=TyyGCiU93Gr0erRHnMzenTKxUdiPQMnwoOq//Yvb7opvwtfwS6YND1VGMN8FMizMHV
 hJPlG9UMagu2P4crIDMpVkqjqT+xbGR/Fl/c9iuj8ynV19LJApyR13360N98IIh7YuoS
 8PYZctJp2IEj6Cd73t6ip664OVBQjdONx8gQdb/Z1u0gceJFiNTD/kMKPg8U3RkIFXlT
 nGfhRYzv40zaTvn1ounO2H5BlszqjC4CfkjDl/y64CSy8IdhBofS43GHfUwdKKh/OUeo
 bH1oR6NNGOCRTDP5s3MmGkoNJmFr1WmXW0iZ7QvvN9vIPPhmq6A4fndjW9yNcSuhPdf/
 oG4Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774902701; x=1775507501; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bsj+xuCyPB1Gye6kEoF0M0LpGQVZ+o7LqdOp4csMVeU=;
 b=bZ+UYluHSKPqP3a1hVuUcfQQEbpxxYwAM3QUmIR+sPnOglL1LlD7yTT+br7KmpFs4z
 igOoK92h6MsQB+uQvYyDRrpG4Inv1gXwQeXrwjkAcUUwe0gBv16qivjlGDPihaOcErHt
 RGbwveXGTHRurPSZKvhONhb7wPHgXr3fCxcnjKgfVQw2a1Y9YhkhCT9o6lP9zUkRy4MU
 vTAoV4ABA24srYTMMs4P/44ZAS9L9RGWyxaycg8HnpFsPWi4n+Q0QBt7Tt7wi0kvs4/y
 RSX75p2IOKK0ZSp6D1nPE0OmmeQjoYJFzH8/fyZUuRFTDCOABz4tdjvAgkpJh+9akFmK
 35UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774902701; x=1775507501;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bsj+xuCyPB1Gye6kEoF0M0LpGQVZ+o7LqdOp4csMVeU=;
 b=nEw9Jqq19VfqLRwiS8U5HYpOyWPgxlw4MTRRwZBNNLCbiPh09fOKgIduqPSeY1WrBR
 9przw3OFjQcICsdWn5KU1eK6b0Zno9XGakIgGivx3Whq9dqHZ8qkbV3oQfBSKXjkWOcK
 8agmfM0s9GnMpmFCrNDngZU/uCiiD/B7/nSD0eqzu05m2EpbGKrU/sfR+NWedPd52SV6
 Qa5lmfY+FBYcun6OVaxd4M2q05nJuuxRjSpSz9/eRHWIIfK4oF9etC3Y66eHZBT6obxK
 uqgNdVpnb045v0c/LpNGbTQQqDsEIFywysh2zVwVOgp69a/30fTjAtqH5bMnCGLmh75m
 sY1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkal9hzyGi5tQvUlUZpwQLiLURKxUdx3MWneS8YnD9BBHyumpGhXgy80w9J8wgNPPubYJMGCSv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykBXhSUce2/Z2yDaf8XRbJQjglvfyo6Pu/AnOAnGvf2VZwQilM
 8bpvJw7yR73VGKlWy62eGgvilVhaLJNSdPDkoI3PNSLoeCLGYzAU5kkxW4KzQUQzEiFSx8JqKHf
 82HzeoXTxCdq/UcNt6Clb4Ttq7CIrhiQ=
X-Gm-Gg: ATEYQzxxGHxvTUeQpgH15bRxfqyRg37XXujHClz9ujzXnmSqYrd6ahIIdUNHos2otHI
 Hu2ixUAA6wjEKVgvszF7BiarkjW03S/C7tsa1mGIbKqRjn1pvJgA5pq2y5mD/LkV7N4iOxibAeG
 vZv4iUUpmM+v1/M/io/2ctCT7p9rcPv7GziIafUmJfYBwN3mcUgVzYiiAt+442jeRj4LWzEFj/4
 zOpQYYCpbnb+uFxm6CKamfreTWMYWlLXpnTIgW27anfCPYBvDnFpAd72B6D8S4ccPCHSbzJYdE7
 wHoKQaxJ6+unVpDQqvbQBV8zJVRa60E1JIQaXXYkJZfoyUeel5d6KADh4CDyTasxRRSd5w==
X-Received: by 2002:a05:7022:618c:b0:128:d359:92bb with SMTP id
 a92af1059eb24-12ab284aa0cmr3738200c88.1.1774902700805; Mon, 30 Mar 2026
 13:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260330195757.901509-1-benjamin.cheng@amd.com>
 <20260330195757.901509-2-benjamin.cheng@amd.com>
In-Reply-To: <20260330195757.901509-2-benjamin.cheng@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Mar 2026 16:31:29 -0400
X-Gm-Features: AQROBzB8ZTxcn52xIuEFyhYKvcAcrLa_x07dveo2IhX2-vOH1kQmN3HTiG3wqAM
Message-ID: <CADnq5_OPVULbARnkAOGsMkd_XLt9KyXUdnz9T0bMOZpYRuS5-w@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/amdgpu/vce: Prevent partial address patches
To: Benjamin Cheng <benjamin.cheng@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>, amd-gfx@lists.freedesktop.org, 
 Leo Liu <leo.liu@amd.com>, Ruijing Dong <ruijing.dong@amd.com>
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:benjamin.cheng@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:David.Wu3@amd.com,m:leo.liu@amd.com,m:ruijing.dong@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 89FC6360F93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 4:09=E2=80=AFPM Benjamin Cheng <benjamin.cheng@amd.=
com> wrote:
>
> In the case that only one of lo/hi is valid, the patching could result
> in a bad address written to in FW.

Missing your S-o-b.  WIth that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_vce.c
> index eb4a15db2ef2..efdebd9c0a1f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -680,6 +680,9 @@ static int amdgpu_vce_cs_reloc(struct amdgpu_cs_parse=
r *p, struct amdgpu_ib *ib,
>         uint64_t addr;
>         int r;
>
> +       if (lo >=3D ib->length_dw || hi >=3D ib->length_dw)
> +               return -EINVAL;
> +
>         if (index =3D=3D 0xffffffff)
>                 index =3D 0;
>
> --
> 2.53.0
>
