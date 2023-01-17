Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442966D7FF
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Jan 2023 09:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A1A10E50A;
	Tue, 17 Jan 2023 08:22:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F089E10E2C5;
 Tue, 17 Jan 2023 05:57:55 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VZlg57-_1673935061; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VZlg57-_1673935061) by smtp.aliyun-inc.com;
 Tue, 17 Jan 2023 13:57:51 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 1/3] drm/amd/display: Remove the unused variable optc
Date: Tue, 17 Jan 2023 13:57:34 +0800
Message-Id: <20230117055736.50883-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 17 Jan 2023 08:22:21 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Variable optc is not effectively used, so delete it.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_hwseq.c:325:27: warning: variable ‘optc’ set but not used.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3782
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
index 7360b3ce4283..bae6e3b52546 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
@@ -322,13 +322,11 @@ void dcn30_enable_writeback(
 {
 	struct dwbc *dwb;
 	struct mcif_wb *mcif_wb;
-	struct timing_generator *optc;
 
 	dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
 	mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
 
 	/* set the OPTC source mux */
-	optc = dc->res_pool->timing_generators[dwb->otg_inst];
 	DC_LOG_DWB("%s dwb_pipe_inst = %d, mpcc_inst = %d",\
 		__func__, wb_info->dwb_pipe_inst,\
 		wb_info->mpcc_inst);
-- 
2.20.1.7.g153144c

