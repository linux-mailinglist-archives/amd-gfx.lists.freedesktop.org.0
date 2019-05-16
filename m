Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 742C91FCDF
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 02:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45948921B;
	Thu, 16 May 2019 00:33:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D37D8921B
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 00:33:50 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id h1so1987254qtp.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 May 2019 17:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Uhk2S2vtiPOBwtSr7c5CeQyfly0jG7o3aO07MTSo0pA=;
 b=Qx4HUTr/MzJ8etYhOh/CDT3IC7Gl0MwkTSd1IAC6usRopl2ZxGdMx88+PEbo79OxiK
 Z5p5JNoNsg2hn9XxRN+0K+geRyRnyJ2yvTTegvsb2SsHxoQewp75p3vbHwhEnB/DIoaA
 pIVzFJrNM9NZvB7Njl2Mdu3ZjwZTzmGdX2o2DySTd9onIk6blQZo9P2TdfNYv6MNYpoH
 GXqqFzzMGWjNf7zKRHhUHZTg3wM6LjIYFHZNC6L3lk8j37widujj55RawaGG5HS0SbAQ
 AWf0ws4K5Jyf/rh+zKvkJwsrCczAJdoULHMVU51voLOT6WZWIxOEoR0I2dbW5vuKK0cB
 lFaQ==
X-Gm-Message-State: APjAAAWb95nI93QHmFynPJFPXMPXxrjHSTPC7bnfIjT2syPpuXiPSDzc
 uyD3KMFr4wXKg6mKJR7MP8zQnBl+PYPWOkwzJOGULZmC
X-Google-Smtp-Source: APXvYqxh8OyhWuLtlXpd6LFxw5frduoO9PraYaX5rKjzAWykEfBEuYoOUu+H0TJRV05fBalcaFSH5LKNv3lcR47oZjA=
X-Received: by 2002:ac8:1aa9:: with SMTP id x38mr38950728qtj.172.1557966829318; 
 Wed, 15 May 2019 17:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
In-Reply-To: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
From: Daniel Kasak <d.j.kasak.dk@gmail.com>
Date: Thu, 16 May 2019 10:33:03 +1000
Message-ID: <CAF73Y=R96zUxCAEKopSvGReqB+sEFWcHhXSKnR98rpetMbKf4Q@mail.gmail.com>
Subject: Re: Hard lockups with ROCM
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Uhk2S2vtiPOBwtSr7c5CeQyfly0jG7o3aO07MTSo0pA=;
 b=BR46hiQEi67OCCweoHm3LojRcWy6qk2BfEMC5YJ00bkcurRcAw8+JFjjkWq6nBmT3R
 tdXTDAyYwMvzU7tX9vNGdbzLy1AuQdyDTHBJv6dz9O1yLdCcDKY0n2TYykNmQlqmuOPw
 gMym7HxeM0pae/wRhtLUE//OoaUhepv1qh1LXmIAphZ+KF0gT54rnY7s0v6Aoq1In8DF
 SZjnrcs2ZexLTCec29AQXF8hcCJ0A7fMu1BxbmATRinRzsSGWDtOoF7QwU7YBGEMVwaK
 w1FRPr1e6iLsZXm8x+uC/9x34JdeDmbiiy9ZHsXUEBO7UkLF3hjGdiwTGkwneonEwOej
 lAaA==
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
Content-Type: multipart/mixed; boundary="===============0940686179=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0940686179==
Content-Type: multipart/alternative; boundary="0000000000006ef8540588f66b81"

--0000000000006ef8540588f66b81
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019 at 11:44 AM Daniel Kasak <d.j.kasak.dk@gmail.com>
wrote:

> Hi all. I had version 2.2.0 of the ROCM stack running on a 5.0.x and 5.1.0
> kernel. Things were going great with various boinc GPU tasks. But there is
> a setiathome GPU task which reliably gives me a hard lockup within about 30
> minutes of running. I actually had to do *two* emergency re-installs over
> the past week. Perhaps part of this was my fault ( running btrfs with lzo
> compression on my root partition ... ). But absolutely part of this was the
> hard lockups. I've tested all kinds of other things ( eg rebuilding lots of
> stuff under Gentoo ) ... I don't have a general stability issue even under
> hours of high load. But after restarting boinc with that same setiathome
> task ... <bang>!
>
> If someone wants me to sacrifice another installation, they can point me
> to instructions for trying to gather more information.
>
> Anyway ... perhaps more work around detecting and recovering from GPU
> lockups is in order?
>
> Dan
>

<sigh>

That's what I was afraid of :(

--0000000000006ef8540588f66b81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, May 13, 2019 at 11:44 AM Daniel Kasak &lt;<a href=3D"mailto:=
d.j.kasak.dk@gmail.com">d.j.kasak.dk@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi all.=
 I had version 2.2.0 of the ROCM stack running on a 5.0.x and 5.1.0 kernel.=
 Things were going great with various boinc GPU tasks. But there is a setia=
thome GPU task which reliably gives me a hard lockup within about 30 minute=
s of running. I actually had to do *two* emergency re-installs over the pas=
t week. Perhaps part of this was my fault ( running btrfs with lzo compress=
ion on my root partition ... ). But absolutely part of this was the hard lo=
ckups. I&#39;ve tested all kinds of other things ( eg rebuilding lots of st=
uff under Gentoo ) ... I don&#39;t have a general stability issue even unde=
r hours of high load. But after restarting boinc with that same setiathome =
task ... &lt;bang&gt;!</div><div><br></div><div>If someone wants me to sacr=
ifice another installation, they can point me to instructions for trying to=
 gather more information.</div><div><br></div><div>Anyway ... perhaps more =
work around detecting and recovering from GPU lockups is in order?</div><di=
v><br></div><div>Dan<br></div></div></blockquote><div><br></div><div>&lt;si=
gh&gt;</div><div><br></div><div>That&#39;s what I was afraid of :(<br></div=
></div></div>

--0000000000006ef8540588f66b81--

--===============0940686179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0940686179==--
