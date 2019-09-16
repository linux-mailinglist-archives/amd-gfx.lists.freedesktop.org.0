Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29109B440C
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 00:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2A86EAA0;
	Mon, 16 Sep 2019 22:36:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245356EAA0
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 22:36:21 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9zbU-0005xV-Hp; Mon, 16 Sep 2019 22:36:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id F1B392741A12; Mon, 16 Sep 2019 23:36:15 +0100 (BST)
Date: Mon, 16 Sep 2019 23:36:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/amd/display: build failed for DCN2.1
Message-ID: <20190916223615.GP4352@sirena.co.uk>
References: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
 <CAKwvOdn8-T3Q=LhiGu6H7dCpwXXrNAjpKJA5z0d+N4qB8bOapQ@mail.gmail.com>
 <20190916221203.GM4352@sirena.co.uk>
MIME-Version: 1.0
In-Reply-To: <20190916221203.GM4352@sirena.co.uk>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zwTiVNzI0LeRxK/edD5yzh+GfhI4/eRo1Z+qIcjAWhM=; b=s8JdTcItMSAba02Hr4c/2vjzL
 Q6N/JwrEhts/Za8/bf27dRvZQqlt82bJ/gXvwwQtSIQpI2xj3pBR1DtXmjztQwfUx28DXaFkFo3Sg
 /gd9AaPibhgW5R5wXXz6F0XM0IZnpwFawB0+CdT9hRQ0UVbLxNSkQZm7paPDxcKsU4sPc=;
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
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>, "Li,
 Sun peng \(Leo\)" <sunpeng.li@amd.com>, Bhawanpreet.Lakha@amd.com,
 David Airlie <airlied@linux.ie>, Roman.Li@amd.com,
 amd-gfx@lists.freedesktop.org, Xinpeng Liu <danielliu861@gmail.com>,
 Jun.Lei@amd.com, Harry Wentland <harry.wentland@amd.com>, "Koenig,
 Christian" <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0720410198=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============0720410198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JQcP/qOTM3HdZIaJ"
Content-Disposition: inline


--JQcP/qOTM3HdZIaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 11:12:03PM +0100, Mark Brown wrote:
> On Mon, Sep 16, 2019 at 01:51:15PM -0700, Nick Desaulniers wrote:
>=20
> > + Mark
> > I think this was a result of the resolved merge conflict.  See the
> > -next only commit titled:
> >     Merge remote-tracking branch 'drm/drm-next'

> Yes, the DRM and the Kbuild people really need to coordinate with each
> other here I fear, it's pretty bad that stuff like this has to be done
> in a merge at all :/ The fact that make doesn't detect a missing endif
> is also concerning.

Applied now, thanks Xinpeng.

--JQcP/qOTM3HdZIaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ADl8ACgkQJNaLcl1U
h9DFWQf9HYsD60H/KqSf9UafvtsbRnYJ/E150z6qfU+4SxcuvgaFc5+LrQMPo6Sg
vYZw0ttOlxi61MpdSan2zsFY/+vuHROKPaGUWpCF5dP3Wx1UeXo8PMd3gtw/xyGz
Izy25kzC2JvP/14mylXA6pMVQ4297JwnkBP5nKltu+uwI/NAHNqYoCw8g2EA46dO
GCquk5qIC+hs089gKwR3NF1Y/FK2+Bjnvd6JNaZaQXKrYAt5x+VvgobxcnLwc61r
GwuhSNvQ4GGy5JUQJl3COfW5xOAGg+whCJuYjEx5ooPnKX4oVeru3udvL6eI6o9S
t2VBe3O32kZ1FR9osKjKigcSBsnJtA==
=CF/Q
-----END PGP SIGNATURE-----

--JQcP/qOTM3HdZIaJ--

--===============0720410198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0720410198==--
