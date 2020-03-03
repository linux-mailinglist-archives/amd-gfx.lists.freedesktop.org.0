Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3D17712F
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Mar 2020 09:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069346EA37;
	Tue,  3 Mar 2020 08:24:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from yyz.mikelr.com (unknown
 [IPv6:2602:ffb6:2:0:f816:3eff:fe0d:377b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC6C6E968
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Mar 2020 03:41:56 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 1FCFC3CF26;
 Mon,  2 Mar 2020 22:35:03 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: amd-gfx@lists.freedesktop.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 3/4] drm/radeon: iounmap unused mapping
Date: Mon,  2 Mar 2020 22:34:56 -0500
Message-Id: <20200303033457.12180-4-mikel@mikelr.com>
X-Mailer: git-send-email 2.13.7
In-Reply-To: <20200303033457.12180-1-mikel@mikelr.com>
References: <20200303033457.12180-1-mikel@mikelr.com>
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:15 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Matthew Garrett <matthewgarrett@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mikel Rychliski <mikel@mikelr.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Now that pci_platform_rom creates a new mapping to access the ROM
image, we should remove this mapping after extracting the BIOS.

Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
---
 drivers/gpu/drm/radeon/radeon_bios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
index c3ae4c92a115..712b88d88957 100644
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -123,6 +123,7 @@ static bool radeon_read_platform_bios(struct radeon_device *rdev)
 		return false;
 
 	memcpy_fromio(rdev->bios, bios, size);
+	iounmap(bios);
 
 	if (size == 0 || rdev->bios[0] != 0x55 || rdev->bios[1] != 0xaa) {
 		kfree(rdev->bios);
-- 
2.13.7

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
