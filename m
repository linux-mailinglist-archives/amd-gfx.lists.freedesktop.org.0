Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 166191F2035
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jun 2020 21:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3408689DB7;
	Mon,  8 Jun 2020 19:41:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2A889DB7
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jun 2020 19:41:20 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id e9so9188566pgo.9
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jun 2020 12:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEOG+0RtGDvvAokjSxHEOr5ksqEpIchcu1HEVfmjZNM=;
 b=GcBDZ/iBkB+kjhe/6wNcVZki52KyVzy0MtJp1xo2zi251Tz6ZrGfAwKK+Hd0KZh41X
 76w0Vid7rXVaI8526Ar+sQ0r7Di6MK800SMBHkUGTUXszNubc4wJwRfe3caRp6GGtPNZ
 g/oRBPwMgwVaaDCk08pz1RcOVe8T6enMEcTp8UtJofkpCtZsJSrPk5AaDWWVSO1vp/tw
 rNJ+QgsEG1Gaa26gNK8jGwtQrppF/Br0PevQ8d/bNC368hmHe6gvBBrsPgT2kbbi4MR6
 V3N4naHTBt7r+w4f7kdgwLGqKOP20si+33+gYgK0QA3S/UyJCulntM3KDMsi5kk+rdUF
 Z/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gEOG+0RtGDvvAokjSxHEOr5ksqEpIchcu1HEVfmjZNM=;
 b=EiOU6fMZKaskIdyOl/yZiGESNoYLFnjH/UdSnhG1+sbsauvlBIL4eO4ryXFyZRe93F
 zalEDBw5qCONlApkpOyI6UTDzboJKBYciE4+RHie+X+NaYA7nACpmwF+Ob5tEBWFDzqN
 8MGh+dMN62RH5Zyajxe9WFpfa2HcURsu71eJJ2Na3iLzOLsRxdribNC8OXxpzeWkx3pn
 l5+guVMWWHjBKHqdpkn91shREV5aqsggeULYudSbBEQU2cfhImSCn98dMtyqIGWtuIhw
 zapON3lfLMVQRqsQHrI61H6xNE6W7MnGCaCkBMAWzLeIsRqtH0P5UbwEHfvYVCK+xUsf
 f4WA==
X-Gm-Message-State: AOAM530ijExv0txJ6btHrRG0MjyAlPczF2B2jVoBjSGGJjtMfrmiywZN
 efNo8OAgXjvXitFH/DeU2g2jfJaO
X-Google-Smtp-Source: ABdhPJyUpduXZvjPbSt392fhdlm7IWZnpycmMNDVccUWZ8feo0Zso9iX8n4RsOtyq9Szb8s8OFKVCQ==
X-Received: by 2002:a05:6a00:134c:: with SMTP id
 k12mr22196500pfu.313.1591645279281; 
 Mon, 08 Jun 2020 12:41:19 -0700 (PDT)
Received: from localhost.localdomain ([172.58.222.239])
 by smtp.gmail.com with ESMTPSA id h35sm287934pje.29.2020.06.08.12.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 12:41:18 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: skip BAR resizing if the bios already did it
Date: Mon,  8 Jun 2020 15:41:09 -0400
Message-Id: <20200608194109.224589-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

No need to do it again.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 1df28b7bf22e..539010798116 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -909,6 +909,11 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
 	if (amdgpu_sriov_vf(adev))
 		return 0;
 
+	/* skip if the bios has already enabled large BAR */
+	if (adev->gmc.real_vram_size &&
+	    (pci_resource_len(adev->pdev, 0) >= adev->gmc.real_vram_size))
+		return 0;
+
 	/* Check if the root BUS has 64bit memory resources */
 	root = adev->pdev->bus;
 	while (root->parent)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
