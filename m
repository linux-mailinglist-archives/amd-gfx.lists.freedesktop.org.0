Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +YSICUQjMGrbOgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 18:07:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793A86881C7
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 18:07:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kyH64PaC;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D56E10E53D;
	Mon, 15 Jun 2026 16:07:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F8310E53A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 16:07:28 +0000 (UTC)
Received: by mail-dl1-f43.google.com with SMTP id
 a92af1059eb24-137dd3b29d5so202520c88.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 09:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781539648; cv=none;
 d=google.com; s=arc-20240605;
 b=OSHNZfPgw9nZc+fNap/wXf259usksPi9h8cBaB/9+sBGC+frRQB92P+0R+kZc+SePE
 L7LCKIMi81kT5fsmzT5oh5AEVVoh1wOjRSVNFsLDsjjpxhXdGYD40BObMhkkpvoNy/Xq
 ySdp8ItY+SUWRGrSzYLJT9f3GOu7ZweZhSZY4m7SN7CVJi2lkeN8GlDoc922kcV7a/FF
 rWugVo0ZxANR0HfTc9w6OgvbAvBSOZombHd0cDLwedEXqk3sbIXRMMj6+l7M2Y4VplhT
 VspPtyrn3Yik+860TijDIUHr3n+NeQhKDR2CoG3wu6Raz5xVvqtvOfG0/iVXFAOrtPz5
 zSdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=mQhB2xvbV4B2oYmCAIBExO3PWOsuBM4dJiFzqvFFcao=;
 fh=nCorh5oJ2iPsJGViR65qEXiqcJQoMVwAmIQbZssYGuw=;
 b=XKs9FS46c0NUtdRTkvNAjFPwnQgzbxRVgjQPjJUM9KhLsYhgGOAq2cXjZongMadnrT
 jy6WOfUpaCLo6loHSrhBbnL2LYgXwah7NsqtX/iEuNcUSFzD0co4LofRnQSGzq1nWxfA
 82QQtXGnVaRZ/O6DQSJi1MMzpaAx6lxagehUNfopU/2eGvO3P3W1dBK+9kG19lQXl9gh
 ZPcZi4R56BjC9Wvc/8/RwMu7KVYVo7dMjXyRy0DWiIDrgOiFPj/ms808Ks5NgAPwSWrA
 8qhn51PFhAewZAUrsz360SgE+F5tLGmPuPQleM/Uc98MU/xnlXiwoKuWNyJgD+9DuR3d
 udTg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781539648; x=1782144448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mQhB2xvbV4B2oYmCAIBExO3PWOsuBM4dJiFzqvFFcao=;
 b=kyH64PaC9KCrCZShRGAECKvCNDHd5rX7BbU6gtILU54gNRl4PrmpeOK0S6W3dfu38Z
 +NK1XML4YY9OCP9puzggTuTqSLAyQM4CtGWQpiKWuh+QvNwob60Wq2vGzERwpXgvPdZK
 f5IbgoktGxlwPkHEIWRWsnHNIjXxdyy0vfcAC24C46zQ63A/rHtXTlT2zYCbGWcwGV0s
 4Q1nyWJPUrREO2eNSlH8X8W4YnrUEzYNeS0o4BxW/JKLHQ4D+/TbpkpeZzGsrMWI561b
 m/nlxeEmFb2qTbq5lkJ+PwvPEe+3xcmApI7oM/PSOtW5BP7OEMiyatw7lfCv6/LP7qQa
 eL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781539648; x=1782144448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mQhB2xvbV4B2oYmCAIBExO3PWOsuBM4dJiFzqvFFcao=;
 b=Eyro5WA5hyhRHF8AH1W6+PoL41a7jzf+bbnIjhPubogeDT58V6iarKfUIHa2R7DLZf
 HV9lI33WYixus3rQqpn3DelAXrkUxaiT4N1T8Dj9fPLs035vyG5XVG+8ZUo3WHL0FKCN
 13rPgmN546pIok12imVMSQVHadSiu4e+GcWLL9pdxgUI40kPToQyUYJ6J2LA5aXUt+KY
 1paIMJFJ3LRwCmNX0t24F/lrZjsSiecJXf0N32hoFc+Phdd5IFSJSFAnjJg0xfjdap0e
 pKie9RmL2usXnMufQv3nPReAd3FOlWhUML4eA2yS9/YTS1FctDAlVFJ6HSrWm8XA/gqY
 oWOw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8jbtY1xm8ucpu/Kyfh/zRItC0ZRuaMilPUQrskK3ciTvfzrM86doftIB9cSs1aMHOjkuQgx7x9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCUuPmuMYbN8m1VeECr8Y2o2zXMYhVTjZ5xmC5bv3ALoymzSxM
 yFWCKar91DwEOI+jmrXUrZOud2MncPWs7egusB/X3l/eUjDFZ4BF8dicGPivuqvrmjnCOCRu2nE
 lcq4cxBH2uD+L5wx4sQKrd65ir0+tCsM=
