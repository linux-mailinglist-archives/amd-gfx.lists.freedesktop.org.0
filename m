Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBE688EBE9
	for <lists+amd-gfx@lfdr.de>; Wed, 27 Mar 2024 17:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E4E10FE66;
	Wed, 27 Mar 2024 16:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W+zAe/5l";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EC110FE63;
 Wed, 27 Mar 2024 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFGicZQIUmWsJ3dtuEEd31n71M6r+s0nI2noz6miB54=; b=W+zAe/5l/zlL0HqtTjwzmVqpkv
 eeTrAxiw5Gu/EDLSgOWoATLI1gRI0qpo39NyzjoE95agDkec7Ti13I8syskQz9CIK3MoAN1fCciav
 vyJkaQir5Db0uBrevZjTlLJNOv68mcvt4Epi9ms9c5rtw3rSvqhR13Liy8+K2vuZb119HD2EZu+Lq
 6mdD69EEJQNAP/zXiwJEGRlVOL9EO1dBb5mbS0ZqOMkHENahT57OJWjwHH6dannVZvjVvQSMU3XeC
 oQDWke/ia32p8L9iQ8chXKMuZl+aQ370+kEa0+8wIjwNNGZH05+c3xm3Ogqy+eo418sWxETN7P1BI
 k46cy/8Q==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rpWcC-00Fx4M-SD; Wed, 27 Mar 2024 17:59:05 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, airlied@gmail.com,
 daniel@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v2 5/6] drm/amd/display: always call connector_update when
 parsing freesync_caps
Date: Wed, 27 Mar 2024 13:54:46 -0300
Message-ID: <20240327165828.288792-6-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327165828.288792-1-mwen@igalia.com>
References: <20240327165828.288792-1-mwen@igalia.com>
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

Update connector caps with drm_edid data before parsing info for
freesync.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index edc5418db5be..b3c396d626e9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3292,13 +3292,11 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_edid_connector_update(connector, aconnector->edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
@@ -11249,6 +11247,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
-- 
2.43.0

