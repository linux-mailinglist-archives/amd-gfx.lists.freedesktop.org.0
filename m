Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BInyHUAcRmqPKAsAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:07:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165646F4930
	for <lists+amd-gfx@lfdr.de>; Thu, 02 Jul 2026 10:07:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=CLEsIiWM;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C2A10F20D;
	Thu,  2 Jul 2026 08:07:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F68410EA6E;
 Wed,  1 Jul 2026 15:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782921376; x=1814457376;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=afwJd+S6lP1l2dk3kI5UOr04xPYFcO5Q8UB0L68b/y4=;
 b=CLEsIiWMvZ5GKR/8pgMo+DVmAyxVAqr4QKa0vL+SFEpW6c8w8ApHaiYf
 A8zM5KvAkGwzTNh/3zlenEMOT1u5+6lJt+fjW3QPhClXiICOgnwUCLX0A
 sKJpLM6gXSh8oam134T7JOcOlCo6gFod3NMWM+kCT/Mx39DOOm5MSn4Ce
 HBRmkfUi1dqoLNIm2VdcXadMy2eS3We3eIUUKohyMbtMY2swALA2fBUYC
 U2cL5kpTbfmCqP7EJsTIsh/K+bxBG9W/+ADgzXmIXeFepxpZcXqjrz3sS
 euKVYjLmmce9FU0jelZk6yi73JKRujchesXg3+mHFwEziNyJPCyQDrAaS A==;
X-CSE-ConnectionGUID: C11Z6hNCQoijcalVRy39oQ==
X-CSE-MsgGUID: MAZJE2Q/R4q+B8C8280xDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87571900"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="87571900"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 08:56:15 -0700
X-CSE-ConnectionGUID: FsdKxxFaRS+2fJ35CrDePw==
X-CSE-MsgGUID: Tqp34GmNTRmi31OCCvlsug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; d="scan'208";a="256938068"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.120])
 ([10.245.244.120])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 08:56:10 -0700
Message-ID: <6f612bb912271b0dabb86c10e4f81dfbd4c4d31c.camel@linux.intel.com>
Subject: Re: [PATCH v10 0/5] drm/gpusvm: split MM and device state across
 gpusvm/range/pages
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: Honglei Huang <honghuan@amd.com>, sima@ffwll.ch, rodrigo.vivi@intel.com,
 intel-xe@lists.freedesktop.org, aliceryhl@google.com,
 Alexander.Deucher@amd.com, 	Felix.Kuehling@amd.com,
 Christian.Koenig@amd.com, Ray.Huang@amd.com, 	Lingshan.Zhu@amd.com,
 Junhua.Shen@amd.com, Yiru.Ma@amd.com, 	amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Date: Wed, 01 Jul 2026 17:56:07 +0200
In-Reply-To: <DJMGHGBIJTOI.3FTGPA92WVGC6@kernel.org>
References: <20260630102127.392396-1-honghuan@amd.com>
 <akPSENdX3vz8PvdY@gsse-cloud1.jf.intel.com>
 <DJMGHGBIJTOI.3FTGPA92WVGC6@kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2026 08:07:22 +0000
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,linux.intel.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 165646F4930

Hi Danilo,

On Tue, 2026-06-30 at 16:33 +0200, Danilo Krummrich wrote:
> On Tue Jun 30, 2026 at 4:26 PM CEST, Matthew Brost wrote:
> > If we merge the patches in drm-xe-next and pick them up via a
> > rebase in the
> > AMD trees, that works.
>=20
> IIUC what your are proposing this will create duplicate commits,
> which should be
> avoided.
>=20
> If the series is needed in multiple trees it is better to pick a
> common base and
> share via a tag that can be merged in all relevant trees.

Our standard workflow if we need commits merged elsewhere in the DRM
tree is to wait for it to appear in drm-next and then backmerge drm-
next into our branch. It sounds like that's what Matthew is proposing
here? And it wouldn't create duplicate commits?

Thanks,
Thomas

