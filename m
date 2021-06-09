Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F733A1EE4
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Jun 2021 23:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D446EB1F;
	Wed,  9 Jun 2021 21:23:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0B96EAE2
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Jun 2021 21:23:45 +0000 (UTC)
Date: Wed, 09 Jun 2021 21:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1623273824;
 bh=FDslwf1U8VLFuARESNNa6lJIkZ4yWNQK04/FM1jIRC4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=nOqaF5MnFLXPNL9XgXvSla8fPAiMhB5ivZjzhiQzMBtqbID0nk7doNnTqiF5TyzfY
 86+/SYOcyFyGFE96NUBMucniQ/cRZkfuxwWWdXeZm05ZOMwxGGalyGGpJWOyzOJmpb
 EMMfmS92susMRBlF4xjDlNNNQ1Mr9hNs2xkW0vHYXrBgsDKJR8i7t+WQzDl/wZcdBo
 uc4/Ty4cSJ8mHTPUaFvOaCSKEBDRoe9lrKDJIrkX8NuMQ/TT2R5JDDUaNpBy017YcL
 OuJiCTmtMUBK++Zt1SbB49c3kypz6ixgF558nbO/yU6IvoJHX+SsygcPQkYIjpTclu
 C+d1FigQU/mGA==
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2 2/7] drm/probe-helper: add
 drm_kms_helper_connector_hotplug_event
Message-ID: <iCEjbatL1P3omEAweQouZjbWmGk0OkLbd8ZeD4jC8@cp7-web-042.plabs.ch>
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

This function is the same as drm_kms_helper_hotplug_event, but takes
a connector instead of a device.

Signed-off-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/drm_probe_helper.c | 23 +++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index e7e1ee2aa352..8cc673267cba 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -604,6 +604,9 @@ EXPORT_SYMBOL(drm_helper_probe_single_connector_modes);
  *
  * This function must be called from process context with no mode
  * setting locks held.
+ *
+ * If only a single connector has changed, consider calling
+ * drm_kms_helper_connector_hotplug_event() instead.
  */
 void drm_kms_helper_hotplug_event(struct drm_device *dev)
 {
@@ -616,6 +619,26 @@ void drm_kms_helper_hotplug_event(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_kms_helper_hotplug_event);
 
+/**
+ * drm_kms_helper_connector_hotplug_event - fire off a KMS connector hotplug event
+ * @connector: drm_connector which has changed
+ *
+ * This is the same as drm_kms_helper_hotplug_event(), except it fires a more
+ * fine-grained uevent for a single connector.
+ */
+void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+
+	/* send a uevent + call fbdev */
+	drm_sysfs_connector_hotplug_event(connector);
+	if (dev->mode_config.funcs->output_poll_changed)
+		dev->mode_config.funcs->output_poll_changed(dev);
+
+	drm_client_dev_hotplug(dev);
+}
+EXPORT_SYMBOL(drm_kms_helper_connector_hotplug_event);
+
 static void output_poll_execute(struct work_struct *work)
 {
 	struct delayed_work *delayed_work = to_delayed_work(work);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 8d3ed2834d34..733147ea89be 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -19,6 +19,7 @@ void drm_kms_helper_poll_init(struct drm_device *dev);
 void drm_kms_helper_poll_fini(struct drm_device *dev);
 bool drm_helper_hpd_irq_event(struct drm_device *dev);
 void drm_kms_helper_hotplug_event(struct drm_device *dev);
+void drm_kms_helper_connector_hotplug_event(struct drm_connector *connector);
 
 void drm_kms_helper_poll_disable(struct drm_device *dev);
 void drm_kms_helper_poll_enable(struct drm_device *dev);
-- 
2.31.1


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
