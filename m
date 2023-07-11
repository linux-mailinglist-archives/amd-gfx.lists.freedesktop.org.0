Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC11074F67D
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jul 2023 19:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7265110E417;
	Tue, 11 Jul 2023 17:05:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-56.mta1.migadu.com (out-56.mta1.migadu.com [95.215.58.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0610E3FD
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jul 2023 16:53:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689093837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JsW608w9Icre+eeXWiPepSjKi7cGG5If1vSETO465rs=;
 b=QF9u5YarQ3XzlTFgOQ75cikl4e7GNbilk51J/EF5FT5P17CXSbsJhIZPn2v2xfDNiD3iPg
 OL2K7w14/U1uqKbPrZ+SREEjfjWxoRcLu+YoI4CCjBNUfs96b9Eb/rlpz4+aGHn7BvrvUg
 A5l4s7aCH2f1LJn0RlazEQQwuZEJWso=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: David Airlie <airlied@gmail.com>
Subject: [PATCH v3 9/9] drm/loongson: Add an implement for the is_primary_gpu
 function callback
Date: Wed, 12 Jul 2023 00:43:10 +0800
Message-Id: <20230711164310.791756-10-sui.jingfeng@linux.dev>
In-Reply-To: <20230711164310.791756-1-sui.jingfeng@linux.dev>
References: <20230711164310.791756-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 11 Jul 2023 17:05:41 +0000
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 kvm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/loongson/lsdc_drv.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index d10a28c2c494..92ef07d6a534 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -257,6 +257,14 @@ static unsigned int lsdc_vga_set_decode(struct pci_dev *pdev, bool state)
 	return VGA_RSRC_NORMAL_IO | VGA_RSRC_NORMAL_MEM;
 }
 
+static bool lsdc_is_primary_gpu(struct pci_dev *pdev)
+{
+	struct drm_device *ddev = pci_get_drvdata(pdev);
+	struct lsdc_device *ldev = to_lsdc(ddev);
+
+	return drm_aperture_contain_firmware_fb(ldev->vram_base, ldev->vram_size);
+}
+
 static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct lsdc_desc *descp;
@@ -289,7 +297,7 @@ static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_drvdata(pdev, ddev);
 
-	vga_client_register(pdev, lsdc_vga_set_decode, NULL);
+	vga_client_register(pdev, lsdc_vga_set_decode, lsdc_is_primary_gpu);
 
 	drm_kms_helper_poll_init(ddev);
 
-- 
2.25.1

