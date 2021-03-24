Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9668347936
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Mar 2021 14:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE286E9F9;
	Wed, 24 Mar 2021 13:05:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035436E993;
 Wed, 24 Mar 2021 09:17:14 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F52cb6gM8zPlk3;
 Wed, 24 Mar 2021 17:14:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 17:17:07 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH drm/amdgpu 0/2] Convert sysfs sprintf/snprintf family to
 sysfs_emit 
Date: Wed, 24 Mar 2021 17:17:39 +0800
Message-ID: <1616577461-18556-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 24 Mar 2021 13:05:10 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Use the generic sysfs_emit() function to take place of
snprintf/scnprintf, to avoid buffer overrun.

Tian Tao (2):
  drm/amdgpu: Convert sysfs sprintf/snprintf family to sysfs_emit
  drm/amd/pm: Convert sysfs sprintf/snprintf family to sysfs_emit

 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c  |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c      |  8 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 32 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c         |  2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c           | 88 ++++++++++++++--------------
 9 files changed, 73 insertions(+), 79 deletions(-)

-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
