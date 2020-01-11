Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7159137C92
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jan 2020 10:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3A16EA6D;
	Sat, 11 Jan 2020 09:16:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93AB6EA6D
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jan 2020 09:16:19 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id cy15so3847292edb.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jan 2020 01:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=egaming.ro; s=msecurizat;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CaKIRaBoUJHRuLweiBn1xUMOkg5iyFur3VLxwC79RdQ=;
 b=iIvTFgo/3l5AVcyHDnoK+qpteouXJM1tRg+vbyK0urluPL5n1qbxRLNiS1PJRCD097
 Z8OhL5dm46IPRsWXqYDx7GWW0MEWaMKUjzFp0IojFVmfEf+RHIqsXsDpE7TDMM4Y+9cI
 yGUOX2MYQ/5FSJQ5w7nqOHG3TF70thA1I2HQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CaKIRaBoUJHRuLweiBn1xUMOkg5iyFur3VLxwC79RdQ=;
 b=P0ciqXwLDBuNbZgHR653b2dO8TUK/wDpAE6FP8VKeTMdBgxWeu7BpcUyxBzb3bAYx/
 Bt76ucFQ6LLDA/zbxjPGEEm7Tl1bJWvrwVCenuiZTVDZkuPeRhxmj6+2ZmhOOqwpMwPX
 qZyxOu1GDDYUTKxeYeC5gDPfNIxeKA66AIimiGI+CLGA3gALWnlmc3GSFGkt7AgUARxd
 2eIR/w/mxZ5HIhCm7S5k3fPawsTiUFHNhBVw4yl4tanFJoIHWQqwNI8uhpHqYB31ILTB
 8JUtTPpfgZCGzOXn3eZ8YUIdZaMaVZiwPp3+miedEi3Ey1IEPCTRqvfsW9lV8sV9qzG+
 IgKA==
X-Gm-Message-State: APjAAAUFmhT+WhSlb1ULkPGhgwjyOrMdWmLCbPPh/OgeGIrCihn2d2y2
 jytkdJEEs0WHbjt4ScYau99trfXdcJjiz0lDFsBGtw==
X-Google-Smtp-Source: APXvYqxTI1SZGjMfdxO/mIBrXV4gXvue19oO7QCyf/QsqLCayeg+J2mwqeDHfxK4xeGfiTS8+bdhuntD0SUdN9LquBE=
X-Received: by 2002:a17:906:66c5:: with SMTP id
 k5mr4099109ejp.339.1578734178268; 
 Sat, 11 Jan 2020 01:16:18 -0800 (PST)
MIME-Version: 1.0
References: <53045edd-ac1b-d928-0e3e-e683f34be1ce@fedoraproject.org>
In-Reply-To: <53045edd-ac1b-d928-0e3e-e683f34be1ce@fedoraproject.org>
From: Mihai <xanto@egaming.ro>
Date: Sat, 11 Jan 2020 11:16:07 +0200
Message-ID: <CAPib=sPG5rcX67Vk0Lhkv=nHcZeEsUn+MFaCsjDmEfBiybzEDQ@mail.gmail.com>
Subject: Re: [follow-up] AMD Sensir Fusion HUB status
To: Luya Tshimbalanga <luya@fedoraproject.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1493982005=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1493982005==
Content-Type: multipart/alternative; boundary="000000000000e4112f059bd9b148"

--000000000000e4112f059bd9b148
Content-Type: text/plain; charset="UTF-8"

Finally arrived:
https://patchwork.kernel.org/project/linux-iio/list/?submitter=175589

On Fri, Dec 13, 2019, 5:25 PM Luya Tshimbalanga <luya@fedoraproject.org>
wrote:

> Any update about the Sensor Fusion HUB status? Thanks.
>
> --
> Luya Tshimbalanga
> Fedora Design Team
> Fedora Design Suite maintainer
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000e4112f059bd9b148
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Finally arrived:=C2=A0<a href=3D"https://patchwork.kernel=
.org/project/linux-iio/list/?submitter=3D175589">https://patchwork.kernel.o=
rg/project/linux-iio/list/?submitter=3D175589</a></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 13, 2019, 5:25=
 PM Luya Tshimbalanga &lt;<a href=3D"mailto:luya@fedoraproject.org">luya@fe=
doraproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Any =
update about the Sensor Fusion HUB status? Thanks.<br>
<br>
-- <br>
Luya Tshimbalanga<br>
Fedora Design Team<br>
Fedora Design Suite maintainer<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/amd-gfx</a><br>
</blockquote></div>

--000000000000e4112f059bd9b148--

--===============1493982005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1493982005==--