X-Gm-Gg: Acq92OHjStI0f6MOxEfM7I0J6BCFg+v0GIxoFOL2fhlrVjv6K4X7TcfdQknFUqHa5+N
 9FquA9NU+6ST53IxUcfVsTskgU11PLU0L+eWWM63x3msv9pNPi2ok3opnXsPhAiGjUG0QJx3S7b
 qnr9W4c7utRK6VSBZvTDCTYtfOQmargzpRyG3gwbcmvv5YXEMKyLJ33pMMgW36SMlwNHTlqZ6Xq
 mzSsSI/Zu7b2iwlNSMc43RIkDuSoGBCvzM1TCotSU73A6RirQxgLFJ9M6dphi8sGUYTFjre0j5t
 e4Wv0d3z/oPfGXrfQmn8WLF8RWXxT07y1yTTRlh4hXU6TB5mbAM30scNyoqlhd5BbahLwQ==
X-Received: by 2002:a05:7022:688a:b0:138:63d:e43e with SMTP id
 a92af1059eb24-1384bb7c5e9mr3260964c88.4.1781539647815; Mon, 15 Jun 2026
 09:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260611195026.25125-1-guilherme.bozi@usp.br>
 <33b42033-a5ae-4fa2-bafa-ea007a29eab1@amd.com>
 <CAJgF-xtvOSwB4S8Xw1JwkyWQVEMEMfpmVyTxAKaESi0s9XoRkQ@mail.gmail.com>
In-Reply-To: <CAJgF-xtvOSwB4S8Xw1JwkyWQVEMEMfpmVyTxAKaESi0s9XoRkQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 12:07:16 -0400
X-Gm-Features: AVVi8CcvJ_LxWBys5pApzXEYFZorrvkQUcYRsoAaDlW4-qZk0SaOyWk-HOsPs8Y
Message-ID: <CADnq5_MA582cy9t69EaA+h42DHNhUoR-i9c3nUo=C4YRe1nJtw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/9] drm/amd/display: convert GPIO translation
 logic to lookup tables
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
 "Leo (Sunpeng) Li" <Sunpeng.Li@amd.com>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 airlied@gmail.com, alexander.deucher@amd.com, simona@ffwll.ch, 
 siqueira@igalia.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guilherme.bozi@usp.br,m:Sunpeng.Li@amd.com,m:Harry.Wentland@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:alexander.deucher@amd.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:dri-devel@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,lists.freedesktop.org:from_smtp,mail.gmail.com:mid,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 793A86881C7

