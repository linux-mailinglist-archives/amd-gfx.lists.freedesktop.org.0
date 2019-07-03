Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD275E50C
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Jul 2019 15:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98BD6E131;
	Wed,  3 Jul 2019 13:15:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sonic310-13.consmr.mail.bf2.yahoo.com
 (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F3989FE8
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Jul 2019 07:57:14 +0000 (UTC)
X-YMail-OSG: fCfKyQsVM1mM0R8OWV5P5b2HwRAVrzrYLm8WGqmMaFtSuD5N6MudN8G40skP0He
 HoR9nV41FR2RB_LWf6Nj4qQexI3.s2KAPCti9Skexe4jI5dAX3rKyKTdo7sOEzaHXZzsa_zB..lB
 QyytaWPD17.IdLX1jfKWR2grTL2hhd5XwCkSOano6QpwRVE_TUI6yU5KXBczcMWbBSicwDlhUoce
 eb7m2izJSTZ.AJlEb9Udhq6mpcBneq3vK6oSRndZVfDB72WLCqIP4kxWoRYRaWX7KksFDKojmiPb
 1scivwFRy..yRV6125aGYazJgTFsMOd1D6l3QZGPwr_P_d1_L4dnfMqLtdVhNdTBw7TZzy.Kz2Pd
 hcb7F3HIo26cyN_hYw5A5VD3k3p.M0JD4cP_Y6KFXGLWs9Xlhzxfs0KR.pG0tokDlLe2RzPhOHJl
 QEWcb2jKGZY9P5kUPkNnXLPy07auCsPGab6BMEIRvgcPZyC94lMzuxndeFMPuX7fpwBiHjCjVt7r
 DlmikXuBONr1sHo03C4SjzvBKlUmGkzyo5_l9U9jtpzYe4mHX8NKz8JAhJi2EThyQtHRM_icYeue
 qxyB9XiqBPHCfmvW09C_EMAY1hDUe7wPmVSlKJIoPhINR3A0l9q9nAT0Zj6RKOL0xgYybv2ckRvr
 hV0SDEPsy_1QvbGlw8Cug.msUKKYfo6lpRNznCHtjdmLgNeSh9aqJpCLJRTKxx_ns5YZ9rX.zf78
 cjWY5n9RkRlrR0Ua8hFPIf6.lOBknhGF3gTtcwvMHsGtIosifCs8KETPmxZw3MX7BPFlBtgDeE0E
 Ogm6l_0xRJ645KzIqeZ5_UlcBxubmC6yF91c8fF0A.up3OZfHtD06ez4x_49_NBUI0sv1N9zLdXQ
 df.KywdfwGAgLo3SFZj9qom_dCgaSgqU4pJNPSgIbeImeRSSmOSYEHv.GqXWqo5heXngURxr3T3x
 _3o4FV8gKQvGaF2Oa9fyGrrMXYE3RrG4VW8O66tMqDYUqEcPCq4FpGGzvUjlZlUIqUC1w9AGLRjp
 HV.LFTeyw.Q3LUIG7Pjqb_Kq7oTuitaN8iG9lIt4Zu7t8l0uP94_clQnYLtEcDEKD1t1oSck7iKf
 mVM9cIV9ZEjVoxaqOJ6.2Bwa82BNyl_QYc9i5SntuTyoPlN2.PIPjpCQz1VJcfHXlCRI85NIh_j1
 _wsQPnN5lGAkkeg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.bf2.yahoo.com with HTTP; Wed, 3 Jul 2019 07:57:13 +0000
Date: Wed, 3 Jul 2019 07:57:11 +0000 (UTC)
From: =?UTF-8?B?0JzQuNGF0LDQuNC7INCR0L7Qs9C00LDQvdC+0LI=?=
 <max.kammerer@yahoo.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Message-ID: <1441784245.1474829.1562140631783@mail.yahoo.com>
Subject: Which changes in graphic stack could cause eye strain problems
MIME-Version: 1.0
References: <1441784245.1474829.1562140631783.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13913 YMailNorrin Mozilla/5.0 (X11; Ubuntu;
 Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0
X-Mailman-Approved-At: Wed, 03 Jul 2019 13:15:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1562140633;
 bh=6ssJj5Udgdg3QwWsIWrWOTeki3mvYghSRBmqx5dfztM=;
 h=Date:From:To:Subject:References:From:Subject;
 b=A3WgQodsLTK3A/F7gPvFxN5bw5aLlhn5fknD73E9JwrL7Jc2xsa6+KGe7wVFHRBOoChr9smHWyQoaIFFt4lBHxqYUuJcxlAJ5HcIEHPdKrOB3oUp7jkAJfEgeRZNwMR8dsIbHKZPC9pJ5cIUt2JorFVZbB1Z4euDHSqA3BS8wd4qDjz1pCYcJBUxSJz9dbXk4t/6qFZoXIKfoiSPPXPaaDu+hN/k1Sadc9iZi8eUDo2DSpbB/6S5E2dtHDG+ByHUys36aVZ87JOW4xjTYcSlKtfYfGz7K8lxIiSW2iZESvjrlnEpipJOMmaE2eRX+wBiryFyjc9WdBB/PfY5y3GIQw==
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
Content-Type: multipart/mixed; boundary="===============1090547162=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1090547162==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1474828_907294812.1562140631781"

------=_Part_1474828_907294812.1562140631781
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 I've been using Ubuntu 14.4.0 (with updates) for many years and can't swit=
ch to any newer Linux distribution.
Actually on attempt to upgrade to anything newer I got problems with eyes a=
nd head (actually problem feelings are started in muscle at my right head s=
ide and then in eyes - irritation, burn, discomfort and so on, then i got a=
 weakness in my full body).=20
My hardware configuration is same during attempt of upgrade and I have simi=
lar filing regardless of used driver (opensource or proprietary).Problem fe=
elings doesn't depends on used graphic card: AMD/ATI, Nvidia or Intel.
The hardness of feelings just depends on distribution: the hardest ones on =
Ubuntu 19.04 and less ones on Mint 19.1

I think that some relevant for my story changes was added to graphic stack =
around 2014 year=20
or maybe even before 2014 and default=C2=A0 behaviour was switched to them =
around 2014.
There are several report of same problem with intel graphic made in 2014:ht=
tps://lists.freedesktop.org/archives/intel-gfx/2014-January/038104.html
https://lists.freedesktop.org/archives/intel-gfx/2014-March/042689.html
Actually I can't use any display with LED backlight and still using one wit=
h CCFL. Maybe this changes are related to LED display support.

There is also report on ledstrain site:https://ledstrain.org/d/384-linux-us=
ers-any-known-good-distro-de/15

Could you suggest which changes could be related to described problem?Could=
 it be some hidden dithering in graphics stack or something else?My attempt=
 to play with different configuration options doesn't give me any result (i=
ncluding dithering disabling in graphic card driver)?
Best regards,=C2=A0=C2=A0 Mike






------=_Part_1474828_907294812.1562140631781
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp9255c4beyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div dir=3D"ltr" data-setdir=3D"false"><span> <span>I've been using Ubun=
tu 14.4.0 (with updates) for many years and can't switch to any newer Linux=
 distribution.</span><br></span></div><div dir=3D"ltr" data-setdir=3D"false=
"><span>Actually on attempt to upgrade to anything newer I got problems wit=
h eyes and head (actually problem feelings are started in muscle at my righ=
t head side and then in eyes - irritation, burn, discomfort and so on, then=
 i got a weakness in my full body). <br></span></div><div dir=3D"ltr" data-=
setdir=3D"false"><span>My hardware configuration is same during attempt of =
upgrade and I have similar filing <span><span class=3D"ydp813558b8tlid-tran=
slation ydp813558b8translation" lang=3D"en"><span title=3D"">regardless</sp=
an></span></span> of used driver (opensource or proprietary).</span></div><=
div dir=3D"ltr" data-setdir=3D"false"><span>Problem feelings doesn't depend=
s on used graphic card: AMD/ATI, Nvidia or Intel.<br></span></div><div dir=
=3D"ltr" data-setdir=3D"false"><span>The hardness of feelings just depends =
on distribution: the hardest ones on Ubuntu 19.04 and less ones on Mint 19.=
1<br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span><br></span><=
/div><div dir=3D"ltr" data-setdir=3D"false"><span>I think that some relevan=
t for my story changes was added to graphic stack around 2014 year <br></sp=
an></div><div dir=3D"ltr" data-setdir=3D"false"><span>or maybe even before =
2014 and default&nbsp; <span>behaviour</span> was switched to them around 2=
014.<br></span></div><div dir=3D"ltr" data-setdir=3D"false"><span>There are=
 several report of same problem with intel graphic made in 2014:</span></di=
v><div dir=3D"ltr" data-setdir=3D"false"><div><span><a href=3D"https://list=
s.freedesktop.org/archives/intel-gfx/2014-January/038104.html" rel=3D"nofol=
low" target=3D"_blank">https://lists.freedesktop.org/archives/intel-gfx/201=
4-January/038104.html</a><br></span></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><div><a href=3D"https://lists.freedesktop.org/archives/intel-gfx/2014=
-March/042689.html" rel=3D"nofollow" target=3D"_blank">https://lists.freede=
sktop.org/archives/intel-gfx/2014-March/042689.html</a></div><div><br></div=
><div dir=3D"ltr" data-setdir=3D"false">Actually I can't use any display wi=
th LED backlight and still using one with CCFL. Maybe this changes are rela=
ted to LED display support.<br></div><div><br></div><div dir=3D"ltr" data-s=
etdir=3D"false">There is also report on ledstrain site:</div><div dir=3D"lt=
r" data-setdir=3D"false"><a href=3D"https://ledstrain.org/d/384-linux-users=
-any-known-good-distro-de/15" rel=3D"nofollow" target=3D"_blank">https://le=
dstrain.org/d/384-linux-users-any-known-good-distro-de/15</a></div><div><br=
></div><div><br></div><div dir=3D"ltr" data-setdir=3D"false">Could you sugg=
est which changes could be related to described problem?</div><div dir=3D"l=
tr" data-setdir=3D"false">Could it be some hidden dithering in graphics sta=
ck or something else?</div><div dir=3D"ltr" data-setdir=3D"false">My attemp=
t to play with different configuration options doesn't give me any result (=
including dithering disabling in graphic card driver)?</div><div dir=3D"ltr=
" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Be=
st regards,</div><div dir=3D"ltr" data-setdir=3D"false">&nbsp;&nbsp; Mike<b=
r></div><div><br></div><div><br></div><span></span></div><div><br></div><di=
v><br></div><div><br></div></div><div dir=3D"ltr" data-setdir=3D"false"><sp=
an></span></div></div></body></html>
------=_Part_1474828_907294812.1562140631781--

--===============1090547162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1090547162==--
