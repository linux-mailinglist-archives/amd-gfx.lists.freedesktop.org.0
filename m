Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284206B14AB
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Mar 2023 23:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1A910E72B;
	Wed,  8 Mar 2023 21:59:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEDC10E729
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Mar 2023 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678312731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AownpKIJhwr803qPecntU0wJCU2CAxTb2a8dt5TOPpU=;
 b=fz8iCGprmPCGLmHB69FdS2FIP2CHwuh0MlbC6iJW0Bv7P7LLFwzUMAt4PK0hDklN4qjasQ
 XACb4iQwuJZ97TsqnRCASJAx0xoJCaaN0X0ceTYT6Mx+RALRpb0l/XfuVujO70FBqdYUdi
 9PPsZNaKsk/pnP4EL6RYuMnnK5aFMKM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-c6_kljvnNXm9VFA_4GW-Dg-1; Wed, 08 Mar 2023 16:58:46 -0500
X-MC-Unique: c6_kljvnNXm9VFA_4GW-Dg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAFD785A588;
 Wed,  8 Mar 2023 21:58:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2AFB440D9;
 Wed,  8 Mar 2023 21:58:44 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC v2 5/6] drm/amd/display/amdgpu_dm: Make
 amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
Date: Wed,  8 Mar 2023 22:58:30 +0100
Message-Id: <20230308215831.782266-6-hdegoede@redhat.com>
In-Reply-To: <20230308215831.782266-1-hdegoede@redhat.com>
References: <20230308215831.782266-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Wed, 08 Mar 2023 21:59:56 +0000
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Make amdgpu_dm_register_backlight_device() take an amdgpu_dm_connector
pointer to the connector for which it should register the backlight
as its only argument.

This is a preparation patch for moving the actual backlight class device
registering to drm_connector_funcs.late_register.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 757202af2eec..038bf897cc28 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4140,13 +4140,15 @@ static const struct backlight_ops amdgpu_dm_backlight_ops = {
 };
 
 static void
-amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
+amdgpu_dm_register_backlight_device(struct amdgpu_dm_connector *aconnector)
 {
-	char bl_name[16];
+	struct drm_device *drm = aconnector->base.dev;
+	struct amdgpu_display_manager *dm = &drm_to_adev(drm)->dm;
 	struct backlight_properties props = { 0 };
+	char bl_name[16];
 
 	if (!acpi_video_backlight_use_native()) {
-		drm_info(adev_to_drm(dm->adev), "Skipping amdgpu DM backlight registration\n");
+		drm_info(drm, "Skipping amdgpu DM backlight registration\n");
 		/* Try registering an ACPI video backlight device instead. */
 		acpi_video_register_backlight();
 		return;
@@ -4157,17 +4159,15 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	props.type = BACKLIGHT_RAW;
 
 	snprintf(bl_name, sizeof(bl_name), "amdgpu_bl%d",
-		 adev_to_drm(dm->adev)->primary->index + dm->num_of_edps);
+		 drm->primary->index + aconnector->bl_idx);
 
-	dm->backlight_dev[dm->num_of_edps] = backlight_device_register(bl_name,
-								       adev_to_drm(dm->adev)->dev,
-								       dm,
-								       &amdgpu_dm_backlight_ops,
-								       &props);
+	dm->backlight_dev[aconnector->bl_idx] =
+		backlight_device_register(bl_name, drm->dev, dm,
+					  &amdgpu_dm_backlight_ops, &props);
 
-	if (IS_ERR(dm->backlight_dev[dm->num_of_edps])) {
+	if (IS_ERR(dm->backlight_dev[aconnector->bl_idx])) {
 		DRM_ERROR("DM: Backlight registration failed!\n");
-		dm->backlight_dev[dm->num_of_edps] = NULL;
+		dm->backlight_dev[aconnector->bl_idx] = NULL;
 	} else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
 }
@@ -4233,7 +4233,7 @@ static void setup_backlight_device(struct amdgpu_display_manager *dm,
 	amdgpu_dm_update_backlight_caps(dm, bl_idx);
 	dm->brightness[bl_idx] = AMDGPU_MAX_BL_LEVEL;
 
-	amdgpu_dm_register_backlight_device(dm);
+	amdgpu_dm_register_backlight_device(aconnector);
 	if (!dm->backlight_dev[bl_idx]) {
 		aconnector->bl_idx = -1;
 		return;
-- 
2.39.1

