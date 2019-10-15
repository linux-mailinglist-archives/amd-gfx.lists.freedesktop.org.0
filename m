Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7DD7B64
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 18:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D006889CF1;
	Tue, 15 Oct 2019 16:27:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2a.mailbox.org (mx2a.mailbox.org [80.241.60.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8AE389CF1
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 16:27:46 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2a.mailbox.org (Postfix) with ESMTPS id 1B4E7A1748;
 Tue, 15 Oct 2019 18:27:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id CG2KkgSYgYGJ; Tue, 15 Oct 2019 18:27:41 +0200 (CEST)
Message-ID: <5c54232e90a83412e4ba5777b73716050d939def.camel@daenzer.net>
Subject: [ANNOUNCE] xf86-video-ati 19.1.0
From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
To: xorg-announce@lists.x.org
Date: Tue, 15 Oct 2019 18:27:28 +0200
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
Content-Type: multipart/mixed; boundary="===============0302734300=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============0302734300==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-6GNkbe2g2FLwkj8/67D4"


--=-6GNkbe2g2FLwkj8/67D4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


I'm pleased to announce the 19.1.0 release of xf86-video-ati, the Xorg
driver for ATI/AMD Radeon GPUs supported by the radeon kernel driver.
This release supports xserver versions 1.13-1.20.

There are no big changes in this release, just fixes and other minor
improvements.

Thanks to everybody who contributed to this release in any way!


NOTE:

As of September, I'm no longer working for AMD but for Red Hat's
graphics/input infrastructure team. I'm hoping that someone from my
former team at AMD will step up to maintain this driver.


Flora Cui (1):
      dri2: reply to client for WaitMSC request in any case

Michel D=C3=A4nzer (9):
      Retry get_fb_ptr in get_fb
      dri3: Always flush glamor before sharing pixmap storage with clients
      dri2: Re-use previous CRTC when possible if pick_best_crtc returns NU=
LL
      Remove dri2_drawable_crtc parameter consider_disabled
      present: Check that we can get a KMS FB for flipping
      Don't disable page flipping completely with SW cursor
      Don't set up black scanout buffer if LeaveVT is called from CloseScre=
en
      Don't unreference FBs of pixmaps from different screens in LeaveVT
      Bump version for 19.1.0 release

git tag: xf86-video-ati-19.1.0

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-ati-19.1.=
0.tar.bz2
MD5:  6e49d3c2839582af415ceded76e626e6  xf86-video-ati-19.1.0.tar.bz2
SHA1: aea1d11c05531b03f2eb67c6785cddf6d7f30e5f  xf86-video-ati-19.1.0.tar.b=
z2
SHA256: 659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49  x=
f86-video-ati-19.1.0.tar.bz2
SHA512: 73a81f6c492daf2e89067fb52b3033dc0fe6841f109627ddca1aee54a45a738c8c1=
34443753a2a2aaa2c131e1d560057ebc76351ff2304c16407df3ff568fcd6  xf86-video-a=
ti-19.1.0.tar.bz2
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-ati=
-19.1.0.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-ati-19.1.=
0.tar.gz
MD5:  c4172d2b6883a6e8e57c737248b3c9c8  xf86-video-ati-19.1.0.tar.gz
SHA1: 6c5c06555c2aed695b28b5b5d617a994e9926410  xf86-video-ati-19.1.0.tar.g=
z
SHA256: c05c6e0c396a0148113f1836cfab7f2e43f784c9b7041f11e9cab40a4bc0c90f  x=
f86-video-ati-19.1.0.tar.gz
SHA512: c382c68ed5f3a690b293e3b56dfdf71f5b279f52da6db925cb5302e595003f69451=
670fe1ec9546ad4d91cb328b367777f547757a69d70ed8b4ade75e613e302  xf86-video-a=
ti-19.1.0.tar.gz
PGP:  https://xorg.freedesktop.org/archive/individual/driver/xf86-video-ati=
-19.1.0.tar.gz.sig


--=20
Earthling Michel D=C3=A4nzer               |               https://redhat.c=
om
Libre software enthusiast             |             Mesa and X developer

--=-6GNkbe2g2FLwkj8/67D4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHEEABECADEWIQSwn681vpFFIZgJURRaga+OatuyAAUCXaXzcBMcbWljaGVsQGRh
ZW56ZXIubmV0AAoJEFqBr45q27IAtx4AmQE4JXIbBIMZbhvaazQ2Nybfwj7BAJ0f
KNJwtwRtSdQHpakqIEsSKmCqNg==
=y1ED
-----END PGP SIGNATURE-----

--=-6GNkbe2g2FLwkj8/67D4--


--===============0302734300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0302734300==--

