Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0DC3A1EE6
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Jun 2021 23:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9616EB1E;
	Wed,  9 Jun 2021 21:23:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96A26EB1E;
 Wed,  9 Jun 2021 21:23:47 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273826;
 bh=9pG2VJ91c52VpOx8wxL38EnhB/qY4lpRu/zW6swuMbM=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=kCc81I74rKnJ1gjVKmPPlTiI4DqNkGAkRk/owi5mVdQ7VTMlGAmup0WNy4B94WlJG
 b2JzJIO3sLxeuv4eXuhGCSfRiqfo8fUt/UovcvMS6wgEgiJlCokLPSlYCmggr4Np8w
 MtixwKOoXB9IeZYoGrPq8G6JGtdYcu4E3aZLDOustoPh1cQLhc8xy2/hH7X2vASyOj
 ea7PywYq9RmiAY6FHE5hsgPdbcnUYUWeF8cSg9nbGTy7WjncPibe5JSxc2oNULQ8Z7
 OF4yhDkKeyWZ/fTE2dc8CbnZWZz3eE7t1gZrAhBeLxbY0CRBMHPtFsbLNVyBqszjif
 UfX5PisXr1Lbw==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 3/7] drm/connector: use drm_sysfs_connector_hotplug_event
Message-ID: <WCeMpotTBTYda5qEg1QbB86mapbfLOeTOerhoE17jA@cp3-web-047.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: pekka.paalanen@collabora.com, michel@daenzer.net, daniel@fooishbar.org,
 daniel@ffwll.ch, alexander.deucher@amd.com, harry.wentland@amd.com,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

In drm_connector_register, use drm_sysfs_connector_hotplug_event
instead of drm_sysfs_hotplug_event, because the hotplug event
only updates a single connector.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index da39e7ff6965..76930e0b8949 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -530,7 +530,7 @@ int drm_connector_register(struct drm_connector *connector)
 	connector->registration_state = DRM_CONNECTOR_REGISTERED;
 
 	/* Let userspace know we have a new connector */
-	drm_sysfs_hotplug_event(connector->dev);
+	drm_sysfs_connector_hotplug_event(connector);
 
 	goto unlock;
 
-- 
2.31.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
