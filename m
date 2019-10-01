Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BA4C37F6
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 16:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E786E819;
	Tue,  1 Oct 2019 14:45:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A248908B;
 Tue,  1 Oct 2019 14:30:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7F151AE3A;
 Tue,  1 Oct 2019 14:30:51 +0000 (UTC)
Date: Tue, 1 Oct 2019 16:30:47 +0200
From: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To: Kenny Ho <Kenny.Ho@amd.com>
Subject: Re: [PATCH RFC v4 11/16] drm, cgroup: Add per cgroup bw measure and
 control
Message-ID: <20191001143046.GA4311@blackbody.suse.cz>
References: <20190829060533.32315-1-Kenny.Ho@amd.com>
 <20190829060533.32315-12-Kenny.Ho@amd.com>
MIME-Version: 1.0
In-Reply-To: <20190829060533.32315-12-Kenny.Ho@amd.com>
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
Content-Type: multipart/mixed; boundary="===============0773210037=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


--===============0773210037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

On Thu, Aug 29, 2019 at 02:05:28AM -0400, Kenny Ho <Kenny.Ho@amd.com> wrote:
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1256,6 +1257,12 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
> [...]
> +		move_delay /= 2000; /* check every half period in ms*/
> [...]
> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> [...]
> @@ -382,6 +548,25 @@ static ssize_t drmcg_limit_write(struct kernfs_open_file *of, char *buf,
> [...]
> +			if (rc || val < 2000) {
This just caught my eye and it may be simply caused by RFC-ness of the
series but I'd suggest turning this into a constant with descriptive
name.

My 2 cents,
Michal

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEEoQaUCWq8F2Id1tNia1+riC5qSgFAl2TYxYACgkQia1+riC5
qSiZeg//bj2A/ClcMhpwuE0J8gvyfDQynY9eDJlRse6YteLmIg1WwJdh0j8IJDJX
BC0/pMubCU/sbHw5rscCCgQ9ecft1517aCah6uOvJo3LeLS0LrYDRuu++3T60MLQ
DTLJxuMHyAjJSdthOfeRxoHupvHh7/XxfcZxJ20PPu/G3v5f0vvIrfj8eADD19J/
jRyqyF14ytWvYkfnofwIuX9EuKesjGFMPTp6kpDq24PqzNwZma68/456oReb1TRF
t6u3vBFOdieLwhjt0FYY9ZL/6DlHnYou9nElamjm1igLOLCVp0dvIHDLrWYO2WY3
uJg5jq1Dgs0kGNZVY9L5JdB/K+hoVuhN975CiNqF9zz8h9HRNmeSeQwPi+0MgSJj
m430HsChdstWsCh28n1LOnIprYdR+oGngXyJrnWaevjvxUMQS0Ia+6qkbxmtq3tG
0M8PeanLOnbV+9oELF7fxfN1L4FDGDdQ7kT5cTX2ZCMHQU5fZSGcpNr8s9yysRT4
McBDchQJ/3O9E+8yDNt70v3OssutbhHNOal9RP1Y31p4zDxxS2bt3mRIZwqfBH2A
30oui6xyYsatphBiRfonOXaQYDsyrki3phwGogCchm3EbjeW3/TWgxOWlipAtefr
GsMF0wZubmtd3966lx/fnR2j9yEnTQ+jjUiuIdlGXwsXHneSztU=
=Yn1L
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

--===============0773210037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0773210037==--
