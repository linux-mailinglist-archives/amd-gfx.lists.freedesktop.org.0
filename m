Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E781AD087
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2020 21:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FF86EB52;
	Thu, 16 Apr 2020 19:43:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4C6EB52
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2020 19:43:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id v7so22780585qkc.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2020 12:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=APgz9TL4uK9jNVa6NM7l9Tou/dC5gaB/UKLv1cd4uOs=;
 b=Hkq4wYAP3EyaKoGJNf9YKdj7pvPSK1W0lKuWOd1snFsJr6hA3EEJw8ab6PaWJXAEyb
 TQ1P8CWSkmlJE2asdCb7ns7vn2eIpkICxTNNZ2uxRn1BT/P0kga6DGRS4JjyK53WxxxY
 Tyrc4PjYbudZk3jZ+CBycSC4Ym8Tn22xthSQQ9/Vp3BDj7Bt+r6BTynG1yynOrMkQzao
 SO49CkxHI7v6V9SB2HtbwfW2qM9LMKDzJF6IrTheht15uFdq8TvCeDlUf1KznAU0U6w2
 I1k7t3Ubw6BnLs7bPEJSoVEmiBooKodLm/VRDJAA/nlhcYMkEcpHz8srYOMDjYI3vRzB
 sb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=APgz9TL4uK9jNVa6NM7l9Tou/dC5gaB/UKLv1cd4uOs=;
 b=bPJiTT8uxz3uNj1a6p/lwn4U3Yz+rVXo95vj+k+0IvsIIQQ+5ojGtx109NWwBRDsmF
 ccFeSAWBjjBtthJAb2w8pZ3wlf9THlgST+s8SSD6BMVRVSDfNryIxg92j3pW/6PgYFsL
 W+Zc8zYWKMVspRG/ooEv4H1mggVKhJVaBADV//W3sxfVJSAlu78jTCwLsfzu/RoXtY3D
 mDjYd2BEDH3WzuSpc8RoyS9BWdEyvWQShtRzsIyd/M5elxXi8mGgoeHw/j4svKDVzzfk
 Ziq4LqJV5rR1fVJ6WxaUZqUDUL7f0DUPXls+/0YMLN9Fbnuwo8YAeBA1i7Hyf0EYeVc0
 EhGA==
X-Gm-Message-State: AGi0PuaIhpE1KcuXLBx+djPOilJYUFoGm75zgTiCAulQsQwDMBvLUbsE
 H4iCPHQVYdq9874z8lDtdR9S8Bsh
X-Google-Smtp-Source: APiQypI2X8VMobmlxyeZkkIBEP9jD2f7ntglIhX3j5yTJSiyLRoOEqZECEY0uMZrFiga/ADqRWNoLQ==
X-Received: by 2002:a37:78c1:: with SMTP id
 t184mr21846103qkc.213.1587066213224; 
 Thu, 16 Apr 2020 12:43:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.72.172])
 by smtp.gmail.com with ESMTPSA id z2sm3337364qkc.28.2020.04.16.12.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 12:43:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/display: fix aux registration (v2)
Date: Thu, 16 Apr 2020 15:43:24 -0400
Message-Id: <20200416194325.21755-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

We were registering the aux device in the MST late_register
rather than the regular one.

v2: handle eDP as well

Fixes: 405a1f9090d1ac ("drm/amdgpu/display: split dp connector registration (v4)")
Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1100
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 11 ++++++++++-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   |  8 ++++----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 417925a0d739..fc81788f24b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4738,10 +4738,19 @@ amdgpu_dm_connector_atomic_duplicate_state(struct drm_connector *connector)
 static int
 amdgpu_dm_connector_late_register(struct drm_connector *connector)
 {
-#if defined(CONFIG_DEBUG_FS)
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 		to_amdgpu_dm_connector(connector);
+	int r;
 
+	if ((connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) ||
+	    (connector->connector_type == DRM_MODE_CONNECTOR_eDP)) {
+		amdgpu_dm_connector->dm_dp_aux.aux.dev = connector->kdev;
+		r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
+		if (r)
+			return r;
+	}
+
+#if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(amdgpu_dm_connector);
 #endif
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index cb49f13c1548..7d28b0482127 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -113,16 +113,16 @@ amdgpu_dm_mst_connector_late_register(struct drm_connector *connector)
 		to_amdgpu_dm_connector(connector);
 	int r;
 
-	amdgpu_dm_connector->dm_dp_aux.aux.dev = connector->kdev;
-	r = drm_dp_aux_register(&amdgpu_dm_connector->dm_dp_aux.aux);
-	if (r)
+	r = drm_dp_mst_connector_late_register(connector,
+					       amdgpu_dm_connector->port);
+	if (r < 0)
 		return r;
 
 #if defined(CONFIG_DEBUG_FS)
 	connector_debugfs_init(amdgpu_dm_connector);
 #endif
 
-	return r;
+	return 0;
 }
 
 static void
-- 
2.25.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
