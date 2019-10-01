Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18792C37FB
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 16:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925FA6E81A;
	Tue,  1 Oct 2019 14:45:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995946E5EA;
 Tue,  1 Oct 2019 14:31:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 19501B03E;
 Tue,  1 Oct 2019 14:31:25 +0000 (UTC)
Date: Tue, 1 Oct 2019 16:31:06 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 02/16] cgroup: Introduce cgroup for drm subsystem
Message-ID: <20191001143106.GA4749@blackbody.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-3-Kenny.Ho@amd.com>
MIME-Version: 1.0
In-Reply-To: <20190829060533.32315-3-Kenny.Ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 01 Oct 2019 14:45:18 +0000
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
Cc: daniel@ffwll.ch, felix.kuehling@amd.com, jsparks@cray.com,
 amd-gfx@lists.freedesktop.org, lkaplan@cray.com, tj@kernel.org,
 y2kenny@gmail.com, dri-devel@lists.freedesktop.org, joseph.greathouse@amd.com,
 alexander.deucher@amd.com, cgroups@vger.kernel.org, christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============2072972227=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============2072972227==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Thu, Aug 29, 2019 at 02:05:19AM -0400, Kenny Ho <Kenny.Ho@amd.com> wrote:
> +struct cgroup_subsys drm_cgrp_subsys = {
> +	.css_alloc	= drmcg_css_alloc,
> +	.css_free	= drmcg_css_free,
> +	.early_init	= false,
> +	.legacy_cftypes	= files,
Do you really want to expose the DRM controller on v1 hierarchies (where
threads of one process can be in different cgroups, or children cgroups
compete with their parents)?

> +	.dfl_cftypes	= files,
> +};

Just asking,
Michal

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl2TYykACgkQia1+riC5
qSiNOhAAj+V8JbkviYhAkKfW2XIQz6L02LM+3vfiRHzZZJhcqdSs+4WB6xhmjKme
aG0SzH8NOiWzLpq+XPq4iW4G6v7QNjQcniUtb0kBiGvFfWpczCaFs9K0hyeUKCu0
2Xn/VIVvMqkPWDgirANCa/Dgsc5JMpsGY5A+E44aiPyqO/6UrQSDYXmvqu7132yx
L/4UtNJpH2SFnGJ7l0n1Gspe8W50WkKEscmLh3jlWcPFqUNY3JpdZ6rJ+LniGVck
xdEGSGbGnoZmfkg+lCLTnVU8p8fPUHh6Z8ZRoUey9d63+XCNvNqpWLfTp72kgIRr
48XrUaUKu49DO081Qehg4hLFb6uayHfoXMDHR/URLStF3AdPF3XZ/pStA3A0owp8
HztqK6hn/BfZuDSMZ5Vvtfqkqqjq68EmMdZ0TI4Ab/9dY5RMthv8ADVbKE58vC8K
KF4jbEKJFUGNWUpSVuX2BJOE9rTOk64MqSUmJs2KDKTZnwLeuOlHoUYUH1YLHxsj
6SEZZ6+3hiHMGQYAFz6bxSvzF/abDe/O9tW/MnOQT3VkxHBSWnMyC3j0KRlgUJ/j
HnWawWW4SPRkhykkzBxpp2Qs4YY29JqiExVfmFxQlt46MgnqH4V9DteH0H7EI0MY
eUvqey3L9y3hBv1B8Z9XjOix4HwxFpK4HZH8SrQArcyeThtNnuE=
=je6w
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

--===============2072972227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2072972227==--
