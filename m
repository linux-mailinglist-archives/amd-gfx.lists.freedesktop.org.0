Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B438E1BF8EC
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Apr 2020 15:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7D66E890;
	Thu, 30 Apr 2020 13:08:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4056EB91
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2020 08:56:04 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id q124so2443670pgq.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2020 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuFSML6Qs1jNQuh9f7FSxevmV01WKXUBt/xqATWhD2Y=;
 b=ksdrqkjg7/bPOyrlGVVf5QUEd5k1BXZ7bCgdmtHeYMIpFDf3Jwi86zlBfnZ6G3eGFf
 LjWDtJd1vQdHqlaiLjGGzrDiDeZunzNT9EZuzxEKG+XvlqlYRXstu/pFE85897AfscDN
 cdvyqJux8jQb2/CbeMwu4HqV5OW4SuxYJe+T4wNF3A6Av7o3axQUEJfZxOQzwMzm8/Jg
 MWfCDjZqBpH1VUis4SI0tuLnbul1+ql36EAFLt+4kHhoeKtaTsLLPv/fYAZc8yL/1/V5
 v2Jyc2hwtlG/8NlLhlIWkQ0Ql9LBguqNuCEvpxC3Y8JmemOdTlDhZM7wlLGEmPN7B1cX
 ABrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LuFSML6Qs1jNQuh9f7FSxevmV01WKXUBt/xqATWhD2Y=;
 b=Rw40N62yr0n58YDahGkBVZb9mPu5phoCzjfg8vpQq6J+S2XQOAuLWfoFKHi3uJ+amV
 3T8p4lVMFJqsqGkCEkRrKkHnvkvEZGNw4hCI6DV9Q0m5bMaCITRbW+YezrJ88q2TIgRq
 XDEfxIsVnsSKWDHMmYs+MM5KZlzkbcSsKu+ddgDFS05IyKJd+oWNTaX5S1nIN/2ZIlzJ
 FAcnb0qrChHeavX1kbCHnnyzq2X4uIdh65HbU2ZRyGl4fcjwyCQPKOymOmGkkx8A1q7F
 UWDbC/OkPcZBy0Km3jCyYKheR3Ge5idqOGkxlYsq6I3Y+yPozIyAhuevL39GwEZgwEQJ
 QAEw==
X-Gm-Message-State: AGi0PuYG/9jYVLBCyLn+G8+uo93mxyp3U/3e8Esjs1qVC65Yn4iYej7o
 WL34N/evMTf4rMmp7qbDtTdHuQ==
X-Google-Smtp-Source: APiQypLoq0/7IkBcTUdghxEn6PlqSyQyh8qIGbADqzsQq+98Hiyrqq/DxAocwK3AWb7h9Fm8F5nYxQ==
X-Received: by 2002:a63:cf0d:: with SMTP id j13mr2186045pgg.379.1588236963542; 
 Thu, 30 Apr 2020 01:56:03 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id 23sm1189356pjb.11.2020.04.30.01.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 01:56:03 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Zhou <David1.Zhou@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Tianci . Yin" <tianci.yin@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
Subject: [PATCH] drm/radeon: drm/amdgpu: Disable [1002:6611] in radeon
Date: Thu, 30 Apr 2020 16:53:19 +0800
Message-Id: <20200430085318.114894-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 30 Apr 2020 13:08:31 +0000
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Jian-Hong Pan <jian-hong@endlessm.com>, linux@endlessm.com,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The AMD/ATI Oland [1002:6611]'s HDMI output status is not synchronous
as shown on UI after hot re-plug the HDMI cable, if it is radeon in
used. The amdgpu module does not hit this issue.

This patch disables [1002:6611] in radeon and enables it in amdgpu.

Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/1117
Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++++++++++
 include/drm/drm_pciids.h                |  1 -
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8ea86ffdea0d..1ad6f13a5bc0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1017,6 +1017,15 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
 
 static struct drm_driver kms_driver;
 
+static void amdgpu_pci_fixup(struct pci_dev *pdev)
+{
+#ifdef CONFIG_DRM_AMDGPU_SI
+	/* [1002:6611] is disabled in radeon, so enable si_support in amdgpu. */
+	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->device == 0x6611)
+		amdgpu_si_support = 1;
+#endif
+}
+
 static int amdgpu_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *ent)
 {
@@ -1036,6 +1045,8 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 		return -ENODEV;
 	}
 
+	amdgpu_pci_fixup(pdev);
+
 #ifdef CONFIG_DRM_AMDGPU_SI
 	if (!amdgpu_si_support) {
 		switch (flags & AMD_ASIC_MASK) {
diff --git a/include/drm/drm_pciids.h b/include/drm/drm_pciids.h
index b7e899ce44f0..57368a0f5b82 100644
--- a/include/drm/drm_pciids.h
+++ b/include/drm/drm_pciids.h
@@ -171,7 +171,6 @@
 	{0x1002, 0x6607, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6608, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6610, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
-	{0x1002, 0x6611, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6613, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6617, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
 	{0x1002, 0x6620, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_OLAND|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP}, \
-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
