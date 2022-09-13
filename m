Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2225B6D84
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Sep 2022 14:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5B010E6EA;
	Tue, 13 Sep 2022 12:46:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B5210E644;
 Tue, 13 Sep 2022 08:38:39 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VPf.XZx_1663058314; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VPf.XZx_1663058314) by smtp.aliyun-inc.com;
 Tue, 13 Sep 2022 16:38:36 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH 4/5] drm/amd/display: make mpc32_program_shaper and
 mpc32_program_3dlut static
Date: Tue, 13 Sep 2022 16:38:04 +0800
Message-Id: <20220913083805.22549-4-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
In-Reply-To: <20220913083805.22549-1-jiapeng.chong@linux.alibaba.com>
References: <20220913083805.22549-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Sep 2022 12:46:43 +0000
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

These two functions are not used outside the function dcn32_mpc.c, so the
modification is defined as static.

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mpc.c:704:6: warning: no previous prototype for ‘mpc32_program_shaper’.
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_mpc.c:900:6: warning: no previous prototype for ‘mpc32_program_3dlut’.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2115
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
index 357bd2461bc9..f4bc77972c4e 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
@@ -701,7 +701,7 @@ static void mpc32_power_on_shaper_3dlut(
 }
 
 
-bool mpc32_program_shaper(
+static bool mpc32_program_shaper(
 		struct mpc *mpc,
 		const struct pwl_params *params,
 		uint32_t mpcc_id)
@@ -897,7 +897,7 @@ static void mpc32_set_3dlut_mode(
 }
 
 
-bool mpc32_program_3dlut(
+static bool mpc32_program_3dlut(
 		struct mpc *mpc,
 		const struct tetrahedral_params *params,
 		int mpcc_id)
-- 
2.20.1.7.g153144c

