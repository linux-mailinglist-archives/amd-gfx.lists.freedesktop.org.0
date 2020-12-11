Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EF12D6C89
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Dec 2020 01:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBDC6E506;
	Fri, 11 Dec 2020 00:55:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from spam.moreofthesa.me.uk (moreofthesa.me.uk
 [IPv6:2001:8b0:897:1651::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB6C6E5BB
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 00:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=moreofthesa.me.uk; s=201708; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zs2LedRXX7CiQRbs+3w6P8eOyWbf0dJyVRlV/3kmDKs=; b=C7FvWm8hahFt9vWsaZE1n1GJyr
 Jm6zvdVWYmRJpmIDI/ZMhu5QieFSP9W+slZ68VC0dj7XocpQwPl0NT/s2NC2sFHas66aEGr2Y6QU7
 fJOQS6XWRK+RuzbOHtIcLv+eiZUB78A9Se1nFnmN1LQtIE5kD62CYCCAH+f8lQOxX6jaXFTfSGEJC
 ftlrh8PedDsiHlTZ+RxfutbV3lmuiZBnUF6CWWJLq3+fKgPrcxMLJh9//V5JGPXVa72mYvckUV0C7
 mavCe3byEnwiQQXwds3Iw8wC0/RsTi+x32tYtWIi4Exsu4F9QBaOEShRU9vvaa+Nwl+vrxWB6aGCZ
 8iCkay0w==;
Received: from [2001:8b0:897:1650::2] (helo=flibble.moreofthesa.me.uk)
 by spam.moreofthesa.me.uk with esmtp (Exim 4.92)
 (envelope-from <devspam@moreofthesa.me.uk>)
 id 1knWiA-0002lw-PH; Fri, 11 Dec 2020 00:55:06 +0000
From: Darren Salt <devspam@moreofthesa.me.uk>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] pci: export PCI BAR size-reading functions
Date: Fri, 11 Dec 2020 00:55:00 +0000
Message-Id: <20201211005506.4554-2-devspam@moreofthesa.me.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201211005506.4554-1-devspam@moreofthesa.me.uk>
References: <20201211005506.4554-1-devspam@moreofthesa.me.uk>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:8b0:897:1650::2
X-SA-Exim-Mail-From: devspam@moreofthesa.me.uk
X-SA-Exim-Scanned: No (on spam.moreofthesa.me.uk);
 SAEximRunCond expanded to false
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
Cc: Darren Salt <devspam@moreofthesa.me.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is to assist driver modules which do BAR resizing.

Signed-off-by: Darren Salt <devspam@moreofthesa.me.uk>
---
 drivers/pci/pci.c   | 2 ++
 drivers/pci/pci.h   | 2 --
 include/linux/pci.h | 4 ++++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index e578d34095e9..3f6042d9ad83 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -3579,6 +3579,7 @@ u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar)
 	pci_read_config_dword(pdev, pos + PCI_REBAR_CAP, &cap);
 	return (cap & PCI_REBAR_CAP_SIZES) >> 4;
 }
+EXPORT_SYMBOL(pci_rebar_get_possible_sizes);
 
 /**
  * pci_rebar_get_current_size - get the current size of a BAR
@@ -3600,6 +3601,7 @@ int pci_rebar_get_current_size(struct pci_dev *pdev, int bar)
 	pci_read_config_dword(pdev, pos + PCI_REBAR_CTRL, &ctrl);
 	return (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BAR_SHIFT;
 }
+EXPORT_SYMBOL(pci_rebar_get_current_size);
 
 /**
  * pci_rebar_set_size - set a new size for a BAR
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index f86cae9aa1f4..8373d94414e9 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -608,8 +608,6 @@ int acpi_get_rc_resources(struct device *dev, const char *hid, u16 segment,
 			  struct resource *res);
 #endif
 
-u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
-int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int pci_rebar_set_size(struct pci_dev *pdev, int bar, int size);
 static inline u64 pci_rebar_size_to_bytes(int size)
 {
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 22207a79762c..5aa035622741 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1226,7 +1226,11 @@ void pci_update_resource(struct pci_dev *dev, int resno);
 int __must_check pci_assign_resource(struct pci_dev *dev, int i);
 int __must_check pci_reassign_resource(struct pci_dev *dev, int i, resource_size_t add_size, resource_size_t align);
 void pci_release_resource(struct pci_dev *dev, int resno);
+
+u32 pci_rebar_get_possible_sizes(struct pci_dev *pdev, int bar);
+int pci_rebar_get_current_size(struct pci_dev *pdev, int bar);
 int __must_check pci_resize_resource(struct pci_dev *dev, int i, int size);
+
 int pci_select_bars(struct pci_dev *dev, unsigned long flags);
 bool pci_device_is_present(struct pci_dev *pdev);
 void pci_ignore_hotplug(struct pci_dev *dev);
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
