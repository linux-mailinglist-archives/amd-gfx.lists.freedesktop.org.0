Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E5D45E3
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 18:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C0489A32;
	Fri, 11 Oct 2019 16:56:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Fri, 11 Oct 2019 16:56:11 UTC
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11186EC67
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 16:56:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2a.mailbox.org (Postfix) with ESMTPS id E0513A2407;
 Fri, 11 Oct 2019 18:46:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id J158PpCoLgV5; Fri, 11 Oct 2019 18:46:22 +0200 (CEST)
Message-ID: <d42184a578b143e2205f55dcf370834f0b0cfbab.camel@daenzer.net>
Subject: [ANNOUNCE] xf86-video-amdgpu 19.1.0
From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
To: xorg-announce@lists.x.org
Date: Fri, 11 Oct 2019 18:46:13 +0200
MIME-Version: 1.0
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
Cc: xorg@lists.x.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1585935736=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============1585935736==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-nhXDBgXD2LgU3Q/kw0nZ"


--=-nhXDBgXD2LgU3Q/kw0nZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


I'm pleased to announce the 19.1.0 release of xf86-video-amdgpu, the
Xorg driver for AMD Radeon GPUs supported by the amdgpu kernel driver.
This release supports xserver versions 1.13-1.20.

There are no big changes in this release, just fixes and other minor
improvements.

Thanks to everybody who contributed to this release in any way!


NOTE:

As of September, I'm no longer working for AMD but for Red Hat's
graphics infrastructure team. I'm hoping that someone from my former
team at AMD will step up to maintain this driver.


Flora Cui (1):
      dri2: reply to client for WaitMSC request in any case

Michel D=C3=A4nzer (13):
      Retry get_fb_ptr in get_fb
      dri3: Always flush glamor before sharing pixmap storage with clients
      dri2: Re-use previous CRTC when possible if pick_best_crtc returns NU=
LL
      Remove dri2_drawable_crtc parameter consider_disabled
      present: Check that we can get a KMS FB for flipping
      Don't disable page flipping completely with SW cursor
      gitlab-ci: Use templates from wayland/ci-templates
      present: Also check pixmap pitch in check_flip with current xserver
      present: Don't check pixmap pitch in check_flip with current DC
      present: Don't check pixmap pitch in check_flip with non-DC >=3D 3.34
      Don't set up black scanout buffer if LeaveVT is called from CloseScre=
en
      Don't unreference FBs of pixmaps from different screens in LeaveVT
      Bump version for the 19.1.0 release

git tag: xf86-video-amdgpu-19.1.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-19=
.1.0.tar.bz2
MD5:  55ad19b858e186a2cf4e91ed832c05e7  xf86-video-amdgpu-19.1.0.tar.bz2
SHA1: 044a97ea2f36dd3d2d4844bb503dd4e2b2854d56  xf86-video-amdgpu-19.1.0.ta=
r.bz2
SHA256: 4f0ea4e0ae61995ac2b7c72433d31deab63b60c78763020aaa1b28696124fe5d  x=
f86-video-amdgpu-19.1.0.tar.bz2
SHA512: ccdaa2378492da1a2f3d18fedacd1318c4708da534a8a959276a82730d5420619d8=
3ad1ec8d7835c55655fe56123cd9bffb44e6223c5a97033c01f598af4a173  xf86-video-a=
mdgpu-19.1.0.tar.bz2
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amd=
gpu-19.1.0.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amdgpu-19=
.1.0.tar.gz
MD5:  5aec06fed52d09838d0511c59dd2d861  xf86-video-amdgpu-19.1.0.tar.gz
SHA1: 453ef4c403c1966bb0555057248629a1514ab18e  xf86-video-amdgpu-19.1.0.ta=
r.gz
SHA256: 9967435ca5686395375adea503ee774ddb95181505247d164ee3a1a2995a081f  x=
f86-video-amdgpu-19.1.0.tar.gz
SHA512: 660bea3ff6c8123ebc7df82b8e90308759c1575a3b28fddc95f0e46b575250991ed=
a36f0e85d9db9777d712c247dadc8ce1f45541146ac513ec8874b774a440d  xf86-video-a=
mdgpu-19.1.0.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-amd=
gpu-19.1.0.tar.gz.sig

--=20
Earthling Michel D=C3=A4nzer               |               https://redhat.c=
om
Libre software enthusiast             |             Mesa and X developer

--=-nhXDBgXD2LgU3Q/kw0nZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHEEABECADEWIQSwn681vpFFIZgJURRaga+OatuyAAUCXaCx1RMcbWljaGVsQGRh
ZW56ZXIubmV0AAoJEFqBr45q27IAYgQAn3PGCJ9pv9d3kdWSSM4pw0fQIRExAKCB
XiWaFB7Mwnn9mf6CiVHzc58lcQ==
=mc73
-----END PGP SIGNATURE-----

--=-nhXDBgXD2LgU3Q/kw0nZ--


--===============1585935736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1585935736==--

