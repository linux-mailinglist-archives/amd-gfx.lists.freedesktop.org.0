Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61656929084
	for <lists+amd-gfx@lfdr.de>; Sat,  6 Jul 2024 05:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C3A10E2D2;
	Sat,  6 Jul 2024 03:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WBxBdP3u";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FF110E2D2;
 Sat,  6 Jul 2024 03:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m+O7zl7MAgI8MdUY1VRrbzKUDv+XJ7qQi/EeQ8FLwck=; b=WBxBdP3uSU1neErz8tJInEqcoK
 OoKoYIOk+ojTVEfbVqQncxV4ck2nCF7TP1ETVZEcd+wPfdvdEQXZPZ9jcbgZL+i8/XORjHnKJgSMP
 kgY32LiMOgypaXzGoSqFqBe8eW5Gm663csUpTls1sMka+zbq5QftHX/hlaDzWOAw2v4qAsBeL447Q
 9PXx9SZ9vCztwus6si9aqkVbuF4Q45a7qlTsdlZvEb20ki9RU1z6h2Ikx/NXq2tvwQ+2yO/s/8UL/
 DNHBz5BKzT6qFUsw+xdPD4TKzsaHDf4dWe7khq3YxY3Tg5RoeqbOmO0SNgH073YtY9OVqi1cuW2lB
 LY899eFQ==;
Received: from [189.6.17.125] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sPwHp-00Bj27-Nr; Sat, 06 Jul 2024 05:40:34 +0200
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v4 04/11] drm/amd/display: always call connector_update when
 parsing freesync_caps
Date: Sat,  6 Jul 2024 00:35:05 -0300
Message-ID: <20240706034004.801329-5-mwen@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706034004.801329-1-mwen@igalia.com>
References: <20240706034004.801329-1-mwen@igalia.com>
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
index 163850aeac4a..d3f6823fe60b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3490,13 +3490,11 @@ void amdgpu_dm_update_connector_after_detect(
 					"failed to create aconnector->requested_timing\n");
 		}
 
-		drm_edid_connector_update(connector, aconnector->drm_edid);
 		amdgpu_dm_update_freesync_caps(connector, aconnector->drm_edid);
 		update_connector_ext_caps(aconnector);
 	} else {
 		drm_dp_cec_unset_edid(&aconnector->dm_dp_aux.aux);
 		amdgpu_dm_update_freesync_caps(connector, NULL);
-		drm_edid_connector_update(connector, NULL);
 		aconnector->num_modes = 0;
 		dc_sink_release(aconnector->dc_sink);
 		aconnector->dc_sink = NULL;
@@ -12007,6 +12005,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		amdgpu_dm_connector->dc_sink :
 		amdgpu_dm_connector->dc_em_sink;
 
+	drm_edid_connector_update(connector, drm_edid);
+
 	if (!drm_edid || !sink) {
 		dm_con_state = to_dm_connector_state(connector->state);
 
-- 
2.43.0

