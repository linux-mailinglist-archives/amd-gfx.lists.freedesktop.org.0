Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C05B272525
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Sep 2020 15:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB96E351;
	Mon, 21 Sep 2020 13:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD216E2A3
 for <amd-gfx@lists.freedesktop.org>; Mon, 21 Sep 2020 11:42:58 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.125])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id C0EEB4829CC;
 Mon, 21 Sep 2020 19:42:52 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Aric Cyr <aric.cyr@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 abdoulaye berthe <abdoulaye.berthe@amd.com>,
 Michael Strauss <michael.strauss@amd.com>,
 Brandon Syu <Brandon.Syu@amd.com>, Martin Leung <martin.leung@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: optimize code runtime a bit
Date: Mon, 21 Sep 2020 04:42:42 -0700
Message-Id: <20200921114244.20506-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZH0pCTh1OSx5OHU0aVkpNS0tNQ0NOTEhKSkpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6Fjo*Ez8ZLA8oKjpPOgkX
 GFZPCR5VSlVKTUtLTUNDTkxITU1DVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU5ZV1kIAVlBSUxDTDcG
X-HM-Tid: 0a74b0794a8893bakuwsc0eeb4829cc
X-Mailman-Approved-At: Mon, 21 Sep 2020 13:14:30 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Static function dal_ddc_i2c_payloads_destroy is only called
in dal_ddc_service_query_ddc_data, the parameter is &payloads
, there is no point NULL risk, so no need to check.
This change is to make the code run a bit fast.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
index b984eecca58b..6dcc666738fc 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_ddc.c
@@ -150,9 +150,6 @@ static uint32_t dal_ddc_i2c_payloads_get_count(struct i2c_payloads *p)
 
 static void dal_ddc_i2c_payloads_destroy(struct i2c_payloads *p)
 {
-	if (!p)
-		return;
-
 	dal_vector_destruct(&p->payloads);
 }
 
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
