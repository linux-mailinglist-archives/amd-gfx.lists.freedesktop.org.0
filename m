Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI5rBuxhzWmkcwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:20:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787337F34F
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 20:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAA910EEC3;
	Wed,  1 Apr 2026 18:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aplhyfcm";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CCD10E930;
 Tue, 31 Mar 2026 14:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1774966872;
 bh=OO0JwcCUiS3UR9pJuF192l1RC77KKD/ZQzYRRxlo/BE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aplhyfcmg79TkNuD3B7tUbZFjP+vy8GejuMYKlR/sFWND+Bxheb9gxyCvzHe/Y5N4
 VUphjbnmgnSdek1BQjlGhbPVqE8n4O2/fmZyU0cs0chsJLqf11NCVZ0wEhq2/6otNh
 78DAikFzWFAw4CYknq78awfLAywj/Mmi8XHuqSkqkIC2SidB0b1fwguYKJlrmmDrP6
 S2yt3dOFY5Fxfg4FtJdMqHNoqMkHl1Xv9t7tn17e6UMuP46Y9FuqDrhBCLElKFaVZk
 BuRKnVJGxO+6akGvp/ak9L3IGayx65VkQL3Y3sG0iN4gDGFhDmQ9+xt3HScDeuQ8HE
 N4SxThg9gz/gA==
Received: from fluorite (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 94EFB17E6540;
 Tue, 31 Mar 2026 16:21:11 +0200 (CEST)
Date: Tue, 31 Mar 2026 17:21:05 +0300
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
Message-ID: <20260331172105.271c677c@fluorite>
In-Reply-To: <d9abba15-382d-4bc1-a58a-71bb8413eeac@mailbox.org>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <8676926.T7Z3S40VBb@workhorse>
 <eff61423-a854-44c1-8634-30e2bd61e005@mailbox.org>
 <4265353.aeNJFYEL58@workhorse>
 <254c20a4-cce3-4c8e-9902-514586f3e694@mailbox.org>
 <20260326155305.736b4e64@fluorite>
 <47325395-3790-4cb4-8efd-84a3d8ddb80c@mailbox.org>
 <20260331153805.376486e2@fluorite>
 <d9abba15-382d-4bc1-a58a-71bb8413eeac@mailbox.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j70xz/84l6YZrhzWG6fMJE.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Mailman-Approved-At: Wed, 01 Apr 2026 18:19:20 +0000
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
X-Spamd-Result: default: False [-1.81 / 15.00];
	SIGNED_PGP(-2.00)[];
	DATE_IN_PAST(1.00)[27];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mailbox.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:dkim]
X-Rspamd-Queue-Id: 8787337F34F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--Sig_/j70xz/84l6YZrhzWG6fMJE.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Mar 2026 14:56:22 +0200
Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:

> On 3/31/26 14:38, Pekka Paalanen wrote:
> > On Tue, 31 Mar 2026 10:01:59 +0200
> > Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote: =20
> >> On 3/26/26 14:53, Pekka Paalanen wrote: =20
> >>> On Tue, 24 Mar 2026 17:44:21 +0100
> >>> Michel D=C3=A4nzer <michel.daenzer@mailbox.org> wrote:
> >>>    =20
> >>>> * There's no clear use case.
> >>>>
> >>>> This is generally a requirement for new KMS UAPI.
> >>>>
> >>>> The practical usefulness of the corresponding weston MR is dubious
> >>>> per the concern above.   =20
> >>>
> >>> I think the example of RGB 10 bpc to be degraded to YCbCr 10 bpc
> >>> rather than RGB 8 bpc is an excellent use case.   =20
> >>
> >> This series and the corresponding Weston MR aren't enough to address
> >> that use case though, are they? All they achieve is logging a
> >> potentially misleading warning.
> >>
> >> It might make sense to combine this series and the Weston MR with
> >> whatever else is needed for that use case. =20
> >=20
> > What do you believe is missing? =20
>=20
> For the stated use case, e.g. a mechanism to control RGB vs YCbCr?

There is no need for that. Currently the driver chooses the color model
and depth on its own. We just want to make sure it's not too low.

This will remain useful when userspace can explicitly control more
things. I think all stream parameters should have an "auto" value and a
feedback property, plus a property to explicitly set something. That
allows userspace to light up anything any way possible, but also to try
and make decisions about what it exactly wants.

A consistent naming scheme for stream for setter vs. feedback
properties would be nice, though I'm not sure if that boat already
sailed.

> > Informing the user that the display quality may not be as expected
> > is the point. =20
>=20
> The warning implies that the "link bpc" value is expected to match
> the "max bpc" value, which generally isn't the case.

Yes, that's why I wrote
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850#note_31=
15686

> >>> I had another use case in
> >>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1850#n=
ote_3115686   =20
> >>
> >> That would need to take dithering into account as well? =20
> >=20
> > Yes, dithering could be an adverse effect or not sufficient. Hence the
> > 'link bpc' property should not consider any kind of dithering, to be on
> > the safe side. I fully expect dithering to become explicitly
> > controllable, as policy belongs in userspace. =20
>=20
> I agree that would be ideal, alas it's not current reality.

One step at a time, eyes on the prize.


Thanks,
pq


--Sig_/j70xz/84l6YZrhzWG6fMJE.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmnL2FEACgkQI1/ltBGq
qqfocQ//cuAt2ITxSCTz5+m5h3FpScNgEInfAbH9EMaiu59694RV5GQve5SN7D7C
XrkyMDnA1aOsHVsMijXtIFU0zuk+6ixzXKqyA3AcSQfsjsr81kFO4thBCPd/NJBm
FO5ZMzT1BXtR31gebWcCjghg5rI2JLvHNuG2/HSSb4g0bdXfhUmrkpiRxCfWXa/w
Z8pvpniNREcdH6CYvEFurRXuRPrHJOH5RCDOwUZP5ISA3//BHAsKKdQnujziY32j
KgeR+ACsYwTNUuDxZ2/Qz4y0nit/xoC4xd5sDpGeWBCNo4nCyMZosYsL3rsIUKAQ
XXtk/H9tS03E+r6EDIRFCvbNpLQNSATeFhuztdSKum2b/wQcYZF9ilvTN8DeOBb/
wGk0Wew42OqbqGZypS5uK6l0LjKb8OfCZRJnK23kob46U1jGJT3x4WmuCVRbfTpy
TPAdYkNsewxUmg3jf9by2Frgx3ZAyMJez6po3AkT9Z/snCF/wm9Ju+kYuxzJJ7F9
qQfqeJ14Ns4NjUDnnnQOyqEyEdmmc6mur1hN3Na1s5wYStKw9iR/SI549sOZcziW
K07FSOhx/4MIb4mdXKMxhbuVpLnHV+cO3/H7pj6UCyC7F59JZ9T5AeqGKec0I59q
cRSZIapZQwqxBXOcRBUxnEI3WrTBSKlMNuf5bhEsIaQYzPFbvUU=
=GW/Y
-----END PGP SIGNATURE-----

--Sig_/j70xz/84l6YZrhzWG6fMJE.--
