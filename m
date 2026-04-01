Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mPDTOcwOzWnhZgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:25:48 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167B37A6A0
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B94D10ED26;
	Wed,  1 Apr 2026 12:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="DCGm6z+t";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4BB10ED26
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Apr 2026 12:25:45 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-89fc349b5c2so43049676d6.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Apr 2026 05:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775046344; cv=none;
 d=google.com; s=arc-20240605;
 b=PISBk9Bt5gI/cmsffgI+rkOnvrNRRF3e2JLkEM7Swv1hWGH9tU8HETQHNAFc+AaJMN
 KfGi4Xetsbq2p0XvbLIhdrd3ru6w9oNbf8ymHKi/0Msqa2DBD/4LyvSpGRkCGiVMuXQf
 I2AHykFr+IeY32f+OLzGZunJTFhPBEsq+x45kvfScDBY0eCbAJ6S90fSgMuJigXlCIuu
 GUQWnlZwVf1YTJSX/V8Et33p4K3kCMw+wlFFMchviP76n8LFYVZYB5U98la9XAski4+w
 TuSl/V8ngH1t9CNboLSdo4/ZVPeRcJEyhvwxFGCCEE9AedOSTv94M64SH5ZK5UMWjvjk
 dbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=eU+zz3OLuWk12Q4NR58R8+sU9sxDECloo/YZ57DpO3s=;
 fh=lZQWq4IPsDGYapFOeADhcF5FJP9/fzJJd0wnCtCuZbo=;
 b=HrXCiOwBA+Ez03bspOx2DxdmbkgE3s5oO3phvFwWgAvlfB4pePP1cnAN3Ctu00cc0w
 TG04SlhQDJOqJAOXObi54fdKhiQh0aSXdSacKmaVA8P+7NyLdrTnAHICTX84GJwba18K
 HFtQnwvM+gDWwO0TwJlImWxM0ZAWjVEfuvkQB85MCKHaeN1wS/Asu2ChbIbqx6ahhEil
 1ovIh8N4pgQAgVyVCpPyDzJHKeSiWusNpDFJdUFYcSNHKKVGrwS7M6QU9RmrgTcJqrbD
 noWZjUxSpxtRRX9u5YxR/WmIa1etJ+MfMLQgmsKwz9YJUzB5Voul0a+OTHDxrmgfYJH7
 JUWw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1775046344; x=1775651144;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eU+zz3OLuWk12Q4NR58R8+sU9sxDECloo/YZ57DpO3s=;
 b=DCGm6z+tWZ0eKNsiMDB79pgYQYgh2/2vdLsDddGBiUsoLSbtPrWlcMaWxqCQZgYxDd
 e/EFxocRise1qVgiGowofwd+xifsP0QTYJypEJeGUEt1r6Phqin5HRN2+gH+Ai8o238/
 5NvU32BjaElWeYKEilDNLTshhSys+K18KFwuhIGS6MZf7RnksCBAKDH5q4ZHGG1aeBkF
 0QWMybdQG0eo7H+ZrpIQ6UZ08ifgbaXBqfh/Mcy05fUzywU4V0JTaKQDwkACw9iljdFk
 kUFJz8SmpcA1cj9zA4Qt/TRn3AeV2eNCGs/xntM6ycuseeUS8YszTwz9F7vbSKmFJPax
 qcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775046344; x=1775651144;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eU+zz3OLuWk12Q4NR58R8+sU9sxDECloo/YZ57DpO3s=;
 b=VzkHq2lXCTUCfvD2+TXQ2LcMzpObNRWMvyRYlArwE1X6ttDUbUR2Y7T+bFOmwySfbN
 vEe8N7HBigYxqGyHYlE+qg7Df9JH3714QPVzFGCpbLsOX4Im/WG13lu6l5iQZpLQ/yDQ
 9DTndN97PgES9Z+HFup9lTB6aGZrSRWX2iFtIwv2uw/mNmbO1soDXPLr4IcMjYV9Xw5a
 e942Hzd4XH1T87PbvxCx2urn218V7D5gCCloPij6PLFzPKyRe6V49oJAoZCSiykx+NVT
 6sCwHr+uwgS1/1hD36pyYx6jnYsv7c9NA41Crgg76ZgdIWxt1K2P5QnwlNH/6XPz78/n
 ZojQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjnjBjEyg4VTy05ppLagipVWKeZ4PEDp0W3YBkx24CUCwL4mpF+SgJU2t6nm5BF0X1evK+EeNa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+2PS8jfDKRaIv2Fh3Rk2kNnmXA5d2W/0RkRfATUhAg8nQbs3F
 HifDQHoPQ3zpogEzdeYRV3lrsQxA8yez4mRj+tOeWtvMCp9KvjV5AJK/3OgqvhVKgEL398v6Bo5
 4oiE56MLj7YzcOS8iL+VszIJiBFDj94epQvVK8ODUvA==
X-Gm-Gg: ATEYQzyE7vksXuScvj0MJwQ6CFbMy+jFSYhnpRvt/rsJahOxhzk96EbG4AqOTxelU6E
 bhxxwBVpnRXsvb4/Eh/yNguKtbvOxoC0J/lr8+PAXlp+p+il7qV7f2BoSINktogAy4viRgqulWw
 oce03WQTgoQBAu82K46hmwIH3wHfhkgTlP5nCEzxZJCL1qEtJxzuw1Wg3XEDyLGFunmxMPT5C1u
 ko7GoeKMBwhQCz9gJB1IPlbo3vRipUJ3W62nsPyI7N3FECioh4PY6p/olVj7AT1TNg6lnNOBI7X
 Vij7uCoXAajqrWyazE/BFoabdbl3XNh+ZxyueiKQbQ==
X-Received: by 2002:a05:6214:dac:b0:89c:e7d8:989a with SMTP id
 6a1803df08f44-8a43a27285emr46661276d6.35.1775046343938; Wed, 01 Apr 2026
 05:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
 <ac0LYoemprz5-dDq@intel.com>
In-Reply-To: <ac0LYoemprz5-dDq@intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 1 Apr 2026 13:25:31 +0100
X-Gm-Features: AQROBzCCN0NAl8sVFUTNdPlCD4ae-2ORt2gK2m_u_f-UZ_1uO6MvhoYtxuTB6QM
Message-ID: <CAPj87rN6v8qsdRkALZXjxj+zSXdo-BnFcX8tM2M4-xawkn=Xyw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Xaver Hugl <xaver.hugl@kde.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Stone <daniels@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>, wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[fooishbar.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:ville.syrjala@linux.intel.com,m:xaver.hugl@kde.org,m:nicolas.frattaroli@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:daniels@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel@collabora.com,m:derek.foreman@collabora.com,m:marius.vlad@collabora.com,m:wayland-devel@lists.freedesktop.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kde.org,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,fooishbar.org:dkim,intel.com:email]
X-Rspamd-Queue-Id: 9167B37A6A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 at 13:11, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
> I think the idea of some kind of feedback properties in the atomic
> commit has come up before, but no one has ever tried to implement them.

Yeah, if you're looking for context on these, the last place I
remember it coming up was wanting to know which other objects would
potentially be dragged into a commit. For example, on ye olde (?)
Intel platforms, if programming a different mode is actually
stop-the-world where all other CRTCs get affected by a CDCLK change,
being able to know that those other CRTCs would be affected before it
happens, rather than random -EBUSY after the fact.

Cheers,
Daniel
