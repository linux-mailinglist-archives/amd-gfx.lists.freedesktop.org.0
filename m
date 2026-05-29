Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKk1IW40HWpbWQkAu9opvQ:T3
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:44 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF5D61ADB7
	for <lists+amd-gfx@lfdr.de>; Mon, 01 Jun 2026 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B93112EE4;
	Mon,  1 Jun 2026 07:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WeJvkyPy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4971122F2
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 17:20:14 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-bd4f7f05e90so2426407166b.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 10:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780075213; cv=none;
 d=google.com; s=arc-20240605;
 b=A2I38X5G+tPQA+wBk/GhlYv7fJ6SDgw6XHIjVuqef7R8plz2LKZz6BKpKraOcIHnNt
 17tHmB3ZmYfccxK2cRD/qC4DOTmM/kd+P7hX0ATDm35s21EWJZ/oHEQcbmqUh0khtxXA
 +yLie0kuFn/KrNtXR7Qu7mvgTWQ/BTRPncusb3OWPlwIwnI1Rxtc3ergYPjCvaEuW86K
 eRX7ltXOL1Apq6QD77C+hDPMW6B7wpbLJZb/OEa+iYXpmTrD35SbeDnZ8ZAZIfTnaOJf
 wstYLw/wnu0cZCLb8wSN8odHy1BkF9D0uny5PZ6DeXN9kXDjQKzC3uEmZRgb6IgBVe12
 UYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
 fh=mtAgAg1x6dVCbtHnUW2KC/uwxWav4iLTNx7iyxxuz5Q=;
 b=lpv8Qwl4b79Yuht95WXDwWA7SgrdWFYVwUPwXQu2lmiFXvmuqDws5d7QtNAMgx6+kl
 ZVwz3D+PIGkVuva9YniYAHBBAqR06rBGnx4PoCz8DfEE46R67mjKzsQ0Nitu7dPEJ8jA
 m/2KE5s+75qaiYsS1GksHQIdfgUa+2j2+IwgDG8RDvSRSbzlunMMX5lKOLKqI5fZWWG6
 /McDL+PGWk3BEqccV5NLWEZX2kWm1bB/J9af2B1mBUx7PuoRurpyceVOFo9hM1ztFIuv
 LHnaBZ2iuvxrTYRxrTZqYIIWr1T+X8vAIHGMeya/U25TEYRvacG4k1HkCSDmWbARFPnC
 E2dQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780075213; x=1780680013; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
 b=WeJvkyPy2IRhSaqmbtUNj9IeVN6cle7VxYj1qvOk6btdKVHE6tRvuhPhvZPqylwcH0
 PqYasGtkBrD9NoOp8b+D+vu5yEH4FU+yJZA+s1MME4+WYiXd3wl47mNN2QTiANXG69uO
 RhVbYQOqw7EGl1JKkVbQ2oeNbr/GPC6kKzW04iTxkImKzZZMXDlADMTLjRPZ8zHOZiN/
 wCDHri/iws/XLlPAkDkJ4ZpAe31UPQZzLLz2ZEk4gh8MDaBomoLB5wlj19JqHQcaVeHf
 KFqAT+/Y0FQLR5NmhUCziSM6kZB0mhiiH6fUbUchuT7aKT07SDdtfRM9pIU46ARZbLbO
 vEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780075213; x=1780680013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ynZ2XBdbslE1WoArPNQQVVLJB+hS3g1ZlbeqlJR3SQc=;
 b=VyMRzJMkywZEm8rsfixQAFHgY3VXLzYfSIw8K5sIWwIfPf1aKwSrlUYgRT2zAIJvpL
 JuWVYjXvSjldvgz28ntFsOrLQb9QEveJvFHY/EXjOM20qhDGvYprnA0W6Wrn4rhR4xTy
 yxCQduv5IK4JtpQ7x1gh0Y7yeBpyJt/tHRqiURsNZk6uP1ov8P5JP6B9lNgROU+f7fCG
 ZXnp5+ydAfNz9cUULgrHVn20yZF32uiyaBoAMNF8UTobCefyeISQFFT7QZxf/R/9mwpr
 JjHB1FCXbUOTfLg9h1mpCOa86YMxqBHZOL6u37o//fzS/DZXgWL1OmmfSv1Rwh+T0SsL
 MhJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+nKof/WeGo5txHXiZfSa+XTO1FaYc88ZgX7jmtdJ6sygnUSCEqABzhdnBWEY1OHvgiiIh9OzZa@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzorETXhouDW7L8aIDOgOe8D4TPOewjWHA24U3YHGFkj8UKS5wD
 wfDk8Y8AtptSJPixOAwoCHEFNB96kuWhO7JoeuVncuio+MMrC4Tl4Hzx7ZVIS0+4jctyNloTuM5
 ZLDq+AidN1tBTctr7QC8gSh4SJ8Q911c=
