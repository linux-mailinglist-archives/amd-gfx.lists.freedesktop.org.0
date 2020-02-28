Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C141742DD
	for <lists+amd-gfx@lfdr.de>; Sat, 29 Feb 2020 00:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496366F51C;
	Fri, 28 Feb 2020 23:15:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052C6F51C
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 23:15:17 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id o28so4671584qkj.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Feb 2020 15:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eYTrl9LcM+d9QhpSpzccWUFnHmToGstmZ9vJKkbdD3c=;
 b=iGXs/Lun3WBvSF0g5nSmSV0WbDvdJhbgVlK1IOQbDDKybYuBymIgrnpj+QWAuBq89S
 RTAAdqxDIdLyvnsTineepGXuSl6KD13ZG45naeOnsLOfVzQlY0YW9IMBpNZgsyT+N1bp
 hWk6DzQRsLuWZkNtGCUeyXac9gDlROcUXirNko6Y5ThkNcoBTGnsmw7dOxh0S16vVflX
 YGq9YfZ0HGz7XHUx2w2/1U7C75WcoGL4iGJyBOohYQPRtgM6cJdf+z4RyGDGsHGlEDX+
 36qDvUhMhqwfdxQJhbJ0TMPWB3rhrs1GEekiCx5ntFU9nH2neuuWoLC1+HpPOxa8a95N
 puLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eYTrl9LcM+d9QhpSpzccWUFnHmToGstmZ9vJKkbdD3c=;
 b=Ov7ZmN7Xy/elXM9S2J6AGlpAcrVdjFF7Xdfolt9HKn2XhaxH5ytaxw5MCCu9Gv+7Fh
 RY4J+7TiW9vH0CMztkF65XfGy2+3cENnYZ9SGfbuwYpD68ycpgMQeLrPZDixMnM+9vQ5
 l7wTYnfq4l/9+TBzp/Ldri/uEyKCX6h/3nLc+ylI1SRRX8ovYQvPYBWlKyAgc8V5VJWJ
 0HN6APNkqt7RJl2rq4CL0Lhu+TBWnN8iy1Unk/in4YwDflH35ru+BcLECRi4HPPZOiZ0
 mQhP3ytrPSHKvb4yjeG9OKq/nIQ92elUARCk4RAqHavoNqF0lytroRsS0f7cL2kWz3Gs
 HyLw==
X-Gm-Message-State: APjAAAWmvq+yPVCv1thKdHKgVxBTT9Uu/rLwAV3PxY8TYZk1sn+uXt8X
 YXkiAcdQdENvV7k10/o7QJrA5uX85lb1hjLE/1ddXjSFslg=
X-Google-Smtp-Source: APXvYqxNOo7vCfTXUMXXEq4XsRaxDTZ3BbhW6GHTnpr9ZNTKoPUzq4JkQol8J9HIQ40zb67W8LpDVXtLdxxbTlGiMQc=
X-Received: by 2002:a37:b8c2:: with SMTP id i185mr6596040qkf.156.1582931716928; 
 Fri, 28 Feb 2020 15:15:16 -0800 (PST)
MIME-Version: 1.0
From: David Brinovec <david.brinovec@gmail.com>
Date: Fri, 28 Feb 2020 18:15:06 -0500
Message-ID: <CAGdK0PJB+TBuyqdzJ3VDxnWk9J8_irHD_meHGDx8WSfxHSEx9g@mail.gmail.com>
Subject: AMD FirePro W5130M radeon/amdgpu driver bug
To: amd-gfx@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============1632878935=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1632878935==
Content-Type: multipart/alternative; boundary="000000000000b0f5e5059fab0227"

--000000000000b0f5e5059fab0227
Content-Type: text/plain; charset="UTF-8"

Hello,

I've been struggling for a long time with an issue I have getting either
the radeon or the amdgpu drivers to work with the AMD FirePro W5130M
discrete GPU in my Dell Precision 3510.

Most recently I've been loading the drivers once I have the system booted
with modprobe commands.  This makes things a bit more convenient for
testing.

I get fairly similar behavior whether I use the radeon driver or the amdgpu
driver.

I'm able to insert the module but once I start an application that uses it
for 3D rendering the application typically freezes and sometimes the entire
system does too.

In my dmesg output I see alot of errors like "ring 0 stalled for more than
##msec" and "GPU fault detected".

In the past when I've reported bugs, I've been told to try the most recent
version of the kernel.  I'm wondering if someone can point me to the best
way to go about that.  As in, is there a good linux distro that I can use
to build the latest kernel, etc.

Any help or suggestions would be appreciated.

Thanks,
Dave

--000000000000b0f5e5059fab0227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif;color:#274e13">Hello,</div><div class=3D"gmail_default" style=3D=
"font-family:verdana,sans-serif;color:#274e13"><br></div><div class=3D"gmai=
l_default" style=3D"font-family:verdana,sans-serif;color:#274e13">I&#39;ve =
been struggling for a long time with an issue I have getting either the rad=
eon or the amdgpu drivers to work with the AMD FirePro W5130M discrete GPU =
in my Dell Precision 3510.</div><div class=3D"gmail_default" style=3D"font-=
family:verdana,sans-serif;color:#274e13"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:verdana,sans-serif;color:#274e13">Most recently I=
&#39;ve been loading the drivers once I have the system booted with modprob=
e commands.=C2=A0 This makes things a bit more convenient for testing.</div=
><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color=
:#274e13"><br></div><div class=3D"gmail_default" style=3D"font-family:verda=
na,sans-serif;color:#274e13">I get fairly similar behavior whether I use th=
e radeon driver or the amdgpu driver.</div><div class=3D"gmail_default" sty=
le=3D"font-family:verdana,sans-serif;color:#274e13"><br></div><div class=3D=
"gmail_default" style=3D"font-family:verdana,sans-serif;color:#274e13">I&#3=
9;m able to insert the module but once I start an application that uses it =
for 3D rendering the application typically freezes and sometimes the entire=
 system does too.</div><div class=3D"gmail_default" style=3D"font-family:ve=
rdana,sans-serif;color:#274e13"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:verdana,sans-serif;color:#274e13">In my dmesg output I see=
 alot of errors like &quot;ring 0 stalled for more than ##msec&quot; and &q=
uot;GPU fault detected&quot;.</div><div class=3D"gmail_default" style=3D"fo=
nt-family:verdana,sans-serif;color:#274e13"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:verdana,sans-serif;color:#274e13">In the past =
when I&#39;ve reported bugs, I&#39;ve been told to try the most recent vers=
ion of the kernel.=C2=A0 I&#39;m wondering if someone can point me to the b=
est way to go about that.=C2=A0 As in, is there a good linux distro that I =
can use to build the latest kernel, etc.</div><div class=3D"gmail_default" =
style=3D"font-family:verdana,sans-serif;color:#274e13"><br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#274e13">A=
ny help or suggestions would be appreciated.<br></div><div class=3D"gmail_d=
efault" style=3D"font-family:verdana,sans-serif;color:#274e13"><br></div><d=
iv class=3D"gmail_default" style=3D"font-family:verdana,sans-serif;color:#2=
74e13">Thanks,</div><div class=3D"gmail_default" style=3D"font-family:verda=
na,sans-serif;color:#274e13">Dave<br></div></div>

--000000000000b0f5e5059fab0227--

--===============1632878935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1632878935==--
