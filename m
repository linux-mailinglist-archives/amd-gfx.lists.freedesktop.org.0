Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5A4C95B9
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Mar 2022 21:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E3710E175;
	Tue,  1 Mar 2022 20:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D851210E155;
 Tue,  1 Mar 2022 20:15:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3B82D6170C;
 Tue,  1 Mar 2022 20:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF95FC340EE;
 Tue,  1 Mar 2022 20:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646165746;
 bh=Qw/TSEqu3187tiIZfPiCaoDI+0CGQKmUat2XoI5t67w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=raWlfxiQUB/mtltp0PdCry0pfx6QCBjmsN1M1JpJxVCyR5NqzmTr00Zbhi6WdQbKy
 mAMgv1eHZ93lM7FgKyShvrn/o4moDIGrOXIPRKvux51B7qpqrHq8X0HLffdCAxKqO2
 3n/GkKotSGy/JMOjjbHuitNgZiFqPRQQdvcEWhNVhOLDDQpOLuRw+tr4qjrUeU5pNc
 fe5Z7BJnpzNJsTeoSHdxaLtgYnco5cI3OvJiYDgsFA3dyDo6Y6mq4peLvo/b482JZb
 G6o+hIFWG7nvBLRZA5nxC13t3BYc5sNpEMnaSLclDwJB0M7r6opgGReR9eKz3Wv09P
 xwXdVR72Baxzg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 20/28] drm/amdgpu: bypass tiling flag check in
 virtual display case (v2)
Date: Tue,  1 Mar 2022 15:13:25 -0500
Message-Id: <20220301201344.18191-20-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301201344.18191-1-sashal@kernel.org>
References: <20220301201344.18191-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, markyacoub@chromium.org,
 Guchun Chen <guchun.chen@amd.com>, airlied@linux.ie, contact@emersion.fr,
 qingqing.zhuo@amd.com, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 mdaenzer@redhat.com, seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, bas@basnieuwenhuizen.nl,
 Alex Deucher <alexander.deucher@amd.com>, Leslie Shi <Yuliang.Shi@amd.com>,
 evan.quan@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Guchun Chen <guchun.chen@amd.com>

[ Upstream commit e2b993302f40c4eb714ecf896dd9e1c5be7d4cd7 ]

vkms leverages common amdgpu framebuffer creation, and
also as it does not support FB modifier, there is no need
to check tiling flags when initing framebuffer when virtual
display is enabled.

This can fix below calltrace:

amdgpu 0000:00:08.0: GFX9+ requires FB check based on format modifier
WARNING: CPU: 0 PID: 1023 at drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:1150 amdgpu_display_framebuffer_init+0x8e7/0xb40 [amdgpu]

v2: check adev->enable_virtual_display instead as vkms can be
	enabled in bare metal as well.

Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index dc50c05f23fc2..5c08047adb594 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1145,7 +1145,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	if (!dev->mode_config.allow_fb_modifiers) {
+	if (!dev->mode_config.allow_fb_modifiers && !adev->enable_virtual_display) {
 		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
 			      "GFX9+ requires FB check based on format modifier\n");
 		ret = check_tiling_flags_gfx6(rfb);
-- 
2.34.1

