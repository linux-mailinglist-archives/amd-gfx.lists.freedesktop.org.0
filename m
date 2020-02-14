Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138D15E04E
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Feb 2020 17:13:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104516FAA9;
	Fri, 14 Feb 2020 16:13:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F526FAA9;
 Fri, 14 Feb 2020 16:13:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61724246AA;
 Fri, 14 Feb 2020 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581696800;
 bh=Go9XzXynqboKcqANq7d1ugkt+yBSYuzkBJKoPqz/wW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DMhU9s/YBD3V/kThvyx0rTb0cw9M4WSCLIkw/Cb8XSPc592Gali0PEPPvxtybbOcP
 ex10pMbNUzyllKXQ+7b2soTacfDh2fqUJAp98D+jbxBXNz/5UJ50EA2i+eeYG1fnWk
 etLrR+2vahnWvXnbJ4+81dUwo+jBdcnULMkU8OAc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 072/252] drm/radeon: remove set but not used
 variable 'radeon_connector'
Date: Fri, 14 Feb 2020 11:08:47 -0500
Message-Id: <20200214161147.15842-72-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214161147.15842-1-sashal@kernel.org>
References: <20200214161147.15842-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 zhengbin <zhengbin13@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: zhengbin <zhengbin13@huawei.com>

[ Upstream commit 5952c48993375a9da2de39be30df475cf590b0ce ]

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/radeon/radeon_display.c: In function radeon_crtc_scaling_mode_fixup:
drivers/gpu/drm/radeon/radeon_display.c:1685:27: warning: variable radeon_connector set but not used [-Wunused-but-set-variable]

It is not used since commit 377bd8a98d7d ("drm/radeon:
use a fetch function to get the edid")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_display.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index d8e2d7b3b8365..109915e914218 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -1681,7 +1681,6 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
 	struct radeon_encoder *radeon_encoder;
 	struct drm_connector *connector;
-	struct radeon_connector *radeon_connector;
 	bool first = true;
 	u32 src_v = 1, dst_v = 1;
 	u32 src_h = 1, dst_h = 1;
@@ -1694,7 +1693,6 @@ bool radeon_crtc_scaling_mode_fixup(struct drm_crtc *crtc,
 			continue;
 		radeon_encoder = to_radeon_encoder(encoder);
 		connector = radeon_get_connector_for_encoder(encoder);
-		radeon_connector = to_radeon_connector(connector);
 
 		if (first) {
 			/* set scaling */
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
