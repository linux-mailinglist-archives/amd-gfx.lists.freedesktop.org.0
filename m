Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9F12981C
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Dec 2019 16:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8B06E2DA;
	Mon, 23 Dec 2019 15:26:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291D589D4D;
 Mon, 23 Dec 2019 13:39:12 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D517C8AB8EB557311203;
 Mon, 23 Dec 2019 21:39:07 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Dec 2019
 21:39:00 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/5] drm/amdgpu: use true,false for bool variable
Date: Mon, 23 Dec 2019 21:46:16 +0800
Message-ID: <1577108781-68614-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 15:26:04 +0000
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

zhengbin (5):
  drm/amdgpu: use true,false for bool variable in mxgpu_ai.c
  drm/amdgpu: use true,false for bool variable in mxgpu_nv.c
  drm/amdgpu: use true,false for bool variable in amdgpu_device.c
  drm/amdgpu: use true,false for bool variable in amdgpu_debugfs.c
  drm/amdgpu: use true,false for bool variable in amdgpu_psp.c

 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c     | 12 ++++++------
 drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c       |  4 ++--
 drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c       |  4 ++--
 5 files changed, 15 insertions(+), 15 deletions(-)

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
