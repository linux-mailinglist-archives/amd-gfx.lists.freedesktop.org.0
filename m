Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E944C49355F
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Jan 2022 08:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B5910E180;
	Wed, 19 Jan 2022 07:24:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CE110E173;
 Wed, 19 Jan 2022 07:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642577066; x=1674113066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lRyYmpoponpkRQxOs7JfGkkt5rdxgzCiwRUBQKDLGQA=;
 b=XkocNBOnPF48WNQmC1eOR34uIJgisv1uB8MeY6xcfIBJt3fT8JBegmb4
 Q7Zizod06Kd35NrEPi1e7/ThV9/o6LRdum9sAJYEqcK3+wc6N/0bzlLA2
 e7MgMMtiA80iVTyk+6dAnYreK1xbA6LtAekrcyKwpz3V4VkixsBimhHPf
 v43Jj6DnVyTyQrONayOCtan19DONQERO2zIVh43XTFEMwkoF36ElPb8ON
 9VxiVL4+9nWZgHo/Igs4u7RREzzG40TE0oTyCPyrs6Yr5KqcF5doEIcs8
 Wnx9Y+Nv+UqrkUfLUdY1LwlWI9iFn1kqV4SfoO8kuqGi+Y3ghrI85BcrJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="244799924"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="244799924"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:24:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; d="scan'208";a="530544489"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 23:24:25 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-security-module@vger.kernel.org, nouveau@lists.freedesktop.org,
 netdev@vger.kernel.org
Subject: [PATCH 0/3] lib/string_helpers: Add a few string helpers
Date: Tue, 18 Jan 2022 23:24:47 -0800
Message-Id: <20220119072450.2890107-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chris Wilson <chris@chris-wilson.co.uk>, Vishal Kulkarni <vishal@chelsio.com>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Harry Wentland <harry.wentland@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Julia Lawall <julia.lawall@lip6.fr>,
 Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Raju Rangoju <rajur@chelsio.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Add some helpers under lib/string_helpers.h so they can be used
throughout the kernel. When I started doing this there were 2 other
previous attempts I know of, not counting the iterations each of them
had:

1) https://lore.kernel.org/all/20191023131308.9420-1-jani.nikula@intel.com/
2) https://lore.kernel.org/all/20210215142137.64476-1-andriy.shevchenko@linux.intel.com/#t

Going through the comments I tried to find some common ground and
justification for what is in here, addressing some of the concerns
raised.

a. This version should be a drop-in replacement for what is currently in
   the tree, with no change in behavior or binary size. For binary
   size what I checked wat that the linked objects in the end have the
   same size (gcc 11). From comments in the previous attempts this seems
   also the case for earlier compiler versions

b. I didn't change the function name to choice_* as suggested by Andrew
   Morton in 20191023155619.43e0013f0c8c673a5c508c1e@linux-foundation.org
   because other people argumented in favor of shorter names for these
   simple helpers - if they are long and people simply not use due to
   that, we failed

c. Use string_helper.h for these helpers - pulling string.h in the
   compilations units was one of the concerns and I think re-using this
   already existing header is better than creating a new string-choice.h

d. This doesn't bring onoff() helper as there are some places in the
   kernel with onoff as variable - another name is probably needed for
   this function in order not to shadow the variable, or those variables
   could be renamed.  Or if people wanting  <someprefix>
   try to find a short one

e. One alternative to all of this suggested by Christian König
   (43456ba7-c372-84cc-4949-dcb817188e21@amd.com) would be to add a
   printk format. But besides the comment, he also seemed to like
   the common function. This brought the argument from others that the
   simple yesno()/enabledisable() already used in the code is easier to
   remember and use than e.g. %py[DOY]

Last patch also has some additional conversion of open coded cases. I
preferred starting with drm/ since this is "closer to home".

I hope this is a good summary of the previous attempts and a way we can
move forward.

Andrew Morton, Petr Mladek, Andy Shevchenko: if this is accepted, my
proposal is to take first 2 patches either through mm tree or maybe
vsprintf. Last patch can be taken later through drm.

thanks
Lucas De Marchi

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: David S. Miller <davem@davemloft.net>
Cc: Emma Anholt <emma@anholt.net>
Cc: Eryk Brol <eryk.brol@amd.com>
Cc: Francis Laniel <laniel_francis@privacyrequired.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>
Cc: Raju Rangoju <rajur@chelsio.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Vishal Kulkarni <vishal@chelsio.com>

Lucas De Marchi (3):
  lib/string_helpers: Consolidate yesno() implementation
  lib/string_helpers: Add helpers for enable[d]/disable[d]
  drm: Convert open yes/no strings to yesno()

 drivers/gpu/drm/amd/amdgpu/atom.c              |  3 ++-
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |  6 +-----
 drivers/gpu/drm/drm_client_modeset.c           |  3 ++-
 drivers/gpu/drm/drm_dp_helper.c                |  3 ++-
 drivers/gpu/drm/drm_gem.c                      |  3 ++-
 drivers/gpu/drm/i915/i915_utils.h              | 15 ---------------
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c  |  4 +++-
 drivers/gpu/drm/radeon/atom.c                  |  3 ++-
 drivers/gpu/drm/v3d/v3d_debugfs.c              | 11 ++++++-----
 drivers/gpu/drm/virtio/virtgpu_debugfs.c       |  3 ++-
 .../net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c | 11 -----------
 include/linux/string_helpers.h                 |  4 ++++
 security/tomoyo/audit.c                        |  2 +-
 security/tomoyo/common.c                       | 18 ++++--------------
 security/tomoyo/common.h                       |  1 -
 15 files changed, 31 insertions(+), 59 deletions(-)

-- 
2.34.1

