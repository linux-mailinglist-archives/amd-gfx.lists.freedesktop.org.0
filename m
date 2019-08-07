Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A884D8E
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 15:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2853A6E02D;
	Wed,  7 Aug 2019 13:38:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 2351 seconds by postgrey-1.36 at gabe;
 Wed, 07 Aug 2019 13:38:47 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703926E02D
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 13:38:47 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvLXN-0007bN-UR; Wed, 07 Aug 2019 12:59:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C26F62742B9E; Wed,  7 Aug 2019 13:59:28 +0100 (BST)
Date: Wed, 7 Aug 2019 13:59:28 +0100
From: Mark Brown <broonie@kernel.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
Message-ID: <20190807125928.GC4048@sirena.co.uk>
References: <20190807025640.682-1-tao.zhou1@amd.com>
 <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com>
 <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
MIME-Version: 1.0
In-Reply-To: <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com>
X-Cookie: Dammit Jim, I'm an actor, not a doctor.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wO5NtNRERzh7xvd86GGhasPsQj248MwA/stZlw0W4Os=; b=vJN9o7BxNRkQwIDbfeMY0hbqy
 vVzB4U/6FhTa42TmrzQQY139F64O//tfg+2zHj6zXrjvVKB4yErcho/floCwzxvcwJyOiql1+VUwj
 IED1CT1OVj4jbuBuEd45j3dEckaHzKTiDsn77LDNEtLdsXfLXApvu+dkZRiua6nkcj7gE=;
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
Cc: "kernel-build-reports@lists.linaro.org"
 <kernel-build-reports@lists.linaro.org>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0866333107=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============0866333107==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 07, 2019 at 10:55:01AM +0000, Koenig, Christian wrote:
> Am 07.08.19 um 12:41 schrieb Christoph Hellwig:

> > writeq/readq are provided whenever the CPU actually supports 64-bit
> > atomic loads and stores.

> Is there a config option which we can make the driver depend on?

64BIT should do the trick.

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Kyy8ACgkQJNaLcl1U
h9CSUAf/bUrGApOJ4TloFKZSBONMJdqKqen4pcxRQYHBdRMyb9jNWyeJTqP+Wj0g
aQ7WrZb9af6U1NxFXjpCokpLd5UjEslDiLT2PCo2BR2TMgxFqLE9QTw+HdMNMoPX
lxWI6uQYnj6xQu3tmPJ870gFcKKjFkCE7Q2NH1FNjSRxg9ApAAb333sFf2viaBEo
1YgDTlRCGBxejDRhW0fR8GwJUU/CSF77zV2HFGJtBGhhBfeZ72mp8gmfOtX0AUaj
cPWaZOHrOhZN89rRC65g1NagTRK6kB5Sr+rhBcQj/b2R5Rmynj414ZjO0l2ENmlq
MfX/UcsY6twsldvz7Sng1BUk9WsUxg==
=TBn7
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--

--===============0866333107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0866333107==--
