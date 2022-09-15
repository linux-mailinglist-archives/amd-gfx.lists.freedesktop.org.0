Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF05B927F
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Sep 2022 04:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2484010EA3F;
	Thu, 15 Sep 2022 02:05:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out199-16.us.a.mail.aliyun.com (out199-16.us.a.mail.aliyun.com
 [47.90.199.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8525910EA3D;
 Thu, 15 Sep 2022 02:03:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VPqbkSk_1663207093; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VPqbkSk_1663207093) by smtp.aliyun-inc.com;
 Thu, 15 Sep 2022 09:58:14 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next 5/6] drm/amd/display: clean up some inconsistent
 indentings
Date: Thu, 15 Sep 2022 09:58:01 +0800
Message-Id: <20220915015802.59967-5-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
References: <20220915015802.59967-1-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 15 Sep 2022 02:05:26 +0000
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 Yang Li <yang.lee@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, harry.wentland@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

clean up some inconsistent indentings

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2181
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 2829f179f982..f6ffcf1596bc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -1362,7 +1362,7 @@ static bool CalculatePrefetchSchedule(
 		//                      - ((NumberOfCursors > 0 || GPUVMEnable || DCCEnable) ?
 				- ((GPUVMEnable || myPipe->DCCEnable) ? (*DestinationLinesToRequestVMInVBlank + 2 * *DestinationLinesToRequestRowInVBlank) : 0.0); // TODO: Did someone else add this??
 #else
-				LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch - *DestinationLinesToRequestVMInVBlank - 2 * *DestinationLinesToRequestRowInVBlank;
+		LinesToRequestPrefetchPixelData = *DestinationLinesForPrefetch - *DestinationLinesToRequestVMInVBlank - 2 * *DestinationLinesToRequestRowInVBlank;
 #endif
 
 #ifdef __DML_VBA_DEBUG__
-- 
2.20.1.7.g153144c

