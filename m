Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 222C912417C
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Dec 2019 09:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B0B6E25B;
	Wed, 18 Dec 2019 08:19:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 924 seconds by postgrey-1.36 at gabe;
 Wed, 18 Dec 2019 04:05:39 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2226E21F;
 Wed, 18 Dec 2019 04:05:39 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 568B0C2EA5E7B3D2AF41;
 Wed, 18 Dec 2019 11:50:12 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 18 Dec 2019
 11:50:05 +0800
From: Pan Zhang <zhangpan26@huawei.com>
To: <zhangpan26@huawei.com>, <hushiyuan@huawei.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sam@ravnborg.org>
Subject: [PATCH 1/3] gpu: drm: dead code elimination
Date: Wed, 18 Dec 2019 11:49:48 +0800
Message-ID: <1576640988-14639-1-git-send-email-zhangpan26@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:19:43 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

this set adds support for removal of gpu drm dead code.

patch1:
`num` is a data of u8 type and ATOM_MAX_HW_I2C_READ == 255, 

so there is a impossible condition '(num > 255) => (0-255 > 255)'.

Signed-off-by: Pan Zhang <zhangpan26@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_i2c.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
index 980c363..b4cc7c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_i2c.c
@@ -76,11 +76,6 @@ static int amdgpu_atombios_i2c_process_i2c_ch(struct amdgpu_i2c_chan *chan,
 		}
 		args.lpI2CDataOut = cpu_to_le16(out);
 	} else {
-		if (num > ATOM_MAX_HW_I2C_READ) {
-			DRM_ERROR("hw i2c: tried to read too many bytes (%d vs 255)\n", num);
-			r = -EINVAL;
-			goto done;
-		}
 		args.ucRegIndex = 0;
 		args.lpI2CDataOut = 0;
 	}
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
