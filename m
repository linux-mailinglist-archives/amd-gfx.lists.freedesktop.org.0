Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vvTTHb5rQmok6wkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:34 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF96DAA04
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jun 2026 14:57:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex.ru header.s=mail header.b=Scp36FMo;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=yandex.ru
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25E410E89C;
	Mon, 29 Jun 2026 12:57:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net
 [178.154.239.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238E310E805;
 Mon, 29 Jun 2026 10:33:25 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c15:340d:0:640:ad51:0])
 by forward103a.mail.yandex.net (postfix) with ESMTPS id BBC1E806C0;
 Mon, 29 Jun 2026 13:33:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp)
 with ESMTPSA id mWaU7PLg7Gk0-zr3sTh1k; 
 Mon, 29 Jun 2026 13:33:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1782729201; bh=bkbr8BQEH5XYv/QZbwbCjGjbwygqzEt5NhSM1N730sw=;
 h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=Scp36FMoYe+GiOzC5BrP3iXWVS3eqZdc2Wp7VLUWWWevEJSEuNth5Rv5kKFNfZoQ8
 6LRo0RsiQ/cmMmiG3I28tj3PwK9xXvpLXyctwZ9q80Co+CDvzkMAxouUdMEDZDbnc9
 4KKP7F2THNb8a84zDstVDFOZCvYuGQtWDGM/CfFg=
From: Evgenii Burenchev <evg28bur@yandex.ru>
To: sashiko-bot@kernel.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, mario.limonciello@amd.com, alex.hung@amd.com,
 superm1@kernel.org, timur.kristof@gmail.com, ivan.lipski@amd.com,
 ray.wu@amd.com, aurabindo.pillai@amd.com, chen-yu.chen@amd.com,
 mripard@kernel.org, Dillon.Varone@amd.com, mwen@igalia.com,
 chiahsuan.chung@amd.com, kenneth.feng@amd.com,
 srinivasan.shanmugam@amd.com, tzimmermann@suse.de, Alvin.Lee2@amd.com,
 dmitry.baryshkov@oss.qualcomm.com, chaitanya.kumar.borah@intel.com,
 ekurzinger@gmail.com, pierre-eric.pelloux-prayer@amd.com,
 HaoPing.Liu@amd.com, Tony.Cheng@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, sashiko-reviews@lists.linux.dev,
 Evgenii Burenchev <evg28bur@yandex.ru>
Subject: Re: [PATCH v4 1/3] drm/amd/display: Fix dangling pointer in plane
 reset function
Date: Mon, 29 Jun 2026 13:32:36 +0300
Message-ID: <20260629103236.12380-1-evg28bur@yandex.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629092538.4D19B1F000E9@smtp.kernel.org>
References: <20260629092538.4D19B1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 29 Jun 2026 12:57:25 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex.ru,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[yandex.ru:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_FROM(0.00)[yandex.ru];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,kernel.org,suse.de,oss.qualcomm.com,intel.com,lists.freedesktop.org,vger.kernel.org,linuxtesting.org,lists.linux.dev,yandex.ru];
	DKIM_TRACE(0.00)[yandex.ru:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[evg28bur@yandex.ru,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1FEF96DAA04

On Mon, Jun 29, 2026 at 09:25:37AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Dangling pointer (Use-After-Free) vulnerability in vmwgfx component reset hooks on memory allocation failure.
> - [High] Missing NULL pointer checks in amdgpu duplicate_state hooks lead to NULL pointer dereference on allocation failure.

Thank you for the review.

> [Severity: High]
> This is a pre-existing issue, but returning here when plane->state is
> initially NULL means plane->state remains NULL. Later, when the DRM core
> attempts to duplicate the state, it calls the driver's duplicate hook.
>
> In amdgpu_dm_plane_drm_plane_duplicate_state(), there is no check if
> plane->state is NULL:
>
> amdgpu_dm_plane_drm_plane_duplicate_state() {
>     ...
>         dm_plane_state = kzalloc_obj(*dm_plane_state);
>         if (!dm_plane_state)
>                 return NULL;
>
>         __drm_atomic_helper_plane_duplicate_state(plane, &dm_plane_state->base);
>     ...
> }
>
> Will this cause a NULL pointer dereference in
> __drm_atomic_helper_plane_duplicate_state() since it will crash when trying
> to memcpy from a NULL plane->state?

The DRM core guarantees that duplicate_state() is never called on an object
with a NULL state. The state pointer is always valid when duplication is
requested, as DRM only calls this hook on objects that are already fully
initialized and have an active state.

Therefore, the scenario described above is not possible in practice.
This patch does not introduce any new NULL pointer risks.

> The same pattern appears in amdgpu_dm_connector_atomic_duplicate_state(),
> where to_dm_connector_state(connector->state) will resolve to an invalid
> pointer offset from NULL, causing kmemdup to panic:
>
> Could these duplicate_state hooks be updated to handle a NULL state?

As explained above, DRM core guarantees that duplicate_state is only called
with a valid state. Adding NULL checks in duplicate_state hooks would be
redundant and unnecessary.

> [Severity: High]
> This isn't a bug introduced by this patch, but I noticed the exact same
> dangling pointer pattern this patch fixes also exists in the vmwgfx driver.
>
> In vmw_du_connector_reset(), if kzalloc_obj() fails, it returns without
> updating the state pointer, leaving a dangling pointer:
>
> The identical issue also occurs in vmw_du_crtc_reset() and
> vmw_du_plane_reset().
>
> Since unhandled use-after-free bugs in core DRM state structures can cause
> severe stability issues, do these vmwgfx component reset hooks need a similar
> fix to allocate the new state before freeing the old one?

This is a separate pre-existing issue in a different driver (vmwgfx).
While it does appear to suffer from the same dangling pointer pattern,
it is unrelated to this patch series and should be addressed in a
separate patch by the vmwgfx maintainers.

This patch series only addresses the dangling pointer issue in the
amdgpu_dm reset functions.

Signed-off-by: Evgenii Burenchev <evg28bur@yandex.ru>
