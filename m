Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9E8184B
	for <lists+amd-gfx@lfdr.de>; Mon,  5 Aug 2019 13:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6593F6E3F9;
	Mon,  5 Aug 2019 11:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1597 seconds by postgrey-1.36 at gabe;
 Mon, 05 Aug 2019 11:38:47 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9056E406
 for <amd-gfx@lists.freedesktop.org>; Mon,  5 Aug 2019 11:38:47 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1huauM-0008IA-Rb; Mon, 05 Aug 2019 11:12:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C258A2742D06; Mon,  5 Aug 2019 12:12:05 +0100 (BST)
Date: Mon, 5 Aug 2019 12:12:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>,
 Dennis Li <dennis.li@amd.com>
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
Message-ID: <20190805111205.GB6432@sirena.org.uk>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K4Aat8AT+6tYW8UP9Bp0lYfZhLOGe429fHYIBSshOXA=; b=i+hQmhPyAnXuKrxgrdyNGvu5Z
 rdXYA9jTPHqEhzd0yklVGCUut72A3c3rjaKnylc58wr0k/GyqUaGyC23VXXP07OGiEKKcyIZvkUzx
 vfFVK1K7F6hftZ+zGhPbDefsvqhjSDu2jN91D/IKG/CydHqgNUjUglKribqQ3cuYiYiUY=;
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
Cc: linux-next@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 kernel-build-reports@lists.linaro.org
Content-Type: multipart/mixed; boundary="===============1522405714=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============1522405714==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 02:40:32AM -0700, kernelci.org bot wrote:

Today's -next fails to build an arm allmodconfig due to:

> allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 16 warnings, 0 sectio=
n mismatches
>=20
> Errors:
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit dec=
laration of function 'readq'; did you mean 'readb'? [-Werror=3Dimplicit-fun=
ction-declaration]
>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit dec=
laration of function 'writeq'; did you mean 'writeb'? [-Werror=3Dimplicit-f=
unction-declaration]

due to 4fa1c6a679bb0 (drm/amdgpu: add RREG64/WREG64(_PCIE) operations)
which introduces use of readq() and writeq().

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1IDwQACgkQJNaLcl1U
h9ARMQf8CpKTcEPj9AoJAXRS0EO8wCrctRVwqRqJ4Vb13LXHkmNV9a15IgiKoEM7
OHHTwl/t/mBlajYsyoghxsgB0aIXckM5rJ77d+GEFQln4rkjx3ZmxFwZKhUNNbcE
3Jn5jYj3B37pbnzB7aYJK1ESO9lKOHY45ZcywGG+cvgqWuRHu8jdCuQXE3xFbNBM
CdDJh3JK5ihmP97JCGSUvGZCJS8StLHsLzJ0G2/K7wCYM86N3NxIYKeDuwYtXgna
tWl6ZwwsnV70LLjGueAHIUC3kk/2vi9UHpjLpUr8PZI9f3WKJZfibW+7JqqYgp/5
S6J7mggMrr4WljGwRgLwbuKFDmPKkw==
=mwnn
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--

--===============1522405714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1522405714==--
