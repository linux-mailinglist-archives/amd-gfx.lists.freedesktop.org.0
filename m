Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLVoFvMVzWmMZwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:56:19 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1237AD17
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Apr 2026 14:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE73110ED2B;
	Wed,  1 Apr 2026 12:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vn+nwUSX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5134F10ECD7;
 Wed,  1 Apr 2026 12:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775048175; x=1806584175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5zPr3Fy9/dtEUiFn8VgaF3h/MqP5no3JhMn4H+5M3hU=;
 b=Vn+nwUSXKvFcODGNfMjPOtQQazRgON6d3KaHRDdLnXqzZLXMUPs8OmoI
 dGQcaJoEF26dqIO0S/SbmPYl3fD8t+I/2pPbTqmxqmSWh0seijj+QJw1Z
 CdGlZ9Lst0lkoWn9ykyldQjIwIrXwpuDUY3+W7K3809t4FqJ/rZwqYhS4
 Ya0RJFFsybe31pMaeFa9xz9s/g6bgtE6VtPu1twB4j8/a2++Cjgu/8JRa
 ONm7QEsSsqdqiXGw0eu0ORIYaySbUcm0Mcaa1s+Qj4jnqyQH+SQyYpnqK
 NVlyuCtiB7cjhIyYVLb/ee6dyX531Aj4BBXiecmAMjYZcl5L+uSLQeDHf A==;
X-CSE-ConnectionGUID: 5MKWore0RhC9rizmZxp5cw==
X-CSE-MsgGUID: tyctaoyOTYCk1ViIdOdrnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87472611"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87472611"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:56:14 -0700
X-CSE-ConnectionGUID: E2XgVs58T3igKGA2NhJL8w==
X-CSE-MsgGUID: G4/O/++ERsq34MnbY6ttEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="221813823"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.199])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 05:56:10 -0700
Date: Wed, 1 Apr 2026 15:56:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Xaver Hugl <xaver.hugl@kde.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
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
Message-ID: <ac0V5oqaXDHLERSa@intel.com>
References: <20260319-link-bpc-v5-0-5306cd04a708@collabora.com>
 <CAFZQkGzxfGP4E18owJf5d6L4n25-nvYn0TG=rTLCzjpj1Hk23w@mail.gmail.com>
 <ac0LYoemprz5-dDq@intel.com>
 <CAPj87rN6v8qsdRkALZXjxj+zSXdo-BnFcX8tM2M4-xawkn=Xyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPj87rN6v8qsdRkALZXjxj+zSXdo-BnFcX8tM2M4-xawkn=Xyw@mail.gmail.com>
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
	FREEMAIL_CC(0.00)[kde.org,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,amd.com,igalia.com,oss.qualcomm.com,lists.freedesktop.org,vger.kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 86B1237AD17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 01:25:31PM +0100, Daniel Stone wrote:
> On Wed, 1 Apr 2026 at 13:11, Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> > I think the idea of some kind of feedback properties in the atomic
> > commit has come up before, but no one has ever tried to implement them.
> 
> Yeah, if you're looking for context on these, the last place I
> remember it coming up was wanting to know which other objects would
> potentially be dragged into a commit. For example, on ye olde (?)
> Intel platforms, if programming a different mode is actually
> stop-the-world where all other CRTCs get affected by a CDCLK change,
> being able to know that those other CRTCs would be affected before it
> happens, rather than random -EBUSY after the fact.

For the success cases I think it should be pretty straightforward
to just walk the props in the commit again after the atomic check
and write back all the feedback values from the computed state.

I think adding this for error cases would be much harder. We'd have to
somehow make sure the value(s) we write back to userspace are at least
somewhat valid even though the state check may have failed half way
through.

Although that specific -EBUSY you mention I think is checked after
the actual atomic check, so it would work there. Assuming we'd have
a place for eg. the affected crtcs bitmask in the ioctl structure...

And speaking of which, if you'll permit me to go off on another
tangent, I have occasionally pondered introducing per-device
properties. We could introduce a new object type for the whole
device, and add a new enumeration thing to find it. Then per-device
properties could be added to atomic commits exactly like any other
properties. My original idea was to use this for some kind of
device wide "power vs. performance" knob, but it could also be
used for this affected crtcs bitmask feedback.

-- 
Ville Syrjälä
Intel
