Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E875262FE
	for <lists+amd-gfx@lfdr.de>; Fri, 13 May 2022 15:34:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B70610E617;
	Fri, 13 May 2022 13:34:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from nksmu.kylinos.cn (mailgw.kylinos.cn [123.150.8.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1A910E59F;
 Fri, 13 May 2022 07:19:57 +0000 (UTC)
X-UUID: 43d5697e530f41e095fe965a3f140368-20220513
X-Spam-Fingerprint: 0
X-GW-Reason: 11101
X-Policy-Incident: 5pS25Lu25Lq66LaF6L+HMTDkurrpnIDopoHlrqHmoLg=
X-Content-Feature: ica/max.line-size 116 audit/email.address 1 meta/cnt.alert 1
X-UUID: 43d5697e530f41e095fe965a3f140368-20220513
Received: from cs2c.com.cn [(172.17.111.24)] by nksmu.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 482741696; Fri, 13 May 2022 14:24:51 +0800
X-ns-mid: postfix-627DF8EE-8540214981
Received: from localhost.localdomain (unknown [172.20.4.120])
 by cs2c.com.cn (NSMail) with ESMTPA id 87CC6383C640;
 Fri, 13 May 2022 06:21:34 +0000 (UTC)
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Remove macro DC_DEFAULT_LOG_MASK
Date: Fri, 13 May 2022 14:20:45 +0800
Message-Id: <20220513062045.840780-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 May 2022 13:34:35 +0000
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
Cc: pengfuyuan <pengfuyuan@kylinos.cn>, Leo Li <sunpeng.li@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
The DC_DEFAULT_LOG_MASK macro has not been used for a long time, so remove it.

Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 .../drm/amd/display/include/logger_types.h    | 33 -------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/include/logger_types.h b/drivers/gpu/drm/amd/display/include/logger_types.h
index f093b49c5e6e..1b38cfc41718 100644
--- a/drivers/gpu/drm/amd/display/include/logger_types.h
+++ b/drivers/gpu/drm/amd/display/include/logger_types.h
@@ -131,37 +131,4 @@ enum dc_log_type {
 #define DC_MIN_LOG_MASK ((1 << LOG_ERROR) | \
 		(1 << LOG_DETECTION_EDID_PARSER))
 
-#define DC_DEFAULT_LOG_MASK ((1ULL << LOG_ERROR) | \
-		(1ULL << LOG_WARNING) | \
-		(1ULL << LOG_EVENT_MODE_SET) | \
-		(1ULL << LOG_EVENT_DETECTION) | \
-		(1ULL << LOG_EVENT_LINK_TRAINING) | \
-		(1ULL << LOG_EVENT_LINK_LOSS) | \
-		(1ULL << LOG_EVENT_UNDERFLOW) | \
-		(1ULL << LOG_RESOURCE) | \
-		(1ULL << LOG_FEATURE_OVERRIDE) | \
-		(1ULL << LOG_DETECTION_EDID_PARSER) | \
-		(1ULL << LOG_DC) | \
-		(1ULL << LOG_HW_HOTPLUG) | \
-		(1ULL << LOG_HW_SET_MODE) | \
-		(1ULL << LOG_HW_RESUME_S3) | \
-		(1ULL << LOG_HW_HPD_IRQ) | \
-		(1ULL << LOG_SYNC) | \
-		(1ULL << LOG_BANDWIDTH_VALIDATION) | \
-		(1ULL << LOG_MST) | \
-		(1ULL << LOG_DETECTION_DP_CAPS) | \
-		(1ULL << LOG_BACKLIGHT)) | \
-		(1ULL << LOG_I2C_AUX) | \
-		(1ULL << LOG_IF_TRACE) | \
-		(1ULL << LOG_HDMI_FRL) | \
-		(1ULL << LOG_SCALER) | \
-		(1ULL << LOG_DTN) /* | \
-		(1ULL << LOG_DEBUG) | \
-		(1ULL << LOG_BIOS) | \
-		(1ULL << LOG_SURFACE) | \
-		(1ULL << LOG_DML) | \
-		(1ULL << LOG_HW_LINK_TRAINING) | \
-		(1ULL << LOG_HW_AUDIO)| \
-		(1ULL << LOG_BANDWIDTH_CALCS)*/
-
 #endif /* __DAL_LOGGER_TYPES_H__ */
-- 
2.25.1

