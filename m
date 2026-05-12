Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +lhFLrcuBGqiFAIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E654452F26E
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 09:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56610ED31;
	Wed, 13 May 2026 07:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nvaGZi5B";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068610E08A;
 Tue, 12 May 2026 22:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cdQIDMPWyYOXbUwZjwtTDMyKpwgb3v0toGsPGRZyGVA=; b=nvaGZi5ByxxCUz0Qsv8In87fYs
 RJIaDvvai3GqYJSIr+0r3Lx9GZjsjU3Cs9NqIBGwmoN0LAIvDlIhnZvedu4iQJ8bcryNwnOTqnOIM
 /cg5Fo8tgfVIUUgKAiQTHuqLYkkXVEhboN3ke5jUb1wmyrdlyX+genZ2sxREgIdvfVERoGVhfUPGO
 1FU40PhJBKq5O5cOHK7QQDPsTmTw4y1B6pNkHA70vvdApShRaaHausaqePvTwjR6xtfgXBTag/GD0
 82J0CCZsgf6i7oUV9/+DxM7fl6IdF9+xuz+Ab/YswdPWXCQk9oioU7mt+KnoN2Z6VJgIE3Kt1ES6A
 hW5kgOqQ==;
Received: from 179-242-241-236.3g.claro.net.br ([179.242.241.236]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMvZl-009gYl-8w; Wed, 13 May 2026 00:27:41 +0200
Date: Tue, 12 May 2026 19:27:29 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 maarten.lankhorst@linux.intel.com,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Natalie Vock <natalie.vock@gmx.de>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH i-g-t 0/8] dmem: add amdgpu support and one more test
Message-ID: <agOpUY4atNNzSs1i@quatroqueijos.cascardo.eti.br>
References: <20260512215156.4083082-1-cascardo@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260512215156.4083082-1-cascardo@igalia.com>
X-Mailman-Approved-At: Wed, 13 May 2026 07:56:32 +0000
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
X-Rspamd-Queue-Id: E654452F26E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,linux.intel.com,gmx.de,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.790];
	FROM_NEQ_ENVFROM(0.00)[cascardo@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 06:51:47PM -0300, Thadeu Lima de Souza Cascardo wrote:
> This work builds on top of Thomas Hellström's patches at [1].
> 
> Besides the case of eviction when setting dmem.max, which still needs
> support from [2], there are other cases for testing dmem behavior and

It was pointed out that I missed the link here. And here it is.

[2] https://lore.kernel.org/dri-devel/20260512082406.44470-1-thomas.hellstrom@linux.intel.com/

> potential regressions. Thomas' patches lay over the groundwork for this,
> while this patchset addes one basic test of checking current usage and that
> drivers respect max setting when no eviction is taking place yet.
> 
> This patchset also introduces a driver layer such that the same tests can
> work with different drivers. amdgpu support is here added too.
> 
> [1] https://patchwork.freedesktop.org/series/163935/
> 
> Thadeu Lima de Souza Cascardo (8):
>   Introduce dmem driver and implement Xe support
>   Adjust xe_cgroups test to use igt_dmem_driver
>   Make xe_cgroup test a generic test
>   amdgpu: add amdgpu_cgroup_region_name
>   igt_dmem_driver: add amdgpu support
>   dmem: add test for current/max
>   dmem: only check for dmem availability once
>   dmem: get region once per driver
> 
>  lib/amdgpu/amd_dmem.c    |  94 ++++++++++
>  lib/amdgpu/amd_memory.c  |  25 +++
>  lib/amdgpu/amd_memory.h  |   2 +
>  lib/igt_dmem_driver.h    |  25 +++
>  lib/meson.build          |   2 +
>  lib/xe/xe_dmem.c         | 145 +++++++++++++++
>  tests/drv_dmem_cgroups.c | 390 +++++++++++++++++++++++++++++++++++++++
>  tests/intel/xe_cgroups.c | 296 -----------------------------
>  tests/meson.build        |   2 +-
>  9 files changed, 684 insertions(+), 297 deletions(-)
>  create mode 100644 lib/amdgpu/amd_dmem.c
>  create mode 100644 lib/igt_dmem_driver.h
>  create mode 100644 lib/xe/xe_dmem.c
>  create mode 100644 tests/drv_dmem_cgroups.c
>  delete mode 100644 tests/intel/xe_cgroups.c
> 
> -- 
> 2.47.3
> 
