Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F821441AA
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jan 2020 17:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1186ED82;
	Tue, 21 Jan 2020 16:08:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771B6FADC;
 Tue, 21 Jan 2020 14:01:05 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 958CB80426FF5DF4520E;
 Tue, 21 Jan 2020 22:00:58 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Tue, 21 Jan 2020 22:00:50 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next 06/14] drm/amdgpu: remove unnecessary conversion to bool
 in athub_v1_0.c
Date: Tue, 21 Jan 2020 21:55:32 +0800
Message-ID: <20200121135540.165798-7-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121135540.165798-1-chenzhou10@huawei.com>
References: <20200121135540.165798-1-chenzhou10@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 21 Jan 2020 16:08:17 +0000
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
Cc: chenzhou10@huawei.com, Felix.Kuehling@amd.com, tao.zhou1@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Hawking.Zhang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

./drivers/gpu/drm/amd/amdgpu/athub_v1_0.c:77:40-45: WARNING:
	conversion to bool not needed here
./drivers/gpu/drm/amd/amdgpu/athub_v1_0.c:79:40-45: WARNING:
	conversion to bool not needed here

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/athub_v1_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
index d9cc746..847ca9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v1_0.c
@@ -74,9 +74,9 @@ int athub_v1_0_set_clockgating(struct amdgpu_device *adev,
 	case CHIP_VEGA20:
 	case CHIP_RAVEN:
 		athub_update_medium_grain_clock_gating(adev,
-				state == AMD_CG_STATE_GATE ? true : false);
+				state == AMD_CG_STATE_GATE);
 		athub_update_medium_grain_light_sleep(adev,
-				state == AMD_CG_STATE_GATE ? true : false);
+				state == AMD_CG_STATE_GATE);
 		break;
 	default:
 		break;
-- 
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