On Fri, Jun 12, 2026 at 3:39=E2=80=AFPM Guilherme Ivo Bozi
<guilherme.bozi@usp.br> wrote:
>
> On Fri, Jun 12, 2026 at 4:34=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > On 6/11/26 21:49, Guilherme Ivo Bozi wrote:
> > > This series converts the GPIO HW translation logic used by
> > > multiple DCN generations from large switch statements to
> > > static lookup tables with shared helper functions.
> >
> > Not to block this patch set, but please keep in mind that when some arr=
ay index comes from userspace to use array_index_nospec() to avoid security=
 problems caused by speculative execution.
> >
>
> Thanks for the feedback. I reviewed the relevant GPIO and DDC paths.
> In all cases, the offsets and indices are derived from DC BIOS tables
> or internal DC GPIO service mappings, not userspace-controlled input.
>

I don't have a strong opinion on this.  @Leo (Sunpeng) Li , @Wentland,
Harry , do you have an opinion?  It doesn't seem like it really makes
much of a difference either way for code readability, etc.

Alex

> If you still prefer additional hardening for consistency, I can send a
> v2 with array_index_nospec().
>
> > We already had problems with that in the past when people converted swi=
tch statements into an array lockup.
> >
>
> I=E2=80=99ll keep this in mind for other paths where array indices may be
> influenced by userspace.
>
> Kind regards,
> Guilherme Ivo
>
>
> > Regards,
> > Christian.
> >
> > >
> > > The new implementation reduces duplicated translation logic
> > > across generations and makes the GPIO mappings easier to
> > > maintain and extend.
> > >
> > > The series introduces generic GPIO translation helpers first,
> > > followed by per-generation conversions.
> > >
> > > The following generations were converted:
> > >
> > >   - dcn10
> > >   - dcn20
> > >   - dcn21
> > >   - dcn30
> > >   - dcn315
> > >   - dcn32
> > >   - dcn401
> > >   - dcn42
> > >
> > > The dce60, dce80, dce110 and dce120 implementations were
> > > left unchanged for now.
> > >
> > > dce60 and dce80 contain special switch-case handling paths
> > > that currently do not map cleanly to the new table-based
> > > representation, so they were intentionally excluded from
> > > this refactor.
> > >
> > > No functional changes intended.
> > >
> > > v1 resend:
> > >
> > > No changes since original submission.
> > >
> > > Automated review:
> > > https://lore.gitlab.freedesktop.org/drm-ai-reviews/review-overall-202=
60512190019.228440-1-guilherme.bozi@usp.br/
> > >
> > > Guilherme Ivo Bozi (9):
> > >   drm/amd/display: add GPIO HW translation helpers
> > >   drm/amd/display: convert dcn10 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn20 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn21 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn30 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn315 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn32 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn401 GPIO translation to lookup tables
> > >   drm/amd/display: convert dcn42 GPIO translation to lookup tables
> > >
> > >  .../dc/gpio/dcn10/hw_translate_dcn10.c        | 484 +++++++---------=
--
> > >  .../dc/gpio/dcn20/hw_translate_dcn20.c        | 432 ++++++----------
> > >  .../dc/gpio/dcn21/hw_translate_dcn21.c        | 417 ++++++---------
> > >  .../dc/gpio/dcn30/hw_translate_dcn30.c        | 432 ++++++----------
> > >  .../dc/gpio/dcn315/hw_translate_dcn315.c      | 418 ++++++---------
> > >  .../dc/gpio/dcn32/hw_translate_dcn32.c        | 386 +++++---------
> > >  .../dc/gpio/dcn401/hw_translate_dcn401.c      | 392 +++++---------
> > >  .../dc/gpio/dcn42/hw_translate_dcn42.c        | 193 +++----
> > >  .../drm/amd/display/dc/gpio/hw_translate.c    |  86 ++++
> > >  .../drm/amd/display/dc/gpio/hw_translate.h    |  21 +
> > >  .../gpu/drm/amd/display/include/gpio_types.h  |  48 ++
> > >  11 files changed, 1274 insertions(+), 2035 deletions(-)
> > >
> >
