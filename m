Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46A263ECA
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Sep 2020 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350D96E32D;
	Thu, 10 Sep 2020 07:29:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9767A6EB52;
 Wed,  9 Sep 2020 13:00:37 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 65E8EBEA3453F427F1BC;
 Wed,  9 Sep 2020 21:00:33 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:00:25 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
Date: Wed, 9 Sep 2020 21:07:12 +0800
Message-ID: <20200909130720.105234-1-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 10 Sep 2020 07:29:37 +0000
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
Cc: zhengbin13@huawei.com, yi.zhang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Zheng Bin (8):
  drm/amd/amdgpu: fix comparison pointer to bool warning in gfx_v9_0.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in gfx_v10_0.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v5_0.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v5_2.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in si.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in uvd_v6_0.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in
    amdgpu_atpx_handler.c
  drm/amd/amdgpu: fix comparison pointer to bool warning in sdma_v4_0.c

 drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c            | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/si.c                  | 2 +-
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c            | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

--
2.26.0.106.g9fadedd

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
