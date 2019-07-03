Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B08A5EC0B
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 20:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B216E17E;
	Wed,  3 Jul 2019 18:57:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F6E6E17E
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 18:57:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id s7so7299234iob.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 03 Jul 2019 11:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1RY2JTNPY+W1D/Gy4kV/Cyj4zlq3t6JaOsgDZ1jWbM0=;
 b=lDsjwRi0oxmXgdE3bfJOGfPTa94spITvbm9ifRN28BMAKAizlaZt7VsoBdFP+1Klzz
 1niJYr7XciPDD0Qub8/3mqxbYNKf58YcOO5MNMdO/57Hp4Th22absLbvHZN19pr46cth
 tcI43wwxop62Z1IzctfWTwv0WxIRykvYTAJ5vj/Awpjx+6JDvJmUuwGYutL5WGRdqEQN
 HrXGAF/vRLd9/8vnz4NYo3lLL6aLwKxTrpxT3H+NQJm37r0AbKnWKQrVFewxGXPR52OC
 jzi+Xeff1Xoxi78B7OGpTCzJtfv7Fg+llBkaP8j4ot06Pg8qKnzZE/dA8eAIVMBuZzem
 i+fg==
X-Gm-Message-State: APjAAAVvuEcMubWkddp/sSfEWeGxS+3pbZ6vZJ51QZpGxroFnF0dSQdu
 jT+xGGkFSEF1PiqgW7MaD/SXW8WfFSoBUB5RjH5tUw==
X-Google-Smtp-Source: APXvYqwDkVuNlfCMZ2tEtzfSeLm56Ug3A7J9F/oZqI3tEy0VFxot5azk46uUGdl063BSDCIMnuxA9H655WE7YORHhKc=
X-Received: by 2002:a5d:8c81:: with SMTP id g1mr3526681ion.239.1562180238705; 
 Wed, 03 Jul 2019 11:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMas72q52GYvH+5Po-KDPfqu74XO_YznqJKnp+-+1Mnww@mail.gmail.com>
 <e92cffb7-6627-6f52-70de-e09d9bdbbe0a@amd.com>
 <CAAxE2A4tM-OoxcnLw14M8aZJLPLnPm2aN4fpTVQX_aUyJ9OBNw@mail.gmail.com>
 <CABXGCsMJKKu6DxvKvD8U6Ffkmt8KinNS96w4ygZ7xaemvEhocg@mail.gmail.com>
 <CAAxE2A6US6YBpESnwqm-EGsDapOVVfbHXxdrkjG1UddFPO0mOQ@mail.gmail.com>
 <CABXGCsOWGpop=5_a6nrRoqWSWagkMg_sYCPL8ZuSuByvcDDu+w@mail.gmail.com>
 <CAAxE2A4Xdsutk=teU=vi_Gnr2tuwinu6_JSfkoqTGwd1NrSpxQ@mail.gmail.com>
 <CABXGCsNpD93nBCWiL0VV_x+7jjY+HMYMbWsswxvHWWZXJaAhTQ@mail.gmail.com>
In-Reply-To: <CABXGCsNpD93nBCWiL0VV_x+7jjY+HMYMbWsswxvHWWZXJaAhTQ@mail.gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 3 Jul 2019 14:56:42 -0400
Message-ID: <CAAxE2A4fy3MAMV0HzX2Rszf=2nZ923xE+r2tVhZKp18V88cmVg@mail.gmail.com>
Subject: Re: The problem "ring gfx timeout" are experienced yet another AMD
 GPU Vega 8 user
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1RY2JTNPY+W1D/Gy4kV/Cyj4zlq3t6JaOsgDZ1jWbM0=;
 b=UlkpynAFj5lxznBf9YQNDOtiAND1luSWFUXL978anM/o/jQ5aOAVstIQm2vGV+3/6q
 pEeM0fSmvmRdhkwEIq4LWkTAf035cgPpQSN3KuO/4ZlwmG/80q9UXTJ98jDScgrI2wk3
 mch5vVIAZxn64Hg2zNeWWODNyZ/Grgvi51nLnSvwuD8r07uBMVs5dwOfLp1h8/6YUB/g
 vbUbUHkTAouCxDC49U9aS89nWsDBs8TmQy+c8q83vCmxfzz/cA9HV+7TQ+zRMO9KaeIC
 F0R6yz9wTlXdWURIR3zdcYfA1R9D3D2FzqKtoAUrtNaarwl/FmhzUao0YZZXqKzOngAN
 DC3Q==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0711319371=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0711319371==
Content-Type: multipart/alternative; boundary="000000000000340fe4058ccb6ee7"

--000000000000340fe4058ccb6ee7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It looks like memory corruption. You can try to disable IOMMU in the BIOS.

Marek

On Tue, Jul 2, 2019 at 12:07 AM Mikhail Gavrilov <
mikhail.v.gavrilov@gmail.com> wrote:

> On Wed, 27 Feb 2019 at 00:57, Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:
> >
> > Sadly, the logs don't contain any clue as to why it hangs.
> >
> > It would be helpful to check if the hang can be reproduced on Vega 56 o=
r
> 64 as well.
> >
> > Marek
> >
>
> Hi, Marek.
>
> I'm sorry to trouble you.
> But today the user of described above Vega 8 graphic sended me fresh logs=
.
>
> Actual versions: kernel 5.1.15 / DRM 3.30.0 / Mesa 19.0. / LLVM 8.0.0
>
> I uploaded all logs to mega cloud storage.
> Can you look this logs please?
>
> https://mega.nz/#F!Mt5mhKiI!8Sv2T5a6yTxBqVknhH1NjA
>
>
> --
> Best Regards,
> Mike Gavrilov.
>

--000000000000340fe4058ccb6ee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It looks like memory corruption. You can try to disab=
le IOMMU in the BIOS.</div><div><br></div><div>Marek<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 2, 2019=
 at 12:07 AM Mikhail Gavrilov &lt;<a href=3D"mailto:mikhail.v.gavrilov@gmai=
l.com">mikhail.v.gavrilov@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 27 Feb 2019 at 00:57, Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D"_blank">mar=
aeo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Sadly, the logs don&#39;t contain any clue as to why it hangs.<br>
&gt;<br>
&gt; It would be helpful to check if the hang can be reproduced on Vega 56 =
or 64 as well.<br>
&gt;<br>
&gt; Marek<br>
&gt;<br>
<br>
Hi, Marek.<br>
<br>
I&#39;m sorry to trouble you.<br>
But today the user of described above Vega 8 graphic sended me fresh logs.<=
br>
<br>
Actual versions: kernel 5.1.15 / DRM 3.30.0 / Mesa 19.0. / LLVM 8.0.0<br>
<br>
I uploaded all logs to mega cloud storage.<br>
Can you look this logs please?<br>
<br>
<a href=3D"https://mega.nz/#F!Mt5mhKiI!8Sv2T5a6yTxBqVknhH1NjA" rel=3D"noref=
errer" target=3D"_blank">https://mega.nz/#F!Mt5mhKiI!8Sv2T5a6yTxBqVknhH1NjA=
</a><br>
<br>
<br>
--<br>
Best Regards,<br>
Mike Gavrilov.<br>
</blockquote></div></div>

--000000000000340fe4058ccb6ee7--

--===============0711319371==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0711319371==--
