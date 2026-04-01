Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGgRAXELzWnhZgYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:11:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937B37A395
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307E810ED61;
	Wed,  1 Apr 2026 12:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X6rJpvZI";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8449310ECB9;
 Wed,  1 Apr 2026 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775045484; x=1806581484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LtRf7ZPQ2KP/yLd6h4tuXhNMx+utLON+zyadehE9NWs=;
 b=X6rJpvZIN6WeVE5Iucn4B1k5HInlWx6dm7BDPK/rKdunPke8K+/+x/Zr
 MBC54p+dqmrwNqYPW5x5vxHgQmszWiYHkLmJyKnu+KtWgOtuak4P6f5V+
 4Hn/X4AFzPzi51k4V8oH9FthloINnxh6HUCsNM5StYRbjOWbvowY4BqRV
 N+5vBiEJEoOL6z/1hjAfqYecxrSMNauvXJCnQI6XVi/PnsktA3Pz5Edyf
 1s1YrnZu59/n6fYNtgYDk1P2TyrFFxRoDg86EeLv/LK+J5aBdLa8ToQnO
 za2Y0Q9fuKRt5442acwE3NUCbJkwZg9JhamYm2/DufdrLTLRvm+xJuh5l A==;
X-CSE-ConnectionGUID: QkfwQgSuRbOKpfVwNr/Vhw==
X-CSE-MsgGUID: QMj7VqjGSdi1IfUj608Fhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76268725"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76268725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:11:23 -0700
X-CSE-ConnectionGUID: EnIUM/blQZOH4k+QMBCR9Q==
X-CSE-MsgGUID: LVUKNrBhS52fHw78/muo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="231071665"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.199])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:11:17 -0700
Date: Wed, 1 Apr 2026 15:11:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 0/3] Add "link bpc" DRM property
Message-ID: <ac0LYoemprz5-dDq@intel.com>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Spamd-Result: default: False [-0.54 / 15.00];
	R_MIXED_CHARSET(0.77)[subject];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ville.syrjala@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email]
X-Rspamd-Queue-Id: 9937B37A395
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:57:08PM +0200, Xaver Hugl wrote:
> Am Do., 19. März 2026 um 13:28 Uhr schrieb Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com>:
> >
> > This series adds a new "link bpc" DRM property. It reflects the display
> > link's actual achieved output bits per component, considering any
> > degradation of the bit depth done by drivers for bandwidth or other
> > reasons. The property's value is updated during an atomic commit, which
> > is also when it fires an uevent if it changed to let userspace know.
> 
> Hi,
> I think it's a really good idea to have a property for knowing the
> actual bpc of the link... however, I do have one big concern with this
> API specifically: It only gives me this information after a modeset.
> 
> With this limitation, I can at most show the user which bpc was chosen
> after the apply display settings and have the end user manually test
> and figure things out, but I cannot show in the UI which bpc will be
> chosen with some configuration before they apply it, and I cannot do
> atomic tests to find a desired tradeoff automatically on the
> compositor side.

I think the idea of some kind of feedback properties in the atomic
commit has come up before, but no one has ever tried to implement them.

> 
> As a side note, for future patches relevant for compositors, please cc
> wayland-devel. It really shouldn't be up to chance whether or not
> compositor developers that would later use the API find out about it
> before it's merged, and keeping track of all of dri-devel is way too
> much to ask from userspace developers.
> 
> - Xaver

-- 
Ville Syrjälä
Intel
