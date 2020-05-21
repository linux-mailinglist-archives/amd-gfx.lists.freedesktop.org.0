Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F11DD89C
	for <lists+amd-gfx@lfdr.de>; Thu, 21 May 2020 22:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38A86E957;
	Thu, 21 May 2020 20:45:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 915 seconds by postgrey-1.36 at gabe;
 Thu, 21 May 2020 20:45:01 UTC
Received: from relay1.stackmail.com (relay1.stackmail.com [185.151.28.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346006E957
 for <amd-gfx@lists.freedesktop.org>; Thu, 21 May 2020 20:45:01 +0000 (UTC)
Received: from smtp1.mail.stackcp.net ([10.4.72.75] helo=smtp1.n4.stackcp.net)
 by relay1.stackmail.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <alan@improbability.net>) id 1jbrp2-0005FO-GM
 for amd-gfx@lists.freedesktop.org; Thu, 21 May 2020 21:29:44 +0100
Received: from slartibartfast.improbability.net ([87.127.90.134])
 by smtp1.n4.stackcp.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.92.3) (envelope-from <alan@improbability.net>)
 id 1jbrp2-0004hU-9W
 for amd-gfx@lists.freedesktop.org; Thu, 21 May 2020 21:29:44 +0100
Received: from trillian.improbability.net (trillian.improbability.net
 [87.127.90.131])
 by slartibartfast.improbability.net (Postfix) with ESMTPSA id CF2012622A;
 Thu, 21 May 2020 21:29:43 +0100 (BST)
From: Alan Swanson <reiver@improbability.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: Advise if unable to resize BAR
Date: Thu, 21 May 2020 21:29:31 +0100
Message-Id: <20200521202931.15726-2-reiver@improbability.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521202931.15726-1-reiver@improbability.net>
References: <20200521202931.15726-1-reiver@improbability.net>
MIME-Version: 1.0
X-Authenticated-Sender: alan@improbability.net
X-Scan-Signature: 87851ef79f0dbeade26879b66857a652
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
Cc: Alan Swanson <reiver@improbability.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Even with the "Above 4G decoding" (or similar) BIOS option enabled,
many BIOS do not assign the PCI root bus a 64-bit address space.

If available, "MMIOH Base" and "MMIO High Size" (or similar) BIOS
options should allow mapping to the desired address spaces.

Signed-off-by: Alan Swanson <reiver@improbability.net>
---
Useful to know why bar resizing isn't happening.

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2f0e8da7b..39a7f7212 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -919,8 +919,10 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	}
 
 	/* Trying to resize is pointless without a root hub window above 4GB */
-	if (!res)
+	if (!res) {
+		DRM_INFO("Unable to resize BAR as PCI bus address space below 4GB.");
 		return 0;
+	}
 
 	/* Disable memory decoding while we change the BAR addresses and size */
 	pci_read_config_word(adev->pdev, PCI_COMMAND, &cmd);
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
