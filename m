Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDDB43CD
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 00:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358776EA92;
	Mon, 16 Sep 2019 22:12:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849CF6EA92
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Sep 2019 22:12:07 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9zE4-0005r2-CJ; Mon, 16 Sep 2019 22:12:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6C9B72741A12; Mon, 16 Sep 2019 23:12:03 +0100 (BST)
Date: Mon, 16 Sep 2019 23:12:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] drm/amd/display: build failed for DCN2.1
Message-ID: <20190916221203.GM4352@sirena.co.uk>
References: <1568624607-19067-1-git-send-email-danielliu861@gmail.com>
 <CAKwvOdn8-T3Q=LhiGu6H7dCpwXXrNAjpKJA5z0d+N4qB8bOapQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdn8-T3Q=LhiGu6H7dCpwXXrNAjpKJA5z0d+N4qB8bOapQ@mail.gmail.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RJOSbm+OShZbFsvceGi6LMh6ia5Sh3r0C1ZmZiohNxc=; b=kuh3oeguXEmVIXckcp0IU6ZXV
 t54UUnpl2YeBIk8QY7RKBtrVAQeadjWHtYOBwnA1p6GjCMfRJYpYdEWLSXlo0ZvpDHoshOpsJov9V
 NXIC6f0dncpLw8gC2+DCjX5SHQkv6oYEx30rxxlrMp1HHdB3oShR9Cx5TRJgyeNgWa1/Q=;
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
Content-Type: multipart/mixed; boundary="===============1411532796=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============1411532796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+rbkueAQrkWPpfRR"
Content-Disposition: inline


--+rbkueAQrkWPpfRR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2019 at 01:51:15PM -0700, Nick Desaulniers wrote:

> + Mark
> I think this was a result of the resolved merge conflict.  See the
> -next only commit titled:
>     Merge remote-tracking branch 'drm/drm-next'

Yes, the DRM and the Kbuild people really need to coordinate with each
other here I fear, it's pretty bad that stuff like this has to be done
in a merge at all :/ The fact that make doesn't detect a missing endif
is also concerning.

--+rbkueAQrkWPpfRR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2ACLIACgkQJNaLcl1U
h9Az2wf+LDHHfHh7Ip1d37rtRGjZdyhiXy2pgzFsJ7KTWdYq0CsGcHVYMvbuA9CR
Z7XpJHByHefIJTtgy137DurDBW08BMEwBA7PCKhferYu2DWps+kuu6CXeuwIhp93
3+ZrMLXcI82jmbpQEVmxwFOhcNj4Dd0koRG1djzke7E05BvQ31BFQR2iLQMDuyAB
tcJSzTmKmej3h+QZUV1nzpRCNbfkAbh/GK+VtFTCU37uYDpmDThglVc7DN8GLb0Z
IvO/l4LDZyC7KPt+6Zx+t7RWPEngPhtVdYMlPVZopOG8s0PLbzEsl1r7nT+uamxA
4KlVxriZBQzWHMH5S6EKkLzP7ZpXfQ==
=8ps+
-----END PGP SIGNATURE-----

--+rbkueAQrkWPpfRR--

--===============1411532796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1411532796==--
