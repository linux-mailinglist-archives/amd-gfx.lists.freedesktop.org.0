Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D05114268
	for <lists+amd-gfx@lfdr.de>; Thu,  5 Dec 2019 15:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D146F6E0DC;
	Thu,  5 Dec 2019 14:16:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5475B6E0DC
 for <amd-gfx@lists.freedesktop.org>; Thu,  5 Dec 2019 14:16:16 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id f8so2809159edv.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 05 Dec 2019 06:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9whneD11HYsw5vq3gc3MsSjuUUjP5Bp+vmXI9zfTTM8=;
 b=JeW0Sj5gAtYMhsS9867ua3OKOl62VSCKblK3V8WQ2Y77UMDmGpgxUZ/leqwqV62Zlv
 B3bvH09fHZycBdmyYx5pMxeXQh8CLYiHe7+sGbqLgoBd6RGsQrtBdPZxyAeCkBtpT7yF
 2rn45gHgp+4r43w6vP36h+ELFUjS8nVBIJuK9q4xX1ZWQISnpKtSNBLg7r8NdTcY7ePF
 cMAgf+fEhfB9qX0VoDQqWCBeVBsyXmGAwGPgzl1z05AehNNqCcjkov7pQH45kRpbggPF
 hyGl79NpHOH9ssiG/H8S/EczQoMHCU0OPLKObqHNh/dV8RBU1BqrHSpSG4rtaFd38LPb
 wTPw==
X-Gm-Message-State: APjAAAX6EjAhbS18qKC/uL0FiYnUmaZSM2P1WDmm6B/obCNSEDjCygXp
 Mn5SP0XkOLNzjeQeVPg9p95k3geBghUZvrEB3/V2qbHd
X-Google-Smtp-Source: APXvYqyXLyuoeZ87xTJL3I3pUZs+hWFnXRjUtTomqEChfMPG/KERPC4tGv/oxXxOBG7FkEpbE8kurxLIWsCa1v8X/rI=
X-Received: by 2002:a17:906:828b:: with SMTP id
 h11mr9591554ejx.273.1575555374951; 
 Thu, 05 Dec 2019 06:16:14 -0800 (PST)
MIME-Version: 1.0
From: Matthew Taylor <mat@sharrow.me.uk>
Date: Thu, 5 Dec 2019 14:16:03 +0000
Message-ID: <CAJ0uJC1kxmAdwjRGMf8ZHospNz5sO1jV1E0E1_tsBZCrDVK=ag@mail.gmail.com>
Subject: [RFC 0/7] UVD support for SI in amdgpu
To: amd-gfx@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharrow-me-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=9whneD11HYsw5vq3gc3MsSjuUUjP5Bp+vmXI9zfTTM8=;
 b=sc4UCn8+mcYQa0Sj6puqb/slUmGUokjfoN9FpL6phdbD2dT615JvaG6qMpS8bfxmzv
 2GqMAZbNMxNxBvjdnebVY5eXWiH1Lx3TAPeGhNtK16mK6ivZSEj79oZ8vFHSQtbkUAKE
 l20DDuE0PfOSOqqQGM+WRqZtL5CPW59O3UQ/SHEcyt8rM+dX7/taANE9UMNMINkufXwD
 mZMqJwhw1l1EmFVUWAd737hodNonfwhgw2I1U0mVv5ervy30JoGKFdpncQ8bfvMeMAiz
 JWHtGjIp3vijc2nhscmMC4WEjgeJ2DZ2OLPbZ5nw3OhTxa7hhhhtyaCY4TXGWFyfTL+v
 D0RQ==
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
Content-Type: multipart/mixed; boundary="===============0924927378=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0924927378==
Content-Type: multipart/alternative; boundary="00000000000072c5230598f59276"

--00000000000072c5230598f59276
Content-Type: text/plain; charset="UTF-8"

Hi,

Back in November 2017, Piotr Redlewski, provided some patches for UVD
support in the SI cards, the thread had the same subject as this message.

The outcome of a conversation between himself and other developers on the
list was to wait for something in updated firmware.  As this was over 2
years ago, I was wondering if the firmware has been updated sufficiently
for Piotr's patches to be reconsidered or modified to deliver the UVD
support for the SI cards?

Thanks for you help

Kind Regards

Matthew Taylor

--00000000000072c5230598f59276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Back in November 2017, Piotr Redlew=
ski, provided some patches for UVD support in the SI cards, the thread had =
the same subject as this message.=C2=A0=C2=A0<br><br>The outcome of a conve=
rsation between himself and other developers on the list was to wait for so=
mething in updated firmware.=C2=A0 As this was over 2 years ago, I was wond=
ering if the firmware has been updated sufficiently for Piotr&#39;s patches=
 to be reconsidered or modified to deliver the UVD support for the SI cards=
?</div><div><br></div><div>Thanks for you help</div><div><br></div><div>Kin=
d Regards</div><div><br></div><div>Matthew Taylor</div></div>

--00000000000072c5230598f59276--

--===============0924927378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0924927378==--
