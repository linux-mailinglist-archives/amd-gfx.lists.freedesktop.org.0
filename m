Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04772627F1
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Sep 2020 09:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364E6E9EA;
	Wed,  9 Sep 2020 07:05:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D633C6E828;
 Tue,  8 Sep 2020 13:35:09 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 771094165174DAF404A8;
 Tue,  8 Sep 2020 21:35:03 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Sep 2020 21:34:55 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/display: Remove duplicate include
Date: Tue, 8 Sep 2020 21:35:52 +0800
Message-ID: <20200908133552.105282-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:05:18 +0000
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
Cc: chenzhou10@huawei.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Remove duplicate header which is included twice.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index a5d750ed569e..65dc5dcd4eb8 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -35,7 +35,6 @@
 #include "dcn30_dpp.h"
 #include "dcn10/dcn10_cm_common.h"
 #include "dcn30_cm_common.h"
-#include "clk_mgr.h"
 #include "reg_helper.h"
 #include "abm.h"
 #include "clk_mgr.h"
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
