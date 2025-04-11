Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A484A866D6
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Apr 2025 22:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7901610EC8A;
	Fri, 11 Apr 2025 20:14:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="chyrdqp5";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2481B10EC84;
 Fri, 11 Apr 2025 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wfXX9S7PCt7NAkisaLJntvVwSvLhMyLTN4HYJqNRzoE=; b=chyrdqp5nKfJ9Gwk8P7aFR3pIE
 I6EPHBebhJ9taL0ysuZmIilXqu8gRLn5cbHOvwqpPPX9/krIJuFtwiSLRxX3xHy29EmqNbSWPd3BP
 maT+G8AZZPHzZ4cQeLmsvyMCTvyqTYZ4j6NuVfSOiehdltT+K5jwSS9iBfQbz8phuR44Iw9wMd/KZ
 0Ew20gsWKTVoFJaqZj/XaaYUYt5zgcK7TP/NKgtGBsTFg4kq81xfAXXANUupY6OlXDsy2zPBs1kmr
 5OesSlgsdBlAF2ph7ni6WGhGZhNiUAPFguonBqCRbZeOJHGKi+1aXiMSF5Piv5OIrJjOovpg9q4dK
 8yf9gJ2A==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3KlB-00FIP5-3M; Fri, 11 Apr 2025 22:13:57 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 03/13] drm/amd/display: parse display name from drm_eld
Date: Fri, 11 Apr 2025 17:08:33 -0300
Message-ID: <20250411201333.151335-4-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250411201333.151335-1-mwen@igalia.com>
References: <20250411201333.151335-1-mwen@igalia.com>
MIME-Version: 1.0
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

We don't need to parse dc_edid to get the display name since it's
already set in drm_eld which in turn had it values updated when updating
connector with the opaque drm_edid.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index e93adb7e48a5..faea6b7fb3f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -34,7 +34,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
-
+#include <drm/drm_eld.h>
 #include "dm_services.h"
 #include "amdgpu.h"
 #include "dc.h"
@@ -90,6 +90,7 @@ static void apply_edid_quirks(struct drm_device *dev, struct edid *edid, struct
 	}
 }
 
+#define AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS 13
 /**
  * dm_helpers_parse_edid_caps() - Parse edid caps
  *
@@ -132,9 +133,10 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
 	edid_caps->manufacture_week = product_id.week_of_manufacture;
 	edid_caps->manufacture_year = product_id.year_of_manufacture;
 
-	drm_edid_get_monitor_name(edid_buf,
-				  edid_caps->display_name,
-				  AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memset(edid_caps->display_name, 0, AUDIO_INFO_DISPLAY_NAME_SIZE_IN_CHARS);
+	memcpy(edid_caps->display_name,
+	       &connector->eld[DRM_ELD_MONITOR_NAME_STRING],
+	       AMDGPU_ELD_DISPLAY_NAME_SIZE_IN_CHARS);
 
 	edid_caps->edid_hdmi = connector->display_info.is_hdmi;
 
-- 
2.47.2

