Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7noHM14jKWpjRQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 10:42:06 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C70667510
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jun 2026 10:42:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=ckboBTg9;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EBE10E805;
	Wed, 10 Jun 2026 08:42:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34BF10E338;
 Tue,  9 Jun 2026 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1781013220;
 bh=L98cR/ByoGK9e175bYrq4L47hW2opnbC3z5psUrV550=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ckboBTg9fcyqrbuG3aksVjfwbRoKQ/Dj5BOYDQ4Wat1Tz2/VcmfxWTHNhmmqH/lNJ
 GmGV0GLMIK1qPDXWpTLMCZ07zVnu0En263ZErGJG7Bpub6yUZ6kUmfCWOUD2ket3UG
 6S/qoua/fT9gIMEJy95G9pSfZZaVwtzPXEPDQPw/6Wzsi9p6dBv9mI51vjsQWRxXGy
 JoKcLsYLphbtXFX2OpU5uT2qIz9hyHR1NCDFmV1NbBBrKk8AWSZhV8GOP+8hvH5z1v
 c91vc+ZQiZ27nPPU79OKWN5BEEukqGfUIVIKjuy3yzBx8A27h3ebIwzR5KL3eK8kdk
 tH4KOWBXhoMrQ==
Received: from fluorite (unknown [100.64.0.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F93F17E0433;
 Tue,  9 Jun 2026 15:53:39 +0200 (CEST)
Date: Tue, 9 Jun 2026 16:53:06 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Ville =?UTF-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Stone <daniels@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com, Derek Foreman
 <derek.foreman@collabora.com>, Marius Vlad <marius.vlad@collabora.com>
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
Message-ID: <20260609165306.67332621@fluorite>
In-Reply-To: <7ad74724-9233-44ed-9b54-4c88a6a4f255@mailbox.org>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <8676926.T7Z3S40VBb@workhorse>
 <eff61423-a854-44c1-8634-30e2bd61e005@mailbox.org>
 <4265353.aeNJFYEL58@workhorse>
 <254c20a4-cce3-4c8e-9902-514586f3e694@mailbox.org>
 <20260326155305.736b4e64@fluorite>
 <47325395-3790-4cb4-8efd-84a3d8ddb80c@mailbox.org>
 <20260331153805.376486e2@fluorite>
 <d9abba15-382d-4bc1-a58a-71bb8413eeac@mailbox.org>
 <20260331172105.271c677c@fluorite>
 <7ad74724-9233-44ed-9b54-4c88a6a4f255@mailbox.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QAc_Qv+y6AjbFFs+expgZaA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Mailman-Approved-At: Wed, 10 Jun 2026 08:41:55 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:from_mime,mailbox.org:email,fluorite:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55C70667510

--Sig_/QAc_Qv+y6AjbFFs+expgZaA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 1 Apr 2026 09:46:08 +0200
Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:

> On 3/31/26 16:21, Pekka Paalanen wrote:
> > On Tue, 31 Mar 2026 14:56:22 +0200
> > Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote: =20
> >> On 3/31/26 14:38, Pekka Paalanen wrote: =20
> >>> On Tue, 31 Mar 2026 10:01:59 +0200
> >>> Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:   =20
> >>>> On 3/26/26 14:53, Pekka Paalanen wrote:   =20
> >>>>> On Tue, 24 Mar 2026 17:44:21 +0100
> >>>>> Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
> >>>>>      =20
> >>>>>> * There's no clear use case.
> >>>>>>
> >>>>>> This is generally a requirement for new KMS UAPI.
> >>>>>>
> >>>>>> The practical usefulness of the corresponding weston MR is dubious
> >>>>>> per the concern above.     =20
> >>>>>
> >>>>> I think the example of RGB 10 bpc to be degraded to YCbCr 10 bpc
> >>>>> rather than RGB 8 bpc is an excellent use case.     =20
> >>>>
> >>>> This series and the corresponding Weston MR aren't enough to address
> >>>> that use case though, are they? All they achieve is logging a
> >>>> potentially misleading warning.
> >>>>
> >>>> It might make sense to combine this series and the Weston MR with
> >>>> whatever else is needed for that use case.   =20
> >>>
> >>> What do you believe is missing?   =20
> >>
> >> For the stated use case, e.g. a mechanism to control RGB vs YCbCr? =20
> >=20
> > There is no need for that. Currently the driver chooses the color model
> > and depth on its own. We just want to make sure it's not too low. =20
>=20
> What can be done when it's too low though?

Notify the end user that their system is not performing up to their
parameters. They may need to consider changing hardware.


Thanks,
pq

> The only thing I can see is setting a higher "max bpc" value. If
> that's acceptable and helps though, why was the lower value set in
> the first place? (Otherwise the weston MR doesn't log the warning)
>=20
>=20
> I feel like I'm still missing a piece of the picture for the
> practical use.
>=20

--Sig_/QAc_Qv+y6AjbFFs+expgZaA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmooGsIACgkQI1/ltBGq
qqf5EQ/+LHtQAm7P+Dsc4MhTs4n0DBDmz7WmYgtQe22U7nQ4493kVDGqX8O+YFFn
DemxD/4lsXAVQPi8OEFAGtb/mdJbmJ6g+RV5tBqWtaCxU5LJ+ND8ZAhJnk4WPjOV
lAgPHZf8X0iavtWm4yVWvKOsSlNI/+AK+FTSQui7qKmv96ghVdIRZz+zR6/+JmD4
+0rYGSngrpDb63vUzuxXWBpAe8IsicYVghegcHIRbvlHyJ0rc9x/P2LxMKu4Zvbl
Rd8QUSW+qhzmzay0hsWkJ0bgFRNVGcmXW+KJoOg1381gqhi8I+BEAaKMAuY4kjMv
5PWBGX/4F73j2MQJzpmDnIDynumxC0jojOS5e7kAaC5tLuEkDgBgRInmgoY3TTVx
+sO5jVhQeQpkpqXYBZnR2zCYP5Ql/wiQH3B89dkylAQkV1OJVUoDRuKGUjrA2sI5
phB49sfmUNGX/6XVjAA+NUhD73t2LUtE3u577zFBLoGaoYwJbAAyewmpV3cl4zP9
llDH80zIVIQy9AUWYKXq0lgpXEdNNVLRK5uqTzh8juvbcA2cAFgeLNSl9D8H18Ud
Gi1QYLl8BJhWgHpUBWW1qNpgEQI6bk9Awq2gXmeoXNNeCnI3EhPOZXcIATJwuaXy
cwd/a2UFifd40zNkLfNiUvPUH/GZ8p2KQZr17taGjNsnaAquy40=
=NrJS
-----END PGP SIGNATURE-----

--Sig_/QAc_Qv+y6AjbFFs+expgZaA--
