Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNSeACCnoWmivQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 15:16:00 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE91B89A2
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 15:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25DBB10EB91;
	Fri, 27 Feb 2026 14:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GY1lD4nn";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86A0710EB91
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 14:15:54 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2bde2674894so68794eec.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 06:15:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772201754; cv=none;
 d=google.com; s=arc-20240605;
 b=IvebnzIRFUHmGeNepRnBQObzjSUstz4WrNaPTQlyKWr6wUjGHsaQWwQHRlPNwY7+3t
 XZCna9fKHhqTQRL0VakymqROza6WrnmSmB3G4X3N5iqLWmp6VgOAjoXAGmuedYZJkj1f
 /cqYFglI13pp5KUkuRi4rHMJRWuhiKHde6jp0zGn9koqPRaMQNkWd7mUWgBoy6wOLfUi
 gGfbQyuiI4mga10POKvl+2zly0a22gQrRGWjBZ01w4TVWmir5JRl9jAqER9FrgEVtEmv
 QlHGe3sPE+34mLTS4+u/1V025tp2OCgbosk49qt7QkjP1VtXD1z3x3MtlQjYGtFG6qLJ
 BoPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FDGG2eMGK3eChCkiMnr0ODzJ1+O+mYmXM68Z+wUVoIY=;
 fh=gf4np/dma38JjuJC3NR0JaE+G2nPdt83N0TFJFd1b58=;
 b=SD3vQxyj8p50SuW4l6GvLetc8Vy59MU9CTpNqGzrlN2viElYYIigaYARjDhaYP01OJ
 ANwgrum5JUZxsQFr+p6RugrTzpb7QuPm1/2kalX/d9ofkG7M5Y6/bmtl7UdQkwjqFiLF
 2KbpZjhYw3zbKy8L/M3QW7XWX2g1b+8qLvElJYiWroSnlMMGAFAyCHvBQQXQ1xM4O4jK
 s4Df4qd0kinooBvYt02PbQmSlOK7zyzImCiBoKXH7xVQK66G23n5g0W0tIny/9LqoK4x
 hxQ6rxf5sydRCftGzeDGT6V8A06rfD0zeQ25tfSi8p0jkAoWOPkr+M7kE/z0PgcKKmhp
 OS/A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772201754; x=1772806554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FDGG2eMGK3eChCkiMnr0ODzJ1+O+mYmXM68Z+wUVoIY=;
 b=GY1lD4nna03XgXHhA1kp+SjjUEV0fhG/vpGfXW/fBP5etmOuKHqwCb/A7KqlmvjP6m
 CmhIT7QnYyOlakh62bdDVcA3cXkHhQVs/SE9SPsC/ejVYWrs0BoiquQDkyEh9M1j/ztj
 Jk10CE3pAP9O+0JlZyZ/CYA0LRevqWKoXFZG9tFQOYwQZwV4F73AF9dCO3fKjkHS2L+1
 K+5zK1Vjp9xCYNDcLp1JzThNjtqO4dTiUVwsm6rBiTf0bbT3SordR6GtlMG/ORd5Jma5
 yVRUo52RBNQBskwtW43EG+EDXUiSN5Lor7FDMS8CMIQImRBNE6C+pbOFPOZZsLGMI7o7
 N4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772201754; x=1772806554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FDGG2eMGK3eChCkiMnr0ODzJ1+O+mYmXM68Z+wUVoIY=;
 b=XQvQDkhPnMBmm590k9EBL+5BHvupsF6Oqf/bh2WwN5iyQy/lEQlwhBNGm5S+/mUqsE
 axqr736fhAgAfm8om9jhgTf2uuTWVCUEFINkKlsJls9ILFaVHkIu8Huj9Wp4aayssjp4
 UsGtquCBXVhJIOhbeMTSuVo7PMl0+MyK0auNZlgnwQYUF8ko0Uk/3NsAlEliRSOagWxs
 Dh+0jZnbaY9Hg3TKA2QfcOCbaZ69+G8g2FBH3VAZmxCJRl21ZMiun2SBuUXAWC7nK2Sr
 rISHzKGod63O+wkthgVVo9nHRS/3Q6AN/1SQ0S7LIXKnpm6/GpqnohpMhjn7jc8qww9x
 2dSA==
