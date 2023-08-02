Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38F76C665
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Aug 2023 09:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D0010E4DA;
	Wed,  2 Aug 2023 07:20:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out28-105.mail.aliyun.com (out28-105.mail.aliyun.com
 [115.124.28.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5224710E48A;
 Wed,  2 Aug 2023 03:01:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6778054|-1; BR=01201311R191b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_alarm|0.00750567-0.000314579-0.99218;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=sunran001@208suo.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.U6NhAFy_1690945271; 
Received: from localhost.localdomain(mailfrom:sunran001@208suo.com
 fp:SMTPD_---.U6NhAFy_1690945271) by smtp.aliyun-inc.com;
 Wed, 02 Aug 2023 11:01:13 +0800
From: Ran Sun <sunran001@208suo.com>
To: alexander.deucher@amd.com
Subject: [PATCH] drm/amd/display: Clean up errors in dcn316_clk_mgr.c
Date: Wed,  2 Aug 2023 03:01:11 +0000
Message-Id: <20230802030111.10658-1-sunran001@208suo.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 02 Aug 2023 07:20:04 +0000
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
Cc: Ran Sun <sunran001@208suo.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
index 0349631991b8..09151cc56ce4 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -45,13 +45,11 @@
 #define MAX_INSTANCE                                        7
 #define MAX_SEGMENT                                         6
 
-struct IP_BASE_INSTANCE
-{
+struct IP_BASE_INSTANCE {
     unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
+struct IP_BASE {
     struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 };
 
-- 
2.17.1

