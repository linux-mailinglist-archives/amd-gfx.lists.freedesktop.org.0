Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BB1C72D1
	for <lists+amd-gfx@lfdr.de>; Wed,  6 May 2020 16:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E4E6E88F;
	Wed,  6 May 2020 14:27:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65F189830;
 Wed,  6 May 2020 14:26:32 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F35C9F10AE2D0470E080;
 Wed,  6 May 2020 22:26:26 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 22:26:18 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 00/14] drm/radeon: remove comparison to bool
Date: Wed, 6 May 2020 22:33:12 +0800
Message-ID: <20200506143326.66467-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 14:27:48 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zheng Bin (14):
  drm/radeon: remove comparison to bool in btc_dpm.c
  drm/radeon: remove comparison to bool in ci_dpm.c
  drm/radeon: remove comparison to bool in ni_dpm.c
  drm/radeon: remove comparison to bool in radeon_atpx_handler.c
  drm/radeon: remove comparison to bool in radeon_object.c
  drm/radeon: remove comparison to bool in radeon_ttm.c
  drm/radeon: remove comparison to bool in r100.c
  drm/radeon: remove comparison to bool in r300.c
  drm/radeon: remove comparison to bool in r600.c
  drm/radeon: remove comparison to bool in rs600.c
  drm/radeon: remove comparison to bool in rs690.c
  drm/radeon: remove comparison to bool in rv6xx_dpm.c
  drm/radeon: remove comparison to bool in rv515.c
  drm/radeon: remove comparison to bool in si_dpm.c

 drivers/gpu/drm/radeon/btc_dpm.c             | 2 +-
 drivers/gpu/drm/radeon/ci_dpm.c              | 4 ++--
 drivers/gpu/drm/radeon/ni_dpm.c              | 6 +++---
 drivers/gpu/drm/radeon/r100.c                | 2 +-
 drivers/gpu/drm/radeon/r300.c                | 2 +-
 drivers/gpu/drm/radeon/r600.c                | 3 ++-
 drivers/gpu/drm/radeon/radeon_atpx_handler.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_object.c       | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c          | 2 +-
 drivers/gpu/drm/radeon/rs600.c               | 2 +-
 drivers/gpu/drm/radeon/rs690.c               | 3 ++-
 drivers/gpu/drm/radeon/rv515.c               | 2 +-
 drivers/gpu/drm/radeon/rv6xx_dpm.c           | 2 +-
 drivers/gpu/drm/radeon/si_dpm.c              | 6 +++---
 14 files changed, 22 insertions(+), 20 deletions(-)

--
2.26.0.106.g9fadedd

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
