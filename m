Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E3B3A01B
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Aug 2025 16:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960DD10E13B;
	Thu, 28 Aug 2025 14:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="By2IbqEc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9410E075
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Aug 2025 14:09:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9062640AE7;
 Thu, 28 Aug 2025 14:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1188BC4CEEB;
 Thu, 28 Aug 2025 14:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756390144;
 bh=ic6R+sJyjqQoFlOq8YEWOADbVe3Yol3MqdIbaeRkzNM=;
 h=From:To:Cc:Subject:Date:From;
 b=By2IbqEck5f4bPC8zZIxrhxGzCHwykCjFrCVh4xeg0ebND5dORq1ZdnXnw+W8W0Ro
 c8yI6yEpCfl+Tljr/haG6t+imjFSoHyKDHWchbruRykn56Nyq5MQxFAGcpnujRseS3
 BsSaykqV+ayB73oV0A2rrgNL7RtPM7X8BJbbZu4K9D12TBsGFr68YIfJ0DOMlZ0gpC
 PFHDiGFnUd6PsFWVnXdJweOe4bHFHSboWly+580V8H7gbonClE81Wn/4J3G3aE69VU
 y/7tlUiCoBEEKjP/+pIebq2SA/AMoskVVf2xO9T8dym3ZoKY75CL/e8qT4TzMlmLx8
 BCQ4V/nX0STVQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: amd-gfx@lists.freedesktop.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [PATCH] drm/amd: Re-enable common modes for eDP and LVDS
Date: Thu, 28 Aug 2025 09:08:56 -0500
Message-ID: <20250828140856.2887993-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

[Why]
Although compositors will add their own modes, Xorg won't use it's own
modes and will only stick to modes advertised by the driver. This mean a
user that used to pick 1024x768 could no longer access it unless the
panel's native resolution was 1024x768.

[How]
Revert commit 6d396e7ac1ce3 ("drm/amd/display: Disable common modes for
LVDS") and commit 7948afb46af92 ("drm/amd/display: Disable common modes
for eDP").

The panel will still use scaling for any non-native modes due to
commit 978fa2f6d0b12 ("drm/amd/display: Use scaling for non-native
resolutions on eDP")

Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4538
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d533bd633f163..bb156c26a08ee 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8440,8 +8440,7 @@ static int amdgpu_dm_connector_get_modes(struct drm_connector *connector)
 				drm_add_modes_noedid(connector, 1920, 1080);
 	} else {
 		amdgpu_dm_connector_ddc_get_modes(connector, drm_edid);
-		if (encoder && (connector->connector_type != DRM_MODE_CONNECTOR_eDP) &&
-		    (connector->connector_type != DRM_MODE_CONNECTOR_LVDS))
+		if (encoder)
 			amdgpu_dm_connector_add_common_modes(encoder, connector);
 		amdgpu_dm_connector_add_freesync_modes(connector, drm_edid);
 	}
-- 
2.43.0

