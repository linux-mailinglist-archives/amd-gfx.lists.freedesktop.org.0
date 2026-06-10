Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id paL1J8aSKmr5sgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:49:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6FE671030
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:49:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=KrXridSX;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B799C10EE65;
	Thu, 11 Jun 2026 10:49:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9324A10EAEE
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 16:56:36 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so89397835e9.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781110595; x=1781715395;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wDGhghAvzNX5ObVecH4+CcJJHr84yhCjxW5gZJDsxQE=;
 b=KrXridSXfJoljgVGQlq8IDJyecmzrvhRW5ckeV1i7gdBDuEnIYoRDskCEuexqfi+es
 Cs1OwBf1wtrNnHJSw91+swyDswzVftq5X4nr+QOJMF6j/c+ugjqYrlvefotLjtceWmiE
 rz4rGirplyA//oDHz4h7jSnWre0VKEgbmfZUDovQWhWOVvkiaqLUbG7Aq4629wanIg/3
 76GWi1IIngIbXYz+bzvu2ZSAf4TgjcpxVcjwdAs8+K/rskBtsBjOjnMSiZ/kzyg/pe44
 R5aA0pS3uYc/UP0eBlQLb41IFENAQF/S7rpHOEC4IUqO0WBXimVNIWPmmci7oSgnt3Rt
 HEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781110595; x=1781715395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wDGhghAvzNX5ObVecH4+CcJJHr84yhCjxW5gZJDsxQE=;
 b=sGv6HGaUPmUNAGqcVjDNQqYK+QpVz5wanC+U8kSHLHwtTiwB4ZGutnXwfkn4e2C++l
 roDKxZhXHweWQ5XR06j6sFe+J9D3z/HxPxt5vfPOab4IiYEE4H2w+mcCBDGFP3WhAkrp
 jmnY5CIk2HbSQsoQmmpa4vG0wsCtlgZRl7rRDo6vJSBavL403Yf7lNIkIfRRQwHQPPto
 j4lVgQLmWix8zmaK2JPhl9RXTt6W+52Ehqf1k6kndAnnnJe3iI8QMDPORSRpBP0NyqlR
 Q1VfgVjcEivPdZkm4VdLQeufEBcwlmL5hJ63+3ZBMjq90QWKyP6SeB9C5FVOyyeqKtaL
 PK5A==
X-Gm-Message-State: AOJu0YwLAZbiZey/ABj8Kx0rfTw3piB2RqEhcXjFMKDNvkBU1GRIhq3T
 nQcUC1qRDqf3ESL6wSuk/cb/cn3P+XSXu1aUL1UawSUxDRR8NJhlS6PgS2EHewsJq1s=
X-Gm-Gg: Acq92OFlckYyXzGGCzjjTxjMsOWAR5DMvs3lgnCd908XvnbVXuaS0rthptZq7WpgUHU
 peihETzOEf+eUszwiycLhOkJL2QnzZXVvwgccroDq+OT5zz9Bq788UKRQByQnIjX5ppgmtz+kRS
 qgn5LMSxS8lihe7MBtBVIaMP+xLxwDS3TsEubRC/w+AXO9ygNg6tSdwSYP1jrKYw8BAln0yjQCX
 KM4FhClcizZUE8+sG6z4PxnWq1aXJeI6Pr7j0wMDEIGBtdnuRukH8f9B5LZekWghFbdNgZwds1Z
 +iw3mYKz6IPempKCbIheIc1NjgA7J3+TaPNQdgUYQlUHD+E3E0FBkqiwrgtgZlwh/gY2BSn1XgW
 UrFWSiKW1pwS54UHE5rUGJLUSr2WNlcvRHsZ/9scMPDhia4T19kZFK1ghwmzl2opFnGnQku859p
 ygL6RAl4DpRuNLn5tHQxQvyb/mSL2fhBzqtBII4cy4iFH7HRchWXE3fpbErIo+8JTGxNErz/Gqn
 YxkXwdjDed92UMbGQXkFl2VHA==
X-Received: by 2002:a05:600c:a00b:b0:490:b58b:a8cc with SMTP id
 5b1f17b1804b1-490c25d208bmr392108225e9.29.1781110595179; 
 Wed, 10 Jun 2026 09:56:35 -0700 (PDT)
Received: from localhost
 (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-490e2ac08d4sm1254095e9.1.2026.06.10.09.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 09:56:34 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:56:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH] drm/radeon: Consistently define pci_device_ids using
 named initializers
Message-ID: <aimXCmtgcejwInNg@monoceros>
References: <20260430102958.136859-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j7i4oay3bo3iievo"
Content-Disposition: inline
In-Reply-To: <20260430102958.136859-2-u.kleine-koenig@baylibre.com>
X-Mailman-Approved-At: Thu, 11 Jun 2026 10:49:23 +0000
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
X-Spamd-Result: default: False [-2.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:msp@baylibre.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,monoceros:mid,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E6FE671030


--j7i4oay3bo3iievo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/radeon: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

Hello,

On Thu, Apr 30, 2026 at 12:29:57PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> ... and PCI device helpers.
>=20
> The struct pci_device_id array of supported device was initialized
> by list expressions. This isn't easily readable if you're not into PCI.
>=20
> Use PCI_DEVICE* helper macros and named initializers which is more
> explicit and thus easier to parse. Also skip explicit assignments of 0
> (which the compiler then takes care of).
>=20
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre=
=2Ecom/)
> and that requires named initializers. But it's also a nice cleanup on
> its own.
>=20
> This change doesn't introduce changes to the compiled pci_device_id
> array. Tested on x86 and arm64.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Similar to the amdgpu driver patch I just pinged, this patch would also
be great if it made it in for 7.2-rc1. Please?

Best regards
Uwe

--j7i4oay3bo3iievo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoplzwACgkQj4D7WH0S
/k6nhwf/ZR7t94IMy/YBqi6Y8FtHqpdDkwZQQv11BcXWULYNcavX4/q4cA1Jtdd8
C4r3zAf5g//QeQP++hduZ4/5b0aQTz57FVJYbQNwN7Q1pYDIieIRdqk5iSL60/fa
LKFWkXWES4SULEBeCHUJf1o51p9se8eI8a7hCUJ7JeoHpJlb406H8ei21SNzauEy
7ttwNW25irCTEZSEDm8vpoQ5pxLLFC1S6eRdo0v4WpbDMYyjFhN0RJlg5MqQpEK/
VoWGUzqTrggL7AyozMqLAbg7PkPDJJMbNoLF97PPf8NRWrdBsGH/2nAUjxHJgZ9K
ol05cbNMBcNSQNGYdo82mJzhQKt6Dw==
=1EG2
-----END PGP SIGNATURE-----

--j7i4oay3bo3iievo--
