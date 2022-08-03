Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0601589840
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Aug 2022 09:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E506A8F54E;
	Thu,  4 Aug 2022 07:20:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from qq.com (smtpbg411.qq.com [113.96.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAAE411B3CF;
 Wed,  3 Aug 2022 09:28:34 +0000 (UTC)
X-QQ-mid: bizesmtp66t1659518435tcy4ogi5
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 03 Aug 2022 17:20:25 +0800 (CST)
X-QQ-SSF: 01400000002000C0K000B00C0000000
X-QQ-FEAT: W+onFc5Tw4Oqh24lEr6B3ZCNdcvNCXFqy6OaiwkY2QHg01q4ATXn1a1pNwxZ9
 Y6Gu1Bpl97AUGZvxhHIP+g7kk06IUPlPHByajYAGo06oAZOf1moP64qya5i8AF+rMvwTu0c
 fOiF7LF6TFeHqp+KAC/DwjxbHnXlHsfeM5syB9KMliraFdhiGM9Tryw9TMLvT0n1LmM5cWo
 23KPdWlp/YqFVsqcCp5wGN6eh/syehFN1+ay2w5I6hAcda9xZdaoJatO6SiGOAHTQ8matE2
 BhF9NJQo+x2dRjc4/lMjyudv3erE6bwhSpvvS1Do4eFwxkwuwWecFGnCk8wOYVoufGLLQve
 Qf47s0f8g1mOZzxk+lnDamh+3YLdyEmyY1Q9vTDrEeAqUsEiROmPTN0msvW8CRyH39ixVez
 lVSqgX7xUN15830BtoV87w==
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: airlied@linux.ie, daniel@ffwll.ch, evan.quan@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 2/2] drm/amd/pm: Fix a potential gpu_metrics_table memory leak
Date: Wed,  3 Aug 2022 17:19:59 +0800
Message-Id: <20220803091959.10030-2-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220803091959.10030-1-nizhen@uniontech.com>
References: <20220803091959.10030-1-nizhen@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign9
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Thu, 04 Aug 2022 07:20:42 +0000
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
Cc: Zhen Ni <nizhen@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Memory is allocated for gpu_metrics_table in
smu_v13_0_5_init_smc_tables(), but not freed in
smu_v13_0_5_fini_smc_tables(). This may cause memory leaks, fix it.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
index b81711c4ff33..267c9c43a010 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_5_ppt.c
@@ -167,6 +167,9 @@ static int smu_v13_0_5_fini_smc_tables(struct smu_context *smu)
 	kfree(smu_table->watermarks_table);
 	smu_table->watermarks_table = NULL;
 
+	kfree(smu_table->gpu_metrics_table);
+	smu_table->gpu_metrics_table = NULL;
+
 	return 0;
 }
 
-- 
2.20.1



