Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B349F34C
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jan 2022 07:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D5410F4BB;
	Fri, 28 Jan 2022 06:08:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB1210F4BA
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jan 2022 06:08:56 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so5505554pja.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jan 2022 22:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q8wXsNp/7NMbRFs+KLl+rPu9p3ssQkCHhvOJ6uRH2qs=;
 b=af44G74taUkSTN7Cnz4Is52cMn2hLoiNiNoJndFVUqlIY3GigsPlPhih37LyhnvlC5
 ptQfCP91Dbd6K9wa0+mtPLICSBhi2E/4R+pduM6HnW6XzyhxRwLgkVyJ4n2BoIW64JAG
 vdrLL/8LoyhE5Lub+9n/p592qgQFtu+KmcNTpTe2RtPqk/rp3+LkOPgXJ46NGXU4z7Hx
 UHeJqRIbQPlCCtSZZ530Zl9jXN5P1jPzkAF3vtB2xgoSHD44nlIAJ2PBq0EKh/ogP//J
 37YkCWirFHWDCnJMX+hTTRqURCME9yJ2C/t52saYZaFSqB98xNv7Fc6Es+BaeW5Mgps/
 ZN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q8wXsNp/7NMbRFs+KLl+rPu9p3ssQkCHhvOJ6uRH2qs=;
 b=if4jVcHDGw1cziB0sipzMz2ndF2DvnBp9EBJ8EJoYeCmGRtS+sr8vDYtnyt9pTT0Uh
 gQt3vjjaPAwPA8XXRgrM/PXQq4tjWRYactrKM4mFXe/C2TiITpLxVuw1tCPHjJYHMEW4
 jchvNQ2CYNNmmO4tRwSO/jeAUghU3GBu/urPCexzO4gu8JZIhSkQERelBrW3bWpdfxnH
 /6qIyjAWpUenN/mu3+I1AzWyMPPUCDsdCIBK5/XW732bBTnk0mMYJ5hGohkOQCVtIxw1
 ijoLmZBNEEgkt25atUn+cS4zO3FF2JTvZ7R6SwradvFscsozjD1zj9TScoRdsNcMA3+t
 Xhrg==
X-Gm-Message-State: AOAM5323VcRRzoDcgAc+We88tv4ec1YLYP/Aa22/4k7CFk7iEVTeRiNs
 oNwmp9Ss+jwcPaNYsnKjTSf+ZA==
X-Google-Smtp-Source: ABdhPJwoeh1k1ZUoFKJdbZmqETX4U7hUdZ2Dft41VHBnmOHKyYN83nZ2eVUcsXqSwfZaTWK2fhD4kQ==
X-Received: by 2002:a17:902:7e05:: with SMTP id
 b5mr6770780plm.27.1643350135555; 
 Thu, 27 Jan 2022 22:08:55 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id h5sm7743182pfi.111.2022.01.27.22.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 22:08:55 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v6 0/3] Add support modifiers for drivers whose planes
 only support linear layout
Date: Fri, 28 Jan 2022 15:08:33 +0900
Message-Id: <20220128060836.11216-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Tomohito Esaki <etom@igel.co.jp>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Simon Ser <contact@emersion.fr>,
 Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Some drivers whose planes only support linear layout fb do not support format
modifiers.
These drivers should support modifiers, however the DRM core should handle this
rather than open-coding in every driver.

In this patch series, these drivers expose format modifiers based on the
following suggestion[1].

On Thu, Nov 18, 2021 at 01:02:11PM +0000, Daniel Stone wrote:
> I think the best way forward here is:
>   - add a new mode_config.cannot_support_modifiers flag, and enable
> this in radeon (plus any other drivers in the same boat)
>   - change drm_universal_plane_init() to advertise the LINEAR modifier
> when NULL is passed as the modifier list (including installing a
> default .format_mod_supported hook)
>   - remove the mode_config.allow_fb_modifiers hook and always
> advertise modifier support, unless
> mode_config.cannot_support_modifiers is set


[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20190509054518.10781-1-etom@igel.co.jp/#24602575

v6:
* add Reviewed-by and Acked-by
* add a changelog per-patch

v5: https://www.spinics.net/lists/dri-devel/msg330860.html
* rebase to the latest master branch (5.17-rc1+)
	+ "drm/plane: Make format_mod_supported truly optional" patch [2]
  [2] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

* change default_modifiers array from non-static to static
* remove terminator in default_modifiers array
* use ARRAY_SIZE to get the format_modifier_count
* keep a sanity check in plane init func
* modify several kerneldocs

v4: https://www.spinics.net/lists/dri-devel/msg329508.html
* modify documentation for fb_modifiers_not_supported flag in kerneldoc

v3: https://www.spinics.net/lists/dri-devel/msg329102.html
* change the order as follows:
   1. add fb_modifiers_not_supported flag
   2. add default modifiers
   3. remove allow_fb_modifiers flag
* add a conditional disable in amdgpu_dm_plane_init()

v2: https://www.spinics.net/lists/dri-devel/msg328939.html
* rebase to the latest master branch (5.16.0+)
      + "drm/plane: Make format_mod_supported truly optional" patch [2]

v1: https://www.spinics.net/lists/dri-devel/msg327352.html
* The initial patch set

Tomohito Esaki (3):
  drm: introduce fb_modifiers_not_supported flag in mode_config
  drm: add support modifiers for drivers whose planes only support
    linear layout
  drm: remove allow_fb_modifiers

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++---
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 ++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
 drivers/gpu/drm/drm_framebuffer.c             |  6 ++---
 drivers/gpu/drm/drm_ioctl.c                   |  2 +-
 drivers/gpu/drm/drm_plane.c                   | 23 +++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 +++--
 drivers/gpu/drm/radeon/radeon_display.c       |  2 ++
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 -
 include/drm/drm_mode_config.h                 | 18 +++++----------
 include/drm/drm_plane.h                       |  3 +++
 14 files changed, 45 insertions(+), 32 deletions(-)

-- 
2.25.1

