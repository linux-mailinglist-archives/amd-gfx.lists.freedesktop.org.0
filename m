Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34022D45BB
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 18:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3537E6EC64;
	Fri, 11 Oct 2019 16:50:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3E5C36EC67
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 16:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2B1E92AA0EF;
 Fri, 11 Oct 2019 18:50:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id nL-YhW_juqQG; Fri, 11 Oct 2019 18:50:48 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id C694A2A6016;
 Fri, 11 Oct 2019 18:50:48 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.2)
 (envelope-from <michel@daenzer.net>)
 id 1iIy7s-0007Mf-Cj; Fri, 11 Oct 2019 18:50:48 +0200
Resent-From: =?UTF-8?Q?Michel_D=c3=a4nz?= =?UTF-8?Q?er?= <michel@daenzer.net>
Resent-To: xorg-announce@lists.x.org
Resent-CC: xorg@lists.x.org,
 amd-gfx@lists.freedesktop.org
Resent-Date: Fri, 11 Oct 2019 18:50:48 +0200
Resent-Message-ID: <4923f143-34dd-6507-ed29-979ae5a382eb@daenzer.net>
Message-ID: <d42184a578b143e2205f55dcf370834f0b0cfbab.camel@daenzer.net>
Subject: [ANNOUNCE] xf86-video-amdgpu 19.1.0
From: Michel =?ISO-8859-1?Q?D=E4nzer?= <michel@daenzer.net>
To: xorg-announce@lists.x.org
Date: Fri, 11 Oct 2019 18:46:13 +0200
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Evolution-Identity: ec3ec94d3993f47a87b3d12e094ae9183762c25f
X-Evolution-Fcc: folder://c16efc246c7fa36ff6ce898e8c09347113402280/Sent
X-Evolution-Transport: 6df5e5849af737b4b764fcb3068763be810aec4b
X-Evolution-Source: 
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
Content-Type: multipart/mixed; boundary="===============0621236716=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============0621236716==
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

--===============0621236716==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0621236716==--
