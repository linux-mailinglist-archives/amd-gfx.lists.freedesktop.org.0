Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zMkmF/z3TGobswEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 14:58:36 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE8871B99B
	for <lists+amd-gfx@lfdr.de>; Tue, 07 Jul 2026 14:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=FZMQ+o7h;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5C10ECD7;
	Tue,  7 Jul 2026 12:58:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A656010EB7D;
 Tue,  7 Jul 2026 07:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783408842; x=1814944842;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=oCzQj6mzYMWn7iqnEq+ZWs0O8xxcgsd/5YisJkPeUmU=;
 b=FZMQ+o7h7zIsXFtKxR5+vVjIipBXrHDg5mCB20UNtp1x7ZxdHacLw9mA
 uysrDzv/FEjnNwOoYBFlnGt7pxSFNza4TIYN6pQunaeLP9Zvad+fg8Gdo
 zbpwVTt0cacGBqonvMAdjhy1dLakyCaSrMT3h21g4Sw2xmSOFoWGfEFmP
 jnWzyPDXTwaFEWoPJ/JhcDSiOLlXyG7DaY42dfnOJrwBiqZKVb5bLdU3Q
 1VZ6C1wq8SXFz765SoxziscxzknWysfSfBwFcMXe5kGpCiDBCQ0pscGer
 SNHK4WDydBzb/dG6ZkCHusKCRNwSdBAoOjSpzAlKs9xkje/8OXALIrDb4 A==;
X-CSE-ConnectionGUID: lC4+XuvtR1emOY20367+7g==
X-CSE-MsgGUID: m5ZTq0GZQGuXceWOSMkVKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="87962850"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="87962850"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 00:20:42 -0700
X-CSE-ConnectionGUID: A4GgYyZLTeC5yKEPCVStcA==
X-CSE-MsgGUID: 0oqI3gtaRSmRaXZoccMrKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250570814"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.199])
 ([10.245.244.199])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 00:20:37 -0700
Message-ID: <67ffc76ee6d1aa4e9ef5f4c393304914359eeaab.camel@linux.intel.com>
Subject: Re: [PATCH v7 3/6] cgroup/dmem: Add reclaim callback for lowering
 max below current usage
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: intel-xe@lists.freedesktop.org, Natalie Vock <natalie.vock@gmx.de>, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal =?ISO-8859-1?Q?Koutn=FD?=
 <mkoutny@suse.com>, 	cgroups@vger.kernel.org, Huang Rui
 <ray.huang@amd.com>, Matthew Brost	 <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann	 <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 David Airlie	 <airlied@gmail.com>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, Thadeu Lima de Souza Cascardo
 <cascardo@igalia.com>,  Alex Deucher <alexander.deucher@amd.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, 	dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Tue, 07 Jul 2026 09:20:35 +0200
In-Reply-To: <akwBFlw8MwhrwsRu@slm.duckdns.org>
References: <20260703130541.2686-1-thomas.hellstrom@linux.intel.com>
 <20260703130541.2686-4-thomas.hellstrom@linux.intel.com>
 <akwBFlw8MwhrwsRu@slm.duckdns.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Jul 2026 12:58:30 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmx.de,cmpxchg.org,suse.com,vger.kernel.org,amd.com,intel.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,gmail.com,igalia.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,linux.intel.com:from_mime,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:dkim,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AE8871B99B

Hi,

On Mon, 2026-07-06 at 09:25 -1000, Tejun Heo wrote:
> Hello,
>=20
> On Fri, Jul 03, 2026 at 03:05:38PM +0200, Thomas Hellstr=C3=B6m wrote:
> > Also honor O_NONBLOCK so that if that flag is set during the
> > max value write, no reclaim is initiated. The idea is to avoid
> > charging the reclaim cost to the writer of the max value.
>=20
> Is this really necessary? I'm not necessarily against it but this is
> trivial
> to work around from userspace and feels like a gratuitous addition.
> What's
> the use case?

This was something that was added at the request of Maarten. The idea
is to mimic the memcg behaviour. For memcg, the use-case was to avoid
having the reclaim cost (I assume in terms of cpu time) land on the
next allocator instead of the process writing the new max value.

I think there are more details in the memcg commit history, but the
presence here is solely to mimic memcg WRT this.

Thanks,
Thomas=20

>=20
> Thanks.
