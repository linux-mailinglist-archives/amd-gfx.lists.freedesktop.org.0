Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18088929A
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Mar 2024 08:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC26F10E5FC;
	Mon, 25 Mar 2024 07:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sDYAW4so";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C2D10E5FC
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Mar 2024 07:10:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E79DFCE0EC7;
 Mon, 25 Mar 2024 07:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA54EC43390;
 Mon, 25 Mar 2024 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711350619;
 bh=pDklQ4HEyATJrG52s500i9rhBWGMsdxljxs2zv1Sn9M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sDYAW4so/yK4aW9I/T/TZScfACA4ErlTn9EzeRTzT0MnxaSVQ18Q/wo608EexZikE
 sQl8FfiCyoVhNcD8xHTbECjttNmWw0ciorZ3xFGviCMbgRLOJ00DpYRWlTMJxOtZZg
 s5SU6uyY/WGt9G9bB84oySLBvK+/u2GZTVC3oMJhjM7Ob8VXW5JgVt2V7KHslRw3Oh
 gL35PqaFFZT1tkoAczGgg/W48noHxc978hv4oL6Fxz0NJ+OHry+tDI+RQsYgB4eL/x
 FfsjGiAWqZV/KEgVhCfLsTpJ+PJrw7cwRmdpFSka6ElQHDgnw5eikTNurbY+d3DDsq
 XYcVv/bRWkvlQ==
From: Damien Le Moal <dlemoal@kernel.org>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Manivannan Sadhasivami <manivannan.sadhasivam@linaro.org>,
 linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, ntb@lists.linux.dev,
 Lee Jones <lee@kernel.org>, David Airlie <airlied@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-rdma@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 08/28] ntb: Use PCI_IRQ_INTX
Date: Mon, 25 Mar 2024 16:09:19 +0900
Message-ID: <20240325070944.3600338-9-dlemoal@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325070944.3600338-1-dlemoal@kernel.org>
References: <20240325070944.3600338-1-dlemoal@kernel.org>
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

Use the macro PCI_IRQ_INTX instead of the deprecated PCI_IRQ_LEGACY
macro.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 48823b53ede3..48dfb1a69a77 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2129,7 +2129,7 @@ static int idt_init_isr(struct idt_ntb_dev *ndev)
 	int ret;
 
 	/* Allocate just one interrupt vector for the ISR */
-	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_LEGACY);
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_INTX);
 	if (ret != 1) {
 		dev_err(&pdev->dev, "Failed to allocate IRQ vector");
 		return ret;
-- 
2.44.0

