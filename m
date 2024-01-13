Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8382D586
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jan 2024 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3B310E221;
	Mon, 15 Jan 2024 09:07:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Sat, 13 Jan 2024 15:06:04 UTC
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E4BB10E0A3
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Jan 2024 15:06:04 +0000 (UTC)
Received: from fedora.home ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id OfSwrfydhx8edOfSxrsth3; Sat, 13 Jan 2024 15:58:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1705157912;
 bh=JnYvDd18VWfo35gKMLVjd5/prLW9/VQp7P6Jqnl9/PA=;
 h=From:To:Cc:Subject:Date;
 b=kir44wnK0wf42PsE79s0lV9ZTnMfWBhvwoFSmBcMPQKDwVet/JFReH2/+/oTn5M4l
 E2Ycs4G9JwTur31pF2vUm6uzAKojoF9CbBF6Xki9uO/Re1MfxY2UoHdfPQ8+GmoKcG
 UIluLf1z2Oj2jXBZZmy6oB2JTN5udG9ehstu4mB9eOw+abQ/T3joGBhU/M0xdTYs+w
 lSfUI6GCu6r95412oBHX0GAnzk0XAy9+GArbQiCMYaeeEuMLHGJ6JtAeywHadOB66h
 XFS2EF7jAojlK7V3YlWmIpcoxTvKzMNp7GHtMfvTmU6C5M53qy7QYAGFI7z2Qe/FID
 m2+8cURNSRpGg==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 13 Jan 2024 15:58:32 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Roman Li <roman.li@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>
Subject: [PATCH] drm/amd/display: Fix a switch statement in
 populate_dml_output_cfg_from_stream_state()
Date: Sat, 13 Jan 2024 15:58:21 +0100
Message-ID: <e597276a8240329a5ece90762425c7cde2ddd7a2.1705157202.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Jan 2024 09:07:13 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It is likely that the statement related to 'dml_edp' is misplaced. So move
it in the correct "case SIGNAL_TYPE_EDP".

Fixes: 7966f319c66d ("drm/amd/display: Introduce DML2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
index fa6a93dd9629..64d01a9cd68c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_translation_helper.c
@@ -626,8 +626,8 @@ static void populate_dml_output_cfg_from_stream_state(struct dml_output_cfg_st *
 		if (is_dp2p0_output_encoder(pipe))
 			out->OutputEncoder[location] = dml_dp2p0;
 		break;
-		out->OutputEncoder[location] = dml_edp;
 	case SIGNAL_TYPE_EDP:
+		out->OutputEncoder[location] = dml_edp;
 		break;
 	case SIGNAL_TYPE_HDMI_TYPE_A:
 	case SIGNAL_TYPE_DVI_SINGLE_LINK:
-- 
2.43.0

