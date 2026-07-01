Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EE/7LaY/RWpz9QoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:26:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF46EFC47
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:26:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nWTajatr;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8160A10F03A;
	Wed,  1 Jul 2026 16:26:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD69E10F00D;
 Wed,  1 Jul 2026 16:26:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 34DA960122;
 Wed,  1 Jul 2026 16:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97B21F000E9;
 Wed,  1 Jul 2026 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782923168;
 bh=Fm3FlfcjybotyrEI+ohYn0xEKLKpJ541/JkKmW8KEOI=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To;
 b=nWTajatro/WOZW3acbYn6ZHvEQen/ICZDIUQtWAq9wq9FgaRufQ1iL6UL3WAXnGVd
 Y7nXgO7M0c4H6E6g66NtfypeY1T4qHKNCvyMEueZBoTULMQJ04gseonvzIjByBWV9r
 vaMa/R6fZKK6SNMu7DA0eV6G+qeIh0D/Z+TAZxspcwEP+z39Vo9T+OblMU486+bhE+
 RXQBLOPd0gtNuK8Dj+ixXlvkI3RawaKYTD8a52f9dosIfwABk0jDJh5fQ2e0zOUjgo
 m7WO/kKsJiiycatxCxB9/t54wecjylvTKaIwYf0fBHAsq0NUrFfWQrN1B9/CakSHp4
 T/rRJDHiOb1kg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 18:26:04 +0200
Message-Id: <DJNDIIFV82WU.21FKVRT80BJ73@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v10 0/5] drm/gpusvm: split MM and device state across
 gpusvm/range/pages
Cc: "Matthew Brost" <matthew.brost@intel.com>, "Honglei Huang"
 <honghuan@amd.com>, <sima@ffwll.ch>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <aliceryhl@google.com>,
 <Alexander.Deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <Christian.Koenig@amd.com>, <Ray.Huang@amd.com>, <Lingshan.Zhu@amd.com>,
 <Junhua.Shen@amd.com>, <Yiru.Ma@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20260630102127.392396-1-honghuan@amd.com>
 <akPSENdX3vz8PvdY@gsse-cloud1.jf.intel.com>
 <DJMGHGBIJTOI.3FTGPA92WVGC6@kernel.org>
 <6f612bb912271b0dabb86c10e4f81dfbd4c4d31c.camel@linux.intel.com>
In-Reply-To: <6f612bb912271b0dabb86c10e4f81dfbd4c4d31c.camel@linux.intel.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81EF46EFC47

On Wed Jul 1, 2026 at 5:56 PM CEST, Thomas Hellstr=C3=B6m wrote:
> Hi Danilo,
>
> On Tue, 2026-06-30 at 16:33 +0200, Danilo Krummrich wrote:
>> On Tue Jun 30, 2026 at 4:26 PM CEST, Matthew Brost wrote:
>> > If we merge the patches in drm-xe-next and pick them up via a
>> > rebase in the
>> > AMD trees, that works.
>>=20
>> IIUC what your are proposing this will create duplicate commits,
>> which should be
>> avoided.
>>=20
>> If the series is needed in multiple trees it is better to pick a
>> common base and
>> share via a tag that can be merged in all relevant trees.
>
> Our standard workflow if we need commits merged elsewhere in the DRM
> tree is to wait for it to appear in drm-next and then backmerge drm-
> next into our branch. It sounds like that's what Matthew is proposing
> here? And it wouldn't create duplicate commits?

Sure, that works. But "merge in tree A and pick up via rebase in tree B" wo=
uld
create duplicate commits, which we should avoid.
