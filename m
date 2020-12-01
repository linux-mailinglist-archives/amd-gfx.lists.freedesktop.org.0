Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F92C9FBD
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Dec 2020 11:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA036E926;
	Tue,  1 Dec 2020 10:36:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEF06E7FE;
 Tue,  1 Dec 2020 10:36:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CB6BAD0B;
 Tue,  1 Dec 2020 10:35:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 14/20] drm/qxl: Remove references to struct drm_device.pdev
Date: Tue,  1 Dec 2020 11:35:36 +0100
Message-Id: <20201201103542.2182-15-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Using struct drm_device.pdev is deprecated. Convert qxl to struct
drm_device.dev. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c   | 2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c | 3 ++-
 drivers/gpu/drm/qxl/qxl_irq.c   | 3 ++-
 drivers/gpu/drm/qxl/qxl_kms.c   | 1 -
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 6e7f16f4cec7..fb5f6a5e81d7 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -163,7 +163,7 @@ DEFINE_DRM_GEM_FOPS(qxl_fops);
 
 static int qxl_drm_freeze(struct drm_device *dev)
 {
-	struct pci_dev *pdev = dev->pdev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct qxl_device *qdev = to_qxl(dev);
 	int ret;
 
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 16e1e589508e..b6075f452b9e 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -370,13 +370,14 @@ static int qxl_clientcap_ioctl(struct drm_device *dev, void *data,
 				  struct drm_file *file_priv)
 {
 	struct qxl_device *qdev = to_qxl(dev);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_qxl_clientcap *param = data;
 	int byte, idx;
 
 	byte = param->index / 8;
 	idx = param->index % 8;
 
-	if (dev->pdev->revision < 4)
+	if (pdev->revision < 4)
 		return -ENOSYS;
 
 	if (byte >= 58)
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index 1ba5a702d763..ddf6588a2a38 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -81,6 +81,7 @@ static void qxl_client_monitors_config_work_func(struct work_struct *work)
 
 int qxl_irq_init(struct qxl_device *qdev)
 {
+	struct pci_dev *pdev = to_pci_dev(qdev->ddev.dev);
 	int ret;
 
 	init_waitqueue_head(&qdev->display_event);
@@ -93,7 +94,7 @@ int qxl_irq_init(struct qxl_device *qdev)
 	atomic_set(&qdev->irq_received_cursor, 0);
 	atomic_set(&qdev->irq_received_io_cmd, 0);
 	qdev->irq_received_error = 0;
-	ret = drm_irq_install(&qdev->ddev, qdev->ddev.pdev->irq);
+	ret = drm_irq_install(&qdev->ddev, pdev->irq);
 	qdev->ram_header->int_mask = QXL_INTERRUPT_MASK;
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("Failed installing irq: %d\n", ret);
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index 228e2b9198f1..4a60a52ab62e 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -111,7 +111,6 @@ int qxl_device_init(struct qxl_device *qdev,
 {
 	int r, sb;
 
-	qdev->ddev.pdev = pdev;
 	pci_set_drvdata(pdev, &qdev->ddev);
 
 	mutex_init(&qdev->gem.mutex);
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
