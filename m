Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E5633F11
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Nov 2022 15:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A175C10E3ED;
	Tue, 22 Nov 2022 14:37:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E30310E3CA;
 Tue, 22 Nov 2022 11:12:50 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NGhRj1wllz15Mpn;
 Tue, 22 Nov 2022 19:12:17 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 19:12:46 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 19:12:46 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <lijo.lazar@amd.com>, <Hawking.Zhang@amd.com>
Subject: [PATCH 0/2] drm: Fix PCI device refcount leak
Date: Tue, 22 Nov 2022 19:30:41 +0800
Message-ID: <20221122113043.18715-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 22 Nov 2022 14:37:39 +0000
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
Cc: wangxiongfeng2@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, yangyingliang@huawei.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

As comment of pci_get_class() says, it returns a pci_device with its
refcount increased and decreased the refcount for the input parameter
@from if it is not NULL.

If we use pci_get_class() to iterate all the PCI device of a certain
class, when we find the expected device and break the iteration loop,
the refcount of the found PCI device is increased. When finish using
the PCI device, we need to call pci_dev_put() to decrease the refcount.


Xiongfeng Wang (2):
  drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
  drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()

 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 1 +
 drivers/gpu/drm/radeon/radeon_bios.c     | 1 +
 2 files changed, 2 insertions(+)

-- 
2.20.1

