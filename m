Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437AC195294
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 09:08:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21866E9D3;
	Fri, 27 Mar 2020 08:08:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC7856E939;
 Thu, 26 Mar 2020 21:15:26 +0000 (UTC)
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id 710E62C1F8A;
 Thu, 26 Mar 2020 22:10:05 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 0/6] gpu: convert to use new I2C API
Date: Thu, 26 Mar 2020 22:09:58 +0100
Message-Id: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Mar 2020 08:08:39 +0000
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
Cc: nouveau@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We are deprecating calls which return NULL in favor of new variants which
return an ERR_PTR. Only build tested.


Wolfram Sang (6):
  drm/amdgpu: convert to use i2c_new_client_device()
  drm/gma500: convert to use i2c_new_client_device()
  drm/i2c/sil164: convert to use i2c_new_client_device()
  drm/i2c/tda998x: convert to use i2c_new_client_device()
  drm/nouveau/therm: convert to use i2c_new_client_device()
  drm/radeon: convert to use i2c_new_client_device()

 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c        | 2 +-
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c     | 8 ++++----
 drivers/gpu/drm/i2c/sil164_drv.c               | 7 +++++--
 drivers/gpu/drm/i2c/tda998x_drv.c              | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/ic.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_atombios.c       | 4 ++--
 drivers/gpu/drm/radeon/radeon_combios.c        | 4 ++--
 7 files changed, 19 insertions(+), 16 deletions(-)

-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
