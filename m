Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93335540785
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jun 2022 19:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D3910F0FD;
	Tue,  7 Jun 2022 17:51:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3980310F0C6;
 Tue,  7 Jun 2022 17:51:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A932EB80B66;
 Tue,  7 Jun 2022 17:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C0B8C3411C;
 Tue,  7 Jun 2022 17:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624311;
 bh=CFfPA94IscgZauYe5PcDNGb7kJxSY6aENgveDQCHbKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VvxrnL1XIc6ajsCZQijyKqbYFTZV4E0mSRzZJ4q/nM7HfabnPitcZah7Xt2a1Vk4s
 tro2tL4vFXqNMYfShAryAeKmc/7wLdnDlYnIOdWWSamemAcd4GdbOl/5TCox0nu9k8
 /xMmKDeD/DHN9tp/gUOWDkeP48nM458v9DkcJ9Z7C2j2sHQN+b1a+rBIS2a8uXDnvo
 kuBtxx9uw2iWXes385uENVdNDSbhc+hWijBXRR2hdRQLUzCMQWlepID+lqK9cs3rU8
 RtzpSOcMuAsL0z0cy8NXS6QFzHE4ssAfVM9tM/u8iSiUvdyPwCGzG5rH08JeLmG60p
 mtKU8tm2+R+Rw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 47/68] drm/radeon: fix a possible null pointer
 dereference
Date: Tue,  7 Jun 2022 13:48:13 -0400
Message-Id: <20220607174846.477972-47-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Gong Yuanjun <ruc_gongyuanjun@163.com>,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Gong Yuanjun <ruc_gongyuanjun@163.com>

[ Upstream commit a2b28708b645c5632dc93669ab06e97874c8244f ]

In radeon_fp_native_mode(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

The failure status of drm_cvt_mode() on the other path is checked too.

Signed-off-by: Gong Yuanjun <ruc_gongyuanjun@163.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 0cb1345c6ba4..fabe4f4ca124 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -473,6 +473,8 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
 	    native_mode->vdisplay != 0 &&
 	    native_mode->clock != 0) {
 		mode = drm_mode_duplicate(dev, native_mode);
+		if (!mode)
+			return NULL;
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		drm_mode_set_name(mode);
 
@@ -487,6 +489,8 @@ static struct drm_display_mode *radeon_fp_native_mode(struct drm_encoder *encode
 		 * simpler.
 		 */
 		mode = drm_cvt_mode(dev, native_mode->hdisplay, native_mode->vdisplay, 60, true, false, false);
+		if (!mode)
+			return NULL;
 		mode->type = DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER;
 		DRM_DEBUG_KMS("Adding cvt approximation of native panel mode %s\n", mode->name);
 	}
-- 
2.35.1