X-Gm-Message-State: AOJu0YyrVACwK6yV1PxMAXTzlm0OjzwNmoPmK2gXT7l+nwCzJJm2ep4M
 wibTKn204D8s2ZK1i9HOsVdcpqZb5vRqO7H6yUPP1hl3YHvJwF2UnZUx4CtwCoHNtxhXx6z2JqX
 d3HnnHjIMQO3apa60oOjT7oGX+lCzlew=
X-Gm-Gg: ATEYQzzQYJzShkLtPOgegzg77y5JEmGvIqb6YZjDYwakNpe2qt20jjtoPvhyhqTIsde
 N+UsFF4PKVkW8BMvscqY/3VAKHcdY32JAB+h1bqWPYT+v1aqvSkCghW91JycqcLjTxvC8YVzfkW
 ULDYRNIcmuSDpnB/9qHeVbCWdVtCZfG3pVXhkDxUspSa25bpzzBPAbUYTnfbfMkqineQVdHJR9K
 IGthIzZ3o6eXk9oM3X2FB7T6tMqYQtahIHQ1AS3a5fc29KuYflNBGXNLAoPN7eR4vYsMTZb2bVr
 Ji1cmMNcIIOp4g0f9tpr0f+K4uHLmxPs7MClqVmM3tG/9kfqPorD1XU3cOipQTXOYuUwfA==
X-Received: by 2002:a05:7022:ec12:b0:122:33e:6ec1 with SMTP id
 a92af1059eb24-1278fa835a9mr588889c88.0.1772201753368; Fri, 27 Feb 2026
 06:15:53 -0800 (PST)
MIME-Version: 1.0
References: <VI0P251MB11869B2637BE556CFA76E6C89772A@VI0P251MB1186.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <VI0P251MB11869B2637BE556CFA76E6C89772A@VI0P251MB1186.EURP251.PROD.OUTLOOK.COM>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 27 Feb 2026 09:15:42 -0500
X-Gm-Features: AaiRm51lPVGx49GlFmA7VFNlIt3KcMojw06MPNfX2KfAFR5MNjPUlV4Am1__6is
Message-ID: <CADnq5_MTCBEcdu_c_4g=-fq22negivw_98r_NOzmnAHVXkdL=Q@mail.gmail.com>
Subject: Re: Inquiry: Raven Ridge `RLC_RESTORE_LIST_CNTL` failure (0xFFFF300F)
 on Kernel 6.17 - Missing GFX9 fix?
To: outlook user <RACP@outlook.fr>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[outlook.fr];
	FORGED_RECIPIENTS(0.00)[m:RACP@outlook.fr,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,outlook.fr:email]
X-Rspamd-Queue-Id: 51FE91B89A2
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 4:29=E2=80=AFAM outlook user <RACP@outlook.fr> wrot=
e:
>
> > Hi team,
> >
> > I am running a Raven Ridge APU (Ryzen 5 3500U, device 0x15D8) on kernel=
 6.17.
> >
> > **The Issue:**
> > I see persistent firmware load failures at boot:
> > `amdgpu: failed to load ucode RLC_RESTORE_LIST_CNTL`
> > `psp gfx command LOAD_IP_FW(0x6) failed and response status is (0xFFFF3=
00F)`
> >
> > **Context:**
> > I noticed the recent patch *[PATCH] drm/amdgpu: fixing rlc firmware loa=
ding failure issue* (Aug 2024) which fixed header size mismatch issues for =
GFX10 by switching to `request_firmware`.
> >
> > **My Question:**
> > Should this fix also apply to GFX9 (gfx_v9_0.c)?
> >
> > My system is currently using `amdgpu_ucode_request` for the "kicker" pa=
th, and the hardware rejects the firmware (likely due to the signature/head=
er mismatch mentioned in the GFX10 patch). This leaves the GPU without RLC =
loaded, leading to intermittent system freezes.
> >
> > Is this a known gap for Raven Ridge, or is there a specific firmware ve=
rsion I should be using?
> >

That gfx10 patch is unrelated and not applicable.  It sounds more like
your firmware file on disk or in your initrd may have gotten
corrupted.  If that's not the issue, can you try older (or newer
depending on what versions you are using) firmware files for your GPU?

Alex
