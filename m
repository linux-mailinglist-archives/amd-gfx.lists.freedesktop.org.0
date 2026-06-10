Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fYe2A7qSKmrSsgMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:49:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004D671014
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jun 2026 12:49:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=FVRd6WQp;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=none
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FAB10EE54;
	Thu, 11 Jun 2026 10:49:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEFA10EADD
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 16:55:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso69006215e9.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jun 2026 09:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre.com; s=google; t=1781110510; x=1781715310;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Hk3r5GhcXgLdVr2P38hzuKv670yr4eRz8wtw8OMK83s=;
 b=FVRd6WQp5hfYpXbyjHSMuiA9fIie0v4NH1qQMkAmLWZEUPf4Am9zsG45R55LRooPG7
 vvuZliUWSHUF24PTnRVyrBSCwSVcRk9lE23iYXbcIpcdSsrytxzXx2+8zD+4ZjTE7V0B
 DmRGCKxCq5IkLIoBCf5p3ctZMF9S4aywEa4cwXK53bIAyYMl/wca26tu41nH1dSb5l+U
 c8GFLjBXkVkr8kP4g7b5v8QoxRGfnOnhKTdTahOkszhL/OcbsHJy4BG0CgjPFfViGeH5
 vXUuZuENrjIaSosHfWmqKBt41tC699gz9ROXBU4olt3LzaAUbG0XgQOrfMkWGsWI906h
 YV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781110510; x=1781715310;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hk3r5GhcXgLdVr2P38hzuKv670yr4eRz8wtw8OMK83s=;
 b=bUJfkp0FiShiz2xyKx/d/olYAVzB/LpMXRCnMrMHTiUQkoGN01MSot01j6nv4Go4KJ
 shJSZ0oc4qE9wLm+y6kluCRCgV8EItRjiHkff99oSaD06FOuEz4vz/f4oib2DvgTM53v
 +cqrvmq5uAjfeBOKX9dmTDOT7Xx8ZU9CGJmSu1wS5IxE3M5B/8Oos0acHYDprFXv5D9a
 sslT5EIylw7u7CValQr45FF6RK9SiJ4tGSTEgt9XGKa70MyJwItOSpd6VL8eKD8Z+jyP
 2BEe7xX9xoOeJaB09ihW/f8ln+LkMBBerUXkGRaKM1xyR+ZZAyFEfjsyPTGPsU2BAH+H
 HVJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kOB3G6eFraraQdmkWhwjRYYwlOFPrRN1ovTPfn4vqsj3fE03lAQ61gfG5DaAyAkXqlLe75jq6@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx69gQ+wbpHEIJ9CAmQ3rQyefflJtZEGSrxt4uWuwagIPdUXYCx
 ymd3WqEUQs5sV8J28F/Zr2/1boe/eQiL6O4E7h0nj5medIiRW/x9+OjjEta+46fqFNY=
X-Gm-Gg: Acq92OGqkSeLOpzj92kjZccQI+0y4Hf6VMRDeUi4MGrxt66mG1ZzDm29LLSEaF7o2Ia
 Qt9kf+LWWcsreRtj17lE2be82iAHe2wn4PWXKObm7zm/uYZL4HbrTF6AA1YlPzsmisljm0ze5w0
 5kv6wsvB40T4+ZyN43p5OfJaQ4ZonYN1S4AZOeL+BSGkRiugfR1WWjnKM3Lk3sibssjMgvvxYLT
 T9ejLuvcw+OKdpnWqxlQuX0vXc3rLdq6B4/xXT4oAkONyKr4h6ISDMx2A45o7W+fo0/T84QoXjQ
 Rj8LyDcQGwghvBsIiyHrRA93YNrAaVBCEmgCPt5ODhgTlkozuAnth9UBt8KJG22hfwBXZiahP/c
 /ldgGxCn+OVST0Ba9CPyUuZNy6RPoMq6w+JoIiQKmwlIi4J3BPKi6CaaL9RXNN3RBwGJg7g/5+t
 DrVODHDuBgJFNEKDyxtEELRUoZFHZS7gxrWZlsNzP17+1wqUrMhP9YnE4JjGt2pJ1IkiavfK3Yn
 hW2k7WsKEwaLdBTgpafQZroJ+LvOsKwbJ8F
X-Received: by 2002:a05:600c:4e0b:b0:490:9bc2:bf8b with SMTP id
 5b1f17b1804b1-490d71ed39fmr101101355e9.5.1781110509773; 
 Wed, 10 Jun 2026 09:55:09 -0700 (PDT)
Received: from localhost
 (p200300f65f47db046aec8c3a4b621e71.dip0.t-ipconnect.de.
 [2003:f6:5f47:db04:6aec:8c3a:4b62:1e71])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-490e284bae4sm2171525e9.5.2026.06.10.09.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 09:55:08 -0700 (PDT)
Date: Wed, 10 Jun 2026 18:55:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Consistently define pci_device_ids using
 named initializers
Message-ID: <aimWvtBTQvd7O2F0@monoceros>
References: <20260429171644.8406-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r2bfywcea7kmegy3"
Content-Disposition: inline
In-Reply-To: <20260429171644.8406-2-u.kleine-koenig@baylibre.com>
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
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:msp@baylibre.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,monoceros:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9004D671014


--r2bfywcea7kmegy3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/amdgpu: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

Hello,

On Wed, Apr 29, 2026 at 07:16:44PM +0200, Uwe Kleine-K=F6nig (The Capable H=
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

Gentil ping! I'd like to work on changing pci_device_id, but that
requires that this patch hits mainline first ...

Thanks for considering it
Uwe

--r2bfywcea7kmegy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoplucACgkQj4D7WH0S
/k5G4gf+K+Bth6+S4Oo8ga07nkWVOMnNU7IxWEU6lQBaBaSjdUxnVgxDI0k6c6Ts
sS/tzHaBkdPt7ob/NfWvaHFQ0MlMaJ7BmAOXj+dXkAwY8UOBE4ezbPZT8F79tMw/
ptRDfKanfdEGc46Ky4+KXZmmbncZMtetsrY7yk9qhNdNySXchxEJhkW7kzLMSC5A
f0vYuIBYnrNWo3gyUFQqU/hdSy9tyujE+dceY06cFfbo6qagWgi87hBQOLWlwY1D
vpk6x9qdvXGus6l4x0TrJ9UBafO/KSnEdqH8SQRmFWntE8V/spEmtsGH/E9JXIZq
EX6CXFepKvu5BNJAHETHktgKqmxeCA==
=VWoE
-----END PGP SIGNATURE-----

--r2bfywcea7kmegy3--
