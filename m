Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 458F088F153
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 22:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C8E1120A5;
	Wed, 27 Mar 2024 21:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YwhYhpL8";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D191D1120A2;
 Wed, 27 Mar 2024 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v3qVMpTW3Rz9XI01onM+tozQSo+qPjPGfCIFhbblBAw=; b=YwhYhpL8iKRwRM9EPuU/zWZSts
 9qlOXSoqw0C5GkLziFKt/hs2TukWCa48/qoaq3+YlgZL+8H89ZGOK0wGgU4IwgN+zpvraNTyp7pSk
 pCVdhA8SQbW0TVrWJRLiGYvLEKIupYtXpYQUEHXfwYK2Srn9hgISddtWGg+OFlf4gpy5196ZtcvZN
 MQwcrreUOgrOxBB+f8XjL97oOR6jV3HVAOFiZ/fum4a4P1e2JYcHvI1GvnmbwHZbfFpAfEylyh1Fr
 V8CPR33dIayzV0lQzGR2ZSGWEBbuRxlQi5um0caH8BK6V9XmVeFwxgI6gY+olewfQlPRnCbUyxfSb
 GMI+RuIQ==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpb9r-00G1qx-7E; Wed, 27 Mar 2024 22:50:07 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 1/6] drm/amd/display: remove unused pixel_clock_mhz
 from amdgpu_dm_connector
Date: Wed, 27 Mar 2024 18:44:02 -0300
Message-ID: <20240327214953.367126-2-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327214953.367126-1-mwen@igalia.com>
References: <20240327214953.367126-1-mwen@igalia.com>
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

We set pixel_clock_mhz when updating freesync caps, but it's not used
anywhere. Remove it.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 ---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ef546932f6c9..05ffe844b1fc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -11260,7 +11260,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 
 		amdgpu_dm_connector->min_vfreq = 0;
 		amdgpu_dm_connector->max_vfreq = 0;
-		amdgpu_dm_connector->pixel_clock_mhz = 0;
 		connector->display_info.monitor_range.min_vfreq = 0;
 		connector->display_info.monitor_range.max_vfreq = 0;
 		freesync_capable = false;
@@ -11324,8 +11323,6 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 					connector->display_info.monitor_range.min_vfreq;
 				amdgpu_dm_connector->max_vfreq =
 					connector->display_info.monitor_range.max_vfreq;
-				amdgpu_dm_connector->pixel_clock_mhz =
-					range->pixel_clock_mhz * 10;
 
 				break;
 			}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 09519b7abf67..67647bb5999b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -678,7 +678,6 @@ struct amdgpu_dm_connector {
 	 * value is set to zero when there is no FreeSync support.
 	 */
 	int max_vfreq ;
-	int pixel_clock_mhz;
 
 	/* Audio instance - protected by audio_lock. */
 	int audio_inst;
-- 
2.43.0

