Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10867753ED
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Aug 2023 09:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9D10E254;
	Wed,  9 Aug 2023 07:14:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D0B10E130;
 Wed,  9 Aug 2023 03:45:29 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RLGBl4YvDz1GDtg;
 Wed,  9 Aug 2023 11:44:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:45:24 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
 <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
 <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <bskeggs@redhat.com>, <kherbst@redhat.com>,
 <lyude@redhat.com>, <kraxel@redhat.com>, <gurchetansingh@chromium.org>,
 <olvaffe@gmail.com>, <paulo.miguel.almeida.rodenas@gmail.com>,
 <wenjing.liu@amd.com>, <haoping.liu@amd.com>, <Charlene.Liu@amd.com>,
 <chiahsuan.chung@amd.com>, <george.shen@amd.com>, <sancchen@amd.com>,
 <tony.tascioglu@amd.com>, <jaehyun.chung@amd.com>,
 <tales.aparecida@gmail.com>, <drv@mailo.com>, <aurabindo.pillai@amd.com>,
 <quic_vpolimer@quicinc.com>, <jiasheng@iscas.ac.cn>, <noralf@tronnes.org>,
 <jose.exposito89@gmail.com>, <javierm@redhat.com>, <mairacanal@riseup.net>,
 <davidgow@google.com>, <arthurgrillo@riseup.net>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <virtualization@lists.linux-foundation.org>
Subject: [PATCH -next 2/7] drm/amd/display: Remove unnecessary NULL values
Date: Wed, 9 Aug 2023 11:44:40 +0800
Message-ID: <20230809034445.434902-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Aug 2023 07:14:50 +0000
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
Cc: ruanjinjie@huawei.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  | 4 ++--
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
index 4f005ae1516c..6b3190447581 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
@@ -96,7 +96,7 @@ struct dc_bios *bios_parser_create(
 	struct bp_init_data *init,
 	enum dce_version dce_version)
 {
-	struct bios_parser *bp = NULL;
+	struct bios_parser *bp;
 
 	bp = kzalloc(sizeof(struct bios_parser), GFP_KERNEL);
 	if (!bp)
@@ -2576,7 +2576,7 @@ static struct integrated_info *bios_parser_create_integrated_info(
 	struct dc_bios *dcb)
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	struct integrated_info *info = NULL;
+	struct integrated_info *info;
 
 	info = kzalloc(sizeof(struct integrated_info), GFP_KERNEL);
 
diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 540d19efad8f..c7b3359f1e1d 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -3086,7 +3086,7 @@ static struct integrated_info *bios_parser_create_integrated_info(
 	struct dc_bios *dcb)
 {
 	struct bios_parser *bp = BP_FROM_DCB(dcb);
-	struct integrated_info *info = NULL;
+	struct integrated_info *info;
 
 	info = kzalloc(sizeof(struct integrated_info), GFP_KERNEL);
 
@@ -3675,7 +3675,7 @@ struct dc_bios *firmware_parser_create(
 	struct bp_init_data *init,
 	enum dce_version dce_version)
 {
-	struct bios_parser *bp = NULL;
+	struct bios_parser *bp;
 
 	bp = kzalloc(sizeof(struct bios_parser), GFP_KERNEL);
 	if (!bp)
-- 
2.34.1

