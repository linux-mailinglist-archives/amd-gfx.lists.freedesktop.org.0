Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC91621D0
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Feb 2020 08:56:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C690F6E157;
	Tue, 18 Feb 2020 07:56:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BD96E143
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Feb 2020 07:22:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id t14so1657678wmi.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 17 Feb 2020 23:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TIScjOBSOSMA1qpng5jzqzolCHxTEyvTDv/wLke9INc=;
 b=lR/2780I15f+ilbVGU6KP5kTJYl5RGcj0g4aumbxjEOBFNTvjC8GHo5Y6K4n32ciyS
 0APKNla0RI/BtEBbG2iiaEGUiwpDbqlomd2FHTrgSmNd7L2i0u+AzVkeXlabrjNaI/Ko
 Hy8L/gz5hIiHz1o9ZbHu6E6GYBFl3L+qftcR1d6YPj8R1SfiQHrSa+Fm4HM9PVFE51rf
 2ztR7oKhBb1qfEXs6CDQ7YCRQSgVJB00OGpj36yKhSrMaN2ZBkeG8iA4HHyG81ywKQNs
 Uhv6PKQgKKbOWJyDMy9U1S+PMTuVQXUvJV20bGc+YIUKSzl55PPj+t0KaSP82pxYe/uk
 pGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TIScjOBSOSMA1qpng5jzqzolCHxTEyvTDv/wLke9INc=;
 b=oIzlMEq5CRGXGYS2i1bBTFzS0FxaqUS08ii99eJwP5CgTQoVqPN1gZriTtmYE+t5U5
 y+BRL6deFuow5DsHMoeliC5qo8NYwyA4KmpLkzLFlzO0ojQ2+WJGVO8AC0Vpm03rNh0E
 nZizmfNhjr5A4gygvWpXomCIQH4isYyS7byxbRSY9C88gr9L+SqX4iyO0b2iX8t69d4D
 WtgwcnuGGGQCxgMr6ahTgP/xnw7geoXZm3PfrAt3UBLcMP1Rf/hpfAC6kBMZNCGA1/rV
 Nu0/1WxILyyVbXe8BlvkuuQgJxENPo//XNR9Zez089PSGegnl+BNQ26M9vbtZTtYtI2w
 UqqA==
X-Gm-Message-State: APjAAAXVe7wsNqCE38Dy7AgYX6Kr7wtN+TDP3BWD2ai81I6w1DZ7yF5n
 2E9jwUVQXApJd8md/Hu1l3nYNiROo62GhZjzKuEvysSF
X-Google-Smtp-Source: APXvYqwPcaZlIqWQjNqq5Mfnv2N3P0La5VZ2rQl2IfogL80PyUPO3GtTX/8nCmnW92wqfVGpOQF/qQEZkXaa3lkSjho=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr1272966wmg.167.1582010559229; 
 Mon, 17 Feb 2020 23:22:39 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Yusuf_Alt=C4=B1parmak?= <yusufalti1997@gmail.com>
Date: Tue, 18 Feb 2020 13:22:28 +0300
Message-ID: <CAGzVRjzs8rgaLkWcaxdAn-DUf3Kk70TW=NPM+Hk9SLt7Tcjsfg@mail.gmail.com>
Subject: writing custom driver for VGA emulation ?
To: amd-gfx@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 18 Feb 2020 07:56:15 +0000
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
Content-Type: multipart/mixed; boundary="===============1165251554=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1165251554==
Content-Type: multipart/alternative; boundary="00000000000069f3c0059ed48932"

--00000000000069f3c0059ed48932
Content-Type: text/plain; charset="UTF-8"

Hello AMD team;

I have E 9171 GPU and want to use it on a embedded system which has limited
MMIO space on PCIe bus (MAX 512 MB).

I received feedbacks that I can only use VGA emulation with this memory
space. I was unable to get 'amdgpu' driver working with Xorg due to I had
many errors(firmwares are not loading) in each step and tired of solving
them one by one.

I want to write a simple custom driver for this GPU with kernel version
4.19.
Is it possible to print some colors on screen with a custom driver over
PCIe communication ? or writing some words on screen as VGA ?

If answer is yes, then which code pieces (on amdgpu driver folder) or
reference documentation should I use? I have Register Reference Guide.pdf.

I will be appreciated for your guidance.

Best regards.

--00000000000069f3c0059ed48932
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello AMD team;</div><div><br></div><div>I have E 917=
1 GPU and want to use it on a embedded system which has limited MMIO space =
on PCIe bus (MAX 512 MB). <br></div><div><br></div><div>I received feedback=
s that I can only use VGA emulation with this memory space. I was unable to=
 get &#39;amdgpu&#39; driver working with Xorg due to I had many errors(fir=
mwares are not loading) in each step and tired of solving them one by one. =
<br></div><div><br></div><div>I want to write a simple custom driver for th=
is GPU with kernel version 4.19. <br></div><div>Is it possible to print som=
e colors on screen with a custom driver over PCIe communication ? or writin=
g some words on screen as VGA ?<br></div><div><br></div><div>If answer is y=
es, then which code pieces (on amdgpu driver folder) or reference documenta=
tion should I use? I have Register Reference Guide.pdf.</div><div><br></div=
><div>I will be appreciated for your guidance.</div><div><br></div><div>Bes=
t regards.</div><div><br></div><div><br></div></div>

--00000000000069f3c0059ed48932--

--===============1165251554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1165251554==--
