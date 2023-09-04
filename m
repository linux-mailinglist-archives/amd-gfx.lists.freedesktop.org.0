Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A47920DB
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Sep 2023 09:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CBB10E457;
	Tue,  5 Sep 2023 07:47:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out-216.mta1.migadu.com (out-216.mta1.migadu.com
 [IPv6:2001:41d0:203:375::d8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A5A10E3DF
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 Sep 2023 19:57:41 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1693857460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7qBg3iDQqf8IwXL/E4Wgz6fxfLGjyBUHVlaSKqEqM0=;
 b=WMS/w8FgJ79aPQ8l4g/8/d9wVJNdmJ/Trts3yfgLGchh5WoxYx1+w0H8NIuaAyS0IT5BkC
 Kjx20glONovJ8q2nZ9dMoVofSgZDpd/8y0klyEVggRv/eqObUf7XYTSMmhsr0xBmxPkuBC
 v/o6je4JekFri0ZrPJpgLowPojwWyOs=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [RFC,
 drm-misc-next v4 2/9] drm/nouveau: Implement .be_primary() callback
Date: Tue,  5 Sep 2023 03:57:17 +0800
Message-Id: <20230904195724.633404-3-sui.jingfeng@linux.dev>
In-Reply-To: <20230904195724.633404-1-sui.jingfeng@linux.dev>
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 05 Sep 2023 07:47:25 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

On a machine with multiple GPUs, a Linux user has no control over which one
is primary at boot time. This patch tries to solve the mentioned problem by
implementing the .be_primary() callback. VGAARB will call back to Nouveau
when the drm/nouveau gets loaded successfully.

Pass nouveau.modeset=10 on the kernel cmd line if you really want the
device bound by Nouveau to be the primary video adapter. This overrides
whatever boot device selected by VGAARB.

Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/gpu/drm/nouveau/nouveau_vga.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index 162b4f4676c7..4242188667e2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -80,6 +80,15 @@ nouveau_switcheroo_ops = {
 	.can_switch = nouveau_switcheroo_can_switch,
 };
 
+static bool
+nouveau_want_to_be_primary(struct pci_dev *pdev)
+{
+	if (nouveau_modeset == 10)
+		return true;
+
+	return false;
+}
+
 void
 nouveau_vga_init(struct nouveau_drm *drm)
 {
@@ -92,7 +101,7 @@ nouveau_vga_init(struct nouveau_drm *drm)
 		return;
 	pdev = to_pci_dev(dev->dev);
 
-	vga_client_register(pdev, nouveau_vga_set_decode, NULL);
+	vga_client_register(pdev, nouveau_vga_set_decode, nouveau_want_to_be_primary);
 
 	/* don't register Thunderbolt eGPU with vga_switcheroo */
 	if (pci_is_thunderbolt_attached(pdev))
-- 
2.34.1

