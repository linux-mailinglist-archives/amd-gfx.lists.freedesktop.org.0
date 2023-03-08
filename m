Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 814B56B14AC
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Mar 2023 23:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D106910E72C;
	Wed,  8 Mar 2023 21:59:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0946C10E721
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Mar 2023 21:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678312725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUEnoOj5mVpGTN9PeeZh9hWCnroh4EciYx/3SGOOsu0=;
 b=UaRQuZ8rBdvKVUrq8ytIUS7h6zuaJYeR9jscjVuehqO+ULKeV4VimqKc5fpM/YRCjadKUW
 uzwsjXZOEx4R3OhkgsLnmJn9T/faJm30GKVoDDXWBmemTKvP1k5Wn55gPEmj9MFmtxouaJ
 tgYN3HU0CRt8Vh2mVBGtduF5X2WSU78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-m_KqM5M2OrqxayAQTSpyQQ-1; Wed, 08 Mar 2023 16:58:42 -0500
X-MC-Unique: m_KqM5M2OrqxayAQTSpyQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E39857F40;
 Wed,  8 Mar 2023 21:58:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFE65440D9;
 Wed,  8 Mar 2023 21:58:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC v2 1/6] drm/amd/display/amdgpu_dm: Fix
 backlight_device_register() error handling
Date: Wed,  8 Mar 2023 22:58:26 +0100
Message-Id: <20230308215831.782266-2-hdegoede@redhat.com>
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

backlight_device_register() returns an ERR_PTR on error, but other code
such as amdgpu_dm_connector_destroy() assumes dm->backlight_dev[i] is NULL
if no backlight is registered.

Clear dm->backlight_dev[i] on registration failure, to avoid other code
trying to deref an ERR_PTR pointer.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 009ef917dad4..42b88ab5552d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4180,9 +4180,10 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 								       &amdgpu_dm_backlight_ops,
 								       &props);
 
-	if (IS_ERR(dm->backlight_dev[dm->num_of_edps]))
+	if (IS_ERR(dm->backlight_dev[dm->num_of_edps])) {
 		DRM_ERROR("DM: Backlight registration failed!\n");
-	else
+		dm->backlight_dev[dm->num_of_edps] = NULL;
+	} else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
 }
 
-- 
2.39.1

