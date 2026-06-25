Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TVeyJkowPmrABAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0258A6CB276
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FS2ks8jw;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A75B10F4B2;
	Fri, 26 Jun 2026 07:54:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F4710E1B0
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 09:19:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b7866869so17854095e9.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1782379163; x=1782983963; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ECEn+V2NhWD3Cl+wFoaowjzh5mZpSqtDy2oOQW/aJbc=;
 b=FS2ks8jw2gnHlF0ksmkAV3+FuaABl+YUDnA6qcsTIELaroYsoYuJlUh8G3FsZvq5jJ
 dYAYawETVSwA4lYCORlXqHPZye7Jc8/B7vNxQGvnXG4pVpOjIfUdXQYZmQH3CmaL7nMC
 1ojQGh2ZcbKR3EnAsK01CV5jdsUtLS/dGcFdJZsAuol2bas+7x8fTMGo3Ao6A7Q5HUBF
 EyGiLZYdbdgRFcxi4i8E2CN6foNib5ZxLNmTBKUKpRpX4+5QDfkmkRxLpCGIgy5S4k83
 TO0clZXiqNE9gNdbgcFKxfZtokUqs5jEkL4PAZmdmImAVKWTmfym43L8I9tcuIuuEC73
 qquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782379163; x=1782983963;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECEn+V2NhWD3Cl+wFoaowjzh5mZpSqtDy2oOQW/aJbc=;
 b=addaKAMDlwtvujkjBOLHNdgUkYRhnFyaQfTEo2Uy13QtEnhIwQ7XbKkhxWOsxLpnwz
 8Tgp6+3APmHetzU2GkQhVGsfixv9Ug8YszF4KeiqH/dA6RkihSyZ++PmtmWb+oJsgd3m
 T9OapirvUbxm2MEfXDdLmgAYbXkKsX7mttGB5HotXt1ytcCbhbWIl3/bQ6tiJLFiIMej
 bymWPJD8iYYB/kLmH7GyqvTWefdjkbqA4e+sPgAvAuJy7n4NLPVg5DBS3QCsGm8bruzs
 +f8XZDnB+alGIs3cmeNbIB+LrvqnlwV0uSro6YXfDgBIucho4tZKylqjcqNvoDX0oo/J
 m5jw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/OBcdHpLgJrJEzR6cfSs+ejP395/spCH8GpGyHIbTgFSzkn/dUSd0zEZtBgsz9yzMFnNQ2utQg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuSkpVLCeQH6n5Zv0B7pA19H0a2eN3lnjkmiej2OE6bmboleXn
 ZLqOHNxhLj9V/Zt3TXur1GsU/caVDYZKYl0ZMg1viPv4jI876w61UNIV++SL/O/shPo=
X-Gm-Gg: AfdE7ckKyABWnYymoMI2ASamfiQqMB0prlkJ5796MFggK+RMZ7tHUYQl1ymZ9l/7M/B
 iIJCCS+fuK5mqYrfO+EBIoAxCM5RYcKLANImMtFdPOm4oWVN1H+Z+h6yIE/n9ikfO11H2CkzOg+
 wFOZpzq3ED4e66mICON0Amp9S09PhMa3v94KoTLp1Dd4Lqfiqhv8NnC+pDQJ/6CpEefLD7Und4L
 r3dkoYWLi1boy+TUSSX4kcCH23hnWt8FwxNbc/NDa8kq0VjaQVOQhnJGzKNws68tjbgu2bdXbkp
 JV2R8mNPUUgZo1TJhJppKJGQaBQwDb4kil5+fwSRVRIeXn0X1iT9UZnZm26f0fLAAjFWu3IRH5l
 B299cPquI9WyWomwBZJMTq2rxM4aUcFAtibeL7MBkaZ46i7XYohSnUVB5CWjvT9vRvC/lzezpd9
 rQBz4Ilbq8G3bXlOEOHw==
X-Received: by 2002:a05:600d:8443:10b0:490:d32b:39c3 with SMTP id
 5b1f17b1804b1-4926685feb6mr16924745e9.6.1782379163017; 
 Thu, 25 Jun 2026 02:19:23 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49264082426sm60418065e9.9.2026.06.25.02.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 02:19:22 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:19:19 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, 
 Natalie Vock <natalie.vock@gmx.de>, Johannes Weiner <hannes@cmpxchg.org>,
 cgroups@vger.kernel.org, 
 Huang Rui <ray.huang@amd.com>, Matthew Brost <matthew.brost@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/6] [PATCH v6 0/6] Add reclaim to the dmem cgroup
 controller
Message-ID: <ajzxLABtnWym81Dp@localhost.localdomain>
References: <20260611173301.17473-1-thomas.hellstrom@linux.intel.com>
 <ajBJU-Jp2QVy14qt@slm.duckdns.org>
 <ajBLAsNoKesXmFcs@slm.duckdns.org>
 <ajlUPmaMsa2gxOLg@quatroqueijos.cascardo.eti.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrl2vho5y5eomexp"
Content-Disposition: inline
In-Reply-To: <ajlUPmaMsa2gxOLg@quatroqueijos.cascardo.eti.br>
X-Mailman-Approved-At: Fri, 26 Jun 2026 07:54:04 +0000
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
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cascardo@igalia.com,m:tj@kernel.org,m:thomas.hellstrom@linux.intel.com,m:intel-xe@lists.freedesktop.org,m:natalie.vock@gmx.de,m:hannes@cmpxchg.org,m:cgroups@vger.kernel.org,m:ray.huang@amd.com,m:matthew.brost@intel.com,m:matthew.auld@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:airlied@gmail.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:rodrigo.vivi@intel.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mkoutny@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,lists.freedesktop.org,gmx.de,cmpxchg.org,vger.kernel.org,amd.com,intel.com,suse.de,ffwll.ch,gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mkoutny@suse.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,suse.com:dkim,suse.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0258A6CB276


--lrl2vho5y5eomexp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/6] [PATCH v6 0/6] Add reclaim to the dmem cgroup
 controller
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 12:26:54PM -0300, Thadeu Lima de Souza Cascardo <ca=
scardo@igalia.com> wrote:
> As far as I understood the patchset, it doesn't fail the write if it fails
> to reclaim. It sets the new max, then, if the write is blocking, starts
> reclaim and eventually returns after multiple attempts. But it still
> returns success.
>=20
> So I believe this is behaving as you would expect.

I was alarmed by the EBUSY mention similarly to Tejun but then I
couldn't find it in pre-patch (840ef6c78e6a2) nor in patched (v5) code.
Please make sure the EBUSY return behavior is not introduced
(essentially match memory.max behavior) and that the accompanying
message refers up to date code ;-)

Michal

--lrl2vho5y5eomexp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajzykhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AihGwEA1SCEBfnAwyeubLR7IllY
8xY1mJBt88wz9mCIeM9+iY8A/0e+2PnPs29VJ7kdk24/ZbM72Eltcu2Pv4++6deM
lMAL
=i/jW
-----END PGP SIGNATURE-----

--lrl2vho5y5eomexp--
