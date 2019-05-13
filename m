Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20A1AEBD
	for <lists+amd-gfx@lfdr.de>; Mon, 13 May 2019 03:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F07E893A8;
	Mon, 13 May 2019 01:45:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FC0893A8
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 May 2019 01:45:00 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id t1so4068774qtc.12
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 May 2019 18:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1X23HZLF02lLHtlwthZDI5VL6t+7ZMtC3CKYfa9vrkY=;
 b=q3p92gr059lEePTT8CZV9nb9GO5ipwfc9Qduc/5r/Xc/ayrkzzMh6S8vjhVKz196bO
 jRnug0NLvw+zEhirvOjTrih/V8NwOQ2dG7LxfPAvMRqDPCXIHH4tgpgkid7+vpMT8yWo
 z3VEIQYTVSRDnTEQwy3YK3fMXXil9/Z1yQhygwe+j8iJ9RtDD9g8RTZdyuRlKj2Vxowa
 W8jqB+i6tMPMiWJZ9jDaMTKN1GVNWtc4eGEkz+hTh4loPNiKhJ2h1NBHiju47PrgvHsp
 c6c94CB0O0ZrftsrcNi09GU/bwnk9NstN6yVdSr1oY5mpuPyjOZTVEWdzASbqQwmW8JR
 gXdg==
X-Gm-Message-State: APjAAAUXh0LBCQPVtYz1fp1Hztu7F2G4iPa4aUrOFlkUbzc9KhIsQ4hY
 DujWwLU6XR43p8oo7Ce1RBUO5FghGZIl949HU6y6bw==
X-Google-Smtp-Source: APXvYqz2espAaNdFUVsV5MCAn4GH2MWCSoblZuCnMSpi/Ldsaqqpt1fEFTZLYqP+++TT8GI3jRziWaffOF0eDNo91bY=
X-Received: by 2002:a0c:997d:: with SMTP id i58mr8077512qvd.84.1557711898997; 
 Sun, 12 May 2019 18:44:58 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Kasak <d.j.kasak.dk@gmail.com>
Date: Mon, 13 May 2019 11:44:11 +1000
Message-ID: <CAF73Y=QuYq3ALtP6xiPyqS+jm_TJCQQDyQ+WA5ZJG8EhWSKiTw@mail.gmail.com>
Subject: Hard lockups with ROCM
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1X23HZLF02lLHtlwthZDI5VL6t+7ZMtC3CKYfa9vrkY=;
 b=NVc/srZ++Gt3vwGFBoSoI6a8dlGGozRaxW8hiRPZhYaKr+gZ1kFidjxei28pMqJsfu
 ZSUPGUo2pmPUbVEZb/N2Kfw/oUoj25lhjCsdQjj0frmj5qCazwwHVNEi+XOauZ8cCBBO
 sV71f+XzFVYvcijeybgPHO2+eSMLpQiR8CPD53viVOzf3bAj9EqJwSH5gJPRFKcc3tDG
 glL5AIVSgSiS/e5mdYEbv1/fudwzwexbG77f2olKIiAcR+sH78ShFatdHcTYBJ1vwRoZ
 u7DUI0VbDB2wMc4aHi3ePccHOcJsHAD+Kp6K4QOU+PvZeM+MKFK7kge7JvrxSRtDJs91
 0r6Q==
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
Content-Type: multipart/mixed; boundary="===============0020501746=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0020501746==
Content-Type: multipart/alternative; boundary="00000000000066fa0e0588bb1097"

--00000000000066fa0e0588bb1097
Content-Type: text/plain; charset="UTF-8"

Hi all. I had version 2.2.0 of the ROCM stack running on a 5.0.x and 5.1.0
kernel. Things were going great with various boinc GPU tasks. But there is
a setiathome GPU task which reliably gives me a hard lockup within about 30
minutes of running. I actually had to do *two* emergency re-installs over
the past week. Perhaps part of this was my fault ( running btrfs with lzo
compression on my root partition ... ). But absolutely part of this was the
hard lockups. I've tested all kinds of other things ( eg rebuilding lots of
stuff under Gentoo ) ... I don't have a general stability issue even under
hours of high load. But after restarting boinc with that same setiathome
task ... <bang>!

If someone wants me to sacrifice another installation, they can point me to
instructions for trying to gather more information.

Anyway ... perhaps more work around detecting and recovering from GPU
lockups is in order?

Dan

--00000000000066fa0e0588bb1097
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all. I had version 2.2.0 of the ROCM stack running=
 on a 5.0.x and 5.1.0 kernel. Things were going great with various boinc GP=
U tasks. But there is a setiathome GPU task which reliably gives me a hard =
lockup within about 30 minutes of running. I actually had to do *two* emerg=
ency re-installs over the past week. Perhaps part of this was my fault ( ru=
nning btrfs with lzo compression on my root partition ... ). But absolutely=
 part of this was the hard lockups. I&#39;ve tested all kinds of other thin=
gs ( eg rebuilding lots of stuff under Gentoo ) ... I don&#39;t have a gene=
ral stability issue even under hours of high load. But after restarting boi=
nc with that same setiathome task ... &lt;bang&gt;!</div><div><br></div><di=
v>If someone wants me to sacrifice another installation, they can point me =
to instructions for trying to gather more information.</div><div><br></div>=
<div>Anyway ... perhaps more work around detecting and recovering from GPU =
lockups is in order?</div><div><br></div><div>Dan<br></div></div>

--00000000000066fa0e0588bb1097--

--===============0020501746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0020501746==--
