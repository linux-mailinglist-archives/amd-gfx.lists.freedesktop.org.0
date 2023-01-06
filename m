Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11665FCB5
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Jan 2023 09:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65CE10E83E;
	Fri,  6 Jan 2023 08:27:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jan 2023 00:30:02 UTC
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DE810E08E;
 Fri,  6 Jan 2023 00:30:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R761e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=yang.lee@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VYxFzUl_1672964695; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0VYxFzUl_1672964695) by smtp.aliyun-inc.com;
 Fri, 06 Jan 2023 08:24:55 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: alexander.deucher@amd.com
Subject: [PATCH -next] drm/amd/display: Remove unneeded semicolon
Date: Fri,  6 Jan 2023 08:24:53 +0800
Message-Id: <20230106002453.18770-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Jan 2023 08:27:47 +0000
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
Cc: , ""@amd.com, sunpeng.li@amd.com, airlied@gmail.com,
	Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	Abaci Robot <abaci@linux.alibaba.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
	harry.wentland@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7431:3-4: Unneeded semicolon
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7485:4-5: Unneeded semicolon
./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7489:3-4: Unneeded semicolon

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3635
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cabe02cb307c..90dc72e98eb2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7428,7 +7428,7 @@ static bool is_content_protection_different(struct drm_crtc_state *new_crtc_stat
 			new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
 			pr_debug("[HDCP_DM] ENABLED->DESIRED & mode_changed %s :true\n", __func__);
 			return true;
-		};
+		}
 		new_conn_state->content_protection = DRM_MODE_CONTENT_PROTECTION_ENABLED;
 		pr_debug("[HDCP_DM] ENABLED -> DESIRED %s :false\n", __func__);
 		return false;
@@ -7482,11 +7482,11 @@ static bool is_content_protection_different(struct drm_crtc_state *new_crtc_stat
 				pr_debug("[HDCP_DM] DESIRED->DESIRED or ENABLE->ENABLE mode_change %s :true\n",
 					__func__);
 				return true;
-			};
+			}
 			pr_debug("[HDCP_DM] DESIRED->DESIRED & ENABLE->ENABLE %s :false\n",
 				__func__);
 			return false;
-		};
+		}
 
 		pr_debug("[HDCP_DM] UNDESIRED->UNDESIRED %s :false\n", __func__);
 		return false;
-- 
2.20.1.7.g153144c

