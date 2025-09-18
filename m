Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D2EB4708F
	for <lists+amd-gfx@lfdr.de>; Sat,  6 Sep 2025 16:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2AD10E3AC;
	Sat,  6 Sep 2025 14:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hvmBBN6S";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319DD10E3AB;
 Sat,  6 Sep 2025 14:37:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 18E6440A92;
 Sat,  6 Sep 2025 14:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5CCC4CEF9;
 Sat,  6 Sep 2025 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757169437;
 bh=aeX9aaqYt9fcYBzVbUpYXIN2578EUxkqsf3WrMGS36U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hvmBBN6SfIX9dfVHNWuoLk0ejgDIkyyPOdVqwMfgoWNYd/a3HBWfx+1ZS3nQE91sJ
 lLl1Y6b5pu5xYCjDqBLkiLokrHceiwcvHy1aC3uZluV8G33IxEMrqhJiN7J9YcWpGm
 7TrUZIEQA4YEZ1AkfDrDvgZ3+vQffNHQ1mFKB9C4fADnxmO16aoMJHb0SlqVPm1TIu
 sGvlPpDwaH/WsxfiI6g+CTyAGBDu+Ub2wDiUJ8BMVHWwP9eFHNPpLSwTGFwsqWqKxB
 U/fL+3RckHZvuDqokdEr9jS9zZNNlWsbsUw92hBbrNaiVfxUXg0gFkCPtAiLx9UGE2
 RMBdRrBV9SiMQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 linux-pm@vger.kernel.org (open list:HIBERNATION (aka Software Suspend,
 aka swsusp)), 
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
 linux-scsi@vger.kernel.org (open list:SCSI SUBSYSTEM),
 linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
 linux-trace-kernel@vger.kernel.org (open list:TRACING),
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v6 RESEND 08/11] PCI: PM: Use pci_power_manageable() in
 pci_pm_poweroff_noirq()
Date: Sat,  6 Sep 2025 09:36:39 -0500
Message-ID: <20250906143642.2590808-9-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250906143642.2590808-1-superm1@kernel.org>
References: <20250906143642.2590808-1-superm1@kernel.org>
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

Devices with no subordinate should be put into D3 during hibernate, but
devices that have bridge_d3 set should also be put to sleep during
hibernate. Adjust the check in pci_pm_poweroff_noirq() to use
pci_power_manageable() to cover those as well.

Tested-by: Eric Naim <dnaim@cachyos.org>
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/pci/pci-driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index fb6f1f60b2f1f..c563fd6af979d 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1227,7 +1227,7 @@ static int pci_pm_poweroff_noirq(struct device *dev)
 			return error;
 	}
 
-	if (!pci_dev->state_saved && !pci_has_subordinate(pci_dev))
+	if (!pci_dev->state_saved && pci_power_manageable(pci_dev))
 		pci_prepare_to_sleep(pci_dev);
 
 	/*
-- 
2.43.0

