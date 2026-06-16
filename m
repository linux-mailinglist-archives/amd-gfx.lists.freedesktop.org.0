Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id msncKtldMWqciAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:29:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C646907FC
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jun 2026 16:29:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sukjkZDt;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92910EBB4;
	Tue, 16 Jun 2026 14:29:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com
 [74.125.82.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02A110EBB4
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 14:29:42 +0000 (UTC)
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-304d3d3d8f8so563400eec.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 07:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781620182; cv=none;
 d=google.com; s=arc-20240605;
 b=CTOgiYwEEFXM+a9Xepq+B22tNCNUjZDS4Gzh+eyYj3QfMZZDkyuTXYxpNjedHP1tUa
 YuwG7sL22vio65X3z0sALD23/ixIRxL2SHktCRLNCKCE9tG7nvZ+L2wkhdY69bSLhigJ
 +mxwGuXSpBLCJ9QwO54t1hTLvWr27Wx2QMmOHVUWHK4D+FXN0M6NEKWjYMR4mIy297p1
 hMkk6UZNxeh0tHNg8Zy4kzI4mbZYQjtBcTG7xp6QhgPn/CFp0sAUI4V5snq0x/3nfVCq
 kTTSD7LaGUivLD8/Mn2YAUWwWO3SfT9cH3j0eyj2KZChjGutllCuvAjyNkyrU1ciWK8F
 EwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vfJJneV1qILopKt6f5xWlrSyWb8ZZ42PxwlpIru+T3w=;
 fh=b2zUEOVqwzNRSKvBZVdnjUzPMV9XcOolFj7HTymr1H8=;
 b=a3i9mzOsfrIEyR9FGGyYk2PdfeWL+dLrtkec9iS6qfYNLm5TABD6nVOzuBsfvRKZoT
 YgWSbfNCvswlQY2XMrQiIvhBA/yu0RsAmug9XiceOgA4KlSf4/6Bvuh9ICS543LpZgwK
 jbAwBPush+vLv5zihagxFjhzpxiN4yD6Q1XARRJtDTF8idFPiQbu7EfQ4Jkw35VuDvql
 Hm0uEZEg0juRgKxJivEQgf2xprwumVIoDl8FhtFh135UEvaCuTkjS+nwhmgGSoGBtkZ9
 F1z0J11TxhP5GykC1jHhyEMT2YFzYnKx1DPm/tjg6JhJwbADKrb8BShEi/t8OeZmsDi2
 e59w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781620182; x=1782224982; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfJJneV1qILopKt6f5xWlrSyWb8ZZ42PxwlpIru+T3w=;
 b=sukjkZDtpl8drNEzeFlgS2dgoj6kKIRivwK9EeODatqww9TvIE8g6dhcGeMMRq8x5Z
 ukm4QZJt9edjeKBm5lnX1MStQK3mTGHjzVTTXJerCnKQ71OUVctZEnnupmz0cY2KuLiG
 rt5cYmpK2g1N6hAjCC0BdcCNUldEW4xkppkA+m2pcpb9jvRPc0SxPFZiUXSFAshi9v2o
 TXQemj/NQlh4F16qu0b9FYUpY+HuWYCwVohMCF/+wzgXxMWpu3xzDBkYKu/Dxew2mHpX
 2BUc2SmRebC1QF/b7OoiwILAh1EeAzZS9JVf1LIFkNuVrc6uBiyhg4O+MvwabttWx5vj
 SjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781620182; x=1782224982;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vfJJneV1qILopKt6f5xWlrSyWb8ZZ42PxwlpIru+T3w=;
 b=RrJV/S371VF1Fde+3lB7ECffAc2Y+Nul/f2qKgH/gn4NkvuF6A9RXNH0l9osUTgPV8
 e1X7PTtn98RS4aXeY0YBO4JJz+yQJnI3wi5TrGOZ5PsVzGK7wnhjc5g5ahQRydG9nurA
 xn+HcniLUs3tdeKLoo1rH217dmqIufppGgT6xSaqJbhoOBC6OKwBbIdOovf2FCCpbXKc
 8Ka85oDcndVdVonLWtriWwXhwS3nTlVdZNC66wMcs+SuGaelLxkS4EI9dYfEvJ0Zgjs6
 pT8V7F0wJIEBFEmL40w36Wn7QNy/8MLDXwKOjzxgiknKSjfWAHnqsET8678jaEqTkjrq
 lkHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8IkXQtIcu2+Fe9CjHuk9Wt+qGkagpD7nyCwEsWU6xdrx1yMwc5SzBFVNR/T1qRKD00bDD3wYPP@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcXZgnMK4qmx/41aZOz8Sys4C14cPoAVjx+REftmqJqAg0HKSW
 F9tU3YiZ6YYB0ZUCNPgV00wRm0NBfmkSxE2Vujs+NTELJ9Uyy/jvcAyE7rZmmYaAXhg2T+na/lr
 1tYK2/iN1KAAZ/7qRSjknCHCxwmw+Ya8=
X-Gm-Gg: Acq92OGPAB0GpssEcC5g50ZPwvjDws5NJnBPG4DJo63+yUFhO604MqXsbdZu8ggAG2I
 vDZIQ5RuxaNJbpoY2vx3P0/+BpQDGmnpuYHc9eZCnRajDDMaq/nLuFZIa7Tpt0r5Fe1Fl9o/GR1
 2B/XZRg4U33zNQXC9vEndKj/+0Q1wD132NzqXT9elehZEpAthQ+FnHtYToGQ40ogMoJhy3U2GH2
 Jon36V07jf8wftjaGkSI66ahATyS+UDHqfpEALFr5v48FZaCuSb9eqER4sxVb9o/gZgXA4Us85i
 M3dQfJI70keAo2I9UJLfful2Qk9gsdjCB+NaP0+rnK0318GDc7Ttqs7jcV1eVV4xycgFng==
X-Received: by 2002:a05:7300:641a:b0:304:1d92:42ab with SMTP id
 5a478bee46e88-3081ff5f11fmr4963849eec.2.1781620182010; Tue, 16 Jun 2026
 07:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260513170849.27061-1-timur.kristof@gmail.com>
 <20260513170849.27061-4-timur.kristof@gmail.com>
 <ae08836c-95b6-42a1-8173-108c5b4b5925@ursulin.net>
In-Reply-To: <ae08836c-95b6-42a1-8173-108c5b4b5925@ursulin.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jun 2026 10:29:30 -0400
X-Gm-Features: AVVi8CfGTbw16bkPB21PY2ShKerlWB9of_zSgHLa-Rl-yER9a55QDZjvt5ovvcE
Message-ID: <CADnq5_OZbTwce-xioZmsy6isWPp2ZKh+vCvUuD0JiABteesRyA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Use system unbound workqueue for soft IH
 ring
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
 christian.koenig@amd.com, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 Natalie Vock <natalie.vock@gmx.de>, Melissa Wen <mwen@igalia.com>,
 amir.shetaia@amd.com
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,amd.com,gmx.de,igalia.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tursulin@ursulin.net,m:timur.kristof@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:maraeo@gmail.com,m:natalie.vock@gmx.de,m:mwen@igalia.com,m:amir.shetaia@amd.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,ursulin.net:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16C646907FC

Applied.  Thanks!

On Tue, Jun 16, 2026 at 8:19=E2=80=AFAM Tvrtko Ursulin <tursulin@ursulin.ne=
t> wrote:
>
>
> On 13/05/2026 18:08, Timur Krist=C3=B3f wrote:
> > Allow the kernel to dispatch the soft IH work on other CPUs.
> >
> > Otherwise it can happen that the soft IH ring fills up
> > before it actually starts processing anything, which
> > can easily happen with retry page faults, in which case
> > the CP repeatedly spams the CPU with a lot of interrupts.
> >
> > This significantly improves retry page fault handling on
> > GPUs that don't have the filter CAM and must rely on
> > software based filtering.
> >
> > Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_irq.c
> > index 82bc6d657e5a..515fc32051c8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > @@ -549,7 +549,7 @@ void amdgpu_irq_delegate(struct amdgpu_device *adev=
,
> >                        unsigned int num_dw)
> >   {
> >       amdgpu_ih_ring_write(adev, &adev->irq.ih_soft, entry->iv_entry, n=
um_dw);
> > -     schedule_work(&adev->irq.ih_soft_work);
> > +     queue_work(system_unbound_wq, &adev->irq.ih_soft_work);
> >   }
> >
> >   /**
>
> Look good to me.
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Maybe later we can consider a high priority driver specific worker or
> something but for now moving away from default system percpu sounds like
> it addresses the problem statement.
>
> Regards,
>
> Tvrtko
>
