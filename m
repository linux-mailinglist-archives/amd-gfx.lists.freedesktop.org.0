Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C7487DBC
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jan 2022 21:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3615010E32C;
	Fri,  7 Jan 2022 20:28:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9152810E32C
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jan 2022 20:28:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 062D961F91;
 Fri,  7 Jan 2022 20:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE8CC36AE9;
 Fri,  7 Jan 2022 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641587321;
 bh=5hs9o7Y0/M10LfMom2sJh2iZ2CcjB8bH8iHJC8sTRXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tpLw1LhR+ui1ai6iQG2W0IRYaQRXF8uI6AdQcklRVO7iMNrJZEK1ifzdfp8bWGT7e
 D8DiOJACdjKX1wF+BHUq8fdmNWrhq+vOYhnR/Nzmf7mBId9DH3cVlefZgnFMJdYBD5
 sVnIyOTtgOGY//alD+miTo17a3BFEBoWALH2nkgQGWvQ5zfOodpVemmm6G8UTjFDEz
 zMkQhiF6Cn03MstIUo+mIHljRUqnHfNqRTqLLxsyg1RxE6qmyzzKIp2tQUvLSFQ6c7
 wpyP2YbzKgar2p+QYWEttzgzODW4s7x+2z+Sy4tTC5nteK3ciELmILAcLY5CUm7ubh
 ZoKcMqpYiPM6w==
Date: Fri, 7 Jan 2022 21:28:38 +0100
From: Wolfram Sang <wsa@kernel.org>
To: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] Revert "i2c: core: support bus regulator controlling in
 adapter"
Message-ID: <YdiidodK03y0oCMD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
 Konstantin Kharlamov <hi-angel@yandex.ru>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220106122452.18719-1-wsa@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NInPz8sSrNptA7q8"
Content-Disposition: inline
In-Reply-To: <20220106122452.18719-1-wsa@kernel.org>
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
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Konstantin Kharlamov <hi-angel@yandex.ru>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--NInPz8sSrNptA7q8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 06, 2022 at 01:24:52PM +0100, Wolfram Sang wrote:
> This largely reverts commit 5a7b95fb993ec399c8a685552aa6a8fc995c40bd. It
> breaks suspend with AMD GPUs, and we couldn't incrementally fix it. So,
> let's remove the code and go back to the drawing board. We keep the
> header extension to not break drivers already populating the regulator.
> We expect to re-add the code handling it soon.
>=20
> Reported-by: "Tareque Md.Hanif" <tarequemd.hanif@yahoo.com>
> Link: https://lore.kernel.org/r/1295184560.182511.1639075777725@mail.yaho=
o.com
> Reported-by: Konstantin Kharlamov <hi-angel@yandex.ru>
> Link: https://lore.kernel.org/r/7143a7147978f4104171072d9f5225d2ce355ec1.=
camel@yandex.ru
> BugLink: https://gitlab.freedesktop.org/drm/amd/-/issues/1850
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Applied to for-current, thanks!


--NInPz8sSrNptA7q8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHYonYACgkQFA3kzBSg
KbaESw//Yifh5V0HIYEvxarVwyg8B4g4TvQBSBVlzchPdF8g8BKRmnpCCsqc62Ks
JqQWIFN8KAWt7LV8LtM3d3KRuLkkwrhrAHdr8RygtkDOJJeyjbtvcarXPUe8QYM0
gAZPXNlAObjretxgeTtJrHIWUkCVcAA6YdxMDj1XMQYjfa15lQTem/nHJr53ngo2
DM1HY5N390WZAzmd0EiUmkVJBuLe7oOBh2qnBwa8uYGhqpisQRXmSBQS5OtWs2a+
bA5IT/cusIDSG2G2SfIheFFsKYmar1RtSXf2W49Y/EPl8IdaGRGjFFcNtMWZgRVv
wrpNIu5O1uhawJ5Kb9fuc7noQt4VKxHYFc+KjAF6oUJrWatHyJpi4263yL9KR3J2
bul/r+aKDxd9eX3sqoHwHtjE4jlEsLC+9LKBCqgwXBxthuf3pT/KY9+92U/WyNN+
SSRtme95cwPkqge5/4v9pq8ZbWvZhU5XNf7a7BeYdushtqSEmxe6bcLl4Z6iOq0C
3bvq6e5+CspHHCMObX8jvis6uKxCQue5cLq4e7M0tG+GEJDrVPVL6GEr4tGM6QEp
bZQDmKSvD91bfW6EKymJY5UnOZ0VUOEHYce8/H3NpTRV9jDzS8rjqmWF1xV3yLBu
vM5zjuhNhQ5YLW6jvxz5iB51ebI7+RSRKzOGxyciAH7i3v/4GtU=
=gvGl
-----END PGP SIGNATURE-----

--NInPz8sSrNptA7q8--
