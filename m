Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH9mNt/Py2mILwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 15:45:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481FF36A71F
	for <lists+amd-gfx@lfdr.de>; Tue, 31 Mar 2026 15:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A3210E374;
	Tue, 31 Mar 2026 13:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cLe3ymuG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFAA10E2EE
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Mar 2026 13:45:00 +0000 (UTC)
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-12734af2cdcso198978c88.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 31 Mar 2026 06:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774964700; cv=none;
 d=google.com; s=arc-20240605;
 b=OW37PC12m1bFGGnuI1701T7t3c4BER4PsXRqMXAM0/1DIf6bqJrCr0ZGQCnCnspKH7
 T7YTr9IQZH03MLaZYcocaXw0+Sr8tNeOISQbNEYCEa+CBZhAuBP9uLfSlLCN1ylsZb9g
 dYseASyGxaIcV4EblZqWIqM0pyzACu5TGRwxI0jJmgB9BNr827t4AmQqAdk0xv+ziERn
 wqN5cYUnxU4TEkMDdmuataNUCYA0i5OTWVvh2GswC2A6cARtzVycXHTj5HyWL8KGbXdy
 +5dx7crP1T9dk8+cuP4pV41yul9CqUWJ5f51mzR/0HrAwrVnJ49vw9zeQW3act1A9OuY
 NQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=x1Wv4GTStK5dUv+vil9U2dPmARYtqVSRZJMM0V1l+mw=;
 fh=CqrzEAhawoVtsi/+9zB0iBBl7sAxbwRGd31G4p3NQiA=;
 b=BXqbNYcQbmDXHWF7Pa3ucOttZdBW/6f93E91uwFCeDkht3FRcKbh+YIpFo0d4zZTNn
 fg3ctFbJtWoMr3RVB4iW4B+6WE7H+HIs+xZb8Xu+m8syBSLcRdKjrulb9xsbfgkeXOuu
 LcpXhSVFwmUXj0MJxPOf1uWTRlIYyJ0SXypfuiSfQ4NHUgjPBwPgXLWQPSQSekYXdLtu
 liOL2EEmpoO9tgEPsmS8JYwPJLRaEnBrgq5XOXB0t4kZb0vOgqiGoYqyBW+2+aX1mMWE
 hw09aamGMjFPBpxjNQZXiLA50xqSfP+SSGqw+6hcCHKO7F5QCqtMzoM0Kof0YLw4qebR
 o9sg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774964700; x=1775569500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x1Wv4GTStK5dUv+vil9U2dPmARYtqVSRZJMM0V1l+mw=;
 b=cLe3ymuGpswbtLFY4MTffCJ7cg7jCpBf8MWxXz8O6ql2sq6idlZ1OT+VAwtGM6/Cas
 N31jEs46H0bsGHq1lR0xfydmaD8Ll+ZL0rCSjYv81rBBu3egLw6q9a9MvRJxV0N0cZhA
 XI9deQs+ol8WAR4/o/0/gsG2VeLx7H7MzmXcdAYTDJZap9Jz2KdtE9bjpWthRauwcZxA
 TCtNZFbxn8nbNSpH7wK/sqIxHdnueJPV4TRiWq1TxaMLtvurhKdRHbl/tP2FHRjBSGjH
 22hziGtMtmqgpD+X9/zdom6WOaBcVdQdMNEkuavXQ6r3GqNq3Wnhs4mJ6xy9fvvlEjMi
 Y9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774964700; x=1775569500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x1Wv4GTStK5dUv+vil9U2dPmARYtqVSRZJMM0V1l+mw=;
 b=rYBrwqOVaM2Q3R11vyftYEb/KejW9qmNmizVBLt0TMEWhSrWtr3CndyYjed3/Lc8fK
 TLRWDyLSpU2kJgSP/Op7+bFwR7K4yICaCk2pcjlrwoPgRdSWVXqId8nPwxlpDCeR37Fm
 H6+QeHVk7P3OhpWXhhY431vHBogrhzK01SBFBAPxeJXk/muPqpt3IxkfyzrvWcjHiMUB
 ua5i4AaPX6cujqIguPT/ty5rHxitOLWWGdT79oO1ILE/c7B70YiKDYfS0APMB6kh5asj
 t8FgMWuN91ApzSbp8HjFiA8+s3Gwe6/X/3nlXLtZARlmZv0LvMHUzAgNGVxWpC8bTirW
 2qFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG3G87vtA6htnqee83+uP2q2HuP1b6MBtZ3Jd5NDvsCPyOdh8wzJ4rr7+HhbWZIwTh7ig3ZaZr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+phVuCvvoqisXfxbrYMD/xoM53btE22sxPK9zcBsGXQIqwVoE
 SpdcNrfYo7yAYhDaejC8v8DkkTZrvy7oBSyzD8qNskAirz9Y6ArEPB80YGg2xJEAfqGi41RkplS
 g1KlgDjBeRxYjlK34/+tEAyNQXoK3GbE=
X-Gm-Gg: ATEYQzyJBzTgoLdEDDN75wlm/wt2/G9KY1+OyHrArAEP6iIH0qkCO/TC5X3+UKD+Ifp
 zW3P1ssqG3d742mrWDyKFycyGY8Dvq8RCEgL4I7uUqcjK5aVff96yrIQ/BXKLcYu1teJiMlD7ZP
 CTrG/aDwcCg0fMurgBc+tOcgy+mGfvn5wmojQ3Gp0Umudp+A1jOsYKbICaTFXD1uLnoIu/JKpkX
 LfW5N0HcxeY7AWzdLGkWLuJS3ElSq22A75ACxxd7gPG4UR5GkAVGGe0hbyUL0EY1xsCa7pUQBqS
 /u9iR7iepeW1QdRq8T6todOdzudLpUc1aLLJQleNjztq7Ysy0290XMLF5roYG+9ogiPOAQ==
X-Received: by 2002:a05:7022:f94:b0:124:af80:9d0c with SMTP id
 a92af1059eb24-12ab275705fmr4263133c88.0.1774964699776; Tue, 31 Mar 2026
 06:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260313144715.252069-1-marco.crivellari@suse.com>
 <CAAofZF7bfoL8j-CvFEHBnTcAX-y2hM+TDrPEEHbWh3kxMqnCvA@mail.gmail.com>
In-Reply-To: <CAAofZF7bfoL8j-CvFEHBnTcAX-y2hM+TDrPEEHbWh3kxMqnCvA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Mar 2026 09:44:48 -0400
X-Gm-Features: AQROBzCMt61mCyu6bGNE75SAFzHlQOE47b27wQqPXJ4EIt6qr57qUtz6dS8cGkQ
Message-ID: <CADnq5_P-C6pCm8EW9EXhGWNQggg_ycfZcmD9B_BbvWRmSA6mkg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Replace use of system_wq with
 system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Christian Konig <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:marco.crivellari@suse.com,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:tj@kernel.org,m:jiangshanlai@gmail.com,m:frederic@kernel.org,m:bigeasy@linutronix.de,m:mhocko@suse.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,amd.com,igalia.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,suse.com:email]
X-Rspamd-Queue-Id: 481FF36A71F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Applied.  Thanks!

Alex

On Tue, Mar 31, 2026 at 7:09=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Hi,
>
> On Fri, Mar 13, 2026 at 3:47=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Gentle ping.
>
> Thanks!
>
> --
>
> Marco Crivellari
>
> L3 Support Engineer
