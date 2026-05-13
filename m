Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMJzLLCHBWr5XwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 14 May 2026 10:28:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30253F542
	for <lists+amd-gfx@lfdr.de>; Thu, 14 May 2026 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AB210F16F;
	Thu, 14 May 2026 08:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WscbgpiU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11FF10E5B6;
 Wed, 13 May 2026 08:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662455; x=1810198455;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Jgp2UTOFNInsOSeSpPgO0/7DmN2y2j0R3zuWEKTH2EQ=;
 b=WscbgpiUBUVfWYsno48tPSMsrFNHyv5x8UJiUZuoIwSYvaG1aDXabH8S
 onyVGyaH+3Pw6flYKHuA1zyxDijBeMKtly8yC5hX/l2q4yl5Q0CIJvpwt
 57yqcRuQhYOjwHcBsGqIff284AulQKlS5ZGOQb7YkF4Dm2KYa7HVAc2Xf
 q52yw68IOw97xK1OKL2SIKuqxJSELGDvTQ1vngJW+d55D5Lrg+ENNAMzh
 DhGbwcp9q0Dt6q0SvIQxQ7TfbjOlhZz6AYHMfLtBFqITgR/+FutwZoIqM
 CXxI3ThvvVxb5q8zGqqAZrQYccM8EbwgS+2pOaOZrIQrwtNWO/us45QPP w==;
X-CSE-ConnectionGUID: u++Eq4omTMGeEIB6pv3dkA==
X-CSE-MsgGUID: pT+AX7zkQvq+HELNqjkf3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="82151214"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="82151214"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:54:15 -0700
X-CSE-ConnectionGUID: D7jmCdnESpW3WBvi8P2EGw==
X-CSE-MsgGUID: GqmBRViOSG612pY7NMdvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="238267969"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.49])
 ([10.245.244.49])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:54:12 -0700
Message-ID: <54760b7dc968b830d3db4606fee43a02e8184ce9.camel@linux.intel.com>
Subject: Re: [PATCH i-g-t 0/8] dmem: add amdgpu support and one more test
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Thadeu
 Lima de Souza Cascardo <cascardo@igalia.com>, igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, Natalie
 Vock	 <natalie.vock@gmx.de>, kernel-dev@igalia.com, Tvrtko Ursulin	
 <tvrtko.ursulin@igalia.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
Date: Wed, 13 May 2026 10:54:08 +0200
In-Reply-To: <ceb093fc-f028-4c03-8f16-08ab2d0b1ed7@amd.com>
References: <20260512215156.4083082-1-cascardo@igalia.com>
 <ceb093fc-f028-4c03-8f16-08ab2d0b1ed7@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 14 May 2026 08:28:29 +0000
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
X-Rspamd-Queue-Id: CD30253F542
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,gmx.de,igalia.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux.intel.com:mid]
X-Rspamd-Action: no action

On Wed, 2026-05-13 at 10:06 +0200, Christian K=C3=B6nig wrote:
> On 5/12/26 23:51, Thadeu Lima de Souza Cascardo wrote:
> > This work builds on top of Thomas Hellstr=C3=B6m's patches at [1].
> >=20
> > Besides the case of eviction when setting dmem.max, which still
> > needs
> > support from [2], there are other cases for testing dmem behavior
> > and
> > potential regressions. Thomas' patches lay over the groundwork for
> > this,
> > while this patchset addes one basic test of checking current usage
> > and that
> > drivers respect max setting when no eviction is taking place yet.
> >=20
> > This patchset also introduces a driver layer such that the same
> > tests can
> > work with different drivers. amdgpu support is here added too.
>=20
> Of hand that looks really nice.
>=20
> Please always keep Vitaly CCed for igt test patches which affect
> amdgpu as well.
>=20
> Thanks,
> Christian.

Agree this looks nice.
For the xe changes (once [1] gets merged)
Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks,
Thomas


>=20
> >=20
> > [1] https://patchwork.freedesktop.org/series/163935/
> >=20
> > Thadeu Lima de Souza Cascardo (8):
> > =C2=A0 Introduce dmem driver and implement Xe support
> > =C2=A0 Adjust xe_cgroups test to use igt_dmem_driver
> > =C2=A0 Make xe_cgroup test a generic test
> > =C2=A0 amdgpu: add amdgpu_cgroup_region_name
> > =C2=A0 igt_dmem_driver: add amdgpu support
> > =C2=A0 dmem: add test for current/max
> > =C2=A0 dmem: only check for dmem availability once
> > =C2=A0 dmem: get region once per driver
> >=20
> > =C2=A0lib/amdgpu/amd_dmem.c=C2=A0=C2=A0=C2=A0 |=C2=A0 94 ++++++++++
> > =C2=A0lib/amdgpu/amd_memory.c=C2=A0 |=C2=A0 25 +++
> > =C2=A0lib/amdgpu/amd_memory.h=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0lib/igt_dmem_driver.h=C2=A0=C2=A0=C2=A0 |=C2=A0 25 +++
> > =C2=A0lib/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0lib/xe/xe_dmem.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 145 +++++++++++++++
> > =C2=A0tests/drv_dmem_cgroups.c | 390
> > +++++++++++++++++++++++++++++++++++++++
> > =C2=A0tests/intel/xe_cgroups.c | 296 -----------------------------
> > =C2=A0tests/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> > =C2=A09 files changed, 684 insertions(+), 297 deletions(-)
> > =C2=A0create mode 100644 lib/amdgpu/amd_dmem.c
> > =C2=A0create mode 100644 lib/igt_dmem_driver.h
> > =C2=A0create mode 100644 lib/xe/xe_dmem.c
> > =C2=A0create mode 100644 tests/drv_dmem_cgroups.c
> > =C2=A0delete mode 100644 tests/intel/xe_cgroups.c
> >=20
