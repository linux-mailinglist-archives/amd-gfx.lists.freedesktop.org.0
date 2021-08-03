Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D46163DF19E
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Aug 2021 17:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C15E89FCC;
	Tue,  3 Aug 2021 15:37:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Tue, 03 Aug 2021 15:11:16 UTC
Received: from valerius4.ch-meta.net (valerius4.ch-meta.net [80.74.135.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B095F6E88A
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Aug 2021 15:11:16 +0000 (UTC)
Received: from mail-oi1-f173.google.com (localhost [127.0.0.1]) by
 valerius4.ch-meta.net (Postfix) with ESMTPSA id 937214C513A5
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Aug 2021 17:04:06 +0200 (CEST)
Authentication-Results: valerius.metanet.ch;
 spf=pass (sender IP is 209.85.167.173) smtp.mailfrom=thomas.gfeller@q-drop.com
 smtp.helo=mail-oi1-f173.google.com
Received-SPF: pass (valerius.metanet.ch: connection is authenticated)
Received: by mail-oi1-f173.google.com with SMTP id q6so28445401oiw.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Aug 2021 08:04:06 -0700 (PDT)
X-Gm-Message-State: AOAM531d37IdWtsCJDwyyM30/IbgU4KIT6s/Mj/WsdmYLXiXFPdCdsXM
 JKNBH3kCK9p9Ncq8Y60nUIkFZgAy1ZdvKcJcpp0=
X-Google-Smtp-Source: ABdhPJyvQW9nJaasA131IJhby5Atm14Nbp3WjiJSLjUFwvhL2PRYTfFWjpLvhdD1ERKb/+mMqu3VgoAR5ZaQjwfW6bI=
X-Received: by 2002:aca:1c03:: with SMTP id c3mr14651245oic.151.1628003045522; 
 Tue, 03 Aug 2021 08:04:05 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Gfeller <thomas.gfeller@q-drop.com>
Date: Tue, 3 Aug 2021 17:03:55 +0200
X-Gmail-Original-Message-ID: <CAPr5sE+bt0AxLGYvMrrj3V0+7JwQMe-xp_2ymHcpOsdQCiLFQQ@mail.gmail.com>
Message-ID: <CAPr5sE+bt0AxLGYvMrrj3V0+7JwQMe-xp_2ymHcpOsdQCiLFQQ@mail.gmail.com>
Subject: Issue with USB-C lanes or DSC / bandwidth on amdgpu
To: amd-gfx@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000038c38b05c8a8ffbc"
X-Mailman-Approved-At: Tue, 03 Aug 2021 15:37:12 +0000
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

--00000000000038c38b05c8a8ffbc
Content-Type: text/plain; charset="UTF-8"

Hi everyone.

I currently try to go all-in on Linux. Therefore I have one last issue that
I still didn't manage to resolve:

https://gitlab.freedesktop.org/drm/amd/-/issues/1616

I found that you guys implemented parts of the mentioned features here:
https://lists.freedesktop.org/archives/amd-gfx/2020-January/044739.html

I suspect, that there is an issue with bandwidth allocation for DP alt mode
(on USB-C) or DSC / HBR3 or both.

Any help to get this fixed is highly appreciated. Unfortunately I have no
experience in developing drivers for Linux - this is pretty advanced stuff.
Thank you very much for your contributions!

Best

Thomas

--00000000000038c38b05c8a8ffbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:trebuche=
t ms,sans-serif">Hi everyone.</div><div class=3D"gmail_default" style=3D"fo=
nt-family:trebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-family:trebuchet ms,sans-serif">I currently try to go all-in o=
n Linux. Therefore I have one last issue that I still didn&#39;t manage to =
resolve:</div><div class=3D"gmail_default" style=3D"font-family:trebuchet m=
s,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:t=
rebuchet ms,sans-serif"><a href=3D"https://gitlab.freedesktop.org/drm/amd/-=
/issues/1616">https://gitlab.freedesktop.org/drm/amd/-/issues/1616</a></div=
><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif"=
><br></div><div class=3D"gmail_default" style=3D"font-family:trebuchet ms,s=
ans-serif">I found that you guys implemented parts of the mentioned feature=
s here: <a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2020-Janu=
ary/044739.html">https://lists.freedesktop.org/archives/amd-gfx/2020-Januar=
y/044739.html</a></div><div class=3D"gmail_default" style=3D"font-family:tr=
ebuchet ms,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:trebuchet ms,sans-serif">I suspect, that there is an issue with ban=
dwidth allocation for DP alt mode (on USB-C) or DSC / HBR3 or both.<br></di=
v><div><br></div><div><div style=3D"font-family:trebuchet ms,sans-serif" cl=
ass=3D"gmail_default">Any help to get this fixed is highly appreciated. Unf=
ortunately I have no experience in developing drivers for Linux - this is p=
retty advanced stuff. Thank you very much for your contributions!<br></div>=
<div style=3D"font-family:trebuchet ms,sans-serif" class=3D"gmail_default">=
<br></div><div style=3D"font-family:trebuchet ms,sans-serif" class=3D"gmail=
_default">Best</div><div style=3D"font-family:trebuchet ms,sans-serif" clas=
s=3D"gmail_default"><br></div><div style=3D"font-family:trebuchet ms,sans-s=
erif" class=3D"gmail_default">Thomas</div><br></div></div>

--00000000000038c38b05c8a8ffbc--
