Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038AA3059B5
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Jan 2021 12:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457D96E5B4;
	Wed, 27 Jan 2021 11:29:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB376E5B4
 for <amd-gfx@lists.freedesktop.org>; Wed, 27 Jan 2021 11:29:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2EE32076E;
 Wed, 27 Jan 2021 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611746980;
 bh=MeXh87PhrXGbxuFNLGsx1zwPAc25m19iwuT8SQtjfxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mN3AANCpN24xFffemzewOHV6grTdbxxS9mB86vkxuBnaH3UP65G7fhJ4XbU6mlVuE
 bOiBn8AfBKsWcqHfnUgWPLEAy33uVN10uS5fxR406SbIoPD4l268dDhS1W4Vxl9ezo
 x4y55qp7EzLbFu321LifyESl+IQmsbmjvi2F3gTdPIiLWNZhEtRkdbub/V9Zo/3vO5
 amAQlDSJT2ZV8QlvHhU2KUn5QsFEpcfSYWtWqntRrXXnT2HdrN2pIHjQUXjdBvLpx5
 1JHhFLbfXqlhonfYw2i2gWc5UclrLPTcG5HvjMB8+FAlq2V/GQAECRgaSoZioVa5hO
 BTi4jsm5haKKw==
Date: Wed, 27 Jan 2021 11:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] ACPI: Test for ACPI_SUCCESS rather than !ACPI_FAILURE
Message-ID: <20210127112857.GA4387@sirena.org.uk>
References: <20210126202317.2914080-1-helgaas@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210126202317.2914080-1-helgaas@kernel.org>
X-Cookie: La-dee-dee, la-dee-dah.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-hwmon@vger.kernel.org, alsa-devel@alsa-project.org,
 Jean Delvare <jdelvare@suse.com>, acpi4asus-user@lists.sourceforge.net,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Takashi Iwai <tiwai@suse.com>,
 amd-gfx@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-acpi@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-spi@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Guenter Roeck <linux@roeck-us.net>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1119812295=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============1119812295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 26, 2021 at 02:23:17PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
>=20
> The double negative makes it hard to read "if (!ACPI_FAILURE(status))".
> Replace it with "if (ACPI_SUCCESS(status))".

Acked-by: Mark Brown <broonie@kernel.org>

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmARTngACgkQJNaLcl1U
h9C2dwf9GE0PHhDzOzGae10MRkXBNzBdmeTf035YAM12jQ6o9G9kDK3xBSA64Jcy
rr3+mkHvYkCEBEdAzV25MDRg2iXAoLBYJdmfMHXt/u9D0aJf80gMEXgrUDE6yjQo
AJvXTJrJqu+KS2RMpnxIHfO1rXRZrQMIAln9GbePtqKjGUN5cx6QJKUDYyrMlevp
9KZr/ClGQmLOYJ7suU9mr1NFgEgf6XnsU7Gq6BGuyo10GO62Qg3bztHtkiiRxz/x
zvr9PngfutrIGT7qfvKBSmWk2y50qe5XDeJRD8e6YbFS/Ge5LnOwmNc24jjts04w
OE5TwTVKRHFfy39WTQ3IdmJaznDhqg==
=b7Y/
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

--===============1119812295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1119812295==--