X-Gm-Gg: Acq92OG3UY8umiFeZ47N+eKME8hKstZi9dhLrogTIeIYDw6YGwRg+FszqmTBX6Ls1/6
 1IH0Hif8Yq0DonSOfrZvu/isSfjXhuPEsVBTM84LKGpGWQSux4bfIfHiiBMZOUhKA+tHB022z0n
 VEM56aYOn3eCXe7n1lhRQiX+5Y/vC48XgyaQzQ310CvAvjqdeIsHPwFSAcl6wK6i0sSOmrZB/TA
 XN5PIDm+wQbxxb+dzLlgczXjhU38bqe2YqQhPb3biDg/xk6fYcyypTa9SiKW/ciP9a1wSOyrJMp
 q/C+GydjBepC8BNJw4DwaKWox1mZ4UeaQz38bI4bee8unwNcUg==
X-Received: by 2002:a17:907:9282:b0:bd4:6da5:d5b2 with SMTP id
 a640c23a62f3a-beab0dd8aecmr26412166b.1.1780075213265; Fri, 29 May 2026
 10:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260520225245.2962-1-spasswolf@web.de>
 <fnrz73n5jojl2wlbgrsjdtu5zuwykwbcjzznaijbquuovpoand@i6ihdqn7a6zv>
 <s7cu3dpioidx6mepmai6eyj2pxjs4skbw7v534zbzs6g2fwcis@cvokidcxy3xa>
 <4f548d61b2dd12e01f401ce4b8c865f238f7b23c.camel@web.de> <878q9dvzh0.ffs@tglx>
 <50e5e76bc13256e3f5b3301e92f159957c3d6762.camel@web.de>
 <CAGudoHGk1CP3gRQLCV85AFHKx6vBEyKySOn4J+AZVAP2FkrN3g@mail.gmail.com>
 <70676dae700e6a40989315bf31ea269a509ddc0f.camel@web.de>
 <CAGudoHEX=Su_ehV8nNP_6Onfh=hB6uiyTTCojR7nSOkEj6zh4Q@mail.gmail.com>
 <7e8f3a515208583d06c9b5ca18a3e007a8c6b692.camel@web.de>
In-Reply-To: <7e8f3a515208583d06c9b5ca18a3e007a8c6b692.camel@web.de>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 29 May 2026 19:20:00 +0200
X-Gm-Features: AVHnY4LcAg9EMC0vBy9pozkVNxhEfZnN5xmOlqt1ph5yPNhhQZBBmhxfALKw18o
Message-ID: <CAGudoHFPXP+i3q4HsZqmZaRxw-UjXX_RiUosteVESO2uv-qhew@mail.gmail.com>
Subject: Re: context switch within RCU read-side critical section in
 next-20260518+ with PREEMPT_RT
To: Bert Karwatzki <spasswolf@web.de>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-next@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, adobriyan@gmail.com, jack@suse.cz, 
 viro@zeniv.linux.org.uk, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 01 Jun 2026 07:27:37 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DATE_IN_PAST(1.00)[62];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:spasswolf@web.de,m:tglx@linutronix.de,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:adobriyan@gmail.com,m:jack@suse.cz,m:viro@zeniv.linux.org.uk,m:bigeasy@linutronix.de,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mjguzik@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mjguzik@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,vger.kernel.org,lists.linux.dev,gmail.com,suse.cz,zeniv.linux.org.uk,amd.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: AFF5D61ADB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 7:59=E2=80=AFPM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> Am Donnerstag, dem 21.05.2026 um 14:01 +0200 schrieb Mateusz Guzik:
> >
> > So overall I think we are done here.
> >
> > Thank you for testing and sorry for the breakage.
>
> Just as a reminder, this has not been fixed in linux-next, yet,
> up to version next-20260528.
>

I sent a v4 of the patchset with some extra touch ups:
https://lore.kernel.org/linux-fsdevel/20260529171840.2576445-1-mjguzik@gmai=
l.com/T/#t
