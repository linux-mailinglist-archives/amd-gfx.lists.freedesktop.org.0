Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DF17711C
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Mar 2020 09:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873CC6EA33;
	Tue,  3 Mar 2020 08:24:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 412 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2020 03:41:56 UTC
Received: from yyz.mikelr.com (yyz.mikelr.com [170.75.163.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8C6E975
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Mar 2020 03:41:56 +0000 (UTC)
Received: from glidewell.ykf.mikelr.com (198-84-194-208.cpe.teksavvy.com
 [198.84.194.208])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by yyz.mikelr.com (Postfix) with ESMTPSA id 525E63CF2A;
 Mon,  2 Mar 2020 22:35:03 -0500 (EST)
From: Mikel Rychliski <mikel@mikelr.com>
To: amd-gfx@lists.freedesktop.org,
	linux-pci@vger.kernel.org
Subject: [PATCH 4/4] drm/amdgpu: iounmap unused mapping
Date: Mon,  2 Mar 2020 22:34:57 -0500
Message-Id: <20200303033457.12180-5-mikel@mikelr.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
index 50dff69a0f6e..ea6a1fa98ad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
@@ -207,6 +207,7 @@ static bool amdgpu_read_platform_bios(struct amdgpu_device *adev)
 		return false;
 
 	memcpy_fromio(adev->bios, bios, size);
+	iounmap(bios);
 
 	if (!check_atom_bios(adev->bios, size)) {
 		kfree(adev->bios);
-- 
2.13.7

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
