Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2523A0A9C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Jun 2021 05:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8782E6EC77;
	Wed,  9 Jun 2021 03:25:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730A06EC72;
 Wed,  9 Jun 2021 03:02:23 +0000 (UTC)
Received: from Wanjb.localdomain (unknown [36.152.145.182])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 7D0ADAC0056;
 Wed,  9 Jun 2021 11:02:17 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Chris Park <Chris.Park@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Colin Ian King <colin.king@canonical.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: display: Remove duplicated argument in dcn31
Date: Wed,  9 Jun 2021 11:01:46 +0800
Message-Id: <20210609030202.113368-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQh5OH1ZKHk1KTx5JSUhPS0lVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCI6Vjo*GT8TGQwTSTc6NhUV
 OUgwCjdVSlVKTUlISUtMTEhDSENLVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFITElONwY+
X-HM-Tid: 0a79eeb87a0bb039kuuu7d0adac0056
X-Mailman-Approved-At: Wed, 09 Jun 2021 03:25:49 +0000
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
Cc: Wan Jiabing <wanjiabing@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
3539:12-42: duplicated argument to && or ||
./drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c:
5677:87-123: duplicated argument to && or ||

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index d655655baaba..06fac59a3d40 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -3536,7 +3536,7 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
 		*BytePerPixelDETC = 0;
 		*BytePerPixelY = 4;
 		*BytePerPixelC = 0;
-	} else if (SourcePixelFormat == dm_444_16 || SourcePixelFormat == dm_444_16) {
+	} else if (SourcePixelFormat == dm_444_16) {
 		*BytePerPixelDETY = 2;
 		*BytePerPixelDETC = 0;
 		*BytePerPixelY = 2;
@@ -5674,7 +5674,7 @@ void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	for (k = 0; k < v->NumberOfActivePlanes; k++) {
 		if (v->ViewportWidth[k] > v->SurfaceWidthY[k] || v->ViewportHeight[k] > v->SurfaceHeightY[k]) {
 			ViewportExceedsSurface = true;
-			if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32 && v->SourcePixelFormat[k] != dm_444_16
+			if (v->SourcePixelFormat[k] != dm_444_64 && v->SourcePixelFormat[k] != dm_444_32
 					&& v->SourcePixelFormat[k] != dm_444_16 && v->SourcePixelFormat[k] != dm_444_8
 					&& v->SourcePixelFormat[k] != dm_rgbe) {
 				if (v->ViewportWidthChroma[k] > v->SurfaceWidthC[k]
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
