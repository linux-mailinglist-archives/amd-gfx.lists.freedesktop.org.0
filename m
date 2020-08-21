Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E51224DA6D
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Aug 2020 18:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E06C6EB83;
	Fri, 21 Aug 2020 16:20:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF286EB83;
 Fri, 21 Aug 2020 16:20:26 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA7AC22D02;
 Fri, 21 Aug 2020 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026826;
 bh=tlTF8E8wCpC1Qkz2QnzGhofEoJGVooxBzEgBu1YNSlk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gyydPQLle/jSJMOJF9r2PrJa+hvojJcJSA0W2XMTyW0ERrKu2ZhnQyDs2P2fHRDHb
 KlO1ybUJuXKDOfNQGpVaRXOu8mwIAd9Pm1YMZ7+551My9eDVTWWg98m4c8Ur5ItLXD
 PIM+wYMYakdFQflQOaX/CrS4GIlNKxPyi++eKwmY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 09/22] drm/amdgpu: fix ref count leak in
 amdgpu_display_crtc_set_config
Date: Fri, 21 Aug 2020 12:20:01 -0400
Message-Id: <20200821162014.349506-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821162014.349506-1-sashal@kernel.org>
References: <20200821162014.349506-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Navid Emamdoost <navid.emamdoost@gmail.com>

[ Upstream commit e008fa6fb41544b63973a529b704ef342f47cc65 ]

in amdgpu_display_crtc_set_config, the call to pm_runtime_get_sync
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index c555781685ea8..d3ee8f19f1ef9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -296,7 +296,7 @@ int amdgpu_crtc_set_config(struct drm_mode_set *set)
 
 	ret = pm_runtime_get_sync(dev->dev);
 	if (ret < 0)
-		return ret;
+		goto out;
 
 	ret = drm_crtc_helper_set_config(set);
 
@@ -311,7 +311,7 @@ int amdgpu_crtc_set_config(struct drm_mode_set *set)
 	   take the current one */
 	if (active && !adev->have_disp_power_ref) {
 		adev->have_disp_power_ref = true;
-		return ret;
+		goto out;
 	}
 	/* if we have no active crtcs, then drop the power ref
 	   we got before */
@@ -320,6 +320,7 @@ int amdgpu_crtc_set_config(struct drm_mode_set *set)
 		adev->have_disp_power_ref = false;
 	}
 
+out:
 	/* drop the power reference we got coming in here */
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
