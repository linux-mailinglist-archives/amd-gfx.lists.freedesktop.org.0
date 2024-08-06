Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7E5949229
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2024 15:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8010E381;
	Tue,  6 Aug 2024 13:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Mr76nB06";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01610E379;
 Tue,  6 Aug 2024 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3LTBOgJDuXy2JwBI4zDANEzW9GrzludH0YUDes8GtkE=; b=Mr76nB06wQclSyKoqSrIkT4bMj
 OOgpRUmOKIE5K8IQGUaxR8U2Ue89TpXSxdT0t0LL0HAP3KJDI+995AnE8ngb1af0SEBLQhyErrMhE
 hjHW2leRMXsNA6TIA0yF5ulOg9hMTxwWkDA7/eicCWGkSVkuUg/PzILn6egqQuTDxpWJ5hpLw8A5Y
 kpZ3l/J+VEGTtCq4SoUubDju/SqTOjIteVVJcI6v6J6mcqAteBUARvIxjg1AzsJU0gfPFs5ZDK7bS
 hD0k7/fq/d7KEC7yKQkEOc9iplQjxdb6uYxO1eog0Y2XzBfZarNrOeWHEB5CIwMTXl0pFuIMA01tf
 5DgN82Og==;
Received: from [179.118.186.198] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sbKcd-008buR-1C; Tue, 06 Aug 2024 15:53:07 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH RESEND v8 0/2] drm/atomic: Ease async flip restrictions
Date: Tue,  6 Aug 2024 10:52:58 -0300
Message-ID: <20240806135300.114469-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

As per my previous patchsets, the goal of this work is to find a nice way to
allow amdgpu to perform async page flips in the overlay plane as well, not
only on the primary one. Currently, when using the atomic uAPI, this is the only
type of plane allowed to do async flips, and every driver accepts it.

In my last version, I had created a static field `bool async_flip` for
drm_planes. When creating new planes, drivers could tell if such plane was
allowed or not to do async flips. This would be latter checked on the atomic
uAPI whenever the DRM_MODE_PAGE_FLIP_ASYNC was present.

However, Dmitry Baryshkov raised a valid point about getting confused with the 
existing atomic_async_check() code, giving that is an function to do basically
what I want: to let drivers tell DRM whether a giving plane can do async flips
or not. It turns out atomic_async_check() is implemented by drivers to deal with
the legacy cursor update, so it's not wired with the atomic uAPI because is
something that precedes such API.

So my new proposal is to just reuse this same function in the atomic uAPI path.
The plane restrictions defined at atomic_async_check() should work in this
codepath as well. And I will be able to allow overlays planes by modifying
amdgpu_dm_plane_atomic_async_check(), and anyone else have a proper place to
play with async plane restrictions as well.

One note is that currently we always allow async flips for primary planes,
regardless of the drivers, but not every atomic_async_check() implementation
allows primary planes (because they were writing targeting cursor planes
anyway...). To avoid regressions, my patch only calls atomic_async_check() for
non primary planes, and always allows primary ones.

Thoughts?

Changelog
 v7: https://lore.kernel.org/dri-devel/20240618030024.500532-1-andrealmeid@igalia.com/
 - Complete rewrite

André Almeida (2):
  drm/atomic: Let drivers decide which planes to async flip
  drm/amdgpu: Enable async flip on overlay planes

 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  3 +--
 drivers/gpu/drm/drm_atomic_uapi.c             | 23 ++++++++++++++-----
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.46.0

