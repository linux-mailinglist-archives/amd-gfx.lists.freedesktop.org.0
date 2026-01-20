Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MucJqmrb2miEwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23393475B3
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jan 2026 17:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778B010E5BF;
	Tue, 20 Jan 2026 11:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="NaJRCerM";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273F910E133
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jan 2026 11:23:15 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-50150bc7731so80033491cf.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jan 2026 03:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908194; cv=none;
 d=google.com; s=arc-20240605;
 b=U6EF+IeRYTrnQMbm8iEGK+TlLMOTLYYj0yIcBLNzu/iMnOtlMARhWrPdVujqY1mge5
 foB/8wLyTpwG0S+/J4u0dIR+C33Ko5dvMHU/wg4q/Ycbz3ww8TN5psF/pz3VvT9fJdmm
 4ARQUbwEnKHHfdyMSnKxurtu9YfIshgEDVGx6dyad0ZOT/awi26m0t14OxC6JypNMl6u
 Ai9+Knv+yUlB9aqQJ0/q7NgHhyP+GaEwzavFR6FQuwSPNUlm+f6XjgHgtT59iCYx6K4z
 yWYvWwe2Pge3m3EC8Hq3wenqqH116tvMw+aZ5M/fxOhPbQG3JhmtDqFTboe9yBPmBNuu
 EMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 fh=3gEchNWo6eIlp9y4zxY+SZhhJT/xAAdUQkZYcm788Q4=;
 b=UpJhA5VTqZXktD7Xe8HS2i1IsAEmScQuw48xUzHr9Yq3fKfXNk1hYKTyziNqbM71bE
 51EuOBVrLzsMaGhC2ufEaKqMpWYoBxKKpt0ihVBVMy194lRJvFHAvMMrFf0EPq0HVmSN
 IEp9zpzeIf8wJruNUALt7Ms3EOZFE2+DglwztqdthCrcS/mpnrjuKwBrBYcH5fb3r+T5
 up1jdQZJbw/pJjZ8XTC/i+dCBtnQg2iBLCK1ysml9HSHh+NK3mQ78L7m8Kn6/2zVJwvW
 SFN6QsEX5Ep02h8Ia/4o4OjeaKPTJj+rEym+XRud5Uqe68AO2IJ8gKuYL08kjyMmKfYw
 6vIg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1768908194; x=1769512994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 b=NaJRCerM9kbdQtgzcJiFrTuP0lu3mmmRsX+74MVuVWFBj2CKiw4C1yZpoCN2CC3b+W
 SoSAlLGoCZuGwCpaeay4MbaofHXk6wsu/7BEICgJz0ZLQEVuycNi8DarUizgLT0OIac9
 FUuIZeFC3tjFFuVh3+YIQ4kT75I1dHX4KzFNrYsLKNxNjswck3MRy5q5x6dS0RURRL9P
 lfREiihPd5bXfpChNq8FMQklM+mi9gEX55807AfGSAZ1nM/fDZGPU2rzQ4qfod8oF/iH
 CNuwrpFPXe5j7WkhLE4/ZqzzFylD2dEe+kmavTMlmmPDaDwgY8+lFOtOD+QoH7nh5OHM
 PcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768908194; x=1769512994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aHJ4AV07cg+NHi3MzSiAdSIIdl4XbTkYKA+Ccgm1HOA=;
 b=BpAzJvQWylyEvBYiWG88gmHau+96CP6OvpNVJXw4qiq/rGwwfH4TbWlSSecS7BW9fk
 j1v/wWJ+pY/KKZA2m5WzKyKWoZZMborCGmDCYCniLqSlRW8AxJ+suTpAuUj/hpLvBwWR
 ECF8Cm3rH/DsMDr+Gd9O9amhzkjFlrNI88Q4RQH4guNfWLDShQZS2RmI820GY1VOy0vE
 xNvLbvAwxpdnz8rLWJsvG4HaCnLfwJWdu9xCrrndxnX09Xrh+PaZ0MLtW5M+9oe3RjB5
 b2kM5GyLJdmw0dxVtXB3fMoXelhngpqJ0rdUm3gTgIeWRsd8QgHUyIQHDQHYCyVQikwA
 Nu9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHr7zkLIYsFspVMM6h43t8JLm2s6nXPEq67oPWAOhw0biCM6W0crAK9NIALezImh8bqMI+wYZ9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycB7KBjQHfSS+RD4Nr6mZMQ4RjnFoQuJohkPpGh6NwDJNzAHDb
 Z5x4yuPuuQjEGH6Pxi0Guj3hJ0d6ATgFzcsLoQQs0tYKAZcRtyiUOssYc5GbAX1GgDZEpr1WgaF
 u3YKaxc+VyrgrG5OXteZBGZgpeh35XPnr0Yvxooku+Q==
X-Gm-Gg: AY/fxX7OCYBCIv68vIDnjCM7+Ote6OKX3FizIuKXbcGy/uVGFDoyjaKu/NFa+IcXnOG
 ty1XRsnBWRSnBiFvUmhDXZ2B7Nv9gylHvlw7Yb+jDEvtBean4mbgIpODXUE+xzMn649CBq+rJpj
 GFoLkV6eGHPVJzzfUY7PGLpGz1f6oVFSiBOrkNiJEKPTfTagOjDZgI/GJQOQm1dxgKNTGOoz4LP
 Vfx7E1p9AoNdHZ+N73GzNWSFT9W+MGMHpSoHVU+lRIfjEtq1tKHQ8BxWLE39M6DBoor
X-Received: by 2002:ac8:57d2:0:b0:4f1:e988:d786 with SMTP id
 d75a77b69052e-502a1fac726mr188065721cf.80.1768908194161; Tue, 20 Jan 2026
 03:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
 <20260119011146.62302-16-tomasz.pakula.oficjalny@gmail.com>
 <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
In-Reply-To: <82645a06-2d15-48fe-a250-56d736d636da@mailbox.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 20 Jan 2026 11:23:02 +0000
X-Gm-Features: AZwV_QifkBpxkkL5Tc3nuCYS_D5SLTGXmOunBIV70V1xvj5YWx3lMpqA4g9a_Xw
Message-ID: <CAPj87rPyt2+cWjM7KmpRzY4sBgaUzZBOS3FJoxF+PjkijapTag@mail.gmail.com>
Subject: Re: [PATCH 15/17] drm/amd/display: Trigger ALLM if it's available
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>, 
 alexander.deucher@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, bernhard.berger@gmail.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:tomasz.pakula.oficjalny@gmail.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bernhard.berger@gmail.com,m:tomaszpakulaoficjalny@gmail.com,m:bernhardberger@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,fooishbar.org:dkim,mail.gmail.com:mid,mailbox.org:email]
X-Rspamd-Queue-Id: 23393475B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Tue, 20 Jan 2026 at 10:33, Michel D=C3=A4nzer <michel.daenzer@mailbox.or=
g> wrote:
> On 1/19/26 02:11, Tomasz Paku=C5=82a wrote:
> > [Why]
> > ALLM automatically puts TVs into low latency modes (gaming modes) which
> > we basically always want for PC use, be it gaming, or using precise
> > inputs like mice and keyboards.
>
> How about e.g. video playback though?
>
> It might make sense to let the Wayland compositor control this, e.g. via =
the Wayland content type hint protocol.

Yes, I think this should be a connector property. We'll happily
implement support for Weston as the uAPI vehicle.

Cheers,
Daniel
