Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3194B486B
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 09:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E6C6EB23;
	Tue, 17 Sep 2019 07:42:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07DE6E137
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:07:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p10so348558edq.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 23:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fQkRl7LfYDFXiUR/iAH9ya4lf6U4MhyEmc1OSRuJSVc=;
 b=kCarhG2bnLMU484zxS6VFC03u7bW06bAax29/L4amEzauLwghDVbN4iJtvbphRx62a
 ScAiMk+guHvIvA+2us7FD6qAZHe0TdehCgBr9zstPvlkwcmDJA6qv3JEGrxTBafIPOpu
 lzsww2Q9bCUDyYOiFOnsGyg6fBk0fdj2682+Jfoyqj8ocic2wCDzUFgbuLR1qQtp/G0t
 RXe2zJpm5Tj1wa0+26EdrFaPP6tcRZhOJ3EF7/9NaynjWfbgY/ynH4yU0NLN2hxViKre
 S2NSQQ7tbdZl+x1Utx9dwWJv1D14VyglUEHnsthwrfzDR6Z9Dbv1NrjhBMnl+KpvGlGL
 Ei4A==
X-Gm-Message-State: APjAAAXKcgIuXJG+YcFtGw4JGDIlJUfxy/p4S5aaYHB+aSJcPU++/+me
 us9tnp1ktz/pZxE0eKWc7s/QZmQ82l7mKjrysrZmoQ==
X-Google-Smtp-Source: APXvYqyWH/7IfrW4ZNfPIfyE2LY7h9aUKNHH5X9uk+fKgORHi67FXH8L8/4cres48HpmTunJ1oTy0laEqr8YtRuetyM=
X-Received: by 2002:a17:906:c72d:: with SMTP id
 fj13mr3346891ejb.36.1568700436454; 
 Mon, 16 Sep 2019 23:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
 <CAKwvOdn8-T3Q=LhiGu6H7dCpwXXrNAjpKJA5z0d+N4qB8bOapQ@mail.gmail.com>
 <20190916221203.GM4352@sirena.co.uk> <20190916223615.GP4352@sirena.co.uk>
In-Reply-To: <20190916223615.GP4352@sirena.co.uk>
From: Daniel Liu <danielliu861@gmail.com>
Date: Tue, 17 Sep 2019 14:07:04 +0800
Message-ID: <CAADsLEuwzqqoVyR+q_mnj+7H9Bkz-euWi7aCpWeHDypY-3zSzA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: build failed for DCN2.1
To: Mark Brown <broonie@kernel.org>
X-Mailman-Approved-At: Tue, 17 Sep 2019 07:41:57 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=fQkRl7LfYDFXiUR/iAH9ya4lf6U4MhyEmc1OSRuJSVc=;
 b=d9e2Krk3f9EaU26grZTH40T8JXIUlpruGc21HoVcFTLBamROH45kfCj+YvbfTzI/Pk
 46Kcf0s07mMgxmLp1Ux9Nb3/Mqz+Q93fWd3hySYYf/XgjtyK7vxQY4hyKGQPm7tY+9u9
 gCkHGbzn2nqaRRpLy37iic0q57YolXGb4Z5cWzY8/iySTfzb7jJAGsm3nrCoT6wsJMjn
 aoGYASFsalbsinLUEmWVXDiPppsoVD8xFkbEngkalQbh5ebegf1B+LKI7OOb+iOc7wgK
 JrktAyw+7naWltCWoVEOmTXafp5xsN/4sWhs87kiksT9k500MsUSR+mgzxQTRnTo17oi
 pthQ==
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>, "Li,
 Sun peng \(Leo\)" <sunpeng.li@amd.com>, Bhawanpreet.Lakha@amd.com,
 Nick Desaulniers <ndesaulniers@google.com>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Jun.Lei@amd.com, Harry Wentland <harry.wentland@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1918636147=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1918636147==
Content-Type: multipart/alternative; boundary="0000000000004623600592b98809"

--0000000000004623600592b98809
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Welcome^_^!

Mark Brown <broonie@kernel.org> =E4=BA=8E2019=E5=B9=B49=E6=9C=8817=E6=97=A5=
=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=886:36=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, Sep 16, 2019 at 11:12:03PM +0100, Mark Brown wrote:
> > On Mon, Sep 16, 2019 at 01:51:15PM -0700, Nick Desaulniers wrote:
> >
> > > + Mark
> > > I think this was a result of the resolved merge conflict.  See the
> > > -next only commit titled:
> > >     Merge remote-tracking branch 'drm/drm-next'
>
> > Yes, the DRM and the Kbuild people really need to coordinate with each
> > other here I fear, it's pretty bad that stuff like this has to be done
> > in a merge at all :/ The fact that make doesn't detect a missing endif
> > is also concerning.
>
> Applied now, thanks Xinpeng.
>

--0000000000004623600592b98809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Welcome^_^!</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Mark Brown &lt;<a href=3D"mailto:broonie@kern=
el.org">broonie@kernel.org</a>&gt; =E4=BA=8E2019=E5=B9=B49=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=886:36=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Sep 16, 201=
9 at 11:12:03PM +0100, Mark Brown wrote:<br>
&gt; On Mon, Sep 16, 2019 at 01:51:15PM -0700, Nick Desaulniers wrote:<br>
&gt; <br>
&gt; &gt; + Mark<br>
&gt; &gt; I think this was a result of the resolved merge conflict.=C2=A0 S=
ee the<br>
&gt; &gt; -next only commit titled:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Merge remote-tracking branch &#39;drm/drm-next=
&#39;<br>
<br>
&gt; Yes, the DRM and the Kbuild people really need to coordinate with each=
<br>
&gt; other here I fear, it&#39;s pretty bad that stuff like this has to be =
done<br>
&gt; in a merge at all :/ The fact that make doesn&#39;t detect a missing e=
ndif<br>
&gt; is also concerning.<br>
<br>
Applied now, thanks Xinpeng.<br>
</blockquote></div>

--0000000000004623600592b98809--

--===============1918636147==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1918636147==--
